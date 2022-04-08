
user/_mkdir:     file format elf64-littleriscv


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
   c:	1800                	addi	s0,sp,48
  int i;

  if(argc < 2){
   e:	4785                	li	a5,1
  10:	02a7d763          	bge	a5,a0,3e <main+0x3e>
  14:	00858493          	addi	s1,a1,8
  18:	ffe5091b          	addiw	s2,a0,-2
  1c:	1902                	slli	s2,s2,0x20
  1e:	02095913          	srli	s2,s2,0x20
  22:	090e                	slli	s2,s2,0x3
  24:	05c1                	addi	a1,a1,16
  26:	992e                	add	s2,s2,a1
    fprintf(2, "Usage: mkdir files...\n");
    exit(1);
  }

  for(i = 1; i < argc; i++){
    if(mkdir(argv[i]) < 0){
  28:	6088                	ld	a0,0(s1)
  2a:	00000097          	auipc	ra,0x0
  2e:	358080e7          	jalr	856(ra) # 382 <mkdir>
  32:	02054463          	bltz	a0,5a <main+0x5a>
  for(i = 1; i < argc; i++){
  36:	04a1                	addi	s1,s1,8
  38:	ff2498e3          	bne	s1,s2,28 <main+0x28>
  3c:	a80d                	j	6e <main+0x6e>
    fprintf(2, "Usage: mkdir files...\n");
  3e:	00001597          	auipc	a1,0x1
  42:	8d258593          	addi	a1,a1,-1838 # 910 <malloc+0xe8>
  46:	4509                	li	a0,2
  48:	00000097          	auipc	ra,0x0
  4c:	674080e7          	jalr	1652(ra) # 6bc <fprintf>
    exit(1);
  50:	4505                	li	a0,1
  52:	00000097          	auipc	ra,0x0
  56:	2e0080e7          	jalr	736(ra) # 332 <exit>
      fprintf(2, "mkdir: %s failed to create\n", argv[i]);
  5a:	6090                	ld	a2,0(s1)
  5c:	00001597          	auipc	a1,0x1
  60:	8cc58593          	addi	a1,a1,-1844 # 928 <malloc+0x100>
  64:	4509                	li	a0,2
  66:	00000097          	auipc	ra,0x0
  6a:	656080e7          	jalr	1622(ra) # 6bc <fprintf>
      break;
    }
  }

  exit(0);
  6e:	4501                	li	a0,0
  70:	00000097          	auipc	ra,0x0
  74:	2c2080e7          	jalr	706(ra) # 332 <exit>

0000000000000078 <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
  78:	1141                	addi	sp,sp,-16
  7a:	e422                	sd	s0,8(sp)
  7c:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  7e:	87aa                	mv	a5,a0
  80:	0585                	addi	a1,a1,1
  82:	0785                	addi	a5,a5,1
  84:	fff5c703          	lbu	a4,-1(a1)
  88:	fee78fa3          	sb	a4,-1(a5)
  8c:	fb75                	bnez	a4,80 <strcpy+0x8>
    ;
  return os;
}
  8e:	6422                	ld	s0,8(sp)
  90:	0141                	addi	sp,sp,16
  92:	8082                	ret

0000000000000094 <strcat>:

char*
strcat(char *s, const char *t)
{
  94:	1141                	addi	sp,sp,-16
  96:	e422                	sd	s0,8(sp)
  98:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
  9a:	00054783          	lbu	a5,0(a0)
  9e:	c385                	beqz	a5,be <strcat+0x2a>
  a0:	87aa                	mv	a5,a0
    s++;
  a2:	0785                	addi	a5,a5,1
  while(*s)
  a4:	0007c703          	lbu	a4,0(a5)
  a8:	ff6d                	bnez	a4,a2 <strcat+0xe>
  while((*s++ = *t++))
  aa:	0585                	addi	a1,a1,1
  ac:	0785                	addi	a5,a5,1
  ae:	fff5c703          	lbu	a4,-1(a1)
  b2:	fee78fa3          	sb	a4,-1(a5)
  b6:	fb75                	bnez	a4,aa <strcat+0x16>
    ;
  return os;
}
  b8:	6422                	ld	s0,8(sp)
  ba:	0141                	addi	sp,sp,16
  bc:	8082                	ret
  while(*s)
  be:	87aa                	mv	a5,a0
  c0:	b7ed                	j	aa <strcat+0x16>

00000000000000c2 <strcmp>:


int
strcmp(const char *p, const char *q)
{
  c2:	1141                	addi	sp,sp,-16
  c4:	e422                	sd	s0,8(sp)
  c6:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
  c8:	00054783          	lbu	a5,0(a0)
  cc:	cb91                	beqz	a5,e0 <strcmp+0x1e>
  ce:	0005c703          	lbu	a4,0(a1)
  d2:	00f71763          	bne	a4,a5,e0 <strcmp+0x1e>
    p++, q++;
  d6:	0505                	addi	a0,a0,1
  d8:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
  da:	00054783          	lbu	a5,0(a0)
  de:	fbe5                	bnez	a5,ce <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
  e0:	0005c503          	lbu	a0,0(a1)
}
  e4:	40a7853b          	subw	a0,a5,a0
  e8:	6422                	ld	s0,8(sp)
  ea:	0141                	addi	sp,sp,16
  ec:	8082                	ret

00000000000000ee <strlen>:

uint
strlen(const char *s)
{
  ee:	1141                	addi	sp,sp,-16
  f0:	e422                	sd	s0,8(sp)
  f2:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
  f4:	00054783          	lbu	a5,0(a0)
  f8:	cf91                	beqz	a5,114 <strlen+0x26>
  fa:	0505                	addi	a0,a0,1
  fc:	87aa                	mv	a5,a0
  fe:	4685                	li	a3,1
 100:	9e89                	subw	a3,a3,a0
 102:	00f6853b          	addw	a0,a3,a5
 106:	0785                	addi	a5,a5,1
 108:	fff7c703          	lbu	a4,-1(a5)
 10c:	fb7d                	bnez	a4,102 <strlen+0x14>
    ;
  return n;
}
 10e:	6422                	ld	s0,8(sp)
 110:	0141                	addi	sp,sp,16
 112:	8082                	ret
  for(n = 0; s[n]; n++)
 114:	4501                	li	a0,0
 116:	bfe5                	j	10e <strlen+0x20>

