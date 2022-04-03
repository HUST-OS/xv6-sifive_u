
user/_sh:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <checkenvname>:

char mycwd[128];

int
checkenvname(char* s)
{
       0:	1141                	addi	sp,sp,-16
       2:	e422                	sd	s0,8(sp)
       4:	0800                	addi	s0,sp,16
       6:	88aa                	mv	a7,a0
  if((*s >= 'A' && *s <= 'Z') ||
       8:	00054703          	lbu	a4,0(a0)
       c:	fdf77793          	andi	a5,a4,-33
      10:	fbf7879b          	addiw	a5,a5,-65
      14:	0ff7f793          	andi	a5,a5,255
      18:	46e5                	li	a3,25
      1a:	00f6f763          	bgeu	a3,a5,28 <checkenvname+0x28>
     (*s >= 'a' && *s <= 'z') ||
      1e:	05f00793          	li	a5,95
      *s == '_')
    ;
  else
    return 0;
      22:	4501                	li	a0,0
     (*s >= 'a' && *s <= 'z') ||
      24:	02f71e63          	bne	a4,a5,60 <checkenvname+0x60>
  char *tmp = s + 1;
      28:	00188713          	addi	a4,a7,1
  while((*tmp >= 'A' && *tmp <= 'Z') ||
      2c:	4665                	li	a2,25
        (*tmp >= 'a' && *tmp <= 'z') ||
      2e:	45a5                	li	a1,9
        (*tmp >= '0' && *tmp <= '9') ||
      30:	05f00813          	li	a6,95
  while((*tmp >= 'A' && *tmp <= 'Z') ||
      34:	a011                	j	38 <checkenvname+0x38>
         *tmp == '_')
    tmp++;
      36:	0705                	addi	a4,a4,1
  while((*tmp >= 'A' && *tmp <= 'Z') ||
      38:	00074683          	lbu	a3,0(a4)
      3c:	fdf6f793          	andi	a5,a3,-33
      40:	fbf7879b          	addiw	a5,a5,-65
      44:	0ff7f793          	andi	a5,a5,255
      48:	fef677e3          	bgeu	a2,a5,36 <checkenvname+0x36>
        (*tmp >= '0' && *tmp <= '9') ||
      4c:	fd06879b          	addiw	a5,a3,-48
        (*tmp >= 'a' && *tmp <= 'z') ||
      50:	0ff7f793          	andi	a5,a5,255
      54:	fef5f1e3          	bgeu	a1,a5,36 <checkenvname+0x36>
        (*tmp >= '0' && *tmp <= '9') ||
      58:	fd068fe3          	beq	a3,a6,36 <checkenvname+0x36>
  return (int)(tmp - s);
      5c:	4117053b          	subw	a0,a4,a7
}
      60:	6422                	ld	s0,8(sp)
      62:	0141                	addi	sp,sp,16
      64:	8082                	ret

0000000000000066 <export>:

int
export(char *argv[])
{
      66:	7131                	addi	sp,sp,-192
      68:	fd06                	sd	ra,184(sp)
      6a:	f922                	sd	s0,176(sp)
      6c:	f526                	sd	s1,168(sp)
      6e:	f14a                	sd	s2,160(sp)
      70:	ed4e                	sd	s3,152(sp)
      72:	e952                	sd	s4,144(sp)
      74:	e556                	sd	s5,136(sp)
      76:	e15a                	sd	s6,128(sp)
      78:	0180                	addi	s0,sp,192
      7a:	84aa                	mv	s1,a0
  if(!strcmp(argv[1], "-p"))
      7c:	00001597          	auipc	a1,0x1
      80:	78c58593          	addi	a1,a1,1932 # 1808 <malloc+0xe6>
      84:	6508                	ld	a0,8(a0)
      86:	00001097          	auipc	ra,0x1
      8a:	fce080e7          	jalr	-50(ra) # 1054 <strcmp>
      8e:	e12d                	bnez	a0,f0 <export+0x8a>
      90:	89aa                	mv	s3,a0
  { // print all the env vars
    if(!nenv)
      92:	00002b17          	auipc	s6,0x2
      96:	986b2b03          	lw	s6,-1658(s6) # 1a18 <nenv>
      9a:	040b0163          	beqz	s6,dc <export+0x76>
    {
      printf("NO env var exported\n");
      return 0;
    }
    for(int i=0; i<nenv; i++)
      9e:	00002497          	auipc	s1,0x2
      a2:	a7248493          	addi	s1,s1,-1422 # 1b10 <envs>
      a6:	892a                	mv	s2,a0
      printf("export %s=%s\n", envs[i].name, envs[i].value);
      a8:	00001a97          	auipc	s5,0x1
      ac:	780a8a93          	addi	s5,s5,1920 # 1828 <malloc+0x106>
    for(int i=0; i<nenv; i++)
      b0:	00002a17          	auipc	s4,0x2
      b4:	968a0a13          	addi	s4,s4,-1688 # 1a18 <nenv>
      b8:	0f605c63          	blez	s6,1b0 <export+0x14a>
      printf("export %s=%s\n", envs[i].name, envs[i].value);
      bc:	02048613          	addi	a2,s1,32
      c0:	85a6                	mv	a1,s1
      c2:	8556                	mv	a0,s5
      c4:	00001097          	auipc	ra,0x1
      c8:	5a0080e7          	jalr	1440(ra) # 1664 <printf>
    for(int i=0; i<nenv; i++)
      cc:	2905                	addiw	s2,s2,1
      ce:	08048493          	addi	s1,s1,128
      d2:	000a2783          	lw	a5,0(s4)
      d6:	fef943e3          	blt	s2,a5,bc <export+0x56>
      da:	a8d9                	j	1b0 <export+0x14a>
      printf("NO env var exported\n");
      dc:	00001517          	auipc	a0,0x1
      e0:	73450513          	addi	a0,a0,1844 # 1810 <malloc+0xee>
      e4:	00001097          	auipc	ra,0x1
      e8:	580080e7          	jalr	1408(ra) # 1664 <printf>
      return 0;
      ec:	89da                	mv	s3,s6
      ee:	a0c9                	j	1b0 <export+0x14a>
    return 0;
  }
  else if(nenv == NENVS)
      f0:	00002997          	auipc	s3,0x2
      f4:	9289a983          	lw	s3,-1752(s3) # 1a18 <nenv>
      f8:	47c1                	li	a5,16
      fa:	0cf98663          	beq	s3,a5,1c6 <export+0x160>
  {
    fprintf(2, "too many env vars\n");
    return -1;
  }
  char name[32], value[96];
  char *s = argv[1], *t = name;
      fe:	0084b903          	ld	s2,8(s1)

  for(s=argv[1], t=name; (*t=*s++)!='='; t++)
     102:	00190493          	addi	s1,s2,1
     106:	00094783          	lbu	a5,0(s2)
     10a:	faf40023          	sb	a5,-96(s0)
     10e:	03d00713          	li	a4,61
     112:	0ce78563          	beq	a5,a4,1dc <export+0x176>
     116:	fa040793          	addi	a5,s0,-96
     11a:	03d00693          	li	a3,61
     11e:	0785                	addi	a5,a5,1
     120:	0485                	addi	s1,s1,1
     122:	fff4c703          	lbu	a4,-1(s1)
     126:	00e78023          	sb	a4,0(a5)
     12a:	fed71ae3          	bne	a4,a3,11e <export+0xb8>
    ;
  *t = 0;
     12e:	00078023          	sb	zero,0(a5)

  if(checkenvname(name) != ((s - argv[1]) - 1))
     132:	fa040513          	addi	a0,s0,-96
     136:	00000097          	auipc	ra,0x0
     13a:	eca080e7          	jalr	-310(ra) # 0 <checkenvname>
     13e:	41248933          	sub	s2,s1,s2
     142:	197d                	addi	s2,s2,-1
     144:	09251f63          	bne	a0,s2,1e2 <export+0x17c>
  {
    fprintf(2, "Invalid NAME!\n");
    return -1;
  }
  for(t=value; (*t=*s); s++, t++)
     148:	0004c703          	lbu	a4,0(s1)
     14c:	f4e40023          	sb	a4,-192(s0)
     150:	f4040793          	addi	a5,s0,-192
     154:	cb01                	beqz	a4,164 <export+0xfe>
     156:	0485                	addi	s1,s1,1
     158:	0785                	addi	a5,a5,1
     15a:	0004c703          	lbu	a4,0(s1)
     15e:	00e78023          	sb	a4,0(a5)
     162:	fb75                	bnez	a4,156 <export+0xf0>
    ;
  if(*--t == '/')
     164:	fff7c683          	lbu	a3,-1(a5)
     168:	02f00713          	li	a4,47
     16c:	08e68663          	beq	a3,a4,1f8 <export+0x192>
    *t = 0;
  
  strcpy(envs[nenv].name, name);
     170:	00799513          	slli	a0,s3,0x7
     174:	00002917          	auipc	s2,0x2
     178:	99c90913          	addi	s2,s2,-1636 # 1b10 <envs>
     17c:	fa040593          	addi	a1,s0,-96
     180:	954a                	add	a0,a0,s2
     182:	00001097          	auipc	ra,0x1
     186:	e88080e7          	jalr	-376(ra) # 100a <strcpy>
  strcpy(envs[nenv].value, value);
     18a:	00002497          	auipc	s1,0x2
     18e:	88e48493          	addi	s1,s1,-1906 # 1a18 <nenv>
     192:	4088                	lw	a0,0(s1)
     194:	051e                	slli	a0,a0,0x7
     196:	02050513          	addi	a0,a0,32
     19a:	f4040593          	addi	a1,s0,-192
     19e:	954a                	add	a0,a0,s2
     1a0:	00001097          	auipc	ra,0x1
     1a4:	e6a080e7          	jalr	-406(ra) # 100a <strcpy>
  nenv++;
     1a8:	409c                	lw	a5,0(s1)
     1aa:	2785                	addiw	a5,a5,1
     1ac:	c09c                	sw	a5,0(s1)
  return 0;
     1ae:	4981                	li	s3,0
}
     1b0:	854e                	mv	a0,s3
     1b2:	70ea                	ld	ra,184(sp)
     1b4:	744a                	ld	s0,176(sp)
     1b6:	74aa                	ld	s1,168(sp)
     1b8:	790a                	ld	s2,160(sp)
     1ba:	69ea                	ld	s3,152(sp)
     1bc:	6a4a                	ld	s4,144(sp)
     1be:	6aaa                	ld	s5,136(sp)
     1c0:	6b0a                	ld	s6,128(sp)
     1c2:	6129                	addi	sp,sp,192
     1c4:	8082                	ret
    fprintf(2, "too many env vars\n");
     1c6:	00001597          	auipc	a1,0x1
     1ca:	67258593          	addi	a1,a1,1650 # 1838 <malloc+0x116>
     1ce:	4509                	li	a0,2
     1d0:	00001097          	auipc	ra,0x1
     1d4:	466080e7          	jalr	1126(ra) # 1636 <fprintf>
    return -1;
     1d8:	59fd                	li	s3,-1
     1da:	bfd9                	j	1b0 <export+0x14a>
  for(s=argv[1], t=name; (*t=*s++)!='='; t++)
     1dc:	fa040793          	addi	a5,s0,-96
     1e0:	b7b9                	j	12e <export+0xc8>
    fprintf(2, "Invalid NAME!\n");
     1e2:	00001597          	auipc	a1,0x1
     1e6:	66e58593          	addi	a1,a1,1646 # 1850 <malloc+0x12e>
     1ea:	4509                	li	a0,2
     1ec:	00001097          	auipc	ra,0x1
     1f0:	44a080e7          	jalr	1098(ra) # 1636 <fprintf>
    return -1;
     1f4:	59fd                	li	s3,-1
     1f6:	bf6d                	j	1b0 <export+0x14a>
    *t = 0;
     1f8:	fe078fa3          	sb	zero,-1(a5)
     1fc:	bf95                	j	170 <export+0x10a>

00000000000001fe <replace>:

int
replace(char *buf)
{
     1fe:	7151                	addi	sp,sp,-240
     200:	f586                	sd	ra,232(sp)
     202:	f1a2                	sd	s0,224(sp)
     204:	eda6                	sd	s1,216(sp)
     206:	e9ca                	sd	s2,208(sp)
     208:	e5ce                	sd	s3,200(sp)
     20a:	e1d2                	sd	s4,192(sp)
     20c:	fd56                	sd	s5,184(sp)
     20e:	f95a                	sd	s6,176(sp)
     210:	f55e                	sd	s7,168(sp)
     212:	f162                	sd	s8,160(sp)
     214:	ed66                	sd	s9,152(sp)
     216:	e96a                	sd	s10,144(sp)
     218:	1980                	addi	s0,sp,240
     21a:	89aa                	mv	s3,a0
  char raw[100], name[32], *s, *t, *tmp;
  int n = 0;
  strcpy(raw, buf);
     21c:	85aa                	mv	a1,a0
     21e:	f3840513          	addi	a0,s0,-200
     222:	00001097          	auipc	ra,0x1
     226:	de8080e7          	jalr	-536(ra) # 100a <strcpy>
  for(s=raw, t=buf; (*t=*s); t++)
     22a:	f3844783          	lbu	a5,-200(s0)
     22e:	00f98023          	sb	a5,0(s3)
     232:	c7ed                	beqz	a5,31c <replace+0x11e>
  int n = 0;
     234:	4c01                	li	s8,0
  for(s=raw, t=buf; (*t=*s); t++)
     236:	f3840713          	addi	a4,s0,-200
  {
    if(*s++ == '$'){
     23a:	02400b93          	li	s7,36
      tmp = name;
      if((*s >= 'A' && *s <= 'Z') || (*s >= 'a' && *s <= 'z') || *s == '_')
     23e:	4965                	li	s2,25
      {
        *tmp++ = *s++;
        while((*s >= 'A' && *s <= 'Z') || (*s >= 'a' && *s <= 'z') || (*s >= '0' && *s <= '9') || *s == '_')
     240:	4a25                	li	s4,9
     242:	05f00a93          	li	s5,95
          *tmp++ = *s++;
        *tmp = 0;
        for(int i=0; i<nenv; i++)
     246:	00001b17          	auipc	s6,0x1
     24a:	7d2b0b13          	addi	s6,s6,2002 # 1a18 <nenv>
     24e:	a03d                	j	27c <replace+0x7e>
      if((*s >= 'A' && *s <= 'Z') || (*s >= 'a' && *s <= 'z') || *s == '_')
     250:	00174683          	lbu	a3,1(a4)
     254:	fdf6f793          	andi	a5,a3,-33
     258:	fbf7879b          	addiw	a5,a5,-65
     25c:	0ff7f793          	andi	a5,a5,255
     260:	02f97563          	bgeu	s2,a5,28a <replace+0x8c>
     264:	03568363          	beq	a3,s5,28a <replace+0x8c>
          if(!strcmp(name, envs[i].name))
            for(tmp=envs[i].value; (*t=*tmp); t++, tmp++)
              ;
        t--;
      }
      n++;
     268:	2c05                	addiw	s8,s8,1
     26a:	86ce                	mv	a3,s3
     26c:	8726                	mv	a4,s1
  for(s=raw, t=buf; (*t=*s); t++)
     26e:	00168993          	addi	s3,a3,1
     272:	00074783          	lbu	a5,0(a4)
     276:	00f680a3          	sb	a5,1(a3)
     27a:	c3d5                	beqz	a5,31e <replace+0x120>
    if(*s++ == '$'){
     27c:	00170493          	addi	s1,a4,1
     280:	fd7788e3          	beq	a5,s7,250 <replace+0x52>
     284:	86ce                	mv	a3,s3
     286:	8726                	mv	a4,s1
     288:	b7dd                	j	26e <replace+0x70>
        *tmp++ = *s++;
     28a:	00270493          	addi	s1,a4,2
     28e:	f0d40c23          	sb	a3,-232(s0)
     292:	f1940693          	addi	a3,s0,-231
        while((*s >= 'A' && *s <= 'Z') || (*s >= 'a' && *s <= 'z') || (*s >= '0' && *s <= '9') || *s == '_')
     296:	a029                	j	2a0 <replace+0xa2>
          *tmp++ = *s++;
     298:	0485                	addi	s1,s1,1
     29a:	0685                	addi	a3,a3,1
     29c:	fee68fa3          	sb	a4,-1(a3)
        while((*s >= 'A' && *s <= 'Z') || (*s >= 'a' && *s <= 'z') || (*s >= '0' && *s <= '9') || *s == '_')
     2a0:	0004c703          	lbu	a4,0(s1)
     2a4:	fdf77793          	andi	a5,a4,-33
     2a8:	fbf7879b          	addiw	a5,a5,-65
     2ac:	0ff7f793          	andi	a5,a5,255
     2b0:	fef974e3          	bgeu	s2,a5,298 <replace+0x9a>
     2b4:	fd07079b          	addiw	a5,a4,-48
     2b8:	0ff7f793          	andi	a5,a5,255
     2bc:	fcfa7ee3          	bgeu	s4,a5,298 <replace+0x9a>
     2c0:	fd570ce3          	beq	a4,s5,298 <replace+0x9a>
        *tmp = 0;
     2c4:	00068023          	sb	zero,0(a3)
        for(int i=0; i<nenv; i++)
     2c8:	000b2783          	lw	a5,0(s6)
     2cc:	04f05663          	blez	a5,318 <replace+0x11a>
     2d0:	00002c97          	auipc	s9,0x2
     2d4:	840c8c93          	addi	s9,s9,-1984 # 1b10 <envs>
     2d8:	4d01                	li	s10,0
     2da:	a801                	j	2ea <replace+0xec>
     2dc:	2d05                	addiw	s10,s10,1
     2de:	080c8c93          	addi	s9,s9,128
     2e2:	000b2783          	lw	a5,0(s6)
     2e6:	02fd5963          	bge	s10,a5,318 <replace+0x11a>
          if(!strcmp(name, envs[i].name))
     2ea:	85e6                	mv	a1,s9
     2ec:	f1840513          	addi	a0,s0,-232
     2f0:	00001097          	auipc	ra,0x1
     2f4:	d64080e7          	jalr	-668(ra) # 1054 <strcmp>
     2f8:	f175                	bnez	a0,2dc <replace+0xde>
            for(tmp=envs[i].value; (*t=*tmp); t++, tmp++)
     2fa:	020c8793          	addi	a5,s9,32
     2fe:	020cc703          	lbu	a4,32(s9)
     302:	00e98023          	sb	a4,0(s3)
     306:	db79                	beqz	a4,2dc <replace+0xde>
     308:	0985                	addi	s3,s3,1
     30a:	0785                	addi	a5,a5,1
     30c:	0007c703          	lbu	a4,0(a5)
     310:	00e98023          	sb	a4,0(s3)
     314:	fb75                	bnez	a4,308 <replace+0x10a>
     316:	b7d9                	j	2dc <replace+0xde>
        t--;
     318:	19fd                	addi	s3,s3,-1
     31a:	b7b9                	j	268 <replace+0x6a>
  int n = 0;
     31c:	4c01                	li	s8,0
    }
  }
  return n;
}
     31e:	8562                	mv	a0,s8
     320:	70ae                	ld	ra,232(sp)
     322:	740e                	ld	s0,224(sp)
     324:	64ee                	ld	s1,216(sp)
     326:	694e                	ld	s2,208(sp)
     328:	69ae                	ld	s3,200(sp)
     32a:	6a0e                	ld	s4,192(sp)
     32c:	7aea                	ld	s5,184(sp)
     32e:	7b4a                	ld	s6,176(sp)
     330:	7baa                	ld	s7,168(sp)
     332:	7c0a                	ld	s8,160(sp)
     334:	6cea                	ld	s9,152(sp)
     336:	6d4a                	ld	s10,144(sp)
     338:	616d                	addi	sp,sp,240
     33a:	8082                	ret

000000000000033c <getcmd>:
  exit(0);
}

int
getcmd(char *buf, int nbuf)
{
     33c:	1101                	addi	sp,sp,-32
     33e:	ec06                	sd	ra,24(sp)
     340:	e822                	sd	s0,16(sp)
     342:	e426                	sd	s1,8(sp)
     344:	e04a                	sd	s2,0(sp)
     346:	1000                	addi	s0,sp,32
     348:	84aa                	mv	s1,a0
     34a:	892e                	mv	s2,a1
  fprintf(2, "-> %s $ ", mycwd);
     34c:	00001617          	auipc	a2,0x1
     350:	6dc60613          	addi	a2,a2,1756 # 1a28 <mycwd>
     354:	00001597          	auipc	a1,0x1
     358:	50c58593          	addi	a1,a1,1292 # 1860 <malloc+0x13e>
     35c:	4509                	li	a0,2
     35e:	00001097          	auipc	ra,0x1
     362:	2d8080e7          	jalr	728(ra) # 1636 <fprintf>
  memset(buf, 0, nbuf);
     366:	864a                	mv	a2,s2
     368:	4581                	li	a1,0
     36a:	8526                	mv	a0,s1
     36c:	00001097          	auipc	ra,0x1
     370:	d3e080e7          	jalr	-706(ra) # 10aa <memset>
  gets(buf, nbuf);
     374:	85ca                	mv	a1,s2
     376:	8526                	mv	a0,s1
     378:	00001097          	auipc	ra,0x1
     37c:	d7c080e7          	jalr	-644(ra) # 10f4 <gets>
  if(buf[0] == 0) // EOF
     380:	0004c503          	lbu	a0,0(s1)
     384:	00153513          	seqz	a0,a0
    return -1;
  return 0;
}
     388:	40a00533          	neg	a0,a0
     38c:	60e2                	ld	ra,24(sp)
     38e:	6442                	ld	s0,16(sp)
     390:	64a2                	ld	s1,8(sp)
     392:	6902                	ld	s2,0(sp)
     394:	6105                	addi	sp,sp,32
     396:	8082                	ret

0000000000000398 <panic>:
  exit(0);
}

void
panic(char *s)
{
     398:	1141                	addi	sp,sp,-16
     39a:	e406                	sd	ra,8(sp)
     39c:	e022                	sd	s0,0(sp)
     39e:	0800                	addi	s0,sp,16
     3a0:	862a                	mv	a2,a0
  fprintf(2, "%s\n", s);
     3a2:	00001597          	auipc	a1,0x1
     3a6:	4ce58593          	addi	a1,a1,1230 # 1870 <malloc+0x14e>
     3aa:	4509                	li	a0,2
     3ac:	00001097          	auipc	ra,0x1
     3b0:	28a080e7          	jalr	650(ra) # 1636 <fprintf>
  exit(1);
     3b4:	4505                	li	a0,1
     3b6:	00001097          	auipc	ra,0x1
     3ba:	f0e080e7          	jalr	-242(ra) # 12c4 <exit>

00000000000003be <fork1>:
}

int
fork1(void)
{
     3be:	1141                	addi	sp,sp,-16
     3c0:	e406                	sd	ra,8(sp)
     3c2:	e022                	sd	s0,0(sp)
     3c4:	0800                	addi	s0,sp,16
  int pid;

  pid = fork();
     3c6:	00001097          	auipc	ra,0x1
     3ca:	ef6080e7          	jalr	-266(ra) # 12bc <fork>
  if(pid == -1)
     3ce:	57fd                	li	a5,-1
     3d0:	00f50663          	beq	a0,a5,3dc <fork1+0x1e>
    panic("fork");
  return pid;
}
     3d4:	60a2                	ld	ra,8(sp)
     3d6:	6402                	ld	s0,0(sp)
     3d8:	0141                	addi	sp,sp,16
     3da:	8082                	ret
    panic("fork");
     3dc:	00001517          	auipc	a0,0x1
     3e0:	49c50513          	addi	a0,a0,1180 # 1878 <malloc+0x156>
     3e4:	00000097          	auipc	ra,0x0
     3e8:	fb4080e7          	jalr	-76(ra) # 398 <panic>

00000000000003ec <runcmd>:
{
     3ec:	7175                	addi	sp,sp,-144
     3ee:	e506                	sd	ra,136(sp)
     3f0:	e122                	sd	s0,128(sp)
     3f2:	fca6                	sd	s1,120(sp)
     3f4:	f8ca                	sd	s2,112(sp)
     3f6:	f4ce                	sd	s3,104(sp)
     3f8:	f0d2                	sd	s4,96(sp)
     3fa:	ecd6                	sd	s5,88(sp)
     3fc:	e8da                	sd	s6,80(sp)
     3fe:	0900                	addi	s0,sp,144
  if(cmd == 0)
     400:	c10d                	beqz	a0,422 <runcmd+0x36>
     402:	84aa                	mv	s1,a0
  switch(cmd->type){
     404:	4118                	lw	a4,0(a0)
     406:	4795                	li	a5,5
     408:	02e7e263          	bltu	a5,a4,42c <runcmd+0x40>
     40c:	00056783          	lwu	a5,0(a0)
     410:	078a                	slli	a5,a5,0x2
     412:	00001717          	auipc	a4,0x1
     416:	5a670713          	addi	a4,a4,1446 # 19b8 <malloc+0x296>
     41a:	97ba                	add	a5,a5,a4
     41c:	439c                	lw	a5,0(a5)
     41e:	97ba                	add	a5,a5,a4
     420:	8782                	jr	a5
    exit(1);
     422:	4505                	li	a0,1
     424:	00001097          	auipc	ra,0x1
     428:	ea0080e7          	jalr	-352(ra) # 12c4 <exit>
    panic("runcmd");
     42c:	00001517          	auipc	a0,0x1
     430:	45450513          	addi	a0,a0,1108 # 1880 <malloc+0x15e>
     434:	00000097          	auipc	ra,0x0
     438:	f64080e7          	jalr	-156(ra) # 398 <panic>
    if(ecmd->argv[0] == 0)
     43c:	6508                	ld	a0,8(a0)
     43e:	c915                	beqz	a0,472 <runcmd+0x86>
    exec(ecmd->argv[0], ecmd->argv);
     440:	00848a13          	addi	s4,s1,8
     444:	85d2                	mv	a1,s4
     446:	00001097          	auipc	ra,0x1
     44a:	eb6080e7          	jalr	-330(ra) # 12fc <exec>
    for(i=0; i<nenv; i++)
     44e:	00001797          	auipc	a5,0x1
     452:	5ca7a783          	lw	a5,1482(a5) # 1a18 <nenv>
     456:	06f05f63          	blez	a5,4d4 <runcmd+0xe8>
     45a:	00001917          	auipc	s2,0x1
     45e:	6d790913          	addi	s2,s2,1751 # 1b31 <envs+0x21>
     462:	4981                	li	s3,0
      *s_tmp++ = '/';
     464:	02f00b13          	li	s6,47
    for(i=0; i<nenv; i++)
     468:	00001a97          	auipc	s5,0x1
     46c:	5b0a8a93          	addi	s5,s5,1456 # 1a18 <nenv>
     470:	a091                	j	4b4 <runcmd+0xc8>
      exit(1);
     472:	4505                	li	a0,1
     474:	00001097          	auipc	ra,0x1
     478:	e50080e7          	jalr	-432(ra) # 12c4 <exit>
      char *s_tmp = env_cmd;
     47c:	f7840793          	addi	a5,s0,-136
      *s_tmp++ = '/';
     480:	00178713          	addi	a4,a5,1
     484:	01678023          	sb	s6,0(a5)
      d_tmp = ecmd->argv[0];
     488:	649c                	ld	a5,8(s1)
      while((*s_tmp++ = *d_tmp++))
     48a:	0785                	addi	a5,a5,1
     48c:	0705                	addi	a4,a4,1
     48e:	fff7c683          	lbu	a3,-1(a5)
     492:	fed70fa3          	sb	a3,-1(a4)
     496:	faf5                	bnez	a3,48a <runcmd+0x9e>
      exec(env_cmd, ecmd->argv);
     498:	85d2                	mv	a1,s4
     49a:	f7840513          	addi	a0,s0,-136
     49e:	00001097          	auipc	ra,0x1
     4a2:	e5e080e7          	jalr	-418(ra) # 12fc <exec>
    for(i=0; i<nenv; i++)
     4a6:	2985                	addiw	s3,s3,1
     4a8:	08090913          	addi	s2,s2,128
     4ac:	000aa783          	lw	a5,0(s5)
     4b0:	02f9d263          	bge	s3,a5,4d4 <runcmd+0xe8>
      while((*s_tmp = *d_tmp++))
     4b4:	874a                	mv	a4,s2
     4b6:	fff94783          	lbu	a5,-1(s2)
     4ba:	f6f40c23          	sb	a5,-136(s0)
     4be:	dfdd                	beqz	a5,47c <runcmd+0x90>
      char *s_tmp = env_cmd;
     4c0:	f7840793          	addi	a5,s0,-136
        s_tmp++;
     4c4:	0785                	addi	a5,a5,1
      while((*s_tmp = *d_tmp++))
     4c6:	0705                	addi	a4,a4,1
     4c8:	fff74683          	lbu	a3,-1(a4)
     4cc:	00d78023          	sb	a3,0(a5)
     4d0:	faf5                	bnez	a3,4c4 <runcmd+0xd8>
     4d2:	b77d                	j	480 <runcmd+0x94>
    fprintf(2, "exec %s failed\n", ecmd->argv[0]);
     4d4:	6490                	ld	a2,8(s1)
     4d6:	00001597          	auipc	a1,0x1
     4da:	3b258593          	addi	a1,a1,946 # 1888 <malloc+0x166>
     4de:	4509                	li	a0,2
     4e0:	00001097          	auipc	ra,0x1
     4e4:	156080e7          	jalr	342(ra) # 1636 <fprintf>
  exit(0);
     4e8:	4501                	li	a0,0
     4ea:	00001097          	auipc	ra,0x1
     4ee:	dda080e7          	jalr	-550(ra) # 12c4 <exit>
    close(rcmd->fd);
     4f2:	5148                	lw	a0,36(a0)
     4f4:	00001097          	auipc	ra,0x1
     4f8:	df8080e7          	jalr	-520(ra) # 12ec <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     4fc:	508c                	lw	a1,32(s1)
     4fe:	6888                	ld	a0,16(s1)
     500:	00001097          	auipc	ra,0x1
     504:	e04080e7          	jalr	-508(ra) # 1304 <open>
     508:	00054763          	bltz	a0,516 <runcmd+0x12a>
    runcmd(rcmd->cmd);
     50c:	6488                	ld	a0,8(s1)
     50e:	00000097          	auipc	ra,0x0
     512:	ede080e7          	jalr	-290(ra) # 3ec <runcmd>
      fprintf(2, "open %s failed\n", rcmd->file);
     516:	6890                	ld	a2,16(s1)
     518:	00001597          	auipc	a1,0x1
     51c:	38058593          	addi	a1,a1,896 # 1898 <malloc+0x176>
     520:	4509                	li	a0,2
     522:	00001097          	auipc	ra,0x1
     526:	114080e7          	jalr	276(ra) # 1636 <fprintf>
      exit(1);
     52a:	4505                	li	a0,1
     52c:	00001097          	auipc	ra,0x1
     530:	d98080e7          	jalr	-616(ra) # 12c4 <exit>
    if(fork1() == 0)
     534:	00000097          	auipc	ra,0x0
     538:	e8a080e7          	jalr	-374(ra) # 3be <fork1>
     53c:	c919                	beqz	a0,552 <runcmd+0x166>
    wait(0);
     53e:	4501                	li	a0,0
     540:	00001097          	auipc	ra,0x1
     544:	d8c080e7          	jalr	-628(ra) # 12cc <wait>
    runcmd(lcmd->right);
     548:	6888                	ld	a0,16(s1)
     54a:	00000097          	auipc	ra,0x0
     54e:	ea2080e7          	jalr	-350(ra) # 3ec <runcmd>
      runcmd(lcmd->left);
     552:	6488                	ld	a0,8(s1)
     554:	00000097          	auipc	ra,0x0
     558:	e98080e7          	jalr	-360(ra) # 3ec <runcmd>
    if(pipe(p) < 0)
     55c:	fb840513          	addi	a0,s0,-72
     560:	00001097          	auipc	ra,0x1
     564:	d74080e7          	jalr	-652(ra) # 12d4 <pipe>
     568:	04054363          	bltz	a0,5ae <runcmd+0x1c2>
    if(fork1() == 0){
     56c:	00000097          	auipc	ra,0x0
     570:	e52080e7          	jalr	-430(ra) # 3be <fork1>
     574:	c529                	beqz	a0,5be <runcmd+0x1d2>
    if(fork1() == 0){
     576:	00000097          	auipc	ra,0x0
     57a:	e48080e7          	jalr	-440(ra) # 3be <fork1>
     57e:	cd25                	beqz	a0,5f6 <runcmd+0x20a>
    close(p[0]);
     580:	fb842503          	lw	a0,-72(s0)
     584:	00001097          	auipc	ra,0x1
     588:	d68080e7          	jalr	-664(ra) # 12ec <close>
    close(p[1]);
     58c:	fbc42503          	lw	a0,-68(s0)
     590:	00001097          	auipc	ra,0x1
     594:	d5c080e7          	jalr	-676(ra) # 12ec <close>
    wait(0);
     598:	4501                	li	a0,0
     59a:	00001097          	auipc	ra,0x1
     59e:	d32080e7          	jalr	-718(ra) # 12cc <wait>
    wait(0);
     5a2:	4501                	li	a0,0
     5a4:	00001097          	auipc	ra,0x1
     5a8:	d28080e7          	jalr	-728(ra) # 12cc <wait>
    break;
     5ac:	bf35                	j	4e8 <runcmd+0xfc>
      panic("pipe");
     5ae:	00001517          	auipc	a0,0x1
     5b2:	2fa50513          	addi	a0,a0,762 # 18a8 <malloc+0x186>
     5b6:	00000097          	auipc	ra,0x0
     5ba:	de2080e7          	jalr	-542(ra) # 398 <panic>
      close(1);
     5be:	4505                	li	a0,1
     5c0:	00001097          	auipc	ra,0x1
     5c4:	d2c080e7          	jalr	-724(ra) # 12ec <close>
      dup(p[1]);
     5c8:	fbc42503          	lw	a0,-68(s0)
     5cc:	00001097          	auipc	ra,0x1
     5d0:	d58080e7          	jalr	-680(ra) # 1324 <dup>
      close(p[0]);
     5d4:	fb842503          	lw	a0,-72(s0)
     5d8:	00001097          	auipc	ra,0x1
     5dc:	d14080e7          	jalr	-748(ra) # 12ec <close>
      close(p[1]);
     5e0:	fbc42503          	lw	a0,-68(s0)
     5e4:	00001097          	auipc	ra,0x1
     5e8:	d08080e7          	jalr	-760(ra) # 12ec <close>
      runcmd(pcmd->left);
     5ec:	6488                	ld	a0,8(s1)
     5ee:	00000097          	auipc	ra,0x0
     5f2:	dfe080e7          	jalr	-514(ra) # 3ec <runcmd>
      close(0);
     5f6:	00001097          	auipc	ra,0x1
     5fa:	cf6080e7          	jalr	-778(ra) # 12ec <close>
      dup(p[0]);
     5fe:	fb842503          	lw	a0,-72(s0)
     602:	00001097          	auipc	ra,0x1
     606:	d22080e7          	jalr	-734(ra) # 1324 <dup>
      close(p[0]);
     60a:	fb842503          	lw	a0,-72(s0)
     60e:	00001097          	auipc	ra,0x1
     612:	cde080e7          	jalr	-802(ra) # 12ec <close>
      close(p[1]);
     616:	fbc42503          	lw	a0,-68(s0)
     61a:	00001097          	auipc	ra,0x1
     61e:	cd2080e7          	jalr	-814(ra) # 12ec <close>
      runcmd(pcmd->right);
     622:	6888                	ld	a0,16(s1)
     624:	00000097          	auipc	ra,0x0
     628:	dc8080e7          	jalr	-568(ra) # 3ec <runcmd>
    if(fork1() == 0)
     62c:	00000097          	auipc	ra,0x0
     630:	d92080e7          	jalr	-622(ra) # 3be <fork1>
     634:	ea051ae3          	bnez	a0,4e8 <runcmd+0xfc>
      runcmd(bcmd->cmd);
     638:	6488                	ld	a0,8(s1)
     63a:	00000097          	auipc	ra,0x0
     63e:	db2080e7          	jalr	-590(ra) # 3ec <runcmd>

0000000000000642 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     642:	1101                	addi	sp,sp,-32
     644:	ec06                	sd	ra,24(sp)
     646:	e822                	sd	s0,16(sp)
     648:	e426                	sd	s1,8(sp)
     64a:	1000                	addi	s0,sp,32
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     64c:	0a800513          	li	a0,168
     650:	00001097          	auipc	ra,0x1
     654:	0d2080e7          	jalr	210(ra) # 1722 <malloc>
     658:	84aa                	mv	s1,a0
  memset(cmd, 0, sizeof(*cmd));
     65a:	0a800613          	li	a2,168
     65e:	4581                	li	a1,0
     660:	00001097          	auipc	ra,0x1
     664:	a4a080e7          	jalr	-1462(ra) # 10aa <memset>
  cmd->type = EXEC;
     668:	4785                	li	a5,1
     66a:	c09c                	sw	a5,0(s1)
  return (struct cmd*)cmd;
}
     66c:	8526                	mv	a0,s1
     66e:	60e2                	ld	ra,24(sp)
     670:	6442                	ld	s0,16(sp)
     672:	64a2                	ld	s1,8(sp)
     674:	6105                	addi	sp,sp,32
     676:	8082                	ret

0000000000000678 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     678:	7139                	addi	sp,sp,-64
     67a:	fc06                	sd	ra,56(sp)
     67c:	f822                	sd	s0,48(sp)
     67e:	f426                	sd	s1,40(sp)
     680:	f04a                	sd	s2,32(sp)
     682:	ec4e                	sd	s3,24(sp)
     684:	e852                	sd	s4,16(sp)
     686:	e456                	sd	s5,8(sp)
     688:	e05a                	sd	s6,0(sp)
     68a:	0080                	addi	s0,sp,64
     68c:	8b2a                	mv	s6,a0
     68e:	8aae                	mv	s5,a1
     690:	8a32                	mv	s4,a2
     692:	89b6                	mv	s3,a3
     694:	893a                	mv	s2,a4
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     696:	02800513          	li	a0,40
     69a:	00001097          	auipc	ra,0x1
     69e:	088080e7          	jalr	136(ra) # 1722 <malloc>
     6a2:	84aa                	mv	s1,a0
  memset(cmd, 0, sizeof(*cmd));
     6a4:	02800613          	li	a2,40
     6a8:	4581                	li	a1,0
     6aa:	00001097          	auipc	ra,0x1
     6ae:	a00080e7          	jalr	-1536(ra) # 10aa <memset>
  cmd->type = REDIR;
     6b2:	4789                	li	a5,2
     6b4:	c09c                	sw	a5,0(s1)
  cmd->cmd = subcmd;
     6b6:	0164b423          	sd	s6,8(s1)
  cmd->file = file;
     6ba:	0154b823          	sd	s5,16(s1)
  cmd->efile = efile;
     6be:	0144bc23          	sd	s4,24(s1)
  cmd->mode = mode;
     6c2:	0334a023          	sw	s3,32(s1)
  cmd->fd = fd;
     6c6:	0324a223          	sw	s2,36(s1)
  return (struct cmd*)cmd;
}
     6ca:	8526                	mv	a0,s1
     6cc:	70e2                	ld	ra,56(sp)
     6ce:	7442                	ld	s0,48(sp)
     6d0:	74a2                	ld	s1,40(sp)
     6d2:	7902                	ld	s2,32(sp)
     6d4:	69e2                	ld	s3,24(sp)
     6d6:	6a42                	ld	s4,16(sp)
     6d8:	6aa2                	ld	s5,8(sp)
     6da:	6b02                	ld	s6,0(sp)
     6dc:	6121                	addi	sp,sp,64
     6de:	8082                	ret

00000000000006e0 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     6e0:	7179                	addi	sp,sp,-48
     6e2:	f406                	sd	ra,40(sp)
     6e4:	f022                	sd	s0,32(sp)
     6e6:	ec26                	sd	s1,24(sp)
     6e8:	e84a                	sd	s2,16(sp)
     6ea:	e44e                	sd	s3,8(sp)
     6ec:	1800                	addi	s0,sp,48
     6ee:	89aa                	mv	s3,a0
     6f0:	892e                	mv	s2,a1
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     6f2:	4561                	li	a0,24
     6f4:	00001097          	auipc	ra,0x1
     6f8:	02e080e7          	jalr	46(ra) # 1722 <malloc>
     6fc:	84aa                	mv	s1,a0
  memset(cmd, 0, sizeof(*cmd));
     6fe:	4661                	li	a2,24
     700:	4581                	li	a1,0
     702:	00001097          	auipc	ra,0x1
     706:	9a8080e7          	jalr	-1624(ra) # 10aa <memset>
  cmd->type = PIPE;
     70a:	478d                	li	a5,3
     70c:	c09c                	sw	a5,0(s1)
  cmd->left = left;
     70e:	0134b423          	sd	s3,8(s1)
  cmd->right = right;
     712:	0124b823          	sd	s2,16(s1)
  return (struct cmd*)cmd;
}
     716:	8526                	mv	a0,s1
     718:	70a2                	ld	ra,40(sp)
     71a:	7402                	ld	s0,32(sp)
     71c:	64e2                	ld	s1,24(sp)
     71e:	6942                	ld	s2,16(sp)
     720:	69a2                	ld	s3,8(sp)
     722:	6145                	addi	sp,sp,48
     724:	8082                	ret

0000000000000726 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     726:	7179                	addi	sp,sp,-48
     728:	f406                	sd	ra,40(sp)
     72a:	f022                	sd	s0,32(sp)
     72c:	ec26                	sd	s1,24(sp)
     72e:	e84a                	sd	s2,16(sp)
     730:	e44e                	sd	s3,8(sp)
     732:	1800                	addi	s0,sp,48
     734:	89aa                	mv	s3,a0
     736:	892e                	mv	s2,a1
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     738:	4561                	li	a0,24
     73a:	00001097          	auipc	ra,0x1
     73e:	fe8080e7          	jalr	-24(ra) # 1722 <malloc>
     742:	84aa                	mv	s1,a0
  memset(cmd, 0, sizeof(*cmd));
     744:	4661                	li	a2,24
     746:	4581                	li	a1,0
     748:	00001097          	auipc	ra,0x1
     74c:	962080e7          	jalr	-1694(ra) # 10aa <memset>
  cmd->type = LIST;
     750:	4791                	li	a5,4
     752:	c09c                	sw	a5,0(s1)
  cmd->left = left;
     754:	0134b423          	sd	s3,8(s1)
  cmd->right = right;
     758:	0124b823          	sd	s2,16(s1)
  return (struct cmd*)cmd;
}
     75c:	8526                	mv	a0,s1
     75e:	70a2                	ld	ra,40(sp)
     760:	7402                	ld	s0,32(sp)
     762:	64e2                	ld	s1,24(sp)
     764:	6942                	ld	s2,16(sp)
     766:	69a2                	ld	s3,8(sp)
     768:	6145                	addi	sp,sp,48
     76a:	8082                	ret

000000000000076c <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     76c:	1101                	addi	sp,sp,-32
     76e:	ec06                	sd	ra,24(sp)
     770:	e822                	sd	s0,16(sp)
     772:	e426                	sd	s1,8(sp)
     774:	e04a                	sd	s2,0(sp)
     776:	1000                	addi	s0,sp,32
     778:	892a                	mv	s2,a0
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     77a:	4541                	li	a0,16
     77c:	00001097          	auipc	ra,0x1
     780:	fa6080e7          	jalr	-90(ra) # 1722 <malloc>
     784:	84aa                	mv	s1,a0
  memset(cmd, 0, sizeof(*cmd));
     786:	4641                	li	a2,16
     788:	4581                	li	a1,0
     78a:	00001097          	auipc	ra,0x1
     78e:	920080e7          	jalr	-1760(ra) # 10aa <memset>
  cmd->type = BACK;
     792:	4795                	li	a5,5
     794:	c09c                	sw	a5,0(s1)
  cmd->cmd = subcmd;
     796:	0124b423          	sd	s2,8(s1)
  return (struct cmd*)cmd;
}
     79a:	8526                	mv	a0,s1
     79c:	60e2                	ld	ra,24(sp)
     79e:	6442                	ld	s0,16(sp)
     7a0:	64a2                	ld	s1,8(sp)
     7a2:	6902                	ld	s2,0(sp)
     7a4:	6105                	addi	sp,sp,32
     7a6:	8082                	ret

