
user/_grep:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <matchstar>:
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	ec26                	sd	s1,24(sp)
   8:	e84a                	sd	s2,16(sp)
   a:	e44e                	sd	s3,8(sp)
   c:	e052                	sd	s4,0(sp)
   e:	1800                	addi	s0,sp,48
  10:	892a                	mv	s2,a0
  12:	89ae                	mv	s3,a1
  14:	84b2                	mv	s1,a2
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
  16:	02e00a13          	li	s4,46
    if(matchhere(re, text))
  1a:	85a6                	mv	a1,s1
  1c:	854e                	mv	a0,s3
  1e:	00000097          	auipc	ra,0x0
  22:	030080e7          	jalr	48(ra) # 4e <matchhere>
  26:	e919                	bnez	a0,3c <matchstar+0x3c>
  }while(*text!='\0' && (*text++==c || c=='.'));
  28:	0004c783          	lbu	a5,0(s1)
  2c:	cb89                	beqz	a5,3e <matchstar+0x3e>
  2e:	0485                	addi	s1,s1,1
  30:	2781                	sext.w	a5,a5
  32:	ff2784e3          	beq	a5,s2,1a <matchstar+0x1a>
  36:	ff4902e3          	beq	s2,s4,1a <matchstar+0x1a>
  3a:	a011                	j	3e <matchstar+0x3e>
      return 1;
  3c:	4505                	li	a0,1
  return 0;
}
  3e:	70a2                	ld	ra,40(sp)
  40:	7402                	ld	s0,32(sp)
  42:	64e2                	ld	s1,24(sp)
  44:	6942                	ld	s2,16(sp)
  46:	69a2                	ld	s3,8(sp)
  48:	6a02                	ld	s4,0(sp)
  4a:	6145                	addi	sp,sp,48
  4c:	8082                	ret

000000000000004e <matchhere>:
  if(re[0] == '\0')
  4e:	00054703          	lbu	a4,0(a0)
  52:	cb3d                	beqz	a4,c8 <matchhere+0x7a>
{
  54:	1141                	addi	sp,sp,-16
  56:	e406                	sd	ra,8(sp)
  58:	e022                	sd	s0,0(sp)
  5a:	0800                	addi	s0,sp,16
  5c:	87aa                	mv	a5,a0
  if(re[1] == '*')
  5e:	00154683          	lbu	a3,1(a0)
  62:	02a00613          	li	a2,42
  66:	02c68563          	beq	a3,a2,90 <matchhere+0x42>
  if(re[0] == '$' && re[1] == '\0')
  6a:	02400613          	li	a2,36
  6e:	02c70a63          	beq	a4,a2,a2 <matchhere+0x54>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
  72:	0005c683          	lbu	a3,0(a1)
  return 0;
  76:	4501                	li	a0,0
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
  78:	ca81                	beqz	a3,88 <matchhere+0x3a>
  7a:	02e00613          	li	a2,46
  7e:	02c70d63          	beq	a4,a2,b8 <matchhere+0x6a>
  return 0;
  82:	4501                	li	a0,0
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
  84:	02d70a63          	beq	a4,a3,b8 <matchhere+0x6a>
}
  88:	60a2                	ld	ra,8(sp)
  8a:	6402                	ld	s0,0(sp)
  8c:	0141                	addi	sp,sp,16
  8e:	8082                	ret
    return matchstar(re[0], re+2, text);
  90:	862e                	mv	a2,a1
  92:	00250593          	addi	a1,a0,2
  96:	853a                	mv	a0,a4
  98:	00000097          	auipc	ra,0x0
  9c:	f68080e7          	jalr	-152(ra) # 0 <matchstar>
  a0:	b7e5                	j	88 <matchhere+0x3a>
  if(re[0] == '$' && re[1] == '\0')
  a2:	c691                	beqz	a3,ae <matchhere+0x60>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
  a4:	0005c683          	lbu	a3,0(a1)
  a8:	fee9                	bnez	a3,82 <matchhere+0x34>
  return 0;
  aa:	4501                	li	a0,0
  ac:	bff1                	j	88 <matchhere+0x3a>
    return *text == '\0';
  ae:	0005c503          	lbu	a0,0(a1)
  b2:	00153513          	seqz	a0,a0
  b6:	bfc9                	j	88 <matchhere+0x3a>
    return matchhere(re+1, text+1);
  b8:	0585                	addi	a1,a1,1
  ba:	00178513          	addi	a0,a5,1
  be:	00000097          	auipc	ra,0x0
  c2:	f90080e7          	jalr	-112(ra) # 4e <matchhere>
  c6:	b7c9                	j	88 <matchhere+0x3a>
    return 1;
  c8:	4505                	li	a0,1
}
  ca:	8082                	ret

00000000000000cc <match>:
{
  cc:	1101                	addi	sp,sp,-32
  ce:	ec06                	sd	ra,24(sp)
  d0:	e822                	sd	s0,16(sp)
  d2:	e426                	sd	s1,8(sp)
  d4:	e04a                	sd	s2,0(sp)
  d6:	1000                	addi	s0,sp,32
  d8:	892a                	mv	s2,a0
  da:	84ae                	mv	s1,a1
  if(re[0] == '^')
  dc:	00054703          	lbu	a4,0(a0)
  e0:	05e00793          	li	a5,94
  e4:	00f70e63          	beq	a4,a5,100 <match+0x34>
    if(matchhere(re, text))
  e8:	85a6                	mv	a1,s1
  ea:	854a                	mv	a0,s2
  ec:	00000097          	auipc	ra,0x0
  f0:	f62080e7          	jalr	-158(ra) # 4e <matchhere>
  f4:	ed01                	bnez	a0,10c <match+0x40>
  }while(*text++ != '\0');
  f6:	0485                	addi	s1,s1,1
  f8:	fff4c783          	lbu	a5,-1(s1)
  fc:	f7f5                	bnez	a5,e8 <match+0x1c>
  fe:	a801                	j	10e <match+0x42>
    return matchhere(re+1, text);
 100:	0505                	addi	a0,a0,1
 102:	00000097          	auipc	ra,0x0
 106:	f4c080e7          	jalr	-180(ra) # 4e <matchhere>
 10a:	a011                	j	10e <match+0x42>
      return 1;
 10c:	4505                	li	a0,1
}
 10e:	60e2                	ld	ra,24(sp)
 110:	6442                	ld	s0,16(sp)
 112:	64a2                	ld	s1,8(sp)
 114:	6902                	ld	s2,0(sp)
 116:	6105                	addi	sp,sp,32
 118:	8082                	ret