0000000000000118 <memset>:

void*
memset(void *dst, int c, uint n)
{
 118:	1141                	addi	sp,sp,-16
 11a:	e422                	sd	s0,8(sp)
 11c:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 11e:	ce09                	beqz	a2,138 <memset+0x20>
 120:	87aa                	mv	a5,a0
 122:	fff6071b          	addiw	a4,a2,-1
 126:	1702                	slli	a4,a4,0x20
 128:	9301                	srli	a4,a4,0x20
 12a:	0705                	addi	a4,a4,1
 12c:	972a                	add	a4,a4,a0
    cdst[i] = c;
 12e:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 132:	0785                	addi	a5,a5,1
 134:	fee79de3          	bne	a5,a4,12e <memset+0x16>
  }
  return dst;
}
 138:	6422                	ld	s0,8(sp)
 13a:	0141                	addi	sp,sp,16
 13c:	8082                	ret

000000000000013e <strchr>:

char*
strchr(const char *s, char c)
{
 13e:	1141                	addi	sp,sp,-16
 140:	e422                	sd	s0,8(sp)
 142:	0800                	addi	s0,sp,16
  for(; *s; s++)
 144:	00054783          	lbu	a5,0(a0)
 148:	cb99                	beqz	a5,15e <strchr+0x20>
    if(*s == c)
 14a:	00f58763          	beq	a1,a5,158 <strchr+0x1a>
  for(; *s; s++)
 14e:	0505                	addi	a0,a0,1
 150:	00054783          	lbu	a5,0(a0)
 154:	fbfd                	bnez	a5,14a <strchr+0xc>
      return (char*)s;
  return 0;
 156:	4501                	li	a0,0
}
 158:	6422                	ld	s0,8(sp)
 15a:	0141                	addi	sp,sp,16
 15c:	8082                	ret
  return 0;
 15e:	4501                	li	a0,0
 160:	bfe5                	j	158 <strchr+0x1a>

0000000000000162 <gets>:

char*
gets(char *buf, int max)
{
 162:	711d                	addi	sp,sp,-96
 164:	ec86                	sd	ra,88(sp)
 166:	e8a2                	sd	s0,80(sp)
 168:	e4a6                	sd	s1,72(sp)
 16a:	e0ca                	sd	s2,64(sp)
 16c:	fc4e                	sd	s3,56(sp)
 16e:	f852                	sd	s4,48(sp)
 170:	f456                	sd	s5,40(sp)
 172:	f05a                	sd	s6,32(sp)
 174:	ec5e                	sd	s7,24(sp)
 176:	1080                	addi	s0,sp,96
 178:	8baa                	mv	s7,a0
 17a:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 17c:	892a                	mv	s2,a0
 17e:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 180:	4aa9                	li	s5,10
 182:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 184:	89a6                	mv	s3,s1
 186:	2485                	addiw	s1,s1,1
 188:	0344d863          	bge	s1,s4,1b8 <gets+0x56>
    cc = read(0, &c, 1);
 18c:	4605                	li	a2,1
 18e:	faf40593          	addi	a1,s0,-81
 192:	4501                	li	a0,0
 194:	00000097          	auipc	ra,0x0
 198:	1b6080e7          	jalr	438(ra) # 34a <read>
    if(cc < 1)
 19c:	00a05e63          	blez	a0,1b8 <gets+0x56>
    buf[i++] = c;
 1a0:	faf44783          	lbu	a5,-81(s0)
 1a4:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 1a8:	01578763          	beq	a5,s5,1b6 <gets+0x54>
 1ac:	0905                	addi	s2,s2,1
 1ae:	fd679be3          	bne	a5,s6,184 <gets+0x22>
  for(i=0; i+1 < max; ){
 1b2:	89a6                	mv	s3,s1
 1b4:	a011                	j	1b8 <gets+0x56>
 1b6:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 1b8:	99de                	add	s3,s3,s7
 1ba:	00098023          	sb	zero,0(s3)
  return buf;
}
 1be:	855e                	mv	a0,s7
 1c0:	60e6                	ld	ra,88(sp)
 1c2:	6446                	ld	s0,80(sp)
 1c4:	64a6                	ld	s1,72(sp)
 1c6:	6906                	ld	s2,64(sp)
 1c8:	79e2                	ld	s3,56(sp)
 1ca:	7a42                	ld	s4,48(sp)
 1cc:	7aa2                	ld	s5,40(sp)
 1ce:	7b02                	ld	s6,32(sp)
 1d0:	6be2                	ld	s7,24(sp)
 1d2:	6125                	addi	sp,sp,96
 1d4:	8082                	ret

00000000000001d6 <stat>:

int
stat(const char *n, struct stat *st)
{
 1d6:	1101                	addi	sp,sp,-32
 1d8:	ec06                	sd	ra,24(sp)
 1da:	e822                	sd	s0,16(sp)
 1dc:	e426                	sd	s1,8(sp)
 1de:	e04a                	sd	s2,0(sp)
 1e0:	1000                	addi	s0,sp,32
 1e2:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1e4:	4581                	li	a1,0
 1e6:	00000097          	auipc	ra,0x0
 1ea:	18c080e7          	jalr	396(ra) # 372 <open>
  if(fd < 0)
 1ee:	02054563          	bltz	a0,218 <stat+0x42>
 1f2:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 1f4:	85ca                	mv	a1,s2
 1f6:	00000097          	auipc	ra,0x0
 1fa:	184080e7          	jalr	388(ra) # 37a <fstat>
 1fe:	892a                	mv	s2,a0
  close(fd);
 200:	8526                	mv	a0,s1
 202:	00000097          	auipc	ra,0x0
 206:	158080e7          	jalr	344(ra) # 35a <close>
  return r;
}
 20a:	854a                	mv	a0,s2
 20c:	60e2                	ld	ra,24(sp)
 20e:	6442                	ld	s0,16(sp)
 210:	64a2                	ld	s1,8(sp)
 212:	6902                	ld	s2,0(sp)
 214:	6105                	addi	sp,sp,32
 216:	8082                	ret
    return -1;
 218:	597d                	li	s2,-1
 21a:	bfc5                	j	20a <stat+0x34>

000000000000021c <atoi>:

int
atoi(const char *s)
{
 21c:	1141                	addi	sp,sp,-16
 21e:	e422                	sd	s0,8(sp)
 220:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 222:	00054703          	lbu	a4,0(a0)
 226:	02d00793          	li	a5,45
  int neg = 1;
 22a:	4805                	li	a6,1
  if (*s == '-') {
 22c:	04f70363          	beq	a4,a5,272 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 230:	00054683          	lbu	a3,0(a0)
 234:	fd06879b          	addiw	a5,a3,-48
 238:	0ff7f793          	andi	a5,a5,255
 23c:	4725                	li	a4,9
 23e:	02f76d63          	bltu	a4,a5,278 <atoi+0x5c>
  n = 0;
 242:	4601                	li	a2,0
  while('0' <= *s && *s <= '9')
 244:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 246:	0505                	addi	a0,a0,1
 248:	0026179b          	slliw	a5,a2,0x2
 24c:	9fb1                	addw	a5,a5,a2
 24e:	0017979b          	slliw	a5,a5,0x1
 252:	9fb5                	addw	a5,a5,a3
 254:	fd07861b          	addiw	a2,a5,-48
  while('0' <= *s && *s <= '9')
 258:	00054683          	lbu	a3,0(a0)
 25c:	fd06871b          	addiw	a4,a3,-48
 260:	0ff77713          	andi	a4,a4,255
 264:	fee5f1e3          	bgeu	a1,a4,246 <atoi+0x2a>
  return n * neg;
}
 268:	02c8053b          	mulw	a0,a6,a2
 26c:	6422                	ld	s0,8(sp)
 26e:	0141                	addi	sp,sp,16
 270:	8082                	ret
    s++;
 272:	0505                	addi	a0,a0,1
    neg = -1;
 274:	587d                	li	a6,-1
 276:	bf6d                	j	230 <atoi+0x14>
  n = 0;
 278:	4601                	li	a2,0
 27a:	b7fd                	j	268 <atoi+0x4c>

000000000000027c <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 27c:	1141                	addi	sp,sp,-16
 27e:	e422                	sd	s0,8(sp)
 280:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 282:	02b57663          	bgeu	a0,a1,2ae <memmove+0x32>
    while(n-- > 0)
 286:	02c05163          	blez	a2,2a8 <memmove+0x2c>
 28a:	fff6079b          	addiw	a5,a2,-1
 28e:	1782                	slli	a5,a5,0x20
 290:	9381                	srli	a5,a5,0x20
 292:	0785                	addi	a5,a5,1
 294:	97aa                	add	a5,a5,a0
  dst = vdst;
 296:	872a                	mv	a4,a0
      *dst++ = *src++;
 298:	0585                	addi	a1,a1,1
 29a:	0705                	addi	a4,a4,1
 29c:	fff5c683          	lbu	a3,-1(a1)
 2a0:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 2a4:	fee79ae3          	bne	a5,a4,298 <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 2a8:	6422                	ld	s0,8(sp)
 2aa:	0141                	addi	sp,sp,16
 2ac:	8082                	ret
    dst += n;
 2ae:	00c50733          	add	a4,a0,a2
    src += n;
 2b2:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 2b4:	fec05ae3          	blez	a2,2a8 <memmove+0x2c>
 2b8:	fff6079b          	addiw	a5,a2,-1
 2bc:	1782                	slli	a5,a5,0x20
 2be:	9381                	srli	a5,a5,0x20
 2c0:	fff7c793          	not	a5,a5
 2c4:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 2c6:	15fd                	addi	a1,a1,-1
 2c8:	177d                	addi	a4,a4,-1
 2ca:	0005c683          	lbu	a3,0(a1)
 2ce:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 2d2:	fee79ae3          	bne	a5,a4,2c6 <memmove+0x4a>
 2d6:	bfc9                	j	2a8 <memmove+0x2c>

00000000000002d8 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 2d8:	1141                	addi	sp,sp,-16
 2da:	e422                	sd	s0,8(sp)
 2dc:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 2de:	ca05                	beqz	a2,30e <memcmp+0x36>
 2e0:	fff6069b          	addiw	a3,a2,-1
 2e4:	1682                	slli	a3,a3,0x20
 2e6:	9281                	srli	a3,a3,0x20
 2e8:	0685                	addi	a3,a3,1
 2ea:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 2ec:	00054783          	lbu	a5,0(a0)
 2f0:	0005c703          	lbu	a4,0(a1)
 2f4:	00e79863          	bne	a5,a4,304 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 2f8:	0505                	addi	a0,a0,1
    p2++;
 2fa:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 2fc:	fed518e3          	bne	a0,a3,2ec <memcmp+0x14>
  }
  return 0;
 300:	4501                	li	a0,0
 302:	a019                	j	308 <memcmp+0x30>
      return *p1 - *p2;
 304:	40e7853b          	subw	a0,a5,a4
}
 308:	6422                	ld	s0,8(sp)
 30a:	0141                	addi	sp,sp,16
 30c:	8082                	ret
  return 0;
 30e:	4501                	li	a0,0
 310:	bfe5                	j	308 <memcmp+0x30>

0000000000000312 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 312:	1141                	addi	sp,sp,-16
 314:	e406                	sd	ra,8(sp)
 316:	e022                	sd	s0,0(sp)
 318:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 31a:	00000097          	auipc	ra,0x0
 31e:	f62080e7          	jalr	-158(ra) # 27c <memmove>
}
 322:	60a2                	ld	ra,8(sp)
 324:	6402                	ld	s0,0(sp)
 326:	0141                	addi	sp,sp,16
 328:	8082                	ret

000000000000032a <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 32a:	4885                	li	a7,1
 ecall
 32c:	00000073          	ecall
 ret
 330:	8082                	ret

0000000000000332 <exit>:
.global exit
exit:
 li a7, SYS_exit
 332:	4889                	li	a7,2
 ecall
 334:	00000073          	ecall
 ret
 338:	8082                	ret

