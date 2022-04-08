
user/_init:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	1101                	addi	sp,sp,-32
   2:	ec06                	sd	ra,24(sp)
   4:	e822                	sd	s0,16(sp)
   6:	e426                	sd	s1,8(sp)
   8:	e04a                	sd	s2,0(sp)
   a:	1000                	addi	s0,sp,32

  // if(open("console", O_RDWR) < 0){
  //   mknod("console", CONSOLE, 0);
  //   open("console", O_RDWR);
  // }
  dev(O_RDWR, CONSOLE, 0);
   c:	4601                	li	a2,0
   e:	4585                	li	a1,1
  10:	4509                	li	a0,2
  12:	00000097          	auipc	ra,0x0
  16:	400080e7          	jalr	1024(ra) # 412 <dev>
  dup(0);  // stdout
  1a:	4501                	li	a0,0
  1c:	00000097          	auipc	ra,0x0
  20:	3c6080e7          	jalr	966(ra) # 3e2 <dup>
  dup(0);  // stderr
  24:	4501                	li	a0,0
  26:	00000097          	auipc	ra,0x0
  2a:	3bc080e7          	jalr	956(ra) # 3e2 <dup>

  for(;;){
    //exec("checkchar",argv);
    printf("init: starting sh\n");
  2e:	00001917          	auipc	s2,0x1
  32:	93290913          	addi	s2,s2,-1742 # 960 <malloc+0xe8>
  36:	854a                	mv	a0,s2
  38:	00000097          	auipc	ra,0x0
  3c:	75a080e7          	jalr	1882(ra) # 792 <printf>
    pid = fork();
  40:	00000097          	auipc	ra,0x0
  44:	33a080e7          	jalr	826(ra) # 37a <fork>
  48:	84aa                	mv	s1,a0
    if(pid < 0){
  4a:	02054963          	bltz	a0,7c <main+0x7c>
      printf("init: fork failed\n");
      exit(1);
    }
    if(pid == 0){
  4e:	c521                	beqz	a0,96 <main+0x96>
    }

    for(;;){
      // this call to wait() returns if the shell exits,
      // or if a parentless process exits.
      wpid = wait((int *) 0);
  50:	4501                	li	a0,0
  52:	00000097          	auipc	ra,0x0
  56:	338080e7          	jalr	824(ra) # 38a <wait>
      if(wpid == pid){
  5a:	fca48ee3          	beq	s1,a0,36 <main+0x36>
        // the shell exited; restart it.
        break;
      } else if(wpid < 0){
  5e:	fe0559e3          	bgez	a0,50 <main+0x50>
        printf("init: wait returned an error\n");
  62:	00001517          	auipc	a0,0x1
  66:	94e50513          	addi	a0,a0,-1714 # 9b0 <malloc+0x138>
  6a:	00000097          	auipc	ra,0x0
  6e:	728080e7          	jalr	1832(ra) # 792 <printf>
        exit(1);
  72:	4505                	li	a0,1
  74:	00000097          	auipc	ra,0x0
  78:	30e080e7          	jalr	782(ra) # 382 <exit>
      printf("init: fork failed\n");
  7c:	00001517          	auipc	a0,0x1
  80:	8fc50513          	addi	a0,a0,-1796 # 978 <malloc+0x100>
  84:	00000097          	auipc	ra,0x0
  88:	70e080e7          	jalr	1806(ra) # 792 <printf>
      exit(1);
  8c:	4505                	li	a0,1
  8e:	00000097          	auipc	ra,0x0
  92:	2f4080e7          	jalr	756(ra) # 382 <exit>
      exec("sh", argv);
  96:	00001597          	auipc	a1,0x1
  9a:	95a58593          	addi	a1,a1,-1702 # 9f0 <argv>
  9e:	00001517          	auipc	a0,0x1
  a2:	8f250513          	addi	a0,a0,-1806 # 990 <malloc+0x118>
  a6:	00000097          	auipc	ra,0x0
  aa:	314080e7          	jalr	788(ra) # 3ba <exec>
      printf("init: exec sh failed\n");
  ae:	00001517          	auipc	a0,0x1
  b2:	8ea50513          	addi	a0,a0,-1814 # 998 <malloc+0x120>
  b6:	00000097          	auipc	ra,0x0
  ba:	6dc080e7          	jalr	1756(ra) # 792 <printf>
      exit(1);
  be:	4505                	li	a0,1
  c0:	00000097          	auipc	ra,0x0
  c4:	2c2080e7          	jalr	706(ra) # 382 <exit>

00000000000000c8 <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
  c8:	1141                	addi	sp,sp,-16
  ca:	e422                	sd	s0,8(sp)
  cc:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  ce:	87aa                	mv	a5,a0
  d0:	0585                	addi	a1,a1,1
  d2:	0785                	addi	a5,a5,1
  d4:	fff5c703          	lbu	a4,-1(a1)
  d8:	fee78fa3          	sb	a4,-1(a5)
  dc:	fb75                	bnez	a4,d0 <strcpy+0x8>
    ;
  return os;
}
  de:	6422                	ld	s0,8(sp)
  e0:	0141                	addi	sp,sp,16
  e2:	8082                	ret

00000000000000e4 <strcat>:

char*
strcat(char *s, const char *t)
{
  e4:	1141                	addi	sp,sp,-16
  e6:	e422                	sd	s0,8(sp)
  e8:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
  ea:	00054783          	lbu	a5,0(a0)
  ee:	c385                	beqz	a5,10e <strcat+0x2a>
  f0:	87aa                	mv	a5,a0
    s++;
  f2:	0785                	addi	a5,a5,1
  while(*s)
  f4:	0007c703          	lbu	a4,0(a5)
  f8:	ff6d                	bnez	a4,f2 <strcat+0xe>
  while((*s++ = *t++))
  fa:	0585                	addi	a1,a1,1
  fc:	0785                	addi	a5,a5,1
  fe:	fff5c703          	lbu	a4,-1(a1)
 102:	fee78fa3          	sb	a4,-1(a5)
 106:	fb75                	bnez	a4,fa <strcat+0x16>
    ;
  return os;
}
 108:	6422                	ld	s0,8(sp)
 10a:	0141                	addi	sp,sp,16
 10c:	8082                	ret
  while(*s)
 10e:	87aa                	mv	a5,a0
 110:	b7ed                	j	fa <strcat+0x16>

0000000000000112 <strcmp>:


int
strcmp(const char *p, const char *q)
{
 112:	1141                	addi	sp,sp,-16
 114:	e422                	sd	s0,8(sp)
 116:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 118:	00054783          	lbu	a5,0(a0)
 11c:	cb91                	beqz	a5,130 <strcmp+0x1e>
 11e:	0005c703          	lbu	a4,0(a1)
 122:	00f71763          	bne	a4,a5,130 <strcmp+0x1e>
    p++, q++;
 126:	0505                	addi	a0,a0,1
 128:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 12a:	00054783          	lbu	a5,0(a0)
 12e:	fbe5                	bnez	a5,11e <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 130:	0005c503          	lbu	a0,0(a1)
}
 134:	40a7853b          	subw	a0,a5,a0
 138:	6422                	ld	s0,8(sp)
 13a:	0141                	addi	sp,sp,16
 13c:	8082                	ret

000000000000013e <strlen>:

uint
strlen(const char *s)
{
 13e:	1141                	addi	sp,sp,-16
 140:	e422                	sd	s0,8(sp)
 142:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 144:	00054783          	lbu	a5,0(a0)
 148:	cf91                	beqz	a5,164 <strlen+0x26>
 14a:	0505                	addi	a0,a0,1
 14c:	87aa                	mv	a5,a0
 14e:	4685                	li	a3,1
 150:	9e89                	subw	a3,a3,a0
 152:	00f6853b          	addw	a0,a3,a5
 156:	0785                	addi	a5,a5,1
 158:	fff7c703          	lbu	a4,-1(a5)
 15c:	fb7d                	bnez	a4,152 <strlen+0x14>
    ;
  return n;
}
 15e:	6422                	ld	s0,8(sp)
 160:	0141                	addi	sp,sp,16
 162:	8082                	ret
  for(n = 0; s[n]; n++)
 164:	4501                	li	a0,0
 166:	bfe5                	j	15e <strlen+0x20>

0000000000000168 <memset>:

void*
memset(void *dst, int c, uint n)
{
 168:	1141                	addi	sp,sp,-16
 16a:	e422                	sd	s0,8(sp)
 16c:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 16e:	ce09                	beqz	a2,188 <memset+0x20>
 170:	87aa                	mv	a5,a0
 172:	fff6071b          	addiw	a4,a2,-1
 176:	1702                	slli	a4,a4,0x20
 178:	9301                	srli	a4,a4,0x20
 17a:	0705                	addi	a4,a4,1
 17c:	972a                	add	a4,a4,a0
    cdst[i] = c;
 17e:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 182:	0785                	addi	a5,a5,1
 184:	fee79de3          	bne	a5,a4,17e <memset+0x16>
  }
  return dst;
}
 188:	6422                	ld	s0,8(sp)
 18a:	0141                	addi	sp,sp,16
 18c:	8082                	ret

000000000000018e <strchr>:

char*
strchr(const char *s, char c)
{
 18e:	1141                	addi	sp,sp,-16
 190:	e422                	sd	s0,8(sp)
 192:	0800                	addi	s0,sp,16
  for(; *s; s++)
 194:	00054783          	lbu	a5,0(a0)
 198:	cb99                	beqz	a5,1ae <strchr+0x20>
    if(*s == c)
 19a:	00f58763          	beq	a1,a5,1a8 <strchr+0x1a>
  for(; *s; s++)
 19e:	0505                	addi	a0,a0,1
 1a0:	00054783          	lbu	a5,0(a0)
 1a4:	fbfd                	bnez	a5,19a <strchr+0xc>
      return (char*)s;
  return 0;
 1a6:	4501                	li	a0,0
}
 1a8:	6422                	ld	s0,8(sp)
 1aa:	0141                	addi	sp,sp,16
 1ac:	8082                	ret
  return 0;
 1ae:	4501                	li	a0,0
 1b0:	bfe5                	j	1a8 <strchr+0x1a>

00000000000001b2 <gets>:

char*
gets(char *buf, int max)
{
 1b2:	711d                	addi	sp,sp,-96
 1b4:	ec86                	sd	ra,88(sp)
 1b6:	e8a2                	sd	s0,80(sp)
 1b8:	e4a6                	sd	s1,72(sp)
 1ba:	e0ca                	sd	s2,64(sp)
 1bc:	fc4e                	sd	s3,56(sp)
 1be:	f852                	sd	s4,48(sp)
 1c0:	f456                	sd	s5,40(sp)
 1c2:	f05a                	sd	s6,32(sp)
 1c4:	ec5e                	sd	s7,24(sp)
 1c6:	1080                	addi	s0,sp,96
 1c8:	8baa                	mv	s7,a0
 1ca:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1cc:	892a                	mv	s2,a0
 1ce:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 1d0:	4aa9                	li	s5,10
 1d2:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 1d4:	89a6                	mv	s3,s1
 1d6:	2485                	addiw	s1,s1,1
 1d8:	0344d863          	bge	s1,s4,208 <gets+0x56>
    cc = read(0, &c, 1);
 1dc:	4605                	li	a2,1
 1de:	faf40593          	addi	a1,s0,-81
 1e2:	4501                	li	a0,0
 1e4:	00000097          	auipc	ra,0x0
 1e8:	1b6080e7          	jalr	438(ra) # 39a <read>
    if(cc < 1)
 1ec:	00a05e63          	blez	a0,208 <gets+0x56>
    buf[i++] = c;
 1f0:	faf44783          	lbu	a5,-81(s0)
 1f4:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 1f8:	01578763          	beq	a5,s5,206 <gets+0x54>
 1fc:	0905                	addi	s2,s2,1
 1fe:	fd679be3          	bne	a5,s6,1d4 <gets+0x22>
  for(i=0; i+1 < max; ){
 202:	89a6                	mv	s3,s1
 204:	a011                	j	208 <gets+0x56>
 206:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 208:	99de                	add	s3,s3,s7
 20a:	00098023          	sb	zero,0(s3)
  return buf;
}
 20e:	855e                	mv	a0,s7
 210:	60e6                	ld	ra,88(sp)
 212:	6446                	ld	s0,80(sp)
 214:	64a6                	ld	s1,72(sp)
 216:	6906                	ld	s2,64(sp)
 218:	79e2                	ld	s3,56(sp)
 21a:	7a42                	ld	s4,48(sp)
 21c:	7aa2                	ld	s5,40(sp)
 21e:	7b02                	ld	s6,32(sp)
 220:	6be2                	ld	s7,24(sp)
 222:	6125                	addi	sp,sp,96
 224:	8082                	ret

0000000000000226 <stat>:

int
stat(const char *n, struct stat *st)
{
 226:	1101                	addi	sp,sp,-32
 228:	ec06                	sd	ra,24(sp)
 22a:	e822                	sd	s0,16(sp)
 22c:	e426                	sd	s1,8(sp)
 22e:	e04a                	sd	s2,0(sp)
 230:	1000                	addi	s0,sp,32
 232:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 234:	4581                	li	a1,0
 236:	00000097          	auipc	ra,0x0
 23a:	18c080e7          	jalr	396(ra) # 3c2 <open>
  if(fd < 0)
 23e:	02054563          	bltz	a0,268 <stat+0x42>
 242:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 244:	85ca                	mv	a1,s2
 246:	00000097          	auipc	ra,0x0
 24a:	184080e7          	jalr	388(ra) # 3ca <fstat>
 24e:	892a                	mv	s2,a0
  close(fd);
 250:	8526                	mv	a0,s1
 252:	00000097          	auipc	ra,0x0
 256:	158080e7          	jalr	344(ra) # 3aa <close>
  return r;
}
 25a:	854a                	mv	a0,s2
 25c:	60e2                	ld	ra,24(sp)
 25e:	6442                	ld	s0,16(sp)
 260:	64a2                	ld	s1,8(sp)
 262:	6902                	ld	s2,0(sp)
 264:	6105                	addi	sp,sp,32
 266:	8082                	ret
    return -1;
 268:	597d                	li	s2,-1
 26a:	bfc5                	j	25a <stat+0x34>

000000000000026c <atoi>:

int
atoi(const char *s)
{
 26c:	1141                	addi	sp,sp,-16
 26e:	e422                	sd	s0,8(sp)
 270:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 272:	00054703          	lbu	a4,0(a0)
 276:	02d00793          	li	a5,45
  int neg = 1;
 27a:	4805                	li	a6,1
  if (*s == '-') {
 27c:	04f70363          	beq	a4,a5,2c2 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 280:	00054683          	lbu	a3,0(a0)
 284:	fd06879b          	addiw	a5,a3,-48
 288:	0ff7f793          	andi	a5,a5,255
 28c:	4725                	li	a4,9
 28e:	02f76d63          	bltu	a4,a5,2c8 <atoi+0x5c>
  n = 0;
 292:	4601                	li	a2,0
  while('0' <= *s && *s <= '9')
 294:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 296:	0505                	addi	a0,a0,1
 298:	0026179b          	slliw	a5,a2,0x2
 29c:	9fb1                	addw	a5,a5,a2
 29e:	0017979b          	slliw	a5,a5,0x1
 2a2:	9fb5                	addw	a5,a5,a3
 2a4:	fd07861b          	addiw	a2,a5,-48
  while('0' <= *s && *s <= '9')
 2a8:	00054683          	lbu	a3,0(a0)
 2ac:	fd06871b          	addiw	a4,a3,-48
 2b0:	0ff77713          	andi	a4,a4,255
 2b4:	fee5f1e3          	bgeu	a1,a4,296 <atoi+0x2a>
  return n * neg;
}
 2b8:	02c8053b          	mulw	a0,a6,a2
 2bc:	6422                	ld	s0,8(sp)
 2be:	0141                	addi	sp,sp,16
 2c0:	8082                	ret
    s++;
 2c2:	0505                	addi	a0,a0,1
    neg = -1;
 2c4:	587d                	li	a6,-1
 2c6:	bf6d                	j	280 <atoi+0x14>
  n = 0;
 2c8:	4601                	li	a2,0
 2ca:	b7fd                	j	2b8 <atoi+0x4c>

00000000000002cc <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2cc:	1141                	addi	sp,sp,-16
 2ce:	e422                	sd	s0,8(sp)
 2d0:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 2d2:	02b57663          	bgeu	a0,a1,2fe <memmove+0x32>
    while(n-- > 0)
 2d6:	02c05163          	blez	a2,2f8 <memmove+0x2c>
 2da:	fff6079b          	addiw	a5,a2,-1
 2de:	1782                	slli	a5,a5,0x20
 2e0:	9381                	srli	a5,a5,0x20
 2e2:	0785                	addi	a5,a5,1
 2e4:	97aa                	add	a5,a5,a0
  dst = vdst;
 2e6:	872a                	mv	a4,a0
      *dst++ = *src++;
 2e8:	0585                	addi	a1,a1,1
 2ea:	0705                	addi	a4,a4,1
 2ec:	fff5c683          	lbu	a3,-1(a1)
 2f0:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 2f4:	fee79ae3          	bne	a5,a4,2e8 <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 2f8:	6422                	ld	s0,8(sp)
 2fa:	0141                	addi	sp,sp,16
 2fc:	8082                	ret
    dst += n;
 2fe:	00c50733          	add	a4,a0,a2
    src += n;
 302:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 304:	fec05ae3          	blez	a2,2f8 <memmove+0x2c>
 308:	fff6079b          	addiw	a5,a2,-1
 30c:	1782                	slli	a5,a5,0x20
 30e:	9381                	srli	a5,a5,0x20
 310:	fff7c793          	not	a5,a5
 314:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 316:	15fd                	addi	a1,a1,-1
 318:	177d                	addi	a4,a4,-1
 31a:	0005c683          	lbu	a3,0(a1)
 31e:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 322:	fee79ae3          	bne	a5,a4,316 <memmove+0x4a>
 326:	bfc9                	j	2f8 <memmove+0x2c>

0000000000000328 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 328:	1141                	addi	sp,sp,-16
 32a:	e422                	sd	s0,8(sp)
 32c:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 32e:	ca05                	beqz	a2,35e <memcmp+0x36>
 330:	fff6069b          	addiw	a3,a2,-1
 334:	1682                	slli	a3,a3,0x20
 336:	9281                	srli	a3,a3,0x20
 338:	0685                	addi	a3,a3,1
 33a:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 33c:	00054783          	lbu	a5,0(a0)
 340:	0005c703          	lbu	a4,0(a1)
 344:	00e79863          	bne	a5,a4,354 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 348:	0505                	addi	a0,a0,1
    p2++;
 34a:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 34c:	fed518e3          	bne	a0,a3,33c <memcmp+0x14>
  }
  return 0;
 350:	4501                	li	a0,0
 352:	a019                	j	358 <memcmp+0x30>
      return *p1 - *p2;
 354:	40e7853b          	subw	a0,a5,a4
}
 358:	6422                	ld	s0,8(sp)
 35a:	0141                	addi	sp,sp,16
 35c:	8082                	ret
  return 0;
 35e:	4501                	li	a0,0
 360:	bfe5                	j	358 <memcmp+0x30>

0000000000000362 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 362:	1141                	addi	sp,sp,-16
 364:	e406                	sd	ra,8(sp)
 366:	e022                	sd	s0,0(sp)
 368:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 36a:	00000097          	auipc	ra,0x0
 36e:	f62080e7          	jalr	-158(ra) # 2cc <memmove>
}
 372:	60a2                	ld	ra,8(sp)
 374:	6402                	ld	s0,0(sp)
 376:	0141                	addi	sp,sp,16
 378:	8082                	ret

