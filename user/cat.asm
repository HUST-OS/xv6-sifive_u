
user/_cat:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <cat>:

char buf[512];

void
cat(int fd)
{
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	ec26                	sd	s1,24(sp)
   8:	e84a                	sd	s2,16(sp)
   a:	e44e                	sd	s3,8(sp)
   c:	1800                	addi	s0,sp,48
   e:	89aa                	mv	s3,a0
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
  10:	00001917          	auipc	s2,0x1
  14:	a2090913          	addi	s2,s2,-1504 # a30 <buf>
  18:	20000613          	li	a2,512
  1c:	85ca                	mv	a1,s2
  1e:	854e                	mv	a0,s3
  20:	00000097          	auipc	ra,0x0
  24:	3d0080e7          	jalr	976(ra) # 3f0 <read>
  28:	84aa                	mv	s1,a0
  2a:	02a05963          	blez	a0,5c <cat+0x5c>
    if (write(1, buf, n) != n) {
  2e:	8626                	mv	a2,s1
  30:	85ca                	mv	a1,s2
  32:	4505                	li	a0,1
  34:	00000097          	auipc	ra,0x0
  38:	3c4080e7          	jalr	964(ra) # 3f8 <write>
  3c:	fc950ee3          	beq	a0,s1,18 <cat+0x18>
      fprintf(2, "cat: write error\n");
  40:	00001597          	auipc	a1,0x1
  44:	97858593          	addi	a1,a1,-1672 # 9b8 <malloc+0xea>
  48:	4509                	li	a0,2
  4a:	00000097          	auipc	ra,0x0
  4e:	718080e7          	jalr	1816(ra) # 762 <fprintf>
      exit(1);
  52:	4505                	li	a0,1
  54:	00000097          	auipc	ra,0x0
  58:	384080e7          	jalr	900(ra) # 3d8 <exit>
    }
  }
  if(n < 0){
  5c:	00054963          	bltz	a0,6e <cat+0x6e>
    fprintf(2, "cat: read error\n");
    exit(1);
  }
}
  60:	70a2                	ld	ra,40(sp)
  62:	7402                	ld	s0,32(sp)
  64:	64e2                	ld	s1,24(sp)
  66:	6942                	ld	s2,16(sp)
  68:	69a2                	ld	s3,8(sp)
  6a:	6145                	addi	sp,sp,48
  6c:	8082                	ret
    fprintf(2, "cat: read error\n");
  6e:	00001597          	auipc	a1,0x1
  72:	96258593          	addi	a1,a1,-1694 # 9d0 <malloc+0x102>
  76:	4509                	li	a0,2
  78:	00000097          	auipc	ra,0x0
  7c:	6ea080e7          	jalr	1770(ra) # 762 <fprintf>
    exit(1);
  80:	4505                	li	a0,1
  82:	00000097          	auipc	ra,0x0
  86:	356080e7          	jalr	854(ra) # 3d8 <exit>

000000000000008a <main>:

int
main(int argc, char *argv[])
{
  8a:	7179                	addi	sp,sp,-48
  8c:	f406                	sd	ra,40(sp)
  8e:	f022                	sd	s0,32(sp)
  90:	ec26                	sd	s1,24(sp)
  92:	e84a                	sd	s2,16(sp)
  94:	e44e                	sd	s3,8(sp)
  96:	e052                	sd	s4,0(sp)
  98:	1800                	addi	s0,sp,48
  int fd, i;

  if(argc <= 1){
  9a:	4785                	li	a5,1
  9c:	04a7d763          	bge	a5,a0,ea <main+0x60>
  a0:	00858913          	addi	s2,a1,8
  a4:	ffe5099b          	addiw	s3,a0,-2
  a8:	1982                	slli	s3,s3,0x20
  aa:	0209d993          	srli	s3,s3,0x20
  ae:	098e                	slli	s3,s3,0x3
  b0:	05c1                	addi	a1,a1,16
  b2:	99ae                	add	s3,s3,a1
    cat(0);
    exit(0);
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  b4:	4581                	li	a1,0
  b6:	00093503          	ld	a0,0(s2)
  ba:	00000097          	auipc	ra,0x0
  be:	35e080e7          	jalr	862(ra) # 418 <open>
  c2:	84aa                	mv	s1,a0
  c4:	02054d63          	bltz	a0,fe <main+0x74>
      fprintf(2, "cat: cannot open %s\n", argv[i]);
      exit(1);
    }
    cat(fd);
  c8:	00000097          	auipc	ra,0x0
  cc:	f38080e7          	jalr	-200(ra) # 0 <cat>
    close(fd);
  d0:	8526                	mv	a0,s1
  d2:	00000097          	auipc	ra,0x0
  d6:	32e080e7          	jalr	814(ra) # 400 <close>
  for(i = 1; i < argc; i++){
  da:	0921                	addi	s2,s2,8
  dc:	fd391ce3          	bne	s2,s3,b4 <main+0x2a>
  }
  exit(0);
  e0:	4501                	li	a0,0
  e2:	00000097          	auipc	ra,0x0
  e6:	2f6080e7          	jalr	758(ra) # 3d8 <exit>
    cat(0);
  ea:	4501                	li	a0,0
  ec:	00000097          	auipc	ra,0x0
  f0:	f14080e7          	jalr	-236(ra) # 0 <cat>
    exit(0);
  f4:	4501                	li	a0,0
  f6:	00000097          	auipc	ra,0x0
  fa:	2e2080e7          	jalr	738(ra) # 3d8 <exit>
      fprintf(2, "cat: cannot open %s\n", argv[i]);
  fe:	00093603          	ld	a2,0(s2)
 102:	00001597          	auipc	a1,0x1
 106:	8e658593          	addi	a1,a1,-1818 # 9e8 <malloc+0x11a>
 10a:	4509                	li	a0,2
 10c:	00000097          	auipc	ra,0x0
 110:	656080e7          	jalr	1622(ra) # 762 <fprintf>
      exit(1);
 114:	4505                	li	a0,1
 116:	00000097          	auipc	ra,0x0
 11a:	2c2080e7          	jalr	706(ra) # 3d8 <exit>

000000000000011e <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
 11e:	1141                	addi	sp,sp,-16
 120:	e422                	sd	s0,8(sp)
 122:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 124:	87aa                	mv	a5,a0
 126:	0585                	addi	a1,a1,1
 128:	0785                	addi	a5,a5,1
 12a:	fff5c703          	lbu	a4,-1(a1)
 12e:	fee78fa3          	sb	a4,-1(a5)
 132:	fb75                	bnez	a4,126 <strcpy+0x8>
    ;
  return os;
}
 134:	6422                	ld	s0,8(sp)
 136:	0141                	addi	sp,sp,16
 138:	8082                	ret