000000000000033a <wait>:
.global wait
wait:
 li a7, SYS_wait
 33a:	488d                	li	a7,3
 ecall
 33c:	00000073          	ecall
 ret
 340:	8082                	ret

0000000000000342 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 342:	4891                	li	a7,4
 ecall
 344:	00000073          	ecall
 ret
 348:	8082                	ret

000000000000034a <read>:
.global read
read:
 li a7, SYS_read
 34a:	4895                	li	a7,5
 ecall
 34c:	00000073          	ecall
 ret
 350:	8082                	ret

0000000000000352 <write>:
.global write
write:
 li a7, SYS_write
 352:	48c1                	li	a7,16
 ecall
 354:	00000073          	ecall
 ret
 358:	8082                	ret

000000000000035a <close>:
.global close
close:
 li a7, SYS_close
 35a:	48d5                	li	a7,21
 ecall
 35c:	00000073          	ecall
 ret
 360:	8082                	ret

0000000000000362 <kill>:
.global kill
kill:
 li a7, SYS_kill
 362:	4899                	li	a7,6
 ecall
 364:	00000073          	ecall
 ret
 368:	8082                	ret

000000000000036a <exec>:
.global exec
exec:
 li a7, SYS_exec
 36a:	489d                	li	a7,7
 ecall
 36c:	00000073          	ecall
 ret
 370:	8082                	ret

0000000000000372 <open>:
.global open
open:
 li a7, SYS_open
 372:	48bd                	li	a7,15
 ecall
 374:	00000073          	ecall
 ret
 378:	8082                	ret

000000000000037a <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 37a:	48a1                	li	a7,8
 ecall
 37c:	00000073          	ecall
 ret
 380:	8082                	ret

0000000000000382 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 382:	48d1                	li	a7,20
 ecall
 384:	00000073          	ecall
 ret
 388:	8082                	ret

000000000000038a <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 38a:	48a5                	li	a7,9
 ecall
 38c:	00000073          	ecall
 ret
 390:	8082                	ret

0000000000000392 <dup>:
.global dup
dup:
 li a7, SYS_dup
 392:	48a9                	li	a7,10
 ecall
 394:	00000073          	ecall
 ret
 398:	8082                	ret

000000000000039a <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 39a:	48ad                	li	a7,11
 ecall
 39c:	00000073          	ecall
 ret
 3a0:	8082                	ret

00000000000003a2 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 3a2:	48b1                	li	a7,12
 ecall
 3a4:	00000073          	ecall
 ret
 3a8:	8082                	ret

00000000000003aa <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 3aa:	48b5                	li	a7,13
 ecall
 3ac:	00000073          	ecall
 ret
 3b0:	8082                	ret

00000000000003b2 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 3b2:	48b9                	li	a7,14
 ecall
 3b4:	00000073          	ecall
 ret
 3b8:	8082                	ret

00000000000003ba <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 3ba:	48d9                	li	a7,22
 ecall
 3bc:	00000073          	ecall
 ret
 3c0:	8082                	ret

00000000000003c2 <dev>:
.global dev
dev:
 li a7, SYS_dev
 3c2:	48dd                	li	a7,23
 ecall
 3c4:	00000073          	ecall
 ret
 3c8:	8082                	ret

00000000000003ca <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 3ca:	48e1                	li	a7,24
 ecall
 3cc:	00000073          	ecall
 ret
 3d0:	8082                	ret

00000000000003d2 <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 3d2:	48e5                	li	a7,25
 ecall
 3d4:	00000073          	ecall
 ret
 3d8:	8082                	ret

00000000000003da <remove>:
.global remove
remove:
 li a7, SYS_remove
 3da:	48c5                	li	a7,17
 ecall
 3dc:	00000073          	ecall
 ret
 3e0:	8082                	ret

00000000000003e2 <trace>:
.global trace
trace:
 li a7, SYS_trace
 3e2:	48c9                	li	a7,18
 ecall
 3e4:	00000073          	ecall
 ret
 3e8:	8082                	ret

00000000000003ea <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 3ea:	48cd                	li	a7,19
 ecall
 3ec:	00000073          	ecall
 ret
 3f0:	8082                	ret

00000000000003f2 <rename>:
.global rename
rename:
 li a7, SYS_rename
 3f2:	48e9                	li	a7,26
 ecall
 3f4:	00000073          	ecall
 ret
 3f8:	8082                	ret

00000000000003fa <checkchar>:
.global checkchar
checkchar:
 li a7, SYS_checkchar
 3fa:	48ed                	li	a7,27
 ecall
 3fc:	00000073          	ecall
 ret
 400:	8082                	ret

0000000000000402 <sprint>:
.global sprint
sprint:
 li a7, SYS_sprint
 402:	48f1                	li	a7,28
 ecall
 404:	00000073          	ecall
 ret
 408:	8082                	ret

000000000000040a <putc>:
static char digits[] = "0123456789ABCDEF";
static char printbuf[100];
static int  len = 0;
static void
putc(int fd, char c)
{
 40a:	1141                	addi	sp,sp,-16
 40c:	e422                	sd	s0,8(sp)
 40e:	0800                	addi	s0,sp,16
  printbuf[len++]=c;
 410:	00000797          	auipc	a5,0x0
 414:	55878793          	addi	a5,a5,1368 # 968 <len>
 418:	4398                	lw	a4,0(a5)
 41a:	0017069b          	addiw	a3,a4,1
 41e:	c394                	sw	a3,0(a5)
 420:	00000797          	auipc	a5,0x0
 424:	55878793          	addi	a5,a5,1368 # 978 <printbuf>
 428:	97ba                	add	a5,a5,a4
 42a:	00b78023          	sb	a1,0(a5)
}
 42e:	6422                	ld	s0,8(sp)
 430:	0141                	addi	sp,sp,16
 432:	8082                	ret

0000000000000434 <printint>:
	}
}

