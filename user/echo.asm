
user/_echo:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/include/stat.h"
#include "xv6-user/user.h"

int
main(int argc, char *argv[])
{
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	ec26                	sd	s1,24(sp)
   8:	e84a                	sd	s2,16(sp)
   a:	e44e                	sd	s3,8(sp)
   c:	e052                	sd	s4,0(sp)
   e:	1800                	addi	s0,sp,48
  int i;

  for(i = 1; i < argc; i++){
  10:	4785                	li	a5,1
  12:	06a7d463          	bge	a5,a0,7a <main+0x7a>
  16:	00858493          	addi	s1,a1,8
  1a:	ffe5099b          	addiw	s3,a0,-2
  1e:	1982                	slli	s3,s3,0x20
  20:	0209d993          	srli	s3,s3,0x20
  24:	098e                	slli	s3,s3,0x3
  26:	05c1                	addi	a1,a1,16
  28:	99ae                	add	s3,s3,a1
    write(1, argv[i], strlen(argv[i]));
    if(i + 1 < argc){
      write(1, " ", 1);
  2a:	00001a17          	auipc	s4,0x1
  2e:	8eea0a13          	addi	s4,s4,-1810 # 918 <malloc+0xe4>
    write(1, argv[i], strlen(argv[i]));
  32:	0004b903          	ld	s2,0(s1)
  36:	854a                	mv	a0,s2
  38:	00000097          	auipc	ra,0x0
  3c:	0c2080e7          	jalr	194(ra) # fa <strlen>
  40:	0005061b          	sext.w	a2,a0
  44:	85ca                	mv	a1,s2
  46:	4505                	li	a0,1
  48:	00000097          	auipc	ra,0x0
  4c:	316080e7          	jalr	790(ra) # 35e <write>
    if(i + 1 < argc){
  50:	04a1                	addi	s1,s1,8
  52:	01348a63          	beq	s1,s3,66 <main+0x66>
      write(1, " ", 1);
  56:	4605                	li	a2,1
  58:	85d2                	mv	a1,s4
  5a:	4505                	li	a0,1
  5c:	00000097          	auipc	ra,0x0
  60:	302080e7          	jalr	770(ra) # 35e <write>
  for(i = 1; i < argc; i++){
  64:	b7f9                	j	32 <main+0x32>
    } else {
      write(1, "\n", 1);
  66:	4605                	li	a2,1
  68:	00001597          	auipc	a1,0x1
  6c:	8b858593          	addi	a1,a1,-1864 # 920 <malloc+0xec>
  70:	4505                	li	a0,1
  72:	00000097          	auipc	ra,0x0
  76:	2ec080e7          	jalr	748(ra) # 35e <write>
    }
  }
  exit(0);
  7a:	4501                	li	a0,0
  7c:	00000097          	auipc	ra,0x0
  80:	2c2080e7          	jalr	706(ra) # 33e <exit>

0000000000000084 <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
  84:	1141                	addi	sp,sp,-16
  86:	e422                	sd	s0,8(sp)
  88:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  8a:	87aa                	mv	a5,a0
  8c:	0585                	addi	a1,a1,1
  8e:	0785                	addi	a5,a5,1
  90:	fff5c703          	lbu	a4,-1(a1)
  94:	fee78fa3          	sb	a4,-1(a5)
  98:	fb75                	bnez	a4,8c <strcpy+0x8>
    ;
  return os;
}
  9a:	6422                	ld	s0,8(sp)
  9c:	0141                	addi	sp,sp,16
  9e:	8082                	ret

00000000000000a0 <strcat>:

char*
strcat(char *s, const char *t)
{
  a0:	1141                	addi	sp,sp,-16
  a2:	e422                	sd	s0,8(sp)
  a4:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
  a6:	00054783          	lbu	a5,0(a0)
  aa:	c385                	beqz	a5,ca <strcat+0x2a>
  ac:	87aa                	mv	a5,a0
    s++;
  ae:	0785                	addi	a5,a5,1
  while(*s)
  b0:	0007c703          	lbu	a4,0(a5)
  b4:	ff6d                	bnez	a4,ae <strcat+0xe>
  while((*s++ = *t++))
  b6:	0585                	addi	a1,a1,1
  b8:	0785                	addi	a5,a5,1
  ba:	fff5c703          	lbu	a4,-1(a1)
  be:	fee78fa3          	sb	a4,-1(a5)
  c2:	fb75                	bnez	a4,b6 <strcat+0x16>
    ;
  return os;
}
  c4:	6422                	ld	s0,8(sp)
  c6:	0141                	addi	sp,sp,16
  c8:	8082                	ret
  while(*s)
  ca:	87aa                	mv	a5,a0
  cc:	b7ed                	j	b6 <strcat+0x16>

00000000000000ce <strcmp>:


int
strcmp(const char *p, const char *q)
{
  ce:	1141                	addi	sp,sp,-16
  d0:	e422                	sd	s0,8(sp)
  d2:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
  d4:	00054783          	lbu	a5,0(a0)
  d8:	cb91                	beqz	a5,ec <strcmp+0x1e>
  da:	0005c703          	lbu	a4,0(a1)
  de:	00f71763          	bne	a4,a5,ec <strcmp+0x1e>
    p++, q++;
  e2:	0505                	addi	a0,a0,1
  e4:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
  e6:	00054783          	lbu	a5,0(a0)
  ea:	fbe5                	bnez	a5,da <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
  ec:	0005c503          	lbu	a0,0(a1)
}
  f0:	40a7853b          	subw	a0,a5,a0
  f4:	6422                	ld	s0,8(sp)
  f6:	0141                	addi	sp,sp,16
  f8:	8082                	ret

00000000000000fa <strlen>:

uint
strlen(const char *s)
{
  fa:	1141                	addi	sp,sp,-16
  fc:	e422                	sd	s0,8(sp)
  fe:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 100:	00054783          	lbu	a5,0(a0)
 104:	cf91                	beqz	a5,120 <strlen+0x26>
 106:	0505                	addi	a0,a0,1
 108:	87aa                	mv	a5,a0
 10a:	4685                	li	a3,1
 10c:	9e89                	subw	a3,a3,a0
 10e:	00f6853b          	addw	a0,a3,a5
 112:	0785                	addi	a5,a5,1
 114:	fff7c703          	lbu	a4,-1(a5)
 118:	fb7d                	bnez	a4,10e <strlen+0x14>
    ;
  return n;
}
 11a:	6422                	ld	s0,8(sp)
 11c:	0141                	addi	sp,sp,16
 11e:	8082                	ret
  for(n = 0; s[n]; n++)
 120:	4501                	li	a0,0
 122:	bfe5                	j	11a <strlen+0x20>

0000000000000124 <memset>:

void*
memset(void *dst, int c, uint n)
{
 124:	1141                	addi	sp,sp,-16
 126:	e422                	sd	s0,8(sp)
 128:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 12a:	ce09                	beqz	a2,144 <memset+0x20>
 12c:	87aa                	mv	a5,a0
 12e:	fff6071b          	addiw	a4,a2,-1
 132:	1702                	slli	a4,a4,0x20
 134:	9301                	srli	a4,a4,0x20
 136:	0705                	addi	a4,a4,1
 138:	972a                	add	a4,a4,a0
    cdst[i] = c;
 13a:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 13e:	0785                	addi	a5,a5,1
 140:	fee79de3          	bne	a5,a4,13a <memset+0x16>
  }
  return dst;
}
 144:	6422                	ld	s0,8(sp)
 146:	0141                	addi	sp,sp,16
 148:	8082                	ret

000000000000014a <strchr>:

char*
strchr(const char *s, char c)
{
 14a:	1141                	addi	sp,sp,-16
 14c:	e422                	sd	s0,8(sp)
 14e:	0800                	addi	s0,sp,16
  for(; *s; s++)
 150:	00054783          	lbu	a5,0(a0)
 154:	cb99                	beqz	a5,16a <strchr+0x20>
    if(*s == c)
 156:	00f58763          	beq	a1,a5,164 <strchr+0x1a>
  for(; *s; s++)
 15a:	0505                	addi	a0,a0,1
 15c:	00054783          	lbu	a5,0(a0)
 160:	fbfd                	bnez	a5,156 <strchr+0xc>
      return (char*)s;
  return 0;
 162:	4501                	li	a0,0
}
 164:	6422                	ld	s0,8(sp)
 166:	0141                	addi	sp,sp,16
 168:	8082                	ret
  return 0;
 16a:	4501                	li	a0,0
 16c:	bfe5                	j	164 <strchr+0x1a>

000000000000016e <gets>:

char*
gets(char *buf, int max)
{
 16e:	711d                	addi	sp,sp,-96
 170:	ec86                	sd	ra,88(sp)
 172:	e8a2                	sd	s0,80(sp)
 174:	e4a6                	sd	s1,72(sp)
 176:	e0ca                	sd	s2,64(sp)
 178:	fc4e                	sd	s3,56(sp)
 17a:	f852                	sd	s4,48(sp)
 17c:	f456                	sd	s5,40(sp)
 17e:	f05a                	sd	s6,32(sp)
 180:	ec5e                	sd	s7,24(sp)
 182:	1080                	addi	s0,sp,96
 184:	8baa                	mv	s7,a0
 186:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 188:	892a                	mv	s2,a0
 18a:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 18c:	4aa9                	li	s5,10
 18e:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 190:	89a6                	mv	s3,s1
 192:	2485                	addiw	s1,s1,1
 194:	0344d863          	bge	s1,s4,1c4 <gets+0x56>
    cc = read(0, &c, 1);
 198:	4605                	li	a2,1
 19a:	faf40593          	addi	a1,s0,-81
 19e:	4501                	li	a0,0
 1a0:	00000097          	auipc	ra,0x0
 1a4:	1b6080e7          	jalr	438(ra) # 356 <read>
    if(cc < 1)
 1a8:	00a05e63          	blez	a0,1c4 <gets+0x56>
    buf[i++] = c;
 1ac:	faf44783          	lbu	a5,-81(s0)
 1b0:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 1b4:	01578763          	beq	a5,s5,1c2 <gets+0x54>
 1b8:	0905                	addi	s2,s2,1
 1ba:	fd679be3          	bne	a5,s6,190 <gets+0x22>
  for(i=0; i+1 < max; ){
 1be:	89a6                	mv	s3,s1
 1c0:	a011                	j	1c4 <gets+0x56>
 1c2:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 1c4:	99de                	add	s3,s3,s7
 1c6:	00098023          	sb	zero,0(s3)
  return buf;
}
 1ca:	855e                	mv	a0,s7
 1cc:	60e6                	ld	ra,88(sp)
 1ce:	6446                	ld	s0,80(sp)
 1d0:	64a6                	ld	s1,72(sp)
 1d2:	6906                	ld	s2,64(sp)
 1d4:	79e2                	ld	s3,56(sp)
 1d6:	7a42                	ld	s4,48(sp)
 1d8:	7aa2                	ld	s5,40(sp)
 1da:	7b02                	ld	s6,32(sp)
 1dc:	6be2                	ld	s7,24(sp)
 1de:	6125                	addi	sp,sp,96
 1e0:	8082                	ret

00000000000001e2 <stat>:

int
stat(const char *n, struct stat *st)
{
 1e2:	1101                	addi	sp,sp,-32
 1e4:	ec06                	sd	ra,24(sp)
 1e6:	e822                	sd	s0,16(sp)
 1e8:	e426                	sd	s1,8(sp)
 1ea:	e04a                	sd	s2,0(sp)
 1ec:	1000                	addi	s0,sp,32
 1ee:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f0:	4581                	li	a1,0
 1f2:	00000097          	auipc	ra,0x0
 1f6:	18c080e7          	jalr	396(ra) # 37e <open>
  if(fd < 0)
 1fa:	02054563          	bltz	a0,224 <stat+0x42>
 1fe:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 200:	85ca                	mv	a1,s2
 202:	00000097          	auipc	ra,0x0
 206:	184080e7          	jalr	388(ra) # 386 <fstat>
 20a:	892a                	mv	s2,a0
  close(fd);
 20c:	8526                	mv	a0,s1
 20e:	00000097          	auipc	ra,0x0
 212:	158080e7          	jalr	344(ra) # 366 <close>
  return r;
}
 216:	854a                	mv	a0,s2
 218:	60e2                	ld	ra,24(sp)
 21a:	6442                	ld	s0,16(sp)
 21c:	64a2                	ld	s1,8(sp)
 21e:	6902                	ld	s2,0(sp)
 220:	6105                	addi	sp,sp,32
 222:	8082                	ret
    return -1;
 224:	597d                	li	s2,-1
 226:	bfc5                	j	216 <stat+0x34>

0000000000000228 <atoi>:

int
atoi(const char *s)
{
 228:	1141                	addi	sp,sp,-16
 22a:	e422                	sd	s0,8(sp)
 22c:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 22e:	00054703          	lbu	a4,0(a0)
 232:	02d00793          	li	a5,45
  int neg = 1;
 236:	4805                	li	a6,1
  if (*s == '-') {
 238:	04f70363          	beq	a4,a5,27e <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 23c:	00054683          	lbu	a3,0(a0)
 240:	fd06879b          	addiw	a5,a3,-48
 244:	0ff7f793          	andi	a5,a5,255
 248:	4725                	li	a4,9
 24a:	02f76d63          	bltu	a4,a5,284 <atoi+0x5c>
  n = 0;
 24e:	4601                	li	a2,0
  while('0' <= *s && *s <= '9')
 250:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 252:	0505                	addi	a0,a0,1
 254:	0026179b          	slliw	a5,a2,0x2
 258:	9fb1                	addw	a5,a5,a2
 25a:	0017979b          	slliw	a5,a5,0x1
 25e:	9fb5                	addw	a5,a5,a3
 260:	fd07861b          	addiw	a2,a5,-48
  while('0' <= *s && *s <= '9')
 264:	00054683          	lbu	a3,0(a0)
 268:	fd06871b          	addiw	a4,a3,-48
 26c:	0ff77713          	andi	a4,a4,255
 270:	fee5f1e3          	bgeu	a1,a4,252 <atoi+0x2a>
  return n * neg;
}
 274:	02c8053b          	mulw	a0,a6,a2
 278:	6422                	ld	s0,8(sp)
 27a:	0141                	addi	sp,sp,16
 27c:	8082                	ret
    s++;
 27e:	0505                	addi	a0,a0,1
    neg = -1;
 280:	587d                	li	a6,-1
 282:	bf6d                	j	23c <atoi+0x14>
  n = 0;
 284:	4601                	li	a2,0
 286:	b7fd                	j	274 <atoi+0x4c>

0000000000000288 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 288:	1141                	addi	sp,sp,-16
 28a:	e422                	sd	s0,8(sp)
 28c:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 28e:	02b57663          	bgeu	a0,a1,2ba <memmove+0x32>
    while(n-- > 0)
 292:	02c05163          	blez	a2,2b4 <memmove+0x2c>
 296:	fff6079b          	addiw	a5,a2,-1
 29a:	1782                	slli	a5,a5,0x20
 29c:	9381                	srli	a5,a5,0x20
 29e:	0785                	addi	a5,a5,1
 2a0:	97aa                	add	a5,a5,a0
  dst = vdst;
 2a2:	872a                	mv	a4,a0
      *dst++ = *src++;
 2a4:	0585                	addi	a1,a1,1
 2a6:	0705                	addi	a4,a4,1
 2a8:	fff5c683          	lbu	a3,-1(a1)
 2ac:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 2b0:	fee79ae3          	bne	a5,a4,2a4 <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 2b4:	6422                	ld	s0,8(sp)
 2b6:	0141                	addi	sp,sp,16
 2b8:	8082                	ret
    dst += n;
 2ba:	00c50733          	add	a4,a0,a2
    src += n;
 2be:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 2c0:	fec05ae3          	blez	a2,2b4 <memmove+0x2c>
 2c4:	fff6079b          	addiw	a5,a2,-1
 2c8:	1782                	slli	a5,a5,0x20
 2ca:	9381                	srli	a5,a5,0x20
 2cc:	fff7c793          	not	a5,a5
 2d0:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 2d2:	15fd                	addi	a1,a1,-1
 2d4:	177d                	addi	a4,a4,-1
 2d6:	0005c683          	lbu	a3,0(a1)
 2da:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 2de:	fee79ae3          	bne	a5,a4,2d2 <memmove+0x4a>
 2e2:	bfc9                	j	2b4 <memmove+0x2c>

00000000000002e4 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 2e4:	1141                	addi	sp,sp,-16
 2e6:	e422                	sd	s0,8(sp)
 2e8:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 2ea:	ca05                	beqz	a2,31a <memcmp+0x36>
 2ec:	fff6069b          	addiw	a3,a2,-1
 2f0:	1682                	slli	a3,a3,0x20
 2f2:	9281                	srli	a3,a3,0x20
 2f4:	0685                	addi	a3,a3,1
 2f6:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 2f8:	00054783          	lbu	a5,0(a0)
 2fc:	0005c703          	lbu	a4,0(a1)
 300:	00e79863          	bne	a5,a4,310 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 304:	0505                	addi	a0,a0,1
    p2++;
 306:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 308:	fed518e3          	bne	a0,a3,2f8 <memcmp+0x14>
  }
  return 0;
 30c:	4501                	li	a0,0
 30e:	a019                	j	314 <memcmp+0x30>
      return *p1 - *p2;
 310:	40e7853b          	subw	a0,a5,a4
}
 314:	6422                	ld	s0,8(sp)
 316:	0141                	addi	sp,sp,16
 318:	8082                	ret
  return 0;
 31a:	4501                	li	a0,0
 31c:	bfe5                	j	314 <memcmp+0x30>

000000000000031e <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 31e:	1141                	addi	sp,sp,-16
 320:	e406                	sd	ra,8(sp)
 322:	e022                	sd	s0,0(sp)
 324:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 326:	00000097          	auipc	ra,0x0
 32a:	f62080e7          	jalr	-158(ra) # 288 <memmove>
}
 32e:	60a2                	ld	ra,8(sp)
 330:	6402                	ld	s0,0(sp)
 332:	0141                	addi	sp,sp,16
 334:	8082                	ret

