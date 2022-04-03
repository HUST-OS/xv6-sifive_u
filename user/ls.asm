
user/_ls:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <fmtname>:
#include "kernel/include/stat.h"
#include "xv6-user/user.h"

char*
fmtname(char *name)
{
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	ec26                	sd	s1,24(sp)
   8:	e84a                	sd	s2,16(sp)
   a:	e44e                	sd	s3,8(sp)
   c:	1800                	addi	s0,sp,48
   e:	892a                	mv	s2,a0
  static char buf[STAT_MAX_NAME+1];
  int len = strlen(name);
  10:	00000097          	auipc	ra,0x0
  14:	248080e7          	jalr	584(ra) # 258 <strlen>
  18:	0005049b          	sext.w	s1,a0

  // Return blank-padded name.
  if(len >= STAT_MAX_NAME)
  1c:	47fd                	li	a5,31
  1e:	0097da63          	bge	a5,s1,32 <fmtname+0x32>
    return name;
  memmove(buf, name, len);
  memset(buf + len, ' ', STAT_MAX_NAME - len);
  buf[STAT_MAX_NAME] = '\0';
  return buf;
}
  22:	854a                	mv	a0,s2
  24:	70a2                	ld	ra,40(sp)
  26:	7402                	ld	s0,32(sp)
  28:	64e2                	ld	s1,24(sp)
  2a:	6942                	ld	s2,16(sp)
  2c:	69a2                	ld	s3,8(sp)
  2e:	6145                	addi	sp,sp,48
  30:	8082                	ret
  memmove(buf, name, len);
  32:	00001997          	auipc	s3,0x1
  36:	a3e98993          	addi	s3,s3,-1474 # a70 <buf.1104>
  3a:	8626                	mv	a2,s1
  3c:	85ca                	mv	a1,s2
  3e:	854e                	mv	a0,s3
  40:	00000097          	auipc	ra,0x0
  44:	3a6080e7          	jalr	934(ra) # 3e6 <memmove>
  memset(buf + len, ' ', STAT_MAX_NAME - len);
  48:	02000613          	li	a2,32
  4c:	9e05                	subw	a2,a2,s1
  4e:	02000593          	li	a1,32
  52:	00998533          	add	a0,s3,s1
  56:	00000097          	auipc	ra,0x0
  5a:	22c080e7          	jalr	556(ra) # 282 <memset>
  buf[STAT_MAX_NAME] = '\0';
  5e:	02098023          	sb	zero,32(s3)
  return buf;
  62:	894e                	mv	s2,s3
  64:	bf7d                	j	22 <fmtname+0x22>

0000000000000066 <ls>:

