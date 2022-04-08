
user/_test:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/include/stat.h"
#include "kernel/include/sysinfo.h"
#include "xv6-user/user.h"

int main()
{
   0:	1101                	addi	sp,sp,-32
   2:	ec06                	sd	ra,24(sp)
   4:	e822                	sd	s0,16(sp)
   6:	1000                	addi	s0,sp,32
    struct sysinfo info;
    if (sysinfo(&info) < 0) {
   8:	fe040513          	addi	a0,s0,-32
   c:	00000097          	auipc	ra,0x0
  10:	3c4080e7          	jalr	964(ra) # 3d0 <sysinfo>
  14:	02054c63          	bltz	a0,4c <main+0x4c>
        printf("sysinfo fail!\n");
    } else {
        printf("memory left: %d KB\n", info.freemem >> 10);
  18:	fe043583          	ld	a1,-32(s0)
  1c:	81a9                	srli	a1,a1,0xa
  1e:	00001517          	auipc	a0,0x1
  22:	8ea50513          	addi	a0,a0,-1814 # 908 <malloc+0xfa>
  26:	00000097          	auipc	ra,0x0
  2a:	702080e7          	jalr	1794(ra) # 728 <printf>
        printf("process amount: %d\n", info.nproc);
  2e:	fe843583          	ld	a1,-24(s0)
  32:	00001517          	auipc	a0,0x1
  36:	8ee50513          	addi	a0,a0,-1810 # 920 <malloc+0x112>
  3a:	00000097          	auipc	ra,0x0
  3e:	6ee080e7          	jalr	1774(ra) # 728 <printf>
    }
    exit(0);
  42:	4501                	li	a0,0
  44:	00000097          	auipc	ra,0x0
  48:	2d4080e7          	jalr	724(ra) # 318 <exit>
        printf("sysinfo fail!\n");
  4c:	00001517          	auipc	a0,0x1
  50:	8ac50513          	addi	a0,a0,-1876 # 8f8 <malloc+0xea>
  54:	00000097          	auipc	ra,0x0
  58:	6d4080e7          	jalr	1748(ra) # 728 <printf>
  5c:	b7dd                	j	42 <main+0x42>

000000000000005e <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
  5e:	1141                	addi	sp,sp,-16
  60:	e422                	sd	s0,8(sp)
  62:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  64:	87aa                	mv	a5,a0
  66:	0585                	addi	a1,a1,1
  68:	0785                	addi	a5,a5,1
  6a:	fff5c703          	lbu	a4,-1(a1)
  6e:	fee78fa3          	sb	a4,-1(a5)
  72:	fb75                	bnez	a4,66 <strcpy+0x8>
    ;
  return os;
}
  74:	6422                	ld	s0,8(sp)
  76:	0141                	addi	sp,sp,16
  78:	8082                	ret

000000000000007a <strcat>:

char*
strcat(char *s, const char *t)
{
  7a:	1141                	addi	sp,sp,-16
  7c:	e422                	sd	s0,8(sp)
  7e:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
  80:	00054783          	lbu	a5,0(a0)
  84:	c385                	beqz	a5,a4 <strcat+0x2a>
  86:	87aa                	mv	a5,a0
    s++;
  88:	0785                	addi	a5,a5,1
  while(*s)
  8a:	0007c703          	lbu	a4,0(a5)
  8e:	ff6d                	bnez	a4,88 <strcat+0xe>
  while((*s++ = *t++))
  90:	0585                	addi	a1,a1,1
  92:	0785                	addi	a5,a5,1
  94:	fff5c703          	lbu	a4,-1(a1)
  98:	fee78fa3          	sb	a4,-1(a5)
  9c:	fb75                	bnez	a4,90 <strcat+0x16>
    ;
  return os;
}
  9e:	6422                	ld	s0,8(sp)
  a0:	0141                	addi	sp,sp,16
  a2:	8082                	ret
  while(*s)
  a4:	87aa                	mv	a5,a0
  a6:	b7ed                	j	90 <strcat+0x16>

00000000000000a8 <strcmp>:


int
strcmp(const char *p, const char *q)
{
  a8:	1141                	addi	sp,sp,-16
  aa:	e422                	sd	s0,8(sp)
  ac:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
  ae:	00054783          	lbu	a5,0(a0)
  b2:	cb91                	beqz	a5,c6 <strcmp+0x1e>
  b4:	0005c703          	lbu	a4,0(a1)
  b8:	00f71763          	bne	a4,a5,c6 <strcmp+0x1e>
    p++, q++;
  bc:	0505                	addi	a0,a0,1
  be:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
  c0:	00054783          	lbu	a5,0(a0)
  c4:	fbe5                	bnez	a5,b4 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
  c6:	0005c503          	lbu	a0,0(a1)
}
  ca:	40a7853b          	subw	a0,a5,a0
  ce:	6422                	ld	s0,8(sp)
  d0:	0141                	addi	sp,sp,16
  d2:	8082                	ret

00000000000000d4 <strlen>:

uint
strlen(const char *s)
{
  d4:	1141                	addi	sp,sp,-16
  d6:	e422                	sd	s0,8(sp)
  d8:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
  da:	00054783          	lbu	a5,0(a0)
  de:	cf91                	beqz	a5,fa <strlen+0x26>
  e0:	0505                	addi	a0,a0,1
  e2:	87aa                	mv	a5,a0
  e4:	4685                	li	a3,1
  e6:	9e89                	subw	a3,a3,a0
  e8:	00f6853b          	addw	a0,a3,a5
  ec:	0785                	addi	a5,a5,1
  ee:	fff7c703          	lbu	a4,-1(a5)
  f2:	fb7d                	bnez	a4,e8 <strlen+0x14>
    ;
  return n;
}
  f4:	6422                	ld	s0,8(sp)
  f6:	0141                	addi	sp,sp,16
  f8:	8082                	ret
  for(n = 0; s[n]; n++)
  fa:	4501                	li	a0,0
  fc:	bfe5                	j	f4 <strlen+0x20>

00000000000000fe <memset>:

void*
memset(void *dst, int c, uint n)
{
  fe:	1141                	addi	sp,sp,-16
 100:	e422                	sd	s0,8(sp)
 102:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 104:	ce09                	beqz	a2,11e <memset+0x20>
 106:	87aa                	mv	a5,a0
 108:	fff6071b          	addiw	a4,a2,-1
 10c:	1702                	slli	a4,a4,0x20
 10e:	9301                	srli	a4,a4,0x20
 110:	0705                	addi	a4,a4,1
 112:	972a                	add	a4,a4,a0
    cdst[i] = c;
 114:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 118:	0785                	addi	a5,a5,1
 11a:	fee79de3          	bne	a5,a4,114 <memset+0x16>
  }
  return dst;
}
 11e:	6422                	ld	s0,8(sp)
 120:	0141                	addi	sp,sp,16
 122:	8082                	ret

0000000000000124 <strchr>:

char*
strchr(const char *s, char c)
{
 124:	1141                	addi	sp,sp,-16
 126:	e422                	sd	s0,8(sp)
 128:	0800                	addi	s0,sp,16
  for(; *s; s++)
 12a:	00054783          	lbu	a5,0(a0)
 12e:	cb99                	beqz	a5,144 <strchr+0x20>
    if(*s == c)
 130:	00f58763          	beq	a1,a5,13e <strchr+0x1a>
  for(; *s; s++)
 134:	0505                	addi	a0,a0,1
 136:	00054783          	lbu	a5,0(a0)
 13a:	fbfd                	bnez	a5,130 <strchr+0xc>
      return (char*)s;
  return 0;
 13c:	4501                	li	a0,0
}
 13e:	6422                	ld	s0,8(sp)
 140:	0141                	addi	sp,sp,16
 142:	8082                	ret
  return 0;
 144:	4501                	li	a0,0
 146:	bfe5                	j	13e <strchr+0x1a>

0000000000000148 <gets>:

char*
gets(char *buf, int max)
{
 148:	711d                	addi	sp,sp,-96
 14a:	ec86                	sd	ra,88(sp)
 14c:	e8a2                	sd	s0,80(sp)
 14e:	e4a6                	sd	s1,72(sp)
 150:	e0ca                	sd	s2,64(sp)
 152:	fc4e                	sd	s3,56(sp)
 154:	f852                	sd	s4,48(sp)
 156:	f456                	sd	s5,40(sp)
 158:	f05a                	sd	s6,32(sp)
 15a:	ec5e                	sd	s7,24(sp)
 15c:	1080                	addi	s0,sp,96
 15e:	8baa                	mv	s7,a0
 160:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 162:	892a                	mv	s2,a0
 164:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 166:	4aa9                	li	s5,10
 168:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 16a:	89a6                	mv	s3,s1
 16c:	2485                	addiw	s1,s1,1
 16e:	0344d863          	bge	s1,s4,19e <gets+0x56>
    cc = read(0, &c, 1);
 172:	4605                	li	a2,1
 174:	faf40593          	addi	a1,s0,-81
 178:	4501                	li	a0,0
 17a:	00000097          	auipc	ra,0x0
 17e:	1b6080e7          	jalr	438(ra) # 330 <read>
    if(cc < 1)
 182:	00a05e63          	blez	a0,19e <gets+0x56>
    buf[i++] = c;
 186:	faf44783          	lbu	a5,-81(s0)
 18a:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 18e:	01578763          	beq	a5,s5,19c <gets+0x54>
 192:	0905                	addi	s2,s2,1
 194:	fd679be3          	bne	a5,s6,16a <gets+0x22>
  for(i=0; i+1 < max; ){
 198:	89a6                	mv	s3,s1
 19a:	a011                	j	19e <gets+0x56>
 19c:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 19e:	99de                	add	s3,s3,s7
 1a0:	00098023          	sb	zero,0(s3)
  return buf;
}
 1a4:	855e                	mv	a0,s7
 1a6:	60e6                	ld	ra,88(sp)
 1a8:	6446                	ld	s0,80(sp)
 1aa:	64a6                	ld	s1,72(sp)
 1ac:	6906                	ld	s2,64(sp)
 1ae:	79e2                	ld	s3,56(sp)
 1b0:	7a42                	ld	s4,48(sp)
 1b2:	7aa2                	ld	s5,40(sp)
 1b4:	7b02                	ld	s6,32(sp)
 1b6:	6be2                	ld	s7,24(sp)
 1b8:	6125                	addi	sp,sp,96
 1ba:	8082                	ret

00000000000001bc <stat>:

int
stat(const char *n, struct stat *st)
{
 1bc:	1101                	addi	sp,sp,-32
 1be:	ec06                	sd	ra,24(sp)
 1c0:	e822                	sd	s0,16(sp)
 1c2:	e426                	sd	s1,8(sp)
 1c4:	e04a                	sd	s2,0(sp)
 1c6:	1000                	addi	s0,sp,32
 1c8:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1ca:	4581                	li	a1,0
 1cc:	00000097          	auipc	ra,0x0
 1d0:	18c080e7          	jalr	396(ra) # 358 <open>
  if(fd < 0)
 1d4:	02054563          	bltz	a0,1fe <stat+0x42>
 1d8:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 1da:	85ca                	mv	a1,s2
 1dc:	00000097          	auipc	ra,0x0
 1e0:	184080e7          	jalr	388(ra) # 360 <fstat>
 1e4:	892a                	mv	s2,a0
  close(fd);
 1e6:	8526                	mv	a0,s1
 1e8:	00000097          	auipc	ra,0x0
 1ec:	158080e7          	jalr	344(ra) # 340 <close>
  return r;
}
 1f0:	854a                	mv	a0,s2
 1f2:	60e2                	ld	ra,24(sp)
 1f4:	6442                	ld	s0,16(sp)
 1f6:	64a2                	ld	s1,8(sp)
 1f8:	6902                	ld	s2,0(sp)
 1fa:	6105                	addi	sp,sp,32
 1fc:	8082                	ret
    return -1;
 1fe:	597d                	li	s2,-1
 200:	bfc5                	j	1f0 <stat+0x34>

0000000000000202 <atoi>:

int
atoi(const char *s)
{
 202:	1141                	addi	sp,sp,-16
 204:	e422                	sd	s0,8(sp)
 206:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 208:	00054703          	lbu	a4,0(a0)
 20c:	02d00793          	li	a5,45
  int neg = 1;
 210:	4805                	li	a6,1
  if (*s == '-') {
 212:	04f70363          	beq	a4,a5,258 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 216:	00054683          	lbu	a3,0(a0)
 21a:	fd06879b          	addiw	a5,a3,-48
 21e:	0ff7f793          	andi	a5,a5,255
 222:	4725                	li	a4,9
 224:	02f76d63          	bltu	a4,a5,25e <atoi+0x5c>
  n = 0;
 228:	4601                	li	a2,0
  while('0' <= *s && *s <= '9')
 22a:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 22c:	0505                	addi	a0,a0,1
 22e:	0026179b          	slliw	a5,a2,0x2
 232:	9fb1                	addw	a5,a5,a2
 234:	0017979b          	slliw	a5,a5,0x1
 238:	9fb5                	addw	a5,a5,a3
 23a:	fd07861b          	addiw	a2,a5,-48
  while('0' <= *s && *s <= '9')
 23e:	00054683          	lbu	a3,0(a0)
 242:	fd06871b          	addiw	a4,a3,-48
 246:	0ff77713          	andi	a4,a4,255
 24a:	fee5f1e3          	bgeu	a1,a4,22c <atoi+0x2a>
  return n * neg;
}
 24e:	02c8053b          	mulw	a0,a6,a2
 252:	6422                	ld	s0,8(sp)
 254:	0141                	addi	sp,sp,16
 256:	8082                	ret
    s++;
 258:	0505                	addi	a0,a0,1
    neg = -1;
 25a:	587d                	li	a6,-1
 25c:	bf6d                	j	216 <atoi+0x14>
  n = 0;
 25e:	4601                	li	a2,0
 260:	b7fd                	j	24e <atoi+0x4c>

0000000000000262 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 262:	1141                	addi	sp,sp,-16
 264:	e422                	sd	s0,8(sp)
 266:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 268:	02b57663          	bgeu	a0,a1,294 <memmove+0x32>
    while(n-- > 0)
 26c:	02c05163          	blez	a2,28e <memmove+0x2c>
 270:	fff6079b          	addiw	a5,a2,-1
 274:	1782                	slli	a5,a5,0x20
 276:	9381                	srli	a5,a5,0x20
 278:	0785                	addi	a5,a5,1
 27a:	97aa                	add	a5,a5,a0
  dst = vdst;
 27c:	872a                	mv	a4,a0
      *dst++ = *src++;
 27e:	0585                	addi	a1,a1,1
 280:	0705                	addi	a4,a4,1
 282:	fff5c683          	lbu	a3,-1(a1)
 286:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 28a:	fee79ae3          	bne	a5,a4,27e <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 28e:	6422                	ld	s0,8(sp)
 290:	0141                	addi	sp,sp,16
 292:	8082                	ret
    dst += n;
 294:	00c50733          	add	a4,a0,a2
    src += n;
 298:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 29a:	fec05ae3          	blez	a2,28e <memmove+0x2c>
 29e:	fff6079b          	addiw	a5,a2,-1
 2a2:	1782                	slli	a5,a5,0x20
 2a4:	9381                	srli	a5,a5,0x20
 2a6:	fff7c793          	not	a5,a5
 2aa:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 2ac:	15fd                	addi	a1,a1,-1
 2ae:	177d                	addi	a4,a4,-1
 2b0:	0005c683          	lbu	a3,0(a1)
 2b4:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 2b8:	fee79ae3          	bne	a5,a4,2ac <memmove+0x4a>
 2bc:	bfc9                	j	28e <memmove+0x2c>

00000000000002be <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 2be:	1141                	addi	sp,sp,-16
 2c0:	e422                	sd	s0,8(sp)
 2c2:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 2c4:	ca05                	beqz	a2,2f4 <memcmp+0x36>
 2c6:	fff6069b          	addiw	a3,a2,-1
 2ca:	1682                	slli	a3,a3,0x20
 2cc:	9281                	srli	a3,a3,0x20
 2ce:	0685                	addi	a3,a3,1
 2d0:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 2d2:	00054783          	lbu	a5,0(a0)
 2d6:	0005c703          	lbu	a4,0(a1)
 2da:	00e79863          	bne	a5,a4,2ea <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 2de:	0505                	addi	a0,a0,1
    p2++;
 2e0:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 2e2:	fed518e3          	bne	a0,a3,2d2 <memcmp+0x14>
  }
  return 0;
 2e6:	4501                	li	a0,0
 2e8:	a019                	j	2ee <memcmp+0x30>
      return *p1 - *p2;
 2ea:	40e7853b          	subw	a0,a5,a4
}
 2ee:	6422                	ld	s0,8(sp)
 2f0:	0141                	addi	sp,sp,16
 2f2:	8082                	ret
  return 0;
 2f4:	4501                	li	a0,0
 2f6:	bfe5                	j	2ee <memcmp+0x30>

00000000000002f8 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 2f8:	1141                	addi	sp,sp,-16
 2fa:	e406                	sd	ra,8(sp)
 2fc:	e022                	sd	s0,0(sp)
 2fe:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 300:	00000097          	auipc	ra,0x0
 304:	f62080e7          	jalr	-158(ra) # 262 <memmove>
}
 308:	60a2                	ld	ra,8(sp)
 30a:	6402                	ld	s0,0(sp)
 30c:	0141                	addi	sp,sp,16
 30e:	8082                	ret

0000000000000310 <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 310:	4885                	li	a7,1
 ecall
 312:	00000073          	ecall
 ret
 316:	8082                	ret

0000000000000318 <exit>:
.global exit
exit:
 li a7, SYS_exit
 318:	4889                	li	a7,2
 ecall
 31a:	00000073          	ecall
 ret
 31e:	8082                	ret

0000000000000320 <wait>:
.global wait
wait:
 li a7, SYS_wait
 320:	488d                	li	a7,3
 ecall
 322:	00000073          	ecall
 ret
 326:	8082                	ret