000000000000013a <strcat>:

char*
strcat(char *s, const char *t)
{
 13a:	1141                	addi	sp,sp,-16
 13c:	e422                	sd	s0,8(sp)
 13e:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
 140:	00054783          	lbu	a5,0(a0)
 144:	c385                	beqz	a5,164 <strcat+0x2a>
 146:	87aa                	mv	a5,a0
    s++;
 148:	0785                	addi	a5,a5,1
  while(*s)
 14a:	0007c703          	lbu	a4,0(a5)
 14e:	ff6d                	bnez	a4,148 <strcat+0xe>
  while((*s++ = *t++))
 150:	0585                	addi	a1,a1,1
 152:	0785                	addi	a5,a5,1
 154:	fff5c703          	lbu	a4,-1(a1)
 158:	fee78fa3          	sb	a4,-1(a5)
 15c:	fb75                	bnez	a4,150 <strcat+0x16>
    ;
  return os;
}
 15e:	6422                	ld	s0,8(sp)
 160:	0141                	addi	sp,sp,16
 162:	8082                	ret
  while(*s)
 164:	87aa                	mv	a5,a0
 166:	b7ed                	j	150 <strcat+0x16>

0000000000000168 <strcmp>:


int
strcmp(const char *p, const char *q)
{
 168:	1141                	addi	sp,sp,-16
 16a:	e422                	sd	s0,8(sp)
 16c:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 16e:	00054783          	lbu	a5,0(a0)
 172:	cb91                	beqz	a5,186 <strcmp+0x1e>
 174:	0005c703          	lbu	a4,0(a1)
 178:	00f71763          	bne	a4,a5,186 <strcmp+0x1e>
    p++, q++;
 17c:	0505                	addi	a0,a0,1
 17e:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 180:	00054783          	lbu	a5,0(a0)
 184:	fbe5                	bnez	a5,174 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 186:	0005c503          	lbu	a0,0(a1)
}
 18a:	40a7853b          	subw	a0,a5,a0
 18e:	6422                	ld	s0,8(sp)
 190:	0141                	addi	sp,sp,16
 192:	8082                	ret

0000000000000194 <strlen>:

uint
strlen(const char *s)
{
 194:	1141                	addi	sp,sp,-16
 196:	e422                	sd	s0,8(sp)
 198:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 19a:	00054783          	lbu	a5,0(a0)
 19e:	cf91                	beqz	a5,1ba <strlen+0x26>
 1a0:	0505                	addi	a0,a0,1
 1a2:	87aa                	mv	a5,a0
 1a4:	4685                	li	a3,1
 1a6:	9e89                	subw	a3,a3,a0
 1a8:	00f6853b          	addw	a0,a3,a5
 1ac:	0785                	addi	a5,a5,1
 1ae:	fff7c703          	lbu	a4,-1(a5)
 1b2:	fb7d                	bnez	a4,1a8 <strlen+0x14>
    ;
  return n;
}
 1b4:	6422                	ld	s0,8(sp)
 1b6:	0141                	addi	sp,sp,16
 1b8:	8082                	ret
  for(n = 0; s[n]; n++)
 1ba:	4501                	li	a0,0
 1bc:	bfe5                	j	1b4 <strlen+0x20>

00000000000001be <memset>:

void*
memset(void *dst, int c, uint n)
{
 1be:	1141                	addi	sp,sp,-16
 1c0:	e422                	sd	s0,8(sp)
 1c2:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 1c4:	ce09                	beqz	a2,1de <memset+0x20>
 1c6:	87aa                	mv	a5,a0
 1c8:	fff6071b          	addiw	a4,a2,-1
 1cc:	1702                	slli	a4,a4,0x20
 1ce:	9301                	srli	a4,a4,0x20
 1d0:	0705                	addi	a4,a4,1
 1d2:	972a                	add	a4,a4,a0
    cdst[i] = c;
 1d4:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 1d8:	0785                	addi	a5,a5,1
 1da:	fee79de3          	bne	a5,a4,1d4 <memset+0x16>
  }
  return dst;
}
 1de:	6422                	ld	s0,8(sp)
 1e0:	0141                	addi	sp,sp,16
 1e2:	8082                	ret

00000000000001e4 <strchr>:

char*
strchr(const char *s, char c)
{
 1e4:	1141                	addi	sp,sp,-16
 1e6:	e422                	sd	s0,8(sp)
 1e8:	0800                	addi	s0,sp,16
  for(; *s; s++)
 1ea:	00054783          	lbu	a5,0(a0)
 1ee:	cb99                	beqz	a5,204 <strchr+0x20>
    if(*s == c)
 1f0:	00f58763          	beq	a1,a5,1fe <strchr+0x1a>
  for(; *s; s++)
 1f4:	0505                	addi	a0,a0,1
 1f6:	00054783          	lbu	a5,0(a0)
 1fa:	fbfd                	bnez	a5,1f0 <strchr+0xc>
      return (char*)s;
  return 0;
 1fc:	4501                	li	a0,0
}
 1fe:	6422                	ld	s0,8(sp)
 200:	0141                	addi	sp,sp,16
 202:	8082                	ret
  return 0;
 204:	4501                	li	a0,0
 206:	bfe5                	j	1fe <strchr+0x1a>

0000000000000208 <gets>:

char*
gets(char *buf, int max)
{
 208:	711d                	addi	sp,sp,-96
 20a:	ec86                	sd	ra,88(sp)
 20c:	e8a2                	sd	s0,80(sp)
 20e:	e4a6                	sd	s1,72(sp)
 210:	e0ca                	sd	s2,64(sp)
 212:	fc4e                	sd	s3,56(sp)
 214:	f852                	sd	s4,48(sp)
 216:	f456                	sd	s5,40(sp)
 218:	f05a                	sd	s6,32(sp)
 21a:	ec5e                	sd	s7,24(sp)
 21c:	1080                	addi	s0,sp,96
 21e:	8baa                	mv	s7,a0
 220:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 222:	892a                	mv	s2,a0
 224:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 226:	4aa9                	li	s5,10
 228:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 22a:	89a6                	mv	s3,s1
 22c:	2485                	addiw	s1,s1,1
 22e:	0344d863          	bge	s1,s4,25e <gets+0x56>
    cc = read(0, &c, 1);
 232:	4605                	li	a2,1
 234:	faf40593          	addi	a1,s0,-81
 238:	4501                	li	a0,0
 23a:	00000097          	auipc	ra,0x0
 23e:	1b6080e7          	jalr	438(ra) # 3f0 <read>
    if(cc < 1)
 242:	00a05e63          	blez	a0,25e <gets+0x56>
    buf[i++] = c;
 246:	faf44783          	lbu	a5,-81(s0)
 24a:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 24e:	01578763          	beq	a5,s5,25c <gets+0x54>
 252:	0905                	addi	s2,s2,1
 254:	fd679be3          	bne	a5,s6,22a <gets+0x22>
  for(i=0; i+1 < max; ){
 258:	89a6                	mv	s3,s1
 25a:	a011                	j	25e <gets+0x56>
 25c:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 25e:	99de                	add	s3,s3,s7
 260:	00098023          	sb	zero,0(s3)
  return buf;
}
 264:	855e                	mv	a0,s7
 266:	60e6                	ld	ra,88(sp)
 268:	6446                	ld	s0,80(sp)
 26a:	64a6                	ld	s1,72(sp)
 26c:	6906                	ld	s2,64(sp)
 26e:	79e2                	ld	s3,56(sp)
 270:	7a42                	ld	s4,48(sp)
 272:	7aa2                	ld	s5,40(sp)
 274:	7b02                	ld	s6,32(sp)
 276:	6be2                	ld	s7,24(sp)
 278:	6125                	addi	sp,sp,96
 27a:	8082                	ret

000000000000027c <stat>:

int
stat(const char *n, struct stat *st)
{
 27c:	1101                	addi	sp,sp,-32
 27e:	ec06                	sd	ra,24(sp)
 280:	e822                	sd	s0,16(sp)
 282:	e426                	sd	s1,8(sp)
 284:	e04a                	sd	s2,0(sp)
 286:	1000                	addi	s0,sp,32
 288:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 28a:	4581                	li	a1,0
 28c:	00000097          	auipc	ra,0x0
 290:	18c080e7          	jalr	396(ra) # 418 <open>
  if(fd < 0)
 294:	02054563          	bltz	a0,2be <stat+0x42>
 298:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 29a:	85ca                	mv	a1,s2
 29c:	00000097          	auipc	ra,0x0
 2a0:	184080e7          	jalr	388(ra) # 420 <fstat>
 2a4:	892a                	mv	s2,a0
  close(fd);
 2a6:	8526                	mv	a0,s1
 2a8:	00000097          	auipc	ra,0x0
 2ac:	158080e7          	jalr	344(ra) # 400 <close>
  return r;
}
 2b0:	854a                	mv	a0,s2
 2b2:	60e2                	ld	ra,24(sp)
 2b4:	6442                	ld	s0,16(sp)
 2b6:	64a2                	ld	s1,8(sp)
 2b8:	6902                	ld	s2,0(sp)
 2ba:	6105                	addi	sp,sp,32
 2bc:	8082                	ret
    return -1;
 2be:	597d                	li	s2,-1
 2c0:	bfc5                	j	2b0 <stat+0x34>

00000000000002c2 <atoi>:

int
atoi(const char *s)
{
 2c2:	1141                	addi	sp,sp,-16
 2c4:	e422                	sd	s0,8(sp)
 2c6:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 2c8:	00054703          	lbu	a4,0(a0)
 2cc:	02d00793          	li	a5,45
  int neg = 1;
 2d0:	4805                	li	a6,1
  if (*s == '-') {
 2d2:	04f70363          	beq	a4,a5,318 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 2d6:	00054683          	lbu	a3,0(a0)
 2da:	fd06879b          	addiw	a5,a3,-48
 2de:	0ff7f793          	andi	a5,a5,255
 2e2:	4725                	li	a4,9
 2e4:	02f76d63          	bltu	a4,a5,31e <atoi+0x5c>
  n = 0;
 2e8:	4601                	li	a2,0
  while('0' <= *s && *s <= '9')
 2ea:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 2ec:	0505                	addi	a0,a0,1
 2ee:	0026179b          	slliw	a5,a2,0x2
 2f2:	9fb1                	addw	a5,a5,a2
 2f4:	0017979b          	slliw	a5,a5,0x1
 2f8:	9fb5                	addw	a5,a5,a3
 2fa:	fd07861b          	addiw	a2,a5,-48
  while('0' <= *s && *s <= '9')
 2fe:	00054683          	lbu	a3,0(a0)
 302:	fd06871b          	addiw	a4,a3,-48
 306:	0ff77713          	andi	a4,a4,255
 30a:	fee5f1e3          	bgeu	a1,a4,2ec <atoi+0x2a>
  return n * neg;
}
 30e:	02c8053b          	mulw	a0,a6,a2
 312:	6422                	ld	s0,8(sp)
 314:	0141                	addi	sp,sp,16
 316:	8082                	ret
    s++;
 318:	0505                	addi	a0,a0,1
    neg = -1;
 31a:	587d                	li	a6,-1
 31c:	bf6d                	j	2d6 <atoi+0x14>
  n = 0;
 31e:	4601                	li	a2,0
 320:	b7fd                	j	30e <atoi+0x4c>

0000000000000322 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 322:	1141                	addi	sp,sp,-16
 324:	e422                	sd	s0,8(sp)
 326:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 328:	02b57663          	bgeu	a0,a1,354 <memmove+0x32>
    while(n-- > 0)
 32c:	02c05163          	blez	a2,34e <memmove+0x2c>
 330:	fff6079b          	addiw	a5,a2,-1
 334:	1782                	slli	a5,a5,0x20
 336:	9381                	srli	a5,a5,0x20
 338:	0785                	addi	a5,a5,1
 33a:	97aa                	add	a5,a5,a0
  dst = vdst;
 33c:	872a                	mv	a4,a0
      *dst++ = *src++;
 33e:	0585                	addi	a1,a1,1
 340:	0705                	addi	a4,a4,1
 342:	fff5c683          	lbu	a3,-1(a1)
 346:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 34a:	fee79ae3          	bne	a5,a4,33e <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 34e:	6422                	ld	s0,8(sp)
 350:	0141                	addi	sp,sp,16
 352:	8082                	ret
    dst += n;
 354:	00c50733          	add	a4,a0,a2
    src += n;
 358:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 35a:	fec05ae3          	blez	a2,34e <memmove+0x2c>
 35e:	fff6079b          	addiw	a5,a2,-1
 362:	1782                	slli	a5,a5,0x20
 364:	9381                	srli	a5,a5,0x20
 366:	fff7c793          	not	a5,a5
 36a:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 36c:	15fd                	addi	a1,a1,-1
 36e:	177d                	addi	a4,a4,-1
 370:	0005c683          	lbu	a3,0(a1)
 374:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 378:	fee79ae3          	bne	a5,a4,36c <memmove+0x4a>
 37c:	bfc9                	j	34e <memmove+0x2c>

000000000000037e <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 37e:	1141                	addi	sp,sp,-16
 380:	e422                	sd	s0,8(sp)
 382:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 384:	ca05                	beqz	a2,3b4 <memcmp+0x36>
 386:	fff6069b          	addiw	a3,a2,-1
 38a:	1682                	slli	a3,a3,0x20
 38c:	9281                	srli	a3,a3,0x20
 38e:	0685                	addi	a3,a3,1
 390:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 392:	00054783          	lbu	a5,0(a0)
 396:	0005c703          	lbu	a4,0(a1)
 39a:	00e79863          	bne	a5,a4,3aa <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 39e:	0505                	addi	a0,a0,1
    p2++;
 3a0:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 3a2:	fed518e3          	bne	a0,a3,392 <memcmp+0x14>
  }
  return 0;
 3a6:	4501                	li	a0,0
 3a8:	a019                	j	3ae <memcmp+0x30>
      return *p1 - *p2;
 3aa:	40e7853b          	subw	a0,a5,a4
}
 3ae:	6422                	ld	s0,8(sp)
 3b0:	0141                	addi	sp,sp,16
 3b2:	8082                	ret
  return 0;
 3b4:	4501                	li	a0,0
 3b6:	bfe5                	j	3ae <memcmp+0x30>