void
ls(char *path)
{
  66:	7119                	addi	sp,sp,-128
  68:	fc86                	sd	ra,120(sp)
  6a:	f8a2                	sd	s0,112(sp)
  6c:	f4a6                	sd	s1,104(sp)
  6e:	f0ca                	sd	s2,96(sp)
  70:	ecce                	sd	s3,88(sp)
  72:	0100                	addi	s0,sp,128
  74:	892a                	mv	s2,a0
  int fd;
  struct stat st;
  char *types[] = {
  76:	f8043023          	sd	zero,-128(s0)
  7a:	00001797          	auipc	a5,0x1
  7e:	96678793          	addi	a5,a5,-1690 # 9e0 <malloc+0xe6>
  82:	f8f43423          	sd	a5,-120(s0)
  86:	00001797          	auipc	a5,0x1
  8a:	96278793          	addi	a5,a5,-1694 # 9e8 <malloc+0xee>
  8e:	f8f43823          	sd	a5,-112(s0)
    [T_DIR]   "DIR ",
    [T_FILE]  "FILE",
  };

  if((fd = open(path, 0)) < 0){
  92:	4581                	li	a1,0
  94:	00000097          	auipc	ra,0x0
  98:	448080e7          	jalr	1096(ra) # 4dc <open>
  9c:	02054663          	bltz	a0,c8 <ls+0x62>
  a0:	84aa                	mv	s1,a0
    fprintf(2, "ls: cannot open %s\n", path);
    return;
  }

  if(fstat(fd, &st) < 0){
  a2:	f9840593          	addi	a1,s0,-104
  a6:	00000097          	auipc	ra,0x0
  aa:	43e080e7          	jalr	1086(ra) # 4e4 <fstat>
  ae:	02054863          	bltz	a0,de <ls+0x78>
    fprintf(2, "ls: cannot stat %s\n", path);
    close(fd);
    return;
  }

  if (st.type == T_DIR){
  b2:	fc041703          	lh	a4,-64(s0)
  b6:	4785                	li	a5,1
  b8:	08f71e63          	bne	a4,a5,154 <ls+0xee>
    while(readdir(fd, &st) == 1){
  bc:	4905                	li	s2,1
      printf("%s %s\t%d\n", fmtname(st.name), types[st.type], st.size);
  be:	00001997          	auipc	s3,0x1
  c2:	96298993          	addi	s3,s3,-1694 # a20 <malloc+0x126>
  c6:	a095                	j	12a <ls+0xc4>
    fprintf(2, "ls: cannot open %s\n", path);
  c8:	864a                	mv	a2,s2
  ca:	00001597          	auipc	a1,0x1
  ce:	92658593          	addi	a1,a1,-1754 # 9f0 <malloc+0xf6>
  d2:	4509                	li	a0,2
  d4:	00000097          	auipc	ra,0x0
  d8:	73a080e7          	jalr	1850(ra) # 80e <fprintf>
    return;
  dc:	a0ad                	j	146 <ls+0xe0>
    fprintf(2, "ls: cannot stat %s\n", path);
  de:	864a                	mv	a2,s2
  e0:	00001597          	auipc	a1,0x1
  e4:	92858593          	addi	a1,a1,-1752 # a08 <malloc+0x10e>
  e8:	4509                	li	a0,2
  ea:	00000097          	auipc	ra,0x0
  ee:	724080e7          	jalr	1828(ra) # 80e <fprintf>
    close(fd);
  f2:	8526                	mv	a0,s1
  f4:	00000097          	auipc	ra,0x0
  f8:	3d0080e7          	jalr	976(ra) # 4c4 <close>
    return;
  fc:	a0a9                	j	146 <ls+0xe0>
      printf("%s %s\t%d\n", fmtname(st.name), types[st.type], st.size);
  fe:	f9840513          	addi	a0,s0,-104
 102:	00000097          	auipc	ra,0x0
 106:	efe080e7          	jalr	-258(ra) # 0 <fmtname>
 10a:	85aa                	mv	a1,a0
 10c:	fc041783          	lh	a5,-64(s0)
 110:	078e                	slli	a5,a5,0x3
 112:	fd040713          	addi	a4,s0,-48
 116:	97ba                	add	a5,a5,a4
 118:	fc843683          	ld	a3,-56(s0)
 11c:	fb07b603          	ld	a2,-80(a5)
 120:	854e                	mv	a0,s3
 122:	00000097          	auipc	ra,0x0
 126:	71a080e7          	jalr	1818(ra) # 83c <printf>
    while(readdir(fd, &st) == 1){
 12a:	f9840593          	addi	a1,s0,-104
 12e:	8526                	mv	a0,s1
 130:	00000097          	auipc	ra,0x0
 134:	404080e7          	jalr	1028(ra) # 534 <readdir>
 138:	fd2503e3          	beq	a0,s2,fe <ls+0x98>
    }
  } else {
    printf("%s %s\t%l\n", fmtname(st.name), types[st.type], st.size);
  }
  close(fd);
 13c:	8526                	mv	a0,s1
 13e:	00000097          	auipc	ra,0x0
 142:	386080e7          	jalr	902(ra) # 4c4 <close>
}
 146:	70e6                	ld	ra,120(sp)
 148:	7446                	ld	s0,112(sp)
 14a:	74a6                	ld	s1,104(sp)
 14c:	7906                	ld	s2,96(sp)
 14e:	69e6                	ld	s3,88(sp)
 150:	6109                	addi	sp,sp,128
 152:	8082                	ret
    printf("%s %s\t%l\n", fmtname(st.name), types[st.type], st.size);
 154:	f9840513          	addi	a0,s0,-104
 158:	00000097          	auipc	ra,0x0
 15c:	ea8080e7          	jalr	-344(ra) # 0 <fmtname>
 160:	85aa                	mv	a1,a0
 162:	fc041783          	lh	a5,-64(s0)
 166:	078e                	slli	a5,a5,0x3
 168:	fd040713          	addi	a4,s0,-48
 16c:	97ba                	add	a5,a5,a4
 16e:	fc843683          	ld	a3,-56(s0)
 172:	fb07b603          	ld	a2,-80(a5)
 176:	00001517          	auipc	a0,0x1
 17a:	8ba50513          	addi	a0,a0,-1862 # a30 <malloc+0x136>
 17e:	00000097          	auipc	ra,0x0
 182:	6be080e7          	jalr	1726(ra) # 83c <printf>
 186:	bf5d                	j	13c <ls+0xd6>

0000000000000188 <main>:

int
main(int argc, char *argv[])
{
 188:	1101                	addi	sp,sp,-32
 18a:	ec06                	sd	ra,24(sp)
 18c:	e822                	sd	s0,16(sp)
 18e:	e426                	sd	s1,8(sp)
 190:	e04a                	sd	s2,0(sp)
 192:	1000                	addi	s0,sp,32
  int i;

  if(argc < 2){
 194:	4785                	li	a5,1
 196:	02a7d963          	bge	a5,a0,1c8 <main+0x40>
 19a:	00858493          	addi	s1,a1,8
 19e:	ffe5091b          	addiw	s2,a0,-2
 1a2:	1902                	slli	s2,s2,0x20
 1a4:	02095913          	srli	s2,s2,0x20
 1a8:	090e                	slli	s2,s2,0x3
 1aa:	05c1                	addi	a1,a1,16
 1ac:	992e                	add	s2,s2,a1
    ls(".");
    exit(0);
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
 1ae:	6088                	ld	a0,0(s1)
 1b0:	00000097          	auipc	ra,0x0
 1b4:	eb6080e7          	jalr	-330(ra) # 66 <ls>
  for(i=1; i<argc; i++)
 1b8:	04a1                	addi	s1,s1,8
 1ba:	ff249ae3          	bne	s1,s2,1ae <main+0x26>
  exit(0);
 1be:	4501                	li	a0,0
 1c0:	00000097          	auipc	ra,0x0
 1c4:	2dc080e7          	jalr	732(ra) # 49c <exit>
    ls(".");
 1c8:	00001517          	auipc	a0,0x1
 1cc:	87850513          	addi	a0,a0,-1928 # a40 <malloc+0x146>
 1d0:	00000097          	auipc	ra,0x0
 1d4:	e96080e7          	jalr	-362(ra) # 66 <ls>
    exit(0);
 1d8:	4501                	li	a0,0
 1da:	00000097          	auipc	ra,0x0
 1de:	2c2080e7          	jalr	706(ra) # 49c <exit>

00000000000001e2 <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
 1e2:	1141                	addi	sp,sp,-16
 1e4:	e422                	sd	s0,8(sp)
 1e6:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1e8:	87aa                	mv	a5,a0
 1ea:	0585                	addi	a1,a1,1
 1ec:	0785                	addi	a5,a5,1
 1ee:	fff5c703          	lbu	a4,-1(a1)
 1f2:	fee78fa3          	sb	a4,-1(a5)
 1f6:	fb75                	bnez	a4,1ea <strcpy+0x8>
    ;
  return os;
}
 1f8:	6422                	ld	s0,8(sp)
 1fa:	0141                	addi	sp,sp,16
 1fc:	8082                	ret

00000000000001fe <strcat>:

char*
strcat(char *s, const char *t)
{
 1fe:	1141                	addi	sp,sp,-16
 200:	e422                	sd	s0,8(sp)
 202:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
 204:	00054783          	lbu	a5,0(a0)
 208:	c385                	beqz	a5,228 <strcat+0x2a>
 20a:	87aa                	mv	a5,a0
    s++;
 20c:	0785                	addi	a5,a5,1
  while(*s)
 20e:	0007c703          	lbu	a4,0(a5)
 212:	ff6d                	bnez	a4,20c <strcat+0xe>
  while((*s++ = *t++))
 214:	0585                	addi	a1,a1,1
 216:	0785                	addi	a5,a5,1
 218:	fff5c703          	lbu	a4,-1(a1)
 21c:	fee78fa3          	sb	a4,-1(a5)
 220:	fb75                	bnez	a4,214 <strcat+0x16>
    ;
  return os;
}
 222:	6422                	ld	s0,8(sp)
 224:	0141                	addi	sp,sp,16
 226:	8082                	ret
  while(*s)
 228:	87aa                	mv	a5,a0
 22a:	b7ed                	j	214 <strcat+0x16>

000000000000022c <strcmp>:


int
strcmp(const char *p, const char *q)
{
 22c:	1141                	addi	sp,sp,-16
 22e:	e422                	sd	s0,8(sp)
 230:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 232:	00054783          	lbu	a5,0(a0)
 236:	cb91                	beqz	a5,24a <strcmp+0x1e>
 238:	0005c703          	lbu	a4,0(a1)
 23c:	00f71763          	bne	a4,a5,24a <strcmp+0x1e>
    p++, q++;
 240:	0505                	addi	a0,a0,1
 242:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 244:	00054783          	lbu	a5,0(a0)
 248:	fbe5                	bnez	a5,238 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 24a:	0005c503          	lbu	a0,0(a1)
}
 24e:	40a7853b          	subw	a0,a5,a0
 252:	6422                	ld	s0,8(sp)
 254:	0141                	addi	sp,sp,16
 256:	8082                	ret

0000000000000258 <strlen>:

uint
strlen(const char *s)
{
 258:	1141                	addi	sp,sp,-16
 25a:	e422                	sd	s0,8(sp)
 25c:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 25e:	00054783          	lbu	a5,0(a0)
 262:	cf91                	beqz	a5,27e <strlen+0x26>
 264:	0505                	addi	a0,a0,1
 266:	87aa                	mv	a5,a0
 268:	4685                	li	a3,1
 26a:	9e89                	subw	a3,a3,a0
 26c:	00f6853b          	addw	a0,a3,a5
 270:	0785                	addi	a5,a5,1
 272:	fff7c703          	lbu	a4,-1(a5)
 276:	fb7d                	bnez	a4,26c <strlen+0x14>
    ;
  return n;
}
 278:	6422                	ld	s0,8(sp)
 27a:	0141                	addi	sp,sp,16
 27c:	8082                	ret
  for(n = 0; s[n]; n++)
 27e:	4501                	li	a0,0
 280:	bfe5                	j	278 <strlen+0x20>

0000000000000282 <memset>:

void*
memset(void *dst, int c, uint n)
{
 282:	1141                	addi	sp,sp,-16
 284:	e422                	sd	s0,8(sp)
 286:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 288:	ce09                	beqz	a2,2a2 <memset+0x20>
 28a:	87aa                	mv	a5,a0
 28c:	fff6071b          	addiw	a4,a2,-1
 290:	1702                	slli	a4,a4,0x20
 292:	9301                	srli	a4,a4,0x20
 294:	0705                	addi	a4,a4,1
 296:	972a                	add	a4,a4,a0
    cdst[i] = c;
 298:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 29c:	0785                	addi	a5,a5,1
 29e:	fee79de3          	bne	a5,a4,298 <memset+0x16>
  }
  return dst;
}
 2a2:	6422                	ld	s0,8(sp)
 2a4:	0141                	addi	sp,sp,16
 2a6:	8082                	ret

00000000000002a8 <strchr>:

char*
strchr(const char *s, char c)
{
 2a8:	1141                	addi	sp,sp,-16
 2aa:	e422                	sd	s0,8(sp)
 2ac:	0800                	addi	s0,sp,16
  for(; *s; s++)
 2ae:	00054783          	lbu	a5,0(a0)
 2b2:	cb99                	beqz	a5,2c8 <strchr+0x20>
    if(*s == c)
 2b4:	00f58763          	beq	a1,a5,2c2 <strchr+0x1a>
  for(; *s; s++)
 2b8:	0505                	addi	a0,a0,1
 2ba:	00054783          	lbu	a5,0(a0)
 2be:	fbfd                	bnez	a5,2b4 <strchr+0xc>
      return (char*)s;
  return 0;
 2c0:	4501                	li	a0,0
}
 2c2:	6422                	ld	s0,8(sp)
 2c4:	0141                	addi	sp,sp,16
 2c6:	8082                	ret
  return 0;
 2c8:	4501                	li	a0,0
 2ca:	bfe5                	j	2c2 <strchr+0x1a>

00000000000002cc <gets>:

char*
gets(char *buf, int max)
{
 2cc:	711d                	addi	sp,sp,-96
 2ce:	ec86                	sd	ra,88(sp)
 2d0:	e8a2                	sd	s0,80(sp)
 2d2:	e4a6                	sd	s1,72(sp)
 2d4:	e0ca                	sd	s2,64(sp)
 2d6:	fc4e                	sd	s3,56(sp)
 2d8:	f852                	sd	s4,48(sp)
 2da:	f456                	sd	s5,40(sp)
 2dc:	f05a                	sd	s6,32(sp)
 2de:	ec5e                	sd	s7,24(sp)
 2e0:	1080                	addi	s0,sp,96
 2e2:	8baa                	mv	s7,a0
 2e4:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2e6:	892a                	mv	s2,a0
 2e8:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 2ea:	4aa9                	li	s5,10
 2ec:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 2ee:	89a6                	mv	s3,s1
 2f0:	2485                	addiw	s1,s1,1
 2f2:	0344d863          	bge	s1,s4,322 <gets+0x56>
    cc = read(0, &c, 1);
 2f6:	4605                	li	a2,1
 2f8:	faf40593          	addi	a1,s0,-81
 2fc:	4501                	li	a0,0
 2fe:	00000097          	auipc	ra,0x0
 302:	1b6080e7          	jalr	438(ra) # 4b4 <read>
    if(cc < 1)
 306:	00a05e63          	blez	a0,322 <gets+0x56>
    buf[i++] = c;
 30a:	faf44783          	lbu	a5,-81(s0)
 30e:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 312:	01578763          	beq	a5,s5,320 <gets+0x54>
 316:	0905                	addi	s2,s2,1
 318:	fd679be3          	bne	a5,s6,2ee <gets+0x22>
  for(i=0; i+1 < max; ){
 31c:	89a6                	mv	s3,s1
 31e:	a011                	j	322 <gets+0x56>
 320:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 322:	99de                	add	s3,s3,s7
 324:	00098023          	sb	zero,0(s3)
  return buf;
}
 328:	855e                	mv	a0,s7
 32a:	60e6                	ld	ra,88(sp)
 32c:	6446                	ld	s0,80(sp)
 32e:	64a6                	ld	s1,72(sp)
 330:	6906                	ld	s2,64(sp)
 332:	79e2                	ld	s3,56(sp)
 334:	7a42                	ld	s4,48(sp)
 336:	7aa2                	ld	s5,40(sp)
 338:	7b02                	ld	s6,32(sp)
 33a:	6be2                	ld	s7,24(sp)
 33c:	6125                	addi	sp,sp,96
 33e:	8082                	ret

0000000000000340 <stat>:

int
stat(const char *n, struct stat *st)
{
 340:	1101                	addi	sp,sp,-32
 342:	ec06                	sd	ra,24(sp)
 344:	e822                	sd	s0,16(sp)
 346:	e426                	sd	s1,8(sp)
 348:	e04a                	sd	s2,0(sp)
 34a:	1000                	addi	s0,sp,32
 34c:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 34e:	4581                	li	a1,0
 350:	00000097          	auipc	ra,0x0
 354:	18c080e7          	jalr	396(ra) # 4dc <open>
  if(fd < 0)
 358:	02054563          	bltz	a0,382 <stat+0x42>
 35c:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 35e:	85ca                	mv	a1,s2
 360:	00000097          	auipc	ra,0x0
 364:	184080e7          	jalr	388(ra) # 4e4 <fstat>
 368:	892a                	mv	s2,a0
  close(fd);
 36a:	8526                	mv	a0,s1
 36c:	00000097          	auipc	ra,0x0
 370:	158080e7          	jalr	344(ra) # 4c4 <close>
  return r;
}
 374:	854a                	mv	a0,s2
 376:	60e2                	ld	ra,24(sp)
 378:	6442                	ld	s0,16(sp)
 37a:	64a2                	ld	s1,8(sp)
 37c:	6902                	ld	s2,0(sp)
 37e:	6105                	addi	sp,sp,32
 380:	8082                	ret
    return -1;
 382:	597d                	li	s2,-1
 384:	bfc5                	j	374 <stat+0x34>

0000000000000386 <atoi>:

int
atoi(const char *s)
{
 386:	1141                	addi	sp,sp,-16
 388:	e422                	sd	s0,8(sp)
 38a:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 38c:	00054703          	lbu	a4,0(a0)
 390:	02d00793          	li	a5,45
  int neg = 1;
 394:	4805                	li	a6,1
  if (*s == '-') {
 396:	04f70363          	beq	a4,a5,3dc <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 39a:	00054683          	lbu	a3,0(a0)
 39e:	fd06879b          	addiw	a5,a3,-48
 3a2:	0ff7f793          	andi	a5,a5,255
 3a6:	4725                	li	a4,9
 3a8:	02f76d63          	bltu	a4,a5,3e2 <atoi+0x5c>
  n = 0;
 3ac:	4601                	li	a2,0
  while('0' <= *s && *s <= '9')
 3ae:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 3b0:	0505                	addi	a0,a0,1
 3b2:	0026179b          	slliw	a5,a2,0x2
 3b6:	9fb1                	addw	a5,a5,a2
 3b8:	0017979b          	slliw	a5,a5,0x1
 3bc:	9fb5                	addw	a5,a5,a3
 3be:	fd07861b          	addiw	a2,a5,-48
  while('0' <= *s && *s <= '9')
 3c2:	00054683          	lbu	a3,0(a0)
 3c6:	fd06871b          	addiw	a4,a3,-48
 3ca:	0ff77713          	andi	a4,a4,255
 3ce:	fee5f1e3          	bgeu	a1,a4,3b0 <atoi+0x2a>
  return n * neg;
}
 3d2:	02c8053b          	mulw	a0,a6,a2
 3d6:	6422                	ld	s0,8(sp)
 3d8:	0141                	addi	sp,sp,16
 3da:	8082                	ret
    s++;
 3dc:	0505                	addi	a0,a0,1
    neg = -1;
 3de:	587d                	li	a6,-1
 3e0:	bf6d                	j	39a <atoi+0x14>
  n = 0;
 3e2:	4601                	li	a2,0
 3e4:	b7fd                	j	3d2 <atoi+0x4c>

00000000000003e6 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3e6:	1141                	addi	sp,sp,-16
 3e8:	e422                	sd	s0,8(sp)
 3ea:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 3ec:	02b57663          	bgeu	a0,a1,418 <memmove+0x32>
    while(n-- > 0)
 3f0:	02c05163          	blez	a2,412 <memmove+0x2c>
 3f4:	fff6079b          	addiw	a5,a2,-1
 3f8:	1782                	slli	a5,a5,0x20
 3fa:	9381                	srli	a5,a5,0x20
 3fc:	0785                	addi	a5,a5,1
 3fe:	97aa                	add	a5,a5,a0
  dst = vdst;
 400:	872a                	mv	a4,a0
      *dst++ = *src++;
 402:	0585                	addi	a1,a1,1
 404:	0705                	addi	a4,a4,1
 406:	fff5c683          	lbu	a3,-1(a1)
 40a:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 40e:	fee79ae3          	bne	a5,a4,402 <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 412:	6422                	ld	s0,8(sp)
 414:	0141                	addi	sp,sp,16
 416:	8082                	ret
    dst += n;
 418:	00c50733          	add	a4,a0,a2
    src += n;
 41c:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 41e:	fec05ae3          	blez	a2,412 <memmove+0x2c>
 422:	fff6079b          	addiw	a5,a2,-1
 426:	1782                	slli	a5,a5,0x20
 428:	9381                	srli	a5,a5,0x20
 42a:	fff7c793          	not	a5,a5
 42e:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 430:	15fd                	addi	a1,a1,-1
 432:	177d                	addi	a4,a4,-1
 434:	0005c683          	lbu	a3,0(a1)
 438:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 43c:	fee79ae3          	bne	a5,a4,430 <memmove+0x4a>
 440:	bfc9                	j	412 <memmove+0x2c>

0000000000000442 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 442:	1141                	addi	sp,sp,-16
 444:	e422                	sd	s0,8(sp)
 446:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 448:	ca05                	beqz	a2,478 <memcmp+0x36>
 44a:	fff6069b          	addiw	a3,a2,-1
 44e:	1682                	slli	a3,a3,0x20
 450:	9281                	srli	a3,a3,0x20
 452:	0685                	addi	a3,a3,1
 454:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 456:	00054783          	lbu	a5,0(a0)
 45a:	0005c703          	lbu	a4,0(a1)
 45e:	00e79863          	bne	a5,a4,46e <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 462:	0505                	addi	a0,a0,1
    p2++;
 464:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 466:	fed518e3          	bne	a0,a3,456 <memcmp+0x14>
  }
  return 0;
 46a:	4501                	li	a0,0
 46c:	a019                	j	472 <memcmp+0x30>
      return *p1 - *p2;
 46e:	40e7853b          	subw	a0,a5,a4
}
 472:	6422                	ld	s0,8(sp)
 474:	0141                	addi	sp,sp,16
 476:	8082                	ret
  return 0;
 478:	4501                	li	a0,0
 47a:	bfe5                	j	472 <memcmp+0x30>

000000000000047c <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 47c:	1141                	addi	sp,sp,-16
 47e:	e406                	sd	ra,8(sp)
 480:	e022                	sd	s0,0(sp)
 482:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 484:	00000097          	auipc	ra,0x0
 488:	f62080e7          	jalr	-158(ra) # 3e6 <memmove>
}
 48c:	60a2                	ld	ra,8(sp)
 48e:	6402                	ld	s0,0(sp)
 490:	0141                	addi	sp,sp,16
 492:	8082                	ret