static void
printint(int fd, int xx, int base, int sgn)
{
 434:	7139                	addi	sp,sp,-64
 436:	fc06                	sd	ra,56(sp)
 438:	f822                	sd	s0,48(sp)
 43a:	f426                	sd	s1,40(sp)
 43c:	f04a                	sd	s2,32(sp)
 43e:	ec4e                	sd	s3,24(sp)
 440:	0080                	addi	s0,sp,64
 442:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 444:	c299                	beqz	a3,44a <printint+0x16>
 446:	0805c863          	bltz	a1,4d6 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 44a:	2581                	sext.w	a1,a1
  neg = 0;
 44c:	4881                	li	a7,0
 44e:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 452:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 454:	2601                	sext.w	a2,a2
 456:	00000517          	auipc	a0,0x0
 45a:	4fa50513          	addi	a0,a0,1274 # 950 <digits>
 45e:	883a                	mv	a6,a4
 460:	2705                	addiw	a4,a4,1
 462:	02c5f7bb          	remuw	a5,a1,a2
 466:	1782                	slli	a5,a5,0x20
 468:	9381                	srli	a5,a5,0x20
 46a:	97aa                	add	a5,a5,a0
 46c:	0007c783          	lbu	a5,0(a5)
 470:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 474:	0005879b          	sext.w	a5,a1
 478:	02c5d5bb          	divuw	a1,a1,a2
 47c:	0685                	addi	a3,a3,1
 47e:	fec7f0e3          	bgeu	a5,a2,45e <printint+0x2a>
  if(neg)
 482:	00088b63          	beqz	a7,498 <printint+0x64>
    buf[i++] = '-';
 486:	fd040793          	addi	a5,s0,-48
 48a:	973e                	add	a4,a4,a5
 48c:	02d00793          	li	a5,45
 490:	fef70823          	sb	a5,-16(a4)
 494:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 498:	02e05863          	blez	a4,4c8 <printint+0x94>
 49c:	fc040793          	addi	a5,s0,-64
 4a0:	00e78933          	add	s2,a5,a4
 4a4:	fff78993          	addi	s3,a5,-1
 4a8:	99ba                	add	s3,s3,a4
 4aa:	377d                	addiw	a4,a4,-1
 4ac:	1702                	slli	a4,a4,0x20
 4ae:	9301                	srli	a4,a4,0x20
 4b0:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 4b4:	fff94583          	lbu	a1,-1(s2)
 4b8:	8526                	mv	a0,s1
 4ba:	00000097          	auipc	ra,0x0
 4be:	f50080e7          	jalr	-176(ra) # 40a <putc>
  while(--i >= 0)
 4c2:	197d                	addi	s2,s2,-1
 4c4:	ff3918e3          	bne	s2,s3,4b4 <printint+0x80>
}
 4c8:	70e2                	ld	ra,56(sp)
 4ca:	7442                	ld	s0,48(sp)
 4cc:	74a2                	ld	s1,40(sp)
 4ce:	7902                	ld	s2,32(sp)
 4d0:	69e2                	ld	s3,24(sp)
 4d2:	6121                	addi	sp,sp,64
 4d4:	8082                	ret
    x = -xx;
 4d6:	40b005bb          	negw	a1,a1
    neg = 1;
 4da:	4885                	li	a7,1
    x = -xx;
 4dc:	bf8d                	j	44e <printint+0x1a>

