
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
  1e:	a8e50513          	addi	a0,a0,-1394 # aa8 <path>
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
  6e:	a3e60613          	addi	a2,a2,-1474 # aa8 <path>
  72:	00001597          	auipc	a1,0x1
  76:	98e58593          	addi	a1,a1,-1650 # a00 <malloc+0xe6>
  7a:	4509                	li	a0,2
  7c:	00000097          	auipc	ra,0x0
  80:	7b2080e7          	jalr	1970(ra) # 82e <fprintf>
        return;
  84:	bfc1                	j	54 <find+0x54>
        fprintf(2, "find: cannot stat %s\n", path);
  86:	00001617          	auipc	a2,0x1
  8a:	a2260613          	addi	a2,a2,-1502 # aa8 <path>
  8e:	00001597          	auipc	a1,0x1
  92:	98a58593          	addi	a1,a1,-1654 # a18 <malloc+0xfe>
  96:	4509                	li	a0,2
  98:	00000097          	auipc	ra,0x0
  9c:	796080e7          	jalr	1942(ra) # 82e <fprintf>
        close(fd);
  a0:	8526                	mv	a0,s1
  a2:	00000097          	auipc	ra,0x0
  a6:	442080e7          	jalr	1090(ra) # 4e4 <close>
        return;
  aa:	b76d                	j	54 <find+0x54>
    if (strlen(path) + 255 + 2 > sizeof(path)) {
  ac:	00001517          	auipc	a0,0x1
  b0:	9fc50513          	addi	a0,a0,-1540 # aa8 <path>
  b4:	00000097          	auipc	ra,0x0
  b8:	1c4080e7          	jalr	452(ra) # 278 <strlen>
  bc:	1015051b          	addiw	a0,a0,257
  c0:	20000793          	li	a5,512
  c4:	0aa7e863          	bltu	a5,a0,174 <find+0x174>
    char *p = path + strlen(path) - 1;
  c8:	00001917          	auipc	s2,0x1
  cc:	9e090913          	addi	s2,s2,-1568 # aa8 <path>
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
  f8:	9b490913          	addi	s2,s2,-1612 # aa8 <path>
  fc:	992a                	add	s2,s2,a0
    p++;
  fe:	0905                	addi	s2,s2,1
        if (strcmp(p, ".") == 0 || strcmp(p, "..") == 0) {
 100:	00001a17          	auipc	s4,0x1
 104:	948a0a13          	addi	s4,s4,-1720 # a48 <malloc+0x12e>
 108:	00001a97          	auipc	s5,0x1
 10c:	948a8a93          	addi	s5,s5,-1720 # a50 <malloc+0x136>
            fprintf(1, "%s\n", path);
 110:	00001b97          	auipc	s7,0x1
 114:	998b8b93          	addi	s7,s7,-1640 # aa8 <path>
 118:	00001b17          	auipc	s6,0x1
 11c:	940b0b13          	addi	s6,s6,-1728 # a58 <malloc+0x13e>
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
 178:	8bc58593          	addi	a1,a1,-1860 # a30 <malloc+0x116>
 17c:	4509                	li	a0,2
 17e:	00000097          	auipc	ra,0x0
 182:	6b0080e7          	jalr	1712(ra) # 82e <fprintf>
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
 19c:	696080e7          	jalr	1686(ra) # 82e <fprintf>
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
 1c2:	8a258593          	addi	a1,a1,-1886 # a60 <malloc+0x146>
 1c6:	4509                	li	a0,2
 1c8:	00000097          	auipc	ra,0x0
 1cc:	666080e7          	jalr	1638(ra) # 82e <fprintf>
        exit(0);
 1d0:	4501                	li	a0,0
 1d2:	00000097          	auipc	ra,0x0
 1d6:	2ea080e7          	jalr	746(ra) # 4bc <exit>
 1da:	84ae                	mv	s1,a1
    } else {
        strcpy(path, argv[1]);
 1dc:	658c                	ld	a1,8(a1)
 1de:	00001517          	auipc	a0,0x1
 1e2:	8ca50513          	addi	a0,a0,-1846 # aa8 <path>
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

0000000000000584 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 584:	1101                	addi	sp,sp,-32
 586:	ec06                	sd	ra,24(sp)
 588:	e822                	sd	s0,16(sp)
 58a:	1000                	addi	s0,sp,32
 58c:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 590:	4605                	li	a2,1
 592:	fef40593          	addi	a1,s0,-17
 596:	00000097          	auipc	ra,0x0
 59a:	f46080e7          	jalr	-186(ra) # 4dc <write>
}
 59e:	60e2                	ld	ra,24(sp)
 5a0:	6442                	ld	s0,16(sp)
 5a2:	6105                	addi	sp,sp,32
 5a4:	8082                	ret

00000000000005a6 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5a6:	7139                	addi	sp,sp,-64
 5a8:	fc06                	sd	ra,56(sp)
 5aa:	f822                	sd	s0,48(sp)
 5ac:	f426                	sd	s1,40(sp)
 5ae:	f04a                	sd	s2,32(sp)
 5b0:	ec4e                	sd	s3,24(sp)
 5b2:	0080                	addi	s0,sp,64
 5b4:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5b6:	c299                	beqz	a3,5bc <printint+0x16>
 5b8:	0805c863          	bltz	a1,648 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 5bc:	2581                	sext.w	a1,a1
  neg = 0;
 5be:	4881                	li	a7,0
 5c0:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 5c4:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 5c6:	2601                	sext.w	a2,a2
 5c8:	00000517          	auipc	a0,0x0
 5cc:	4c050513          	addi	a0,a0,1216 # a88 <digits>
 5d0:	883a                	mv	a6,a4
 5d2:	2705                	addiw	a4,a4,1
 5d4:	02c5f7bb          	remuw	a5,a1,a2
 5d8:	1782                	slli	a5,a5,0x20
 5da:	9381                	srli	a5,a5,0x20
 5dc:	97aa                	add	a5,a5,a0
 5de:	0007c783          	lbu	a5,0(a5)
 5e2:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 5e6:	0005879b          	sext.w	a5,a1
 5ea:	02c5d5bb          	divuw	a1,a1,a2
 5ee:	0685                	addi	a3,a3,1
 5f0:	fec7f0e3          	bgeu	a5,a2,5d0 <printint+0x2a>
  if(neg)
 5f4:	00088b63          	beqz	a7,60a <printint+0x64>
    buf[i++] = '-';
 5f8:	fd040793          	addi	a5,s0,-48
 5fc:	973e                	add	a4,a4,a5
 5fe:	02d00793          	li	a5,45
 602:	fef70823          	sb	a5,-16(a4)
 606:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 60a:	02e05863          	blez	a4,63a <printint+0x94>
 60e:	fc040793          	addi	a5,s0,-64
 612:	00e78933          	add	s2,a5,a4
 616:	fff78993          	addi	s3,a5,-1
 61a:	99ba                	add	s3,s3,a4
 61c:	377d                	addiw	a4,a4,-1
 61e:	1702                	slli	a4,a4,0x20
 620:	9301                	srli	a4,a4,0x20
 622:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 626:	fff94583          	lbu	a1,-1(s2)
 62a:	8526                	mv	a0,s1
 62c:	00000097          	auipc	ra,0x0
 630:	f58080e7          	jalr	-168(ra) # 584 <putc>
  while(--i >= 0)
 634:	197d                	addi	s2,s2,-1
 636:	ff3918e3          	bne	s2,s3,626 <printint+0x80>
}
 63a:	70e2                	ld	ra,56(sp)
 63c:	7442                	ld	s0,48(sp)
 63e:	74a2                	ld	s1,40(sp)
 640:	7902                	ld	s2,32(sp)
 642:	69e2                	ld	s3,24(sp)
 644:	6121                	addi	sp,sp,64
 646:	8082                	ret
    x = -xx;
 648:	40b005bb          	negw	a1,a1
    neg = 1;
 64c:	4885                	li	a7,1
    x = -xx;
 64e:	bf8d                	j	5c0 <printint+0x1a>

