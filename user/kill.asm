
user/_kill:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/include/stat.h"
#include "xv6-user/user.h"

int
main(int argc, char **argv)
{
   0:	1101                	addi	sp,sp,-32
   2:	ec06                	sd	ra,24(sp)
   4:	e822                	sd	s0,16(sp)
   6:	e426                	sd	s1,8(sp)
   8:	e04a                	sd	s2,0(sp)
   a:	1000                	addi	s0,sp,32
  int i;

  if(argc < 2){
   c:	4785                	li	a5,1
   e:	02a7dd63          	bge	a5,a0,48 <main+0x48>
  12:	00858493          	addi	s1,a1,8
  16:	ffe5091b          	addiw	s2,a0,-2
  1a:	1902                	slli	s2,s2,0x20
  1c:	02095913          	srli	s2,s2,0x20
  20:	090e                	slli	s2,s2,0x3
  22:	05c1                	addi	a1,a1,16
  24:	992e                	add	s2,s2,a1
    fprintf(2, "usage: kill pid...\n");
    exit(1);
  }
  for(i=1; i<argc; i++)
    kill(atoi(argv[i]));
  26:	6088                	ld	a0,0(s1)
  28:	00000097          	auipc	ra,0x0
  2c:	1e0080e7          	jalr	480(ra) # 208 <atoi>
  30:	00000097          	auipc	ra,0x0
  34:	31e080e7          	jalr	798(ra) # 34e <kill>
  for(i=1; i<argc; i++)
  38:	04a1                	addi	s1,s1,8
  3a:	ff2496e3          	bne	s1,s2,26 <main+0x26>
  exit(0);
  3e:	4501                	li	a0,0
  40:	00000097          	auipc	ra,0x0
  44:	2de080e7          	jalr	734(ra) # 31e <exit>
    fprintf(2, "usage: kill pid...\n");
  48:	00001597          	auipc	a1,0x1
  4c:	8b058593          	addi	a1,a1,-1872 # 8f8 <malloc+0xe4>
  50:	4509                	li	a0,2
  52:	00000097          	auipc	ra,0x0
  56:	656080e7          	jalr	1622(ra) # 6a8 <fprintf>
    exit(1);
  5a:	4505                	li	a0,1
  5c:	00000097          	auipc	ra,0x0
  60:	2c2080e7          	jalr	706(ra) # 31e <exit>

0000000000000064 <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
  64:	1141                	addi	sp,sp,-16
  66:	e422                	sd	s0,8(sp)
  68:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  6a:	87aa                	mv	a5,a0
  6c:	0585                	addi	a1,a1,1
  6e:	0785                	addi	a5,a5,1
  70:	fff5c703          	lbu	a4,-1(a1)
  74:	fee78fa3          	sb	a4,-1(a5)
  78:	fb75                	bnez	a4,6c <strcpy+0x8>
    ;
  return os;
}
  7a:	6422                	ld	s0,8(sp)
  7c:	0141                	addi	sp,sp,16
  7e:	8082                	ret

0000000000000080 <strcat>:

char*
strcat(char *s, const char *t)
{
  80:	1141                	addi	sp,sp,-16
  82:	e422                	sd	s0,8(sp)
  84:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
  86:	00054783          	lbu	a5,0(a0)
  8a:	c385                	beqz	a5,aa <strcat+0x2a>
  8c:	87aa                	mv	a5,a0
    s++;
  8e:	0785                	addi	a5,a5,1
  while(*s)
  90:	0007c703          	lbu	a4,0(a5)
  94:	ff6d                	bnez	a4,8e <strcat+0xe>
  while((*s++ = *t++))
  96:	0585                	addi	a1,a1,1
  98:	0785                	addi	a5,a5,1
  9a:	fff5c703          	lbu	a4,-1(a1)
  9e:	fee78fa3          	sb	a4,-1(a5)
  a2:	fb75                	bnez	a4,96 <strcat+0x16>
    ;
  return os;
}
  a4:	6422                	ld	s0,8(sp)
  a6:	0141                	addi	sp,sp,16
  a8:	8082                	ret
  while(*s)
  aa:	87aa                	mv	a5,a0
  ac:	b7ed                	j	96 <strcat+0x16>

00000000000000ae <strcmp>:


int
strcmp(const char *p, const char *q)
{
  ae:	1141                	addi	sp,sp,-16
  b0:	e422                	sd	s0,8(sp)
  b2:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
  b4:	00054783          	lbu	a5,0(a0)
  b8:	cb91                	beqz	a5,cc <strcmp+0x1e>
  ba:	0005c703          	lbu	a4,0(a1)
  be:	00f71763          	bne	a4,a5,cc <strcmp+0x1e>
    p++, q++;
  c2:	0505                	addi	a0,a0,1
  c4:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
  c6:	00054783          	lbu	a5,0(a0)
  ca:	fbe5                	bnez	a5,ba <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
  cc:	0005c503          	lbu	a0,0(a1)
}
  d0:	40a7853b          	subw	a0,a5,a0
  d4:	6422                	ld	s0,8(sp)
  d6:	0141                	addi	sp,sp,16
  d8:	8082                	ret

00000000000000da <strlen>:

uint
strlen(const char *s)
{
  da:	1141                	addi	sp,sp,-16
  dc:	e422                	sd	s0,8(sp)
  de:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
  e0:	00054783          	lbu	a5,0(a0)
  e4:	cf91                	beqz	a5,100 <strlen+0x26>
  e6:	0505                	addi	a0,a0,1
  e8:	87aa                	mv	a5,a0
  ea:	4685                	li	a3,1
  ec:	9e89                	subw	a3,a3,a0
  ee:	00f6853b          	addw	a0,a3,a5
  f2:	0785                	addi	a5,a5,1
  f4:	fff7c703          	lbu	a4,-1(a5)
  f8:	fb7d                	bnez	a4,ee <strlen+0x14>
    ;
  return n;
}
  fa:	6422                	ld	s0,8(sp)
  fc:	0141                	addi	sp,sp,16
  fe:	8082                	ret
  for(n = 0; s[n]; n++)
 100:	4501                	li	a0,0
 102:	bfe5                	j	fa <strlen+0x20>