0000000000000494 <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 494:	4885                	li	a7,1
 ecall
 496:	00000073          	ecall
 ret
 49a:	8082                	ret

000000000000049c <exit>:
.global exit
exit:
 li a7, SYS_exit
 49c:	4889                	li	a7,2
 ecall
 49e:	00000073          	ecall
 ret
 4a2:	8082                	ret

00000000000004a4 <wait>:
.global wait
wait:
 li a7, SYS_wait
 4a4:	488d                	li	a7,3
 ecall
 4a6:	00000073          	ecall
 ret
 4aa:	8082                	ret

00000000000004ac <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 4ac:	4891                	li	a7,4
 ecall
 4ae:	00000073          	ecall
 ret
 4b2:	8082                	ret

00000000000004b4 <read>:
.global read
read:
 li a7, SYS_read
 4b4:	4895                	li	a7,5
 ecall
 4b6:	00000073          	ecall
 ret
 4ba:	8082                	ret

00000000000004bc <write>:
.global write
write:
 li a7, SYS_write
 4bc:	48c1                	li	a7,16
 ecall
 4be:	00000073          	ecall
 ret
 4c2:	8082                	ret

00000000000004c4 <close>:
.global close
close:
 li a7, SYS_close
 4c4:	48d5                	li	a7,21
 ecall
 4c6:	00000073          	ecall
 ret
 4ca:	8082                	ret