000000000000011a <grep>:
{
 11a:	711d                	addi	sp,sp,-96
 11c:	ec86                	sd	ra,88(sp)
 11e:	e8a2                	sd	s0,80(sp)
 120:	e4a6                	sd	s1,72(sp)
 122:	e0ca                	sd	s2,64(sp)
 124:	fc4e                	sd	s3,56(sp)
 126:	f852                	sd	s4,48(sp)
 128:	f456                	sd	s5,40(sp)
 12a:	f05a                	sd	s6,32(sp)
 12c:	ec5e                	sd	s7,24(sp)
 12e:	e862                	sd	s8,16(sp)
 130:	e466                	sd	s9,8(sp)
 132:	e06a                	sd	s10,0(sp)
 134:	1080                	addi	s0,sp,96
 136:	89aa                	mv	s3,a0
 138:	8bae                	mv	s7,a1
  m = 0;
 13a:	4a01                	li	s4,0
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 13c:	3ff00c13          	li	s8,1023
 140:	00001b17          	auipc	s6,0x1
 144:	9d0b0b13          	addi	s6,s6,-1584 # b10 <buf>
    p = buf;
 148:	8d5a                	mv	s10,s6
        *q = '\n';
 14a:	4aa9                	li	s5,10
    p = buf;
 14c:	8cda                	mv	s9,s6
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 14e:	a099                	j	194 <grep+0x7a>
        *q = '\n';
 150:	01548023          	sb	s5,0(s1)
        write(1, p, q+1 - p);
 154:	00148613          	addi	a2,s1,1
 158:	4126063b          	subw	a2,a2,s2
 15c:	85ca                	mv	a1,s2
 15e:	4505                	li	a0,1
 160:	00000097          	auipc	ra,0x0
 164:	428080e7          	jalr	1064(ra) # 588 <write>
      p = q+1;
 168:	00148913          	addi	s2,s1,1
    while((q = strchr(p, '\n')) != 0){
 16c:	45a9                	li	a1,10
 16e:	854a                	mv	a0,s2
 170:	00000097          	auipc	ra,0x0
 174:	204080e7          	jalr	516(ra) # 374 <strchr>
 178:	84aa                	mv	s1,a0
 17a:	c919                	beqz	a0,190 <grep+0x76>
      *q = 0;
 17c:	00048023          	sb	zero,0(s1)
      if(match(pattern, p)){
 180:	85ca                	mv	a1,s2
 182:	854e                	mv	a0,s3
 184:	00000097          	auipc	ra,0x0
 188:	f48080e7          	jalr	-184(ra) # cc <match>
 18c:	dd71                	beqz	a0,168 <grep+0x4e>
 18e:	b7c9                	j	150 <grep+0x36>
    if(m > 0){
 190:	03404563          	bgtz	s4,1ba <grep+0xa0>
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 194:	414c063b          	subw	a2,s8,s4
 198:	014b05b3          	add	a1,s6,s4
 19c:	855e                	mv	a0,s7
 19e:	00000097          	auipc	ra,0x0
 1a2:	3e2080e7          	jalr	994(ra) # 580 <read>
 1a6:	02a05663          	blez	a0,1d2 <grep+0xb8>
    m += n;
 1aa:	00aa0a3b          	addw	s4,s4,a0
    buf[m] = '\0';
 1ae:	014b07b3          	add	a5,s6,s4
 1b2:	00078023          	sb	zero,0(a5)
    p = buf;
 1b6:	8966                	mv	s2,s9
    while((q = strchr(p, '\n')) != 0){
 1b8:	bf55                	j	16c <grep+0x52>
      m -= p - buf;
 1ba:	416907b3          	sub	a5,s2,s6
 1be:	40fa0a3b          	subw	s4,s4,a5
      memmove(buf, p, m);
 1c2:	8652                	mv	a2,s4
 1c4:	85ca                	mv	a1,s2
 1c6:	856a                	mv	a0,s10
 1c8:	00000097          	auipc	ra,0x0
 1cc:	2ea080e7          	jalr	746(ra) # 4b2 <memmove>
 1d0:	b7d1                	j	194 <grep+0x7a>
}
 1d2:	60e6                	ld	ra,88(sp)
 1d4:	6446                	ld	s0,80(sp)
 1d6:	64a6                	ld	s1,72(sp)
 1d8:	6906                	ld	s2,64(sp)
 1da:	79e2                	ld	s3,56(sp)
 1dc:	7a42                	ld	s4,48(sp)
 1de:	7aa2                	ld	s5,40(sp)
 1e0:	7b02                	ld	s6,32(sp)
 1e2:	6be2                	ld	s7,24(sp)
 1e4:	6c42                	ld	s8,16(sp)
 1e6:	6ca2                	ld	s9,8(sp)
 1e8:	6d02                	ld	s10,0(sp)
 1ea:	6125                	addi	sp,sp,96
 1ec:	8082                	ret

00000000000001ee <main>:
{
 1ee:	7139                	addi	sp,sp,-64
 1f0:	fc06                	sd	ra,56(sp)
 1f2:	f822                	sd	s0,48(sp)
 1f4:	f426                	sd	s1,40(sp)
 1f6:	f04a                	sd	s2,32(sp)
 1f8:	ec4e                	sd	s3,24(sp)
 1fa:	e852                	sd	s4,16(sp)
 1fc:	e456                	sd	s5,8(sp)
 1fe:	0080                	addi	s0,sp,64
  if(argc <= 1){
 200:	4785                	li	a5,1
 202:	04a7de63          	bge	a5,a0,25e <main+0x70>
  pattern = argv[1];
 206:	0085ba03          	ld	s4,8(a1)
  if(argc <= 2){
 20a:	4789                	li	a5,2
 20c:	06a7d763          	bge	a5,a0,27a <main+0x8c>
 210:	01058913          	addi	s2,a1,16
 214:	ffd5099b          	addiw	s3,a0,-3
 218:	1982                	slli	s3,s3,0x20
 21a:	0209d993          	srli	s3,s3,0x20
 21e:	098e                	slli	s3,s3,0x3
 220:	05e1                	addi	a1,a1,24
 222:	99ae                	add	s3,s3,a1
    if((fd = open(argv[i], 0)) < 0){
 224:	4581                	li	a1,0
 226:	00093503          	ld	a0,0(s2)
 22a:	00000097          	auipc	ra,0x0
 22e:	37e080e7          	jalr	894(ra) # 5a8 <open>
 232:	84aa                	mv	s1,a0
 234:	04054e63          	bltz	a0,290 <main+0xa2>
    grep(pattern, fd);
 238:	85aa                	mv	a1,a0
 23a:	8552                	mv	a0,s4
 23c:	00000097          	auipc	ra,0x0
 240:	ede080e7          	jalr	-290(ra) # 11a <grep>
    close(fd);
 244:	8526                	mv	a0,s1
 246:	00000097          	auipc	ra,0x0
 24a:	34a080e7          	jalr	842(ra) # 590 <close>
  for(i = 2; i < argc; i++){
 24e:	0921                	addi	s2,s2,8
 250:	fd391ae3          	bne	s2,s3,224 <main+0x36>
  exit(0);
 254:	4501                	li	a0,0
 256:	00000097          	auipc	ra,0x0
 25a:	312080e7          	jalr	786(ra) # 568 <exit>
    fprintf(2, "usage: grep pattern [file ...]\n");
 25e:	00001597          	auipc	a1,0x1
 262:	85258593          	addi	a1,a1,-1966 # ab0 <malloc+0xea>
 266:	4509                	li	a0,2
 268:	00000097          	auipc	ra,0x0
 26c:	672080e7          	jalr	1650(ra) # 8da <fprintf>
    exit(1);
 270:	4505                	li	a0,1
 272:	00000097          	auipc	ra,0x0
 276:	2f6080e7          	jalr	758(ra) # 568 <exit>
    grep(pattern, 0);
 27a:	4581                	li	a1,0
 27c:	8552                	mv	a0,s4
 27e:	00000097          	auipc	ra,0x0
 282:	e9c080e7          	jalr	-356(ra) # 11a <grep>
    exit(0);
 286:	4501                	li	a0,0
 288:	00000097          	auipc	ra,0x0
 28c:	2e0080e7          	jalr	736(ra) # 568 <exit>
      printf("grep: cannot open %s\n", argv[i]);
 290:	00093583          	ld	a1,0(s2)
 294:	00001517          	auipc	a0,0x1
 298:	83c50513          	addi	a0,a0,-1988 # ad0 <malloc+0x10a>
 29c:	00000097          	auipc	ra,0x0
 2a0:	66c080e7          	jalr	1644(ra) # 908 <printf>
      exit(1);
 2a4:	4505                	li	a0,1
 2a6:	00000097          	auipc	ra,0x0
 2aa:	2c2080e7          	jalr	706(ra) # 568 <exit>

00000000000002ae <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
 2ae:	1141                	addi	sp,sp,-16
 2b0:	e422                	sd	s0,8(sp)
 2b2:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2b4:	87aa                	mv	a5,a0
 2b6:	0585                	addi	a1,a1,1
 2b8:	0785                	addi	a5,a5,1
 2ba:	fff5c703          	lbu	a4,-1(a1)
 2be:	fee78fa3          	sb	a4,-1(a5)
 2c2:	fb75                	bnez	a4,2b6 <strcpy+0x8>
    ;
  return os;
}
 2c4:	6422                	ld	s0,8(sp)
 2c6:	0141                	addi	sp,sp,16
 2c8:	8082                	ret

00000000000002ca <strcat>:

char*
strcat(char *s, const char *t)
{
 2ca:	1141                	addi	sp,sp,-16
 2cc:	e422                	sd	s0,8(sp)
 2ce:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
 2d0:	00054783          	lbu	a5,0(a0)
 2d4:	c385                	beqz	a5,2f4 <strcat+0x2a>
 2d6:	87aa                	mv	a5,a0
    s++;
 2d8:	0785                	addi	a5,a5,1
  while(*s)
 2da:	0007c703          	lbu	a4,0(a5)
 2de:	ff6d                	bnez	a4,2d8 <strcat+0xe>
  while((*s++ = *t++))
 2e0:	0585                	addi	a1,a1,1
 2e2:	0785                	addi	a5,a5,1
 2e4:	fff5c703          	lbu	a4,-1(a1)
 2e8:	fee78fa3          	sb	a4,-1(a5)
 2ec:	fb75                	bnez	a4,2e0 <strcat+0x16>
    ;
  return os;
}
 2ee:	6422                	ld	s0,8(sp)
 2f0:	0141                	addi	sp,sp,16
 2f2:	8082                	ret
  while(*s)
 2f4:	87aa                	mv	a5,a0
 2f6:	b7ed                	j	2e0 <strcat+0x16>

00000000000002f8 <strcmp>:


int
strcmp(const char *p, const char *q)
{
 2f8:	1141                	addi	sp,sp,-16
 2fa:	e422                	sd	s0,8(sp)
 2fc:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 2fe:	00054783          	lbu	a5,0(a0)
 302:	cb91                	beqz	a5,316 <strcmp+0x1e>
 304:	0005c703          	lbu	a4,0(a1)
 308:	00f71763          	bne	a4,a5,316 <strcmp+0x1e>
    p++, q++;
 30c:	0505                	addi	a0,a0,1
 30e:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 310:	00054783          	lbu	a5,0(a0)
 314:	fbe5                	bnez	a5,304 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 316:	0005c503          	lbu	a0,0(a1)
}
 31a:	40a7853b          	subw	a0,a5,a0
 31e:	6422                	ld	s0,8(sp)
 320:	0141                	addi	sp,sp,16
 322:	8082                	ret

0000000000000324 <strlen>:

uint
strlen(const char *s)
{
 324:	1141                	addi	sp,sp,-16
 326:	e422                	sd	s0,8(sp)
 328:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 32a:	00054783          	lbu	a5,0(a0)
 32e:	cf91                	beqz	a5,34a <strlen+0x26>
 330:	0505                	addi	a0,a0,1
 332:	87aa                	mv	a5,a0
 334:	4685                	li	a3,1
 336:	9e89                	subw	a3,a3,a0
 338:	00f6853b          	addw	a0,a3,a5
 33c:	0785                	addi	a5,a5,1
 33e:	fff7c703          	lbu	a4,-1(a5)
 342:	fb7d                	bnez	a4,338 <strlen+0x14>
    ;
  return n;
}
 344:	6422                	ld	s0,8(sp)
 346:	0141                	addi	sp,sp,16
 348:	8082                	ret
  for(n = 0; s[n]; n++)
 34a:	4501                	li	a0,0
 34c:	bfe5                	j	344 <strlen+0x20>

000000000000034e <memset>:

void*
memset(void *dst, int c, uint n)
{
 34e:	1141                	addi	sp,sp,-16
 350:	e422                	sd	s0,8(sp)
 352:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 354:	ce09                	beqz	a2,36e <memset+0x20>
 356:	87aa                	mv	a5,a0
 358:	fff6071b          	addiw	a4,a2,-1
 35c:	1702                	slli	a4,a4,0x20
 35e:	9301                	srli	a4,a4,0x20
 360:	0705                	addi	a4,a4,1
 362:	972a                	add	a4,a4,a0
    cdst[i] = c;
 364:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 368:	0785                	addi	a5,a5,1
 36a:	fee79de3          	bne	a5,a4,364 <memset+0x16>
  }
  return dst;
}
 36e:	6422                	ld	s0,8(sp)
 370:	0141                	addi	sp,sp,16
 372:	8082                	ret

0000000000000374 <strchr>:

char*
strchr(const char *s, char c)
{
 374:	1141                	addi	sp,sp,-16
 376:	e422                	sd	s0,8(sp)
 378:	0800                	addi	s0,sp,16
  for(; *s; s++)
 37a:	00054783          	lbu	a5,0(a0)
 37e:	cb99                	beqz	a5,394 <strchr+0x20>
    if(*s == c)
 380:	00f58763          	beq	a1,a5,38e <strchr+0x1a>
  for(; *s; s++)
 384:	0505                	addi	a0,a0,1
 386:	00054783          	lbu	a5,0(a0)
 38a:	fbfd                	bnez	a5,380 <strchr+0xc>
      return (char*)s;
  return 0;
 38c:	4501                	li	a0,0
}
 38e:	6422                	ld	s0,8(sp)
 390:	0141                	addi	sp,sp,16
 392:	8082                	ret
  return 0;
 394:	4501                	li	a0,0
 396:	bfe5                	j	38e <strchr+0x1a>

0000000000000398 <gets>:

char*
gets(char *buf, int max)
{
 398:	711d                	addi	sp,sp,-96
 39a:	ec86                	sd	ra,88(sp)
 39c:	e8a2                	sd	s0,80(sp)
 39e:	e4a6                	sd	s1,72(sp)
 3a0:	e0ca                	sd	s2,64(sp)
 3a2:	fc4e                	sd	s3,56(sp)
 3a4:	f852                	sd	s4,48(sp)
 3a6:	f456                	sd	s5,40(sp)
 3a8:	f05a                	sd	s6,32(sp)
 3aa:	ec5e                	sd	s7,24(sp)
 3ac:	1080                	addi	s0,sp,96
 3ae:	8baa                	mv	s7,a0
 3b0:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3b2:	892a                	mv	s2,a0
 3b4:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 3b6:	4aa9                	li	s5,10
 3b8:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 3ba:	89a6                	mv	s3,s1
 3bc:	2485                	addiw	s1,s1,1
 3be:	0344d863          	bge	s1,s4,3ee <gets+0x56>
    cc = read(0, &c, 1);
 3c2:	4605                	li	a2,1
 3c4:	faf40593          	addi	a1,s0,-81
 3c8:	4501                	li	a0,0
 3ca:	00000097          	auipc	ra,0x0
 3ce:	1b6080e7          	jalr	438(ra) # 580 <read>
    if(cc < 1)
 3d2:	00a05e63          	blez	a0,3ee <gets+0x56>
    buf[i++] = c;
 3d6:	faf44783          	lbu	a5,-81(s0)
 3da:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 3de:	01578763          	beq	a5,s5,3ec <gets+0x54>
 3e2:	0905                	addi	s2,s2,1
 3e4:	fd679be3          	bne	a5,s6,3ba <gets+0x22>
  for(i=0; i+1 < max; ){
 3e8:	89a6                	mv	s3,s1
 3ea:	a011                	j	3ee <gets+0x56>
 3ec:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 3ee:	99de                	add	s3,s3,s7
 3f0:	00098023          	sb	zero,0(s3)
  return buf;
}
 3f4:	855e                	mv	a0,s7
 3f6:	60e6                	ld	ra,88(sp)
 3f8:	6446                	ld	s0,80(sp)
 3fa:	64a6                	ld	s1,72(sp)
 3fc:	6906                	ld	s2,64(sp)
 3fe:	79e2                	ld	s3,56(sp)
 400:	7a42                	ld	s4,48(sp)
 402:	7aa2                	ld	s5,40(sp)
 404:	7b02                	ld	s6,32(sp)
 406:	6be2                	ld	s7,24(sp)
 408:	6125                	addi	sp,sp,96
 40a:	8082                	ret

000000000000040c <stat>:

int
stat(const char *n, struct stat *st)
{
 40c:	1101                	addi	sp,sp,-32
 40e:	ec06                	sd	ra,24(sp)
 410:	e822                	sd	s0,16(sp)
 412:	e426                	sd	s1,8(sp)
 414:	e04a                	sd	s2,0(sp)
 416:	1000                	addi	s0,sp,32
 418:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 41a:	4581                	li	a1,0
 41c:	00000097          	auipc	ra,0x0
 420:	18c080e7          	jalr	396(ra) # 5a8 <open>
  if(fd < 0)
 424:	02054563          	bltz	a0,44e <stat+0x42>
 428:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 42a:	85ca                	mv	a1,s2
 42c:	00000097          	auipc	ra,0x0
 430:	184080e7          	jalr	388(ra) # 5b0 <fstat>
 434:	892a                	mv	s2,a0
  close(fd);
 436:	8526                	mv	a0,s1
 438:	00000097          	auipc	ra,0x0
 43c:	158080e7          	jalr	344(ra) # 590 <close>
  return r;
}
 440:	854a                	mv	a0,s2
 442:	60e2                	ld	ra,24(sp)
 444:	6442                	ld	s0,16(sp)
 446:	64a2                	ld	s1,8(sp)
 448:	6902                	ld	s2,0(sp)
 44a:	6105                	addi	sp,sp,32
 44c:	8082                	ret
    return -1;
 44e:	597d                	li	s2,-1
 450:	bfc5                	j	440 <stat+0x34>

0000000000000452 <atoi>:

int
atoi(const char *s)
{
 452:	1141                	addi	sp,sp,-16
 454:	e422                	sd	s0,8(sp)
 456:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 458:	00054703          	lbu	a4,0(a0)
 45c:	02d00793          	li	a5,45
  int neg = 1;
 460:	4805                	li	a6,1
  if (*s == '-') {
 462:	04f70363          	beq	a4,a5,4a8 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 466:	00054683          	lbu	a3,0(a0)
 46a:	fd06879b          	addiw	a5,a3,-48
 46e:	0ff7f793          	andi	a5,a5,255
 472:	4725                	li	a4,9
 474:	02f76d63          	bltu	a4,a5,4ae <atoi+0x5c>
  n = 0;
 478:	4601                	li	a2,0
  while('0' <= *s && *s <= '9')
 47a:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 47c:	0505                	addi	a0,a0,1
 47e:	0026179b          	slliw	a5,a2,0x2
 482:	9fb1                	addw	a5,a5,a2
 484:	0017979b          	slliw	a5,a5,0x1
 488:	9fb5                	addw	a5,a5,a3
 48a:	fd07861b          	addiw	a2,a5,-48
  while('0' <= *s && *s <= '9')
 48e:	00054683          	lbu	a3,0(a0)
 492:	fd06871b          	addiw	a4,a3,-48
 496:	0ff77713          	andi	a4,a4,255
 49a:	fee5f1e3          	bgeu	a1,a4,47c <atoi+0x2a>
  return n * neg;
}
 49e:	02c8053b          	mulw	a0,a6,a2
 4a2:	6422                	ld	s0,8(sp)
 4a4:	0141                	addi	sp,sp,16
 4a6:	8082                	ret
    s++;
 4a8:	0505                	addi	a0,a0,1
    neg = -1;
 4aa:	587d                	li	a6,-1
 4ac:	bf6d                	j	466 <atoi+0x14>
  n = 0;
 4ae:	4601                	li	a2,0
 4b0:	b7fd                	j	49e <atoi+0x4c>

00000000000004b2 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4b2:	1141                	addi	sp,sp,-16
 4b4:	e422                	sd	s0,8(sp)
 4b6:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 4b8:	02b57663          	bgeu	a0,a1,4e4 <memmove+0x32>
    while(n-- > 0)
 4bc:	02c05163          	blez	a2,4de <memmove+0x2c>
 4c0:	fff6079b          	addiw	a5,a2,-1
 4c4:	1782                	slli	a5,a5,0x20
 4c6:	9381                	srli	a5,a5,0x20
 4c8:	0785                	addi	a5,a5,1
 4ca:	97aa                	add	a5,a5,a0
  dst = vdst;
 4cc:	872a                	mv	a4,a0
      *dst++ = *src++;
 4ce:	0585                	addi	a1,a1,1
 4d0:	0705                	addi	a4,a4,1
 4d2:	fff5c683          	lbu	a3,-1(a1)
 4d6:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 4da:	fee79ae3          	bne	a5,a4,4ce <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 4de:	6422                	ld	s0,8(sp)
 4e0:	0141                	addi	sp,sp,16
 4e2:	8082                	ret
    dst += n;
 4e4:	00c50733          	add	a4,a0,a2
    src += n;
 4e8:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 4ea:	fec05ae3          	blez	a2,4de <memmove+0x2c>
 4ee:	fff6079b          	addiw	a5,a2,-1
 4f2:	1782                	slli	a5,a5,0x20
 4f4:	9381                	srli	a5,a5,0x20
 4f6:	fff7c793          	not	a5,a5
 4fa:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 4fc:	15fd                	addi	a1,a1,-1
 4fe:	177d                	addi	a4,a4,-1
 500:	0005c683          	lbu	a3,0(a1)
 504:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 508:	fee79ae3          	bne	a5,a4,4fc <memmove+0x4a>
 50c:	bfc9                	j	4de <memmove+0x2c>

000000000000050e <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 50e:	1141                	addi	sp,sp,-16
 510:	e422                	sd	s0,8(sp)
 512:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 514:	ca05                	beqz	a2,544 <memcmp+0x36>
 516:	fff6069b          	addiw	a3,a2,-1
 51a:	1682                	slli	a3,a3,0x20
 51c:	9281                	srli	a3,a3,0x20
 51e:	0685                	addi	a3,a3,1
 520:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 522:	00054783          	lbu	a5,0(a0)
 526:	0005c703          	lbu	a4,0(a1)
 52a:	00e79863          	bne	a5,a4,53a <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 52e:	0505                	addi	a0,a0,1
    p2++;
 530:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 532:	fed518e3          	bne	a0,a3,522 <memcmp+0x14>
  }
  return 0;
 536:	4501                	li	a0,0
 538:	a019                	j	53e <memcmp+0x30>
      return *p1 - *p2;
 53a:	40e7853b          	subw	a0,a5,a4
}
 53e:	6422                	ld	s0,8(sp)
 540:	0141                	addi	sp,sp,16
 542:	8082                	ret
  return 0;
 544:	4501                	li	a0,0
 546:	bfe5                	j	53e <memcmp+0x30>

0000000000000548 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 548:	1141                	addi	sp,sp,-16
 54a:	e406                	sd	ra,8(sp)
 54c:	e022                	sd	s0,0(sp)
 54e:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 550:	00000097          	auipc	ra,0x0
 554:	f62080e7          	jalr	-158(ra) # 4b2 <memmove>
}
 558:	60a2                	ld	ra,8(sp)
 55a:	6402                	ld	s0,0(sp)
 55c:	0141                	addi	sp,sp,16
 55e:	8082                	ret

0000000000000560 <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 560:	4885                	li	a7,1
 ecall
 562:	00000073          	ecall
 ret
 566:	8082                	ret

0000000000000568 <exit>:
.global exit
exit:
 li a7, SYS_exit
 568:	4889                	li	a7,2
 ecall
 56a:	00000073          	ecall
 ret
 56e:	8082                	ret

0000000000000570 <wait>:
.global wait
wait:
 li a7, SYS_wait
 570:	488d                	li	a7,3
 ecall
 572:	00000073          	ecall
 ret
 576:	8082                	ret

0000000000000578 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 578:	4891                	li	a7,4
 ecall
 57a:	00000073          	ecall
 ret
 57e:	8082                	ret

0000000000000580 <read>:
.global read
read:
 li a7, SYS_read
 580:	4895                	li	a7,5
 ecall
 582:	00000073          	ecall
 ret
 586:	8082                	ret

0000000000000588 <write>:
.global write
write:
 li a7, SYS_write
 588:	48c1                	li	a7,16
 ecall
 58a:	00000073          	ecall
 ret
 58e:	8082                	ret

0000000000000590 <close>:
.global close
close:
 li a7, SYS_close
 590:	48d5                	li	a7,21
 ecall
 592:	00000073          	ecall
 ret
 596:	8082                	ret

0000000000000598 <kill>:
.global kill
kill:
 li a7, SYS_kill
 598:	4899                	li	a7,6
 ecall
 59a:	00000073          	ecall
 ret
 59e:	8082                	ret

00000000000005a0 <exec>:
.global exec
exec:
 li a7, SYS_exec
 5a0:	489d                	li	a7,7
 ecall
 5a2:	00000073          	ecall
 ret
 5a6:	8082                	ret

00000000000005a8 <open>:
.global open
open:
 li a7, SYS_open
 5a8:	48bd                	li	a7,15
 ecall
 5aa:	00000073          	ecall
 ret
 5ae:	8082                	ret

00000000000005b0 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 5b0:	48a1                	li	a7,8
 ecall
 5b2:	00000073          	ecall
 ret
 5b6:	8082                	ret

00000000000005b8 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 5b8:	48d1                	li	a7,20
 ecall
 5ba:	00000073          	ecall
 ret
 5be:	8082                	ret

00000000000005c0 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 5c0:	48a5                	li	a7,9
 ecall
 5c2:	00000073          	ecall
 ret
 5c6:	8082                	ret

00000000000005c8 <dup>:
.global dup
dup:
 li a7, SYS_dup
 5c8:	48a9                	li	a7,10
 ecall
 5ca:	00000073          	ecall
 ret
 5ce:	8082                	ret

00000000000005d0 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 5d0:	48ad                	li	a7,11
 ecall
 5d2:	00000073          	ecall
 ret
 5d6:	8082                	ret

00000000000005d8 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 5d8:	48b1                	li	a7,12
 ecall
 5da:	00000073          	ecall
 ret
 5de:	8082                	ret

00000000000005e0 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 5e0:	48b5                	li	a7,13
 ecall
 5e2:	00000073          	ecall
 ret
 5e6:	8082                	ret

00000000000005e8 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 5e8:	48b9                	li	a7,14
 ecall
 5ea:	00000073          	ecall
 ret
 5ee:	8082                	ret

00000000000005f0 <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 5f0:	48d9                	li	a7,22
 ecall
 5f2:	00000073          	ecall
 ret
 5f6:	8082                	ret

00000000000005f8 <dev>:
.global dev
dev:
 li a7, SYS_dev
 5f8:	48dd                	li	a7,23
 ecall
 5fa:	00000073          	ecall
 ret
 5fe:	8082                	ret

0000000000000600 <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 600:	48e1                	li	a7,24
 ecall
 602:	00000073          	ecall
 ret
 606:	8082                	ret

0000000000000608 <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 608:	48e5                	li	a7,25
 ecall
 60a:	00000073          	ecall
 ret
 60e:	8082                	ret

0000000000000610 <remove>:
.global remove
remove:
 li a7, SYS_remove
 610:	48c5                	li	a7,17
 ecall
 612:	00000073          	ecall
 ret
 616:	8082                	ret

0000000000000618 <trace>:
.global trace
trace:
 li a7, SYS_trace
 618:	48c9                	li	a7,18
 ecall
 61a:	00000073          	ecall
 ret
 61e:	8082                	ret

0000000000000620 <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 620:	48cd                	li	a7,19
 ecall
 622:	00000073          	ecall
 ret
 626:	8082                	ret

0000000000000628 <rename>:
.global rename
rename:
 li a7, SYS_rename
 628:	48e9                	li	a7,26
 ecall
 62a:	00000073          	ecall
 ret
 62e:	8082                	ret

0000000000000630 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 630:	1101                	addi	sp,sp,-32
 632:	ec06                	sd	ra,24(sp)
 634:	e822                	sd	s0,16(sp)
 636:	1000                	addi	s0,sp,32
 638:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 63c:	4605                	li	a2,1
 63e:	fef40593          	addi	a1,s0,-17
 642:	00000097          	auipc	ra,0x0
 646:	f46080e7          	jalr	-186(ra) # 588 <write>
}
 64a:	60e2                	ld	ra,24(sp)
 64c:	6442                	ld	s0,16(sp)
 64e:	6105                	addi	sp,sp,32
 650:	8082                	ret

0000000000000652 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 652:	7139                	addi	sp,sp,-64
 654:	fc06                	sd	ra,56(sp)
 656:	f822                	sd	s0,48(sp)
 658:	f426                	sd	s1,40(sp)
 65a:	f04a                	sd	s2,32(sp)
 65c:	ec4e                	sd	s3,24(sp)
 65e:	0080                	addi	s0,sp,64
 660:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 662:	c299                	beqz	a3,668 <printint+0x16>
 664:	0805c863          	bltz	a1,6f4 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 668:	2581                	sext.w	a1,a1
  neg = 0;
 66a:	4881                	li	a7,0
 66c:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 670:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 672:	2601                	sext.w	a2,a2
 674:	00000517          	auipc	a0,0x0
 678:	47c50513          	addi	a0,a0,1148 # af0 <digits>
 67c:	883a                	mv	a6,a4
 67e:	2705                	addiw	a4,a4,1
 680:	02c5f7bb          	remuw	a5,a1,a2
 684:	1782                	slli	a5,a5,0x20
 686:	9381                	srli	a5,a5,0x20
 688:	97aa                	add	a5,a5,a0
 68a:	0007c783          	lbu	a5,0(a5)
 68e:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 692:	0005879b          	sext.w	a5,a1
 696:	02c5d5bb          	divuw	a1,a1,a2
 69a:	0685                	addi	a3,a3,1
 69c:	fec7f0e3          	bgeu	a5,a2,67c <printint+0x2a>
  if(neg)
 6a0:	00088b63          	beqz	a7,6b6 <printint+0x64>
    buf[i++] = '-';
 6a4:	fd040793          	addi	a5,s0,-48
 6a8:	973e                	add	a4,a4,a5
 6aa:	02d00793          	li	a5,45
 6ae:	fef70823          	sb	a5,-16(a4)
 6b2:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 6b6:	02e05863          	blez	a4,6e6 <printint+0x94>
 6ba:	fc040793          	addi	a5,s0,-64
 6be:	00e78933          	add	s2,a5,a4
 6c2:	fff78993          	addi	s3,a5,-1
 6c6:	99ba                	add	s3,s3,a4
 6c8:	377d                	addiw	a4,a4,-1
 6ca:	1702                	slli	a4,a4,0x20
 6cc:	9301                	srli	a4,a4,0x20
 6ce:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 6d2:	fff94583          	lbu	a1,-1(s2)
 6d6:	8526                	mv	a0,s1
 6d8:	00000097          	auipc	ra,0x0
 6dc:	f58080e7          	jalr	-168(ra) # 630 <putc>
  while(--i >= 0)
 6e0:	197d                	addi	s2,s2,-1
 6e2:	ff3918e3          	bne	s2,s3,6d2 <printint+0x80>
}
 6e6:	70e2                	ld	ra,56(sp)
 6e8:	7442                	ld	s0,48(sp)
 6ea:	74a2                	ld	s1,40(sp)
 6ec:	7902                	ld	s2,32(sp)
 6ee:	69e2                	ld	s3,24(sp)
 6f0:	6121                	addi	sp,sp,64
 6f2:	8082                	ret
    x = -xx;
 6f4:	40b005bb          	negw	a1,a1
    neg = 1;
 6f8:	4885                	li	a7,1
    x = -xx;
 6fa:	bf8d                	j	66c <printint+0x1a>

00000000000006fc <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 6fc:	7119                	addi	sp,sp,-128
 6fe:	fc86                	sd	ra,120(sp)
 700:	f8a2                	sd	s0,112(sp)
 702:	f4a6                	sd	s1,104(sp)
 704:	f0ca                	sd	s2,96(sp)
 706:	ecce                	sd	s3,88(sp)
 708:	e8d2                	sd	s4,80(sp)
 70a:	e4d6                	sd	s5,72(sp)
 70c:	e0da                	sd	s6,64(sp)
 70e:	fc5e                	sd	s7,56(sp)
 710:	f862                	sd	s8,48(sp)
 712:	f466                	sd	s9,40(sp)
 714:	f06a                	sd	s10,32(sp)
 716:	ec6e                	sd	s11,24(sp)
 718:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 71a:	0005c903          	lbu	s2,0(a1)
 71e:	18090f63          	beqz	s2,8bc <vprintf+0x1c0>
 722:	8aaa                	mv	s5,a0
 724:	8b32                	mv	s6,a2
 726:	00158493          	addi	s1,a1,1
  state = 0;
 72a:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 72c:	02500a13          	li	s4,37
      if(c == 'd'){
 730:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 734:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 738:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 73c:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 740:	00000b97          	auipc	s7,0x0
 744:	3b0b8b93          	addi	s7,s7,944 # af0 <digits>
 748:	a839                	j	766 <vprintf+0x6a>
        putc(fd, c);
 74a:	85ca                	mv	a1,s2
 74c:	8556                	mv	a0,s5
 74e:	00000097          	auipc	ra,0x0
 752:	ee2080e7          	jalr	-286(ra) # 630 <putc>
 756:	a019                	j	75c <vprintf+0x60>
    } else if(state == '%'){
 758:	01498f63          	beq	s3,s4,776 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 75c:	0485                	addi	s1,s1,1
 75e:	fff4c903          	lbu	s2,-1(s1)
 762:	14090d63          	beqz	s2,8bc <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 766:	0009079b          	sext.w	a5,s2
    if(state == 0){
 76a:	fe0997e3          	bnez	s3,758 <vprintf+0x5c>
      if(c == '%'){
 76e:	fd479ee3          	bne	a5,s4,74a <vprintf+0x4e>
        state = '%';
 772:	89be                	mv	s3,a5
 774:	b7e5                	j	75c <vprintf+0x60>
      if(c == 'd'){
 776:	05878063          	beq	a5,s8,7b6 <vprintf+0xba>
      } else if(c == 'l') {
 77a:	05978c63          	beq	a5,s9,7d2 <vprintf+0xd6>
      } else if(c == 'x') {
 77e:	07a78863          	beq	a5,s10,7ee <vprintf+0xf2>
      } else if(c == 'p') {
 782:	09b78463          	beq	a5,s11,80a <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 786:	07300713          	li	a4,115
 78a:	0ce78663          	beq	a5,a4,856 <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 78e:	06300713          	li	a4,99
 792:	0ee78e63          	beq	a5,a4,88e <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 796:	11478863          	beq	a5,s4,8a6 <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 79a:	85d2                	mv	a1,s4
 79c:	8556                	mv	a0,s5
 79e:	00000097          	auipc	ra,0x0
 7a2:	e92080e7          	jalr	-366(ra) # 630 <putc>
        putc(fd, c);
 7a6:	85ca                	mv	a1,s2
 7a8:	8556                	mv	a0,s5
 7aa:	00000097          	auipc	ra,0x0
 7ae:	e86080e7          	jalr	-378(ra) # 630 <putc>
      }
      state = 0;
 7b2:	4981                	li	s3,0
 7b4:	b765                	j	75c <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 7b6:	008b0913          	addi	s2,s6,8
 7ba:	4685                	li	a3,1
 7bc:	4629                	li	a2,10
 7be:	000b2583          	lw	a1,0(s6)
 7c2:	8556                	mv	a0,s5
 7c4:	00000097          	auipc	ra,0x0
 7c8:	e8e080e7          	jalr	-370(ra) # 652 <printint>
 7cc:	8b4a                	mv	s6,s2
      state = 0;
 7ce:	4981                	li	s3,0
 7d0:	b771                	j	75c <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 7d2:	008b0913          	addi	s2,s6,8
 7d6:	4681                	li	a3,0
 7d8:	4629                	li	a2,10
 7da:	000b2583          	lw	a1,0(s6)
 7de:	8556                	mv	a0,s5
 7e0:	00000097          	auipc	ra,0x0
 7e4:	e72080e7          	jalr	-398(ra) # 652 <printint>
 7e8:	8b4a                	mv	s6,s2
      state = 0;
 7ea:	4981                	li	s3,0
 7ec:	bf85                	j	75c <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 7ee:	008b0913          	addi	s2,s6,8
 7f2:	4681                	li	a3,0
 7f4:	4641                	li	a2,16
 7f6:	000b2583          	lw	a1,0(s6)
 7fa:	8556                	mv	a0,s5
 7fc:	00000097          	auipc	ra,0x0
 800:	e56080e7          	jalr	-426(ra) # 652 <printint>
 804:	8b4a                	mv	s6,s2
      state = 0;
 806:	4981                	li	s3,0
 808:	bf91                	j	75c <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 80a:	008b0793          	addi	a5,s6,8
 80e:	f8f43423          	sd	a5,-120(s0)
 812:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 816:	03000593          	li	a1,48
 81a:	8556                	mv	a0,s5
 81c:	00000097          	auipc	ra,0x0
 820:	e14080e7          	jalr	-492(ra) # 630 <putc>
  putc(fd, 'x');
 824:	85ea                	mv	a1,s10
 826:	8556                	mv	a0,s5
 828:	00000097          	auipc	ra,0x0
 82c:	e08080e7          	jalr	-504(ra) # 630 <putc>
 830:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 832:	03c9d793          	srli	a5,s3,0x3c
 836:	97de                	add	a5,a5,s7
 838:	0007c583          	lbu	a1,0(a5)
 83c:	8556                	mv	a0,s5
 83e:	00000097          	auipc	ra,0x0
 842:	df2080e7          	jalr	-526(ra) # 630 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 846:	0992                	slli	s3,s3,0x4
 848:	397d                	addiw	s2,s2,-1
 84a:	fe0914e3          	bnez	s2,832 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 84e:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 852:	4981                	li	s3,0
 854:	b721                	j	75c <vprintf+0x60>
        s = va_arg(ap, char*);
 856:	008b0993          	addi	s3,s6,8
 85a:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 85e:	02090163          	beqz	s2,880 <vprintf+0x184>
        while(*s != 0){
 862:	00094583          	lbu	a1,0(s2)
 866:	c9a1                	beqz	a1,8b6 <vprintf+0x1ba>
          putc(fd, *s);
 868:	8556                	mv	a0,s5
 86a:	00000097          	auipc	ra,0x0
 86e:	dc6080e7          	jalr	-570(ra) # 630 <putc>
          s++;
 872:	0905                	addi	s2,s2,1
        while(*s != 0){
 874:	00094583          	lbu	a1,0(s2)
 878:	f9e5                	bnez	a1,868 <vprintf+0x16c>
        s = va_arg(ap, char*);
 87a:	8b4e                	mv	s6,s3
      state = 0;
 87c:	4981                	li	s3,0
 87e:	bdf9                	j	75c <vprintf+0x60>
          s = "(null)";
 880:	00000917          	auipc	s2,0x0
 884:	26890913          	addi	s2,s2,616 # ae8 <malloc+0x122>
        while(*s != 0){
 888:	02800593          	li	a1,40
 88c:	bff1                	j	868 <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 88e:	008b0913          	addi	s2,s6,8
 892:	000b4583          	lbu	a1,0(s6)
 896:	8556                	mv	a0,s5
 898:	00000097          	auipc	ra,0x0
 89c:	d98080e7          	jalr	-616(ra) # 630 <putc>
 8a0:	8b4a                	mv	s6,s2
      state = 0;
 8a2:	4981                	li	s3,0
 8a4:	bd65                	j	75c <vprintf+0x60>
        putc(fd, c);
 8a6:	85d2                	mv	a1,s4
 8a8:	8556                	mv	a0,s5
 8aa:	00000097          	auipc	ra,0x0
 8ae:	d86080e7          	jalr	-634(ra) # 630 <putc>
      state = 0;
 8b2:	4981                	li	s3,0
 8b4:	b565                	j	75c <vprintf+0x60>
        s = va_arg(ap, char*);
 8b6:	8b4e                	mv	s6,s3
      state = 0;
 8b8:	4981                	li	s3,0
 8ba:	b54d                	j	75c <vprintf+0x60>
    }
  }
}
 8bc:	70e6                	ld	ra,120(sp)
 8be:	7446                	ld	s0,112(sp)
 8c0:	74a6                	ld	s1,104(sp)
 8c2:	7906                	ld	s2,96(sp)
 8c4:	69e6                	ld	s3,88(sp)
 8c6:	6a46                	ld	s4,80(sp)
 8c8:	6aa6                	ld	s5,72(sp)
 8ca:	6b06                	ld	s6,64(sp)
 8cc:	7be2                	ld	s7,56(sp)
 8ce:	7c42                	ld	s8,48(sp)
 8d0:	7ca2                	ld	s9,40(sp)
 8d2:	7d02                	ld	s10,32(sp)
 8d4:	6de2                	ld	s11,24(sp)
 8d6:	6109                	addi	sp,sp,128
 8d8:	8082                	ret

00000000000008da <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 8da:	715d                	addi	sp,sp,-80
 8dc:	ec06                	sd	ra,24(sp)
 8de:	e822                	sd	s0,16(sp)
 8e0:	1000                	addi	s0,sp,32
 8e2:	e010                	sd	a2,0(s0)
 8e4:	e414                	sd	a3,8(s0)
 8e6:	e818                	sd	a4,16(s0)
 8e8:	ec1c                	sd	a5,24(s0)
 8ea:	03043023          	sd	a6,32(s0)
 8ee:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 8f2:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 8f6:	8622                	mv	a2,s0
 8f8:	00000097          	auipc	ra,0x0
 8fc:	e04080e7          	jalr	-508(ra) # 6fc <vprintf>
}
 900:	60e2                	ld	ra,24(sp)
 902:	6442                	ld	s0,16(sp)
 904:	6161                	addi	sp,sp,80
 906:	8082                	ret

0000000000000908 <printf>:

void
printf(const char *fmt, ...)
{
 908:	711d                	addi	sp,sp,-96
 90a:	ec06                	sd	ra,24(sp)
 90c:	e822                	sd	s0,16(sp)
 90e:	1000                	addi	s0,sp,32
 910:	e40c                	sd	a1,8(s0)
 912:	e810                	sd	a2,16(s0)
 914:	ec14                	sd	a3,24(s0)
 916:	f018                	sd	a4,32(s0)
 918:	f41c                	sd	a5,40(s0)
 91a:	03043823          	sd	a6,48(s0)
 91e:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 922:	00840613          	addi	a2,s0,8
 926:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 92a:	85aa                	mv	a1,a0
 92c:	4505                	li	a0,1
 92e:	00000097          	auipc	ra,0x0
 932:	dce080e7          	jalr	-562(ra) # 6fc <vprintf>
}
 936:	60e2                	ld	ra,24(sp)
 938:	6442                	ld	s0,16(sp)
 93a:	6125                	addi	sp,sp,96
 93c:	8082                	ret

000000000000093e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 93e:	1141                	addi	sp,sp,-16
 940:	e422                	sd	s0,8(sp)
 942:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 944:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 948:	00000797          	auipc	a5,0x0
 94c:	1c07b783          	ld	a5,448(a5) # b08 <freep>
 950:	a805                	j	980 <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 952:	4618                	lw	a4,8(a2)
 954:	9db9                	addw	a1,a1,a4
 956:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 95a:	6398                	ld	a4,0(a5)
 95c:	6318                	ld	a4,0(a4)
 95e:	fee53823          	sd	a4,-16(a0)
 962:	a091                	j	9a6 <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 964:	ff852703          	lw	a4,-8(a0)
 968:	9e39                	addw	a2,a2,a4
 96a:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 96c:	ff053703          	ld	a4,-16(a0)
 970:	e398                	sd	a4,0(a5)
 972:	a099                	j	9b8 <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 974:	6398                	ld	a4,0(a5)
 976:	00e7e463          	bltu	a5,a4,97e <free+0x40>
 97a:	00e6ea63          	bltu	a3,a4,98e <free+0x50>
{
 97e:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 980:	fed7fae3          	bgeu	a5,a3,974 <free+0x36>
 984:	6398                	ld	a4,0(a5)
 986:	00e6e463          	bltu	a3,a4,98e <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 98a:	fee7eae3          	bltu	a5,a4,97e <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 98e:	ff852583          	lw	a1,-8(a0)
 992:	6390                	ld	a2,0(a5)
 994:	02059713          	slli	a4,a1,0x20
 998:	9301                	srli	a4,a4,0x20
 99a:	0712                	slli	a4,a4,0x4
 99c:	9736                	add	a4,a4,a3
 99e:	fae60ae3          	beq	a2,a4,952 <free+0x14>
    bp->s.ptr = p->s.ptr;
 9a2:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 9a6:	4790                	lw	a2,8(a5)
 9a8:	02061713          	slli	a4,a2,0x20
 9ac:	9301                	srli	a4,a4,0x20
 9ae:	0712                	slli	a4,a4,0x4
 9b0:	973e                	add	a4,a4,a5
 9b2:	fae689e3          	beq	a3,a4,964 <free+0x26>
  } else
    p->s.ptr = bp;
 9b6:	e394                	sd	a3,0(a5)
  freep = p;
 9b8:	00000717          	auipc	a4,0x0
 9bc:	14f73823          	sd	a5,336(a4) # b08 <freep>
}
 9c0:	6422                	ld	s0,8(sp)
 9c2:	0141                	addi	sp,sp,16
 9c4:	8082                	ret

00000000000009c6 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 9c6:	7139                	addi	sp,sp,-64
 9c8:	fc06                	sd	ra,56(sp)
 9ca:	f822                	sd	s0,48(sp)
 9cc:	f426                	sd	s1,40(sp)
 9ce:	f04a                	sd	s2,32(sp)
 9d0:	ec4e                	sd	s3,24(sp)
 9d2:	e852                	sd	s4,16(sp)
 9d4:	e456                	sd	s5,8(sp)
 9d6:	e05a                	sd	s6,0(sp)
 9d8:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9da:	02051493          	slli	s1,a0,0x20
 9de:	9081                	srli	s1,s1,0x20
 9e0:	04bd                	addi	s1,s1,15
 9e2:	8091                	srli	s1,s1,0x4
 9e4:	0014899b          	addiw	s3,s1,1
 9e8:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 9ea:	00000517          	auipc	a0,0x0
 9ee:	11e53503          	ld	a0,286(a0) # b08 <freep>
 9f2:	c515                	beqz	a0,a1e <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9f4:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 9f6:	4798                	lw	a4,8(a5)
 9f8:	02977f63          	bgeu	a4,s1,a36 <malloc+0x70>
 9fc:	8a4e                	mv	s4,s3
 9fe:	0009871b          	sext.w	a4,s3
 a02:	6685                	lui	a3,0x1
 a04:	00d77363          	bgeu	a4,a3,a0a <malloc+0x44>
 a08:	6a05                	lui	s4,0x1
 a0a:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 a0e:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a12:	00000917          	auipc	s2,0x0
 a16:	0f690913          	addi	s2,s2,246 # b08 <freep>
  if(p == (char*)-1)
 a1a:	5afd                	li	s5,-1
 a1c:	a88d                	j	a8e <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 a1e:	00000797          	auipc	a5,0x0
 a22:	4f278793          	addi	a5,a5,1266 # f10 <base>
 a26:	00000717          	auipc	a4,0x0
 a2a:	0ef73123          	sd	a5,226(a4) # b08 <freep>
 a2e:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 a30:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 a34:	b7e1                	j	9fc <malloc+0x36>
      if(p->s.size == nunits)
 a36:	02e48b63          	beq	s1,a4,a6c <malloc+0xa6>
        p->s.size -= nunits;
 a3a:	4137073b          	subw	a4,a4,s3
 a3e:	c798                	sw	a4,8(a5)
        p += p->s.size;
 a40:	1702                	slli	a4,a4,0x20
 a42:	9301                	srli	a4,a4,0x20
 a44:	0712                	slli	a4,a4,0x4
 a46:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 a48:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 a4c:	00000717          	auipc	a4,0x0
 a50:	0aa73e23          	sd	a0,188(a4) # b08 <freep>
      return (void*)(p + 1);
 a54:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a58:	70e2                	ld	ra,56(sp)
 a5a:	7442                	ld	s0,48(sp)
 a5c:	74a2                	ld	s1,40(sp)
 a5e:	7902                	ld	s2,32(sp)
 a60:	69e2                	ld	s3,24(sp)
 a62:	6a42                	ld	s4,16(sp)
 a64:	6aa2                	ld	s5,8(sp)
 a66:	6b02                	ld	s6,0(sp)
 a68:	6121                	addi	sp,sp,64
 a6a:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 a6c:	6398                	ld	a4,0(a5)
 a6e:	e118                	sd	a4,0(a0)
 a70:	bff1                	j	a4c <malloc+0x86>
  hp->s.size = nu;
 a72:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 a76:	0541                	addi	a0,a0,16
 a78:	00000097          	auipc	ra,0x0
 a7c:	ec6080e7          	jalr	-314(ra) # 93e <free>
  return freep;
 a80:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 a84:	d971                	beqz	a0,a58 <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a86:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 a88:	4798                	lw	a4,8(a5)
 a8a:	fa9776e3          	bgeu	a4,s1,a36 <malloc+0x70>
    if(p == freep)
 a8e:	00093703          	ld	a4,0(s2)
 a92:	853e                	mv	a0,a5
 a94:	fef719e3          	bne	a4,a5,a86 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 a98:	8552                	mv	a0,s4
 a9a:	00000097          	auipc	ra,0x0
 a9e:	b3e080e7          	jalr	-1218(ra) # 5d8 <sbrk>
  if(p == (char*)-1)
 aa2:	fd5518e3          	bne	a0,s5,a72 <malloc+0xac>
        return 0;
 aa6:	4501                	li	a0,0
 aa8:	bf45                	j	a58 <malloc+0x92>
