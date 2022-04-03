
user/_strace:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/include/stat.h"
#include "xv6-user/user.h"

int
main(int argc, char *argv[])
{
   0:	712d                	addi	sp,sp,-288
   2:	ee06                	sd	ra,280(sp)
   4:	ea22                	sd	s0,272(sp)
   6:	e626                	sd	s1,264(sp)
   8:	e24a                	sd	s2,256(sp)
   a:	1200                	addi	s0,sp,288
   c:	892e                	mv	s2,a1
  int i;
  char *nargv[MAXARG];

  if(argc < 3 /*|| (argv[1][0] < '0' || argv[1][0] > '9')*/){
   e:	4789                	li	a5,2
  10:	02a7c163          	blt	a5,a0,32 <main+0x32>
    fprintf(2, "usage: %s MASK COMMAND\n", argv[0]);
  14:	6190                	ld	a2,0(a1)
  16:	00001597          	auipc	a1,0x1
  1a:	8aa58593          	addi	a1,a1,-1878 # 8c0 <malloc+0xe8>
  1e:	4509                	li	a0,2
  20:	00000097          	auipc	ra,0x0
  24:	6cc080e7          	jalr	1740(ra) # 6ec <fprintf>
    exit(1);
  28:	4505                	li	a0,1
  2a:	00000097          	auipc	ra,0x0
  2e:	350080e7          	jalr	848(ra) # 37a <exit>
  32:	84aa                	mv	s1,a0
  }

  if (trace(atoi(argv[1])) < 0) {
  34:	6588                	ld	a0,8(a1)
  36:	00000097          	auipc	ra,0x0
  3a:	22e080e7          	jalr	558(ra) # 264 <atoi>
  3e:	00000097          	auipc	ra,0x0
  42:	3ec080e7          	jalr	1004(ra) # 42a <trace>
  46:	04054d63          	bltz	a0,a0 <main+0xa0>
  4a:	01090793          	addi	a5,s2,16
  4e:	ee040713          	addi	a4,s0,-288
  52:	ffd4869b          	addiw	a3,s1,-3
  56:	1682                	slli	a3,a3,0x20
  58:	9281                	srli	a3,a3,0x20
  5a:	068e                	slli	a3,a3,0x3
  5c:	96be                	add	a3,a3,a5
  5e:	10090593          	addi	a1,s2,256
    fprintf(2, "%s: strace failed\n", argv[0]);
    exit(1);
  }
  
  for(i = 2; i < argc && i < MAXARG; i++){
    nargv[i-2] = argv[i];
  62:	6390                	ld	a2,0(a5)
  64:	e310                	sd	a2,0(a4)
  for(i = 2; i < argc && i < MAXARG; i++){
  66:	00d78663          	beq	a5,a3,72 <main+0x72>
  6a:	07a1                	addi	a5,a5,8
  6c:	0721                	addi	a4,a4,8
  6e:	feb79ae3          	bne	a5,a1,62 <main+0x62>
  }
  exec(nargv[0], nargv);  
  72:	ee040593          	addi	a1,s0,-288
  76:	ee043503          	ld	a0,-288(s0)
  7a:	00000097          	auipc	ra,0x0
  7e:	338080e7          	jalr	824(ra) # 3b2 <exec>
  printf("strace: exec %s fail\n", nargv[0]);
  82:	ee043583          	ld	a1,-288(s0)
  86:	00001517          	auipc	a0,0x1
  8a:	86a50513          	addi	a0,a0,-1942 # 8f0 <malloc+0x118>
  8e:	00000097          	auipc	ra,0x0
  92:	68c080e7          	jalr	1676(ra) # 71a <printf>
  exit(0);
  96:	4501                	li	a0,0
  98:	00000097          	auipc	ra,0x0
  9c:	2e2080e7          	jalr	738(ra) # 37a <exit>
    fprintf(2, "%s: strace failed\n", argv[0]);
  a0:	00093603          	ld	a2,0(s2)
  a4:	00001597          	auipc	a1,0x1
  a8:	83458593          	addi	a1,a1,-1996 # 8d8 <malloc+0x100>
  ac:	4509                	li	a0,2
  ae:	00000097          	auipc	ra,0x0
  b2:	63e080e7          	jalr	1598(ra) # 6ec <fprintf>
    exit(1);
  b6:	4505                	li	a0,1
  b8:	00000097          	auipc	ra,0x0
  bc:	2c2080e7          	jalr	706(ra) # 37a <exit>

00000000000000c0 <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
  c0:	1141                	addi	sp,sp,-16
  c2:	e422                	sd	s0,8(sp)
  c4:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  c6:	87aa                	mv	a5,a0
  c8:	0585                	addi	a1,a1,1
  ca:	0785                	addi	a5,a5,1
  cc:	fff5c703          	lbu	a4,-1(a1)
  d0:	fee78fa3          	sb	a4,-1(a5)
  d4:	fb75                	bnez	a4,c8 <strcpy+0x8>
    ;
  return os;
}
  d6:	6422                	ld	s0,8(sp)
  d8:	0141                	addi	sp,sp,16
  da:	8082                	ret

00000000000000dc <strcat>:

char*
strcat(char *s, const char *t)
{
  dc:	1141                	addi	sp,sp,-16
  de:	e422                	sd	s0,8(sp)
  e0:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
  e2:	00054783          	lbu	a5,0(a0)
  e6:	c385                	beqz	a5,106 <strcat+0x2a>
  e8:	87aa                	mv	a5,a0
    s++;
  ea:	0785                	addi	a5,a5,1
  while(*s)
  ec:	0007c703          	lbu	a4,0(a5)
  f0:	ff6d                	bnez	a4,ea <strcat+0xe>
  while((*s++ = *t++))
  f2:	0585                	addi	a1,a1,1
  f4:	0785                	addi	a5,a5,1
  f6:	fff5c703          	lbu	a4,-1(a1)
  fa:	fee78fa3          	sb	a4,-1(a5)
  fe:	fb75                	bnez	a4,f2 <strcat+0x16>
    ;
  return os;
}
 100:	6422                	ld	s0,8(sp)
 102:	0141                	addi	sp,sp,16
 104:	8082                	ret
  while(*s)
 106:	87aa                	mv	a5,a0
 108:	b7ed                	j	f2 <strcat+0x16>

000000000000010a <strcmp>:


int
strcmp(const char *p, const char *q)
{
 10a:	1141                	addi	sp,sp,-16
 10c:	e422                	sd	s0,8(sp)
 10e:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 110:	00054783          	lbu	a5,0(a0)
 114:	cb91                	beqz	a5,128 <strcmp+0x1e>
 116:	0005c703          	lbu	a4,0(a1)
 11a:	00f71763          	bne	a4,a5,128 <strcmp+0x1e>
    p++, q++;
 11e:	0505                	addi	a0,a0,1
 120:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 122:	00054783          	lbu	a5,0(a0)
 126:	fbe5                	bnez	a5,116 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 128:	0005c503          	lbu	a0,0(a1)
}
 12c:	40a7853b          	subw	a0,a5,a0
 130:	6422                	ld	s0,8(sp)
 132:	0141                	addi	sp,sp,16
 134:	8082                	ret

0000000000000136 <strlen>:

uint
strlen(const char *s)
{
 136:	1141                	addi	sp,sp,-16
 138:	e422                	sd	s0,8(sp)
 13a:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 13c:	00054783          	lbu	a5,0(a0)
 140:	cf91                	beqz	a5,15c <strlen+0x26>
 142:	0505                	addi	a0,a0,1
 144:	87aa                	mv	a5,a0
 146:	4685                	li	a3,1
 148:	9e89                	subw	a3,a3,a0
 14a:	00f6853b          	addw	a0,a3,a5
 14e:	0785                	addi	a5,a5,1
 150:	fff7c703          	lbu	a4,-1(a5)
 154:	fb7d                	bnez	a4,14a <strlen+0x14>
    ;
  return n;
}
 156:	6422                	ld	s0,8(sp)
 158:	0141                	addi	sp,sp,16
 15a:	8082                	ret
  for(n = 0; s[n]; n++)
 15c:	4501                	li	a0,0
 15e:	bfe5                	j	156 <strlen+0x20>

0000000000000160 <memset>:

void*
memset(void *dst, int c, uint n)
{
 160:	1141                	addi	sp,sp,-16
 162:	e422                	sd	s0,8(sp)
 164:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 166:	ce09                	beqz	a2,180 <memset+0x20>
 168:	87aa                	mv	a5,a0
 16a:	fff6071b          	addiw	a4,a2,-1
 16e:	1702                	slli	a4,a4,0x20
 170:	9301                	srli	a4,a4,0x20
 172:	0705                	addi	a4,a4,1
 174:	972a                	add	a4,a4,a0
    cdst[i] = c;
 176:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 17a:	0785                	addi	a5,a5,1
 17c:	fee79de3          	bne	a5,a4,176 <memset+0x16>
  }
  return dst;
}
 180:	6422                	ld	s0,8(sp)
 182:	0141                	addi	sp,sp,16
 184:	8082                	ret