0000000000000336 <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 336:	4885                	li	a7,1
 ecall
 338:	00000073          	ecall
 ret
 33c:	8082                	ret

000000000000033e <exit>:
.global exit
exit:
 li a7, SYS_exit
 33e:	4889                	li	a7,2
 ecall
 340:	00000073          	ecall
 ret
 344:	8082                	ret

0000000000000346 <wait>:
.global wait
wait:
 li a7, SYS_wait
 346:	488d                	li	a7,3
 ecall
 348:	00000073          	ecall
 ret
 34c:	8082                	ret

000000000000034e <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 34e:	4891                	li	a7,4
 ecall
 350:	00000073          	ecall
 ret
 354:	8082                	ret

0000000000000356 <read>:
.global read
read:
 li a7, SYS_read
 356:	4895                	li	a7,5
 ecall
 358:	00000073          	ecall
 ret
 35c:	8082                	ret

000000000000035e <write>:
.global write
write:
 li a7, SYS_write
 35e:	48c1                	li	a7,16
 ecall
 360:	00000073          	ecall
 ret
 364:	8082                	ret

0000000000000366 <close>:
.global close
close:
 li a7, SYS_close
 366:	48d5                	li	a7,21
 ecall
 368:	00000073          	ecall
 ret
 36c:	8082                	ret