00000000000004cc <kill>:
.global kill
kill:
 li a7, SYS_kill
 4cc:	4899                	li	a7,6
 ecall
 4ce:	00000073          	ecall
 ret
 4d2:	8082                	ret

00000000000004d4 <exec>:
.global exec
exec:
 li a7, SYS_exec
 4d4:	489d                	li	a7,7
 ecall
 4d6:	00000073          	ecall
 ret
 4da:	8082                	ret

00000000000004dc <open>:
.global open
open:
 li a7, SYS_open
 4dc:	48bd                	li	a7,15
 ecall
 4de:	00000073          	ecall
 ret
 4e2:	8082                	ret

00000000000004e4 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 4e4:	48a1                	li	a7,8
 ecall
 4e6:	00000073          	ecall
 ret
 4ea:	8082                	ret

00000000000004ec <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 4ec:	48d1                	li	a7,20
 ecall
 4ee:	00000073          	ecall
 ret
 4f2:	8082                	ret

00000000000004f4 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 4f4:	48a5                	li	a7,9
 ecall
 4f6:	00000073          	ecall
 ret
 4fa:	8082                	ret

00000000000004fc <dup>:
.global dup
dup:
 li a7, SYS_dup
 4fc:	48a9                	li	a7,10
 ecall
 4fe:	00000073          	ecall
 ret
 502:	8082                	ret