0000000000000186 <strchr>:

char*
strchr(const char *s, char c)
{
 186:	1141                	addi	sp,sp,-16
 188:	e422                	sd	s0,8(sp)
 18a:	0800                	addi	s0,sp,16
  for(; *s; s++)
 18c:	00054783          	lbu	a5,0(a0)
 190:	cb99                	beqz	a5,1a6 <strchr+0x20>
    if(*s == c)
 192:	00f58763          	beq	a1,a5,1a0 <strchr+0x1a>
  for(; *s; s++)
 196:	0505                	addi	a0,a0,1
 198:	00054783          	lbu	a5,0(a0)
 19c:	fbfd                	bnez	a5,192 <strchr+0xc>
      return (char*)s;
  return 0;
 19e:	4501                	li	a0,0
}
 1a0:	6422                	ld	s0,8(sp)
 1a2:	0141                	addi	sp,sp,16
 1a4:	8082                	ret
  return 0;
 1a6:	4501                	li	a0,0
 1a8:	bfe5                	j	1a0 <strchr+0x1a>

00000000000001aa <gets>:

char*
gets(char *buf, int max)
{
 1aa:	711d                	addi	sp,sp,-96
 1ac:	ec86                	sd	ra,88(sp)
 1ae:	e8a2                	sd	s0,80(sp)
 1b0:	e4a6                	sd	s1,72(sp)
 1b2:	e0ca                	sd	s2,64(sp)
 1b4:	fc4e                	sd	s3,56(sp)
 1b6:	f852                	sd	s4,48(sp)
 1b8:	f456                	sd	s5,40(sp)
 1ba:	f05a                	sd	s6,32(sp)
 1bc:	ec5e                	sd	s7,24(sp)
 1be:	1080                	addi	s0,sp,96
 1c0:	8baa                	mv	s7,a0
 1c2:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1c4:	892a                	mv	s2,a0
 1c6:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 1c8:	4aa9                	li	s5,10
 1ca:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 1cc:	89a6                	mv	s3,s1
 1ce:	2485                	addiw	s1,s1,1
 1d0:	0344d863          	bge	s1,s4,200 <gets+0x56>
    cc = read(0, &c, 1);
 1d4:	4605                	li	a2,1
 1d6:	faf40593          	addi	a1,s0,-81
 1da:	4501                	li	a0,0
 1dc:	00000097          	auipc	ra,0x0
 1e0:	1b6080e7          	jalr	438(ra) # 392 <read>
    if(cc < 1)
 1e4:	00a05e63          	blez	a0,200 <gets+0x56>
    buf[i++] = c;
 1e8:	faf44783          	lbu	a5,-81(s0)
 1ec:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 1f0:	01578763          	beq	a5,s5,1fe <gets+0x54>
 1f4:	0905                	addi	s2,s2,1
 1f6:	fd679be3          	bne	a5,s6,1cc <gets+0x22>
  for(i=0; i+1 < max; ){
 1fa:	89a6                	mv	s3,s1
 1fc:	a011                	j	200 <gets+0x56>
 1fe:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 200:	99de                	add	s3,s3,s7
 202:	00098023          	sb	zero,0(s3)
  return buf;
}
 206:	855e                	mv	a0,s7
 208:	60e6                	ld	ra,88(sp)
 20a:	6446                	ld	s0,80(sp)
 20c:	64a6                	ld	s1,72(sp)
 20e:	6906                	ld	s2,64(sp)
 210:	79e2                	ld	s3,56(sp)
 212:	7a42                	ld	s4,48(sp)
 214:	7aa2                	ld	s5,40(sp)
 216:	7b02                	ld	s6,32(sp)
 218:	6be2                	ld	s7,24(sp)
 21a:	6125                	addi	sp,sp,96
 21c:	8082                	ret

000000000000021e <stat>:

int
stat(const char *n, struct stat *st)
{
 21e:	1101                	addi	sp,sp,-32
 220:	ec06                	sd	ra,24(sp)
 222:	e822                	sd	s0,16(sp)
 224:	e426                	sd	s1,8(sp)
 226:	e04a                	sd	s2,0(sp)
 228:	1000                	addi	s0,sp,32
 22a:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 22c:	4581                	li	a1,0
 22e:	00000097          	auipc	ra,0x0
 232:	18c080e7          	jalr	396(ra) # 3ba <open>
  if(fd < 0)
 236:	02054563          	bltz	a0,260 <stat+0x42>
 23a:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 23c:	85ca                	mv	a1,s2
 23e:	00000097          	auipc	ra,0x0
 242:	184080e7          	jalr	388(ra) # 3c2 <fstat>
 246:	892a                	mv	s2,a0
  close(fd);
 248:	8526                	mv	a0,s1
 24a:	00000097          	auipc	ra,0x0
 24e:	158080e7          	jalr	344(ra) # 3a2 <close>
  return r;
}
 252:	854a                	mv	a0,s2
 254:	60e2                	ld	ra,24(sp)
 256:	6442                	ld	s0,16(sp)
 258:	64a2                	ld	s1,8(sp)
 25a:	6902                	ld	s2,0(sp)
 25c:	6105                	addi	sp,sp,32
 25e:	8082                	ret
    return -1;
 260:	597d                	li	s2,-1
 262:	bfc5                	j	252 <stat+0x34>

0000000000000264 <atoi>:

int
atoi(const char *s)
{
 264:	1141                	addi	sp,sp,-16
 266:	e422                	sd	s0,8(sp)
 268:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 26a:	00054703          	lbu	a4,0(a0)
 26e:	02d00793          	li	a5,45
  int neg = 1;
 272:	4805                	li	a6,1
  if (*s == '-') {
 274:	04f70363          	beq	a4,a5,2ba <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 278:	00054683          	lbu	a3,0(a0)
 27c:	fd06879b          	addiw	a5,a3,-48
 280:	0ff7f793          	andi	a5,a5,255
 284:	4725                	li	a4,9
 286:	02f76d63          	bltu	a4,a5,2c0 <atoi+0x5c>
  n = 0;
 28a:	4601                	li	a2,0
  while('0' <= *s && *s <= '9')
 28c:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 28e:	0505                	addi	a0,a0,1
 290:	0026179b          	slliw	a5,a2,0x2
 294:	9fb1                	addw	a5,a5,a2
 296:	0017979b          	slliw	a5,a5,0x1
 29a:	9fb5                	addw	a5,a5,a3
 29c:	fd07861b          	addiw	a2,a5,-48
  while('0' <= *s && *s <= '9')
 2a0:	00054683          	lbu	a3,0(a0)
 2a4:	fd06871b          	addiw	a4,a3,-48
 2a8:	0ff77713          	andi	a4,a4,255
 2ac:	fee5f1e3          	bgeu	a1,a4,28e <atoi+0x2a>
  return n * neg;
}
 2b0:	02c8053b          	mulw	a0,a6,a2
 2b4:	6422                	ld	s0,8(sp)
 2b6:	0141                	addi	sp,sp,16
 2b8:	8082                	ret
    s++;
 2ba:	0505                	addi	a0,a0,1
    neg = -1;
 2bc:	587d                	li	a6,-1
 2be:	bf6d                	j	278 <atoi+0x14>
  n = 0;
 2c0:	4601                	li	a2,0
 2c2:	b7fd                	j	2b0 <atoi+0x4c>

00000000000002c4 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2c4:	1141                	addi	sp,sp,-16
 2c6:	e422                	sd	s0,8(sp)
 2c8:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 2ca:	02b57663          	bgeu	a0,a1,2f6 <memmove+0x32>
    while(n-- > 0)
 2ce:	02c05163          	blez	a2,2f0 <memmove+0x2c>
 2d2:	fff6079b          	addiw	a5,a2,-1
 2d6:	1782                	slli	a5,a5,0x20
 2d8:	9381                	srli	a5,a5,0x20
 2da:	0785                	addi	a5,a5,1
 2dc:	97aa                	add	a5,a5,a0
  dst = vdst;
 2de:	872a                	mv	a4,a0
      *dst++ = *src++;
 2e0:	0585                	addi	a1,a1,1
 2e2:	0705                	addi	a4,a4,1
 2e4:	fff5c683          	lbu	a3,-1(a1)
 2e8:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 2ec:	fee79ae3          	bne	a5,a4,2e0 <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 2f0:	6422                	ld	s0,8(sp)
 2f2:	0141                	addi	sp,sp,16
 2f4:	8082                	ret
    dst += n;
 2f6:	00c50733          	add	a4,a0,a2
    src += n;
 2fa:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 2fc:	fec05ae3          	blez	a2,2f0 <memmove+0x2c>
 300:	fff6079b          	addiw	a5,a2,-1
 304:	1782                	slli	a5,a5,0x20
 306:	9381                	srli	a5,a5,0x20
 308:	fff7c793          	not	a5,a5
 30c:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 30e:	15fd                	addi	a1,a1,-1
 310:	177d                	addi	a4,a4,-1
 312:	0005c683          	lbu	a3,0(a1)
 316:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 31a:	fee79ae3          	bne	a5,a4,30e <memmove+0x4a>
 31e:	bfc9                	j	2f0 <memmove+0x2c>

0000000000000320 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 320:	1141                	addi	sp,sp,-16
 322:	e422                	sd	s0,8(sp)
 324:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 326:	ca05                	beqz	a2,356 <memcmp+0x36>
 328:	fff6069b          	addiw	a3,a2,-1
 32c:	1682                	slli	a3,a3,0x20
 32e:	9281                	srli	a3,a3,0x20
 330:	0685                	addi	a3,a3,1
 332:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 334:	00054783          	lbu	a5,0(a0)
 338:	0005c703          	lbu	a4,0(a1)
 33c:	00e79863          	bne	a5,a4,34c <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 340:	0505                	addi	a0,a0,1
    p2++;
 342:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 344:	fed518e3          	bne	a0,a3,334 <memcmp+0x14>
  }
  return 0;
 348:	4501                	li	a0,0
 34a:	a019                	j	350 <memcmp+0x30>
      return *p1 - *p2;
 34c:	40e7853b          	subw	a0,a5,a4
}
 350:	6422                	ld	s0,8(sp)
 352:	0141                	addi	sp,sp,16
 354:	8082                	ret
  return 0;
 356:	4501                	li	a0,0
 358:	bfe5                	j	350 <memcmp+0x30>