000000000000036e <kill>:
.global kill
kill:
 li a7, SYS_kill
 36e:	4899                	li	a7,6
 ecall
 370:	00000073          	ecall
 ret
 374:	8082                	ret

0000000000000376 <exec>:
.global exec
exec:
 li a7, SYS_exec
 376:	489d                	li	a7,7
 ecall
 378:	00000073          	ecall
 ret
 37c:	8082                	ret

000000000000037e <open>:
.global open
open:
 li a7, SYS_open
 37e:	48bd                	li	a7,15
 ecall
 380:	00000073          	ecall
 ret
 384:	8082                	ret

0000000000000386 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 386:	48a1                	li	a7,8
 ecall
 388:	00000073          	ecall
 ret
 38c:	8082                	ret

000000000000038e <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 38e:	48d1                	li	a7,20
 ecall
 390:	00000073          	ecall
 ret
 394:	8082                	ret

0000000000000396 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 396:	48a5                	li	a7,9
 ecall
 398:	00000073          	ecall
 ret
 39c:	8082                	ret

000000000000039e <dup>:
.global dup
dup:
 li a7, SYS_dup
 39e:	48a9                	li	a7,10
 ecall
 3a0:	00000073          	ecall
 ret
 3a4:	8082                	ret

00000000000003a6 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 3a6:	48ad                	li	a7,11
 ecall
 3a8:	00000073          	ecall
 ret
 3ac:	8082                	ret