000000000000037a <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 37a:	4885                	li	a7,1
 ecall
 37c:	00000073          	ecall
 ret
 380:	8082                	ret

0000000000000382 <exit>:
.global exit
exit:
 li a7, SYS_exit
 382:	4889                	li	a7,2
 ecall
 384:	00000073          	ecall
 ret
 388:	8082                	ret

000000000000038a <wait>:
.global wait
wait:
 li a7, SYS_wait
 38a:	488d                	li	a7,3
 ecall
 38c:	00000073          	ecall
 ret
 390:	8082                	ret

0000000000000392 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 392:	4891                	li	a7,4
 ecall
 394:	00000073          	ecall
 ret
 398:	8082                	ret

000000000000039a <read>:
.global read
read:
 li a7, SYS_read
 39a:	4895                	li	a7,5
 ecall
 39c:	00000073          	ecall
 ret
 3a0:	8082                	ret

00000000000003a2 <write>:
.global write
write:
 li a7, SYS_write
 3a2:	48c1                	li	a7,16
 ecall
 3a4:	00000073          	ecall
 ret
 3a8:	8082                	ret

00000000000003aa <close>:
.global close
close:
 li a7, SYS_close
 3aa:	48d5                	li	a7,21
 ecall
 3ac:	00000073          	ecall
 ret
 3b0:	8082                	ret

