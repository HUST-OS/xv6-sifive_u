
user/_mv:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/include/fcntl.h"
#include "kernel/include/param.h"
#include "xv6-user/user.h"

int main(int argc, char *argv[])
{
   0:	d9010113          	addi	sp,sp,-624
   4:	26113423          	sd	ra,616(sp)
   8:	26813023          	sd	s0,608(sp)
   c:	24913c23          	sd	s1,600(sp)
  10:	1c80                	addi	s0,sp,624
    if (argc < 3) {
  12:	4789                	li	a5,2
  14:	02a7c063          	blt	a5,a0,34 <main+0x34>
        fprintf(2, "Usage: mv old_name new_name\n");
  18:	00001597          	auipc	a1,0x1
  1c:	a3058593          	addi	a1,a1,-1488 # a48 <malloc+0xea>
  20:	4509                	li	a0,2
  22:	00000097          	auipc	ra,0x0
  26:	7d0080e7          	jalr	2000(ra) # 7f2 <fprintf>
        exit(1);
  2a:	4505                	li	a0,1
  2c:	00000097          	auipc	ra,0x0
  30:	43c080e7          	jalr	1084(ra) # 468 <exit>
  34:	84ae                	mv	s1,a1
    }

    char src[MAXPATH];
    char dst[MAXPATH];
    strcpy(src, argv[1]);
  36:	658c                	ld	a1,8(a1)
  38:	ed840513          	addi	a0,s0,-296
  3c:	00000097          	auipc	ra,0x0
  40:	172080e7          	jalr	370(ra) # 1ae <strcpy>
    strcpy(dst, argv[2]);
  44:	688c                	ld	a1,16(s1)
  46:	dd040513          	addi	a0,s0,-560
  4a:	00000097          	auipc	ra,0x0
  4e:	164080e7          	jalr	356(ra) # 1ae <strcpy>
    int fd = open(dst, O_RDONLY);
  52:	4581                	li	a1,0
  54:	dd040513          	addi	a0,s0,-560
  58:	00000097          	auipc	ra,0x0
  5c:	450080e7          	jalr	1104(ra) # 4a8 <open>
  60:	84aa                	mv	s1,a0
    if (fd >= 0) {
  62:	0e054963          	bltz	a0,154 <main+0x154>
        struct stat st;
        fstat(fd, &st);
  66:	d9840593          	addi	a1,s0,-616
  6a:	00000097          	auipc	ra,0x0
  6e:	446080e7          	jalr	1094(ra) # 4b0 <fstat>
        close(fd);
  72:	8526                	mv	a0,s1
  74:	00000097          	auipc	ra,0x0
  78:	41c080e7          	jalr	1052(ra) # 490 <close>
        if (st.type == T_DIR) {
  7c:	dc041703          	lh	a4,-576(s0)
  80:	4785                	li	a5,1
  82:	02f70263          	beq	a4,a5,a6 <main+0xa6>
                    fprintf(2, "mv: fail! final dst path too long (exceed MAX=%d)!\n", MAXPATH);
                    exit(-1);
                }
            }
        } else {
            fprintf(2, "mv: fail! %s exists!\n", dst);
  86:	dd040613          	addi	a2,s0,-560
  8a:	00001597          	auipc	a1,0x1
  8e:	a1658593          	addi	a1,a1,-1514 # aa0 <malloc+0x142>
  92:	4509                	li	a0,2
  94:	00000097          	auipc	ra,0x0
  98:	75e080e7          	jalr	1886(ra) # 7f2 <fprintf>
            exit(-1);
  9c:	557d                	li	a0,-1
  9e:	00000097          	auipc	ra,0x0
  a2:	3ca080e7          	jalr	970(ra) # 468 <exit>
            for (ps = src + strlen(src) - 1; ps >= src; ps--) { // trim '/' in tail
  a6:	ed840493          	addi	s1,s0,-296
  aa:	8526                	mv	a0,s1
  ac:	00000097          	auipc	ra,0x0
  b0:	178080e7          	jalr	376(ra) # 224 <strlen>
  b4:	02051793          	slli	a5,a0,0x20
  b8:	9381                	srli	a5,a5,0x20
  ba:	17fd                	addi	a5,a5,-1
  bc:	97a6                	add	a5,a5,s1
  be:	0097ec63          	bltu	a5,s1,d6 <main+0xd6>
                if (*ps != '/') {
  c2:	02f00693          	li	a3,47
            for (ps = src + strlen(src) - 1; ps >= src; ps--) { // trim '/' in tail
  c6:	8626                	mv	a2,s1
                if (*ps != '/') {
  c8:	0007c703          	lbu	a4,0(a5)
  cc:	06d71363          	bne	a4,a3,132 <main+0x132>
            for (ps = src + strlen(src) - 1; ps >= src; ps--) { // trim '/' in tail
  d0:	17fd                	addi	a5,a5,-1
  d2:	fec7fbe3          	bgeu	a5,a2,c8 <main+0xc8>
            ps++;
  d6:	00178493          	addi	s1,a5,1
            pd = dst + strlen(dst);
  da:	dd040513          	addi	a0,s0,-560
  de:	00000097          	auipc	ra,0x0
  e2:	146080e7          	jalr	326(ra) # 224 <strlen>
  e6:	1502                	slli	a0,a0,0x20
  e8:	9101                	srli	a0,a0,0x20
  ea:	dd040793          	addi	a5,s0,-560
  ee:	953e                	add	a0,a0,a5
            *pd++ = '/';
  f0:	00150793          	addi	a5,a0,1
  f4:	02f00713          	li	a4,47
  f8:	00e50023          	sb	a4,0(a0)
                if (pd >= dst + MAXPATH) {
  fc:	ed440693          	addi	a3,s0,-300
            while (*ps) {
 100:	0004c703          	lbu	a4,0(s1)
 104:	cb21                	beqz	a4,154 <main+0x154>
                *pd++ = *ps++;
 106:	0485                	addi	s1,s1,1
 108:	0785                	addi	a5,a5,1
 10a:	fee78fa3          	sb	a4,-1(a5)
                if (pd >= dst + MAXPATH) {
 10e:	fed7e9e3          	bltu	a5,a3,100 <main+0x100>
                    fprintf(2, "mv: fail! final dst path too long (exceed MAX=%d)!\n", MAXPATH);
 112:	10400613          	li	a2,260
 116:	00001597          	auipc	a1,0x1
 11a:	95258593          	addi	a1,a1,-1710 # a68 <malloc+0x10a>
 11e:	4509                	li	a0,2
 120:	00000097          	auipc	ra,0x0
 124:	6d2080e7          	jalr	1746(ra) # 7f2 <fprintf>
                    exit(-1);
 128:	557d                	li	a0,-1
 12a:	00000097          	auipc	ra,0x0
 12e:	33e080e7          	jalr	830(ra) # 468 <exit>
                    *(ps + 1) = '\0';
 132:	000780a3          	sb	zero,1(a5)
            for (; ps >= src && *ps != '/'; ps--);
 136:	ed840713          	addi	a4,s0,-296
 13a:	02f00693          	li	a3,47
 13e:	863a                	mv	a2,a4
 140:	f8e7ebe3          	bltu	a5,a4,d6 <main+0xd6>
 144:	0007c703          	lbu	a4,0(a5)
 148:	f8d707e3          	beq	a4,a3,d6 <main+0xd6>
 14c:	17fd                	addi	a5,a5,-1
 14e:	fec7fbe3          	bgeu	a5,a2,144 <main+0x144>
 152:	b751                	j	d6 <main+0xd6>
        }
    }
    printf("moving [%s] to [%s]\n", src, dst);
 154:	dd040613          	addi	a2,s0,-560
 158:	ed840593          	addi	a1,s0,-296
 15c:	00001517          	auipc	a0,0x1
 160:	95c50513          	addi	a0,a0,-1700 # ab8 <malloc+0x15a>
 164:	00000097          	auipc	ra,0x0
 168:	714080e7          	jalr	1812(ra) # 878 <printf>
    if (rename(src, dst) < 0) {
 16c:	dd040593          	addi	a1,s0,-560
 170:	ed840513          	addi	a0,s0,-296
 174:	00000097          	auipc	ra,0x0
 178:	3b4080e7          	jalr	948(ra) # 528 <rename>
 17c:	00054763          	bltz	a0,18a <main+0x18a>
        fprintf(2, "mv: fail to rename %s to %s!\n", src, dst);
        exit(-1);
    }
    exit(0);
 180:	4501                	li	a0,0
 182:	00000097          	auipc	ra,0x0
 186:	2e6080e7          	jalr	742(ra) # 468 <exit>
        fprintf(2, "mv: fail to rename %s to %s!\n", src, dst);
 18a:	dd040693          	addi	a3,s0,-560
 18e:	ed840613          	addi	a2,s0,-296
 192:	00001597          	auipc	a1,0x1
 196:	93e58593          	addi	a1,a1,-1730 # ad0 <malloc+0x172>
 19a:	4509                	li	a0,2
 19c:	00000097          	auipc	ra,0x0
 1a0:	656080e7          	jalr	1622(ra) # 7f2 <fprintf>
        exit(-1);
 1a4:	557d                	li	a0,-1
 1a6:	00000097          	auipc	ra,0x0
 1aa:	2c2080e7          	jalr	706(ra) # 468 <exit>

00000000000001ae <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
 1ae:	1141                	addi	sp,sp,-16
 1b0:	e422                	sd	s0,8(sp)
 1b2:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1b4:	87aa                	mv	a5,a0
 1b6:	0585                	addi	a1,a1,1
 1b8:	0785                	addi	a5,a5,1
 1ba:	fff5c703          	lbu	a4,-1(a1)
 1be:	fee78fa3          	sb	a4,-1(a5)
 1c2:	fb75                	bnez	a4,1b6 <strcpy+0x8>
    ;
  return os;
}
 1c4:	6422                	ld	s0,8(sp)
 1c6:	0141                	addi	sp,sp,16
 1c8:	8082                	ret

00000000000001ca <strcat>:

char*
strcat(char *s, const char *t)
{
 1ca:	1141                	addi	sp,sp,-16
 1cc:	e422                	sd	s0,8(sp)
 1ce:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
 1d0:	00054783          	lbu	a5,0(a0)
 1d4:	c385                	beqz	a5,1f4 <strcat+0x2a>
 1d6:	87aa                	mv	a5,a0
    s++;
 1d8:	0785                	addi	a5,a5,1
  while(*s)
 1da:	0007c703          	lbu	a4,0(a5)
 1de:	ff6d                	bnez	a4,1d8 <strcat+0xe>
  while((*s++ = *t++))
 1e0:	0585                	addi	a1,a1,1
 1e2:	0785                	addi	a5,a5,1
 1e4:	fff5c703          	lbu	a4,-1(a1)
 1e8:	fee78fa3          	sb	a4,-1(a5)
 1ec:	fb75                	bnez	a4,1e0 <strcat+0x16>
    ;
  return os;
}
 1ee:	6422                	ld	s0,8(sp)
 1f0:	0141                	addi	sp,sp,16
 1f2:	8082                	ret
  while(*s)
 1f4:	87aa                	mv	a5,a0
 1f6:	b7ed                	j	1e0 <strcat+0x16>

00000000000001f8 <strcmp>:


int
strcmp(const char *p, const char *q)
{
 1f8:	1141                	addi	sp,sp,-16
 1fa:	e422                	sd	s0,8(sp)
 1fc:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 1fe:	00054783          	lbu	a5,0(a0)
 202:	cb91                	beqz	a5,216 <strcmp+0x1e>
 204:	0005c703          	lbu	a4,0(a1)
 208:	00f71763          	bne	a4,a5,216 <strcmp+0x1e>
    p++, q++;
 20c:	0505                	addi	a0,a0,1
 20e:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 210:	00054783          	lbu	a5,0(a0)
 214:	fbe5                	bnez	a5,204 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 216:	0005c503          	lbu	a0,0(a1)
}
 21a:	40a7853b          	subw	a0,a5,a0
 21e:	6422                	ld	s0,8(sp)
 220:	0141                	addi	sp,sp,16
 222:	8082                	ret

0000000000000224 <strlen>:

uint
strlen(const char *s)
{
 224:	1141                	addi	sp,sp,-16
 226:	e422                	sd	s0,8(sp)
 228:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 22a:	00054783          	lbu	a5,0(a0)
 22e:	cf91                	beqz	a5,24a <strlen+0x26>
 230:	0505                	addi	a0,a0,1
 232:	87aa                	mv	a5,a0
 234:	4685                	li	a3,1
 236:	9e89                	subw	a3,a3,a0
 238:	00f6853b          	addw	a0,a3,a5
 23c:	0785                	addi	a5,a5,1
 23e:	fff7c703          	lbu	a4,-1(a5)
 242:	fb7d                	bnez	a4,238 <strlen+0x14>
    ;
  return n;
}
 244:	6422                	ld	s0,8(sp)
 246:	0141                	addi	sp,sp,16
 248:	8082                	ret
  for(n = 0; s[n]; n++)
 24a:	4501                	li	a0,0
 24c:	bfe5                	j	244 <strlen+0x20>

000000000000024e <memset>:

void*
memset(void *dst, int c, uint n)
{
 24e:	1141                	addi	sp,sp,-16
 250:	e422                	sd	s0,8(sp)
 252:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 254:	ce09                	beqz	a2,26e <memset+0x20>
 256:	87aa                	mv	a5,a0
 258:	fff6071b          	addiw	a4,a2,-1
 25c:	1702                	slli	a4,a4,0x20
 25e:	9301                	srli	a4,a4,0x20
 260:	0705                	addi	a4,a4,1
 262:	972a                	add	a4,a4,a0
    cdst[i] = c;
 264:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 268:	0785                	addi	a5,a5,1
 26a:	fee79de3          	bne	a5,a4,264 <memset+0x16>
  }
  return dst;
}
 26e:	6422                	ld	s0,8(sp)
 270:	0141                	addi	sp,sp,16
 272:	8082                	ret

0000000000000274 <strchr>:

char*
strchr(const char *s, char c)
{
 274:	1141                	addi	sp,sp,-16
 276:	e422                	sd	s0,8(sp)
 278:	0800                	addi	s0,sp,16
  for(; *s; s++)
 27a:	00054783          	lbu	a5,0(a0)
 27e:	cb99                	beqz	a5,294 <strchr+0x20>
    if(*s == c)
 280:	00f58763          	beq	a1,a5,28e <strchr+0x1a>
  for(; *s; s++)
 284:	0505                	addi	a0,a0,1
 286:	00054783          	lbu	a5,0(a0)
 28a:	fbfd                	bnez	a5,280 <strchr+0xc>
      return (char*)s;
  return 0;
 28c:	4501                	li	a0,0
}
 28e:	6422                	ld	s0,8(sp)
 290:	0141                	addi	sp,sp,16
 292:	8082                	ret
  return 0;
 294:	4501                	li	a0,0
 296:	bfe5                	j	28e <strchr+0x1a>

0000000000000298 <gets>:

char*
gets(char *buf, int max)
{
 298:	711d                	addi	sp,sp,-96
 29a:	ec86                	sd	ra,88(sp)
 29c:	e8a2                	sd	s0,80(sp)
 29e:	e4a6                	sd	s1,72(sp)
 2a0:	e0ca                	sd	s2,64(sp)
 2a2:	fc4e                	sd	s3,56(sp)
 2a4:	f852                	sd	s4,48(sp)
 2a6:	f456                	sd	s5,40(sp)
 2a8:	f05a                	sd	s6,32(sp)
 2aa:	ec5e                	sd	s7,24(sp)
 2ac:	1080                	addi	s0,sp,96
 2ae:	8baa                	mv	s7,a0
 2b0:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2b2:	892a                	mv	s2,a0
 2b4:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 2b6:	4aa9                	li	s5,10
 2b8:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 2ba:	89a6                	mv	s3,s1
 2bc:	2485                	addiw	s1,s1,1
 2be:	0344d863          	bge	s1,s4,2ee <gets+0x56>
    cc = read(0, &c, 1);
 2c2:	4605                	li	a2,1
 2c4:	faf40593          	addi	a1,s0,-81
 2c8:	4501                	li	a0,0
 2ca:	00000097          	auipc	ra,0x0
 2ce:	1b6080e7          	jalr	438(ra) # 480 <read>
    if(cc < 1)
 2d2:	00a05e63          	blez	a0,2ee <gets+0x56>
    buf[i++] = c;
 2d6:	faf44783          	lbu	a5,-81(s0)
 2da:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 2de:	01578763          	beq	a5,s5,2ec <gets+0x54>
 2e2:	0905                	addi	s2,s2,1
 2e4:	fd679be3          	bne	a5,s6,2ba <gets+0x22>
  for(i=0; i+1 < max; ){
 2e8:	89a6                	mv	s3,s1
 2ea:	a011                	j	2ee <gets+0x56>
 2ec:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 2ee:	99de                	add	s3,s3,s7
 2f0:	00098023          	sb	zero,0(s3)
  return buf;
}
 2f4:	855e                	mv	a0,s7
 2f6:	60e6                	ld	ra,88(sp)
 2f8:	6446                	ld	s0,80(sp)
 2fa:	64a6                	ld	s1,72(sp)
 2fc:	6906                	ld	s2,64(sp)
 2fe:	79e2                	ld	s3,56(sp)
 300:	7a42                	ld	s4,48(sp)
 302:	7aa2                	ld	s5,40(sp)
 304:	7b02                	ld	s6,32(sp)
 306:	6be2                	ld	s7,24(sp)
 308:	6125                	addi	sp,sp,96
 30a:	8082                	ret

000000000000030c <stat>:

int
stat(const char *n, struct stat *st)
{
 30c:	1101                	addi	sp,sp,-32
 30e:	ec06                	sd	ra,24(sp)
 310:	e822                	sd	s0,16(sp)
 312:	e426                	sd	s1,8(sp)
 314:	e04a                	sd	s2,0(sp)
 316:	1000                	addi	s0,sp,32
 318:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 31a:	4581                	li	a1,0
 31c:	00000097          	auipc	ra,0x0
 320:	18c080e7          	jalr	396(ra) # 4a8 <open>
  if(fd < 0)
 324:	02054563          	bltz	a0,34e <stat+0x42>
 328:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 32a:	85ca                	mv	a1,s2
 32c:	00000097          	auipc	ra,0x0
 330:	184080e7          	jalr	388(ra) # 4b0 <fstat>
 334:	892a                	mv	s2,a0
  close(fd);
 336:	8526                	mv	a0,s1
 338:	00000097          	auipc	ra,0x0
 33c:	158080e7          	jalr	344(ra) # 490 <close>
  return r;
}
 340:	854a                	mv	a0,s2
 342:	60e2                	ld	ra,24(sp)
 344:	6442                	ld	s0,16(sp)
 346:	64a2                	ld	s1,8(sp)
 348:	6902                	ld	s2,0(sp)
 34a:	6105                	addi	sp,sp,32
 34c:	8082                	ret
    return -1;
 34e:	597d                	li	s2,-1
 350:	bfc5                	j	340 <stat+0x34>

0000000000000352 <atoi>:

int
atoi(const char *s)
{
 352:	1141                	addi	sp,sp,-16
 354:	e422                	sd	s0,8(sp)
 356:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 358:	00054703          	lbu	a4,0(a0)
 35c:	02d00793          	li	a5,45
  int neg = 1;
 360:	4805                	li	a6,1
  if (*s == '-') {
 362:	04f70363          	beq	a4,a5,3a8 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 366:	00054683          	lbu	a3,0(a0)
 36a:	fd06879b          	addiw	a5,a3,-48
 36e:	0ff7f793          	andi	a5,a5,255
 372:	4725                	li	a4,9
 374:	02f76d63          	bltu	a4,a5,3ae <atoi+0x5c>
  n = 0;
 378:	4601                	li	a2,0
  while('0' <= *s && *s <= '9')
 37a:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 37c:	0505                	addi	a0,a0,1
 37e:	0026179b          	slliw	a5,a2,0x2
 382:	9fb1                	addw	a5,a5,a2
 384:	0017979b          	slliw	a5,a5,0x1
 388:	9fb5                	addw	a5,a5,a3
 38a:	fd07861b          	addiw	a2,a5,-48
  while('0' <= *s && *s <= '9')
 38e:	00054683          	lbu	a3,0(a0)
 392:	fd06871b          	addiw	a4,a3,-48
 396:	0ff77713          	andi	a4,a4,255
 39a:	fee5f1e3          	bgeu	a1,a4,37c <atoi+0x2a>
  return n * neg;
}
 39e:	02c8053b          	mulw	a0,a6,a2
 3a2:	6422                	ld	s0,8(sp)
 3a4:	0141                	addi	sp,sp,16
 3a6:	8082                	ret
    s++;
 3a8:	0505                	addi	a0,a0,1
    neg = -1;
 3aa:	587d                	li	a6,-1
 3ac:	bf6d                	j	366 <atoi+0x14>
  n = 0;
 3ae:	4601                	li	a2,0
 3b0:	b7fd                	j	39e <atoi+0x4c>

00000000000003b2 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3b2:	1141                	addi	sp,sp,-16
 3b4:	e422                	sd	s0,8(sp)
 3b6:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 3b8:	02b57663          	bgeu	a0,a1,3e4 <memmove+0x32>
    while(n-- > 0)
 3bc:	02c05163          	blez	a2,3de <memmove+0x2c>
 3c0:	fff6079b          	addiw	a5,a2,-1
 3c4:	1782                	slli	a5,a5,0x20
 3c6:	9381                	srli	a5,a5,0x20
 3c8:	0785                	addi	a5,a5,1
 3ca:	97aa                	add	a5,a5,a0
  dst = vdst;
 3cc:	872a                	mv	a4,a0
      *dst++ = *src++;
 3ce:	0585                	addi	a1,a1,1
 3d0:	0705                	addi	a4,a4,1
 3d2:	fff5c683          	lbu	a3,-1(a1)
 3d6:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 3da:	fee79ae3          	bne	a5,a4,3ce <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 3de:	6422                	ld	s0,8(sp)
 3e0:	0141                	addi	sp,sp,16
 3e2:	8082                	ret
    dst += n;
 3e4:	00c50733          	add	a4,a0,a2
    src += n;
 3e8:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 3ea:	fec05ae3          	blez	a2,3de <memmove+0x2c>
 3ee:	fff6079b          	addiw	a5,a2,-1
 3f2:	1782                	slli	a5,a5,0x20
 3f4:	9381                	srli	a5,a5,0x20
 3f6:	fff7c793          	not	a5,a5
 3fa:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 3fc:	15fd                	addi	a1,a1,-1
 3fe:	177d                	addi	a4,a4,-1
 400:	0005c683          	lbu	a3,0(a1)
 404:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 408:	fee79ae3          	bne	a5,a4,3fc <memmove+0x4a>
 40c:	bfc9                	j	3de <memmove+0x2c>

000000000000040e <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 40e:	1141                	addi	sp,sp,-16
 410:	e422                	sd	s0,8(sp)
 412:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 414:	ca05                	beqz	a2,444 <memcmp+0x36>
 416:	fff6069b          	addiw	a3,a2,-1
 41a:	1682                	slli	a3,a3,0x20
 41c:	9281                	srli	a3,a3,0x20
 41e:	0685                	addi	a3,a3,1
 420:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 422:	00054783          	lbu	a5,0(a0)
 426:	0005c703          	lbu	a4,0(a1)
 42a:	00e79863          	bne	a5,a4,43a <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 42e:	0505                	addi	a0,a0,1
    p2++;
 430:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 432:	fed518e3          	bne	a0,a3,422 <memcmp+0x14>
  }
  return 0;
 436:	4501                	li	a0,0
 438:	a019                	j	43e <memcmp+0x30>
      return *p1 - *p2;
 43a:	40e7853b          	subw	a0,a5,a4
}
 43e:	6422                	ld	s0,8(sp)
 440:	0141                	addi	sp,sp,16
 442:	8082                	ret
  return 0;
 444:	4501                	li	a0,0
 446:	bfe5                	j	43e <memcmp+0x30>

0000000000000448 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 448:	1141                	addi	sp,sp,-16
 44a:	e406                	sd	ra,8(sp)
 44c:	e022                	sd	s0,0(sp)
 44e:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 450:	00000097          	auipc	ra,0x0
 454:	f62080e7          	jalr	-158(ra) # 3b2 <memmove>
}
 458:	60a2                	ld	ra,8(sp)
 45a:	6402                	ld	s0,0(sp)
 45c:	0141                	addi	sp,sp,16
 45e:	8082                	ret

0000000000000460 <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 460:	4885                	li	a7,1
 ecall
 462:	00000073          	ecall
 ret
 466:	8082                	ret

0000000000000468 <exit>:
.global exit
exit:
 li a7, SYS_exit
 468:	4889                	li	a7,2
 ecall
 46a:	00000073          	ecall
 ret
 46e:	8082                	ret

0000000000000470 <wait>:
.global wait
wait:
 li a7, SYS_wait
 470:	488d                	li	a7,3
 ecall
 472:	00000073          	ecall
 ret
 476:	8082                	ret

0000000000000478 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 478:	4891                	li	a7,4
 ecall
 47a:	00000073          	ecall
 ret
 47e:	8082                	ret

0000000000000480 <read>:
.global read
read:
 li a7, SYS_read
 480:	4895                	li	a7,5
 ecall
 482:	00000073          	ecall
 ret
 486:	8082                	ret

0000000000000488 <write>:
.global write
write:
 li a7, SYS_write
 488:	48c1                	li	a7,16
 ecall
 48a:	00000073          	ecall
 ret
 48e:	8082                	ret

0000000000000490 <close>:
.global close
close:
 li a7, SYS_close
 490:	48d5                	li	a7,21
 ecall
 492:	00000073          	ecall
 ret
 496:	8082                	ret

0000000000000498 <kill>:
.global kill
kill:
 li a7, SYS_kill
 498:	4899                	li	a7,6
 ecall
 49a:	00000073          	ecall
 ret
 49e:	8082                	ret

00000000000004a0 <exec>:
.global exec
exec:
 li a7, SYS_exec
 4a0:	489d                	li	a7,7
 ecall
 4a2:	00000073          	ecall
 ret
 4a6:	8082                	ret

00000000000004a8 <open>:
.global open
open:
 li a7, SYS_open
 4a8:	48bd                	li	a7,15
 ecall
 4aa:	00000073          	ecall
 ret
 4ae:	8082                	ret

00000000000004b0 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 4b0:	48a1                	li	a7,8
 ecall
 4b2:	00000073          	ecall
 ret
 4b6:	8082                	ret

00000000000004b8 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 4b8:	48d1                	li	a7,20
 ecall
 4ba:	00000073          	ecall
 ret
 4be:	8082                	ret

00000000000004c0 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 4c0:	48a5                	li	a7,9
 ecall
 4c2:	00000073          	ecall
 ret
 4c6:	8082                	ret

00000000000004c8 <dup>:
.global dup
dup:
 li a7, SYS_dup
 4c8:	48a9                	li	a7,10
 ecall
 4ca:	00000073          	ecall
 ret
 4ce:	8082                	ret

00000000000004d0 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 4d0:	48ad                	li	a7,11
 ecall
 4d2:	00000073          	ecall
 ret
 4d6:	8082                	ret

00000000000004d8 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 4d8:	48b1                	li	a7,12
 ecall
 4da:	00000073          	ecall
 ret
 4de:	8082                	ret

00000000000004e0 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 4e0:	48b5                	li	a7,13
 ecall
 4e2:	00000073          	ecall
 ret
 4e6:	8082                	ret

00000000000004e8 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 4e8:	48b9                	li	a7,14
 ecall
 4ea:	00000073          	ecall
 ret
 4ee:	8082                	ret

00000000000004f0 <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 4f0:	48d9                	li	a7,22
 ecall
 4f2:	00000073          	ecall
 ret
 4f6:	8082                	ret

00000000000004f8 <dev>:
.global dev
dev:
 li a7, SYS_dev
 4f8:	48dd                	li	a7,23
 ecall
 4fa:	00000073          	ecall
 ret
 4fe:	8082                	ret

0000000000000500 <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 500:	48e1                	li	a7,24
 ecall
 502:	00000073          	ecall
 ret
 506:	8082                	ret

0000000000000508 <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 508:	48e5                	li	a7,25
 ecall
 50a:	00000073          	ecall
 ret
 50e:	8082                	ret

0000000000000510 <remove>:
.global remove
remove:
 li a7, SYS_remove
 510:	48c5                	li	a7,17
 ecall
 512:	00000073          	ecall
 ret
 516:	8082                	ret

0000000000000518 <trace>:
.global trace
trace:
 li a7, SYS_trace
 518:	48c9                	li	a7,18
 ecall
 51a:	00000073          	ecall
 ret
 51e:	8082                	ret

0000000000000520 <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 520:	48cd                	li	a7,19
 ecall
 522:	00000073          	ecall
 ret
 526:	8082                	ret

0000000000000528 <rename>:
.global rename
rename:
 li a7, SYS_rename
 528:	48e9                	li	a7,26
 ecall
 52a:	00000073          	ecall
 ret
 52e:	8082                	ret

0000000000000530 <checkchar>:
.global checkchar
checkchar:
 li a7, SYS_checkchar
 530:	48ed                	li	a7,27
 ecall
 532:	00000073          	ecall
 ret
 536:	8082                	ret

0000000000000538 <sprint>:
.global sprint
sprint:
 li a7, SYS_sprint
 538:	48f1                	li	a7,28
 ecall
 53a:	00000073          	ecall
 ret
 53e:	8082                	ret

0000000000000540 <putc>:
static char digits[] = "0123456789ABCDEF";
static char printbuf[100];
static int  len = 0;
static void
putc(int fd, char c)
{
 540:	1141                	addi	sp,sp,-16
 542:	e422                	sd	s0,8(sp)
 544:	0800                	addi	s0,sp,16
  printbuf[len++]=c;
 546:	00000797          	auipc	a5,0x0
 54a:	5ca78793          	addi	a5,a5,1482 # b10 <len>
 54e:	4398                	lw	a4,0(a5)
 550:	0017069b          	addiw	a3,a4,1
 554:	c394                	sw	a3,0(a5)
 556:	00000797          	auipc	a5,0x0
 55a:	5ca78793          	addi	a5,a5,1482 # b20 <printbuf>
 55e:	97ba                	add	a5,a5,a4
 560:	00b78023          	sb	a1,0(a5)
}
 564:	6422                	ld	s0,8(sp)
 566:	0141                	addi	sp,sp,16
 568:	8082                	ret

000000000000056a <printint>:
	}
}

static void
printint(int fd, int xx, int base, int sgn)
{
 56a:	7139                	addi	sp,sp,-64
 56c:	fc06                	sd	ra,56(sp)
 56e:	f822                	sd	s0,48(sp)
 570:	f426                	sd	s1,40(sp)
 572:	f04a                	sd	s2,32(sp)
 574:	ec4e                	sd	s3,24(sp)
 576:	0080                	addi	s0,sp,64
 578:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 57a:	c299                	beqz	a3,580 <printint+0x16>
 57c:	0805c863          	bltz	a1,60c <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 580:	2581                	sext.w	a1,a1
  neg = 0;
 582:	4881                	li	a7,0
 584:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 588:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 58a:	2601                	sext.w	a2,a2
 58c:	00000517          	auipc	a0,0x0
 590:	56c50513          	addi	a0,a0,1388 # af8 <digits>
 594:	883a                	mv	a6,a4
 596:	2705                	addiw	a4,a4,1
 598:	02c5f7bb          	remuw	a5,a1,a2
 59c:	1782                	slli	a5,a5,0x20
 59e:	9381                	srli	a5,a5,0x20
 5a0:	97aa                	add	a5,a5,a0
 5a2:	0007c783          	lbu	a5,0(a5)
 5a6:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 5aa:	0005879b          	sext.w	a5,a1
 5ae:	02c5d5bb          	divuw	a1,a1,a2
 5b2:	0685                	addi	a3,a3,1
 5b4:	fec7f0e3          	bgeu	a5,a2,594 <printint+0x2a>
  if(neg)
 5b8:	00088b63          	beqz	a7,5ce <printint+0x64>
    buf[i++] = '-';
 5bc:	fd040793          	addi	a5,s0,-48
 5c0:	973e                	add	a4,a4,a5
 5c2:	02d00793          	li	a5,45
 5c6:	fef70823          	sb	a5,-16(a4)
 5ca:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 5ce:	02e05863          	blez	a4,5fe <printint+0x94>
 5d2:	fc040793          	addi	a5,s0,-64
 5d6:	00e78933          	add	s2,a5,a4
 5da:	fff78993          	addi	s3,a5,-1
 5de:	99ba                	add	s3,s3,a4
 5e0:	377d                	addiw	a4,a4,-1
 5e2:	1702                	slli	a4,a4,0x20
 5e4:	9301                	srli	a4,a4,0x20
 5e6:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 5ea:	fff94583          	lbu	a1,-1(s2)
 5ee:	8526                	mv	a0,s1
 5f0:	00000097          	auipc	ra,0x0
 5f4:	f50080e7          	jalr	-176(ra) # 540 <putc>
  while(--i >= 0)
 5f8:	197d                	addi	s2,s2,-1
 5fa:	ff3918e3          	bne	s2,s3,5ea <printint+0x80>
}
 5fe:	70e2                	ld	ra,56(sp)
 600:	7442                	ld	s0,48(sp)
 602:	74a2                	ld	s1,40(sp)
 604:	7902                	ld	s2,32(sp)
 606:	69e2                	ld	s3,24(sp)
 608:	6121                	addi	sp,sp,64
 60a:	8082                	ret
    x = -xx;
 60c:	40b005bb          	negw	a1,a1
    neg = 1;
 610:	4885                	li	a7,1
    x = -xx;
 612:	bf8d                	j	584 <printint+0x1a>

0000000000000614 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 614:	7119                	addi	sp,sp,-128
 616:	fc86                	sd	ra,120(sp)
 618:	f8a2                	sd	s0,112(sp)
 61a:	f4a6                	sd	s1,104(sp)
 61c:	f0ca                	sd	s2,96(sp)
 61e:	ecce                	sd	s3,88(sp)
 620:	e8d2                	sd	s4,80(sp)
 622:	e4d6                	sd	s5,72(sp)
 624:	e0da                	sd	s6,64(sp)
 626:	fc5e                	sd	s7,56(sp)
 628:	f862                	sd	s8,48(sp)
 62a:	f466                	sd	s9,40(sp)
 62c:	f06a                	sd	s10,32(sp)
 62e:	ec6e                	sd	s11,24(sp)
 630:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 632:	0005c903          	lbu	s2,0(a1)
 636:	18090f63          	beqz	s2,7d4 <vprintf+0x1c0>
 63a:	8aaa                	mv	s5,a0
 63c:	8b32                	mv	s6,a2
 63e:	00158493          	addi	s1,a1,1
  state = 0;
 642:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 644:	02500a13          	li	s4,37
      if(c == 'd'){
 648:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 64c:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 650:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 654:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 658:	00000b97          	auipc	s7,0x0
 65c:	4a0b8b93          	addi	s7,s7,1184 # af8 <digits>
 660:	a839                	j	67e <vprintf+0x6a>
        putc(fd, c);
 662:	85ca                	mv	a1,s2
 664:	8556                	mv	a0,s5
 666:	00000097          	auipc	ra,0x0
 66a:	eda080e7          	jalr	-294(ra) # 540 <putc>
 66e:	a019                	j	674 <vprintf+0x60>
    } else if(state == '%'){
 670:	01498f63          	beq	s3,s4,68e <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 674:	0485                	addi	s1,s1,1
 676:	fff4c903          	lbu	s2,-1(s1)
 67a:	14090d63          	beqz	s2,7d4 <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 67e:	0009079b          	sext.w	a5,s2
    if(state == 0){
 682:	fe0997e3          	bnez	s3,670 <vprintf+0x5c>
      if(c == '%'){
 686:	fd479ee3          	bne	a5,s4,662 <vprintf+0x4e>
        state = '%';
 68a:	89be                	mv	s3,a5
 68c:	b7e5                	j	674 <vprintf+0x60>
      if(c == 'd'){
 68e:	05878063          	beq	a5,s8,6ce <vprintf+0xba>
      } else if(c == 'l') {
 692:	05978c63          	beq	a5,s9,6ea <vprintf+0xd6>
      } else if(c == 'x') {
 696:	07a78863          	beq	a5,s10,706 <vprintf+0xf2>
      } else if(c == 'p') {
 69a:	09b78463          	beq	a5,s11,722 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 69e:	07300713          	li	a4,115
 6a2:	0ce78663          	beq	a5,a4,76e <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6a6:	06300713          	li	a4,99
 6aa:	0ee78e63          	beq	a5,a4,7a6 <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 6ae:	11478863          	beq	a5,s4,7be <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6b2:	85d2                	mv	a1,s4
 6b4:	8556                	mv	a0,s5
 6b6:	00000097          	auipc	ra,0x0
 6ba:	e8a080e7          	jalr	-374(ra) # 540 <putc>
        putc(fd, c);
 6be:	85ca                	mv	a1,s2
 6c0:	8556                	mv	a0,s5
 6c2:	00000097          	auipc	ra,0x0
 6c6:	e7e080e7          	jalr	-386(ra) # 540 <putc>
      }
      state = 0;
 6ca:	4981                	li	s3,0
 6cc:	b765                	j	674 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 6ce:	008b0913          	addi	s2,s6,8
 6d2:	4685                	li	a3,1
 6d4:	4629                	li	a2,10
 6d6:	000b2583          	lw	a1,0(s6)
 6da:	8556                	mv	a0,s5
 6dc:	00000097          	auipc	ra,0x0
 6e0:	e8e080e7          	jalr	-370(ra) # 56a <printint>
 6e4:	8b4a                	mv	s6,s2
      state = 0;
 6e6:	4981                	li	s3,0
 6e8:	b771                	j	674 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 6ea:	008b0913          	addi	s2,s6,8
 6ee:	4681                	li	a3,0
 6f0:	4629                	li	a2,10
 6f2:	000b2583          	lw	a1,0(s6)
 6f6:	8556                	mv	a0,s5
 6f8:	00000097          	auipc	ra,0x0
 6fc:	e72080e7          	jalr	-398(ra) # 56a <printint>
 700:	8b4a                	mv	s6,s2
      state = 0;
 702:	4981                	li	s3,0
 704:	bf85                	j	674 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 706:	008b0913          	addi	s2,s6,8
 70a:	4681                	li	a3,0
 70c:	4641                	li	a2,16
 70e:	000b2583          	lw	a1,0(s6)
 712:	8556                	mv	a0,s5
 714:	00000097          	auipc	ra,0x0
 718:	e56080e7          	jalr	-426(ra) # 56a <printint>
 71c:	8b4a                	mv	s6,s2
      state = 0;
 71e:	4981                	li	s3,0
 720:	bf91                	j	674 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 722:	008b0793          	addi	a5,s6,8
 726:	f8f43423          	sd	a5,-120(s0)
 72a:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 72e:	03000593          	li	a1,48
 732:	8556                	mv	a0,s5
 734:	00000097          	auipc	ra,0x0
 738:	e0c080e7          	jalr	-500(ra) # 540 <putc>
  putc(fd, 'x');
 73c:	85ea                	mv	a1,s10
 73e:	8556                	mv	a0,s5
 740:	00000097          	auipc	ra,0x0
 744:	e00080e7          	jalr	-512(ra) # 540 <putc>
 748:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 74a:	03c9d793          	srli	a5,s3,0x3c
 74e:	97de                	add	a5,a5,s7
 750:	0007c583          	lbu	a1,0(a5)
 754:	8556                	mv	a0,s5
 756:	00000097          	auipc	ra,0x0
 75a:	dea080e7          	jalr	-534(ra) # 540 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 75e:	0992                	slli	s3,s3,0x4
 760:	397d                	addiw	s2,s2,-1
 762:	fe0914e3          	bnez	s2,74a <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 766:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 76a:	4981                	li	s3,0
 76c:	b721                	j	674 <vprintf+0x60>
        s = va_arg(ap, char*);
 76e:	008b0993          	addi	s3,s6,8
 772:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 776:	02090163          	beqz	s2,798 <vprintf+0x184>
        while(*s != 0){
 77a:	00094583          	lbu	a1,0(s2)
 77e:	c9a1                	beqz	a1,7ce <vprintf+0x1ba>
          putc(fd, *s);
 780:	8556                	mv	a0,s5
 782:	00000097          	auipc	ra,0x0
 786:	dbe080e7          	jalr	-578(ra) # 540 <putc>
          s++;
 78a:	0905                	addi	s2,s2,1
        while(*s != 0){
 78c:	00094583          	lbu	a1,0(s2)
 790:	f9e5                	bnez	a1,780 <vprintf+0x16c>
        s = va_arg(ap, char*);
 792:	8b4e                	mv	s6,s3
      state = 0;
 794:	4981                	li	s3,0
 796:	bdf9                	j	674 <vprintf+0x60>
          s = "(null)";
 798:	00000917          	auipc	s2,0x0
 79c:	35890913          	addi	s2,s2,856 # af0 <malloc+0x192>
        while(*s != 0){
 7a0:	02800593          	li	a1,40
 7a4:	bff1                	j	780 <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 7a6:	008b0913          	addi	s2,s6,8
 7aa:	000b4583          	lbu	a1,0(s6)
 7ae:	8556                	mv	a0,s5
 7b0:	00000097          	auipc	ra,0x0
 7b4:	d90080e7          	jalr	-624(ra) # 540 <putc>
 7b8:	8b4a                	mv	s6,s2
      state = 0;
 7ba:	4981                	li	s3,0
 7bc:	bd65                	j	674 <vprintf+0x60>
        putc(fd, c);
 7be:	85d2                	mv	a1,s4
 7c0:	8556                	mv	a0,s5
 7c2:	00000097          	auipc	ra,0x0
 7c6:	d7e080e7          	jalr	-642(ra) # 540 <putc>
      state = 0;
 7ca:	4981                	li	s3,0
 7cc:	b565                	j	674 <vprintf+0x60>
        s = va_arg(ap, char*);
 7ce:	8b4e                	mv	s6,s3
      state = 0;
 7d0:	4981                	li	s3,0
 7d2:	b54d                	j	674 <vprintf+0x60>
    }
  }
}
 7d4:	70e6                	ld	ra,120(sp)
 7d6:	7446                	ld	s0,112(sp)
 7d8:	74a6                	ld	s1,104(sp)
 7da:	7906                	ld	s2,96(sp)
 7dc:	69e6                	ld	s3,88(sp)
 7de:	6a46                	ld	s4,80(sp)
 7e0:	6aa6                	ld	s5,72(sp)
 7e2:	6b06                	ld	s6,64(sp)
 7e4:	7be2                	ld	s7,56(sp)
 7e6:	7c42                	ld	s8,48(sp)
 7e8:	7ca2                	ld	s9,40(sp)
 7ea:	7d02                	ld	s10,32(sp)
 7ec:	6de2                	ld	s11,24(sp)
 7ee:	6109                	addi	sp,sp,128
 7f0:	8082                	ret

00000000000007f2 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 7f2:	711d                	addi	sp,sp,-96
 7f4:	f406                	sd	ra,40(sp)
 7f6:	f022                	sd	s0,32(sp)
 7f8:	ec26                	sd	s1,24(sp)
 7fa:	e84a                	sd	s2,16(sp)
 7fc:	1800                	addi	s0,sp,48
 7fe:	84aa                	mv	s1,a0
 800:	e010                	sd	a2,0(s0)
 802:	e414                	sd	a3,8(s0)
 804:	e818                	sd	a4,16(s0)
 806:	ec1c                	sd	a5,24(s0)
 808:	03043023          	sd	a6,32(s0)
 80c:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 810:	fc843c23          	sd	s0,-40(s0)
  vprintf(fd, fmt, ap);
 814:	8622                	mv	a2,s0
 816:	00000097          	auipc	ra,0x0
 81a:	dfe080e7          	jalr	-514(ra) # 614 <vprintf>
	if(fd==1){
 81e:	4785                	li	a5,1
 820:	02f48963          	beq	s1,a5,852 <fprintf+0x60>
	  write(fd, printbuf, len);
 824:	00000917          	auipc	s2,0x0
 828:	2ec90913          	addi	s2,s2,748 # b10 <len>
 82c:	00092603          	lw	a2,0(s2)
 830:	00000597          	auipc	a1,0x0
 834:	2f058593          	addi	a1,a1,752 # b20 <printbuf>
 838:	8526                	mv	a0,s1
 83a:	00000097          	auipc	ra,0x0
 83e:	c4e080e7          	jalr	-946(ra) # 488 <write>
	  len=0;
 842:	00092023          	sw	zero,0(s2)
  fflush(fd);
}
 846:	70a2                	ld	ra,40(sp)
 848:	7402                	ld	s0,32(sp)
 84a:	64e2                	ld	s1,24(sp)
 84c:	6942                	ld	s2,16(sp)
 84e:	6125                	addi	sp,sp,96
 850:	8082                	ret
	  printbuf[len]=0;
 852:	00000517          	auipc	a0,0x0
 856:	2ce50513          	addi	a0,a0,718 # b20 <printbuf>
 85a:	00000497          	auipc	s1,0x0
 85e:	2b648493          	addi	s1,s1,694 # b10 <len>
 862:	409c                	lw	a5,0(s1)
 864:	97aa                	add	a5,a5,a0
 866:	00078023          	sb	zero,0(a5)
	  sprint(printbuf);
 86a:	00000097          	auipc	ra,0x0
 86e:	cce080e7          	jalr	-818(ra) # 538 <sprint>
	  len=0;
 872:	0004a023          	sw	zero,0(s1)
 876:	bfc1                	j	846 <fprintf+0x54>

0000000000000878 <printf>:

void
printf(const char *fmt, ...)
{
 878:	7159                	addi	sp,sp,-112
 87a:	f406                	sd	ra,40(sp)
 87c:	f022                	sd	s0,32(sp)
 87e:	ec26                	sd	s1,24(sp)
 880:	1800                	addi	s0,sp,48
 882:	e40c                	sd	a1,8(s0)
 884:	e810                	sd	a2,16(s0)
 886:	ec14                	sd	a3,24(s0)
 888:	f018                	sd	a4,32(s0)
 88a:	f41c                	sd	a5,40(s0)
 88c:	03043823          	sd	a6,48(s0)
 890:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 894:	00840613          	addi	a2,s0,8
 898:	fcc43c23          	sd	a2,-40(s0)
  vprintf(1, fmt, ap);
 89c:	85aa                	mv	a1,a0
 89e:	4505                	li	a0,1
 8a0:	00000097          	auipc	ra,0x0
 8a4:	d74080e7          	jalr	-652(ra) # 614 <vprintf>
	  printbuf[len]=0;
 8a8:	00000517          	auipc	a0,0x0
 8ac:	27850513          	addi	a0,a0,632 # b20 <printbuf>
 8b0:	00000497          	auipc	s1,0x0
 8b4:	26048493          	addi	s1,s1,608 # b10 <len>
 8b8:	409c                	lw	a5,0(s1)
 8ba:	97aa                	add	a5,a5,a0
 8bc:	00078023          	sb	zero,0(a5)
	  sprint(printbuf);
 8c0:	00000097          	auipc	ra,0x0
 8c4:	c78080e7          	jalr	-904(ra) # 538 <sprint>
	  len=0;
 8c8:	0004a023          	sw	zero,0(s1)
  fflush(1);
}
 8cc:	70a2                	ld	ra,40(sp)
 8ce:	7402                	ld	s0,32(sp)
 8d0:	64e2                	ld	s1,24(sp)
 8d2:	6165                	addi	sp,sp,112
 8d4:	8082                	ret

00000000000008d6 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8d6:	1141                	addi	sp,sp,-16
 8d8:	e422                	sd	s0,8(sp)
 8da:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8dc:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8e0:	00000797          	auipc	a5,0x0
 8e4:	2387b783          	ld	a5,568(a5) # b18 <freep>
 8e8:	a805                	j	918 <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 8ea:	4618                	lw	a4,8(a2)
 8ec:	9db9                	addw	a1,a1,a4
 8ee:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 8f2:	6398                	ld	a4,0(a5)
 8f4:	6318                	ld	a4,0(a4)
 8f6:	fee53823          	sd	a4,-16(a0)
 8fa:	a091                	j	93e <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 8fc:	ff852703          	lw	a4,-8(a0)
 900:	9e39                	addw	a2,a2,a4
 902:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 904:	ff053703          	ld	a4,-16(a0)
 908:	e398                	sd	a4,0(a5)
 90a:	a099                	j	950 <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 90c:	6398                	ld	a4,0(a5)
 90e:	00e7e463          	bltu	a5,a4,916 <free+0x40>
 912:	00e6ea63          	bltu	a3,a4,926 <free+0x50>
{
 916:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 918:	fed7fae3          	bgeu	a5,a3,90c <free+0x36>
 91c:	6398                	ld	a4,0(a5)
 91e:	00e6e463          	bltu	a3,a4,926 <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 922:	fee7eae3          	bltu	a5,a4,916 <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 926:	ff852583          	lw	a1,-8(a0)
 92a:	6390                	ld	a2,0(a5)
 92c:	02059713          	slli	a4,a1,0x20
 930:	9301                	srli	a4,a4,0x20
 932:	0712                	slli	a4,a4,0x4
 934:	9736                	add	a4,a4,a3
 936:	fae60ae3          	beq	a2,a4,8ea <free+0x14>
    bp->s.ptr = p->s.ptr;
 93a:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 93e:	4790                	lw	a2,8(a5)
 940:	02061713          	slli	a4,a2,0x20
 944:	9301                	srli	a4,a4,0x20
 946:	0712                	slli	a4,a4,0x4
 948:	973e                	add	a4,a4,a5
 94a:	fae689e3          	beq	a3,a4,8fc <free+0x26>
  } else
    p->s.ptr = bp;
 94e:	e394                	sd	a3,0(a5)
  freep = p;
 950:	00000717          	auipc	a4,0x0
 954:	1cf73423          	sd	a5,456(a4) # b18 <freep>
}
 958:	6422                	ld	s0,8(sp)
 95a:	0141                	addi	sp,sp,16
 95c:	8082                	ret

000000000000095e <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 95e:	7139                	addi	sp,sp,-64
 960:	fc06                	sd	ra,56(sp)
 962:	f822                	sd	s0,48(sp)
 964:	f426                	sd	s1,40(sp)
 966:	f04a                	sd	s2,32(sp)
 968:	ec4e                	sd	s3,24(sp)
 96a:	e852                	sd	s4,16(sp)
 96c:	e456                	sd	s5,8(sp)
 96e:	e05a                	sd	s6,0(sp)
 970:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 972:	02051493          	slli	s1,a0,0x20
 976:	9081                	srli	s1,s1,0x20
 978:	04bd                	addi	s1,s1,15
 97a:	8091                	srli	s1,s1,0x4
 97c:	0014899b          	addiw	s3,s1,1
 980:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 982:	00000517          	auipc	a0,0x0
 986:	19653503          	ld	a0,406(a0) # b18 <freep>
 98a:	c515                	beqz	a0,9b6 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 98c:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 98e:	4798                	lw	a4,8(a5)
 990:	02977f63          	bgeu	a4,s1,9ce <malloc+0x70>
 994:	8a4e                	mv	s4,s3
 996:	0009871b          	sext.w	a4,s3
 99a:	6685                	lui	a3,0x1
 99c:	00d77363          	bgeu	a4,a3,9a2 <malloc+0x44>
 9a0:	6a05                	lui	s4,0x1
 9a2:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 9a6:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 9aa:	00000917          	auipc	s2,0x0
 9ae:	16e90913          	addi	s2,s2,366 # b18 <freep>
  if(p == (char*)-1)
 9b2:	5afd                	li	s5,-1
 9b4:	a88d                	j	a26 <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 9b6:	00000797          	auipc	a5,0x0
 9ba:	1d278793          	addi	a5,a5,466 # b88 <base>
 9be:	00000717          	auipc	a4,0x0
 9c2:	14f73d23          	sd	a5,346(a4) # b18 <freep>
 9c6:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 9c8:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 9cc:	b7e1                	j	994 <malloc+0x36>
      if(p->s.size == nunits)
 9ce:	02e48b63          	beq	s1,a4,a04 <malloc+0xa6>
        p->s.size -= nunits;
 9d2:	4137073b          	subw	a4,a4,s3
 9d6:	c798                	sw	a4,8(a5)
        p += p->s.size;
 9d8:	1702                	slli	a4,a4,0x20
 9da:	9301                	srli	a4,a4,0x20
 9dc:	0712                	slli	a4,a4,0x4
 9de:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 9e0:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 9e4:	00000717          	auipc	a4,0x0
 9e8:	12a73a23          	sd	a0,308(a4) # b18 <freep>
      return (void*)(p + 1);
 9ec:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9f0:	70e2                	ld	ra,56(sp)
 9f2:	7442                	ld	s0,48(sp)
 9f4:	74a2                	ld	s1,40(sp)
 9f6:	7902                	ld	s2,32(sp)
 9f8:	69e2                	ld	s3,24(sp)
 9fa:	6a42                	ld	s4,16(sp)
 9fc:	6aa2                	ld	s5,8(sp)
 9fe:	6b02                	ld	s6,0(sp)
 a00:	6121                	addi	sp,sp,64
 a02:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 a04:	6398                	ld	a4,0(a5)
 a06:	e118                	sd	a4,0(a0)
 a08:	bff1                	j	9e4 <malloc+0x86>
  hp->s.size = nu;
 a0a:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 a0e:	0541                	addi	a0,a0,16
 a10:	00000097          	auipc	ra,0x0
 a14:	ec6080e7          	jalr	-314(ra) # 8d6 <free>
  return freep;
 a18:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 a1c:	d971                	beqz	a0,9f0 <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a1e:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 a20:	4798                	lw	a4,8(a5)
 a22:	fa9776e3          	bgeu	a4,s1,9ce <malloc+0x70>
    if(p == freep)
 a26:	00093703          	ld	a4,0(s2)
 a2a:	853e                	mv	a0,a5
 a2c:	fef719e3          	bne	a4,a5,a1e <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 a30:	8552                	mv	a0,s4
 a32:	00000097          	auipc	ra,0x0
 a36:	aa6080e7          	jalr	-1370(ra) # 4d8 <sbrk>
  if(p == (char*)-1)
 a3a:	fd5518e3          	bne	a0,s5,a0a <malloc+0xac>
        return 0;
 a3e:	4501                	li	a0,0
 a40:	bf45                	j	9f0 <malloc+0x92>