00000000000003ae <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 3ae:	48b1                	li	a7,12
 ecall
 3b0:	00000073          	ecall
 ret
 3b4:	8082                	ret

00000000000003b6 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 3b6:	48b5                	li	a7,13
 ecall
 3b8:	00000073          	ecall
 ret
 3bc:	8082                	ret

00000000000003be <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 3be:	48b9                	li	a7,14
 ecall
 3c0:	00000073          	ecall
 ret
 3c4:	8082                	ret

00000000000003c6 <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 3c6:	48d9                	li	a7,22
 ecall
 3c8:	00000073          	ecall
 ret
 3cc:	8082                	ret

00000000000003ce <dev>:
.global dev
dev:
 li a7, SYS_dev
 3ce:	48dd                	li	a7,23
 ecall
 3d0:	00000073          	ecall
 ret
 3d4:	8082                	ret

00000000000003d6 <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 3d6:	48e1                	li	a7,24
 ecall
 3d8:	00000073          	ecall
 ret
 3dc:	8082                	ret

00000000000003de <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 3de:	48e5                	li	a7,25
 ecall
 3e0:	00000073          	ecall
 ret
 3e4:	8082                	ret

00000000000003e6 <remove>:
.global remove
remove:
 li a7, SYS_remove
 3e6:	48c5                	li	a7,17
 ecall
 3e8:	00000073          	ecall
 ret
 3ec:	8082                	ret

00000000000003ee <trace>:
.global trace
trace:
 li a7, SYS_trace
 3ee:	48c9                	li	a7,18
 ecall
 3f0:	00000073          	ecall
 ret
 3f4:	8082                	ret

00000000000003f6 <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 3f6:	48cd                	li	a7,19
 ecall
 3f8:	00000073          	ecall
 ret
 3fc:	8082                	ret

00000000000003fe <rename>:
.global rename
rename:
 li a7, SYS_rename
 3fe:	48e9                	li	a7,26
 ecall
 400:	00000073          	ecall
 ret
 404:	8082                	ret

0000000000000406 <checkchar>:
.global checkchar
checkchar:
 li a7, SYS_checkchar
 406:	48ed                	li	a7,27
 ecall
 408:	00000073          	ecall
 ret
 40c:	8082                	ret

000000000000040e <sprint>:
.global sprint
sprint:
 li a7, SYS_sprint
 40e:	48f1                	li	a7,28
 ecall
 410:	00000073          	ecall
 ret
 414:	8082                	ret

0000000000000416 <putc>:
static char digits[] = "0123456789ABCDEF";
static char printbuf[100];
static int  len = 0;
static void
putc(int fd, char c)
{
 416:	1141                	addi	sp,sp,-16
 418:	e422                	sd	s0,8(sp)
 41a:	0800                	addi	s0,sp,16
  printbuf[len++]=c;
 41c:	00000797          	auipc	a5,0x0
 420:	52c78793          	addi	a5,a5,1324 # 948 <len>
 424:	4398                	lw	a4,0(a5)
 426:	0017069b          	addiw	a3,a4,1
 42a:	c394                	sw	a3,0(a5)
 42c:	00000797          	auipc	a5,0x0
 430:	52c78793          	addi	a5,a5,1324 # 958 <printbuf>
 434:	97ba                	add	a5,a5,a4
 436:	00b78023          	sb	a1,0(a5)
}
 43a:	6422                	ld	s0,8(sp)
 43c:	0141                	addi	sp,sp,16
 43e:	8082                	ret

0000000000000440 <printint>:
	}
}