0000000000000104 <memset>:

void*
memset(void *dst, int c, uint n)
{
 104:	1141                	addi	sp,sp,-16
 106:	e422                	sd	s0,8(sp)
 108:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 10a:	ce09                	beqz	a2,124 <memset+0x20>
 10c:	87aa                	mv	a5,a0
 10e:	fff6071b          	addiw	a4,a2,-1
 112:	1702                	slli	a4,a4,0x20
 114:	9301                	srli	a4,a4,0x20
 116:	0705                	addi	a4,a4,1
 118:	972a                	add	a4,a4,a0
    cdst[i] = c;
 11a:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 11e:	0785                	addi	a5,a5,1
 120:	fee79de3          	bne	a5,a4,11a <memset+0x16>
  }
  return dst;
}
 124:	6422                	ld	s0,8(sp)
 126:	0141                	addi	sp,sp,16
 128:	8082                	ret

000000000000012a <strchr>:

char*
strchr(const char *s, char c)
{
 12a:	1141                	addi	sp,sp,-16
 12c:	e422                	sd	s0,8(sp)
 12e:	0800                	addi	s0,sp,16
  for(; *s; s++)
 130:	00054783          	lbu	a5,0(a0)
 134:	cb99                	beqz	a5,14a <strchr+0x20>
    if(*s == c)
 136:	00f58763          	beq	a1,a5,144 <strchr+0x1a>
  for(; *s; s++)
 13a:	0505                	addi	a0,a0,1
 13c:	00054783          	lbu	a5,0(a0)
 140:	fbfd                	bnez	a5,136 <strchr+0xc>
      return (char*)s;
  return 0;
 142:	4501                	li	a0,0
}
 144:	6422                	ld	s0,8(sp)
 146:	0141                	addi	sp,sp,16
 148:	8082                	ret
  return 0;
 14a:	4501                	li	a0,0
 14c:	bfe5                	j	144 <strchr+0x1a>

000000000000014e <gets>:

char*
gets(char *buf, int max)
{
 14e:	711d                	addi	sp,sp,-96
 150:	ec86                	sd	ra,88(sp)
 152:	e8a2                	sd	s0,80(sp)
 154:	e4a6                	sd	s1,72(sp)
 156:	e0ca                	sd	s2,64(sp)
 158:	fc4e                	sd	s3,56(sp)
 15a:	f852                	sd	s4,48(sp)
 15c:	f456                	sd	s5,40(sp)
 15e:	f05a                	sd	s6,32(sp)
 160:	ec5e                	sd	s7,24(sp)
 162:	1080                	addi	s0,sp,96
 164:	8baa                	mv	s7,a0
 166:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 168:	892a                	mv	s2,a0
 16a:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 16c:	4aa9                	li	s5,10
 16e:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 170:	89a6                	mv	s3,s1
 172:	2485                	addiw	s1,s1,1
 174:	0344d863          	bge	s1,s4,1a4 <gets+0x56>
    cc = read(0, &c, 1);
 178:	4605                	li	a2,1
 17a:	faf40593          	addi	a1,s0,-81
 17e:	4501                	li	a0,0
 180:	00000097          	auipc	ra,0x0
 184:	1b6080e7          	jalr	438(ra) # 336 <read>
    if(cc < 1)
 188:	00a05e63          	blez	a0,1a4 <gets+0x56>
    buf[i++] = c;
 18c:	faf44783          	lbu	a5,-81(s0)
 190:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 194:	01578763          	beq	a5,s5,1a2 <gets+0x54>
 198:	0905                	addi	s2,s2,1
 19a:	fd679be3          	bne	a5,s6,170 <gets+0x22>
  for(i=0; i+1 < max; ){
 19e:	89a6                	mv	s3,s1
 1a0:	a011                	j	1a4 <gets+0x56>
 1a2:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 1a4:	99de                	add	s3,s3,s7
 1a6:	00098023          	sb	zero,0(s3)
  return buf;
}
 1aa:	855e                	mv	a0,s7
 1ac:	60e6                	ld	ra,88(sp)
 1ae:	6446                	ld	s0,80(sp)
 1b0:	64a6                	ld	s1,72(sp)
 1b2:	6906                	ld	s2,64(sp)
 1b4:	79e2                	ld	s3,56(sp)
 1b6:	7a42                	ld	s4,48(sp)
 1b8:	7aa2                	ld	s5,40(sp)
 1ba:	7b02                	ld	s6,32(sp)
 1bc:	6be2                	ld	s7,24(sp)
 1be:	6125                	addi	sp,sp,96
 1c0:	8082                	ret

00000000000001c2 <stat>:

int
stat(const char *n, struct stat *st)
{
 1c2:	1101                	addi	sp,sp,-32
 1c4:	ec06                	sd	ra,24(sp)
 1c6:	e822                	sd	s0,16(sp)
 1c8:	e426                	sd	s1,8(sp)
 1ca:	e04a                	sd	s2,0(sp)
 1cc:	1000                	addi	s0,sp,32
 1ce:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1d0:	4581                	li	a1,0
 1d2:	00000097          	auipc	ra,0x0
 1d6:	18c080e7          	jalr	396(ra) # 35e <open>
  if(fd < 0)
 1da:	02054563          	bltz	a0,204 <stat+0x42>
 1de:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 1e0:	85ca                	mv	a1,s2
 1e2:	00000097          	auipc	ra,0x0
 1e6:	184080e7          	jalr	388(ra) # 366 <fstat>
 1ea:	892a                	mv	s2,a0
  close(fd);
 1ec:	8526                	mv	a0,s1
 1ee:	00000097          	auipc	ra,0x0
 1f2:	158080e7          	jalr	344(ra) # 346 <close>
  return r;
}
 1f6:	854a                	mv	a0,s2
 1f8:	60e2                	ld	ra,24(sp)
 1fa:	6442                	ld	s0,16(sp)
 1fc:	64a2                	ld	s1,8(sp)
 1fe:	6902                	ld	s2,0(sp)
 200:	6105                	addi	sp,sp,32
 202:	8082                	ret
    return -1;
 204:	597d                	li	s2,-1
 206:	bfc5                	j	1f6 <stat+0x34>

0000000000000208 <atoi>:

int
atoi(const char *s)
{
 208:	1141                	addi	sp,sp,-16
 20a:	e422                	sd	s0,8(sp)
 20c:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 20e:	00054703          	lbu	a4,0(a0)
 212:	02d00793          	li	a5,45
  int neg = 1;
 216:	4805                	li	a6,1
  if (*s == '-') {
 218:	04f70363          	beq	a4,a5,25e <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 21c:	00054683          	lbu	a3,0(a0)
 220:	fd06879b          	addiw	a5,a3,-48
 224:	0ff7f793          	andi	a5,a5,255
 228:	4725                	li	a4,9
 22a:	02f76d63          	bltu	a4,a5,264 <atoi+0x5c>
  n = 0;
 22e:	4601                	li	a2,0
  while('0' <= *s && *s <= '9')
 230:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 232:	0505                	addi	a0,a0,1
 234:	0026179b          	slliw	a5,a2,0x2
 238:	9fb1                	addw	a5,a5,a2
 23a:	0017979b          	slliw	a5,a5,0x1
 23e:	9fb5                	addw	a5,a5,a3
 240:	fd07861b          	addiw	a2,a5,-48
  while('0' <= *s && *s <= '9')
 244:	00054683          	lbu	a3,0(a0)
 248:	fd06871b          	addiw	a4,a3,-48
 24c:	0ff77713          	andi	a4,a4,255
 250:	fee5f1e3          	bgeu	a1,a4,232 <atoi+0x2a>
  return n * neg;
}
 254:	02c8053b          	mulw	a0,a6,a2
 258:	6422                	ld	s0,8(sp)
 25a:	0141                	addi	sp,sp,16
 25c:	8082                	ret
    s++;
 25e:	0505                	addi	a0,a0,1
    neg = -1;
 260:	587d                	li	a6,-1
 262:	bf6d                	j	21c <atoi+0x14>
  n = 0;
 264:	4601                	li	a2,0
 266:	b7fd                	j	254 <atoi+0x4c>

0000000000000268 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 268:	1141                	addi	sp,sp,-16
 26a:	e422                	sd	s0,8(sp)
 26c:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 26e:	02b57663          	bgeu	a0,a1,29a <memmove+0x32>
    while(n-- > 0)
 272:	02c05163          	blez	a2,294 <memmove+0x2c>
 276:	fff6079b          	addiw	a5,a2,-1
 27a:	1782                	slli	a5,a5,0x20
 27c:	9381                	srli	a5,a5,0x20
 27e:	0785                	addi	a5,a5,1
 280:	97aa                	add	a5,a5,a0
  dst = vdst;
 282:	872a                	mv	a4,a0
      *dst++ = *src++;
 284:	0585                	addi	a1,a1,1
 286:	0705                	addi	a4,a4,1
 288:	fff5c683          	lbu	a3,-1(a1)
 28c:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 290:	fee79ae3          	bne	a5,a4,284 <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 294:	6422                	ld	s0,8(sp)
 296:	0141                	addi	sp,sp,16
 298:	8082                	ret
    dst += n;
 29a:	00c50733          	add	a4,a0,a2
    src += n;
 29e:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 2a0:	fec05ae3          	blez	a2,294 <memmove+0x2c>
 2a4:	fff6079b          	addiw	a5,a2,-1
 2a8:	1782                	slli	a5,a5,0x20
 2aa:	9381                	srli	a5,a5,0x20
 2ac:	fff7c793          	not	a5,a5
 2b0:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 2b2:	15fd                	addi	a1,a1,-1
 2b4:	177d                	addi	a4,a4,-1
 2b6:	0005c683          	lbu	a3,0(a1)
 2ba:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 2be:	fee79ae3          	bne	a5,a4,2b2 <memmove+0x4a>
 2c2:	bfc9                	j	294 <memmove+0x2c>

00000000000002c4 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 2c4:	1141                	addi	sp,sp,-16
 2c6:	e422                	sd	s0,8(sp)
 2c8:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 2ca:	ca05                	beqz	a2,2fa <memcmp+0x36>
 2cc:	fff6069b          	addiw	a3,a2,-1
 2d0:	1682                	slli	a3,a3,0x20
 2d2:	9281                	srli	a3,a3,0x20
 2d4:	0685                	addi	a3,a3,1
 2d6:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 2d8:	00054783          	lbu	a5,0(a0)
 2dc:	0005c703          	lbu	a4,0(a1)
 2e0:	00e79863          	bne	a5,a4,2f0 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 2e4:	0505                	addi	a0,a0,1
    p2++;
 2e6:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 2e8:	fed518e3          	bne	a0,a3,2d8 <memcmp+0x14>
  }
  return 0;
 2ec:	4501                	li	a0,0
 2ee:	a019                	j	2f4 <memcmp+0x30>
      return *p1 - *p2;
 2f0:	40e7853b          	subw	a0,a5,a4
}
 2f4:	6422                	ld	s0,8(sp)
 2f6:	0141                	addi	sp,sp,16
 2f8:	8082                	ret
  return 0;
 2fa:	4501                	li	a0,0
 2fc:	bfe5                	j	2f4 <memcmp+0x30>

00000000000002fe <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 2fe:	1141                	addi	sp,sp,-16
 300:	e406                	sd	ra,8(sp)
 302:	e022                	sd	s0,0(sp)
 304:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 306:	00000097          	auipc	ra,0x0
 30a:	f62080e7          	jalr	-158(ra) # 268 <memmove>
}
 30e:	60a2                	ld	ra,8(sp)
 310:	6402                	ld	s0,0(sp)
 312:	0141                	addi	sp,sp,16
 314:	8082                	ret

0000000000000316 <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 316:	4885                	li	a7,1
 ecall
 318:	00000073          	ecall
 ret
 31c:	8082                	ret

000000000000031e <exit>:
.global exit
exit:
 li a7, SYS_exit
 31e:	4889                	li	a7,2
 ecall
 320:	00000073          	ecall
 ret
 324:	8082                	ret