00000000000003b8 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 3b8:	1141                	addi	sp,sp,-16
 3ba:	e406                	sd	ra,8(sp)
 3bc:	e022                	sd	s0,0(sp)
 3be:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 3c0:	00000097          	auipc	ra,0x0
 3c4:	f62080e7          	jalr	-158(ra) # 322 <memmove>
}
 3c8:	60a2                	ld	ra,8(sp)
 3ca:	6402                	ld	s0,0(sp)
 3cc:	0141                	addi	sp,sp,16
 3ce:	8082                	ret

00000000000003d0 <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 3d0:	4885                	li	a7,1
 ecall
 3d2:	00000073          	ecall
 ret
 3d6:	8082                	ret

00000000000003d8 <exit>:
.global exit
exit:
 li a7, SYS_exit
 3d8:	4889                	li	a7,2
 ecall
 3da:	00000073          	ecall
 ret
 3de:	8082                	ret

00000000000003e0 <wait>:
.global wait
wait:
 li a7, SYS_wait
 3e0:	488d                	li	a7,3
 ecall
 3e2:	00000073          	ecall
 ret
 3e6:	8082                	ret

00000000000003e8 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 3e8:	4891                	li	a7,4
 ecall
 3ea:	00000073          	ecall
 ret
 3ee:	8082                	ret

00000000000003f0 <read>:
.global read
read:
 li a7, SYS_read
 3f0:	4895                	li	a7,5
 ecall
 3f2:	00000073          	ecall
 ret
 3f6:	8082                	ret

00000000000003f8 <write>:
.global write
write:
 li a7, SYS_write
 3f8:	48c1                	li	a7,16
 ecall
 3fa:	00000073          	ecall
 ret
 3fe:	8082                	ret

0000000000000400 <close>:
.global close
close:
 li a7, SYS_close
 400:	48d5                	li	a7,21
 ecall
 402:	00000073          	ecall
 ret
 406:	8082                	ret

0000000000000408 <kill>:
.global kill
kill:
 li a7, SYS_kill
 408:	4899                	li	a7,6
 ecall
 40a:	00000073          	ecall
 ret
 40e:	8082                	ret

0000000000000410 <exec>:
.global exec
exec:
 li a7, SYS_exec
 410:	489d                	li	a7,7
 ecall
 412:	00000073          	ecall
 ret
 416:	8082                	ret

0000000000000418 <open>:
.global open
open:
 li a7, SYS_open
 418:	48bd                	li	a7,15
 ecall
 41a:	00000073          	ecall
 ret
 41e:	8082                	ret

0000000000000420 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 420:	48a1                	li	a7,8
 ecall
 422:	00000073          	ecall
 ret
 426:	8082                	ret

0000000000000428 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 428:	48d1                	li	a7,20
 ecall
 42a:	00000073          	ecall
 ret
 42e:	8082                	ret

0000000000000430 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 430:	48a5                	li	a7,9
 ecall
 432:	00000073          	ecall
 ret
 436:	8082                	ret

0000000000000438 <dup>:
.global dup
dup:
 li a7, SYS_dup
 438:	48a9                	li	a7,10
 ecall
 43a:	00000073          	ecall
 ret
 43e:	8082                	ret

0000000000000440 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 440:	48ad                	li	a7,11
 ecall
 442:	00000073          	ecall
 ret
 446:	8082                	ret

0000000000000448 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 448:	48b1                	li	a7,12
 ecall
 44a:	00000073          	ecall
 ret
 44e:	8082                	ret

0000000000000450 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 450:	48b5                	li	a7,13
 ecall
 452:	00000073          	ecall
 ret
 456:	8082                	ret

0000000000000458 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 458:	48b9                	li	a7,14
 ecall
 45a:	00000073          	ecall
 ret
 45e:	8082                	ret

0000000000000460 <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 460:	48d9                	li	a7,22
 ecall
 462:	00000073          	ecall
 ret
 466:	8082                	ret

0000000000000468 <dev>:
.global dev
dev:
 li a7, SYS_dev
 468:	48dd                	li	a7,23
 ecall
 46a:	00000073          	ecall
 ret
 46e:	8082                	ret

0000000000000470 <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 470:	48e1                	li	a7,24
 ecall
 472:	00000073          	ecall
 ret
 476:	8082                	ret

0000000000000478 <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 478:	48e5                	li	a7,25
 ecall
 47a:	00000073          	ecall
 ret
 47e:	8082                	ret

0000000000000480 <remove>:
.global remove
remove:
 li a7, SYS_remove
 480:	48c5                	li	a7,17
 ecall
 482:	00000073          	ecall
 ret
 486:	8082                	ret

0000000000000488 <trace>:
.global trace
trace:
 li a7, SYS_trace
 488:	48c9                	li	a7,18
 ecall
 48a:	00000073          	ecall
 ret
 48e:	8082                	ret

0000000000000490 <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 490:	48cd                	li	a7,19
 ecall
 492:	00000073          	ecall
 ret
 496:	8082                	ret

0000000000000498 <rename>:
.global rename
rename:
 li a7, SYS_rename
 498:	48e9                	li	a7,26
 ecall
 49a:	00000073          	ecall
 ret
 49e:	8082                	ret