static void
printint(int fd, int xx, int base, int sgn)
{
 440:	7139                	addi	sp,sp,-64
 442:	fc06                	sd	ra,56(sp)
 444:	f822                	sd	s0,48(sp)
 446:	f426                	sd	s1,40(sp)
 448:	f04a                	sd	s2,32(sp)
 44a:	ec4e                	sd	s3,24(sp)
 44c:	0080                	addi	s0,sp,64
 44e:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 450:	c299                	beqz	a3,456 <printint+0x16>
 452:	0805c863          	bltz	a1,4e2 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 456:	2581                	sext.w	a1,a1
  neg = 0;
 458:	4881                	li	a7,0
 45a:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 45e:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 460:	2601                	sext.w	a2,a2
 462:	00000517          	auipc	a0,0x0
 466:	4ce50513          	addi	a0,a0,1230 # 930 <digits>
 46a:	883a                	mv	a6,a4
 46c:	2705                	addiw	a4,a4,1
 46e:	02c5f7bb          	remuw	a5,a1,a2
 472:	1782                	slli	a5,a5,0x20
 474:	9381                	srli	a5,a5,0x20
 476:	97aa                	add	a5,a5,a0
 478:	0007c783          	lbu	a5,0(a5)
 47c:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 480:	0005879b          	sext.w	a5,a1
 484:	02c5d5bb          	divuw	a1,a1,a2
 488:	0685                	addi	a3,a3,1
 48a:	fec7f0e3          	bgeu	a5,a2,46a <printint+0x2a>
  if(neg)
 48e:	00088b63          	beqz	a7,4a4 <printint+0x64>
    buf[i++] = '-';
 492:	fd040793          	addi	a5,s0,-48
 496:	973e                	add	a4,a4,a5
 498:	02d00793          	li	a5,45
 49c:	fef70823          	sb	a5,-16(a4)
 4a0:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 4a4:	02e05863          	blez	a4,4d4 <printint+0x94>
 4a8:	fc040793          	addi	a5,s0,-64
 4ac:	00e78933          	add	s2,a5,a4
 4b0:	fff78993          	addi	s3,a5,-1
 4b4:	99ba                	add	s3,s3,a4
 4b6:	377d                	addiw	a4,a4,-1
 4b8:	1702                	slli	a4,a4,0x20
 4ba:	9301                	srli	a4,a4,0x20
 4bc:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 4c0:	fff94583          	lbu	a1,-1(s2)
 4c4:	8526                	mv	a0,s1
 4c6:	00000097          	auipc	ra,0x0
 4ca:	f50080e7          	jalr	-176(ra) # 416 <putc>
  while(--i >= 0)
 4ce:	197d                	addi	s2,s2,-1
 4d0:	ff3918e3          	bne	s2,s3,4c0 <printint+0x80>
}
 4d4:	70e2                	ld	ra,56(sp)
 4d6:	7442                	ld	s0,48(sp)
 4d8:	74a2                	ld	s1,40(sp)
 4da:	7902                	ld	s2,32(sp)
 4dc:	69e2                	ld	s3,24(sp)
 4de:	6121                	addi	sp,sp,64
 4e0:	8082                	ret
    x = -xx;
 4e2:	40b005bb          	negw	a1,a1
    neg = 1;
 4e6:	4885                	li	a7,1
    x = -xx;
 4e8:	bf8d                	j	45a <printint+0x1a>