0000000000000326 <wait>:
.global wait
wait:
 li a7, SYS_wait
 326:	488d                	li	a7,3
 ecall
 328:	00000073          	ecall
 ret
 32c:	8082                	ret

000000000000032e <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 32e:	4891                	li	a7,4
 ecall
 330:	00000073          	ecall
 ret
 334:	8082                	ret

0000000000000336 <read>:
.global read
read:
 li a7, SYS_read
 336:	4895                	li	a7,5
 ecall
 338:	00000073          	ecall
 ret
 33c:	8082                	ret

000000000000033e <write>:
.global write
write:
 li a7, SYS_write
 33e:	48c1                	li	a7,16
 ecall
 340:	00000073          	ecall
 ret
 344:	8082                	ret

0000000000000346 <close>:
.global close
close:
 li a7, SYS_close
 346:	48d5                	li	a7,21
 ecall
 348:	00000073          	ecall
 ret
 34c:	8082                	ret

000000000000034e <kill>:
.global kill
kill:
 li a7, SYS_kill
 34e:	4899                	li	a7,6
 ecall
 350:	00000073          	ecall
 ret
 354:	8082                	ret

0000000000000356 <exec>:
.global exec
exec:
 li a7, SYS_exec
 356:	489d                	li	a7,7
 ecall
 358:	00000073          	ecall
 ret
 35c:	8082                	ret

000000000000035e <open>:
.global open
open:
 li a7, SYS_open
 35e:	48bd                	li	a7,15
 ecall
 360:	00000073          	ecall
 ret
 364:	8082                	ret

0000000000000366 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 366:	48a1                	li	a7,8
 ecall
 368:	00000073          	ecall
 ret
 36c:	8082                	ret

000000000000036e <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 36e:	48d1                	li	a7,20
 ecall
 370:	00000073          	ecall
 ret
 374:	8082                	ret

0000000000000376 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 376:	48a5                	li	a7,9
 ecall
 378:	00000073          	ecall
 ret
 37c:	8082                	ret

000000000000037e <dup>:
.global dup
dup:
 li a7, SYS_dup
 37e:	48a9                	li	a7,10
 ecall
 380:	00000073          	ecall
 ret
 384:	8082                	ret

0000000000000386 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 386:	48ad                	li	a7,11
 ecall
 388:	00000073          	ecall
 ret
 38c:	8082                	ret

000000000000038e <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 38e:	48b1                	li	a7,12
 ecall
 390:	00000073          	ecall
 ret
 394:	8082                	ret

0000000000000396 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 396:	48b5                	li	a7,13
 ecall
 398:	00000073          	ecall
 ret
 39c:	8082                	ret

000000000000039e <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 39e:	48b9                	li	a7,14
 ecall
 3a0:	00000073          	ecall
 ret
 3a4:	8082                	ret

00000000000003a6 <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 3a6:	48d9                	li	a7,22
 ecall
 3a8:	00000073          	ecall
 ret
 3ac:	8082                	ret

00000000000003ae <dev>:
.global dev
dev:
 li a7, SYS_dev
 3ae:	48dd                	li	a7,23
 ecall
 3b0:	00000073          	ecall
 ret
 3b4:	8082                	ret

00000000000003b6 <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 3b6:	48e1                	li	a7,24
 ecall
 3b8:	00000073          	ecall
 ret
 3bc:	8082                	ret

00000000000003be <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 3be:	48e5                	li	a7,25
 ecall
 3c0:	00000073          	ecall
 ret
 3c4:	8082                	ret

00000000000003c6 <remove>:
.global remove
remove:
 li a7, SYS_remove
 3c6:	48c5                	li	a7,17
 ecall
 3c8:	00000073          	ecall
 ret
 3cc:	8082                	ret

00000000000003ce <trace>:
.global trace
trace:
 li a7, SYS_trace
 3ce:	48c9                	li	a7,18
 ecall
 3d0:	00000073          	ecall
 ret
 3d4:	8082                	ret

00000000000003d6 <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 3d6:	48cd                	li	a7,19
 ecall
 3d8:	00000073          	ecall
 ret
 3dc:	8082                	ret

00000000000003de <rename>:
.global rename
rename:
 li a7, SYS_rename
 3de:	48e9                	li	a7,26
 ecall
 3e0:	00000073          	ecall
 ret
 3e4:	8082                	ret

00000000000003e6 <checkchar>:
.global checkchar
checkchar:
 li a7, SYS_checkchar
 3e6:	48ed                	li	a7,27
 ecall
 3e8:	00000073          	ecall
 ret
 3ec:	8082                	ret

00000000000003ee <sprint>:
.global sprint
sprint:
 li a7, SYS_sprint
 3ee:	48f1                	li	a7,28
 ecall
 3f0:	00000073          	ecall
 ret
 3f4:	8082                	ret

00000000000003f6 <putc>:
static char digits[] = "0123456789ABCDEF";
static char printbuf[100];
static int  len = 0;
static void
putc(int fd, char c)
{
 3f6:	1141                	addi	sp,sp,-16
 3f8:	e422                	sd	s0,8(sp)
 3fa:	0800                	addi	s0,sp,16
  printbuf[len++]=c;
 3fc:	00000797          	auipc	a5,0x0
 400:	53478793          	addi	a5,a5,1332 # 930 <len>
 404:	4398                	lw	a4,0(a5)
 406:	0017069b          	addiw	a3,a4,1
 40a:	c394                	sw	a3,0(a5)
 40c:	00000797          	auipc	a5,0x0
 410:	53478793          	addi	a5,a5,1332 # 940 <printbuf>
 414:	97ba                	add	a5,a5,a4
 416:	00b78023          	sb	a1,0(a5)
}
 41a:	6422                	ld	s0,8(sp)
 41c:	0141                	addi	sp,sp,16
 41e:	8082                	ret

0000000000000420 <printint>:
	}
}