000000000000035a <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 35a:	1141                	addi	sp,sp,-16
 35c:	e406                	sd	ra,8(sp)
 35e:	e022                	sd	s0,0(sp)
 360:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 362:	00000097          	auipc	ra,0x0
 366:	f62080e7          	jalr	-158(ra) # 2c4 <memmove>
}
 36a:	60a2                	ld	ra,8(sp)
 36c:	6402                	ld	s0,0(sp)
 36e:	0141                	addi	sp,sp,16
 370:	8082                	ret

0000000000000372 <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 372:	4885                	li	a7,1
 ecall
 374:	00000073          	ecall
 ret
 378:	8082                	ret

000000000000037a <exit>:
.global exit
exit:
 li a7, SYS_exit
 37a:	4889                	li	a7,2
 ecall
 37c:	00000073          	ecall
 ret
 380:	8082                	ret

0000000000000382 <wait>:
.global wait
wait:
 li a7, SYS_wait
 382:	488d                	li	a7,3
 ecall
 384:	00000073          	ecall
 ret
 388:	8082                	ret

000000000000038a <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 38a:	4891                	li	a7,4
 ecall
 38c:	00000073          	ecall
 ret
 390:	8082                	ret

0000000000000392 <read>:
.global read
read:
 li a7, SYS_read
 392:	4895                	li	a7,5
 ecall
 394:	00000073          	ecall
 ret
 398:	8082                	ret

