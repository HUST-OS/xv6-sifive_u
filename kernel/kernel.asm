
kernel/kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080200000 <_entry>:
    80200000:	00150293          	addi	t0,a0,1
    80200004:	02ba                	slli	t0,t0,0xe
    80200006:	0009b117          	auipc	sp,0x9b
    8020000a:	ffa10113          	addi	sp,sp,-6 # 8029b000 <boot_stack>
    8020000e:	9116                	add	sp,sp,t0
    80200010:	20f000ef          	jal	ra,80200a1e <main>

0000000080200014 <loop>:
    80200014:	a001                	j	80200014 <loop>

0000000080200016 <printint>:
    }
}

static void
printint(int xx, int base, int sign)
{
    80200016:	7179                	addi	sp,sp,-48
    80200018:	f406                	sd	ra,40(sp)
    8020001a:	f022                	sd	s0,32(sp)
    8020001c:	ec26                	sd	s1,24(sp)
    8020001e:	e84a                	sd	s2,16(sp)
    80200020:	1800                	addi	s0,sp,48
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
    80200022:	c219                	beqz	a2,80200028 <printint+0x12>
    80200024:	08054663          	bltz	a0,802000b0 <printint+0x9a>
    x = -xx;
  else
    x = xx;
    80200028:	2501                	sext.w	a0,a0
    8020002a:	4881                	li	a7,0
    8020002c:	fd040693          	addi	a3,s0,-48

  i = 0;
    80200030:	4701                	li	a4,0
  do {
    buf[i++] = digits[x % base];
    80200032:	2581                	sext.w	a1,a1
    80200034:	00009617          	auipc	a2,0x9
    80200038:	34c60613          	addi	a2,a2,844 # 80209380 <digits>
    8020003c:	883a                	mv	a6,a4
    8020003e:	2705                	addiw	a4,a4,1
    80200040:	02b577bb          	remuw	a5,a0,a1
    80200044:	1782                	slli	a5,a5,0x20
    80200046:	9381                	srli	a5,a5,0x20
    80200048:	97b2                	add	a5,a5,a2
    8020004a:	0007c783          	lbu	a5,0(a5)
    8020004e:	00f68023          	sb	a5,0(a3)
  } while((x /= base) != 0);
    80200052:	0005079b          	sext.w	a5,a0
    80200056:	02b5553b          	divuw	a0,a0,a1
    8020005a:	0685                	addi	a3,a3,1
    8020005c:	feb7f0e3          	bgeu	a5,a1,8020003c <printint+0x26>

  if(sign)
    80200060:	00088b63          	beqz	a7,80200076 <printint+0x60>
    buf[i++] = '-';
    80200064:	fe040793          	addi	a5,s0,-32
    80200068:	973e                	add	a4,a4,a5
    8020006a:	02d00793          	li	a5,45
    8020006e:	fef70823          	sb	a5,-16(a4)
    80200072:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
    80200076:	02e05763          	blez	a4,802000a4 <printint+0x8e>
    8020007a:	fd040793          	addi	a5,s0,-48
    8020007e:	00e784b3          	add	s1,a5,a4
    80200082:	fff78913          	addi	s2,a5,-1
    80200086:	993a                	add	s2,s2,a4
    80200088:	377d                	addiw	a4,a4,-1
    8020008a:	1702                	slli	a4,a4,0x20
    8020008c:	9301                	srli	a4,a4,0x20
    8020008e:	40e90933          	sub	s2,s2,a4
    consputc(buf[i]);
    80200092:	fff4c503          	lbu	a0,-1(s1)
    80200096:	00007097          	auipc	ra,0x7
    8020009a:	1ce080e7          	jalr	462(ra) # 80207264 <consputc>
  while(--i >= 0)
    8020009e:	14fd                	addi	s1,s1,-1
    802000a0:	ff2499e3          	bne	s1,s2,80200092 <printint+0x7c>
}
    802000a4:	70a2                	ld	ra,40(sp)
    802000a6:	7402                	ld	s0,32(sp)
    802000a8:	64e2                	ld	s1,24(sp)
    802000aa:	6942                	ld	s2,16(sp)
    802000ac:	6145                	addi	sp,sp,48
    802000ae:	8082                	ret
    x = -xx;
    802000b0:	40a0053b          	negw	a0,a0
  if(sign && (sign = xx < 0))
    802000b4:	4885                	li	a7,1
    x = -xx;
    802000b6:	bf9d                	j	8020002c <printint+0x16>

00000000802000b8 <printstring>:
void printstring(const char* s) {
    802000b8:	1101                	addi	sp,sp,-32
    802000ba:	ec06                	sd	ra,24(sp)
    802000bc:	e822                	sd	s0,16(sp)
    802000be:	e426                	sd	s1,8(sp)
    802000c0:	1000                	addi	s0,sp,32
    802000c2:	84aa                	mv	s1,a0
    while (*s)
    802000c4:	00054503          	lbu	a0,0(a0)
    802000c8:	c909                	beqz	a0,802000da <printstring+0x22>
        consputc(*s++);
    802000ca:	0485                	addi	s1,s1,1
    802000cc:	00007097          	auipc	ra,0x7
    802000d0:	198080e7          	jalr	408(ra) # 80207264 <consputc>
    while (*s)
    802000d4:	0004c503          	lbu	a0,0(s1)
    802000d8:	f96d                	bnez	a0,802000ca <printstring+0x12>
}
    802000da:	60e2                	ld	ra,24(sp)
    802000dc:	6442                	ld	s0,16(sp)
    802000de:	64a2                	ld	s1,8(sp)
    802000e0:	6105                	addi	sp,sp,32
    802000e2:	8082                	ret

00000000802000e4 <backtrace>:
  for(;;)
    ;
}

void backtrace()
{
    802000e4:	7179                	addi	sp,sp,-48
    802000e6:	f406                	sd	ra,40(sp)
    802000e8:	f022                	sd	s0,32(sp)
    802000ea:	ec26                	sd	s1,24(sp)
    802000ec:	e84a                	sd	s2,16(sp)
    802000ee:	e44e                	sd	s3,8(sp)
    802000f0:	1800                	addi	s0,sp,48

static inline uint64
r_fp()
{
  uint64 x;
  asm volatile("mv %0, s0" : "=r" (x) );
    802000f2:	8922                	mv	s2,s0
  uint64 *fp = (uint64 *)r_fp();
    802000f4:	84ca                	mv	s1,s2
  uint64 *bottom = (uint64 *)PGROUNDUP((uint64)fp);
    802000f6:	6785                	lui	a5,0x1
    802000f8:	17fd                	addi	a5,a5,-1
    802000fa:	993e                	add	s2,s2,a5
    802000fc:	77fd                	lui	a5,0xfffff
    802000fe:	00f97933          	and	s2,s2,a5
  printf("backtrace:\n");
    80200102:	00009517          	auipc	a0,0x9
    80200106:	efe50513          	addi	a0,a0,-258 # 80209000 <etext>
    8020010a:	00000097          	auipc	ra,0x0
    8020010e:	084080e7          	jalr	132(ra) # 8020018e <printf>
  while (fp < bottom) {
    80200112:	0324f263          	bgeu	s1,s2,80200136 <backtrace+0x52>
    uint64 ra = *(fp - 1);
    printf("%p\n", ra - 4);
    80200116:	00009997          	auipc	s3,0x9
    8020011a:	53298993          	addi	s3,s3,1330 # 80209648 <digits+0x2c8>
    8020011e:	ff84b583          	ld	a1,-8(s1)
    80200122:	15f1                	addi	a1,a1,-4
    80200124:	854e                	mv	a0,s3
    80200126:	00000097          	auipc	ra,0x0
    8020012a:	068080e7          	jalr	104(ra) # 8020018e <printf>
    fp = (uint64 *)*(fp - 2);
    8020012e:	ff04b483          	ld	s1,-16(s1)
  while (fp < bottom) {
    80200132:	ff24e6e3          	bltu	s1,s2,8020011e <backtrace+0x3a>
  }
}
    80200136:	70a2                	ld	ra,40(sp)
    80200138:	7402                	ld	s0,32(sp)
    8020013a:	64e2                	ld	s1,24(sp)
    8020013c:	6942                	ld	s2,16(sp)
    8020013e:	69a2                	ld	s3,8(sp)
    80200140:	6145                	addi	sp,sp,48
    80200142:	8082                	ret

0000000080200144 <panic>:
{
    80200144:	1101                	addi	sp,sp,-32
    80200146:	ec06                	sd	ra,24(sp)
    80200148:	e822                	sd	s0,16(sp)
    8020014a:	e426                	sd	s1,8(sp)
    8020014c:	1000                	addi	s0,sp,32
    8020014e:	84aa                	mv	s1,a0
  printf("panic: ");
    80200150:	00009517          	auipc	a0,0x9
    80200154:	ec050513          	addi	a0,a0,-320 # 80209010 <etext+0x10>
    80200158:	00000097          	auipc	ra,0x0
    8020015c:	036080e7          	jalr	54(ra) # 8020018e <printf>
  printf(s);
    80200160:	8526                	mv	a0,s1
    80200162:	00000097          	auipc	ra,0x0
    80200166:	02c080e7          	jalr	44(ra) # 8020018e <printf>
  printf("\n");
    8020016a:	00009517          	auipc	a0,0x9
    8020016e:	f6e50513          	addi	a0,a0,-146 # 802090d8 <etext+0xd8>
    80200172:	00000097          	auipc	ra,0x0
    80200176:	01c080e7          	jalr	28(ra) # 8020018e <printf>
  backtrace();
    8020017a:	00000097          	auipc	ra,0x0
    8020017e:	f6a080e7          	jalr	-150(ra) # 802000e4 <backtrace>
  panicked = 1; // freeze uart output from other CPUs
    80200182:	4785                	li	a5,1
    80200184:	000ab717          	auipc	a4,0xab
    80200188:	e8f72e23          	sw	a5,-356(a4) # 802ab020 <panicked>
  for(;;)
    8020018c:	a001                	j	8020018c <panic+0x48>

000000008020018e <printf>:
{
    8020018e:	7131                	addi	sp,sp,-192
    80200190:	fc86                	sd	ra,120(sp)
    80200192:	f8a2                	sd	s0,112(sp)
    80200194:	f4a6                	sd	s1,104(sp)
    80200196:	f0ca                	sd	s2,96(sp)
    80200198:	ecce                	sd	s3,88(sp)
    8020019a:	e8d2                	sd	s4,80(sp)
    8020019c:	e4d6                	sd	s5,72(sp)
    8020019e:	e0da                	sd	s6,64(sp)
    802001a0:	fc5e                	sd	s7,56(sp)
    802001a2:	f862                	sd	s8,48(sp)
    802001a4:	f466                	sd	s9,40(sp)
    802001a6:	f06a                	sd	s10,32(sp)
    802001a8:	ec6e                	sd	s11,24(sp)
    802001aa:	0100                	addi	s0,sp,128
    802001ac:	8a2a                	mv	s4,a0
    802001ae:	e40c                	sd	a1,8(s0)
    802001b0:	e810                	sd	a2,16(s0)
    802001b2:	ec14                	sd	a3,24(s0)
    802001b4:	f018                	sd	a4,32(s0)
    802001b6:	f41c                	sd	a5,40(s0)
    802001b8:	03043823          	sd	a6,48(s0)
    802001bc:	03143c23          	sd	a7,56(s0)
  locking = pr.locking;
    802001c0:	000abd97          	auipc	s11,0xab
    802001c4:	e58dad83          	lw	s11,-424(s11) # 802ab018 <pr+0x18>
  if(locking)
    802001c8:	020d9b63          	bnez	s11,802001fe <printf+0x70>
  if (fmt == 0)
    802001cc:	040a0263          	beqz	s4,80200210 <printf+0x82>
  va_start(ap, fmt);
    802001d0:	00840793          	addi	a5,s0,8
    802001d4:	f8f43423          	sd	a5,-120(s0)
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    802001d8:	000a4503          	lbu	a0,0(s4)
    802001dc:	16050263          	beqz	a0,80200340 <printf+0x1b2>
    802001e0:	4481                	li	s1,0
    if(c != '%'){
    802001e2:	02500a93          	li	s5,37
    switch(c){
    802001e6:	07000b13          	li	s6,112
  consputc('x');
    802001ea:	4d41                	li	s10,16
    consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
    802001ec:	00009b97          	auipc	s7,0x9
    802001f0:	194b8b93          	addi	s7,s7,404 # 80209380 <digits>
    switch(c){
    802001f4:	07300c93          	li	s9,115
    802001f8:	06400c13          	li	s8,100
    802001fc:	a82d                	j	80200236 <printf+0xa8>
    acquire(&pr.lock);
    802001fe:	000ab517          	auipc	a0,0xab
    80200202:	e0250513          	addi	a0,a0,-510 # 802ab000 <pr>
    80200206:	00000097          	auipc	ra,0x0
    8020020a:	4ee080e7          	jalr	1262(ra) # 802006f4 <acquire>
    8020020e:	bf7d                	j	802001cc <printf+0x3e>
    panic("null fmt");
    80200210:	00009517          	auipc	a0,0x9
    80200214:	e1050513          	addi	a0,a0,-496 # 80209020 <etext+0x20>
    80200218:	00000097          	auipc	ra,0x0
    8020021c:	f2c080e7          	jalr	-212(ra) # 80200144 <panic>
      consputc(c);
    80200220:	00007097          	auipc	ra,0x7
    80200224:	044080e7          	jalr	68(ra) # 80207264 <consputc>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    80200228:	2485                	addiw	s1,s1,1
    8020022a:	009a07b3          	add	a5,s4,s1
    8020022e:	0007c503          	lbu	a0,0(a5) # fffffffffffff000 <kernel_end+0xffffffff7fd41000>
    80200232:	10050763          	beqz	a0,80200340 <printf+0x1b2>
    if(c != '%'){
    80200236:	ff5515e3          	bne	a0,s5,80200220 <printf+0x92>
    c = fmt[++i] & 0xff;
    8020023a:	2485                	addiw	s1,s1,1
    8020023c:	009a07b3          	add	a5,s4,s1
    80200240:	0007c783          	lbu	a5,0(a5)
    80200244:	0007891b          	sext.w	s2,a5
    if(c == 0)
    80200248:	cfe5                	beqz	a5,80200340 <printf+0x1b2>
    switch(c){
    8020024a:	05678a63          	beq	a5,s6,8020029e <printf+0x110>
    8020024e:	02fb7663          	bgeu	s6,a5,8020027a <printf+0xec>
    80200252:	09978963          	beq	a5,s9,802002e4 <printf+0x156>
    80200256:	07800713          	li	a4,120
    8020025a:	0ce79863          	bne	a5,a4,8020032a <printf+0x19c>
      printint(va_arg(ap, int), 16, 1);
    8020025e:	f8843783          	ld	a5,-120(s0)
    80200262:	00878713          	addi	a4,a5,8
    80200266:	f8e43423          	sd	a4,-120(s0)
    8020026a:	4605                	li	a2,1
    8020026c:	85ea                	mv	a1,s10
    8020026e:	4388                	lw	a0,0(a5)
    80200270:	00000097          	auipc	ra,0x0
    80200274:	da6080e7          	jalr	-602(ra) # 80200016 <printint>
      break;
    80200278:	bf45                	j	80200228 <printf+0x9a>
    switch(c){
    8020027a:	0b578263          	beq	a5,s5,8020031e <printf+0x190>
    8020027e:	0b879663          	bne	a5,s8,8020032a <printf+0x19c>
      printint(va_arg(ap, int), 10, 1);
    80200282:	f8843783          	ld	a5,-120(s0)
    80200286:	00878713          	addi	a4,a5,8
    8020028a:	f8e43423          	sd	a4,-120(s0)
    8020028e:	4605                	li	a2,1
    80200290:	45a9                	li	a1,10
    80200292:	4388                	lw	a0,0(a5)
    80200294:	00000097          	auipc	ra,0x0
    80200298:	d82080e7          	jalr	-638(ra) # 80200016 <printint>
      break;
    8020029c:	b771                	j	80200228 <printf+0x9a>
      printptr(va_arg(ap, uint64));
    8020029e:	f8843783          	ld	a5,-120(s0)
    802002a2:	00878713          	addi	a4,a5,8
    802002a6:	f8e43423          	sd	a4,-120(s0)
    802002aa:	0007b983          	ld	s3,0(a5)
  consputc('0');
    802002ae:	03000513          	li	a0,48
    802002b2:	00007097          	auipc	ra,0x7
    802002b6:	fb2080e7          	jalr	-78(ra) # 80207264 <consputc>
  consputc('x');
    802002ba:	07800513          	li	a0,120
    802002be:	00007097          	auipc	ra,0x7
    802002c2:	fa6080e7          	jalr	-90(ra) # 80207264 <consputc>
    802002c6:	896a                	mv	s2,s10
    consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
    802002c8:	03c9d793          	srli	a5,s3,0x3c
    802002cc:	97de                	add	a5,a5,s7
    802002ce:	0007c503          	lbu	a0,0(a5)
    802002d2:	00007097          	auipc	ra,0x7
    802002d6:	f92080e7          	jalr	-110(ra) # 80207264 <consputc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    802002da:	0992                	slli	s3,s3,0x4
    802002dc:	397d                	addiw	s2,s2,-1
    802002de:	fe0915e3          	bnez	s2,802002c8 <printf+0x13a>
    802002e2:	b799                	j	80200228 <printf+0x9a>
      if((s = va_arg(ap, char*)) == 0)
    802002e4:	f8843783          	ld	a5,-120(s0)
    802002e8:	00878713          	addi	a4,a5,8
    802002ec:	f8e43423          	sd	a4,-120(s0)
    802002f0:	0007b903          	ld	s2,0(a5)
    802002f4:	00090e63          	beqz	s2,80200310 <printf+0x182>
      for(; *s; s++)
    802002f8:	00094503          	lbu	a0,0(s2)
    802002fc:	d515                	beqz	a0,80200228 <printf+0x9a>
        consputc(*s);
    802002fe:	00007097          	auipc	ra,0x7
    80200302:	f66080e7          	jalr	-154(ra) # 80207264 <consputc>
      for(; *s; s++)
    80200306:	0905                	addi	s2,s2,1
    80200308:	00094503          	lbu	a0,0(s2)
    8020030c:	f96d                	bnez	a0,802002fe <printf+0x170>
    8020030e:	bf29                	j	80200228 <printf+0x9a>
        s = "(null)";
    80200310:	00009917          	auipc	s2,0x9
    80200314:	d0890913          	addi	s2,s2,-760 # 80209018 <etext+0x18>
      for(; *s; s++)
    80200318:	02800513          	li	a0,40
    8020031c:	b7cd                	j	802002fe <printf+0x170>
      consputc('%');
    8020031e:	8556                	mv	a0,s5
    80200320:	00007097          	auipc	ra,0x7
    80200324:	f44080e7          	jalr	-188(ra) # 80207264 <consputc>
      break;
    80200328:	b701                	j	80200228 <printf+0x9a>
      consputc('%');
    8020032a:	8556                	mv	a0,s5
    8020032c:	00007097          	auipc	ra,0x7
    80200330:	f38080e7          	jalr	-200(ra) # 80207264 <consputc>
      consputc(c);
    80200334:	854a                	mv	a0,s2
    80200336:	00007097          	auipc	ra,0x7
    8020033a:	f2e080e7          	jalr	-210(ra) # 80207264 <consputc>
      break;
    8020033e:	b5ed                	j	80200228 <printf+0x9a>
  if(locking)
    80200340:	020d9163          	bnez	s11,80200362 <printf+0x1d4>
}
    80200344:	70e6                	ld	ra,120(sp)
    80200346:	7446                	ld	s0,112(sp)
    80200348:	74a6                	ld	s1,104(sp)
    8020034a:	7906                	ld	s2,96(sp)
    8020034c:	69e6                	ld	s3,88(sp)
    8020034e:	6a46                	ld	s4,80(sp)
    80200350:	6aa6                	ld	s5,72(sp)
    80200352:	6b06                	ld	s6,64(sp)
    80200354:	7be2                	ld	s7,56(sp)
    80200356:	7c42                	ld	s8,48(sp)
    80200358:	7ca2                	ld	s9,40(sp)
    8020035a:	7d02                	ld	s10,32(sp)
    8020035c:	6de2                	ld	s11,24(sp)
    8020035e:	6129                	addi	sp,sp,192
    80200360:	8082                	ret
    release(&pr.lock);
    80200362:	000ab517          	auipc	a0,0xab
    80200366:	c9e50513          	addi	a0,a0,-866 # 802ab000 <pr>
    8020036a:	00000097          	auipc	ra,0x0
    8020036e:	3de080e7          	jalr	990(ra) # 80200748 <release>
}
    80200372:	bfc9                	j	80200344 <printf+0x1b6>

0000000080200374 <printfinit>:

void
printfinit(void)
{
    80200374:	1101                	addi	sp,sp,-32
    80200376:	ec06                	sd	ra,24(sp)
    80200378:	e822                	sd	s0,16(sp)
    8020037a:	e426                	sd	s1,8(sp)
    8020037c:	1000                	addi	s0,sp,32
  initlock(&pr.lock, "pr");
    8020037e:	000ab497          	auipc	s1,0xab
    80200382:	c8248493          	addi	s1,s1,-894 # 802ab000 <pr>
    80200386:	00009597          	auipc	a1,0x9
    8020038a:	caa58593          	addi	a1,a1,-854 # 80209030 <etext+0x30>
    8020038e:	8526                	mv	a0,s1
    80200390:	00000097          	auipc	ra,0x0
    80200394:	320080e7          	jalr	800(ra) # 802006b0 <initlock>
  pr.locking = 1;   // changed, used to be 1
    80200398:	4785                	li	a5,1
    8020039a:	cc9c                	sw	a5,24(s1)
}
    8020039c:	60e2                	ld	ra,24(sp)
    8020039e:	6442                	ld	s0,16(sp)
    802003a0:	64a2                	ld	s1,8(sp)
    802003a2:	6105                	addi	sp,sp,32
    802003a4:	8082                	ret

00000000802003a6 <print_logo>:

#ifdef QEMU
void print_logo() {
    802003a6:	1141                	addi	sp,sp,-16
    802003a8:	e406                	sd	ra,8(sp)
    802003aa:	e022                	sd	s0,0(sp)
    802003ac:	0800                	addi	s0,sp,16
    printf("  (`-.            (`-.                            .-')       ('-.    _   .-')\n");
    802003ae:	00009517          	auipc	a0,0x9
    802003b2:	c8a50513          	addi	a0,a0,-886 # 80209038 <etext+0x38>
    802003b6:	00000097          	auipc	ra,0x0
    802003ba:	dd8080e7          	jalr	-552(ra) # 8020018e <printf>
    printf(" ( OO ).        _(OO  )_                        .(  OO)    _(  OO)  ( '.( OO )_ \n");
    802003be:	00009517          	auipc	a0,0x9
    802003c2:	cca50513          	addi	a0,a0,-822 # 80209088 <etext+0x88>
    802003c6:	00000097          	auipc	ra,0x0
    802003ca:	dc8080e7          	jalr	-568(ra) # 8020018e <printf>
    printf("(_/.  \\_)-. ,--(_/   ,. \\  ,--.                (_)---\\_)  (,------.  ,--.   ,--.) ,--. ,--.  \n");
    802003ce:	00009517          	auipc	a0,0x9
    802003d2:	d1250513          	addi	a0,a0,-750 # 802090e0 <etext+0xe0>
    802003d6:	00000097          	auipc	ra,0x0
    802003da:	db8080e7          	jalr	-584(ra) # 8020018e <printf>
    printf(" \\  `.'  /  \\   \\   /(__/ /  .'       .-')     '  .-.  '   |  .---'  |   `.'   |  |  | |  |   \n");
    802003de:	00009517          	auipc	a0,0x9
    802003e2:	d6250513          	addi	a0,a0,-670 # 80209140 <etext+0x140>
    802003e6:	00000097          	auipc	ra,0x0
    802003ea:	da8080e7          	jalr	-600(ra) # 8020018e <printf>
    printf("  \\     /\\   \\   \\ /   / .  / -.    _(  OO)   ,|  | |  |   |  |      |         |  |  | | .-')\n");
    802003ee:	00009517          	auipc	a0,0x9
    802003f2:	db250513          	addi	a0,a0,-590 # 802091a0 <etext+0x1a0>
    802003f6:	00000097          	auipc	ra,0x0
    802003fa:	d98080e7          	jalr	-616(ra) # 8020018e <printf>
    printf("   \\   \\ |    \\   '   /, | .-.  '  (,------. (_|  | |  |  (|  '--.   |  |'.'|  |  |  |_|( OO )\n");
    802003fe:	00009517          	auipc	a0,0x9
    80200402:	e0250513          	addi	a0,a0,-510 # 80209200 <etext+0x200>
    80200406:	00000097          	auipc	ra,0x0
    8020040a:	d88080e7          	jalr	-632(ra) # 8020018e <printf>
    printf("  .'    \\_)    \\     /__)' \\  |  |  '------'   |  | |  |   |  .--'   |  |   |  |  |  | | `-' /\n");
    8020040e:	00009517          	auipc	a0,0x9
    80200412:	e5250513          	addi	a0,a0,-430 # 80209260 <etext+0x260>
    80200416:	00000097          	auipc	ra,0x0
    8020041a:	d78080e7          	jalr	-648(ra) # 8020018e <printf>
    printf(" /  .'.  \\      \\   /    \\  `'  /              '  '-'  '-. |  `---.  |  |   |  | ('  '-'(_.-'\n");
    8020041e:	00009517          	auipc	a0,0x9
    80200422:	ea250513          	addi	a0,a0,-350 # 802092c0 <etext+0x2c0>
    80200426:	00000097          	auipc	ra,0x0
    8020042a:	d68080e7          	jalr	-664(ra) # 8020018e <printf>
    printf("'--'   '--'      `-'      `----'                `-----'--' `------'  `--'   `--'   `-----'\n");
    8020042e:	00009517          	auipc	a0,0x9
    80200432:	ef250513          	addi	a0,a0,-270 # 80209320 <etext+0x320>
    80200436:	00000097          	auipc	ra,0x0
    8020043a:	d58080e7          	jalr	-680(ra) # 8020018e <printf>
}
    8020043e:	60a2                	ld	ra,8(sp)
    80200440:	6402                	ld	s0,0(sp)
    80200442:	0141                	addi	sp,sp,16
    80200444:	8082                	ret

0000000080200446 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(void *pa)
{
    80200446:	1101                	addi	sp,sp,-32
    80200448:	ec06                	sd	ra,24(sp)
    8020044a:	e822                	sd	s0,16(sp)
    8020044c:	e426                	sd	s1,8(sp)
    8020044e:	e04a                	sd	s2,0(sp)
    80200450:	1000                	addi	s0,sp,32
  struct run *r;
  
  if(((uint64)pa % PGSIZE) != 0 || (char*)pa < kernel_end || (uint64)pa >= PHYSTOP)
    80200452:	03451793          	slli	a5,a0,0x34
    80200456:	e3a5                	bnez	a5,802004b6 <kfree+0x70>
    80200458:	84aa                	mv	s1,a0
    8020045a:	000be797          	auipc	a5,0xbe
    8020045e:	ba678793          	addi	a5,a5,-1114 # 802be000 <kernel_end>
    80200462:	04f56a63          	bltu	a0,a5,802004b6 <kfree+0x70>
    80200466:	47c5                	li	a5,17
    80200468:	07ee                	slli	a5,a5,0x1b
    8020046a:	04f57663          	bgeu	a0,a5,802004b6 <kfree+0x70>
    panic("kfree");

  // Fill with junk to catch dangling refs.
  memset(pa, 1, PGSIZE);
    8020046e:	6605                	lui	a2,0x1
    80200470:	4585                	li	a1,1
    80200472:	00000097          	auipc	ra,0x0
    80200476:	31e080e7          	jalr	798(ra) # 80200790 <memset>

  r = (struct run*)pa;

  acquire(&kmem.lock);
    8020047a:	000ab917          	auipc	s2,0xab
    8020047e:	bae90913          	addi	s2,s2,-1106 # 802ab028 <kmem>
    80200482:	854a                	mv	a0,s2
    80200484:	00000097          	auipc	ra,0x0
    80200488:	270080e7          	jalr	624(ra) # 802006f4 <acquire>
  r->next = kmem.freelist;
    8020048c:	01893783          	ld	a5,24(s2)
    80200490:	e09c                	sd	a5,0(s1)
  kmem.freelist = r;
    80200492:	00993c23          	sd	s1,24(s2)
  kmem.npage++;
    80200496:	02093783          	ld	a5,32(s2)
    8020049a:	0785                	addi	a5,a5,1
    8020049c:	02f93023          	sd	a5,32(s2)
  release(&kmem.lock);
    802004a0:	854a                	mv	a0,s2
    802004a2:	00000097          	auipc	ra,0x0
    802004a6:	2a6080e7          	jalr	678(ra) # 80200748 <release>
}
    802004aa:	60e2                	ld	ra,24(sp)
    802004ac:	6442                	ld	s0,16(sp)
    802004ae:	64a2                	ld	s1,8(sp)
    802004b0:	6902                	ld	s2,0(sp)
    802004b2:	6105                	addi	sp,sp,32
    802004b4:	8082                	ret
    panic("kfree");
    802004b6:	00009517          	auipc	a0,0x9
    802004ba:	ee250513          	addi	a0,a0,-286 # 80209398 <digits+0x18>
    802004be:	00000097          	auipc	ra,0x0
    802004c2:	c86080e7          	jalr	-890(ra) # 80200144 <panic>

00000000802004c6 <freerange>:
{
    802004c6:	7179                	addi	sp,sp,-48
    802004c8:	f406                	sd	ra,40(sp)
    802004ca:	f022                	sd	s0,32(sp)
    802004cc:	ec26                	sd	s1,24(sp)
    802004ce:	e84a                	sd	s2,16(sp)
    802004d0:	e44e                	sd	s3,8(sp)
    802004d2:	e052                	sd	s4,0(sp)
    802004d4:	1800                	addi	s0,sp,48
  p = (char*)PGROUNDUP((uint64)pa_start);
    802004d6:	6785                	lui	a5,0x1
    802004d8:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x801ff001>
    802004dc:	94aa                	add	s1,s1,a0
    802004de:	757d                	lui	a0,0xfffff
    802004e0:	8ce9                	and	s1,s1,a0
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    802004e2:	94be                	add	s1,s1,a5
    802004e4:	0095ee63          	bltu	a1,s1,80200500 <freerange+0x3a>
    802004e8:	892e                	mv	s2,a1
    kfree(p);
    802004ea:	7a7d                	lui	s4,0xfffff
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    802004ec:	6985                	lui	s3,0x1
    kfree(p);
    802004ee:	01448533          	add	a0,s1,s4
    802004f2:	00000097          	auipc	ra,0x0
    802004f6:	f54080e7          	jalr	-172(ra) # 80200446 <kfree>
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    802004fa:	94ce                	add	s1,s1,s3
    802004fc:	fe9979e3          	bgeu	s2,s1,802004ee <freerange+0x28>
}
    80200500:	70a2                	ld	ra,40(sp)
    80200502:	7402                	ld	s0,32(sp)
    80200504:	64e2                	ld	s1,24(sp)
    80200506:	6942                	ld	s2,16(sp)
    80200508:	69a2                	ld	s3,8(sp)
    8020050a:	6a02                	ld	s4,0(sp)
    8020050c:	6145                	addi	sp,sp,48
    8020050e:	8082                	ret

0000000080200510 <kinit>:
{
    80200510:	1101                	addi	sp,sp,-32
    80200512:	ec06                	sd	ra,24(sp)
    80200514:	e822                	sd	s0,16(sp)
    80200516:	e426                	sd	s1,8(sp)
    80200518:	1000                	addi	s0,sp,32
  initlock(&kmem.lock, "kmem");
    8020051a:	000ab497          	auipc	s1,0xab
    8020051e:	b0e48493          	addi	s1,s1,-1266 # 802ab028 <kmem>
    80200522:	00009597          	auipc	a1,0x9
    80200526:	e7e58593          	addi	a1,a1,-386 # 802093a0 <digits+0x20>
    8020052a:	8526                	mv	a0,s1
    8020052c:	00000097          	auipc	ra,0x0
    80200530:	184080e7          	jalr	388(ra) # 802006b0 <initlock>
  kmem.freelist = 0;
    80200534:	0004bc23          	sd	zero,24(s1)
  kmem.npage = 0;
    80200538:	0204b023          	sd	zero,32(s1)
  freerange(kernel_end, (void*)PHYSTOP);
    8020053c:	44c5                	li	s1,17
    8020053e:	01b49593          	slli	a1,s1,0x1b
    80200542:	000be517          	auipc	a0,0xbe
    80200546:	abe50513          	addi	a0,a0,-1346 # 802be000 <kernel_end>
    8020054a:	00000097          	auipc	ra,0x0
    8020054e:	f7c080e7          	jalr	-132(ra) # 802004c6 <freerange>
  printf("kernel_end: %p, phystop: %p\n", kernel_end, (void*)PHYSTOP);
    80200552:	01b49613          	slli	a2,s1,0x1b
    80200556:	000be597          	auipc	a1,0xbe
    8020055a:	aaa58593          	addi	a1,a1,-1366 # 802be000 <kernel_end>
    8020055e:	00009517          	auipc	a0,0x9
    80200562:	e4a50513          	addi	a0,a0,-438 # 802093a8 <digits+0x28>
    80200566:	00000097          	auipc	ra,0x0
    8020056a:	c28080e7          	jalr	-984(ra) # 8020018e <printf>
  printf("kinit\n");
    8020056e:	00009517          	auipc	a0,0x9
    80200572:	e5a50513          	addi	a0,a0,-422 # 802093c8 <digits+0x48>
    80200576:	00000097          	auipc	ra,0x0
    8020057a:	c18080e7          	jalr	-1000(ra) # 8020018e <printf>
}
    8020057e:	60e2                	ld	ra,24(sp)
    80200580:	6442                	ld	s0,16(sp)
    80200582:	64a2                	ld	s1,8(sp)
    80200584:	6105                	addi	sp,sp,32
    80200586:	8082                	ret

0000000080200588 <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
void *
kalloc(void)
{
    80200588:	1101                	addi	sp,sp,-32
    8020058a:	ec06                	sd	ra,24(sp)
    8020058c:	e822                	sd	s0,16(sp)
    8020058e:	e426                	sd	s1,8(sp)
    80200590:	1000                	addi	s0,sp,32
  struct run *r;

  acquire(&kmem.lock);
    80200592:	000ab497          	auipc	s1,0xab
    80200596:	a9648493          	addi	s1,s1,-1386 # 802ab028 <kmem>
    8020059a:	8526                	mv	a0,s1
    8020059c:	00000097          	auipc	ra,0x0
    802005a0:	158080e7          	jalr	344(ra) # 802006f4 <acquire>
  r = kmem.freelist;
    802005a4:	6c84                	ld	s1,24(s1)
  if(r) {
    802005a6:	c89d                	beqz	s1,802005dc <kalloc+0x54>
    kmem.freelist = r->next;
    802005a8:	609c                	ld	a5,0(s1)
    802005aa:	000ab517          	auipc	a0,0xab
    802005ae:	a7e50513          	addi	a0,a0,-1410 # 802ab028 <kmem>
    802005b2:	ed1c                	sd	a5,24(a0)
    kmem.npage--;
    802005b4:	711c                	ld	a5,32(a0)
    802005b6:	17fd                	addi	a5,a5,-1
    802005b8:	f11c                	sd	a5,32(a0)
  }
  release(&kmem.lock);
    802005ba:	00000097          	auipc	ra,0x0
    802005be:	18e080e7          	jalr	398(ra) # 80200748 <release>

  if(r)
    memset((char*)r, 5, PGSIZE); // fill with junk
    802005c2:	6605                	lui	a2,0x1
    802005c4:	4595                	li	a1,5
    802005c6:	8526                	mv	a0,s1
    802005c8:	00000097          	auipc	ra,0x0
    802005cc:	1c8080e7          	jalr	456(ra) # 80200790 <memset>
  return (void*)r;
}
    802005d0:	8526                	mv	a0,s1
    802005d2:	60e2                	ld	ra,24(sp)
    802005d4:	6442                	ld	s0,16(sp)
    802005d6:	64a2                	ld	s1,8(sp)
    802005d8:	6105                	addi	sp,sp,32
    802005da:	8082                	ret
  release(&kmem.lock);
    802005dc:	000ab517          	auipc	a0,0xab
    802005e0:	a4c50513          	addi	a0,a0,-1460 # 802ab028 <kmem>
    802005e4:	00000097          	auipc	ra,0x0
    802005e8:	164080e7          	jalr	356(ra) # 80200748 <release>
  if(r)
    802005ec:	b7d5                	j	802005d0 <kalloc+0x48>

00000000802005ee <freemem_amount>:

uint64
freemem_amount(void)
{
    802005ee:	1141                	addi	sp,sp,-16
    802005f0:	e422                	sd	s0,8(sp)
    802005f2:	0800                	addi	s0,sp,16
  return kmem.npage << PGSHIFT;
}
    802005f4:	000ab517          	auipc	a0,0xab
    802005f8:	a5453503          	ld	a0,-1452(a0) # 802ab048 <kmem+0x20>
    802005fc:	0532                	slli	a0,a0,0xc
    802005fe:	6422                	ld	s0,8(sp)
    80200600:	0141                	addi	sp,sp,16
    80200602:	8082                	ret

0000000080200604 <push_off>:
// it takes two pop_off()s to undo two push_off()s.  Also, if interrupts
// are initially off, then push_off, pop_off leaves them off.

void
push_off(void)
{
    80200604:	1101                	addi	sp,sp,-32
    80200606:	ec06                	sd	ra,24(sp)
    80200608:	e822                	sd	s0,16(sp)
    8020060a:	e426                	sd	s1,8(sp)
    8020060c:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    8020060e:	100024f3          	csrr	s1,sstatus
    80200612:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    80200616:	9bf5                	andi	a5,a5,-3
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80200618:	10079073          	csrw	sstatus,a5
  int old = intr_get();

  intr_off();
  //printf("\e[32mpush_off()\e[0m: cpuid(): %d\n", cpuid());
  if(mycpu()->noff == 0)
    8020061c:	00001097          	auipc	ra,0x1
    80200620:	4e4080e7          	jalr	1252(ra) # 80201b00 <mycpu>
    80200624:	5d3c                	lw	a5,120(a0)
    80200626:	cf89                	beqz	a5,80200640 <push_off+0x3c>
    mycpu()->intena = old;
  mycpu()->noff += 1;
    80200628:	00001097          	auipc	ra,0x1
    8020062c:	4d8080e7          	jalr	1240(ra) # 80201b00 <mycpu>
    80200630:	5d3c                	lw	a5,120(a0)
    80200632:	2785                	addiw	a5,a5,1
    80200634:	dd3c                	sw	a5,120(a0)
}
    80200636:	60e2                	ld	ra,24(sp)
    80200638:	6442                	ld	s0,16(sp)
    8020063a:	64a2                	ld	s1,8(sp)
    8020063c:	6105                	addi	sp,sp,32
    8020063e:	8082                	ret
    mycpu()->intena = old;
    80200640:	00001097          	auipc	ra,0x1
    80200644:	4c0080e7          	jalr	1216(ra) # 80201b00 <mycpu>
  return (x & SSTATUS_SIE) != 0;
    80200648:	8085                	srli	s1,s1,0x1
    8020064a:	8885                	andi	s1,s1,1
    8020064c:	dd64                	sw	s1,124(a0)
    8020064e:	bfe9                	j	80200628 <push_off+0x24>

0000000080200650 <pop_off>:

void
pop_off(void)
{
    80200650:	1141                	addi	sp,sp,-16
    80200652:	e406                	sd	ra,8(sp)
    80200654:	e022                	sd	s0,0(sp)
    80200656:	0800                	addi	s0,sp,16
  struct cpu *c = mycpu();
    80200658:	00001097          	auipc	ra,0x1
    8020065c:	4a8080e7          	jalr	1192(ra) # 80201b00 <mycpu>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80200660:	100027f3          	csrr	a5,sstatus
  return (x & SSTATUS_SIE) != 0;
    80200664:	8b89                	andi	a5,a5,2

  //printf("\e[31mpop_off()\e[0m: cpuid(): %d\n", cpuid());
  if(intr_get())
    80200666:	e78d                	bnez	a5,80200690 <pop_off+0x40>
    panic("pop_off - interruptible");
  if(c->noff < 1) {
    80200668:	5d3c                	lw	a5,120(a0)
    8020066a:	02f05b63          	blez	a5,802006a0 <pop_off+0x50>
    //printf("c->noff = %d\n", c->noff);
    panic("pop_off");
  }
  //printf("c->noff: %d\n", c->noff);
  //printf("c: %x\n", c);
  c->noff -= 1;
    8020066e:	37fd                	addiw	a5,a5,-1
    80200670:	0007871b          	sext.w	a4,a5
    80200674:	dd3c                	sw	a5,120(a0)
  if(c->noff == 0 && c->intena)
    80200676:	eb09                	bnez	a4,80200688 <pop_off+0x38>
    80200678:	5d7c                	lw	a5,124(a0)
    8020067a:	c799                	beqz	a5,80200688 <pop_off+0x38>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    8020067c:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80200680:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80200684:	10079073          	csrw	sstatus,a5
    intr_on();
}
    80200688:	60a2                	ld	ra,8(sp)
    8020068a:	6402                	ld	s0,0(sp)
    8020068c:	0141                	addi	sp,sp,16
    8020068e:	8082                	ret
    panic("pop_off - interruptible");
    80200690:	00009517          	auipc	a0,0x9
    80200694:	d4050513          	addi	a0,a0,-704 # 802093d0 <digits+0x50>
    80200698:	00000097          	auipc	ra,0x0
    8020069c:	aac080e7          	jalr	-1364(ra) # 80200144 <panic>
    panic("pop_off");
    802006a0:	00009517          	auipc	a0,0x9
    802006a4:	d4850513          	addi	a0,a0,-696 # 802093e8 <digits+0x68>
    802006a8:	00000097          	auipc	ra,0x0
    802006ac:	a9c080e7          	jalr	-1380(ra) # 80200144 <panic>

00000000802006b0 <initlock>:
#include "include/intr.h"
#include "include/printf.h"

void
initlock(struct spinlock *lk, char *name)
{
    802006b0:	1141                	addi	sp,sp,-16
    802006b2:	e422                	sd	s0,8(sp)
    802006b4:	0800                	addi	s0,sp,16
  lk->name = name;
    802006b6:	e50c                	sd	a1,8(a0)
  lk->locked = 0;
    802006b8:	00052023          	sw	zero,0(a0)
  lk->cpu = 0;
    802006bc:	00053823          	sd	zero,16(a0)
}
    802006c0:	6422                	ld	s0,8(sp)
    802006c2:	0141                	addi	sp,sp,16
    802006c4:	8082                	ret

00000000802006c6 <holding>:
// Interrupts must be off.
int
holding(struct spinlock *lk)
{
  int r;
  r = (lk->locked && lk->cpu == mycpu());
    802006c6:	411c                	lw	a5,0(a0)
    802006c8:	e399                	bnez	a5,802006ce <holding+0x8>
    802006ca:	4501                	li	a0,0
  return r;
}
    802006cc:	8082                	ret
{
    802006ce:	1101                	addi	sp,sp,-32
    802006d0:	ec06                	sd	ra,24(sp)
    802006d2:	e822                	sd	s0,16(sp)
    802006d4:	e426                	sd	s1,8(sp)
    802006d6:	1000                	addi	s0,sp,32
  r = (lk->locked && lk->cpu == mycpu());
    802006d8:	6904                	ld	s1,16(a0)
    802006da:	00001097          	auipc	ra,0x1
    802006de:	426080e7          	jalr	1062(ra) # 80201b00 <mycpu>
    802006e2:	40a48533          	sub	a0,s1,a0
    802006e6:	00153513          	seqz	a0,a0
}
    802006ea:	60e2                	ld	ra,24(sp)
    802006ec:	6442                	ld	s0,16(sp)
    802006ee:	64a2                	ld	s1,8(sp)
    802006f0:	6105                	addi	sp,sp,32
    802006f2:	8082                	ret

00000000802006f4 <acquire>:
{
    802006f4:	1101                	addi	sp,sp,-32
    802006f6:	ec06                	sd	ra,24(sp)
    802006f8:	e822                	sd	s0,16(sp)
    802006fa:	e426                	sd	s1,8(sp)
    802006fc:	1000                	addi	s0,sp,32
    802006fe:	84aa                	mv	s1,a0
  push_off(); // disable interrupts to avoid deadlock.
    80200700:	00000097          	auipc	ra,0x0
    80200704:	f04080e7          	jalr	-252(ra) # 80200604 <push_off>
  if(holding(lk))
    80200708:	8526                	mv	a0,s1
    8020070a:	00000097          	auipc	ra,0x0
    8020070e:	fbc080e7          	jalr	-68(ra) # 802006c6 <holding>
  while(__sync_lock_test_and_set(&lk->locked, 1) != 0)
    80200712:	4705                	li	a4,1
  if(holding(lk))
    80200714:	e115                	bnez	a0,80200738 <acquire+0x44>
  while(__sync_lock_test_and_set(&lk->locked, 1) != 0)
    80200716:	87ba                	mv	a5,a4
    80200718:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    8020071c:	2781                	sext.w	a5,a5
    8020071e:	ffe5                	bnez	a5,80200716 <acquire+0x22>
  __sync_synchronize();
    80200720:	0ff0000f          	fence
  lk->cpu = mycpu();
    80200724:	00001097          	auipc	ra,0x1
    80200728:	3dc080e7          	jalr	988(ra) # 80201b00 <mycpu>
    8020072c:	e888                	sd	a0,16(s1)
}
    8020072e:	60e2                	ld	ra,24(sp)
    80200730:	6442                	ld	s0,16(sp)
    80200732:	64a2                	ld	s1,8(sp)
    80200734:	6105                	addi	sp,sp,32
    80200736:	8082                	ret
    panic("acquire");
    80200738:	00009517          	auipc	a0,0x9
    8020073c:	cb850513          	addi	a0,a0,-840 # 802093f0 <digits+0x70>
    80200740:	00000097          	auipc	ra,0x0
    80200744:	a04080e7          	jalr	-1532(ra) # 80200144 <panic>

0000000080200748 <release>:
{
    80200748:	1101                	addi	sp,sp,-32
    8020074a:	ec06                	sd	ra,24(sp)
    8020074c:	e822                	sd	s0,16(sp)
    8020074e:	e426                	sd	s1,8(sp)
    80200750:	1000                	addi	s0,sp,32
    80200752:	84aa                	mv	s1,a0
  if(!holding(lk))
    80200754:	00000097          	auipc	ra,0x0
    80200758:	f72080e7          	jalr	-142(ra) # 802006c6 <holding>
    8020075c:	c115                	beqz	a0,80200780 <release+0x38>
  lk->cpu = 0;
    8020075e:	0004b823          	sd	zero,16(s1)
  __sync_synchronize();
    80200762:	0ff0000f          	fence
  __sync_lock_release(&lk->locked);
    80200766:	0f50000f          	fence	iorw,ow
    8020076a:	0804a02f          	amoswap.w	zero,zero,(s1)
  pop_off();
    8020076e:	00000097          	auipc	ra,0x0
    80200772:	ee2080e7          	jalr	-286(ra) # 80200650 <pop_off>
}
    80200776:	60e2                	ld	ra,24(sp)
    80200778:	6442                	ld	s0,16(sp)
    8020077a:	64a2                	ld	s1,8(sp)
    8020077c:	6105                	addi	sp,sp,32
    8020077e:	8082                	ret
    panic("release");
    80200780:	00009517          	auipc	a0,0x9
    80200784:	c7850513          	addi	a0,a0,-904 # 802093f8 <digits+0x78>
    80200788:	00000097          	auipc	ra,0x0
    8020078c:	9bc080e7          	jalr	-1604(ra) # 80200144 <panic>

0000000080200790 <memset>:
#include "include/types.h"

void*
memset(void *dst, int c, uint n)
{
    80200790:	1141                	addi	sp,sp,-16
    80200792:	e422                	sd	s0,8(sp)
    80200794:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
    80200796:	ce09                	beqz	a2,802007b0 <memset+0x20>
    80200798:	87aa                	mv	a5,a0
    8020079a:	fff6071b          	addiw	a4,a2,-1
    8020079e:	1702                	slli	a4,a4,0x20
    802007a0:	9301                	srli	a4,a4,0x20
    802007a2:	0705                	addi	a4,a4,1
    802007a4:	972a                	add	a4,a4,a0
    cdst[i] = c;
    802007a6:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
    802007aa:	0785                	addi	a5,a5,1
    802007ac:	fee79de3          	bne	a5,a4,802007a6 <memset+0x16>
  }
  return dst;
}
    802007b0:	6422                	ld	s0,8(sp)
    802007b2:	0141                	addi	sp,sp,16
    802007b4:	8082                	ret

00000000802007b6 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
    802007b6:	1141                	addi	sp,sp,-16
    802007b8:	e422                	sd	s0,8(sp)
    802007ba:	0800                	addi	s0,sp,16
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
    802007bc:	ca05                	beqz	a2,802007ec <memcmp+0x36>
    802007be:	fff6069b          	addiw	a3,a2,-1
    802007c2:	1682                	slli	a3,a3,0x20
    802007c4:	9281                	srli	a3,a3,0x20
    802007c6:	0685                	addi	a3,a3,1
    802007c8:	96aa                	add	a3,a3,a0
    if(*s1 != *s2)
    802007ca:	00054783          	lbu	a5,0(a0)
    802007ce:	0005c703          	lbu	a4,0(a1)
    802007d2:	00e79863          	bne	a5,a4,802007e2 <memcmp+0x2c>
      return *s1 - *s2;
    s1++, s2++;
    802007d6:	0505                	addi	a0,a0,1
    802007d8:	0585                	addi	a1,a1,1
  while(n-- > 0){
    802007da:	fed518e3          	bne	a0,a3,802007ca <memcmp+0x14>
  }

  return 0;
    802007de:	4501                	li	a0,0
    802007e0:	a019                	j	802007e6 <memcmp+0x30>
      return *s1 - *s2;
    802007e2:	40e7853b          	subw	a0,a5,a4
}
    802007e6:	6422                	ld	s0,8(sp)
    802007e8:	0141                	addi	sp,sp,16
    802007ea:	8082                	ret
  return 0;
    802007ec:	4501                	li	a0,0
    802007ee:	bfe5                	j	802007e6 <memcmp+0x30>

00000000802007f0 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
    802007f0:	1141                	addi	sp,sp,-16
    802007f2:	e422                	sd	s0,8(sp)
    802007f4:	0800                	addi	s0,sp,16
  const char *s;
  char *d;

  s = src;
  d = dst;
  if(s < d && s + n > d){
    802007f6:	00a5f963          	bgeu	a1,a0,80200808 <memmove+0x18>
    802007fa:	02061713          	slli	a4,a2,0x20
    802007fe:	9301                	srli	a4,a4,0x20
    80200800:	00e587b3          	add	a5,a1,a4
    80200804:	02f56563          	bltu	a0,a5,8020082e <memmove+0x3e>
    s += n;
    d += n;
    while(n-- > 0)
      *--d = *--s;
  } else
    while(n-- > 0)
    80200808:	fff6069b          	addiw	a3,a2,-1
    8020080c:	ce11                	beqz	a2,80200828 <memmove+0x38>
    8020080e:	1682                	slli	a3,a3,0x20
    80200810:	9281                	srli	a3,a3,0x20
    80200812:	0685                	addi	a3,a3,1
    80200814:	96ae                	add	a3,a3,a1
    80200816:	87aa                	mv	a5,a0
      *d++ = *s++;
    80200818:	0585                	addi	a1,a1,1
    8020081a:	0785                	addi	a5,a5,1
    8020081c:	fff5c703          	lbu	a4,-1(a1)
    80200820:	fee78fa3          	sb	a4,-1(a5)
    while(n-- > 0)
    80200824:	fed59ae3          	bne	a1,a3,80200818 <memmove+0x28>

  return dst;
}
    80200828:	6422                	ld	s0,8(sp)
    8020082a:	0141                	addi	sp,sp,16
    8020082c:	8082                	ret
    d += n;
    8020082e:	972a                	add	a4,a4,a0
    while(n-- > 0)
    80200830:	fff6069b          	addiw	a3,a2,-1
    80200834:	da75                	beqz	a2,80200828 <memmove+0x38>
    80200836:	02069613          	slli	a2,a3,0x20
    8020083a:	9201                	srli	a2,a2,0x20
    8020083c:	fff64613          	not	a2,a2
    80200840:	963e                	add	a2,a2,a5
      *--d = *--s;
    80200842:	17fd                	addi	a5,a5,-1
    80200844:	177d                	addi	a4,a4,-1
    80200846:	0007c683          	lbu	a3,0(a5)
    8020084a:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
    8020084e:	fec79ae3          	bne	a5,a2,80200842 <memmove+0x52>
    80200852:	bfd9                	j	80200828 <memmove+0x38>

0000000080200854 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
    80200854:	1141                	addi	sp,sp,-16
    80200856:	e406                	sd	ra,8(sp)
    80200858:	e022                	sd	s0,0(sp)
    8020085a:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
    8020085c:	00000097          	auipc	ra,0x0
    80200860:	f94080e7          	jalr	-108(ra) # 802007f0 <memmove>
}
    80200864:	60a2                	ld	ra,8(sp)
    80200866:	6402                	ld	s0,0(sp)
    80200868:	0141                	addi	sp,sp,16
    8020086a:	8082                	ret

000000008020086c <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
    8020086c:	1141                	addi	sp,sp,-16
    8020086e:	e422                	sd	s0,8(sp)
    80200870:	0800                	addi	s0,sp,16
  while(n > 0 && *p && *p == *q)
    80200872:	ce11                	beqz	a2,8020088e <strncmp+0x22>
    80200874:	00054783          	lbu	a5,0(a0)
    80200878:	cf89                	beqz	a5,80200892 <strncmp+0x26>
    8020087a:	0005c703          	lbu	a4,0(a1)
    8020087e:	00f71a63          	bne	a4,a5,80200892 <strncmp+0x26>
    n--, p++, q++;
    80200882:	367d                	addiw	a2,a2,-1
    80200884:	0505                	addi	a0,a0,1
    80200886:	0585                	addi	a1,a1,1
  while(n > 0 && *p && *p == *q)
    80200888:	f675                	bnez	a2,80200874 <strncmp+0x8>
  if(n == 0)
    return 0;
    8020088a:	4501                	li	a0,0
    8020088c:	a809                	j	8020089e <strncmp+0x32>
    8020088e:	4501                	li	a0,0
    80200890:	a039                	j	8020089e <strncmp+0x32>
  if(n == 0)
    80200892:	ca09                	beqz	a2,802008a4 <strncmp+0x38>
  return (uchar)*p - (uchar)*q;
    80200894:	00054503          	lbu	a0,0(a0)
    80200898:	0005c783          	lbu	a5,0(a1)
    8020089c:	9d1d                	subw	a0,a0,a5
}
    8020089e:	6422                	ld	s0,8(sp)
    802008a0:	0141                	addi	sp,sp,16
    802008a2:	8082                	ret
    return 0;
    802008a4:	4501                	li	a0,0
    802008a6:	bfe5                	j	8020089e <strncmp+0x32>

00000000802008a8 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
    802008a8:	1141                	addi	sp,sp,-16
    802008aa:	e422                	sd	s0,8(sp)
    802008ac:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    802008ae:	872a                	mv	a4,a0
    802008b0:	8832                	mv	a6,a2
    802008b2:	367d                	addiw	a2,a2,-1
    802008b4:	01005963          	blez	a6,802008c6 <strncpy+0x1e>
    802008b8:	0705                	addi	a4,a4,1
    802008ba:	0005c783          	lbu	a5,0(a1)
    802008be:	fef70fa3          	sb	a5,-1(a4)
    802008c2:	0585                	addi	a1,a1,1
    802008c4:	f7f5                	bnez	a5,802008b0 <strncpy+0x8>
    ;
  while(n-- > 0)
    802008c6:	00c05d63          	blez	a2,802008e0 <strncpy+0x38>
    802008ca:	86ba                	mv	a3,a4
    *s++ = 0;
    802008cc:	0685                	addi	a3,a3,1
    802008ce:	fe068fa3          	sb	zero,-1(a3)
  while(n-- > 0)
    802008d2:	fff6c793          	not	a5,a3
    802008d6:	9fb9                	addw	a5,a5,a4
    802008d8:	010787bb          	addw	a5,a5,a6
    802008dc:	fef048e3          	bgtz	a5,802008cc <strncpy+0x24>
  return os;
}
    802008e0:	6422                	ld	s0,8(sp)
    802008e2:	0141                	addi	sp,sp,16
    802008e4:	8082                	ret

00000000802008e6 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
    802008e6:	1141                	addi	sp,sp,-16
    802008e8:	e422                	sd	s0,8(sp)
    802008ea:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  if(n <= 0)
    802008ec:	02c05363          	blez	a2,80200912 <safestrcpy+0x2c>
    802008f0:	fff6069b          	addiw	a3,a2,-1
    802008f4:	1682                	slli	a3,a3,0x20
    802008f6:	9281                	srli	a3,a3,0x20
    802008f8:	96ae                	add	a3,a3,a1
    802008fa:	87aa                	mv	a5,a0
    return os;
  while(--n > 0 && (*s++ = *t++) != 0)
    802008fc:	00d58963          	beq	a1,a3,8020090e <safestrcpy+0x28>
    80200900:	0585                	addi	a1,a1,1
    80200902:	0785                	addi	a5,a5,1
    80200904:	fff5c703          	lbu	a4,-1(a1)
    80200908:	fee78fa3          	sb	a4,-1(a5)
    8020090c:	fb65                	bnez	a4,802008fc <safestrcpy+0x16>
    ;
  *s = 0;
    8020090e:	00078023          	sb	zero,0(a5)
  return os;
}
    80200912:	6422                	ld	s0,8(sp)
    80200914:	0141                	addi	sp,sp,16
    80200916:	8082                	ret

0000000080200918 <strlen>:

int
strlen(const char *s)
{
    80200918:	1141                	addi	sp,sp,-16
    8020091a:	e422                	sd	s0,8(sp)
    8020091c:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
    8020091e:	00054783          	lbu	a5,0(a0)
    80200922:	cf91                	beqz	a5,8020093e <strlen+0x26>
    80200924:	0505                	addi	a0,a0,1
    80200926:	87aa                	mv	a5,a0
    80200928:	4685                	li	a3,1
    8020092a:	9e89                	subw	a3,a3,a0
    8020092c:	00f6853b          	addw	a0,a3,a5
    80200930:	0785                	addi	a5,a5,1
    80200932:	fff7c703          	lbu	a4,-1(a5)
    80200936:	fb7d                	bnez	a4,8020092c <strlen+0x14>
    ;
  return n;
}
    80200938:	6422                	ld	s0,8(sp)
    8020093a:	0141                	addi	sp,sp,16
    8020093c:	8082                	ret
  for(n = 0; s[n]; n++)
    8020093e:	4501                	li	a0,0
    80200940:	bfe5                	j	80200938 <strlen+0x20>

0000000080200942 <wnstr>:

// convert uchar string into wide char string 
void wnstr(wchar *dst, char const *src, int len) {
    80200942:	1141                	addi	sp,sp,-16
    80200944:	e422                	sd	s0,8(sp)
    80200946:	0800                	addi	s0,sp,16
  while (len -- && *src) {
    80200948:	c215                	beqz	a2,8020096c <wnstr+0x2a>
    8020094a:	fff6071b          	addiw	a4,a2,-1
    8020094e:	1702                	slli	a4,a4,0x20
    80200950:	9301                	srli	a4,a4,0x20
    80200952:	0705                	addi	a4,a4,1
    80200954:	0706                	slli	a4,a4,0x1
    80200956:	972a                	add	a4,a4,a0
    80200958:	0005c783          	lbu	a5,0(a1)
    8020095c:	cb81                	beqz	a5,8020096c <wnstr+0x2a>
    *(uchar*)dst = *src++;
    8020095e:	0585                	addi	a1,a1,1
    80200960:	00f50023          	sb	a5,0(a0)
    dst ++;
    80200964:	0509                	addi	a0,a0,2
  while (len -- && *src) {
    80200966:	fee519e3          	bne	a0,a4,80200958 <wnstr+0x16>
    dst ++;
    8020096a:	853a                	mv	a0,a4
  }

  *dst = 0;
    8020096c:	00051023          	sh	zero,0(a0)
}
    80200970:	6422                	ld	s0,8(sp)
    80200972:	0141                	addi	sp,sp,16
    80200974:	8082                	ret

0000000080200976 <snstr>:

// convert wide char string into uchar string 
void snstr(char *dst, wchar const *src, int len) {
    80200976:	1141                	addi	sp,sp,-16
    80200978:	e422                	sd	s0,8(sp)
    8020097a:	0800                	addi	s0,sp,16
  while (len -- && *src) {
    8020097c:	c221                	beqz	a2,802009bc <snstr+0x46>
    8020097e:	fff6079b          	addiw	a5,a2,-1
    80200982:	fff6069b          	addiw	a3,a2,-1
    80200986:	1682                	slli	a3,a3,0x20
    80200988:	9281                	srli	a3,a3,0x20
    8020098a:	0685                	addi	a3,a3,1
    8020098c:	96aa                	add	a3,a3,a0
    8020098e:	0005d703          	lhu	a4,0(a1)
    80200992:	cb09                	beqz	a4,802009a4 <snstr+0x2e>
    *dst++ = (uchar)(*src & 0xff);
    80200994:	0505                	addi	a0,a0,1
    80200996:	fee50fa3          	sb	a4,-1(a0)
    src ++;
    8020099a:	0589                	addi	a1,a1,2
  while (len -- && *src) {
    8020099c:	37fd                	addiw	a5,a5,-1
    8020099e:	fed518e3          	bne	a0,a3,8020098e <snstr+0x18>
    *dst++ = (uchar)(*src & 0xff);
    802009a2:	8536                	mv	a0,a3
  }
  while(len-- > 0)
    802009a4:	00f05c63          	blez	a5,802009bc <snstr+0x46>
    802009a8:	37fd                	addiw	a5,a5,-1
    802009aa:	1782                	slli	a5,a5,0x20
    802009ac:	9381                	srli	a5,a5,0x20
    802009ae:	0785                	addi	a5,a5,1
    802009b0:	97aa                	add	a5,a5,a0
    *dst++ = 0;
    802009b2:	0505                	addi	a0,a0,1
    802009b4:	fe050fa3          	sb	zero,-1(a0)
  while(len-- > 0)
    802009b8:	fea79de3          	bne	a5,a0,802009b2 <snstr+0x3c>
}
    802009bc:	6422                	ld	s0,8(sp)
    802009be:	0141                	addi	sp,sp,16
    802009c0:	8082                	ret

00000000802009c2 <wcsncmp>:

int wcsncmp(wchar const *s1, wchar const *s2, int len) {
    802009c2:	1141                	addi	sp,sp,-16
    802009c4:	e422                	sd	s0,8(sp)
    802009c6:	0800                	addi	s0,sp,16
    802009c8:	872a                	mv	a4,a0
  int ret = 0;

  while (len-- && *s1) {
    802009ca:	02061693          	slli	a3,a2,0x20
    802009ce:	9281                	srli	a3,a3,0x20
    802009d0:	0686                	slli	a3,a3,0x1
    802009d2:	96ae                	add	a3,a3,a1
    802009d4:	00d58f63          	beq	a1,a3,802009f2 <wcsncmp+0x30>
    802009d8:	00075783          	lhu	a5,0(a4)
    802009dc:	cb89                	beqz	a5,802009ee <wcsncmp+0x2c>
    ret = (int)(*s1++ - *s2++);
    802009de:	0709                	addi	a4,a4,2
    802009e0:	0589                	addi	a1,a1,2
    802009e2:	ffe5d503          	lhu	a0,-2(a1)
    802009e6:	40a7853b          	subw	a0,a5,a0
    if (ret) break;
    802009ea:	d56d                	beqz	a0,802009d4 <wcsncmp+0x12>
    802009ec:	a021                	j	802009f4 <wcsncmp+0x32>
    802009ee:	4501                	li	a0,0
    802009f0:	a011                	j	802009f4 <wcsncmp+0x32>
    802009f2:	4501                	li	a0,0
  }

  return ret;
}
    802009f4:	6422                	ld	s0,8(sp)
    802009f6:	0141                	addi	sp,sp,16
    802009f8:	8082                	ret

00000000802009fa <strchr>:

char*
strchr(const char *s, char c)
{
    802009fa:	1141                	addi	sp,sp,-16
    802009fc:	e422                	sd	s0,8(sp)
    802009fe:	0800                	addi	s0,sp,16
  for(; *s; s++)
    80200a00:	00054783          	lbu	a5,0(a0)
    80200a04:	cb99                	beqz	a5,80200a1a <strchr+0x20>
    if(*s == c)
    80200a06:	00f58763          	beq	a1,a5,80200a14 <strchr+0x1a>
  for(; *s; s++)
    80200a0a:	0505                	addi	a0,a0,1
    80200a0c:	00054783          	lbu	a5,0(a0)
    80200a10:	fbfd                	bnez	a5,80200a06 <strchr+0xc>
      return (char*)s;
  return 0;
    80200a12:	4501                	li	a0,0
    80200a14:	6422                	ld	s0,8(sp)
    80200a16:	0141                	addi	sp,sp,16
    80200a18:	8082                	ret
  return 0;
    80200a1a:	4501                	li	a0,0
    80200a1c:	bfe5                	j	80200a14 <strchr+0x1a>

0000000080200a1e <main>:
volatile static int started = 0;
int booted[NCPU];
extern char _entry[];
void
main(unsigned long hartid, unsigned long dtb_pa)
{
    80200a1e:	715d                	addi	sp,sp,-80
    80200a20:	e486                	sd	ra,72(sp)
    80200a22:	e0a2                	sd	s0,64(sp)
    80200a24:	fc26                	sd	s1,56(sp)
    80200a26:	f84a                	sd	s2,48(sp)
    80200a28:	f44e                	sd	s3,40(sp)
    80200a2a:	f052                	sd	s4,32(sp)
    80200a2c:	ec56                	sd	s5,24(sp)
    80200a2e:	e85a                	sd	s6,16(sp)
    80200a30:	e45e                	sd	s7,8(sp)
    80200a32:	0880                	addi	s0,sp,80
    80200a34:	84aa                	mv	s1,a0
  asm volatile("mv tp, %0" : : "r" (hartid));
    80200a36:	822a                	mv	tp,a0
  inithartid(hartid);
  booted[hartid]=1;
    80200a38:	00251713          	slli	a4,a0,0x2
    80200a3c:	000aa797          	auipc	a5,0xaa
    80200a40:	61478793          	addi	a5,a5,1556 # 802ab050 <booted>
    80200a44:	97ba                	add	a5,a5,a4
    80200a46:	4705                	li	a4,1
    80200a48:	c398                	sw	a4,0(a5)
  if (started == 0) {
    80200a4a:	000aa797          	auipc	a5,0xaa
    80200a4e:	61a7a783          	lw	a5,1562(a5) # 802ab064 <started>
  }
  else
  {
    // hart 1

    while (started == 0)
    80200a52:	000aa717          	auipc	a4,0xaa
    80200a56:	61270713          	addi	a4,a4,1554 # 802ab064 <started>
  if (started == 0) {
    80200a5a:	cba1                	beqz	a5,80200aaa <main+0x8c>
    while (started == 0)
    80200a5c:	431c                	lw	a5,0(a4)
    80200a5e:	2781                	sext.w	a5,a5
    80200a60:	dff5                	beqz	a5,80200a5c <main+0x3e>
      ;
    __sync_synchronize();
    80200a62:	0ff0000f          	fence
    #ifdef DEBUG
    printf("hart %d enter main()...\n", hartid);
    80200a66:	85a6                	mv	a1,s1
    80200a68:	00009517          	auipc	a0,0x9
    80200a6c:	99850513          	addi	a0,a0,-1640 # 80209400 <digits+0x80>
    80200a70:	fffff097          	auipc	ra,0xfffff
    80200a74:	71e080e7          	jalr	1822(ra) # 8020018e <printf>
    #endif

    kvminithart();
    80200a78:	00000097          	auipc	ra,0x0
    80200a7c:	120080e7          	jalr	288(ra) # 80200b98 <kvminithart>
    trapinithart();
    80200a80:	00002097          	auipc	ra,0x2
    80200a84:	d2a080e7          	jalr	-726(ra) # 802027aa <trapinithart>
    plicinithart();  // ask PLIC for device interrupts
    80200a88:	00006097          	auipc	ra,0x6
    80200a8c:	592080e7          	jalr	1426(ra) # 8020701a <plicinithart>
  }


  printf("hart %d Bye...\n", hartid);
    80200a90:	85a6                	mv	a1,s1
    80200a92:	00009517          	auipc	a0,0x9
    80200a96:	9a650513          	addi	a0,a0,-1626 # 80209438 <digits+0xb8>
    80200a9a:	fffff097          	auipc	ra,0xfffff
    80200a9e:	6f4080e7          	jalr	1780(ra) # 8020018e <printf>
  scheduler();
    80200aa2:	00001097          	auipc	ra,0x1
    80200aa6:	5fe080e7          	jalr	1534(ra) # 802020a0 <scheduler>
    started=1;
    80200aaa:	4785                	li	a5,1
    80200aac:	000aa717          	auipc	a4,0xaa
    80200ab0:	5af72c23          	sw	a5,1464(a4) # 802ab064 <started>
    consoleinit();
    80200ab4:	00007097          	auipc	ra,0x7
    80200ab8:	980080e7          	jalr	-1664(ra) # 80207434 <consoleinit>
    printfinit();   // init a lock for printf 
    80200abc:	00000097          	auipc	ra,0x0
    80200ac0:	8b8080e7          	jalr	-1864(ra) # 80200374 <printfinit>
    print_logo();
    80200ac4:	00000097          	auipc	ra,0x0
    80200ac8:	8e2080e7          	jalr	-1822(ra) # 802003a6 <print_logo>
    printf("hart %d enter main()...\n", hartid);
    80200acc:	85a6                	mv	a1,s1
    80200ace:	00009517          	auipc	a0,0x9
    80200ad2:	93250513          	addi	a0,a0,-1742 # 80209400 <digits+0x80>
    80200ad6:	fffff097          	auipc	ra,0xfffff
    80200ada:	6b8080e7          	jalr	1720(ra) # 8020018e <printf>
    kinit();         // physical page allocator
    80200ade:	00000097          	auipc	ra,0x0
    80200ae2:	a32080e7          	jalr	-1486(ra) # 80200510 <kinit>
    kvminit();       // create kernel page table
    80200ae6:	00000097          	auipc	ra,0x0
    80200aea:	310080e7          	jalr	784(ra) # 80200df6 <kvminit>
    kvminithart();   // turn on paging
    80200aee:	00000097          	auipc	ra,0x0
    80200af2:	0aa080e7          	jalr	170(ra) # 80200b98 <kvminithart>
    timerinit();     // init a lock for timer
    80200af6:	00004097          	auipc	ra,0x4
    80200afa:	4e8080e7          	jalr	1256(ra) # 80204fde <timerinit>
    trapinithart();  // install kernel trap vector, including interrupt handler
    80200afe:	00002097          	auipc	ra,0x2
    80200b02:	cac080e7          	jalr	-852(ra) # 802027aa <trapinithart>
    procinit();
    80200b06:	00001097          	auipc	ra,0x1
    80200b0a:	f64080e7          	jalr	-156(ra) # 80201a6a <procinit>
    plicinit();
    80200b0e:	00006097          	auipc	ra,0x6
    80200b12:	4de080e7          	jalr	1246(ra) # 80206fec <plicinit>
    plicinithart();
    80200b16:	00006097          	auipc	ra,0x6
    80200b1a:	504080e7          	jalr	1284(ra) # 8020701a <plicinithart>
    binit();         // buffer cache
    80200b1e:	00003097          	auipc	ra,0x3
    80200b22:	850080e7          	jalr	-1968(ra) # 8020336e <binit>
    fileinit();      // file table
    80200b26:	00003097          	auipc	ra,0x3
    80200b2a:	c64080e7          	jalr	-924(ra) # 8020378a <fileinit>
    userinit();      // first user process
    80200b2e:	00001097          	auipc	ra,0x1
    80200b32:	2fc080e7          	jalr	764(ra) # 80201e2a <userinit>
    __sync_synchronize();
    80200b36:	0ff0000f          	fence
   for(int i = 1; i < NCPU; i++) {
    80200b3a:	000aa997          	auipc	s3,0xaa
    80200b3e:	51698993          	addi	s3,s3,1302 # 802ab050 <booted>
    __sync_synchronize();
    80200b42:	4905                	li	s2,1
        printf("hart %d awake hart %d\n",hartid,i);
    80200b44:	00009b97          	auipc	s7,0x9
    80200b48:	8dcb8b93          	addi	s7,s7,-1828 # 80209420 <digits+0xa0>
      	start_hart(i, (uint64)_entry, 0);
    80200b4c:	fffffb17          	auipc	s6,0xfffff
    80200b50:	4b4b0b13          	addi	s6,s6,1204 # 80200000 <_entry>
	register uint64 a2 asm ("a2") = (uint64)(arg2);
	register uint64 a3 asm ("a3") = (uint64)(arg3);
	register uint64 a4 asm ("a4") = (uint64)(arg4);
	register uint64 a5 asm ("a5") = (uint64)(arg5);
	register uint64 a6 asm ("a6") = (uint64)(fid);
	register uint64 a7 asm ("a7") = (uint64)(ext);
    80200b54:	00485ab7          	lui	s5,0x485
    80200b58:	34da8a93          	addi	s5,s5,845 # 48534d <_entry-0x7fd7acb3>
   for(int i = 1; i < NCPU; i++) {
    80200b5c:	4a15                	li	s4,5
    80200b5e:	a029                	j	80200b68 <main+0x14a>
    80200b60:	0905                	addi	s2,s2,1
    80200b62:	0991                	addi	s3,s3,4
    80200b64:	f34906e3          	beq	s2,s4,80200a90 <main+0x72>
    80200b68:	0009061b          	sext.w	a2,s2
      if(hartid!=i&&booted[i]==0){
    80200b6c:	ff248ae3          	beq	s1,s2,80200b60 <main+0x142>
    80200b70:	0049a783          	lw	a5,4(s3)
    80200b74:	f7f5                	bnez	a5,80200b60 <main+0x142>
        printf("hart %d awake hart %d\n",hartid,i);
    80200b76:	85a6                	mv	a1,s1
    80200b78:	855e                	mv	a0,s7
    80200b7a:	fffff097          	auipc	ra,0xfffff
    80200b7e:	614080e7          	jalr	1556(ra) # 8020018e <printf>
	register uint64 a0 asm ("a0") = (uint64)(arg0);
    80200b82:	854a                	mv	a0,s2
	register uint64 a1 asm ("a1") = (uint64)(arg1);
    80200b84:	85da                	mv	a1,s6
	register uint64 a2 asm ("a2") = (uint64)(arg2);
    80200b86:	4601                	li	a2,0
	register uint64 a3 asm ("a3") = (uint64)(arg3);
    80200b88:	4681                	li	a3,0
	register uint64 a4 asm ("a4") = (uint64)(arg4);
    80200b8a:	4701                	li	a4,0
	register uint64 a5 asm ("a5") = (uint64)(arg5);
    80200b8c:	4781                	li	a5,0
	register uint64 a6 asm ("a6") = (uint64)(fid);
    80200b8e:	4801                	li	a6,0
	register uint64 a7 asm ("a7") = (uint64)(ext);
    80200b90:	88d6                	mv	a7,s5
	asm volatile ("ecall"
    80200b92:	00000073          	ecall
    sbi_call(SBI_SET_TIMER, stime, 0, 0);
}

static inline void start_hart(uint64 hartid,uint64 start_addr, uint64 a1) {
    a_sbi_ecall(0x48534D, 0, hartid, start_addr, a1, 0, 0, 0);
}
    80200b96:	b7e9                	j	80200b60 <main+0x142>

0000000080200b98 <kvminithart>:

// Switch h/w page table register to the kernel's page table,
// and enable paging.
void
kvminithart()
{
    80200b98:	1141                	addi	sp,sp,-16
    80200b9a:	e406                	sd	ra,8(sp)
    80200b9c:	e022                	sd	s0,0(sp)
    80200b9e:	0800                	addi	s0,sp,16
  w_satp(MAKE_SATP(kernel_pagetable));
    80200ba0:	000aa797          	auipc	a5,0xaa
    80200ba4:	4c87b783          	ld	a5,1224(a5) # 802ab068 <kernel_pagetable>
    80200ba8:	83b1                	srli	a5,a5,0xc
    80200baa:	577d                	li	a4,-1
    80200bac:	177e                	slli	a4,a4,0x3f
    80200bae:	8fd9                	or	a5,a5,a4
  asm volatile("csrw satp, %0" : : "r" (x));
    80200bb0:	18079073          	csrw	satp,a5
static inline void
sfence_vma()
{
  // the zero, zero means flush all TLB entries.
  // asm volatile("sfence.vma zero, zero");
  asm volatile("sfence.vma");
    80200bb4:	12000073          	sfence.vma
  // reg_info();
  sfence_vma();
  #ifdef DEBUG
  printf("kvminithart\n");
    80200bb8:	00009517          	auipc	a0,0x9
    80200bbc:	89050513          	addi	a0,a0,-1904 # 80209448 <digits+0xc8>
    80200bc0:	fffff097          	auipc	ra,0xfffff
    80200bc4:	5ce080e7          	jalr	1486(ra) # 8020018e <printf>
  #endif
}
    80200bc8:	60a2                	ld	ra,8(sp)
    80200bca:	6402                	ld	s0,0(sp)
    80200bcc:	0141                	addi	sp,sp,16
    80200bce:	8082                	ret

0000000080200bd0 <walk>:
//   21..29 -- 9 bits of level-1 index.
//   12..20 -- 9 bits of level-0 index.
//    0..11 -- 12 bits of byte offset within the page.
pte_t *
walk(pagetable_t pagetable, uint64 va, int alloc)
{
    80200bd0:	7139                	addi	sp,sp,-64
    80200bd2:	fc06                	sd	ra,56(sp)
    80200bd4:	f822                	sd	s0,48(sp)
    80200bd6:	f426                	sd	s1,40(sp)
    80200bd8:	f04a                	sd	s2,32(sp)
    80200bda:	ec4e                	sd	s3,24(sp)
    80200bdc:	e852                	sd	s4,16(sp)
    80200bde:	e456                	sd	s5,8(sp)
    80200be0:	e05a                	sd	s6,0(sp)
    80200be2:	0080                	addi	s0,sp,64
    80200be4:	84aa                	mv	s1,a0
    80200be6:	89ae                	mv	s3,a1
    80200be8:	8ab2                	mv	s5,a2
  
  if(va >= MAXVA)
    80200bea:	57fd                	li	a5,-1
    80200bec:	83e9                	srli	a5,a5,0x1a
    80200bee:	4a79                	li	s4,30
    panic("walk");

  for(int level = 2; level > 0; level--) {
    80200bf0:	4b31                	li	s6,12
  if(va >= MAXVA)
    80200bf2:	04b7f263          	bgeu	a5,a1,80200c36 <walk+0x66>
    panic("walk");
    80200bf6:	00009517          	auipc	a0,0x9
    80200bfa:	86250513          	addi	a0,a0,-1950 # 80209458 <digits+0xd8>
    80200bfe:	fffff097          	auipc	ra,0xfffff
    80200c02:	546080e7          	jalr	1350(ra) # 80200144 <panic>
    pte_t *pte = &pagetable[PX(level, va)];
    if(*pte & PTE_V) {
      pagetable = (pagetable_t)PTE2PA(*pte);
    } else {
      if(!alloc || (pagetable = (pde_t*)kalloc()) == NULL)
    80200c06:	060a8663          	beqz	s5,80200c72 <walk+0xa2>
    80200c0a:	00000097          	auipc	ra,0x0
    80200c0e:	97e080e7          	jalr	-1666(ra) # 80200588 <kalloc>
    80200c12:	84aa                	mv	s1,a0
    80200c14:	c529                	beqz	a0,80200c5e <walk+0x8e>
        return NULL;
      memset(pagetable, 0, PGSIZE);
    80200c16:	6605                	lui	a2,0x1
    80200c18:	4581                	li	a1,0
    80200c1a:	00000097          	auipc	ra,0x0
    80200c1e:	b76080e7          	jalr	-1162(ra) # 80200790 <memset>
      *pte = PA2PTE(pagetable) | PTE_V;
    80200c22:	00c4d793          	srli	a5,s1,0xc
    80200c26:	07aa                	slli	a5,a5,0xa
    80200c28:	0017e793          	ori	a5,a5,1
    80200c2c:	00f93023          	sd	a5,0(s2)
  for(int level = 2; level > 0; level--) {
    80200c30:	3a5d                	addiw	s4,s4,-9
    80200c32:	036a0063          	beq	s4,s6,80200c52 <walk+0x82>
    pte_t *pte = &pagetable[PX(level, va)];
    80200c36:	0149d933          	srl	s2,s3,s4
    80200c3a:	1ff97913          	andi	s2,s2,511
    80200c3e:	090e                	slli	s2,s2,0x3
    80200c40:	9926                	add	s2,s2,s1
    if(*pte & PTE_V) {
    80200c42:	00093483          	ld	s1,0(s2)
    80200c46:	0014f793          	andi	a5,s1,1
    80200c4a:	dfd5                	beqz	a5,80200c06 <walk+0x36>
      pagetable = (pagetable_t)PTE2PA(*pte);
    80200c4c:	80a9                	srli	s1,s1,0xa
    80200c4e:	04b2                	slli	s1,s1,0xc
    80200c50:	b7c5                	j	80200c30 <walk+0x60>
    }
  }
  return &pagetable[PX(0, va)];
    80200c52:	00c9d513          	srli	a0,s3,0xc
    80200c56:	1ff57513          	andi	a0,a0,511
    80200c5a:	050e                	slli	a0,a0,0x3
    80200c5c:	9526                	add	a0,a0,s1
}
    80200c5e:	70e2                	ld	ra,56(sp)
    80200c60:	7442                	ld	s0,48(sp)
    80200c62:	74a2                	ld	s1,40(sp)
    80200c64:	7902                	ld	s2,32(sp)
    80200c66:	69e2                	ld	s3,24(sp)
    80200c68:	6a42                	ld	s4,16(sp)
    80200c6a:	6aa2                	ld	s5,8(sp)
    80200c6c:	6b02                	ld	s6,0(sp)
    80200c6e:	6121                	addi	sp,sp,64
    80200c70:	8082                	ret
        return NULL;
    80200c72:	4501                	li	a0,0
    80200c74:	b7ed                	j	80200c5e <walk+0x8e>

0000000080200c76 <walkaddr>:
walkaddr(pagetable_t pagetable, uint64 va)
{
  pte_t *pte;
  uint64 pa;

  if(va >= MAXVA)
    80200c76:	57fd                	li	a5,-1
    80200c78:	83e9                	srli	a5,a5,0x1a
    80200c7a:	00b7f463          	bgeu	a5,a1,80200c82 <walkaddr+0xc>
    return NULL;
    80200c7e:	4501                	li	a0,0
    return NULL;
  if((*pte & PTE_U) == 0)
    return NULL;
  pa = PTE2PA(*pte);
  return pa;
}
    80200c80:	8082                	ret
{
    80200c82:	1141                	addi	sp,sp,-16
    80200c84:	e406                	sd	ra,8(sp)
    80200c86:	e022                	sd	s0,0(sp)
    80200c88:	0800                	addi	s0,sp,16
  pte = walk(pagetable, va, 0);
    80200c8a:	4601                	li	a2,0
    80200c8c:	00000097          	auipc	ra,0x0
    80200c90:	f44080e7          	jalr	-188(ra) # 80200bd0 <walk>
  if(pte == 0)
    80200c94:	c105                	beqz	a0,80200cb4 <walkaddr+0x3e>
  if((*pte & PTE_V) == 0)
    80200c96:	611c                	ld	a5,0(a0)
  if((*pte & PTE_U) == 0)
    80200c98:	0117f693          	andi	a3,a5,17
    80200c9c:	4745                	li	a4,17
    return NULL;
    80200c9e:	4501                	li	a0,0
  if((*pte & PTE_U) == 0)
    80200ca0:	00e68663          	beq	a3,a4,80200cac <walkaddr+0x36>
}
    80200ca4:	60a2                	ld	ra,8(sp)
    80200ca6:	6402                	ld	s0,0(sp)
    80200ca8:	0141                	addi	sp,sp,16
    80200caa:	8082                	ret
  pa = PTE2PA(*pte);
    80200cac:	00a7d513          	srli	a0,a5,0xa
    80200cb0:	0532                	slli	a0,a0,0xc
  return pa;
    80200cb2:	bfcd                	j	80200ca4 <walkaddr+0x2e>
    return NULL;
    80200cb4:	4501                	li	a0,0
    80200cb6:	b7fd                	j	80200ca4 <walkaddr+0x2e>

0000000080200cb8 <kwalkaddr>:
  return kwalkaddr(kernel_pagetable, va);
}

uint64
kwalkaddr(pagetable_t kpt, uint64 va)
{
    80200cb8:	1101                	addi	sp,sp,-32
    80200cba:	ec06                	sd	ra,24(sp)
    80200cbc:	e822                	sd	s0,16(sp)
    80200cbe:	e426                	sd	s1,8(sp)
    80200cc0:	1000                	addi	s0,sp,32
  uint64 off = va % PGSIZE;
    80200cc2:	03459793          	slli	a5,a1,0x34
    80200cc6:	0347d493          	srli	s1,a5,0x34
  pte_t *pte;
  uint64 pa;
  
  pte = walk(kpt, va, 0);
    80200cca:	4601                	li	a2,0
    80200ccc:	00000097          	auipc	ra,0x0
    80200cd0:	f04080e7          	jalr	-252(ra) # 80200bd0 <walk>
  if(pte == 0)
    80200cd4:	cd09                	beqz	a0,80200cee <kwalkaddr+0x36>
    panic("kvmpa");
  if((*pte & PTE_V) == 0)
    80200cd6:	6108                	ld	a0,0(a0)
    80200cd8:	00157793          	andi	a5,a0,1
    80200cdc:	c38d                	beqz	a5,80200cfe <kwalkaddr+0x46>
    panic("kvmpa");
  pa = PTE2PA(*pte);
    80200cde:	8129                	srli	a0,a0,0xa
    80200ce0:	0532                	slli	a0,a0,0xc
  return pa+off;
}
    80200ce2:	9526                	add	a0,a0,s1
    80200ce4:	60e2                	ld	ra,24(sp)
    80200ce6:	6442                	ld	s0,16(sp)
    80200ce8:	64a2                	ld	s1,8(sp)
    80200cea:	6105                	addi	sp,sp,32
    80200cec:	8082                	ret
    panic("kvmpa");
    80200cee:	00008517          	auipc	a0,0x8
    80200cf2:	77250513          	addi	a0,a0,1906 # 80209460 <digits+0xe0>
    80200cf6:	fffff097          	auipc	ra,0xfffff
    80200cfa:	44e080e7          	jalr	1102(ra) # 80200144 <panic>
    panic("kvmpa");
    80200cfe:	00008517          	auipc	a0,0x8
    80200d02:	76250513          	addi	a0,a0,1890 # 80209460 <digits+0xe0>
    80200d06:	fffff097          	auipc	ra,0xfffff
    80200d0a:	43e080e7          	jalr	1086(ra) # 80200144 <panic>

0000000080200d0e <kvmpa>:
{
    80200d0e:	1141                	addi	sp,sp,-16
    80200d10:	e406                	sd	ra,8(sp)
    80200d12:	e022                	sd	s0,0(sp)
    80200d14:	0800                	addi	s0,sp,16
    80200d16:	85aa                	mv	a1,a0
  return kwalkaddr(kernel_pagetable, va);
    80200d18:	000aa517          	auipc	a0,0xaa
    80200d1c:	35053503          	ld	a0,848(a0) # 802ab068 <kernel_pagetable>
    80200d20:	00000097          	auipc	ra,0x0
    80200d24:	f98080e7          	jalr	-104(ra) # 80200cb8 <kwalkaddr>
}
    80200d28:	60a2                	ld	ra,8(sp)
    80200d2a:	6402                	ld	s0,0(sp)
    80200d2c:	0141                	addi	sp,sp,16
    80200d2e:	8082                	ret

0000000080200d30 <mappages>:
// physical addresses starting at pa. va and size might not
// be page-aligned. Returns 0 on success, -1 if walk() couldn't
// allocate a needed page-table page.
int
mappages(pagetable_t pagetable, uint64 va, uint64 size, uint64 pa, int perm)
{
    80200d30:	715d                	addi	sp,sp,-80
    80200d32:	e486                	sd	ra,72(sp)
    80200d34:	e0a2                	sd	s0,64(sp)
    80200d36:	fc26                	sd	s1,56(sp)
    80200d38:	f84a                	sd	s2,48(sp)
    80200d3a:	f44e                	sd	s3,40(sp)
    80200d3c:	f052                	sd	s4,32(sp)
    80200d3e:	ec56                	sd	s5,24(sp)
    80200d40:	e85a                	sd	s6,16(sp)
    80200d42:	e45e                	sd	s7,8(sp)
    80200d44:	0880                	addi	s0,sp,80
    80200d46:	8aaa                	mv	s5,a0
    80200d48:	8b3a                	mv	s6,a4
  uint64 a, last;
  pte_t *pte;

  a = PGROUNDDOWN(va);
    80200d4a:	777d                	lui	a4,0xfffff
    80200d4c:	00e5f7b3          	and	a5,a1,a4
  last = PGROUNDDOWN(va + size - 1);
    80200d50:	167d                	addi	a2,a2,-1
    80200d52:	00b609b3          	add	s3,a2,a1
    80200d56:	00e9f9b3          	and	s3,s3,a4
  a = PGROUNDDOWN(va);
    80200d5a:	893e                	mv	s2,a5
    80200d5c:	40f68a33          	sub	s4,a3,a5
    if(*pte & PTE_V)
      panic("remap");
    *pte = PA2PTE(pa) | perm | PTE_V;
    if(a == last)
      break;
    a += PGSIZE;
    80200d60:	6b85                	lui	s7,0x1
    80200d62:	012a04b3          	add	s1,s4,s2
    if((pte = walk(pagetable, a, 1)) == NULL)
    80200d66:	4605                	li	a2,1
    80200d68:	85ca                	mv	a1,s2
    80200d6a:	8556                	mv	a0,s5
    80200d6c:	00000097          	auipc	ra,0x0
    80200d70:	e64080e7          	jalr	-412(ra) # 80200bd0 <walk>
    80200d74:	c51d                	beqz	a0,80200da2 <mappages+0x72>
    if(*pte & PTE_V)
    80200d76:	611c                	ld	a5,0(a0)
    80200d78:	8b85                	andi	a5,a5,1
    80200d7a:	ef81                	bnez	a5,80200d92 <mappages+0x62>
    *pte = PA2PTE(pa) | perm | PTE_V;
    80200d7c:	80b1                	srli	s1,s1,0xc
    80200d7e:	04aa                	slli	s1,s1,0xa
    80200d80:	0164e4b3          	or	s1,s1,s6
    80200d84:	0014e493          	ori	s1,s1,1
    80200d88:	e104                	sd	s1,0(a0)
    if(a == last)
    80200d8a:	03390863          	beq	s2,s3,80200dba <mappages+0x8a>
    a += PGSIZE;
    80200d8e:	995e                	add	s2,s2,s7
    if((pte = walk(pagetable, a, 1)) == NULL)
    80200d90:	bfc9                	j	80200d62 <mappages+0x32>
      panic("remap");
    80200d92:	00008517          	auipc	a0,0x8
    80200d96:	6d650513          	addi	a0,a0,1750 # 80209468 <digits+0xe8>
    80200d9a:	fffff097          	auipc	ra,0xfffff
    80200d9e:	3aa080e7          	jalr	938(ra) # 80200144 <panic>
      return -1;
    80200da2:	557d                	li	a0,-1
    pa += PGSIZE;
  }
  return 0;
}
    80200da4:	60a6                	ld	ra,72(sp)
    80200da6:	6406                	ld	s0,64(sp)
    80200da8:	74e2                	ld	s1,56(sp)
    80200daa:	7942                	ld	s2,48(sp)
    80200dac:	79a2                	ld	s3,40(sp)
    80200dae:	7a02                	ld	s4,32(sp)
    80200db0:	6ae2                	ld	s5,24(sp)
    80200db2:	6b42                	ld	s6,16(sp)
    80200db4:	6ba2                	ld	s7,8(sp)
    80200db6:	6161                	addi	sp,sp,80
    80200db8:	8082                	ret
  return 0;
    80200dba:	4501                	li	a0,0
    80200dbc:	b7e5                	j	80200da4 <mappages+0x74>

0000000080200dbe <kvmmap>:
{
    80200dbe:	1141                	addi	sp,sp,-16
    80200dc0:	e406                	sd	ra,8(sp)
    80200dc2:	e022                	sd	s0,0(sp)
    80200dc4:	0800                	addi	s0,sp,16
    80200dc6:	8736                	mv	a4,a3
  if(mappages(kernel_pagetable, va, sz, pa, perm) != 0)
    80200dc8:	86ae                	mv	a3,a1
    80200dca:	85aa                	mv	a1,a0
    80200dcc:	000aa517          	auipc	a0,0xaa
    80200dd0:	29c53503          	ld	a0,668(a0) # 802ab068 <kernel_pagetable>
    80200dd4:	00000097          	auipc	ra,0x0
    80200dd8:	f5c080e7          	jalr	-164(ra) # 80200d30 <mappages>
    80200ddc:	e509                	bnez	a0,80200de6 <kvmmap+0x28>
}
    80200dde:	60a2                	ld	ra,8(sp)
    80200de0:	6402                	ld	s0,0(sp)
    80200de2:	0141                	addi	sp,sp,16
    80200de4:	8082                	ret
    panic("kvmmap");
    80200de6:	00008517          	auipc	a0,0x8
    80200dea:	68a50513          	addi	a0,a0,1674 # 80209470 <digits+0xf0>
    80200dee:	fffff097          	auipc	ra,0xfffff
    80200df2:	356080e7          	jalr	854(ra) # 80200144 <panic>

0000000080200df6 <kvminit>:
{
    80200df6:	1101                	addi	sp,sp,-32
    80200df8:	ec06                	sd	ra,24(sp)
    80200dfa:	e822                	sd	s0,16(sp)
    80200dfc:	e426                	sd	s1,8(sp)
    80200dfe:	1000                	addi	s0,sp,32
  kernel_pagetable = (pagetable_t) kalloc();
    80200e00:	fffff097          	auipc	ra,0xfffff
    80200e04:	788080e7          	jalr	1928(ra) # 80200588 <kalloc>
    80200e08:	000aa797          	auipc	a5,0xaa
    80200e0c:	26a7b023          	sd	a0,608(a5) # 802ab068 <kernel_pagetable>
  memset(kernel_pagetable, 0, PGSIZE);
    80200e10:	6605                	lui	a2,0x1
    80200e12:	4581                	li	a1,0
    80200e14:	00000097          	auipc	ra,0x0
    80200e18:	97c080e7          	jalr	-1668(ra) # 80200790 <memset>
  kvmmap(UART0_V, UART0, PGSIZE, PTE_R | PTE_W);
    80200e1c:	4699                	li	a3,6
    80200e1e:	6605                	lui	a2,0x1
    80200e20:	100005b7          	lui	a1,0x10000
    80200e24:	3f100513          	li	a0,1009
    80200e28:	0572                	slli	a0,a0,0x1c
    80200e2a:	00000097          	auipc	ra,0x0
    80200e2e:	f94080e7          	jalr	-108(ra) # 80200dbe <kvmmap>
  kvmmap(VIRTIO0_V, VIRTIO0, PGSIZE, PTE_R | PTE_W);
    80200e32:	4699                	li	a3,6
    80200e34:	6605                	lui	a2,0x1
    80200e36:	100015b7          	lui	a1,0x10001
    80200e3a:	03f10537          	lui	a0,0x3f10
    80200e3e:	0505                	addi	a0,a0,1
    80200e40:	0532                	slli	a0,a0,0xc
    80200e42:	00000097          	auipc	ra,0x0
    80200e46:	f7c080e7          	jalr	-132(ra) # 80200dbe <kvmmap>
  kvmmap(CLINT_V, CLINT, 0x10000, PTE_R | PTE_W);
    80200e4a:	4699                	li	a3,6
    80200e4c:	6641                	lui	a2,0x10
    80200e4e:	020005b7          	lui	a1,0x2000
    80200e52:	01f81537          	lui	a0,0x1f81
    80200e56:	0536                	slli	a0,a0,0xd
    80200e58:	00000097          	auipc	ra,0x0
    80200e5c:	f66080e7          	jalr	-154(ra) # 80200dbe <kvmmap>
  kvmmap(PLIC_V, PLIC, 0x400000, PTE_R | PTE_W);
    80200e60:	4699                	li	a3,6
    80200e62:	00400637          	lui	a2,0x400
    80200e66:	0c0005b7          	lui	a1,0xc000
    80200e6a:	00fc3537          	lui	a0,0xfc3
    80200e6e:	053a                	slli	a0,a0,0xe
    80200e70:	00000097          	auipc	ra,0x0
    80200e74:	f4e080e7          	jalr	-178(ra) # 80200dbe <kvmmap>
  kvmmap(KERNBASE, KERNBASE, (uint64)etext - KERNBASE, PTE_R | PTE_X);
    80200e78:	00008497          	auipc	s1,0x8
    80200e7c:	18848493          	addi	s1,s1,392 # 80209000 <etext>
    80200e80:	46a9                	li	a3,10
    80200e82:	bff00613          	li	a2,-1025
    80200e86:	0656                	slli	a2,a2,0x15
    80200e88:	9626                	add	a2,a2,s1
    80200e8a:	40100593          	li	a1,1025
    80200e8e:	05d6                	slli	a1,a1,0x15
    80200e90:	852e                	mv	a0,a1
    80200e92:	00000097          	auipc	ra,0x0
    80200e96:	f2c080e7          	jalr	-212(ra) # 80200dbe <kvmmap>
  kvmmap((uint64)etext, (uint64)etext, PHYSTOP - (uint64)etext, PTE_R | PTE_W);
    80200e9a:	4699                	li	a3,6
    80200e9c:	4645                	li	a2,17
    80200e9e:	066e                	slli	a2,a2,0x1b
    80200ea0:	8e05                	sub	a2,a2,s1
    80200ea2:	85a6                	mv	a1,s1
    80200ea4:	8526                	mv	a0,s1
    80200ea6:	00000097          	auipc	ra,0x0
    80200eaa:	f18080e7          	jalr	-232(ra) # 80200dbe <kvmmap>
  kvmmap(TRAMPOLINE, (uint64)trampoline, PGSIZE, PTE_R | PTE_X);
    80200eae:	46a9                	li	a3,10
    80200eb0:	6605                	lui	a2,0x1
    80200eb2:	00007597          	auipc	a1,0x7
    80200eb6:	14e58593          	addi	a1,a1,334 # 80208000 <_trampoline>
    80200eba:	04000537          	lui	a0,0x4000
    80200ebe:	157d                	addi	a0,a0,-1
    80200ec0:	0532                	slli	a0,a0,0xc
    80200ec2:	00000097          	auipc	ra,0x0
    80200ec6:	efc080e7          	jalr	-260(ra) # 80200dbe <kvmmap>
  printf("kvminit\n");
    80200eca:	00008517          	auipc	a0,0x8
    80200ece:	5ae50513          	addi	a0,a0,1454 # 80209478 <digits+0xf8>
    80200ed2:	fffff097          	auipc	ra,0xfffff
    80200ed6:	2bc080e7          	jalr	700(ra) # 8020018e <printf>
}
    80200eda:	60e2                	ld	ra,24(sp)
    80200edc:	6442                	ld	s0,16(sp)
    80200ede:	64a2                	ld	s1,8(sp)
    80200ee0:	6105                	addi	sp,sp,32
    80200ee2:	8082                	ret

0000000080200ee4 <vmunmap>:
// Remove npages of mappings starting from va. va must be
// page-aligned. The mappings must exist.
// Optionally free the physical memory.
void
vmunmap(pagetable_t pagetable, uint64 va, uint64 npages, int do_free)
{
    80200ee4:	715d                	addi	sp,sp,-80
    80200ee6:	e486                	sd	ra,72(sp)
    80200ee8:	e0a2                	sd	s0,64(sp)
    80200eea:	fc26                	sd	s1,56(sp)
    80200eec:	f84a                	sd	s2,48(sp)
    80200eee:	f44e                	sd	s3,40(sp)
    80200ef0:	f052                	sd	s4,32(sp)
    80200ef2:	ec56                	sd	s5,24(sp)
    80200ef4:	e85a                	sd	s6,16(sp)
    80200ef6:	e45e                	sd	s7,8(sp)
    80200ef8:	0880                	addi	s0,sp,80
  uint64 a;
  pte_t *pte;

  if((va % PGSIZE) != 0)
    80200efa:	03459793          	slli	a5,a1,0x34
    80200efe:	e795                	bnez	a5,80200f2a <vmunmap+0x46>
    80200f00:	8a2a                	mv	s4,a0
    80200f02:	892e                	mv	s2,a1
    80200f04:	8ab6                	mv	s5,a3
    panic("vmunmap: not aligned");

  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80200f06:	0632                	slli	a2,a2,0xc
    80200f08:	00b609b3          	add	s3,a2,a1
    if((pte = walk(pagetable, a, 0)) == 0)
      panic("vmunmap: walk");
    if((*pte & PTE_V) == 0)
      panic("vmunmap: not mapped");
    if(PTE_FLAGS(*pte) == PTE_V)
    80200f0c:	4b85                	li	s7,1
  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80200f0e:	6b05                	lui	s6,0x1
    80200f10:	0735e863          	bltu	a1,s3,80200f80 <vmunmap+0x9c>
      uint64 pa = PTE2PA(*pte);
      kfree((void*)pa);
    }
    *pte = 0;
  }
}
    80200f14:	60a6                	ld	ra,72(sp)
    80200f16:	6406                	ld	s0,64(sp)
    80200f18:	74e2                	ld	s1,56(sp)
    80200f1a:	7942                	ld	s2,48(sp)
    80200f1c:	79a2                	ld	s3,40(sp)
    80200f1e:	7a02                	ld	s4,32(sp)
    80200f20:	6ae2                	ld	s5,24(sp)
    80200f22:	6b42                	ld	s6,16(sp)
    80200f24:	6ba2                	ld	s7,8(sp)
    80200f26:	6161                	addi	sp,sp,80
    80200f28:	8082                	ret
    panic("vmunmap: not aligned");
    80200f2a:	00008517          	auipc	a0,0x8
    80200f2e:	55e50513          	addi	a0,a0,1374 # 80209488 <digits+0x108>
    80200f32:	fffff097          	auipc	ra,0xfffff
    80200f36:	212080e7          	jalr	530(ra) # 80200144 <panic>
      panic("vmunmap: walk");
    80200f3a:	00008517          	auipc	a0,0x8
    80200f3e:	56650513          	addi	a0,a0,1382 # 802094a0 <digits+0x120>
    80200f42:	fffff097          	auipc	ra,0xfffff
    80200f46:	202080e7          	jalr	514(ra) # 80200144 <panic>
      panic("vmunmap: not mapped");
    80200f4a:	00008517          	auipc	a0,0x8
    80200f4e:	56650513          	addi	a0,a0,1382 # 802094b0 <digits+0x130>
    80200f52:	fffff097          	auipc	ra,0xfffff
    80200f56:	1f2080e7          	jalr	498(ra) # 80200144 <panic>
      panic("vmunmap: not a leaf");
    80200f5a:	00008517          	auipc	a0,0x8
    80200f5e:	56e50513          	addi	a0,a0,1390 # 802094c8 <digits+0x148>
    80200f62:	fffff097          	auipc	ra,0xfffff
    80200f66:	1e2080e7          	jalr	482(ra) # 80200144 <panic>
      uint64 pa = PTE2PA(*pte);
    80200f6a:	8129                	srli	a0,a0,0xa
      kfree((void*)pa);
    80200f6c:	0532                	slli	a0,a0,0xc
    80200f6e:	fffff097          	auipc	ra,0xfffff
    80200f72:	4d8080e7          	jalr	1240(ra) # 80200446 <kfree>
    *pte = 0;
    80200f76:	0004b023          	sd	zero,0(s1)
  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80200f7a:	995a                	add	s2,s2,s6
    80200f7c:	f9397ce3          	bgeu	s2,s3,80200f14 <vmunmap+0x30>
    if((pte = walk(pagetable, a, 0)) == 0)
    80200f80:	4601                	li	a2,0
    80200f82:	85ca                	mv	a1,s2
    80200f84:	8552                	mv	a0,s4
    80200f86:	00000097          	auipc	ra,0x0
    80200f8a:	c4a080e7          	jalr	-950(ra) # 80200bd0 <walk>
    80200f8e:	84aa                	mv	s1,a0
    80200f90:	d54d                	beqz	a0,80200f3a <vmunmap+0x56>
    if((*pte & PTE_V) == 0)
    80200f92:	6108                	ld	a0,0(a0)
    80200f94:	00157793          	andi	a5,a0,1
    80200f98:	dbcd                	beqz	a5,80200f4a <vmunmap+0x66>
    if(PTE_FLAGS(*pte) == PTE_V)
    80200f9a:	3ff57793          	andi	a5,a0,1023
    80200f9e:	fb778ee3          	beq	a5,s7,80200f5a <vmunmap+0x76>
    if(do_free){
    80200fa2:	fc0a8ae3          	beqz	s5,80200f76 <vmunmap+0x92>
    80200fa6:	b7d1                	j	80200f6a <vmunmap+0x86>

0000000080200fa8 <uvmcreate>:

// create an empty user page table.
// returns 0 if out of memory.
pagetable_t
uvmcreate()
{
    80200fa8:	1101                	addi	sp,sp,-32
    80200faa:	ec06                	sd	ra,24(sp)
    80200fac:	e822                	sd	s0,16(sp)
    80200fae:	e426                	sd	s1,8(sp)
    80200fb0:	1000                	addi	s0,sp,32
  pagetable_t pagetable;
  pagetable = (pagetable_t) kalloc();
    80200fb2:	fffff097          	auipc	ra,0xfffff
    80200fb6:	5d6080e7          	jalr	1494(ra) # 80200588 <kalloc>
    80200fba:	84aa                	mv	s1,a0
  if(pagetable == NULL)
    80200fbc:	c519                	beqz	a0,80200fca <uvmcreate+0x22>
    return NULL;
  memset(pagetable, 0, PGSIZE);
    80200fbe:	6605                	lui	a2,0x1
    80200fc0:	4581                	li	a1,0
    80200fc2:	fffff097          	auipc	ra,0xfffff
    80200fc6:	7ce080e7          	jalr	1998(ra) # 80200790 <memset>
  return pagetable;
}
    80200fca:	8526                	mv	a0,s1
    80200fcc:	60e2                	ld	ra,24(sp)
    80200fce:	6442                	ld	s0,16(sp)
    80200fd0:	64a2                	ld	s1,8(sp)
    80200fd2:	6105                	addi	sp,sp,32
    80200fd4:	8082                	ret

0000000080200fd6 <uvminit>:
// Load the user initcode into address 0 of pagetable,
// for the very first process.
// sz must be less than a page.
void
uvminit(pagetable_t pagetable, pagetable_t kpagetable, uchar *src, uint sz)
{
    80200fd6:	7139                	addi	sp,sp,-64
    80200fd8:	fc06                	sd	ra,56(sp)
    80200fda:	f822                	sd	s0,48(sp)
    80200fdc:	f426                	sd	s1,40(sp)
    80200fde:	f04a                	sd	s2,32(sp)
    80200fe0:	ec4e                	sd	s3,24(sp)
    80200fe2:	e852                	sd	s4,16(sp)
    80200fe4:	e456                	sd	s5,8(sp)
    80200fe6:	0080                	addi	s0,sp,64
  char *mem;

  if(sz >= PGSIZE)
    80200fe8:	6785                	lui	a5,0x1
    80200fea:	06f6f363          	bgeu	a3,a5,80201050 <uvminit+0x7a>
    80200fee:	8aaa                	mv	s5,a0
    80200ff0:	8a2e                	mv	s4,a1
    80200ff2:	89b2                	mv	s3,a2
    80200ff4:	8936                	mv	s2,a3
    panic("inituvm: more than a page");
  mem = kalloc();
    80200ff6:	fffff097          	auipc	ra,0xfffff
    80200ffa:	592080e7          	jalr	1426(ra) # 80200588 <kalloc>
    80200ffe:	84aa                	mv	s1,a0
  // printf("[uvminit]kalloc: %p\n", mem);
  memset(mem, 0, PGSIZE);
    80201000:	6605                	lui	a2,0x1
    80201002:	4581                	li	a1,0
    80201004:	fffff097          	auipc	ra,0xfffff
    80201008:	78c080e7          	jalr	1932(ra) # 80200790 <memset>
  mappages(pagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X|PTE_U);
    8020100c:	4779                	li	a4,30
    8020100e:	86a6                	mv	a3,s1
    80201010:	6605                	lui	a2,0x1
    80201012:	4581                	li	a1,0
    80201014:	8556                	mv	a0,s5
    80201016:	00000097          	auipc	ra,0x0
    8020101a:	d1a080e7          	jalr	-742(ra) # 80200d30 <mappages>
  mappages(kpagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X);
    8020101e:	4739                	li	a4,14
    80201020:	86a6                	mv	a3,s1
    80201022:	6605                	lui	a2,0x1
    80201024:	4581                	li	a1,0
    80201026:	8552                	mv	a0,s4
    80201028:	00000097          	auipc	ra,0x0
    8020102c:	d08080e7          	jalr	-760(ra) # 80200d30 <mappages>
  memmove(mem, src, sz);
    80201030:	864a                	mv	a2,s2
    80201032:	85ce                	mv	a1,s3
    80201034:	8526                	mv	a0,s1
    80201036:	fffff097          	auipc	ra,0xfffff
    8020103a:	7ba080e7          	jalr	1978(ra) # 802007f0 <memmove>
  // for (int i = 0; i < sz; i ++) {
  //   printf("[uvminit]mem: %p, %x\n", mem + i, mem[i]);
  // }
}
    8020103e:	70e2                	ld	ra,56(sp)
    80201040:	7442                	ld	s0,48(sp)
    80201042:	74a2                	ld	s1,40(sp)
    80201044:	7902                	ld	s2,32(sp)
    80201046:	69e2                	ld	s3,24(sp)
    80201048:	6a42                	ld	s4,16(sp)
    8020104a:	6aa2                	ld	s5,8(sp)
    8020104c:	6121                	addi	sp,sp,64
    8020104e:	8082                	ret
    panic("inituvm: more than a page");
    80201050:	00008517          	auipc	a0,0x8
    80201054:	49050513          	addi	a0,a0,1168 # 802094e0 <digits+0x160>
    80201058:	fffff097          	auipc	ra,0xfffff
    8020105c:	0ec080e7          	jalr	236(ra) # 80200144 <panic>

0000000080201060 <uvmdealloc>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
uint64
uvmdealloc(pagetable_t pagetable, pagetable_t kpagetable, uint64 oldsz, uint64 newsz)
{
    80201060:	7179                	addi	sp,sp,-48
    80201062:	f406                	sd	ra,40(sp)
    80201064:	f022                	sd	s0,32(sp)
    80201066:	ec26                	sd	s1,24(sp)
    80201068:	e84a                	sd	s2,16(sp)
    8020106a:	e44e                	sd	s3,8(sp)
    8020106c:	e052                	sd	s4,0(sp)
    8020106e:	1800                	addi	s0,sp,48
  if(newsz >= oldsz)
    return oldsz;
    80201070:	8932                	mv	s2,a2
  if(newsz >= oldsz)
    80201072:	02c6f063          	bgeu	a3,a2,80201092 <uvmdealloc+0x32>
    80201076:	89aa                	mv	s3,a0
    80201078:	852e                	mv	a0,a1
    8020107a:	8936                	mv	s2,a3

  if(PGROUNDUP(newsz) < PGROUNDUP(oldsz)){
    8020107c:	6785                	lui	a5,0x1
    8020107e:	17fd                	addi	a5,a5,-1
    80201080:	00f68a33          	add	s4,a3,a5
    80201084:	777d                	lui	a4,0xfffff
    80201086:	00ea7a33          	and	s4,s4,a4
    8020108a:	963e                	add	a2,a2,a5
    8020108c:	8e79                	and	a2,a2,a4
    8020108e:	00ca6b63          	bltu	s4,a2,802010a4 <uvmdealloc+0x44>
    vmunmap(kpagetable, PGROUNDUP(newsz), npages, 0);
    vmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
  }

  return newsz;
}
    80201092:	854a                	mv	a0,s2
    80201094:	70a2                	ld	ra,40(sp)
    80201096:	7402                	ld	s0,32(sp)
    80201098:	64e2                	ld	s1,24(sp)
    8020109a:	6942                	ld	s2,16(sp)
    8020109c:	69a2                	ld	s3,8(sp)
    8020109e:	6a02                	ld	s4,0(sp)
    802010a0:	6145                	addi	sp,sp,48
    802010a2:	8082                	ret
    int npages = (PGROUNDUP(oldsz) - PGROUNDUP(newsz)) / PGSIZE;
    802010a4:	414604b3          	sub	s1,a2,s4
    802010a8:	80b1                	srli	s1,s1,0xc
    vmunmap(kpagetable, PGROUNDUP(newsz), npages, 0);
    802010aa:	2481                	sext.w	s1,s1
    802010ac:	4681                	li	a3,0
    802010ae:	8626                	mv	a2,s1
    802010b0:	85d2                	mv	a1,s4
    802010b2:	00000097          	auipc	ra,0x0
    802010b6:	e32080e7          	jalr	-462(ra) # 80200ee4 <vmunmap>
    vmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
    802010ba:	4685                	li	a3,1
    802010bc:	8626                	mv	a2,s1
    802010be:	85d2                	mv	a1,s4
    802010c0:	854e                	mv	a0,s3
    802010c2:	00000097          	auipc	ra,0x0
    802010c6:	e22080e7          	jalr	-478(ra) # 80200ee4 <vmunmap>
    802010ca:	b7e1                	j	80201092 <uvmdealloc+0x32>

00000000802010cc <uvmalloc>:
  if(newsz < oldsz)
    802010cc:	0ec6e763          	bltu	a3,a2,802011ba <uvmalloc+0xee>
{
    802010d0:	7139                	addi	sp,sp,-64
    802010d2:	fc06                	sd	ra,56(sp)
    802010d4:	f822                	sd	s0,48(sp)
    802010d6:	f426                	sd	s1,40(sp)
    802010d8:	f04a                	sd	s2,32(sp)
    802010da:	ec4e                	sd	s3,24(sp)
    802010dc:	e852                	sd	s4,16(sp)
    802010de:	e456                	sd	s5,8(sp)
    802010e0:	e05a                	sd	s6,0(sp)
    802010e2:	0080                	addi	s0,sp,64
    802010e4:	8a2a                	mv	s4,a0
    802010e6:	8aae                	mv	s5,a1
    802010e8:	8b36                	mv	s6,a3
  oldsz = PGROUNDUP(oldsz);
    802010ea:	6985                	lui	s3,0x1
    802010ec:	19fd                	addi	s3,s3,-1
    802010ee:	964e                	add	a2,a2,s3
    802010f0:	79fd                	lui	s3,0xfffff
    802010f2:	013679b3          	and	s3,a2,s3
  for(a = oldsz; a < newsz; a += PGSIZE){
    802010f6:	0cd9f463          	bgeu	s3,a3,802011be <uvmalloc+0xf2>
    802010fa:	894e                	mv	s2,s3
    mem = kalloc();
    802010fc:	fffff097          	auipc	ra,0xfffff
    80201100:	48c080e7          	jalr	1164(ra) # 80200588 <kalloc>
    80201104:	84aa                	mv	s1,a0
    if(mem == NULL){
    80201106:	c129                	beqz	a0,80201148 <uvmalloc+0x7c>
    memset(mem, 0, PGSIZE);
    80201108:	6605                	lui	a2,0x1
    8020110a:	4581                	li	a1,0
    8020110c:	fffff097          	auipc	ra,0xfffff
    80201110:	684080e7          	jalr	1668(ra) # 80200790 <memset>
    if (mappages(pagetable, a, PGSIZE, (uint64)mem, PTE_W|PTE_X|PTE_R|PTE_U) != 0) {
    80201114:	4779                	li	a4,30
    80201116:	86a6                	mv	a3,s1
    80201118:	6605                	lui	a2,0x1
    8020111a:	85ca                	mv	a1,s2
    8020111c:	8552                	mv	a0,s4
    8020111e:	00000097          	auipc	ra,0x0
    80201122:	c12080e7          	jalr	-1006(ra) # 80200d30 <mappages>
    80201126:	e521                	bnez	a0,8020116e <uvmalloc+0xa2>
    if (mappages(kpagetable, a, PGSIZE, (uint64)mem, PTE_W|PTE_X|PTE_R) != 0){
    80201128:	4739                	li	a4,14
    8020112a:	86a6                	mv	a3,s1
    8020112c:	6605                	lui	a2,0x1
    8020112e:	85ca                	mv	a1,s2
    80201130:	8556                	mv	a0,s5
    80201132:	00000097          	auipc	ra,0x0
    80201136:	bfe080e7          	jalr	-1026(ra) # 80200d30 <mappages>
    8020113a:	e929                	bnez	a0,8020118c <uvmalloc+0xc0>
  for(a = oldsz; a < newsz; a += PGSIZE){
    8020113c:	6785                	lui	a5,0x1
    8020113e:	993e                	add	s2,s2,a5
    80201140:	fb696ee3          	bltu	s2,s6,802010fc <uvmalloc+0x30>
  return newsz;
    80201144:	855a                	mv	a0,s6
    80201146:	a811                	j	8020115a <uvmalloc+0x8e>
      uvmdealloc(pagetable, kpagetable, a, oldsz);
    80201148:	86ce                	mv	a3,s3
    8020114a:	864a                	mv	a2,s2
    8020114c:	85d6                	mv	a1,s5
    8020114e:	8552                	mv	a0,s4
    80201150:	00000097          	auipc	ra,0x0
    80201154:	f10080e7          	jalr	-240(ra) # 80201060 <uvmdealloc>
      return 0;
    80201158:	4501                	li	a0,0
}
    8020115a:	70e2                	ld	ra,56(sp)
    8020115c:	7442                	ld	s0,48(sp)
    8020115e:	74a2                	ld	s1,40(sp)
    80201160:	7902                	ld	s2,32(sp)
    80201162:	69e2                	ld	s3,24(sp)
    80201164:	6a42                	ld	s4,16(sp)
    80201166:	6aa2                	ld	s5,8(sp)
    80201168:	6b02                	ld	s6,0(sp)
    8020116a:	6121                	addi	sp,sp,64
    8020116c:	8082                	ret
      kfree(mem);
    8020116e:	8526                	mv	a0,s1
    80201170:	fffff097          	auipc	ra,0xfffff
    80201174:	2d6080e7          	jalr	726(ra) # 80200446 <kfree>
      uvmdealloc(pagetable, kpagetable, a, oldsz);
    80201178:	86ce                	mv	a3,s3
    8020117a:	864a                	mv	a2,s2
    8020117c:	85d6                	mv	a1,s5
    8020117e:	8552                	mv	a0,s4
    80201180:	00000097          	auipc	ra,0x0
    80201184:	ee0080e7          	jalr	-288(ra) # 80201060 <uvmdealloc>
      return 0;
    80201188:	4501                	li	a0,0
    8020118a:	bfc1                	j	8020115a <uvmalloc+0x8e>
      int npages = (a - oldsz) / PGSIZE;
    8020118c:	41390633          	sub	a2,s2,s3
    80201190:	8231                	srli	a2,a2,0xc
    80201192:	0006049b          	sext.w	s1,a2
      vmunmap(pagetable, oldsz, npages + 1, 1);   // plus the page allocated above.
    80201196:	4685                	li	a3,1
    80201198:	2605                	addiw	a2,a2,1
    8020119a:	85ce                	mv	a1,s3
    8020119c:	8552                	mv	a0,s4
    8020119e:	00000097          	auipc	ra,0x0
    802011a2:	d46080e7          	jalr	-698(ra) # 80200ee4 <vmunmap>
      vmunmap(kpagetable, oldsz, npages, 0);
    802011a6:	4681                	li	a3,0
    802011a8:	8626                	mv	a2,s1
    802011aa:	85ce                	mv	a1,s3
    802011ac:	8556                	mv	a0,s5
    802011ae:	00000097          	auipc	ra,0x0
    802011b2:	d36080e7          	jalr	-714(ra) # 80200ee4 <vmunmap>
      return 0;
    802011b6:	4501                	li	a0,0
    802011b8:	b74d                	j	8020115a <uvmalloc+0x8e>
    return oldsz;
    802011ba:	8532                	mv	a0,a2
}
    802011bc:	8082                	ret
  return newsz;
    802011be:	8536                	mv	a0,a3
    802011c0:	bf69                	j	8020115a <uvmalloc+0x8e>

00000000802011c2 <freewalk>:

// Recursively free page-table pages.
// All leaf mappings must already have been removed.
void
freewalk(pagetable_t pagetable)
{
    802011c2:	7179                	addi	sp,sp,-48
    802011c4:	f406                	sd	ra,40(sp)
    802011c6:	f022                	sd	s0,32(sp)
    802011c8:	ec26                	sd	s1,24(sp)
    802011ca:	e84a                	sd	s2,16(sp)
    802011cc:	e44e                	sd	s3,8(sp)
    802011ce:	e052                	sd	s4,0(sp)
    802011d0:	1800                	addi	s0,sp,48
    802011d2:	8a2a                	mv	s4,a0
  // there are 2^9 = 512 PTEs in a page table.
  for(int i = 0; i < 512; i++){
    802011d4:	84aa                	mv	s1,a0
    802011d6:	6905                	lui	s2,0x1
    802011d8:	992a                	add	s2,s2,a0
    pte_t pte = pagetable[i];
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    802011da:	4985                	li	s3,1
    802011dc:	a821                	j	802011f4 <freewalk+0x32>
      // this PTE points to a lower-level page table.
      uint64 child = PTE2PA(pte);
    802011de:	8129                	srli	a0,a0,0xa
      freewalk((pagetable_t)child);
    802011e0:	0532                	slli	a0,a0,0xc
    802011e2:	00000097          	auipc	ra,0x0
    802011e6:	fe0080e7          	jalr	-32(ra) # 802011c2 <freewalk>
      pagetable[i] = 0;
    802011ea:	0004b023          	sd	zero,0(s1)
  for(int i = 0; i < 512; i++){
    802011ee:	04a1                	addi	s1,s1,8
    802011f0:	03248163          	beq	s1,s2,80201212 <freewalk+0x50>
    pte_t pte = pagetable[i];
    802011f4:	6088                	ld	a0,0(s1)
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    802011f6:	00f57793          	andi	a5,a0,15
    802011fa:	ff3782e3          	beq	a5,s3,802011de <freewalk+0x1c>
    } else if(pte & PTE_V){
    802011fe:	8905                	andi	a0,a0,1
    80201200:	d57d                	beqz	a0,802011ee <freewalk+0x2c>
      panic("freewalk: leaf");
    80201202:	00008517          	auipc	a0,0x8
    80201206:	2fe50513          	addi	a0,a0,766 # 80209500 <digits+0x180>
    8020120a:	fffff097          	auipc	ra,0xfffff
    8020120e:	f3a080e7          	jalr	-198(ra) # 80200144 <panic>
    }
  }
  kfree((void*)pagetable);
    80201212:	8552                	mv	a0,s4
    80201214:	fffff097          	auipc	ra,0xfffff
    80201218:	232080e7          	jalr	562(ra) # 80200446 <kfree>
}
    8020121c:	70a2                	ld	ra,40(sp)
    8020121e:	7402                	ld	s0,32(sp)
    80201220:	64e2                	ld	s1,24(sp)
    80201222:	6942                	ld	s2,16(sp)
    80201224:	69a2                	ld	s3,8(sp)
    80201226:	6a02                	ld	s4,0(sp)
    80201228:	6145                	addi	sp,sp,48
    8020122a:	8082                	ret

000000008020122c <uvmfree>:

// Free user memory pages,
// then free page-table pages.
void
uvmfree(pagetable_t pagetable, uint64 sz)
{
    8020122c:	1101                	addi	sp,sp,-32
    8020122e:	ec06                	sd	ra,24(sp)
    80201230:	e822                	sd	s0,16(sp)
    80201232:	e426                	sd	s1,8(sp)
    80201234:	1000                	addi	s0,sp,32
    80201236:	84aa                	mv	s1,a0
  if(sz > 0)
    80201238:	e999                	bnez	a1,8020124e <uvmfree+0x22>
    vmunmap(pagetable, 0, PGROUNDUP(sz)/PGSIZE, 1);
  freewalk(pagetable);
    8020123a:	8526                	mv	a0,s1
    8020123c:	00000097          	auipc	ra,0x0
    80201240:	f86080e7          	jalr	-122(ra) # 802011c2 <freewalk>
}
    80201244:	60e2                	ld	ra,24(sp)
    80201246:	6442                	ld	s0,16(sp)
    80201248:	64a2                	ld	s1,8(sp)
    8020124a:	6105                	addi	sp,sp,32
    8020124c:	8082                	ret
    vmunmap(pagetable, 0, PGROUNDUP(sz)/PGSIZE, 1);
    8020124e:	6605                	lui	a2,0x1
    80201250:	167d                	addi	a2,a2,-1
    80201252:	962e                	add	a2,a2,a1
    80201254:	4685                	li	a3,1
    80201256:	8231                	srli	a2,a2,0xc
    80201258:	4581                	li	a1,0
    8020125a:	00000097          	auipc	ra,0x0
    8020125e:	c8a080e7          	jalr	-886(ra) # 80200ee4 <vmunmap>
    80201262:	bfe1                	j	8020123a <uvmfree+0xe>

0000000080201264 <uvmcopy>:
  pte_t *pte;
  uint64 pa, i = 0, ki = 0;
  uint flags;
  char *mem;

  while (i < sz){
    80201264:	10068563          	beqz	a3,8020136e <uvmcopy+0x10a>
{
    80201268:	715d                	addi	sp,sp,-80
    8020126a:	e486                	sd	ra,72(sp)
    8020126c:	e0a2                	sd	s0,64(sp)
    8020126e:	fc26                	sd	s1,56(sp)
    80201270:	f84a                	sd	s2,48(sp)
    80201272:	f44e                	sd	s3,40(sp)
    80201274:	f052                	sd	s4,32(sp)
    80201276:	ec56                	sd	s5,24(sp)
    80201278:	e85a                	sd	s6,16(sp)
    8020127a:	e45e                	sd	s7,8(sp)
    8020127c:	e062                	sd	s8,0(sp)
    8020127e:	0880                	addi	s0,sp,80
    80201280:	8baa                	mv	s7,a0
    80201282:	8a2e                	mv	s4,a1
    80201284:	8b32                	mv	s6,a2
    80201286:	8ab6                	mv	s5,a3
  uint64 pa, i = 0, ki = 0;
    80201288:	4981                	li	s3,0
    8020128a:	a011                	j	8020128e <uvmcopy+0x2a>
    memmove(mem, (char*)pa, PGSIZE);
    if(mappages(new, i, PGSIZE, (uint64)mem, flags) != 0) {
      kfree(mem);
      goto err;
    }
    i += PGSIZE;
    8020128c:	89e2                	mv	s3,s8
    if((pte = walk(old, i, 0)) == NULL)
    8020128e:	4601                	li	a2,0
    80201290:	85ce                	mv	a1,s3
    80201292:	855e                	mv	a0,s7
    80201294:	00000097          	auipc	ra,0x0
    80201298:	93c080e7          	jalr	-1732(ra) # 80200bd0 <walk>
    8020129c:	c135                	beqz	a0,80201300 <uvmcopy+0x9c>
    if((*pte & PTE_V) == 0)
    8020129e:	6118                	ld	a4,0(a0)
    802012a0:	00177793          	andi	a5,a4,1
    802012a4:	c7b5                	beqz	a5,80201310 <uvmcopy+0xac>
    pa = PTE2PA(*pte);
    802012a6:	00a75593          	srli	a1,a4,0xa
    802012aa:	00c59c13          	slli	s8,a1,0xc
    flags = PTE_FLAGS(*pte);
    802012ae:	3ff77493          	andi	s1,a4,1023
    if((mem = kalloc()) == NULL)
    802012b2:	fffff097          	auipc	ra,0xfffff
    802012b6:	2d6080e7          	jalr	726(ra) # 80200588 <kalloc>
    802012ba:	892a                	mv	s2,a0
    802012bc:	c92d                	beqz	a0,8020132e <uvmcopy+0xca>
    memmove(mem, (char*)pa, PGSIZE);
    802012be:	6605                	lui	a2,0x1
    802012c0:	85e2                	mv	a1,s8
    802012c2:	fffff097          	auipc	ra,0xfffff
    802012c6:	52e080e7          	jalr	1326(ra) # 802007f0 <memmove>
    if(mappages(new, i, PGSIZE, (uint64)mem, flags) != 0) {
    802012ca:	2481                	sext.w	s1,s1
    802012cc:	8726                	mv	a4,s1
    802012ce:	86ca                	mv	a3,s2
    802012d0:	6605                	lui	a2,0x1
    802012d2:	85ce                	mv	a1,s3
    802012d4:	8552                	mv	a0,s4
    802012d6:	00000097          	auipc	ra,0x0
    802012da:	a5a080e7          	jalr	-1446(ra) # 80200d30 <mappages>
    802012de:	e129                	bnez	a0,80201320 <uvmcopy+0xbc>
    i += PGSIZE;
    802012e0:	6c05                	lui	s8,0x1
    802012e2:	9c4e                	add	s8,s8,s3
    if(mappages(knew, ki, PGSIZE, (uint64)mem, flags & ~PTE_U) != 0){
    802012e4:	3ef4f713          	andi	a4,s1,1007
    802012e8:	86ca                	mv	a3,s2
    802012ea:	6605                	lui	a2,0x1
    802012ec:	85ce                	mv	a1,s3
    802012ee:	855a                	mv	a0,s6
    802012f0:	00000097          	auipc	ra,0x0
    802012f4:	a40080e7          	jalr	-1472(ra) # 80200d30 <mappages>
    802012f8:	ed05                	bnez	a0,80201330 <uvmcopy+0xcc>
  while (i < sz){
    802012fa:	f95c69e3          	bltu	s8,s5,8020128c <uvmcopy+0x28>
    802012fe:	a8a1                	j	80201356 <uvmcopy+0xf2>
      panic("uvmcopy: pte should exist");
    80201300:	00008517          	auipc	a0,0x8
    80201304:	21050513          	addi	a0,a0,528 # 80209510 <digits+0x190>
    80201308:	fffff097          	auipc	ra,0xfffff
    8020130c:	e3c080e7          	jalr	-452(ra) # 80200144 <panic>
      panic("uvmcopy: page not present");
    80201310:	00008517          	auipc	a0,0x8
    80201314:	22050513          	addi	a0,a0,544 # 80209530 <digits+0x1b0>
    80201318:	fffff097          	auipc	ra,0xfffff
    8020131c:	e2c080e7          	jalr	-468(ra) # 80200144 <panic>
      kfree(mem);
    80201320:	854a                	mv	a0,s2
    80201322:	fffff097          	auipc	ra,0xfffff
    80201326:	124080e7          	jalr	292(ra) # 80200446 <kfree>
      goto err;
    8020132a:	8c4e                	mv	s8,s3
    8020132c:	a011                	j	80201330 <uvmcopy+0xcc>
    8020132e:	8c4e                	mv	s8,s3
    ki += PGSIZE;
  }
  return 0;

 err:
  vmunmap(knew, 0, ki / PGSIZE, 0);
    80201330:	4681                	li	a3,0
    80201332:	00c9d613          	srli	a2,s3,0xc
    80201336:	4581                	li	a1,0
    80201338:	855a                	mv	a0,s6
    8020133a:	00000097          	auipc	ra,0x0
    8020133e:	baa080e7          	jalr	-1110(ra) # 80200ee4 <vmunmap>
  vmunmap(new, 0, i / PGSIZE, 1);
    80201342:	4685                	li	a3,1
    80201344:	00cc5613          	srli	a2,s8,0xc
    80201348:	4581                	li	a1,0
    8020134a:	8552                	mv	a0,s4
    8020134c:	00000097          	auipc	ra,0x0
    80201350:	b98080e7          	jalr	-1128(ra) # 80200ee4 <vmunmap>
  return -1;
    80201354:	557d                	li	a0,-1
}
    80201356:	60a6                	ld	ra,72(sp)
    80201358:	6406                	ld	s0,64(sp)
    8020135a:	74e2                	ld	s1,56(sp)
    8020135c:	7942                	ld	s2,48(sp)
    8020135e:	79a2                	ld	s3,40(sp)
    80201360:	7a02                	ld	s4,32(sp)
    80201362:	6ae2                	ld	s5,24(sp)
    80201364:	6b42                	ld	s6,16(sp)
    80201366:	6ba2                	ld	s7,8(sp)
    80201368:	6c02                	ld	s8,0(sp)
    8020136a:	6161                	addi	sp,sp,80
    8020136c:	8082                	ret
  return 0;
    8020136e:	4501                	li	a0,0
}
    80201370:	8082                	ret

0000000080201372 <uvmclear>:

// mark a PTE invalid for user access.
// used by exec for the user stack guard page.
void
uvmclear(pagetable_t pagetable, uint64 va)
{
    80201372:	1141                	addi	sp,sp,-16
    80201374:	e406                	sd	ra,8(sp)
    80201376:	e022                	sd	s0,0(sp)
    80201378:	0800                	addi	s0,sp,16
  pte_t *pte;
  
  pte = walk(pagetable, va, 0);
    8020137a:	4601                	li	a2,0
    8020137c:	00000097          	auipc	ra,0x0
    80201380:	854080e7          	jalr	-1964(ra) # 80200bd0 <walk>
  if(pte == NULL)
    80201384:	c901                	beqz	a0,80201394 <uvmclear+0x22>
    panic("uvmclear");
  *pte &= ~PTE_U;
    80201386:	611c                	ld	a5,0(a0)
    80201388:	9bbd                	andi	a5,a5,-17
    8020138a:	e11c                	sd	a5,0(a0)
}
    8020138c:	60a2                	ld	ra,8(sp)
    8020138e:	6402                	ld	s0,0(sp)
    80201390:	0141                	addi	sp,sp,16
    80201392:	8082                	ret
    panic("uvmclear");
    80201394:	00008517          	auipc	a0,0x8
    80201398:	1bc50513          	addi	a0,a0,444 # 80209550 <digits+0x1d0>
    8020139c:	fffff097          	auipc	ra,0xfffff
    802013a0:	da8080e7          	jalr	-600(ra) # 80200144 <panic>

00000000802013a4 <copyout>:
int
copyout(pagetable_t pagetable, uint64 dstva, char *src, uint64 len)
{
  uint64 n, va0, pa0;

  while(len > 0){
    802013a4:	c6bd                	beqz	a3,80201412 <copyout+0x6e>
{
    802013a6:	715d                	addi	sp,sp,-80
    802013a8:	e486                	sd	ra,72(sp)
    802013aa:	e0a2                	sd	s0,64(sp)
    802013ac:	fc26                	sd	s1,56(sp)
    802013ae:	f84a                	sd	s2,48(sp)
    802013b0:	f44e                	sd	s3,40(sp)
    802013b2:	f052                	sd	s4,32(sp)
    802013b4:	ec56                	sd	s5,24(sp)
    802013b6:	e85a                	sd	s6,16(sp)
    802013b8:	e45e                	sd	s7,8(sp)
    802013ba:	e062                	sd	s8,0(sp)
    802013bc:	0880                	addi	s0,sp,80
    802013be:	8b2a                	mv	s6,a0
    802013c0:	8c2e                	mv	s8,a1
    802013c2:	8a32                	mv	s4,a2
    802013c4:	89b6                	mv	s3,a3
    va0 = PGROUNDDOWN(dstva);
    802013c6:	7bfd                	lui	s7,0xfffff
    pa0 = walkaddr(pagetable, va0);
    if(pa0 == NULL)
      return -1;
    n = PGSIZE - (dstva - va0);
    802013c8:	6a85                	lui	s5,0x1
    802013ca:	a015                	j	802013ee <copyout+0x4a>
    if(n > len)
      n = len;
    memmove((void *)(pa0 + (dstva - va0)), src, n);
    802013cc:	9562                	add	a0,a0,s8
    802013ce:	0004861b          	sext.w	a2,s1
    802013d2:	85d2                	mv	a1,s4
    802013d4:	41250533          	sub	a0,a0,s2
    802013d8:	fffff097          	auipc	ra,0xfffff
    802013dc:	418080e7          	jalr	1048(ra) # 802007f0 <memmove>

    len -= n;
    802013e0:	409989b3          	sub	s3,s3,s1
    src += n;
    802013e4:	9a26                	add	s4,s4,s1
    dstva = va0 + PGSIZE;
    802013e6:	01590c33          	add	s8,s2,s5
  while(len > 0){
    802013ea:	02098263          	beqz	s3,8020140e <copyout+0x6a>
    va0 = PGROUNDDOWN(dstva);
    802013ee:	017c7933          	and	s2,s8,s7
    pa0 = walkaddr(pagetable, va0);
    802013f2:	85ca                	mv	a1,s2
    802013f4:	855a                	mv	a0,s6
    802013f6:	00000097          	auipc	ra,0x0
    802013fa:	880080e7          	jalr	-1920(ra) # 80200c76 <walkaddr>
    if(pa0 == NULL)
    802013fe:	cd01                	beqz	a0,80201416 <copyout+0x72>
    n = PGSIZE - (dstva - va0);
    80201400:	418904b3          	sub	s1,s2,s8
    80201404:	94d6                	add	s1,s1,s5
    if(n > len)
    80201406:	fc99f3e3          	bgeu	s3,s1,802013cc <copyout+0x28>
    8020140a:	84ce                	mv	s1,s3
    8020140c:	b7c1                	j	802013cc <copyout+0x28>
  }
  return 0;
    8020140e:	4501                	li	a0,0
    80201410:	a021                	j	80201418 <copyout+0x74>
    80201412:	4501                	li	a0,0
}
    80201414:	8082                	ret
      return -1;
    80201416:	557d                	li	a0,-1
}
    80201418:	60a6                	ld	ra,72(sp)
    8020141a:	6406                	ld	s0,64(sp)
    8020141c:	74e2                	ld	s1,56(sp)
    8020141e:	7942                	ld	s2,48(sp)
    80201420:	79a2                	ld	s3,40(sp)
    80201422:	7a02                	ld	s4,32(sp)
    80201424:	6ae2                	ld	s5,24(sp)
    80201426:	6b42                	ld	s6,16(sp)
    80201428:	6ba2                	ld	s7,8(sp)
    8020142a:	6c02                	ld	s8,0(sp)
    8020142c:	6161                	addi	sp,sp,80
    8020142e:	8082                	ret

0000000080201430 <copyout2>:

int
copyout2(uint64 dstva, char *src, uint64 len)
{
    80201430:	7179                	addi	sp,sp,-48
    80201432:	f406                	sd	ra,40(sp)
    80201434:	f022                	sd	s0,32(sp)
    80201436:	ec26                	sd	s1,24(sp)
    80201438:	e84a                	sd	s2,16(sp)
    8020143a:	e44e                	sd	s3,8(sp)
    8020143c:	1800                	addi	s0,sp,48
    8020143e:	84aa                	mv	s1,a0
    80201440:	89ae                	mv	s3,a1
    80201442:	8932                	mv	s2,a2
  uint64 sz = myproc()->sz;
    80201444:	00000097          	auipc	ra,0x0
    80201448:	6d8080e7          	jalr	1752(ra) # 80201b1c <myproc>
    8020144c:	653c                	ld	a5,72(a0)
  if (dstva + len > sz || dstva >= sz) {
    8020144e:	01248733          	add	a4,s1,s2
    80201452:	02e7e463          	bltu	a5,a4,8020147a <copyout2+0x4a>
    80201456:	02f4f463          	bgeu	s1,a5,8020147e <copyout2+0x4e>
    return -1;
  }
  memmove((void *)dstva, src, len);
    8020145a:	0009061b          	sext.w	a2,s2
    8020145e:	85ce                	mv	a1,s3
    80201460:	8526                	mv	a0,s1
    80201462:	fffff097          	auipc	ra,0xfffff
    80201466:	38e080e7          	jalr	910(ra) # 802007f0 <memmove>
  return 0;
    8020146a:	4501                	li	a0,0
}
    8020146c:	70a2                	ld	ra,40(sp)
    8020146e:	7402                	ld	s0,32(sp)
    80201470:	64e2                	ld	s1,24(sp)
    80201472:	6942                	ld	s2,16(sp)
    80201474:	69a2                	ld	s3,8(sp)
    80201476:	6145                	addi	sp,sp,48
    80201478:	8082                	ret
    return -1;
    8020147a:	557d                	li	a0,-1
    8020147c:	bfc5                	j	8020146c <copyout2+0x3c>
    8020147e:	557d                	li	a0,-1
    80201480:	b7f5                	j	8020146c <copyout2+0x3c>

0000000080201482 <copyin>:
int
copyin(pagetable_t pagetable, char *dst, uint64 srcva, uint64 len)
{
  uint64 n, va0, pa0;

  while(len > 0){
    80201482:	c6bd                	beqz	a3,802014f0 <copyin+0x6e>
{
    80201484:	715d                	addi	sp,sp,-80
    80201486:	e486                	sd	ra,72(sp)
    80201488:	e0a2                	sd	s0,64(sp)
    8020148a:	fc26                	sd	s1,56(sp)
    8020148c:	f84a                	sd	s2,48(sp)
    8020148e:	f44e                	sd	s3,40(sp)
    80201490:	f052                	sd	s4,32(sp)
    80201492:	ec56                	sd	s5,24(sp)
    80201494:	e85a                	sd	s6,16(sp)
    80201496:	e45e                	sd	s7,8(sp)
    80201498:	e062                	sd	s8,0(sp)
    8020149a:	0880                	addi	s0,sp,80
    8020149c:	8b2a                	mv	s6,a0
    8020149e:	8a2e                	mv	s4,a1
    802014a0:	8c32                	mv	s8,a2
    802014a2:	89b6                	mv	s3,a3
    va0 = PGROUNDDOWN(srcva);
    802014a4:	7bfd                	lui	s7,0xfffff
    pa0 = walkaddr(pagetable, va0);
    if(pa0 == NULL)
      return -1;
    n = PGSIZE - (srcva - va0);
    802014a6:	6a85                	lui	s5,0x1
    802014a8:	a015                	j	802014cc <copyin+0x4a>
    if(n > len)
      n = len;
    memmove(dst, (void *)(pa0 + (srcva - va0)), n);
    802014aa:	9562                	add	a0,a0,s8
    802014ac:	0004861b          	sext.w	a2,s1
    802014b0:	412505b3          	sub	a1,a0,s2
    802014b4:	8552                	mv	a0,s4
    802014b6:	fffff097          	auipc	ra,0xfffff
    802014ba:	33a080e7          	jalr	826(ra) # 802007f0 <memmove>

    len -= n;
    802014be:	409989b3          	sub	s3,s3,s1
    dst += n;
    802014c2:	9a26                	add	s4,s4,s1
    srcva = va0 + PGSIZE;
    802014c4:	01590c33          	add	s8,s2,s5
  while(len > 0){
    802014c8:	02098263          	beqz	s3,802014ec <copyin+0x6a>
    va0 = PGROUNDDOWN(srcva);
    802014cc:	017c7933          	and	s2,s8,s7
    pa0 = walkaddr(pagetable, va0);
    802014d0:	85ca                	mv	a1,s2
    802014d2:	855a                	mv	a0,s6
    802014d4:	fffff097          	auipc	ra,0xfffff
    802014d8:	7a2080e7          	jalr	1954(ra) # 80200c76 <walkaddr>
    if(pa0 == NULL)
    802014dc:	cd01                	beqz	a0,802014f4 <copyin+0x72>
    n = PGSIZE - (srcva - va0);
    802014de:	418904b3          	sub	s1,s2,s8
    802014e2:	94d6                	add	s1,s1,s5
    if(n > len)
    802014e4:	fc99f3e3          	bgeu	s3,s1,802014aa <copyin+0x28>
    802014e8:	84ce                	mv	s1,s3
    802014ea:	b7c1                	j	802014aa <copyin+0x28>
  }
  return 0;
    802014ec:	4501                	li	a0,0
    802014ee:	a021                	j	802014f6 <copyin+0x74>
    802014f0:	4501                	li	a0,0
}
    802014f2:	8082                	ret
      return -1;
    802014f4:	557d                	li	a0,-1
}
    802014f6:	60a6                	ld	ra,72(sp)
    802014f8:	6406                	ld	s0,64(sp)
    802014fa:	74e2                	ld	s1,56(sp)
    802014fc:	7942                	ld	s2,48(sp)
    802014fe:	79a2                	ld	s3,40(sp)
    80201500:	7a02                	ld	s4,32(sp)
    80201502:	6ae2                	ld	s5,24(sp)
    80201504:	6b42                	ld	s6,16(sp)
    80201506:	6ba2                	ld	s7,8(sp)
    80201508:	6c02                	ld	s8,0(sp)
    8020150a:	6161                	addi	sp,sp,80
    8020150c:	8082                	ret

000000008020150e <copyin2>:

int
copyin2(char *dst, uint64 srcva, uint64 len)
{
    8020150e:	7179                	addi	sp,sp,-48
    80201510:	f406                	sd	ra,40(sp)
    80201512:	f022                	sd	s0,32(sp)
    80201514:	ec26                	sd	s1,24(sp)
    80201516:	e84a                	sd	s2,16(sp)
    80201518:	e44e                	sd	s3,8(sp)
    8020151a:	1800                	addi	s0,sp,48
    8020151c:	89aa                	mv	s3,a0
    8020151e:	84ae                	mv	s1,a1
    80201520:	8932                	mv	s2,a2
  uint64 sz = myproc()->sz;
    80201522:	00000097          	auipc	ra,0x0
    80201526:	5fa080e7          	jalr	1530(ra) # 80201b1c <myproc>
    8020152a:	653c                	ld	a5,72(a0)
  if (srcva + len > sz || srcva >= sz) {
    8020152c:	01248733          	add	a4,s1,s2
    80201530:	02e7e463          	bltu	a5,a4,80201558 <copyin2+0x4a>
    80201534:	02f4f463          	bgeu	s1,a5,8020155c <copyin2+0x4e>
    return -1;
  }
  memmove(dst, (void *)srcva, len);
    80201538:	0009061b          	sext.w	a2,s2
    8020153c:	85a6                	mv	a1,s1
    8020153e:	854e                	mv	a0,s3
    80201540:	fffff097          	auipc	ra,0xfffff
    80201544:	2b0080e7          	jalr	688(ra) # 802007f0 <memmove>
  return 0;
    80201548:	4501                	li	a0,0
}
    8020154a:	70a2                	ld	ra,40(sp)
    8020154c:	7402                	ld	s0,32(sp)
    8020154e:	64e2                	ld	s1,24(sp)
    80201550:	6942                	ld	s2,16(sp)
    80201552:	69a2                	ld	s3,8(sp)
    80201554:	6145                	addi	sp,sp,48
    80201556:	8082                	ret
    return -1;
    80201558:	557d                	li	a0,-1
    8020155a:	bfc5                	j	8020154a <copyin2+0x3c>
    8020155c:	557d                	li	a0,-1
    8020155e:	b7f5                	j	8020154a <copyin2+0x3c>

0000000080201560 <copyinstr>:
copyinstr(pagetable_t pagetable, char *dst, uint64 srcva, uint64 max)
{
  uint64 n, va0, pa0;
  int got_null = 0;

  while(got_null == 0 && max > 0){
    80201560:	c6c5                	beqz	a3,80201608 <copyinstr+0xa8>
{
    80201562:	715d                	addi	sp,sp,-80
    80201564:	e486                	sd	ra,72(sp)
    80201566:	e0a2                	sd	s0,64(sp)
    80201568:	fc26                	sd	s1,56(sp)
    8020156a:	f84a                	sd	s2,48(sp)
    8020156c:	f44e                	sd	s3,40(sp)
    8020156e:	f052                	sd	s4,32(sp)
    80201570:	ec56                	sd	s5,24(sp)
    80201572:	e85a                	sd	s6,16(sp)
    80201574:	e45e                	sd	s7,8(sp)
    80201576:	0880                	addi	s0,sp,80
    80201578:	8a2a                	mv	s4,a0
    8020157a:	8b2e                	mv	s6,a1
    8020157c:	8bb2                	mv	s7,a2
    8020157e:	84b6                	mv	s1,a3
    va0 = PGROUNDDOWN(srcva);
    80201580:	7afd                	lui	s5,0xfffff
    pa0 = walkaddr(pagetable, va0);
    if(pa0 == NULL)
      return -1;
    n = PGSIZE - (srcva - va0);
    80201582:	6985                	lui	s3,0x1
    80201584:	a035                	j	802015b0 <copyinstr+0x50>
      n = max;

    char *p = (char *) (pa0 + (srcva - va0));
    while(n > 0){
      if(*p == '\0'){
        *dst = '\0';
    80201586:	00078023          	sb	zero,0(a5) # 1000 <_entry-0x801ff000>
    8020158a:	4785                	li	a5,1
      dst++;
    }

    srcva = va0 + PGSIZE;
  }
  if(got_null){
    8020158c:	0017b793          	seqz	a5,a5
    80201590:	40f00533          	neg	a0,a5
    return 0;
  } else {
    return -1;
  }
}
    80201594:	60a6                	ld	ra,72(sp)
    80201596:	6406                	ld	s0,64(sp)
    80201598:	74e2                	ld	s1,56(sp)
    8020159a:	7942                	ld	s2,48(sp)
    8020159c:	79a2                	ld	s3,40(sp)
    8020159e:	7a02                	ld	s4,32(sp)
    802015a0:	6ae2                	ld	s5,24(sp)
    802015a2:	6b42                	ld	s6,16(sp)
    802015a4:	6ba2                	ld	s7,8(sp)
    802015a6:	6161                	addi	sp,sp,80
    802015a8:	8082                	ret
    srcva = va0 + PGSIZE;
    802015aa:	01390bb3          	add	s7,s2,s3
  while(got_null == 0 && max > 0){
    802015ae:	c8a9                	beqz	s1,80201600 <copyinstr+0xa0>
    va0 = PGROUNDDOWN(srcva);
    802015b0:	015bf933          	and	s2,s7,s5
    pa0 = walkaddr(pagetable, va0);
    802015b4:	85ca                	mv	a1,s2
    802015b6:	8552                	mv	a0,s4
    802015b8:	fffff097          	auipc	ra,0xfffff
    802015bc:	6be080e7          	jalr	1726(ra) # 80200c76 <walkaddr>
    if(pa0 == NULL)
    802015c0:	c131                	beqz	a0,80201604 <copyinstr+0xa4>
    n = PGSIZE - (srcva - va0);
    802015c2:	41790833          	sub	a6,s2,s7
    802015c6:	984e                	add	a6,a6,s3
    if(n > max)
    802015c8:	0104f363          	bgeu	s1,a6,802015ce <copyinstr+0x6e>
    802015cc:	8826                	mv	a6,s1
    char *p = (char *) (pa0 + (srcva - va0));
    802015ce:	955e                	add	a0,a0,s7
    802015d0:	41250533          	sub	a0,a0,s2
    while(n > 0){
    802015d4:	fc080be3          	beqz	a6,802015aa <copyinstr+0x4a>
    802015d8:	985a                	add	a6,a6,s6
    802015da:	87da                	mv	a5,s6
      if(*p == '\0'){
    802015dc:	41650633          	sub	a2,a0,s6
    802015e0:	14fd                	addi	s1,s1,-1
    802015e2:	9b26                	add	s6,s6,s1
    802015e4:	00f60733          	add	a4,a2,a5
    802015e8:	00074703          	lbu	a4,0(a4) # fffffffffffff000 <kernel_end+0xffffffff7fd41000>
    802015ec:	df49                	beqz	a4,80201586 <copyinstr+0x26>
        *dst = *p;
    802015ee:	00e78023          	sb	a4,0(a5)
      --max;
    802015f2:	40fb04b3          	sub	s1,s6,a5
      dst++;
    802015f6:	0785                	addi	a5,a5,1
    while(n > 0){
    802015f8:	ff0796e3          	bne	a5,a6,802015e4 <copyinstr+0x84>
      dst++;
    802015fc:	8b42                	mv	s6,a6
    802015fe:	b775                	j	802015aa <copyinstr+0x4a>
    80201600:	4781                	li	a5,0
    80201602:	b769                	j	8020158c <copyinstr+0x2c>
      return -1;
    80201604:	557d                	li	a0,-1
    80201606:	b779                	j	80201594 <copyinstr+0x34>
  int got_null = 0;
    80201608:	4781                	li	a5,0
  if(got_null){
    8020160a:	0017b793          	seqz	a5,a5
    8020160e:	40f00533          	neg	a0,a5
}
    80201612:	8082                	ret

0000000080201614 <copyinstr2>:

int
copyinstr2(char *dst, uint64 srcva, uint64 max)
{
    80201614:	7179                	addi	sp,sp,-48
    80201616:	f406                	sd	ra,40(sp)
    80201618:	f022                	sd	s0,32(sp)
    8020161a:	ec26                	sd	s1,24(sp)
    8020161c:	e84a                	sd	s2,16(sp)
    8020161e:	e44e                	sd	s3,8(sp)
    80201620:	1800                	addi	s0,sp,48
    80201622:	89aa                	mv	s3,a0
    80201624:	84ae                	mv	s1,a1
    80201626:	8932                	mv	s2,a2
  int got_null = 0;
  uint64 sz = myproc()->sz;
    80201628:	00000097          	auipc	ra,0x0
    8020162c:	4f4080e7          	jalr	1268(ra) # 80201b1c <myproc>
    80201630:	6534                	ld	a3,72(a0)
  while(srcva < sz && max > 0){
    80201632:	04d4f363          	bgeu	s1,a3,80201678 <copyinstr2+0x64>
    80201636:	04090363          	beqz	s2,8020167c <copyinstr2+0x68>
    8020163a:	01298633          	add	a2,s3,s2
    8020163e:	8e85                	sub	a3,a3,s1
    80201640:	96ce                	add	a3,a3,s3
    80201642:	87ce                	mv	a5,s3
    char *p = (char *)srcva;
    if(*p == '\0'){
    80201644:	413485b3          	sub	a1,s1,s3
    80201648:	00b78733          	add	a4,a5,a1
    8020164c:	00074703          	lbu	a4,0(a4)
    80201650:	cb11                	beqz	a4,80201664 <copyinstr2+0x50>
      *dst = '\0';
      got_null = 1;
      break;
    } else {
      *dst = *p;
    80201652:	00e78023          	sb	a4,0(a5)
    }
    --max;
    srcva++;
    dst++;
    80201656:	0785                	addi	a5,a5,1
  while(srcva < sz && max > 0){
    80201658:	02d78463          	beq	a5,a3,80201680 <copyinstr2+0x6c>
    8020165c:	fec796e3          	bne	a5,a2,80201648 <copyinstr2+0x34>
  }
  if(got_null){
    return 0;
  } else {
    return -1;
    80201660:	557d                	li	a0,-1
    80201662:	a021                	j	8020166a <copyinstr2+0x56>
      *dst = '\0';
    80201664:	00078023          	sb	zero,0(a5)
    return 0;
    80201668:	4501                	li	a0,0
  }
}
    8020166a:	70a2                	ld	ra,40(sp)
    8020166c:	7402                	ld	s0,32(sp)
    8020166e:	64e2                	ld	s1,24(sp)
    80201670:	6942                	ld	s2,16(sp)
    80201672:	69a2                	ld	s3,8(sp)
    80201674:	6145                	addi	sp,sp,48
    80201676:	8082                	ret
    return -1;
    80201678:	557d                	li	a0,-1
    8020167a:	bfc5                	j	8020166a <copyinstr2+0x56>
    8020167c:	557d                	li	a0,-1
    8020167e:	b7f5                	j	8020166a <copyinstr2+0x56>
    80201680:	557d                	li	a0,-1
    80201682:	b7e5                	j	8020166a <copyinstr2+0x56>

0000000080201684 <kfreewalk>:
}

// only free page table, not physical pages
void
kfreewalk(pagetable_t kpt)
{
    80201684:	7179                	addi	sp,sp,-48
    80201686:	f406                	sd	ra,40(sp)
    80201688:	f022                	sd	s0,32(sp)
    8020168a:	ec26                	sd	s1,24(sp)
    8020168c:	e84a                	sd	s2,16(sp)
    8020168e:	e44e                	sd	s3,8(sp)
    80201690:	e052                	sd	s4,0(sp)
    80201692:	1800                	addi	s0,sp,48
    80201694:	8a2a                	mv	s4,a0
  for (int i = 0; i < 512; i++) {
    80201696:	84aa                	mv	s1,a0
    80201698:	6905                	lui	s2,0x1
    8020169a:	992a                	add	s2,s2,a0
    pte_t pte = kpt[i];
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    8020169c:	4985                	li	s3,1
    8020169e:	a829                	j	802016b8 <kfreewalk+0x34>
      kfreewalk((pagetable_t) PTE2PA(pte));
    802016a0:	83a9                	srli	a5,a5,0xa
    802016a2:	00c79513          	slli	a0,a5,0xc
    802016a6:	00000097          	auipc	ra,0x0
    802016aa:	fde080e7          	jalr	-34(ra) # 80201684 <kfreewalk>
      kpt[i] = 0;
    802016ae:	0004b023          	sd	zero,0(s1)
  for (int i = 0; i < 512; i++) {
    802016b2:	04a1                	addi	s1,s1,8
    802016b4:	01248963          	beq	s1,s2,802016c6 <kfreewalk+0x42>
    pte_t pte = kpt[i];
    802016b8:	609c                	ld	a5,0(s1)
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    802016ba:	00f7f713          	andi	a4,a5,15
    802016be:	ff3701e3          	beq	a4,s3,802016a0 <kfreewalk+0x1c>
    } else if (pte & PTE_V) {
    802016c2:	8b85                	andi	a5,a5,1
    802016c4:	d7fd                	beqz	a5,802016b2 <kfreewalk+0x2e>
      break;
    }
  }
  kfree((void *) kpt);
    802016c6:	8552                	mv	a0,s4
    802016c8:	fffff097          	auipc	ra,0xfffff
    802016cc:	d7e080e7          	jalr	-642(ra) # 80200446 <kfree>
}
    802016d0:	70a2                	ld	ra,40(sp)
    802016d2:	7402                	ld	s0,32(sp)
    802016d4:	64e2                	ld	s1,24(sp)
    802016d6:	6942                	ld	s2,16(sp)
    802016d8:	69a2                	ld	s3,8(sp)
    802016da:	6a02                	ld	s4,0(sp)
    802016dc:	6145                	addi	sp,sp,48
    802016de:	8082                	ret

00000000802016e0 <kvmfreeusr>:

void
kvmfreeusr(pagetable_t kpt)
{
    802016e0:	1101                	addi	sp,sp,-32
    802016e2:	ec06                	sd	ra,24(sp)
    802016e4:	e822                	sd	s0,16(sp)
    802016e6:	e426                	sd	s1,8(sp)
    802016e8:	1000                	addi	s0,sp,32
    802016ea:	84aa                	mv	s1,a0
  pte_t pte;
  for (int i = 0; i < PX(2, MAXUVA); i++) {
    pte = kpt[i];
    802016ec:	6108                	ld	a0,0(a0)
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    802016ee:	00f57713          	andi	a4,a0,15
    802016f2:	4785                	li	a5,1
    802016f4:	00f70d63          	beq	a4,a5,8020170e <kvmfreeusr+0x2e>
    pte = kpt[i];
    802016f8:	6488                	ld	a0,8(s1)
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    802016fa:	00f57713          	andi	a4,a0,15
    802016fe:	4785                	li	a5,1
    80201700:	02f70063          	beq	a4,a5,80201720 <kvmfreeusr+0x40>
      kfreewalk((pagetable_t) PTE2PA(pte));
      kpt[i] = 0;
    }
  }
}
    80201704:	60e2                	ld	ra,24(sp)
    80201706:	6442                	ld	s0,16(sp)
    80201708:	64a2                	ld	s1,8(sp)
    8020170a:	6105                	addi	sp,sp,32
    8020170c:	8082                	ret
      kfreewalk((pagetable_t) PTE2PA(pte));
    8020170e:	8129                	srli	a0,a0,0xa
    80201710:	0532                	slli	a0,a0,0xc
    80201712:	00000097          	auipc	ra,0x0
    80201716:	f72080e7          	jalr	-142(ra) # 80201684 <kfreewalk>
      kpt[i] = 0;
    8020171a:	0004b023          	sd	zero,0(s1)
    8020171e:	bfe9                	j	802016f8 <kvmfreeusr+0x18>
      kfreewalk((pagetable_t) PTE2PA(pte));
    80201720:	8129                	srli	a0,a0,0xa
    80201722:	0532                	slli	a0,a0,0xc
    80201724:	00000097          	auipc	ra,0x0
    80201728:	f60080e7          	jalr	-160(ra) # 80201684 <kfreewalk>
      kpt[i] = 0;
    8020172c:	0004b423          	sd	zero,8(s1)
}
    80201730:	bfd1                	j	80201704 <kvmfreeusr+0x24>

0000000080201732 <kvmfree>:

void
kvmfree(pagetable_t kpt, int stack_free)
{
    80201732:	1101                	addi	sp,sp,-32
    80201734:	ec06                	sd	ra,24(sp)
    80201736:	e822                	sd	s0,16(sp)
    80201738:	e426                	sd	s1,8(sp)
    8020173a:	1000                	addi	s0,sp,32
    8020173c:	84aa                	mv	s1,a0
  if (stack_free) {
    8020173e:	e185                	bnez	a1,8020175e <kvmfree+0x2c>
    pte_t pte = kpt[PX(2, VKSTACK)];
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
      kfreewalk((pagetable_t) PTE2PA(pte));
    }
  }
  kvmfreeusr(kpt);
    80201740:	8526                	mv	a0,s1
    80201742:	00000097          	auipc	ra,0x0
    80201746:	f9e080e7          	jalr	-98(ra) # 802016e0 <kvmfreeusr>
  kfree(kpt);
    8020174a:	8526                	mv	a0,s1
    8020174c:	fffff097          	auipc	ra,0xfffff
    80201750:	cfa080e7          	jalr	-774(ra) # 80200446 <kfree>
}
    80201754:	60e2                	ld	ra,24(sp)
    80201756:	6442                	ld	s0,16(sp)
    80201758:	64a2                	ld	s1,8(sp)
    8020175a:	6105                	addi	sp,sp,32
    8020175c:	8082                	ret
    vmunmap(kpt, VKSTACK, 1, 1);
    8020175e:	4685                	li	a3,1
    80201760:	4605                	li	a2,1
    80201762:	0fb00593          	li	a1,251
    80201766:	05fa                	slli	a1,a1,0x1e
    80201768:	fffff097          	auipc	ra,0xfffff
    8020176c:	77c080e7          	jalr	1916(ra) # 80200ee4 <vmunmap>
    pte_t pte = kpt[PX(2, VKSTACK)];
    80201770:	7d84b503          	ld	a0,2008(s1)
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    80201774:	00f57713          	andi	a4,a0,15
    80201778:	4785                	li	a5,1
    8020177a:	fcf713e3          	bne	a4,a5,80201740 <kvmfree+0xe>
      kfreewalk((pagetable_t) PTE2PA(pte));
    8020177e:	8129                	srli	a0,a0,0xa
    80201780:	0532                	slli	a0,a0,0xc
    80201782:	00000097          	auipc	ra,0x0
    80201786:	f02080e7          	jalr	-254(ra) # 80201684 <kfreewalk>
    8020178a:	bf5d                	j	80201740 <kvmfree+0xe>

000000008020178c <proc_kpagetable>:
{
    8020178c:	1101                	addi	sp,sp,-32
    8020178e:	ec06                	sd	ra,24(sp)
    80201790:	e822                	sd	s0,16(sp)
    80201792:	e426                	sd	s1,8(sp)
    80201794:	1000                	addi	s0,sp,32
  pagetable_t kpt = (pagetable_t) kalloc();
    80201796:	fffff097          	auipc	ra,0xfffff
    8020179a:	df2080e7          	jalr	-526(ra) # 80200588 <kalloc>
    8020179e:	84aa                	mv	s1,a0
  if (kpt == NULL)
    802017a0:	c91d                	beqz	a0,802017d6 <proc_kpagetable+0x4a>
  memmove(kpt, kernel_pagetable, PGSIZE);
    802017a2:	6605                	lui	a2,0x1
    802017a4:	000aa597          	auipc	a1,0xaa
    802017a8:	8c45b583          	ld	a1,-1852(a1) # 802ab068 <kernel_pagetable>
    802017ac:	fffff097          	auipc	ra,0xfffff
    802017b0:	044080e7          	jalr	68(ra) # 802007f0 <memmove>
  char *pstack = kalloc();
    802017b4:	fffff097          	auipc	ra,0xfffff
    802017b8:	dd4080e7          	jalr	-556(ra) # 80200588 <kalloc>
    802017bc:	86aa                	mv	a3,a0
  if(pstack == NULL)
    802017be:	c115                	beqz	a0,802017e2 <proc_kpagetable+0x56>
  if (mappages(kpt, VKSTACK, PGSIZE, (uint64)pstack, PTE_R | PTE_W) != 0)
    802017c0:	4719                	li	a4,6
    802017c2:	6605                	lui	a2,0x1
    802017c4:	0fb00593          	li	a1,251
    802017c8:	05fa                	slli	a1,a1,0x1e
    802017ca:	8526                	mv	a0,s1
    802017cc:	fffff097          	auipc	ra,0xfffff
    802017d0:	564080e7          	jalr	1380(ra) # 80200d30 <mappages>
    802017d4:	e519                	bnez	a0,802017e2 <proc_kpagetable+0x56>
}
    802017d6:	8526                	mv	a0,s1
    802017d8:	60e2                	ld	ra,24(sp)
    802017da:	6442                	ld	s0,16(sp)
    802017dc:	64a2                	ld	s1,8(sp)
    802017de:	6105                	addi	sp,sp,32
    802017e0:	8082                	ret
  kvmfree(kpt, 1);
    802017e2:	4585                	li	a1,1
    802017e4:	8526                	mv	a0,s1
    802017e6:	00000097          	auipc	ra,0x0
    802017ea:	f4c080e7          	jalr	-180(ra) # 80201732 <kvmfree>
  return NULL;
    802017ee:	4481                	li	s1,0
    802017f0:	b7dd                	j	802017d6 <proc_kpagetable+0x4a>

00000000802017f2 <vmprint>:

void vmprint(pagetable_t pagetable)
{
    802017f2:	7119                	addi	sp,sp,-128
    802017f4:	fc86                	sd	ra,120(sp)
    802017f6:	f8a2                	sd	s0,112(sp)
    802017f8:	f4a6                	sd	s1,104(sp)
    802017fa:	f0ca                	sd	s2,96(sp)
    802017fc:	ecce                	sd	s3,88(sp)
    802017fe:	e8d2                	sd	s4,80(sp)
    80201800:	e4d6                	sd	s5,72(sp)
    80201802:	e0da                	sd	s6,64(sp)
    80201804:	fc5e                	sd	s7,56(sp)
    80201806:	f862                	sd	s8,48(sp)
    80201808:	f466                	sd	s9,40(sp)
    8020180a:	f06a                	sd	s10,32(sp)
    8020180c:	ec6e                	sd	s11,24(sp)
    8020180e:	0100                	addi	s0,sp,128
    80201810:	8baa                	mv	s7,a0
    80201812:	f8a43023          	sd	a0,-128(s0)
  const int capacity = 512;
  printf("page table %p\n", pagetable);
    80201816:	85aa                	mv	a1,a0
    80201818:	00008517          	auipc	a0,0x8
    8020181c:	d4850513          	addi	a0,a0,-696 # 80209560 <digits+0x1e0>
    80201820:	fffff097          	auipc	ra,0xfffff
    80201824:	96e080e7          	jalr	-1682(ra) # 8020018e <printf>
  for (pte_t *pte = (pte_t *) pagetable; pte < pagetable + capacity; pte++) {
    80201828:	6d85                	lui	s11,0x1
    8020182a:	9dde                	add	s11,s11,s7
    8020182c:	6c05                	lui	s8,0x1

      for (pte_t *pte2 = (pte_t *) pt2; pte2 < pt2 + capacity; pte2++) {
        if (*pte2 & PTE_V)
        {
          pagetable_t pt3 = (pagetable_t) PTE2PA(*pte2);
          printf(".. ..%d: pte %p pa %p\n", pte2 - pt2, *pte2, pt3);
    8020182e:	00008c97          	auipc	s9,0x8
    80201832:	d5ac8c93          	addi	s9,s9,-678 # 80209588 <digits+0x208>
    80201836:	20000793          	li	a5,512
    8020183a:	f8f43423          	sd	a5,-120(s0)

          for (pte_t *pte3 = (pte_t *) pt3; pte3 < pt3 + capacity; pte3++)
            if (*pte3 & PTE_V)
              printf(".. .. ..%d: pte %p pa %p\n", pte3 - pt3, *pte3, PTE2PA(*pte3));
    8020183e:	00008a17          	auipc	s4,0x8
    80201842:	d62a0a13          	addi	s4,s4,-670 # 802095a0 <digits+0x220>
    80201846:	a88d                	j	802018b8 <vmprint+0xc6>
    80201848:	00a65693          	srli	a3,a2,0xa
    8020184c:	413485b3          	sub	a1,s1,s3
    80201850:	06b2                	slli	a3,a3,0xc
    80201852:	858d                	srai	a1,a1,0x3
    80201854:	8552                	mv	a0,s4
    80201856:	fffff097          	auipc	ra,0xfffff
    8020185a:	938080e7          	jalr	-1736(ra) # 8020018e <printf>
          for (pte_t *pte3 = (pte_t *) pt3; pte3 < pt3 + capacity; pte3++)
    8020185e:	04a1                	addi	s1,s1,8
    80201860:	01248763          	beq	s1,s2,8020186e <vmprint+0x7c>
            if (*pte3 & PTE_V)
    80201864:	6090                	ld	a2,0(s1)
    80201866:	00167793          	andi	a5,a2,1
    8020186a:	dbf5                	beqz	a5,8020185e <vmprint+0x6c>
    8020186c:	bff1                	j	80201848 <vmprint+0x56>
      for (pte_t *pte2 = (pte_t *) pt2; pte2 < pt2 + capacity; pte2++) {
    8020186e:	0aa1                	addi	s5,s5,8
    80201870:	056a8163          	beq	s5,s6,802018b2 <vmprint+0xc0>
        if (*pte2 & PTE_V)
    80201874:	000ab603          	ld	a2,0(s5) # fffffffffffff000 <kernel_end+0xffffffff7fd41000>
    80201878:	00167793          	andi	a5,a2,1
    8020187c:	dbed                	beqz	a5,8020186e <vmprint+0x7c>
          pagetable_t pt3 = (pagetable_t) PTE2PA(*pte2);
    8020187e:	00a65493          	srli	s1,a2,0xa
    80201882:	04b2                	slli	s1,s1,0xc
    80201884:	89a6                	mv	s3,s1
          printf(".. ..%d: pte %p pa %p\n", pte2 - pt2, *pte2, pt3);
    80201886:	41aa85b3          	sub	a1,s5,s10
    8020188a:	86a6                	mv	a3,s1
    8020188c:	858d                	srai	a1,a1,0x3
    8020188e:	8566                	mv	a0,s9
    80201890:	fffff097          	auipc	ra,0xfffff
    80201894:	8fe080e7          	jalr	-1794(ra) # 8020018e <printf>
          for (pte_t *pte3 = (pte_t *) pt3; pte3 < pt3 + capacity; pte3++)
    80201898:	00848693          	addi	a3,s1,8
    8020189c:	01848733          	add	a4,s1,s8
    802018a0:	f8843783          	ld	a5,-120(s0)
    802018a4:	00d77363          	bgeu	a4,a3,802018aa <vmprint+0xb8>
    802018a8:	4785                	li	a5,1
    802018aa:	078e                	slli	a5,a5,0x3
    802018ac:	00978933          	add	s2,a5,s1
    802018b0:	bf55                	j	80201864 <vmprint+0x72>
  for (pte_t *pte = (pte_t *) pagetable; pte < pagetable + capacity; pte++) {
    802018b2:	0ba1                	addi	s7,s7,8
    802018b4:	05bb8763          	beq	s7,s11,80201902 <vmprint+0x110>
    if (*pte & PTE_V)
    802018b8:	000bb603          	ld	a2,0(s7) # fffffffffffff000 <kernel_end+0xffffffff7fd41000>
    802018bc:	00167793          	andi	a5,a2,1
    802018c0:	dbed                	beqz	a5,802018b2 <vmprint+0xc0>
      pagetable_t pt2 = (pagetable_t) PTE2PA(*pte); 
    802018c2:	00a65a93          	srli	s5,a2,0xa
    802018c6:	0ab2                	slli	s5,s5,0xc
    802018c8:	8d56                	mv	s10,s5
      printf("..%d: pte %p pa %p\n", pte - pagetable, *pte, pt2);
    802018ca:	f8043783          	ld	a5,-128(s0)
    802018ce:	40fb87b3          	sub	a5,s7,a5
    802018d2:	86d6                	mv	a3,s5
    802018d4:	4037d593          	srai	a1,a5,0x3
    802018d8:	00008517          	auipc	a0,0x8
    802018dc:	c9850513          	addi	a0,a0,-872 # 80209570 <digits+0x1f0>
    802018e0:	fffff097          	auipc	ra,0xfffff
    802018e4:	8ae080e7          	jalr	-1874(ra) # 8020018e <printf>
      for (pte_t *pte2 = (pte_t *) pt2; pte2 < pt2 + capacity; pte2++) {
    802018e8:	018a86b3          	add	a3,s5,s8
    802018ec:	008a8713          	addi	a4,s5,8
    802018f0:	20000793          	li	a5,512
    802018f4:	00e6f363          	bgeu	a3,a4,802018fa <vmprint+0x108>
    802018f8:	4785                	li	a5,1
    802018fa:	078e                	slli	a5,a5,0x3
    802018fc:	01578b33          	add	s6,a5,s5
    80201900:	bf95                	j	80201874 <vmprint+0x82>
        }
      }
    }
  }
  return;
}
    80201902:	70e6                	ld	ra,120(sp)
    80201904:	7446                	ld	s0,112(sp)
    80201906:	74a6                	ld	s1,104(sp)
    80201908:	7906                	ld	s2,96(sp)
    8020190a:	69e6                	ld	s3,88(sp)
    8020190c:	6a46                	ld	s4,80(sp)
    8020190e:	6aa6                	ld	s5,72(sp)
    80201910:	6b06                	ld	s6,64(sp)
    80201912:	7be2                	ld	s7,56(sp)
    80201914:	7c42                	ld	s8,48(sp)
    80201916:	7ca2                	ld	s9,40(sp)
    80201918:	7d02                	ld	s10,32(sp)
    8020191a:	6de2                	ld	s11,24(sp)
    8020191c:	6109                	addi	sp,sp,128
    8020191e:	8082                	ret

0000000080201920 <wakeup1>:

// Wake up p if it is sleeping in wait(); used by exit().
// Caller must hold p->lock.
static void
wakeup1(struct proc *p)
{
    80201920:	1101                	addi	sp,sp,-32
    80201922:	ec06                	sd	ra,24(sp)
    80201924:	e822                	sd	s0,16(sp)
    80201926:	e426                	sd	s1,8(sp)
    80201928:	1000                	addi	s0,sp,32
    8020192a:	84aa                	mv	s1,a0
  if(!holding(&p->lock))
    8020192c:	fffff097          	auipc	ra,0xfffff
    80201930:	d9a080e7          	jalr	-614(ra) # 802006c6 <holding>
    80201934:	c909                	beqz	a0,80201946 <wakeup1+0x26>
    panic("wakeup1");
  if(p->chan == p && p->state == SLEEPING) {
    80201936:	749c                	ld	a5,40(s1)
    80201938:	00978f63          	beq	a5,s1,80201956 <wakeup1+0x36>
    p->state = RUNNABLE;
  }
}
    8020193c:	60e2                	ld	ra,24(sp)
    8020193e:	6442                	ld	s0,16(sp)
    80201940:	64a2                	ld	s1,8(sp)
    80201942:	6105                	addi	sp,sp,32
    80201944:	8082                	ret
    panic("wakeup1");
    80201946:	00008517          	auipc	a0,0x8
    8020194a:	c7a50513          	addi	a0,a0,-902 # 802095c0 <digits+0x240>
    8020194e:	ffffe097          	auipc	ra,0xffffe
    80201952:	7f6080e7          	jalr	2038(ra) # 80200144 <panic>
  if(p->chan == p && p->state == SLEEPING) {
    80201956:	4c98                	lw	a4,24(s1)
    80201958:	4785                	li	a5,1
    8020195a:	fef711e3          	bne	a4,a5,8020193c <wakeup1+0x1c>
    p->state = RUNNABLE;
    8020195e:	4789                	li	a5,2
    80201960:	cc9c                	sw	a5,24(s1)
}
    80201962:	bfe9                	j	8020193c <wakeup1+0x1c>

0000000080201964 <reg_info>:
void reg_info(void) {
    80201964:	1141                	addi	sp,sp,-16
    80201966:	e406                	sd	ra,8(sp)
    80201968:	e022                	sd	s0,0(sp)
    8020196a:	0800                	addi	s0,sp,16
  printf("register info: {\n");
    8020196c:	00008517          	auipc	a0,0x8
    80201970:	c5c50513          	addi	a0,a0,-932 # 802095c8 <digits+0x248>
    80201974:	fffff097          	auipc	ra,0xfffff
    80201978:	81a080e7          	jalr	-2022(ra) # 8020018e <printf>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    8020197c:	100025f3          	csrr	a1,sstatus
  printf("sstatus: %p\n", r_sstatus());
    80201980:	00008517          	auipc	a0,0x8
    80201984:	c6050513          	addi	a0,a0,-928 # 802095e0 <digits+0x260>
    80201988:	fffff097          	auipc	ra,0xfffff
    8020198c:	806080e7          	jalr	-2042(ra) # 8020018e <printf>
  asm volatile("csrr %0, sip" : "=r" (x) );
    80201990:	144025f3          	csrr	a1,sip
  printf("sip: %p\n", r_sip());
    80201994:	00008517          	auipc	a0,0x8
    80201998:	c5c50513          	addi	a0,a0,-932 # 802095f0 <digits+0x270>
    8020199c:	ffffe097          	auipc	ra,0xffffe
    802019a0:	7f2080e7          	jalr	2034(ra) # 8020018e <printf>
  asm volatile("csrr %0, sie" : "=r" (x) );
    802019a4:	104025f3          	csrr	a1,sie
  printf("sie: %p\n", r_sie());
    802019a8:	00008517          	auipc	a0,0x8
    802019ac:	c5850513          	addi	a0,a0,-936 # 80209600 <digits+0x280>
    802019b0:	ffffe097          	auipc	ra,0xffffe
    802019b4:	7de080e7          	jalr	2014(ra) # 8020018e <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    802019b8:	141025f3          	csrr	a1,sepc
  printf("sepc: %p\n", r_sepc());
    802019bc:	00008517          	auipc	a0,0x8
    802019c0:	c5450513          	addi	a0,a0,-940 # 80209610 <digits+0x290>
    802019c4:	ffffe097          	auipc	ra,0xffffe
    802019c8:	7ca080e7          	jalr	1994(ra) # 8020018e <printf>
  asm volatile("csrr %0, stvec" : "=r" (x) );
    802019cc:	105025f3          	csrr	a1,stvec
  printf("stvec: %p\n", r_stvec());
    802019d0:	00008517          	auipc	a0,0x8
    802019d4:	c5050513          	addi	a0,a0,-944 # 80209620 <digits+0x2a0>
    802019d8:	ffffe097          	auipc	ra,0xffffe
    802019dc:	7b6080e7          	jalr	1974(ra) # 8020018e <printf>
  asm volatile("csrr %0, satp" : "=r" (x) );
    802019e0:	180025f3          	csrr	a1,satp
  printf("satp: %p\n", r_satp());
    802019e4:	00008517          	auipc	a0,0x8
    802019e8:	c4c50513          	addi	a0,a0,-948 # 80209630 <digits+0x2b0>
    802019ec:	ffffe097          	auipc	ra,0xffffe
    802019f0:	7a2080e7          	jalr	1954(ra) # 8020018e <printf>
  asm volatile("csrr %0, scause" : "=r" (x) );
    802019f4:	142025f3          	csrr	a1,scause
  printf("scause: %p\n", r_scause());
    802019f8:	00008517          	auipc	a0,0x8
    802019fc:	c4850513          	addi	a0,a0,-952 # 80209640 <digits+0x2c0>
    80201a00:	ffffe097          	auipc	ra,0xffffe
    80201a04:	78e080e7          	jalr	1934(ra) # 8020018e <printf>
  asm volatile("csrr %0, stval" : "=r" (x) );
    80201a08:	143025f3          	csrr	a1,stval
  printf("stval: %p\n", r_stval());
    80201a0c:	00008517          	auipc	a0,0x8
    80201a10:	c4450513          	addi	a0,a0,-956 # 80209650 <digits+0x2d0>
    80201a14:	ffffe097          	auipc	ra,0xffffe
    80201a18:	77a080e7          	jalr	1914(ra) # 8020018e <printf>
  asm volatile("mv %0, sp" : "=r" (x) );
    80201a1c:	858a                	mv	a1,sp
  printf("sp: %p\n", r_sp());
    80201a1e:	00008517          	auipc	a0,0x8
    80201a22:	c4250513          	addi	a0,a0,-958 # 80209660 <digits+0x2e0>
    80201a26:	ffffe097          	auipc	ra,0xffffe
    80201a2a:	768080e7          	jalr	1896(ra) # 8020018e <printf>
  asm volatile("mv %0, tp" : "=r" (x) );
    80201a2e:	8592                	mv	a1,tp
  printf("tp: %p\n", r_tp());
    80201a30:	00008517          	auipc	a0,0x8
    80201a34:	c3850513          	addi	a0,a0,-968 # 80209668 <digits+0x2e8>
    80201a38:	ffffe097          	auipc	ra,0xffffe
    80201a3c:	756080e7          	jalr	1878(ra) # 8020018e <printf>
  asm volatile("mv %0, ra" : "=r" (x) );
    80201a40:	8586                	mv	a1,ra
  printf("ra: %p\n", r_ra());
    80201a42:	00008517          	auipc	a0,0x8
    80201a46:	c2e50513          	addi	a0,a0,-978 # 80209670 <digits+0x2f0>
    80201a4a:	ffffe097          	auipc	ra,0xffffe
    80201a4e:	744080e7          	jalr	1860(ra) # 8020018e <printf>
  printf("}\n");
    80201a52:	00008517          	auipc	a0,0x8
    80201a56:	c2650513          	addi	a0,a0,-986 # 80209678 <digits+0x2f8>
    80201a5a:	ffffe097          	auipc	ra,0xffffe
    80201a5e:	734080e7          	jalr	1844(ra) # 8020018e <printf>
}
    80201a62:	60a2                	ld	ra,8(sp)
    80201a64:	6402                	ld	s0,0(sp)
    80201a66:	0141                	addi	sp,sp,16
    80201a68:	8082                	ret

0000000080201a6a <procinit>:
{
    80201a6a:	7179                	addi	sp,sp,-48
    80201a6c:	f406                	sd	ra,40(sp)
    80201a6e:	f022                	sd	s0,32(sp)
    80201a70:	ec26                	sd	s1,24(sp)
    80201a72:	e84a                	sd	s2,16(sp)
    80201a74:	e44e                	sd	s3,8(sp)
    80201a76:	1800                	addi	s0,sp,48
  initlock(&pid_lock, "nextpid");
    80201a78:	00008597          	auipc	a1,0x8
    80201a7c:	c0858593          	addi	a1,a1,-1016 # 80209680 <digits+0x300>
    80201a80:	000a9517          	auipc	a0,0xa9
    80201a84:	5f050513          	addi	a0,a0,1520 # 802ab070 <pid_lock>
    80201a88:	fffff097          	auipc	ra,0xfffff
    80201a8c:	c28080e7          	jalr	-984(ra) # 802006b0 <initlock>
  for(p = proc; p < &proc[NPROC]; p++) {
    80201a90:	000aa497          	auipc	s1,0xaa
    80201a94:	87848493          	addi	s1,s1,-1928 # 802ab308 <proc>
      initlock(&p->lock, "proc");
    80201a98:	00008997          	auipc	s3,0x8
    80201a9c:	bf098993          	addi	s3,s3,-1040 # 80209688 <digits+0x308>
  for(p = proc; p < &proc[NPROC]; p++) {
    80201aa0:	000ae917          	auipc	s2,0xae
    80201aa4:	1d890913          	addi	s2,s2,472 # 802afc78 <initproc>
      initlock(&p->lock, "proc");
    80201aa8:	85ce                	mv	a1,s3
    80201aaa:	8526                	mv	a0,s1
    80201aac:	fffff097          	auipc	ra,0xfffff
    80201ab0:	c04080e7          	jalr	-1020(ra) # 802006b0 <initlock>
  for(p = proc; p < &proc[NPROC]; p++) {
    80201ab4:	17848493          	addi	s1,s1,376
    80201ab8:	ff2498e3          	bne	s1,s2,80201aa8 <procinit+0x3e>
  memset(cpus, 0, sizeof(cpus));
    80201abc:	28000613          	li	a2,640
    80201ac0:	4581                	li	a1,0
    80201ac2:	000a9517          	auipc	a0,0xa9
    80201ac6:	5c650513          	addi	a0,a0,1478 # 802ab088 <cpus>
    80201aca:	fffff097          	auipc	ra,0xfffff
    80201ace:	cc6080e7          	jalr	-826(ra) # 80200790 <memset>
  printf("procinit\n");
    80201ad2:	00008517          	auipc	a0,0x8
    80201ad6:	bbe50513          	addi	a0,a0,-1090 # 80209690 <digits+0x310>
    80201ada:	ffffe097          	auipc	ra,0xffffe
    80201ade:	6b4080e7          	jalr	1716(ra) # 8020018e <printf>
}
    80201ae2:	70a2                	ld	ra,40(sp)
    80201ae4:	7402                	ld	s0,32(sp)
    80201ae6:	64e2                	ld	s1,24(sp)
    80201ae8:	6942                	ld	s2,16(sp)
    80201aea:	69a2                	ld	s3,8(sp)
    80201aec:	6145                	addi	sp,sp,48
    80201aee:	8082                	ret

0000000080201af0 <cpuid>:
{
    80201af0:	1141                	addi	sp,sp,-16
    80201af2:	e422                	sd	s0,8(sp)
    80201af4:	0800                	addi	s0,sp,16
  asm volatile("mv %0, tp" : "=r" (x) );
    80201af6:	8512                	mv	a0,tp
}
    80201af8:	2501                	sext.w	a0,a0
    80201afa:	6422                	ld	s0,8(sp)
    80201afc:	0141                	addi	sp,sp,16
    80201afe:	8082                	ret

0000000080201b00 <mycpu>:
mycpu(void) {
    80201b00:	1141                	addi	sp,sp,-16
    80201b02:	e422                	sd	s0,8(sp)
    80201b04:	0800                	addi	s0,sp,16
    80201b06:	8792                	mv	a5,tp
  struct cpu *c = &cpus[id];
    80201b08:	2781                	sext.w	a5,a5
    80201b0a:	079e                	slli	a5,a5,0x7
}
    80201b0c:	000a9517          	auipc	a0,0xa9
    80201b10:	57c50513          	addi	a0,a0,1404 # 802ab088 <cpus>
    80201b14:	953e                	add	a0,a0,a5
    80201b16:	6422                	ld	s0,8(sp)
    80201b18:	0141                	addi	sp,sp,16
    80201b1a:	8082                	ret

0000000080201b1c <myproc>:
myproc(void) {
    80201b1c:	1101                	addi	sp,sp,-32
    80201b1e:	ec06                	sd	ra,24(sp)
    80201b20:	e822                	sd	s0,16(sp)
    80201b22:	e426                	sd	s1,8(sp)
    80201b24:	1000                	addi	s0,sp,32
  push_off();
    80201b26:	fffff097          	auipc	ra,0xfffff
    80201b2a:	ade080e7          	jalr	-1314(ra) # 80200604 <push_off>
    80201b2e:	8792                	mv	a5,tp
  struct proc *p = c->proc;
    80201b30:	2781                	sext.w	a5,a5
    80201b32:	079e                	slli	a5,a5,0x7
    80201b34:	000a9717          	auipc	a4,0xa9
    80201b38:	53c70713          	addi	a4,a4,1340 # 802ab070 <pid_lock>
    80201b3c:	97ba                	add	a5,a5,a4
    80201b3e:	6f84                	ld	s1,24(a5)
  pop_off();
    80201b40:	fffff097          	auipc	ra,0xfffff
    80201b44:	b10080e7          	jalr	-1264(ra) # 80200650 <pop_off>
}
    80201b48:	8526                	mv	a0,s1
    80201b4a:	60e2                	ld	ra,24(sp)
    80201b4c:	6442                	ld	s0,16(sp)
    80201b4e:	64a2                	ld	s1,8(sp)
    80201b50:	6105                	addi	sp,sp,32
    80201b52:	8082                	ret

0000000080201b54 <forkret>:
{
    80201b54:	1101                	addi	sp,sp,-32
    80201b56:	ec06                	sd	ra,24(sp)
    80201b58:	e822                	sd	s0,16(sp)
    80201b5a:	e426                	sd	s1,8(sp)
    80201b5c:	1000                	addi	s0,sp,32
  release(&myproc()->lock);
    80201b5e:	00000097          	auipc	ra,0x0
    80201b62:	fbe080e7          	jalr	-66(ra) # 80201b1c <myproc>
    80201b66:	fffff097          	auipc	ra,0xfffff
    80201b6a:	be2080e7          	jalr	-1054(ra) # 80200748 <release>
  if (first) {
    80201b6e:	00099797          	auipc	a5,0x99
    80201b72:	a1a7a783          	lw	a5,-1510(a5) # 8029a588 <first.1680>
    80201b76:	eb91                	bnez	a5,80201b8a <forkret+0x36>
  usertrapret();
    80201b78:	00001097          	auipc	ra,0x1
    80201b7c:	c7e080e7          	jalr	-898(ra) # 802027f6 <usertrapret>
}
    80201b80:	60e2                	ld	ra,24(sp)
    80201b82:	6442                	ld	s0,16(sp)
    80201b84:	64a2                	ld	s1,8(sp)
    80201b86:	6105                	addi	sp,sp,32
    80201b88:	8082                	ret
    first = 0;
    80201b8a:	00099797          	auipc	a5,0x99
    80201b8e:	9e07af23          	sw	zero,-1538(a5) # 8029a588 <first.1680>
    fat32_init();
    80201b92:	00004097          	auipc	ra,0x4
    80201b96:	16e080e7          	jalr	366(ra) # 80205d00 <fat32_init>
    myproc()->cwd = ename("/");
    80201b9a:	00000097          	auipc	ra,0x0
    80201b9e:	f82080e7          	jalr	-126(ra) # 80201b1c <myproc>
    80201ba2:	84aa                	mv	s1,a0
    80201ba4:	00008517          	auipc	a0,0x8
    80201ba8:	afc50513          	addi	a0,a0,-1284 # 802096a0 <digits+0x320>
    80201bac:	00005097          	auipc	ra,0x5
    80201bb0:	406080e7          	jalr	1030(ra) # 80206fb2 <ename>
    80201bb4:	14a4bc23          	sd	a0,344(s1)
    80201bb8:	b7c1                	j	80201b78 <forkret+0x24>

0000000080201bba <allocpid>:
allocpid() {
    80201bba:	1101                	addi	sp,sp,-32
    80201bbc:	ec06                	sd	ra,24(sp)
    80201bbe:	e822                	sd	s0,16(sp)
    80201bc0:	e426                	sd	s1,8(sp)
    80201bc2:	e04a                	sd	s2,0(sp)
    80201bc4:	1000                	addi	s0,sp,32
  acquire(&pid_lock);
    80201bc6:	000a9917          	auipc	s2,0xa9
    80201bca:	4aa90913          	addi	s2,s2,1194 # 802ab070 <pid_lock>
    80201bce:	854a                	mv	a0,s2
    80201bd0:	fffff097          	auipc	ra,0xfffff
    80201bd4:	b24080e7          	jalr	-1244(ra) # 802006f4 <acquire>
  pid = nextpid;
    80201bd8:	00099797          	auipc	a5,0x99
    80201bdc:	9b478793          	addi	a5,a5,-1612 # 8029a58c <nextpid>
    80201be0:	4384                	lw	s1,0(a5)
  nextpid = nextpid + 1;
    80201be2:	0014871b          	addiw	a4,s1,1
    80201be6:	c398                	sw	a4,0(a5)
  release(&pid_lock);
    80201be8:	854a                	mv	a0,s2
    80201bea:	fffff097          	auipc	ra,0xfffff
    80201bee:	b5e080e7          	jalr	-1186(ra) # 80200748 <release>
}
    80201bf2:	8526                	mv	a0,s1
    80201bf4:	60e2                	ld	ra,24(sp)
    80201bf6:	6442                	ld	s0,16(sp)
    80201bf8:	64a2                	ld	s1,8(sp)
    80201bfa:	6902                	ld	s2,0(sp)
    80201bfc:	6105                	addi	sp,sp,32
    80201bfe:	8082                	ret

0000000080201c00 <proc_pagetable>:
{
    80201c00:	1101                	addi	sp,sp,-32
    80201c02:	ec06                	sd	ra,24(sp)
    80201c04:	e822                	sd	s0,16(sp)
    80201c06:	e426                	sd	s1,8(sp)
    80201c08:	e04a                	sd	s2,0(sp)
    80201c0a:	1000                	addi	s0,sp,32
    80201c0c:	892a                	mv	s2,a0
  pagetable = uvmcreate();
    80201c0e:	fffff097          	auipc	ra,0xfffff
    80201c12:	39a080e7          	jalr	922(ra) # 80200fa8 <uvmcreate>
    80201c16:	84aa                	mv	s1,a0
  if(pagetable == 0)
    80201c18:	c121                	beqz	a0,80201c58 <proc_pagetable+0x58>
  if(mappages(pagetable, TRAMPOLINE, PGSIZE,
    80201c1a:	4729                	li	a4,10
    80201c1c:	00006697          	auipc	a3,0x6
    80201c20:	3e468693          	addi	a3,a3,996 # 80208000 <_trampoline>
    80201c24:	6605                	lui	a2,0x1
    80201c26:	040005b7          	lui	a1,0x4000
    80201c2a:	15fd                	addi	a1,a1,-1
    80201c2c:	05b2                	slli	a1,a1,0xc
    80201c2e:	fffff097          	auipc	ra,0xfffff
    80201c32:	102080e7          	jalr	258(ra) # 80200d30 <mappages>
    80201c36:	02054863          	bltz	a0,80201c66 <proc_pagetable+0x66>
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
    80201c3a:	4719                	li	a4,6
    80201c3c:	06093683          	ld	a3,96(s2)
    80201c40:	6605                	lui	a2,0x1
    80201c42:	020005b7          	lui	a1,0x2000
    80201c46:	15fd                	addi	a1,a1,-1
    80201c48:	05b6                	slli	a1,a1,0xd
    80201c4a:	8526                	mv	a0,s1
    80201c4c:	fffff097          	auipc	ra,0xfffff
    80201c50:	0e4080e7          	jalr	228(ra) # 80200d30 <mappages>
    80201c54:	02054163          	bltz	a0,80201c76 <proc_pagetable+0x76>
}
    80201c58:	8526                	mv	a0,s1
    80201c5a:	60e2                	ld	ra,24(sp)
    80201c5c:	6442                	ld	s0,16(sp)
    80201c5e:	64a2                	ld	s1,8(sp)
    80201c60:	6902                	ld	s2,0(sp)
    80201c62:	6105                	addi	sp,sp,32
    80201c64:	8082                	ret
    uvmfree(pagetable, 0);
    80201c66:	4581                	li	a1,0
    80201c68:	8526                	mv	a0,s1
    80201c6a:	fffff097          	auipc	ra,0xfffff
    80201c6e:	5c2080e7          	jalr	1474(ra) # 8020122c <uvmfree>
    return NULL;
    80201c72:	4481                	li	s1,0
    80201c74:	b7d5                	j	80201c58 <proc_pagetable+0x58>
    vmunmap(pagetable, TRAMPOLINE, 1, 0);
    80201c76:	4681                	li	a3,0
    80201c78:	4605                	li	a2,1
    80201c7a:	040005b7          	lui	a1,0x4000
    80201c7e:	15fd                	addi	a1,a1,-1
    80201c80:	05b2                	slli	a1,a1,0xc
    80201c82:	8526                	mv	a0,s1
    80201c84:	fffff097          	auipc	ra,0xfffff
    80201c88:	260080e7          	jalr	608(ra) # 80200ee4 <vmunmap>
    uvmfree(pagetable, 0);
    80201c8c:	4581                	li	a1,0
    80201c8e:	8526                	mv	a0,s1
    80201c90:	fffff097          	auipc	ra,0xfffff
    80201c94:	59c080e7          	jalr	1436(ra) # 8020122c <uvmfree>
    return NULL;
    80201c98:	4481                	li	s1,0
    80201c9a:	bf7d                	j	80201c58 <proc_pagetable+0x58>

0000000080201c9c <proc_freepagetable>:
{
    80201c9c:	1101                	addi	sp,sp,-32
    80201c9e:	ec06                	sd	ra,24(sp)
    80201ca0:	e822                	sd	s0,16(sp)
    80201ca2:	e426                	sd	s1,8(sp)
    80201ca4:	e04a                	sd	s2,0(sp)
    80201ca6:	1000                	addi	s0,sp,32
    80201ca8:	84aa                	mv	s1,a0
    80201caa:	892e                	mv	s2,a1
  vmunmap(pagetable, TRAMPOLINE, 1, 0);
    80201cac:	4681                	li	a3,0
    80201cae:	4605                	li	a2,1
    80201cb0:	040005b7          	lui	a1,0x4000
    80201cb4:	15fd                	addi	a1,a1,-1
    80201cb6:	05b2                	slli	a1,a1,0xc
    80201cb8:	fffff097          	auipc	ra,0xfffff
    80201cbc:	22c080e7          	jalr	556(ra) # 80200ee4 <vmunmap>
  vmunmap(pagetable, TRAPFRAME, 1, 0);
    80201cc0:	4681                	li	a3,0
    80201cc2:	4605                	li	a2,1
    80201cc4:	020005b7          	lui	a1,0x2000
    80201cc8:	15fd                	addi	a1,a1,-1
    80201cca:	05b6                	slli	a1,a1,0xd
    80201ccc:	8526                	mv	a0,s1
    80201cce:	fffff097          	auipc	ra,0xfffff
    80201cd2:	216080e7          	jalr	534(ra) # 80200ee4 <vmunmap>
  uvmfree(pagetable, sz);
    80201cd6:	85ca                	mv	a1,s2
    80201cd8:	8526                	mv	a0,s1
    80201cda:	fffff097          	auipc	ra,0xfffff
    80201cde:	552080e7          	jalr	1362(ra) # 8020122c <uvmfree>
}
    80201ce2:	60e2                	ld	ra,24(sp)
    80201ce4:	6442                	ld	s0,16(sp)
    80201ce6:	64a2                	ld	s1,8(sp)
    80201ce8:	6902                	ld	s2,0(sp)
    80201cea:	6105                	addi	sp,sp,32
    80201cec:	8082                	ret

0000000080201cee <freeproc>:
{
    80201cee:	1101                	addi	sp,sp,-32
    80201cf0:	ec06                	sd	ra,24(sp)
    80201cf2:	e822                	sd	s0,16(sp)
    80201cf4:	e426                	sd	s1,8(sp)
    80201cf6:	1000                	addi	s0,sp,32
    80201cf8:	84aa                	mv	s1,a0
  if(p->trapframe)
    80201cfa:	7128                	ld	a0,96(a0)
    80201cfc:	c509                	beqz	a0,80201d06 <freeproc+0x18>
    kfree((void*)p->trapframe);
    80201cfe:	ffffe097          	auipc	ra,0xffffe
    80201d02:	748080e7          	jalr	1864(ra) # 80200446 <kfree>
  p->trapframe = 0;
    80201d06:	0604b023          	sd	zero,96(s1)
  if (p->kpagetable) {
    80201d0a:	6ca8                	ld	a0,88(s1)
    80201d0c:	c511                	beqz	a0,80201d18 <freeproc+0x2a>
    kvmfree(p->kpagetable, 1);
    80201d0e:	4585                	li	a1,1
    80201d10:	00000097          	auipc	ra,0x0
    80201d14:	a22080e7          	jalr	-1502(ra) # 80201732 <kvmfree>
  p->kpagetable = 0;
    80201d18:	0404bc23          	sd	zero,88(s1)
  if(p->pagetable)
    80201d1c:	68a8                	ld	a0,80(s1)
    80201d1e:	c511                	beqz	a0,80201d2a <freeproc+0x3c>
    proc_freepagetable(p->pagetable, p->sz);
    80201d20:	64ac                	ld	a1,72(s1)
    80201d22:	00000097          	auipc	ra,0x0
    80201d26:	f7a080e7          	jalr	-134(ra) # 80201c9c <proc_freepagetable>
  p->pagetable = 0;
    80201d2a:	0404b823          	sd	zero,80(s1)
  p->sz = 0;
    80201d2e:	0404b423          	sd	zero,72(s1)
  p->pid = 0;
    80201d32:	0204ac23          	sw	zero,56(s1)
  p->parent = 0;
    80201d36:	0204b023          	sd	zero,32(s1)
  p->name[0] = 0;
    80201d3a:	16048023          	sb	zero,352(s1)
  p->chan = 0;
    80201d3e:	0204b423          	sd	zero,40(s1)
  p->killed = 0;
    80201d42:	0204a823          	sw	zero,48(s1)
  p->xstate = 0;
    80201d46:	0204aa23          	sw	zero,52(s1)
  p->state = UNUSED;
    80201d4a:	0004ac23          	sw	zero,24(s1)
}
    80201d4e:	60e2                	ld	ra,24(sp)
    80201d50:	6442                	ld	s0,16(sp)
    80201d52:	64a2                	ld	s1,8(sp)
    80201d54:	6105                	addi	sp,sp,32
    80201d56:	8082                	ret

0000000080201d58 <allocproc>:
{
    80201d58:	1101                	addi	sp,sp,-32
    80201d5a:	ec06                	sd	ra,24(sp)
    80201d5c:	e822                	sd	s0,16(sp)
    80201d5e:	e426                	sd	s1,8(sp)
    80201d60:	e04a                	sd	s2,0(sp)
    80201d62:	1000                	addi	s0,sp,32
  for(p = proc; p < &proc[NPROC]; p++) {
    80201d64:	000a9497          	auipc	s1,0xa9
    80201d68:	5a448493          	addi	s1,s1,1444 # 802ab308 <proc>
    80201d6c:	000ae917          	auipc	s2,0xae
    80201d70:	f0c90913          	addi	s2,s2,-244 # 802afc78 <initproc>
    acquire(&p->lock);
    80201d74:	8526                	mv	a0,s1
    80201d76:	fffff097          	auipc	ra,0xfffff
    80201d7a:	97e080e7          	jalr	-1666(ra) # 802006f4 <acquire>
    if(p->state == UNUSED) {
    80201d7e:	4c9c                	lw	a5,24(s1)
    80201d80:	cf81                	beqz	a5,80201d98 <allocproc+0x40>
      release(&p->lock);
    80201d82:	8526                	mv	a0,s1
    80201d84:	fffff097          	auipc	ra,0xfffff
    80201d88:	9c4080e7          	jalr	-1596(ra) # 80200748 <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    80201d8c:	17848493          	addi	s1,s1,376
    80201d90:	ff2492e3          	bne	s1,s2,80201d74 <allocproc+0x1c>
  return NULL;
    80201d94:	4481                	li	s1,0
    80201d96:	a085                	j	80201df6 <allocproc+0x9e>
  p->pid = allocpid();
    80201d98:	00000097          	auipc	ra,0x0
    80201d9c:	e22080e7          	jalr	-478(ra) # 80201bba <allocpid>
    80201da0:	dc88                	sw	a0,56(s1)
  if((p->trapframe = (struct trapframe *)kalloc()) == NULL){
    80201da2:	ffffe097          	auipc	ra,0xffffe
    80201da6:	7e6080e7          	jalr	2022(ra) # 80200588 <kalloc>
    80201daa:	892a                	mv	s2,a0
    80201dac:	f0a8                	sd	a0,96(s1)
    80201dae:	c939                	beqz	a0,80201e04 <allocproc+0xac>
  if ((p->pagetable = proc_pagetable(p)) == NULL ||
    80201db0:	8526                	mv	a0,s1
    80201db2:	00000097          	auipc	ra,0x0
    80201db6:	e4e080e7          	jalr	-434(ra) # 80201c00 <proc_pagetable>
    80201dba:	e8a8                	sd	a0,80(s1)
    80201dbc:	c939                	beqz	a0,80201e12 <allocproc+0xba>
      (p->kpagetable = proc_kpagetable()) == NULL) {
    80201dbe:	00000097          	auipc	ra,0x0
    80201dc2:	9ce080e7          	jalr	-1586(ra) # 8020178c <proc_kpagetable>
    80201dc6:	eca8                	sd	a0,88(s1)
  if ((p->pagetable = proc_pagetable(p)) == NULL ||
    80201dc8:	c529                	beqz	a0,80201e12 <allocproc+0xba>
  p->kstack = VKSTACK;
    80201dca:	0fb00793          	li	a5,251
    80201dce:	07fa                	slli	a5,a5,0x1e
    80201dd0:	e0bc                	sd	a5,64(s1)
  memset(&p->context, 0, sizeof(p->context));
    80201dd2:	07000613          	li	a2,112
    80201dd6:	4581                	li	a1,0
    80201dd8:	06848513          	addi	a0,s1,104
    80201ddc:	fffff097          	auipc	ra,0xfffff
    80201de0:	9b4080e7          	jalr	-1612(ra) # 80200790 <memset>
  p->context.ra = (uint64)forkret;
    80201de4:	00000797          	auipc	a5,0x0
    80201de8:	d7078793          	addi	a5,a5,-656 # 80201b54 <forkret>
    80201dec:	f4bc                	sd	a5,104(s1)
  p->context.sp = p->kstack + PGSIZE;
    80201dee:	60bc                	ld	a5,64(s1)
    80201df0:	6705                	lui	a4,0x1
    80201df2:	97ba                	add	a5,a5,a4
    80201df4:	f8bc                	sd	a5,112(s1)
}
    80201df6:	8526                	mv	a0,s1
    80201df8:	60e2                	ld	ra,24(sp)
    80201dfa:	6442                	ld	s0,16(sp)
    80201dfc:	64a2                	ld	s1,8(sp)
    80201dfe:	6902                	ld	s2,0(sp)
    80201e00:	6105                	addi	sp,sp,32
    80201e02:	8082                	ret
    release(&p->lock);
    80201e04:	8526                	mv	a0,s1
    80201e06:	fffff097          	auipc	ra,0xfffff
    80201e0a:	942080e7          	jalr	-1726(ra) # 80200748 <release>
    return NULL;
    80201e0e:	84ca                	mv	s1,s2
    80201e10:	b7dd                	j	80201df6 <allocproc+0x9e>
    freeproc(p);
    80201e12:	8526                	mv	a0,s1
    80201e14:	00000097          	auipc	ra,0x0
    80201e18:	eda080e7          	jalr	-294(ra) # 80201cee <freeproc>
    release(&p->lock);
    80201e1c:	8526                	mv	a0,s1
    80201e1e:	fffff097          	auipc	ra,0xfffff
    80201e22:	92a080e7          	jalr	-1750(ra) # 80200748 <release>
    return NULL;
    80201e26:	4481                	li	s1,0
    80201e28:	b7f9                	j	80201df6 <allocproc+0x9e>

0000000080201e2a <userinit>:
{
    80201e2a:	1101                	addi	sp,sp,-32
    80201e2c:	ec06                	sd	ra,24(sp)
    80201e2e:	e822                	sd	s0,16(sp)
    80201e30:	e426                	sd	s1,8(sp)
    80201e32:	1000                	addi	s0,sp,32
  p = allocproc();
    80201e34:	00000097          	auipc	ra,0x0
    80201e38:	f24080e7          	jalr	-220(ra) # 80201d58 <allocproc>
    80201e3c:	84aa                	mv	s1,a0
  initproc = p;
    80201e3e:	000ae797          	auipc	a5,0xae
    80201e42:	e2a7bd23          	sd	a0,-454(a5) # 802afc78 <initproc>
  uvminit(p->pagetable , p->kpagetable, initcode, sizeof(initcode));
    80201e46:	03400693          	li	a3,52
    80201e4a:	00098617          	auipc	a2,0x98
    80201e4e:	61e60613          	addi	a2,a2,1566 # 8029a468 <initcode>
    80201e52:	6d2c                	ld	a1,88(a0)
    80201e54:	6928                	ld	a0,80(a0)
    80201e56:	fffff097          	auipc	ra,0xfffff
    80201e5a:	180080e7          	jalr	384(ra) # 80200fd6 <uvminit>
  p->sz = PGSIZE;
    80201e5e:	6785                	lui	a5,0x1
    80201e60:	e4bc                	sd	a5,72(s1)
  p->trapframe->epc = 0x0;      // user program counter
    80201e62:	70b8                	ld	a4,96(s1)
    80201e64:	00073c23          	sd	zero,24(a4) # 1018 <_entry-0x801fefe8>
  p->trapframe->sp = PGSIZE;  // user stack pointer
    80201e68:	70b8                	ld	a4,96(s1)
    80201e6a:	fb1c                	sd	a5,48(a4)
  safestrcpy(p->name, "initcode", sizeof(p->name));
    80201e6c:	4641                	li	a2,16
    80201e6e:	00008597          	auipc	a1,0x8
    80201e72:	83a58593          	addi	a1,a1,-1990 # 802096a8 <digits+0x328>
    80201e76:	16048513          	addi	a0,s1,352
    80201e7a:	fffff097          	auipc	ra,0xfffff
    80201e7e:	a6c080e7          	jalr	-1428(ra) # 802008e6 <safestrcpy>
  p->state = RUNNABLE;
    80201e82:	4789                	li	a5,2
    80201e84:	cc9c                	sw	a5,24(s1)
  p->tmask = 0;
    80201e86:	1604a823          	sw	zero,368(s1)
  release(&p->lock);
    80201e8a:	8526                	mv	a0,s1
    80201e8c:	fffff097          	auipc	ra,0xfffff
    80201e90:	8bc080e7          	jalr	-1860(ra) # 80200748 <release>
  printf("userinit\n");
    80201e94:	00008517          	auipc	a0,0x8
    80201e98:	82450513          	addi	a0,a0,-2012 # 802096b8 <digits+0x338>
    80201e9c:	ffffe097          	auipc	ra,0xffffe
    80201ea0:	2f2080e7          	jalr	754(ra) # 8020018e <printf>
}
    80201ea4:	60e2                	ld	ra,24(sp)
    80201ea6:	6442                	ld	s0,16(sp)
    80201ea8:	64a2                	ld	s1,8(sp)
    80201eaa:	6105                	addi	sp,sp,32
    80201eac:	8082                	ret

0000000080201eae <growproc>:
{
    80201eae:	1101                	addi	sp,sp,-32
    80201eb0:	ec06                	sd	ra,24(sp)
    80201eb2:	e822                	sd	s0,16(sp)
    80201eb4:	e426                	sd	s1,8(sp)
    80201eb6:	e04a                	sd	s2,0(sp)
    80201eb8:	1000                	addi	s0,sp,32
    80201eba:	84aa                	mv	s1,a0
  struct proc *p = myproc();
    80201ebc:	00000097          	auipc	ra,0x0
    80201ec0:	c60080e7          	jalr	-928(ra) # 80201b1c <myproc>
    80201ec4:	892a                	mv	s2,a0
  sz = p->sz;
    80201ec6:	6530                	ld	a2,72(a0)
    80201ec8:	0006069b          	sext.w	a3,a2
  if(n > 0){
    80201ecc:	00904f63          	bgtz	s1,80201eea <growproc+0x3c>
  } else if(n < 0){
    80201ed0:	0204cd63          	bltz	s1,80201f0a <growproc+0x5c>
  p->sz = sz;
    80201ed4:	1682                	slli	a3,a3,0x20
    80201ed6:	9281                	srli	a3,a3,0x20
    80201ed8:	04d93423          	sd	a3,72(s2)
  return 0;
    80201edc:	4501                	li	a0,0
}
    80201ede:	60e2                	ld	ra,24(sp)
    80201ee0:	6442                	ld	s0,16(sp)
    80201ee2:	64a2                	ld	s1,8(sp)
    80201ee4:	6902                	ld	s2,0(sp)
    80201ee6:	6105                	addi	sp,sp,32
    80201ee8:	8082                	ret
    if((sz = uvmalloc(p->pagetable, p->kpagetable, sz, sz + n)) == 0) {
    80201eea:	9ea5                	addw	a3,a3,s1
    80201eec:	1682                	slli	a3,a3,0x20
    80201eee:	9281                	srli	a3,a3,0x20
    80201ef0:	1602                	slli	a2,a2,0x20
    80201ef2:	9201                	srli	a2,a2,0x20
    80201ef4:	6d2c                	ld	a1,88(a0)
    80201ef6:	6928                	ld	a0,80(a0)
    80201ef8:	fffff097          	auipc	ra,0xfffff
    80201efc:	1d4080e7          	jalr	468(ra) # 802010cc <uvmalloc>
    80201f00:	0005069b          	sext.w	a3,a0
    80201f04:	fae1                	bnez	a3,80201ed4 <growproc+0x26>
      return -1;
    80201f06:	557d                	li	a0,-1
    80201f08:	bfd9                	j	80201ede <growproc+0x30>
    sz = uvmdealloc(p->pagetable, p->kpagetable, sz, sz + n);
    80201f0a:	9ea5                	addw	a3,a3,s1
    80201f0c:	1682                	slli	a3,a3,0x20
    80201f0e:	9281                	srli	a3,a3,0x20
    80201f10:	1602                	slli	a2,a2,0x20
    80201f12:	9201                	srli	a2,a2,0x20
    80201f14:	6d2c                	ld	a1,88(a0)
    80201f16:	6928                	ld	a0,80(a0)
    80201f18:	fffff097          	auipc	ra,0xfffff
    80201f1c:	148080e7          	jalr	328(ra) # 80201060 <uvmdealloc>
    80201f20:	0005069b          	sext.w	a3,a0
    80201f24:	bf45                	j	80201ed4 <growproc+0x26>

0000000080201f26 <fork>:
{
    80201f26:	7179                	addi	sp,sp,-48
    80201f28:	f406                	sd	ra,40(sp)
    80201f2a:	f022                	sd	s0,32(sp)
    80201f2c:	ec26                	sd	s1,24(sp)
    80201f2e:	e84a                	sd	s2,16(sp)
    80201f30:	e44e                	sd	s3,8(sp)
    80201f32:	e052                	sd	s4,0(sp)
    80201f34:	1800                	addi	s0,sp,48
  struct proc *p = myproc();
    80201f36:	00000097          	auipc	ra,0x0
    80201f3a:	be6080e7          	jalr	-1050(ra) # 80201b1c <myproc>
    80201f3e:	892a                	mv	s2,a0
  if((np = allocproc()) == NULL){
    80201f40:	00000097          	auipc	ra,0x0
    80201f44:	e18080e7          	jalr	-488(ra) # 80201d58 <allocproc>
    80201f48:	c57d                	beqz	a0,80202036 <fork+0x110>
    80201f4a:	89aa                	mv	s3,a0
  if(uvmcopy(p->pagetable, np->pagetable, np->kpagetable, p->sz) < 0){
    80201f4c:	04893683          	ld	a3,72(s2)
    80201f50:	6d30                	ld	a2,88(a0)
    80201f52:	692c                	ld	a1,80(a0)
    80201f54:	05093503          	ld	a0,80(s2)
    80201f58:	fffff097          	auipc	ra,0xfffff
    80201f5c:	30c080e7          	jalr	780(ra) # 80201264 <uvmcopy>
    80201f60:	04054c63          	bltz	a0,80201fb8 <fork+0x92>
  np->sz = p->sz;
    80201f64:	04893783          	ld	a5,72(s2)
    80201f68:	04f9b423          	sd	a5,72(s3)
  np->parent = p;
    80201f6c:	0329b023          	sd	s2,32(s3)
  np->tmask = p->tmask;
    80201f70:	17092783          	lw	a5,368(s2)
    80201f74:	16f9a823          	sw	a5,368(s3)
  *(np->trapframe) = *(p->trapframe);
    80201f78:	06093683          	ld	a3,96(s2)
    80201f7c:	87b6                	mv	a5,a3
    80201f7e:	0609b703          	ld	a4,96(s3)
    80201f82:	12068693          	addi	a3,a3,288
    80201f86:	0007b803          	ld	a6,0(a5) # 1000 <_entry-0x801ff000>
    80201f8a:	6788                	ld	a0,8(a5)
    80201f8c:	6b8c                	ld	a1,16(a5)
    80201f8e:	6f90                	ld	a2,24(a5)
    80201f90:	01073023          	sd	a6,0(a4)
    80201f94:	e708                	sd	a0,8(a4)
    80201f96:	eb0c                	sd	a1,16(a4)
    80201f98:	ef10                	sd	a2,24(a4)
    80201f9a:	02078793          	addi	a5,a5,32
    80201f9e:	02070713          	addi	a4,a4,32
    80201fa2:	fed792e3          	bne	a5,a3,80201f86 <fork+0x60>
  np->trapframe->a0 = 0;
    80201fa6:	0609b783          	ld	a5,96(s3)
    80201faa:	0607b823          	sd	zero,112(a5)
    80201fae:	0d800493          	li	s1,216
  for(i = 0; i < NOFILE; i++)
    80201fb2:	15800a13          	li	s4,344
    80201fb6:	a03d                	j	80201fe4 <fork+0xbe>
    freeproc(np);
    80201fb8:	854e                	mv	a0,s3
    80201fba:	00000097          	auipc	ra,0x0
    80201fbe:	d34080e7          	jalr	-716(ra) # 80201cee <freeproc>
    release(&np->lock);
    80201fc2:	854e                	mv	a0,s3
    80201fc4:	ffffe097          	auipc	ra,0xffffe
    80201fc8:	784080e7          	jalr	1924(ra) # 80200748 <release>
    return -1;
    80201fcc:	54fd                	li	s1,-1
    80201fce:	a899                	j	80202024 <fork+0xfe>
      np->ofile[i] = filedup(p->ofile[i]);
    80201fd0:	00002097          	auipc	ra,0x2
    80201fd4:	88c080e7          	jalr	-1908(ra) # 8020385c <filedup>
    80201fd8:	009987b3          	add	a5,s3,s1
    80201fdc:	e388                	sd	a0,0(a5)
  for(i = 0; i < NOFILE; i++)
    80201fde:	04a1                	addi	s1,s1,8
    80201fe0:	01448763          	beq	s1,s4,80201fee <fork+0xc8>
    if(p->ofile[i])
    80201fe4:	009907b3          	add	a5,s2,s1
    80201fe8:	6388                	ld	a0,0(a5)
    80201fea:	f17d                	bnez	a0,80201fd0 <fork+0xaa>
    80201fec:	bfcd                	j	80201fde <fork+0xb8>
  np->cwd = edup(p->cwd);
    80201fee:	15893503          	ld	a0,344(s2)
    80201ff2:	00004097          	auipc	ra,0x4
    80201ff6:	5cc080e7          	jalr	1484(ra) # 802065be <edup>
    80201ffa:	14a9bc23          	sd	a0,344(s3)
  safestrcpy(np->name, p->name, sizeof(p->name));
    80201ffe:	4641                	li	a2,16
    80202000:	16090593          	addi	a1,s2,352
    80202004:	16098513          	addi	a0,s3,352
    80202008:	fffff097          	auipc	ra,0xfffff
    8020200c:	8de080e7          	jalr	-1826(ra) # 802008e6 <safestrcpy>
  pid = np->pid;
    80202010:	0389a483          	lw	s1,56(s3)
  np->state = RUNNABLE;
    80202014:	4789                	li	a5,2
    80202016:	00f9ac23          	sw	a5,24(s3)
  release(&np->lock);
    8020201a:	854e                	mv	a0,s3
    8020201c:	ffffe097          	auipc	ra,0xffffe
    80202020:	72c080e7          	jalr	1836(ra) # 80200748 <release>
}
    80202024:	8526                	mv	a0,s1
    80202026:	70a2                	ld	ra,40(sp)
    80202028:	7402                	ld	s0,32(sp)
    8020202a:	64e2                	ld	s1,24(sp)
    8020202c:	6942                	ld	s2,16(sp)
    8020202e:	69a2                	ld	s3,8(sp)
    80202030:	6a02                	ld	s4,0(sp)
    80202032:	6145                	addi	sp,sp,48
    80202034:	8082                	ret
    return -1;
    80202036:	54fd                	li	s1,-1
    80202038:	b7f5                	j	80202024 <fork+0xfe>

000000008020203a <reparent>:
{
    8020203a:	7179                	addi	sp,sp,-48
    8020203c:	f406                	sd	ra,40(sp)
    8020203e:	f022                	sd	s0,32(sp)
    80202040:	ec26                	sd	s1,24(sp)
    80202042:	e84a                	sd	s2,16(sp)
    80202044:	e44e                	sd	s3,8(sp)
    80202046:	e052                	sd	s4,0(sp)
    80202048:	1800                	addi	s0,sp,48
    8020204a:	892a                	mv	s2,a0
  for(pp = proc; pp < &proc[NPROC]; pp++){
    8020204c:	000a9497          	auipc	s1,0xa9
    80202050:	2bc48493          	addi	s1,s1,700 # 802ab308 <proc>
      pp->parent = initproc;
    80202054:	000aea17          	auipc	s4,0xae
    80202058:	c24a0a13          	addi	s4,s4,-988 # 802afc78 <initproc>
  for(pp = proc; pp < &proc[NPROC]; pp++){
    8020205c:	000ae997          	auipc	s3,0xae
    80202060:	c1c98993          	addi	s3,s3,-996 # 802afc78 <initproc>
    80202064:	a029                	j	8020206e <reparent+0x34>
    80202066:	17848493          	addi	s1,s1,376
    8020206a:	03348363          	beq	s1,s3,80202090 <reparent+0x56>
    if(pp->parent == p){
    8020206e:	709c                	ld	a5,32(s1)
    80202070:	ff279be3          	bne	a5,s2,80202066 <reparent+0x2c>
      acquire(&pp->lock);
    80202074:	8526                	mv	a0,s1
    80202076:	ffffe097          	auipc	ra,0xffffe
    8020207a:	67e080e7          	jalr	1662(ra) # 802006f4 <acquire>
      pp->parent = initproc;
    8020207e:	000a3783          	ld	a5,0(s4)
    80202082:	f09c                	sd	a5,32(s1)
      release(&pp->lock);
    80202084:	8526                	mv	a0,s1
    80202086:	ffffe097          	auipc	ra,0xffffe
    8020208a:	6c2080e7          	jalr	1730(ra) # 80200748 <release>
    8020208e:	bfe1                	j	80202066 <reparent+0x2c>
}
    80202090:	70a2                	ld	ra,40(sp)
    80202092:	7402                	ld	s0,32(sp)
    80202094:	64e2                	ld	s1,24(sp)
    80202096:	6942                	ld	s2,16(sp)
    80202098:	69a2                	ld	s3,8(sp)
    8020209a:	6a02                	ld	s4,0(sp)
    8020209c:	6145                	addi	sp,sp,48
    8020209e:	8082                	ret

00000000802020a0 <scheduler>:
{
    802020a0:	715d                	addi	sp,sp,-80
    802020a2:	e486                	sd	ra,72(sp)
    802020a4:	e0a2                	sd	s0,64(sp)
    802020a6:	fc26                	sd	s1,56(sp)
    802020a8:	f84a                	sd	s2,48(sp)
    802020aa:	f44e                	sd	s3,40(sp)
    802020ac:	f052                	sd	s4,32(sp)
    802020ae:	ec56                	sd	s5,24(sp)
    802020b0:	e85a                	sd	s6,16(sp)
    802020b2:	e45e                	sd	s7,8(sp)
    802020b4:	e062                	sd	s8,0(sp)
    802020b6:	0880                	addi	s0,sp,80
    802020b8:	8792                	mv	a5,tp
  int id = r_tp();
    802020ba:	2781                	sext.w	a5,a5
  c->proc = 0;
    802020bc:	00779b13          	slli	s6,a5,0x7
    802020c0:	000a9717          	auipc	a4,0xa9
    802020c4:	fb070713          	addi	a4,a4,-80 # 802ab070 <pid_lock>
    802020c8:	975a                	add	a4,a4,s6
    802020ca:	00073c23          	sd	zero,24(a4)
        swtch(&c->context, &p->context);
    802020ce:	000a9717          	auipc	a4,0xa9
    802020d2:	fc270713          	addi	a4,a4,-62 # 802ab090 <cpus+0x8>
    802020d6:	9b3a                	add	s6,s6,a4
        c->proc = p;
    802020d8:	079e                	slli	a5,a5,0x7
    802020da:	000a9a97          	auipc	s5,0xa9
    802020de:	f96a8a93          	addi	s5,s5,-106 # 802ab070 <pid_lock>
    802020e2:	9abe                	add	s5,s5,a5
        w_satp(MAKE_SATP(p->kpagetable));
    802020e4:	5a7d                	li	s4,-1
    802020e6:	1a7e                	slli	s4,s4,0x3f
        w_satp(MAKE_SATP(kernel_pagetable));
    802020e8:	000a9b97          	auipc	s7,0xa9
    802020ec:	f80b8b93          	addi	s7,s7,-128 # 802ab068 <kernel_pagetable>
    802020f0:	a8a5                	j	80202168 <scheduler+0xc8>
        p->state = RUNNING;
    802020f2:	478d                	li	a5,3
    802020f4:	cc9c                	sw	a5,24(s1)
        c->proc = p;
    802020f6:	009abc23          	sd	s1,24(s5)
        w_satp(MAKE_SATP(p->kpagetable));
    802020fa:	6cbc                	ld	a5,88(s1)
    802020fc:	83b1                	srli	a5,a5,0xc
    802020fe:	0147e7b3          	or	a5,a5,s4
  asm volatile("csrw satp, %0" : : "r" (x));
    80202102:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    80202106:	12000073          	sfence.vma
        swtch(&c->context, &p->context);
    8020210a:	06848593          	addi	a1,s1,104
    8020210e:	855a                	mv	a0,s6
    80202110:	00000097          	auipc	ra,0x0
    80202114:	630080e7          	jalr	1584(ra) # 80202740 <swtch>
        w_satp(MAKE_SATP(kernel_pagetable));
    80202118:	000bb783          	ld	a5,0(s7)
    8020211c:	83b1                	srli	a5,a5,0xc
    8020211e:	0147e7b3          	or	a5,a5,s4
  asm volatile("csrw satp, %0" : : "r" (x));
    80202122:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    80202126:	12000073          	sfence.vma
        c->proc = 0;
    8020212a:	000abc23          	sd	zero,24(s5)
        found = 1;
    8020212e:	4c05                	li	s8,1
      release(&p->lock);
    80202130:	8526                	mv	a0,s1
    80202132:	ffffe097          	auipc	ra,0xffffe
    80202136:	616080e7          	jalr	1558(ra) # 80200748 <release>
    for(p = proc; p < &proc[NPROC]; p++) {
    8020213a:	17848493          	addi	s1,s1,376
    8020213e:	01248b63          	beq	s1,s2,80202154 <scheduler+0xb4>
      acquire(&p->lock);
    80202142:	8526                	mv	a0,s1
    80202144:	ffffe097          	auipc	ra,0xffffe
    80202148:	5b0080e7          	jalr	1456(ra) # 802006f4 <acquire>
      if(p->state == RUNNABLE) {
    8020214c:	4c9c                	lw	a5,24(s1)
    8020214e:	ff3791e3          	bne	a5,s3,80202130 <scheduler+0x90>
    80202152:	b745                	j	802020f2 <scheduler+0x52>
    if(found == 0) {
    80202154:	000c1a63          	bnez	s8,80202168 <scheduler+0xc8>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202158:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    8020215c:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202160:	10079073          	csrw	sstatus,a5
      asm volatile("wfi");
    80202164:	10500073          	wfi
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202168:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    8020216c:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202170:	10079073          	csrw	sstatus,a5
    int found = 0;
    80202174:	4c01                	li	s8,0
    for(p = proc; p < &proc[NPROC]; p++) {
    80202176:	000a9497          	auipc	s1,0xa9
    8020217a:	19248493          	addi	s1,s1,402 # 802ab308 <proc>
      if(p->state == RUNNABLE) {
    8020217e:	4989                	li	s3,2
    for(p = proc; p < &proc[NPROC]; p++) {
    80202180:	000ae917          	auipc	s2,0xae
    80202184:	af890913          	addi	s2,s2,-1288 # 802afc78 <initproc>
    80202188:	bf6d                	j	80202142 <scheduler+0xa2>

000000008020218a <sched>:
{
    8020218a:	7179                	addi	sp,sp,-48
    8020218c:	f406                	sd	ra,40(sp)
    8020218e:	f022                	sd	s0,32(sp)
    80202190:	ec26                	sd	s1,24(sp)
    80202192:	e84a                	sd	s2,16(sp)
    80202194:	e44e                	sd	s3,8(sp)
    80202196:	1800                	addi	s0,sp,48
  struct proc *p = myproc();
    80202198:	00000097          	auipc	ra,0x0
    8020219c:	984080e7          	jalr	-1660(ra) # 80201b1c <myproc>
    802021a0:	84aa                	mv	s1,a0
  if(!holding(&p->lock))
    802021a2:	ffffe097          	auipc	ra,0xffffe
    802021a6:	524080e7          	jalr	1316(ra) # 802006c6 <holding>
    802021aa:	c93d                	beqz	a0,80202220 <sched+0x96>
  asm volatile("mv %0, tp" : "=r" (x) );
    802021ac:	8792                	mv	a5,tp
  if(mycpu()->noff != 1)
    802021ae:	2781                	sext.w	a5,a5
    802021b0:	079e                	slli	a5,a5,0x7
    802021b2:	000a9717          	auipc	a4,0xa9
    802021b6:	ebe70713          	addi	a4,a4,-322 # 802ab070 <pid_lock>
    802021ba:	97ba                	add	a5,a5,a4
    802021bc:	0907a703          	lw	a4,144(a5)
    802021c0:	4785                	li	a5,1
    802021c2:	06f71763          	bne	a4,a5,80202230 <sched+0xa6>
  if(p->state == RUNNING)
    802021c6:	4c98                	lw	a4,24(s1)
    802021c8:	478d                	li	a5,3
    802021ca:	06f70b63          	beq	a4,a5,80202240 <sched+0xb6>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802021ce:	100027f3          	csrr	a5,sstatus
  return (x & SSTATUS_SIE) != 0;
    802021d2:	8b89                	andi	a5,a5,2
  if(intr_get())
    802021d4:	efb5                	bnez	a5,80202250 <sched+0xc6>
  asm volatile("mv %0, tp" : "=r" (x) );
    802021d6:	8792                	mv	a5,tp
  intena = mycpu()->intena;
    802021d8:	000a9917          	auipc	s2,0xa9
    802021dc:	e9890913          	addi	s2,s2,-360 # 802ab070 <pid_lock>
    802021e0:	2781                	sext.w	a5,a5
    802021e2:	079e                	slli	a5,a5,0x7
    802021e4:	97ca                	add	a5,a5,s2
    802021e6:	0947a983          	lw	s3,148(a5)
    802021ea:	8792                	mv	a5,tp
  swtch(&p->context, &mycpu()->context);
    802021ec:	2781                	sext.w	a5,a5
    802021ee:	079e                	slli	a5,a5,0x7
    802021f0:	000a9597          	auipc	a1,0xa9
    802021f4:	ea058593          	addi	a1,a1,-352 # 802ab090 <cpus+0x8>
    802021f8:	95be                	add	a1,a1,a5
    802021fa:	06848513          	addi	a0,s1,104
    802021fe:	00000097          	auipc	ra,0x0
    80202202:	542080e7          	jalr	1346(ra) # 80202740 <swtch>
    80202206:	8792                	mv	a5,tp
  mycpu()->intena = intena;
    80202208:	2781                	sext.w	a5,a5
    8020220a:	079e                	slli	a5,a5,0x7
    8020220c:	97ca                	add	a5,a5,s2
    8020220e:	0937aa23          	sw	s3,148(a5)
}
    80202212:	70a2                	ld	ra,40(sp)
    80202214:	7402                	ld	s0,32(sp)
    80202216:	64e2                	ld	s1,24(sp)
    80202218:	6942                	ld	s2,16(sp)
    8020221a:	69a2                	ld	s3,8(sp)
    8020221c:	6145                	addi	sp,sp,48
    8020221e:	8082                	ret
    panic("sched p->lock");
    80202220:	00007517          	auipc	a0,0x7
    80202224:	4a850513          	addi	a0,a0,1192 # 802096c8 <digits+0x348>
    80202228:	ffffe097          	auipc	ra,0xffffe
    8020222c:	f1c080e7          	jalr	-228(ra) # 80200144 <panic>
    panic("sched locks");
    80202230:	00007517          	auipc	a0,0x7
    80202234:	4a850513          	addi	a0,a0,1192 # 802096d8 <digits+0x358>
    80202238:	ffffe097          	auipc	ra,0xffffe
    8020223c:	f0c080e7          	jalr	-244(ra) # 80200144 <panic>
    panic("sched running");
    80202240:	00007517          	auipc	a0,0x7
    80202244:	4a850513          	addi	a0,a0,1192 # 802096e8 <digits+0x368>
    80202248:	ffffe097          	auipc	ra,0xffffe
    8020224c:	efc080e7          	jalr	-260(ra) # 80200144 <panic>
    panic("sched interruptible");
    80202250:	00007517          	auipc	a0,0x7
    80202254:	4a850513          	addi	a0,a0,1192 # 802096f8 <digits+0x378>
    80202258:	ffffe097          	auipc	ra,0xffffe
    8020225c:	eec080e7          	jalr	-276(ra) # 80200144 <panic>

0000000080202260 <exit>:
{
    80202260:	7179                	addi	sp,sp,-48
    80202262:	f406                	sd	ra,40(sp)
    80202264:	f022                	sd	s0,32(sp)
    80202266:	ec26                	sd	s1,24(sp)
    80202268:	e84a                	sd	s2,16(sp)
    8020226a:	e44e                	sd	s3,8(sp)
    8020226c:	e052                	sd	s4,0(sp)
    8020226e:	1800                	addi	s0,sp,48
    80202270:	8a2a                	mv	s4,a0
  struct proc *p = myproc();
    80202272:	00000097          	auipc	ra,0x0
    80202276:	8aa080e7          	jalr	-1878(ra) # 80201b1c <myproc>
    8020227a:	89aa                	mv	s3,a0
  if(p == initproc)
    8020227c:	000ae797          	auipc	a5,0xae
    80202280:	9fc7b783          	ld	a5,-1540(a5) # 802afc78 <initproc>
    80202284:	0d850493          	addi	s1,a0,216
    80202288:	15850913          	addi	s2,a0,344
    8020228c:	02a79363          	bne	a5,a0,802022b2 <exit+0x52>
    panic("init exiting");
    80202290:	00007517          	auipc	a0,0x7
    80202294:	48050513          	addi	a0,a0,1152 # 80209710 <digits+0x390>
    80202298:	ffffe097          	auipc	ra,0xffffe
    8020229c:	eac080e7          	jalr	-340(ra) # 80200144 <panic>
      fileclose(f);
    802022a0:	00001097          	auipc	ra,0x1
    802022a4:	60e080e7          	jalr	1550(ra) # 802038ae <fileclose>
      p->ofile[fd] = 0;
    802022a8:	0004b023          	sd	zero,0(s1)
  for(int fd = 0; fd < NOFILE; fd++){
    802022ac:	04a1                	addi	s1,s1,8
    802022ae:	01248563          	beq	s1,s2,802022b8 <exit+0x58>
    if(p->ofile[fd]){
    802022b2:	6088                	ld	a0,0(s1)
    802022b4:	f575                	bnez	a0,802022a0 <exit+0x40>
    802022b6:	bfdd                	j	802022ac <exit+0x4c>
  eput(p->cwd);
    802022b8:	1589b503          	ld	a0,344(s3)
    802022bc:	00004097          	auipc	ra,0x4
    802022c0:	5da080e7          	jalr	1498(ra) # 80206896 <eput>
  p->cwd = 0;
    802022c4:	1409bc23          	sd	zero,344(s3)
  acquire(&initproc->lock);
    802022c8:	000ae497          	auipc	s1,0xae
    802022cc:	9b048493          	addi	s1,s1,-1616 # 802afc78 <initproc>
    802022d0:	6088                	ld	a0,0(s1)
    802022d2:	ffffe097          	auipc	ra,0xffffe
    802022d6:	422080e7          	jalr	1058(ra) # 802006f4 <acquire>
  wakeup1(initproc);
    802022da:	6088                	ld	a0,0(s1)
    802022dc:	fffff097          	auipc	ra,0xfffff
    802022e0:	644080e7          	jalr	1604(ra) # 80201920 <wakeup1>
  release(&initproc->lock);
    802022e4:	6088                	ld	a0,0(s1)
    802022e6:	ffffe097          	auipc	ra,0xffffe
    802022ea:	462080e7          	jalr	1122(ra) # 80200748 <release>
  acquire(&p->lock);
    802022ee:	854e                	mv	a0,s3
    802022f0:	ffffe097          	auipc	ra,0xffffe
    802022f4:	404080e7          	jalr	1028(ra) # 802006f4 <acquire>
  struct proc *original_parent = p->parent;
    802022f8:	0209b483          	ld	s1,32(s3)
  release(&p->lock);
    802022fc:	854e                	mv	a0,s3
    802022fe:	ffffe097          	auipc	ra,0xffffe
    80202302:	44a080e7          	jalr	1098(ra) # 80200748 <release>
  acquire(&original_parent->lock);
    80202306:	8526                	mv	a0,s1
    80202308:	ffffe097          	auipc	ra,0xffffe
    8020230c:	3ec080e7          	jalr	1004(ra) # 802006f4 <acquire>
  acquire(&p->lock);
    80202310:	854e                	mv	a0,s3
    80202312:	ffffe097          	auipc	ra,0xffffe
    80202316:	3e2080e7          	jalr	994(ra) # 802006f4 <acquire>
  reparent(p);
    8020231a:	854e                	mv	a0,s3
    8020231c:	00000097          	auipc	ra,0x0
    80202320:	d1e080e7          	jalr	-738(ra) # 8020203a <reparent>
  wakeup1(original_parent);
    80202324:	8526                	mv	a0,s1
    80202326:	fffff097          	auipc	ra,0xfffff
    8020232a:	5fa080e7          	jalr	1530(ra) # 80201920 <wakeup1>
  p->xstate = status;
    8020232e:	0349aa23          	sw	s4,52(s3)
  p->state = ZOMBIE;
    80202332:	4791                	li	a5,4
    80202334:	00f9ac23          	sw	a5,24(s3)
  release(&original_parent->lock);
    80202338:	8526                	mv	a0,s1
    8020233a:	ffffe097          	auipc	ra,0xffffe
    8020233e:	40e080e7          	jalr	1038(ra) # 80200748 <release>
  sched();
    80202342:	00000097          	auipc	ra,0x0
    80202346:	e48080e7          	jalr	-440(ra) # 8020218a <sched>
  panic("zombie exit");
    8020234a:	00007517          	auipc	a0,0x7
    8020234e:	3d650513          	addi	a0,a0,982 # 80209720 <digits+0x3a0>
    80202352:	ffffe097          	auipc	ra,0xffffe
    80202356:	df2080e7          	jalr	-526(ra) # 80200144 <panic>

000000008020235a <yield>:
{
    8020235a:	1101                	addi	sp,sp,-32
    8020235c:	ec06                	sd	ra,24(sp)
    8020235e:	e822                	sd	s0,16(sp)
    80202360:	e426                	sd	s1,8(sp)
    80202362:	1000                	addi	s0,sp,32
  struct proc *p = myproc();
    80202364:	fffff097          	auipc	ra,0xfffff
    80202368:	7b8080e7          	jalr	1976(ra) # 80201b1c <myproc>
    8020236c:	84aa                	mv	s1,a0
  acquire(&p->lock);
    8020236e:	ffffe097          	auipc	ra,0xffffe
    80202372:	386080e7          	jalr	902(ra) # 802006f4 <acquire>
  p->state = RUNNABLE;
    80202376:	4789                	li	a5,2
    80202378:	cc9c                	sw	a5,24(s1)
  sched();
    8020237a:	00000097          	auipc	ra,0x0
    8020237e:	e10080e7          	jalr	-496(ra) # 8020218a <sched>
  release(&p->lock);
    80202382:	8526                	mv	a0,s1
    80202384:	ffffe097          	auipc	ra,0xffffe
    80202388:	3c4080e7          	jalr	964(ra) # 80200748 <release>
}
    8020238c:	60e2                	ld	ra,24(sp)
    8020238e:	6442                	ld	s0,16(sp)
    80202390:	64a2                	ld	s1,8(sp)
    80202392:	6105                	addi	sp,sp,32
    80202394:	8082                	ret

0000000080202396 <sleep>:
{
    80202396:	7179                	addi	sp,sp,-48
    80202398:	f406                	sd	ra,40(sp)
    8020239a:	f022                	sd	s0,32(sp)
    8020239c:	ec26                	sd	s1,24(sp)
    8020239e:	e84a                	sd	s2,16(sp)
    802023a0:	e44e                	sd	s3,8(sp)
    802023a2:	1800                	addi	s0,sp,48
    802023a4:	89aa                	mv	s3,a0
    802023a6:	892e                	mv	s2,a1
  struct proc *p = myproc();
    802023a8:	fffff097          	auipc	ra,0xfffff
    802023ac:	774080e7          	jalr	1908(ra) # 80201b1c <myproc>
    802023b0:	84aa                	mv	s1,a0
  if(lk != &p->lock){  //DOC: sleeplock0
    802023b2:	05250663          	beq	a0,s2,802023fe <sleep+0x68>
    acquire(&p->lock);  //DOC: sleeplock1
    802023b6:	ffffe097          	auipc	ra,0xffffe
    802023ba:	33e080e7          	jalr	830(ra) # 802006f4 <acquire>
    release(lk);
    802023be:	854a                	mv	a0,s2
    802023c0:	ffffe097          	auipc	ra,0xffffe
    802023c4:	388080e7          	jalr	904(ra) # 80200748 <release>
  p->chan = chan;
    802023c8:	0334b423          	sd	s3,40(s1)
  p->state = SLEEPING;
    802023cc:	4785                	li	a5,1
    802023ce:	cc9c                	sw	a5,24(s1)
  sched();
    802023d0:	00000097          	auipc	ra,0x0
    802023d4:	dba080e7          	jalr	-582(ra) # 8020218a <sched>
  p->chan = 0;
    802023d8:	0204b423          	sd	zero,40(s1)
    release(&p->lock);
    802023dc:	8526                	mv	a0,s1
    802023de:	ffffe097          	auipc	ra,0xffffe
    802023e2:	36a080e7          	jalr	874(ra) # 80200748 <release>
    acquire(lk);
    802023e6:	854a                	mv	a0,s2
    802023e8:	ffffe097          	auipc	ra,0xffffe
    802023ec:	30c080e7          	jalr	780(ra) # 802006f4 <acquire>
}
    802023f0:	70a2                	ld	ra,40(sp)
    802023f2:	7402                	ld	s0,32(sp)
    802023f4:	64e2                	ld	s1,24(sp)
    802023f6:	6942                	ld	s2,16(sp)
    802023f8:	69a2                	ld	s3,8(sp)
    802023fa:	6145                	addi	sp,sp,48
    802023fc:	8082                	ret
  p->chan = chan;
    802023fe:	03353423          	sd	s3,40(a0)
  p->state = SLEEPING;
    80202402:	4785                	li	a5,1
    80202404:	cd1c                	sw	a5,24(a0)
  sched();
    80202406:	00000097          	auipc	ra,0x0
    8020240a:	d84080e7          	jalr	-636(ra) # 8020218a <sched>
  p->chan = 0;
    8020240e:	0204b423          	sd	zero,40(s1)
  if(lk != &p->lock){
    80202412:	bff9                	j	802023f0 <sleep+0x5a>

0000000080202414 <wait>:
{
    80202414:	715d                	addi	sp,sp,-80
    80202416:	e486                	sd	ra,72(sp)
    80202418:	e0a2                	sd	s0,64(sp)
    8020241a:	fc26                	sd	s1,56(sp)
    8020241c:	f84a                	sd	s2,48(sp)
    8020241e:	f44e                	sd	s3,40(sp)
    80202420:	f052                	sd	s4,32(sp)
    80202422:	ec56                	sd	s5,24(sp)
    80202424:	e85a                	sd	s6,16(sp)
    80202426:	e45e                	sd	s7,8(sp)
    80202428:	e062                	sd	s8,0(sp)
    8020242a:	0880                	addi	s0,sp,80
    8020242c:	8b2a                	mv	s6,a0
  struct proc *p = myproc();
    8020242e:	fffff097          	auipc	ra,0xfffff
    80202432:	6ee080e7          	jalr	1774(ra) # 80201b1c <myproc>
    80202436:	892a                	mv	s2,a0
  acquire(&p->lock);
    80202438:	8c2a                	mv	s8,a0
    8020243a:	ffffe097          	auipc	ra,0xffffe
    8020243e:	2ba080e7          	jalr	698(ra) # 802006f4 <acquire>
    havekids = 0;
    80202442:	4b81                	li	s7,0
        if(np->state == ZOMBIE){
    80202444:	4a11                	li	s4,4
    for(np = proc; np < &proc[NPROC]; np++){
    80202446:	000ae997          	auipc	s3,0xae
    8020244a:	83298993          	addi	s3,s3,-1998 # 802afc78 <initproc>
        havekids = 1;
    8020244e:	4a85                	li	s5,1
    havekids = 0;
    80202450:	875e                	mv	a4,s7
    for(np = proc; np < &proc[NPROC]; np++){
    80202452:	000a9497          	auipc	s1,0xa9
    80202456:	eb648493          	addi	s1,s1,-330 # 802ab308 <proc>
    8020245a:	a8b9                	j	802024b8 <wait+0xa4>
          pid = np->pid;
    8020245c:	0384a983          	lw	s3,56(s1)
          if(addr != 0 && copyout2(addr, (char *)&np->xstate, sizeof(np->xstate)) < 0) {
    80202460:	000b0c63          	beqz	s6,80202478 <wait+0x64>
    80202464:	4611                	li	a2,4
    80202466:	03448593          	addi	a1,s1,52
    8020246a:	855a                	mv	a0,s6
    8020246c:	fffff097          	auipc	ra,0xfffff
    80202470:	fc4080e7          	jalr	-60(ra) # 80201430 <copyout2>
    80202474:	02054263          	bltz	a0,80202498 <wait+0x84>
          freeproc(np);
    80202478:	8526                	mv	a0,s1
    8020247a:	00000097          	auipc	ra,0x0
    8020247e:	874080e7          	jalr	-1932(ra) # 80201cee <freeproc>
          release(&np->lock);
    80202482:	8526                	mv	a0,s1
    80202484:	ffffe097          	auipc	ra,0xffffe
    80202488:	2c4080e7          	jalr	708(ra) # 80200748 <release>
          release(&p->lock);
    8020248c:	854a                	mv	a0,s2
    8020248e:	ffffe097          	auipc	ra,0xffffe
    80202492:	2ba080e7          	jalr	698(ra) # 80200748 <release>
          return pid;
    80202496:	a8a9                	j	802024f0 <wait+0xdc>
            release(&np->lock);
    80202498:	8526                	mv	a0,s1
    8020249a:	ffffe097          	auipc	ra,0xffffe
    8020249e:	2ae080e7          	jalr	686(ra) # 80200748 <release>
            release(&p->lock);
    802024a2:	854a                	mv	a0,s2
    802024a4:	ffffe097          	auipc	ra,0xffffe
    802024a8:	2a4080e7          	jalr	676(ra) # 80200748 <release>
            return -1;
    802024ac:	59fd                	li	s3,-1
    802024ae:	a089                	j	802024f0 <wait+0xdc>
    for(np = proc; np < &proc[NPROC]; np++){
    802024b0:	17848493          	addi	s1,s1,376
    802024b4:	03348463          	beq	s1,s3,802024dc <wait+0xc8>
      if(np->parent == p){
    802024b8:	709c                	ld	a5,32(s1)
    802024ba:	ff279be3          	bne	a5,s2,802024b0 <wait+0x9c>
        acquire(&np->lock);
    802024be:	8526                	mv	a0,s1
    802024c0:	ffffe097          	auipc	ra,0xffffe
    802024c4:	234080e7          	jalr	564(ra) # 802006f4 <acquire>
        if(np->state == ZOMBIE){
    802024c8:	4c9c                	lw	a5,24(s1)
    802024ca:	f94789e3          	beq	a5,s4,8020245c <wait+0x48>
        release(&np->lock);
    802024ce:	8526                	mv	a0,s1
    802024d0:	ffffe097          	auipc	ra,0xffffe
    802024d4:	278080e7          	jalr	632(ra) # 80200748 <release>
        havekids = 1;
    802024d8:	8756                	mv	a4,s5
    802024da:	bfd9                	j	802024b0 <wait+0x9c>
    if(!havekids || p->killed){
    802024dc:	c701                	beqz	a4,802024e4 <wait+0xd0>
    802024de:	03092783          	lw	a5,48(s2)
    802024e2:	c785                	beqz	a5,8020250a <wait+0xf6>
      release(&p->lock);
    802024e4:	854a                	mv	a0,s2
    802024e6:	ffffe097          	auipc	ra,0xffffe
    802024ea:	262080e7          	jalr	610(ra) # 80200748 <release>
      return -1;
    802024ee:	59fd                	li	s3,-1
}
    802024f0:	854e                	mv	a0,s3
    802024f2:	60a6                	ld	ra,72(sp)
    802024f4:	6406                	ld	s0,64(sp)
    802024f6:	74e2                	ld	s1,56(sp)
    802024f8:	7942                	ld	s2,48(sp)
    802024fa:	79a2                	ld	s3,40(sp)
    802024fc:	7a02                	ld	s4,32(sp)
    802024fe:	6ae2                	ld	s5,24(sp)
    80202500:	6b42                	ld	s6,16(sp)
    80202502:	6ba2                	ld	s7,8(sp)
    80202504:	6c02                	ld	s8,0(sp)
    80202506:	6161                	addi	sp,sp,80
    80202508:	8082                	ret
    sleep(p, &p->lock);  //DOC: wait-sleep
    8020250a:	85e2                	mv	a1,s8
    8020250c:	854a                	mv	a0,s2
    8020250e:	00000097          	auipc	ra,0x0
    80202512:	e88080e7          	jalr	-376(ra) # 80202396 <sleep>
    havekids = 0;
    80202516:	bf2d                	j	80202450 <wait+0x3c>

0000000080202518 <wakeup>:
{
    80202518:	7139                	addi	sp,sp,-64
    8020251a:	fc06                	sd	ra,56(sp)
    8020251c:	f822                	sd	s0,48(sp)
    8020251e:	f426                	sd	s1,40(sp)
    80202520:	f04a                	sd	s2,32(sp)
    80202522:	ec4e                	sd	s3,24(sp)
    80202524:	e852                	sd	s4,16(sp)
    80202526:	e456                	sd	s5,8(sp)
    80202528:	0080                	addi	s0,sp,64
    8020252a:	8a2a                	mv	s4,a0
  for(p = proc; p < &proc[NPROC]; p++) {
    8020252c:	000a9497          	auipc	s1,0xa9
    80202530:	ddc48493          	addi	s1,s1,-548 # 802ab308 <proc>
    if(p->state == SLEEPING && p->chan == chan) {
    80202534:	4985                	li	s3,1
      p->state = RUNNABLE;
    80202536:	4a89                	li	s5,2
  for(p = proc; p < &proc[NPROC]; p++) {
    80202538:	000ad917          	auipc	s2,0xad
    8020253c:	74090913          	addi	s2,s2,1856 # 802afc78 <initproc>
    80202540:	a821                	j	80202558 <wakeup+0x40>
      p->state = RUNNABLE;
    80202542:	0154ac23          	sw	s5,24(s1)
    release(&p->lock);
    80202546:	8526                	mv	a0,s1
    80202548:	ffffe097          	auipc	ra,0xffffe
    8020254c:	200080e7          	jalr	512(ra) # 80200748 <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    80202550:	17848493          	addi	s1,s1,376
    80202554:	01248e63          	beq	s1,s2,80202570 <wakeup+0x58>
    acquire(&p->lock);
    80202558:	8526                	mv	a0,s1
    8020255a:	ffffe097          	auipc	ra,0xffffe
    8020255e:	19a080e7          	jalr	410(ra) # 802006f4 <acquire>
    if(p->state == SLEEPING && p->chan == chan) {
    80202562:	4c9c                	lw	a5,24(s1)
    80202564:	ff3791e3          	bne	a5,s3,80202546 <wakeup+0x2e>
    80202568:	749c                	ld	a5,40(s1)
    8020256a:	fd479ee3          	bne	a5,s4,80202546 <wakeup+0x2e>
    8020256e:	bfd1                	j	80202542 <wakeup+0x2a>
}
    80202570:	70e2                	ld	ra,56(sp)
    80202572:	7442                	ld	s0,48(sp)
    80202574:	74a2                	ld	s1,40(sp)
    80202576:	7902                	ld	s2,32(sp)
    80202578:	69e2                	ld	s3,24(sp)
    8020257a:	6a42                	ld	s4,16(sp)
    8020257c:	6aa2                	ld	s5,8(sp)
    8020257e:	6121                	addi	sp,sp,64
    80202580:	8082                	ret

0000000080202582 <kill>:
// Kill the process with the given pid.
// The victim won't exit until it tries to return
// to user space (see usertrap() in trap.c).
int
kill(int pid)
{
    80202582:	7179                	addi	sp,sp,-48
    80202584:	f406                	sd	ra,40(sp)
    80202586:	f022                	sd	s0,32(sp)
    80202588:	ec26                	sd	s1,24(sp)
    8020258a:	e84a                	sd	s2,16(sp)
    8020258c:	e44e                	sd	s3,8(sp)
    8020258e:	1800                	addi	s0,sp,48
    80202590:	892a                	mv	s2,a0
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++){
    80202592:	000a9497          	auipc	s1,0xa9
    80202596:	d7648493          	addi	s1,s1,-650 # 802ab308 <proc>
    8020259a:	000ad997          	auipc	s3,0xad
    8020259e:	6de98993          	addi	s3,s3,1758 # 802afc78 <initproc>
    acquire(&p->lock);
    802025a2:	8526                	mv	a0,s1
    802025a4:	ffffe097          	auipc	ra,0xffffe
    802025a8:	150080e7          	jalr	336(ra) # 802006f4 <acquire>
    if(p->pid == pid){
    802025ac:	5c9c                	lw	a5,56(s1)
    802025ae:	01278d63          	beq	a5,s2,802025c8 <kill+0x46>
        p->state = RUNNABLE;
      }
      release(&p->lock);
      return 0;
    }
    release(&p->lock);
    802025b2:	8526                	mv	a0,s1
    802025b4:	ffffe097          	auipc	ra,0xffffe
    802025b8:	194080e7          	jalr	404(ra) # 80200748 <release>
  for(p = proc; p < &proc[NPROC]; p++){
    802025bc:	17848493          	addi	s1,s1,376
    802025c0:	ff3491e3          	bne	s1,s3,802025a2 <kill+0x20>
  }
  return -1;
    802025c4:	557d                	li	a0,-1
    802025c6:	a829                	j	802025e0 <kill+0x5e>
      p->killed = 1;
    802025c8:	4785                	li	a5,1
    802025ca:	d89c                	sw	a5,48(s1)
      if(p->state == SLEEPING){
    802025cc:	4c98                	lw	a4,24(s1)
    802025ce:	4785                	li	a5,1
    802025d0:	00f70f63          	beq	a4,a5,802025ee <kill+0x6c>
      release(&p->lock);
    802025d4:	8526                	mv	a0,s1
    802025d6:	ffffe097          	auipc	ra,0xffffe
    802025da:	172080e7          	jalr	370(ra) # 80200748 <release>
      return 0;
    802025de:	4501                	li	a0,0
}
    802025e0:	70a2                	ld	ra,40(sp)
    802025e2:	7402                	ld	s0,32(sp)
    802025e4:	64e2                	ld	s1,24(sp)
    802025e6:	6942                	ld	s2,16(sp)
    802025e8:	69a2                	ld	s3,8(sp)
    802025ea:	6145                	addi	sp,sp,48
    802025ec:	8082                	ret
        p->state = RUNNABLE;
    802025ee:	4789                	li	a5,2
    802025f0:	cc9c                	sw	a5,24(s1)
    802025f2:	b7cd                	j	802025d4 <kill+0x52>

00000000802025f4 <either_copyout>:
// Copy to either a user address, or kernel address,
// depending on usr_dst.
// Returns 0 on success, -1 on error.
int
either_copyout(int user_dst, uint64 dst, void *src, uint64 len)
{
    802025f4:	1101                	addi	sp,sp,-32
    802025f6:	ec06                	sd	ra,24(sp)
    802025f8:	e822                	sd	s0,16(sp)
    802025fa:	e426                	sd	s1,8(sp)
    802025fc:	1000                	addi	s0,sp,32
    802025fe:	84aa                	mv	s1,a0
    80202600:	852e                	mv	a0,a1
    80202602:	85b2                	mv	a1,a2
    80202604:	8636                	mv	a2,a3
  // struct proc *p = myproc();
  if(user_dst){
    80202606:	c891                	beqz	s1,8020261a <either_copyout+0x26>
    // return copyout(p->pagetable, dst, src, len);
    return copyout2(dst, src, len);
    80202608:	fffff097          	auipc	ra,0xfffff
    8020260c:	e28080e7          	jalr	-472(ra) # 80201430 <copyout2>
  } else {
    memmove((char *)dst, src, len);
    return 0;
  }
}
    80202610:	60e2                	ld	ra,24(sp)
    80202612:	6442                	ld	s0,16(sp)
    80202614:	64a2                	ld	s1,8(sp)
    80202616:	6105                	addi	sp,sp,32
    80202618:	8082                	ret
    memmove((char *)dst, src, len);
    8020261a:	0006861b          	sext.w	a2,a3
    8020261e:	ffffe097          	auipc	ra,0xffffe
    80202622:	1d2080e7          	jalr	466(ra) # 802007f0 <memmove>
    return 0;
    80202626:	8526                	mv	a0,s1
    80202628:	b7e5                	j	80202610 <either_copyout+0x1c>

000000008020262a <either_copyin>:
// Copy from either a user address, or kernel address,
// depending on usr_src.
// Returns 0 on success, -1 on error.
int
either_copyin(void *dst, int user_src, uint64 src, uint64 len)
{
    8020262a:	1101                	addi	sp,sp,-32
    8020262c:	ec06                	sd	ra,24(sp)
    8020262e:	e822                	sd	s0,16(sp)
    80202630:	e426                	sd	s1,8(sp)
    80202632:	1000                	addi	s0,sp,32
    80202634:	84ae                	mv	s1,a1
    80202636:	85b2                	mv	a1,a2
    80202638:	8636                	mv	a2,a3
  // struct proc *p = myproc();
  if(user_src){
    8020263a:	c891                	beqz	s1,8020264e <either_copyin+0x24>
    // return copyin(p->pagetable, dst, src, len);
    return copyin2(dst, src, len);
    8020263c:	fffff097          	auipc	ra,0xfffff
    80202640:	ed2080e7          	jalr	-302(ra) # 8020150e <copyin2>
  } else {
    memmove(dst, (char*)src, len);
    return 0;
  }
}
    80202644:	60e2                	ld	ra,24(sp)
    80202646:	6442                	ld	s0,16(sp)
    80202648:	64a2                	ld	s1,8(sp)
    8020264a:	6105                	addi	sp,sp,32
    8020264c:	8082                	ret
    memmove(dst, (char*)src, len);
    8020264e:	0006861b          	sext.w	a2,a3
    80202652:	ffffe097          	auipc	ra,0xffffe
    80202656:	19e080e7          	jalr	414(ra) # 802007f0 <memmove>
    return 0;
    8020265a:	8526                	mv	a0,s1
    8020265c:	b7e5                	j	80202644 <either_copyin+0x1a>

000000008020265e <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
    8020265e:	715d                	addi	sp,sp,-80
    80202660:	e486                	sd	ra,72(sp)
    80202662:	e0a2                	sd	s0,64(sp)
    80202664:	fc26                	sd	s1,56(sp)
    80202666:	f84a                	sd	s2,48(sp)
    80202668:	f44e                	sd	s3,40(sp)
    8020266a:	f052                	sd	s4,32(sp)
    8020266c:	ec56                	sd	s5,24(sp)
    8020266e:	e85a                	sd	s6,16(sp)
    80202670:	e45e                	sd	s7,8(sp)
    80202672:	0880                	addi	s0,sp,80
  [ZOMBIE]    "zombie"
  };
  struct proc *p;
  char *state;

  printf("\nPID\tSTATE\tNAME\tMEM\n");
    80202674:	00007517          	auipc	a0,0x7
    80202678:	0c450513          	addi	a0,a0,196 # 80209738 <digits+0x3b8>
    8020267c:	ffffe097          	auipc	ra,0xffffe
    80202680:	b12080e7          	jalr	-1262(ra) # 8020018e <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    80202684:	000a9497          	auipc	s1,0xa9
    80202688:	de448493          	addi	s1,s1,-540 # 802ab468 <proc+0x160>
    8020268c:	000ad917          	auipc	s2,0xad
    80202690:	74c90913          	addi	s2,s2,1868 # 802afdd8 <bcache+0x158>
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    80202694:	4b11                	li	s6,4
      state = states[p->state];
    else
      state = "???";
    80202696:	00007997          	auipc	s3,0x7
    8020269a:	09a98993          	addi	s3,s3,154 # 80209730 <digits+0x3b0>
    printf("%d\t%s\t%s\t%d", p->pid, state, p->name, p->sz);
    8020269e:	00007a97          	auipc	s5,0x7
    802026a2:	0b2a8a93          	addi	s5,s5,178 # 80209750 <digits+0x3d0>
    printf("\n");
    802026a6:	00007a17          	auipc	s4,0x7
    802026aa:	a32a0a13          	addi	s4,s4,-1486 # 802090d8 <etext+0xd8>
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    802026ae:	00007b97          	auipc	s7,0x7
    802026b2:	0dab8b93          	addi	s7,s7,218 # 80209788 <states.1718>
    802026b6:	a01d                	j	802026dc <procdump+0x7e>
    printf("%d\t%s\t%s\t%d", p->pid, state, p->name, p->sz);
    802026b8:	ee86b703          	ld	a4,-280(a3)
    802026bc:	ed86a583          	lw	a1,-296(a3)
    802026c0:	8556                	mv	a0,s5
    802026c2:	ffffe097          	auipc	ra,0xffffe
    802026c6:	acc080e7          	jalr	-1332(ra) # 8020018e <printf>
    printf("\n");
    802026ca:	8552                	mv	a0,s4
    802026cc:	ffffe097          	auipc	ra,0xffffe
    802026d0:	ac2080e7          	jalr	-1342(ra) # 8020018e <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    802026d4:	17848493          	addi	s1,s1,376
    802026d8:	03248163          	beq	s1,s2,802026fa <procdump+0x9c>
    if(p->state == UNUSED)
    802026dc:	86a6                	mv	a3,s1
    802026de:	eb84a783          	lw	a5,-328(s1)
    802026e2:	dbed                	beqz	a5,802026d4 <procdump+0x76>
      state = "???";
    802026e4:	864e                	mv	a2,s3
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    802026e6:	fcfb69e3          	bltu	s6,a5,802026b8 <procdump+0x5a>
    802026ea:	1782                	slli	a5,a5,0x20
    802026ec:	9381                	srli	a5,a5,0x20
    802026ee:	078e                	slli	a5,a5,0x3
    802026f0:	97de                	add	a5,a5,s7
    802026f2:	6390                	ld	a2,0(a5)
    802026f4:	f271                	bnez	a2,802026b8 <procdump+0x5a>
      state = "???";
    802026f6:	864e                	mv	a2,s3
    802026f8:	b7c1                	j	802026b8 <procdump+0x5a>
  }
}
    802026fa:	60a6                	ld	ra,72(sp)
    802026fc:	6406                	ld	s0,64(sp)
    802026fe:	74e2                	ld	s1,56(sp)
    80202700:	7942                	ld	s2,48(sp)
    80202702:	79a2                	ld	s3,40(sp)
    80202704:	7a02                	ld	s4,32(sp)
    80202706:	6ae2                	ld	s5,24(sp)
    80202708:	6b42                	ld	s6,16(sp)
    8020270a:	6ba2                	ld	s7,8(sp)
    8020270c:	6161                	addi	sp,sp,80
    8020270e:	8082                	ret

0000000080202710 <procnum>:

uint64
procnum(void)
{
    80202710:	1141                	addi	sp,sp,-16
    80202712:	e422                	sd	s0,8(sp)
    80202714:	0800                	addi	s0,sp,16
  int num = 0;
  struct proc *p;

  for (p = proc; p < &proc[NPROC]; p++) {
    80202716:	000a9797          	auipc	a5,0xa9
    8020271a:	bf278793          	addi	a5,a5,-1038 # 802ab308 <proc>
  int num = 0;
    8020271e:	4501                	li	a0,0
  for (p = proc; p < &proc[NPROC]; p++) {
    80202720:	000ad697          	auipc	a3,0xad
    80202724:	55868693          	addi	a3,a3,1368 # 802afc78 <initproc>
    80202728:	a029                	j	80202732 <procnum+0x22>
    8020272a:	17878793          	addi	a5,a5,376
    8020272e:	00d78663          	beq	a5,a3,8020273a <procnum+0x2a>
    if (p->state != UNUSED) {
    80202732:	4f98                	lw	a4,24(a5)
    80202734:	db7d                	beqz	a4,8020272a <procnum+0x1a>
      num++;
    80202736:	2505                	addiw	a0,a0,1
    80202738:	bfcd                	j	8020272a <procnum+0x1a>
    }
  }

  return num;
}
    8020273a:	6422                	ld	s0,8(sp)
    8020273c:	0141                	addi	sp,sp,16
    8020273e:	8082                	ret

0000000080202740 <swtch>:
    80202740:	00153023          	sd	ra,0(a0)
    80202744:	00253423          	sd	sp,8(a0)
    80202748:	e900                	sd	s0,16(a0)
    8020274a:	ed04                	sd	s1,24(a0)
    8020274c:	03253023          	sd	s2,32(a0)
    80202750:	03353423          	sd	s3,40(a0)
    80202754:	03453823          	sd	s4,48(a0)
    80202758:	03553c23          	sd	s5,56(a0)
    8020275c:	05653023          	sd	s6,64(a0)
    80202760:	05753423          	sd	s7,72(a0)
    80202764:	05853823          	sd	s8,80(a0)
    80202768:	05953c23          	sd	s9,88(a0)
    8020276c:	07a53023          	sd	s10,96(a0)
    80202770:	07b53423          	sd	s11,104(a0)
    80202774:	0005b083          	ld	ra,0(a1)
    80202778:	0085b103          	ld	sp,8(a1)
    8020277c:	6980                	ld	s0,16(a1)
    8020277e:	6d84                	ld	s1,24(a1)
    80202780:	0205b903          	ld	s2,32(a1)
    80202784:	0285b983          	ld	s3,40(a1)
    80202788:	0305ba03          	ld	s4,48(a1)
    8020278c:	0385ba83          	ld	s5,56(a1)
    80202790:	0405bb03          	ld	s6,64(a1)
    80202794:	0485bb83          	ld	s7,72(a1)
    80202798:	0505bc03          	ld	s8,80(a1)
    8020279c:	0585bc83          	ld	s9,88(a1)
    802027a0:	0605bd03          	ld	s10,96(a1)
    802027a4:	0685bd83          	ld	s11,104(a1)
    802027a8:	8082                	ret

00000000802027aa <trapinithart>:
// }

// set up to take exceptions and traps while in the kernel.
void
trapinithart(void)
{
    802027aa:	1141                	addi	sp,sp,-16
    802027ac:	e406                	sd	ra,8(sp)
    802027ae:	e022                	sd	s0,0(sp)
    802027b0:	0800                	addi	s0,sp,16
  asm volatile("csrw stvec, %0" : : "r" (x));
    802027b2:	00002797          	auipc	a5,0x2
    802027b6:	79e78793          	addi	a5,a5,1950 # 80204f50 <kernelvec>
    802027ba:	10579073          	csrw	stvec,a5
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802027be:	100027f3          	csrr	a5,sstatus
  w_stvec((uint64)kernelvec);
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    802027c2:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    802027c6:	10079073          	csrw	sstatus,a5
  asm volatile("csrr %0, sie" : "=r" (x) );
    802027ca:	104027f3          	csrr	a5,sie
  // enable supervisor-mode timer interrupts.
  w_sie(r_sie() | SIE_SEIE | SIE_SSIE | SIE_STIE);
    802027ce:	2227e793          	ori	a5,a5,546
  asm volatile("csrw sie, %0" : : "r" (x));
    802027d2:	10479073          	csrw	sie,a5
  set_next_timeout();
    802027d6:	00003097          	auipc	ra,0x3
    802027da:	840080e7          	jalr	-1984(ra) # 80205016 <set_next_timeout>
  #ifdef DEBUG
  printf("trapinithart\n");
    802027de:	00007517          	auipc	a0,0x7
    802027e2:	fd250513          	addi	a0,a0,-46 # 802097b0 <states.1718+0x28>
    802027e6:	ffffe097          	auipc	ra,0xffffe
    802027ea:	9a8080e7          	jalr	-1624(ra) # 8020018e <printf>
  #endif
}
    802027ee:	60a2                	ld	ra,8(sp)
    802027f0:	6402                	ld	s0,0(sp)
    802027f2:	0141                	addi	sp,sp,16
    802027f4:	8082                	ret

00000000802027f6 <usertrapret>:
//
// return to user space
//
void
usertrapret(void)
{
    802027f6:	1141                	addi	sp,sp,-16
    802027f8:	e406                	sd	ra,8(sp)
    802027fa:	e022                	sd	s0,0(sp)
    802027fc:	0800                	addi	s0,sp,16
  struct proc *p = myproc();
    802027fe:	fffff097          	auipc	ra,0xfffff
    80202802:	31e080e7          	jalr	798(ra) # 80201b1c <myproc>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202806:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    8020280a:	9bf5                	andi	a5,a5,-3
  asm volatile("csrw sstatus, %0" : : "r" (x));
    8020280c:	10079073          	csrw	sstatus,a5
  // kerneltrap() to usertrap(), so turn off interrupts until
  // we're back in user space, where usertrap() is correct.
  intr_off();

  // send syscalls, interrupts, and exceptions to trampoline.S
  w_stvec(TRAMPOLINE + (uservec - trampoline));
    80202810:	00005617          	auipc	a2,0x5
    80202814:	7f060613          	addi	a2,a2,2032 # 80208000 <_trampoline>
    80202818:	00005697          	auipc	a3,0x5
    8020281c:	7e868693          	addi	a3,a3,2024 # 80208000 <_trampoline>
    80202820:	8e91                	sub	a3,a3,a2
    80202822:	040007b7          	lui	a5,0x4000
    80202826:	17fd                	addi	a5,a5,-1
    80202828:	07b2                	slli	a5,a5,0xc
    8020282a:	96be                	add	a3,a3,a5
  asm volatile("csrw stvec, %0" : : "r" (x));
    8020282c:	10569073          	csrw	stvec,a3

  // set up trapframe values that uservec will need when
  // the process next re-enters the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
    80202830:	7138                	ld	a4,96(a0)
  asm volatile("csrr %0, satp" : "=r" (x) );
    80202832:	180026f3          	csrr	a3,satp
    80202836:	e314                	sd	a3,0(a4)
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
    80202838:	7138                	ld	a4,96(a0)
    8020283a:	6134                	ld	a3,64(a0)
    8020283c:	6585                	lui	a1,0x1
    8020283e:	96ae                	add	a3,a3,a1
    80202840:	e714                	sd	a3,8(a4)
  p->trapframe->kernel_trap = (uint64)usertrap;
    80202842:	7138                	ld	a4,96(a0)
    80202844:	00000697          	auipc	a3,0x0
    80202848:	0f468693          	addi	a3,a3,244 # 80202938 <usertrap>
    8020284c:	eb14                	sd	a3,16(a4)
  p->trapframe->kernel_hartid = r_tp();         // hartid for cpuid()
    8020284e:	7138                	ld	a4,96(a0)
  asm volatile("mv %0, tp" : "=r" (x) );
    80202850:	8692                	mv	a3,tp
    80202852:	f314                	sd	a3,32(a4)
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202854:	100026f3          	csrr	a3,sstatus
  // set up the registers that trampoline.S's sret will use
  // to get to user space.
  
  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
    80202858:	eff6f693          	andi	a3,a3,-257
  x |= SSTATUS_SPIE; // enable interrupts in user mode
    8020285c:	0206e693          	ori	a3,a3,32
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202860:	10069073          	csrw	sstatus,a3
  w_sstatus(x);

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);
    80202864:	7138                	ld	a4,96(a0)
  asm volatile("csrw sepc, %0" : : "r" (x));
    80202866:	6f18                	ld	a4,24(a4)
    80202868:	14171073          	csrw	sepc,a4

  // tell trampoline.S the user page table to switch to.
  // printf("[usertrapret]p->pagetable: %p\n", p->pagetable);
  uint64 satp = MAKE_SATP(p->pagetable);
    8020286c:	692c                	ld	a1,80(a0)
    8020286e:	81b1                	srli	a1,a1,0xc

  // jump to trampoline.S at the top of memory, which 
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 fn = TRAMPOLINE + (userret - trampoline);
    80202870:	00006717          	auipc	a4,0x6
    80202874:	82070713          	addi	a4,a4,-2016 # 80208090 <userret>
    80202878:	8f11                	sub	a4,a4,a2
    8020287a:	97ba                	add	a5,a5,a4
  ((void (*)(uint64,uint64))fn)(TRAPFRAME, satp);
    8020287c:	577d                	li	a4,-1
    8020287e:	177e                	slli	a4,a4,0x3f
    80202880:	8dd9                	or	a1,a1,a4
    80202882:	02000537          	lui	a0,0x2000
    80202886:	157d                	addi	a0,a0,-1
    80202888:	0536                	slli	a0,a0,0xd
    8020288a:	9782                	jalr	a5
}
    8020288c:	60a2                	ld	ra,8(sp)
    8020288e:	6402                	ld	s0,0(sp)
    80202890:	0141                	addi	sp,sp,16
    80202892:	8082                	ret

0000000080202894 <devintr>:
// Check if it's an external/software interrupt, 
// and handle it. 
// returns  2 if timer interrupt, 
//          1 if other device, 
//          0 if not recognized. 
int devintr(void) {
    80202894:	1101                	addi	sp,sp,-32
    80202896:	ec06                	sd	ra,24(sp)
    80202898:	e822                	sd	s0,16(sp)
    8020289a:	e426                	sd	s1,8(sp)
    8020289c:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, scause" : "=r" (x) );
    8020289e:	14202773          	csrr	a4,scause
	uint64 scause = r_scause();

	#ifdef QEMU 
	// handle external interrupt 
	if ((0x8000000000000000L & scause) && 9 == (scause & 0xff)) 
    802028a2:	00074d63          	bltz	a4,802028bc <devintr+0x28>
		sbi_set_mie();
		#endif 

		return 1;
	}
	else if (0x8000000000000005L == scause) {
    802028a6:	57fd                	li	a5,-1
    802028a8:	17fe                	slli	a5,a5,0x3f
    802028aa:	0795                	addi	a5,a5,5
		timer_tick();
		return 2;
	}
	else { return 0;}
    802028ac:	4501                	li	a0,0
	else if (0x8000000000000005L == scause) {
    802028ae:	06f70f63          	beq	a4,a5,8020292c <devintr+0x98>
}
    802028b2:	60e2                	ld	ra,24(sp)
    802028b4:	6442                	ld	s0,16(sp)
    802028b6:	64a2                	ld	s1,8(sp)
    802028b8:	6105                	addi	sp,sp,32
    802028ba:	8082                	ret
	if ((0x8000000000000000L & scause) && 9 == (scause & 0xff)) 
    802028bc:	0ff77793          	andi	a5,a4,255
    802028c0:	46a5                	li	a3,9
    802028c2:	fed792e3          	bne	a5,a3,802028a6 <devintr+0x12>
		int irq = plic_claim();
    802028c6:	00004097          	auipc	ra,0x4
    802028ca:	7a6080e7          	jalr	1958(ra) # 8020706c <plic_claim>
    802028ce:	84aa                	mv	s1,a0
		if (UART_IRQ == irq) {
    802028d0:	47a9                	li	a5,10
    802028d2:	02f50163          	beq	a0,a5,802028f4 <devintr+0x60>
		else if (DISK_IRQ == irq) {
    802028d6:	4785                	li	a5,1
    802028d8:	04f50563          	beq	a0,a5,80202922 <devintr+0x8e>
		return 1;
    802028dc:	4505                	li	a0,1
		else if (irq) {
    802028de:	d8f1                	beqz	s1,802028b2 <devintr+0x1e>
			printf("unexpected interrupt irq = %d\n", irq);
    802028e0:	85a6                	mv	a1,s1
    802028e2:	00007517          	auipc	a0,0x7
    802028e6:	ede50513          	addi	a0,a0,-290 # 802097c0 <states.1718+0x38>
    802028ea:	ffffe097          	auipc	ra,0xffffe
    802028ee:	8a4080e7          	jalr	-1884(ra) # 8020018e <printf>
    802028f2:	a821                	j	8020290a <devintr+0x76>
	SBI_CALL_1(SBI_CONSOLE_PUTCHAR, ch);
}

static inline int sbi_console_getchar(void)
{
	return SBI_CALL_0(SBI_CONSOLE_GETCHAR);
    802028f4:	4501                	li	a0,0
    802028f6:	4581                	li	a1,0
    802028f8:	4601                	li	a2,0
    802028fa:	4681                	li	a3,0
    802028fc:	4889                	li	a7,2
    802028fe:	00000073          	ecall
    80202902:	2501                	sext.w	a0,a0
			if (-1 != c) {
    80202904:	57fd                	li	a5,-1
    80202906:	00f51963          	bne	a0,a5,80202918 <devintr+0x84>
		if (irq) { plic_complete(irq);}
    8020290a:	8526                	mv	a0,s1
    8020290c:	00004097          	auipc	ra,0x4
    80202910:	78a080e7          	jalr	1930(ra) # 80207096 <plic_complete>
		return 1;
    80202914:	4505                	li	a0,1
    80202916:	bf71                	j	802028b2 <devintr+0x1e>
				consoleintr(c);
    80202918:	00005097          	auipc	ra,0x5
    8020291c:	98a080e7          	jalr	-1654(ra) # 802072a2 <consoleintr>
    80202920:	b7ed                	j	8020290a <devintr+0x76>
			disk_intr();
    80202922:	00003097          	auipc	ra,0x3
    80202926:	d46080e7          	jalr	-698(ra) # 80205668 <disk_intr>
    8020292a:	b7c5                	j	8020290a <devintr+0x76>
		timer_tick();
    8020292c:	00002097          	auipc	ra,0x2
    80202930:	710080e7          	jalr	1808(ra) # 8020503c <timer_tick>
		return 2;
    80202934:	4509                	li	a0,2
    80202936:	bfb5                	j	802028b2 <devintr+0x1e>

0000000080202938 <usertrap>:
{
    80202938:	1101                	addi	sp,sp,-32
    8020293a:	ec06                	sd	ra,24(sp)
    8020293c:	e822                	sd	s0,16(sp)
    8020293e:	e426                	sd	s1,8(sp)
    80202940:	e04a                	sd	s2,0(sp)
    80202942:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202944:	100027f3          	csrr	a5,sstatus
  if((r_sstatus() & SSTATUS_SPP) != 0)
    80202948:	1007f793          	andi	a5,a5,256
    8020294c:	e3ad                	bnez	a5,802029ae <usertrap+0x76>
  asm volatile("csrw stvec, %0" : : "r" (x));
    8020294e:	00002797          	auipc	a5,0x2
    80202952:	60278793          	addi	a5,a5,1538 # 80204f50 <kernelvec>
    80202956:	10579073          	csrw	stvec,a5
  struct proc *p = myproc();
    8020295a:	fffff097          	auipc	ra,0xfffff
    8020295e:	1c2080e7          	jalr	450(ra) # 80201b1c <myproc>
    80202962:	84aa                	mv	s1,a0
  p->trapframe->epc = r_sepc();
    80202964:	713c                	ld	a5,96(a0)
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202966:	14102773          	csrr	a4,sepc
    8020296a:	ef98                	sd	a4,24(a5)
  asm volatile("csrr %0, scause" : "=r" (x) );
    8020296c:	14202773          	csrr	a4,scause
  if(r_scause() == 8){
    80202970:	47a1                	li	a5,8
    80202972:	04f71c63          	bne	a4,a5,802029ca <usertrap+0x92>
    if(p->killed)
    80202976:	591c                	lw	a5,48(a0)
    80202978:	e3b9                	bnez	a5,802029be <usertrap+0x86>
    p->trapframe->epc += 4;
    8020297a:	70b8                	ld	a4,96(s1)
    8020297c:	6f1c                	ld	a5,24(a4)
    8020297e:	0791                	addi	a5,a5,4
    80202980:	ef1c                	sd	a5,24(a4)
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202982:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80202986:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    8020298a:	10079073          	csrw	sstatus,a5
    syscall();
    8020298e:	00000097          	auipc	ra,0x0
    80202992:	5d4080e7          	jalr	1492(ra) # 80202f62 <syscall>
  if(p->killed)
    80202996:	589c                	lw	a5,48(s1)
    80202998:	ebd1                	bnez	a5,80202a2c <usertrap+0xf4>
  usertrapret();
    8020299a:	00000097          	auipc	ra,0x0
    8020299e:	e5c080e7          	jalr	-420(ra) # 802027f6 <usertrapret>
}
    802029a2:	60e2                	ld	ra,24(sp)
    802029a4:	6442                	ld	s0,16(sp)
    802029a6:	64a2                	ld	s1,8(sp)
    802029a8:	6902                	ld	s2,0(sp)
    802029aa:	6105                	addi	sp,sp,32
    802029ac:	8082                	ret
    panic("usertrap: not from user mode");
    802029ae:	00007517          	auipc	a0,0x7
    802029b2:	e3250513          	addi	a0,a0,-462 # 802097e0 <states.1718+0x58>
    802029b6:	ffffd097          	auipc	ra,0xffffd
    802029ba:	78e080e7          	jalr	1934(ra) # 80200144 <panic>
      exit(-1);
    802029be:	557d                	li	a0,-1
    802029c0:	00000097          	auipc	ra,0x0
    802029c4:	8a0080e7          	jalr	-1888(ra) # 80202260 <exit>
    802029c8:	bf4d                	j	8020297a <usertrap+0x42>
  else if((which_dev = devintr()) != 0){
    802029ca:	00000097          	auipc	ra,0x0
    802029ce:	eca080e7          	jalr	-310(ra) # 80202894 <devintr>
    802029d2:	892a                	mv	s2,a0
    802029d4:	c501                	beqz	a0,802029dc <usertrap+0xa4>
  if(p->killed)
    802029d6:	589c                	lw	a5,48(s1)
    802029d8:	c3b1                	beqz	a5,80202a1c <usertrap+0xe4>
    802029da:	a825                	j	80202a12 <usertrap+0xda>
  asm volatile("csrr %0, scause" : "=r" (x) );
    802029dc:	142025f3          	csrr	a1,scause
    printf("\nusertrap(): unexpected scause %p pid=%d %s\n", r_scause(), p->pid, p->name);
    802029e0:	16048693          	addi	a3,s1,352
    802029e4:	5c90                	lw	a2,56(s1)
    802029e6:	00007517          	auipc	a0,0x7
    802029ea:	e1a50513          	addi	a0,a0,-486 # 80209800 <states.1718+0x78>
    802029ee:	ffffd097          	auipc	ra,0xffffd
    802029f2:	7a0080e7          	jalr	1952(ra) # 8020018e <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    802029f6:	141025f3          	csrr	a1,sepc
  asm volatile("csrr %0, stval" : "=r" (x) );
    802029fa:	14302673          	csrr	a2,stval
    printf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    802029fe:	00007517          	auipc	a0,0x7
    80202a02:	e3250513          	addi	a0,a0,-462 # 80209830 <states.1718+0xa8>
    80202a06:	ffffd097          	auipc	ra,0xffffd
    80202a0a:	788080e7          	jalr	1928(ra) # 8020018e <printf>
    p->killed = 1;
    80202a0e:	4785                	li	a5,1
    80202a10:	d89c                	sw	a5,48(s1)
    exit(-1);
    80202a12:	557d                	li	a0,-1
    80202a14:	00000097          	auipc	ra,0x0
    80202a18:	84c080e7          	jalr	-1972(ra) # 80202260 <exit>
  if(which_dev == 2)
    80202a1c:	4789                	li	a5,2
    80202a1e:	f6f91ee3          	bne	s2,a5,8020299a <usertrap+0x62>
    yield();
    80202a22:	00000097          	auipc	ra,0x0
    80202a26:	938080e7          	jalr	-1736(ra) # 8020235a <yield>
    80202a2a:	bf85                	j	8020299a <usertrap+0x62>
  int which_dev = 0;
    80202a2c:	4901                	li	s2,0
    80202a2e:	b7d5                	j	80202a12 <usertrap+0xda>

0000000080202a30 <kerneltrap>:
kerneltrap() {
    80202a30:	7179                	addi	sp,sp,-48
    80202a32:	f406                	sd	ra,40(sp)
    80202a34:	f022                	sd	s0,32(sp)
    80202a36:	ec26                	sd	s1,24(sp)
    80202a38:	e84a                	sd	s2,16(sp)
    80202a3a:	e44e                	sd	s3,8(sp)
    80202a3c:	1800                	addi	s0,sp,48
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202a3e:	14102973          	csrr	s2,sepc
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202a42:	100024f3          	csrr	s1,sstatus
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202a46:	142029f3          	csrr	s3,scause
  if((sstatus & SSTATUS_SPP) == 0)
    80202a4a:	1004f793          	andi	a5,s1,256
    80202a4e:	cb85                	beqz	a5,80202a7e <kerneltrap+0x4e>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202a50:	100027f3          	csrr	a5,sstatus
  return (x & SSTATUS_SIE) != 0;
    80202a54:	8b89                	andi	a5,a5,2
  if(intr_get() != 0)
    80202a56:	ef85                	bnez	a5,80202a8e <kerneltrap+0x5e>
  if((which_dev = devintr()) == 0){
    80202a58:	00000097          	auipc	ra,0x0
    80202a5c:	e3c080e7          	jalr	-452(ra) # 80202894 <devintr>
    80202a60:	cd1d                	beqz	a0,80202a9e <kerneltrap+0x6e>
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING) {
    80202a62:	4789                	li	a5,2
    80202a64:	08f50b63          	beq	a0,a5,80202afa <kerneltrap+0xca>
  asm volatile("csrw sepc, %0" : : "r" (x));
    80202a68:	14191073          	csrw	sepc,s2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202a6c:	10049073          	csrw	sstatus,s1
}
    80202a70:	70a2                	ld	ra,40(sp)
    80202a72:	7402                	ld	s0,32(sp)
    80202a74:	64e2                	ld	s1,24(sp)
    80202a76:	6942                	ld	s2,16(sp)
    80202a78:	69a2                	ld	s3,8(sp)
    80202a7a:	6145                	addi	sp,sp,48
    80202a7c:	8082                	ret
    panic("kerneltrap: not from supervisor mode");
    80202a7e:	00007517          	auipc	a0,0x7
    80202a82:	dd250513          	addi	a0,a0,-558 # 80209850 <states.1718+0xc8>
    80202a86:	ffffd097          	auipc	ra,0xffffd
    80202a8a:	6be080e7          	jalr	1726(ra) # 80200144 <panic>
    panic("kerneltrap: interrupts enabled");
    80202a8e:	00007517          	auipc	a0,0x7
    80202a92:	dea50513          	addi	a0,a0,-534 # 80209878 <states.1718+0xf0>
    80202a96:	ffffd097          	auipc	ra,0xffffd
    80202a9a:	6ae080e7          	jalr	1710(ra) # 80200144 <panic>
    printf("\nscause %p\n", scause);
    80202a9e:	85ce                	mv	a1,s3
    80202aa0:	00007517          	auipc	a0,0x7
    80202aa4:	df850513          	addi	a0,a0,-520 # 80209898 <states.1718+0x110>
    80202aa8:	ffffd097          	auipc	ra,0xffffd
    80202aac:	6e6080e7          	jalr	1766(ra) # 8020018e <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202ab0:	141025f3          	csrr	a1,sepc
  asm volatile("csrr %0, stval" : "=r" (x) );
    80202ab4:	14302673          	csrr	a2,stval
  asm volatile("mv %0, tp" : "=r" (x) );
    80202ab8:	8692                	mv	a3,tp
    printf("sepc=%p stval=%p hart=%d\n", r_sepc(), r_stval(), r_tp());
    80202aba:	00007517          	auipc	a0,0x7
    80202abe:	dee50513          	addi	a0,a0,-530 # 802098a8 <states.1718+0x120>
    80202ac2:	ffffd097          	auipc	ra,0xffffd
    80202ac6:	6cc080e7          	jalr	1740(ra) # 8020018e <printf>
    struct proc *p = myproc();
    80202aca:	fffff097          	auipc	ra,0xfffff
    80202ace:	052080e7          	jalr	82(ra) # 80201b1c <myproc>
    if (p != 0) {
    80202ad2:	cd01                	beqz	a0,80202aea <kerneltrap+0xba>
      printf("pid: %d, name: %s\n", p->pid, p->name);
    80202ad4:	16050613          	addi	a2,a0,352
    80202ad8:	5d0c                	lw	a1,56(a0)
    80202ada:	00007517          	auipc	a0,0x7
    80202ade:	dee50513          	addi	a0,a0,-530 # 802098c8 <states.1718+0x140>
    80202ae2:	ffffd097          	auipc	ra,0xffffd
    80202ae6:	6ac080e7          	jalr	1708(ra) # 8020018e <printf>
    panic("kerneltrap");
    80202aea:	00007517          	auipc	a0,0x7
    80202aee:	df650513          	addi	a0,a0,-522 # 802098e0 <states.1718+0x158>
    80202af2:	ffffd097          	auipc	ra,0xffffd
    80202af6:	652080e7          	jalr	1618(ra) # 80200144 <panic>
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING) {
    80202afa:	fffff097          	auipc	ra,0xfffff
    80202afe:	022080e7          	jalr	34(ra) # 80201b1c <myproc>
    80202b02:	d13d                	beqz	a0,80202a68 <kerneltrap+0x38>
    80202b04:	fffff097          	auipc	ra,0xfffff
    80202b08:	018080e7          	jalr	24(ra) # 80201b1c <myproc>
    80202b0c:	4d18                	lw	a4,24(a0)
    80202b0e:	478d                	li	a5,3
    80202b10:	f4f71ce3          	bne	a4,a5,80202a68 <kerneltrap+0x38>
    yield();
    80202b14:	00000097          	auipc	ra,0x0
    80202b18:	846080e7          	jalr	-1978(ra) # 8020235a <yield>
    80202b1c:	b7b1                	j	80202a68 <kerneltrap+0x38>

0000000080202b1e <trapframedump>:

void trapframedump(struct trapframe *tf)
{
    80202b1e:	1101                	addi	sp,sp,-32
    80202b20:	ec06                	sd	ra,24(sp)
    80202b22:	e822                	sd	s0,16(sp)
    80202b24:	e426                	sd	s1,8(sp)
    80202b26:	1000                	addi	s0,sp,32
    80202b28:	84aa                	mv	s1,a0
  printf("a0: %p\t", tf->a0);
    80202b2a:	792c                	ld	a1,112(a0)
    80202b2c:	00007517          	auipc	a0,0x7
    80202b30:	dc450513          	addi	a0,a0,-572 # 802098f0 <states.1718+0x168>
    80202b34:	ffffd097          	auipc	ra,0xffffd
    80202b38:	65a080e7          	jalr	1626(ra) # 8020018e <printf>
  printf("a1: %p\t", tf->a1);
    80202b3c:	7cac                	ld	a1,120(s1)
    80202b3e:	00007517          	auipc	a0,0x7
    80202b42:	dba50513          	addi	a0,a0,-582 # 802098f8 <states.1718+0x170>
    80202b46:	ffffd097          	auipc	ra,0xffffd
    80202b4a:	648080e7          	jalr	1608(ra) # 8020018e <printf>
  printf("a2: %p\t", tf->a2);
    80202b4e:	60cc                	ld	a1,128(s1)
    80202b50:	00007517          	auipc	a0,0x7
    80202b54:	db050513          	addi	a0,a0,-592 # 80209900 <states.1718+0x178>
    80202b58:	ffffd097          	auipc	ra,0xffffd
    80202b5c:	636080e7          	jalr	1590(ra) # 8020018e <printf>
  printf("a3: %p\n", tf->a3);
    80202b60:	64cc                	ld	a1,136(s1)
    80202b62:	00007517          	auipc	a0,0x7
    80202b66:	da650513          	addi	a0,a0,-602 # 80209908 <states.1718+0x180>
    80202b6a:	ffffd097          	auipc	ra,0xffffd
    80202b6e:	624080e7          	jalr	1572(ra) # 8020018e <printf>
  printf("a4: %p\t", tf->a4);
    80202b72:	68cc                	ld	a1,144(s1)
    80202b74:	00007517          	auipc	a0,0x7
    80202b78:	d9c50513          	addi	a0,a0,-612 # 80209910 <states.1718+0x188>
    80202b7c:	ffffd097          	auipc	ra,0xffffd
    80202b80:	612080e7          	jalr	1554(ra) # 8020018e <printf>
  printf("a5: %p\t", tf->a5);
    80202b84:	6ccc                	ld	a1,152(s1)
    80202b86:	00007517          	auipc	a0,0x7
    80202b8a:	d9250513          	addi	a0,a0,-622 # 80209918 <states.1718+0x190>
    80202b8e:	ffffd097          	auipc	ra,0xffffd
    80202b92:	600080e7          	jalr	1536(ra) # 8020018e <printf>
  printf("a6: %p\t", tf->a6);
    80202b96:	70cc                	ld	a1,160(s1)
    80202b98:	00007517          	auipc	a0,0x7
    80202b9c:	d8850513          	addi	a0,a0,-632 # 80209920 <states.1718+0x198>
    80202ba0:	ffffd097          	auipc	ra,0xffffd
    80202ba4:	5ee080e7          	jalr	1518(ra) # 8020018e <printf>
  printf("a7: %p\n", tf->a7);
    80202ba8:	74cc                	ld	a1,168(s1)
    80202baa:	00007517          	auipc	a0,0x7
    80202bae:	d7e50513          	addi	a0,a0,-642 # 80209928 <states.1718+0x1a0>
    80202bb2:	ffffd097          	auipc	ra,0xffffd
    80202bb6:	5dc080e7          	jalr	1500(ra) # 8020018e <printf>
  printf("t0: %p\t", tf->t0);
    80202bba:	64ac                	ld	a1,72(s1)
    80202bbc:	00007517          	auipc	a0,0x7
    80202bc0:	d7450513          	addi	a0,a0,-652 # 80209930 <states.1718+0x1a8>
    80202bc4:	ffffd097          	auipc	ra,0xffffd
    80202bc8:	5ca080e7          	jalr	1482(ra) # 8020018e <printf>
  printf("t1: %p\t", tf->t1);
    80202bcc:	68ac                	ld	a1,80(s1)
    80202bce:	00007517          	auipc	a0,0x7
    80202bd2:	d6a50513          	addi	a0,a0,-662 # 80209938 <states.1718+0x1b0>
    80202bd6:	ffffd097          	auipc	ra,0xffffd
    80202bda:	5b8080e7          	jalr	1464(ra) # 8020018e <printf>
  printf("t2: %p\t", tf->t2);
    80202bde:	6cac                	ld	a1,88(s1)
    80202be0:	00007517          	auipc	a0,0x7
    80202be4:	d6050513          	addi	a0,a0,-672 # 80209940 <states.1718+0x1b8>
    80202be8:	ffffd097          	auipc	ra,0xffffd
    80202bec:	5a6080e7          	jalr	1446(ra) # 8020018e <printf>
  printf("t3: %p\n", tf->t3);
    80202bf0:	1004b583          	ld	a1,256(s1)
    80202bf4:	00007517          	auipc	a0,0x7
    80202bf8:	d5450513          	addi	a0,a0,-684 # 80209948 <states.1718+0x1c0>
    80202bfc:	ffffd097          	auipc	ra,0xffffd
    80202c00:	592080e7          	jalr	1426(ra) # 8020018e <printf>
  printf("t4: %p\t", tf->t4);
    80202c04:	1084b583          	ld	a1,264(s1)
    80202c08:	00007517          	auipc	a0,0x7
    80202c0c:	d4850513          	addi	a0,a0,-696 # 80209950 <states.1718+0x1c8>
    80202c10:	ffffd097          	auipc	ra,0xffffd
    80202c14:	57e080e7          	jalr	1406(ra) # 8020018e <printf>
  printf("t5: %p\t", tf->t5);
    80202c18:	1104b583          	ld	a1,272(s1)
    80202c1c:	00007517          	auipc	a0,0x7
    80202c20:	d3c50513          	addi	a0,a0,-708 # 80209958 <states.1718+0x1d0>
    80202c24:	ffffd097          	auipc	ra,0xffffd
    80202c28:	56a080e7          	jalr	1386(ra) # 8020018e <printf>
  printf("t6: %p\t", tf->t6);
    80202c2c:	1184b583          	ld	a1,280(s1)
    80202c30:	00007517          	auipc	a0,0x7
    80202c34:	d3050513          	addi	a0,a0,-720 # 80209960 <states.1718+0x1d8>
    80202c38:	ffffd097          	auipc	ra,0xffffd
    80202c3c:	556080e7          	jalr	1366(ra) # 8020018e <printf>
  printf("s0: %p\n", tf->s0);
    80202c40:	70ac                	ld	a1,96(s1)
    80202c42:	00007517          	auipc	a0,0x7
    80202c46:	d2650513          	addi	a0,a0,-730 # 80209968 <states.1718+0x1e0>
    80202c4a:	ffffd097          	auipc	ra,0xffffd
    80202c4e:	544080e7          	jalr	1348(ra) # 8020018e <printf>
  printf("s1: %p\t", tf->s1);
    80202c52:	74ac                	ld	a1,104(s1)
    80202c54:	00007517          	auipc	a0,0x7
    80202c58:	d1c50513          	addi	a0,a0,-740 # 80209970 <states.1718+0x1e8>
    80202c5c:	ffffd097          	auipc	ra,0xffffd
    80202c60:	532080e7          	jalr	1330(ra) # 8020018e <printf>
  printf("s2: %p\t", tf->s2);
    80202c64:	78cc                	ld	a1,176(s1)
    80202c66:	00007517          	auipc	a0,0x7
    80202c6a:	d1250513          	addi	a0,a0,-750 # 80209978 <states.1718+0x1f0>
    80202c6e:	ffffd097          	auipc	ra,0xffffd
    80202c72:	520080e7          	jalr	1312(ra) # 8020018e <printf>
  printf("s3: %p\t", tf->s3);
    80202c76:	7ccc                	ld	a1,184(s1)
    80202c78:	00007517          	auipc	a0,0x7
    80202c7c:	d0850513          	addi	a0,a0,-760 # 80209980 <states.1718+0x1f8>
    80202c80:	ffffd097          	auipc	ra,0xffffd
    80202c84:	50e080e7          	jalr	1294(ra) # 8020018e <printf>
  printf("s4: %p\n", tf->s4);
    80202c88:	60ec                	ld	a1,192(s1)
    80202c8a:	00007517          	auipc	a0,0x7
    80202c8e:	cfe50513          	addi	a0,a0,-770 # 80209988 <states.1718+0x200>
    80202c92:	ffffd097          	auipc	ra,0xffffd
    80202c96:	4fc080e7          	jalr	1276(ra) # 8020018e <printf>
  printf("s5: %p\t", tf->s5);
    80202c9a:	64ec                	ld	a1,200(s1)
    80202c9c:	00007517          	auipc	a0,0x7
    80202ca0:	cf450513          	addi	a0,a0,-780 # 80209990 <states.1718+0x208>
    80202ca4:	ffffd097          	auipc	ra,0xffffd
    80202ca8:	4ea080e7          	jalr	1258(ra) # 8020018e <printf>
  printf("s6: %p\t", tf->s6);
    80202cac:	68ec                	ld	a1,208(s1)
    80202cae:	00007517          	auipc	a0,0x7
    80202cb2:	cea50513          	addi	a0,a0,-790 # 80209998 <states.1718+0x210>
    80202cb6:	ffffd097          	auipc	ra,0xffffd
    80202cba:	4d8080e7          	jalr	1240(ra) # 8020018e <printf>
  printf("s7: %p\t", tf->s7);
    80202cbe:	6cec                	ld	a1,216(s1)
    80202cc0:	00007517          	auipc	a0,0x7
    80202cc4:	ce050513          	addi	a0,a0,-800 # 802099a0 <states.1718+0x218>
    80202cc8:	ffffd097          	auipc	ra,0xffffd
    80202ccc:	4c6080e7          	jalr	1222(ra) # 8020018e <printf>
  printf("s8: %p\n", tf->s8);
    80202cd0:	70ec                	ld	a1,224(s1)
    80202cd2:	00007517          	auipc	a0,0x7
    80202cd6:	cd650513          	addi	a0,a0,-810 # 802099a8 <states.1718+0x220>
    80202cda:	ffffd097          	auipc	ra,0xffffd
    80202cde:	4b4080e7          	jalr	1204(ra) # 8020018e <printf>
  printf("s9: %p\t", tf->s9);
    80202ce2:	74ec                	ld	a1,232(s1)
    80202ce4:	00007517          	auipc	a0,0x7
    80202ce8:	ccc50513          	addi	a0,a0,-820 # 802099b0 <states.1718+0x228>
    80202cec:	ffffd097          	auipc	ra,0xffffd
    80202cf0:	4a2080e7          	jalr	1186(ra) # 8020018e <printf>
  printf("s10: %p\t", tf->s10);
    80202cf4:	78ec                	ld	a1,240(s1)
    80202cf6:	00007517          	auipc	a0,0x7
    80202cfa:	cc250513          	addi	a0,a0,-830 # 802099b8 <states.1718+0x230>
    80202cfe:	ffffd097          	auipc	ra,0xffffd
    80202d02:	490080e7          	jalr	1168(ra) # 8020018e <printf>
  printf("s11: %p\t", tf->s11);
    80202d06:	7cec                	ld	a1,248(s1)
    80202d08:	00007517          	auipc	a0,0x7
    80202d0c:	cc050513          	addi	a0,a0,-832 # 802099c8 <states.1718+0x240>
    80202d10:	ffffd097          	auipc	ra,0xffffd
    80202d14:	47e080e7          	jalr	1150(ra) # 8020018e <printf>
  printf("ra: %p\n", tf->ra);
    80202d18:	748c                	ld	a1,40(s1)
    80202d1a:	00007517          	auipc	a0,0x7
    80202d1e:	95650513          	addi	a0,a0,-1706 # 80209670 <digits+0x2f0>
    80202d22:	ffffd097          	auipc	ra,0xffffd
    80202d26:	46c080e7          	jalr	1132(ra) # 8020018e <printf>
  printf("sp: %p\t", tf->sp);
    80202d2a:	788c                	ld	a1,48(s1)
    80202d2c:	00007517          	auipc	a0,0x7
    80202d30:	cac50513          	addi	a0,a0,-852 # 802099d8 <states.1718+0x250>
    80202d34:	ffffd097          	auipc	ra,0xffffd
    80202d38:	45a080e7          	jalr	1114(ra) # 8020018e <printf>
  printf("gp: %p\t", tf->gp);
    80202d3c:	7c8c                	ld	a1,56(s1)
    80202d3e:	00007517          	auipc	a0,0x7
    80202d42:	ca250513          	addi	a0,a0,-862 # 802099e0 <states.1718+0x258>
    80202d46:	ffffd097          	auipc	ra,0xffffd
    80202d4a:	448080e7          	jalr	1096(ra) # 8020018e <printf>
  printf("tp: %p\t", tf->tp);
    80202d4e:	60ac                	ld	a1,64(s1)
    80202d50:	00007517          	auipc	a0,0x7
    80202d54:	c9850513          	addi	a0,a0,-872 # 802099e8 <states.1718+0x260>
    80202d58:	ffffd097          	auipc	ra,0xffffd
    80202d5c:	436080e7          	jalr	1078(ra) # 8020018e <printf>
  printf("epc: %p\n", tf->epc);
    80202d60:	6c8c                	ld	a1,24(s1)
    80202d62:	00007517          	auipc	a0,0x7
    80202d66:	c8e50513          	addi	a0,a0,-882 # 802099f0 <states.1718+0x268>
    80202d6a:	ffffd097          	auipc	ra,0xffffd
    80202d6e:	424080e7          	jalr	1060(ra) # 8020018e <printf>
}
    80202d72:	60e2                	ld	ra,24(sp)
    80202d74:	6442                	ld	s0,16(sp)
    80202d76:	64a2                	ld	s1,8(sp)
    80202d78:	6105                	addi	sp,sp,32
    80202d7a:	8082                	ret

0000000080202d7c <argraw>:
  return strlen(buf);
}

static uint64
argraw(int n)
{
    80202d7c:	1101                	addi	sp,sp,-32
    80202d7e:	ec06                	sd	ra,24(sp)
    80202d80:	e822                	sd	s0,16(sp)
    80202d82:	e426                	sd	s1,8(sp)
    80202d84:	1000                	addi	s0,sp,32
    80202d86:	84aa                	mv	s1,a0
  struct proc *p = myproc();
    80202d88:	fffff097          	auipc	ra,0xfffff
    80202d8c:	d94080e7          	jalr	-620(ra) # 80201b1c <myproc>
  switch (n) {
    80202d90:	4795                	li	a5,5
    80202d92:	0497e163          	bltu	a5,s1,80202dd4 <argraw+0x58>
    80202d96:	048a                	slli	s1,s1,0x2
    80202d98:	00007717          	auipc	a4,0x7
    80202d9c:	db070713          	addi	a4,a4,-592 # 80209b48 <states.1718+0x3c0>
    80202da0:	94ba                	add	s1,s1,a4
    80202da2:	409c                	lw	a5,0(s1)
    80202da4:	97ba                	add	a5,a5,a4
    80202da6:	8782                	jr	a5
  case 0:
    return p->trapframe->a0;
    80202da8:	713c                	ld	a5,96(a0)
    80202daa:	7ba8                	ld	a0,112(a5)
  case 5:
    return p->trapframe->a5;
  }
  panic("argraw");
  return -1;
}
    80202dac:	60e2                	ld	ra,24(sp)
    80202dae:	6442                	ld	s0,16(sp)
    80202db0:	64a2                	ld	s1,8(sp)
    80202db2:	6105                	addi	sp,sp,32
    80202db4:	8082                	ret
    return p->trapframe->a1;
    80202db6:	713c                	ld	a5,96(a0)
    80202db8:	7fa8                	ld	a0,120(a5)
    80202dba:	bfcd                	j	80202dac <argraw+0x30>
    return p->trapframe->a2;
    80202dbc:	713c                	ld	a5,96(a0)
    80202dbe:	63c8                	ld	a0,128(a5)
    80202dc0:	b7f5                	j	80202dac <argraw+0x30>
    return p->trapframe->a3;
    80202dc2:	713c                	ld	a5,96(a0)
    80202dc4:	67c8                	ld	a0,136(a5)
    80202dc6:	b7dd                	j	80202dac <argraw+0x30>
    return p->trapframe->a4;
    80202dc8:	713c                	ld	a5,96(a0)
    80202dca:	6bc8                	ld	a0,144(a5)
    80202dcc:	b7c5                	j	80202dac <argraw+0x30>
    return p->trapframe->a5;
    80202dce:	713c                	ld	a5,96(a0)
    80202dd0:	6fc8                	ld	a0,152(a5)
    80202dd2:	bfe9                	j	80202dac <argraw+0x30>
  panic("argraw");
    80202dd4:	00007517          	auipc	a0,0x7
    80202dd8:	c2c50513          	addi	a0,a0,-980 # 80209a00 <states.1718+0x278>
    80202ddc:	ffffd097          	auipc	ra,0xffffd
    80202de0:	368080e7          	jalr	872(ra) # 80200144 <panic>

0000000080202de4 <sys_sysinfo>:
    return 0;
}

uint64
sys_sysinfo(void)
{
    80202de4:	7179                	addi	sp,sp,-48
    80202de6:	f406                	sd	ra,40(sp)
    80202de8:	f022                	sd	s0,32(sp)
    80202dea:	ec26                	sd	s1,24(sp)
    80202dec:	1800                	addi	s0,sp,48
  *ip = argraw(n);
    80202dee:	4501                	li	a0,0
    80202df0:	00000097          	auipc	ra,0x0
    80202df4:	f8c080e7          	jalr	-116(ra) # 80202d7c <argraw>
    80202df8:	84aa                	mv	s1,a0
  if (argaddr(0, &addr) < 0) {
    return -1;
  }

  struct sysinfo info;
  info.freemem = freemem_amount();
    80202dfa:	ffffd097          	auipc	ra,0xffffd
    80202dfe:	7f4080e7          	jalr	2036(ra) # 802005ee <freemem_amount>
    80202e02:	fca43823          	sd	a0,-48(s0)
  info.nproc = procnum();
    80202e06:	00000097          	auipc	ra,0x0
    80202e0a:	90a080e7          	jalr	-1782(ra) # 80202710 <procnum>
    80202e0e:	fca43c23          	sd	a0,-40(s0)

  // if (copyout(p->pagetable, addr, (char *)&info, sizeof(info)) < 0) {
  if (copyout2(addr, (char *)&info, sizeof(info)) < 0) {
    80202e12:	4641                	li	a2,16
    80202e14:	fd040593          	addi	a1,s0,-48
    80202e18:	8526                	mv	a0,s1
    80202e1a:	ffffe097          	auipc	ra,0xffffe
    80202e1e:	616080e7          	jalr	1558(ra) # 80201430 <copyout2>
    return -1;
  }

  return 0;
    80202e22:	957d                	srai	a0,a0,0x3f
    80202e24:	70a2                	ld	ra,40(sp)
    80202e26:	7402                	ld	s0,32(sp)
    80202e28:	64e2                	ld	s1,24(sp)
    80202e2a:	6145                	addi	sp,sp,48
    80202e2c:	8082                	ret

0000000080202e2e <fetchaddr>:
{
    80202e2e:	1101                	addi	sp,sp,-32
    80202e30:	ec06                	sd	ra,24(sp)
    80202e32:	e822                	sd	s0,16(sp)
    80202e34:	e426                	sd	s1,8(sp)
    80202e36:	e04a                	sd	s2,0(sp)
    80202e38:	1000                	addi	s0,sp,32
    80202e3a:	84aa                	mv	s1,a0
    80202e3c:	892e                	mv	s2,a1
  struct proc *p = myproc();
    80202e3e:	fffff097          	auipc	ra,0xfffff
    80202e42:	cde080e7          	jalr	-802(ra) # 80201b1c <myproc>
  if(addr >= p->sz || addr+sizeof(uint64) > p->sz)
    80202e46:	653c                	ld	a5,72(a0)
    80202e48:	02f4f763          	bgeu	s1,a5,80202e76 <fetchaddr+0x48>
    80202e4c:	00848713          	addi	a4,s1,8
    80202e50:	02e7e563          	bltu	a5,a4,80202e7a <fetchaddr+0x4c>
  if(copyin2((char *)ip, addr, sizeof(*ip)) != 0)
    80202e54:	4621                	li	a2,8
    80202e56:	85a6                	mv	a1,s1
    80202e58:	854a                	mv	a0,s2
    80202e5a:	ffffe097          	auipc	ra,0xffffe
    80202e5e:	6b4080e7          	jalr	1716(ra) # 8020150e <copyin2>
    80202e62:	00a03533          	snez	a0,a0
    80202e66:	40a00533          	neg	a0,a0
}
    80202e6a:	60e2                	ld	ra,24(sp)
    80202e6c:	6442                	ld	s0,16(sp)
    80202e6e:	64a2                	ld	s1,8(sp)
    80202e70:	6902                	ld	s2,0(sp)
    80202e72:	6105                	addi	sp,sp,32
    80202e74:	8082                	ret
    return -1;
    80202e76:	557d                	li	a0,-1
    80202e78:	bfcd                	j	80202e6a <fetchaddr+0x3c>
    80202e7a:	557d                	li	a0,-1
    80202e7c:	b7fd                	j	80202e6a <fetchaddr+0x3c>

0000000080202e7e <fetchstr>:
{
    80202e7e:	1101                	addi	sp,sp,-32
    80202e80:	ec06                	sd	ra,24(sp)
    80202e82:	e822                	sd	s0,16(sp)
    80202e84:	e426                	sd	s1,8(sp)
    80202e86:	1000                	addi	s0,sp,32
    80202e88:	84ae                	mv	s1,a1
  int err = copyinstr2(buf, addr, max);
    80202e8a:	85aa                	mv	a1,a0
    80202e8c:	8526                	mv	a0,s1
    80202e8e:	ffffe097          	auipc	ra,0xffffe
    80202e92:	786080e7          	jalr	1926(ra) # 80201614 <copyinstr2>
  if(err < 0)
    80202e96:	00054763          	bltz	a0,80202ea4 <fetchstr+0x26>
  return strlen(buf);
    80202e9a:	8526                	mv	a0,s1
    80202e9c:	ffffe097          	auipc	ra,0xffffe
    80202ea0:	a7c080e7          	jalr	-1412(ra) # 80200918 <strlen>
}
    80202ea4:	60e2                	ld	ra,24(sp)
    80202ea6:	6442                	ld	s0,16(sp)
    80202ea8:	64a2                	ld	s1,8(sp)
    80202eaa:	6105                	addi	sp,sp,32
    80202eac:	8082                	ret

0000000080202eae <argint>:
{
    80202eae:	1101                	addi	sp,sp,-32
    80202eb0:	ec06                	sd	ra,24(sp)
    80202eb2:	e822                	sd	s0,16(sp)
    80202eb4:	e426                	sd	s1,8(sp)
    80202eb6:	1000                	addi	s0,sp,32
    80202eb8:	84ae                	mv	s1,a1
  *ip = argraw(n);
    80202eba:	00000097          	auipc	ra,0x0
    80202ebe:	ec2080e7          	jalr	-318(ra) # 80202d7c <argraw>
    80202ec2:	c088                	sw	a0,0(s1)
}
    80202ec4:	4501                	li	a0,0
    80202ec6:	60e2                	ld	ra,24(sp)
    80202ec8:	6442                	ld	s0,16(sp)
    80202eca:	64a2                	ld	s1,8(sp)
    80202ecc:	6105                	addi	sp,sp,32
    80202ece:	8082                	ret

0000000080202ed0 <sys_test_proc>:
sys_test_proc(void) {
    80202ed0:	1101                	addi	sp,sp,-32
    80202ed2:	ec06                	sd	ra,24(sp)
    80202ed4:	e822                	sd	s0,16(sp)
    80202ed6:	1000                	addi	s0,sp,32
    argint(0, &n);
    80202ed8:	fec40593          	addi	a1,s0,-20
    80202edc:	4501                	li	a0,0
    80202ede:	00000097          	auipc	ra,0x0
    80202ee2:	fd0080e7          	jalr	-48(ra) # 80202eae <argint>
    printf("hello world from proc %d, hart %d, arg %d\n", myproc()->pid, r_tp(), n);
    80202ee6:	fffff097          	auipc	ra,0xfffff
    80202eea:	c36080e7          	jalr	-970(ra) # 80201b1c <myproc>
    80202eee:	8612                	mv	a2,tp
    80202ef0:	fec42683          	lw	a3,-20(s0)
    80202ef4:	5d0c                	lw	a1,56(a0)
    80202ef6:	00007517          	auipc	a0,0x7
    80202efa:	b1250513          	addi	a0,a0,-1262 # 80209a08 <states.1718+0x280>
    80202efe:	ffffd097          	auipc	ra,0xffffd
    80202f02:	290080e7          	jalr	656(ra) # 8020018e <printf>
}
    80202f06:	4501                	li	a0,0
    80202f08:	60e2                	ld	ra,24(sp)
    80202f0a:	6442                	ld	s0,16(sp)
    80202f0c:	6105                	addi	sp,sp,32
    80202f0e:	8082                	ret

0000000080202f10 <argaddr>:
{
    80202f10:	1101                	addi	sp,sp,-32
    80202f12:	ec06                	sd	ra,24(sp)
    80202f14:	e822                	sd	s0,16(sp)
    80202f16:	e426                	sd	s1,8(sp)
    80202f18:	1000                	addi	s0,sp,32
    80202f1a:	84ae                	mv	s1,a1
  *ip = argraw(n);
    80202f1c:	00000097          	auipc	ra,0x0
    80202f20:	e60080e7          	jalr	-416(ra) # 80202d7c <argraw>
    80202f24:	e088                	sd	a0,0(s1)
}
    80202f26:	4501                	li	a0,0
    80202f28:	60e2                	ld	ra,24(sp)
    80202f2a:	6442                	ld	s0,16(sp)
    80202f2c:	64a2                	ld	s1,8(sp)
    80202f2e:	6105                	addi	sp,sp,32
    80202f30:	8082                	ret

0000000080202f32 <argstr>:
{
    80202f32:	1101                	addi	sp,sp,-32
    80202f34:	ec06                	sd	ra,24(sp)
    80202f36:	e822                	sd	s0,16(sp)
    80202f38:	e426                	sd	s1,8(sp)
    80202f3a:	e04a                	sd	s2,0(sp)
    80202f3c:	1000                	addi	s0,sp,32
    80202f3e:	84ae                	mv	s1,a1
    80202f40:	8932                	mv	s2,a2
  *ip = argraw(n);
    80202f42:	00000097          	auipc	ra,0x0
    80202f46:	e3a080e7          	jalr	-454(ra) # 80202d7c <argraw>
  return fetchstr(addr, buf, max);
    80202f4a:	864a                	mv	a2,s2
    80202f4c:	85a6                	mv	a1,s1
    80202f4e:	00000097          	auipc	ra,0x0
    80202f52:	f30080e7          	jalr	-208(ra) # 80202e7e <fetchstr>
}
    80202f56:	60e2                	ld	ra,24(sp)
    80202f58:	6442                	ld	s0,16(sp)
    80202f5a:	64a2                	ld	s1,8(sp)
    80202f5c:	6902                	ld	s2,0(sp)
    80202f5e:	6105                	addi	sp,sp,32
    80202f60:	8082                	ret

0000000080202f62 <syscall>:
{
    80202f62:	7179                	addi	sp,sp,-48
    80202f64:	f406                	sd	ra,40(sp)
    80202f66:	f022                	sd	s0,32(sp)
    80202f68:	ec26                	sd	s1,24(sp)
    80202f6a:	e84a                	sd	s2,16(sp)
    80202f6c:	e44e                	sd	s3,8(sp)
    80202f6e:	1800                	addi	s0,sp,48
  struct proc *p = myproc();
    80202f70:	fffff097          	auipc	ra,0xfffff
    80202f74:	bac080e7          	jalr	-1108(ra) # 80201b1c <myproc>
    80202f78:	84aa                	mv	s1,a0
  num = p->trapframe->a7;
    80202f7a:	06053903          	ld	s2,96(a0)
    80202f7e:	0a893783          	ld	a5,168(s2)
    80202f82:	0007899b          	sext.w	s3,a5
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    80202f86:	37fd                	addiw	a5,a5,-1
    80202f88:	4765                	li	a4,25
    80202f8a:	04f76863          	bltu	a4,a5,80202fda <syscall+0x78>
    80202f8e:	00399713          	slli	a4,s3,0x3
    80202f92:	00007797          	auipc	a5,0x7
    80202f96:	bce78793          	addi	a5,a5,-1074 # 80209b60 <syscalls>
    80202f9a:	97ba                	add	a5,a5,a4
    80202f9c:	639c                	ld	a5,0(a5)
    80202f9e:	cf95                	beqz	a5,80202fda <syscall+0x78>
    p->trapframe->a0 = syscalls[num]();
    80202fa0:	9782                	jalr	a5
    80202fa2:	06a93823          	sd	a0,112(s2)
    if ((p->tmask & (1 << num)) != 0) {
    80202fa6:	1704a783          	lw	a5,368(s1)
    80202faa:	4137d7bb          	sraw	a5,a5,s3
    80202fae:	8b85                	andi	a5,a5,1
    80202fb0:	c7a1                	beqz	a5,80202ff8 <syscall+0x96>
      printf("pid %d: %s -> %d\n", p->pid, sysnames[num], p->trapframe->a0);
    80202fb2:	70b8                	ld	a4,96(s1)
    80202fb4:	098e                	slli	s3,s3,0x3
    80202fb6:	00007797          	auipc	a5,0x7
    80202fba:	baa78793          	addi	a5,a5,-1110 # 80209b60 <syscalls>
    80202fbe:	99be                	add	s3,s3,a5
    80202fc0:	7b34                	ld	a3,112(a4)
    80202fc2:	0d89b603          	ld	a2,216(s3)
    80202fc6:	5c8c                	lw	a1,56(s1)
    80202fc8:	00007517          	auipc	a0,0x7
    80202fcc:	a7050513          	addi	a0,a0,-1424 # 80209a38 <states.1718+0x2b0>
    80202fd0:	ffffd097          	auipc	ra,0xffffd
    80202fd4:	1be080e7          	jalr	446(ra) # 8020018e <printf>
    80202fd8:	a005                	j	80202ff8 <syscall+0x96>
    printf("pid %d %s: unknown sys call %d\n",
    80202fda:	86ce                	mv	a3,s3
    80202fdc:	16048613          	addi	a2,s1,352
    80202fe0:	5c8c                	lw	a1,56(s1)
    80202fe2:	00007517          	auipc	a0,0x7
    80202fe6:	a6e50513          	addi	a0,a0,-1426 # 80209a50 <states.1718+0x2c8>
    80202fea:	ffffd097          	auipc	ra,0xffffd
    80202fee:	1a4080e7          	jalr	420(ra) # 8020018e <printf>
    p->trapframe->a0 = -1;
    80202ff2:	70bc                	ld	a5,96(s1)
    80202ff4:	577d                	li	a4,-1
    80202ff6:	fbb8                	sd	a4,112(a5)
}
    80202ff8:	70a2                	ld	ra,40(sp)
    80202ffa:	7402                	ld	s0,32(sp)
    80202ffc:	64e2                	ld	s1,24(sp)
    80202ffe:	6942                	ld	s2,16(sp)
    80203000:	69a2                	ld	s3,8(sp)
    80203002:	6145                	addi	sp,sp,48
    80203004:	8082                	ret

0000000080203006 <sys_exec>:

extern int exec(char *path, char **argv);

uint64
sys_exec(void)
{
    80203006:	da010113          	addi	sp,sp,-608
    8020300a:	24113c23          	sd	ra,600(sp)
    8020300e:	24813823          	sd	s0,592(sp)
    80203012:	24913423          	sd	s1,584(sp)
    80203016:	25213023          	sd	s2,576(sp)
    8020301a:	23313c23          	sd	s3,568(sp)
    8020301e:	23413823          	sd	s4,560(sp)
    80203022:	23513423          	sd	s5,552(sp)
    80203026:	1480                	addi	s0,sp,608
  char path[FAT32_MAX_PATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    80203028:	10400613          	li	a2,260
    8020302c:	eb840593          	addi	a1,s0,-328
    80203030:	4501                	li	a0,0
    80203032:	00000097          	auipc	ra,0x0
    80203036:	f00080e7          	jalr	-256(ra) # 80202f32 <argstr>
    return -1;
    8020303a:	597d                	li	s2,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    8020303c:	0c054a63          	bltz	a0,80203110 <sys_exec+0x10a>
    80203040:	db040593          	addi	a1,s0,-592
    80203044:	4505                	li	a0,1
    80203046:	00000097          	auipc	ra,0x0
    8020304a:	eca080e7          	jalr	-310(ra) # 80202f10 <argaddr>
    8020304e:	0c054163          	bltz	a0,80203110 <sys_exec+0x10a>
  }
  memset(argv, 0, sizeof(argv));
    80203052:	10000613          	li	a2,256
    80203056:	4581                	li	a1,0
    80203058:	db840513          	addi	a0,s0,-584
    8020305c:	ffffd097          	auipc	ra,0xffffd
    80203060:	734080e7          	jalr	1844(ra) # 80200790 <memset>
  for(i=0;; i++){
    if(i >= NELEM(argv)){
    80203064:	db840493          	addi	s1,s0,-584
  memset(argv, 0, sizeof(argv));
    80203068:	89a6                	mv	s3,s1
    8020306a:	4901                	li	s2,0
    if(i >= NELEM(argv)){
    8020306c:	02000a13          	li	s4,32
    80203070:	00090a9b          	sext.w	s5,s2
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    80203074:	00391513          	slli	a0,s2,0x3
    80203078:	da840593          	addi	a1,s0,-600
    8020307c:	db043783          	ld	a5,-592(s0)
    80203080:	953e                	add	a0,a0,a5
    80203082:	00000097          	auipc	ra,0x0
    80203086:	dac080e7          	jalr	-596(ra) # 80202e2e <fetchaddr>
    8020308a:	02054a63          	bltz	a0,802030be <sys_exec+0xb8>
      goto bad;
    }
    if(uarg == 0){
    8020308e:	da843783          	ld	a5,-600(s0)
    80203092:	c3b9                	beqz	a5,802030d8 <sys_exec+0xd2>
      argv[i] = 0;
      break;
    }
    argv[i] = kalloc();
    80203094:	ffffd097          	auipc	ra,0xffffd
    80203098:	4f4080e7          	jalr	1268(ra) # 80200588 <kalloc>
    8020309c:	85aa                	mv	a1,a0
    8020309e:	00a9b023          	sd	a0,0(s3)
    if(argv[i] == 0)
    802030a2:	cd11                	beqz	a0,802030be <sys_exec+0xb8>
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    802030a4:	6605                	lui	a2,0x1
    802030a6:	da843503          	ld	a0,-600(s0)
    802030aa:	00000097          	auipc	ra,0x0
    802030ae:	dd4080e7          	jalr	-556(ra) # 80202e7e <fetchstr>
    802030b2:	00054663          	bltz	a0,802030be <sys_exec+0xb8>
    if(i >= NELEM(argv)){
    802030b6:	0905                	addi	s2,s2,1
    802030b8:	09a1                	addi	s3,s3,8
    802030ba:	fb491be3          	bne	s2,s4,80203070 <sys_exec+0x6a>
    kfree(argv[i]);

  return ret;

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    802030be:	10048913          	addi	s2,s1,256
    802030c2:	6088                	ld	a0,0(s1)
    802030c4:	c529                	beqz	a0,8020310e <sys_exec+0x108>
    kfree(argv[i]);
    802030c6:	ffffd097          	auipc	ra,0xffffd
    802030ca:	380080e7          	jalr	896(ra) # 80200446 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    802030ce:	04a1                	addi	s1,s1,8
    802030d0:	ff2499e3          	bne	s1,s2,802030c2 <sys_exec+0xbc>
  return -1;
    802030d4:	597d                	li	s2,-1
    802030d6:	a82d                	j	80203110 <sys_exec+0x10a>
      argv[i] = 0;
    802030d8:	0a8e                	slli	s5,s5,0x3
    802030da:	fc040793          	addi	a5,s0,-64
    802030de:	9abe                	add	s5,s5,a5
    802030e0:	de0abc23          	sd	zero,-520(s5)
  int ret = exec(path, argv);
    802030e4:	db840593          	addi	a1,s0,-584
    802030e8:	eb840513          	addi	a0,s0,-328
    802030ec:	00001097          	auipc	ra,0x1
    802030f0:	e78080e7          	jalr	-392(ra) # 80203f64 <exec>
    802030f4:	892a                	mv	s2,a0
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    802030f6:	10048993          	addi	s3,s1,256
    802030fa:	6088                	ld	a0,0(s1)
    802030fc:	c911                	beqz	a0,80203110 <sys_exec+0x10a>
    kfree(argv[i]);
    802030fe:	ffffd097          	auipc	ra,0xffffd
    80203102:	348080e7          	jalr	840(ra) # 80200446 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80203106:	04a1                	addi	s1,s1,8
    80203108:	ff3499e3          	bne	s1,s3,802030fa <sys_exec+0xf4>
    8020310c:	a011                	j	80203110 <sys_exec+0x10a>
  return -1;
    8020310e:	597d                	li	s2,-1
}
    80203110:	854a                	mv	a0,s2
    80203112:	25813083          	ld	ra,600(sp)
    80203116:	25013403          	ld	s0,592(sp)
    8020311a:	24813483          	ld	s1,584(sp)
    8020311e:	24013903          	ld	s2,576(sp)
    80203122:	23813983          	ld	s3,568(sp)
    80203126:	23013a03          	ld	s4,560(sp)
    8020312a:	22813a83          	ld	s5,552(sp)
    8020312e:	26010113          	addi	sp,sp,608
    80203132:	8082                	ret

0000000080203134 <sys_exit>:

uint64
sys_exit(void)
{
    80203134:	1101                	addi	sp,sp,-32
    80203136:	ec06                	sd	ra,24(sp)
    80203138:	e822                	sd	s0,16(sp)
    8020313a:	1000                	addi	s0,sp,32
  int n;
  if(argint(0, &n) < 0)
    8020313c:	fec40593          	addi	a1,s0,-20
    80203140:	4501                	li	a0,0
    80203142:	00000097          	auipc	ra,0x0
    80203146:	d6c080e7          	jalr	-660(ra) # 80202eae <argint>
    return -1;
    8020314a:	57fd                	li	a5,-1
  if(argint(0, &n) < 0)
    8020314c:	00054963          	bltz	a0,8020315e <sys_exit+0x2a>
  exit(n);
    80203150:	fec42503          	lw	a0,-20(s0)
    80203154:	fffff097          	auipc	ra,0xfffff
    80203158:	10c080e7          	jalr	268(ra) # 80202260 <exit>
  return 0;  // not reached
    8020315c:	4781                	li	a5,0
}
    8020315e:	853e                	mv	a0,a5
    80203160:	60e2                	ld	ra,24(sp)
    80203162:	6442                	ld	s0,16(sp)
    80203164:	6105                	addi	sp,sp,32
    80203166:	8082                	ret

0000000080203168 <sys_getpid>:

uint64
sys_getpid(void)
{
    80203168:	1141                	addi	sp,sp,-16
    8020316a:	e406                	sd	ra,8(sp)
    8020316c:	e022                	sd	s0,0(sp)
    8020316e:	0800                	addi	s0,sp,16
  return myproc()->pid;
    80203170:	fffff097          	auipc	ra,0xfffff
    80203174:	9ac080e7          	jalr	-1620(ra) # 80201b1c <myproc>
}
    80203178:	5d08                	lw	a0,56(a0)
    8020317a:	60a2                	ld	ra,8(sp)
    8020317c:	6402                	ld	s0,0(sp)
    8020317e:	0141                	addi	sp,sp,16
    80203180:	8082                	ret

0000000080203182 <sys_fork>:

uint64
sys_fork(void)
{
    80203182:	1141                	addi	sp,sp,-16
    80203184:	e406                	sd	ra,8(sp)
    80203186:	e022                	sd	s0,0(sp)
    80203188:	0800                	addi	s0,sp,16
  return fork();
    8020318a:	fffff097          	auipc	ra,0xfffff
    8020318e:	d9c080e7          	jalr	-612(ra) # 80201f26 <fork>
}
    80203192:	60a2                	ld	ra,8(sp)
    80203194:	6402                	ld	s0,0(sp)
    80203196:	0141                	addi	sp,sp,16
    80203198:	8082                	ret

000000008020319a <sys_wait>:

uint64
sys_wait(void)
{
    8020319a:	1101                	addi	sp,sp,-32
    8020319c:	ec06                	sd	ra,24(sp)
    8020319e:	e822                	sd	s0,16(sp)
    802031a0:	1000                	addi	s0,sp,32
  uint64 p;
  if(argaddr(0, &p) < 0)
    802031a2:	fe840593          	addi	a1,s0,-24
    802031a6:	4501                	li	a0,0
    802031a8:	00000097          	auipc	ra,0x0
    802031ac:	d68080e7          	jalr	-664(ra) # 80202f10 <argaddr>
    802031b0:	87aa                	mv	a5,a0
    return -1;
    802031b2:	557d                	li	a0,-1
  if(argaddr(0, &p) < 0)
    802031b4:	0007c863          	bltz	a5,802031c4 <sys_wait+0x2a>
  return wait(p);
    802031b8:	fe843503          	ld	a0,-24(s0)
    802031bc:	fffff097          	auipc	ra,0xfffff
    802031c0:	258080e7          	jalr	600(ra) # 80202414 <wait>
}
    802031c4:	60e2                	ld	ra,24(sp)
    802031c6:	6442                	ld	s0,16(sp)
    802031c8:	6105                	addi	sp,sp,32
    802031ca:	8082                	ret

00000000802031cc <sys_sbrk>:

uint64
sys_sbrk(void)
{
    802031cc:	7179                	addi	sp,sp,-48
    802031ce:	f406                	sd	ra,40(sp)
    802031d0:	f022                	sd	s0,32(sp)
    802031d2:	ec26                	sd	s1,24(sp)
    802031d4:	1800                	addi	s0,sp,48
  int addr;
  int n;

  if(argint(0, &n) < 0)
    802031d6:	fdc40593          	addi	a1,s0,-36
    802031da:	4501                	li	a0,0
    802031dc:	00000097          	auipc	ra,0x0
    802031e0:	cd2080e7          	jalr	-814(ra) # 80202eae <argint>
    802031e4:	87aa                	mv	a5,a0
    return -1;
    802031e6:	557d                	li	a0,-1
  if(argint(0, &n) < 0)
    802031e8:	0207c063          	bltz	a5,80203208 <sys_sbrk+0x3c>
  addr = myproc()->sz;
    802031ec:	fffff097          	auipc	ra,0xfffff
    802031f0:	930080e7          	jalr	-1744(ra) # 80201b1c <myproc>
    802031f4:	4524                	lw	s1,72(a0)
  if(growproc(n) < 0)
    802031f6:	fdc42503          	lw	a0,-36(s0)
    802031fa:	fffff097          	auipc	ra,0xfffff
    802031fe:	cb4080e7          	jalr	-844(ra) # 80201eae <growproc>
    80203202:	00054863          	bltz	a0,80203212 <sys_sbrk+0x46>
    return -1;
  return addr;
    80203206:	8526                	mv	a0,s1
}
    80203208:	70a2                	ld	ra,40(sp)
    8020320a:	7402                	ld	s0,32(sp)
    8020320c:	64e2                	ld	s1,24(sp)
    8020320e:	6145                	addi	sp,sp,48
    80203210:	8082                	ret
    return -1;
    80203212:	557d                	li	a0,-1
    80203214:	bfd5                	j	80203208 <sys_sbrk+0x3c>

0000000080203216 <sys_sleep>:

uint64
sys_sleep(void)
{
    80203216:	7139                	addi	sp,sp,-64
    80203218:	fc06                	sd	ra,56(sp)
    8020321a:	f822                	sd	s0,48(sp)
    8020321c:	f426                	sd	s1,40(sp)
    8020321e:	f04a                	sd	s2,32(sp)
    80203220:	ec4e                	sd	s3,24(sp)
    80203222:	0080                	addi	s0,sp,64
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    80203224:	fcc40593          	addi	a1,s0,-52
    80203228:	4501                	li	a0,0
    8020322a:	00000097          	auipc	ra,0x0
    8020322e:	c84080e7          	jalr	-892(ra) # 80202eae <argint>
    return -1;
    80203232:	57fd                	li	a5,-1
  if(argint(0, &n) < 0)
    80203234:	06054563          	bltz	a0,8020329e <sys_sleep+0x88>
  acquire(&tickslock);
    80203238:	000b2517          	auipc	a0,0xb2
    8020323c:	36050513          	addi	a0,a0,864 # 802b5598 <tickslock>
    80203240:	ffffd097          	auipc	ra,0xffffd
    80203244:	4b4080e7          	jalr	1204(ra) # 802006f4 <acquire>
  ticks0 = ticks;
    80203248:	000b2917          	auipc	s2,0xb2
    8020324c:	36892903          	lw	s2,872(s2) # 802b55b0 <ticks>
  while(ticks - ticks0 < n){
    80203250:	fcc42783          	lw	a5,-52(s0)
    80203254:	cf85                	beqz	a5,8020328c <sys_sleep+0x76>
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
    80203256:	000b2997          	auipc	s3,0xb2
    8020325a:	34298993          	addi	s3,s3,834 # 802b5598 <tickslock>
    8020325e:	000b2497          	auipc	s1,0xb2
    80203262:	35248493          	addi	s1,s1,850 # 802b55b0 <ticks>
    if(myproc()->killed){
    80203266:	fffff097          	auipc	ra,0xfffff
    8020326a:	8b6080e7          	jalr	-1866(ra) # 80201b1c <myproc>
    8020326e:	591c                	lw	a5,48(a0)
    80203270:	ef9d                	bnez	a5,802032ae <sys_sleep+0x98>
    sleep(&ticks, &tickslock);
    80203272:	85ce                	mv	a1,s3
    80203274:	8526                	mv	a0,s1
    80203276:	fffff097          	auipc	ra,0xfffff
    8020327a:	120080e7          	jalr	288(ra) # 80202396 <sleep>
  while(ticks - ticks0 < n){
    8020327e:	409c                	lw	a5,0(s1)
    80203280:	412787bb          	subw	a5,a5,s2
    80203284:	fcc42703          	lw	a4,-52(s0)
    80203288:	fce7efe3          	bltu	a5,a4,80203266 <sys_sleep+0x50>
  }
  release(&tickslock);
    8020328c:	000b2517          	auipc	a0,0xb2
    80203290:	30c50513          	addi	a0,a0,780 # 802b5598 <tickslock>
    80203294:	ffffd097          	auipc	ra,0xffffd
    80203298:	4b4080e7          	jalr	1204(ra) # 80200748 <release>
  return 0;
    8020329c:	4781                	li	a5,0
}
    8020329e:	853e                	mv	a0,a5
    802032a0:	70e2                	ld	ra,56(sp)
    802032a2:	7442                	ld	s0,48(sp)
    802032a4:	74a2                	ld	s1,40(sp)
    802032a6:	7902                	ld	s2,32(sp)
    802032a8:	69e2                	ld	s3,24(sp)
    802032aa:	6121                	addi	sp,sp,64
    802032ac:	8082                	ret
      release(&tickslock);
    802032ae:	000b2517          	auipc	a0,0xb2
    802032b2:	2ea50513          	addi	a0,a0,746 # 802b5598 <tickslock>
    802032b6:	ffffd097          	auipc	ra,0xffffd
    802032ba:	492080e7          	jalr	1170(ra) # 80200748 <release>
      return -1;
    802032be:	57fd                	li	a5,-1
    802032c0:	bff9                	j	8020329e <sys_sleep+0x88>

00000000802032c2 <sys_kill>:

uint64
sys_kill(void)
{
    802032c2:	1101                	addi	sp,sp,-32
    802032c4:	ec06                	sd	ra,24(sp)
    802032c6:	e822                	sd	s0,16(sp)
    802032c8:	1000                	addi	s0,sp,32
  int pid;

  if(argint(0, &pid) < 0)
    802032ca:	fec40593          	addi	a1,s0,-20
    802032ce:	4501                	li	a0,0
    802032d0:	00000097          	auipc	ra,0x0
    802032d4:	bde080e7          	jalr	-1058(ra) # 80202eae <argint>
    802032d8:	87aa                	mv	a5,a0
    return -1;
    802032da:	557d                	li	a0,-1
  if(argint(0, &pid) < 0)
    802032dc:	0007c863          	bltz	a5,802032ec <sys_kill+0x2a>
  return kill(pid);
    802032e0:	fec42503          	lw	a0,-20(s0)
    802032e4:	fffff097          	auipc	ra,0xfffff
    802032e8:	29e080e7          	jalr	670(ra) # 80202582 <kill>
}
    802032ec:	60e2                	ld	ra,24(sp)
    802032ee:	6442                	ld	s0,16(sp)
    802032f0:	6105                	addi	sp,sp,32
    802032f2:	8082                	ret

00000000802032f4 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
    802032f4:	1101                	addi	sp,sp,-32
    802032f6:	ec06                	sd	ra,24(sp)
    802032f8:	e822                	sd	s0,16(sp)
    802032fa:	e426                	sd	s1,8(sp)
    802032fc:	1000                	addi	s0,sp,32
  uint xticks;

  acquire(&tickslock);
    802032fe:	000b2517          	auipc	a0,0xb2
    80203302:	29a50513          	addi	a0,a0,666 # 802b5598 <tickslock>
    80203306:	ffffd097          	auipc	ra,0xffffd
    8020330a:	3ee080e7          	jalr	1006(ra) # 802006f4 <acquire>
  xticks = ticks;
    8020330e:	000b2497          	auipc	s1,0xb2
    80203312:	2a24a483          	lw	s1,674(s1) # 802b55b0 <ticks>
  release(&tickslock);
    80203316:	000b2517          	auipc	a0,0xb2
    8020331a:	28250513          	addi	a0,a0,642 # 802b5598 <tickslock>
    8020331e:	ffffd097          	auipc	ra,0xffffd
    80203322:	42a080e7          	jalr	1066(ra) # 80200748 <release>
  return xticks;
}
    80203326:	02049513          	slli	a0,s1,0x20
    8020332a:	9101                	srli	a0,a0,0x20
    8020332c:	60e2                	ld	ra,24(sp)
    8020332e:	6442                	ld	s0,16(sp)
    80203330:	64a2                	ld	s1,8(sp)
    80203332:	6105                	addi	sp,sp,32
    80203334:	8082                	ret

0000000080203336 <sys_trace>:

uint64
sys_trace(void)
{
    80203336:	1101                	addi	sp,sp,-32
    80203338:	ec06                	sd	ra,24(sp)
    8020333a:	e822                	sd	s0,16(sp)
    8020333c:	1000                	addi	s0,sp,32
  int mask;
  if(argint(0, &mask) < 0) {
    8020333e:	fec40593          	addi	a1,s0,-20
    80203342:	4501                	li	a0,0
    80203344:	00000097          	auipc	ra,0x0
    80203348:	b6a080e7          	jalr	-1174(ra) # 80202eae <argint>
    return -1;
    8020334c:	57fd                	li	a5,-1
  if(argint(0, &mask) < 0) {
    8020334e:	00054b63          	bltz	a0,80203364 <sys_trace+0x2e>
  }
  myproc()->tmask = mask;
    80203352:	ffffe097          	auipc	ra,0xffffe
    80203356:	7ca080e7          	jalr	1994(ra) # 80201b1c <myproc>
    8020335a:	fec42783          	lw	a5,-20(s0)
    8020335e:	16f52823          	sw	a5,368(a0)
  return 0;
    80203362:	4781                	li	a5,0
    80203364:	853e                	mv	a0,a5
    80203366:	60e2                	ld	ra,24(sp)
    80203368:	6442                	ld	s0,16(sp)
    8020336a:	6105                	addi	sp,sp,32
    8020336c:	8082                	ret

000000008020336e <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
    8020336e:	7139                	addi	sp,sp,-64
    80203370:	fc06                	sd	ra,56(sp)
    80203372:	f822                	sd	s0,48(sp)
    80203374:	f426                	sd	s1,40(sp)
    80203376:	f04a                	sd	s2,32(sp)
    80203378:	ec4e                	sd	s3,24(sp)
    8020337a:	e852                	sd	s4,16(sp)
    8020337c:	e456                	sd	s5,8(sp)
    8020337e:	0080                	addi	s0,sp,64
  struct buf *b;

  initlock(&bcache.lock, "bcache");
    80203380:	00007597          	auipc	a1,0x7
    80203384:	99058593          	addi	a1,a1,-1648 # 80209d10 <sysnames+0xd8>
    80203388:	000ad517          	auipc	a0,0xad
    8020338c:	8f850513          	addi	a0,a0,-1800 # 802afc80 <bcache>
    80203390:	ffffd097          	auipc	ra,0xffffd
    80203394:	320080e7          	jalr	800(ra) # 802006b0 <initlock>

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
    80203398:	000b1797          	auipc	a5,0xb1
    8020339c:	8e878793          	addi	a5,a5,-1816 # 802b3c80 <bcache+0x4000>
    802033a0:	000b1717          	auipc	a4,0xb1
    802033a4:	f4870713          	addi	a4,a4,-184 # 802b42e8 <bcache+0x4668>
    802033a8:	6ae7b823          	sd	a4,1712(a5)
  bcache.head.next = &bcache.head;
    802033ac:	6ae7bc23          	sd	a4,1720(a5)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    802033b0:	000ad497          	auipc	s1,0xad
    802033b4:	8e848493          	addi	s1,s1,-1816 # 802afc98 <bcache+0x18>
    b->refcnt = 0;
    b->sectorno = ~0;
    802033b8:	5a7d                	li	s4,-1
    b->dev = ~0;
    b->next = bcache.head.next;
    802033ba:	893e                	mv	s2,a5
    b->prev = &bcache.head;
    802033bc:	89ba                	mv	s3,a4
    initsleeplock(&b->lock, "buffer");
    802033be:	00007a97          	auipc	s5,0x7
    802033c2:	95aa8a93          	addi	s5,s5,-1702 # 80209d18 <sysnames+0xe0>
    b->refcnt = 0;
    802033c6:	0404a023          	sw	zero,64(s1)
    b->sectorno = ~0;
    802033ca:	0144a623          	sw	s4,12(s1)
    b->dev = ~0;
    802033ce:	0144a423          	sw	s4,8(s1)
    b->next = bcache.head.next;
    802033d2:	6b893783          	ld	a5,1720(s2)
    802033d6:	e8bc                	sd	a5,80(s1)
    b->prev = &bcache.head;
    802033d8:	0534b423          	sd	s3,72(s1)
    initsleeplock(&b->lock, "buffer");
    802033dc:	85d6                	mv	a1,s5
    802033de:	01048513          	addi	a0,s1,16
    802033e2:	00000097          	auipc	ra,0x0
    802033e6:	27e080e7          	jalr	638(ra) # 80203660 <initsleeplock>
    bcache.head.next->prev = b;
    802033ea:	6b893783          	ld	a5,1720(s2)
    802033ee:	e7a4                	sd	s1,72(a5)
    bcache.head.next = b;
    802033f0:	6a993c23          	sd	s1,1720(s2)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    802033f4:	25848493          	addi	s1,s1,600
    802033f8:	fd3497e3          	bne	s1,s3,802033c6 <binit+0x58>
  }
  #ifdef DEBUG
  printf("binit\n");
    802033fc:	00007517          	auipc	a0,0x7
    80203400:	92450513          	addi	a0,a0,-1756 # 80209d20 <sysnames+0xe8>
    80203404:	ffffd097          	auipc	ra,0xffffd
    80203408:	d8a080e7          	jalr	-630(ra) # 8020018e <printf>
  #endif
}
    8020340c:	70e2                	ld	ra,56(sp)
    8020340e:	7442                	ld	s0,48(sp)
    80203410:	74a2                	ld	s1,40(sp)
    80203412:	7902                	ld	s2,32(sp)
    80203414:	69e2                	ld	s3,24(sp)
    80203416:	6a42                	ld	s4,16(sp)
    80203418:	6aa2                	ld	s5,8(sp)
    8020341a:	6121                	addi	sp,sp,64
    8020341c:	8082                	ret

000000008020341e <bread>:
  panic("bget: no buffers");
}

// Return a locked buf with the contents of the indicated block.
struct buf* 
bread(uint dev, uint sectorno) {
    8020341e:	7179                	addi	sp,sp,-48
    80203420:	f406                	sd	ra,40(sp)
    80203422:	f022                	sd	s0,32(sp)
    80203424:	ec26                	sd	s1,24(sp)
    80203426:	e84a                	sd	s2,16(sp)
    80203428:	e44e                	sd	s3,8(sp)
    8020342a:	1800                	addi	s0,sp,48
    8020342c:	89aa                	mv	s3,a0
    8020342e:	892e                	mv	s2,a1
  acquire(&bcache.lock);
    80203430:	000ad517          	auipc	a0,0xad
    80203434:	85050513          	addi	a0,a0,-1968 # 802afc80 <bcache>
    80203438:	ffffd097          	auipc	ra,0xffffd
    8020343c:	2bc080e7          	jalr	700(ra) # 802006f4 <acquire>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    80203440:	000b1497          	auipc	s1,0xb1
    80203444:	ef84b483          	ld	s1,-264(s1) # 802b4338 <bcache+0x46b8>
    80203448:	000b1797          	auipc	a5,0xb1
    8020344c:	ea078793          	addi	a5,a5,-352 # 802b42e8 <bcache+0x4668>
    80203450:	02f48f63          	beq	s1,a5,8020348e <bread+0x70>
    80203454:	873e                	mv	a4,a5
    80203456:	a021                	j	8020345e <bread+0x40>
    80203458:	68a4                	ld	s1,80(s1)
    8020345a:	02e48a63          	beq	s1,a4,8020348e <bread+0x70>
    if(b->dev == dev && b->sectorno == sectorno){
    8020345e:	449c                	lw	a5,8(s1)
    80203460:	ff379ce3          	bne	a5,s3,80203458 <bread+0x3a>
    80203464:	44dc                	lw	a5,12(s1)
    80203466:	ff2799e3          	bne	a5,s2,80203458 <bread+0x3a>
      b->refcnt++;
    8020346a:	40bc                	lw	a5,64(s1)
    8020346c:	2785                	addiw	a5,a5,1
    8020346e:	c0bc                	sw	a5,64(s1)
      release(&bcache.lock);
    80203470:	000ad517          	auipc	a0,0xad
    80203474:	81050513          	addi	a0,a0,-2032 # 802afc80 <bcache>
    80203478:	ffffd097          	auipc	ra,0xffffd
    8020347c:	2d0080e7          	jalr	720(ra) # 80200748 <release>
      acquiresleep(&b->lock);
    80203480:	01048513          	addi	a0,s1,16
    80203484:	00000097          	auipc	ra,0x0
    80203488:	216080e7          	jalr	534(ra) # 8020369a <acquiresleep>
      return b;
    8020348c:	a8b9                	j	802034ea <bread+0xcc>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    8020348e:	000b1497          	auipc	s1,0xb1
    80203492:	ea24b483          	ld	s1,-350(s1) # 802b4330 <bcache+0x46b0>
    80203496:	000b1797          	auipc	a5,0xb1
    8020349a:	e5278793          	addi	a5,a5,-430 # 802b42e8 <bcache+0x4668>
    8020349e:	00f48863          	beq	s1,a5,802034ae <bread+0x90>
    802034a2:	873e                	mv	a4,a5
    if(b->refcnt == 0) {
    802034a4:	40bc                	lw	a5,64(s1)
    802034a6:	cf81                	beqz	a5,802034be <bread+0xa0>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    802034a8:	64a4                	ld	s1,72(s1)
    802034aa:	fee49de3          	bne	s1,a4,802034a4 <bread+0x86>
  panic("bget: no buffers");
    802034ae:	00007517          	auipc	a0,0x7
    802034b2:	87a50513          	addi	a0,a0,-1926 # 80209d28 <sysnames+0xf0>
    802034b6:	ffffd097          	auipc	ra,0xffffd
    802034ba:	c8e080e7          	jalr	-882(ra) # 80200144 <panic>
      b->dev = dev;
    802034be:	0134a423          	sw	s3,8(s1)
      b->sectorno = sectorno;
    802034c2:	0124a623          	sw	s2,12(s1)
      b->valid = 0;
    802034c6:	0004a023          	sw	zero,0(s1)
      b->refcnt = 1;
    802034ca:	4785                	li	a5,1
    802034cc:	c0bc                	sw	a5,64(s1)
      release(&bcache.lock);
    802034ce:	000ac517          	auipc	a0,0xac
    802034d2:	7b250513          	addi	a0,a0,1970 # 802afc80 <bcache>
    802034d6:	ffffd097          	auipc	ra,0xffffd
    802034da:	272080e7          	jalr	626(ra) # 80200748 <release>
      acquiresleep(&b->lock);
    802034de:	01048513          	addi	a0,s1,16
    802034e2:	00000097          	auipc	ra,0x0
    802034e6:	1b8080e7          	jalr	440(ra) # 8020369a <acquiresleep>
  struct buf *b;

  b = bget(dev, sectorno);
  if (!b->valid) {
    802034ea:	409c                	lw	a5,0(s1)
    802034ec:	cb89                	beqz	a5,802034fe <bread+0xe0>
    disk_read(b);
    b->valid = 1;
  }

  return b;
}
    802034ee:	8526                	mv	a0,s1
    802034f0:	70a2                	ld	ra,40(sp)
    802034f2:	7402                	ld	s0,32(sp)
    802034f4:	64e2                	ld	s1,24(sp)
    802034f6:	6942                	ld	s2,16(sp)
    802034f8:	69a2                	ld	s3,8(sp)
    802034fa:	6145                	addi	sp,sp,48
    802034fc:	8082                	ret
    disk_read(b);
    802034fe:	8526                	mv	a0,s1
    80203500:	00002097          	auipc	ra,0x2
    80203504:	134080e7          	jalr	308(ra) # 80205634 <disk_read>
    b->valid = 1;
    80203508:	4785                	li	a5,1
    8020350a:	c09c                	sw	a5,0(s1)
  return b;
    8020350c:	b7cd                	j	802034ee <bread+0xd0>

000000008020350e <bwrite>:

// Write b's contents to disk.  Must be locked.
void 
bwrite(struct buf *b) {
    8020350e:	1101                	addi	sp,sp,-32
    80203510:	ec06                	sd	ra,24(sp)
    80203512:	e822                	sd	s0,16(sp)
    80203514:	e426                	sd	s1,8(sp)
    80203516:	1000                	addi	s0,sp,32
    80203518:	84aa                	mv	s1,a0
  if(!holdingsleep(&b->lock))
    8020351a:	0541                	addi	a0,a0,16
    8020351c:	00000097          	auipc	ra,0x0
    80203520:	218080e7          	jalr	536(ra) # 80203734 <holdingsleep>
    80203524:	c919                	beqz	a0,8020353a <bwrite+0x2c>
    panic("bwrite");
  disk_write(b);
    80203526:	8526                	mv	a0,s1
    80203528:	00002097          	auipc	ra,0x2
    8020352c:	126080e7          	jalr	294(ra) # 8020564e <disk_write>
}
    80203530:	60e2                	ld	ra,24(sp)
    80203532:	6442                	ld	s0,16(sp)
    80203534:	64a2                	ld	s1,8(sp)
    80203536:	6105                	addi	sp,sp,32
    80203538:	8082                	ret
    panic("bwrite");
    8020353a:	00007517          	auipc	a0,0x7
    8020353e:	80650513          	addi	a0,a0,-2042 # 80209d40 <sysnames+0x108>
    80203542:	ffffd097          	auipc	ra,0xffffd
    80203546:	c02080e7          	jalr	-1022(ra) # 80200144 <panic>

000000008020354a <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
    8020354a:	1101                	addi	sp,sp,-32
    8020354c:	ec06                	sd	ra,24(sp)
    8020354e:	e822                	sd	s0,16(sp)
    80203550:	e426                	sd	s1,8(sp)
    80203552:	e04a                	sd	s2,0(sp)
    80203554:	1000                	addi	s0,sp,32
    80203556:	84aa                	mv	s1,a0
  if(!holdingsleep(&b->lock))
    80203558:	01050913          	addi	s2,a0,16
    8020355c:	854a                	mv	a0,s2
    8020355e:	00000097          	auipc	ra,0x0
    80203562:	1d6080e7          	jalr	470(ra) # 80203734 <holdingsleep>
    80203566:	c92d                	beqz	a0,802035d8 <brelse+0x8e>
    panic("brelse");

  releasesleep(&b->lock);
    80203568:	854a                	mv	a0,s2
    8020356a:	00000097          	auipc	ra,0x0
    8020356e:	186080e7          	jalr	390(ra) # 802036f0 <releasesleep>

  acquire(&bcache.lock);
    80203572:	000ac517          	auipc	a0,0xac
    80203576:	70e50513          	addi	a0,a0,1806 # 802afc80 <bcache>
    8020357a:	ffffd097          	auipc	ra,0xffffd
    8020357e:	17a080e7          	jalr	378(ra) # 802006f4 <acquire>
  b->refcnt--;
    80203582:	40bc                	lw	a5,64(s1)
    80203584:	37fd                	addiw	a5,a5,-1
    80203586:	0007871b          	sext.w	a4,a5
    8020358a:	c0bc                	sw	a5,64(s1)
  if (b->refcnt == 0) {
    8020358c:	eb05                	bnez	a4,802035bc <brelse+0x72>
    // no one is waiting for it.
    b->next->prev = b->prev;
    8020358e:	68bc                	ld	a5,80(s1)
    80203590:	64b8                	ld	a4,72(s1)
    80203592:	e7b8                	sd	a4,72(a5)
    b->prev->next = b->next;
    80203594:	64bc                	ld	a5,72(s1)
    80203596:	68b8                	ld	a4,80(s1)
    80203598:	ebb8                	sd	a4,80(a5)
    b->next = bcache.head.next;
    8020359a:	000b0797          	auipc	a5,0xb0
    8020359e:	6e678793          	addi	a5,a5,1766 # 802b3c80 <bcache+0x4000>
    802035a2:	6b87b703          	ld	a4,1720(a5)
    802035a6:	e8b8                	sd	a4,80(s1)
    b->prev = &bcache.head;
    802035a8:	000b1717          	auipc	a4,0xb1
    802035ac:	d4070713          	addi	a4,a4,-704 # 802b42e8 <bcache+0x4668>
    802035b0:	e4b8                	sd	a4,72(s1)
    bcache.head.next->prev = b;
    802035b2:	6b87b703          	ld	a4,1720(a5)
    802035b6:	e724                	sd	s1,72(a4)
    bcache.head.next = b;
    802035b8:	6a97bc23          	sd	s1,1720(a5)
  }
  
  release(&bcache.lock);
    802035bc:	000ac517          	auipc	a0,0xac
    802035c0:	6c450513          	addi	a0,a0,1732 # 802afc80 <bcache>
    802035c4:	ffffd097          	auipc	ra,0xffffd
    802035c8:	184080e7          	jalr	388(ra) # 80200748 <release>
}
    802035cc:	60e2                	ld	ra,24(sp)
    802035ce:	6442                	ld	s0,16(sp)
    802035d0:	64a2                	ld	s1,8(sp)
    802035d2:	6902                	ld	s2,0(sp)
    802035d4:	6105                	addi	sp,sp,32
    802035d6:	8082                	ret
    panic("brelse");
    802035d8:	00006517          	auipc	a0,0x6
    802035dc:	77050513          	addi	a0,a0,1904 # 80209d48 <sysnames+0x110>
    802035e0:	ffffd097          	auipc	ra,0xffffd
    802035e4:	b64080e7          	jalr	-1180(ra) # 80200144 <panic>

00000000802035e8 <bpin>:

void
bpin(struct buf *b) {
    802035e8:	1101                	addi	sp,sp,-32
    802035ea:	ec06                	sd	ra,24(sp)
    802035ec:	e822                	sd	s0,16(sp)
    802035ee:	e426                	sd	s1,8(sp)
    802035f0:	1000                	addi	s0,sp,32
    802035f2:	84aa                	mv	s1,a0
  acquire(&bcache.lock);
    802035f4:	000ac517          	auipc	a0,0xac
    802035f8:	68c50513          	addi	a0,a0,1676 # 802afc80 <bcache>
    802035fc:	ffffd097          	auipc	ra,0xffffd
    80203600:	0f8080e7          	jalr	248(ra) # 802006f4 <acquire>
  b->refcnt++;
    80203604:	40bc                	lw	a5,64(s1)
    80203606:	2785                	addiw	a5,a5,1
    80203608:	c0bc                	sw	a5,64(s1)
  release(&bcache.lock);
    8020360a:	000ac517          	auipc	a0,0xac
    8020360e:	67650513          	addi	a0,a0,1654 # 802afc80 <bcache>
    80203612:	ffffd097          	auipc	ra,0xffffd
    80203616:	136080e7          	jalr	310(ra) # 80200748 <release>
}
    8020361a:	60e2                	ld	ra,24(sp)
    8020361c:	6442                	ld	s0,16(sp)
    8020361e:	64a2                	ld	s1,8(sp)
    80203620:	6105                	addi	sp,sp,32
    80203622:	8082                	ret

0000000080203624 <bunpin>:

void
bunpin(struct buf *b) {
    80203624:	1101                	addi	sp,sp,-32
    80203626:	ec06                	sd	ra,24(sp)
    80203628:	e822                	sd	s0,16(sp)
    8020362a:	e426                	sd	s1,8(sp)
    8020362c:	1000                	addi	s0,sp,32
    8020362e:	84aa                	mv	s1,a0
  acquire(&bcache.lock);
    80203630:	000ac517          	auipc	a0,0xac
    80203634:	65050513          	addi	a0,a0,1616 # 802afc80 <bcache>
    80203638:	ffffd097          	auipc	ra,0xffffd
    8020363c:	0bc080e7          	jalr	188(ra) # 802006f4 <acquire>
  b->refcnt--;
    80203640:	40bc                	lw	a5,64(s1)
    80203642:	37fd                	addiw	a5,a5,-1
    80203644:	c0bc                	sw	a5,64(s1)
  release(&bcache.lock);
    80203646:	000ac517          	auipc	a0,0xac
    8020364a:	63a50513          	addi	a0,a0,1594 # 802afc80 <bcache>
    8020364e:	ffffd097          	auipc	ra,0xffffd
    80203652:	0fa080e7          	jalr	250(ra) # 80200748 <release>
}
    80203656:	60e2                	ld	ra,24(sp)
    80203658:	6442                	ld	s0,16(sp)
    8020365a:	64a2                	ld	s1,8(sp)
    8020365c:	6105                	addi	sp,sp,32
    8020365e:	8082                	ret

0000000080203660 <initsleeplock>:
#include "include/proc.h"
#include "include/sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
    80203660:	1101                	addi	sp,sp,-32
    80203662:	ec06                	sd	ra,24(sp)
    80203664:	e822                	sd	s0,16(sp)
    80203666:	e426                	sd	s1,8(sp)
    80203668:	e04a                	sd	s2,0(sp)
    8020366a:	1000                	addi	s0,sp,32
    8020366c:	84aa                	mv	s1,a0
    8020366e:	892e                	mv	s2,a1
  initlock(&lk->lk, "sleep lock");
    80203670:	00006597          	auipc	a1,0x6
    80203674:	6e058593          	addi	a1,a1,1760 # 80209d50 <sysnames+0x118>
    80203678:	0521                	addi	a0,a0,8
    8020367a:	ffffd097          	auipc	ra,0xffffd
    8020367e:	036080e7          	jalr	54(ra) # 802006b0 <initlock>
  lk->name = name;
    80203682:	0324b023          	sd	s2,32(s1)
  lk->locked = 0;
    80203686:	0004a023          	sw	zero,0(s1)
  lk->pid = 0;
    8020368a:	0204a423          	sw	zero,40(s1)
}
    8020368e:	60e2                	ld	ra,24(sp)
    80203690:	6442                	ld	s0,16(sp)
    80203692:	64a2                	ld	s1,8(sp)
    80203694:	6902                	ld	s2,0(sp)
    80203696:	6105                	addi	sp,sp,32
    80203698:	8082                	ret

000000008020369a <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
    8020369a:	1101                	addi	sp,sp,-32
    8020369c:	ec06                	sd	ra,24(sp)
    8020369e:	e822                	sd	s0,16(sp)
    802036a0:	e426                	sd	s1,8(sp)
    802036a2:	e04a                	sd	s2,0(sp)
    802036a4:	1000                	addi	s0,sp,32
    802036a6:	84aa                	mv	s1,a0
  acquire(&lk->lk);
    802036a8:	00850913          	addi	s2,a0,8
    802036ac:	854a                	mv	a0,s2
    802036ae:	ffffd097          	auipc	ra,0xffffd
    802036b2:	046080e7          	jalr	70(ra) # 802006f4 <acquire>
  while (lk->locked) {
    802036b6:	409c                	lw	a5,0(s1)
    802036b8:	cb89                	beqz	a5,802036ca <acquiresleep+0x30>
    sleep(lk, &lk->lk);
    802036ba:	85ca                	mv	a1,s2
    802036bc:	8526                	mv	a0,s1
    802036be:	fffff097          	auipc	ra,0xfffff
    802036c2:	cd8080e7          	jalr	-808(ra) # 80202396 <sleep>
  while (lk->locked) {
    802036c6:	409c                	lw	a5,0(s1)
    802036c8:	fbed                	bnez	a5,802036ba <acquiresleep+0x20>
  }
  lk->locked = 1;
    802036ca:	4785                	li	a5,1
    802036cc:	c09c                	sw	a5,0(s1)
  lk->pid = myproc()->pid;
    802036ce:	ffffe097          	auipc	ra,0xffffe
    802036d2:	44e080e7          	jalr	1102(ra) # 80201b1c <myproc>
    802036d6:	5d1c                	lw	a5,56(a0)
    802036d8:	d49c                	sw	a5,40(s1)
  release(&lk->lk);
    802036da:	854a                	mv	a0,s2
    802036dc:	ffffd097          	auipc	ra,0xffffd
    802036e0:	06c080e7          	jalr	108(ra) # 80200748 <release>
}
    802036e4:	60e2                	ld	ra,24(sp)
    802036e6:	6442                	ld	s0,16(sp)
    802036e8:	64a2                	ld	s1,8(sp)
    802036ea:	6902                	ld	s2,0(sp)
    802036ec:	6105                	addi	sp,sp,32
    802036ee:	8082                	ret

00000000802036f0 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
    802036f0:	1101                	addi	sp,sp,-32
    802036f2:	ec06                	sd	ra,24(sp)
    802036f4:	e822                	sd	s0,16(sp)
    802036f6:	e426                	sd	s1,8(sp)
    802036f8:	e04a                	sd	s2,0(sp)
    802036fa:	1000                	addi	s0,sp,32
    802036fc:	84aa                	mv	s1,a0
  acquire(&lk->lk);
    802036fe:	00850913          	addi	s2,a0,8
    80203702:	854a                	mv	a0,s2
    80203704:	ffffd097          	auipc	ra,0xffffd
    80203708:	ff0080e7          	jalr	-16(ra) # 802006f4 <acquire>
  lk->locked = 0;
    8020370c:	0004a023          	sw	zero,0(s1)
  lk->pid = 0;
    80203710:	0204a423          	sw	zero,40(s1)
  wakeup(lk);
    80203714:	8526                	mv	a0,s1
    80203716:	fffff097          	auipc	ra,0xfffff
    8020371a:	e02080e7          	jalr	-510(ra) # 80202518 <wakeup>
  release(&lk->lk);
    8020371e:	854a                	mv	a0,s2
    80203720:	ffffd097          	auipc	ra,0xffffd
    80203724:	028080e7          	jalr	40(ra) # 80200748 <release>
}
    80203728:	60e2                	ld	ra,24(sp)
    8020372a:	6442                	ld	s0,16(sp)
    8020372c:	64a2                	ld	s1,8(sp)
    8020372e:	6902                	ld	s2,0(sp)
    80203730:	6105                	addi	sp,sp,32
    80203732:	8082                	ret

0000000080203734 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
    80203734:	7179                	addi	sp,sp,-48
    80203736:	f406                	sd	ra,40(sp)
    80203738:	f022                	sd	s0,32(sp)
    8020373a:	ec26                	sd	s1,24(sp)
    8020373c:	e84a                	sd	s2,16(sp)
    8020373e:	e44e                	sd	s3,8(sp)
    80203740:	1800                	addi	s0,sp,48
    80203742:	84aa                	mv	s1,a0
  int r;
  
  acquire(&lk->lk);
    80203744:	00850913          	addi	s2,a0,8
    80203748:	854a                	mv	a0,s2
    8020374a:	ffffd097          	auipc	ra,0xffffd
    8020374e:	faa080e7          	jalr	-86(ra) # 802006f4 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
    80203752:	409c                	lw	a5,0(s1)
    80203754:	ef99                	bnez	a5,80203772 <holdingsleep+0x3e>
    80203756:	4481                	li	s1,0
  release(&lk->lk);
    80203758:	854a                	mv	a0,s2
    8020375a:	ffffd097          	auipc	ra,0xffffd
    8020375e:	fee080e7          	jalr	-18(ra) # 80200748 <release>
  return r;
}
    80203762:	8526                	mv	a0,s1
    80203764:	70a2                	ld	ra,40(sp)
    80203766:	7402                	ld	s0,32(sp)
    80203768:	64e2                	ld	s1,24(sp)
    8020376a:	6942                	ld	s2,16(sp)
    8020376c:	69a2                	ld	s3,8(sp)
    8020376e:	6145                	addi	sp,sp,48
    80203770:	8082                	ret
  r = lk->locked && (lk->pid == myproc()->pid);
    80203772:	0284a983          	lw	s3,40(s1)
    80203776:	ffffe097          	auipc	ra,0xffffe
    8020377a:	3a6080e7          	jalr	934(ra) # 80201b1c <myproc>
    8020377e:	5d04                	lw	s1,56(a0)
    80203780:	413484b3          	sub	s1,s1,s3
    80203784:	0014b493          	seqz	s1,s1
    80203788:	bfc1                	j	80203758 <holdingsleep+0x24>

000000008020378a <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
    8020378a:	1101                	addi	sp,sp,-32
    8020378c:	ec06                	sd	ra,24(sp)
    8020378e:	e822                	sd	s0,16(sp)
    80203790:	e426                	sd	s1,8(sp)
    80203792:	e04a                	sd	s2,0(sp)
    80203794:	1000                	addi	s0,sp,32
  initlock(&ftable.lock, "ftable");
    80203796:	00006597          	auipc	a1,0x6
    8020379a:	5ca58593          	addi	a1,a1,1482 # 80209d60 <sysnames+0x128>
    8020379e:	000b1517          	auipc	a0,0xb1
    802037a2:	e4250513          	addi	a0,a0,-446 # 802b45e0 <ftable>
    802037a6:	ffffd097          	auipc	ra,0xffffd
    802037aa:	f0a080e7          	jalr	-246(ra) # 802006b0 <initlock>
  struct file *f;
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    802037ae:	000b1497          	auipc	s1,0xb1
    802037b2:	e4a48493          	addi	s1,s1,-438 # 802b45f8 <ftable+0x18>
    802037b6:	000b2917          	auipc	s2,0xb2
    802037ba:	de290913          	addi	s2,s2,-542 # 802b5598 <tickslock>
    memset(f, 0, sizeof(struct file));
    802037be:	02800613          	li	a2,40
    802037c2:	4581                	li	a1,0
    802037c4:	8526                	mv	a0,s1
    802037c6:	ffffd097          	auipc	ra,0xffffd
    802037ca:	fca080e7          	jalr	-54(ra) # 80200790 <memset>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    802037ce:	02848493          	addi	s1,s1,40
    802037d2:	ff2496e3          	bne	s1,s2,802037be <fileinit+0x34>
  }
  #ifdef DEBUG
  printf("fileinit\n");
    802037d6:	00006517          	auipc	a0,0x6
    802037da:	59250513          	addi	a0,a0,1426 # 80209d68 <sysnames+0x130>
    802037de:	ffffd097          	auipc	ra,0xffffd
    802037e2:	9b0080e7          	jalr	-1616(ra) # 8020018e <printf>
  #endif
}
    802037e6:	60e2                	ld	ra,24(sp)
    802037e8:	6442                	ld	s0,16(sp)
    802037ea:	64a2                	ld	s1,8(sp)
    802037ec:	6902                	ld	s2,0(sp)
    802037ee:	6105                	addi	sp,sp,32
    802037f0:	8082                	ret

00000000802037f2 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
    802037f2:	1101                	addi	sp,sp,-32
    802037f4:	ec06                	sd	ra,24(sp)
    802037f6:	e822                	sd	s0,16(sp)
    802037f8:	e426                	sd	s1,8(sp)
    802037fa:	1000                	addi	s0,sp,32
  struct file *f;

  acquire(&ftable.lock);
    802037fc:	000b1517          	auipc	a0,0xb1
    80203800:	de450513          	addi	a0,a0,-540 # 802b45e0 <ftable>
    80203804:	ffffd097          	auipc	ra,0xffffd
    80203808:	ef0080e7          	jalr	-272(ra) # 802006f4 <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    8020380c:	000b1497          	auipc	s1,0xb1
    80203810:	dec48493          	addi	s1,s1,-532 # 802b45f8 <ftable+0x18>
    80203814:	000b2717          	auipc	a4,0xb2
    80203818:	d8470713          	addi	a4,a4,-636 # 802b5598 <tickslock>
    if(f->ref == 0){
    8020381c:	40dc                	lw	a5,4(s1)
    8020381e:	cf99                	beqz	a5,8020383c <filealloc+0x4a>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203820:	02848493          	addi	s1,s1,40
    80203824:	fee49ce3          	bne	s1,a4,8020381c <filealloc+0x2a>
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
    80203828:	000b1517          	auipc	a0,0xb1
    8020382c:	db850513          	addi	a0,a0,-584 # 802b45e0 <ftable>
    80203830:	ffffd097          	auipc	ra,0xffffd
    80203834:	f18080e7          	jalr	-232(ra) # 80200748 <release>
  return NULL;
    80203838:	4481                	li	s1,0
    8020383a:	a819                	j	80203850 <filealloc+0x5e>
      f->ref = 1;
    8020383c:	4785                	li	a5,1
    8020383e:	c0dc                	sw	a5,4(s1)
      release(&ftable.lock);
    80203840:	000b1517          	auipc	a0,0xb1
    80203844:	da050513          	addi	a0,a0,-608 # 802b45e0 <ftable>
    80203848:	ffffd097          	auipc	ra,0xffffd
    8020384c:	f00080e7          	jalr	-256(ra) # 80200748 <release>
}
    80203850:	8526                	mv	a0,s1
    80203852:	60e2                	ld	ra,24(sp)
    80203854:	6442                	ld	s0,16(sp)
    80203856:	64a2                	ld	s1,8(sp)
    80203858:	6105                	addi	sp,sp,32
    8020385a:	8082                	ret

000000008020385c <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
    8020385c:	1101                	addi	sp,sp,-32
    8020385e:	ec06                	sd	ra,24(sp)
    80203860:	e822                	sd	s0,16(sp)
    80203862:	e426                	sd	s1,8(sp)
    80203864:	1000                	addi	s0,sp,32
    80203866:	84aa                	mv	s1,a0
  acquire(&ftable.lock);
    80203868:	000b1517          	auipc	a0,0xb1
    8020386c:	d7850513          	addi	a0,a0,-648 # 802b45e0 <ftable>
    80203870:	ffffd097          	auipc	ra,0xffffd
    80203874:	e84080e7          	jalr	-380(ra) # 802006f4 <acquire>
  if(f->ref < 1)
    80203878:	40dc                	lw	a5,4(s1)
    8020387a:	02f05263          	blez	a5,8020389e <filedup+0x42>
    panic("filedup");
  f->ref++;
    8020387e:	2785                	addiw	a5,a5,1
    80203880:	c0dc                	sw	a5,4(s1)
  release(&ftable.lock);
    80203882:	000b1517          	auipc	a0,0xb1
    80203886:	d5e50513          	addi	a0,a0,-674 # 802b45e0 <ftable>
    8020388a:	ffffd097          	auipc	ra,0xffffd
    8020388e:	ebe080e7          	jalr	-322(ra) # 80200748 <release>
  return f;
}
    80203892:	8526                	mv	a0,s1
    80203894:	60e2                	ld	ra,24(sp)
    80203896:	6442                	ld	s0,16(sp)
    80203898:	64a2                	ld	s1,8(sp)
    8020389a:	6105                	addi	sp,sp,32
    8020389c:	8082                	ret
    panic("filedup");
    8020389e:	00006517          	auipc	a0,0x6
    802038a2:	4da50513          	addi	a0,a0,1242 # 80209d78 <sysnames+0x140>
    802038a6:	ffffd097          	auipc	ra,0xffffd
    802038aa:	89e080e7          	jalr	-1890(ra) # 80200144 <panic>

00000000802038ae <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
    802038ae:	7139                	addi	sp,sp,-64
    802038b0:	fc06                	sd	ra,56(sp)
    802038b2:	f822                	sd	s0,48(sp)
    802038b4:	f426                	sd	s1,40(sp)
    802038b6:	f04a                	sd	s2,32(sp)
    802038b8:	ec4e                	sd	s3,24(sp)
    802038ba:	e852                	sd	s4,16(sp)
    802038bc:	e456                	sd	s5,8(sp)
    802038be:	0080                	addi	s0,sp,64
    802038c0:	84aa                	mv	s1,a0
  struct file ff;

  acquire(&ftable.lock);
    802038c2:	000b1517          	auipc	a0,0xb1
    802038c6:	d1e50513          	addi	a0,a0,-738 # 802b45e0 <ftable>
    802038ca:	ffffd097          	auipc	ra,0xffffd
    802038ce:	e2a080e7          	jalr	-470(ra) # 802006f4 <acquire>
  if(f->ref < 1)
    802038d2:	40dc                	lw	a5,4(s1)
    802038d4:	04f05863          	blez	a5,80203924 <fileclose+0x76>
    panic("fileclose");
  if(--f->ref > 0){
    802038d8:	37fd                	addiw	a5,a5,-1
    802038da:	0007871b          	sext.w	a4,a5
    802038de:	c0dc                	sw	a5,4(s1)
    802038e0:	04e04a63          	bgtz	a4,80203934 <fileclose+0x86>
    release(&ftable.lock);
    return;
  }
  ff = *f;
    802038e4:	0004a903          	lw	s2,0(s1)
    802038e8:	0094ca03          	lbu	s4,9(s1)
    802038ec:	0104b983          	ld	s3,16(s1)
    802038f0:	0184ba83          	ld	s5,24(s1)
  f->ref = 0;
    802038f4:	0004a223          	sw	zero,4(s1)
  f->type = FD_NONE;
    802038f8:	0004a023          	sw	zero,0(s1)
  release(&ftable.lock);
    802038fc:	000b1517          	auipc	a0,0xb1
    80203900:	ce450513          	addi	a0,a0,-796 # 802b45e0 <ftable>
    80203904:	ffffd097          	auipc	ra,0xffffd
    80203908:	e44080e7          	jalr	-444(ra) # 80200748 <release>

  if(ff.type == FD_PIPE){
    8020390c:	4785                	li	a5,1
    8020390e:	04f90463          	beq	s2,a5,80203956 <fileclose+0xa8>
    pipeclose(ff.pipe, ff.writable);
  } else if(ff.type == FD_ENTRY){
    80203912:	4789                	li	a5,2
    80203914:	02f91863          	bne	s2,a5,80203944 <fileclose+0x96>
    eput(ff.ep);
    80203918:	8556                	mv	a0,s5
    8020391a:	00003097          	auipc	ra,0x3
    8020391e:	f7c080e7          	jalr	-132(ra) # 80206896 <eput>
    80203922:	a00d                	j	80203944 <fileclose+0x96>
    panic("fileclose");
    80203924:	00006517          	auipc	a0,0x6
    80203928:	45c50513          	addi	a0,a0,1116 # 80209d80 <sysnames+0x148>
    8020392c:	ffffd097          	auipc	ra,0xffffd
    80203930:	818080e7          	jalr	-2024(ra) # 80200144 <panic>
    release(&ftable.lock);
    80203934:	000b1517          	auipc	a0,0xb1
    80203938:	cac50513          	addi	a0,a0,-852 # 802b45e0 <ftable>
    8020393c:	ffffd097          	auipc	ra,0xffffd
    80203940:	e0c080e7          	jalr	-500(ra) # 80200748 <release>
  } else if (ff.type == FD_DEVICE) {

  }
}
    80203944:	70e2                	ld	ra,56(sp)
    80203946:	7442                	ld	s0,48(sp)
    80203948:	74a2                	ld	s1,40(sp)
    8020394a:	7902                	ld	s2,32(sp)
    8020394c:	69e2                	ld	s3,24(sp)
    8020394e:	6a42                	ld	s4,16(sp)
    80203950:	6aa2                	ld	s5,8(sp)
    80203952:	6121                	addi	sp,sp,64
    80203954:	8082                	ret
    pipeclose(ff.pipe, ff.writable);
    80203956:	85d2                	mv	a1,s4
    80203958:	854e                	mv	a0,s3
    8020395a:	00000097          	auipc	ra,0x0
    8020395e:	392080e7          	jalr	914(ra) # 80203cec <pipeclose>
    80203962:	b7cd                	j	80203944 <fileclose+0x96>

0000000080203964 <filestat>:
filestat(struct file *f, uint64 addr)
{
  // struct proc *p = myproc();
  struct stat st;
  
  if(f->type == FD_ENTRY){
    80203964:	4118                	lw	a4,0(a0)
    80203966:	4789                	li	a5,2
    80203968:	04f71c63          	bne	a4,a5,802039c0 <filestat+0x5c>
{
    8020396c:	711d                	addi	sp,sp,-96
    8020396e:	ec86                	sd	ra,88(sp)
    80203970:	e8a2                	sd	s0,80(sp)
    80203972:	e4a6                	sd	s1,72(sp)
    80203974:	e0ca                	sd	s2,64(sp)
    80203976:	1080                	addi	s0,sp,96
    80203978:	84aa                	mv	s1,a0
    8020397a:	892e                	mv	s2,a1
    elock(f->ep);
    8020397c:	6d08                	ld	a0,24(a0)
    8020397e:	00003097          	auipc	ra,0x3
    80203982:	e94080e7          	jalr	-364(ra) # 80206812 <elock>
    estat(f->ep, &st);
    80203986:	fa840593          	addi	a1,s0,-88
    8020398a:	6c88                	ld	a0,24(s1)
    8020398c:	00003097          	auipc	ra,0x3
    80203990:	042080e7          	jalr	66(ra) # 802069ce <estat>
    eunlock(f->ep);
    80203994:	6c88                	ld	a0,24(s1)
    80203996:	00003097          	auipc	ra,0x3
    8020399a:	eb2080e7          	jalr	-334(ra) # 80206848 <eunlock>
    // if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    8020399e:	03800613          	li	a2,56
    802039a2:	fa840593          	addi	a1,s0,-88
    802039a6:	854a                	mv	a0,s2
    802039a8:	ffffe097          	auipc	ra,0xffffe
    802039ac:	a88080e7          	jalr	-1400(ra) # 80201430 <copyout2>
    802039b0:	41f5551b          	sraiw	a0,a0,0x1f
      return -1;
    return 0;
  }
  return -1;
}
    802039b4:	60e6                	ld	ra,88(sp)
    802039b6:	6446                	ld	s0,80(sp)
    802039b8:	64a6                	ld	s1,72(sp)
    802039ba:	6906                	ld	s2,64(sp)
    802039bc:	6125                	addi	sp,sp,96
    802039be:	8082                	ret
  return -1;
    802039c0:	557d                	li	a0,-1
}
    802039c2:	8082                	ret

00000000802039c4 <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
    802039c4:	7179                	addi	sp,sp,-48
    802039c6:	f406                	sd	ra,40(sp)
    802039c8:	f022                	sd	s0,32(sp)
    802039ca:	ec26                	sd	s1,24(sp)
    802039cc:	e84a                	sd	s2,16(sp)
    802039ce:	e44e                	sd	s3,8(sp)
    802039d0:	1800                	addi	s0,sp,48
  int r = 0;

  if(f->readable == 0)
    802039d2:	00854783          	lbu	a5,8(a0)
    802039d6:	c3d5                	beqz	a5,80203a7a <fileread+0xb6>
    802039d8:	84aa                	mv	s1,a0
    802039da:	89ae                	mv	s3,a1
    802039dc:	8932                	mv	s2,a2
    return -1;

  switch (f->type) {
    802039de:	411c                	lw	a5,0(a0)
    802039e0:	4709                	li	a4,2
    802039e2:	06e78263          	beq	a5,a4,80203a46 <fileread+0x82>
    802039e6:	470d                	li	a4,3
    802039e8:	02e78b63          	beq	a5,a4,80203a1e <fileread+0x5a>
    802039ec:	4705                	li	a4,1
    802039ee:	00e78a63          	beq	a5,a4,80203a02 <fileread+0x3e>
          if((r = eread(f->ep, 1, addr, f->off, n)) > 0)
            f->off += r;
        eunlock(f->ep);
        break;
    default:
      panic("fileread");
    802039f2:	00006517          	auipc	a0,0x6
    802039f6:	39e50513          	addi	a0,a0,926 # 80209d90 <sysnames+0x158>
    802039fa:	ffffc097          	auipc	ra,0xffffc
    802039fe:	74a080e7          	jalr	1866(ra) # 80200144 <panic>
        r = piperead(f->pipe, addr, n);
    80203a02:	6908                	ld	a0,16(a0)
    80203a04:	00000097          	auipc	ra,0x0
    80203a08:	478080e7          	jalr	1144(ra) # 80203e7c <piperead>
    80203a0c:	892a                	mv	s2,a0
  }

  return r;
}
    80203a0e:	854a                	mv	a0,s2
    80203a10:	70a2                	ld	ra,40(sp)
    80203a12:	7402                	ld	s0,32(sp)
    80203a14:	64e2                	ld	s1,24(sp)
    80203a16:	6942                	ld	s2,16(sp)
    80203a18:	69a2                	ld	s3,8(sp)
    80203a1a:	6145                	addi	sp,sp,48
    80203a1c:	8082                	ret
        if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
    80203a1e:	02451783          	lh	a5,36(a0)
    80203a22:	03079693          	slli	a3,a5,0x30
    80203a26:	92c1                	srli	a3,a3,0x30
    80203a28:	4725                	li	a4,9
    80203a2a:	04d76a63          	bltu	a4,a3,80203a7e <fileread+0xba>
    80203a2e:	0792                	slli	a5,a5,0x4
    80203a30:	000b1717          	auipc	a4,0xb1
    80203a34:	b1070713          	addi	a4,a4,-1264 # 802b4540 <devsw>
    80203a38:	97ba                	add	a5,a5,a4
    80203a3a:	639c                	ld	a5,0(a5)
    80203a3c:	c3b9                	beqz	a5,80203a82 <fileread+0xbe>
        r = devsw[f->major].read(1, addr, n);
    80203a3e:	4505                	li	a0,1
    80203a40:	9782                	jalr	a5
    80203a42:	892a                	mv	s2,a0
        break;
    80203a44:	b7e9                	j	80203a0e <fileread+0x4a>
        elock(f->ep);
    80203a46:	6d08                	ld	a0,24(a0)
    80203a48:	00003097          	auipc	ra,0x3
    80203a4c:	dca080e7          	jalr	-566(ra) # 80206812 <elock>
          if((r = eread(f->ep, 1, addr, f->off, n)) > 0)
    80203a50:	874a                	mv	a4,s2
    80203a52:	5094                	lw	a3,32(s1)
    80203a54:	864e                	mv	a2,s3
    80203a56:	4585                	li	a1,1
    80203a58:	6c88                	ld	a0,24(s1)
    80203a5a:	00002097          	auipc	ra,0x2
    80203a5e:	4ee080e7          	jalr	1262(ra) # 80205f48 <eread>
    80203a62:	892a                	mv	s2,a0
    80203a64:	00a05563          	blez	a0,80203a6e <fileread+0xaa>
            f->off += r;
    80203a68:	509c                	lw	a5,32(s1)
    80203a6a:	9fa9                	addw	a5,a5,a0
    80203a6c:	d09c                	sw	a5,32(s1)
        eunlock(f->ep);
    80203a6e:	6c88                	ld	a0,24(s1)
    80203a70:	00003097          	auipc	ra,0x3
    80203a74:	dd8080e7          	jalr	-552(ra) # 80206848 <eunlock>
        break;
    80203a78:	bf59                	j	80203a0e <fileread+0x4a>
    return -1;
    80203a7a:	597d                	li	s2,-1
    80203a7c:	bf49                	j	80203a0e <fileread+0x4a>
          return -1;
    80203a7e:	597d                	li	s2,-1
    80203a80:	b779                	j	80203a0e <fileread+0x4a>
    80203a82:	597d                	li	s2,-1
    80203a84:	b769                	j	80203a0e <fileread+0x4a>

0000000080203a86 <filewrite>:

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
    80203a86:	7179                	addi	sp,sp,-48
    80203a88:	f406                	sd	ra,40(sp)
    80203a8a:	f022                	sd	s0,32(sp)
    80203a8c:	ec26                	sd	s1,24(sp)
    80203a8e:	e84a                	sd	s2,16(sp)
    80203a90:	e44e                	sd	s3,8(sp)
    80203a92:	e052                	sd	s4,0(sp)
    80203a94:	1800                	addi	s0,sp,48
  int ret = 0;

  if(f->writable == 0)
    80203a96:	00954783          	lbu	a5,9(a0)
    80203a9a:	cbcd                	beqz	a5,80203b4c <filewrite+0xc6>
    80203a9c:	84aa                	mv	s1,a0
    80203a9e:	892e                	mv	s2,a1
    80203aa0:	89b2                	mv	s3,a2
    return -1;

  if(f->type == FD_PIPE){
    80203aa2:	411c                	lw	a5,0(a0)
    80203aa4:	4705                	li	a4,1
    80203aa6:	04e78963          	beq	a5,a4,80203af8 <filewrite+0x72>
    ret = pipewrite(f->pipe, addr, n);
  } else if(f->type == FD_DEVICE){
    80203aaa:	470d                	li	a4,3
    80203aac:	04e78d63          	beq	a5,a4,80203b06 <filewrite+0x80>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
      return -1;
    ret = devsw[f->major].write(1, addr, n);
  } else if(f->type == FD_ENTRY){
    80203ab0:	4709                	li	a4,2
    80203ab2:	08e79563          	bne	a5,a4,80203b3c <filewrite+0xb6>
    elock(f->ep);
    80203ab6:	6d08                	ld	a0,24(a0)
    80203ab8:	00003097          	auipc	ra,0x3
    80203abc:	d5a080e7          	jalr	-678(ra) # 80206812 <elock>
    if (ewrite(f->ep, 1, addr, f->off, n) == n) {
    80203ac0:	00098a1b          	sext.w	s4,s3
    80203ac4:	8752                	mv	a4,s4
    80203ac6:	5094                	lw	a3,32(s1)
    80203ac8:	864a                	mv	a2,s2
    80203aca:	4585                	li	a1,1
    80203acc:	6c88                	ld	a0,24(s1)
    80203ace:	00002097          	auipc	ra,0x2
    80203ad2:	572080e7          	jalr	1394(ra) # 80206040 <ewrite>
      ret = n;
      f->off += n;
    } else {
      ret = -1;
    80203ad6:	597d                	li	s2,-1
    if (ewrite(f->ep, 1, addr, f->off, n) == n) {
    80203ad8:	05350b63          	beq	a0,s3,80203b2e <filewrite+0xa8>
    }
    eunlock(f->ep);
    80203adc:	6c88                	ld	a0,24(s1)
    80203ade:	00003097          	auipc	ra,0x3
    80203ae2:	d6a080e7          	jalr	-662(ra) # 80206848 <eunlock>
  } else {
    panic("filewrite");
  }

  return ret;
}
    80203ae6:	854a                	mv	a0,s2
    80203ae8:	70a2                	ld	ra,40(sp)
    80203aea:	7402                	ld	s0,32(sp)
    80203aec:	64e2                	ld	s1,24(sp)
    80203aee:	6942                	ld	s2,16(sp)
    80203af0:	69a2                	ld	s3,8(sp)
    80203af2:	6a02                	ld	s4,0(sp)
    80203af4:	6145                	addi	sp,sp,48
    80203af6:	8082                	ret
    ret = pipewrite(f->pipe, addr, n);
    80203af8:	6908                	ld	a0,16(a0)
    80203afa:	00000097          	auipc	ra,0x0
    80203afe:	262080e7          	jalr	610(ra) # 80203d5c <pipewrite>
    80203b02:	892a                	mv	s2,a0
    80203b04:	b7cd                	j	80203ae6 <filewrite+0x60>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
    80203b06:	02451783          	lh	a5,36(a0)
    80203b0a:	03079693          	slli	a3,a5,0x30
    80203b0e:	92c1                	srli	a3,a3,0x30
    80203b10:	4725                	li	a4,9
    80203b12:	02d76f63          	bltu	a4,a3,80203b50 <filewrite+0xca>
    80203b16:	0792                	slli	a5,a5,0x4
    80203b18:	000b1717          	auipc	a4,0xb1
    80203b1c:	a2870713          	addi	a4,a4,-1496 # 802b4540 <devsw>
    80203b20:	97ba                	add	a5,a5,a4
    80203b22:	679c                	ld	a5,8(a5)
    80203b24:	cb85                	beqz	a5,80203b54 <filewrite+0xce>
    ret = devsw[f->major].write(1, addr, n);
    80203b26:	4505                	li	a0,1
    80203b28:	9782                	jalr	a5
    80203b2a:	892a                	mv	s2,a0
    80203b2c:	bf6d                	j	80203ae6 <filewrite+0x60>
      f->off += n;
    80203b2e:	509c                	lw	a5,32(s1)
    80203b30:	01478a3b          	addw	s4,a5,s4
    80203b34:	0344a023          	sw	s4,32(s1)
      ret = n;
    80203b38:	894e                	mv	s2,s3
    80203b3a:	b74d                	j	80203adc <filewrite+0x56>
    panic("filewrite");
    80203b3c:	00006517          	auipc	a0,0x6
    80203b40:	26450513          	addi	a0,a0,612 # 80209da0 <sysnames+0x168>
    80203b44:	ffffc097          	auipc	ra,0xffffc
    80203b48:	600080e7          	jalr	1536(ra) # 80200144 <panic>
    return -1;
    80203b4c:	597d                	li	s2,-1
    80203b4e:	bf61                	j	80203ae6 <filewrite+0x60>
      return -1;
    80203b50:	597d                	li	s2,-1
    80203b52:	bf51                	j	80203ae6 <filewrite+0x60>
    80203b54:	597d                	li	s2,-1
    80203b56:	bf41                	j	80203ae6 <filewrite+0x60>

0000000080203b58 <dirnext>:
int
dirnext(struct file *f, uint64 addr)
{
  // struct proc *p = myproc();

  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    80203b58:	00854783          	lbu	a5,8(a0)
    80203b5c:	cbcd                	beqz	a5,80203c0e <dirnext+0xb6>
{
    80203b5e:	7105                	addi	sp,sp,-480
    80203b60:	ef86                	sd	ra,472(sp)
    80203b62:	eba2                	sd	s0,464(sp)
    80203b64:	e7a6                	sd	s1,456(sp)
    80203b66:	e3ca                	sd	s2,448(sp)
    80203b68:	ff4e                	sd	s3,440(sp)
    80203b6a:	1380                	addi	s0,sp,480
    80203b6c:	84aa                	mv	s1,a0
    80203b6e:	89ae                	mv	s3,a1
  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    80203b70:	6d18                	ld	a4,24(a0)
    80203b72:	10074783          	lbu	a5,256(a4)
    80203b76:	8bc1                	andi	a5,a5,16
    return -1;
    80203b78:	557d                	li	a0,-1
  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    80203b7a:	eb81                	bnez	a5,80203b8a <dirnext+0x32>
  // if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    return -1;

  return 1;
    80203b7c:	60fe                	ld	ra,472(sp)
    80203b7e:	645e                	ld	s0,464(sp)
    80203b80:	64be                	ld	s1,456(sp)
    80203b82:	691e                	ld	s2,448(sp)
    80203b84:	79fa                	ld	s3,440(sp)
    80203b86:	613d                	addi	sp,sp,480
    80203b88:	8082                	ret
  int count = 0;
    80203b8a:	e2042623          	sw	zero,-468(s0)
  elock(f->ep);
    80203b8e:	853a                	mv	a0,a4
    80203b90:	00003097          	auipc	ra,0x3
    80203b94:	c82080e7          	jalr	-894(ra) # 80206812 <elock>
  while ((ret = enext(f->ep, &de, f->off, &count)) == 0) {  // skip empty entry
    80203b98:	a801                	j	80203ba8 <dirnext+0x50>
    f->off += count * 32;
    80203b9a:	e2c42783          	lw	a5,-468(s0)
    80203b9e:	0057971b          	slliw	a4,a5,0x5
    80203ba2:	509c                	lw	a5,32(s1)
    80203ba4:	9fb9                	addw	a5,a5,a4
    80203ba6:	d09c                	sw	a5,32(s1)
  while ((ret = enext(f->ep, &de, f->off, &count)) == 0) {  // skip empty entry
    80203ba8:	e2c40693          	addi	a3,s0,-468
    80203bac:	5090                	lw	a2,32(s1)
    80203bae:	e6840593          	addi	a1,s0,-408
    80203bb2:	6c88                	ld	a0,24(s1)
    80203bb4:	00003097          	auipc	ra,0x3
    80203bb8:	e62080e7          	jalr	-414(ra) # 80206a16 <enext>
    80203bbc:	892a                	mv	s2,a0
    80203bbe:	dd71                	beqz	a0,80203b9a <dirnext+0x42>
  eunlock(f->ep);
    80203bc0:	6c88                	ld	a0,24(s1)
    80203bc2:	00003097          	auipc	ra,0x3
    80203bc6:	c86080e7          	jalr	-890(ra) # 80206848 <eunlock>
  if (ret == -1)
    80203bca:	57fd                	li	a5,-1
    return 0;
    80203bcc:	4501                	li	a0,0
  if (ret == -1)
    80203bce:	faf907e3          	beq	s2,a5,80203b7c <dirnext+0x24>
  f->off += count * 32;
    80203bd2:	e2c42783          	lw	a5,-468(s0)
    80203bd6:	0057971b          	slliw	a4,a5,0x5
    80203bda:	509c                	lw	a5,32(s1)
    80203bdc:	9fb9                	addw	a5,a5,a4
    80203bde:	d09c                	sw	a5,32(s1)
  estat(&de, &st);
    80203be0:	e3040593          	addi	a1,s0,-464
    80203be4:	e6840513          	addi	a0,s0,-408
    80203be8:	00003097          	auipc	ra,0x3
    80203bec:	de6080e7          	jalr	-538(ra) # 802069ce <estat>
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    80203bf0:	03800613          	li	a2,56
    80203bf4:	e3040593          	addi	a1,s0,-464
    80203bf8:	854e                	mv	a0,s3
    80203bfa:	ffffe097          	auipc	ra,0xffffe
    80203bfe:	836080e7          	jalr	-1994(ra) # 80201430 <copyout2>
    80203c02:	87aa                	mv	a5,a0
  return 1;
    80203c04:	4505                	li	a0,1
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    80203c06:	f607dbe3          	bgez	a5,80203b7c <dirnext+0x24>
    return -1;
    80203c0a:	557d                	li	a0,-1
    80203c0c:	bf85                	j	80203b7c <dirnext+0x24>
    return -1;
    80203c0e:	557d                	li	a0,-1
    80203c10:	8082                	ret

0000000080203c12 <pipealloc>:
#include "include/kalloc.h"
#include "include/vm.h"

int
pipealloc(struct file **f0, struct file **f1)
{
    80203c12:	7179                	addi	sp,sp,-48
    80203c14:	f406                	sd	ra,40(sp)
    80203c16:	f022                	sd	s0,32(sp)
    80203c18:	ec26                	sd	s1,24(sp)
    80203c1a:	e84a                	sd	s2,16(sp)
    80203c1c:	e44e                	sd	s3,8(sp)
    80203c1e:	e052                	sd	s4,0(sp)
    80203c20:	1800                	addi	s0,sp,48
    80203c22:	84aa                	mv	s1,a0
    80203c24:	8a2e                	mv	s4,a1
  struct pipe *pi;

  pi = 0;
  *f0 = *f1 = 0;
    80203c26:	0005b023          	sd	zero,0(a1)
    80203c2a:	00053023          	sd	zero,0(a0)
  if((*f0 = filealloc()) == NULL || (*f1 = filealloc()) == NULL)
    80203c2e:	00000097          	auipc	ra,0x0
    80203c32:	bc4080e7          	jalr	-1084(ra) # 802037f2 <filealloc>
    80203c36:	e088                	sd	a0,0(s1)
    80203c38:	c551                	beqz	a0,80203cc4 <pipealloc+0xb2>
    80203c3a:	00000097          	auipc	ra,0x0
    80203c3e:	bb8080e7          	jalr	-1096(ra) # 802037f2 <filealloc>
    80203c42:	00aa3023          	sd	a0,0(s4)
    80203c46:	c92d                	beqz	a0,80203cb8 <pipealloc+0xa6>
    goto bad;
  if((pi = (struct pipe*)kalloc()) == NULL)
    80203c48:	ffffd097          	auipc	ra,0xffffd
    80203c4c:	940080e7          	jalr	-1728(ra) # 80200588 <kalloc>
    80203c50:	892a                	mv	s2,a0
    80203c52:	c125                	beqz	a0,80203cb2 <pipealloc+0xa0>
    goto bad;
  pi->readopen = 1;
    80203c54:	4985                	li	s3,1
    80203c56:	23352023          	sw	s3,544(a0)
  pi->writeopen = 1;
    80203c5a:	23352223          	sw	s3,548(a0)
  pi->nwrite = 0;
    80203c5e:	20052e23          	sw	zero,540(a0)
  pi->nread = 0;
    80203c62:	20052c23          	sw	zero,536(a0)
  initlock(&pi->lock, "pipe");
    80203c66:	00006597          	auipc	a1,0x6
    80203c6a:	e2258593          	addi	a1,a1,-478 # 80209a88 <states.1718+0x300>
    80203c6e:	ffffd097          	auipc	ra,0xffffd
    80203c72:	a42080e7          	jalr	-1470(ra) # 802006b0 <initlock>
  (*f0)->type = FD_PIPE;
    80203c76:	609c                	ld	a5,0(s1)
    80203c78:	0137a023          	sw	s3,0(a5)
  (*f0)->readable = 1;
    80203c7c:	609c                	ld	a5,0(s1)
    80203c7e:	01378423          	sb	s3,8(a5)
  (*f0)->writable = 0;
    80203c82:	609c                	ld	a5,0(s1)
    80203c84:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
    80203c88:	609c                	ld	a5,0(s1)
    80203c8a:	0127b823          	sd	s2,16(a5)
  (*f1)->type = FD_PIPE;
    80203c8e:	000a3783          	ld	a5,0(s4)
    80203c92:	0137a023          	sw	s3,0(a5)
  (*f1)->readable = 0;
    80203c96:	000a3783          	ld	a5,0(s4)
    80203c9a:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
    80203c9e:	000a3783          	ld	a5,0(s4)
    80203ca2:	013784a3          	sb	s3,9(a5)
  (*f1)->pipe = pi;
    80203ca6:	000a3783          	ld	a5,0(s4)
    80203caa:	0127b823          	sd	s2,16(a5)
  return 0;
    80203cae:	4501                	li	a0,0
    80203cb0:	a025                	j	80203cd8 <pipealloc+0xc6>

 bad:
  if(pi)
    kfree((char*)pi);
  if(*f0)
    80203cb2:	6088                	ld	a0,0(s1)
    80203cb4:	e501                	bnez	a0,80203cbc <pipealloc+0xaa>
    80203cb6:	a039                	j	80203cc4 <pipealloc+0xb2>
    80203cb8:	6088                	ld	a0,0(s1)
    80203cba:	c51d                	beqz	a0,80203ce8 <pipealloc+0xd6>
    fileclose(*f0);
    80203cbc:	00000097          	auipc	ra,0x0
    80203cc0:	bf2080e7          	jalr	-1038(ra) # 802038ae <fileclose>
  if(*f1)
    80203cc4:	000a3783          	ld	a5,0(s4)
    fileclose(*f1);
  return -1;
    80203cc8:	557d                	li	a0,-1
  if(*f1)
    80203cca:	c799                	beqz	a5,80203cd8 <pipealloc+0xc6>
    fileclose(*f1);
    80203ccc:	853e                	mv	a0,a5
    80203cce:	00000097          	auipc	ra,0x0
    80203cd2:	be0080e7          	jalr	-1056(ra) # 802038ae <fileclose>
  return -1;
    80203cd6:	557d                	li	a0,-1
}
    80203cd8:	70a2                	ld	ra,40(sp)
    80203cda:	7402                	ld	s0,32(sp)
    80203cdc:	64e2                	ld	s1,24(sp)
    80203cde:	6942                	ld	s2,16(sp)
    80203ce0:	69a2                	ld	s3,8(sp)
    80203ce2:	6a02                	ld	s4,0(sp)
    80203ce4:	6145                	addi	sp,sp,48
    80203ce6:	8082                	ret
  return -1;
    80203ce8:	557d                	li	a0,-1
    80203cea:	b7fd                	j	80203cd8 <pipealloc+0xc6>

0000000080203cec <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
    80203cec:	1101                	addi	sp,sp,-32
    80203cee:	ec06                	sd	ra,24(sp)
    80203cf0:	e822                	sd	s0,16(sp)
    80203cf2:	e426                	sd	s1,8(sp)
    80203cf4:	e04a                	sd	s2,0(sp)
    80203cf6:	1000                	addi	s0,sp,32
    80203cf8:	84aa                	mv	s1,a0
    80203cfa:	892e                	mv	s2,a1
  acquire(&pi->lock);
    80203cfc:	ffffd097          	auipc	ra,0xffffd
    80203d00:	9f8080e7          	jalr	-1544(ra) # 802006f4 <acquire>
  if(writable){
    80203d04:	02090d63          	beqz	s2,80203d3e <pipeclose+0x52>
    pi->writeopen = 0;
    80203d08:	2204a223          	sw	zero,548(s1)
    wakeup(&pi->nread);
    80203d0c:	21848513          	addi	a0,s1,536
    80203d10:	fffff097          	auipc	ra,0xfffff
    80203d14:	808080e7          	jalr	-2040(ra) # 80202518 <wakeup>
  } else {
    pi->readopen = 0;
    wakeup(&pi->nwrite);
  }
  if(pi->readopen == 0 && pi->writeopen == 0){
    80203d18:	2204b783          	ld	a5,544(s1)
    80203d1c:	eb95                	bnez	a5,80203d50 <pipeclose+0x64>
    release(&pi->lock);
    80203d1e:	8526                	mv	a0,s1
    80203d20:	ffffd097          	auipc	ra,0xffffd
    80203d24:	a28080e7          	jalr	-1496(ra) # 80200748 <release>
    kfree((char*)pi);
    80203d28:	8526                	mv	a0,s1
    80203d2a:	ffffc097          	auipc	ra,0xffffc
    80203d2e:	71c080e7          	jalr	1820(ra) # 80200446 <kfree>
  } else
    release(&pi->lock);
}
    80203d32:	60e2                	ld	ra,24(sp)
    80203d34:	6442                	ld	s0,16(sp)
    80203d36:	64a2                	ld	s1,8(sp)
    80203d38:	6902                	ld	s2,0(sp)
    80203d3a:	6105                	addi	sp,sp,32
    80203d3c:	8082                	ret
    pi->readopen = 0;
    80203d3e:	2204a023          	sw	zero,544(s1)
    wakeup(&pi->nwrite);
    80203d42:	21c48513          	addi	a0,s1,540
    80203d46:	ffffe097          	auipc	ra,0xffffe
    80203d4a:	7d2080e7          	jalr	2002(ra) # 80202518 <wakeup>
    80203d4e:	b7e9                	j	80203d18 <pipeclose+0x2c>
    release(&pi->lock);
    80203d50:	8526                	mv	a0,s1
    80203d52:	ffffd097          	auipc	ra,0xffffd
    80203d56:	9f6080e7          	jalr	-1546(ra) # 80200748 <release>
}
    80203d5a:	bfe1                	j	80203d32 <pipeclose+0x46>

0000000080203d5c <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
    80203d5c:	7119                	addi	sp,sp,-128
    80203d5e:	fc86                	sd	ra,120(sp)
    80203d60:	f8a2                	sd	s0,112(sp)
    80203d62:	f4a6                	sd	s1,104(sp)
    80203d64:	f0ca                	sd	s2,96(sp)
    80203d66:	ecce                	sd	s3,88(sp)
    80203d68:	e8d2                	sd	s4,80(sp)
    80203d6a:	e4d6                	sd	s5,72(sp)
    80203d6c:	e0da                	sd	s6,64(sp)
    80203d6e:	fc5e                	sd	s7,56(sp)
    80203d70:	f862                	sd	s8,48(sp)
    80203d72:	f466                	sd	s9,40(sp)
    80203d74:	f06a                	sd	s10,32(sp)
    80203d76:	ec6e                	sd	s11,24(sp)
    80203d78:	0100                	addi	s0,sp,128
    80203d7a:	84aa                	mv	s1,a0
    80203d7c:	8cae                	mv	s9,a1
    80203d7e:	8b32                	mv	s6,a2
  int i;
  char ch;
  struct proc *pr = myproc();
    80203d80:	ffffe097          	auipc	ra,0xffffe
    80203d84:	d9c080e7          	jalr	-612(ra) # 80201b1c <myproc>
    80203d88:	892a                	mv	s2,a0

  acquire(&pi->lock);
    80203d8a:	8526                	mv	a0,s1
    80203d8c:	ffffd097          	auipc	ra,0xffffd
    80203d90:	968080e7          	jalr	-1688(ra) # 802006f4 <acquire>
  for(i = 0; i < n; i++){
    80203d94:	0d605763          	blez	s6,80203e62 <pipewrite+0x106>
    80203d98:	89a6                	mv	s3,s1
    80203d9a:	3b7d                	addiw	s6,s6,-1
    80203d9c:	1b02                	slli	s6,s6,0x20
    80203d9e:	020b5b13          	srli	s6,s6,0x20
    80203da2:	4b81                	li	s7,0
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
      if(pi->readopen == 0 || pr->killed){
        release(&pi->lock);
        return -1;
      }
      wakeup(&pi->nread);
    80203da4:	21848a93          	addi	s5,s1,536
      sleep(&pi->nwrite, &pi->lock);
    80203da8:	21c48a13          	addi	s4,s1,540
    }
    // if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    if(copyin2(&ch, addr + i, 1) == -1)
    80203dac:	5dfd                	li	s11,-1
    80203dae:	000b8d1b          	sext.w	s10,s7
    80203db2:	8c6a                	mv	s8,s10
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
    80203db4:	2184a783          	lw	a5,536(s1)
    80203db8:	21c4a703          	lw	a4,540(s1)
    80203dbc:	2007879b          	addiw	a5,a5,512
    80203dc0:	02f71b63          	bne	a4,a5,80203df6 <pipewrite+0x9a>
      if(pi->readopen == 0 || pr->killed){
    80203dc4:	2204a783          	lw	a5,544(s1)
    80203dc8:	c7bd                	beqz	a5,80203e36 <pipewrite+0xda>
    80203dca:	03092783          	lw	a5,48(s2)
    80203dce:	e7a5                	bnez	a5,80203e36 <pipewrite+0xda>
      wakeup(&pi->nread);
    80203dd0:	8556                	mv	a0,s5
    80203dd2:	ffffe097          	auipc	ra,0xffffe
    80203dd6:	746080e7          	jalr	1862(ra) # 80202518 <wakeup>
      sleep(&pi->nwrite, &pi->lock);
    80203dda:	85ce                	mv	a1,s3
    80203ddc:	8552                	mv	a0,s4
    80203dde:	ffffe097          	auipc	ra,0xffffe
    80203de2:	5b8080e7          	jalr	1464(ra) # 80202396 <sleep>
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
    80203de6:	2184a783          	lw	a5,536(s1)
    80203dea:	21c4a703          	lw	a4,540(s1)
    80203dee:	2007879b          	addiw	a5,a5,512
    80203df2:	fcf709e3          	beq	a4,a5,80203dc4 <pipewrite+0x68>
    if(copyin2(&ch, addr + i, 1) == -1)
    80203df6:	4605                	li	a2,1
    80203df8:	019b85b3          	add	a1,s7,s9
    80203dfc:	f8f40513          	addi	a0,s0,-113
    80203e00:	ffffd097          	auipc	ra,0xffffd
    80203e04:	70e080e7          	jalr	1806(ra) # 8020150e <copyin2>
    80203e08:	05b50e63          	beq	a0,s11,80203e64 <pipewrite+0x108>
      break;
    pi->data[pi->nwrite++ % PIPESIZE] = ch;
    80203e0c:	21c4a783          	lw	a5,540(s1)
    80203e10:	0017871b          	addiw	a4,a5,1
    80203e14:	20e4ae23          	sw	a4,540(s1)
    80203e18:	1ff7f793          	andi	a5,a5,511
    80203e1c:	97a6                	add	a5,a5,s1
    80203e1e:	f8f44703          	lbu	a4,-113(s0)
    80203e22:	00e78c23          	sb	a4,24(a5)
  for(i = 0; i < n; i++){
    80203e26:	001d0c1b          	addiw	s8,s10,1
    80203e2a:	001b8793          	addi	a5,s7,1
    80203e2e:	036b8b63          	beq	s7,s6,80203e64 <pipewrite+0x108>
    80203e32:	8bbe                	mv	s7,a5
    80203e34:	bfad                	j	80203dae <pipewrite+0x52>
        release(&pi->lock);
    80203e36:	8526                	mv	a0,s1
    80203e38:	ffffd097          	auipc	ra,0xffffd
    80203e3c:	910080e7          	jalr	-1776(ra) # 80200748 <release>
        return -1;
    80203e40:	5c7d                	li	s8,-1
  }
  wakeup(&pi->nread);
  release(&pi->lock);
  return i;
}
    80203e42:	8562                	mv	a0,s8
    80203e44:	70e6                	ld	ra,120(sp)
    80203e46:	7446                	ld	s0,112(sp)
    80203e48:	74a6                	ld	s1,104(sp)
    80203e4a:	7906                	ld	s2,96(sp)
    80203e4c:	69e6                	ld	s3,88(sp)
    80203e4e:	6a46                	ld	s4,80(sp)
    80203e50:	6aa6                	ld	s5,72(sp)
    80203e52:	6b06                	ld	s6,64(sp)
    80203e54:	7be2                	ld	s7,56(sp)
    80203e56:	7c42                	ld	s8,48(sp)
    80203e58:	7ca2                	ld	s9,40(sp)
    80203e5a:	7d02                	ld	s10,32(sp)
    80203e5c:	6de2                	ld	s11,24(sp)
    80203e5e:	6109                	addi	sp,sp,128
    80203e60:	8082                	ret
  for(i = 0; i < n; i++){
    80203e62:	4c01                	li	s8,0
  wakeup(&pi->nread);
    80203e64:	21848513          	addi	a0,s1,536
    80203e68:	ffffe097          	auipc	ra,0xffffe
    80203e6c:	6b0080e7          	jalr	1712(ra) # 80202518 <wakeup>
  release(&pi->lock);
    80203e70:	8526                	mv	a0,s1
    80203e72:	ffffd097          	auipc	ra,0xffffd
    80203e76:	8d6080e7          	jalr	-1834(ra) # 80200748 <release>
  return i;
    80203e7a:	b7e1                	j	80203e42 <pipewrite+0xe6>

0000000080203e7c <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
    80203e7c:	715d                	addi	sp,sp,-80
    80203e7e:	e486                	sd	ra,72(sp)
    80203e80:	e0a2                	sd	s0,64(sp)
    80203e82:	fc26                	sd	s1,56(sp)
    80203e84:	f84a                	sd	s2,48(sp)
    80203e86:	f44e                	sd	s3,40(sp)
    80203e88:	f052                	sd	s4,32(sp)
    80203e8a:	ec56                	sd	s5,24(sp)
    80203e8c:	e85a                	sd	s6,16(sp)
    80203e8e:	0880                	addi	s0,sp,80
    80203e90:	84aa                	mv	s1,a0
    80203e92:	892e                	mv	s2,a1
    80203e94:	8a32                	mv	s4,a2
  int i;
  struct proc *pr = myproc();
    80203e96:	ffffe097          	auipc	ra,0xffffe
    80203e9a:	c86080e7          	jalr	-890(ra) # 80201b1c <myproc>
    80203e9e:	89aa                	mv	s3,a0
  char ch;

  acquire(&pi->lock);
    80203ea0:	8b26                	mv	s6,s1
    80203ea2:	8526                	mv	a0,s1
    80203ea4:	ffffd097          	auipc	ra,0xffffd
    80203ea8:	850080e7          	jalr	-1968(ra) # 802006f4 <acquire>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80203eac:	2184a703          	lw	a4,536(s1)
    80203eb0:	21c4a783          	lw	a5,540(s1)
    if(pr->killed){
      release(&pi->lock);
      return -1;
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    80203eb4:	21848a93          	addi	s5,s1,536
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80203eb8:	02f71463          	bne	a4,a5,80203ee0 <piperead+0x64>
    80203ebc:	2244a783          	lw	a5,548(s1)
    80203ec0:	c385                	beqz	a5,80203ee0 <piperead+0x64>
    if(pr->killed){
    80203ec2:	0309a783          	lw	a5,48(s3)
    80203ec6:	e7d1                	bnez	a5,80203f52 <piperead+0xd6>
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    80203ec8:	85da                	mv	a1,s6
    80203eca:	8556                	mv	a0,s5
    80203ecc:	ffffe097          	auipc	ra,0xffffe
    80203ed0:	4ca080e7          	jalr	1226(ra) # 80202396 <sleep>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80203ed4:	2184a703          	lw	a4,536(s1)
    80203ed8:	21c4a783          	lw	a5,540(s1)
    80203edc:	fef700e3          	beq	a4,a5,80203ebc <piperead+0x40>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    80203ee0:	09405063          	blez	s4,80203f60 <piperead+0xe4>
    80203ee4:	4981                	li	s3,0
    if(pi->nread == pi->nwrite)
      break;
    ch = pi->data[pi->nread++ % PIPESIZE];
    // if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    if(copyout2(addr + i, &ch, 1) == -1)
    80203ee6:	5afd                	li	s5,-1
    if(pi->nread == pi->nwrite)
    80203ee8:	2184a783          	lw	a5,536(s1)
    80203eec:	21c4a703          	lw	a4,540(s1)
    80203ef0:	02f70b63          	beq	a4,a5,80203f26 <piperead+0xaa>
    ch = pi->data[pi->nread++ % PIPESIZE];
    80203ef4:	0017871b          	addiw	a4,a5,1
    80203ef8:	20e4ac23          	sw	a4,536(s1)
    80203efc:	1ff7f793          	andi	a5,a5,511
    80203f00:	97a6                	add	a5,a5,s1
    80203f02:	0187c783          	lbu	a5,24(a5)
    80203f06:	faf40fa3          	sb	a5,-65(s0)
    if(copyout2(addr + i, &ch, 1) == -1)
    80203f0a:	4605                	li	a2,1
    80203f0c:	fbf40593          	addi	a1,s0,-65
    80203f10:	854a                	mv	a0,s2
    80203f12:	ffffd097          	auipc	ra,0xffffd
    80203f16:	51e080e7          	jalr	1310(ra) # 80201430 <copyout2>
    80203f1a:	01550663          	beq	a0,s5,80203f26 <piperead+0xaa>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    80203f1e:	2985                	addiw	s3,s3,1
    80203f20:	0905                	addi	s2,s2,1
    80203f22:	fd3a13e3          	bne	s4,s3,80203ee8 <piperead+0x6c>
      break;
  }
  wakeup(&pi->nwrite);  //DOC: piperead-wakeup
    80203f26:	21c48513          	addi	a0,s1,540
    80203f2a:	ffffe097          	auipc	ra,0xffffe
    80203f2e:	5ee080e7          	jalr	1518(ra) # 80202518 <wakeup>
  release(&pi->lock);
    80203f32:	8526                	mv	a0,s1
    80203f34:	ffffd097          	auipc	ra,0xffffd
    80203f38:	814080e7          	jalr	-2028(ra) # 80200748 <release>
  return i;
}
    80203f3c:	854e                	mv	a0,s3
    80203f3e:	60a6                	ld	ra,72(sp)
    80203f40:	6406                	ld	s0,64(sp)
    80203f42:	74e2                	ld	s1,56(sp)
    80203f44:	7942                	ld	s2,48(sp)
    80203f46:	79a2                	ld	s3,40(sp)
    80203f48:	7a02                	ld	s4,32(sp)
    80203f4a:	6ae2                	ld	s5,24(sp)
    80203f4c:	6b42                	ld	s6,16(sp)
    80203f4e:	6161                	addi	sp,sp,80
    80203f50:	8082                	ret
      release(&pi->lock);
    80203f52:	8526                	mv	a0,s1
    80203f54:	ffffc097          	auipc	ra,0xffffc
    80203f58:	7f4080e7          	jalr	2036(ra) # 80200748 <release>
      return -1;
    80203f5c:	59fd                	li	s3,-1
    80203f5e:	bff9                	j	80203f3c <piperead+0xc0>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    80203f60:	4981                	li	s3,0
    80203f62:	b7d1                	j	80203f26 <piperead+0xaa>

0000000080203f64 <exec>:
  return 0;
}


int exec(char *path, char **argv)
{
    80203f64:	de010113          	addi	sp,sp,-544
    80203f68:	20113c23          	sd	ra,536(sp)
    80203f6c:	20813823          	sd	s0,528(sp)
    80203f70:	20913423          	sd	s1,520(sp)
    80203f74:	21213023          	sd	s2,512(sp)
    80203f78:	ffce                	sd	s3,504(sp)
    80203f7a:	fbd2                	sd	s4,496(sp)
    80203f7c:	f7d6                	sd	s5,488(sp)
    80203f7e:	f3da                	sd	s6,480(sp)
    80203f80:	efde                	sd	s7,472(sp)
    80203f82:	ebe2                	sd	s8,464(sp)
    80203f84:	e7e6                	sd	s9,456(sp)
    80203f86:	e3ea                	sd	s10,448(sp)
    80203f88:	ff6e                	sd	s11,440(sp)
    80203f8a:	1400                	addi	s0,sp,544
    80203f8c:	892a                	mv	s2,a0
    80203f8e:	dea43423          	sd	a0,-536(s0)
    80203f92:	deb43823          	sd	a1,-528(s0)
  struct elfhdr elf;
  struct dirent *ep;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
  pagetable_t kpagetable = 0, oldkpagetable;
  struct proc *p = myproc();
    80203f96:	ffffe097          	auipc	ra,0xffffe
    80203f9a:	b86080e7          	jalr	-1146(ra) # 80201b1c <myproc>
    80203f9e:	84aa                	mv	s1,a0

  // Make a copy of p->kpt without old user space, 
  // but with the same kstack we are using now, which can't be changed
  if ((kpagetable = (pagetable_t)kalloc()) == NULL) {
    80203fa0:	ffffc097          	auipc	ra,0xffffc
    80203fa4:	5e8080e7          	jalr	1512(ra) # 80200588 <kalloc>
    80203fa8:	2a050d63          	beqz	a0,80204262 <exec+0x2fe>
    80203fac:	8aaa                	mv	s5,a0
    return -1;
  }
  memmove(kpagetable, p->kpagetable, PGSIZE);
    80203fae:	6605                	lui	a2,0x1
    80203fb0:	6cac                	ld	a1,88(s1)
    80203fb2:	ffffd097          	auipc	ra,0xffffd
    80203fb6:	83e080e7          	jalr	-1986(ra) # 802007f0 <memmove>
  for (int i = 0; i < PX(2, MAXUVA); i++) {
    kpagetable[i] = 0;
    80203fba:	000ab023          	sd	zero,0(s5)
    80203fbe:	000ab423          	sd	zero,8(s5)
  }

  if((ep = ename(path)) == NULL) {
    80203fc2:	854a                	mv	a0,s2
    80203fc4:	00003097          	auipc	ra,0x3
    80203fc8:	fee080e7          	jalr	-18(ra) # 80206fb2 <ename>
    80203fcc:	8a2a                	mv	s4,a0
    80203fce:	c529                	beqz	a0,80204018 <exec+0xb4>
    #ifdef DEBUG
    printf("[exec] %s not found\n", path);
    #endif
    goto bad;
  }
  elock(ep);
    80203fd0:	00003097          	auipc	ra,0x3
    80203fd4:	842080e7          	jalr	-1982(ra) # 80206812 <elock>

  // Check ELF header
  if(eread(ep, 0, (uint64) &elf, 0, sizeof(elf)) != sizeof(elf))
    80203fd8:	04000713          	li	a4,64
    80203fdc:	4681                	li	a3,0
    80203fde:	e4840613          	addi	a2,s0,-440
    80203fe2:	4581                	li	a1,0
    80203fe4:	8552                	mv	a0,s4
    80203fe6:	00002097          	auipc	ra,0x2
    80203fea:	f62080e7          	jalr	-158(ra) # 80205f48 <eread>
    80203fee:	04000793          	li	a5,64
    80203ff2:	00f51a63          	bne	a0,a5,80204006 <exec+0xa2>
    goto bad;
  if(elf.magic != ELF_MAGIC)
    80203ff6:	e4842703          	lw	a4,-440(s0)
    80203ffa:	464c47b7          	lui	a5,0x464c4
    80203ffe:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39d3ba81>
    80204002:	02f70663          	beq	a4,a5,8020402e <exec+0xca>
  kvmfree(oldkpagetable, 0);
  return argc; // this ends up in a0, the first argument to main(argc, argv)

 bad:
  #ifdef DEBUG
  printf("[exec] reach bad\n");
    80204006:	00006517          	auipc	a0,0x6
    8020400a:	de250513          	addi	a0,a0,-542 # 80209de8 <sysnames+0x1b0>
    8020400e:	ffffc097          	auipc	ra,0xffffc
    80204012:	180080e7          	jalr	384(ra) # 8020018e <printf>
  #endif
  if(pagetable)
    80204016:	ac95                	j	8020428a <exec+0x326>
    printf("[exec] %s not found\n", path);
    80204018:	de843583          	ld	a1,-536(s0)
    8020401c:	00006517          	auipc	a0,0x6
    80204020:	d9450513          	addi	a0,a0,-620 # 80209db0 <sysnames+0x178>
    80204024:	ffffc097          	auipc	ra,0xffffc
    80204028:	16a080e7          	jalr	362(ra) # 8020018e <printf>
    goto bad;
    8020402c:	bfe9                	j	80204006 <exec+0xa2>
  if((pagetable = proc_pagetable(p)) == NULL)
    8020402e:	8526                	mv	a0,s1
    80204030:	ffffe097          	auipc	ra,0xffffe
    80204034:	bd0080e7          	jalr	-1072(ra) # 80201c00 <proc_pagetable>
    80204038:	e0a43423          	sd	a0,-504(s0)
    8020403c:	d569                	beqz	a0,80204006 <exec+0xa2>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    8020403e:	e6842783          	lw	a5,-408(s0)
    80204042:	e8045703          	lhu	a4,-384(s0)
    80204046:	c72d                	beqz	a4,802040b0 <exec+0x14c>
  uint64 argc, sz = 0, sp, ustack[MAXARG+1], stackbase;
    80204048:	4481                	li	s1,0
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    8020404a:	4d81                	li	s11,0
    if(ph.vaddr % PGSIZE != 0)
    8020404c:	6b05                	lui	s6,0x1
    8020404e:	fffb0713          	addi	a4,s6,-1 # fff <_entry-0x801ff001>
    80204052:	dee43023          	sd	a4,-544(s0)
    80204056:	7bfd                	lui	s7,0xfffff
    80204058:	a4c9                	j	8020431a <exec+0x3b6>
      panic("loadseg: address should exist");
    8020405a:	00006517          	auipc	a0,0x6
    8020405e:	d6e50513          	addi	a0,a0,-658 # 80209dc8 <sysnames+0x190>
    80204062:	ffffc097          	auipc	ra,0xffffc
    80204066:	0e2080e7          	jalr	226(ra) # 80200144 <panic>
    if(eread(ep, 0, (uint64)pa, offset+i, n) != n)
    8020406a:	874e                	mv	a4,s3
    8020406c:	009d06bb          	addw	a3,s10,s1
    80204070:	4581                	li	a1,0
    80204072:	8552                	mv	a0,s4
    80204074:	00002097          	auipc	ra,0x2
    80204078:	ed4080e7          	jalr	-300(ra) # 80205f48 <eread>
    8020407c:	2501                	sext.w	a0,a0
    8020407e:	1ea99663          	bne	s3,a0,8020426a <exec+0x306>
  for(i = 0; i < sz; i += PGSIZE){
    80204082:	6785                	lui	a5,0x1
    80204084:	9cbd                	addw	s1,s1,a5
    80204086:	012b893b          	addw	s2,s7,s2
    8020408a:	2784fd63          	bgeu	s1,s8,80204304 <exec+0x3a0>
    pa = walkaddr(pagetable, va + i);
    8020408e:	02049593          	slli	a1,s1,0x20
    80204092:	9181                	srli	a1,a1,0x20
    80204094:	95e6                	add	a1,a1,s9
    80204096:	e0843503          	ld	a0,-504(s0)
    8020409a:	ffffd097          	auipc	ra,0xffffd
    8020409e:	bdc080e7          	jalr	-1060(ra) # 80200c76 <walkaddr>
    802040a2:	862a                	mv	a2,a0
    if(pa == NULL)
    802040a4:	d95d                	beqz	a0,8020405a <exec+0xf6>
      n = PGSIZE;
    802040a6:	89da                	mv	s3,s6
    if(sz - i < PGSIZE)
    802040a8:	fd6971e3          	bgeu	s2,s6,8020406a <exec+0x106>
      n = sz - i;
    802040ac:	89ca                	mv	s3,s2
    802040ae:	bf75                	j	8020406a <exec+0x106>
  uint64 argc, sz = 0, sp, ustack[MAXARG+1], stackbase;
    802040b0:	4481                	li	s1,0
  eunlock(ep);
    802040b2:	8552                	mv	a0,s4
    802040b4:	00002097          	auipc	ra,0x2
    802040b8:	794080e7          	jalr	1940(ra) # 80206848 <eunlock>
  eput(ep);
    802040bc:	8552                	mv	a0,s4
    802040be:	00002097          	auipc	ra,0x2
    802040c2:	7d8080e7          	jalr	2008(ra) # 80206896 <eput>
  p = myproc();
    802040c6:	ffffe097          	auipc	ra,0xffffe
    802040ca:	a56080e7          	jalr	-1450(ra) # 80201b1c <myproc>
    802040ce:	8b2a                	mv	s6,a0
  uint64 oldsz = p->sz;
    802040d0:	04853d83          	ld	s11,72(a0)
  sz = PGROUNDUP(sz);
    802040d4:	6785                	lui	a5,0x1
    802040d6:	17fd                	addi	a5,a5,-1
    802040d8:	94be                	add	s1,s1,a5
    802040da:	77fd                	lui	a5,0xfffff
    802040dc:	8fe5                	and	a5,a5,s1
    802040de:	def43c23          	sd	a5,-520(s0)
  if((sz1 = uvmalloc(pagetable, kpagetable, sz, sz + 2*PGSIZE)) == 0)
    802040e2:	6689                	lui	a3,0x2
    802040e4:	96be                	add	a3,a3,a5
    802040e6:	863e                	mv	a2,a5
    802040e8:	85d6                	mv	a1,s5
    802040ea:	e0843483          	ld	s1,-504(s0)
    802040ee:	8526                	mv	a0,s1
    802040f0:	ffffd097          	auipc	ra,0xffffd
    802040f4:	fdc080e7          	jalr	-36(ra) # 802010cc <uvmalloc>
    802040f8:	8d2a                	mv	s10,a0
  ep = 0;
    802040fa:	4a01                	li	s4,0
  if((sz1 = uvmalloc(pagetable, kpagetable, sz, sz + 2*PGSIZE)) == 0)
    802040fc:	16050763          	beqz	a0,8020426a <exec+0x306>
  uvmclear(pagetable, sz-2*PGSIZE);
    80204100:	75f9                	lui	a1,0xffffe
    80204102:	95aa                	add	a1,a1,a0
    80204104:	8526                	mv	a0,s1
    80204106:	ffffd097          	auipc	ra,0xffffd
    8020410a:	26c080e7          	jalr	620(ra) # 80201372 <uvmclear>
  stackbase = sp - PGSIZE;
    8020410e:	7c7d                	lui	s8,0xfffff
    80204110:	9c6a                	add	s8,s8,s10
  for(argc = 0; argv[argc]; argc++) {
    80204112:	df043783          	ld	a5,-528(s0)
    80204116:	6388                	ld	a0,0(a5)
    80204118:	c925                	beqz	a0,80204188 <exec+0x224>
    8020411a:	e8840993          	addi	s3,s0,-376
    8020411e:	f8840c93          	addi	s9,s0,-120
  sp = sz;
    80204122:	896a                	mv	s2,s10
  for(argc = 0; argv[argc]; argc++) {
    80204124:	4481                	li	s1,0
    sp -= strlen(argv[argc]) + 1;
    80204126:	ffffc097          	auipc	ra,0xffffc
    8020412a:	7f2080e7          	jalr	2034(ra) # 80200918 <strlen>
    8020412e:	2505                	addiw	a0,a0,1
    80204130:	40a90933          	sub	s2,s2,a0
    sp -= sp % 16; // riscv sp must be 16-byte aligned
    80204134:	ff097913          	andi	s2,s2,-16
    if(sp < stackbase)
    80204138:	1b896a63          	bltu	s2,s8,802042ec <exec+0x388>
    if(copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
    8020413c:	df043b83          	ld	s7,-528(s0)
    80204140:	000bba03          	ld	s4,0(s7) # fffffffffffff000 <kernel_end+0xffffffff7fd41000>
    80204144:	8552                	mv	a0,s4
    80204146:	ffffc097          	auipc	ra,0xffffc
    8020414a:	7d2080e7          	jalr	2002(ra) # 80200918 <strlen>
    8020414e:	0015069b          	addiw	a3,a0,1
    80204152:	8652                	mv	a2,s4
    80204154:	85ca                	mv	a1,s2
    80204156:	e0843503          	ld	a0,-504(s0)
    8020415a:	ffffd097          	auipc	ra,0xffffd
    8020415e:	24a080e7          	jalr	586(ra) # 802013a4 <copyout>
    80204162:	18054963          	bltz	a0,802042f4 <exec+0x390>
    ustack[argc] = sp;
    80204166:	0129b023          	sd	s2,0(s3)
  for(argc = 0; argv[argc]; argc++) {
    8020416a:	0485                	addi	s1,s1,1
    8020416c:	008b8793          	addi	a5,s7,8
    80204170:	def43823          	sd	a5,-528(s0)
    80204174:	008bb503          	ld	a0,8(s7)
    80204178:	c911                	beqz	a0,8020418c <exec+0x228>
    if(argc >= MAXARG)
    8020417a:	09a1                	addi	s3,s3,8
    8020417c:	fb9995e3          	bne	s3,s9,80204126 <exec+0x1c2>
  sz = sz1;
    80204180:	dfa43c23          	sd	s10,-520(s0)
  ep = 0;
    80204184:	4a01                	li	s4,0
    80204186:	a0d5                	j	8020426a <exec+0x306>
  sp = sz;
    80204188:	896a                	mv	s2,s10
  for(argc = 0; argv[argc]; argc++) {
    8020418a:	4481                	li	s1,0
  ustack[argc] = 0;
    8020418c:	00349793          	slli	a5,s1,0x3
    80204190:	f9040713          	addi	a4,s0,-112
    80204194:	97ba                	add	a5,a5,a4
    80204196:	ee07bc23          	sd	zero,-264(a5) # ffffffffffffeef8 <kernel_end+0xffffffff7fd40ef8>
  sp -= (argc+1) * sizeof(uint64);
    8020419a:	00148693          	addi	a3,s1,1
    8020419e:	068e                	slli	a3,a3,0x3
    802041a0:	40d90933          	sub	s2,s2,a3
  sp -= sp % 16;
    802041a4:	ff097913          	andi	s2,s2,-16
  if(sp < stackbase)
    802041a8:	01897663          	bgeu	s2,s8,802041b4 <exec+0x250>
  sz = sz1;
    802041ac:	dfa43c23          	sd	s10,-520(s0)
  ep = 0;
    802041b0:	4a01                	li	s4,0
    802041b2:	a865                	j	8020426a <exec+0x306>
  if(copyout(pagetable, sp, (char *)ustack, (argc+1)*sizeof(uint64)) < 0)
    802041b4:	e8840613          	addi	a2,s0,-376
    802041b8:	85ca                	mv	a1,s2
    802041ba:	e0843503          	ld	a0,-504(s0)
    802041be:	ffffd097          	auipc	ra,0xffffd
    802041c2:	1e6080e7          	jalr	486(ra) # 802013a4 <copyout>
    802041c6:	12054b63          	bltz	a0,802042fc <exec+0x398>
  p->trapframe->a1 = sp;
    802041ca:	060b3783          	ld	a5,96(s6)
    802041ce:	0727bc23          	sd	s2,120(a5)
  for(last=s=path; *s; s++)
    802041d2:	de843783          	ld	a5,-536(s0)
    802041d6:	0007c703          	lbu	a4,0(a5)
    802041da:	cf11                	beqz	a4,802041f6 <exec+0x292>
    802041dc:	0785                	addi	a5,a5,1
    if(*s == '/')
    802041de:	02f00693          	li	a3,47
    802041e2:	a029                	j	802041ec <exec+0x288>
  for(last=s=path; *s; s++)
    802041e4:	0785                	addi	a5,a5,1
    802041e6:	fff7c703          	lbu	a4,-1(a5)
    802041ea:	c711                	beqz	a4,802041f6 <exec+0x292>
    if(*s == '/')
    802041ec:	fed71ce3          	bne	a4,a3,802041e4 <exec+0x280>
      last = s+1;
    802041f0:	def43423          	sd	a5,-536(s0)
    802041f4:	bfc5                	j	802041e4 <exec+0x280>
  safestrcpy(p->name, last, sizeof(p->name));
    802041f6:	4641                	li	a2,16
    802041f8:	de843583          	ld	a1,-536(s0)
    802041fc:	160b0513          	addi	a0,s6,352
    80204200:	ffffc097          	auipc	ra,0xffffc
    80204204:	6e6080e7          	jalr	1766(ra) # 802008e6 <safestrcpy>
  oldpagetable = p->pagetable;
    80204208:	050b3503          	ld	a0,80(s6)
  oldkpagetable = p->kpagetable;
    8020420c:	058b3983          	ld	s3,88(s6)
  p->pagetable = pagetable;
    80204210:	e0843783          	ld	a5,-504(s0)
    80204214:	04fb3823          	sd	a5,80(s6)
  p->kpagetable = kpagetable;
    80204218:	055b3c23          	sd	s5,88(s6)
  p->sz = sz;
    8020421c:	05ab3423          	sd	s10,72(s6)
  p->trapframe->epc = elf.entry;  // initial program counter = main
    80204220:	060b3783          	ld	a5,96(s6)
    80204224:	e6043703          	ld	a4,-416(s0)
    80204228:	ef98                	sd	a4,24(a5)
  p->trapframe->sp = sp; // initial stack pointer
    8020422a:	060b3783          	ld	a5,96(s6)
    8020422e:	0327b823          	sd	s2,48(a5)
  proc_freepagetable(oldpagetable, oldsz);
    80204232:	85ee                	mv	a1,s11
    80204234:	ffffe097          	auipc	ra,0xffffe
    80204238:	a68080e7          	jalr	-1432(ra) # 80201c9c <proc_freepagetable>
  w_satp(MAKE_SATP(p->kpagetable));
    8020423c:	058b3783          	ld	a5,88(s6)
    80204240:	83b1                	srli	a5,a5,0xc
    80204242:	577d                	li	a4,-1
    80204244:	177e                	slli	a4,a4,0x3f
    80204246:	8fd9                	or	a5,a5,a4
  asm volatile("csrw satp, %0" : : "r" (x));
    80204248:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    8020424c:	12000073          	sfence.vma
  kvmfree(oldkpagetable, 0);
    80204250:	4581                	li	a1,0
    80204252:	854e                	mv	a0,s3
    80204254:	ffffd097          	auipc	ra,0xffffd
    80204258:	4de080e7          	jalr	1246(ra) # 80201732 <kvmfree>
  return argc; // this ends up in a0, the first argument to main(argc, argv)
    8020425c:	0004851b          	sext.w	a0,s1
    80204260:	a889                	j	802042b2 <exec+0x34e>
    return -1;
    80204262:	557d                	li	a0,-1
    80204264:	a0b9                	j	802042b2 <exec+0x34e>
    80204266:	de943c23          	sd	s1,-520(s0)
  printf("[exec] reach bad\n");
    8020426a:	00006517          	auipc	a0,0x6
    8020426e:	b7e50513          	addi	a0,a0,-1154 # 80209de8 <sysnames+0x1b0>
    80204272:	ffffc097          	auipc	ra,0xffffc
    80204276:	f1c080e7          	jalr	-228(ra) # 8020018e <printf>
    proc_freepagetable(pagetable, sz);
    8020427a:	df843583          	ld	a1,-520(s0)
    8020427e:	e0843503          	ld	a0,-504(s0)
    80204282:	ffffe097          	auipc	ra,0xffffe
    80204286:	a1a080e7          	jalr	-1510(ra) # 80201c9c <proc_freepagetable>
  if(kpagetable)
    kvmfree(kpagetable, 0);
    8020428a:	4581                	li	a1,0
    8020428c:	8556                	mv	a0,s5
    8020428e:	ffffd097          	auipc	ra,0xffffd
    80204292:	4a4080e7          	jalr	1188(ra) # 80201732 <kvmfree>
  if(ep){
    eunlock(ep);
    eput(ep);
  }
  return -1;
    80204296:	557d                	li	a0,-1
  if(ep){
    80204298:	000a0d63          	beqz	s4,802042b2 <exec+0x34e>
    eunlock(ep);
    8020429c:	8552                	mv	a0,s4
    8020429e:	00002097          	auipc	ra,0x2
    802042a2:	5aa080e7          	jalr	1450(ra) # 80206848 <eunlock>
    eput(ep);
    802042a6:	8552                	mv	a0,s4
    802042a8:	00002097          	auipc	ra,0x2
    802042ac:	5ee080e7          	jalr	1518(ra) # 80206896 <eput>
  return -1;
    802042b0:	557d                	li	a0,-1
}
    802042b2:	21813083          	ld	ra,536(sp)
    802042b6:	21013403          	ld	s0,528(sp)
    802042ba:	20813483          	ld	s1,520(sp)
    802042be:	20013903          	ld	s2,512(sp)
    802042c2:	79fe                	ld	s3,504(sp)
    802042c4:	7a5e                	ld	s4,496(sp)
    802042c6:	7abe                	ld	s5,488(sp)
    802042c8:	7b1e                	ld	s6,480(sp)
    802042ca:	6bfe                	ld	s7,472(sp)
    802042cc:	6c5e                	ld	s8,464(sp)
    802042ce:	6cbe                	ld	s9,456(sp)
    802042d0:	6d1e                	ld	s10,448(sp)
    802042d2:	7dfa                	ld	s11,440(sp)
    802042d4:	22010113          	addi	sp,sp,544
    802042d8:	8082                	ret
    802042da:	de943c23          	sd	s1,-520(s0)
    802042de:	b771                	j	8020426a <exec+0x306>
    802042e0:	de943c23          	sd	s1,-520(s0)
    802042e4:	b759                	j	8020426a <exec+0x306>
    802042e6:	de943c23          	sd	s1,-520(s0)
    802042ea:	b741                	j	8020426a <exec+0x306>
  sz = sz1;
    802042ec:	dfa43c23          	sd	s10,-520(s0)
  ep = 0;
    802042f0:	4a01                	li	s4,0
    802042f2:	bfa5                	j	8020426a <exec+0x306>
  sz = sz1;
    802042f4:	dfa43c23          	sd	s10,-520(s0)
  ep = 0;
    802042f8:	4a01                	li	s4,0
    802042fa:	bf85                	j	8020426a <exec+0x306>
  sz = sz1;
    802042fc:	dfa43c23          	sd	s10,-520(s0)
  ep = 0;
    80204300:	4a01                	li	s4,0
    80204302:	b7a5                	j	8020426a <exec+0x306>
    if((sz1 = uvmalloc(pagetable, kpagetable, sz, ph.vaddr + ph.memsz)) == 0)
    80204304:	df843483          	ld	s1,-520(s0)
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    80204308:	2d85                	addiw	s11,s11,1
    8020430a:	e0043783          	ld	a5,-512(s0)
    8020430e:	0387879b          	addiw	a5,a5,56
    80204312:	e8045703          	lhu	a4,-384(s0)
    80204316:	d8eddee3          	bge	s11,a4,802040b2 <exec+0x14e>
    if(eread(ep, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    8020431a:	2781                	sext.w	a5,a5
    8020431c:	e0f43023          	sd	a5,-512(s0)
    80204320:	03800713          	li	a4,56
    80204324:	86be                	mv	a3,a5
    80204326:	e1040613          	addi	a2,s0,-496
    8020432a:	4581                	li	a1,0
    8020432c:	8552                	mv	a0,s4
    8020432e:	00002097          	auipc	ra,0x2
    80204332:	c1a080e7          	jalr	-998(ra) # 80205f48 <eread>
    80204336:	03800793          	li	a5,56
    8020433a:	f2f516e3          	bne	a0,a5,80204266 <exec+0x302>
    if(ph.type != ELF_PROG_LOAD)
    8020433e:	e1042783          	lw	a5,-496(s0)
    80204342:	4705                	li	a4,1
    80204344:	fce792e3          	bne	a5,a4,80204308 <exec+0x3a4>
    if(ph.memsz < ph.filesz)
    80204348:	e3843683          	ld	a3,-456(s0)
    8020434c:	e3043783          	ld	a5,-464(s0)
    80204350:	f8f6e5e3          	bltu	a3,a5,802042da <exec+0x376>
    if(ph.vaddr + ph.memsz < ph.vaddr)
    80204354:	e2043783          	ld	a5,-480(s0)
    80204358:	96be                	add	a3,a3,a5
    8020435a:	f8f6e3e3          	bltu	a3,a5,802042e0 <exec+0x37c>
    if((sz1 = uvmalloc(pagetable, kpagetable, sz, ph.vaddr + ph.memsz)) == 0)
    8020435e:	8626                	mv	a2,s1
    80204360:	85d6                	mv	a1,s5
    80204362:	e0843503          	ld	a0,-504(s0)
    80204366:	ffffd097          	auipc	ra,0xffffd
    8020436a:	d66080e7          	jalr	-666(ra) # 802010cc <uvmalloc>
    8020436e:	dea43c23          	sd	a0,-520(s0)
    80204372:	d935                	beqz	a0,802042e6 <exec+0x382>
    if(ph.vaddr % PGSIZE != 0)
    80204374:	e2043c83          	ld	s9,-480(s0)
    80204378:	de043783          	ld	a5,-544(s0)
    8020437c:	00fcf7b3          	and	a5,s9,a5
    80204380:	ee0795e3          	bnez	a5,8020426a <exec+0x306>
    if(loadseg(pagetable, ph.vaddr, ep, ph.off, ph.filesz) < 0)
    80204384:	e1842d03          	lw	s10,-488(s0)
    80204388:	e3042c03          	lw	s8,-464(s0)
  for(i = 0; i < sz; i += PGSIZE){
    8020438c:	f60c0ce3          	beqz	s8,80204304 <exec+0x3a0>
    80204390:	8962                	mv	s2,s8
    80204392:	4481                	li	s1,0
    80204394:	b9ed                	j	8020408e <exec+0x12a>

0000000080204396 <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
    80204396:	7179                	addi	sp,sp,-48
    80204398:	f406                	sd	ra,40(sp)
    8020439a:	f022                	sd	s0,32(sp)
    8020439c:	ec26                	sd	s1,24(sp)
    8020439e:	e84a                	sd	s2,16(sp)
    802043a0:	1800                	addi	s0,sp,48
    802043a2:	892e                	mv	s2,a1
    802043a4:	84b2                	mv	s1,a2
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    802043a6:	fdc40593          	addi	a1,s0,-36
    802043aa:	fffff097          	auipc	ra,0xfffff
    802043ae:	b04080e7          	jalr	-1276(ra) # 80202eae <argint>
    802043b2:	04054063          	bltz	a0,802043f2 <argfd+0x5c>
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == NULL)
    802043b6:	fdc42703          	lw	a4,-36(s0)
    802043ba:	47bd                	li	a5,15
    802043bc:	02e7ed63          	bltu	a5,a4,802043f6 <argfd+0x60>
    802043c0:	ffffd097          	auipc	ra,0xffffd
    802043c4:	75c080e7          	jalr	1884(ra) # 80201b1c <myproc>
    802043c8:	fdc42703          	lw	a4,-36(s0)
    802043cc:	01a70793          	addi	a5,a4,26
    802043d0:	078e                	slli	a5,a5,0x3
    802043d2:	953e                	add	a0,a0,a5
    802043d4:	651c                	ld	a5,8(a0)
    802043d6:	c395                	beqz	a5,802043fa <argfd+0x64>
    return -1;
  if(pfd)
    802043d8:	00090463          	beqz	s2,802043e0 <argfd+0x4a>
    *pfd = fd;
    802043dc:	00e92023          	sw	a4,0(s2)
  if(pf)
    *pf = f;
  return 0;
    802043e0:	4501                	li	a0,0
  if(pf)
    802043e2:	c091                	beqz	s1,802043e6 <argfd+0x50>
    *pf = f;
    802043e4:	e09c                	sd	a5,0(s1)
}
    802043e6:	70a2                	ld	ra,40(sp)
    802043e8:	7402                	ld	s0,32(sp)
    802043ea:	64e2                	ld	s1,24(sp)
    802043ec:	6942                	ld	s2,16(sp)
    802043ee:	6145                	addi	sp,sp,48
    802043f0:	8082                	ret
    return -1;
    802043f2:	557d                	li	a0,-1
    802043f4:	bfcd                	j	802043e6 <argfd+0x50>
    return -1;
    802043f6:	557d                	li	a0,-1
    802043f8:	b7fd                	j	802043e6 <argfd+0x50>
    802043fa:	557d                	li	a0,-1
    802043fc:	b7ed                	j	802043e6 <argfd+0x50>

00000000802043fe <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
    802043fe:	1101                	addi	sp,sp,-32
    80204400:	ec06                	sd	ra,24(sp)
    80204402:	e822                	sd	s0,16(sp)
    80204404:	e426                	sd	s1,8(sp)
    80204406:	1000                	addi	s0,sp,32
    80204408:	84aa                	mv	s1,a0
  int fd;
  struct proc *p = myproc();
    8020440a:	ffffd097          	auipc	ra,0xffffd
    8020440e:	712080e7          	jalr	1810(ra) # 80201b1c <myproc>
    80204412:	862a                	mv	a2,a0

  for(fd = 0; fd < NOFILE; fd++){
    80204414:	0d850793          	addi	a5,a0,216
    80204418:	4501                	li	a0,0
    8020441a:	46c1                	li	a3,16
    if(p->ofile[fd] == 0){
    8020441c:	6398                	ld	a4,0(a5)
    8020441e:	cb19                	beqz	a4,80204434 <fdalloc+0x36>
  for(fd = 0; fd < NOFILE; fd++){
    80204420:	2505                	addiw	a0,a0,1
    80204422:	07a1                	addi	a5,a5,8
    80204424:	fed51ce3          	bne	a0,a3,8020441c <fdalloc+0x1e>
      p->ofile[fd] = f;
      return fd;
    }
  }
  return -1;
    80204428:	557d                	li	a0,-1
}
    8020442a:	60e2                	ld	ra,24(sp)
    8020442c:	6442                	ld	s0,16(sp)
    8020442e:	64a2                	ld	s1,8(sp)
    80204430:	6105                	addi	sp,sp,32
    80204432:	8082                	ret
      p->ofile[fd] = f;
    80204434:	01a50793          	addi	a5,a0,26
    80204438:	078e                	slli	a5,a5,0x3
    8020443a:	963e                	add	a2,a2,a5
    8020443c:	e604                	sd	s1,8(a2)
      return fd;
    8020443e:	b7f5                	j	8020442a <fdalloc+0x2c>

0000000080204440 <create>:
  return filestat(f, st);
}

static struct dirent*
create(char *path, short type, int mode)
{
    80204440:	7169                	addi	sp,sp,-304
    80204442:	f606                	sd	ra,296(sp)
    80204444:	f222                	sd	s0,288(sp)
    80204446:	ee26                	sd	s1,280(sp)
    80204448:	ea4a                	sd	s2,272(sp)
    8020444a:	e64e                	sd	s3,264(sp)
    8020444c:	1a00                	addi	s0,sp,304
    8020444e:	89ae                	mv	s3,a1
  struct dirent *ep, *dp;
  char name[FAT32_MAX_FILENAME + 1];

  if((dp = enameparent(path, name)) == NULL)
    80204450:	ed040593          	addi	a1,s0,-304
    80204454:	00003097          	auipc	ra,0x3
    80204458:	b7c080e7          	jalr	-1156(ra) # 80206fd0 <enameparent>
    8020445c:	84aa                	mv	s1,a0
    8020445e:	cd3d                	beqz	a0,802044dc <create+0x9c>
    return NULL;

  if (type == T_DIR) {
    80204460:	0009879b          	sext.w	a5,s3
    80204464:	4705                	li	a4,1
    80204466:	06e78d63          	beq	a5,a4,802044e0 <create+0xa0>
    mode = ATTR_READ_ONLY;
  } else {
    mode = 0;  
  }

  elock(dp);
    8020446a:	00002097          	auipc	ra,0x2
    8020446e:	3a8080e7          	jalr	936(ra) # 80206812 <elock>
  if ((ep = ealloc(dp, name, mode)) == NULL) {
    80204472:	4601                	li	a2,0
    80204474:	ed040593          	addi	a1,s0,-304
    80204478:	8526                	mv	a0,s1
    8020447a:	00003097          	auipc	ra,0x3
    8020447e:	880080e7          	jalr	-1920(ra) # 80206cfa <ealloc>
    80204482:	892a                	mv	s2,a0
    80204484:	c121                	beqz	a0,802044c4 <create+0x84>
    eunlock(dp);
    eput(dp);
    return NULL;
  }
  
  if ((type == T_DIR && !(ep->attribute & ATTR_DIRECTORY)) ||
    80204486:	2981                	sext.w	s3,s3
    80204488:	4789                	li	a5,2
    8020448a:	00f99663          	bne	s3,a5,80204496 <create+0x56>
      (type == T_FILE && (ep->attribute & ATTR_DIRECTORY))) {
    8020448e:	10094783          	lbu	a5,256(s2)
    80204492:	8bc1                	andi	a5,a5,16
    80204494:	eba5                	bnez	a5,80204504 <create+0xc4>
    eput(ep);
    eput(dp);
    return NULL;
  }

  eunlock(dp);
    80204496:	8526                	mv	a0,s1
    80204498:	00002097          	auipc	ra,0x2
    8020449c:	3b0080e7          	jalr	944(ra) # 80206848 <eunlock>
  eput(dp);
    802044a0:	8526                	mv	a0,s1
    802044a2:	00002097          	auipc	ra,0x2
    802044a6:	3f4080e7          	jalr	1012(ra) # 80206896 <eput>

  elock(ep);
    802044aa:	854a                	mv	a0,s2
    802044ac:	00002097          	auipc	ra,0x2
    802044b0:	366080e7          	jalr	870(ra) # 80206812 <elock>
  return ep;
}
    802044b4:	854a                	mv	a0,s2
    802044b6:	70b2                	ld	ra,296(sp)
    802044b8:	7412                	ld	s0,288(sp)
    802044ba:	64f2                	ld	s1,280(sp)
    802044bc:	6952                	ld	s2,272(sp)
    802044be:	69b2                	ld	s3,264(sp)
    802044c0:	6155                	addi	sp,sp,304
    802044c2:	8082                	ret
    eunlock(dp);
    802044c4:	8526                	mv	a0,s1
    802044c6:	00002097          	auipc	ra,0x2
    802044ca:	382080e7          	jalr	898(ra) # 80206848 <eunlock>
    eput(dp);
    802044ce:	8526                	mv	a0,s1
    802044d0:	00002097          	auipc	ra,0x2
    802044d4:	3c6080e7          	jalr	966(ra) # 80206896 <eput>
    return NULL;
    802044d8:	4901                	li	s2,0
    802044da:	bfe9                	j	802044b4 <create+0x74>
    return NULL;
    802044dc:	892a                	mv	s2,a0
    802044de:	bfd9                	j	802044b4 <create+0x74>
  elock(dp);
    802044e0:	00002097          	auipc	ra,0x2
    802044e4:	332080e7          	jalr	818(ra) # 80206812 <elock>
  if ((ep = ealloc(dp, name, mode)) == NULL) {
    802044e8:	4641                	li	a2,16
    802044ea:	ed040593          	addi	a1,s0,-304
    802044ee:	8526                	mv	a0,s1
    802044f0:	00003097          	auipc	ra,0x3
    802044f4:	80a080e7          	jalr	-2038(ra) # 80206cfa <ealloc>
    802044f8:	892a                	mv	s2,a0
    802044fa:	d569                	beqz	a0,802044c4 <create+0x84>
  if ((type == T_DIR && !(ep->attribute & ATTR_DIRECTORY)) ||
    802044fc:	10094783          	lbu	a5,256(s2)
    80204500:	8bc1                	andi	a5,a5,16
    80204502:	fbd1                	bnez	a5,80204496 <create+0x56>
    eunlock(dp);
    80204504:	8526                	mv	a0,s1
    80204506:	00002097          	auipc	ra,0x2
    8020450a:	342080e7          	jalr	834(ra) # 80206848 <eunlock>
    eput(ep);
    8020450e:	854a                	mv	a0,s2
    80204510:	00002097          	auipc	ra,0x2
    80204514:	386080e7          	jalr	902(ra) # 80206896 <eput>
    eput(dp);
    80204518:	8526                	mv	a0,s1
    8020451a:	00002097          	auipc	ra,0x2
    8020451e:	37c080e7          	jalr	892(ra) # 80206896 <eput>
    return NULL;
    80204522:	4901                	li	s2,0
    80204524:	bf41                	j	802044b4 <create+0x74>

0000000080204526 <sys_dup>:
{
    80204526:	7179                	addi	sp,sp,-48
    80204528:	f406                	sd	ra,40(sp)
    8020452a:	f022                	sd	s0,32(sp)
    8020452c:	ec26                	sd	s1,24(sp)
    8020452e:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0)
    80204530:	fd840613          	addi	a2,s0,-40
    80204534:	4581                	li	a1,0
    80204536:	4501                	li	a0,0
    80204538:	00000097          	auipc	ra,0x0
    8020453c:	e5e080e7          	jalr	-418(ra) # 80204396 <argfd>
    return -1;
    80204540:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0)
    80204542:	02054363          	bltz	a0,80204568 <sys_dup+0x42>
  if((fd=fdalloc(f)) < 0)
    80204546:	fd843503          	ld	a0,-40(s0)
    8020454a:	00000097          	auipc	ra,0x0
    8020454e:	eb4080e7          	jalr	-332(ra) # 802043fe <fdalloc>
    80204552:	84aa                	mv	s1,a0
    return -1;
    80204554:	57fd                	li	a5,-1
  if((fd=fdalloc(f)) < 0)
    80204556:	00054963          	bltz	a0,80204568 <sys_dup+0x42>
  filedup(f);
    8020455a:	fd843503          	ld	a0,-40(s0)
    8020455e:	fffff097          	auipc	ra,0xfffff
    80204562:	2fe080e7          	jalr	766(ra) # 8020385c <filedup>
  return fd;
    80204566:	87a6                	mv	a5,s1
}
    80204568:	853e                	mv	a0,a5
    8020456a:	70a2                	ld	ra,40(sp)
    8020456c:	7402                	ld	s0,32(sp)
    8020456e:	64e2                	ld	s1,24(sp)
    80204570:	6145                	addi	sp,sp,48
    80204572:	8082                	ret

0000000080204574 <sys_read>:
{
    80204574:	7179                	addi	sp,sp,-48
    80204576:	f406                	sd	ra,40(sp)
    80204578:	f022                	sd	s0,32(sp)
    8020457a:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    8020457c:	fe840613          	addi	a2,s0,-24
    80204580:	4581                	li	a1,0
    80204582:	4501                	li	a0,0
    80204584:	00000097          	auipc	ra,0x0
    80204588:	e12080e7          	jalr	-494(ra) # 80204396 <argfd>
    return -1;
    8020458c:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    8020458e:	04054163          	bltz	a0,802045d0 <sys_read+0x5c>
    80204592:	fe440593          	addi	a1,s0,-28
    80204596:	4509                	li	a0,2
    80204598:	fffff097          	auipc	ra,0xfffff
    8020459c:	916080e7          	jalr	-1770(ra) # 80202eae <argint>
    return -1;
    802045a0:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    802045a2:	02054763          	bltz	a0,802045d0 <sys_read+0x5c>
    802045a6:	fd840593          	addi	a1,s0,-40
    802045aa:	4505                	li	a0,1
    802045ac:	fffff097          	auipc	ra,0xfffff
    802045b0:	964080e7          	jalr	-1692(ra) # 80202f10 <argaddr>
    return -1;
    802045b4:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    802045b6:	00054d63          	bltz	a0,802045d0 <sys_read+0x5c>
  return fileread(f, p, n);
    802045ba:	fe442603          	lw	a2,-28(s0)
    802045be:	fd843583          	ld	a1,-40(s0)
    802045c2:	fe843503          	ld	a0,-24(s0)
    802045c6:	fffff097          	auipc	ra,0xfffff
    802045ca:	3fe080e7          	jalr	1022(ra) # 802039c4 <fileread>
    802045ce:	87aa                	mv	a5,a0
}
    802045d0:	853e                	mv	a0,a5
    802045d2:	70a2                	ld	ra,40(sp)
    802045d4:	7402                	ld	s0,32(sp)
    802045d6:	6145                	addi	sp,sp,48
    802045d8:	8082                	ret

00000000802045da <sys_write>:
{
    802045da:	7179                	addi	sp,sp,-48
    802045dc:	f406                	sd	ra,40(sp)
    802045de:	f022                	sd	s0,32(sp)
    802045e0:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    802045e2:	fe840613          	addi	a2,s0,-24
    802045e6:	4581                	li	a1,0
    802045e8:	4501                	li	a0,0
    802045ea:	00000097          	auipc	ra,0x0
    802045ee:	dac080e7          	jalr	-596(ra) # 80204396 <argfd>
    return -1;
    802045f2:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    802045f4:	04054163          	bltz	a0,80204636 <sys_write+0x5c>
    802045f8:	fe440593          	addi	a1,s0,-28
    802045fc:	4509                	li	a0,2
    802045fe:	fffff097          	auipc	ra,0xfffff
    80204602:	8b0080e7          	jalr	-1872(ra) # 80202eae <argint>
    return -1;
    80204606:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204608:	02054763          	bltz	a0,80204636 <sys_write+0x5c>
    8020460c:	fd840593          	addi	a1,s0,-40
    80204610:	4505                	li	a0,1
    80204612:	fffff097          	auipc	ra,0xfffff
    80204616:	8fe080e7          	jalr	-1794(ra) # 80202f10 <argaddr>
    return -1;
    8020461a:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    8020461c:	00054d63          	bltz	a0,80204636 <sys_write+0x5c>
  return filewrite(f, p, n);
    80204620:	fe442603          	lw	a2,-28(s0)
    80204624:	fd843583          	ld	a1,-40(s0)
    80204628:	fe843503          	ld	a0,-24(s0)
    8020462c:	fffff097          	auipc	ra,0xfffff
    80204630:	45a080e7          	jalr	1114(ra) # 80203a86 <filewrite>
    80204634:	87aa                	mv	a5,a0
}
    80204636:	853e                	mv	a0,a5
    80204638:	70a2                	ld	ra,40(sp)
    8020463a:	7402                	ld	s0,32(sp)
    8020463c:	6145                	addi	sp,sp,48
    8020463e:	8082                	ret

0000000080204640 <sys_close>:
{
    80204640:	1101                	addi	sp,sp,-32
    80204642:	ec06                	sd	ra,24(sp)
    80204644:	e822                	sd	s0,16(sp)
    80204646:	1000                	addi	s0,sp,32
  if(argfd(0, &fd, &f) < 0)
    80204648:	fe040613          	addi	a2,s0,-32
    8020464c:	fec40593          	addi	a1,s0,-20
    80204650:	4501                	li	a0,0
    80204652:	00000097          	auipc	ra,0x0
    80204656:	d44080e7          	jalr	-700(ra) # 80204396 <argfd>
    return -1;
    8020465a:	57fd                	li	a5,-1
  if(argfd(0, &fd, &f) < 0)
    8020465c:	02054463          	bltz	a0,80204684 <sys_close+0x44>
  myproc()->ofile[fd] = 0;
    80204660:	ffffd097          	auipc	ra,0xffffd
    80204664:	4bc080e7          	jalr	1212(ra) # 80201b1c <myproc>
    80204668:	fec42783          	lw	a5,-20(s0)
    8020466c:	07e9                	addi	a5,a5,26
    8020466e:	078e                	slli	a5,a5,0x3
    80204670:	97aa                	add	a5,a5,a0
    80204672:	0007b423          	sd	zero,8(a5)
  fileclose(f);
    80204676:	fe043503          	ld	a0,-32(s0)
    8020467a:	fffff097          	auipc	ra,0xfffff
    8020467e:	234080e7          	jalr	564(ra) # 802038ae <fileclose>
  return 0;
    80204682:	4781                	li	a5,0
}
    80204684:	853e                	mv	a0,a5
    80204686:	60e2                	ld	ra,24(sp)
    80204688:	6442                	ld	s0,16(sp)
    8020468a:	6105                	addi	sp,sp,32
    8020468c:	8082                	ret

000000008020468e <sys_fstat>:
{
    8020468e:	1101                	addi	sp,sp,-32
    80204690:	ec06                	sd	ra,24(sp)
    80204692:	e822                	sd	s0,16(sp)
    80204694:	1000                	addi	s0,sp,32
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204696:	fe840613          	addi	a2,s0,-24
    8020469a:	4581                	li	a1,0
    8020469c:	4501                	li	a0,0
    8020469e:	00000097          	auipc	ra,0x0
    802046a2:	cf8080e7          	jalr	-776(ra) # 80204396 <argfd>
    return -1;
    802046a6:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    802046a8:	02054563          	bltz	a0,802046d2 <sys_fstat+0x44>
    802046ac:	fe040593          	addi	a1,s0,-32
    802046b0:	4505                	li	a0,1
    802046b2:	fffff097          	auipc	ra,0xfffff
    802046b6:	85e080e7          	jalr	-1954(ra) # 80202f10 <argaddr>
    return -1;
    802046ba:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    802046bc:	00054b63          	bltz	a0,802046d2 <sys_fstat+0x44>
  return filestat(f, st);
    802046c0:	fe043583          	ld	a1,-32(s0)
    802046c4:	fe843503          	ld	a0,-24(s0)
    802046c8:	fffff097          	auipc	ra,0xfffff
    802046cc:	29c080e7          	jalr	668(ra) # 80203964 <filestat>
    802046d0:	87aa                	mv	a5,a0
}
    802046d2:	853e                	mv	a0,a5
    802046d4:	60e2                	ld	ra,24(sp)
    802046d6:	6442                	ld	s0,16(sp)
    802046d8:	6105                	addi	sp,sp,32
    802046da:	8082                	ret

00000000802046dc <sys_open>:

uint64
sys_open(void)
{
    802046dc:	7129                	addi	sp,sp,-320
    802046de:	fe06                	sd	ra,312(sp)
    802046e0:	fa22                	sd	s0,304(sp)
    802046e2:	f626                	sd	s1,296(sp)
    802046e4:	f24a                	sd	s2,288(sp)
    802046e6:	ee4e                	sd	s3,280(sp)
    802046e8:	0280                	addi	s0,sp,320
  char path[FAT32_MAX_PATH];
  int fd, omode;
  struct file *f;
  struct dirent *ep;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argint(1, &omode) < 0)
    802046ea:	10400613          	li	a2,260
    802046ee:	ec840593          	addi	a1,s0,-312
    802046f2:	4501                	li	a0,0
    802046f4:	fffff097          	auipc	ra,0xfffff
    802046f8:	83e080e7          	jalr	-1986(ra) # 80202f32 <argstr>
    802046fc:	87aa                	mv	a5,a0
    return -1;
    802046fe:	557d                	li	a0,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argint(1, &omode) < 0)
    80204700:	0807ce63          	bltz	a5,8020479c <sys_open+0xc0>
    80204704:	ec440593          	addi	a1,s0,-316
    80204708:	4505                	li	a0,1
    8020470a:	ffffe097          	auipc	ra,0xffffe
    8020470e:	7a4080e7          	jalr	1956(ra) # 80202eae <argint>
    80204712:	0e054163          	bltz	a0,802047f4 <sys_open+0x118>

  if(omode & O_CREATE){
    80204716:	ec442603          	lw	a2,-316(s0)
    8020471a:	20067793          	andi	a5,a2,512
    8020471e:	c7d1                	beqz	a5,802047aa <sys_open+0xce>
    ep = create(path, T_FILE, omode);
    80204720:	4589                	li	a1,2
    80204722:	ec840513          	addi	a0,s0,-312
    80204726:	00000097          	auipc	ra,0x0
    8020472a:	d1a080e7          	jalr	-742(ra) # 80204440 <create>
    8020472e:	892a                	mv	s2,a0
    if(ep == NULL){
    80204730:	c561                	beqz	a0,802047f8 <sys_open+0x11c>
      eput(ep);
      return -1;
    }
  }

  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    80204732:	fffff097          	auipc	ra,0xfffff
    80204736:	0c0080e7          	jalr	192(ra) # 802037f2 <filealloc>
    8020473a:	89aa                	mv	s3,a0
    8020473c:	c579                	beqz	a0,8020480a <sys_open+0x12e>
    8020473e:	00000097          	auipc	ra,0x0
    80204742:	cc0080e7          	jalr	-832(ra) # 802043fe <fdalloc>
    80204746:	84aa                	mv	s1,a0
    80204748:	0a054c63          	bltz	a0,80204800 <sys_open+0x124>
    eunlock(ep);
    eput(ep);
    return -1;
  }

  if(!(ep->attribute & ATTR_DIRECTORY) && (omode & O_TRUNC)){
    8020474c:	10094783          	lbu	a5,256(s2)
    80204750:	8bc1                	andi	a5,a5,16
    80204752:	e791                	bnez	a5,8020475e <sys_open+0x82>
    80204754:	ec442783          	lw	a5,-316(s0)
    80204758:	4007f793          	andi	a5,a5,1024
    8020475c:	e7d1                	bnez	a5,802047e8 <sys_open+0x10c>
    etrunc(ep);
  }

  f->type = FD_ENTRY;
    8020475e:	4789                	li	a5,2
    80204760:	00f9a023          	sw	a5,0(s3)
  f->off = (omode & O_APPEND) ? ep->file_size : 0;
    80204764:	ec442783          	lw	a5,-316(s0)
    80204768:	0047f693          	andi	a3,a5,4
    8020476c:	4701                	li	a4,0
    8020476e:	c299                	beqz	a3,80204774 <sys_open+0x98>
    80204770:	10892703          	lw	a4,264(s2)
    80204774:	02e9a023          	sw	a4,32(s3)
  f->ep = ep;
    80204778:	0129bc23          	sd	s2,24(s3)
  f->readable = !(omode & O_WRONLY);
    8020477c:	0017c713          	xori	a4,a5,1
    80204780:	8b05                	andi	a4,a4,1
    80204782:	00e98423          	sb	a4,8(s3)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80204786:	8b8d                	andi	a5,a5,3
    80204788:	00f037b3          	snez	a5,a5
    8020478c:	00f984a3          	sb	a5,9(s3)

  eunlock(ep);
    80204790:	854a                	mv	a0,s2
    80204792:	00002097          	auipc	ra,0x2
    80204796:	0b6080e7          	jalr	182(ra) # 80206848 <eunlock>

  return fd;
    8020479a:	8526                	mv	a0,s1
}
    8020479c:	70f2                	ld	ra,312(sp)
    8020479e:	7452                	ld	s0,304(sp)
    802047a0:	74b2                	ld	s1,296(sp)
    802047a2:	7912                	ld	s2,288(sp)
    802047a4:	69f2                	ld	s3,280(sp)
    802047a6:	6131                	addi	sp,sp,320
    802047a8:	8082                	ret
    if((ep = ename(path)) == NULL){
    802047aa:	ec840513          	addi	a0,s0,-312
    802047ae:	00003097          	auipc	ra,0x3
    802047b2:	804080e7          	jalr	-2044(ra) # 80206fb2 <ename>
    802047b6:	892a                	mv	s2,a0
    802047b8:	c131                	beqz	a0,802047fc <sys_open+0x120>
    elock(ep);
    802047ba:	00002097          	auipc	ra,0x2
    802047be:	058080e7          	jalr	88(ra) # 80206812 <elock>
    if((ep->attribute & ATTR_DIRECTORY) && omode != O_RDONLY){
    802047c2:	10094783          	lbu	a5,256(s2)
    802047c6:	8bc1                	andi	a5,a5,16
    802047c8:	d7ad                	beqz	a5,80204732 <sys_open+0x56>
    802047ca:	ec442783          	lw	a5,-316(s0)
    802047ce:	d3b5                	beqz	a5,80204732 <sys_open+0x56>
      eunlock(ep);
    802047d0:	854a                	mv	a0,s2
    802047d2:	00002097          	auipc	ra,0x2
    802047d6:	076080e7          	jalr	118(ra) # 80206848 <eunlock>
      eput(ep);
    802047da:	854a                	mv	a0,s2
    802047dc:	00002097          	auipc	ra,0x2
    802047e0:	0ba080e7          	jalr	186(ra) # 80206896 <eput>
      return -1;
    802047e4:	557d                	li	a0,-1
    802047e6:	bf5d                	j	8020479c <sys_open+0xc0>
    etrunc(ep);
    802047e8:	854a                	mv	a0,s2
    802047ea:	00002097          	auipc	ra,0x2
    802047ee:	fbe080e7          	jalr	-66(ra) # 802067a8 <etrunc>
    802047f2:	b7b5                	j	8020475e <sys_open+0x82>
    return -1;
    802047f4:	557d                	li	a0,-1
    802047f6:	b75d                	j	8020479c <sys_open+0xc0>
      return -1;
    802047f8:	557d                	li	a0,-1
    802047fa:	b74d                	j	8020479c <sys_open+0xc0>
      return -1;
    802047fc:	557d                	li	a0,-1
    802047fe:	bf79                	j	8020479c <sys_open+0xc0>
      fileclose(f);
    80204800:	854e                	mv	a0,s3
    80204802:	fffff097          	auipc	ra,0xfffff
    80204806:	0ac080e7          	jalr	172(ra) # 802038ae <fileclose>
    eunlock(ep);
    8020480a:	854a                	mv	a0,s2
    8020480c:	00002097          	auipc	ra,0x2
    80204810:	03c080e7          	jalr	60(ra) # 80206848 <eunlock>
    eput(ep);
    80204814:	854a                	mv	a0,s2
    80204816:	00002097          	auipc	ra,0x2
    8020481a:	080080e7          	jalr	128(ra) # 80206896 <eput>
    return -1;
    8020481e:	557d                	li	a0,-1
    80204820:	bfb5                	j	8020479c <sys_open+0xc0>

0000000080204822 <sys_mkdir>:

uint64
sys_mkdir(void)
{
    80204822:	7169                	addi	sp,sp,-304
    80204824:	f606                	sd	ra,296(sp)
    80204826:	f222                	sd	s0,288(sp)
    80204828:	ee26                	sd	s1,280(sp)
    8020482a:	1a00                	addi	s0,sp,304
  char path[FAT32_MAX_PATH];
  struct dirent *ep;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = create(path, T_DIR, 0)) == 0){
    8020482c:	10400613          	li	a2,260
    80204830:	ed840593          	addi	a1,s0,-296
    80204834:	4501                	li	a0,0
    80204836:	ffffe097          	auipc	ra,0xffffe
    8020483a:	6fc080e7          	jalr	1788(ra) # 80202f32 <argstr>
    return -1;
    8020483e:	57fd                	li	a5,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = create(path, T_DIR, 0)) == 0){
    80204840:	02054663          	bltz	a0,8020486c <sys_mkdir+0x4a>
    80204844:	4601                	li	a2,0
    80204846:	4585                	li	a1,1
    80204848:	ed840513          	addi	a0,s0,-296
    8020484c:	00000097          	auipc	ra,0x0
    80204850:	bf4080e7          	jalr	-1036(ra) # 80204440 <create>
    80204854:	84aa                	mv	s1,a0
    80204856:	c10d                	beqz	a0,80204878 <sys_mkdir+0x56>
  }
  eunlock(ep);
    80204858:	00002097          	auipc	ra,0x2
    8020485c:	ff0080e7          	jalr	-16(ra) # 80206848 <eunlock>
  eput(ep);
    80204860:	8526                	mv	a0,s1
    80204862:	00002097          	auipc	ra,0x2
    80204866:	034080e7          	jalr	52(ra) # 80206896 <eput>
  return 0;
    8020486a:	4781                	li	a5,0
}
    8020486c:	853e                	mv	a0,a5
    8020486e:	70b2                	ld	ra,296(sp)
    80204870:	7412                	ld	s0,288(sp)
    80204872:	64f2                	ld	s1,280(sp)
    80204874:	6155                	addi	sp,sp,304
    80204876:	8082                	ret
    return -1;
    80204878:	57fd                	li	a5,-1
    8020487a:	bfcd                	j	8020486c <sys_mkdir+0x4a>

000000008020487c <sys_chdir>:

uint64
sys_chdir(void)
{
    8020487c:	7169                	addi	sp,sp,-304
    8020487e:	f606                	sd	ra,296(sp)
    80204880:	f222                	sd	s0,288(sp)
    80204882:	ee26                	sd	s1,280(sp)
    80204884:	ea4a                	sd	s2,272(sp)
    80204886:	1a00                	addi	s0,sp,304
  char path[FAT32_MAX_PATH];
  struct dirent *ep;
  struct proc *p = myproc();
    80204888:	ffffd097          	auipc	ra,0xffffd
    8020488c:	294080e7          	jalr	660(ra) # 80201b1c <myproc>
    80204890:	892a                	mv	s2,a0
  
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = ename(path)) == NULL){
    80204892:	10400613          	li	a2,260
    80204896:	ed840593          	addi	a1,s0,-296
    8020489a:	4501                	li	a0,0
    8020489c:	ffffe097          	auipc	ra,0xffffe
    802048a0:	696080e7          	jalr	1686(ra) # 80202f32 <argstr>
    return -1;
    802048a4:	57fd                	li	a5,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = ename(path)) == NULL){
    802048a6:	04054063          	bltz	a0,802048e6 <sys_chdir+0x6a>
    802048aa:	ed840513          	addi	a0,s0,-296
    802048ae:	00002097          	auipc	ra,0x2
    802048b2:	704080e7          	jalr	1796(ra) # 80206fb2 <ename>
    802048b6:	84aa                	mv	s1,a0
    802048b8:	c931                	beqz	a0,8020490c <sys_chdir+0x90>
  }
  elock(ep);
    802048ba:	00002097          	auipc	ra,0x2
    802048be:	f58080e7          	jalr	-168(ra) # 80206812 <elock>
  if(!(ep->attribute & ATTR_DIRECTORY)){
    802048c2:	1004c783          	lbu	a5,256(s1)
    802048c6:	8bc1                	andi	a5,a5,16
    802048c8:	c795                	beqz	a5,802048f4 <sys_chdir+0x78>
    eunlock(ep);
    eput(ep);
    return -1;
  }
  eunlock(ep);
    802048ca:	8526                	mv	a0,s1
    802048cc:	00002097          	auipc	ra,0x2
    802048d0:	f7c080e7          	jalr	-132(ra) # 80206848 <eunlock>
  eput(p->cwd);
    802048d4:	15893503          	ld	a0,344(s2)
    802048d8:	00002097          	auipc	ra,0x2
    802048dc:	fbe080e7          	jalr	-66(ra) # 80206896 <eput>
  p->cwd = ep;
    802048e0:	14993c23          	sd	s1,344(s2)
  return 0;
    802048e4:	4781                	li	a5,0
}
    802048e6:	853e                	mv	a0,a5
    802048e8:	70b2                	ld	ra,296(sp)
    802048ea:	7412                	ld	s0,288(sp)
    802048ec:	64f2                	ld	s1,280(sp)
    802048ee:	6952                	ld	s2,272(sp)
    802048f0:	6155                	addi	sp,sp,304
    802048f2:	8082                	ret
    eunlock(ep);
    802048f4:	8526                	mv	a0,s1
    802048f6:	00002097          	auipc	ra,0x2
    802048fa:	f52080e7          	jalr	-174(ra) # 80206848 <eunlock>
    eput(ep);
    802048fe:	8526                	mv	a0,s1
    80204900:	00002097          	auipc	ra,0x2
    80204904:	f96080e7          	jalr	-106(ra) # 80206896 <eput>
    return -1;
    80204908:	57fd                	li	a5,-1
    8020490a:	bff1                	j	802048e6 <sys_chdir+0x6a>
    return -1;
    8020490c:	57fd                	li	a5,-1
    8020490e:	bfe1                	j	802048e6 <sys_chdir+0x6a>

0000000080204910 <sys_pipe>:

uint64
sys_pipe(void)
{
    80204910:	7139                	addi	sp,sp,-64
    80204912:	fc06                	sd	ra,56(sp)
    80204914:	f822                	sd	s0,48(sp)
    80204916:	f426                	sd	s1,40(sp)
    80204918:	0080                	addi	s0,sp,64
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();
    8020491a:	ffffd097          	auipc	ra,0xffffd
    8020491e:	202080e7          	jalr	514(ra) # 80201b1c <myproc>
    80204922:	84aa                	mv	s1,a0

  if(argaddr(0, &fdarray) < 0)
    80204924:	fd840593          	addi	a1,s0,-40
    80204928:	4501                	li	a0,0
    8020492a:	ffffe097          	auipc	ra,0xffffe
    8020492e:	5e6080e7          	jalr	1510(ra) # 80202f10 <argaddr>
    return -1;
    80204932:	57fd                	li	a5,-1
  if(argaddr(0, &fdarray) < 0)
    80204934:	0c054e63          	bltz	a0,80204a10 <sys_pipe+0x100>
  if(pipealloc(&rf, &wf) < 0)
    80204938:	fc840593          	addi	a1,s0,-56
    8020493c:	fd040513          	addi	a0,s0,-48
    80204940:	fffff097          	auipc	ra,0xfffff
    80204944:	2d2080e7          	jalr	722(ra) # 80203c12 <pipealloc>
    return -1;
    80204948:	57fd                	li	a5,-1
  if(pipealloc(&rf, &wf) < 0)
    8020494a:	0c054363          	bltz	a0,80204a10 <sys_pipe+0x100>
  fd0 = -1;
    8020494e:	fcf42223          	sw	a5,-60(s0)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    80204952:	fd043503          	ld	a0,-48(s0)
    80204956:	00000097          	auipc	ra,0x0
    8020495a:	aa8080e7          	jalr	-1368(ra) # 802043fe <fdalloc>
    8020495e:	fca42223          	sw	a0,-60(s0)
    80204962:	08054a63          	bltz	a0,802049f6 <sys_pipe+0xe6>
    80204966:	fc843503          	ld	a0,-56(s0)
    8020496a:	00000097          	auipc	ra,0x0
    8020496e:	a94080e7          	jalr	-1388(ra) # 802043fe <fdalloc>
    80204972:	fca42023          	sw	a0,-64(s0)
    80204976:	06054663          	bltz	a0,802049e2 <sys_pipe+0xd2>
    fileclose(wf);
    return -1;
  }
  // if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
  //    copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
  if(copyout2(fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    8020497a:	4611                	li	a2,4
    8020497c:	fc440593          	addi	a1,s0,-60
    80204980:	fd843503          	ld	a0,-40(s0)
    80204984:	ffffd097          	auipc	ra,0xffffd
    80204988:	aac080e7          	jalr	-1364(ra) # 80201430 <copyout2>
    8020498c:	00054f63          	bltz	a0,802049aa <sys_pipe+0x9a>
     copyout2(fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    80204990:	4611                	li	a2,4
    80204992:	fc040593          	addi	a1,s0,-64
    80204996:	fd843503          	ld	a0,-40(s0)
    8020499a:	0511                	addi	a0,a0,4
    8020499c:	ffffd097          	auipc	ra,0xffffd
    802049a0:	a94080e7          	jalr	-1388(ra) # 80201430 <copyout2>
    p->ofile[fd1] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  return 0;
    802049a4:	4781                	li	a5,0
  if(copyout2(fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    802049a6:	06055563          	bgez	a0,80204a10 <sys_pipe+0x100>
    p->ofile[fd0] = 0;
    802049aa:	fc442783          	lw	a5,-60(s0)
    802049ae:	07e9                	addi	a5,a5,26
    802049b0:	078e                	slli	a5,a5,0x3
    802049b2:	97a6                	add	a5,a5,s1
    802049b4:	0007b423          	sd	zero,8(a5)
    p->ofile[fd1] = 0;
    802049b8:	fc042503          	lw	a0,-64(s0)
    802049bc:	0569                	addi	a0,a0,26
    802049be:	050e                	slli	a0,a0,0x3
    802049c0:	9526                	add	a0,a0,s1
    802049c2:	00053423          	sd	zero,8(a0)
    fileclose(rf);
    802049c6:	fd043503          	ld	a0,-48(s0)
    802049ca:	fffff097          	auipc	ra,0xfffff
    802049ce:	ee4080e7          	jalr	-284(ra) # 802038ae <fileclose>
    fileclose(wf);
    802049d2:	fc843503          	ld	a0,-56(s0)
    802049d6:	fffff097          	auipc	ra,0xfffff
    802049da:	ed8080e7          	jalr	-296(ra) # 802038ae <fileclose>
    return -1;
    802049de:	57fd                	li	a5,-1
    802049e0:	a805                	j	80204a10 <sys_pipe+0x100>
    if(fd0 >= 0)
    802049e2:	fc442783          	lw	a5,-60(s0)
    802049e6:	0007c863          	bltz	a5,802049f6 <sys_pipe+0xe6>
      p->ofile[fd0] = 0;
    802049ea:	01a78513          	addi	a0,a5,26
    802049ee:	050e                	slli	a0,a0,0x3
    802049f0:	9526                	add	a0,a0,s1
    802049f2:	00053423          	sd	zero,8(a0)
    fileclose(rf);
    802049f6:	fd043503          	ld	a0,-48(s0)
    802049fa:	fffff097          	auipc	ra,0xfffff
    802049fe:	eb4080e7          	jalr	-332(ra) # 802038ae <fileclose>
    fileclose(wf);
    80204a02:	fc843503          	ld	a0,-56(s0)
    80204a06:	fffff097          	auipc	ra,0xfffff
    80204a0a:	ea8080e7          	jalr	-344(ra) # 802038ae <fileclose>
    return -1;
    80204a0e:	57fd                	li	a5,-1
}
    80204a10:	853e                	mv	a0,a5
    80204a12:	70e2                	ld	ra,56(sp)
    80204a14:	7442                	ld	s0,48(sp)
    80204a16:	74a2                	ld	s1,40(sp)
    80204a18:	6121                	addi	sp,sp,64
    80204a1a:	8082                	ret

0000000080204a1c <sys_dev>:

// To open console device.
uint64
sys_dev(void)
{
    80204a1c:	7179                	addi	sp,sp,-48
    80204a1e:	f406                	sd	ra,40(sp)
    80204a20:	f022                	sd	s0,32(sp)
    80204a22:	ec26                	sd	s1,24(sp)
    80204a24:	1800                	addi	s0,sp,48
  int fd, omode;
  int major, minor;
  struct file *f;

  if(argint(0, &omode) < 0 || argint(1, &major) < 0 || argint(2, &minor) < 0){
    80204a26:	fdc40593          	addi	a1,s0,-36
    80204a2a:	4501                	li	a0,0
    80204a2c:	ffffe097          	auipc	ra,0xffffe
    80204a30:	482080e7          	jalr	1154(ra) # 80202eae <argint>
    80204a34:	08054a63          	bltz	a0,80204ac8 <sys_dev+0xac>
    80204a38:	fd840593          	addi	a1,s0,-40
    80204a3c:	4505                	li	a0,1
    80204a3e:	ffffe097          	auipc	ra,0xffffe
    80204a42:	470080e7          	jalr	1136(ra) # 80202eae <argint>
    80204a46:	08054763          	bltz	a0,80204ad4 <sys_dev+0xb8>
    80204a4a:	fd440593          	addi	a1,s0,-44
    80204a4e:	4509                	li	a0,2
    80204a50:	ffffe097          	auipc	ra,0xffffe
    80204a54:	45e080e7          	jalr	1118(ra) # 80202eae <argint>
    80204a58:	08054063          	bltz	a0,80204ad8 <sys_dev+0xbc>
    return -1;
  }

  if(omode & O_CREATE){
    80204a5c:	fdc42783          	lw	a5,-36(s0)
    80204a60:	2007f793          	andi	a5,a5,512
    80204a64:	ebb1                	bnez	a5,80204ab8 <sys_dev+0x9c>
    panic("dev file on FAT");
  }

  if(major < 0 || major >= NDEV)
    80204a66:	fd842703          	lw	a4,-40(s0)
    80204a6a:	47a5                	li	a5,9
    return -1;
    80204a6c:	557d                	li	a0,-1
  if(major < 0 || major >= NDEV)
    80204a6e:	04e7ee63          	bltu	a5,a4,80204aca <sys_dev+0xae>

  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    80204a72:	fffff097          	auipc	ra,0xfffff
    80204a76:	d80080e7          	jalr	-640(ra) # 802037f2 <filealloc>
    80204a7a:	84aa                	mv	s1,a0
    80204a7c:	c125                	beqz	a0,80204adc <sys_dev+0xc0>
    80204a7e:	00000097          	auipc	ra,0x0
    80204a82:	980080e7          	jalr	-1664(ra) # 802043fe <fdalloc>
    80204a86:	04054d63          	bltz	a0,80204ae0 <sys_dev+0xc4>
    if(f)
      fileclose(f);
    return -1;
  }

  f->type = FD_DEVICE;
    80204a8a:	478d                	li	a5,3
    80204a8c:	c09c                	sw	a5,0(s1)
  f->off = 0;
    80204a8e:	0204a023          	sw	zero,32(s1)
  f->ep = 0;
    80204a92:	0004bc23          	sd	zero,24(s1)
  f->major = major;
    80204a96:	fd842783          	lw	a5,-40(s0)
    80204a9a:	02f49223          	sh	a5,36(s1)
  f->readable = !(omode & O_WRONLY);
    80204a9e:	fdc42783          	lw	a5,-36(s0)
    80204aa2:	0017c713          	xori	a4,a5,1
    80204aa6:	8b05                	andi	a4,a4,1
    80204aa8:	00e48423          	sb	a4,8(s1)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80204aac:	8b8d                	andi	a5,a5,3
    80204aae:	00f037b3          	snez	a5,a5
    80204ab2:	00f484a3          	sb	a5,9(s1)

  return fd;
    80204ab6:	a811                	j	80204aca <sys_dev+0xae>
    panic("dev file on FAT");
    80204ab8:	00005517          	auipc	a0,0x5
    80204abc:	34850513          	addi	a0,a0,840 # 80209e00 <sysnames+0x1c8>
    80204ac0:	ffffb097          	auipc	ra,0xffffb
    80204ac4:	684080e7          	jalr	1668(ra) # 80200144 <panic>
    return -1;
    80204ac8:	557d                	li	a0,-1
}
    80204aca:	70a2                	ld	ra,40(sp)
    80204acc:	7402                	ld	s0,32(sp)
    80204ace:	64e2                	ld	s1,24(sp)
    80204ad0:	6145                	addi	sp,sp,48
    80204ad2:	8082                	ret
    return -1;
    80204ad4:	557d                	li	a0,-1
    80204ad6:	bfd5                	j	80204aca <sys_dev+0xae>
    80204ad8:	557d                	li	a0,-1
    80204ada:	bfc5                	j	80204aca <sys_dev+0xae>
    return -1;
    80204adc:	557d                	li	a0,-1
    80204ade:	b7f5                	j	80204aca <sys_dev+0xae>
      fileclose(f);
    80204ae0:	8526                	mv	a0,s1
    80204ae2:	fffff097          	auipc	ra,0xfffff
    80204ae6:	dcc080e7          	jalr	-564(ra) # 802038ae <fileclose>
    return -1;
    80204aea:	557d                	li	a0,-1
    80204aec:	bff9                	j	80204aca <sys_dev+0xae>

0000000080204aee <sys_readdir>:

// To support ls command
uint64
sys_readdir(void)
{
    80204aee:	1101                	addi	sp,sp,-32
    80204af0:	ec06                	sd	ra,24(sp)
    80204af2:	e822                	sd	s0,16(sp)
    80204af4:	1000                	addi	s0,sp,32
  struct file *f;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    80204af6:	fe840613          	addi	a2,s0,-24
    80204afa:	4581                	li	a1,0
    80204afc:	4501                	li	a0,0
    80204afe:	00000097          	auipc	ra,0x0
    80204b02:	898080e7          	jalr	-1896(ra) # 80204396 <argfd>
    return -1;
    80204b06:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    80204b08:	02054563          	bltz	a0,80204b32 <sys_readdir+0x44>
    80204b0c:	fe040593          	addi	a1,s0,-32
    80204b10:	4505                	li	a0,1
    80204b12:	ffffe097          	auipc	ra,0xffffe
    80204b16:	3fe080e7          	jalr	1022(ra) # 80202f10 <argaddr>
    return -1;
    80204b1a:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    80204b1c:	00054b63          	bltz	a0,80204b32 <sys_readdir+0x44>
  return dirnext(f, p);
    80204b20:	fe043583          	ld	a1,-32(s0)
    80204b24:	fe843503          	ld	a0,-24(s0)
    80204b28:	fffff097          	auipc	ra,0xfffff
    80204b2c:	030080e7          	jalr	48(ra) # 80203b58 <dirnext>
    80204b30:	87aa                	mv	a5,a0
}
    80204b32:	853e                	mv	a0,a5
    80204b34:	60e2                	ld	ra,24(sp)
    80204b36:	6442                	ld	s0,16(sp)
    80204b38:	6105                	addi	sp,sp,32
    80204b3a:	8082                	ret

0000000080204b3c <sys_getcwd>:

// get absolute cwd string
uint64
sys_getcwd(void)
{
    80204b3c:	714d                	addi	sp,sp,-336
    80204b3e:	e686                	sd	ra,328(sp)
    80204b40:	e2a2                	sd	s0,320(sp)
    80204b42:	fe26                	sd	s1,312(sp)
    80204b44:	fa4a                	sd	s2,304(sp)
    80204b46:	f64e                	sd	s3,296(sp)
    80204b48:	f252                	sd	s4,288(sp)
    80204b4a:	ee56                	sd	s5,280(sp)
    80204b4c:	0a80                	addi	s0,sp,336
  uint64 addr;
  if (argaddr(0, &addr) < 0)
    80204b4e:	fb840593          	addi	a1,s0,-72
    80204b52:	4501                	li	a0,0
    80204b54:	ffffe097          	auipc	ra,0xffffe
    80204b58:	3bc080e7          	jalr	956(ra) # 80202f10 <argaddr>
    80204b5c:	87aa                	mv	a5,a0
    return -1;
    80204b5e:	557d                	li	a0,-1
  if (argaddr(0, &addr) < 0)
    80204b60:	0607cc63          	bltz	a5,80204bd8 <sys_getcwd+0x9c>

  struct dirent *de = myproc()->cwd;
    80204b64:	ffffd097          	auipc	ra,0xffffd
    80204b68:	fb8080e7          	jalr	-72(ra) # 80201b1c <myproc>
    80204b6c:	15853483          	ld	s1,344(a0)
  char path[FAT32_MAX_PATH];
  char *s;
  int len;

  if (de->parent == NULL) {
    80204b70:	1204b783          	ld	a5,288(s1)
    80204b74:	cbbd                	beqz	a5,80204bea <sys_getcwd+0xae>
    s = "/";
  } else {
    s = path + FAT32_MAX_PATH - 1;
    *s = '\0';
    80204b76:	fa0409a3          	sb	zero,-77(s0)
    s = path + FAT32_MAX_PATH - 1;
    80204b7a:	fb340993          	addi	s3,s0,-77
    while (de->parent) {
      len = strlen(de->filename);
      s -= len;
      if (s <= path)          // can't reach root "/"
    80204b7e:	eb040a13          	addi	s4,s0,-336
        return -1;
      strncpy(s, de->filename, len);
      *--s = '/';
    80204b82:	02f00a93          	li	s5,47
      len = strlen(de->filename);
    80204b86:	8526                	mv	a0,s1
    80204b88:	ffffc097          	auipc	ra,0xffffc
    80204b8c:	d90080e7          	jalr	-624(ra) # 80200918 <strlen>
    80204b90:	862a                	mv	a2,a0
      s -= len;
    80204b92:	40a98933          	sub	s2,s3,a0
      if (s <= path)          // can't reach root "/"
    80204b96:	052a7f63          	bgeu	s4,s2,80204bf4 <sys_getcwd+0xb8>
      strncpy(s, de->filename, len);
    80204b9a:	85a6                	mv	a1,s1
    80204b9c:	854a                	mv	a0,s2
    80204b9e:	ffffc097          	auipc	ra,0xffffc
    80204ba2:	d0a080e7          	jalr	-758(ra) # 802008a8 <strncpy>
      *--s = '/';
    80204ba6:	fff90993          	addi	s3,s2,-1
    80204baa:	ff590fa3          	sb	s5,-1(s2)
      de = de->parent;
    80204bae:	1204b483          	ld	s1,288(s1)
    while (de->parent) {
    80204bb2:	1204b783          	ld	a5,288(s1)
    80204bb6:	fbe1                	bnez	a5,80204b86 <sys_getcwd+0x4a>
    }
  }

  // if (copyout(myproc()->pagetable, addr, s, strlen(s) + 1) < 0)
  if (copyout2(addr, s, strlen(s) + 1) < 0)
    80204bb8:	fb843483          	ld	s1,-72(s0)
    80204bbc:	854e                	mv	a0,s3
    80204bbe:	ffffc097          	auipc	ra,0xffffc
    80204bc2:	d5a080e7          	jalr	-678(ra) # 80200918 <strlen>
    80204bc6:	0015061b          	addiw	a2,a0,1
    80204bca:	85ce                	mv	a1,s3
    80204bcc:	8526                	mv	a0,s1
    80204bce:	ffffd097          	auipc	ra,0xffffd
    80204bd2:	862080e7          	jalr	-1950(ra) # 80201430 <copyout2>
    80204bd6:	957d                	srai	a0,a0,0x3f
    return -1;
  
  return 0;

}
    80204bd8:	60b6                	ld	ra,328(sp)
    80204bda:	6416                	ld	s0,320(sp)
    80204bdc:	74f2                	ld	s1,312(sp)
    80204bde:	7952                	ld	s2,304(sp)
    80204be0:	79b2                	ld	s3,296(sp)
    80204be2:	7a12                	ld	s4,288(sp)
    80204be4:	6af2                	ld	s5,280(sp)
    80204be6:	6171                	addi	sp,sp,336
    80204be8:	8082                	ret
    s = "/";
    80204bea:	00005997          	auipc	s3,0x5
    80204bee:	ab698993          	addi	s3,s3,-1354 # 802096a0 <digits+0x320>
    80204bf2:	b7d9                	j	80204bb8 <sys_getcwd+0x7c>
        return -1;
    80204bf4:	557d                	li	a0,-1
    80204bf6:	b7cd                	j	80204bd8 <sys_getcwd+0x9c>

0000000080204bf8 <sys_remove>:
  return ret == -1;
}

uint64
sys_remove(void)
{
    80204bf8:	d6010113          	addi	sp,sp,-672
    80204bfc:	28113c23          	sd	ra,664(sp)
    80204c00:	28813823          	sd	s0,656(sp)
    80204c04:	28913423          	sd	s1,648(sp)
    80204c08:	1500                	addi	s0,sp,672
  char path[FAT32_MAX_PATH];
  struct dirent *ep;
  int len;
  if((len = argstr(0, path, FAT32_MAX_PATH)) <= 0)
    80204c0a:	10400613          	li	a2,260
    80204c0e:	ed840593          	addi	a1,s0,-296
    80204c12:	4501                	li	a0,0
    80204c14:	ffffe097          	auipc	ra,0xffffe
    80204c18:	31e080e7          	jalr	798(ra) # 80202f32 <argstr>
    80204c1c:	0ea05a63          	blez	a0,80204d10 <sys_remove+0x118>
    return -1;

  char *s = path + len - 1;
    80204c20:	ed840713          	addi	a4,s0,-296
    80204c24:	157d                	addi	a0,a0,-1
    80204c26:	00a707b3          	add	a5,a4,a0
  while (s >= path && *s == '/') {
    80204c2a:	02f00693          	li	a3,47
    80204c2e:	863a                	mv	a2,a4
    80204c30:	00e7e963          	bltu	a5,a4,80204c42 <sys_remove+0x4a>
    80204c34:	0007c703          	lbu	a4,0(a5)
    80204c38:	08d71a63          	bne	a4,a3,80204ccc <sys_remove+0xd4>
    s--;
    80204c3c:	17fd                	addi	a5,a5,-1
  while (s >= path && *s == '/') {
    80204c3e:	fec7fbe3          	bgeu	a5,a2,80204c34 <sys_remove+0x3c>
  }
  if (s >= path && *s == '.' && (s == path || *--s == '/')) {
    return -1;
  }
  
  if((ep = ename(path)) == NULL){
    80204c42:	ed840513          	addi	a0,s0,-296
    80204c46:	00002097          	auipc	ra,0x2
    80204c4a:	36c080e7          	jalr	876(ra) # 80206fb2 <ename>
    80204c4e:	84aa                	mv	s1,a0
    80204c50:	c561                	beqz	a0,80204d18 <sys_remove+0x120>
    return -1;
  }
  elock(ep);
    80204c52:	00002097          	auipc	ra,0x2
    80204c56:	bc0080e7          	jalr	-1088(ra) # 80206812 <elock>
  if((ep->attribute & ATTR_DIRECTORY) && !isdirempty(ep)){
    80204c5a:	1004c783          	lbu	a5,256(s1)
    80204c5e:	8bc1                	andi	a5,a5,16
    80204c60:	c38d                	beqz	a5,80204c82 <sys_remove+0x8a>
  ep.valid = 0;
    80204c62:	e8041323          	sh	zero,-378(s0)
  ret = enext(dp, &ep, 2 * 32, &count);   // skip the "." and ".."
    80204c66:	d6c40693          	addi	a3,s0,-660
    80204c6a:	04000613          	li	a2,64
    80204c6e:	d7040593          	addi	a1,s0,-656
    80204c72:	8526                	mv	a0,s1
    80204c74:	00002097          	auipc	ra,0x2
    80204c78:	da2080e7          	jalr	-606(ra) # 80206a16 <enext>
  if((ep->attribute & ATTR_DIRECTORY) && !isdirempty(ep)){
    80204c7c:	57fd                	li	a5,-1
    80204c7e:	06f51d63          	bne	a0,a5,80204cf8 <sys_remove+0x100>
      eunlock(ep);
      eput(ep);
      return -1;
  }
  elock(ep->parent);      // Will this lead to deadlock?
    80204c82:	1204b503          	ld	a0,288(s1)
    80204c86:	00002097          	auipc	ra,0x2
    80204c8a:	b8c080e7          	jalr	-1140(ra) # 80206812 <elock>
  eremove(ep);
    80204c8e:	8526                	mv	a0,s1
    80204c90:	00002097          	auipc	ra,0x2
    80204c94:	a54080e7          	jalr	-1452(ra) # 802066e4 <eremove>
  eunlock(ep->parent);
    80204c98:	1204b503          	ld	a0,288(s1)
    80204c9c:	00002097          	auipc	ra,0x2
    80204ca0:	bac080e7          	jalr	-1108(ra) # 80206848 <eunlock>
  eunlock(ep);
    80204ca4:	8526                	mv	a0,s1
    80204ca6:	00002097          	auipc	ra,0x2
    80204caa:	ba2080e7          	jalr	-1118(ra) # 80206848 <eunlock>
  eput(ep);
    80204cae:	8526                	mv	a0,s1
    80204cb0:	00002097          	auipc	ra,0x2
    80204cb4:	be6080e7          	jalr	-1050(ra) # 80206896 <eput>

  return 0;
    80204cb8:	4501                	li	a0,0
}
    80204cba:	29813083          	ld	ra,664(sp)
    80204cbe:	29013403          	ld	s0,656(sp)
    80204cc2:	28813483          	ld	s1,648(sp)
    80204cc6:	2a010113          	addi	sp,sp,672
    80204cca:	8082                	ret
  if (s >= path && *s == '.' && (s == path || *--s == '/')) {
    80204ccc:	ed840713          	addi	a4,s0,-296
    80204cd0:	f6e7e9e3          	bltu	a5,a4,80204c42 <sys_remove+0x4a>
    80204cd4:	0007c683          	lbu	a3,0(a5)
    80204cd8:	02e00713          	li	a4,46
    80204cdc:	f6e693e3          	bne	a3,a4,80204c42 <sys_remove+0x4a>
    80204ce0:	ed840713          	addi	a4,s0,-296
    80204ce4:	02e78863          	beq	a5,a4,80204d14 <sys_remove+0x11c>
    80204ce8:	fff7c703          	lbu	a4,-1(a5)
    80204cec:	02f00793          	li	a5,47
    80204cf0:	f4f719e3          	bne	a4,a5,80204c42 <sys_remove+0x4a>
    return -1;
    80204cf4:	557d                	li	a0,-1
    80204cf6:	b7d1                	j	80204cba <sys_remove+0xc2>
      eunlock(ep);
    80204cf8:	8526                	mv	a0,s1
    80204cfa:	00002097          	auipc	ra,0x2
    80204cfe:	b4e080e7          	jalr	-1202(ra) # 80206848 <eunlock>
      eput(ep);
    80204d02:	8526                	mv	a0,s1
    80204d04:	00002097          	auipc	ra,0x2
    80204d08:	b92080e7          	jalr	-1134(ra) # 80206896 <eput>
      return -1;
    80204d0c:	557d                	li	a0,-1
    80204d0e:	b775                	j	80204cba <sys_remove+0xc2>
    return -1;
    80204d10:	557d                	li	a0,-1
    80204d12:	b765                	j	80204cba <sys_remove+0xc2>
    return -1;
    80204d14:	557d                	li	a0,-1
    80204d16:	b755                	j	80204cba <sys_remove+0xc2>
    return -1;
    80204d18:	557d                	li	a0,-1
    80204d1a:	b745                	j	80204cba <sys_remove+0xc2>

0000000080204d1c <sys_rename>:

// Must hold too many locks at a time! It's possible to raise a deadlock.
// Because this op takes some steps, we can't promise
uint64
sys_rename(void)
{
    80204d1c:	c4010113          	addi	sp,sp,-960
    80204d20:	3a113c23          	sd	ra,952(sp)
    80204d24:	3a813823          	sd	s0,944(sp)
    80204d28:	3a913423          	sd	s1,936(sp)
    80204d2c:	3b213023          	sd	s2,928(sp)
    80204d30:	39313c23          	sd	s3,920(sp)
    80204d34:	39413823          	sd	s4,912(sp)
    80204d38:	0780                	addi	s0,sp,960
  char old[FAT32_MAX_PATH], new[FAT32_MAX_PATH];
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    80204d3a:	10400613          	li	a2,260
    80204d3e:	ec840593          	addi	a1,s0,-312
    80204d42:	4501                	li	a0,0
    80204d44:	ffffe097          	auipc	ra,0xffffe
    80204d48:	1ee080e7          	jalr	494(ra) # 80202f32 <argstr>
      return -1;
    80204d4c:	57fd                	li	a5,-1
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    80204d4e:	0c054d63          	bltz	a0,80204e28 <sys_rename+0x10c>
    80204d52:	10400613          	li	a2,260
    80204d56:	dc040593          	addi	a1,s0,-576
    80204d5a:	4505                	li	a0,1
    80204d5c:	ffffe097          	auipc	ra,0xffffe
    80204d60:	1d6080e7          	jalr	470(ra) # 80202f32 <argstr>
      return -1;
    80204d64:	57fd                	li	a5,-1
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    80204d66:	0c054163          	bltz	a0,80204e28 <sys_rename+0x10c>
  }

  struct dirent *src = NULL, *dst = NULL, *pdst = NULL;
  int srclock = 0;
  char *name;
  if ((src = ename(old)) == NULL || (pdst = enameparent(new, old)) == NULL
    80204d6a:	ec840513          	addi	a0,s0,-312
    80204d6e:	00002097          	auipc	ra,0x2
    80204d72:	244080e7          	jalr	580(ra) # 80206fb2 <ename>
    80204d76:	84aa                	mv	s1,a0
    80204d78:	1c050963          	beqz	a0,80204f4a <sys_rename+0x22e>
    80204d7c:	ec840593          	addi	a1,s0,-312
    80204d80:	dc040513          	addi	a0,s0,-576
    80204d84:	00002097          	auipc	ra,0x2
    80204d88:	24c080e7          	jalr	588(ra) # 80206fd0 <enameparent>
    80204d8c:	892a                	mv	s2,a0
    80204d8e:	cd35                	beqz	a0,80204e0a <sys_rename+0xee>
      || (name = formatname(old)) == NULL) {
    80204d90:	ec840513          	addi	a0,s0,-312
    80204d94:	00001097          	auipc	ra,0x1
    80204d98:	3d8080e7          	jalr	984(ra) # 8020616c <formatname>
    80204d9c:	89aa                	mv	s3,a0
    80204d9e:	c535                	beqz	a0,80204e0a <sys_rename+0xee>
    goto fail;          // src doesn't exist || dst parent doesn't exist || illegal new name
  }
  for (struct dirent *ep = pdst; ep != NULL; ep = ep->parent) {
    if (ep == src) {    // In what universe can we move a directory into its child?
    80204da0:	07248563          	beq	s1,s2,80204e0a <sys_rename+0xee>
  for (struct dirent *ep = pdst; ep != NULL; ep = ep->parent) {
    80204da4:	87ca                	mv	a5,s2
    80204da6:	1207b783          	ld	a5,288(a5)
    80204daa:	c781                	beqz	a5,80204db2 <sys_rename+0x96>
    if (ep == src) {    // In what universe can we move a directory into its child?
    80204dac:	fef49de3          	bne	s1,a5,80204da6 <sys_rename+0x8a>
    80204db0:	a8a9                	j	80204e0a <sys_rename+0xee>
      goto fail;
    }
  }

  uint off;
  elock(src);     // must hold child's lock before acquiring parent's, because we do so in other similar cases
    80204db2:	8526                	mv	a0,s1
    80204db4:	00002097          	auipc	ra,0x2
    80204db8:	a5e080e7          	jalr	-1442(ra) # 80206812 <elock>
  srclock = 1;
  elock(pdst);
    80204dbc:	854a                	mv	a0,s2
    80204dbe:	00002097          	auipc	ra,0x2
    80204dc2:	a54080e7          	jalr	-1452(ra) # 80206812 <elock>
  dst = dirlookup(pdst, name, &off);
    80204dc6:	dbc40613          	addi	a2,s0,-580
    80204dca:	85ce                	mv	a1,s3
    80204dcc:	854a                	mv	a0,s2
    80204dce:	00002097          	auipc	ra,0x2
    80204dd2:	dd4080e7          	jalr	-556(ra) # 80206ba2 <dirlookup>
    80204dd6:	8a2a                	mv	s4,a0
  if (dst != NULL) {
    80204dd8:	cd45                	beqz	a0,80204e90 <sys_rename+0x174>
    eunlock(pdst);
    80204dda:	854a                	mv	a0,s2
    80204ddc:	00002097          	auipc	ra,0x2
    80204de0:	a6c080e7          	jalr	-1428(ra) # 80206848 <eunlock>
    if (src == dst) {
    80204de4:	01448963          	beq	s1,s4,80204df6 <sys_rename+0xda>
      goto fail;
    } else if (src->attribute & dst->attribute & ATTR_DIRECTORY) {
    80204de8:	1004c783          	lbu	a5,256(s1)
    80204dec:	100a4703          	lbu	a4,256(s4)
    80204df0:	8ff9                	and	a5,a5,a4
    80204df2:	8bc1                	andi	a5,a5,16
    80204df4:	ebb1                	bnez	a5,80204e48 <sys_rename+0x12c>

  return 0;

fail:
  if (srclock)
    eunlock(src);
    80204df6:	8526                	mv	a0,s1
    80204df8:	00002097          	auipc	ra,0x2
    80204dfc:	a50080e7          	jalr	-1456(ra) # 80206848 <eunlock>
  if (dst)
    eput(dst);
    80204e00:	8552                	mv	a0,s4
    80204e02:	00002097          	auipc	ra,0x2
    80204e06:	a94080e7          	jalr	-1388(ra) # 80206896 <eput>
  if (pdst)
    80204e0a:	00090763          	beqz	s2,80204e18 <sys_rename+0xfc>
    eput(pdst);
    80204e0e:	854a                	mv	a0,s2
    80204e10:	00002097          	auipc	ra,0x2
    80204e14:	a86080e7          	jalr	-1402(ra) # 80206896 <eput>
  if (src)
    eput(src);
  return -1;
    80204e18:	57fd                	li	a5,-1
  if (src)
    80204e1a:	c499                	beqz	s1,80204e28 <sys_rename+0x10c>
    eput(src);
    80204e1c:	8526                	mv	a0,s1
    80204e1e:	00002097          	auipc	ra,0x2
    80204e22:	a78080e7          	jalr	-1416(ra) # 80206896 <eput>
  return -1;
    80204e26:	57fd                	li	a5,-1
}
    80204e28:	853e                	mv	a0,a5
    80204e2a:	3b813083          	ld	ra,952(sp)
    80204e2e:	3b013403          	ld	s0,944(sp)
    80204e32:	3a813483          	ld	s1,936(sp)
    80204e36:	3a013903          	ld	s2,928(sp)
    80204e3a:	39813983          	ld	s3,920(sp)
    80204e3e:	39013a03          	ld	s4,912(sp)
    80204e42:	3c010113          	addi	sp,sp,960
    80204e46:	8082                	ret
      elock(dst);
    80204e48:	8552                	mv	a0,s4
    80204e4a:	00002097          	auipc	ra,0x2
    80204e4e:	9c8080e7          	jalr	-1592(ra) # 80206812 <elock>
  ep.valid = 0;
    80204e52:	d6041323          	sh	zero,-666(s0)
  ret = enext(dp, &ep, 2 * 32, &count);   // skip the "." and ".."
    80204e56:	c4c40693          	addi	a3,s0,-948
    80204e5a:	04000613          	li	a2,64
    80204e5e:	c5040593          	addi	a1,s0,-944
    80204e62:	8552                	mv	a0,s4
    80204e64:	00002097          	auipc	ra,0x2
    80204e68:	bb2080e7          	jalr	-1102(ra) # 80206a16 <enext>
      if (!isdirempty(dst)) {    // it's ok to overwrite an empty dir
    80204e6c:	57fd                	li	a5,-1
    80204e6e:	0cf51863          	bne	a0,a5,80204f3e <sys_rename+0x222>
      elock(pdst);
    80204e72:	854a                	mv	a0,s2
    80204e74:	00002097          	auipc	ra,0x2
    80204e78:	99e080e7          	jalr	-1634(ra) # 80206812 <elock>
    eremove(dst);
    80204e7c:	8552                	mv	a0,s4
    80204e7e:	00002097          	auipc	ra,0x2
    80204e82:	866080e7          	jalr	-1946(ra) # 802066e4 <eremove>
    eunlock(dst);
    80204e86:	8552                	mv	a0,s4
    80204e88:	00002097          	auipc	ra,0x2
    80204e8c:	9c0080e7          	jalr	-1600(ra) # 80206848 <eunlock>
  memmove(src->filename, name, FAT32_MAX_FILENAME);
    80204e90:	0ff00613          	li	a2,255
    80204e94:	85ce                	mv	a1,s3
    80204e96:	8526                	mv	a0,s1
    80204e98:	ffffc097          	auipc	ra,0xffffc
    80204e9c:	958080e7          	jalr	-1704(ra) # 802007f0 <memmove>
  emake(pdst, src, off);
    80204ea0:	dbc42603          	lw	a2,-580(s0)
    80204ea4:	85a6                	mv	a1,s1
    80204ea6:	854a                	mv	a0,s2
    80204ea8:	00001097          	auipc	ra,0x1
    80204eac:	37c080e7          	jalr	892(ra) # 80206224 <emake>
  if (src->parent != pdst) {
    80204eb0:	1204b783          	ld	a5,288(s1)
    80204eb4:	01278d63          	beq	a5,s2,80204ece <sys_rename+0x1b2>
    eunlock(pdst);
    80204eb8:	854a                	mv	a0,s2
    80204eba:	00002097          	auipc	ra,0x2
    80204ebe:	98e080e7          	jalr	-1650(ra) # 80206848 <eunlock>
    elock(src->parent);
    80204ec2:	1204b503          	ld	a0,288(s1)
    80204ec6:	00002097          	auipc	ra,0x2
    80204eca:	94c080e7          	jalr	-1716(ra) # 80206812 <elock>
  eremove(src);
    80204ece:	8526                	mv	a0,s1
    80204ed0:	00002097          	auipc	ra,0x2
    80204ed4:	814080e7          	jalr	-2028(ra) # 802066e4 <eremove>
  eunlock(src->parent);
    80204ed8:	1204b503          	ld	a0,288(s1)
    80204edc:	00002097          	auipc	ra,0x2
    80204ee0:	96c080e7          	jalr	-1684(ra) # 80206848 <eunlock>
  struct dirent *psrc = src->parent;  // src must not be root, or it won't pass the for-loop test
    80204ee4:	1204b983          	ld	s3,288(s1)
  src->parent = edup(pdst);
    80204ee8:	854a                	mv	a0,s2
    80204eea:	00001097          	auipc	ra,0x1
    80204eee:	6d4080e7          	jalr	1748(ra) # 802065be <edup>
    80204ef2:	12a4b023          	sd	a0,288(s1)
  src->off = off;
    80204ef6:	dbc42783          	lw	a5,-580(s0)
    80204efa:	10f4ae23          	sw	a5,284(s1)
  src->valid = 1;
    80204efe:	4785                	li	a5,1
    80204f00:	10f49b23          	sh	a5,278(s1)
  eunlock(src);
    80204f04:	8526                	mv	a0,s1
    80204f06:	00002097          	auipc	ra,0x2
    80204f0a:	942080e7          	jalr	-1726(ra) # 80206848 <eunlock>
  eput(psrc);
    80204f0e:	854e                	mv	a0,s3
    80204f10:	00002097          	auipc	ra,0x2
    80204f14:	986080e7          	jalr	-1658(ra) # 80206896 <eput>
  if (dst) {
    80204f18:	000a0763          	beqz	s4,80204f26 <sys_rename+0x20a>
    eput(dst);
    80204f1c:	8552                	mv	a0,s4
    80204f1e:	00002097          	auipc	ra,0x2
    80204f22:	978080e7          	jalr	-1672(ra) # 80206896 <eput>
  eput(pdst);
    80204f26:	854a                	mv	a0,s2
    80204f28:	00002097          	auipc	ra,0x2
    80204f2c:	96e080e7          	jalr	-1682(ra) # 80206896 <eput>
  eput(src);
    80204f30:	8526                	mv	a0,s1
    80204f32:	00002097          	auipc	ra,0x2
    80204f36:	964080e7          	jalr	-1692(ra) # 80206896 <eput>
  return 0;
    80204f3a:	4781                	li	a5,0
    80204f3c:	b5f5                	j	80204e28 <sys_rename+0x10c>
        eunlock(dst);
    80204f3e:	8552                	mv	a0,s4
    80204f40:	00002097          	auipc	ra,0x2
    80204f44:	908080e7          	jalr	-1784(ra) # 80206848 <eunlock>
        goto fail;
    80204f48:	b57d                	j	80204df6 <sys_rename+0xda>
  struct dirent *src = NULL, *dst = NULL, *pdst = NULL;
    80204f4a:	892a                	mv	s2,a0
  if (dst)
    80204f4c:	bd7d                	j	80204e0a <sys_rename+0xee>
	...

0000000080204f50 <kernelvec>:
    80204f50:	7111                	addi	sp,sp,-256
    80204f52:	e006                	sd	ra,0(sp)
    80204f54:	e40a                	sd	sp,8(sp)
    80204f56:	e80e                	sd	gp,16(sp)
    80204f58:	ec12                	sd	tp,24(sp)
    80204f5a:	f016                	sd	t0,32(sp)
    80204f5c:	f41a                	sd	t1,40(sp)
    80204f5e:	f81e                	sd	t2,48(sp)
    80204f60:	fc22                	sd	s0,56(sp)
    80204f62:	e0a6                	sd	s1,64(sp)
    80204f64:	e4aa                	sd	a0,72(sp)
    80204f66:	e8ae                	sd	a1,80(sp)
    80204f68:	ecb2                	sd	a2,88(sp)
    80204f6a:	f0b6                	sd	a3,96(sp)
    80204f6c:	f4ba                	sd	a4,104(sp)
    80204f6e:	f8be                	sd	a5,112(sp)
    80204f70:	fcc2                	sd	a6,120(sp)
    80204f72:	e146                	sd	a7,128(sp)
    80204f74:	e54a                	sd	s2,136(sp)
    80204f76:	e94e                	sd	s3,144(sp)
    80204f78:	ed52                	sd	s4,152(sp)
    80204f7a:	f156                	sd	s5,160(sp)
    80204f7c:	f55a                	sd	s6,168(sp)
    80204f7e:	f95e                	sd	s7,176(sp)
    80204f80:	fd62                	sd	s8,184(sp)
    80204f82:	e1e6                	sd	s9,192(sp)
    80204f84:	e5ea                	sd	s10,200(sp)
    80204f86:	e9ee                	sd	s11,208(sp)
    80204f88:	edf2                	sd	t3,216(sp)
    80204f8a:	f1f6                	sd	t4,224(sp)
    80204f8c:	f5fa                	sd	t5,232(sp)
    80204f8e:	f9fe                	sd	t6,240(sp)
    80204f90:	aa1fd0ef          	jal	ra,80202a30 <kerneltrap>
    80204f94:	6082                	ld	ra,0(sp)
    80204f96:	6122                	ld	sp,8(sp)
    80204f98:	61c2                	ld	gp,16(sp)
    80204f9a:	7282                	ld	t0,32(sp)
    80204f9c:	7322                	ld	t1,40(sp)
    80204f9e:	73c2                	ld	t2,48(sp)
    80204fa0:	7462                	ld	s0,56(sp)
    80204fa2:	6486                	ld	s1,64(sp)
    80204fa4:	6526                	ld	a0,72(sp)
    80204fa6:	65c6                	ld	a1,80(sp)
    80204fa8:	6666                	ld	a2,88(sp)
    80204faa:	7686                	ld	a3,96(sp)
    80204fac:	7726                	ld	a4,104(sp)
    80204fae:	77c6                	ld	a5,112(sp)
    80204fb0:	7866                	ld	a6,120(sp)
    80204fb2:	688a                	ld	a7,128(sp)
    80204fb4:	692a                	ld	s2,136(sp)
    80204fb6:	69ca                	ld	s3,144(sp)
    80204fb8:	6a6a                	ld	s4,152(sp)
    80204fba:	7a8a                	ld	s5,160(sp)
    80204fbc:	7b2a                	ld	s6,168(sp)
    80204fbe:	7bca                	ld	s7,176(sp)
    80204fc0:	7c6a                	ld	s8,184(sp)
    80204fc2:	6c8e                	ld	s9,192(sp)
    80204fc4:	6d2e                	ld	s10,200(sp)
    80204fc6:	6dce                	ld	s11,208(sp)
    80204fc8:	6e6e                	ld	t3,216(sp)
    80204fca:	7e8e                	ld	t4,224(sp)
    80204fcc:	7f2e                	ld	t5,232(sp)
    80204fce:	7fce                	ld	t6,240(sp)
    80204fd0:	6111                	addi	sp,sp,256
    80204fd2:	10200073          	sret
	...

0000000080204fde <timerinit>:
#include "include/proc.h"

struct spinlock tickslock;
uint ticks;

void timerinit() {
    80204fde:	1141                	addi	sp,sp,-16
    80204fe0:	e406                	sd	ra,8(sp)
    80204fe2:	e022                	sd	s0,0(sp)
    80204fe4:	0800                	addi	s0,sp,16
    initlock(&tickslock, "time");
    80204fe6:	00005597          	auipc	a1,0x5
    80204fea:	e2a58593          	addi	a1,a1,-470 # 80209e10 <sysnames+0x1d8>
    80204fee:	000b0517          	auipc	a0,0xb0
    80204ff2:	5aa50513          	addi	a0,a0,1450 # 802b5598 <tickslock>
    80204ff6:	ffffb097          	auipc	ra,0xffffb
    80204ffa:	6ba080e7          	jalr	1722(ra) # 802006b0 <initlock>
    #ifdef DEBUG
    printf("timerinit\n");
    80204ffe:	00005517          	auipc	a0,0x5
    80205002:	e1a50513          	addi	a0,a0,-486 # 80209e18 <sysnames+0x1e0>
    80205006:	ffffb097          	auipc	ra,0xffffb
    8020500a:	188080e7          	jalr	392(ra) # 8020018e <printf>
    #endif
}
    8020500e:	60a2                	ld	ra,8(sp)
    80205010:	6402                	ld	s0,0(sp)
    80205012:	0141                	addi	sp,sp,16
    80205014:	8082                	ret

0000000080205016 <set_next_timeout>:

void
set_next_timeout() {
    80205016:	1141                	addi	sp,sp,-16
    80205018:	e422                	sd	s0,8(sp)
    8020501a:	0800                	addi	s0,sp,16
  asm volatile("rdtime %0" : "=r" (x) );
    8020501c:	c0102573          	rdtime	a0
    // if comment the `printf` line below
    // the timer will not work.

    // this bug seems to disappear automatically
    // printf("");
    sbi_set_timer(r_time() + INTERVAL);
    80205020:	001dc7b7          	lui	a5,0x1dc
    80205024:	13078793          	addi	a5,a5,304 # 1dc130 <_entry-0x80023ed0>
    80205028:	953e                	add	a0,a0,a5
}

static inline void sbi_set_timer(uint64 stime_value)
{
	SBI_CALL_1(SBI_SET_TIMER, stime_value);
    8020502a:	4581                	li	a1,0
    8020502c:	4601                	li	a2,0
    8020502e:	4681                	li	a3,0
    80205030:	4881                	li	a7,0
    80205032:	00000073          	ecall
}
    80205036:	6422                	ld	s0,8(sp)
    80205038:	0141                	addi	sp,sp,16
    8020503a:	8082                	ret

000000008020503c <timer_tick>:

void timer_tick() {
    8020503c:	1101                	addi	sp,sp,-32
    8020503e:	ec06                	sd	ra,24(sp)
    80205040:	e822                	sd	s0,16(sp)
    80205042:	e426                	sd	s1,8(sp)
    80205044:	1000                	addi	s0,sp,32
    acquire(&tickslock);
    80205046:	000b0497          	auipc	s1,0xb0
    8020504a:	55248493          	addi	s1,s1,1362 # 802b5598 <tickslock>
    8020504e:	8526                	mv	a0,s1
    80205050:	ffffb097          	auipc	ra,0xffffb
    80205054:	6a4080e7          	jalr	1700(ra) # 802006f4 <acquire>
    ticks++;
    80205058:	000b0517          	auipc	a0,0xb0
    8020505c:	55850513          	addi	a0,a0,1368 # 802b55b0 <ticks>
    80205060:	411c                	lw	a5,0(a0)
    80205062:	2785                	addiw	a5,a5,1
    80205064:	c11c                	sw	a5,0(a0)
    wakeup(&ticks);
    80205066:	ffffd097          	auipc	ra,0xffffd
    8020506a:	4b2080e7          	jalr	1202(ra) # 80202518 <wakeup>
    release(&tickslock);
    8020506e:	8526                	mv	a0,s1
    80205070:	ffffb097          	auipc	ra,0xffffb
    80205074:	6d8080e7          	jalr	1752(ra) # 80200748 <release>
    set_next_timeout();
    80205078:	00000097          	auipc	ra,0x0
    8020507c:	f9e080e7          	jalr	-98(ra) # 80205016 <set_next_timeout>
}
    80205080:	60e2                	ld	ra,24(sp)
    80205082:	6442                	ld	s0,16(sp)
    80205084:	64a2                	ld	s1,8(sp)
    80205086:	6105                	addi	sp,sp,32
    80205088:	8082                	ret

000000008020508a <free_desc>:
}

// mark a descriptor as free.
static void
free_desc(int i)
{
    8020508a:	1141                	addi	sp,sp,-16
    8020508c:	e406                	sd	ra,8(sp)
    8020508e:	e022                	sd	s0,0(sp)
    80205090:	0800                	addi	s0,sp,16
  if(i >= NUM)
    80205092:	479d                	li	a5,7
    80205094:	04a7cc63          	blt	a5,a0,802050ec <free_desc+0x62>
    panic("virtio_disk_intr 1");
  if(disk.free[i])
    80205098:	000b1797          	auipc	a5,0xb1
    8020509c:	f6878793          	addi	a5,a5,-152 # 802b6000 <disk>
    802050a0:	00a78733          	add	a4,a5,a0
    802050a4:	6789                	lui	a5,0x2
    802050a6:	97ba                	add	a5,a5,a4
    802050a8:	0187c783          	lbu	a5,24(a5) # 2018 <_entry-0x801fdfe8>
    802050ac:	eba1                	bnez	a5,802050fc <free_desc+0x72>
    panic("virtio_disk_intr 2");
  disk.desc[i].addr = 0;
    802050ae:	00451713          	slli	a4,a0,0x4
    802050b2:	000b3797          	auipc	a5,0xb3
    802050b6:	f4e7b783          	ld	a5,-178(a5) # 802b8000 <disk+0x2000>
    802050ba:	97ba                	add	a5,a5,a4
    802050bc:	0007b023          	sd	zero,0(a5)
  disk.free[i] = 1;
    802050c0:	000b1797          	auipc	a5,0xb1
    802050c4:	f4078793          	addi	a5,a5,-192 # 802b6000 <disk>
    802050c8:	97aa                	add	a5,a5,a0
    802050ca:	6509                	lui	a0,0x2
    802050cc:	953e                	add	a0,a0,a5
    802050ce:	4785                	li	a5,1
    802050d0:	00f50c23          	sb	a5,24(a0) # 2018 <_entry-0x801fdfe8>
  wakeup(&disk.free[0]);
    802050d4:	000b3517          	auipc	a0,0xb3
    802050d8:	f4450513          	addi	a0,a0,-188 # 802b8018 <disk+0x2018>
    802050dc:	ffffd097          	auipc	ra,0xffffd
    802050e0:	43c080e7          	jalr	1084(ra) # 80202518 <wakeup>
}
    802050e4:	60a2                	ld	ra,8(sp)
    802050e6:	6402                	ld	s0,0(sp)
    802050e8:	0141                	addi	sp,sp,16
    802050ea:	8082                	ret
    panic("virtio_disk_intr 1");
    802050ec:	00005517          	auipc	a0,0x5
    802050f0:	d3c50513          	addi	a0,a0,-708 # 80209e28 <sysnames+0x1f0>
    802050f4:	ffffb097          	auipc	ra,0xffffb
    802050f8:	050080e7          	jalr	80(ra) # 80200144 <panic>
    panic("virtio_disk_intr 2");
    802050fc:	00005517          	auipc	a0,0x5
    80205100:	d4450513          	addi	a0,a0,-700 # 80209e40 <sysnames+0x208>
    80205104:	ffffb097          	auipc	ra,0xffffb
    80205108:	040080e7          	jalr	64(ra) # 80200144 <panic>

000000008020510c <virtio_disk_init>:
{
    8020510c:	1141                	addi	sp,sp,-16
    8020510e:	e406                	sd	ra,8(sp)
    80205110:	e022                	sd	s0,0(sp)
    80205112:	0800                	addi	s0,sp,16
  initlock(&disk.vdisk_lock, "virtio_disk");
    80205114:	00005597          	auipc	a1,0x5
    80205118:	d4458593          	addi	a1,a1,-700 # 80209e58 <sysnames+0x220>
    8020511c:	000b3517          	auipc	a0,0xb3
    80205120:	f8c50513          	addi	a0,a0,-116 # 802b80a8 <disk+0x20a8>
    80205124:	ffffb097          	auipc	ra,0xffffb
    80205128:	58c080e7          	jalr	1420(ra) # 802006b0 <initlock>
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    8020512c:	03f107b7          	lui	a5,0x3f10
    80205130:	0785                	addi	a5,a5,1
    80205132:	07b2                	slli	a5,a5,0xc
    80205134:	4398                	lw	a4,0(a5)
    80205136:	2701                	sext.w	a4,a4
    80205138:	747277b7          	lui	a5,0x74727
    8020513c:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xbad968a>
    80205140:	12f71a63          	bne	a4,a5,80205274 <virtio_disk_init+0x168>
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    80205144:	00005797          	auipc	a5,0x5
    80205148:	00c7b783          	ld	a5,12(a5) # 8020a150 <erodata+0x3>
    8020514c:	439c                	lw	a5,0(a5)
    8020514e:	2781                	sext.w	a5,a5
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80205150:	4705                	li	a4,1
    80205152:	12e79163          	bne	a5,a4,80205274 <virtio_disk_init+0x168>
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80205156:	00005797          	auipc	a5,0x5
    8020515a:	0027b783          	ld	a5,2(a5) # 8020a158 <erodata+0xb>
    8020515e:	439c                	lw	a5,0(a5)
    80205160:	2781                	sext.w	a5,a5
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    80205162:	4709                	li	a4,2
    80205164:	10e79863          	bne	a5,a4,80205274 <virtio_disk_init+0x168>
     *R(VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    80205168:	00005797          	auipc	a5,0x5
    8020516c:	ff87b783          	ld	a5,-8(a5) # 8020a160 <erodata+0x13>
    80205170:	4398                	lw	a4,0(a5)
    80205172:	2701                	sext.w	a4,a4
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80205174:	554d47b7          	lui	a5,0x554d4
    80205178:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ad2baaf>
    8020517c:	0ef71c63          	bne	a4,a5,80205274 <virtio_disk_init+0x168>
  *R(VIRTIO_MMIO_STATUS) = status;
    80205180:	00005717          	auipc	a4,0x5
    80205184:	fe873703          	ld	a4,-24(a4) # 8020a168 <erodata+0x1b>
    80205188:	4785                	li	a5,1
    8020518a:	c31c                	sw	a5,0(a4)
  *R(VIRTIO_MMIO_STATUS) = status;
    8020518c:	478d                	li	a5,3
    8020518e:	c31c                	sw	a5,0(a4)
  uint64 features = *R(VIRTIO_MMIO_DEVICE_FEATURES);
    80205190:	00005797          	auipc	a5,0x5
    80205194:	fe07b783          	ld	a5,-32(a5) # 8020a170 <erodata+0x23>
    80205198:	4394                	lw	a3,0(a5)
  features &= ~(1 << VIRTIO_RING_F_INDIRECT_DESC);
    8020519a:	c7ffe7b7          	lui	a5,0xc7ffe
    8020519e:	75f78793          	addi	a5,a5,1887 # ffffffffc7ffe75f <kernel_end+0xffffffff47d4075f>
    802051a2:	8ff5                	and	a5,a5,a3
  *R(VIRTIO_MMIO_DRIVER_FEATURES) = features;
    802051a4:	2781                	sext.w	a5,a5
    802051a6:	00005697          	auipc	a3,0x5
    802051aa:	fd26b683          	ld	a3,-46(a3) # 8020a178 <erodata+0x2b>
    802051ae:	c29c                	sw	a5,0(a3)
  *R(VIRTIO_MMIO_STATUS) = status;
    802051b0:	47ad                	li	a5,11
    802051b2:	c31c                	sw	a5,0(a4)
  *R(VIRTIO_MMIO_STATUS) = status;
    802051b4:	47bd                	li	a5,15
    802051b6:	c31c                	sw	a5,0(a4)
  *R(VIRTIO_MMIO_GUEST_PAGE_SIZE) = PGSIZE;
    802051b8:	00005797          	auipc	a5,0x5
    802051bc:	fc87b783          	ld	a5,-56(a5) # 8020a180 <erodata+0x33>
    802051c0:	6705                	lui	a4,0x1
    802051c2:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_QUEUE_SEL) = 0;
    802051c4:	00005797          	auipc	a5,0x5
    802051c8:	fc47b783          	ld	a5,-60(a5) # 8020a188 <erodata+0x3b>
    802051cc:	0007a023          	sw	zero,0(a5)
  uint32 max = *R(VIRTIO_MMIO_QUEUE_NUM_MAX);
    802051d0:	00005797          	auipc	a5,0x5
    802051d4:	fc07b783          	ld	a5,-64(a5) # 8020a190 <erodata+0x43>
    802051d8:	439c                	lw	a5,0(a5)
    802051da:	2781                	sext.w	a5,a5
  if(max == 0)
    802051dc:	c7c5                	beqz	a5,80205284 <virtio_disk_init+0x178>
  if(max < NUM)
    802051de:	471d                	li	a4,7
    802051e0:	0af77a63          	bgeu	a4,a5,80205294 <virtio_disk_init+0x188>
  *R(VIRTIO_MMIO_QUEUE_NUM) = NUM;
    802051e4:	00005797          	auipc	a5,0x5
    802051e8:	fb47b783          	ld	a5,-76(a5) # 8020a198 <erodata+0x4b>
    802051ec:	4721                	li	a4,8
    802051ee:	c398                	sw	a4,0(a5)
  memset(disk.pages, 0, sizeof(disk.pages));
    802051f0:	6609                	lui	a2,0x2
    802051f2:	4581                	li	a1,0
    802051f4:	000b1517          	auipc	a0,0xb1
    802051f8:	e0c50513          	addi	a0,a0,-500 # 802b6000 <disk>
    802051fc:	ffffb097          	auipc	ra,0xffffb
    80205200:	594080e7          	jalr	1428(ra) # 80200790 <memset>
  *R(VIRTIO_MMIO_QUEUE_PFN) = ((uint64)disk.pages) >> PGSHIFT;
    80205204:	000b1717          	auipc	a4,0xb1
    80205208:	dfc70713          	addi	a4,a4,-516 # 802b6000 <disk>
    8020520c:	00c75793          	srli	a5,a4,0xc
    80205210:	2781                	sext.w	a5,a5
    80205212:	00005697          	auipc	a3,0x5
    80205216:	f8e6b683          	ld	a3,-114(a3) # 8020a1a0 <erodata+0x53>
    8020521a:	c29c                	sw	a5,0(a3)
  disk.desc = (struct VRingDesc *) disk.pages;
    8020521c:	000b3797          	auipc	a5,0xb3
    80205220:	de478793          	addi	a5,a5,-540 # 802b8000 <disk+0x2000>
    80205224:	e398                	sd	a4,0(a5)
  disk.avail = (uint16*)(((char*)disk.desc) + NUM*sizeof(struct VRingDesc));
    80205226:	000b1717          	auipc	a4,0xb1
    8020522a:	e5a70713          	addi	a4,a4,-422 # 802b6080 <disk+0x80>
    8020522e:	e798                	sd	a4,8(a5)
  disk.used = (struct UsedArea *) (disk.pages + PGSIZE);
    80205230:	000b2717          	auipc	a4,0xb2
    80205234:	dd070713          	addi	a4,a4,-560 # 802b7000 <disk+0x1000>
    80205238:	eb98                	sd	a4,16(a5)
    disk.free[i] = 1;
    8020523a:	4705                	li	a4,1
    8020523c:	00e78c23          	sb	a4,24(a5)
    80205240:	00e78ca3          	sb	a4,25(a5)
    80205244:	00e78d23          	sb	a4,26(a5)
    80205248:	00e78da3          	sb	a4,27(a5)
    8020524c:	00e78e23          	sb	a4,28(a5)
    80205250:	00e78ea3          	sb	a4,29(a5)
    80205254:	00e78f23          	sb	a4,30(a5)
    80205258:	00e78fa3          	sb	a4,31(a5)
  printf("virtio_disk_init\n");
    8020525c:	00005517          	auipc	a0,0x5
    80205260:	c6c50513          	addi	a0,a0,-916 # 80209ec8 <sysnames+0x290>
    80205264:	ffffb097          	auipc	ra,0xffffb
    80205268:	f2a080e7          	jalr	-214(ra) # 8020018e <printf>
}
    8020526c:	60a2                	ld	ra,8(sp)
    8020526e:	6402                	ld	s0,0(sp)
    80205270:	0141                	addi	sp,sp,16
    80205272:	8082                	ret
    panic("could not find virtio disk");
    80205274:	00005517          	auipc	a0,0x5
    80205278:	bf450513          	addi	a0,a0,-1036 # 80209e68 <sysnames+0x230>
    8020527c:	ffffb097          	auipc	ra,0xffffb
    80205280:	ec8080e7          	jalr	-312(ra) # 80200144 <panic>
    panic("virtio disk has no queue 0");
    80205284:	00005517          	auipc	a0,0x5
    80205288:	c0450513          	addi	a0,a0,-1020 # 80209e88 <sysnames+0x250>
    8020528c:	ffffb097          	auipc	ra,0xffffb
    80205290:	eb8080e7          	jalr	-328(ra) # 80200144 <panic>
    panic("virtio disk max queue too short");
    80205294:	00005517          	auipc	a0,0x5
    80205298:	c1450513          	addi	a0,a0,-1004 # 80209ea8 <sysnames+0x270>
    8020529c:	ffffb097          	auipc	ra,0xffffb
    802052a0:	ea8080e7          	jalr	-344(ra) # 80200144 <panic>

00000000802052a4 <virtio_disk_rw>:
  return 0;
}

void
virtio_disk_rw(struct buf *b, int write)
{
    802052a4:	7119                	addi	sp,sp,-128
    802052a6:	fc86                	sd	ra,120(sp)
    802052a8:	f8a2                	sd	s0,112(sp)
    802052aa:	f4a6                	sd	s1,104(sp)
    802052ac:	f0ca                	sd	s2,96(sp)
    802052ae:	ecce                	sd	s3,88(sp)
    802052b0:	e8d2                	sd	s4,80(sp)
    802052b2:	e4d6                	sd	s5,72(sp)
    802052b4:	e0da                	sd	s6,64(sp)
    802052b6:	fc5e                	sd	s7,56(sp)
    802052b8:	f862                	sd	s8,48(sp)
    802052ba:	f466                	sd	s9,40(sp)
    802052bc:	f06a                	sd	s10,32(sp)
    802052be:	0100                	addi	s0,sp,128
    802052c0:	892a                	mv	s2,a0
    802052c2:	8cae                	mv	s9,a1
  uint64 sector = b->sectorno;
    802052c4:	00c56d03          	lwu	s10,12(a0)

  acquire(&disk.vdisk_lock);
    802052c8:	000b3517          	auipc	a0,0xb3
    802052cc:	de050513          	addi	a0,a0,-544 # 802b80a8 <disk+0x20a8>
    802052d0:	ffffb097          	auipc	ra,0xffffb
    802052d4:	424080e7          	jalr	1060(ra) # 802006f4 <acquire>
  for(int i = 0; i < 3; i++){
    802052d8:	4981                	li	s3,0
  for(int i = 0; i < NUM; i++){
    802052da:	4c21                	li	s8,8
      disk.free[i] = 0;
    802052dc:	000b1b97          	auipc	s7,0xb1
    802052e0:	d24b8b93          	addi	s7,s7,-732 # 802b6000 <disk>
    802052e4:	6b09                	lui	s6,0x2
  for(int i = 0; i < 3; i++){
    802052e6:	4a8d                	li	s5,3
  for(int i = 0; i < NUM; i++){
    802052e8:	8a4e                	mv	s4,s3
    802052ea:	a051                	j	8020536e <virtio_disk_rw+0xca>
      disk.free[i] = 0;
    802052ec:	00fb86b3          	add	a3,s7,a5
    802052f0:	96da                	add	a3,a3,s6
    802052f2:	00068c23          	sb	zero,24(a3)
    idx[i] = alloc_desc();
    802052f6:	c21c                	sw	a5,0(a2)
    if(idx[i] < 0){
    802052f8:	0207c563          	bltz	a5,80205322 <virtio_disk_rw+0x7e>
  for(int i = 0; i < 3; i++){
    802052fc:	2485                	addiw	s1,s1,1
    802052fe:	0711                	addi	a4,a4,4
    80205300:	25548463          	beq	s1,s5,80205548 <virtio_disk_rw+0x2a4>
    idx[i] = alloc_desc();
    80205304:	863a                	mv	a2,a4
  for(int i = 0; i < NUM; i++){
    80205306:	000b3697          	auipc	a3,0xb3
    8020530a:	d1268693          	addi	a3,a3,-750 # 802b8018 <disk+0x2018>
    8020530e:	87d2                	mv	a5,s4
    if(disk.free[i]){
    80205310:	0006c583          	lbu	a1,0(a3)
    80205314:	fde1                	bnez	a1,802052ec <virtio_disk_rw+0x48>
  for(int i = 0; i < NUM; i++){
    80205316:	2785                	addiw	a5,a5,1
    80205318:	0685                	addi	a3,a3,1
    8020531a:	ff879be3          	bne	a5,s8,80205310 <virtio_disk_rw+0x6c>
    idx[i] = alloc_desc();
    8020531e:	57fd                	li	a5,-1
    80205320:	c21c                	sw	a5,0(a2)
      for(int j = 0; j < i; j++)
    80205322:	02905a63          	blez	s1,80205356 <virtio_disk_rw+0xb2>
        free_desc(idx[j]);
    80205326:	f9042503          	lw	a0,-112(s0)
    8020532a:	00000097          	auipc	ra,0x0
    8020532e:	d60080e7          	jalr	-672(ra) # 8020508a <free_desc>
      for(int j = 0; j < i; j++)
    80205332:	4785                	li	a5,1
    80205334:	0297d163          	bge	a5,s1,80205356 <virtio_disk_rw+0xb2>
        free_desc(idx[j]);
    80205338:	f9442503          	lw	a0,-108(s0)
    8020533c:	00000097          	auipc	ra,0x0
    80205340:	d4e080e7          	jalr	-690(ra) # 8020508a <free_desc>
      for(int j = 0; j < i; j++)
    80205344:	4789                	li	a5,2
    80205346:	0097d863          	bge	a5,s1,80205356 <virtio_disk_rw+0xb2>
        free_desc(idx[j]);
    8020534a:	f9842503          	lw	a0,-104(s0)
    8020534e:	00000097          	auipc	ra,0x0
    80205352:	d3c080e7          	jalr	-708(ra) # 8020508a <free_desc>
  int idx[3];
  while(1){
    if(alloc3_desc(idx) == 0) {
      break;
    }
    sleep(&disk.free[0], &disk.vdisk_lock);
    80205356:	000b3597          	auipc	a1,0xb3
    8020535a:	d5258593          	addi	a1,a1,-686 # 802b80a8 <disk+0x20a8>
    8020535e:	000b3517          	auipc	a0,0xb3
    80205362:	cba50513          	addi	a0,a0,-838 # 802b8018 <disk+0x2018>
    80205366:	ffffd097          	auipc	ra,0xffffd
    8020536a:	030080e7          	jalr	48(ra) # 80202396 <sleep>
  for(int i = 0; i < 3; i++){
    8020536e:	f9040713          	addi	a4,s0,-112
    80205372:	84ce                	mv	s1,s3
    80205374:	bf41                	j	80205304 <virtio_disk_rw+0x60>
    uint32 reserved;
    uint64 sector;
  } buf0;

  if(write)
    buf0.type = VIRTIO_BLK_T_OUT; // write the disk
    80205376:	4785                	li	a5,1
    80205378:	f8f42023          	sw	a5,-128(s0)
  else
    buf0.type = VIRTIO_BLK_T_IN; // read the disk
  buf0.reserved = 0;
    8020537c:	f8042223          	sw	zero,-124(s0)
  buf0.sector = sector;
    80205380:	f9a43423          	sd	s10,-120(s0)

  // buf0 is on a kernel stack, which is not direct mapped,
  // thus the call to kvmpa().
  disk.desc[idx[0]].addr = (uint64) kwalkaddr(myproc()->kpagetable, (uint64) &buf0);
    80205384:	ffffc097          	auipc	ra,0xffffc
    80205388:	798080e7          	jalr	1944(ra) # 80201b1c <myproc>
    8020538c:	f9042983          	lw	s3,-112(s0)
    80205390:	00499493          	slli	s1,s3,0x4
    80205394:	000b3a17          	auipc	s4,0xb3
    80205398:	c6ca0a13          	addi	s4,s4,-916 # 802b8000 <disk+0x2000>
    8020539c:	000a3a83          	ld	s5,0(s4)
    802053a0:	9aa6                	add	s5,s5,s1
    802053a2:	f8040593          	addi	a1,s0,-128
    802053a6:	6d28                	ld	a0,88(a0)
    802053a8:	ffffc097          	auipc	ra,0xffffc
    802053ac:	910080e7          	jalr	-1776(ra) # 80200cb8 <kwalkaddr>
    802053b0:	00aab023          	sd	a0,0(s5)
  disk.desc[idx[0]].len = sizeof(buf0);
    802053b4:	000a3783          	ld	a5,0(s4)
    802053b8:	97a6                	add	a5,a5,s1
    802053ba:	4741                	li	a4,16
    802053bc:	c798                	sw	a4,8(a5)
  disk.desc[idx[0]].flags = VRING_DESC_F_NEXT;
    802053be:	000a3783          	ld	a5,0(s4)
    802053c2:	97a6                	add	a5,a5,s1
    802053c4:	4705                	li	a4,1
    802053c6:	00e79623          	sh	a4,12(a5)
  disk.desc[idx[0]].next = idx[1];
    802053ca:	f9442703          	lw	a4,-108(s0)
    802053ce:	000a3783          	ld	a5,0(s4)
    802053d2:	97a6                	add	a5,a5,s1
    802053d4:	00e79723          	sh	a4,14(a5)

  disk.desc[idx[1]].addr = (uint64) b->data;
    802053d8:	0712                	slli	a4,a4,0x4
    802053da:	000a3783          	ld	a5,0(s4)
    802053de:	97ba                	add	a5,a5,a4
    802053e0:	05890693          	addi	a3,s2,88
    802053e4:	e394                	sd	a3,0(a5)
  disk.desc[idx[1]].len = BSIZE;
    802053e6:	000a3783          	ld	a5,0(s4)
    802053ea:	97ba                	add	a5,a5,a4
    802053ec:	20000693          	li	a3,512
    802053f0:	c794                	sw	a3,8(a5)
  if(write)
    802053f2:	100c8c63          	beqz	s9,8020550a <virtio_disk_rw+0x266>
    disk.desc[idx[1]].flags = 0; // device reads b->data
    802053f6:	000b3797          	auipc	a5,0xb3
    802053fa:	c0a7b783          	ld	a5,-1014(a5) # 802b8000 <disk+0x2000>
    802053fe:	97ba                	add	a5,a5,a4
    80205400:	00079623          	sh	zero,12(a5)
  else
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
  disk.desc[idx[1]].flags |= VRING_DESC_F_NEXT;
    80205404:	000b1517          	auipc	a0,0xb1
    80205408:	bfc50513          	addi	a0,a0,-1028 # 802b6000 <disk>
    8020540c:	000b3797          	auipc	a5,0xb3
    80205410:	bf478793          	addi	a5,a5,-1036 # 802b8000 <disk+0x2000>
    80205414:	6394                	ld	a3,0(a5)
    80205416:	96ba                	add	a3,a3,a4
    80205418:	00c6d603          	lhu	a2,12(a3)
    8020541c:	00166613          	ori	a2,a2,1
    80205420:	00c69623          	sh	a2,12(a3)
  disk.desc[idx[1]].next = idx[2];
    80205424:	f9842683          	lw	a3,-104(s0)
    80205428:	6390                	ld	a2,0(a5)
    8020542a:	9732                	add	a4,a4,a2
    8020542c:	00d71723          	sh	a3,14(a4)

  disk.info[idx[0]].status = 0;
    80205430:	20098613          	addi	a2,s3,512
    80205434:	0612                	slli	a2,a2,0x4
    80205436:	962a                	add	a2,a2,a0
    80205438:	02060823          	sb	zero,48(a2) # 2030 <_entry-0x801fdfd0>
  disk.desc[idx[2]].addr = (uint64) &disk.info[idx[0]].status;
    8020543c:	00469713          	slli	a4,a3,0x4
    80205440:	6394                	ld	a3,0(a5)
    80205442:	96ba                	add	a3,a3,a4
    80205444:	6589                	lui	a1,0x2
    80205446:	03058593          	addi	a1,a1,48 # 2030 <_entry-0x801fdfd0>
    8020544a:	94ae                	add	s1,s1,a1
    8020544c:	94aa                	add	s1,s1,a0
    8020544e:	e284                	sd	s1,0(a3)
  disk.desc[idx[2]].len = 1;
    80205450:	6394                	ld	a3,0(a5)
    80205452:	96ba                	add	a3,a3,a4
    80205454:	4585                	li	a1,1
    80205456:	c68c                	sw	a1,8(a3)
  disk.desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
    80205458:	6394                	ld	a3,0(a5)
    8020545a:	96ba                	add	a3,a3,a4
    8020545c:	4509                	li	a0,2
    8020545e:	00a69623          	sh	a0,12(a3)
  disk.desc[idx[2]].next = 0;
    80205462:	6394                	ld	a3,0(a5)
    80205464:	9736                	add	a4,a4,a3
    80205466:	00071723          	sh	zero,14(a4)

  // record struct buf for virtio_disk_intr().
  b->disk = 1;
    8020546a:	00b92223          	sw	a1,4(s2)
  disk.info[idx[0]].b = b;
    8020546e:	03263423          	sd	s2,40(a2)

  // avail[0] is flags
  // avail[1] tells the device how far to look in avail[2...].
  // avail[2...] are desc[] indices the device should process.
  // we only tell device the first index in our chain of descriptors.
  disk.avail[2 + (disk.avail[1] % NUM)] = idx[0];
    80205472:	6794                	ld	a3,8(a5)
    80205474:	0026d703          	lhu	a4,2(a3)
    80205478:	8b1d                	andi	a4,a4,7
    8020547a:	2709                	addiw	a4,a4,2
    8020547c:	0706                	slli	a4,a4,0x1
    8020547e:	9736                	add	a4,a4,a3
    80205480:	01371023          	sh	s3,0(a4)
  __sync_synchronize();
    80205484:	0ff0000f          	fence
  disk.avail[1] = disk.avail[1] + 1;
    80205488:	6798                	ld	a4,8(a5)
    8020548a:	00275783          	lhu	a5,2(a4)
    8020548e:	2785                	addiw	a5,a5,1
    80205490:	00f71123          	sh	a5,2(a4)

  *R(VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number
    80205494:	00005797          	auipc	a5,0x5
    80205498:	d147b783          	ld	a5,-748(a5) # 8020a1a8 <erodata+0x5b>
    8020549c:	0007a023          	sw	zero,0(a5)

  // Wait for virtio_disk_intr() to say request has finished.
  while(b->disk == 1) {
    802054a0:	00492703          	lw	a4,4(s2)
    802054a4:	4785                	li	a5,1
    802054a6:	02f71163          	bne	a4,a5,802054c8 <virtio_disk_rw+0x224>
    sleep(b, &disk.vdisk_lock);
    802054aa:	000b3997          	auipc	s3,0xb3
    802054ae:	bfe98993          	addi	s3,s3,-1026 # 802b80a8 <disk+0x20a8>
  while(b->disk == 1) {
    802054b2:	4485                	li	s1,1
    sleep(b, &disk.vdisk_lock);
    802054b4:	85ce                	mv	a1,s3
    802054b6:	854a                	mv	a0,s2
    802054b8:	ffffd097          	auipc	ra,0xffffd
    802054bc:	ede080e7          	jalr	-290(ra) # 80202396 <sleep>
  while(b->disk == 1) {
    802054c0:	00492783          	lw	a5,4(s2)
    802054c4:	fe9788e3          	beq	a5,s1,802054b4 <virtio_disk_rw+0x210>
  }

  disk.info[idx[0]].b = 0;
    802054c8:	f9042483          	lw	s1,-112(s0)
    802054cc:	20048793          	addi	a5,s1,512
    802054d0:	00479713          	slli	a4,a5,0x4
    802054d4:	000b1797          	auipc	a5,0xb1
    802054d8:	b2c78793          	addi	a5,a5,-1236 # 802b6000 <disk>
    802054dc:	97ba                	add	a5,a5,a4
    802054de:	0207b423          	sd	zero,40(a5)
    if(disk.desc[i].flags & VRING_DESC_F_NEXT)
    802054e2:	000b3917          	auipc	s2,0xb3
    802054e6:	b1e90913          	addi	s2,s2,-1250 # 802b8000 <disk+0x2000>
    free_desc(i);
    802054ea:	8526                	mv	a0,s1
    802054ec:	00000097          	auipc	ra,0x0
    802054f0:	b9e080e7          	jalr	-1122(ra) # 8020508a <free_desc>
    if(disk.desc[i].flags & VRING_DESC_F_NEXT)
    802054f4:	0492                	slli	s1,s1,0x4
    802054f6:	00093783          	ld	a5,0(s2)
    802054fa:	94be                	add	s1,s1,a5
    802054fc:	00c4d783          	lhu	a5,12(s1)
    80205500:	8b85                	andi	a5,a5,1
    80205502:	cf89                	beqz	a5,8020551c <virtio_disk_rw+0x278>
      i = disk.desc[i].next;
    80205504:	00e4d483          	lhu	s1,14(s1)
    free_desc(i);
    80205508:	b7cd                	j	802054ea <virtio_disk_rw+0x246>
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
    8020550a:	000b3797          	auipc	a5,0xb3
    8020550e:	af67b783          	ld	a5,-1290(a5) # 802b8000 <disk+0x2000>
    80205512:	97ba                	add	a5,a5,a4
    80205514:	4689                	li	a3,2
    80205516:	00d79623          	sh	a3,12(a5)
    8020551a:	b5ed                	j	80205404 <virtio_disk_rw+0x160>
  free_chain(idx[0]);

  release(&disk.vdisk_lock);
    8020551c:	000b3517          	auipc	a0,0xb3
    80205520:	b8c50513          	addi	a0,a0,-1140 # 802b80a8 <disk+0x20a8>
    80205524:	ffffb097          	auipc	ra,0xffffb
    80205528:	224080e7          	jalr	548(ra) # 80200748 <release>
}
    8020552c:	70e6                	ld	ra,120(sp)
    8020552e:	7446                	ld	s0,112(sp)
    80205530:	74a6                	ld	s1,104(sp)
    80205532:	7906                	ld	s2,96(sp)
    80205534:	69e6                	ld	s3,88(sp)
    80205536:	6a46                	ld	s4,80(sp)
    80205538:	6aa6                	ld	s5,72(sp)
    8020553a:	6b06                	ld	s6,64(sp)
    8020553c:	7be2                	ld	s7,56(sp)
    8020553e:	7c42                	ld	s8,48(sp)
    80205540:	7ca2                	ld	s9,40(sp)
    80205542:	7d02                	ld	s10,32(sp)
    80205544:	6109                	addi	sp,sp,128
    80205546:	8082                	ret
  if(write)
    80205548:	e20c97e3          	bnez	s9,80205376 <virtio_disk_rw+0xd2>
    buf0.type = VIRTIO_BLK_T_IN; // read the disk
    8020554c:	f8042023          	sw	zero,-128(s0)
    80205550:	b535                	j	8020537c <virtio_disk_rw+0xd8>

0000000080205552 <virtio_disk_intr>:

void
virtio_disk_intr()
{
    80205552:	1101                	addi	sp,sp,-32
    80205554:	ec06                	sd	ra,24(sp)
    80205556:	e822                	sd	s0,16(sp)
    80205558:	e426                	sd	s1,8(sp)
    8020555a:	e04a                	sd	s2,0(sp)
    8020555c:	1000                	addi	s0,sp,32
  acquire(&disk.vdisk_lock);
    8020555e:	000b3517          	auipc	a0,0xb3
    80205562:	b4a50513          	addi	a0,a0,-1206 # 802b80a8 <disk+0x20a8>
    80205566:	ffffb097          	auipc	ra,0xffffb
    8020556a:	18e080e7          	jalr	398(ra) # 802006f4 <acquire>

  while((disk.used_idx % NUM) != (disk.used->id % NUM)){
    8020556e:	000b3717          	auipc	a4,0xb3
    80205572:	a9270713          	addi	a4,a4,-1390 # 802b8000 <disk+0x2000>
    80205576:	02075783          	lhu	a5,32(a4)
    8020557a:	6b18                	ld	a4,16(a4)
    8020557c:	00275683          	lhu	a3,2(a4)
    80205580:	8ebd                	xor	a3,a3,a5
    80205582:	8a9d                	andi	a3,a3,7
    80205584:	cab9                	beqz	a3,802055da <virtio_disk_intr+0x88>
    int id = disk.used->elems[disk.used_idx].id;

    if(disk.info[id].status != 0)
    80205586:	000b1917          	auipc	s2,0xb1
    8020558a:	a7a90913          	addi	s2,s2,-1414 # 802b6000 <disk>
      panic("virtio_disk_intr status");
    
    disk.info[id].b->disk = 0;   // disk is done with buf
    wakeup(disk.info[id].b);

    disk.used_idx = (disk.used_idx + 1) % NUM;
    8020558e:	000b3497          	auipc	s1,0xb3
    80205592:	a7248493          	addi	s1,s1,-1422 # 802b8000 <disk+0x2000>
    int id = disk.used->elems[disk.used_idx].id;
    80205596:	078e                	slli	a5,a5,0x3
    80205598:	97ba                	add	a5,a5,a4
    8020559a:	43dc                	lw	a5,4(a5)
    if(disk.info[id].status != 0)
    8020559c:	20078713          	addi	a4,a5,512
    802055a0:	0712                	slli	a4,a4,0x4
    802055a2:	974a                	add	a4,a4,s2
    802055a4:	03074703          	lbu	a4,48(a4)
    802055a8:	e335                	bnez	a4,8020560c <virtio_disk_intr+0xba>
    disk.info[id].b->disk = 0;   // disk is done with buf
    802055aa:	20078793          	addi	a5,a5,512
    802055ae:	0792                	slli	a5,a5,0x4
    802055b0:	97ca                	add	a5,a5,s2
    802055b2:	7798                	ld	a4,40(a5)
    802055b4:	00072223          	sw	zero,4(a4)
    wakeup(disk.info[id].b);
    802055b8:	7788                	ld	a0,40(a5)
    802055ba:	ffffd097          	auipc	ra,0xffffd
    802055be:	f5e080e7          	jalr	-162(ra) # 80202518 <wakeup>
    disk.used_idx = (disk.used_idx + 1) % NUM;
    802055c2:	0204d783          	lhu	a5,32(s1)
    802055c6:	2785                	addiw	a5,a5,1
    802055c8:	8b9d                	andi	a5,a5,7
    802055ca:	02f49023          	sh	a5,32(s1)
  while((disk.used_idx % NUM) != (disk.used->id % NUM)){
    802055ce:	6898                	ld	a4,16(s1)
    802055d0:	00275683          	lhu	a3,2(a4)
    802055d4:	8a9d                	andi	a3,a3,7
    802055d6:	fcf690e3          	bne	a3,a5,80205596 <virtio_disk_intr+0x44>
  }
  *R(VIRTIO_MMIO_INTERRUPT_ACK) = *R(VIRTIO_MMIO_INTERRUPT_STATUS) & 0x3;
    802055da:	00005797          	auipc	a5,0x5
    802055de:	bd67b783          	ld	a5,-1066(a5) # 8020a1b0 <erodata+0x63>
    802055e2:	439c                	lw	a5,0(a5)
    802055e4:	8b8d                	andi	a5,a5,3
    802055e6:	00005717          	auipc	a4,0x5
    802055ea:	bd273703          	ld	a4,-1070(a4) # 8020a1b8 <erodata+0x6b>
    802055ee:	c31c                	sw	a5,0(a4)

  release(&disk.vdisk_lock);
    802055f0:	000b3517          	auipc	a0,0xb3
    802055f4:	ab850513          	addi	a0,a0,-1352 # 802b80a8 <disk+0x20a8>
    802055f8:	ffffb097          	auipc	ra,0xffffb
    802055fc:	150080e7          	jalr	336(ra) # 80200748 <release>
}
    80205600:	60e2                	ld	ra,24(sp)
    80205602:	6442                	ld	s0,16(sp)
    80205604:	64a2                	ld	s1,8(sp)
    80205606:	6902                	ld	s2,0(sp)
    80205608:	6105                	addi	sp,sp,32
    8020560a:	8082                	ret
      panic("virtio_disk_intr status");
    8020560c:	00005517          	auipc	a0,0x5
    80205610:	8d450513          	addi	a0,a0,-1836 # 80209ee0 <sysnames+0x2a8>
    80205614:	ffffb097          	auipc	ra,0xffffb
    80205618:	b30080e7          	jalr	-1232(ra) # 80200144 <panic>

000000008020561c <disk_init>:
#include "include/virtio.h"
#endif
#endif 

void disk_init(void)
{
    8020561c:	1141                	addi	sp,sp,-16
    8020561e:	e406                	sd	ra,8(sp)
    80205620:	e022                	sd	s0,0(sp)
    80205622:	0800                	addi	s0,sp,16
    #ifdef QEMU
    #if QEMU!=SIFIVE_U
    virtio_disk_init();
    80205624:	00000097          	auipc	ra,0x0
    80205628:	ae8080e7          	jalr	-1304(ra) # 8020510c <virtio_disk_init>
    sdcard_init();
    #endif
    #else 
    sdcard_init();
    #endif
}
    8020562c:	60a2                	ld	ra,8(sp)
    8020562e:	6402                	ld	s0,0(sp)
    80205630:	0141                	addi	sp,sp,16
    80205632:	8082                	ret

0000000080205634 <disk_read>:

void disk_read(struct buf *b)
{
    80205634:	1141                	addi	sp,sp,-16
    80205636:	e406                	sd	ra,8(sp)
    80205638:	e022                	sd	s0,0(sp)
    8020563a:	0800                	addi	s0,sp,16
    #ifdef QEMU
    #if QEMU!=SIFIVE_U
	virtio_disk_rw(b, 0);
    8020563c:	4581                	li	a1,0
    8020563e:	00000097          	auipc	ra,0x0
    80205642:	c66080e7          	jalr	-922(ra) # 802052a4 <virtio_disk_rw>
	sdcard_read_sector(b->data, b->sectorno);
    #endif
    #else 
	sdcard_read_sector(b->data, b->sectorno);
	#endif
}
    80205646:	60a2                	ld	ra,8(sp)
    80205648:	6402                	ld	s0,0(sp)
    8020564a:	0141                	addi	sp,sp,16
    8020564c:	8082                	ret

000000008020564e <disk_write>:

void disk_write(struct buf *b)
{
    8020564e:	1141                	addi	sp,sp,-16
    80205650:	e406                	sd	ra,8(sp)
    80205652:	e022                	sd	s0,0(sp)
    80205654:	0800                	addi	s0,sp,16
    #ifdef QEMU
    #if QEMU!=SIFIVE_U
	virtio_disk_rw(b, 1);    
    80205656:	4585                	li	a1,1
    80205658:	00000097          	auipc	ra,0x0
    8020565c:	c4c080e7          	jalr	-948(ra) # 802052a4 <virtio_disk_rw>
    	sdcard_write_sector(b->data, b->sectorno);
    #endif
    #else 
	sdcard_write_sector(b->data, b->sectorno);
	#endif
}
    80205660:	60a2                	ld	ra,8(sp)
    80205662:	6402                	ld	s0,0(sp)
    80205664:	0141                	addi	sp,sp,16
    80205666:	8082                	ret

0000000080205668 <disk_intr>:

void disk_intr(void)
{
    80205668:	1141                	addi	sp,sp,-16
    8020566a:	e406                	sd	ra,8(sp)
    8020566c:	e022                	sd	s0,0(sp)
    8020566e:	0800                	addi	s0,sp,16
    #ifdef QEMU
    #if QEMU!=SIFIVE_U
        virtio_disk_intr();
    80205670:	00000097          	auipc	ra,0x0
    80205674:	ee2080e7          	jalr	-286(ra) # 80205552 <virtio_disk_intr>
        dmac_intr(DMAC_CHANNEL0);
    #endif
    #else 
    dmac_intr(DMAC_CHANNEL0);
    #endif
}
    80205678:	60a2                	ld	ra,8(sp)
    8020567a:	6402                	ld	s0,0(sp)
    8020567c:	0141                	addi	sp,sp,16
    8020567e:	8082                	ret

0000000080205680 <read_fat>:
/**
 * Read the FAT table content corresponded to the given cluster number.
 * @param   cluster     the number of cluster which you want to read its content in FAT table
 */
static uint32 read_fat(uint32 cluster)
{
    80205680:	1101                	addi	sp,sp,-32
    80205682:	ec06                	sd	ra,24(sp)
    80205684:	e822                	sd	s0,16(sp)
    80205686:	e426                	sd	s1,8(sp)
    80205688:	e04a                	sd	s2,0(sp)
    8020568a:	1000                	addi	s0,sp,32
    if (cluster >= FAT32_EOC) {
    8020568c:	100007b7          	lui	a5,0x10000
    80205690:	17dd                	addi	a5,a5,-9
        return cluster;
    80205692:	84aa                	mv	s1,a0
    if (cluster >= FAT32_EOC) {
    80205694:	00a7ea63          	bltu	a5,a0,802056a8 <read_fat+0x28>
    }
    if (cluster > fat.data_clus_cnt + 1) {     // because cluster number starts at 2, not 0
    80205698:	000b4797          	auipc	a5,0xb4
    8020569c:	9707a783          	lw	a5,-1680(a5) # 802b9008 <fat+0x8>
    802056a0:	2785                	addiw	a5,a5,1
        return 0;
    802056a2:	4481                	li	s1,0
    if (cluster > fat.data_clus_cnt + 1) {     // because cluster number starts at 2, not 0
    802056a4:	00a7f963          	bgeu	a5,a0,802056b6 <read_fat+0x36>
    // here should be a cache layer for FAT table, but not implemented yet.
    struct buf *b = bread(0, fat_sec);
    uint32 next_clus = *(uint32 *)(b->data + fat_offset_of_clus(cluster));
    brelse(b);
    return next_clus;
}
    802056a8:	8526                	mv	a0,s1
    802056aa:	60e2                	ld	ra,24(sp)
    802056ac:	6442                	ld	s0,16(sp)
    802056ae:	64a2                	ld	s1,8(sp)
    802056b0:	6902                	ld	s2,0(sp)
    802056b2:	6105                	addi	sp,sp,32
    802056b4:	8082                	ret
    return fat.bpb.rsvd_sec_cnt + (cluster << 2) / fat.bpb.byts_per_sec + fat.bpb.fat_sz * (fat_num - 1);
    802056b6:	0025149b          	slliw	s1,a0,0x2
    802056ba:	000b4917          	auipc	s2,0xb4
    802056be:	94690913          	addi	s2,s2,-1722 # 802b9000 <fat>
    802056c2:	01095783          	lhu	a5,16(s2)
    802056c6:	02f4d7bb          	divuw	a5,s1,a5
    802056ca:	01495583          	lhu	a1,20(s2)
    struct buf *b = bread(0, fat_sec);
    802056ce:	9dbd                	addw	a1,a1,a5
    802056d0:	4501                	li	a0,0
    802056d2:	ffffe097          	auipc	ra,0xffffe
    802056d6:	d4c080e7          	jalr	-692(ra) # 8020341e <bread>
    return (cluster << 2) % fat.bpb.byts_per_sec;
    802056da:	01095783          	lhu	a5,16(s2)
    802056de:	02f4f4bb          	remuw	s1,s1,a5
    uint32 next_clus = *(uint32 *)(b->data + fat_offset_of_clus(cluster));
    802056e2:	1482                	slli	s1,s1,0x20
    802056e4:	9081                	srli	s1,s1,0x20
    802056e6:	94aa                	add	s1,s1,a0
    802056e8:	4ca4                	lw	s1,88(s1)
    brelse(b);
    802056ea:	ffffe097          	auipc	ra,0xffffe
    802056ee:	e60080e7          	jalr	-416(ra) # 8020354a <brelse>
    return next_clus;
    802056f2:	bf5d                	j	802056a8 <read_fat+0x28>

00000000802056f4 <alloc_clus>:
        brelse(b);
    }
}

static uint32 alloc_clus(uint8 dev)
{
    802056f4:	711d                	addi	sp,sp,-96
    802056f6:	ec86                	sd	ra,88(sp)
    802056f8:	e8a2                	sd	s0,80(sp)
    802056fa:	e4a6                	sd	s1,72(sp)
    802056fc:	e0ca                	sd	s2,64(sp)
    802056fe:	fc4e                	sd	s3,56(sp)
    80205700:	f852                	sd	s4,48(sp)
    80205702:	f456                	sd	s5,40(sp)
    80205704:	f05a                	sd	s6,32(sp)
    80205706:	ec5e                	sd	s7,24(sp)
    80205708:	e862                	sd	s8,16(sp)
    8020570a:	e466                	sd	s9,8(sp)
    8020570c:	1080                	addi	s0,sp,96
    // should we keep a free cluster list? instead of searching fat every time.
    struct buf *b;
    uint32 sec = fat.bpb.rsvd_sec_cnt;
    8020570e:	000b4797          	auipc	a5,0xb4
    80205712:	8f278793          	addi	a5,a5,-1806 # 802b9000 <fat>
    80205716:	0147db83          	lhu	s7,20(a5)
    uint32 const ent_per_sec = fat.bpb.byts_per_sec / sizeof(uint32);
    8020571a:	0107d903          	lhu	s2,16(a5)
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    8020571e:	539c                	lw	a5,32(a5)
    80205720:	10078263          	beqz	a5,80205824 <alloc_clus+0x130>
    80205724:	0029591b          	srliw	s2,s2,0x2
    80205728:	0009099b          	sext.w	s3,s2
    8020572c:	4b01                	li	s6,0
        b = bread(dev, sec);
    8020572e:	00050a9b          	sext.w	s5,a0
        for (uint32 j = 0; j < ent_per_sec; j++) {
    80205732:	4c01                	li	s8,0
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    80205734:	000b4c97          	auipc	s9,0xb4
    80205738:	8ccc8c93          	addi	s9,s9,-1844 # 802b9000 <fat>
    8020573c:	a0c1                	j	802057fc <alloc_clus+0x108>
            if (((uint32 *)(b->data))[j] == 0) {
                ((uint32 *)(b->data))[j] = FAT32_EOC + 7;
    8020573e:	100007b7          	lui	a5,0x10000
    80205742:	37fd                	addiw	a5,a5,-1
    80205744:	c29c                	sw	a5,0(a3)
                bwrite(b);
    80205746:	8552                	mv	a0,s4
    80205748:	ffffe097          	auipc	ra,0xffffe
    8020574c:	dc6080e7          	jalr	-570(ra) # 8020350e <bwrite>
                brelse(b);
    80205750:	8552                	mv	a0,s4
    80205752:	ffffe097          	auipc	ra,0xffffe
    80205756:	df8080e7          	jalr	-520(ra) # 8020354a <brelse>
                uint32 clus = i * ent_per_sec + j;
    8020575a:	0369093b          	mulw	s2,s2,s6
    8020575e:	009904bb          	addw	s1,s2,s1
    80205762:	00048a9b          	sext.w	s5,s1
    return ((cluster - 2) * fat.bpb.sec_per_clus) + fat.first_data_sec;
    80205766:	000b4717          	auipc	a4,0xb4
    8020576a:	89a70713          	addi	a4,a4,-1894 # 802b9000 <fat>
    8020576e:	01274783          	lbu	a5,18(a4)
    80205772:	34f9                	addiw	s1,s1,-2
    80205774:	02f489bb          	mulw	s3,s1,a5
    80205778:	4318                	lw	a4,0(a4)
    8020577a:	00e989bb          	addw	s3,s3,a4
    for (int i = 0; i < fat.bpb.sec_per_clus; i++) {
    8020577e:	c7b1                	beqz	a5,802057ca <alloc_clus+0xd6>
    80205780:	4901                	li	s2,0
    80205782:	000b4a17          	auipc	s4,0xb4
    80205786:	87ea0a13          	addi	s4,s4,-1922 # 802b9000 <fat>
        b = bread(0, sec++);
    8020578a:	013905bb          	addw	a1,s2,s3
    8020578e:	4501                	li	a0,0
    80205790:	ffffe097          	auipc	ra,0xffffe
    80205794:	c8e080e7          	jalr	-882(ra) # 8020341e <bread>
    80205798:	84aa                	mv	s1,a0
        memset(b->data, 0, BSIZE);
    8020579a:	20000613          	li	a2,512
    8020579e:	4581                	li	a1,0
    802057a0:	05850513          	addi	a0,a0,88
    802057a4:	ffffb097          	auipc	ra,0xffffb
    802057a8:	fec080e7          	jalr	-20(ra) # 80200790 <memset>
        bwrite(b);
    802057ac:	8526                	mv	a0,s1
    802057ae:	ffffe097          	auipc	ra,0xffffe
    802057b2:	d60080e7          	jalr	-672(ra) # 8020350e <bwrite>
        brelse(b);
    802057b6:	8526                	mv	a0,s1
    802057b8:	ffffe097          	auipc	ra,0xffffe
    802057bc:	d92080e7          	jalr	-622(ra) # 8020354a <brelse>
    for (int i = 0; i < fat.bpb.sec_per_clus; i++) {
    802057c0:	2905                	addiw	s2,s2,1
    802057c2:	012a4783          	lbu	a5,18(s4)
    802057c6:	fcf942e3          	blt	s2,a5,8020578a <alloc_clus+0x96>
            }
        }
        brelse(b);
    }
    panic("no clusters");
}
    802057ca:	8556                	mv	a0,s5
    802057cc:	60e6                	ld	ra,88(sp)
    802057ce:	6446                	ld	s0,80(sp)
    802057d0:	64a6                	ld	s1,72(sp)
    802057d2:	6906                	ld	s2,64(sp)
    802057d4:	79e2                	ld	s3,56(sp)
    802057d6:	7a42                	ld	s4,48(sp)
    802057d8:	7aa2                	ld	s5,40(sp)
    802057da:	7b02                	ld	s6,32(sp)
    802057dc:	6be2                	ld	s7,24(sp)
    802057de:	6c42                	ld	s8,16(sp)
    802057e0:	6ca2                	ld	s9,8(sp)
    802057e2:	6125                	addi	sp,sp,96
    802057e4:	8082                	ret
        brelse(b);
    802057e6:	8552                	mv	a0,s4
    802057e8:	ffffe097          	auipc	ra,0xffffe
    802057ec:	d62080e7          	jalr	-670(ra) # 8020354a <brelse>
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    802057f0:	2b05                	addiw	s6,s6,1
    802057f2:	2b85                	addiw	s7,s7,1
    802057f4:	020ca783          	lw	a5,32(s9)
    802057f8:	02fb7663          	bgeu	s6,a5,80205824 <alloc_clus+0x130>
        b = bread(dev, sec);
    802057fc:	85de                	mv	a1,s7
    802057fe:	8556                	mv	a0,s5
    80205800:	ffffe097          	auipc	ra,0xffffe
    80205804:	c1e080e7          	jalr	-994(ra) # 8020341e <bread>
    80205808:	8a2a                	mv	s4,a0
        for (uint32 j = 0; j < ent_per_sec; j++) {
    8020580a:	fc098ee3          	beqz	s3,802057e6 <alloc_clus+0xf2>
    8020580e:	05850793          	addi	a5,a0,88
    80205812:	84e2                	mv	s1,s8
            if (((uint32 *)(b->data))[j] == 0) {
    80205814:	86be                	mv	a3,a5
    80205816:	4398                	lw	a4,0(a5)
    80205818:	d31d                	beqz	a4,8020573e <alloc_clus+0x4a>
        for (uint32 j = 0; j < ent_per_sec; j++) {
    8020581a:	2485                	addiw	s1,s1,1
    8020581c:	0791                	addi	a5,a5,4
    8020581e:	fe999be3          	bne	s3,s1,80205814 <alloc_clus+0x120>
    80205822:	b7d1                	j	802057e6 <alloc_clus+0xf2>
    panic("no clusters");
    80205824:	00004517          	auipc	a0,0x4
    80205828:	6d450513          	addi	a0,a0,1748 # 80209ef8 <sysnames+0x2c0>
    8020582c:	ffffb097          	auipc	ra,0xffffb
    80205830:	918080e7          	jalr	-1768(ra) # 80200144 <panic>

0000000080205834 <write_fat>:
    if (cluster > fat.data_clus_cnt + 1) {
    80205834:	000b3797          	auipc	a5,0xb3
    80205838:	7d47a783          	lw	a5,2004(a5) # 802b9008 <fat+0x8>
    8020583c:	2785                	addiw	a5,a5,1
    8020583e:	06a7e963          	bltu	a5,a0,802058b0 <write_fat+0x7c>
{
    80205842:	7179                	addi	sp,sp,-48
    80205844:	f406                	sd	ra,40(sp)
    80205846:	f022                	sd	s0,32(sp)
    80205848:	ec26                	sd	s1,24(sp)
    8020584a:	e84a                	sd	s2,16(sp)
    8020584c:	e44e                	sd	s3,8(sp)
    8020584e:	e052                	sd	s4,0(sp)
    80205850:	1800                	addi	s0,sp,48
    80205852:	89ae                	mv	s3,a1
    return fat.bpb.rsvd_sec_cnt + (cluster << 2) / fat.bpb.byts_per_sec + fat.bpb.fat_sz * (fat_num - 1);
    80205854:	0025149b          	slliw	s1,a0,0x2
    80205858:	000b3a17          	auipc	s4,0xb3
    8020585c:	7a8a0a13          	addi	s4,s4,1960 # 802b9000 <fat>
    80205860:	010a5783          	lhu	a5,16(s4)
    80205864:	02f4d7bb          	divuw	a5,s1,a5
    80205868:	014a5583          	lhu	a1,20(s4)
    struct buf *b = bread(0, fat_sec);
    8020586c:	9dbd                	addw	a1,a1,a5
    8020586e:	4501                	li	a0,0
    80205870:	ffffe097          	auipc	ra,0xffffe
    80205874:	bae080e7          	jalr	-1106(ra) # 8020341e <bread>
    80205878:	892a                	mv	s2,a0
    return (cluster << 2) % fat.bpb.byts_per_sec;
    8020587a:	010a5783          	lhu	a5,16(s4)
    8020587e:	02f4f4bb          	remuw	s1,s1,a5
    *(uint32 *)(b->data + off) = content;
    80205882:	1482                	slli	s1,s1,0x20
    80205884:	9081                	srli	s1,s1,0x20
    80205886:	94aa                	add	s1,s1,a0
    80205888:	0534ac23          	sw	s3,88(s1)
    bwrite(b);
    8020588c:	ffffe097          	auipc	ra,0xffffe
    80205890:	c82080e7          	jalr	-894(ra) # 8020350e <bwrite>
    brelse(b);
    80205894:	854a                	mv	a0,s2
    80205896:	ffffe097          	auipc	ra,0xffffe
    8020589a:	cb4080e7          	jalr	-844(ra) # 8020354a <brelse>
    return 0;
    8020589e:	4501                	li	a0,0
}
    802058a0:	70a2                	ld	ra,40(sp)
    802058a2:	7402                	ld	s0,32(sp)
    802058a4:	64e2                	ld	s1,24(sp)
    802058a6:	6942                	ld	s2,16(sp)
    802058a8:	69a2                	ld	s3,8(sp)
    802058aa:	6a02                	ld	s4,0(sp)
    802058ac:	6145                	addi	sp,sp,48
    802058ae:	8082                	ret
        return -1;
    802058b0:	557d                	li	a0,-1
}
    802058b2:	8082                	ret

00000000802058b4 <reloc_clus>:
 * @param   off         the offset from the beginning of the relative file
 * @param   alloc       whether alloc new cluster when meeting end of FAT chains
 * @return              the offset from the new cur_clus
 */
static int reloc_clus(struct dirent *entry, uint off, int alloc)
{
    802058b4:	715d                	addi	sp,sp,-80
    802058b6:	e486                	sd	ra,72(sp)
    802058b8:	e0a2                	sd	s0,64(sp)
    802058ba:	fc26                	sd	s1,56(sp)
    802058bc:	f84a                	sd	s2,48(sp)
    802058be:	f44e                	sd	s3,40(sp)
    802058c0:	f052                	sd	s4,32(sp)
    802058c2:	ec56                	sd	s5,24(sp)
    802058c4:	e85a                	sd	s6,16(sp)
    802058c6:	e45e                	sd	s7,8(sp)
    802058c8:	0880                	addi	s0,sp,80
    802058ca:	84aa                	mv	s1,a0
    802058cc:	8a2e                	mv	s4,a1
    int clus_num = off / fat.byts_per_clus;
    802058ce:	000b3b97          	auipc	s7,0xb3
    802058d2:	73ebab83          	lw	s7,1854(s7) # 802b900c <fat+0xc>
    802058d6:	0375d9bb          	divuw	s3,a1,s7
    while (clus_num > entry->clus_cnt) {
    802058da:	11052703          	lw	a4,272(a0)
    802058de:	07377663          	bgeu	a4,s3,8020594a <reloc_clus+0x96>
    802058e2:	8b32                	mv	s6,a2
        int clus = read_fat(entry->cur_clus);
        if (clus >= FAT32_EOC) {
    802058e4:	10000ab7          	lui	s5,0x10000
    802058e8:	1add                	addi	s5,s5,-9
    802058ea:	a025                	j	80205912 <reloc_clus+0x5e>
            if (alloc) {
                clus = alloc_clus(entry->dev);
                write_fat(entry->cur_clus, clus);
            } else {
                entry->cur_clus = entry->first_clus;
    802058ec:	1044a783          	lw	a5,260(s1)
    802058f0:	10f4a623          	sw	a5,268(s1)
                entry->clus_cnt = 0;
    802058f4:	1004a823          	sw	zero,272(s1)
                return -1;
    802058f8:	557d                	li	a0,-1
    802058fa:	a879                	j	80205998 <reloc_clus+0xe4>
            }
        }
        entry->cur_clus = clus;
    802058fc:	1124a623          	sw	s2,268(s1)
        entry->clus_cnt++;
    80205900:	1104a783          	lw	a5,272(s1)
    80205904:	2785                	addiw	a5,a5,1
    80205906:	0007871b          	sext.w	a4,a5
    8020590a:	10f4a823          	sw	a5,272(s1)
    while (clus_num > entry->clus_cnt) {
    8020590e:	03377e63          	bgeu	a4,s3,8020594a <reloc_clus+0x96>
        int clus = read_fat(entry->cur_clus);
    80205912:	10c4a503          	lw	a0,268(s1)
    80205916:	00000097          	auipc	ra,0x0
    8020591a:	d6a080e7          	jalr	-662(ra) # 80205680 <read_fat>
    8020591e:	0005091b          	sext.w	s2,a0
        if (clus >= FAT32_EOC) {
    80205922:	fd2adde3          	bge	s5,s2,802058fc <reloc_clus+0x48>
            if (alloc) {
    80205926:	fc0b03e3          	beqz	s6,802058ec <reloc_clus+0x38>
                clus = alloc_clus(entry->dev);
    8020592a:	1144c503          	lbu	a0,276(s1)
    8020592e:	00000097          	auipc	ra,0x0
    80205932:	dc6080e7          	jalr	-570(ra) # 802056f4 <alloc_clus>
    80205936:	0005091b          	sext.w	s2,a0
                write_fat(entry->cur_clus, clus);
    8020593a:	85ca                	mv	a1,s2
    8020593c:	10c4a503          	lw	a0,268(s1)
    80205940:	00000097          	auipc	ra,0x0
    80205944:	ef4080e7          	jalr	-268(ra) # 80205834 <write_fat>
    80205948:	bf55                	j	802058fc <reloc_clus+0x48>
    }
    if (clus_num < entry->clus_cnt) {
    8020594a:	04e9f163          	bgeu	s3,a4,8020598c <reloc_clus+0xd8>
        entry->cur_clus = entry->first_clus;
    8020594e:	1044a783          	lw	a5,260(s1)
    80205952:	10f4a623          	sw	a5,268(s1)
        entry->clus_cnt = 0;
    80205956:	1004a823          	sw	zero,272(s1)
        while (entry->clus_cnt < clus_num) {
    8020595a:	037a6963          	bltu	s4,s7,8020598c <reloc_clus+0xd8>
            entry->cur_clus = read_fat(entry->cur_clus);
            if (entry->cur_clus >= FAT32_EOC) {
    8020595e:	10000937          	lui	s2,0x10000
    80205962:	195d                	addi	s2,s2,-9
            entry->cur_clus = read_fat(entry->cur_clus);
    80205964:	10c4a503          	lw	a0,268(s1)
    80205968:	00000097          	auipc	ra,0x0
    8020596c:	d18080e7          	jalr	-744(ra) # 80205680 <read_fat>
    80205970:	2501                	sext.w	a0,a0
    80205972:	10a4a623          	sw	a0,268(s1)
            if (entry->cur_clus >= FAT32_EOC) {
    80205976:	02a96c63          	bltu	s2,a0,802059ae <reloc_clus+0xfa>
                panic("reloc_clus");
            }
            entry->clus_cnt++;
    8020597a:	1104a783          	lw	a5,272(s1)
    8020597e:	2785                	addiw	a5,a5,1
    80205980:	0007871b          	sext.w	a4,a5
    80205984:	10f4a823          	sw	a5,272(s1)
        while (entry->clus_cnt < clus_num) {
    80205988:	fd376ee3          	bltu	a4,s3,80205964 <reloc_clus+0xb0>
        }
    }
    return off % fat.byts_per_clus;
    8020598c:	000b3517          	auipc	a0,0xb3
    80205990:	68052503          	lw	a0,1664(a0) # 802b900c <fat+0xc>
    80205994:	02aa753b          	remuw	a0,s4,a0
}
    80205998:	60a6                	ld	ra,72(sp)
    8020599a:	6406                	ld	s0,64(sp)
    8020599c:	74e2                	ld	s1,56(sp)
    8020599e:	7942                	ld	s2,48(sp)
    802059a0:	79a2                	ld	s3,40(sp)
    802059a2:	7a02                	ld	s4,32(sp)
    802059a4:	6ae2                	ld	s5,24(sp)
    802059a6:	6b42                	ld	s6,16(sp)
    802059a8:	6ba2                	ld	s7,8(sp)
    802059aa:	6161                	addi	sp,sp,80
    802059ac:	8082                	ret
                panic("reloc_clus");
    802059ae:	00004517          	auipc	a0,0x4
    802059b2:	55a50513          	addi	a0,a0,1370 # 80209f08 <sysnames+0x2d0>
    802059b6:	ffffa097          	auipc	ra,0xffffa
    802059ba:	78e080e7          	jalr	1934(ra) # 80200144 <panic>

00000000802059be <rw_clus>:
{
    802059be:	7119                	addi	sp,sp,-128
    802059c0:	fc86                	sd	ra,120(sp)
    802059c2:	f8a2                	sd	s0,112(sp)
    802059c4:	f4a6                	sd	s1,104(sp)
    802059c6:	f0ca                	sd	s2,96(sp)
    802059c8:	ecce                	sd	s3,88(sp)
    802059ca:	e8d2                	sd	s4,80(sp)
    802059cc:	e4d6                	sd	s5,72(sp)
    802059ce:	e0da                	sd	s6,64(sp)
    802059d0:	fc5e                	sd	s7,56(sp)
    802059d2:	f862                	sd	s8,48(sp)
    802059d4:	f466                	sd	s9,40(sp)
    802059d6:	f06a                	sd	s10,32(sp)
    802059d8:	ec6e                	sd	s11,24(sp)
    802059da:	0100                	addi	s0,sp,128
    802059dc:	f8c43423          	sd	a2,-120(s0)
    802059e0:	8b36                	mv	s6,a3
    802059e2:	8c3e                	mv	s8,a5
    if (off + n > fat.byts_per_clus)
    802059e4:	00f706bb          	addw	a3,a4,a5
    802059e8:	000b3797          	auipc	a5,0xb3
    802059ec:	6247a783          	lw	a5,1572(a5) # 802b900c <fat+0xc>
    802059f0:	02d7ef63          	bltu	a5,a3,80205a2e <rw_clus+0x70>
    802059f4:	8cae                	mv	s9,a1
    uint sec = first_sec_of_clus(cluster) + off / fat.bpb.byts_per_sec;
    802059f6:	000b3797          	auipc	a5,0xb3
    802059fa:	60a78793          	addi	a5,a5,1546 # 802b9000 <fat>
    802059fe:	0107da83          	lhu	s5,16(a5)
    return ((cluster - 2) * fat.bpb.sec_per_clus) + fat.first_data_sec;
    80205a02:	ffe5099b          	addiw	s3,a0,-2
    80205a06:	0127c503          	lbu	a0,18(a5)
    80205a0a:	02a989bb          	mulw	s3,s3,a0
    80205a0e:	4388                	lw	a0,0(a5)
    80205a10:	00a989bb          	addw	s3,s3,a0
    uint sec = first_sec_of_clus(cluster) + off / fat.bpb.byts_per_sec;
    80205a14:	035757bb          	divuw	a5,a4,s5
    80205a18:	00f989bb          	addw	s3,s3,a5
    off = off % fat.bpb.byts_per_sec;
    80205a1c:	03577abb          	remuw	s5,a4,s5
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    80205a20:	0e0c0363          	beqz	s8,80205b06 <rw_clus+0x148>
    80205a24:	4a01                	li	s4,0
        m = BSIZE - off % BSIZE;
    80205a26:	20000d93          	li	s11,512
        if (bad == -1) {
    80205a2a:	5d7d                	li	s10,-1
    80205a2c:	a095                	j	80205a90 <rw_clus+0xd2>
        panic("offset out of range");
    80205a2e:	00004517          	auipc	a0,0x4
    80205a32:	4ea50513          	addi	a0,a0,1258 # 80209f18 <sysnames+0x2e0>
    80205a36:	ffffa097          	auipc	ra,0xffffa
    80205a3a:	70e080e7          	jalr	1806(ra) # 80200144 <panic>
                bwrite(bp);
    80205a3e:	854a                	mv	a0,s2
    80205a40:	ffffe097          	auipc	ra,0xffffe
    80205a44:	ace080e7          	jalr	-1330(ra) # 8020350e <bwrite>
        brelse(bp);
    80205a48:	854a                	mv	a0,s2
    80205a4a:	ffffe097          	auipc	ra,0xffffe
    80205a4e:	b00080e7          	jalr	-1280(ra) # 8020354a <brelse>
        if (bad == -1) {
    80205a52:	a02d                	j	80205a7c <rw_clus+0xbe>
            bad = either_copyout(user, data, bp->data + (off % BSIZE), m);
    80205a54:	05890613          	addi	a2,s2,88 # 10000058 <_entry-0x701fffa8>
    80205a58:	1682                	slli	a3,a3,0x20
    80205a5a:	9281                	srli	a3,a3,0x20
    80205a5c:	963a                	add	a2,a2,a4
    80205a5e:	85da                	mv	a1,s6
    80205a60:	f8843503          	ld	a0,-120(s0)
    80205a64:	ffffd097          	auipc	ra,0xffffd
    80205a68:	b90080e7          	jalr	-1136(ra) # 802025f4 <either_copyout>
    80205a6c:	8baa                	mv	s7,a0
        brelse(bp);
    80205a6e:	854a                	mv	a0,s2
    80205a70:	ffffe097          	auipc	ra,0xffffe
    80205a74:	ada080e7          	jalr	-1318(ra) # 8020354a <brelse>
        if (bad == -1) {
    80205a78:	07ab8763          	beq	s7,s10,80205ae6 <rw_clus+0x128>
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    80205a7c:	01448a3b          	addw	s4,s1,s4
    80205a80:	01548abb          	addw	s5,s1,s5
    80205a84:	1482                	slli	s1,s1,0x20
    80205a86:	9081                	srli	s1,s1,0x20
    80205a88:	9b26                	add	s6,s6,s1
    80205a8a:	2985                	addiw	s3,s3,1
    80205a8c:	058a7d63          	bgeu	s4,s8,80205ae6 <rw_clus+0x128>
        bp = bread(0, sec);
    80205a90:	85ce                	mv	a1,s3
    80205a92:	4501                	li	a0,0
    80205a94:	ffffe097          	auipc	ra,0xffffe
    80205a98:	98a080e7          	jalr	-1654(ra) # 8020341e <bread>
    80205a9c:	892a                	mv	s2,a0
        m = BSIZE - off % BSIZE;
    80205a9e:	1ffaf713          	andi	a4,s5,511
    80205aa2:	40ed863b          	subw	a2,s11,a4
        if (n - tot < m) {
    80205aa6:	414c07bb          	subw	a5,s8,s4
    80205aaa:	86be                	mv	a3,a5
    80205aac:	2781                	sext.w	a5,a5
    80205aae:	0006059b          	sext.w	a1,a2
    80205ab2:	00f5f363          	bgeu	a1,a5,80205ab8 <rw_clus+0xfa>
    80205ab6:	86b2                	mv	a3,a2
    80205ab8:	0006849b          	sext.w	s1,a3
        if (write) {
    80205abc:	f80c8ce3          	beqz	s9,80205a54 <rw_clus+0x96>
            if ((bad = either_copyin(bp->data + (off % BSIZE), user, data, m)) != -1) {
    80205ac0:	05890513          	addi	a0,s2,88
    80205ac4:	1682                	slli	a3,a3,0x20
    80205ac6:	9281                	srli	a3,a3,0x20
    80205ac8:	865a                	mv	a2,s6
    80205aca:	f8843583          	ld	a1,-120(s0)
    80205ace:	953a                	add	a0,a0,a4
    80205ad0:	ffffd097          	auipc	ra,0xffffd
    80205ad4:	b5a080e7          	jalr	-1190(ra) # 8020262a <either_copyin>
    80205ad8:	f7a513e3          	bne	a0,s10,80205a3e <rw_clus+0x80>
        brelse(bp);
    80205adc:	854a                	mv	a0,s2
    80205ade:	ffffe097          	auipc	ra,0xffffe
    80205ae2:	a6c080e7          	jalr	-1428(ra) # 8020354a <brelse>
}
    80205ae6:	8552                	mv	a0,s4
    80205ae8:	70e6                	ld	ra,120(sp)
    80205aea:	7446                	ld	s0,112(sp)
    80205aec:	74a6                	ld	s1,104(sp)
    80205aee:	7906                	ld	s2,96(sp)
    80205af0:	69e6                	ld	s3,88(sp)
    80205af2:	6a46                	ld	s4,80(sp)
    80205af4:	6aa6                	ld	s5,72(sp)
    80205af6:	6b06                	ld	s6,64(sp)
    80205af8:	7be2                	ld	s7,56(sp)
    80205afa:	7c42                	ld	s8,48(sp)
    80205afc:	7ca2                	ld	s9,40(sp)
    80205afe:	7d02                	ld	s10,32(sp)
    80205b00:	6de2                	ld	s11,24(sp)
    80205b02:	6109                	addi	sp,sp,128
    80205b04:	8082                	ret
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    80205b06:	8a62                	mv	s4,s8
    80205b08:	bff9                	j	80205ae6 <rw_clus+0x128>

0000000080205b0a <eget>:
// by their whole path. But when parsing a path, we open all the directories through it, 
// which forms a linked list from the final file to the root. Thus, we use the "parent" pointer 
// to recognize whether an entry with the "name" as given is really the file we want in the right path.
// Should never get root by eget, it's easy to understand.
static struct dirent *eget(struct dirent *parent, char *name)
{
    80205b0a:	7139                	addi	sp,sp,-64
    80205b0c:	fc06                	sd	ra,56(sp)
    80205b0e:	f822                	sd	s0,48(sp)
    80205b10:	f426                	sd	s1,40(sp)
    80205b12:	f04a                	sd	s2,32(sp)
    80205b14:	ec4e                	sd	s3,24(sp)
    80205b16:	e852                	sd	s4,16(sp)
    80205b18:	e456                	sd	s5,8(sp)
    80205b1a:	0080                	addi	s0,sp,64
    80205b1c:	8a2a                	mv	s4,a0
    80205b1e:	8aae                	mv	s5,a1
    struct dirent *ep;
    acquire(&ecache.lock);
    80205b20:	000b3517          	auipc	a0,0xb3
    80205b24:	67050513          	addi	a0,a0,1648 # 802b9190 <ecache>
    80205b28:	ffffb097          	auipc	ra,0xffffb
    80205b2c:	bcc080e7          	jalr	-1076(ra) # 802006f4 <acquire>
    if (name) {
    80205b30:	060a8b63          	beqz	s5,80205ba6 <eget+0x9c>
        for (ep = root.next; ep != &root; ep = ep->next) {          // LRU algo
    80205b34:	000b3497          	auipc	s1,0xb3
    80205b38:	61c4b483          	ld	s1,1564(s1) # 802b9150 <root+0x128>
    80205b3c:	000b3797          	auipc	a5,0xb3
    80205b40:	4ec78793          	addi	a5,a5,1260 # 802b9028 <root>
    80205b44:	06f48163          	beq	s1,a5,80205ba6 <eget+0x9c>
            if (ep->valid == 1 && ep->parent == parent
    80205b48:	4905                	li	s2,1
        for (ep = root.next; ep != &root; ep = ep->next) {          // LRU algo
    80205b4a:	89be                	mv	s3,a5
    80205b4c:	a029                	j	80205b56 <eget+0x4c>
    80205b4e:	1284b483          	ld	s1,296(s1)
    80205b52:	05348a63          	beq	s1,s3,80205ba6 <eget+0x9c>
            if (ep->valid == 1 && ep->parent == parent
    80205b56:	11649783          	lh	a5,278(s1)
    80205b5a:	ff279ae3          	bne	a5,s2,80205b4e <eget+0x44>
    80205b5e:	1204b783          	ld	a5,288(s1)
    80205b62:	ff4796e3          	bne	a5,s4,80205b4e <eget+0x44>
                && strncmp(ep->filename, name, FAT32_MAX_FILENAME) == 0) {
    80205b66:	0ff00613          	li	a2,255
    80205b6a:	85d6                	mv	a1,s5
    80205b6c:	8526                	mv	a0,s1
    80205b6e:	ffffb097          	auipc	ra,0xffffb
    80205b72:	cfe080e7          	jalr	-770(ra) # 8020086c <strncmp>
    80205b76:	fd61                	bnez	a0,80205b4e <eget+0x44>
                if (ep->ref++ == 0) {
    80205b78:	1184a783          	lw	a5,280(s1)
    80205b7c:	0017871b          	addiw	a4,a5,1
    80205b80:	10e4ac23          	sw	a4,280(s1)
    80205b84:	eb81                	bnez	a5,80205b94 <eget+0x8a>
                    ep->parent->ref++;
    80205b86:	1204b703          	ld	a4,288(s1)
    80205b8a:	11872783          	lw	a5,280(a4)
    80205b8e:	2785                	addiw	a5,a5,1
    80205b90:	10f72c23          	sw	a5,280(a4)
                }
                release(&ecache.lock);
    80205b94:	000b3517          	auipc	a0,0xb3
    80205b98:	5fc50513          	addi	a0,a0,1532 # 802b9190 <ecache>
    80205b9c:	ffffb097          	auipc	ra,0xffffb
    80205ba0:	bac080e7          	jalr	-1108(ra) # 80200748 <release>
                // edup(ep->parent);
                return ep;
    80205ba4:	a085                	j	80205c04 <eget+0xfa>
            }
        }
    }
    for (ep = root.prev; ep != &root; ep = ep->prev) {              // LRU algo
    80205ba6:	000b3497          	auipc	s1,0xb3
    80205baa:	5b24b483          	ld	s1,1458(s1) # 802b9158 <root+0x130>
    80205bae:	000b3797          	auipc	a5,0xb3
    80205bb2:	47a78793          	addi	a5,a5,1146 # 802b9028 <root>
    80205bb6:	00f48a63          	beq	s1,a5,80205bca <eget+0xc0>
    80205bba:	873e                	mv	a4,a5
        if (ep->ref == 0) {
    80205bbc:	1184a783          	lw	a5,280(s1)
    80205bc0:	cf89                	beqz	a5,80205bda <eget+0xd0>
    for (ep = root.prev; ep != &root; ep = ep->prev) {              // LRU algo
    80205bc2:	1304b483          	ld	s1,304(s1)
    80205bc6:	fee49be3          	bne	s1,a4,80205bbc <eget+0xb2>
            ep->dirty = 0;
            release(&ecache.lock);
            return ep;
        }
    }
    panic("eget: insufficient ecache");
    80205bca:	00004517          	auipc	a0,0x4
    80205bce:	36650513          	addi	a0,a0,870 # 80209f30 <sysnames+0x2f8>
    80205bd2:	ffffa097          	auipc	ra,0xffffa
    80205bd6:	572080e7          	jalr	1394(ra) # 80200144 <panic>
            ep->ref = 1;
    80205bda:	4785                	li	a5,1
    80205bdc:	10f4ac23          	sw	a5,280(s1)
            ep->dev = parent->dev;
    80205be0:	114a4783          	lbu	a5,276(s4)
    80205be4:	10f48a23          	sb	a5,276(s1)
            ep->off = 0;
    80205be8:	1004ae23          	sw	zero,284(s1)
            ep->valid = 0;
    80205bec:	10049b23          	sh	zero,278(s1)
            ep->dirty = 0;
    80205bf0:	10048aa3          	sb	zero,277(s1)
            release(&ecache.lock);
    80205bf4:	000b3517          	auipc	a0,0xb3
    80205bf8:	59c50513          	addi	a0,a0,1436 # 802b9190 <ecache>
    80205bfc:	ffffb097          	auipc	ra,0xffffb
    80205c00:	b4c080e7          	jalr	-1204(ra) # 80200748 <release>
    return 0;
}
    80205c04:	8526                	mv	a0,s1
    80205c06:	70e2                	ld	ra,56(sp)
    80205c08:	7442                	ld	s0,48(sp)
    80205c0a:	74a2                	ld	s1,40(sp)
    80205c0c:	7902                	ld	s2,32(sp)
    80205c0e:	69e2                	ld	s3,24(sp)
    80205c10:	6a42                	ld	s4,16(sp)
    80205c12:	6aa2                	ld	s5,8(sp)
    80205c14:	6121                	addi	sp,sp,64
    80205c16:	8082                	ret

0000000080205c18 <read_entry_name>:
 * @param   buffer      pointer to the array that stores the name
 * @param   raw_entry   pointer to the entry in a sector buffer
 * @param   islong      if non-zero, read as l-n-e, otherwise s-n-e.
 */
static void read_entry_name(char *buffer, union dentry *d)
{
    80205c18:	7179                	addi	sp,sp,-48
    80205c1a:	f406                	sd	ra,40(sp)
    80205c1c:	f022                	sd	s0,32(sp)
    80205c1e:	ec26                	sd	s1,24(sp)
    80205c20:	e84a                	sd	s2,16(sp)
    80205c22:	1800                	addi	s0,sp,48
    80205c24:	84aa                	mv	s1,a0
    80205c26:	892e                	mv	s2,a1
    if (d->lne.attr == ATTR_LONG_NAME) {                       // long entry branch
    80205c28:	00b5c703          	lbu	a4,11(a1)
    80205c2c:	47bd                	li	a5,15
    80205c2e:	08f70463          	beq	a4,a5,80205cb6 <read_entry_name+0x9e>
        snstr(buffer, d->lne.name2, NELEM(d->lne.name2));
        buffer += NELEM(d->lne.name2);
        snstr(buffer, d->lne.name3, NELEM(d->lne.name3));
    } else {
        // assert: only "." and ".." will enter this branch
        memset(buffer, 0, CHAR_SHORT_NAME + 2); // plus '.' and '\0'
    80205c32:	4635                	li	a2,13
    80205c34:	4581                	li	a1,0
    80205c36:	ffffb097          	auipc	ra,0xffffb
    80205c3a:	b5a080e7          	jalr	-1190(ra) # 80200790 <memset>
        int i;
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    80205c3e:	00094703          	lbu	a4,0(s2)
    80205c42:	02000793          	li	a5,32
    80205c46:	0af70b63          	beq	a4,a5,80205cfc <read_entry_name+0xe4>
    80205c4a:	4785                	li	a5,1
    80205c4c:	02000613          	li	a2,32
    80205c50:	45a5                	li	a1,9
            buffer[i] = d->sne.name[i];
    80205c52:	00f486b3          	add	a3,s1,a5
    80205c56:	fee68fa3          	sb	a4,-1(a3)
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    80205c5a:	0007851b          	sext.w	a0,a5
    80205c5e:	00f90733          	add	a4,s2,a5
    80205c62:	00074703          	lbu	a4,0(a4)
    80205c66:	00c70563          	beq	a4,a2,80205c70 <read_entry_name+0x58>
    80205c6a:	0785                	addi	a5,a5,1
    80205c6c:	feb793e3          	bne	a5,a1,80205c52 <read_entry_name+0x3a>
        }
        if (d->sne.name[8] != ' ') {
    80205c70:	00894703          	lbu	a4,8(s2)
    80205c74:	02000793          	li	a5,32
    80205c78:	00f70963          	beq	a4,a5,80205c8a <read_entry_name+0x72>
            buffer[i++] = '.';
    80205c7c:	00a487b3          	add	a5,s1,a0
    80205c80:	02e00713          	li	a4,46
    80205c84:	00e78023          	sb	a4,0(a5)
    80205c88:	2505                	addiw	a0,a0,1
        }
        for (int j = 8; j < CHAR_SHORT_NAME; j++, i++) {
    80205c8a:	00890793          	addi	a5,s2,8
    80205c8e:	94aa                	add	s1,s1,a0
    80205c90:	092d                	addi	s2,s2,11
            if (d->sne.name[j] == ' ') { break; }
    80205c92:	02000693          	li	a3,32
    80205c96:	0007c703          	lbu	a4,0(a5)
    80205c9a:	00d70863          	beq	a4,a3,80205caa <read_entry_name+0x92>
            buffer[i] = d->sne.name[j];
    80205c9e:	00e48023          	sb	a4,0(s1)
        for (int j = 8; j < CHAR_SHORT_NAME; j++, i++) {
    80205ca2:	0785                	addi	a5,a5,1
    80205ca4:	0485                	addi	s1,s1,1
    80205ca6:	ff2798e3          	bne	a5,s2,80205c96 <read_entry_name+0x7e>
        }
    }
}
    80205caa:	70a2                	ld	ra,40(sp)
    80205cac:	7402                	ld	s0,32(sp)
    80205cae:	64e2                	ld	s1,24(sp)
    80205cb0:	6942                	ld	s2,16(sp)
    80205cb2:	6145                	addi	sp,sp,48
    80205cb4:	8082                	ret
        memmove(temp, d->lne.name1, sizeof(temp));
    80205cb6:	4629                	li	a2,10
    80205cb8:	0585                	addi	a1,a1,1
    80205cba:	fd040513          	addi	a0,s0,-48
    80205cbe:	ffffb097          	auipc	ra,0xffffb
    80205cc2:	b32080e7          	jalr	-1230(ra) # 802007f0 <memmove>
        snstr(buffer, temp, NELEM(d->lne.name1));
    80205cc6:	4615                	li	a2,5
    80205cc8:	fd040593          	addi	a1,s0,-48
    80205ccc:	8526                	mv	a0,s1
    80205cce:	ffffb097          	auipc	ra,0xffffb
    80205cd2:	ca8080e7          	jalr	-856(ra) # 80200976 <snstr>
        snstr(buffer, d->lne.name2, NELEM(d->lne.name2));
    80205cd6:	4619                	li	a2,6
    80205cd8:	00e90593          	addi	a1,s2,14
    80205cdc:	00548513          	addi	a0,s1,5
    80205ce0:	ffffb097          	auipc	ra,0xffffb
    80205ce4:	c96080e7          	jalr	-874(ra) # 80200976 <snstr>
        snstr(buffer, d->lne.name3, NELEM(d->lne.name3));
    80205ce8:	4609                	li	a2,2
    80205cea:	01c90593          	addi	a1,s2,28
    80205cee:	00b48513          	addi	a0,s1,11
    80205cf2:	ffffb097          	auipc	ra,0xffffb
    80205cf6:	c84080e7          	jalr	-892(ra) # 80200976 <snstr>
    80205cfa:	bf45                	j	80205caa <read_entry_name+0x92>
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    80205cfc:	4501                	li	a0,0
    80205cfe:	bf8d                	j	80205c70 <read_entry_name+0x58>

0000000080205d00 <fat32_init>:
{
    80205d00:	7139                	addi	sp,sp,-64
    80205d02:	fc06                	sd	ra,56(sp)
    80205d04:	f822                	sd	s0,48(sp)
    80205d06:	f426                	sd	s1,40(sp)
    80205d08:	f04a                	sd	s2,32(sp)
    80205d0a:	ec4e                	sd	s3,24(sp)
    80205d0c:	e852                	sd	s4,16(sp)
    80205d0e:	e456                	sd	s5,8(sp)
    80205d10:	0080                	addi	s0,sp,64
    printf("[fat32_init] enter!\n");
    80205d12:	00004517          	auipc	a0,0x4
    80205d16:	23e50513          	addi	a0,a0,574 # 80209f50 <sysnames+0x318>
    80205d1a:	ffffa097          	auipc	ra,0xffffa
    80205d1e:	474080e7          	jalr	1140(ra) # 8020018e <printf>
    struct buf *b = bread(0, 0);
    80205d22:	4581                	li	a1,0
    80205d24:	4501                	li	a0,0
    80205d26:	ffffd097          	auipc	ra,0xffffd
    80205d2a:	6f8080e7          	jalr	1784(ra) # 8020341e <bread>
    80205d2e:	892a                	mv	s2,a0
    if (strncmp((char const*)(b->data + 82), "FAT32", 5))
    80205d30:	4615                	li	a2,5
    80205d32:	00004597          	auipc	a1,0x4
    80205d36:	23658593          	addi	a1,a1,566 # 80209f68 <sysnames+0x330>
    80205d3a:	0aa50513          	addi	a0,a0,170
    80205d3e:	ffffb097          	auipc	ra,0xffffb
    80205d42:	b2e080e7          	jalr	-1234(ra) # 8020086c <strncmp>
    80205d46:	1e051163          	bnez	a0,80205f28 <fat32_init+0x228>
    memmove(&fat.bpb.byts_per_sec, b->data + 11, 2);            // avoid misaligned load on k210
    80205d4a:	000b3497          	auipc	s1,0xb3
    80205d4e:	2b648493          	addi	s1,s1,694 # 802b9000 <fat>
    80205d52:	4609                	li	a2,2
    80205d54:	06390593          	addi	a1,s2,99
    80205d58:	000b3517          	auipc	a0,0xb3
    80205d5c:	2b850513          	addi	a0,a0,696 # 802b9010 <fat+0x10>
    80205d60:	ffffb097          	auipc	ra,0xffffb
    80205d64:	a90080e7          	jalr	-1392(ra) # 802007f0 <memmove>
    fat.bpb.sec_per_clus = *(b->data + 13);
    80205d68:	06594683          	lbu	a3,101(s2)
    80205d6c:	00d48923          	sb	a3,18(s1)
    fat.bpb.rsvd_sec_cnt = *(uint16 *)(b->data + 14);
    80205d70:	06695603          	lhu	a2,102(s2)
    80205d74:	00c49a23          	sh	a2,20(s1)
    fat.bpb.fat_cnt = *(b->data + 16);
    80205d78:	06894703          	lbu	a4,104(s2)
    80205d7c:	00e48b23          	sb	a4,22(s1)
    fat.bpb.hidd_sec = *(uint32 *)(b->data + 28);
    80205d80:	07492783          	lw	a5,116(s2)
    80205d84:	cc9c                	sw	a5,24(s1)
    fat.bpb.tot_sec = *(uint32 *)(b->data + 32);
    80205d86:	07892783          	lw	a5,120(s2)
    80205d8a:	ccdc                	sw	a5,28(s1)
    fat.bpb.fat_sz = *(uint32 *)(b->data + 36);
    80205d8c:	07c92583          	lw	a1,124(s2)
    80205d90:	d08c                	sw	a1,32(s1)
    fat.bpb.root_clus = *(uint32 *)(b->data + 44);
    80205d92:	08492503          	lw	a0,132(s2)
    80205d96:	d0c8                	sw	a0,36(s1)
    fat.first_data_sec = fat.bpb.rsvd_sec_cnt + fat.bpb.fat_cnt * fat.bpb.fat_sz;
    80205d98:	02b7073b          	mulw	a4,a4,a1
    80205d9c:	9f31                	addw	a4,a4,a2
    80205d9e:	c098                	sw	a4,0(s1)
    fat.data_sec_cnt = fat.bpb.tot_sec - fat.first_data_sec;
    80205da0:	9f99                	subw	a5,a5,a4
    80205da2:	c0dc                	sw	a5,4(s1)
    fat.data_clus_cnt = fat.data_sec_cnt / fat.bpb.sec_per_clus;
    80205da4:	02d7d7bb          	divuw	a5,a5,a3
    80205da8:	c49c                	sw	a5,8(s1)
    fat.byts_per_clus = fat.bpb.sec_per_clus * fat.bpb.byts_per_sec;
    80205daa:	0104d783          	lhu	a5,16(s1)
    80205dae:	02d787bb          	mulw	a5,a5,a3
    80205db2:	c4dc                	sw	a5,12(s1)
    brelse(b);
    80205db4:	854a                	mv	a0,s2
    80205db6:	ffffd097          	auipc	ra,0xffffd
    80205dba:	794080e7          	jalr	1940(ra) # 8020354a <brelse>
    printf("[FAT32 init]byts_per_sec: %d\n", fat.bpb.byts_per_sec);
    80205dbe:	0104d583          	lhu	a1,16(s1)
    80205dc2:	00004517          	auipc	a0,0x4
    80205dc6:	1c650513          	addi	a0,a0,454 # 80209f88 <sysnames+0x350>
    80205dca:	ffffa097          	auipc	ra,0xffffa
    80205dce:	3c4080e7          	jalr	964(ra) # 8020018e <printf>
    printf("[FAT32 init]root_clus: %d\n", fat.bpb.root_clus);
    80205dd2:	50cc                	lw	a1,36(s1)
    80205dd4:	00004517          	auipc	a0,0x4
    80205dd8:	1d450513          	addi	a0,a0,468 # 80209fa8 <sysnames+0x370>
    80205ddc:	ffffa097          	auipc	ra,0xffffa
    80205de0:	3b2080e7          	jalr	946(ra) # 8020018e <printf>
    printf("[FAT32 init]sec_per_clus: %d\n", fat.bpb.sec_per_clus);
    80205de4:	0124c583          	lbu	a1,18(s1)
    80205de8:	00004517          	auipc	a0,0x4
    80205dec:	1e050513          	addi	a0,a0,480 # 80209fc8 <sysnames+0x390>
    80205df0:	ffffa097          	auipc	ra,0xffffa
    80205df4:	39e080e7          	jalr	926(ra) # 8020018e <printf>
    printf("[FAT32 init]fat_cnt: %d\n", fat.bpb.fat_cnt);
    80205df8:	0164c583          	lbu	a1,22(s1)
    80205dfc:	00004517          	auipc	a0,0x4
    80205e00:	1ec50513          	addi	a0,a0,492 # 80209fe8 <sysnames+0x3b0>
    80205e04:	ffffa097          	auipc	ra,0xffffa
    80205e08:	38a080e7          	jalr	906(ra) # 8020018e <printf>
    printf("[FAT32 init]fat_sz: %d\n", fat.bpb.fat_sz);
    80205e0c:	508c                	lw	a1,32(s1)
    80205e0e:	00004517          	auipc	a0,0x4
    80205e12:	1fa50513          	addi	a0,a0,506 # 8020a008 <sysnames+0x3d0>
    80205e16:	ffffa097          	auipc	ra,0xffffa
    80205e1a:	378080e7          	jalr	888(ra) # 8020018e <printf>
    printf("[FAT32 init]first_data_sec: %d\n", fat.first_data_sec);
    80205e1e:	408c                	lw	a1,0(s1)
    80205e20:	00004517          	auipc	a0,0x4
    80205e24:	20050513          	addi	a0,a0,512 # 8020a020 <sysnames+0x3e8>
    80205e28:	ffffa097          	auipc	ra,0xffffa
    80205e2c:	366080e7          	jalr	870(ra) # 8020018e <printf>
    if (BSIZE != fat.bpb.byts_per_sec) 
    80205e30:	0104d703          	lhu	a4,16(s1)
    80205e34:	20000793          	li	a5,512
    80205e38:	10f71063          	bne	a4,a5,80205f38 <fat32_init+0x238>
    initlock(&ecache.lock, "ecache");
    80205e3c:	00004597          	auipc	a1,0x4
    80205e40:	21c58593          	addi	a1,a1,540 # 8020a058 <sysnames+0x420>
    80205e44:	000b3517          	auipc	a0,0xb3
    80205e48:	34c50513          	addi	a0,a0,844 # 802b9190 <ecache>
    80205e4c:	ffffb097          	auipc	ra,0xffffb
    80205e50:	864080e7          	jalr	-1948(ra) # 802006b0 <initlock>
    memset(&root, 0, sizeof(root));
    80205e54:	000b3497          	auipc	s1,0xb3
    80205e58:	1ac48493          	addi	s1,s1,428 # 802b9000 <fat>
    80205e5c:	000b3917          	auipc	s2,0xb3
    80205e60:	1cc90913          	addi	s2,s2,460 # 802b9028 <root>
    80205e64:	16800613          	li	a2,360
    80205e68:	4581                	li	a1,0
    80205e6a:	854a                	mv	a0,s2
    80205e6c:	ffffb097          	auipc	ra,0xffffb
    80205e70:	924080e7          	jalr	-1756(ra) # 80200790 <memset>
    initsleeplock(&root.lock, "entry");
    80205e74:	00004597          	auipc	a1,0x4
    80205e78:	1ec58593          	addi	a1,a1,492 # 8020a060 <sysnames+0x428>
    80205e7c:	000b3517          	auipc	a0,0xb3
    80205e80:	2e450513          	addi	a0,a0,740 # 802b9160 <root+0x138>
    80205e84:	ffffd097          	auipc	ra,0xffffd
    80205e88:	7dc080e7          	jalr	2012(ra) # 80203660 <initsleeplock>
    root.attribute = (ATTR_DIRECTORY | ATTR_SYSTEM);
    80205e8c:	47d1                	li	a5,20
    80205e8e:	12f48423          	sb	a5,296(s1)
    root.first_clus = root.cur_clus = fat.bpb.root_clus;
    80205e92:	50dc                	lw	a5,36(s1)
    80205e94:	12f4aa23          	sw	a5,308(s1)
    80205e98:	12f4a623          	sw	a5,300(s1)
    root.valid = 1;
    80205e9c:	4785                	li	a5,1
    80205e9e:	12f49f23          	sh	a5,318(s1)
    root.prev = &root;
    80205ea2:	1524bc23          	sd	s2,344(s1)
    root.next = &root;
    80205ea6:	1524b823          	sd	s2,336(s1)
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    80205eaa:	000b3497          	auipc	s1,0xb3
    80205eae:	2fe48493          	addi	s1,s1,766 # 802b91a8 <ecache+0x18>
        de->next = root.next;
    80205eb2:	000b3917          	auipc	s2,0xb3
    80205eb6:	14e90913          	addi	s2,s2,334 # 802b9000 <fat>
        de->prev = &root;
    80205eba:	000b3a97          	auipc	s5,0xb3
    80205ebe:	16ea8a93          	addi	s5,s5,366 # 802b9028 <root>
        initsleeplock(&de->lock, "entry");
    80205ec2:	00004a17          	auipc	s4,0x4
    80205ec6:	19ea0a13          	addi	s4,s4,414 # 8020a060 <sysnames+0x428>
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    80205eca:	000b8997          	auipc	s3,0xb8
    80205ece:	92e98993          	addi	s3,s3,-1746 # 802bd7f8 <cons>
        de->dev = 0;
    80205ed2:	10048a23          	sb	zero,276(s1)
        de->valid = 0;
    80205ed6:	10049b23          	sh	zero,278(s1)
        de->ref = 0;
    80205eda:	1004ac23          	sw	zero,280(s1)
        de->dirty = 0;
    80205ede:	10048aa3          	sb	zero,277(s1)
        de->parent = 0;
    80205ee2:	1204b023          	sd	zero,288(s1)
        de->next = root.next;
    80205ee6:	15093783          	ld	a5,336(s2)
    80205eea:	12f4b423          	sd	a5,296(s1)
        de->prev = &root;
    80205eee:	1354b823          	sd	s5,304(s1)
        initsleeplock(&de->lock, "entry");
    80205ef2:	85d2                	mv	a1,s4
    80205ef4:	13848513          	addi	a0,s1,312
    80205ef8:	ffffd097          	auipc	ra,0xffffd
    80205efc:	768080e7          	jalr	1896(ra) # 80203660 <initsleeplock>
        root.next->prev = de;
    80205f00:	15093783          	ld	a5,336(s2)
    80205f04:	1297b823          	sd	s1,304(a5)
        root.next = de;
    80205f08:	14993823          	sd	s1,336(s2)
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    80205f0c:	16848493          	addi	s1,s1,360
    80205f10:	fd3491e3          	bne	s1,s3,80205ed2 <fat32_init+0x1d2>
}
    80205f14:	4501                	li	a0,0
    80205f16:	70e2                	ld	ra,56(sp)
    80205f18:	7442                	ld	s0,48(sp)
    80205f1a:	74a2                	ld	s1,40(sp)
    80205f1c:	7902                	ld	s2,32(sp)
    80205f1e:	69e2                	ld	s3,24(sp)
    80205f20:	6a42                	ld	s4,16(sp)
    80205f22:	6aa2                	ld	s5,8(sp)
    80205f24:	6121                	addi	sp,sp,64
    80205f26:	8082                	ret
        panic("not FAT32 volume");
    80205f28:	00004517          	auipc	a0,0x4
    80205f2c:	04850513          	addi	a0,a0,72 # 80209f70 <sysnames+0x338>
    80205f30:	ffffa097          	auipc	ra,0xffffa
    80205f34:	214080e7          	jalr	532(ra) # 80200144 <panic>
        panic("byts_per_sec != BSIZE");
    80205f38:	00004517          	auipc	a0,0x4
    80205f3c:	10850513          	addi	a0,a0,264 # 8020a040 <sysnames+0x408>
    80205f40:	ffffa097          	auipc	ra,0xffffa
    80205f44:	204080e7          	jalr	516(ra) # 80200144 <panic>

0000000080205f48 <eread>:
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    80205f48:	10852783          	lw	a5,264(a0)
    80205f4c:	0ed7e863          	bltu	a5,a3,8020603c <eread+0xf4>
{
    80205f50:	711d                	addi	sp,sp,-96
    80205f52:	ec86                	sd	ra,88(sp)
    80205f54:	e8a2                	sd	s0,80(sp)
    80205f56:	e4a6                	sd	s1,72(sp)
    80205f58:	e0ca                	sd	s2,64(sp)
    80205f5a:	fc4e                	sd	s3,56(sp)
    80205f5c:	f852                	sd	s4,48(sp)
    80205f5e:	f456                	sd	s5,40(sp)
    80205f60:	f05a                	sd	s6,32(sp)
    80205f62:	ec5e                	sd	s7,24(sp)
    80205f64:	e862                	sd	s8,16(sp)
    80205f66:	e466                	sd	s9,8(sp)
    80205f68:	e06a                	sd	s10,0(sp)
    80205f6a:	1080                	addi	s0,sp,96
    80205f6c:	8a2a                	mv	s4,a0
    80205f6e:	8bae                	mv	s7,a1
    80205f70:	8ab2                	mv	s5,a2
    80205f72:	8936                	mv	s2,a3
    80205f74:	8b3a                	mv	s6,a4
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    80205f76:	9eb9                	addw	a3,a3,a4
        return 0;
    80205f78:	4501                	li	a0,0
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    80205f7a:	0b26e163          	bltu	a3,s2,8020601c <eread+0xd4>
    80205f7e:	100a4703          	lbu	a4,256(s4)
    80205f82:	8b41                	andi	a4,a4,16
    80205f84:	ef41                	bnez	a4,8020601c <eread+0xd4>
    if (off + n > entry->file_size) {
    80205f86:	00d7f463          	bgeu	a5,a3,80205f8e <eread+0x46>
        n = entry->file_size - off;
    80205f8a:	41278b3b          	subw	s6,a5,s2
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80205f8e:	10ca2703          	lw	a4,268(s4)
    80205f92:	100007b7          	lui	a5,0x10000
    80205f96:	17dd                	addi	a5,a5,-9
    80205f98:	06e7ef63          	bltu	a5,a4,80206016 <eread+0xce>
    80205f9c:	080b0e63          	beqz	s6,80206038 <eread+0xf0>
    80205fa0:	4981                	li	s3,0
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80205fa2:	000b3c97          	auipc	s9,0xb3
    80205fa6:	05ec8c93          	addi	s9,s9,94 # 802b9000 <fat>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80205faa:	8c3e                	mv	s8,a5
    80205fac:	a82d                	j	80205fe6 <eread+0x9e>
    80205fae:	00048d1b          	sext.w	s10,s1
        if (rw_clus(entry->cur_clus, 0, user_dst, dst, off % fat.byts_per_clus, m) != m) {
    80205fb2:	87ea                	mv	a5,s10
    80205fb4:	86d6                	mv	a3,s5
    80205fb6:	865e                	mv	a2,s7
    80205fb8:	4581                	li	a1,0
    80205fba:	10ca2503          	lw	a0,268(s4)
    80205fbe:	00000097          	auipc	ra,0x0
    80205fc2:	a00080e7          	jalr	-1536(ra) # 802059be <rw_clus>
    80205fc6:	2501                	sext.w	a0,a0
    80205fc8:	04ad1863          	bne	s10,a0,80206018 <eread+0xd0>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80205fcc:	013489bb          	addw	s3,s1,s3
    80205fd0:	0124893b          	addw	s2,s1,s2
    80205fd4:	1482                	slli	s1,s1,0x20
    80205fd6:	9081                	srli	s1,s1,0x20
    80205fd8:	9aa6                	add	s5,s5,s1
    80205fda:	10ca2783          	lw	a5,268(s4)
    80205fde:	02fc6d63          	bltu	s8,a5,80206018 <eread+0xd0>
    80205fe2:	0369fb63          	bgeu	s3,s6,80206018 <eread+0xd0>
        reloc_clus(entry, off, 0);
    80205fe6:	4601                	li	a2,0
    80205fe8:	85ca                	mv	a1,s2
    80205fea:	8552                	mv	a0,s4
    80205fec:	00000097          	auipc	ra,0x0
    80205ff0:	8c8080e7          	jalr	-1848(ra) # 802058b4 <reloc_clus>
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80205ff4:	00cca783          	lw	a5,12(s9)
    80205ff8:	02f976bb          	remuw	a3,s2,a5
    80205ffc:	0006871b          	sext.w	a4,a3
    80206000:	9f95                	subw	a5,a5,a3
        if (n - tot < m) {
    80206002:	413b06bb          	subw	a3,s6,s3
    80206006:	84b6                	mv	s1,a3
    80206008:	2681                	sext.w	a3,a3
    8020600a:	0007861b          	sext.w	a2,a5
    8020600e:	fad670e3          	bgeu	a2,a3,80205fae <eread+0x66>
    80206012:	84be                	mv	s1,a5
    80206014:	bf69                	j	80205fae <eread+0x66>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80206016:	4981                	li	s3,0
    return tot;
    80206018:	0009851b          	sext.w	a0,s3
}
    8020601c:	60e6                	ld	ra,88(sp)
    8020601e:	6446                	ld	s0,80(sp)
    80206020:	64a6                	ld	s1,72(sp)
    80206022:	6906                	ld	s2,64(sp)
    80206024:	79e2                	ld	s3,56(sp)
    80206026:	7a42                	ld	s4,48(sp)
    80206028:	7aa2                	ld	s5,40(sp)
    8020602a:	7b02                	ld	s6,32(sp)
    8020602c:	6be2                	ld	s7,24(sp)
    8020602e:	6c42                	ld	s8,16(sp)
    80206030:	6ca2                	ld	s9,8(sp)
    80206032:	6d02                	ld	s10,0(sp)
    80206034:	6125                	addi	sp,sp,96
    80206036:	8082                	ret
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80206038:	89da                	mv	s3,s6
    8020603a:	bff9                	j	80206018 <eread+0xd0>
        return 0;
    8020603c:	4501                	li	a0,0
}
    8020603e:	8082                	ret

0000000080206040 <ewrite>:
    if (off > entry->file_size || off + n < off || (uint64)off + n > 0xffffffff
    80206040:	10852783          	lw	a5,264(a0)
    80206044:	0ed7e463          	bltu	a5,a3,8020612c <ewrite+0xec>
{
    80206048:	711d                	addi	sp,sp,-96
    8020604a:	ec86                	sd	ra,88(sp)
    8020604c:	e8a2                	sd	s0,80(sp)
    8020604e:	e4a6                	sd	s1,72(sp)
    80206050:	e0ca                	sd	s2,64(sp)
    80206052:	fc4e                	sd	s3,56(sp)
    80206054:	f852                	sd	s4,48(sp)
    80206056:	f456                	sd	s5,40(sp)
    80206058:	f05a                	sd	s6,32(sp)
    8020605a:	ec5e                	sd	s7,24(sp)
    8020605c:	e862                	sd	s8,16(sp)
    8020605e:	e466                	sd	s9,8(sp)
    80206060:	1080                	addi	s0,sp,96
    80206062:	8aaa                	mv	s5,a0
    80206064:	8bae                	mv	s7,a1
    80206066:	8a32                	mv	s4,a2
    80206068:	8936                	mv	s2,a3
    8020606a:	8b3a                	mv	s6,a4
    if (off > entry->file_size || off + n < off || (uint64)off + n > 0xffffffff
    8020606c:	00e687bb          	addw	a5,a3,a4
    80206070:	0cd7e063          	bltu	a5,a3,80206130 <ewrite+0xf0>
    80206074:	02069793          	slli	a5,a3,0x20
    80206078:	9381                	srli	a5,a5,0x20
    8020607a:	1702                	slli	a4,a4,0x20
    8020607c:	9301                	srli	a4,a4,0x20
    8020607e:	97ba                	add	a5,a5,a4
    80206080:	577d                	li	a4,-1
    80206082:	9301                	srli	a4,a4,0x20
    80206084:	0af76863          	bltu	a4,a5,80206134 <ewrite+0xf4>
        || (entry->attribute & ATTR_READ_ONLY)) {
    80206088:	10054783          	lbu	a5,256(a0)
    8020608c:	8b85                	andi	a5,a5,1
    8020608e:	e7cd                	bnez	a5,80206138 <ewrite+0xf8>
    if (entry->first_clus == 0) {   // so file_size if 0 too, which requests off == 0
    80206090:	10452783          	lw	a5,260(a0)
    80206094:	cb89                	beqz	a5,802060a6 <ewrite+0x66>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    80206096:	080b0963          	beqz	s6,80206128 <ewrite+0xe8>
    8020609a:	4981                	li	s3,0
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    8020609c:	000b3c17          	auipc	s8,0xb3
    802060a0:	f64c0c13          	addi	s8,s8,-156 # 802b9000 <fat>
    802060a4:	a891                	j	802060f8 <ewrite+0xb8>
        entry->cur_clus = entry->first_clus = alloc_clus(entry->dev);
    802060a6:	11454503          	lbu	a0,276(a0)
    802060aa:	fffff097          	auipc	ra,0xfffff
    802060ae:	64a080e7          	jalr	1610(ra) # 802056f4 <alloc_clus>
    802060b2:	2501                	sext.w	a0,a0
    802060b4:	10aaa223          	sw	a0,260(s5)
    802060b8:	10aaa623          	sw	a0,268(s5)
        entry->clus_cnt = 0;
    802060bc:	100aa823          	sw	zero,272(s5)
        entry->dirty = 1;
    802060c0:	4785                	li	a5,1
    802060c2:	10fa8aa3          	sb	a5,277(s5)
    802060c6:	bfc1                	j	80206096 <ewrite+0x56>
    802060c8:	00048c9b          	sext.w	s9,s1
        if (rw_clus(entry->cur_clus, 1, user_src, src, off % fat.byts_per_clus, m) != m) {
    802060cc:	87e6                	mv	a5,s9
    802060ce:	86d2                	mv	a3,s4
    802060d0:	865e                	mv	a2,s7
    802060d2:	4585                	li	a1,1
    802060d4:	10caa503          	lw	a0,268(s5)
    802060d8:	00000097          	auipc	ra,0x0
    802060dc:	8e6080e7          	jalr	-1818(ra) # 802059be <rw_clus>
    802060e0:	2501                	sext.w	a0,a0
    802060e2:	04ac9d63          	bne	s9,a0,8020613c <ewrite+0xfc>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    802060e6:	013489bb          	addw	s3,s1,s3
    802060ea:	0124893b          	addw	s2,s1,s2
    802060ee:	1482                	slli	s1,s1,0x20
    802060f0:	9081                	srli	s1,s1,0x20
    802060f2:	9a26                	add	s4,s4,s1
    802060f4:	0569f463          	bgeu	s3,s6,8020613c <ewrite+0xfc>
        reloc_clus(entry, off, 1);
    802060f8:	4605                	li	a2,1
    802060fa:	85ca                	mv	a1,s2
    802060fc:	8556                	mv	a0,s5
    802060fe:	fffff097          	auipc	ra,0xfffff
    80206102:	7b6080e7          	jalr	1974(ra) # 802058b4 <reloc_clus>
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80206106:	00cc2783          	lw	a5,12(s8)
    8020610a:	02f976bb          	remuw	a3,s2,a5
    8020610e:	0006871b          	sext.w	a4,a3
    80206112:	9f95                	subw	a5,a5,a3
        if (n - tot < m) {
    80206114:	413b06bb          	subw	a3,s6,s3
    80206118:	84b6                	mv	s1,a3
    8020611a:	2681                	sext.w	a3,a3
    8020611c:	0007861b          	sext.w	a2,a5
    80206120:	fad674e3          	bgeu	a2,a3,802060c8 <ewrite+0x88>
    80206124:	84be                	mv	s1,a5
    80206126:	b74d                	j	802060c8 <ewrite+0x88>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    80206128:	89da                	mv	s3,s6
    8020612a:	a015                	j	8020614e <ewrite+0x10e>
        return -1;
    8020612c:	557d                	li	a0,-1
}
    8020612e:	8082                	ret
        return -1;
    80206130:	557d                	li	a0,-1
    80206132:	a005                	j	80206152 <ewrite+0x112>
    80206134:	557d                	li	a0,-1
    80206136:	a831                	j	80206152 <ewrite+0x112>
    80206138:	557d                	li	a0,-1
    8020613a:	a821                	j	80206152 <ewrite+0x112>
        if(off > entry->file_size) {
    8020613c:	108aa783          	lw	a5,264(s5)
    80206140:	0127f763          	bgeu	a5,s2,8020614e <ewrite+0x10e>
            entry->file_size = off;
    80206144:	112aa423          	sw	s2,264(s5)
            entry->dirty = 1;
    80206148:	4785                	li	a5,1
    8020614a:	10fa8aa3          	sb	a5,277(s5)
    return tot;
    8020614e:	0009851b          	sext.w	a0,s3
}
    80206152:	60e6                	ld	ra,88(sp)
    80206154:	6446                	ld	s0,80(sp)
    80206156:	64a6                	ld	s1,72(sp)
    80206158:	6906                	ld	s2,64(sp)
    8020615a:	79e2                	ld	s3,56(sp)
    8020615c:	7a42                	ld	s4,48(sp)
    8020615e:	7aa2                	ld	s5,40(sp)
    80206160:	7b02                	ld	s6,32(sp)
    80206162:	6be2                	ld	s7,24(sp)
    80206164:	6c42                	ld	s8,16(sp)
    80206166:	6ca2                	ld	s9,8(sp)
    80206168:	6125                	addi	sp,sp,96
    8020616a:	8082                	ret

000000008020616c <formatname>:
{
    8020616c:	7179                	addi	sp,sp,-48
    8020616e:	f406                	sd	ra,40(sp)
    80206170:	f022                	sd	s0,32(sp)
    80206172:	ec26                	sd	s1,24(sp)
    80206174:	e84a                	sd	s2,16(sp)
    80206176:	e44e                	sd	s3,8(sp)
    80206178:	e052                	sd	s4,0(sp)
    8020617a:	1800                	addi	s0,sp,48
    8020617c:	84aa                	mv	s1,a0
    while (*name == ' ' || *name == '.') { name++; }
    8020617e:	02000793          	li	a5,32
    80206182:	02e00713          	li	a4,46
    80206186:	a011                	j	8020618a <formatname+0x1e>
    80206188:	0485                	addi	s1,s1,1
    8020618a:	0004c583          	lbu	a1,0(s1)
    8020618e:	fef58de3          	beq	a1,a5,80206188 <formatname+0x1c>
    80206192:	fee58be3          	beq	a1,a4,80206188 <formatname+0x1c>
    for (p = name; *p; p++) {
    80206196:	c1b9                	beqz	a1,802061dc <formatname+0x70>
    80206198:	8926                	mv	s2,s1
        if (c < 0x20 || strchr(illegal, c)) {
    8020619a:	49fd                	li	s3,31
    8020619c:	00094a17          	auipc	s4,0x94
    802061a0:	304a0a13          	addi	s4,s4,772 # 8029a4a0 <illegal.1635>
    802061a4:	02b9fe63          	bgeu	s3,a1,802061e0 <formatname+0x74>
    802061a8:	8552                	mv	a0,s4
    802061aa:	ffffb097          	auipc	ra,0xffffb
    802061ae:	850080e7          	jalr	-1968(ra) # 802009fa <strchr>
    802061b2:	e121                	bnez	a0,802061f2 <formatname+0x86>
    for (p = name; *p; p++) {
    802061b4:	0905                	addi	s2,s2,1
    802061b6:	00094583          	lbu	a1,0(s2)
    802061ba:	f5ed                	bnez	a1,802061a4 <formatname+0x38>
        if (*p != ' ') {
    802061bc:	02000693          	li	a3,32
    802061c0:	874a                	mv	a4,s2
    while (p-- > name) {
    802061c2:	0124fb63          	bgeu	s1,s2,802061d8 <formatname+0x6c>
        if (*p != ' ') {
    802061c6:	197d                	addi	s2,s2,-1
    802061c8:	00094783          	lbu	a5,0(s2)
    802061cc:	fed78ae3          	beq	a5,a3,802061c0 <formatname+0x54>
            p[1] = '\0';
    802061d0:	00070023          	sb	zero,0(a4)
            break;
    802061d4:	8526                	mv	a0,s1
    802061d6:	a031                	j	802061e2 <formatname+0x76>
    802061d8:	8526                	mv	a0,s1
    802061da:	a021                	j	802061e2 <formatname+0x76>
    for (p = name; *p; p++) {
    802061dc:	8526                	mv	a0,s1
    802061de:	a011                	j	802061e2 <formatname+0x76>
            return 0;
    802061e0:	4501                	li	a0,0
}
    802061e2:	70a2                	ld	ra,40(sp)
    802061e4:	7402                	ld	s0,32(sp)
    802061e6:	64e2                	ld	s1,24(sp)
    802061e8:	6942                	ld	s2,16(sp)
    802061ea:	69a2                	ld	s3,8(sp)
    802061ec:	6a02                	ld	s4,0(sp)
    802061ee:	6145                	addi	sp,sp,48
    802061f0:	8082                	ret
            return 0;
    802061f2:	4501                	li	a0,0
    802061f4:	b7fd                	j	802061e2 <formatname+0x76>

00000000802061f6 <cal_checksum>:
{
    802061f6:	1141                	addi	sp,sp,-16
    802061f8:	e422                	sd	s0,8(sp)
    802061fa:	0800                	addi	s0,sp,16
    802061fc:	87aa                	mv	a5,a0
    for (int i = CHAR_SHORT_NAME; i != 0; i--) {
    802061fe:	00b50613          	addi	a2,a0,11
    uint8 sum = 0;
    80206202:	4501                	li	a0,0
        sum = ((sum & 1) ? 0x80 : 0) + (sum >> 1) + *shortname++;
    80206204:	0075171b          	slliw	a4,a0,0x7
    80206208:	0785                	addi	a5,a5,1
    8020620a:	0015551b          	srliw	a0,a0,0x1
    8020620e:	fff7c683          	lbu	a3,-1(a5) # fffffff <_entry-0x70200001>
    80206212:	9d35                	addw	a0,a0,a3
    80206214:	953a                	add	a0,a0,a4
    80206216:	0ff57513          	andi	a0,a0,255
    for (int i = CHAR_SHORT_NAME; i != 0; i--) {
    8020621a:	fef615e3          	bne	a2,a5,80206204 <cal_checksum+0xe>
}
    8020621e:	6422                	ld	s0,8(sp)
    80206220:	0141                	addi	sp,sp,16
    80206222:	8082                	ret

0000000080206224 <emake>:
{
    80206224:	7171                	addi	sp,sp,-176
    80206226:	f506                	sd	ra,168(sp)
    80206228:	f122                	sd	s0,160(sp)
    8020622a:	ed26                	sd	s1,152(sp)
    8020622c:	e94a                	sd	s2,144(sp)
    8020622e:	e54e                	sd	s3,136(sp)
    80206230:	e152                	sd	s4,128(sp)
    80206232:	fcd6                	sd	s5,120(sp)
    80206234:	f8da                	sd	s6,112(sp)
    80206236:	f4de                	sd	s7,104(sp)
    80206238:	f0e2                	sd	s8,96(sp)
    8020623a:	ece6                	sd	s9,88(sp)
    8020623c:	e8ea                	sd	s10,80(sp)
    8020623e:	e4ee                	sd	s11,72(sp)
    80206240:	1900                	addi	s0,sp,176
    if (!(dp->attribute & ATTR_DIRECTORY))
    80206242:	10054783          	lbu	a5,256(a0)
    80206246:	8bc1                	andi	a5,a5,16
    80206248:	c3d5                	beqz	a5,802062ec <emake+0xc8>
    8020624a:	892a                	mv	s2,a0
    8020624c:	8aae                	mv	s5,a1
    8020624e:	8a32                	mv	s4,a2
    if (off % sizeof(union dentry))
    80206250:	01f67793          	andi	a5,a2,31
    80206254:	e7c5                	bnez	a5,802062fc <emake+0xd8>
    memset(&de, 0, sizeof(de));
    80206256:	02000613          	li	a2,32
    8020625a:	4581                	li	a1,0
    8020625c:	f7040513          	addi	a0,s0,-144
    80206260:	ffffa097          	auipc	ra,0xffffa
    80206264:	530080e7          	jalr	1328(ra) # 80200790 <memset>
    if (off <= 32) {
    80206268:	02000793          	li	a5,32
    8020626c:	0b47ec63          	bltu	a5,s4,80206324 <emake+0x100>
        if (off == 0) {
    80206270:	080a1e63          	bnez	s4,8020630c <emake+0xe8>
            strncpy(de.sne.name, ".          ", sizeof(de.sne.name));
    80206274:	462d                	li	a2,11
    80206276:	00004597          	auipc	a1,0x4
    8020627a:	e1a58593          	addi	a1,a1,-486 # 8020a090 <sysnames+0x458>
    8020627e:	f7040513          	addi	a0,s0,-144
    80206282:	ffffa097          	auipc	ra,0xffffa
    80206286:	626080e7          	jalr	1574(ra) # 802008a8 <strncpy>
        de.sne.attr = ATTR_DIRECTORY;
    8020628a:	47c1                	li	a5,16
    8020628c:	f6f40da3          	sb	a5,-133(s0)
        de.sne.fst_clus_hi = (uint16)(ep->first_clus >> 16);        // first clus high 16 bits
    80206290:	104aa783          	lw	a5,260(s5)
    80206294:	0107d71b          	srliw	a4,a5,0x10
    80206298:	f8e41223          	sh	a4,-124(s0)
        de.sne.fst_clus_lo = (uint16)(ep->first_clus & 0xffff);       // low 16 bits
    8020629c:	f8f41523          	sh	a5,-118(s0)
        de.sne.file_size = 0;                                       // filesize is updated in eupdate()
    802062a0:	f8042623          	sw	zero,-116(s0)
        off = reloc_clus(dp, off, 1);
    802062a4:	4605                	li	a2,1
    802062a6:	85d2                	mv	a1,s4
    802062a8:	854a                	mv	a0,s2
    802062aa:	fffff097          	auipc	ra,0xfffff
    802062ae:	60a080e7          	jalr	1546(ra) # 802058b4 <reloc_clus>
        rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    802062b2:	02000793          	li	a5,32
    802062b6:	0005071b          	sext.w	a4,a0
    802062ba:	f7040693          	addi	a3,s0,-144
    802062be:	4601                	li	a2,0
    802062c0:	4585                	li	a1,1
    802062c2:	10c92503          	lw	a0,268(s2)
    802062c6:	fffff097          	auipc	ra,0xfffff
    802062ca:	6f8080e7          	jalr	1784(ra) # 802059be <rw_clus>
}
    802062ce:	70aa                	ld	ra,168(sp)
    802062d0:	740a                	ld	s0,160(sp)
    802062d2:	64ea                	ld	s1,152(sp)
    802062d4:	694a                	ld	s2,144(sp)
    802062d6:	69aa                	ld	s3,136(sp)
    802062d8:	6a0a                	ld	s4,128(sp)
    802062da:	7ae6                	ld	s5,120(sp)
    802062dc:	7b46                	ld	s6,112(sp)
    802062de:	7ba6                	ld	s7,104(sp)
    802062e0:	7c06                	ld	s8,96(sp)
    802062e2:	6ce6                	ld	s9,88(sp)
    802062e4:	6d46                	ld	s10,80(sp)
    802062e6:	6da6                	ld	s11,72(sp)
    802062e8:	614d                	addi	sp,sp,176
    802062ea:	8082                	ret
        panic("emake: not dir");
    802062ec:	00004517          	auipc	a0,0x4
    802062f0:	d7c50513          	addi	a0,a0,-644 # 8020a068 <sysnames+0x430>
    802062f4:	ffffa097          	auipc	ra,0xffffa
    802062f8:	e50080e7          	jalr	-432(ra) # 80200144 <panic>
        panic("emake: not aligned");
    802062fc:	00004517          	auipc	a0,0x4
    80206300:	d7c50513          	addi	a0,a0,-644 # 8020a078 <sysnames+0x440>
    80206304:	ffffa097          	auipc	ra,0xffffa
    80206308:	e40080e7          	jalr	-448(ra) # 80200144 <panic>
            strncpy(de.sne.name, "..         ", sizeof(de.sne.name));
    8020630c:	462d                	li	a2,11
    8020630e:	00004597          	auipc	a1,0x4
    80206312:	d9258593          	addi	a1,a1,-622 # 8020a0a0 <sysnames+0x468>
    80206316:	f7040513          	addi	a0,s0,-144
    8020631a:	ffffa097          	auipc	ra,0xffffa
    8020631e:	58e080e7          	jalr	1422(ra) # 802008a8 <strncpy>
    80206322:	b7a5                	j	8020628a <emake+0x66>
        int entcnt = (strlen(ep->filename) + CHAR_LONG_NAME - 1) / CHAR_LONG_NAME;   // count of l-n-entries, rounds up
    80206324:	89d6                	mv	s3,s5
    80206326:	8556                	mv	a0,s5
    80206328:	ffffa097          	auipc	ra,0xffffa
    8020632c:	5f0080e7          	jalr	1520(ra) # 80200918 <strlen>
    80206330:	f4a43c23          	sd	a0,-168(s0)
    80206334:	00c5079b          	addiw	a5,a0,12
    80206338:	4db5                	li	s11,13
    8020633a:	03b7c7bb          	divw	a5,a5,s11
    8020633e:	f4f42a23          	sw	a5,-172(s0)
    80206342:	00078c1b          	sext.w	s8,a5
        memset(shortname, 0, sizeof(shortname));
    80206346:	4631                	li	a2,12
    80206348:	4581                	li	a1,0
    8020634a:	f6040513          	addi	a0,s0,-160
    8020634e:	ffffa097          	auipc	ra,0xffffa
    80206352:	442080e7          	jalr	1090(ra) # 80200790 <memset>
    for (int j = strlen(name) - 1; j >= 0; j--) {
    80206356:	8556                	mv	a0,s5
    80206358:	ffffa097          	auipc	ra,0xffffa
    8020635c:	5c0080e7          	jalr	1472(ra) # 80200918 <strlen>
    80206360:	fff5079b          	addiw	a5,a0,-1
    80206364:	0207cc63          	bltz	a5,8020639c <emake+0x178>
    80206368:	97d6                	add	a5,a5,s5
    8020636a:	ffea8693          	addi	a3,s5,-2
    8020636e:	96aa                	add	a3,a3,a0
    80206370:	fff5071b          	addiw	a4,a0,-1
    80206374:	1702                	slli	a4,a4,0x20
    80206376:	9301                	srli	a4,a4,0x20
    80206378:	8e99                	sub	a3,a3,a4
        if (name[j] == '.') {
    8020637a:	02e00613          	li	a2,46
    8020637e:	8b3e                	mv	s6,a5
    80206380:	0007c703          	lbu	a4,0(a5)
    80206384:	00c70663          	beq	a4,a2,80206390 <emake+0x16c>
    for (int j = strlen(name) - 1; j >= 0; j--) {
    80206388:	17fd                	addi	a5,a5,-1
    8020638a:	fed79ae3          	bne	a5,a3,8020637e <emake+0x15a>
    char c, *p = name;
    8020638e:	8b56                	mv	s6,s5
        shortname[i++] = c;
    80206390:	4481                	li	s1,0
        if (i == 8 && p) {
    80206392:	4ca1                	li	s9,8
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80206394:	4d29                	li	s10,10
        if (c == '.') {
    80206396:	02e00d93          	li	s11,46
    8020639a:	a875                	j	80206456 <emake+0x232>
    char c, *p = name;
    8020639c:	8b56                	mv	s6,s5
    8020639e:	bfcd                	j	80206390 <emake+0x16c>
        if (i == 8 && p) {
    802063a0:	200b0a63          	beqz	s6,802065b4 <emake+0x390>
            if (p + 1 < name) { break; }            // no '.'
    802063a4:	0b05                	addi	s6,s6,1
    802063a6:	077b7f63          	bgeu	s6,s7,80206424 <emake+0x200>
    802063aa:	f6040793          	addi	a5,s0,-160
    802063ae:	97a6                	add	a5,a5,s1
        shortname[i++] = ' ';
    802063b0:	02000693          	li	a3,32
    while (i < CHAR_SHORT_NAME) {
    802063b4:	4729                	li	a4,10
        shortname[i++] = ' ';
    802063b6:	2485                	addiw	s1,s1,1
    802063b8:	00d78023          	sb	a3,0(a5)
    while (i < CHAR_SHORT_NAME) {
    802063bc:	0785                	addi	a5,a5,1
    802063be:	fe975ce3          	bge	a4,s1,802063b6 <emake+0x192>
        de.lne.checksum = cal_checksum((uchar *)shortname);
    802063c2:	f6040513          	addi	a0,s0,-160
    802063c6:	00000097          	auipc	ra,0x0
    802063ca:	e30080e7          	jalr	-464(ra) # 802061f6 <cal_checksum>
    802063ce:	f6a40ea3          	sb	a0,-131(s0)
        de.lne.attr = ATTR_LONG_NAME;
    802063d2:	47bd                	li	a5,15
    802063d4:	f6f40da3          	sb	a5,-133(s0)
        for (int i = entcnt; i > 0; i--) {
    802063d8:	f5843783          	ld	a5,-168(s0)
    802063dc:	0ef05563          	blez	a5,802064c6 <emake+0x2a2>
    802063e0:	f5442783          	lw	a5,-172(s0)
    802063e4:	fff78d9b          	addiw	s11,a5,-1
    802063e8:	001d9b9b          	slliw	s7,s11,0x1
    802063ec:	01bb8bbb          	addw	s7,s7,s11
    802063f0:	002b9b9b          	slliw	s7,s7,0x2
    802063f4:	01bb8bbb          	addw	s7,s7,s11
    802063f8:	9bd6                	add	s7,s7,s5
    802063fa:	8b62                	mv	s6,s8
    802063fc:	8cd2                	mv	s9,s4
            int end = 0;
    802063fe:	4d01                	li	s10,0
                    *w++ = 0xff;            // on k210, unaligned reading is illegal
    80206400:	59fd                	li	s3,-1
                switch (j) {
    80206402:	44ad                	li	s1,11
    80206404:	aa49                	j	80206596 <emake+0x372>
            if (name > p) {                    // last '.'
    80206406:	057b7563          	bgeu	s6,s7,80206450 <emake+0x22c>
                memset(shortname + i, ' ', 8 - i);
    8020640a:	4621                	li	a2,8
    8020640c:	9e05                	subw	a2,a2,s1
    8020640e:	02000593          	li	a1,32
    80206412:	f6040793          	addi	a5,s0,-160
    80206416:	00978533          	add	a0,a5,s1
    8020641a:	ffffa097          	auipc	ra,0xffffa
    8020641e:	376080e7          	jalr	886(ra) # 80200790 <memset>
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80206422:	8b5e                	mv	s6,s7
        shortname[i++] = c;
    80206424:	8bda                	mv	s7,s6
    80206426:	84e6                	mv	s1,s9
    80206428:	4b01                	li	s6,0
    8020642a:	a02d                	j	80206454 <emake+0x230>
            if (strchr(illegal, c) != NULL) {
    8020642c:	85ce                	mv	a1,s3
    8020642e:	00094517          	auipc	a0,0x94
    80206432:	16250513          	addi	a0,a0,354 # 8029a590 <illegal.1651>
    80206436:	ffffa097          	auipc	ra,0xffffa
    8020643a:	5c4080e7          	jalr	1476(ra) # 802009fa <strchr>
    8020643e:	c119                	beqz	a0,80206444 <emake+0x220>
                c = '_';
    80206440:	05f00993          	li	s3,95
        shortname[i++] = c;
    80206444:	f9040793          	addi	a5,s0,-112
    80206448:	97a6                	add	a5,a5,s1
    8020644a:	fd378823          	sb	s3,-48(a5)
    8020644e:	2485                	addiw	s1,s1,1
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80206450:	f69d49e3          	blt	s10,s1,802063c2 <emake+0x19e>
        shortname[i++] = c;
    80206454:	89de                	mv	s3,s7
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80206456:	00198b93          	addi	s7,s3,1
    8020645a:	0009c983          	lbu	s3,0(s3)
    8020645e:	02098563          	beqz	s3,80206488 <emake+0x264>
        if (i == 8 && p) {
    80206462:	f3948fe3          	beq	s1,s9,802063a0 <emake+0x17c>
        if (c == ' ') { continue; }
    80206466:	02000793          	li	a5,32
    8020646a:	fef983e3          	beq	s3,a5,80206450 <emake+0x22c>
        if (c == '.') {
    8020646e:	f9b98ce3          	beq	s3,s11,80206406 <emake+0x1e2>
        if (c >= 'a' && c <= 'z') {
    80206472:	f9f9879b          	addiw	a5,s3,-97
    80206476:	0ff7f793          	andi	a5,a5,255
    8020647a:	4765                	li	a4,25
    8020647c:	faf768e3          	bltu	a4,a5,8020642c <emake+0x208>
            c += 'A' - 'a';
    80206480:	3981                	addiw	s3,s3,-32
    80206482:	0ff9f993          	andi	s3,s3,255
    80206486:	bf7d                	j	80206444 <emake+0x220>
    while (i < CHAR_SHORT_NAME) {
    80206488:	47a9                	li	a5,10
    8020648a:	f297d0e3          	bge	a5,s1,802063aa <emake+0x186>
    8020648e:	bf15                	j	802063c2 <emake+0x19e>
                de.lne.order |= LAST_LONG_ENTRY;
    80206490:	0407e793          	ori	a5,a5,64
    80206494:	f6f40823          	sb	a5,-144(s0)
    80206498:	a229                	j	802065a2 <emake+0x37e>
                    if ((*w++ = *p++) == 0) {
    8020649a:	0005c683          	lbu	a3,0(a1)
    8020649e:	00d78023          	sb	a3,0(a5)
                        end = 1;
    802064a2:	0016b693          	seqz	a3,a3
                    *w++ = 0;
    802064a6:	000780a3          	sb	zero,1(a5)
    802064aa:	0789                	addi	a5,a5,2
                    if ((*w++ = *p++) == 0) {
    802064ac:	0585                	addi	a1,a1,1
    802064ae:	a055                	j	80206552 <emake+0x32e>
    802064b0:	020a0a1b          	addiw	s4,s4,32
    802064b4:	4781                	li	a5,0
    802064b6:	f5843703          	ld	a4,-168(s0)
    802064ba:	00e05463          	blez	a4,802064c2 <emake+0x29e>
    802064be:	005d979b          	slliw	a5,s11,0x5
    802064c2:	01478a3b          	addw	s4,a5,s4
        memset(&de, 0, sizeof(de));
    802064c6:	02000613          	li	a2,32
    802064ca:	4581                	li	a1,0
    802064cc:	f7040513          	addi	a0,s0,-144
    802064d0:	ffffa097          	auipc	ra,0xffffa
    802064d4:	2c0080e7          	jalr	704(ra) # 80200790 <memset>
        strncpy(de.sne.name, shortname, sizeof(de.sne.name));
    802064d8:	462d                	li	a2,11
    802064da:	f6040593          	addi	a1,s0,-160
    802064de:	f7040513          	addi	a0,s0,-144
    802064e2:	ffffa097          	auipc	ra,0xffffa
    802064e6:	3c6080e7          	jalr	966(ra) # 802008a8 <strncpy>
        de.sne.attr = ep->attribute;
    802064ea:	100ac783          	lbu	a5,256(s5)
    802064ee:	f6f40da3          	sb	a5,-133(s0)
        de.sne.fst_clus_hi = (uint16)(ep->first_clus >> 16);      // first clus high 16 bits
    802064f2:	104aa783          	lw	a5,260(s5)
    802064f6:	0107d71b          	srliw	a4,a5,0x10
    802064fa:	f8e41223          	sh	a4,-124(s0)
        de.sne.fst_clus_lo = (uint16)(ep->first_clus & 0xffff);     // low 16 bits
    802064fe:	f8f41523          	sh	a5,-118(s0)
        de.sne.file_size = ep->file_size;                         // filesize is updated in eupdate()
    80206502:	108aa783          	lw	a5,264(s5)
    80206506:	f8f42623          	sw	a5,-116(s0)
        off = reloc_clus(dp, off, 1);
    8020650a:	4605                	li	a2,1
    8020650c:	85d2                	mv	a1,s4
    8020650e:	854a                	mv	a0,s2
    80206510:	fffff097          	auipc	ra,0xfffff
    80206514:	3a4080e7          	jalr	932(ra) # 802058b4 <reloc_clus>
        rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80206518:	02000793          	li	a5,32
    8020651c:	0005071b          	sext.w	a4,a0
    80206520:	f7040693          	addi	a3,s0,-144
    80206524:	4601                	li	a2,0
    80206526:	4585                	li	a1,1
    80206528:	10c92503          	lw	a0,268(s2)
    8020652c:	fffff097          	auipc	ra,0xfffff
    80206530:	492080e7          	jalr	1170(ra) # 802059be <rw_clus>
}
    80206534:	bb69                	j	802062ce <emake+0xaa>
                    case 5:     w = (uint8 *)de.lne.name2; break;
    80206536:	f7e40793          	addi	a5,s0,-130
    8020653a:	a019                	j	80206540 <emake+0x31c>
                switch (j) {
    8020653c:	f8c40793          	addi	a5,s0,-116
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    80206540:	2705                	addiw	a4,a4,1
    80206542:	fff7061b          	addiw	a2,a4,-1
                if (end) {
    80206546:	dab1                	beqz	a3,8020649a <emake+0x276>
                    *w++ = 0xff;            // on k210, unaligned reading is illegal
    80206548:	01378023          	sb	s3,0(a5)
                    *w++ = 0xff;
    8020654c:	013780a3          	sb	s3,1(a5)
    80206550:	0789                	addi	a5,a5,2
                switch (j) {
    80206552:	fea602e3          	beq	a2,a0,80206536 <emake+0x312>
    80206556:	fe9603e3          	beq	a2,s1,8020653c <emake+0x318>
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    8020655a:	0007061b          	sext.w	a2,a4
    8020655e:	fec851e3          	bge	a6,a2,80206540 <emake+0x31c>
            uint off2 = reloc_clus(dp, off, 1);
    80206562:	4605                	li	a2,1
    80206564:	85e6                	mv	a1,s9
    80206566:	854a                	mv	a0,s2
    80206568:	fffff097          	auipc	ra,0xfffff
    8020656c:	34c080e7          	jalr	844(ra) # 802058b4 <reloc_clus>
            rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off2, sizeof(de));
    80206570:	02000793          	li	a5,32
    80206574:	0005071b          	sext.w	a4,a0
    80206578:	f7040693          	addi	a3,s0,-144
    8020657c:	866a                	mv	a2,s10
    8020657e:	4585                	li	a1,1
    80206580:	10c92503          	lw	a0,268(s2)
    80206584:	fffff097          	auipc	ra,0xfffff
    80206588:	43a080e7          	jalr	1082(ra) # 802059be <rw_clus>
            off += sizeof(de);
    8020658c:	020c8c9b          	addiw	s9,s9,32
        for (int i = entcnt; i > 0; i--) {
    80206590:	1bcd                	addi	s7,s7,-13
    80206592:	f1605fe3          	blez	s6,802064b0 <emake+0x28c>
            if ((de.lne.order = i) == entcnt) {
    80206596:	0ffb7793          	andi	a5,s6,255
    8020659a:	eefc0be3          	beq	s8,a5,80206490 <emake+0x26c>
    8020659e:	f6f40823          	sb	a5,-144(s0)
            char *p = ep->filename + (i - 1) * CHAR_LONG_NAME;
    802065a2:	3b7d                	addiw	s6,s6,-1
    802065a4:	85de                	mv	a1,s7
    802065a6:	4709                	li	a4,2
            int end = 0;
    802065a8:	86ea                	mv	a3,s10
            uint8 *w = (uint8 *)de.lne.name1;
    802065aa:	f7140793          	addi	a5,s0,-143
                switch (j) {
    802065ae:	4515                	li	a0,5
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    802065b0:	4835                	li	a6,13
    802065b2:	bf41                	j	80206542 <emake+0x31e>
        if (c == ' ') { continue; }
    802065b4:	02000793          	li	a5,32
    802065b8:	eaf99be3          	bne	s3,a5,8020646e <emake+0x24a>
    802065bc:	bd61                	j	80206454 <emake+0x230>

00000000802065be <edup>:
{
    802065be:	1101                	addi	sp,sp,-32
    802065c0:	ec06                	sd	ra,24(sp)
    802065c2:	e822                	sd	s0,16(sp)
    802065c4:	e426                	sd	s1,8(sp)
    802065c6:	1000                	addi	s0,sp,32
    802065c8:	84aa                	mv	s1,a0
    if (entry != 0) {
    802065ca:	c515                	beqz	a0,802065f6 <edup+0x38>
        acquire(&ecache.lock);
    802065cc:	000b3517          	auipc	a0,0xb3
    802065d0:	bc450513          	addi	a0,a0,-1084 # 802b9190 <ecache>
    802065d4:	ffffa097          	auipc	ra,0xffffa
    802065d8:	120080e7          	jalr	288(ra) # 802006f4 <acquire>
        entry->ref++;
    802065dc:	1184a783          	lw	a5,280(s1)
    802065e0:	2785                	addiw	a5,a5,1
    802065e2:	10f4ac23          	sw	a5,280(s1)
        release(&ecache.lock);
    802065e6:	000b3517          	auipc	a0,0xb3
    802065ea:	baa50513          	addi	a0,a0,-1110 # 802b9190 <ecache>
    802065ee:	ffffa097          	auipc	ra,0xffffa
    802065f2:	15a080e7          	jalr	346(ra) # 80200748 <release>
}
    802065f6:	8526                	mv	a0,s1
    802065f8:	60e2                	ld	ra,24(sp)
    802065fa:	6442                	ld	s0,16(sp)
    802065fc:	64a2                	ld	s1,8(sp)
    802065fe:	6105                	addi	sp,sp,32
    80206600:	8082                	ret

0000000080206602 <eupdate>:
    if (!entry->dirty || entry->valid != 1) { return; }
    80206602:	11554783          	lbu	a5,277(a0)
    80206606:	cff1                	beqz	a5,802066e2 <eupdate+0xe0>
{
    80206608:	715d                	addi	sp,sp,-80
    8020660a:	e486                	sd	ra,72(sp)
    8020660c:	e0a2                	sd	s0,64(sp)
    8020660e:	fc26                	sd	s1,56(sp)
    80206610:	f84a                	sd	s2,48(sp)
    80206612:	0880                	addi	s0,sp,80
    80206614:	84aa                	mv	s1,a0
    if (!entry->dirty || entry->valid != 1) { return; }
    80206616:	11651703          	lh	a4,278(a0)
    8020661a:	4785                	li	a5,1
    8020661c:	00f70863          	beq	a4,a5,8020662c <eupdate+0x2a>
}
    80206620:	60a6                	ld	ra,72(sp)
    80206622:	6406                	ld	s0,64(sp)
    80206624:	74e2                	ld	s1,56(sp)
    80206626:	7942                	ld	s2,48(sp)
    80206628:	6161                	addi	sp,sp,80
    8020662a:	8082                	ret
    uint entcnt = 0;
    8020662c:	fc042e23          	sw	zero,-36(s0)
    uint32 off = reloc_clus(entry->parent, entry->off, 0);
    80206630:	4601                	li	a2,0
    80206632:	11c52583          	lw	a1,284(a0)
    80206636:	12053503          	ld	a0,288(a0)
    8020663a:	fffff097          	auipc	ra,0xfffff
    8020663e:	27a080e7          	jalr	634(ra) # 802058b4 <reloc_clus>
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64) &entcnt, off, 1);
    80206642:	1204b803          	ld	a6,288(s1)
    80206646:	4785                	li	a5,1
    80206648:	0005071b          	sext.w	a4,a0
    8020664c:	fdc40693          	addi	a3,s0,-36
    80206650:	4601                	li	a2,0
    80206652:	4581                	li	a1,0
    80206654:	10c82503          	lw	a0,268(a6)
    80206658:	fffff097          	auipc	ra,0xfffff
    8020665c:	366080e7          	jalr	870(ra) # 802059be <rw_clus>
    entcnt &= ~LAST_LONG_ENTRY;
    80206660:	fdc42583          	lw	a1,-36(s0)
    80206664:	fbf5f593          	andi	a1,a1,-65
    80206668:	fcb42e23          	sw	a1,-36(s0)
    off = reloc_clus(entry->parent, entry->off + (entcnt << 5), 0);
    8020666c:	0055959b          	slliw	a1,a1,0x5
    80206670:	11c4a783          	lw	a5,284(s1)
    80206674:	4601                	li	a2,0
    80206676:	9dbd                	addw	a1,a1,a5
    80206678:	1204b503          	ld	a0,288(s1)
    8020667c:	fffff097          	auipc	ra,0xfffff
    80206680:	238080e7          	jalr	568(ra) # 802058b4 <reloc_clus>
    80206684:	0005091b          	sext.w	s2,a0
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64)&de, off, sizeof(de));
    80206688:	1204b503          	ld	a0,288(s1)
    8020668c:	02000793          	li	a5,32
    80206690:	874a                	mv	a4,s2
    80206692:	fb840693          	addi	a3,s0,-72
    80206696:	4601                	li	a2,0
    80206698:	4581                	li	a1,0
    8020669a:	10c52503          	lw	a0,268(a0)
    8020669e:	fffff097          	auipc	ra,0xfffff
    802066a2:	320080e7          	jalr	800(ra) # 802059be <rw_clus>
    de.sne.fst_clus_hi = (uint16)(entry->first_clus >> 16);
    802066a6:	1044a783          	lw	a5,260(s1)
    802066aa:	0107d71b          	srliw	a4,a5,0x10
    802066ae:	fce41623          	sh	a4,-52(s0)
    de.sne.fst_clus_lo = (uint16)(entry->first_clus & 0xffff);
    802066b2:	fcf41923          	sh	a5,-46(s0)
    de.sne.file_size = entry->file_size;
    802066b6:	1084a783          	lw	a5,264(s1)
    802066ba:	fcf42a23          	sw	a5,-44(s0)
    rw_clus(entry->parent->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    802066be:	1204b503          	ld	a0,288(s1)
    802066c2:	02000793          	li	a5,32
    802066c6:	874a                	mv	a4,s2
    802066c8:	fb840693          	addi	a3,s0,-72
    802066cc:	4601                	li	a2,0
    802066ce:	4585                	li	a1,1
    802066d0:	10c52503          	lw	a0,268(a0)
    802066d4:	fffff097          	auipc	ra,0xfffff
    802066d8:	2ea080e7          	jalr	746(ra) # 802059be <rw_clus>
    entry->dirty = 0;
    802066dc:	10048aa3          	sb	zero,277(s1)
    802066e0:	b781                	j	80206620 <eupdate+0x1e>
    802066e2:	8082                	ret

00000000802066e4 <eremove>:
    if (entry->valid != 1) { return; }
    802066e4:	11651703          	lh	a4,278(a0)
    802066e8:	4785                	li	a5,1
    802066ea:	00f70363          	beq	a4,a5,802066f0 <eremove+0xc>
    802066ee:	8082                	ret
{
    802066f0:	7139                	addi	sp,sp,-64
    802066f2:	fc06                	sd	ra,56(sp)
    802066f4:	f822                	sd	s0,48(sp)
    802066f6:	f426                	sd	s1,40(sp)
    802066f8:	f04a                	sd	s2,32(sp)
    802066fa:	ec4e                	sd	s3,24(sp)
    802066fc:	e852                	sd	s4,16(sp)
    802066fe:	0080                	addi	s0,sp,64
    80206700:	89aa                	mv	s3,a0
    uint entcnt = 0;
    80206702:	fc042623          	sw	zero,-52(s0)
    uint32 off = entry->off;
    80206706:	11c52a03          	lw	s4,284(a0)
    uint32 off2 = reloc_clus(entry->parent, off, 0);
    8020670a:	4601                	li	a2,0
    8020670c:	85d2                	mv	a1,s4
    8020670e:	12053503          	ld	a0,288(a0)
    80206712:	fffff097          	auipc	ra,0xfffff
    80206716:	1a2080e7          	jalr	418(ra) # 802058b4 <reloc_clus>
    8020671a:	0005049b          	sext.w	s1,a0
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64) &entcnt, off2, 1);
    8020671e:	1209b503          	ld	a0,288(s3)
    80206722:	4785                	li	a5,1
    80206724:	8726                	mv	a4,s1
    80206726:	fcc40693          	addi	a3,s0,-52
    8020672a:	4601                	li	a2,0
    8020672c:	4581                	li	a1,0
    8020672e:	10c52503          	lw	a0,268(a0)
    80206732:	fffff097          	auipc	ra,0xfffff
    80206736:	28c080e7          	jalr	652(ra) # 802059be <rw_clus>
    entcnt &= ~LAST_LONG_ENTRY;
    8020673a:	fcc42783          	lw	a5,-52(s0)
    8020673e:	fbf7f793          	andi	a5,a5,-65
    80206742:	fcf42623          	sw	a5,-52(s0)
    uint8 flag = EMPTY_ENTRY;
    80206746:	5795                	li	a5,-27
    80206748:	fcf405a3          	sb	a5,-53(s0)
    for (int i = 0; i <= entcnt; i++) {
    8020674c:	4901                	li	s2,0
        rw_clus(entry->parent->cur_clus, 1, 0, (uint64) &flag, off2, 1);
    8020674e:	1209b503          	ld	a0,288(s3)
    80206752:	4785                	li	a5,1
    80206754:	8726                	mv	a4,s1
    80206756:	fcb40693          	addi	a3,s0,-53
    8020675a:	4601                	li	a2,0
    8020675c:	4585                	li	a1,1
    8020675e:	10c52503          	lw	a0,268(a0)
    80206762:	fffff097          	auipc	ra,0xfffff
    80206766:	25c080e7          	jalr	604(ra) # 802059be <rw_clus>
        off += 32;
    8020676a:	020a0a1b          	addiw	s4,s4,32
        off2 = reloc_clus(entry->parent, off, 0);
    8020676e:	4601                	li	a2,0
    80206770:	85d2                	mv	a1,s4
    80206772:	1209b503          	ld	a0,288(s3)
    80206776:	fffff097          	auipc	ra,0xfffff
    8020677a:	13e080e7          	jalr	318(ra) # 802058b4 <reloc_clus>
    8020677e:	0005049b          	sext.w	s1,a0
    for (int i = 0; i <= entcnt; i++) {
    80206782:	0019079b          	addiw	a5,s2,1
    80206786:	0007891b          	sext.w	s2,a5
    8020678a:	fcc42703          	lw	a4,-52(s0)
    8020678e:	fd2770e3          	bgeu	a4,s2,8020674e <eremove+0x6a>
    entry->valid = -1;
    80206792:	57fd                	li	a5,-1
    80206794:	10f99b23          	sh	a5,278(s3)
}
    80206798:	70e2                	ld	ra,56(sp)
    8020679a:	7442                	ld	s0,48(sp)
    8020679c:	74a2                	ld	s1,40(sp)
    8020679e:	7902                	ld	s2,32(sp)
    802067a0:	69e2                	ld	s3,24(sp)
    802067a2:	6a42                	ld	s4,16(sp)
    802067a4:	6121                	addi	sp,sp,64
    802067a6:	8082                	ret

00000000802067a8 <etrunc>:
{
    802067a8:	7179                	addi	sp,sp,-48
    802067aa:	f406                	sd	ra,40(sp)
    802067ac:	f022                	sd	s0,32(sp)
    802067ae:	ec26                	sd	s1,24(sp)
    802067b0:	e84a                	sd	s2,16(sp)
    802067b2:	e44e                	sd	s3,8(sp)
    802067b4:	e052                	sd	s4,0(sp)
    802067b6:	1800                	addi	s0,sp,48
    802067b8:	8a2a                	mv	s4,a0
    for (uint32 clus = entry->first_clus; clus >= 2 && clus < FAT32_EOC; ) {
    802067ba:	10452483          	lw	s1,260(a0)
    802067be:	ffe4871b          	addiw	a4,s1,-2
    802067c2:	100007b7          	lui	a5,0x10000
    802067c6:	17d5                	addi	a5,a5,-11
    802067c8:	02e7e663          	bltu	a5,a4,802067f4 <etrunc+0x4c>
    802067cc:	89be                	mv	s3,a5
        uint32 next = read_fat(clus);
    802067ce:	0004891b          	sext.w	s2,s1
    802067d2:	8526                	mv	a0,s1
    802067d4:	fffff097          	auipc	ra,0xfffff
    802067d8:	eac080e7          	jalr	-340(ra) # 80205680 <read_fat>
    802067dc:	0005049b          	sext.w	s1,a0
    write_fat(cluster, 0);
    802067e0:	4581                	li	a1,0
    802067e2:	854a                	mv	a0,s2
    802067e4:	fffff097          	auipc	ra,0xfffff
    802067e8:	050080e7          	jalr	80(ra) # 80205834 <write_fat>
    for (uint32 clus = entry->first_clus; clus >= 2 && clus < FAT32_EOC; ) {
    802067ec:	ffe4879b          	addiw	a5,s1,-2
    802067f0:	fcf9ffe3          	bgeu	s3,a5,802067ce <etrunc+0x26>
    entry->file_size = 0;
    802067f4:	100a2423          	sw	zero,264(s4)
    entry->first_clus = 0;
    802067f8:	100a2223          	sw	zero,260(s4)
    entry->dirty = 1;
    802067fc:	4785                	li	a5,1
    802067fe:	10fa0aa3          	sb	a5,277(s4)
}
    80206802:	70a2                	ld	ra,40(sp)
    80206804:	7402                	ld	s0,32(sp)
    80206806:	64e2                	ld	s1,24(sp)
    80206808:	6942                	ld	s2,16(sp)
    8020680a:	69a2                	ld	s3,8(sp)
    8020680c:	6a02                	ld	s4,0(sp)
    8020680e:	6145                	addi	sp,sp,48
    80206810:	8082                	ret

0000000080206812 <elock>:
{
    80206812:	1141                	addi	sp,sp,-16
    80206814:	e406                	sd	ra,8(sp)
    80206816:	e022                	sd	s0,0(sp)
    80206818:	0800                	addi	s0,sp,16
    if (entry == 0 || entry->ref < 1)
    8020681a:	cd19                	beqz	a0,80206838 <elock+0x26>
    8020681c:	11852783          	lw	a5,280(a0)
    80206820:	00f05c63          	blez	a5,80206838 <elock+0x26>
    acquiresleep(&entry->lock);
    80206824:	13850513          	addi	a0,a0,312
    80206828:	ffffd097          	auipc	ra,0xffffd
    8020682c:	e72080e7          	jalr	-398(ra) # 8020369a <acquiresleep>
}
    80206830:	60a2                	ld	ra,8(sp)
    80206832:	6402                	ld	s0,0(sp)
    80206834:	0141                	addi	sp,sp,16
    80206836:	8082                	ret
        panic("elock");
    80206838:	00004517          	auipc	a0,0x4
    8020683c:	87850513          	addi	a0,a0,-1928 # 8020a0b0 <sysnames+0x478>
    80206840:	ffffa097          	auipc	ra,0xffffa
    80206844:	904080e7          	jalr	-1788(ra) # 80200144 <panic>

0000000080206848 <eunlock>:
{
    80206848:	1101                	addi	sp,sp,-32
    8020684a:	ec06                	sd	ra,24(sp)
    8020684c:	e822                	sd	s0,16(sp)
    8020684e:	e426                	sd	s1,8(sp)
    80206850:	e04a                	sd	s2,0(sp)
    80206852:	1000                	addi	s0,sp,32
    if (entry == 0 || !holdingsleep(&entry->lock) || entry->ref < 1)
    80206854:	c90d                	beqz	a0,80206886 <eunlock+0x3e>
    80206856:	84aa                	mv	s1,a0
    80206858:	13850913          	addi	s2,a0,312
    8020685c:	854a                	mv	a0,s2
    8020685e:	ffffd097          	auipc	ra,0xffffd
    80206862:	ed6080e7          	jalr	-298(ra) # 80203734 <holdingsleep>
    80206866:	c105                	beqz	a0,80206886 <eunlock+0x3e>
    80206868:	1184a783          	lw	a5,280(s1)
    8020686c:	00f05d63          	blez	a5,80206886 <eunlock+0x3e>
    releasesleep(&entry->lock);
    80206870:	854a                	mv	a0,s2
    80206872:	ffffd097          	auipc	ra,0xffffd
    80206876:	e7e080e7          	jalr	-386(ra) # 802036f0 <releasesleep>
}
    8020687a:	60e2                	ld	ra,24(sp)
    8020687c:	6442                	ld	s0,16(sp)
    8020687e:	64a2                	ld	s1,8(sp)
    80206880:	6902                	ld	s2,0(sp)
    80206882:	6105                	addi	sp,sp,32
    80206884:	8082                	ret
        panic("eunlock");
    80206886:	00004517          	auipc	a0,0x4
    8020688a:	83250513          	addi	a0,a0,-1998 # 8020a0b8 <sysnames+0x480>
    8020688e:	ffffa097          	auipc	ra,0xffffa
    80206892:	8b6080e7          	jalr	-1866(ra) # 80200144 <panic>

0000000080206896 <eput>:
{
    80206896:	1101                	addi	sp,sp,-32
    80206898:	ec06                	sd	ra,24(sp)
    8020689a:	e822                	sd	s0,16(sp)
    8020689c:	e426                	sd	s1,8(sp)
    8020689e:	e04a                	sd	s2,0(sp)
    802068a0:	1000                	addi	s0,sp,32
    802068a2:	84aa                	mv	s1,a0
    acquire(&ecache.lock);
    802068a4:	000b3517          	auipc	a0,0xb3
    802068a8:	8ec50513          	addi	a0,a0,-1812 # 802b9190 <ecache>
    802068ac:	ffffa097          	auipc	ra,0xffffa
    802068b0:	e48080e7          	jalr	-440(ra) # 802006f4 <acquire>
    if (entry != &root && entry->valid != 0 && entry->ref == 1) {
    802068b4:	000b2797          	auipc	a5,0xb2
    802068b8:	77478793          	addi	a5,a5,1908 # 802b9028 <root>
    802068bc:	00f48a63          	beq	s1,a5,802068d0 <eput+0x3a>
    802068c0:	11649783          	lh	a5,278(s1)
    802068c4:	c791                	beqz	a5,802068d0 <eput+0x3a>
    802068c6:	1184a703          	lw	a4,280(s1)
    802068ca:	4785                	li	a5,1
    802068cc:	02f70563          	beq	a4,a5,802068f6 <eput+0x60>
    entry->ref--;
    802068d0:	1184a783          	lw	a5,280(s1)
    802068d4:	37fd                	addiw	a5,a5,-1
    802068d6:	10f4ac23          	sw	a5,280(s1)
    release(&ecache.lock);
    802068da:	000b3517          	auipc	a0,0xb3
    802068de:	8b650513          	addi	a0,a0,-1866 # 802b9190 <ecache>
    802068e2:	ffffa097          	auipc	ra,0xffffa
    802068e6:	e66080e7          	jalr	-410(ra) # 80200748 <release>
}
    802068ea:	60e2                	ld	ra,24(sp)
    802068ec:	6442                	ld	s0,16(sp)
    802068ee:	64a2                	ld	s1,8(sp)
    802068f0:	6902                	ld	s2,0(sp)
    802068f2:	6105                	addi	sp,sp,32
    802068f4:	8082                	ret
        acquiresleep(&entry->lock);
    802068f6:	13848913          	addi	s2,s1,312
    802068fa:	854a                	mv	a0,s2
    802068fc:	ffffd097          	auipc	ra,0xffffd
    80206900:	d9e080e7          	jalr	-610(ra) # 8020369a <acquiresleep>
        entry->next->prev = entry->prev;
    80206904:	1284b703          	ld	a4,296(s1)
    80206908:	1304b783          	ld	a5,304(s1)
    8020690c:	12f73823          	sd	a5,304(a4)
        entry->prev->next = entry->next;
    80206910:	1284b703          	ld	a4,296(s1)
    80206914:	12e7b423          	sd	a4,296(a5)
        entry->next = root.next;
    80206918:	000b2797          	auipc	a5,0xb2
    8020691c:	6e878793          	addi	a5,a5,1768 # 802b9000 <fat>
    80206920:	1507b703          	ld	a4,336(a5)
    80206924:	12e4b423          	sd	a4,296(s1)
        entry->prev = &root;
    80206928:	000b2697          	auipc	a3,0xb2
    8020692c:	70068693          	addi	a3,a3,1792 # 802b9028 <root>
    80206930:	12d4b823          	sd	a3,304(s1)
        root.next->prev = entry;
    80206934:	12973823          	sd	s1,304(a4)
        root.next = entry;
    80206938:	1497b823          	sd	s1,336(a5)
        release(&ecache.lock);
    8020693c:	000b3517          	auipc	a0,0xb3
    80206940:	85450513          	addi	a0,a0,-1964 # 802b9190 <ecache>
    80206944:	ffffa097          	auipc	ra,0xffffa
    80206948:	e04080e7          	jalr	-508(ra) # 80200748 <release>
        if (entry->valid == -1) {       // this means some one has called eremove()
    8020694c:	11649703          	lh	a4,278(s1)
    80206950:	57fd                	li	a5,-1
    80206952:	06f70863          	beq	a4,a5,802069c2 <eput+0x12c>
            elock(entry->parent);
    80206956:	1204b503          	ld	a0,288(s1)
    8020695a:	00000097          	auipc	ra,0x0
    8020695e:	eb8080e7          	jalr	-328(ra) # 80206812 <elock>
            eupdate(entry);
    80206962:	8526                	mv	a0,s1
    80206964:	00000097          	auipc	ra,0x0
    80206968:	c9e080e7          	jalr	-866(ra) # 80206602 <eupdate>
            eunlock(entry->parent);
    8020696c:	1204b503          	ld	a0,288(s1)
    80206970:	00000097          	auipc	ra,0x0
    80206974:	ed8080e7          	jalr	-296(ra) # 80206848 <eunlock>
        releasesleep(&entry->lock);
    80206978:	854a                	mv	a0,s2
    8020697a:	ffffd097          	auipc	ra,0xffffd
    8020697e:	d76080e7          	jalr	-650(ra) # 802036f0 <releasesleep>
        struct dirent *eparent = entry->parent;
    80206982:	1204b903          	ld	s2,288(s1)
        acquire(&ecache.lock);
    80206986:	000b3517          	auipc	a0,0xb3
    8020698a:	80a50513          	addi	a0,a0,-2038 # 802b9190 <ecache>
    8020698e:	ffffa097          	auipc	ra,0xffffa
    80206992:	d66080e7          	jalr	-666(ra) # 802006f4 <acquire>
        entry->ref--;
    80206996:	1184a783          	lw	a5,280(s1)
    8020699a:	37fd                	addiw	a5,a5,-1
    8020699c:	10f4ac23          	sw	a5,280(s1)
        release(&ecache.lock);
    802069a0:	000b2517          	auipc	a0,0xb2
    802069a4:	7f050513          	addi	a0,a0,2032 # 802b9190 <ecache>
    802069a8:	ffffa097          	auipc	ra,0xffffa
    802069ac:	da0080e7          	jalr	-608(ra) # 80200748 <release>
        if (entry->ref == 0) {
    802069b0:	1184a783          	lw	a5,280(s1)
    802069b4:	fb9d                	bnez	a5,802068ea <eput+0x54>
            eput(eparent);
    802069b6:	854a                	mv	a0,s2
    802069b8:	00000097          	auipc	ra,0x0
    802069bc:	ede080e7          	jalr	-290(ra) # 80206896 <eput>
    802069c0:	b72d                	j	802068ea <eput+0x54>
            etrunc(entry);
    802069c2:	8526                	mv	a0,s1
    802069c4:	00000097          	auipc	ra,0x0
    802069c8:	de4080e7          	jalr	-540(ra) # 802067a8 <etrunc>
    802069cc:	b775                	j	80206978 <eput+0xe2>

00000000802069ce <estat>:
{
    802069ce:	1101                	addi	sp,sp,-32
    802069d0:	ec06                	sd	ra,24(sp)
    802069d2:	e822                	sd	s0,16(sp)
    802069d4:	e426                	sd	s1,8(sp)
    802069d6:	e04a                	sd	s2,0(sp)
    802069d8:	1000                	addi	s0,sp,32
    802069da:	892a                	mv	s2,a0
    802069dc:	84ae                	mv	s1,a1
    strncpy(st->name, de->filename, STAT_MAX_NAME);
    802069de:	02000613          	li	a2,32
    802069e2:	85aa                	mv	a1,a0
    802069e4:	8526                	mv	a0,s1
    802069e6:	ffffa097          	auipc	ra,0xffffa
    802069ea:	ec2080e7          	jalr	-318(ra) # 802008a8 <strncpy>
    st->type = (de->attribute & ATTR_DIRECTORY) ? T_DIR : T_FILE;
    802069ee:	10094783          	lbu	a5,256(s2)
    802069f2:	8bc1                	andi	a5,a5,16
    802069f4:	0017b793          	seqz	a5,a5
    802069f8:	0785                	addi	a5,a5,1
    802069fa:	02f49423          	sh	a5,40(s1)
    st->dev = de->dev;
    802069fe:	11494783          	lbu	a5,276(s2)
    80206a02:	d0dc                	sw	a5,36(s1)
    st->size = de->file_size;
    80206a04:	10896783          	lwu	a5,264(s2)
    80206a08:	f89c                	sd	a5,48(s1)
}
    80206a0a:	60e2                	ld	ra,24(sp)
    80206a0c:	6442                	ld	s0,16(sp)
    80206a0e:	64a2                	ld	s1,8(sp)
    80206a10:	6902                	ld	s2,0(sp)
    80206a12:	6105                	addi	sp,sp,32
    80206a14:	8082                	ret

0000000080206a16 <enext>:
 * @return  -1      meet the end of dir
 *          0       find empty slots
 *          1       find a file with all its entries
 */
int enext(struct dirent *dp, struct dirent *ep, uint off, int *count)
{
    80206a16:	7119                	addi	sp,sp,-128
    80206a18:	fc86                	sd	ra,120(sp)
    80206a1a:	f8a2                	sd	s0,112(sp)
    80206a1c:	f4a6                	sd	s1,104(sp)
    80206a1e:	f0ca                	sd	s2,96(sp)
    80206a20:	ecce                	sd	s3,88(sp)
    80206a22:	e8d2                	sd	s4,80(sp)
    80206a24:	e4d6                	sd	s5,72(sp)
    80206a26:	e0da                	sd	s6,64(sp)
    80206a28:	fc5e                	sd	s7,56(sp)
    80206a2a:	f862                	sd	s8,48(sp)
    80206a2c:	f466                	sd	s9,40(sp)
    80206a2e:	0100                	addi	s0,sp,128
    if (!(dp->attribute & ATTR_DIRECTORY))
    80206a30:	10054783          	lbu	a5,256(a0)
    80206a34:	8bc1                	andi	a5,a5,16
    80206a36:	cf95                	beqz	a5,80206a72 <enext+0x5c>
    80206a38:	892a                	mv	s2,a0
    80206a3a:	8a2e                	mv	s4,a1
    80206a3c:	84b2                	mv	s1,a2
    80206a3e:	89b6                	mv	s3,a3
        panic("enext not dir");
    if (ep->valid)
    80206a40:	11659783          	lh	a5,278(a1)
    80206a44:	ef9d                	bnez	a5,80206a82 <enext+0x6c>
        panic("enext ep valid");
    if (off % 32)
    80206a46:	01f67793          	andi	a5,a2,31
    80206a4a:	e7a1                	bnez	a5,80206a92 <enext+0x7c>
        panic("enext not align");
    if (dp->valid != 1) { return -1; }
    80206a4c:	11651703          	lh	a4,278(a0)
    80206a50:	4785                	li	a5,1
    80206a52:	557d                	li	a0,-1
    80206a54:	04f70763          	beq	a4,a5,80206aa2 <enext+0x8c>
            read_entry_info(ep, &de);
            return 1;
        }
    }
    return -1;
}
    80206a58:	70e6                	ld	ra,120(sp)
    80206a5a:	7446                	ld	s0,112(sp)
    80206a5c:	74a6                	ld	s1,104(sp)
    80206a5e:	7906                	ld	s2,96(sp)
    80206a60:	69e6                	ld	s3,88(sp)
    80206a62:	6a46                	ld	s4,80(sp)
    80206a64:	6aa6                	ld	s5,72(sp)
    80206a66:	6b06                	ld	s6,64(sp)
    80206a68:	7be2                	ld	s7,56(sp)
    80206a6a:	7c42                	ld	s8,48(sp)
    80206a6c:	7ca2                	ld	s9,40(sp)
    80206a6e:	6109                	addi	sp,sp,128
    80206a70:	8082                	ret
        panic("enext not dir");
    80206a72:	00003517          	auipc	a0,0x3
    80206a76:	64e50513          	addi	a0,a0,1614 # 8020a0c0 <sysnames+0x488>
    80206a7a:	ffff9097          	auipc	ra,0xffff9
    80206a7e:	6ca080e7          	jalr	1738(ra) # 80200144 <panic>
        panic("enext ep valid");
    80206a82:	00003517          	auipc	a0,0x3
    80206a86:	64e50513          	addi	a0,a0,1614 # 8020a0d0 <sysnames+0x498>
    80206a8a:	ffff9097          	auipc	ra,0xffff9
    80206a8e:	6ba080e7          	jalr	1722(ra) # 80200144 <panic>
        panic("enext not align");
    80206a92:	00003517          	auipc	a0,0x3
    80206a96:	64e50513          	addi	a0,a0,1614 # 8020a0e0 <sysnames+0x4a8>
    80206a9a:	ffff9097          	auipc	ra,0xffff9
    80206a9e:	6aa080e7          	jalr	1706(ra) # 80200144 <panic>
    memset(ep->filename, 0, FAT32_MAX_FILENAME + 1);
    80206aa2:	8cae                	mv	s9,a1
    80206aa4:	10000613          	li	a2,256
    80206aa8:	4581                	li	a1,0
    80206aaa:	8552                	mv	a0,s4
    80206aac:	ffffa097          	auipc	ra,0xffffa
    80206ab0:	ce4080e7          	jalr	-796(ra) # 80200790 <memset>
    int cnt = 0;
    80206ab4:	4a81                	li	s5,0
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    80206ab6:	5b7d                	li	s6,-1
        if (de.lne.order == EMPTY_ENTRY) {
    80206ab8:	0e500b93          	li	s7,229
        if (de.lne.attr == ATTR_LONG_NAME) {
    80206abc:	4c3d                	li	s8,15
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    80206abe:	a805                	j	80206aee <enext+0xd8>
            cnt++;
    80206ac0:	2a85                	addiw	s5,s5,1
            continue;
    80206ac2:	a025                	j	80206aea <enext+0xd4>
            *count = cnt;
    80206ac4:	0159a023          	sw	s5,0(s3)
            return 0;
    80206ac8:	4501                	li	a0,0
    80206aca:	b779                	j	80206a58 <enext+0x42>
            read_entry_name(ep->filename + (lcnt - 1) * CHAR_LONG_NAME, &de);
    80206acc:	fff5079b          	addiw	a5,a0,-1
    80206ad0:	0017951b          	slliw	a0,a5,0x1
    80206ad4:	9d3d                	addw	a0,a0,a5
    80206ad6:	0025151b          	slliw	a0,a0,0x2
    80206ada:	9d3d                	addw	a0,a0,a5
    80206adc:	f8040593          	addi	a1,s0,-128
    80206ae0:	9566                	add	a0,a0,s9
    80206ae2:	fffff097          	auipc	ra,0xfffff
    80206ae6:	136080e7          	jalr	310(ra) # 80205c18 <read_entry_name>
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    80206aea:	0204849b          	addiw	s1,s1,32
    80206aee:	4601                	li	a2,0
    80206af0:	85a6                	mv	a1,s1
    80206af2:	854a                	mv	a0,s2
    80206af4:	fffff097          	auipc	ra,0xfffff
    80206af8:	dc0080e7          	jalr	-576(ra) # 802058b4 <reloc_clus>
    80206afc:	f5650ee3          	beq	a0,s6,80206a58 <enext+0x42>
        if (rw_clus(dp->cur_clus, 0, 0, (uint64)&de, off2, 32) != 32 || de.lne.order == END_OF_ENTRY) {
    80206b00:	02000793          	li	a5,32
    80206b04:	0005071b          	sext.w	a4,a0
    80206b08:	f8040693          	addi	a3,s0,-128
    80206b0c:	4601                	li	a2,0
    80206b0e:	4581                	li	a1,0
    80206b10:	10c92503          	lw	a0,268(s2)
    80206b14:	fffff097          	auipc	ra,0xfffff
    80206b18:	eaa080e7          	jalr	-342(ra) # 802059be <rw_clus>
    80206b1c:	2501                	sext.w	a0,a0
    80206b1e:	02000793          	li	a5,32
    80206b22:	06f51c63          	bne	a0,a5,80206b9a <enext+0x184>
    80206b26:	f8044783          	lbu	a5,-128(s0)
    80206b2a:	cbb5                	beqz	a5,80206b9e <enext+0x188>
        if (de.lne.order == EMPTY_ENTRY) {
    80206b2c:	f9778ae3          	beq	a5,s7,80206ac0 <enext+0xaa>
        } else if (cnt) {
    80206b30:	f80a9ae3          	bnez	s5,80206ac4 <enext+0xae>
        if (de.lne.attr == ATTR_LONG_NAME) {
    80206b34:	f8b44703          	lbu	a4,-117(s0)
    80206b38:	01871d63          	bne	a4,s8,80206b52 <enext+0x13c>
            int lcnt = de.lne.order & ~LAST_LONG_ENTRY;
    80206b3c:	0bf7f513          	andi	a0,a5,191
            if (de.lne.order & LAST_LONG_ENTRY) {
    80206b40:	0407f793          	andi	a5,a5,64
    80206b44:	d7c1                	beqz	a5,80206acc <enext+0xb6>
                *count = lcnt + 1;                              // plus the s-n-e;
    80206b46:	0015079b          	addiw	a5,a0,1
    80206b4a:	00f9a023          	sw	a5,0(s3)
                count = 0;
    80206b4e:	4981                	li	s3,0
    80206b50:	bfb5                	j	80206acc <enext+0xb6>
            if (count) {
    80206b52:	00098c63          	beqz	s3,80206b6a <enext+0x154>
                *count = 1;
    80206b56:	4785                	li	a5,1
    80206b58:	00f9a023          	sw	a5,0(s3)
                read_entry_name(ep->filename, &de);
    80206b5c:	f8040593          	addi	a1,s0,-128
    80206b60:	8552                	mv	a0,s4
    80206b62:	fffff097          	auipc	ra,0xfffff
    80206b66:	0b6080e7          	jalr	182(ra) # 80205c18 <read_entry_name>
    entry->attribute = d->sne.attr;
    80206b6a:	f8b44783          	lbu	a5,-117(s0)
    80206b6e:	10fa0023          	sb	a5,256(s4)
    entry->first_clus = ((uint32)d->sne.fst_clus_hi << 16) | d->sne.fst_clus_lo;
    80206b72:	f9445783          	lhu	a5,-108(s0)
    80206b76:	0107979b          	slliw	a5,a5,0x10
    80206b7a:	f9a45703          	lhu	a4,-102(s0)
    80206b7e:	8fd9                	or	a5,a5,a4
    80206b80:	2781                	sext.w	a5,a5
    80206b82:	10fa2223          	sw	a5,260(s4)
    entry->file_size = d->sne.file_size;
    80206b86:	f9c42703          	lw	a4,-100(s0)
    80206b8a:	10ea2423          	sw	a4,264(s4)
    entry->cur_clus = entry->first_clus;
    80206b8e:	10fa2623          	sw	a5,268(s4)
    entry->clus_cnt = 0;
    80206b92:	100a2823          	sw	zero,272(s4)
            return 1;
    80206b96:	4505                	li	a0,1
}
    80206b98:	b5c1                	j	80206a58 <enext+0x42>
            return -1;
    80206b9a:	557d                	li	a0,-1
    80206b9c:	bd75                	j	80206a58 <enext+0x42>
    80206b9e:	557d                	li	a0,-1
    80206ba0:	bd65                	j	80206a58 <enext+0x42>

0000000080206ba2 <dirlookup>:
 * @param   dp          entry of a directory file
 * @param   filename    target filename
 * @param   poff        offset of proper empty entry slots from the beginning of the dir
 */
struct dirent *dirlookup(struct dirent *dp, char *filename, uint *poff)
{
    80206ba2:	715d                	addi	sp,sp,-80
    80206ba4:	e486                	sd	ra,72(sp)
    80206ba6:	e0a2                	sd	s0,64(sp)
    80206ba8:	fc26                	sd	s1,56(sp)
    80206baa:	f84a                	sd	s2,48(sp)
    80206bac:	f44e                	sd	s3,40(sp)
    80206bae:	f052                	sd	s4,32(sp)
    80206bb0:	ec56                	sd	s5,24(sp)
    80206bb2:	e85a                	sd	s6,16(sp)
    80206bb4:	0880                	addi	s0,sp,80
    if (!(dp->attribute & ATTR_DIRECTORY))
    80206bb6:	10054783          	lbu	a5,256(a0)
    80206bba:	8bc1                	andi	a5,a5,16
    80206bbc:	cbb1                	beqz	a5,80206c10 <dirlookup+0x6e>
    80206bbe:	84aa                	mv	s1,a0
    80206bc0:	89ae                	mv	s3,a1
    80206bc2:	8ab2                	mv	s5,a2
        panic("dirlookup not DIR");
    if (strncmp(filename, ".", FAT32_MAX_FILENAME) == 0) {
    80206bc4:	0ff00613          	li	a2,255
    80206bc8:	00003597          	auipc	a1,0x3
    80206bcc:	54058593          	addi	a1,a1,1344 # 8020a108 <sysnames+0x4d0>
    80206bd0:	854e                	mv	a0,s3
    80206bd2:	ffffa097          	auipc	ra,0xffffa
    80206bd6:	c9a080e7          	jalr	-870(ra) # 8020086c <strncmp>
    80206bda:	c139                	beqz	a0,80206c20 <dirlookup+0x7e>
        return edup(dp);
    } else if (strncmp(filename, "..", FAT32_MAX_FILENAME) == 0) {
    80206bdc:	0ff00613          	li	a2,255
    80206be0:	00003597          	auipc	a1,0x3
    80206be4:	53058593          	addi	a1,a1,1328 # 8020a110 <sysnames+0x4d8>
    80206be8:	854e                	mv	a0,s3
    80206bea:	ffffa097          	auipc	ra,0xffffa
    80206bee:	c82080e7          	jalr	-894(ra) # 8020086c <strncmp>
    80206bf2:	ed39                	bnez	a0,80206c50 <dirlookup+0xae>
        if (dp == &root) {
    80206bf4:	000b2797          	auipc	a5,0xb2
    80206bf8:	43478793          	addi	a5,a5,1076 # 802b9028 <root>
    80206bfc:	04f48363          	beq	s1,a5,80206c42 <dirlookup+0xa0>
            return edup(&root);
        }
        return edup(dp->parent);
    80206c00:	1204b503          	ld	a0,288(s1)
    80206c04:	00000097          	auipc	ra,0x0
    80206c08:	9ba080e7          	jalr	-1606(ra) # 802065be <edup>
    80206c0c:	892a                	mv	s2,a0
    80206c0e:	a839                	j	80206c2c <dirlookup+0x8a>
        panic("dirlookup not DIR");
    80206c10:	00003517          	auipc	a0,0x3
    80206c14:	4e050513          	addi	a0,a0,1248 # 8020a0f0 <sysnames+0x4b8>
    80206c18:	ffff9097          	auipc	ra,0xffff9
    80206c1c:	52c080e7          	jalr	1324(ra) # 80200144 <panic>
        return edup(dp);
    80206c20:	8526                	mv	a0,s1
    80206c22:	00000097          	auipc	ra,0x0
    80206c26:	99c080e7          	jalr	-1636(ra) # 802065be <edup>
    80206c2a:	892a                	mv	s2,a0
    if (poff) {
        *poff = off;
    }
    eput(ep);
    return NULL;
}
    80206c2c:	854a                	mv	a0,s2
    80206c2e:	60a6                	ld	ra,72(sp)
    80206c30:	6406                	ld	s0,64(sp)
    80206c32:	74e2                	ld	s1,56(sp)
    80206c34:	7942                	ld	s2,48(sp)
    80206c36:	79a2                	ld	s3,40(sp)
    80206c38:	7a02                	ld	s4,32(sp)
    80206c3a:	6ae2                	ld	s5,24(sp)
    80206c3c:	6b42                	ld	s6,16(sp)
    80206c3e:	6161                	addi	sp,sp,80
    80206c40:	8082                	ret
            return edup(&root);
    80206c42:	853e                	mv	a0,a5
    80206c44:	00000097          	auipc	ra,0x0
    80206c48:	97a080e7          	jalr	-1670(ra) # 802065be <edup>
    80206c4c:	892a                	mv	s2,a0
    80206c4e:	bff9                	j	80206c2c <dirlookup+0x8a>
    if (dp->valid != 1) {
    80206c50:	11649703          	lh	a4,278(s1)
    80206c54:	4785                	li	a5,1
        return NULL;
    80206c56:	4901                	li	s2,0
    if (dp->valid != 1) {
    80206c58:	fcf71ae3          	bne	a4,a5,80206c2c <dirlookup+0x8a>
    struct dirent *ep = eget(dp, filename);
    80206c5c:	85ce                	mv	a1,s3
    80206c5e:	8526                	mv	a0,s1
    80206c60:	fffff097          	auipc	ra,0xfffff
    80206c64:	eaa080e7          	jalr	-342(ra) # 80205b0a <eget>
    80206c68:	892a                	mv	s2,a0
    if (ep->valid == 1) { return ep; }                               // ecache hits
    80206c6a:	11651703          	lh	a4,278(a0)
    80206c6e:	4785                	li	a5,1
    80206c70:	faf70ee3          	beq	a4,a5,80206c2c <dirlookup+0x8a>
    int len = strlen(filename);
    80206c74:	854e                	mv	a0,s3
    80206c76:	ffffa097          	auipc	ra,0xffffa
    80206c7a:	ca2080e7          	jalr	-862(ra) # 80200918 <strlen>
    int count = 0;
    80206c7e:	fa042e23          	sw	zero,-68(s0)
    reloc_clus(dp, 0, 0);
    80206c82:	4601                	li	a2,0
    80206c84:	4581                	li	a1,0
    80206c86:	8526                	mv	a0,s1
    80206c88:	fffff097          	auipc	ra,0xfffff
    80206c8c:	c2c080e7          	jalr	-980(ra) # 802058b4 <reloc_clus>
    uint off = 0;
    80206c90:	4a01                	li	s4,0
    while ((type = enext(dp, ep, off, &count) != -1)) {
    80206c92:	5b7d                	li	s6,-1
    80206c94:	fbc40693          	addi	a3,s0,-68
    80206c98:	8652                	mv	a2,s4
    80206c9a:	85ca                	mv	a1,s2
    80206c9c:	8526                	mv	a0,s1
    80206c9e:	00000097          	auipc	ra,0x0
    80206ca2:	d78080e7          	jalr	-648(ra) # 80206a16 <enext>
    80206ca6:	03650f63          	beq	a0,s6,80206ce4 <dirlookup+0x142>
        } else if (strncmp(filename, ep->filename, FAT32_MAX_FILENAME) == 0) {
    80206caa:	0ff00613          	li	a2,255
    80206cae:	85ca                	mv	a1,s2
    80206cb0:	854e                	mv	a0,s3
    80206cb2:	ffffa097          	auipc	ra,0xffffa
    80206cb6:	bba080e7          	jalr	-1094(ra) # 8020086c <strncmp>
    80206cba:	c901                	beqz	a0,80206cca <dirlookup+0x128>
        off += count << 5;
    80206cbc:	fbc42783          	lw	a5,-68(s0)
    80206cc0:	0057979b          	slliw	a5,a5,0x5
    80206cc4:	01478a3b          	addw	s4,a5,s4
    80206cc8:	b7f1                	j	80206c94 <dirlookup+0xf2>
            ep->parent = edup(dp);
    80206cca:	8526                	mv	a0,s1
    80206ccc:	00000097          	auipc	ra,0x0
    80206cd0:	8f2080e7          	jalr	-1806(ra) # 802065be <edup>
    80206cd4:	12a93023          	sd	a0,288(s2)
            ep->off = off;
    80206cd8:	11492e23          	sw	s4,284(s2)
            ep->valid = 1;
    80206cdc:	4785                	li	a5,1
    80206cde:	10f91b23          	sh	a5,278(s2)
            return ep;
    80206ce2:	b7a9                	j	80206c2c <dirlookup+0x8a>
    if (poff) {
    80206ce4:	000a8463          	beqz	s5,80206cec <dirlookup+0x14a>
        *poff = off;
    80206ce8:	014aa023          	sw	s4,0(s5)
    eput(ep);
    80206cec:	854a                	mv	a0,s2
    80206cee:	00000097          	auipc	ra,0x0
    80206cf2:	ba8080e7          	jalr	-1112(ra) # 80206896 <eput>
    return NULL;
    80206cf6:	4901                	li	s2,0
    80206cf8:	bf15                	j	80206c2c <dirlookup+0x8a>

0000000080206cfa <ealloc>:
{
    80206cfa:	7139                	addi	sp,sp,-64
    80206cfc:	fc06                	sd	ra,56(sp)
    80206cfe:	f822                	sd	s0,48(sp)
    80206d00:	f426                	sd	s1,40(sp)
    80206d02:	f04a                	sd	s2,32(sp)
    80206d04:	ec4e                	sd	s3,24(sp)
    80206d06:	e852                	sd	s4,16(sp)
    80206d08:	0080                	addi	s0,sp,64
    80206d0a:	892a                	mv	s2,a0
    if (!(dp->attribute & ATTR_DIRECTORY)) {
    80206d0c:	10054783          	lbu	a5,256(a0)
    80206d10:	8bc1                	andi	a5,a5,16
    80206d12:	c7a9                	beqz	a5,80206d5c <ealloc+0x62>
    80206d14:	852e                	mv	a0,a1
    80206d16:	8a32                	mv	s4,a2
    if (dp->valid != 1 || !(name = formatname(name))) {        // detect illegal character
    80206d18:	11691703          	lh	a4,278(s2)
    80206d1c:	4785                	li	a5,1
        return NULL;
    80206d1e:	4481                	li	s1,0
    if (dp->valid != 1 || !(name = formatname(name))) {        // detect illegal character
    80206d20:	02f71563          	bne	a4,a5,80206d4a <ealloc+0x50>
    80206d24:	fffff097          	auipc	ra,0xfffff
    80206d28:	448080e7          	jalr	1096(ra) # 8020616c <formatname>
    80206d2c:	89aa                	mv	s3,a0
    80206d2e:	10050663          	beqz	a0,80206e3a <ealloc+0x140>
    uint off = 0;
    80206d32:	fc042623          	sw	zero,-52(s0)
    if ((ep = dirlookup(dp, name, &off)) != 0) {      // entry exists
    80206d36:	fcc40613          	addi	a2,s0,-52
    80206d3a:	85aa                	mv	a1,a0
    80206d3c:	854a                	mv	a0,s2
    80206d3e:	00000097          	auipc	ra,0x0
    80206d42:	e64080e7          	jalr	-412(ra) # 80206ba2 <dirlookup>
    80206d46:	84aa                	mv	s1,a0
    80206d48:	c115                	beqz	a0,80206d6c <ealloc+0x72>
}
    80206d4a:	8526                	mv	a0,s1
    80206d4c:	70e2                	ld	ra,56(sp)
    80206d4e:	7442                	ld	s0,48(sp)
    80206d50:	74a2                	ld	s1,40(sp)
    80206d52:	7902                	ld	s2,32(sp)
    80206d54:	69e2                	ld	s3,24(sp)
    80206d56:	6a42                	ld	s4,16(sp)
    80206d58:	6121                	addi	sp,sp,64
    80206d5a:	8082                	ret
        panic("ealloc not dir");
    80206d5c:	00003517          	auipc	a0,0x3
    80206d60:	3bc50513          	addi	a0,a0,956 # 8020a118 <sysnames+0x4e0>
    80206d64:	ffff9097          	auipc	ra,0xffff9
    80206d68:	3e0080e7          	jalr	992(ra) # 80200144 <panic>
    ep = eget(dp, name);
    80206d6c:	85ce                	mv	a1,s3
    80206d6e:	854a                	mv	a0,s2
    80206d70:	fffff097          	auipc	ra,0xfffff
    80206d74:	d9a080e7          	jalr	-614(ra) # 80205b0a <eget>
    80206d78:	84aa                	mv	s1,a0
    elock(ep);
    80206d7a:	00000097          	auipc	ra,0x0
    80206d7e:	a98080e7          	jalr	-1384(ra) # 80206812 <elock>
    ep->attribute = attr;
    80206d82:	11448023          	sb	s4,256(s1)
    ep->file_size = 0;
    80206d86:	1004a423          	sw	zero,264(s1)
    ep->first_clus = 0;
    80206d8a:	1004a223          	sw	zero,260(s1)
    ep->parent = edup(dp);
    80206d8e:	854a                	mv	a0,s2
    80206d90:	00000097          	auipc	ra,0x0
    80206d94:	82e080e7          	jalr	-2002(ra) # 802065be <edup>
    80206d98:	12a4b023          	sd	a0,288(s1)
    ep->off = off;
    80206d9c:	fcc42783          	lw	a5,-52(s0)
    80206da0:	10f4ae23          	sw	a5,284(s1)
    ep->clus_cnt = 0;
    80206da4:	1004a823          	sw	zero,272(s1)
    ep->cur_clus = 0;
    80206da8:	1004a623          	sw	zero,268(s1)
    ep->dirty = 0;
    80206dac:	10048aa3          	sb	zero,277(s1)
    strncpy(ep->filename, name, FAT32_MAX_FILENAME);
    80206db0:	0ff00613          	li	a2,255
    80206db4:	85ce                	mv	a1,s3
    80206db6:	8526                	mv	a0,s1
    80206db8:	ffffa097          	auipc	ra,0xffffa
    80206dbc:	af0080e7          	jalr	-1296(ra) # 802008a8 <strncpy>
    ep->filename[FAT32_MAX_FILENAME] = '\0';
    80206dc0:	0e048fa3          	sb	zero,255(s1)
    if (attr == ATTR_DIRECTORY) {    // generate "." and ".." for ep
    80206dc4:	47c1                	li	a5,16
    80206dc6:	02fa0963          	beq	s4,a5,80206df8 <ealloc+0xfe>
        ep->attribute |= ATTR_ARCHIVE;
    80206dca:	1004c783          	lbu	a5,256(s1)
    80206dce:	0207e793          	ori	a5,a5,32
    80206dd2:	10f48023          	sb	a5,256(s1)
    emake(dp, ep, off);
    80206dd6:	fcc42603          	lw	a2,-52(s0)
    80206dda:	85a6                	mv	a1,s1
    80206ddc:	854a                	mv	a0,s2
    80206dde:	fffff097          	auipc	ra,0xfffff
    80206de2:	446080e7          	jalr	1094(ra) # 80206224 <emake>
    ep->valid = 1;
    80206de6:	4785                	li	a5,1
    80206de8:	10f49b23          	sh	a5,278(s1)
    eunlock(ep);
    80206dec:	8526                	mv	a0,s1
    80206dee:	00000097          	auipc	ra,0x0
    80206df2:	a5a080e7          	jalr	-1446(ra) # 80206848 <eunlock>
    return ep;
    80206df6:	bf91                	j	80206d4a <ealloc+0x50>
        ep->attribute |= ATTR_DIRECTORY;
    80206df8:	1004c783          	lbu	a5,256(s1)
    80206dfc:	0107e793          	ori	a5,a5,16
    80206e00:	10f48023          	sb	a5,256(s1)
        ep->cur_clus = ep->first_clus = alloc_clus(dp->dev);
    80206e04:	11494503          	lbu	a0,276(s2)
    80206e08:	fffff097          	auipc	ra,0xfffff
    80206e0c:	8ec080e7          	jalr	-1812(ra) # 802056f4 <alloc_clus>
    80206e10:	2501                	sext.w	a0,a0
    80206e12:	10a4a223          	sw	a0,260(s1)
    80206e16:	10a4a623          	sw	a0,268(s1)
        emake(ep, ep, 0);
    80206e1a:	4601                	li	a2,0
    80206e1c:	85a6                	mv	a1,s1
    80206e1e:	8526                	mv	a0,s1
    80206e20:	fffff097          	auipc	ra,0xfffff
    80206e24:	404080e7          	jalr	1028(ra) # 80206224 <emake>
        emake(ep, dp, 32);
    80206e28:	02000613          	li	a2,32
    80206e2c:	85ca                	mv	a1,s2
    80206e2e:	8526                	mv	a0,s1
    80206e30:	fffff097          	auipc	ra,0xfffff
    80206e34:	3f4080e7          	jalr	1012(ra) # 80206224 <emake>
    80206e38:	bf79                	j	80206dd6 <ealloc+0xdc>
        return NULL;
    80206e3a:	84aa                	mv	s1,a0
    80206e3c:	b739                	j	80206d4a <ealloc+0x50>

0000000080206e3e <lookup_path>:
    return path;
}

// FAT32 version of namex in xv6's original file system.
static struct dirent *lookup_path(char *path, int parent, char *name)
{
    80206e3e:	715d                	addi	sp,sp,-80
    80206e40:	e486                	sd	ra,72(sp)
    80206e42:	e0a2                	sd	s0,64(sp)
    80206e44:	fc26                	sd	s1,56(sp)
    80206e46:	f84a                	sd	s2,48(sp)
    80206e48:	f44e                	sd	s3,40(sp)
    80206e4a:	f052                	sd	s4,32(sp)
    80206e4c:	ec56                	sd	s5,24(sp)
    80206e4e:	e85a                	sd	s6,16(sp)
    80206e50:	e45e                	sd	s7,8(sp)
    80206e52:	e062                	sd	s8,0(sp)
    80206e54:	0880                	addi	s0,sp,80
    80206e56:	892a                	mv	s2,a0
    80206e58:	8b2e                	mv	s6,a1
    80206e5a:	8ab2                	mv	s5,a2
    struct dirent *entry, *next;
    if (*path == '/') {
    80206e5c:	00054783          	lbu	a5,0(a0)
    80206e60:	02f00713          	li	a4,47
    80206e64:	02e78663          	beq	a5,a4,80206e90 <lookup_path+0x52>
        entry = edup(&root);
    } else if (*path != '\0') {
        entry = edup(myproc()->cwd);
    } else {
        return NULL;
    80206e68:	4981                	li	s3,0
    } else if (*path != '\0') {
    80206e6a:	cba1                	beqz	a5,80206eba <lookup_path+0x7c>
        entry = edup(myproc()->cwd);
    80206e6c:	ffffb097          	auipc	ra,0xffffb
    80206e70:	cb0080e7          	jalr	-848(ra) # 80201b1c <myproc>
    80206e74:	15853503          	ld	a0,344(a0)
    80206e78:	fffff097          	auipc	ra,0xfffff
    80206e7c:	746080e7          	jalr	1862(ra) # 802065be <edup>
    80206e80:	89aa                	mv	s3,a0
    while (*path == '/') {
    80206e82:	02f00a13          	li	s4,47
    80206e86:	0ff00b93          	li	s7,255
    80206e8a:	0ff00c13          	li	s8,255
    80206e8e:	a0dd                	j	80206f74 <lookup_path+0x136>
        entry = edup(&root);
    80206e90:	000b2517          	auipc	a0,0xb2
    80206e94:	19850513          	addi	a0,a0,408 # 802b9028 <root>
    80206e98:	fffff097          	auipc	ra,0xfffff
    80206e9c:	726080e7          	jalr	1830(ra) # 802065be <edup>
    80206ea0:	89aa                	mv	s3,a0
    80206ea2:	b7c5                	j	80206e82 <lookup_path+0x44>
    }
    while ((path = skipelem(path, name)) != 0) {
        elock(entry);
        if (!(entry->attribute & ATTR_DIRECTORY)) {
            eunlock(entry);
    80206ea4:	854e                	mv	a0,s3
    80206ea6:	00000097          	auipc	ra,0x0
    80206eaa:	9a2080e7          	jalr	-1630(ra) # 80206848 <eunlock>
            eput(entry);
    80206eae:	854e                	mv	a0,s3
    80206eb0:	00000097          	auipc	ra,0x0
    80206eb4:	9e6080e7          	jalr	-1562(ra) # 80206896 <eput>
            return NULL;
    80206eb8:	4981                	li	s3,0
    if (parent) {
        eput(entry);
        return NULL;
    }
    return entry;
}
    80206eba:	854e                	mv	a0,s3
    80206ebc:	60a6                	ld	ra,72(sp)
    80206ebe:	6406                	ld	s0,64(sp)
    80206ec0:	74e2                	ld	s1,56(sp)
    80206ec2:	7942                	ld	s2,48(sp)
    80206ec4:	79a2                	ld	s3,40(sp)
    80206ec6:	7a02                	ld	s4,32(sp)
    80206ec8:	6ae2                	ld	s5,24(sp)
    80206eca:	6b42                	ld	s6,16(sp)
    80206ecc:	6ba2                	ld	s7,8(sp)
    80206ece:	6c02                	ld	s8,0(sp)
    80206ed0:	6161                	addi	sp,sp,80
    80206ed2:	8082                	ret
            eunlock(entry);
    80206ed4:	854e                	mv	a0,s3
    80206ed6:	00000097          	auipc	ra,0x0
    80206eda:	972080e7          	jalr	-1678(ra) # 80206848 <eunlock>
            return entry;
    80206ede:	bff1                	j	80206eba <lookup_path+0x7c>
            eunlock(entry);
    80206ee0:	854e                	mv	a0,s3
    80206ee2:	00000097          	auipc	ra,0x0
    80206ee6:	966080e7          	jalr	-1690(ra) # 80206848 <eunlock>
            eput(entry);
    80206eea:	854e                	mv	a0,s3
    80206eec:	00000097          	auipc	ra,0x0
    80206ef0:	9aa080e7          	jalr	-1622(ra) # 80206896 <eput>
            return NULL;
    80206ef4:	89ca                	mv	s3,s2
    80206ef6:	b7d1                	j	80206eba <lookup_path+0x7c>
    int len = path - s;
    80206ef8:	412487bb          	subw	a5,s1,s2
    if (len > FAT32_MAX_FILENAME) {
    80206efc:	863e                	mv	a2,a5
    80206efe:	00fbd363          	bge	s7,a5,80206f04 <lookup_path+0xc6>
    80206f02:	8662                	mv	a2,s8
    80206f04:	0006079b          	sext.w	a5,a2
    name[len] = 0;
    80206f08:	97d6                	add	a5,a5,s5
    80206f0a:	00078023          	sb	zero,0(a5)
    memmove(name, s, len);
    80206f0e:	2601                	sext.w	a2,a2
    80206f10:	85ca                	mv	a1,s2
    80206f12:	8556                	mv	a0,s5
    80206f14:	ffffa097          	auipc	ra,0xffffa
    80206f18:	8dc080e7          	jalr	-1828(ra) # 802007f0 <memmove>
    while (*path == '/') {
    80206f1c:	0004c783          	lbu	a5,0(s1)
    80206f20:	01479763          	bne	a5,s4,80206f2e <lookup_path+0xf0>
        path++;
    80206f24:	0485                	addi	s1,s1,1
    while (*path == '/') {
    80206f26:	0004c783          	lbu	a5,0(s1)
    80206f2a:	ff478de3          	beq	a5,s4,80206f24 <lookup_path+0xe6>
        elock(entry);
    80206f2e:	854e                	mv	a0,s3
    80206f30:	00000097          	auipc	ra,0x0
    80206f34:	8e2080e7          	jalr	-1822(ra) # 80206812 <elock>
        if (!(entry->attribute & ATTR_DIRECTORY)) {
    80206f38:	1009c783          	lbu	a5,256(s3)
    80206f3c:	8bc1                	andi	a5,a5,16
    80206f3e:	d3bd                	beqz	a5,80206ea4 <lookup_path+0x66>
        if (parent && *path == '\0') {
    80206f40:	000b0563          	beqz	s6,80206f4a <lookup_path+0x10c>
    80206f44:	0004c783          	lbu	a5,0(s1)
    80206f48:	d7d1                	beqz	a5,80206ed4 <lookup_path+0x96>
        if ((next = dirlookup(entry, name, 0)) == 0) {
    80206f4a:	4601                	li	a2,0
    80206f4c:	85d6                	mv	a1,s5
    80206f4e:	854e                	mv	a0,s3
    80206f50:	00000097          	auipc	ra,0x0
    80206f54:	c52080e7          	jalr	-942(ra) # 80206ba2 <dirlookup>
    80206f58:	892a                	mv	s2,a0
    80206f5a:	d159                	beqz	a0,80206ee0 <lookup_path+0xa2>
        eunlock(entry);
    80206f5c:	854e                	mv	a0,s3
    80206f5e:	00000097          	auipc	ra,0x0
    80206f62:	8ea080e7          	jalr	-1814(ra) # 80206848 <eunlock>
        eput(entry);
    80206f66:	854e                	mv	a0,s3
    80206f68:	00000097          	auipc	ra,0x0
    80206f6c:	92e080e7          	jalr	-1746(ra) # 80206896 <eput>
        entry = next;
    80206f70:	89ca                	mv	s3,s2
        eput(entry);
    80206f72:	8926                	mv	s2,s1
    while (*path == '/') {
    80206f74:	00094783          	lbu	a5,0(s2)
    80206f78:	03479363          	bne	a5,s4,80206f9e <lookup_path+0x160>
        path++;
    80206f7c:	0905                	addi	s2,s2,1
    while (*path == '/') {
    80206f7e:	00094783          	lbu	a5,0(s2)
    80206f82:	ff478de3          	beq	a5,s4,80206f7c <lookup_path+0x13e>
    if (*path == 0) { return NULL; }
    80206f86:	cf89                	beqz	a5,80206fa0 <lookup_path+0x162>
        path++;
    80206f88:	84ca                	mv	s1,s2
    while (*path != '/' && *path != 0) {
    80206f8a:	f74787e3          	beq	a5,s4,80206ef8 <lookup_path+0xba>
        eput(entry);
    80206f8e:	84ca                	mv	s1,s2
    while (*path != '/' && *path != 0) {
    80206f90:	d7a5                	beqz	a5,80206ef8 <lookup_path+0xba>
        path++;
    80206f92:	0485                	addi	s1,s1,1
    while (*path != '/' && *path != 0) {
    80206f94:	0004c783          	lbu	a5,0(s1)
    80206f98:	ff479ce3          	bne	a5,s4,80206f90 <lookup_path+0x152>
    80206f9c:	bfb1                	j	80206ef8 <lookup_path+0xba>
    if (*path == 0) { return NULL; }
    80206f9e:	fbe5                	bnez	a5,80206f8e <lookup_path+0x150>
    if (parent) {
    80206fa0:	f00b0de3          	beqz	s6,80206eba <lookup_path+0x7c>
        eput(entry);
    80206fa4:	854e                	mv	a0,s3
    80206fa6:	00000097          	auipc	ra,0x0
    80206faa:	8f0080e7          	jalr	-1808(ra) # 80206896 <eput>
        return NULL;
    80206fae:	4981                	li	s3,0
    80206fb0:	b729                	j	80206eba <lookup_path+0x7c>

0000000080206fb2 <ename>:

struct dirent *ename(char *path)
{
    80206fb2:	716d                	addi	sp,sp,-272
    80206fb4:	e606                	sd	ra,264(sp)
    80206fb6:	e222                	sd	s0,256(sp)
    80206fb8:	0a00                	addi	s0,sp,272
    char name[FAT32_MAX_FILENAME + 1];
    return lookup_path(path, 0, name);
    80206fba:	ef040613          	addi	a2,s0,-272
    80206fbe:	4581                	li	a1,0
    80206fc0:	00000097          	auipc	ra,0x0
    80206fc4:	e7e080e7          	jalr	-386(ra) # 80206e3e <lookup_path>
}
    80206fc8:	60b2                	ld	ra,264(sp)
    80206fca:	6412                	ld	s0,256(sp)
    80206fcc:	6151                	addi	sp,sp,272
    80206fce:	8082                	ret

0000000080206fd0 <enameparent>:

struct dirent *enameparent(char *path, char *name)
{
    80206fd0:	1141                	addi	sp,sp,-16
    80206fd2:	e406                	sd	ra,8(sp)
    80206fd4:	e022                	sd	s0,0(sp)
    80206fd6:	0800                	addi	s0,sp,16
    80206fd8:	862e                	mv	a2,a1
    return lookup_path(path, 1, name);
    80206fda:	4585                	li	a1,1
    80206fdc:	00000097          	auipc	ra,0x0
    80206fe0:	e62080e7          	jalr	-414(ra) # 80206e3e <lookup_path>
}
    80206fe4:	60a2                	ld	ra,8(sp)
    80206fe6:	6402                	ld	s0,0(sp)
    80206fe8:	0141                	addi	sp,sp,16
    80206fea:	8082                	ret

0000000080206fec <plicinit>:

//
// the riscv Platform Level Interrupt Controller (PLIC).
//

void plicinit(void) {
    80206fec:	1141                	addi	sp,sp,-16
    80206fee:	e406                	sd	ra,8(sp)
    80206ff0:	e022                	sd	s0,0(sp)
    80206ff2:	0800                	addi	s0,sp,16
    // set desired IRQ priorities non-zero (otherwise disabled).
    writed(1,PLIC_V + VIRTIO0_IRQ * 4);
    80206ff4:	00fc37b7          	lui	a5,0xfc3
    80206ff8:	07ba                	slli	a5,a5,0xe
    80206ffa:	4705                	li	a4,1
    80206ffc:	c3d8                	sw	a4,4(a5)
    writed(1, PLIC_V + DISK_IRQ * sizeof(uint32));
    80206ffe:	c3d8                	sw	a4,4(a5)
    writed(1, PLIC_V + UART_IRQ * sizeof(uint32));
    80207000:	d798                	sw	a4,40(a5)
#ifdef	DEBUG
     printf("plicinit\n");
    80207002:	00003517          	auipc	a0,0x3
    80207006:	12650513          	addi	a0,a0,294 # 8020a128 <sysnames+0x4f0>
    8020700a:	ffff9097          	auipc	ra,0xffff9
    8020700e:	184080e7          	jalr	388(ra) # 8020018e <printf>
#endif 
}
    80207012:	60a2                	ld	ra,8(sp)
    80207014:	6402                	ld	s0,0(sp)
    80207016:	0141                	addi	sp,sp,16
    80207018:	8082                	ret

000000008020701a <plicinithart>:

void plicinithart(void) {
    8020701a:	1141                	addi	sp,sp,-16
    8020701c:	e406                	sd	ra,8(sp)
    8020701e:	e022                	sd	s0,0(sp)
    80207020:	0800                	addi	s0,sp,16
    int hart = cpuid();
    80207022:	ffffb097          	auipc	ra,0xffffb
    80207026:	ace080e7          	jalr	-1330(ra) # 80201af0 <cpuid>
    // set uart's enable bit for this hart's S-mode.
    *(uint32 *)PLIC_SENABLE(hart) = (1 << VIRTIO0_IRQ)|(1 << UART_IRQ) | (1 << DISK_IRQ);
    8020702a:	0085171b          	slliw	a4,a0,0x8
    8020702e:	01f867b7          	lui	a5,0x1f86
    80207032:	0785                	addi	a5,a5,1
    80207034:	07b6                	slli	a5,a5,0xd
    80207036:	97ba                	add	a5,a5,a4
    80207038:	40200713          	li	a4,1026
    8020703c:	08e7a023          	sw	a4,128(a5) # 1f86080 <_entry-0x7e279f80>
    // set this hart's S-mode priority threshold to 0.
    *(uint32 *)PLIC_SPRIORITY(hart) = 0;
    80207040:	00d5179b          	slliw	a5,a0,0xd
    80207044:	03f0c537          	lui	a0,0x3f0c
    80207048:	20150513          	addi	a0,a0,513 # 3f0c201 <_entry-0x7c2f3dff>
    8020704c:	0532                	slli	a0,a0,0xc
    8020704e:	953e                	add	a0,a0,a5
    80207050:	00052023          	sw	zero,0(a0)
#ifdef DEBUG
     printf("plichartinit\n");
    80207054:	00003517          	auipc	a0,0x3
    80207058:	0e450513          	addi	a0,a0,228 # 8020a138 <sysnames+0x500>
    8020705c:	ffff9097          	auipc	ra,0xffff9
    80207060:	132080e7          	jalr	306(ra) # 8020018e <printf>
#endif 
}
    80207064:	60a2                	ld	ra,8(sp)
    80207066:	6402                	ld	s0,0(sp)
    80207068:	0141                	addi	sp,sp,16
    8020706a:	8082                	ret

000000008020706c <plic_claim>:

// ask the PLIC what interrupt we should serve.
int plic_claim(void) {
    8020706c:	1141                	addi	sp,sp,-16
    8020706e:	e406                	sd	ra,8(sp)
    80207070:	e022                	sd	s0,0(sp)
    80207072:	0800                	addi	s0,sp,16
    int hart = cpuid();
    80207074:	ffffb097          	auipc	ra,0xffffb
    80207078:	a7c080e7          	jalr	-1412(ra) # 80201af0 <cpuid>
    int irq = *(uint32 *)PLIC_SCLAIM(hart);
    8020707c:	00d5179b          	slliw	a5,a0,0xd
    80207080:	03f0c537          	lui	a0,0x3f0c
    80207084:	20150513          	addi	a0,a0,513 # 3f0c201 <_entry-0x7c2f3dff>
    80207088:	0532                	slli	a0,a0,0xc
    8020708a:	953e                	add	a0,a0,a5
    return irq;
}
    8020708c:	4148                	lw	a0,4(a0)
    8020708e:	60a2                	ld	ra,8(sp)
    80207090:	6402                	ld	s0,0(sp)
    80207092:	0141                	addi	sp,sp,16
    80207094:	8082                	ret

0000000080207096 <plic_complete>:

// tell the PLIC we've served this IRQ.
void plic_complete(int irq) {
    80207096:	1101                	addi	sp,sp,-32
    80207098:	ec06                	sd	ra,24(sp)
    8020709a:	e822                	sd	s0,16(sp)
    8020709c:	e426                	sd	s1,8(sp)
    8020709e:	1000                	addi	s0,sp,32
    802070a0:	84aa                	mv	s1,a0
    int hart = cpuid();
    802070a2:	ffffb097          	auipc	ra,0xffffb
    802070a6:	a4e080e7          	jalr	-1458(ra) # 80201af0 <cpuid>
    *(uint32 *)PLIC_SCLAIM(hart) = irq;
    802070aa:	00d5151b          	slliw	a0,a0,0xd
    802070ae:	03f0c7b7          	lui	a5,0x3f0c
    802070b2:	20178793          	addi	a5,a5,513 # 3f0c201 <_entry-0x7c2f3dff>
    802070b6:	07b2                	slli	a5,a5,0xc
    802070b8:	97aa                	add	a5,a5,a0
    802070ba:	c3c4                	sw	s1,4(a5)
}
    802070bc:	60e2                	ld	ra,24(sp)
    802070be:	6442                	ld	s0,16(sp)
    802070c0:	64a2                	ld	s1,8(sp)
    802070c2:	6105                	addi	sp,sp,32
    802070c4:	8082                	ret

00000000802070c6 <consolewrite>:
//
// user write()s to the console go here.
//
int
consolewrite(int user_src, uint64 src, int n)
{
    802070c6:	715d                	addi	sp,sp,-80
    802070c8:	e486                	sd	ra,72(sp)
    802070ca:	e0a2                	sd	s0,64(sp)
    802070cc:	fc26                	sd	s1,56(sp)
    802070ce:	f84a                	sd	s2,48(sp)
    802070d0:	f44e                	sd	s3,40(sp)
    802070d2:	f052                	sd	s4,32(sp)
    802070d4:	ec56                	sd	s5,24(sp)
    802070d6:	0880                	addi	s0,sp,80
    802070d8:	8a2a                	mv	s4,a0
    802070da:	84ae                	mv	s1,a1
    802070dc:	89b2                	mv	s3,a2
  int i;

  acquire(&cons.lock);
    802070de:	000b6517          	auipc	a0,0xb6
    802070e2:	71a50513          	addi	a0,a0,1818 # 802bd7f8 <cons>
    802070e6:	ffff9097          	auipc	ra,0xffff9
    802070ea:	60e080e7          	jalr	1550(ra) # 802006f4 <acquire>
  for(i = 0; i < n; i++){
    802070ee:	05305d63          	blez	s3,80207148 <consolewrite+0x82>
    802070f2:	4901                	li	s2,0
    char c;
    if(either_copyin(&c, user_src, src+i, 1) == -1)
    802070f4:	5afd                	li	s5,-1
    802070f6:	4685                	li	a3,1
    802070f8:	8626                	mv	a2,s1
    802070fa:	85d2                	mv	a1,s4
    802070fc:	fbf40513          	addi	a0,s0,-65
    80207100:	ffffb097          	auipc	ra,0xffffb
    80207104:	52a080e7          	jalr	1322(ra) # 8020262a <either_copyin>
    80207108:	01550e63          	beq	a0,s5,80207124 <consolewrite+0x5e>
	SBI_CALL_1(SBI_CONSOLE_PUTCHAR, ch);
    8020710c:	fbf44503          	lbu	a0,-65(s0)
    80207110:	4581                	li	a1,0
    80207112:	4601                	li	a2,0
    80207114:	4681                	li	a3,0
    80207116:	4885                	li	a7,1
    80207118:	00000073          	ecall
  for(i = 0; i < n; i++){
    8020711c:	2905                	addiw	s2,s2,1
    8020711e:	0485                	addi	s1,s1,1
    80207120:	fd299be3          	bne	s3,s2,802070f6 <consolewrite+0x30>
      break;
    sbi_console_putchar(c);
  }
  release(&cons.lock);
    80207124:	000b6517          	auipc	a0,0xb6
    80207128:	6d450513          	addi	a0,a0,1748 # 802bd7f8 <cons>
    8020712c:	ffff9097          	auipc	ra,0xffff9
    80207130:	61c080e7          	jalr	1564(ra) # 80200748 <release>

  return i;
}
    80207134:	854a                	mv	a0,s2
    80207136:	60a6                	ld	ra,72(sp)
    80207138:	6406                	ld	s0,64(sp)
    8020713a:	74e2                	ld	s1,56(sp)
    8020713c:	7942                	ld	s2,48(sp)
    8020713e:	79a2                	ld	s3,40(sp)
    80207140:	7a02                	ld	s4,32(sp)
    80207142:	6ae2                	ld	s5,24(sp)
    80207144:	6161                	addi	sp,sp,80
    80207146:	8082                	ret
  for(i = 0; i < n; i++){
    80207148:	4901                	li	s2,0
    8020714a:	bfe9                	j	80207124 <consolewrite+0x5e>

000000008020714c <consoleread>:
// user_dist indicates whether dst is a user
// or kernel address.
//
int
consoleread(int user_dst, uint64 dst, int n)
{
    8020714c:	7119                	addi	sp,sp,-128
    8020714e:	fc86                	sd	ra,120(sp)
    80207150:	f8a2                	sd	s0,112(sp)
    80207152:	f4a6                	sd	s1,104(sp)
    80207154:	f0ca                	sd	s2,96(sp)
    80207156:	ecce                	sd	s3,88(sp)
    80207158:	e8d2                	sd	s4,80(sp)
    8020715a:	e4d6                	sd	s5,72(sp)
    8020715c:	e0da                	sd	s6,64(sp)
    8020715e:	fc5e                	sd	s7,56(sp)
    80207160:	f862                	sd	s8,48(sp)
    80207162:	f466                	sd	s9,40(sp)
    80207164:	f06a                	sd	s10,32(sp)
    80207166:	ec6e                	sd	s11,24(sp)
    80207168:	0100                	addi	s0,sp,128
    8020716a:	8b2a                	mv	s6,a0
    8020716c:	8aae                	mv	s5,a1
    8020716e:	8a32                	mv	s4,a2
  uint target;
  int c;
  char cbuf;

  target = n;
    80207170:	00060b9b          	sext.w	s7,a2
  acquire(&cons.lock);
    80207174:	000b6517          	auipc	a0,0xb6
    80207178:	68450513          	addi	a0,a0,1668 # 802bd7f8 <cons>
    8020717c:	ffff9097          	auipc	ra,0xffff9
    80207180:	578080e7          	jalr	1400(ra) # 802006f4 <acquire>
  while(n > 0){
    // wait until interrupt handler has put some
    // input into cons.buffer.
    while(cons.r == cons.w){
    80207184:	000b6497          	auipc	s1,0xb6
    80207188:	67448493          	addi	s1,s1,1652 # 802bd7f8 <cons>
      if(myproc()->killed){
        release(&cons.lock);
        return -1;
      }
      sleep(&cons.r, &cons.lock);
    8020718c:	89a6                	mv	s3,s1
    8020718e:	000b6917          	auipc	s2,0xb6
    80207192:	70290913          	addi	s2,s2,1794 # 802bd890 <cons+0x98>
    }

    c = cons.buf[cons.r++ % INPUT_BUF];

    if(c == C('D')){  // end-of-file
    80207196:	4c91                	li	s9,4
      break;
    }

    // copy the input byte to the user-space buffer.
    cbuf = c;
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    80207198:	5d7d                	li	s10,-1
      break;

    dst++;
    --n;

    if(c == '\n'){
    8020719a:	4da9                	li	s11,10
  while(n > 0){
    8020719c:	07405863          	blez	s4,8020720c <consoleread+0xc0>
    while(cons.r == cons.w){
    802071a0:	0984a783          	lw	a5,152(s1)
    802071a4:	09c4a703          	lw	a4,156(s1)
    802071a8:	02f71463          	bne	a4,a5,802071d0 <consoleread+0x84>
      if(myproc()->killed){
    802071ac:	ffffb097          	auipc	ra,0xffffb
    802071b0:	970080e7          	jalr	-1680(ra) # 80201b1c <myproc>
    802071b4:	591c                	lw	a5,48(a0)
    802071b6:	e7b5                	bnez	a5,80207222 <consoleread+0xd6>
      sleep(&cons.r, &cons.lock);
    802071b8:	85ce                	mv	a1,s3
    802071ba:	854a                	mv	a0,s2
    802071bc:	ffffb097          	auipc	ra,0xffffb
    802071c0:	1da080e7          	jalr	474(ra) # 80202396 <sleep>
    while(cons.r == cons.w){
    802071c4:	0984a783          	lw	a5,152(s1)
    802071c8:	09c4a703          	lw	a4,156(s1)
    802071cc:	fef700e3          	beq	a4,a5,802071ac <consoleread+0x60>
    c = cons.buf[cons.r++ % INPUT_BUF];
    802071d0:	0017871b          	addiw	a4,a5,1
    802071d4:	08e4ac23          	sw	a4,152(s1)
    802071d8:	07f7f713          	andi	a4,a5,127
    802071dc:	9726                	add	a4,a4,s1
    802071de:	01874703          	lbu	a4,24(a4)
    802071e2:	00070c1b          	sext.w	s8,a4
    if(c == C('D')){  // end-of-file
    802071e6:	079c0663          	beq	s8,s9,80207252 <consoleread+0x106>
    cbuf = c;
    802071ea:	f8e407a3          	sb	a4,-113(s0)
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    802071ee:	4685                	li	a3,1
    802071f0:	f8f40613          	addi	a2,s0,-113
    802071f4:	85d6                	mv	a1,s5
    802071f6:	855a                	mv	a0,s6
    802071f8:	ffffb097          	auipc	ra,0xffffb
    802071fc:	3fc080e7          	jalr	1020(ra) # 802025f4 <either_copyout>
    80207200:	01a50663          	beq	a0,s10,8020720c <consoleread+0xc0>
    dst++;
    80207204:	0a85                	addi	s5,s5,1
    --n;
    80207206:	3a7d                	addiw	s4,s4,-1
    if(c == '\n'){
    80207208:	f9bc1ae3          	bne	s8,s11,8020719c <consoleread+0x50>
      // a whole line has arrived, return to
      // the user-level read().
      break;
    }
  }
  release(&cons.lock);
    8020720c:	000b6517          	auipc	a0,0xb6
    80207210:	5ec50513          	addi	a0,a0,1516 # 802bd7f8 <cons>
    80207214:	ffff9097          	auipc	ra,0xffff9
    80207218:	534080e7          	jalr	1332(ra) # 80200748 <release>

  return target - n;
    8020721c:	414b853b          	subw	a0,s7,s4
    80207220:	a811                	j	80207234 <consoleread+0xe8>
        release(&cons.lock);
    80207222:	000b6517          	auipc	a0,0xb6
    80207226:	5d650513          	addi	a0,a0,1494 # 802bd7f8 <cons>
    8020722a:	ffff9097          	auipc	ra,0xffff9
    8020722e:	51e080e7          	jalr	1310(ra) # 80200748 <release>
        return -1;
    80207232:	557d                	li	a0,-1
}
    80207234:	70e6                	ld	ra,120(sp)
    80207236:	7446                	ld	s0,112(sp)
    80207238:	74a6                	ld	s1,104(sp)
    8020723a:	7906                	ld	s2,96(sp)
    8020723c:	69e6                	ld	s3,88(sp)
    8020723e:	6a46                	ld	s4,80(sp)
    80207240:	6aa6                	ld	s5,72(sp)
    80207242:	6b06                	ld	s6,64(sp)
    80207244:	7be2                	ld	s7,56(sp)
    80207246:	7c42                	ld	s8,48(sp)
    80207248:	7ca2                	ld	s9,40(sp)
    8020724a:	7d02                	ld	s10,32(sp)
    8020724c:	6de2                	ld	s11,24(sp)
    8020724e:	6109                	addi	sp,sp,128
    80207250:	8082                	ret
      if(n < target){
    80207252:	000a071b          	sext.w	a4,s4
    80207256:	fb777be3          	bgeu	a4,s7,8020720c <consoleread+0xc0>
        cons.r--;
    8020725a:	000b6717          	auipc	a4,0xb6
    8020725e:	62f72b23          	sw	a5,1590(a4) # 802bd890 <cons+0x98>
    80207262:	b76d                	j	8020720c <consoleread+0xc0>

0000000080207264 <consputc>:
void consputc(int c) {
    80207264:	1141                	addi	sp,sp,-16
    80207266:	e422                	sd	s0,8(sp)
    80207268:	0800                	addi	s0,sp,16
  if(c == BACKSPACE){
    8020726a:	10000793          	li	a5,256
    8020726e:	00f50b63          	beq	a0,a5,80207284 <consputc+0x20>
    80207272:	4581                	li	a1,0
    80207274:	4601                	li	a2,0
    80207276:	4681                	li	a3,0
    80207278:	4885                	li	a7,1
    8020727a:	00000073          	ecall
}
    8020727e:	6422                	ld	s0,8(sp)
    80207280:	0141                	addi	sp,sp,16
    80207282:	8082                	ret
    80207284:	4521                	li	a0,8
    80207286:	4581                	li	a1,0
    80207288:	4601                	li	a2,0
    8020728a:	4681                	li	a3,0
    8020728c:	4885                	li	a7,1
    8020728e:	00000073          	ecall
    80207292:	02000513          	li	a0,32
    80207296:	00000073          	ecall
    8020729a:	4521                	li	a0,8
    8020729c:	00000073          	ecall
}
    802072a0:	bff9                	j	8020727e <consputc+0x1a>

00000000802072a2 <consoleintr>:
// do erase/kill processing, append to cons.buf,
// wake up consoleread() if a whole line has arrived.
//
void
consoleintr(int c)
{
    802072a2:	1101                	addi	sp,sp,-32
    802072a4:	ec06                	sd	ra,24(sp)
    802072a6:	e822                	sd	s0,16(sp)
    802072a8:	e426                	sd	s1,8(sp)
    802072aa:	e04a                	sd	s2,0(sp)
    802072ac:	1000                	addi	s0,sp,32
    802072ae:	84aa                	mv	s1,a0
  acquire(&cons.lock);
    802072b0:	000b6517          	auipc	a0,0xb6
    802072b4:	54850513          	addi	a0,a0,1352 # 802bd7f8 <cons>
    802072b8:	ffff9097          	auipc	ra,0xffff9
    802072bc:	43c080e7          	jalr	1084(ra) # 802006f4 <acquire>

  switch(c){
    802072c0:	47d5                	li	a5,21
    802072c2:	0af48663          	beq	s1,a5,8020736e <consoleintr+0xcc>
    802072c6:	0297ca63          	blt	a5,s1,802072fa <consoleintr+0x58>
    802072ca:	47a1                	li	a5,8
    802072cc:	0ef48763          	beq	s1,a5,802073ba <consoleintr+0x118>
    802072d0:	47c1                	li	a5,16
    802072d2:	10f49a63          	bne	s1,a5,802073e6 <consoleintr+0x144>
  case C('P'):  // Print process list.
    procdump();
    802072d6:	ffffb097          	auipc	ra,0xffffb
    802072da:	388080e7          	jalr	904(ra) # 8020265e <procdump>
      }
    }
    break;
  }
  
  release(&cons.lock);
    802072de:	000b6517          	auipc	a0,0xb6
    802072e2:	51a50513          	addi	a0,a0,1306 # 802bd7f8 <cons>
    802072e6:	ffff9097          	auipc	ra,0xffff9
    802072ea:	462080e7          	jalr	1122(ra) # 80200748 <release>
}
    802072ee:	60e2                	ld	ra,24(sp)
    802072f0:	6442                	ld	s0,16(sp)
    802072f2:	64a2                	ld	s1,8(sp)
    802072f4:	6902                	ld	s2,0(sp)
    802072f6:	6105                	addi	sp,sp,32
    802072f8:	8082                	ret
  switch(c){
    802072fa:	07f00793          	li	a5,127
    802072fe:	0af48e63          	beq	s1,a5,802073ba <consoleintr+0x118>
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    80207302:	000b6717          	auipc	a4,0xb6
    80207306:	4f670713          	addi	a4,a4,1270 # 802bd7f8 <cons>
    8020730a:	0a072783          	lw	a5,160(a4)
    8020730e:	09872703          	lw	a4,152(a4)
    80207312:	9f99                	subw	a5,a5,a4
    80207314:	07f00713          	li	a4,127
    80207318:	fcf763e3          	bltu	a4,a5,802072de <consoleintr+0x3c>
      c = (c == '\r') ? '\n' : c;
    8020731c:	47b5                	li	a5,13
    8020731e:	0cf48763          	beq	s1,a5,802073ec <consoleintr+0x14a>
      consputc(c);
    80207322:	8526                	mv	a0,s1
    80207324:	00000097          	auipc	ra,0x0
    80207328:	f40080e7          	jalr	-192(ra) # 80207264 <consputc>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    8020732c:	000b6797          	auipc	a5,0xb6
    80207330:	4cc78793          	addi	a5,a5,1228 # 802bd7f8 <cons>
    80207334:	0a07a703          	lw	a4,160(a5)
    80207338:	0017069b          	addiw	a3,a4,1
    8020733c:	0006861b          	sext.w	a2,a3
    80207340:	0ad7a023          	sw	a3,160(a5)
    80207344:	07f77713          	andi	a4,a4,127
    80207348:	97ba                	add	a5,a5,a4
    8020734a:	00978c23          	sb	s1,24(a5)
      if(c == '\n' || c == C('D') || cons.e == cons.r+INPUT_BUF){
    8020734e:	47a9                	li	a5,10
    80207350:	0cf48563          	beq	s1,a5,8020741a <consoleintr+0x178>
    80207354:	4791                	li	a5,4
    80207356:	0cf48263          	beq	s1,a5,8020741a <consoleintr+0x178>
    8020735a:	000b6797          	auipc	a5,0xb6
    8020735e:	5367a783          	lw	a5,1334(a5) # 802bd890 <cons+0x98>
    80207362:	0807879b          	addiw	a5,a5,128
    80207366:	f6f61ce3          	bne	a2,a5,802072de <consoleintr+0x3c>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    8020736a:	863e                	mv	a2,a5
    8020736c:	a07d                	j	8020741a <consoleintr+0x178>
    while(cons.e != cons.w &&
    8020736e:	000b6717          	auipc	a4,0xb6
    80207372:	48a70713          	addi	a4,a4,1162 # 802bd7f8 <cons>
    80207376:	0a072783          	lw	a5,160(a4)
    8020737a:	09c72703          	lw	a4,156(a4)
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    8020737e:	000b6497          	auipc	s1,0xb6
    80207382:	47a48493          	addi	s1,s1,1146 # 802bd7f8 <cons>
    while(cons.e != cons.w &&
    80207386:	4929                	li	s2,10
    80207388:	f4f70be3          	beq	a4,a5,802072de <consoleintr+0x3c>
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    8020738c:	37fd                	addiw	a5,a5,-1
    8020738e:	07f7f713          	andi	a4,a5,127
    80207392:	9726                	add	a4,a4,s1
    while(cons.e != cons.w &&
    80207394:	01874703          	lbu	a4,24(a4)
    80207398:	f52703e3          	beq	a4,s2,802072de <consoleintr+0x3c>
      cons.e--;
    8020739c:	0af4a023          	sw	a5,160(s1)
      consputc(BACKSPACE);
    802073a0:	10000513          	li	a0,256
    802073a4:	00000097          	auipc	ra,0x0
    802073a8:	ec0080e7          	jalr	-320(ra) # 80207264 <consputc>
    while(cons.e != cons.w &&
    802073ac:	0a04a783          	lw	a5,160(s1)
    802073b0:	09c4a703          	lw	a4,156(s1)
    802073b4:	fcf71ce3          	bne	a4,a5,8020738c <consoleintr+0xea>
    802073b8:	b71d                	j	802072de <consoleintr+0x3c>
    if(cons.e != cons.w){
    802073ba:	000b6717          	auipc	a4,0xb6
    802073be:	43e70713          	addi	a4,a4,1086 # 802bd7f8 <cons>
    802073c2:	0a072783          	lw	a5,160(a4)
    802073c6:	09c72703          	lw	a4,156(a4)
    802073ca:	f0f70ae3          	beq	a4,a5,802072de <consoleintr+0x3c>
      cons.e--;
    802073ce:	37fd                	addiw	a5,a5,-1
    802073d0:	000b6717          	auipc	a4,0xb6
    802073d4:	4cf72423          	sw	a5,1224(a4) # 802bd898 <cons+0xa0>
      consputc(BACKSPACE);
    802073d8:	10000513          	li	a0,256
    802073dc:	00000097          	auipc	ra,0x0
    802073e0:	e88080e7          	jalr	-376(ra) # 80207264 <consputc>
    802073e4:	bded                	j	802072de <consoleintr+0x3c>
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    802073e6:	ee048ce3          	beqz	s1,802072de <consoleintr+0x3c>
    802073ea:	bf21                	j	80207302 <consoleintr+0x60>
      consputc(c);
    802073ec:	4529                	li	a0,10
    802073ee:	00000097          	auipc	ra,0x0
    802073f2:	e76080e7          	jalr	-394(ra) # 80207264 <consputc>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    802073f6:	000b6797          	auipc	a5,0xb6
    802073fa:	40278793          	addi	a5,a5,1026 # 802bd7f8 <cons>
    802073fe:	0a07a703          	lw	a4,160(a5)
    80207402:	0017069b          	addiw	a3,a4,1
    80207406:	0006861b          	sext.w	a2,a3
    8020740a:	0ad7a023          	sw	a3,160(a5)
    8020740e:	07f77713          	andi	a4,a4,127
    80207412:	97ba                	add	a5,a5,a4
    80207414:	4729                	li	a4,10
    80207416:	00e78c23          	sb	a4,24(a5)
        cons.w = cons.e;
    8020741a:	000b6797          	auipc	a5,0xb6
    8020741e:	46c7ad23          	sw	a2,1146(a5) # 802bd894 <cons+0x9c>
        wakeup(&cons.r);
    80207422:	000b6517          	auipc	a0,0xb6
    80207426:	46e50513          	addi	a0,a0,1134 # 802bd890 <cons+0x98>
    8020742a:	ffffb097          	auipc	ra,0xffffb
    8020742e:	0ee080e7          	jalr	238(ra) # 80202518 <wakeup>
    80207432:	b575                	j	802072de <consoleintr+0x3c>

0000000080207434 <consoleinit>:

void
consoleinit(void)
{
    80207434:	1101                	addi	sp,sp,-32
    80207436:	ec06                	sd	ra,24(sp)
    80207438:	e822                	sd	s0,16(sp)
    8020743a:	e426                	sd	s1,8(sp)
    8020743c:	1000                	addi	s0,sp,32
  initlock(&cons.lock, "cons");
    8020743e:	000b6497          	auipc	s1,0xb6
    80207442:	3ba48493          	addi	s1,s1,954 # 802bd7f8 <cons>
    80207446:	00003597          	auipc	a1,0x3
    8020744a:	d0258593          	addi	a1,a1,-766 # 8020a148 <sysnames+0x510>
    8020744e:	8526                	mv	a0,s1
    80207450:	ffff9097          	auipc	ra,0xffff9
    80207454:	260080e7          	jalr	608(ra) # 802006b0 <initlock>

  cons.e = cons.w = cons.r = 0;
    80207458:	0804ac23          	sw	zero,152(s1)
    8020745c:	0804ae23          	sw	zero,156(s1)
    80207460:	0a04a023          	sw	zero,160(s1)
  
  // connect read and write system calls
  // to consoleread and consolewrite.
  devsw[CONSOLE].read = consoleread;
    80207464:	000ad797          	auipc	a5,0xad
    80207468:	0dc78793          	addi	a5,a5,220 # 802b4540 <devsw>
    8020746c:	00000717          	auipc	a4,0x0
    80207470:	ce070713          	addi	a4,a4,-800 # 8020714c <consoleread>
    80207474:	eb98                	sd	a4,16(a5)
  devsw[CONSOLE].write = consolewrite;
    80207476:	00000717          	auipc	a4,0x0
    8020747a:	c5070713          	addi	a4,a4,-944 # 802070c6 <consolewrite>
    8020747e:	ef98                	sd	a4,24(a5)
}
    80207480:	60e2                	ld	ra,24(sp)
    80207482:	6442                	ld	s0,16(sp)
    80207484:	64a2                	ld	s1,8(sp)
    80207486:	6105                	addi	sp,sp,32
    80207488:	8082                	ret
	...

0000000080208000 <_trampoline>:
    80208000:	14051573          	csrrw	a0,sscratch,a0
    80208004:	02153423          	sd	ra,40(a0)
    80208008:	02253823          	sd	sp,48(a0)
    8020800c:	02353c23          	sd	gp,56(a0)
    80208010:	04453023          	sd	tp,64(a0)
    80208014:	04553423          	sd	t0,72(a0)
    80208018:	04653823          	sd	t1,80(a0)
    8020801c:	04753c23          	sd	t2,88(a0)
    80208020:	f120                	sd	s0,96(a0)
    80208022:	f524                	sd	s1,104(a0)
    80208024:	fd2c                	sd	a1,120(a0)
    80208026:	e150                	sd	a2,128(a0)
    80208028:	e554                	sd	a3,136(a0)
    8020802a:	e958                	sd	a4,144(a0)
    8020802c:	ed5c                	sd	a5,152(a0)
    8020802e:	0b053023          	sd	a6,160(a0)
    80208032:	0b153423          	sd	a7,168(a0)
    80208036:	0b253823          	sd	s2,176(a0)
    8020803a:	0b353c23          	sd	s3,184(a0)
    8020803e:	0d453023          	sd	s4,192(a0)
    80208042:	0d553423          	sd	s5,200(a0)
    80208046:	0d653823          	sd	s6,208(a0)
    8020804a:	0d753c23          	sd	s7,216(a0)
    8020804e:	0f853023          	sd	s8,224(a0)
    80208052:	0f953423          	sd	s9,232(a0)
    80208056:	0fa53823          	sd	s10,240(a0)
    8020805a:	0fb53c23          	sd	s11,248(a0)
    8020805e:	11c53023          	sd	t3,256(a0)
    80208062:	11d53423          	sd	t4,264(a0)
    80208066:	11e53823          	sd	t5,272(a0)
    8020806a:	11f53c23          	sd	t6,280(a0)
    8020806e:	140022f3          	csrr	t0,sscratch
    80208072:	06553823          	sd	t0,112(a0)
    80208076:	00853103          	ld	sp,8(a0)
    8020807a:	02053203          	ld	tp,32(a0)
    8020807e:	01053283          	ld	t0,16(a0)
    80208082:	00053303          	ld	t1,0(a0)
    80208086:	18031073          	csrw	satp,t1
    8020808a:	12000073          	sfence.vma
    8020808e:	8282                	jr	t0

0000000080208090 <userret>:
    80208090:	18059073          	csrw	satp,a1
    80208094:	12000073          	sfence.vma
    80208098:	07053283          	ld	t0,112(a0)
    8020809c:	14029073          	csrw	sscratch,t0
    802080a0:	02853083          	ld	ra,40(a0)
    802080a4:	03053103          	ld	sp,48(a0)
    802080a8:	03853183          	ld	gp,56(a0)
    802080ac:	04053203          	ld	tp,64(a0)
    802080b0:	04853283          	ld	t0,72(a0)
    802080b4:	05053303          	ld	t1,80(a0)
    802080b8:	05853383          	ld	t2,88(a0)
    802080bc:	7120                	ld	s0,96(a0)
    802080be:	7524                	ld	s1,104(a0)
    802080c0:	7d2c                	ld	a1,120(a0)
    802080c2:	6150                	ld	a2,128(a0)
    802080c4:	6554                	ld	a3,136(a0)
    802080c6:	6958                	ld	a4,144(a0)
    802080c8:	6d5c                	ld	a5,152(a0)
    802080ca:	0a053803          	ld	a6,160(a0)
    802080ce:	0a853883          	ld	a7,168(a0)
    802080d2:	0b053903          	ld	s2,176(a0)
    802080d6:	0b853983          	ld	s3,184(a0)
    802080da:	0c053a03          	ld	s4,192(a0)
    802080de:	0c853a83          	ld	s5,200(a0)
    802080e2:	0d053b03          	ld	s6,208(a0)
    802080e6:	0d853b83          	ld	s7,216(a0)
    802080ea:	0e053c03          	ld	s8,224(a0)
    802080ee:	0e853c83          	ld	s9,232(a0)
    802080f2:	0f053d03          	ld	s10,240(a0)
    802080f6:	0f853d83          	ld	s11,248(a0)
    802080fa:	10053e03          	ld	t3,256(a0)
    802080fe:	10853e83          	ld	t4,264(a0)
    80208102:	11053f03          	ld	t5,272(a0)
    80208106:	11853f83          	ld	t6,280(a0)
    8020810a:	14051573          	csrrw	a0,sscratch,a0
    8020810e:	10200073          	sret
	...
