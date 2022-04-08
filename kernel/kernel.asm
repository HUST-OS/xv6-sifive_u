
kernel/kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080200000 <_entry>:
    80200000:	00150293          	addi	t0,a0,1
    80200004:	02ba                	slli	t0,t0,0xe
    80200006:	0020d117          	auipc	sp,0x20d
    8020000a:	ffa10113          	addi	sp,sp,-6 # 8040d000 <boot_stack>
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
    8020009a:	416080e7          	jalr	1046(ra) # 802074ac <consputc>
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
    802000d0:	3e0080e7          	jalr	992(ra) # 802074ac <consputc>
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
    8020011a:	53a98993          	addi	s3,s3,1338 # 80209650 <digits+0x2d0>
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
    80200184:	0021d717          	auipc	a4,0x21d
    80200188:	e8f72e23          	sw	a5,-356(a4) # 8041d020 <panicked>
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
    802001c0:	0021dd97          	auipc	s11,0x21d
    802001c4:	e58dad83          	lw	s11,-424(s11) # 8041d018 <pr+0x18>
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
    802001fe:	0021d517          	auipc	a0,0x21d
    80200202:	e0250513          	addi	a0,a0,-510 # 8041d000 <pr>
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
    80200224:	28c080e7          	jalr	652(ra) # 802074ac <consputc>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    80200228:	2485                	addiw	s1,s1,1
    8020022a:	009a07b3          	add	a5,s4,s1
    8020022e:	0007c503          	lbu	a0,0(a5) # fffffffffffff000 <kernel_end+0xffffffff7fbcf000>
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
    802002b6:	1fa080e7          	jalr	506(ra) # 802074ac <consputc>
  consputc('x');
    802002ba:	07800513          	li	a0,120
    802002be:	00007097          	auipc	ra,0x7
    802002c2:	1ee080e7          	jalr	494(ra) # 802074ac <consputc>
    802002c6:	896a                	mv	s2,s10
    consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
    802002c8:	03c9d793          	srli	a5,s3,0x3c
    802002cc:	97de                	add	a5,a5,s7
    802002ce:	0007c503          	lbu	a0,0(a5)
    802002d2:	00007097          	auipc	ra,0x7
    802002d6:	1da080e7          	jalr	474(ra) # 802074ac <consputc>
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
    80200302:	1ae080e7          	jalr	430(ra) # 802074ac <consputc>
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
    80200324:	18c080e7          	jalr	396(ra) # 802074ac <consputc>
      break;
    80200328:	b701                	j	80200228 <printf+0x9a>
      consputc('%');
    8020032a:	8556                	mv	a0,s5
    8020032c:	00007097          	auipc	ra,0x7
    80200330:	180080e7          	jalr	384(ra) # 802074ac <consputc>
      consputc(c);
    80200334:	854a                	mv	a0,s2
    80200336:	00007097          	auipc	ra,0x7
    8020033a:	176080e7          	jalr	374(ra) # 802074ac <consputc>
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
    80200362:	0021d517          	auipc	a0,0x21d
    80200366:	c9e50513          	addi	a0,a0,-866 # 8041d000 <pr>
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
    8020037e:	0021d497          	auipc	s1,0x21d
    80200382:	c8248493          	addi	s1,s1,-894 # 8041d000 <pr>
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
    8020045a:	00230797          	auipc	a5,0x230
    8020045e:	ba678793          	addi	a5,a5,-1114 # 80430000 <kernel_end>
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
    8020047a:	0021d917          	auipc	s2,0x21d
    8020047e:	bae90913          	addi	s2,s2,-1106 # 8041d028 <kmem>
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
    8020051a:	0021d497          	auipc	s1,0x21d
    8020051e:	b0e48493          	addi	s1,s1,-1266 # 8041d028 <kmem>
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
    80200542:	00230517          	auipc	a0,0x230
    80200546:	abe50513          	addi	a0,a0,-1346 # 80430000 <kernel_end>
    8020054a:	00000097          	auipc	ra,0x0
    8020054e:	f7c080e7          	jalr	-132(ra) # 802004c6 <freerange>
  printf("kernel_end: %p, phystop: %p\n", kernel_end, (void*)PHYSTOP);
    80200552:	01b49613          	slli	a2,s1,0x1b
    80200556:	00230597          	auipc	a1,0x230
    8020055a:	aaa58593          	addi	a1,a1,-1366 # 80430000 <kernel_end>
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
    80200592:	0021d497          	auipc	s1,0x21d
    80200596:	a9648493          	addi	s1,s1,-1386 # 8041d028 <kmem>
    8020059a:	8526                	mv	a0,s1
    8020059c:	00000097          	auipc	ra,0x0
    802005a0:	158080e7          	jalr	344(ra) # 802006f4 <acquire>
  r = kmem.freelist;
    802005a4:	6c84                	ld	s1,24(s1)
  if(r) {
    802005a6:	c89d                	beqz	s1,802005dc <kalloc+0x54>
    kmem.freelist = r->next;
    802005a8:	609c                	ld	a5,0(s1)
    802005aa:	0021d517          	auipc	a0,0x21d
    802005ae:	a7e50513          	addi	a0,a0,-1410 # 8041d028 <kmem>
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
    802005dc:	0021d517          	auipc	a0,0x21d
    802005e0:	a4c50513          	addi	a0,a0,-1460 # 8041d028 <kmem>
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
    802005f4:	0021d517          	auipc	a0,0x21d
    802005f8:	a5453503          	ld	a0,-1452(a0) # 8041d048 <kmem+0x20>
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
    80200620:	586080e7          	jalr	1414(ra) # 80201ba2 <mycpu>
    80200624:	5d3c                	lw	a5,120(a0)
    80200626:	cf89                	beqz	a5,80200640 <push_off+0x3c>
    mycpu()->intena = old;
  mycpu()->noff += 1;
    80200628:	00001097          	auipc	ra,0x1
    8020062c:	57a080e7          	jalr	1402(ra) # 80201ba2 <mycpu>
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
    80200644:	562080e7          	jalr	1378(ra) # 80201ba2 <mycpu>
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
    8020065c:	54a080e7          	jalr	1354(ra) # 80201ba2 <mycpu>
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
    802006de:	4c8080e7          	jalr	1224(ra) # 80201ba2 <mycpu>
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
    80200728:	47e080e7          	jalr	1150(ra) # 80201ba2 <mycpu>
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
    80200a3c:	0021c797          	auipc	a5,0x21c
    80200a40:	61478793          	addi	a5,a5,1556 # 8041d050 <booted>
    80200a44:	97ba                	add	a5,a5,a4
    80200a46:	4705                	li	a4,1
    80200a48:	c398                	sw	a4,0(a5)
  if (started == 0) {
    80200a4a:	0021c797          	auipc	a5,0x21c
    80200a4e:	61a7a783          	lw	a5,1562(a5) # 8041d064 <started>
  }
  else
  {
    // hart 1

    while (started == 0)
    80200a52:	0021c717          	auipc	a4,0x21c
    80200a56:	61270713          	addi	a4,a4,1554 # 8041d064 <started>
  if (started == 0) {
    80200a5a:	cba1                	beqz	a5,80200aaa <main+0x8c>
    while (started == 0)
    80200a5c:	431c                	lw	a5,0(a4)
    80200a5e:	2781                	sext.w	a5,a5
    80200a60:	dff5                	beqz	a5,80200a5c <main+0x3e>
      ;
    __sync_synchronize();
    80200a62:	0ff0000f          	fence
    printf("hart %d enter main()...\n", hartid);
    80200a66:	85a6                	mv	a1,s1
    80200a68:	00009517          	auipc	a0,0x9
    80200a6c:	99850513          	addi	a0,a0,-1640 # 80209400 <digits+0x80>
    80200a70:	fffff097          	auipc	ra,0xfffff
    80200a74:	71e080e7          	jalr	1822(ra) # 8020018e <printf>

    kvminithart();
    80200a78:	00000097          	auipc	ra,0x0
    80200a7c:	120080e7          	jalr	288(ra) # 80200b98 <kvminithart>
    trapinithart();
    80200a80:	00002097          	auipc	ra,0x2
    80200a84:	db2080e7          	jalr	-590(ra) # 80202832 <trapinithart>
    plicinithart();  // ask PLIC for device interrupts
    80200a88:	00006097          	auipc	ra,0x6
    80200a8c:	7e8080e7          	jalr	2024(ra) # 80207270 <plicinithart>
  }
 #ifdef DEBUG
  printf("hart %d scheduler...\n", hartid);
    80200a90:	85a6                	mv	a1,s1
    80200a92:	00009517          	auipc	a0,0x9
    80200a96:	9a650513          	addi	a0,a0,-1626 # 80209438 <digits+0xb8>
    80200a9a:	fffff097          	auipc	ra,0xfffff
    80200a9e:	6f4080e7          	jalr	1780(ra) # 8020018e <printf>
 #endif
  scheduler();
    80200aa2:	00001097          	auipc	ra,0x1
    80200aa6:	6a0080e7          	jalr	1696(ra) # 80202142 <scheduler>
    started=1;
    80200aaa:	4785                	li	a5,1
    80200aac:	0021c717          	auipc	a4,0x21c
    80200ab0:	5af72c23          	sw	a5,1464(a4) # 8041d064 <started>
    consoleinit();
    80200ab4:	00007097          	auipc	ra,0x7
    80200ab8:	bc8080e7          	jalr	-1080(ra) # 8020767c <consoleinit>
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
    80200afa:	5e8080e7          	jalr	1512(ra) # 802050de <timerinit>
    trapinithart();  // install kernel trap vector, including interrupt handler
    80200afe:	00002097          	auipc	ra,0x2
    80200b02:	d34080e7          	jalr	-716(ra) # 80202832 <trapinithart>
    procinit();
    80200b06:	00001097          	auipc	ra,0x1
    80200b0a:	006080e7          	jalr	6(ra) # 80201b0c <procinit>
    plicinit();
    80200b0e:	00006097          	auipc	ra,0x6
    80200b12:	738080e7          	jalr	1848(ra) # 80207246 <plicinit>
    plicinithart();
    80200b16:	00006097          	auipc	ra,0x6
    80200b1a:	75a080e7          	jalr	1882(ra) # 80207270 <plicinithart>
    binit();         // buffer cache
    80200b1e:	00003097          	auipc	ra,0x3
    80200b22:	950080e7          	jalr	-1712(ra) # 8020346e <binit>
    fileinit();      // file table
    80200b26:	00003097          	auipc	ra,0x3
    80200b2a:	d64080e7          	jalr	-668(ra) # 8020388a <fileinit>
    userinit();      // first user process
    80200b2e:	00001097          	auipc	ra,0x1
    80200b32:	39e080e7          	jalr	926(ra) # 80201ecc <userinit>
    __sync_synchronize();
    80200b36:	0ff0000f          	fence
   for(int i = 1; i < NCPU; i++) {
    80200b3a:	0021c997          	auipc	s3,0x21c
    80200b3e:	51698993          	addi	s3,s3,1302 # 8041d050 <booted>
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
    80200ba0:	0021c797          	auipc	a5,0x21c
    80200ba4:	4c87b783          	ld	a5,1224(a5) # 8041d068 <kernel_pagetable>
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
    80200bbc:	89850513          	addi	a0,a0,-1896 # 80209450 <digits+0xd0>
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
    80200bfa:	86a50513          	addi	a0,a0,-1942 # 80209460 <digits+0xe0>
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
    80200cf2:	77a50513          	addi	a0,a0,1914 # 80209468 <digits+0xe8>
    80200cf6:	fffff097          	auipc	ra,0xfffff
    80200cfa:	44e080e7          	jalr	1102(ra) # 80200144 <panic>
    panic("kvmpa");
    80200cfe:	00008517          	auipc	a0,0x8
    80200d02:	76a50513          	addi	a0,a0,1898 # 80209468 <digits+0xe8>
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
    80200d18:	0021c517          	auipc	a0,0x21c
    80200d1c:	35053503          	ld	a0,848(a0) # 8041d068 <kernel_pagetable>
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
    80200d96:	6de50513          	addi	a0,a0,1758 # 80209470 <digits+0xf0>
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
    80200dcc:	0021c517          	auipc	a0,0x21c
    80200dd0:	29c53503          	ld	a0,668(a0) # 8041d068 <kernel_pagetable>
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
    80200dea:	69250513          	addi	a0,a0,1682 # 80209478 <digits+0xf8>
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
    80200e08:	0021c797          	auipc	a5,0x21c
    80200e0c:	26a7b023          	sd	a0,608(a5) # 8041d068 <kernel_pagetable>
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
  kvmmap(CLINT_V, CLINT, 0x10000, PTE_R | PTE_W);
    80200e32:	4699                	li	a3,6
    80200e34:	6641                	lui	a2,0x10
    80200e36:	020005b7          	lui	a1,0x2000
    80200e3a:	01f81537          	lui	a0,0x1f81
    80200e3e:	0536                	slli	a0,a0,0xd
    80200e40:	00000097          	auipc	ra,0x0
    80200e44:	f7e080e7          	jalr	-130(ra) # 80200dbe <kvmmap>
  kvmmap(PLIC_V, PLIC, 0x400000, PTE_R | PTE_W);
    80200e48:	4699                	li	a3,6
    80200e4a:	00400637          	lui	a2,0x400
    80200e4e:	0c0005b7          	lui	a1,0xc000
    80200e52:	00fc3537          	lui	a0,0xfc3
    80200e56:	053a                	slli	a0,a0,0xe
    80200e58:	00000097          	auipc	ra,0x0
    80200e5c:	f66080e7          	jalr	-154(ra) # 80200dbe <kvmmap>
  kvmmap(GPIOHS_V, GPIOHS, 0x1000, PTE_R | PTE_W);
    80200e60:	4699                	li	a3,6
    80200e62:	6605                	lui	a2,0x1
    80200e64:	380015b7          	lui	a1,0x38001
    80200e68:	03f38537          	lui	a0,0x3f38
    80200e6c:	0505                	addi	a0,a0,1
    80200e6e:	0532                	slli	a0,a0,0xc
    80200e70:	00000097          	auipc	ra,0x0
    80200e74:	f4e080e7          	jalr	-178(ra) # 80200dbe <kvmmap>
  kvmmap(DMAC_V, DMAC, 0x1000, PTE_R | PTE_W);
    80200e78:	4699                	li	a3,6
    80200e7a:	6605                	lui	a2,0x1
    80200e7c:	500005b7          	lui	a1,0x50000
    80200e80:	3f500513          	li	a0,1013
    80200e84:	0572                	slli	a0,a0,0x1c
    80200e86:	00000097          	auipc	ra,0x0
    80200e8a:	f38080e7          	jalr	-200(ra) # 80200dbe <kvmmap>
  kvmmap(SPI_SLAVE_V, SPI_SLAVE, 0x1000, PTE_R | PTE_W);
    80200e8e:	4699                	li	a3,6
    80200e90:	6605                	lui	a2,0x1
    80200e92:	502405b7          	lui	a1,0x50240
    80200e96:	000fd4b7          	lui	s1,0xfd
    80200e9a:	40948513          	addi	a0,s1,1033 # fd409 <_entry-0x80102bf7>
    80200e9e:	054a                	slli	a0,a0,0x12
    80200ea0:	00000097          	auipc	ra,0x0
    80200ea4:	f1e080e7          	jalr	-226(ra) # 80200dbe <kvmmap>
  kvmmap(FPIOA_V, FPIOA, 0x1000, PTE_R | PTE_W);
    80200ea8:	4699                	li	a3,6
    80200eaa:	6605                	lui	a2,0x1
    80200eac:	502b05b7          	lui	a1,0x502b0
    80200eb0:	003f5537          	lui	a0,0x3f5
    80200eb4:	02b50513          	addi	a0,a0,43 # 3f502b <_entry-0x7fe0afd5>
    80200eb8:	0542                	slli	a0,a0,0x10
    80200eba:	00000097          	auipc	ra,0x0
    80200ebe:	f04080e7          	jalr	-252(ra) # 80200dbe <kvmmap>
  kvmmap(SPI0_V, SPI0, 0x1000, PTE_R | PTE_W);
    80200ec2:	4699                	li	a3,6
    80200ec4:	6605                	lui	a2,0x1
    80200ec6:	520005b7          	lui	a1,0x52000
    80200eca:	01fa9537          	lui	a0,0x1fa9
    80200ece:	0536                	slli	a0,a0,0xd
    80200ed0:	00000097          	auipc	ra,0x0
    80200ed4:	eee080e7          	jalr	-274(ra) # 80200dbe <kvmmap>
  kvmmap(SPI1_V, SPI1, 0x1000, PTE_R | PTE_W);
    80200ed8:	4699                	li	a3,6
    80200eda:	6605                	lui	a2,0x1
    80200edc:	530005b7          	lui	a1,0x53000
    80200ee0:	03f53537          	lui	a0,0x3f53
    80200ee4:	0532                	slli	a0,a0,0xc
    80200ee6:	00000097          	auipc	ra,0x0
    80200eea:	ed8080e7          	jalr	-296(ra) # 80200dbe <kvmmap>
  kvmmap(SPI2_V, SPI2, 0x1000, PTE_R | PTE_W);
    80200eee:	4699                	li	a3,6
    80200ef0:	6605                	lui	a2,0x1
    80200ef2:	540005b7          	lui	a1,0x54000
    80200ef6:	00fd5537          	lui	a0,0xfd5
    80200efa:	053a                	slli	a0,a0,0xe
    80200efc:	00000097          	auipc	ra,0x0
    80200f00:	ec2080e7          	jalr	-318(ra) # 80200dbe <kvmmap>
  kvmmap(SYSCTL_V, SYSCTL, 0x1000, PTE_R | PTE_W);
    80200f04:	4699                	li	a3,6
    80200f06:	6605                	lui	a2,0x1
    80200f08:	504405b7          	lui	a1,0x50440
    80200f0c:	41148513          	addi	a0,s1,1041
    80200f10:	054a                	slli	a0,a0,0x12
    80200f12:	00000097          	auipc	ra,0x0
    80200f16:	eac080e7          	jalr	-340(ra) # 80200dbe <kvmmap>
  kvmmap(KERNBASE, KERNBASE, (uint64)etext - KERNBASE, PTE_R | PTE_X);
    80200f1a:	00008497          	auipc	s1,0x8
    80200f1e:	0e648493          	addi	s1,s1,230 # 80209000 <etext>
    80200f22:	46a9                	li	a3,10
    80200f24:	bff00613          	li	a2,-1025
    80200f28:	0656                	slli	a2,a2,0x15
    80200f2a:	9626                	add	a2,a2,s1
    80200f2c:	40100593          	li	a1,1025
    80200f30:	05d6                	slli	a1,a1,0x15
    80200f32:	852e                	mv	a0,a1
    80200f34:	00000097          	auipc	ra,0x0
    80200f38:	e8a080e7          	jalr	-374(ra) # 80200dbe <kvmmap>
  kvmmap((uint64)etext, (uint64)etext, PHYSTOP - (uint64)etext, PTE_R | PTE_W);
    80200f3c:	4699                	li	a3,6
    80200f3e:	4645                	li	a2,17
    80200f40:	066e                	slli	a2,a2,0x1b
    80200f42:	8e05                	sub	a2,a2,s1
    80200f44:	85a6                	mv	a1,s1
    80200f46:	8526                	mv	a0,s1
    80200f48:	00000097          	auipc	ra,0x0
    80200f4c:	e76080e7          	jalr	-394(ra) # 80200dbe <kvmmap>
  kvmmap(TRAMPOLINE, (uint64)trampoline, PGSIZE, PTE_R | PTE_X);
    80200f50:	46a9                	li	a3,10
    80200f52:	6605                	lui	a2,0x1
    80200f54:	00007597          	auipc	a1,0x7
    80200f58:	0ac58593          	addi	a1,a1,172 # 80208000 <_trampoline>
    80200f5c:	04000537          	lui	a0,0x4000
    80200f60:	157d                	addi	a0,a0,-1
    80200f62:	0532                	slli	a0,a0,0xc
    80200f64:	00000097          	auipc	ra,0x0
    80200f68:	e5a080e7          	jalr	-422(ra) # 80200dbe <kvmmap>
  printf("kvminit\n");
    80200f6c:	00008517          	auipc	a0,0x8
    80200f70:	51450513          	addi	a0,a0,1300 # 80209480 <digits+0x100>
    80200f74:	fffff097          	auipc	ra,0xfffff
    80200f78:	21a080e7          	jalr	538(ra) # 8020018e <printf>
}
    80200f7c:	60e2                	ld	ra,24(sp)
    80200f7e:	6442                	ld	s0,16(sp)
    80200f80:	64a2                	ld	s1,8(sp)
    80200f82:	6105                	addi	sp,sp,32
    80200f84:	8082                	ret

0000000080200f86 <vmunmap>:
// Remove npages of mappings starting from va. va must be
// page-aligned. The mappings must exist.
// Optionally free the physical memory.
void
vmunmap(pagetable_t pagetable, uint64 va, uint64 npages, int do_free)
{
    80200f86:	715d                	addi	sp,sp,-80
    80200f88:	e486                	sd	ra,72(sp)
    80200f8a:	e0a2                	sd	s0,64(sp)
    80200f8c:	fc26                	sd	s1,56(sp)
    80200f8e:	f84a                	sd	s2,48(sp)
    80200f90:	f44e                	sd	s3,40(sp)
    80200f92:	f052                	sd	s4,32(sp)
    80200f94:	ec56                	sd	s5,24(sp)
    80200f96:	e85a                	sd	s6,16(sp)
    80200f98:	e45e                	sd	s7,8(sp)
    80200f9a:	0880                	addi	s0,sp,80
  uint64 a;
  pte_t *pte;

  if((va % PGSIZE) != 0)
    80200f9c:	03459793          	slli	a5,a1,0x34
    80200fa0:	e795                	bnez	a5,80200fcc <vmunmap+0x46>
    80200fa2:	8a2a                	mv	s4,a0
    80200fa4:	892e                	mv	s2,a1
    80200fa6:	8ab6                	mv	s5,a3
    panic("vmunmap: not aligned");

  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80200fa8:	0632                	slli	a2,a2,0xc
    80200faa:	00b609b3          	add	s3,a2,a1
    if((pte = walk(pagetable, a, 0)) == 0)
      panic("vmunmap: walk");
    if((*pte & PTE_V) == 0)
      panic("vmunmap: not mapped");
    if(PTE_FLAGS(*pte) == PTE_V)
    80200fae:	4b85                	li	s7,1
  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80200fb0:	6b05                	lui	s6,0x1
    80200fb2:	0735e863          	bltu	a1,s3,80201022 <vmunmap+0x9c>
      uint64 pa = PTE2PA(*pte);
      kfree((void*)pa);
    }
    *pte = 0;
  }
}
    80200fb6:	60a6                	ld	ra,72(sp)
    80200fb8:	6406                	ld	s0,64(sp)
    80200fba:	74e2                	ld	s1,56(sp)
    80200fbc:	7942                	ld	s2,48(sp)
    80200fbe:	79a2                	ld	s3,40(sp)
    80200fc0:	7a02                	ld	s4,32(sp)
    80200fc2:	6ae2                	ld	s5,24(sp)
    80200fc4:	6b42                	ld	s6,16(sp)
    80200fc6:	6ba2                	ld	s7,8(sp)
    80200fc8:	6161                	addi	sp,sp,80
    80200fca:	8082                	ret
    panic("vmunmap: not aligned");
    80200fcc:	00008517          	auipc	a0,0x8
    80200fd0:	4c450513          	addi	a0,a0,1220 # 80209490 <digits+0x110>
    80200fd4:	fffff097          	auipc	ra,0xfffff
    80200fd8:	170080e7          	jalr	368(ra) # 80200144 <panic>
      panic("vmunmap: walk");
    80200fdc:	00008517          	auipc	a0,0x8
    80200fe0:	4cc50513          	addi	a0,a0,1228 # 802094a8 <digits+0x128>
    80200fe4:	fffff097          	auipc	ra,0xfffff
    80200fe8:	160080e7          	jalr	352(ra) # 80200144 <panic>
      panic("vmunmap: not mapped");
    80200fec:	00008517          	auipc	a0,0x8
    80200ff0:	4cc50513          	addi	a0,a0,1228 # 802094b8 <digits+0x138>
    80200ff4:	fffff097          	auipc	ra,0xfffff
    80200ff8:	150080e7          	jalr	336(ra) # 80200144 <panic>
      panic("vmunmap: not a leaf");
    80200ffc:	00008517          	auipc	a0,0x8
    80201000:	4d450513          	addi	a0,a0,1236 # 802094d0 <digits+0x150>
    80201004:	fffff097          	auipc	ra,0xfffff
    80201008:	140080e7          	jalr	320(ra) # 80200144 <panic>
      uint64 pa = PTE2PA(*pte);
    8020100c:	8129                	srli	a0,a0,0xa
      kfree((void*)pa);
    8020100e:	0532                	slli	a0,a0,0xc
    80201010:	fffff097          	auipc	ra,0xfffff
    80201014:	436080e7          	jalr	1078(ra) # 80200446 <kfree>
    *pte = 0;
    80201018:	0004b023          	sd	zero,0(s1)
  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    8020101c:	995a                	add	s2,s2,s6
    8020101e:	f9397ce3          	bgeu	s2,s3,80200fb6 <vmunmap+0x30>
    if((pte = walk(pagetable, a, 0)) == 0)
    80201022:	4601                	li	a2,0
    80201024:	85ca                	mv	a1,s2
    80201026:	8552                	mv	a0,s4
    80201028:	00000097          	auipc	ra,0x0
    8020102c:	ba8080e7          	jalr	-1112(ra) # 80200bd0 <walk>
    80201030:	84aa                	mv	s1,a0
    80201032:	d54d                	beqz	a0,80200fdc <vmunmap+0x56>
    if((*pte & PTE_V) == 0)
    80201034:	6108                	ld	a0,0(a0)
    80201036:	00157793          	andi	a5,a0,1
    8020103a:	dbcd                	beqz	a5,80200fec <vmunmap+0x66>
    if(PTE_FLAGS(*pte) == PTE_V)
    8020103c:	3ff57793          	andi	a5,a0,1023
    80201040:	fb778ee3          	beq	a5,s7,80200ffc <vmunmap+0x76>
    if(do_free){
    80201044:	fc0a8ae3          	beqz	s5,80201018 <vmunmap+0x92>
    80201048:	b7d1                	j	8020100c <vmunmap+0x86>

000000008020104a <uvmcreate>:

// create an empty user page table.
// returns 0 if out of memory.
pagetable_t
uvmcreate()
{
    8020104a:	1101                	addi	sp,sp,-32
    8020104c:	ec06                	sd	ra,24(sp)
    8020104e:	e822                	sd	s0,16(sp)
    80201050:	e426                	sd	s1,8(sp)
    80201052:	1000                	addi	s0,sp,32
  pagetable_t pagetable;
  pagetable = (pagetable_t) kalloc();
    80201054:	fffff097          	auipc	ra,0xfffff
    80201058:	534080e7          	jalr	1332(ra) # 80200588 <kalloc>
    8020105c:	84aa                	mv	s1,a0
  if(pagetable == NULL)
    8020105e:	c519                	beqz	a0,8020106c <uvmcreate+0x22>
    return NULL;
  memset(pagetable, 0, PGSIZE);
    80201060:	6605                	lui	a2,0x1
    80201062:	4581                	li	a1,0
    80201064:	fffff097          	auipc	ra,0xfffff
    80201068:	72c080e7          	jalr	1836(ra) # 80200790 <memset>
  return pagetable;
}
    8020106c:	8526                	mv	a0,s1
    8020106e:	60e2                	ld	ra,24(sp)
    80201070:	6442                	ld	s0,16(sp)
    80201072:	64a2                	ld	s1,8(sp)
    80201074:	6105                	addi	sp,sp,32
    80201076:	8082                	ret

0000000080201078 <uvminit>:
// Load the user initcode into address 0 of pagetable,
// for the very first process.
// sz must be less than a page.
void
uvminit(pagetable_t pagetable, pagetable_t kpagetable, uchar *src, uint sz)
{
    80201078:	7139                	addi	sp,sp,-64
    8020107a:	fc06                	sd	ra,56(sp)
    8020107c:	f822                	sd	s0,48(sp)
    8020107e:	f426                	sd	s1,40(sp)
    80201080:	f04a                	sd	s2,32(sp)
    80201082:	ec4e                	sd	s3,24(sp)
    80201084:	e852                	sd	s4,16(sp)
    80201086:	e456                	sd	s5,8(sp)
    80201088:	0080                	addi	s0,sp,64
  char *mem;

  if(sz >= PGSIZE)
    8020108a:	6785                	lui	a5,0x1
    8020108c:	06f6f363          	bgeu	a3,a5,802010f2 <uvminit+0x7a>
    80201090:	8aaa                	mv	s5,a0
    80201092:	8a2e                	mv	s4,a1
    80201094:	89b2                	mv	s3,a2
    80201096:	8936                	mv	s2,a3
    panic("inituvm: more than a page");
  mem = kalloc();
    80201098:	fffff097          	auipc	ra,0xfffff
    8020109c:	4f0080e7          	jalr	1264(ra) # 80200588 <kalloc>
    802010a0:	84aa                	mv	s1,a0
  // printf("[uvminit]kalloc: %p\n", mem);
  memset(mem, 0, PGSIZE);
    802010a2:	6605                	lui	a2,0x1
    802010a4:	4581                	li	a1,0
    802010a6:	fffff097          	auipc	ra,0xfffff
    802010aa:	6ea080e7          	jalr	1770(ra) # 80200790 <memset>
  mappages(pagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X|PTE_U);
    802010ae:	4779                	li	a4,30
    802010b0:	86a6                	mv	a3,s1
    802010b2:	6605                	lui	a2,0x1
    802010b4:	4581                	li	a1,0
    802010b6:	8556                	mv	a0,s5
    802010b8:	00000097          	auipc	ra,0x0
    802010bc:	c78080e7          	jalr	-904(ra) # 80200d30 <mappages>
  mappages(kpagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X);
    802010c0:	4739                	li	a4,14
    802010c2:	86a6                	mv	a3,s1
    802010c4:	6605                	lui	a2,0x1
    802010c6:	4581                	li	a1,0
    802010c8:	8552                	mv	a0,s4
    802010ca:	00000097          	auipc	ra,0x0
    802010ce:	c66080e7          	jalr	-922(ra) # 80200d30 <mappages>
  memmove(mem, src, sz);
    802010d2:	864a                	mv	a2,s2
    802010d4:	85ce                	mv	a1,s3
    802010d6:	8526                	mv	a0,s1
    802010d8:	fffff097          	auipc	ra,0xfffff
    802010dc:	718080e7          	jalr	1816(ra) # 802007f0 <memmove>
  // for (int i = 0; i < sz; i ++) {
  //   printf("[uvminit]mem: %p, %x\n", mem + i, mem[i]);
  // }
}
    802010e0:	70e2                	ld	ra,56(sp)
    802010e2:	7442                	ld	s0,48(sp)
    802010e4:	74a2                	ld	s1,40(sp)
    802010e6:	7902                	ld	s2,32(sp)
    802010e8:	69e2                	ld	s3,24(sp)
    802010ea:	6a42                	ld	s4,16(sp)
    802010ec:	6aa2                	ld	s5,8(sp)
    802010ee:	6121                	addi	sp,sp,64
    802010f0:	8082                	ret
    panic("inituvm: more than a page");
    802010f2:	00008517          	auipc	a0,0x8
    802010f6:	3f650513          	addi	a0,a0,1014 # 802094e8 <digits+0x168>
    802010fa:	fffff097          	auipc	ra,0xfffff
    802010fe:	04a080e7          	jalr	74(ra) # 80200144 <panic>

0000000080201102 <uvmdealloc>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
uint64
uvmdealloc(pagetable_t pagetable, pagetable_t kpagetable, uint64 oldsz, uint64 newsz)
{
    80201102:	7179                	addi	sp,sp,-48
    80201104:	f406                	sd	ra,40(sp)
    80201106:	f022                	sd	s0,32(sp)
    80201108:	ec26                	sd	s1,24(sp)
    8020110a:	e84a                	sd	s2,16(sp)
    8020110c:	e44e                	sd	s3,8(sp)
    8020110e:	e052                	sd	s4,0(sp)
    80201110:	1800                	addi	s0,sp,48
  if(newsz >= oldsz)
    return oldsz;
    80201112:	8932                	mv	s2,a2
  if(newsz >= oldsz)
    80201114:	02c6f063          	bgeu	a3,a2,80201134 <uvmdealloc+0x32>
    80201118:	89aa                	mv	s3,a0
    8020111a:	852e                	mv	a0,a1
    8020111c:	8936                	mv	s2,a3

  if(PGROUNDUP(newsz) < PGROUNDUP(oldsz)){
    8020111e:	6785                	lui	a5,0x1
    80201120:	17fd                	addi	a5,a5,-1
    80201122:	00f68a33          	add	s4,a3,a5
    80201126:	777d                	lui	a4,0xfffff
    80201128:	00ea7a33          	and	s4,s4,a4
    8020112c:	963e                	add	a2,a2,a5
    8020112e:	8e79                	and	a2,a2,a4
    80201130:	00ca6b63          	bltu	s4,a2,80201146 <uvmdealloc+0x44>
    vmunmap(kpagetable, PGROUNDUP(newsz), npages, 0);
    vmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
  }

  return newsz;
}
    80201134:	854a                	mv	a0,s2
    80201136:	70a2                	ld	ra,40(sp)
    80201138:	7402                	ld	s0,32(sp)
    8020113a:	64e2                	ld	s1,24(sp)
    8020113c:	6942                	ld	s2,16(sp)
    8020113e:	69a2                	ld	s3,8(sp)
    80201140:	6a02                	ld	s4,0(sp)
    80201142:	6145                	addi	sp,sp,48
    80201144:	8082                	ret
    int npages = (PGROUNDUP(oldsz) - PGROUNDUP(newsz)) / PGSIZE;
    80201146:	414604b3          	sub	s1,a2,s4
    8020114a:	80b1                	srli	s1,s1,0xc
    vmunmap(kpagetable, PGROUNDUP(newsz), npages, 0);
    8020114c:	2481                	sext.w	s1,s1
    8020114e:	4681                	li	a3,0
    80201150:	8626                	mv	a2,s1
    80201152:	85d2                	mv	a1,s4
    80201154:	00000097          	auipc	ra,0x0
    80201158:	e32080e7          	jalr	-462(ra) # 80200f86 <vmunmap>
    vmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
    8020115c:	4685                	li	a3,1
    8020115e:	8626                	mv	a2,s1
    80201160:	85d2                	mv	a1,s4
    80201162:	854e                	mv	a0,s3
    80201164:	00000097          	auipc	ra,0x0
    80201168:	e22080e7          	jalr	-478(ra) # 80200f86 <vmunmap>
    8020116c:	b7e1                	j	80201134 <uvmdealloc+0x32>

000000008020116e <uvmalloc>:
  if(newsz < oldsz)
    8020116e:	0ec6e763          	bltu	a3,a2,8020125c <uvmalloc+0xee>
{
    80201172:	7139                	addi	sp,sp,-64
    80201174:	fc06                	sd	ra,56(sp)
    80201176:	f822                	sd	s0,48(sp)
    80201178:	f426                	sd	s1,40(sp)
    8020117a:	f04a                	sd	s2,32(sp)
    8020117c:	ec4e                	sd	s3,24(sp)
    8020117e:	e852                	sd	s4,16(sp)
    80201180:	e456                	sd	s5,8(sp)
    80201182:	e05a                	sd	s6,0(sp)
    80201184:	0080                	addi	s0,sp,64
    80201186:	8a2a                	mv	s4,a0
    80201188:	8aae                	mv	s5,a1
    8020118a:	8b36                	mv	s6,a3
  oldsz = PGROUNDUP(oldsz);
    8020118c:	6985                	lui	s3,0x1
    8020118e:	19fd                	addi	s3,s3,-1
    80201190:	964e                	add	a2,a2,s3
    80201192:	79fd                	lui	s3,0xfffff
    80201194:	013679b3          	and	s3,a2,s3
  for(a = oldsz; a < newsz; a += PGSIZE){
    80201198:	0cd9f463          	bgeu	s3,a3,80201260 <uvmalloc+0xf2>
    8020119c:	894e                	mv	s2,s3
    mem = kalloc();
    8020119e:	fffff097          	auipc	ra,0xfffff
    802011a2:	3ea080e7          	jalr	1002(ra) # 80200588 <kalloc>
    802011a6:	84aa                	mv	s1,a0
    if(mem == NULL){
    802011a8:	c129                	beqz	a0,802011ea <uvmalloc+0x7c>
    memset(mem, 0, PGSIZE);
    802011aa:	6605                	lui	a2,0x1
    802011ac:	4581                	li	a1,0
    802011ae:	fffff097          	auipc	ra,0xfffff
    802011b2:	5e2080e7          	jalr	1506(ra) # 80200790 <memset>
    if (mappages(pagetable, a, PGSIZE, (uint64)mem, PTE_W|PTE_X|PTE_R|PTE_U) != 0) {
    802011b6:	4779                	li	a4,30
    802011b8:	86a6                	mv	a3,s1
    802011ba:	6605                	lui	a2,0x1
    802011bc:	85ca                	mv	a1,s2
    802011be:	8552                	mv	a0,s4
    802011c0:	00000097          	auipc	ra,0x0
    802011c4:	b70080e7          	jalr	-1168(ra) # 80200d30 <mappages>
    802011c8:	e521                	bnez	a0,80201210 <uvmalloc+0xa2>
    if (mappages(kpagetable, a, PGSIZE, (uint64)mem, PTE_W|PTE_X|PTE_R) != 0){
    802011ca:	4739                	li	a4,14
    802011cc:	86a6                	mv	a3,s1
    802011ce:	6605                	lui	a2,0x1
    802011d0:	85ca                	mv	a1,s2
    802011d2:	8556                	mv	a0,s5
    802011d4:	00000097          	auipc	ra,0x0
    802011d8:	b5c080e7          	jalr	-1188(ra) # 80200d30 <mappages>
    802011dc:	e929                	bnez	a0,8020122e <uvmalloc+0xc0>
  for(a = oldsz; a < newsz; a += PGSIZE){
    802011de:	6785                	lui	a5,0x1
    802011e0:	993e                	add	s2,s2,a5
    802011e2:	fb696ee3          	bltu	s2,s6,8020119e <uvmalloc+0x30>
  return newsz;
    802011e6:	855a                	mv	a0,s6
    802011e8:	a811                	j	802011fc <uvmalloc+0x8e>
      uvmdealloc(pagetable, kpagetable, a, oldsz);
    802011ea:	86ce                	mv	a3,s3
    802011ec:	864a                	mv	a2,s2
    802011ee:	85d6                	mv	a1,s5
    802011f0:	8552                	mv	a0,s4
    802011f2:	00000097          	auipc	ra,0x0
    802011f6:	f10080e7          	jalr	-240(ra) # 80201102 <uvmdealloc>
      return 0;
    802011fa:	4501                	li	a0,0
}
    802011fc:	70e2                	ld	ra,56(sp)
    802011fe:	7442                	ld	s0,48(sp)
    80201200:	74a2                	ld	s1,40(sp)
    80201202:	7902                	ld	s2,32(sp)
    80201204:	69e2                	ld	s3,24(sp)
    80201206:	6a42                	ld	s4,16(sp)
    80201208:	6aa2                	ld	s5,8(sp)
    8020120a:	6b02                	ld	s6,0(sp)
    8020120c:	6121                	addi	sp,sp,64
    8020120e:	8082                	ret
      kfree(mem);
    80201210:	8526                	mv	a0,s1
    80201212:	fffff097          	auipc	ra,0xfffff
    80201216:	234080e7          	jalr	564(ra) # 80200446 <kfree>
      uvmdealloc(pagetable, kpagetable, a, oldsz);
    8020121a:	86ce                	mv	a3,s3
    8020121c:	864a                	mv	a2,s2
    8020121e:	85d6                	mv	a1,s5
    80201220:	8552                	mv	a0,s4
    80201222:	00000097          	auipc	ra,0x0
    80201226:	ee0080e7          	jalr	-288(ra) # 80201102 <uvmdealloc>
      return 0;
    8020122a:	4501                	li	a0,0
    8020122c:	bfc1                	j	802011fc <uvmalloc+0x8e>
      int npages = (a - oldsz) / PGSIZE;
    8020122e:	41390633          	sub	a2,s2,s3
    80201232:	8231                	srli	a2,a2,0xc
    80201234:	0006049b          	sext.w	s1,a2
      vmunmap(pagetable, oldsz, npages + 1, 1);   // plus the page allocated above.
    80201238:	4685                	li	a3,1
    8020123a:	2605                	addiw	a2,a2,1
    8020123c:	85ce                	mv	a1,s3
    8020123e:	8552                	mv	a0,s4
    80201240:	00000097          	auipc	ra,0x0
    80201244:	d46080e7          	jalr	-698(ra) # 80200f86 <vmunmap>
      vmunmap(kpagetable, oldsz, npages, 0);
    80201248:	4681                	li	a3,0
    8020124a:	8626                	mv	a2,s1
    8020124c:	85ce                	mv	a1,s3
    8020124e:	8556                	mv	a0,s5
    80201250:	00000097          	auipc	ra,0x0
    80201254:	d36080e7          	jalr	-714(ra) # 80200f86 <vmunmap>
      return 0;
    80201258:	4501                	li	a0,0
    8020125a:	b74d                	j	802011fc <uvmalloc+0x8e>
    return oldsz;
    8020125c:	8532                	mv	a0,a2
}
    8020125e:	8082                	ret
  return newsz;
    80201260:	8536                	mv	a0,a3
    80201262:	bf69                	j	802011fc <uvmalloc+0x8e>

0000000080201264 <freewalk>:

// Recursively free page-table pages.
// All leaf mappings must already have been removed.
void
freewalk(pagetable_t pagetable)
{
    80201264:	7179                	addi	sp,sp,-48
    80201266:	f406                	sd	ra,40(sp)
    80201268:	f022                	sd	s0,32(sp)
    8020126a:	ec26                	sd	s1,24(sp)
    8020126c:	e84a                	sd	s2,16(sp)
    8020126e:	e44e                	sd	s3,8(sp)
    80201270:	e052                	sd	s4,0(sp)
    80201272:	1800                	addi	s0,sp,48
    80201274:	8a2a                	mv	s4,a0
  // there are 2^9 = 512 PTEs in a page table.
  for(int i = 0; i < 512; i++){
    80201276:	84aa                	mv	s1,a0
    80201278:	6905                	lui	s2,0x1
    8020127a:	992a                	add	s2,s2,a0
    pte_t pte = pagetable[i];
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    8020127c:	4985                	li	s3,1
    8020127e:	a821                	j	80201296 <freewalk+0x32>
      // this PTE points to a lower-level page table.
      uint64 child = PTE2PA(pte);
    80201280:	8129                	srli	a0,a0,0xa
      freewalk((pagetable_t)child);
    80201282:	0532                	slli	a0,a0,0xc
    80201284:	00000097          	auipc	ra,0x0
    80201288:	fe0080e7          	jalr	-32(ra) # 80201264 <freewalk>
      pagetable[i] = 0;
    8020128c:	0004b023          	sd	zero,0(s1)
  for(int i = 0; i < 512; i++){
    80201290:	04a1                	addi	s1,s1,8
    80201292:	03248163          	beq	s1,s2,802012b4 <freewalk+0x50>
    pte_t pte = pagetable[i];
    80201296:	6088                	ld	a0,0(s1)
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    80201298:	00f57793          	andi	a5,a0,15
    8020129c:	ff3782e3          	beq	a5,s3,80201280 <freewalk+0x1c>
    } else if(pte & PTE_V){
    802012a0:	8905                	andi	a0,a0,1
    802012a2:	d57d                	beqz	a0,80201290 <freewalk+0x2c>
      panic("freewalk: leaf");
    802012a4:	00008517          	auipc	a0,0x8
    802012a8:	26450513          	addi	a0,a0,612 # 80209508 <digits+0x188>
    802012ac:	fffff097          	auipc	ra,0xfffff
    802012b0:	e98080e7          	jalr	-360(ra) # 80200144 <panic>
    }
  }
  kfree((void*)pagetable);
    802012b4:	8552                	mv	a0,s4
    802012b6:	fffff097          	auipc	ra,0xfffff
    802012ba:	190080e7          	jalr	400(ra) # 80200446 <kfree>
}
    802012be:	70a2                	ld	ra,40(sp)
    802012c0:	7402                	ld	s0,32(sp)
    802012c2:	64e2                	ld	s1,24(sp)
    802012c4:	6942                	ld	s2,16(sp)
    802012c6:	69a2                	ld	s3,8(sp)
    802012c8:	6a02                	ld	s4,0(sp)
    802012ca:	6145                	addi	sp,sp,48
    802012cc:	8082                	ret

00000000802012ce <uvmfree>:

// Free user memory pages,
// then free page-table pages.
void
uvmfree(pagetable_t pagetable, uint64 sz)
{
    802012ce:	1101                	addi	sp,sp,-32
    802012d0:	ec06                	sd	ra,24(sp)
    802012d2:	e822                	sd	s0,16(sp)
    802012d4:	e426                	sd	s1,8(sp)
    802012d6:	1000                	addi	s0,sp,32
    802012d8:	84aa                	mv	s1,a0
  if(sz > 0)
    802012da:	e999                	bnez	a1,802012f0 <uvmfree+0x22>
    vmunmap(pagetable, 0, PGROUNDUP(sz)/PGSIZE, 1);
  freewalk(pagetable);
    802012dc:	8526                	mv	a0,s1
    802012de:	00000097          	auipc	ra,0x0
    802012e2:	f86080e7          	jalr	-122(ra) # 80201264 <freewalk>
}
    802012e6:	60e2                	ld	ra,24(sp)
    802012e8:	6442                	ld	s0,16(sp)
    802012ea:	64a2                	ld	s1,8(sp)
    802012ec:	6105                	addi	sp,sp,32
    802012ee:	8082                	ret
    vmunmap(pagetable, 0, PGROUNDUP(sz)/PGSIZE, 1);
    802012f0:	6605                	lui	a2,0x1
    802012f2:	167d                	addi	a2,a2,-1
    802012f4:	962e                	add	a2,a2,a1
    802012f6:	4685                	li	a3,1
    802012f8:	8231                	srli	a2,a2,0xc
    802012fa:	4581                	li	a1,0
    802012fc:	00000097          	auipc	ra,0x0
    80201300:	c8a080e7          	jalr	-886(ra) # 80200f86 <vmunmap>
    80201304:	bfe1                	j	802012dc <uvmfree+0xe>

0000000080201306 <uvmcopy>:
  pte_t *pte;
  uint64 pa, i = 0, ki = 0;
  uint flags;
  char *mem;

  while (i < sz){
    80201306:	10068563          	beqz	a3,80201410 <uvmcopy+0x10a>
{
    8020130a:	715d                	addi	sp,sp,-80
    8020130c:	e486                	sd	ra,72(sp)
    8020130e:	e0a2                	sd	s0,64(sp)
    80201310:	fc26                	sd	s1,56(sp)
    80201312:	f84a                	sd	s2,48(sp)
    80201314:	f44e                	sd	s3,40(sp)
    80201316:	f052                	sd	s4,32(sp)
    80201318:	ec56                	sd	s5,24(sp)
    8020131a:	e85a                	sd	s6,16(sp)
    8020131c:	e45e                	sd	s7,8(sp)
    8020131e:	e062                	sd	s8,0(sp)
    80201320:	0880                	addi	s0,sp,80
    80201322:	8baa                	mv	s7,a0
    80201324:	8a2e                	mv	s4,a1
    80201326:	8b32                	mv	s6,a2
    80201328:	8ab6                	mv	s5,a3
  uint64 pa, i = 0, ki = 0;
    8020132a:	4981                	li	s3,0
    8020132c:	a011                	j	80201330 <uvmcopy+0x2a>
    memmove(mem, (char*)pa, PGSIZE);
    if(mappages(new, i, PGSIZE, (uint64)mem, flags) != 0) {
      kfree(mem);
      goto err;
    }
    i += PGSIZE;
    8020132e:	89e2                	mv	s3,s8
    if((pte = walk(old, i, 0)) == NULL)
    80201330:	4601                	li	a2,0
    80201332:	85ce                	mv	a1,s3
    80201334:	855e                	mv	a0,s7
    80201336:	00000097          	auipc	ra,0x0
    8020133a:	89a080e7          	jalr	-1894(ra) # 80200bd0 <walk>
    8020133e:	c135                	beqz	a0,802013a2 <uvmcopy+0x9c>
    if((*pte & PTE_V) == 0)
    80201340:	6118                	ld	a4,0(a0)
    80201342:	00177793          	andi	a5,a4,1
    80201346:	c7b5                	beqz	a5,802013b2 <uvmcopy+0xac>
    pa = PTE2PA(*pte);
    80201348:	00a75593          	srli	a1,a4,0xa
    8020134c:	00c59c13          	slli	s8,a1,0xc
    flags = PTE_FLAGS(*pte);
    80201350:	3ff77493          	andi	s1,a4,1023
    if((mem = kalloc()) == NULL)
    80201354:	fffff097          	auipc	ra,0xfffff
    80201358:	234080e7          	jalr	564(ra) # 80200588 <kalloc>
    8020135c:	892a                	mv	s2,a0
    8020135e:	c92d                	beqz	a0,802013d0 <uvmcopy+0xca>
    memmove(mem, (char*)pa, PGSIZE);
    80201360:	6605                	lui	a2,0x1
    80201362:	85e2                	mv	a1,s8
    80201364:	fffff097          	auipc	ra,0xfffff
    80201368:	48c080e7          	jalr	1164(ra) # 802007f0 <memmove>
    if(mappages(new, i, PGSIZE, (uint64)mem, flags) != 0) {
    8020136c:	2481                	sext.w	s1,s1
    8020136e:	8726                	mv	a4,s1
    80201370:	86ca                	mv	a3,s2
    80201372:	6605                	lui	a2,0x1
    80201374:	85ce                	mv	a1,s3
    80201376:	8552                	mv	a0,s4
    80201378:	00000097          	auipc	ra,0x0
    8020137c:	9b8080e7          	jalr	-1608(ra) # 80200d30 <mappages>
    80201380:	e129                	bnez	a0,802013c2 <uvmcopy+0xbc>
    i += PGSIZE;
    80201382:	6c05                	lui	s8,0x1
    80201384:	9c4e                	add	s8,s8,s3
    if(mappages(knew, ki, PGSIZE, (uint64)mem, flags & ~PTE_U) != 0){
    80201386:	3ef4f713          	andi	a4,s1,1007
    8020138a:	86ca                	mv	a3,s2
    8020138c:	6605                	lui	a2,0x1
    8020138e:	85ce                	mv	a1,s3
    80201390:	855a                	mv	a0,s6
    80201392:	00000097          	auipc	ra,0x0
    80201396:	99e080e7          	jalr	-1634(ra) # 80200d30 <mappages>
    8020139a:	ed05                	bnez	a0,802013d2 <uvmcopy+0xcc>
  while (i < sz){
    8020139c:	f95c69e3          	bltu	s8,s5,8020132e <uvmcopy+0x28>
    802013a0:	a8a1                	j	802013f8 <uvmcopy+0xf2>
      panic("uvmcopy: pte should exist");
    802013a2:	00008517          	auipc	a0,0x8
    802013a6:	17650513          	addi	a0,a0,374 # 80209518 <digits+0x198>
    802013aa:	fffff097          	auipc	ra,0xfffff
    802013ae:	d9a080e7          	jalr	-614(ra) # 80200144 <panic>
      panic("uvmcopy: page not present");
    802013b2:	00008517          	auipc	a0,0x8
    802013b6:	18650513          	addi	a0,a0,390 # 80209538 <digits+0x1b8>
    802013ba:	fffff097          	auipc	ra,0xfffff
    802013be:	d8a080e7          	jalr	-630(ra) # 80200144 <panic>
      kfree(mem);
    802013c2:	854a                	mv	a0,s2
    802013c4:	fffff097          	auipc	ra,0xfffff
    802013c8:	082080e7          	jalr	130(ra) # 80200446 <kfree>
      goto err;
    802013cc:	8c4e                	mv	s8,s3
    802013ce:	a011                	j	802013d2 <uvmcopy+0xcc>
    802013d0:	8c4e                	mv	s8,s3
    ki += PGSIZE;
  }
  return 0;

 err:
  vmunmap(knew, 0, ki / PGSIZE, 0);
    802013d2:	4681                	li	a3,0
    802013d4:	00c9d613          	srli	a2,s3,0xc
    802013d8:	4581                	li	a1,0
    802013da:	855a                	mv	a0,s6
    802013dc:	00000097          	auipc	ra,0x0
    802013e0:	baa080e7          	jalr	-1110(ra) # 80200f86 <vmunmap>
  vmunmap(new, 0, i / PGSIZE, 1);
    802013e4:	4685                	li	a3,1
    802013e6:	00cc5613          	srli	a2,s8,0xc
    802013ea:	4581                	li	a1,0
    802013ec:	8552                	mv	a0,s4
    802013ee:	00000097          	auipc	ra,0x0
    802013f2:	b98080e7          	jalr	-1128(ra) # 80200f86 <vmunmap>
  return -1;
    802013f6:	557d                	li	a0,-1
}
    802013f8:	60a6                	ld	ra,72(sp)
    802013fa:	6406                	ld	s0,64(sp)
    802013fc:	74e2                	ld	s1,56(sp)
    802013fe:	7942                	ld	s2,48(sp)
    80201400:	79a2                	ld	s3,40(sp)
    80201402:	7a02                	ld	s4,32(sp)
    80201404:	6ae2                	ld	s5,24(sp)
    80201406:	6b42                	ld	s6,16(sp)
    80201408:	6ba2                	ld	s7,8(sp)
    8020140a:	6c02                	ld	s8,0(sp)
    8020140c:	6161                	addi	sp,sp,80
    8020140e:	8082                	ret
  return 0;
    80201410:	4501                	li	a0,0
}
    80201412:	8082                	ret

0000000080201414 <uvmclear>:

// mark a PTE invalid for user access.
// used by exec for the user stack guard page.
void
uvmclear(pagetable_t pagetable, uint64 va)
{
    80201414:	1141                	addi	sp,sp,-16
    80201416:	e406                	sd	ra,8(sp)
    80201418:	e022                	sd	s0,0(sp)
    8020141a:	0800                	addi	s0,sp,16
  pte_t *pte;
  
  pte = walk(pagetable, va, 0);
    8020141c:	4601                	li	a2,0
    8020141e:	fffff097          	auipc	ra,0xfffff
    80201422:	7b2080e7          	jalr	1970(ra) # 80200bd0 <walk>
  if(pte == NULL)
    80201426:	c901                	beqz	a0,80201436 <uvmclear+0x22>
    panic("uvmclear");
  *pte &= ~PTE_U;
    80201428:	611c                	ld	a5,0(a0)
    8020142a:	9bbd                	andi	a5,a5,-17
    8020142c:	e11c                	sd	a5,0(a0)
}
    8020142e:	60a2                	ld	ra,8(sp)
    80201430:	6402                	ld	s0,0(sp)
    80201432:	0141                	addi	sp,sp,16
    80201434:	8082                	ret
    panic("uvmclear");
    80201436:	00008517          	auipc	a0,0x8
    8020143a:	12250513          	addi	a0,a0,290 # 80209558 <digits+0x1d8>
    8020143e:	fffff097          	auipc	ra,0xfffff
    80201442:	d06080e7          	jalr	-762(ra) # 80200144 <panic>

0000000080201446 <copyout>:
int
copyout(pagetable_t pagetable, uint64 dstva, char *src, uint64 len)
{
  uint64 n, va0, pa0;

  while(len > 0){
    80201446:	c6bd                	beqz	a3,802014b4 <copyout+0x6e>
{
    80201448:	715d                	addi	sp,sp,-80
    8020144a:	e486                	sd	ra,72(sp)
    8020144c:	e0a2                	sd	s0,64(sp)
    8020144e:	fc26                	sd	s1,56(sp)
    80201450:	f84a                	sd	s2,48(sp)
    80201452:	f44e                	sd	s3,40(sp)
    80201454:	f052                	sd	s4,32(sp)
    80201456:	ec56                	sd	s5,24(sp)
    80201458:	e85a                	sd	s6,16(sp)
    8020145a:	e45e                	sd	s7,8(sp)
    8020145c:	e062                	sd	s8,0(sp)
    8020145e:	0880                	addi	s0,sp,80
    80201460:	8b2a                	mv	s6,a0
    80201462:	8c2e                	mv	s8,a1
    80201464:	8a32                	mv	s4,a2
    80201466:	89b6                	mv	s3,a3
    va0 = PGROUNDDOWN(dstva);
    80201468:	7bfd                	lui	s7,0xfffff
    pa0 = walkaddr(pagetable, va0);
    if(pa0 == NULL)
      return -1;
    n = PGSIZE - (dstva - va0);
    8020146a:	6a85                	lui	s5,0x1
    8020146c:	a015                	j	80201490 <copyout+0x4a>
    if(n > len)
      n = len;
    memmove((void *)(pa0 + (dstva - va0)), src, n);
    8020146e:	9562                	add	a0,a0,s8
    80201470:	0004861b          	sext.w	a2,s1
    80201474:	85d2                	mv	a1,s4
    80201476:	41250533          	sub	a0,a0,s2
    8020147a:	fffff097          	auipc	ra,0xfffff
    8020147e:	376080e7          	jalr	886(ra) # 802007f0 <memmove>

    len -= n;
    80201482:	409989b3          	sub	s3,s3,s1
    src += n;
    80201486:	9a26                	add	s4,s4,s1
    dstva = va0 + PGSIZE;
    80201488:	01590c33          	add	s8,s2,s5
  while(len > 0){
    8020148c:	02098263          	beqz	s3,802014b0 <copyout+0x6a>
    va0 = PGROUNDDOWN(dstva);
    80201490:	017c7933          	and	s2,s8,s7
    pa0 = walkaddr(pagetable, va0);
    80201494:	85ca                	mv	a1,s2
    80201496:	855a                	mv	a0,s6
    80201498:	fffff097          	auipc	ra,0xfffff
    8020149c:	7de080e7          	jalr	2014(ra) # 80200c76 <walkaddr>
    if(pa0 == NULL)
    802014a0:	cd01                	beqz	a0,802014b8 <copyout+0x72>
    n = PGSIZE - (dstva - va0);
    802014a2:	418904b3          	sub	s1,s2,s8
    802014a6:	94d6                	add	s1,s1,s5
    if(n > len)
    802014a8:	fc99f3e3          	bgeu	s3,s1,8020146e <copyout+0x28>
    802014ac:	84ce                	mv	s1,s3
    802014ae:	b7c1                	j	8020146e <copyout+0x28>
  }
  return 0;
    802014b0:	4501                	li	a0,0
    802014b2:	a021                	j	802014ba <copyout+0x74>
    802014b4:	4501                	li	a0,0
}
    802014b6:	8082                	ret
      return -1;
    802014b8:	557d                	li	a0,-1
}
    802014ba:	60a6                	ld	ra,72(sp)
    802014bc:	6406                	ld	s0,64(sp)
    802014be:	74e2                	ld	s1,56(sp)
    802014c0:	7942                	ld	s2,48(sp)
    802014c2:	79a2                	ld	s3,40(sp)
    802014c4:	7a02                	ld	s4,32(sp)
    802014c6:	6ae2                	ld	s5,24(sp)
    802014c8:	6b42                	ld	s6,16(sp)
    802014ca:	6ba2                	ld	s7,8(sp)
    802014cc:	6c02                	ld	s8,0(sp)
    802014ce:	6161                	addi	sp,sp,80
    802014d0:	8082                	ret

00000000802014d2 <copyout2>:

int
copyout2(uint64 dstva, char *src, uint64 len)
{
    802014d2:	7179                	addi	sp,sp,-48
    802014d4:	f406                	sd	ra,40(sp)
    802014d6:	f022                	sd	s0,32(sp)
    802014d8:	ec26                	sd	s1,24(sp)
    802014da:	e84a                	sd	s2,16(sp)
    802014dc:	e44e                	sd	s3,8(sp)
    802014de:	1800                	addi	s0,sp,48
    802014e0:	84aa                	mv	s1,a0
    802014e2:	89ae                	mv	s3,a1
    802014e4:	8932                	mv	s2,a2
  uint64 sz = myproc()->sz;
    802014e6:	00000097          	auipc	ra,0x0
    802014ea:	6d8080e7          	jalr	1752(ra) # 80201bbe <myproc>
    802014ee:	653c                	ld	a5,72(a0)
  if (dstva + len > sz || dstva >= sz) {
    802014f0:	01248733          	add	a4,s1,s2
    802014f4:	02e7e463          	bltu	a5,a4,8020151c <copyout2+0x4a>
    802014f8:	02f4f463          	bgeu	s1,a5,80201520 <copyout2+0x4e>
    return -1;
  }
  memmove((void *)dstva, src, len);
    802014fc:	0009061b          	sext.w	a2,s2
    80201500:	85ce                	mv	a1,s3
    80201502:	8526                	mv	a0,s1
    80201504:	fffff097          	auipc	ra,0xfffff
    80201508:	2ec080e7          	jalr	748(ra) # 802007f0 <memmove>
  return 0;
    8020150c:	4501                	li	a0,0
}
    8020150e:	70a2                	ld	ra,40(sp)
    80201510:	7402                	ld	s0,32(sp)
    80201512:	64e2                	ld	s1,24(sp)
    80201514:	6942                	ld	s2,16(sp)
    80201516:	69a2                	ld	s3,8(sp)
    80201518:	6145                	addi	sp,sp,48
    8020151a:	8082                	ret
    return -1;
    8020151c:	557d                	li	a0,-1
    8020151e:	bfc5                	j	8020150e <copyout2+0x3c>
    80201520:	557d                	li	a0,-1
    80201522:	b7f5                	j	8020150e <copyout2+0x3c>

0000000080201524 <copyin>:
int
copyin(pagetable_t pagetable, char *dst, uint64 srcva, uint64 len)
{
  uint64 n, va0, pa0;

  while(len > 0){
    80201524:	c6bd                	beqz	a3,80201592 <copyin+0x6e>
{
    80201526:	715d                	addi	sp,sp,-80
    80201528:	e486                	sd	ra,72(sp)
    8020152a:	e0a2                	sd	s0,64(sp)
    8020152c:	fc26                	sd	s1,56(sp)
    8020152e:	f84a                	sd	s2,48(sp)
    80201530:	f44e                	sd	s3,40(sp)
    80201532:	f052                	sd	s4,32(sp)
    80201534:	ec56                	sd	s5,24(sp)
    80201536:	e85a                	sd	s6,16(sp)
    80201538:	e45e                	sd	s7,8(sp)
    8020153a:	e062                	sd	s8,0(sp)
    8020153c:	0880                	addi	s0,sp,80
    8020153e:	8b2a                	mv	s6,a0
    80201540:	8a2e                	mv	s4,a1
    80201542:	8c32                	mv	s8,a2
    80201544:	89b6                	mv	s3,a3
    va0 = PGROUNDDOWN(srcva);
    80201546:	7bfd                	lui	s7,0xfffff
    pa0 = walkaddr(pagetable, va0);
    if(pa0 == NULL)
      return -1;
    n = PGSIZE - (srcva - va0);
    80201548:	6a85                	lui	s5,0x1
    8020154a:	a015                	j	8020156e <copyin+0x4a>
    if(n > len)
      n = len;
    memmove(dst, (void *)(pa0 + (srcva - va0)), n);
    8020154c:	9562                	add	a0,a0,s8
    8020154e:	0004861b          	sext.w	a2,s1
    80201552:	412505b3          	sub	a1,a0,s2
    80201556:	8552                	mv	a0,s4
    80201558:	fffff097          	auipc	ra,0xfffff
    8020155c:	298080e7          	jalr	664(ra) # 802007f0 <memmove>

    len -= n;
    80201560:	409989b3          	sub	s3,s3,s1
    dst += n;
    80201564:	9a26                	add	s4,s4,s1
    srcva = va0 + PGSIZE;
    80201566:	01590c33          	add	s8,s2,s5
  while(len > 0){
    8020156a:	02098263          	beqz	s3,8020158e <copyin+0x6a>
    va0 = PGROUNDDOWN(srcva);
    8020156e:	017c7933          	and	s2,s8,s7
    pa0 = walkaddr(pagetable, va0);
    80201572:	85ca                	mv	a1,s2
    80201574:	855a                	mv	a0,s6
    80201576:	fffff097          	auipc	ra,0xfffff
    8020157a:	700080e7          	jalr	1792(ra) # 80200c76 <walkaddr>
    if(pa0 == NULL)
    8020157e:	cd01                	beqz	a0,80201596 <copyin+0x72>
    n = PGSIZE - (srcva - va0);
    80201580:	418904b3          	sub	s1,s2,s8
    80201584:	94d6                	add	s1,s1,s5
    if(n > len)
    80201586:	fc99f3e3          	bgeu	s3,s1,8020154c <copyin+0x28>
    8020158a:	84ce                	mv	s1,s3
    8020158c:	b7c1                	j	8020154c <copyin+0x28>
  }
  return 0;
    8020158e:	4501                	li	a0,0
    80201590:	a021                	j	80201598 <copyin+0x74>
    80201592:	4501                	li	a0,0
}
    80201594:	8082                	ret
      return -1;
    80201596:	557d                	li	a0,-1
}
    80201598:	60a6                	ld	ra,72(sp)
    8020159a:	6406                	ld	s0,64(sp)
    8020159c:	74e2                	ld	s1,56(sp)
    8020159e:	7942                	ld	s2,48(sp)
    802015a0:	79a2                	ld	s3,40(sp)
    802015a2:	7a02                	ld	s4,32(sp)
    802015a4:	6ae2                	ld	s5,24(sp)
    802015a6:	6b42                	ld	s6,16(sp)
    802015a8:	6ba2                	ld	s7,8(sp)
    802015aa:	6c02                	ld	s8,0(sp)
    802015ac:	6161                	addi	sp,sp,80
    802015ae:	8082                	ret

00000000802015b0 <copyin2>:

int
copyin2(char *dst, uint64 srcva, uint64 len)
{
    802015b0:	7179                	addi	sp,sp,-48
    802015b2:	f406                	sd	ra,40(sp)
    802015b4:	f022                	sd	s0,32(sp)
    802015b6:	ec26                	sd	s1,24(sp)
    802015b8:	e84a                	sd	s2,16(sp)
    802015ba:	e44e                	sd	s3,8(sp)
    802015bc:	1800                	addi	s0,sp,48
    802015be:	89aa                	mv	s3,a0
    802015c0:	84ae                	mv	s1,a1
    802015c2:	8932                	mv	s2,a2
  uint64 sz = myproc()->sz;
    802015c4:	00000097          	auipc	ra,0x0
    802015c8:	5fa080e7          	jalr	1530(ra) # 80201bbe <myproc>
    802015cc:	653c                	ld	a5,72(a0)
  if (srcva + len > sz || srcva >= sz) {
    802015ce:	01248733          	add	a4,s1,s2
    802015d2:	02e7e463          	bltu	a5,a4,802015fa <copyin2+0x4a>
    802015d6:	02f4f463          	bgeu	s1,a5,802015fe <copyin2+0x4e>
    return -1;
  }
  memmove(dst, (void *)srcva, len);
    802015da:	0009061b          	sext.w	a2,s2
    802015de:	85a6                	mv	a1,s1
    802015e0:	854e                	mv	a0,s3
    802015e2:	fffff097          	auipc	ra,0xfffff
    802015e6:	20e080e7          	jalr	526(ra) # 802007f0 <memmove>
  return 0;
    802015ea:	4501                	li	a0,0
}
    802015ec:	70a2                	ld	ra,40(sp)
    802015ee:	7402                	ld	s0,32(sp)
    802015f0:	64e2                	ld	s1,24(sp)
    802015f2:	6942                	ld	s2,16(sp)
    802015f4:	69a2                	ld	s3,8(sp)
    802015f6:	6145                	addi	sp,sp,48
    802015f8:	8082                	ret
    return -1;
    802015fa:	557d                	li	a0,-1
    802015fc:	bfc5                	j	802015ec <copyin2+0x3c>
    802015fe:	557d                	li	a0,-1
    80201600:	b7f5                	j	802015ec <copyin2+0x3c>

0000000080201602 <copyinstr>:
copyinstr(pagetable_t pagetable, char *dst, uint64 srcva, uint64 max)
{
  uint64 n, va0, pa0;
  int got_null = 0;

  while(got_null == 0 && max > 0){
    80201602:	c6c5                	beqz	a3,802016aa <copyinstr+0xa8>
{
    80201604:	715d                	addi	sp,sp,-80
    80201606:	e486                	sd	ra,72(sp)
    80201608:	e0a2                	sd	s0,64(sp)
    8020160a:	fc26                	sd	s1,56(sp)
    8020160c:	f84a                	sd	s2,48(sp)
    8020160e:	f44e                	sd	s3,40(sp)
    80201610:	f052                	sd	s4,32(sp)
    80201612:	ec56                	sd	s5,24(sp)
    80201614:	e85a                	sd	s6,16(sp)
    80201616:	e45e                	sd	s7,8(sp)
    80201618:	0880                	addi	s0,sp,80
    8020161a:	8a2a                	mv	s4,a0
    8020161c:	8b2e                	mv	s6,a1
    8020161e:	8bb2                	mv	s7,a2
    80201620:	84b6                	mv	s1,a3
    va0 = PGROUNDDOWN(srcva);
    80201622:	7afd                	lui	s5,0xfffff
    pa0 = walkaddr(pagetable, va0);
    if(pa0 == NULL)
      return -1;
    n = PGSIZE - (srcva - va0);
    80201624:	6985                	lui	s3,0x1
    80201626:	a035                	j	80201652 <copyinstr+0x50>
      n = max;

    char *p = (char *) (pa0 + (srcva - va0));
    while(n > 0){
      if(*p == '\0'){
        *dst = '\0';
    80201628:	00078023          	sb	zero,0(a5) # 1000 <_entry-0x801ff000>
    8020162c:	4785                	li	a5,1
      dst++;
    }

    srcva = va0 + PGSIZE;
  }
  if(got_null){
    8020162e:	0017b793          	seqz	a5,a5
    80201632:	40f00533          	neg	a0,a5
    return 0;
  } else {
    return -1;
  }
}
    80201636:	60a6                	ld	ra,72(sp)
    80201638:	6406                	ld	s0,64(sp)
    8020163a:	74e2                	ld	s1,56(sp)
    8020163c:	7942                	ld	s2,48(sp)
    8020163e:	79a2                	ld	s3,40(sp)
    80201640:	7a02                	ld	s4,32(sp)
    80201642:	6ae2                	ld	s5,24(sp)
    80201644:	6b42                	ld	s6,16(sp)
    80201646:	6ba2                	ld	s7,8(sp)
    80201648:	6161                	addi	sp,sp,80
    8020164a:	8082                	ret
    srcva = va0 + PGSIZE;
    8020164c:	01390bb3          	add	s7,s2,s3
  while(got_null == 0 && max > 0){
    80201650:	c8a9                	beqz	s1,802016a2 <copyinstr+0xa0>
    va0 = PGROUNDDOWN(srcva);
    80201652:	015bf933          	and	s2,s7,s5
    pa0 = walkaddr(pagetable, va0);
    80201656:	85ca                	mv	a1,s2
    80201658:	8552                	mv	a0,s4
    8020165a:	fffff097          	auipc	ra,0xfffff
    8020165e:	61c080e7          	jalr	1564(ra) # 80200c76 <walkaddr>
    if(pa0 == NULL)
    80201662:	c131                	beqz	a0,802016a6 <copyinstr+0xa4>
    n = PGSIZE - (srcva - va0);
    80201664:	41790833          	sub	a6,s2,s7
    80201668:	984e                	add	a6,a6,s3
    if(n > max)
    8020166a:	0104f363          	bgeu	s1,a6,80201670 <copyinstr+0x6e>
    8020166e:	8826                	mv	a6,s1
    char *p = (char *) (pa0 + (srcva - va0));
    80201670:	955e                	add	a0,a0,s7
    80201672:	41250533          	sub	a0,a0,s2
    while(n > 0){
    80201676:	fc080be3          	beqz	a6,8020164c <copyinstr+0x4a>
    8020167a:	985a                	add	a6,a6,s6
    8020167c:	87da                	mv	a5,s6
      if(*p == '\0'){
    8020167e:	41650633          	sub	a2,a0,s6
    80201682:	14fd                	addi	s1,s1,-1
    80201684:	9b26                	add	s6,s6,s1
    80201686:	00f60733          	add	a4,a2,a5
    8020168a:	00074703          	lbu	a4,0(a4) # fffffffffffff000 <kernel_end+0xffffffff7fbcf000>
    8020168e:	df49                	beqz	a4,80201628 <copyinstr+0x26>
        *dst = *p;
    80201690:	00e78023          	sb	a4,0(a5)
      --max;
    80201694:	40fb04b3          	sub	s1,s6,a5
      dst++;
    80201698:	0785                	addi	a5,a5,1
    while(n > 0){
    8020169a:	ff0796e3          	bne	a5,a6,80201686 <copyinstr+0x84>
      dst++;
    8020169e:	8b42                	mv	s6,a6
    802016a0:	b775                	j	8020164c <copyinstr+0x4a>
    802016a2:	4781                	li	a5,0
    802016a4:	b769                	j	8020162e <copyinstr+0x2c>
      return -1;
    802016a6:	557d                	li	a0,-1
    802016a8:	b779                	j	80201636 <copyinstr+0x34>
  int got_null = 0;
    802016aa:	4781                	li	a5,0
  if(got_null){
    802016ac:	0017b793          	seqz	a5,a5
    802016b0:	40f00533          	neg	a0,a5
}
    802016b4:	8082                	ret

00000000802016b6 <copyinstr2>:

int
copyinstr2(char *dst, uint64 srcva, uint64 max)
{
    802016b6:	7179                	addi	sp,sp,-48
    802016b8:	f406                	sd	ra,40(sp)
    802016ba:	f022                	sd	s0,32(sp)
    802016bc:	ec26                	sd	s1,24(sp)
    802016be:	e84a                	sd	s2,16(sp)
    802016c0:	e44e                	sd	s3,8(sp)
    802016c2:	1800                	addi	s0,sp,48
    802016c4:	89aa                	mv	s3,a0
    802016c6:	84ae                	mv	s1,a1
    802016c8:	8932                	mv	s2,a2
  int got_null = 0;
  uint64 sz = myproc()->sz;
    802016ca:	00000097          	auipc	ra,0x0
    802016ce:	4f4080e7          	jalr	1268(ra) # 80201bbe <myproc>
    802016d2:	6534                	ld	a3,72(a0)
  while(srcva < sz && max > 0){
    802016d4:	04d4f363          	bgeu	s1,a3,8020171a <copyinstr2+0x64>
    802016d8:	04090363          	beqz	s2,8020171e <copyinstr2+0x68>
    802016dc:	01298633          	add	a2,s3,s2
    802016e0:	8e85                	sub	a3,a3,s1
    802016e2:	96ce                	add	a3,a3,s3
    802016e4:	87ce                	mv	a5,s3
    char *p = (char *)srcva;
    if(*p == '\0'){
    802016e6:	413485b3          	sub	a1,s1,s3
    802016ea:	00b78733          	add	a4,a5,a1
    802016ee:	00074703          	lbu	a4,0(a4)
    802016f2:	cb11                	beqz	a4,80201706 <copyinstr2+0x50>
      *dst = '\0';
      got_null = 1;
      break;
    } else {
      *dst = *p;
    802016f4:	00e78023          	sb	a4,0(a5)
    }
    --max;
    srcva++;
    dst++;
    802016f8:	0785                	addi	a5,a5,1
  while(srcva < sz && max > 0){
    802016fa:	02d78463          	beq	a5,a3,80201722 <copyinstr2+0x6c>
    802016fe:	fec796e3          	bne	a5,a2,802016ea <copyinstr2+0x34>
  }
  if(got_null){
    return 0;
  } else {
    return -1;
    80201702:	557d                	li	a0,-1
    80201704:	a021                	j	8020170c <copyinstr2+0x56>
      *dst = '\0';
    80201706:	00078023          	sb	zero,0(a5)
    return 0;
    8020170a:	4501                	li	a0,0
  }
}
    8020170c:	70a2                	ld	ra,40(sp)
    8020170e:	7402                	ld	s0,32(sp)
    80201710:	64e2                	ld	s1,24(sp)
    80201712:	6942                	ld	s2,16(sp)
    80201714:	69a2                	ld	s3,8(sp)
    80201716:	6145                	addi	sp,sp,48
    80201718:	8082                	ret
    return -1;
    8020171a:	557d                	li	a0,-1
    8020171c:	bfc5                	j	8020170c <copyinstr2+0x56>
    8020171e:	557d                	li	a0,-1
    80201720:	b7f5                	j	8020170c <copyinstr2+0x56>
    80201722:	557d                	li	a0,-1
    80201724:	b7e5                	j	8020170c <copyinstr2+0x56>

0000000080201726 <kfreewalk>:
}

// only free page table, not physical pages
void
kfreewalk(pagetable_t kpt)
{
    80201726:	7179                	addi	sp,sp,-48
    80201728:	f406                	sd	ra,40(sp)
    8020172a:	f022                	sd	s0,32(sp)
    8020172c:	ec26                	sd	s1,24(sp)
    8020172e:	e84a                	sd	s2,16(sp)
    80201730:	e44e                	sd	s3,8(sp)
    80201732:	e052                	sd	s4,0(sp)
    80201734:	1800                	addi	s0,sp,48
    80201736:	8a2a                	mv	s4,a0
  for (int i = 0; i < 512; i++) {
    80201738:	84aa                	mv	s1,a0
    8020173a:	6905                	lui	s2,0x1
    8020173c:	992a                	add	s2,s2,a0
    pte_t pte = kpt[i];
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    8020173e:	4985                	li	s3,1
    80201740:	a829                	j	8020175a <kfreewalk+0x34>
      kfreewalk((pagetable_t) PTE2PA(pte));
    80201742:	83a9                	srli	a5,a5,0xa
    80201744:	00c79513          	slli	a0,a5,0xc
    80201748:	00000097          	auipc	ra,0x0
    8020174c:	fde080e7          	jalr	-34(ra) # 80201726 <kfreewalk>
      kpt[i] = 0;
    80201750:	0004b023          	sd	zero,0(s1)
  for (int i = 0; i < 512; i++) {
    80201754:	04a1                	addi	s1,s1,8
    80201756:	01248963          	beq	s1,s2,80201768 <kfreewalk+0x42>
    pte_t pte = kpt[i];
    8020175a:	609c                	ld	a5,0(s1)
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    8020175c:	00f7f713          	andi	a4,a5,15
    80201760:	ff3701e3          	beq	a4,s3,80201742 <kfreewalk+0x1c>
    } else if (pte & PTE_V) {
    80201764:	8b85                	andi	a5,a5,1
    80201766:	d7fd                	beqz	a5,80201754 <kfreewalk+0x2e>
      break;
    }
  }
  kfree((void *) kpt);
    80201768:	8552                	mv	a0,s4
    8020176a:	fffff097          	auipc	ra,0xfffff
    8020176e:	cdc080e7          	jalr	-804(ra) # 80200446 <kfree>
}
    80201772:	70a2                	ld	ra,40(sp)
    80201774:	7402                	ld	s0,32(sp)
    80201776:	64e2                	ld	s1,24(sp)
    80201778:	6942                	ld	s2,16(sp)
    8020177a:	69a2                	ld	s3,8(sp)
    8020177c:	6a02                	ld	s4,0(sp)
    8020177e:	6145                	addi	sp,sp,48
    80201780:	8082                	ret

0000000080201782 <kvmfreeusr>:

void
kvmfreeusr(pagetable_t kpt)
{
    80201782:	1101                	addi	sp,sp,-32
    80201784:	ec06                	sd	ra,24(sp)
    80201786:	e822                	sd	s0,16(sp)
    80201788:	e426                	sd	s1,8(sp)
    8020178a:	1000                	addi	s0,sp,32
    8020178c:	84aa                	mv	s1,a0
  pte_t pte;
  for (int i = 0; i < PX(2, MAXUVA); i++) {
    pte = kpt[i];
    8020178e:	6108                	ld	a0,0(a0)
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    80201790:	00f57713          	andi	a4,a0,15
    80201794:	4785                	li	a5,1
    80201796:	00f70d63          	beq	a4,a5,802017b0 <kvmfreeusr+0x2e>
    pte = kpt[i];
    8020179a:	6488                	ld	a0,8(s1)
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    8020179c:	00f57713          	andi	a4,a0,15
    802017a0:	4785                	li	a5,1
    802017a2:	02f70063          	beq	a4,a5,802017c2 <kvmfreeusr+0x40>
      kfreewalk((pagetable_t) PTE2PA(pte));
      kpt[i] = 0;
    }
  }
}
    802017a6:	60e2                	ld	ra,24(sp)
    802017a8:	6442                	ld	s0,16(sp)
    802017aa:	64a2                	ld	s1,8(sp)
    802017ac:	6105                	addi	sp,sp,32
    802017ae:	8082                	ret
      kfreewalk((pagetable_t) PTE2PA(pte));
    802017b0:	8129                	srli	a0,a0,0xa
    802017b2:	0532                	slli	a0,a0,0xc
    802017b4:	00000097          	auipc	ra,0x0
    802017b8:	f72080e7          	jalr	-142(ra) # 80201726 <kfreewalk>
      kpt[i] = 0;
    802017bc:	0004b023          	sd	zero,0(s1)
    802017c0:	bfe9                	j	8020179a <kvmfreeusr+0x18>
      kfreewalk((pagetable_t) PTE2PA(pte));
    802017c2:	8129                	srli	a0,a0,0xa
    802017c4:	0532                	slli	a0,a0,0xc
    802017c6:	00000097          	auipc	ra,0x0
    802017ca:	f60080e7          	jalr	-160(ra) # 80201726 <kfreewalk>
      kpt[i] = 0;
    802017ce:	0004b423          	sd	zero,8(s1)
}
    802017d2:	bfd1                	j	802017a6 <kvmfreeusr+0x24>

00000000802017d4 <kvmfree>:

void
kvmfree(pagetable_t kpt, int stack_free)
{
    802017d4:	1101                	addi	sp,sp,-32
    802017d6:	ec06                	sd	ra,24(sp)
    802017d8:	e822                	sd	s0,16(sp)
    802017da:	e426                	sd	s1,8(sp)
    802017dc:	1000                	addi	s0,sp,32
    802017de:	84aa                	mv	s1,a0
  if (stack_free) {
    802017e0:	e185                	bnez	a1,80201800 <kvmfree+0x2c>
    pte_t pte = kpt[PX(2, VKSTACK)];
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
      kfreewalk((pagetable_t) PTE2PA(pte));
    }
  }
  kvmfreeusr(kpt);
    802017e2:	8526                	mv	a0,s1
    802017e4:	00000097          	auipc	ra,0x0
    802017e8:	f9e080e7          	jalr	-98(ra) # 80201782 <kvmfreeusr>
  kfree(kpt);
    802017ec:	8526                	mv	a0,s1
    802017ee:	fffff097          	auipc	ra,0xfffff
    802017f2:	c58080e7          	jalr	-936(ra) # 80200446 <kfree>
}
    802017f6:	60e2                	ld	ra,24(sp)
    802017f8:	6442                	ld	s0,16(sp)
    802017fa:	64a2                	ld	s1,8(sp)
    802017fc:	6105                	addi	sp,sp,32
    802017fe:	8082                	ret
    vmunmap(kpt, VKSTACK, 1, 1);
    80201800:	4685                	li	a3,1
    80201802:	4605                	li	a2,1
    80201804:	0fb00593          	li	a1,251
    80201808:	05fa                	slli	a1,a1,0x1e
    8020180a:	fffff097          	auipc	ra,0xfffff
    8020180e:	77c080e7          	jalr	1916(ra) # 80200f86 <vmunmap>
    pte_t pte = kpt[PX(2, VKSTACK)];
    80201812:	7d84b503          	ld	a0,2008(s1)
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    80201816:	00f57713          	andi	a4,a0,15
    8020181a:	4785                	li	a5,1
    8020181c:	fcf713e3          	bne	a4,a5,802017e2 <kvmfree+0xe>
      kfreewalk((pagetable_t) PTE2PA(pte));
    80201820:	8129                	srli	a0,a0,0xa
    80201822:	0532                	slli	a0,a0,0xc
    80201824:	00000097          	auipc	ra,0x0
    80201828:	f02080e7          	jalr	-254(ra) # 80201726 <kfreewalk>
    8020182c:	bf5d                	j	802017e2 <kvmfree+0xe>

000000008020182e <proc_kpagetable>:
{
    8020182e:	1101                	addi	sp,sp,-32
    80201830:	ec06                	sd	ra,24(sp)
    80201832:	e822                	sd	s0,16(sp)
    80201834:	e426                	sd	s1,8(sp)
    80201836:	1000                	addi	s0,sp,32
  pagetable_t kpt = (pagetable_t) kalloc();
    80201838:	fffff097          	auipc	ra,0xfffff
    8020183c:	d50080e7          	jalr	-688(ra) # 80200588 <kalloc>
    80201840:	84aa                	mv	s1,a0
  if (kpt == NULL)
    80201842:	c91d                	beqz	a0,80201878 <proc_kpagetable+0x4a>
  memmove(kpt, kernel_pagetable, PGSIZE);
    80201844:	6605                	lui	a2,0x1
    80201846:	0021c597          	auipc	a1,0x21c
    8020184a:	8225b583          	ld	a1,-2014(a1) # 8041d068 <kernel_pagetable>
    8020184e:	fffff097          	auipc	ra,0xfffff
    80201852:	fa2080e7          	jalr	-94(ra) # 802007f0 <memmove>
  char *pstack = kalloc();
    80201856:	fffff097          	auipc	ra,0xfffff
    8020185a:	d32080e7          	jalr	-718(ra) # 80200588 <kalloc>
    8020185e:	86aa                	mv	a3,a0
  if(pstack == NULL)
    80201860:	c115                	beqz	a0,80201884 <proc_kpagetable+0x56>
  if (mappages(kpt, VKSTACK, PGSIZE, (uint64)pstack, PTE_R | PTE_W) != 0)
    80201862:	4719                	li	a4,6
    80201864:	6605                	lui	a2,0x1
    80201866:	0fb00593          	li	a1,251
    8020186a:	05fa                	slli	a1,a1,0x1e
    8020186c:	8526                	mv	a0,s1
    8020186e:	fffff097          	auipc	ra,0xfffff
    80201872:	4c2080e7          	jalr	1218(ra) # 80200d30 <mappages>
    80201876:	e519                	bnez	a0,80201884 <proc_kpagetable+0x56>
}
    80201878:	8526                	mv	a0,s1
    8020187a:	60e2                	ld	ra,24(sp)
    8020187c:	6442                	ld	s0,16(sp)
    8020187e:	64a2                	ld	s1,8(sp)
    80201880:	6105                	addi	sp,sp,32
    80201882:	8082                	ret
  kvmfree(kpt, 1);
    80201884:	4585                	li	a1,1
    80201886:	8526                	mv	a0,s1
    80201888:	00000097          	auipc	ra,0x0
    8020188c:	f4c080e7          	jalr	-180(ra) # 802017d4 <kvmfree>
  return NULL;
    80201890:	4481                	li	s1,0
    80201892:	b7dd                	j	80201878 <proc_kpagetable+0x4a>

0000000080201894 <vmprint>:

void vmprint(pagetable_t pagetable)
{
    80201894:	7119                	addi	sp,sp,-128
    80201896:	fc86                	sd	ra,120(sp)
    80201898:	f8a2                	sd	s0,112(sp)
    8020189a:	f4a6                	sd	s1,104(sp)
    8020189c:	f0ca                	sd	s2,96(sp)
    8020189e:	ecce                	sd	s3,88(sp)
    802018a0:	e8d2                	sd	s4,80(sp)
    802018a2:	e4d6                	sd	s5,72(sp)
    802018a4:	e0da                	sd	s6,64(sp)
    802018a6:	fc5e                	sd	s7,56(sp)
    802018a8:	f862                	sd	s8,48(sp)
    802018aa:	f466                	sd	s9,40(sp)
    802018ac:	f06a                	sd	s10,32(sp)
    802018ae:	ec6e                	sd	s11,24(sp)
    802018b0:	0100                	addi	s0,sp,128
    802018b2:	8baa                	mv	s7,a0
    802018b4:	f8a43023          	sd	a0,-128(s0)
  const int capacity = 512;
  printf("page table %p\n", pagetable);
    802018b8:	85aa                	mv	a1,a0
    802018ba:	00008517          	auipc	a0,0x8
    802018be:	cae50513          	addi	a0,a0,-850 # 80209568 <digits+0x1e8>
    802018c2:	fffff097          	auipc	ra,0xfffff
    802018c6:	8cc080e7          	jalr	-1844(ra) # 8020018e <printf>
  for (pte_t *pte = (pte_t *) pagetable; pte < pagetable + capacity; pte++) {
    802018ca:	6d85                	lui	s11,0x1
    802018cc:	9dde                	add	s11,s11,s7
    802018ce:	6c05                	lui	s8,0x1

      for (pte_t *pte2 = (pte_t *) pt2; pte2 < pt2 + capacity; pte2++) {
        if (*pte2 & PTE_V)
        {
          pagetable_t pt3 = (pagetable_t) PTE2PA(*pte2);
          printf(".. ..%d: pte %p pa %p\n", pte2 - pt2, *pte2, pt3);
    802018d0:	00008c97          	auipc	s9,0x8
    802018d4:	cc0c8c93          	addi	s9,s9,-832 # 80209590 <digits+0x210>
    802018d8:	20000793          	li	a5,512
    802018dc:	f8f43423          	sd	a5,-120(s0)

          for (pte_t *pte3 = (pte_t *) pt3; pte3 < pt3 + capacity; pte3++)
            if (*pte3 & PTE_V)
              printf(".. .. ..%d: pte %p pa %p\n", pte3 - pt3, *pte3, PTE2PA(*pte3));
    802018e0:	00008a17          	auipc	s4,0x8
    802018e4:	cc8a0a13          	addi	s4,s4,-824 # 802095a8 <digits+0x228>
    802018e8:	a88d                	j	8020195a <vmprint+0xc6>
    802018ea:	00a65693          	srli	a3,a2,0xa
    802018ee:	413485b3          	sub	a1,s1,s3
    802018f2:	06b2                	slli	a3,a3,0xc
    802018f4:	858d                	srai	a1,a1,0x3
    802018f6:	8552                	mv	a0,s4
    802018f8:	fffff097          	auipc	ra,0xfffff
    802018fc:	896080e7          	jalr	-1898(ra) # 8020018e <printf>
          for (pte_t *pte3 = (pte_t *) pt3; pte3 < pt3 + capacity; pte3++)
    80201900:	04a1                	addi	s1,s1,8
    80201902:	01248763          	beq	s1,s2,80201910 <vmprint+0x7c>
            if (*pte3 & PTE_V)
    80201906:	6090                	ld	a2,0(s1)
    80201908:	00167793          	andi	a5,a2,1
    8020190c:	dbf5                	beqz	a5,80201900 <vmprint+0x6c>
    8020190e:	bff1                	j	802018ea <vmprint+0x56>
      for (pte_t *pte2 = (pte_t *) pt2; pte2 < pt2 + capacity; pte2++) {
    80201910:	0aa1                	addi	s5,s5,8
    80201912:	056a8163          	beq	s5,s6,80201954 <vmprint+0xc0>
        if (*pte2 & PTE_V)
    80201916:	000ab603          	ld	a2,0(s5) # fffffffffffff000 <kernel_end+0xffffffff7fbcf000>
    8020191a:	00167793          	andi	a5,a2,1
    8020191e:	dbed                	beqz	a5,80201910 <vmprint+0x7c>
          pagetable_t pt3 = (pagetable_t) PTE2PA(*pte2);
    80201920:	00a65493          	srli	s1,a2,0xa
    80201924:	04b2                	slli	s1,s1,0xc
    80201926:	89a6                	mv	s3,s1
          printf(".. ..%d: pte %p pa %p\n", pte2 - pt2, *pte2, pt3);
    80201928:	41aa85b3          	sub	a1,s5,s10
    8020192c:	86a6                	mv	a3,s1
    8020192e:	858d                	srai	a1,a1,0x3
    80201930:	8566                	mv	a0,s9
    80201932:	fffff097          	auipc	ra,0xfffff
    80201936:	85c080e7          	jalr	-1956(ra) # 8020018e <printf>
          for (pte_t *pte3 = (pte_t *) pt3; pte3 < pt3 + capacity; pte3++)
    8020193a:	00848693          	addi	a3,s1,8
    8020193e:	01848733          	add	a4,s1,s8
    80201942:	f8843783          	ld	a5,-120(s0)
    80201946:	00d77363          	bgeu	a4,a3,8020194c <vmprint+0xb8>
    8020194a:	4785                	li	a5,1
    8020194c:	078e                	slli	a5,a5,0x3
    8020194e:	00978933          	add	s2,a5,s1
    80201952:	bf55                	j	80201906 <vmprint+0x72>
  for (pte_t *pte = (pte_t *) pagetable; pte < pagetable + capacity; pte++) {
    80201954:	0ba1                	addi	s7,s7,8
    80201956:	05bb8763          	beq	s7,s11,802019a4 <vmprint+0x110>
    if (*pte & PTE_V)
    8020195a:	000bb603          	ld	a2,0(s7) # fffffffffffff000 <kernel_end+0xffffffff7fbcf000>
    8020195e:	00167793          	andi	a5,a2,1
    80201962:	dbed                	beqz	a5,80201954 <vmprint+0xc0>
      pagetable_t pt2 = (pagetable_t) PTE2PA(*pte); 
    80201964:	00a65a93          	srli	s5,a2,0xa
    80201968:	0ab2                	slli	s5,s5,0xc
    8020196a:	8d56                	mv	s10,s5
      printf("..%d: pte %p pa %p\n", pte - pagetable, *pte, pt2);
    8020196c:	f8043783          	ld	a5,-128(s0)
    80201970:	40fb87b3          	sub	a5,s7,a5
    80201974:	86d6                	mv	a3,s5
    80201976:	4037d593          	srai	a1,a5,0x3
    8020197a:	00008517          	auipc	a0,0x8
    8020197e:	bfe50513          	addi	a0,a0,-1026 # 80209578 <digits+0x1f8>
    80201982:	fffff097          	auipc	ra,0xfffff
    80201986:	80c080e7          	jalr	-2036(ra) # 8020018e <printf>
      for (pte_t *pte2 = (pte_t *) pt2; pte2 < pt2 + capacity; pte2++) {
    8020198a:	018a86b3          	add	a3,s5,s8
    8020198e:	008a8713          	addi	a4,s5,8
    80201992:	20000793          	li	a5,512
    80201996:	00e6f363          	bgeu	a3,a4,8020199c <vmprint+0x108>
    8020199a:	4785                	li	a5,1
    8020199c:	078e                	slli	a5,a5,0x3
    8020199e:	01578b33          	add	s6,a5,s5
    802019a2:	bf95                	j	80201916 <vmprint+0x82>
        }
      }
    }
  }
  return;
}
    802019a4:	70e6                	ld	ra,120(sp)
    802019a6:	7446                	ld	s0,112(sp)
    802019a8:	74a6                	ld	s1,104(sp)
    802019aa:	7906                	ld	s2,96(sp)
    802019ac:	69e6                	ld	s3,88(sp)
    802019ae:	6a46                	ld	s4,80(sp)
    802019b0:	6aa6                	ld	s5,72(sp)
    802019b2:	6b06                	ld	s6,64(sp)
    802019b4:	7be2                	ld	s7,56(sp)
    802019b6:	7c42                	ld	s8,48(sp)
    802019b8:	7ca2                	ld	s9,40(sp)
    802019ba:	7d02                	ld	s10,32(sp)
    802019bc:	6de2                	ld	s11,24(sp)
    802019be:	6109                	addi	sp,sp,128
    802019c0:	8082                	ret

00000000802019c2 <wakeup1>:

// Wake up p if it is sleeping in wait(); used by exit().
// Caller must hold p->lock.
static void
wakeup1(struct proc *p)
{
    802019c2:	1101                	addi	sp,sp,-32
    802019c4:	ec06                	sd	ra,24(sp)
    802019c6:	e822                	sd	s0,16(sp)
    802019c8:	e426                	sd	s1,8(sp)
    802019ca:	1000                	addi	s0,sp,32
    802019cc:	84aa                	mv	s1,a0
  if(!holding(&p->lock))
    802019ce:	fffff097          	auipc	ra,0xfffff
    802019d2:	cf8080e7          	jalr	-776(ra) # 802006c6 <holding>
    802019d6:	c909                	beqz	a0,802019e8 <wakeup1+0x26>
    panic("wakeup1");
  if(p->chan == p && p->state == SLEEPING) {
    802019d8:	749c                	ld	a5,40(s1)
    802019da:	00978f63          	beq	a5,s1,802019f8 <wakeup1+0x36>
    p->state = RUNNABLE;
  }
}
    802019de:	60e2                	ld	ra,24(sp)
    802019e0:	6442                	ld	s0,16(sp)
    802019e2:	64a2                	ld	s1,8(sp)
    802019e4:	6105                	addi	sp,sp,32
    802019e6:	8082                	ret
    panic("wakeup1");
    802019e8:	00008517          	auipc	a0,0x8
    802019ec:	be050513          	addi	a0,a0,-1056 # 802095c8 <digits+0x248>
    802019f0:	ffffe097          	auipc	ra,0xffffe
    802019f4:	754080e7          	jalr	1876(ra) # 80200144 <panic>
  if(p->chan == p && p->state == SLEEPING) {
    802019f8:	4c98                	lw	a4,24(s1)
    802019fa:	4785                	li	a5,1
    802019fc:	fef711e3          	bne	a4,a5,802019de <wakeup1+0x1c>
    p->state = RUNNABLE;
    80201a00:	4789                	li	a5,2
    80201a02:	cc9c                	sw	a5,24(s1)
}
    80201a04:	bfe9                	j	802019de <wakeup1+0x1c>

0000000080201a06 <reg_info>:
void reg_info(void) {
    80201a06:	1141                	addi	sp,sp,-16
    80201a08:	e406                	sd	ra,8(sp)
    80201a0a:	e022                	sd	s0,0(sp)
    80201a0c:	0800                	addi	s0,sp,16
  printf("register info: {\n");
    80201a0e:	00008517          	auipc	a0,0x8
    80201a12:	bc250513          	addi	a0,a0,-1086 # 802095d0 <digits+0x250>
    80201a16:	ffffe097          	auipc	ra,0xffffe
    80201a1a:	778080e7          	jalr	1912(ra) # 8020018e <printf>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80201a1e:	100025f3          	csrr	a1,sstatus
  printf("sstatus: %p\n", r_sstatus());
    80201a22:	00008517          	auipc	a0,0x8
    80201a26:	bc650513          	addi	a0,a0,-1082 # 802095e8 <digits+0x268>
    80201a2a:	ffffe097          	auipc	ra,0xffffe
    80201a2e:	764080e7          	jalr	1892(ra) # 8020018e <printf>
  asm volatile("csrr %0, sip" : "=r" (x) );
    80201a32:	144025f3          	csrr	a1,sip
  printf("sip: %p\n", r_sip());
    80201a36:	00008517          	auipc	a0,0x8
    80201a3a:	bc250513          	addi	a0,a0,-1086 # 802095f8 <digits+0x278>
    80201a3e:	ffffe097          	auipc	ra,0xffffe
    80201a42:	750080e7          	jalr	1872(ra) # 8020018e <printf>
  asm volatile("csrr %0, sie" : "=r" (x) );
    80201a46:	104025f3          	csrr	a1,sie
  printf("sie: %p\n", r_sie());
    80201a4a:	00008517          	auipc	a0,0x8
    80201a4e:	bbe50513          	addi	a0,a0,-1090 # 80209608 <digits+0x288>
    80201a52:	ffffe097          	auipc	ra,0xffffe
    80201a56:	73c080e7          	jalr	1852(ra) # 8020018e <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80201a5a:	141025f3          	csrr	a1,sepc
  printf("sepc: %p\n", r_sepc());
    80201a5e:	00008517          	auipc	a0,0x8
    80201a62:	bba50513          	addi	a0,a0,-1094 # 80209618 <digits+0x298>
    80201a66:	ffffe097          	auipc	ra,0xffffe
    80201a6a:	728080e7          	jalr	1832(ra) # 8020018e <printf>
  asm volatile("csrr %0, stvec" : "=r" (x) );
    80201a6e:	105025f3          	csrr	a1,stvec
  printf("stvec: %p\n", r_stvec());
    80201a72:	00008517          	auipc	a0,0x8
    80201a76:	bb650513          	addi	a0,a0,-1098 # 80209628 <digits+0x2a8>
    80201a7a:	ffffe097          	auipc	ra,0xffffe
    80201a7e:	714080e7          	jalr	1812(ra) # 8020018e <printf>
  asm volatile("csrr %0, satp" : "=r" (x) );
    80201a82:	180025f3          	csrr	a1,satp
  printf("satp: %p\n", r_satp());
    80201a86:	00008517          	auipc	a0,0x8
    80201a8a:	bb250513          	addi	a0,a0,-1102 # 80209638 <digits+0x2b8>
    80201a8e:	ffffe097          	auipc	ra,0xffffe
    80201a92:	700080e7          	jalr	1792(ra) # 8020018e <printf>
  asm volatile("csrr %0, scause" : "=r" (x) );
    80201a96:	142025f3          	csrr	a1,scause
  printf("scause: %p\n", r_scause());
    80201a9a:	00008517          	auipc	a0,0x8
    80201a9e:	bae50513          	addi	a0,a0,-1106 # 80209648 <digits+0x2c8>
    80201aa2:	ffffe097          	auipc	ra,0xffffe
    80201aa6:	6ec080e7          	jalr	1772(ra) # 8020018e <printf>
  asm volatile("csrr %0, stval" : "=r" (x) );
    80201aaa:	143025f3          	csrr	a1,stval
  printf("stval: %p\n", r_stval());
    80201aae:	00008517          	auipc	a0,0x8
    80201ab2:	baa50513          	addi	a0,a0,-1110 # 80209658 <digits+0x2d8>
    80201ab6:	ffffe097          	auipc	ra,0xffffe
    80201aba:	6d8080e7          	jalr	1752(ra) # 8020018e <printf>
  asm volatile("mv %0, sp" : "=r" (x) );
    80201abe:	858a                	mv	a1,sp
  printf("sp: %p\n", r_sp());
    80201ac0:	00008517          	auipc	a0,0x8
    80201ac4:	ba850513          	addi	a0,a0,-1112 # 80209668 <digits+0x2e8>
    80201ac8:	ffffe097          	auipc	ra,0xffffe
    80201acc:	6c6080e7          	jalr	1734(ra) # 8020018e <printf>
  asm volatile("mv %0, tp" : "=r" (x) );
    80201ad0:	8592                	mv	a1,tp
  printf("tp: %p\n", r_tp());
    80201ad2:	00008517          	auipc	a0,0x8
    80201ad6:	b9e50513          	addi	a0,a0,-1122 # 80209670 <digits+0x2f0>
    80201ada:	ffffe097          	auipc	ra,0xffffe
    80201ade:	6b4080e7          	jalr	1716(ra) # 8020018e <printf>
  asm volatile("mv %0, ra" : "=r" (x) );
    80201ae2:	8586                	mv	a1,ra
  printf("ra: %p\n", r_ra());
    80201ae4:	00008517          	auipc	a0,0x8
    80201ae8:	b9450513          	addi	a0,a0,-1132 # 80209678 <digits+0x2f8>
    80201aec:	ffffe097          	auipc	ra,0xffffe
    80201af0:	6a2080e7          	jalr	1698(ra) # 8020018e <printf>
  printf("}\n");
    80201af4:	00008517          	auipc	a0,0x8
    80201af8:	b8c50513          	addi	a0,a0,-1140 # 80209680 <digits+0x300>
    80201afc:	ffffe097          	auipc	ra,0xffffe
    80201b00:	692080e7          	jalr	1682(ra) # 8020018e <printf>
}
    80201b04:	60a2                	ld	ra,8(sp)
    80201b06:	6402                	ld	s0,0(sp)
    80201b08:	0141                	addi	sp,sp,16
    80201b0a:	8082                	ret

0000000080201b0c <procinit>:
{
    80201b0c:	7179                	addi	sp,sp,-48
    80201b0e:	f406                	sd	ra,40(sp)
    80201b10:	f022                	sd	s0,32(sp)
    80201b12:	ec26                	sd	s1,24(sp)
    80201b14:	e84a                	sd	s2,16(sp)
    80201b16:	e44e                	sd	s3,8(sp)
    80201b18:	1800                	addi	s0,sp,48
  initlock(&pid_lock, "nextpid");
    80201b1a:	00008597          	auipc	a1,0x8
    80201b1e:	b6e58593          	addi	a1,a1,-1170 # 80209688 <digits+0x308>
    80201b22:	0021b517          	auipc	a0,0x21b
    80201b26:	54e50513          	addi	a0,a0,1358 # 8041d070 <pid_lock>
    80201b2a:	fffff097          	auipc	ra,0xfffff
    80201b2e:	b86080e7          	jalr	-1146(ra) # 802006b0 <initlock>
  for(p = proc; p < &proc[NPROC]; p++) {
    80201b32:	0021b497          	auipc	s1,0x21b
    80201b36:	7d648493          	addi	s1,s1,2006 # 8041d308 <proc>
      initlock(&p->lock, "proc");
    80201b3a:	00008997          	auipc	s3,0x8
    80201b3e:	b5698993          	addi	s3,s3,-1194 # 80209690 <digits+0x310>
  for(p = proc; p < &proc[NPROC]; p++) {
    80201b42:	00220917          	auipc	s2,0x220
    80201b46:	13690913          	addi	s2,s2,310 # 80421c78 <initproc>
      initlock(&p->lock, "proc");
    80201b4a:	85ce                	mv	a1,s3
    80201b4c:	8526                	mv	a0,s1
    80201b4e:	fffff097          	auipc	ra,0xfffff
    80201b52:	b62080e7          	jalr	-1182(ra) # 802006b0 <initlock>
  for(p = proc; p < &proc[NPROC]; p++) {
    80201b56:	17848493          	addi	s1,s1,376
    80201b5a:	ff2498e3          	bne	s1,s2,80201b4a <procinit+0x3e>
  memset(cpus, 0, sizeof(cpus));
    80201b5e:	28000613          	li	a2,640
    80201b62:	4581                	li	a1,0
    80201b64:	0021b517          	auipc	a0,0x21b
    80201b68:	52450513          	addi	a0,a0,1316 # 8041d088 <cpus>
    80201b6c:	fffff097          	auipc	ra,0xfffff
    80201b70:	c24080e7          	jalr	-988(ra) # 80200790 <memset>
  printf("procinit\n");
    80201b74:	00008517          	auipc	a0,0x8
    80201b78:	b2450513          	addi	a0,a0,-1244 # 80209698 <digits+0x318>
    80201b7c:	ffffe097          	auipc	ra,0xffffe
    80201b80:	612080e7          	jalr	1554(ra) # 8020018e <printf>
}
    80201b84:	70a2                	ld	ra,40(sp)
    80201b86:	7402                	ld	s0,32(sp)
    80201b88:	64e2                	ld	s1,24(sp)
    80201b8a:	6942                	ld	s2,16(sp)
    80201b8c:	69a2                	ld	s3,8(sp)
    80201b8e:	6145                	addi	sp,sp,48
    80201b90:	8082                	ret

0000000080201b92 <cpuid>:
{
    80201b92:	1141                	addi	sp,sp,-16
    80201b94:	e422                	sd	s0,8(sp)
    80201b96:	0800                	addi	s0,sp,16
  asm volatile("mv %0, tp" : "=r" (x) );
    80201b98:	8512                	mv	a0,tp
}
    80201b9a:	2501                	sext.w	a0,a0
    80201b9c:	6422                	ld	s0,8(sp)
    80201b9e:	0141                	addi	sp,sp,16
    80201ba0:	8082                	ret

0000000080201ba2 <mycpu>:
mycpu(void) {
    80201ba2:	1141                	addi	sp,sp,-16
    80201ba4:	e422                	sd	s0,8(sp)
    80201ba6:	0800                	addi	s0,sp,16
    80201ba8:	8792                	mv	a5,tp
  struct cpu *c = &cpus[id];
    80201baa:	2781                	sext.w	a5,a5
    80201bac:	079e                	slli	a5,a5,0x7
}
    80201bae:	0021b517          	auipc	a0,0x21b
    80201bb2:	4da50513          	addi	a0,a0,1242 # 8041d088 <cpus>
    80201bb6:	953e                	add	a0,a0,a5
    80201bb8:	6422                	ld	s0,8(sp)
    80201bba:	0141                	addi	sp,sp,16
    80201bbc:	8082                	ret

0000000080201bbe <myproc>:
myproc(void) {
    80201bbe:	1101                	addi	sp,sp,-32
    80201bc0:	ec06                	sd	ra,24(sp)
    80201bc2:	e822                	sd	s0,16(sp)
    80201bc4:	e426                	sd	s1,8(sp)
    80201bc6:	1000                	addi	s0,sp,32
  push_off();
    80201bc8:	fffff097          	auipc	ra,0xfffff
    80201bcc:	a3c080e7          	jalr	-1476(ra) # 80200604 <push_off>
    80201bd0:	8792                	mv	a5,tp
  struct proc *p = c->proc;
    80201bd2:	2781                	sext.w	a5,a5
    80201bd4:	079e                	slli	a5,a5,0x7
    80201bd6:	0021b717          	auipc	a4,0x21b
    80201bda:	49a70713          	addi	a4,a4,1178 # 8041d070 <pid_lock>
    80201bde:	97ba                	add	a5,a5,a4
    80201be0:	6f84                	ld	s1,24(a5)
  pop_off();
    80201be2:	fffff097          	auipc	ra,0xfffff
    80201be6:	a6e080e7          	jalr	-1426(ra) # 80200650 <pop_off>
}
    80201bea:	8526                	mv	a0,s1
    80201bec:	60e2                	ld	ra,24(sp)
    80201bee:	6442                	ld	s0,16(sp)
    80201bf0:	64a2                	ld	s1,8(sp)
    80201bf2:	6105                	addi	sp,sp,32
    80201bf4:	8082                	ret

0000000080201bf6 <forkret>:
{
    80201bf6:	1101                	addi	sp,sp,-32
    80201bf8:	ec06                	sd	ra,24(sp)
    80201bfa:	e822                	sd	s0,16(sp)
    80201bfc:	e426                	sd	s1,8(sp)
    80201bfe:	1000                	addi	s0,sp,32
  release(&myproc()->lock);
    80201c00:	00000097          	auipc	ra,0x0
    80201c04:	fbe080e7          	jalr	-66(ra) # 80201bbe <myproc>
    80201c08:	fffff097          	auipc	ra,0xfffff
    80201c0c:	b40080e7          	jalr	-1216(ra) # 80200748 <release>
  if (first) {
    80201c10:	0020a797          	auipc	a5,0x20a
    80201c14:	4387a783          	lw	a5,1080(a5) # 8040c048 <first.1685>
    80201c18:	eb91                	bnez	a5,80201c2c <forkret+0x36>
  usertrapret();
    80201c1a:	00001097          	auipc	ra,0x1
    80201c1e:	c64080e7          	jalr	-924(ra) # 8020287e <usertrapret>
}
    80201c22:	60e2                	ld	ra,24(sp)
    80201c24:	6442                	ld	s0,16(sp)
    80201c26:	64a2                	ld	s1,8(sp)
    80201c28:	6105                	addi	sp,sp,32
    80201c2a:	8082                	ret
    first = 0;
    80201c2c:	0020a797          	auipc	a5,0x20a
    80201c30:	4007ae23          	sw	zero,1052(a5) # 8040c048 <first.1685>
    fat32_init();
    80201c34:	00004097          	auipc	ra,0x4
    80201c38:	326080e7          	jalr	806(ra) # 80205f5a <fat32_init>
    myproc()->cwd = ename("/");
    80201c3c:	00000097          	auipc	ra,0x0
    80201c40:	f82080e7          	jalr	-126(ra) # 80201bbe <myproc>
    80201c44:	84aa                	mv	s1,a0
    80201c46:	00008517          	auipc	a0,0x8
    80201c4a:	a6250513          	addi	a0,a0,-1438 # 802096a8 <digits+0x328>
    80201c4e:	00005097          	auipc	ra,0x5
    80201c52:	5be080e7          	jalr	1470(ra) # 8020720c <ename>
    80201c56:	14a4bc23          	sd	a0,344(s1)
    80201c5a:	b7c1                	j	80201c1a <forkret+0x24>

0000000080201c5c <allocpid>:
allocpid() {
    80201c5c:	1101                	addi	sp,sp,-32
    80201c5e:	ec06                	sd	ra,24(sp)
    80201c60:	e822                	sd	s0,16(sp)
    80201c62:	e426                	sd	s1,8(sp)
    80201c64:	e04a                	sd	s2,0(sp)
    80201c66:	1000                	addi	s0,sp,32
  acquire(&pid_lock);
    80201c68:	0021b917          	auipc	s2,0x21b
    80201c6c:	40890913          	addi	s2,s2,1032 # 8041d070 <pid_lock>
    80201c70:	854a                	mv	a0,s2
    80201c72:	fffff097          	auipc	ra,0xfffff
    80201c76:	a82080e7          	jalr	-1406(ra) # 802006f4 <acquire>
  pid = nextpid;
    80201c7a:	0020a797          	auipc	a5,0x20a
    80201c7e:	3d278793          	addi	a5,a5,978 # 8040c04c <nextpid>
    80201c82:	4384                	lw	s1,0(a5)
  nextpid = nextpid + 1;
    80201c84:	0014871b          	addiw	a4,s1,1
    80201c88:	c398                	sw	a4,0(a5)
  release(&pid_lock);
    80201c8a:	854a                	mv	a0,s2
    80201c8c:	fffff097          	auipc	ra,0xfffff
    80201c90:	abc080e7          	jalr	-1348(ra) # 80200748 <release>
}
    80201c94:	8526                	mv	a0,s1
    80201c96:	60e2                	ld	ra,24(sp)
    80201c98:	6442                	ld	s0,16(sp)
    80201c9a:	64a2                	ld	s1,8(sp)
    80201c9c:	6902                	ld	s2,0(sp)
    80201c9e:	6105                	addi	sp,sp,32
    80201ca0:	8082                	ret

0000000080201ca2 <proc_pagetable>:
{
    80201ca2:	1101                	addi	sp,sp,-32
    80201ca4:	ec06                	sd	ra,24(sp)
    80201ca6:	e822                	sd	s0,16(sp)
    80201ca8:	e426                	sd	s1,8(sp)
    80201caa:	e04a                	sd	s2,0(sp)
    80201cac:	1000                	addi	s0,sp,32
    80201cae:	892a                	mv	s2,a0
  pagetable = uvmcreate();
    80201cb0:	fffff097          	auipc	ra,0xfffff
    80201cb4:	39a080e7          	jalr	922(ra) # 8020104a <uvmcreate>
    80201cb8:	84aa                	mv	s1,a0
  if(pagetable == 0)
    80201cba:	c121                	beqz	a0,80201cfa <proc_pagetable+0x58>
  if(mappages(pagetable, TRAMPOLINE, PGSIZE,
    80201cbc:	4729                	li	a4,10
    80201cbe:	00006697          	auipc	a3,0x6
    80201cc2:	34268693          	addi	a3,a3,834 # 80208000 <_trampoline>
    80201cc6:	6605                	lui	a2,0x1
    80201cc8:	040005b7          	lui	a1,0x4000
    80201ccc:	15fd                	addi	a1,a1,-1
    80201cce:	05b2                	slli	a1,a1,0xc
    80201cd0:	fffff097          	auipc	ra,0xfffff
    80201cd4:	060080e7          	jalr	96(ra) # 80200d30 <mappages>
    80201cd8:	02054863          	bltz	a0,80201d08 <proc_pagetable+0x66>
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
    80201cdc:	4719                	li	a4,6
    80201cde:	06093683          	ld	a3,96(s2)
    80201ce2:	6605                	lui	a2,0x1
    80201ce4:	020005b7          	lui	a1,0x2000
    80201ce8:	15fd                	addi	a1,a1,-1
    80201cea:	05b6                	slli	a1,a1,0xd
    80201cec:	8526                	mv	a0,s1
    80201cee:	fffff097          	auipc	ra,0xfffff
    80201cf2:	042080e7          	jalr	66(ra) # 80200d30 <mappages>
    80201cf6:	02054163          	bltz	a0,80201d18 <proc_pagetable+0x76>
}
    80201cfa:	8526                	mv	a0,s1
    80201cfc:	60e2                	ld	ra,24(sp)
    80201cfe:	6442                	ld	s0,16(sp)
    80201d00:	64a2                	ld	s1,8(sp)
    80201d02:	6902                	ld	s2,0(sp)
    80201d04:	6105                	addi	sp,sp,32
    80201d06:	8082                	ret
    uvmfree(pagetable, 0);
    80201d08:	4581                	li	a1,0
    80201d0a:	8526                	mv	a0,s1
    80201d0c:	fffff097          	auipc	ra,0xfffff
    80201d10:	5c2080e7          	jalr	1474(ra) # 802012ce <uvmfree>
    return NULL;
    80201d14:	4481                	li	s1,0
    80201d16:	b7d5                	j	80201cfa <proc_pagetable+0x58>
    vmunmap(pagetable, TRAMPOLINE, 1, 0);
    80201d18:	4681                	li	a3,0
    80201d1a:	4605                	li	a2,1
    80201d1c:	040005b7          	lui	a1,0x4000
    80201d20:	15fd                	addi	a1,a1,-1
    80201d22:	05b2                	slli	a1,a1,0xc
    80201d24:	8526                	mv	a0,s1
    80201d26:	fffff097          	auipc	ra,0xfffff
    80201d2a:	260080e7          	jalr	608(ra) # 80200f86 <vmunmap>
    uvmfree(pagetable, 0);
    80201d2e:	4581                	li	a1,0
    80201d30:	8526                	mv	a0,s1
    80201d32:	fffff097          	auipc	ra,0xfffff
    80201d36:	59c080e7          	jalr	1436(ra) # 802012ce <uvmfree>
    return NULL;
    80201d3a:	4481                	li	s1,0
    80201d3c:	bf7d                	j	80201cfa <proc_pagetable+0x58>

0000000080201d3e <proc_freepagetable>:
{
    80201d3e:	1101                	addi	sp,sp,-32
    80201d40:	ec06                	sd	ra,24(sp)
    80201d42:	e822                	sd	s0,16(sp)
    80201d44:	e426                	sd	s1,8(sp)
    80201d46:	e04a                	sd	s2,0(sp)
    80201d48:	1000                	addi	s0,sp,32
    80201d4a:	84aa                	mv	s1,a0
    80201d4c:	892e                	mv	s2,a1
  vmunmap(pagetable, TRAMPOLINE, 1, 0);
    80201d4e:	4681                	li	a3,0
    80201d50:	4605                	li	a2,1
    80201d52:	040005b7          	lui	a1,0x4000
    80201d56:	15fd                	addi	a1,a1,-1
    80201d58:	05b2                	slli	a1,a1,0xc
    80201d5a:	fffff097          	auipc	ra,0xfffff
    80201d5e:	22c080e7          	jalr	556(ra) # 80200f86 <vmunmap>
  vmunmap(pagetable, TRAPFRAME, 1, 0);
    80201d62:	4681                	li	a3,0
    80201d64:	4605                	li	a2,1
    80201d66:	020005b7          	lui	a1,0x2000
    80201d6a:	15fd                	addi	a1,a1,-1
    80201d6c:	05b6                	slli	a1,a1,0xd
    80201d6e:	8526                	mv	a0,s1
    80201d70:	fffff097          	auipc	ra,0xfffff
    80201d74:	216080e7          	jalr	534(ra) # 80200f86 <vmunmap>
  uvmfree(pagetable, sz);
    80201d78:	85ca                	mv	a1,s2
    80201d7a:	8526                	mv	a0,s1
    80201d7c:	fffff097          	auipc	ra,0xfffff
    80201d80:	552080e7          	jalr	1362(ra) # 802012ce <uvmfree>
}
    80201d84:	60e2                	ld	ra,24(sp)
    80201d86:	6442                	ld	s0,16(sp)
    80201d88:	64a2                	ld	s1,8(sp)
    80201d8a:	6902                	ld	s2,0(sp)
    80201d8c:	6105                	addi	sp,sp,32
    80201d8e:	8082                	ret

0000000080201d90 <freeproc>:
{
    80201d90:	1101                	addi	sp,sp,-32
    80201d92:	ec06                	sd	ra,24(sp)
    80201d94:	e822                	sd	s0,16(sp)
    80201d96:	e426                	sd	s1,8(sp)
    80201d98:	1000                	addi	s0,sp,32
    80201d9a:	84aa                	mv	s1,a0
  if(p->trapframe)
    80201d9c:	7128                	ld	a0,96(a0)
    80201d9e:	c509                	beqz	a0,80201da8 <freeproc+0x18>
    kfree((void*)p->trapframe);
    80201da0:	ffffe097          	auipc	ra,0xffffe
    80201da4:	6a6080e7          	jalr	1702(ra) # 80200446 <kfree>
  p->trapframe = 0;
    80201da8:	0604b023          	sd	zero,96(s1)
  if (p->kpagetable) {
    80201dac:	6ca8                	ld	a0,88(s1)
    80201dae:	c511                	beqz	a0,80201dba <freeproc+0x2a>
    kvmfree(p->kpagetable, 1);
    80201db0:	4585                	li	a1,1
    80201db2:	00000097          	auipc	ra,0x0
    80201db6:	a22080e7          	jalr	-1502(ra) # 802017d4 <kvmfree>
  p->kpagetable = 0;
    80201dba:	0404bc23          	sd	zero,88(s1)
  if(p->pagetable)
    80201dbe:	68a8                	ld	a0,80(s1)
    80201dc0:	c511                	beqz	a0,80201dcc <freeproc+0x3c>
    proc_freepagetable(p->pagetable, p->sz);
    80201dc2:	64ac                	ld	a1,72(s1)
    80201dc4:	00000097          	auipc	ra,0x0
    80201dc8:	f7a080e7          	jalr	-134(ra) # 80201d3e <proc_freepagetable>
  p->pagetable = 0;
    80201dcc:	0404b823          	sd	zero,80(s1)
  p->sz = 0;
    80201dd0:	0404b423          	sd	zero,72(s1)
  p->pid = 0;
    80201dd4:	0204ac23          	sw	zero,56(s1)
  p->parent = 0;
    80201dd8:	0204b023          	sd	zero,32(s1)
  p->name[0] = 0;
    80201ddc:	16048023          	sb	zero,352(s1)
  p->chan = 0;
    80201de0:	0204b423          	sd	zero,40(s1)
  p->killed = 0;
    80201de4:	0204a823          	sw	zero,48(s1)
  p->xstate = 0;
    80201de8:	0204aa23          	sw	zero,52(s1)
  p->state = UNUSED;
    80201dec:	0004ac23          	sw	zero,24(s1)
}
    80201df0:	60e2                	ld	ra,24(sp)
    80201df2:	6442                	ld	s0,16(sp)
    80201df4:	64a2                	ld	s1,8(sp)
    80201df6:	6105                	addi	sp,sp,32
    80201df8:	8082                	ret

0000000080201dfa <allocproc>:
{
    80201dfa:	1101                	addi	sp,sp,-32
    80201dfc:	ec06                	sd	ra,24(sp)
    80201dfe:	e822                	sd	s0,16(sp)
    80201e00:	e426                	sd	s1,8(sp)
    80201e02:	e04a                	sd	s2,0(sp)
    80201e04:	1000                	addi	s0,sp,32
  for(p = proc; p < &proc[NPROC]; p++) {
    80201e06:	0021b497          	auipc	s1,0x21b
    80201e0a:	50248493          	addi	s1,s1,1282 # 8041d308 <proc>
    80201e0e:	00220917          	auipc	s2,0x220
    80201e12:	e6a90913          	addi	s2,s2,-406 # 80421c78 <initproc>
    acquire(&p->lock);
    80201e16:	8526                	mv	a0,s1
    80201e18:	fffff097          	auipc	ra,0xfffff
    80201e1c:	8dc080e7          	jalr	-1828(ra) # 802006f4 <acquire>
    if(p->state == UNUSED) {
    80201e20:	4c9c                	lw	a5,24(s1)
    80201e22:	cf81                	beqz	a5,80201e3a <allocproc+0x40>
      release(&p->lock);
    80201e24:	8526                	mv	a0,s1
    80201e26:	fffff097          	auipc	ra,0xfffff
    80201e2a:	922080e7          	jalr	-1758(ra) # 80200748 <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    80201e2e:	17848493          	addi	s1,s1,376
    80201e32:	ff2492e3          	bne	s1,s2,80201e16 <allocproc+0x1c>
  return NULL;
    80201e36:	4481                	li	s1,0
    80201e38:	a085                	j	80201e98 <allocproc+0x9e>
  p->pid = allocpid();
    80201e3a:	00000097          	auipc	ra,0x0
    80201e3e:	e22080e7          	jalr	-478(ra) # 80201c5c <allocpid>
    80201e42:	dc88                	sw	a0,56(s1)
  if((p->trapframe = (struct trapframe *)kalloc()) == NULL){
    80201e44:	ffffe097          	auipc	ra,0xffffe
    80201e48:	744080e7          	jalr	1860(ra) # 80200588 <kalloc>
    80201e4c:	892a                	mv	s2,a0
    80201e4e:	f0a8                	sd	a0,96(s1)
    80201e50:	c939                	beqz	a0,80201ea6 <allocproc+0xac>
  if ((p->pagetable = proc_pagetable(p)) == NULL ||
    80201e52:	8526                	mv	a0,s1
    80201e54:	00000097          	auipc	ra,0x0
    80201e58:	e4e080e7          	jalr	-434(ra) # 80201ca2 <proc_pagetable>
    80201e5c:	e8a8                	sd	a0,80(s1)
    80201e5e:	c939                	beqz	a0,80201eb4 <allocproc+0xba>
      (p->kpagetable = proc_kpagetable()) == NULL) {
    80201e60:	00000097          	auipc	ra,0x0
    80201e64:	9ce080e7          	jalr	-1586(ra) # 8020182e <proc_kpagetable>
    80201e68:	eca8                	sd	a0,88(s1)
  if ((p->pagetable = proc_pagetable(p)) == NULL ||
    80201e6a:	c529                	beqz	a0,80201eb4 <allocproc+0xba>
  p->kstack = VKSTACK;
    80201e6c:	0fb00793          	li	a5,251
    80201e70:	07fa                	slli	a5,a5,0x1e
    80201e72:	e0bc                	sd	a5,64(s1)
  memset(&p->context, 0, sizeof(p->context));
    80201e74:	07000613          	li	a2,112
    80201e78:	4581                	li	a1,0
    80201e7a:	06848513          	addi	a0,s1,104
    80201e7e:	fffff097          	auipc	ra,0xfffff
    80201e82:	912080e7          	jalr	-1774(ra) # 80200790 <memset>
  p->context.ra = (uint64)forkret;
    80201e86:	00000797          	auipc	a5,0x0
    80201e8a:	d7078793          	addi	a5,a5,-656 # 80201bf6 <forkret>
    80201e8e:	f4bc                	sd	a5,104(s1)
  p->context.sp = p->kstack + PGSIZE;
    80201e90:	60bc                	ld	a5,64(s1)
    80201e92:	6705                	lui	a4,0x1
    80201e94:	97ba                	add	a5,a5,a4
    80201e96:	f8bc                	sd	a5,112(s1)
}
    80201e98:	8526                	mv	a0,s1
    80201e9a:	60e2                	ld	ra,24(sp)
    80201e9c:	6442                	ld	s0,16(sp)
    80201e9e:	64a2                	ld	s1,8(sp)
    80201ea0:	6902                	ld	s2,0(sp)
    80201ea2:	6105                	addi	sp,sp,32
    80201ea4:	8082                	ret
    release(&p->lock);
    80201ea6:	8526                	mv	a0,s1
    80201ea8:	fffff097          	auipc	ra,0xfffff
    80201eac:	8a0080e7          	jalr	-1888(ra) # 80200748 <release>
    return NULL;
    80201eb0:	84ca                	mv	s1,s2
    80201eb2:	b7dd                	j	80201e98 <allocproc+0x9e>
    freeproc(p);
    80201eb4:	8526                	mv	a0,s1
    80201eb6:	00000097          	auipc	ra,0x0
    80201eba:	eda080e7          	jalr	-294(ra) # 80201d90 <freeproc>
    release(&p->lock);
    80201ebe:	8526                	mv	a0,s1
    80201ec0:	fffff097          	auipc	ra,0xfffff
    80201ec4:	888080e7          	jalr	-1912(ra) # 80200748 <release>
    return NULL;
    80201ec8:	4481                	li	s1,0
    80201eca:	b7f9                	j	80201e98 <allocproc+0x9e>

0000000080201ecc <userinit>:
{
    80201ecc:	1101                	addi	sp,sp,-32
    80201ece:	ec06                	sd	ra,24(sp)
    80201ed0:	e822                	sd	s0,16(sp)
    80201ed2:	e426                	sd	s1,8(sp)
    80201ed4:	1000                	addi	s0,sp,32
  p = allocproc();
    80201ed6:	00000097          	auipc	ra,0x0
    80201eda:	f24080e7          	jalr	-220(ra) # 80201dfa <allocproc>
    80201ede:	84aa                	mv	s1,a0
  initproc = p;
    80201ee0:	00220797          	auipc	a5,0x220
    80201ee4:	d8a7bc23          	sd	a0,-616(a5) # 80421c78 <initproc>
  uvminit(p->pagetable , p->kpagetable, initcode, sizeof(initcode));
    80201ee8:	03400693          	li	a3,52
    80201eec:	0020a617          	auipc	a2,0x20a
    80201ef0:	11460613          	addi	a2,a2,276 # 8040c000 <initcode>
    80201ef4:	6d2c                	ld	a1,88(a0)
    80201ef6:	6928                	ld	a0,80(a0)
    80201ef8:	fffff097          	auipc	ra,0xfffff
    80201efc:	180080e7          	jalr	384(ra) # 80201078 <uvminit>
  p->sz = PGSIZE;
    80201f00:	6785                	lui	a5,0x1
    80201f02:	e4bc                	sd	a5,72(s1)
  p->trapframe->epc = 0x0;      // user program counter
    80201f04:	70b8                	ld	a4,96(s1)
    80201f06:	00073c23          	sd	zero,24(a4) # 1018 <_entry-0x801fefe8>
  p->trapframe->sp = PGSIZE;  // user stack pointer
    80201f0a:	70b8                	ld	a4,96(s1)
    80201f0c:	fb1c                	sd	a5,48(a4)
  safestrcpy(p->name, "initcode", sizeof(p->name));
    80201f0e:	4641                	li	a2,16
    80201f10:	00007597          	auipc	a1,0x7
    80201f14:	7a058593          	addi	a1,a1,1952 # 802096b0 <digits+0x330>
    80201f18:	16048513          	addi	a0,s1,352
    80201f1c:	fffff097          	auipc	ra,0xfffff
    80201f20:	9ca080e7          	jalr	-1590(ra) # 802008e6 <safestrcpy>
  p->state = RUNNABLE;
    80201f24:	4789                	li	a5,2
    80201f26:	cc9c                	sw	a5,24(s1)
  p->tmask = 0;
    80201f28:	1604a823          	sw	zero,368(s1)
  release(&p->lock);
    80201f2c:	8526                	mv	a0,s1
    80201f2e:	fffff097          	auipc	ra,0xfffff
    80201f32:	81a080e7          	jalr	-2022(ra) # 80200748 <release>
  printf("userinit\n");
    80201f36:	00007517          	auipc	a0,0x7
    80201f3a:	78a50513          	addi	a0,a0,1930 # 802096c0 <digits+0x340>
    80201f3e:	ffffe097          	auipc	ra,0xffffe
    80201f42:	250080e7          	jalr	592(ra) # 8020018e <printf>
}
    80201f46:	60e2                	ld	ra,24(sp)
    80201f48:	6442                	ld	s0,16(sp)
    80201f4a:	64a2                	ld	s1,8(sp)
    80201f4c:	6105                	addi	sp,sp,32
    80201f4e:	8082                	ret

0000000080201f50 <growproc>:
{
    80201f50:	1101                	addi	sp,sp,-32
    80201f52:	ec06                	sd	ra,24(sp)
    80201f54:	e822                	sd	s0,16(sp)
    80201f56:	e426                	sd	s1,8(sp)
    80201f58:	e04a                	sd	s2,0(sp)
    80201f5a:	1000                	addi	s0,sp,32
    80201f5c:	84aa                	mv	s1,a0
  struct proc *p = myproc();
    80201f5e:	00000097          	auipc	ra,0x0
    80201f62:	c60080e7          	jalr	-928(ra) # 80201bbe <myproc>
    80201f66:	892a                	mv	s2,a0
  sz = p->sz;
    80201f68:	6530                	ld	a2,72(a0)
    80201f6a:	0006069b          	sext.w	a3,a2
  if(n > 0){
    80201f6e:	00904f63          	bgtz	s1,80201f8c <growproc+0x3c>
  } else if(n < 0){
    80201f72:	0204cd63          	bltz	s1,80201fac <growproc+0x5c>
  p->sz = sz;
    80201f76:	1682                	slli	a3,a3,0x20
    80201f78:	9281                	srli	a3,a3,0x20
    80201f7a:	04d93423          	sd	a3,72(s2)
  return 0;
    80201f7e:	4501                	li	a0,0
}
    80201f80:	60e2                	ld	ra,24(sp)
    80201f82:	6442                	ld	s0,16(sp)
    80201f84:	64a2                	ld	s1,8(sp)
    80201f86:	6902                	ld	s2,0(sp)
    80201f88:	6105                	addi	sp,sp,32
    80201f8a:	8082                	ret
    if((sz = uvmalloc(p->pagetable, p->kpagetable, sz, sz + n)) == 0) {
    80201f8c:	9ea5                	addw	a3,a3,s1
    80201f8e:	1682                	slli	a3,a3,0x20
    80201f90:	9281                	srli	a3,a3,0x20
    80201f92:	1602                	slli	a2,a2,0x20
    80201f94:	9201                	srli	a2,a2,0x20
    80201f96:	6d2c                	ld	a1,88(a0)
    80201f98:	6928                	ld	a0,80(a0)
    80201f9a:	fffff097          	auipc	ra,0xfffff
    80201f9e:	1d4080e7          	jalr	468(ra) # 8020116e <uvmalloc>
    80201fa2:	0005069b          	sext.w	a3,a0
    80201fa6:	fae1                	bnez	a3,80201f76 <growproc+0x26>
      return -1;
    80201fa8:	557d                	li	a0,-1
    80201faa:	bfd9                	j	80201f80 <growproc+0x30>
    sz = uvmdealloc(p->pagetable, p->kpagetable, sz, sz + n);
    80201fac:	9ea5                	addw	a3,a3,s1
    80201fae:	1682                	slli	a3,a3,0x20
    80201fb0:	9281                	srli	a3,a3,0x20
    80201fb2:	1602                	slli	a2,a2,0x20
    80201fb4:	9201                	srli	a2,a2,0x20
    80201fb6:	6d2c                	ld	a1,88(a0)
    80201fb8:	6928                	ld	a0,80(a0)
    80201fba:	fffff097          	auipc	ra,0xfffff
    80201fbe:	148080e7          	jalr	328(ra) # 80201102 <uvmdealloc>
    80201fc2:	0005069b          	sext.w	a3,a0
    80201fc6:	bf45                	j	80201f76 <growproc+0x26>

0000000080201fc8 <fork>:
{
    80201fc8:	7179                	addi	sp,sp,-48
    80201fca:	f406                	sd	ra,40(sp)
    80201fcc:	f022                	sd	s0,32(sp)
    80201fce:	ec26                	sd	s1,24(sp)
    80201fd0:	e84a                	sd	s2,16(sp)
    80201fd2:	e44e                	sd	s3,8(sp)
    80201fd4:	e052                	sd	s4,0(sp)
    80201fd6:	1800                	addi	s0,sp,48
  struct proc *p = myproc();
    80201fd8:	00000097          	auipc	ra,0x0
    80201fdc:	be6080e7          	jalr	-1050(ra) # 80201bbe <myproc>
    80201fe0:	892a                	mv	s2,a0
  if((np = allocproc()) == NULL){
    80201fe2:	00000097          	auipc	ra,0x0
    80201fe6:	e18080e7          	jalr	-488(ra) # 80201dfa <allocproc>
    80201fea:	c57d                	beqz	a0,802020d8 <fork+0x110>
    80201fec:	89aa                	mv	s3,a0
  if(uvmcopy(p->pagetable, np->pagetable, np->kpagetable, p->sz) < 0){
    80201fee:	04893683          	ld	a3,72(s2)
    80201ff2:	6d30                	ld	a2,88(a0)
    80201ff4:	692c                	ld	a1,80(a0)
    80201ff6:	05093503          	ld	a0,80(s2)
    80201ffa:	fffff097          	auipc	ra,0xfffff
    80201ffe:	30c080e7          	jalr	780(ra) # 80201306 <uvmcopy>
    80202002:	04054c63          	bltz	a0,8020205a <fork+0x92>
  np->sz = p->sz;
    80202006:	04893783          	ld	a5,72(s2)
    8020200a:	04f9b423          	sd	a5,72(s3)
  np->parent = p;
    8020200e:	0329b023          	sd	s2,32(s3)
  np->tmask = p->tmask;
    80202012:	17092783          	lw	a5,368(s2)
    80202016:	16f9a823          	sw	a5,368(s3)
  *(np->trapframe) = *(p->trapframe);
    8020201a:	06093683          	ld	a3,96(s2)
    8020201e:	87b6                	mv	a5,a3
    80202020:	0609b703          	ld	a4,96(s3)
    80202024:	12068693          	addi	a3,a3,288
    80202028:	0007b803          	ld	a6,0(a5) # 1000 <_entry-0x801ff000>
    8020202c:	6788                	ld	a0,8(a5)
    8020202e:	6b8c                	ld	a1,16(a5)
    80202030:	6f90                	ld	a2,24(a5)
    80202032:	01073023          	sd	a6,0(a4)
    80202036:	e708                	sd	a0,8(a4)
    80202038:	eb0c                	sd	a1,16(a4)
    8020203a:	ef10                	sd	a2,24(a4)
    8020203c:	02078793          	addi	a5,a5,32
    80202040:	02070713          	addi	a4,a4,32
    80202044:	fed792e3          	bne	a5,a3,80202028 <fork+0x60>
  np->trapframe->a0 = 0;
    80202048:	0609b783          	ld	a5,96(s3)
    8020204c:	0607b823          	sd	zero,112(a5)
    80202050:	0d800493          	li	s1,216
  for(i = 0; i < NOFILE; i++)
    80202054:	15800a13          	li	s4,344
    80202058:	a03d                	j	80202086 <fork+0xbe>
    freeproc(np);
    8020205a:	854e                	mv	a0,s3
    8020205c:	00000097          	auipc	ra,0x0
    80202060:	d34080e7          	jalr	-716(ra) # 80201d90 <freeproc>
    release(&np->lock);
    80202064:	854e                	mv	a0,s3
    80202066:	ffffe097          	auipc	ra,0xffffe
    8020206a:	6e2080e7          	jalr	1762(ra) # 80200748 <release>
    return -1;
    8020206e:	54fd                	li	s1,-1
    80202070:	a899                	j	802020c6 <fork+0xfe>
      np->ofile[i] = filedup(p->ofile[i]);
    80202072:	00002097          	auipc	ra,0x2
    80202076:	8ea080e7          	jalr	-1814(ra) # 8020395c <filedup>
    8020207a:	009987b3          	add	a5,s3,s1
    8020207e:	e388                	sd	a0,0(a5)
  for(i = 0; i < NOFILE; i++)
    80202080:	04a1                	addi	s1,s1,8
    80202082:	01448763          	beq	s1,s4,80202090 <fork+0xc8>
    if(p->ofile[i])
    80202086:	009907b3          	add	a5,s2,s1
    8020208a:	6388                	ld	a0,0(a5)
    8020208c:	f17d                	bnez	a0,80202072 <fork+0xaa>
    8020208e:	bfcd                	j	80202080 <fork+0xb8>
  np->cwd = edup(p->cwd);
    80202090:	15893503          	ld	a0,344(s2)
    80202094:	00004097          	auipc	ra,0x4
    80202098:	784080e7          	jalr	1924(ra) # 80206818 <edup>
    8020209c:	14a9bc23          	sd	a0,344(s3)
  safestrcpy(np->name, p->name, sizeof(p->name));
    802020a0:	4641                	li	a2,16
    802020a2:	16090593          	addi	a1,s2,352
    802020a6:	16098513          	addi	a0,s3,352
    802020aa:	fffff097          	auipc	ra,0xfffff
    802020ae:	83c080e7          	jalr	-1988(ra) # 802008e6 <safestrcpy>
  pid = np->pid;
    802020b2:	0389a483          	lw	s1,56(s3)
  np->state = RUNNABLE;
    802020b6:	4789                	li	a5,2
    802020b8:	00f9ac23          	sw	a5,24(s3)
  release(&np->lock);
    802020bc:	854e                	mv	a0,s3
    802020be:	ffffe097          	auipc	ra,0xffffe
    802020c2:	68a080e7          	jalr	1674(ra) # 80200748 <release>
}
    802020c6:	8526                	mv	a0,s1
    802020c8:	70a2                	ld	ra,40(sp)
    802020ca:	7402                	ld	s0,32(sp)
    802020cc:	64e2                	ld	s1,24(sp)
    802020ce:	6942                	ld	s2,16(sp)
    802020d0:	69a2                	ld	s3,8(sp)
    802020d2:	6a02                	ld	s4,0(sp)
    802020d4:	6145                	addi	sp,sp,48
    802020d6:	8082                	ret
    return -1;
    802020d8:	54fd                	li	s1,-1
    802020da:	b7f5                	j	802020c6 <fork+0xfe>

00000000802020dc <reparent>:
{
    802020dc:	7179                	addi	sp,sp,-48
    802020de:	f406                	sd	ra,40(sp)
    802020e0:	f022                	sd	s0,32(sp)
    802020e2:	ec26                	sd	s1,24(sp)
    802020e4:	e84a                	sd	s2,16(sp)
    802020e6:	e44e                	sd	s3,8(sp)
    802020e8:	e052                	sd	s4,0(sp)
    802020ea:	1800                	addi	s0,sp,48
    802020ec:	892a                	mv	s2,a0
  for(pp = proc; pp < &proc[NPROC]; pp++){
    802020ee:	0021b497          	auipc	s1,0x21b
    802020f2:	21a48493          	addi	s1,s1,538 # 8041d308 <proc>
      pp->parent = initproc;
    802020f6:	00220a17          	auipc	s4,0x220
    802020fa:	b82a0a13          	addi	s4,s4,-1150 # 80421c78 <initproc>
  for(pp = proc; pp < &proc[NPROC]; pp++){
    802020fe:	00220997          	auipc	s3,0x220
    80202102:	b7a98993          	addi	s3,s3,-1158 # 80421c78 <initproc>
    80202106:	a029                	j	80202110 <reparent+0x34>
    80202108:	17848493          	addi	s1,s1,376
    8020210c:	03348363          	beq	s1,s3,80202132 <reparent+0x56>
    if(pp->parent == p){
    80202110:	709c                	ld	a5,32(s1)
    80202112:	ff279be3          	bne	a5,s2,80202108 <reparent+0x2c>
      acquire(&pp->lock);
    80202116:	8526                	mv	a0,s1
    80202118:	ffffe097          	auipc	ra,0xffffe
    8020211c:	5dc080e7          	jalr	1500(ra) # 802006f4 <acquire>
      pp->parent = initproc;
    80202120:	000a3783          	ld	a5,0(s4)
    80202124:	f09c                	sd	a5,32(s1)
      release(&pp->lock);
    80202126:	8526                	mv	a0,s1
    80202128:	ffffe097          	auipc	ra,0xffffe
    8020212c:	620080e7          	jalr	1568(ra) # 80200748 <release>
    80202130:	bfe1                	j	80202108 <reparent+0x2c>
}
    80202132:	70a2                	ld	ra,40(sp)
    80202134:	7402                	ld	s0,32(sp)
    80202136:	64e2                	ld	s1,24(sp)
    80202138:	6942                	ld	s2,16(sp)
    8020213a:	69a2                	ld	s3,8(sp)
    8020213c:	6a02                	ld	s4,0(sp)
    8020213e:	6145                	addi	sp,sp,48
    80202140:	8082                	ret

0000000080202142 <scheduler>:
{
    80202142:	715d                	addi	sp,sp,-80
    80202144:	e486                	sd	ra,72(sp)
    80202146:	e0a2                	sd	s0,64(sp)
    80202148:	fc26                	sd	s1,56(sp)
    8020214a:	f84a                	sd	s2,48(sp)
    8020214c:	f44e                	sd	s3,40(sp)
    8020214e:	f052                	sd	s4,32(sp)
    80202150:	ec56                	sd	s5,24(sp)
    80202152:	e85a                	sd	s6,16(sp)
    80202154:	e45e                	sd	s7,8(sp)
    80202156:	e062                	sd	s8,0(sp)
    80202158:	0880                	addi	s0,sp,80
    8020215a:	8792                	mv	a5,tp
  int id = r_tp();
    8020215c:	2781                	sext.w	a5,a5
  c->proc = 0;
    8020215e:	00779b13          	slli	s6,a5,0x7
    80202162:	0021b717          	auipc	a4,0x21b
    80202166:	f0e70713          	addi	a4,a4,-242 # 8041d070 <pid_lock>
    8020216a:	975a                	add	a4,a4,s6
    8020216c:	00073c23          	sd	zero,24(a4)
        swtch(&c->context, &p->context);
    80202170:	0021b717          	auipc	a4,0x21b
    80202174:	f2070713          	addi	a4,a4,-224 # 8041d090 <cpus+0x8>
    80202178:	9b3a                	add	s6,s6,a4
        c->proc = p;
    8020217a:	079e                	slli	a5,a5,0x7
    8020217c:	0021ba97          	auipc	s5,0x21b
    80202180:	ef4a8a93          	addi	s5,s5,-268 # 8041d070 <pid_lock>
    80202184:	9abe                	add	s5,s5,a5
        w_satp(MAKE_SATP(p->kpagetable));
    80202186:	5a7d                	li	s4,-1
    80202188:	1a7e                	slli	s4,s4,0x3f
        w_satp(MAKE_SATP(kernel_pagetable));
    8020218a:	0021bb97          	auipc	s7,0x21b
    8020218e:	edeb8b93          	addi	s7,s7,-290 # 8041d068 <kernel_pagetable>
    80202192:	a8a5                	j	8020220a <scheduler+0xc8>
        p->state = RUNNING;
    80202194:	478d                	li	a5,3
    80202196:	cc9c                	sw	a5,24(s1)
        c->proc = p;
    80202198:	009abc23          	sd	s1,24(s5)
        w_satp(MAKE_SATP(p->kpagetable));
    8020219c:	6cbc                	ld	a5,88(s1)
    8020219e:	83b1                	srli	a5,a5,0xc
    802021a0:	0147e7b3          	or	a5,a5,s4
  asm volatile("csrw satp, %0" : : "r" (x));
    802021a4:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    802021a8:	12000073          	sfence.vma
        swtch(&c->context, &p->context);
    802021ac:	06848593          	addi	a1,s1,104
    802021b0:	855a                	mv	a0,s6
    802021b2:	00000097          	auipc	ra,0x0
    802021b6:	616080e7          	jalr	1558(ra) # 802027c8 <swtch>
        w_satp(MAKE_SATP(kernel_pagetable));
    802021ba:	000bb783          	ld	a5,0(s7)
    802021be:	83b1                	srli	a5,a5,0xc
    802021c0:	0147e7b3          	or	a5,a5,s4
  asm volatile("csrw satp, %0" : : "r" (x));
    802021c4:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    802021c8:	12000073          	sfence.vma
        c->proc = 0;
    802021cc:	000abc23          	sd	zero,24(s5)
        found = 1;
    802021d0:	4c05                	li	s8,1
      release(&p->lock);
    802021d2:	8526                	mv	a0,s1
    802021d4:	ffffe097          	auipc	ra,0xffffe
    802021d8:	574080e7          	jalr	1396(ra) # 80200748 <release>
    for(p = proc; p < &proc[NPROC]; p++) {
    802021dc:	17848493          	addi	s1,s1,376
    802021e0:	01248b63          	beq	s1,s2,802021f6 <scheduler+0xb4>
      acquire(&p->lock);
    802021e4:	8526                	mv	a0,s1
    802021e6:	ffffe097          	auipc	ra,0xffffe
    802021ea:	50e080e7          	jalr	1294(ra) # 802006f4 <acquire>
      if(p->state == RUNNABLE) {
    802021ee:	4c9c                	lw	a5,24(s1)
    802021f0:	ff3791e3          	bne	a5,s3,802021d2 <scheduler+0x90>
    802021f4:	b745                	j	80202194 <scheduler+0x52>
    if(found == 0) {
    802021f6:	000c1a63          	bnez	s8,8020220a <scheduler+0xc8>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802021fa:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    802021fe:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202202:	10079073          	csrw	sstatus,a5
      asm volatile("wfi");
    80202206:	10500073          	wfi
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    8020220a:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    8020220e:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202212:	10079073          	csrw	sstatus,a5
    int found = 0;
    80202216:	4c01                	li	s8,0
    for(p = proc; p < &proc[NPROC]; p++) {
    80202218:	0021b497          	auipc	s1,0x21b
    8020221c:	0f048493          	addi	s1,s1,240 # 8041d308 <proc>
      if(p->state == RUNNABLE) {
    80202220:	4989                	li	s3,2
    for(p = proc; p < &proc[NPROC]; p++) {
    80202222:	00220917          	auipc	s2,0x220
    80202226:	a5690913          	addi	s2,s2,-1450 # 80421c78 <initproc>
    8020222a:	bf6d                	j	802021e4 <scheduler+0xa2>

000000008020222c <sched>:
{
    8020222c:	7179                	addi	sp,sp,-48
    8020222e:	f406                	sd	ra,40(sp)
    80202230:	f022                	sd	s0,32(sp)
    80202232:	ec26                	sd	s1,24(sp)
    80202234:	e84a                	sd	s2,16(sp)
    80202236:	e44e                	sd	s3,8(sp)
    80202238:	1800                	addi	s0,sp,48
  struct proc *p = myproc();
    8020223a:	00000097          	auipc	ra,0x0
    8020223e:	984080e7          	jalr	-1660(ra) # 80201bbe <myproc>
    80202242:	84aa                	mv	s1,a0
  if(!holding(&p->lock))
    80202244:	ffffe097          	auipc	ra,0xffffe
    80202248:	482080e7          	jalr	1154(ra) # 802006c6 <holding>
    8020224c:	c93d                	beqz	a0,802022c2 <sched+0x96>
  asm volatile("mv %0, tp" : "=r" (x) );
    8020224e:	8792                	mv	a5,tp
  if(mycpu()->noff != 1)
    80202250:	2781                	sext.w	a5,a5
    80202252:	079e                	slli	a5,a5,0x7
    80202254:	0021b717          	auipc	a4,0x21b
    80202258:	e1c70713          	addi	a4,a4,-484 # 8041d070 <pid_lock>
    8020225c:	97ba                	add	a5,a5,a4
    8020225e:	0907a703          	lw	a4,144(a5)
    80202262:	4785                	li	a5,1
    80202264:	06f71763          	bne	a4,a5,802022d2 <sched+0xa6>
  if(p->state == RUNNING)
    80202268:	4c98                	lw	a4,24(s1)
    8020226a:	478d                	li	a5,3
    8020226c:	06f70b63          	beq	a4,a5,802022e2 <sched+0xb6>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202270:	100027f3          	csrr	a5,sstatus
  return (x & SSTATUS_SIE) != 0;
    80202274:	8b89                	andi	a5,a5,2
  if(intr_get())
    80202276:	efb5                	bnez	a5,802022f2 <sched+0xc6>
  asm volatile("mv %0, tp" : "=r" (x) );
    80202278:	8792                	mv	a5,tp
  intena = mycpu()->intena;
    8020227a:	0021b917          	auipc	s2,0x21b
    8020227e:	df690913          	addi	s2,s2,-522 # 8041d070 <pid_lock>
    80202282:	2781                	sext.w	a5,a5
    80202284:	079e                	slli	a5,a5,0x7
    80202286:	97ca                	add	a5,a5,s2
    80202288:	0947a983          	lw	s3,148(a5)
    8020228c:	8792                	mv	a5,tp
  swtch(&p->context, &mycpu()->context);
    8020228e:	2781                	sext.w	a5,a5
    80202290:	079e                	slli	a5,a5,0x7
    80202292:	0021b597          	auipc	a1,0x21b
    80202296:	dfe58593          	addi	a1,a1,-514 # 8041d090 <cpus+0x8>
    8020229a:	95be                	add	a1,a1,a5
    8020229c:	06848513          	addi	a0,s1,104
    802022a0:	00000097          	auipc	ra,0x0
    802022a4:	528080e7          	jalr	1320(ra) # 802027c8 <swtch>
    802022a8:	8792                	mv	a5,tp
  mycpu()->intena = intena;
    802022aa:	2781                	sext.w	a5,a5
    802022ac:	079e                	slli	a5,a5,0x7
    802022ae:	97ca                	add	a5,a5,s2
    802022b0:	0937aa23          	sw	s3,148(a5)
}
    802022b4:	70a2                	ld	ra,40(sp)
    802022b6:	7402                	ld	s0,32(sp)
    802022b8:	64e2                	ld	s1,24(sp)
    802022ba:	6942                	ld	s2,16(sp)
    802022bc:	69a2                	ld	s3,8(sp)
    802022be:	6145                	addi	sp,sp,48
    802022c0:	8082                	ret
    panic("sched p->lock");
    802022c2:	00007517          	auipc	a0,0x7
    802022c6:	40e50513          	addi	a0,a0,1038 # 802096d0 <digits+0x350>
    802022ca:	ffffe097          	auipc	ra,0xffffe
    802022ce:	e7a080e7          	jalr	-390(ra) # 80200144 <panic>
    panic("sched locks");
    802022d2:	00007517          	auipc	a0,0x7
    802022d6:	40e50513          	addi	a0,a0,1038 # 802096e0 <digits+0x360>
    802022da:	ffffe097          	auipc	ra,0xffffe
    802022de:	e6a080e7          	jalr	-406(ra) # 80200144 <panic>
    panic("sched running");
    802022e2:	00007517          	auipc	a0,0x7
    802022e6:	40e50513          	addi	a0,a0,1038 # 802096f0 <digits+0x370>
    802022ea:	ffffe097          	auipc	ra,0xffffe
    802022ee:	e5a080e7          	jalr	-422(ra) # 80200144 <panic>
    panic("sched interruptible");
    802022f2:	00007517          	auipc	a0,0x7
    802022f6:	40e50513          	addi	a0,a0,1038 # 80209700 <digits+0x380>
    802022fa:	ffffe097          	auipc	ra,0xffffe
    802022fe:	e4a080e7          	jalr	-438(ra) # 80200144 <panic>

0000000080202302 <exit>:
{
    80202302:	7179                	addi	sp,sp,-48
    80202304:	f406                	sd	ra,40(sp)
    80202306:	f022                	sd	s0,32(sp)
    80202308:	ec26                	sd	s1,24(sp)
    8020230a:	e84a                	sd	s2,16(sp)
    8020230c:	e44e                	sd	s3,8(sp)
    8020230e:	e052                	sd	s4,0(sp)
    80202310:	1800                	addi	s0,sp,48
    80202312:	8a2a                	mv	s4,a0
  struct proc *p = myproc();
    80202314:	00000097          	auipc	ra,0x0
    80202318:	8aa080e7          	jalr	-1878(ra) # 80201bbe <myproc>
    8020231c:	89aa                	mv	s3,a0
  for(int fd = 0; fd < NOFILE; fd++){
    8020231e:	0d850493          	addi	s1,a0,216
    80202322:	15850913          	addi	s2,a0,344
    80202326:	a811                	j	8020233a <exit+0x38>
      fileclose(f);
    80202328:	00001097          	auipc	ra,0x1
    8020232c:	686080e7          	jalr	1670(ra) # 802039ae <fileclose>
      p->ofile[fd] = 0;
    80202330:	0004b023          	sd	zero,0(s1)
  for(int fd = 0; fd < NOFILE; fd++){
    80202334:	04a1                	addi	s1,s1,8
    80202336:	01248563          	beq	s1,s2,80202340 <exit+0x3e>
    if(p->ofile[fd]){
    8020233a:	6088                	ld	a0,0(s1)
    8020233c:	f575                	bnez	a0,80202328 <exit+0x26>
    8020233e:	bfdd                	j	80202334 <exit+0x32>
  eput(p->cwd);
    80202340:	1589b503          	ld	a0,344(s3)
    80202344:	00004097          	auipc	ra,0x4
    80202348:	7ac080e7          	jalr	1964(ra) # 80206af0 <eput>
  p->cwd = 0;
    8020234c:	1409bc23          	sd	zero,344(s3)
  acquire(&initproc->lock);
    80202350:	00220497          	auipc	s1,0x220
    80202354:	92848493          	addi	s1,s1,-1752 # 80421c78 <initproc>
    80202358:	6088                	ld	a0,0(s1)
    8020235a:	ffffe097          	auipc	ra,0xffffe
    8020235e:	39a080e7          	jalr	922(ra) # 802006f4 <acquire>
  wakeup1(initproc);
    80202362:	6088                	ld	a0,0(s1)
    80202364:	fffff097          	auipc	ra,0xfffff
    80202368:	65e080e7          	jalr	1630(ra) # 802019c2 <wakeup1>
  release(&initproc->lock);
    8020236c:	6088                	ld	a0,0(s1)
    8020236e:	ffffe097          	auipc	ra,0xffffe
    80202372:	3da080e7          	jalr	986(ra) # 80200748 <release>
  acquire(&p->lock);
    80202376:	854e                	mv	a0,s3
    80202378:	ffffe097          	auipc	ra,0xffffe
    8020237c:	37c080e7          	jalr	892(ra) # 802006f4 <acquire>
  struct proc *original_parent = p->parent;
    80202380:	0209b483          	ld	s1,32(s3)
  release(&p->lock);
    80202384:	854e                	mv	a0,s3
    80202386:	ffffe097          	auipc	ra,0xffffe
    8020238a:	3c2080e7          	jalr	962(ra) # 80200748 <release>
  acquire(&original_parent->lock);
    8020238e:	8526                	mv	a0,s1
    80202390:	ffffe097          	auipc	ra,0xffffe
    80202394:	364080e7          	jalr	868(ra) # 802006f4 <acquire>
  acquire(&p->lock);
    80202398:	854e                	mv	a0,s3
    8020239a:	ffffe097          	auipc	ra,0xffffe
    8020239e:	35a080e7          	jalr	858(ra) # 802006f4 <acquire>
  reparent(p);
    802023a2:	854e                	mv	a0,s3
    802023a4:	00000097          	auipc	ra,0x0
    802023a8:	d38080e7          	jalr	-712(ra) # 802020dc <reparent>
  wakeup1(original_parent);
    802023ac:	8526                	mv	a0,s1
    802023ae:	fffff097          	auipc	ra,0xfffff
    802023b2:	614080e7          	jalr	1556(ra) # 802019c2 <wakeup1>
  p->xstate = status;
    802023b6:	0349aa23          	sw	s4,52(s3)
  p->state = ZOMBIE;
    802023ba:	4791                	li	a5,4
    802023bc:	00f9ac23          	sw	a5,24(s3)
  release(&original_parent->lock);
    802023c0:	8526                	mv	a0,s1
    802023c2:	ffffe097          	auipc	ra,0xffffe
    802023c6:	386080e7          	jalr	902(ra) # 80200748 <release>
  sched();
    802023ca:	00000097          	auipc	ra,0x0
    802023ce:	e62080e7          	jalr	-414(ra) # 8020222c <sched>
  panic("zombie exit");
    802023d2:	00007517          	auipc	a0,0x7
    802023d6:	34650513          	addi	a0,a0,838 # 80209718 <digits+0x398>
    802023da:	ffffe097          	auipc	ra,0xffffe
    802023de:	d6a080e7          	jalr	-662(ra) # 80200144 <panic>

00000000802023e2 <yield>:
{
    802023e2:	1101                	addi	sp,sp,-32
    802023e4:	ec06                	sd	ra,24(sp)
    802023e6:	e822                	sd	s0,16(sp)
    802023e8:	e426                	sd	s1,8(sp)
    802023ea:	1000                	addi	s0,sp,32
  struct proc *p = myproc();
    802023ec:	fffff097          	auipc	ra,0xfffff
    802023f0:	7d2080e7          	jalr	2002(ra) # 80201bbe <myproc>
    802023f4:	84aa                	mv	s1,a0
  acquire(&p->lock);
    802023f6:	ffffe097          	auipc	ra,0xffffe
    802023fa:	2fe080e7          	jalr	766(ra) # 802006f4 <acquire>
  p->state = RUNNABLE;
    802023fe:	4789                	li	a5,2
    80202400:	cc9c                	sw	a5,24(s1)
  sched();
    80202402:	00000097          	auipc	ra,0x0
    80202406:	e2a080e7          	jalr	-470(ra) # 8020222c <sched>
  release(&p->lock);
    8020240a:	8526                	mv	a0,s1
    8020240c:	ffffe097          	auipc	ra,0xffffe
    80202410:	33c080e7          	jalr	828(ra) # 80200748 <release>
}
    80202414:	60e2                	ld	ra,24(sp)
    80202416:	6442                	ld	s0,16(sp)
    80202418:	64a2                	ld	s1,8(sp)
    8020241a:	6105                	addi	sp,sp,32
    8020241c:	8082                	ret

000000008020241e <sleep>:
{
    8020241e:	7179                	addi	sp,sp,-48
    80202420:	f406                	sd	ra,40(sp)
    80202422:	f022                	sd	s0,32(sp)
    80202424:	ec26                	sd	s1,24(sp)
    80202426:	e84a                	sd	s2,16(sp)
    80202428:	e44e                	sd	s3,8(sp)
    8020242a:	1800                	addi	s0,sp,48
    8020242c:	89aa                	mv	s3,a0
    8020242e:	892e                	mv	s2,a1
  struct proc *p = myproc();
    80202430:	fffff097          	auipc	ra,0xfffff
    80202434:	78e080e7          	jalr	1934(ra) # 80201bbe <myproc>
    80202438:	84aa                	mv	s1,a0
  if(lk != &p->lock){  //DOC: sleeplock0
    8020243a:	05250663          	beq	a0,s2,80202486 <sleep+0x68>
    acquire(&p->lock);  //DOC: sleeplock1
    8020243e:	ffffe097          	auipc	ra,0xffffe
    80202442:	2b6080e7          	jalr	694(ra) # 802006f4 <acquire>
    release(lk);
    80202446:	854a                	mv	a0,s2
    80202448:	ffffe097          	auipc	ra,0xffffe
    8020244c:	300080e7          	jalr	768(ra) # 80200748 <release>
  p->chan = chan;
    80202450:	0334b423          	sd	s3,40(s1)
  p->state = SLEEPING;
    80202454:	4785                	li	a5,1
    80202456:	cc9c                	sw	a5,24(s1)
  sched();
    80202458:	00000097          	auipc	ra,0x0
    8020245c:	dd4080e7          	jalr	-556(ra) # 8020222c <sched>
  p->chan = 0;
    80202460:	0204b423          	sd	zero,40(s1)
    release(&p->lock);
    80202464:	8526                	mv	a0,s1
    80202466:	ffffe097          	auipc	ra,0xffffe
    8020246a:	2e2080e7          	jalr	738(ra) # 80200748 <release>
    acquire(lk);
    8020246e:	854a                	mv	a0,s2
    80202470:	ffffe097          	auipc	ra,0xffffe
    80202474:	284080e7          	jalr	644(ra) # 802006f4 <acquire>
}
    80202478:	70a2                	ld	ra,40(sp)
    8020247a:	7402                	ld	s0,32(sp)
    8020247c:	64e2                	ld	s1,24(sp)
    8020247e:	6942                	ld	s2,16(sp)
    80202480:	69a2                	ld	s3,8(sp)
    80202482:	6145                	addi	sp,sp,48
    80202484:	8082                	ret
  p->chan = chan;
    80202486:	03353423          	sd	s3,40(a0)
  p->state = SLEEPING;
    8020248a:	4785                	li	a5,1
    8020248c:	cd1c                	sw	a5,24(a0)
  sched();
    8020248e:	00000097          	auipc	ra,0x0
    80202492:	d9e080e7          	jalr	-610(ra) # 8020222c <sched>
  p->chan = 0;
    80202496:	0204b423          	sd	zero,40(s1)
  if(lk != &p->lock){
    8020249a:	bff9                	j	80202478 <sleep+0x5a>

000000008020249c <wait>:
{
    8020249c:	715d                	addi	sp,sp,-80
    8020249e:	e486                	sd	ra,72(sp)
    802024a0:	e0a2                	sd	s0,64(sp)
    802024a2:	fc26                	sd	s1,56(sp)
    802024a4:	f84a                	sd	s2,48(sp)
    802024a6:	f44e                	sd	s3,40(sp)
    802024a8:	f052                	sd	s4,32(sp)
    802024aa:	ec56                	sd	s5,24(sp)
    802024ac:	e85a                	sd	s6,16(sp)
    802024ae:	e45e                	sd	s7,8(sp)
    802024b0:	e062                	sd	s8,0(sp)
    802024b2:	0880                	addi	s0,sp,80
    802024b4:	8b2a                	mv	s6,a0
  struct proc *p = myproc();
    802024b6:	fffff097          	auipc	ra,0xfffff
    802024ba:	708080e7          	jalr	1800(ra) # 80201bbe <myproc>
    802024be:	892a                	mv	s2,a0
  acquire(&p->lock);
    802024c0:	8c2a                	mv	s8,a0
    802024c2:	ffffe097          	auipc	ra,0xffffe
    802024c6:	232080e7          	jalr	562(ra) # 802006f4 <acquire>
    havekids = 0;
    802024ca:	4b81                	li	s7,0
        if(np->state == ZOMBIE){
    802024cc:	4a11                	li	s4,4
    for(np = proc; np < &proc[NPROC]; np++){
    802024ce:	0021f997          	auipc	s3,0x21f
    802024d2:	7aa98993          	addi	s3,s3,1962 # 80421c78 <initproc>
        havekids = 1;
    802024d6:	4a85                	li	s5,1
    havekids = 0;
    802024d8:	875e                	mv	a4,s7
    for(np = proc; np < &proc[NPROC]; np++){
    802024da:	0021b497          	auipc	s1,0x21b
    802024de:	e2e48493          	addi	s1,s1,-466 # 8041d308 <proc>
    802024e2:	a8b9                	j	80202540 <wait+0xa4>
          pid = np->pid;
    802024e4:	0384a983          	lw	s3,56(s1)
          if(addr != 0 && copyout2(addr, (char *)&np->xstate, sizeof(np->xstate)) < 0) {
    802024e8:	000b0c63          	beqz	s6,80202500 <wait+0x64>
    802024ec:	4611                	li	a2,4
    802024ee:	03448593          	addi	a1,s1,52
    802024f2:	855a                	mv	a0,s6
    802024f4:	fffff097          	auipc	ra,0xfffff
    802024f8:	fde080e7          	jalr	-34(ra) # 802014d2 <copyout2>
    802024fc:	02054263          	bltz	a0,80202520 <wait+0x84>
          freeproc(np);
    80202500:	8526                	mv	a0,s1
    80202502:	00000097          	auipc	ra,0x0
    80202506:	88e080e7          	jalr	-1906(ra) # 80201d90 <freeproc>
          release(&np->lock);
    8020250a:	8526                	mv	a0,s1
    8020250c:	ffffe097          	auipc	ra,0xffffe
    80202510:	23c080e7          	jalr	572(ra) # 80200748 <release>
          release(&p->lock);
    80202514:	854a                	mv	a0,s2
    80202516:	ffffe097          	auipc	ra,0xffffe
    8020251a:	232080e7          	jalr	562(ra) # 80200748 <release>
          return pid;
    8020251e:	a8a9                	j	80202578 <wait+0xdc>
            release(&np->lock);
    80202520:	8526                	mv	a0,s1
    80202522:	ffffe097          	auipc	ra,0xffffe
    80202526:	226080e7          	jalr	550(ra) # 80200748 <release>
            release(&p->lock);
    8020252a:	854a                	mv	a0,s2
    8020252c:	ffffe097          	auipc	ra,0xffffe
    80202530:	21c080e7          	jalr	540(ra) # 80200748 <release>
            return -1;
    80202534:	59fd                	li	s3,-1
    80202536:	a089                	j	80202578 <wait+0xdc>
    for(np = proc; np < &proc[NPROC]; np++){
    80202538:	17848493          	addi	s1,s1,376
    8020253c:	03348463          	beq	s1,s3,80202564 <wait+0xc8>
      if(np->parent == p){
    80202540:	709c                	ld	a5,32(s1)
    80202542:	ff279be3          	bne	a5,s2,80202538 <wait+0x9c>
        acquire(&np->lock);
    80202546:	8526                	mv	a0,s1
    80202548:	ffffe097          	auipc	ra,0xffffe
    8020254c:	1ac080e7          	jalr	428(ra) # 802006f4 <acquire>
        if(np->state == ZOMBIE){
    80202550:	4c9c                	lw	a5,24(s1)
    80202552:	f94789e3          	beq	a5,s4,802024e4 <wait+0x48>
        release(&np->lock);
    80202556:	8526                	mv	a0,s1
    80202558:	ffffe097          	auipc	ra,0xffffe
    8020255c:	1f0080e7          	jalr	496(ra) # 80200748 <release>
        havekids = 1;
    80202560:	8756                	mv	a4,s5
    80202562:	bfd9                	j	80202538 <wait+0x9c>
    if(!havekids || p->killed){
    80202564:	c701                	beqz	a4,8020256c <wait+0xd0>
    80202566:	03092783          	lw	a5,48(s2)
    8020256a:	c785                	beqz	a5,80202592 <wait+0xf6>
      release(&p->lock);
    8020256c:	854a                	mv	a0,s2
    8020256e:	ffffe097          	auipc	ra,0xffffe
    80202572:	1da080e7          	jalr	474(ra) # 80200748 <release>
      return -1;
    80202576:	59fd                	li	s3,-1
}
    80202578:	854e                	mv	a0,s3
    8020257a:	60a6                	ld	ra,72(sp)
    8020257c:	6406                	ld	s0,64(sp)
    8020257e:	74e2                	ld	s1,56(sp)
    80202580:	7942                	ld	s2,48(sp)
    80202582:	79a2                	ld	s3,40(sp)
    80202584:	7a02                	ld	s4,32(sp)
    80202586:	6ae2                	ld	s5,24(sp)
    80202588:	6b42                	ld	s6,16(sp)
    8020258a:	6ba2                	ld	s7,8(sp)
    8020258c:	6c02                	ld	s8,0(sp)
    8020258e:	6161                	addi	sp,sp,80
    80202590:	8082                	ret
    sleep(p, &p->lock);  //DOC: wait-sleep
    80202592:	85e2                	mv	a1,s8
    80202594:	854a                	mv	a0,s2
    80202596:	00000097          	auipc	ra,0x0
    8020259a:	e88080e7          	jalr	-376(ra) # 8020241e <sleep>
    havekids = 0;
    8020259e:	bf2d                	j	802024d8 <wait+0x3c>

00000000802025a0 <wakeup>:
{
    802025a0:	7139                	addi	sp,sp,-64
    802025a2:	fc06                	sd	ra,56(sp)
    802025a4:	f822                	sd	s0,48(sp)
    802025a6:	f426                	sd	s1,40(sp)
    802025a8:	f04a                	sd	s2,32(sp)
    802025aa:	ec4e                	sd	s3,24(sp)
    802025ac:	e852                	sd	s4,16(sp)
    802025ae:	e456                	sd	s5,8(sp)
    802025b0:	0080                	addi	s0,sp,64
    802025b2:	8a2a                	mv	s4,a0
  for(p = proc; p < &proc[NPROC]; p++) {
    802025b4:	0021b497          	auipc	s1,0x21b
    802025b8:	d5448493          	addi	s1,s1,-684 # 8041d308 <proc>
    if(p->state == SLEEPING && p->chan == chan) {
    802025bc:	4985                	li	s3,1
      p->state = RUNNABLE;
    802025be:	4a89                	li	s5,2
  for(p = proc; p < &proc[NPROC]; p++) {
    802025c0:	0021f917          	auipc	s2,0x21f
    802025c4:	6b890913          	addi	s2,s2,1720 # 80421c78 <initproc>
    802025c8:	a821                	j	802025e0 <wakeup+0x40>
      p->state = RUNNABLE;
    802025ca:	0154ac23          	sw	s5,24(s1)
    release(&p->lock);
    802025ce:	8526                	mv	a0,s1
    802025d0:	ffffe097          	auipc	ra,0xffffe
    802025d4:	178080e7          	jalr	376(ra) # 80200748 <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    802025d8:	17848493          	addi	s1,s1,376
    802025dc:	01248e63          	beq	s1,s2,802025f8 <wakeup+0x58>
    acquire(&p->lock);
    802025e0:	8526                	mv	a0,s1
    802025e2:	ffffe097          	auipc	ra,0xffffe
    802025e6:	112080e7          	jalr	274(ra) # 802006f4 <acquire>
    if(p->state == SLEEPING && p->chan == chan) {
    802025ea:	4c9c                	lw	a5,24(s1)
    802025ec:	ff3791e3          	bne	a5,s3,802025ce <wakeup+0x2e>
    802025f0:	749c                	ld	a5,40(s1)
    802025f2:	fd479ee3          	bne	a5,s4,802025ce <wakeup+0x2e>
    802025f6:	bfd1                	j	802025ca <wakeup+0x2a>
}
    802025f8:	70e2                	ld	ra,56(sp)
    802025fa:	7442                	ld	s0,48(sp)
    802025fc:	74a2                	ld	s1,40(sp)
    802025fe:	7902                	ld	s2,32(sp)
    80202600:	69e2                	ld	s3,24(sp)
    80202602:	6a42                	ld	s4,16(sp)
    80202604:	6aa2                	ld	s5,8(sp)
    80202606:	6121                	addi	sp,sp,64
    80202608:	8082                	ret

000000008020260a <kill>:
// Kill the process with the given pid.
// The victim won't exit until it tries to return
// to user space (see usertrap() in trap.c).
int
kill(int pid)
{
    8020260a:	7179                	addi	sp,sp,-48
    8020260c:	f406                	sd	ra,40(sp)
    8020260e:	f022                	sd	s0,32(sp)
    80202610:	ec26                	sd	s1,24(sp)
    80202612:	e84a                	sd	s2,16(sp)
    80202614:	e44e                	sd	s3,8(sp)
    80202616:	1800                	addi	s0,sp,48
    80202618:	892a                	mv	s2,a0
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++){
    8020261a:	0021b497          	auipc	s1,0x21b
    8020261e:	cee48493          	addi	s1,s1,-786 # 8041d308 <proc>
    80202622:	0021f997          	auipc	s3,0x21f
    80202626:	65698993          	addi	s3,s3,1622 # 80421c78 <initproc>
    acquire(&p->lock);
    8020262a:	8526                	mv	a0,s1
    8020262c:	ffffe097          	auipc	ra,0xffffe
    80202630:	0c8080e7          	jalr	200(ra) # 802006f4 <acquire>
    if(p->pid == pid){
    80202634:	5c9c                	lw	a5,56(s1)
    80202636:	01278d63          	beq	a5,s2,80202650 <kill+0x46>
        p->state = RUNNABLE;
      }
      release(&p->lock);
      return 0;
    }
    release(&p->lock);
    8020263a:	8526                	mv	a0,s1
    8020263c:	ffffe097          	auipc	ra,0xffffe
    80202640:	10c080e7          	jalr	268(ra) # 80200748 <release>
  for(p = proc; p < &proc[NPROC]; p++){
    80202644:	17848493          	addi	s1,s1,376
    80202648:	ff3491e3          	bne	s1,s3,8020262a <kill+0x20>
  }
  return -1;
    8020264c:	557d                	li	a0,-1
    8020264e:	a829                	j	80202668 <kill+0x5e>
      p->killed = 1;
    80202650:	4785                	li	a5,1
    80202652:	d89c                	sw	a5,48(s1)
      if(p->state == SLEEPING){
    80202654:	4c98                	lw	a4,24(s1)
    80202656:	4785                	li	a5,1
    80202658:	00f70f63          	beq	a4,a5,80202676 <kill+0x6c>
      release(&p->lock);
    8020265c:	8526                	mv	a0,s1
    8020265e:	ffffe097          	auipc	ra,0xffffe
    80202662:	0ea080e7          	jalr	234(ra) # 80200748 <release>
      return 0;
    80202666:	4501                	li	a0,0
}
    80202668:	70a2                	ld	ra,40(sp)
    8020266a:	7402                	ld	s0,32(sp)
    8020266c:	64e2                	ld	s1,24(sp)
    8020266e:	6942                	ld	s2,16(sp)
    80202670:	69a2                	ld	s3,8(sp)
    80202672:	6145                	addi	sp,sp,48
    80202674:	8082                	ret
        p->state = RUNNABLE;
    80202676:	4789                	li	a5,2
    80202678:	cc9c                	sw	a5,24(s1)
    8020267a:	b7cd                	j	8020265c <kill+0x52>

000000008020267c <either_copyout>:
// Copy to either a user address, or kernel address,
// depending on usr_dst.
// Returns 0 on success, -1 on error.
int
either_copyout(int user_dst, uint64 dst, void *src, uint64 len)
{
    8020267c:	1101                	addi	sp,sp,-32
    8020267e:	ec06                	sd	ra,24(sp)
    80202680:	e822                	sd	s0,16(sp)
    80202682:	e426                	sd	s1,8(sp)
    80202684:	1000                	addi	s0,sp,32
    80202686:	84aa                	mv	s1,a0
    80202688:	852e                	mv	a0,a1
    8020268a:	85b2                	mv	a1,a2
    8020268c:	8636                	mv	a2,a3
  // struct proc *p = myproc();
  if(user_dst){
    8020268e:	c891                	beqz	s1,802026a2 <either_copyout+0x26>
    // return copyout(p->pagetable, dst, src, len);
    return copyout2(dst, src, len);
    80202690:	fffff097          	auipc	ra,0xfffff
    80202694:	e42080e7          	jalr	-446(ra) # 802014d2 <copyout2>
  } else {
    memmove((char *)dst, src, len);
    return 0;
  }
}
    80202698:	60e2                	ld	ra,24(sp)
    8020269a:	6442                	ld	s0,16(sp)
    8020269c:	64a2                	ld	s1,8(sp)
    8020269e:	6105                	addi	sp,sp,32
    802026a0:	8082                	ret
    memmove((char *)dst, src, len);
    802026a2:	0006861b          	sext.w	a2,a3
    802026a6:	ffffe097          	auipc	ra,0xffffe
    802026aa:	14a080e7          	jalr	330(ra) # 802007f0 <memmove>
    return 0;
    802026ae:	8526                	mv	a0,s1
    802026b0:	b7e5                	j	80202698 <either_copyout+0x1c>

00000000802026b2 <either_copyin>:
// Copy from either a user address, or kernel address,
// depending on usr_src.
// Returns 0 on success, -1 on error.
int
either_copyin(void *dst, int user_src, uint64 src, uint64 len)
{
    802026b2:	1101                	addi	sp,sp,-32
    802026b4:	ec06                	sd	ra,24(sp)
    802026b6:	e822                	sd	s0,16(sp)
    802026b8:	e426                	sd	s1,8(sp)
    802026ba:	1000                	addi	s0,sp,32
    802026bc:	84ae                	mv	s1,a1
    802026be:	85b2                	mv	a1,a2
    802026c0:	8636                	mv	a2,a3
  // struct proc *p = myproc();
  if(user_src){
    802026c2:	c891                	beqz	s1,802026d6 <either_copyin+0x24>
    // return copyin(p->pagetable, dst, src, len);
    return copyin2(dst, src, len);
    802026c4:	fffff097          	auipc	ra,0xfffff
    802026c8:	eec080e7          	jalr	-276(ra) # 802015b0 <copyin2>
  } else {
    memmove(dst, (char*)src, len);
    return 0;
  }
}
    802026cc:	60e2                	ld	ra,24(sp)
    802026ce:	6442                	ld	s0,16(sp)
    802026d0:	64a2                	ld	s1,8(sp)
    802026d2:	6105                	addi	sp,sp,32
    802026d4:	8082                	ret
    memmove(dst, (char*)src, len);
    802026d6:	0006861b          	sext.w	a2,a3
    802026da:	ffffe097          	auipc	ra,0xffffe
    802026de:	116080e7          	jalr	278(ra) # 802007f0 <memmove>
    return 0;
    802026e2:	8526                	mv	a0,s1
    802026e4:	b7e5                	j	802026cc <either_copyin+0x1a>

00000000802026e6 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
    802026e6:	715d                	addi	sp,sp,-80
    802026e8:	e486                	sd	ra,72(sp)
    802026ea:	e0a2                	sd	s0,64(sp)
    802026ec:	fc26                	sd	s1,56(sp)
    802026ee:	f84a                	sd	s2,48(sp)
    802026f0:	f44e                	sd	s3,40(sp)
    802026f2:	f052                	sd	s4,32(sp)
    802026f4:	ec56                	sd	s5,24(sp)
    802026f6:	e85a                	sd	s6,16(sp)
    802026f8:	e45e                	sd	s7,8(sp)
    802026fa:	0880                	addi	s0,sp,80
  [ZOMBIE]    "zombie"
  };
  struct proc *p;
  char *state;

  printf("\nPID\tSTATE\tNAME\tMEM\n");
    802026fc:	00007517          	auipc	a0,0x7
    80202700:	03450513          	addi	a0,a0,52 # 80209730 <digits+0x3b0>
    80202704:	ffffe097          	auipc	ra,0xffffe
    80202708:	a8a080e7          	jalr	-1398(ra) # 8020018e <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    8020270c:	0021b497          	auipc	s1,0x21b
    80202710:	d5c48493          	addi	s1,s1,-676 # 8041d468 <proc+0x160>
    80202714:	0021f917          	auipc	s2,0x21f
    80202718:	6c490913          	addi	s2,s2,1732 # 80421dd8 <bcache+0x158>
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    8020271c:	4b11                	li	s6,4
      state = states[p->state];
    else
      state = "???";
    8020271e:	00007997          	auipc	s3,0x7
    80202722:	00a98993          	addi	s3,s3,10 # 80209728 <digits+0x3a8>
    printf("%d\t%s\t%s\t%d", p->pid, state, p->name, p->sz);
    80202726:	00007a97          	auipc	s5,0x7
    8020272a:	022a8a93          	addi	s5,s5,34 # 80209748 <digits+0x3c8>
    printf("\n");
    8020272e:	00007a17          	auipc	s4,0x7
    80202732:	9aaa0a13          	addi	s4,s4,-1622 # 802090d8 <etext+0xd8>
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    80202736:	00007b97          	auipc	s7,0x7
    8020273a:	04ab8b93          	addi	s7,s7,74 # 80209780 <states.1723>
    8020273e:	a01d                	j	80202764 <procdump+0x7e>
    printf("%d\t%s\t%s\t%d", p->pid, state, p->name, p->sz);
    80202740:	ee86b703          	ld	a4,-280(a3)
    80202744:	ed86a583          	lw	a1,-296(a3)
    80202748:	8556                	mv	a0,s5
    8020274a:	ffffe097          	auipc	ra,0xffffe
    8020274e:	a44080e7          	jalr	-1468(ra) # 8020018e <printf>
    printf("\n");
    80202752:	8552                	mv	a0,s4
    80202754:	ffffe097          	auipc	ra,0xffffe
    80202758:	a3a080e7          	jalr	-1478(ra) # 8020018e <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    8020275c:	17848493          	addi	s1,s1,376
    80202760:	03248163          	beq	s1,s2,80202782 <procdump+0x9c>
    if(p->state == UNUSED)
    80202764:	86a6                	mv	a3,s1
    80202766:	eb84a783          	lw	a5,-328(s1)
    8020276a:	dbed                	beqz	a5,8020275c <procdump+0x76>
      state = "???";
    8020276c:	864e                	mv	a2,s3
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    8020276e:	fcfb69e3          	bltu	s6,a5,80202740 <procdump+0x5a>
    80202772:	1782                	slli	a5,a5,0x20
    80202774:	9381                	srli	a5,a5,0x20
    80202776:	078e                	slli	a5,a5,0x3
    80202778:	97de                	add	a5,a5,s7
    8020277a:	6390                	ld	a2,0(a5)
    8020277c:	f271                	bnez	a2,80202740 <procdump+0x5a>
      state = "???";
    8020277e:	864e                	mv	a2,s3
    80202780:	b7c1                	j	80202740 <procdump+0x5a>
  }
}
    80202782:	60a6                	ld	ra,72(sp)
    80202784:	6406                	ld	s0,64(sp)
    80202786:	74e2                	ld	s1,56(sp)
    80202788:	7942                	ld	s2,48(sp)
    8020278a:	79a2                	ld	s3,40(sp)
    8020278c:	7a02                	ld	s4,32(sp)
    8020278e:	6ae2                	ld	s5,24(sp)
    80202790:	6b42                	ld	s6,16(sp)
    80202792:	6ba2                	ld	s7,8(sp)
    80202794:	6161                	addi	sp,sp,80
    80202796:	8082                	ret

0000000080202798 <procnum>:

uint64
procnum(void)
{
    80202798:	1141                	addi	sp,sp,-16
    8020279a:	e422                	sd	s0,8(sp)
    8020279c:	0800                	addi	s0,sp,16
  int num = 0;
  struct proc *p;

  for (p = proc; p < &proc[NPROC]; p++) {
    8020279e:	0021b797          	auipc	a5,0x21b
    802027a2:	b6a78793          	addi	a5,a5,-1174 # 8041d308 <proc>
  int num = 0;
    802027a6:	4501                	li	a0,0
  for (p = proc; p < &proc[NPROC]; p++) {
    802027a8:	0021f697          	auipc	a3,0x21f
    802027ac:	4d068693          	addi	a3,a3,1232 # 80421c78 <initproc>
    802027b0:	a029                	j	802027ba <procnum+0x22>
    802027b2:	17878793          	addi	a5,a5,376
    802027b6:	00d78663          	beq	a5,a3,802027c2 <procnum+0x2a>
    if (p->state != UNUSED) {
    802027ba:	4f98                	lw	a4,24(a5)
    802027bc:	db7d                	beqz	a4,802027b2 <procnum+0x1a>
      num++;
    802027be:	2505                	addiw	a0,a0,1
    802027c0:	bfcd                	j	802027b2 <procnum+0x1a>
    }
  }

  return num;
}
    802027c2:	6422                	ld	s0,8(sp)
    802027c4:	0141                	addi	sp,sp,16
    802027c6:	8082                	ret

00000000802027c8 <swtch>:
    802027c8:	00153023          	sd	ra,0(a0)
    802027cc:	00253423          	sd	sp,8(a0)
    802027d0:	e900                	sd	s0,16(a0)
    802027d2:	ed04                	sd	s1,24(a0)
    802027d4:	03253023          	sd	s2,32(a0)
    802027d8:	03353423          	sd	s3,40(a0)
    802027dc:	03453823          	sd	s4,48(a0)
    802027e0:	03553c23          	sd	s5,56(a0)
    802027e4:	05653023          	sd	s6,64(a0)
    802027e8:	05753423          	sd	s7,72(a0)
    802027ec:	05853823          	sd	s8,80(a0)
    802027f0:	05953c23          	sd	s9,88(a0)
    802027f4:	07a53023          	sd	s10,96(a0)
    802027f8:	07b53423          	sd	s11,104(a0)
    802027fc:	0005b083          	ld	ra,0(a1)
    80202800:	0085b103          	ld	sp,8(a1)
    80202804:	6980                	ld	s0,16(a1)
    80202806:	6d84                	ld	s1,24(a1)
    80202808:	0205b903          	ld	s2,32(a1)
    8020280c:	0285b983          	ld	s3,40(a1)
    80202810:	0305ba03          	ld	s4,48(a1)
    80202814:	0385ba83          	ld	s5,56(a1)
    80202818:	0405bb03          	ld	s6,64(a1)
    8020281c:	0485bb83          	ld	s7,72(a1)
    80202820:	0505bc03          	ld	s8,80(a1)
    80202824:	0585bc83          	ld	s9,88(a1)
    80202828:	0605bd03          	ld	s10,96(a1)
    8020282c:	0685bd83          	ld	s11,104(a1)
    80202830:	8082                	ret

0000000080202832 <trapinithart>:
// }

// set up to take exceptions and traps while in the kernel.
void
trapinithart(void)
{
    80202832:	1141                	addi	sp,sp,-16
    80202834:	e406                	sd	ra,8(sp)
    80202836:	e022                	sd	s0,0(sp)
    80202838:	0800                	addi	s0,sp,16
  asm volatile("csrw stvec, %0" : : "r" (x));
    8020283a:	00003797          	auipc	a5,0x3
    8020283e:	81678793          	addi	a5,a5,-2026 # 80205050 <kernelvec>
    80202842:	10579073          	csrw	stvec,a5
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202846:	100027f3          	csrr	a5,sstatus
  w_stvec((uint64)kernelvec);
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    8020284a:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    8020284e:	10079073          	csrw	sstatus,a5
  asm volatile("csrr %0, sie" : "=r" (x) );
    80202852:	104027f3          	csrr	a5,sie
  // enable supervisor-mode timer interrupts.
  w_sie(r_sie() | SIE_SEIE | SIE_SSIE | SIE_STIE);
    80202856:	2227e793          	ori	a5,a5,546
  asm volatile("csrw sie, %0" : : "r" (x));
    8020285a:	10479073          	csrw	sie,a5
  set_next_timeout();
    8020285e:	00003097          	auipc	ra,0x3
    80202862:	8b8080e7          	jalr	-1864(ra) # 80205116 <set_next_timeout>
  #ifdef DEBUG
  printf("trapinithart\n");
    80202866:	00007517          	auipc	a0,0x7
    8020286a:	f4250513          	addi	a0,a0,-190 # 802097a8 <states.1723+0x28>
    8020286e:	ffffe097          	auipc	ra,0xffffe
    80202872:	920080e7          	jalr	-1760(ra) # 8020018e <printf>
  #endif
}
    80202876:	60a2                	ld	ra,8(sp)
    80202878:	6402                	ld	s0,0(sp)
    8020287a:	0141                	addi	sp,sp,16
    8020287c:	8082                	ret

000000008020287e <usertrapret>:
//
// return to user space
//
void
usertrapret(void)
{
    8020287e:	1141                	addi	sp,sp,-16
    80202880:	e406                	sd	ra,8(sp)
    80202882:	e022                	sd	s0,0(sp)
    80202884:	0800                	addi	s0,sp,16
  struct proc *p = myproc();
    80202886:	fffff097          	auipc	ra,0xfffff
    8020288a:	338080e7          	jalr	824(ra) # 80201bbe <myproc>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    8020288e:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    80202892:	9bf5                	andi	a5,a5,-3
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202894:	10079073          	csrw	sstatus,a5
  // kerneltrap() to usertrap(), so turn off interrupts until
  // we're back in user space, where usertrap() is correct.
  intr_off();

  // send syscalls, interrupts, and exceptions to trampoline.S
  w_stvec(TRAMPOLINE + (uservec - trampoline));
    80202898:	00005617          	auipc	a2,0x5
    8020289c:	76860613          	addi	a2,a2,1896 # 80208000 <_trampoline>
    802028a0:	00005697          	auipc	a3,0x5
    802028a4:	76068693          	addi	a3,a3,1888 # 80208000 <_trampoline>
    802028a8:	8e91                	sub	a3,a3,a2
    802028aa:	040007b7          	lui	a5,0x4000
    802028ae:	17fd                	addi	a5,a5,-1
    802028b0:	07b2                	slli	a5,a5,0xc
    802028b2:	96be                	add	a3,a3,a5
  asm volatile("csrw stvec, %0" : : "r" (x));
    802028b4:	10569073          	csrw	stvec,a3

  // set up trapframe values that uservec will need when
  // the process next re-enters the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
    802028b8:	7138                	ld	a4,96(a0)
  asm volatile("csrr %0, satp" : "=r" (x) );
    802028ba:	180026f3          	csrr	a3,satp
    802028be:	e314                	sd	a3,0(a4)
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
    802028c0:	7138                	ld	a4,96(a0)
    802028c2:	6134                	ld	a3,64(a0)
    802028c4:	6585                	lui	a1,0x1
    802028c6:	96ae                	add	a3,a3,a1
    802028c8:	e714                	sd	a3,8(a4)
  p->trapframe->kernel_trap = (uint64)usertrap;
    802028ca:	7138                	ld	a4,96(a0)
    802028cc:	00000697          	auipc	a3,0x0
    802028d0:	0f468693          	addi	a3,a3,244 # 802029c0 <usertrap>
    802028d4:	eb14                	sd	a3,16(a4)
  p->trapframe->kernel_hartid = r_tp();         // hartid for cpuid()
    802028d6:	7138                	ld	a4,96(a0)
  asm volatile("mv %0, tp" : "=r" (x) );
    802028d8:	8692                	mv	a3,tp
    802028da:	f314                	sd	a3,32(a4)
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802028dc:	100026f3          	csrr	a3,sstatus
  // set up the registers that trampoline.S's sret will use
  // to get to user space.
  
  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
    802028e0:	eff6f693          	andi	a3,a3,-257
  x |= SSTATUS_SPIE; // enable interrupts in user mode
    802028e4:	0206e693          	ori	a3,a3,32
  asm volatile("csrw sstatus, %0" : : "r" (x));
    802028e8:	10069073          	csrw	sstatus,a3
  w_sstatus(x);

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);
    802028ec:	7138                	ld	a4,96(a0)
  asm volatile("csrw sepc, %0" : : "r" (x));
    802028ee:	6f18                	ld	a4,24(a4)
    802028f0:	14171073          	csrw	sepc,a4

  // tell trampoline.S the user page table to switch to.
  // printf("[usertrapret]p->pagetable: %p\n", p->pagetable);
  uint64 satp = MAKE_SATP(p->pagetable);
    802028f4:	692c                	ld	a1,80(a0)
    802028f6:	81b1                	srli	a1,a1,0xc

  // jump to trampoline.S at the top of memory, which 
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 fn = TRAMPOLINE + (userret - trampoline);
    802028f8:	00005717          	auipc	a4,0x5
    802028fc:	79870713          	addi	a4,a4,1944 # 80208090 <userret>
    80202900:	8f11                	sub	a4,a4,a2
    80202902:	97ba                	add	a5,a5,a4
  ((void (*)(uint64,uint64))fn)(TRAPFRAME, satp);
    80202904:	577d                	li	a4,-1
    80202906:	177e                	slli	a4,a4,0x3f
    80202908:	8dd9                	or	a1,a1,a4
    8020290a:	02000537          	lui	a0,0x2000
    8020290e:	157d                	addi	a0,a0,-1
    80202910:	0536                	slli	a0,a0,0xd
    80202912:	9782                	jalr	a5
}
    80202914:	60a2                	ld	ra,8(sp)
    80202916:	6402                	ld	s0,0(sp)
    80202918:	0141                	addi	sp,sp,16
    8020291a:	8082                	ret

000000008020291c <devintr>:
// Check if it's an external/software interrupt, 
// and handle it. 
// returns  2 if timer interrupt, 
//          1 if other device, 
//          0 if not recognized. 
int devintr(void) {
    8020291c:	1101                	addi	sp,sp,-32
    8020291e:	ec06                	sd	ra,24(sp)
    80202920:	e822                	sd	s0,16(sp)
    80202922:	e426                	sd	s1,8(sp)
    80202924:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202926:	14202773          	csrr	a4,scause
	uint64 scause = r_scause();
	//printf("scause:%p\n",scause);

	#if QEMU==SIFIVE_U 
	// handle external interrupt 
	if ((0x8000000000000000L & scause) && 9 == (scause & 0xff)) 
    8020292a:	00074d63          	bltz	a4,80202944 <devintr+0x28>
		sbi_set_mie();
		#endif 

		return 1;
	}
	else if (0x8000000000000005L == scause) {
    8020292e:	57fd                	li	a5,-1
    80202930:	17fe                	slli	a5,a5,0x3f
    80202932:	0795                	addi	a5,a5,5
		timer_tick();
		return 2;
	}
	else { return 0;}
    80202934:	4501                	li	a0,0
	else if (0x8000000000000005L == scause) {
    80202936:	06f70f63          	beq	a4,a5,802029b4 <devintr+0x98>
}
    8020293a:	60e2                	ld	ra,24(sp)
    8020293c:	6442                	ld	s0,16(sp)
    8020293e:	64a2                	ld	s1,8(sp)
    80202940:	6105                	addi	sp,sp,32
    80202942:	8082                	ret
	if ((0x8000000000000000L & scause) && 9 == (scause & 0xff)) 
    80202944:	0ff77793          	andi	a5,a4,255
    80202948:	46a5                	li	a3,9
    8020294a:	fed792e3          	bne	a5,a3,8020292e <devintr+0x12>
		int irq = plic_claim();
    8020294e:	00005097          	auipc	ra,0x5
    80202952:	96e080e7          	jalr	-1682(ra) # 802072bc <plic_claim>
    80202956:	84aa                	mv	s1,a0
		printf("irq:%d\n",irq);
    80202958:	85aa                	mv	a1,a0
    8020295a:	00007517          	auipc	a0,0x7
    8020295e:	e5e50513          	addi	a0,a0,-418 # 802097b8 <states.1723+0x38>
    80202962:	ffffe097          	auipc	ra,0xffffe
    80202966:	82c080e7          	jalr	-2004(ra) # 8020018e <printf>
		if (UART1_IRQ == irq) {
    8020296a:	4795                	li	a5,5
    8020296c:	02f48463          	beq	s1,a5,80202994 <devintr+0x78>
		return 1;
    80202970:	4505                	li	a0,1
		else if (irq) {
    80202972:	d4e1                	beqz	s1,8020293a <devintr+0x1e>
			printf("unexpected interrupt irq = %d\n", irq);
    80202974:	85a6                	mv	a1,s1
    80202976:	00007517          	auipc	a0,0x7
    8020297a:	e4a50513          	addi	a0,a0,-438 # 802097c0 <states.1723+0x40>
    8020297e:	ffffe097          	auipc	ra,0xffffe
    80202982:	810080e7          	jalr	-2032(ra) # 8020018e <printf>
		if (irq) { plic_complete(irq);}
    80202986:	8526                	mv	a0,s1
    80202988:	00005097          	auipc	ra,0x5
    8020298c:	95a080e7          	jalr	-1702(ra) # 802072e2 <plic_complete>
		return 1;
    80202990:	4505                	li	a0,1
    80202992:	b765                	j	8020293a <devintr+0x1e>
	SBI_CALL_1(SBI_CONSOLE_PUTCHAR, ch);
}

static inline int sbi_console_getchar(void)
{
	return SBI_CALL_0(SBI_CONSOLE_GETCHAR);
    80202994:	4501                	li	a0,0
    80202996:	4581                	li	a1,0
    80202998:	4601                	li	a2,0
    8020299a:	4681                	li	a3,0
    8020299c:	4889                	li	a7,2
    8020299e:	00000073          	ecall
    802029a2:	2501                	sext.w	a0,a0
			if (-1 != c) {
    802029a4:	57fd                	li	a5,-1
    802029a6:	fef500e3          	beq	a0,a5,80202986 <devintr+0x6a>
				consoleintr(c);
    802029aa:	00005097          	auipc	ra,0x5
    802029ae:	b40080e7          	jalr	-1216(ra) # 802074ea <consoleintr>
    802029b2:	bfd1                	j	80202986 <devintr+0x6a>
		timer_tick();
    802029b4:	00002097          	auipc	ra,0x2
    802029b8:	788080e7          	jalr	1928(ra) # 8020513c <timer_tick>
		return 2;
    802029bc:	4509                	li	a0,2
    802029be:	bfb5                	j	8020293a <devintr+0x1e>

00000000802029c0 <usertrap>:
{
    802029c0:	1101                	addi	sp,sp,-32
    802029c2:	ec06                	sd	ra,24(sp)
    802029c4:	e822                	sd	s0,16(sp)
    802029c6:	e426                	sd	s1,8(sp)
    802029c8:	e04a                	sd	s2,0(sp)
    802029ca:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802029cc:	100027f3          	csrr	a5,sstatus
  if((r_sstatus() & SSTATUS_SPP) != 0)
    802029d0:	1007f793          	andi	a5,a5,256
    802029d4:	e3ad                	bnez	a5,80202a36 <usertrap+0x76>
  asm volatile("csrw stvec, %0" : : "r" (x));
    802029d6:	00002797          	auipc	a5,0x2
    802029da:	67a78793          	addi	a5,a5,1658 # 80205050 <kernelvec>
    802029de:	10579073          	csrw	stvec,a5
  struct proc *p = myproc();
    802029e2:	fffff097          	auipc	ra,0xfffff
    802029e6:	1dc080e7          	jalr	476(ra) # 80201bbe <myproc>
    802029ea:	84aa                	mv	s1,a0
  p->trapframe->epc = r_sepc();
    802029ec:	713c                	ld	a5,96(a0)
  asm volatile("csrr %0, sepc" : "=r" (x) );
    802029ee:	14102773          	csrr	a4,sepc
    802029f2:	ef98                	sd	a4,24(a5)
  asm volatile("csrr %0, scause" : "=r" (x) );
    802029f4:	14202773          	csrr	a4,scause
  if(r_scause() == 8){
    802029f8:	47a1                	li	a5,8
    802029fa:	04f71c63          	bne	a4,a5,80202a52 <usertrap+0x92>
    if(p->killed)
    802029fe:	591c                	lw	a5,48(a0)
    80202a00:	e3b9                	bnez	a5,80202a46 <usertrap+0x86>
    p->trapframe->epc += 4;
    80202a02:	70b8                	ld	a4,96(s1)
    80202a04:	6f1c                	ld	a5,24(a4)
    80202a06:	0791                	addi	a5,a5,4
    80202a08:	ef1c                	sd	a5,24(a4)
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202a0a:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80202a0e:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202a12:	10079073          	csrw	sstatus,a5
    syscall();
    80202a16:	00000097          	auipc	ra,0x0
    80202a1a:	5d4080e7          	jalr	1492(ra) # 80202fea <syscall>
  if(p->killed)
    80202a1e:	589c                	lw	a5,48(s1)
    80202a20:	ebd1                	bnez	a5,80202ab4 <usertrap+0xf4>
  usertrapret();
    80202a22:	00000097          	auipc	ra,0x0
    80202a26:	e5c080e7          	jalr	-420(ra) # 8020287e <usertrapret>
}
    80202a2a:	60e2                	ld	ra,24(sp)
    80202a2c:	6442                	ld	s0,16(sp)
    80202a2e:	64a2                	ld	s1,8(sp)
    80202a30:	6902                	ld	s2,0(sp)
    80202a32:	6105                	addi	sp,sp,32
    80202a34:	8082                	ret
    panic("usertrap: not from user mode");
    80202a36:	00007517          	auipc	a0,0x7
    80202a3a:	daa50513          	addi	a0,a0,-598 # 802097e0 <states.1723+0x60>
    80202a3e:	ffffd097          	auipc	ra,0xffffd
    80202a42:	706080e7          	jalr	1798(ra) # 80200144 <panic>
      exit(-1);
    80202a46:	557d                	li	a0,-1
    80202a48:	00000097          	auipc	ra,0x0
    80202a4c:	8ba080e7          	jalr	-1862(ra) # 80202302 <exit>
    80202a50:	bf4d                	j	80202a02 <usertrap+0x42>
  else if((which_dev = devintr()) != 0){
    80202a52:	00000097          	auipc	ra,0x0
    80202a56:	eca080e7          	jalr	-310(ra) # 8020291c <devintr>
    80202a5a:	892a                	mv	s2,a0
    80202a5c:	c501                	beqz	a0,80202a64 <usertrap+0xa4>
  if(p->killed)
    80202a5e:	589c                	lw	a5,48(s1)
    80202a60:	c3b1                	beqz	a5,80202aa4 <usertrap+0xe4>
    80202a62:	a825                	j	80202a9a <usertrap+0xda>
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202a64:	142025f3          	csrr	a1,scause
    printf("\nusertrap(): unexpected scause %p pid=%d %s\n", r_scause(), p->pid, p->name);
    80202a68:	16048693          	addi	a3,s1,352
    80202a6c:	5c90                	lw	a2,56(s1)
    80202a6e:	00007517          	auipc	a0,0x7
    80202a72:	d9250513          	addi	a0,a0,-622 # 80209800 <states.1723+0x80>
    80202a76:	ffffd097          	auipc	ra,0xffffd
    80202a7a:	718080e7          	jalr	1816(ra) # 8020018e <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202a7e:	141025f3          	csrr	a1,sepc
  asm volatile("csrr %0, stval" : "=r" (x) );
    80202a82:	14302673          	csrr	a2,stval
    printf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    80202a86:	00007517          	auipc	a0,0x7
    80202a8a:	daa50513          	addi	a0,a0,-598 # 80209830 <states.1723+0xb0>
    80202a8e:	ffffd097          	auipc	ra,0xffffd
    80202a92:	700080e7          	jalr	1792(ra) # 8020018e <printf>
    p->killed = 1;
    80202a96:	4785                	li	a5,1
    80202a98:	d89c                	sw	a5,48(s1)
    exit(-1);
    80202a9a:	557d                	li	a0,-1
    80202a9c:	00000097          	auipc	ra,0x0
    80202aa0:	866080e7          	jalr	-1946(ra) # 80202302 <exit>
  if(which_dev == 2)
    80202aa4:	4789                	li	a5,2
    80202aa6:	f6f91ee3          	bne	s2,a5,80202a22 <usertrap+0x62>
    yield();
    80202aaa:	00000097          	auipc	ra,0x0
    80202aae:	938080e7          	jalr	-1736(ra) # 802023e2 <yield>
    80202ab2:	bf85                	j	80202a22 <usertrap+0x62>
  int which_dev = 0;
    80202ab4:	4901                	li	s2,0
    80202ab6:	b7d5                	j	80202a9a <usertrap+0xda>

0000000080202ab8 <kerneltrap>:
kerneltrap() {
    80202ab8:	7179                	addi	sp,sp,-48
    80202aba:	f406                	sd	ra,40(sp)
    80202abc:	f022                	sd	s0,32(sp)
    80202abe:	ec26                	sd	s1,24(sp)
    80202ac0:	e84a                	sd	s2,16(sp)
    80202ac2:	e44e                	sd	s3,8(sp)
    80202ac4:	1800                	addi	s0,sp,48
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202ac6:	14102973          	csrr	s2,sepc
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202aca:	100024f3          	csrr	s1,sstatus
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202ace:	142029f3          	csrr	s3,scause
  if((sstatus & SSTATUS_SPP) == 0)
    80202ad2:	1004f793          	andi	a5,s1,256
    80202ad6:	cb85                	beqz	a5,80202b06 <kerneltrap+0x4e>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202ad8:	100027f3          	csrr	a5,sstatus
  return (x & SSTATUS_SIE) != 0;
    80202adc:	8b89                	andi	a5,a5,2
  if(intr_get() != 0)
    80202ade:	ef85                	bnez	a5,80202b16 <kerneltrap+0x5e>
  if((which_dev = devintr()) == 0){
    80202ae0:	00000097          	auipc	ra,0x0
    80202ae4:	e3c080e7          	jalr	-452(ra) # 8020291c <devintr>
    80202ae8:	cd1d                	beqz	a0,80202b26 <kerneltrap+0x6e>
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING) {
    80202aea:	4789                	li	a5,2
    80202aec:	08f50b63          	beq	a0,a5,80202b82 <kerneltrap+0xca>
  asm volatile("csrw sepc, %0" : : "r" (x));
    80202af0:	14191073          	csrw	sepc,s2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202af4:	10049073          	csrw	sstatus,s1
}
    80202af8:	70a2                	ld	ra,40(sp)
    80202afa:	7402                	ld	s0,32(sp)
    80202afc:	64e2                	ld	s1,24(sp)
    80202afe:	6942                	ld	s2,16(sp)
    80202b00:	69a2                	ld	s3,8(sp)
    80202b02:	6145                	addi	sp,sp,48
    80202b04:	8082                	ret
    panic("kerneltrap: not from supervisor mode");
    80202b06:	00007517          	auipc	a0,0x7
    80202b0a:	d4a50513          	addi	a0,a0,-694 # 80209850 <states.1723+0xd0>
    80202b0e:	ffffd097          	auipc	ra,0xffffd
    80202b12:	636080e7          	jalr	1590(ra) # 80200144 <panic>
    panic("kerneltrap: interrupts enabled");
    80202b16:	00007517          	auipc	a0,0x7
    80202b1a:	d6250513          	addi	a0,a0,-670 # 80209878 <states.1723+0xf8>
    80202b1e:	ffffd097          	auipc	ra,0xffffd
    80202b22:	626080e7          	jalr	1574(ra) # 80200144 <panic>
    printf("\nscause %p\n", scause);
    80202b26:	85ce                	mv	a1,s3
    80202b28:	00007517          	auipc	a0,0x7
    80202b2c:	d7050513          	addi	a0,a0,-656 # 80209898 <states.1723+0x118>
    80202b30:	ffffd097          	auipc	ra,0xffffd
    80202b34:	65e080e7          	jalr	1630(ra) # 8020018e <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202b38:	141025f3          	csrr	a1,sepc
  asm volatile("csrr %0, stval" : "=r" (x) );
    80202b3c:	14302673          	csrr	a2,stval
  asm volatile("mv %0, tp" : "=r" (x) );
    80202b40:	8692                	mv	a3,tp
    printf("sepc=%p stval=%p hart=%d\n", r_sepc(), r_stval(), r_tp());
    80202b42:	00007517          	auipc	a0,0x7
    80202b46:	d6650513          	addi	a0,a0,-666 # 802098a8 <states.1723+0x128>
    80202b4a:	ffffd097          	auipc	ra,0xffffd
    80202b4e:	644080e7          	jalr	1604(ra) # 8020018e <printf>
    struct proc *p = myproc();
    80202b52:	fffff097          	auipc	ra,0xfffff
    80202b56:	06c080e7          	jalr	108(ra) # 80201bbe <myproc>
    if (p != 0) {
    80202b5a:	cd01                	beqz	a0,80202b72 <kerneltrap+0xba>
      printf("pid: %d, name: %s\n", p->pid, p->name);
    80202b5c:	16050613          	addi	a2,a0,352
    80202b60:	5d0c                	lw	a1,56(a0)
    80202b62:	00007517          	auipc	a0,0x7
    80202b66:	d6650513          	addi	a0,a0,-666 # 802098c8 <states.1723+0x148>
    80202b6a:	ffffd097          	auipc	ra,0xffffd
    80202b6e:	624080e7          	jalr	1572(ra) # 8020018e <printf>
    panic("kerneltrap");
    80202b72:	00007517          	auipc	a0,0x7
    80202b76:	d6e50513          	addi	a0,a0,-658 # 802098e0 <states.1723+0x160>
    80202b7a:	ffffd097          	auipc	ra,0xffffd
    80202b7e:	5ca080e7          	jalr	1482(ra) # 80200144 <panic>
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING) {
    80202b82:	fffff097          	auipc	ra,0xfffff
    80202b86:	03c080e7          	jalr	60(ra) # 80201bbe <myproc>
    80202b8a:	d13d                	beqz	a0,80202af0 <kerneltrap+0x38>
    80202b8c:	fffff097          	auipc	ra,0xfffff
    80202b90:	032080e7          	jalr	50(ra) # 80201bbe <myproc>
    80202b94:	4d18                	lw	a4,24(a0)
    80202b96:	478d                	li	a5,3
    80202b98:	f4f71ce3          	bne	a4,a5,80202af0 <kerneltrap+0x38>
    yield();
    80202b9c:	00000097          	auipc	ra,0x0
    80202ba0:	846080e7          	jalr	-1978(ra) # 802023e2 <yield>
    80202ba4:	b7b1                	j	80202af0 <kerneltrap+0x38>

0000000080202ba6 <trapframedump>:

void trapframedump(struct trapframe *tf)
{
    80202ba6:	1101                	addi	sp,sp,-32
    80202ba8:	ec06                	sd	ra,24(sp)
    80202baa:	e822                	sd	s0,16(sp)
    80202bac:	e426                	sd	s1,8(sp)
    80202bae:	1000                	addi	s0,sp,32
    80202bb0:	84aa                	mv	s1,a0
  printf("a0: %p\t", tf->a0);
    80202bb2:	792c                	ld	a1,112(a0)
    80202bb4:	00007517          	auipc	a0,0x7
    80202bb8:	d3c50513          	addi	a0,a0,-708 # 802098f0 <states.1723+0x170>
    80202bbc:	ffffd097          	auipc	ra,0xffffd
    80202bc0:	5d2080e7          	jalr	1490(ra) # 8020018e <printf>
  printf("a1: %p\t", tf->a1);
    80202bc4:	7cac                	ld	a1,120(s1)
    80202bc6:	00007517          	auipc	a0,0x7
    80202bca:	d3250513          	addi	a0,a0,-718 # 802098f8 <states.1723+0x178>
    80202bce:	ffffd097          	auipc	ra,0xffffd
    80202bd2:	5c0080e7          	jalr	1472(ra) # 8020018e <printf>
  printf("a2: %p\t", tf->a2);
    80202bd6:	60cc                	ld	a1,128(s1)
    80202bd8:	00007517          	auipc	a0,0x7
    80202bdc:	d2850513          	addi	a0,a0,-728 # 80209900 <states.1723+0x180>
    80202be0:	ffffd097          	auipc	ra,0xffffd
    80202be4:	5ae080e7          	jalr	1454(ra) # 8020018e <printf>
  printf("a3: %p\n", tf->a3);
    80202be8:	64cc                	ld	a1,136(s1)
    80202bea:	00007517          	auipc	a0,0x7
    80202bee:	d1e50513          	addi	a0,a0,-738 # 80209908 <states.1723+0x188>
    80202bf2:	ffffd097          	auipc	ra,0xffffd
    80202bf6:	59c080e7          	jalr	1436(ra) # 8020018e <printf>
  printf("a4: %p\t", tf->a4);
    80202bfa:	68cc                	ld	a1,144(s1)
    80202bfc:	00007517          	auipc	a0,0x7
    80202c00:	d1450513          	addi	a0,a0,-748 # 80209910 <states.1723+0x190>
    80202c04:	ffffd097          	auipc	ra,0xffffd
    80202c08:	58a080e7          	jalr	1418(ra) # 8020018e <printf>
  printf("a5: %p\t", tf->a5);
    80202c0c:	6ccc                	ld	a1,152(s1)
    80202c0e:	00007517          	auipc	a0,0x7
    80202c12:	d0a50513          	addi	a0,a0,-758 # 80209918 <states.1723+0x198>
    80202c16:	ffffd097          	auipc	ra,0xffffd
    80202c1a:	578080e7          	jalr	1400(ra) # 8020018e <printf>
  printf("a6: %p\t", tf->a6);
    80202c1e:	70cc                	ld	a1,160(s1)
    80202c20:	00007517          	auipc	a0,0x7
    80202c24:	d0050513          	addi	a0,a0,-768 # 80209920 <states.1723+0x1a0>
    80202c28:	ffffd097          	auipc	ra,0xffffd
    80202c2c:	566080e7          	jalr	1382(ra) # 8020018e <printf>
  printf("a7: %p\n", tf->a7);
    80202c30:	74cc                	ld	a1,168(s1)
    80202c32:	00007517          	auipc	a0,0x7
    80202c36:	cf650513          	addi	a0,a0,-778 # 80209928 <states.1723+0x1a8>
    80202c3a:	ffffd097          	auipc	ra,0xffffd
    80202c3e:	554080e7          	jalr	1364(ra) # 8020018e <printf>
  printf("t0: %p\t", tf->t0);
    80202c42:	64ac                	ld	a1,72(s1)
    80202c44:	00007517          	auipc	a0,0x7
    80202c48:	cec50513          	addi	a0,a0,-788 # 80209930 <states.1723+0x1b0>
    80202c4c:	ffffd097          	auipc	ra,0xffffd
    80202c50:	542080e7          	jalr	1346(ra) # 8020018e <printf>
  printf("t1: %p\t", tf->t1);
    80202c54:	68ac                	ld	a1,80(s1)
    80202c56:	00007517          	auipc	a0,0x7
    80202c5a:	ce250513          	addi	a0,a0,-798 # 80209938 <states.1723+0x1b8>
    80202c5e:	ffffd097          	auipc	ra,0xffffd
    80202c62:	530080e7          	jalr	1328(ra) # 8020018e <printf>
  printf("t2: %p\t", tf->t2);
    80202c66:	6cac                	ld	a1,88(s1)
    80202c68:	00007517          	auipc	a0,0x7
    80202c6c:	cd850513          	addi	a0,a0,-808 # 80209940 <states.1723+0x1c0>
    80202c70:	ffffd097          	auipc	ra,0xffffd
    80202c74:	51e080e7          	jalr	1310(ra) # 8020018e <printf>
  printf("t3: %p\n", tf->t3);
    80202c78:	1004b583          	ld	a1,256(s1)
    80202c7c:	00007517          	auipc	a0,0x7
    80202c80:	ccc50513          	addi	a0,a0,-820 # 80209948 <states.1723+0x1c8>
    80202c84:	ffffd097          	auipc	ra,0xffffd
    80202c88:	50a080e7          	jalr	1290(ra) # 8020018e <printf>
  printf("t4: %p\t", tf->t4);
    80202c8c:	1084b583          	ld	a1,264(s1)
    80202c90:	00007517          	auipc	a0,0x7
    80202c94:	cc050513          	addi	a0,a0,-832 # 80209950 <states.1723+0x1d0>
    80202c98:	ffffd097          	auipc	ra,0xffffd
    80202c9c:	4f6080e7          	jalr	1270(ra) # 8020018e <printf>
  printf("t5: %p\t", tf->t5);
    80202ca0:	1104b583          	ld	a1,272(s1)
    80202ca4:	00007517          	auipc	a0,0x7
    80202ca8:	cb450513          	addi	a0,a0,-844 # 80209958 <states.1723+0x1d8>
    80202cac:	ffffd097          	auipc	ra,0xffffd
    80202cb0:	4e2080e7          	jalr	1250(ra) # 8020018e <printf>
  printf("t6: %p\t", tf->t6);
    80202cb4:	1184b583          	ld	a1,280(s1)
    80202cb8:	00007517          	auipc	a0,0x7
    80202cbc:	ca850513          	addi	a0,a0,-856 # 80209960 <states.1723+0x1e0>
    80202cc0:	ffffd097          	auipc	ra,0xffffd
    80202cc4:	4ce080e7          	jalr	1230(ra) # 8020018e <printf>
  printf("s0: %p\n", tf->s0);
    80202cc8:	70ac                	ld	a1,96(s1)
    80202cca:	00007517          	auipc	a0,0x7
    80202cce:	c9e50513          	addi	a0,a0,-866 # 80209968 <states.1723+0x1e8>
    80202cd2:	ffffd097          	auipc	ra,0xffffd
    80202cd6:	4bc080e7          	jalr	1212(ra) # 8020018e <printf>
  printf("s1: %p\t", tf->s1);
    80202cda:	74ac                	ld	a1,104(s1)
    80202cdc:	00007517          	auipc	a0,0x7
    80202ce0:	c9450513          	addi	a0,a0,-876 # 80209970 <states.1723+0x1f0>
    80202ce4:	ffffd097          	auipc	ra,0xffffd
    80202ce8:	4aa080e7          	jalr	1194(ra) # 8020018e <printf>
  printf("s2: %p\t", tf->s2);
    80202cec:	78cc                	ld	a1,176(s1)
    80202cee:	00007517          	auipc	a0,0x7
    80202cf2:	c8a50513          	addi	a0,a0,-886 # 80209978 <states.1723+0x1f8>
    80202cf6:	ffffd097          	auipc	ra,0xffffd
    80202cfa:	498080e7          	jalr	1176(ra) # 8020018e <printf>
  printf("s3: %p\t", tf->s3);
    80202cfe:	7ccc                	ld	a1,184(s1)
    80202d00:	00007517          	auipc	a0,0x7
    80202d04:	c8050513          	addi	a0,a0,-896 # 80209980 <states.1723+0x200>
    80202d08:	ffffd097          	auipc	ra,0xffffd
    80202d0c:	486080e7          	jalr	1158(ra) # 8020018e <printf>
  printf("s4: %p\n", tf->s4);
    80202d10:	60ec                	ld	a1,192(s1)
    80202d12:	00007517          	auipc	a0,0x7
    80202d16:	c7650513          	addi	a0,a0,-906 # 80209988 <states.1723+0x208>
    80202d1a:	ffffd097          	auipc	ra,0xffffd
    80202d1e:	474080e7          	jalr	1140(ra) # 8020018e <printf>
  printf("s5: %p\t", tf->s5);
    80202d22:	64ec                	ld	a1,200(s1)
    80202d24:	00007517          	auipc	a0,0x7
    80202d28:	c6c50513          	addi	a0,a0,-916 # 80209990 <states.1723+0x210>
    80202d2c:	ffffd097          	auipc	ra,0xffffd
    80202d30:	462080e7          	jalr	1122(ra) # 8020018e <printf>
  printf("s6: %p\t", tf->s6);
    80202d34:	68ec                	ld	a1,208(s1)
    80202d36:	00007517          	auipc	a0,0x7
    80202d3a:	c6250513          	addi	a0,a0,-926 # 80209998 <states.1723+0x218>
    80202d3e:	ffffd097          	auipc	ra,0xffffd
    80202d42:	450080e7          	jalr	1104(ra) # 8020018e <printf>
  printf("s7: %p\t", tf->s7);
    80202d46:	6cec                	ld	a1,216(s1)
    80202d48:	00007517          	auipc	a0,0x7
    80202d4c:	c5850513          	addi	a0,a0,-936 # 802099a0 <states.1723+0x220>
    80202d50:	ffffd097          	auipc	ra,0xffffd
    80202d54:	43e080e7          	jalr	1086(ra) # 8020018e <printf>
  printf("s8: %p\n", tf->s8);
    80202d58:	70ec                	ld	a1,224(s1)
    80202d5a:	00007517          	auipc	a0,0x7
    80202d5e:	c4e50513          	addi	a0,a0,-946 # 802099a8 <states.1723+0x228>
    80202d62:	ffffd097          	auipc	ra,0xffffd
    80202d66:	42c080e7          	jalr	1068(ra) # 8020018e <printf>
  printf("s9: %p\t", tf->s9);
    80202d6a:	74ec                	ld	a1,232(s1)
    80202d6c:	00007517          	auipc	a0,0x7
    80202d70:	c4450513          	addi	a0,a0,-956 # 802099b0 <states.1723+0x230>
    80202d74:	ffffd097          	auipc	ra,0xffffd
    80202d78:	41a080e7          	jalr	1050(ra) # 8020018e <printf>
  printf("s10: %p\t", tf->s10);
    80202d7c:	78ec                	ld	a1,240(s1)
    80202d7e:	00007517          	auipc	a0,0x7
    80202d82:	c3a50513          	addi	a0,a0,-966 # 802099b8 <states.1723+0x238>
    80202d86:	ffffd097          	auipc	ra,0xffffd
    80202d8a:	408080e7          	jalr	1032(ra) # 8020018e <printf>
  printf("s11: %p\t", tf->s11);
    80202d8e:	7cec                	ld	a1,248(s1)
    80202d90:	00007517          	auipc	a0,0x7
    80202d94:	c3850513          	addi	a0,a0,-968 # 802099c8 <states.1723+0x248>
    80202d98:	ffffd097          	auipc	ra,0xffffd
    80202d9c:	3f6080e7          	jalr	1014(ra) # 8020018e <printf>
  printf("ra: %p\n", tf->ra);
    80202da0:	748c                	ld	a1,40(s1)
    80202da2:	00007517          	auipc	a0,0x7
    80202da6:	8d650513          	addi	a0,a0,-1834 # 80209678 <digits+0x2f8>
    80202daa:	ffffd097          	auipc	ra,0xffffd
    80202dae:	3e4080e7          	jalr	996(ra) # 8020018e <printf>
  printf("sp: %p\t", tf->sp);
    80202db2:	788c                	ld	a1,48(s1)
    80202db4:	00007517          	auipc	a0,0x7
    80202db8:	c2450513          	addi	a0,a0,-988 # 802099d8 <states.1723+0x258>
    80202dbc:	ffffd097          	auipc	ra,0xffffd
    80202dc0:	3d2080e7          	jalr	978(ra) # 8020018e <printf>
  printf("gp: %p\t", tf->gp);
    80202dc4:	7c8c                	ld	a1,56(s1)
    80202dc6:	00007517          	auipc	a0,0x7
    80202dca:	c1a50513          	addi	a0,a0,-998 # 802099e0 <states.1723+0x260>
    80202dce:	ffffd097          	auipc	ra,0xffffd
    80202dd2:	3c0080e7          	jalr	960(ra) # 8020018e <printf>
  printf("tp: %p\t", tf->tp);
    80202dd6:	60ac                	ld	a1,64(s1)
    80202dd8:	00007517          	auipc	a0,0x7
    80202ddc:	c1050513          	addi	a0,a0,-1008 # 802099e8 <states.1723+0x268>
    80202de0:	ffffd097          	auipc	ra,0xffffd
    80202de4:	3ae080e7          	jalr	942(ra) # 8020018e <printf>
  printf("epc: %p\n", tf->epc);
    80202de8:	6c8c                	ld	a1,24(s1)
    80202dea:	00007517          	auipc	a0,0x7
    80202dee:	c0650513          	addi	a0,a0,-1018 # 802099f0 <states.1723+0x270>
    80202df2:	ffffd097          	auipc	ra,0xffffd
    80202df6:	39c080e7          	jalr	924(ra) # 8020018e <printf>
}
    80202dfa:	60e2                	ld	ra,24(sp)
    80202dfc:	6442                	ld	s0,16(sp)
    80202dfe:	64a2                	ld	s1,8(sp)
    80202e00:	6105                	addi	sp,sp,32
    80202e02:	8082                	ret

0000000080202e04 <argraw>:
  return strlen(buf);
}

static uint64
argraw(int n)
{
    80202e04:	1101                	addi	sp,sp,-32
    80202e06:	ec06                	sd	ra,24(sp)
    80202e08:	e822                	sd	s0,16(sp)
    80202e0a:	e426                	sd	s1,8(sp)
    80202e0c:	1000                	addi	s0,sp,32
    80202e0e:	84aa                	mv	s1,a0
  struct proc *p = myproc();
    80202e10:	fffff097          	auipc	ra,0xfffff
    80202e14:	dae080e7          	jalr	-594(ra) # 80201bbe <myproc>
  switch (n) {
    80202e18:	4795                	li	a5,5
    80202e1a:	0497e163          	bltu	a5,s1,80202e5c <argraw+0x58>
    80202e1e:	048a                	slli	s1,s1,0x2
    80202e20:	00007717          	auipc	a4,0x7
    80202e24:	d4070713          	addi	a4,a4,-704 # 80209b60 <states.1723+0x3e0>
    80202e28:	94ba                	add	s1,s1,a4
    80202e2a:	409c                	lw	a5,0(s1)
    80202e2c:	97ba                	add	a5,a5,a4
    80202e2e:	8782                	jr	a5
  case 0:
    return p->trapframe->a0;
    80202e30:	713c                	ld	a5,96(a0)
    80202e32:	7ba8                	ld	a0,112(a5)
  case 5:
    return p->trapframe->a5;
  }
  panic("argraw");
  return -1;
}
    80202e34:	60e2                	ld	ra,24(sp)
    80202e36:	6442                	ld	s0,16(sp)
    80202e38:	64a2                	ld	s1,8(sp)
    80202e3a:	6105                	addi	sp,sp,32
    80202e3c:	8082                	ret
    return p->trapframe->a1;
    80202e3e:	713c                	ld	a5,96(a0)
    80202e40:	7fa8                	ld	a0,120(a5)
    80202e42:	bfcd                	j	80202e34 <argraw+0x30>
    return p->trapframe->a2;
    80202e44:	713c                	ld	a5,96(a0)
    80202e46:	63c8                	ld	a0,128(a5)
    80202e48:	b7f5                	j	80202e34 <argraw+0x30>
    return p->trapframe->a3;
    80202e4a:	713c                	ld	a5,96(a0)
    80202e4c:	67c8                	ld	a0,136(a5)
    80202e4e:	b7dd                	j	80202e34 <argraw+0x30>
    return p->trapframe->a4;
    80202e50:	713c                	ld	a5,96(a0)
    80202e52:	6bc8                	ld	a0,144(a5)
    80202e54:	b7c5                	j	80202e34 <argraw+0x30>
    return p->trapframe->a5;
    80202e56:	713c                	ld	a5,96(a0)
    80202e58:	6fc8                	ld	a0,152(a5)
    80202e5a:	bfe9                	j	80202e34 <argraw+0x30>
  panic("argraw");
    80202e5c:	00007517          	auipc	a0,0x7
    80202e60:	ba450513          	addi	a0,a0,-1116 # 80209a00 <states.1723+0x280>
    80202e64:	ffffd097          	auipc	ra,0xffffd
    80202e68:	2e0080e7          	jalr	736(ra) # 80200144 <panic>

0000000080202e6c <sys_sysinfo>:
    return 0;
}

uint64
sys_sysinfo(void)
{
    80202e6c:	7179                	addi	sp,sp,-48
    80202e6e:	f406                	sd	ra,40(sp)
    80202e70:	f022                	sd	s0,32(sp)
    80202e72:	ec26                	sd	s1,24(sp)
    80202e74:	1800                	addi	s0,sp,48
  *ip = argraw(n);
    80202e76:	4501                	li	a0,0
    80202e78:	00000097          	auipc	ra,0x0
    80202e7c:	f8c080e7          	jalr	-116(ra) # 80202e04 <argraw>
    80202e80:	84aa                	mv	s1,a0
  if (argaddr(0, &addr) < 0) {
    return -1;
  }

  struct sysinfo info;
  info.freemem = freemem_amount();
    80202e82:	ffffd097          	auipc	ra,0xffffd
    80202e86:	76c080e7          	jalr	1900(ra) # 802005ee <freemem_amount>
    80202e8a:	fca43823          	sd	a0,-48(s0)
  info.nproc = procnum();
    80202e8e:	00000097          	auipc	ra,0x0
    80202e92:	90a080e7          	jalr	-1782(ra) # 80202798 <procnum>
    80202e96:	fca43c23          	sd	a0,-40(s0)

  // if (copyout(p->pagetable, addr, (char *)&info, sizeof(info)) < 0) {
  if (copyout2(addr, (char *)&info, sizeof(info)) < 0) {
    80202e9a:	4641                	li	a2,16
    80202e9c:	fd040593          	addi	a1,s0,-48
    80202ea0:	8526                	mv	a0,s1
    80202ea2:	ffffe097          	auipc	ra,0xffffe
    80202ea6:	630080e7          	jalr	1584(ra) # 802014d2 <copyout2>
    return -1;
  }

  return 0;
}
    80202eaa:	957d                	srai	a0,a0,0x3f
    80202eac:	70a2                	ld	ra,40(sp)
    80202eae:	7402                	ld	s0,32(sp)
    80202eb0:	64e2                	ld	s1,24(sp)
    80202eb2:	6145                	addi	sp,sp,48
    80202eb4:	8082                	ret

0000000080202eb6 <fetchaddr>:
{
    80202eb6:	1101                	addi	sp,sp,-32
    80202eb8:	ec06                	sd	ra,24(sp)
    80202eba:	e822                	sd	s0,16(sp)
    80202ebc:	e426                	sd	s1,8(sp)
    80202ebe:	e04a                	sd	s2,0(sp)
    80202ec0:	1000                	addi	s0,sp,32
    80202ec2:	84aa                	mv	s1,a0
    80202ec4:	892e                	mv	s2,a1
  struct proc *p = myproc();
    80202ec6:	fffff097          	auipc	ra,0xfffff
    80202eca:	cf8080e7          	jalr	-776(ra) # 80201bbe <myproc>
  if(addr >= p->sz || addr+sizeof(uint64) > p->sz)
    80202ece:	653c                	ld	a5,72(a0)
    80202ed0:	02f4f763          	bgeu	s1,a5,80202efe <fetchaddr+0x48>
    80202ed4:	00848713          	addi	a4,s1,8
    80202ed8:	02e7e563          	bltu	a5,a4,80202f02 <fetchaddr+0x4c>
  if(copyin2((char *)ip, addr, sizeof(*ip)) != 0)
    80202edc:	4621                	li	a2,8
    80202ede:	85a6                	mv	a1,s1
    80202ee0:	854a                	mv	a0,s2
    80202ee2:	ffffe097          	auipc	ra,0xffffe
    80202ee6:	6ce080e7          	jalr	1742(ra) # 802015b0 <copyin2>
    80202eea:	00a03533          	snez	a0,a0
    80202eee:	40a00533          	neg	a0,a0
}
    80202ef2:	60e2                	ld	ra,24(sp)
    80202ef4:	6442                	ld	s0,16(sp)
    80202ef6:	64a2                	ld	s1,8(sp)
    80202ef8:	6902                	ld	s2,0(sp)
    80202efa:	6105                	addi	sp,sp,32
    80202efc:	8082                	ret
    return -1;
    80202efe:	557d                	li	a0,-1
    80202f00:	bfcd                	j	80202ef2 <fetchaddr+0x3c>
    80202f02:	557d                	li	a0,-1
    80202f04:	b7fd                	j	80202ef2 <fetchaddr+0x3c>

0000000080202f06 <fetchstr>:
{
    80202f06:	1101                	addi	sp,sp,-32
    80202f08:	ec06                	sd	ra,24(sp)
    80202f0a:	e822                	sd	s0,16(sp)
    80202f0c:	e426                	sd	s1,8(sp)
    80202f0e:	1000                	addi	s0,sp,32
    80202f10:	84ae                	mv	s1,a1
  int err = copyinstr2(buf, addr, max);
    80202f12:	85aa                	mv	a1,a0
    80202f14:	8526                	mv	a0,s1
    80202f16:	ffffe097          	auipc	ra,0xffffe
    80202f1a:	7a0080e7          	jalr	1952(ra) # 802016b6 <copyinstr2>
  if(err < 0)
    80202f1e:	00054763          	bltz	a0,80202f2c <fetchstr+0x26>
  return strlen(buf);
    80202f22:	8526                	mv	a0,s1
    80202f24:	ffffe097          	auipc	ra,0xffffe
    80202f28:	9f4080e7          	jalr	-1548(ra) # 80200918 <strlen>
}
    80202f2c:	60e2                	ld	ra,24(sp)
    80202f2e:	6442                	ld	s0,16(sp)
    80202f30:	64a2                	ld	s1,8(sp)
    80202f32:	6105                	addi	sp,sp,32
    80202f34:	8082                	ret

0000000080202f36 <argint>:
{
    80202f36:	1101                	addi	sp,sp,-32
    80202f38:	ec06                	sd	ra,24(sp)
    80202f3a:	e822                	sd	s0,16(sp)
    80202f3c:	e426                	sd	s1,8(sp)
    80202f3e:	1000                	addi	s0,sp,32
    80202f40:	84ae                	mv	s1,a1
  *ip = argraw(n);
    80202f42:	00000097          	auipc	ra,0x0
    80202f46:	ec2080e7          	jalr	-318(ra) # 80202e04 <argraw>
    80202f4a:	c088                	sw	a0,0(s1)
}
    80202f4c:	4501                	li	a0,0
    80202f4e:	60e2                	ld	ra,24(sp)
    80202f50:	6442                	ld	s0,16(sp)
    80202f52:	64a2                	ld	s1,8(sp)
    80202f54:	6105                	addi	sp,sp,32
    80202f56:	8082                	ret

0000000080202f58 <sys_test_proc>:
sys_test_proc(void) {
    80202f58:	1101                	addi	sp,sp,-32
    80202f5a:	ec06                	sd	ra,24(sp)
    80202f5c:	e822                	sd	s0,16(sp)
    80202f5e:	1000                	addi	s0,sp,32
    argint(0, &n);
    80202f60:	fec40593          	addi	a1,s0,-20
    80202f64:	4501                	li	a0,0
    80202f66:	00000097          	auipc	ra,0x0
    80202f6a:	fd0080e7          	jalr	-48(ra) # 80202f36 <argint>
    printf("hello world from proc %d, hart %d, arg %d\n", myproc()->pid, r_tp(), n);
    80202f6e:	fffff097          	auipc	ra,0xfffff
    80202f72:	c50080e7          	jalr	-944(ra) # 80201bbe <myproc>
    80202f76:	8612                	mv	a2,tp
    80202f78:	fec42683          	lw	a3,-20(s0)
    80202f7c:	5d0c                	lw	a1,56(a0)
    80202f7e:	00007517          	auipc	a0,0x7
    80202f82:	a8a50513          	addi	a0,a0,-1398 # 80209a08 <states.1723+0x288>
    80202f86:	ffffd097          	auipc	ra,0xffffd
    80202f8a:	208080e7          	jalr	520(ra) # 8020018e <printf>
}
    80202f8e:	4501                	li	a0,0
    80202f90:	60e2                	ld	ra,24(sp)
    80202f92:	6442                	ld	s0,16(sp)
    80202f94:	6105                	addi	sp,sp,32
    80202f96:	8082                	ret

0000000080202f98 <argaddr>:
{
    80202f98:	1101                	addi	sp,sp,-32
    80202f9a:	ec06                	sd	ra,24(sp)
    80202f9c:	e822                	sd	s0,16(sp)
    80202f9e:	e426                	sd	s1,8(sp)
    80202fa0:	1000                	addi	s0,sp,32
    80202fa2:	84ae                	mv	s1,a1
  *ip = argraw(n);
    80202fa4:	00000097          	auipc	ra,0x0
    80202fa8:	e60080e7          	jalr	-416(ra) # 80202e04 <argraw>
    80202fac:	e088                	sd	a0,0(s1)
}
    80202fae:	4501                	li	a0,0
    80202fb0:	60e2                	ld	ra,24(sp)
    80202fb2:	6442                	ld	s0,16(sp)
    80202fb4:	64a2                	ld	s1,8(sp)
    80202fb6:	6105                	addi	sp,sp,32
    80202fb8:	8082                	ret

0000000080202fba <argstr>:
{
    80202fba:	1101                	addi	sp,sp,-32
    80202fbc:	ec06                	sd	ra,24(sp)
    80202fbe:	e822                	sd	s0,16(sp)
    80202fc0:	e426                	sd	s1,8(sp)
    80202fc2:	e04a                	sd	s2,0(sp)
    80202fc4:	1000                	addi	s0,sp,32
    80202fc6:	84ae                	mv	s1,a1
    80202fc8:	8932                	mv	s2,a2
  *ip = argraw(n);
    80202fca:	00000097          	auipc	ra,0x0
    80202fce:	e3a080e7          	jalr	-454(ra) # 80202e04 <argraw>
  return fetchstr(addr, buf, max);
    80202fd2:	864a                	mv	a2,s2
    80202fd4:	85a6                	mv	a1,s1
    80202fd6:	00000097          	auipc	ra,0x0
    80202fda:	f30080e7          	jalr	-208(ra) # 80202f06 <fetchstr>
}
    80202fde:	60e2                	ld	ra,24(sp)
    80202fe0:	6442                	ld	s0,16(sp)
    80202fe2:	64a2                	ld	s1,8(sp)
    80202fe4:	6902                	ld	s2,0(sp)
    80202fe6:	6105                	addi	sp,sp,32
    80202fe8:	8082                	ret

0000000080202fea <syscall>:
{
    80202fea:	7179                	addi	sp,sp,-48
    80202fec:	f406                	sd	ra,40(sp)
    80202fee:	f022                	sd	s0,32(sp)
    80202ff0:	ec26                	sd	s1,24(sp)
    80202ff2:	e84a                	sd	s2,16(sp)
    80202ff4:	e44e                	sd	s3,8(sp)
    80202ff6:	1800                	addi	s0,sp,48
  struct proc *p = myproc();
    80202ff8:	fffff097          	auipc	ra,0xfffff
    80202ffc:	bc6080e7          	jalr	-1082(ra) # 80201bbe <myproc>
    80203000:	84aa                	mv	s1,a0
  num = p->trapframe->a7;
    80203002:	06053903          	ld	s2,96(a0)
    80203006:	0a893783          	ld	a5,168(s2)
    8020300a:	0007899b          	sext.w	s3,a5
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    8020300e:	37fd                	addiw	a5,a5,-1
    80203010:	476d                	li	a4,27
    80203012:	04f76863          	bltu	a4,a5,80203062 <syscall+0x78>
    80203016:	00399713          	slli	a4,s3,0x3
    8020301a:	00007797          	auipc	a5,0x7
    8020301e:	b5e78793          	addi	a5,a5,-1186 # 80209b78 <syscalls>
    80203022:	97ba                	add	a5,a5,a4
    80203024:	639c                	ld	a5,0(a5)
    80203026:	cf95                	beqz	a5,80203062 <syscall+0x78>
    p->trapframe->a0 = syscalls[num]();
    80203028:	9782                	jalr	a5
    8020302a:	06a93823          	sd	a0,112(s2)
    if ((p->tmask & (1 << num)) != 0) {
    8020302e:	1704a783          	lw	a5,368(s1)
    80203032:	4137d7bb          	sraw	a5,a5,s3
    80203036:	8b85                	andi	a5,a5,1
    80203038:	c7a1                	beqz	a5,80203080 <syscall+0x96>
      printf("pid %d: %s -> %d\n", p->pid, sysnames[num], p->trapframe->a0);
    8020303a:	70b8                	ld	a4,96(s1)
    8020303c:	098e                	slli	s3,s3,0x3
    8020303e:	00007797          	auipc	a5,0x7
    80203042:	b3a78793          	addi	a5,a5,-1222 # 80209b78 <syscalls>
    80203046:	99be                	add	s3,s3,a5
    80203048:	7b34                	ld	a3,112(a4)
    8020304a:	0e89b603          	ld	a2,232(s3)
    8020304e:	5c8c                	lw	a1,56(s1)
    80203050:	00007517          	auipc	a0,0x7
    80203054:	9e850513          	addi	a0,a0,-1560 # 80209a38 <states.1723+0x2b8>
    80203058:	ffffd097          	auipc	ra,0xffffd
    8020305c:	136080e7          	jalr	310(ra) # 8020018e <printf>
    80203060:	a005                	j	80203080 <syscall+0x96>
    printf("pid %d %s: unknown sys call %d\n",
    80203062:	86ce                	mv	a3,s3
    80203064:	16048613          	addi	a2,s1,352
    80203068:	5c8c                	lw	a1,56(s1)
    8020306a:	00007517          	auipc	a0,0x7
    8020306e:	9e650513          	addi	a0,a0,-1562 # 80209a50 <states.1723+0x2d0>
    80203072:	ffffd097          	auipc	ra,0xffffd
    80203076:	11c080e7          	jalr	284(ra) # 8020018e <printf>
    p->trapframe->a0 = -1;
    8020307a:	70bc                	ld	a5,96(s1)
    8020307c:	577d                	li	a4,-1
    8020307e:	fbb8                	sd	a4,112(a5)
}
    80203080:	70a2                	ld	ra,40(sp)
    80203082:	7402                	ld	s0,32(sp)
    80203084:	64e2                	ld	s1,24(sp)
    80203086:	6942                	ld	s2,16(sp)
    80203088:	69a2                	ld	s3,8(sp)
    8020308a:	6145                	addi	sp,sp,48
    8020308c:	8082                	ret

000000008020308e <sys_exec>:

extern int exec(char *path, char **argv);

uint64
sys_exec(void)
{
    8020308e:	da010113          	addi	sp,sp,-608
    80203092:	24113c23          	sd	ra,600(sp)
    80203096:	24813823          	sd	s0,592(sp)
    8020309a:	24913423          	sd	s1,584(sp)
    8020309e:	25213023          	sd	s2,576(sp)
    802030a2:	23313c23          	sd	s3,568(sp)
    802030a6:	23413823          	sd	s4,560(sp)
    802030aa:	23513423          	sd	s5,552(sp)
    802030ae:	1480                	addi	s0,sp,608
  char path[FAT32_MAX_PATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    802030b0:	10400613          	li	a2,260
    802030b4:	eb840593          	addi	a1,s0,-328
    802030b8:	4501                	li	a0,0
    802030ba:	00000097          	auipc	ra,0x0
    802030be:	f00080e7          	jalr	-256(ra) # 80202fba <argstr>
    return -1;
    802030c2:	597d                	li	s2,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    802030c4:	0c054a63          	bltz	a0,80203198 <sys_exec+0x10a>
    802030c8:	db040593          	addi	a1,s0,-592
    802030cc:	4505                	li	a0,1
    802030ce:	00000097          	auipc	ra,0x0
    802030d2:	eca080e7          	jalr	-310(ra) # 80202f98 <argaddr>
    802030d6:	0c054163          	bltz	a0,80203198 <sys_exec+0x10a>
  }
  memset(argv, 0, sizeof(argv));
    802030da:	10000613          	li	a2,256
    802030de:	4581                	li	a1,0
    802030e0:	db840513          	addi	a0,s0,-584
    802030e4:	ffffd097          	auipc	ra,0xffffd
    802030e8:	6ac080e7          	jalr	1708(ra) # 80200790 <memset>
  for(i=0;; i++){
    if(i >= NELEM(argv)){
    802030ec:	db840493          	addi	s1,s0,-584
  memset(argv, 0, sizeof(argv));
    802030f0:	89a6                	mv	s3,s1
    802030f2:	4901                	li	s2,0
    if(i >= NELEM(argv)){
    802030f4:	02000a13          	li	s4,32
    802030f8:	00090a9b          	sext.w	s5,s2
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    802030fc:	00391513          	slli	a0,s2,0x3
    80203100:	da840593          	addi	a1,s0,-600
    80203104:	db043783          	ld	a5,-592(s0)
    80203108:	953e                	add	a0,a0,a5
    8020310a:	00000097          	auipc	ra,0x0
    8020310e:	dac080e7          	jalr	-596(ra) # 80202eb6 <fetchaddr>
    80203112:	02054a63          	bltz	a0,80203146 <sys_exec+0xb8>
      goto bad;
    }
    if(uarg == 0){
    80203116:	da843783          	ld	a5,-600(s0)
    8020311a:	c3b9                	beqz	a5,80203160 <sys_exec+0xd2>
      argv[i] = 0;
      break;
    }
    argv[i] = kalloc();
    8020311c:	ffffd097          	auipc	ra,0xffffd
    80203120:	46c080e7          	jalr	1132(ra) # 80200588 <kalloc>
    80203124:	85aa                	mv	a1,a0
    80203126:	00a9b023          	sd	a0,0(s3)
    if(argv[i] == 0)
    8020312a:	cd11                	beqz	a0,80203146 <sys_exec+0xb8>
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    8020312c:	6605                	lui	a2,0x1
    8020312e:	da843503          	ld	a0,-600(s0)
    80203132:	00000097          	auipc	ra,0x0
    80203136:	dd4080e7          	jalr	-556(ra) # 80202f06 <fetchstr>
    8020313a:	00054663          	bltz	a0,80203146 <sys_exec+0xb8>
    if(i >= NELEM(argv)){
    8020313e:	0905                	addi	s2,s2,1
    80203140:	09a1                	addi	s3,s3,8
    80203142:	fb491be3          	bne	s2,s4,802030f8 <sys_exec+0x6a>
    kfree(argv[i]);

  return ret;

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80203146:	10048913          	addi	s2,s1,256
    8020314a:	6088                	ld	a0,0(s1)
    8020314c:	c529                	beqz	a0,80203196 <sys_exec+0x108>
    kfree(argv[i]);
    8020314e:	ffffd097          	auipc	ra,0xffffd
    80203152:	2f8080e7          	jalr	760(ra) # 80200446 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80203156:	04a1                	addi	s1,s1,8
    80203158:	ff2499e3          	bne	s1,s2,8020314a <sys_exec+0xbc>
  return -1;
    8020315c:	597d                	li	s2,-1
    8020315e:	a82d                	j	80203198 <sys_exec+0x10a>
      argv[i] = 0;
    80203160:	0a8e                	slli	s5,s5,0x3
    80203162:	fc040793          	addi	a5,s0,-64
    80203166:	9abe                	add	s5,s5,a5
    80203168:	de0abc23          	sd	zero,-520(s5)
  int ret = exec(path, argv);
    8020316c:	db840593          	addi	a1,s0,-584
    80203170:	eb840513          	addi	a0,s0,-328
    80203174:	00001097          	auipc	ra,0x1
    80203178:	ef0080e7          	jalr	-272(ra) # 80204064 <exec>
    8020317c:	892a                	mv	s2,a0
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8020317e:	10048993          	addi	s3,s1,256
    80203182:	6088                	ld	a0,0(s1)
    80203184:	c911                	beqz	a0,80203198 <sys_exec+0x10a>
    kfree(argv[i]);
    80203186:	ffffd097          	auipc	ra,0xffffd
    8020318a:	2c0080e7          	jalr	704(ra) # 80200446 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8020318e:	04a1                	addi	s1,s1,8
    80203190:	ff3499e3          	bne	s1,s3,80203182 <sys_exec+0xf4>
    80203194:	a011                	j	80203198 <sys_exec+0x10a>
  return -1;
    80203196:	597d                	li	s2,-1
}
    80203198:	854a                	mv	a0,s2
    8020319a:	25813083          	ld	ra,600(sp)
    8020319e:	25013403          	ld	s0,592(sp)
    802031a2:	24813483          	ld	s1,584(sp)
    802031a6:	24013903          	ld	s2,576(sp)
    802031aa:	23813983          	ld	s3,568(sp)
    802031ae:	23013a03          	ld	s4,560(sp)
    802031b2:	22813a83          	ld	s5,552(sp)
    802031b6:	26010113          	addi	sp,sp,608
    802031ba:	8082                	ret

00000000802031bc <sys_exit>:

uint64
sys_exit(void)
{
    802031bc:	1101                	addi	sp,sp,-32
    802031be:	ec06                	sd	ra,24(sp)
    802031c0:	e822                	sd	s0,16(sp)
    802031c2:	1000                	addi	s0,sp,32
  int n;
  if(argint(0, &n) < 0)
    802031c4:	fec40593          	addi	a1,s0,-20
    802031c8:	4501                	li	a0,0
    802031ca:	00000097          	auipc	ra,0x0
    802031ce:	d6c080e7          	jalr	-660(ra) # 80202f36 <argint>
    return -1;
    802031d2:	57fd                	li	a5,-1
  if(argint(0, &n) < 0)
    802031d4:	00054963          	bltz	a0,802031e6 <sys_exit+0x2a>
  exit(n);
    802031d8:	fec42503          	lw	a0,-20(s0)
    802031dc:	fffff097          	auipc	ra,0xfffff
    802031e0:	126080e7          	jalr	294(ra) # 80202302 <exit>
  return 0;  // not reached
    802031e4:	4781                	li	a5,0
}
    802031e6:	853e                	mv	a0,a5
    802031e8:	60e2                	ld	ra,24(sp)
    802031ea:	6442                	ld	s0,16(sp)
    802031ec:	6105                	addi	sp,sp,32
    802031ee:	8082                	ret

00000000802031f0 <sys_getpid>:

uint64
sys_getpid(void)
{
    802031f0:	1141                	addi	sp,sp,-16
    802031f2:	e406                	sd	ra,8(sp)
    802031f4:	e022                	sd	s0,0(sp)
    802031f6:	0800                	addi	s0,sp,16
  return myproc()->pid;
    802031f8:	fffff097          	auipc	ra,0xfffff
    802031fc:	9c6080e7          	jalr	-1594(ra) # 80201bbe <myproc>
}
    80203200:	5d08                	lw	a0,56(a0)
    80203202:	60a2                	ld	ra,8(sp)
    80203204:	6402                	ld	s0,0(sp)
    80203206:	0141                	addi	sp,sp,16
    80203208:	8082                	ret

000000008020320a <sys_fork>:

uint64
sys_fork(void)
{
    8020320a:	1141                	addi	sp,sp,-16
    8020320c:	e406                	sd	ra,8(sp)
    8020320e:	e022                	sd	s0,0(sp)
    80203210:	0800                	addi	s0,sp,16
  return fork();
    80203212:	fffff097          	auipc	ra,0xfffff
    80203216:	db6080e7          	jalr	-586(ra) # 80201fc8 <fork>
}
    8020321a:	60a2                	ld	ra,8(sp)
    8020321c:	6402                	ld	s0,0(sp)
    8020321e:	0141                	addi	sp,sp,16
    80203220:	8082                	ret

0000000080203222 <sys_wait>:

uint64
sys_wait(void)
{
    80203222:	1101                	addi	sp,sp,-32
    80203224:	ec06                	sd	ra,24(sp)
    80203226:	e822                	sd	s0,16(sp)
    80203228:	1000                	addi	s0,sp,32
  uint64 p;
  if(argaddr(0, &p) < 0)
    8020322a:	fe840593          	addi	a1,s0,-24
    8020322e:	4501                	li	a0,0
    80203230:	00000097          	auipc	ra,0x0
    80203234:	d68080e7          	jalr	-664(ra) # 80202f98 <argaddr>
    80203238:	87aa                	mv	a5,a0
    return -1;
    8020323a:	557d                	li	a0,-1
  if(argaddr(0, &p) < 0)
    8020323c:	0007c863          	bltz	a5,8020324c <sys_wait+0x2a>
  return wait(p);
    80203240:	fe843503          	ld	a0,-24(s0)
    80203244:	fffff097          	auipc	ra,0xfffff
    80203248:	258080e7          	jalr	600(ra) # 8020249c <wait>
}
    8020324c:	60e2                	ld	ra,24(sp)
    8020324e:	6442                	ld	s0,16(sp)
    80203250:	6105                	addi	sp,sp,32
    80203252:	8082                	ret

0000000080203254 <sys_sbrk>:

uint64
sys_sbrk(void)
{
    80203254:	7179                	addi	sp,sp,-48
    80203256:	f406                	sd	ra,40(sp)
    80203258:	f022                	sd	s0,32(sp)
    8020325a:	ec26                	sd	s1,24(sp)
    8020325c:	1800                	addi	s0,sp,48
  int addr;
  int n;

  if(argint(0, &n) < 0)
    8020325e:	fdc40593          	addi	a1,s0,-36
    80203262:	4501                	li	a0,0
    80203264:	00000097          	auipc	ra,0x0
    80203268:	cd2080e7          	jalr	-814(ra) # 80202f36 <argint>
    8020326c:	87aa                	mv	a5,a0
    return -1;
    8020326e:	557d                	li	a0,-1
  if(argint(0, &n) < 0)
    80203270:	0207c063          	bltz	a5,80203290 <sys_sbrk+0x3c>
  addr = myproc()->sz;
    80203274:	fffff097          	auipc	ra,0xfffff
    80203278:	94a080e7          	jalr	-1718(ra) # 80201bbe <myproc>
    8020327c:	4524                	lw	s1,72(a0)
  if(growproc(n) < 0)
    8020327e:	fdc42503          	lw	a0,-36(s0)
    80203282:	fffff097          	auipc	ra,0xfffff
    80203286:	cce080e7          	jalr	-818(ra) # 80201f50 <growproc>
    8020328a:	00054863          	bltz	a0,8020329a <sys_sbrk+0x46>
    return -1;
  return addr;
    8020328e:	8526                	mv	a0,s1
}
    80203290:	70a2                	ld	ra,40(sp)
    80203292:	7402                	ld	s0,32(sp)
    80203294:	64e2                	ld	s1,24(sp)
    80203296:	6145                	addi	sp,sp,48
    80203298:	8082                	ret
    return -1;
    8020329a:	557d                	li	a0,-1
    8020329c:	bfd5                	j	80203290 <sys_sbrk+0x3c>

000000008020329e <sys_sleep>:

uint64
sys_sleep(void)
{
    8020329e:	7139                	addi	sp,sp,-64
    802032a0:	fc06                	sd	ra,56(sp)
    802032a2:	f822                	sd	s0,48(sp)
    802032a4:	f426                	sd	s1,40(sp)
    802032a6:	f04a                	sd	s2,32(sp)
    802032a8:	ec4e                	sd	s3,24(sp)
    802032aa:	0080                	addi	s0,sp,64
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    802032ac:	fcc40593          	addi	a1,s0,-52
    802032b0:	4501                	li	a0,0
    802032b2:	00000097          	auipc	ra,0x0
    802032b6:	c84080e7          	jalr	-892(ra) # 80202f36 <argint>
    return -1;
    802032ba:	57fd                	li	a5,-1
  if(argint(0, &n) < 0)
    802032bc:	06054563          	bltz	a0,80203326 <sys_sleep+0x88>
  acquire(&tickslock);
    802032c0:	00224517          	auipc	a0,0x224
    802032c4:	2d850513          	addi	a0,a0,728 # 80427598 <tickslock>
    802032c8:	ffffd097          	auipc	ra,0xffffd
    802032cc:	42c080e7          	jalr	1068(ra) # 802006f4 <acquire>
  ticks0 = ticks;
    802032d0:	00224917          	auipc	s2,0x224
    802032d4:	2e092903          	lw	s2,736(s2) # 804275b0 <ticks>
  while(ticks - ticks0 < n){
    802032d8:	fcc42783          	lw	a5,-52(s0)
    802032dc:	cf85                	beqz	a5,80203314 <sys_sleep+0x76>
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
    802032de:	00224997          	auipc	s3,0x224
    802032e2:	2ba98993          	addi	s3,s3,698 # 80427598 <tickslock>
    802032e6:	00224497          	auipc	s1,0x224
    802032ea:	2ca48493          	addi	s1,s1,714 # 804275b0 <ticks>
    if(myproc()->killed){
    802032ee:	fffff097          	auipc	ra,0xfffff
    802032f2:	8d0080e7          	jalr	-1840(ra) # 80201bbe <myproc>
    802032f6:	591c                	lw	a5,48(a0)
    802032f8:	ef9d                	bnez	a5,80203336 <sys_sleep+0x98>
    sleep(&ticks, &tickslock);
    802032fa:	85ce                	mv	a1,s3
    802032fc:	8526                	mv	a0,s1
    802032fe:	fffff097          	auipc	ra,0xfffff
    80203302:	120080e7          	jalr	288(ra) # 8020241e <sleep>
  while(ticks - ticks0 < n){
    80203306:	409c                	lw	a5,0(s1)
    80203308:	412787bb          	subw	a5,a5,s2
    8020330c:	fcc42703          	lw	a4,-52(s0)
    80203310:	fce7efe3          	bltu	a5,a4,802032ee <sys_sleep+0x50>
  }
  release(&tickslock);
    80203314:	00224517          	auipc	a0,0x224
    80203318:	28450513          	addi	a0,a0,644 # 80427598 <tickslock>
    8020331c:	ffffd097          	auipc	ra,0xffffd
    80203320:	42c080e7          	jalr	1068(ra) # 80200748 <release>
  return 0;
    80203324:	4781                	li	a5,0
}
    80203326:	853e                	mv	a0,a5
    80203328:	70e2                	ld	ra,56(sp)
    8020332a:	7442                	ld	s0,48(sp)
    8020332c:	74a2                	ld	s1,40(sp)
    8020332e:	7902                	ld	s2,32(sp)
    80203330:	69e2                	ld	s3,24(sp)
    80203332:	6121                	addi	sp,sp,64
    80203334:	8082                	ret
      release(&tickslock);
    80203336:	00224517          	auipc	a0,0x224
    8020333a:	26250513          	addi	a0,a0,610 # 80427598 <tickslock>
    8020333e:	ffffd097          	auipc	ra,0xffffd
    80203342:	40a080e7          	jalr	1034(ra) # 80200748 <release>
      return -1;
    80203346:	57fd                	li	a5,-1
    80203348:	bff9                	j	80203326 <sys_sleep+0x88>

000000008020334a <sys_kill>:

uint64
sys_kill(void)
{
    8020334a:	1101                	addi	sp,sp,-32
    8020334c:	ec06                	sd	ra,24(sp)
    8020334e:	e822                	sd	s0,16(sp)
    80203350:	1000                	addi	s0,sp,32
  int pid;

  if(argint(0, &pid) < 0)
    80203352:	fec40593          	addi	a1,s0,-20
    80203356:	4501                	li	a0,0
    80203358:	00000097          	auipc	ra,0x0
    8020335c:	bde080e7          	jalr	-1058(ra) # 80202f36 <argint>
    80203360:	87aa                	mv	a5,a0
    return -1;
    80203362:	557d                	li	a0,-1
  if(argint(0, &pid) < 0)
    80203364:	0007c863          	bltz	a5,80203374 <sys_kill+0x2a>
  return kill(pid);
    80203368:	fec42503          	lw	a0,-20(s0)
    8020336c:	fffff097          	auipc	ra,0xfffff
    80203370:	29e080e7          	jalr	670(ra) # 8020260a <kill>
}
    80203374:	60e2                	ld	ra,24(sp)
    80203376:	6442                	ld	s0,16(sp)
    80203378:	6105                	addi	sp,sp,32
    8020337a:	8082                	ret

000000008020337c <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
    8020337c:	1101                	addi	sp,sp,-32
    8020337e:	ec06                	sd	ra,24(sp)
    80203380:	e822                	sd	s0,16(sp)
    80203382:	e426                	sd	s1,8(sp)
    80203384:	1000                	addi	s0,sp,32
  uint xticks;

  acquire(&tickslock);
    80203386:	00224517          	auipc	a0,0x224
    8020338a:	21250513          	addi	a0,a0,530 # 80427598 <tickslock>
    8020338e:	ffffd097          	auipc	ra,0xffffd
    80203392:	366080e7          	jalr	870(ra) # 802006f4 <acquire>
  xticks = ticks;
    80203396:	00224497          	auipc	s1,0x224
    8020339a:	21a4a483          	lw	s1,538(s1) # 804275b0 <ticks>
  release(&tickslock);
    8020339e:	00224517          	auipc	a0,0x224
    802033a2:	1fa50513          	addi	a0,a0,506 # 80427598 <tickslock>
    802033a6:	ffffd097          	auipc	ra,0xffffd
    802033aa:	3a2080e7          	jalr	930(ra) # 80200748 <release>
  return xticks;
}
    802033ae:	02049513          	slli	a0,s1,0x20
    802033b2:	9101                	srli	a0,a0,0x20
    802033b4:	60e2                	ld	ra,24(sp)
    802033b6:	6442                	ld	s0,16(sp)
    802033b8:	64a2                	ld	s1,8(sp)
    802033ba:	6105                	addi	sp,sp,32
    802033bc:	8082                	ret

00000000802033be <sys_trace>:

uint64
sys_trace(void)
{
    802033be:	1101                	addi	sp,sp,-32
    802033c0:	ec06                	sd	ra,24(sp)
    802033c2:	e822                	sd	s0,16(sp)
    802033c4:	1000                	addi	s0,sp,32
  int mask;
  if(argint(0, &mask) < 0) {
    802033c6:	fec40593          	addi	a1,s0,-20
    802033ca:	4501                	li	a0,0
    802033cc:	00000097          	auipc	ra,0x0
    802033d0:	b6a080e7          	jalr	-1174(ra) # 80202f36 <argint>
    return -1;
    802033d4:	57fd                	li	a5,-1
  if(argint(0, &mask) < 0) {
    802033d6:	00054b63          	bltz	a0,802033ec <sys_trace+0x2e>
  }
  myproc()->tmask = mask;
    802033da:	ffffe097          	auipc	ra,0xffffe
    802033de:	7e4080e7          	jalr	2020(ra) # 80201bbe <myproc>
    802033e2:	fec42783          	lw	a5,-20(s0)
    802033e6:	16f52823          	sw	a5,368(a0)
  return 0;
    802033ea:	4781                	li	a5,0
}
    802033ec:	853e                	mv	a0,a5
    802033ee:	60e2                	ld	ra,24(sp)
    802033f0:	6442                	ld	s0,16(sp)
    802033f2:	6105                	addi	sp,sp,32
    802033f4:	8082                	ret

00000000802033f6 <sys_checkchar>:

uint64
sys_checkchar(void){
    802033f6:	7179                	addi	sp,sp,-48
    802033f8:	f406                	sd	ra,40(sp)
    802033fa:	f022                	sd	s0,32(sp)
    802033fc:	ec26                	sd	s1,24(sp)
    802033fe:	e84a                	sd	s2,16(sp)
    80203400:	e44e                	sd	s3,8(sp)
    80203402:	1800                	addi	s0,sp,48
  int c;
  while(1){
	  if((c=sbi2_console_getchar())!=-1){
    80203404:	597d                	li	s2,-1
	    printf("1\n");
    80203406:	00007997          	auipc	s3,0x7
    8020340a:	94298993          	addi	s3,s3,-1726 # 80209d48 <sysnames+0xe8>
    8020340e:	a819                	j	80203424 <sys_checkchar+0x2e>
    80203410:	854e                	mv	a0,s3
    80203412:	ffffd097          	auipc	ra,0xffffd
    80203416:	d7c080e7          	jalr	-644(ra) # 8020018e <printf>
	    consoleintr(c);
    8020341a:	8526                	mv	a0,s1
    8020341c:	00004097          	auipc	ra,0x4
    80203420:	0ce080e7          	jalr	206(ra) # 802074ea <consoleintr>
    register uint64 a0 asm("a0") = arg0;
    80203424:	4501                	li	a0,0
    register uint64 a1 asm("a1") = arg1;
    80203426:	4581                	li	a1,0
    register uint64 a2 asm("a2") = arg2;
    80203428:	4601                	li	a2,0
    register uint64 a7 asm("a7") = which;
    8020342a:	4889                	li	a7,2
    asm volatile("ecall"
    8020342c:	00000073          	ecall
    return a0;
    80203430:	0005049b          	sext.w	s1,a0
	  if((c=sbi2_console_getchar())!=-1){
    80203434:	ff2488e3          	beq	s1,s2,80203424 <sys_checkchar+0x2e>
    80203438:	bfe1                	j	80203410 <sys_checkchar+0x1a>

000000008020343a <sys_sprint>:
  }
  return 1;
}

uint64
sys_sprint(void){
    8020343a:	1101                	addi	sp,sp,-32
    8020343c:	ec06                	sd	ra,24(sp)
    8020343e:	e822                	sd	s0,16(sp)
    80203440:	1000                	addi	s0,sp,32
  uint64 buf;
  if(argaddr(0, &buf) < 0)
    80203442:	fe840593          	addi	a1,s0,-24
    80203446:	4501                	li	a0,0
    80203448:	00000097          	auipc	ra,0x0
    8020344c:	b50080e7          	jalr	-1200(ra) # 80202f98 <argaddr>
    return -1;
    80203450:	57fd                	li	a5,-1
  if(argaddr(0, &buf) < 0)
    80203452:	00054963          	bltz	a0,80203464 <sys_sprint+0x2a>
  printf((char*)(void*)buf);
    80203456:	fe843503          	ld	a0,-24(s0)
    8020345a:	ffffd097          	auipc	ra,0xffffd
    8020345e:	d34080e7          	jalr	-716(ra) # 8020018e <printf>
  return 1;
    80203462:	4785                	li	a5,1
}
    80203464:	853e                	mv	a0,a5
    80203466:	60e2                	ld	ra,24(sp)
    80203468:	6442                	ld	s0,16(sp)
    8020346a:	6105                	addi	sp,sp,32
    8020346c:	8082                	ret

000000008020346e <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
    8020346e:	7139                	addi	sp,sp,-64
    80203470:	fc06                	sd	ra,56(sp)
    80203472:	f822                	sd	s0,48(sp)
    80203474:	f426                	sd	s1,40(sp)
    80203476:	f04a                	sd	s2,32(sp)
    80203478:	ec4e                	sd	s3,24(sp)
    8020347a:	e852                	sd	s4,16(sp)
    8020347c:	e456                	sd	s5,8(sp)
    8020347e:	0080                	addi	s0,sp,64
  struct buf *b;

  initlock(&bcache.lock, "bcache");
    80203480:	00007597          	auipc	a1,0x7
    80203484:	8d058593          	addi	a1,a1,-1840 # 80209d50 <sysnames+0xf0>
    80203488:	0021e517          	auipc	a0,0x21e
    8020348c:	7f850513          	addi	a0,a0,2040 # 80421c80 <bcache>
    80203490:	ffffd097          	auipc	ra,0xffffd
    80203494:	220080e7          	jalr	544(ra) # 802006b0 <initlock>

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
    80203498:	00222797          	auipc	a5,0x222
    8020349c:	7e878793          	addi	a5,a5,2024 # 80425c80 <bcache+0x4000>
    802034a0:	00223717          	auipc	a4,0x223
    802034a4:	e4870713          	addi	a4,a4,-440 # 804262e8 <bcache+0x4668>
    802034a8:	6ae7b823          	sd	a4,1712(a5)
  bcache.head.next = &bcache.head;
    802034ac:	6ae7bc23          	sd	a4,1720(a5)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    802034b0:	0021e497          	auipc	s1,0x21e
    802034b4:	7e848493          	addi	s1,s1,2024 # 80421c98 <bcache+0x18>
    b->refcnt = 0;
    b->sectorno = ~0;
    802034b8:	5a7d                	li	s4,-1
    b->dev = ~0;
    b->next = bcache.head.next;
    802034ba:	893e                	mv	s2,a5
    b->prev = &bcache.head;
    802034bc:	89ba                	mv	s3,a4
    initsleeplock(&b->lock, "buffer");
    802034be:	00007a97          	auipc	s5,0x7
    802034c2:	89aa8a93          	addi	s5,s5,-1894 # 80209d58 <sysnames+0xf8>
    b->refcnt = 0;
    802034c6:	0404a023          	sw	zero,64(s1)
    b->sectorno = ~0;
    802034ca:	0144a623          	sw	s4,12(s1)
    b->dev = ~0;
    802034ce:	0144a423          	sw	s4,8(s1)
    b->next = bcache.head.next;
    802034d2:	6b893783          	ld	a5,1720(s2)
    802034d6:	e8bc                	sd	a5,80(s1)
    b->prev = &bcache.head;
    802034d8:	0534b423          	sd	s3,72(s1)
    initsleeplock(&b->lock, "buffer");
    802034dc:	85d6                	mv	a1,s5
    802034de:	01048513          	addi	a0,s1,16
    802034e2:	00000097          	auipc	ra,0x0
    802034e6:	27e080e7          	jalr	638(ra) # 80203760 <initsleeplock>
    bcache.head.next->prev = b;
    802034ea:	6b893783          	ld	a5,1720(s2)
    802034ee:	e7a4                	sd	s1,72(a5)
    bcache.head.next = b;
    802034f0:	6a993c23          	sd	s1,1720(s2)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    802034f4:	25848493          	addi	s1,s1,600
    802034f8:	fd3497e3          	bne	s1,s3,802034c6 <binit+0x58>
  }
  #ifdef DEBUG
  printf("binit\n");
    802034fc:	00007517          	auipc	a0,0x7
    80203500:	86450513          	addi	a0,a0,-1948 # 80209d60 <sysnames+0x100>
    80203504:	ffffd097          	auipc	ra,0xffffd
    80203508:	c8a080e7          	jalr	-886(ra) # 8020018e <printf>
  #endif
}
    8020350c:	70e2                	ld	ra,56(sp)
    8020350e:	7442                	ld	s0,48(sp)
    80203510:	74a2                	ld	s1,40(sp)
    80203512:	7902                	ld	s2,32(sp)
    80203514:	69e2                	ld	s3,24(sp)
    80203516:	6a42                	ld	s4,16(sp)
    80203518:	6aa2                	ld	s5,8(sp)
    8020351a:	6121                	addi	sp,sp,64
    8020351c:	8082                	ret

000000008020351e <bread>:
  panic("bget: no buffers");
}

// Return a locked buf with the contents of the indicated block.
struct buf* 
bread(uint dev, uint sectorno) {
    8020351e:	7179                	addi	sp,sp,-48
    80203520:	f406                	sd	ra,40(sp)
    80203522:	f022                	sd	s0,32(sp)
    80203524:	ec26                	sd	s1,24(sp)
    80203526:	e84a                	sd	s2,16(sp)
    80203528:	e44e                	sd	s3,8(sp)
    8020352a:	1800                	addi	s0,sp,48
    8020352c:	89aa                	mv	s3,a0
    8020352e:	892e                	mv	s2,a1
  acquire(&bcache.lock);
    80203530:	0021e517          	auipc	a0,0x21e
    80203534:	75050513          	addi	a0,a0,1872 # 80421c80 <bcache>
    80203538:	ffffd097          	auipc	ra,0xffffd
    8020353c:	1bc080e7          	jalr	444(ra) # 802006f4 <acquire>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    80203540:	00223497          	auipc	s1,0x223
    80203544:	df84b483          	ld	s1,-520(s1) # 80426338 <bcache+0x46b8>
    80203548:	00223797          	auipc	a5,0x223
    8020354c:	da078793          	addi	a5,a5,-608 # 804262e8 <bcache+0x4668>
    80203550:	02f48f63          	beq	s1,a5,8020358e <bread+0x70>
    80203554:	873e                	mv	a4,a5
    80203556:	a021                	j	8020355e <bread+0x40>
    80203558:	68a4                	ld	s1,80(s1)
    8020355a:	02e48a63          	beq	s1,a4,8020358e <bread+0x70>
    if(b->dev == dev && b->sectorno == sectorno){
    8020355e:	449c                	lw	a5,8(s1)
    80203560:	ff379ce3          	bne	a5,s3,80203558 <bread+0x3a>
    80203564:	44dc                	lw	a5,12(s1)
    80203566:	ff2799e3          	bne	a5,s2,80203558 <bread+0x3a>
      b->refcnt++;
    8020356a:	40bc                	lw	a5,64(s1)
    8020356c:	2785                	addiw	a5,a5,1
    8020356e:	c0bc                	sw	a5,64(s1)
      release(&bcache.lock);
    80203570:	0021e517          	auipc	a0,0x21e
    80203574:	71050513          	addi	a0,a0,1808 # 80421c80 <bcache>
    80203578:	ffffd097          	auipc	ra,0xffffd
    8020357c:	1d0080e7          	jalr	464(ra) # 80200748 <release>
      acquiresleep(&b->lock);
    80203580:	01048513          	addi	a0,s1,16
    80203584:	00000097          	auipc	ra,0x0
    80203588:	216080e7          	jalr	534(ra) # 8020379a <acquiresleep>
      return b;
    8020358c:	a8b9                	j	802035ea <bread+0xcc>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    8020358e:	00223497          	auipc	s1,0x223
    80203592:	da24b483          	ld	s1,-606(s1) # 80426330 <bcache+0x46b0>
    80203596:	00223797          	auipc	a5,0x223
    8020359a:	d5278793          	addi	a5,a5,-686 # 804262e8 <bcache+0x4668>
    8020359e:	00f48863          	beq	s1,a5,802035ae <bread+0x90>
    802035a2:	873e                	mv	a4,a5
    if(b->refcnt == 0) {
    802035a4:	40bc                	lw	a5,64(s1)
    802035a6:	cf81                	beqz	a5,802035be <bread+0xa0>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    802035a8:	64a4                	ld	s1,72(s1)
    802035aa:	fee49de3          	bne	s1,a4,802035a4 <bread+0x86>
  panic("bget: no buffers");
    802035ae:	00006517          	auipc	a0,0x6
    802035b2:	7ba50513          	addi	a0,a0,1978 # 80209d68 <sysnames+0x108>
    802035b6:	ffffd097          	auipc	ra,0xffffd
    802035ba:	b8e080e7          	jalr	-1138(ra) # 80200144 <panic>
      b->dev = dev;
    802035be:	0134a423          	sw	s3,8(s1)
      b->sectorno = sectorno;
    802035c2:	0124a623          	sw	s2,12(s1)
      b->valid = 0;
    802035c6:	0004a023          	sw	zero,0(s1)
      b->refcnt = 1;
    802035ca:	4785                	li	a5,1
    802035cc:	c0bc                	sw	a5,64(s1)
      release(&bcache.lock);
    802035ce:	0021e517          	auipc	a0,0x21e
    802035d2:	6b250513          	addi	a0,a0,1714 # 80421c80 <bcache>
    802035d6:	ffffd097          	auipc	ra,0xffffd
    802035da:	172080e7          	jalr	370(ra) # 80200748 <release>
      acquiresleep(&b->lock);
    802035de:	01048513          	addi	a0,s1,16
    802035e2:	00000097          	auipc	ra,0x0
    802035e6:	1b8080e7          	jalr	440(ra) # 8020379a <acquiresleep>
  struct buf *b;

  b = bget(dev, sectorno);
  if (!b->valid) {
    802035ea:	409c                	lw	a5,0(s1)
    802035ec:	cb89                	beqz	a5,802035fe <bread+0xe0>
    disk_read(b);
    b->valid = 1;
  }

  return b;
}
    802035ee:	8526                	mv	a0,s1
    802035f0:	70a2                	ld	ra,40(sp)
    802035f2:	7402                	ld	s0,32(sp)
    802035f4:	64e2                	ld	s1,24(sp)
    802035f6:	6942                	ld	s2,16(sp)
    802035f8:	69a2                	ld	s3,8(sp)
    802035fa:	6145                	addi	sp,sp,48
    802035fc:	8082                	ret
    disk_read(b);
    802035fe:	8526                	mv	a0,s1
    80203600:	00002097          	auipc	ra,0x2
    80203604:	29a080e7          	jalr	666(ra) # 8020589a <disk_read>
    b->valid = 1;
    80203608:	4785                	li	a5,1
    8020360a:	c09c                	sw	a5,0(s1)
  return b;
    8020360c:	b7cd                	j	802035ee <bread+0xd0>

000000008020360e <bwrite>:

// Write b's contents to disk.  Must be locked.
void 
bwrite(struct buf *b) {
    8020360e:	1101                	addi	sp,sp,-32
    80203610:	ec06                	sd	ra,24(sp)
    80203612:	e822                	sd	s0,16(sp)
    80203614:	e426                	sd	s1,8(sp)
    80203616:	1000                	addi	s0,sp,32
    80203618:	84aa                	mv	s1,a0
  if(!holdingsleep(&b->lock))
    8020361a:	0541                	addi	a0,a0,16
    8020361c:	00000097          	auipc	ra,0x0
    80203620:	218080e7          	jalr	536(ra) # 80203834 <holdingsleep>
    80203624:	c919                	beqz	a0,8020363a <bwrite+0x2c>
    panic("bwrite");
  disk_write(b);
    80203626:	8526                	mv	a0,s1
    80203628:	00002097          	auipc	ra,0x2
    8020362c:	28c080e7          	jalr	652(ra) # 802058b4 <disk_write>
}
    80203630:	60e2                	ld	ra,24(sp)
    80203632:	6442                	ld	s0,16(sp)
    80203634:	64a2                	ld	s1,8(sp)
    80203636:	6105                	addi	sp,sp,32
    80203638:	8082                	ret
    panic("bwrite");
    8020363a:	00006517          	auipc	a0,0x6
    8020363e:	74650513          	addi	a0,a0,1862 # 80209d80 <sysnames+0x120>
    80203642:	ffffd097          	auipc	ra,0xffffd
    80203646:	b02080e7          	jalr	-1278(ra) # 80200144 <panic>

000000008020364a <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
    8020364a:	1101                	addi	sp,sp,-32
    8020364c:	ec06                	sd	ra,24(sp)
    8020364e:	e822                	sd	s0,16(sp)
    80203650:	e426                	sd	s1,8(sp)
    80203652:	e04a                	sd	s2,0(sp)
    80203654:	1000                	addi	s0,sp,32
    80203656:	84aa                	mv	s1,a0
  if(!holdingsleep(&b->lock))
    80203658:	01050913          	addi	s2,a0,16
    8020365c:	854a                	mv	a0,s2
    8020365e:	00000097          	auipc	ra,0x0
    80203662:	1d6080e7          	jalr	470(ra) # 80203834 <holdingsleep>
    80203666:	c92d                	beqz	a0,802036d8 <brelse+0x8e>
    panic("brelse");

  releasesleep(&b->lock);
    80203668:	854a                	mv	a0,s2
    8020366a:	00000097          	auipc	ra,0x0
    8020366e:	186080e7          	jalr	390(ra) # 802037f0 <releasesleep>

  acquire(&bcache.lock);
    80203672:	0021e517          	auipc	a0,0x21e
    80203676:	60e50513          	addi	a0,a0,1550 # 80421c80 <bcache>
    8020367a:	ffffd097          	auipc	ra,0xffffd
    8020367e:	07a080e7          	jalr	122(ra) # 802006f4 <acquire>
  b->refcnt--;
    80203682:	40bc                	lw	a5,64(s1)
    80203684:	37fd                	addiw	a5,a5,-1
    80203686:	0007871b          	sext.w	a4,a5
    8020368a:	c0bc                	sw	a5,64(s1)
  if (b->refcnt == 0) {
    8020368c:	eb05                	bnez	a4,802036bc <brelse+0x72>
    // no one is waiting for it.
    b->next->prev = b->prev;
    8020368e:	68bc                	ld	a5,80(s1)
    80203690:	64b8                	ld	a4,72(s1)
    80203692:	e7b8                	sd	a4,72(a5)
    b->prev->next = b->next;
    80203694:	64bc                	ld	a5,72(s1)
    80203696:	68b8                	ld	a4,80(s1)
    80203698:	ebb8                	sd	a4,80(a5)
    b->next = bcache.head.next;
    8020369a:	00222797          	auipc	a5,0x222
    8020369e:	5e678793          	addi	a5,a5,1510 # 80425c80 <bcache+0x4000>
    802036a2:	6b87b703          	ld	a4,1720(a5)
    802036a6:	e8b8                	sd	a4,80(s1)
    b->prev = &bcache.head;
    802036a8:	00223717          	auipc	a4,0x223
    802036ac:	c4070713          	addi	a4,a4,-960 # 804262e8 <bcache+0x4668>
    802036b0:	e4b8                	sd	a4,72(s1)
    bcache.head.next->prev = b;
    802036b2:	6b87b703          	ld	a4,1720(a5)
    802036b6:	e724                	sd	s1,72(a4)
    bcache.head.next = b;
    802036b8:	6a97bc23          	sd	s1,1720(a5)
  }
  
  release(&bcache.lock);
    802036bc:	0021e517          	auipc	a0,0x21e
    802036c0:	5c450513          	addi	a0,a0,1476 # 80421c80 <bcache>
    802036c4:	ffffd097          	auipc	ra,0xffffd
    802036c8:	084080e7          	jalr	132(ra) # 80200748 <release>
}
    802036cc:	60e2                	ld	ra,24(sp)
    802036ce:	6442                	ld	s0,16(sp)
    802036d0:	64a2                	ld	s1,8(sp)
    802036d2:	6902                	ld	s2,0(sp)
    802036d4:	6105                	addi	sp,sp,32
    802036d6:	8082                	ret
    panic("brelse");
    802036d8:	00006517          	auipc	a0,0x6
    802036dc:	6b050513          	addi	a0,a0,1712 # 80209d88 <sysnames+0x128>
    802036e0:	ffffd097          	auipc	ra,0xffffd
    802036e4:	a64080e7          	jalr	-1436(ra) # 80200144 <panic>

00000000802036e8 <bpin>:

void
bpin(struct buf *b) {
    802036e8:	1101                	addi	sp,sp,-32
    802036ea:	ec06                	sd	ra,24(sp)
    802036ec:	e822                	sd	s0,16(sp)
    802036ee:	e426                	sd	s1,8(sp)
    802036f0:	1000                	addi	s0,sp,32
    802036f2:	84aa                	mv	s1,a0
  acquire(&bcache.lock);
    802036f4:	0021e517          	auipc	a0,0x21e
    802036f8:	58c50513          	addi	a0,a0,1420 # 80421c80 <bcache>
    802036fc:	ffffd097          	auipc	ra,0xffffd
    80203700:	ff8080e7          	jalr	-8(ra) # 802006f4 <acquire>
  b->refcnt++;
    80203704:	40bc                	lw	a5,64(s1)
    80203706:	2785                	addiw	a5,a5,1
    80203708:	c0bc                	sw	a5,64(s1)
  release(&bcache.lock);
    8020370a:	0021e517          	auipc	a0,0x21e
    8020370e:	57650513          	addi	a0,a0,1398 # 80421c80 <bcache>
    80203712:	ffffd097          	auipc	ra,0xffffd
    80203716:	036080e7          	jalr	54(ra) # 80200748 <release>
}
    8020371a:	60e2                	ld	ra,24(sp)
    8020371c:	6442                	ld	s0,16(sp)
    8020371e:	64a2                	ld	s1,8(sp)
    80203720:	6105                	addi	sp,sp,32
    80203722:	8082                	ret

0000000080203724 <bunpin>:

void
bunpin(struct buf *b) {
    80203724:	1101                	addi	sp,sp,-32
    80203726:	ec06                	sd	ra,24(sp)
    80203728:	e822                	sd	s0,16(sp)
    8020372a:	e426                	sd	s1,8(sp)
    8020372c:	1000                	addi	s0,sp,32
    8020372e:	84aa                	mv	s1,a0
  acquire(&bcache.lock);
    80203730:	0021e517          	auipc	a0,0x21e
    80203734:	55050513          	addi	a0,a0,1360 # 80421c80 <bcache>
    80203738:	ffffd097          	auipc	ra,0xffffd
    8020373c:	fbc080e7          	jalr	-68(ra) # 802006f4 <acquire>
  b->refcnt--;
    80203740:	40bc                	lw	a5,64(s1)
    80203742:	37fd                	addiw	a5,a5,-1
    80203744:	c0bc                	sw	a5,64(s1)
  release(&bcache.lock);
    80203746:	0021e517          	auipc	a0,0x21e
    8020374a:	53a50513          	addi	a0,a0,1338 # 80421c80 <bcache>
    8020374e:	ffffd097          	auipc	ra,0xffffd
    80203752:	ffa080e7          	jalr	-6(ra) # 80200748 <release>
}
    80203756:	60e2                	ld	ra,24(sp)
    80203758:	6442                	ld	s0,16(sp)
    8020375a:	64a2                	ld	s1,8(sp)
    8020375c:	6105                	addi	sp,sp,32
    8020375e:	8082                	ret

0000000080203760 <initsleeplock>:
#include "include/proc.h"
#include "include/sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
    80203760:	1101                	addi	sp,sp,-32
    80203762:	ec06                	sd	ra,24(sp)
    80203764:	e822                	sd	s0,16(sp)
    80203766:	e426                	sd	s1,8(sp)
    80203768:	e04a                	sd	s2,0(sp)
    8020376a:	1000                	addi	s0,sp,32
    8020376c:	84aa                	mv	s1,a0
    8020376e:	892e                	mv	s2,a1
  initlock(&lk->lk, "sleep lock");
    80203770:	00006597          	auipc	a1,0x6
    80203774:	62058593          	addi	a1,a1,1568 # 80209d90 <sysnames+0x130>
    80203778:	0521                	addi	a0,a0,8
    8020377a:	ffffd097          	auipc	ra,0xffffd
    8020377e:	f36080e7          	jalr	-202(ra) # 802006b0 <initlock>
  lk->name = name;
    80203782:	0324b023          	sd	s2,32(s1)
  lk->locked = 0;
    80203786:	0004a023          	sw	zero,0(s1)
  lk->pid = 0;
    8020378a:	0204a423          	sw	zero,40(s1)
}
    8020378e:	60e2                	ld	ra,24(sp)
    80203790:	6442                	ld	s0,16(sp)
    80203792:	64a2                	ld	s1,8(sp)
    80203794:	6902                	ld	s2,0(sp)
    80203796:	6105                	addi	sp,sp,32
    80203798:	8082                	ret

000000008020379a <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
    8020379a:	1101                	addi	sp,sp,-32
    8020379c:	ec06                	sd	ra,24(sp)
    8020379e:	e822                	sd	s0,16(sp)
    802037a0:	e426                	sd	s1,8(sp)
    802037a2:	e04a                	sd	s2,0(sp)
    802037a4:	1000                	addi	s0,sp,32
    802037a6:	84aa                	mv	s1,a0
  acquire(&lk->lk);
    802037a8:	00850913          	addi	s2,a0,8
    802037ac:	854a                	mv	a0,s2
    802037ae:	ffffd097          	auipc	ra,0xffffd
    802037b2:	f46080e7          	jalr	-186(ra) # 802006f4 <acquire>
  while (lk->locked) {
    802037b6:	409c                	lw	a5,0(s1)
    802037b8:	cb89                	beqz	a5,802037ca <acquiresleep+0x30>
    sleep(lk, &lk->lk);
    802037ba:	85ca                	mv	a1,s2
    802037bc:	8526                	mv	a0,s1
    802037be:	fffff097          	auipc	ra,0xfffff
    802037c2:	c60080e7          	jalr	-928(ra) # 8020241e <sleep>
  while (lk->locked) {
    802037c6:	409c                	lw	a5,0(s1)
    802037c8:	fbed                	bnez	a5,802037ba <acquiresleep+0x20>
  }
  lk->locked = 1;
    802037ca:	4785                	li	a5,1
    802037cc:	c09c                	sw	a5,0(s1)
  lk->pid = myproc()->pid;
    802037ce:	ffffe097          	auipc	ra,0xffffe
    802037d2:	3f0080e7          	jalr	1008(ra) # 80201bbe <myproc>
    802037d6:	5d1c                	lw	a5,56(a0)
    802037d8:	d49c                	sw	a5,40(s1)
  release(&lk->lk);
    802037da:	854a                	mv	a0,s2
    802037dc:	ffffd097          	auipc	ra,0xffffd
    802037e0:	f6c080e7          	jalr	-148(ra) # 80200748 <release>
}
    802037e4:	60e2                	ld	ra,24(sp)
    802037e6:	6442                	ld	s0,16(sp)
    802037e8:	64a2                	ld	s1,8(sp)
    802037ea:	6902                	ld	s2,0(sp)
    802037ec:	6105                	addi	sp,sp,32
    802037ee:	8082                	ret

00000000802037f0 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
    802037f0:	1101                	addi	sp,sp,-32
    802037f2:	ec06                	sd	ra,24(sp)
    802037f4:	e822                	sd	s0,16(sp)
    802037f6:	e426                	sd	s1,8(sp)
    802037f8:	e04a                	sd	s2,0(sp)
    802037fa:	1000                	addi	s0,sp,32
    802037fc:	84aa                	mv	s1,a0
  acquire(&lk->lk);
    802037fe:	00850913          	addi	s2,a0,8
    80203802:	854a                	mv	a0,s2
    80203804:	ffffd097          	auipc	ra,0xffffd
    80203808:	ef0080e7          	jalr	-272(ra) # 802006f4 <acquire>
  lk->locked = 0;
    8020380c:	0004a023          	sw	zero,0(s1)
  lk->pid = 0;
    80203810:	0204a423          	sw	zero,40(s1)
  wakeup(lk);
    80203814:	8526                	mv	a0,s1
    80203816:	fffff097          	auipc	ra,0xfffff
    8020381a:	d8a080e7          	jalr	-630(ra) # 802025a0 <wakeup>
  release(&lk->lk);
    8020381e:	854a                	mv	a0,s2
    80203820:	ffffd097          	auipc	ra,0xffffd
    80203824:	f28080e7          	jalr	-216(ra) # 80200748 <release>
}
    80203828:	60e2                	ld	ra,24(sp)
    8020382a:	6442                	ld	s0,16(sp)
    8020382c:	64a2                	ld	s1,8(sp)
    8020382e:	6902                	ld	s2,0(sp)
    80203830:	6105                	addi	sp,sp,32
    80203832:	8082                	ret

0000000080203834 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
    80203834:	7179                	addi	sp,sp,-48
    80203836:	f406                	sd	ra,40(sp)
    80203838:	f022                	sd	s0,32(sp)
    8020383a:	ec26                	sd	s1,24(sp)
    8020383c:	e84a                	sd	s2,16(sp)
    8020383e:	e44e                	sd	s3,8(sp)
    80203840:	1800                	addi	s0,sp,48
    80203842:	84aa                	mv	s1,a0
  int r;
  
  acquire(&lk->lk);
    80203844:	00850913          	addi	s2,a0,8
    80203848:	854a                	mv	a0,s2
    8020384a:	ffffd097          	auipc	ra,0xffffd
    8020384e:	eaa080e7          	jalr	-342(ra) # 802006f4 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
    80203852:	409c                	lw	a5,0(s1)
    80203854:	ef99                	bnez	a5,80203872 <holdingsleep+0x3e>
    80203856:	4481                	li	s1,0
  release(&lk->lk);
    80203858:	854a                	mv	a0,s2
    8020385a:	ffffd097          	auipc	ra,0xffffd
    8020385e:	eee080e7          	jalr	-274(ra) # 80200748 <release>
  return r;
}
    80203862:	8526                	mv	a0,s1
    80203864:	70a2                	ld	ra,40(sp)
    80203866:	7402                	ld	s0,32(sp)
    80203868:	64e2                	ld	s1,24(sp)
    8020386a:	6942                	ld	s2,16(sp)
    8020386c:	69a2                	ld	s3,8(sp)
    8020386e:	6145                	addi	sp,sp,48
    80203870:	8082                	ret
  r = lk->locked && (lk->pid == myproc()->pid);
    80203872:	0284a983          	lw	s3,40(s1)
    80203876:	ffffe097          	auipc	ra,0xffffe
    8020387a:	348080e7          	jalr	840(ra) # 80201bbe <myproc>
    8020387e:	5d04                	lw	s1,56(a0)
    80203880:	413484b3          	sub	s1,s1,s3
    80203884:	0014b493          	seqz	s1,s1
    80203888:	bfc1                	j	80203858 <holdingsleep+0x24>

000000008020388a <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
    8020388a:	1101                	addi	sp,sp,-32
    8020388c:	ec06                	sd	ra,24(sp)
    8020388e:	e822                	sd	s0,16(sp)
    80203890:	e426                	sd	s1,8(sp)
    80203892:	e04a                	sd	s2,0(sp)
    80203894:	1000                	addi	s0,sp,32
  initlock(&ftable.lock, "ftable");
    80203896:	00006597          	auipc	a1,0x6
    8020389a:	50a58593          	addi	a1,a1,1290 # 80209da0 <sysnames+0x140>
    8020389e:	00223517          	auipc	a0,0x223
    802038a2:	d4250513          	addi	a0,a0,-702 # 804265e0 <ftable>
    802038a6:	ffffd097          	auipc	ra,0xffffd
    802038aa:	e0a080e7          	jalr	-502(ra) # 802006b0 <initlock>
  struct file *f;
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    802038ae:	00223497          	auipc	s1,0x223
    802038b2:	d4a48493          	addi	s1,s1,-694 # 804265f8 <ftable+0x18>
    802038b6:	00224917          	auipc	s2,0x224
    802038ba:	ce290913          	addi	s2,s2,-798 # 80427598 <tickslock>
    memset(f, 0, sizeof(struct file));
    802038be:	02800613          	li	a2,40
    802038c2:	4581                	li	a1,0
    802038c4:	8526                	mv	a0,s1
    802038c6:	ffffd097          	auipc	ra,0xffffd
    802038ca:	eca080e7          	jalr	-310(ra) # 80200790 <memset>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    802038ce:	02848493          	addi	s1,s1,40
    802038d2:	ff2496e3          	bne	s1,s2,802038be <fileinit+0x34>
  }
  #ifdef DEBUG
  printf("fileinit\n");
    802038d6:	00006517          	auipc	a0,0x6
    802038da:	4d250513          	addi	a0,a0,1234 # 80209da8 <sysnames+0x148>
    802038de:	ffffd097          	auipc	ra,0xffffd
    802038e2:	8b0080e7          	jalr	-1872(ra) # 8020018e <printf>
  #endif
}
    802038e6:	60e2                	ld	ra,24(sp)
    802038e8:	6442                	ld	s0,16(sp)
    802038ea:	64a2                	ld	s1,8(sp)
    802038ec:	6902                	ld	s2,0(sp)
    802038ee:	6105                	addi	sp,sp,32
    802038f0:	8082                	ret

00000000802038f2 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
    802038f2:	1101                	addi	sp,sp,-32
    802038f4:	ec06                	sd	ra,24(sp)
    802038f6:	e822                	sd	s0,16(sp)
    802038f8:	e426                	sd	s1,8(sp)
    802038fa:	1000                	addi	s0,sp,32
  struct file *f;

  acquire(&ftable.lock);
    802038fc:	00223517          	auipc	a0,0x223
    80203900:	ce450513          	addi	a0,a0,-796 # 804265e0 <ftable>
    80203904:	ffffd097          	auipc	ra,0xffffd
    80203908:	df0080e7          	jalr	-528(ra) # 802006f4 <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    8020390c:	00223497          	auipc	s1,0x223
    80203910:	cec48493          	addi	s1,s1,-788 # 804265f8 <ftable+0x18>
    80203914:	00224717          	auipc	a4,0x224
    80203918:	c8470713          	addi	a4,a4,-892 # 80427598 <tickslock>
    if(f->ref == 0){
    8020391c:	40dc                	lw	a5,4(s1)
    8020391e:	cf99                	beqz	a5,8020393c <filealloc+0x4a>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203920:	02848493          	addi	s1,s1,40
    80203924:	fee49ce3          	bne	s1,a4,8020391c <filealloc+0x2a>
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
    80203928:	00223517          	auipc	a0,0x223
    8020392c:	cb850513          	addi	a0,a0,-840 # 804265e0 <ftable>
    80203930:	ffffd097          	auipc	ra,0xffffd
    80203934:	e18080e7          	jalr	-488(ra) # 80200748 <release>
  return NULL;
    80203938:	4481                	li	s1,0
    8020393a:	a819                	j	80203950 <filealloc+0x5e>
      f->ref = 1;
    8020393c:	4785                	li	a5,1
    8020393e:	c0dc                	sw	a5,4(s1)
      release(&ftable.lock);
    80203940:	00223517          	auipc	a0,0x223
    80203944:	ca050513          	addi	a0,a0,-864 # 804265e0 <ftable>
    80203948:	ffffd097          	auipc	ra,0xffffd
    8020394c:	e00080e7          	jalr	-512(ra) # 80200748 <release>
}
    80203950:	8526                	mv	a0,s1
    80203952:	60e2                	ld	ra,24(sp)
    80203954:	6442                	ld	s0,16(sp)
    80203956:	64a2                	ld	s1,8(sp)
    80203958:	6105                	addi	sp,sp,32
    8020395a:	8082                	ret

000000008020395c <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
    8020395c:	1101                	addi	sp,sp,-32
    8020395e:	ec06                	sd	ra,24(sp)
    80203960:	e822                	sd	s0,16(sp)
    80203962:	e426                	sd	s1,8(sp)
    80203964:	1000                	addi	s0,sp,32
    80203966:	84aa                	mv	s1,a0
  acquire(&ftable.lock);
    80203968:	00223517          	auipc	a0,0x223
    8020396c:	c7850513          	addi	a0,a0,-904 # 804265e0 <ftable>
    80203970:	ffffd097          	auipc	ra,0xffffd
    80203974:	d84080e7          	jalr	-636(ra) # 802006f4 <acquire>
  if(f->ref < 1)
    80203978:	40dc                	lw	a5,4(s1)
    8020397a:	02f05263          	blez	a5,8020399e <filedup+0x42>
    panic("filedup");
  f->ref++;
    8020397e:	2785                	addiw	a5,a5,1
    80203980:	c0dc                	sw	a5,4(s1)
  release(&ftable.lock);
    80203982:	00223517          	auipc	a0,0x223
    80203986:	c5e50513          	addi	a0,a0,-930 # 804265e0 <ftable>
    8020398a:	ffffd097          	auipc	ra,0xffffd
    8020398e:	dbe080e7          	jalr	-578(ra) # 80200748 <release>
  return f;
}
    80203992:	8526                	mv	a0,s1
    80203994:	60e2                	ld	ra,24(sp)
    80203996:	6442                	ld	s0,16(sp)
    80203998:	64a2                	ld	s1,8(sp)
    8020399a:	6105                	addi	sp,sp,32
    8020399c:	8082                	ret
    panic("filedup");
    8020399e:	00006517          	auipc	a0,0x6
    802039a2:	41a50513          	addi	a0,a0,1050 # 80209db8 <sysnames+0x158>
    802039a6:	ffffc097          	auipc	ra,0xffffc
    802039aa:	79e080e7          	jalr	1950(ra) # 80200144 <panic>

00000000802039ae <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
    802039ae:	7139                	addi	sp,sp,-64
    802039b0:	fc06                	sd	ra,56(sp)
    802039b2:	f822                	sd	s0,48(sp)
    802039b4:	f426                	sd	s1,40(sp)
    802039b6:	f04a                	sd	s2,32(sp)
    802039b8:	ec4e                	sd	s3,24(sp)
    802039ba:	e852                	sd	s4,16(sp)
    802039bc:	e456                	sd	s5,8(sp)
    802039be:	0080                	addi	s0,sp,64
    802039c0:	84aa                	mv	s1,a0
  struct file ff;

  acquire(&ftable.lock);
    802039c2:	00223517          	auipc	a0,0x223
    802039c6:	c1e50513          	addi	a0,a0,-994 # 804265e0 <ftable>
    802039ca:	ffffd097          	auipc	ra,0xffffd
    802039ce:	d2a080e7          	jalr	-726(ra) # 802006f4 <acquire>
  if(f->ref < 1)
    802039d2:	40dc                	lw	a5,4(s1)
    802039d4:	04f05863          	blez	a5,80203a24 <fileclose+0x76>
    panic("fileclose");
  if(--f->ref > 0){
    802039d8:	37fd                	addiw	a5,a5,-1
    802039da:	0007871b          	sext.w	a4,a5
    802039de:	c0dc                	sw	a5,4(s1)
    802039e0:	04e04a63          	bgtz	a4,80203a34 <fileclose+0x86>
    release(&ftable.lock);
    return;
  }
  ff = *f;
    802039e4:	0004a903          	lw	s2,0(s1)
    802039e8:	0094ca03          	lbu	s4,9(s1)
    802039ec:	0104b983          	ld	s3,16(s1)
    802039f0:	0184ba83          	ld	s5,24(s1)
  f->ref = 0;
    802039f4:	0004a223          	sw	zero,4(s1)
  f->type = FD_NONE;
    802039f8:	0004a023          	sw	zero,0(s1)
  release(&ftable.lock);
    802039fc:	00223517          	auipc	a0,0x223
    80203a00:	be450513          	addi	a0,a0,-1052 # 804265e0 <ftable>
    80203a04:	ffffd097          	auipc	ra,0xffffd
    80203a08:	d44080e7          	jalr	-700(ra) # 80200748 <release>

  if(ff.type == FD_PIPE){
    80203a0c:	4785                	li	a5,1
    80203a0e:	04f90463          	beq	s2,a5,80203a56 <fileclose+0xa8>
    pipeclose(ff.pipe, ff.writable);
  } else if(ff.type == FD_ENTRY){
    80203a12:	4789                	li	a5,2
    80203a14:	02f91863          	bne	s2,a5,80203a44 <fileclose+0x96>
    eput(ff.ep);
    80203a18:	8556                	mv	a0,s5
    80203a1a:	00003097          	auipc	ra,0x3
    80203a1e:	0d6080e7          	jalr	214(ra) # 80206af0 <eput>
    80203a22:	a00d                	j	80203a44 <fileclose+0x96>
    panic("fileclose");
    80203a24:	00006517          	auipc	a0,0x6
    80203a28:	39c50513          	addi	a0,a0,924 # 80209dc0 <sysnames+0x160>
    80203a2c:	ffffc097          	auipc	ra,0xffffc
    80203a30:	718080e7          	jalr	1816(ra) # 80200144 <panic>
    release(&ftable.lock);
    80203a34:	00223517          	auipc	a0,0x223
    80203a38:	bac50513          	addi	a0,a0,-1108 # 804265e0 <ftable>
    80203a3c:	ffffd097          	auipc	ra,0xffffd
    80203a40:	d0c080e7          	jalr	-756(ra) # 80200748 <release>
  } else if (ff.type == FD_DEVICE) {

  }
}
    80203a44:	70e2                	ld	ra,56(sp)
    80203a46:	7442                	ld	s0,48(sp)
    80203a48:	74a2                	ld	s1,40(sp)
    80203a4a:	7902                	ld	s2,32(sp)
    80203a4c:	69e2                	ld	s3,24(sp)
    80203a4e:	6a42                	ld	s4,16(sp)
    80203a50:	6aa2                	ld	s5,8(sp)
    80203a52:	6121                	addi	sp,sp,64
    80203a54:	8082                	ret
    pipeclose(ff.pipe, ff.writable);
    80203a56:	85d2                	mv	a1,s4
    80203a58:	854e                	mv	a0,s3
    80203a5a:	00000097          	auipc	ra,0x0
    80203a5e:	392080e7          	jalr	914(ra) # 80203dec <pipeclose>
    80203a62:	b7cd                	j	80203a44 <fileclose+0x96>

0000000080203a64 <filestat>:
filestat(struct file *f, uint64 addr)
{
  // struct proc *p = myproc();
  struct stat st;
  
  if(f->type == FD_ENTRY){
    80203a64:	4118                	lw	a4,0(a0)
    80203a66:	4789                	li	a5,2
    80203a68:	04f71c63          	bne	a4,a5,80203ac0 <filestat+0x5c>
{
    80203a6c:	711d                	addi	sp,sp,-96
    80203a6e:	ec86                	sd	ra,88(sp)
    80203a70:	e8a2                	sd	s0,80(sp)
    80203a72:	e4a6                	sd	s1,72(sp)
    80203a74:	e0ca                	sd	s2,64(sp)
    80203a76:	1080                	addi	s0,sp,96
    80203a78:	84aa                	mv	s1,a0
    80203a7a:	892e                	mv	s2,a1
    elock(f->ep);
    80203a7c:	6d08                	ld	a0,24(a0)
    80203a7e:	00003097          	auipc	ra,0x3
    80203a82:	fee080e7          	jalr	-18(ra) # 80206a6c <elock>
    estat(f->ep, &st);
    80203a86:	fa840593          	addi	a1,s0,-88
    80203a8a:	6c88                	ld	a0,24(s1)
    80203a8c:	00003097          	auipc	ra,0x3
    80203a90:	19c080e7          	jalr	412(ra) # 80206c28 <estat>
    eunlock(f->ep);
    80203a94:	6c88                	ld	a0,24(s1)
    80203a96:	00003097          	auipc	ra,0x3
    80203a9a:	00c080e7          	jalr	12(ra) # 80206aa2 <eunlock>
    // if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    80203a9e:	03800613          	li	a2,56
    80203aa2:	fa840593          	addi	a1,s0,-88
    80203aa6:	854a                	mv	a0,s2
    80203aa8:	ffffe097          	auipc	ra,0xffffe
    80203aac:	a2a080e7          	jalr	-1494(ra) # 802014d2 <copyout2>
    80203ab0:	41f5551b          	sraiw	a0,a0,0x1f
      return -1;
    return 0;
  }
  return -1;
}
    80203ab4:	60e6                	ld	ra,88(sp)
    80203ab6:	6446                	ld	s0,80(sp)
    80203ab8:	64a6                	ld	s1,72(sp)
    80203aba:	6906                	ld	s2,64(sp)
    80203abc:	6125                	addi	sp,sp,96
    80203abe:	8082                	ret
  return -1;
    80203ac0:	557d                	li	a0,-1
}
    80203ac2:	8082                	ret

0000000080203ac4 <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
    80203ac4:	7179                	addi	sp,sp,-48
    80203ac6:	f406                	sd	ra,40(sp)
    80203ac8:	f022                	sd	s0,32(sp)
    80203aca:	ec26                	sd	s1,24(sp)
    80203acc:	e84a                	sd	s2,16(sp)
    80203ace:	e44e                	sd	s3,8(sp)
    80203ad0:	1800                	addi	s0,sp,48
  int r = 0;

  if(f->readable == 0)
    80203ad2:	00854783          	lbu	a5,8(a0)
    80203ad6:	c3d5                	beqz	a5,80203b7a <fileread+0xb6>
    80203ad8:	84aa                	mv	s1,a0
    80203ada:	89ae                	mv	s3,a1
    80203adc:	8932                	mv	s2,a2
    return -1;

  switch (f->type) {
    80203ade:	411c                	lw	a5,0(a0)
    80203ae0:	4709                	li	a4,2
    80203ae2:	06e78263          	beq	a5,a4,80203b46 <fileread+0x82>
    80203ae6:	470d                	li	a4,3
    80203ae8:	02e78b63          	beq	a5,a4,80203b1e <fileread+0x5a>
    80203aec:	4705                	li	a4,1
    80203aee:	00e78a63          	beq	a5,a4,80203b02 <fileread+0x3e>
          if((r = eread(f->ep, 1, addr, f->off, n)) > 0)
            f->off += r;
        eunlock(f->ep);
        break;
    default:
      panic("fileread");
    80203af2:	00006517          	auipc	a0,0x6
    80203af6:	2de50513          	addi	a0,a0,734 # 80209dd0 <sysnames+0x170>
    80203afa:	ffffc097          	auipc	ra,0xffffc
    80203afe:	64a080e7          	jalr	1610(ra) # 80200144 <panic>
        r = piperead(f->pipe, addr, n);
    80203b02:	6908                	ld	a0,16(a0)
    80203b04:	00000097          	auipc	ra,0x0
    80203b08:	478080e7          	jalr	1144(ra) # 80203f7c <piperead>
    80203b0c:	892a                	mv	s2,a0
  }

  return r;
}
    80203b0e:	854a                	mv	a0,s2
    80203b10:	70a2                	ld	ra,40(sp)
    80203b12:	7402                	ld	s0,32(sp)
    80203b14:	64e2                	ld	s1,24(sp)
    80203b16:	6942                	ld	s2,16(sp)
    80203b18:	69a2                	ld	s3,8(sp)
    80203b1a:	6145                	addi	sp,sp,48
    80203b1c:	8082                	ret
        if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
    80203b1e:	02451783          	lh	a5,36(a0)
    80203b22:	03079693          	slli	a3,a5,0x30
    80203b26:	92c1                	srli	a3,a3,0x30
    80203b28:	4725                	li	a4,9
    80203b2a:	04d76a63          	bltu	a4,a3,80203b7e <fileread+0xba>
    80203b2e:	0792                	slli	a5,a5,0x4
    80203b30:	00223717          	auipc	a4,0x223
    80203b34:	a1070713          	addi	a4,a4,-1520 # 80426540 <devsw>
    80203b38:	97ba                	add	a5,a5,a4
    80203b3a:	639c                	ld	a5,0(a5)
    80203b3c:	c3b9                	beqz	a5,80203b82 <fileread+0xbe>
        r = devsw[f->major].read(1, addr, n);
    80203b3e:	4505                	li	a0,1
    80203b40:	9782                	jalr	a5
    80203b42:	892a                	mv	s2,a0
        break;
    80203b44:	b7e9                	j	80203b0e <fileread+0x4a>
        elock(f->ep);
    80203b46:	6d08                	ld	a0,24(a0)
    80203b48:	00003097          	auipc	ra,0x3
    80203b4c:	f24080e7          	jalr	-220(ra) # 80206a6c <elock>
          if((r = eread(f->ep, 1, addr, f->off, n)) > 0)
    80203b50:	874a                	mv	a4,s2
    80203b52:	5094                	lw	a3,32(s1)
    80203b54:	864e                	mv	a2,s3
    80203b56:	4585                	li	a1,1
    80203b58:	6c88                	ld	a0,24(s1)
    80203b5a:	00002097          	auipc	ra,0x2
    80203b5e:	648080e7          	jalr	1608(ra) # 802061a2 <eread>
    80203b62:	892a                	mv	s2,a0
    80203b64:	00a05563          	blez	a0,80203b6e <fileread+0xaa>
            f->off += r;
    80203b68:	509c                	lw	a5,32(s1)
    80203b6a:	9fa9                	addw	a5,a5,a0
    80203b6c:	d09c                	sw	a5,32(s1)
        eunlock(f->ep);
    80203b6e:	6c88                	ld	a0,24(s1)
    80203b70:	00003097          	auipc	ra,0x3
    80203b74:	f32080e7          	jalr	-206(ra) # 80206aa2 <eunlock>
        break;
    80203b78:	bf59                	j	80203b0e <fileread+0x4a>
    return -1;
    80203b7a:	597d                	li	s2,-1
    80203b7c:	bf49                	j	80203b0e <fileread+0x4a>
          return -1;
    80203b7e:	597d                	li	s2,-1
    80203b80:	b779                	j	80203b0e <fileread+0x4a>
    80203b82:	597d                	li	s2,-1
    80203b84:	b769                	j	80203b0e <fileread+0x4a>

0000000080203b86 <filewrite>:

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
    80203b86:	7179                	addi	sp,sp,-48
    80203b88:	f406                	sd	ra,40(sp)
    80203b8a:	f022                	sd	s0,32(sp)
    80203b8c:	ec26                	sd	s1,24(sp)
    80203b8e:	e84a                	sd	s2,16(sp)
    80203b90:	e44e                	sd	s3,8(sp)
    80203b92:	e052                	sd	s4,0(sp)
    80203b94:	1800                	addi	s0,sp,48
  int ret = 0;

  if(f->writable == 0)
    80203b96:	00954783          	lbu	a5,9(a0)
    80203b9a:	cbcd                	beqz	a5,80203c4c <filewrite+0xc6>
    80203b9c:	84aa                	mv	s1,a0
    80203b9e:	892e                	mv	s2,a1
    80203ba0:	89b2                	mv	s3,a2
    return -1;

  if(f->type == FD_PIPE){
    80203ba2:	411c                	lw	a5,0(a0)
    80203ba4:	4705                	li	a4,1
    80203ba6:	04e78963          	beq	a5,a4,80203bf8 <filewrite+0x72>
    ret = pipewrite(f->pipe, addr, n);
  } else if(f->type == FD_DEVICE){
    80203baa:	470d                	li	a4,3
    80203bac:	04e78d63          	beq	a5,a4,80203c06 <filewrite+0x80>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
      return -1;
    ret = devsw[f->major].write(1, addr, n);
  } else if(f->type == FD_ENTRY){
    80203bb0:	4709                	li	a4,2
    80203bb2:	08e79563          	bne	a5,a4,80203c3c <filewrite+0xb6>
    elock(f->ep);
    80203bb6:	6d08                	ld	a0,24(a0)
    80203bb8:	00003097          	auipc	ra,0x3
    80203bbc:	eb4080e7          	jalr	-332(ra) # 80206a6c <elock>
    if (ewrite(f->ep, 1, addr, f->off, n) == n) {
    80203bc0:	00098a1b          	sext.w	s4,s3
    80203bc4:	8752                	mv	a4,s4
    80203bc6:	5094                	lw	a3,32(s1)
    80203bc8:	864a                	mv	a2,s2
    80203bca:	4585                	li	a1,1
    80203bcc:	6c88                	ld	a0,24(s1)
    80203bce:	00002097          	auipc	ra,0x2
    80203bd2:	6cc080e7          	jalr	1740(ra) # 8020629a <ewrite>
      ret = n;
      f->off += n;
    } else {
      ret = -1;
    80203bd6:	597d                	li	s2,-1
    if (ewrite(f->ep, 1, addr, f->off, n) == n) {
    80203bd8:	05350b63          	beq	a0,s3,80203c2e <filewrite+0xa8>
    }
    eunlock(f->ep);
    80203bdc:	6c88                	ld	a0,24(s1)
    80203bde:	00003097          	auipc	ra,0x3
    80203be2:	ec4080e7          	jalr	-316(ra) # 80206aa2 <eunlock>
  } else {
    panic("filewrite");
  }

  return ret;
}
    80203be6:	854a                	mv	a0,s2
    80203be8:	70a2                	ld	ra,40(sp)
    80203bea:	7402                	ld	s0,32(sp)
    80203bec:	64e2                	ld	s1,24(sp)
    80203bee:	6942                	ld	s2,16(sp)
    80203bf0:	69a2                	ld	s3,8(sp)
    80203bf2:	6a02                	ld	s4,0(sp)
    80203bf4:	6145                	addi	sp,sp,48
    80203bf6:	8082                	ret
    ret = pipewrite(f->pipe, addr, n);
    80203bf8:	6908                	ld	a0,16(a0)
    80203bfa:	00000097          	auipc	ra,0x0
    80203bfe:	262080e7          	jalr	610(ra) # 80203e5c <pipewrite>
    80203c02:	892a                	mv	s2,a0
    80203c04:	b7cd                	j	80203be6 <filewrite+0x60>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
    80203c06:	02451783          	lh	a5,36(a0)
    80203c0a:	03079693          	slli	a3,a5,0x30
    80203c0e:	92c1                	srli	a3,a3,0x30
    80203c10:	4725                	li	a4,9
    80203c12:	02d76f63          	bltu	a4,a3,80203c50 <filewrite+0xca>
    80203c16:	0792                	slli	a5,a5,0x4
    80203c18:	00223717          	auipc	a4,0x223
    80203c1c:	92870713          	addi	a4,a4,-1752 # 80426540 <devsw>
    80203c20:	97ba                	add	a5,a5,a4
    80203c22:	679c                	ld	a5,8(a5)
    80203c24:	cb85                	beqz	a5,80203c54 <filewrite+0xce>
    ret = devsw[f->major].write(1, addr, n);
    80203c26:	4505                	li	a0,1
    80203c28:	9782                	jalr	a5
    80203c2a:	892a                	mv	s2,a0
    80203c2c:	bf6d                	j	80203be6 <filewrite+0x60>
      f->off += n;
    80203c2e:	509c                	lw	a5,32(s1)
    80203c30:	01478a3b          	addw	s4,a5,s4
    80203c34:	0344a023          	sw	s4,32(s1)
      ret = n;
    80203c38:	894e                	mv	s2,s3
    80203c3a:	b74d                	j	80203bdc <filewrite+0x56>
    panic("filewrite");
    80203c3c:	00006517          	auipc	a0,0x6
    80203c40:	1a450513          	addi	a0,a0,420 # 80209de0 <sysnames+0x180>
    80203c44:	ffffc097          	auipc	ra,0xffffc
    80203c48:	500080e7          	jalr	1280(ra) # 80200144 <panic>
    return -1;
    80203c4c:	597d                	li	s2,-1
    80203c4e:	bf61                	j	80203be6 <filewrite+0x60>
      return -1;
    80203c50:	597d                	li	s2,-1
    80203c52:	bf51                	j	80203be6 <filewrite+0x60>
    80203c54:	597d                	li	s2,-1
    80203c56:	bf41                	j	80203be6 <filewrite+0x60>

0000000080203c58 <dirnext>:
int
dirnext(struct file *f, uint64 addr)
{
  // struct proc *p = myproc();

  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    80203c58:	00854783          	lbu	a5,8(a0)
    80203c5c:	cbcd                	beqz	a5,80203d0e <dirnext+0xb6>
{
    80203c5e:	7105                	addi	sp,sp,-480
    80203c60:	ef86                	sd	ra,472(sp)
    80203c62:	eba2                	sd	s0,464(sp)
    80203c64:	e7a6                	sd	s1,456(sp)
    80203c66:	e3ca                	sd	s2,448(sp)
    80203c68:	ff4e                	sd	s3,440(sp)
    80203c6a:	1380                	addi	s0,sp,480
    80203c6c:	84aa                	mv	s1,a0
    80203c6e:	89ae                	mv	s3,a1
  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    80203c70:	6d18                	ld	a4,24(a0)
    80203c72:	10074783          	lbu	a5,256(a4)
    80203c76:	8bc1                	andi	a5,a5,16
    return -1;
    80203c78:	557d                	li	a0,-1
  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    80203c7a:	eb81                	bnez	a5,80203c8a <dirnext+0x32>
  // if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    return -1;

  return 1;
    80203c7c:	60fe                	ld	ra,472(sp)
    80203c7e:	645e                	ld	s0,464(sp)
    80203c80:	64be                	ld	s1,456(sp)
    80203c82:	691e                	ld	s2,448(sp)
    80203c84:	79fa                	ld	s3,440(sp)
    80203c86:	613d                	addi	sp,sp,480
    80203c88:	8082                	ret
  int count = 0;
    80203c8a:	e2042623          	sw	zero,-468(s0)
  elock(f->ep);
    80203c8e:	853a                	mv	a0,a4
    80203c90:	00003097          	auipc	ra,0x3
    80203c94:	ddc080e7          	jalr	-548(ra) # 80206a6c <elock>
  while ((ret = enext(f->ep, &de, f->off, &count)) == 0) {  // skip empty entry
    80203c98:	a801                	j	80203ca8 <dirnext+0x50>
    f->off += count * 32;
    80203c9a:	e2c42783          	lw	a5,-468(s0)
    80203c9e:	0057971b          	slliw	a4,a5,0x5
    80203ca2:	509c                	lw	a5,32(s1)
    80203ca4:	9fb9                	addw	a5,a5,a4
    80203ca6:	d09c                	sw	a5,32(s1)
  while ((ret = enext(f->ep, &de, f->off, &count)) == 0) {  // skip empty entry
    80203ca8:	e2c40693          	addi	a3,s0,-468
    80203cac:	5090                	lw	a2,32(s1)
    80203cae:	e6840593          	addi	a1,s0,-408
    80203cb2:	6c88                	ld	a0,24(s1)
    80203cb4:	00003097          	auipc	ra,0x3
    80203cb8:	fbc080e7          	jalr	-68(ra) # 80206c70 <enext>
    80203cbc:	892a                	mv	s2,a0
    80203cbe:	dd71                	beqz	a0,80203c9a <dirnext+0x42>
  eunlock(f->ep);
    80203cc0:	6c88                	ld	a0,24(s1)
    80203cc2:	00003097          	auipc	ra,0x3
    80203cc6:	de0080e7          	jalr	-544(ra) # 80206aa2 <eunlock>
  if (ret == -1)
    80203cca:	57fd                	li	a5,-1
    return 0;
    80203ccc:	4501                	li	a0,0
  if (ret == -1)
    80203cce:	faf907e3          	beq	s2,a5,80203c7c <dirnext+0x24>
  f->off += count * 32;
    80203cd2:	e2c42783          	lw	a5,-468(s0)
    80203cd6:	0057971b          	slliw	a4,a5,0x5
    80203cda:	509c                	lw	a5,32(s1)
    80203cdc:	9fb9                	addw	a5,a5,a4
    80203cde:	d09c                	sw	a5,32(s1)
  estat(&de, &st);
    80203ce0:	e3040593          	addi	a1,s0,-464
    80203ce4:	e6840513          	addi	a0,s0,-408
    80203ce8:	00003097          	auipc	ra,0x3
    80203cec:	f40080e7          	jalr	-192(ra) # 80206c28 <estat>
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    80203cf0:	03800613          	li	a2,56
    80203cf4:	e3040593          	addi	a1,s0,-464
    80203cf8:	854e                	mv	a0,s3
    80203cfa:	ffffd097          	auipc	ra,0xffffd
    80203cfe:	7d8080e7          	jalr	2008(ra) # 802014d2 <copyout2>
    80203d02:	87aa                	mv	a5,a0
  return 1;
    80203d04:	4505                	li	a0,1
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    80203d06:	f607dbe3          	bgez	a5,80203c7c <dirnext+0x24>
    return -1;
    80203d0a:	557d                	li	a0,-1
    80203d0c:	bf85                	j	80203c7c <dirnext+0x24>
    return -1;
    80203d0e:	557d                	li	a0,-1
    80203d10:	8082                	ret

0000000080203d12 <pipealloc>:
#include "include/kalloc.h"
#include "include/vm.h"

int
pipealloc(struct file **f0, struct file **f1)
{
    80203d12:	7179                	addi	sp,sp,-48
    80203d14:	f406                	sd	ra,40(sp)
    80203d16:	f022                	sd	s0,32(sp)
    80203d18:	ec26                	sd	s1,24(sp)
    80203d1a:	e84a                	sd	s2,16(sp)
    80203d1c:	e44e                	sd	s3,8(sp)
    80203d1e:	e052                	sd	s4,0(sp)
    80203d20:	1800                	addi	s0,sp,48
    80203d22:	84aa                	mv	s1,a0
    80203d24:	8a2e                	mv	s4,a1
  struct pipe *pi;

  pi = 0;
  *f0 = *f1 = 0;
    80203d26:	0005b023          	sd	zero,0(a1)
    80203d2a:	00053023          	sd	zero,0(a0)
  if((*f0 = filealloc()) == NULL || (*f1 = filealloc()) == NULL)
    80203d2e:	00000097          	auipc	ra,0x0
    80203d32:	bc4080e7          	jalr	-1084(ra) # 802038f2 <filealloc>
    80203d36:	e088                	sd	a0,0(s1)
    80203d38:	c551                	beqz	a0,80203dc4 <pipealloc+0xb2>
    80203d3a:	00000097          	auipc	ra,0x0
    80203d3e:	bb8080e7          	jalr	-1096(ra) # 802038f2 <filealloc>
    80203d42:	00aa3023          	sd	a0,0(s4)
    80203d46:	c92d                	beqz	a0,80203db8 <pipealloc+0xa6>
    goto bad;
  if((pi = (struct pipe*)kalloc()) == NULL)
    80203d48:	ffffd097          	auipc	ra,0xffffd
    80203d4c:	840080e7          	jalr	-1984(ra) # 80200588 <kalloc>
    80203d50:	892a                	mv	s2,a0
    80203d52:	c125                	beqz	a0,80203db2 <pipealloc+0xa0>
    goto bad;
  pi->readopen = 1;
    80203d54:	4985                	li	s3,1
    80203d56:	23352023          	sw	s3,544(a0)
  pi->writeopen = 1;
    80203d5a:	23352223          	sw	s3,548(a0)
  pi->nwrite = 0;
    80203d5e:	20052e23          	sw	zero,540(a0)
  pi->nread = 0;
    80203d62:	20052c23          	sw	zero,536(a0)
  initlock(&pi->lock, "pipe");
    80203d66:	00006597          	auipc	a1,0x6
    80203d6a:	d2258593          	addi	a1,a1,-734 # 80209a88 <states.1723+0x308>
    80203d6e:	ffffd097          	auipc	ra,0xffffd
    80203d72:	942080e7          	jalr	-1726(ra) # 802006b0 <initlock>
  (*f0)->type = FD_PIPE;
    80203d76:	609c                	ld	a5,0(s1)
    80203d78:	0137a023          	sw	s3,0(a5)
  (*f0)->readable = 1;
    80203d7c:	609c                	ld	a5,0(s1)
    80203d7e:	01378423          	sb	s3,8(a5)
  (*f0)->writable = 0;
    80203d82:	609c                	ld	a5,0(s1)
    80203d84:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
    80203d88:	609c                	ld	a5,0(s1)
    80203d8a:	0127b823          	sd	s2,16(a5)
  (*f1)->type = FD_PIPE;
    80203d8e:	000a3783          	ld	a5,0(s4)
    80203d92:	0137a023          	sw	s3,0(a5)
  (*f1)->readable = 0;
    80203d96:	000a3783          	ld	a5,0(s4)
    80203d9a:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
    80203d9e:	000a3783          	ld	a5,0(s4)
    80203da2:	013784a3          	sb	s3,9(a5)
  (*f1)->pipe = pi;
    80203da6:	000a3783          	ld	a5,0(s4)
    80203daa:	0127b823          	sd	s2,16(a5)
  return 0;
    80203dae:	4501                	li	a0,0
    80203db0:	a025                	j	80203dd8 <pipealloc+0xc6>

 bad:
  if(pi)
    kfree((char*)pi);
  if(*f0)
    80203db2:	6088                	ld	a0,0(s1)
    80203db4:	e501                	bnez	a0,80203dbc <pipealloc+0xaa>
    80203db6:	a039                	j	80203dc4 <pipealloc+0xb2>
    80203db8:	6088                	ld	a0,0(s1)
    80203dba:	c51d                	beqz	a0,80203de8 <pipealloc+0xd6>
    fileclose(*f0);
    80203dbc:	00000097          	auipc	ra,0x0
    80203dc0:	bf2080e7          	jalr	-1038(ra) # 802039ae <fileclose>
  if(*f1)
    80203dc4:	000a3783          	ld	a5,0(s4)
    fileclose(*f1);
  return -1;
    80203dc8:	557d                	li	a0,-1
  if(*f1)
    80203dca:	c799                	beqz	a5,80203dd8 <pipealloc+0xc6>
    fileclose(*f1);
    80203dcc:	853e                	mv	a0,a5
    80203dce:	00000097          	auipc	ra,0x0
    80203dd2:	be0080e7          	jalr	-1056(ra) # 802039ae <fileclose>
  return -1;
    80203dd6:	557d                	li	a0,-1
}
    80203dd8:	70a2                	ld	ra,40(sp)
    80203dda:	7402                	ld	s0,32(sp)
    80203ddc:	64e2                	ld	s1,24(sp)
    80203dde:	6942                	ld	s2,16(sp)
    80203de0:	69a2                	ld	s3,8(sp)
    80203de2:	6a02                	ld	s4,0(sp)
    80203de4:	6145                	addi	sp,sp,48
    80203de6:	8082                	ret
  return -1;
    80203de8:	557d                	li	a0,-1
    80203dea:	b7fd                	j	80203dd8 <pipealloc+0xc6>

0000000080203dec <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
    80203dec:	1101                	addi	sp,sp,-32
    80203dee:	ec06                	sd	ra,24(sp)
    80203df0:	e822                	sd	s0,16(sp)
    80203df2:	e426                	sd	s1,8(sp)
    80203df4:	e04a                	sd	s2,0(sp)
    80203df6:	1000                	addi	s0,sp,32
    80203df8:	84aa                	mv	s1,a0
    80203dfa:	892e                	mv	s2,a1
  acquire(&pi->lock);
    80203dfc:	ffffd097          	auipc	ra,0xffffd
    80203e00:	8f8080e7          	jalr	-1800(ra) # 802006f4 <acquire>
  if(writable){
    80203e04:	02090d63          	beqz	s2,80203e3e <pipeclose+0x52>
    pi->writeopen = 0;
    80203e08:	2204a223          	sw	zero,548(s1)
    wakeup(&pi->nread);
    80203e0c:	21848513          	addi	a0,s1,536
    80203e10:	ffffe097          	auipc	ra,0xffffe
    80203e14:	790080e7          	jalr	1936(ra) # 802025a0 <wakeup>
  } else {
    pi->readopen = 0;
    wakeup(&pi->nwrite);
  }
  if(pi->readopen == 0 && pi->writeopen == 0){
    80203e18:	2204b783          	ld	a5,544(s1)
    80203e1c:	eb95                	bnez	a5,80203e50 <pipeclose+0x64>
    release(&pi->lock);
    80203e1e:	8526                	mv	a0,s1
    80203e20:	ffffd097          	auipc	ra,0xffffd
    80203e24:	928080e7          	jalr	-1752(ra) # 80200748 <release>
    kfree((char*)pi);
    80203e28:	8526                	mv	a0,s1
    80203e2a:	ffffc097          	auipc	ra,0xffffc
    80203e2e:	61c080e7          	jalr	1564(ra) # 80200446 <kfree>
  } else
    release(&pi->lock);
}
    80203e32:	60e2                	ld	ra,24(sp)
    80203e34:	6442                	ld	s0,16(sp)
    80203e36:	64a2                	ld	s1,8(sp)
    80203e38:	6902                	ld	s2,0(sp)
    80203e3a:	6105                	addi	sp,sp,32
    80203e3c:	8082                	ret
    pi->readopen = 0;
    80203e3e:	2204a023          	sw	zero,544(s1)
    wakeup(&pi->nwrite);
    80203e42:	21c48513          	addi	a0,s1,540
    80203e46:	ffffe097          	auipc	ra,0xffffe
    80203e4a:	75a080e7          	jalr	1882(ra) # 802025a0 <wakeup>
    80203e4e:	b7e9                	j	80203e18 <pipeclose+0x2c>
    release(&pi->lock);
    80203e50:	8526                	mv	a0,s1
    80203e52:	ffffd097          	auipc	ra,0xffffd
    80203e56:	8f6080e7          	jalr	-1802(ra) # 80200748 <release>
}
    80203e5a:	bfe1                	j	80203e32 <pipeclose+0x46>

0000000080203e5c <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
    80203e5c:	7119                	addi	sp,sp,-128
    80203e5e:	fc86                	sd	ra,120(sp)
    80203e60:	f8a2                	sd	s0,112(sp)
    80203e62:	f4a6                	sd	s1,104(sp)
    80203e64:	f0ca                	sd	s2,96(sp)
    80203e66:	ecce                	sd	s3,88(sp)
    80203e68:	e8d2                	sd	s4,80(sp)
    80203e6a:	e4d6                	sd	s5,72(sp)
    80203e6c:	e0da                	sd	s6,64(sp)
    80203e6e:	fc5e                	sd	s7,56(sp)
    80203e70:	f862                	sd	s8,48(sp)
    80203e72:	f466                	sd	s9,40(sp)
    80203e74:	f06a                	sd	s10,32(sp)
    80203e76:	ec6e                	sd	s11,24(sp)
    80203e78:	0100                	addi	s0,sp,128
    80203e7a:	84aa                	mv	s1,a0
    80203e7c:	8cae                	mv	s9,a1
    80203e7e:	8b32                	mv	s6,a2
  int i;
  char ch;
  struct proc *pr = myproc();
    80203e80:	ffffe097          	auipc	ra,0xffffe
    80203e84:	d3e080e7          	jalr	-706(ra) # 80201bbe <myproc>
    80203e88:	892a                	mv	s2,a0

  acquire(&pi->lock);
    80203e8a:	8526                	mv	a0,s1
    80203e8c:	ffffd097          	auipc	ra,0xffffd
    80203e90:	868080e7          	jalr	-1944(ra) # 802006f4 <acquire>
  for(i = 0; i < n; i++){
    80203e94:	0d605763          	blez	s6,80203f62 <pipewrite+0x106>
    80203e98:	89a6                	mv	s3,s1
    80203e9a:	3b7d                	addiw	s6,s6,-1
    80203e9c:	1b02                	slli	s6,s6,0x20
    80203e9e:	020b5b13          	srli	s6,s6,0x20
    80203ea2:	4b81                	li	s7,0
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
      if(pi->readopen == 0 || pr->killed){
        release(&pi->lock);
        return -1;
      }
      wakeup(&pi->nread);
    80203ea4:	21848a93          	addi	s5,s1,536
      sleep(&pi->nwrite, &pi->lock);
    80203ea8:	21c48a13          	addi	s4,s1,540
    }
    // if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    if(copyin2(&ch, addr + i, 1) == -1)
    80203eac:	5dfd                	li	s11,-1
    80203eae:	000b8d1b          	sext.w	s10,s7
    80203eb2:	8c6a                	mv	s8,s10
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
    80203eb4:	2184a783          	lw	a5,536(s1)
    80203eb8:	21c4a703          	lw	a4,540(s1)
    80203ebc:	2007879b          	addiw	a5,a5,512
    80203ec0:	02f71b63          	bne	a4,a5,80203ef6 <pipewrite+0x9a>
      if(pi->readopen == 0 || pr->killed){
    80203ec4:	2204a783          	lw	a5,544(s1)
    80203ec8:	c7bd                	beqz	a5,80203f36 <pipewrite+0xda>
    80203eca:	03092783          	lw	a5,48(s2)
    80203ece:	e7a5                	bnez	a5,80203f36 <pipewrite+0xda>
      wakeup(&pi->nread);
    80203ed0:	8556                	mv	a0,s5
    80203ed2:	ffffe097          	auipc	ra,0xffffe
    80203ed6:	6ce080e7          	jalr	1742(ra) # 802025a0 <wakeup>
      sleep(&pi->nwrite, &pi->lock);
    80203eda:	85ce                	mv	a1,s3
    80203edc:	8552                	mv	a0,s4
    80203ede:	ffffe097          	auipc	ra,0xffffe
    80203ee2:	540080e7          	jalr	1344(ra) # 8020241e <sleep>
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
    80203ee6:	2184a783          	lw	a5,536(s1)
    80203eea:	21c4a703          	lw	a4,540(s1)
    80203eee:	2007879b          	addiw	a5,a5,512
    80203ef2:	fcf709e3          	beq	a4,a5,80203ec4 <pipewrite+0x68>
    if(copyin2(&ch, addr + i, 1) == -1)
    80203ef6:	4605                	li	a2,1
    80203ef8:	019b85b3          	add	a1,s7,s9
    80203efc:	f8f40513          	addi	a0,s0,-113
    80203f00:	ffffd097          	auipc	ra,0xffffd
    80203f04:	6b0080e7          	jalr	1712(ra) # 802015b0 <copyin2>
    80203f08:	05b50e63          	beq	a0,s11,80203f64 <pipewrite+0x108>
      break;
    pi->data[pi->nwrite++ % PIPESIZE] = ch;
    80203f0c:	21c4a783          	lw	a5,540(s1)
    80203f10:	0017871b          	addiw	a4,a5,1
    80203f14:	20e4ae23          	sw	a4,540(s1)
    80203f18:	1ff7f793          	andi	a5,a5,511
    80203f1c:	97a6                	add	a5,a5,s1
    80203f1e:	f8f44703          	lbu	a4,-113(s0)
    80203f22:	00e78c23          	sb	a4,24(a5)
  for(i = 0; i < n; i++){
    80203f26:	001d0c1b          	addiw	s8,s10,1
    80203f2a:	001b8793          	addi	a5,s7,1
    80203f2e:	036b8b63          	beq	s7,s6,80203f64 <pipewrite+0x108>
    80203f32:	8bbe                	mv	s7,a5
    80203f34:	bfad                	j	80203eae <pipewrite+0x52>
        release(&pi->lock);
    80203f36:	8526                	mv	a0,s1
    80203f38:	ffffd097          	auipc	ra,0xffffd
    80203f3c:	810080e7          	jalr	-2032(ra) # 80200748 <release>
        return -1;
    80203f40:	5c7d                	li	s8,-1
  }
  wakeup(&pi->nread);
  release(&pi->lock);
  return i;
}
    80203f42:	8562                	mv	a0,s8
    80203f44:	70e6                	ld	ra,120(sp)
    80203f46:	7446                	ld	s0,112(sp)
    80203f48:	74a6                	ld	s1,104(sp)
    80203f4a:	7906                	ld	s2,96(sp)
    80203f4c:	69e6                	ld	s3,88(sp)
    80203f4e:	6a46                	ld	s4,80(sp)
    80203f50:	6aa6                	ld	s5,72(sp)
    80203f52:	6b06                	ld	s6,64(sp)
    80203f54:	7be2                	ld	s7,56(sp)
    80203f56:	7c42                	ld	s8,48(sp)
    80203f58:	7ca2                	ld	s9,40(sp)
    80203f5a:	7d02                	ld	s10,32(sp)
    80203f5c:	6de2                	ld	s11,24(sp)
    80203f5e:	6109                	addi	sp,sp,128
    80203f60:	8082                	ret
  for(i = 0; i < n; i++){
    80203f62:	4c01                	li	s8,0
  wakeup(&pi->nread);
    80203f64:	21848513          	addi	a0,s1,536
    80203f68:	ffffe097          	auipc	ra,0xffffe
    80203f6c:	638080e7          	jalr	1592(ra) # 802025a0 <wakeup>
  release(&pi->lock);
    80203f70:	8526                	mv	a0,s1
    80203f72:	ffffc097          	auipc	ra,0xffffc
    80203f76:	7d6080e7          	jalr	2006(ra) # 80200748 <release>
  return i;
    80203f7a:	b7e1                	j	80203f42 <pipewrite+0xe6>

0000000080203f7c <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
    80203f7c:	715d                	addi	sp,sp,-80
    80203f7e:	e486                	sd	ra,72(sp)
    80203f80:	e0a2                	sd	s0,64(sp)
    80203f82:	fc26                	sd	s1,56(sp)
    80203f84:	f84a                	sd	s2,48(sp)
    80203f86:	f44e                	sd	s3,40(sp)
    80203f88:	f052                	sd	s4,32(sp)
    80203f8a:	ec56                	sd	s5,24(sp)
    80203f8c:	e85a                	sd	s6,16(sp)
    80203f8e:	0880                	addi	s0,sp,80
    80203f90:	84aa                	mv	s1,a0
    80203f92:	892e                	mv	s2,a1
    80203f94:	8a32                	mv	s4,a2
  int i;
  struct proc *pr = myproc();
    80203f96:	ffffe097          	auipc	ra,0xffffe
    80203f9a:	c28080e7          	jalr	-984(ra) # 80201bbe <myproc>
    80203f9e:	89aa                	mv	s3,a0
  char ch;

  acquire(&pi->lock);
    80203fa0:	8b26                	mv	s6,s1
    80203fa2:	8526                	mv	a0,s1
    80203fa4:	ffffc097          	auipc	ra,0xffffc
    80203fa8:	750080e7          	jalr	1872(ra) # 802006f4 <acquire>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80203fac:	2184a703          	lw	a4,536(s1)
    80203fb0:	21c4a783          	lw	a5,540(s1)
    if(pr->killed){
      release(&pi->lock);
      return -1;
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    80203fb4:	21848a93          	addi	s5,s1,536
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80203fb8:	02f71463          	bne	a4,a5,80203fe0 <piperead+0x64>
    80203fbc:	2244a783          	lw	a5,548(s1)
    80203fc0:	c385                	beqz	a5,80203fe0 <piperead+0x64>
    if(pr->killed){
    80203fc2:	0309a783          	lw	a5,48(s3)
    80203fc6:	e7d1                	bnez	a5,80204052 <piperead+0xd6>
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    80203fc8:	85da                	mv	a1,s6
    80203fca:	8556                	mv	a0,s5
    80203fcc:	ffffe097          	auipc	ra,0xffffe
    80203fd0:	452080e7          	jalr	1106(ra) # 8020241e <sleep>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80203fd4:	2184a703          	lw	a4,536(s1)
    80203fd8:	21c4a783          	lw	a5,540(s1)
    80203fdc:	fef700e3          	beq	a4,a5,80203fbc <piperead+0x40>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    80203fe0:	09405063          	blez	s4,80204060 <piperead+0xe4>
    80203fe4:	4981                	li	s3,0
    if(pi->nread == pi->nwrite)
      break;
    ch = pi->data[pi->nread++ % PIPESIZE];
    // if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    if(copyout2(addr + i, &ch, 1) == -1)
    80203fe6:	5afd                	li	s5,-1
    if(pi->nread == pi->nwrite)
    80203fe8:	2184a783          	lw	a5,536(s1)
    80203fec:	21c4a703          	lw	a4,540(s1)
    80203ff0:	02f70b63          	beq	a4,a5,80204026 <piperead+0xaa>
    ch = pi->data[pi->nread++ % PIPESIZE];
    80203ff4:	0017871b          	addiw	a4,a5,1
    80203ff8:	20e4ac23          	sw	a4,536(s1)
    80203ffc:	1ff7f793          	andi	a5,a5,511
    80204000:	97a6                	add	a5,a5,s1
    80204002:	0187c783          	lbu	a5,24(a5)
    80204006:	faf40fa3          	sb	a5,-65(s0)
    if(copyout2(addr + i, &ch, 1) == -1)
    8020400a:	4605                	li	a2,1
    8020400c:	fbf40593          	addi	a1,s0,-65
    80204010:	854a                	mv	a0,s2
    80204012:	ffffd097          	auipc	ra,0xffffd
    80204016:	4c0080e7          	jalr	1216(ra) # 802014d2 <copyout2>
    8020401a:	01550663          	beq	a0,s5,80204026 <piperead+0xaa>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    8020401e:	2985                	addiw	s3,s3,1
    80204020:	0905                	addi	s2,s2,1
    80204022:	fd3a13e3          	bne	s4,s3,80203fe8 <piperead+0x6c>
      break;
  }
  wakeup(&pi->nwrite);  //DOC: piperead-wakeup
    80204026:	21c48513          	addi	a0,s1,540
    8020402a:	ffffe097          	auipc	ra,0xffffe
    8020402e:	576080e7          	jalr	1398(ra) # 802025a0 <wakeup>
  release(&pi->lock);
    80204032:	8526                	mv	a0,s1
    80204034:	ffffc097          	auipc	ra,0xffffc
    80204038:	714080e7          	jalr	1812(ra) # 80200748 <release>
  return i;
}
    8020403c:	854e                	mv	a0,s3
    8020403e:	60a6                	ld	ra,72(sp)
    80204040:	6406                	ld	s0,64(sp)
    80204042:	74e2                	ld	s1,56(sp)
    80204044:	7942                	ld	s2,48(sp)
    80204046:	79a2                	ld	s3,40(sp)
    80204048:	7a02                	ld	s4,32(sp)
    8020404a:	6ae2                	ld	s5,24(sp)
    8020404c:	6b42                	ld	s6,16(sp)
    8020404e:	6161                	addi	sp,sp,80
    80204050:	8082                	ret
      release(&pi->lock);
    80204052:	8526                	mv	a0,s1
    80204054:	ffffc097          	auipc	ra,0xffffc
    80204058:	6f4080e7          	jalr	1780(ra) # 80200748 <release>
      return -1;
    8020405c:	59fd                	li	s3,-1
    8020405e:	bff9                	j	8020403c <piperead+0xc0>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    80204060:	4981                	li	s3,0
    80204062:	b7d1                	j	80204026 <piperead+0xaa>

0000000080204064 <exec>:
  return 0;
}


int exec(char *path, char **argv)
{
    80204064:	de010113          	addi	sp,sp,-544
    80204068:	20113c23          	sd	ra,536(sp)
    8020406c:	20813823          	sd	s0,528(sp)
    80204070:	20913423          	sd	s1,520(sp)
    80204074:	21213023          	sd	s2,512(sp)
    80204078:	ffce                	sd	s3,504(sp)
    8020407a:	fbd2                	sd	s4,496(sp)
    8020407c:	f7d6                	sd	s5,488(sp)
    8020407e:	f3da                	sd	s6,480(sp)
    80204080:	efde                	sd	s7,472(sp)
    80204082:	ebe2                	sd	s8,464(sp)
    80204084:	e7e6                	sd	s9,456(sp)
    80204086:	e3ea                	sd	s10,448(sp)
    80204088:	ff6e                	sd	s11,440(sp)
    8020408a:	1400                	addi	s0,sp,544
    8020408c:	892a                	mv	s2,a0
    8020408e:	dea43423          	sd	a0,-536(s0)
    80204092:	deb43823          	sd	a1,-528(s0)
  struct elfhdr elf;
  struct dirent *ep;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
  pagetable_t kpagetable = 0, oldkpagetable;
  struct proc *p = myproc();
    80204096:	ffffe097          	auipc	ra,0xffffe
    8020409a:	b28080e7          	jalr	-1240(ra) # 80201bbe <myproc>
    8020409e:	84aa                	mv	s1,a0

  // Make a copy of p->kpt without old user space, 
  // but with the same kstack we are using now, which can't be changed
  if ((kpagetable = (pagetable_t)kalloc()) == NULL) {
    802040a0:	ffffc097          	auipc	ra,0xffffc
    802040a4:	4e8080e7          	jalr	1256(ra) # 80200588 <kalloc>
    802040a8:	2a050d63          	beqz	a0,80204362 <exec+0x2fe>
    802040ac:	8aaa                	mv	s5,a0
    return -1;
  }
  memmove(kpagetable, p->kpagetable, PGSIZE);
    802040ae:	6605                	lui	a2,0x1
    802040b0:	6cac                	ld	a1,88(s1)
    802040b2:	ffffc097          	auipc	ra,0xffffc
    802040b6:	73e080e7          	jalr	1854(ra) # 802007f0 <memmove>
  for (int i = 0; i < PX(2, MAXUVA); i++) {
    kpagetable[i] = 0;
    802040ba:	000ab023          	sd	zero,0(s5)
    802040be:	000ab423          	sd	zero,8(s5)
  }

  if((ep = ename(path)) == NULL) {
    802040c2:	854a                	mv	a0,s2
    802040c4:	00003097          	auipc	ra,0x3
    802040c8:	148080e7          	jalr	328(ra) # 8020720c <ename>
    802040cc:	8a2a                	mv	s4,a0
    802040ce:	c529                	beqz	a0,80204118 <exec+0xb4>
    #ifdef DEBUG
    printf("[exec] %s not found\n", path);
    #endif
    goto bad;
  }
  elock(ep);
    802040d0:	00003097          	auipc	ra,0x3
    802040d4:	99c080e7          	jalr	-1636(ra) # 80206a6c <elock>

  // Check ELF header
  if(eread(ep, 0, (uint64) &elf, 0, sizeof(elf)) != sizeof(elf))
    802040d8:	04000713          	li	a4,64
    802040dc:	4681                	li	a3,0
    802040de:	e4840613          	addi	a2,s0,-440
    802040e2:	4581                	li	a1,0
    802040e4:	8552                	mv	a0,s4
    802040e6:	00002097          	auipc	ra,0x2
    802040ea:	0bc080e7          	jalr	188(ra) # 802061a2 <eread>
    802040ee:	04000793          	li	a5,64
    802040f2:	00f51a63          	bne	a0,a5,80204106 <exec+0xa2>
    goto bad;
  if(elf.magic != ELF_MAGIC)
    802040f6:	e4842703          	lw	a4,-440(s0)
    802040fa:	464c47b7          	lui	a5,0x464c4
    802040fe:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39d3ba81>
    80204102:	02f70663          	beq	a4,a5,8020412e <exec+0xca>
  kvmfree(oldkpagetable, 0);
  return argc; // this ends up in a0, the first argument to main(argc, argv)

 bad:
  #ifdef DEBUG
  printf("[exec] reach bad\n");
    80204106:	00006517          	auipc	a0,0x6
    8020410a:	d2250513          	addi	a0,a0,-734 # 80209e28 <sysnames+0x1c8>
    8020410e:	ffffc097          	auipc	ra,0xffffc
    80204112:	080080e7          	jalr	128(ra) # 8020018e <printf>
  #endif
  if(pagetable)
    80204116:	ac95                	j	8020438a <exec+0x326>
    printf("[exec] %s not found\n", path);
    80204118:	de843583          	ld	a1,-536(s0)
    8020411c:	00006517          	auipc	a0,0x6
    80204120:	cd450513          	addi	a0,a0,-812 # 80209df0 <sysnames+0x190>
    80204124:	ffffc097          	auipc	ra,0xffffc
    80204128:	06a080e7          	jalr	106(ra) # 8020018e <printf>
    goto bad;
    8020412c:	bfe9                	j	80204106 <exec+0xa2>
  if((pagetable = proc_pagetable(p)) == NULL)
    8020412e:	8526                	mv	a0,s1
    80204130:	ffffe097          	auipc	ra,0xffffe
    80204134:	b72080e7          	jalr	-1166(ra) # 80201ca2 <proc_pagetable>
    80204138:	e0a43423          	sd	a0,-504(s0)
    8020413c:	d569                	beqz	a0,80204106 <exec+0xa2>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    8020413e:	e6842783          	lw	a5,-408(s0)
    80204142:	e8045703          	lhu	a4,-384(s0)
    80204146:	c72d                	beqz	a4,802041b0 <exec+0x14c>
  uint64 argc, sz = 0, sp, ustack[MAXARG+1], stackbase;
    80204148:	4481                	li	s1,0
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    8020414a:	4d81                	li	s11,0
    if(ph.vaddr % PGSIZE != 0)
    8020414c:	6b05                	lui	s6,0x1
    8020414e:	fffb0713          	addi	a4,s6,-1 # fff <_entry-0x801ff001>
    80204152:	dee43023          	sd	a4,-544(s0)
    80204156:	7bfd                	lui	s7,0xfffff
    80204158:	a4c9                	j	8020441a <exec+0x3b6>
      panic("loadseg: address should exist");
    8020415a:	00006517          	auipc	a0,0x6
    8020415e:	cae50513          	addi	a0,a0,-850 # 80209e08 <sysnames+0x1a8>
    80204162:	ffffc097          	auipc	ra,0xffffc
    80204166:	fe2080e7          	jalr	-30(ra) # 80200144 <panic>
    if(eread(ep, 0, (uint64)pa, offset+i, n) != n)
    8020416a:	874e                	mv	a4,s3
    8020416c:	009d06bb          	addw	a3,s10,s1
    80204170:	4581                	li	a1,0
    80204172:	8552                	mv	a0,s4
    80204174:	00002097          	auipc	ra,0x2
    80204178:	02e080e7          	jalr	46(ra) # 802061a2 <eread>
    8020417c:	2501                	sext.w	a0,a0
    8020417e:	1ea99663          	bne	s3,a0,8020436a <exec+0x306>
  for(i = 0; i < sz; i += PGSIZE){
    80204182:	6785                	lui	a5,0x1
    80204184:	9cbd                	addw	s1,s1,a5
    80204186:	012b893b          	addw	s2,s7,s2
    8020418a:	2784fd63          	bgeu	s1,s8,80204404 <exec+0x3a0>
    pa = walkaddr(pagetable, va + i);
    8020418e:	02049593          	slli	a1,s1,0x20
    80204192:	9181                	srli	a1,a1,0x20
    80204194:	95e6                	add	a1,a1,s9
    80204196:	e0843503          	ld	a0,-504(s0)
    8020419a:	ffffd097          	auipc	ra,0xffffd
    8020419e:	adc080e7          	jalr	-1316(ra) # 80200c76 <walkaddr>
    802041a2:	862a                	mv	a2,a0
    if(pa == NULL)
    802041a4:	d95d                	beqz	a0,8020415a <exec+0xf6>
      n = PGSIZE;
    802041a6:	89da                	mv	s3,s6
    if(sz - i < PGSIZE)
    802041a8:	fd6971e3          	bgeu	s2,s6,8020416a <exec+0x106>
      n = sz - i;
    802041ac:	89ca                	mv	s3,s2
    802041ae:	bf75                	j	8020416a <exec+0x106>
  uint64 argc, sz = 0, sp, ustack[MAXARG+1], stackbase;
    802041b0:	4481                	li	s1,0
  eunlock(ep);
    802041b2:	8552                	mv	a0,s4
    802041b4:	00003097          	auipc	ra,0x3
    802041b8:	8ee080e7          	jalr	-1810(ra) # 80206aa2 <eunlock>
  eput(ep);
    802041bc:	8552                	mv	a0,s4
    802041be:	00003097          	auipc	ra,0x3
    802041c2:	932080e7          	jalr	-1742(ra) # 80206af0 <eput>
  p = myproc();
    802041c6:	ffffe097          	auipc	ra,0xffffe
    802041ca:	9f8080e7          	jalr	-1544(ra) # 80201bbe <myproc>
    802041ce:	8b2a                	mv	s6,a0
  uint64 oldsz = p->sz;
    802041d0:	04853d83          	ld	s11,72(a0)
  sz = PGROUNDUP(sz);
    802041d4:	6785                	lui	a5,0x1
    802041d6:	17fd                	addi	a5,a5,-1
    802041d8:	94be                	add	s1,s1,a5
    802041da:	77fd                	lui	a5,0xfffff
    802041dc:	8fe5                	and	a5,a5,s1
    802041de:	def43c23          	sd	a5,-520(s0)
  if((sz1 = uvmalloc(pagetable, kpagetable, sz, sz + 2*PGSIZE)) == 0)
    802041e2:	6689                	lui	a3,0x2
    802041e4:	96be                	add	a3,a3,a5
    802041e6:	863e                	mv	a2,a5
    802041e8:	85d6                	mv	a1,s5
    802041ea:	e0843483          	ld	s1,-504(s0)
    802041ee:	8526                	mv	a0,s1
    802041f0:	ffffd097          	auipc	ra,0xffffd
    802041f4:	f7e080e7          	jalr	-130(ra) # 8020116e <uvmalloc>
    802041f8:	8d2a                	mv	s10,a0
  ep = 0;
    802041fa:	4a01                	li	s4,0
  if((sz1 = uvmalloc(pagetable, kpagetable, sz, sz + 2*PGSIZE)) == 0)
    802041fc:	16050763          	beqz	a0,8020436a <exec+0x306>
  uvmclear(pagetable, sz-2*PGSIZE);
    80204200:	75f9                	lui	a1,0xffffe
    80204202:	95aa                	add	a1,a1,a0
    80204204:	8526                	mv	a0,s1
    80204206:	ffffd097          	auipc	ra,0xffffd
    8020420a:	20e080e7          	jalr	526(ra) # 80201414 <uvmclear>
  stackbase = sp - PGSIZE;
    8020420e:	7c7d                	lui	s8,0xfffff
    80204210:	9c6a                	add	s8,s8,s10
  for(argc = 0; argv[argc]; argc++) {
    80204212:	df043783          	ld	a5,-528(s0)
    80204216:	6388                	ld	a0,0(a5)
    80204218:	c925                	beqz	a0,80204288 <exec+0x224>
    8020421a:	e8840993          	addi	s3,s0,-376
    8020421e:	f8840c93          	addi	s9,s0,-120
  sp = sz;
    80204222:	896a                	mv	s2,s10
  for(argc = 0; argv[argc]; argc++) {
    80204224:	4481                	li	s1,0
    sp -= strlen(argv[argc]) + 1;
    80204226:	ffffc097          	auipc	ra,0xffffc
    8020422a:	6f2080e7          	jalr	1778(ra) # 80200918 <strlen>
    8020422e:	2505                	addiw	a0,a0,1
    80204230:	40a90933          	sub	s2,s2,a0
    sp -= sp % 16; // riscv sp must be 16-byte aligned
    80204234:	ff097913          	andi	s2,s2,-16
    if(sp < stackbase)
    80204238:	1b896a63          	bltu	s2,s8,802043ec <exec+0x388>
    if(copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
    8020423c:	df043b83          	ld	s7,-528(s0)
    80204240:	000bba03          	ld	s4,0(s7) # fffffffffffff000 <kernel_end+0xffffffff7fbcf000>
    80204244:	8552                	mv	a0,s4
    80204246:	ffffc097          	auipc	ra,0xffffc
    8020424a:	6d2080e7          	jalr	1746(ra) # 80200918 <strlen>
    8020424e:	0015069b          	addiw	a3,a0,1
    80204252:	8652                	mv	a2,s4
    80204254:	85ca                	mv	a1,s2
    80204256:	e0843503          	ld	a0,-504(s0)
    8020425a:	ffffd097          	auipc	ra,0xffffd
    8020425e:	1ec080e7          	jalr	492(ra) # 80201446 <copyout>
    80204262:	18054963          	bltz	a0,802043f4 <exec+0x390>
    ustack[argc] = sp;
    80204266:	0129b023          	sd	s2,0(s3)
  for(argc = 0; argv[argc]; argc++) {
    8020426a:	0485                	addi	s1,s1,1
    8020426c:	008b8793          	addi	a5,s7,8
    80204270:	def43823          	sd	a5,-528(s0)
    80204274:	008bb503          	ld	a0,8(s7)
    80204278:	c911                	beqz	a0,8020428c <exec+0x228>
    if(argc >= MAXARG)
    8020427a:	09a1                	addi	s3,s3,8
    8020427c:	fb9995e3          	bne	s3,s9,80204226 <exec+0x1c2>
  sz = sz1;
    80204280:	dfa43c23          	sd	s10,-520(s0)
  ep = 0;
    80204284:	4a01                	li	s4,0
    80204286:	a0d5                	j	8020436a <exec+0x306>
  sp = sz;
    80204288:	896a                	mv	s2,s10
  for(argc = 0; argv[argc]; argc++) {
    8020428a:	4481                	li	s1,0
  ustack[argc] = 0;
    8020428c:	00349793          	slli	a5,s1,0x3
    80204290:	f9040713          	addi	a4,s0,-112
    80204294:	97ba                	add	a5,a5,a4
    80204296:	ee07bc23          	sd	zero,-264(a5) # ffffffffffffeef8 <kernel_end+0xffffffff7fbceef8>
  sp -= (argc+1) * sizeof(uint64);
    8020429a:	00148693          	addi	a3,s1,1
    8020429e:	068e                	slli	a3,a3,0x3
    802042a0:	40d90933          	sub	s2,s2,a3
  sp -= sp % 16;
    802042a4:	ff097913          	andi	s2,s2,-16
  if(sp < stackbase)
    802042a8:	01897663          	bgeu	s2,s8,802042b4 <exec+0x250>
  sz = sz1;
    802042ac:	dfa43c23          	sd	s10,-520(s0)
  ep = 0;
    802042b0:	4a01                	li	s4,0
    802042b2:	a865                	j	8020436a <exec+0x306>
  if(copyout(pagetable, sp, (char *)ustack, (argc+1)*sizeof(uint64)) < 0)
    802042b4:	e8840613          	addi	a2,s0,-376
    802042b8:	85ca                	mv	a1,s2
    802042ba:	e0843503          	ld	a0,-504(s0)
    802042be:	ffffd097          	auipc	ra,0xffffd
    802042c2:	188080e7          	jalr	392(ra) # 80201446 <copyout>
    802042c6:	12054b63          	bltz	a0,802043fc <exec+0x398>
  p->trapframe->a1 = sp;
    802042ca:	060b3783          	ld	a5,96(s6)
    802042ce:	0727bc23          	sd	s2,120(a5)
  for(last=s=path; *s; s++)
    802042d2:	de843783          	ld	a5,-536(s0)
    802042d6:	0007c703          	lbu	a4,0(a5)
    802042da:	cf11                	beqz	a4,802042f6 <exec+0x292>
    802042dc:	0785                	addi	a5,a5,1
    if(*s == '/')
    802042de:	02f00693          	li	a3,47
    802042e2:	a029                	j	802042ec <exec+0x288>
  for(last=s=path; *s; s++)
    802042e4:	0785                	addi	a5,a5,1
    802042e6:	fff7c703          	lbu	a4,-1(a5)
    802042ea:	c711                	beqz	a4,802042f6 <exec+0x292>
    if(*s == '/')
    802042ec:	fed71ce3          	bne	a4,a3,802042e4 <exec+0x280>
      last = s+1;
    802042f0:	def43423          	sd	a5,-536(s0)
    802042f4:	bfc5                	j	802042e4 <exec+0x280>
  safestrcpy(p->name, last, sizeof(p->name));
    802042f6:	4641                	li	a2,16
    802042f8:	de843583          	ld	a1,-536(s0)
    802042fc:	160b0513          	addi	a0,s6,352
    80204300:	ffffc097          	auipc	ra,0xffffc
    80204304:	5e6080e7          	jalr	1510(ra) # 802008e6 <safestrcpy>
  oldpagetable = p->pagetable;
    80204308:	050b3503          	ld	a0,80(s6)
  oldkpagetable = p->kpagetable;
    8020430c:	058b3983          	ld	s3,88(s6)
  p->pagetable = pagetable;
    80204310:	e0843783          	ld	a5,-504(s0)
    80204314:	04fb3823          	sd	a5,80(s6)
  p->kpagetable = kpagetable;
    80204318:	055b3c23          	sd	s5,88(s6)
  p->sz = sz;
    8020431c:	05ab3423          	sd	s10,72(s6)
  p->trapframe->epc = elf.entry;  // initial program counter = main
    80204320:	060b3783          	ld	a5,96(s6)
    80204324:	e6043703          	ld	a4,-416(s0)
    80204328:	ef98                	sd	a4,24(a5)
  p->trapframe->sp = sp; // initial stack pointer
    8020432a:	060b3783          	ld	a5,96(s6)
    8020432e:	0327b823          	sd	s2,48(a5)
  proc_freepagetable(oldpagetable, oldsz);
    80204332:	85ee                	mv	a1,s11
    80204334:	ffffe097          	auipc	ra,0xffffe
    80204338:	a0a080e7          	jalr	-1526(ra) # 80201d3e <proc_freepagetable>
  w_satp(MAKE_SATP(p->kpagetable));
    8020433c:	058b3783          	ld	a5,88(s6)
    80204340:	83b1                	srli	a5,a5,0xc
    80204342:	577d                	li	a4,-1
    80204344:	177e                	slli	a4,a4,0x3f
    80204346:	8fd9                	or	a5,a5,a4
  asm volatile("csrw satp, %0" : : "r" (x));
    80204348:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    8020434c:	12000073          	sfence.vma
  kvmfree(oldkpagetable, 0);
    80204350:	4581                	li	a1,0
    80204352:	854e                	mv	a0,s3
    80204354:	ffffd097          	auipc	ra,0xffffd
    80204358:	480080e7          	jalr	1152(ra) # 802017d4 <kvmfree>
  return argc; // this ends up in a0, the first argument to main(argc, argv)
    8020435c:	0004851b          	sext.w	a0,s1
    80204360:	a889                	j	802043b2 <exec+0x34e>
    return -1;
    80204362:	557d                	li	a0,-1
    80204364:	a0b9                	j	802043b2 <exec+0x34e>
    80204366:	de943c23          	sd	s1,-520(s0)
  printf("[exec] reach bad\n");
    8020436a:	00006517          	auipc	a0,0x6
    8020436e:	abe50513          	addi	a0,a0,-1346 # 80209e28 <sysnames+0x1c8>
    80204372:	ffffc097          	auipc	ra,0xffffc
    80204376:	e1c080e7          	jalr	-484(ra) # 8020018e <printf>
    proc_freepagetable(pagetable, sz);
    8020437a:	df843583          	ld	a1,-520(s0)
    8020437e:	e0843503          	ld	a0,-504(s0)
    80204382:	ffffe097          	auipc	ra,0xffffe
    80204386:	9bc080e7          	jalr	-1604(ra) # 80201d3e <proc_freepagetable>
  if(kpagetable)
    kvmfree(kpagetable, 0);
    8020438a:	4581                	li	a1,0
    8020438c:	8556                	mv	a0,s5
    8020438e:	ffffd097          	auipc	ra,0xffffd
    80204392:	446080e7          	jalr	1094(ra) # 802017d4 <kvmfree>
  if(ep){
    eunlock(ep);
    eput(ep);
  }
  return -1;
    80204396:	557d                	li	a0,-1
  if(ep){
    80204398:	000a0d63          	beqz	s4,802043b2 <exec+0x34e>
    eunlock(ep);
    8020439c:	8552                	mv	a0,s4
    8020439e:	00002097          	auipc	ra,0x2
    802043a2:	704080e7          	jalr	1796(ra) # 80206aa2 <eunlock>
    eput(ep);
    802043a6:	8552                	mv	a0,s4
    802043a8:	00002097          	auipc	ra,0x2
    802043ac:	748080e7          	jalr	1864(ra) # 80206af0 <eput>
  return -1;
    802043b0:	557d                	li	a0,-1
}
    802043b2:	21813083          	ld	ra,536(sp)
    802043b6:	21013403          	ld	s0,528(sp)
    802043ba:	20813483          	ld	s1,520(sp)
    802043be:	20013903          	ld	s2,512(sp)
    802043c2:	79fe                	ld	s3,504(sp)
    802043c4:	7a5e                	ld	s4,496(sp)
    802043c6:	7abe                	ld	s5,488(sp)
    802043c8:	7b1e                	ld	s6,480(sp)
    802043ca:	6bfe                	ld	s7,472(sp)
    802043cc:	6c5e                	ld	s8,464(sp)
    802043ce:	6cbe                	ld	s9,456(sp)
    802043d0:	6d1e                	ld	s10,448(sp)
    802043d2:	7dfa                	ld	s11,440(sp)
    802043d4:	22010113          	addi	sp,sp,544
    802043d8:	8082                	ret
    802043da:	de943c23          	sd	s1,-520(s0)
    802043de:	b771                	j	8020436a <exec+0x306>
    802043e0:	de943c23          	sd	s1,-520(s0)
    802043e4:	b759                	j	8020436a <exec+0x306>
    802043e6:	de943c23          	sd	s1,-520(s0)
    802043ea:	b741                	j	8020436a <exec+0x306>
  sz = sz1;
    802043ec:	dfa43c23          	sd	s10,-520(s0)
  ep = 0;
    802043f0:	4a01                	li	s4,0
    802043f2:	bfa5                	j	8020436a <exec+0x306>
  sz = sz1;
    802043f4:	dfa43c23          	sd	s10,-520(s0)
  ep = 0;
    802043f8:	4a01                	li	s4,0
    802043fa:	bf85                	j	8020436a <exec+0x306>
  sz = sz1;
    802043fc:	dfa43c23          	sd	s10,-520(s0)
  ep = 0;
    80204400:	4a01                	li	s4,0
    80204402:	b7a5                	j	8020436a <exec+0x306>
    if((sz1 = uvmalloc(pagetable, kpagetable, sz, ph.vaddr + ph.memsz)) == 0)
    80204404:	df843483          	ld	s1,-520(s0)
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    80204408:	2d85                	addiw	s11,s11,1
    8020440a:	e0043783          	ld	a5,-512(s0)
    8020440e:	0387879b          	addiw	a5,a5,56
    80204412:	e8045703          	lhu	a4,-384(s0)
    80204416:	d8eddee3          	bge	s11,a4,802041b2 <exec+0x14e>
    if(eread(ep, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    8020441a:	2781                	sext.w	a5,a5
    8020441c:	e0f43023          	sd	a5,-512(s0)
    80204420:	03800713          	li	a4,56
    80204424:	86be                	mv	a3,a5
    80204426:	e1040613          	addi	a2,s0,-496
    8020442a:	4581                	li	a1,0
    8020442c:	8552                	mv	a0,s4
    8020442e:	00002097          	auipc	ra,0x2
    80204432:	d74080e7          	jalr	-652(ra) # 802061a2 <eread>
    80204436:	03800793          	li	a5,56
    8020443a:	f2f516e3          	bne	a0,a5,80204366 <exec+0x302>
    if(ph.type != ELF_PROG_LOAD)
    8020443e:	e1042783          	lw	a5,-496(s0)
    80204442:	4705                	li	a4,1
    80204444:	fce792e3          	bne	a5,a4,80204408 <exec+0x3a4>
    if(ph.memsz < ph.filesz)
    80204448:	e3843683          	ld	a3,-456(s0)
    8020444c:	e3043783          	ld	a5,-464(s0)
    80204450:	f8f6e5e3          	bltu	a3,a5,802043da <exec+0x376>
    if(ph.vaddr + ph.memsz < ph.vaddr)
    80204454:	e2043783          	ld	a5,-480(s0)
    80204458:	96be                	add	a3,a3,a5
    8020445a:	f8f6e3e3          	bltu	a3,a5,802043e0 <exec+0x37c>
    if((sz1 = uvmalloc(pagetable, kpagetable, sz, ph.vaddr + ph.memsz)) == 0)
    8020445e:	8626                	mv	a2,s1
    80204460:	85d6                	mv	a1,s5
    80204462:	e0843503          	ld	a0,-504(s0)
    80204466:	ffffd097          	auipc	ra,0xffffd
    8020446a:	d08080e7          	jalr	-760(ra) # 8020116e <uvmalloc>
    8020446e:	dea43c23          	sd	a0,-520(s0)
    80204472:	d935                	beqz	a0,802043e6 <exec+0x382>
    if(ph.vaddr % PGSIZE != 0)
    80204474:	e2043c83          	ld	s9,-480(s0)
    80204478:	de043783          	ld	a5,-544(s0)
    8020447c:	00fcf7b3          	and	a5,s9,a5
    80204480:	ee0795e3          	bnez	a5,8020436a <exec+0x306>
    if(loadseg(pagetable, ph.vaddr, ep, ph.off, ph.filesz) < 0)
    80204484:	e1842d03          	lw	s10,-488(s0)
    80204488:	e3042c03          	lw	s8,-464(s0)
  for(i = 0; i < sz; i += PGSIZE){
    8020448c:	f60c0ce3          	beqz	s8,80204404 <exec+0x3a0>
    80204490:	8962                	mv	s2,s8
    80204492:	4481                	li	s1,0
    80204494:	b9ed                	j	8020418e <exec+0x12a>

0000000080204496 <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
    80204496:	7179                	addi	sp,sp,-48
    80204498:	f406                	sd	ra,40(sp)
    8020449a:	f022                	sd	s0,32(sp)
    8020449c:	ec26                	sd	s1,24(sp)
    8020449e:	e84a                	sd	s2,16(sp)
    802044a0:	1800                	addi	s0,sp,48
    802044a2:	892e                	mv	s2,a1
    802044a4:	84b2                	mv	s1,a2
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    802044a6:	fdc40593          	addi	a1,s0,-36
    802044aa:	fffff097          	auipc	ra,0xfffff
    802044ae:	a8c080e7          	jalr	-1396(ra) # 80202f36 <argint>
    802044b2:	04054063          	bltz	a0,802044f2 <argfd+0x5c>
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == NULL)
    802044b6:	fdc42703          	lw	a4,-36(s0)
    802044ba:	47bd                	li	a5,15
    802044bc:	02e7ed63          	bltu	a5,a4,802044f6 <argfd+0x60>
    802044c0:	ffffd097          	auipc	ra,0xffffd
    802044c4:	6fe080e7          	jalr	1790(ra) # 80201bbe <myproc>
    802044c8:	fdc42703          	lw	a4,-36(s0)
    802044cc:	01a70793          	addi	a5,a4,26
    802044d0:	078e                	slli	a5,a5,0x3
    802044d2:	953e                	add	a0,a0,a5
    802044d4:	651c                	ld	a5,8(a0)
    802044d6:	c395                	beqz	a5,802044fa <argfd+0x64>
    return -1;
  if(pfd)
    802044d8:	00090463          	beqz	s2,802044e0 <argfd+0x4a>
    *pfd = fd;
    802044dc:	00e92023          	sw	a4,0(s2)
  if(pf)
    *pf = f;
  return 0;
    802044e0:	4501                	li	a0,0
  if(pf)
    802044e2:	c091                	beqz	s1,802044e6 <argfd+0x50>
    *pf = f;
    802044e4:	e09c                	sd	a5,0(s1)
}
    802044e6:	70a2                	ld	ra,40(sp)
    802044e8:	7402                	ld	s0,32(sp)
    802044ea:	64e2                	ld	s1,24(sp)
    802044ec:	6942                	ld	s2,16(sp)
    802044ee:	6145                	addi	sp,sp,48
    802044f0:	8082                	ret
    return -1;
    802044f2:	557d                	li	a0,-1
    802044f4:	bfcd                	j	802044e6 <argfd+0x50>
    return -1;
    802044f6:	557d                	li	a0,-1
    802044f8:	b7fd                	j	802044e6 <argfd+0x50>
    802044fa:	557d                	li	a0,-1
    802044fc:	b7ed                	j	802044e6 <argfd+0x50>

00000000802044fe <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
    802044fe:	1101                	addi	sp,sp,-32
    80204500:	ec06                	sd	ra,24(sp)
    80204502:	e822                	sd	s0,16(sp)
    80204504:	e426                	sd	s1,8(sp)
    80204506:	1000                	addi	s0,sp,32
    80204508:	84aa                	mv	s1,a0
  int fd;
  struct proc *p = myproc();
    8020450a:	ffffd097          	auipc	ra,0xffffd
    8020450e:	6b4080e7          	jalr	1716(ra) # 80201bbe <myproc>
    80204512:	862a                	mv	a2,a0

  for(fd = 0; fd < NOFILE; fd++){
    80204514:	0d850793          	addi	a5,a0,216
    80204518:	4501                	li	a0,0
    8020451a:	46c1                	li	a3,16
    if(p->ofile[fd] == 0){
    8020451c:	6398                	ld	a4,0(a5)
    8020451e:	cb19                	beqz	a4,80204534 <fdalloc+0x36>
  for(fd = 0; fd < NOFILE; fd++){
    80204520:	2505                	addiw	a0,a0,1
    80204522:	07a1                	addi	a5,a5,8
    80204524:	fed51ce3          	bne	a0,a3,8020451c <fdalloc+0x1e>
      p->ofile[fd] = f;
      return fd;
    }
  }
  return -1;
    80204528:	557d                	li	a0,-1
}
    8020452a:	60e2                	ld	ra,24(sp)
    8020452c:	6442                	ld	s0,16(sp)
    8020452e:	64a2                	ld	s1,8(sp)
    80204530:	6105                	addi	sp,sp,32
    80204532:	8082                	ret
      p->ofile[fd] = f;
    80204534:	01a50793          	addi	a5,a0,26
    80204538:	078e                	slli	a5,a5,0x3
    8020453a:	963e                	add	a2,a2,a5
    8020453c:	e604                	sd	s1,8(a2)
      return fd;
    8020453e:	b7f5                	j	8020452a <fdalloc+0x2c>

0000000080204540 <create>:
  return filestat(f, st);
}

static struct dirent*
create(char *path, short type, int mode)
{
    80204540:	7169                	addi	sp,sp,-304
    80204542:	f606                	sd	ra,296(sp)
    80204544:	f222                	sd	s0,288(sp)
    80204546:	ee26                	sd	s1,280(sp)
    80204548:	ea4a                	sd	s2,272(sp)
    8020454a:	e64e                	sd	s3,264(sp)
    8020454c:	1a00                	addi	s0,sp,304
    8020454e:	89ae                	mv	s3,a1
  struct dirent *ep, *dp;
  char name[FAT32_MAX_FILENAME + 1];

  if((dp = enameparent(path, name)) == NULL)
    80204550:	ed040593          	addi	a1,s0,-304
    80204554:	00003097          	auipc	ra,0x3
    80204558:	cd6080e7          	jalr	-810(ra) # 8020722a <enameparent>
    8020455c:	84aa                	mv	s1,a0
    8020455e:	cd3d                	beqz	a0,802045dc <create+0x9c>
    return NULL;

  if (type == T_DIR) {
    80204560:	0009879b          	sext.w	a5,s3
    80204564:	4705                	li	a4,1
    80204566:	06e78d63          	beq	a5,a4,802045e0 <create+0xa0>
    mode = ATTR_READ_ONLY;
  } else {
    mode = 0;  
  }

  elock(dp);
    8020456a:	00002097          	auipc	ra,0x2
    8020456e:	502080e7          	jalr	1282(ra) # 80206a6c <elock>
  if ((ep = ealloc(dp, name, mode)) == NULL) {
    80204572:	4601                	li	a2,0
    80204574:	ed040593          	addi	a1,s0,-304
    80204578:	8526                	mv	a0,s1
    8020457a:	00003097          	auipc	ra,0x3
    8020457e:	9da080e7          	jalr	-1574(ra) # 80206f54 <ealloc>
    80204582:	892a                	mv	s2,a0
    80204584:	c121                	beqz	a0,802045c4 <create+0x84>
    eunlock(dp);
    eput(dp);
    return NULL;
  }
  
  if ((type == T_DIR && !(ep->attribute & ATTR_DIRECTORY)) ||
    80204586:	2981                	sext.w	s3,s3
    80204588:	4789                	li	a5,2
    8020458a:	00f99663          	bne	s3,a5,80204596 <create+0x56>
      (type == T_FILE && (ep->attribute & ATTR_DIRECTORY))) {
    8020458e:	10094783          	lbu	a5,256(s2)
    80204592:	8bc1                	andi	a5,a5,16
    80204594:	eba5                	bnez	a5,80204604 <create+0xc4>
    eput(ep);
    eput(dp);
    return NULL;
  }

  eunlock(dp);
    80204596:	8526                	mv	a0,s1
    80204598:	00002097          	auipc	ra,0x2
    8020459c:	50a080e7          	jalr	1290(ra) # 80206aa2 <eunlock>
  eput(dp);
    802045a0:	8526                	mv	a0,s1
    802045a2:	00002097          	auipc	ra,0x2
    802045a6:	54e080e7          	jalr	1358(ra) # 80206af0 <eput>

  elock(ep);
    802045aa:	854a                	mv	a0,s2
    802045ac:	00002097          	auipc	ra,0x2
    802045b0:	4c0080e7          	jalr	1216(ra) # 80206a6c <elock>
  return ep;
}
    802045b4:	854a                	mv	a0,s2
    802045b6:	70b2                	ld	ra,296(sp)
    802045b8:	7412                	ld	s0,288(sp)
    802045ba:	64f2                	ld	s1,280(sp)
    802045bc:	6952                	ld	s2,272(sp)
    802045be:	69b2                	ld	s3,264(sp)
    802045c0:	6155                	addi	sp,sp,304
    802045c2:	8082                	ret
    eunlock(dp);
    802045c4:	8526                	mv	a0,s1
    802045c6:	00002097          	auipc	ra,0x2
    802045ca:	4dc080e7          	jalr	1244(ra) # 80206aa2 <eunlock>
    eput(dp);
    802045ce:	8526                	mv	a0,s1
    802045d0:	00002097          	auipc	ra,0x2
    802045d4:	520080e7          	jalr	1312(ra) # 80206af0 <eput>
    return NULL;
    802045d8:	4901                	li	s2,0
    802045da:	bfe9                	j	802045b4 <create+0x74>
    return NULL;
    802045dc:	892a                	mv	s2,a0
    802045de:	bfd9                	j	802045b4 <create+0x74>
  elock(dp);
    802045e0:	00002097          	auipc	ra,0x2
    802045e4:	48c080e7          	jalr	1164(ra) # 80206a6c <elock>
  if ((ep = ealloc(dp, name, mode)) == NULL) {
    802045e8:	4641                	li	a2,16
    802045ea:	ed040593          	addi	a1,s0,-304
    802045ee:	8526                	mv	a0,s1
    802045f0:	00003097          	auipc	ra,0x3
    802045f4:	964080e7          	jalr	-1692(ra) # 80206f54 <ealloc>
    802045f8:	892a                	mv	s2,a0
    802045fa:	d569                	beqz	a0,802045c4 <create+0x84>
  if ((type == T_DIR && !(ep->attribute & ATTR_DIRECTORY)) ||
    802045fc:	10094783          	lbu	a5,256(s2)
    80204600:	8bc1                	andi	a5,a5,16
    80204602:	fbd1                	bnez	a5,80204596 <create+0x56>
    eunlock(dp);
    80204604:	8526                	mv	a0,s1
    80204606:	00002097          	auipc	ra,0x2
    8020460a:	49c080e7          	jalr	1180(ra) # 80206aa2 <eunlock>
    eput(ep);
    8020460e:	854a                	mv	a0,s2
    80204610:	00002097          	auipc	ra,0x2
    80204614:	4e0080e7          	jalr	1248(ra) # 80206af0 <eput>
    eput(dp);
    80204618:	8526                	mv	a0,s1
    8020461a:	00002097          	auipc	ra,0x2
    8020461e:	4d6080e7          	jalr	1238(ra) # 80206af0 <eput>
    return NULL;
    80204622:	4901                	li	s2,0
    80204624:	bf41                	j	802045b4 <create+0x74>

0000000080204626 <sys_dup>:
{
    80204626:	7179                	addi	sp,sp,-48
    80204628:	f406                	sd	ra,40(sp)
    8020462a:	f022                	sd	s0,32(sp)
    8020462c:	ec26                	sd	s1,24(sp)
    8020462e:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0)
    80204630:	fd840613          	addi	a2,s0,-40
    80204634:	4581                	li	a1,0
    80204636:	4501                	li	a0,0
    80204638:	00000097          	auipc	ra,0x0
    8020463c:	e5e080e7          	jalr	-418(ra) # 80204496 <argfd>
    return -1;
    80204640:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0)
    80204642:	02054363          	bltz	a0,80204668 <sys_dup+0x42>
  if((fd=fdalloc(f)) < 0)
    80204646:	fd843503          	ld	a0,-40(s0)
    8020464a:	00000097          	auipc	ra,0x0
    8020464e:	eb4080e7          	jalr	-332(ra) # 802044fe <fdalloc>
    80204652:	84aa                	mv	s1,a0
    return -1;
    80204654:	57fd                	li	a5,-1
  if((fd=fdalloc(f)) < 0)
    80204656:	00054963          	bltz	a0,80204668 <sys_dup+0x42>
  filedup(f);
    8020465a:	fd843503          	ld	a0,-40(s0)
    8020465e:	fffff097          	auipc	ra,0xfffff
    80204662:	2fe080e7          	jalr	766(ra) # 8020395c <filedup>
  return fd;
    80204666:	87a6                	mv	a5,s1
}
    80204668:	853e                	mv	a0,a5
    8020466a:	70a2                	ld	ra,40(sp)
    8020466c:	7402                	ld	s0,32(sp)
    8020466e:	64e2                	ld	s1,24(sp)
    80204670:	6145                	addi	sp,sp,48
    80204672:	8082                	ret

0000000080204674 <sys_read>:
{
    80204674:	7179                	addi	sp,sp,-48
    80204676:	f406                	sd	ra,40(sp)
    80204678:	f022                	sd	s0,32(sp)
    8020467a:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    8020467c:	fe840613          	addi	a2,s0,-24
    80204680:	4581                	li	a1,0
    80204682:	4501                	li	a0,0
    80204684:	00000097          	auipc	ra,0x0
    80204688:	e12080e7          	jalr	-494(ra) # 80204496 <argfd>
    return -1;
    8020468c:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    8020468e:	04054163          	bltz	a0,802046d0 <sys_read+0x5c>
    80204692:	fe440593          	addi	a1,s0,-28
    80204696:	4509                	li	a0,2
    80204698:	fffff097          	auipc	ra,0xfffff
    8020469c:	89e080e7          	jalr	-1890(ra) # 80202f36 <argint>
    return -1;
    802046a0:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    802046a2:	02054763          	bltz	a0,802046d0 <sys_read+0x5c>
    802046a6:	fd840593          	addi	a1,s0,-40
    802046aa:	4505                	li	a0,1
    802046ac:	fffff097          	auipc	ra,0xfffff
    802046b0:	8ec080e7          	jalr	-1812(ra) # 80202f98 <argaddr>
    return -1;
    802046b4:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    802046b6:	00054d63          	bltz	a0,802046d0 <sys_read+0x5c>
  return fileread(f, p, n);
    802046ba:	fe442603          	lw	a2,-28(s0)
    802046be:	fd843583          	ld	a1,-40(s0)
    802046c2:	fe843503          	ld	a0,-24(s0)
    802046c6:	fffff097          	auipc	ra,0xfffff
    802046ca:	3fe080e7          	jalr	1022(ra) # 80203ac4 <fileread>
    802046ce:	87aa                	mv	a5,a0
}
    802046d0:	853e                	mv	a0,a5
    802046d2:	70a2                	ld	ra,40(sp)
    802046d4:	7402                	ld	s0,32(sp)
    802046d6:	6145                	addi	sp,sp,48
    802046d8:	8082                	ret

00000000802046da <sys_write>:
{
    802046da:	7179                	addi	sp,sp,-48
    802046dc:	f406                	sd	ra,40(sp)
    802046de:	f022                	sd	s0,32(sp)
    802046e0:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    802046e2:	fe840613          	addi	a2,s0,-24
    802046e6:	4581                	li	a1,0
    802046e8:	4501                	li	a0,0
    802046ea:	00000097          	auipc	ra,0x0
    802046ee:	dac080e7          	jalr	-596(ra) # 80204496 <argfd>
    return -1;
    802046f2:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    802046f4:	04054163          	bltz	a0,80204736 <sys_write+0x5c>
    802046f8:	fe440593          	addi	a1,s0,-28
    802046fc:	4509                	li	a0,2
    802046fe:	fffff097          	auipc	ra,0xfffff
    80204702:	838080e7          	jalr	-1992(ra) # 80202f36 <argint>
    return -1;
    80204706:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204708:	02054763          	bltz	a0,80204736 <sys_write+0x5c>
    8020470c:	fd840593          	addi	a1,s0,-40
    80204710:	4505                	li	a0,1
    80204712:	fffff097          	auipc	ra,0xfffff
    80204716:	886080e7          	jalr	-1914(ra) # 80202f98 <argaddr>
    return -1;
    8020471a:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    8020471c:	00054d63          	bltz	a0,80204736 <sys_write+0x5c>
  return filewrite(f, p, n);
    80204720:	fe442603          	lw	a2,-28(s0)
    80204724:	fd843583          	ld	a1,-40(s0)
    80204728:	fe843503          	ld	a0,-24(s0)
    8020472c:	fffff097          	auipc	ra,0xfffff
    80204730:	45a080e7          	jalr	1114(ra) # 80203b86 <filewrite>
    80204734:	87aa                	mv	a5,a0
}
    80204736:	853e                	mv	a0,a5
    80204738:	70a2                	ld	ra,40(sp)
    8020473a:	7402                	ld	s0,32(sp)
    8020473c:	6145                	addi	sp,sp,48
    8020473e:	8082                	ret

0000000080204740 <sys_close>:
{
    80204740:	1101                	addi	sp,sp,-32
    80204742:	ec06                	sd	ra,24(sp)
    80204744:	e822                	sd	s0,16(sp)
    80204746:	1000                	addi	s0,sp,32
  if(argfd(0, &fd, &f) < 0)
    80204748:	fe040613          	addi	a2,s0,-32
    8020474c:	fec40593          	addi	a1,s0,-20
    80204750:	4501                	li	a0,0
    80204752:	00000097          	auipc	ra,0x0
    80204756:	d44080e7          	jalr	-700(ra) # 80204496 <argfd>
    return -1;
    8020475a:	57fd                	li	a5,-1
  if(argfd(0, &fd, &f) < 0)
    8020475c:	02054463          	bltz	a0,80204784 <sys_close+0x44>
  myproc()->ofile[fd] = 0;
    80204760:	ffffd097          	auipc	ra,0xffffd
    80204764:	45e080e7          	jalr	1118(ra) # 80201bbe <myproc>
    80204768:	fec42783          	lw	a5,-20(s0)
    8020476c:	07e9                	addi	a5,a5,26
    8020476e:	078e                	slli	a5,a5,0x3
    80204770:	97aa                	add	a5,a5,a0
    80204772:	0007b423          	sd	zero,8(a5)
  fileclose(f);
    80204776:	fe043503          	ld	a0,-32(s0)
    8020477a:	fffff097          	auipc	ra,0xfffff
    8020477e:	234080e7          	jalr	564(ra) # 802039ae <fileclose>
  return 0;
    80204782:	4781                	li	a5,0
}
    80204784:	853e                	mv	a0,a5
    80204786:	60e2                	ld	ra,24(sp)
    80204788:	6442                	ld	s0,16(sp)
    8020478a:	6105                	addi	sp,sp,32
    8020478c:	8082                	ret

000000008020478e <sys_fstat>:
{
    8020478e:	1101                	addi	sp,sp,-32
    80204790:	ec06                	sd	ra,24(sp)
    80204792:	e822                	sd	s0,16(sp)
    80204794:	1000                	addi	s0,sp,32
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204796:	fe840613          	addi	a2,s0,-24
    8020479a:	4581                	li	a1,0
    8020479c:	4501                	li	a0,0
    8020479e:	00000097          	auipc	ra,0x0
    802047a2:	cf8080e7          	jalr	-776(ra) # 80204496 <argfd>
    return -1;
    802047a6:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    802047a8:	02054563          	bltz	a0,802047d2 <sys_fstat+0x44>
    802047ac:	fe040593          	addi	a1,s0,-32
    802047b0:	4505                	li	a0,1
    802047b2:	ffffe097          	auipc	ra,0xffffe
    802047b6:	7e6080e7          	jalr	2022(ra) # 80202f98 <argaddr>
    return -1;
    802047ba:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    802047bc:	00054b63          	bltz	a0,802047d2 <sys_fstat+0x44>
  return filestat(f, st);
    802047c0:	fe043583          	ld	a1,-32(s0)
    802047c4:	fe843503          	ld	a0,-24(s0)
    802047c8:	fffff097          	auipc	ra,0xfffff
    802047cc:	29c080e7          	jalr	668(ra) # 80203a64 <filestat>
    802047d0:	87aa                	mv	a5,a0
}
    802047d2:	853e                	mv	a0,a5
    802047d4:	60e2                	ld	ra,24(sp)
    802047d6:	6442                	ld	s0,16(sp)
    802047d8:	6105                	addi	sp,sp,32
    802047da:	8082                	ret

00000000802047dc <sys_open>:

uint64
sys_open(void)
{
    802047dc:	7129                	addi	sp,sp,-320
    802047de:	fe06                	sd	ra,312(sp)
    802047e0:	fa22                	sd	s0,304(sp)
    802047e2:	f626                	sd	s1,296(sp)
    802047e4:	f24a                	sd	s2,288(sp)
    802047e6:	ee4e                	sd	s3,280(sp)
    802047e8:	0280                	addi	s0,sp,320
  char path[FAT32_MAX_PATH];
  int fd, omode;
  struct file *f;
  struct dirent *ep;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argint(1, &omode) < 0)
    802047ea:	10400613          	li	a2,260
    802047ee:	ec840593          	addi	a1,s0,-312
    802047f2:	4501                	li	a0,0
    802047f4:	ffffe097          	auipc	ra,0xffffe
    802047f8:	7c6080e7          	jalr	1990(ra) # 80202fba <argstr>
    802047fc:	87aa                	mv	a5,a0
    return -1;
    802047fe:	557d                	li	a0,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argint(1, &omode) < 0)
    80204800:	0807ce63          	bltz	a5,8020489c <sys_open+0xc0>
    80204804:	ec440593          	addi	a1,s0,-316
    80204808:	4505                	li	a0,1
    8020480a:	ffffe097          	auipc	ra,0xffffe
    8020480e:	72c080e7          	jalr	1836(ra) # 80202f36 <argint>
    80204812:	0e054163          	bltz	a0,802048f4 <sys_open+0x118>

  if(omode & O_CREATE){
    80204816:	ec442603          	lw	a2,-316(s0)
    8020481a:	20067793          	andi	a5,a2,512
    8020481e:	c7d1                	beqz	a5,802048aa <sys_open+0xce>
    ep = create(path, T_FILE, omode);
    80204820:	4589                	li	a1,2
    80204822:	ec840513          	addi	a0,s0,-312
    80204826:	00000097          	auipc	ra,0x0
    8020482a:	d1a080e7          	jalr	-742(ra) # 80204540 <create>
    8020482e:	892a                	mv	s2,a0
    if(ep == NULL){
    80204830:	c561                	beqz	a0,802048f8 <sys_open+0x11c>
      eput(ep);
      return -1;
    }
  }

  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    80204832:	fffff097          	auipc	ra,0xfffff
    80204836:	0c0080e7          	jalr	192(ra) # 802038f2 <filealloc>
    8020483a:	89aa                	mv	s3,a0
    8020483c:	c579                	beqz	a0,8020490a <sys_open+0x12e>
    8020483e:	00000097          	auipc	ra,0x0
    80204842:	cc0080e7          	jalr	-832(ra) # 802044fe <fdalloc>
    80204846:	84aa                	mv	s1,a0
    80204848:	0a054c63          	bltz	a0,80204900 <sys_open+0x124>
    eunlock(ep);
    eput(ep);
    return -1;
  }

  if(!(ep->attribute & ATTR_DIRECTORY) && (omode & O_TRUNC)){
    8020484c:	10094783          	lbu	a5,256(s2)
    80204850:	8bc1                	andi	a5,a5,16
    80204852:	e791                	bnez	a5,8020485e <sys_open+0x82>
    80204854:	ec442783          	lw	a5,-316(s0)
    80204858:	4007f793          	andi	a5,a5,1024
    8020485c:	e7d1                	bnez	a5,802048e8 <sys_open+0x10c>
    etrunc(ep);
  }

  f->type = FD_ENTRY;
    8020485e:	4789                	li	a5,2
    80204860:	00f9a023          	sw	a5,0(s3)
  f->off = (omode & O_APPEND) ? ep->file_size : 0;
    80204864:	ec442783          	lw	a5,-316(s0)
    80204868:	0047f693          	andi	a3,a5,4
    8020486c:	4701                	li	a4,0
    8020486e:	c299                	beqz	a3,80204874 <sys_open+0x98>
    80204870:	10892703          	lw	a4,264(s2)
    80204874:	02e9a023          	sw	a4,32(s3)
  f->ep = ep;
    80204878:	0129bc23          	sd	s2,24(s3)
  f->readable = !(omode & O_WRONLY);
    8020487c:	0017c713          	xori	a4,a5,1
    80204880:	8b05                	andi	a4,a4,1
    80204882:	00e98423          	sb	a4,8(s3)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80204886:	8b8d                	andi	a5,a5,3
    80204888:	00f037b3          	snez	a5,a5
    8020488c:	00f984a3          	sb	a5,9(s3)

  eunlock(ep);
    80204890:	854a                	mv	a0,s2
    80204892:	00002097          	auipc	ra,0x2
    80204896:	210080e7          	jalr	528(ra) # 80206aa2 <eunlock>

  return fd;
    8020489a:	8526                	mv	a0,s1
}
    8020489c:	70f2                	ld	ra,312(sp)
    8020489e:	7452                	ld	s0,304(sp)
    802048a0:	74b2                	ld	s1,296(sp)
    802048a2:	7912                	ld	s2,288(sp)
    802048a4:	69f2                	ld	s3,280(sp)
    802048a6:	6131                	addi	sp,sp,320
    802048a8:	8082                	ret
    if((ep = ename(path)) == NULL){
    802048aa:	ec840513          	addi	a0,s0,-312
    802048ae:	00003097          	auipc	ra,0x3
    802048b2:	95e080e7          	jalr	-1698(ra) # 8020720c <ename>
    802048b6:	892a                	mv	s2,a0
    802048b8:	c131                	beqz	a0,802048fc <sys_open+0x120>
    elock(ep);
    802048ba:	00002097          	auipc	ra,0x2
    802048be:	1b2080e7          	jalr	434(ra) # 80206a6c <elock>
    if((ep->attribute & ATTR_DIRECTORY) && omode != O_RDONLY){
    802048c2:	10094783          	lbu	a5,256(s2)
    802048c6:	8bc1                	andi	a5,a5,16
    802048c8:	d7ad                	beqz	a5,80204832 <sys_open+0x56>
    802048ca:	ec442783          	lw	a5,-316(s0)
    802048ce:	d3b5                	beqz	a5,80204832 <sys_open+0x56>
      eunlock(ep);
    802048d0:	854a                	mv	a0,s2
    802048d2:	00002097          	auipc	ra,0x2
    802048d6:	1d0080e7          	jalr	464(ra) # 80206aa2 <eunlock>
      eput(ep);
    802048da:	854a                	mv	a0,s2
    802048dc:	00002097          	auipc	ra,0x2
    802048e0:	214080e7          	jalr	532(ra) # 80206af0 <eput>
      return -1;
    802048e4:	557d                	li	a0,-1
    802048e6:	bf5d                	j	8020489c <sys_open+0xc0>
    etrunc(ep);
    802048e8:	854a                	mv	a0,s2
    802048ea:	00002097          	auipc	ra,0x2
    802048ee:	118080e7          	jalr	280(ra) # 80206a02 <etrunc>
    802048f2:	b7b5                	j	8020485e <sys_open+0x82>
    return -1;
    802048f4:	557d                	li	a0,-1
    802048f6:	b75d                	j	8020489c <sys_open+0xc0>
      return -1;
    802048f8:	557d                	li	a0,-1
    802048fa:	b74d                	j	8020489c <sys_open+0xc0>
      return -1;
    802048fc:	557d                	li	a0,-1
    802048fe:	bf79                	j	8020489c <sys_open+0xc0>
      fileclose(f);
    80204900:	854e                	mv	a0,s3
    80204902:	fffff097          	auipc	ra,0xfffff
    80204906:	0ac080e7          	jalr	172(ra) # 802039ae <fileclose>
    eunlock(ep);
    8020490a:	854a                	mv	a0,s2
    8020490c:	00002097          	auipc	ra,0x2
    80204910:	196080e7          	jalr	406(ra) # 80206aa2 <eunlock>
    eput(ep);
    80204914:	854a                	mv	a0,s2
    80204916:	00002097          	auipc	ra,0x2
    8020491a:	1da080e7          	jalr	474(ra) # 80206af0 <eput>
    return -1;
    8020491e:	557d                	li	a0,-1
    80204920:	bfb5                	j	8020489c <sys_open+0xc0>

0000000080204922 <sys_mkdir>:

uint64
sys_mkdir(void)
{
    80204922:	7169                	addi	sp,sp,-304
    80204924:	f606                	sd	ra,296(sp)
    80204926:	f222                	sd	s0,288(sp)
    80204928:	ee26                	sd	s1,280(sp)
    8020492a:	1a00                	addi	s0,sp,304
  char path[FAT32_MAX_PATH];
  struct dirent *ep;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = create(path, T_DIR, 0)) == 0){
    8020492c:	10400613          	li	a2,260
    80204930:	ed840593          	addi	a1,s0,-296
    80204934:	4501                	li	a0,0
    80204936:	ffffe097          	auipc	ra,0xffffe
    8020493a:	684080e7          	jalr	1668(ra) # 80202fba <argstr>
    return -1;
    8020493e:	57fd                	li	a5,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = create(path, T_DIR, 0)) == 0){
    80204940:	02054663          	bltz	a0,8020496c <sys_mkdir+0x4a>
    80204944:	4601                	li	a2,0
    80204946:	4585                	li	a1,1
    80204948:	ed840513          	addi	a0,s0,-296
    8020494c:	00000097          	auipc	ra,0x0
    80204950:	bf4080e7          	jalr	-1036(ra) # 80204540 <create>
    80204954:	84aa                	mv	s1,a0
    80204956:	c10d                	beqz	a0,80204978 <sys_mkdir+0x56>
  }
  eunlock(ep);
    80204958:	00002097          	auipc	ra,0x2
    8020495c:	14a080e7          	jalr	330(ra) # 80206aa2 <eunlock>
  eput(ep);
    80204960:	8526                	mv	a0,s1
    80204962:	00002097          	auipc	ra,0x2
    80204966:	18e080e7          	jalr	398(ra) # 80206af0 <eput>
  return 0;
    8020496a:	4781                	li	a5,0
}
    8020496c:	853e                	mv	a0,a5
    8020496e:	70b2                	ld	ra,296(sp)
    80204970:	7412                	ld	s0,288(sp)
    80204972:	64f2                	ld	s1,280(sp)
    80204974:	6155                	addi	sp,sp,304
    80204976:	8082                	ret
    return -1;
    80204978:	57fd                	li	a5,-1
    8020497a:	bfcd                	j	8020496c <sys_mkdir+0x4a>

000000008020497c <sys_chdir>:

uint64
sys_chdir(void)
{
    8020497c:	7169                	addi	sp,sp,-304
    8020497e:	f606                	sd	ra,296(sp)
    80204980:	f222                	sd	s0,288(sp)
    80204982:	ee26                	sd	s1,280(sp)
    80204984:	ea4a                	sd	s2,272(sp)
    80204986:	1a00                	addi	s0,sp,304
  char path[FAT32_MAX_PATH];
  struct dirent *ep;
  struct proc *p = myproc();
    80204988:	ffffd097          	auipc	ra,0xffffd
    8020498c:	236080e7          	jalr	566(ra) # 80201bbe <myproc>
    80204990:	892a                	mv	s2,a0
  
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = ename(path)) == NULL){
    80204992:	10400613          	li	a2,260
    80204996:	ed840593          	addi	a1,s0,-296
    8020499a:	4501                	li	a0,0
    8020499c:	ffffe097          	auipc	ra,0xffffe
    802049a0:	61e080e7          	jalr	1566(ra) # 80202fba <argstr>
    return -1;
    802049a4:	57fd                	li	a5,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = ename(path)) == NULL){
    802049a6:	04054063          	bltz	a0,802049e6 <sys_chdir+0x6a>
    802049aa:	ed840513          	addi	a0,s0,-296
    802049ae:	00003097          	auipc	ra,0x3
    802049b2:	85e080e7          	jalr	-1954(ra) # 8020720c <ename>
    802049b6:	84aa                	mv	s1,a0
    802049b8:	c931                	beqz	a0,80204a0c <sys_chdir+0x90>
  }
  elock(ep);
    802049ba:	00002097          	auipc	ra,0x2
    802049be:	0b2080e7          	jalr	178(ra) # 80206a6c <elock>
  if(!(ep->attribute & ATTR_DIRECTORY)){
    802049c2:	1004c783          	lbu	a5,256(s1)
    802049c6:	8bc1                	andi	a5,a5,16
    802049c8:	c795                	beqz	a5,802049f4 <sys_chdir+0x78>
    eunlock(ep);
    eput(ep);
    return -1;
  }
  eunlock(ep);
    802049ca:	8526                	mv	a0,s1
    802049cc:	00002097          	auipc	ra,0x2
    802049d0:	0d6080e7          	jalr	214(ra) # 80206aa2 <eunlock>
  eput(p->cwd);
    802049d4:	15893503          	ld	a0,344(s2)
    802049d8:	00002097          	auipc	ra,0x2
    802049dc:	118080e7          	jalr	280(ra) # 80206af0 <eput>
  p->cwd = ep;
    802049e0:	14993c23          	sd	s1,344(s2)
  return 0;
    802049e4:	4781                	li	a5,0
}
    802049e6:	853e                	mv	a0,a5
    802049e8:	70b2                	ld	ra,296(sp)
    802049ea:	7412                	ld	s0,288(sp)
    802049ec:	64f2                	ld	s1,280(sp)
    802049ee:	6952                	ld	s2,272(sp)
    802049f0:	6155                	addi	sp,sp,304
    802049f2:	8082                	ret
    eunlock(ep);
    802049f4:	8526                	mv	a0,s1
    802049f6:	00002097          	auipc	ra,0x2
    802049fa:	0ac080e7          	jalr	172(ra) # 80206aa2 <eunlock>
    eput(ep);
    802049fe:	8526                	mv	a0,s1
    80204a00:	00002097          	auipc	ra,0x2
    80204a04:	0f0080e7          	jalr	240(ra) # 80206af0 <eput>
    return -1;
    80204a08:	57fd                	li	a5,-1
    80204a0a:	bff1                	j	802049e6 <sys_chdir+0x6a>
    return -1;
    80204a0c:	57fd                	li	a5,-1
    80204a0e:	bfe1                	j	802049e6 <sys_chdir+0x6a>

0000000080204a10 <sys_pipe>:

uint64
sys_pipe(void)
{
    80204a10:	7139                	addi	sp,sp,-64
    80204a12:	fc06                	sd	ra,56(sp)
    80204a14:	f822                	sd	s0,48(sp)
    80204a16:	f426                	sd	s1,40(sp)
    80204a18:	0080                	addi	s0,sp,64
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();
    80204a1a:	ffffd097          	auipc	ra,0xffffd
    80204a1e:	1a4080e7          	jalr	420(ra) # 80201bbe <myproc>
    80204a22:	84aa                	mv	s1,a0

  if(argaddr(0, &fdarray) < 0)
    80204a24:	fd840593          	addi	a1,s0,-40
    80204a28:	4501                	li	a0,0
    80204a2a:	ffffe097          	auipc	ra,0xffffe
    80204a2e:	56e080e7          	jalr	1390(ra) # 80202f98 <argaddr>
    return -1;
    80204a32:	57fd                	li	a5,-1
  if(argaddr(0, &fdarray) < 0)
    80204a34:	0c054e63          	bltz	a0,80204b10 <sys_pipe+0x100>
  if(pipealloc(&rf, &wf) < 0)
    80204a38:	fc840593          	addi	a1,s0,-56
    80204a3c:	fd040513          	addi	a0,s0,-48
    80204a40:	fffff097          	auipc	ra,0xfffff
    80204a44:	2d2080e7          	jalr	722(ra) # 80203d12 <pipealloc>
    return -1;
    80204a48:	57fd                	li	a5,-1
  if(pipealloc(&rf, &wf) < 0)
    80204a4a:	0c054363          	bltz	a0,80204b10 <sys_pipe+0x100>
  fd0 = -1;
    80204a4e:	fcf42223          	sw	a5,-60(s0)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    80204a52:	fd043503          	ld	a0,-48(s0)
    80204a56:	00000097          	auipc	ra,0x0
    80204a5a:	aa8080e7          	jalr	-1368(ra) # 802044fe <fdalloc>
    80204a5e:	fca42223          	sw	a0,-60(s0)
    80204a62:	08054a63          	bltz	a0,80204af6 <sys_pipe+0xe6>
    80204a66:	fc843503          	ld	a0,-56(s0)
    80204a6a:	00000097          	auipc	ra,0x0
    80204a6e:	a94080e7          	jalr	-1388(ra) # 802044fe <fdalloc>
    80204a72:	fca42023          	sw	a0,-64(s0)
    80204a76:	06054663          	bltz	a0,80204ae2 <sys_pipe+0xd2>
    fileclose(wf);
    return -1;
  }
  // if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
  //    copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
  if(copyout2(fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80204a7a:	4611                	li	a2,4
    80204a7c:	fc440593          	addi	a1,s0,-60
    80204a80:	fd843503          	ld	a0,-40(s0)
    80204a84:	ffffd097          	auipc	ra,0xffffd
    80204a88:	a4e080e7          	jalr	-1458(ra) # 802014d2 <copyout2>
    80204a8c:	00054f63          	bltz	a0,80204aaa <sys_pipe+0x9a>
     copyout2(fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    80204a90:	4611                	li	a2,4
    80204a92:	fc040593          	addi	a1,s0,-64
    80204a96:	fd843503          	ld	a0,-40(s0)
    80204a9a:	0511                	addi	a0,a0,4
    80204a9c:	ffffd097          	auipc	ra,0xffffd
    80204aa0:	a36080e7          	jalr	-1482(ra) # 802014d2 <copyout2>
    p->ofile[fd1] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  return 0;
    80204aa4:	4781                	li	a5,0
  if(copyout2(fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80204aa6:	06055563          	bgez	a0,80204b10 <sys_pipe+0x100>
    p->ofile[fd0] = 0;
    80204aaa:	fc442783          	lw	a5,-60(s0)
    80204aae:	07e9                	addi	a5,a5,26
    80204ab0:	078e                	slli	a5,a5,0x3
    80204ab2:	97a6                	add	a5,a5,s1
    80204ab4:	0007b423          	sd	zero,8(a5)
    p->ofile[fd1] = 0;
    80204ab8:	fc042503          	lw	a0,-64(s0)
    80204abc:	0569                	addi	a0,a0,26
    80204abe:	050e                	slli	a0,a0,0x3
    80204ac0:	9526                	add	a0,a0,s1
    80204ac2:	00053423          	sd	zero,8(a0)
    fileclose(rf);
    80204ac6:	fd043503          	ld	a0,-48(s0)
    80204aca:	fffff097          	auipc	ra,0xfffff
    80204ace:	ee4080e7          	jalr	-284(ra) # 802039ae <fileclose>
    fileclose(wf);
    80204ad2:	fc843503          	ld	a0,-56(s0)
    80204ad6:	fffff097          	auipc	ra,0xfffff
    80204ada:	ed8080e7          	jalr	-296(ra) # 802039ae <fileclose>
    return -1;
    80204ade:	57fd                	li	a5,-1
    80204ae0:	a805                	j	80204b10 <sys_pipe+0x100>
    if(fd0 >= 0)
    80204ae2:	fc442783          	lw	a5,-60(s0)
    80204ae6:	0007c863          	bltz	a5,80204af6 <sys_pipe+0xe6>
      p->ofile[fd0] = 0;
    80204aea:	01a78513          	addi	a0,a5,26
    80204aee:	050e                	slli	a0,a0,0x3
    80204af0:	9526                	add	a0,a0,s1
    80204af2:	00053423          	sd	zero,8(a0)
    fileclose(rf);
    80204af6:	fd043503          	ld	a0,-48(s0)
    80204afa:	fffff097          	auipc	ra,0xfffff
    80204afe:	eb4080e7          	jalr	-332(ra) # 802039ae <fileclose>
    fileclose(wf);
    80204b02:	fc843503          	ld	a0,-56(s0)
    80204b06:	fffff097          	auipc	ra,0xfffff
    80204b0a:	ea8080e7          	jalr	-344(ra) # 802039ae <fileclose>
    return -1;
    80204b0e:	57fd                	li	a5,-1
}
    80204b10:	853e                	mv	a0,a5
    80204b12:	70e2                	ld	ra,56(sp)
    80204b14:	7442                	ld	s0,48(sp)
    80204b16:	74a2                	ld	s1,40(sp)
    80204b18:	6121                	addi	sp,sp,64
    80204b1a:	8082                	ret

0000000080204b1c <sys_dev>:

// To open console device.
uint64
sys_dev(void)
{
    80204b1c:	7179                	addi	sp,sp,-48
    80204b1e:	f406                	sd	ra,40(sp)
    80204b20:	f022                	sd	s0,32(sp)
    80204b22:	ec26                	sd	s1,24(sp)
    80204b24:	1800                	addi	s0,sp,48
  int fd, omode;
  int major, minor;
  struct file *f;

  if(argint(0, &omode) < 0 || argint(1, &major) < 0 || argint(2, &minor) < 0){
    80204b26:	fdc40593          	addi	a1,s0,-36
    80204b2a:	4501                	li	a0,0
    80204b2c:	ffffe097          	auipc	ra,0xffffe
    80204b30:	40a080e7          	jalr	1034(ra) # 80202f36 <argint>
    80204b34:	08054a63          	bltz	a0,80204bc8 <sys_dev+0xac>
    80204b38:	fd840593          	addi	a1,s0,-40
    80204b3c:	4505                	li	a0,1
    80204b3e:	ffffe097          	auipc	ra,0xffffe
    80204b42:	3f8080e7          	jalr	1016(ra) # 80202f36 <argint>
    80204b46:	08054763          	bltz	a0,80204bd4 <sys_dev+0xb8>
    80204b4a:	fd440593          	addi	a1,s0,-44
    80204b4e:	4509                	li	a0,2
    80204b50:	ffffe097          	auipc	ra,0xffffe
    80204b54:	3e6080e7          	jalr	998(ra) # 80202f36 <argint>
    80204b58:	08054063          	bltz	a0,80204bd8 <sys_dev+0xbc>
    return -1;
  }

  if(omode & O_CREATE){
    80204b5c:	fdc42783          	lw	a5,-36(s0)
    80204b60:	2007f793          	andi	a5,a5,512
    80204b64:	ebb1                	bnez	a5,80204bb8 <sys_dev+0x9c>
    panic("dev file on FAT");
  }

  if(major < 0 || major >= NDEV)
    80204b66:	fd842703          	lw	a4,-40(s0)
    80204b6a:	47a5                	li	a5,9
    return -1;
    80204b6c:	557d                	li	a0,-1
  if(major < 0 || major >= NDEV)
    80204b6e:	04e7ee63          	bltu	a5,a4,80204bca <sys_dev+0xae>

  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    80204b72:	fffff097          	auipc	ra,0xfffff
    80204b76:	d80080e7          	jalr	-640(ra) # 802038f2 <filealloc>
    80204b7a:	84aa                	mv	s1,a0
    80204b7c:	c125                	beqz	a0,80204bdc <sys_dev+0xc0>
    80204b7e:	00000097          	auipc	ra,0x0
    80204b82:	980080e7          	jalr	-1664(ra) # 802044fe <fdalloc>
    80204b86:	04054d63          	bltz	a0,80204be0 <sys_dev+0xc4>
    if(f)
      fileclose(f);
    return -1;
  }

  f->type = FD_DEVICE;
    80204b8a:	478d                	li	a5,3
    80204b8c:	c09c                	sw	a5,0(s1)
  f->off = 0;
    80204b8e:	0204a023          	sw	zero,32(s1)
  f->ep = 0;
    80204b92:	0004bc23          	sd	zero,24(s1)
  f->major = major;
    80204b96:	fd842783          	lw	a5,-40(s0)
    80204b9a:	02f49223          	sh	a5,36(s1)
  f->readable = !(omode & O_WRONLY);
    80204b9e:	fdc42783          	lw	a5,-36(s0)
    80204ba2:	0017c713          	xori	a4,a5,1
    80204ba6:	8b05                	andi	a4,a4,1
    80204ba8:	00e48423          	sb	a4,8(s1)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80204bac:	8b8d                	andi	a5,a5,3
    80204bae:	00f037b3          	snez	a5,a5
    80204bb2:	00f484a3          	sb	a5,9(s1)

  return fd;
    80204bb6:	a811                	j	80204bca <sys_dev+0xae>
    panic("dev file on FAT");
    80204bb8:	00005517          	auipc	a0,0x5
    80204bbc:	28850513          	addi	a0,a0,648 # 80209e40 <sysnames+0x1e0>
    80204bc0:	ffffb097          	auipc	ra,0xffffb
    80204bc4:	584080e7          	jalr	1412(ra) # 80200144 <panic>
    return -1;
    80204bc8:	557d                	li	a0,-1
}
    80204bca:	70a2                	ld	ra,40(sp)
    80204bcc:	7402                	ld	s0,32(sp)
    80204bce:	64e2                	ld	s1,24(sp)
    80204bd0:	6145                	addi	sp,sp,48
    80204bd2:	8082                	ret
    return -1;
    80204bd4:	557d                	li	a0,-1
    80204bd6:	bfd5                	j	80204bca <sys_dev+0xae>
    80204bd8:	557d                	li	a0,-1
    80204bda:	bfc5                	j	80204bca <sys_dev+0xae>
    return -1;
    80204bdc:	557d                	li	a0,-1
    80204bde:	b7f5                	j	80204bca <sys_dev+0xae>
      fileclose(f);
    80204be0:	8526                	mv	a0,s1
    80204be2:	fffff097          	auipc	ra,0xfffff
    80204be6:	dcc080e7          	jalr	-564(ra) # 802039ae <fileclose>
    return -1;
    80204bea:	557d                	li	a0,-1
    80204bec:	bff9                	j	80204bca <sys_dev+0xae>

0000000080204bee <sys_readdir>:

// To support ls command
uint64
sys_readdir(void)
{
    80204bee:	1101                	addi	sp,sp,-32
    80204bf0:	ec06                	sd	ra,24(sp)
    80204bf2:	e822                	sd	s0,16(sp)
    80204bf4:	1000                	addi	s0,sp,32
  struct file *f;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    80204bf6:	fe840613          	addi	a2,s0,-24
    80204bfa:	4581                	li	a1,0
    80204bfc:	4501                	li	a0,0
    80204bfe:	00000097          	auipc	ra,0x0
    80204c02:	898080e7          	jalr	-1896(ra) # 80204496 <argfd>
    return -1;
    80204c06:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    80204c08:	02054563          	bltz	a0,80204c32 <sys_readdir+0x44>
    80204c0c:	fe040593          	addi	a1,s0,-32
    80204c10:	4505                	li	a0,1
    80204c12:	ffffe097          	auipc	ra,0xffffe
    80204c16:	386080e7          	jalr	902(ra) # 80202f98 <argaddr>
    return -1;
    80204c1a:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    80204c1c:	00054b63          	bltz	a0,80204c32 <sys_readdir+0x44>
  return dirnext(f, p);
    80204c20:	fe043583          	ld	a1,-32(s0)
    80204c24:	fe843503          	ld	a0,-24(s0)
    80204c28:	fffff097          	auipc	ra,0xfffff
    80204c2c:	030080e7          	jalr	48(ra) # 80203c58 <dirnext>
    80204c30:	87aa                	mv	a5,a0
}
    80204c32:	853e                	mv	a0,a5
    80204c34:	60e2                	ld	ra,24(sp)
    80204c36:	6442                	ld	s0,16(sp)
    80204c38:	6105                	addi	sp,sp,32
    80204c3a:	8082                	ret

0000000080204c3c <sys_getcwd>:

// get absolute cwd string
uint64
sys_getcwd(void)
{
    80204c3c:	714d                	addi	sp,sp,-336
    80204c3e:	e686                	sd	ra,328(sp)
    80204c40:	e2a2                	sd	s0,320(sp)
    80204c42:	fe26                	sd	s1,312(sp)
    80204c44:	fa4a                	sd	s2,304(sp)
    80204c46:	f64e                	sd	s3,296(sp)
    80204c48:	f252                	sd	s4,288(sp)
    80204c4a:	ee56                	sd	s5,280(sp)
    80204c4c:	0a80                	addi	s0,sp,336
  uint64 addr;
  if (argaddr(0, &addr) < 0)
    80204c4e:	fb840593          	addi	a1,s0,-72
    80204c52:	4501                	li	a0,0
    80204c54:	ffffe097          	auipc	ra,0xffffe
    80204c58:	344080e7          	jalr	836(ra) # 80202f98 <argaddr>
    80204c5c:	87aa                	mv	a5,a0
    return -1;
    80204c5e:	557d                	li	a0,-1
  if (argaddr(0, &addr) < 0)
    80204c60:	0607cc63          	bltz	a5,80204cd8 <sys_getcwd+0x9c>

  struct dirent *de = myproc()->cwd;
    80204c64:	ffffd097          	auipc	ra,0xffffd
    80204c68:	f5a080e7          	jalr	-166(ra) # 80201bbe <myproc>
    80204c6c:	15853483          	ld	s1,344(a0)
  char path[FAT32_MAX_PATH];
  char *s;
  int len;

  if (de->parent == NULL) {
    80204c70:	1204b783          	ld	a5,288(s1)
    80204c74:	cbbd                	beqz	a5,80204cea <sys_getcwd+0xae>
    s = "/";
  } else {
    s = path + FAT32_MAX_PATH - 1;
    *s = '\0';
    80204c76:	fa0409a3          	sb	zero,-77(s0)
    s = path + FAT32_MAX_PATH - 1;
    80204c7a:	fb340993          	addi	s3,s0,-77
    while (de->parent) {
      len = strlen(de->filename);
      s -= len;
      if (s <= path)          // can't reach root "/"
    80204c7e:	eb040a13          	addi	s4,s0,-336
        return -1;
      strncpy(s, de->filename, len);
      *--s = '/';
    80204c82:	02f00a93          	li	s5,47
      len = strlen(de->filename);
    80204c86:	8526                	mv	a0,s1
    80204c88:	ffffc097          	auipc	ra,0xffffc
    80204c8c:	c90080e7          	jalr	-880(ra) # 80200918 <strlen>
    80204c90:	862a                	mv	a2,a0
      s -= len;
    80204c92:	40a98933          	sub	s2,s3,a0
      if (s <= path)          // can't reach root "/"
    80204c96:	052a7f63          	bgeu	s4,s2,80204cf4 <sys_getcwd+0xb8>
      strncpy(s, de->filename, len);
    80204c9a:	85a6                	mv	a1,s1
    80204c9c:	854a                	mv	a0,s2
    80204c9e:	ffffc097          	auipc	ra,0xffffc
    80204ca2:	c0a080e7          	jalr	-1014(ra) # 802008a8 <strncpy>
      *--s = '/';
    80204ca6:	fff90993          	addi	s3,s2,-1
    80204caa:	ff590fa3          	sb	s5,-1(s2)
      de = de->parent;
    80204cae:	1204b483          	ld	s1,288(s1)
    while (de->parent) {
    80204cb2:	1204b783          	ld	a5,288(s1)
    80204cb6:	fbe1                	bnez	a5,80204c86 <sys_getcwd+0x4a>
    }
  }

  // if (copyout(myproc()->pagetable, addr, s, strlen(s) + 1) < 0)
  if (copyout2(addr, s, strlen(s) + 1) < 0)
    80204cb8:	fb843483          	ld	s1,-72(s0)
    80204cbc:	854e                	mv	a0,s3
    80204cbe:	ffffc097          	auipc	ra,0xffffc
    80204cc2:	c5a080e7          	jalr	-934(ra) # 80200918 <strlen>
    80204cc6:	0015061b          	addiw	a2,a0,1
    80204cca:	85ce                	mv	a1,s3
    80204ccc:	8526                	mv	a0,s1
    80204cce:	ffffd097          	auipc	ra,0xffffd
    80204cd2:	804080e7          	jalr	-2044(ra) # 802014d2 <copyout2>
    80204cd6:	957d                	srai	a0,a0,0x3f
    return -1;
  
  return 0;

}
    80204cd8:	60b6                	ld	ra,328(sp)
    80204cda:	6416                	ld	s0,320(sp)
    80204cdc:	74f2                	ld	s1,312(sp)
    80204cde:	7952                	ld	s2,304(sp)
    80204ce0:	79b2                	ld	s3,296(sp)
    80204ce2:	7a12                	ld	s4,288(sp)
    80204ce4:	6af2                	ld	s5,280(sp)
    80204ce6:	6171                	addi	sp,sp,336
    80204ce8:	8082                	ret
    s = "/";
    80204cea:	00005997          	auipc	s3,0x5
    80204cee:	9be98993          	addi	s3,s3,-1602 # 802096a8 <digits+0x328>
    80204cf2:	b7d9                	j	80204cb8 <sys_getcwd+0x7c>
        return -1;
    80204cf4:	557d                	li	a0,-1
    80204cf6:	b7cd                	j	80204cd8 <sys_getcwd+0x9c>

0000000080204cf8 <sys_remove>:
  return ret == -1;
}

uint64
sys_remove(void)
{
    80204cf8:	d6010113          	addi	sp,sp,-672
    80204cfc:	28113c23          	sd	ra,664(sp)
    80204d00:	28813823          	sd	s0,656(sp)
    80204d04:	28913423          	sd	s1,648(sp)
    80204d08:	1500                	addi	s0,sp,672
  char path[FAT32_MAX_PATH];
  struct dirent *ep;
  int len;
  if((len = argstr(0, path, FAT32_MAX_PATH)) <= 0)
    80204d0a:	10400613          	li	a2,260
    80204d0e:	ed840593          	addi	a1,s0,-296
    80204d12:	4501                	li	a0,0
    80204d14:	ffffe097          	auipc	ra,0xffffe
    80204d18:	2a6080e7          	jalr	678(ra) # 80202fba <argstr>
    80204d1c:	0ea05a63          	blez	a0,80204e10 <sys_remove+0x118>
    return -1;

  char *s = path + len - 1;
    80204d20:	ed840713          	addi	a4,s0,-296
    80204d24:	157d                	addi	a0,a0,-1
    80204d26:	00a707b3          	add	a5,a4,a0
  while (s >= path && *s == '/') {
    80204d2a:	02f00693          	li	a3,47
    80204d2e:	863a                	mv	a2,a4
    80204d30:	00e7e963          	bltu	a5,a4,80204d42 <sys_remove+0x4a>
    80204d34:	0007c703          	lbu	a4,0(a5)
    80204d38:	08d71a63          	bne	a4,a3,80204dcc <sys_remove+0xd4>
    s--;
    80204d3c:	17fd                	addi	a5,a5,-1
  while (s >= path && *s == '/') {
    80204d3e:	fec7fbe3          	bgeu	a5,a2,80204d34 <sys_remove+0x3c>
  }
  if (s >= path && *s == '.' && (s == path || *--s == '/')) {
    return -1;
  }
  
  if((ep = ename(path)) == NULL){
    80204d42:	ed840513          	addi	a0,s0,-296
    80204d46:	00002097          	auipc	ra,0x2
    80204d4a:	4c6080e7          	jalr	1222(ra) # 8020720c <ename>
    80204d4e:	84aa                	mv	s1,a0
    80204d50:	c561                	beqz	a0,80204e18 <sys_remove+0x120>
    return -1;
  }
  elock(ep);
    80204d52:	00002097          	auipc	ra,0x2
    80204d56:	d1a080e7          	jalr	-742(ra) # 80206a6c <elock>
  if((ep->attribute & ATTR_DIRECTORY) && !isdirempty(ep)){
    80204d5a:	1004c783          	lbu	a5,256(s1)
    80204d5e:	8bc1                	andi	a5,a5,16
    80204d60:	c38d                	beqz	a5,80204d82 <sys_remove+0x8a>
  ep.valid = 0;
    80204d62:	e8041323          	sh	zero,-378(s0)
  ret = enext(dp, &ep, 2 * 32, &count);   // skip the "." and ".."
    80204d66:	d6c40693          	addi	a3,s0,-660
    80204d6a:	04000613          	li	a2,64
    80204d6e:	d7040593          	addi	a1,s0,-656
    80204d72:	8526                	mv	a0,s1
    80204d74:	00002097          	auipc	ra,0x2
    80204d78:	efc080e7          	jalr	-260(ra) # 80206c70 <enext>
  if((ep->attribute & ATTR_DIRECTORY) && !isdirempty(ep)){
    80204d7c:	57fd                	li	a5,-1
    80204d7e:	06f51d63          	bne	a0,a5,80204df8 <sys_remove+0x100>
      eunlock(ep);
      eput(ep);
      return -1;
  }
  elock(ep->parent);      // Will this lead to deadlock?
    80204d82:	1204b503          	ld	a0,288(s1)
    80204d86:	00002097          	auipc	ra,0x2
    80204d8a:	ce6080e7          	jalr	-794(ra) # 80206a6c <elock>
  eremove(ep);
    80204d8e:	8526                	mv	a0,s1
    80204d90:	00002097          	auipc	ra,0x2
    80204d94:	bae080e7          	jalr	-1106(ra) # 8020693e <eremove>
  eunlock(ep->parent);
    80204d98:	1204b503          	ld	a0,288(s1)
    80204d9c:	00002097          	auipc	ra,0x2
    80204da0:	d06080e7          	jalr	-762(ra) # 80206aa2 <eunlock>
  eunlock(ep);
    80204da4:	8526                	mv	a0,s1
    80204da6:	00002097          	auipc	ra,0x2
    80204daa:	cfc080e7          	jalr	-772(ra) # 80206aa2 <eunlock>
  eput(ep);
    80204dae:	8526                	mv	a0,s1
    80204db0:	00002097          	auipc	ra,0x2
    80204db4:	d40080e7          	jalr	-704(ra) # 80206af0 <eput>

  return 0;
    80204db8:	4501                	li	a0,0
}
    80204dba:	29813083          	ld	ra,664(sp)
    80204dbe:	29013403          	ld	s0,656(sp)
    80204dc2:	28813483          	ld	s1,648(sp)
    80204dc6:	2a010113          	addi	sp,sp,672
    80204dca:	8082                	ret
  if (s >= path && *s == '.' && (s == path || *--s == '/')) {
    80204dcc:	ed840713          	addi	a4,s0,-296
    80204dd0:	f6e7e9e3          	bltu	a5,a4,80204d42 <sys_remove+0x4a>
    80204dd4:	0007c683          	lbu	a3,0(a5)
    80204dd8:	02e00713          	li	a4,46
    80204ddc:	f6e693e3          	bne	a3,a4,80204d42 <sys_remove+0x4a>
    80204de0:	ed840713          	addi	a4,s0,-296
    80204de4:	02e78863          	beq	a5,a4,80204e14 <sys_remove+0x11c>
    80204de8:	fff7c703          	lbu	a4,-1(a5)
    80204dec:	02f00793          	li	a5,47
    80204df0:	f4f719e3          	bne	a4,a5,80204d42 <sys_remove+0x4a>
    return -1;
    80204df4:	557d                	li	a0,-1
    80204df6:	b7d1                	j	80204dba <sys_remove+0xc2>
      eunlock(ep);
    80204df8:	8526                	mv	a0,s1
    80204dfa:	00002097          	auipc	ra,0x2
    80204dfe:	ca8080e7          	jalr	-856(ra) # 80206aa2 <eunlock>
      eput(ep);
    80204e02:	8526                	mv	a0,s1
    80204e04:	00002097          	auipc	ra,0x2
    80204e08:	cec080e7          	jalr	-788(ra) # 80206af0 <eput>
      return -1;
    80204e0c:	557d                	li	a0,-1
    80204e0e:	b775                	j	80204dba <sys_remove+0xc2>
    return -1;
    80204e10:	557d                	li	a0,-1
    80204e12:	b765                	j	80204dba <sys_remove+0xc2>
    return -1;
    80204e14:	557d                	li	a0,-1
    80204e16:	b755                	j	80204dba <sys_remove+0xc2>
    return -1;
    80204e18:	557d                	li	a0,-1
    80204e1a:	b745                	j	80204dba <sys_remove+0xc2>

0000000080204e1c <sys_rename>:

// Must hold too many locks at a time! It's possible to raise a deadlock.
// Because this op takes some steps, we can't promise
uint64
sys_rename(void)
{
    80204e1c:	c4010113          	addi	sp,sp,-960
    80204e20:	3a113c23          	sd	ra,952(sp)
    80204e24:	3a813823          	sd	s0,944(sp)
    80204e28:	3a913423          	sd	s1,936(sp)
    80204e2c:	3b213023          	sd	s2,928(sp)
    80204e30:	39313c23          	sd	s3,920(sp)
    80204e34:	39413823          	sd	s4,912(sp)
    80204e38:	0780                	addi	s0,sp,960
  char old[FAT32_MAX_PATH], new[FAT32_MAX_PATH];
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    80204e3a:	10400613          	li	a2,260
    80204e3e:	ec840593          	addi	a1,s0,-312
    80204e42:	4501                	li	a0,0
    80204e44:	ffffe097          	auipc	ra,0xffffe
    80204e48:	176080e7          	jalr	374(ra) # 80202fba <argstr>
      return -1;
    80204e4c:	57fd                	li	a5,-1
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    80204e4e:	0c054d63          	bltz	a0,80204f28 <sys_rename+0x10c>
    80204e52:	10400613          	li	a2,260
    80204e56:	dc040593          	addi	a1,s0,-576
    80204e5a:	4505                	li	a0,1
    80204e5c:	ffffe097          	auipc	ra,0xffffe
    80204e60:	15e080e7          	jalr	350(ra) # 80202fba <argstr>
      return -1;
    80204e64:	57fd                	li	a5,-1
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    80204e66:	0c054163          	bltz	a0,80204f28 <sys_rename+0x10c>
  }

  struct dirent *src = NULL, *dst = NULL, *pdst = NULL;
  int srclock = 0;
  char *name;
  if ((src = ename(old)) == NULL || (pdst = enameparent(new, old)) == NULL
    80204e6a:	ec840513          	addi	a0,s0,-312
    80204e6e:	00002097          	auipc	ra,0x2
    80204e72:	39e080e7          	jalr	926(ra) # 8020720c <ename>
    80204e76:	84aa                	mv	s1,a0
    80204e78:	1c050963          	beqz	a0,8020504a <sys_rename+0x22e>
    80204e7c:	ec840593          	addi	a1,s0,-312
    80204e80:	dc040513          	addi	a0,s0,-576
    80204e84:	00002097          	auipc	ra,0x2
    80204e88:	3a6080e7          	jalr	934(ra) # 8020722a <enameparent>
    80204e8c:	892a                	mv	s2,a0
    80204e8e:	cd35                	beqz	a0,80204f0a <sys_rename+0xee>
      || (name = formatname(old)) == NULL) {
    80204e90:	ec840513          	addi	a0,s0,-312
    80204e94:	00001097          	auipc	ra,0x1
    80204e98:	532080e7          	jalr	1330(ra) # 802063c6 <formatname>
    80204e9c:	89aa                	mv	s3,a0
    80204e9e:	c535                	beqz	a0,80204f0a <sys_rename+0xee>
    goto fail;          // src doesn't exist || dst parent doesn't exist || illegal new name
  }
  for (struct dirent *ep = pdst; ep != NULL; ep = ep->parent) {
    if (ep == src) {    // In what universe can we move a directory into its child?
    80204ea0:	07248563          	beq	s1,s2,80204f0a <sys_rename+0xee>
  for (struct dirent *ep = pdst; ep != NULL; ep = ep->parent) {
    80204ea4:	87ca                	mv	a5,s2
    80204ea6:	1207b783          	ld	a5,288(a5)
    80204eaa:	c781                	beqz	a5,80204eb2 <sys_rename+0x96>
    if (ep == src) {    // In what universe can we move a directory into its child?
    80204eac:	fef49de3          	bne	s1,a5,80204ea6 <sys_rename+0x8a>
    80204eb0:	a8a9                	j	80204f0a <sys_rename+0xee>
      goto fail;
    }
  }

  uint off;
  elock(src);     // must hold child's lock before acquiring parent's, because we do so in other similar cases
    80204eb2:	8526                	mv	a0,s1
    80204eb4:	00002097          	auipc	ra,0x2
    80204eb8:	bb8080e7          	jalr	-1096(ra) # 80206a6c <elock>
  srclock = 1;
  elock(pdst);
    80204ebc:	854a                	mv	a0,s2
    80204ebe:	00002097          	auipc	ra,0x2
    80204ec2:	bae080e7          	jalr	-1106(ra) # 80206a6c <elock>
  dst = dirlookup(pdst, name, &off);
    80204ec6:	dbc40613          	addi	a2,s0,-580
    80204eca:	85ce                	mv	a1,s3
    80204ecc:	854a                	mv	a0,s2
    80204ece:	00002097          	auipc	ra,0x2
    80204ed2:	f2e080e7          	jalr	-210(ra) # 80206dfc <dirlookup>
    80204ed6:	8a2a                	mv	s4,a0
  if (dst != NULL) {
    80204ed8:	cd45                	beqz	a0,80204f90 <sys_rename+0x174>
    eunlock(pdst);
    80204eda:	854a                	mv	a0,s2
    80204edc:	00002097          	auipc	ra,0x2
    80204ee0:	bc6080e7          	jalr	-1082(ra) # 80206aa2 <eunlock>
    if (src == dst) {
    80204ee4:	01448963          	beq	s1,s4,80204ef6 <sys_rename+0xda>
      goto fail;
    } else if (src->attribute & dst->attribute & ATTR_DIRECTORY) {
    80204ee8:	1004c783          	lbu	a5,256(s1)
    80204eec:	100a4703          	lbu	a4,256(s4)
    80204ef0:	8ff9                	and	a5,a5,a4
    80204ef2:	8bc1                	andi	a5,a5,16
    80204ef4:	ebb1                	bnez	a5,80204f48 <sys_rename+0x12c>

  return 0;

fail:
  if (srclock)
    eunlock(src);
    80204ef6:	8526                	mv	a0,s1
    80204ef8:	00002097          	auipc	ra,0x2
    80204efc:	baa080e7          	jalr	-1110(ra) # 80206aa2 <eunlock>
  if (dst)
    eput(dst);
    80204f00:	8552                	mv	a0,s4
    80204f02:	00002097          	auipc	ra,0x2
    80204f06:	bee080e7          	jalr	-1042(ra) # 80206af0 <eput>
  if (pdst)
    80204f0a:	00090763          	beqz	s2,80204f18 <sys_rename+0xfc>
    eput(pdst);
    80204f0e:	854a                	mv	a0,s2
    80204f10:	00002097          	auipc	ra,0x2
    80204f14:	be0080e7          	jalr	-1056(ra) # 80206af0 <eput>
  if (src)
    eput(src);
  return -1;
    80204f18:	57fd                	li	a5,-1
  if (src)
    80204f1a:	c499                	beqz	s1,80204f28 <sys_rename+0x10c>
    eput(src);
    80204f1c:	8526                	mv	a0,s1
    80204f1e:	00002097          	auipc	ra,0x2
    80204f22:	bd2080e7          	jalr	-1070(ra) # 80206af0 <eput>
  return -1;
    80204f26:	57fd                	li	a5,-1
}
    80204f28:	853e                	mv	a0,a5
    80204f2a:	3b813083          	ld	ra,952(sp)
    80204f2e:	3b013403          	ld	s0,944(sp)
    80204f32:	3a813483          	ld	s1,936(sp)
    80204f36:	3a013903          	ld	s2,928(sp)
    80204f3a:	39813983          	ld	s3,920(sp)
    80204f3e:	39013a03          	ld	s4,912(sp)
    80204f42:	3c010113          	addi	sp,sp,960
    80204f46:	8082                	ret
      elock(dst);
    80204f48:	8552                	mv	a0,s4
    80204f4a:	00002097          	auipc	ra,0x2
    80204f4e:	b22080e7          	jalr	-1246(ra) # 80206a6c <elock>
  ep.valid = 0;
    80204f52:	d6041323          	sh	zero,-666(s0)
  ret = enext(dp, &ep, 2 * 32, &count);   // skip the "." and ".."
    80204f56:	c4c40693          	addi	a3,s0,-948
    80204f5a:	04000613          	li	a2,64
    80204f5e:	c5040593          	addi	a1,s0,-944
    80204f62:	8552                	mv	a0,s4
    80204f64:	00002097          	auipc	ra,0x2
    80204f68:	d0c080e7          	jalr	-756(ra) # 80206c70 <enext>
      if (!isdirempty(dst)) {    // it's ok to overwrite an empty dir
    80204f6c:	57fd                	li	a5,-1
    80204f6e:	0cf51863          	bne	a0,a5,8020503e <sys_rename+0x222>
      elock(pdst);
    80204f72:	854a                	mv	a0,s2
    80204f74:	00002097          	auipc	ra,0x2
    80204f78:	af8080e7          	jalr	-1288(ra) # 80206a6c <elock>
    eremove(dst);
    80204f7c:	8552                	mv	a0,s4
    80204f7e:	00002097          	auipc	ra,0x2
    80204f82:	9c0080e7          	jalr	-1600(ra) # 8020693e <eremove>
    eunlock(dst);
    80204f86:	8552                	mv	a0,s4
    80204f88:	00002097          	auipc	ra,0x2
    80204f8c:	b1a080e7          	jalr	-1254(ra) # 80206aa2 <eunlock>
  memmove(src->filename, name, FAT32_MAX_FILENAME);
    80204f90:	0ff00613          	li	a2,255
    80204f94:	85ce                	mv	a1,s3
    80204f96:	8526                	mv	a0,s1
    80204f98:	ffffc097          	auipc	ra,0xffffc
    80204f9c:	858080e7          	jalr	-1960(ra) # 802007f0 <memmove>
  emake(pdst, src, off);
    80204fa0:	dbc42603          	lw	a2,-580(s0)
    80204fa4:	85a6                	mv	a1,s1
    80204fa6:	854a                	mv	a0,s2
    80204fa8:	00001097          	auipc	ra,0x1
    80204fac:	4d6080e7          	jalr	1238(ra) # 8020647e <emake>
  if (src->parent != pdst) {
    80204fb0:	1204b783          	ld	a5,288(s1)
    80204fb4:	01278d63          	beq	a5,s2,80204fce <sys_rename+0x1b2>
    eunlock(pdst);
    80204fb8:	854a                	mv	a0,s2
    80204fba:	00002097          	auipc	ra,0x2
    80204fbe:	ae8080e7          	jalr	-1304(ra) # 80206aa2 <eunlock>
    elock(src->parent);
    80204fc2:	1204b503          	ld	a0,288(s1)
    80204fc6:	00002097          	auipc	ra,0x2
    80204fca:	aa6080e7          	jalr	-1370(ra) # 80206a6c <elock>
  eremove(src);
    80204fce:	8526                	mv	a0,s1
    80204fd0:	00002097          	auipc	ra,0x2
    80204fd4:	96e080e7          	jalr	-1682(ra) # 8020693e <eremove>
  eunlock(src->parent);
    80204fd8:	1204b503          	ld	a0,288(s1)
    80204fdc:	00002097          	auipc	ra,0x2
    80204fe0:	ac6080e7          	jalr	-1338(ra) # 80206aa2 <eunlock>
  struct dirent *psrc = src->parent;  // src must not be root, or it won't pass the for-loop test
    80204fe4:	1204b983          	ld	s3,288(s1)
  src->parent = edup(pdst);
    80204fe8:	854a                	mv	a0,s2
    80204fea:	00002097          	auipc	ra,0x2
    80204fee:	82e080e7          	jalr	-2002(ra) # 80206818 <edup>
    80204ff2:	12a4b023          	sd	a0,288(s1)
  src->off = off;
    80204ff6:	dbc42783          	lw	a5,-580(s0)
    80204ffa:	10f4ae23          	sw	a5,284(s1)
  src->valid = 1;
    80204ffe:	4785                	li	a5,1
    80205000:	10f49b23          	sh	a5,278(s1)
  eunlock(src);
    80205004:	8526                	mv	a0,s1
    80205006:	00002097          	auipc	ra,0x2
    8020500a:	a9c080e7          	jalr	-1380(ra) # 80206aa2 <eunlock>
  eput(psrc);
    8020500e:	854e                	mv	a0,s3
    80205010:	00002097          	auipc	ra,0x2
    80205014:	ae0080e7          	jalr	-1312(ra) # 80206af0 <eput>
  if (dst) {
    80205018:	000a0763          	beqz	s4,80205026 <sys_rename+0x20a>
    eput(dst);
    8020501c:	8552                	mv	a0,s4
    8020501e:	00002097          	auipc	ra,0x2
    80205022:	ad2080e7          	jalr	-1326(ra) # 80206af0 <eput>
  eput(pdst);
    80205026:	854a                	mv	a0,s2
    80205028:	00002097          	auipc	ra,0x2
    8020502c:	ac8080e7          	jalr	-1336(ra) # 80206af0 <eput>
  eput(src);
    80205030:	8526                	mv	a0,s1
    80205032:	00002097          	auipc	ra,0x2
    80205036:	abe080e7          	jalr	-1346(ra) # 80206af0 <eput>
  return 0;
    8020503a:	4781                	li	a5,0
    8020503c:	b5f5                	j	80204f28 <sys_rename+0x10c>
        eunlock(dst);
    8020503e:	8552                	mv	a0,s4
    80205040:	00002097          	auipc	ra,0x2
    80205044:	a62080e7          	jalr	-1438(ra) # 80206aa2 <eunlock>
        goto fail;
    80205048:	b57d                	j	80204ef6 <sys_rename+0xda>
  struct dirent *src = NULL, *dst = NULL, *pdst = NULL;
    8020504a:	892a                	mv	s2,a0
  if (dst)
    8020504c:	bd7d                	j	80204f0a <sys_rename+0xee>
	...

0000000080205050 <kernelvec>:
    80205050:	7111                	addi	sp,sp,-256
    80205052:	e006                	sd	ra,0(sp)
    80205054:	e40a                	sd	sp,8(sp)
    80205056:	e80e                	sd	gp,16(sp)
    80205058:	ec12                	sd	tp,24(sp)
    8020505a:	f016                	sd	t0,32(sp)
    8020505c:	f41a                	sd	t1,40(sp)
    8020505e:	f81e                	sd	t2,48(sp)
    80205060:	fc22                	sd	s0,56(sp)
    80205062:	e0a6                	sd	s1,64(sp)
    80205064:	e4aa                	sd	a0,72(sp)
    80205066:	e8ae                	sd	a1,80(sp)
    80205068:	ecb2                	sd	a2,88(sp)
    8020506a:	f0b6                	sd	a3,96(sp)
    8020506c:	f4ba                	sd	a4,104(sp)
    8020506e:	f8be                	sd	a5,112(sp)
    80205070:	fcc2                	sd	a6,120(sp)
    80205072:	e146                	sd	a7,128(sp)
    80205074:	e54a                	sd	s2,136(sp)
    80205076:	e94e                	sd	s3,144(sp)
    80205078:	ed52                	sd	s4,152(sp)
    8020507a:	f156                	sd	s5,160(sp)
    8020507c:	f55a                	sd	s6,168(sp)
    8020507e:	f95e                	sd	s7,176(sp)
    80205080:	fd62                	sd	s8,184(sp)
    80205082:	e1e6                	sd	s9,192(sp)
    80205084:	e5ea                	sd	s10,200(sp)
    80205086:	e9ee                	sd	s11,208(sp)
    80205088:	edf2                	sd	t3,216(sp)
    8020508a:	f1f6                	sd	t4,224(sp)
    8020508c:	f5fa                	sd	t5,232(sp)
    8020508e:	f9fe                	sd	t6,240(sp)
    80205090:	a29fd0ef          	jal	ra,80202ab8 <kerneltrap>
    80205094:	6082                	ld	ra,0(sp)
    80205096:	6122                	ld	sp,8(sp)
    80205098:	61c2                	ld	gp,16(sp)
    8020509a:	7282                	ld	t0,32(sp)
    8020509c:	7322                	ld	t1,40(sp)
    8020509e:	73c2                	ld	t2,48(sp)
    802050a0:	7462                	ld	s0,56(sp)
    802050a2:	6486                	ld	s1,64(sp)
    802050a4:	6526                	ld	a0,72(sp)
    802050a6:	65c6                	ld	a1,80(sp)
    802050a8:	6666                	ld	a2,88(sp)
    802050aa:	7686                	ld	a3,96(sp)
    802050ac:	7726                	ld	a4,104(sp)
    802050ae:	77c6                	ld	a5,112(sp)
    802050b0:	7866                	ld	a6,120(sp)
    802050b2:	688a                	ld	a7,128(sp)
    802050b4:	692a                	ld	s2,136(sp)
    802050b6:	69ca                	ld	s3,144(sp)
    802050b8:	6a6a                	ld	s4,152(sp)
    802050ba:	7a8a                	ld	s5,160(sp)
    802050bc:	7b2a                	ld	s6,168(sp)
    802050be:	7bca                	ld	s7,176(sp)
    802050c0:	7c6a                	ld	s8,184(sp)
    802050c2:	6c8e                	ld	s9,192(sp)
    802050c4:	6d2e                	ld	s10,200(sp)
    802050c6:	6dce                	ld	s11,208(sp)
    802050c8:	6e6e                	ld	t3,216(sp)
    802050ca:	7e8e                	ld	t4,224(sp)
    802050cc:	7f2e                	ld	t5,232(sp)
    802050ce:	7fce                	ld	t6,240(sp)
    802050d0:	6111                	addi	sp,sp,256
    802050d2:	10200073          	sret
	...

00000000802050de <timerinit>:
#include "include/proc.h"

struct spinlock tickslock;
uint ticks;

void timerinit() {
    802050de:	1141                	addi	sp,sp,-16
    802050e0:	e406                	sd	ra,8(sp)
    802050e2:	e022                	sd	s0,0(sp)
    802050e4:	0800                	addi	s0,sp,16
    initlock(&tickslock, "time");
    802050e6:	00005597          	auipc	a1,0x5
    802050ea:	d6a58593          	addi	a1,a1,-662 # 80209e50 <sysnames+0x1f0>
    802050ee:	00222517          	auipc	a0,0x222
    802050f2:	4aa50513          	addi	a0,a0,1194 # 80427598 <tickslock>
    802050f6:	ffffb097          	auipc	ra,0xffffb
    802050fa:	5ba080e7          	jalr	1466(ra) # 802006b0 <initlock>
    #ifdef DEBUG
    printf("timerinit\n");
    802050fe:	00005517          	auipc	a0,0x5
    80205102:	d5a50513          	addi	a0,a0,-678 # 80209e58 <sysnames+0x1f8>
    80205106:	ffffb097          	auipc	ra,0xffffb
    8020510a:	088080e7          	jalr	136(ra) # 8020018e <printf>
    #endif
}
    8020510e:	60a2                	ld	ra,8(sp)
    80205110:	6402                	ld	s0,0(sp)
    80205112:	0141                	addi	sp,sp,16
    80205114:	8082                	ret

0000000080205116 <set_next_timeout>:

void
set_next_timeout() {
    80205116:	1141                	addi	sp,sp,-16
    80205118:	e422                	sd	s0,8(sp)
    8020511a:	0800                	addi	s0,sp,16
  asm volatile("rdtime %0" : "=r" (x) );
    8020511c:	c0102573          	rdtime	a0
    // if comment the `printf` line below
    // the timer will not work.

    // this bug seems to disappear automatically
    // printf("");
    sbi_set_timer(r_time() + INTERVAL);
    80205120:	001dc7b7          	lui	a5,0x1dc
    80205124:	13078793          	addi	a5,a5,304 # 1dc130 <_entry-0x80023ed0>
    80205128:	953e                	add	a0,a0,a5
}

static inline void sbi_set_timer(uint64 stime_value)
{
	SBI_CALL_1(SBI_SET_TIMER, stime_value);
    8020512a:	4581                	li	a1,0
    8020512c:	4601                	li	a2,0
    8020512e:	4681                	li	a3,0
    80205130:	4881                	li	a7,0
    80205132:	00000073          	ecall
}
    80205136:	6422                	ld	s0,8(sp)
    80205138:	0141                	addi	sp,sp,16
    8020513a:	8082                	ret

000000008020513c <timer_tick>:

void timer_tick() {
    8020513c:	1101                	addi	sp,sp,-32
    8020513e:	ec06                	sd	ra,24(sp)
    80205140:	e822                	sd	s0,16(sp)
    80205142:	e426                	sd	s1,8(sp)
    80205144:	1000                	addi	s0,sp,32
    acquire(&tickslock);
    80205146:	00222497          	auipc	s1,0x222
    8020514a:	45248493          	addi	s1,s1,1106 # 80427598 <tickslock>
    8020514e:	8526                	mv	a0,s1
    80205150:	ffffb097          	auipc	ra,0xffffb
    80205154:	5a4080e7          	jalr	1444(ra) # 802006f4 <acquire>
    ticks++;
    80205158:	00222517          	auipc	a0,0x222
    8020515c:	45850513          	addi	a0,a0,1112 # 804275b0 <ticks>
    80205160:	411c                	lw	a5,0(a0)
    80205162:	2785                	addiw	a5,a5,1
    80205164:	c11c                	sw	a5,0(a0)
    wakeup(&ticks);
    80205166:	ffffd097          	auipc	ra,0xffffd
    8020516a:	43a080e7          	jalr	1082(ra) # 802025a0 <wakeup>
    release(&tickslock);
    8020516e:	8526                	mv	a0,s1
    80205170:	ffffb097          	auipc	ra,0xffffb
    80205174:	5d8080e7          	jalr	1496(ra) # 80200748 <release>
    set_next_timeout();
    80205178:	00000097          	auipc	ra,0x0
    8020517c:	f9e080e7          	jalr	-98(ra) # 80205116 <set_next_timeout>
}
    80205180:	60e2                	ld	ra,24(sp)
    80205182:	6442                	ld	s0,16(sp)
    80205184:	64a2                	ld	s1,8(sp)
    80205186:	6105                	addi	sp,sp,32
    80205188:	8082                	ret
	...

0000000080205192 <mkfs>:
  void* ramdisk_addr = ramdisk_page_pool[ramdisk_page_index] + ramdisk_page_offset;
  return ramdisk_addr;
}

// copy fs.img to ramdisk
void mkfs(){
    80205192:	7139                	addi	sp,sp,-64
    80205194:	fc06                	sd	ra,56(sp)
    80205196:	f822                	sd	s0,48(sp)
    80205198:	f426                	sd	s1,40(sp)
    8020519a:	f04a                	sd	s2,32(sp)
    8020519c:	ec4e                	sd	s3,24(sp)
    8020519e:	e852                	sd	s4,16(sp)
    802051a0:	e456                	sd	s5,8(sp)
    802051a2:	e05a                	sd	s6,0(sp)
    802051a4:	0080                	addi	s0,sp,64
    char* start = (char*)fs_img_start;
    char* end = (char*)fs_img_end;
    uint64 fsize = end - start;
    802051a6:	00206717          	auipc	a4,0x206
    802051aa:	e5a70713          	addi	a4,a4,-422 # 8040b000 <fs_img_end>
    802051ae:	00006797          	auipc	a5,0x6
    802051b2:	e5278793          	addi	a5,a5,-430 # 8020b000 <data_start>
    802051b6:	40f70a33          	sub	s4,a4,a5
    int i;
    // Copy data of one page size at a time
    for(i = 0; i < NRAMDISKPAGES && fsize != 0; ++i){
    802051ba:	04f70763          	beq	a4,a5,80205208 <mkfs+0x76>
    802051be:	00222917          	auipc	s2,0x222
    802051c2:	3fa90913          	addi	s2,s2,1018 # 804275b8 <ramdisk_page_pool>
    802051c6:	034a1993          	slli	s3,s4,0x34
    802051ca:	0349d993          	srli	s3,s3,0x34
    802051ce:	fff83ab7          	lui	s5,0xfff83
    802051d2:	9ad2                	add	s5,s5,s4
    uint64 fsize = end - start;
    802051d4:	84d2                	mv	s1,s4
    802051d6:	9a3e                	add	s4,s4,a5
        if(fsize < PGSIZE)
        {
            w_size = fsize;
        }
        memmove(dst_addr, src_addr, w_size);
        fsize -= w_size;
    802051d8:	7b7d                	lui	s6,0xfffff
    802051da:	a019                	j	802051e0 <mkfs+0x4e>
    802051dc:	0921                	addi	s2,s2,8
    for(i = 0; i < NRAMDISKPAGES && fsize != 0; ++i){
    802051de:	c48d                	beqz	s1,80205208 <mkfs+0x76>
    802051e0:	409a05b3          	sub	a1,s4,s1
        void* dst_addr = ramdisk_page_pool[i];
    802051e4:	00093503          	ld	a0,0(s2)
        if(fsize < PGSIZE)
    802051e8:	01348b63          	beq	s1,s3,802051fe <mkfs+0x6c>
        memmove(dst_addr, src_addr, w_size);
    802051ec:	6605                	lui	a2,0x1
    802051ee:	ffffb097          	auipc	ra,0xffffb
    802051f2:	602080e7          	jalr	1538(ra) # 802007f0 <memmove>
        fsize -= w_size;
    802051f6:	94da                	add	s1,s1,s6
    for(i = 0; i < NRAMDISKPAGES && fsize != 0; ++i){
    802051f8:	ff5492e3          	bne	s1,s5,802051dc <mkfs+0x4a>
    802051fc:	a031                	j	80205208 <mkfs+0x76>
        memmove(dst_addr, src_addr, w_size);
    802051fe:	864e                	mv	a2,s3
    80205200:	ffffb097          	auipc	ra,0xffffb
    80205204:	5f0080e7          	jalr	1520(ra) # 802007f0 <memmove>
        start += w_size;
    }
}
    80205208:	70e2                	ld	ra,56(sp)
    8020520a:	7442                	ld	s0,48(sp)
    8020520c:	74a2                	ld	s1,40(sp)
    8020520e:	7902                	ld	s2,32(sp)
    80205210:	69e2                	ld	s3,24(sp)
    80205212:	6a42                	ld	s4,16(sp)
    80205214:	6aa2                	ld	s5,8(sp)
    80205216:	6b02                	ld	s6,0(sp)
    80205218:	6121                	addi	sp,sp,64
    8020521a:	8082                	ret

000000008020521c <ramdisk_init>:

void
ramdisk_init(void)
{
    8020521c:	1141                	addi	sp,sp,-16
    8020521e:	e406                	sd	ra,8(sp)
    80205220:	e022                	sd	s0,0(sp)
    80205222:	0800                	addi	s0,sp,16
      panic("ram disk init error!\n");
    }
    ramdisk_page_pool[i] = pa;
  }
*/
  initlock(&ramdisklock, "ramdisk lock");
    80205224:	00005597          	auipc	a1,0x5
    80205228:	c4458593          	addi	a1,a1,-956 # 80209e68 <sysnames+0x208>
    8020522c:	00222517          	auipc	a0,0x222
    80205230:	77450513          	addi	a0,a0,1908 # 804279a0 <ramdisklock>
    80205234:	ffffb097          	auipc	ra,0xffffb
    80205238:	47c080e7          	jalr	1148(ra) # 802006b0 <initlock>
  //mkfs();
}
    8020523c:	60a2                	ld	ra,8(sp)
    8020523e:	6402                	ld	s0,0(sp)
    80205240:	0141                	addi	sp,sp,16
    80205242:	8082                	ret

0000000080205244 <ramdisk_rw>:

void 
ramdisk_rw(struct buf *b, int write)
{
    80205244:	1101                	addi	sp,sp,-32
    80205246:	ec06                	sd	ra,24(sp)
    80205248:	e822                	sd	s0,16(sp)
    8020524a:	e426                	sd	s1,8(sp)
    8020524c:	e04a                	sd	s2,0(sp)
    8020524e:	1000                	addi	s0,sp,32
    80205250:	84aa                	mv	s1,a0
    80205252:	892e                	mv	s2,a1
  acquire(&ramdisklock);
    80205254:	00222517          	auipc	a0,0x222
    80205258:	74c50513          	addi	a0,a0,1868 # 804279a0 <ramdisklock>
    8020525c:	ffffb097          	auipc	ra,0xffffb
    80205260:	498080e7          	jalr	1176(ra) # 802006f4 <acquire>
  else
  {
    memmove(b->data, addr, BSIZE);
  }
  */
  uint sectorno = b->sectorno;
    80205264:	44dc                	lw	a5,12(s1)
  if(b->dev != ROOTDEV)
    80205266:	4498                	lw	a4,8(s1)
    80205268:	e331                	bnez	a4,802052ac <ramdisk_rw+0x68>
  	panic("wrong device number");
  lookup_ramdisk_addr(sectorno);
  char *addr = fs_img_start+sectorno*BSIZE;
    8020526a:	0097979b          	slliw	a5,a5,0x9
    8020526e:	1782                	slli	a5,a5,0x20
    80205270:	9381                	srli	a5,a5,0x20
    80205272:	00006517          	auipc	a0,0x6
    80205276:	d8e50513          	addi	a0,a0,-626 # 8020b000 <data_start>
    8020527a:	953e                	add	a0,a0,a5
  if (write)
    8020527c:	04090063          	beqz	s2,802052bc <ramdisk_rw+0x78>
  {
    memmove((void*)addr, b->data, BSIZE);
    80205280:	20000613          	li	a2,512
    80205284:	05848593          	addi	a1,s1,88
    80205288:	ffffb097          	auipc	ra,0xffffb
    8020528c:	568080e7          	jalr	1384(ra) # 802007f0 <memmove>
  }
  else
  {
    memmove(b->data, (void*)addr, BSIZE);
  }
  release(&ramdisklock);
    80205290:	00222517          	auipc	a0,0x222
    80205294:	71050513          	addi	a0,a0,1808 # 804279a0 <ramdisklock>
    80205298:	ffffb097          	auipc	ra,0xffffb
    8020529c:	4b0080e7          	jalr	1200(ra) # 80200748 <release>
}
    802052a0:	60e2                	ld	ra,24(sp)
    802052a2:	6442                	ld	s0,16(sp)
    802052a4:	64a2                	ld	s1,8(sp)
    802052a6:	6902                	ld	s2,0(sp)
    802052a8:	6105                	addi	sp,sp,32
    802052aa:	8082                	ret
  	panic("wrong device number");
    802052ac:	00005517          	auipc	a0,0x5
    802052b0:	bcc50513          	addi	a0,a0,-1076 # 80209e78 <sysnames+0x218>
    802052b4:	ffffb097          	auipc	ra,0xffffb
    802052b8:	e90080e7          	jalr	-368(ra) # 80200144 <panic>
    memmove(b->data, (void*)addr, BSIZE);
    802052bc:	20000613          	li	a2,512
    802052c0:	85aa                	mv	a1,a0
    802052c2:	05848513          	addi	a0,s1,88
    802052c6:	ffffb097          	auipc	ra,0xffffb
    802052ca:	52a080e7          	jalr	1322(ra) # 802007f0 <memmove>
    802052ce:	b7c9                	j	80205290 <ramdisk_rw+0x4c>

00000000802052d0 <ramdisk_intr>:

void
ramdisk_intr()
{
    802052d0:	1141                	addi	sp,sp,-16
    802052d2:	e406                	sd	ra,8(sp)
    802052d4:	e022                	sd	s0,0(sp)
    802052d6:	0800                	addi	s0,sp,16
    acquire(&ramdisklock);
    802052d8:	00222517          	auipc	a0,0x222
    802052dc:	6c850513          	addi	a0,a0,1736 # 804279a0 <ramdisklock>
    802052e0:	ffffb097          	auipc	ra,0xffffb
    802052e4:	414080e7          	jalr	1044(ra) # 802006f4 <acquire>
    
}
    802052e8:	60a2                	ld	ra,8(sp)
    802052ea:	6402                	ld	s0,0(sp)
    802052ec:	0141                	addi	sp,sp,16
    802052ee:	8082                	ret

00000000802052f0 <free_desc>:
}

// mark a descriptor as free.
static void
free_desc(int i)
{
    802052f0:	1141                	addi	sp,sp,-16
    802052f2:	e406                	sd	ra,8(sp)
    802052f4:	e022                	sd	s0,0(sp)
    802052f6:	0800                	addi	s0,sp,16
  if(i >= NUM)
    802052f8:	479d                	li	a5,7
    802052fa:	04a7cc63          	blt	a5,a0,80205352 <free_desc+0x62>
    panic("virtio_disk_intr 1");
  if(disk.free[i])
    802052fe:	00223797          	auipc	a5,0x223
    80205302:	d0278793          	addi	a5,a5,-766 # 80428000 <disk>
    80205306:	00a78733          	add	a4,a5,a0
    8020530a:	6789                	lui	a5,0x2
    8020530c:	97ba                	add	a5,a5,a4
    8020530e:	0187c783          	lbu	a5,24(a5) # 2018 <_entry-0x801fdfe8>
    80205312:	eba1                	bnez	a5,80205362 <free_desc+0x72>
    panic("virtio_disk_intr 2");
  disk.desc[i].addr = 0;
    80205314:	00451713          	slli	a4,a0,0x4
    80205318:	00225797          	auipc	a5,0x225
    8020531c:	ce87b783          	ld	a5,-792(a5) # 8042a000 <disk+0x2000>
    80205320:	97ba                	add	a5,a5,a4
    80205322:	0007b023          	sd	zero,0(a5)
  disk.free[i] = 1;
    80205326:	00223797          	auipc	a5,0x223
    8020532a:	cda78793          	addi	a5,a5,-806 # 80428000 <disk>
    8020532e:	97aa                	add	a5,a5,a0
    80205330:	6509                	lui	a0,0x2
    80205332:	953e                	add	a0,a0,a5
    80205334:	4785                	li	a5,1
    80205336:	00f50c23          	sb	a5,24(a0) # 2018 <_entry-0x801fdfe8>
  wakeup(&disk.free[0]);
    8020533a:	00225517          	auipc	a0,0x225
    8020533e:	cde50513          	addi	a0,a0,-802 # 8042a018 <disk+0x2018>
    80205342:	ffffd097          	auipc	ra,0xffffd
    80205346:	25e080e7          	jalr	606(ra) # 802025a0 <wakeup>
}
    8020534a:	60a2                	ld	ra,8(sp)
    8020534c:	6402                	ld	s0,0(sp)
    8020534e:	0141                	addi	sp,sp,16
    80205350:	8082                	ret
    panic("virtio_disk_intr 1");
    80205352:	00005517          	auipc	a0,0x5
    80205356:	b3e50513          	addi	a0,a0,-1218 # 80209e90 <sysnames+0x230>
    8020535a:	ffffb097          	auipc	ra,0xffffb
    8020535e:	dea080e7          	jalr	-534(ra) # 80200144 <panic>
    panic("virtio_disk_intr 2");
    80205362:	00005517          	auipc	a0,0x5
    80205366:	b4650513          	addi	a0,a0,-1210 # 80209ea8 <sysnames+0x248>
    8020536a:	ffffb097          	auipc	ra,0xffffb
    8020536e:	dda080e7          	jalr	-550(ra) # 80200144 <panic>

0000000080205372 <virtio_disk_init>:
{
    80205372:	1141                	addi	sp,sp,-16
    80205374:	e406                	sd	ra,8(sp)
    80205376:	e022                	sd	s0,0(sp)
    80205378:	0800                	addi	s0,sp,16
  initlock(&disk.vdisk_lock, "virtio_disk");
    8020537a:	00005597          	auipc	a1,0x5
    8020537e:	b4658593          	addi	a1,a1,-1210 # 80209ec0 <sysnames+0x260>
    80205382:	00225517          	auipc	a0,0x225
    80205386:	d2650513          	addi	a0,a0,-730 # 8042a0a8 <disk+0x20a8>
    8020538a:	ffffb097          	auipc	ra,0xffffb
    8020538e:	326080e7          	jalr	806(ra) # 802006b0 <initlock>
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80205392:	03f107b7          	lui	a5,0x3f10
    80205396:	0785                	addi	a5,a5,1
    80205398:	07b2                	slli	a5,a5,0xc
    8020539a:	4398                	lw	a4,0(a5)
    8020539c:	2701                	sext.w	a4,a4
    8020539e:	747277b7          	lui	a5,0x74727
    802053a2:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xbad968a>
    802053a6:	12f71a63          	bne	a4,a5,802054da <virtio_disk_init+0x168>
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    802053aa:	00005797          	auipc	a5,0x5
    802053ae:	e0e7b783          	ld	a5,-498(a5) # 8020a1b8 <erodata+0x3>
    802053b2:	439c                	lw	a5,0(a5)
    802053b4:	2781                	sext.w	a5,a5
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    802053b6:	4705                	li	a4,1
    802053b8:	12e79163          	bne	a5,a4,802054da <virtio_disk_init+0x168>
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    802053bc:	00005797          	auipc	a5,0x5
    802053c0:	e047b783          	ld	a5,-508(a5) # 8020a1c0 <erodata+0xb>
    802053c4:	439c                	lw	a5,0(a5)
    802053c6:	2781                	sext.w	a5,a5
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    802053c8:	4709                	li	a4,2
    802053ca:	10e79863          	bne	a5,a4,802054da <virtio_disk_init+0x168>
     *R(VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    802053ce:	00005797          	auipc	a5,0x5
    802053d2:	dfa7b783          	ld	a5,-518(a5) # 8020a1c8 <erodata+0x13>
    802053d6:	4398                	lw	a4,0(a5)
    802053d8:	2701                	sext.w	a4,a4
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    802053da:	554d47b7          	lui	a5,0x554d4
    802053de:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ad2baaf>
    802053e2:	0ef71c63          	bne	a4,a5,802054da <virtio_disk_init+0x168>
  *R(VIRTIO_MMIO_STATUS) = status;
    802053e6:	00005717          	auipc	a4,0x5
    802053ea:	dea73703          	ld	a4,-534(a4) # 8020a1d0 <erodata+0x1b>
    802053ee:	4785                	li	a5,1
    802053f0:	c31c                	sw	a5,0(a4)
  *R(VIRTIO_MMIO_STATUS) = status;
    802053f2:	478d                	li	a5,3
    802053f4:	c31c                	sw	a5,0(a4)
  uint64 features = *R(VIRTIO_MMIO_DEVICE_FEATURES);
    802053f6:	00005797          	auipc	a5,0x5
    802053fa:	de27b783          	ld	a5,-542(a5) # 8020a1d8 <erodata+0x23>
    802053fe:	4394                	lw	a3,0(a5)
  features &= ~(1 << VIRTIO_RING_F_INDIRECT_DESC);
    80205400:	c7ffe7b7          	lui	a5,0xc7ffe
    80205404:	75f78793          	addi	a5,a5,1887 # ffffffffc7ffe75f <kernel_end+0xffffffff47bce75f>
    80205408:	8ff5                	and	a5,a5,a3
  *R(VIRTIO_MMIO_DRIVER_FEATURES) = features;
    8020540a:	2781                	sext.w	a5,a5
    8020540c:	00005697          	auipc	a3,0x5
    80205410:	dd46b683          	ld	a3,-556(a3) # 8020a1e0 <erodata+0x2b>
    80205414:	c29c                	sw	a5,0(a3)
  *R(VIRTIO_MMIO_STATUS) = status;
    80205416:	47ad                	li	a5,11
    80205418:	c31c                	sw	a5,0(a4)
  *R(VIRTIO_MMIO_STATUS) = status;
    8020541a:	47bd                	li	a5,15
    8020541c:	c31c                	sw	a5,0(a4)
  *R(VIRTIO_MMIO_GUEST_PAGE_SIZE) = PGSIZE;
    8020541e:	00005797          	auipc	a5,0x5
    80205422:	dca7b783          	ld	a5,-566(a5) # 8020a1e8 <erodata+0x33>
    80205426:	6705                	lui	a4,0x1
    80205428:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_QUEUE_SEL) = 0;
    8020542a:	00005797          	auipc	a5,0x5
    8020542e:	dc67b783          	ld	a5,-570(a5) # 8020a1f0 <erodata+0x3b>
    80205432:	0007a023          	sw	zero,0(a5)
  uint32 max = *R(VIRTIO_MMIO_QUEUE_NUM_MAX);
    80205436:	00005797          	auipc	a5,0x5
    8020543a:	dc27b783          	ld	a5,-574(a5) # 8020a1f8 <erodata+0x43>
    8020543e:	439c                	lw	a5,0(a5)
    80205440:	2781                	sext.w	a5,a5
  if(max == 0)
    80205442:	c7c5                	beqz	a5,802054ea <virtio_disk_init+0x178>
  if(max < NUM)
    80205444:	471d                	li	a4,7
    80205446:	0af77a63          	bgeu	a4,a5,802054fa <virtio_disk_init+0x188>
  *R(VIRTIO_MMIO_QUEUE_NUM) = NUM;
    8020544a:	00005797          	auipc	a5,0x5
    8020544e:	db67b783          	ld	a5,-586(a5) # 8020a200 <erodata+0x4b>
    80205452:	4721                	li	a4,8
    80205454:	c398                	sw	a4,0(a5)
  memset(disk.pages, 0, sizeof(disk.pages));
    80205456:	6609                	lui	a2,0x2
    80205458:	4581                	li	a1,0
    8020545a:	00223517          	auipc	a0,0x223
    8020545e:	ba650513          	addi	a0,a0,-1114 # 80428000 <disk>
    80205462:	ffffb097          	auipc	ra,0xffffb
    80205466:	32e080e7          	jalr	814(ra) # 80200790 <memset>
  *R(VIRTIO_MMIO_QUEUE_PFN) = ((uint64)disk.pages) >> PGSHIFT;
    8020546a:	00223717          	auipc	a4,0x223
    8020546e:	b9670713          	addi	a4,a4,-1130 # 80428000 <disk>
    80205472:	00c75793          	srli	a5,a4,0xc
    80205476:	2781                	sext.w	a5,a5
    80205478:	00005697          	auipc	a3,0x5
    8020547c:	d906b683          	ld	a3,-624(a3) # 8020a208 <erodata+0x53>
    80205480:	c29c                	sw	a5,0(a3)
  disk.desc = (struct VRingDesc *) disk.pages;
    80205482:	00225797          	auipc	a5,0x225
    80205486:	b7e78793          	addi	a5,a5,-1154 # 8042a000 <disk+0x2000>
    8020548a:	e398                	sd	a4,0(a5)
  disk.avail = (uint16*)(((char*)disk.desc) + NUM*sizeof(struct VRingDesc));
    8020548c:	00223717          	auipc	a4,0x223
    80205490:	bf470713          	addi	a4,a4,-1036 # 80428080 <disk+0x80>
    80205494:	e798                	sd	a4,8(a5)
  disk.used = (struct UsedArea *) (disk.pages + PGSIZE);
    80205496:	00224717          	auipc	a4,0x224
    8020549a:	b6a70713          	addi	a4,a4,-1174 # 80429000 <disk+0x1000>
    8020549e:	eb98                	sd	a4,16(a5)
    disk.free[i] = 1;
    802054a0:	4705                	li	a4,1
    802054a2:	00e78c23          	sb	a4,24(a5)
    802054a6:	00e78ca3          	sb	a4,25(a5)
    802054aa:	00e78d23          	sb	a4,26(a5)
    802054ae:	00e78da3          	sb	a4,27(a5)
    802054b2:	00e78e23          	sb	a4,28(a5)
    802054b6:	00e78ea3          	sb	a4,29(a5)
    802054ba:	00e78f23          	sb	a4,30(a5)
    802054be:	00e78fa3          	sb	a4,31(a5)
  printf("virtio_disk_init\n");
    802054c2:	00005517          	auipc	a0,0x5
    802054c6:	a6e50513          	addi	a0,a0,-1426 # 80209f30 <sysnames+0x2d0>
    802054ca:	ffffb097          	auipc	ra,0xffffb
    802054ce:	cc4080e7          	jalr	-828(ra) # 8020018e <printf>
}
    802054d2:	60a2                	ld	ra,8(sp)
    802054d4:	6402                	ld	s0,0(sp)
    802054d6:	0141                	addi	sp,sp,16
    802054d8:	8082                	ret
    panic("could not find virtio disk");
    802054da:	00005517          	auipc	a0,0x5
    802054de:	9f650513          	addi	a0,a0,-1546 # 80209ed0 <sysnames+0x270>
    802054e2:	ffffb097          	auipc	ra,0xffffb
    802054e6:	c62080e7          	jalr	-926(ra) # 80200144 <panic>
    panic("virtio disk has no queue 0");
    802054ea:	00005517          	auipc	a0,0x5
    802054ee:	a0650513          	addi	a0,a0,-1530 # 80209ef0 <sysnames+0x290>
    802054f2:	ffffb097          	auipc	ra,0xffffb
    802054f6:	c52080e7          	jalr	-942(ra) # 80200144 <panic>
    panic("virtio disk max queue too short");
    802054fa:	00005517          	auipc	a0,0x5
    802054fe:	a1650513          	addi	a0,a0,-1514 # 80209f10 <sysnames+0x2b0>
    80205502:	ffffb097          	auipc	ra,0xffffb
    80205506:	c42080e7          	jalr	-958(ra) # 80200144 <panic>

000000008020550a <virtio_disk_rw>:
  return 0;
}

void
virtio_disk_rw(struct buf *b, int write)
{
    8020550a:	7119                	addi	sp,sp,-128
    8020550c:	fc86                	sd	ra,120(sp)
    8020550e:	f8a2                	sd	s0,112(sp)
    80205510:	f4a6                	sd	s1,104(sp)
    80205512:	f0ca                	sd	s2,96(sp)
    80205514:	ecce                	sd	s3,88(sp)
    80205516:	e8d2                	sd	s4,80(sp)
    80205518:	e4d6                	sd	s5,72(sp)
    8020551a:	e0da                	sd	s6,64(sp)
    8020551c:	fc5e                	sd	s7,56(sp)
    8020551e:	f862                	sd	s8,48(sp)
    80205520:	f466                	sd	s9,40(sp)
    80205522:	f06a                	sd	s10,32(sp)
    80205524:	0100                	addi	s0,sp,128
    80205526:	892a                	mv	s2,a0
    80205528:	8cae                	mv	s9,a1
  uint64 sector = b->sectorno;
    8020552a:	00c56d03          	lwu	s10,12(a0)

  acquire(&disk.vdisk_lock);
    8020552e:	00225517          	auipc	a0,0x225
    80205532:	b7a50513          	addi	a0,a0,-1158 # 8042a0a8 <disk+0x20a8>
    80205536:	ffffb097          	auipc	ra,0xffffb
    8020553a:	1be080e7          	jalr	446(ra) # 802006f4 <acquire>
  for(int i = 0; i < 3; i++){
    8020553e:	4981                	li	s3,0
  for(int i = 0; i < NUM; i++){
    80205540:	4c21                	li	s8,8
      disk.free[i] = 0;
    80205542:	00223b97          	auipc	s7,0x223
    80205546:	abeb8b93          	addi	s7,s7,-1346 # 80428000 <disk>
    8020554a:	6b09                	lui	s6,0x2
  for(int i = 0; i < 3; i++){
    8020554c:	4a8d                	li	s5,3
  for(int i = 0; i < NUM; i++){
    8020554e:	8a4e                	mv	s4,s3
    80205550:	a051                	j	802055d4 <virtio_disk_rw+0xca>
      disk.free[i] = 0;
    80205552:	00fb86b3          	add	a3,s7,a5
    80205556:	96da                	add	a3,a3,s6
    80205558:	00068c23          	sb	zero,24(a3)
    idx[i] = alloc_desc();
    8020555c:	c21c                	sw	a5,0(a2)
    if(idx[i] < 0){
    8020555e:	0207c563          	bltz	a5,80205588 <virtio_disk_rw+0x7e>
  for(int i = 0; i < 3; i++){
    80205562:	2485                	addiw	s1,s1,1
    80205564:	0711                	addi	a4,a4,4
    80205566:	25548463          	beq	s1,s5,802057ae <virtio_disk_rw+0x2a4>
    idx[i] = alloc_desc();
    8020556a:	863a                	mv	a2,a4
  for(int i = 0; i < NUM; i++){
    8020556c:	00225697          	auipc	a3,0x225
    80205570:	aac68693          	addi	a3,a3,-1364 # 8042a018 <disk+0x2018>
    80205574:	87d2                	mv	a5,s4
    if(disk.free[i]){
    80205576:	0006c583          	lbu	a1,0(a3)
    8020557a:	fde1                	bnez	a1,80205552 <virtio_disk_rw+0x48>
  for(int i = 0; i < NUM; i++){
    8020557c:	2785                	addiw	a5,a5,1
    8020557e:	0685                	addi	a3,a3,1
    80205580:	ff879be3          	bne	a5,s8,80205576 <virtio_disk_rw+0x6c>
    idx[i] = alloc_desc();
    80205584:	57fd                	li	a5,-1
    80205586:	c21c                	sw	a5,0(a2)
      for(int j = 0; j < i; j++)
    80205588:	02905a63          	blez	s1,802055bc <virtio_disk_rw+0xb2>
        free_desc(idx[j]);
    8020558c:	f9042503          	lw	a0,-112(s0)
    80205590:	00000097          	auipc	ra,0x0
    80205594:	d60080e7          	jalr	-672(ra) # 802052f0 <free_desc>
      for(int j = 0; j < i; j++)
    80205598:	4785                	li	a5,1
    8020559a:	0297d163          	bge	a5,s1,802055bc <virtio_disk_rw+0xb2>
        free_desc(idx[j]);
    8020559e:	f9442503          	lw	a0,-108(s0)
    802055a2:	00000097          	auipc	ra,0x0
    802055a6:	d4e080e7          	jalr	-690(ra) # 802052f0 <free_desc>
      for(int j = 0; j < i; j++)
    802055aa:	4789                	li	a5,2
    802055ac:	0097d863          	bge	a5,s1,802055bc <virtio_disk_rw+0xb2>
        free_desc(idx[j]);
    802055b0:	f9842503          	lw	a0,-104(s0)
    802055b4:	00000097          	auipc	ra,0x0
    802055b8:	d3c080e7          	jalr	-708(ra) # 802052f0 <free_desc>
  int idx[3];
  while(1){
    if(alloc3_desc(idx) == 0) {
      break;
    }
    sleep(&disk.free[0], &disk.vdisk_lock);
    802055bc:	00225597          	auipc	a1,0x225
    802055c0:	aec58593          	addi	a1,a1,-1300 # 8042a0a8 <disk+0x20a8>
    802055c4:	00225517          	auipc	a0,0x225
    802055c8:	a5450513          	addi	a0,a0,-1452 # 8042a018 <disk+0x2018>
    802055cc:	ffffd097          	auipc	ra,0xffffd
    802055d0:	e52080e7          	jalr	-430(ra) # 8020241e <sleep>
  for(int i = 0; i < 3; i++){
    802055d4:	f9040713          	addi	a4,s0,-112
    802055d8:	84ce                	mv	s1,s3
    802055da:	bf41                	j	8020556a <virtio_disk_rw+0x60>
    uint32 reserved;
    uint64 sector;
  } buf0;

  if(write)
    buf0.type = VIRTIO_BLK_T_OUT; // write the disk
    802055dc:	4785                	li	a5,1
    802055de:	f8f42023          	sw	a5,-128(s0)
  else
    buf0.type = VIRTIO_BLK_T_IN; // read the disk
  buf0.reserved = 0;
    802055e2:	f8042223          	sw	zero,-124(s0)
  buf0.sector = sector;
    802055e6:	f9a43423          	sd	s10,-120(s0)

  // buf0 is on a kernel stack, which is not direct mapped,
  // thus the call to kvmpa().
  disk.desc[idx[0]].addr = (uint64) kwalkaddr(myproc()->kpagetable, (uint64) &buf0);
    802055ea:	ffffc097          	auipc	ra,0xffffc
    802055ee:	5d4080e7          	jalr	1492(ra) # 80201bbe <myproc>
    802055f2:	f9042983          	lw	s3,-112(s0)
    802055f6:	00499493          	slli	s1,s3,0x4
    802055fa:	00225a17          	auipc	s4,0x225
    802055fe:	a06a0a13          	addi	s4,s4,-1530 # 8042a000 <disk+0x2000>
    80205602:	000a3a83          	ld	s5,0(s4)
    80205606:	9aa6                	add	s5,s5,s1
    80205608:	f8040593          	addi	a1,s0,-128
    8020560c:	6d28                	ld	a0,88(a0)
    8020560e:	ffffb097          	auipc	ra,0xffffb
    80205612:	6aa080e7          	jalr	1706(ra) # 80200cb8 <kwalkaddr>
    80205616:	00aab023          	sd	a0,0(s5) # fffffffffff83000 <kernel_end+0xffffffff7fb53000>
  disk.desc[idx[0]].len = sizeof(buf0);
    8020561a:	000a3783          	ld	a5,0(s4)
    8020561e:	97a6                	add	a5,a5,s1
    80205620:	4741                	li	a4,16
    80205622:	c798                	sw	a4,8(a5)
  disk.desc[idx[0]].flags = VRING_DESC_F_NEXT;
    80205624:	000a3783          	ld	a5,0(s4)
    80205628:	97a6                	add	a5,a5,s1
    8020562a:	4705                	li	a4,1
    8020562c:	00e79623          	sh	a4,12(a5)
  disk.desc[idx[0]].next = idx[1];
    80205630:	f9442703          	lw	a4,-108(s0)
    80205634:	000a3783          	ld	a5,0(s4)
    80205638:	97a6                	add	a5,a5,s1
    8020563a:	00e79723          	sh	a4,14(a5)

  disk.desc[idx[1]].addr = (uint64) b->data;
    8020563e:	0712                	slli	a4,a4,0x4
    80205640:	000a3783          	ld	a5,0(s4)
    80205644:	97ba                	add	a5,a5,a4
    80205646:	05890693          	addi	a3,s2,88
    8020564a:	e394                	sd	a3,0(a5)
  disk.desc[idx[1]].len = BSIZE;
    8020564c:	000a3783          	ld	a5,0(s4)
    80205650:	97ba                	add	a5,a5,a4
    80205652:	20000693          	li	a3,512
    80205656:	c794                	sw	a3,8(a5)
  if(write)
    80205658:	100c8c63          	beqz	s9,80205770 <virtio_disk_rw+0x266>
    disk.desc[idx[1]].flags = 0; // device reads b->data
    8020565c:	00225797          	auipc	a5,0x225
    80205660:	9a47b783          	ld	a5,-1628(a5) # 8042a000 <disk+0x2000>
    80205664:	97ba                	add	a5,a5,a4
    80205666:	00079623          	sh	zero,12(a5)
  else
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
  disk.desc[idx[1]].flags |= VRING_DESC_F_NEXT;
    8020566a:	00223517          	auipc	a0,0x223
    8020566e:	99650513          	addi	a0,a0,-1642 # 80428000 <disk>
    80205672:	00225797          	auipc	a5,0x225
    80205676:	98e78793          	addi	a5,a5,-1650 # 8042a000 <disk+0x2000>
    8020567a:	6394                	ld	a3,0(a5)
    8020567c:	96ba                	add	a3,a3,a4
    8020567e:	00c6d603          	lhu	a2,12(a3)
    80205682:	00166613          	ori	a2,a2,1
    80205686:	00c69623          	sh	a2,12(a3)
  disk.desc[idx[1]].next = idx[2];
    8020568a:	f9842683          	lw	a3,-104(s0)
    8020568e:	6390                	ld	a2,0(a5)
    80205690:	9732                	add	a4,a4,a2
    80205692:	00d71723          	sh	a3,14(a4)

  disk.info[idx[0]].status = 0;
    80205696:	20098613          	addi	a2,s3,512
    8020569a:	0612                	slli	a2,a2,0x4
    8020569c:	962a                	add	a2,a2,a0
    8020569e:	02060823          	sb	zero,48(a2) # 2030 <_entry-0x801fdfd0>
  disk.desc[idx[2]].addr = (uint64) &disk.info[idx[0]].status;
    802056a2:	00469713          	slli	a4,a3,0x4
    802056a6:	6394                	ld	a3,0(a5)
    802056a8:	96ba                	add	a3,a3,a4
    802056aa:	6589                	lui	a1,0x2
    802056ac:	03058593          	addi	a1,a1,48 # 2030 <_entry-0x801fdfd0>
    802056b0:	94ae                	add	s1,s1,a1
    802056b2:	94aa                	add	s1,s1,a0
    802056b4:	e284                	sd	s1,0(a3)
  disk.desc[idx[2]].len = 1;
    802056b6:	6394                	ld	a3,0(a5)
    802056b8:	96ba                	add	a3,a3,a4
    802056ba:	4585                	li	a1,1
    802056bc:	c68c                	sw	a1,8(a3)
  disk.desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
    802056be:	6394                	ld	a3,0(a5)
    802056c0:	96ba                	add	a3,a3,a4
    802056c2:	4509                	li	a0,2
    802056c4:	00a69623          	sh	a0,12(a3)
  disk.desc[idx[2]].next = 0;
    802056c8:	6394                	ld	a3,0(a5)
    802056ca:	9736                	add	a4,a4,a3
    802056cc:	00071723          	sh	zero,14(a4)

  // record struct buf for virtio_disk_intr().
  b->disk = 1;
    802056d0:	00b92223          	sw	a1,4(s2)
  disk.info[idx[0]].b = b;
    802056d4:	03263423          	sd	s2,40(a2)

  // avail[0] is flags
  // avail[1] tells the device how far to look in avail[2...].
  // avail[2...] are desc[] indices the device should process.
  // we only tell device the first index in our chain of descriptors.
  disk.avail[2 + (disk.avail[1] % NUM)] = idx[0];
    802056d8:	6794                	ld	a3,8(a5)
    802056da:	0026d703          	lhu	a4,2(a3)
    802056de:	8b1d                	andi	a4,a4,7
    802056e0:	2709                	addiw	a4,a4,2
    802056e2:	0706                	slli	a4,a4,0x1
    802056e4:	9736                	add	a4,a4,a3
    802056e6:	01371023          	sh	s3,0(a4)
  __sync_synchronize();
    802056ea:	0ff0000f          	fence
  disk.avail[1] = disk.avail[1] + 1;
    802056ee:	6798                	ld	a4,8(a5)
    802056f0:	00275783          	lhu	a5,2(a4)
    802056f4:	2785                	addiw	a5,a5,1
    802056f6:	00f71123          	sh	a5,2(a4)

  *R(VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number
    802056fa:	00005797          	auipc	a5,0x5
    802056fe:	b167b783          	ld	a5,-1258(a5) # 8020a210 <erodata+0x5b>
    80205702:	0007a023          	sw	zero,0(a5)

  // Wait for virtio_disk_intr() to say request has finished.
  while(b->disk == 1) {
    80205706:	00492703          	lw	a4,4(s2)
    8020570a:	4785                	li	a5,1
    8020570c:	02f71163          	bne	a4,a5,8020572e <virtio_disk_rw+0x224>
    sleep(b, &disk.vdisk_lock);
    80205710:	00225997          	auipc	s3,0x225
    80205714:	99898993          	addi	s3,s3,-1640 # 8042a0a8 <disk+0x20a8>
  while(b->disk == 1) {
    80205718:	4485                	li	s1,1
    sleep(b, &disk.vdisk_lock);
    8020571a:	85ce                	mv	a1,s3
    8020571c:	854a                	mv	a0,s2
    8020571e:	ffffd097          	auipc	ra,0xffffd
    80205722:	d00080e7          	jalr	-768(ra) # 8020241e <sleep>
  while(b->disk == 1) {
    80205726:	00492783          	lw	a5,4(s2)
    8020572a:	fe9788e3          	beq	a5,s1,8020571a <virtio_disk_rw+0x210>
  }

  disk.info[idx[0]].b = 0;
    8020572e:	f9042483          	lw	s1,-112(s0)
    80205732:	20048793          	addi	a5,s1,512
    80205736:	00479713          	slli	a4,a5,0x4
    8020573a:	00223797          	auipc	a5,0x223
    8020573e:	8c678793          	addi	a5,a5,-1850 # 80428000 <disk>
    80205742:	97ba                	add	a5,a5,a4
    80205744:	0207b423          	sd	zero,40(a5)
    if(disk.desc[i].flags & VRING_DESC_F_NEXT)
    80205748:	00225917          	auipc	s2,0x225
    8020574c:	8b890913          	addi	s2,s2,-1864 # 8042a000 <disk+0x2000>
    free_desc(i);
    80205750:	8526                	mv	a0,s1
    80205752:	00000097          	auipc	ra,0x0
    80205756:	b9e080e7          	jalr	-1122(ra) # 802052f0 <free_desc>
    if(disk.desc[i].flags & VRING_DESC_F_NEXT)
    8020575a:	0492                	slli	s1,s1,0x4
    8020575c:	00093783          	ld	a5,0(s2)
    80205760:	94be                	add	s1,s1,a5
    80205762:	00c4d783          	lhu	a5,12(s1)
    80205766:	8b85                	andi	a5,a5,1
    80205768:	cf89                	beqz	a5,80205782 <virtio_disk_rw+0x278>
      i = disk.desc[i].next;
    8020576a:	00e4d483          	lhu	s1,14(s1)
    free_desc(i);
    8020576e:	b7cd                	j	80205750 <virtio_disk_rw+0x246>
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
    80205770:	00225797          	auipc	a5,0x225
    80205774:	8907b783          	ld	a5,-1904(a5) # 8042a000 <disk+0x2000>
    80205778:	97ba                	add	a5,a5,a4
    8020577a:	4689                	li	a3,2
    8020577c:	00d79623          	sh	a3,12(a5)
    80205780:	b5ed                	j	8020566a <virtio_disk_rw+0x160>
  free_chain(idx[0]);

  release(&disk.vdisk_lock);
    80205782:	00225517          	auipc	a0,0x225
    80205786:	92650513          	addi	a0,a0,-1754 # 8042a0a8 <disk+0x20a8>
    8020578a:	ffffb097          	auipc	ra,0xffffb
    8020578e:	fbe080e7          	jalr	-66(ra) # 80200748 <release>
}
    80205792:	70e6                	ld	ra,120(sp)
    80205794:	7446                	ld	s0,112(sp)
    80205796:	74a6                	ld	s1,104(sp)
    80205798:	7906                	ld	s2,96(sp)
    8020579a:	69e6                	ld	s3,88(sp)
    8020579c:	6a46                	ld	s4,80(sp)
    8020579e:	6aa6                	ld	s5,72(sp)
    802057a0:	6b06                	ld	s6,64(sp)
    802057a2:	7be2                	ld	s7,56(sp)
    802057a4:	7c42                	ld	s8,48(sp)
    802057a6:	7ca2                	ld	s9,40(sp)
    802057a8:	7d02                	ld	s10,32(sp)
    802057aa:	6109                	addi	sp,sp,128
    802057ac:	8082                	ret
  if(write)
    802057ae:	e20c97e3          	bnez	s9,802055dc <virtio_disk_rw+0xd2>
    buf0.type = VIRTIO_BLK_T_IN; // read the disk
    802057b2:	f8042023          	sw	zero,-128(s0)
    802057b6:	b535                	j	802055e2 <virtio_disk_rw+0xd8>

00000000802057b8 <virtio_disk_intr>:

void
virtio_disk_intr()
{
    802057b8:	1101                	addi	sp,sp,-32
    802057ba:	ec06                	sd	ra,24(sp)
    802057bc:	e822                	sd	s0,16(sp)
    802057be:	e426                	sd	s1,8(sp)
    802057c0:	e04a                	sd	s2,0(sp)
    802057c2:	1000                	addi	s0,sp,32
  acquire(&disk.vdisk_lock);
    802057c4:	00225517          	auipc	a0,0x225
    802057c8:	8e450513          	addi	a0,a0,-1820 # 8042a0a8 <disk+0x20a8>
    802057cc:	ffffb097          	auipc	ra,0xffffb
    802057d0:	f28080e7          	jalr	-216(ra) # 802006f4 <acquire>

  while((disk.used_idx % NUM) != (disk.used->id % NUM)){
    802057d4:	00225717          	auipc	a4,0x225
    802057d8:	82c70713          	addi	a4,a4,-2004 # 8042a000 <disk+0x2000>
    802057dc:	02075783          	lhu	a5,32(a4)
    802057e0:	6b18                	ld	a4,16(a4)
    802057e2:	00275683          	lhu	a3,2(a4)
    802057e6:	8ebd                	xor	a3,a3,a5
    802057e8:	8a9d                	andi	a3,a3,7
    802057ea:	cab9                	beqz	a3,80205840 <virtio_disk_intr+0x88>
    int id = disk.used->elems[disk.used_idx].id;

    if(disk.info[id].status != 0)
    802057ec:	00223917          	auipc	s2,0x223
    802057f0:	81490913          	addi	s2,s2,-2028 # 80428000 <disk>
      panic("virtio_disk_intr status");
    
    disk.info[id].b->disk = 0;   // disk is done with buf
    wakeup(disk.info[id].b);

    disk.used_idx = (disk.used_idx + 1) % NUM;
    802057f4:	00225497          	auipc	s1,0x225
    802057f8:	80c48493          	addi	s1,s1,-2036 # 8042a000 <disk+0x2000>
    int id = disk.used->elems[disk.used_idx].id;
    802057fc:	078e                	slli	a5,a5,0x3
    802057fe:	97ba                	add	a5,a5,a4
    80205800:	43dc                	lw	a5,4(a5)
    if(disk.info[id].status != 0)
    80205802:	20078713          	addi	a4,a5,512
    80205806:	0712                	slli	a4,a4,0x4
    80205808:	974a                	add	a4,a4,s2
    8020580a:	03074703          	lbu	a4,48(a4)
    8020580e:	e335                	bnez	a4,80205872 <virtio_disk_intr+0xba>
    disk.info[id].b->disk = 0;   // disk is done with buf
    80205810:	20078793          	addi	a5,a5,512
    80205814:	0792                	slli	a5,a5,0x4
    80205816:	97ca                	add	a5,a5,s2
    80205818:	7798                	ld	a4,40(a5)
    8020581a:	00072223          	sw	zero,4(a4)
    wakeup(disk.info[id].b);
    8020581e:	7788                	ld	a0,40(a5)
    80205820:	ffffd097          	auipc	ra,0xffffd
    80205824:	d80080e7          	jalr	-640(ra) # 802025a0 <wakeup>
    disk.used_idx = (disk.used_idx + 1) % NUM;
    80205828:	0204d783          	lhu	a5,32(s1)
    8020582c:	2785                	addiw	a5,a5,1
    8020582e:	8b9d                	andi	a5,a5,7
    80205830:	02f49023          	sh	a5,32(s1)
  while((disk.used_idx % NUM) != (disk.used->id % NUM)){
    80205834:	6898                	ld	a4,16(s1)
    80205836:	00275683          	lhu	a3,2(a4)
    8020583a:	8a9d                	andi	a3,a3,7
    8020583c:	fcf690e3          	bne	a3,a5,802057fc <virtio_disk_intr+0x44>
  }
  *R(VIRTIO_MMIO_INTERRUPT_ACK) = *R(VIRTIO_MMIO_INTERRUPT_STATUS) & 0x3;
    80205840:	00005797          	auipc	a5,0x5
    80205844:	9d87b783          	ld	a5,-1576(a5) # 8020a218 <erodata+0x63>
    80205848:	439c                	lw	a5,0(a5)
    8020584a:	8b8d                	andi	a5,a5,3
    8020584c:	00005717          	auipc	a4,0x5
    80205850:	9d473703          	ld	a4,-1580(a4) # 8020a220 <erodata+0x6b>
    80205854:	c31c                	sw	a5,0(a4)

  release(&disk.vdisk_lock);
    80205856:	00225517          	auipc	a0,0x225
    8020585a:	85250513          	addi	a0,a0,-1966 # 8042a0a8 <disk+0x20a8>
    8020585e:	ffffb097          	auipc	ra,0xffffb
    80205862:	eea080e7          	jalr	-278(ra) # 80200748 <release>
}
    80205866:	60e2                	ld	ra,24(sp)
    80205868:	6442                	ld	s0,16(sp)
    8020586a:	64a2                	ld	s1,8(sp)
    8020586c:	6902                	ld	s2,0(sp)
    8020586e:	6105                	addi	sp,sp,32
    80205870:	8082                	ret
      panic("virtio_disk_intr status");
    80205872:	00004517          	auipc	a0,0x4
    80205876:	6d650513          	addi	a0,a0,1750 # 80209f48 <sysnames+0x2e8>
    8020587a:	ffffb097          	auipc	ra,0xffffb
    8020587e:	8ca080e7          	jalr	-1846(ra) # 80200144 <panic>

0000000080205882 <disk_init>:
#include "include/virtio.h"
#endif
#endif 

void disk_init(void)
{
    80205882:	1141                	addi	sp,sp,-16
    80205884:	e406                	sd	ra,8(sp)
    80205886:	e022                	sd	s0,0(sp)
    80205888:	0800                	addi	s0,sp,16
    #ifdef QEMU
    #if QEMU!=SIFIVE_U
    virtio_disk_init();
    #else
    // sdcard_init();
    ramdisk_init();
    8020588a:	00000097          	auipc	ra,0x0
    8020588e:	992080e7          	jalr	-1646(ra) # 8020521c <ramdisk_init>
    #endif
    #else 
    // sdcard_init();
    ramdisk_init();
    #endif
}
    80205892:	60a2                	ld	ra,8(sp)
    80205894:	6402                	ld	s0,0(sp)
    80205896:	0141                	addi	sp,sp,16
    80205898:	8082                	ret

000000008020589a <disk_read>:

void disk_read(struct buf *b)
{
    8020589a:	1141                	addi	sp,sp,-16
    8020589c:	e406                	sd	ra,8(sp)
    8020589e:	e022                	sd	s0,0(sp)
    802058a0:	0800                	addi	s0,sp,16
    #if QEMU!=SIFIVE_U
	virtio_disk_rw(b, 0);
    
    #else
	// sdcard_read_sector(b->data, b->sectorno);
	ramdisk_rw(b, 0);
    802058a2:	4581                	li	a1,0
    802058a4:	00000097          	auipc	ra,0x0
    802058a8:	9a0080e7          	jalr	-1632(ra) # 80205244 <ramdisk_rw>
    #endif
    #else 
	// sdcard_read_sector(b->data, b->sectorno);
	ramdisk_rw(b, 0);
	#endif
}
    802058ac:	60a2                	ld	ra,8(sp)
    802058ae:	6402                	ld	s0,0(sp)
    802058b0:	0141                	addi	sp,sp,16
    802058b2:	8082                	ret

00000000802058b4 <disk_write>:

void disk_write(struct buf *b)
{
    802058b4:	1141                	addi	sp,sp,-16
    802058b6:	e406                	sd	ra,8(sp)
    802058b8:	e022                	sd	s0,0(sp)
    802058ba:	0800                	addi	s0,sp,16
    #ifdef QEMU
    #if QEMU!=SIFIVE_U
	virtio_disk_rw(b, 1);    
    #else
    	// sdcard_write_sector(b->data, b->sectorno);
    	ramdisk_rw(b, 1);
    802058bc:	4585                	li	a1,1
    802058be:	00000097          	auipc	ra,0x0
    802058c2:	986080e7          	jalr	-1658(ra) # 80205244 <ramdisk_rw>
    #endif
    #else 
	// sdcard_write_sector(b->data, b->sectorno);
	ramdisk_rw(b, 1);
	#endif
}
    802058c6:	60a2                	ld	ra,8(sp)
    802058c8:	6402                	ld	s0,0(sp)
    802058ca:	0141                	addi	sp,sp,16
    802058cc:	8082                	ret

00000000802058ce <disk_intr>:

void disk_intr(void)
{
    802058ce:	1141                	addi	sp,sp,-16
    802058d0:	e422                	sd	s0,8(sp)
    802058d2:	0800                	addi	s0,sp,16
        // dmac_intr(DMAC_CHANNEL0);
    #endif
    #else 
    // dmac_intr(DMAC_CHANNEL0);
    #endif
}
    802058d4:	6422                	ld	s0,8(sp)
    802058d6:	0141                	addi	sp,sp,16
    802058d8:	8082                	ret

00000000802058da <read_fat>:
/**
 * Read the FAT table content corresponded to the given cluster number.
 * @param   cluster     the number of cluster which you want to read its content in FAT table
 */
static uint32 read_fat(uint32 cluster)
{
    802058da:	1101                	addi	sp,sp,-32
    802058dc:	ec06                	sd	ra,24(sp)
    802058de:	e822                	sd	s0,16(sp)
    802058e0:	e426                	sd	s1,8(sp)
    802058e2:	e04a                	sd	s2,0(sp)
    802058e4:	1000                	addi	s0,sp,32
    if (cluster >= FAT32_EOC) {
    802058e6:	100007b7          	lui	a5,0x10000
    802058ea:	17dd                	addi	a5,a5,-9
        return cluster;
    802058ec:	84aa                	mv	s1,a0
    if (cluster >= FAT32_EOC) {
    802058ee:	00a7ea63          	bltu	a5,a0,80205902 <read_fat+0x28>
    }
    if (cluster > fat.data_clus_cnt + 1) {     // because cluster number starts at 2, not 0
    802058f2:	00225797          	auipc	a5,0x225
    802058f6:	7167a783          	lw	a5,1814(a5) # 8042b008 <fat+0x8>
    802058fa:	2785                	addiw	a5,a5,1
        return 0;
    802058fc:	4481                	li	s1,0
    if (cluster > fat.data_clus_cnt + 1) {     // because cluster number starts at 2, not 0
    802058fe:	00a7f963          	bgeu	a5,a0,80205910 <read_fat+0x36>
    // here should be a cache layer for FAT table, but not implemented yet.
    struct buf *b = bread(0, fat_sec);
    uint32 next_clus = *(uint32 *)(b->data + fat_offset_of_clus(cluster));
    brelse(b);
    return next_clus;
}
    80205902:	8526                	mv	a0,s1
    80205904:	60e2                	ld	ra,24(sp)
    80205906:	6442                	ld	s0,16(sp)
    80205908:	64a2                	ld	s1,8(sp)
    8020590a:	6902                	ld	s2,0(sp)
    8020590c:	6105                	addi	sp,sp,32
    8020590e:	8082                	ret
    return fat.bpb.rsvd_sec_cnt + (cluster << 2) / fat.bpb.byts_per_sec + fat.bpb.fat_sz * (fat_num - 1);
    80205910:	0025149b          	slliw	s1,a0,0x2
    80205914:	00225917          	auipc	s2,0x225
    80205918:	6ec90913          	addi	s2,s2,1772 # 8042b000 <fat>
    8020591c:	01095783          	lhu	a5,16(s2)
    80205920:	02f4d7bb          	divuw	a5,s1,a5
    80205924:	01495583          	lhu	a1,20(s2)
    struct buf *b = bread(0, fat_sec);
    80205928:	9dbd                	addw	a1,a1,a5
    8020592a:	4501                	li	a0,0
    8020592c:	ffffe097          	auipc	ra,0xffffe
    80205930:	bf2080e7          	jalr	-1038(ra) # 8020351e <bread>
    return (cluster << 2) % fat.bpb.byts_per_sec;
    80205934:	01095783          	lhu	a5,16(s2)
    80205938:	02f4f4bb          	remuw	s1,s1,a5
    uint32 next_clus = *(uint32 *)(b->data + fat_offset_of_clus(cluster));
    8020593c:	1482                	slli	s1,s1,0x20
    8020593e:	9081                	srli	s1,s1,0x20
    80205940:	94aa                	add	s1,s1,a0
    80205942:	4ca4                	lw	s1,88(s1)
    brelse(b);
    80205944:	ffffe097          	auipc	ra,0xffffe
    80205948:	d06080e7          	jalr	-762(ra) # 8020364a <brelse>
    return next_clus;
    8020594c:	bf5d                	j	80205902 <read_fat+0x28>

000000008020594e <alloc_clus>:
        brelse(b);
    }
}

static uint32 alloc_clus(uint8 dev)
{
    8020594e:	711d                	addi	sp,sp,-96
    80205950:	ec86                	sd	ra,88(sp)
    80205952:	e8a2                	sd	s0,80(sp)
    80205954:	e4a6                	sd	s1,72(sp)
    80205956:	e0ca                	sd	s2,64(sp)
    80205958:	fc4e                	sd	s3,56(sp)
    8020595a:	f852                	sd	s4,48(sp)
    8020595c:	f456                	sd	s5,40(sp)
    8020595e:	f05a                	sd	s6,32(sp)
    80205960:	ec5e                	sd	s7,24(sp)
    80205962:	e862                	sd	s8,16(sp)
    80205964:	e466                	sd	s9,8(sp)
    80205966:	1080                	addi	s0,sp,96
    // should we keep a free cluster list? instead of searching fat every time.
    struct buf *b;
    uint32 sec = fat.bpb.rsvd_sec_cnt;
    80205968:	00225797          	auipc	a5,0x225
    8020596c:	69878793          	addi	a5,a5,1688 # 8042b000 <fat>
    80205970:	0147db83          	lhu	s7,20(a5)
    uint32 const ent_per_sec = fat.bpb.byts_per_sec / sizeof(uint32);
    80205974:	0107d903          	lhu	s2,16(a5)
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    80205978:	539c                	lw	a5,32(a5)
    8020597a:	10078263          	beqz	a5,80205a7e <alloc_clus+0x130>
    8020597e:	0029591b          	srliw	s2,s2,0x2
    80205982:	0009099b          	sext.w	s3,s2
    80205986:	4b01                	li	s6,0
        b = bread(dev, sec);
    80205988:	00050a9b          	sext.w	s5,a0
        for (uint32 j = 0; j < ent_per_sec; j++) {
    8020598c:	4c01                	li	s8,0
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    8020598e:	00225c97          	auipc	s9,0x225
    80205992:	672c8c93          	addi	s9,s9,1650 # 8042b000 <fat>
    80205996:	a0c1                	j	80205a56 <alloc_clus+0x108>
            if (((uint32 *)(b->data))[j] == 0) {
                ((uint32 *)(b->data))[j] = FAT32_EOC + 7;
    80205998:	100007b7          	lui	a5,0x10000
    8020599c:	37fd                	addiw	a5,a5,-1
    8020599e:	c29c                	sw	a5,0(a3)
                bwrite(b);
    802059a0:	8552                	mv	a0,s4
    802059a2:	ffffe097          	auipc	ra,0xffffe
    802059a6:	c6c080e7          	jalr	-916(ra) # 8020360e <bwrite>
                brelse(b);
    802059aa:	8552                	mv	a0,s4
    802059ac:	ffffe097          	auipc	ra,0xffffe
    802059b0:	c9e080e7          	jalr	-866(ra) # 8020364a <brelse>
                uint32 clus = i * ent_per_sec + j;
    802059b4:	0369093b          	mulw	s2,s2,s6
    802059b8:	009904bb          	addw	s1,s2,s1
    802059bc:	00048a9b          	sext.w	s5,s1
    return ((cluster - 2) * fat.bpb.sec_per_clus) + fat.first_data_sec;
    802059c0:	00225717          	auipc	a4,0x225
    802059c4:	64070713          	addi	a4,a4,1600 # 8042b000 <fat>
    802059c8:	01274783          	lbu	a5,18(a4)
    802059cc:	34f9                	addiw	s1,s1,-2
    802059ce:	02f489bb          	mulw	s3,s1,a5
    802059d2:	4318                	lw	a4,0(a4)
    802059d4:	00e989bb          	addw	s3,s3,a4
    for (int i = 0; i < fat.bpb.sec_per_clus; i++) {
    802059d8:	c7b1                	beqz	a5,80205a24 <alloc_clus+0xd6>
    802059da:	4901                	li	s2,0
    802059dc:	00225a17          	auipc	s4,0x225
    802059e0:	624a0a13          	addi	s4,s4,1572 # 8042b000 <fat>
        b = bread(0, sec++);
    802059e4:	013905bb          	addw	a1,s2,s3
    802059e8:	4501                	li	a0,0
    802059ea:	ffffe097          	auipc	ra,0xffffe
    802059ee:	b34080e7          	jalr	-1228(ra) # 8020351e <bread>
    802059f2:	84aa                	mv	s1,a0
        memset(b->data, 0, BSIZE);
    802059f4:	20000613          	li	a2,512
    802059f8:	4581                	li	a1,0
    802059fa:	05850513          	addi	a0,a0,88
    802059fe:	ffffb097          	auipc	ra,0xffffb
    80205a02:	d92080e7          	jalr	-622(ra) # 80200790 <memset>
        bwrite(b);
    80205a06:	8526                	mv	a0,s1
    80205a08:	ffffe097          	auipc	ra,0xffffe
    80205a0c:	c06080e7          	jalr	-1018(ra) # 8020360e <bwrite>
        brelse(b);
    80205a10:	8526                	mv	a0,s1
    80205a12:	ffffe097          	auipc	ra,0xffffe
    80205a16:	c38080e7          	jalr	-968(ra) # 8020364a <brelse>
    for (int i = 0; i < fat.bpb.sec_per_clus; i++) {
    80205a1a:	2905                	addiw	s2,s2,1
    80205a1c:	012a4783          	lbu	a5,18(s4)
    80205a20:	fcf942e3          	blt	s2,a5,802059e4 <alloc_clus+0x96>
            }
        }
        brelse(b);
    }
    panic("no clusters");
}
    80205a24:	8556                	mv	a0,s5
    80205a26:	60e6                	ld	ra,88(sp)
    80205a28:	6446                	ld	s0,80(sp)
    80205a2a:	64a6                	ld	s1,72(sp)
    80205a2c:	6906                	ld	s2,64(sp)
    80205a2e:	79e2                	ld	s3,56(sp)
    80205a30:	7a42                	ld	s4,48(sp)
    80205a32:	7aa2                	ld	s5,40(sp)
    80205a34:	7b02                	ld	s6,32(sp)
    80205a36:	6be2                	ld	s7,24(sp)
    80205a38:	6c42                	ld	s8,16(sp)
    80205a3a:	6ca2                	ld	s9,8(sp)
    80205a3c:	6125                	addi	sp,sp,96
    80205a3e:	8082                	ret
        brelse(b);
    80205a40:	8552                	mv	a0,s4
    80205a42:	ffffe097          	auipc	ra,0xffffe
    80205a46:	c08080e7          	jalr	-1016(ra) # 8020364a <brelse>
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    80205a4a:	2b05                	addiw	s6,s6,1
    80205a4c:	2b85                	addiw	s7,s7,1
    80205a4e:	020ca783          	lw	a5,32(s9)
    80205a52:	02fb7663          	bgeu	s6,a5,80205a7e <alloc_clus+0x130>
        b = bread(dev, sec);
    80205a56:	85de                	mv	a1,s7
    80205a58:	8556                	mv	a0,s5
    80205a5a:	ffffe097          	auipc	ra,0xffffe
    80205a5e:	ac4080e7          	jalr	-1340(ra) # 8020351e <bread>
    80205a62:	8a2a                	mv	s4,a0
        for (uint32 j = 0; j < ent_per_sec; j++) {
    80205a64:	fc098ee3          	beqz	s3,80205a40 <alloc_clus+0xf2>
    80205a68:	05850793          	addi	a5,a0,88
    80205a6c:	84e2                	mv	s1,s8
            if (((uint32 *)(b->data))[j] == 0) {
    80205a6e:	86be                	mv	a3,a5
    80205a70:	4398                	lw	a4,0(a5)
    80205a72:	d31d                	beqz	a4,80205998 <alloc_clus+0x4a>
        for (uint32 j = 0; j < ent_per_sec; j++) {
    80205a74:	2485                	addiw	s1,s1,1
    80205a76:	0791                	addi	a5,a5,4
    80205a78:	fe999be3          	bne	s3,s1,80205a6e <alloc_clus+0x120>
    80205a7c:	b7d1                	j	80205a40 <alloc_clus+0xf2>
    panic("no clusters");
    80205a7e:	00004517          	auipc	a0,0x4
    80205a82:	4e250513          	addi	a0,a0,1250 # 80209f60 <sysnames+0x300>
    80205a86:	ffffa097          	auipc	ra,0xffffa
    80205a8a:	6be080e7          	jalr	1726(ra) # 80200144 <panic>

0000000080205a8e <write_fat>:
    if (cluster > fat.data_clus_cnt + 1) {
    80205a8e:	00225797          	auipc	a5,0x225
    80205a92:	57a7a783          	lw	a5,1402(a5) # 8042b008 <fat+0x8>
    80205a96:	2785                	addiw	a5,a5,1
    80205a98:	06a7e963          	bltu	a5,a0,80205b0a <write_fat+0x7c>
{
    80205a9c:	7179                	addi	sp,sp,-48
    80205a9e:	f406                	sd	ra,40(sp)
    80205aa0:	f022                	sd	s0,32(sp)
    80205aa2:	ec26                	sd	s1,24(sp)
    80205aa4:	e84a                	sd	s2,16(sp)
    80205aa6:	e44e                	sd	s3,8(sp)
    80205aa8:	e052                	sd	s4,0(sp)
    80205aaa:	1800                	addi	s0,sp,48
    80205aac:	89ae                	mv	s3,a1
    return fat.bpb.rsvd_sec_cnt + (cluster << 2) / fat.bpb.byts_per_sec + fat.bpb.fat_sz * (fat_num - 1);
    80205aae:	0025149b          	slliw	s1,a0,0x2
    80205ab2:	00225a17          	auipc	s4,0x225
    80205ab6:	54ea0a13          	addi	s4,s4,1358 # 8042b000 <fat>
    80205aba:	010a5783          	lhu	a5,16(s4)
    80205abe:	02f4d7bb          	divuw	a5,s1,a5
    80205ac2:	014a5583          	lhu	a1,20(s4)
    struct buf *b = bread(0, fat_sec);
    80205ac6:	9dbd                	addw	a1,a1,a5
    80205ac8:	4501                	li	a0,0
    80205aca:	ffffe097          	auipc	ra,0xffffe
    80205ace:	a54080e7          	jalr	-1452(ra) # 8020351e <bread>
    80205ad2:	892a                	mv	s2,a0
    return (cluster << 2) % fat.bpb.byts_per_sec;
    80205ad4:	010a5783          	lhu	a5,16(s4)
    80205ad8:	02f4f4bb          	remuw	s1,s1,a5
    *(uint32 *)(b->data + off) = content;
    80205adc:	1482                	slli	s1,s1,0x20
    80205ade:	9081                	srli	s1,s1,0x20
    80205ae0:	94aa                	add	s1,s1,a0
    80205ae2:	0534ac23          	sw	s3,88(s1)
    bwrite(b);
    80205ae6:	ffffe097          	auipc	ra,0xffffe
    80205aea:	b28080e7          	jalr	-1240(ra) # 8020360e <bwrite>
    brelse(b);
    80205aee:	854a                	mv	a0,s2
    80205af0:	ffffe097          	auipc	ra,0xffffe
    80205af4:	b5a080e7          	jalr	-1190(ra) # 8020364a <brelse>
    return 0;
    80205af8:	4501                	li	a0,0
}
    80205afa:	70a2                	ld	ra,40(sp)
    80205afc:	7402                	ld	s0,32(sp)
    80205afe:	64e2                	ld	s1,24(sp)
    80205b00:	6942                	ld	s2,16(sp)
    80205b02:	69a2                	ld	s3,8(sp)
    80205b04:	6a02                	ld	s4,0(sp)
    80205b06:	6145                	addi	sp,sp,48
    80205b08:	8082                	ret
        return -1;
    80205b0a:	557d                	li	a0,-1
}
    80205b0c:	8082                	ret

0000000080205b0e <reloc_clus>:
 * @param   off         the offset from the beginning of the relative file
 * @param   alloc       whether alloc new cluster when meeting end of FAT chains
 * @return              the offset from the new cur_clus
 */
static int reloc_clus(struct dirent *entry, uint off, int alloc)
{
    80205b0e:	715d                	addi	sp,sp,-80
    80205b10:	e486                	sd	ra,72(sp)
    80205b12:	e0a2                	sd	s0,64(sp)
    80205b14:	fc26                	sd	s1,56(sp)
    80205b16:	f84a                	sd	s2,48(sp)
    80205b18:	f44e                	sd	s3,40(sp)
    80205b1a:	f052                	sd	s4,32(sp)
    80205b1c:	ec56                	sd	s5,24(sp)
    80205b1e:	e85a                	sd	s6,16(sp)
    80205b20:	e45e                	sd	s7,8(sp)
    80205b22:	0880                	addi	s0,sp,80
    80205b24:	84aa                	mv	s1,a0
    80205b26:	8a2e                	mv	s4,a1
    int clus_num = off / fat.byts_per_clus;
    80205b28:	00225b97          	auipc	s7,0x225
    80205b2c:	4e4bab83          	lw	s7,1252(s7) # 8042b00c <fat+0xc>
    80205b30:	0375d9bb          	divuw	s3,a1,s7
    while (clus_num > entry->clus_cnt) {
    80205b34:	11052703          	lw	a4,272(a0)
    80205b38:	07377663          	bgeu	a4,s3,80205ba4 <reloc_clus+0x96>
    80205b3c:	8b32                	mv	s6,a2
        int clus = read_fat(entry->cur_clus);
        if (clus >= FAT32_EOC) {
    80205b3e:	10000ab7          	lui	s5,0x10000
    80205b42:	1add                	addi	s5,s5,-9
    80205b44:	a025                	j	80205b6c <reloc_clus+0x5e>
            if (alloc) {
                clus = alloc_clus(entry->dev);
                write_fat(entry->cur_clus, clus);
            } else {
                entry->cur_clus = entry->first_clus;
    80205b46:	1044a783          	lw	a5,260(s1)
    80205b4a:	10f4a623          	sw	a5,268(s1)
                entry->clus_cnt = 0;
    80205b4e:	1004a823          	sw	zero,272(s1)
                return -1;
    80205b52:	557d                	li	a0,-1
    80205b54:	a879                	j	80205bf2 <reloc_clus+0xe4>
            }
        }
        entry->cur_clus = clus;
    80205b56:	1124a623          	sw	s2,268(s1)
        entry->clus_cnt++;
    80205b5a:	1104a783          	lw	a5,272(s1)
    80205b5e:	2785                	addiw	a5,a5,1
    80205b60:	0007871b          	sext.w	a4,a5
    80205b64:	10f4a823          	sw	a5,272(s1)
    while (clus_num > entry->clus_cnt) {
    80205b68:	03377e63          	bgeu	a4,s3,80205ba4 <reloc_clus+0x96>
        int clus = read_fat(entry->cur_clus);
    80205b6c:	10c4a503          	lw	a0,268(s1)
    80205b70:	00000097          	auipc	ra,0x0
    80205b74:	d6a080e7          	jalr	-662(ra) # 802058da <read_fat>
    80205b78:	0005091b          	sext.w	s2,a0
        if (clus >= FAT32_EOC) {
    80205b7c:	fd2adde3          	bge	s5,s2,80205b56 <reloc_clus+0x48>
            if (alloc) {
    80205b80:	fc0b03e3          	beqz	s6,80205b46 <reloc_clus+0x38>
                clus = alloc_clus(entry->dev);
    80205b84:	1144c503          	lbu	a0,276(s1)
    80205b88:	00000097          	auipc	ra,0x0
    80205b8c:	dc6080e7          	jalr	-570(ra) # 8020594e <alloc_clus>
    80205b90:	0005091b          	sext.w	s2,a0
                write_fat(entry->cur_clus, clus);
    80205b94:	85ca                	mv	a1,s2
    80205b96:	10c4a503          	lw	a0,268(s1)
    80205b9a:	00000097          	auipc	ra,0x0
    80205b9e:	ef4080e7          	jalr	-268(ra) # 80205a8e <write_fat>
    80205ba2:	bf55                	j	80205b56 <reloc_clus+0x48>
    }
    if (clus_num < entry->clus_cnt) {
    80205ba4:	04e9f163          	bgeu	s3,a4,80205be6 <reloc_clus+0xd8>
        entry->cur_clus = entry->first_clus;
    80205ba8:	1044a783          	lw	a5,260(s1)
    80205bac:	10f4a623          	sw	a5,268(s1)
        entry->clus_cnt = 0;
    80205bb0:	1004a823          	sw	zero,272(s1)
        while (entry->clus_cnt < clus_num) {
    80205bb4:	037a6963          	bltu	s4,s7,80205be6 <reloc_clus+0xd8>
            entry->cur_clus = read_fat(entry->cur_clus);
            if (entry->cur_clus >= FAT32_EOC) {
    80205bb8:	10000937          	lui	s2,0x10000
    80205bbc:	195d                	addi	s2,s2,-9
            entry->cur_clus = read_fat(entry->cur_clus);
    80205bbe:	10c4a503          	lw	a0,268(s1)
    80205bc2:	00000097          	auipc	ra,0x0
    80205bc6:	d18080e7          	jalr	-744(ra) # 802058da <read_fat>
    80205bca:	2501                	sext.w	a0,a0
    80205bcc:	10a4a623          	sw	a0,268(s1)
            if (entry->cur_clus >= FAT32_EOC) {
    80205bd0:	02a96c63          	bltu	s2,a0,80205c08 <reloc_clus+0xfa>
                panic("reloc_clus");
            }
            entry->clus_cnt++;
    80205bd4:	1104a783          	lw	a5,272(s1)
    80205bd8:	2785                	addiw	a5,a5,1
    80205bda:	0007871b          	sext.w	a4,a5
    80205bde:	10f4a823          	sw	a5,272(s1)
        while (entry->clus_cnt < clus_num) {
    80205be2:	fd376ee3          	bltu	a4,s3,80205bbe <reloc_clus+0xb0>
        }
    }
    return off % fat.byts_per_clus;
    80205be6:	00225517          	auipc	a0,0x225
    80205bea:	42652503          	lw	a0,1062(a0) # 8042b00c <fat+0xc>
    80205bee:	02aa753b          	remuw	a0,s4,a0
}
    80205bf2:	60a6                	ld	ra,72(sp)
    80205bf4:	6406                	ld	s0,64(sp)
    80205bf6:	74e2                	ld	s1,56(sp)
    80205bf8:	7942                	ld	s2,48(sp)
    80205bfa:	79a2                	ld	s3,40(sp)
    80205bfc:	7a02                	ld	s4,32(sp)
    80205bfe:	6ae2                	ld	s5,24(sp)
    80205c00:	6b42                	ld	s6,16(sp)
    80205c02:	6ba2                	ld	s7,8(sp)
    80205c04:	6161                	addi	sp,sp,80
    80205c06:	8082                	ret
                panic("reloc_clus");
    80205c08:	00004517          	auipc	a0,0x4
    80205c0c:	36850513          	addi	a0,a0,872 # 80209f70 <sysnames+0x310>
    80205c10:	ffffa097          	auipc	ra,0xffffa
    80205c14:	534080e7          	jalr	1332(ra) # 80200144 <panic>

0000000080205c18 <rw_clus>:
{
    80205c18:	7119                	addi	sp,sp,-128
    80205c1a:	fc86                	sd	ra,120(sp)
    80205c1c:	f8a2                	sd	s0,112(sp)
    80205c1e:	f4a6                	sd	s1,104(sp)
    80205c20:	f0ca                	sd	s2,96(sp)
    80205c22:	ecce                	sd	s3,88(sp)
    80205c24:	e8d2                	sd	s4,80(sp)
    80205c26:	e4d6                	sd	s5,72(sp)
    80205c28:	e0da                	sd	s6,64(sp)
    80205c2a:	fc5e                	sd	s7,56(sp)
    80205c2c:	f862                	sd	s8,48(sp)
    80205c2e:	f466                	sd	s9,40(sp)
    80205c30:	f06a                	sd	s10,32(sp)
    80205c32:	ec6e                	sd	s11,24(sp)
    80205c34:	0100                	addi	s0,sp,128
    80205c36:	f8c43423          	sd	a2,-120(s0)
    80205c3a:	8b36                	mv	s6,a3
    80205c3c:	8c3e                	mv	s8,a5
    if (off + n > fat.byts_per_clus)
    80205c3e:	00f706bb          	addw	a3,a4,a5
    80205c42:	00225797          	auipc	a5,0x225
    80205c46:	3ca7a783          	lw	a5,970(a5) # 8042b00c <fat+0xc>
    80205c4a:	02d7ef63          	bltu	a5,a3,80205c88 <rw_clus+0x70>
    80205c4e:	8cae                	mv	s9,a1
    uint sec = first_sec_of_clus(cluster) + off / fat.bpb.byts_per_sec;
    80205c50:	00225797          	auipc	a5,0x225
    80205c54:	3b078793          	addi	a5,a5,944 # 8042b000 <fat>
    80205c58:	0107da83          	lhu	s5,16(a5)
    return ((cluster - 2) * fat.bpb.sec_per_clus) + fat.first_data_sec;
    80205c5c:	ffe5099b          	addiw	s3,a0,-2
    80205c60:	0127c503          	lbu	a0,18(a5)
    80205c64:	02a989bb          	mulw	s3,s3,a0
    80205c68:	4388                	lw	a0,0(a5)
    80205c6a:	00a989bb          	addw	s3,s3,a0
    uint sec = first_sec_of_clus(cluster) + off / fat.bpb.byts_per_sec;
    80205c6e:	035757bb          	divuw	a5,a4,s5
    80205c72:	00f989bb          	addw	s3,s3,a5
    off = off % fat.bpb.byts_per_sec;
    80205c76:	03577abb          	remuw	s5,a4,s5
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    80205c7a:	0e0c0363          	beqz	s8,80205d60 <rw_clus+0x148>
    80205c7e:	4a01                	li	s4,0
        m = BSIZE - off % BSIZE;
    80205c80:	20000d93          	li	s11,512
        if (bad == -1) {
    80205c84:	5d7d                	li	s10,-1
    80205c86:	a095                	j	80205cea <rw_clus+0xd2>
        panic("offset out of range");
    80205c88:	00004517          	auipc	a0,0x4
    80205c8c:	2f850513          	addi	a0,a0,760 # 80209f80 <sysnames+0x320>
    80205c90:	ffffa097          	auipc	ra,0xffffa
    80205c94:	4b4080e7          	jalr	1204(ra) # 80200144 <panic>
                bwrite(bp);
    80205c98:	854a                	mv	a0,s2
    80205c9a:	ffffe097          	auipc	ra,0xffffe
    80205c9e:	974080e7          	jalr	-1676(ra) # 8020360e <bwrite>
        brelse(bp);
    80205ca2:	854a                	mv	a0,s2
    80205ca4:	ffffe097          	auipc	ra,0xffffe
    80205ca8:	9a6080e7          	jalr	-1626(ra) # 8020364a <brelse>
        if (bad == -1) {
    80205cac:	a02d                	j	80205cd6 <rw_clus+0xbe>
            bad = either_copyout(user, data, bp->data + (off % BSIZE), m);
    80205cae:	05890613          	addi	a2,s2,88 # 10000058 <_entry-0x701fffa8>
    80205cb2:	1682                	slli	a3,a3,0x20
    80205cb4:	9281                	srli	a3,a3,0x20
    80205cb6:	963a                	add	a2,a2,a4
    80205cb8:	85da                	mv	a1,s6
    80205cba:	f8843503          	ld	a0,-120(s0)
    80205cbe:	ffffd097          	auipc	ra,0xffffd
    80205cc2:	9be080e7          	jalr	-1602(ra) # 8020267c <either_copyout>
    80205cc6:	8baa                	mv	s7,a0
        brelse(bp);
    80205cc8:	854a                	mv	a0,s2
    80205cca:	ffffe097          	auipc	ra,0xffffe
    80205cce:	980080e7          	jalr	-1664(ra) # 8020364a <brelse>
        if (bad == -1) {
    80205cd2:	07ab8763          	beq	s7,s10,80205d40 <rw_clus+0x128>
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    80205cd6:	01448a3b          	addw	s4,s1,s4
    80205cda:	01548abb          	addw	s5,s1,s5
    80205cde:	1482                	slli	s1,s1,0x20
    80205ce0:	9081                	srli	s1,s1,0x20
    80205ce2:	9b26                	add	s6,s6,s1
    80205ce4:	2985                	addiw	s3,s3,1
    80205ce6:	058a7d63          	bgeu	s4,s8,80205d40 <rw_clus+0x128>
        bp = bread(0, sec);
    80205cea:	85ce                	mv	a1,s3
    80205cec:	4501                	li	a0,0
    80205cee:	ffffe097          	auipc	ra,0xffffe
    80205cf2:	830080e7          	jalr	-2000(ra) # 8020351e <bread>
    80205cf6:	892a                	mv	s2,a0
        m = BSIZE - off % BSIZE;
    80205cf8:	1ffaf713          	andi	a4,s5,511
    80205cfc:	40ed863b          	subw	a2,s11,a4
        if (n - tot < m) {
    80205d00:	414c07bb          	subw	a5,s8,s4
    80205d04:	86be                	mv	a3,a5
    80205d06:	2781                	sext.w	a5,a5
    80205d08:	0006059b          	sext.w	a1,a2
    80205d0c:	00f5f363          	bgeu	a1,a5,80205d12 <rw_clus+0xfa>
    80205d10:	86b2                	mv	a3,a2
    80205d12:	0006849b          	sext.w	s1,a3
        if (write) {
    80205d16:	f80c8ce3          	beqz	s9,80205cae <rw_clus+0x96>
            if ((bad = either_copyin(bp->data + (off % BSIZE), user, data, m)) != -1) {
    80205d1a:	05890513          	addi	a0,s2,88
    80205d1e:	1682                	slli	a3,a3,0x20
    80205d20:	9281                	srli	a3,a3,0x20
    80205d22:	865a                	mv	a2,s6
    80205d24:	f8843583          	ld	a1,-120(s0)
    80205d28:	953a                	add	a0,a0,a4
    80205d2a:	ffffd097          	auipc	ra,0xffffd
    80205d2e:	988080e7          	jalr	-1656(ra) # 802026b2 <either_copyin>
    80205d32:	f7a513e3          	bne	a0,s10,80205c98 <rw_clus+0x80>
        brelse(bp);
    80205d36:	854a                	mv	a0,s2
    80205d38:	ffffe097          	auipc	ra,0xffffe
    80205d3c:	912080e7          	jalr	-1774(ra) # 8020364a <brelse>
}
    80205d40:	8552                	mv	a0,s4
    80205d42:	70e6                	ld	ra,120(sp)
    80205d44:	7446                	ld	s0,112(sp)
    80205d46:	74a6                	ld	s1,104(sp)
    80205d48:	7906                	ld	s2,96(sp)
    80205d4a:	69e6                	ld	s3,88(sp)
    80205d4c:	6a46                	ld	s4,80(sp)
    80205d4e:	6aa6                	ld	s5,72(sp)
    80205d50:	6b06                	ld	s6,64(sp)
    80205d52:	7be2                	ld	s7,56(sp)
    80205d54:	7c42                	ld	s8,48(sp)
    80205d56:	7ca2                	ld	s9,40(sp)
    80205d58:	7d02                	ld	s10,32(sp)
    80205d5a:	6de2                	ld	s11,24(sp)
    80205d5c:	6109                	addi	sp,sp,128
    80205d5e:	8082                	ret
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    80205d60:	8a62                	mv	s4,s8
    80205d62:	bff9                	j	80205d40 <rw_clus+0x128>

0000000080205d64 <eget>:
// by their whole path. But when parsing a path, we open all the directories through it, 
// which forms a linked list from the final file to the root. Thus, we use the "parent" pointer 
// to recognize whether an entry with the "name" as given is really the file we want in the right path.
// Should never get root by eget, it's easy to understand.
static struct dirent *eget(struct dirent *parent, char *name)
{
    80205d64:	7139                	addi	sp,sp,-64
    80205d66:	fc06                	sd	ra,56(sp)
    80205d68:	f822                	sd	s0,48(sp)
    80205d6a:	f426                	sd	s1,40(sp)
    80205d6c:	f04a                	sd	s2,32(sp)
    80205d6e:	ec4e                	sd	s3,24(sp)
    80205d70:	e852                	sd	s4,16(sp)
    80205d72:	e456                	sd	s5,8(sp)
    80205d74:	0080                	addi	s0,sp,64
    80205d76:	8a2a                	mv	s4,a0
    80205d78:	8aae                	mv	s5,a1
    struct dirent *ep;
    acquire(&ecache.lock);
    80205d7a:	00225517          	auipc	a0,0x225
    80205d7e:	41650513          	addi	a0,a0,1046 # 8042b190 <ecache>
    80205d82:	ffffb097          	auipc	ra,0xffffb
    80205d86:	972080e7          	jalr	-1678(ra) # 802006f4 <acquire>
    if (name) {
    80205d8a:	060a8b63          	beqz	s5,80205e00 <eget+0x9c>
        for (ep = root.next; ep != &root; ep = ep->next) {          // LRU algo
    80205d8e:	00225497          	auipc	s1,0x225
    80205d92:	3c24b483          	ld	s1,962(s1) # 8042b150 <root+0x128>
    80205d96:	00225797          	auipc	a5,0x225
    80205d9a:	29278793          	addi	a5,a5,658 # 8042b028 <root>
    80205d9e:	06f48163          	beq	s1,a5,80205e00 <eget+0x9c>
            if (ep->valid == 1 && ep->parent == parent
    80205da2:	4905                	li	s2,1
        for (ep = root.next; ep != &root; ep = ep->next) {          // LRU algo
    80205da4:	89be                	mv	s3,a5
    80205da6:	a029                	j	80205db0 <eget+0x4c>
    80205da8:	1284b483          	ld	s1,296(s1)
    80205dac:	05348a63          	beq	s1,s3,80205e00 <eget+0x9c>
            if (ep->valid == 1 && ep->parent == parent
    80205db0:	11649783          	lh	a5,278(s1)
    80205db4:	ff279ae3          	bne	a5,s2,80205da8 <eget+0x44>
    80205db8:	1204b783          	ld	a5,288(s1)
    80205dbc:	ff4796e3          	bne	a5,s4,80205da8 <eget+0x44>
                && strncmp(ep->filename, name, FAT32_MAX_FILENAME) == 0) {
    80205dc0:	0ff00613          	li	a2,255
    80205dc4:	85d6                	mv	a1,s5
    80205dc6:	8526                	mv	a0,s1
    80205dc8:	ffffb097          	auipc	ra,0xffffb
    80205dcc:	aa4080e7          	jalr	-1372(ra) # 8020086c <strncmp>
    80205dd0:	fd61                	bnez	a0,80205da8 <eget+0x44>
                if (ep->ref++ == 0) {
    80205dd2:	1184a783          	lw	a5,280(s1)
    80205dd6:	0017871b          	addiw	a4,a5,1
    80205dda:	10e4ac23          	sw	a4,280(s1)
    80205dde:	eb81                	bnez	a5,80205dee <eget+0x8a>
                    ep->parent->ref++;
    80205de0:	1204b703          	ld	a4,288(s1)
    80205de4:	11872783          	lw	a5,280(a4)
    80205de8:	2785                	addiw	a5,a5,1
    80205dea:	10f72c23          	sw	a5,280(a4)
                }
                release(&ecache.lock);
    80205dee:	00225517          	auipc	a0,0x225
    80205df2:	3a250513          	addi	a0,a0,930 # 8042b190 <ecache>
    80205df6:	ffffb097          	auipc	ra,0xffffb
    80205dfa:	952080e7          	jalr	-1710(ra) # 80200748 <release>
                // edup(ep->parent);
                return ep;
    80205dfe:	a085                	j	80205e5e <eget+0xfa>
            }
        }
    }
    for (ep = root.prev; ep != &root; ep = ep->prev) {              // LRU algo
    80205e00:	00225497          	auipc	s1,0x225
    80205e04:	3584b483          	ld	s1,856(s1) # 8042b158 <root+0x130>
    80205e08:	00225797          	auipc	a5,0x225
    80205e0c:	22078793          	addi	a5,a5,544 # 8042b028 <root>
    80205e10:	00f48a63          	beq	s1,a5,80205e24 <eget+0xc0>
    80205e14:	873e                	mv	a4,a5
        if (ep->ref == 0) {
    80205e16:	1184a783          	lw	a5,280(s1)
    80205e1a:	cf89                	beqz	a5,80205e34 <eget+0xd0>
    for (ep = root.prev; ep != &root; ep = ep->prev) {              // LRU algo
    80205e1c:	1304b483          	ld	s1,304(s1)
    80205e20:	fee49be3          	bne	s1,a4,80205e16 <eget+0xb2>
            ep->dirty = 0;
            release(&ecache.lock);
            return ep;
        }
    }
    panic("eget: insufficient ecache");
    80205e24:	00004517          	auipc	a0,0x4
    80205e28:	17450513          	addi	a0,a0,372 # 80209f98 <sysnames+0x338>
    80205e2c:	ffffa097          	auipc	ra,0xffffa
    80205e30:	318080e7          	jalr	792(ra) # 80200144 <panic>
            ep->ref = 1;
    80205e34:	4785                	li	a5,1
    80205e36:	10f4ac23          	sw	a5,280(s1)
            ep->dev = parent->dev;
    80205e3a:	114a4783          	lbu	a5,276(s4)
    80205e3e:	10f48a23          	sb	a5,276(s1)
            ep->off = 0;
    80205e42:	1004ae23          	sw	zero,284(s1)
            ep->valid = 0;
    80205e46:	10049b23          	sh	zero,278(s1)
            ep->dirty = 0;
    80205e4a:	10048aa3          	sb	zero,277(s1)
            release(&ecache.lock);
    80205e4e:	00225517          	auipc	a0,0x225
    80205e52:	34250513          	addi	a0,a0,834 # 8042b190 <ecache>
    80205e56:	ffffb097          	auipc	ra,0xffffb
    80205e5a:	8f2080e7          	jalr	-1806(ra) # 80200748 <release>
    return 0;
}
    80205e5e:	8526                	mv	a0,s1
    80205e60:	70e2                	ld	ra,56(sp)
    80205e62:	7442                	ld	s0,48(sp)
    80205e64:	74a2                	ld	s1,40(sp)
    80205e66:	7902                	ld	s2,32(sp)
    80205e68:	69e2                	ld	s3,24(sp)
    80205e6a:	6a42                	ld	s4,16(sp)
    80205e6c:	6aa2                	ld	s5,8(sp)
    80205e6e:	6121                	addi	sp,sp,64
    80205e70:	8082                	ret

0000000080205e72 <read_entry_name>:
 * @param   buffer      pointer to the array that stores the name
 * @param   raw_entry   pointer to the entry in a sector buffer
 * @param   islong      if non-zero, read as l-n-e, otherwise s-n-e.
 */
static void read_entry_name(char *buffer, union dentry *d)
{
    80205e72:	7179                	addi	sp,sp,-48
    80205e74:	f406                	sd	ra,40(sp)
    80205e76:	f022                	sd	s0,32(sp)
    80205e78:	ec26                	sd	s1,24(sp)
    80205e7a:	e84a                	sd	s2,16(sp)
    80205e7c:	1800                	addi	s0,sp,48
    80205e7e:	84aa                	mv	s1,a0
    80205e80:	892e                	mv	s2,a1
    if (d->lne.attr == ATTR_LONG_NAME) {                       // long entry branch
    80205e82:	00b5c703          	lbu	a4,11(a1)
    80205e86:	47bd                	li	a5,15
    80205e88:	08f70463          	beq	a4,a5,80205f10 <read_entry_name+0x9e>
        snstr(buffer, d->lne.name2, NELEM(d->lne.name2));
        buffer += NELEM(d->lne.name2);
        snstr(buffer, d->lne.name3, NELEM(d->lne.name3));
    } else {
        // assert: only "." and ".." will enter this branch
        memset(buffer, 0, CHAR_SHORT_NAME + 2); // plus '.' and '\0'
    80205e8c:	4635                	li	a2,13
    80205e8e:	4581                	li	a1,0
    80205e90:	ffffb097          	auipc	ra,0xffffb
    80205e94:	900080e7          	jalr	-1792(ra) # 80200790 <memset>
        int i;
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    80205e98:	00094703          	lbu	a4,0(s2)
    80205e9c:	02000793          	li	a5,32
    80205ea0:	0af70b63          	beq	a4,a5,80205f56 <read_entry_name+0xe4>
    80205ea4:	4785                	li	a5,1
    80205ea6:	02000613          	li	a2,32
    80205eaa:	45a5                	li	a1,9
            buffer[i] = d->sne.name[i];
    80205eac:	00f486b3          	add	a3,s1,a5
    80205eb0:	fee68fa3          	sb	a4,-1(a3)
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    80205eb4:	0007851b          	sext.w	a0,a5
    80205eb8:	00f90733          	add	a4,s2,a5
    80205ebc:	00074703          	lbu	a4,0(a4)
    80205ec0:	00c70563          	beq	a4,a2,80205eca <read_entry_name+0x58>
    80205ec4:	0785                	addi	a5,a5,1
    80205ec6:	feb793e3          	bne	a5,a1,80205eac <read_entry_name+0x3a>
        }
        if (d->sne.name[8] != ' ') {
    80205eca:	00894703          	lbu	a4,8(s2)
    80205ece:	02000793          	li	a5,32
    80205ed2:	00f70963          	beq	a4,a5,80205ee4 <read_entry_name+0x72>
            buffer[i++] = '.';
    80205ed6:	00a487b3          	add	a5,s1,a0
    80205eda:	02e00713          	li	a4,46
    80205ede:	00e78023          	sb	a4,0(a5)
    80205ee2:	2505                	addiw	a0,a0,1
        }
        for (int j = 8; j < CHAR_SHORT_NAME; j++, i++) {
    80205ee4:	00890793          	addi	a5,s2,8
    80205ee8:	94aa                	add	s1,s1,a0
    80205eea:	092d                	addi	s2,s2,11
            if (d->sne.name[j] == ' ') { break; }
    80205eec:	02000693          	li	a3,32
    80205ef0:	0007c703          	lbu	a4,0(a5)
    80205ef4:	00d70863          	beq	a4,a3,80205f04 <read_entry_name+0x92>
            buffer[i] = d->sne.name[j];
    80205ef8:	00e48023          	sb	a4,0(s1)
        for (int j = 8; j < CHAR_SHORT_NAME; j++, i++) {
    80205efc:	0785                	addi	a5,a5,1
    80205efe:	0485                	addi	s1,s1,1
    80205f00:	ff2798e3          	bne	a5,s2,80205ef0 <read_entry_name+0x7e>
        }
    }
}
    80205f04:	70a2                	ld	ra,40(sp)
    80205f06:	7402                	ld	s0,32(sp)
    80205f08:	64e2                	ld	s1,24(sp)
    80205f0a:	6942                	ld	s2,16(sp)
    80205f0c:	6145                	addi	sp,sp,48
    80205f0e:	8082                	ret
        memmove(temp, d->lne.name1, sizeof(temp));
    80205f10:	4629                	li	a2,10
    80205f12:	0585                	addi	a1,a1,1
    80205f14:	fd040513          	addi	a0,s0,-48
    80205f18:	ffffb097          	auipc	ra,0xffffb
    80205f1c:	8d8080e7          	jalr	-1832(ra) # 802007f0 <memmove>
        snstr(buffer, temp, NELEM(d->lne.name1));
    80205f20:	4615                	li	a2,5
    80205f22:	fd040593          	addi	a1,s0,-48
    80205f26:	8526                	mv	a0,s1
    80205f28:	ffffb097          	auipc	ra,0xffffb
    80205f2c:	a4e080e7          	jalr	-1458(ra) # 80200976 <snstr>
        snstr(buffer, d->lne.name2, NELEM(d->lne.name2));
    80205f30:	4619                	li	a2,6
    80205f32:	00e90593          	addi	a1,s2,14
    80205f36:	00548513          	addi	a0,s1,5
    80205f3a:	ffffb097          	auipc	ra,0xffffb
    80205f3e:	a3c080e7          	jalr	-1476(ra) # 80200976 <snstr>
        snstr(buffer, d->lne.name3, NELEM(d->lne.name3));
    80205f42:	4609                	li	a2,2
    80205f44:	01c90593          	addi	a1,s2,28
    80205f48:	00b48513          	addi	a0,s1,11
    80205f4c:	ffffb097          	auipc	ra,0xffffb
    80205f50:	a2a080e7          	jalr	-1494(ra) # 80200976 <snstr>
    80205f54:	bf45                	j	80205f04 <read_entry_name+0x92>
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    80205f56:	4501                	li	a0,0
    80205f58:	bf8d                	j	80205eca <read_entry_name+0x58>

0000000080205f5a <fat32_init>:
{
    80205f5a:	7139                	addi	sp,sp,-64
    80205f5c:	fc06                	sd	ra,56(sp)
    80205f5e:	f822                	sd	s0,48(sp)
    80205f60:	f426                	sd	s1,40(sp)
    80205f62:	f04a                	sd	s2,32(sp)
    80205f64:	ec4e                	sd	s3,24(sp)
    80205f66:	e852                	sd	s4,16(sp)
    80205f68:	e456                	sd	s5,8(sp)
    80205f6a:	0080                	addi	s0,sp,64
    printf("[fat32_init] enter!\n");
    80205f6c:	00004517          	auipc	a0,0x4
    80205f70:	04c50513          	addi	a0,a0,76 # 80209fb8 <sysnames+0x358>
    80205f74:	ffffa097          	auipc	ra,0xffffa
    80205f78:	21a080e7          	jalr	538(ra) # 8020018e <printf>
    struct buf *b = bread(0, 0);
    80205f7c:	4581                	li	a1,0
    80205f7e:	4501                	li	a0,0
    80205f80:	ffffd097          	auipc	ra,0xffffd
    80205f84:	59e080e7          	jalr	1438(ra) # 8020351e <bread>
    80205f88:	892a                	mv	s2,a0
    if (strncmp((char const*)(b->data + 82), "FAT32", 5))
    80205f8a:	4615                	li	a2,5
    80205f8c:	00004597          	auipc	a1,0x4
    80205f90:	04458593          	addi	a1,a1,68 # 80209fd0 <sysnames+0x370>
    80205f94:	0aa50513          	addi	a0,a0,170
    80205f98:	ffffb097          	auipc	ra,0xffffb
    80205f9c:	8d4080e7          	jalr	-1836(ra) # 8020086c <strncmp>
    80205fa0:	1e051163          	bnez	a0,80206182 <fat32_init+0x228>
    memmove(&fat.bpb.byts_per_sec, b->data + 11, 2);            // avoid misaligned load on k210
    80205fa4:	00225497          	auipc	s1,0x225
    80205fa8:	05c48493          	addi	s1,s1,92 # 8042b000 <fat>
    80205fac:	4609                	li	a2,2
    80205fae:	06390593          	addi	a1,s2,99
    80205fb2:	00225517          	auipc	a0,0x225
    80205fb6:	05e50513          	addi	a0,a0,94 # 8042b010 <fat+0x10>
    80205fba:	ffffb097          	auipc	ra,0xffffb
    80205fbe:	836080e7          	jalr	-1994(ra) # 802007f0 <memmove>
    fat.bpb.sec_per_clus = *(b->data + 13);
    80205fc2:	06594683          	lbu	a3,101(s2)
    80205fc6:	00d48923          	sb	a3,18(s1)
    fat.bpb.rsvd_sec_cnt = *(uint16 *)(b->data + 14);
    80205fca:	06695603          	lhu	a2,102(s2)
    80205fce:	00c49a23          	sh	a2,20(s1)
    fat.bpb.fat_cnt = *(b->data + 16);
    80205fd2:	06894703          	lbu	a4,104(s2)
    80205fd6:	00e48b23          	sb	a4,22(s1)
    fat.bpb.hidd_sec = *(uint32 *)(b->data + 28);
    80205fda:	07492783          	lw	a5,116(s2)
    80205fde:	cc9c                	sw	a5,24(s1)
    fat.bpb.tot_sec = *(uint32 *)(b->data + 32);
    80205fe0:	07892783          	lw	a5,120(s2)
    80205fe4:	ccdc                	sw	a5,28(s1)
    fat.bpb.fat_sz = *(uint32 *)(b->data + 36);
    80205fe6:	07c92583          	lw	a1,124(s2)
    80205fea:	d08c                	sw	a1,32(s1)
    fat.bpb.root_clus = *(uint32 *)(b->data + 44);
    80205fec:	08492503          	lw	a0,132(s2)
    80205ff0:	d0c8                	sw	a0,36(s1)
    fat.first_data_sec = fat.bpb.rsvd_sec_cnt + fat.bpb.fat_cnt * fat.bpb.fat_sz;
    80205ff2:	02b7073b          	mulw	a4,a4,a1
    80205ff6:	9f31                	addw	a4,a4,a2
    80205ff8:	c098                	sw	a4,0(s1)
    fat.data_sec_cnt = fat.bpb.tot_sec - fat.first_data_sec;
    80205ffa:	9f99                	subw	a5,a5,a4
    80205ffc:	c0dc                	sw	a5,4(s1)
    fat.data_clus_cnt = fat.data_sec_cnt / fat.bpb.sec_per_clus;
    80205ffe:	02d7d7bb          	divuw	a5,a5,a3
    80206002:	c49c                	sw	a5,8(s1)
    fat.byts_per_clus = fat.bpb.sec_per_clus * fat.bpb.byts_per_sec;
    80206004:	0104d783          	lhu	a5,16(s1)
    80206008:	02d787bb          	mulw	a5,a5,a3
    8020600c:	c4dc                	sw	a5,12(s1)
    brelse(b);
    8020600e:	854a                	mv	a0,s2
    80206010:	ffffd097          	auipc	ra,0xffffd
    80206014:	63a080e7          	jalr	1594(ra) # 8020364a <brelse>
    printf("[FAT32 init]byts_per_sec: %d\n", fat.bpb.byts_per_sec);
    80206018:	0104d583          	lhu	a1,16(s1)
    8020601c:	00004517          	auipc	a0,0x4
    80206020:	fd450513          	addi	a0,a0,-44 # 80209ff0 <sysnames+0x390>
    80206024:	ffffa097          	auipc	ra,0xffffa
    80206028:	16a080e7          	jalr	362(ra) # 8020018e <printf>
    printf("[FAT32 init]root_clus: %d\n", fat.bpb.root_clus);
    8020602c:	50cc                	lw	a1,36(s1)
    8020602e:	00004517          	auipc	a0,0x4
    80206032:	fe250513          	addi	a0,a0,-30 # 8020a010 <sysnames+0x3b0>
    80206036:	ffffa097          	auipc	ra,0xffffa
    8020603a:	158080e7          	jalr	344(ra) # 8020018e <printf>
    printf("[FAT32 init]sec_per_clus: %d\n", fat.bpb.sec_per_clus);
    8020603e:	0124c583          	lbu	a1,18(s1)
    80206042:	00004517          	auipc	a0,0x4
    80206046:	fee50513          	addi	a0,a0,-18 # 8020a030 <sysnames+0x3d0>
    8020604a:	ffffa097          	auipc	ra,0xffffa
    8020604e:	144080e7          	jalr	324(ra) # 8020018e <printf>
    printf("[FAT32 init]fat_cnt: %d\n", fat.bpb.fat_cnt);
    80206052:	0164c583          	lbu	a1,22(s1)
    80206056:	00004517          	auipc	a0,0x4
    8020605a:	ffa50513          	addi	a0,a0,-6 # 8020a050 <sysnames+0x3f0>
    8020605e:	ffffa097          	auipc	ra,0xffffa
    80206062:	130080e7          	jalr	304(ra) # 8020018e <printf>
    printf("[FAT32 init]fat_sz: %d\n", fat.bpb.fat_sz);
    80206066:	508c                	lw	a1,32(s1)
    80206068:	00004517          	auipc	a0,0x4
    8020606c:	00850513          	addi	a0,a0,8 # 8020a070 <sysnames+0x410>
    80206070:	ffffa097          	auipc	ra,0xffffa
    80206074:	11e080e7          	jalr	286(ra) # 8020018e <printf>
    printf("[FAT32 init]first_data_sec: %d\n", fat.first_data_sec);
    80206078:	408c                	lw	a1,0(s1)
    8020607a:	00004517          	auipc	a0,0x4
    8020607e:	00e50513          	addi	a0,a0,14 # 8020a088 <sysnames+0x428>
    80206082:	ffffa097          	auipc	ra,0xffffa
    80206086:	10c080e7          	jalr	268(ra) # 8020018e <printf>
    if (BSIZE != fat.bpb.byts_per_sec) 
    8020608a:	0104d703          	lhu	a4,16(s1)
    8020608e:	20000793          	li	a5,512
    80206092:	10f71063          	bne	a4,a5,80206192 <fat32_init+0x238>
    initlock(&ecache.lock, "ecache");
    80206096:	00004597          	auipc	a1,0x4
    8020609a:	02a58593          	addi	a1,a1,42 # 8020a0c0 <sysnames+0x460>
    8020609e:	00225517          	auipc	a0,0x225
    802060a2:	0f250513          	addi	a0,a0,242 # 8042b190 <ecache>
    802060a6:	ffffa097          	auipc	ra,0xffffa
    802060aa:	60a080e7          	jalr	1546(ra) # 802006b0 <initlock>
    memset(&root, 0, sizeof(root));
    802060ae:	00225497          	auipc	s1,0x225
    802060b2:	f5248493          	addi	s1,s1,-174 # 8042b000 <fat>
    802060b6:	00225917          	auipc	s2,0x225
    802060ba:	f7290913          	addi	s2,s2,-142 # 8042b028 <root>
    802060be:	16800613          	li	a2,360
    802060c2:	4581                	li	a1,0
    802060c4:	854a                	mv	a0,s2
    802060c6:	ffffa097          	auipc	ra,0xffffa
    802060ca:	6ca080e7          	jalr	1738(ra) # 80200790 <memset>
    initsleeplock(&root.lock, "entry");
    802060ce:	00004597          	auipc	a1,0x4
    802060d2:	ffa58593          	addi	a1,a1,-6 # 8020a0c8 <sysnames+0x468>
    802060d6:	00225517          	auipc	a0,0x225
    802060da:	08a50513          	addi	a0,a0,138 # 8042b160 <root+0x138>
    802060de:	ffffd097          	auipc	ra,0xffffd
    802060e2:	682080e7          	jalr	1666(ra) # 80203760 <initsleeplock>
    root.attribute = (ATTR_DIRECTORY | ATTR_SYSTEM);
    802060e6:	47d1                	li	a5,20
    802060e8:	12f48423          	sb	a5,296(s1)
    root.first_clus = root.cur_clus = fat.bpb.root_clus;
    802060ec:	50dc                	lw	a5,36(s1)
    802060ee:	12f4aa23          	sw	a5,308(s1)
    802060f2:	12f4a623          	sw	a5,300(s1)
    root.valid = 1;
    802060f6:	4785                	li	a5,1
    802060f8:	12f49f23          	sh	a5,318(s1)
    root.prev = &root;
    802060fc:	1524bc23          	sd	s2,344(s1)
    root.next = &root;
    80206100:	1524b823          	sd	s2,336(s1)
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    80206104:	00225497          	auipc	s1,0x225
    80206108:	0a448493          	addi	s1,s1,164 # 8042b1a8 <ecache+0x18>
        de->next = root.next;
    8020610c:	00225917          	auipc	s2,0x225
    80206110:	ef490913          	addi	s2,s2,-268 # 8042b000 <fat>
        de->prev = &root;
    80206114:	00225a97          	auipc	s5,0x225
    80206118:	f14a8a93          	addi	s5,s5,-236 # 8042b028 <root>
        initsleeplock(&de->lock, "entry");
    8020611c:	00004a17          	auipc	s4,0x4
    80206120:	faca0a13          	addi	s4,s4,-84 # 8020a0c8 <sysnames+0x468>
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    80206124:	00229997          	auipc	s3,0x229
    80206128:	6d498993          	addi	s3,s3,1748 # 8042f7f8 <cons>
        de->dev = 0;
    8020612c:	10048a23          	sb	zero,276(s1)
        de->valid = 0;
    80206130:	10049b23          	sh	zero,278(s1)
        de->ref = 0;
    80206134:	1004ac23          	sw	zero,280(s1)
        de->dirty = 0;
    80206138:	10048aa3          	sb	zero,277(s1)
        de->parent = 0;
    8020613c:	1204b023          	sd	zero,288(s1)
        de->next = root.next;
    80206140:	15093783          	ld	a5,336(s2)
    80206144:	12f4b423          	sd	a5,296(s1)
        de->prev = &root;
    80206148:	1354b823          	sd	s5,304(s1)
        initsleeplock(&de->lock, "entry");
    8020614c:	85d2                	mv	a1,s4
    8020614e:	13848513          	addi	a0,s1,312
    80206152:	ffffd097          	auipc	ra,0xffffd
    80206156:	60e080e7          	jalr	1550(ra) # 80203760 <initsleeplock>
        root.next->prev = de;
    8020615a:	15093783          	ld	a5,336(s2)
    8020615e:	1297b823          	sd	s1,304(a5)
        root.next = de;
    80206162:	14993823          	sd	s1,336(s2)
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    80206166:	16848493          	addi	s1,s1,360
    8020616a:	fd3491e3          	bne	s1,s3,8020612c <fat32_init+0x1d2>
}
    8020616e:	4501                	li	a0,0
    80206170:	70e2                	ld	ra,56(sp)
    80206172:	7442                	ld	s0,48(sp)
    80206174:	74a2                	ld	s1,40(sp)
    80206176:	7902                	ld	s2,32(sp)
    80206178:	69e2                	ld	s3,24(sp)
    8020617a:	6a42                	ld	s4,16(sp)
    8020617c:	6aa2                	ld	s5,8(sp)
    8020617e:	6121                	addi	sp,sp,64
    80206180:	8082                	ret
        panic("not FAT32 volume");
    80206182:	00004517          	auipc	a0,0x4
    80206186:	e5650513          	addi	a0,a0,-426 # 80209fd8 <sysnames+0x378>
    8020618a:	ffffa097          	auipc	ra,0xffffa
    8020618e:	fba080e7          	jalr	-70(ra) # 80200144 <panic>
        panic("byts_per_sec != BSIZE");
    80206192:	00004517          	auipc	a0,0x4
    80206196:	f1650513          	addi	a0,a0,-234 # 8020a0a8 <sysnames+0x448>
    8020619a:	ffffa097          	auipc	ra,0xffffa
    8020619e:	faa080e7          	jalr	-86(ra) # 80200144 <panic>

00000000802061a2 <eread>:
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    802061a2:	10852783          	lw	a5,264(a0)
    802061a6:	0ed7e863          	bltu	a5,a3,80206296 <eread+0xf4>
{
    802061aa:	711d                	addi	sp,sp,-96
    802061ac:	ec86                	sd	ra,88(sp)
    802061ae:	e8a2                	sd	s0,80(sp)
    802061b0:	e4a6                	sd	s1,72(sp)
    802061b2:	e0ca                	sd	s2,64(sp)
    802061b4:	fc4e                	sd	s3,56(sp)
    802061b6:	f852                	sd	s4,48(sp)
    802061b8:	f456                	sd	s5,40(sp)
    802061ba:	f05a                	sd	s6,32(sp)
    802061bc:	ec5e                	sd	s7,24(sp)
    802061be:	e862                	sd	s8,16(sp)
    802061c0:	e466                	sd	s9,8(sp)
    802061c2:	e06a                	sd	s10,0(sp)
    802061c4:	1080                	addi	s0,sp,96
    802061c6:	8a2a                	mv	s4,a0
    802061c8:	8bae                	mv	s7,a1
    802061ca:	8ab2                	mv	s5,a2
    802061cc:	8936                	mv	s2,a3
    802061ce:	8b3a                	mv	s6,a4
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    802061d0:	9eb9                	addw	a3,a3,a4
        return 0;
    802061d2:	4501                	li	a0,0
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    802061d4:	0b26e163          	bltu	a3,s2,80206276 <eread+0xd4>
    802061d8:	100a4703          	lbu	a4,256(s4)
    802061dc:	8b41                	andi	a4,a4,16
    802061de:	ef41                	bnez	a4,80206276 <eread+0xd4>
    if (off + n > entry->file_size) {
    802061e0:	00d7f463          	bgeu	a5,a3,802061e8 <eread+0x46>
        n = entry->file_size - off;
    802061e4:	41278b3b          	subw	s6,a5,s2
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    802061e8:	10ca2703          	lw	a4,268(s4)
    802061ec:	100007b7          	lui	a5,0x10000
    802061f0:	17dd                	addi	a5,a5,-9
    802061f2:	06e7ef63          	bltu	a5,a4,80206270 <eread+0xce>
    802061f6:	080b0e63          	beqz	s6,80206292 <eread+0xf0>
    802061fa:	4981                	li	s3,0
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    802061fc:	00225c97          	auipc	s9,0x225
    80206200:	e04c8c93          	addi	s9,s9,-508 # 8042b000 <fat>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80206204:	8c3e                	mv	s8,a5
    80206206:	a82d                	j	80206240 <eread+0x9e>
    80206208:	00048d1b          	sext.w	s10,s1
        if (rw_clus(entry->cur_clus, 0, user_dst, dst, off % fat.byts_per_clus, m) != m) {
    8020620c:	87ea                	mv	a5,s10
    8020620e:	86d6                	mv	a3,s5
    80206210:	865e                	mv	a2,s7
    80206212:	4581                	li	a1,0
    80206214:	10ca2503          	lw	a0,268(s4)
    80206218:	00000097          	auipc	ra,0x0
    8020621c:	a00080e7          	jalr	-1536(ra) # 80205c18 <rw_clus>
    80206220:	2501                	sext.w	a0,a0
    80206222:	04ad1863          	bne	s10,a0,80206272 <eread+0xd0>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80206226:	013489bb          	addw	s3,s1,s3
    8020622a:	0124893b          	addw	s2,s1,s2
    8020622e:	1482                	slli	s1,s1,0x20
    80206230:	9081                	srli	s1,s1,0x20
    80206232:	9aa6                	add	s5,s5,s1
    80206234:	10ca2783          	lw	a5,268(s4)
    80206238:	02fc6d63          	bltu	s8,a5,80206272 <eread+0xd0>
    8020623c:	0369fb63          	bgeu	s3,s6,80206272 <eread+0xd0>
        reloc_clus(entry, off, 0);
    80206240:	4601                	li	a2,0
    80206242:	85ca                	mv	a1,s2
    80206244:	8552                	mv	a0,s4
    80206246:	00000097          	auipc	ra,0x0
    8020624a:	8c8080e7          	jalr	-1848(ra) # 80205b0e <reloc_clus>
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    8020624e:	00cca783          	lw	a5,12(s9)
    80206252:	02f976bb          	remuw	a3,s2,a5
    80206256:	0006871b          	sext.w	a4,a3
    8020625a:	9f95                	subw	a5,a5,a3
        if (n - tot < m) {
    8020625c:	413b06bb          	subw	a3,s6,s3
    80206260:	84b6                	mv	s1,a3
    80206262:	2681                	sext.w	a3,a3
    80206264:	0007861b          	sext.w	a2,a5
    80206268:	fad670e3          	bgeu	a2,a3,80206208 <eread+0x66>
    8020626c:	84be                	mv	s1,a5
    8020626e:	bf69                	j	80206208 <eread+0x66>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80206270:	4981                	li	s3,0
    return tot;
    80206272:	0009851b          	sext.w	a0,s3
}
    80206276:	60e6                	ld	ra,88(sp)
    80206278:	6446                	ld	s0,80(sp)
    8020627a:	64a6                	ld	s1,72(sp)
    8020627c:	6906                	ld	s2,64(sp)
    8020627e:	79e2                	ld	s3,56(sp)
    80206280:	7a42                	ld	s4,48(sp)
    80206282:	7aa2                	ld	s5,40(sp)
    80206284:	7b02                	ld	s6,32(sp)
    80206286:	6be2                	ld	s7,24(sp)
    80206288:	6c42                	ld	s8,16(sp)
    8020628a:	6ca2                	ld	s9,8(sp)
    8020628c:	6d02                	ld	s10,0(sp)
    8020628e:	6125                	addi	sp,sp,96
    80206290:	8082                	ret
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80206292:	89da                	mv	s3,s6
    80206294:	bff9                	j	80206272 <eread+0xd0>
        return 0;
    80206296:	4501                	li	a0,0
}
    80206298:	8082                	ret

000000008020629a <ewrite>:
    if (off > entry->file_size || off + n < off || (uint64)off + n > 0xffffffff
    8020629a:	10852783          	lw	a5,264(a0)
    8020629e:	0ed7e463          	bltu	a5,a3,80206386 <ewrite+0xec>
{
    802062a2:	711d                	addi	sp,sp,-96
    802062a4:	ec86                	sd	ra,88(sp)
    802062a6:	e8a2                	sd	s0,80(sp)
    802062a8:	e4a6                	sd	s1,72(sp)
    802062aa:	e0ca                	sd	s2,64(sp)
    802062ac:	fc4e                	sd	s3,56(sp)
    802062ae:	f852                	sd	s4,48(sp)
    802062b0:	f456                	sd	s5,40(sp)
    802062b2:	f05a                	sd	s6,32(sp)
    802062b4:	ec5e                	sd	s7,24(sp)
    802062b6:	e862                	sd	s8,16(sp)
    802062b8:	e466                	sd	s9,8(sp)
    802062ba:	1080                	addi	s0,sp,96
    802062bc:	8aaa                	mv	s5,a0
    802062be:	8bae                	mv	s7,a1
    802062c0:	8a32                	mv	s4,a2
    802062c2:	8936                	mv	s2,a3
    802062c4:	8b3a                	mv	s6,a4
    if (off > entry->file_size || off + n < off || (uint64)off + n > 0xffffffff
    802062c6:	00e687bb          	addw	a5,a3,a4
    802062ca:	0cd7e063          	bltu	a5,a3,8020638a <ewrite+0xf0>
    802062ce:	02069793          	slli	a5,a3,0x20
    802062d2:	9381                	srli	a5,a5,0x20
    802062d4:	1702                	slli	a4,a4,0x20
    802062d6:	9301                	srli	a4,a4,0x20
    802062d8:	97ba                	add	a5,a5,a4
    802062da:	577d                	li	a4,-1
    802062dc:	9301                	srli	a4,a4,0x20
    802062de:	0af76863          	bltu	a4,a5,8020638e <ewrite+0xf4>
        || (entry->attribute & ATTR_READ_ONLY)) {
    802062e2:	10054783          	lbu	a5,256(a0)
    802062e6:	8b85                	andi	a5,a5,1
    802062e8:	e7cd                	bnez	a5,80206392 <ewrite+0xf8>
    if (entry->first_clus == 0) {   // so file_size if 0 too, which requests off == 0
    802062ea:	10452783          	lw	a5,260(a0)
    802062ee:	cb89                	beqz	a5,80206300 <ewrite+0x66>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    802062f0:	080b0963          	beqz	s6,80206382 <ewrite+0xe8>
    802062f4:	4981                	li	s3,0
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    802062f6:	00225c17          	auipc	s8,0x225
    802062fa:	d0ac0c13          	addi	s8,s8,-758 # 8042b000 <fat>
    802062fe:	a891                	j	80206352 <ewrite+0xb8>
        entry->cur_clus = entry->first_clus = alloc_clus(entry->dev);
    80206300:	11454503          	lbu	a0,276(a0)
    80206304:	fffff097          	auipc	ra,0xfffff
    80206308:	64a080e7          	jalr	1610(ra) # 8020594e <alloc_clus>
    8020630c:	2501                	sext.w	a0,a0
    8020630e:	10aaa223          	sw	a0,260(s5)
    80206312:	10aaa623          	sw	a0,268(s5)
        entry->clus_cnt = 0;
    80206316:	100aa823          	sw	zero,272(s5)
        entry->dirty = 1;
    8020631a:	4785                	li	a5,1
    8020631c:	10fa8aa3          	sb	a5,277(s5)
    80206320:	bfc1                	j	802062f0 <ewrite+0x56>
    80206322:	00048c9b          	sext.w	s9,s1
        if (rw_clus(entry->cur_clus, 1, user_src, src, off % fat.byts_per_clus, m) != m) {
    80206326:	87e6                	mv	a5,s9
    80206328:	86d2                	mv	a3,s4
    8020632a:	865e                	mv	a2,s7
    8020632c:	4585                	li	a1,1
    8020632e:	10caa503          	lw	a0,268(s5)
    80206332:	00000097          	auipc	ra,0x0
    80206336:	8e6080e7          	jalr	-1818(ra) # 80205c18 <rw_clus>
    8020633a:	2501                	sext.w	a0,a0
    8020633c:	04ac9d63          	bne	s9,a0,80206396 <ewrite+0xfc>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    80206340:	013489bb          	addw	s3,s1,s3
    80206344:	0124893b          	addw	s2,s1,s2
    80206348:	1482                	slli	s1,s1,0x20
    8020634a:	9081                	srli	s1,s1,0x20
    8020634c:	9a26                	add	s4,s4,s1
    8020634e:	0569f463          	bgeu	s3,s6,80206396 <ewrite+0xfc>
        reloc_clus(entry, off, 1);
    80206352:	4605                	li	a2,1
    80206354:	85ca                	mv	a1,s2
    80206356:	8556                	mv	a0,s5
    80206358:	fffff097          	auipc	ra,0xfffff
    8020635c:	7b6080e7          	jalr	1974(ra) # 80205b0e <reloc_clus>
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80206360:	00cc2783          	lw	a5,12(s8)
    80206364:	02f976bb          	remuw	a3,s2,a5
    80206368:	0006871b          	sext.w	a4,a3
    8020636c:	9f95                	subw	a5,a5,a3
        if (n - tot < m) {
    8020636e:	413b06bb          	subw	a3,s6,s3
    80206372:	84b6                	mv	s1,a3
    80206374:	2681                	sext.w	a3,a3
    80206376:	0007861b          	sext.w	a2,a5
    8020637a:	fad674e3          	bgeu	a2,a3,80206322 <ewrite+0x88>
    8020637e:	84be                	mv	s1,a5
    80206380:	b74d                	j	80206322 <ewrite+0x88>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    80206382:	89da                	mv	s3,s6
    80206384:	a015                	j	802063a8 <ewrite+0x10e>
        return -1;
    80206386:	557d                	li	a0,-1
}
    80206388:	8082                	ret
        return -1;
    8020638a:	557d                	li	a0,-1
    8020638c:	a005                	j	802063ac <ewrite+0x112>
    8020638e:	557d                	li	a0,-1
    80206390:	a831                	j	802063ac <ewrite+0x112>
    80206392:	557d                	li	a0,-1
    80206394:	a821                	j	802063ac <ewrite+0x112>
        if(off > entry->file_size) {
    80206396:	108aa783          	lw	a5,264(s5)
    8020639a:	0127f763          	bgeu	a5,s2,802063a8 <ewrite+0x10e>
            entry->file_size = off;
    8020639e:	112aa423          	sw	s2,264(s5)
            entry->dirty = 1;
    802063a2:	4785                	li	a5,1
    802063a4:	10fa8aa3          	sb	a5,277(s5)
    return tot;
    802063a8:	0009851b          	sext.w	a0,s3
}
    802063ac:	60e6                	ld	ra,88(sp)
    802063ae:	6446                	ld	s0,80(sp)
    802063b0:	64a6                	ld	s1,72(sp)
    802063b2:	6906                	ld	s2,64(sp)
    802063b4:	79e2                	ld	s3,56(sp)
    802063b6:	7a42                	ld	s4,48(sp)
    802063b8:	7aa2                	ld	s5,40(sp)
    802063ba:	7b02                	ld	s6,32(sp)
    802063bc:	6be2                	ld	s7,24(sp)
    802063be:	6c42                	ld	s8,16(sp)
    802063c0:	6ca2                	ld	s9,8(sp)
    802063c2:	6125                	addi	sp,sp,96
    802063c4:	8082                	ret

00000000802063c6 <formatname>:
{
    802063c6:	7179                	addi	sp,sp,-48
    802063c8:	f406                	sd	ra,40(sp)
    802063ca:	f022                	sd	s0,32(sp)
    802063cc:	ec26                	sd	s1,24(sp)
    802063ce:	e84a                	sd	s2,16(sp)
    802063d0:	e44e                	sd	s3,8(sp)
    802063d2:	e052                	sd	s4,0(sp)
    802063d4:	1800                	addi	s0,sp,48
    802063d6:	84aa                	mv	s1,a0
    while (*name == ' ' || *name == '.') { name++; }
    802063d8:	02000793          	li	a5,32
    802063dc:	02e00713          	li	a4,46
    802063e0:	a011                	j	802063e4 <formatname+0x1e>
    802063e2:	0485                	addi	s1,s1,1
    802063e4:	0004c583          	lbu	a1,0(s1)
    802063e8:	fef58de3          	beq	a1,a5,802063e2 <formatname+0x1c>
    802063ec:	fee58be3          	beq	a1,a4,802063e2 <formatname+0x1c>
    for (p = name; *p; p++) {
    802063f0:	c1b9                	beqz	a1,80206436 <formatname+0x70>
    802063f2:	8926                	mv	s2,s1
        if (c < 0x20 || strchr(illegal, c)) {
    802063f4:	49fd                	li	s3,31
    802063f6:	00206a17          	auipc	s4,0x206
    802063fa:	c42a0a13          	addi	s4,s4,-958 # 8040c038 <illegal.1637>
    802063fe:	02b9fe63          	bgeu	s3,a1,8020643a <formatname+0x74>
    80206402:	8552                	mv	a0,s4
    80206404:	ffffa097          	auipc	ra,0xffffa
    80206408:	5f6080e7          	jalr	1526(ra) # 802009fa <strchr>
    8020640c:	e121                	bnez	a0,8020644c <formatname+0x86>
    for (p = name; *p; p++) {
    8020640e:	0905                	addi	s2,s2,1
    80206410:	00094583          	lbu	a1,0(s2)
    80206414:	f5ed                	bnez	a1,802063fe <formatname+0x38>
        if (*p != ' ') {
    80206416:	02000693          	li	a3,32
    8020641a:	874a                	mv	a4,s2
    while (p-- > name) {
    8020641c:	0124fb63          	bgeu	s1,s2,80206432 <formatname+0x6c>
        if (*p != ' ') {
    80206420:	197d                	addi	s2,s2,-1
    80206422:	00094783          	lbu	a5,0(s2)
    80206426:	fed78ae3          	beq	a5,a3,8020641a <formatname+0x54>
            p[1] = '\0';
    8020642a:	00070023          	sb	zero,0(a4)
            break;
    8020642e:	8526                	mv	a0,s1
    80206430:	a031                	j	8020643c <formatname+0x76>
    80206432:	8526                	mv	a0,s1
    80206434:	a021                	j	8020643c <formatname+0x76>
    for (p = name; *p; p++) {
    80206436:	8526                	mv	a0,s1
    80206438:	a011                	j	8020643c <formatname+0x76>
            return 0;
    8020643a:	4501                	li	a0,0
}
    8020643c:	70a2                	ld	ra,40(sp)
    8020643e:	7402                	ld	s0,32(sp)
    80206440:	64e2                	ld	s1,24(sp)
    80206442:	6942                	ld	s2,16(sp)
    80206444:	69a2                	ld	s3,8(sp)
    80206446:	6a02                	ld	s4,0(sp)
    80206448:	6145                	addi	sp,sp,48
    8020644a:	8082                	ret
            return 0;
    8020644c:	4501                	li	a0,0
    8020644e:	b7fd                	j	8020643c <formatname+0x76>

0000000080206450 <cal_checksum>:
{
    80206450:	1141                	addi	sp,sp,-16
    80206452:	e422                	sd	s0,8(sp)
    80206454:	0800                	addi	s0,sp,16
    80206456:	87aa                	mv	a5,a0
    for (int i = CHAR_SHORT_NAME; i != 0; i--) {
    80206458:	00b50613          	addi	a2,a0,11
    uint8 sum = 0;
    8020645c:	4501                	li	a0,0
        sum = ((sum & 1) ? 0x80 : 0) + (sum >> 1) + *shortname++;
    8020645e:	0075171b          	slliw	a4,a0,0x7
    80206462:	0785                	addi	a5,a5,1
    80206464:	0015551b          	srliw	a0,a0,0x1
    80206468:	fff7c683          	lbu	a3,-1(a5) # fffffff <_entry-0x70200001>
    8020646c:	9d35                	addw	a0,a0,a3
    8020646e:	953a                	add	a0,a0,a4
    80206470:	0ff57513          	andi	a0,a0,255
    for (int i = CHAR_SHORT_NAME; i != 0; i--) {
    80206474:	fef615e3          	bne	a2,a5,8020645e <cal_checksum+0xe>
}
    80206478:	6422                	ld	s0,8(sp)
    8020647a:	0141                	addi	sp,sp,16
    8020647c:	8082                	ret

000000008020647e <emake>:
{
    8020647e:	7171                	addi	sp,sp,-176
    80206480:	f506                	sd	ra,168(sp)
    80206482:	f122                	sd	s0,160(sp)
    80206484:	ed26                	sd	s1,152(sp)
    80206486:	e94a                	sd	s2,144(sp)
    80206488:	e54e                	sd	s3,136(sp)
    8020648a:	e152                	sd	s4,128(sp)
    8020648c:	fcd6                	sd	s5,120(sp)
    8020648e:	f8da                	sd	s6,112(sp)
    80206490:	f4de                	sd	s7,104(sp)
    80206492:	f0e2                	sd	s8,96(sp)
    80206494:	ece6                	sd	s9,88(sp)
    80206496:	e8ea                	sd	s10,80(sp)
    80206498:	e4ee                	sd	s11,72(sp)
    8020649a:	1900                	addi	s0,sp,176
    if (!(dp->attribute & ATTR_DIRECTORY))
    8020649c:	10054783          	lbu	a5,256(a0)
    802064a0:	8bc1                	andi	a5,a5,16
    802064a2:	c3d5                	beqz	a5,80206546 <emake+0xc8>
    802064a4:	892a                	mv	s2,a0
    802064a6:	8aae                	mv	s5,a1
    802064a8:	8a32                	mv	s4,a2
    if (off % sizeof(union dentry))
    802064aa:	01f67793          	andi	a5,a2,31
    802064ae:	e7c5                	bnez	a5,80206556 <emake+0xd8>
    memset(&de, 0, sizeof(de));
    802064b0:	02000613          	li	a2,32
    802064b4:	4581                	li	a1,0
    802064b6:	f7040513          	addi	a0,s0,-144
    802064ba:	ffffa097          	auipc	ra,0xffffa
    802064be:	2d6080e7          	jalr	726(ra) # 80200790 <memset>
    if (off <= 32) {
    802064c2:	02000793          	li	a5,32
    802064c6:	0b47ec63          	bltu	a5,s4,8020657e <emake+0x100>
        if (off == 0) {
    802064ca:	080a1e63          	bnez	s4,80206566 <emake+0xe8>
            strncpy(de.sne.name, ".          ", sizeof(de.sne.name));
    802064ce:	462d                	li	a2,11
    802064d0:	00004597          	auipc	a1,0x4
    802064d4:	c2858593          	addi	a1,a1,-984 # 8020a0f8 <sysnames+0x498>
    802064d8:	f7040513          	addi	a0,s0,-144
    802064dc:	ffffa097          	auipc	ra,0xffffa
    802064e0:	3cc080e7          	jalr	972(ra) # 802008a8 <strncpy>
        de.sne.attr = ATTR_DIRECTORY;
    802064e4:	47c1                	li	a5,16
    802064e6:	f6f40da3          	sb	a5,-133(s0)
        de.sne.fst_clus_hi = (uint16)(ep->first_clus >> 16);        // first clus high 16 bits
    802064ea:	104aa783          	lw	a5,260(s5)
    802064ee:	0107d71b          	srliw	a4,a5,0x10
    802064f2:	f8e41223          	sh	a4,-124(s0)
        de.sne.fst_clus_lo = (uint16)(ep->first_clus & 0xffff);       // low 16 bits
    802064f6:	f8f41523          	sh	a5,-118(s0)
        de.sne.file_size = 0;                                       // filesize is updated in eupdate()
    802064fa:	f8042623          	sw	zero,-116(s0)
        off = reloc_clus(dp, off, 1);
    802064fe:	4605                	li	a2,1
    80206500:	85d2                	mv	a1,s4
    80206502:	854a                	mv	a0,s2
    80206504:	fffff097          	auipc	ra,0xfffff
    80206508:	60a080e7          	jalr	1546(ra) # 80205b0e <reloc_clus>
        rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    8020650c:	02000793          	li	a5,32
    80206510:	0005071b          	sext.w	a4,a0
    80206514:	f7040693          	addi	a3,s0,-144
    80206518:	4601                	li	a2,0
    8020651a:	4585                	li	a1,1
    8020651c:	10c92503          	lw	a0,268(s2)
    80206520:	fffff097          	auipc	ra,0xfffff
    80206524:	6f8080e7          	jalr	1784(ra) # 80205c18 <rw_clus>
}
    80206528:	70aa                	ld	ra,168(sp)
    8020652a:	740a                	ld	s0,160(sp)
    8020652c:	64ea                	ld	s1,152(sp)
    8020652e:	694a                	ld	s2,144(sp)
    80206530:	69aa                	ld	s3,136(sp)
    80206532:	6a0a                	ld	s4,128(sp)
    80206534:	7ae6                	ld	s5,120(sp)
    80206536:	7b46                	ld	s6,112(sp)
    80206538:	7ba6                	ld	s7,104(sp)
    8020653a:	7c06                	ld	s8,96(sp)
    8020653c:	6ce6                	ld	s9,88(sp)
    8020653e:	6d46                	ld	s10,80(sp)
    80206540:	6da6                	ld	s11,72(sp)
    80206542:	614d                	addi	sp,sp,176
    80206544:	8082                	ret
        panic("emake: not dir");
    80206546:	00004517          	auipc	a0,0x4
    8020654a:	b8a50513          	addi	a0,a0,-1142 # 8020a0d0 <sysnames+0x470>
    8020654e:	ffffa097          	auipc	ra,0xffffa
    80206552:	bf6080e7          	jalr	-1034(ra) # 80200144 <panic>
        panic("emake: not aligned");
    80206556:	00004517          	auipc	a0,0x4
    8020655a:	b8a50513          	addi	a0,a0,-1142 # 8020a0e0 <sysnames+0x480>
    8020655e:	ffffa097          	auipc	ra,0xffffa
    80206562:	be6080e7          	jalr	-1050(ra) # 80200144 <panic>
            strncpy(de.sne.name, "..         ", sizeof(de.sne.name));
    80206566:	462d                	li	a2,11
    80206568:	00004597          	auipc	a1,0x4
    8020656c:	ba058593          	addi	a1,a1,-1120 # 8020a108 <sysnames+0x4a8>
    80206570:	f7040513          	addi	a0,s0,-144
    80206574:	ffffa097          	auipc	ra,0xffffa
    80206578:	334080e7          	jalr	820(ra) # 802008a8 <strncpy>
    8020657c:	b7a5                	j	802064e4 <emake+0x66>
        int entcnt = (strlen(ep->filename) + CHAR_LONG_NAME - 1) / CHAR_LONG_NAME;   // count of l-n-entries, rounds up
    8020657e:	89d6                	mv	s3,s5
    80206580:	8556                	mv	a0,s5
    80206582:	ffffa097          	auipc	ra,0xffffa
    80206586:	396080e7          	jalr	918(ra) # 80200918 <strlen>
    8020658a:	f4a43c23          	sd	a0,-168(s0)
    8020658e:	00c5079b          	addiw	a5,a0,12
    80206592:	4db5                	li	s11,13
    80206594:	03b7c7bb          	divw	a5,a5,s11
    80206598:	f4f42a23          	sw	a5,-172(s0)
    8020659c:	00078c1b          	sext.w	s8,a5
        memset(shortname, 0, sizeof(shortname));
    802065a0:	4631                	li	a2,12
    802065a2:	4581                	li	a1,0
    802065a4:	f6040513          	addi	a0,s0,-160
    802065a8:	ffffa097          	auipc	ra,0xffffa
    802065ac:	1e8080e7          	jalr	488(ra) # 80200790 <memset>
    for (int j = strlen(name) - 1; j >= 0; j--) {
    802065b0:	8556                	mv	a0,s5
    802065b2:	ffffa097          	auipc	ra,0xffffa
    802065b6:	366080e7          	jalr	870(ra) # 80200918 <strlen>
    802065ba:	fff5079b          	addiw	a5,a0,-1
    802065be:	0207cc63          	bltz	a5,802065f6 <emake+0x178>
    802065c2:	97d6                	add	a5,a5,s5
    802065c4:	ffea8693          	addi	a3,s5,-2
    802065c8:	96aa                	add	a3,a3,a0
    802065ca:	fff5071b          	addiw	a4,a0,-1
    802065ce:	1702                	slli	a4,a4,0x20
    802065d0:	9301                	srli	a4,a4,0x20
    802065d2:	8e99                	sub	a3,a3,a4
        if (name[j] == '.') {
    802065d4:	02e00613          	li	a2,46
    802065d8:	8b3e                	mv	s6,a5
    802065da:	0007c703          	lbu	a4,0(a5)
    802065de:	00c70663          	beq	a4,a2,802065ea <emake+0x16c>
    for (int j = strlen(name) - 1; j >= 0; j--) {
    802065e2:	17fd                	addi	a5,a5,-1
    802065e4:	fed79ae3          	bne	a5,a3,802065d8 <emake+0x15a>
    char c, *p = name;
    802065e8:	8b56                	mv	s6,s5
        shortname[i++] = c;
    802065ea:	4481                	li	s1,0
        if (i == 8 && p) {
    802065ec:	4ca1                	li	s9,8
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    802065ee:	4d29                	li	s10,10
        if (c == '.') {
    802065f0:	02e00d93          	li	s11,46
    802065f4:	a875                	j	802066b0 <emake+0x232>
    char c, *p = name;
    802065f6:	8b56                	mv	s6,s5
    802065f8:	bfcd                	j	802065ea <emake+0x16c>
        if (i == 8 && p) {
    802065fa:	200b0a63          	beqz	s6,8020680e <emake+0x390>
            if (p + 1 < name) { break; }            // no '.'
    802065fe:	0b05                	addi	s6,s6,1
    80206600:	077b7f63          	bgeu	s6,s7,8020667e <emake+0x200>
    80206604:	f6040793          	addi	a5,s0,-160
    80206608:	97a6                	add	a5,a5,s1
        shortname[i++] = ' ';
    8020660a:	02000693          	li	a3,32
    while (i < CHAR_SHORT_NAME) {
    8020660e:	4729                	li	a4,10
        shortname[i++] = ' ';
    80206610:	2485                	addiw	s1,s1,1
    80206612:	00d78023          	sb	a3,0(a5)
    while (i < CHAR_SHORT_NAME) {
    80206616:	0785                	addi	a5,a5,1
    80206618:	fe975ce3          	bge	a4,s1,80206610 <emake+0x192>
        de.lne.checksum = cal_checksum((uchar *)shortname);
    8020661c:	f6040513          	addi	a0,s0,-160
    80206620:	00000097          	auipc	ra,0x0
    80206624:	e30080e7          	jalr	-464(ra) # 80206450 <cal_checksum>
    80206628:	f6a40ea3          	sb	a0,-131(s0)
        de.lne.attr = ATTR_LONG_NAME;
    8020662c:	47bd                	li	a5,15
    8020662e:	f6f40da3          	sb	a5,-133(s0)
        for (int i = entcnt; i > 0; i--) {
    80206632:	f5843783          	ld	a5,-168(s0)
    80206636:	0ef05563          	blez	a5,80206720 <emake+0x2a2>
    8020663a:	f5442783          	lw	a5,-172(s0)
    8020663e:	fff78d9b          	addiw	s11,a5,-1
    80206642:	001d9b9b          	slliw	s7,s11,0x1
    80206646:	01bb8bbb          	addw	s7,s7,s11
    8020664a:	002b9b9b          	slliw	s7,s7,0x2
    8020664e:	01bb8bbb          	addw	s7,s7,s11
    80206652:	9bd6                	add	s7,s7,s5
    80206654:	8b62                	mv	s6,s8
    80206656:	8cd2                	mv	s9,s4
            int end = 0;
    80206658:	4d01                	li	s10,0
                    *w++ = 0xff;            // on k210, unaligned reading is illegal
    8020665a:	59fd                	li	s3,-1
                switch (j) {
    8020665c:	44ad                	li	s1,11
    8020665e:	aa49                	j	802067f0 <emake+0x372>
            if (name > p) {                    // last '.'
    80206660:	057b7563          	bgeu	s6,s7,802066aa <emake+0x22c>
                memset(shortname + i, ' ', 8 - i);
    80206664:	4621                	li	a2,8
    80206666:	9e05                	subw	a2,a2,s1
    80206668:	02000593          	li	a1,32
    8020666c:	f6040793          	addi	a5,s0,-160
    80206670:	00978533          	add	a0,a5,s1
    80206674:	ffffa097          	auipc	ra,0xffffa
    80206678:	11c080e7          	jalr	284(ra) # 80200790 <memset>
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    8020667c:	8b5e                	mv	s6,s7
        shortname[i++] = c;
    8020667e:	8bda                	mv	s7,s6
    80206680:	84e6                	mv	s1,s9
    80206682:	4b01                	li	s6,0
    80206684:	a02d                	j	802066ae <emake+0x230>
            if (strchr(illegal, c) != NULL) {
    80206686:	85ce                	mv	a1,s3
    80206688:	00206517          	auipc	a0,0x206
    8020668c:	9c850513          	addi	a0,a0,-1592 # 8040c050 <illegal.1653>
    80206690:	ffffa097          	auipc	ra,0xffffa
    80206694:	36a080e7          	jalr	874(ra) # 802009fa <strchr>
    80206698:	c119                	beqz	a0,8020669e <emake+0x220>
                c = '_';
    8020669a:	05f00993          	li	s3,95
        shortname[i++] = c;
    8020669e:	f9040793          	addi	a5,s0,-112
    802066a2:	97a6                	add	a5,a5,s1
    802066a4:	fd378823          	sb	s3,-48(a5)
    802066a8:	2485                	addiw	s1,s1,1
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    802066aa:	f69d49e3          	blt	s10,s1,8020661c <emake+0x19e>
        shortname[i++] = c;
    802066ae:	89de                	mv	s3,s7
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    802066b0:	00198b93          	addi	s7,s3,1
    802066b4:	0009c983          	lbu	s3,0(s3)
    802066b8:	02098563          	beqz	s3,802066e2 <emake+0x264>
        if (i == 8 && p) {
    802066bc:	f3948fe3          	beq	s1,s9,802065fa <emake+0x17c>
        if (c == ' ') { continue; }
    802066c0:	02000793          	li	a5,32
    802066c4:	fef983e3          	beq	s3,a5,802066aa <emake+0x22c>
        if (c == '.') {
    802066c8:	f9b98ce3          	beq	s3,s11,80206660 <emake+0x1e2>
        if (c >= 'a' && c <= 'z') {
    802066cc:	f9f9879b          	addiw	a5,s3,-97
    802066d0:	0ff7f793          	andi	a5,a5,255
    802066d4:	4765                	li	a4,25
    802066d6:	faf768e3          	bltu	a4,a5,80206686 <emake+0x208>
            c += 'A' - 'a';
    802066da:	3981                	addiw	s3,s3,-32
    802066dc:	0ff9f993          	andi	s3,s3,255
    802066e0:	bf7d                	j	8020669e <emake+0x220>
    while (i < CHAR_SHORT_NAME) {
    802066e2:	47a9                	li	a5,10
    802066e4:	f297d0e3          	bge	a5,s1,80206604 <emake+0x186>
    802066e8:	bf15                	j	8020661c <emake+0x19e>
                de.lne.order |= LAST_LONG_ENTRY;
    802066ea:	0407e793          	ori	a5,a5,64
    802066ee:	f6f40823          	sb	a5,-144(s0)
    802066f2:	a229                	j	802067fc <emake+0x37e>
                    if ((*w++ = *p++) == 0) {
    802066f4:	0005c683          	lbu	a3,0(a1)
    802066f8:	00d78023          	sb	a3,0(a5)
                        end = 1;
    802066fc:	0016b693          	seqz	a3,a3
                    *w++ = 0;
    80206700:	000780a3          	sb	zero,1(a5)
    80206704:	0789                	addi	a5,a5,2
                    if ((*w++ = *p++) == 0) {
    80206706:	0585                	addi	a1,a1,1
    80206708:	a055                	j	802067ac <emake+0x32e>
    8020670a:	020a0a1b          	addiw	s4,s4,32
    8020670e:	4781                	li	a5,0
    80206710:	f5843703          	ld	a4,-168(s0)
    80206714:	00e05463          	blez	a4,8020671c <emake+0x29e>
    80206718:	005d979b          	slliw	a5,s11,0x5
    8020671c:	01478a3b          	addw	s4,a5,s4
        memset(&de, 0, sizeof(de));
    80206720:	02000613          	li	a2,32
    80206724:	4581                	li	a1,0
    80206726:	f7040513          	addi	a0,s0,-144
    8020672a:	ffffa097          	auipc	ra,0xffffa
    8020672e:	066080e7          	jalr	102(ra) # 80200790 <memset>
        strncpy(de.sne.name, shortname, sizeof(de.sne.name));
    80206732:	462d                	li	a2,11
    80206734:	f6040593          	addi	a1,s0,-160
    80206738:	f7040513          	addi	a0,s0,-144
    8020673c:	ffffa097          	auipc	ra,0xffffa
    80206740:	16c080e7          	jalr	364(ra) # 802008a8 <strncpy>
        de.sne.attr = ep->attribute;
    80206744:	100ac783          	lbu	a5,256(s5)
    80206748:	f6f40da3          	sb	a5,-133(s0)
        de.sne.fst_clus_hi = (uint16)(ep->first_clus >> 16);      // first clus high 16 bits
    8020674c:	104aa783          	lw	a5,260(s5)
    80206750:	0107d71b          	srliw	a4,a5,0x10
    80206754:	f8e41223          	sh	a4,-124(s0)
        de.sne.fst_clus_lo = (uint16)(ep->first_clus & 0xffff);     // low 16 bits
    80206758:	f8f41523          	sh	a5,-118(s0)
        de.sne.file_size = ep->file_size;                         // filesize is updated in eupdate()
    8020675c:	108aa783          	lw	a5,264(s5)
    80206760:	f8f42623          	sw	a5,-116(s0)
        off = reloc_clus(dp, off, 1);
    80206764:	4605                	li	a2,1
    80206766:	85d2                	mv	a1,s4
    80206768:	854a                	mv	a0,s2
    8020676a:	fffff097          	auipc	ra,0xfffff
    8020676e:	3a4080e7          	jalr	932(ra) # 80205b0e <reloc_clus>
        rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80206772:	02000793          	li	a5,32
    80206776:	0005071b          	sext.w	a4,a0
    8020677a:	f7040693          	addi	a3,s0,-144
    8020677e:	4601                	li	a2,0
    80206780:	4585                	li	a1,1
    80206782:	10c92503          	lw	a0,268(s2)
    80206786:	fffff097          	auipc	ra,0xfffff
    8020678a:	492080e7          	jalr	1170(ra) # 80205c18 <rw_clus>
}
    8020678e:	bb69                	j	80206528 <emake+0xaa>
                    case 5:     w = (uint8 *)de.lne.name2; break;
    80206790:	f7e40793          	addi	a5,s0,-130
    80206794:	a019                	j	8020679a <emake+0x31c>
                switch (j) {
    80206796:	f8c40793          	addi	a5,s0,-116
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    8020679a:	2705                	addiw	a4,a4,1
    8020679c:	fff7061b          	addiw	a2,a4,-1
                if (end) {
    802067a0:	dab1                	beqz	a3,802066f4 <emake+0x276>
                    *w++ = 0xff;            // on k210, unaligned reading is illegal
    802067a2:	01378023          	sb	s3,0(a5)
                    *w++ = 0xff;
    802067a6:	013780a3          	sb	s3,1(a5)
    802067aa:	0789                	addi	a5,a5,2
                switch (j) {
    802067ac:	fea602e3          	beq	a2,a0,80206790 <emake+0x312>
    802067b0:	fe9603e3          	beq	a2,s1,80206796 <emake+0x318>
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    802067b4:	0007061b          	sext.w	a2,a4
    802067b8:	fec851e3          	bge	a6,a2,8020679a <emake+0x31c>
            uint off2 = reloc_clus(dp, off, 1);
    802067bc:	4605                	li	a2,1
    802067be:	85e6                	mv	a1,s9
    802067c0:	854a                	mv	a0,s2
    802067c2:	fffff097          	auipc	ra,0xfffff
    802067c6:	34c080e7          	jalr	844(ra) # 80205b0e <reloc_clus>
            rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off2, sizeof(de));
    802067ca:	02000793          	li	a5,32
    802067ce:	0005071b          	sext.w	a4,a0
    802067d2:	f7040693          	addi	a3,s0,-144
    802067d6:	866a                	mv	a2,s10
    802067d8:	4585                	li	a1,1
    802067da:	10c92503          	lw	a0,268(s2)
    802067de:	fffff097          	auipc	ra,0xfffff
    802067e2:	43a080e7          	jalr	1082(ra) # 80205c18 <rw_clus>
            off += sizeof(de);
    802067e6:	020c8c9b          	addiw	s9,s9,32
        for (int i = entcnt; i > 0; i--) {
    802067ea:	1bcd                	addi	s7,s7,-13
    802067ec:	f1605fe3          	blez	s6,8020670a <emake+0x28c>
            if ((de.lne.order = i) == entcnt) {
    802067f0:	0ffb7793          	andi	a5,s6,255
    802067f4:	eefc0be3          	beq	s8,a5,802066ea <emake+0x26c>
    802067f8:	f6f40823          	sb	a5,-144(s0)
            char *p = ep->filename + (i - 1) * CHAR_LONG_NAME;
    802067fc:	3b7d                	addiw	s6,s6,-1
    802067fe:	85de                	mv	a1,s7
    80206800:	4709                	li	a4,2
            int end = 0;
    80206802:	86ea                	mv	a3,s10
            uint8 *w = (uint8 *)de.lne.name1;
    80206804:	f7140793          	addi	a5,s0,-143
                switch (j) {
    80206808:	4515                	li	a0,5
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    8020680a:	4835                	li	a6,13
    8020680c:	bf41                	j	8020679c <emake+0x31e>
        if (c == ' ') { continue; }
    8020680e:	02000793          	li	a5,32
    80206812:	eaf99be3          	bne	s3,a5,802066c8 <emake+0x24a>
    80206816:	bd61                	j	802066ae <emake+0x230>

0000000080206818 <edup>:
{
    80206818:	1101                	addi	sp,sp,-32
    8020681a:	ec06                	sd	ra,24(sp)
    8020681c:	e822                	sd	s0,16(sp)
    8020681e:	e426                	sd	s1,8(sp)
    80206820:	1000                	addi	s0,sp,32
    80206822:	84aa                	mv	s1,a0
    if (entry != 0) {
    80206824:	c515                	beqz	a0,80206850 <edup+0x38>
        acquire(&ecache.lock);
    80206826:	00225517          	auipc	a0,0x225
    8020682a:	96a50513          	addi	a0,a0,-1686 # 8042b190 <ecache>
    8020682e:	ffffa097          	auipc	ra,0xffffa
    80206832:	ec6080e7          	jalr	-314(ra) # 802006f4 <acquire>
        entry->ref++;
    80206836:	1184a783          	lw	a5,280(s1)
    8020683a:	2785                	addiw	a5,a5,1
    8020683c:	10f4ac23          	sw	a5,280(s1)
        release(&ecache.lock);
    80206840:	00225517          	auipc	a0,0x225
    80206844:	95050513          	addi	a0,a0,-1712 # 8042b190 <ecache>
    80206848:	ffffa097          	auipc	ra,0xffffa
    8020684c:	f00080e7          	jalr	-256(ra) # 80200748 <release>
}
    80206850:	8526                	mv	a0,s1
    80206852:	60e2                	ld	ra,24(sp)
    80206854:	6442                	ld	s0,16(sp)
    80206856:	64a2                	ld	s1,8(sp)
    80206858:	6105                	addi	sp,sp,32
    8020685a:	8082                	ret

000000008020685c <eupdate>:
    if (!entry->dirty || entry->valid != 1) { return; }
    8020685c:	11554783          	lbu	a5,277(a0)
    80206860:	cff1                	beqz	a5,8020693c <eupdate+0xe0>
{
    80206862:	715d                	addi	sp,sp,-80
    80206864:	e486                	sd	ra,72(sp)
    80206866:	e0a2                	sd	s0,64(sp)
    80206868:	fc26                	sd	s1,56(sp)
    8020686a:	f84a                	sd	s2,48(sp)
    8020686c:	0880                	addi	s0,sp,80
    8020686e:	84aa                	mv	s1,a0
    if (!entry->dirty || entry->valid != 1) { return; }
    80206870:	11651703          	lh	a4,278(a0)
    80206874:	4785                	li	a5,1
    80206876:	00f70863          	beq	a4,a5,80206886 <eupdate+0x2a>
}
    8020687a:	60a6                	ld	ra,72(sp)
    8020687c:	6406                	ld	s0,64(sp)
    8020687e:	74e2                	ld	s1,56(sp)
    80206880:	7942                	ld	s2,48(sp)
    80206882:	6161                	addi	sp,sp,80
    80206884:	8082                	ret
    uint entcnt = 0;
    80206886:	fc042e23          	sw	zero,-36(s0)
    uint32 off = reloc_clus(entry->parent, entry->off, 0);
    8020688a:	4601                	li	a2,0
    8020688c:	11c52583          	lw	a1,284(a0)
    80206890:	12053503          	ld	a0,288(a0)
    80206894:	fffff097          	auipc	ra,0xfffff
    80206898:	27a080e7          	jalr	634(ra) # 80205b0e <reloc_clus>
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64) &entcnt, off, 1);
    8020689c:	1204b803          	ld	a6,288(s1)
    802068a0:	4785                	li	a5,1
    802068a2:	0005071b          	sext.w	a4,a0
    802068a6:	fdc40693          	addi	a3,s0,-36
    802068aa:	4601                	li	a2,0
    802068ac:	4581                	li	a1,0
    802068ae:	10c82503          	lw	a0,268(a6)
    802068b2:	fffff097          	auipc	ra,0xfffff
    802068b6:	366080e7          	jalr	870(ra) # 80205c18 <rw_clus>
    entcnt &= ~LAST_LONG_ENTRY;
    802068ba:	fdc42583          	lw	a1,-36(s0)
    802068be:	fbf5f593          	andi	a1,a1,-65
    802068c2:	fcb42e23          	sw	a1,-36(s0)
    off = reloc_clus(entry->parent, entry->off + (entcnt << 5), 0);
    802068c6:	0055959b          	slliw	a1,a1,0x5
    802068ca:	11c4a783          	lw	a5,284(s1)
    802068ce:	4601                	li	a2,0
    802068d0:	9dbd                	addw	a1,a1,a5
    802068d2:	1204b503          	ld	a0,288(s1)
    802068d6:	fffff097          	auipc	ra,0xfffff
    802068da:	238080e7          	jalr	568(ra) # 80205b0e <reloc_clus>
    802068de:	0005091b          	sext.w	s2,a0
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64)&de, off, sizeof(de));
    802068e2:	1204b503          	ld	a0,288(s1)
    802068e6:	02000793          	li	a5,32
    802068ea:	874a                	mv	a4,s2
    802068ec:	fb840693          	addi	a3,s0,-72
    802068f0:	4601                	li	a2,0
    802068f2:	4581                	li	a1,0
    802068f4:	10c52503          	lw	a0,268(a0)
    802068f8:	fffff097          	auipc	ra,0xfffff
    802068fc:	320080e7          	jalr	800(ra) # 80205c18 <rw_clus>
    de.sne.fst_clus_hi = (uint16)(entry->first_clus >> 16);
    80206900:	1044a783          	lw	a5,260(s1)
    80206904:	0107d71b          	srliw	a4,a5,0x10
    80206908:	fce41623          	sh	a4,-52(s0)
    de.sne.fst_clus_lo = (uint16)(entry->first_clus & 0xffff);
    8020690c:	fcf41923          	sh	a5,-46(s0)
    de.sne.file_size = entry->file_size;
    80206910:	1084a783          	lw	a5,264(s1)
    80206914:	fcf42a23          	sw	a5,-44(s0)
    rw_clus(entry->parent->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80206918:	1204b503          	ld	a0,288(s1)
    8020691c:	02000793          	li	a5,32
    80206920:	874a                	mv	a4,s2
    80206922:	fb840693          	addi	a3,s0,-72
    80206926:	4601                	li	a2,0
    80206928:	4585                	li	a1,1
    8020692a:	10c52503          	lw	a0,268(a0)
    8020692e:	fffff097          	auipc	ra,0xfffff
    80206932:	2ea080e7          	jalr	746(ra) # 80205c18 <rw_clus>
    entry->dirty = 0;
    80206936:	10048aa3          	sb	zero,277(s1)
    8020693a:	b781                	j	8020687a <eupdate+0x1e>
    8020693c:	8082                	ret

000000008020693e <eremove>:
    if (entry->valid != 1) { return; }
    8020693e:	11651703          	lh	a4,278(a0)
    80206942:	4785                	li	a5,1
    80206944:	00f70363          	beq	a4,a5,8020694a <eremove+0xc>
    80206948:	8082                	ret
{
    8020694a:	7139                	addi	sp,sp,-64
    8020694c:	fc06                	sd	ra,56(sp)
    8020694e:	f822                	sd	s0,48(sp)
    80206950:	f426                	sd	s1,40(sp)
    80206952:	f04a                	sd	s2,32(sp)
    80206954:	ec4e                	sd	s3,24(sp)
    80206956:	e852                	sd	s4,16(sp)
    80206958:	0080                	addi	s0,sp,64
    8020695a:	89aa                	mv	s3,a0
    uint entcnt = 0;
    8020695c:	fc042623          	sw	zero,-52(s0)
    uint32 off = entry->off;
    80206960:	11c52a03          	lw	s4,284(a0)
    uint32 off2 = reloc_clus(entry->parent, off, 0);
    80206964:	4601                	li	a2,0
    80206966:	85d2                	mv	a1,s4
    80206968:	12053503          	ld	a0,288(a0)
    8020696c:	fffff097          	auipc	ra,0xfffff
    80206970:	1a2080e7          	jalr	418(ra) # 80205b0e <reloc_clus>
    80206974:	0005049b          	sext.w	s1,a0
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64) &entcnt, off2, 1);
    80206978:	1209b503          	ld	a0,288(s3)
    8020697c:	4785                	li	a5,1
    8020697e:	8726                	mv	a4,s1
    80206980:	fcc40693          	addi	a3,s0,-52
    80206984:	4601                	li	a2,0
    80206986:	4581                	li	a1,0
    80206988:	10c52503          	lw	a0,268(a0)
    8020698c:	fffff097          	auipc	ra,0xfffff
    80206990:	28c080e7          	jalr	652(ra) # 80205c18 <rw_clus>
    entcnt &= ~LAST_LONG_ENTRY;
    80206994:	fcc42783          	lw	a5,-52(s0)
    80206998:	fbf7f793          	andi	a5,a5,-65
    8020699c:	fcf42623          	sw	a5,-52(s0)
    uint8 flag = EMPTY_ENTRY;
    802069a0:	5795                	li	a5,-27
    802069a2:	fcf405a3          	sb	a5,-53(s0)
    for (int i = 0; i <= entcnt; i++) {
    802069a6:	4901                	li	s2,0
        rw_clus(entry->parent->cur_clus, 1, 0, (uint64) &flag, off2, 1);
    802069a8:	1209b503          	ld	a0,288(s3)
    802069ac:	4785                	li	a5,1
    802069ae:	8726                	mv	a4,s1
    802069b0:	fcb40693          	addi	a3,s0,-53
    802069b4:	4601                	li	a2,0
    802069b6:	4585                	li	a1,1
    802069b8:	10c52503          	lw	a0,268(a0)
    802069bc:	fffff097          	auipc	ra,0xfffff
    802069c0:	25c080e7          	jalr	604(ra) # 80205c18 <rw_clus>
        off += 32;
    802069c4:	020a0a1b          	addiw	s4,s4,32
        off2 = reloc_clus(entry->parent, off, 0);
    802069c8:	4601                	li	a2,0
    802069ca:	85d2                	mv	a1,s4
    802069cc:	1209b503          	ld	a0,288(s3)
    802069d0:	fffff097          	auipc	ra,0xfffff
    802069d4:	13e080e7          	jalr	318(ra) # 80205b0e <reloc_clus>
    802069d8:	0005049b          	sext.w	s1,a0
    for (int i = 0; i <= entcnt; i++) {
    802069dc:	0019079b          	addiw	a5,s2,1
    802069e0:	0007891b          	sext.w	s2,a5
    802069e4:	fcc42703          	lw	a4,-52(s0)
    802069e8:	fd2770e3          	bgeu	a4,s2,802069a8 <eremove+0x6a>
    entry->valid = -1;
    802069ec:	57fd                	li	a5,-1
    802069ee:	10f99b23          	sh	a5,278(s3)
}
    802069f2:	70e2                	ld	ra,56(sp)
    802069f4:	7442                	ld	s0,48(sp)
    802069f6:	74a2                	ld	s1,40(sp)
    802069f8:	7902                	ld	s2,32(sp)
    802069fa:	69e2                	ld	s3,24(sp)
    802069fc:	6a42                	ld	s4,16(sp)
    802069fe:	6121                	addi	sp,sp,64
    80206a00:	8082                	ret

0000000080206a02 <etrunc>:
{
    80206a02:	7179                	addi	sp,sp,-48
    80206a04:	f406                	sd	ra,40(sp)
    80206a06:	f022                	sd	s0,32(sp)
    80206a08:	ec26                	sd	s1,24(sp)
    80206a0a:	e84a                	sd	s2,16(sp)
    80206a0c:	e44e                	sd	s3,8(sp)
    80206a0e:	e052                	sd	s4,0(sp)
    80206a10:	1800                	addi	s0,sp,48
    80206a12:	8a2a                	mv	s4,a0
    for (uint32 clus = entry->first_clus; clus >= 2 && clus < FAT32_EOC; ) {
    80206a14:	10452483          	lw	s1,260(a0)
    80206a18:	ffe4871b          	addiw	a4,s1,-2
    80206a1c:	100007b7          	lui	a5,0x10000
    80206a20:	17d5                	addi	a5,a5,-11
    80206a22:	02e7e663          	bltu	a5,a4,80206a4e <etrunc+0x4c>
    80206a26:	89be                	mv	s3,a5
        uint32 next = read_fat(clus);
    80206a28:	0004891b          	sext.w	s2,s1
    80206a2c:	8526                	mv	a0,s1
    80206a2e:	fffff097          	auipc	ra,0xfffff
    80206a32:	eac080e7          	jalr	-340(ra) # 802058da <read_fat>
    80206a36:	0005049b          	sext.w	s1,a0
    write_fat(cluster, 0);
    80206a3a:	4581                	li	a1,0
    80206a3c:	854a                	mv	a0,s2
    80206a3e:	fffff097          	auipc	ra,0xfffff
    80206a42:	050080e7          	jalr	80(ra) # 80205a8e <write_fat>
    for (uint32 clus = entry->first_clus; clus >= 2 && clus < FAT32_EOC; ) {
    80206a46:	ffe4879b          	addiw	a5,s1,-2
    80206a4a:	fcf9ffe3          	bgeu	s3,a5,80206a28 <etrunc+0x26>
    entry->file_size = 0;
    80206a4e:	100a2423          	sw	zero,264(s4)
    entry->first_clus = 0;
    80206a52:	100a2223          	sw	zero,260(s4)
    entry->dirty = 1;
    80206a56:	4785                	li	a5,1
    80206a58:	10fa0aa3          	sb	a5,277(s4)
}
    80206a5c:	70a2                	ld	ra,40(sp)
    80206a5e:	7402                	ld	s0,32(sp)
    80206a60:	64e2                	ld	s1,24(sp)
    80206a62:	6942                	ld	s2,16(sp)
    80206a64:	69a2                	ld	s3,8(sp)
    80206a66:	6a02                	ld	s4,0(sp)
    80206a68:	6145                	addi	sp,sp,48
    80206a6a:	8082                	ret

0000000080206a6c <elock>:
{
    80206a6c:	1141                	addi	sp,sp,-16
    80206a6e:	e406                	sd	ra,8(sp)
    80206a70:	e022                	sd	s0,0(sp)
    80206a72:	0800                	addi	s0,sp,16
    if (entry == 0 || entry->ref < 1)
    80206a74:	cd19                	beqz	a0,80206a92 <elock+0x26>
    80206a76:	11852783          	lw	a5,280(a0)
    80206a7a:	00f05c63          	blez	a5,80206a92 <elock+0x26>
    acquiresleep(&entry->lock);
    80206a7e:	13850513          	addi	a0,a0,312
    80206a82:	ffffd097          	auipc	ra,0xffffd
    80206a86:	d18080e7          	jalr	-744(ra) # 8020379a <acquiresleep>
}
    80206a8a:	60a2                	ld	ra,8(sp)
    80206a8c:	6402                	ld	s0,0(sp)
    80206a8e:	0141                	addi	sp,sp,16
    80206a90:	8082                	ret
        panic("elock");
    80206a92:	00003517          	auipc	a0,0x3
    80206a96:	68650513          	addi	a0,a0,1670 # 8020a118 <sysnames+0x4b8>
    80206a9a:	ffff9097          	auipc	ra,0xffff9
    80206a9e:	6aa080e7          	jalr	1706(ra) # 80200144 <panic>

0000000080206aa2 <eunlock>:
{
    80206aa2:	1101                	addi	sp,sp,-32
    80206aa4:	ec06                	sd	ra,24(sp)
    80206aa6:	e822                	sd	s0,16(sp)
    80206aa8:	e426                	sd	s1,8(sp)
    80206aaa:	e04a                	sd	s2,0(sp)
    80206aac:	1000                	addi	s0,sp,32
    if (entry == 0 || !holdingsleep(&entry->lock) || entry->ref < 1)
    80206aae:	c90d                	beqz	a0,80206ae0 <eunlock+0x3e>
    80206ab0:	84aa                	mv	s1,a0
    80206ab2:	13850913          	addi	s2,a0,312
    80206ab6:	854a                	mv	a0,s2
    80206ab8:	ffffd097          	auipc	ra,0xffffd
    80206abc:	d7c080e7          	jalr	-644(ra) # 80203834 <holdingsleep>
    80206ac0:	c105                	beqz	a0,80206ae0 <eunlock+0x3e>
    80206ac2:	1184a783          	lw	a5,280(s1)
    80206ac6:	00f05d63          	blez	a5,80206ae0 <eunlock+0x3e>
    releasesleep(&entry->lock);
    80206aca:	854a                	mv	a0,s2
    80206acc:	ffffd097          	auipc	ra,0xffffd
    80206ad0:	d24080e7          	jalr	-732(ra) # 802037f0 <releasesleep>
}
    80206ad4:	60e2                	ld	ra,24(sp)
    80206ad6:	6442                	ld	s0,16(sp)
    80206ad8:	64a2                	ld	s1,8(sp)
    80206ada:	6902                	ld	s2,0(sp)
    80206adc:	6105                	addi	sp,sp,32
    80206ade:	8082                	ret
        panic("eunlock");
    80206ae0:	00003517          	auipc	a0,0x3
    80206ae4:	64050513          	addi	a0,a0,1600 # 8020a120 <sysnames+0x4c0>
    80206ae8:	ffff9097          	auipc	ra,0xffff9
    80206aec:	65c080e7          	jalr	1628(ra) # 80200144 <panic>

0000000080206af0 <eput>:
{
    80206af0:	1101                	addi	sp,sp,-32
    80206af2:	ec06                	sd	ra,24(sp)
    80206af4:	e822                	sd	s0,16(sp)
    80206af6:	e426                	sd	s1,8(sp)
    80206af8:	e04a                	sd	s2,0(sp)
    80206afa:	1000                	addi	s0,sp,32
    80206afc:	84aa                	mv	s1,a0
    acquire(&ecache.lock);
    80206afe:	00224517          	auipc	a0,0x224
    80206b02:	69250513          	addi	a0,a0,1682 # 8042b190 <ecache>
    80206b06:	ffffa097          	auipc	ra,0xffffa
    80206b0a:	bee080e7          	jalr	-1042(ra) # 802006f4 <acquire>
    if (entry != &root && entry->valid != 0 && entry->ref == 1) {
    80206b0e:	00224797          	auipc	a5,0x224
    80206b12:	51a78793          	addi	a5,a5,1306 # 8042b028 <root>
    80206b16:	00f48a63          	beq	s1,a5,80206b2a <eput+0x3a>
    80206b1a:	11649783          	lh	a5,278(s1)
    80206b1e:	c791                	beqz	a5,80206b2a <eput+0x3a>
    80206b20:	1184a703          	lw	a4,280(s1)
    80206b24:	4785                	li	a5,1
    80206b26:	02f70563          	beq	a4,a5,80206b50 <eput+0x60>
    entry->ref--;
    80206b2a:	1184a783          	lw	a5,280(s1)
    80206b2e:	37fd                	addiw	a5,a5,-1
    80206b30:	10f4ac23          	sw	a5,280(s1)
    release(&ecache.lock);
    80206b34:	00224517          	auipc	a0,0x224
    80206b38:	65c50513          	addi	a0,a0,1628 # 8042b190 <ecache>
    80206b3c:	ffffa097          	auipc	ra,0xffffa
    80206b40:	c0c080e7          	jalr	-1012(ra) # 80200748 <release>
}
    80206b44:	60e2                	ld	ra,24(sp)
    80206b46:	6442                	ld	s0,16(sp)
    80206b48:	64a2                	ld	s1,8(sp)
    80206b4a:	6902                	ld	s2,0(sp)
    80206b4c:	6105                	addi	sp,sp,32
    80206b4e:	8082                	ret
        acquiresleep(&entry->lock);
    80206b50:	13848913          	addi	s2,s1,312
    80206b54:	854a                	mv	a0,s2
    80206b56:	ffffd097          	auipc	ra,0xffffd
    80206b5a:	c44080e7          	jalr	-956(ra) # 8020379a <acquiresleep>
        entry->next->prev = entry->prev;
    80206b5e:	1284b703          	ld	a4,296(s1)
    80206b62:	1304b783          	ld	a5,304(s1)
    80206b66:	12f73823          	sd	a5,304(a4)
        entry->prev->next = entry->next;
    80206b6a:	1284b703          	ld	a4,296(s1)
    80206b6e:	12e7b423          	sd	a4,296(a5)
        entry->next = root.next;
    80206b72:	00224797          	auipc	a5,0x224
    80206b76:	48e78793          	addi	a5,a5,1166 # 8042b000 <fat>
    80206b7a:	1507b703          	ld	a4,336(a5)
    80206b7e:	12e4b423          	sd	a4,296(s1)
        entry->prev = &root;
    80206b82:	00224697          	auipc	a3,0x224
    80206b86:	4a668693          	addi	a3,a3,1190 # 8042b028 <root>
    80206b8a:	12d4b823          	sd	a3,304(s1)
        root.next->prev = entry;
    80206b8e:	12973823          	sd	s1,304(a4)
        root.next = entry;
    80206b92:	1497b823          	sd	s1,336(a5)
        release(&ecache.lock);
    80206b96:	00224517          	auipc	a0,0x224
    80206b9a:	5fa50513          	addi	a0,a0,1530 # 8042b190 <ecache>
    80206b9e:	ffffa097          	auipc	ra,0xffffa
    80206ba2:	baa080e7          	jalr	-1110(ra) # 80200748 <release>
        if (entry->valid == -1) {       // this means some one has called eremove()
    80206ba6:	11649703          	lh	a4,278(s1)
    80206baa:	57fd                	li	a5,-1
    80206bac:	06f70863          	beq	a4,a5,80206c1c <eput+0x12c>
            elock(entry->parent);
    80206bb0:	1204b503          	ld	a0,288(s1)
    80206bb4:	00000097          	auipc	ra,0x0
    80206bb8:	eb8080e7          	jalr	-328(ra) # 80206a6c <elock>
            eupdate(entry);
    80206bbc:	8526                	mv	a0,s1
    80206bbe:	00000097          	auipc	ra,0x0
    80206bc2:	c9e080e7          	jalr	-866(ra) # 8020685c <eupdate>
            eunlock(entry->parent);
    80206bc6:	1204b503          	ld	a0,288(s1)
    80206bca:	00000097          	auipc	ra,0x0
    80206bce:	ed8080e7          	jalr	-296(ra) # 80206aa2 <eunlock>
        releasesleep(&entry->lock);
    80206bd2:	854a                	mv	a0,s2
    80206bd4:	ffffd097          	auipc	ra,0xffffd
    80206bd8:	c1c080e7          	jalr	-996(ra) # 802037f0 <releasesleep>
        struct dirent *eparent = entry->parent;
    80206bdc:	1204b903          	ld	s2,288(s1)
        acquire(&ecache.lock);
    80206be0:	00224517          	auipc	a0,0x224
    80206be4:	5b050513          	addi	a0,a0,1456 # 8042b190 <ecache>
    80206be8:	ffffa097          	auipc	ra,0xffffa
    80206bec:	b0c080e7          	jalr	-1268(ra) # 802006f4 <acquire>
        entry->ref--;
    80206bf0:	1184a783          	lw	a5,280(s1)
    80206bf4:	37fd                	addiw	a5,a5,-1
    80206bf6:	10f4ac23          	sw	a5,280(s1)
        release(&ecache.lock);
    80206bfa:	00224517          	auipc	a0,0x224
    80206bfe:	59650513          	addi	a0,a0,1430 # 8042b190 <ecache>
    80206c02:	ffffa097          	auipc	ra,0xffffa
    80206c06:	b46080e7          	jalr	-1210(ra) # 80200748 <release>
        if (entry->ref == 0) {
    80206c0a:	1184a783          	lw	a5,280(s1)
    80206c0e:	fb9d                	bnez	a5,80206b44 <eput+0x54>
            eput(eparent);
    80206c10:	854a                	mv	a0,s2
    80206c12:	00000097          	auipc	ra,0x0
    80206c16:	ede080e7          	jalr	-290(ra) # 80206af0 <eput>
    80206c1a:	b72d                	j	80206b44 <eput+0x54>
            etrunc(entry);
    80206c1c:	8526                	mv	a0,s1
    80206c1e:	00000097          	auipc	ra,0x0
    80206c22:	de4080e7          	jalr	-540(ra) # 80206a02 <etrunc>
    80206c26:	b775                	j	80206bd2 <eput+0xe2>

0000000080206c28 <estat>:
{
    80206c28:	1101                	addi	sp,sp,-32
    80206c2a:	ec06                	sd	ra,24(sp)
    80206c2c:	e822                	sd	s0,16(sp)
    80206c2e:	e426                	sd	s1,8(sp)
    80206c30:	e04a                	sd	s2,0(sp)
    80206c32:	1000                	addi	s0,sp,32
    80206c34:	892a                	mv	s2,a0
    80206c36:	84ae                	mv	s1,a1
    strncpy(st->name, de->filename, STAT_MAX_NAME);
    80206c38:	02000613          	li	a2,32
    80206c3c:	85aa                	mv	a1,a0
    80206c3e:	8526                	mv	a0,s1
    80206c40:	ffffa097          	auipc	ra,0xffffa
    80206c44:	c68080e7          	jalr	-920(ra) # 802008a8 <strncpy>
    st->type = (de->attribute & ATTR_DIRECTORY) ? T_DIR : T_FILE;
    80206c48:	10094783          	lbu	a5,256(s2)
    80206c4c:	8bc1                	andi	a5,a5,16
    80206c4e:	0017b793          	seqz	a5,a5
    80206c52:	0785                	addi	a5,a5,1
    80206c54:	02f49423          	sh	a5,40(s1)
    st->dev = de->dev;
    80206c58:	11494783          	lbu	a5,276(s2)
    80206c5c:	d0dc                	sw	a5,36(s1)
    st->size = de->file_size;
    80206c5e:	10896783          	lwu	a5,264(s2)
    80206c62:	f89c                	sd	a5,48(s1)
}
    80206c64:	60e2                	ld	ra,24(sp)
    80206c66:	6442                	ld	s0,16(sp)
    80206c68:	64a2                	ld	s1,8(sp)
    80206c6a:	6902                	ld	s2,0(sp)
    80206c6c:	6105                	addi	sp,sp,32
    80206c6e:	8082                	ret

0000000080206c70 <enext>:
 * @return  -1      meet the end of dir
 *          0       find empty slots
 *          1       find a file with all its entries
 */
int enext(struct dirent *dp, struct dirent *ep, uint off, int *count)
{
    80206c70:	7119                	addi	sp,sp,-128
    80206c72:	fc86                	sd	ra,120(sp)
    80206c74:	f8a2                	sd	s0,112(sp)
    80206c76:	f4a6                	sd	s1,104(sp)
    80206c78:	f0ca                	sd	s2,96(sp)
    80206c7a:	ecce                	sd	s3,88(sp)
    80206c7c:	e8d2                	sd	s4,80(sp)
    80206c7e:	e4d6                	sd	s5,72(sp)
    80206c80:	e0da                	sd	s6,64(sp)
    80206c82:	fc5e                	sd	s7,56(sp)
    80206c84:	f862                	sd	s8,48(sp)
    80206c86:	f466                	sd	s9,40(sp)
    80206c88:	0100                	addi	s0,sp,128
    if (!(dp->attribute & ATTR_DIRECTORY))
    80206c8a:	10054783          	lbu	a5,256(a0)
    80206c8e:	8bc1                	andi	a5,a5,16
    80206c90:	cf95                	beqz	a5,80206ccc <enext+0x5c>
    80206c92:	892a                	mv	s2,a0
    80206c94:	8a2e                	mv	s4,a1
    80206c96:	84b2                	mv	s1,a2
    80206c98:	89b6                	mv	s3,a3
        panic("enext not dir");
    if (ep->valid)
    80206c9a:	11659783          	lh	a5,278(a1)
    80206c9e:	ef9d                	bnez	a5,80206cdc <enext+0x6c>
        panic("enext ep valid");
    if (off % 32)
    80206ca0:	01f67793          	andi	a5,a2,31
    80206ca4:	e7a1                	bnez	a5,80206cec <enext+0x7c>
        panic("enext not align");
    if (dp->valid != 1) { return -1; }
    80206ca6:	11651703          	lh	a4,278(a0)
    80206caa:	4785                	li	a5,1
    80206cac:	557d                	li	a0,-1
    80206cae:	04f70763          	beq	a4,a5,80206cfc <enext+0x8c>
            read_entry_info(ep, &de);
            return 1;
        }
    }
    return -1;
}
    80206cb2:	70e6                	ld	ra,120(sp)
    80206cb4:	7446                	ld	s0,112(sp)
    80206cb6:	74a6                	ld	s1,104(sp)
    80206cb8:	7906                	ld	s2,96(sp)
    80206cba:	69e6                	ld	s3,88(sp)
    80206cbc:	6a46                	ld	s4,80(sp)
    80206cbe:	6aa6                	ld	s5,72(sp)
    80206cc0:	6b06                	ld	s6,64(sp)
    80206cc2:	7be2                	ld	s7,56(sp)
    80206cc4:	7c42                	ld	s8,48(sp)
    80206cc6:	7ca2                	ld	s9,40(sp)
    80206cc8:	6109                	addi	sp,sp,128
    80206cca:	8082                	ret
        panic("enext not dir");
    80206ccc:	00003517          	auipc	a0,0x3
    80206cd0:	45c50513          	addi	a0,a0,1116 # 8020a128 <sysnames+0x4c8>
    80206cd4:	ffff9097          	auipc	ra,0xffff9
    80206cd8:	470080e7          	jalr	1136(ra) # 80200144 <panic>
        panic("enext ep valid");
    80206cdc:	00003517          	auipc	a0,0x3
    80206ce0:	45c50513          	addi	a0,a0,1116 # 8020a138 <sysnames+0x4d8>
    80206ce4:	ffff9097          	auipc	ra,0xffff9
    80206ce8:	460080e7          	jalr	1120(ra) # 80200144 <panic>
        panic("enext not align");
    80206cec:	00003517          	auipc	a0,0x3
    80206cf0:	45c50513          	addi	a0,a0,1116 # 8020a148 <sysnames+0x4e8>
    80206cf4:	ffff9097          	auipc	ra,0xffff9
    80206cf8:	450080e7          	jalr	1104(ra) # 80200144 <panic>
    memset(ep->filename, 0, FAT32_MAX_FILENAME + 1);
    80206cfc:	8cae                	mv	s9,a1
    80206cfe:	10000613          	li	a2,256
    80206d02:	4581                	li	a1,0
    80206d04:	8552                	mv	a0,s4
    80206d06:	ffffa097          	auipc	ra,0xffffa
    80206d0a:	a8a080e7          	jalr	-1398(ra) # 80200790 <memset>
    int cnt = 0;
    80206d0e:	4a81                	li	s5,0
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    80206d10:	5b7d                	li	s6,-1
        if (de.lne.order == EMPTY_ENTRY) {
    80206d12:	0e500b93          	li	s7,229
        if (de.lne.attr == ATTR_LONG_NAME) {
    80206d16:	4c3d                	li	s8,15
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    80206d18:	a805                	j	80206d48 <enext+0xd8>
            cnt++;
    80206d1a:	2a85                	addiw	s5,s5,1
            continue;
    80206d1c:	a025                	j	80206d44 <enext+0xd4>
            *count = cnt;
    80206d1e:	0159a023          	sw	s5,0(s3)
            return 0;
    80206d22:	4501                	li	a0,0
    80206d24:	b779                	j	80206cb2 <enext+0x42>
            read_entry_name(ep->filename + (lcnt - 1) * CHAR_LONG_NAME, &de);
    80206d26:	fff5079b          	addiw	a5,a0,-1
    80206d2a:	0017951b          	slliw	a0,a5,0x1
    80206d2e:	9d3d                	addw	a0,a0,a5
    80206d30:	0025151b          	slliw	a0,a0,0x2
    80206d34:	9d3d                	addw	a0,a0,a5
    80206d36:	f8040593          	addi	a1,s0,-128
    80206d3a:	9566                	add	a0,a0,s9
    80206d3c:	fffff097          	auipc	ra,0xfffff
    80206d40:	136080e7          	jalr	310(ra) # 80205e72 <read_entry_name>
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    80206d44:	0204849b          	addiw	s1,s1,32
    80206d48:	4601                	li	a2,0
    80206d4a:	85a6                	mv	a1,s1
    80206d4c:	854a                	mv	a0,s2
    80206d4e:	fffff097          	auipc	ra,0xfffff
    80206d52:	dc0080e7          	jalr	-576(ra) # 80205b0e <reloc_clus>
    80206d56:	f5650ee3          	beq	a0,s6,80206cb2 <enext+0x42>
        if (rw_clus(dp->cur_clus, 0, 0, (uint64)&de, off2, 32) != 32 || de.lne.order == END_OF_ENTRY) {
    80206d5a:	02000793          	li	a5,32
    80206d5e:	0005071b          	sext.w	a4,a0
    80206d62:	f8040693          	addi	a3,s0,-128
    80206d66:	4601                	li	a2,0
    80206d68:	4581                	li	a1,0
    80206d6a:	10c92503          	lw	a0,268(s2)
    80206d6e:	fffff097          	auipc	ra,0xfffff
    80206d72:	eaa080e7          	jalr	-342(ra) # 80205c18 <rw_clus>
    80206d76:	2501                	sext.w	a0,a0
    80206d78:	02000793          	li	a5,32
    80206d7c:	06f51c63          	bne	a0,a5,80206df4 <enext+0x184>
    80206d80:	f8044783          	lbu	a5,-128(s0)
    80206d84:	cbb5                	beqz	a5,80206df8 <enext+0x188>
        if (de.lne.order == EMPTY_ENTRY) {
    80206d86:	f9778ae3          	beq	a5,s7,80206d1a <enext+0xaa>
        } else if (cnt) {
    80206d8a:	f80a9ae3          	bnez	s5,80206d1e <enext+0xae>
        if (de.lne.attr == ATTR_LONG_NAME) {
    80206d8e:	f8b44703          	lbu	a4,-117(s0)
    80206d92:	01871d63          	bne	a4,s8,80206dac <enext+0x13c>
            int lcnt = de.lne.order & ~LAST_LONG_ENTRY;
    80206d96:	0bf7f513          	andi	a0,a5,191
            if (de.lne.order & LAST_LONG_ENTRY) {
    80206d9a:	0407f793          	andi	a5,a5,64
    80206d9e:	d7c1                	beqz	a5,80206d26 <enext+0xb6>
                *count = lcnt + 1;                              // plus the s-n-e;
    80206da0:	0015079b          	addiw	a5,a0,1
    80206da4:	00f9a023          	sw	a5,0(s3)
                count = 0;
    80206da8:	4981                	li	s3,0
    80206daa:	bfb5                	j	80206d26 <enext+0xb6>
            if (count) {
    80206dac:	00098c63          	beqz	s3,80206dc4 <enext+0x154>
                *count = 1;
    80206db0:	4785                	li	a5,1
    80206db2:	00f9a023          	sw	a5,0(s3)
                read_entry_name(ep->filename, &de);
    80206db6:	f8040593          	addi	a1,s0,-128
    80206dba:	8552                	mv	a0,s4
    80206dbc:	fffff097          	auipc	ra,0xfffff
    80206dc0:	0b6080e7          	jalr	182(ra) # 80205e72 <read_entry_name>
    entry->attribute = d->sne.attr;
    80206dc4:	f8b44783          	lbu	a5,-117(s0)
    80206dc8:	10fa0023          	sb	a5,256(s4)
    entry->first_clus = ((uint32)d->sne.fst_clus_hi << 16) | d->sne.fst_clus_lo;
    80206dcc:	f9445783          	lhu	a5,-108(s0)
    80206dd0:	0107979b          	slliw	a5,a5,0x10
    80206dd4:	f9a45703          	lhu	a4,-102(s0)
    80206dd8:	8fd9                	or	a5,a5,a4
    80206dda:	2781                	sext.w	a5,a5
    80206ddc:	10fa2223          	sw	a5,260(s4)
    entry->file_size = d->sne.file_size;
    80206de0:	f9c42703          	lw	a4,-100(s0)
    80206de4:	10ea2423          	sw	a4,264(s4)
    entry->cur_clus = entry->first_clus;
    80206de8:	10fa2623          	sw	a5,268(s4)
    entry->clus_cnt = 0;
    80206dec:	100a2823          	sw	zero,272(s4)
            return 1;
    80206df0:	4505                	li	a0,1
}
    80206df2:	b5c1                	j	80206cb2 <enext+0x42>
            return -1;
    80206df4:	557d                	li	a0,-1
    80206df6:	bd75                	j	80206cb2 <enext+0x42>
    80206df8:	557d                	li	a0,-1
    80206dfa:	bd65                	j	80206cb2 <enext+0x42>

0000000080206dfc <dirlookup>:
 * @param   dp          entry of a directory file
 * @param   filename    target filename
 * @param   poff        offset of proper empty entry slots from the beginning of the dir
 */
struct dirent *dirlookup(struct dirent *dp, char *filename, uint *poff)
{
    80206dfc:	715d                	addi	sp,sp,-80
    80206dfe:	e486                	sd	ra,72(sp)
    80206e00:	e0a2                	sd	s0,64(sp)
    80206e02:	fc26                	sd	s1,56(sp)
    80206e04:	f84a                	sd	s2,48(sp)
    80206e06:	f44e                	sd	s3,40(sp)
    80206e08:	f052                	sd	s4,32(sp)
    80206e0a:	ec56                	sd	s5,24(sp)
    80206e0c:	e85a                	sd	s6,16(sp)
    80206e0e:	0880                	addi	s0,sp,80
    if (!(dp->attribute & ATTR_DIRECTORY))
    80206e10:	10054783          	lbu	a5,256(a0)
    80206e14:	8bc1                	andi	a5,a5,16
    80206e16:	cbb1                	beqz	a5,80206e6a <dirlookup+0x6e>
    80206e18:	84aa                	mv	s1,a0
    80206e1a:	89ae                	mv	s3,a1
    80206e1c:	8ab2                	mv	s5,a2
        panic("dirlookup not DIR");
    if (strncmp(filename, ".", FAT32_MAX_FILENAME) == 0) {
    80206e1e:	0ff00613          	li	a2,255
    80206e22:	00003597          	auipc	a1,0x3
    80206e26:	34e58593          	addi	a1,a1,846 # 8020a170 <sysnames+0x510>
    80206e2a:	854e                	mv	a0,s3
    80206e2c:	ffffa097          	auipc	ra,0xffffa
    80206e30:	a40080e7          	jalr	-1472(ra) # 8020086c <strncmp>
    80206e34:	c139                	beqz	a0,80206e7a <dirlookup+0x7e>
        return edup(dp);
    } else if (strncmp(filename, "..", FAT32_MAX_FILENAME) == 0) {
    80206e36:	0ff00613          	li	a2,255
    80206e3a:	00003597          	auipc	a1,0x3
    80206e3e:	33e58593          	addi	a1,a1,830 # 8020a178 <sysnames+0x518>
    80206e42:	854e                	mv	a0,s3
    80206e44:	ffffa097          	auipc	ra,0xffffa
    80206e48:	a28080e7          	jalr	-1496(ra) # 8020086c <strncmp>
    80206e4c:	ed39                	bnez	a0,80206eaa <dirlookup+0xae>
        if (dp == &root) {
    80206e4e:	00224797          	auipc	a5,0x224
    80206e52:	1da78793          	addi	a5,a5,474 # 8042b028 <root>
    80206e56:	04f48363          	beq	s1,a5,80206e9c <dirlookup+0xa0>
            return edup(&root);
        }
        return edup(dp->parent);
    80206e5a:	1204b503          	ld	a0,288(s1)
    80206e5e:	00000097          	auipc	ra,0x0
    80206e62:	9ba080e7          	jalr	-1606(ra) # 80206818 <edup>
    80206e66:	892a                	mv	s2,a0
    80206e68:	a839                	j	80206e86 <dirlookup+0x8a>
        panic("dirlookup not DIR");
    80206e6a:	00003517          	auipc	a0,0x3
    80206e6e:	2ee50513          	addi	a0,a0,750 # 8020a158 <sysnames+0x4f8>
    80206e72:	ffff9097          	auipc	ra,0xffff9
    80206e76:	2d2080e7          	jalr	722(ra) # 80200144 <panic>
        return edup(dp);
    80206e7a:	8526                	mv	a0,s1
    80206e7c:	00000097          	auipc	ra,0x0
    80206e80:	99c080e7          	jalr	-1636(ra) # 80206818 <edup>
    80206e84:	892a                	mv	s2,a0
    if (poff) {
        *poff = off;
    }
    eput(ep);
    return NULL;
}
    80206e86:	854a                	mv	a0,s2
    80206e88:	60a6                	ld	ra,72(sp)
    80206e8a:	6406                	ld	s0,64(sp)
    80206e8c:	74e2                	ld	s1,56(sp)
    80206e8e:	7942                	ld	s2,48(sp)
    80206e90:	79a2                	ld	s3,40(sp)
    80206e92:	7a02                	ld	s4,32(sp)
    80206e94:	6ae2                	ld	s5,24(sp)
    80206e96:	6b42                	ld	s6,16(sp)
    80206e98:	6161                	addi	sp,sp,80
    80206e9a:	8082                	ret
            return edup(&root);
    80206e9c:	853e                	mv	a0,a5
    80206e9e:	00000097          	auipc	ra,0x0
    80206ea2:	97a080e7          	jalr	-1670(ra) # 80206818 <edup>
    80206ea6:	892a                	mv	s2,a0
    80206ea8:	bff9                	j	80206e86 <dirlookup+0x8a>
    if (dp->valid != 1) {
    80206eaa:	11649703          	lh	a4,278(s1)
    80206eae:	4785                	li	a5,1
        return NULL;
    80206eb0:	4901                	li	s2,0
    if (dp->valid != 1) {
    80206eb2:	fcf71ae3          	bne	a4,a5,80206e86 <dirlookup+0x8a>
    struct dirent *ep = eget(dp, filename);
    80206eb6:	85ce                	mv	a1,s3
    80206eb8:	8526                	mv	a0,s1
    80206eba:	fffff097          	auipc	ra,0xfffff
    80206ebe:	eaa080e7          	jalr	-342(ra) # 80205d64 <eget>
    80206ec2:	892a                	mv	s2,a0
    if (ep->valid == 1) { return ep; }                               // ecache hits
    80206ec4:	11651703          	lh	a4,278(a0)
    80206ec8:	4785                	li	a5,1
    80206eca:	faf70ee3          	beq	a4,a5,80206e86 <dirlookup+0x8a>
    int len = strlen(filename);
    80206ece:	854e                	mv	a0,s3
    80206ed0:	ffffa097          	auipc	ra,0xffffa
    80206ed4:	a48080e7          	jalr	-1464(ra) # 80200918 <strlen>
    int count = 0;
    80206ed8:	fa042e23          	sw	zero,-68(s0)
    reloc_clus(dp, 0, 0);
    80206edc:	4601                	li	a2,0
    80206ede:	4581                	li	a1,0
    80206ee0:	8526                	mv	a0,s1
    80206ee2:	fffff097          	auipc	ra,0xfffff
    80206ee6:	c2c080e7          	jalr	-980(ra) # 80205b0e <reloc_clus>
    uint off = 0;
    80206eea:	4a01                	li	s4,0
    while ((type = enext(dp, ep, off, &count) != -1)) {
    80206eec:	5b7d                	li	s6,-1
    80206eee:	fbc40693          	addi	a3,s0,-68
    80206ef2:	8652                	mv	a2,s4
    80206ef4:	85ca                	mv	a1,s2
    80206ef6:	8526                	mv	a0,s1
    80206ef8:	00000097          	auipc	ra,0x0
    80206efc:	d78080e7          	jalr	-648(ra) # 80206c70 <enext>
    80206f00:	03650f63          	beq	a0,s6,80206f3e <dirlookup+0x142>
        } else if (strncmp(filename, ep->filename, FAT32_MAX_FILENAME) == 0) {
    80206f04:	0ff00613          	li	a2,255
    80206f08:	85ca                	mv	a1,s2
    80206f0a:	854e                	mv	a0,s3
    80206f0c:	ffffa097          	auipc	ra,0xffffa
    80206f10:	960080e7          	jalr	-1696(ra) # 8020086c <strncmp>
    80206f14:	c901                	beqz	a0,80206f24 <dirlookup+0x128>
        off += count << 5;
    80206f16:	fbc42783          	lw	a5,-68(s0)
    80206f1a:	0057979b          	slliw	a5,a5,0x5
    80206f1e:	01478a3b          	addw	s4,a5,s4
    80206f22:	b7f1                	j	80206eee <dirlookup+0xf2>
            ep->parent = edup(dp);
    80206f24:	8526                	mv	a0,s1
    80206f26:	00000097          	auipc	ra,0x0
    80206f2a:	8f2080e7          	jalr	-1806(ra) # 80206818 <edup>
    80206f2e:	12a93023          	sd	a0,288(s2)
            ep->off = off;
    80206f32:	11492e23          	sw	s4,284(s2)
            ep->valid = 1;
    80206f36:	4785                	li	a5,1
    80206f38:	10f91b23          	sh	a5,278(s2)
            return ep;
    80206f3c:	b7a9                	j	80206e86 <dirlookup+0x8a>
    if (poff) {
    80206f3e:	000a8463          	beqz	s5,80206f46 <dirlookup+0x14a>
        *poff = off;
    80206f42:	014aa023          	sw	s4,0(s5)
    eput(ep);
    80206f46:	854a                	mv	a0,s2
    80206f48:	00000097          	auipc	ra,0x0
    80206f4c:	ba8080e7          	jalr	-1112(ra) # 80206af0 <eput>
    return NULL;
    80206f50:	4901                	li	s2,0
    80206f52:	bf15                	j	80206e86 <dirlookup+0x8a>

0000000080206f54 <ealloc>:
{
    80206f54:	7139                	addi	sp,sp,-64
    80206f56:	fc06                	sd	ra,56(sp)
    80206f58:	f822                	sd	s0,48(sp)
    80206f5a:	f426                	sd	s1,40(sp)
    80206f5c:	f04a                	sd	s2,32(sp)
    80206f5e:	ec4e                	sd	s3,24(sp)
    80206f60:	e852                	sd	s4,16(sp)
    80206f62:	0080                	addi	s0,sp,64
    80206f64:	892a                	mv	s2,a0
    if (!(dp->attribute & ATTR_DIRECTORY)) {
    80206f66:	10054783          	lbu	a5,256(a0)
    80206f6a:	8bc1                	andi	a5,a5,16
    80206f6c:	c7a9                	beqz	a5,80206fb6 <ealloc+0x62>
    80206f6e:	852e                	mv	a0,a1
    80206f70:	8a32                	mv	s4,a2
    if (dp->valid != 1 || !(name = formatname(name))) {        // detect illegal character
    80206f72:	11691703          	lh	a4,278(s2)
    80206f76:	4785                	li	a5,1
        return NULL;
    80206f78:	4481                	li	s1,0
    if (dp->valid != 1 || !(name = formatname(name))) {        // detect illegal character
    80206f7a:	02f71563          	bne	a4,a5,80206fa4 <ealloc+0x50>
    80206f7e:	fffff097          	auipc	ra,0xfffff
    80206f82:	448080e7          	jalr	1096(ra) # 802063c6 <formatname>
    80206f86:	89aa                	mv	s3,a0
    80206f88:	10050663          	beqz	a0,80207094 <ealloc+0x140>
    uint off = 0;
    80206f8c:	fc042623          	sw	zero,-52(s0)
    if ((ep = dirlookup(dp, name, &off)) != 0) {      // entry exists
    80206f90:	fcc40613          	addi	a2,s0,-52
    80206f94:	85aa                	mv	a1,a0
    80206f96:	854a                	mv	a0,s2
    80206f98:	00000097          	auipc	ra,0x0
    80206f9c:	e64080e7          	jalr	-412(ra) # 80206dfc <dirlookup>
    80206fa0:	84aa                	mv	s1,a0
    80206fa2:	c115                	beqz	a0,80206fc6 <ealloc+0x72>
}
    80206fa4:	8526                	mv	a0,s1
    80206fa6:	70e2                	ld	ra,56(sp)
    80206fa8:	7442                	ld	s0,48(sp)
    80206faa:	74a2                	ld	s1,40(sp)
    80206fac:	7902                	ld	s2,32(sp)
    80206fae:	69e2                	ld	s3,24(sp)
    80206fb0:	6a42                	ld	s4,16(sp)
    80206fb2:	6121                	addi	sp,sp,64
    80206fb4:	8082                	ret
        panic("ealloc not dir");
    80206fb6:	00003517          	auipc	a0,0x3
    80206fba:	1ca50513          	addi	a0,a0,458 # 8020a180 <sysnames+0x520>
    80206fbe:	ffff9097          	auipc	ra,0xffff9
    80206fc2:	186080e7          	jalr	390(ra) # 80200144 <panic>
    ep = eget(dp, name);
    80206fc6:	85ce                	mv	a1,s3
    80206fc8:	854a                	mv	a0,s2
    80206fca:	fffff097          	auipc	ra,0xfffff
    80206fce:	d9a080e7          	jalr	-614(ra) # 80205d64 <eget>
    80206fd2:	84aa                	mv	s1,a0
    elock(ep);
    80206fd4:	00000097          	auipc	ra,0x0
    80206fd8:	a98080e7          	jalr	-1384(ra) # 80206a6c <elock>
    ep->attribute = attr;
    80206fdc:	11448023          	sb	s4,256(s1)
    ep->file_size = 0;
    80206fe0:	1004a423          	sw	zero,264(s1)
    ep->first_clus = 0;
    80206fe4:	1004a223          	sw	zero,260(s1)
    ep->parent = edup(dp);
    80206fe8:	854a                	mv	a0,s2
    80206fea:	00000097          	auipc	ra,0x0
    80206fee:	82e080e7          	jalr	-2002(ra) # 80206818 <edup>
    80206ff2:	12a4b023          	sd	a0,288(s1)
    ep->off = off;
    80206ff6:	fcc42783          	lw	a5,-52(s0)
    80206ffa:	10f4ae23          	sw	a5,284(s1)
    ep->clus_cnt = 0;
    80206ffe:	1004a823          	sw	zero,272(s1)
    ep->cur_clus = 0;
    80207002:	1004a623          	sw	zero,268(s1)
    ep->dirty = 0;
    80207006:	10048aa3          	sb	zero,277(s1)
    strncpy(ep->filename, name, FAT32_MAX_FILENAME);
    8020700a:	0ff00613          	li	a2,255
    8020700e:	85ce                	mv	a1,s3
    80207010:	8526                	mv	a0,s1
    80207012:	ffffa097          	auipc	ra,0xffffa
    80207016:	896080e7          	jalr	-1898(ra) # 802008a8 <strncpy>
    ep->filename[FAT32_MAX_FILENAME] = '\0';
    8020701a:	0e048fa3          	sb	zero,255(s1)
    if (attr == ATTR_DIRECTORY) {    // generate "." and ".." for ep
    8020701e:	47c1                	li	a5,16
    80207020:	02fa0963          	beq	s4,a5,80207052 <ealloc+0xfe>
        ep->attribute |= ATTR_ARCHIVE;
    80207024:	1004c783          	lbu	a5,256(s1)
    80207028:	0207e793          	ori	a5,a5,32
    8020702c:	10f48023          	sb	a5,256(s1)
    emake(dp, ep, off);
    80207030:	fcc42603          	lw	a2,-52(s0)
    80207034:	85a6                	mv	a1,s1
    80207036:	854a                	mv	a0,s2
    80207038:	fffff097          	auipc	ra,0xfffff
    8020703c:	446080e7          	jalr	1094(ra) # 8020647e <emake>
    ep->valid = 1;
    80207040:	4785                	li	a5,1
    80207042:	10f49b23          	sh	a5,278(s1)
    eunlock(ep);
    80207046:	8526                	mv	a0,s1
    80207048:	00000097          	auipc	ra,0x0
    8020704c:	a5a080e7          	jalr	-1446(ra) # 80206aa2 <eunlock>
    return ep;
    80207050:	bf91                	j	80206fa4 <ealloc+0x50>
        ep->attribute |= ATTR_DIRECTORY;
    80207052:	1004c783          	lbu	a5,256(s1)
    80207056:	0107e793          	ori	a5,a5,16
    8020705a:	10f48023          	sb	a5,256(s1)
        ep->cur_clus = ep->first_clus = alloc_clus(dp->dev);
    8020705e:	11494503          	lbu	a0,276(s2)
    80207062:	fffff097          	auipc	ra,0xfffff
    80207066:	8ec080e7          	jalr	-1812(ra) # 8020594e <alloc_clus>
    8020706a:	2501                	sext.w	a0,a0
    8020706c:	10a4a223          	sw	a0,260(s1)
    80207070:	10a4a623          	sw	a0,268(s1)
        emake(ep, ep, 0);
    80207074:	4601                	li	a2,0
    80207076:	85a6                	mv	a1,s1
    80207078:	8526                	mv	a0,s1
    8020707a:	fffff097          	auipc	ra,0xfffff
    8020707e:	404080e7          	jalr	1028(ra) # 8020647e <emake>
        emake(ep, dp, 32);
    80207082:	02000613          	li	a2,32
    80207086:	85ca                	mv	a1,s2
    80207088:	8526                	mv	a0,s1
    8020708a:	fffff097          	auipc	ra,0xfffff
    8020708e:	3f4080e7          	jalr	1012(ra) # 8020647e <emake>
    80207092:	bf79                	j	80207030 <ealloc+0xdc>
        return NULL;
    80207094:	84aa                	mv	s1,a0
    80207096:	b739                	j	80206fa4 <ealloc+0x50>

0000000080207098 <lookup_path>:
    return path;
}

// FAT32 version of namex in xv6's original file system.
static struct dirent *lookup_path(char *path, int parent, char *name)
{
    80207098:	715d                	addi	sp,sp,-80
    8020709a:	e486                	sd	ra,72(sp)
    8020709c:	e0a2                	sd	s0,64(sp)
    8020709e:	fc26                	sd	s1,56(sp)
    802070a0:	f84a                	sd	s2,48(sp)
    802070a2:	f44e                	sd	s3,40(sp)
    802070a4:	f052                	sd	s4,32(sp)
    802070a6:	ec56                	sd	s5,24(sp)
    802070a8:	e85a                	sd	s6,16(sp)
    802070aa:	e45e                	sd	s7,8(sp)
    802070ac:	e062                	sd	s8,0(sp)
    802070ae:	0880                	addi	s0,sp,80
    802070b0:	892a                	mv	s2,a0
    802070b2:	8b2e                	mv	s6,a1
    802070b4:	8ab2                	mv	s5,a2
    struct dirent *entry, *next;
    if (*path == '/') {
    802070b6:	00054783          	lbu	a5,0(a0)
    802070ba:	02f00713          	li	a4,47
    802070be:	02e78663          	beq	a5,a4,802070ea <lookup_path+0x52>
        entry = edup(&root);
    } else if (*path != '\0') {
        entry = edup(myproc()->cwd);
    } else {
        return NULL;
    802070c2:	4981                	li	s3,0
    } else if (*path != '\0') {
    802070c4:	cba1                	beqz	a5,80207114 <lookup_path+0x7c>
        entry = edup(myproc()->cwd);
    802070c6:	ffffb097          	auipc	ra,0xffffb
    802070ca:	af8080e7          	jalr	-1288(ra) # 80201bbe <myproc>
    802070ce:	15853503          	ld	a0,344(a0)
    802070d2:	fffff097          	auipc	ra,0xfffff
    802070d6:	746080e7          	jalr	1862(ra) # 80206818 <edup>
    802070da:	89aa                	mv	s3,a0
    while (*path == '/') {
    802070dc:	02f00a13          	li	s4,47
    802070e0:	0ff00b93          	li	s7,255
    802070e4:	0ff00c13          	li	s8,255
    802070e8:	a0dd                	j	802071ce <lookup_path+0x136>
        entry = edup(&root);
    802070ea:	00224517          	auipc	a0,0x224
    802070ee:	f3e50513          	addi	a0,a0,-194 # 8042b028 <root>
    802070f2:	fffff097          	auipc	ra,0xfffff
    802070f6:	726080e7          	jalr	1830(ra) # 80206818 <edup>
    802070fa:	89aa                	mv	s3,a0
    802070fc:	b7c5                	j	802070dc <lookup_path+0x44>
    }
    while ((path = skipelem(path, name)) != 0) {
        elock(entry);
        if (!(entry->attribute & ATTR_DIRECTORY)) {
            eunlock(entry);
    802070fe:	854e                	mv	a0,s3
    80207100:	00000097          	auipc	ra,0x0
    80207104:	9a2080e7          	jalr	-1630(ra) # 80206aa2 <eunlock>
            eput(entry);
    80207108:	854e                	mv	a0,s3
    8020710a:	00000097          	auipc	ra,0x0
    8020710e:	9e6080e7          	jalr	-1562(ra) # 80206af0 <eput>
            return NULL;
    80207112:	4981                	li	s3,0
    if (parent) {
        eput(entry);
        return NULL;
    }
    return entry;
}
    80207114:	854e                	mv	a0,s3
    80207116:	60a6                	ld	ra,72(sp)
    80207118:	6406                	ld	s0,64(sp)
    8020711a:	74e2                	ld	s1,56(sp)
    8020711c:	7942                	ld	s2,48(sp)
    8020711e:	79a2                	ld	s3,40(sp)
    80207120:	7a02                	ld	s4,32(sp)
    80207122:	6ae2                	ld	s5,24(sp)
    80207124:	6b42                	ld	s6,16(sp)
    80207126:	6ba2                	ld	s7,8(sp)
    80207128:	6c02                	ld	s8,0(sp)
    8020712a:	6161                	addi	sp,sp,80
    8020712c:	8082                	ret
            eunlock(entry);
    8020712e:	854e                	mv	a0,s3
    80207130:	00000097          	auipc	ra,0x0
    80207134:	972080e7          	jalr	-1678(ra) # 80206aa2 <eunlock>
            return entry;
    80207138:	bff1                	j	80207114 <lookup_path+0x7c>
            eunlock(entry);
    8020713a:	854e                	mv	a0,s3
    8020713c:	00000097          	auipc	ra,0x0
    80207140:	966080e7          	jalr	-1690(ra) # 80206aa2 <eunlock>
            eput(entry);
    80207144:	854e                	mv	a0,s3
    80207146:	00000097          	auipc	ra,0x0
    8020714a:	9aa080e7          	jalr	-1622(ra) # 80206af0 <eput>
            return NULL;
    8020714e:	89ca                	mv	s3,s2
    80207150:	b7d1                	j	80207114 <lookup_path+0x7c>
    int len = path - s;
    80207152:	412487bb          	subw	a5,s1,s2
    if (len > FAT32_MAX_FILENAME) {
    80207156:	863e                	mv	a2,a5
    80207158:	00fbd363          	bge	s7,a5,8020715e <lookup_path+0xc6>
    8020715c:	8662                	mv	a2,s8
    8020715e:	0006079b          	sext.w	a5,a2
    name[len] = 0;
    80207162:	97d6                	add	a5,a5,s5
    80207164:	00078023          	sb	zero,0(a5)
    memmove(name, s, len);
    80207168:	2601                	sext.w	a2,a2
    8020716a:	85ca                	mv	a1,s2
    8020716c:	8556                	mv	a0,s5
    8020716e:	ffff9097          	auipc	ra,0xffff9
    80207172:	682080e7          	jalr	1666(ra) # 802007f0 <memmove>
    while (*path == '/') {
    80207176:	0004c783          	lbu	a5,0(s1)
    8020717a:	01479763          	bne	a5,s4,80207188 <lookup_path+0xf0>
        path++;
    8020717e:	0485                	addi	s1,s1,1
    while (*path == '/') {
    80207180:	0004c783          	lbu	a5,0(s1)
    80207184:	ff478de3          	beq	a5,s4,8020717e <lookup_path+0xe6>
        elock(entry);
    80207188:	854e                	mv	a0,s3
    8020718a:	00000097          	auipc	ra,0x0
    8020718e:	8e2080e7          	jalr	-1822(ra) # 80206a6c <elock>
        if (!(entry->attribute & ATTR_DIRECTORY)) {
    80207192:	1009c783          	lbu	a5,256(s3)
    80207196:	8bc1                	andi	a5,a5,16
    80207198:	d3bd                	beqz	a5,802070fe <lookup_path+0x66>
        if (parent && *path == '\0') {
    8020719a:	000b0563          	beqz	s6,802071a4 <lookup_path+0x10c>
    8020719e:	0004c783          	lbu	a5,0(s1)
    802071a2:	d7d1                	beqz	a5,8020712e <lookup_path+0x96>
        if ((next = dirlookup(entry, name, 0)) == 0) {
    802071a4:	4601                	li	a2,0
    802071a6:	85d6                	mv	a1,s5
    802071a8:	854e                	mv	a0,s3
    802071aa:	00000097          	auipc	ra,0x0
    802071ae:	c52080e7          	jalr	-942(ra) # 80206dfc <dirlookup>
    802071b2:	892a                	mv	s2,a0
    802071b4:	d159                	beqz	a0,8020713a <lookup_path+0xa2>
        eunlock(entry);
    802071b6:	854e                	mv	a0,s3
    802071b8:	00000097          	auipc	ra,0x0
    802071bc:	8ea080e7          	jalr	-1814(ra) # 80206aa2 <eunlock>
        eput(entry);
    802071c0:	854e                	mv	a0,s3
    802071c2:	00000097          	auipc	ra,0x0
    802071c6:	92e080e7          	jalr	-1746(ra) # 80206af0 <eput>
        entry = next;
    802071ca:	89ca                	mv	s3,s2
        eput(entry);
    802071cc:	8926                	mv	s2,s1
    while (*path == '/') {
    802071ce:	00094783          	lbu	a5,0(s2)
    802071d2:	03479363          	bne	a5,s4,802071f8 <lookup_path+0x160>
        path++;
    802071d6:	0905                	addi	s2,s2,1
    while (*path == '/') {
    802071d8:	00094783          	lbu	a5,0(s2)
    802071dc:	ff478de3          	beq	a5,s4,802071d6 <lookup_path+0x13e>
    if (*path == 0) { return NULL; }
    802071e0:	cf89                	beqz	a5,802071fa <lookup_path+0x162>
        path++;
    802071e2:	84ca                	mv	s1,s2
    while (*path != '/' && *path != 0) {
    802071e4:	f74787e3          	beq	a5,s4,80207152 <lookup_path+0xba>
        eput(entry);
    802071e8:	84ca                	mv	s1,s2
    while (*path != '/' && *path != 0) {
    802071ea:	d7a5                	beqz	a5,80207152 <lookup_path+0xba>
        path++;
    802071ec:	0485                	addi	s1,s1,1
    while (*path != '/' && *path != 0) {
    802071ee:	0004c783          	lbu	a5,0(s1)
    802071f2:	ff479ce3          	bne	a5,s4,802071ea <lookup_path+0x152>
    802071f6:	bfb1                	j	80207152 <lookup_path+0xba>
    if (*path == 0) { return NULL; }
    802071f8:	fbe5                	bnez	a5,802071e8 <lookup_path+0x150>
    if (parent) {
    802071fa:	f00b0de3          	beqz	s6,80207114 <lookup_path+0x7c>
        eput(entry);
    802071fe:	854e                	mv	a0,s3
    80207200:	00000097          	auipc	ra,0x0
    80207204:	8f0080e7          	jalr	-1808(ra) # 80206af0 <eput>
        return NULL;
    80207208:	4981                	li	s3,0
    8020720a:	b729                	j	80207114 <lookup_path+0x7c>

000000008020720c <ename>:

struct dirent *ename(char *path)
{
    8020720c:	716d                	addi	sp,sp,-272
    8020720e:	e606                	sd	ra,264(sp)
    80207210:	e222                	sd	s0,256(sp)
    80207212:	0a00                	addi	s0,sp,272
    char name[FAT32_MAX_FILENAME + 1];
    return lookup_path(path, 0, name);
    80207214:	ef040613          	addi	a2,s0,-272
    80207218:	4581                	li	a1,0
    8020721a:	00000097          	auipc	ra,0x0
    8020721e:	e7e080e7          	jalr	-386(ra) # 80207098 <lookup_path>
}
    80207222:	60b2                	ld	ra,264(sp)
    80207224:	6412                	ld	s0,256(sp)
    80207226:	6151                	addi	sp,sp,272
    80207228:	8082                	ret

000000008020722a <enameparent>:

struct dirent *enameparent(char *path, char *name)
{
    8020722a:	1141                	addi	sp,sp,-16
    8020722c:	e406                	sd	ra,8(sp)
    8020722e:	e022                	sd	s0,0(sp)
    80207230:	0800                	addi	s0,sp,16
    80207232:	862e                	mv	a2,a1
    return lookup_path(path, 1, name);
    80207234:	4585                	li	a1,1
    80207236:	00000097          	auipc	ra,0x0
    8020723a:	e62080e7          	jalr	-414(ra) # 80207098 <lookup_path>
}
    8020723e:	60a2                	ld	ra,8(sp)
    80207240:	6402                	ld	s0,0(sp)
    80207242:	0141                	addi	sp,sp,16
    80207244:	8082                	ret

0000000080207246 <plicinit>:

//
// the riscv Platform Level Interrupt Controller (PLIC).
//

void plicinit(void) {
    80207246:	1141                	addi	sp,sp,-16
    80207248:	e406                	sd	ra,8(sp)
    8020724a:	e022                	sd	s0,0(sp)
    8020724c:	0800                	addi	s0,sp,16
    // set desired IRQ priorities non-zero (otherwise disabled).
    //writed(1,PLIC_V + VIRTIO0_IRQ * 4);
    //writed(1, PLIC_V + DISK_IRQ * sizeof(uint32));
    writed(1, PLIC_V + UART1_IRQ * sizeof(uint32));
    8020724e:	00fc37b7          	lui	a5,0xfc3
    80207252:	07ba                	slli	a5,a5,0xe
    80207254:	4705                	li	a4,1
    80207256:	cbd8                	sw	a4,20(a5)
    //writed(1, PLIC_V + UART1_IRQ * sizeof(uint32));
#ifdef	DEBUG
     printf("plicinit\n");
    80207258:	00003517          	auipc	a0,0x3
    8020725c:	f3850513          	addi	a0,a0,-200 # 8020a190 <sysnames+0x530>
    80207260:	ffff9097          	auipc	ra,0xffff9
    80207264:	f2e080e7          	jalr	-210(ra) # 8020018e <printf>
#endif 
}
    80207268:	60a2                	ld	ra,8(sp)
    8020726a:	6402                	ld	s0,0(sp)
    8020726c:	0141                	addi	sp,sp,16
    8020726e:	8082                	ret

0000000080207270 <plicinithart>:

void plicinithart(void) {
    80207270:	1141                	addi	sp,sp,-16
    80207272:	e406                	sd	ra,8(sp)
    80207274:	e022                	sd	s0,0(sp)
    80207276:	0800                	addi	s0,sp,16
    int hart = cpuid();
    80207278:	ffffb097          	auipc	ra,0xffffb
    8020727c:	91a080e7          	jalr	-1766(ra) # 80201b92 <cpuid>
    // set uart's enable bit for this hart's S-mode.
    *(uint32 *)PLIC_SENABLE(hart) = (1 << UART1_IRQ);
    80207280:	0085171b          	slliw	a4,a0,0x8
    80207284:	01f867b7          	lui	a5,0x1f86
    80207288:	0785                	addi	a5,a5,1
    8020728a:	07b6                	slli	a5,a5,0xd
    8020728c:	97ba                	add	a5,a5,a4
    8020728e:	02000713          	li	a4,32
    80207292:	c398                	sw	a4,0(a5)
    // set this hart's S-mode priority threshold to 0.
    *(uint32 *)PLIC_SPRIORITY(hart) = 0;
    80207294:	00d5151b          	slliw	a0,a0,0xd
    80207298:	1f8617b7          	lui	a5,0x1f861
    8020729c:	07a6                	slli	a5,a5,0x9
    8020729e:	953e                	add	a0,a0,a5
    802072a0:	00052023          	sw	zero,0(a0)
#ifdef DEBUG
     printf("plichartinit\n");
    802072a4:	00003517          	auipc	a0,0x3
    802072a8:	efc50513          	addi	a0,a0,-260 # 8020a1a0 <sysnames+0x540>
    802072ac:	ffff9097          	auipc	ra,0xffff9
    802072b0:	ee2080e7          	jalr	-286(ra) # 8020018e <printf>
#endif 
}
    802072b4:	60a2                	ld	ra,8(sp)
    802072b6:	6402                	ld	s0,0(sp)
    802072b8:	0141                	addi	sp,sp,16
    802072ba:	8082                	ret

00000000802072bc <plic_claim>:

// ask the PLIC what interrupt we should serve.
int plic_claim(void) {
    802072bc:	1141                	addi	sp,sp,-16
    802072be:	e406                	sd	ra,8(sp)
    802072c0:	e022                	sd	s0,0(sp)
    802072c2:	0800                	addi	s0,sp,16
    int hart = cpuid();
    802072c4:	ffffb097          	auipc	ra,0xffffb
    802072c8:	8ce080e7          	jalr	-1842(ra) # 80201b92 <cpuid>
    int irq = *(uint32 *)PLIC_SCLAIM(hart);
    802072cc:	00d5179b          	slliw	a5,a0,0xd
    802072d0:	1f861537          	lui	a0,0x1f861
    802072d4:	0526                	slli	a0,a0,0x9
    802072d6:	953e                	add	a0,a0,a5
    return irq;
}
    802072d8:	4148                	lw	a0,4(a0)
    802072da:	60a2                	ld	ra,8(sp)
    802072dc:	6402                	ld	s0,0(sp)
    802072de:	0141                	addi	sp,sp,16
    802072e0:	8082                	ret

00000000802072e2 <plic_complete>:

// tell the PLIC we've served this IRQ.
void plic_complete(int irq) {
    802072e2:	1101                	addi	sp,sp,-32
    802072e4:	ec06                	sd	ra,24(sp)
    802072e6:	e822                	sd	s0,16(sp)
    802072e8:	e426                	sd	s1,8(sp)
    802072ea:	1000                	addi	s0,sp,32
    802072ec:	84aa                	mv	s1,a0
    int hart = cpuid();
    802072ee:	ffffb097          	auipc	ra,0xffffb
    802072f2:	8a4080e7          	jalr	-1884(ra) # 80201b92 <cpuid>
    *(uint32 *)PLIC_SCLAIM(hart) = irq;
    802072f6:	00d5151b          	slliw	a0,a0,0xd
    802072fa:	1f8617b7          	lui	a5,0x1f861
    802072fe:	07a6                	slli	a5,a5,0x9
    80207300:	97aa                	add	a5,a5,a0
    80207302:	c3c4                	sw	s1,4(a5)
}
    80207304:	60e2                	ld	ra,24(sp)
    80207306:	6442                	ld	s0,16(sp)
    80207308:	64a2                	ld	s1,8(sp)
    8020730a:	6105                	addi	sp,sp,32
    8020730c:	8082                	ret

000000008020730e <consolewrite>:
//
// user write()s to the console go here.
//
int
consolewrite(int user_src, uint64 src, int n)
{
    8020730e:	715d                	addi	sp,sp,-80
    80207310:	e486                	sd	ra,72(sp)
    80207312:	e0a2                	sd	s0,64(sp)
    80207314:	fc26                	sd	s1,56(sp)
    80207316:	f84a                	sd	s2,48(sp)
    80207318:	f44e                	sd	s3,40(sp)
    8020731a:	f052                	sd	s4,32(sp)
    8020731c:	ec56                	sd	s5,24(sp)
    8020731e:	0880                	addi	s0,sp,80
    80207320:	8a2a                	mv	s4,a0
    80207322:	84ae                	mv	s1,a1
    80207324:	89b2                	mv	s3,a2
  int i;

  acquire(&cons.lock);
    80207326:	00228517          	auipc	a0,0x228
    8020732a:	4d250513          	addi	a0,a0,1234 # 8042f7f8 <cons>
    8020732e:	ffff9097          	auipc	ra,0xffff9
    80207332:	3c6080e7          	jalr	966(ra) # 802006f4 <acquire>
  for(i = 0; i < n; i++){
    80207336:	05305d63          	blez	s3,80207390 <consolewrite+0x82>
    8020733a:	4901                	li	s2,0
    char c;
    if(either_copyin(&c, user_src, src+i, 1) == -1)
    8020733c:	5afd                	li	s5,-1
    8020733e:	4685                	li	a3,1
    80207340:	8626                	mv	a2,s1
    80207342:	85d2                	mv	a1,s4
    80207344:	fbf40513          	addi	a0,s0,-65
    80207348:	ffffb097          	auipc	ra,0xffffb
    8020734c:	36a080e7          	jalr	874(ra) # 802026b2 <either_copyin>
    80207350:	01550e63          	beq	a0,s5,8020736c <consolewrite+0x5e>
	SBI_CALL_1(SBI_CONSOLE_PUTCHAR, ch);
    80207354:	fbf44503          	lbu	a0,-65(s0)
    80207358:	4581                	li	a1,0
    8020735a:	4601                	li	a2,0
    8020735c:	4681                	li	a3,0
    8020735e:	4885                	li	a7,1
    80207360:	00000073          	ecall
  for(i = 0; i < n; i++){
    80207364:	2905                	addiw	s2,s2,1
    80207366:	0485                	addi	s1,s1,1
    80207368:	fd299be3          	bne	s3,s2,8020733e <consolewrite+0x30>
      break;
    sbi_console_putchar(c);
  }
  release(&cons.lock);
    8020736c:	00228517          	auipc	a0,0x228
    80207370:	48c50513          	addi	a0,a0,1164 # 8042f7f8 <cons>
    80207374:	ffff9097          	auipc	ra,0xffff9
    80207378:	3d4080e7          	jalr	980(ra) # 80200748 <release>

  return i;
}
    8020737c:	854a                	mv	a0,s2
    8020737e:	60a6                	ld	ra,72(sp)
    80207380:	6406                	ld	s0,64(sp)
    80207382:	74e2                	ld	s1,56(sp)
    80207384:	7942                	ld	s2,48(sp)
    80207386:	79a2                	ld	s3,40(sp)
    80207388:	7a02                	ld	s4,32(sp)
    8020738a:	6ae2                	ld	s5,24(sp)
    8020738c:	6161                	addi	sp,sp,80
    8020738e:	8082                	ret
  for(i = 0; i < n; i++){
    80207390:	4901                	li	s2,0
    80207392:	bfe9                	j	8020736c <consolewrite+0x5e>

0000000080207394 <consoleread>:
// user_dist indicates whether dst is a user
// or kernel address.
//
int
consoleread(int user_dst, uint64 dst, int n)
{
    80207394:	7119                	addi	sp,sp,-128
    80207396:	fc86                	sd	ra,120(sp)
    80207398:	f8a2                	sd	s0,112(sp)
    8020739a:	f4a6                	sd	s1,104(sp)
    8020739c:	f0ca                	sd	s2,96(sp)
    8020739e:	ecce                	sd	s3,88(sp)
    802073a0:	e8d2                	sd	s4,80(sp)
    802073a2:	e4d6                	sd	s5,72(sp)
    802073a4:	e0da                	sd	s6,64(sp)
    802073a6:	fc5e                	sd	s7,56(sp)
    802073a8:	f862                	sd	s8,48(sp)
    802073aa:	f466                	sd	s9,40(sp)
    802073ac:	f06a                	sd	s10,32(sp)
    802073ae:	ec6e                	sd	s11,24(sp)
    802073b0:	0100                	addi	s0,sp,128
    802073b2:	8b2a                	mv	s6,a0
    802073b4:	8aae                	mv	s5,a1
    802073b6:	8a32                	mv	s4,a2
  uint target;
  int c;
  char cbuf;

  target = n;
    802073b8:	00060b9b          	sext.w	s7,a2
  acquire(&cons.lock);
    802073bc:	00228517          	auipc	a0,0x228
    802073c0:	43c50513          	addi	a0,a0,1084 # 8042f7f8 <cons>
    802073c4:	ffff9097          	auipc	ra,0xffff9
    802073c8:	330080e7          	jalr	816(ra) # 802006f4 <acquire>
  while(n > 0){
    // wait until interrupt handler has put some
    // input into cons.buffer.
    while(cons.r == cons.w){
    802073cc:	00228497          	auipc	s1,0x228
    802073d0:	42c48493          	addi	s1,s1,1068 # 8042f7f8 <cons>
      if(myproc()->killed){
        release(&cons.lock);
        return -1;
      }
      sleep(&cons.r, &cons.lock);
    802073d4:	89a6                	mv	s3,s1
    802073d6:	00228917          	auipc	s2,0x228
    802073da:	4ba90913          	addi	s2,s2,1210 # 8042f890 <cons+0x98>
    }

    c = cons.buf[cons.r++ % INPUT_BUF];

    if(c == C('D')){  // end-of-file
    802073de:	4c91                	li	s9,4
      break;
    }

    // copy the input byte to the user-space buffer.
    cbuf = c;
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    802073e0:	5d7d                	li	s10,-1
      break;

    dst++;
    --n;

    if(c == '\n'){
    802073e2:	4da9                	li	s11,10
  while(n > 0){
    802073e4:	07405863          	blez	s4,80207454 <consoleread+0xc0>
    while(cons.r == cons.w){
    802073e8:	0984a783          	lw	a5,152(s1)
    802073ec:	09c4a703          	lw	a4,156(s1)
    802073f0:	02f71463          	bne	a4,a5,80207418 <consoleread+0x84>
      if(myproc()->killed){
    802073f4:	ffffa097          	auipc	ra,0xffffa
    802073f8:	7ca080e7          	jalr	1994(ra) # 80201bbe <myproc>
    802073fc:	591c                	lw	a5,48(a0)
    802073fe:	e7b5                	bnez	a5,8020746a <consoleread+0xd6>
      sleep(&cons.r, &cons.lock);
    80207400:	85ce                	mv	a1,s3
    80207402:	854a                	mv	a0,s2
    80207404:	ffffb097          	auipc	ra,0xffffb
    80207408:	01a080e7          	jalr	26(ra) # 8020241e <sleep>
    while(cons.r == cons.w){
    8020740c:	0984a783          	lw	a5,152(s1)
    80207410:	09c4a703          	lw	a4,156(s1)
    80207414:	fef700e3          	beq	a4,a5,802073f4 <consoleread+0x60>
    c = cons.buf[cons.r++ % INPUT_BUF];
    80207418:	0017871b          	addiw	a4,a5,1
    8020741c:	08e4ac23          	sw	a4,152(s1)
    80207420:	07f7f713          	andi	a4,a5,127
    80207424:	9726                	add	a4,a4,s1
    80207426:	01874703          	lbu	a4,24(a4)
    8020742a:	00070c1b          	sext.w	s8,a4
    if(c == C('D')){  // end-of-file
    8020742e:	079c0663          	beq	s8,s9,8020749a <consoleread+0x106>
    cbuf = c;
    80207432:	f8e407a3          	sb	a4,-113(s0)
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    80207436:	4685                	li	a3,1
    80207438:	f8f40613          	addi	a2,s0,-113
    8020743c:	85d6                	mv	a1,s5
    8020743e:	855a                	mv	a0,s6
    80207440:	ffffb097          	auipc	ra,0xffffb
    80207444:	23c080e7          	jalr	572(ra) # 8020267c <either_copyout>
    80207448:	01a50663          	beq	a0,s10,80207454 <consoleread+0xc0>
    dst++;
    8020744c:	0a85                	addi	s5,s5,1
    --n;
    8020744e:	3a7d                	addiw	s4,s4,-1
    if(c == '\n'){
    80207450:	f9bc1ae3          	bne	s8,s11,802073e4 <consoleread+0x50>
      // a whole line has arrived, return to
      // the user-level read().
      break;
    }
  }
  release(&cons.lock);
    80207454:	00228517          	auipc	a0,0x228
    80207458:	3a450513          	addi	a0,a0,932 # 8042f7f8 <cons>
    8020745c:	ffff9097          	auipc	ra,0xffff9
    80207460:	2ec080e7          	jalr	748(ra) # 80200748 <release>

  return target - n;
    80207464:	414b853b          	subw	a0,s7,s4
    80207468:	a811                	j	8020747c <consoleread+0xe8>
        release(&cons.lock);
    8020746a:	00228517          	auipc	a0,0x228
    8020746e:	38e50513          	addi	a0,a0,910 # 8042f7f8 <cons>
    80207472:	ffff9097          	auipc	ra,0xffff9
    80207476:	2d6080e7          	jalr	726(ra) # 80200748 <release>
        return -1;
    8020747a:	557d                	li	a0,-1
}
    8020747c:	70e6                	ld	ra,120(sp)
    8020747e:	7446                	ld	s0,112(sp)
    80207480:	74a6                	ld	s1,104(sp)
    80207482:	7906                	ld	s2,96(sp)
    80207484:	69e6                	ld	s3,88(sp)
    80207486:	6a46                	ld	s4,80(sp)
    80207488:	6aa6                	ld	s5,72(sp)
    8020748a:	6b06                	ld	s6,64(sp)
    8020748c:	7be2                	ld	s7,56(sp)
    8020748e:	7c42                	ld	s8,48(sp)
    80207490:	7ca2                	ld	s9,40(sp)
    80207492:	7d02                	ld	s10,32(sp)
    80207494:	6de2                	ld	s11,24(sp)
    80207496:	6109                	addi	sp,sp,128
    80207498:	8082                	ret
      if(n < target){
    8020749a:	000a071b          	sext.w	a4,s4
    8020749e:	fb777be3          	bgeu	a4,s7,80207454 <consoleread+0xc0>
        cons.r--;
    802074a2:	00228717          	auipc	a4,0x228
    802074a6:	3ef72723          	sw	a5,1006(a4) # 8042f890 <cons+0x98>
    802074aa:	b76d                	j	80207454 <consoleread+0xc0>

00000000802074ac <consputc>:
void consputc(int c) {
    802074ac:	1141                	addi	sp,sp,-16
    802074ae:	e422                	sd	s0,8(sp)
    802074b0:	0800                	addi	s0,sp,16
  if(c == BACKSPACE){
    802074b2:	10000793          	li	a5,256
    802074b6:	00f50b63          	beq	a0,a5,802074cc <consputc+0x20>
    802074ba:	4581                	li	a1,0
    802074bc:	4601                	li	a2,0
    802074be:	4681                	li	a3,0
    802074c0:	4885                	li	a7,1
    802074c2:	00000073          	ecall
}
    802074c6:	6422                	ld	s0,8(sp)
    802074c8:	0141                	addi	sp,sp,16
    802074ca:	8082                	ret
    802074cc:	4521                	li	a0,8
    802074ce:	4581                	li	a1,0
    802074d0:	4601                	li	a2,0
    802074d2:	4681                	li	a3,0
    802074d4:	4885                	li	a7,1
    802074d6:	00000073          	ecall
    802074da:	02000513          	li	a0,32
    802074de:	00000073          	ecall
    802074e2:	4521                	li	a0,8
    802074e4:	00000073          	ecall
}
    802074e8:	bff9                	j	802074c6 <consputc+0x1a>

00000000802074ea <consoleintr>:
// do erase/kill processing, append to cons.buf,
// wake up consoleread() if a whole line has arrived.
//
void
consoleintr(int c)
{
    802074ea:	1101                	addi	sp,sp,-32
    802074ec:	ec06                	sd	ra,24(sp)
    802074ee:	e822                	sd	s0,16(sp)
    802074f0:	e426                	sd	s1,8(sp)
    802074f2:	e04a                	sd	s2,0(sp)
    802074f4:	1000                	addi	s0,sp,32
    802074f6:	84aa                	mv	s1,a0
  acquire(&cons.lock);
    802074f8:	00228517          	auipc	a0,0x228
    802074fc:	30050513          	addi	a0,a0,768 # 8042f7f8 <cons>
    80207500:	ffff9097          	auipc	ra,0xffff9
    80207504:	1f4080e7          	jalr	500(ra) # 802006f4 <acquire>

  switch(c){
    80207508:	47d5                	li	a5,21
    8020750a:	0af48663          	beq	s1,a5,802075b6 <consoleintr+0xcc>
    8020750e:	0297ca63          	blt	a5,s1,80207542 <consoleintr+0x58>
    80207512:	47a1                	li	a5,8
    80207514:	0ef48763          	beq	s1,a5,80207602 <consoleintr+0x118>
    80207518:	47c1                	li	a5,16
    8020751a:	10f49a63          	bne	s1,a5,8020762e <consoleintr+0x144>
  case C('P'):  // Print process list.
    procdump();
    8020751e:	ffffb097          	auipc	ra,0xffffb
    80207522:	1c8080e7          	jalr	456(ra) # 802026e6 <procdump>
      }
    }
    break;
  }
  
  release(&cons.lock);
    80207526:	00228517          	auipc	a0,0x228
    8020752a:	2d250513          	addi	a0,a0,722 # 8042f7f8 <cons>
    8020752e:	ffff9097          	auipc	ra,0xffff9
    80207532:	21a080e7          	jalr	538(ra) # 80200748 <release>
  return;
}
    80207536:	60e2                	ld	ra,24(sp)
    80207538:	6442                	ld	s0,16(sp)
    8020753a:	64a2                	ld	s1,8(sp)
    8020753c:	6902                	ld	s2,0(sp)
    8020753e:	6105                	addi	sp,sp,32
    80207540:	8082                	ret
  switch(c){
    80207542:	07f00793          	li	a5,127
    80207546:	0af48e63          	beq	s1,a5,80207602 <consoleintr+0x118>
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    8020754a:	00228717          	auipc	a4,0x228
    8020754e:	2ae70713          	addi	a4,a4,686 # 8042f7f8 <cons>
    80207552:	0a072783          	lw	a5,160(a4)
    80207556:	09872703          	lw	a4,152(a4)
    8020755a:	9f99                	subw	a5,a5,a4
    8020755c:	07f00713          	li	a4,127
    80207560:	fcf763e3          	bltu	a4,a5,80207526 <consoleintr+0x3c>
      c = (c == '\r') ? '\n' : c;
    80207564:	47b5                	li	a5,13
    80207566:	0cf48763          	beq	s1,a5,80207634 <consoleintr+0x14a>
      consputc(c);
    8020756a:	8526                	mv	a0,s1
    8020756c:	00000097          	auipc	ra,0x0
    80207570:	f40080e7          	jalr	-192(ra) # 802074ac <consputc>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    80207574:	00228797          	auipc	a5,0x228
    80207578:	28478793          	addi	a5,a5,644 # 8042f7f8 <cons>
    8020757c:	0a07a703          	lw	a4,160(a5)
    80207580:	0017069b          	addiw	a3,a4,1
    80207584:	0006861b          	sext.w	a2,a3
    80207588:	0ad7a023          	sw	a3,160(a5)
    8020758c:	07f77713          	andi	a4,a4,127
    80207590:	97ba                	add	a5,a5,a4
    80207592:	00978c23          	sb	s1,24(a5)
      if(c == '\n' || c == C('D') || cons.e == cons.r+INPUT_BUF){
    80207596:	47a9                	li	a5,10
    80207598:	0cf48563          	beq	s1,a5,80207662 <consoleintr+0x178>
    8020759c:	4791                	li	a5,4
    8020759e:	0cf48263          	beq	s1,a5,80207662 <consoleintr+0x178>
    802075a2:	00228797          	auipc	a5,0x228
    802075a6:	2ee7a783          	lw	a5,750(a5) # 8042f890 <cons+0x98>
    802075aa:	0807879b          	addiw	a5,a5,128
    802075ae:	f6f61ce3          	bne	a2,a5,80207526 <consoleintr+0x3c>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    802075b2:	863e                	mv	a2,a5
    802075b4:	a07d                	j	80207662 <consoleintr+0x178>
    while(cons.e != cons.w &&
    802075b6:	00228717          	auipc	a4,0x228
    802075ba:	24270713          	addi	a4,a4,578 # 8042f7f8 <cons>
    802075be:	0a072783          	lw	a5,160(a4)
    802075c2:	09c72703          	lw	a4,156(a4)
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    802075c6:	00228497          	auipc	s1,0x228
    802075ca:	23248493          	addi	s1,s1,562 # 8042f7f8 <cons>
    while(cons.e != cons.w &&
    802075ce:	4929                	li	s2,10
    802075d0:	f4f70be3          	beq	a4,a5,80207526 <consoleintr+0x3c>
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    802075d4:	37fd                	addiw	a5,a5,-1
    802075d6:	07f7f713          	andi	a4,a5,127
    802075da:	9726                	add	a4,a4,s1
    while(cons.e != cons.w &&
    802075dc:	01874703          	lbu	a4,24(a4)
    802075e0:	f52703e3          	beq	a4,s2,80207526 <consoleintr+0x3c>
      cons.e--;
    802075e4:	0af4a023          	sw	a5,160(s1)
      consputc(BACKSPACE);
    802075e8:	10000513          	li	a0,256
    802075ec:	00000097          	auipc	ra,0x0
    802075f0:	ec0080e7          	jalr	-320(ra) # 802074ac <consputc>
    while(cons.e != cons.w &&
    802075f4:	0a04a783          	lw	a5,160(s1)
    802075f8:	09c4a703          	lw	a4,156(s1)
    802075fc:	fcf71ce3          	bne	a4,a5,802075d4 <consoleintr+0xea>
    80207600:	b71d                	j	80207526 <consoleintr+0x3c>
    if(cons.e != cons.w){
    80207602:	00228717          	auipc	a4,0x228
    80207606:	1f670713          	addi	a4,a4,502 # 8042f7f8 <cons>
    8020760a:	0a072783          	lw	a5,160(a4)
    8020760e:	09c72703          	lw	a4,156(a4)
    80207612:	f0f70ae3          	beq	a4,a5,80207526 <consoleintr+0x3c>
      cons.e--;
    80207616:	37fd                	addiw	a5,a5,-1
    80207618:	00228717          	auipc	a4,0x228
    8020761c:	28f72023          	sw	a5,640(a4) # 8042f898 <cons+0xa0>
      consputc(BACKSPACE);
    80207620:	10000513          	li	a0,256
    80207624:	00000097          	auipc	ra,0x0
    80207628:	e88080e7          	jalr	-376(ra) # 802074ac <consputc>
    8020762c:	bded                	j	80207526 <consoleintr+0x3c>
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    8020762e:	ee048ce3          	beqz	s1,80207526 <consoleintr+0x3c>
    80207632:	bf21                	j	8020754a <consoleintr+0x60>
      consputc(c);
    80207634:	4529                	li	a0,10
    80207636:	00000097          	auipc	ra,0x0
    8020763a:	e76080e7          	jalr	-394(ra) # 802074ac <consputc>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    8020763e:	00228797          	auipc	a5,0x228
    80207642:	1ba78793          	addi	a5,a5,442 # 8042f7f8 <cons>
    80207646:	0a07a703          	lw	a4,160(a5)
    8020764a:	0017069b          	addiw	a3,a4,1
    8020764e:	0006861b          	sext.w	a2,a3
    80207652:	0ad7a023          	sw	a3,160(a5)
    80207656:	07f77713          	andi	a4,a4,127
    8020765a:	97ba                	add	a5,a5,a4
    8020765c:	4729                	li	a4,10
    8020765e:	00e78c23          	sb	a4,24(a5)
        cons.w = cons.e;
    80207662:	00228797          	auipc	a5,0x228
    80207666:	22c7a923          	sw	a2,562(a5) # 8042f894 <cons+0x9c>
        wakeup(&cons.r);
    8020766a:	00228517          	auipc	a0,0x228
    8020766e:	22650513          	addi	a0,a0,550 # 8042f890 <cons+0x98>
    80207672:	ffffb097          	auipc	ra,0xffffb
    80207676:	f2e080e7          	jalr	-210(ra) # 802025a0 <wakeup>
    8020767a:	b575                	j	80207526 <consoleintr+0x3c>

000000008020767c <consoleinit>:

void
consoleinit(void)
{
    8020767c:	1101                	addi	sp,sp,-32
    8020767e:	ec06                	sd	ra,24(sp)
    80207680:	e822                	sd	s0,16(sp)
    80207682:	e426                	sd	s1,8(sp)
    80207684:	1000                	addi	s0,sp,32
  initlock(&cons.lock, "cons");
    80207686:	00228497          	auipc	s1,0x228
    8020768a:	17248493          	addi	s1,s1,370 # 8042f7f8 <cons>
    8020768e:	00003597          	auipc	a1,0x3
    80207692:	b2258593          	addi	a1,a1,-1246 # 8020a1b0 <sysnames+0x550>
    80207696:	8526                	mv	a0,s1
    80207698:	ffff9097          	auipc	ra,0xffff9
    8020769c:	018080e7          	jalr	24(ra) # 802006b0 <initlock>

  cons.e = cons.w = cons.r = 0;
    802076a0:	0804ac23          	sw	zero,152(s1)
    802076a4:	0804ae23          	sw	zero,156(s1)
    802076a8:	0a04a023          	sw	zero,160(s1)
  
  // connect read and write system calls
  // to consoleread and consolewrite.
  devsw[CONSOLE].read = consoleread;
    802076ac:	0021f797          	auipc	a5,0x21f
    802076b0:	e9478793          	addi	a5,a5,-364 # 80426540 <devsw>
    802076b4:	00000717          	auipc	a4,0x0
    802076b8:	ce070713          	addi	a4,a4,-800 # 80207394 <consoleread>
    802076bc:	eb98                	sd	a4,16(a5)
  devsw[CONSOLE].write = consolewrite;
    802076be:	00000717          	auipc	a4,0x0
    802076c2:	c5070713          	addi	a4,a4,-944 # 8020730e <consolewrite>
    802076c6:	ef98                	sd	a4,24(a5)
}
    802076c8:	60e2                	ld	ra,24(sp)
    802076ca:	6442                	ld	s0,16(sp)
    802076cc:	64a2                	ld	s1,8(sp)
    802076ce:	6105                	addi	sp,sp,32
    802076d0:	8082                	ret
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