000000000000039a <write>:
.global write
write:
 li a7, SYS_write
 39a:	48c1                	li	a7,16
 ecall
 39c:	00000073          	ecall
 ret
 3a0:	8082                	ret

00000000000003a2 <close>:
.global close
close:
 li a7, SYS_close
 3a2:	48d5                	li	a7,21
 ecall
 3a4:	00000073          	ecall
 ret
 3a8:	8082                	ret

00000000000003aa <kill>:
.global kill
kill:
 li a7, SYS_kill
 3aa:	4899                	li	a7,6
 ecall
 3ac:	00000073          	ecall
 ret
 3b0:	8082                	ret

00000000000003b2 <exec>:
.global exec
exec:
 li a7, SYS_exec
 3b2:	489d                	li	a7,7
 ecall
 3b4:	00000073          	ecall
 ret
 3b8:	8082                	ret

00000000000003ba <open>:
.global open
open:
 li a7, SYS_open
 3ba:	48bd                	li	a7,15
 ecall
 3bc:	00000073          	ecall
 ret
 3c0:	8082                	ret

00000000000003c2 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 3c2:	48a1                	li	a7,8
 ecall
 3c4:	00000073          	ecall
 ret
 3c8:	8082                	ret

00000000000003ca <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 3ca:	48d1                	li	a7,20
 ecall
 3cc:	00000073          	ecall
 ret
 3d0:	8082                	ret

00000000000003d2 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 3d2:	48a5                	li	a7,9
 ecall
 3d4:	00000073          	ecall
 ret
 3d8:	8082                	ret

00000000000003da <dup>:
.global dup
dup:
 li a7, SYS_dup
 3da:	48a9                	li	a7,10
 ecall
 3dc:	00000073          	ecall
 ret
 3e0:	8082                	ret

00000000000003e2 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 3e2:	48ad                	li	a7,11
 ecall
 3e4:	00000073          	ecall
 ret
 3e8:	8082                	ret

00000000000003ea <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 3ea:	48b1                	li	a7,12
 ecall
 3ec:	00000073          	ecall
 ret
 3f0:	8082                	ret

00000000000003f2 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 3f2:	48b5                	li	a7,13
 ecall
 3f4:	00000073          	ecall
 ret
 3f8:	8082                	ret

00000000000003fa <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 3fa:	48b9                	li	a7,14
 ecall
 3fc:	00000073          	ecall
 ret
 400:	8082                	ret

0000000000000402 <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 402:	48d9                	li	a7,22
 ecall
 404:	00000073          	ecall
 ret
 408:	8082                	ret

000000000000040a <dev>:
.global dev
dev:
 li a7, SYS_dev
 40a:	48dd                	li	a7,23
 ecall
 40c:	00000073          	ecall
 ret
 410:	8082                	ret

