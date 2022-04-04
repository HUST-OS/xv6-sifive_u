#include "include/types.h"
#include "include/riscv.h"
#include "include/defs.h"
#include "include/param.h"
#include "include/memlayout.h"
#include "include/spinlock.h"
#include "include/buf.h"

#define USE_RAMDISK
#define NRAMDISKPAGES (FSSIZE * BSIZE / PGSIZE)

struct spinlock ramdisklock;
void* ramdisk_page_pool[NRAMDISKPAGES];
extern char fs_img_start[];
extern char fs_img_end[];

//Find the ramdisk address corresponding to the blockno's block
static void*
lookup_ramdisk_addr(uint sectorno)
{
  int ramdisk_page_index = (sectorno * BSIZE) / PGSIZE;
  int ramdisk_page_offset = (sectorno * BSIZE) % PGSIZE;
  void* ramdisk_addr = ramdisk_page_pool[ramdisk_page_index] + ramdisk_page_offset;
  return ramdisk_addr;
}

// copy fs.img to ramdisk
void mkfs(){
    char* start = (char*)fs_img_start;
    char* end = (char*)fs_img_end;
    uint64 fsize = end - start;
    int i;
    // Copy data of one page size at a time
    for(i = 0; i < NRAMDISKPAGES && fsize != 0; ++i){
        char* src_addr = start;
        void* dst_addr = ramdisk_page_pool[i];
        uint64 w_size = PGSIZE;
        if(fsize < PGSIZE)
        {
            w_size = fsize;
        }
        memmove(dst_addr, src_addr, w_size);
        fsize -= w_size;
        start += w_size;
    }
}

void
ramdisk_init(void)
{
/*
  for (int i = 0; i < NRAMDISKPAGES; ++i){
    void* pa = kalloc();
    if (!pa){
      panic("ram disk init error!\n");
    }
    ramdisk_page_pool[i] = pa;
  }
*/
  initlock(&ramdisklock, "ramdisk lock");
  //mkfs();
}

void 
ramdisk_rw(struct buf *b, int write)
{
  acquire(&ramdisklock);
  /*
  uint sectorno = b->sectorno;
  if(b->dev != ROOTDEV)
  	panic("wrong device number");
  void *addr = lookup_ramdisk_addr(sectorno);
  if (write)
  {
    memmove(addr, b->data, BSIZE);
  }
  else
  {
    memmove(b->data, addr, BSIZE);
  }
  */
  uint sectorno = b->sectorno;
  if(b->dev != ROOTDEV)
  	panic("wrong device number");
  lookup_ramdisk_addr(sectorno);
  char *addr = fs_img_start+sectorno*BSIZE;
  if (write)
  {
    memmove((void*)addr, b->data, BSIZE);
  }
  else
  {
    memmove(b->data, (void*)addr, BSIZE);
  }
  release(&ramdisklock);
}

void
ramdisk_intr()
{
    acquire(&ramdisklock);
    
}
