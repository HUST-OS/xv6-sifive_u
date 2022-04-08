
user/_wc:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
   0:	7119                	addi	sp,sp,-128
   2:	fc86                	sd	ra,120(sp)
   4:	f8a2                	sd	s0,112(sp)
   6:	f4a6                	sd	s1,104(sp)
   8:	f0ca                	sd	s2,96(sp)
   a:	ecce                	sd	s3,88(sp)
   c:	e8d2                	sd	s4,80(sp)
   e:	e4d6                	sd	s5,72(sp)
  10:	e0da                	sd	s6,64(sp)
  12:	fc5e                	sd	s7,56(sp)
  14:	f862                	sd	s8,48(sp)
  16:	f466                	sd	s9,40(sp)
  18:	f06a                	sd	s10,32(sp)
  1a:	ec6e                	sd	s11,24(sp)
  1c:	0100                	addi	s0,sp,128
  1e:	f8a43423          	sd	a0,-120(s0)
  22:	f8b43023          	sd	a1,-128(s0)
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  26:	4981                	li	s3,0
  l = w = c = 0;
  28:	4c81                	li	s9,0
  2a:	4c01                	li	s8,0
  2c:	4b81                	li	s7,0
  2e:	00001d97          	auipc	s11,0x1
  32:	aa3d8d93          	addi	s11,s11,-1373 # ad1 <buf+0x1>
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
      c++;
      if(buf[i] == '\n')
  36:	4aa9                	li	s5,10
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
  38:	00001a17          	auipc	s4,0x1
  3c:	a08a0a13          	addi	s4,s4,-1528 # a40 <malloc+0xe8>
        inword = 0;
  40:	4b01                	li	s6,0
  while((n = read(fd, buf, sizeof(buf))) > 0){
  42:	a805                	j	72 <wc+0x72>
      if(strchr(" \r\t\n\v", buf[i]))
  44:	8552                	mv	a0,s4
  46:	00000097          	auipc	ra,0x0
  4a:	228080e7          	jalr	552(ra) # 26e <strchr>
  4e:	c919                	beqz	a0,64 <wc+0x64>
        inword = 0;
  50:	89da                	mv	s3,s6
    for(i=0; i<n; i++){
  52:	0485                	addi	s1,s1,1
  54:	01248d63          	beq	s1,s2,6e <wc+0x6e>
      if(buf[i] == '\n')
  58:	0004c583          	lbu	a1,0(s1)
  5c:	ff5594e3          	bne	a1,s5,44 <wc+0x44>
        l++;
  60:	2b85                	addiw	s7,s7,1
  62:	b7cd                	j	44 <wc+0x44>
      else if(!inword){
  64:	fe0997e3          	bnez	s3,52 <wc+0x52>
        w++;
  68:	2c05                	addiw	s8,s8,1
        inword = 1;
  6a:	4985                	li	s3,1
  6c:	b7dd                	j	52 <wc+0x52>
  6e:	01ac8cbb          	addw	s9,s9,s10
  while((n = read(fd, buf, sizeof(buf))) > 0){
  72:	20000613          	li	a2,512
  76:	00001597          	auipc	a1,0x1
  7a:	a5a58593          	addi	a1,a1,-1446 # ad0 <buf>
  7e:	f8843503          	ld	a0,-120(s0)
  82:	00000097          	auipc	ra,0x0
  86:	3f8080e7          	jalr	1016(ra) # 47a <read>
  8a:	00a05f63          	blez	a0,a8 <wc+0xa8>
    for(i=0; i<n; i++){
  8e:	00001497          	auipc	s1,0x1
  92:	a4248493          	addi	s1,s1,-1470 # ad0 <buf>
  96:	00050d1b          	sext.w	s10,a0
  9a:	fff5091b          	addiw	s2,a0,-1
  9e:	1902                	slli	s2,s2,0x20
  a0:	02095913          	srli	s2,s2,0x20
  a4:	996e                	add	s2,s2,s11
  a6:	bf4d                	j	58 <wc+0x58>
      }
    }
  }
  if(n < 0){
  a8:	02054e63          	bltz	a0,e4 <wc+0xe4>
    printf("wc: read error\n");
    exit(1);
  }
  printf("%d\t%d\t%d\t%s\n", l, w, c, name);
  ac:	f8043703          	ld	a4,-128(s0)
  b0:	86e6                	mv	a3,s9
  b2:	8662                	mv	a2,s8
  b4:	85de                	mv	a1,s7
  b6:	00001517          	auipc	a0,0x1
  ba:	9a250513          	addi	a0,a0,-1630 # a58 <malloc+0x100>
  be:	00000097          	auipc	ra,0x0
  c2:	7b4080e7          	jalr	1972(ra) # 872 <printf>
}
  c6:	70e6                	ld	ra,120(sp)
  c8:	7446                	ld	s0,112(sp)
  ca:	74a6                	ld	s1,104(sp)
  cc:	7906                	ld	s2,96(sp)
  ce:	69e6                	ld	s3,88(sp)
  d0:	6a46                	ld	s4,80(sp)
  d2:	6aa6                	ld	s5,72(sp)
  d4:	6b06                	ld	s6,64(sp)
  d6:	7be2                	ld	s7,56(sp)
  d8:	7c42                	ld	s8,48(sp)
  da:	7ca2                	ld	s9,40(sp)
  dc:	7d02                	ld	s10,32(sp)
  de:	6de2                	ld	s11,24(sp)
  e0:	6109                	addi	sp,sp,128
  e2:	8082                	ret
    printf("wc: read error\n");
  e4:	00001517          	auipc	a0,0x1
  e8:	96450513          	addi	a0,a0,-1692 # a48 <malloc+0xf0>
  ec:	00000097          	auipc	ra,0x0
  f0:	786080e7          	jalr	1926(ra) # 872 <printf>
    exit(1);
  f4:	4505                	li	a0,1
  f6:	00000097          	auipc	ra,0x0
  fa:	36c080e7          	jalr	876(ra) # 462 <exit>

00000000000000fe <main>:

int
main(int argc, char *argv[])
{
  fe:	7179                	addi	sp,sp,-48
 100:	f406                	sd	ra,40(sp)
 102:	f022                	sd	s0,32(sp)
 104:	ec26                	sd	s1,24(sp)
 106:	e84a                	sd	s2,16(sp)
 108:	e44e                	sd	s3,8(sp)
 10a:	e052                	sd	s4,0(sp)
 10c:	1800                	addi	s0,sp,48
  int fd, i;

  if(argc <= 1){
 10e:	4785                	li	a5,1
 110:	06a7d063          	bge	a5,a0,170 <main+0x72>
 114:	89aa                	mv	s3,a0
 116:	8a2e                	mv	s4,a1
    wc(0, "");
    exit(0);
  }

  printf("LINE\tWORD\tBYTE\tFILE\n");
 118:	00001517          	auipc	a0,0x1
 11c:	95850513          	addi	a0,a0,-1704 # a70 <malloc+0x118>
 120:	00000097          	auipc	ra,0x0
 124:	752080e7          	jalr	1874(ra) # 872 <printf>
  for(i = 1; i < argc; i++){
 128:	008a0493          	addi	s1,s4,8
 12c:	39f9                	addiw	s3,s3,-2
 12e:	1982                	slli	s3,s3,0x20
 130:	0209d993          	srli	s3,s3,0x20
 134:	098e                	slli	s3,s3,0x3
 136:	0a41                	addi	s4,s4,16
 138:	99d2                	add	s3,s3,s4
    if((fd = open(argv[i], 0)) < 0){
 13a:	4581                	li	a1,0
 13c:	6088                	ld	a0,0(s1)
 13e:	00000097          	auipc	ra,0x0
 142:	364080e7          	jalr	868(ra) # 4a2 <open>
 146:	892a                	mv	s2,a0
 148:	04054263          	bltz	a0,18c <main+0x8e>
      printf("wc: cannot open %s\n", argv[i]);
      exit(1);
    }
    wc(fd, argv[i]);
 14c:	608c                	ld	a1,0(s1)
 14e:	00000097          	auipc	ra,0x0
 152:	eb2080e7          	jalr	-334(ra) # 0 <wc>
    close(fd);
 156:	854a                	mv	a0,s2
 158:	00000097          	auipc	ra,0x0
 15c:	332080e7          	jalr	818(ra) # 48a <close>
  for(i = 1; i < argc; i++){
 160:	04a1                	addi	s1,s1,8
 162:	fd349ce3          	bne	s1,s3,13a <main+0x3c>
  }
  exit(0);
 166:	4501                	li	a0,0
 168:	00000097          	auipc	ra,0x0
 16c:	2fa080e7          	jalr	762(ra) # 462 <exit>
    wc(0, "");
 170:	00001597          	auipc	a1,0x1
 174:	8f858593          	addi	a1,a1,-1800 # a68 <malloc+0x110>
 178:	4501                	li	a0,0
 17a:	00000097          	auipc	ra,0x0
 17e:	e86080e7          	jalr	-378(ra) # 0 <wc>
    exit(0);
 182:	4501                	li	a0,0
 184:	00000097          	auipc	ra,0x0
 188:	2de080e7          	jalr	734(ra) # 462 <exit>
      printf("wc: cannot open %s\n", argv[i]);
 18c:	608c                	ld	a1,0(s1)
 18e:	00001517          	auipc	a0,0x1
 192:	8fa50513          	addi	a0,a0,-1798 # a88 <malloc+0x130>
 196:	00000097          	auipc	ra,0x0
 19a:	6dc080e7          	jalr	1756(ra) # 872 <printf>
      exit(1);
 19e:	4505                	li	a0,1
 1a0:	00000097          	auipc	ra,0x0
 1a4:	2c2080e7          	jalr	706(ra) # 462 <exit>

00000000000001a8 <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
 1a8:	1141                	addi	sp,sp,-16
 1aa:	e422                	sd	s0,8(sp)
 1ac:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1ae:	87aa                	mv	a5,a0
 1b0:	0585                	addi	a1,a1,1
 1b2:	0785                	addi	a5,a5,1
 1b4:	fff5c703          	lbu	a4,-1(a1)
 1b8:	fee78fa3          	sb	a4,-1(a5)
 1bc:	fb75                	bnez	a4,1b0 <strcpy+0x8>
    ;
  return os;
}
 1be:	6422                	ld	s0,8(sp)
 1c0:	0141                	addi	sp,sp,16
 1c2:	8082                	ret

00000000000001c4 <strcat>:

char*
strcat(char *s, const char *t)
{
 1c4:	1141                	addi	sp,sp,-16
 1c6:	e422                	sd	s0,8(sp)
 1c8:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
 1ca:	00054783          	lbu	a5,0(a0)
 1ce:	c385                	beqz	a5,1ee <strcat+0x2a>
 1d0:	87aa                	mv	a5,a0
    s++;
 1d2:	0785                	addi	a5,a5,1
  while(*s)
 1d4:	0007c703          	lbu	a4,0(a5)
 1d8:	ff6d                	bnez	a4,1d2 <strcat+0xe>
  while((*s++ = *t++))
 1da:	0585                	addi	a1,a1,1
 1dc:	0785                	addi	a5,a5,1
 1de:	fff5c703          	lbu	a4,-1(a1)
 1e2:	fee78fa3          	sb	a4,-1(a5)
 1e6:	fb75                	bnez	a4,1da <strcat+0x16>
    ;
  return os;
}
 1e8:	6422                	ld	s0,8(sp)
 1ea:	0141                	addi	sp,sp,16
 1ec:	8082                	ret
  while(*s)
 1ee:	87aa                	mv	a5,a0
 1f0:	b7ed                	j	1da <strcat+0x16>

00000000000001f2 <strcmp>:


int
strcmp(const char *p, const char *q)
{
 1f2:	1141                	addi	sp,sp,-16
 1f4:	e422                	sd	s0,8(sp)
 1f6:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 1f8:	00054783          	lbu	a5,0(a0)
 1fc:	cb91                	beqz	a5,210 <strcmp+0x1e>
 1fe:	0005c703          	lbu	a4,0(a1)
 202:	00f71763          	bne	a4,a5,210 <strcmp+0x1e>
    p++, q++;
 206:	0505                	addi	a0,a0,1
 208:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 20a:	00054783          	lbu	a5,0(a0)
 20e:	fbe5                	bnez	a5,1fe <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 210:	0005c503          	lbu	a0,0(a1)
}
 214:	40a7853b          	subw	a0,a5,a0
 218:	6422                	ld	s0,8(sp)
 21a:	0141                	addi	sp,sp,16
 21c:	8082                	ret

000000000000021e <strlen>:

uint
strlen(const char *s)
{
 21e:	1141                	addi	sp,sp,-16
 220:	e422                	sd	s0,8(sp)
 222:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 224:	00054783          	lbu	a5,0(a0)
 228:	cf91                	beqz	a5,244 <strlen+0x26>
 22a:	0505                	addi	a0,a0,1
 22c:	87aa                	mv	a5,a0
 22e:	4685                	li	a3,1
 230:	9e89                	subw	a3,a3,a0
 232:	00f6853b          	addw	a0,a3,a5
 236:	0785                	addi	a5,a5,1
 238:	fff7c703          	lbu	a4,-1(a5)
 23c:	fb7d                	bnez	a4,232 <strlen+0x14>
    ;
  return n;
}
 23e:	6422                	ld	s0,8(sp)
 240:	0141                	addi	sp,sp,16
 242:	8082                	ret
  for(n = 0; s[n]; n++)
 244:	4501                	li	a0,0
 246:	bfe5                	j	23e <strlen+0x20>

0000000000000248 <memset>:

void*
memset(void *dst, int c, uint n)
{
 248:	1141                	addi	sp,sp,-16
 24a:	e422                	sd	s0,8(sp)
 24c:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 24e:	ce09                	beqz	a2,268 <memset+0x20>
 250:	87aa                	mv	a5,a0
 252:	fff6071b          	addiw	a4,a2,-1
 256:	1702                	slli	a4,a4,0x20
 258:	9301                	srli	a4,a4,0x20
 25a:	0705                	addi	a4,a4,1
 25c:	972a                	add	a4,a4,a0
    cdst[i] = c;
 25e:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 262:	0785                	addi	a5,a5,1
 264:	fee79de3          	bne	a5,a4,25e <memset+0x16>
  }
  return dst;
}
 268:	6422                	ld	s0,8(sp)
 26a:	0141                	addi	sp,sp,16
 26c:	8082                	ret

000000000000026e <strchr>:

char*
strchr(const char *s, char c)
{
 26e:	1141                	addi	sp,sp,-16
 270:	e422                	sd	s0,8(sp)
 272:	0800                	addi	s0,sp,16
  for(; *s; s++)
 274:	00054783          	lbu	a5,0(a0)
 278:	cb99                	beqz	a5,28e <strchr+0x20>
    if(*s == c)
 27a:	00f58763          	beq	a1,a5,288 <strchr+0x1a>
  for(; *s; s++)
 27e:	0505                	addi	a0,a0,1
 280:	00054783          	lbu	a5,0(a0)
 284:	fbfd                	bnez	a5,27a <strchr+0xc>
      return (char*)s;
  return 0;
 286:	4501                	li	a0,0
}
 288:	6422                	ld	s0,8(sp)
 28a:	0141                	addi	sp,sp,16
 28c:	8082                	ret
  return 0;
 28e:	4501                	li	a0,0
 290:	bfe5                	j	288 <strchr+0x1a>

0000000000000292 <gets>:

char*
gets(char *buf, int max)
{
 292:	711d                	addi	sp,sp,-96
 294:	ec86                	sd	ra,88(sp)
 296:	e8a2                	sd	s0,80(sp)
 298:	e4a6                	sd	s1,72(sp)
 29a:	e0ca                	sd	s2,64(sp)
 29c:	fc4e                	sd	s3,56(sp)
 29e:	f852                	sd	s4,48(sp)
 2a0:	f456                	sd	s5,40(sp)
 2a2:	f05a                	sd	s6,32(sp)
 2a4:	ec5e                	sd	s7,24(sp)
 2a6:	1080                	addi	s0,sp,96
 2a8:	8baa                	mv	s7,a0
 2aa:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2ac:	892a                	mv	s2,a0
 2ae:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 2b0:	4aa9                	li	s5,10
 2b2:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 2b4:	89a6                	mv	s3,s1
 2b6:	2485                	addiw	s1,s1,1
 2b8:	0344d863          	bge	s1,s4,2e8 <gets+0x56>
    cc = read(0, &c, 1);
 2bc:	4605                	li	a2,1
 2be:	faf40593          	addi	a1,s0,-81
 2c2:	4501                	li	a0,0
 2c4:	00000097          	auipc	ra,0x0
 2c8:	1b6080e7          	jalr	438(ra) # 47a <read>
    if(cc < 1)
 2cc:	00a05e63          	blez	a0,2e8 <gets+0x56>
    buf[i++] = c;
 2d0:	faf44783          	lbu	a5,-81(s0)
 2d4:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 2d8:	01578763          	beq	a5,s5,2e6 <gets+0x54>
 2dc:	0905                	addi	s2,s2,1
 2de:	fd679be3          	bne	a5,s6,2b4 <gets+0x22>
  for(i=0; i+1 < max; ){
 2e2:	89a6                	mv	s3,s1
 2e4:	a011                	j	2e8 <gets+0x56>
 2e6:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 2e8:	99de                	add	s3,s3,s7
 2ea:	00098023          	sb	zero,0(s3)
  return buf;
}
 2ee:	855e                	mv	a0,s7
 2f0:	60e6                	ld	ra,88(sp)
 2f2:	6446                	ld	s0,80(sp)
 2f4:	64a6                	ld	s1,72(sp)
 2f6:	6906                	ld	s2,64(sp)
 2f8:	79e2                	ld	s3,56(sp)
 2fa:	7a42                	ld	s4,48(sp)
 2fc:	7aa2                	ld	s5,40(sp)
 2fe:	7b02                	ld	s6,32(sp)
 300:	6be2                	ld	s7,24(sp)
 302:	6125                	addi	sp,sp,96
 304:	8082                	ret

0000000000000306 <stat>:

int
stat(const char *n, struct stat *st)
{
 306:	1101                	addi	sp,sp,-32
 308:	ec06                	sd	ra,24(sp)
 30a:	e822                	sd	s0,16(sp)
 30c:	e426                	sd	s1,8(sp)
 30e:	e04a                	sd	s2,0(sp)
 310:	1000                	addi	s0,sp,32
 312:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 314:	4581                	li	a1,0
 316:	00000097          	auipc	ra,0x0
 31a:	18c080e7          	jalr	396(ra) # 4a2 <open>
  if(fd < 0)
 31e:	02054563          	bltz	a0,348 <stat+0x42>
 322:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 324:	85ca                	mv	a1,s2
 326:	00000097          	auipc	ra,0x0
 32a:	184080e7          	jalr	388(ra) # 4aa <fstat>
 32e:	892a                	mv	s2,a0
  close(fd);
 330:	8526                	mv	a0,s1
 332:	00000097          	auipc	ra,0x0
 336:	158080e7          	jalr	344(ra) # 48a <close>
  return r;
}
 33a:	854a                	mv	a0,s2
 33c:	60e2                	ld	ra,24(sp)
 33e:	6442                	ld	s0,16(sp)
 340:	64a2                	ld	s1,8(sp)
 342:	6902                	ld	s2,0(sp)
 344:	6105                	addi	sp,sp,32
 346:	8082                	ret
    return -1;
 348:	597d                	li	s2,-1
 34a:	bfc5                	j	33a <stat+0x34>

000000000000034c <atoi>:

int
atoi(const char *s)
{
 34c:	1141                	addi	sp,sp,-16
 34e:	e422                	sd	s0,8(sp)
 350:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 352:	00054703          	lbu	a4,0(a0)
 356:	02d00793          	li	a5,45
  int neg = 1;
 35a:	4805                	li	a6,1
  if (*s == '-') {
 35c:	04f70363          	beq	a4,a5,3a2 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 360:	00054683          	lbu	a3,0(a0)
 364:	fd06879b          	addiw	a5,a3,-48
 368:	0ff7f793          	andi	a5,a5,255
 36c:	4725                	li	a4,9
 36e:	02f76d63          	bltu	a4,a5,3a8 <atoi+0x5c>
  n = 0;
 372:	4601                	li	a2,0
  while('0' <= *s && *s <= '9')
 374:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 376:	0505                	addi	a0,a0,1
 378:	0026179b          	slliw	a5,a2,0x2
 37c:	9fb1                	addw	a5,a5,a2
 37e:	0017979b          	slliw	a5,a5,0x1
 382:	9fb5                	addw	a5,a5,a3
 384:	fd07861b          	addiw	a2,a5,-48
  while('0' <= *s && *s <= '9')
 388:	00054683          	lbu	a3,0(a0)
 38c:	fd06871b          	addiw	a4,a3,-48
 390:	0ff77713          	andi	a4,a4,255
 394:	fee5f1e3          	bgeu	a1,a4,376 <atoi+0x2a>
  return n * neg;
}
 398:	02c8053b          	mulw	a0,a6,a2
 39c:	6422                	ld	s0,8(sp)
 39e:	0141                	addi	sp,sp,16
 3a0:	8082                	ret
    s++;
 3a2:	0505                	addi	a0,a0,1
    neg = -1;
 3a4:	587d                	li	a6,-1
 3a6:	bf6d                	j	360 <atoi+0x14>
  n = 0;
 3a8:	4601                	li	a2,0
 3aa:	b7fd                	j	398 <atoi+0x4c>

00000000000003ac <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3ac:	1141                	addi	sp,sp,-16
 3ae:	e422                	sd	s0,8(sp)
 3b0:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 3b2:	02b57663          	bgeu	a0,a1,3de <memmove+0x32>
    while(n-- > 0)
 3b6:	02c05163          	blez	a2,3d8 <memmove+0x2c>
 3ba:	fff6079b          	addiw	a5,a2,-1
 3be:	1782                	slli	a5,a5,0x20
 3c0:	9381                	srli	a5,a5,0x20
 3c2:	0785                	addi	a5,a5,1
 3c4:	97aa                	add	a5,a5,a0
  dst = vdst;
 3c6:	872a                	mv	a4,a0
      *dst++ = *src++;
 3c8:	0585                	addi	a1,a1,1
 3ca:	0705                	addi	a4,a4,1
 3cc:	fff5c683          	lbu	a3,-1(a1)
 3d0:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 3d4:	fee79ae3          	bne	a5,a4,3c8 <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 3d8:	6422                	ld	s0,8(sp)
 3da:	0141                	addi	sp,sp,16
 3dc:	8082                	ret
    dst += n;
 3de:	00c50733          	add	a4,a0,a2
    src += n;
 3e2:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 3e4:	fec05ae3          	blez	a2,3d8 <memmove+0x2c>
 3e8:	fff6079b          	addiw	a5,a2,-1
 3ec:	1782                	slli	a5,a5,0x20
 3ee:	9381                	srli	a5,a5,0x20
 3f0:	fff7c793          	not	a5,a5
 3f4:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 3f6:	15fd                	addi	a1,a1,-1
 3f8:	177d                	addi	a4,a4,-1
 3fa:	0005c683          	lbu	a3,0(a1)
 3fe:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 402:	fee79ae3          	bne	a5,a4,3f6 <memmove+0x4a>
 406:	bfc9                	j	3d8 <memmove+0x2c>

0000000000000408 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 408:	1141                	addi	sp,sp,-16
 40a:	e422                	sd	s0,8(sp)
 40c:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 40e:	ca05                	beqz	a2,43e <memcmp+0x36>
 410:	fff6069b          	addiw	a3,a2,-1
 414:	1682                	slli	a3,a3,0x20
 416:	9281                	srli	a3,a3,0x20
 418:	0685                	addi	a3,a3,1
 41a:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 41c:	00054783          	lbu	a5,0(a0)
 420:	0005c703          	lbu	a4,0(a1)
 424:	00e79863          	bne	a5,a4,434 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 428:	0505                	addi	a0,a0,1
    p2++;
 42a:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 42c:	fed518e3          	bne	a0,a3,41c <memcmp+0x14>
  }
  return 0;
 430:	4501                	li	a0,0
 432:	a019                	j	438 <memcmp+0x30>
      return *p1 - *p2;
 434:	40e7853b          	subw	a0,a5,a4
}
 438:	6422                	ld	s0,8(sp)
 43a:	0141                	addi	sp,sp,16
 43c:	8082                	ret
  return 0;
 43e:	4501                	li	a0,0
 440:	bfe5                	j	438 <memcmp+0x30>

0000000000000442 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 442:	1141                	addi	sp,sp,-16
 444:	e406                	sd	ra,8(sp)
 446:	e022                	sd	s0,0(sp)
 448:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 44a:	00000097          	auipc	ra,0x0
 44e:	f62080e7          	jalr	-158(ra) # 3ac <memmove>
}
 452:	60a2                	ld	ra,8(sp)
 454:	6402                	ld	s0,0(sp)
 456:	0141                	addi	sp,sp,16
 458:	8082                	ret