0000000000000328 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 328:	4891                	li	a7,4
 ecall
 32a:	00000073          	ecall
 ret
 32e:	8082                	ret

0000000000000330 <read>:
.global read
read:
 li a7, SYS_read
 330:	4895                	li	a7,5
 ecall
 332:	00000073          	ecall
 ret
 336:	8082                	ret

0000000000000338 <write>:
.global write
write:
 li a7, SYS_write
 338:	48c1                	li	a7,16
 ecall
 33a:	00000073          	ecall
 ret
 33e:	8082                	ret

0000000000000340 <close>:
.global close
close:
 li a7, SYS_close
 340:	48d5                	li	a7,21
 ecall
 342:	00000073          	ecall
 ret
 346:	8082                	ret

0000000000000348 <kill>:
.global kill
kill:
 li a7, SYS_kill
 348:	4899                	li	a7,6
 ecall
 34a:	00000073          	ecall
 ret
 34e:	8082                	ret

0000000000000350 <exec>:
.global exec
exec:
 li a7, SYS_exec
 350:	489d                	li	a7,7
 ecall
 352:	00000073          	ecall
 ret
 356:	8082                	ret

0000000000000358 <open>:
.global open
open:
 li a7, SYS_open
 358:	48bd                	li	a7,15
 ecall
 35a:	00000073          	ecall
 ret
 35e:	8082                	ret

0000000000000360 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 360:	48a1                	li	a7,8
 ecall
 362:	00000073          	ecall
 ret
 366:	8082                	ret

0000000000000368 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 368:	48d1                	li	a7,20
 ecall
 36a:	00000073          	ecall
 ret
 36e:	8082                	ret

0000000000000370 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 370:	48a5                	li	a7,9
 ecall
 372:	00000073          	ecall
 ret
 376:	8082                	ret

0000000000000378 <dup>:
.global dup
dup:
 li a7, SYS_dup
 378:	48a9                	li	a7,10
 ecall
 37a:	00000073          	ecall
 ret
 37e:	8082                	ret

0000000000000380 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 380:	48ad                	li	a7,11
 ecall
 382:	00000073          	ecall
 ret
 386:	8082                	ret

0000000000000388 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 388:	48b1                	li	a7,12
 ecall
 38a:	00000073          	ecall
 ret
 38e:	8082                	ret

0000000000000390 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 390:	48b5                	li	a7,13
 ecall
 392:	00000073          	ecall
 ret
 396:	8082                	ret

0000000000000398 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 398:	48b9                	li	a7,14
 ecall
 39a:	00000073          	ecall
 ret
 39e:	8082                	ret

00000000000003a0 <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 3a0:	48d9                	li	a7,22
 ecall
 3a2:	00000073          	ecall
 ret
 3a6:	8082                	ret

00000000000003a8 <dev>:
.global dev
dev:
 li a7, SYS_dev
 3a8:	48dd                	li	a7,23
 ecall
 3aa:	00000073          	ecall
 ret
 3ae:	8082                	ret

00000000000003b0 <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 3b0:	48e1                	li	a7,24
 ecall
 3b2:	00000073          	ecall
 ret
 3b6:	8082                	ret

00000000000003b8 <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 3b8:	48e5                	li	a7,25
 ecall
 3ba:	00000073          	ecall
 ret
 3be:	8082                	ret

00000000000003c0 <remove>:
.global remove
remove:
 li a7, SYS_remove
 3c0:	48c5                	li	a7,17
 ecall
 3c2:	00000073          	ecall
 ret
 3c6:	8082                	ret

00000000000003c8 <trace>:
.global trace
trace:
 li a7, SYS_trace
 3c8:	48c9                	li	a7,18
 ecall
 3ca:	00000073          	ecall
 ret
 3ce:	8082                	ret

00000000000003d0 <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 3d0:	48cd                	li	a7,19
 ecall
 3d2:	00000073          	ecall
 ret
 3d6:	8082                	ret

00000000000003d8 <rename>:
.global rename
rename:
 li a7, SYS_rename
 3d8:	48e9                	li	a7,26
 ecall
 3da:	00000073          	ecall
 ret
 3de:	8082                	ret

00000000000003e0 <checkchar>:
.global checkchar
checkchar:
 li a7, SYS_checkchar
 3e0:	48ed                	li	a7,27
 ecall
 3e2:	00000073          	ecall
 ret
 3e6:	8082                	ret

00000000000003e8 <sprint>:
.global sprint
sprint:
 li a7, SYS_sprint
 3e8:	48f1                	li	a7,28
 ecall
 3ea:	00000073          	ecall
 ret
 3ee:	8082                	ret

00000000000003f0 <putc>:
static char digits[] = "0123456789ABCDEF";
static char printbuf[100];
static int  len = 0;
static void
putc(int fd, char c)
{
 3f0:	1141                	addi	sp,sp,-16
 3f2:	e422                	sd	s0,8(sp)
 3f4:	0800                	addi	s0,sp,16
  printbuf[len++]=c;
 3f6:	00000797          	auipc	a5,0x0
 3fa:	56278793          	addi	a5,a5,1378 # 958 <len>
 3fe:	4398                	lw	a4,0(a5)
 400:	0017069b          	addiw	a3,a4,1
 404:	c394                	sw	a3,0(a5)
 406:	00000797          	auipc	a5,0x0
 40a:	56278793          	addi	a5,a5,1378 # 968 <printbuf>
 40e:	97ba                	add	a5,a5,a4
 410:	00b78023          	sb	a1,0(a5)
}
 414:	6422                	ld	s0,8(sp)
 416:	0141                	addi	sp,sp,16
 418:	8082                	ret

000000000000041a <printint>:
	}
}

