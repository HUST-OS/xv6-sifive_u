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
int chao=0;
extern char _entry[];
extern int procfirst;
void
main(unsigned long hartid, unsigned long dtb_pa)
{
  inithartid(hartid);
  booted[hartid]=1;
  for(int i = 1; i < NCPU; i++) {
      if(hartid!=i&&booted[i]==0){
      	start_hart(i, (uint64)_entry, 0);
      }
  }

  if (cpuid() == 1) {
    consoleinit();
    printfinit();   // init a lock for printf 
    print_logo();
    printf("hart %d enter main()...\n", hartid);
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
    started=1;
  }
  else
  {
    // hart 1
    while (started == 0)
    ;
    __sync_synchronize();
    printf("hart %d enter main()...\n", hartid);

    kvminithart();
    trapinithart();
    plicinithart();  // ask PLIC for device interrupts
  }

 #ifdef DEBUG
  printf("hart %d scheduler...\n", hartid);
 #endif
  scheduler();
}