000000000000045a <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 45a:	4885                	li	a7,1
 ecall
 45c:	00000073          	ecall
 ret
 460:	8082                	ret

0000000000000462 <exit>:
.global exit
exit:
 li a7, SYS_exit
 462:	4889                	li	a7,2
 ecall
 464:	00000073          	ecall
 ret
 468:	8082                	ret

000000000000046a <wait>:
.global wait
wait:
 li a7, SYS_wait
 46a:	488d                	li	a7,3
 ecall
 46c:	00000073          	ecall
 ret
 470:	8082                	ret

0000000000000472 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 472:	4891                	li	a7,4
 ecall
 474:	00000073          	ecall
 ret
 478:	8082                	ret

000000000000047a <read>:
.global read
read:
 li a7, SYS_read
 47a:	4895                	li	a7,5
 ecall
 47c:	00000073          	ecall
 ret
 480:	8082                	ret

0000000000000482 <write>:
.global write
write:
 li a7, SYS_write
 482:	48c1                	li	a7,16
 ecall
 484:	00000073          	ecall
 ret
 488:	8082                	ret

000000000000048a <close>:
.global close
close:
 li a7, SYS_close
 48a:	48d5                	li	a7,21
 ecall
 48c:	00000073          	ecall
 ret
 490:	8082                	ret