00000000000003b2 <kill>:
.global kill
kill:
 li a7, SYS_kill
 3b2:	4899                	li	a7,6
 ecall
 3b4:	00000073          	ecall
 ret
 3b8:	8082                	ret

00000000000003ba <exec>:
.global exec
exec:
 li a7, SYS_exec
 3ba:	489d                	li	a7,7
 ecall
 3bc:	00000073          	ecall
 ret
 3c0:	8082                	ret

00000000000003c2 <open>:
.global open
open:
 li a7, SYS_open
 3c2:	48bd                	li	a7,15
 ecall
 3c4:	00000073          	ecall
 ret
 3c8:	8082                	ret

00000000000003ca <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 3ca:	48a1                	li	a7,8
 ecall
 3cc:	00000073          	ecall
 ret
 3d0:	8082                	ret

00000000000003d2 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 3d2:	48d1                	li	a7,20
 ecall
 3d4:	00000073          	ecall
 ret
 3d8:	8082                	ret

00000000000003da <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 3da:	48a5                	li	a7,9
 ecall
 3dc:	00000073          	ecall
 ret
 3e0:	8082                	ret

00000000000003e2 <dup>:
.global dup
dup:
 li a7, SYS_dup
 3e2:	48a9                	li	a7,10
 ecall
 3e4:	00000073          	ecall
 ret
 3e8:	8082                	ret

