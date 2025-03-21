#include "types.h"
#include "stat.h"
#include "user.h"
#include "param.h"

// Memory allocator by Kernighan and Ritchie,
// The C programming Language, 2nd ed.  Section 8.7.

typedef long Align;

union header {
  struct {
    union header *ptr;
    uint size;
  } s;
  Align x;
};

typedef union header Header;

static Header base;
static Header *freep;

// added new static variables for huge page heap
static Header huge_base;
static Header *huge_freep;
const int HUGE_PAGE_SIZE = 0x400000;

// vfree: free a block allocated by vmalloc
void vfree(void *ap, int use_huge_pages);

// Helper: morecore to allocate additional memory
static Header* morecore(uint nu, int use_huge_pages) {
  char *p;
  Header *hp;
  //uint sbrk_size = nu * sizeof(Header);

  if(use_huge_pages){
    if(nu < HUGE_PAGE_SIZE)
      nu = HUGE_PAGE_SIZE;
  }else{
    if(nu < 4096)
      nu = 4096;
  }

  //printf(1, "morecore: use_huge_pages = %d\n", use_huge_pages);

  setusehugepages(use_huge_pages);

  p = sbrk(nu * sizeof(Header));

  if(p == (char*)-1)
    return 0;

  hp = (Header*)p;
  hp->s.size = nu;

  vfree((void*)(hp + 1), use_huge_pages);

  if(use_huge_pages) {
    return huge_freep;
  }
  else {
    return freep;
  }
}

// RECENTLY ADDED
// to help with vmalloc
void*
normalmalloc(uint nbytes, int use_huge_pages)
{
  Header *p, *prevp;
  uint nunits;

  //printf(1, "normalmalloc: use_huge_pages=%d\n", use_huge_pages);

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits, use_huge_pages)) == 0)
        return 0;
  }
}

// to help with vmalloc
void*
hugemalloc(uint nbytes, int use_huge_pages)
{
  Header *p, *prevp;
  uint nunits;

  //printf(1, "in hugemalloc");

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = huge_freep) == 0){
    huge_base.s.ptr = huge_freep = prevp = &huge_base;
    huge_base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      huge_freep = prevp;
      return (void*)(p + 1);
    }
    if(p == huge_freep)
      if((p = morecore(nunits, use_huge_pages)) == 0)
        return 0;
  }
}

// vmalloc: allocate nbytes from either base or huge page heap
void* vmalloc(uint nbytes, int pagesize) {
  int use_huge_pages;

  if(pagesize == VMALLOC_SIZE_BASE) {
    use_huge_pages = 0;
  }
  else if (pagesize == VMALLOC_SIZE_HUGE) {
    use_huge_pages = 1;
  }
  else {
    printf(1, "Please pass VMALLOC_SIZE_BASE or VMALLOC_SIZE_HUGE as flag.\n");
    exit();
  }

  //printf(1, "vmalloc: use_huge_pages=%d\n", use_huge_pages);

  if(use_huge_pages) {
    return hugemalloc(nbytes, use_huge_pages);
  }
  else {
    return normalmalloc(nbytes, use_huge_pages);
  }
}

void
normalfree(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
}

void
hugefree(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = huge_freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  huge_freep = p;
}

// vfree: free a block allocated by vmalloc
void vfree(void *ap, int use_huge_pages) {
  if(use_huge_pages) {
    hugefree(ap);
  }
  else {
    normalfree(ap);
  }
}

// redefine malloc and free to call vmalloc and vfree (with base flag)
void* malloc(uint nbytes){
  int thp = getthp();

  if(nbytes >= 1048576 && thp != 0) { // only use huge pages if THP is active
    return vmalloc(nbytes, VMALLOC_SIZE_HUGE); // use the huge pages
  }
  else{
    return vmalloc(nbytes, VMALLOC_SIZE_BASE);
  }
}

void free(void * ap){
  vfree(ap, 0);
}
