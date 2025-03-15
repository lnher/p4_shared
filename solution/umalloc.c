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

void
free(void *ap)
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

static Header*
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
  if(p == (char*)-1)
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
  free((void*)(hp + 1));
  return freep;
}

void*
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

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
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}

/*
// START ADDED CODE
// this is unchanged from malloc currently
void* vmalloc(uint nbytes, uint flag)
{
  // basic check for flag, if not using correct sizes error
  if(flag != VMALLOC_SIZE_BASE || flag != VMALLOC_SIZE_HUGE) {
    printf(1, "Please pass VMALLOC_SIZE_BASE or VMALLOC_SIZE_HUGE as flag.\n");
    exit();
  } 
  
  //if not using huge pages just use malloc
  if(flag == VMALLOC_SIZE_BASE) {
    return malloc(nbytes);
  }

  // p is a pointer to the chunk of memory that is currently being checked
  // prevp is a pointer to the chunk of memory that was previous to p
  Header *p, *prevp;
  uint nunits; // this stores how many bytes you will need to allocate 

  // nunits = number of header sized chunks of memory you need
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;

  // set prevp to freep, then if freep was 0 then set prevp, freep and base.s.ptr
  // to 0 and base.s.size to 0
  // if there is no more space then 
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }

  // starting at freep go to it's pointer and see if there is enough space
  // to give it to the user, if there isn't keep looking

  // set p to prevp's pointer, loop forever, at the end of each loop set 
  // prevp to p and p to the next one
  // p holds the current chunk of memory and prevp holds the previous chunk
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    // if p's size is larger than nunits, i.e. there still free space in the 
    // process's allocated memory
    if(p->s.size >= nunits){
      // if p's size is exactly nunits then have prevp s.ptr point to p's s.ptr
      // as now the entire space is filled
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;

      // otherwise split p into 2 chunks 
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1); //return the address after the header
    }

    // if p equals freep, aka there is no more free memory allocated to the program
    if(p == freep)
      if((p = morecore(nunits)) == 0) // go get more memory
        return 0; // this only happends if morecore returns nothing
  }
}

// this is also unchanged
void
vfree(void *ap)
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
// END ADDED CODE
*/