0000000000000492 <kill>:
.global kill
kill:
 li a7, SYS_kill
 492:	4899                	li	a7,6
 ecall
 494:	00000073          	ecall
 ret
 498:	8082                	ret

000000000000049a <exec>:
.global exec
exec:
 li a7, SYS_exec
 49a:	489d                	li	a7,7
 ecall
 49c:	00000073          	ecall
 ret
 4a0:	8082                	ret

00000000000004a2 <open>:
.global open
open:
 li a7, SYS_open
 4a2:	48bd                	li	a7,15
 ecall
 4a4:	00000073          	ecall
 ret
 4a8:	8082                	ret

00000000000004aa <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 4aa:	48a1                	li	a7,8
 ecall
 4ac:	00000073          	ecall
 ret
 4b0:	8082                	ret

00000000000004b2 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 4b2:	48d1                	li	a7,20
 ecall
 4b4:	00000073          	ecall
 ret
 4b8:	8082                	ret

00000000000004ba <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 4ba:	48a5                	li	a7,9
 ecall
 4bc:	00000073          	ecall
 ret
 4c0:	8082                	ret

00000000000004c2 <dup>:
.global dup
dup:
 li a7, SYS_dup
 4c2:	48a9                	li	a7,10
 ecall
 4c4:	00000073          	ecall
 ret
 4c8:	8082                	ret