0000000000000650 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 650:	7119                	addi	sp,sp,-128
 652:	fc86                	sd	ra,120(sp)
 654:	f8a2                	sd	s0,112(sp)
 656:	f4a6                	sd	s1,104(sp)
 658:	f0ca                	sd	s2,96(sp)
 65a:	ecce                	sd	s3,88(sp)
 65c:	e8d2                	sd	s4,80(sp)
 65e:	e4d6                	sd	s5,72(sp)
 660:	e0da                	sd	s6,64(sp)
 662:	fc5e                	sd	s7,56(sp)
 664:	f862                	sd	s8,48(sp)
 666:	f466                	sd	s9,40(sp)
 668:	f06a                	sd	s10,32(sp)
 66a:	ec6e                	sd	s11,24(sp)
 66c:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 66e:	0005c903          	lbu	s2,0(a1)
 672:	18090f63          	beqz	s2,810 <vprintf+0x1c0>
 676:	8aaa                	mv	s5,a0
 678:	8b32                	mv	s6,a2
 67a:	00158493          	addi	s1,a1,1
  state = 0;
 67e:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 680:	02500a13          	li	s4,37
      if(c == 'd'){
 684:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 688:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 68c:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 690:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 694:	00000b97          	auipc	s7,0x0
 698:	3f4b8b93          	addi	s7,s7,1012 # a88 <digits>
 69c:	a839                	j	6ba <vprintf+0x6a>
        putc(fd, c);
 69e:	85ca                	mv	a1,s2
 6a0:	8556                	mv	a0,s5
 6a2:	00000097          	auipc	ra,0x0
 6a6:	ee2080e7          	jalr	-286(ra) # 584 <putc>
 6aa:	a019                	j	6b0 <vprintf+0x60>
    } else if(state == '%'){
 6ac:	01498f63          	beq	s3,s4,6ca <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 6b0:	0485                	addi	s1,s1,1
 6b2:	fff4c903          	lbu	s2,-1(s1)
 6b6:	14090d63          	beqz	s2,810 <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 6ba:	0009079b          	sext.w	a5,s2
    if(state == 0){
 6be:	fe0997e3          	bnez	s3,6ac <vprintf+0x5c>
      if(c == '%'){
 6c2:	fd479ee3          	bne	a5,s4,69e <vprintf+0x4e>
        state = '%';
 6c6:	89be                	mv	s3,a5
 6c8:	b7e5                	j	6b0 <vprintf+0x60>
      if(c == 'd'){
 6ca:	05878063          	beq	a5,s8,70a <vprintf+0xba>
      } else if(c == 'l') {
 6ce:	05978c63          	beq	a5,s9,726 <vprintf+0xd6>
      } else if(c == 'x') {
 6d2:	07a78863          	beq	a5,s10,742 <vprintf+0xf2>
      } else if(c == 'p') {
 6d6:	09b78463          	beq	a5,s11,75e <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 6da:	07300713          	li	a4,115
 6de:	0ce78663          	beq	a5,a4,7aa <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6e2:	06300713          	li	a4,99
 6e6:	0ee78e63          	beq	a5,a4,7e2 <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 6ea:	11478863          	beq	a5,s4,7fa <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6ee:	85d2                	mv	a1,s4
 6f0:	8556                	mv	a0,s5
 6f2:	00000097          	auipc	ra,0x0
 6f6:	e92080e7          	jalr	-366(ra) # 584 <putc>
        putc(fd, c);
 6fa:	85ca                	mv	a1,s2
 6fc:	8556                	mv	a0,s5
 6fe:	00000097          	auipc	ra,0x0
 702:	e86080e7          	jalr	-378(ra) # 584 <putc>
      }
      state = 0;
 706:	4981                	li	s3,0
 708:	b765                	j	6b0 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 70a:	008b0913          	addi	s2,s6,8
 70e:	4685                	li	a3,1
 710:	4629                	li	a2,10
 712:	000b2583          	lw	a1,0(s6)
 716:	8556                	mv	a0,s5
 718:	00000097          	auipc	ra,0x0
 71c:	e8e080e7          	jalr	-370(ra) # 5a6 <printint>
 720:	8b4a                	mv	s6,s2
      state = 0;
 722:	4981                	li	s3,0
 724:	b771                	j	6b0 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 726:	008b0913          	addi	s2,s6,8
 72a:	4681                	li	a3,0
 72c:	4629                	li	a2,10
 72e:	000b2583          	lw	a1,0(s6)
 732:	8556                	mv	a0,s5
 734:	00000097          	auipc	ra,0x0
 738:	e72080e7          	jalr	-398(ra) # 5a6 <printint>
 73c:	8b4a                	mv	s6,s2
      state = 0;
 73e:	4981                	li	s3,0
 740:	bf85                	j	6b0 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 742:	008b0913          	addi	s2,s6,8
 746:	4681                	li	a3,0
 748:	4641                	li	a2,16
 74a:	000b2583          	lw	a1,0(s6)
 74e:	8556                	mv	a0,s5
 750:	00000097          	auipc	ra,0x0
 754:	e56080e7          	jalr	-426(ra) # 5a6 <printint>
 758:	8b4a                	mv	s6,s2
      state = 0;
 75a:	4981                	li	s3,0
 75c:	bf91                	j	6b0 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 75e:	008b0793          	addi	a5,s6,8
 762:	f8f43423          	sd	a5,-120(s0)
 766:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 76a:	03000593          	li	a1,48
 76e:	8556                	mv	a0,s5
 770:	00000097          	auipc	ra,0x0
 774:	e14080e7          	jalr	-492(ra) # 584 <putc>
  putc(fd, 'x');
 778:	85ea                	mv	a1,s10
 77a:	8556                	mv	a0,s5
 77c:	00000097          	auipc	ra,0x0
 780:	e08080e7          	jalr	-504(ra) # 584 <putc>
 784:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 786:	03c9d793          	srli	a5,s3,0x3c
 78a:	97de                	add	a5,a5,s7
 78c:	0007c583          	lbu	a1,0(a5)
 790:	8556                	mv	a0,s5
 792:	00000097          	auipc	ra,0x0
 796:	df2080e7          	jalr	-526(ra) # 584 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 79a:	0992                	slli	s3,s3,0x4
 79c:	397d                	addiw	s2,s2,-1
 79e:	fe0914e3          	bnez	s2,786 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 7a2:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 7a6:	4981                	li	s3,0
 7a8:	b721                	j	6b0 <vprintf+0x60>
        s = va_arg(ap, char*);
 7aa:	008b0993          	addi	s3,s6,8
 7ae:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 7b2:	02090163          	beqz	s2,7d4 <vprintf+0x184>
        while(*s != 0){
 7b6:	00094583          	lbu	a1,0(s2)
 7ba:	c9a1                	beqz	a1,80a <vprintf+0x1ba>
          putc(fd, *s);
 7bc:	8556                	mv	a0,s5
 7be:	00000097          	auipc	ra,0x0
 7c2:	dc6080e7          	jalr	-570(ra) # 584 <putc>
          s++;
 7c6:	0905                	addi	s2,s2,1
        while(*s != 0){
 7c8:	00094583          	lbu	a1,0(s2)
 7cc:	f9e5                	bnez	a1,7bc <vprintf+0x16c>
        s = va_arg(ap, char*);
 7ce:	8b4e                	mv	s6,s3
      state = 0;
 7d0:	4981                	li	s3,0
 7d2:	bdf9                	j	6b0 <vprintf+0x60>
          s = "(null)";
 7d4:	00000917          	auipc	s2,0x0
 7d8:	2ac90913          	addi	s2,s2,684 # a80 <malloc+0x166>
        while(*s != 0){
 7dc:	02800593          	li	a1,40
 7e0:	bff1                	j	7bc <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 7e2:	008b0913          	addi	s2,s6,8
 7e6:	000b4583          	lbu	a1,0(s6)
 7ea:	8556                	mv	a0,s5
 7ec:	00000097          	auipc	ra,0x0
 7f0:	d98080e7          	jalr	-616(ra) # 584 <putc>
 7f4:	8b4a                	mv	s6,s2
      state = 0;
 7f6:	4981                	li	s3,0
 7f8:	bd65                	j	6b0 <vprintf+0x60>
        putc(fd, c);
 7fa:	85d2                	mv	a1,s4
 7fc:	8556                	mv	a0,s5
 7fe:	00000097          	auipc	ra,0x0
 802:	d86080e7          	jalr	-634(ra) # 584 <putc>
      state = 0;
 806:	4981                	li	s3,0
 808:	b565                	j	6b0 <vprintf+0x60>
        s = va_arg(ap, char*);
 80a:	8b4e                	mv	s6,s3
      state = 0;
 80c:	4981                	li	s3,0
 80e:	b54d                	j	6b0 <vprintf+0x60>
    }
  }
}
 810:	70e6                	ld	ra,120(sp)
 812:	7446                	ld	s0,112(sp)
 814:	74a6                	ld	s1,104(sp)
 816:	7906                	ld	s2,96(sp)
 818:	69e6                	ld	s3,88(sp)
 81a:	6a46                	ld	s4,80(sp)
 81c:	6aa6                	ld	s5,72(sp)
 81e:	6b06                	ld	s6,64(sp)
 820:	7be2                	ld	s7,56(sp)
 822:	7c42                	ld	s8,48(sp)
 824:	7ca2                	ld	s9,40(sp)
 826:	7d02                	ld	s10,32(sp)
 828:	6de2                	ld	s11,24(sp)
 82a:	6109                	addi	sp,sp,128
 82c:	8082                	ret

000000000000082e <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 82e:	715d                	addi	sp,sp,-80
 830:	ec06                	sd	ra,24(sp)
 832:	e822                	sd	s0,16(sp)
 834:	1000                	addi	s0,sp,32
 836:	e010                	sd	a2,0(s0)
 838:	e414                	sd	a3,8(s0)
 83a:	e818                	sd	a4,16(s0)
 83c:	ec1c                	sd	a5,24(s0)
 83e:	03043023          	sd	a6,32(s0)
 842:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 846:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 84a:	8622                	mv	a2,s0
 84c:	00000097          	auipc	ra,0x0
 850:	e04080e7          	jalr	-508(ra) # 650 <vprintf>
}
 854:	60e2                	ld	ra,24(sp)
 856:	6442                	ld	s0,16(sp)
 858:	6161                	addi	sp,sp,80
 85a:	8082                	ret

000000000000085c <printf>:

void
printf(const char *fmt, ...)
{
 85c:	711d                	addi	sp,sp,-96
 85e:	ec06                	sd	ra,24(sp)
 860:	e822                	sd	s0,16(sp)
 862:	1000                	addi	s0,sp,32
 864:	e40c                	sd	a1,8(s0)
 866:	e810                	sd	a2,16(s0)
 868:	ec14                	sd	a3,24(s0)
 86a:	f018                	sd	a4,32(s0)
 86c:	f41c                	sd	a5,40(s0)
 86e:	03043823          	sd	a6,48(s0)
 872:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 876:	00840613          	addi	a2,s0,8
 87a:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 87e:	85aa                	mv	a1,a0
 880:	4505                	li	a0,1
 882:	00000097          	auipc	ra,0x0
 886:	dce080e7          	jalr	-562(ra) # 650 <vprintf>
}
 88a:	60e2                	ld	ra,24(sp)
 88c:	6442                	ld	s0,16(sp)
 88e:	6125                	addi	sp,sp,96
 890:	8082                	ret

0000000000000892 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 892:	1141                	addi	sp,sp,-16
 894:	e422                	sd	s0,8(sp)
 896:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 898:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 89c:	00000797          	auipc	a5,0x0
 8a0:	2047b783          	ld	a5,516(a5) # aa0 <freep>
 8a4:	a805                	j	8d4 <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 8a6:	4618                	lw	a4,8(a2)
 8a8:	9db9                	addw	a1,a1,a4
 8aa:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 8ae:	6398                	ld	a4,0(a5)
 8b0:	6318                	ld	a4,0(a4)
 8b2:	fee53823          	sd	a4,-16(a0)
 8b6:	a091                	j	8fa <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 8b8:	ff852703          	lw	a4,-8(a0)
 8bc:	9e39                	addw	a2,a2,a4
 8be:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 8c0:	ff053703          	ld	a4,-16(a0)
 8c4:	e398                	sd	a4,0(a5)
 8c6:	a099                	j	90c <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8c8:	6398                	ld	a4,0(a5)
 8ca:	00e7e463          	bltu	a5,a4,8d2 <free+0x40>
 8ce:	00e6ea63          	bltu	a3,a4,8e2 <free+0x50>
{
 8d2:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8d4:	fed7fae3          	bgeu	a5,a3,8c8 <free+0x36>
 8d8:	6398                	ld	a4,0(a5)
 8da:	00e6e463          	bltu	a3,a4,8e2 <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8de:	fee7eae3          	bltu	a5,a4,8d2 <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 8e2:	ff852583          	lw	a1,-8(a0)
 8e6:	6390                	ld	a2,0(a5)
 8e8:	02059713          	slli	a4,a1,0x20
 8ec:	9301                	srli	a4,a4,0x20
 8ee:	0712                	slli	a4,a4,0x4
 8f0:	9736                	add	a4,a4,a3
 8f2:	fae60ae3          	beq	a2,a4,8a6 <free+0x14>
    bp->s.ptr = p->s.ptr;
 8f6:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 8fa:	4790                	lw	a2,8(a5)
 8fc:	02061713          	slli	a4,a2,0x20
 900:	9301                	srli	a4,a4,0x20
 902:	0712                	slli	a4,a4,0x4
 904:	973e                	add	a4,a4,a5
 906:	fae689e3          	beq	a3,a4,8b8 <free+0x26>
  } else
    p->s.ptr = bp;
 90a:	e394                	sd	a3,0(a5)
  freep = p;
 90c:	00000717          	auipc	a4,0x0
 910:	18f73a23          	sd	a5,404(a4) # aa0 <freep>
}
 914:	6422                	ld	s0,8(sp)
 916:	0141                	addi	sp,sp,16
 918:	8082                	ret

000000000000091a <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 91a:	7139                	addi	sp,sp,-64
 91c:	fc06                	sd	ra,56(sp)
 91e:	f822                	sd	s0,48(sp)
 920:	f426                	sd	s1,40(sp)
 922:	f04a                	sd	s2,32(sp)
 924:	ec4e                	sd	s3,24(sp)
 926:	e852                	sd	s4,16(sp)
 928:	e456                	sd	s5,8(sp)
 92a:	e05a                	sd	s6,0(sp)
 92c:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 92e:	02051493          	slli	s1,a0,0x20
 932:	9081                	srli	s1,s1,0x20
 934:	04bd                	addi	s1,s1,15
 936:	8091                	srli	s1,s1,0x4
 938:	0014899b          	addiw	s3,s1,1
 93c:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 93e:	00000517          	auipc	a0,0x0
 942:	16253503          	ld	a0,354(a0) # aa0 <freep>
 946:	c515                	beqz	a0,972 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 948:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 94a:	4798                	lw	a4,8(a5)
 94c:	02977f63          	bgeu	a4,s1,98a <malloc+0x70>
 950:	8a4e                	mv	s4,s3
 952:	0009871b          	sext.w	a4,s3
 956:	6685                	lui	a3,0x1
 958:	00d77363          	bgeu	a4,a3,95e <malloc+0x44>
 95c:	6a05                	lui	s4,0x1
 95e:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 962:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 966:	00000917          	auipc	s2,0x0
 96a:	13a90913          	addi	s2,s2,314 # aa0 <freep>
  if(p == (char*)-1)
 96e:	5afd                	li	s5,-1
 970:	a88d                	j	9e2 <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 972:	00000797          	auipc	a5,0x0
 976:	33678793          	addi	a5,a5,822 # ca8 <base>
 97a:	00000717          	auipc	a4,0x0
 97e:	12f73323          	sd	a5,294(a4) # aa0 <freep>
 982:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 984:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 988:	b7e1                	j	950 <malloc+0x36>
      if(p->s.size == nunits)
 98a:	02e48b63          	beq	s1,a4,9c0 <malloc+0xa6>
        p->s.size -= nunits;
 98e:	4137073b          	subw	a4,a4,s3
 992:	c798                	sw	a4,8(a5)
        p += p->s.size;
 994:	1702                	slli	a4,a4,0x20
 996:	9301                	srli	a4,a4,0x20
 998:	0712                	slli	a4,a4,0x4
 99a:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 99c:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 9a0:	00000717          	auipc	a4,0x0
 9a4:	10a73023          	sd	a0,256(a4) # aa0 <freep>
      return (void*)(p + 1);
 9a8:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9ac:	70e2                	ld	ra,56(sp)
 9ae:	7442                	ld	s0,48(sp)
 9b0:	74a2                	ld	s1,40(sp)
 9b2:	7902                	ld	s2,32(sp)
 9b4:	69e2                	ld	s3,24(sp)
 9b6:	6a42                	ld	s4,16(sp)
 9b8:	6aa2                	ld	s5,8(sp)
 9ba:	6b02                	ld	s6,0(sp)
 9bc:	6121                	addi	sp,sp,64
 9be:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 9c0:	6398                	ld	a4,0(a5)
 9c2:	e118                	sd	a4,0(a0)
 9c4:	bff1                	j	9a0 <malloc+0x86>
  hp->s.size = nu;
 9c6:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 9ca:	0541                	addi	a0,a0,16
 9cc:	00000097          	auipc	ra,0x0
 9d0:	ec6080e7          	jalr	-314(ra) # 892 <free>
  return freep;
 9d4:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 9d8:	d971                	beqz	a0,9ac <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9da:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 9dc:	4798                	lw	a4,8(a5)
 9de:	fa9776e3          	bgeu	a4,s1,98a <malloc+0x70>
    if(p == freep)
 9e2:	00093703          	ld	a4,0(s2)
 9e6:	853e                	mv	a0,a5
 9e8:	fef719e3          	bne	a4,a5,9da <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 9ec:	8552                	mv	a0,s4
 9ee:	00000097          	auipc	ra,0x0
 9f2:	b3e080e7          	jalr	-1218(ra) # 52c <sbrk>
  if(p == (char*)-1)
 9f6:	fd5518e3          	bne	a0,s5,9c6 <malloc+0xac>
        return 0;
 9fa:	4501                	li	a0,0
 9fc:	bf45                	j	9ac <malloc+0x92>