00000000000007a8 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     7a8:	7139                	addi	sp,sp,-64
     7aa:	fc06                	sd	ra,56(sp)
     7ac:	f822                	sd	s0,48(sp)
     7ae:	f426                	sd	s1,40(sp)
     7b0:	f04a                	sd	s2,32(sp)
     7b2:	ec4e                	sd	s3,24(sp)
     7b4:	e852                	sd	s4,16(sp)
     7b6:	e456                	sd	s5,8(sp)
     7b8:	e05a                	sd	s6,0(sp)
     7ba:	0080                	addi	s0,sp,64
     7bc:	8a2a                	mv	s4,a0
     7be:	892e                	mv	s2,a1
     7c0:	8ab2                	mv	s5,a2
     7c2:	8b36                	mv	s6,a3
  char *s;
  int ret;

  s = *ps;
     7c4:	6104                	ld	s1,0(a0)
  while(s < es && strchr(whitespace, *s))
     7c6:	00001997          	auipc	s3,0x1
     7ca:	24a98993          	addi	s3,s3,586 # 1a10 <whitespace>
     7ce:	00b4fd63          	bgeu	s1,a1,7e8 <gettoken+0x40>
     7d2:	0004c583          	lbu	a1,0(s1)
     7d6:	854e                	mv	a0,s3
     7d8:	00001097          	auipc	ra,0x1
     7dc:	8f8080e7          	jalr	-1800(ra) # 10d0 <strchr>
     7e0:	c501                	beqz	a0,7e8 <gettoken+0x40>
    s++;
     7e2:	0485                	addi	s1,s1,1
  while(s < es && strchr(whitespace, *s))
     7e4:	fe9917e3          	bne	s2,s1,7d2 <gettoken+0x2a>
  if(q)
     7e8:	000a8463          	beqz	s5,7f0 <gettoken+0x48>
    *q = s;
     7ec:	009ab023          	sd	s1,0(s5)
  ret = *s;
     7f0:	0004c783          	lbu	a5,0(s1)
     7f4:	00078a9b          	sext.w	s5,a5
  switch(*s){
     7f8:	03c00713          	li	a4,60
     7fc:	06f76563          	bltu	a4,a5,866 <gettoken+0xbe>
     800:	03a00713          	li	a4,58
     804:	00f76e63          	bltu	a4,a5,820 <gettoken+0x78>
     808:	cf89                	beqz	a5,822 <gettoken+0x7a>
     80a:	02600713          	li	a4,38
     80e:	00e78963          	beq	a5,a4,820 <gettoken+0x78>
     812:	fd87879b          	addiw	a5,a5,-40
     816:	0ff7f793          	andi	a5,a5,255
     81a:	4705                	li	a4,1
     81c:	06f76c63          	bltu	a4,a5,894 <gettoken+0xec>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
     820:	0485                	addi	s1,s1,1
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     822:	000b0463          	beqz	s6,82a <gettoken+0x82>
    *eq = s;
     826:	009b3023          	sd	s1,0(s6)

  while(s < es && strchr(whitespace, *s))
     82a:	00001997          	auipc	s3,0x1
     82e:	1e698993          	addi	s3,s3,486 # 1a10 <whitespace>
     832:	0124fd63          	bgeu	s1,s2,84c <gettoken+0xa4>
     836:	0004c583          	lbu	a1,0(s1)
     83a:	854e                	mv	a0,s3
     83c:	00001097          	auipc	ra,0x1
     840:	894080e7          	jalr	-1900(ra) # 10d0 <strchr>
     844:	c501                	beqz	a0,84c <gettoken+0xa4>
    s++;
     846:	0485                	addi	s1,s1,1
  while(s < es && strchr(whitespace, *s))
     848:	fe9917e3          	bne	s2,s1,836 <gettoken+0x8e>
  *ps = s;
     84c:	009a3023          	sd	s1,0(s4)
  return ret;
}
     850:	8556                	mv	a0,s5
     852:	70e2                	ld	ra,56(sp)
     854:	7442                	ld	s0,48(sp)
     856:	74a2                	ld	s1,40(sp)
     858:	7902                	ld	s2,32(sp)
     85a:	69e2                	ld	s3,24(sp)
     85c:	6a42                	ld	s4,16(sp)
     85e:	6aa2                	ld	s5,8(sp)
     860:	6b02                	ld	s6,0(sp)
     862:	6121                	addi	sp,sp,64
     864:	8082                	ret
  switch(*s){
     866:	03e00713          	li	a4,62
     86a:	02e79163          	bne	a5,a4,88c <gettoken+0xe4>
    s++;
     86e:	00148693          	addi	a3,s1,1
    if(*s == '>'){
     872:	0014c703          	lbu	a4,1(s1)
     876:	03e00793          	li	a5,62
      s++;
     87a:	0489                	addi	s1,s1,2
      ret = '+';
     87c:	02b00a93          	li	s5,43
    if(*s == '>'){
     880:	faf701e3          	beq	a4,a5,822 <gettoken+0x7a>
    s++;
     884:	84b6                	mv	s1,a3
  ret = *s;
     886:	03e00a93          	li	s5,62
     88a:	bf61                	j	822 <gettoken+0x7a>
  switch(*s){
     88c:	07c00713          	li	a4,124
     890:	f8e788e3          	beq	a5,a4,820 <gettoken+0x78>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     894:	00001997          	auipc	s3,0x1
     898:	17c98993          	addi	s3,s3,380 # 1a10 <whitespace>
     89c:	00001a97          	auipc	s5,0x1
     8a0:	16ca8a93          	addi	s5,s5,364 # 1a08 <symbols>
     8a4:	0324f563          	bgeu	s1,s2,8ce <gettoken+0x126>
     8a8:	0004c583          	lbu	a1,0(s1)
     8ac:	854e                	mv	a0,s3
     8ae:	00001097          	auipc	ra,0x1
     8b2:	822080e7          	jalr	-2014(ra) # 10d0 <strchr>
     8b6:	e505                	bnez	a0,8de <gettoken+0x136>
     8b8:	0004c583          	lbu	a1,0(s1)
     8bc:	8556                	mv	a0,s5
     8be:	00001097          	auipc	ra,0x1
     8c2:	812080e7          	jalr	-2030(ra) # 10d0 <strchr>
     8c6:	e909                	bnez	a0,8d8 <gettoken+0x130>
      s++;
     8c8:	0485                	addi	s1,s1,1
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     8ca:	fc991fe3          	bne	s2,s1,8a8 <gettoken+0x100>
  if(eq)
     8ce:	06100a93          	li	s5,97
     8d2:	f40b1ae3          	bnez	s6,826 <gettoken+0x7e>
     8d6:	bf9d                	j	84c <gettoken+0xa4>
    ret = 'a';
     8d8:	06100a93          	li	s5,97
     8dc:	b799                	j	822 <gettoken+0x7a>
     8de:	06100a93          	li	s5,97
     8e2:	b781                	j	822 <gettoken+0x7a>

00000000000008e4 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     8e4:	7139                	addi	sp,sp,-64
     8e6:	fc06                	sd	ra,56(sp)
     8e8:	f822                	sd	s0,48(sp)
     8ea:	f426                	sd	s1,40(sp)
     8ec:	f04a                	sd	s2,32(sp)
     8ee:	ec4e                	sd	s3,24(sp)
     8f0:	e852                	sd	s4,16(sp)
     8f2:	e456                	sd	s5,8(sp)
     8f4:	0080                	addi	s0,sp,64
     8f6:	8a2a                	mv	s4,a0
     8f8:	892e                	mv	s2,a1
     8fa:	8ab2                	mv	s5,a2
  char *s;

  s = *ps;
     8fc:	6104                	ld	s1,0(a0)
  while(s < es && strchr(whitespace, *s))
     8fe:	00001997          	auipc	s3,0x1
     902:	11298993          	addi	s3,s3,274 # 1a10 <whitespace>
     906:	00b4fd63          	bgeu	s1,a1,920 <peek+0x3c>
     90a:	0004c583          	lbu	a1,0(s1)
     90e:	854e                	mv	a0,s3
     910:	00000097          	auipc	ra,0x0
     914:	7c0080e7          	jalr	1984(ra) # 10d0 <strchr>
     918:	c501                	beqz	a0,920 <peek+0x3c>
    s++;
     91a:	0485                	addi	s1,s1,1
  while(s < es && strchr(whitespace, *s))
     91c:	fe9917e3          	bne	s2,s1,90a <peek+0x26>
  *ps = s;
     920:	009a3023          	sd	s1,0(s4)
  return *s && strchr(toks, *s);
     924:	0004c583          	lbu	a1,0(s1)
     928:	4501                	li	a0,0
     92a:	e991                	bnez	a1,93e <peek+0x5a>
}
     92c:	70e2                	ld	ra,56(sp)
     92e:	7442                	ld	s0,48(sp)
     930:	74a2                	ld	s1,40(sp)
     932:	7902                	ld	s2,32(sp)
     934:	69e2                	ld	s3,24(sp)
     936:	6a42                	ld	s4,16(sp)
     938:	6aa2                	ld	s5,8(sp)
     93a:	6121                	addi	sp,sp,64
     93c:	8082                	ret
  return *s && strchr(toks, *s);
     93e:	8556                	mv	a0,s5
     940:	00000097          	auipc	ra,0x0
     944:	790080e7          	jalr	1936(ra) # 10d0 <strchr>
     948:	00a03533          	snez	a0,a0
     94c:	b7c5                	j	92c <peek+0x48>

000000000000094e <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     94e:	7159                	addi	sp,sp,-112
     950:	f486                	sd	ra,104(sp)
     952:	f0a2                	sd	s0,96(sp)
     954:	eca6                	sd	s1,88(sp)
     956:	e8ca                	sd	s2,80(sp)
     958:	e4ce                	sd	s3,72(sp)
     95a:	e0d2                	sd	s4,64(sp)
     95c:	fc56                	sd	s5,56(sp)
     95e:	f85a                	sd	s6,48(sp)
     960:	f45e                	sd	s7,40(sp)
     962:	f062                	sd	s8,32(sp)
     964:	ec66                	sd	s9,24(sp)
     966:	1880                	addi	s0,sp,112
     968:	8a2a                	mv	s4,a0
     96a:	89ae                	mv	s3,a1
     96c:	8932                	mv	s2,a2
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     96e:	00001b97          	auipc	s7,0x1
     972:	f62b8b93          	addi	s7,s7,-158 # 18d0 <malloc+0x1ae>
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
     976:	06100c13          	li	s8,97
      panic("missing file for redirection");
    switch(tok){
     97a:	03c00c93          	li	s9,60
  while(peek(ps, es, "<>")){
     97e:	a02d                	j	9a8 <parseredirs+0x5a>
      panic("missing file for redirection");
     980:	00001517          	auipc	a0,0x1
     984:	f3050513          	addi	a0,a0,-208 # 18b0 <malloc+0x18e>
     988:	00000097          	auipc	ra,0x0
     98c:	a10080e7          	jalr	-1520(ra) # 398 <panic>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     990:	4701                	li	a4,0
     992:	4681                	li	a3,0
     994:	f9043603          	ld	a2,-112(s0)
     998:	f9843583          	ld	a1,-104(s0)
     99c:	8552                	mv	a0,s4
     99e:	00000097          	auipc	ra,0x0
     9a2:	cda080e7          	jalr	-806(ra) # 678 <redircmd>
     9a6:	8a2a                	mv	s4,a0
    switch(tok){
     9a8:	03e00b13          	li	s6,62
     9ac:	02b00a93          	li	s5,43
  while(peek(ps, es, "<>")){
     9b0:	865e                	mv	a2,s7
     9b2:	85ca                	mv	a1,s2
     9b4:	854e                	mv	a0,s3
     9b6:	00000097          	auipc	ra,0x0
     9ba:	f2e080e7          	jalr	-210(ra) # 8e4 <peek>
     9be:	c925                	beqz	a0,a2e <parseredirs+0xe0>
    tok = gettoken(ps, es, 0, 0);
     9c0:	4681                	li	a3,0
     9c2:	4601                	li	a2,0
     9c4:	85ca                	mv	a1,s2
     9c6:	854e                	mv	a0,s3
     9c8:	00000097          	auipc	ra,0x0
     9cc:	de0080e7          	jalr	-544(ra) # 7a8 <gettoken>
     9d0:	84aa                	mv	s1,a0
    if(gettoken(ps, es, &q, &eq) != 'a')
     9d2:	f9040693          	addi	a3,s0,-112
     9d6:	f9840613          	addi	a2,s0,-104
     9da:	85ca                	mv	a1,s2
     9dc:	854e                	mv	a0,s3
     9de:	00000097          	auipc	ra,0x0
     9e2:	dca080e7          	jalr	-566(ra) # 7a8 <gettoken>
     9e6:	f9851de3          	bne	a0,s8,980 <parseredirs+0x32>
    switch(tok){
     9ea:	fb9483e3          	beq	s1,s9,990 <parseredirs+0x42>
     9ee:	03648263          	beq	s1,s6,a12 <parseredirs+0xc4>
     9f2:	fb549fe3          	bne	s1,s5,9b0 <parseredirs+0x62>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE|O_TRUNC, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE|O_APPEND, 1);
     9f6:	4705                	li	a4,1
     9f8:	20500693          	li	a3,517
     9fc:	f9043603          	ld	a2,-112(s0)
     a00:	f9843583          	ld	a1,-104(s0)
     a04:	8552                	mv	a0,s4
     a06:	00000097          	auipc	ra,0x0
     a0a:	c72080e7          	jalr	-910(ra) # 678 <redircmd>
     a0e:	8a2a                	mv	s4,a0
      break;
     a10:	bf61                	j	9a8 <parseredirs+0x5a>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE|O_TRUNC, 1);
     a12:	4705                	li	a4,1
     a14:	60100693          	li	a3,1537
     a18:	f9043603          	ld	a2,-112(s0)
     a1c:	f9843583          	ld	a1,-104(s0)
     a20:	8552                	mv	a0,s4
     a22:	00000097          	auipc	ra,0x0
     a26:	c56080e7          	jalr	-938(ra) # 678 <redircmd>
     a2a:	8a2a                	mv	s4,a0
      break;
     a2c:	bfb5                	j	9a8 <parseredirs+0x5a>
    }
  }
  return cmd;
}
     a2e:	8552                	mv	a0,s4
     a30:	70a6                	ld	ra,104(sp)
     a32:	7406                	ld	s0,96(sp)
     a34:	64e6                	ld	s1,88(sp)
     a36:	6946                	ld	s2,80(sp)
     a38:	69a6                	ld	s3,72(sp)
     a3a:	6a06                	ld	s4,64(sp)
     a3c:	7ae2                	ld	s5,56(sp)
     a3e:	7b42                	ld	s6,48(sp)
     a40:	7ba2                	ld	s7,40(sp)
     a42:	7c02                	ld	s8,32(sp)
     a44:	6ce2                	ld	s9,24(sp)
     a46:	6165                	addi	sp,sp,112
     a48:	8082                	ret

0000000000000a4a <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     a4a:	7159                	addi	sp,sp,-112
     a4c:	f486                	sd	ra,104(sp)
     a4e:	f0a2                	sd	s0,96(sp)
     a50:	eca6                	sd	s1,88(sp)
     a52:	e8ca                	sd	s2,80(sp)
     a54:	e4ce                	sd	s3,72(sp)
     a56:	e0d2                	sd	s4,64(sp)
     a58:	fc56                	sd	s5,56(sp)
     a5a:	f85a                	sd	s6,48(sp)
     a5c:	f45e                	sd	s7,40(sp)
     a5e:	f062                	sd	s8,32(sp)
     a60:	ec66                	sd	s9,24(sp)
     a62:	1880                	addi	s0,sp,112
     a64:	8a2a                	mv	s4,a0
     a66:	8aae                	mv	s5,a1
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     a68:	00001617          	auipc	a2,0x1
     a6c:	e7060613          	addi	a2,a2,-400 # 18d8 <malloc+0x1b6>
     a70:	00000097          	auipc	ra,0x0
     a74:	e74080e7          	jalr	-396(ra) # 8e4 <peek>
     a78:	e905                	bnez	a0,aa8 <parseexec+0x5e>
     a7a:	89aa                	mv	s3,a0
    return parseblock(ps, es);

  ret = execcmd();
     a7c:	00000097          	auipc	ra,0x0
     a80:	bc6080e7          	jalr	-1082(ra) # 642 <execcmd>
     a84:	8c2a                	mv	s8,a0
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     a86:	8656                	mv	a2,s5
     a88:	85d2                	mv	a1,s4
     a8a:	00000097          	auipc	ra,0x0
     a8e:	ec4080e7          	jalr	-316(ra) # 94e <parseredirs>
     a92:	84aa                	mv	s1,a0
  while(!peek(ps, es, "|)&;")){
     a94:	008c0913          	addi	s2,s8,8
     a98:	00001b17          	auipc	s6,0x1
     a9c:	e60b0b13          	addi	s6,s6,-416 # 18f8 <malloc+0x1d6>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
     aa0:	06100c93          	li	s9,97
      panic("syntax");
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
     aa4:	4ba9                	li	s7,10
  while(!peek(ps, es, "|)&;")){
     aa6:	a0b1                	j	af2 <parseexec+0xa8>
    return parseblock(ps, es);
     aa8:	85d6                	mv	a1,s5
     aaa:	8552                	mv	a0,s4
     aac:	00000097          	auipc	ra,0x0
     ab0:	1bc080e7          	jalr	444(ra) # c68 <parseblock>
     ab4:	84aa                	mv	s1,a0
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     ab6:	8526                	mv	a0,s1
     ab8:	70a6                	ld	ra,104(sp)
     aba:	7406                	ld	s0,96(sp)
     abc:	64e6                	ld	s1,88(sp)
     abe:	6946                	ld	s2,80(sp)
     ac0:	69a6                	ld	s3,72(sp)
     ac2:	6a06                	ld	s4,64(sp)
     ac4:	7ae2                	ld	s5,56(sp)
     ac6:	7b42                	ld	s6,48(sp)
     ac8:	7ba2                	ld	s7,40(sp)
     aca:	7c02                	ld	s8,32(sp)
     acc:	6ce2                	ld	s9,24(sp)
     ace:	6165                	addi	sp,sp,112
     ad0:	8082                	ret
      panic("syntax");
     ad2:	00001517          	auipc	a0,0x1
     ad6:	e0e50513          	addi	a0,a0,-498 # 18e0 <malloc+0x1be>
     ada:	00000097          	auipc	ra,0x0
     ade:	8be080e7          	jalr	-1858(ra) # 398 <panic>
    ret = parseredirs(ret, ps, es);
     ae2:	8656                	mv	a2,s5
     ae4:	85d2                	mv	a1,s4
     ae6:	8526                	mv	a0,s1
     ae8:	00000097          	auipc	ra,0x0
     aec:	e66080e7          	jalr	-410(ra) # 94e <parseredirs>
     af0:	84aa                	mv	s1,a0
  while(!peek(ps, es, "|)&;")){
     af2:	865a                	mv	a2,s6
     af4:	85d6                	mv	a1,s5
     af6:	8552                	mv	a0,s4
     af8:	00000097          	auipc	ra,0x0
     afc:	dec080e7          	jalr	-532(ra) # 8e4 <peek>
     b00:	e131                	bnez	a0,b44 <parseexec+0xfa>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     b02:	f9040693          	addi	a3,s0,-112
     b06:	f9840613          	addi	a2,s0,-104
     b0a:	85d6                	mv	a1,s5
     b0c:	8552                	mv	a0,s4
     b0e:	00000097          	auipc	ra,0x0
     b12:	c9a080e7          	jalr	-870(ra) # 7a8 <gettoken>
     b16:	c51d                	beqz	a0,b44 <parseexec+0xfa>
    if(tok != 'a')
     b18:	fb951de3          	bne	a0,s9,ad2 <parseexec+0x88>
    cmd->argv[argc] = q;
     b1c:	f9843783          	ld	a5,-104(s0)
     b20:	00f93023          	sd	a5,0(s2)
    cmd->eargv[argc] = eq;
     b24:	f9043783          	ld	a5,-112(s0)
     b28:	04f93823          	sd	a5,80(s2)
    argc++;
     b2c:	2985                	addiw	s3,s3,1
    if(argc >= MAXARGS)
     b2e:	0921                	addi	s2,s2,8
     b30:	fb7999e3          	bne	s3,s7,ae2 <parseexec+0x98>
      panic("too many args");
     b34:	00001517          	auipc	a0,0x1
     b38:	db450513          	addi	a0,a0,-588 # 18e8 <malloc+0x1c6>
     b3c:	00000097          	auipc	ra,0x0
     b40:	85c080e7          	jalr	-1956(ra) # 398 <panic>
  cmd->argv[argc] = 0;
     b44:	098e                	slli	s3,s3,0x3
     b46:	99e2                	add	s3,s3,s8
     b48:	0009b423          	sd	zero,8(s3)
  cmd->eargv[argc] = 0;
     b4c:	0409bc23          	sd	zero,88(s3)
  return ret;
     b50:	b79d                	j	ab6 <parseexec+0x6c>

0000000000000b52 <parsepipe>:
{
     b52:	7179                	addi	sp,sp,-48
     b54:	f406                	sd	ra,40(sp)
     b56:	f022                	sd	s0,32(sp)
     b58:	ec26                	sd	s1,24(sp)
     b5a:	e84a                	sd	s2,16(sp)
     b5c:	e44e                	sd	s3,8(sp)
     b5e:	1800                	addi	s0,sp,48
     b60:	892a                	mv	s2,a0
     b62:	89ae                	mv	s3,a1
  cmd = parseexec(ps, es);
     b64:	00000097          	auipc	ra,0x0
     b68:	ee6080e7          	jalr	-282(ra) # a4a <parseexec>
     b6c:	84aa                	mv	s1,a0
  if(peek(ps, es, "|")){
     b6e:	00001617          	auipc	a2,0x1
     b72:	d9260613          	addi	a2,a2,-622 # 1900 <malloc+0x1de>
     b76:	85ce                	mv	a1,s3
     b78:	854a                	mv	a0,s2
     b7a:	00000097          	auipc	ra,0x0
     b7e:	d6a080e7          	jalr	-662(ra) # 8e4 <peek>
     b82:	e909                	bnez	a0,b94 <parsepipe+0x42>
}
     b84:	8526                	mv	a0,s1
     b86:	70a2                	ld	ra,40(sp)
     b88:	7402                	ld	s0,32(sp)
     b8a:	64e2                	ld	s1,24(sp)
     b8c:	6942                	ld	s2,16(sp)
     b8e:	69a2                	ld	s3,8(sp)
     b90:	6145                	addi	sp,sp,48
     b92:	8082                	ret
    gettoken(ps, es, 0, 0);
     b94:	4681                	li	a3,0
     b96:	4601                	li	a2,0
     b98:	85ce                	mv	a1,s3
     b9a:	854a                	mv	a0,s2
     b9c:	00000097          	auipc	ra,0x0
     ba0:	c0c080e7          	jalr	-1012(ra) # 7a8 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     ba4:	85ce                	mv	a1,s3
     ba6:	854a                	mv	a0,s2
     ba8:	00000097          	auipc	ra,0x0
     bac:	faa080e7          	jalr	-86(ra) # b52 <parsepipe>
     bb0:	85aa                	mv	a1,a0
     bb2:	8526                	mv	a0,s1
     bb4:	00000097          	auipc	ra,0x0
     bb8:	b2c080e7          	jalr	-1236(ra) # 6e0 <pipecmd>
     bbc:	84aa                	mv	s1,a0
  return cmd;
     bbe:	b7d9                	j	b84 <parsepipe+0x32>

0000000000000bc0 <parseline>:
{
     bc0:	7179                	addi	sp,sp,-48
     bc2:	f406                	sd	ra,40(sp)
     bc4:	f022                	sd	s0,32(sp)
     bc6:	ec26                	sd	s1,24(sp)
     bc8:	e84a                	sd	s2,16(sp)
     bca:	e44e                	sd	s3,8(sp)
     bcc:	e052                	sd	s4,0(sp)
     bce:	1800                	addi	s0,sp,48
     bd0:	892a                	mv	s2,a0
     bd2:	89ae                	mv	s3,a1
  cmd = parsepipe(ps, es);
     bd4:	00000097          	auipc	ra,0x0
     bd8:	f7e080e7          	jalr	-130(ra) # b52 <parsepipe>
     bdc:	84aa                	mv	s1,a0
  while(peek(ps, es, "&")){
     bde:	00001a17          	auipc	s4,0x1
     be2:	d2aa0a13          	addi	s4,s4,-726 # 1908 <malloc+0x1e6>
     be6:	8652                	mv	a2,s4
     be8:	85ce                	mv	a1,s3
     bea:	854a                	mv	a0,s2
     bec:	00000097          	auipc	ra,0x0
     bf0:	cf8080e7          	jalr	-776(ra) # 8e4 <peek>
     bf4:	c105                	beqz	a0,c14 <parseline+0x54>
    gettoken(ps, es, 0, 0);
     bf6:	4681                	li	a3,0
     bf8:	4601                	li	a2,0
     bfa:	85ce                	mv	a1,s3
     bfc:	854a                	mv	a0,s2
     bfe:	00000097          	auipc	ra,0x0
     c02:	baa080e7          	jalr	-1110(ra) # 7a8 <gettoken>
    cmd = backcmd(cmd);
     c06:	8526                	mv	a0,s1
     c08:	00000097          	auipc	ra,0x0
     c0c:	b64080e7          	jalr	-1180(ra) # 76c <backcmd>
     c10:	84aa                	mv	s1,a0
     c12:	bfd1                	j	be6 <parseline+0x26>
  if(peek(ps, es, ";")){
     c14:	00001617          	auipc	a2,0x1
     c18:	cfc60613          	addi	a2,a2,-772 # 1910 <malloc+0x1ee>
     c1c:	85ce                	mv	a1,s3
     c1e:	854a                	mv	a0,s2
     c20:	00000097          	auipc	ra,0x0
     c24:	cc4080e7          	jalr	-828(ra) # 8e4 <peek>
     c28:	e911                	bnez	a0,c3c <parseline+0x7c>
}
     c2a:	8526                	mv	a0,s1
     c2c:	70a2                	ld	ra,40(sp)
     c2e:	7402                	ld	s0,32(sp)
     c30:	64e2                	ld	s1,24(sp)
     c32:	6942                	ld	s2,16(sp)
     c34:	69a2                	ld	s3,8(sp)
     c36:	6a02                	ld	s4,0(sp)
     c38:	6145                	addi	sp,sp,48
     c3a:	8082                	ret
    gettoken(ps, es, 0, 0);
     c3c:	4681                	li	a3,0
     c3e:	4601                	li	a2,0
     c40:	85ce                	mv	a1,s3
     c42:	854a                	mv	a0,s2
     c44:	00000097          	auipc	ra,0x0
     c48:	b64080e7          	jalr	-1180(ra) # 7a8 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     c4c:	85ce                	mv	a1,s3
     c4e:	854a                	mv	a0,s2
     c50:	00000097          	auipc	ra,0x0
     c54:	f70080e7          	jalr	-144(ra) # bc0 <parseline>
     c58:	85aa                	mv	a1,a0
     c5a:	8526                	mv	a0,s1
     c5c:	00000097          	auipc	ra,0x0
     c60:	aca080e7          	jalr	-1334(ra) # 726 <listcmd>
     c64:	84aa                	mv	s1,a0
  return cmd;
     c66:	b7d1                	j	c2a <parseline+0x6a>

0000000000000c68 <parseblock>:
{
     c68:	7179                	addi	sp,sp,-48
     c6a:	f406                	sd	ra,40(sp)
     c6c:	f022                	sd	s0,32(sp)
     c6e:	ec26                	sd	s1,24(sp)
     c70:	e84a                	sd	s2,16(sp)
     c72:	e44e                	sd	s3,8(sp)
     c74:	1800                	addi	s0,sp,48
     c76:	84aa                	mv	s1,a0
     c78:	892e                	mv	s2,a1
  if(!peek(ps, es, "("))
     c7a:	00001617          	auipc	a2,0x1
     c7e:	c5e60613          	addi	a2,a2,-930 # 18d8 <malloc+0x1b6>
     c82:	00000097          	auipc	ra,0x0
     c86:	c62080e7          	jalr	-926(ra) # 8e4 <peek>
     c8a:	c12d                	beqz	a0,cec <parseblock+0x84>
  gettoken(ps, es, 0, 0);
     c8c:	4681                	li	a3,0
     c8e:	4601                	li	a2,0
     c90:	85ca                	mv	a1,s2
     c92:	8526                	mv	a0,s1
     c94:	00000097          	auipc	ra,0x0
     c98:	b14080e7          	jalr	-1260(ra) # 7a8 <gettoken>
  cmd = parseline(ps, es);
     c9c:	85ca                	mv	a1,s2
     c9e:	8526                	mv	a0,s1
     ca0:	00000097          	auipc	ra,0x0
     ca4:	f20080e7          	jalr	-224(ra) # bc0 <parseline>
     ca8:	89aa                	mv	s3,a0
  if(!peek(ps, es, ")"))
     caa:	00001617          	auipc	a2,0x1
     cae:	c7e60613          	addi	a2,a2,-898 # 1928 <malloc+0x206>
     cb2:	85ca                	mv	a1,s2
     cb4:	8526                	mv	a0,s1
     cb6:	00000097          	auipc	ra,0x0
     cba:	c2e080e7          	jalr	-978(ra) # 8e4 <peek>
     cbe:	cd1d                	beqz	a0,cfc <parseblock+0x94>
  gettoken(ps, es, 0, 0);
     cc0:	4681                	li	a3,0
     cc2:	4601                	li	a2,0
     cc4:	85ca                	mv	a1,s2
     cc6:	8526                	mv	a0,s1
     cc8:	00000097          	auipc	ra,0x0
     ccc:	ae0080e7          	jalr	-1312(ra) # 7a8 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     cd0:	864a                	mv	a2,s2
     cd2:	85a6                	mv	a1,s1
     cd4:	854e                	mv	a0,s3
     cd6:	00000097          	auipc	ra,0x0
     cda:	c78080e7          	jalr	-904(ra) # 94e <parseredirs>
}
     cde:	70a2                	ld	ra,40(sp)
     ce0:	7402                	ld	s0,32(sp)
     ce2:	64e2                	ld	s1,24(sp)
     ce4:	6942                	ld	s2,16(sp)
     ce6:	69a2                	ld	s3,8(sp)
     ce8:	6145                	addi	sp,sp,48
     cea:	8082                	ret
    panic("parseblock");
     cec:	00001517          	auipc	a0,0x1
     cf0:	c2c50513          	addi	a0,a0,-980 # 1918 <malloc+0x1f6>
     cf4:	fffff097          	auipc	ra,0xfffff
     cf8:	6a4080e7          	jalr	1700(ra) # 398 <panic>
    panic("syntax - missing )");
     cfc:	00001517          	auipc	a0,0x1
     d00:	c3450513          	addi	a0,a0,-972 # 1930 <malloc+0x20e>
     d04:	fffff097          	auipc	ra,0xfffff
     d08:	694080e7          	jalr	1684(ra) # 398 <panic>

0000000000000d0c <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     d0c:	1101                	addi	sp,sp,-32
     d0e:	ec06                	sd	ra,24(sp)
     d10:	e822                	sd	s0,16(sp)
     d12:	e426                	sd	s1,8(sp)
     d14:	1000                	addi	s0,sp,32
     d16:	84aa                	mv	s1,a0
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     d18:	c521                	beqz	a0,d60 <nulterminate+0x54>
    return 0;

  switch(cmd->type){
     d1a:	4118                	lw	a4,0(a0)
     d1c:	4795                	li	a5,5
     d1e:	04e7e163          	bltu	a5,a4,d60 <nulterminate+0x54>
     d22:	00056783          	lwu	a5,0(a0)
     d26:	078a                	slli	a5,a5,0x2
     d28:	00001717          	auipc	a4,0x1
     d2c:	ca870713          	addi	a4,a4,-856 # 19d0 <malloc+0x2ae>
     d30:	97ba                	add	a5,a5,a4
     d32:	439c                	lw	a5,0(a5)
     d34:	97ba                	add	a5,a5,a4
     d36:	8782                	jr	a5
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     d38:	651c                	ld	a5,8(a0)
     d3a:	c39d                	beqz	a5,d60 <nulterminate+0x54>
     d3c:	01050793          	addi	a5,a0,16
      *ecmd->eargv[i] = 0;
     d40:	67b8                	ld	a4,72(a5)
     d42:	00070023          	sb	zero,0(a4)
    for(i=0; ecmd->argv[i]; i++)
     d46:	07a1                	addi	a5,a5,8
     d48:	ff87b703          	ld	a4,-8(a5)
     d4c:	fb75                	bnez	a4,d40 <nulterminate+0x34>
     d4e:	a809                	j	d60 <nulterminate+0x54>
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
     d50:	6508                	ld	a0,8(a0)
     d52:	00000097          	auipc	ra,0x0
     d56:	fba080e7          	jalr	-70(ra) # d0c <nulterminate>
    *rcmd->efile = 0;
     d5a:	6c9c                	ld	a5,24(s1)
     d5c:	00078023          	sb	zero,0(a5)
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
     d60:	8526                	mv	a0,s1
     d62:	60e2                	ld	ra,24(sp)
     d64:	6442                	ld	s0,16(sp)
     d66:	64a2                	ld	s1,8(sp)
     d68:	6105                	addi	sp,sp,32
     d6a:	8082                	ret
    nulterminate(pcmd->left);
     d6c:	6508                	ld	a0,8(a0)
     d6e:	00000097          	auipc	ra,0x0
     d72:	f9e080e7          	jalr	-98(ra) # d0c <nulterminate>
    nulterminate(pcmd->right);
     d76:	6888                	ld	a0,16(s1)
     d78:	00000097          	auipc	ra,0x0
     d7c:	f94080e7          	jalr	-108(ra) # d0c <nulterminate>
    break;
     d80:	b7c5                	j	d60 <nulterminate+0x54>
    nulterminate(lcmd->left);
     d82:	6508                	ld	a0,8(a0)
     d84:	00000097          	auipc	ra,0x0
     d88:	f88080e7          	jalr	-120(ra) # d0c <nulterminate>
    nulterminate(lcmd->right);
     d8c:	6888                	ld	a0,16(s1)
     d8e:	00000097          	auipc	ra,0x0
     d92:	f7e080e7          	jalr	-130(ra) # d0c <nulterminate>
    break;
     d96:	b7e9                	j	d60 <nulterminate+0x54>
    nulterminate(bcmd->cmd);
     d98:	6508                	ld	a0,8(a0)
     d9a:	00000097          	auipc	ra,0x0
     d9e:	f72080e7          	jalr	-142(ra) # d0c <nulterminate>
    break;
     da2:	bf7d                	j	d60 <nulterminate+0x54>

0000000000000da4 <parsecmd>:
{
     da4:	7179                	addi	sp,sp,-48
     da6:	f406                	sd	ra,40(sp)
     da8:	f022                	sd	s0,32(sp)
     daa:	ec26                	sd	s1,24(sp)
     dac:	e84a                	sd	s2,16(sp)
     dae:	1800                	addi	s0,sp,48
     db0:	fca43c23          	sd	a0,-40(s0)
  es = s + strlen(s);
     db4:	84aa                	mv	s1,a0
     db6:	00000097          	auipc	ra,0x0
     dba:	2ca080e7          	jalr	714(ra) # 1080 <strlen>
     dbe:	1502                	slli	a0,a0,0x20
     dc0:	9101                	srli	a0,a0,0x20
     dc2:	94aa                	add	s1,s1,a0
  cmd = parseline(&s, es);
     dc4:	85a6                	mv	a1,s1
     dc6:	fd840513          	addi	a0,s0,-40
     dca:	00000097          	auipc	ra,0x0
     dce:	df6080e7          	jalr	-522(ra) # bc0 <parseline>
     dd2:	892a                	mv	s2,a0
  peek(&s, es, "");
     dd4:	00001617          	auipc	a2,0x1
     dd8:	bcc60613          	addi	a2,a2,-1076 # 19a0 <malloc+0x27e>
     ddc:	85a6                	mv	a1,s1
     dde:	fd840513          	addi	a0,s0,-40
     de2:	00000097          	auipc	ra,0x0
     de6:	b02080e7          	jalr	-1278(ra) # 8e4 <peek>
  if(s != es){
     dea:	fd843603          	ld	a2,-40(s0)
     dee:	00961e63          	bne	a2,s1,e0a <parsecmd+0x66>
  nulterminate(cmd);
     df2:	854a                	mv	a0,s2
     df4:	00000097          	auipc	ra,0x0
     df8:	f18080e7          	jalr	-232(ra) # d0c <nulterminate>
}
     dfc:	854a                	mv	a0,s2
     dfe:	70a2                	ld	ra,40(sp)
     e00:	7402                	ld	s0,32(sp)
     e02:	64e2                	ld	s1,24(sp)
     e04:	6942                	ld	s2,16(sp)
     e06:	6145                	addi	sp,sp,48
     e08:	8082                	ret
    fprintf(2, "leftovers: %s\n", s);
     e0a:	00001597          	auipc	a1,0x1
     e0e:	b3e58593          	addi	a1,a1,-1218 # 1948 <malloc+0x226>
     e12:	4509                	li	a0,2
     e14:	00001097          	auipc	ra,0x1
     e18:	822080e7          	jalr	-2014(ra) # 1636 <fprintf>
    panic("syntax");
     e1c:	00001517          	auipc	a0,0x1
     e20:	ac450513          	addi	a0,a0,-1340 # 18e0 <malloc+0x1be>
     e24:	fffff097          	auipc	ra,0xfffff
     e28:	574080e7          	jalr	1396(ra) # 398 <panic>

0000000000000e2c <main>:
{
     e2c:	711d                	addi	sp,sp,-96
     e2e:	ec86                	sd	ra,88(sp)
     e30:	e8a2                	sd	s0,80(sp)
     e32:	e4a6                	sd	s1,72(sp)
     e34:	e0ca                	sd	s2,64(sp)
     e36:	fc4e                	sd	s3,56(sp)
     e38:	f852                	sd	s4,48(sp)
     e3a:	f456                	sd	s5,40(sp)
     e3c:	f05a                	sd	s6,32(sp)
     e3e:	ec5e                	sd	s7,24(sp)
     e40:	e862                	sd	s8,16(sp)
     e42:	e466                	sd	s9,8(sp)
     e44:	1080                	addi	s0,sp,96
  while((fd = dev(O_RDWR, 1, 0)) >= 0){
     e46:	4601                	li	a2,0
     e48:	4585                	li	a1,1
     e4a:	4509                	li	a0,2
     e4c:	00000097          	auipc	ra,0x0
     e50:	508080e7          	jalr	1288(ra) # 1354 <dev>
     e54:	00054963          	bltz	a0,e66 <main+0x3a>
    if(fd >= 3){
     e58:	4789                	li	a5,2
     e5a:	fea7d6e3          	bge	a5,a0,e46 <main+0x1a>
      close(fd);
     e5e:	00000097          	auipc	ra,0x0
     e62:	48e080e7          	jalr	1166(ra) # 12ec <close>
  strcpy(envs[nenv].name, "SHELL");
     e66:	00001497          	auipc	s1,0x1
     e6a:	bb248493          	addi	s1,s1,-1102 # 1a18 <nenv>
     e6e:	4088                	lw	a0,0(s1)
     e70:	051e                	slli	a0,a0,0x7
     e72:	00001917          	auipc	s2,0x1
     e76:	c9e90913          	addi	s2,s2,-866 # 1b10 <envs>
     e7a:	00001597          	auipc	a1,0x1
     e7e:	ade58593          	addi	a1,a1,-1314 # 1958 <malloc+0x236>
     e82:	954a                	add	a0,a0,s2
     e84:	00000097          	auipc	ra,0x0
     e88:	186080e7          	jalr	390(ra) # 100a <strcpy>
  strcpy(envs[nenv].value, "/bin");
     e8c:	4088                	lw	a0,0(s1)
     e8e:	051e                	slli	a0,a0,0x7
     e90:	02050513          	addi	a0,a0,32
     e94:	00001597          	auipc	a1,0x1
     e98:	acc58593          	addi	a1,a1,-1332 # 1960 <malloc+0x23e>
     e9c:	954a                	add	a0,a0,s2
     e9e:	00000097          	auipc	ra,0x0
     ea2:	16c080e7          	jalr	364(ra) # 100a <strcpy>
  nenv++;
     ea6:	409c                	lw	a5,0(s1)
     ea8:	2785                	addiw	a5,a5,1
     eaa:	c09c                	sw	a5,0(s1)
  getcwd(mycwd);
     eac:	00001517          	auipc	a0,0x1
     eb0:	b7c50513          	addi	a0,a0,-1156 # 1a28 <mycwd>
     eb4:	00000097          	auipc	ra,0x0
     eb8:	4b0080e7          	jalr	1200(ra) # 1364 <getcwd>
  while(getcmd(buf, sizeof(buf)) >= 0){
     ebc:	00001917          	auipc	s2,0x1
     ec0:	bec90913          	addi	s2,s2,-1044 # 1aa8 <buf.1219>
    replace(buf);
     ec4:	00001997          	auipc	s3,0x1
     ec8:	b6498993          	addi	s3,s3,-1180 # 1a28 <mycwd>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     ecc:	06300a13          	li	s4,99
      else if(!strcmp(ecmd->argv[0], "export"))
     ed0:	00001a97          	auipc	s5,0x1
     ed4:	aa8a8a93          	addi	s5,s5,-1368 # 1978 <malloc+0x256>
          fprintf(2, "export failed\n");
     ed8:	00001c17          	auipc	s8,0x1
     edc:	ad0c0c13          	addi	s8,s8,-1328 # 19a8 <malloc+0x286>
          fprintf(2, "Usage: export [-p] [NAME=VALUE]\n");
     ee0:	00001b97          	auipc	s7,0x1
     ee4:	aa0b8b93          	addi	s7,s7,-1376 # 1980 <malloc+0x25e>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     ee8:	02000b13          	li	s6,32
      if(chdir(buf+3) < 0)
     eec:	00001c97          	auipc	s9,0x1
     ef0:	bbfc8c93          	addi	s9,s9,-1089 # 1aab <buf.1219+0x3>
  while(getcmd(buf, sizeof(buf)) >= 0){
     ef4:	a895                	j	f68 <main+0x13c>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     ef6:	0829c783          	lbu	a5,130(s3)
     efa:	09679f63          	bne	a5,s6,f98 <main+0x16c>
      buf[strlen(buf)-1] = 0;  // chop \n
     efe:	854a                	mv	a0,s2
     f00:	00000097          	auipc	ra,0x0
     f04:	180080e7          	jalr	384(ra) # 1080 <strlen>
     f08:	fff5079b          	addiw	a5,a0,-1
     f0c:	1782                	slli	a5,a5,0x20
     f0e:	9381                	srli	a5,a5,0x20
     f10:	97ce                	add	a5,a5,s3
     f12:	08078023          	sb	zero,128(a5)
      if(chdir(buf+3) < 0)
     f16:	8566                	mv	a0,s9
     f18:	00000097          	auipc	ra,0x0
     f1c:	404080e7          	jalr	1028(ra) # 131c <chdir>
     f20:	00054863          	bltz	a0,f30 <main+0x104>
      getcwd(mycwd);
     f24:	854e                	mv	a0,s3
     f26:	00000097          	auipc	ra,0x0
     f2a:	43e080e7          	jalr	1086(ra) # 1364 <getcwd>
     f2e:	a82d                	j	f68 <main+0x13c>
        fprintf(2, "cannot cd %s\n", buf+3);
     f30:	8666                	mv	a2,s9
     f32:	00001597          	auipc	a1,0x1
     f36:	a3658593          	addi	a1,a1,-1482 # 1968 <malloc+0x246>
     f3a:	4509                	li	a0,2
     f3c:	00000097          	auipc	ra,0x0
     f40:	6fa080e7          	jalr	1786(ra) # 1636 <fprintf>
     f44:	b7c5                	j	f24 <main+0xf8>
        free(cmd);
     f46:	8526                	mv	a0,s1
     f48:	00000097          	auipc	ra,0x0
     f4c:	752080e7          	jalr	1874(ra) # 169a <free>
        continue;
     f50:	a821                	j	f68 <main+0x13c>
          fprintf(2, "Usage: export [-p] [NAME=VALUE]\n");
     f52:	85de                	mv	a1,s7
     f54:	4509                	li	a0,2
     f56:	00000097          	auipc	ra,0x0
     f5a:	6e0080e7          	jalr	1760(ra) # 1636 <fprintf>
        free(cmd);
     f5e:	8526                	mv	a0,s1
     f60:	00000097          	auipc	ra,0x0
     f64:	73a080e7          	jalr	1850(ra) # 169a <free>
  while(getcmd(buf, sizeof(buf)) >= 0){
     f68:	06400593          	li	a1,100
     f6c:	854a                	mv	a0,s2
     f6e:	fffff097          	auipc	ra,0xfffff
     f72:	3ce080e7          	jalr	974(ra) # 33c <getcmd>
     f76:	08054563          	bltz	a0,1000 <main+0x1d4>
    replace(buf);
     f7a:	854a                	mv	a0,s2
     f7c:	fffff097          	auipc	ra,0xfffff
     f80:	282080e7          	jalr	642(ra) # 1fe <replace>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     f84:	0809c783          	lbu	a5,128(s3)
     f88:	01479863          	bne	a5,s4,f98 <main+0x16c>
     f8c:	0819c703          	lbu	a4,129(s3)
     f90:	06400793          	li	a5,100
     f94:	f6f701e3          	beq	a4,a5,ef6 <main+0xca>
      struct cmd *cmd = parsecmd(buf);
     f98:	854a                	mv	a0,s2
     f9a:	00000097          	auipc	ra,0x0
     f9e:	e0a080e7          	jalr	-502(ra) # da4 <parsecmd>
     fa2:	84aa                	mv	s1,a0
      if(ecmd->argv[0] == 0) {
     fa4:	6508                	ld	a0,8(a0)
     fa6:	d145                	beqz	a0,f46 <main+0x11a>
      else if(!strcmp(ecmd->argv[0], "export"))
     fa8:	85d6                	mv	a1,s5
     faa:	00000097          	auipc	ra,0x0
     fae:	0aa080e7          	jalr	170(ra) # 1054 <strcmp>
     fb2:	e115                	bnez	a0,fd6 <main+0x1aa>
        if(ecmd->argv[1] == NULL)
     fb4:	689c                	ld	a5,16(s1)
     fb6:	dfd1                	beqz	a5,f52 <main+0x126>
        else if(export(ecmd->argv) < 0)
     fb8:	00848513          	addi	a0,s1,8
     fbc:	fffff097          	auipc	ra,0xfffff
     fc0:	0aa080e7          	jalr	170(ra) # 66 <export>
     fc4:	f8055de3          	bgez	a0,f5e <main+0x132>
          fprintf(2, "export failed\n");
     fc8:	85e2                	mv	a1,s8
     fca:	4509                	li	a0,2
     fcc:	00000097          	auipc	ra,0x0
     fd0:	66a080e7          	jalr	1642(ra) # 1636 <fprintf>
     fd4:	b769                	j	f5e <main+0x132>
      else if(fork1() == 0) 
     fd6:	fffff097          	auipc	ra,0xfffff
     fda:	3e8080e7          	jalr	1000(ra) # 3be <fork1>
     fde:	cd01                	beqz	a0,ff6 <main+0x1ca>
      wait(0);
     fe0:	4501                	li	a0,0
     fe2:	00000097          	auipc	ra,0x0
     fe6:	2ea080e7          	jalr	746(ra) # 12cc <wait>
      free(cmd);
     fea:	8526                	mv	a0,s1
     fec:	00000097          	auipc	ra,0x0
     ff0:	6ae080e7          	jalr	1710(ra) # 169a <free>
     ff4:	bf95                	j	f68 <main+0x13c>
        runcmd(cmd);
     ff6:	8526                	mv	a0,s1
     ff8:	fffff097          	auipc	ra,0xfffff
     ffc:	3f4080e7          	jalr	1012(ra) # 3ec <runcmd>
  exit(0);
    1000:	4501                	li	a0,0
    1002:	00000097          	auipc	ra,0x0
    1006:	2c2080e7          	jalr	706(ra) # 12c4 <exit>

000000000000100a <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
    100a:	1141                	addi	sp,sp,-16
    100c:	e422                	sd	s0,8(sp)
    100e:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1010:	87aa                	mv	a5,a0
    1012:	0585                	addi	a1,a1,1
    1014:	0785                	addi	a5,a5,1
    1016:	fff5c703          	lbu	a4,-1(a1)
    101a:	fee78fa3          	sb	a4,-1(a5)
    101e:	fb75                	bnez	a4,1012 <strcpy+0x8>
    ;
  return os;
}
    1020:	6422                	ld	s0,8(sp)
    1022:	0141                	addi	sp,sp,16
    1024:	8082                	ret

0000000000001026 <strcat>:

char*
strcat(char *s, const char *t)
{
    1026:	1141                	addi	sp,sp,-16
    1028:	e422                	sd	s0,8(sp)
    102a:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
    102c:	00054783          	lbu	a5,0(a0)
    1030:	c385                	beqz	a5,1050 <strcat+0x2a>
    1032:	87aa                	mv	a5,a0
    s++;
    1034:	0785                	addi	a5,a5,1
  while(*s)
    1036:	0007c703          	lbu	a4,0(a5)
    103a:	ff6d                	bnez	a4,1034 <strcat+0xe>
  while((*s++ = *t++))
    103c:	0585                	addi	a1,a1,1
    103e:	0785                	addi	a5,a5,1
    1040:	fff5c703          	lbu	a4,-1(a1)
    1044:	fee78fa3          	sb	a4,-1(a5)
    1048:	fb75                	bnez	a4,103c <strcat+0x16>
    ;
  return os;
}
    104a:	6422                	ld	s0,8(sp)
    104c:	0141                	addi	sp,sp,16
    104e:	8082                	ret
  while(*s)
    1050:	87aa                	mv	a5,a0
    1052:	b7ed                	j	103c <strcat+0x16>

0000000000001054 <strcmp>:


int
strcmp(const char *p, const char *q)
{
    1054:	1141                	addi	sp,sp,-16
    1056:	e422                	sd	s0,8(sp)
    1058:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
    105a:	00054783          	lbu	a5,0(a0)
    105e:	cb91                	beqz	a5,1072 <strcmp+0x1e>
    1060:	0005c703          	lbu	a4,0(a1)
    1064:	00f71763          	bne	a4,a5,1072 <strcmp+0x1e>
    p++, q++;
    1068:	0505                	addi	a0,a0,1
    106a:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
    106c:	00054783          	lbu	a5,0(a0)
    1070:	fbe5                	bnez	a5,1060 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
    1072:	0005c503          	lbu	a0,0(a1)
}
    1076:	40a7853b          	subw	a0,a5,a0
    107a:	6422                	ld	s0,8(sp)
    107c:	0141                	addi	sp,sp,16
    107e:	8082                	ret

0000000000001080 <strlen>:

uint
strlen(const char *s)
{
    1080:	1141                	addi	sp,sp,-16
    1082:	e422                	sd	s0,8(sp)
    1084:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
    1086:	00054783          	lbu	a5,0(a0)
    108a:	cf91                	beqz	a5,10a6 <strlen+0x26>
    108c:	0505                	addi	a0,a0,1
    108e:	87aa                	mv	a5,a0
    1090:	4685                	li	a3,1
    1092:	9e89                	subw	a3,a3,a0
    1094:	00f6853b          	addw	a0,a3,a5
    1098:	0785                	addi	a5,a5,1
    109a:	fff7c703          	lbu	a4,-1(a5)
    109e:	fb7d                	bnez	a4,1094 <strlen+0x14>
    ;
  return n;
}
    10a0:	6422                	ld	s0,8(sp)
    10a2:	0141                	addi	sp,sp,16
    10a4:	8082                	ret
  for(n = 0; s[n]; n++)
    10a6:	4501                	li	a0,0
    10a8:	bfe5                	j	10a0 <strlen+0x20>

00000000000010aa <memset>:

void*
memset(void *dst, int c, uint n)
{
    10aa:	1141                	addi	sp,sp,-16
    10ac:	e422                	sd	s0,8(sp)
    10ae:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
    10b0:	ce09                	beqz	a2,10ca <memset+0x20>
    10b2:	87aa                	mv	a5,a0
    10b4:	fff6071b          	addiw	a4,a2,-1
    10b8:	1702                	slli	a4,a4,0x20
    10ba:	9301                	srli	a4,a4,0x20
    10bc:	0705                	addi	a4,a4,1
    10be:	972a                	add	a4,a4,a0
    cdst[i] = c;
    10c0:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
    10c4:	0785                	addi	a5,a5,1
    10c6:	fee79de3          	bne	a5,a4,10c0 <memset+0x16>
  }
  return dst;
}
    10ca:	6422                	ld	s0,8(sp)
    10cc:	0141                	addi	sp,sp,16
    10ce:	8082                	ret

00000000000010d0 <strchr>:

char*
strchr(const char *s, char c)
{
    10d0:	1141                	addi	sp,sp,-16
    10d2:	e422                	sd	s0,8(sp)
    10d4:	0800                	addi	s0,sp,16
  for(; *s; s++)
    10d6:	00054783          	lbu	a5,0(a0)
    10da:	cb99                	beqz	a5,10f0 <strchr+0x20>
    if(*s == c)
    10dc:	00f58763          	beq	a1,a5,10ea <strchr+0x1a>
  for(; *s; s++)
    10e0:	0505                	addi	a0,a0,1
    10e2:	00054783          	lbu	a5,0(a0)
    10e6:	fbfd                	bnez	a5,10dc <strchr+0xc>
      return (char*)s;
  return 0;
    10e8:	4501                	li	a0,0
}
    10ea:	6422                	ld	s0,8(sp)
    10ec:	0141                	addi	sp,sp,16
    10ee:	8082                	ret
  return 0;
    10f0:	4501                	li	a0,0
    10f2:	bfe5                	j	10ea <strchr+0x1a>

00000000000010f4 <gets>:

char*
gets(char *buf, int max)
{
    10f4:	711d                	addi	sp,sp,-96
    10f6:	ec86                	sd	ra,88(sp)
    10f8:	e8a2                	sd	s0,80(sp)
    10fa:	e4a6                	sd	s1,72(sp)
    10fc:	e0ca                	sd	s2,64(sp)
    10fe:	fc4e                	sd	s3,56(sp)
    1100:	f852                	sd	s4,48(sp)
    1102:	f456                	sd	s5,40(sp)
    1104:	f05a                	sd	s6,32(sp)
    1106:	ec5e                	sd	s7,24(sp)
    1108:	1080                	addi	s0,sp,96
    110a:	8baa                	mv	s7,a0
    110c:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    110e:	892a                	mv	s2,a0
    1110:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
    1112:	4aa9                	li	s5,10
    1114:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
    1116:	89a6                	mv	s3,s1
    1118:	2485                	addiw	s1,s1,1
    111a:	0344d863          	bge	s1,s4,114a <gets+0x56>
    cc = read(0, &c, 1);
    111e:	4605                	li	a2,1
    1120:	faf40593          	addi	a1,s0,-81
    1124:	4501                	li	a0,0
    1126:	00000097          	auipc	ra,0x0
    112a:	1b6080e7          	jalr	438(ra) # 12dc <read>
    if(cc < 1)
    112e:	00a05e63          	blez	a0,114a <gets+0x56>
    buf[i++] = c;
    1132:	faf44783          	lbu	a5,-81(s0)
    1136:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
    113a:	01578763          	beq	a5,s5,1148 <gets+0x54>
    113e:	0905                	addi	s2,s2,1
    1140:	fd679be3          	bne	a5,s6,1116 <gets+0x22>
  for(i=0; i+1 < max; ){
    1144:	89a6                	mv	s3,s1
    1146:	a011                	j	114a <gets+0x56>
    1148:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
    114a:	99de                	add	s3,s3,s7
    114c:	00098023          	sb	zero,0(s3)
  return buf;
}
    1150:	855e                	mv	a0,s7
    1152:	60e6                	ld	ra,88(sp)
    1154:	6446                	ld	s0,80(sp)
    1156:	64a6                	ld	s1,72(sp)
    1158:	6906                	ld	s2,64(sp)
    115a:	79e2                	ld	s3,56(sp)
    115c:	7a42                	ld	s4,48(sp)
    115e:	7aa2                	ld	s5,40(sp)
    1160:	7b02                	ld	s6,32(sp)
    1162:	6be2                	ld	s7,24(sp)
    1164:	6125                	addi	sp,sp,96
    1166:	8082                	ret

0000000000001168 <stat>:

int
stat(const char *n, struct stat *st)
{
    1168:	1101                	addi	sp,sp,-32
    116a:	ec06                	sd	ra,24(sp)
    116c:	e822                	sd	s0,16(sp)
    116e:	e426                	sd	s1,8(sp)
    1170:	e04a                	sd	s2,0(sp)
    1172:	1000                	addi	s0,sp,32
    1174:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1176:	4581                	li	a1,0
    1178:	00000097          	auipc	ra,0x0
    117c:	18c080e7          	jalr	396(ra) # 1304 <open>
  if(fd < 0)
    1180:	02054563          	bltz	a0,11aa <stat+0x42>
    1184:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
    1186:	85ca                	mv	a1,s2
    1188:	00000097          	auipc	ra,0x0
    118c:	184080e7          	jalr	388(ra) # 130c <fstat>
    1190:	892a                	mv	s2,a0
  close(fd);
    1192:	8526                	mv	a0,s1
    1194:	00000097          	auipc	ra,0x0
    1198:	158080e7          	jalr	344(ra) # 12ec <close>
  return r;
}
    119c:	854a                	mv	a0,s2
    119e:	60e2                	ld	ra,24(sp)
    11a0:	6442                	ld	s0,16(sp)
    11a2:	64a2                	ld	s1,8(sp)
    11a4:	6902                	ld	s2,0(sp)
    11a6:	6105                	addi	sp,sp,32
    11a8:	8082                	ret
    return -1;
    11aa:	597d                	li	s2,-1
    11ac:	bfc5                	j	119c <stat+0x34>

00000000000011ae <atoi>:

int
atoi(const char *s)
{
    11ae:	1141                	addi	sp,sp,-16
    11b0:	e422                	sd	s0,8(sp)
    11b2:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
    11b4:	00054703          	lbu	a4,0(a0)
    11b8:	02d00793          	li	a5,45
  int neg = 1;
    11bc:	4805                	li	a6,1
  if (*s == '-') {
    11be:	04f70363          	beq	a4,a5,1204 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
    11c2:	00054683          	lbu	a3,0(a0)
    11c6:	fd06879b          	addiw	a5,a3,-48
    11ca:	0ff7f793          	andi	a5,a5,255
    11ce:	4725                	li	a4,9
    11d0:	02f76d63          	bltu	a4,a5,120a <atoi+0x5c>
  n = 0;
    11d4:	4601                	li	a2,0
  while('0' <= *s && *s <= '9')
    11d6:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
    11d8:	0505                	addi	a0,a0,1
    11da:	0026179b          	slliw	a5,a2,0x2
    11de:	9fb1                	addw	a5,a5,a2
    11e0:	0017979b          	slliw	a5,a5,0x1
    11e4:	9fb5                	addw	a5,a5,a3
    11e6:	fd07861b          	addiw	a2,a5,-48
  while('0' <= *s && *s <= '9')
    11ea:	00054683          	lbu	a3,0(a0)
    11ee:	fd06871b          	addiw	a4,a3,-48
    11f2:	0ff77713          	andi	a4,a4,255
    11f6:	fee5f1e3          	bgeu	a1,a4,11d8 <atoi+0x2a>
  return n * neg;
}
    11fa:	02c8053b          	mulw	a0,a6,a2
    11fe:	6422                	ld	s0,8(sp)
    1200:	0141                	addi	sp,sp,16
    1202:	8082                	ret
    s++;
    1204:	0505                	addi	a0,a0,1
    neg = -1;
    1206:	587d                	li	a6,-1
    1208:	bf6d                	j	11c2 <atoi+0x14>
  n = 0;
    120a:	4601                	li	a2,0
    120c:	b7fd                	j	11fa <atoi+0x4c>

000000000000120e <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    120e:	1141                	addi	sp,sp,-16
    1210:	e422                	sd	s0,8(sp)
    1212:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
    1214:	02b57663          	bgeu	a0,a1,1240 <memmove+0x32>
    while(n-- > 0)
    1218:	02c05163          	blez	a2,123a <memmove+0x2c>
    121c:	fff6079b          	addiw	a5,a2,-1
    1220:	1782                	slli	a5,a5,0x20
    1222:	9381                	srli	a5,a5,0x20
    1224:	0785                	addi	a5,a5,1
    1226:	97aa                	add	a5,a5,a0
  dst = vdst;
    1228:	872a                	mv	a4,a0
      *dst++ = *src++;
    122a:	0585                	addi	a1,a1,1
    122c:	0705                	addi	a4,a4,1
    122e:	fff5c683          	lbu	a3,-1(a1)
    1232:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
    1236:	fee79ae3          	bne	a5,a4,122a <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
    123a:	6422                	ld	s0,8(sp)
    123c:	0141                	addi	sp,sp,16
    123e:	8082                	ret
    dst += n;
    1240:	00c50733          	add	a4,a0,a2
    src += n;
    1244:	95b2                	add	a1,a1,a2
    while(n-- > 0)
    1246:	fec05ae3          	blez	a2,123a <memmove+0x2c>
    124a:	fff6079b          	addiw	a5,a2,-1
    124e:	1782                	slli	a5,a5,0x20
    1250:	9381                	srli	a5,a5,0x20
    1252:	fff7c793          	not	a5,a5
    1256:	97ba                	add	a5,a5,a4
      *--dst = *--src;
    1258:	15fd                	addi	a1,a1,-1
    125a:	177d                	addi	a4,a4,-1
    125c:	0005c683          	lbu	a3,0(a1)
    1260:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
    1264:	fee79ae3          	bne	a5,a4,1258 <memmove+0x4a>
    1268:	bfc9                	j	123a <memmove+0x2c>

000000000000126a <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
    126a:	1141                	addi	sp,sp,-16
    126c:	e422                	sd	s0,8(sp)
    126e:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
    1270:	ca05                	beqz	a2,12a0 <memcmp+0x36>
    1272:	fff6069b          	addiw	a3,a2,-1
    1276:	1682                	slli	a3,a3,0x20
    1278:	9281                	srli	a3,a3,0x20
    127a:	0685                	addi	a3,a3,1
    127c:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
    127e:	00054783          	lbu	a5,0(a0)
    1282:	0005c703          	lbu	a4,0(a1)
    1286:	00e79863          	bne	a5,a4,1296 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
    128a:	0505                	addi	a0,a0,1
    p2++;
    128c:	0585                	addi	a1,a1,1
  while (n-- > 0) {
    128e:	fed518e3          	bne	a0,a3,127e <memcmp+0x14>
  }
  return 0;
    1292:	4501                	li	a0,0
    1294:	a019                	j	129a <memcmp+0x30>
      return *p1 - *p2;
    1296:	40e7853b          	subw	a0,a5,a4
}
    129a:	6422                	ld	s0,8(sp)
    129c:	0141                	addi	sp,sp,16
    129e:	8082                	ret
  return 0;
    12a0:	4501                	li	a0,0
    12a2:	bfe5                	j	129a <memcmp+0x30>

00000000000012a4 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
    12a4:	1141                	addi	sp,sp,-16
    12a6:	e406                	sd	ra,8(sp)
    12a8:	e022                	sd	s0,0(sp)
    12aa:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
    12ac:	00000097          	auipc	ra,0x0
    12b0:	f62080e7          	jalr	-158(ra) # 120e <memmove>
}
    12b4:	60a2                	ld	ra,8(sp)
    12b6:	6402                	ld	s0,0(sp)
    12b8:	0141                	addi	sp,sp,16
    12ba:	8082                	ret

00000000000012bc <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
    12bc:	4885                	li	a7,1
 ecall
    12be:	00000073          	ecall
 ret
    12c2:	8082                	ret

00000000000012c4 <exit>:
.global exit
exit:
 li a7, SYS_exit
    12c4:	4889                	li	a7,2
 ecall
    12c6:	00000073          	ecall
 ret
    12ca:	8082                	ret

00000000000012cc <wait>:
.global wait
wait:
 li a7, SYS_wait
    12cc:	488d                	li	a7,3
 ecall
    12ce:	00000073          	ecall
 ret
    12d2:	8082                	ret

00000000000012d4 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
    12d4:	4891                	li	a7,4
 ecall
    12d6:	00000073          	ecall
 ret
    12da:	8082                	ret

00000000000012dc <read>:
.global read
read:
 li a7, SYS_read
    12dc:	4895                	li	a7,5
 ecall
    12de:	00000073          	ecall
 ret
    12e2:	8082                	ret

00000000000012e4 <write>:
.global write
write:
 li a7, SYS_write
    12e4:	48c1                	li	a7,16
 ecall
    12e6:	00000073          	ecall
 ret
    12ea:	8082                	ret

00000000000012ec <close>:
.global close
close:
 li a7, SYS_close
    12ec:	48d5                	li	a7,21
 ecall
    12ee:	00000073          	ecall
 ret
    12f2:	8082                	ret

00000000000012f4 <kill>:
.global kill
kill:
 li a7, SYS_kill
    12f4:	4899                	li	a7,6
 ecall
    12f6:	00000073          	ecall
 ret
    12fa:	8082                	ret

00000000000012fc <exec>:
.global exec
exec:
 li a7, SYS_exec
    12fc:	489d                	li	a7,7
 ecall
    12fe:	00000073          	ecall
 ret
    1302:	8082                	ret

0000000000001304 <open>:
.global open
open:
 li a7, SYS_open
    1304:	48bd                	li	a7,15
 ecall
    1306:	00000073          	ecall
 ret
    130a:	8082                	ret

000000000000130c <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
    130c:	48a1                	li	a7,8
 ecall
    130e:	00000073          	ecall
 ret
    1312:	8082                	ret

0000000000001314 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
    1314:	48d1                	li	a7,20
 ecall
    1316:	00000073          	ecall
 ret
    131a:	8082                	ret

000000000000131c <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
    131c:	48a5                	li	a7,9
 ecall
    131e:	00000073          	ecall
 ret
    1322:	8082                	ret

0000000000001324 <dup>:
.global dup
dup:
 li a7, SYS_dup
    1324:	48a9                	li	a7,10
 ecall
    1326:	00000073          	ecall
 ret
    132a:	8082                	ret

000000000000132c <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
    132c:	48ad                	li	a7,11
 ecall
    132e:	00000073          	ecall
 ret
    1332:	8082                	ret

0000000000001334 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
    1334:	48b1                	li	a7,12
 ecall
    1336:	00000073          	ecall
 ret
    133a:	8082                	ret

000000000000133c <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
    133c:	48b5                	li	a7,13
 ecall
    133e:	00000073          	ecall
 ret
    1342:	8082                	ret

0000000000001344 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
    1344:	48b9                	li	a7,14
 ecall
    1346:	00000073          	ecall
 ret
    134a:	8082                	ret

000000000000134c <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
    134c:	48d9                	li	a7,22
 ecall
    134e:	00000073          	ecall
 ret
    1352:	8082                	ret

0000000000001354 <dev>:
.global dev
dev:
 li a7, SYS_dev
    1354:	48dd                	li	a7,23
 ecall
    1356:	00000073          	ecall
 ret
    135a:	8082                	ret

000000000000135c <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
    135c:	48e1                	li	a7,24
 ecall
    135e:	00000073          	ecall
 ret
    1362:	8082                	ret

0000000000001364 <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
    1364:	48e5                	li	a7,25
 ecall
    1366:	00000073          	ecall
 ret
    136a:	8082                	ret

000000000000136c <remove>:
.global remove
remove:
 li a7, SYS_remove
    136c:	48c5                	li	a7,17
 ecall
    136e:	00000073          	ecall
 ret
    1372:	8082                	ret

0000000000001374 <trace>:
.global trace
trace:
 li a7, SYS_trace
    1374:	48c9                	li	a7,18
 ecall
    1376:	00000073          	ecall
 ret
    137a:	8082                	ret

000000000000137c <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
    137c:	48cd                	li	a7,19
 ecall
    137e:	00000073          	ecall
 ret
    1382:	8082                	ret

0000000000001384 <rename>:
.global rename
rename:
 li a7, SYS_rename
    1384:	48e9                	li	a7,26
 ecall
    1386:	00000073          	ecall
 ret
    138a:	8082                	ret

000000000000138c <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
    138c:	1101                	addi	sp,sp,-32
    138e:	ec06                	sd	ra,24(sp)
    1390:	e822                	sd	s0,16(sp)
    1392:	1000                	addi	s0,sp,32
    1394:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
    1398:	4605                	li	a2,1
    139a:	fef40593          	addi	a1,s0,-17
    139e:	00000097          	auipc	ra,0x0
    13a2:	f46080e7          	jalr	-186(ra) # 12e4 <write>
}
    13a6:	60e2                	ld	ra,24(sp)
    13a8:	6442                	ld	s0,16(sp)
    13aa:	6105                	addi	sp,sp,32
    13ac:	8082                	ret

00000000000013ae <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    13ae:	7139                	addi	sp,sp,-64
    13b0:	fc06                	sd	ra,56(sp)
    13b2:	f822                	sd	s0,48(sp)
    13b4:	f426                	sd	s1,40(sp)
    13b6:	f04a                	sd	s2,32(sp)
    13b8:	ec4e                	sd	s3,24(sp)
    13ba:	0080                	addi	s0,sp,64
    13bc:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    13be:	c299                	beqz	a3,13c4 <printint+0x16>
    13c0:	0805c863          	bltz	a1,1450 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    13c4:	2581                	sext.w	a1,a1
  neg = 0;
    13c6:	4881                	li	a7,0
    13c8:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
    13cc:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
    13ce:	2601                	sext.w	a2,a2
    13d0:	00000517          	auipc	a0,0x0
    13d4:	62050513          	addi	a0,a0,1568 # 19f0 <digits>
    13d8:	883a                	mv	a6,a4
    13da:	2705                	addiw	a4,a4,1
    13dc:	02c5f7bb          	remuw	a5,a1,a2
    13e0:	1782                	slli	a5,a5,0x20
    13e2:	9381                	srli	a5,a5,0x20
    13e4:	97aa                	add	a5,a5,a0
    13e6:	0007c783          	lbu	a5,0(a5)
    13ea:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
    13ee:	0005879b          	sext.w	a5,a1
    13f2:	02c5d5bb          	divuw	a1,a1,a2
    13f6:	0685                	addi	a3,a3,1
    13f8:	fec7f0e3          	bgeu	a5,a2,13d8 <printint+0x2a>
  if(neg)
    13fc:	00088b63          	beqz	a7,1412 <printint+0x64>
    buf[i++] = '-';
    1400:	fd040793          	addi	a5,s0,-48
    1404:	973e                	add	a4,a4,a5
    1406:	02d00793          	li	a5,45
    140a:	fef70823          	sb	a5,-16(a4)
    140e:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
    1412:	02e05863          	blez	a4,1442 <printint+0x94>
    1416:	fc040793          	addi	a5,s0,-64
    141a:	00e78933          	add	s2,a5,a4
    141e:	fff78993          	addi	s3,a5,-1
    1422:	99ba                	add	s3,s3,a4
    1424:	377d                	addiw	a4,a4,-1
    1426:	1702                	slli	a4,a4,0x20
    1428:	9301                	srli	a4,a4,0x20
    142a:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
    142e:	fff94583          	lbu	a1,-1(s2)
    1432:	8526                	mv	a0,s1
    1434:	00000097          	auipc	ra,0x0
    1438:	f58080e7          	jalr	-168(ra) # 138c <putc>
  while(--i >= 0)
    143c:	197d                	addi	s2,s2,-1
    143e:	ff3918e3          	bne	s2,s3,142e <printint+0x80>
}
    1442:	70e2                	ld	ra,56(sp)
    1444:	7442                	ld	s0,48(sp)
    1446:	74a2                	ld	s1,40(sp)
    1448:	7902                	ld	s2,32(sp)
    144a:	69e2                	ld	s3,24(sp)
    144c:	6121                	addi	sp,sp,64
    144e:	8082                	ret
    x = -xx;
    1450:	40b005bb          	negw	a1,a1
    neg = 1;
    1454:	4885                	li	a7,1
    x = -xx;
    1456:	bf8d                	j	13c8 <printint+0x1a>

0000000000001458 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
    1458:	7119                	addi	sp,sp,-128
    145a:	fc86                	sd	ra,120(sp)
    145c:	f8a2                	sd	s0,112(sp)
    145e:	f4a6                	sd	s1,104(sp)
    1460:	f0ca                	sd	s2,96(sp)
    1462:	ecce                	sd	s3,88(sp)
    1464:	e8d2                	sd	s4,80(sp)
    1466:	e4d6                	sd	s5,72(sp)
    1468:	e0da                	sd	s6,64(sp)
    146a:	fc5e                	sd	s7,56(sp)
    146c:	f862                	sd	s8,48(sp)
    146e:	f466                	sd	s9,40(sp)
    1470:	f06a                	sd	s10,32(sp)
    1472:	ec6e                	sd	s11,24(sp)
    1474:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
    1476:	0005c903          	lbu	s2,0(a1)
    147a:	18090f63          	beqz	s2,1618 <vprintf+0x1c0>
    147e:	8aaa                	mv	s5,a0
    1480:	8b32                	mv	s6,a2
    1482:	00158493          	addi	s1,a1,1
  state = 0;
    1486:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1488:	02500a13          	li	s4,37
      if(c == 'd'){
    148c:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
    1490:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
    1494:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
    1498:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
    149c:	00000b97          	auipc	s7,0x0
    14a0:	554b8b93          	addi	s7,s7,1364 # 19f0 <digits>
    14a4:	a839                	j	14c2 <vprintf+0x6a>
        putc(fd, c);
    14a6:	85ca                	mv	a1,s2
    14a8:	8556                	mv	a0,s5
    14aa:	00000097          	auipc	ra,0x0
    14ae:	ee2080e7          	jalr	-286(ra) # 138c <putc>
    14b2:	a019                	j	14b8 <vprintf+0x60>
    } else if(state == '%'){
    14b4:	01498f63          	beq	s3,s4,14d2 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
    14b8:	0485                	addi	s1,s1,1
    14ba:	fff4c903          	lbu	s2,-1(s1)
    14be:	14090d63          	beqz	s2,1618 <vprintf+0x1c0>
    c = fmt[i] & 0xff;
    14c2:	0009079b          	sext.w	a5,s2
    if(state == 0){
    14c6:	fe0997e3          	bnez	s3,14b4 <vprintf+0x5c>
      if(c == '%'){
    14ca:	fd479ee3          	bne	a5,s4,14a6 <vprintf+0x4e>
        state = '%';
    14ce:	89be                	mv	s3,a5
    14d0:	b7e5                	j	14b8 <vprintf+0x60>
      if(c == 'd'){
    14d2:	05878063          	beq	a5,s8,1512 <vprintf+0xba>
      } else if(c == 'l') {
    14d6:	05978c63          	beq	a5,s9,152e <vprintf+0xd6>
      } else if(c == 'x') {
    14da:	07a78863          	beq	a5,s10,154a <vprintf+0xf2>
      } else if(c == 'p') {
    14de:	09b78463          	beq	a5,s11,1566 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
    14e2:	07300713          	li	a4,115
    14e6:	0ce78663          	beq	a5,a4,15b2 <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    14ea:	06300713          	li	a4,99
    14ee:	0ee78e63          	beq	a5,a4,15ea <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
    14f2:	11478863          	beq	a5,s4,1602 <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    14f6:	85d2                	mv	a1,s4
    14f8:	8556                	mv	a0,s5
    14fa:	00000097          	auipc	ra,0x0
    14fe:	e92080e7          	jalr	-366(ra) # 138c <putc>
        putc(fd, c);
    1502:	85ca                	mv	a1,s2
    1504:	8556                	mv	a0,s5
    1506:	00000097          	auipc	ra,0x0
    150a:	e86080e7          	jalr	-378(ra) # 138c <putc>
      }
      state = 0;
    150e:	4981                	li	s3,0
    1510:	b765                	j	14b8 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
    1512:	008b0913          	addi	s2,s6,8
    1516:	4685                	li	a3,1
    1518:	4629                	li	a2,10
    151a:	000b2583          	lw	a1,0(s6)
    151e:	8556                	mv	a0,s5
    1520:	00000097          	auipc	ra,0x0
    1524:	e8e080e7          	jalr	-370(ra) # 13ae <printint>
    1528:	8b4a                	mv	s6,s2
      state = 0;
    152a:	4981                	li	s3,0
    152c:	b771                	j	14b8 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
    152e:	008b0913          	addi	s2,s6,8
    1532:	4681                	li	a3,0
    1534:	4629                	li	a2,10
    1536:	000b2583          	lw	a1,0(s6)
    153a:	8556                	mv	a0,s5
    153c:	00000097          	auipc	ra,0x0
    1540:	e72080e7          	jalr	-398(ra) # 13ae <printint>
    1544:	8b4a                	mv	s6,s2
      state = 0;
    1546:	4981                	li	s3,0
    1548:	bf85                	j	14b8 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
    154a:	008b0913          	addi	s2,s6,8
    154e:	4681                	li	a3,0
    1550:	4641                	li	a2,16
    1552:	000b2583          	lw	a1,0(s6)
    1556:	8556                	mv	a0,s5
    1558:	00000097          	auipc	ra,0x0
    155c:	e56080e7          	jalr	-426(ra) # 13ae <printint>
    1560:	8b4a                	mv	s6,s2
      state = 0;
    1562:	4981                	li	s3,0
    1564:	bf91                	j	14b8 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
    1566:	008b0793          	addi	a5,s6,8
    156a:	f8f43423          	sd	a5,-120(s0)
    156e:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
    1572:	03000593          	li	a1,48
    1576:	8556                	mv	a0,s5
    1578:	00000097          	auipc	ra,0x0
    157c:	e14080e7          	jalr	-492(ra) # 138c <putc>
  putc(fd, 'x');
    1580:	85ea                	mv	a1,s10
    1582:	8556                	mv	a0,s5
    1584:	00000097          	auipc	ra,0x0
    1588:	e08080e7          	jalr	-504(ra) # 138c <putc>
    158c:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
    158e:	03c9d793          	srli	a5,s3,0x3c
    1592:	97de                	add	a5,a5,s7
    1594:	0007c583          	lbu	a1,0(a5)
    1598:	8556                	mv	a0,s5
    159a:	00000097          	auipc	ra,0x0
    159e:	df2080e7          	jalr	-526(ra) # 138c <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    15a2:	0992                	slli	s3,s3,0x4
    15a4:	397d                	addiw	s2,s2,-1
    15a6:	fe0914e3          	bnez	s2,158e <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
    15aa:	f8843b03          	ld	s6,-120(s0)
      state = 0;
    15ae:	4981                	li	s3,0
    15b0:	b721                	j	14b8 <vprintf+0x60>
        s = va_arg(ap, char*);
    15b2:	008b0993          	addi	s3,s6,8
    15b6:	000b3903          	ld	s2,0(s6)
        if(s == 0)
    15ba:	02090163          	beqz	s2,15dc <vprintf+0x184>
        while(*s != 0){
    15be:	00094583          	lbu	a1,0(s2)
    15c2:	c9a1                	beqz	a1,1612 <vprintf+0x1ba>
          putc(fd, *s);
    15c4:	8556                	mv	a0,s5
    15c6:	00000097          	auipc	ra,0x0
    15ca:	dc6080e7          	jalr	-570(ra) # 138c <putc>
          s++;
    15ce:	0905                	addi	s2,s2,1
        while(*s != 0){
    15d0:	00094583          	lbu	a1,0(s2)
    15d4:	f9e5                	bnez	a1,15c4 <vprintf+0x16c>
        s = va_arg(ap, char*);
    15d6:	8b4e                	mv	s6,s3
      state = 0;
    15d8:	4981                	li	s3,0
    15da:	bdf9                	j	14b8 <vprintf+0x60>
          s = "(null)";
    15dc:	00000917          	auipc	s2,0x0
    15e0:	40c90913          	addi	s2,s2,1036 # 19e8 <malloc+0x2c6>
        while(*s != 0){
    15e4:	02800593          	li	a1,40
    15e8:	bff1                	j	15c4 <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
    15ea:	008b0913          	addi	s2,s6,8
    15ee:	000b4583          	lbu	a1,0(s6)
    15f2:	8556                	mv	a0,s5
    15f4:	00000097          	auipc	ra,0x0
    15f8:	d98080e7          	jalr	-616(ra) # 138c <putc>
    15fc:	8b4a                	mv	s6,s2
      state = 0;
    15fe:	4981                	li	s3,0
    1600:	bd65                	j	14b8 <vprintf+0x60>
        putc(fd, c);
    1602:	85d2                	mv	a1,s4
    1604:	8556                	mv	a0,s5
    1606:	00000097          	auipc	ra,0x0
    160a:	d86080e7          	jalr	-634(ra) # 138c <putc>
      state = 0;
    160e:	4981                	li	s3,0
    1610:	b565                	j	14b8 <vprintf+0x60>
        s = va_arg(ap, char*);
    1612:	8b4e                	mv	s6,s3
      state = 0;
    1614:	4981                	li	s3,0
    1616:	b54d                	j	14b8 <vprintf+0x60>
    }
  }
}
    1618:	70e6                	ld	ra,120(sp)
    161a:	7446                	ld	s0,112(sp)
    161c:	74a6                	ld	s1,104(sp)
    161e:	7906                	ld	s2,96(sp)
    1620:	69e6                	ld	s3,88(sp)
    1622:	6a46                	ld	s4,80(sp)
    1624:	6aa6                	ld	s5,72(sp)
    1626:	6b06                	ld	s6,64(sp)
    1628:	7be2                	ld	s7,56(sp)
    162a:	7c42                	ld	s8,48(sp)
    162c:	7ca2                	ld	s9,40(sp)
    162e:	7d02                	ld	s10,32(sp)
    1630:	6de2                	ld	s11,24(sp)
    1632:	6109                	addi	sp,sp,128
    1634:	8082                	ret

0000000000001636 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
    1636:	715d                	addi	sp,sp,-80
    1638:	ec06                	sd	ra,24(sp)
    163a:	e822                	sd	s0,16(sp)
    163c:	1000                	addi	s0,sp,32
    163e:	e010                	sd	a2,0(s0)
    1640:	e414                	sd	a3,8(s0)
    1642:	e818                	sd	a4,16(s0)
    1644:	ec1c                	sd	a5,24(s0)
    1646:	03043023          	sd	a6,32(s0)
    164a:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
    164e:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
    1652:	8622                	mv	a2,s0
    1654:	00000097          	auipc	ra,0x0
    1658:	e04080e7          	jalr	-508(ra) # 1458 <vprintf>
}
    165c:	60e2                	ld	ra,24(sp)
    165e:	6442                	ld	s0,16(sp)
    1660:	6161                	addi	sp,sp,80
    1662:	8082                	ret

0000000000001664 <printf>:

void
printf(const char *fmt, ...)
{
    1664:	711d                	addi	sp,sp,-96
    1666:	ec06                	sd	ra,24(sp)
    1668:	e822                	sd	s0,16(sp)
    166a:	1000                	addi	s0,sp,32
    166c:	e40c                	sd	a1,8(s0)
    166e:	e810                	sd	a2,16(s0)
    1670:	ec14                	sd	a3,24(s0)
    1672:	f018                	sd	a4,32(s0)
    1674:	f41c                	sd	a5,40(s0)
    1676:	03043823          	sd	a6,48(s0)
    167a:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
    167e:	00840613          	addi	a2,s0,8
    1682:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
    1686:	85aa                	mv	a1,a0
    1688:	4505                	li	a0,1
    168a:	00000097          	auipc	ra,0x0
    168e:	dce080e7          	jalr	-562(ra) # 1458 <vprintf>
}
    1692:	60e2                	ld	ra,24(sp)
    1694:	6442                	ld	s0,16(sp)
    1696:	6125                	addi	sp,sp,96
    1698:	8082                	ret

000000000000169a <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    169a:	1141                	addi	sp,sp,-16
    169c:	e422                	sd	s0,8(sp)
    169e:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
    16a0:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16a4:	00000797          	auipc	a5,0x0
    16a8:	37c7b783          	ld	a5,892(a5) # 1a20 <freep>
    16ac:	a805                	j	16dc <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    16ae:	4618                	lw	a4,8(a2)
    16b0:	9db9                	addw	a1,a1,a4
    16b2:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
    16b6:	6398                	ld	a4,0(a5)
    16b8:	6318                	ld	a4,0(a4)
    16ba:	fee53823          	sd	a4,-16(a0)
    16be:	a091                	j	1702 <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    16c0:	ff852703          	lw	a4,-8(a0)
    16c4:	9e39                	addw	a2,a2,a4
    16c6:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
    16c8:	ff053703          	ld	a4,-16(a0)
    16cc:	e398                	sd	a4,0(a5)
    16ce:	a099                	j	1714 <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16d0:	6398                	ld	a4,0(a5)
    16d2:	00e7e463          	bltu	a5,a4,16da <free+0x40>
    16d6:	00e6ea63          	bltu	a3,a4,16ea <free+0x50>
{
    16da:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16dc:	fed7fae3          	bgeu	a5,a3,16d0 <free+0x36>
    16e0:	6398                	ld	a4,0(a5)
    16e2:	00e6e463          	bltu	a3,a4,16ea <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16e6:	fee7eae3          	bltu	a5,a4,16da <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
    16ea:	ff852583          	lw	a1,-8(a0)
    16ee:	6390                	ld	a2,0(a5)
    16f0:	02059713          	slli	a4,a1,0x20
    16f4:	9301                	srli	a4,a4,0x20
    16f6:	0712                	slli	a4,a4,0x4
    16f8:	9736                	add	a4,a4,a3
    16fa:	fae60ae3          	beq	a2,a4,16ae <free+0x14>
    bp->s.ptr = p->s.ptr;
    16fe:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
    1702:	4790                	lw	a2,8(a5)
    1704:	02061713          	slli	a4,a2,0x20
    1708:	9301                	srli	a4,a4,0x20
    170a:	0712                	slli	a4,a4,0x4
    170c:	973e                	add	a4,a4,a5
    170e:	fae689e3          	beq	a3,a4,16c0 <free+0x26>
  } else
    p->s.ptr = bp;
    1712:	e394                	sd	a3,0(a5)
  freep = p;
    1714:	00000717          	auipc	a4,0x0
    1718:	30f73623          	sd	a5,780(a4) # 1a20 <freep>
}
    171c:	6422                	ld	s0,8(sp)
    171e:	0141                	addi	sp,sp,16
    1720:	8082                	ret

0000000000001722 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1722:	7139                	addi	sp,sp,-64
    1724:	fc06                	sd	ra,56(sp)
    1726:	f822                	sd	s0,48(sp)
    1728:	f426                	sd	s1,40(sp)
    172a:	f04a                	sd	s2,32(sp)
    172c:	ec4e                	sd	s3,24(sp)
    172e:	e852                	sd	s4,16(sp)
    1730:	e456                	sd	s5,8(sp)
    1732:	e05a                	sd	s6,0(sp)
    1734:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1736:	02051493          	slli	s1,a0,0x20
    173a:	9081                	srli	s1,s1,0x20
    173c:	04bd                	addi	s1,s1,15
    173e:	8091                	srli	s1,s1,0x4
    1740:	0014899b          	addiw	s3,s1,1
    1744:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
    1746:	00000517          	auipc	a0,0x0
    174a:	2da53503          	ld	a0,730(a0) # 1a20 <freep>
    174e:	c515                	beqz	a0,177a <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1750:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
    1752:	4798                	lw	a4,8(a5)
    1754:	02977f63          	bgeu	a4,s1,1792 <malloc+0x70>
    1758:	8a4e                	mv	s4,s3
    175a:	0009871b          	sext.w	a4,s3
    175e:	6685                	lui	a3,0x1
    1760:	00d77363          	bgeu	a4,a3,1766 <malloc+0x44>
    1764:	6a05                	lui	s4,0x1
    1766:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
    176a:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    176e:	00000917          	auipc	s2,0x0
    1772:	2b290913          	addi	s2,s2,690 # 1a20 <freep>
  if(p == (char*)-1)
    1776:	5afd                	li	s5,-1
    1778:	a88d                	j	17ea <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
    177a:	00001797          	auipc	a5,0x1
    177e:	b9678793          	addi	a5,a5,-1130 # 2310 <base>
    1782:	00000717          	auipc	a4,0x0
    1786:	28f73f23          	sd	a5,670(a4) # 1a20 <freep>
    178a:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
    178c:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
    1790:	b7e1                	j	1758 <malloc+0x36>
      if(p->s.size == nunits)
    1792:	02e48b63          	beq	s1,a4,17c8 <malloc+0xa6>
        p->s.size -= nunits;
    1796:	4137073b          	subw	a4,a4,s3
    179a:	c798                	sw	a4,8(a5)
        p += p->s.size;
    179c:	1702                	slli	a4,a4,0x20
    179e:	9301                	srli	a4,a4,0x20
    17a0:	0712                	slli	a4,a4,0x4
    17a2:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
    17a4:	0137a423          	sw	s3,8(a5)
      freep = prevp;
    17a8:	00000717          	auipc	a4,0x0
    17ac:	26a73c23          	sd	a0,632(a4) # 1a20 <freep>
      return (void*)(p + 1);
    17b0:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    17b4:	70e2                	ld	ra,56(sp)
    17b6:	7442                	ld	s0,48(sp)
    17b8:	74a2                	ld	s1,40(sp)
    17ba:	7902                	ld	s2,32(sp)
    17bc:	69e2                	ld	s3,24(sp)
    17be:	6a42                	ld	s4,16(sp)
    17c0:	6aa2                	ld	s5,8(sp)
    17c2:	6b02                	ld	s6,0(sp)
    17c4:	6121                	addi	sp,sp,64
    17c6:	8082                	ret
        prevp->s.ptr = p->s.ptr;
    17c8:	6398                	ld	a4,0(a5)
    17ca:	e118                	sd	a4,0(a0)
    17cc:	bff1                	j	17a8 <malloc+0x86>
  hp->s.size = nu;
    17ce:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
    17d2:	0541                	addi	a0,a0,16
    17d4:	00000097          	auipc	ra,0x0
    17d8:	ec6080e7          	jalr	-314(ra) # 169a <free>
  return freep;
    17dc:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
    17e0:	d971                	beqz	a0,17b4 <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    17e2:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
    17e4:	4798                	lw	a4,8(a5)
    17e6:	fa9776e3          	bgeu	a4,s1,1792 <malloc+0x70>
    if(p == freep)
    17ea:	00093703          	ld	a4,0(s2)
    17ee:	853e                	mv	a0,a5
    17f0:	fef719e3          	bne	a4,a5,17e2 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
    17f4:	8552                	mv	a0,s4
    17f6:	00000097          	auipc	ra,0x0
    17fa:	b3e080e7          	jalr	-1218(ra) # 1334 <sbrk>
  if(p == (char*)-1)
    17fe:	fd5518e3          	bne	a0,s5,17ce <malloc+0xac>
        return 0;
    1802:	4501                	li	a0,0
    1804:	bf45                	j	17b4 <malloc+0x92>