00000000000004ca <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 4ca:	48ad                	li	a7,11
 ecall
 4cc:	00000073          	ecall
 ret
 4d0:	8082                	ret

00000000000004d2 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 4d2:	48b1                	li	a7,12
 ecall
 4d4:	00000073          	ecall
 ret
 4d8:	8082                	ret

00000000000004da <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 4da:	48b5                	li	a7,13
 ecall
 4dc:	00000073          	ecall
 ret
 4e0:	8082                	ret

00000000000004e2 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 4e2:	48b9                	li	a7,14
 ecall
 4e4:	00000073          	ecall
 ret
 4e8:	8082                	ret

00000000000004ea <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 4ea:	48d9                	li	a7,22
 ecall
 4ec:	00000073          	ecall
 ret
 4f0:	8082                	ret

00000000000004f2 <dev>:
.global dev
dev:
 li a7, SYS_dev
 4f2:	48dd                	li	a7,23
 ecall
 4f4:	00000073          	ecall
 ret
 4f8:	8082                	ret

00000000000004fa <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 4fa:	48e1                	li	a7,24
 ecall
 4fc:	00000073          	ecall
 ret
 500:	8082                	ret

0000000000000502 <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 502:	48e5                	li	a7,25
 ecall
 504:	00000073          	ecall
 ret
 508:	8082                	ret

