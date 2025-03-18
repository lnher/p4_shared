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

  p = sbrk(nu * sizeof(Header));

  if(p == (char*)-1)
    return 0;

  hp = (Header*)p;
  hp->s.size = nu;

  vfree((void*)(hp + 1), use_huge_pages);
  return use_huge_pages ? huge_freep : freep;
}

// vmalloc: allocate nbytes from either base or huge page heap
void* vmalloc(uint nbytes, int use_huge_pages) {
    Header *p, *prevp;
    uint nunits;
    //Header *baseptr;
    //Header **freepptr;

    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;

    if (use_huge_pages) {
        if ((prevp = huge_freep) == 0) {
            huge_base.s.ptr = huge_freep = &huge_base;
            huge_base.s.size = 0;
        }
        //baseptr = &huge_base;
        //freepptr = &huge_freep;
    } else {
        if ((prevp = freep) == 0) {
            base.s.ptr = freep = &base;
            base.s.size = 0;
        }
        //baseptr = &base;
        //freepptr = &freep;
    }

    //prevp = *freepptr;
    
    for (p = prevp->s.ptr; ;prevp = p, p = p->s.ptr) {
        if (p->s.size >= nunits) {
            if (p->s.size == nunits) {
                prevp->s.ptr = p->s.ptr;
            } else {
                p->s.size -= nunits;
                p += p->s.size;
                p->s.size = nunits;
            }
            freep = prevp;
            return (void*)(p + 1);
        }
        if (p == freep) {
            p = morecore(nunits, use_huge_pages);
            if (p == 0) {
                return 0;
            }
            //prevp = *freepptr;
        } 
    }
}

// vfree: free a block allocated by vmalloc
void vfree(void *ap, int use_huge_pages) {
    Header *bp, *p;
    Header **freepptr;

    bp = ((Header*)ap) - 1;

    if (use_huge_pages) {
        freepptr = &huge_freep;
    } else {
        freepptr = &freep;
    }

    for (p = *freepptr; !(bp > p && bp < p->s.ptr); p = p->s.ptr) {
        if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) {
            break;
        }
    }

    if (bp + bp->s.size == p->s.ptr) {
        bp->s.size += p->s.ptr->s.size;
        bp->s.ptr = p->s.ptr->s.ptr;
    } else {
        bp->s.ptr = p->s.ptr;
    }

    if (p + p->s.size == bp) {
        p->s.size += bp->s.size;
        p->s.ptr = bp->s.ptr;
    } else {
        p->s.ptr = bp;
    }

    *freepptr = p;
}

// redefine malloc and free to call vmalloc and vfree (with base flag)
void* malloc(uint nbytes){
  int thp = getthp();


  if(nbytes >= 0x100000 && thp != 0) { // only use huge pages if THP is active
    return vmalloc(nbytes, 1); // use the huge pages
  }
  else{
    return vmalloc(nbytes, 0);
  }
}

void free(void * ap){
  vfree(ap, 0);
}