00000000000004de <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 4de:	7119                	addi	sp,sp,-128
 4e0:	fc86                	sd	ra,120(sp)
 4e2:	f8a2                	sd	s0,112(sp)
 4e4:	f4a6                	sd	s1,104(sp)
 4e6:	f0ca                	sd	s2,96(sp)
 4e8:	ecce                	sd	s3,88(sp)
 4ea:	e8d2                	sd	s4,80(sp)
 4ec:	e4d6                	sd	s5,72(sp)
 4ee:	e0da                	sd	s6,64(sp)
 4f0:	fc5e                	sd	s7,56(sp)
 4f2:	f862                	sd	s8,48(sp)
 4f4:	f466                	sd	s9,40(sp)
 4f6:	f06a                	sd	s10,32(sp)
 4f8:	ec6e                	sd	s11,24(sp)
 4fa:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 4fc:	0005c903          	lbu	s2,0(a1)
 500:	18090f63          	beqz	s2,69e <vprintf+0x1c0>
 504:	8aaa                	mv	s5,a0
 506:	8b32                	mv	s6,a2
 508:	00158493          	addi	s1,a1,1
  state = 0;
 50c:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 50e:	02500a13          	li	s4,37
      if(c == 'd'){
 512:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 516:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 51a:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 51e:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 522:	00000b97          	auipc	s7,0x0
 526:	42eb8b93          	addi	s7,s7,1070 # 950 <digits>
 52a:	a839                	j	548 <vprintf+0x6a>
        putc(fd, c);
 52c:	85ca                	mv	a1,s2
 52e:	8556                	mv	a0,s5
 530:	00000097          	auipc	ra,0x0
 534:	eda080e7          	jalr	-294(ra) # 40a <putc>
 538:	a019                	j	53e <vprintf+0x60>
    } else if(state == '%'){
 53a:	01498f63          	beq	s3,s4,558 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 53e:	0485                	addi	s1,s1,1
 540:	fff4c903          	lbu	s2,-1(s1)
 544:	14090d63          	beqz	s2,69e <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 548:	0009079b          	sext.w	a5,s2
    if(state == 0){
 54c:	fe0997e3          	bnez	s3,53a <vprintf+0x5c>
      if(c == '%'){
 550:	fd479ee3          	bne	a5,s4,52c <vprintf+0x4e>
        state = '%';
 554:	89be                	mv	s3,a5
 556:	b7e5                	j	53e <vprintf+0x60>
      if(c == 'd'){
 558:	05878063          	beq	a5,s8,598 <vprintf+0xba>
      } else if(c == 'l') {
 55c:	05978c63          	beq	a5,s9,5b4 <vprintf+0xd6>
      } else if(c == 'x') {
 560:	07a78863          	beq	a5,s10,5d0 <vprintf+0xf2>
      } else if(c == 'p') {
 564:	09b78463          	beq	a5,s11,5ec <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 568:	07300713          	li	a4,115
 56c:	0ce78663          	beq	a5,a4,638 <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 570:	06300713          	li	a4,99
 574:	0ee78e63          	beq	a5,a4,670 <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 578:	11478863          	beq	a5,s4,688 <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 57c:	85d2                	mv	a1,s4
 57e:	8556                	mv	a0,s5
 580:	00000097          	auipc	ra,0x0
 584:	e8a080e7          	jalr	-374(ra) # 40a <putc>
        putc(fd, c);
 588:	85ca                	mv	a1,s2
 58a:	8556                	mv	a0,s5
 58c:	00000097          	auipc	ra,0x0
 590:	e7e080e7          	jalr	-386(ra) # 40a <putc>
      }
      state = 0;
 594:	4981                	li	s3,0
 596:	b765                	j	53e <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 598:	008b0913          	addi	s2,s6,8
 59c:	4685                	li	a3,1
 59e:	4629                	li	a2,10
 5a0:	000b2583          	lw	a1,0(s6)
 5a4:	8556                	mv	a0,s5
 5a6:	00000097          	auipc	ra,0x0
 5aa:	e8e080e7          	jalr	-370(ra) # 434 <printint>
 5ae:	8b4a                	mv	s6,s2
      state = 0;
 5b0:	4981                	li	s3,0
 5b2:	b771                	j	53e <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 5b4:	008b0913          	addi	s2,s6,8
 5b8:	4681                	li	a3,0
 5ba:	4629                	li	a2,10
 5bc:	000b2583          	lw	a1,0(s6)
 5c0:	8556                	mv	a0,s5
 5c2:	00000097          	auipc	ra,0x0
 5c6:	e72080e7          	jalr	-398(ra) # 434 <printint>
 5ca:	8b4a                	mv	s6,s2
      state = 0;
 5cc:	4981                	li	s3,0
 5ce:	bf85                	j	53e <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 5d0:	008b0913          	addi	s2,s6,8
 5d4:	4681                	li	a3,0
 5d6:	4641                	li	a2,16
 5d8:	000b2583          	lw	a1,0(s6)
 5dc:	8556                	mv	a0,s5
 5de:	00000097          	auipc	ra,0x0
 5e2:	e56080e7          	jalr	-426(ra) # 434 <printint>
 5e6:	8b4a                	mv	s6,s2
      state = 0;
 5e8:	4981                	li	s3,0
 5ea:	bf91                	j	53e <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 5ec:	008b0793          	addi	a5,s6,8
 5f0:	f8f43423          	sd	a5,-120(s0)
 5f4:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 5f8:	03000593          	li	a1,48
 5fc:	8556                	mv	a0,s5
 5fe:	00000097          	auipc	ra,0x0
 602:	e0c080e7          	jalr	-500(ra) # 40a <putc>
  putc(fd, 'x');
 606:	85ea                	mv	a1,s10
 608:	8556                	mv	a0,s5
 60a:	00000097          	auipc	ra,0x0
 60e:	e00080e7          	jalr	-512(ra) # 40a <putc>
 612:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 614:	03c9d793          	srli	a5,s3,0x3c
 618:	97de                	add	a5,a5,s7
 61a:	0007c583          	lbu	a1,0(a5)
 61e:	8556                	mv	a0,s5
 620:	00000097          	auipc	ra,0x0
 624:	dea080e7          	jalr	-534(ra) # 40a <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 628:	0992                	slli	s3,s3,0x4
 62a:	397d                	addiw	s2,s2,-1
 62c:	fe0914e3          	bnez	s2,614 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 630:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 634:	4981                	li	s3,0
 636:	b721                	j	53e <vprintf+0x60>
        s = va_arg(ap, char*);
 638:	008b0993          	addi	s3,s6,8
 63c:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 640:	02090163          	beqz	s2,662 <vprintf+0x184>
        while(*s != 0){
 644:	00094583          	lbu	a1,0(s2)
 648:	c9a1                	beqz	a1,698 <vprintf+0x1ba>
          putc(fd, *s);
 64a:	8556                	mv	a0,s5
 64c:	00000097          	auipc	ra,0x0
 650:	dbe080e7          	jalr	-578(ra) # 40a <putc>
          s++;
 654:	0905                	addi	s2,s2,1
        while(*s != 0){
 656:	00094583          	lbu	a1,0(s2)
 65a:	f9e5                	bnez	a1,64a <vprintf+0x16c>
        s = va_arg(ap, char*);
 65c:	8b4e                	mv	s6,s3
      state = 0;
 65e:	4981                	li	s3,0
 660:	bdf9                	j	53e <vprintf+0x60>
          s = "(null)";
 662:	00000917          	auipc	s2,0x0
 666:	2e690913          	addi	s2,s2,742 # 948 <malloc+0x120>
        while(*s != 0){
 66a:	02800593          	li	a1,40
 66e:	bff1                	j	64a <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 670:	008b0913          	addi	s2,s6,8
 674:	000b4583          	lbu	a1,0(s6)
 678:	8556                	mv	a0,s5
 67a:	00000097          	auipc	ra,0x0
 67e:	d90080e7          	jalr	-624(ra) # 40a <putc>
 682:	8b4a                	mv	s6,s2
      state = 0;
 684:	4981                	li	s3,0
 686:	bd65                	j	53e <vprintf+0x60>
        putc(fd, c);
 688:	85d2                	mv	a1,s4
 68a:	8556                	mv	a0,s5
 68c:	00000097          	auipc	ra,0x0
 690:	d7e080e7          	jalr	-642(ra) # 40a <putc>
      state = 0;
 694:	4981                	li	s3,0
 696:	b565                	j	53e <vprintf+0x60>
        s = va_arg(ap, char*);
 698:	8b4e                	mv	s6,s3
      state = 0;
 69a:	4981                	li	s3,0
 69c:	b54d                	j	53e <vprintf+0x60>
    }
  }
}
 69e:	70e6                	ld	ra,120(sp)
 6a0:	7446                	ld	s0,112(sp)
 6a2:	74a6                	ld	s1,104(sp)
 6a4:	7906                	ld	s2,96(sp)
 6a6:	69e6                	ld	s3,88(sp)
 6a8:	6a46                	ld	s4,80(sp)
 6aa:	6aa6                	ld	s5,72(sp)
 6ac:	6b06                	ld	s6,64(sp)
 6ae:	7be2                	ld	s7,56(sp)
 6b0:	7c42                	ld	s8,48(sp)
 6b2:	7ca2                	ld	s9,40(sp)
 6b4:	7d02                	ld	s10,32(sp)
 6b6:	6de2                	ld	s11,24(sp)
 6b8:	6109                	addi	sp,sp,128
 6ba:	8082                	ret

00000000000006bc <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 6bc:	711d                	addi	sp,sp,-96
 6be:	f406                	sd	ra,40(sp)
 6c0:	f022                	sd	s0,32(sp)
 6c2:	ec26                	sd	s1,24(sp)
 6c4:	e84a                	sd	s2,16(sp)
 6c6:	1800                	addi	s0,sp,48
 6c8:	84aa                	mv	s1,a0
 6ca:	e010                	sd	a2,0(s0)
 6cc:	e414                	sd	a3,8(s0)
 6ce:	e818                	sd	a4,16(s0)
 6d0:	ec1c                	sd	a5,24(s0)
 6d2:	03043023          	sd	a6,32(s0)
 6d6:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 6da:	fc843c23          	sd	s0,-40(s0)
  vprintf(fd, fmt, ap);
 6de:	8622                	mv	a2,s0
 6e0:	00000097          	auipc	ra,0x0
 6e4:	dfe080e7          	jalr	-514(ra) # 4de <vprintf>
	if(fd==1){
 6e8:	4785                	li	a5,1
 6ea:	02f48963          	beq	s1,a5,71c <fprintf+0x60>
	  write(fd, printbuf, len);
 6ee:	00000917          	auipc	s2,0x0
 6f2:	27a90913          	addi	s2,s2,634 # 968 <len>
 6f6:	00092603          	lw	a2,0(s2)
 6fa:	00000597          	auipc	a1,0x0
 6fe:	27e58593          	addi	a1,a1,638 # 978 <printbuf>
 702:	8526                	mv	a0,s1
 704:	00000097          	auipc	ra,0x0
 708:	c4e080e7          	jalr	-946(ra) # 352 <write>
	  len=0;
 70c:	00092023          	sw	zero,0(s2)
  fflush(fd);
}
 710:	70a2                	ld	ra,40(sp)
 712:	7402                	ld	s0,32(sp)
 714:	64e2                	ld	s1,24(sp)
 716:	6942                	ld	s2,16(sp)
 718:	6125                	addi	sp,sp,96
 71a:	8082                	ret
	  printbuf[len]=0;
 71c:	00000517          	auipc	a0,0x0
 720:	25c50513          	addi	a0,a0,604 # 978 <printbuf>
 724:	00000497          	auipc	s1,0x0
 728:	24448493          	addi	s1,s1,580 # 968 <len>
 72c:	409c                	lw	a5,0(s1)
 72e:	97aa                	add	a5,a5,a0
 730:	00078023          	sb	zero,0(a5)
	  sprint(printbuf);
 734:	00000097          	auipc	ra,0x0
 738:	cce080e7          	jalr	-818(ra) # 402 <sprint>
	  len=0;
 73c:	0004a023          	sw	zero,0(s1)
 740:	bfc1                	j	710 <fprintf+0x54>

0000000000000742 <printf>:

void
printf(const char *fmt, ...)
{
 742:	7159                	addi	sp,sp,-112
 744:	f406                	sd	ra,40(sp)
 746:	f022                	sd	s0,32(sp)
 748:	ec26                	sd	s1,24(sp)
 74a:	1800                	addi	s0,sp,48
 74c:	e40c                	sd	a1,8(s0)
 74e:	e810                	sd	a2,16(s0)
 750:	ec14                	sd	a3,24(s0)
 752:	f018                	sd	a4,32(s0)
 754:	f41c                	sd	a5,40(s0)
 756:	03043823          	sd	a6,48(s0)
 75a:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 75e:	00840613          	addi	a2,s0,8
 762:	fcc43c23          	sd	a2,-40(s0)
  vprintf(1, fmt, ap);
 766:	85aa                	mv	a1,a0
 768:	4505                	li	a0,1
 76a:	00000097          	auipc	ra,0x0
 76e:	d74080e7          	jalr	-652(ra) # 4de <vprintf>
	  printbuf[len]=0;
 772:	00000517          	auipc	a0,0x0
 776:	20650513          	addi	a0,a0,518 # 978 <printbuf>
 77a:	00000497          	auipc	s1,0x0
 77e:	1ee48493          	addi	s1,s1,494 # 968 <len>
 782:	409c                	lw	a5,0(s1)
 784:	97aa                	add	a5,a5,a0
 786:	00078023          	sb	zero,0(a5)
	  sprint(printbuf);
 78a:	00000097          	auipc	ra,0x0
 78e:	c78080e7          	jalr	-904(ra) # 402 <sprint>
	  len=0;
 792:	0004a023          	sw	zero,0(s1)
  fflush(1);
}
 796:	70a2                	ld	ra,40(sp)
 798:	7402                	ld	s0,32(sp)
 79a:	64e2                	ld	s1,24(sp)
 79c:	6165                	addi	sp,sp,112
 79e:	8082                	ret

00000000000007a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7a0:	1141                	addi	sp,sp,-16
 7a2:	e422                	sd	s0,8(sp)
 7a4:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7a6:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7aa:	00000797          	auipc	a5,0x0
 7ae:	1c67b783          	ld	a5,454(a5) # 970 <freep>
 7b2:	a805                	j	7e2 <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 7b4:	4618                	lw	a4,8(a2)
 7b6:	9db9                	addw	a1,a1,a4
 7b8:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 7bc:	6398                	ld	a4,0(a5)
 7be:	6318                	ld	a4,0(a4)
 7c0:	fee53823          	sd	a4,-16(a0)
 7c4:	a091                	j	808 <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 7c6:	ff852703          	lw	a4,-8(a0)
 7ca:	9e39                	addw	a2,a2,a4
 7cc:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 7ce:	ff053703          	ld	a4,-16(a0)
 7d2:	e398                	sd	a4,0(a5)
 7d4:	a099                	j	81a <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7d6:	6398                	ld	a4,0(a5)
 7d8:	00e7e463          	bltu	a5,a4,7e0 <free+0x40>
 7dc:	00e6ea63          	bltu	a3,a4,7f0 <free+0x50>
{
 7e0:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7e2:	fed7fae3          	bgeu	a5,a3,7d6 <free+0x36>
 7e6:	6398                	ld	a4,0(a5)
 7e8:	00e6e463          	bltu	a3,a4,7f0 <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7ec:	fee7eae3          	bltu	a5,a4,7e0 <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 7f0:	ff852583          	lw	a1,-8(a0)
 7f4:	6390                	ld	a2,0(a5)
 7f6:	02059713          	slli	a4,a1,0x20
 7fa:	9301                	srli	a4,a4,0x20
 7fc:	0712                	slli	a4,a4,0x4
 7fe:	9736                	add	a4,a4,a3
 800:	fae60ae3          	beq	a2,a4,7b4 <free+0x14>
    bp->s.ptr = p->s.ptr;
 804:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 808:	4790                	lw	a2,8(a5)
 80a:	02061713          	slli	a4,a2,0x20
 80e:	9301                	srli	a4,a4,0x20
 810:	0712                	slli	a4,a4,0x4
 812:	973e                	add	a4,a4,a5
 814:	fae689e3          	beq	a3,a4,7c6 <free+0x26>
  } else
    p->s.ptr = bp;
 818:	e394                	sd	a3,0(a5)
  freep = p;
 81a:	00000717          	auipc	a4,0x0
 81e:	14f73b23          	sd	a5,342(a4) # 970 <freep>
}
 822:	6422                	ld	s0,8(sp)
 824:	0141                	addi	sp,sp,16
 826:	8082                	ret

0000000000000828 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 828:	7139                	addi	sp,sp,-64
 82a:	fc06                	sd	ra,56(sp)
 82c:	f822                	sd	s0,48(sp)
 82e:	f426                	sd	s1,40(sp)
 830:	f04a                	sd	s2,32(sp)
 832:	ec4e                	sd	s3,24(sp)
 834:	e852                	sd	s4,16(sp)
 836:	e456                	sd	s5,8(sp)
 838:	e05a                	sd	s6,0(sp)
 83a:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 83c:	02051493          	slli	s1,a0,0x20
 840:	9081                	srli	s1,s1,0x20
 842:	04bd                	addi	s1,s1,15
 844:	8091                	srli	s1,s1,0x4
 846:	0014899b          	addiw	s3,s1,1
 84a:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 84c:	00000517          	auipc	a0,0x0
 850:	12453503          	ld	a0,292(a0) # 970 <freep>
 854:	c515                	beqz	a0,880 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 856:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 858:	4798                	lw	a4,8(a5)
 85a:	02977f63          	bgeu	a4,s1,898 <malloc+0x70>
 85e:	8a4e                	mv	s4,s3
 860:	0009871b          	sext.w	a4,s3
 864:	6685                	lui	a3,0x1
 866:	00d77363          	bgeu	a4,a3,86c <malloc+0x44>
 86a:	6a05                	lui	s4,0x1
 86c:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 870:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 874:	00000917          	auipc	s2,0x0
 878:	0fc90913          	addi	s2,s2,252 # 970 <freep>
  if(p == (char*)-1)
 87c:	5afd                	li	s5,-1
 87e:	a88d                	j	8f0 <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 880:	00000797          	auipc	a5,0x0
 884:	16078793          	addi	a5,a5,352 # 9e0 <base>
 888:	00000717          	auipc	a4,0x0
 88c:	0ef73423          	sd	a5,232(a4) # 970 <freep>
 890:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 892:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 896:	b7e1                	j	85e <malloc+0x36>
      if(p->s.size == nunits)
 898:	02e48b63          	beq	s1,a4,8ce <malloc+0xa6>
        p->s.size -= nunits;
 89c:	4137073b          	subw	a4,a4,s3
 8a0:	c798                	sw	a4,8(a5)
        p += p->s.size;
 8a2:	1702                	slli	a4,a4,0x20
 8a4:	9301                	srli	a4,a4,0x20
 8a6:	0712                	slli	a4,a4,0x4
 8a8:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 8aa:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 8ae:	00000717          	auipc	a4,0x0
 8b2:	0ca73123          	sd	a0,194(a4) # 970 <freep>
      return (void*)(p + 1);
 8b6:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8ba:	70e2                	ld	ra,56(sp)
 8bc:	7442                	ld	s0,48(sp)
 8be:	74a2                	ld	s1,40(sp)
 8c0:	7902                	ld	s2,32(sp)
 8c2:	69e2                	ld	s3,24(sp)
 8c4:	6a42                	ld	s4,16(sp)
 8c6:	6aa2                	ld	s5,8(sp)
 8c8:	6b02                	ld	s6,0(sp)
 8ca:	6121                	addi	sp,sp,64
 8cc:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 8ce:	6398                	ld	a4,0(a5)
 8d0:	e118                	sd	a4,0(a0)
 8d2:	bff1                	j	8ae <malloc+0x86>
  hp->s.size = nu;
 8d4:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 8d8:	0541                	addi	a0,a0,16
 8da:	00000097          	auipc	ra,0x0
 8de:	ec6080e7          	jalr	-314(ra) # 7a0 <free>
  return freep;
 8e2:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 8e6:	d971                	beqz	a0,8ba <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8e8:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 8ea:	4798                	lw	a4,8(a5)
 8ec:	fa9776e3          	bgeu	a4,s1,898 <malloc+0x70>
    if(p == freep)
 8f0:	00093703          	ld	a4,0(s2)
 8f4:	853e                	mv	a0,a5
 8f6:	fef719e3          	bne	a4,a5,8e8 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 8fa:	8552                	mv	a0,s4
 8fc:	00000097          	auipc	ra,0x0
 900:	aa6080e7          	jalr	-1370(ra) # 3a2 <sbrk>
  if(p == (char*)-1)
 904:	fd5518e3          	bne	a0,s5,8d4 <malloc+0xac>
        return 0;
 908:	4501                	li	a0,0
 90a:	bf45                	j	8ba <malloc+0x92>