0000000000000504 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 504:	48ad                	li	a7,11
 ecall
 506:	00000073          	ecall
 ret
 50a:	8082                	ret

000000000000050c <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 50c:	48b1                	li	a7,12
 ecall
 50e:	00000073          	ecall
 ret
 512:	8082                	ret

0000000000000514 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 514:	48b5                	li	a7,13
 ecall
 516:	00000073          	ecall
 ret
 51a:	8082                	ret

000000000000051c <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 51c:	48b9                	li	a7,14
 ecall
 51e:	00000073          	ecall
 ret
 522:	8082                	ret

0000000000000524 <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 524:	48d9                	li	a7,22
 ecall
 526:	00000073          	ecall
 ret
 52a:	8082                	ret

000000000000052c <dev>:
.global dev
dev:
 li a7, SYS_dev
 52c:	48dd                	li	a7,23
 ecall
 52e:	00000073          	ecall
 ret
 532:	8082                	ret

0000000000000534 <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 534:	48e1                	li	a7,24
 ecall
 536:	00000073          	ecall
 ret
 53a:	8082                	ret

000000000000053c <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 53c:	48e5                	li	a7,25
 ecall
 53e:	00000073          	ecall
 ret
 542:	8082                	ret

0000000000000544 <remove>:
.global remove
remove:
 li a7, SYS_remove
 544:	48c5                	li	a7,17
 ecall
 546:	00000073          	ecall
 ret
 54a:	8082                	ret

000000000000054c <trace>:
.global trace
trace:
 li a7, SYS_trace
 54c:	48c9                	li	a7,18
 ecall
 54e:	00000073          	ecall
 ret
 552:	8082                	ret

0000000000000554 <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 554:	48cd                	li	a7,19
 ecall
 556:	00000073          	ecall
 ret
 55a:	8082                	ret

000000000000055c <rename>:
.global rename
rename:
 li a7, SYS_rename
 55c:	48e9                	li	a7,26
 ecall
 55e:	00000073          	ecall
 ret
 562:	8082                	ret

0000000000000564 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 564:	1101                	addi	sp,sp,-32
 566:	ec06                	sd	ra,24(sp)
 568:	e822                	sd	s0,16(sp)
 56a:	1000                	addi	s0,sp,32
 56c:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 570:	4605                	li	a2,1
 572:	fef40593          	addi	a1,s0,-17
 576:	00000097          	auipc	ra,0x0
 57a:	f46080e7          	jalr	-186(ra) # 4bc <write>
}
 57e:	60e2                	ld	ra,24(sp)
 580:	6442                	ld	s0,16(sp)
 582:	6105                	addi	sp,sp,32
 584:	8082                	ret

