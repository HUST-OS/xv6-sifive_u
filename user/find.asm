
user/_find:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <find>:
#include "xv6-user/user.h"

static char path[512];

void find(char *filename)
{
   0:	7175                	addi	sp,sp,-144
   2:	e506                	sd	ra,136(sp)
   4:	e122                	sd	s0,128(sp)
   6:	fca6                	sd	s1,120(sp)
   8:	f8ca                	sd	s2,112(sp)
   a:	f4ce                	sd	s3,104(sp)
   c:	f0d2                	sd	s4,96(sp)
   e:	ecd6                	sd	s5,88(sp)
  10:	e8da                	sd	s6,80(sp)
  12:	e4de                	sd	s7,72(sp)
  14:	0900                	addi	s0,sp,144
  16:	89aa                	mv	s3,a0
    int fd;
    struct stat st;
    if ((fd = open(path, O_RDONLY)) < 0) {
  18:	4581                	li	a1,0
  1a:	00001517          	auipc	a0,0x1
  1e:	b2e50513          	addi	a0,a0,-1234 # b48 <path>
  22:	00000097          	auipc	ra,0x0
  26:	4da080e7          	jalr	1242(ra) # 4fc <open>
  2a:	04054063          	bltz	a0,6a <find+0x6a>
  2e:	84aa                	mv	s1,a0
        fprintf(2, "find: cannot open %s\n", path);
        return;
    }
    if (fstat(fd, &st) < 0) {
  30:	f7840593          	addi	a1,s0,-136
  34:	00000097          	auipc	ra,0x0
  38:	4d0080e7          	jalr	1232(ra) # 504 <fstat>
  3c:	04054563          	bltz	a0,86 <find+0x86>
        fprintf(2, "find: cannot stat %s\n", path);
        close(fd);
        return;
    }
    if (st.type != T_DIR) {
  40:	fa041703          	lh	a4,-96(s0)
  44:	4785                	li	a5,1
  46:	06f70363          	beq	a4,a5,ac <find+0xac>
        close(fd);
  4a:	8526                	mv	a0,s1
  4c:	00000097          	auipc	ra,0x0
  50:	498080e7          	jalr	1176(ra) # 4e4 <close>
        }
        find(filename);
    }
    close(fd);
    return;
}
  54:	60aa                	ld	ra,136(sp)
  56:	640a                	ld	s0,128(sp)
  58:	74e6                	ld	s1,120(sp)
  5a:	7946                	ld	s2,112(sp)
  5c:	79a6                	ld	s3,104(sp)
  5e:	7a06                	ld	s4,96(sp)
  60:	6ae6                	ld	s5,88(sp)
  62:	6b46                	ld	s6,80(sp)
  64:	6ba6                	ld	s7,72(sp)
  66:	6149                	addi	sp,sp,144
  68:	8082                	ret
        fprintf(2, "find: cannot open %s\n", path);
  6a:	00001617          	auipc	a2,0x1
  6e:	ade60613          	addi	a2,a2,-1314 # b48 <path>
  72:	00001597          	auipc	a1,0x1
  76:	a2658593          	addi	a1,a1,-1498 # a98 <malloc+0xe6>
  7a:	4509                	li	a0,2
  7c:	00000097          	auipc	ra,0x0
  80:	7ca080e7          	jalr	1994(ra) # 846 <fprintf>
        return;
  84:	bfc1                	j	54 <find+0x54>
        fprintf(2, "find: cannot stat %s\n", path);
  86:	00001617          	auipc	a2,0x1
  8a:	ac260613          	addi	a2,a2,-1342 # b48 <path>
  8e:	00001597          	auipc	a1,0x1
  92:	a2258593          	addi	a1,a1,-1502 # ab0 <malloc+0xfe>
  96:	4509                	li	a0,2
  98:	00000097          	auipc	ra,0x0
  9c:	7ae080e7          	jalr	1966(ra) # 846 <fprintf>
        close(fd);
  a0:	8526                	mv	a0,s1
  a2:	00000097          	auipc	ra,0x0
  a6:	442080e7          	jalr	1090(ra) # 4e4 <close>
        return;
  aa:	b76d                	j	54 <find+0x54>
    if (strlen(path) + 255 + 2 > sizeof(path)) {
  ac:	00001517          	auipc	a0,0x1
  b0:	a9c50513          	addi	a0,a0,-1380 # b48 <path>
  b4:	00000097          	auipc	ra,0x0
  b8:	1c4080e7          	jalr	452(ra) # 278 <strlen>
  bc:	1015051b          	addiw	a0,a0,257
  c0:	20000793          	li	a5,512
  c4:	0aa7e863          	bltu	a5,a0,174 <find+0x174>
    char *p = path + strlen(path) - 1;
  c8:	00001917          	auipc	s2,0x1
  cc:	a8090913          	addi	s2,s2,-1408 # b48 <path>
  d0:	854a                	mv	a0,s2
  d2:	00000097          	auipc	ra,0x0
  d6:	1a6080e7          	jalr	422(ra) # 278 <strlen>
  da:	1502                	slli	a0,a0,0x20
  dc:	9101                	srli	a0,a0,0x20
  de:	fff50793          	addi	a5,a0,-1
  e2:	993e                	add	s2,s2,a5
    if (*p != '/') {
  e4:	00094703          	lbu	a4,0(s2)
  e8:	02f00793          	li	a5,47
  ec:	00f70963          	beq	a4,a5,fe <find+0xfe>
        *++p = '/';
  f0:	00f900a3          	sb	a5,1(s2)
  f4:	00001917          	auipc	s2,0x1
  f8:	a5490913          	addi	s2,s2,-1452 # b48 <path>
  fc:	992a                	add	s2,s2,a0
    p++;
  fe:	0905                	addi	s2,s2,1
        if (strcmp(p, ".") == 0 || strcmp(p, "..") == 0) {
 100:	00001a17          	auipc	s4,0x1
 104:	9e0a0a13          	addi	s4,s4,-1568 # ae0 <malloc+0x12e>
 108:	00001a97          	auipc	s5,0x1
 10c:	9e0a8a93          	addi	s5,s5,-1568 # ae8 <malloc+0x136>
            fprintf(1, "%s\n", path);
 110:	00001b97          	auipc	s7,0x1
 114:	a38b8b93          	addi	s7,s7,-1480 # b48 <path>
 118:	00001b17          	auipc	s6,0x1
 11c:	9d8b0b13          	addi	s6,s6,-1576 # af0 <malloc+0x13e>
    while (readdir(fd, &st)) {
 120:	f7840593          	addi	a1,s0,-136
 124:	8526                	mv	a0,s1
 126:	00000097          	auipc	ra,0x0
 12a:	42e080e7          	jalr	1070(ra) # 554 <readdir>
 12e:	c935                	beqz	a0,1a2 <find+0x1a2>
        strcpy(p, st.name);
 130:	f7840593          	addi	a1,s0,-136
 134:	854a                	mv	a0,s2
 136:	00000097          	auipc	ra,0x0
 13a:	0cc080e7          	jalr	204(ra) # 202 <strcpy>
        if (strcmp(p, ".") == 0 || strcmp(p, "..") == 0) {
 13e:	85d2                	mv	a1,s4
 140:	854a                	mv	a0,s2
 142:	00000097          	auipc	ra,0x0
 146:	10a080e7          	jalr	266(ra) # 24c <strcmp>
 14a:	d979                	beqz	a0,120 <find+0x120>
 14c:	85d6                	mv	a1,s5
 14e:	854a                	mv	a0,s2
 150:	00000097          	auipc	ra,0x0
 154:	0fc080e7          	jalr	252(ra) # 24c <strcmp>
 158:	d561                	beqz	a0,120 <find+0x120>
        if (strcmp(p, filename) == 0) {
 15a:	85ce                	mv	a1,s3
 15c:	854a                	mv	a0,s2
 15e:	00000097          	auipc	ra,0x0
 162:	0ee080e7          	jalr	238(ra) # 24c <strcmp>
 166:	c515                	beqz	a0,192 <find+0x192>
        find(filename);
 168:	854e                	mv	a0,s3
 16a:	00000097          	auipc	ra,0x0
 16e:	e96080e7          	jalr	-362(ra) # 0 <find>
 172:	b77d                	j	120 <find+0x120>
        fprintf(2, "find: path too long\n");
 174:	00001597          	auipc	a1,0x1
 178:	95458593          	addi	a1,a1,-1708 # ac8 <malloc+0x116>
 17c:	4509                	li	a0,2
 17e:	00000097          	auipc	ra,0x0
 182:	6c8080e7          	jalr	1736(ra) # 846 <fprintf>
        close(fd);
 186:	8526                	mv	a0,s1
 188:	00000097          	auipc	ra,0x0
 18c:	35c080e7          	jalr	860(ra) # 4e4 <close>
        return;
 190:	b5d1                	j	54 <find+0x54>
            fprintf(1, "%s\n", path);
 192:	865e                	mv	a2,s7
 194:	85da                	mv	a1,s6
 196:	4505                	li	a0,1
 198:	00000097          	auipc	ra,0x0
 19c:	6ae080e7          	jalr	1710(ra) # 846 <fprintf>
 1a0:	b7e1                	j	168 <find+0x168>
    close(fd);
 1a2:	8526                	mv	a0,s1
 1a4:	00000097          	auipc	ra,0x0
 1a8:	340080e7          	jalr	832(ra) # 4e4 <close>
    return;
 1ac:	b565                	j	54 <find+0x54>

00000000000001ae <main>:


int main(int argc, char *argv[])
{
 1ae:	1101                	addi	sp,sp,-32
 1b0:	ec06                	sd	ra,24(sp)
 1b2:	e822                	sd	s0,16(sp)
 1b4:	e426                	sd	s1,8(sp)
 1b6:	1000                	addi	s0,sp,32
    if (argc < 3) {
 1b8:	4789                	li	a5,2
 1ba:	02a7c063          	blt	a5,a0,1da <main+0x2c>
        fprintf(2, "Usage: find DIR FILENAME\n");
 1be:	00001597          	auipc	a1,0x1
 1c2:	93a58593          	addi	a1,a1,-1734 # af8 <malloc+0x146>
 1c6:	4509                	li	a0,2
 1c8:	00000097          	auipc	ra,0x0
 1cc:	67e080e7          	jalr	1662(ra) # 846 <fprintf>
        exit(0);
 1d0:	4501                	li	a0,0
 1d2:	00000097          	auipc	ra,0x0
 1d6:	2ea080e7          	jalr	746(ra) # 4bc <exit>
 1da:	84ae                	mv	s1,a1
    } else {
        strcpy(path, argv[1]);
 1dc:	658c                	ld	a1,8(a1)
 1de:	00001517          	auipc	a0,0x1
 1e2:	96a50513          	addi	a0,a0,-1686 # b48 <path>
 1e6:	00000097          	auipc	ra,0x0
 1ea:	01c080e7          	jalr	28(ra) # 202 <strcpy>
        find(argv[2]);
 1ee:	6888                	ld	a0,16(s1)
 1f0:	00000097          	auipc	ra,0x0
 1f4:	e10080e7          	jalr	-496(ra) # 0 <find>
    }
    exit(0);
 1f8:	4501                	li	a0,0
 1fa:	00000097          	auipc	ra,0x0
 1fe:	2c2080e7          	jalr	706(ra) # 4bc <exit>

0000000000000202 <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
 202:	1141                	addi	sp,sp,-16
 204:	e422                	sd	s0,8(sp)
 206:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 208:	87aa                	mv	a5,a0
 20a:	0585                	addi	a1,a1,1
 20c:	0785                	addi	a5,a5,1
 20e:	fff5c703          	lbu	a4,-1(a1)
 212:	fee78fa3          	sb	a4,-1(a5)
 216:	fb75                	bnez	a4,20a <strcpy+0x8>
    ;
  return os;
}
 218:	6422                	ld	s0,8(sp)
 21a:	0141                	addi	sp,sp,16
 21c:	8082                	ret

000000000000021e <strcat>:

char*
strcat(char *s, const char *t)
{
 21e:	1141                	addi	sp,sp,-16
 220:	e422                	sd	s0,8(sp)
 222:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
 224:	00054783          	lbu	a5,0(a0)
 228:	c385                	beqz	a5,248 <strcat+0x2a>
 22a:	87aa                	mv	a5,a0
    s++;
 22c:	0785                	addi	a5,a5,1
  while(*s)
 22e:	0007c703          	lbu	a4,0(a5)
 232:	ff6d                	bnez	a4,22c <strcat+0xe>
  while((*s++ = *t++))
 234:	0585                	addi	a1,a1,1
 236:	0785                	addi	a5,a5,1
 238:	fff5c703          	lbu	a4,-1(a1)
 23c:	fee78fa3          	sb	a4,-1(a5)
 240:	fb75                	bnez	a4,234 <strcat+0x16>
    ;
  return os;
}
 242:	6422                	ld	s0,8(sp)
 244:	0141                	addi	sp,sp,16
 246:	8082                	ret
  while(*s)
 248:	87aa                	mv	a5,a0
 24a:	b7ed                	j	234 <strcat+0x16>

000000000000024c <strcmp>:


int
strcmp(const char *p, const char *q)
{
 24c:	1141                	addi	sp,sp,-16
 24e:	e422                	sd	s0,8(sp)
 250:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 252:	00054783          	lbu	a5,0(a0)
 256:	cb91                	beqz	a5,26a <strcmp+0x1e>
 258:	0005c703          	lbu	a4,0(a1)
 25c:	00f71763          	bne	a4,a5,26a <strcmp+0x1e>
    p++, q++;
 260:	0505                	addi	a0,a0,1
 262:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 264:	00054783          	lbu	a5,0(a0)
 268:	fbe5                	bnez	a5,258 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 26a:	0005c503          	lbu	a0,0(a1)
}
 26e:	40a7853b          	subw	a0,a5,a0
 272:	6422                	ld	s0,8(sp)
 274:	0141                	addi	sp,sp,16
 276:	8082                	ret

0000000000000278 <strlen>:

uint
strlen(const char *s)
{
 278:	1141                	addi	sp,sp,-16
 27a:	e422                	sd	s0,8(sp)
 27c:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 27e:	00054783          	lbu	a5,0(a0)
 282:	cf91                	beqz	a5,29e <strlen+0x26>
 284:	0505                	addi	a0,a0,1
 286:	87aa                	mv	a5,a0
 288:	4685                	li	a3,1
 28a:	9e89                	subw	a3,a3,a0
 28c:	00f6853b          	addw	a0,a3,a5
 290:	0785                	addi	a5,a5,1
 292:	fff7c703          	lbu	a4,-1(a5)
 296:	fb7d                	bnez	a4,28c <strlen+0x14>
    ;
  return n;
}
 298:	6422                	ld	s0,8(sp)
 29a:	0141                	addi	sp,sp,16
 29c:	8082                	ret
  for(n = 0; s[n]; n++)
 29e:	4501                	li	a0,0
 2a0:	bfe5                	j	298 <strlen+0x20>

00000000000002a2 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2a2:	1141                	addi	sp,sp,-16
 2a4:	e422                	sd	s0,8(sp)
 2a6:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 2a8:	ce09                	beqz	a2,2c2 <memset+0x20>
 2aa:	87aa                	mv	a5,a0
 2ac:	fff6071b          	addiw	a4,a2,-1
 2b0:	1702                	slli	a4,a4,0x20
 2b2:	9301                	srli	a4,a4,0x20
 2b4:	0705                	addi	a4,a4,1
 2b6:	972a                	add	a4,a4,a0
    cdst[i] = c;
 2b8:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 2bc:	0785                	addi	a5,a5,1
 2be:	fee79de3          	bne	a5,a4,2b8 <memset+0x16>
  }
  return dst;
}
 2c2:	6422                	ld	s0,8(sp)
 2c4:	0141                	addi	sp,sp,16
 2c6:	8082                	ret

00000000000002c8 <strchr>:

char*
strchr(const char *s, char c)
{
 2c8:	1141                	addi	sp,sp,-16
 2ca:	e422                	sd	s0,8(sp)
 2cc:	0800                	addi	s0,sp,16
  for(; *s; s++)
 2ce:	00054783          	lbu	a5,0(a0)
 2d2:	cb99                	beqz	a5,2e8 <strchr+0x20>
    if(*s == c)
 2d4:	00f58763          	beq	a1,a5,2e2 <strchr+0x1a>
  for(; *s; s++)
 2d8:	0505                	addi	a0,a0,1
 2da:	00054783          	lbu	a5,0(a0)
 2de:	fbfd                	bnez	a5,2d4 <strchr+0xc>
      return (char*)s;
  return 0;
 2e0:	4501                	li	a0,0
}
 2e2:	6422                	ld	s0,8(sp)
 2e4:	0141                	addi	sp,sp,16
 2e6:	8082                	ret
  return 0;
 2e8:	4501                	li	a0,0
 2ea:	bfe5                	j	2e2 <strchr+0x1a>

00000000000002ec <gets>:

char*
gets(char *buf, int max)
{
 2ec:	711d                	addi	sp,sp,-96
 2ee:	ec86                	sd	ra,88(sp)
 2f0:	e8a2                	sd	s0,80(sp)
 2f2:	e4a6                	sd	s1,72(sp)
 2f4:	e0ca                	sd	s2,64(sp)
 2f6:	fc4e                	sd	s3,56(sp)
 2f8:	f852                	sd	s4,48(sp)
 2fa:	f456                	sd	s5,40(sp)
 2fc:	f05a                	sd	s6,32(sp)
 2fe:	ec5e                	sd	s7,24(sp)
 300:	1080                	addi	s0,sp,96
 302:	8baa                	mv	s7,a0
 304:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 306:	892a                	mv	s2,a0
 308:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 30a:	4aa9                	li	s5,10
 30c:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 30e:	89a6                	mv	s3,s1
 310:	2485                	addiw	s1,s1,1
 312:	0344d863          	bge	s1,s4,342 <gets+0x56>
    cc = read(0, &c, 1);
 316:	4605                	li	a2,1
 318:	faf40593          	addi	a1,s0,-81
 31c:	4501                	li	a0,0
 31e:	00000097          	auipc	ra,0x0
 322:	1b6080e7          	jalr	438(ra) # 4d4 <read>
    if(cc < 1)
 326:	00a05e63          	blez	a0,342 <gets+0x56>
    buf[i++] = c;
 32a:	faf44783          	lbu	a5,-81(s0)
 32e:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 332:	01578763          	beq	a5,s5,340 <gets+0x54>
 336:	0905                	addi	s2,s2,1
 338:	fd679be3          	bne	a5,s6,30e <gets+0x22>
  for(i=0; i+1 < max; ){
 33c:	89a6                	mv	s3,s1
 33e:	a011                	j	342 <gets+0x56>
 340:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 342:	99de                	add	s3,s3,s7
 344:	00098023          	sb	zero,0(s3)
  return buf;
}
 348:	855e                	mv	a0,s7
 34a:	60e6                	ld	ra,88(sp)
 34c:	6446                	ld	s0,80(sp)
 34e:	64a6                	ld	s1,72(sp)
 350:	6906                	ld	s2,64(sp)
 352:	79e2                	ld	s3,56(sp)
 354:	7a42                	ld	s4,48(sp)
 356:	7aa2                	ld	s5,40(sp)
 358:	7b02                	ld	s6,32(sp)
 35a:	6be2                	ld	s7,24(sp)
 35c:	6125                	addi	sp,sp,96
 35e:	8082                	ret

0000000000000360 <stat>:

int
stat(const char *n, struct stat *st)
{
 360:	1101                	addi	sp,sp,-32
 362:	ec06                	sd	ra,24(sp)
 364:	e822                	sd	s0,16(sp)
 366:	e426                	sd	s1,8(sp)
 368:	e04a                	sd	s2,0(sp)
 36a:	1000                	addi	s0,sp,32
 36c:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 36e:	4581                	li	a1,0
 370:	00000097          	auipc	ra,0x0
 374:	18c080e7          	jalr	396(ra) # 4fc <open>
  if(fd < 0)
 378:	02054563          	bltz	a0,3a2 <stat+0x42>
 37c:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 37e:	85ca                	mv	a1,s2
 380:	00000097          	auipc	ra,0x0
 384:	184080e7          	jalr	388(ra) # 504 <fstat>
 388:	892a                	mv	s2,a0
  close(fd);
 38a:	8526                	mv	a0,s1
 38c:	00000097          	auipc	ra,0x0
 390:	158080e7          	jalr	344(ra) # 4e4 <close>
  return r;
}
 394:	854a                	mv	a0,s2
 396:	60e2                	ld	ra,24(sp)
 398:	6442                	ld	s0,16(sp)
 39a:	64a2                	ld	s1,8(sp)
 39c:	6902                	ld	s2,0(sp)
 39e:	6105                	addi	sp,sp,32
 3a0:	8082                	ret
    return -1;
 3a2:	597d                	li	s2,-1
 3a4:	bfc5                	j	394 <stat+0x34>

00000000000003a6 <atoi>:

int
atoi(const char *s)
{
 3a6:	1141                	addi	sp,sp,-16
 3a8:	e422                	sd	s0,8(sp)
 3aa:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 3ac:	00054703          	lbu	a4,0(a0)
 3b0:	02d00793          	li	a5,45
  int neg = 1;
 3b4:	4805                	li	a6,1
  if (*s == '-') {
 3b6:	04f70363          	beq	a4,a5,3fc <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 3ba:	00054683          	lbu	a3,0(a0)
 3be:	fd06879b          	addiw	a5,a3,-48
 3c2:	0ff7f793          	andi	a5,a5,255
 3c6:	4725                	li	a4,9
 3c8:	02f76d63          	bltu	a4,a5,402 <atoi+0x5c>
  n = 0;
 3cc:	4601                	li	a2,0
  while('0' <= *s && *s <= '9')
 3ce:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 3d0:	0505                	addi	a0,a0,1
 3d2:	0026179b          	slliw	a5,a2,0x2
 3d6:	9fb1                	addw	a5,a5,a2
 3d8:	0017979b          	slliw	a5,a5,0x1
 3dc:	9fb5                	addw	a5,a5,a3
 3de:	fd07861b          	addiw	a2,a5,-48
  while('0' <= *s && *s <= '9')
 3e2:	00054683          	lbu	a3,0(a0)
 3e6:	fd06871b          	addiw	a4,a3,-48
 3ea:	0ff77713          	andi	a4,a4,255
 3ee:	fee5f1e3          	bgeu	a1,a4,3d0 <atoi+0x2a>
  return n * neg;
}
 3f2:	02c8053b          	mulw	a0,a6,a2
 3f6:	6422                	ld	s0,8(sp)
 3f8:	0141                	addi	sp,sp,16
 3fa:	8082                	ret
    s++;
 3fc:	0505                	addi	a0,a0,1
    neg = -1;
 3fe:	587d                	li	a6,-1
 400:	bf6d                	j	3ba <atoi+0x14>
  n = 0;
 402:	4601                	li	a2,0
 404:	b7fd                	j	3f2 <atoi+0x4c>

0000000000000406 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 406:	1141                	addi	sp,sp,-16
 408:	e422                	sd	s0,8(sp)
 40a:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 40c:	02b57663          	bgeu	a0,a1,438 <memmove+0x32>
    while(n-- > 0)
 410:	02c05163          	blez	a2,432 <memmove+0x2c>
 414:	fff6079b          	addiw	a5,a2,-1
 418:	1782                	slli	a5,a5,0x20
 41a:	9381                	srli	a5,a5,0x20
 41c:	0785                	addi	a5,a5,1
 41e:	97aa                	add	a5,a5,a0
  dst = vdst;
 420:	872a                	mv	a4,a0
      *dst++ = *src++;
 422:	0585                	addi	a1,a1,1
 424:	0705                	addi	a4,a4,1
 426:	fff5c683          	lbu	a3,-1(a1)
 42a:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 42e:	fee79ae3          	bne	a5,a4,422 <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 432:	6422                	ld	s0,8(sp)
 434:	0141                	addi	sp,sp,16
 436:	8082                	ret
    dst += n;
 438:	00c50733          	add	a4,a0,a2
    src += n;
 43c:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 43e:	fec05ae3          	blez	a2,432 <memmove+0x2c>
 442:	fff6079b          	addiw	a5,a2,-1
 446:	1782                	slli	a5,a5,0x20
 448:	9381                	srli	a5,a5,0x20
 44a:	fff7c793          	not	a5,a5
 44e:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 450:	15fd                	addi	a1,a1,-1
 452:	177d                	addi	a4,a4,-1
 454:	0005c683          	lbu	a3,0(a1)
 458:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 45c:	fee79ae3          	bne	a5,a4,450 <memmove+0x4a>
 460:	bfc9                	j	432 <memmove+0x2c>

0000000000000462 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 462:	1141                	addi	sp,sp,-16
 464:	e422                	sd	s0,8(sp)
 466:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 468:	ca05                	beqz	a2,498 <memcmp+0x36>
 46a:	fff6069b          	addiw	a3,a2,-1
 46e:	1682                	slli	a3,a3,0x20
 470:	9281                	srli	a3,a3,0x20
 472:	0685                	addi	a3,a3,1
 474:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 476:	00054783          	lbu	a5,0(a0)
 47a:	0005c703          	lbu	a4,0(a1)
 47e:	00e79863          	bne	a5,a4,48e <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 482:	0505                	addi	a0,a0,1
    p2++;
 484:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 486:	fed518e3          	bne	a0,a3,476 <memcmp+0x14>
  }
  return 0;
 48a:	4501                	li	a0,0
 48c:	a019                	j	492 <memcmp+0x30>
      return *p1 - *p2;
 48e:	40e7853b          	subw	a0,a5,a4
}
 492:	6422                	ld	s0,8(sp)
 494:	0141                	addi	sp,sp,16
 496:	8082                	ret
  return 0;
 498:	4501                	li	a0,0
 49a:	bfe5                	j	492 <memcmp+0x30>

000000000000049c <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 49c:	1141                	addi	sp,sp,-16
 49e:	e406                	sd	ra,8(sp)
 4a0:	e022                	sd	s0,0(sp)
 4a2:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 4a4:	00000097          	auipc	ra,0x0
 4a8:	f62080e7          	jalr	-158(ra) # 406 <memmove>
}
 4ac:	60a2                	ld	ra,8(sp)
 4ae:	6402                	ld	s0,0(sp)
 4b0:	0141                	addi	sp,sp,16
 4b2:	8082                	ret

00000000000004b4 <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 4b4:	4885                	li	a7,1
 ecall
 4b6:	00000073          	ecall
 ret
 4ba:	8082                	ret

00000000000004bc <exit>:
.global exit
exit:
 li a7, SYS_exit
 4bc:	4889                	li	a7,2
 ecall
 4be:	00000073          	ecall
 ret
 4c2:	8082                	ret

00000000000004c4 <wait>:
.global wait
wait:
 li a7, SYS_wait
 4c4:	488d                	li	a7,3
 ecall
 4c6:	00000073          	ecall
 ret
 4ca:	8082                	ret

00000000000004cc <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 4cc:	4891                	li	a7,4
 ecall
 4ce:	00000073          	ecall
 ret
 4d2:	8082                	ret

00000000000004d4 <read>:
.global read
read:
 li a7, SYS_read
 4d4:	4895                	li	a7,5
 ecall
 4d6:	00000073          	ecall
 ret
 4da:	8082                	ret

00000000000004dc <write>:
.global write
write:
 li a7, SYS_write
 4dc:	48c1                	li	a7,16
 ecall
 4de:	00000073          	ecall
 ret
 4e2:	8082                	ret

00000000000004e4 <close>:
.global close
close:
 li a7, SYS_close
 4e4:	48d5                	li	a7,21
 ecall
 4e6:	00000073          	ecall
 ret
 4ea:	8082                	ret

00000000000004ec <kill>:
.global kill
kill:
 li a7, SYS_kill
 4ec:	4899                	li	a7,6
 ecall
 4ee:	00000073          	ecall
 ret
 4f2:	8082                	ret

00000000000004f4 <exec>:
.global exec
exec:
 li a7, SYS_exec
 4f4:	489d                	li	a7,7
 ecall
 4f6:	00000073          	ecall
 ret
 4fa:	8082                	ret

00000000000004fc <open>:
.global open
open:
 li a7, SYS_open
 4fc:	48bd                	li	a7,15
 ecall
 4fe:	00000073          	ecall
 ret
 502:	8082                	ret

0000000000000504 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 504:	48a1                	li	a7,8
 ecall
 506:	00000073          	ecall
 ret
 50a:	8082                	ret

000000000000050c <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 50c:	48d1                	li	a7,20
 ecall
 50e:	00000073          	ecall
 ret
 512:	8082                	ret

0000000000000514 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 514:	48a5                	li	a7,9
 ecall
 516:	00000073          	ecall
 ret
 51a:	8082                	ret

000000000000051c <dup>:
.global dup
dup:
 li a7, SYS_dup
 51c:	48a9                	li	a7,10
 ecall
 51e:	00000073          	ecall
 ret
 522:	8082                	ret

0000000000000524 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 524:	48ad                	li	a7,11
 ecall
 526:	00000073          	ecall
 ret
 52a:	8082                	ret

000000000000052c <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 52c:	48b1                	li	a7,12
 ecall
 52e:	00000073          	ecall
 ret
 532:	8082                	ret

0000000000000534 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 534:	48b5                	li	a7,13
 ecall
 536:	00000073          	ecall
 ret
 53a:	8082                	ret

000000000000053c <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 53c:	48b9                	li	a7,14
 ecall
 53e:	00000073          	ecall
 ret
 542:	8082                	ret

0000000000000544 <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 544:	48d9                	li	a7,22
 ecall
 546:	00000073          	ecall
 ret
 54a:	8082                	ret

000000000000054c <dev>:
.global dev
dev:
 li a7, SYS_dev
 54c:	48dd                	li	a7,23
 ecall
 54e:	00000073          	ecall
 ret
 552:	8082                	ret

0000000000000554 <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 554:	48e1                	li	a7,24
 ecall
 556:	00000073          	ecall
 ret
 55a:	8082                	ret

000000000000055c <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 55c:	48e5                	li	a7,25
 ecall
 55e:	00000073          	ecall
 ret
 562:	8082                	ret

0000000000000564 <remove>:
.global remove
remove:
 li a7, SYS_remove
 564:	48c5                	li	a7,17
 ecall
 566:	00000073          	ecall
 ret
 56a:	8082                	ret

000000000000056c <trace>:
.global trace
trace:
 li a7, SYS_trace
 56c:	48c9                	li	a7,18
 ecall
 56e:	00000073          	ecall
 ret
 572:	8082                	ret

0000000000000574 <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 574:	48cd                	li	a7,19
 ecall
 576:	00000073          	ecall
 ret
 57a:	8082                	ret

000000000000057c <rename>:
.global rename
rename:
 li a7, SYS_rename
 57c:	48e9                	li	a7,26
 ecall
 57e:	00000073          	ecall
 ret
 582:	8082                	ret

0000000000000584 <checkchar>:
.global checkchar
checkchar:
 li a7, SYS_checkchar
 584:	48ed                	li	a7,27
 ecall
 586:	00000073          	ecall
 ret
 58a:	8082                	ret

000000000000058c <sprint>:
.global sprint
sprint:
 li a7, SYS_sprint
 58c:	48f1                	li	a7,28
 ecall
 58e:	00000073          	ecall
 ret
 592:	8082                	ret

0000000000000594 <putc>:
static char digits[] = "0123456789ABCDEF";
static char printbuf[100];
static int  len = 0;
static void
putc(int fd, char c)
{
 594:	1141                	addi	sp,sp,-16
 596:	e422                	sd	s0,8(sp)
 598:	0800                	addi	s0,sp,16
  printbuf[len++]=c;
 59a:	00000797          	auipc	a5,0x0
 59e:	59e78793          	addi	a5,a5,1438 # b38 <len>
 5a2:	4398                	lw	a4,0(a5)
 5a4:	0017069b          	addiw	a3,a4,1
 5a8:	c394                	sw	a3,0(a5)
 5aa:	00000797          	auipc	a5,0x0
 5ae:	79e78793          	addi	a5,a5,1950 # d48 <printbuf>
 5b2:	97ba                	add	a5,a5,a4
 5b4:	00b78023          	sb	a1,0(a5)
}
 5b8:	6422                	ld	s0,8(sp)
 5ba:	0141                	addi	sp,sp,16
 5bc:	8082                	ret

00000000000005be <printint>:
	}
}

static void
printint(int fd, int xx, int base, int sgn)
{
 5be:	7139                	addi	sp,sp,-64
 5c0:	fc06                	sd	ra,56(sp)
 5c2:	f822                	sd	s0,48(sp)
 5c4:	f426                	sd	s1,40(sp)
 5c6:	f04a                	sd	s2,32(sp)
 5c8:	ec4e                	sd	s3,24(sp)
 5ca:	0080                	addi	s0,sp,64
 5cc:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5ce:	c299                	beqz	a3,5d4 <printint+0x16>
 5d0:	0805c863          	bltz	a1,660 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 5d4:	2581                	sext.w	a1,a1
  neg = 0;
 5d6:	4881                	li	a7,0
 5d8:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 5dc:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 5de:	2601                	sext.w	a2,a2
 5e0:	00000517          	auipc	a0,0x0
 5e4:	54050513          	addi	a0,a0,1344 # b20 <digits>
 5e8:	883a                	mv	a6,a4
 5ea:	2705                	addiw	a4,a4,1
 5ec:	02c5f7bb          	remuw	a5,a1,a2
 5f0:	1782                	slli	a5,a5,0x20
 5f2:	9381                	srli	a5,a5,0x20
 5f4:	97aa                	add	a5,a5,a0
 5f6:	0007c783          	lbu	a5,0(a5)
 5fa:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 5fe:	0005879b          	sext.w	a5,a1
 602:	02c5d5bb          	divuw	a1,a1,a2
 606:	0685                	addi	a3,a3,1
 608:	fec7f0e3          	bgeu	a5,a2,5e8 <printint+0x2a>
  if(neg)
 60c:	00088b63          	beqz	a7,622 <printint+0x64>
    buf[i++] = '-';
 610:	fd040793          	addi	a5,s0,-48
 614:	973e                	add	a4,a4,a5
 616:	02d00793          	li	a5,45
 61a:	fef70823          	sb	a5,-16(a4)
 61e:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 622:	02e05863          	blez	a4,652 <printint+0x94>
 626:	fc040793          	addi	a5,s0,-64
 62a:	00e78933          	add	s2,a5,a4
 62e:	fff78993          	addi	s3,a5,-1
 632:	99ba                	add	s3,s3,a4
 634:	377d                	addiw	a4,a4,-1
 636:	1702                	slli	a4,a4,0x20
 638:	9301                	srli	a4,a4,0x20
 63a:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 63e:	fff94583          	lbu	a1,-1(s2)
 642:	8526                	mv	a0,s1
 644:	00000097          	auipc	ra,0x0
 648:	f50080e7          	jalr	-176(ra) # 594 <putc>
  while(--i >= 0)
 64c:	197d                	addi	s2,s2,-1
 64e:	ff3918e3          	bne	s2,s3,63e <printint+0x80>
}
 652:	70e2                	ld	ra,56(sp)
 654:	7442                	ld	s0,48(sp)
 656:	74a2                	ld	s1,40(sp)
 658:	7902                	ld	s2,32(sp)
 65a:	69e2                	ld	s3,24(sp)
 65c:	6121                	addi	sp,sp,64
 65e:	8082                	ret
    x = -xx;
 660:	40b005bb          	negw	a1,a1
    neg = 1;
 664:	4885                	li	a7,1
    x = -xx;
 666:	bf8d                	j	5d8 <printint+0x1a>

0000000000000668 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 668:	7119                	addi	sp,sp,-128
 66a:	fc86                	sd	ra,120(sp)
 66c:	f8a2                	sd	s0,112(sp)
 66e:	f4a6                	sd	s1,104(sp)
 670:	f0ca                	sd	s2,96(sp)
 672:	ecce                	sd	s3,88(sp)
 674:	e8d2                	sd	s4,80(sp)
 676:	e4d6                	sd	s5,72(sp)
 678:	e0da                	sd	s6,64(sp)
 67a:	fc5e                	sd	s7,56(sp)
 67c:	f862                	sd	s8,48(sp)
 67e:	f466                	sd	s9,40(sp)
 680:	f06a                	sd	s10,32(sp)
 682:	ec6e                	sd	s11,24(sp)
 684:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 686:	0005c903          	lbu	s2,0(a1)
 68a:	18090f63          	beqz	s2,828 <vprintf+0x1c0>
 68e:	8aaa                	mv	s5,a0
 690:	8b32                	mv	s6,a2
 692:	00158493          	addi	s1,a1,1
  state = 0;
 696:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 698:	02500a13          	li	s4,37
      if(c == 'd'){
 69c:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 6a0:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 6a4:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 6a8:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 6ac:	00000b97          	auipc	s7,0x0
 6b0:	474b8b93          	addi	s7,s7,1140 # b20 <digits>
 6b4:	a839                	j	6d2 <vprintf+0x6a>
        putc(fd, c);
 6b6:	85ca                	mv	a1,s2
 6b8:	8556                	mv	a0,s5
 6ba:	00000097          	auipc	ra,0x0
 6be:	eda080e7          	jalr	-294(ra) # 594 <putc>
 6c2:	a019                	j	6c8 <vprintf+0x60>
    } else if(state == '%'){
 6c4:	01498f63          	beq	s3,s4,6e2 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 6c8:	0485                	addi	s1,s1,1
 6ca:	fff4c903          	lbu	s2,-1(s1)
 6ce:	14090d63          	beqz	s2,828 <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 6d2:	0009079b          	sext.w	a5,s2
    if(state == 0){
 6d6:	fe0997e3          	bnez	s3,6c4 <vprintf+0x5c>
      if(c == '%'){
 6da:	fd479ee3          	bne	a5,s4,6b6 <vprintf+0x4e>
        state = '%';
 6de:	89be                	mv	s3,a5
 6e0:	b7e5                	j	6c8 <vprintf+0x60>
      if(c == 'd'){
 6e2:	05878063          	beq	a5,s8,722 <vprintf+0xba>
      } else if(c == 'l') {
 6e6:	05978c63          	beq	a5,s9,73e <vprintf+0xd6>
      } else if(c == 'x') {
 6ea:	07a78863          	beq	a5,s10,75a <vprintf+0xf2>
      } else if(c == 'p') {
 6ee:	09b78463          	beq	a5,s11,776 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 6f2:	07300713          	li	a4,115
 6f6:	0ce78663          	beq	a5,a4,7c2 <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6fa:	06300713          	li	a4,99
 6fe:	0ee78e63          	beq	a5,a4,7fa <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 702:	11478863          	beq	a5,s4,812 <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 706:	85d2                	mv	a1,s4
 708:	8556                	mv	a0,s5
 70a:	00000097          	auipc	ra,0x0
 70e:	e8a080e7          	jalr	-374(ra) # 594 <putc>
        putc(fd, c);
 712:	85ca                	mv	a1,s2
 714:	8556                	mv	a0,s5
 716:	00000097          	auipc	ra,0x0
 71a:	e7e080e7          	jalr	-386(ra) # 594 <putc>
      }
      state = 0;
 71e:	4981                	li	s3,0
 720:	b765                	j	6c8 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 722:	008b0913          	addi	s2,s6,8
 726:	4685                	li	a3,1
 728:	4629                	li	a2,10
 72a:	000b2583          	lw	a1,0(s6)
 72e:	8556                	mv	a0,s5
 730:	00000097          	auipc	ra,0x0
 734:	e8e080e7          	jalr	-370(ra) # 5be <printint>
 738:	8b4a                	mv	s6,s2
      state = 0;
 73a:	4981                	li	s3,0
 73c:	b771                	j	6c8 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 73e:	008b0913          	addi	s2,s6,8
 742:	4681                	li	a3,0
 744:	4629                	li	a2,10
 746:	000b2583          	lw	a1,0(s6)
 74a:	8556                	mv	a0,s5
 74c:	00000097          	auipc	ra,0x0
 750:	e72080e7          	jalr	-398(ra) # 5be <printint>
 754:	8b4a                	mv	s6,s2
      state = 0;
 756:	4981                	li	s3,0
 758:	bf85                	j	6c8 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 75a:	008b0913          	addi	s2,s6,8
 75e:	4681                	li	a3,0
 760:	4641                	li	a2,16
 762:	000b2583          	lw	a1,0(s6)
 766:	8556                	mv	a0,s5
 768:	00000097          	auipc	ra,0x0
 76c:	e56080e7          	jalr	-426(ra) # 5be <printint>
 770:	8b4a                	mv	s6,s2
      state = 0;
 772:	4981                	li	s3,0
 774:	bf91                	j	6c8 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 776:	008b0793          	addi	a5,s6,8
 77a:	f8f43423          	sd	a5,-120(s0)
 77e:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 782:	03000593          	li	a1,48
 786:	8556                	mv	a0,s5
 788:	00000097          	auipc	ra,0x0
 78c:	e0c080e7          	jalr	-500(ra) # 594 <putc>
  putc(fd, 'x');
 790:	85ea                	mv	a1,s10
 792:	8556                	mv	a0,s5
 794:	00000097          	auipc	ra,0x0
 798:	e00080e7          	jalr	-512(ra) # 594 <putc>
 79c:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 79e:	03c9d793          	srli	a5,s3,0x3c
 7a2:	97de                	add	a5,a5,s7
 7a4:	0007c583          	lbu	a1,0(a5)
 7a8:	8556                	mv	a0,s5
 7aa:	00000097          	auipc	ra,0x0
 7ae:	dea080e7          	jalr	-534(ra) # 594 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 7b2:	0992                	slli	s3,s3,0x4
 7b4:	397d                	addiw	s2,s2,-1
 7b6:	fe0914e3          	bnez	s2,79e <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 7ba:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 7be:	4981                	li	s3,0
 7c0:	b721                	j	6c8 <vprintf+0x60>
        s = va_arg(ap, char*);
 7c2:	008b0993          	addi	s3,s6,8
 7c6:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 7ca:	02090163          	beqz	s2,7ec <vprintf+0x184>
        while(*s != 0){
 7ce:	00094583          	lbu	a1,0(s2)
 7d2:	c9a1                	beqz	a1,822 <vprintf+0x1ba>
          putc(fd, *s);
 7d4:	8556                	mv	a0,s5
 7d6:	00000097          	auipc	ra,0x0
 7da:	dbe080e7          	jalr	-578(ra) # 594 <putc>
          s++;
 7de:	0905                	addi	s2,s2,1
        while(*s != 0){
 7e0:	00094583          	lbu	a1,0(s2)
 7e4:	f9e5                	bnez	a1,7d4 <vprintf+0x16c>
        s = va_arg(ap, char*);
 7e6:	8b4e                	mv	s6,s3
      state = 0;
 7e8:	4981                	li	s3,0
 7ea:	bdf9                	j	6c8 <vprintf+0x60>
          s = "(null)";
 7ec:	00000917          	auipc	s2,0x0
 7f0:	32c90913          	addi	s2,s2,812 # b18 <malloc+0x166>
        while(*s != 0){
 7f4:	02800593          	li	a1,40
 7f8:	bff1                	j	7d4 <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 7fa:	008b0913          	addi	s2,s6,8
 7fe:	000b4583          	lbu	a1,0(s6)
 802:	8556                	mv	a0,s5
 804:	00000097          	auipc	ra,0x0
 808:	d90080e7          	jalr	-624(ra) # 594 <putc>
 80c:	8b4a                	mv	s6,s2
      state = 0;
 80e:	4981                	li	s3,0
 810:	bd65                	j	6c8 <vprintf+0x60>
        putc(fd, c);
 812:	85d2                	mv	a1,s4
 814:	8556                	mv	a0,s5
 816:	00000097          	auipc	ra,0x0
 81a:	d7e080e7          	jalr	-642(ra) # 594 <putc>
      state = 0;
 81e:	4981                	li	s3,0
 820:	b565                	j	6c8 <vprintf+0x60>
        s = va_arg(ap, char*);
 822:	8b4e                	mv	s6,s3
      state = 0;
 824:	4981                	li	s3,0
 826:	b54d                	j	6c8 <vprintf+0x60>
    }
  }
}
 828:	70e6                	ld	ra,120(sp)
 82a:	7446                	ld	s0,112(sp)
 82c:	74a6                	ld	s1,104(sp)
 82e:	7906                	ld	s2,96(sp)
 830:	69e6                	ld	s3,88(sp)
 832:	6a46                	ld	s4,80(sp)
 834:	6aa6                	ld	s5,72(sp)
 836:	6b06                	ld	s6,64(sp)
 838:	7be2                	ld	s7,56(sp)
 83a:	7c42                	ld	s8,48(sp)
 83c:	7ca2                	ld	s9,40(sp)
 83e:	7d02                	ld	s10,32(sp)
 840:	6de2                	ld	s11,24(sp)
 842:	6109                	addi	sp,sp,128
 844:	8082                	ret

0000000000000846 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 846:	711d                	addi	sp,sp,-96
 848:	f406                	sd	ra,40(sp)
 84a:	f022                	sd	s0,32(sp)
 84c:	ec26                	sd	s1,24(sp)
 84e:	e84a                	sd	s2,16(sp)
 850:	1800                	addi	s0,sp,48
 852:	84aa                	mv	s1,a0
 854:	e010                	sd	a2,0(s0)
 856:	e414                	sd	a3,8(s0)
 858:	e818                	sd	a4,16(s0)
 85a:	ec1c                	sd	a5,24(s0)
 85c:	03043023          	sd	a6,32(s0)
 860:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 864:	fc843c23          	sd	s0,-40(s0)
  vprintf(fd, fmt, ap);
 868:	8622                	mv	a2,s0
 86a:	00000097          	auipc	ra,0x0
 86e:	dfe080e7          	jalr	-514(ra) # 668 <vprintf>
	if(fd==1){
 872:	4785                	li	a5,1
 874:	02f48963          	beq	s1,a5,8a6 <fprintf+0x60>
	  write(fd, printbuf, len);
 878:	00000917          	auipc	s2,0x0
 87c:	2c090913          	addi	s2,s2,704 # b38 <len>
 880:	00092603          	lw	a2,0(s2)
 884:	00000597          	auipc	a1,0x0
 888:	4c458593          	addi	a1,a1,1220 # d48 <printbuf>
 88c:	8526                	mv	a0,s1
 88e:	00000097          	auipc	ra,0x0
 892:	c4e080e7          	jalr	-946(ra) # 4dc <write>
	  len=0;
 896:	00092023          	sw	zero,0(s2)
  fflush(fd);
}
 89a:	70a2                	ld	ra,40(sp)
 89c:	7402                	ld	s0,32(sp)
 89e:	64e2                	ld	s1,24(sp)
 8a0:	6942                	ld	s2,16(sp)
 8a2:	6125                	addi	sp,sp,96
 8a4:	8082                	ret
	  printbuf[len]=0;
 8a6:	00000517          	auipc	a0,0x0
 8aa:	4a250513          	addi	a0,a0,1186 # d48 <printbuf>
 8ae:	00000497          	auipc	s1,0x0
 8b2:	28a48493          	addi	s1,s1,650 # b38 <len>
 8b6:	409c                	lw	a5,0(s1)
 8b8:	97aa                	add	a5,a5,a0
 8ba:	00078023          	sb	zero,0(a5)
	  sprint(printbuf);
 8be:	00000097          	auipc	ra,0x0
 8c2:	cce080e7          	jalr	-818(ra) # 58c <sprint>
	  len=0;
 8c6:	0004a023          	sw	zero,0(s1)
 8ca:	bfc1                	j	89a <fprintf+0x54>

00000000000008cc <printf>:

void
printf(const char *fmt, ...)
{
 8cc:	7159                	addi	sp,sp,-112
 8ce:	f406                	sd	ra,40(sp)
 8d0:	f022                	sd	s0,32(sp)
 8d2:	ec26                	sd	s1,24(sp)
 8d4:	1800                	addi	s0,sp,48
 8d6:	e40c                	sd	a1,8(s0)
 8d8:	e810                	sd	a2,16(s0)
 8da:	ec14                	sd	a3,24(s0)
 8dc:	f018                	sd	a4,32(s0)
 8de:	f41c                	sd	a5,40(s0)
 8e0:	03043823          	sd	a6,48(s0)
 8e4:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 8e8:	00840613          	addi	a2,s0,8
 8ec:	fcc43c23          	sd	a2,-40(s0)
  vprintf(1, fmt, ap);
 8f0:	85aa                	mv	a1,a0
 8f2:	4505                	li	a0,1
 8f4:	00000097          	auipc	ra,0x0
 8f8:	d74080e7          	jalr	-652(ra) # 668 <vprintf>
	  printbuf[len]=0;
 8fc:	00000517          	auipc	a0,0x0
 900:	44c50513          	addi	a0,a0,1100 # d48 <printbuf>
 904:	00000497          	auipc	s1,0x0
 908:	23448493          	addi	s1,s1,564 # b38 <len>
 90c:	409c                	lw	a5,0(s1)
 90e:	97aa                	add	a5,a5,a0
 910:	00078023          	sb	zero,0(a5)
	  sprint(printbuf);
 914:	00000097          	auipc	ra,0x0
 918:	c78080e7          	jalr	-904(ra) # 58c <sprint>
	  len=0;
 91c:	0004a023          	sw	zero,0(s1)
  fflush(1);
}
 920:	70a2                	ld	ra,40(sp)
 922:	7402                	ld	s0,32(sp)
 924:	64e2                	ld	s1,24(sp)
 926:	6165                	addi	sp,sp,112
 928:	8082                	ret

000000000000092a <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 92a:	1141                	addi	sp,sp,-16
 92c:	e422                	sd	s0,8(sp)
 92e:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 930:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 934:	00000797          	auipc	a5,0x0
 938:	20c7b783          	ld	a5,524(a5) # b40 <freep>
 93c:	a805                	j	96c <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 93e:	4618                	lw	a4,8(a2)
 940:	9db9                	addw	a1,a1,a4
 942:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 946:	6398                	ld	a4,0(a5)
 948:	6318                	ld	a4,0(a4)
 94a:	fee53823          	sd	a4,-16(a0)
 94e:	a091                	j	992 <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 950:	ff852703          	lw	a4,-8(a0)
 954:	9e39                	addw	a2,a2,a4
 956:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 958:	ff053703          	ld	a4,-16(a0)
 95c:	e398                	sd	a4,0(a5)
 95e:	a099                	j	9a4 <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 960:	6398                	ld	a4,0(a5)
 962:	00e7e463          	bltu	a5,a4,96a <free+0x40>
 966:	00e6ea63          	bltu	a3,a4,97a <free+0x50>
{
 96a:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 96c:	fed7fae3          	bgeu	a5,a3,960 <free+0x36>
 970:	6398                	ld	a4,0(a5)
 972:	00e6e463          	bltu	a3,a4,97a <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 976:	fee7eae3          	bltu	a5,a4,96a <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 97a:	ff852583          	lw	a1,-8(a0)
 97e:	6390                	ld	a2,0(a5)
 980:	02059713          	slli	a4,a1,0x20
 984:	9301                	srli	a4,a4,0x20
 986:	0712                	slli	a4,a4,0x4
 988:	9736                	add	a4,a4,a3
 98a:	fae60ae3          	beq	a2,a4,93e <free+0x14>
    bp->s.ptr = p->s.ptr;
 98e:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 992:	4790                	lw	a2,8(a5)
 994:	02061713          	slli	a4,a2,0x20
 998:	9301                	srli	a4,a4,0x20
 99a:	0712                	slli	a4,a4,0x4
 99c:	973e                	add	a4,a4,a5
 99e:	fae689e3          	beq	a3,a4,950 <free+0x26>
  } else
    p->s.ptr = bp;
 9a2:	e394                	sd	a3,0(a5)
  freep = p;
 9a4:	00000717          	auipc	a4,0x0
 9a8:	18f73e23          	sd	a5,412(a4) # b40 <freep>
}
 9ac:	6422                	ld	s0,8(sp)
 9ae:	0141                	addi	sp,sp,16
 9b0:	8082                	ret

00000000000009b2 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 9b2:	7139                	addi	sp,sp,-64
 9b4:	fc06                	sd	ra,56(sp)
 9b6:	f822                	sd	s0,48(sp)
 9b8:	f426                	sd	s1,40(sp)
 9ba:	f04a                	sd	s2,32(sp)
 9bc:	ec4e                	sd	s3,24(sp)
 9be:	e852                	sd	s4,16(sp)
 9c0:	e456                	sd	s5,8(sp)
 9c2:	e05a                	sd	s6,0(sp)
 9c4:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9c6:	02051493          	slli	s1,a0,0x20
 9ca:	9081                	srli	s1,s1,0x20
 9cc:	04bd                	addi	s1,s1,15
 9ce:	8091                	srli	s1,s1,0x4
 9d0:	0014899b          	addiw	s3,s1,1
 9d4:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 9d6:	00000517          	auipc	a0,0x0
 9da:	16a53503          	ld	a0,362(a0) # b40 <freep>
 9de:	c515                	beqz	a0,a0a <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9e0:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 9e2:	4798                	lw	a4,8(a5)
 9e4:	02977f63          	bgeu	a4,s1,a22 <malloc+0x70>
 9e8:	8a4e                	mv	s4,s3
 9ea:	0009871b          	sext.w	a4,s3
 9ee:	6685                	lui	a3,0x1
 9f0:	00d77363          	bgeu	a4,a3,9f6 <malloc+0x44>
 9f4:	6a05                	lui	s4,0x1
 9f6:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 9fa:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 9fe:	00000917          	auipc	s2,0x0
 a02:	14290913          	addi	s2,s2,322 # b40 <freep>
  if(p == (char*)-1)
 a06:	5afd                	li	s5,-1
 a08:	a88d                	j	a7a <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 a0a:	00000797          	auipc	a5,0x0
 a0e:	3a678793          	addi	a5,a5,934 # db0 <base>
 a12:	00000717          	auipc	a4,0x0
 a16:	12f73723          	sd	a5,302(a4) # b40 <freep>
 a1a:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 a1c:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 a20:	b7e1                	j	9e8 <malloc+0x36>
      if(p->s.size == nunits)
 a22:	02e48b63          	beq	s1,a4,a58 <malloc+0xa6>
        p->s.size -= nunits;
 a26:	4137073b          	subw	a4,a4,s3
 a2a:	c798                	sw	a4,8(a5)
        p += p->s.size;
 a2c:	1702                	slli	a4,a4,0x20
 a2e:	9301                	srli	a4,a4,0x20
 a30:	0712                	slli	a4,a4,0x4
 a32:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 a34:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 a38:	00000717          	auipc	a4,0x0
 a3c:	10a73423          	sd	a0,264(a4) # b40 <freep>
      return (void*)(p + 1);
 a40:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a44:	70e2                	ld	ra,56(sp)
 a46:	7442                	ld	s0,48(sp)
 a48:	74a2                	ld	s1,40(sp)
 a4a:	7902                	ld	s2,32(sp)
 a4c:	69e2                	ld	s3,24(sp)
 a4e:	6a42                	ld	s4,16(sp)
 a50:	6aa2                	ld	s5,8(sp)
 a52:	6b02                	ld	s6,0(sp)
 a54:	6121                	addi	sp,sp,64
 a56:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 a58:	6398                	ld	a4,0(a5)
 a5a:	e118                	sd	a4,0(a0)
 a5c:	bff1                	j	a38 <malloc+0x86>
  hp->s.size = nu;
 a5e:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 a62:	0541                	addi	a0,a0,16
 a64:	00000097          	auipc	ra,0x0
 a68:	ec6080e7          	jalr	-314(ra) # 92a <free>
  return freep;
 a6c:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 a70:	d971                	beqz	a0,a44 <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a72:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 a74:	4798                	lw	a4,8(a5)
 a76:	fa9776e3          	bgeu	a4,s1,a22 <malloc+0x70>
    if(p == freep)
 a7a:	00093703          	ld	a4,0(s2)
 a7e:	853e                	mv	a0,a5
 a80:	fef719e3          	bne	a4,a5,a72 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 a84:	8552                	mv	a0,s4
 a86:	00000097          	auipc	ra,0x0
 a8a:	aa6080e7          	jalr	-1370(ra) # 52c <sbrk>
  if(p == (char*)-1)
 a8e:	fd5518e3          	bne	a0,s5,a5e <malloc+0xac>
        return 0;
 a92:	4501                	li	a0,0
 a94:	bf45                	j	a44 <malloc+0x92>