00000000000004ea <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 4ea:	7119                	addi	sp,sp,-128
 4ec:	fc86                	sd	ra,120(sp)
 4ee:	f8a2                	sd	s0,112(sp)
 4f0:	f4a6                	sd	s1,104(sp)
 4f2:	f0ca                	sd	s2,96(sp)
 4f4:	ecce                	sd	s3,88(sp)
 4f6:	e8d2                	sd	s4,80(sp)
 4f8:	e4d6                	sd	s5,72(sp)
 4fa:	e0da                	sd	s6,64(sp)
 4fc:	fc5e                	sd	s7,56(sp)
 4fe:	f862                	sd	s8,48(sp)
 500:	f466                	sd	s9,40(sp)
 502:	f06a                	sd	s10,32(sp)
 504:	ec6e                	sd	s11,24(sp)
 506:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 508:	0005c903          	lbu	s2,0(a1)
 50c:	18090f63          	beqz	s2,6aa <vprintf+0x1c0>
 510:	8aaa                	mv	s5,a0
 512:	8b32                	mv	s6,a2
 514:	00158493          	addi	s1,a1,1
  state = 0;
 518:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 51a:	02500a13          	li	s4,37
      if(c == 'd'){
 51e:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 522:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 526:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 52a:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 52e:	00000b97          	auipc	s7,0x0
 532:	402b8b93          	addi	s7,s7,1026 # 930 <digits>
 536:	a839                	j	554 <vprintf+0x6a>
        putc(fd, c);
 538:	85ca                	mv	a1,s2
 53a:	8556                	mv	a0,s5
 53c:	00000097          	auipc	ra,0x0
 540:	eda080e7          	jalr	-294(ra) # 416 <putc>
 544:	a019                	j	54a <vprintf+0x60>
    } else if(state == '%'){
 546:	01498f63          	beq	s3,s4,564 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 54a:	0485                	addi	s1,s1,1
 54c:	fff4c903          	lbu	s2,-1(s1)
 550:	14090d63          	beqz	s2,6aa <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 554:	0009079b          	sext.w	a5,s2
    if(state == 0){
 558:	fe0997e3          	bnez	s3,546 <vprintf+0x5c>
      if(c == '%'){
 55c:	fd479ee3          	bne	a5,s4,538 <vprintf+0x4e>
        state = '%';
 560:	89be                	mv	s3,a5
 562:	b7e5                	j	54a <vprintf+0x60>
      if(c == 'd'){
 564:	05878063          	beq	a5,s8,5a4 <vprintf+0xba>
      } else if(c == 'l') {
 568:	05978c63          	beq	a5,s9,5c0 <vprintf+0xd6>
      } else if(c == 'x') {
 56c:	07a78863          	beq	a5,s10,5dc <vprintf+0xf2>
      } else if(c == 'p') {
 570:	09b78463          	beq	a5,s11,5f8 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 574:	07300713          	li	a4,115
 578:	0ce78663          	beq	a5,a4,644 <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 57c:	06300713          	li	a4,99
 580:	0ee78e63          	beq	a5,a4,67c <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 584:	11478863          	beq	a5,s4,694 <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 588:	85d2                	mv	a1,s4
 58a:	8556                	mv	a0,s5
 58c:	00000097          	auipc	ra,0x0
 590:	e8a080e7          	jalr	-374(ra) # 416 <putc>
        putc(fd, c);
 594:	85ca                	mv	a1,s2
 596:	8556                	mv	a0,s5
 598:	00000097          	auipc	ra,0x0
 59c:	e7e080e7          	jalr	-386(ra) # 416 <putc>
      }
      state = 0;
 5a0:	4981                	li	s3,0
 5a2:	b765                	j	54a <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 5a4:	008b0913          	addi	s2,s6,8
 5a8:	4685                	li	a3,1
 5aa:	4629                	li	a2,10
 5ac:	000b2583          	lw	a1,0(s6)
 5b0:	8556                	mv	a0,s5
 5b2:	00000097          	auipc	ra,0x0
 5b6:	e8e080e7          	jalr	-370(ra) # 440 <printint>
 5ba:	8b4a                	mv	s6,s2
      state = 0;
 5bc:	4981                	li	s3,0
 5be:	b771                	j	54a <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 5c0:	008b0913          	addi	s2,s6,8
 5c4:	4681                	li	a3,0
 5c6:	4629                	li	a2,10
 5c8:	000b2583          	lw	a1,0(s6)
 5cc:	8556                	mv	a0,s5
 5ce:	00000097          	auipc	ra,0x0
 5d2:	e72080e7          	jalr	-398(ra) # 440 <printint>
 5d6:	8b4a                	mv	s6,s2
      state = 0;
 5d8:	4981                	li	s3,0
 5da:	bf85                	j	54a <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 5dc:	008b0913          	addi	s2,s6,8
 5e0:	4681                	li	a3,0
 5e2:	4641                	li	a2,16
 5e4:	000b2583          	lw	a1,0(s6)
 5e8:	8556                	mv	a0,s5
 5ea:	00000097          	auipc	ra,0x0
 5ee:	e56080e7          	jalr	-426(ra) # 440 <printint>
 5f2:	8b4a                	mv	s6,s2
      state = 0;
 5f4:	4981                	li	s3,0
 5f6:	bf91                	j	54a <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 5f8:	008b0793          	addi	a5,s6,8
 5fc:	f8f43423          	sd	a5,-120(s0)
 600:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 604:	03000593          	li	a1,48
 608:	8556                	mv	a0,s5
 60a:	00000097          	auipc	ra,0x0
 60e:	e0c080e7          	jalr	-500(ra) # 416 <putc>
  putc(fd, 'x');
 612:	85ea                	mv	a1,s10
 614:	8556                	mv	a0,s5
 616:	00000097          	auipc	ra,0x0
 61a:	e00080e7          	jalr	-512(ra) # 416 <putc>
 61e:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 620:	03c9d793          	srli	a5,s3,0x3c
 624:	97de                	add	a5,a5,s7
 626:	0007c583          	lbu	a1,0(a5)
 62a:	8556                	mv	a0,s5
 62c:	00000097          	auipc	ra,0x0
 630:	dea080e7          	jalr	-534(ra) # 416 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 634:	0992                	slli	s3,s3,0x4
 636:	397d                	addiw	s2,s2,-1
 638:	fe0914e3          	bnez	s2,620 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 63c:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 640:	4981                	li	s3,0
 642:	b721                	j	54a <vprintf+0x60>
        s = va_arg(ap, char*);
 644:	008b0993          	addi	s3,s6,8
 648:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 64c:	02090163          	beqz	s2,66e <vprintf+0x184>
        while(*s != 0){
 650:	00094583          	lbu	a1,0(s2)
 654:	c9a1                	beqz	a1,6a4 <vprintf+0x1ba>
          putc(fd, *s);
 656:	8556                	mv	a0,s5
 658:	00000097          	auipc	ra,0x0
 65c:	dbe080e7          	jalr	-578(ra) # 416 <putc>
          s++;
 660:	0905                	addi	s2,s2,1
        while(*s != 0){
 662:	00094583          	lbu	a1,0(s2)
 666:	f9e5                	bnez	a1,656 <vprintf+0x16c>
        s = va_arg(ap, char*);
 668:	8b4e                	mv	s6,s3
      state = 0;
 66a:	4981                	li	s3,0
 66c:	bdf9                	j	54a <vprintf+0x60>
          s = "(null)";
 66e:	00000917          	auipc	s2,0x0
 672:	2ba90913          	addi	s2,s2,698 # 928 <malloc+0xf4>
        while(*s != 0){
 676:	02800593          	li	a1,40
 67a:	bff1                	j	656 <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 67c:	008b0913          	addi	s2,s6,8
 680:	000b4583          	lbu	a1,0(s6)
 684:	8556                	mv	a0,s5
 686:	00000097          	auipc	ra,0x0
 68a:	d90080e7          	jalr	-624(ra) # 416 <putc>
 68e:	8b4a                	mv	s6,s2
      state = 0;
 690:	4981                	li	s3,0
 692:	bd65                	j	54a <vprintf+0x60>
        putc(fd, c);
 694:	85d2                	mv	a1,s4
 696:	8556                	mv	a0,s5
 698:	00000097          	auipc	ra,0x0
 69c:	d7e080e7          	jalr	-642(ra) # 416 <putc>
      state = 0;
 6a0:	4981                	li	s3,0
 6a2:	b565                	j	54a <vprintf+0x60>
        s = va_arg(ap, char*);
 6a4:	8b4e                	mv	s6,s3
      state = 0;
 6a6:	4981                	li	s3,0
 6a8:	b54d                	j	54a <vprintf+0x60>
    }
  }
}
 6aa:	70e6                	ld	ra,120(sp)
 6ac:	7446                	ld	s0,112(sp)
 6ae:	74a6                	ld	s1,104(sp)
 6b0:	7906                	ld	s2,96(sp)
 6b2:	69e6                	ld	s3,88(sp)
 6b4:	6a46                	ld	s4,80(sp)
 6b6:	6aa6                	ld	s5,72(sp)
 6b8:	6b06                	ld	s6,64(sp)
 6ba:	7be2                	ld	s7,56(sp)
 6bc:	7c42                	ld	s8,48(sp)
 6be:	7ca2                	ld	s9,40(sp)
 6c0:	7d02                	ld	s10,32(sp)
 6c2:	6de2                	ld	s11,24(sp)
 6c4:	6109                	addi	sp,sp,128
 6c6:	8082                	ret

00000000000006c8 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 6c8:	711d                	addi	sp,sp,-96
 6ca:	f406                	sd	ra,40(sp)
 6cc:	f022                	sd	s0,32(sp)
 6ce:	ec26                	sd	s1,24(sp)
 6d0:	e84a                	sd	s2,16(sp)
 6d2:	1800                	addi	s0,sp,48
 6d4:	84aa                	mv	s1,a0
 6d6:	e010                	sd	a2,0(s0)
 6d8:	e414                	sd	a3,8(s0)
 6da:	e818                	sd	a4,16(s0)
 6dc:	ec1c                	sd	a5,24(s0)
 6de:	03043023          	sd	a6,32(s0)
 6e2:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 6e6:	fc843c23          	sd	s0,-40(s0)
  vprintf(fd, fmt, ap);
 6ea:	8622                	mv	a2,s0
 6ec:	00000097          	auipc	ra,0x0
 6f0:	dfe080e7          	jalr	-514(ra) # 4ea <vprintf>
	if(fd==1){
 6f4:	4785                	li	a5,1
 6f6:	02f48963          	beq	s1,a5,728 <fprintf+0x60>
	  write(fd, printbuf, len);
 6fa:	00000917          	auipc	s2,0x0
 6fe:	24e90913          	addi	s2,s2,590 # 948 <len>
 702:	00092603          	lw	a2,0(s2)
 706:	00000597          	auipc	a1,0x0
 70a:	25258593          	addi	a1,a1,594 # 958 <printbuf>
 70e:	8526                	mv	a0,s1
 710:	00000097          	auipc	ra,0x0
 714:	c4e080e7          	jalr	-946(ra) # 35e <write>
	  len=0;
 718:	00092023          	sw	zero,0(s2)
  fflush(fd);
}
 71c:	70a2                	ld	ra,40(sp)
 71e:	7402                	ld	s0,32(sp)
 720:	64e2                	ld	s1,24(sp)
 722:	6942                	ld	s2,16(sp)
 724:	6125                	addi	sp,sp,96
 726:	8082                	ret
	  printbuf[len]=0;
 728:	00000517          	auipc	a0,0x0
 72c:	23050513          	addi	a0,a0,560 # 958 <printbuf>
 730:	00000497          	auipc	s1,0x0
 734:	21848493          	addi	s1,s1,536 # 948 <len>
 738:	409c                	lw	a5,0(s1)
 73a:	97aa                	add	a5,a5,a0
 73c:	00078023          	sb	zero,0(a5)
	  sprint(printbuf);
 740:	00000097          	auipc	ra,0x0
 744:	cce080e7          	jalr	-818(ra) # 40e <sprint>
	  len=0;
 748:	0004a023          	sw	zero,0(s1)
 74c:	bfc1                	j	71c <fprintf+0x54>

000000000000074e <printf>:

void
printf(const char *fmt, ...)
{
 74e:	7159                	addi	sp,sp,-112
 750:	f406                	sd	ra,40(sp)
 752:	f022                	sd	s0,32(sp)
 754:	ec26                	sd	s1,24(sp)
 756:	1800                	addi	s0,sp,48
 758:	e40c                	sd	a1,8(s0)
 75a:	e810                	sd	a2,16(s0)
 75c:	ec14                	sd	a3,24(s0)
 75e:	f018                	sd	a4,32(s0)
 760:	f41c                	sd	a5,40(s0)
 762:	03043823          	sd	a6,48(s0)
 766:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 76a:	00840613          	addi	a2,s0,8
 76e:	fcc43c23          	sd	a2,-40(s0)
  vprintf(1, fmt, ap);
 772:	85aa                	mv	a1,a0
 774:	4505                	li	a0,1
 776:	00000097          	auipc	ra,0x0
 77a:	d74080e7          	jalr	-652(ra) # 4ea <vprintf>
	  printbuf[len]=0;
 77e:	00000517          	auipc	a0,0x0
 782:	1da50513          	addi	a0,a0,474 # 958 <printbuf>
 786:	00000497          	auipc	s1,0x0
 78a:	1c248493          	addi	s1,s1,450 # 948 <len>
 78e:	409c                	lw	a5,0(s1)
 790:	97aa                	add	a5,a5,a0
 792:	00078023          	sb	zero,0(a5)
	  sprint(printbuf);
 796:	00000097          	auipc	ra,0x0
 79a:	c78080e7          	jalr	-904(ra) # 40e <sprint>
	  len=0;
 79e:	0004a023          	sw	zero,0(s1)
  fflush(1);
}
 7a2:	70a2                	ld	ra,40(sp)
 7a4:	7402                	ld	s0,32(sp)
 7a6:	64e2                	ld	s1,24(sp)
 7a8:	6165                	addi	sp,sp,112
 7aa:	8082                	ret

00000000000007ac <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7ac:	1141                	addi	sp,sp,-16
 7ae:	e422                	sd	s0,8(sp)
 7b0:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7b2:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7b6:	00000797          	auipc	a5,0x0
 7ba:	19a7b783          	ld	a5,410(a5) # 950 <freep>
 7be:	a805                	j	7ee <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 7c0:	4618                	lw	a4,8(a2)
 7c2:	9db9                	addw	a1,a1,a4
 7c4:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 7c8:	6398                	ld	a4,0(a5)
 7ca:	6318                	ld	a4,0(a4)
 7cc:	fee53823          	sd	a4,-16(a0)
 7d0:	a091                	j	814 <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 7d2:	ff852703          	lw	a4,-8(a0)
 7d6:	9e39                	addw	a2,a2,a4
 7d8:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 7da:	ff053703          	ld	a4,-16(a0)
 7de:	e398                	sd	a4,0(a5)
 7e0:	a099                	j	826 <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7e2:	6398                	ld	a4,0(a5)
 7e4:	00e7e463          	bltu	a5,a4,7ec <free+0x40>
 7e8:	00e6ea63          	bltu	a3,a4,7fc <free+0x50>
{
 7ec:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7ee:	fed7fae3          	bgeu	a5,a3,7e2 <free+0x36>
 7f2:	6398                	ld	a4,0(a5)
 7f4:	00e6e463          	bltu	a3,a4,7fc <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7f8:	fee7eae3          	bltu	a5,a4,7ec <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 7fc:	ff852583          	lw	a1,-8(a0)
 800:	6390                	ld	a2,0(a5)
 802:	02059713          	slli	a4,a1,0x20
 806:	9301                	srli	a4,a4,0x20
 808:	0712                	slli	a4,a4,0x4
 80a:	9736                	add	a4,a4,a3
 80c:	fae60ae3          	beq	a2,a4,7c0 <free+0x14>
    bp->s.ptr = p->s.ptr;
 810:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 814:	4790                	lw	a2,8(a5)
 816:	02061713          	slli	a4,a2,0x20
 81a:	9301                	srli	a4,a4,0x20
 81c:	0712                	slli	a4,a4,0x4
 81e:	973e                	add	a4,a4,a5
 820:	fae689e3          	beq	a3,a4,7d2 <free+0x26>
  } else
    p->s.ptr = bp;
 824:	e394                	sd	a3,0(a5)
  freep = p;
 826:	00000717          	auipc	a4,0x0
 82a:	12f73523          	sd	a5,298(a4) # 950 <freep>
}
 82e:	6422                	ld	s0,8(sp)
 830:	0141                	addi	sp,sp,16
 832:	8082                	ret

0000000000000834 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 834:	7139                	addi	sp,sp,-64
 836:	fc06                	sd	ra,56(sp)
 838:	f822                	sd	s0,48(sp)
 83a:	f426                	sd	s1,40(sp)
 83c:	f04a                	sd	s2,32(sp)
 83e:	ec4e                	sd	s3,24(sp)
 840:	e852                	sd	s4,16(sp)
 842:	e456                	sd	s5,8(sp)
 844:	e05a                	sd	s6,0(sp)
 846:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 848:	02051493          	slli	s1,a0,0x20
 84c:	9081                	srli	s1,s1,0x20
 84e:	04bd                	addi	s1,s1,15
 850:	8091                	srli	s1,s1,0x4
 852:	0014899b          	addiw	s3,s1,1
 856:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 858:	00000517          	auipc	a0,0x0
 85c:	0f853503          	ld	a0,248(a0) # 950 <freep>
 860:	c515                	beqz	a0,88c <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 862:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 864:	4798                	lw	a4,8(a5)
 866:	02977f63          	bgeu	a4,s1,8a4 <malloc+0x70>
 86a:	8a4e                	mv	s4,s3
 86c:	0009871b          	sext.w	a4,s3
 870:	6685                	lui	a3,0x1
 872:	00d77363          	bgeu	a4,a3,878 <malloc+0x44>
 876:	6a05                	lui	s4,0x1
 878:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 87c:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 880:	00000917          	auipc	s2,0x0
 884:	0d090913          	addi	s2,s2,208 # 950 <freep>
  if(p == (char*)-1)
 888:	5afd                	li	s5,-1
 88a:	a88d                	j	8fc <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 88c:	00000797          	auipc	a5,0x0
 890:	13478793          	addi	a5,a5,308 # 9c0 <base>
 894:	00000717          	auipc	a4,0x0
 898:	0af73e23          	sd	a5,188(a4) # 950 <freep>
 89c:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 89e:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 8a2:	b7e1                	j	86a <malloc+0x36>
      if(p->s.size == nunits)
 8a4:	02e48b63          	beq	s1,a4,8da <malloc+0xa6>
        p->s.size -= nunits;
 8a8:	4137073b          	subw	a4,a4,s3
 8ac:	c798                	sw	a4,8(a5)
        p += p->s.size;
 8ae:	1702                	slli	a4,a4,0x20
 8b0:	9301                	srli	a4,a4,0x20
 8b2:	0712                	slli	a4,a4,0x4
 8b4:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 8b6:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 8ba:	00000717          	auipc	a4,0x0
 8be:	08a73b23          	sd	a0,150(a4) # 950 <freep>
      return (void*)(p + 1);
 8c2:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8c6:	70e2                	ld	ra,56(sp)
 8c8:	7442                	ld	s0,48(sp)
 8ca:	74a2                	ld	s1,40(sp)
 8cc:	7902                	ld	s2,32(sp)
 8ce:	69e2                	ld	s3,24(sp)
 8d0:	6a42                	ld	s4,16(sp)
 8d2:	6aa2                	ld	s5,8(sp)
 8d4:	6b02                	ld	s6,0(sp)
 8d6:	6121                	addi	sp,sp,64
 8d8:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 8da:	6398                	ld	a4,0(a5)
 8dc:	e118                	sd	a4,0(a0)
 8de:	bff1                	j	8ba <malloc+0x86>
  hp->s.size = nu;
 8e0:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 8e4:	0541                	addi	a0,a0,16
 8e6:	00000097          	auipc	ra,0x0
 8ea:	ec6080e7          	jalr	-314(ra) # 7ac <free>
  return freep;
 8ee:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 8f2:	d971                	beqz	a0,8c6 <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f4:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 8f6:	4798                	lw	a4,8(a5)
 8f8:	fa9776e3          	bgeu	a4,s1,8a4 <malloc+0x70>
    if(p == freep)
 8fc:	00093703          	ld	a4,0(s2)
 900:	853e                	mv	a0,a5
 902:	fef719e3          	bne	a4,a5,8f4 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 906:	8552                	mv	a0,s4
 908:	00000097          	auipc	ra,0x0
 90c:	aa6080e7          	jalr	-1370(ra) # 3ae <sbrk>
  if(p == (char*)-1)
 910:	fd5518e3          	bne	a0,s5,8e0 <malloc+0xac>
        return 0;
 914:	4501                	li	a0,0
 916:	bf45                	j	8c6 <malloc+0x92>