0000000000000586 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 586:	7139                	addi	sp,sp,-64
 588:	fc06                	sd	ra,56(sp)
 58a:	f822                	sd	s0,48(sp)
 58c:	f426                	sd	s1,40(sp)
 58e:	f04a                	sd	s2,32(sp)
 590:	ec4e                	sd	s3,24(sp)
 592:	0080                	addi	s0,sp,64
 594:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 596:	c299                	beqz	a3,59c <printint+0x16>
 598:	0805c863          	bltz	a1,628 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 59c:	2581                	sext.w	a1,a1
  neg = 0;
 59e:	4881                	li	a7,0
 5a0:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 5a4:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 5a6:	2601                	sext.w	a2,a2
 5a8:	00000517          	auipc	a0,0x0
 5ac:	4a850513          	addi	a0,a0,1192 # a50 <digits>
 5b0:	883a                	mv	a6,a4
 5b2:	2705                	addiw	a4,a4,1
 5b4:	02c5f7bb          	remuw	a5,a1,a2
 5b8:	1782                	slli	a5,a5,0x20
 5ba:	9381                	srli	a5,a5,0x20
 5bc:	97aa                	add	a5,a5,a0
 5be:	0007c783          	lbu	a5,0(a5)
 5c2:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 5c6:	0005879b          	sext.w	a5,a1
 5ca:	02c5d5bb          	divuw	a1,a1,a2
 5ce:	0685                	addi	a3,a3,1
 5d0:	fec7f0e3          	bgeu	a5,a2,5b0 <printint+0x2a>
  if(neg)
 5d4:	00088b63          	beqz	a7,5ea <printint+0x64>
    buf[i++] = '-';
 5d8:	fd040793          	addi	a5,s0,-48
 5dc:	973e                	add	a4,a4,a5
 5de:	02d00793          	li	a5,45
 5e2:	fef70823          	sb	a5,-16(a4)
 5e6:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 5ea:	02e05863          	blez	a4,61a <printint+0x94>
 5ee:	fc040793          	addi	a5,s0,-64
 5f2:	00e78933          	add	s2,a5,a4
 5f6:	fff78993          	addi	s3,a5,-1
 5fa:	99ba                	add	s3,s3,a4
 5fc:	377d                	addiw	a4,a4,-1
 5fe:	1702                	slli	a4,a4,0x20
 600:	9301                	srli	a4,a4,0x20
 602:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 606:	fff94583          	lbu	a1,-1(s2)
 60a:	8526                	mv	a0,s1
 60c:	00000097          	auipc	ra,0x0
 610:	f58080e7          	jalr	-168(ra) # 564 <putc>
  while(--i >= 0)
 614:	197d                	addi	s2,s2,-1
 616:	ff3918e3          	bne	s2,s3,606 <printint+0x80>
}
 61a:	70e2                	ld	ra,56(sp)
 61c:	7442                	ld	s0,48(sp)
 61e:	74a2                	ld	s1,40(sp)
 620:	7902                	ld	s2,32(sp)
 622:	69e2                	ld	s3,24(sp)
 624:	6121                	addi	sp,sp,64
 626:	8082                	ret
    x = -xx;
 628:	40b005bb          	negw	a1,a1
    neg = 1;
 62c:	4885                	li	a7,1
    x = -xx;
 62e:	bf8d                	j	5a0 <printint+0x1a>

