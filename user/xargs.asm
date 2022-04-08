
user/_xargs:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <readline>:
/**
 * len:    include the 0 in the end.
 * return: the number of bytes that read successfully (0 in the end is not included)
 */
int readline(int fd, char *buf, int len)
{
   0:	7139                	addi	sp,sp,-64
   2:	fc06                	sd	ra,56(sp)
   4:	f822                	sd	s0,48(sp)
   6:	f426                	sd	s1,40(sp)
   8:	f04a                	sd	s2,32(sp)
   a:	ec4e                	sd	s3,24(sp)
   c:	e852                	sd	s4,16(sp)
   e:	e456                	sd	s5,8(sp)
  10:	0080                	addi	s0,sp,64
  12:	89aa                	mv	s3,a0
  14:	892e                	mv	s2,a1
    char *p = buf;
  16:	84ae                	mv	s1,a1
    while (read(fd, p, 1) != 0 && p < buf + len) {
  18:	00c58a33          	add	s4,a1,a2
        if (*p == '\n') {
  1c:	4aa9                	li	s5,10
    while (read(fd, p, 1) != 0 && p < buf + len) {
  1e:	a011                	j	22 <readline+0x22>
                continue;
            }
            *p = '\0';
            break;
        }
        p++;
  20:	0485                	addi	s1,s1,1
    while (read(fd, p, 1) != 0 && p < buf + len) {
  22:	4605                	li	a2,1
  24:	85a6                	mv	a1,s1
  26:	854e                	mv	a0,s3
  28:	00000097          	auipc	ra,0x0
  2c:	456080e7          	jalr	1110(ra) # 47e <read>
  30:	c905                	beqz	a0,60 <readline+0x60>
  32:	0344f763          	bgeu	s1,s4,60 <readline+0x60>
        if (*p == '\n') {
  36:	0004c783          	lbu	a5,0(s1)
  3a:	ff5793e3          	bne	a5,s5,20 <readline+0x20>
            if (p == buf) {     // ignore empty line
  3e:	01248f63          	beq	s1,s2,5c <readline+0x5c>
            *p = '\0';
  42:	00048023          	sb	zero,0(s1)
    }
    if (p == buf) {
        return 0;
    }
    return p - buf;
  46:	4124853b          	subw	a0,s1,s2
}
  4a:	70e2                	ld	ra,56(sp)
  4c:	7442                	ld	s0,48(sp)
  4e:	74a2                	ld	s1,40(sp)
  50:	7902                	ld	s2,32(sp)
  52:	69e2                	ld	s3,24(sp)
  54:	6a42                	ld	s4,16(sp)
  56:	6aa2                	ld	s5,8(sp)
  58:	6121                	addi	sp,sp,64
  5a:	8082                	ret
  5c:	84ca                	mv	s1,s2
  5e:	b7d1                	j	22 <readline+0x22>
        return 0;
  60:	4501                	li	a0,0
    if (p == buf) {
  62:	ff2484e3          	beq	s1,s2,4a <readline+0x4a>
  66:	b7c5                	j	46 <readline+0x46>

0000000000000068 <main>:

int main(int argc, char *argv[])
{
  68:	7161                	addi	sp,sp,-432
  6a:	f706                	sd	ra,424(sp)
  6c:	f322                	sd	s0,416(sp)
  6e:	ef26                	sd	s1,408(sp)
  70:	eb4a                	sd	s2,400(sp)
  72:	e74e                	sd	s3,392(sp)
  74:	1b00                	addi	s0,sp,432
    if (argc < 2) {
  76:	4785                	li	a5,1
  78:	08a7dc63          	bge	a5,a0,110 <main+0xa8>
  7c:	84aa                	mv	s1,a0
  7e:	892e                	mv	s2,a1
  80:	00858713          	addi	a4,a1,8
  84:	ed040793          	addi	a5,s0,-304
  88:	0005059b          	sext.w	a1,a0
  8c:	ffe5061b          	addiw	a2,a0,-2
  90:	1602                	slli	a2,a2,0x20
  92:	9201                	srli	a2,a2,0x20
  94:	060e                	slli	a2,a2,0x3
  96:	ed840693          	addi	a3,s0,-296
  9a:	9636                	add	a2,a2,a3
    }
    char *argvs[MAXARG];
    char buf[128];
    int i;
    for (i = 1; i < argc; i++) {
        argvs[i - 1] = argv[i];         // argvs[0] = COMMAND
  9c:	6314                	ld	a3,0(a4)
  9e:	e394                	sd	a3,0(a5)
    for (i = 1; i < argc; i++) {
  a0:	0721                	addi	a4,a4,8
  a2:	07a1                	addi	a5,a5,8
  a4:	fec79ce3          	bne	a5,a2,9c <main+0x34>
  a8:	fff5899b          	addiw	s3,a1,-1
    }
    i--;
    if (readline(0, buf, 128) == 0) {   // if there is no input
  ac:	08000613          	li	a2,128
  b0:	e5040593          	addi	a1,s0,-432
  b4:	4501                	li	a0,0
  b6:	00000097          	auipc	ra,0x0
  ba:	f4a080e7          	jalr	-182(ra) # 0 <readline>
  be:	c53d                	beqz	a0,12c <main+0xc4>
            printf("xargs: exec %s fail\n", argv[1]);
            exit(0);
        }
        wait(0);
    } else {
        argvs[i] = buf;
  c0:	00399593          	slli	a1,s3,0x3
  c4:	fd040793          	addi	a5,s0,-48
  c8:	95be                	add	a1,a1,a5
  ca:	e5040793          	addi	a5,s0,-432
  ce:	f0f5b023          	sd	a5,-256(a1)
        argvs[i + 1] = 0;
  d2:	048e                	slli	s1,s1,0x3
  d4:	fd040793          	addi	a5,s0,-48
  d8:	94be                	add	s1,s1,a5
  da:	f004b023          	sd	zero,-256(s1)
        do {
            if (fork() == 0) {
  de:	00000097          	auipc	ra,0x0
  e2:	380080e7          	jalr	896(ra) # 45e <fork>
  e6:	cd41                	beqz	a0,17e <main+0x116>
                exec(argv[1], argvs);
                printf("xargs: exec %s fail\n", argv[1]);
                exit(0);
            }
            wait(0);
  e8:	4501                	li	a0,0
  ea:	00000097          	auipc	ra,0x0
  ee:	384080e7          	jalr	900(ra) # 46e <wait>
        } while (readline(0, buf, 128) != 0);
  f2:	08000613          	li	a2,128
  f6:	e5040593          	addi	a1,s0,-432
  fa:	4501                	li	a0,0
  fc:	00000097          	auipc	ra,0x0
 100:	f04080e7          	jalr	-252(ra) # 0 <readline>
 104:	fd69                	bnez	a0,de <main+0x76>
    }
    exit(0);
 106:	4501                	li	a0,0
 108:	00000097          	auipc	ra,0x0
 10c:	35e080e7          	jalr	862(ra) # 466 <exit>
        fprintf(2, "Usage: xargs COMMAND [INITIAL-ARGS]...\n");
 110:	00001597          	auipc	a1,0x1
 114:	93058593          	addi	a1,a1,-1744 # a40 <malloc+0xe4>
 118:	4509                	li	a0,2
 11a:	00000097          	auipc	ra,0x0
 11e:	6d6080e7          	jalr	1750(ra) # 7f0 <fprintf>
        exit(-1);
 122:	557d                	li	a0,-1
 124:	00000097          	auipc	ra,0x0
 128:	342080e7          	jalr	834(ra) # 466 <exit>
        argvs[i] = 0;
 12c:	00399593          	slli	a1,s3,0x3
 130:	fd040793          	addi	a5,s0,-48
 134:	95be                	add	a1,a1,a5
 136:	f005b023          	sd	zero,-256(a1)
        if (fork() == 0) {
 13a:	00000097          	auipc	ra,0x0
 13e:	324080e7          	jalr	804(ra) # 45e <fork>
 142:	e905                	bnez	a0,172 <main+0x10a>
            exec(argv[1], argvs);
 144:	ed040593          	addi	a1,s0,-304
 148:	00893503          	ld	a0,8(s2)
 14c:	00000097          	auipc	ra,0x0
 150:	352080e7          	jalr	850(ra) # 49e <exec>
            printf("xargs: exec %s fail\n", argv[1]);
 154:	00893583          	ld	a1,8(s2)
 158:	00001517          	auipc	a0,0x1
 15c:	91050513          	addi	a0,a0,-1776 # a68 <malloc+0x10c>
 160:	00000097          	auipc	ra,0x0
 164:	716080e7          	jalr	1814(ra) # 876 <printf>
            exit(0);
 168:	4501                	li	a0,0
 16a:	00000097          	auipc	ra,0x0
 16e:	2fc080e7          	jalr	764(ra) # 466 <exit>
        wait(0);
 172:	4501                	li	a0,0
 174:	00000097          	auipc	ra,0x0
 178:	2fa080e7          	jalr	762(ra) # 46e <wait>
 17c:	b769                	j	106 <main+0x9e>
                exec(argv[1], argvs);
 17e:	ed040593          	addi	a1,s0,-304
 182:	00893503          	ld	a0,8(s2)
 186:	00000097          	auipc	ra,0x0
 18a:	318080e7          	jalr	792(ra) # 49e <exec>
                printf("xargs: exec %s fail\n", argv[1]);
 18e:	00893583          	ld	a1,8(s2)
 192:	00001517          	auipc	a0,0x1
 196:	8d650513          	addi	a0,a0,-1834 # a68 <malloc+0x10c>
 19a:	00000097          	auipc	ra,0x0
 19e:	6dc080e7          	jalr	1756(ra) # 876 <printf>
                exit(0);
 1a2:	4501                	li	a0,0
 1a4:	00000097          	auipc	ra,0x0
 1a8:	2c2080e7          	jalr	706(ra) # 466 <exit>

00000000000001ac <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
 1ac:	1141                	addi	sp,sp,-16
 1ae:	e422                	sd	s0,8(sp)
 1b0:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1b2:	87aa                	mv	a5,a0
 1b4:	0585                	addi	a1,a1,1
 1b6:	0785                	addi	a5,a5,1
 1b8:	fff5c703          	lbu	a4,-1(a1)
 1bc:	fee78fa3          	sb	a4,-1(a5)
 1c0:	fb75                	bnez	a4,1b4 <strcpy+0x8>
    ;
  return os;
}
 1c2:	6422                	ld	s0,8(sp)
 1c4:	0141                	addi	sp,sp,16
 1c6:	8082                	ret

00000000000001c8 <strcat>:

char*
strcat(char *s, const char *t)
{
 1c8:	1141                	addi	sp,sp,-16
 1ca:	e422                	sd	s0,8(sp)
 1cc:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
 1ce:	00054783          	lbu	a5,0(a0)
 1d2:	c385                	beqz	a5,1f2 <strcat+0x2a>
 1d4:	87aa                	mv	a5,a0
    s++;
 1d6:	0785                	addi	a5,a5,1
  while(*s)
 1d8:	0007c703          	lbu	a4,0(a5)
 1dc:	ff6d                	bnez	a4,1d6 <strcat+0xe>
  while((*s++ = *t++))
 1de:	0585                	addi	a1,a1,1
 1e0:	0785                	addi	a5,a5,1
 1e2:	fff5c703          	lbu	a4,-1(a1)
 1e6:	fee78fa3          	sb	a4,-1(a5)
 1ea:	fb75                	bnez	a4,1de <strcat+0x16>
    ;
  return os;
}
 1ec:	6422                	ld	s0,8(sp)
 1ee:	0141                	addi	sp,sp,16
 1f0:	8082                	ret
  while(*s)
 1f2:	87aa                	mv	a5,a0
 1f4:	b7ed                	j	1de <strcat+0x16>

00000000000001f6 <strcmp>:


int
strcmp(const char *p, const char *q)
{
 1f6:	1141                	addi	sp,sp,-16
 1f8:	e422                	sd	s0,8(sp)
 1fa:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 1fc:	00054783          	lbu	a5,0(a0)
 200:	cb91                	beqz	a5,214 <strcmp+0x1e>
 202:	0005c703          	lbu	a4,0(a1)
 206:	00f71763          	bne	a4,a5,214 <strcmp+0x1e>
    p++, q++;
 20a:	0505                	addi	a0,a0,1
 20c:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 20e:	00054783          	lbu	a5,0(a0)
 212:	fbe5                	bnez	a5,202 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 214:	0005c503          	lbu	a0,0(a1)
}
 218:	40a7853b          	subw	a0,a5,a0
 21c:	6422                	ld	s0,8(sp)
 21e:	0141                	addi	sp,sp,16
 220:	8082                	ret

0000000000000222 <strlen>:

uint
strlen(const char *s)
{
 222:	1141                	addi	sp,sp,-16
 224:	e422                	sd	s0,8(sp)
 226:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 228:	00054783          	lbu	a5,0(a0)
 22c:	cf91                	beqz	a5,248 <strlen+0x26>
 22e:	0505                	addi	a0,a0,1
 230:	87aa                	mv	a5,a0
 232:	4685                	li	a3,1
 234:	9e89                	subw	a3,a3,a0
 236:	00f6853b          	addw	a0,a3,a5
 23a:	0785                	addi	a5,a5,1
 23c:	fff7c703          	lbu	a4,-1(a5)
 240:	fb7d                	bnez	a4,236 <strlen+0x14>
    ;
  return n;
}
 242:	6422                	ld	s0,8(sp)
 244:	0141                	addi	sp,sp,16
 246:	8082                	ret
  for(n = 0; s[n]; n++)
 248:	4501                	li	a0,0
 24a:	bfe5                	j	242 <strlen+0x20>

000000000000024c <memset>:

void*
memset(void *dst, int c, uint n)
{
 24c:	1141                	addi	sp,sp,-16
 24e:	e422                	sd	s0,8(sp)
 250:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 252:	ce09                	beqz	a2,26c <memset+0x20>
 254:	87aa                	mv	a5,a0
 256:	fff6071b          	addiw	a4,a2,-1
 25a:	1702                	slli	a4,a4,0x20
 25c:	9301                	srli	a4,a4,0x20
 25e:	0705                	addi	a4,a4,1
 260:	972a                	add	a4,a4,a0
    cdst[i] = c;
 262:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 266:	0785                	addi	a5,a5,1
 268:	fee79de3          	bne	a5,a4,262 <memset+0x16>
  }
  return dst;
}
 26c:	6422                	ld	s0,8(sp)
 26e:	0141                	addi	sp,sp,16
 270:	8082                	ret

0000000000000272 <strchr>:

char*
strchr(const char *s, char c)
{
 272:	1141                	addi	sp,sp,-16
 274:	e422                	sd	s0,8(sp)
 276:	0800                	addi	s0,sp,16
  for(; *s; s++)
 278:	00054783          	lbu	a5,0(a0)
 27c:	cb99                	beqz	a5,292 <strchr+0x20>
    if(*s == c)
 27e:	00f58763          	beq	a1,a5,28c <strchr+0x1a>
  for(; *s; s++)
 282:	0505                	addi	a0,a0,1
 284:	00054783          	lbu	a5,0(a0)
 288:	fbfd                	bnez	a5,27e <strchr+0xc>
      return (char*)s;
  return 0;
 28a:	4501                	li	a0,0
}
 28c:	6422                	ld	s0,8(sp)
 28e:	0141                	addi	sp,sp,16
 290:	8082                	ret
  return 0;
 292:	4501                	li	a0,0
 294:	bfe5                	j	28c <strchr+0x1a>

0000000000000296 <gets>:

char*
gets(char *buf, int max)
{
 296:	711d                	addi	sp,sp,-96
 298:	ec86                	sd	ra,88(sp)
 29a:	e8a2                	sd	s0,80(sp)
 29c:	e4a6                	sd	s1,72(sp)
 29e:	e0ca                	sd	s2,64(sp)
 2a0:	fc4e                	sd	s3,56(sp)
 2a2:	f852                	sd	s4,48(sp)
 2a4:	f456                	sd	s5,40(sp)
 2a6:	f05a                	sd	s6,32(sp)
 2a8:	ec5e                	sd	s7,24(sp)
 2aa:	1080                	addi	s0,sp,96
 2ac:	8baa                	mv	s7,a0
 2ae:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2b0:	892a                	mv	s2,a0
 2b2:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 2b4:	4aa9                	li	s5,10
 2b6:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 2b8:	89a6                	mv	s3,s1
 2ba:	2485                	addiw	s1,s1,1
 2bc:	0344d863          	bge	s1,s4,2ec <gets+0x56>
    cc = read(0, &c, 1);
 2c0:	4605                	li	a2,1
 2c2:	faf40593          	addi	a1,s0,-81
 2c6:	4501                	li	a0,0
 2c8:	00000097          	auipc	ra,0x0
 2cc:	1b6080e7          	jalr	438(ra) # 47e <read>
    if(cc < 1)
 2d0:	00a05e63          	blez	a0,2ec <gets+0x56>
    buf[i++] = c;
 2d4:	faf44783          	lbu	a5,-81(s0)
 2d8:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 2dc:	01578763          	beq	a5,s5,2ea <gets+0x54>
 2e0:	0905                	addi	s2,s2,1
 2e2:	fd679be3          	bne	a5,s6,2b8 <gets+0x22>
  for(i=0; i+1 < max; ){
 2e6:	89a6                	mv	s3,s1
 2e8:	a011                	j	2ec <gets+0x56>
 2ea:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 2ec:	99de                	add	s3,s3,s7
 2ee:	00098023          	sb	zero,0(s3)
  return buf;
}
 2f2:	855e                	mv	a0,s7
 2f4:	60e6                	ld	ra,88(sp)
 2f6:	6446                	ld	s0,80(sp)
 2f8:	64a6                	ld	s1,72(sp)
 2fa:	6906                	ld	s2,64(sp)
 2fc:	79e2                	ld	s3,56(sp)
 2fe:	7a42                	ld	s4,48(sp)
 300:	7aa2                	ld	s5,40(sp)
 302:	7b02                	ld	s6,32(sp)
 304:	6be2                	ld	s7,24(sp)
 306:	6125                	addi	sp,sp,96
 308:	8082                	ret

000000000000030a <stat>:

int
stat(const char *n, struct stat *st)
{
 30a:	1101                	addi	sp,sp,-32
 30c:	ec06                	sd	ra,24(sp)
 30e:	e822                	sd	s0,16(sp)
 310:	e426                	sd	s1,8(sp)
 312:	e04a                	sd	s2,0(sp)
 314:	1000                	addi	s0,sp,32
 316:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 318:	4581                	li	a1,0
 31a:	00000097          	auipc	ra,0x0
 31e:	18c080e7          	jalr	396(ra) # 4a6 <open>
  if(fd < 0)
 322:	02054563          	bltz	a0,34c <stat+0x42>
 326:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 328:	85ca                	mv	a1,s2
 32a:	00000097          	auipc	ra,0x0
 32e:	184080e7          	jalr	388(ra) # 4ae <fstat>
 332:	892a                	mv	s2,a0
  close(fd);
 334:	8526                	mv	a0,s1
 336:	00000097          	auipc	ra,0x0
 33a:	158080e7          	jalr	344(ra) # 48e <close>
  return r;
}
 33e:	854a                	mv	a0,s2
 340:	60e2                	ld	ra,24(sp)
 342:	6442                	ld	s0,16(sp)
 344:	64a2                	ld	s1,8(sp)
 346:	6902                	ld	s2,0(sp)
 348:	6105                	addi	sp,sp,32
 34a:	8082                	ret
    return -1;
 34c:	597d                	li	s2,-1
 34e:	bfc5                	j	33e <stat+0x34>

0000000000000350 <atoi>:

int
atoi(const char *s)
{
 350:	1141                	addi	sp,sp,-16
 352:	e422                	sd	s0,8(sp)
 354:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 356:	00054703          	lbu	a4,0(a0)
 35a:	02d00793          	li	a5,45
  int neg = 1;
 35e:	4805                	li	a6,1
  if (*s == '-') {
 360:	04f70363          	beq	a4,a5,3a6 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 364:	00054683          	lbu	a3,0(a0)
 368:	fd06879b          	addiw	a5,a3,-48
 36c:	0ff7f793          	andi	a5,a5,255
 370:	4725                	li	a4,9
 372:	02f76d63          	bltu	a4,a5,3ac <atoi+0x5c>
  n = 0;
 376:	4601                	li	a2,0
  while('0' <= *s && *s <= '9')
 378:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 37a:	0505                	addi	a0,a0,1
 37c:	0026179b          	slliw	a5,a2,0x2
 380:	9fb1                	addw	a5,a5,a2
 382:	0017979b          	slliw	a5,a5,0x1
 386:	9fb5                	addw	a5,a5,a3
 388:	fd07861b          	addiw	a2,a5,-48
  while('0' <= *s && *s <= '9')
 38c:	00054683          	lbu	a3,0(a0)
 390:	fd06871b          	addiw	a4,a3,-48
 394:	0ff77713          	andi	a4,a4,255
 398:	fee5f1e3          	bgeu	a1,a4,37a <atoi+0x2a>
  return n * neg;
}
 39c:	02c8053b          	mulw	a0,a6,a2
 3a0:	6422                	ld	s0,8(sp)
 3a2:	0141                	addi	sp,sp,16
 3a4:	8082                	ret
    s++;
 3a6:	0505                	addi	a0,a0,1
    neg = -1;
 3a8:	587d                	li	a6,-1
 3aa:	bf6d                	j	364 <atoi+0x14>
  n = 0;
 3ac:	4601                	li	a2,0
 3ae:	b7fd                	j	39c <atoi+0x4c>

00000000000003b0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3b0:	1141                	addi	sp,sp,-16
 3b2:	e422                	sd	s0,8(sp)
 3b4:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 3b6:	02b57663          	bgeu	a0,a1,3e2 <memmove+0x32>
    while(n-- > 0)
 3ba:	02c05163          	blez	a2,3dc <memmove+0x2c>
 3be:	fff6079b          	addiw	a5,a2,-1
 3c2:	1782                	slli	a5,a5,0x20
 3c4:	9381                	srli	a5,a5,0x20
 3c6:	0785                	addi	a5,a5,1
 3c8:	97aa                	add	a5,a5,a0
  dst = vdst;
 3ca:	872a                	mv	a4,a0
      *dst++ = *src++;
 3cc:	0585                	addi	a1,a1,1
 3ce:	0705                	addi	a4,a4,1
 3d0:	fff5c683          	lbu	a3,-1(a1)
 3d4:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 3d8:	fee79ae3          	bne	a5,a4,3cc <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 3dc:	6422                	ld	s0,8(sp)
 3de:	0141                	addi	sp,sp,16
 3e0:	8082                	ret
    dst += n;
 3e2:	00c50733          	add	a4,a0,a2
    src += n;
 3e6:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 3e8:	fec05ae3          	blez	a2,3dc <memmove+0x2c>
 3ec:	fff6079b          	addiw	a5,a2,-1
 3f0:	1782                	slli	a5,a5,0x20
 3f2:	9381                	srli	a5,a5,0x20
 3f4:	fff7c793          	not	a5,a5
 3f8:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 3fa:	15fd                	addi	a1,a1,-1
 3fc:	177d                	addi	a4,a4,-1
 3fe:	0005c683          	lbu	a3,0(a1)
 402:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 406:	fee79ae3          	bne	a5,a4,3fa <memmove+0x4a>
 40a:	bfc9                	j	3dc <memmove+0x2c>

000000000000040c <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 40c:	1141                	addi	sp,sp,-16
 40e:	e422                	sd	s0,8(sp)
 410:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 412:	ca05                	beqz	a2,442 <memcmp+0x36>
 414:	fff6069b          	addiw	a3,a2,-1
 418:	1682                	slli	a3,a3,0x20
 41a:	9281                	srli	a3,a3,0x20
 41c:	0685                	addi	a3,a3,1
 41e:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 420:	00054783          	lbu	a5,0(a0)
 424:	0005c703          	lbu	a4,0(a1)
 428:	00e79863          	bne	a5,a4,438 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 42c:	0505                	addi	a0,a0,1
    p2++;
 42e:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 430:	fed518e3          	bne	a0,a3,420 <memcmp+0x14>
  }
  return 0;
 434:	4501                	li	a0,0
 436:	a019                	j	43c <memcmp+0x30>
      return *p1 - *p2;
 438:	40e7853b          	subw	a0,a5,a4
}
 43c:	6422                	ld	s0,8(sp)
 43e:	0141                	addi	sp,sp,16
 440:	8082                	ret
  return 0;
 442:	4501                	li	a0,0
 444:	bfe5                	j	43c <memcmp+0x30>

0000000000000446 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 446:	1141                	addi	sp,sp,-16
 448:	e406                	sd	ra,8(sp)
 44a:	e022                	sd	s0,0(sp)
 44c:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 44e:	00000097          	auipc	ra,0x0
 452:	f62080e7          	jalr	-158(ra) # 3b0 <memmove>
}
 456:	60a2                	ld	ra,8(sp)
 458:	6402                	ld	s0,0(sp)
 45a:	0141                	addi	sp,sp,16
 45c:	8082                	ret

000000000000045e <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 45e:	4885                	li	a7,1
 ecall
 460:	00000073          	ecall
 ret
 464:	8082                	ret

0000000000000466 <exit>:
.global exit
exit:
 li a7, SYS_exit
 466:	4889                	li	a7,2
 ecall
 468:	00000073          	ecall
 ret
 46c:	8082                	ret

000000000000046e <wait>:
.global wait
wait:
 li a7, SYS_wait
 46e:	488d                	li	a7,3
 ecall
 470:	00000073          	ecall
 ret
 474:	8082                	ret

0000000000000476 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 476:	4891                	li	a7,4
 ecall
 478:	00000073          	ecall
 ret
 47c:	8082                	ret

000000000000047e <read>:
.global read
read:
 li a7, SYS_read
 47e:	4895                	li	a7,5
 ecall
 480:	00000073          	ecall
 ret
 484:	8082                	ret

0000000000000486 <write>:
.global write
write:
 li a7, SYS_write
 486:	48c1                	li	a7,16
 ecall
 488:	00000073          	ecall
 ret
 48c:	8082                	ret

000000000000048e <close>:
.global close
close:
 li a7, SYS_close
 48e:	48d5                	li	a7,21
 ecall
 490:	00000073          	ecall
 ret
 494:	8082                	ret

0000000000000496 <kill>:
.global kill
kill:
 li a7, SYS_kill
 496:	4899                	li	a7,6
 ecall
 498:	00000073          	ecall
 ret
 49c:	8082                	ret

000000000000049e <exec>:
.global exec
exec:
 li a7, SYS_exec
 49e:	489d                	li	a7,7
 ecall
 4a0:	00000073          	ecall
 ret
 4a4:	8082                	ret

00000000000004a6 <open>:
.global open
open:
 li a7, SYS_open
 4a6:	48bd                	li	a7,15
 ecall
 4a8:	00000073          	ecall
 ret
 4ac:	8082                	ret

00000000000004ae <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 4ae:	48a1                	li	a7,8
 ecall
 4b0:	00000073          	ecall
 ret
 4b4:	8082                	ret

00000000000004b6 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 4b6:	48d1                	li	a7,20
 ecall
 4b8:	00000073          	ecall
 ret
 4bc:	8082                	ret

00000000000004be <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 4be:	48a5                	li	a7,9
 ecall
 4c0:	00000073          	ecall
 ret
 4c4:	8082                	ret

00000000000004c6 <dup>:
.global dup
dup:
 li a7, SYS_dup
 4c6:	48a9                	li	a7,10
 ecall
 4c8:	00000073          	ecall
 ret
 4cc:	8082                	ret

00000000000004ce <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 4ce:	48ad                	li	a7,11
 ecall
 4d0:	00000073          	ecall
 ret
 4d4:	8082                	ret

00000000000004d6 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 4d6:	48b1                	li	a7,12
 ecall
 4d8:	00000073          	ecall
 ret
 4dc:	8082                	ret

00000000000004de <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 4de:	48b5                	li	a7,13
 ecall
 4e0:	00000073          	ecall
 ret
 4e4:	8082                	ret

00000000000004e6 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 4e6:	48b9                	li	a7,14
 ecall
 4e8:	00000073          	ecall
 ret
 4ec:	8082                	ret

00000000000004ee <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 4ee:	48d9                	li	a7,22
 ecall
 4f0:	00000073          	ecall
 ret
 4f4:	8082                	ret

00000000000004f6 <dev>:
.global dev
dev:
 li a7, SYS_dev
 4f6:	48dd                	li	a7,23
 ecall
 4f8:	00000073          	ecall
 ret
 4fc:	8082                	ret

00000000000004fe <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 4fe:	48e1                	li	a7,24
 ecall
 500:	00000073          	ecall
 ret
 504:	8082                	ret

0000000000000506 <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 506:	48e5                	li	a7,25
 ecall
 508:	00000073          	ecall
 ret
 50c:	8082                	ret

000000000000050e <remove>:
.global remove
remove:
 li a7, SYS_remove
 50e:	48c5                	li	a7,17
 ecall
 510:	00000073          	ecall
 ret
 514:	8082                	ret

0000000000000516 <trace>:
.global trace
trace:
 li a7, SYS_trace
 516:	48c9                	li	a7,18
 ecall
 518:	00000073          	ecall
 ret
 51c:	8082                	ret

000000000000051e <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 51e:	48cd                	li	a7,19
 ecall
 520:	00000073          	ecall
 ret
 524:	8082                	ret

0000000000000526 <rename>:
.global rename
rename:
 li a7, SYS_rename
 526:	48e9                	li	a7,26
 ecall
 528:	00000073          	ecall
 ret
 52c:	8082                	ret

000000000000052e <checkchar>:
.global checkchar
checkchar:
 li a7, SYS_checkchar
 52e:	48ed                	li	a7,27
 ecall
 530:	00000073          	ecall
 ret
 534:	8082                	ret

0000000000000536 <sprint>:
.global sprint
sprint:
 li a7, SYS_sprint
 536:	48f1                	li	a7,28
 ecall
 538:	00000073          	ecall
 ret
 53c:	8082                	ret

000000000000053e <putc>:
static char digits[] = "0123456789ABCDEF";
static char printbuf[100];
static int  len = 0;
static void
putc(int fd, char c)
{
 53e:	1141                	addi	sp,sp,-16
 540:	e422                	sd	s0,8(sp)
 542:	0800                	addi	s0,sp,16
  printbuf[len++]=c;
 544:	00000797          	auipc	a5,0x0
 548:	55c78793          	addi	a5,a5,1372 # aa0 <len>
 54c:	4398                	lw	a4,0(a5)
 54e:	0017069b          	addiw	a3,a4,1
 552:	c394                	sw	a3,0(a5)
 554:	00000797          	auipc	a5,0x0
 558:	55c78793          	addi	a5,a5,1372 # ab0 <printbuf>
 55c:	97ba                	add	a5,a5,a4
 55e:	00b78023          	sb	a1,0(a5)
}
 562:	6422                	ld	s0,8(sp)
 564:	0141                	addi	sp,sp,16
 566:	8082                	ret

0000000000000568 <printint>:
	}
}

static void
printint(int fd, int xx, int base, int sgn)
{
 568:	7139                	addi	sp,sp,-64
 56a:	fc06                	sd	ra,56(sp)
 56c:	f822                	sd	s0,48(sp)
 56e:	f426                	sd	s1,40(sp)
 570:	f04a                	sd	s2,32(sp)
 572:	ec4e                	sd	s3,24(sp)
 574:	0080                	addi	s0,sp,64
 576:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 578:	c299                	beqz	a3,57e <printint+0x16>
 57a:	0805c863          	bltz	a1,60a <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 57e:	2581                	sext.w	a1,a1
  neg = 0;
 580:	4881                	li	a7,0
 582:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 586:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 588:	2601                	sext.w	a2,a2
 58a:	00000517          	auipc	a0,0x0
 58e:	4fe50513          	addi	a0,a0,1278 # a88 <digits>
 592:	883a                	mv	a6,a4
 594:	2705                	addiw	a4,a4,1
 596:	02c5f7bb          	remuw	a5,a1,a2
 59a:	1782                	slli	a5,a5,0x20
 59c:	9381                	srli	a5,a5,0x20
 59e:	97aa                	add	a5,a5,a0
 5a0:	0007c783          	lbu	a5,0(a5)
 5a4:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 5a8:	0005879b          	sext.w	a5,a1
 5ac:	02c5d5bb          	divuw	a1,a1,a2
 5b0:	0685                	addi	a3,a3,1
 5b2:	fec7f0e3          	bgeu	a5,a2,592 <printint+0x2a>
  if(neg)
 5b6:	00088b63          	beqz	a7,5cc <printint+0x64>
    buf[i++] = '-';
 5ba:	fd040793          	addi	a5,s0,-48
 5be:	973e                	add	a4,a4,a5
 5c0:	02d00793          	li	a5,45
 5c4:	fef70823          	sb	a5,-16(a4)
 5c8:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 5cc:	02e05863          	blez	a4,5fc <printint+0x94>
 5d0:	fc040793          	addi	a5,s0,-64
 5d4:	00e78933          	add	s2,a5,a4
 5d8:	fff78993          	addi	s3,a5,-1
 5dc:	99ba                	add	s3,s3,a4
 5de:	377d                	addiw	a4,a4,-1
 5e0:	1702                	slli	a4,a4,0x20
 5e2:	9301                	srli	a4,a4,0x20
 5e4:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 5e8:	fff94583          	lbu	a1,-1(s2)
 5ec:	8526                	mv	a0,s1
 5ee:	00000097          	auipc	ra,0x0
 5f2:	f50080e7          	jalr	-176(ra) # 53e <putc>
  while(--i >= 0)
 5f6:	197d                	addi	s2,s2,-1
 5f8:	ff3918e3          	bne	s2,s3,5e8 <printint+0x80>
}
 5fc:	70e2                	ld	ra,56(sp)
 5fe:	7442                	ld	s0,48(sp)
 600:	74a2                	ld	s1,40(sp)
 602:	7902                	ld	s2,32(sp)
 604:	69e2                	ld	s3,24(sp)
 606:	6121                	addi	sp,sp,64
 608:	8082                	ret
    x = -xx;
 60a:	40b005bb          	negw	a1,a1
    neg = 1;
 60e:	4885                	li	a7,1
    x = -xx;
 610:	bf8d                	j	582 <printint+0x1a>

0000000000000612 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 612:	7119                	addi	sp,sp,-128
 614:	fc86                	sd	ra,120(sp)
 616:	f8a2                	sd	s0,112(sp)
 618:	f4a6                	sd	s1,104(sp)
 61a:	f0ca                	sd	s2,96(sp)
 61c:	ecce                	sd	s3,88(sp)
 61e:	e8d2                	sd	s4,80(sp)
 620:	e4d6                	sd	s5,72(sp)
 622:	e0da                	sd	s6,64(sp)
 624:	fc5e                	sd	s7,56(sp)
 626:	f862                	sd	s8,48(sp)
 628:	f466                	sd	s9,40(sp)
 62a:	f06a                	sd	s10,32(sp)
 62c:	ec6e                	sd	s11,24(sp)
 62e:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 630:	0005c903          	lbu	s2,0(a1)
 634:	18090f63          	beqz	s2,7d2 <vprintf+0x1c0>
 638:	8aaa                	mv	s5,a0
 63a:	8b32                	mv	s6,a2
 63c:	00158493          	addi	s1,a1,1
  state = 0;
 640:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 642:	02500a13          	li	s4,37
      if(c == 'd'){
 646:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 64a:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 64e:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 652:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 656:	00000b97          	auipc	s7,0x0
 65a:	432b8b93          	addi	s7,s7,1074 # a88 <digits>
 65e:	a839                	j	67c <vprintf+0x6a>
        putc(fd, c);
 660:	85ca                	mv	a1,s2
 662:	8556                	mv	a0,s5
 664:	00000097          	auipc	ra,0x0
 668:	eda080e7          	jalr	-294(ra) # 53e <putc>
 66c:	a019                	j	672 <vprintf+0x60>
    } else if(state == '%'){
 66e:	01498f63          	beq	s3,s4,68c <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 672:	0485                	addi	s1,s1,1
 674:	fff4c903          	lbu	s2,-1(s1)
 678:	14090d63          	beqz	s2,7d2 <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 67c:	0009079b          	sext.w	a5,s2
    if(state == 0){
 680:	fe0997e3          	bnez	s3,66e <vprintf+0x5c>
      if(c == '%'){
 684:	fd479ee3          	bne	a5,s4,660 <vprintf+0x4e>
        state = '%';
 688:	89be                	mv	s3,a5
 68a:	b7e5                	j	672 <vprintf+0x60>
      if(c == 'd'){
 68c:	05878063          	beq	a5,s8,6cc <vprintf+0xba>
      } else if(c == 'l') {
 690:	05978c63          	beq	a5,s9,6e8 <vprintf+0xd6>
      } else if(c == 'x') {
 694:	07a78863          	beq	a5,s10,704 <vprintf+0xf2>
      } else if(c == 'p') {
 698:	09b78463          	beq	a5,s11,720 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 69c:	07300713          	li	a4,115
 6a0:	0ce78663          	beq	a5,a4,76c <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6a4:	06300713          	li	a4,99
 6a8:	0ee78e63          	beq	a5,a4,7a4 <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 6ac:	11478863          	beq	a5,s4,7bc <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6b0:	85d2                	mv	a1,s4
 6b2:	8556                	mv	a0,s5
 6b4:	00000097          	auipc	ra,0x0
 6b8:	e8a080e7          	jalr	-374(ra) # 53e <putc>
        putc(fd, c);
 6bc:	85ca                	mv	a1,s2
 6be:	8556                	mv	a0,s5
 6c0:	00000097          	auipc	ra,0x0
 6c4:	e7e080e7          	jalr	-386(ra) # 53e <putc>
      }
      state = 0;
 6c8:	4981                	li	s3,0
 6ca:	b765                	j	672 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 6cc:	008b0913          	addi	s2,s6,8
 6d0:	4685                	li	a3,1
 6d2:	4629                	li	a2,10
 6d4:	000b2583          	lw	a1,0(s6)
 6d8:	8556                	mv	a0,s5
 6da:	00000097          	auipc	ra,0x0
 6de:	e8e080e7          	jalr	-370(ra) # 568 <printint>
 6e2:	8b4a                	mv	s6,s2
      state = 0;
 6e4:	4981                	li	s3,0
 6e6:	b771                	j	672 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 6e8:	008b0913          	addi	s2,s6,8
 6ec:	4681                	li	a3,0
 6ee:	4629                	li	a2,10
 6f0:	000b2583          	lw	a1,0(s6)
 6f4:	8556                	mv	a0,s5
 6f6:	00000097          	auipc	ra,0x0
 6fa:	e72080e7          	jalr	-398(ra) # 568 <printint>
 6fe:	8b4a                	mv	s6,s2
      state = 0;
 700:	4981                	li	s3,0
 702:	bf85                	j	672 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 704:	008b0913          	addi	s2,s6,8
 708:	4681                	li	a3,0
 70a:	4641                	li	a2,16
 70c:	000b2583          	lw	a1,0(s6)
 710:	8556                	mv	a0,s5
 712:	00000097          	auipc	ra,0x0
 716:	e56080e7          	jalr	-426(ra) # 568 <printint>
 71a:	8b4a                	mv	s6,s2
      state = 0;
 71c:	4981                	li	s3,0
 71e:	bf91                	j	672 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 720:	008b0793          	addi	a5,s6,8
 724:	f8f43423          	sd	a5,-120(s0)
 728:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 72c:	03000593          	li	a1,48
 730:	8556                	mv	a0,s5
 732:	00000097          	auipc	ra,0x0
 736:	e0c080e7          	jalr	-500(ra) # 53e <putc>
  putc(fd, 'x');
 73a:	85ea                	mv	a1,s10
 73c:	8556                	mv	a0,s5
 73e:	00000097          	auipc	ra,0x0
 742:	e00080e7          	jalr	-512(ra) # 53e <putc>
 746:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 748:	03c9d793          	srli	a5,s3,0x3c
 74c:	97de                	add	a5,a5,s7
 74e:	0007c583          	lbu	a1,0(a5)
 752:	8556                	mv	a0,s5
 754:	00000097          	auipc	ra,0x0
 758:	dea080e7          	jalr	-534(ra) # 53e <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 75c:	0992                	slli	s3,s3,0x4
 75e:	397d                	addiw	s2,s2,-1
 760:	fe0914e3          	bnez	s2,748 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 764:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 768:	4981                	li	s3,0
 76a:	b721                	j	672 <vprintf+0x60>
        s = va_arg(ap, char*);
 76c:	008b0993          	addi	s3,s6,8
 770:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 774:	02090163          	beqz	s2,796 <vprintf+0x184>
        while(*s != 0){
 778:	00094583          	lbu	a1,0(s2)
 77c:	c9a1                	beqz	a1,7cc <vprintf+0x1ba>
          putc(fd, *s);
 77e:	8556                	mv	a0,s5
 780:	00000097          	auipc	ra,0x0
 784:	dbe080e7          	jalr	-578(ra) # 53e <putc>
          s++;
 788:	0905                	addi	s2,s2,1
        while(*s != 0){
 78a:	00094583          	lbu	a1,0(s2)
 78e:	f9e5                	bnez	a1,77e <vprintf+0x16c>
        s = va_arg(ap, char*);
 790:	8b4e                	mv	s6,s3
      state = 0;
 792:	4981                	li	s3,0
 794:	bdf9                	j	672 <vprintf+0x60>
          s = "(null)";
 796:	00000917          	auipc	s2,0x0
 79a:	2ea90913          	addi	s2,s2,746 # a80 <malloc+0x124>
        while(*s != 0){
 79e:	02800593          	li	a1,40
 7a2:	bff1                	j	77e <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 7a4:	008b0913          	addi	s2,s6,8
 7a8:	000b4583          	lbu	a1,0(s6)
 7ac:	8556                	mv	a0,s5
 7ae:	00000097          	auipc	ra,0x0
 7b2:	d90080e7          	jalr	-624(ra) # 53e <putc>
 7b6:	8b4a                	mv	s6,s2
      state = 0;
 7b8:	4981                	li	s3,0
 7ba:	bd65                	j	672 <vprintf+0x60>
        putc(fd, c);
 7bc:	85d2                	mv	a1,s4
 7be:	8556                	mv	a0,s5
 7c0:	00000097          	auipc	ra,0x0
 7c4:	d7e080e7          	jalr	-642(ra) # 53e <putc>
      state = 0;
 7c8:	4981                	li	s3,0
 7ca:	b565                	j	672 <vprintf+0x60>
        s = va_arg(ap, char*);
 7cc:	8b4e                	mv	s6,s3
      state = 0;
 7ce:	4981                	li	s3,0
 7d0:	b54d                	j	672 <vprintf+0x60>
    }
  }
}
 7d2:	70e6                	ld	ra,120(sp)
 7d4:	7446                	ld	s0,112(sp)
 7d6:	74a6                	ld	s1,104(sp)
 7d8:	7906                	ld	s2,96(sp)
 7da:	69e6                	ld	s3,88(sp)
 7dc:	6a46                	ld	s4,80(sp)
 7de:	6aa6                	ld	s5,72(sp)
 7e0:	6b06                	ld	s6,64(sp)
 7e2:	7be2                	ld	s7,56(sp)
 7e4:	7c42                	ld	s8,48(sp)
 7e6:	7ca2                	ld	s9,40(sp)
 7e8:	7d02                	ld	s10,32(sp)
 7ea:	6de2                	ld	s11,24(sp)
 7ec:	6109                	addi	sp,sp,128
 7ee:	8082                	ret

00000000000007f0 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 7f0:	711d                	addi	sp,sp,-96
 7f2:	f406                	sd	ra,40(sp)
 7f4:	f022                	sd	s0,32(sp)
 7f6:	ec26                	sd	s1,24(sp)
 7f8:	e84a                	sd	s2,16(sp)
 7fa:	1800                	addi	s0,sp,48
 7fc:	84aa                	mv	s1,a0
 7fe:	e010                	sd	a2,0(s0)
 800:	e414                	sd	a3,8(s0)
 802:	e818                	sd	a4,16(s0)
 804:	ec1c                	sd	a5,24(s0)
 806:	03043023          	sd	a6,32(s0)
 80a:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 80e:	fc843c23          	sd	s0,-40(s0)
  vprintf(fd, fmt, ap);
 812:	8622                	mv	a2,s0
 814:	00000097          	auipc	ra,0x0
 818:	dfe080e7          	jalr	-514(ra) # 612 <vprintf>
	if(fd==1){
 81c:	4785                	li	a5,1
 81e:	02f48963          	beq	s1,a5,850 <fprintf+0x60>
	  write(fd, printbuf, len);
 822:	00000917          	auipc	s2,0x0
 826:	27e90913          	addi	s2,s2,638 # aa0 <len>
 82a:	00092603          	lw	a2,0(s2)
 82e:	00000597          	auipc	a1,0x0
 832:	28258593          	addi	a1,a1,642 # ab0 <printbuf>
 836:	8526                	mv	a0,s1
 838:	00000097          	auipc	ra,0x0
 83c:	c4e080e7          	jalr	-946(ra) # 486 <write>
	  len=0;
 840:	00092023          	sw	zero,0(s2)
  fflush(fd);
}
 844:	70a2                	ld	ra,40(sp)
 846:	7402                	ld	s0,32(sp)
 848:	64e2                	ld	s1,24(sp)
 84a:	6942                	ld	s2,16(sp)
 84c:	6125                	addi	sp,sp,96
 84e:	8082                	ret
	  printbuf[len]=0;
 850:	00000517          	auipc	a0,0x0
 854:	26050513          	addi	a0,a0,608 # ab0 <printbuf>
 858:	00000497          	auipc	s1,0x0
 85c:	24848493          	addi	s1,s1,584 # aa0 <len>
 860:	409c                	lw	a5,0(s1)
 862:	97aa                	add	a5,a5,a0
 864:	00078023          	sb	zero,0(a5)
	  sprint(printbuf);
 868:	00000097          	auipc	ra,0x0
 86c:	cce080e7          	jalr	-818(ra) # 536 <sprint>
	  len=0;
 870:	0004a023          	sw	zero,0(s1)
 874:	bfc1                	j	844 <fprintf+0x54>

0000000000000876 <printf>:

void
printf(const char *fmt, ...)
{
 876:	7159                	addi	sp,sp,-112
 878:	f406                	sd	ra,40(sp)
 87a:	f022                	sd	s0,32(sp)
 87c:	ec26                	sd	s1,24(sp)
 87e:	1800                	addi	s0,sp,48
 880:	e40c                	sd	a1,8(s0)
 882:	e810                	sd	a2,16(s0)
 884:	ec14                	sd	a3,24(s0)
 886:	f018                	sd	a4,32(s0)
 888:	f41c                	sd	a5,40(s0)
 88a:	03043823          	sd	a6,48(s0)
 88e:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 892:	00840613          	addi	a2,s0,8
 896:	fcc43c23          	sd	a2,-40(s0)
  vprintf(1, fmt, ap);
 89a:	85aa                	mv	a1,a0
 89c:	4505                	li	a0,1
 89e:	00000097          	auipc	ra,0x0
 8a2:	d74080e7          	jalr	-652(ra) # 612 <vprintf>
	  printbuf[len]=0;
 8a6:	00000517          	auipc	a0,0x0
 8aa:	20a50513          	addi	a0,a0,522 # ab0 <printbuf>
 8ae:	00000497          	auipc	s1,0x0
 8b2:	1f248493          	addi	s1,s1,498 # aa0 <len>
 8b6:	409c                	lw	a5,0(s1)
 8b8:	97aa                	add	a5,a5,a0
 8ba:	00078023          	sb	zero,0(a5)
	  sprint(printbuf);
 8be:	00000097          	auipc	ra,0x0
 8c2:	c78080e7          	jalr	-904(ra) # 536 <sprint>
	  len=0;
 8c6:	0004a023          	sw	zero,0(s1)
  fflush(1);
}
 8ca:	70a2                	ld	ra,40(sp)
 8cc:	7402                	ld	s0,32(sp)
 8ce:	64e2                	ld	s1,24(sp)
 8d0:	6165                	addi	sp,sp,112
 8d2:	8082                	ret

00000000000008d4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8d4:	1141                	addi	sp,sp,-16
 8d6:	e422                	sd	s0,8(sp)
 8d8:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8da:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8de:	00000797          	auipc	a5,0x0
 8e2:	1ca7b783          	ld	a5,458(a5) # aa8 <freep>
 8e6:	a805                	j	916 <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 8e8:	4618                	lw	a4,8(a2)
 8ea:	9db9                	addw	a1,a1,a4
 8ec:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 8f0:	6398                	ld	a4,0(a5)
 8f2:	6318                	ld	a4,0(a4)
 8f4:	fee53823          	sd	a4,-16(a0)
 8f8:	a091                	j	93c <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 8fa:	ff852703          	lw	a4,-8(a0)
 8fe:	9e39                	addw	a2,a2,a4
 900:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 902:	ff053703          	ld	a4,-16(a0)
 906:	e398                	sd	a4,0(a5)
 908:	a099                	j	94e <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 90a:	6398                	ld	a4,0(a5)
 90c:	00e7e463          	bltu	a5,a4,914 <free+0x40>
 910:	00e6ea63          	bltu	a3,a4,924 <free+0x50>
{
 914:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 916:	fed7fae3          	bgeu	a5,a3,90a <free+0x36>
 91a:	6398                	ld	a4,0(a5)
 91c:	00e6e463          	bltu	a3,a4,924 <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 920:	fee7eae3          	bltu	a5,a4,914 <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 924:	ff852583          	lw	a1,-8(a0)
 928:	6390                	ld	a2,0(a5)
 92a:	02059713          	slli	a4,a1,0x20
 92e:	9301                	srli	a4,a4,0x20
 930:	0712                	slli	a4,a4,0x4
 932:	9736                	add	a4,a4,a3
 934:	fae60ae3          	beq	a2,a4,8e8 <free+0x14>
    bp->s.ptr = p->s.ptr;
 938:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 93c:	4790                	lw	a2,8(a5)
 93e:	02061713          	slli	a4,a2,0x20
 942:	9301                	srli	a4,a4,0x20
 944:	0712                	slli	a4,a4,0x4
 946:	973e                	add	a4,a4,a5
 948:	fae689e3          	beq	a3,a4,8fa <free+0x26>
  } else
    p->s.ptr = bp;
 94c:	e394                	sd	a3,0(a5)
  freep = p;
 94e:	00000717          	auipc	a4,0x0
 952:	14f73d23          	sd	a5,346(a4) # aa8 <freep>
}
 956:	6422                	ld	s0,8(sp)
 958:	0141                	addi	sp,sp,16
 95a:	8082                	ret

000000000000095c <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 95c:	7139                	addi	sp,sp,-64
 95e:	fc06                	sd	ra,56(sp)
 960:	f822                	sd	s0,48(sp)
 962:	f426                	sd	s1,40(sp)
 964:	f04a                	sd	s2,32(sp)
 966:	ec4e                	sd	s3,24(sp)
 968:	e852                	sd	s4,16(sp)
 96a:	e456                	sd	s5,8(sp)
 96c:	e05a                	sd	s6,0(sp)
 96e:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 970:	02051493          	slli	s1,a0,0x20
 974:	9081                	srli	s1,s1,0x20
 976:	04bd                	addi	s1,s1,15
 978:	8091                	srli	s1,s1,0x4
 97a:	0014899b          	addiw	s3,s1,1
 97e:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 980:	00000517          	auipc	a0,0x0
 984:	12853503          	ld	a0,296(a0) # aa8 <freep>
 988:	c515                	beqz	a0,9b4 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 98a:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 98c:	4798                	lw	a4,8(a5)
 98e:	02977f63          	bgeu	a4,s1,9cc <malloc+0x70>
 992:	8a4e                	mv	s4,s3
 994:	0009871b          	sext.w	a4,s3
 998:	6685                	lui	a3,0x1
 99a:	00d77363          	bgeu	a4,a3,9a0 <malloc+0x44>
 99e:	6a05                	lui	s4,0x1
 9a0:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 9a4:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 9a8:	00000917          	auipc	s2,0x0
 9ac:	10090913          	addi	s2,s2,256 # aa8 <freep>
  if(p == (char*)-1)
 9b0:	5afd                	li	s5,-1
 9b2:	a88d                	j	a24 <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 9b4:	00000797          	auipc	a5,0x0
 9b8:	16478793          	addi	a5,a5,356 # b18 <base>
 9bc:	00000717          	auipc	a4,0x0
 9c0:	0ef73623          	sd	a5,236(a4) # aa8 <freep>
 9c4:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 9c6:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 9ca:	b7e1                	j	992 <malloc+0x36>
      if(p->s.size == nunits)
 9cc:	02e48b63          	beq	s1,a4,a02 <malloc+0xa6>
        p->s.size -= nunits;
 9d0:	4137073b          	subw	a4,a4,s3
 9d4:	c798                	sw	a4,8(a5)
        p += p->s.size;
 9d6:	1702                	slli	a4,a4,0x20
 9d8:	9301                	srli	a4,a4,0x20
 9da:	0712                	slli	a4,a4,0x4
 9dc:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 9de:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 9e2:	00000717          	auipc	a4,0x0
 9e6:	0ca73323          	sd	a0,198(a4) # aa8 <freep>
      return (void*)(p + 1);
 9ea:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9ee:	70e2                	ld	ra,56(sp)
 9f0:	7442                	ld	s0,48(sp)
 9f2:	74a2                	ld	s1,40(sp)
 9f4:	7902                	ld	s2,32(sp)
 9f6:	69e2                	ld	s3,24(sp)
 9f8:	6a42                	ld	s4,16(sp)
 9fa:	6aa2                	ld	s5,8(sp)
 9fc:	6b02                	ld	s6,0(sp)
 9fe:	6121                	addi	sp,sp,64
 a00:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 a02:	6398                	ld	a4,0(a5)
 a04:	e118                	sd	a4,0(a0)
 a06:	bff1                	j	9e2 <malloc+0x86>
  hp->s.size = nu;
 a08:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 a0c:	0541                	addi	a0,a0,16
 a0e:	00000097          	auipc	ra,0x0
 a12:	ec6080e7          	jalr	-314(ra) # 8d4 <free>
  return freep;
 a16:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 a1a:	d971                	beqz	a0,9ee <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a1c:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 a1e:	4798                	lw	a4,8(a5)
 a20:	fa9776e3          	bgeu	a4,s1,9cc <malloc+0x70>
    if(p == freep)
 a24:	00093703          	ld	a4,0(s2)
 a28:	853e                	mv	a0,a5
 a2a:	fef719e3          	bne	a4,a5,a1c <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 a2e:	8552                	mv	a0,s4
 a30:	00000097          	auipc	ra,0x0
 a34:	aa6080e7          	jalr	-1370(ra) # 4d6 <sbrk>
  if(p == (char*)-1)
 a38:	fd5518e3          	bne	a0,s5,a08 <malloc+0xac>
        return 0;
 a3c:	4501                	li	a0,0
 a3e:	bf45                	j	9ee <malloc+0x92>