00000000000003ea <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 3ea:	48ad                	li	a7,11
 ecall
 3ec:	00000073          	ecall
 ret
 3f0:	8082                	ret

00000000000003f2 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 3f2:	48b1                	li	a7,12
 ecall
 3f4:	00000073          	ecall
 ret
 3f8:	8082                	ret

00000000000003fa <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 3fa:	48b5                	li	a7,13
 ecall
 3fc:	00000073          	ecall
 ret
 400:	8082                	ret

0000000000000402 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 402:	48b9                	li	a7,14
 ecall
 404:	00000073          	ecall
 ret
 408:	8082                	ret

000000000000040a <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 40a:	48d9                	li	a7,22
 ecall
 40c:	00000073          	ecall
 ret
 410:	8082                	ret

0000000000000412 <dev>:
.global dev
dev:
 li a7, SYS_dev
 412:	48dd                	li	a7,23
 ecall
 414:	00000073          	ecall
 ret
 418:	8082                	ret

000000000000041a <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 41a:	48e1                	li	a7,24
 ecall
 41c:	00000073          	ecall
 ret
 420:	8082                	ret

0000000000000422 <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 422:	48e5                	li	a7,25
 ecall
 424:	00000073          	ecall
 ret
 428:	8082                	ret

000000000000042a <remove>:
.global remove
remove:
 li a7, SYS_remove
 42a:	48c5                	li	a7,17
 ecall
 42c:	00000073          	ecall
 ret
 430:	8082                	ret

0000000000000432 <trace>:
.global trace
trace:
 li a7, SYS_trace
 432:	48c9                	li	a7,18
 ecall
 434:	00000073          	ecall
 ret
 438:	8082                	ret

000000000000043a <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 43a:	48cd                	li	a7,19
 ecall
 43c:	00000073          	ecall
 ret
 440:	8082                	ret

0000000000000442 <rename>:
.global rename
rename:
 li a7, SYS_rename
 442:	48e9                	li	a7,26
 ecall
 444:	00000073          	ecall
 ret
 448:	8082                	ret

000000000000044a <checkchar>:
.global checkchar
checkchar:
 li a7, SYS_checkchar
 44a:	48ed                	li	a7,27
 ecall
 44c:	00000073          	ecall
 ret
 450:	8082                	ret

0000000000000452 <sprint>:
.global sprint
sprint:
 li a7, SYS_sprint
 452:	48f1                	li	a7,28
 ecall
 454:	00000073          	ecall
 ret
 458:	8082                	ret