0000000000000630 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 630:	7119                	addi	sp,sp,-128
 632:	fc86                	sd	ra,120(sp)
 634:	f8a2                	sd	s0,112(sp)
 636:	f4a6                	sd	s1,104(sp)
 638:	f0ca                	sd	s2,96(sp)
 63a:	ecce                	sd	s3,88(sp)
 63c:	e8d2                	sd	s4,80(sp)
 63e:	e4d6                	sd	s5,72(sp)
 640:	e0da                	sd	s6,64(sp)
 642:	fc5e                	sd	s7,56(sp)
 644:	f862                	sd	s8,48(sp)
 646:	f466                	sd	s9,40(sp)
 648:	f06a                	sd	s10,32(sp)
 64a:	ec6e                	sd	s11,24(sp)
 64c:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 64e:	0005c903          	lbu	s2,0(a1)
 652:	18090f63          	beqz	s2,7f0 <vprintf+0x1c0>
 656:	8aaa                	mv	s5,a0
 658:	8b32                	mv	s6,a2
 65a:	00158493          	addi	s1,a1,1
  state = 0;
 65e:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 660:	02500a13          	li	s4,37
      if(c == 'd'){
 664:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 668:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 66c:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 670:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 674:	00000b97          	auipc	s7,0x0
 678:	3dcb8b93          	addi	s7,s7,988 # a50 <digits>
 67c:	a839                	j	69a <vprintf+0x6a>
        putc(fd, c);
 67e:	85ca                	mv	a1,s2
 680:	8556                	mv	a0,s5
 682:	00000097          	auipc	ra,0x0
 686:	ee2080e7          	jalr	-286(ra) # 564 <putc>
 68a:	a019                	j	690 <vprintf+0x60>
    } else if(state == '%'){
 68c:	01498f63          	beq	s3,s4,6aa <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 690:	0485                	addi	s1,s1,1
 692:	fff4c903          	lbu	s2,-1(s1)
 696:	14090d63          	beqz	s2,7f0 <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 69a:	0009079b          	sext.w	a5,s2
    if(state == 0){
 69e:	fe0997e3          	bnez	s3,68c <vprintf+0x5c>
      if(c == '%'){
 6a2:	fd479ee3          	bne	a5,s4,67e <vprintf+0x4e>
        state = '%';
 6a6:	89be                	mv	s3,a5
 6a8:	b7e5                	j	690 <vprintf+0x60>
      if(c == 'd'){
 6aa:	05878063          	beq	a5,s8,6ea <vprintf+0xba>
      } else if(c == 'l') {
 6ae:	05978c63          	beq	a5,s9,706 <vprintf+0xd6>
      } else if(c == 'x') {
 6b2:	07a78863          	beq	a5,s10,722 <vprintf+0xf2>
      } else if(c == 'p') {
 6b6:	09b78463          	beq	a5,s11,73e <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 6ba:	07300713          	li	a4,115
 6be:	0ce78663          	beq	a5,a4,78a <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6c2:	06300713          	li	a4,99
 6c6:	0ee78e63          	beq	a5,a4,7c2 <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 6ca:	11478863          	beq	a5,s4,7da <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6ce:	85d2                	mv	a1,s4
 6d0:	8556                	mv	a0,s5
 6d2:	00000097          	auipc	ra,0x0
 6d6:	e92080e7          	jalr	-366(ra) # 564 <putc>
        putc(fd, c);
 6da:	85ca                	mv	a1,s2
 6dc:	8556                	mv	a0,s5
 6de:	00000097          	auipc	ra,0x0
 6e2:	e86080e7          	jalr	-378(ra) # 564 <putc>
      }
      state = 0;
 6e6:	4981                	li	s3,0
 6e8:	b765                	j	690 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 6ea:	008b0913          	addi	s2,s6,8
 6ee:	4685                	li	a3,1
 6f0:	4629                	li	a2,10
 6f2:	000b2583          	lw	a1,0(s6)
 6f6:	8556                	mv	a0,s5
 6f8:	00000097          	auipc	ra,0x0
 6fc:	e8e080e7          	jalr	-370(ra) # 586 <printint>
 700:	8b4a                	mv	s6,s2
      state = 0;
 702:	4981                	li	s3,0
 704:	b771                	j	690 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 706:	008b0913          	addi	s2,s6,8
 70a:	4681                	li	a3,0
 70c:	4629                	li	a2,10
 70e:	000b2583          	lw	a1,0(s6)
 712:	8556                	mv	a0,s5
 714:	00000097          	auipc	ra,0x0
 718:	e72080e7          	jalr	-398(ra) # 586 <printint>
 71c:	8b4a                	mv	s6,s2
      state = 0;
 71e:	4981                	li	s3,0
 720:	bf85                	j	690 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 722:	008b0913          	addi	s2,s6,8
 726:	4681                	li	a3,0
 728:	4641                	li	a2,16
 72a:	000b2583          	lw	a1,0(s6)
 72e:	8556                	mv	a0,s5
 730:	00000097          	auipc	ra,0x0
 734:	e56080e7          	jalr	-426(ra) # 586 <printint>
 738:	8b4a                	mv	s6,s2
      state = 0;
 73a:	4981                	li	s3,0
 73c:	bf91                	j	690 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 73e:	008b0793          	addi	a5,s6,8
 742:	f8f43423          	sd	a5,-120(s0)
 746:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 74a:	03000593          	li	a1,48
 74e:	8556                	mv	a0,s5
 750:	00000097          	auipc	ra,0x0
 754:	e14080e7          	jalr	-492(ra) # 564 <putc>
  putc(fd, 'x');
 758:	85ea                	mv	a1,s10
 75a:	8556                	mv	a0,s5
 75c:	00000097          	auipc	ra,0x0
 760:	e08080e7          	jalr	-504(ra) # 564 <putc>
 764:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 766:	03c9d793          	srli	a5,s3,0x3c
 76a:	97de                	add	a5,a5,s7
 76c:	0007c583          	lbu	a1,0(a5)
 770:	8556                	mv	a0,s5
 772:	00000097          	auipc	ra,0x0
 776:	df2080e7          	jalr	-526(ra) # 564 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 77a:	0992                	slli	s3,s3,0x4
 77c:	397d                	addiw	s2,s2,-1
 77e:	fe0914e3          	bnez	s2,766 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 782:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 786:	4981                	li	s3,0
 788:	b721                	j	690 <vprintf+0x60>
        s = va_arg(ap, char*);
 78a:	008b0993          	addi	s3,s6,8
 78e:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 792:	02090163          	beqz	s2,7b4 <vprintf+0x184>
        while(*s != 0){
 796:	00094583          	lbu	a1,0(s2)
 79a:	c9a1                	beqz	a1,7ea <vprintf+0x1ba>
          putc(fd, *s);
 79c:	8556                	mv	a0,s5
 79e:	00000097          	auipc	ra,0x0
 7a2:	dc6080e7          	jalr	-570(ra) # 564 <putc>
          s++;
 7a6:	0905                	addi	s2,s2,1
        while(*s != 0){
 7a8:	00094583          	lbu	a1,0(s2)
 7ac:	f9e5                	bnez	a1,79c <vprintf+0x16c>
        s = va_arg(ap, char*);
 7ae:	8b4e                	mv	s6,s3
      state = 0;
 7b0:	4981                	li	s3,0
 7b2:	bdf9                	j	690 <vprintf+0x60>
          s = "(null)";
 7b4:	00000917          	auipc	s2,0x0
 7b8:	29490913          	addi	s2,s2,660 # a48 <malloc+0x14e>
        while(*s != 0){
 7bc:	02800593          	li	a1,40
 7c0:	bff1                	j	79c <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 7c2:	008b0913          	addi	s2,s6,8
 7c6:	000b4583          	lbu	a1,0(s6)
 7ca:	8556                	mv	a0,s5
 7cc:	00000097          	auipc	ra,0x0
 7d0:	d98080e7          	jalr	-616(ra) # 564 <putc>
 7d4:	8b4a                	mv	s6,s2
      state = 0;
 7d6:	4981                	li	s3,0
 7d8:	bd65                	j	690 <vprintf+0x60>
        putc(fd, c);
 7da:	85d2                	mv	a1,s4
 7dc:	8556                	mv	a0,s5
 7de:	00000097          	auipc	ra,0x0
 7e2:	d86080e7          	jalr	-634(ra) # 564 <putc>
      state = 0;
 7e6:	4981                	li	s3,0
 7e8:	b565                	j	690 <vprintf+0x60>
        s = va_arg(ap, char*);
 7ea:	8b4e                	mv	s6,s3
      state = 0;
 7ec:	4981                	li	s3,0
 7ee:	b54d                	j	690 <vprintf+0x60>
    }
  }
}
 7f0:	70e6                	ld	ra,120(sp)
 7f2:	7446                	ld	s0,112(sp)
 7f4:	74a6                	ld	s1,104(sp)
 7f6:	7906                	ld	s2,96(sp)
 7f8:	69e6                	ld	s3,88(sp)
 7fa:	6a46                	ld	s4,80(sp)
 7fc:	6aa6                	ld	s5,72(sp)
 7fe:	6b06                	ld	s6,64(sp)
 800:	7be2                	ld	s7,56(sp)
 802:	7c42                	ld	s8,48(sp)
 804:	7ca2                	ld	s9,40(sp)
 806:	7d02                	ld	s10,32(sp)
 808:	6de2                	ld	s11,24(sp)
 80a:	6109                	addi	sp,sp,128
 80c:	8082                	ret

000000000000080e <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 80e:	715d                	addi	sp,sp,-80
 810:	ec06                	sd	ra,24(sp)
 812:	e822                	sd	s0,16(sp)
 814:	1000                	addi	s0,sp,32
 816:	e010                	sd	a2,0(s0)
 818:	e414                	sd	a3,8(s0)
 81a:	e818                	sd	a4,16(s0)
 81c:	ec1c                	sd	a5,24(s0)
 81e:	03043023          	sd	a6,32(s0)
 822:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 826:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 82a:	8622                	mv	a2,s0
 82c:	00000097          	auipc	ra,0x0
 830:	e04080e7          	jalr	-508(ra) # 630 <vprintf>
}
 834:	60e2                	ld	ra,24(sp)
 836:	6442                	ld	s0,16(sp)
 838:	6161                	addi	sp,sp,80
 83a:	8082                	ret

000000000000083c <printf>:

void
printf(const char *fmt, ...)
{
 83c:	711d                	addi	sp,sp,-96
 83e:	ec06                	sd	ra,24(sp)
 840:	e822                	sd	s0,16(sp)
 842:	1000                	addi	s0,sp,32
 844:	e40c                	sd	a1,8(s0)
 846:	e810                	sd	a2,16(s0)
 848:	ec14                	sd	a3,24(s0)
 84a:	f018                	sd	a4,32(s0)
 84c:	f41c                	sd	a5,40(s0)
 84e:	03043823          	sd	a6,48(s0)
 852:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 856:	00840613          	addi	a2,s0,8
 85a:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 85e:	85aa                	mv	a1,a0
 860:	4505                	li	a0,1
 862:	00000097          	auipc	ra,0x0
 866:	dce080e7          	jalr	-562(ra) # 630 <vprintf>
}
 86a:	60e2                	ld	ra,24(sp)
 86c:	6442                	ld	s0,16(sp)
 86e:	6125                	addi	sp,sp,96
 870:	8082                	ret

0000000000000872 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 872:	1141                	addi	sp,sp,-16
 874:	e422                	sd	s0,8(sp)
 876:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 878:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 87c:	00000797          	auipc	a5,0x0
 880:	1ec7b783          	ld	a5,492(a5) # a68 <freep>
 884:	a805                	j	8b4 <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 886:	4618                	lw	a4,8(a2)
 888:	9db9                	addw	a1,a1,a4
 88a:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 88e:	6398                	ld	a4,0(a5)
 890:	6318                	ld	a4,0(a4)
 892:	fee53823          	sd	a4,-16(a0)
 896:	a091                	j	8da <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 898:	ff852703          	lw	a4,-8(a0)
 89c:	9e39                	addw	a2,a2,a4
 89e:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 8a0:	ff053703          	ld	a4,-16(a0)
 8a4:	e398                	sd	a4,0(a5)
 8a6:	a099                	j	8ec <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8a8:	6398                	ld	a4,0(a5)
 8aa:	00e7e463          	bltu	a5,a4,8b2 <free+0x40>
 8ae:	00e6ea63          	bltu	a3,a4,8c2 <free+0x50>
{
 8b2:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8b4:	fed7fae3          	bgeu	a5,a3,8a8 <free+0x36>
 8b8:	6398                	ld	a4,0(a5)
 8ba:	00e6e463          	bltu	a3,a4,8c2 <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8be:	fee7eae3          	bltu	a5,a4,8b2 <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 8c2:	ff852583          	lw	a1,-8(a0)
 8c6:	6390                	ld	a2,0(a5)
 8c8:	02059713          	slli	a4,a1,0x20
 8cc:	9301                	srli	a4,a4,0x20
 8ce:	0712                	slli	a4,a4,0x4
 8d0:	9736                	add	a4,a4,a3
 8d2:	fae60ae3          	beq	a2,a4,886 <free+0x14>
    bp->s.ptr = p->s.ptr;
 8d6:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 8da:	4790                	lw	a2,8(a5)
 8dc:	02061713          	slli	a4,a2,0x20
 8e0:	9301                	srli	a4,a4,0x20
 8e2:	0712                	slli	a4,a4,0x4
 8e4:	973e                	add	a4,a4,a5
 8e6:	fae689e3          	beq	a3,a4,898 <free+0x26>
  } else
    p->s.ptr = bp;
 8ea:	e394                	sd	a3,0(a5)
  freep = p;
 8ec:	00000717          	auipc	a4,0x0
 8f0:	16f73e23          	sd	a5,380(a4) # a68 <freep>
}
 8f4:	6422                	ld	s0,8(sp)
 8f6:	0141                	addi	sp,sp,16
 8f8:	8082                	ret

00000000000008fa <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8fa:	7139                	addi	sp,sp,-64
 8fc:	fc06                	sd	ra,56(sp)
 8fe:	f822                	sd	s0,48(sp)
 900:	f426                	sd	s1,40(sp)
 902:	f04a                	sd	s2,32(sp)
 904:	ec4e                	sd	s3,24(sp)
 906:	e852                	sd	s4,16(sp)
 908:	e456                	sd	s5,8(sp)
 90a:	e05a                	sd	s6,0(sp)
 90c:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 90e:	02051493          	slli	s1,a0,0x20
 912:	9081                	srli	s1,s1,0x20
 914:	04bd                	addi	s1,s1,15
 916:	8091                	srli	s1,s1,0x4
 918:	0014899b          	addiw	s3,s1,1
 91c:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 91e:	00000517          	auipc	a0,0x0
 922:	14a53503          	ld	a0,330(a0) # a68 <freep>
 926:	c515                	beqz	a0,952 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 928:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 92a:	4798                	lw	a4,8(a5)
 92c:	02977f63          	bgeu	a4,s1,96a <malloc+0x70>
 930:	8a4e                	mv	s4,s3
 932:	0009871b          	sext.w	a4,s3
 936:	6685                	lui	a3,0x1
 938:	00d77363          	bgeu	a4,a3,93e <malloc+0x44>
 93c:	6a05                	lui	s4,0x1
 93e:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 942:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 946:	00000917          	auipc	s2,0x0
 94a:	12290913          	addi	s2,s2,290 # a68 <freep>
  if(p == (char*)-1)
 94e:	5afd                	li	s5,-1
 950:	a88d                	j	9c2 <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 952:	00000797          	auipc	a5,0x0
 956:	14678793          	addi	a5,a5,326 # a98 <base>
 95a:	00000717          	auipc	a4,0x0
 95e:	10f73723          	sd	a5,270(a4) # a68 <freep>
 962:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 964:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 968:	b7e1                	j	930 <malloc+0x36>
      if(p->s.size == nunits)
 96a:	02e48b63          	beq	s1,a4,9a0 <malloc+0xa6>
        p->s.size -= nunits;
 96e:	4137073b          	subw	a4,a4,s3
 972:	c798                	sw	a4,8(a5)
        p += p->s.size;
 974:	1702                	slli	a4,a4,0x20
 976:	9301                	srli	a4,a4,0x20
 978:	0712                	slli	a4,a4,0x4
 97a:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 97c:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 980:	00000717          	auipc	a4,0x0
 984:	0ea73423          	sd	a0,232(a4) # a68 <freep>
      return (void*)(p + 1);
 988:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 98c:	70e2                	ld	ra,56(sp)
 98e:	7442                	ld	s0,48(sp)
 990:	74a2                	ld	s1,40(sp)
 992:	7902                	ld	s2,32(sp)
 994:	69e2                	ld	s3,24(sp)
 996:	6a42                	ld	s4,16(sp)
 998:	6aa2                	ld	s5,8(sp)
 99a:	6b02                	ld	s6,0(sp)
 99c:	6121                	addi	sp,sp,64
 99e:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 9a0:	6398                	ld	a4,0(a5)
 9a2:	e118                	sd	a4,0(a0)
 9a4:	bff1                	j	980 <malloc+0x86>
  hp->s.size = nu;
 9a6:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 9aa:	0541                	addi	a0,a0,16
 9ac:	00000097          	auipc	ra,0x0
 9b0:	ec6080e7          	jalr	-314(ra) # 872 <free>
  return freep;
 9b4:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 9b8:	d971                	beqz	a0,98c <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9ba:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 9bc:	4798                	lw	a4,8(a5)
 9be:	fa9776e3          	bgeu	a4,s1,96a <malloc+0x70>
    if(p == freep)
 9c2:	00093703          	ld	a4,0(s2)
 9c6:	853e                	mv	a0,a5
 9c8:	fef719e3          	bne	a4,a5,9ba <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 9cc:	8552                	mv	a0,s4
 9ce:	00000097          	auipc	ra,0x0
 9d2:	b3e080e7          	jalr	-1218(ra) # 50c <sbrk>
  if(p == (char*)-1)
 9d6:	fd5518e3          	bne	a0,s5,9a6 <malloc+0xac>
        return 0;
 9da:	4501                	li	a0,0
 9dc:	bf45                	j	98c <malloc+0x92>