00000000000004a0 <checkchar>:
.global checkchar
checkchar:
 li a7, SYS_checkchar
 4a0:	48ed                	li	a7,27
 ecall
 4a2:	00000073          	ecall
 ret
 4a6:	8082                	ret

00000000000004a8 <sprint>:
.global sprint
sprint:
 li a7, SYS_sprint
 4a8:	48f1                	li	a7,28
 ecall
 4aa:	00000073          	ecall
 ret
 4ae:	8082                	ret

00000000000004b0 <putc>:
static char digits[] = "0123456789ABCDEF";
static char printbuf[100];
static int  len = 0;
static void
putc(int fd, char c)
{
 4b0:	1141                	addi	sp,sp,-16
 4b2:	e422                	sd	s0,8(sp)
 4b4:	0800                	addi	s0,sp,16
  printbuf[len++]=c;
 4b6:	00000797          	auipc	a5,0x0
 4ba:	56a78793          	addi	a5,a5,1386 # a20 <len>
 4be:	4398                	lw	a4,0(a5)
 4c0:	0017069b          	addiw	a3,a4,1
 4c4:	c394                	sw	a3,0(a5)
 4c6:	00000797          	auipc	a5,0x0
 4ca:	76a78793          	addi	a5,a5,1898 # c30 <printbuf>
 4ce:	97ba                	add	a5,a5,a4
 4d0:	00b78023          	sb	a1,0(a5)
}
 4d4:	6422                	ld	s0,8(sp)
 4d6:	0141                	addi	sp,sp,16
 4d8:	8082                	ret

00000000000004da <printint>:
	}
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4da:	7139                	addi	sp,sp,-64
 4dc:	fc06                	sd	ra,56(sp)
 4de:	f822                	sd	s0,48(sp)
 4e0:	f426                	sd	s1,40(sp)
 4e2:	f04a                	sd	s2,32(sp)
 4e4:	ec4e                	sd	s3,24(sp)
 4e6:	0080                	addi	s0,sp,64
 4e8:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4ea:	c299                	beqz	a3,4f0 <printint+0x16>
 4ec:	0805c863          	bltz	a1,57c <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 4f0:	2581                	sext.w	a1,a1
  neg = 0;
 4f2:	4881                	li	a7,0
 4f4:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 4f8:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 4fa:	2601                	sext.w	a2,a2
 4fc:	00000517          	auipc	a0,0x0
 500:	50c50513          	addi	a0,a0,1292 # a08 <digits>
 504:	883a                	mv	a6,a4
 506:	2705                	addiw	a4,a4,1
 508:	02c5f7bb          	remuw	a5,a1,a2
 50c:	1782                	slli	a5,a5,0x20
 50e:	9381                	srli	a5,a5,0x20
 510:	97aa                	add	a5,a5,a0
 512:	0007c783          	lbu	a5,0(a5)
 516:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 51a:	0005879b          	sext.w	a5,a1
 51e:	02c5d5bb          	divuw	a1,a1,a2
 522:	0685                	addi	a3,a3,1
 524:	fec7f0e3          	bgeu	a5,a2,504 <printint+0x2a>
  if(neg)
 528:	00088b63          	beqz	a7,53e <printint+0x64>
    buf[i++] = '-';
 52c:	fd040793          	addi	a5,s0,-48
 530:	973e                	add	a4,a4,a5
 532:	02d00793          	li	a5,45
 536:	fef70823          	sb	a5,-16(a4)
 53a:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 53e:	02e05863          	blez	a4,56e <printint+0x94>
 542:	fc040793          	addi	a5,s0,-64
 546:	00e78933          	add	s2,a5,a4
 54a:	fff78993          	addi	s3,a5,-1
 54e:	99ba                	add	s3,s3,a4
 550:	377d                	addiw	a4,a4,-1
 552:	1702                	slli	a4,a4,0x20
 554:	9301                	srli	a4,a4,0x20
 556:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 55a:	fff94583          	lbu	a1,-1(s2)
 55e:	8526                	mv	a0,s1
 560:	00000097          	auipc	ra,0x0
 564:	f50080e7          	jalr	-176(ra) # 4b0 <putc>
  while(--i >= 0)
 568:	197d                	addi	s2,s2,-1
 56a:	ff3918e3          	bne	s2,s3,55a <printint+0x80>
}
 56e:	70e2                	ld	ra,56(sp)
 570:	7442                	ld	s0,48(sp)
 572:	74a2                	ld	s1,40(sp)
 574:	7902                	ld	s2,32(sp)
 576:	69e2                	ld	s3,24(sp)
 578:	6121                	addi	sp,sp,64
 57a:	8082                	ret
    x = -xx;
 57c:	40b005bb          	negw	a1,a1
    neg = 1;
 580:	4885                	li	a7,1
    x = -xx;
 582:	bf8d                	j	4f4 <printint+0x1a>