static void
printint(int fd, int xx, int base, int sgn)
{
 420:	7139                	addi	sp,sp,-64
 422:	fc06                	sd	ra,56(sp)
 424:	f822                	sd	s0,48(sp)
 426:	f426                	sd	s1,40(sp)
 428:	f04a                	sd	s2,32(sp)
 42a:	ec4e                	sd	s3,24(sp)
 42c:	0080                	addi	s0,sp,64
 42e:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 430:	c299                	beqz	a3,436 <printint+0x16>
 432:	0805c863          	bltz	a1,4c2 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 436:	2581                	sext.w	a1,a1
  neg = 0;
 438:	4881                	li	a7,0
 43a:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 43e:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 440:	2601                	sext.w	a2,a2
 442:	00000517          	auipc	a0,0x0
 446:	4d650513          	addi	a0,a0,1238 # 918 <digits>
 44a:	883a                	mv	a6,a4
 44c:	2705                	addiw	a4,a4,1
 44e:	02c5f7bb          	remuw	a5,a1,a2
 452:	1782                	slli	a5,a5,0x20
 454:	9381                	srli	a5,a5,0x20
 456:	97aa                	add	a5,a5,a0
 458:	0007c783          	lbu	a5,0(a5)
 45c:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 460:	0005879b          	sext.w	a5,a1
 464:	02c5d5bb          	divuw	a1,a1,a2
 468:	0685                	addi	a3,a3,1
 46a:	fec7f0e3          	bgeu	a5,a2,44a <printint+0x2a>
  if(neg)
 46e:	00088b63          	beqz	a7,484 <printint+0x64>
    buf[i++] = '-';
 472:	fd040793          	addi	a5,s0,-48
 476:	973e                	add	a4,a4,a5
 478:	02d00793          	li	a5,45
 47c:	fef70823          	sb	a5,-16(a4)
 480:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 484:	02e05863          	blez	a4,4b4 <printint+0x94>
 488:	fc040793          	addi	a5,s0,-64
 48c:	00e78933          	add	s2,a5,a4
 490:	fff78993          	addi	s3,a5,-1
 494:	99ba                	add	s3,s3,a4
 496:	377d                	addiw	a4,a4,-1
 498:	1702                	slli	a4,a4,0x20
 49a:	9301                	srli	a4,a4,0x20
 49c:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 4a0:	fff94583          	lbu	a1,-1(s2)
 4a4:	8526                	mv	a0,s1
 4a6:	00000097          	auipc	ra,0x0
 4aa:	f50080e7          	jalr	-176(ra) # 3f6 <putc>
  while(--i >= 0)
 4ae:	197d                	addi	s2,s2,-1
 4b0:	ff3918e3          	bne	s2,s3,4a0 <printint+0x80>
}
 4b4:	70e2                	ld	ra,56(sp)
 4b6:	7442                	ld	s0,48(sp)
 4b8:	74a2                	ld	s1,40(sp)
 4ba:	7902                	ld	s2,32(sp)
 4bc:	69e2                	ld	s3,24(sp)
 4be:	6121                	addi	sp,sp,64
 4c0:	8082                	ret
    x = -xx;
 4c2:	40b005bb          	negw	a1,a1
    neg = 1;
 4c6:	4885                	li	a7,1
    x = -xx;
 4c8:	bf8d                	j	43a <printint+0x1a>