000000000000045a <putc>:
static char digits[] = "0123456789ABCDEF";
static char printbuf[100];
static int  len = 0;
static void
putc(int fd, char c)
{
 45a:	1141                	addi	sp,sp,-16
 45c:	e422                	sd	s0,8(sp)
 45e:	0800                	addi	s0,sp,16
  printbuf[len++]=c;
 460:	00000797          	auipc	a5,0x0
 464:	5a078793          	addi	a5,a5,1440 # a00 <len>
 468:	4398                	lw	a4,0(a5)
 46a:	0017069b          	addiw	a3,a4,1
 46e:	c394                	sw	a3,0(a5)
 470:	00000797          	auipc	a5,0x0
 474:	5a078793          	addi	a5,a5,1440 # a10 <printbuf>
 478:	97ba                	add	a5,a5,a4
 47a:	00b78023          	sb	a1,0(a5)
}
 47e:	6422                	ld	s0,8(sp)
 480:	0141                	addi	sp,sp,16
 482:	8082                	ret

0000000000000484 <printint>:
	}
}

static void
printint(int fd, int xx, int base, int sgn)
{
 484:	7139                	addi	sp,sp,-64
 486:	fc06                	sd	ra,56(sp)
 488:	f822                	sd	s0,48(sp)
 48a:	f426                	sd	s1,40(sp)
 48c:	f04a                	sd	s2,32(sp)
 48e:	ec4e                	sd	s3,24(sp)
 490:	0080                	addi	s0,sp,64
 492:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 494:	c299                	beqz	a3,49a <printint+0x16>
 496:	0805c863          	bltz	a1,526 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 49a:	2581                	sext.w	a1,a1
  neg = 0;
 49c:	4881                	li	a7,0
 49e:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 4a2:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 4a4:	2601                	sext.w	a2,a2
 4a6:	00000517          	auipc	a0,0x0
 4aa:	53250513          	addi	a0,a0,1330 # 9d8 <digits>
 4ae:	883a                	mv	a6,a4
 4b0:	2705                	addiw	a4,a4,1
 4b2:	02c5f7bb          	remuw	a5,a1,a2
 4b6:	1782                	slli	a5,a5,0x20
 4b8:	9381                	srli	a5,a5,0x20
 4ba:	97aa                	add	a5,a5,a0
 4bc:	0007c783          	lbu	a5,0(a5)
 4c0:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 4c4:	0005879b          	sext.w	a5,a1
 4c8:	02c5d5bb          	divuw	a1,a1,a2
 4cc:	0685                	addi	a3,a3,1
 4ce:	fec7f0e3          	bgeu	a5,a2,4ae <printint+0x2a>
  if(neg)
 4d2:	00088b63          	beqz	a7,4e8 <printint+0x64>
    buf[i++] = '-';
 4d6:	fd040793          	addi	a5,s0,-48
 4da:	973e                	add	a4,a4,a5
 4dc:	02d00793          	li	a5,45
 4e0:	fef70823          	sb	a5,-16(a4)
 4e4:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 4e8:	02e05863          	blez	a4,518 <printint+0x94>
 4ec:	fc040793          	addi	a5,s0,-64
 4f0:	00e78933          	add	s2,a5,a4
 4f4:	fff78993          	addi	s3,a5,-1
 4f8:	99ba                	add	s3,s3,a4
 4fa:	377d                	addiw	a4,a4,-1
 4fc:	1702                	slli	a4,a4,0x20
 4fe:	9301                	srli	a4,a4,0x20
 500:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 504:	fff94583          	lbu	a1,-1(s2)
 508:	8526                	mv	a0,s1
 50a:	00000097          	auipc	ra,0x0
 50e:	f50080e7          	jalr	-176(ra) # 45a <putc>
  while(--i >= 0)
 512:	197d                	addi	s2,s2,-1
 514:	ff3918e3          	bne	s2,s3,504 <printint+0x80>
}
 518:	70e2                	ld	ra,56(sp)
 51a:	7442                	ld	s0,48(sp)
 51c:	74a2                	ld	s1,40(sp)
 51e:	7902                	ld	s2,32(sp)
 520:	69e2                	ld	s3,24(sp)
 522:	6121                	addi	sp,sp,64
 524:	8082                	ret
    x = -xx;
 526:	40b005bb          	negw	a1,a1
    neg = 1;
 52a:	4885                	li	a7,1
    x = -xx;
 52c:	bf8d                	j	49e <printint+0x1a>

