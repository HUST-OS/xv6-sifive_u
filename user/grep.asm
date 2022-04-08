
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
 144:	a70b0b13          	addi	s6,s6,-1424 # bb0 <buf>
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
 262:	8ea58593          	addi	a1,a1,-1814 # b48 <malloc+0xea>
 266:	4509                	li	a0,2
 268:	00000097          	auipc	ra,0x0
 26c:	68a080e7          	jalr	1674(ra) # 8f2 <fprintf>
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
 298:	8d450513          	addi	a0,a0,-1836 # b68 <malloc+0x10a>
 29c:	00000097          	auipc	ra,0x0
 2a0:	6dc080e7          	jalr	1756(ra) # 978 <printf>
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

0000000000000630 <checkchar>:
.global checkchar
checkchar:
 li a7, SYS_checkchar
 630:	48ed                	li	a7,27
 ecall
 632:	00000073          	ecall
 ret
 636:	8082                	ret

0000000000000638 <sprint>:
.global sprint
sprint:
 li a7, SYS_sprint
 638:	48f1                	li	a7,28
 ecall
 63a:	00000073          	ecall
 ret
 63e:	8082                	ret

0000000000000640 <putc>:
static char digits[] = "0123456789ABCDEF";
static char printbuf[100];
static int  len = 0;
static void
putc(int fd, char c)
{
 640:	1141                	addi	sp,sp,-16
 642:	e422                	sd	s0,8(sp)
 644:	0800                	addi	s0,sp,16
  printbuf[len++]=c;
 646:	00000797          	auipc	a5,0x0
 64a:	55a78793          	addi	a5,a5,1370 # ba0 <len>
 64e:	4398                	lw	a4,0(a5)
 650:	0017069b          	addiw	a3,a4,1
 654:	c394                	sw	a3,0(a5)
 656:	00001797          	auipc	a5,0x1
 65a:	95a78793          	addi	a5,a5,-1702 # fb0 <printbuf>
 65e:	97ba                	add	a5,a5,a4
 660:	00b78023          	sb	a1,0(a5)
}
 664:	6422                	ld	s0,8(sp)
 666:	0141                	addi	sp,sp,16
 668:	8082                	ret

000000000000066a <printint>:
	}
}

