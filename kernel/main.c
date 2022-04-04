// Copyright (c) 2006-2019 Frans Kaashoek, Robert Morris, Russ Cox,
//                         Massachusetts Institute of Technology

#include "include/types.h"
#include "include/param.h"
#include "include/memlayout.h"
#include "include/riscv.h"
#include "include/sbi.h"
#include "include/sbi2.h"
#include "include/console.h"
#include "include/printf.h"
#include "include/kalloc.h"
#include "include/timer.h"
#include "include/trap.h"
#include "include/proc.h"
#include "include/plic.h"
#include "include/vm.h"
#include "include/disk.h"
#include "include/buf.h"
#ifndef QEMU
#include "include/sdcard.h"
#include "include/fpioa.h"
#include "include/dmac.h"
#endif

static inline void inithartid(unsigned long hartid) {
  asm volatile("mv tp, %0" : : "r" (hartid));
}

volatile static int started = 0;
int booted[NCPU];
extern char _entry[];
void
main(unsigned long hartid, unsigned long dtb_pa)
{
  inithartid(hartid);
  booted[hartid]=1;
  if (started == 0) {
    started=1;
    consoleinit();
    printfinit();   // init a lock for printf 
    print_logo();
    #ifdef DEBUG
    printf("hart %d enter main()...\n", hartid);
    #endif
    kinit();         // physical page allocator
    kvminit();       // create kernel page table
    kvminithart();   // turn on paging
    timerinit();     // init a lock for timer
    trapinithart();  // install kernel trap vector, including interrupt handler
    procinit();
    plicinit();
    plicinithart();
    #ifndef QEMU
    fpioa_pin_init();
    dmac_init();
    #endif 
    //disk_init();
    binit();         // buffer cache
    fileinit();      // file table
    userinit();      // first user process
    __sync_synchronize();
   for(int i = 1; i < NCPU; i++) {
      if(hartid!=i&&booted[i]==0){
        printf("hart %d awake hart %d\n",hartid,i);
      	start_hart(i, (uint64)_entry, 0);
	
      }
    }

  }
  else
  {
    // hart 1

    while (started == 0)
      ;
    __sync_synchronize();
    #ifdef DEBUG
    printf("hart %d enter main()...\n", hartid);
    #endif

    kvminithart();
    trapinithart();
    plicinithart();  // ask PLIC for device interrupts
  }
  printf("hart %d scheduler...\n", hartid);
  scheduler();
}