000000000000052e <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 52e:	7119                	addi	sp,sp,-128
 530:	fc86                	sd	ra,120(sp)
 532:	f8a2                	sd	s0,112(sp)
 534:	f4a6                	sd	s1,104(sp)
 536:	f0ca                	sd	s2,96(sp)
 538:	ecce                	sd	s3,88(sp)
 53a:	e8d2                	sd	s4,80(sp)
 53c:	e4d6                	sd	s5,72(sp)
 53e:	e0da                	sd	s6,64(sp)
 540:	fc5e                	sd	s7,56(sp)
 542:	f862                	sd	s8,48(sp)
 544:	f466                	sd	s9,40(sp)
 546:	f06a                	sd	s10,32(sp)
 548:	ec6e                	sd	s11,24(sp)
 54a:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 54c:	0005c903          	lbu	s2,0(a1)
 550:	18090f63          	beqz	s2,6ee <vprintf+0x1c0>
 554:	8aaa                	mv	s5,a0
 556:	8b32                	mv	s6,a2
 558:	00158493          	addi	s1,a1,1
  state = 0;
 55c:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 55e:	02500a13          	li	s4,37
      if(c == 'd'){
 562:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 566:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 56a:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 56e:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 572:	00000b97          	auipc	s7,0x0
 576:	466b8b93          	addi	s7,s7,1126 # 9d8 <digits>
 57a:	a839                	j	598 <vprintf+0x6a>
        putc(fd, c);
 57c:	85ca                	mv	a1,s2
 57e:	8556                	mv	a0,s5
 580:	00000097          	auipc	ra,0x0
 584:	eda080e7          	jalr	-294(ra) # 45a <putc>
 588:	a019                	j	58e <vprintf+0x60>
    } else if(state == '%'){
 58a:	01498f63          	beq	s3,s4,5a8 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 58e:	0485                	addi	s1,s1,1
 590:	fff4c903          	lbu	s2,-1(s1)
 594:	14090d63          	beqz	s2,6ee <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 598:	0009079b          	sext.w	a5,s2
    if(state == 0){
 59c:	fe0997e3          	bnez	s3,58a <vprintf+0x5c>
      if(c == '%'){
 5a0:	fd479ee3          	bne	a5,s4,57c <vprintf+0x4e>
        state = '%';
 5a4:	89be                	mv	s3,a5
 5a6:	b7e5                	j	58e <vprintf+0x60>
      if(c == 'd'){
 5a8:	05878063          	beq	a5,s8,5e8 <vprintf+0xba>
      } else if(c == 'l') {
 5ac:	05978c63          	beq	a5,s9,604 <vprintf+0xd6>
      } else if(c == 'x') {
 5b0:	07a78863          	beq	a5,s10,620 <vprintf+0xf2>
      } else if(c == 'p') {
 5b4:	09b78463          	beq	a5,s11,63c <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 5b8:	07300713          	li	a4,115
 5bc:	0ce78663          	beq	a5,a4,688 <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5c0:	06300713          	li	a4,99
 5c4:	0ee78e63          	beq	a5,a4,6c0 <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 5c8:	11478863          	beq	a5,s4,6d8 <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5cc:	85d2                	mv	a1,s4
 5ce:	8556                	mv	a0,s5
 5d0:	00000097          	auipc	ra,0x0
 5d4:	e8a080e7          	jalr	-374(ra) # 45a <putc>
        putc(fd, c);
 5d8:	85ca                	mv	a1,s2
 5da:	8556                	mv	a0,s5
 5dc:	00000097          	auipc	ra,0x0
 5e0:	e7e080e7          	jalr	-386(ra) # 45a <putc>
      }
      state = 0;
 5e4:	4981                	li	s3,0
 5e6:	b765                	j	58e <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 5e8:	008b0913          	addi	s2,s6,8
 5ec:	4685                	li	a3,1
 5ee:	4629                	li	a2,10
 5f0:	000b2583          	lw	a1,0(s6)
 5f4:	8556                	mv	a0,s5
 5f6:	00000097          	auipc	ra,0x0
 5fa:	e8e080e7          	jalr	-370(ra) # 484 <printint>
 5fe:	8b4a                	mv	s6,s2
      state = 0;
 600:	4981                	li	s3,0
 602:	b771                	j	58e <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 604:	008b0913          	addi	s2,s6,8
 608:	4681                	li	a3,0
 60a:	4629                	li	a2,10
 60c:	000b2583          	lw	a1,0(s6)
 610:	8556                	mv	a0,s5
 612:	00000097          	auipc	ra,0x0
 616:	e72080e7          	jalr	-398(ra) # 484 <printint>
 61a:	8b4a                	mv	s6,s2
      state = 0;
 61c:	4981                	li	s3,0
 61e:	bf85                	j	58e <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 620:	008b0913          	addi	s2,s6,8
 624:	4681                	li	a3,0
 626:	4641                	li	a2,16
 628:	000b2583          	lw	a1,0(s6)
 62c:	8556                	mv	a0,s5
 62e:	00000097          	auipc	ra,0x0
 632:	e56080e7          	jalr	-426(ra) # 484 <printint>
 636:	8b4a                	mv	s6,s2
      state = 0;
 638:	4981                	li	s3,0
 63a:	bf91                	j	58e <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 63c:	008b0793          	addi	a5,s6,8
 640:	f8f43423          	sd	a5,-120(s0)
 644:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 648:	03000593          	li	a1,48
 64c:	8556                	mv	a0,s5
 64e:	00000097          	auipc	ra,0x0
 652:	e0c080e7          	jalr	-500(ra) # 45a <putc>
  putc(fd, 'x');
 656:	85ea                	mv	a1,s10
 658:	8556                	mv	a0,s5
 65a:	00000097          	auipc	ra,0x0
 65e:	e00080e7          	jalr	-512(ra) # 45a <putc>
 662:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 664:	03c9d793          	srli	a5,s3,0x3c
 668:	97de                	add	a5,a5,s7
 66a:	0007c583          	lbu	a1,0(a5)
 66e:	8556                	mv	a0,s5
 670:	00000097          	auipc	ra,0x0
 674:	dea080e7          	jalr	-534(ra) # 45a <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 678:	0992                	slli	s3,s3,0x4
 67a:	397d                	addiw	s2,s2,-1
 67c:	fe0914e3          	bnez	s2,664 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 680:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 684:	4981                	li	s3,0
 686:	b721                	j	58e <vprintf+0x60>
        s = va_arg(ap, char*);
 688:	008b0993          	addi	s3,s6,8
 68c:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 690:	02090163          	beqz	s2,6b2 <vprintf+0x184>
        while(*s != 0){
 694:	00094583          	lbu	a1,0(s2)
 698:	c9a1                	beqz	a1,6e8 <vprintf+0x1ba>
          putc(fd, *s);
 69a:	8556                	mv	a0,s5
 69c:	00000097          	auipc	ra,0x0
 6a0:	dbe080e7          	jalr	-578(ra) # 45a <putc>
          s++;
 6a4:	0905                	addi	s2,s2,1
        while(*s != 0){
 6a6:	00094583          	lbu	a1,0(s2)
 6aa:	f9e5                	bnez	a1,69a <vprintf+0x16c>
        s = va_arg(ap, char*);
 6ac:	8b4e                	mv	s6,s3
      state = 0;
 6ae:	4981                	li	s3,0
 6b0:	bdf9                	j	58e <vprintf+0x60>
          s = "(null)";
 6b2:	00000917          	auipc	s2,0x0
 6b6:	31e90913          	addi	s2,s2,798 # 9d0 <malloc+0x158>
        while(*s != 0){
 6ba:	02800593          	li	a1,40
 6be:	bff1                	j	69a <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 6c0:	008b0913          	addi	s2,s6,8
 6c4:	000b4583          	lbu	a1,0(s6)
 6c8:	8556                	mv	a0,s5
 6ca:	00000097          	auipc	ra,0x0
 6ce:	d90080e7          	jalr	-624(ra) # 45a <putc>
 6d2:	8b4a                	mv	s6,s2
      state = 0;
 6d4:	4981                	li	s3,0
 6d6:	bd65                	j	58e <vprintf+0x60>
        putc(fd, c);
 6d8:	85d2                	mv	a1,s4
 6da:	8556                	mv	a0,s5
 6dc:	00000097          	auipc	ra,0x0
 6e0:	d7e080e7          	jalr	-642(ra) # 45a <putc>
      state = 0;
 6e4:	4981                	li	s3,0
 6e6:	b565                	j	58e <vprintf+0x60>
        s = va_arg(ap, char*);
 6e8:	8b4e                	mv	s6,s3
      state = 0;
 6ea:	4981                	li	s3,0
 6ec:	b54d                	j	58e <vprintf+0x60>
    }
  }
}
 6ee:	70e6                	ld	ra,120(sp)
 6f0:	7446                	ld	s0,112(sp)
 6f2:	74a6                	ld	s1,104(sp)
 6f4:	7906                	ld	s2,96(sp)
 6f6:	69e6                	ld	s3,88(sp)
 6f8:	6a46                	ld	s4,80(sp)
 6fa:	6aa6                	ld	s5,72(sp)
 6fc:	6b06                	ld	s6,64(sp)
 6fe:	7be2                	ld	s7,56(sp)
 700:	7c42                	ld	s8,48(sp)
 702:	7ca2                	ld	s9,40(sp)
 704:	7d02                	ld	s10,32(sp)
 706:	6de2                	ld	s11,24(sp)
 708:	6109                	addi	sp,sp,128
 70a:	8082                	ret

000000000000070c <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 70c:	711d                	addi	sp,sp,-96
 70e:	f406                	sd	ra,40(sp)
 710:	f022                	sd	s0,32(sp)
 712:	ec26                	sd	s1,24(sp)
 714:	e84a                	sd	s2,16(sp)
 716:	1800                	addi	s0,sp,48
 718:	84aa                	mv	s1,a0
 71a:	e010                	sd	a2,0(s0)
 71c:	e414                	sd	a3,8(s0)
 71e:	e818                	sd	a4,16(s0)
 720:	ec1c                	sd	a5,24(s0)
 722:	03043023          	sd	a6,32(s0)
 726:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 72a:	fc843c23          	sd	s0,-40(s0)
  vprintf(fd, fmt, ap);
 72e:	8622                	mv	a2,s0
 730:	00000097          	auipc	ra,0x0
 734:	dfe080e7          	jalr	-514(ra) # 52e <vprintf>
	if(fd==1){
 738:	4785                	li	a5,1
 73a:	02f48963          	beq	s1,a5,76c <fprintf+0x60>
	  write(fd, printbuf, len);
 73e:	00000917          	auipc	s2,0x0
 742:	2c290913          	addi	s2,s2,706 # a00 <len>
 746:	00092603          	lw	a2,0(s2)
 74a:	00000597          	auipc	a1,0x0
 74e:	2c658593          	addi	a1,a1,710 # a10 <printbuf>
 752:	8526                	mv	a0,s1
 754:	00000097          	auipc	ra,0x0
 758:	c4e080e7          	jalr	-946(ra) # 3a2 <write>
	  len=0;
 75c:	00092023          	sw	zero,0(s2)
  fflush(fd);
}
 760:	70a2                	ld	ra,40(sp)
 762:	7402                	ld	s0,32(sp)
 764:	64e2                	ld	s1,24(sp)
 766:	6942                	ld	s2,16(sp)
 768:	6125                	addi	sp,sp,96
 76a:	8082                	ret
	  printbuf[len]=0;
 76c:	00000517          	auipc	a0,0x0
 770:	2a450513          	addi	a0,a0,676 # a10 <printbuf>
 774:	00000497          	auipc	s1,0x0
 778:	28c48493          	addi	s1,s1,652 # a00 <len>
 77c:	409c                	lw	a5,0(s1)
 77e:	97aa                	add	a5,a5,a0
 780:	00078023          	sb	zero,0(a5)
	  sprint(printbuf);
 784:	00000097          	auipc	ra,0x0
 788:	cce080e7          	jalr	-818(ra) # 452 <sprint>
	  len=0;
 78c:	0004a023          	sw	zero,0(s1)
 790:	bfc1                	j	760 <fprintf+0x54>

0000000000000792 <printf>:

void
printf(const char *fmt, ...)
{
 792:	7159                	addi	sp,sp,-112
 794:	f406                	sd	ra,40(sp)
 796:	f022                	sd	s0,32(sp)
 798:	ec26                	sd	s1,24(sp)
 79a:	1800                	addi	s0,sp,48
 79c:	e40c                	sd	a1,8(s0)
 79e:	e810                	sd	a2,16(s0)
 7a0:	ec14                	sd	a3,24(s0)
 7a2:	f018                	sd	a4,32(s0)
 7a4:	f41c                	sd	a5,40(s0)
 7a6:	03043823          	sd	a6,48(s0)
 7aa:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 7ae:	00840613          	addi	a2,s0,8
 7b2:	fcc43c23          	sd	a2,-40(s0)
  vprintf(1, fmt, ap);
 7b6:	85aa                	mv	a1,a0
 7b8:	4505                	li	a0,1
 7ba:	00000097          	auipc	ra,0x0
 7be:	d74080e7          	jalr	-652(ra) # 52e <vprintf>
	  printbuf[len]=0;
 7c2:	00000517          	auipc	a0,0x0
 7c6:	24e50513          	addi	a0,a0,590 # a10 <printbuf>
 7ca:	00000497          	auipc	s1,0x0
 7ce:	23648493          	addi	s1,s1,566 # a00 <len>
 7d2:	409c                	lw	a5,0(s1)
 7d4:	97aa                	add	a5,a5,a0
 7d6:	00078023          	sb	zero,0(a5)
	  sprint(printbuf);
 7da:	00000097          	auipc	ra,0x0
 7de:	c78080e7          	jalr	-904(ra) # 452 <sprint>
	  len=0;
 7e2:	0004a023          	sw	zero,0(s1)
  fflush(1);
}
 7e6:	70a2                	ld	ra,40(sp)
 7e8:	7402                	ld	s0,32(sp)
 7ea:	64e2                	ld	s1,24(sp)
 7ec:	6165                	addi	sp,sp,112
 7ee:	8082                	ret

00000000000007f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7f0:	1141                	addi	sp,sp,-16
 7f2:	e422                	sd	s0,8(sp)
 7f4:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7f6:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7fa:	00000797          	auipc	a5,0x0
 7fe:	20e7b783          	ld	a5,526(a5) # a08 <freep>
 802:	a805                	j	832 <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 804:	4618                	lw	a4,8(a2)
 806:	9db9                	addw	a1,a1,a4
 808:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 80c:	6398                	ld	a4,0(a5)
 80e:	6318                	ld	a4,0(a4)
 810:	fee53823          	sd	a4,-16(a0)
 814:	a091                	j	858 <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 816:	ff852703          	lw	a4,-8(a0)
 81a:	9e39                	addw	a2,a2,a4
 81c:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 81e:	ff053703          	ld	a4,-16(a0)
 822:	e398                	sd	a4,0(a5)
 824:	a099                	j	86a <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 826:	6398                	ld	a4,0(a5)
 828:	00e7e463          	bltu	a5,a4,830 <free+0x40>
 82c:	00e6ea63          	bltu	a3,a4,840 <free+0x50>
{
 830:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 832:	fed7fae3          	bgeu	a5,a3,826 <free+0x36>
 836:	6398                	ld	a4,0(a5)
 838:	00e6e463          	bltu	a3,a4,840 <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 83c:	fee7eae3          	bltu	a5,a4,830 <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 840:	ff852583          	lw	a1,-8(a0)
 844:	6390                	ld	a2,0(a5)
 846:	02059713          	slli	a4,a1,0x20
 84a:	9301                	srli	a4,a4,0x20
 84c:	0712                	slli	a4,a4,0x4
 84e:	9736                	add	a4,a4,a3
 850:	fae60ae3          	beq	a2,a4,804 <free+0x14>
    bp->s.ptr = p->s.ptr;
 854:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 858:	4790                	lw	a2,8(a5)
 85a:	02061713          	slli	a4,a2,0x20
 85e:	9301                	srli	a4,a4,0x20
 860:	0712                	slli	a4,a4,0x4
 862:	973e                	add	a4,a4,a5
 864:	fae689e3          	beq	a3,a4,816 <free+0x26>
  } else
    p->s.ptr = bp;
 868:	e394                	sd	a3,0(a5)
  freep = p;
 86a:	00000717          	auipc	a4,0x0
 86e:	18f73f23          	sd	a5,414(a4) # a08 <freep>
}
 872:	6422                	ld	s0,8(sp)
 874:	0141                	addi	sp,sp,16
 876:	8082                	ret

0000000000000878 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 878:	7139                	addi	sp,sp,-64
 87a:	fc06                	sd	ra,56(sp)
 87c:	f822                	sd	s0,48(sp)
 87e:	f426                	sd	s1,40(sp)
 880:	f04a                	sd	s2,32(sp)
 882:	ec4e                	sd	s3,24(sp)
 884:	e852                	sd	s4,16(sp)
 886:	e456                	sd	s5,8(sp)
 888:	e05a                	sd	s6,0(sp)
 88a:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 88c:	02051493          	slli	s1,a0,0x20
 890:	9081                	srli	s1,s1,0x20
 892:	04bd                	addi	s1,s1,15
 894:	8091                	srli	s1,s1,0x4
 896:	0014899b          	addiw	s3,s1,1
 89a:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 89c:	00000517          	auipc	a0,0x0
 8a0:	16c53503          	ld	a0,364(a0) # a08 <freep>
 8a4:	c515                	beqz	a0,8d0 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a6:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 8a8:	4798                	lw	a4,8(a5)
 8aa:	02977f63          	bgeu	a4,s1,8e8 <malloc+0x70>
 8ae:	8a4e                	mv	s4,s3
 8b0:	0009871b          	sext.w	a4,s3
 8b4:	6685                	lui	a3,0x1
 8b6:	00d77363          	bgeu	a4,a3,8bc <malloc+0x44>
 8ba:	6a05                	lui	s4,0x1
 8bc:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 8c0:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 8c4:	00000917          	auipc	s2,0x0
 8c8:	14490913          	addi	s2,s2,324 # a08 <freep>
  if(p == (char*)-1)
 8cc:	5afd                	li	s5,-1
 8ce:	a88d                	j	940 <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 8d0:	00000797          	auipc	a5,0x0
 8d4:	1a878793          	addi	a5,a5,424 # a78 <base>
 8d8:	00000717          	auipc	a4,0x0
 8dc:	12f73823          	sd	a5,304(a4) # a08 <freep>
 8e0:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 8e2:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 8e6:	b7e1                	j	8ae <malloc+0x36>
      if(p->s.size == nunits)
 8e8:	02e48b63          	beq	s1,a4,91e <malloc+0xa6>
        p->s.size -= nunits;
 8ec:	4137073b          	subw	a4,a4,s3
 8f0:	c798                	sw	a4,8(a5)
        p += p->s.size;
 8f2:	1702                	slli	a4,a4,0x20
 8f4:	9301                	srli	a4,a4,0x20
 8f6:	0712                	slli	a4,a4,0x4
 8f8:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 8fa:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 8fe:	00000717          	auipc	a4,0x0
 902:	10a73523          	sd	a0,266(a4) # a08 <freep>
      return (void*)(p + 1);
 906:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 90a:	70e2                	ld	ra,56(sp)
 90c:	7442                	ld	s0,48(sp)
 90e:	74a2                	ld	s1,40(sp)
 910:	7902                	ld	s2,32(sp)
 912:	69e2                	ld	s3,24(sp)
 914:	6a42                	ld	s4,16(sp)
 916:	6aa2                	ld	s5,8(sp)
 918:	6b02                	ld	s6,0(sp)
 91a:	6121                	addi	sp,sp,64
 91c:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 91e:	6398                	ld	a4,0(a5)
 920:	e118                	sd	a4,0(a0)
 922:	bff1                	j	8fe <malloc+0x86>
  hp->s.size = nu;
 924:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 928:	0541                	addi	a0,a0,16
 92a:	00000097          	auipc	ra,0x0
 92e:	ec6080e7          	jalr	-314(ra) # 7f0 <free>
  return freep;
 932:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 936:	d971                	beqz	a0,90a <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 938:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 93a:	4798                	lw	a4,8(a5)
 93c:	fa9776e3          	bgeu	a4,s1,8e8 <malloc+0x70>
    if(p == freep)
 940:	00093703          	ld	a4,0(s2)
 944:	853e                	mv	a0,a5
 946:	fef719e3          	bne	a4,a5,938 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 94a:	8552                	mv	a0,s4
 94c:	00000097          	auipc	ra,0x0
 950:	aa6080e7          	jalr	-1370(ra) # 3f2 <sbrk>
  if(p == (char*)-1)
 954:	fd5518e3          	bne	a0,s5,924 <malloc+0xac>
        return 0;
 958:	4501                	li	a0,0
 95a:	bf45                	j	90a <malloc+0x92>