00000000000004ca <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 4ca:	7119                	addi	sp,sp,-128
 4cc:	fc86                	sd	ra,120(sp)
 4ce:	f8a2                	sd	s0,112(sp)
 4d0:	f4a6                	sd	s1,104(sp)
 4d2:	f0ca                	sd	s2,96(sp)
 4d4:	ecce                	sd	s3,88(sp)
 4d6:	e8d2                	sd	s4,80(sp)
 4d8:	e4d6                	sd	s5,72(sp)
 4da:	e0da                	sd	s6,64(sp)
 4dc:	fc5e                	sd	s7,56(sp)
 4de:	f862                	sd	s8,48(sp)
 4e0:	f466                	sd	s9,40(sp)
 4e2:	f06a                	sd	s10,32(sp)
 4e4:	ec6e                	sd	s11,24(sp)
 4e6:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 4e8:	0005c903          	lbu	s2,0(a1)
 4ec:	18090f63          	beqz	s2,68a <vprintf+0x1c0>
 4f0:	8aaa                	mv	s5,a0
 4f2:	8b32                	mv	s6,a2
 4f4:	00158493          	addi	s1,a1,1
  state = 0;
 4f8:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 4fa:	02500a13          	li	s4,37
      if(c == 'd'){
 4fe:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 502:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 506:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 50a:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 50e:	00000b97          	auipc	s7,0x0
 512:	40ab8b93          	addi	s7,s7,1034 # 918 <digits>
 516:	a839                	j	534 <vprintf+0x6a>
        putc(fd, c);
 518:	85ca                	mv	a1,s2
 51a:	8556                	mv	a0,s5
 51c:	00000097          	auipc	ra,0x0
 520:	eda080e7          	jalr	-294(ra) # 3f6 <putc>
 524:	a019                	j	52a <vprintf+0x60>
    } else if(state == '%'){
 526:	01498f63          	beq	s3,s4,544 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 52a:	0485                	addi	s1,s1,1
 52c:	fff4c903          	lbu	s2,-1(s1)
 530:	14090d63          	beqz	s2,68a <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 534:	0009079b          	sext.w	a5,s2
    if(state == 0){
 538:	fe0997e3          	bnez	s3,526 <vprintf+0x5c>
      if(c == '%'){
 53c:	fd479ee3          	bne	a5,s4,518 <vprintf+0x4e>
        state = '%';
 540:	89be                	mv	s3,a5
 542:	b7e5                	j	52a <vprintf+0x60>
      if(c == 'd'){
 544:	05878063          	beq	a5,s8,584 <vprintf+0xba>
      } else if(c == 'l') {
 548:	05978c63          	beq	a5,s9,5a0 <vprintf+0xd6>
      } else if(c == 'x') {
 54c:	07a78863          	beq	a5,s10,5bc <vprintf+0xf2>
      } else if(c == 'p') {
 550:	09b78463          	beq	a5,s11,5d8 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 554:	07300713          	li	a4,115
 558:	0ce78663          	beq	a5,a4,624 <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 55c:	06300713          	li	a4,99
 560:	0ee78e63          	beq	a5,a4,65c <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 564:	11478863          	beq	a5,s4,674 <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 568:	85d2                	mv	a1,s4
 56a:	8556                	mv	a0,s5
 56c:	00000097          	auipc	ra,0x0
 570:	e8a080e7          	jalr	-374(ra) # 3f6 <putc>
        putc(fd, c);
 574:	85ca                	mv	a1,s2
 576:	8556                	mv	a0,s5
 578:	00000097          	auipc	ra,0x0
 57c:	e7e080e7          	jalr	-386(ra) # 3f6 <putc>
      }
      state = 0;
 580:	4981                	li	s3,0
 582:	b765                	j	52a <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 584:	008b0913          	addi	s2,s6,8
 588:	4685                	li	a3,1
 58a:	4629                	li	a2,10
 58c:	000b2583          	lw	a1,0(s6)
 590:	8556                	mv	a0,s5
 592:	00000097          	auipc	ra,0x0
 596:	e8e080e7          	jalr	-370(ra) # 420 <printint>
 59a:	8b4a                	mv	s6,s2
      state = 0;
 59c:	4981                	li	s3,0
 59e:	b771                	j	52a <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 5a0:	008b0913          	addi	s2,s6,8
 5a4:	4681                	li	a3,0
 5a6:	4629                	li	a2,10
 5a8:	000b2583          	lw	a1,0(s6)
 5ac:	8556                	mv	a0,s5
 5ae:	00000097          	auipc	ra,0x0
 5b2:	e72080e7          	jalr	-398(ra) # 420 <printint>
 5b6:	8b4a                	mv	s6,s2
      state = 0;
 5b8:	4981                	li	s3,0
 5ba:	bf85                	j	52a <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 5bc:	008b0913          	addi	s2,s6,8
 5c0:	4681                	li	a3,0
 5c2:	4641                	li	a2,16
 5c4:	000b2583          	lw	a1,0(s6)
 5c8:	8556                	mv	a0,s5
 5ca:	00000097          	auipc	ra,0x0
 5ce:	e56080e7          	jalr	-426(ra) # 420 <printint>
 5d2:	8b4a                	mv	s6,s2
      state = 0;
 5d4:	4981                	li	s3,0
 5d6:	bf91                	j	52a <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 5d8:	008b0793          	addi	a5,s6,8
 5dc:	f8f43423          	sd	a5,-120(s0)
 5e0:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 5e4:	03000593          	li	a1,48
 5e8:	8556                	mv	a0,s5
 5ea:	00000097          	auipc	ra,0x0
 5ee:	e0c080e7          	jalr	-500(ra) # 3f6 <putc>
  putc(fd, 'x');
 5f2:	85ea                	mv	a1,s10
 5f4:	8556                	mv	a0,s5
 5f6:	00000097          	auipc	ra,0x0
 5fa:	e00080e7          	jalr	-512(ra) # 3f6 <putc>
 5fe:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 600:	03c9d793          	srli	a5,s3,0x3c
 604:	97de                	add	a5,a5,s7
 606:	0007c583          	lbu	a1,0(a5)
 60a:	8556                	mv	a0,s5
 60c:	00000097          	auipc	ra,0x0
 610:	dea080e7          	jalr	-534(ra) # 3f6 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 614:	0992                	slli	s3,s3,0x4
 616:	397d                	addiw	s2,s2,-1
 618:	fe0914e3          	bnez	s2,600 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 61c:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 620:	4981                	li	s3,0
 622:	b721                	j	52a <vprintf+0x60>
        s = va_arg(ap, char*);
 624:	008b0993          	addi	s3,s6,8
 628:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 62c:	02090163          	beqz	s2,64e <vprintf+0x184>
        while(*s != 0){
 630:	00094583          	lbu	a1,0(s2)
 634:	c9a1                	beqz	a1,684 <vprintf+0x1ba>
          putc(fd, *s);
 636:	8556                	mv	a0,s5
 638:	00000097          	auipc	ra,0x0
 63c:	dbe080e7          	jalr	-578(ra) # 3f6 <putc>
          s++;
 640:	0905                	addi	s2,s2,1
        while(*s != 0){
 642:	00094583          	lbu	a1,0(s2)
 646:	f9e5                	bnez	a1,636 <vprintf+0x16c>
        s = va_arg(ap, char*);
 648:	8b4e                	mv	s6,s3
      state = 0;
 64a:	4981                	li	s3,0
 64c:	bdf9                	j	52a <vprintf+0x60>
          s = "(null)";
 64e:	00000917          	auipc	s2,0x0
 652:	2c290913          	addi	s2,s2,706 # 910 <malloc+0xfc>
        while(*s != 0){
 656:	02800593          	li	a1,40
 65a:	bff1                	j	636 <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 65c:	008b0913          	addi	s2,s6,8
 660:	000b4583          	lbu	a1,0(s6)
 664:	8556                	mv	a0,s5
 666:	00000097          	auipc	ra,0x0
 66a:	d90080e7          	jalr	-624(ra) # 3f6 <putc>
 66e:	8b4a                	mv	s6,s2
      state = 0;
 670:	4981                	li	s3,0
 672:	bd65                	j	52a <vprintf+0x60>
        putc(fd, c);
 674:	85d2                	mv	a1,s4
 676:	8556                	mv	a0,s5
 678:	00000097          	auipc	ra,0x0
 67c:	d7e080e7          	jalr	-642(ra) # 3f6 <putc>
      state = 0;
 680:	4981                	li	s3,0
 682:	b565                	j	52a <vprintf+0x60>
        s = va_arg(ap, char*);
 684:	8b4e                	mv	s6,s3
      state = 0;
 686:	4981                	li	s3,0
 688:	b54d                	j	52a <vprintf+0x60>
    }
  }
}
 68a:	70e6                	ld	ra,120(sp)
 68c:	7446                	ld	s0,112(sp)
 68e:	74a6                	ld	s1,104(sp)
 690:	7906                	ld	s2,96(sp)
 692:	69e6                	ld	s3,88(sp)
 694:	6a46                	ld	s4,80(sp)
 696:	6aa6                	ld	s5,72(sp)
 698:	6b06                	ld	s6,64(sp)
 69a:	7be2                	ld	s7,56(sp)
 69c:	7c42                	ld	s8,48(sp)
 69e:	7ca2                	ld	s9,40(sp)
 6a0:	7d02                	ld	s10,32(sp)
 6a2:	6de2                	ld	s11,24(sp)
 6a4:	6109                	addi	sp,sp,128
 6a6:	8082                	ret

00000000000006a8 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 6a8:	711d                	addi	sp,sp,-96
 6aa:	f406                	sd	ra,40(sp)
 6ac:	f022                	sd	s0,32(sp)
 6ae:	ec26                	sd	s1,24(sp)
 6b0:	e84a                	sd	s2,16(sp)
 6b2:	1800                	addi	s0,sp,48
 6b4:	84aa                	mv	s1,a0
 6b6:	e010                	sd	a2,0(s0)
 6b8:	e414                	sd	a3,8(s0)
 6ba:	e818                	sd	a4,16(s0)
 6bc:	ec1c                	sd	a5,24(s0)
 6be:	03043023          	sd	a6,32(s0)
 6c2:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 6c6:	fc843c23          	sd	s0,-40(s0)
  vprintf(fd, fmt, ap);
 6ca:	8622                	mv	a2,s0
 6cc:	00000097          	auipc	ra,0x0
 6d0:	dfe080e7          	jalr	-514(ra) # 4ca <vprintf>
	if(fd==1){
 6d4:	4785                	li	a5,1
 6d6:	02f48963          	beq	s1,a5,708 <fprintf+0x60>
	  write(fd, printbuf, len);
 6da:	00000917          	auipc	s2,0x0
 6de:	25690913          	addi	s2,s2,598 # 930 <len>
 6e2:	00092603          	lw	a2,0(s2)
 6e6:	00000597          	auipc	a1,0x0
 6ea:	25a58593          	addi	a1,a1,602 # 940 <printbuf>
 6ee:	8526                	mv	a0,s1
 6f0:	00000097          	auipc	ra,0x0
 6f4:	c4e080e7          	jalr	-946(ra) # 33e <write>
	  len=0;
 6f8:	00092023          	sw	zero,0(s2)
  fflush(fd);
}
 6fc:	70a2                	ld	ra,40(sp)
 6fe:	7402                	ld	s0,32(sp)
 700:	64e2                	ld	s1,24(sp)
 702:	6942                	ld	s2,16(sp)
 704:	6125                	addi	sp,sp,96
 706:	8082                	ret
	  printbuf[len]=0;
 708:	00000517          	auipc	a0,0x0
 70c:	23850513          	addi	a0,a0,568 # 940 <printbuf>
 710:	00000497          	auipc	s1,0x0
 714:	22048493          	addi	s1,s1,544 # 930 <len>
 718:	409c                	lw	a5,0(s1)
 71a:	97aa                	add	a5,a5,a0
 71c:	00078023          	sb	zero,0(a5)
	  sprint(printbuf);
 720:	00000097          	auipc	ra,0x0
 724:	cce080e7          	jalr	-818(ra) # 3ee <sprint>
	  len=0;
 728:	0004a023          	sw	zero,0(s1)
 72c:	bfc1                	j	6fc <fprintf+0x54>

000000000000072e <printf>:

void
printf(const char *fmt, ...)
{
 72e:	7159                	addi	sp,sp,-112
 730:	f406                	sd	ra,40(sp)
 732:	f022                	sd	s0,32(sp)
 734:	ec26                	sd	s1,24(sp)
 736:	1800                	addi	s0,sp,48
 738:	e40c                	sd	a1,8(s0)
 73a:	e810                	sd	a2,16(s0)
 73c:	ec14                	sd	a3,24(s0)
 73e:	f018                	sd	a4,32(s0)
 740:	f41c                	sd	a5,40(s0)
 742:	03043823          	sd	a6,48(s0)
 746:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 74a:	00840613          	addi	a2,s0,8
 74e:	fcc43c23          	sd	a2,-40(s0)
  vprintf(1, fmt, ap);
 752:	85aa                	mv	a1,a0
 754:	4505                	li	a0,1
 756:	00000097          	auipc	ra,0x0
 75a:	d74080e7          	jalr	-652(ra) # 4ca <vprintf>
	  printbuf[len]=0;
 75e:	00000517          	auipc	a0,0x0
 762:	1e250513          	addi	a0,a0,482 # 940 <printbuf>
 766:	00000497          	auipc	s1,0x0
 76a:	1ca48493          	addi	s1,s1,458 # 930 <len>
 76e:	409c                	lw	a5,0(s1)
 770:	97aa                	add	a5,a5,a0
 772:	00078023          	sb	zero,0(a5)
	  sprint(printbuf);
 776:	00000097          	auipc	ra,0x0
 77a:	c78080e7          	jalr	-904(ra) # 3ee <sprint>
	  len=0;
 77e:	0004a023          	sw	zero,0(s1)
  fflush(1);
}
 782:	70a2                	ld	ra,40(sp)
 784:	7402                	ld	s0,32(sp)
 786:	64e2                	ld	s1,24(sp)
 788:	6165                	addi	sp,sp,112
 78a:	8082                	ret

000000000000078c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 78c:	1141                	addi	sp,sp,-16
 78e:	e422                	sd	s0,8(sp)
 790:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 792:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 796:	00000797          	auipc	a5,0x0
 79a:	1a27b783          	ld	a5,418(a5) # 938 <freep>
 79e:	a805                	j	7ce <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 7a0:	4618                	lw	a4,8(a2)
 7a2:	9db9                	addw	a1,a1,a4
 7a4:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 7a8:	6398                	ld	a4,0(a5)
 7aa:	6318                	ld	a4,0(a4)
 7ac:	fee53823          	sd	a4,-16(a0)
 7b0:	a091                	j	7f4 <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 7b2:	ff852703          	lw	a4,-8(a0)
 7b6:	9e39                	addw	a2,a2,a4
 7b8:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 7ba:	ff053703          	ld	a4,-16(a0)
 7be:	e398                	sd	a4,0(a5)
 7c0:	a099                	j	806 <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7c2:	6398                	ld	a4,0(a5)
 7c4:	00e7e463          	bltu	a5,a4,7cc <free+0x40>
 7c8:	00e6ea63          	bltu	a3,a4,7dc <free+0x50>
{
 7cc:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7ce:	fed7fae3          	bgeu	a5,a3,7c2 <free+0x36>
 7d2:	6398                	ld	a4,0(a5)
 7d4:	00e6e463          	bltu	a3,a4,7dc <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7d8:	fee7eae3          	bltu	a5,a4,7cc <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 7dc:	ff852583          	lw	a1,-8(a0)
 7e0:	6390                	ld	a2,0(a5)
 7e2:	02059713          	slli	a4,a1,0x20
 7e6:	9301                	srli	a4,a4,0x20
 7e8:	0712                	slli	a4,a4,0x4
 7ea:	9736                	add	a4,a4,a3
 7ec:	fae60ae3          	beq	a2,a4,7a0 <free+0x14>
    bp->s.ptr = p->s.ptr;
 7f0:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 7f4:	4790                	lw	a2,8(a5)
 7f6:	02061713          	slli	a4,a2,0x20
 7fa:	9301                	srli	a4,a4,0x20
 7fc:	0712                	slli	a4,a4,0x4
 7fe:	973e                	add	a4,a4,a5
 800:	fae689e3          	beq	a3,a4,7b2 <free+0x26>
  } else
    p->s.ptr = bp;
 804:	e394                	sd	a3,0(a5)
  freep = p;
 806:	00000717          	auipc	a4,0x0
 80a:	12f73923          	sd	a5,306(a4) # 938 <freep>
}
 80e:	6422                	ld	s0,8(sp)
 810:	0141                	addi	sp,sp,16
 812:	8082                	ret

0000000000000814 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 814:	7139                	addi	sp,sp,-64
 816:	fc06                	sd	ra,56(sp)
 818:	f822                	sd	s0,48(sp)
 81a:	f426                	sd	s1,40(sp)
 81c:	f04a                	sd	s2,32(sp)
 81e:	ec4e                	sd	s3,24(sp)
 820:	e852                	sd	s4,16(sp)
 822:	e456                	sd	s5,8(sp)
 824:	e05a                	sd	s6,0(sp)
 826:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 828:	02051493          	slli	s1,a0,0x20
 82c:	9081                	srli	s1,s1,0x20
 82e:	04bd                	addi	s1,s1,15
 830:	8091                	srli	s1,s1,0x4
 832:	0014899b          	addiw	s3,s1,1
 836:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 838:	00000517          	auipc	a0,0x0
 83c:	10053503          	ld	a0,256(a0) # 938 <freep>
 840:	c515                	beqz	a0,86c <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 842:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 844:	4798                	lw	a4,8(a5)
 846:	02977f63          	bgeu	a4,s1,884 <malloc+0x70>
 84a:	8a4e                	mv	s4,s3
 84c:	0009871b          	sext.w	a4,s3
 850:	6685                	lui	a3,0x1
 852:	00d77363          	bgeu	a4,a3,858 <malloc+0x44>
 856:	6a05                	lui	s4,0x1
 858:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 85c:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 860:	00000917          	auipc	s2,0x0
 864:	0d890913          	addi	s2,s2,216 # 938 <freep>
  if(p == (char*)-1)
 868:	5afd                	li	s5,-1
 86a:	a88d                	j	8dc <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 86c:	00000797          	auipc	a5,0x0
 870:	13c78793          	addi	a5,a5,316 # 9a8 <base>
 874:	00000717          	auipc	a4,0x0
 878:	0cf73223          	sd	a5,196(a4) # 938 <freep>
 87c:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 87e:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 882:	b7e1                	j	84a <malloc+0x36>
      if(p->s.size == nunits)
 884:	02e48b63          	beq	s1,a4,8ba <malloc+0xa6>
        p->s.size -= nunits;
 888:	4137073b          	subw	a4,a4,s3
 88c:	c798                	sw	a4,8(a5)
        p += p->s.size;
 88e:	1702                	slli	a4,a4,0x20
 890:	9301                	srli	a4,a4,0x20
 892:	0712                	slli	a4,a4,0x4
 894:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 896:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 89a:	00000717          	auipc	a4,0x0
 89e:	08a73f23          	sd	a0,158(a4) # 938 <freep>
      return (void*)(p + 1);
 8a2:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8a6:	70e2                	ld	ra,56(sp)
 8a8:	7442                	ld	s0,48(sp)
 8aa:	74a2                	ld	s1,40(sp)
 8ac:	7902                	ld	s2,32(sp)
 8ae:	69e2                	ld	s3,24(sp)
 8b0:	6a42                	ld	s4,16(sp)
 8b2:	6aa2                	ld	s5,8(sp)
 8b4:	6b02                	ld	s6,0(sp)
 8b6:	6121                	addi	sp,sp,64
 8b8:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 8ba:	6398                	ld	a4,0(a5)
 8bc:	e118                	sd	a4,0(a0)
 8be:	bff1                	j	89a <malloc+0x86>
  hp->s.size = nu;
 8c0:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 8c4:	0541                	addi	a0,a0,16
 8c6:	00000097          	auipc	ra,0x0
 8ca:	ec6080e7          	jalr	-314(ra) # 78c <free>
  return freep;
 8ce:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 8d2:	d971                	beqz	a0,8a6 <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8d4:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 8d6:	4798                	lw	a4,8(a5)
 8d8:	fa9776e3          	bgeu	a4,s1,884 <malloc+0x70>
    if(p == freep)
 8dc:	00093703          	ld	a4,0(s2)
 8e0:	853e                	mv	a0,a5
 8e2:	fef719e3          	bne	a4,a5,8d4 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 8e6:	8552                	mv	a0,s4
 8e8:	00000097          	auipc	ra,0x0
 8ec:	aa6080e7          	jalr	-1370(ra) # 38e <sbrk>
  if(p == (char*)-1)
 8f0:	fd5518e3          	bne	a0,s5,8c0 <malloc+0xac>
        return 0;
 8f4:	4501                	li	a0,0
 8f6:	bf45                	j	8a6 <malloc+0x92>