static void
printint(int fd, int xx, int base, int sgn)
{
 41a:	7139                	addi	sp,sp,-64
 41c:	fc06                	sd	ra,56(sp)
 41e:	f822                	sd	s0,48(sp)
 420:	f426                	sd	s1,40(sp)
 422:	f04a                	sd	s2,32(sp)
 424:	ec4e                	sd	s3,24(sp)
 426:	0080                	addi	s0,sp,64
 428:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 42a:	c299                	beqz	a3,430 <printint+0x16>
 42c:	0805c863          	bltz	a1,4bc <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 430:	2581                	sext.w	a1,a1
  neg = 0;
 432:	4881                	li	a7,0
 434:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 438:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 43a:	2601                	sext.w	a2,a2
 43c:	00000517          	auipc	a0,0x0
 440:	50450513          	addi	a0,a0,1284 # 940 <digits>
 444:	883a                	mv	a6,a4
 446:	2705                	addiw	a4,a4,1
 448:	02c5f7bb          	remuw	a5,a1,a2
 44c:	1782                	slli	a5,a5,0x20
 44e:	9381                	srli	a5,a5,0x20
 450:	97aa                	add	a5,a5,a0
 452:	0007c783          	lbu	a5,0(a5)
 456:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 45a:	0005879b          	sext.w	a5,a1
 45e:	02c5d5bb          	divuw	a1,a1,a2
 462:	0685                	addi	a3,a3,1
 464:	fec7f0e3          	bgeu	a5,a2,444 <printint+0x2a>
  if(neg)
 468:	00088b63          	beqz	a7,47e <printint+0x64>
    buf[i++] = '-';
 46c:	fd040793          	addi	a5,s0,-48
 470:	973e                	add	a4,a4,a5
 472:	02d00793          	li	a5,45
 476:	fef70823          	sb	a5,-16(a4)
 47a:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 47e:	02e05863          	blez	a4,4ae <printint+0x94>
 482:	fc040793          	addi	a5,s0,-64
 486:	00e78933          	add	s2,a5,a4
 48a:	fff78993          	addi	s3,a5,-1
 48e:	99ba                	add	s3,s3,a4
 490:	377d                	addiw	a4,a4,-1
 492:	1702                	slli	a4,a4,0x20
 494:	9301                	srli	a4,a4,0x20
 496:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 49a:	fff94583          	lbu	a1,-1(s2)
 49e:	8526                	mv	a0,s1
 4a0:	00000097          	auipc	ra,0x0
 4a4:	f50080e7          	jalr	-176(ra) # 3f0 <putc>
  while(--i >= 0)
 4a8:	197d                	addi	s2,s2,-1
 4aa:	ff3918e3          	bne	s2,s3,49a <printint+0x80>
}
 4ae:	70e2                	ld	ra,56(sp)
 4b0:	7442                	ld	s0,48(sp)
 4b2:	74a2                	ld	s1,40(sp)
 4b4:	7902                	ld	s2,32(sp)
 4b6:	69e2                	ld	s3,24(sp)
 4b8:	6121                	addi	sp,sp,64
 4ba:	8082                	ret
    x = -xx;
 4bc:	40b005bb          	negw	a1,a1
    neg = 1;
 4c0:	4885                	li	a7,1
    x = -xx;
 4c2:	bf8d                	j	434 <printint+0x1a>