0000000000000412 <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 412:	48e1                	li	a7,24
 ecall
 414:	00000073          	ecall
 ret
 418:	8082                	ret

000000000000041a <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 41a:	48e5                	li	a7,25
 ecall
 41c:	00000073          	ecall
 ret
 420:	8082                	ret

0000000000000422 <remove>:
.global remove
remove:
 li a7, SYS_remove
 422:	48c5                	li	a7,17
 ecall
 424:	00000073          	ecall
 ret
 428:	8082                	ret

000000000000042a <trace>:
.global trace
trace:
 li a7, SYS_trace
 42a:	48c9                	li	a7,18
 ecall
 42c:	00000073          	ecall
 ret
 430:	8082                	ret

0000000000000432 <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 432:	48cd                	li	a7,19
 ecall
 434:	00000073          	ecall
 ret
 438:	8082                	ret

000000000000043a <rename>:
.global rename
rename:
 li a7, SYS_rename
 43a:	48e9                	li	a7,26
 ecall
 43c:	00000073          	ecall
 ret
 440:	8082                	ret

0000000000000442 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 442:	1101                	addi	sp,sp,-32
 444:	ec06                	sd	ra,24(sp)
 446:	e822                	sd	s0,16(sp)
 448:	1000                	addi	s0,sp,32
 44a:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 44e:	4605                	li	a2,1
 450:	fef40593          	addi	a1,s0,-17
 454:	00000097          	auipc	ra,0x0
 458:	f46080e7          	jalr	-186(ra) # 39a <write>
}
 45c:	60e2                	ld	ra,24(sp)
 45e:	6442                	ld	s0,16(sp)
 460:	6105                	addi	sp,sp,32
 462:	8082                	ret

0000000000000464 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 464:	7139                	addi	sp,sp,-64
 466:	fc06                	sd	ra,56(sp)
 468:	f822                	sd	s0,48(sp)
 46a:	f426                	sd	s1,40(sp)
 46c:	f04a                	sd	s2,32(sp)
 46e:	ec4e                	sd	s3,24(sp)
 470:	0080                	addi	s0,sp,64
 472:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 474:	c299                	beqz	a3,47a <printint+0x16>
 476:	0805c863          	bltz	a1,506 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 47a:	2581                	sext.w	a1,a1
  neg = 0;
 47c:	4881                	li	a7,0
 47e:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 482:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 484:	2601                	sext.w	a2,a2
 486:	00000517          	auipc	a0,0x0
 48a:	48a50513          	addi	a0,a0,1162 # 910 <digits>
 48e:	883a                	mv	a6,a4
 490:	2705                	addiw	a4,a4,1
 492:	02c5f7bb          	remuw	a5,a1,a2
 496:	1782                	slli	a5,a5,0x20
 498:	9381                	srli	a5,a5,0x20
 49a:	97aa                	add	a5,a5,a0
 49c:	0007c783          	lbu	a5,0(a5)
 4a0:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 4a4:	0005879b          	sext.w	a5,a1
 4a8:	02c5d5bb          	divuw	a1,a1,a2
 4ac:	0685                	addi	a3,a3,1
 4ae:	fec7f0e3          	bgeu	a5,a2,48e <printint+0x2a>
  if(neg)
 4b2:	00088b63          	beqz	a7,4c8 <printint+0x64>
    buf[i++] = '-';
 4b6:	fd040793          	addi	a5,s0,-48
 4ba:	973e                	add	a4,a4,a5
 4bc:	02d00793          	li	a5,45
 4c0:	fef70823          	sb	a5,-16(a4)
 4c4:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 4c8:	02e05863          	blez	a4,4f8 <printint+0x94>
 4cc:	fc040793          	addi	a5,s0,-64
 4d0:	00e78933          	add	s2,a5,a4
 4d4:	fff78993          	addi	s3,a5,-1
 4d8:	99ba                	add	s3,s3,a4
 4da:	377d                	addiw	a4,a4,-1
 4dc:	1702                	slli	a4,a4,0x20
 4de:	9301                	srli	a4,a4,0x20
 4e0:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 4e4:	fff94583          	lbu	a1,-1(s2)
 4e8:	8526                	mv	a0,s1
 4ea:	00000097          	auipc	ra,0x0
 4ee:	f58080e7          	jalr	-168(ra) # 442 <putc>
  while(--i >= 0)
 4f2:	197d                	addi	s2,s2,-1
 4f4:	ff3918e3          	bne	s2,s3,4e4 <printint+0x80>
}
 4f8:	70e2                	ld	ra,56(sp)
 4fa:	7442                	ld	s0,48(sp)
 4fc:	74a2                	ld	s1,40(sp)
 4fe:	7902                	ld	s2,32(sp)
 500:	69e2                	ld	s3,24(sp)
 502:	6121                	addi	sp,sp,64
 504:	8082                	ret
    x = -xx;
 506:	40b005bb          	negw	a1,a1
    neg = 1;
 50a:	4885                	li	a7,1
    x = -xx;
 50c:	bf8d                	j	47e <printint+0x1a>