static void
printint(int fd, int xx, int base, int sgn)
{
 66a:	7139                	addi	sp,sp,-64
 66c:	fc06                	sd	ra,56(sp)
 66e:	f822                	sd	s0,48(sp)
 670:	f426                	sd	s1,40(sp)
 672:	f04a                	sd	s2,32(sp)
 674:	ec4e                	sd	s3,24(sp)
 676:	0080                	addi	s0,sp,64
 678:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 67a:	c299                	beqz	a3,680 <printint+0x16>
 67c:	0805c863          	bltz	a1,70c <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 680:	2581                	sext.w	a1,a1
  neg = 0;
 682:	4881                	li	a7,0
 684:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 688:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 68a:	2601                	sext.w	a2,a2
 68c:	00000517          	auipc	a0,0x0
 690:	4fc50513          	addi	a0,a0,1276 # b88 <digits>
 694:	883a                	mv	a6,a4
 696:	2705                	addiw	a4,a4,1
 698:	02c5f7bb          	remuw	a5,a1,a2
 69c:	1782                	slli	a5,a5,0x20
 69e:	9381                	srli	a5,a5,0x20
 6a0:	97aa                	add	a5,a5,a0
 6a2:	0007c783          	lbu	a5,0(a5)
 6a6:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 6aa:	0005879b          	sext.w	a5,a1
 6ae:	02c5d5bb          	divuw	a1,a1,a2
 6b2:	0685                	addi	a3,a3,1
 6b4:	fec7f0e3          	bgeu	a5,a2,694 <printint+0x2a>
  if(neg)
 6b8:	00088b63          	beqz	a7,6ce <printint+0x64>
    buf[i++] = '-';
 6bc:	fd040793          	addi	a5,s0,-48
 6c0:	973e                	add	a4,a4,a5
 6c2:	02d00793          	li	a5,45
 6c6:	fef70823          	sb	a5,-16(a4)
 6ca:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 6ce:	02e05863          	blez	a4,6fe <printint+0x94>
 6d2:	fc040793          	addi	a5,s0,-64
 6d6:	00e78933          	add	s2,a5,a4
 6da:	fff78993          	addi	s3,a5,-1
 6de:	99ba                	add	s3,s3,a4
 6e0:	377d                	addiw	a4,a4,-1
 6e2:	1702                	slli	a4,a4,0x20
 6e4:	9301                	srli	a4,a4,0x20
 6e6:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 6ea:	fff94583          	lbu	a1,-1(s2)
 6ee:	8526                	mv	a0,s1
 6f0:	00000097          	auipc	ra,0x0
 6f4:	f50080e7          	jalr	-176(ra) # 640 <putc>
  while(--i >= 0)
 6f8:	197d                	addi	s2,s2,-1
 6fa:	ff3918e3          	bne	s2,s3,6ea <printint+0x80>
}
 6fe:	70e2                	ld	ra,56(sp)
 700:	7442                	ld	s0,48(sp)
 702:	74a2                	ld	s1,40(sp)
 704:	7902                	ld	s2,32(sp)
 706:	69e2                	ld	s3,24(sp)
 708:	6121                	addi	sp,sp,64
 70a:	8082                	ret
    x = -xx;
 70c:	40b005bb          	negw	a1,a1
    neg = 1;
 710:	4885                	li	a7,1
    x = -xx;
 712:	bf8d                	j	684 <printint+0x1a>