000000000000050a <remove>:
.global remove
remove:
 li a7, SYS_remove
 50a:	48c5                	li	a7,17
 ecall
 50c:	00000073          	ecall
 ret
 510:	8082                	ret

0000000000000512 <trace>:
.global trace
trace:
 li a7, SYS_trace
 512:	48c9                	li	a7,18
 ecall
 514:	00000073          	ecall
 ret
 518:	8082                	ret

000000000000051a <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 51a:	48cd                	li	a7,19
 ecall
 51c:	00000073          	ecall
 ret
 520:	8082                	ret

0000000000000522 <rename>:
.global rename
rename:
 li a7, SYS_rename
 522:	48e9                	li	a7,26
 ecall
 524:	00000073          	ecall
 ret
 528:	8082                	ret

000000000000052a <checkchar>:
.global checkchar
checkchar:
 li a7, SYS_checkchar
 52a:	48ed                	li	a7,27
 ecall
 52c:	00000073          	ecall
 ret
 530:	8082                	ret

0000000000000532 <sprint>:
.global sprint
sprint:
 li a7, SYS_sprint
 532:	48f1                	li	a7,28
 ecall
 534:	00000073          	ecall
 ret
 538:	8082                	ret

000000000000053a <putc>:
static char digits[] = "0123456789ABCDEF";
static char printbuf[100];
static int  len = 0;
static void
putc(int fd, char c)
{
 53a:	1141                	addi	sp,sp,-16
 53c:	e422                	sd	s0,8(sp)
 53e:	0800                	addi	s0,sp,16
  printbuf[len++]=c;
 540:	00000797          	auipc	a5,0x0
 544:	58078793          	addi	a5,a5,1408 # ac0 <len>
 548:	4398                	lw	a4,0(a5)
 54a:	0017069b          	addiw	a3,a4,1
 54e:	c394                	sw	a3,0(a5)
 550:	00000797          	auipc	a5,0x0
 554:	78078793          	addi	a5,a5,1920 # cd0 <printbuf>
 558:	97ba                	add	a5,a5,a4
 55a:	00b78023          	sb	a1,0(a5)
}
 55e:	6422                	ld	s0,8(sp)
 560:	0141                	addi	sp,sp,16
 562:	8082                	ret

0000000000000564 <printint>:
	}
}

static void
printint(int fd, int xx, int base, int sgn)
{
 564:	7139                	addi	sp,sp,-64
 566:	fc06                	sd	ra,56(sp)
 568:	f822                	sd	s0,48(sp)
 56a:	f426                	sd	s1,40(sp)
 56c:	f04a                	sd	s2,32(sp)
 56e:	ec4e                	sd	s3,24(sp)
 570:	0080                	addi	s0,sp,64
 572:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 574:	c299                	beqz	a3,57a <printint+0x16>
 576:	0805c863          	bltz	a1,606 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 57a:	2581                	sext.w	a1,a1
  neg = 0;
 57c:	4881                	li	a7,0
 57e:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 582:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 584:	2601                	sext.w	a2,a2
 586:	00000517          	auipc	a0,0x0
 58a:	52250513          	addi	a0,a0,1314 # aa8 <digits>
 58e:	883a                	mv	a6,a4
 590:	2705                	addiw	a4,a4,1
 592:	02c5f7bb          	remuw	a5,a1,a2
 596:	1782                	slli	a5,a5,0x20
 598:	9381                	srli	a5,a5,0x20
 59a:	97aa                	add	a5,a5,a0
 59c:	0007c783          	lbu	a5,0(a5)
 5a0:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 5a4:	0005879b          	sext.w	a5,a1
 5a8:	02c5d5bb          	divuw	a1,a1,a2
 5ac:	0685                	addi	a3,a3,1
 5ae:	fec7f0e3          	bgeu	a5,a2,58e <printint+0x2a>
  if(neg)
 5b2:	00088b63          	beqz	a7,5c8 <printint+0x64>
    buf[i++] = '-';
 5b6:	fd040793          	addi	a5,s0,-48
 5ba:	973e                	add	a4,a4,a5
 5bc:	02d00793          	li	a5,45
 5c0:	fef70823          	sb	a5,-16(a4)
 5c4:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 5c8:	02e05863          	blez	a4,5f8 <printint+0x94>
 5cc:	fc040793          	addi	a5,s0,-64
 5d0:	00e78933          	add	s2,a5,a4
 5d4:	fff78993          	addi	s3,a5,-1
 5d8:	99ba                	add	s3,s3,a4
 5da:	377d                	addiw	a4,a4,-1
 5dc:	1702                	slli	a4,a4,0x20
 5de:	9301                	srli	a4,a4,0x20
 5e0:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 5e4:	fff94583          	lbu	a1,-1(s2)
 5e8:	8526                	mv	a0,s1
 5ea:	00000097          	auipc	ra,0x0
 5ee:	f50080e7          	jalr	-176(ra) # 53a <putc>
  while(--i >= 0)
 5f2:	197d                	addi	s2,s2,-1
 5f4:	ff3918e3          	bne	s2,s3,5e4 <printint+0x80>
}
 5f8:	70e2                	ld	ra,56(sp)
 5fa:	7442                	ld	s0,48(sp)
 5fc:	74a2                	ld	s1,40(sp)
 5fe:	7902                	ld	s2,32(sp)
 600:	69e2                	ld	s3,24(sp)
 602:	6121                	addi	sp,sp,64
 604:	8082                	ret
    x = -xx;
 606:	40b005bb          	negw	a1,a1
    neg = 1;
 60a:	4885                	li	a7,1
    x = -xx;
 60c:	bf8d                	j	57e <printint+0x1a>