0000000000000584 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 584:	7119                	addi	sp,sp,-128
 586:	fc86                	sd	ra,120(sp)
 588:	f8a2                	sd	s0,112(sp)
 58a:	f4a6                	sd	s1,104(sp)
 58c:	f0ca                	sd	s2,96(sp)
 58e:	ecce                	sd	s3,88(sp)
 590:	e8d2                	sd	s4,80(sp)
 592:	e4d6                	sd	s5,72(sp)
 594:	e0da                	sd	s6,64(sp)
 596:	fc5e                	sd	s7,56(sp)
 598:	f862                	sd	s8,48(sp)
 59a:	f466                	sd	s9,40(sp)
 59c:	f06a                	sd	s10,32(sp)
 59e:	ec6e                	sd	s11,24(sp)
 5a0:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 5a2:	0005c903          	lbu	s2,0(a1)
 5a6:	18090f63          	beqz	s2,744 <vprintf+0x1c0>
 5aa:	8aaa                	mv	s5,a0
 5ac:	8b32                	mv	s6,a2
 5ae:	00158493          	addi	s1,a1,1
  state = 0;
 5b2:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 5b4:	02500a13          	li	s4,37
      if(c == 'd'){
 5b8:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 5bc:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 5c0:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 5c4:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 5c8:	00000b97          	auipc	s7,0x0
 5cc:	440b8b93          	addi	s7,s7,1088 # a08 <digits>
 5d0:	a839                	j	5ee <vprintf+0x6a>
        putc(fd, c);
 5d2:	85ca                	mv	a1,s2
 5d4:	8556                	mv	a0,s5
 5d6:	00000097          	auipc	ra,0x0
 5da:	eda080e7          	jalr	-294(ra) # 4b0 <putc>
 5de:	a019                	j	5e4 <vprintf+0x60>
    } else if(state == '%'){
 5e0:	01498f63          	beq	s3,s4,5fe <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 5e4:	0485                	addi	s1,s1,1
 5e6:	fff4c903          	lbu	s2,-1(s1)
 5ea:	14090d63          	beqz	s2,744 <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 5ee:	0009079b          	sext.w	a5,s2
    if(state == 0){
 5f2:	fe0997e3          	bnez	s3,5e0 <vprintf+0x5c>
      if(c == '%'){
 5f6:	fd479ee3          	bne	a5,s4,5d2 <vprintf+0x4e>
        state = '%';
 5fa:	89be                	mv	s3,a5
 5fc:	b7e5                	j	5e4 <vprintf+0x60>
      if(c == 'd'){
 5fe:	05878063          	beq	a5,s8,63e <vprintf+0xba>
      } else if(c == 'l') {
 602:	05978c63          	beq	a5,s9,65a <vprintf+0xd6>
      } else if(c == 'x') {
 606:	07a78863          	beq	a5,s10,676 <vprintf+0xf2>
      } else if(c == 'p') {
 60a:	09b78463          	beq	a5,s11,692 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 60e:	07300713          	li	a4,115
 612:	0ce78663          	beq	a5,a4,6de <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 616:	06300713          	li	a4,99
 61a:	0ee78e63          	beq	a5,a4,716 <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 61e:	11478863          	beq	a5,s4,72e <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 622:	85d2                	mv	a1,s4
 624:	8556                	mv	a0,s5
 626:	00000097          	auipc	ra,0x0
 62a:	e8a080e7          	jalr	-374(ra) # 4b0 <putc>
        putc(fd, c);
 62e:	85ca                	mv	a1,s2
 630:	8556                	mv	a0,s5
 632:	00000097          	auipc	ra,0x0
 636:	e7e080e7          	jalr	-386(ra) # 4b0 <putc>
      }
      state = 0;
 63a:	4981                	li	s3,0
 63c:	b765                	j	5e4 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 63e:	008b0913          	addi	s2,s6,8
 642:	4685                	li	a3,1
 644:	4629                	li	a2,10
 646:	000b2583          	lw	a1,0(s6)
 64a:	8556                	mv	a0,s5
 64c:	00000097          	auipc	ra,0x0
 650:	e8e080e7          	jalr	-370(ra) # 4da <printint>
 654:	8b4a                	mv	s6,s2
      state = 0;
 656:	4981                	li	s3,0
 658:	b771                	j	5e4 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 65a:	008b0913          	addi	s2,s6,8
 65e:	4681                	li	a3,0
 660:	4629                	li	a2,10
 662:	000b2583          	lw	a1,0(s6)
 666:	8556                	mv	a0,s5
 668:	00000097          	auipc	ra,0x0
 66c:	e72080e7          	jalr	-398(ra) # 4da <printint>
 670:	8b4a                	mv	s6,s2
      state = 0;
 672:	4981                	li	s3,0
 674:	bf85                	j	5e4 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 676:	008b0913          	addi	s2,s6,8
 67a:	4681                	li	a3,0
 67c:	4641                	li	a2,16
 67e:	000b2583          	lw	a1,0(s6)
 682:	8556                	mv	a0,s5
 684:	00000097          	auipc	ra,0x0
 688:	e56080e7          	jalr	-426(ra) # 4da <printint>
 68c:	8b4a                	mv	s6,s2
      state = 0;
 68e:	4981                	li	s3,0
 690:	bf91                	j	5e4 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 692:	008b0793          	addi	a5,s6,8
 696:	f8f43423          	sd	a5,-120(s0)
 69a:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 69e:	03000593          	li	a1,48
 6a2:	8556                	mv	a0,s5
 6a4:	00000097          	auipc	ra,0x0
 6a8:	e0c080e7          	jalr	-500(ra) # 4b0 <putc>
  putc(fd, 'x');
 6ac:	85ea                	mv	a1,s10
 6ae:	8556                	mv	a0,s5
 6b0:	00000097          	auipc	ra,0x0
 6b4:	e00080e7          	jalr	-512(ra) # 4b0 <putc>
 6b8:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 6ba:	03c9d793          	srli	a5,s3,0x3c
 6be:	97de                	add	a5,a5,s7
 6c0:	0007c583          	lbu	a1,0(a5)
 6c4:	8556                	mv	a0,s5
 6c6:	00000097          	auipc	ra,0x0
 6ca:	dea080e7          	jalr	-534(ra) # 4b0 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 6ce:	0992                	slli	s3,s3,0x4
 6d0:	397d                	addiw	s2,s2,-1
 6d2:	fe0914e3          	bnez	s2,6ba <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 6d6:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 6da:	4981                	li	s3,0
 6dc:	b721                	j	5e4 <vprintf+0x60>
        s = va_arg(ap, char*);
 6de:	008b0993          	addi	s3,s6,8
 6e2:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 6e6:	02090163          	beqz	s2,708 <vprintf+0x184>
        while(*s != 0){
 6ea:	00094583          	lbu	a1,0(s2)
 6ee:	c9a1                	beqz	a1,73e <vprintf+0x1ba>
          putc(fd, *s);
 6f0:	8556                	mv	a0,s5
 6f2:	00000097          	auipc	ra,0x0
 6f6:	dbe080e7          	jalr	-578(ra) # 4b0 <putc>
          s++;
 6fa:	0905                	addi	s2,s2,1
        while(*s != 0){
 6fc:	00094583          	lbu	a1,0(s2)
 700:	f9e5                	bnez	a1,6f0 <vprintf+0x16c>
        s = va_arg(ap, char*);
 702:	8b4e                	mv	s6,s3
      state = 0;
 704:	4981                	li	s3,0
 706:	bdf9                	j	5e4 <vprintf+0x60>
          s = "(null)";
 708:	00000917          	auipc	s2,0x0
 70c:	2f890913          	addi	s2,s2,760 # a00 <malloc+0x132>
        while(*s != 0){
 710:	02800593          	li	a1,40
 714:	bff1                	j	6f0 <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 716:	008b0913          	addi	s2,s6,8
 71a:	000b4583          	lbu	a1,0(s6)
 71e:	8556                	mv	a0,s5
 720:	00000097          	auipc	ra,0x0
 724:	d90080e7          	jalr	-624(ra) # 4b0 <putc>
 728:	8b4a                	mv	s6,s2
      state = 0;
 72a:	4981                	li	s3,0
 72c:	bd65                	j	5e4 <vprintf+0x60>
        putc(fd, c);
 72e:	85d2                	mv	a1,s4
 730:	8556                	mv	a0,s5
 732:	00000097          	auipc	ra,0x0
 736:	d7e080e7          	jalr	-642(ra) # 4b0 <putc>
      state = 0;
 73a:	4981                	li	s3,0
 73c:	b565                	j	5e4 <vprintf+0x60>
        s = va_arg(ap, char*);
 73e:	8b4e                	mv	s6,s3
      state = 0;
 740:	4981                	li	s3,0
 742:	b54d                	j	5e4 <vprintf+0x60>
    }
  }
}
 744:	70e6                	ld	ra,120(sp)
 746:	7446                	ld	s0,112(sp)
 748:	74a6                	ld	s1,104(sp)
 74a:	7906                	ld	s2,96(sp)
 74c:	69e6                	ld	s3,88(sp)
 74e:	6a46                	ld	s4,80(sp)
 750:	6aa6                	ld	s5,72(sp)
 752:	6b06                	ld	s6,64(sp)
 754:	7be2                	ld	s7,56(sp)
 756:	7c42                	ld	s8,48(sp)
 758:	7ca2                	ld	s9,40(sp)
 75a:	7d02                	ld	s10,32(sp)
 75c:	6de2                	ld	s11,24(sp)
 75e:	6109                	addi	sp,sp,128
 760:	8082                	ret

0000000000000762 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 762:	711d                	addi	sp,sp,-96
 764:	f406                	sd	ra,40(sp)
 766:	f022                	sd	s0,32(sp)
 768:	ec26                	sd	s1,24(sp)
 76a:	e84a                	sd	s2,16(sp)
 76c:	1800                	addi	s0,sp,48
 76e:	84aa                	mv	s1,a0
 770:	e010                	sd	a2,0(s0)
 772:	e414                	sd	a3,8(s0)
 774:	e818                	sd	a4,16(s0)
 776:	ec1c                	sd	a5,24(s0)
 778:	03043023          	sd	a6,32(s0)
 77c:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 780:	fc843c23          	sd	s0,-40(s0)
  vprintf(fd, fmt, ap);
 784:	8622                	mv	a2,s0
 786:	00000097          	auipc	ra,0x0
 78a:	dfe080e7          	jalr	-514(ra) # 584 <vprintf>
	if(fd==1){
 78e:	4785                	li	a5,1
 790:	02f48963          	beq	s1,a5,7c2 <fprintf+0x60>
	  write(fd, printbuf, len);
 794:	00000917          	auipc	s2,0x0
 798:	28c90913          	addi	s2,s2,652 # a20 <len>
 79c:	00092603          	lw	a2,0(s2)
 7a0:	00000597          	auipc	a1,0x0
 7a4:	49058593          	addi	a1,a1,1168 # c30 <printbuf>
 7a8:	8526                	mv	a0,s1
 7aa:	00000097          	auipc	ra,0x0
 7ae:	c4e080e7          	jalr	-946(ra) # 3f8 <write>
	  len=0;
 7b2:	00092023          	sw	zero,0(s2)
  fflush(fd);
}
 7b6:	70a2                	ld	ra,40(sp)
 7b8:	7402                	ld	s0,32(sp)
 7ba:	64e2                	ld	s1,24(sp)
 7bc:	6942                	ld	s2,16(sp)
 7be:	6125                	addi	sp,sp,96
 7c0:	8082                	ret
	  printbuf[len]=0;
 7c2:	00000517          	auipc	a0,0x0
 7c6:	46e50513          	addi	a0,a0,1134 # c30 <printbuf>
 7ca:	00000497          	auipc	s1,0x0
 7ce:	25648493          	addi	s1,s1,598 # a20 <len>
 7d2:	409c                	lw	a5,0(s1)
 7d4:	97aa                	add	a5,a5,a0
 7d6:	00078023          	sb	zero,0(a5)
	  sprint(printbuf);
 7da:	00000097          	auipc	ra,0x0
 7de:	cce080e7          	jalr	-818(ra) # 4a8 <sprint>
	  len=0;
 7e2:	0004a023          	sw	zero,0(s1)
 7e6:	bfc1                	j	7b6 <fprintf+0x54>

00000000000007e8 <printf>:

void
printf(const char *fmt, ...)
{
 7e8:	7159                	addi	sp,sp,-112
 7ea:	f406                	sd	ra,40(sp)
 7ec:	f022                	sd	s0,32(sp)
 7ee:	ec26                	sd	s1,24(sp)
 7f0:	1800                	addi	s0,sp,48
 7f2:	e40c                	sd	a1,8(s0)
 7f4:	e810                	sd	a2,16(s0)
 7f6:	ec14                	sd	a3,24(s0)
 7f8:	f018                	sd	a4,32(s0)
 7fa:	f41c                	sd	a5,40(s0)
 7fc:	03043823          	sd	a6,48(s0)
 800:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 804:	00840613          	addi	a2,s0,8
 808:	fcc43c23          	sd	a2,-40(s0)
  vprintf(1, fmt, ap);
 80c:	85aa                	mv	a1,a0
 80e:	4505                	li	a0,1
 810:	00000097          	auipc	ra,0x0
 814:	d74080e7          	jalr	-652(ra) # 584 <vprintf>
	  printbuf[len]=0;
 818:	00000517          	auipc	a0,0x0
 81c:	41850513          	addi	a0,a0,1048 # c30 <printbuf>
 820:	00000497          	auipc	s1,0x0
 824:	20048493          	addi	s1,s1,512 # a20 <len>
 828:	409c                	lw	a5,0(s1)
 82a:	97aa                	add	a5,a5,a0
 82c:	00078023          	sb	zero,0(a5)
	  sprint(printbuf);
 830:	00000097          	auipc	ra,0x0
 834:	c78080e7          	jalr	-904(ra) # 4a8 <sprint>
	  len=0;
 838:	0004a023          	sw	zero,0(s1)
  fflush(1);
}
 83c:	70a2                	ld	ra,40(sp)
 83e:	7402                	ld	s0,32(sp)
 840:	64e2                	ld	s1,24(sp)
 842:	6165                	addi	sp,sp,112
 844:	8082                	ret

0000000000000846 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 846:	1141                	addi	sp,sp,-16
 848:	e422                	sd	s0,8(sp)
 84a:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 84c:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 850:	00000797          	auipc	a5,0x0
 854:	1d87b783          	ld	a5,472(a5) # a28 <freep>
 858:	a805                	j	888 <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 85a:	4618                	lw	a4,8(a2)
 85c:	9db9                	addw	a1,a1,a4
 85e:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 862:	6398                	ld	a4,0(a5)
 864:	6318                	ld	a4,0(a4)
 866:	fee53823          	sd	a4,-16(a0)
 86a:	a091                	j	8ae <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 86c:	ff852703          	lw	a4,-8(a0)
 870:	9e39                	addw	a2,a2,a4
 872:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 874:	ff053703          	ld	a4,-16(a0)
 878:	e398                	sd	a4,0(a5)
 87a:	a099                	j	8c0 <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 87c:	6398                	ld	a4,0(a5)
 87e:	00e7e463          	bltu	a5,a4,886 <free+0x40>
 882:	00e6ea63          	bltu	a3,a4,896 <free+0x50>
{
 886:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 888:	fed7fae3          	bgeu	a5,a3,87c <free+0x36>
 88c:	6398                	ld	a4,0(a5)
 88e:	00e6e463          	bltu	a3,a4,896 <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 892:	fee7eae3          	bltu	a5,a4,886 <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 896:	ff852583          	lw	a1,-8(a0)
 89a:	6390                	ld	a2,0(a5)
 89c:	02059713          	slli	a4,a1,0x20
 8a0:	9301                	srli	a4,a4,0x20
 8a2:	0712                	slli	a4,a4,0x4
 8a4:	9736                	add	a4,a4,a3
 8a6:	fae60ae3          	beq	a2,a4,85a <free+0x14>
    bp->s.ptr = p->s.ptr;
 8aa:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 8ae:	4790                	lw	a2,8(a5)
 8b0:	02061713          	slli	a4,a2,0x20
 8b4:	9301                	srli	a4,a4,0x20
 8b6:	0712                	slli	a4,a4,0x4
 8b8:	973e                	add	a4,a4,a5
 8ba:	fae689e3          	beq	a3,a4,86c <free+0x26>
  } else
    p->s.ptr = bp;
 8be:	e394                	sd	a3,0(a5)
  freep = p;
 8c0:	00000717          	auipc	a4,0x0
 8c4:	16f73423          	sd	a5,360(a4) # a28 <freep>
}
 8c8:	6422                	ld	s0,8(sp)
 8ca:	0141                	addi	sp,sp,16
 8cc:	8082                	ret

00000000000008ce <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8ce:	7139                	addi	sp,sp,-64
 8d0:	fc06                	sd	ra,56(sp)
 8d2:	f822                	sd	s0,48(sp)
 8d4:	f426                	sd	s1,40(sp)
 8d6:	f04a                	sd	s2,32(sp)
 8d8:	ec4e                	sd	s3,24(sp)
 8da:	e852                	sd	s4,16(sp)
 8dc:	e456                	sd	s5,8(sp)
 8de:	e05a                	sd	s6,0(sp)
 8e0:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8e2:	02051493          	slli	s1,a0,0x20
 8e6:	9081                	srli	s1,s1,0x20
 8e8:	04bd                	addi	s1,s1,15
 8ea:	8091                	srli	s1,s1,0x4
 8ec:	0014899b          	addiw	s3,s1,1
 8f0:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 8f2:	00000517          	auipc	a0,0x0
 8f6:	13653503          	ld	a0,310(a0) # a28 <freep>
 8fa:	c515                	beqz	a0,926 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8fc:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 8fe:	4798                	lw	a4,8(a5)
 900:	02977f63          	bgeu	a4,s1,93e <malloc+0x70>
 904:	8a4e                	mv	s4,s3
 906:	0009871b          	sext.w	a4,s3
 90a:	6685                	lui	a3,0x1
 90c:	00d77363          	bgeu	a4,a3,912 <malloc+0x44>
 910:	6a05                	lui	s4,0x1
 912:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 916:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 91a:	00000917          	auipc	s2,0x0
 91e:	10e90913          	addi	s2,s2,270 # a28 <freep>
  if(p == (char*)-1)
 922:	5afd                	li	s5,-1
 924:	a88d                	j	996 <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 926:	00000797          	auipc	a5,0x0
 92a:	37278793          	addi	a5,a5,882 # c98 <base>
 92e:	00000717          	auipc	a4,0x0
 932:	0ef73d23          	sd	a5,250(a4) # a28 <freep>
 936:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 938:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 93c:	b7e1                	j	904 <malloc+0x36>
      if(p->s.size == nunits)
 93e:	02e48b63          	beq	s1,a4,974 <malloc+0xa6>
        p->s.size -= nunits;
 942:	4137073b          	subw	a4,a4,s3
 946:	c798                	sw	a4,8(a5)
        p += p->s.size;
 948:	1702                	slli	a4,a4,0x20
 94a:	9301                	srli	a4,a4,0x20
 94c:	0712                	slli	a4,a4,0x4
 94e:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 950:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 954:	00000717          	auipc	a4,0x0
 958:	0ca73a23          	sd	a0,212(a4) # a28 <freep>
      return (void*)(p + 1);
 95c:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 960:	70e2                	ld	ra,56(sp)
 962:	7442                	ld	s0,48(sp)
 964:	74a2                	ld	s1,40(sp)
 966:	7902                	ld	s2,32(sp)
 968:	69e2                	ld	s3,24(sp)
 96a:	6a42                	ld	s4,16(sp)
 96c:	6aa2                	ld	s5,8(sp)
 96e:	6b02                	ld	s6,0(sp)
 970:	6121                	addi	sp,sp,64
 972:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 974:	6398                	ld	a4,0(a5)
 976:	e118                	sd	a4,0(a0)
 978:	bff1                	j	954 <malloc+0x86>
  hp->s.size = nu;
 97a:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 97e:	0541                	addi	a0,a0,16
 980:	00000097          	auipc	ra,0x0
 984:	ec6080e7          	jalr	-314(ra) # 846 <free>
  return freep;
 988:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 98c:	d971                	beqz	a0,960 <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 98e:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 990:	4798                	lw	a4,8(a5)
 992:	fa9776e3          	bgeu	a4,s1,93e <malloc+0x70>
    if(p == freep)
 996:	00093703          	ld	a4,0(s2)
 99a:	853e                	mv	a0,a5
 99c:	fef719e3          	bne	a4,a5,98e <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 9a0:	8552                	mv	a0,s4
 9a2:	00000097          	auipc	ra,0x0
 9a6:	aa6080e7          	jalr	-1370(ra) # 448 <sbrk>
  if(p == (char*)-1)
 9aa:	fd5518e3          	bne	a0,s5,97a <malloc+0xac>
        return 0;
 9ae:	4501                	li	a0,0
 9b0:	bf45                	j	960 <malloc+0x92>