0000000000000714 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 714:	7119                	addi	sp,sp,-128
 716:	fc86                	sd	ra,120(sp)
 718:	f8a2                	sd	s0,112(sp)
 71a:	f4a6                	sd	s1,104(sp)
 71c:	f0ca                	sd	s2,96(sp)
 71e:	ecce                	sd	s3,88(sp)
 720:	e8d2                	sd	s4,80(sp)
 722:	e4d6                	sd	s5,72(sp)
 724:	e0da                	sd	s6,64(sp)
 726:	fc5e                	sd	s7,56(sp)
 728:	f862                	sd	s8,48(sp)
 72a:	f466                	sd	s9,40(sp)
 72c:	f06a                	sd	s10,32(sp)
 72e:	ec6e                	sd	s11,24(sp)
 730:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 732:	0005c903          	lbu	s2,0(a1)
 736:	18090f63          	beqz	s2,8d4 <vprintf+0x1c0>
 73a:	8aaa                	mv	s5,a0
 73c:	8b32                	mv	s6,a2
 73e:	00158493          	addi	s1,a1,1
  state = 0;
 742:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 744:	02500a13          	li	s4,37
      if(c == 'd'){
 748:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 74c:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 750:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 754:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 758:	00000b97          	auipc	s7,0x0
 75c:	430b8b93          	addi	s7,s7,1072 # b88 <digits>
 760:	a839                	j	77e <vprintf+0x6a>
        putc(fd, c);
 762:	85ca                	mv	a1,s2
 764:	8556                	mv	a0,s5
 766:	00000097          	auipc	ra,0x0
 76a:	eda080e7          	jalr	-294(ra) # 640 <putc>
 76e:	a019                	j	774 <vprintf+0x60>
    } else if(state == '%'){
 770:	01498f63          	beq	s3,s4,78e <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 774:	0485                	addi	s1,s1,1
 776:	fff4c903          	lbu	s2,-1(s1)
 77a:	14090d63          	beqz	s2,8d4 <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 77e:	0009079b          	sext.w	a5,s2
    if(state == 0){
 782:	fe0997e3          	bnez	s3,770 <vprintf+0x5c>
      if(c == '%'){
 786:	fd479ee3          	bne	a5,s4,762 <vprintf+0x4e>
        state = '%';
 78a:	89be                	mv	s3,a5
 78c:	b7e5                	j	774 <vprintf+0x60>
      if(c == 'd'){
 78e:	05878063          	beq	a5,s8,7ce <vprintf+0xba>
      } else if(c == 'l') {
 792:	05978c63          	beq	a5,s9,7ea <vprintf+0xd6>
      } else if(c == 'x') {
 796:	07a78863          	beq	a5,s10,806 <vprintf+0xf2>
      } else if(c == 'p') {
 79a:	09b78463          	beq	a5,s11,822 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 79e:	07300713          	li	a4,115
 7a2:	0ce78663          	beq	a5,a4,86e <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 7a6:	06300713          	li	a4,99
 7aa:	0ee78e63          	beq	a5,a4,8a6 <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 7ae:	11478863          	beq	a5,s4,8be <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 7b2:	85d2                	mv	a1,s4
 7b4:	8556                	mv	a0,s5
 7b6:	00000097          	auipc	ra,0x0
 7ba:	e8a080e7          	jalr	-374(ra) # 640 <putc>
        putc(fd, c);
 7be:	85ca                	mv	a1,s2
 7c0:	8556                	mv	a0,s5
 7c2:	00000097          	auipc	ra,0x0
 7c6:	e7e080e7          	jalr	-386(ra) # 640 <putc>
      }
      state = 0;
 7ca:	4981                	li	s3,0
 7cc:	b765                	j	774 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 7ce:	008b0913          	addi	s2,s6,8
 7d2:	4685                	li	a3,1
 7d4:	4629                	li	a2,10
 7d6:	000b2583          	lw	a1,0(s6)
 7da:	8556                	mv	a0,s5
 7dc:	00000097          	auipc	ra,0x0
 7e0:	e8e080e7          	jalr	-370(ra) # 66a <printint>
 7e4:	8b4a                	mv	s6,s2
      state = 0;
 7e6:	4981                	li	s3,0
 7e8:	b771                	j	774 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 7ea:	008b0913          	addi	s2,s6,8
 7ee:	4681                	li	a3,0
 7f0:	4629                	li	a2,10
 7f2:	000b2583          	lw	a1,0(s6)
 7f6:	8556                	mv	a0,s5
 7f8:	00000097          	auipc	ra,0x0
 7fc:	e72080e7          	jalr	-398(ra) # 66a <printint>
 800:	8b4a                	mv	s6,s2
      state = 0;
 802:	4981                	li	s3,0
 804:	bf85                	j	774 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 806:	008b0913          	addi	s2,s6,8
 80a:	4681                	li	a3,0
 80c:	4641                	li	a2,16
 80e:	000b2583          	lw	a1,0(s6)
 812:	8556                	mv	a0,s5
 814:	00000097          	auipc	ra,0x0
 818:	e56080e7          	jalr	-426(ra) # 66a <printint>
 81c:	8b4a                	mv	s6,s2
      state = 0;
 81e:	4981                	li	s3,0
 820:	bf91                	j	774 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 822:	008b0793          	addi	a5,s6,8
 826:	f8f43423          	sd	a5,-120(s0)
 82a:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 82e:	03000593          	li	a1,48
 832:	8556                	mv	a0,s5
 834:	00000097          	auipc	ra,0x0
 838:	e0c080e7          	jalr	-500(ra) # 640 <putc>
  putc(fd, 'x');
 83c:	85ea                	mv	a1,s10
 83e:	8556                	mv	a0,s5
 840:	00000097          	auipc	ra,0x0
 844:	e00080e7          	jalr	-512(ra) # 640 <putc>
 848:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 84a:	03c9d793          	srli	a5,s3,0x3c
 84e:	97de                	add	a5,a5,s7
 850:	0007c583          	lbu	a1,0(a5)
 854:	8556                	mv	a0,s5
 856:	00000097          	auipc	ra,0x0
 85a:	dea080e7          	jalr	-534(ra) # 640 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 85e:	0992                	slli	s3,s3,0x4
 860:	397d                	addiw	s2,s2,-1
 862:	fe0914e3          	bnez	s2,84a <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 866:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 86a:	4981                	li	s3,0
 86c:	b721                	j	774 <vprintf+0x60>
        s = va_arg(ap, char*);
 86e:	008b0993          	addi	s3,s6,8
 872:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 876:	02090163          	beqz	s2,898 <vprintf+0x184>
        while(*s != 0){
 87a:	00094583          	lbu	a1,0(s2)
 87e:	c9a1                	beqz	a1,8ce <vprintf+0x1ba>
          putc(fd, *s);
 880:	8556                	mv	a0,s5
 882:	00000097          	auipc	ra,0x0
 886:	dbe080e7          	jalr	-578(ra) # 640 <putc>
          s++;
 88a:	0905                	addi	s2,s2,1
        while(*s != 0){
 88c:	00094583          	lbu	a1,0(s2)
 890:	f9e5                	bnez	a1,880 <vprintf+0x16c>
        s = va_arg(ap, char*);
 892:	8b4e                	mv	s6,s3
      state = 0;
 894:	4981                	li	s3,0
 896:	bdf9                	j	774 <vprintf+0x60>
          s = "(null)";
 898:	00000917          	auipc	s2,0x0
 89c:	2e890913          	addi	s2,s2,744 # b80 <malloc+0x122>
        while(*s != 0){
 8a0:	02800593          	li	a1,40
 8a4:	bff1                	j	880 <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 8a6:	008b0913          	addi	s2,s6,8
 8aa:	000b4583          	lbu	a1,0(s6)
 8ae:	8556                	mv	a0,s5
 8b0:	00000097          	auipc	ra,0x0
 8b4:	d90080e7          	jalr	-624(ra) # 640 <putc>
 8b8:	8b4a                	mv	s6,s2
      state = 0;
 8ba:	4981                	li	s3,0
 8bc:	bd65                	j	774 <vprintf+0x60>
        putc(fd, c);
 8be:	85d2                	mv	a1,s4
 8c0:	8556                	mv	a0,s5
 8c2:	00000097          	auipc	ra,0x0
 8c6:	d7e080e7          	jalr	-642(ra) # 640 <putc>
      state = 0;
 8ca:	4981                	li	s3,0
 8cc:	b565                	j	774 <vprintf+0x60>
        s = va_arg(ap, char*);
 8ce:	8b4e                	mv	s6,s3
      state = 0;
 8d0:	4981                	li	s3,0
 8d2:	b54d                	j	774 <vprintf+0x60>
    }
  }
}
 8d4:	70e6                	ld	ra,120(sp)
 8d6:	7446                	ld	s0,112(sp)
 8d8:	74a6                	ld	s1,104(sp)
 8da:	7906                	ld	s2,96(sp)
 8dc:	69e6                	ld	s3,88(sp)
 8de:	6a46                	ld	s4,80(sp)
 8e0:	6aa6                	ld	s5,72(sp)
 8e2:	6b06                	ld	s6,64(sp)
 8e4:	7be2                	ld	s7,56(sp)
 8e6:	7c42                	ld	s8,48(sp)
 8e8:	7ca2                	ld	s9,40(sp)
 8ea:	7d02                	ld	s10,32(sp)
 8ec:	6de2                	ld	s11,24(sp)
 8ee:	6109                	addi	sp,sp,128
 8f0:	8082                	ret

00000000000008f2 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 8f2:	711d                	addi	sp,sp,-96
 8f4:	f406                	sd	ra,40(sp)
 8f6:	f022                	sd	s0,32(sp)
 8f8:	ec26                	sd	s1,24(sp)
 8fa:	e84a                	sd	s2,16(sp)
 8fc:	1800                	addi	s0,sp,48
 8fe:	84aa                	mv	s1,a0
 900:	e010                	sd	a2,0(s0)
 902:	e414                	sd	a3,8(s0)
 904:	e818                	sd	a4,16(s0)
 906:	ec1c                	sd	a5,24(s0)
 908:	03043023          	sd	a6,32(s0)
 90c:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 910:	fc843c23          	sd	s0,-40(s0)
  vprintf(fd, fmt, ap);
 914:	8622                	mv	a2,s0
 916:	00000097          	auipc	ra,0x0
 91a:	dfe080e7          	jalr	-514(ra) # 714 <vprintf>
	if(fd==1){
 91e:	4785                	li	a5,1
 920:	02f48963          	beq	s1,a5,952 <fprintf+0x60>
	  write(fd, printbuf, len);
 924:	00000917          	auipc	s2,0x0
 928:	27c90913          	addi	s2,s2,636 # ba0 <len>
 92c:	00092603          	lw	a2,0(s2)
 930:	00000597          	auipc	a1,0x0
 934:	68058593          	addi	a1,a1,1664 # fb0 <printbuf>
 938:	8526                	mv	a0,s1
 93a:	00000097          	auipc	ra,0x0
 93e:	c4e080e7          	jalr	-946(ra) # 588 <write>
	  len=0;
 942:	00092023          	sw	zero,0(s2)
  fflush(fd);
}
 946:	70a2                	ld	ra,40(sp)
 948:	7402                	ld	s0,32(sp)
 94a:	64e2                	ld	s1,24(sp)
 94c:	6942                	ld	s2,16(sp)
 94e:	6125                	addi	sp,sp,96
 950:	8082                	ret
	  printbuf[len]=0;
 952:	00000517          	auipc	a0,0x0
 956:	65e50513          	addi	a0,a0,1630 # fb0 <printbuf>
 95a:	00000497          	auipc	s1,0x0
 95e:	24648493          	addi	s1,s1,582 # ba0 <len>
 962:	409c                	lw	a5,0(s1)
 964:	97aa                	add	a5,a5,a0
 966:	00078023          	sb	zero,0(a5)
	  sprint(printbuf);
 96a:	00000097          	auipc	ra,0x0
 96e:	cce080e7          	jalr	-818(ra) # 638 <sprint>
	  len=0;
 972:	0004a023          	sw	zero,0(s1)
 976:	bfc1                	j	946 <fprintf+0x54>

0000000000000978 <printf>:

void
printf(const char *fmt, ...)
{
 978:	7159                	addi	sp,sp,-112
 97a:	f406                	sd	ra,40(sp)
 97c:	f022                	sd	s0,32(sp)
 97e:	ec26                	sd	s1,24(sp)
 980:	1800                	addi	s0,sp,48
 982:	e40c                	sd	a1,8(s0)
 984:	e810                	sd	a2,16(s0)
 986:	ec14                	sd	a3,24(s0)
 988:	f018                	sd	a4,32(s0)
 98a:	f41c                	sd	a5,40(s0)
 98c:	03043823          	sd	a6,48(s0)
 990:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 994:	00840613          	addi	a2,s0,8
 998:	fcc43c23          	sd	a2,-40(s0)
  vprintf(1, fmt, ap);
 99c:	85aa                	mv	a1,a0
 99e:	4505                	li	a0,1
 9a0:	00000097          	auipc	ra,0x0
 9a4:	d74080e7          	jalr	-652(ra) # 714 <vprintf>
	  printbuf[len]=0;
 9a8:	00000517          	auipc	a0,0x0
 9ac:	60850513          	addi	a0,a0,1544 # fb0 <printbuf>
 9b0:	00000497          	auipc	s1,0x0
 9b4:	1f048493          	addi	s1,s1,496 # ba0 <len>
 9b8:	409c                	lw	a5,0(s1)
 9ba:	97aa                	add	a5,a5,a0
 9bc:	00078023          	sb	zero,0(a5)
	  sprint(printbuf);
 9c0:	00000097          	auipc	ra,0x0
 9c4:	c78080e7          	jalr	-904(ra) # 638 <sprint>
	  len=0;
 9c8:	0004a023          	sw	zero,0(s1)
  fflush(1);
}
 9cc:	70a2                	ld	ra,40(sp)
 9ce:	7402                	ld	s0,32(sp)
 9d0:	64e2                	ld	s1,24(sp)
 9d2:	6165                	addi	sp,sp,112
 9d4:	8082                	ret

00000000000009d6 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 9d6:	1141                	addi	sp,sp,-16
 9d8:	e422                	sd	s0,8(sp)
 9da:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 9dc:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9e0:	00000797          	auipc	a5,0x0
 9e4:	1c87b783          	ld	a5,456(a5) # ba8 <freep>
 9e8:	a805                	j	a18 <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 9ea:	4618                	lw	a4,8(a2)
 9ec:	9db9                	addw	a1,a1,a4
 9ee:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 9f2:	6398                	ld	a4,0(a5)
 9f4:	6318                	ld	a4,0(a4)
 9f6:	fee53823          	sd	a4,-16(a0)
 9fa:	a091                	j	a3e <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 9fc:	ff852703          	lw	a4,-8(a0)
 a00:	9e39                	addw	a2,a2,a4
 a02:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 a04:	ff053703          	ld	a4,-16(a0)
 a08:	e398                	sd	a4,0(a5)
 a0a:	a099                	j	a50 <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a0c:	6398                	ld	a4,0(a5)
 a0e:	00e7e463          	bltu	a5,a4,a16 <free+0x40>
 a12:	00e6ea63          	bltu	a3,a4,a26 <free+0x50>
{
 a16:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a18:	fed7fae3          	bgeu	a5,a3,a0c <free+0x36>
 a1c:	6398                	ld	a4,0(a5)
 a1e:	00e6e463          	bltu	a3,a4,a26 <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a22:	fee7eae3          	bltu	a5,a4,a16 <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 a26:	ff852583          	lw	a1,-8(a0)
 a2a:	6390                	ld	a2,0(a5)
 a2c:	02059713          	slli	a4,a1,0x20
 a30:	9301                	srli	a4,a4,0x20
 a32:	0712                	slli	a4,a4,0x4
 a34:	9736                	add	a4,a4,a3
 a36:	fae60ae3          	beq	a2,a4,9ea <free+0x14>
    bp->s.ptr = p->s.ptr;
 a3a:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 a3e:	4790                	lw	a2,8(a5)
 a40:	02061713          	slli	a4,a2,0x20
 a44:	9301                	srli	a4,a4,0x20
 a46:	0712                	slli	a4,a4,0x4
 a48:	973e                	add	a4,a4,a5
 a4a:	fae689e3          	beq	a3,a4,9fc <free+0x26>
  } else
    p->s.ptr = bp;
 a4e:	e394                	sd	a3,0(a5)
  freep = p;
 a50:	00000717          	auipc	a4,0x0
 a54:	14f73c23          	sd	a5,344(a4) # ba8 <freep>
}
 a58:	6422                	ld	s0,8(sp)
 a5a:	0141                	addi	sp,sp,16
 a5c:	8082                	ret

0000000000000a5e <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a5e:	7139                	addi	sp,sp,-64
 a60:	fc06                	sd	ra,56(sp)
 a62:	f822                	sd	s0,48(sp)
 a64:	f426                	sd	s1,40(sp)
 a66:	f04a                	sd	s2,32(sp)
 a68:	ec4e                	sd	s3,24(sp)
 a6a:	e852                	sd	s4,16(sp)
 a6c:	e456                	sd	s5,8(sp)
 a6e:	e05a                	sd	s6,0(sp)
 a70:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a72:	02051493          	slli	s1,a0,0x20
 a76:	9081                	srli	s1,s1,0x20
 a78:	04bd                	addi	s1,s1,15
 a7a:	8091                	srli	s1,s1,0x4
 a7c:	0014899b          	addiw	s3,s1,1
 a80:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 a82:	00000517          	auipc	a0,0x0
 a86:	12653503          	ld	a0,294(a0) # ba8 <freep>
 a8a:	c515                	beqz	a0,ab6 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a8c:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 a8e:	4798                	lw	a4,8(a5)
 a90:	02977f63          	bgeu	a4,s1,ace <malloc+0x70>
 a94:	8a4e                	mv	s4,s3
 a96:	0009871b          	sext.w	a4,s3
 a9a:	6685                	lui	a3,0x1
 a9c:	00d77363          	bgeu	a4,a3,aa2 <malloc+0x44>
 aa0:	6a05                	lui	s4,0x1
 aa2:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 aa6:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 aaa:	00000917          	auipc	s2,0x0
 aae:	0fe90913          	addi	s2,s2,254 # ba8 <freep>
  if(p == (char*)-1)
 ab2:	5afd                	li	s5,-1
 ab4:	a88d                	j	b26 <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 ab6:	00000797          	auipc	a5,0x0
 aba:	56278793          	addi	a5,a5,1378 # 1018 <base>
 abe:	00000717          	auipc	a4,0x0
 ac2:	0ef73523          	sd	a5,234(a4) # ba8 <freep>
 ac6:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 ac8:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 acc:	b7e1                	j	a94 <malloc+0x36>
      if(p->s.size == nunits)
 ace:	02e48b63          	beq	s1,a4,b04 <malloc+0xa6>
        p->s.size -= nunits;
 ad2:	4137073b          	subw	a4,a4,s3
 ad6:	c798                	sw	a4,8(a5)
        p += p->s.size;
 ad8:	1702                	slli	a4,a4,0x20
 ada:	9301                	srli	a4,a4,0x20
 adc:	0712                	slli	a4,a4,0x4
 ade:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 ae0:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 ae4:	00000717          	auipc	a4,0x0
 ae8:	0ca73223          	sd	a0,196(a4) # ba8 <freep>
      return (void*)(p + 1);
 aec:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 af0:	70e2                	ld	ra,56(sp)
 af2:	7442                	ld	s0,48(sp)
 af4:	74a2                	ld	s1,40(sp)
 af6:	7902                	ld	s2,32(sp)
 af8:	69e2                	ld	s3,24(sp)
 afa:	6a42                	ld	s4,16(sp)
 afc:	6aa2                	ld	s5,8(sp)
 afe:	6b02                	ld	s6,0(sp)
 b00:	6121                	addi	sp,sp,64
 b02:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 b04:	6398                	ld	a4,0(a5)
 b06:	e118                	sd	a4,0(a0)
 b08:	bff1                	j	ae4 <malloc+0x86>
  hp->s.size = nu;
 b0a:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 b0e:	0541                	addi	a0,a0,16
 b10:	00000097          	auipc	ra,0x0
 b14:	ec6080e7          	jalr	-314(ra) # 9d6 <free>
  return freep;
 b18:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 b1c:	d971                	beqz	a0,af0 <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b1e:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 b20:	4798                	lw	a4,8(a5)
 b22:	fa9776e3          	bgeu	a4,s1,ace <malloc+0x70>
    if(p == freep)
 b26:	00093703          	ld	a4,0(s2)
 b2a:	853e                	mv	a0,a5
 b2c:	fef719e3          	bne	a4,a5,b1e <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 b30:	8552                	mv	a0,s4
 b32:	00000097          	auipc	ra,0x0
 b36:	aa6080e7          	jalr	-1370(ra) # 5d8 <sbrk>
  if(p == (char*)-1)
 b3a:	fd5518e3          	bne	a0,s5,b0a <malloc+0xac>
        return 0;
 b3e:	4501                	li	a0,0
 b40:	bf45                	j	af0 <malloc+0x92>