000000000000050e <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 50e:	7119                	addi	sp,sp,-128
 510:	fc86                	sd	ra,120(sp)
 512:	f8a2                	sd	s0,112(sp)
 514:	f4a6                	sd	s1,104(sp)
 516:	f0ca                	sd	s2,96(sp)
 518:	ecce                	sd	s3,88(sp)
 51a:	e8d2                	sd	s4,80(sp)
 51c:	e4d6                	sd	s5,72(sp)
 51e:	e0da                	sd	s6,64(sp)
 520:	fc5e                	sd	s7,56(sp)
 522:	f862                	sd	s8,48(sp)
 524:	f466                	sd	s9,40(sp)
 526:	f06a                	sd	s10,32(sp)
 528:	ec6e                	sd	s11,24(sp)
 52a:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 52c:	0005c903          	lbu	s2,0(a1)
 530:	18090f63          	beqz	s2,6ce <vprintf+0x1c0>
 534:	8aaa                	mv	s5,a0
 536:	8b32                	mv	s6,a2
 538:	00158493          	addi	s1,a1,1
  state = 0;
 53c:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 53e:	02500a13          	li	s4,37
      if(c == 'd'){
 542:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 546:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 54a:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 54e:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 552:	00000b97          	auipc	s7,0x0
 556:	3beb8b93          	addi	s7,s7,958 # 910 <digits>
 55a:	a839                	j	578 <vprintf+0x6a>
        putc(fd, c);
 55c:	85ca                	mv	a1,s2
 55e:	8556                	mv	a0,s5
 560:	00000097          	auipc	ra,0x0
 564:	ee2080e7          	jalr	-286(ra) # 442 <putc>
 568:	a019                	j	56e <vprintf+0x60>
    } else if(state == '%'){
 56a:	01498f63          	beq	s3,s4,588 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 56e:	0485                	addi	s1,s1,1
 570:	fff4c903          	lbu	s2,-1(s1)
 574:	14090d63          	beqz	s2,6ce <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 578:	0009079b          	sext.w	a5,s2
    if(state == 0){
 57c:	fe0997e3          	bnez	s3,56a <vprintf+0x5c>
      if(c == '%'){
 580:	fd479ee3          	bne	a5,s4,55c <vprintf+0x4e>
        state = '%';
 584:	89be                	mv	s3,a5
 586:	b7e5                	j	56e <vprintf+0x60>
      if(c == 'd'){
 588:	05878063          	beq	a5,s8,5c8 <vprintf+0xba>
      } else if(c == 'l') {
 58c:	05978c63          	beq	a5,s9,5e4 <vprintf+0xd6>
      } else if(c == 'x') {
 590:	07a78863          	beq	a5,s10,600 <vprintf+0xf2>
      } else if(c == 'p') {
 594:	09b78463          	beq	a5,s11,61c <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 598:	07300713          	li	a4,115
 59c:	0ce78663          	beq	a5,a4,668 <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5a0:	06300713          	li	a4,99
 5a4:	0ee78e63          	beq	a5,a4,6a0 <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 5a8:	11478863          	beq	a5,s4,6b8 <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5ac:	85d2                	mv	a1,s4
 5ae:	8556                	mv	a0,s5
 5b0:	00000097          	auipc	ra,0x0
 5b4:	e92080e7          	jalr	-366(ra) # 442 <putc>
        putc(fd, c);
 5b8:	85ca                	mv	a1,s2
 5ba:	8556                	mv	a0,s5
 5bc:	00000097          	auipc	ra,0x0
 5c0:	e86080e7          	jalr	-378(ra) # 442 <putc>
      }
      state = 0;
 5c4:	4981                	li	s3,0
 5c6:	b765                	j	56e <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 5c8:	008b0913          	addi	s2,s6,8
 5cc:	4685                	li	a3,1
 5ce:	4629                	li	a2,10
 5d0:	000b2583          	lw	a1,0(s6)
 5d4:	8556                	mv	a0,s5
 5d6:	00000097          	auipc	ra,0x0
 5da:	e8e080e7          	jalr	-370(ra) # 464 <printint>
 5de:	8b4a                	mv	s6,s2
      state = 0;
 5e0:	4981                	li	s3,0
 5e2:	b771                	j	56e <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 5e4:	008b0913          	addi	s2,s6,8
 5e8:	4681                	li	a3,0
 5ea:	4629                	li	a2,10
 5ec:	000b2583          	lw	a1,0(s6)
 5f0:	8556                	mv	a0,s5
 5f2:	00000097          	auipc	ra,0x0
 5f6:	e72080e7          	jalr	-398(ra) # 464 <printint>
 5fa:	8b4a                	mv	s6,s2
      state = 0;
 5fc:	4981                	li	s3,0
 5fe:	bf85                	j	56e <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 600:	008b0913          	addi	s2,s6,8
 604:	4681                	li	a3,0
 606:	4641                	li	a2,16
 608:	000b2583          	lw	a1,0(s6)
 60c:	8556                	mv	a0,s5
 60e:	00000097          	auipc	ra,0x0
 612:	e56080e7          	jalr	-426(ra) # 464 <printint>
 616:	8b4a                	mv	s6,s2
      state = 0;
 618:	4981                	li	s3,0
 61a:	bf91                	j	56e <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 61c:	008b0793          	addi	a5,s6,8
 620:	f8f43423          	sd	a5,-120(s0)
 624:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 628:	03000593          	li	a1,48
 62c:	8556                	mv	a0,s5
 62e:	00000097          	auipc	ra,0x0
 632:	e14080e7          	jalr	-492(ra) # 442 <putc>
  putc(fd, 'x');
 636:	85ea                	mv	a1,s10
 638:	8556                	mv	a0,s5
 63a:	00000097          	auipc	ra,0x0
 63e:	e08080e7          	jalr	-504(ra) # 442 <putc>
 642:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 644:	03c9d793          	srli	a5,s3,0x3c
 648:	97de                	add	a5,a5,s7
 64a:	0007c583          	lbu	a1,0(a5)
 64e:	8556                	mv	a0,s5
 650:	00000097          	auipc	ra,0x0
 654:	df2080e7          	jalr	-526(ra) # 442 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 658:	0992                	slli	s3,s3,0x4
 65a:	397d                	addiw	s2,s2,-1
 65c:	fe0914e3          	bnez	s2,644 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 660:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 664:	4981                	li	s3,0
 666:	b721                	j	56e <vprintf+0x60>
        s = va_arg(ap, char*);
 668:	008b0993          	addi	s3,s6,8
 66c:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 670:	02090163          	beqz	s2,692 <vprintf+0x184>
        while(*s != 0){
 674:	00094583          	lbu	a1,0(s2)
 678:	c9a1                	beqz	a1,6c8 <vprintf+0x1ba>
          putc(fd, *s);
 67a:	8556                	mv	a0,s5
 67c:	00000097          	auipc	ra,0x0
 680:	dc6080e7          	jalr	-570(ra) # 442 <putc>
          s++;
 684:	0905                	addi	s2,s2,1
        while(*s != 0){
 686:	00094583          	lbu	a1,0(s2)
 68a:	f9e5                	bnez	a1,67a <vprintf+0x16c>
        s = va_arg(ap, char*);
 68c:	8b4e                	mv	s6,s3
      state = 0;
 68e:	4981                	li	s3,0
 690:	bdf9                	j	56e <vprintf+0x60>
          s = "(null)";
 692:	00000917          	auipc	s2,0x0
 696:	27690913          	addi	s2,s2,630 # 908 <malloc+0x130>
        while(*s != 0){
 69a:	02800593          	li	a1,40
 69e:	bff1                	j	67a <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 6a0:	008b0913          	addi	s2,s6,8
 6a4:	000b4583          	lbu	a1,0(s6)
 6a8:	8556                	mv	a0,s5
 6aa:	00000097          	auipc	ra,0x0
 6ae:	d98080e7          	jalr	-616(ra) # 442 <putc>
 6b2:	8b4a                	mv	s6,s2
      state = 0;
 6b4:	4981                	li	s3,0
 6b6:	bd65                	j	56e <vprintf+0x60>
        putc(fd, c);
 6b8:	85d2                	mv	a1,s4
 6ba:	8556                	mv	a0,s5
 6bc:	00000097          	auipc	ra,0x0
 6c0:	d86080e7          	jalr	-634(ra) # 442 <putc>
      state = 0;
 6c4:	4981                	li	s3,0
 6c6:	b565                	j	56e <vprintf+0x60>
        s = va_arg(ap, char*);
 6c8:	8b4e                	mv	s6,s3
      state = 0;
 6ca:	4981                	li	s3,0
 6cc:	b54d                	j	56e <vprintf+0x60>
    }
  }
}
 6ce:	70e6                	ld	ra,120(sp)
 6d0:	7446                	ld	s0,112(sp)
 6d2:	74a6                	ld	s1,104(sp)
 6d4:	7906                	ld	s2,96(sp)
 6d6:	69e6                	ld	s3,88(sp)
 6d8:	6a46                	ld	s4,80(sp)
 6da:	6aa6                	ld	s5,72(sp)
 6dc:	6b06                	ld	s6,64(sp)
 6de:	7be2                	ld	s7,56(sp)
 6e0:	7c42                	ld	s8,48(sp)
 6e2:	7ca2                	ld	s9,40(sp)
 6e4:	7d02                	ld	s10,32(sp)
 6e6:	6de2                	ld	s11,24(sp)
 6e8:	6109                	addi	sp,sp,128
 6ea:	8082                	ret

00000000000006ec <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 6ec:	715d                	addi	sp,sp,-80
 6ee:	ec06                	sd	ra,24(sp)
 6f0:	e822                	sd	s0,16(sp)
 6f2:	1000                	addi	s0,sp,32
 6f4:	e010                	sd	a2,0(s0)
 6f6:	e414                	sd	a3,8(s0)
 6f8:	e818                	sd	a4,16(s0)
 6fa:	ec1c                	sd	a5,24(s0)
 6fc:	03043023          	sd	a6,32(s0)
 700:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 704:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 708:	8622                	mv	a2,s0
 70a:	00000097          	auipc	ra,0x0
 70e:	e04080e7          	jalr	-508(ra) # 50e <vprintf>
}
 712:	60e2                	ld	ra,24(sp)
 714:	6442                	ld	s0,16(sp)
 716:	6161                	addi	sp,sp,80
 718:	8082                	ret

000000000000071a <printf>:

void
printf(const char *fmt, ...)
{
 71a:	711d                	addi	sp,sp,-96
 71c:	ec06                	sd	ra,24(sp)
 71e:	e822                	sd	s0,16(sp)
 720:	1000                	addi	s0,sp,32
 722:	e40c                	sd	a1,8(s0)
 724:	e810                	sd	a2,16(s0)
 726:	ec14                	sd	a3,24(s0)
 728:	f018                	sd	a4,32(s0)
 72a:	f41c                	sd	a5,40(s0)
 72c:	03043823          	sd	a6,48(s0)
 730:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 734:	00840613          	addi	a2,s0,8
 738:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 73c:	85aa                	mv	a1,a0
 73e:	4505                	li	a0,1
 740:	00000097          	auipc	ra,0x0
 744:	dce080e7          	jalr	-562(ra) # 50e <vprintf>
}
 748:	60e2                	ld	ra,24(sp)
 74a:	6442                	ld	s0,16(sp)
 74c:	6125                	addi	sp,sp,96
 74e:	8082                	ret

0000000000000750 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 750:	1141                	addi	sp,sp,-16
 752:	e422                	sd	s0,8(sp)
 754:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 756:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 75a:	00000797          	auipc	a5,0x0
 75e:	1ce7b783          	ld	a5,462(a5) # 928 <freep>
 762:	a805                	j	792 <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 764:	4618                	lw	a4,8(a2)
 766:	9db9                	addw	a1,a1,a4
 768:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 76c:	6398                	ld	a4,0(a5)
 76e:	6318                	ld	a4,0(a4)
 770:	fee53823          	sd	a4,-16(a0)
 774:	a091                	j	7b8 <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 776:	ff852703          	lw	a4,-8(a0)
 77a:	9e39                	addw	a2,a2,a4
 77c:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 77e:	ff053703          	ld	a4,-16(a0)
 782:	e398                	sd	a4,0(a5)
 784:	a099                	j	7ca <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 786:	6398                	ld	a4,0(a5)
 788:	00e7e463          	bltu	a5,a4,790 <free+0x40>
 78c:	00e6ea63          	bltu	a3,a4,7a0 <free+0x50>
{
 790:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 792:	fed7fae3          	bgeu	a5,a3,786 <free+0x36>
 796:	6398                	ld	a4,0(a5)
 798:	00e6e463          	bltu	a3,a4,7a0 <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 79c:	fee7eae3          	bltu	a5,a4,790 <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 7a0:	ff852583          	lw	a1,-8(a0)
 7a4:	6390                	ld	a2,0(a5)
 7a6:	02059713          	slli	a4,a1,0x20
 7aa:	9301                	srli	a4,a4,0x20
 7ac:	0712                	slli	a4,a4,0x4
 7ae:	9736                	add	a4,a4,a3
 7b0:	fae60ae3          	beq	a2,a4,764 <free+0x14>
    bp->s.ptr = p->s.ptr;
 7b4:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 7b8:	4790                	lw	a2,8(a5)
 7ba:	02061713          	slli	a4,a2,0x20
 7be:	9301                	srli	a4,a4,0x20
 7c0:	0712                	slli	a4,a4,0x4
 7c2:	973e                	add	a4,a4,a5
 7c4:	fae689e3          	beq	a3,a4,776 <free+0x26>
  } else
    p->s.ptr = bp;
 7c8:	e394                	sd	a3,0(a5)
  freep = p;
 7ca:	00000717          	auipc	a4,0x0
 7ce:	14f73f23          	sd	a5,350(a4) # 928 <freep>
}
 7d2:	6422                	ld	s0,8(sp)
 7d4:	0141                	addi	sp,sp,16
 7d6:	8082                	ret

00000000000007d8 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7d8:	7139                	addi	sp,sp,-64
 7da:	fc06                	sd	ra,56(sp)
 7dc:	f822                	sd	s0,48(sp)
 7de:	f426                	sd	s1,40(sp)
 7e0:	f04a                	sd	s2,32(sp)
 7e2:	ec4e                	sd	s3,24(sp)
 7e4:	e852                	sd	s4,16(sp)
 7e6:	e456                	sd	s5,8(sp)
 7e8:	e05a                	sd	s6,0(sp)
 7ea:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7ec:	02051493          	slli	s1,a0,0x20
 7f0:	9081                	srli	s1,s1,0x20
 7f2:	04bd                	addi	s1,s1,15
 7f4:	8091                	srli	s1,s1,0x4
 7f6:	0014899b          	addiw	s3,s1,1
 7fa:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 7fc:	00000517          	auipc	a0,0x0
 800:	12c53503          	ld	a0,300(a0) # 928 <freep>
 804:	c515                	beqz	a0,830 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 806:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 808:	4798                	lw	a4,8(a5)
 80a:	02977f63          	bgeu	a4,s1,848 <malloc+0x70>
 80e:	8a4e                	mv	s4,s3
 810:	0009871b          	sext.w	a4,s3
 814:	6685                	lui	a3,0x1
 816:	00d77363          	bgeu	a4,a3,81c <malloc+0x44>
 81a:	6a05                	lui	s4,0x1
 81c:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 820:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 824:	00000917          	auipc	s2,0x0
 828:	10490913          	addi	s2,s2,260 # 928 <freep>
  if(p == (char*)-1)
 82c:	5afd                	li	s5,-1
 82e:	a88d                	j	8a0 <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 830:	00000797          	auipc	a5,0x0
 834:	10078793          	addi	a5,a5,256 # 930 <base>
 838:	00000717          	auipc	a4,0x0
 83c:	0ef73823          	sd	a5,240(a4) # 928 <freep>
 840:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 842:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 846:	b7e1                	j	80e <malloc+0x36>
      if(p->s.size == nunits)
 848:	02e48b63          	beq	s1,a4,87e <malloc+0xa6>
        p->s.size -= nunits;
 84c:	4137073b          	subw	a4,a4,s3
 850:	c798                	sw	a4,8(a5)
        p += p->s.size;
 852:	1702                	slli	a4,a4,0x20
 854:	9301                	srli	a4,a4,0x20
 856:	0712                	slli	a4,a4,0x4
 858:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 85a:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 85e:	00000717          	auipc	a4,0x0
 862:	0ca73523          	sd	a0,202(a4) # 928 <freep>
      return (void*)(p + 1);
 866:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 86a:	70e2                	ld	ra,56(sp)
 86c:	7442                	ld	s0,48(sp)
 86e:	74a2                	ld	s1,40(sp)
 870:	7902                	ld	s2,32(sp)
 872:	69e2                	ld	s3,24(sp)
 874:	6a42                	ld	s4,16(sp)
 876:	6aa2                	ld	s5,8(sp)
 878:	6b02                	ld	s6,0(sp)
 87a:	6121                	addi	sp,sp,64
 87c:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 87e:	6398                	ld	a4,0(a5)
 880:	e118                	sd	a4,0(a0)
 882:	bff1                	j	85e <malloc+0x86>
  hp->s.size = nu;
 884:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 888:	0541                	addi	a0,a0,16
 88a:	00000097          	auipc	ra,0x0
 88e:	ec6080e7          	jalr	-314(ra) # 750 <free>
  return freep;
 892:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 896:	d971                	beqz	a0,86a <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 898:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 89a:	4798                	lw	a4,8(a5)
 89c:	fa9776e3          	bgeu	a4,s1,848 <malloc+0x70>
    if(p == freep)
 8a0:	00093703          	ld	a4,0(s2)
 8a4:	853e                	mv	a0,a5
 8a6:	fef719e3          	bne	a4,a5,898 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 8aa:	8552                	mv	a0,s4
 8ac:	00000097          	auipc	ra,0x0
 8b0:	b3e080e7          	jalr	-1218(ra) # 3ea <sbrk>
  if(p == (char*)-1)
 8b4:	fd5518e3          	bne	a0,s5,884 <malloc+0xac>
        return 0;
 8b8:	4501                	li	a0,0
 8ba:	bf45                	j	86a <malloc+0x92>