000000000000060e <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 60e:	7119                	addi	sp,sp,-128
 610:	fc86                	sd	ra,120(sp)
 612:	f8a2                	sd	s0,112(sp)
 614:	f4a6                	sd	s1,104(sp)
 616:	f0ca                	sd	s2,96(sp)
 618:	ecce                	sd	s3,88(sp)
 61a:	e8d2                	sd	s4,80(sp)
 61c:	e4d6                	sd	s5,72(sp)
 61e:	e0da                	sd	s6,64(sp)
 620:	fc5e                	sd	s7,56(sp)
 622:	f862                	sd	s8,48(sp)
 624:	f466                	sd	s9,40(sp)
 626:	f06a                	sd	s10,32(sp)
 628:	ec6e                	sd	s11,24(sp)
 62a:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 62c:	0005c903          	lbu	s2,0(a1)
 630:	18090f63          	beqz	s2,7ce <vprintf+0x1c0>
 634:	8aaa                	mv	s5,a0
 636:	8b32                	mv	s6,a2
 638:	00158493          	addi	s1,a1,1
  state = 0;
 63c:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 63e:	02500a13          	li	s4,37
      if(c == 'd'){
 642:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 646:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 64a:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 64e:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 652:	00000b97          	auipc	s7,0x0
 656:	456b8b93          	addi	s7,s7,1110 # aa8 <digits>
 65a:	a839                	j	678 <vprintf+0x6a>
        putc(fd, c);
 65c:	85ca                	mv	a1,s2
 65e:	8556                	mv	a0,s5
 660:	00000097          	auipc	ra,0x0
 664:	eda080e7          	jalr	-294(ra) # 53a <putc>
 668:	a019                	j	66e <vprintf+0x60>
    } else if(state == '%'){
 66a:	01498f63          	beq	s3,s4,688 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 66e:	0485                	addi	s1,s1,1
 670:	fff4c903          	lbu	s2,-1(s1)
 674:	14090d63          	beqz	s2,7ce <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 678:	0009079b          	sext.w	a5,s2
    if(state == 0){
 67c:	fe0997e3          	bnez	s3,66a <vprintf+0x5c>
      if(c == '%'){
 680:	fd479ee3          	bne	a5,s4,65c <vprintf+0x4e>
        state = '%';
 684:	89be                	mv	s3,a5
 686:	b7e5                	j	66e <vprintf+0x60>
      if(c == 'd'){
 688:	05878063          	beq	a5,s8,6c8 <vprintf+0xba>
      } else if(c == 'l') {
 68c:	05978c63          	beq	a5,s9,6e4 <vprintf+0xd6>
      } else if(c == 'x') {
 690:	07a78863          	beq	a5,s10,700 <vprintf+0xf2>
      } else if(c == 'p') {
 694:	09b78463          	beq	a5,s11,71c <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 698:	07300713          	li	a4,115
 69c:	0ce78663          	beq	a5,a4,768 <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6a0:	06300713          	li	a4,99
 6a4:	0ee78e63          	beq	a5,a4,7a0 <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 6a8:	11478863          	beq	a5,s4,7b8 <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6ac:	85d2                	mv	a1,s4
 6ae:	8556                	mv	a0,s5
 6b0:	00000097          	auipc	ra,0x0
 6b4:	e8a080e7          	jalr	-374(ra) # 53a <putc>
        putc(fd, c);
 6b8:	85ca                	mv	a1,s2
 6ba:	8556                	mv	a0,s5
 6bc:	00000097          	auipc	ra,0x0
 6c0:	e7e080e7          	jalr	-386(ra) # 53a <putc>
      }
      state = 0;
 6c4:	4981                	li	s3,0
 6c6:	b765                	j	66e <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 6c8:	008b0913          	addi	s2,s6,8
 6cc:	4685                	li	a3,1
 6ce:	4629                	li	a2,10
 6d0:	000b2583          	lw	a1,0(s6)
 6d4:	8556                	mv	a0,s5
 6d6:	00000097          	auipc	ra,0x0
 6da:	e8e080e7          	jalr	-370(ra) # 564 <printint>
 6de:	8b4a                	mv	s6,s2
      state = 0;
 6e0:	4981                	li	s3,0
 6e2:	b771                	j	66e <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 6e4:	008b0913          	addi	s2,s6,8
 6e8:	4681                	li	a3,0
 6ea:	4629                	li	a2,10
 6ec:	000b2583          	lw	a1,0(s6)
 6f0:	8556                	mv	a0,s5
 6f2:	00000097          	auipc	ra,0x0
 6f6:	e72080e7          	jalr	-398(ra) # 564 <printint>
 6fa:	8b4a                	mv	s6,s2
      state = 0;
 6fc:	4981                	li	s3,0
 6fe:	bf85                	j	66e <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 700:	008b0913          	addi	s2,s6,8
 704:	4681                	li	a3,0
 706:	4641                	li	a2,16
 708:	000b2583          	lw	a1,0(s6)
 70c:	8556                	mv	a0,s5
 70e:	00000097          	auipc	ra,0x0
 712:	e56080e7          	jalr	-426(ra) # 564 <printint>
 716:	8b4a                	mv	s6,s2
      state = 0;
 718:	4981                	li	s3,0
 71a:	bf91                	j	66e <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 71c:	008b0793          	addi	a5,s6,8
 720:	f8f43423          	sd	a5,-120(s0)
 724:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 728:	03000593          	li	a1,48
 72c:	8556                	mv	a0,s5
 72e:	00000097          	auipc	ra,0x0
 732:	e0c080e7          	jalr	-500(ra) # 53a <putc>
  putc(fd, 'x');
 736:	85ea                	mv	a1,s10
 738:	8556                	mv	a0,s5
 73a:	00000097          	auipc	ra,0x0
 73e:	e00080e7          	jalr	-512(ra) # 53a <putc>
 742:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 744:	03c9d793          	srli	a5,s3,0x3c
 748:	97de                	add	a5,a5,s7
 74a:	0007c583          	lbu	a1,0(a5)
 74e:	8556                	mv	a0,s5
 750:	00000097          	auipc	ra,0x0
 754:	dea080e7          	jalr	-534(ra) # 53a <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 758:	0992                	slli	s3,s3,0x4
 75a:	397d                	addiw	s2,s2,-1
 75c:	fe0914e3          	bnez	s2,744 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 760:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 764:	4981                	li	s3,0
 766:	b721                	j	66e <vprintf+0x60>
        s = va_arg(ap, char*);
 768:	008b0993          	addi	s3,s6,8
 76c:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 770:	02090163          	beqz	s2,792 <vprintf+0x184>
        while(*s != 0){
 774:	00094583          	lbu	a1,0(s2)
 778:	c9a1                	beqz	a1,7c8 <vprintf+0x1ba>
          putc(fd, *s);
 77a:	8556                	mv	a0,s5
 77c:	00000097          	auipc	ra,0x0
 780:	dbe080e7          	jalr	-578(ra) # 53a <putc>
          s++;
 784:	0905                	addi	s2,s2,1
        while(*s != 0){
 786:	00094583          	lbu	a1,0(s2)
 78a:	f9e5                	bnez	a1,77a <vprintf+0x16c>
        s = va_arg(ap, char*);
 78c:	8b4e                	mv	s6,s3
      state = 0;
 78e:	4981                	li	s3,0
 790:	bdf9                	j	66e <vprintf+0x60>
          s = "(null)";
 792:	00000917          	auipc	s2,0x0
 796:	30e90913          	addi	s2,s2,782 # aa0 <malloc+0x148>
        while(*s != 0){
 79a:	02800593          	li	a1,40
 79e:	bff1                	j	77a <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 7a0:	008b0913          	addi	s2,s6,8
 7a4:	000b4583          	lbu	a1,0(s6)
 7a8:	8556                	mv	a0,s5
 7aa:	00000097          	auipc	ra,0x0
 7ae:	d90080e7          	jalr	-624(ra) # 53a <putc>
 7b2:	8b4a                	mv	s6,s2
      state = 0;
 7b4:	4981                	li	s3,0
 7b6:	bd65                	j	66e <vprintf+0x60>
        putc(fd, c);
 7b8:	85d2                	mv	a1,s4
 7ba:	8556                	mv	a0,s5
 7bc:	00000097          	auipc	ra,0x0
 7c0:	d7e080e7          	jalr	-642(ra) # 53a <putc>
      state = 0;
 7c4:	4981                	li	s3,0
 7c6:	b565                	j	66e <vprintf+0x60>
        s = va_arg(ap, char*);
 7c8:	8b4e                	mv	s6,s3
      state = 0;
 7ca:	4981                	li	s3,0
 7cc:	b54d                	j	66e <vprintf+0x60>
    }
  }
}
 7ce:	70e6                	ld	ra,120(sp)
 7d0:	7446                	ld	s0,112(sp)
 7d2:	74a6                	ld	s1,104(sp)
 7d4:	7906                	ld	s2,96(sp)
 7d6:	69e6                	ld	s3,88(sp)
 7d8:	6a46                	ld	s4,80(sp)
 7da:	6aa6                	ld	s5,72(sp)
 7dc:	6b06                	ld	s6,64(sp)
 7de:	7be2                	ld	s7,56(sp)
 7e0:	7c42                	ld	s8,48(sp)
 7e2:	7ca2                	ld	s9,40(sp)
 7e4:	7d02                	ld	s10,32(sp)
 7e6:	6de2                	ld	s11,24(sp)
 7e8:	6109                	addi	sp,sp,128
 7ea:	8082                	ret

00000000000007ec <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 7ec:	711d                	addi	sp,sp,-96
 7ee:	f406                	sd	ra,40(sp)
 7f0:	f022                	sd	s0,32(sp)
 7f2:	ec26                	sd	s1,24(sp)
 7f4:	e84a                	sd	s2,16(sp)
 7f6:	1800                	addi	s0,sp,48
 7f8:	84aa                	mv	s1,a0
 7fa:	e010                	sd	a2,0(s0)
 7fc:	e414                	sd	a3,8(s0)
 7fe:	e818                	sd	a4,16(s0)
 800:	ec1c                	sd	a5,24(s0)
 802:	03043023          	sd	a6,32(s0)
 806:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 80a:	fc843c23          	sd	s0,-40(s0)
  vprintf(fd, fmt, ap);
 80e:	8622                	mv	a2,s0
 810:	00000097          	auipc	ra,0x0
 814:	dfe080e7          	jalr	-514(ra) # 60e <vprintf>
	if(fd==1){
 818:	4785                	li	a5,1
 81a:	02f48963          	beq	s1,a5,84c <fprintf+0x60>
	  write(fd, printbuf, len);
 81e:	00000917          	auipc	s2,0x0
 822:	2a290913          	addi	s2,s2,674 # ac0 <len>
 826:	00092603          	lw	a2,0(s2)
 82a:	00000597          	auipc	a1,0x0
 82e:	4a658593          	addi	a1,a1,1190 # cd0 <printbuf>
 832:	8526                	mv	a0,s1
 834:	00000097          	auipc	ra,0x0
 838:	c4e080e7          	jalr	-946(ra) # 482 <write>
	  len=0;
 83c:	00092023          	sw	zero,0(s2)
  fflush(fd);
}
 840:	70a2                	ld	ra,40(sp)
 842:	7402                	ld	s0,32(sp)
 844:	64e2                	ld	s1,24(sp)
 846:	6942                	ld	s2,16(sp)
 848:	6125                	addi	sp,sp,96
 84a:	8082                	ret
	  printbuf[len]=0;
 84c:	00000517          	auipc	a0,0x0
 850:	48450513          	addi	a0,a0,1156 # cd0 <printbuf>
 854:	00000497          	auipc	s1,0x0
 858:	26c48493          	addi	s1,s1,620 # ac0 <len>
 85c:	409c                	lw	a5,0(s1)
 85e:	97aa                	add	a5,a5,a0
 860:	00078023          	sb	zero,0(a5)
	  sprint(printbuf);
 864:	00000097          	auipc	ra,0x0
 868:	cce080e7          	jalr	-818(ra) # 532 <sprint>
	  len=0;
 86c:	0004a023          	sw	zero,0(s1)
 870:	bfc1                	j	840 <fprintf+0x54>

0000000000000872 <printf>:

void
printf(const char *fmt, ...)
{
 872:	7159                	addi	sp,sp,-112
 874:	f406                	sd	ra,40(sp)
 876:	f022                	sd	s0,32(sp)
 878:	ec26                	sd	s1,24(sp)
 87a:	1800                	addi	s0,sp,48
 87c:	e40c                	sd	a1,8(s0)
 87e:	e810                	sd	a2,16(s0)
 880:	ec14                	sd	a3,24(s0)
 882:	f018                	sd	a4,32(s0)
 884:	f41c                	sd	a5,40(s0)
 886:	03043823          	sd	a6,48(s0)
 88a:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 88e:	00840613          	addi	a2,s0,8
 892:	fcc43c23          	sd	a2,-40(s0)
  vprintf(1, fmt, ap);
 896:	85aa                	mv	a1,a0
 898:	4505                	li	a0,1
 89a:	00000097          	auipc	ra,0x0
 89e:	d74080e7          	jalr	-652(ra) # 60e <vprintf>
	  printbuf[len]=0;
 8a2:	00000517          	auipc	a0,0x0
 8a6:	42e50513          	addi	a0,a0,1070 # cd0 <printbuf>
 8aa:	00000497          	auipc	s1,0x0
 8ae:	21648493          	addi	s1,s1,534 # ac0 <len>
 8b2:	409c                	lw	a5,0(s1)
 8b4:	97aa                	add	a5,a5,a0
 8b6:	00078023          	sb	zero,0(a5)
	  sprint(printbuf);
 8ba:	00000097          	auipc	ra,0x0
 8be:	c78080e7          	jalr	-904(ra) # 532 <sprint>
	  len=0;
 8c2:	0004a023          	sw	zero,0(s1)
  fflush(1);
}
 8c6:	70a2                	ld	ra,40(sp)
 8c8:	7402                	ld	s0,32(sp)
 8ca:	64e2                	ld	s1,24(sp)
 8cc:	6165                	addi	sp,sp,112
 8ce:	8082                	ret

00000000000008d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8d0:	1141                	addi	sp,sp,-16
 8d2:	e422                	sd	s0,8(sp)
 8d4:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8d6:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8da:	00000797          	auipc	a5,0x0
 8de:	1ee7b783          	ld	a5,494(a5) # ac8 <freep>
 8e2:	a805                	j	912 <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 8e4:	4618                	lw	a4,8(a2)
 8e6:	9db9                	addw	a1,a1,a4
 8e8:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 8ec:	6398                	ld	a4,0(a5)
 8ee:	6318                	ld	a4,0(a4)
 8f0:	fee53823          	sd	a4,-16(a0)
 8f4:	a091                	j	938 <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 8f6:	ff852703          	lw	a4,-8(a0)
 8fa:	9e39                	addw	a2,a2,a4
 8fc:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 8fe:	ff053703          	ld	a4,-16(a0)
 902:	e398                	sd	a4,0(a5)
 904:	a099                	j	94a <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 906:	6398                	ld	a4,0(a5)
 908:	00e7e463          	bltu	a5,a4,910 <free+0x40>
 90c:	00e6ea63          	bltu	a3,a4,920 <free+0x50>
{
 910:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 912:	fed7fae3          	bgeu	a5,a3,906 <free+0x36>
 916:	6398                	ld	a4,0(a5)
 918:	00e6e463          	bltu	a3,a4,920 <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 91c:	fee7eae3          	bltu	a5,a4,910 <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 920:	ff852583          	lw	a1,-8(a0)
 924:	6390                	ld	a2,0(a5)
 926:	02059713          	slli	a4,a1,0x20
 92a:	9301                	srli	a4,a4,0x20
 92c:	0712                	slli	a4,a4,0x4
 92e:	9736                	add	a4,a4,a3
 930:	fae60ae3          	beq	a2,a4,8e4 <free+0x14>
    bp->s.ptr = p->s.ptr;
 934:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 938:	4790                	lw	a2,8(a5)
 93a:	02061713          	slli	a4,a2,0x20
 93e:	9301                	srli	a4,a4,0x20
 940:	0712                	slli	a4,a4,0x4
 942:	973e                	add	a4,a4,a5
 944:	fae689e3          	beq	a3,a4,8f6 <free+0x26>
  } else
    p->s.ptr = bp;
 948:	e394                	sd	a3,0(a5)
  freep = p;
 94a:	00000717          	auipc	a4,0x0
 94e:	16f73f23          	sd	a5,382(a4) # ac8 <freep>
}
 952:	6422                	ld	s0,8(sp)
 954:	0141                	addi	sp,sp,16
 956:	8082                	ret

0000000000000958 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 958:	7139                	addi	sp,sp,-64
 95a:	fc06                	sd	ra,56(sp)
 95c:	f822                	sd	s0,48(sp)
 95e:	f426                	sd	s1,40(sp)
 960:	f04a                	sd	s2,32(sp)
 962:	ec4e                	sd	s3,24(sp)
 964:	e852                	sd	s4,16(sp)
 966:	e456                	sd	s5,8(sp)
 968:	e05a                	sd	s6,0(sp)
 96a:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 96c:	02051493          	slli	s1,a0,0x20
 970:	9081                	srli	s1,s1,0x20
 972:	04bd                	addi	s1,s1,15
 974:	8091                	srli	s1,s1,0x4
 976:	0014899b          	addiw	s3,s1,1
 97a:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 97c:	00000517          	auipc	a0,0x0
 980:	14c53503          	ld	a0,332(a0) # ac8 <freep>
 984:	c515                	beqz	a0,9b0 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 986:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 988:	4798                	lw	a4,8(a5)
 98a:	02977f63          	bgeu	a4,s1,9c8 <malloc+0x70>
 98e:	8a4e                	mv	s4,s3
 990:	0009871b          	sext.w	a4,s3
 994:	6685                	lui	a3,0x1
 996:	00d77363          	bgeu	a4,a3,99c <malloc+0x44>
 99a:	6a05                	lui	s4,0x1
 99c:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 9a0:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 9a4:	00000917          	auipc	s2,0x0
 9a8:	12490913          	addi	s2,s2,292 # ac8 <freep>
  if(p == (char*)-1)
 9ac:	5afd                	li	s5,-1
 9ae:	a88d                	j	a20 <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 9b0:	00000797          	auipc	a5,0x0
 9b4:	38878793          	addi	a5,a5,904 # d38 <base>
 9b8:	00000717          	auipc	a4,0x0
 9bc:	10f73823          	sd	a5,272(a4) # ac8 <freep>
 9c0:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 9c2:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 9c6:	b7e1                	j	98e <malloc+0x36>
      if(p->s.size == nunits)
 9c8:	02e48b63          	beq	s1,a4,9fe <malloc+0xa6>
        p->s.size -= nunits;
 9cc:	4137073b          	subw	a4,a4,s3
 9d0:	c798                	sw	a4,8(a5)
        p += p->s.size;
 9d2:	1702                	slli	a4,a4,0x20
 9d4:	9301                	srli	a4,a4,0x20
 9d6:	0712                	slli	a4,a4,0x4
 9d8:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 9da:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 9de:	00000717          	auipc	a4,0x0
 9e2:	0ea73523          	sd	a0,234(a4) # ac8 <freep>
      return (void*)(p + 1);
 9e6:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9ea:	70e2                	ld	ra,56(sp)
 9ec:	7442                	ld	s0,48(sp)
 9ee:	74a2                	ld	s1,40(sp)
 9f0:	7902                	ld	s2,32(sp)
 9f2:	69e2                	ld	s3,24(sp)
 9f4:	6a42                	ld	s4,16(sp)
 9f6:	6aa2                	ld	s5,8(sp)
 9f8:	6b02                	ld	s6,0(sp)
 9fa:	6121                	addi	sp,sp,64
 9fc:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 9fe:	6398                	ld	a4,0(a5)
 a00:	e118                	sd	a4,0(a0)
 a02:	bff1                	j	9de <malloc+0x86>
  hp->s.size = nu;
 a04:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 a08:	0541                	addi	a0,a0,16
 a0a:	00000097          	auipc	ra,0x0
 a0e:	ec6080e7          	jalr	-314(ra) # 8d0 <free>
  return freep;
 a12:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 a16:	d971                	beqz	a0,9ea <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a18:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 a1a:	4798                	lw	a4,8(a5)
 a1c:	fa9776e3          	bgeu	a4,s1,9c8 <malloc+0x70>
    if(p == freep)
 a20:	00093703          	ld	a4,0(s2)
 a24:	853e                	mv	a0,a5
 a26:	fef719e3          	bne	a4,a5,a18 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 a2a:	8552                	mv	a0,s4
 a2c:	00000097          	auipc	ra,0x0
 a30:	aa6080e7          	jalr	-1370(ra) # 4d2 <sbrk>
  if(p == (char*)-1)
 a34:	fd5518e3          	bne	a0,s5,a04 <malloc+0xac>
        return 0;
 a38:	4501                	li	a0,0
 a3a:	bf45                	j	9ea <malloc+0x92>