00000000000004c4 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 4c4:	7119                	addi	sp,sp,-128
 4c6:	fc86                	sd	ra,120(sp)
 4c8:	f8a2                	sd	s0,112(sp)
 4ca:	f4a6                	sd	s1,104(sp)
 4cc:	f0ca                	sd	s2,96(sp)
 4ce:	ecce                	sd	s3,88(sp)
 4d0:	e8d2                	sd	s4,80(sp)
 4d2:	e4d6                	sd	s5,72(sp)
 4d4:	e0da                	sd	s6,64(sp)
 4d6:	fc5e                	sd	s7,56(sp)
 4d8:	f862                	sd	s8,48(sp)
 4da:	f466                	sd	s9,40(sp)
 4dc:	f06a                	sd	s10,32(sp)
 4de:	ec6e                	sd	s11,24(sp)
 4e0:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 4e2:	0005c903          	lbu	s2,0(a1)
 4e6:	18090f63          	beqz	s2,684 <vprintf+0x1c0>
 4ea:	8aaa                	mv	s5,a0
 4ec:	8b32                	mv	s6,a2
 4ee:	00158493          	addi	s1,a1,1
  state = 0;
 4f2:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 4f4:	02500a13          	li	s4,37
      if(c == 'd'){
 4f8:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 4fc:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 500:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 504:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 508:	00000b97          	auipc	s7,0x0
 50c:	438b8b93          	addi	s7,s7,1080 # 940 <digits>
 510:	a839                	j	52e <vprintf+0x6a>
        putc(fd, c);
 512:	85ca                	mv	a1,s2
 514:	8556                	mv	a0,s5
 516:	00000097          	auipc	ra,0x0
 51a:	eda080e7          	jalr	-294(ra) # 3f0 <putc>
 51e:	a019                	j	524 <vprintf+0x60>
    } else if(state == '%'){
 520:	01498f63          	beq	s3,s4,53e <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 524:	0485                	addi	s1,s1,1
 526:	fff4c903          	lbu	s2,-1(s1)
 52a:	14090d63          	beqz	s2,684 <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 52e:	0009079b          	sext.w	a5,s2
    if(state == 0){
 532:	fe0997e3          	bnez	s3,520 <vprintf+0x5c>
      if(c == '%'){
 536:	fd479ee3          	bne	a5,s4,512 <vprintf+0x4e>
        state = '%';
 53a:	89be                	mv	s3,a5
 53c:	b7e5                	j	524 <vprintf+0x60>
      if(c == 'd'){
 53e:	05878063          	beq	a5,s8,57e <vprintf+0xba>
      } else if(c == 'l') {
 542:	05978c63          	beq	a5,s9,59a <vprintf+0xd6>
      } else if(c == 'x') {
 546:	07a78863          	beq	a5,s10,5b6 <vprintf+0xf2>
      } else if(c == 'p') {
 54a:	09b78463          	beq	a5,s11,5d2 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 54e:	07300713          	li	a4,115
 552:	0ce78663          	beq	a5,a4,61e <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 556:	06300713          	li	a4,99
 55a:	0ee78e63          	beq	a5,a4,656 <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 55e:	11478863          	beq	a5,s4,66e <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 562:	85d2                	mv	a1,s4
 564:	8556                	mv	a0,s5
 566:	00000097          	auipc	ra,0x0
 56a:	e8a080e7          	jalr	-374(ra) # 3f0 <putc>
        putc(fd, c);
 56e:	85ca                	mv	a1,s2
 570:	8556                	mv	a0,s5
 572:	00000097          	auipc	ra,0x0
 576:	e7e080e7          	jalr	-386(ra) # 3f0 <putc>
      }
      state = 0;
 57a:	4981                	li	s3,0
 57c:	b765                	j	524 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 57e:	008b0913          	addi	s2,s6,8
 582:	4685                	li	a3,1
 584:	4629                	li	a2,10
 586:	000b2583          	lw	a1,0(s6)
 58a:	8556                	mv	a0,s5
 58c:	00000097          	auipc	ra,0x0
 590:	e8e080e7          	jalr	-370(ra) # 41a <printint>
 594:	8b4a                	mv	s6,s2
      state = 0;
 596:	4981                	li	s3,0
 598:	b771                	j	524 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 59a:	008b0913          	addi	s2,s6,8
 59e:	4681                	li	a3,0
 5a0:	4629                	li	a2,10
 5a2:	000b2583          	lw	a1,0(s6)
 5a6:	8556                	mv	a0,s5
 5a8:	00000097          	auipc	ra,0x0
 5ac:	e72080e7          	jalr	-398(ra) # 41a <printint>
 5b0:	8b4a                	mv	s6,s2
      state = 0;
 5b2:	4981                	li	s3,0
 5b4:	bf85                	j	524 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 5b6:	008b0913          	addi	s2,s6,8
 5ba:	4681                	li	a3,0
 5bc:	4641                	li	a2,16
 5be:	000b2583          	lw	a1,0(s6)
 5c2:	8556                	mv	a0,s5
 5c4:	00000097          	auipc	ra,0x0
 5c8:	e56080e7          	jalr	-426(ra) # 41a <printint>
 5cc:	8b4a                	mv	s6,s2
      state = 0;
 5ce:	4981                	li	s3,0
 5d0:	bf91                	j	524 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 5d2:	008b0793          	addi	a5,s6,8
 5d6:	f8f43423          	sd	a5,-120(s0)
 5da:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 5de:	03000593          	li	a1,48
 5e2:	8556                	mv	a0,s5
 5e4:	00000097          	auipc	ra,0x0
 5e8:	e0c080e7          	jalr	-500(ra) # 3f0 <putc>
  putc(fd, 'x');
 5ec:	85ea                	mv	a1,s10
 5ee:	8556                	mv	a0,s5
 5f0:	00000097          	auipc	ra,0x0
 5f4:	e00080e7          	jalr	-512(ra) # 3f0 <putc>
 5f8:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 5fa:	03c9d793          	srli	a5,s3,0x3c
 5fe:	97de                	add	a5,a5,s7
 600:	0007c583          	lbu	a1,0(a5)
 604:	8556                	mv	a0,s5
 606:	00000097          	auipc	ra,0x0
 60a:	dea080e7          	jalr	-534(ra) # 3f0 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 60e:	0992                	slli	s3,s3,0x4
 610:	397d                	addiw	s2,s2,-1
 612:	fe0914e3          	bnez	s2,5fa <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 616:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 61a:	4981                	li	s3,0
 61c:	b721                	j	524 <vprintf+0x60>
        s = va_arg(ap, char*);
 61e:	008b0993          	addi	s3,s6,8
 622:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 626:	02090163          	beqz	s2,648 <vprintf+0x184>
        while(*s != 0){
 62a:	00094583          	lbu	a1,0(s2)
 62e:	c9a1                	beqz	a1,67e <vprintf+0x1ba>
          putc(fd, *s);
 630:	8556                	mv	a0,s5
 632:	00000097          	auipc	ra,0x0
 636:	dbe080e7          	jalr	-578(ra) # 3f0 <putc>
          s++;
 63a:	0905                	addi	s2,s2,1
        while(*s != 0){
 63c:	00094583          	lbu	a1,0(s2)
 640:	f9e5                	bnez	a1,630 <vprintf+0x16c>
        s = va_arg(ap, char*);
 642:	8b4e                	mv	s6,s3
      state = 0;
 644:	4981                	li	s3,0
 646:	bdf9                	j	524 <vprintf+0x60>
          s = "(null)";
 648:	00000917          	auipc	s2,0x0
 64c:	2f090913          	addi	s2,s2,752 # 938 <malloc+0x12a>
        while(*s != 0){
 650:	02800593          	li	a1,40
 654:	bff1                	j	630 <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 656:	008b0913          	addi	s2,s6,8
 65a:	000b4583          	lbu	a1,0(s6)
 65e:	8556                	mv	a0,s5
 660:	00000097          	auipc	ra,0x0
 664:	d90080e7          	jalr	-624(ra) # 3f0 <putc>
 668:	8b4a                	mv	s6,s2
      state = 0;
 66a:	4981                	li	s3,0
 66c:	bd65                	j	524 <vprintf+0x60>
        putc(fd, c);
 66e:	85d2                	mv	a1,s4
 670:	8556                	mv	a0,s5
 672:	00000097          	auipc	ra,0x0
 676:	d7e080e7          	jalr	-642(ra) # 3f0 <putc>
      state = 0;
 67a:	4981                	li	s3,0
 67c:	b565                	j	524 <vprintf+0x60>
        s = va_arg(ap, char*);
 67e:	8b4e                	mv	s6,s3
      state = 0;
 680:	4981                	li	s3,0
 682:	b54d                	j	524 <vprintf+0x60>
    }
  }
}
 684:	70e6                	ld	ra,120(sp)
 686:	7446                	ld	s0,112(sp)
 688:	74a6                	ld	s1,104(sp)
 68a:	7906                	ld	s2,96(sp)
 68c:	69e6                	ld	s3,88(sp)
 68e:	6a46                	ld	s4,80(sp)
 690:	6aa6                	ld	s5,72(sp)
 692:	6b06                	ld	s6,64(sp)
 694:	7be2                	ld	s7,56(sp)
 696:	7c42                	ld	s8,48(sp)
 698:	7ca2                	ld	s9,40(sp)
 69a:	7d02                	ld	s10,32(sp)
 69c:	6de2                	ld	s11,24(sp)
 69e:	6109                	addi	sp,sp,128
 6a0:	8082                	ret

00000000000006a2 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 6a2:	711d                	addi	sp,sp,-96
 6a4:	f406                	sd	ra,40(sp)
 6a6:	f022                	sd	s0,32(sp)
 6a8:	ec26                	sd	s1,24(sp)
 6aa:	e84a                	sd	s2,16(sp)
 6ac:	1800                	addi	s0,sp,48
 6ae:	84aa                	mv	s1,a0
 6b0:	e010                	sd	a2,0(s0)
 6b2:	e414                	sd	a3,8(s0)
 6b4:	e818                	sd	a4,16(s0)
 6b6:	ec1c                	sd	a5,24(s0)
 6b8:	03043023          	sd	a6,32(s0)
 6bc:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 6c0:	fc843c23          	sd	s0,-40(s0)
  vprintf(fd, fmt, ap);
 6c4:	8622                	mv	a2,s0
 6c6:	00000097          	auipc	ra,0x0
 6ca:	dfe080e7          	jalr	-514(ra) # 4c4 <vprintf>
	if(fd==1){
 6ce:	4785                	li	a5,1
 6d0:	02f48963          	beq	s1,a5,702 <fprintf+0x60>
	  write(fd, printbuf, len);
 6d4:	00000917          	auipc	s2,0x0
 6d8:	28490913          	addi	s2,s2,644 # 958 <len>
 6dc:	00092603          	lw	a2,0(s2)
 6e0:	00000597          	auipc	a1,0x0
 6e4:	28858593          	addi	a1,a1,648 # 968 <printbuf>
 6e8:	8526                	mv	a0,s1
 6ea:	00000097          	auipc	ra,0x0
 6ee:	c4e080e7          	jalr	-946(ra) # 338 <write>
	  len=0;
 6f2:	00092023          	sw	zero,0(s2)
  fflush(fd);
}
 6f6:	70a2                	ld	ra,40(sp)
 6f8:	7402                	ld	s0,32(sp)
 6fa:	64e2                	ld	s1,24(sp)
 6fc:	6942                	ld	s2,16(sp)
 6fe:	6125                	addi	sp,sp,96
 700:	8082                	ret
	  printbuf[len]=0;
 702:	00000517          	auipc	a0,0x0
 706:	26650513          	addi	a0,a0,614 # 968 <printbuf>
 70a:	00000497          	auipc	s1,0x0
 70e:	24e48493          	addi	s1,s1,590 # 958 <len>
 712:	409c                	lw	a5,0(s1)
 714:	97aa                	add	a5,a5,a0
 716:	00078023          	sb	zero,0(a5)
	  sprint(printbuf);
 71a:	00000097          	auipc	ra,0x0
 71e:	cce080e7          	jalr	-818(ra) # 3e8 <sprint>
	  len=0;
 722:	0004a023          	sw	zero,0(s1)
 726:	bfc1                	j	6f6 <fprintf+0x54>

0000000000000728 <printf>:

void
printf(const char *fmt, ...)
{
 728:	7159                	addi	sp,sp,-112
 72a:	f406                	sd	ra,40(sp)
 72c:	f022                	sd	s0,32(sp)
 72e:	ec26                	sd	s1,24(sp)
 730:	1800                	addi	s0,sp,48
 732:	e40c                	sd	a1,8(s0)
 734:	e810                	sd	a2,16(s0)
 736:	ec14                	sd	a3,24(s0)
 738:	f018                	sd	a4,32(s0)
 73a:	f41c                	sd	a5,40(s0)
 73c:	03043823          	sd	a6,48(s0)
 740:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 744:	00840613          	addi	a2,s0,8
 748:	fcc43c23          	sd	a2,-40(s0)
  vprintf(1, fmt, ap);
 74c:	85aa                	mv	a1,a0
 74e:	4505                	li	a0,1
 750:	00000097          	auipc	ra,0x0
 754:	d74080e7          	jalr	-652(ra) # 4c4 <vprintf>
	  printbuf[len]=0;
 758:	00000517          	auipc	a0,0x0
 75c:	21050513          	addi	a0,a0,528 # 968 <printbuf>
 760:	00000497          	auipc	s1,0x0
 764:	1f848493          	addi	s1,s1,504 # 958 <len>
 768:	409c                	lw	a5,0(s1)
 76a:	97aa                	add	a5,a5,a0
 76c:	00078023          	sb	zero,0(a5)
	  sprint(printbuf);
 770:	00000097          	auipc	ra,0x0
 774:	c78080e7          	jalr	-904(ra) # 3e8 <sprint>
	  len=0;
 778:	0004a023          	sw	zero,0(s1)
  fflush(1);
}
 77c:	70a2                	ld	ra,40(sp)
 77e:	7402                	ld	s0,32(sp)
 780:	64e2                	ld	s1,24(sp)
 782:	6165                	addi	sp,sp,112
 784:	8082                	ret

0000000000000786 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 786:	1141                	addi	sp,sp,-16
 788:	e422                	sd	s0,8(sp)
 78a:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 78c:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 790:	00000797          	auipc	a5,0x0
 794:	1d07b783          	ld	a5,464(a5) # 960 <freep>
 798:	a805                	j	7c8 <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 79a:	4618                	lw	a4,8(a2)
 79c:	9db9                	addw	a1,a1,a4
 79e:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 7a2:	6398                	ld	a4,0(a5)
 7a4:	6318                	ld	a4,0(a4)
 7a6:	fee53823          	sd	a4,-16(a0)
 7aa:	a091                	j	7ee <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 7ac:	ff852703          	lw	a4,-8(a0)
 7b0:	9e39                	addw	a2,a2,a4
 7b2:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 7b4:	ff053703          	ld	a4,-16(a0)
 7b8:	e398                	sd	a4,0(a5)
 7ba:	a099                	j	800 <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7bc:	6398                	ld	a4,0(a5)
 7be:	00e7e463          	bltu	a5,a4,7c6 <free+0x40>
 7c2:	00e6ea63          	bltu	a3,a4,7d6 <free+0x50>
{
 7c6:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7c8:	fed7fae3          	bgeu	a5,a3,7bc <free+0x36>
 7cc:	6398                	ld	a4,0(a5)
 7ce:	00e6e463          	bltu	a3,a4,7d6 <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7d2:	fee7eae3          	bltu	a5,a4,7c6 <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 7d6:	ff852583          	lw	a1,-8(a0)
 7da:	6390                	ld	a2,0(a5)
 7dc:	02059713          	slli	a4,a1,0x20
 7e0:	9301                	srli	a4,a4,0x20
 7e2:	0712                	slli	a4,a4,0x4
 7e4:	9736                	add	a4,a4,a3
 7e6:	fae60ae3          	beq	a2,a4,79a <free+0x14>
    bp->s.ptr = p->s.ptr;
 7ea:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 7ee:	4790                	lw	a2,8(a5)
 7f0:	02061713          	slli	a4,a2,0x20
 7f4:	9301                	srli	a4,a4,0x20
 7f6:	0712                	slli	a4,a4,0x4
 7f8:	973e                	add	a4,a4,a5
 7fa:	fae689e3          	beq	a3,a4,7ac <free+0x26>
  } else
    p->s.ptr = bp;
 7fe:	e394                	sd	a3,0(a5)
  freep = p;
 800:	00000717          	auipc	a4,0x0
 804:	16f73023          	sd	a5,352(a4) # 960 <freep>
}
 808:	6422                	ld	s0,8(sp)
 80a:	0141                	addi	sp,sp,16
 80c:	8082                	ret

000000000000080e <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 80e:	7139                	addi	sp,sp,-64
 810:	fc06                	sd	ra,56(sp)
 812:	f822                	sd	s0,48(sp)
 814:	f426                	sd	s1,40(sp)
 816:	f04a                	sd	s2,32(sp)
 818:	ec4e                	sd	s3,24(sp)
 81a:	e852                	sd	s4,16(sp)
 81c:	e456                	sd	s5,8(sp)
 81e:	e05a                	sd	s6,0(sp)
 820:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 822:	02051493          	slli	s1,a0,0x20
 826:	9081                	srli	s1,s1,0x20
 828:	04bd                	addi	s1,s1,15
 82a:	8091                	srli	s1,s1,0x4
 82c:	0014899b          	addiw	s3,s1,1
 830:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 832:	00000517          	auipc	a0,0x0
 836:	12e53503          	ld	a0,302(a0) # 960 <freep>
 83a:	c515                	beqz	a0,866 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 83c:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 83e:	4798                	lw	a4,8(a5)
 840:	02977f63          	bgeu	a4,s1,87e <malloc+0x70>
 844:	8a4e                	mv	s4,s3
 846:	0009871b          	sext.w	a4,s3
 84a:	6685                	lui	a3,0x1
 84c:	00d77363          	bgeu	a4,a3,852 <malloc+0x44>
 850:	6a05                	lui	s4,0x1
 852:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 856:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 85a:	00000917          	auipc	s2,0x0
 85e:	10690913          	addi	s2,s2,262 # 960 <freep>
  if(p == (char*)-1)
 862:	5afd                	li	s5,-1
 864:	a88d                	j	8d6 <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 866:	00000797          	auipc	a5,0x0
 86a:	16a78793          	addi	a5,a5,362 # 9d0 <base>
 86e:	00000717          	auipc	a4,0x0
 872:	0ef73923          	sd	a5,242(a4) # 960 <freep>
 876:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 878:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 87c:	b7e1                	j	844 <malloc+0x36>
      if(p->s.size == nunits)
 87e:	02e48b63          	beq	s1,a4,8b4 <malloc+0xa6>
        p->s.size -= nunits;
 882:	4137073b          	subw	a4,a4,s3
 886:	c798                	sw	a4,8(a5)
        p += p->s.size;
 888:	1702                	slli	a4,a4,0x20
 88a:	9301                	srli	a4,a4,0x20
 88c:	0712                	slli	a4,a4,0x4
 88e:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 890:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 894:	00000717          	auipc	a4,0x0
 898:	0ca73623          	sd	a0,204(a4) # 960 <freep>
      return (void*)(p + 1);
 89c:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8a0:	70e2                	ld	ra,56(sp)
 8a2:	7442                	ld	s0,48(sp)
 8a4:	74a2                	ld	s1,40(sp)
 8a6:	7902                	ld	s2,32(sp)
 8a8:	69e2                	ld	s3,24(sp)
 8aa:	6a42                	ld	s4,16(sp)
 8ac:	6aa2                	ld	s5,8(sp)
 8ae:	6b02                	ld	s6,0(sp)
 8b0:	6121                	addi	sp,sp,64
 8b2:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 8b4:	6398                	ld	a4,0(a5)
 8b6:	e118                	sd	a4,0(a0)
 8b8:	bff1                	j	894 <malloc+0x86>
  hp->s.size = nu;
 8ba:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 8be:	0541                	addi	a0,a0,16
 8c0:	00000097          	auipc	ra,0x0
 8c4:	ec6080e7          	jalr	-314(ra) # 786 <free>
  return freep;
 8c8:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 8cc:	d971                	beqz	a0,8a0 <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8ce:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 8d0:	4798                	lw	a4,8(a5)
 8d2:	fa9776e3          	bgeu	a4,s1,87e <malloc+0x70>
    if(p == freep)
 8d6:	00093703          	ld	a4,0(s2)
 8da:	853e                	mv	a0,a5
 8dc:	fef719e3          	bne	a4,a5,8ce <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 8e0:	8552                	mv	a0,s4
 8e2:	00000097          	auipc	ra,0x0
 8e6:	aa6080e7          	jalr	-1370(ra) # 388 <sbrk>
  if(p == (char*)-1)
 8ea:	fd5518e3          	bne	a0,s5,8ba <malloc+0xac>
        return 0;
 8ee:	4501                	li	a0,0
 8f0:	bf45                	j	8a0 <malloc+0x92>
