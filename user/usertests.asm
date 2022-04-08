
user/_usertests:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <copyinstr1>:
}

// what if you pass ridiculous string pointers to system calls?
void
copyinstr1(char *s)
{
       0:	1141                	addi	sp,sp,-16
       2:	e406                	sd	ra,8(sp)
       4:	e022                	sd	s0,0(sp)
       6:	0800                	addi	s0,sp,16
  uint64 addrs[] = { 0x80000000LL, 0xffffffffffffffff };

  for(int ai = 0; ai < 2; ai++){
    uint64 addr = addrs[ai];

    int fd = open((char *)addr, O_CREATE|O_WRONLY);
       8:	20100593          	li	a1,513
       c:	4505                	li	a0,1
       e:	057e                	slli	a0,a0,0x1f
      10:	00005097          	auipc	ra,0x5
      14:	8e8080e7          	jalr	-1816(ra) # 48f8 <open>
    if(fd >= 0){
      18:	02055063          	bgez	a0,38 <copyinstr1+0x38>
    int fd = open((char *)addr, O_CREATE|O_WRONLY);
      1c:	20100593          	li	a1,513
      20:	557d                	li	a0,-1
      22:	00005097          	auipc	ra,0x5
      26:	8d6080e7          	jalr	-1834(ra) # 48f8 <open>
    uint64 addr = addrs[ai];
      2a:	55fd                	li	a1,-1
    if(fd >= 0){
      2c:	00055863          	bgez	a0,3c <copyinstr1+0x3c>
      printf("open(%p) returned %d, not -1\n", addr, fd);
      exit(1);
    }
  }
}
      30:	60a2                	ld	ra,8(sp)
      32:	6402                	ld	s0,0(sp)
      34:	0141                	addi	sp,sp,16
      36:	8082                	ret
    uint64 addr = addrs[ai];
      38:	4585                	li	a1,1
      3a:	05fe                	slli	a1,a1,0x1f
      printf("open(%p) returned %d, not -1\n", addr, fd);
      3c:	862a                	mv	a2,a0
      3e:	00005517          	auipc	a0,0x5
      42:	12250513          	addi	a0,a0,290 # 5160 <malloc+0x3b2>
      46:	00005097          	auipc	ra,0x5
      4a:	c82080e7          	jalr	-894(ra) # 4cc8 <printf>
      exit(1);
      4e:	4505                	li	a0,1
      50:	00005097          	auipc	ra,0x5
      54:	868080e7          	jalr	-1944(ra) # 48b8 <exit>

0000000000000058 <validatetest>:
  } 
}

void
validatetest(char *s)
{
      58:	7139                	addi	sp,sp,-64
      5a:	fc06                	sd	ra,56(sp)
      5c:	f822                	sd	s0,48(sp)
      5e:	f426                	sd	s1,40(sp)
      60:	f04a                	sd	s2,32(sp)
      62:	ec4e                	sd	s3,24(sp)
      64:	e852                	sd	s4,16(sp)
      66:	e456                	sd	s5,8(sp)
      68:	e05a                	sd	s6,0(sp)
      6a:	0080                	addi	s0,sp,64
      6c:	8b2a                	mv	s6,a0
  int hi;
  uint64 p;

  hi = 1100*1024;
  for(p = 0; p <= (uint)hi; p += PGSIZE){
      6e:	4481                	li	s1,0
    // try to crash the kernel by passing in a bad string pointer
    if(open((char*)p, O_RDONLY) != -1){
      70:	597d                	li	s2,-1
  for(p = 0; p <= (uint)hi; p += PGSIZE){
      72:	6a05                	lui	s4,0x1
      74:	001149b7          	lui	s3,0x114
    if(open((char*)p, O_RDONLY) != -1){
      78:	4581                	li	a1,0
      7a:	8526                	mv	a0,s1
      7c:	00005097          	auipc	ra,0x5
      80:	87c080e7          	jalr	-1924(ra) # 48f8 <open>
      84:	01251f63          	bne	a0,s2,a2 <validatetest+0x4a>
  for(p = 0; p <= (uint)hi; p += PGSIZE){
      88:	94d2                	add	s1,s1,s4
      8a:	ff3497e3          	bne	s1,s3,78 <validatetest+0x20>
      printf("%s: link should not succeed\n", s);
      printf("bad string:[%s]\n", (char*)p);
      exit(1);
    }
  }
}
      8e:	70e2                	ld	ra,56(sp)
      90:	7442                	ld	s0,48(sp)
      92:	74a2                	ld	s1,40(sp)
      94:	7902                	ld	s2,32(sp)
      96:	69e2                	ld	s3,24(sp)
      98:	6a42                	ld	s4,16(sp)
      9a:	6aa2                	ld	s5,8(sp)
      9c:	6b02                	ld	s6,0(sp)
      9e:	6121                	addi	sp,sp,64
      a0:	8082                	ret
      printf("%s: link should not succeed\n", s);
      a2:	85da                	mv	a1,s6
      a4:	00005517          	auipc	a0,0x5
      a8:	0dc50513          	addi	a0,a0,220 # 5180 <malloc+0x3d2>
      ac:	00005097          	auipc	ra,0x5
      b0:	c1c080e7          	jalr	-996(ra) # 4cc8 <printf>
      printf("bad string:[%s]\n", (char*)p);
      b4:	85a6                	mv	a1,s1
      b6:	00005517          	auipc	a0,0x5
      ba:	0ea50513          	addi	a0,a0,234 # 51a0 <malloc+0x3f2>
      be:	00005097          	auipc	ra,0x5
      c2:	c0a080e7          	jalr	-1014(ra) # 4cc8 <printf>
      exit(1);
      c6:	4505                	li	a0,1
      c8:	00004097          	auipc	ra,0x4
      cc:	7f0080e7          	jalr	2032(ra) # 48b8 <exit>

00000000000000d0 <bsstest>:
void
bsstest(char *s)
{
  int i;

  for(i = 0; i < sizeof(uninit); i++){
      d0:	00008797          	auipc	a5,0x8
      d4:	09078793          	addi	a5,a5,144 # 8160 <uninit>
      d8:	0000a697          	auipc	a3,0xa
      dc:	79868693          	addi	a3,a3,1944 # a870 <buf>
    if(uninit[i] != '\0'){
      e0:	0007c703          	lbu	a4,0(a5)
      e4:	e709                	bnez	a4,ee <bsstest+0x1e>
  for(i = 0; i < sizeof(uninit); i++){
      e6:	0785                	addi	a5,a5,1
      e8:	fed79ce3          	bne	a5,a3,e0 <bsstest+0x10>
      ec:	8082                	ret
{
      ee:	1141                	addi	sp,sp,-16
      f0:	e406                	sd	ra,8(sp)
      f2:	e022                	sd	s0,0(sp)
      f4:	0800                	addi	s0,sp,16
      printf("%s: bss test failed\n", s);
      f6:	85aa                	mv	a1,a0
      f8:	00005517          	auipc	a0,0x5
      fc:	0c050513          	addi	a0,a0,192 # 51b8 <malloc+0x40a>
     100:	00005097          	auipc	ra,0x5
     104:	bc8080e7          	jalr	-1080(ra) # 4cc8 <printf>
      exit(1);
     108:	4505                	li	a0,1
     10a:	00004097          	auipc	ra,0x4
     10e:	7ae080e7          	jalr	1966(ra) # 48b8 <exit>

0000000000000112 <opentest>:
{
     112:	1101                	addi	sp,sp,-32
     114:	ec06                	sd	ra,24(sp)
     116:	e822                	sd	s0,16(sp)
     118:	e426                	sd	s1,8(sp)
     11a:	1000                	addi	s0,sp,32
     11c:	84aa                	mv	s1,a0
  fd = open("echo", 0);
     11e:	4581                	li	a1,0
     120:	00005517          	auipc	a0,0x5
     124:	0b050513          	addi	a0,a0,176 # 51d0 <malloc+0x422>
     128:	00004097          	auipc	ra,0x4
     12c:	7d0080e7          	jalr	2000(ra) # 48f8 <open>
  if(fd < 0){
     130:	02054663          	bltz	a0,15c <opentest+0x4a>
  close(fd);
     134:	00004097          	auipc	ra,0x4
     138:	7ac080e7          	jalr	1964(ra) # 48e0 <close>
  fd = open("doesnotexist", 0);
     13c:	4581                	li	a1,0
     13e:	00005517          	auipc	a0,0x5
     142:	0b250513          	addi	a0,a0,178 # 51f0 <malloc+0x442>
     146:	00004097          	auipc	ra,0x4
     14a:	7b2080e7          	jalr	1970(ra) # 48f8 <open>
  if(fd >= 0){
     14e:	02055563          	bgez	a0,178 <opentest+0x66>
}
     152:	60e2                	ld	ra,24(sp)
     154:	6442                	ld	s0,16(sp)
     156:	64a2                	ld	s1,8(sp)
     158:	6105                	addi	sp,sp,32
     15a:	8082                	ret
    printf("%s: open echo failed!\n", s);
     15c:	85a6                	mv	a1,s1
     15e:	00005517          	auipc	a0,0x5
     162:	07a50513          	addi	a0,a0,122 # 51d8 <malloc+0x42a>
     166:	00005097          	auipc	ra,0x5
     16a:	b62080e7          	jalr	-1182(ra) # 4cc8 <printf>
    exit(1);
     16e:	4505                	li	a0,1
     170:	00004097          	auipc	ra,0x4
     174:	748080e7          	jalr	1864(ra) # 48b8 <exit>
    printf("%s: open doesnotexist succeeded!\n", s);
     178:	85a6                	mv	a1,s1
     17a:	00005517          	auipc	a0,0x5
     17e:	08650513          	addi	a0,a0,134 # 5200 <malloc+0x452>
     182:	00005097          	auipc	ra,0x5
     186:	b46080e7          	jalr	-1210(ra) # 4cc8 <printf>
    exit(1);
     18a:	4505                	li	a0,1
     18c:	00004097          	auipc	ra,0x4
     190:	72c080e7          	jalr	1836(ra) # 48b8 <exit>

0000000000000194 <truncate2>:
{
     194:	7179                	addi	sp,sp,-48
     196:	f406                	sd	ra,40(sp)
     198:	f022                	sd	s0,32(sp)
     19a:	ec26                	sd	s1,24(sp)
     19c:	e84a                	sd	s2,16(sp)
     19e:	e44e                	sd	s3,8(sp)
     1a0:	1800                	addi	s0,sp,48
     1a2:	89aa                	mv	s3,a0
  remove("truncfile");
     1a4:	00005517          	auipc	a0,0x5
     1a8:	08450513          	addi	a0,a0,132 # 5228 <malloc+0x47a>
     1ac:	00004097          	auipc	ra,0x4
     1b0:	7b4080e7          	jalr	1972(ra) # 4960 <remove>
  int fd1 = open("truncfile", O_CREATE|O_TRUNC|O_WRONLY);
     1b4:	60100593          	li	a1,1537
     1b8:	00005517          	auipc	a0,0x5
     1bc:	07050513          	addi	a0,a0,112 # 5228 <malloc+0x47a>
     1c0:	00004097          	auipc	ra,0x4
     1c4:	738080e7          	jalr	1848(ra) # 48f8 <open>
     1c8:	84aa                	mv	s1,a0
  write(fd1, "abcd", 4);
     1ca:	4611                	li	a2,4
     1cc:	00005597          	auipc	a1,0x5
     1d0:	06c58593          	addi	a1,a1,108 # 5238 <malloc+0x48a>
     1d4:	00004097          	auipc	ra,0x4
     1d8:	704080e7          	jalr	1796(ra) # 48d8 <write>
  int fd2 = open("truncfile", O_TRUNC|O_WRONLY);
     1dc:	40100593          	li	a1,1025
     1e0:	00005517          	auipc	a0,0x5
     1e4:	04850513          	addi	a0,a0,72 # 5228 <malloc+0x47a>
     1e8:	00004097          	auipc	ra,0x4
     1ec:	710080e7          	jalr	1808(ra) # 48f8 <open>
     1f0:	892a                	mv	s2,a0
  int n = write(fd1, "x", 1);
     1f2:	4605                	li	a2,1
     1f4:	00005597          	auipc	a1,0x5
     1f8:	04c58593          	addi	a1,a1,76 # 5240 <malloc+0x492>
     1fc:	8526                	mv	a0,s1
     1fe:	00004097          	auipc	ra,0x4
     202:	6da080e7          	jalr	1754(ra) # 48d8 <write>
  if(n != -1){
     206:	57fd                	li	a5,-1
     208:	02f51b63          	bne	a0,a5,23e <truncate2+0xaa>
  remove("truncfile");
     20c:	00005517          	auipc	a0,0x5
     210:	01c50513          	addi	a0,a0,28 # 5228 <malloc+0x47a>
     214:	00004097          	auipc	ra,0x4
     218:	74c080e7          	jalr	1868(ra) # 4960 <remove>
  close(fd1);
     21c:	8526                	mv	a0,s1
     21e:	00004097          	auipc	ra,0x4
     222:	6c2080e7          	jalr	1730(ra) # 48e0 <close>
  close(fd2);
     226:	854a                	mv	a0,s2
     228:	00004097          	auipc	ra,0x4
     22c:	6b8080e7          	jalr	1720(ra) # 48e0 <close>
}
     230:	70a2                	ld	ra,40(sp)
     232:	7402                	ld	s0,32(sp)
     234:	64e2                	ld	s1,24(sp)
     236:	6942                	ld	s2,16(sp)
     238:	69a2                	ld	s3,8(sp)
     23a:	6145                	addi	sp,sp,48
     23c:	8082                	ret
    printf("%s: write returned %d, expected -1\n", s, n);
     23e:	862a                	mv	a2,a0
     240:	85ce                	mv	a1,s3
     242:	00005517          	auipc	a0,0x5
     246:	00650513          	addi	a0,a0,6 # 5248 <malloc+0x49a>
     24a:	00005097          	auipc	ra,0x5
     24e:	a7e080e7          	jalr	-1410(ra) # 4cc8 <printf>
    exit(1);
     252:	4505                	li	a0,1
     254:	00004097          	auipc	ra,0x4
     258:	664080e7          	jalr	1636(ra) # 48b8 <exit>

000000000000025c <createtest>:
{
     25c:	7179                	addi	sp,sp,-48
     25e:	f406                	sd	ra,40(sp)
     260:	f022                	sd	s0,32(sp)
     262:	ec26                	sd	s1,24(sp)
     264:	e84a                	sd	s2,16(sp)
     266:	e44e                	sd	s3,8(sp)
     268:	1800                	addi	s0,sp,48
  name[0] = 'a';
     26a:	00007797          	auipc	a5,0x7
     26e:	dde78793          	addi	a5,a5,-546 # 7048 <name>
     272:	06100713          	li	a4,97
     276:	00e78023          	sb	a4,0(a5)
  name[2] = '\0';
     27a:	00078123          	sb	zero,2(a5)
     27e:	03000493          	li	s1,48
    name[1] = '0' + i;
     282:	893e                	mv	s2,a5
  for(i = 0; i < N; i++){
     284:	06400993          	li	s3,100
    name[1] = '0' + i;
     288:	009900a3          	sb	s1,1(s2)
    fd = open(name, O_CREATE|O_RDWR);
     28c:	20200593          	li	a1,514
     290:	854a                	mv	a0,s2
     292:	00004097          	auipc	ra,0x4
     296:	666080e7          	jalr	1638(ra) # 48f8 <open>
    close(fd);
     29a:	00004097          	auipc	ra,0x4
     29e:	646080e7          	jalr	1606(ra) # 48e0 <close>
  for(i = 0; i < N; i++){
     2a2:	2485                	addiw	s1,s1,1
     2a4:	0ff4f493          	andi	s1,s1,255
     2a8:	ff3490e3          	bne	s1,s3,288 <createtest+0x2c>
  name[0] = 'a';
     2ac:	00007797          	auipc	a5,0x7
     2b0:	d9c78793          	addi	a5,a5,-612 # 7048 <name>
     2b4:	06100713          	li	a4,97
     2b8:	00e78023          	sb	a4,0(a5)
  name[2] = '\0';
     2bc:	00078123          	sb	zero,2(a5)
     2c0:	03000493          	li	s1,48
    name[1] = '0' + i;
     2c4:	893e                	mv	s2,a5
  for(i = 0; i < N; i++){
     2c6:	06400993          	li	s3,100
    name[1] = '0' + i;
     2ca:	009900a3          	sb	s1,1(s2)
    remove(name);
     2ce:	854a                	mv	a0,s2
     2d0:	00004097          	auipc	ra,0x4
     2d4:	690080e7          	jalr	1680(ra) # 4960 <remove>
  for(i = 0; i < N; i++){
     2d8:	2485                	addiw	s1,s1,1
     2da:	0ff4f493          	andi	s1,s1,255
     2de:	ff3496e3          	bne	s1,s3,2ca <createtest+0x6e>
}
     2e2:	70a2                	ld	ra,40(sp)
     2e4:	7402                	ld	s0,32(sp)
     2e6:	64e2                	ld	s1,24(sp)
     2e8:	6942                	ld	s2,16(sp)
     2ea:	69a2                	ld	s3,8(sp)
     2ec:	6145                	addi	sp,sp,48
     2ee:	8082                	ret

00000000000002f0 <bigwrite>:
{
     2f0:	715d                	addi	sp,sp,-80
     2f2:	e486                	sd	ra,72(sp)
     2f4:	e0a2                	sd	s0,64(sp)
     2f6:	fc26                	sd	s1,56(sp)
     2f8:	f84a                	sd	s2,48(sp)
     2fa:	f44e                	sd	s3,40(sp)
     2fc:	f052                	sd	s4,32(sp)
     2fe:	ec56                	sd	s5,24(sp)
     300:	e85a                	sd	s6,16(sp)
     302:	e45e                	sd	s7,8(sp)
     304:	0880                	addi	s0,sp,80
     306:	8baa                	mv	s7,a0
  remove("bigwrite");
     308:	00005517          	auipc	a0,0x5
     30c:	d2050513          	addi	a0,a0,-736 # 5028 <malloc+0x27a>
     310:	00004097          	auipc	ra,0x4
     314:	650080e7          	jalr	1616(ra) # 4960 <remove>
  for(sz = 499; sz < (MAXOPBLOCKS+2)*BSIZE; sz += 471){
     318:	1f300493          	li	s1,499
    fd = open("bigwrite", O_CREATE | O_RDWR);
     31c:	00005a97          	auipc	s5,0x5
     320:	d0ca8a93          	addi	s5,s5,-756 # 5028 <malloc+0x27a>
      int cc = write(fd, buf, sz);
     324:	0000aa17          	auipc	s4,0xa
     328:	54ca0a13          	addi	s4,s4,1356 # a870 <buf>
  for(sz = 499; sz < (MAXOPBLOCKS+2)*BSIZE; sz += 471){
     32c:	6b09                	lui	s6,0x2
     32e:	807b0b13          	addi	s6,s6,-2041 # 1807 <forkfork+0x6f>
    fd = open("bigwrite", O_CREATE | O_RDWR);
     332:	20200593          	li	a1,514
     336:	8556                	mv	a0,s5
     338:	00004097          	auipc	ra,0x4
     33c:	5c0080e7          	jalr	1472(ra) # 48f8 <open>
     340:	892a                	mv	s2,a0
    if(fd < 0){
     342:	04054d63          	bltz	a0,39c <bigwrite+0xac>
      int cc = write(fd, buf, sz);
     346:	8626                	mv	a2,s1
     348:	85d2                	mv	a1,s4
     34a:	00004097          	auipc	ra,0x4
     34e:	58e080e7          	jalr	1422(ra) # 48d8 <write>
     352:	89aa                	mv	s3,a0
      if(cc != sz){
     354:	06a49463          	bne	s1,a0,3bc <bigwrite+0xcc>
      int cc = write(fd, buf, sz);
     358:	8626                	mv	a2,s1
     35a:	85d2                	mv	a1,s4
     35c:	854a                	mv	a0,s2
     35e:	00004097          	auipc	ra,0x4
     362:	57a080e7          	jalr	1402(ra) # 48d8 <write>
      if(cc != sz){
     366:	04951963          	bne	a0,s1,3b8 <bigwrite+0xc8>
    close(fd);
     36a:	854a                	mv	a0,s2
     36c:	00004097          	auipc	ra,0x4
     370:	574080e7          	jalr	1396(ra) # 48e0 <close>
    remove("bigwrite");
     374:	8556                	mv	a0,s5
     376:	00004097          	auipc	ra,0x4
     37a:	5ea080e7          	jalr	1514(ra) # 4960 <remove>
  for(sz = 499; sz < (MAXOPBLOCKS+2)*BSIZE; sz += 471){
     37e:	1d74849b          	addiw	s1,s1,471
     382:	fb6498e3          	bne	s1,s6,332 <bigwrite+0x42>
}
     386:	60a6                	ld	ra,72(sp)
     388:	6406                	ld	s0,64(sp)
     38a:	74e2                	ld	s1,56(sp)
     38c:	7942                	ld	s2,48(sp)
     38e:	79a2                	ld	s3,40(sp)
     390:	7a02                	ld	s4,32(sp)
     392:	6ae2                	ld	s5,24(sp)
     394:	6b42                	ld	s6,16(sp)
     396:	6ba2                	ld	s7,8(sp)
     398:	6161                	addi	sp,sp,80
     39a:	8082                	ret
      printf("%s: cannot create bigwrite\n", s);
     39c:	85de                	mv	a1,s7
     39e:	00005517          	auipc	a0,0x5
     3a2:	ed250513          	addi	a0,a0,-302 # 5270 <malloc+0x4c2>
     3a6:	00005097          	auipc	ra,0x5
     3aa:	922080e7          	jalr	-1758(ra) # 4cc8 <printf>
      exit(1);
     3ae:	4505                	li	a0,1
     3b0:	00004097          	auipc	ra,0x4
     3b4:	508080e7          	jalr	1288(ra) # 48b8 <exit>
     3b8:	84ce                	mv	s1,s3
      int cc = write(fd, buf, sz);
     3ba:	89aa                	mv	s3,a0
        printf("%s: write(%d) ret %d\n", s, sz, cc);
     3bc:	86ce                	mv	a3,s3
     3be:	8626                	mv	a2,s1
     3c0:	85de                	mv	a1,s7
     3c2:	00005517          	auipc	a0,0x5
     3c6:	ece50513          	addi	a0,a0,-306 # 5290 <malloc+0x4e2>
     3ca:	00005097          	auipc	ra,0x5
     3ce:	8fe080e7          	jalr	-1794(ra) # 4cc8 <printf>
        exit(1);
     3d2:	4505                	li	a0,1
     3d4:	00004097          	auipc	ra,0x4
     3d8:	4e4080e7          	jalr	1252(ra) # 48b8 <exit>

00000000000003dc <badwrite>:
// file is deleted? if the kernel has this bug, it will panic: balloc:
// out of blocks. assumed_free may need to be raised to be more than
// the number of free blocks. this test takes a long time.
void
badwrite(char *s)
{
     3dc:	7179                	addi	sp,sp,-48
     3de:	f406                	sd	ra,40(sp)
     3e0:	f022                	sd	s0,32(sp)
     3e2:	ec26                	sd	s1,24(sp)
     3e4:	e84a                	sd	s2,16(sp)
     3e6:	e44e                	sd	s3,8(sp)
     3e8:	e052                	sd	s4,0(sp)
     3ea:	1800                	addi	s0,sp,48
  int assumed_free = 600;
  
  remove("junk");
     3ec:	00005517          	auipc	a0,0x5
     3f0:	ebc50513          	addi	a0,a0,-324 # 52a8 <malloc+0x4fa>
     3f4:	00004097          	auipc	ra,0x4
     3f8:	56c080e7          	jalr	1388(ra) # 4960 <remove>
     3fc:	25800913          	li	s2,600
  for(int i = 0; i < assumed_free; i++){
    int fd = open("junk", O_CREATE|O_WRONLY);
     400:	00005997          	auipc	s3,0x5
     404:	ea898993          	addi	s3,s3,-344 # 52a8 <malloc+0x4fa>
    if(fd < 0){
      printf("open junk failed\n");
      exit(1);
    }
    write(fd, (char*)0xffffffffffL, 1);
     408:	5a7d                	li	s4,-1
     40a:	018a5a13          	srli	s4,s4,0x18
    int fd = open("junk", O_CREATE|O_WRONLY);
     40e:	20100593          	li	a1,513
     412:	854e                	mv	a0,s3
     414:	00004097          	auipc	ra,0x4
     418:	4e4080e7          	jalr	1252(ra) # 48f8 <open>
     41c:	84aa                	mv	s1,a0
    if(fd < 0){
     41e:	06054b63          	bltz	a0,494 <badwrite+0xb8>
    write(fd, (char*)0xffffffffffL, 1);
     422:	4605                	li	a2,1
     424:	85d2                	mv	a1,s4
     426:	00004097          	auipc	ra,0x4
     42a:	4b2080e7          	jalr	1202(ra) # 48d8 <write>
    close(fd);
     42e:	8526                	mv	a0,s1
     430:	00004097          	auipc	ra,0x4
     434:	4b0080e7          	jalr	1200(ra) # 48e0 <close>
    remove("junk");
     438:	854e                	mv	a0,s3
     43a:	00004097          	auipc	ra,0x4
     43e:	526080e7          	jalr	1318(ra) # 4960 <remove>
  for(int i = 0; i < assumed_free; i++){
     442:	397d                	addiw	s2,s2,-1
     444:	fc0915e3          	bnez	s2,40e <badwrite+0x32>
  }

  int fd = open("junk", O_CREATE|O_WRONLY);
     448:	20100593          	li	a1,513
     44c:	00005517          	auipc	a0,0x5
     450:	e5c50513          	addi	a0,a0,-420 # 52a8 <malloc+0x4fa>
     454:	00004097          	auipc	ra,0x4
     458:	4a4080e7          	jalr	1188(ra) # 48f8 <open>
     45c:	84aa                	mv	s1,a0
  if(fd < 0){
     45e:	04054863          	bltz	a0,4ae <badwrite+0xd2>
    printf("open junk failed\n");
    exit(1);
  }
  if(write(fd, "x", 1) != 1){
     462:	4605                	li	a2,1
     464:	00005597          	auipc	a1,0x5
     468:	ddc58593          	addi	a1,a1,-548 # 5240 <malloc+0x492>
     46c:	00004097          	auipc	ra,0x4
     470:	46c080e7          	jalr	1132(ra) # 48d8 <write>
     474:	4785                	li	a5,1
     476:	04f50963          	beq	a0,a5,4c8 <badwrite+0xec>
    printf("write failed\n");
     47a:	00005517          	auipc	a0,0x5
     47e:	e4e50513          	addi	a0,a0,-434 # 52c8 <malloc+0x51a>
     482:	00005097          	auipc	ra,0x5
     486:	846080e7          	jalr	-1978(ra) # 4cc8 <printf>
    exit(1);
     48a:	4505                	li	a0,1
     48c:	00004097          	auipc	ra,0x4
     490:	42c080e7          	jalr	1068(ra) # 48b8 <exit>
      printf("open junk failed\n");
     494:	00005517          	auipc	a0,0x5
     498:	e1c50513          	addi	a0,a0,-484 # 52b0 <malloc+0x502>
     49c:	00005097          	auipc	ra,0x5
     4a0:	82c080e7          	jalr	-2004(ra) # 4cc8 <printf>
      exit(1);
     4a4:	4505                	li	a0,1
     4a6:	00004097          	auipc	ra,0x4
     4aa:	412080e7          	jalr	1042(ra) # 48b8 <exit>
    printf("open junk failed\n");
     4ae:	00005517          	auipc	a0,0x5
     4b2:	e0250513          	addi	a0,a0,-510 # 52b0 <malloc+0x502>
     4b6:	00005097          	auipc	ra,0x5
     4ba:	812080e7          	jalr	-2030(ra) # 4cc8 <printf>
    exit(1);
     4be:	4505                	li	a0,1
     4c0:	00004097          	auipc	ra,0x4
     4c4:	3f8080e7          	jalr	1016(ra) # 48b8 <exit>
  }
  close(fd);
     4c8:	8526                	mv	a0,s1
     4ca:	00004097          	auipc	ra,0x4
     4ce:	416080e7          	jalr	1046(ra) # 48e0 <close>
  remove("junk");
     4d2:	00005517          	auipc	a0,0x5
     4d6:	dd650513          	addi	a0,a0,-554 # 52a8 <malloc+0x4fa>
     4da:	00004097          	auipc	ra,0x4
     4de:	486080e7          	jalr	1158(ra) # 4960 <remove>

  exit(0);
     4e2:	4501                	li	a0,0
     4e4:	00004097          	auipc	ra,0x4
     4e8:	3d4080e7          	jalr	980(ra) # 48b8 <exit>

00000000000004ec <copyin>:
{
     4ec:	715d                	addi	sp,sp,-80
     4ee:	e486                	sd	ra,72(sp)
     4f0:	e0a2                	sd	s0,64(sp)
     4f2:	fc26                	sd	s1,56(sp)
     4f4:	f84a                	sd	s2,48(sp)
     4f6:	f44e                	sd	s3,40(sp)
     4f8:	f052                	sd	s4,32(sp)
     4fa:	0880                	addi	s0,sp,80
  uint64 addrs[] = { 0x80000000LL, 0xffffffffffffffff };
     4fc:	4785                	li	a5,1
     4fe:	07fe                	slli	a5,a5,0x1f
     500:	fcf43023          	sd	a5,-64(s0)
     504:	57fd                	li	a5,-1
     506:	fcf43423          	sd	a5,-56(s0)
  for(int ai = 0; ai < 2; ai++){
     50a:	fc040913          	addi	s2,s0,-64
    int fd = open("copyin1", O_CREATE|O_WRONLY);
     50e:	00005a17          	auipc	s4,0x5
     512:	dcaa0a13          	addi	s4,s4,-566 # 52d8 <malloc+0x52a>
    uint64 addr = addrs[ai];
     516:	00093983          	ld	s3,0(s2)
    int fd = open("copyin1", O_CREATE|O_WRONLY);
     51a:	20100593          	li	a1,513
     51e:	8552                	mv	a0,s4
     520:	00004097          	auipc	ra,0x4
     524:	3d8080e7          	jalr	984(ra) # 48f8 <open>
     528:	84aa                	mv	s1,a0
    if(fd < 0){
     52a:	08054863          	bltz	a0,5ba <copyin+0xce>
    int n = write(fd, (void*)addr, 8192);
     52e:	6609                	lui	a2,0x2
     530:	85ce                	mv	a1,s3
     532:	00004097          	auipc	ra,0x4
     536:	3a6080e7          	jalr	934(ra) # 48d8 <write>
    if(n >= 0){
     53a:	08055d63          	bgez	a0,5d4 <copyin+0xe8>
    close(fd);
     53e:	8526                	mv	a0,s1
     540:	00004097          	auipc	ra,0x4
     544:	3a0080e7          	jalr	928(ra) # 48e0 <close>
    remove("copyin1");
     548:	8552                	mv	a0,s4
     54a:	00004097          	auipc	ra,0x4
     54e:	416080e7          	jalr	1046(ra) # 4960 <remove>
    n = write(1, (char*)addr, 8192);
     552:	6609                	lui	a2,0x2
     554:	85ce                	mv	a1,s3
     556:	4505                	li	a0,1
     558:	00004097          	auipc	ra,0x4
     55c:	380080e7          	jalr	896(ra) # 48d8 <write>
    if(n > 0){
     560:	08a04963          	bgtz	a0,5f2 <copyin+0x106>
    if(pipe(fds) < 0){
     564:	fb840513          	addi	a0,s0,-72
     568:	00004097          	auipc	ra,0x4
     56c:	360080e7          	jalr	864(ra) # 48c8 <pipe>
     570:	0a054063          	bltz	a0,610 <copyin+0x124>
    n = write(fds[1], (char*)addr, 8192);
     574:	6609                	lui	a2,0x2
     576:	85ce                	mv	a1,s3
     578:	fbc42503          	lw	a0,-68(s0)
     57c:	00004097          	auipc	ra,0x4
     580:	35c080e7          	jalr	860(ra) # 48d8 <write>
    if(n > 0){
     584:	0aa04363          	bgtz	a0,62a <copyin+0x13e>
    close(fds[0]);
     588:	fb842503          	lw	a0,-72(s0)
     58c:	00004097          	auipc	ra,0x4
     590:	354080e7          	jalr	852(ra) # 48e0 <close>
    close(fds[1]);
     594:	fbc42503          	lw	a0,-68(s0)
     598:	00004097          	auipc	ra,0x4
     59c:	348080e7          	jalr	840(ra) # 48e0 <close>
  for(int ai = 0; ai < 2; ai++){
     5a0:	0921                	addi	s2,s2,8
     5a2:	fd040793          	addi	a5,s0,-48
     5a6:	f6f918e3          	bne	s2,a5,516 <copyin+0x2a>
}
     5aa:	60a6                	ld	ra,72(sp)
     5ac:	6406                	ld	s0,64(sp)
     5ae:	74e2                	ld	s1,56(sp)
     5b0:	7942                	ld	s2,48(sp)
     5b2:	79a2                	ld	s3,40(sp)
     5b4:	7a02                	ld	s4,32(sp)
     5b6:	6161                	addi	sp,sp,80
     5b8:	8082                	ret
      printf("open(copyin1) failed\n");
     5ba:	00005517          	auipc	a0,0x5
     5be:	d2650513          	addi	a0,a0,-730 # 52e0 <malloc+0x532>
     5c2:	00004097          	auipc	ra,0x4
     5c6:	706080e7          	jalr	1798(ra) # 4cc8 <printf>
      exit(1);
     5ca:	4505                	li	a0,1
     5cc:	00004097          	auipc	ra,0x4
     5d0:	2ec080e7          	jalr	748(ra) # 48b8 <exit>
      printf("write(fd, %p, 8192) returned %d, not -1\n", addr, n);
     5d4:	862a                	mv	a2,a0
     5d6:	85ce                	mv	a1,s3
     5d8:	00005517          	auipc	a0,0x5
     5dc:	d2050513          	addi	a0,a0,-736 # 52f8 <malloc+0x54a>
     5e0:	00004097          	auipc	ra,0x4
     5e4:	6e8080e7          	jalr	1768(ra) # 4cc8 <printf>
      exit(1);
     5e8:	4505                	li	a0,1
     5ea:	00004097          	auipc	ra,0x4
     5ee:	2ce080e7          	jalr	718(ra) # 48b8 <exit>
      printf("write(1, %p, 8192) returned %d, not -1 or 0\n", addr, n);
     5f2:	862a                	mv	a2,a0
     5f4:	85ce                	mv	a1,s3
     5f6:	00005517          	auipc	a0,0x5
     5fa:	d3250513          	addi	a0,a0,-718 # 5328 <malloc+0x57a>
     5fe:	00004097          	auipc	ra,0x4
     602:	6ca080e7          	jalr	1738(ra) # 4cc8 <printf>
      exit(1);
     606:	4505                	li	a0,1
     608:	00004097          	auipc	ra,0x4
     60c:	2b0080e7          	jalr	688(ra) # 48b8 <exit>
      printf("pipe() failed\n");
     610:	00005517          	auipc	a0,0x5
     614:	d4850513          	addi	a0,a0,-696 # 5358 <malloc+0x5aa>
     618:	00004097          	auipc	ra,0x4
     61c:	6b0080e7          	jalr	1712(ra) # 4cc8 <printf>
      exit(1);
     620:	4505                	li	a0,1
     622:	00004097          	auipc	ra,0x4
     626:	296080e7          	jalr	662(ra) # 48b8 <exit>
      printf("write(pipe, %p, 8192) returned %d, not -1 or 0\n", addr, n);
     62a:	862a                	mv	a2,a0
     62c:	85ce                	mv	a1,s3
     62e:	00005517          	auipc	a0,0x5
     632:	d3a50513          	addi	a0,a0,-710 # 5368 <malloc+0x5ba>
     636:	00004097          	auipc	ra,0x4
     63a:	692080e7          	jalr	1682(ra) # 4cc8 <printf>
      exit(1);
     63e:	4505                	li	a0,1
     640:	00004097          	auipc	ra,0x4
     644:	278080e7          	jalr	632(ra) # 48b8 <exit>

0000000000000648 <copyout>:
{
     648:	711d                	addi	sp,sp,-96
     64a:	ec86                	sd	ra,88(sp)
     64c:	e8a2                	sd	s0,80(sp)
     64e:	e4a6                	sd	s1,72(sp)
     650:	e0ca                	sd	s2,64(sp)
     652:	fc4e                	sd	s3,56(sp)
     654:	f852                	sd	s4,48(sp)
     656:	f456                	sd	s5,40(sp)
     658:	1080                	addi	s0,sp,96
  uint64 addrs[] = { 0x80000000LL, 0xffffffffffffffff };
     65a:	4785                	li	a5,1
     65c:	07fe                	slli	a5,a5,0x1f
     65e:	faf43823          	sd	a5,-80(s0)
     662:	57fd                	li	a5,-1
     664:	faf43c23          	sd	a5,-72(s0)
  for(int ai = 0; ai < 2; ai++){
     668:	fb040913          	addi	s2,s0,-80
    int fd = open("README", 0);
     66c:	00005a17          	auipc	s4,0x5
     670:	d2ca0a13          	addi	s4,s4,-724 # 5398 <malloc+0x5ea>
    n = write(fds[1], "x", 1);
     674:	00005a97          	auipc	s5,0x5
     678:	bcca8a93          	addi	s5,s5,-1076 # 5240 <malloc+0x492>
    uint64 addr = addrs[ai];
     67c:	00093983          	ld	s3,0(s2)
    int fd = open("README", 0);
     680:	4581                	li	a1,0
     682:	8552                	mv	a0,s4
     684:	00004097          	auipc	ra,0x4
     688:	274080e7          	jalr	628(ra) # 48f8 <open>
     68c:	84aa                	mv	s1,a0
    if(fd < 0){
     68e:	08054663          	bltz	a0,71a <copyout+0xd2>
    int n = read(fd, (void*)addr, 8192);
     692:	6609                	lui	a2,0x2
     694:	85ce                	mv	a1,s3
     696:	00004097          	auipc	ra,0x4
     69a:	23a080e7          	jalr	570(ra) # 48d0 <read>
    if(n > 0){
     69e:	08a04b63          	bgtz	a0,734 <copyout+0xec>
    close(fd);
     6a2:	8526                	mv	a0,s1
     6a4:	00004097          	auipc	ra,0x4
     6a8:	23c080e7          	jalr	572(ra) # 48e0 <close>
    if(pipe(fds) < 0){
     6ac:	fa840513          	addi	a0,s0,-88
     6b0:	00004097          	auipc	ra,0x4
     6b4:	218080e7          	jalr	536(ra) # 48c8 <pipe>
     6b8:	08054d63          	bltz	a0,752 <copyout+0x10a>
    n = write(fds[1], "x", 1);
     6bc:	4605                	li	a2,1
     6be:	85d6                	mv	a1,s5
     6c0:	fac42503          	lw	a0,-84(s0)
     6c4:	00004097          	auipc	ra,0x4
     6c8:	214080e7          	jalr	532(ra) # 48d8 <write>
    if(n != 1){
     6cc:	4785                	li	a5,1
     6ce:	08f51f63          	bne	a0,a5,76c <copyout+0x124>
    n = read(fds[0], (void*)addr, 8192);
     6d2:	6609                	lui	a2,0x2
     6d4:	85ce                	mv	a1,s3
     6d6:	fa842503          	lw	a0,-88(s0)
     6da:	00004097          	auipc	ra,0x4
     6de:	1f6080e7          	jalr	502(ra) # 48d0 <read>
    if(n > 0){
     6e2:	0aa04263          	bgtz	a0,786 <copyout+0x13e>
    close(fds[0]);
     6e6:	fa842503          	lw	a0,-88(s0)
     6ea:	00004097          	auipc	ra,0x4
     6ee:	1f6080e7          	jalr	502(ra) # 48e0 <close>
    close(fds[1]);
     6f2:	fac42503          	lw	a0,-84(s0)
     6f6:	00004097          	auipc	ra,0x4
     6fa:	1ea080e7          	jalr	490(ra) # 48e0 <close>
  for(int ai = 0; ai < 2; ai++){
     6fe:	0921                	addi	s2,s2,8
     700:	fc040793          	addi	a5,s0,-64
     704:	f6f91ce3          	bne	s2,a5,67c <copyout+0x34>
}
     708:	60e6                	ld	ra,88(sp)
     70a:	6446                	ld	s0,80(sp)
     70c:	64a6                	ld	s1,72(sp)
     70e:	6906                	ld	s2,64(sp)
     710:	79e2                	ld	s3,56(sp)
     712:	7a42                	ld	s4,48(sp)
     714:	7aa2                	ld	s5,40(sp)
     716:	6125                	addi	sp,sp,96
     718:	8082                	ret
      printf("open(README) failed\n");
     71a:	00005517          	auipc	a0,0x5
     71e:	c8650513          	addi	a0,a0,-890 # 53a0 <malloc+0x5f2>
     722:	00004097          	auipc	ra,0x4
     726:	5a6080e7          	jalr	1446(ra) # 4cc8 <printf>
      exit(1);
     72a:	4505                	li	a0,1
     72c:	00004097          	auipc	ra,0x4
     730:	18c080e7          	jalr	396(ra) # 48b8 <exit>
      printf("read(fd, %p, 8192) returned %d, not -1 or 0\n", addr, n);
     734:	862a                	mv	a2,a0
     736:	85ce                	mv	a1,s3
     738:	00005517          	auipc	a0,0x5
     73c:	c8050513          	addi	a0,a0,-896 # 53b8 <malloc+0x60a>
     740:	00004097          	auipc	ra,0x4
     744:	588080e7          	jalr	1416(ra) # 4cc8 <printf>
      exit(1);
     748:	4505                	li	a0,1
     74a:	00004097          	auipc	ra,0x4
     74e:	16e080e7          	jalr	366(ra) # 48b8 <exit>
      printf("pipe() failed\n");
     752:	00005517          	auipc	a0,0x5
     756:	c0650513          	addi	a0,a0,-1018 # 5358 <malloc+0x5aa>
     75a:	00004097          	auipc	ra,0x4
     75e:	56e080e7          	jalr	1390(ra) # 4cc8 <printf>
      exit(1);
     762:	4505                	li	a0,1
     764:	00004097          	auipc	ra,0x4
     768:	154080e7          	jalr	340(ra) # 48b8 <exit>
      printf("pipe write failed\n");
     76c:	00005517          	auipc	a0,0x5
     770:	c7c50513          	addi	a0,a0,-900 # 53e8 <malloc+0x63a>
     774:	00004097          	auipc	ra,0x4
     778:	554080e7          	jalr	1364(ra) # 4cc8 <printf>
      exit(1);
     77c:	4505                	li	a0,1
     77e:	00004097          	auipc	ra,0x4
     782:	13a080e7          	jalr	314(ra) # 48b8 <exit>
      printf("read(pipe, %p, 8192) returned %d, not -1 or 0\n", addr, n);
     786:	862a                	mv	a2,a0
     788:	85ce                	mv	a1,s3
     78a:	00005517          	auipc	a0,0x5
     78e:	c7650513          	addi	a0,a0,-906 # 5400 <malloc+0x652>
     792:	00004097          	auipc	ra,0x4
     796:	536080e7          	jalr	1334(ra) # 4cc8 <printf>
      exit(1);
     79a:	4505                	li	a0,1
     79c:	00004097          	auipc	ra,0x4
     7a0:	11c080e7          	jalr	284(ra) # 48b8 <exit>

00000000000007a4 <truncate1>:
{
     7a4:	711d                	addi	sp,sp,-96
     7a6:	ec86                	sd	ra,88(sp)
     7a8:	e8a2                	sd	s0,80(sp)
     7aa:	e4a6                	sd	s1,72(sp)
     7ac:	e0ca                	sd	s2,64(sp)
     7ae:	fc4e                	sd	s3,56(sp)
     7b0:	f852                	sd	s4,48(sp)
     7b2:	f456                	sd	s5,40(sp)
     7b4:	1080                	addi	s0,sp,96
     7b6:	8aaa                	mv	s5,a0
  remove("truncfile");
     7b8:	00005517          	auipc	a0,0x5
     7bc:	a7050513          	addi	a0,a0,-1424 # 5228 <malloc+0x47a>
     7c0:	00004097          	auipc	ra,0x4
     7c4:	1a0080e7          	jalr	416(ra) # 4960 <remove>
  int fd1 = open("truncfile", O_CREATE|O_WRONLY|O_TRUNC);
     7c8:	60100593          	li	a1,1537
     7cc:	00005517          	auipc	a0,0x5
     7d0:	a5c50513          	addi	a0,a0,-1444 # 5228 <malloc+0x47a>
     7d4:	00004097          	auipc	ra,0x4
     7d8:	124080e7          	jalr	292(ra) # 48f8 <open>
     7dc:	84aa                	mv	s1,a0
  write(fd1, "abcd", 4);
     7de:	4611                	li	a2,4
     7e0:	00005597          	auipc	a1,0x5
     7e4:	a5858593          	addi	a1,a1,-1448 # 5238 <malloc+0x48a>
     7e8:	00004097          	auipc	ra,0x4
     7ec:	0f0080e7          	jalr	240(ra) # 48d8 <write>
  close(fd1);
     7f0:	8526                	mv	a0,s1
     7f2:	00004097          	auipc	ra,0x4
     7f6:	0ee080e7          	jalr	238(ra) # 48e0 <close>
  int fd2 = open("truncfile", O_RDONLY);
     7fa:	4581                	li	a1,0
     7fc:	00005517          	auipc	a0,0x5
     800:	a2c50513          	addi	a0,a0,-1492 # 5228 <malloc+0x47a>
     804:	00004097          	auipc	ra,0x4
     808:	0f4080e7          	jalr	244(ra) # 48f8 <open>
     80c:	84aa                	mv	s1,a0
  int n = read(fd2, buf, sizeof(buf));
     80e:	02000613          	li	a2,32
     812:	fa040593          	addi	a1,s0,-96
     816:	00004097          	auipc	ra,0x4
     81a:	0ba080e7          	jalr	186(ra) # 48d0 <read>
  if(n != 4){
     81e:	4791                	li	a5,4
     820:	0cf51e63          	bne	a0,a5,8fc <truncate1+0x158>
  fd1 = open("truncfile", O_WRONLY|O_TRUNC);
     824:	40100593          	li	a1,1025
     828:	00005517          	auipc	a0,0x5
     82c:	a0050513          	addi	a0,a0,-1536 # 5228 <malloc+0x47a>
     830:	00004097          	auipc	ra,0x4
     834:	0c8080e7          	jalr	200(ra) # 48f8 <open>
     838:	89aa                	mv	s3,a0
  int fd3 = open("truncfile", O_RDONLY);
     83a:	4581                	li	a1,0
     83c:	00005517          	auipc	a0,0x5
     840:	9ec50513          	addi	a0,a0,-1556 # 5228 <malloc+0x47a>
     844:	00004097          	auipc	ra,0x4
     848:	0b4080e7          	jalr	180(ra) # 48f8 <open>
     84c:	892a                	mv	s2,a0
  n = read(fd3, buf, sizeof(buf));
     84e:	02000613          	li	a2,32
     852:	fa040593          	addi	a1,s0,-96
     856:	00004097          	auipc	ra,0x4
     85a:	07a080e7          	jalr	122(ra) # 48d0 <read>
     85e:	8a2a                	mv	s4,a0
  if(n != 0){
     860:	ed4d                	bnez	a0,91a <truncate1+0x176>
  n = read(fd2, buf, sizeof(buf));
     862:	02000613          	li	a2,32
     866:	fa040593          	addi	a1,s0,-96
     86a:	8526                	mv	a0,s1
     86c:	00004097          	auipc	ra,0x4
     870:	064080e7          	jalr	100(ra) # 48d0 <read>
     874:	8a2a                	mv	s4,a0
  if(n != 0){
     876:	e971                	bnez	a0,94a <truncate1+0x1a6>
  write(fd1, "abcdef", 6);
     878:	4619                	li	a2,6
     87a:	00005597          	auipc	a1,0x5
     87e:	c1658593          	addi	a1,a1,-1002 # 5490 <malloc+0x6e2>
     882:	854e                	mv	a0,s3
     884:	00004097          	auipc	ra,0x4
     888:	054080e7          	jalr	84(ra) # 48d8 <write>
  n = read(fd3, buf, sizeof(buf));
     88c:	02000613          	li	a2,32
     890:	fa040593          	addi	a1,s0,-96
     894:	854a                	mv	a0,s2
     896:	00004097          	auipc	ra,0x4
     89a:	03a080e7          	jalr	58(ra) # 48d0 <read>
  if(n != 6){
     89e:	4799                	li	a5,6
     8a0:	0cf51d63          	bne	a0,a5,97a <truncate1+0x1d6>
  n = read(fd2, buf, sizeof(buf));
     8a4:	02000613          	li	a2,32
     8a8:	fa040593          	addi	a1,s0,-96
     8ac:	8526                	mv	a0,s1
     8ae:	00004097          	auipc	ra,0x4
     8b2:	022080e7          	jalr	34(ra) # 48d0 <read>
  if(n != 2){
     8b6:	4789                	li	a5,2
     8b8:	0ef51063          	bne	a0,a5,998 <truncate1+0x1f4>
  remove("truncfile");
     8bc:	00005517          	auipc	a0,0x5
     8c0:	96c50513          	addi	a0,a0,-1684 # 5228 <malloc+0x47a>
     8c4:	00004097          	auipc	ra,0x4
     8c8:	09c080e7          	jalr	156(ra) # 4960 <remove>
  close(fd1);
     8cc:	854e                	mv	a0,s3
     8ce:	00004097          	auipc	ra,0x4
     8d2:	012080e7          	jalr	18(ra) # 48e0 <close>
  close(fd2);
     8d6:	8526                	mv	a0,s1
     8d8:	00004097          	auipc	ra,0x4
     8dc:	008080e7          	jalr	8(ra) # 48e0 <close>
  close(fd3);
     8e0:	854a                	mv	a0,s2
     8e2:	00004097          	auipc	ra,0x4
     8e6:	ffe080e7          	jalr	-2(ra) # 48e0 <close>
}
     8ea:	60e6                	ld	ra,88(sp)
     8ec:	6446                	ld	s0,80(sp)
     8ee:	64a6                	ld	s1,72(sp)
     8f0:	6906                	ld	s2,64(sp)
     8f2:	79e2                	ld	s3,56(sp)
     8f4:	7a42                	ld	s4,48(sp)
     8f6:	7aa2                	ld	s5,40(sp)
     8f8:	6125                	addi	sp,sp,96
     8fa:	8082                	ret
    printf("%s: read %d bytes, wanted 4\n", s, n);
     8fc:	862a                	mv	a2,a0
     8fe:	85d6                	mv	a1,s5
     900:	00005517          	auipc	a0,0x5
     904:	b3050513          	addi	a0,a0,-1232 # 5430 <malloc+0x682>
     908:	00004097          	auipc	ra,0x4
     90c:	3c0080e7          	jalr	960(ra) # 4cc8 <printf>
    exit(1);
     910:	4505                	li	a0,1
     912:	00004097          	auipc	ra,0x4
     916:	fa6080e7          	jalr	-90(ra) # 48b8 <exit>
    printf("aaa fd3=%d\n", fd3);
     91a:	85ca                	mv	a1,s2
     91c:	00005517          	auipc	a0,0x5
     920:	b3450513          	addi	a0,a0,-1228 # 5450 <malloc+0x6a2>
     924:	00004097          	auipc	ra,0x4
     928:	3a4080e7          	jalr	932(ra) # 4cc8 <printf>
    printf("%s: read %d bytes, wanted 0\n", s, n);
     92c:	8652                	mv	a2,s4
     92e:	85d6                	mv	a1,s5
     930:	00005517          	auipc	a0,0x5
     934:	b3050513          	addi	a0,a0,-1232 # 5460 <malloc+0x6b2>
     938:	00004097          	auipc	ra,0x4
     93c:	390080e7          	jalr	912(ra) # 4cc8 <printf>
    exit(1);
     940:	4505                	li	a0,1
     942:	00004097          	auipc	ra,0x4
     946:	f76080e7          	jalr	-138(ra) # 48b8 <exit>
    printf("bbb fd2=%d\n", fd2);
     94a:	85a6                	mv	a1,s1
     94c:	00005517          	auipc	a0,0x5
     950:	b3450513          	addi	a0,a0,-1228 # 5480 <malloc+0x6d2>
     954:	00004097          	auipc	ra,0x4
     958:	374080e7          	jalr	884(ra) # 4cc8 <printf>
    printf("%s: read %d bytes, wanted 0\n", s, n);
     95c:	8652                	mv	a2,s4
     95e:	85d6                	mv	a1,s5
     960:	00005517          	auipc	a0,0x5
     964:	b0050513          	addi	a0,a0,-1280 # 5460 <malloc+0x6b2>
     968:	00004097          	auipc	ra,0x4
     96c:	360080e7          	jalr	864(ra) # 4cc8 <printf>
    exit(1);
     970:	4505                	li	a0,1
     972:	00004097          	auipc	ra,0x4
     976:	f46080e7          	jalr	-186(ra) # 48b8 <exit>
    printf("%s: read %d bytes, wanted 6\n", s, n);
     97a:	862a                	mv	a2,a0
     97c:	85d6                	mv	a1,s5
     97e:	00005517          	auipc	a0,0x5
     982:	b1a50513          	addi	a0,a0,-1254 # 5498 <malloc+0x6ea>
     986:	00004097          	auipc	ra,0x4
     98a:	342080e7          	jalr	834(ra) # 4cc8 <printf>
    exit(1);
     98e:	4505                	li	a0,1
     990:	00004097          	auipc	ra,0x4
     994:	f28080e7          	jalr	-216(ra) # 48b8 <exit>
    printf("%s: read %d bytes, wanted 2\n", s, n);
     998:	862a                	mv	a2,a0
     99a:	85d6                	mv	a1,s5
     99c:	00005517          	auipc	a0,0x5
     9a0:	b1c50513          	addi	a0,a0,-1252 # 54b8 <malloc+0x70a>
     9a4:	00004097          	auipc	ra,0x4
     9a8:	324080e7          	jalr	804(ra) # 4cc8 <printf>
    exit(1);
     9ac:	4505                	li	a0,1
     9ae:	00004097          	auipc	ra,0x4
     9b2:	f0a080e7          	jalr	-246(ra) # 48b8 <exit>

00000000000009b6 <writetest>:
{
     9b6:	7139                	addi	sp,sp,-64
     9b8:	fc06                	sd	ra,56(sp)
     9ba:	f822                	sd	s0,48(sp)
     9bc:	f426                	sd	s1,40(sp)
     9be:	f04a                	sd	s2,32(sp)
     9c0:	ec4e                	sd	s3,24(sp)
     9c2:	e852                	sd	s4,16(sp)
     9c4:	e456                	sd	s5,8(sp)
     9c6:	e05a                	sd	s6,0(sp)
     9c8:	0080                	addi	s0,sp,64
     9ca:	8b2a                	mv	s6,a0
  fd = open("small", O_CREATE|O_RDWR);
     9cc:	20200593          	li	a1,514
     9d0:	00005517          	auipc	a0,0x5
     9d4:	b0850513          	addi	a0,a0,-1272 # 54d8 <malloc+0x72a>
     9d8:	00004097          	auipc	ra,0x4
     9dc:	f20080e7          	jalr	-224(ra) # 48f8 <open>
  if(fd < 0){
     9e0:	0a054d63          	bltz	a0,a9a <writetest+0xe4>
     9e4:	892a                	mv	s2,a0
     9e6:	4481                	li	s1,0
    if(write(fd, "aaaaaaaaaa", SZ) != SZ){
     9e8:	00005997          	auipc	s3,0x5
     9ec:	b1898993          	addi	s3,s3,-1256 # 5500 <malloc+0x752>
    if(write(fd, "bbbbbbbbbb", SZ) != SZ){
     9f0:	00005a97          	auipc	s5,0x5
     9f4:	b48a8a93          	addi	s5,s5,-1208 # 5538 <malloc+0x78a>
  for(i = 0; i < N; i++){
     9f8:	06400a13          	li	s4,100
    if(write(fd, "aaaaaaaaaa", SZ) != SZ){
     9fc:	4629                	li	a2,10
     9fe:	85ce                	mv	a1,s3
     a00:	854a                	mv	a0,s2
     a02:	00004097          	auipc	ra,0x4
     a06:	ed6080e7          	jalr	-298(ra) # 48d8 <write>
     a0a:	47a9                	li	a5,10
     a0c:	0af51563          	bne	a0,a5,ab6 <writetest+0x100>
    if(write(fd, "bbbbbbbbbb", SZ) != SZ){
     a10:	4629                	li	a2,10
     a12:	85d6                	mv	a1,s5
     a14:	854a                	mv	a0,s2
     a16:	00004097          	auipc	ra,0x4
     a1a:	ec2080e7          	jalr	-318(ra) # 48d8 <write>
     a1e:	47a9                	li	a5,10
     a20:	0af51963          	bne	a0,a5,ad2 <writetest+0x11c>
  for(i = 0; i < N; i++){
     a24:	2485                	addiw	s1,s1,1
     a26:	fd449be3          	bne	s1,s4,9fc <writetest+0x46>
  close(fd);
     a2a:	854a                	mv	a0,s2
     a2c:	00004097          	auipc	ra,0x4
     a30:	eb4080e7          	jalr	-332(ra) # 48e0 <close>
  fd = open("small", O_RDONLY);
     a34:	4581                	li	a1,0
     a36:	00005517          	auipc	a0,0x5
     a3a:	aa250513          	addi	a0,a0,-1374 # 54d8 <malloc+0x72a>
     a3e:	00004097          	auipc	ra,0x4
     a42:	eba080e7          	jalr	-326(ra) # 48f8 <open>
     a46:	84aa                	mv	s1,a0
  if(fd < 0){
     a48:	0a054363          	bltz	a0,aee <writetest+0x138>
  i = read(fd, buf, N*SZ*2);
     a4c:	7d000613          	li	a2,2000
     a50:	0000a597          	auipc	a1,0xa
     a54:	e2058593          	addi	a1,a1,-480 # a870 <buf>
     a58:	00004097          	auipc	ra,0x4
     a5c:	e78080e7          	jalr	-392(ra) # 48d0 <read>
  if(i != N*SZ*2){
     a60:	7d000793          	li	a5,2000
     a64:	0af51363          	bne	a0,a5,b0a <writetest+0x154>
  close(fd);
     a68:	8526                	mv	a0,s1
     a6a:	00004097          	auipc	ra,0x4
     a6e:	e76080e7          	jalr	-394(ra) # 48e0 <close>
  if(remove("small") < 0){
     a72:	00005517          	auipc	a0,0x5
     a76:	a6650513          	addi	a0,a0,-1434 # 54d8 <malloc+0x72a>
     a7a:	00004097          	auipc	ra,0x4
     a7e:	ee6080e7          	jalr	-282(ra) # 4960 <remove>
     a82:	0a054263          	bltz	a0,b26 <writetest+0x170>
}
     a86:	70e2                	ld	ra,56(sp)
     a88:	7442                	ld	s0,48(sp)
     a8a:	74a2                	ld	s1,40(sp)
     a8c:	7902                	ld	s2,32(sp)
     a8e:	69e2                	ld	s3,24(sp)
     a90:	6a42                	ld	s4,16(sp)
     a92:	6aa2                	ld	s5,8(sp)
     a94:	6b02                	ld	s6,0(sp)
     a96:	6121                	addi	sp,sp,64
     a98:	8082                	ret
    printf("%s: error: creat small failed!\n", s);
     a9a:	85da                	mv	a1,s6
     a9c:	00005517          	auipc	a0,0x5
     aa0:	a4450513          	addi	a0,a0,-1468 # 54e0 <malloc+0x732>
     aa4:	00004097          	auipc	ra,0x4
     aa8:	224080e7          	jalr	548(ra) # 4cc8 <printf>
    exit(1);
     aac:	4505                	li	a0,1
     aae:	00004097          	auipc	ra,0x4
     ab2:	e0a080e7          	jalr	-502(ra) # 48b8 <exit>
      printf("%s: error: write aa %d new file failed\n", i);
     ab6:	85a6                	mv	a1,s1
     ab8:	00005517          	auipc	a0,0x5
     abc:	a5850513          	addi	a0,a0,-1448 # 5510 <malloc+0x762>
     ac0:	00004097          	auipc	ra,0x4
     ac4:	208080e7          	jalr	520(ra) # 4cc8 <printf>
      exit(1);
     ac8:	4505                	li	a0,1
     aca:	00004097          	auipc	ra,0x4
     ace:	dee080e7          	jalr	-530(ra) # 48b8 <exit>
      printf("%s: error: write bb %d new file failed\n", i);
     ad2:	85a6                	mv	a1,s1
     ad4:	00005517          	auipc	a0,0x5
     ad8:	a7450513          	addi	a0,a0,-1420 # 5548 <malloc+0x79a>
     adc:	00004097          	auipc	ra,0x4
     ae0:	1ec080e7          	jalr	492(ra) # 4cc8 <printf>
      exit(1);
     ae4:	4505                	li	a0,1
     ae6:	00004097          	auipc	ra,0x4
     aea:	dd2080e7          	jalr	-558(ra) # 48b8 <exit>
    printf("%s: error: open small failed!\n", s);
     aee:	85da                	mv	a1,s6
     af0:	00005517          	auipc	a0,0x5
     af4:	a8050513          	addi	a0,a0,-1408 # 5570 <malloc+0x7c2>
     af8:	00004097          	auipc	ra,0x4
     afc:	1d0080e7          	jalr	464(ra) # 4cc8 <printf>
    exit(1);
     b00:	4505                	li	a0,1
     b02:	00004097          	auipc	ra,0x4
     b06:	db6080e7          	jalr	-586(ra) # 48b8 <exit>
    printf("%s: read failed\n", s);
     b0a:	85da                	mv	a1,s6
     b0c:	00005517          	auipc	a0,0x5
     b10:	a8450513          	addi	a0,a0,-1404 # 5590 <malloc+0x7e2>
     b14:	00004097          	auipc	ra,0x4
     b18:	1b4080e7          	jalr	436(ra) # 4cc8 <printf>
    exit(1);
     b1c:	4505                	li	a0,1
     b1e:	00004097          	auipc	ra,0x4
     b22:	d9a080e7          	jalr	-614(ra) # 48b8 <exit>
    printf("%s: remove small failed\n", s);
     b26:	85da                	mv	a1,s6
     b28:	00005517          	auipc	a0,0x5
     b2c:	a8050513          	addi	a0,a0,-1408 # 55a8 <malloc+0x7fa>
     b30:	00004097          	auipc	ra,0x4
     b34:	198080e7          	jalr	408(ra) # 4cc8 <printf>
    exit(1);
     b38:	4505                	li	a0,1
     b3a:	00004097          	auipc	ra,0x4
     b3e:	d7e080e7          	jalr	-642(ra) # 48b8 <exit>

0000000000000b42 <writebig>:
{
     b42:	7179                	addi	sp,sp,-48
     b44:	f406                	sd	ra,40(sp)
     b46:	f022                	sd	s0,32(sp)
     b48:	ec26                	sd	s1,24(sp)
     b4a:	e84a                	sd	s2,16(sp)
     b4c:	e44e                	sd	s3,8(sp)
     b4e:	e052                	sd	s4,0(sp)
     b50:	1800                	addi	s0,sp,48
     b52:	8a2a                	mv	s4,a0
  fd = open("big", O_CREATE|O_RDWR);
     b54:	20200593          	li	a1,514
     b58:	00005517          	auipc	a0,0x5
     b5c:	a7050513          	addi	a0,a0,-1424 # 55c8 <malloc+0x81a>
     b60:	00004097          	auipc	ra,0x4
     b64:	d98080e7          	jalr	-616(ra) # 48f8 <open>
     b68:	89aa                	mv	s3,a0
  for(i = 0; i < MAXFILE; i++){
     b6a:	4481                	li	s1,0
    ((int*)buf)[0] = i;
     b6c:	0000a917          	auipc	s2,0xa
     b70:	d0490913          	addi	s2,s2,-764 # a870 <buf>
  if(fd < 0){
     b74:	06054e63          	bltz	a0,bf0 <writebig+0xae>
    ((int*)buf)[0] = i;
     b78:	00992023          	sw	s1,0(s2)
    if(write(fd, buf, BSIZE) != BSIZE){
     b7c:	20000613          	li	a2,512
     b80:	85ca                	mv	a1,s2
     b82:	854e                	mv	a0,s3
     b84:	00004097          	auipc	ra,0x4
     b88:	d54080e7          	jalr	-684(ra) # 48d8 <write>
     b8c:	20000793          	li	a5,512
     b90:	06f51e63          	bne	a0,a5,c0c <writebig+0xca>
  for(i = 0; i < MAXFILE; i++){
     b94:	2485                	addiw	s1,s1,1
     b96:	20000793          	li	a5,512
     b9a:	fcf49fe3          	bne	s1,a5,b78 <writebig+0x36>
  close(fd);
     b9e:	854e                	mv	a0,s3
     ba0:	00004097          	auipc	ra,0x4
     ba4:	d40080e7          	jalr	-704(ra) # 48e0 <close>
  fd = open("big", O_RDONLY);
     ba8:	4581                	li	a1,0
     baa:	00005517          	auipc	a0,0x5
     bae:	a1e50513          	addi	a0,a0,-1506 # 55c8 <malloc+0x81a>
     bb2:	00004097          	auipc	ra,0x4
     bb6:	d46080e7          	jalr	-698(ra) # 48f8 <open>
     bba:	89aa                	mv	s3,a0
  n = 0;
     bbc:	4481                	li	s1,0
    i = read(fd, buf, BSIZE);
     bbe:	0000a917          	auipc	s2,0xa
     bc2:	cb290913          	addi	s2,s2,-846 # a870 <buf>
  if(fd < 0){
     bc6:	06054163          	bltz	a0,c28 <writebig+0xe6>
    i = read(fd, buf, BSIZE);
     bca:	20000613          	li	a2,512
     bce:	85ca                	mv	a1,s2
     bd0:	854e                	mv	a0,s3
     bd2:	00004097          	auipc	ra,0x4
     bd6:	cfe080e7          	jalr	-770(ra) # 48d0 <read>
    if(i == 0){
     bda:	c52d                	beqz	a0,c44 <writebig+0x102>
    } else if(i != BSIZE){
     bdc:	20000793          	li	a5,512
     be0:	0af51c63          	bne	a0,a5,c98 <writebig+0x156>
    if(((int*)buf)[0] != n){
     be4:	00092603          	lw	a2,0(s2)
     be8:	0c961663          	bne	a2,s1,cb4 <writebig+0x172>
    n++;
     bec:	2485                	addiw	s1,s1,1
    i = read(fd, buf, BSIZE);
     bee:	bff1                	j	bca <writebig+0x88>
    printf("%s: error: creat big failed!\n", s);
     bf0:	85d2                	mv	a1,s4
     bf2:	00005517          	auipc	a0,0x5
     bf6:	9de50513          	addi	a0,a0,-1570 # 55d0 <malloc+0x822>
     bfa:	00004097          	auipc	ra,0x4
     bfe:	0ce080e7          	jalr	206(ra) # 4cc8 <printf>
    exit(1);
     c02:	4505                	li	a0,1
     c04:	00004097          	auipc	ra,0x4
     c08:	cb4080e7          	jalr	-844(ra) # 48b8 <exit>
      printf("%s: error: write big file failed\n", i);
     c0c:	85a6                	mv	a1,s1
     c0e:	00005517          	auipc	a0,0x5
     c12:	9e250513          	addi	a0,a0,-1566 # 55f0 <malloc+0x842>
     c16:	00004097          	auipc	ra,0x4
     c1a:	0b2080e7          	jalr	178(ra) # 4cc8 <printf>
      exit(1);
     c1e:	4505                	li	a0,1
     c20:	00004097          	auipc	ra,0x4
     c24:	c98080e7          	jalr	-872(ra) # 48b8 <exit>
    printf("%s: error: open big failed!\n", s);
     c28:	85d2                	mv	a1,s4
     c2a:	00005517          	auipc	a0,0x5
     c2e:	9ee50513          	addi	a0,a0,-1554 # 5618 <malloc+0x86a>
     c32:	00004097          	auipc	ra,0x4
     c36:	096080e7          	jalr	150(ra) # 4cc8 <printf>
    exit(1);
     c3a:	4505                	li	a0,1
     c3c:	00004097          	auipc	ra,0x4
     c40:	c7c080e7          	jalr	-900(ra) # 48b8 <exit>
      if(n == MAXFILE - 1){
     c44:	1ff00793          	li	a5,511
     c48:	02f48963          	beq	s1,a5,c7a <writebig+0x138>
  close(fd);
     c4c:	854e                	mv	a0,s3
     c4e:	00004097          	auipc	ra,0x4
     c52:	c92080e7          	jalr	-878(ra) # 48e0 <close>
  if(remove("big") < 0){
     c56:	00005517          	auipc	a0,0x5
     c5a:	97250513          	addi	a0,a0,-1678 # 55c8 <malloc+0x81a>
     c5e:	00004097          	auipc	ra,0x4
     c62:	d02080e7          	jalr	-766(ra) # 4960 <remove>
     c66:	06054563          	bltz	a0,cd0 <writebig+0x18e>
}
     c6a:	70a2                	ld	ra,40(sp)
     c6c:	7402                	ld	s0,32(sp)
     c6e:	64e2                	ld	s1,24(sp)
     c70:	6942                	ld	s2,16(sp)
     c72:	69a2                	ld	s3,8(sp)
     c74:	6a02                	ld	s4,0(sp)
     c76:	6145                	addi	sp,sp,48
     c78:	8082                	ret
        printf("%s: read only %d blocks from big", n);
     c7a:	1ff00593          	li	a1,511
     c7e:	00005517          	auipc	a0,0x5
     c82:	9ba50513          	addi	a0,a0,-1606 # 5638 <malloc+0x88a>
     c86:	00004097          	auipc	ra,0x4
     c8a:	042080e7          	jalr	66(ra) # 4cc8 <printf>
        exit(1);
     c8e:	4505                	li	a0,1
     c90:	00004097          	auipc	ra,0x4
     c94:	c28080e7          	jalr	-984(ra) # 48b8 <exit>
      printf("%s: read failed %d\n", i);
     c98:	85aa                	mv	a1,a0
     c9a:	00005517          	auipc	a0,0x5
     c9e:	9c650513          	addi	a0,a0,-1594 # 5660 <malloc+0x8b2>
     ca2:	00004097          	auipc	ra,0x4
     ca6:	026080e7          	jalr	38(ra) # 4cc8 <printf>
      exit(1);
     caa:	4505                	li	a0,1
     cac:	00004097          	auipc	ra,0x4
     cb0:	c0c080e7          	jalr	-1012(ra) # 48b8 <exit>
      printf("%s: read content of block %d is %d\n",
     cb4:	85a6                	mv	a1,s1
     cb6:	00005517          	auipc	a0,0x5
     cba:	9c250513          	addi	a0,a0,-1598 # 5678 <malloc+0x8ca>
     cbe:	00004097          	auipc	ra,0x4
     cc2:	00a080e7          	jalr	10(ra) # 4cc8 <printf>
      exit(1);
     cc6:	4505                	li	a0,1
     cc8:	00004097          	auipc	ra,0x4
     ccc:	bf0080e7          	jalr	-1040(ra) # 48b8 <exit>
    printf("%s: remove big failed\n", s);
     cd0:	85d2                	mv	a1,s4
     cd2:	00005517          	auipc	a0,0x5
     cd6:	9ce50513          	addi	a0,a0,-1586 # 56a0 <malloc+0x8f2>
     cda:	00004097          	auipc	ra,0x4
     cde:	fee080e7          	jalr	-18(ra) # 4cc8 <printf>
    exit(1);
     ce2:	4505                	li	a0,1
     ce4:	00004097          	auipc	ra,0x4
     ce8:	bd4080e7          	jalr	-1068(ra) # 48b8 <exit>

0000000000000cec <removeread>:
{
     cec:	7179                	addi	sp,sp,-48
     cee:	f406                	sd	ra,40(sp)
     cf0:	f022                	sd	s0,32(sp)
     cf2:	ec26                	sd	s1,24(sp)
     cf4:	e84a                	sd	s2,16(sp)
     cf6:	e44e                	sd	s3,8(sp)
     cf8:	1800                	addi	s0,sp,48
     cfa:	89aa                	mv	s3,a0
  fd = open("removeread", O_CREATE | O_RDWR);
     cfc:	20200593          	li	a1,514
     d00:	00004517          	auipc	a0,0x4
     d04:	2d050513          	addi	a0,a0,720 # 4fd0 <malloc+0x222>
     d08:	00004097          	auipc	ra,0x4
     d0c:	bf0080e7          	jalr	-1040(ra) # 48f8 <open>
  if(fd < 0){
     d10:	0e054763          	bltz	a0,dfe <removeread+0x112>
     d14:	84aa                	mv	s1,a0
  write(fd, "hello", SZ);
     d16:	4615                	li	a2,5
     d18:	00005597          	auipc	a1,0x5
     d1c:	9c058593          	addi	a1,a1,-1600 # 56d8 <malloc+0x92a>
     d20:	00004097          	auipc	ra,0x4
     d24:	bb8080e7          	jalr	-1096(ra) # 48d8 <write>
  close(fd);
     d28:	8526                	mv	a0,s1
     d2a:	00004097          	auipc	ra,0x4
     d2e:	bb6080e7          	jalr	-1098(ra) # 48e0 <close>
  fd = open("removeread", O_RDWR);
     d32:	4589                	li	a1,2
     d34:	00004517          	auipc	a0,0x4
     d38:	29c50513          	addi	a0,a0,668 # 4fd0 <malloc+0x222>
     d3c:	00004097          	auipc	ra,0x4
     d40:	bbc080e7          	jalr	-1092(ra) # 48f8 <open>
     d44:	84aa                	mv	s1,a0
  if(fd < 0){
     d46:	0c054a63          	bltz	a0,e1a <removeread+0x12e>
  if(remove("removeread") != 0){
     d4a:	00004517          	auipc	a0,0x4
     d4e:	28650513          	addi	a0,a0,646 # 4fd0 <malloc+0x222>
     d52:	00004097          	auipc	ra,0x4
     d56:	c0e080e7          	jalr	-1010(ra) # 4960 <remove>
     d5a:	ed71                	bnez	a0,e36 <removeread+0x14a>
  fd1 = open("removeread", O_CREATE | O_RDWR);
     d5c:	20200593          	li	a1,514
     d60:	00004517          	auipc	a0,0x4
     d64:	27050513          	addi	a0,a0,624 # 4fd0 <malloc+0x222>
     d68:	00004097          	auipc	ra,0x4
     d6c:	b90080e7          	jalr	-1136(ra) # 48f8 <open>
     d70:	892a                	mv	s2,a0
  write(fd1, "yyy", 3);
     d72:	460d                	li	a2,3
     d74:	00005597          	auipc	a1,0x5
     d78:	9ac58593          	addi	a1,a1,-1620 # 5720 <malloc+0x972>
     d7c:	00004097          	auipc	ra,0x4
     d80:	b5c080e7          	jalr	-1188(ra) # 48d8 <write>
  close(fd1);
     d84:	854a                	mv	a0,s2
     d86:	00004097          	auipc	ra,0x4
     d8a:	b5a080e7          	jalr	-1190(ra) # 48e0 <close>
  if(read(fd, buf, sizeof(buf)) != SZ){
     d8e:	6609                	lui	a2,0x2
     d90:	80060613          	addi	a2,a2,-2048 # 1800 <forkfork+0x68>
     d94:	0000a597          	auipc	a1,0xa
     d98:	adc58593          	addi	a1,a1,-1316 # a870 <buf>
     d9c:	8526                	mv	a0,s1
     d9e:	00004097          	auipc	ra,0x4
     da2:	b32080e7          	jalr	-1230(ra) # 48d0 <read>
     da6:	4795                	li	a5,5
     da8:	0af51563          	bne	a0,a5,e52 <removeread+0x166>
  if(buf[0] != 'h'){
     dac:	0000a717          	auipc	a4,0xa
     db0:	ac474703          	lbu	a4,-1340(a4) # a870 <buf>
     db4:	06800793          	li	a5,104
     db8:	0af71b63          	bne	a4,a5,e6e <removeread+0x182>
  if(write(fd, buf, 10) != 10){
     dbc:	4629                	li	a2,10
     dbe:	0000a597          	auipc	a1,0xa
     dc2:	ab258593          	addi	a1,a1,-1358 # a870 <buf>
     dc6:	8526                	mv	a0,s1
     dc8:	00004097          	auipc	ra,0x4
     dcc:	b10080e7          	jalr	-1264(ra) # 48d8 <write>
     dd0:	47a9                	li	a5,10
     dd2:	0af51c63          	bne	a0,a5,e8a <removeread+0x19e>
  close(fd);
     dd6:	8526                	mv	a0,s1
     dd8:	00004097          	auipc	ra,0x4
     ddc:	b08080e7          	jalr	-1272(ra) # 48e0 <close>
  remove("removeread");
     de0:	00004517          	auipc	a0,0x4
     de4:	1f050513          	addi	a0,a0,496 # 4fd0 <malloc+0x222>
     de8:	00004097          	auipc	ra,0x4
     dec:	b78080e7          	jalr	-1160(ra) # 4960 <remove>
}
     df0:	70a2                	ld	ra,40(sp)
     df2:	7402                	ld	s0,32(sp)
     df4:	64e2                	ld	s1,24(sp)
     df6:	6942                	ld	s2,16(sp)
     df8:	69a2                	ld	s3,8(sp)
     dfa:	6145                	addi	sp,sp,48
     dfc:	8082                	ret
    printf("%s: create removeread failed\n", s);
     dfe:	85ce                	mv	a1,s3
     e00:	00005517          	auipc	a0,0x5
     e04:	8b850513          	addi	a0,a0,-1864 # 56b8 <malloc+0x90a>
     e08:	00004097          	auipc	ra,0x4
     e0c:	ec0080e7          	jalr	-320(ra) # 4cc8 <printf>
    exit(1);
     e10:	4505                	li	a0,1
     e12:	00004097          	auipc	ra,0x4
     e16:	aa6080e7          	jalr	-1370(ra) # 48b8 <exit>
    printf("%s: open removeread failed\n", s);
     e1a:	85ce                	mv	a1,s3
     e1c:	00005517          	auipc	a0,0x5
     e20:	8c450513          	addi	a0,a0,-1852 # 56e0 <malloc+0x932>
     e24:	00004097          	auipc	ra,0x4
     e28:	ea4080e7          	jalr	-348(ra) # 4cc8 <printf>
    exit(1);
     e2c:	4505                	li	a0,1
     e2e:	00004097          	auipc	ra,0x4
     e32:	a8a080e7          	jalr	-1398(ra) # 48b8 <exit>
    printf("%s: remove removeread failed\n", s);
     e36:	85ce                	mv	a1,s3
     e38:	00005517          	auipc	a0,0x5
     e3c:	8c850513          	addi	a0,a0,-1848 # 5700 <malloc+0x952>
     e40:	00004097          	auipc	ra,0x4
     e44:	e88080e7          	jalr	-376(ra) # 4cc8 <printf>
    exit(1);
     e48:	4505                	li	a0,1
     e4a:	00004097          	auipc	ra,0x4
     e4e:	a6e080e7          	jalr	-1426(ra) # 48b8 <exit>
    printf("%s: removeread read failed", s);
     e52:	85ce                	mv	a1,s3
     e54:	00005517          	auipc	a0,0x5
     e58:	8d450513          	addi	a0,a0,-1836 # 5728 <malloc+0x97a>
     e5c:	00004097          	auipc	ra,0x4
     e60:	e6c080e7          	jalr	-404(ra) # 4cc8 <printf>
    exit(1);
     e64:	4505                	li	a0,1
     e66:	00004097          	auipc	ra,0x4
     e6a:	a52080e7          	jalr	-1454(ra) # 48b8 <exit>
    printf("%s: removeread wrong data\n", s);
     e6e:	85ce                	mv	a1,s3
     e70:	00005517          	auipc	a0,0x5
     e74:	8d850513          	addi	a0,a0,-1832 # 5748 <malloc+0x99a>
     e78:	00004097          	auipc	ra,0x4
     e7c:	e50080e7          	jalr	-432(ra) # 4cc8 <printf>
    exit(1);
     e80:	4505                	li	a0,1
     e82:	00004097          	auipc	ra,0x4
     e86:	a36080e7          	jalr	-1482(ra) # 48b8 <exit>
    printf("%s: removeread write failed\n", s);
     e8a:	85ce                	mv	a1,s3
     e8c:	00005517          	auipc	a0,0x5
     e90:	8dc50513          	addi	a0,a0,-1828 # 5768 <malloc+0x9ba>
     e94:	00004097          	auipc	ra,0x4
     e98:	e34080e7          	jalr	-460(ra) # 4cc8 <printf>
    exit(1);
     e9c:	4505                	li	a0,1
     e9e:	00004097          	auipc	ra,0x4
     ea2:	a1a080e7          	jalr	-1510(ra) # 48b8 <exit>

0000000000000ea6 <pgbug>:
{
     ea6:	7179                	addi	sp,sp,-48
     ea8:	f406                	sd	ra,40(sp)
     eaa:	f022                	sd	s0,32(sp)
     eac:	ec26                	sd	s1,24(sp)
     eae:	1800                	addi	s0,sp,48
  argv[0] = 0;
     eb0:	fc043c23          	sd	zero,-40(s0)
  exec((char*)0xeaeb0b5b00002f5e, argv);
     eb4:	00006497          	auipc	s1,0x6
     eb8:	1844b483          	ld	s1,388(s1) # 7038 <__SDATA_BEGIN__>
     ebc:	fd840593          	addi	a1,s0,-40
     ec0:	8526                	mv	a0,s1
     ec2:	00004097          	auipc	ra,0x4
     ec6:	a2e080e7          	jalr	-1490(ra) # 48f0 <exec>
  pipe((int*)0xeaeb0b5b00002f5e);
     eca:	8526                	mv	a0,s1
     ecc:	00004097          	auipc	ra,0x4
     ed0:	9fc080e7          	jalr	-1540(ra) # 48c8 <pipe>
  exit(0);
     ed4:	4501                	li	a0,0
     ed6:	00004097          	auipc	ra,0x4
     eda:	9e2080e7          	jalr	-1566(ra) # 48b8 <exit>

0000000000000ede <badarg>:

// regression test. test whether exec() leaks memory if one of the
// arguments is invalid. the test passes if the kernel doesn't panic.
void
badarg(char *s)
{
     ede:	7139                	addi	sp,sp,-64
     ee0:	fc06                	sd	ra,56(sp)
     ee2:	f822                	sd	s0,48(sp)
     ee4:	f426                	sd	s1,40(sp)
     ee6:	f04a                	sd	s2,32(sp)
     ee8:	ec4e                	sd	s3,24(sp)
     eea:	0080                	addi	s0,sp,64
     eec:	64b1                	lui	s1,0xc
     eee:	35048493          	addi	s1,s1,848 # c350 <__BSS_END__+0x268>
  for(int i = 0; i < 50000; i++){
    char *argv[2];
    argv[0] = (char*)0xffffffff;
     ef2:	597d                	li	s2,-1
     ef4:	02095913          	srli	s2,s2,0x20
    argv[1] = 0;
    exec("echo", argv);
     ef8:	00004997          	auipc	s3,0x4
     efc:	2d898993          	addi	s3,s3,728 # 51d0 <malloc+0x422>
    argv[0] = (char*)0xffffffff;
     f00:	fd243023          	sd	s2,-64(s0)
    argv[1] = 0;
     f04:	fc043423          	sd	zero,-56(s0)
    exec("echo", argv);
     f08:	fc040593          	addi	a1,s0,-64
     f0c:	854e                	mv	a0,s3
     f0e:	00004097          	auipc	ra,0x4
     f12:	9e2080e7          	jalr	-1566(ra) # 48f0 <exec>
  for(int i = 0; i < 50000; i++){
     f16:	34fd                	addiw	s1,s1,-1
     f18:	f4e5                	bnez	s1,f00 <badarg+0x22>
  }
  
  exit(0);
     f1a:	4501                	li	a0,0
     f1c:	00004097          	auipc	ra,0x4
     f20:	99c080e7          	jalr	-1636(ra) # 48b8 <exit>

0000000000000f24 <copyinstr2>:
{
     f24:	714d                	addi	sp,sp,-336
     f26:	e686                	sd	ra,328(sp)
     f28:	e2a2                	sd	s0,320(sp)
     f2a:	0a80                	addi	s0,sp,336
  for(int i = 0; i < MAXPATH; i++)
     f2c:	ee840793          	addi	a5,s0,-280
     f30:	fec40693          	addi	a3,s0,-20
    b[i] = 'x';
     f34:	07800713          	li	a4,120
     f38:	00e78023          	sb	a4,0(a5)
  for(int i = 0; i < MAXPATH; i++)
     f3c:	0785                	addi	a5,a5,1
     f3e:	fed79de3          	bne	a5,a3,f38 <copyinstr2+0x14>
  b[MAXPATH] = '\0';
     f42:	fe040623          	sb	zero,-20(s0)
  int ret = remove(b);
     f46:	ee840513          	addi	a0,s0,-280
     f4a:	00004097          	auipc	ra,0x4
     f4e:	a16080e7          	jalr	-1514(ra) # 4960 <remove>
  if(ret != -1){
     f52:	57fd                	li	a5,-1
     f54:	0cf51663          	bne	a0,a5,1020 <copyinstr2+0xfc>
  int fd = open(b, O_CREATE | O_WRONLY);
     f58:	20100593          	li	a1,513
     f5c:	ee840513          	addi	a0,s0,-280
     f60:	00004097          	auipc	ra,0x4
     f64:	998080e7          	jalr	-1640(ra) # 48f8 <open>
  if(fd != -1){
     f68:	57fd                	li	a5,-1
     f6a:	0cf51b63          	bne	a0,a5,1040 <copyinstr2+0x11c>
  char *args[] = { "xx", 0 };
     f6e:	00005797          	auipc	a5,0x5
     f72:	42a78793          	addi	a5,a5,1066 # 6398 <malloc+0x15ea>
     f76:	ecf43c23          	sd	a5,-296(s0)
     f7a:	ee043023          	sd	zero,-288(s0)
  ret = exec(b, args);
     f7e:	ed840593          	addi	a1,s0,-296
     f82:	ee840513          	addi	a0,s0,-280
     f86:	00004097          	auipc	ra,0x4
     f8a:	96a080e7          	jalr	-1686(ra) # 48f0 <exec>
  if(ret != -1){
     f8e:	57fd                	li	a5,-1
     f90:	0cf51863          	bne	a0,a5,1060 <copyinstr2+0x13c>
  int pid = fork();
     f94:	00004097          	auipc	ra,0x4
     f98:	91c080e7          	jalr	-1764(ra) # 48b0 <fork>
  if(pid < 0){
     f9c:	0e054263          	bltz	a0,1080 <copyinstr2+0x15c>
  if(pid == 0){
     fa0:	10051363          	bnez	a0,10a6 <copyinstr2+0x182>
     fa4:	00006797          	auipc	a5,0x6
     fa8:	1b478793          	addi	a5,a5,436 # 7158 <big.1288>
     fac:	00007697          	auipc	a3,0x7
     fb0:	1ac68693          	addi	a3,a3,428 # 8158 <__global_pointer$+0x920>
      big[i] = 'x';
     fb4:	07800713          	li	a4,120
     fb8:	00e78023          	sb	a4,0(a5)
    for(int i = 0; i < PGSIZE; i++)
     fbc:	0785                	addi	a5,a5,1
     fbe:	fed79de3          	bne	a5,a3,fb8 <copyinstr2+0x94>
    big[PGSIZE] = '\0';
     fc2:	00007797          	auipc	a5,0x7
     fc6:	18078b23          	sb	zero,406(a5) # 8158 <__global_pointer$+0x920>
    char *args2[] = { big, big, big, 0 };
     fca:	00006797          	auipc	a5,0x6
     fce:	cee78793          	addi	a5,a5,-786 # 6cb8 <malloc+0x1f0a>
     fd2:	6390                	ld	a2,0(a5)
     fd4:	6794                	ld	a3,8(a5)
     fd6:	6b98                	ld	a4,16(a5)
     fd8:	6f9c                	ld	a5,24(a5)
     fda:	eac43823          	sd	a2,-336(s0)
     fde:	ead43c23          	sd	a3,-328(s0)
     fe2:	ece43023          	sd	a4,-320(s0)
     fe6:	ecf43423          	sd	a5,-312(s0)
    ret = exec("echo", args2);
     fea:	eb040593          	addi	a1,s0,-336
     fee:	00004517          	auipc	a0,0x4
     ff2:	1e250513          	addi	a0,a0,482 # 51d0 <malloc+0x422>
     ff6:	00004097          	auipc	ra,0x4
     ffa:	8fa080e7          	jalr	-1798(ra) # 48f0 <exec>
    if(ret != -1){
     ffe:	57fd                	li	a5,-1
    1000:	08f50d63          	beq	a0,a5,109a <copyinstr2+0x176>
      printf("exec(echo, BIG) returned %d, not -1\n", fd);
    1004:	55fd                	li	a1,-1
    1006:	00004517          	auipc	a0,0x4
    100a:	7e250513          	addi	a0,a0,2018 # 57e8 <malloc+0xa3a>
    100e:	00004097          	auipc	ra,0x4
    1012:	cba080e7          	jalr	-838(ra) # 4cc8 <printf>
      exit(1);
    1016:	4505                	li	a0,1
    1018:	00004097          	auipc	ra,0x4
    101c:	8a0080e7          	jalr	-1888(ra) # 48b8 <exit>
    printf("remove(%s) returned %d, not -1\n", b, ret);
    1020:	862a                	mv	a2,a0
    1022:	ee840593          	addi	a1,s0,-280
    1026:	00004517          	auipc	a0,0x4
    102a:	76250513          	addi	a0,a0,1890 # 5788 <malloc+0x9da>
    102e:	00004097          	auipc	ra,0x4
    1032:	c9a080e7          	jalr	-870(ra) # 4cc8 <printf>
    exit(1);
    1036:	4505                	li	a0,1
    1038:	00004097          	auipc	ra,0x4
    103c:	880080e7          	jalr	-1920(ra) # 48b8 <exit>
    printf("open(%s) returned %d, not -1\n", b, fd);
    1040:	862a                	mv	a2,a0
    1042:	ee840593          	addi	a1,s0,-280
    1046:	00004517          	auipc	a0,0x4
    104a:	76250513          	addi	a0,a0,1890 # 57a8 <malloc+0x9fa>
    104e:	00004097          	auipc	ra,0x4
    1052:	c7a080e7          	jalr	-902(ra) # 4cc8 <printf>
    exit(1);
    1056:	4505                	li	a0,1
    1058:	00004097          	auipc	ra,0x4
    105c:	860080e7          	jalr	-1952(ra) # 48b8 <exit>
    printf("exec(%s) returned %d, not -1\n", b, fd);
    1060:	567d                	li	a2,-1
    1062:	ee840593          	addi	a1,s0,-280
    1066:	00004517          	auipc	a0,0x4
    106a:	76250513          	addi	a0,a0,1890 # 57c8 <malloc+0xa1a>
    106e:	00004097          	auipc	ra,0x4
    1072:	c5a080e7          	jalr	-934(ra) # 4cc8 <printf>
    exit(1);
    1076:	4505                	li	a0,1
    1078:	00004097          	auipc	ra,0x4
    107c:	840080e7          	jalr	-1984(ra) # 48b8 <exit>
    printf("fork failed\n");
    1080:	00005517          	auipc	a0,0x5
    1084:	b4050513          	addi	a0,a0,-1216 # 5bc0 <malloc+0xe12>
    1088:	00004097          	auipc	ra,0x4
    108c:	c40080e7          	jalr	-960(ra) # 4cc8 <printf>
    exit(1);
    1090:	4505                	li	a0,1
    1092:	00004097          	auipc	ra,0x4
    1096:	826080e7          	jalr	-2010(ra) # 48b8 <exit>
    exit(747); // OK
    109a:	2eb00513          	li	a0,747
    109e:	00004097          	auipc	ra,0x4
    10a2:	81a080e7          	jalr	-2022(ra) # 48b8 <exit>
  int st = 0;
    10a6:	ec042a23          	sw	zero,-300(s0)
  wait(&st);
    10aa:	ed440513          	addi	a0,s0,-300
    10ae:	00004097          	auipc	ra,0x4
    10b2:	812080e7          	jalr	-2030(ra) # 48c0 <wait>
  if(st != 747){
    10b6:	ed442703          	lw	a4,-300(s0)
    10ba:	2eb00793          	li	a5,747
    10be:	00f71663          	bne	a4,a5,10ca <copyinstr2+0x1a6>
}
    10c2:	60b6                	ld	ra,328(sp)
    10c4:	6416                	ld	s0,320(sp)
    10c6:	6171                	addi	sp,sp,336
    10c8:	8082                	ret
    printf("exec(echo, BIG) succeeded, should have failed\n");
    10ca:	00004517          	auipc	a0,0x4
    10ce:	74650513          	addi	a0,a0,1862 # 5810 <malloc+0xa62>
    10d2:	00004097          	auipc	ra,0x4
    10d6:	bf6080e7          	jalr	-1034(ra) # 4cc8 <printf>
    exit(1);
    10da:	4505                	li	a0,1
    10dc:	00003097          	auipc	ra,0x3
    10e0:	7dc080e7          	jalr	2012(ra) # 48b8 <exit>

00000000000010e4 <truncate3>:
{
    10e4:	7159                	addi	sp,sp,-112
    10e6:	f486                	sd	ra,104(sp)
    10e8:	f0a2                	sd	s0,96(sp)
    10ea:	eca6                	sd	s1,88(sp)
    10ec:	e8ca                	sd	s2,80(sp)
    10ee:	e4ce                	sd	s3,72(sp)
    10f0:	e0d2                	sd	s4,64(sp)
    10f2:	fc56                	sd	s5,56(sp)
    10f4:	1880                	addi	s0,sp,112
    10f6:	892a                	mv	s2,a0
  close(open("truncfile", O_CREATE|O_TRUNC|O_WRONLY));
    10f8:	60100593          	li	a1,1537
    10fc:	00004517          	auipc	a0,0x4
    1100:	12c50513          	addi	a0,a0,300 # 5228 <malloc+0x47a>
    1104:	00003097          	auipc	ra,0x3
    1108:	7f4080e7          	jalr	2036(ra) # 48f8 <open>
    110c:	00003097          	auipc	ra,0x3
    1110:	7d4080e7          	jalr	2004(ra) # 48e0 <close>
  pid = fork();
    1114:	00003097          	auipc	ra,0x3
    1118:	79c080e7          	jalr	1948(ra) # 48b0 <fork>
  if(pid < 0){
    111c:	08054063          	bltz	a0,119c <truncate3+0xb8>
  if(pid == 0){
    1120:	e969                	bnez	a0,11f2 <truncate3+0x10e>
    1122:	06400993          	li	s3,100
      int fd = open("truncfile", O_WRONLY);
    1126:	00004a17          	auipc	s4,0x4
    112a:	102a0a13          	addi	s4,s4,258 # 5228 <malloc+0x47a>
      int n = write(fd, "1234567890", 10);
    112e:	00004a97          	auipc	s5,0x4
    1132:	742a8a93          	addi	s5,s5,1858 # 5870 <malloc+0xac2>
      int fd = open("truncfile", O_WRONLY);
    1136:	4585                	li	a1,1
    1138:	8552                	mv	a0,s4
    113a:	00003097          	auipc	ra,0x3
    113e:	7be080e7          	jalr	1982(ra) # 48f8 <open>
    1142:	84aa                	mv	s1,a0
      if(fd < 0){
    1144:	06054a63          	bltz	a0,11b8 <truncate3+0xd4>
      int n = write(fd, "1234567890", 10);
    1148:	4629                	li	a2,10
    114a:	85d6                	mv	a1,s5
    114c:	00003097          	auipc	ra,0x3
    1150:	78c080e7          	jalr	1932(ra) # 48d8 <write>
      if(n != 10){
    1154:	47a9                	li	a5,10
    1156:	06f51f63          	bne	a0,a5,11d4 <truncate3+0xf0>
      close(fd);
    115a:	8526                	mv	a0,s1
    115c:	00003097          	auipc	ra,0x3
    1160:	784080e7          	jalr	1924(ra) # 48e0 <close>
      fd = open("truncfile", O_RDONLY);
    1164:	4581                	li	a1,0
    1166:	8552                	mv	a0,s4
    1168:	00003097          	auipc	ra,0x3
    116c:	790080e7          	jalr	1936(ra) # 48f8 <open>
    1170:	84aa                	mv	s1,a0
      read(fd, buf, sizeof(buf));
    1172:	02000613          	li	a2,32
    1176:	f9840593          	addi	a1,s0,-104
    117a:	00003097          	auipc	ra,0x3
    117e:	756080e7          	jalr	1878(ra) # 48d0 <read>
      close(fd);
    1182:	8526                	mv	a0,s1
    1184:	00003097          	auipc	ra,0x3
    1188:	75c080e7          	jalr	1884(ra) # 48e0 <close>
    for(int i = 0; i < 100; i++){
    118c:	39fd                	addiw	s3,s3,-1
    118e:	fa0994e3          	bnez	s3,1136 <truncate3+0x52>
    exit(0);
    1192:	4501                	li	a0,0
    1194:	00003097          	auipc	ra,0x3
    1198:	724080e7          	jalr	1828(ra) # 48b8 <exit>
    printf("%s: fork failed\n", s);
    119c:	85ca                	mv	a1,s2
    119e:	00004517          	auipc	a0,0x4
    11a2:	6a250513          	addi	a0,a0,1698 # 5840 <malloc+0xa92>
    11a6:	00004097          	auipc	ra,0x4
    11aa:	b22080e7          	jalr	-1246(ra) # 4cc8 <printf>
    exit(1);
    11ae:	4505                	li	a0,1
    11b0:	00003097          	auipc	ra,0x3
    11b4:	708080e7          	jalr	1800(ra) # 48b8 <exit>
        printf("%s: open failed\n", s);
    11b8:	85ca                	mv	a1,s2
    11ba:	00004517          	auipc	a0,0x4
    11be:	69e50513          	addi	a0,a0,1694 # 5858 <malloc+0xaaa>
    11c2:	00004097          	auipc	ra,0x4
    11c6:	b06080e7          	jalr	-1274(ra) # 4cc8 <printf>
        exit(1);
    11ca:	4505                	li	a0,1
    11cc:	00003097          	auipc	ra,0x3
    11d0:	6ec080e7          	jalr	1772(ra) # 48b8 <exit>
        printf("%s: write got %d, expected 10\n", s, n);
    11d4:	862a                	mv	a2,a0
    11d6:	85ca                	mv	a1,s2
    11d8:	00004517          	auipc	a0,0x4
    11dc:	6a850513          	addi	a0,a0,1704 # 5880 <malloc+0xad2>
    11e0:	00004097          	auipc	ra,0x4
    11e4:	ae8080e7          	jalr	-1304(ra) # 4cc8 <printf>
        exit(1);
    11e8:	4505                	li	a0,1
    11ea:	00003097          	auipc	ra,0x3
    11ee:	6ce080e7          	jalr	1742(ra) # 48b8 <exit>
    11f2:	09600993          	li	s3,150
    int fd = open("truncfile", O_CREATE|O_WRONLY|O_TRUNC);
    11f6:	00004a17          	auipc	s4,0x4
    11fa:	032a0a13          	addi	s4,s4,50 # 5228 <malloc+0x47a>
    int n = write(fd, "xxx", 3);
    11fe:	00004a97          	auipc	s5,0x4
    1202:	6a2a8a93          	addi	s5,s5,1698 # 58a0 <malloc+0xaf2>
    int fd = open("truncfile", O_CREATE|O_WRONLY|O_TRUNC);
    1206:	60100593          	li	a1,1537
    120a:	8552                	mv	a0,s4
    120c:	00003097          	auipc	ra,0x3
    1210:	6ec080e7          	jalr	1772(ra) # 48f8 <open>
    1214:	84aa                	mv	s1,a0
    if(fd < 0){
    1216:	04054763          	bltz	a0,1264 <truncate3+0x180>
    int n = write(fd, "xxx", 3);
    121a:	460d                	li	a2,3
    121c:	85d6                	mv	a1,s5
    121e:	00003097          	auipc	ra,0x3
    1222:	6ba080e7          	jalr	1722(ra) # 48d8 <write>
    if(n != 3){
    1226:	478d                	li	a5,3
    1228:	04f51c63          	bne	a0,a5,1280 <truncate3+0x19c>
    close(fd);
    122c:	8526                	mv	a0,s1
    122e:	00003097          	auipc	ra,0x3
    1232:	6b2080e7          	jalr	1714(ra) # 48e0 <close>
  for(int i = 0; i < 150; i++){
    1236:	39fd                	addiw	s3,s3,-1
    1238:	fc0997e3          	bnez	s3,1206 <truncate3+0x122>
  wait(&xstatus);
    123c:	fbc40513          	addi	a0,s0,-68
    1240:	00003097          	auipc	ra,0x3
    1244:	680080e7          	jalr	1664(ra) # 48c0 <wait>
  remove("truncfile");
    1248:	00004517          	auipc	a0,0x4
    124c:	fe050513          	addi	a0,a0,-32 # 5228 <malloc+0x47a>
    1250:	00003097          	auipc	ra,0x3
    1254:	710080e7          	jalr	1808(ra) # 4960 <remove>
  exit(xstatus);
    1258:	fbc42503          	lw	a0,-68(s0)
    125c:	00003097          	auipc	ra,0x3
    1260:	65c080e7          	jalr	1628(ra) # 48b8 <exit>
      printf("%s: open failed\n", s);
    1264:	85ca                	mv	a1,s2
    1266:	00004517          	auipc	a0,0x4
    126a:	5f250513          	addi	a0,a0,1522 # 5858 <malloc+0xaaa>
    126e:	00004097          	auipc	ra,0x4
    1272:	a5a080e7          	jalr	-1446(ra) # 4cc8 <printf>
      exit(1);
    1276:	4505                	li	a0,1
    1278:	00003097          	auipc	ra,0x3
    127c:	640080e7          	jalr	1600(ra) # 48b8 <exit>
      printf("%s: write got %d, expected 3\n", s, n);
    1280:	862a                	mv	a2,a0
    1282:	85ca                	mv	a1,s2
    1284:	00004517          	auipc	a0,0x4
    1288:	62450513          	addi	a0,a0,1572 # 58a8 <malloc+0xafa>
    128c:	00004097          	auipc	ra,0x4
    1290:	a3c080e7          	jalr	-1476(ra) # 4cc8 <printf>
      exit(1);
    1294:	4505                	li	a0,1
    1296:	00003097          	auipc	ra,0x3
    129a:	622080e7          	jalr	1570(ra) # 48b8 <exit>

000000000000129e <exectest>:
{
    129e:	715d                	addi	sp,sp,-80
    12a0:	e486                	sd	ra,72(sp)
    12a2:	e0a2                	sd	s0,64(sp)
    12a4:	fc26                	sd	s1,56(sp)
    12a6:	f84a                	sd	s2,48(sp)
    12a8:	0880                	addi	s0,sp,80
    12aa:	892a                	mv	s2,a0
  char *echoargv[] = { "echo", "OK", 0 };
    12ac:	00004797          	auipc	a5,0x4
    12b0:	f2478793          	addi	a5,a5,-220 # 51d0 <malloc+0x422>
    12b4:	fcf43023          	sd	a5,-64(s0)
    12b8:	00004797          	auipc	a5,0x4
    12bc:	61078793          	addi	a5,a5,1552 # 58c8 <malloc+0xb1a>
    12c0:	fcf43423          	sd	a5,-56(s0)
    12c4:	fc043823          	sd	zero,-48(s0)
  remove("echo-ok");
    12c8:	00004517          	auipc	a0,0x4
    12cc:	60850513          	addi	a0,a0,1544 # 58d0 <malloc+0xb22>
    12d0:	00003097          	auipc	ra,0x3
    12d4:	690080e7          	jalr	1680(ra) # 4960 <remove>
  pid = fork();
    12d8:	00003097          	auipc	ra,0x3
    12dc:	5d8080e7          	jalr	1496(ra) # 48b0 <fork>
  if(pid < 0) {
    12e0:	04054663          	bltz	a0,132c <exectest+0x8e>
    12e4:	84aa                	mv	s1,a0
  if(pid == 0) {
    12e6:	e959                	bnez	a0,137c <exectest+0xde>
    close(1);
    12e8:	4505                	li	a0,1
    12ea:	00003097          	auipc	ra,0x3
    12ee:	5f6080e7          	jalr	1526(ra) # 48e0 <close>
    fd = open("echo-ok", O_CREATE|O_WRONLY);
    12f2:	20100593          	li	a1,513
    12f6:	00004517          	auipc	a0,0x4
    12fa:	5da50513          	addi	a0,a0,1498 # 58d0 <malloc+0xb22>
    12fe:	00003097          	auipc	ra,0x3
    1302:	5fa080e7          	jalr	1530(ra) # 48f8 <open>
    if(fd < 0) {
    1306:	04054163          	bltz	a0,1348 <exectest+0xaa>
    if(fd != 1) {
    130a:	4785                	li	a5,1
    130c:	04f50c63          	beq	a0,a5,1364 <exectest+0xc6>
      printf("%s: wrong fd\n", s);
    1310:	85ca                	mv	a1,s2
    1312:	00004517          	auipc	a0,0x4
    1316:	5de50513          	addi	a0,a0,1502 # 58f0 <malloc+0xb42>
    131a:	00004097          	auipc	ra,0x4
    131e:	9ae080e7          	jalr	-1618(ra) # 4cc8 <printf>
      exit(1);
    1322:	4505                	li	a0,1
    1324:	00003097          	auipc	ra,0x3
    1328:	594080e7          	jalr	1428(ra) # 48b8 <exit>
     printf("%s: fork failed\n", s);
    132c:	85ca                	mv	a1,s2
    132e:	00004517          	auipc	a0,0x4
    1332:	51250513          	addi	a0,a0,1298 # 5840 <malloc+0xa92>
    1336:	00004097          	auipc	ra,0x4
    133a:	992080e7          	jalr	-1646(ra) # 4cc8 <printf>
     exit(1);
    133e:	4505                	li	a0,1
    1340:	00003097          	auipc	ra,0x3
    1344:	578080e7          	jalr	1400(ra) # 48b8 <exit>
      printf("%s: create failed\n", s);
    1348:	85ca                	mv	a1,s2
    134a:	00004517          	auipc	a0,0x4
    134e:	58e50513          	addi	a0,a0,1422 # 58d8 <malloc+0xb2a>
    1352:	00004097          	auipc	ra,0x4
    1356:	976080e7          	jalr	-1674(ra) # 4cc8 <printf>
      exit(1);
    135a:	4505                	li	a0,1
    135c:	00003097          	auipc	ra,0x3
    1360:	55c080e7          	jalr	1372(ra) # 48b8 <exit>
    if(exec("echo", echoargv) < 0){
    1364:	fc040593          	addi	a1,s0,-64
    1368:	00004517          	auipc	a0,0x4
    136c:	e6850513          	addi	a0,a0,-408 # 51d0 <malloc+0x422>
    1370:	00003097          	auipc	ra,0x3
    1374:	580080e7          	jalr	1408(ra) # 48f0 <exec>
    1378:	02054163          	bltz	a0,139a <exectest+0xfc>
  if (wait(&xstatus) != pid) {
    137c:	fdc40513          	addi	a0,s0,-36
    1380:	00003097          	auipc	ra,0x3
    1384:	540080e7          	jalr	1344(ra) # 48c0 <wait>
    1388:	02951763          	bne	a0,s1,13b6 <exectest+0x118>
  if(xstatus != 0)
    138c:	fdc42503          	lw	a0,-36(s0)
    1390:	cd0d                	beqz	a0,13ca <exectest+0x12c>
    exit(xstatus);
    1392:	00003097          	auipc	ra,0x3
    1396:	526080e7          	jalr	1318(ra) # 48b8 <exit>
      printf("%s: exec echo failed\n", s);
    139a:	85ca                	mv	a1,s2
    139c:	00004517          	auipc	a0,0x4
    13a0:	56450513          	addi	a0,a0,1380 # 5900 <malloc+0xb52>
    13a4:	00004097          	auipc	ra,0x4
    13a8:	924080e7          	jalr	-1756(ra) # 4cc8 <printf>
      exit(1);
    13ac:	4505                	li	a0,1
    13ae:	00003097          	auipc	ra,0x3
    13b2:	50a080e7          	jalr	1290(ra) # 48b8 <exit>
    printf("%s: wait failed!\n", s);
    13b6:	85ca                	mv	a1,s2
    13b8:	00004517          	auipc	a0,0x4
    13bc:	56050513          	addi	a0,a0,1376 # 5918 <malloc+0xb6a>
    13c0:	00004097          	auipc	ra,0x4
    13c4:	908080e7          	jalr	-1784(ra) # 4cc8 <printf>
    13c8:	b7d1                	j	138c <exectest+0xee>
  fd = open("echo-ok", O_RDONLY);
    13ca:	4581                	li	a1,0
    13cc:	00004517          	auipc	a0,0x4
    13d0:	50450513          	addi	a0,a0,1284 # 58d0 <malloc+0xb22>
    13d4:	00003097          	auipc	ra,0x3
    13d8:	524080e7          	jalr	1316(ra) # 48f8 <open>
  if(fd < 0) {
    13dc:	02054a63          	bltz	a0,1410 <exectest+0x172>
  if (read(fd, buf, 2) != 2) {
    13e0:	4609                	li	a2,2
    13e2:	fb840593          	addi	a1,s0,-72
    13e6:	00003097          	auipc	ra,0x3
    13ea:	4ea080e7          	jalr	1258(ra) # 48d0 <read>
    13ee:	4789                	li	a5,2
    13f0:	02f50e63          	beq	a0,a5,142c <exectest+0x18e>
    printf("%s: read failed\n", s);
    13f4:	85ca                	mv	a1,s2
    13f6:	00004517          	auipc	a0,0x4
    13fa:	19a50513          	addi	a0,a0,410 # 5590 <malloc+0x7e2>
    13fe:	00004097          	auipc	ra,0x4
    1402:	8ca080e7          	jalr	-1846(ra) # 4cc8 <printf>
    exit(1);
    1406:	4505                	li	a0,1
    1408:	00003097          	auipc	ra,0x3
    140c:	4b0080e7          	jalr	1200(ra) # 48b8 <exit>
    printf("%s: open failed\n", s);
    1410:	85ca                	mv	a1,s2
    1412:	00004517          	auipc	a0,0x4
    1416:	44650513          	addi	a0,a0,1094 # 5858 <malloc+0xaaa>
    141a:	00004097          	auipc	ra,0x4
    141e:	8ae080e7          	jalr	-1874(ra) # 4cc8 <printf>
    exit(1);
    1422:	4505                	li	a0,1
    1424:	00003097          	auipc	ra,0x3
    1428:	494080e7          	jalr	1172(ra) # 48b8 <exit>
  remove("echo-ok");
    142c:	00004517          	auipc	a0,0x4
    1430:	4a450513          	addi	a0,a0,1188 # 58d0 <malloc+0xb22>
    1434:	00003097          	auipc	ra,0x3
    1438:	52c080e7          	jalr	1324(ra) # 4960 <remove>
  if(buf[0] == 'O' && buf[1] == 'K')
    143c:	fb844703          	lbu	a4,-72(s0)
    1440:	04f00793          	li	a5,79
    1444:	00f71863          	bne	a4,a5,1454 <exectest+0x1b6>
    1448:	fb944703          	lbu	a4,-71(s0)
    144c:	04b00793          	li	a5,75
    1450:	02f70063          	beq	a4,a5,1470 <exectest+0x1d2>
    printf("%s: wrong output\n", s);
    1454:	85ca                	mv	a1,s2
    1456:	00004517          	auipc	a0,0x4
    145a:	4da50513          	addi	a0,a0,1242 # 5930 <malloc+0xb82>
    145e:	00004097          	auipc	ra,0x4
    1462:	86a080e7          	jalr	-1942(ra) # 4cc8 <printf>
    exit(1);
    1466:	4505                	li	a0,1
    1468:	00003097          	auipc	ra,0x3
    146c:	450080e7          	jalr	1104(ra) # 48b8 <exit>
    exit(0);
    1470:	4501                	li	a0,0
    1472:	00003097          	auipc	ra,0x3
    1476:	446080e7          	jalr	1094(ra) # 48b8 <exit>

000000000000147a <pipe1>:
{
    147a:	711d                	addi	sp,sp,-96
    147c:	ec86                	sd	ra,88(sp)
    147e:	e8a2                	sd	s0,80(sp)
    1480:	e4a6                	sd	s1,72(sp)
    1482:	e0ca                	sd	s2,64(sp)
    1484:	fc4e                	sd	s3,56(sp)
    1486:	f852                	sd	s4,48(sp)
    1488:	f456                	sd	s5,40(sp)
    148a:	f05a                	sd	s6,32(sp)
    148c:	ec5e                	sd	s7,24(sp)
    148e:	1080                	addi	s0,sp,96
    1490:	892a                	mv	s2,a0
  if(pipe(fds) != 0){
    1492:	fa840513          	addi	a0,s0,-88
    1496:	00003097          	auipc	ra,0x3
    149a:	432080e7          	jalr	1074(ra) # 48c8 <pipe>
    149e:	ed35                	bnez	a0,151a <pipe1+0xa0>
    14a0:	84aa                	mv	s1,a0
  pid = fork();
    14a2:	00003097          	auipc	ra,0x3
    14a6:	40e080e7          	jalr	1038(ra) # 48b0 <fork>
    14aa:	8a2a                	mv	s4,a0
  if(pid == 0){
    14ac:	c549                	beqz	a0,1536 <pipe1+0xbc>
  } else if(pid > 0){
    14ae:	18a05063          	blez	a0,162e <pipe1+0x1b4>
    close(fds[1]);
    14b2:	fac42503          	lw	a0,-84(s0)
    14b6:	00003097          	auipc	ra,0x3
    14ba:	42a080e7          	jalr	1066(ra) # 48e0 <close>
    total = 0;
    14be:	8aa6                	mv	s5,s1
    cc = 1;
    14c0:	4985                	li	s3,1
    while((n = read(fds[0], buf, cc)) > 0){
    14c2:	00009b17          	auipc	s6,0x9
    14c6:	3aeb0b13          	addi	s6,s6,942 # a870 <buf>
      if(cc > sizeof(buf))
    14ca:	6a09                	lui	s4,0x2
    14cc:	800a0a13          	addi	s4,s4,-2048 # 1800 <forkfork+0x68>
    while((n = read(fds[0], buf, cc)) > 0){
    14d0:	864e                	mv	a2,s3
    14d2:	85da                	mv	a1,s6
    14d4:	fa842503          	lw	a0,-88(s0)
    14d8:	00003097          	auipc	ra,0x3
    14dc:	3f8080e7          	jalr	1016(ra) # 48d0 <read>
    14e0:	10a05263          	blez	a0,15e4 <pipe1+0x16a>
      for(i = 0; i < n; i++){
    14e4:	00009717          	auipc	a4,0x9
    14e8:	38c70713          	addi	a4,a4,908 # a870 <buf>
    14ec:	00a4863b          	addw	a2,s1,a0
        if((buf[i] & 0xff) != (seq++ & 0xff)){
    14f0:	00074683          	lbu	a3,0(a4)
    14f4:	0ff4f793          	andi	a5,s1,255
    14f8:	2485                	addiw	s1,s1,1
    14fa:	0cf69163          	bne	a3,a5,15bc <pipe1+0x142>
      for(i = 0; i < n; i++){
    14fe:	0705                	addi	a4,a4,1
    1500:	fec498e3          	bne	s1,a2,14f0 <pipe1+0x76>
      total += n;
    1504:	00aa8abb          	addw	s5,s5,a0
      cc = cc * 2;
    1508:	0019979b          	slliw	a5,s3,0x1
    150c:	0007899b          	sext.w	s3,a5
      if(cc > sizeof(buf))
    1510:	013a7363          	bgeu	s4,s3,1516 <pipe1+0x9c>
        cc = sizeof(buf);
    1514:	89d2                	mv	s3,s4
        if((buf[i] & 0xff) != (seq++ & 0xff)){
    1516:	84b2                	mv	s1,a2
    1518:	bf65                	j	14d0 <pipe1+0x56>
    printf("%s: pipe() failed\n", s);
    151a:	85ca                	mv	a1,s2
    151c:	00004517          	auipc	a0,0x4
    1520:	42c50513          	addi	a0,a0,1068 # 5948 <malloc+0xb9a>
    1524:	00003097          	auipc	ra,0x3
    1528:	7a4080e7          	jalr	1956(ra) # 4cc8 <printf>
    exit(1);
    152c:	4505                	li	a0,1
    152e:	00003097          	auipc	ra,0x3
    1532:	38a080e7          	jalr	906(ra) # 48b8 <exit>
    close(fds[0]);
    1536:	fa842503          	lw	a0,-88(s0)
    153a:	00003097          	auipc	ra,0x3
    153e:	3a6080e7          	jalr	934(ra) # 48e0 <close>
    for(n = 0; n < N; n++){
    1542:	00009b17          	auipc	s6,0x9
    1546:	32eb0b13          	addi	s6,s6,814 # a870 <buf>
    154a:	416004bb          	negw	s1,s6
    154e:	0ff4f493          	andi	s1,s1,255
    1552:	409b0993          	addi	s3,s6,1033
      if(write(fds[1], buf, SZ) != SZ){
    1556:	8bda                	mv	s7,s6
    for(n = 0; n < N; n++){
    1558:	6a85                	lui	s5,0x1
    155a:	42da8a93          	addi	s5,s5,1069 # 142d <exectest+0x18f>
{
    155e:	87da                	mv	a5,s6
        buf[i] = seq++;
    1560:	0097873b          	addw	a4,a5,s1
    1564:	00e78023          	sb	a4,0(a5)
      for(i = 0; i < SZ; i++)
    1568:	0785                	addi	a5,a5,1
    156a:	fef99be3          	bne	s3,a5,1560 <pipe1+0xe6>
    156e:	409a0a1b          	addiw	s4,s4,1033
      if(write(fds[1], buf, SZ) != SZ){
    1572:	40900613          	li	a2,1033
    1576:	85de                	mv	a1,s7
    1578:	fac42503          	lw	a0,-84(s0)
    157c:	00003097          	auipc	ra,0x3
    1580:	35c080e7          	jalr	860(ra) # 48d8 <write>
    1584:	40900793          	li	a5,1033
    1588:	00f51c63          	bne	a0,a5,15a0 <pipe1+0x126>
    for(n = 0; n < N; n++){
    158c:	24a5                	addiw	s1,s1,9
    158e:	0ff4f493          	andi	s1,s1,255
    1592:	fd5a16e3          	bne	s4,s5,155e <pipe1+0xe4>
    exit(0);
    1596:	4501                	li	a0,0
    1598:	00003097          	auipc	ra,0x3
    159c:	320080e7          	jalr	800(ra) # 48b8 <exit>
        printf("%s: pipe1 oops 1\n", s);
    15a0:	85ca                	mv	a1,s2
    15a2:	00004517          	auipc	a0,0x4
    15a6:	3be50513          	addi	a0,a0,958 # 5960 <malloc+0xbb2>
    15aa:	00003097          	auipc	ra,0x3
    15ae:	71e080e7          	jalr	1822(ra) # 4cc8 <printf>
        exit(1);
    15b2:	4505                	li	a0,1
    15b4:	00003097          	auipc	ra,0x3
    15b8:	304080e7          	jalr	772(ra) # 48b8 <exit>
          printf("%s: pipe1 oops 2\n", s);
    15bc:	85ca                	mv	a1,s2
    15be:	00004517          	auipc	a0,0x4
    15c2:	3ba50513          	addi	a0,a0,954 # 5978 <malloc+0xbca>
    15c6:	00003097          	auipc	ra,0x3
    15ca:	702080e7          	jalr	1794(ra) # 4cc8 <printf>
}
    15ce:	60e6                	ld	ra,88(sp)
    15d0:	6446                	ld	s0,80(sp)
    15d2:	64a6                	ld	s1,72(sp)
    15d4:	6906                	ld	s2,64(sp)
    15d6:	79e2                	ld	s3,56(sp)
    15d8:	7a42                	ld	s4,48(sp)
    15da:	7aa2                	ld	s5,40(sp)
    15dc:	7b02                	ld	s6,32(sp)
    15de:	6be2                	ld	s7,24(sp)
    15e0:	6125                	addi	sp,sp,96
    15e2:	8082                	ret
    if(total != N * SZ){
    15e4:	6785                	lui	a5,0x1
    15e6:	42d78793          	addi	a5,a5,1069 # 142d <exectest+0x18f>
    15ea:	02fa8063          	beq	s5,a5,160a <pipe1+0x190>
      printf("%s: pipe1 oops 3 total %d\n", total);
    15ee:	85d6                	mv	a1,s5
    15f0:	00004517          	auipc	a0,0x4
    15f4:	3a050513          	addi	a0,a0,928 # 5990 <malloc+0xbe2>
    15f8:	00003097          	auipc	ra,0x3
    15fc:	6d0080e7          	jalr	1744(ra) # 4cc8 <printf>
      exit(1);
    1600:	4505                	li	a0,1
    1602:	00003097          	auipc	ra,0x3
    1606:	2b6080e7          	jalr	694(ra) # 48b8 <exit>
    close(fds[0]);
    160a:	fa842503          	lw	a0,-88(s0)
    160e:	00003097          	auipc	ra,0x3
    1612:	2d2080e7          	jalr	722(ra) # 48e0 <close>
    wait(&xstatus);
    1616:	fa440513          	addi	a0,s0,-92
    161a:	00003097          	auipc	ra,0x3
    161e:	2a6080e7          	jalr	678(ra) # 48c0 <wait>
    exit(xstatus);
    1622:	fa442503          	lw	a0,-92(s0)
    1626:	00003097          	auipc	ra,0x3
    162a:	292080e7          	jalr	658(ra) # 48b8 <exit>
    printf("%s: fork() failed\n", s);
    162e:	85ca                	mv	a1,s2
    1630:	00004517          	auipc	a0,0x4
    1634:	38050513          	addi	a0,a0,896 # 59b0 <malloc+0xc02>
    1638:	00003097          	auipc	ra,0x3
    163c:	690080e7          	jalr	1680(ra) # 4cc8 <printf>
    exit(1);
    1640:	4505                	li	a0,1
    1642:	00003097          	auipc	ra,0x3
    1646:	276080e7          	jalr	630(ra) # 48b8 <exit>

000000000000164a <exitwait>:
{
    164a:	7139                	addi	sp,sp,-64
    164c:	fc06                	sd	ra,56(sp)
    164e:	f822                	sd	s0,48(sp)
    1650:	f426                	sd	s1,40(sp)
    1652:	f04a                	sd	s2,32(sp)
    1654:	ec4e                	sd	s3,24(sp)
    1656:	e852                	sd	s4,16(sp)
    1658:	0080                	addi	s0,sp,64
    165a:	8a2a                	mv	s4,a0
  for(i = 0; i < 100; i++){
    165c:	4901                	li	s2,0
    165e:	06400993          	li	s3,100
    pid = fork();
    1662:	00003097          	auipc	ra,0x3
    1666:	24e080e7          	jalr	590(ra) # 48b0 <fork>
    166a:	84aa                	mv	s1,a0
    if(pid < 0){
    166c:	02054a63          	bltz	a0,16a0 <exitwait+0x56>
    if(pid){
    1670:	c151                	beqz	a0,16f4 <exitwait+0xaa>
      if(wait(&xstate) != pid){
    1672:	fcc40513          	addi	a0,s0,-52
    1676:	00003097          	auipc	ra,0x3
    167a:	24a080e7          	jalr	586(ra) # 48c0 <wait>
    167e:	02951f63          	bne	a0,s1,16bc <exitwait+0x72>
      if(i != xstate) {
    1682:	fcc42783          	lw	a5,-52(s0)
    1686:	05279963          	bne	a5,s2,16d8 <exitwait+0x8e>
  for(i = 0; i < 100; i++){
    168a:	2905                	addiw	s2,s2,1
    168c:	fd391be3          	bne	s2,s3,1662 <exitwait+0x18>
}
    1690:	70e2                	ld	ra,56(sp)
    1692:	7442                	ld	s0,48(sp)
    1694:	74a2                	ld	s1,40(sp)
    1696:	7902                	ld	s2,32(sp)
    1698:	69e2                	ld	s3,24(sp)
    169a:	6a42                	ld	s4,16(sp)
    169c:	6121                	addi	sp,sp,64
    169e:	8082                	ret
      printf("%s: fork failed\n", s);
    16a0:	85d2                	mv	a1,s4
    16a2:	00004517          	auipc	a0,0x4
    16a6:	19e50513          	addi	a0,a0,414 # 5840 <malloc+0xa92>
    16aa:	00003097          	auipc	ra,0x3
    16ae:	61e080e7          	jalr	1566(ra) # 4cc8 <printf>
      exit(1);
    16b2:	4505                	li	a0,1
    16b4:	00003097          	auipc	ra,0x3
    16b8:	204080e7          	jalr	516(ra) # 48b8 <exit>
        printf("%s: wait wrong pid\n", s);
    16bc:	85d2                	mv	a1,s4
    16be:	00004517          	auipc	a0,0x4
    16c2:	30a50513          	addi	a0,a0,778 # 59c8 <malloc+0xc1a>
    16c6:	00003097          	auipc	ra,0x3
    16ca:	602080e7          	jalr	1538(ra) # 4cc8 <printf>
        exit(1);
    16ce:	4505                	li	a0,1
    16d0:	00003097          	auipc	ra,0x3
    16d4:	1e8080e7          	jalr	488(ra) # 48b8 <exit>
        printf("%s: wait wrong exit status\n", s);
    16d8:	85d2                	mv	a1,s4
    16da:	00004517          	auipc	a0,0x4
    16de:	30650513          	addi	a0,a0,774 # 59e0 <malloc+0xc32>
    16e2:	00003097          	auipc	ra,0x3
    16e6:	5e6080e7          	jalr	1510(ra) # 4cc8 <printf>
        exit(1);
    16ea:	4505                	li	a0,1
    16ec:	00003097          	auipc	ra,0x3
    16f0:	1cc080e7          	jalr	460(ra) # 48b8 <exit>
      exit(i);
    16f4:	854a                	mv	a0,s2
    16f6:	00003097          	auipc	ra,0x3
    16fa:	1c2080e7          	jalr	450(ra) # 48b8 <exit>

00000000000016fe <twochildren>:
{
    16fe:	1101                	addi	sp,sp,-32
    1700:	ec06                	sd	ra,24(sp)
    1702:	e822                	sd	s0,16(sp)
    1704:	e426                	sd	s1,8(sp)
    1706:	e04a                	sd	s2,0(sp)
    1708:	1000                	addi	s0,sp,32
    170a:	892a                	mv	s2,a0
    170c:	3e800493          	li	s1,1000
    int pid1 = fork();
    1710:	00003097          	auipc	ra,0x3
    1714:	1a0080e7          	jalr	416(ra) # 48b0 <fork>
    if(pid1 < 0){
    1718:	02054c63          	bltz	a0,1750 <twochildren+0x52>
    if(pid1 == 0){
    171c:	c921                	beqz	a0,176c <twochildren+0x6e>
      int pid2 = fork();
    171e:	00003097          	auipc	ra,0x3
    1722:	192080e7          	jalr	402(ra) # 48b0 <fork>
      if(pid2 < 0){
    1726:	04054763          	bltz	a0,1774 <twochildren+0x76>
      if(pid2 == 0){
    172a:	c13d                	beqz	a0,1790 <twochildren+0x92>
        wait(0);
    172c:	4501                	li	a0,0
    172e:	00003097          	auipc	ra,0x3
    1732:	192080e7          	jalr	402(ra) # 48c0 <wait>
        wait(0);
    1736:	4501                	li	a0,0
    1738:	00003097          	auipc	ra,0x3
    173c:	188080e7          	jalr	392(ra) # 48c0 <wait>
  for(int i = 0; i < 1000; i++){
    1740:	34fd                	addiw	s1,s1,-1
    1742:	f4f9                	bnez	s1,1710 <twochildren+0x12>
}
    1744:	60e2                	ld	ra,24(sp)
    1746:	6442                	ld	s0,16(sp)
    1748:	64a2                	ld	s1,8(sp)
    174a:	6902                	ld	s2,0(sp)
    174c:	6105                	addi	sp,sp,32
    174e:	8082                	ret
      printf("%s: fork failed\n", s);
    1750:	85ca                	mv	a1,s2
    1752:	00004517          	auipc	a0,0x4
    1756:	0ee50513          	addi	a0,a0,238 # 5840 <malloc+0xa92>
    175a:	00003097          	auipc	ra,0x3
    175e:	56e080e7          	jalr	1390(ra) # 4cc8 <printf>
      exit(1);
    1762:	4505                	li	a0,1
    1764:	00003097          	auipc	ra,0x3
    1768:	154080e7          	jalr	340(ra) # 48b8 <exit>
      exit(0);
    176c:	00003097          	auipc	ra,0x3
    1770:	14c080e7          	jalr	332(ra) # 48b8 <exit>
        printf("%s: fork failed\n", s);
    1774:	85ca                	mv	a1,s2
    1776:	00004517          	auipc	a0,0x4
    177a:	0ca50513          	addi	a0,a0,202 # 5840 <malloc+0xa92>
    177e:	00003097          	auipc	ra,0x3
    1782:	54a080e7          	jalr	1354(ra) # 4cc8 <printf>
        exit(1);
    1786:	4505                	li	a0,1
    1788:	00003097          	auipc	ra,0x3
    178c:	130080e7          	jalr	304(ra) # 48b8 <exit>
        exit(0);
    1790:	00003097          	auipc	ra,0x3
    1794:	128080e7          	jalr	296(ra) # 48b8 <exit>

0000000000001798 <forkfork>:
{
    1798:	7179                	addi	sp,sp,-48
    179a:	f406                	sd	ra,40(sp)
    179c:	f022                	sd	s0,32(sp)
    179e:	ec26                	sd	s1,24(sp)
    17a0:	1800                	addi	s0,sp,48
    17a2:	84aa                	mv	s1,a0
    int pid = fork();
    17a4:	00003097          	auipc	ra,0x3
    17a8:	10c080e7          	jalr	268(ra) # 48b0 <fork>
    if(pid < 0){
    17ac:	04054163          	bltz	a0,17ee <forkfork+0x56>
    if(pid == 0){
    17b0:	cd29                	beqz	a0,180a <forkfork+0x72>
    int pid = fork();
    17b2:	00003097          	auipc	ra,0x3
    17b6:	0fe080e7          	jalr	254(ra) # 48b0 <fork>
    if(pid < 0){
    17ba:	02054a63          	bltz	a0,17ee <forkfork+0x56>
    if(pid == 0){
    17be:	c531                	beqz	a0,180a <forkfork+0x72>
    wait(&xstatus);
    17c0:	fdc40513          	addi	a0,s0,-36
    17c4:	00003097          	auipc	ra,0x3
    17c8:	0fc080e7          	jalr	252(ra) # 48c0 <wait>
    if(xstatus != 0) {
    17cc:	fdc42783          	lw	a5,-36(s0)
    17d0:	ebbd                	bnez	a5,1846 <forkfork+0xae>
    wait(&xstatus);
    17d2:	fdc40513          	addi	a0,s0,-36
    17d6:	00003097          	auipc	ra,0x3
    17da:	0ea080e7          	jalr	234(ra) # 48c0 <wait>
    if(xstatus != 0) {
    17de:	fdc42783          	lw	a5,-36(s0)
    17e2:	e3b5                	bnez	a5,1846 <forkfork+0xae>
}
    17e4:	70a2                	ld	ra,40(sp)
    17e6:	7402                	ld	s0,32(sp)
    17e8:	64e2                	ld	s1,24(sp)
    17ea:	6145                	addi	sp,sp,48
    17ec:	8082                	ret
      printf("%s: fork failed", s);
    17ee:	85a6                	mv	a1,s1
    17f0:	00004517          	auipc	a0,0x4
    17f4:	21050513          	addi	a0,a0,528 # 5a00 <malloc+0xc52>
    17f8:	00003097          	auipc	ra,0x3
    17fc:	4d0080e7          	jalr	1232(ra) # 4cc8 <printf>
      exit(1);
    1800:	4505                	li	a0,1
    1802:	00003097          	auipc	ra,0x3
    1806:	0b6080e7          	jalr	182(ra) # 48b8 <exit>
{
    180a:	0c800493          	li	s1,200
        int pid1 = fork();
    180e:	00003097          	auipc	ra,0x3
    1812:	0a2080e7          	jalr	162(ra) # 48b0 <fork>
        if(pid1 < 0){
    1816:	00054f63          	bltz	a0,1834 <forkfork+0x9c>
        if(pid1 == 0){
    181a:	c115                	beqz	a0,183e <forkfork+0xa6>
        wait(0);
    181c:	4501                	li	a0,0
    181e:	00003097          	auipc	ra,0x3
    1822:	0a2080e7          	jalr	162(ra) # 48c0 <wait>
      for(int j = 0; j < 200; j++){
    1826:	34fd                	addiw	s1,s1,-1
    1828:	f0fd                	bnez	s1,180e <forkfork+0x76>
      exit(0);
    182a:	4501                	li	a0,0
    182c:	00003097          	auipc	ra,0x3
    1830:	08c080e7          	jalr	140(ra) # 48b8 <exit>
          exit(1);
    1834:	4505                	li	a0,1
    1836:	00003097          	auipc	ra,0x3
    183a:	082080e7          	jalr	130(ra) # 48b8 <exit>
          exit(0);
    183e:	00003097          	auipc	ra,0x3
    1842:	07a080e7          	jalr	122(ra) # 48b8 <exit>
      printf("%s: fork in child failed", s);
    1846:	85a6                	mv	a1,s1
    1848:	00004517          	auipc	a0,0x4
    184c:	1c850513          	addi	a0,a0,456 # 5a10 <malloc+0xc62>
    1850:	00003097          	auipc	ra,0x3
    1854:	478080e7          	jalr	1144(ra) # 4cc8 <printf>
      exit(1);
    1858:	4505                	li	a0,1
    185a:	00003097          	auipc	ra,0x3
    185e:	05e080e7          	jalr	94(ra) # 48b8 <exit>

0000000000001862 <reparent2>:
{
    1862:	1101                	addi	sp,sp,-32
    1864:	ec06                	sd	ra,24(sp)
    1866:	e822                	sd	s0,16(sp)
    1868:	e426                	sd	s1,8(sp)
    186a:	1000                	addi	s0,sp,32
    186c:	32000493          	li	s1,800
    int pid1 = fork();
    1870:	00003097          	auipc	ra,0x3
    1874:	040080e7          	jalr	64(ra) # 48b0 <fork>
    if(pid1 < 0){
    1878:	00054f63          	bltz	a0,1896 <reparent2+0x34>
    if(pid1 == 0){
    187c:	c915                	beqz	a0,18b0 <reparent2+0x4e>
    wait(0);
    187e:	4501                	li	a0,0
    1880:	00003097          	auipc	ra,0x3
    1884:	040080e7          	jalr	64(ra) # 48c0 <wait>
  for(int i = 0; i < 800; i++){
    1888:	34fd                	addiw	s1,s1,-1
    188a:	f0fd                	bnez	s1,1870 <reparent2+0xe>
  exit(0);
    188c:	4501                	li	a0,0
    188e:	00003097          	auipc	ra,0x3
    1892:	02a080e7          	jalr	42(ra) # 48b8 <exit>
      printf("fork failed\n");
    1896:	00004517          	auipc	a0,0x4
    189a:	32a50513          	addi	a0,a0,810 # 5bc0 <malloc+0xe12>
    189e:	00003097          	auipc	ra,0x3
    18a2:	42a080e7          	jalr	1066(ra) # 4cc8 <printf>
      exit(1);
    18a6:	4505                	li	a0,1
    18a8:	00003097          	auipc	ra,0x3
    18ac:	010080e7          	jalr	16(ra) # 48b8 <exit>
      fork();
    18b0:	00003097          	auipc	ra,0x3
    18b4:	000080e7          	jalr	ra # 48b0 <fork>
      fork();
    18b8:	00003097          	auipc	ra,0x3
    18bc:	ff8080e7          	jalr	-8(ra) # 48b0 <fork>
      exit(0);
    18c0:	4501                	li	a0,0
    18c2:	00003097          	auipc	ra,0x3
    18c6:	ff6080e7          	jalr	-10(ra) # 48b8 <exit>

00000000000018ca <forktest>:
{
    18ca:	7179                	addi	sp,sp,-48
    18cc:	f406                	sd	ra,40(sp)
    18ce:	f022                	sd	s0,32(sp)
    18d0:	ec26                	sd	s1,24(sp)
    18d2:	e84a                	sd	s2,16(sp)
    18d4:	e44e                	sd	s3,8(sp)
    18d6:	1800                	addi	s0,sp,48
    18d8:	89aa                	mv	s3,a0
  for(n=0; n<N; n++){
    18da:	4481                	li	s1,0
    18dc:	3e800913          	li	s2,1000
    pid = fork();
    18e0:	00003097          	auipc	ra,0x3
    18e4:	fd0080e7          	jalr	-48(ra) # 48b0 <fork>
    if(pid < 0)
    18e8:	02054863          	bltz	a0,1918 <forktest+0x4e>
    if(pid == 0)
    18ec:	c115                	beqz	a0,1910 <forktest+0x46>
  for(n=0; n<N; n++){
    18ee:	2485                	addiw	s1,s1,1
    18f0:	ff2498e3          	bne	s1,s2,18e0 <forktest+0x16>
    printf("%s: fork claimed to work 1000 times!\n", s);
    18f4:	85ce                	mv	a1,s3
    18f6:	00004517          	auipc	a0,0x4
    18fa:	15250513          	addi	a0,a0,338 # 5a48 <malloc+0xc9a>
    18fe:	00003097          	auipc	ra,0x3
    1902:	3ca080e7          	jalr	970(ra) # 4cc8 <printf>
    exit(1);
    1906:	4505                	li	a0,1
    1908:	00003097          	auipc	ra,0x3
    190c:	fb0080e7          	jalr	-80(ra) # 48b8 <exit>
      exit(0);
    1910:	00003097          	auipc	ra,0x3
    1914:	fa8080e7          	jalr	-88(ra) # 48b8 <exit>
  if (n == 0) {
    1918:	cc9d                	beqz	s1,1956 <forktest+0x8c>
  if(n == N){
    191a:	3e800793          	li	a5,1000
    191e:	fcf48be3          	beq	s1,a5,18f4 <forktest+0x2a>
  for(; n > 0; n--){
    1922:	00905b63          	blez	s1,1938 <forktest+0x6e>
    if(wait(0) < 0){
    1926:	4501                	li	a0,0
    1928:	00003097          	auipc	ra,0x3
    192c:	f98080e7          	jalr	-104(ra) # 48c0 <wait>
    1930:	04054163          	bltz	a0,1972 <forktest+0xa8>
  for(; n > 0; n--){
    1934:	34fd                	addiw	s1,s1,-1
    1936:	f8e5                	bnez	s1,1926 <forktest+0x5c>
  if(wait(0) != -1){
    1938:	4501                	li	a0,0
    193a:	00003097          	auipc	ra,0x3
    193e:	f86080e7          	jalr	-122(ra) # 48c0 <wait>
    1942:	57fd                	li	a5,-1
    1944:	04f51563          	bne	a0,a5,198e <forktest+0xc4>
}
    1948:	70a2                	ld	ra,40(sp)
    194a:	7402                	ld	s0,32(sp)
    194c:	64e2                	ld	s1,24(sp)
    194e:	6942                	ld	s2,16(sp)
    1950:	69a2                	ld	s3,8(sp)
    1952:	6145                	addi	sp,sp,48
    1954:	8082                	ret
    printf("%s: no fork at all!\n", s);
    1956:	85ce                	mv	a1,s3
    1958:	00004517          	auipc	a0,0x4
    195c:	0d850513          	addi	a0,a0,216 # 5a30 <malloc+0xc82>
    1960:	00003097          	auipc	ra,0x3
    1964:	368080e7          	jalr	872(ra) # 4cc8 <printf>
    exit(1);
    1968:	4505                	li	a0,1
    196a:	00003097          	auipc	ra,0x3
    196e:	f4e080e7          	jalr	-178(ra) # 48b8 <exit>
      printf("%s: wait stopped early\n", s);
    1972:	85ce                	mv	a1,s3
    1974:	00004517          	auipc	a0,0x4
    1978:	0fc50513          	addi	a0,a0,252 # 5a70 <malloc+0xcc2>
    197c:	00003097          	auipc	ra,0x3
    1980:	34c080e7          	jalr	844(ra) # 4cc8 <printf>
      exit(1);
    1984:	4505                	li	a0,1
    1986:	00003097          	auipc	ra,0x3
    198a:	f32080e7          	jalr	-206(ra) # 48b8 <exit>
    printf("%s: wait got too many\n", s);
    198e:	85ce                	mv	a1,s3
    1990:	00004517          	auipc	a0,0x4
    1994:	0f850513          	addi	a0,a0,248 # 5a88 <malloc+0xcda>
    1998:	00003097          	auipc	ra,0x3
    199c:	330080e7          	jalr	816(ra) # 4cc8 <printf>
    exit(1);
    19a0:	4505                	li	a0,1
    19a2:	00003097          	auipc	ra,0x3
    19a6:	f16080e7          	jalr	-234(ra) # 48b8 <exit>

00000000000019aa <kernmem>:
{
    19aa:	715d                	addi	sp,sp,-80
    19ac:	e486                	sd	ra,72(sp)
    19ae:	e0a2                	sd	s0,64(sp)
    19b0:	fc26                	sd	s1,56(sp)
    19b2:	f84a                	sd	s2,48(sp)
    19b4:	f44e                	sd	s3,40(sp)
    19b6:	f052                	sd	s4,32(sp)
    19b8:	ec56                	sd	s5,24(sp)
    19ba:	0880                	addi	s0,sp,80
    19bc:	8a2a                	mv	s4,a0
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    19be:	40100493          	li	s1,1025
    19c2:	04d6                	slli	s1,s1,0x15
    if(xstatus != -1)  // did kernel kill child?
    19c4:	5afd                	li	s5,-1
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    19c6:	69b1                	lui	s3,0xc
    19c8:	35098993          	addi	s3,s3,848 # c350 <__BSS_END__+0x268>
    19cc:	1007d937          	lui	s2,0x1007d
    19d0:	090e                	slli	s2,s2,0x3
    19d2:	48090913          	addi	s2,s2,1152 # 1007d480 <__BSS_END__+0x10071398>
    pid = fork();
    19d6:	00003097          	auipc	ra,0x3
    19da:	eda080e7          	jalr	-294(ra) # 48b0 <fork>
    if(pid < 0){
    19de:	02054963          	bltz	a0,1a10 <kernmem+0x66>
    if(pid == 0){
    19e2:	c529                	beqz	a0,1a2c <kernmem+0x82>
    wait(&xstatus);
    19e4:	fbc40513          	addi	a0,s0,-68
    19e8:	00003097          	auipc	ra,0x3
    19ec:	ed8080e7          	jalr	-296(ra) # 48c0 <wait>
    if(xstatus != -1)  // did kernel kill child?
    19f0:	fbc42783          	lw	a5,-68(s0)
    19f4:	05579c63          	bne	a5,s5,1a4c <kernmem+0xa2>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    19f8:	94ce                	add	s1,s1,s3
    19fa:	fd249ee3          	bne	s1,s2,19d6 <kernmem+0x2c>
}
    19fe:	60a6                	ld	ra,72(sp)
    1a00:	6406                	ld	s0,64(sp)
    1a02:	74e2                	ld	s1,56(sp)
    1a04:	7942                	ld	s2,48(sp)
    1a06:	79a2                	ld	s3,40(sp)
    1a08:	7a02                	ld	s4,32(sp)
    1a0a:	6ae2                	ld	s5,24(sp)
    1a0c:	6161                	addi	sp,sp,80
    1a0e:	8082                	ret
      printf("%s: fork failed\n", s);
    1a10:	85d2                	mv	a1,s4
    1a12:	00004517          	auipc	a0,0x4
    1a16:	e2e50513          	addi	a0,a0,-466 # 5840 <malloc+0xa92>
    1a1a:	00003097          	auipc	ra,0x3
    1a1e:	2ae080e7          	jalr	686(ra) # 4cc8 <printf>
      exit(1);
    1a22:	4505                	li	a0,1
    1a24:	00003097          	auipc	ra,0x3
    1a28:	e94080e7          	jalr	-364(ra) # 48b8 <exit>
      printf("%s: oops could read %x = %x\n", a, *a);
    1a2c:	0004c603          	lbu	a2,0(s1)
    1a30:	85a6                	mv	a1,s1
    1a32:	00004517          	auipc	a0,0x4
    1a36:	06e50513          	addi	a0,a0,110 # 5aa0 <malloc+0xcf2>
    1a3a:	00003097          	auipc	ra,0x3
    1a3e:	28e080e7          	jalr	654(ra) # 4cc8 <printf>
      exit(1);
    1a42:	4505                	li	a0,1
    1a44:	00003097          	auipc	ra,0x3
    1a48:	e74080e7          	jalr	-396(ra) # 48b8 <exit>
      exit(1);
    1a4c:	4505                	li	a0,1
    1a4e:	00003097          	auipc	ra,0x3
    1a52:	e6a080e7          	jalr	-406(ra) # 48b8 <exit>

0000000000001a56 <bigargtest>:
{
    1a56:	7179                	addi	sp,sp,-48
    1a58:	f406                	sd	ra,40(sp)
    1a5a:	f022                	sd	s0,32(sp)
    1a5c:	ec26                	sd	s1,24(sp)
    1a5e:	1800                	addi	s0,sp,48
    1a60:	84aa                	mv	s1,a0
  remove("bigarg-ok");
    1a62:	00004517          	auipc	a0,0x4
    1a66:	05e50513          	addi	a0,a0,94 # 5ac0 <malloc+0xd12>
    1a6a:	00003097          	auipc	ra,0x3
    1a6e:	ef6080e7          	jalr	-266(ra) # 4960 <remove>
  pid = fork();
    1a72:	00003097          	auipc	ra,0x3
    1a76:	e3e080e7          	jalr	-450(ra) # 48b0 <fork>
  if(pid == 0){
    1a7a:	c921                	beqz	a0,1aca <bigargtest+0x74>
  } else if(pid < 0){
    1a7c:	0a054863          	bltz	a0,1b2c <bigargtest+0xd6>
  wait(&xstatus);
    1a80:	fdc40513          	addi	a0,s0,-36
    1a84:	00003097          	auipc	ra,0x3
    1a88:	e3c080e7          	jalr	-452(ra) # 48c0 <wait>
  if(xstatus != 0)
    1a8c:	fdc42503          	lw	a0,-36(s0)
    1a90:	ed45                	bnez	a0,1b48 <bigargtest+0xf2>
  fd = open("bigarg-ok", 0);
    1a92:	4581                	li	a1,0
    1a94:	00004517          	auipc	a0,0x4
    1a98:	02c50513          	addi	a0,a0,44 # 5ac0 <malloc+0xd12>
    1a9c:	00003097          	auipc	ra,0x3
    1aa0:	e5c080e7          	jalr	-420(ra) # 48f8 <open>
  if(fd < 0){
    1aa4:	0a054663          	bltz	a0,1b50 <bigargtest+0xfa>
  close(fd);
    1aa8:	00003097          	auipc	ra,0x3
    1aac:	e38080e7          	jalr	-456(ra) # 48e0 <close>
  remove("bigarg-ok");
    1ab0:	00004517          	auipc	a0,0x4
    1ab4:	01050513          	addi	a0,a0,16 # 5ac0 <malloc+0xd12>
    1ab8:	00003097          	auipc	ra,0x3
    1abc:	ea8080e7          	jalr	-344(ra) # 4960 <remove>
}
    1ac0:	70a2                	ld	ra,40(sp)
    1ac2:	7402                	ld	s0,32(sp)
    1ac4:	64e2                	ld	s1,24(sp)
    1ac6:	6145                	addi	sp,sp,48
    1ac8:	8082                	ret
    1aca:	00005797          	auipc	a5,0x5
    1ace:	58e78793          	addi	a5,a5,1422 # 7058 <args.1773>
    1ad2:	00005697          	auipc	a3,0x5
    1ad6:	67e68693          	addi	a3,a3,1662 # 7150 <args.1773+0xf8>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    1ada:	00004717          	auipc	a4,0x4
    1ade:	ff670713          	addi	a4,a4,-10 # 5ad0 <malloc+0xd22>
    1ae2:	e398                	sd	a4,0(a5)
    for(i = 0; i < MAXARG-1; i++)
    1ae4:	07a1                	addi	a5,a5,8
    1ae6:	fed79ee3          	bne	a5,a3,1ae2 <bigargtest+0x8c>
    args[MAXARG-1] = 0;
    1aea:	00005597          	auipc	a1,0x5
    1aee:	56e58593          	addi	a1,a1,1390 # 7058 <args.1773>
    1af2:	0e05bc23          	sd	zero,248(a1)
    exec("echo", args);
    1af6:	00003517          	auipc	a0,0x3
    1afa:	6da50513          	addi	a0,a0,1754 # 51d0 <malloc+0x422>
    1afe:	00003097          	auipc	ra,0x3
    1b02:	df2080e7          	jalr	-526(ra) # 48f0 <exec>
    fd = open("bigarg-ok", O_CREATE);
    1b06:	20000593          	li	a1,512
    1b0a:	00004517          	auipc	a0,0x4
    1b0e:	fb650513          	addi	a0,a0,-74 # 5ac0 <malloc+0xd12>
    1b12:	00003097          	auipc	ra,0x3
    1b16:	de6080e7          	jalr	-538(ra) # 48f8 <open>
    close(fd);
    1b1a:	00003097          	auipc	ra,0x3
    1b1e:	dc6080e7          	jalr	-570(ra) # 48e0 <close>
    exit(0);
    1b22:	4501                	li	a0,0
    1b24:	00003097          	auipc	ra,0x3
    1b28:	d94080e7          	jalr	-620(ra) # 48b8 <exit>
    printf("%s: bigargtest: fork failed\n", s);
    1b2c:	85a6                	mv	a1,s1
    1b2e:	00004517          	auipc	a0,0x4
    1b32:	08250513          	addi	a0,a0,130 # 5bb0 <malloc+0xe02>
    1b36:	00003097          	auipc	ra,0x3
    1b3a:	192080e7          	jalr	402(ra) # 4cc8 <printf>
    exit(1);
    1b3e:	4505                	li	a0,1
    1b40:	00003097          	auipc	ra,0x3
    1b44:	d78080e7          	jalr	-648(ra) # 48b8 <exit>
    exit(xstatus);
    1b48:	00003097          	auipc	ra,0x3
    1b4c:	d70080e7          	jalr	-656(ra) # 48b8 <exit>
    printf("%s: bigarg test failed!\n", s);
    1b50:	85a6                	mv	a1,s1
    1b52:	00004517          	auipc	a0,0x4
    1b56:	07e50513          	addi	a0,a0,126 # 5bd0 <malloc+0xe22>
    1b5a:	00003097          	auipc	ra,0x3
    1b5e:	16e080e7          	jalr	366(ra) # 4cc8 <printf>
    exit(1);
    1b62:	4505                	li	a0,1
    1b64:	00003097          	auipc	ra,0x3
    1b68:	d54080e7          	jalr	-684(ra) # 48b8 <exit>

0000000000001b6c <stacktest>:
{
    1b6c:	7179                	addi	sp,sp,-48
    1b6e:	f406                	sd	ra,40(sp)
    1b70:	f022                	sd	s0,32(sp)
    1b72:	ec26                	sd	s1,24(sp)
    1b74:	1800                	addi	s0,sp,48
    1b76:	84aa                	mv	s1,a0
  pid = fork();
    1b78:	00003097          	auipc	ra,0x3
    1b7c:	d38080e7          	jalr	-712(ra) # 48b0 <fork>
  if(pid == 0) {
    1b80:	c115                	beqz	a0,1ba4 <stacktest+0x38>
  } else if(pid < 0){
    1b82:	04054363          	bltz	a0,1bc8 <stacktest+0x5c>
  wait(&xstatus);
    1b86:	fdc40513          	addi	a0,s0,-36
    1b8a:	00003097          	auipc	ra,0x3
    1b8e:	d36080e7          	jalr	-714(ra) # 48c0 <wait>
  if(xstatus == -1)  // kernel killed child?
    1b92:	fdc42503          	lw	a0,-36(s0)
    1b96:	57fd                	li	a5,-1
    1b98:	04f50663          	beq	a0,a5,1be4 <stacktest+0x78>
    exit(xstatus);
    1b9c:	00003097          	auipc	ra,0x3
    1ba0:	d1c080e7          	jalr	-740(ra) # 48b8 <exit>

static inline uint64
r_sp()
{
  uint64 x;
  asm volatile("mv %0, sp" : "=r" (x) );
    1ba4:	870a                	mv	a4,sp
    printf("%s: stacktest: read below stack %p\n", *sp);
    1ba6:	77fd                	lui	a5,0xfffff
    1ba8:	97ba                	add	a5,a5,a4
    1baa:	0007c583          	lbu	a1,0(a5) # fffffffffffff000 <__BSS_END__+0xffffffffffff2f18>
    1bae:	00004517          	auipc	a0,0x4
    1bb2:	04250513          	addi	a0,a0,66 # 5bf0 <malloc+0xe42>
    1bb6:	00003097          	auipc	ra,0x3
    1bba:	112080e7          	jalr	274(ra) # 4cc8 <printf>
    exit(1);
    1bbe:	4505                	li	a0,1
    1bc0:	00003097          	auipc	ra,0x3
    1bc4:	cf8080e7          	jalr	-776(ra) # 48b8 <exit>
    printf("%s: fork failed\n", s);
    1bc8:	85a6                	mv	a1,s1
    1bca:	00004517          	auipc	a0,0x4
    1bce:	c7650513          	addi	a0,a0,-906 # 5840 <malloc+0xa92>
    1bd2:	00003097          	auipc	ra,0x3
    1bd6:	0f6080e7          	jalr	246(ra) # 4cc8 <printf>
    exit(1);
    1bda:	4505                	li	a0,1
    1bdc:	00003097          	auipc	ra,0x3
    1be0:	cdc080e7          	jalr	-804(ra) # 48b8 <exit>
    exit(0);
    1be4:	4501                	li	a0,0
    1be6:	00003097          	auipc	ra,0x3
    1bea:	cd2080e7          	jalr	-814(ra) # 48b8 <exit>

0000000000001bee <copyinstr3>:
{
    1bee:	7179                	addi	sp,sp,-48
    1bf0:	f406                	sd	ra,40(sp)
    1bf2:	f022                	sd	s0,32(sp)
    1bf4:	ec26                	sd	s1,24(sp)
    1bf6:	1800                	addi	s0,sp,48
  sbrk(8192);
    1bf8:	6509                	lui	a0,0x2
    1bfa:	00003097          	auipc	ra,0x3
    1bfe:	d2e080e7          	jalr	-722(ra) # 4928 <sbrk>
  uint64 top = (uint64) sbrk(0);
    1c02:	4501                	li	a0,0
    1c04:	00003097          	auipc	ra,0x3
    1c08:	d24080e7          	jalr	-732(ra) # 4928 <sbrk>
  if((top % PGSIZE) != 0){
    1c0c:	03451793          	slli	a5,a0,0x34
    1c10:	eba5                	bnez	a5,1c80 <copyinstr3+0x92>
  top = (uint64) sbrk(0);
    1c12:	4501                	li	a0,0
    1c14:	00003097          	auipc	ra,0x3
    1c18:	d14080e7          	jalr	-748(ra) # 4928 <sbrk>
  if(top % PGSIZE){
    1c1c:	03451793          	slli	a5,a0,0x34
    1c20:	ebb5                	bnez	a5,1c94 <copyinstr3+0xa6>
  char *b = (char *) (top - 1);
    1c22:	fff50493          	addi	s1,a0,-1 # 1fff <sbrkmuch+0x171>
  *b = 'x';
    1c26:	07800793          	li	a5,120
    1c2a:	fef50fa3          	sb	a5,-1(a0)
  int ret = remove(b);
    1c2e:	8526                	mv	a0,s1
    1c30:	00003097          	auipc	ra,0x3
    1c34:	d30080e7          	jalr	-720(ra) # 4960 <remove>
  if(ret != -1){
    1c38:	57fd                	li	a5,-1
    1c3a:	06f51a63          	bne	a0,a5,1cae <copyinstr3+0xc0>
  int fd = open(b, O_CREATE | O_WRONLY);
    1c3e:	20100593          	li	a1,513
    1c42:	8526                	mv	a0,s1
    1c44:	00003097          	auipc	ra,0x3
    1c48:	cb4080e7          	jalr	-844(ra) # 48f8 <open>
  if(fd != -1){
    1c4c:	57fd                	li	a5,-1
    1c4e:	06f51f63          	bne	a0,a5,1ccc <copyinstr3+0xde>
  char *args[] = { "xx", 0 };
    1c52:	00004797          	auipc	a5,0x4
    1c56:	74678793          	addi	a5,a5,1862 # 6398 <malloc+0x15ea>
    1c5a:	fcf43823          	sd	a5,-48(s0)
    1c5e:	fc043c23          	sd	zero,-40(s0)
  ret = exec(b, args);
    1c62:	fd040593          	addi	a1,s0,-48
    1c66:	8526                	mv	a0,s1
    1c68:	00003097          	auipc	ra,0x3
    1c6c:	c88080e7          	jalr	-888(ra) # 48f0 <exec>
  if(ret != -1){
    1c70:	57fd                	li	a5,-1
    1c72:	06f51c63          	bne	a0,a5,1cea <copyinstr3+0xfc>
}
    1c76:	70a2                	ld	ra,40(sp)
    1c78:	7402                	ld	s0,32(sp)
    1c7a:	64e2                	ld	s1,24(sp)
    1c7c:	6145                	addi	sp,sp,48
    1c7e:	8082                	ret
    sbrk(PGSIZE - (top % PGSIZE));
    1c80:	0347d513          	srli	a0,a5,0x34
    1c84:	6785                	lui	a5,0x1
    1c86:	40a7853b          	subw	a0,a5,a0
    1c8a:	00003097          	auipc	ra,0x3
    1c8e:	c9e080e7          	jalr	-866(ra) # 4928 <sbrk>
    1c92:	b741                	j	1c12 <copyinstr3+0x24>
    printf("oops\n");
    1c94:	00004517          	auipc	a0,0x4
    1c98:	f8450513          	addi	a0,a0,-124 # 5c18 <malloc+0xe6a>
    1c9c:	00003097          	auipc	ra,0x3
    1ca0:	02c080e7          	jalr	44(ra) # 4cc8 <printf>
    exit(1);
    1ca4:	4505                	li	a0,1
    1ca6:	00003097          	auipc	ra,0x3
    1caa:	c12080e7          	jalr	-1006(ra) # 48b8 <exit>
    printf("remove(%s) returned %d, not -1\n", b, ret);
    1cae:	862a                	mv	a2,a0
    1cb0:	85a6                	mv	a1,s1
    1cb2:	00004517          	auipc	a0,0x4
    1cb6:	ad650513          	addi	a0,a0,-1322 # 5788 <malloc+0x9da>
    1cba:	00003097          	auipc	ra,0x3
    1cbe:	00e080e7          	jalr	14(ra) # 4cc8 <printf>
    exit(1);
    1cc2:	4505                	li	a0,1
    1cc4:	00003097          	auipc	ra,0x3
    1cc8:	bf4080e7          	jalr	-1036(ra) # 48b8 <exit>
    printf("open(%s) returned %d, not -1\n", b, fd);
    1ccc:	862a                	mv	a2,a0
    1cce:	85a6                	mv	a1,s1
    1cd0:	00004517          	auipc	a0,0x4
    1cd4:	ad850513          	addi	a0,a0,-1320 # 57a8 <malloc+0x9fa>
    1cd8:	00003097          	auipc	ra,0x3
    1cdc:	ff0080e7          	jalr	-16(ra) # 4cc8 <printf>
    exit(1);
    1ce0:	4505                	li	a0,1
    1ce2:	00003097          	auipc	ra,0x3
    1ce6:	bd6080e7          	jalr	-1066(ra) # 48b8 <exit>
    printf("exec(%s) returned %d, not -1\n", b, fd);
    1cea:	567d                	li	a2,-1
    1cec:	85a6                	mv	a1,s1
    1cee:	00004517          	auipc	a0,0x4
    1cf2:	ada50513          	addi	a0,a0,-1318 # 57c8 <malloc+0xa1a>
    1cf6:	00003097          	auipc	ra,0x3
    1cfa:	fd2080e7          	jalr	-46(ra) # 4cc8 <printf>
    exit(1);
    1cfe:	4505                	li	a0,1
    1d00:	00003097          	auipc	ra,0x3
    1d04:	bb8080e7          	jalr	-1096(ra) # 48b8 <exit>

0000000000001d08 <sbrkbasic>:
{
    1d08:	715d                	addi	sp,sp,-80
    1d0a:	e486                	sd	ra,72(sp)
    1d0c:	e0a2                	sd	s0,64(sp)
    1d0e:	fc26                	sd	s1,56(sp)
    1d10:	f84a                	sd	s2,48(sp)
    1d12:	f44e                	sd	s3,40(sp)
    1d14:	f052                	sd	s4,32(sp)
    1d16:	ec56                	sd	s5,24(sp)
    1d18:	0880                	addi	s0,sp,80
    1d1a:	8a2a                	mv	s4,a0
  pid = fork();
    1d1c:	00003097          	auipc	ra,0x3
    1d20:	b94080e7          	jalr	-1132(ra) # 48b0 <fork>
  if(pid < 0){
    1d24:	02054c63          	bltz	a0,1d5c <sbrkbasic+0x54>
  if(pid == 0){
    1d28:	ed21                	bnez	a0,1d80 <sbrkbasic+0x78>
    a = sbrk(TOOMUCH);
    1d2a:	40000537          	lui	a0,0x40000
    1d2e:	00003097          	auipc	ra,0x3
    1d32:	bfa080e7          	jalr	-1030(ra) # 4928 <sbrk>
    if(a == (char*)0xffffffffffffffffL){
    1d36:	57fd                	li	a5,-1
    1d38:	02f50f63          	beq	a0,a5,1d76 <sbrkbasic+0x6e>
    for(b = a; b < a+TOOMUCH; b += 4096){
    1d3c:	400007b7          	lui	a5,0x40000
    1d40:	97aa                	add	a5,a5,a0
      *b = 99;
    1d42:	06300693          	li	a3,99
    for(b = a; b < a+TOOMUCH; b += 4096){
    1d46:	6705                	lui	a4,0x1
      *b = 99;
    1d48:	00d50023          	sb	a3,0(a0) # 40000000 <__BSS_END__+0x3fff3f18>
    for(b = a; b < a+TOOMUCH; b += 4096){
    1d4c:	953a                	add	a0,a0,a4
    1d4e:	fef51de3          	bne	a0,a5,1d48 <sbrkbasic+0x40>
    exit(1);
    1d52:	4505                	li	a0,1
    1d54:	00003097          	auipc	ra,0x3
    1d58:	b64080e7          	jalr	-1180(ra) # 48b8 <exit>
    printf("fork failed in sbrkbasic\n");
    1d5c:	00004517          	auipc	a0,0x4
    1d60:	ec450513          	addi	a0,a0,-316 # 5c20 <malloc+0xe72>
    1d64:	00003097          	auipc	ra,0x3
    1d68:	f64080e7          	jalr	-156(ra) # 4cc8 <printf>
    exit(1);
    1d6c:	4505                	li	a0,1
    1d6e:	00003097          	auipc	ra,0x3
    1d72:	b4a080e7          	jalr	-1206(ra) # 48b8 <exit>
      exit(0);
    1d76:	4501                	li	a0,0
    1d78:	00003097          	auipc	ra,0x3
    1d7c:	b40080e7          	jalr	-1216(ra) # 48b8 <exit>
  wait(&xstatus);
    1d80:	fbc40513          	addi	a0,s0,-68
    1d84:	00003097          	auipc	ra,0x3
    1d88:	b3c080e7          	jalr	-1220(ra) # 48c0 <wait>
  if(xstatus == 1){
    1d8c:	fbc42703          	lw	a4,-68(s0)
    1d90:	4785                	li	a5,1
    1d92:	00f70e63          	beq	a4,a5,1dae <sbrkbasic+0xa6>
  a = sbrk(0);
    1d96:	4501                	li	a0,0
    1d98:	00003097          	auipc	ra,0x3
    1d9c:	b90080e7          	jalr	-1136(ra) # 4928 <sbrk>
    1da0:	84aa                	mv	s1,a0
  for(i = 0; i < 5000; i++){
    1da2:	4901                	li	s2,0
    *b = 1;
    1da4:	4a85                	li	s5,1
  for(i = 0; i < 5000; i++){
    1da6:	6985                	lui	s3,0x1
    1da8:	38898993          	addi	s3,s3,904 # 1388 <exectest+0xea>
    1dac:	a005                	j	1dcc <sbrkbasic+0xc4>
    printf("%s: too much memory allocated!\n", s);
    1dae:	85d2                	mv	a1,s4
    1db0:	00004517          	auipc	a0,0x4
    1db4:	e9050513          	addi	a0,a0,-368 # 5c40 <malloc+0xe92>
    1db8:	00003097          	auipc	ra,0x3
    1dbc:	f10080e7          	jalr	-240(ra) # 4cc8 <printf>
    exit(1);
    1dc0:	4505                	li	a0,1
    1dc2:	00003097          	auipc	ra,0x3
    1dc6:	af6080e7          	jalr	-1290(ra) # 48b8 <exit>
    a = b + 1;
    1dca:	84be                	mv	s1,a5
    b = sbrk(1);
    1dcc:	4505                	li	a0,1
    1dce:	00003097          	auipc	ra,0x3
    1dd2:	b5a080e7          	jalr	-1190(ra) # 4928 <sbrk>
    if(b != a){
    1dd6:	04951b63          	bne	a0,s1,1e2c <sbrkbasic+0x124>
    *b = 1;
    1dda:	01548023          	sb	s5,0(s1)
    a = b + 1;
    1dde:	00148793          	addi	a5,s1,1
  for(i = 0; i < 5000; i++){
    1de2:	2905                	addiw	s2,s2,1
    1de4:	ff3913e3          	bne	s2,s3,1dca <sbrkbasic+0xc2>
  pid = fork();
    1de8:	00003097          	auipc	ra,0x3
    1dec:	ac8080e7          	jalr	-1336(ra) # 48b0 <fork>
    1df0:	892a                	mv	s2,a0
  if(pid < 0){
    1df2:	04054d63          	bltz	a0,1e4c <sbrkbasic+0x144>
  c = sbrk(1);
    1df6:	4505                	li	a0,1
    1df8:	00003097          	auipc	ra,0x3
    1dfc:	b30080e7          	jalr	-1232(ra) # 4928 <sbrk>
  c = sbrk(1);
    1e00:	4505                	li	a0,1
    1e02:	00003097          	auipc	ra,0x3
    1e06:	b26080e7          	jalr	-1242(ra) # 4928 <sbrk>
  if(c != a + 1){
    1e0a:	0489                	addi	s1,s1,2
    1e0c:	04a48e63          	beq	s1,a0,1e68 <sbrkbasic+0x160>
    printf("%s: sbrk test failed post-fork\n", s);
    1e10:	85d2                	mv	a1,s4
    1e12:	00004517          	auipc	a0,0x4
    1e16:	e8e50513          	addi	a0,a0,-370 # 5ca0 <malloc+0xef2>
    1e1a:	00003097          	auipc	ra,0x3
    1e1e:	eae080e7          	jalr	-338(ra) # 4cc8 <printf>
    exit(1);
    1e22:	4505                	li	a0,1
    1e24:	00003097          	auipc	ra,0x3
    1e28:	a94080e7          	jalr	-1388(ra) # 48b8 <exit>
      printf("%s: sbrk test failed %d %x %x\n", i, a, b);
    1e2c:	86aa                	mv	a3,a0
    1e2e:	8626                	mv	a2,s1
    1e30:	85ca                	mv	a1,s2
    1e32:	00004517          	auipc	a0,0x4
    1e36:	e2e50513          	addi	a0,a0,-466 # 5c60 <malloc+0xeb2>
    1e3a:	00003097          	auipc	ra,0x3
    1e3e:	e8e080e7          	jalr	-370(ra) # 4cc8 <printf>
      exit(1);
    1e42:	4505                	li	a0,1
    1e44:	00003097          	auipc	ra,0x3
    1e48:	a74080e7          	jalr	-1420(ra) # 48b8 <exit>
    printf("%s: sbrk test fork failed\n", s);
    1e4c:	85d2                	mv	a1,s4
    1e4e:	00004517          	auipc	a0,0x4
    1e52:	e3250513          	addi	a0,a0,-462 # 5c80 <malloc+0xed2>
    1e56:	00003097          	auipc	ra,0x3
    1e5a:	e72080e7          	jalr	-398(ra) # 4cc8 <printf>
    exit(1);
    1e5e:	4505                	li	a0,1
    1e60:	00003097          	auipc	ra,0x3
    1e64:	a58080e7          	jalr	-1448(ra) # 48b8 <exit>
  if(pid == 0)
    1e68:	00091763          	bnez	s2,1e76 <sbrkbasic+0x16e>
    exit(0);
    1e6c:	4501                	li	a0,0
    1e6e:	00003097          	auipc	ra,0x3
    1e72:	a4a080e7          	jalr	-1462(ra) # 48b8 <exit>
  wait(&xstatus);
    1e76:	fbc40513          	addi	a0,s0,-68
    1e7a:	00003097          	auipc	ra,0x3
    1e7e:	a46080e7          	jalr	-1466(ra) # 48c0 <wait>
  exit(xstatus);
    1e82:	fbc42503          	lw	a0,-68(s0)
    1e86:	00003097          	auipc	ra,0x3
    1e8a:	a32080e7          	jalr	-1486(ra) # 48b8 <exit>

0000000000001e8e <sbrkmuch>:
{
    1e8e:	7179                	addi	sp,sp,-48
    1e90:	f406                	sd	ra,40(sp)
    1e92:	f022                	sd	s0,32(sp)
    1e94:	ec26                	sd	s1,24(sp)
    1e96:	e84a                	sd	s2,16(sp)
    1e98:	e44e                	sd	s3,8(sp)
    1e9a:	e052                	sd	s4,0(sp)
    1e9c:	1800                	addi	s0,sp,48
    1e9e:	89aa                	mv	s3,a0
  oldbrk = sbrk(0);
    1ea0:	4501                	li	a0,0
    1ea2:	00003097          	auipc	ra,0x3
    1ea6:	a86080e7          	jalr	-1402(ra) # 4928 <sbrk>
    1eaa:	892a                	mv	s2,a0
  a = sbrk(0);
    1eac:	4501                	li	a0,0
    1eae:	00003097          	auipc	ra,0x3
    1eb2:	a7a080e7          	jalr	-1414(ra) # 4928 <sbrk>
    1eb6:	84aa                	mv	s1,a0
  p = sbrk(amt);
    1eb8:	00300537          	lui	a0,0x300
    1ebc:	9d05                	subw	a0,a0,s1
    1ebe:	00003097          	auipc	ra,0x3
    1ec2:	a6a080e7          	jalr	-1430(ra) # 4928 <sbrk>
  if (p != a) {
    1ec6:	0ca49863          	bne	s1,a0,1f96 <sbrkmuch+0x108>
  char *eee = sbrk(0);
    1eca:	4501                	li	a0,0
    1ecc:	00003097          	auipc	ra,0x3
    1ed0:	a5c080e7          	jalr	-1444(ra) # 4928 <sbrk>
    1ed4:	87aa                	mv	a5,a0
  for(char *pp = a; pp < eee; pp += 4096)
    1ed6:	00a4f963          	bgeu	s1,a0,1ee8 <sbrkmuch+0x5a>
    *pp = 1;
    1eda:	4685                	li	a3,1
  for(char *pp = a; pp < eee; pp += 4096)
    1edc:	6705                	lui	a4,0x1
    *pp = 1;
    1ede:	00d48023          	sb	a3,0(s1)
  for(char *pp = a; pp < eee; pp += 4096)
    1ee2:	94ba                	add	s1,s1,a4
    1ee4:	fef4ede3          	bltu	s1,a5,1ede <sbrkmuch+0x50>
  *lastaddr = 99;
    1ee8:	003007b7          	lui	a5,0x300
    1eec:	06300713          	li	a4,99
    1ef0:	fee78fa3          	sb	a4,-1(a5) # 2fffff <__BSS_END__+0x2f3f17>
  a = sbrk(0);
    1ef4:	4501                	li	a0,0
    1ef6:	00003097          	auipc	ra,0x3
    1efa:	a32080e7          	jalr	-1486(ra) # 4928 <sbrk>
    1efe:	84aa                	mv	s1,a0
  c = sbrk(-PGSIZE);
    1f00:	757d                	lui	a0,0xfffff
    1f02:	00003097          	auipc	ra,0x3
    1f06:	a26080e7          	jalr	-1498(ra) # 4928 <sbrk>
  if(c == (char*)0xffffffffffffffffL){
    1f0a:	57fd                	li	a5,-1
    1f0c:	0af50363          	beq	a0,a5,1fb2 <sbrkmuch+0x124>
  c = sbrk(0);
    1f10:	4501                	li	a0,0
    1f12:	00003097          	auipc	ra,0x3
    1f16:	a16080e7          	jalr	-1514(ra) # 4928 <sbrk>
  if(c != a - PGSIZE){
    1f1a:	77fd                	lui	a5,0xfffff
    1f1c:	97a6                	add	a5,a5,s1
    1f1e:	0af51863          	bne	a0,a5,1fce <sbrkmuch+0x140>
  a = sbrk(0);
    1f22:	4501                	li	a0,0
    1f24:	00003097          	auipc	ra,0x3
    1f28:	a04080e7          	jalr	-1532(ra) # 4928 <sbrk>
    1f2c:	84aa                	mv	s1,a0
  c = sbrk(PGSIZE);
    1f2e:	6505                	lui	a0,0x1
    1f30:	00003097          	auipc	ra,0x3
    1f34:	9f8080e7          	jalr	-1544(ra) # 4928 <sbrk>
    1f38:	8a2a                	mv	s4,a0
  if(c != a || sbrk(0) != a + PGSIZE){
    1f3a:	0aa49963          	bne	s1,a0,1fec <sbrkmuch+0x15e>
    1f3e:	4501                	li	a0,0
    1f40:	00003097          	auipc	ra,0x3
    1f44:	9e8080e7          	jalr	-1560(ra) # 4928 <sbrk>
    1f48:	6785                	lui	a5,0x1
    1f4a:	97a6                	add	a5,a5,s1
    1f4c:	0af51063          	bne	a0,a5,1fec <sbrkmuch+0x15e>
  if(*lastaddr == 99){
    1f50:	003007b7          	lui	a5,0x300
    1f54:	fff7c703          	lbu	a4,-1(a5) # 2fffff <__BSS_END__+0x2f3f17>
    1f58:	06300793          	li	a5,99
    1f5c:	0af70763          	beq	a4,a5,200a <sbrkmuch+0x17c>
  a = sbrk(0);
    1f60:	4501                	li	a0,0
    1f62:	00003097          	auipc	ra,0x3
    1f66:	9c6080e7          	jalr	-1594(ra) # 4928 <sbrk>
    1f6a:	84aa                	mv	s1,a0
  c = sbrk(-(sbrk(0) - oldbrk));
    1f6c:	4501                	li	a0,0
    1f6e:	00003097          	auipc	ra,0x3
    1f72:	9ba080e7          	jalr	-1606(ra) # 4928 <sbrk>
    1f76:	40a9053b          	subw	a0,s2,a0
    1f7a:	00003097          	auipc	ra,0x3
    1f7e:	9ae080e7          	jalr	-1618(ra) # 4928 <sbrk>
  if(c != a){
    1f82:	0aa49263          	bne	s1,a0,2026 <sbrkmuch+0x198>
}
    1f86:	70a2                	ld	ra,40(sp)
    1f88:	7402                	ld	s0,32(sp)
    1f8a:	64e2                	ld	s1,24(sp)
    1f8c:	6942                	ld	s2,16(sp)
    1f8e:	69a2                	ld	s3,8(sp)
    1f90:	6a02                	ld	s4,0(sp)
    1f92:	6145                	addi	sp,sp,48
    1f94:	8082                	ret
    printf("%s: sbrk test failed to grow big address space; enough phys mem?\n", s);
    1f96:	85ce                	mv	a1,s3
    1f98:	00004517          	auipc	a0,0x4
    1f9c:	d2850513          	addi	a0,a0,-728 # 5cc0 <malloc+0xf12>
    1fa0:	00003097          	auipc	ra,0x3
    1fa4:	d28080e7          	jalr	-728(ra) # 4cc8 <printf>
    exit(1);
    1fa8:	4505                	li	a0,1
    1faa:	00003097          	auipc	ra,0x3
    1fae:	90e080e7          	jalr	-1778(ra) # 48b8 <exit>
    printf("%s: sbrk could not deallocate\n", s);
    1fb2:	85ce                	mv	a1,s3
    1fb4:	00004517          	auipc	a0,0x4
    1fb8:	d5450513          	addi	a0,a0,-684 # 5d08 <malloc+0xf5a>
    1fbc:	00003097          	auipc	ra,0x3
    1fc0:	d0c080e7          	jalr	-756(ra) # 4cc8 <printf>
    exit(1);
    1fc4:	4505                	li	a0,1
    1fc6:	00003097          	auipc	ra,0x3
    1fca:	8f2080e7          	jalr	-1806(ra) # 48b8 <exit>
    printf("%s: sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    1fce:	862a                	mv	a2,a0
    1fd0:	85a6                	mv	a1,s1
    1fd2:	00004517          	auipc	a0,0x4
    1fd6:	d5650513          	addi	a0,a0,-682 # 5d28 <malloc+0xf7a>
    1fda:	00003097          	auipc	ra,0x3
    1fde:	cee080e7          	jalr	-786(ra) # 4cc8 <printf>
    exit(1);
    1fe2:	4505                	li	a0,1
    1fe4:	00003097          	auipc	ra,0x3
    1fe8:	8d4080e7          	jalr	-1836(ra) # 48b8 <exit>
    printf("%s: sbrk re-allocation failed, a %x c %x\n", a, c);
    1fec:	8652                	mv	a2,s4
    1fee:	85a6                	mv	a1,s1
    1ff0:	00004517          	auipc	a0,0x4
    1ff4:	d7850513          	addi	a0,a0,-648 # 5d68 <malloc+0xfba>
    1ff8:	00003097          	auipc	ra,0x3
    1ffc:	cd0080e7          	jalr	-816(ra) # 4cc8 <printf>
    exit(1);
    2000:	4505                	li	a0,1
    2002:	00003097          	auipc	ra,0x3
    2006:	8b6080e7          	jalr	-1866(ra) # 48b8 <exit>
    printf("%s: sbrk de-allocation didn't really deallocate\n", s);
    200a:	85ce                	mv	a1,s3
    200c:	00004517          	auipc	a0,0x4
    2010:	d8c50513          	addi	a0,a0,-628 # 5d98 <malloc+0xfea>
    2014:	00003097          	auipc	ra,0x3
    2018:	cb4080e7          	jalr	-844(ra) # 4cc8 <printf>
    exit(1);
    201c:	4505                	li	a0,1
    201e:	00003097          	auipc	ra,0x3
    2022:	89a080e7          	jalr	-1894(ra) # 48b8 <exit>
    printf("%s: sbrk downsize failed, a %x c %x\n", a, c);
    2026:	862a                	mv	a2,a0
    2028:	85a6                	mv	a1,s1
    202a:	00004517          	auipc	a0,0x4
    202e:	da650513          	addi	a0,a0,-602 # 5dd0 <malloc+0x1022>
    2032:	00003097          	auipc	ra,0x3
    2036:	c96080e7          	jalr	-874(ra) # 4cc8 <printf>
    exit(1);
    203a:	4505                	li	a0,1
    203c:	00003097          	auipc	ra,0x3
    2040:	87c080e7          	jalr	-1924(ra) # 48b8 <exit>

0000000000002044 <sbrkarg>:
{
    2044:	7179                	addi	sp,sp,-48
    2046:	f406                	sd	ra,40(sp)
    2048:	f022                	sd	s0,32(sp)
    204a:	ec26                	sd	s1,24(sp)
    204c:	e84a                	sd	s2,16(sp)
    204e:	e44e                	sd	s3,8(sp)
    2050:	1800                	addi	s0,sp,48
    2052:	89aa                	mv	s3,a0
  a = sbrk(PGSIZE);
    2054:	6505                	lui	a0,0x1
    2056:	00003097          	auipc	ra,0x3
    205a:	8d2080e7          	jalr	-1838(ra) # 4928 <sbrk>
    205e:	892a                	mv	s2,a0
  fd = open("sbrk", O_CREATE|O_WRONLY);
    2060:	20100593          	li	a1,513
    2064:	00004517          	auipc	a0,0x4
    2068:	d9450513          	addi	a0,a0,-620 # 5df8 <malloc+0x104a>
    206c:	00003097          	auipc	ra,0x3
    2070:	88c080e7          	jalr	-1908(ra) # 48f8 <open>
    2074:	84aa                	mv	s1,a0
  remove("sbrk");
    2076:	00004517          	auipc	a0,0x4
    207a:	d8250513          	addi	a0,a0,-638 # 5df8 <malloc+0x104a>
    207e:	00003097          	auipc	ra,0x3
    2082:	8e2080e7          	jalr	-1822(ra) # 4960 <remove>
  if(fd < 0)  {
    2086:	0404c163          	bltz	s1,20c8 <sbrkarg+0x84>
  if ((n = write(fd, a, PGSIZE)) < 0) {
    208a:	6605                	lui	a2,0x1
    208c:	85ca                	mv	a1,s2
    208e:	8526                	mv	a0,s1
    2090:	00003097          	auipc	ra,0x3
    2094:	848080e7          	jalr	-1976(ra) # 48d8 <write>
    2098:	04054663          	bltz	a0,20e4 <sbrkarg+0xa0>
  close(fd);
    209c:	8526                	mv	a0,s1
    209e:	00003097          	auipc	ra,0x3
    20a2:	842080e7          	jalr	-1982(ra) # 48e0 <close>
  a = sbrk(PGSIZE);
    20a6:	6505                	lui	a0,0x1
    20a8:	00003097          	auipc	ra,0x3
    20ac:	880080e7          	jalr	-1920(ra) # 4928 <sbrk>
  if(pipe((int *) a) != 0){
    20b0:	00003097          	auipc	ra,0x3
    20b4:	818080e7          	jalr	-2024(ra) # 48c8 <pipe>
    20b8:	e521                	bnez	a0,2100 <sbrkarg+0xbc>
}
    20ba:	70a2                	ld	ra,40(sp)
    20bc:	7402                	ld	s0,32(sp)
    20be:	64e2                	ld	s1,24(sp)
    20c0:	6942                	ld	s2,16(sp)
    20c2:	69a2                	ld	s3,8(sp)
    20c4:	6145                	addi	sp,sp,48
    20c6:	8082                	ret
    printf("%s: open sbrk failed\n", s);
    20c8:	85ce                	mv	a1,s3
    20ca:	00004517          	auipc	a0,0x4
    20ce:	d3650513          	addi	a0,a0,-714 # 5e00 <malloc+0x1052>
    20d2:	00003097          	auipc	ra,0x3
    20d6:	bf6080e7          	jalr	-1034(ra) # 4cc8 <printf>
    exit(1);
    20da:	4505                	li	a0,1
    20dc:	00002097          	auipc	ra,0x2
    20e0:	7dc080e7          	jalr	2012(ra) # 48b8 <exit>
    printf("%s: write sbrk failed\n", s);
    20e4:	85ce                	mv	a1,s3
    20e6:	00004517          	auipc	a0,0x4
    20ea:	d3250513          	addi	a0,a0,-718 # 5e18 <malloc+0x106a>
    20ee:	00003097          	auipc	ra,0x3
    20f2:	bda080e7          	jalr	-1062(ra) # 4cc8 <printf>
    exit(1);
    20f6:	4505                	li	a0,1
    20f8:	00002097          	auipc	ra,0x2
    20fc:	7c0080e7          	jalr	1984(ra) # 48b8 <exit>
    printf("%s: pipe() failed\n", s);
    2100:	85ce                	mv	a1,s3
    2102:	00004517          	auipc	a0,0x4
    2106:	84650513          	addi	a0,a0,-1978 # 5948 <malloc+0xb9a>
    210a:	00003097          	auipc	ra,0x3
    210e:	bbe080e7          	jalr	-1090(ra) # 4cc8 <printf>
    exit(1);
    2112:	4505                	li	a0,1
    2114:	00002097          	auipc	ra,0x2
    2118:	7a4080e7          	jalr	1956(ra) # 48b8 <exit>

000000000000211c <argptest>:
{
    211c:	1101                	addi	sp,sp,-32
    211e:	ec06                	sd	ra,24(sp)
    2120:	e822                	sd	s0,16(sp)
    2122:	e426                	sd	s1,8(sp)
    2124:	e04a                	sd	s2,0(sp)
    2126:	1000                	addi	s0,sp,32
    2128:	892a                	mv	s2,a0
  fd = open("init", O_RDONLY);
    212a:	4581                	li	a1,0
    212c:	00004517          	auipc	a0,0x4
    2130:	d0450513          	addi	a0,a0,-764 # 5e30 <malloc+0x1082>
    2134:	00002097          	auipc	ra,0x2
    2138:	7c4080e7          	jalr	1988(ra) # 48f8 <open>
  if (fd < 0) {
    213c:	02054b63          	bltz	a0,2172 <argptest+0x56>
    2140:	84aa                	mv	s1,a0
  read(fd, sbrk(0) - 1, -1);
    2142:	4501                	li	a0,0
    2144:	00002097          	auipc	ra,0x2
    2148:	7e4080e7          	jalr	2020(ra) # 4928 <sbrk>
    214c:	567d                	li	a2,-1
    214e:	fff50593          	addi	a1,a0,-1
    2152:	8526                	mv	a0,s1
    2154:	00002097          	auipc	ra,0x2
    2158:	77c080e7          	jalr	1916(ra) # 48d0 <read>
  close(fd);
    215c:	8526                	mv	a0,s1
    215e:	00002097          	auipc	ra,0x2
    2162:	782080e7          	jalr	1922(ra) # 48e0 <close>
}
    2166:	60e2                	ld	ra,24(sp)
    2168:	6442                	ld	s0,16(sp)
    216a:	64a2                	ld	s1,8(sp)
    216c:	6902                	ld	s2,0(sp)
    216e:	6105                	addi	sp,sp,32
    2170:	8082                	ret
    printf("%s: open failed\n", s);
    2172:	85ca                	mv	a1,s2
    2174:	00003517          	auipc	a0,0x3
    2178:	6e450513          	addi	a0,a0,1764 # 5858 <malloc+0xaaa>
    217c:	00003097          	auipc	ra,0x3
    2180:	b4c080e7          	jalr	-1204(ra) # 4cc8 <printf>
    exit(1);
    2184:	4505                	li	a0,1
    2186:	00002097          	auipc	ra,0x2
    218a:	732080e7          	jalr	1842(ra) # 48b8 <exit>

000000000000218e <sbrkbugs>:
{
    218e:	1141                	addi	sp,sp,-16
    2190:	e406                	sd	ra,8(sp)
    2192:	e022                	sd	s0,0(sp)
    2194:	0800                	addi	s0,sp,16
  int pid = fork();
    2196:	00002097          	auipc	ra,0x2
    219a:	71a080e7          	jalr	1818(ra) # 48b0 <fork>
  if(pid < 0){
    219e:	02054263          	bltz	a0,21c2 <sbrkbugs+0x34>
  if(pid == 0){
    21a2:	ed0d                	bnez	a0,21dc <sbrkbugs+0x4e>
    int sz = (uint64) sbrk(0);
    21a4:	00002097          	auipc	ra,0x2
    21a8:	784080e7          	jalr	1924(ra) # 4928 <sbrk>
    sbrk(-sz);
    21ac:	40a0053b          	negw	a0,a0
    21b0:	00002097          	auipc	ra,0x2
    21b4:	778080e7          	jalr	1912(ra) # 4928 <sbrk>
    exit(0);
    21b8:	4501                	li	a0,0
    21ba:	00002097          	auipc	ra,0x2
    21be:	6fe080e7          	jalr	1790(ra) # 48b8 <exit>
    printf("fork failed\n");
    21c2:	00004517          	auipc	a0,0x4
    21c6:	9fe50513          	addi	a0,a0,-1538 # 5bc0 <malloc+0xe12>
    21ca:	00003097          	auipc	ra,0x3
    21ce:	afe080e7          	jalr	-1282(ra) # 4cc8 <printf>
    exit(1);
    21d2:	4505                	li	a0,1
    21d4:	00002097          	auipc	ra,0x2
    21d8:	6e4080e7          	jalr	1764(ra) # 48b8 <exit>
  wait(0);
    21dc:	4501                	li	a0,0
    21de:	00002097          	auipc	ra,0x2
    21e2:	6e2080e7          	jalr	1762(ra) # 48c0 <wait>
  pid = fork();
    21e6:	00002097          	auipc	ra,0x2
    21ea:	6ca080e7          	jalr	1738(ra) # 48b0 <fork>
  if(pid < 0){
    21ee:	02054563          	bltz	a0,2218 <sbrkbugs+0x8a>
  if(pid == 0){
    21f2:	e121                	bnez	a0,2232 <sbrkbugs+0xa4>
    int sz = (uint64) sbrk(0);
    21f4:	00002097          	auipc	ra,0x2
    21f8:	734080e7          	jalr	1844(ra) # 4928 <sbrk>
    sbrk(-(sz - 3500));
    21fc:	6785                	lui	a5,0x1
    21fe:	dac7879b          	addiw	a5,a5,-596
    2202:	40a7853b          	subw	a0,a5,a0
    2206:	00002097          	auipc	ra,0x2
    220a:	722080e7          	jalr	1826(ra) # 4928 <sbrk>
    exit(0);
    220e:	4501                	li	a0,0
    2210:	00002097          	auipc	ra,0x2
    2214:	6a8080e7          	jalr	1704(ra) # 48b8 <exit>
    printf("fork failed\n");
    2218:	00004517          	auipc	a0,0x4
    221c:	9a850513          	addi	a0,a0,-1624 # 5bc0 <malloc+0xe12>
    2220:	00003097          	auipc	ra,0x3
    2224:	aa8080e7          	jalr	-1368(ra) # 4cc8 <printf>
    exit(1);
    2228:	4505                	li	a0,1
    222a:	00002097          	auipc	ra,0x2
    222e:	68e080e7          	jalr	1678(ra) # 48b8 <exit>
  wait(0);
    2232:	4501                	li	a0,0
    2234:	00002097          	auipc	ra,0x2
    2238:	68c080e7          	jalr	1676(ra) # 48c0 <wait>
  pid = fork();
    223c:	00002097          	auipc	ra,0x2
    2240:	674080e7          	jalr	1652(ra) # 48b0 <fork>
  if(pid < 0){
    2244:	02054a63          	bltz	a0,2278 <sbrkbugs+0xea>
  if(pid == 0){
    2248:	e529                	bnez	a0,2292 <sbrkbugs+0x104>
    sbrk((10*4096 + 2048) - (uint64)sbrk(0));
    224a:	00002097          	auipc	ra,0x2
    224e:	6de080e7          	jalr	1758(ra) # 4928 <sbrk>
    2252:	67ad                	lui	a5,0xb
    2254:	8007879b          	addiw	a5,a5,-2048
    2258:	40a7853b          	subw	a0,a5,a0
    225c:	00002097          	auipc	ra,0x2
    2260:	6cc080e7          	jalr	1740(ra) # 4928 <sbrk>
    sbrk(-10);
    2264:	5559                	li	a0,-10
    2266:	00002097          	auipc	ra,0x2
    226a:	6c2080e7          	jalr	1730(ra) # 4928 <sbrk>
    exit(0);
    226e:	4501                	li	a0,0
    2270:	00002097          	auipc	ra,0x2
    2274:	648080e7          	jalr	1608(ra) # 48b8 <exit>
    printf("fork failed\n");
    2278:	00004517          	auipc	a0,0x4
    227c:	94850513          	addi	a0,a0,-1720 # 5bc0 <malloc+0xe12>
    2280:	00003097          	auipc	ra,0x3
    2284:	a48080e7          	jalr	-1464(ra) # 4cc8 <printf>
    exit(1);
    2288:	4505                	li	a0,1
    228a:	00002097          	auipc	ra,0x2
    228e:	62e080e7          	jalr	1582(ra) # 48b8 <exit>
  wait(0);
    2292:	4501                	li	a0,0
    2294:	00002097          	auipc	ra,0x2
    2298:	62c080e7          	jalr	1580(ra) # 48c0 <wait>
  exit(0);
    229c:	4501                	li	a0,0
    229e:	00002097          	auipc	ra,0x2
    22a2:	61a080e7          	jalr	1562(ra) # 48b8 <exit>

00000000000022a6 <execout>:
// test the exec() code that cleans up if it runs out
// of memory. it's really a test that such a condition
// doesn't cause a panic.
void
execout(char *s)
{
    22a6:	715d                	addi	sp,sp,-80
    22a8:	e486                	sd	ra,72(sp)
    22aa:	e0a2                	sd	s0,64(sp)
    22ac:	fc26                	sd	s1,56(sp)
    22ae:	f84a                	sd	s2,48(sp)
    22b0:	f44e                	sd	s3,40(sp)
    22b2:	f052                	sd	s4,32(sp)
    22b4:	0880                	addi	s0,sp,80
  for(int avail = 0; avail < 15; avail++){
    22b6:	4901                	li	s2,0
    22b8:	49bd                	li	s3,15
    int pid = fork();
    22ba:	00002097          	auipc	ra,0x2
    22be:	5f6080e7          	jalr	1526(ra) # 48b0 <fork>
    22c2:	84aa                	mv	s1,a0
    if(pid < 0){
    22c4:	02054063          	bltz	a0,22e4 <execout+0x3e>
      printf("fork failed\n");
      exit(1);
    } else if(pid == 0){
    22c8:	c91d                	beqz	a0,22fe <execout+0x58>
      close(1);
      char *args[] = { "echo", "x", 0 };
      exec("echo", args);
      exit(0);
    } else {
      wait((int*)0);
    22ca:	4501                	li	a0,0
    22cc:	00002097          	auipc	ra,0x2
    22d0:	5f4080e7          	jalr	1524(ra) # 48c0 <wait>
  for(int avail = 0; avail < 15; avail++){
    22d4:	2905                	addiw	s2,s2,1
    22d6:	ff3912e3          	bne	s2,s3,22ba <execout+0x14>
    }
  }

  exit(0);
    22da:	4501                	li	a0,0
    22dc:	00002097          	auipc	ra,0x2
    22e0:	5dc080e7          	jalr	1500(ra) # 48b8 <exit>
      printf("fork failed\n");
    22e4:	00004517          	auipc	a0,0x4
    22e8:	8dc50513          	addi	a0,a0,-1828 # 5bc0 <malloc+0xe12>
    22ec:	00003097          	auipc	ra,0x3
    22f0:	9dc080e7          	jalr	-1572(ra) # 4cc8 <printf>
      exit(1);
    22f4:	4505                	li	a0,1
    22f6:	00002097          	auipc	ra,0x2
    22fa:	5c2080e7          	jalr	1474(ra) # 48b8 <exit>
        if(a == 0xffffffffffffffffLL)
    22fe:	59fd                	li	s3,-1
        *(char*)(a + 4096 - 1) = 1;
    2300:	4a05                	li	s4,1
        uint64 a = (uint64) sbrk(4096);
    2302:	6505                	lui	a0,0x1
    2304:	00002097          	auipc	ra,0x2
    2308:	624080e7          	jalr	1572(ra) # 4928 <sbrk>
        if(a == 0xffffffffffffffffLL)
    230c:	01350763          	beq	a0,s3,231a <execout+0x74>
        *(char*)(a + 4096 - 1) = 1;
    2310:	6785                	lui	a5,0x1
    2312:	953e                	add	a0,a0,a5
    2314:	ff450fa3          	sb	s4,-1(a0) # fff <copyinstr2+0xdb>
      while(1){
    2318:	b7ed                	j	2302 <execout+0x5c>
      for(int i = 0; i < avail; i++)
    231a:	01205a63          	blez	s2,232e <execout+0x88>
        sbrk(-4096);
    231e:	757d                	lui	a0,0xfffff
    2320:	00002097          	auipc	ra,0x2
    2324:	608080e7          	jalr	1544(ra) # 4928 <sbrk>
      for(int i = 0; i < avail; i++)
    2328:	2485                	addiw	s1,s1,1
    232a:	ff249ae3          	bne	s1,s2,231e <execout+0x78>
      close(1);
    232e:	4505                	li	a0,1
    2330:	00002097          	auipc	ra,0x2
    2334:	5b0080e7          	jalr	1456(ra) # 48e0 <close>
      char *args[] = { "echo", "x", 0 };
    2338:	00003517          	auipc	a0,0x3
    233c:	e9850513          	addi	a0,a0,-360 # 51d0 <malloc+0x422>
    2340:	faa43c23          	sd	a0,-72(s0)
    2344:	00003797          	auipc	a5,0x3
    2348:	efc78793          	addi	a5,a5,-260 # 5240 <malloc+0x492>
    234c:	fcf43023          	sd	a5,-64(s0)
    2350:	fc043423          	sd	zero,-56(s0)
      exec("echo", args);
    2354:	fb840593          	addi	a1,s0,-72
    2358:	00002097          	auipc	ra,0x2
    235c:	598080e7          	jalr	1432(ra) # 48f0 <exec>
      exit(0);
    2360:	4501                	li	a0,0
    2362:	00002097          	auipc	ra,0x2
    2366:	556080e7          	jalr	1366(ra) # 48b8 <exit>

000000000000236a <iputtest>:
{
    236a:	1101                	addi	sp,sp,-32
    236c:	ec06                	sd	ra,24(sp)
    236e:	e822                	sd	s0,16(sp)
    2370:	e426                	sd	s1,8(sp)
    2372:	1000                	addi	s0,sp,32
    2374:	84aa                	mv	s1,a0
  if(mkdir("iputdir") < 0){
    2376:	00004517          	auipc	a0,0x4
    237a:	ac250513          	addi	a0,a0,-1342 # 5e38 <malloc+0x108a>
    237e:	00002097          	auipc	ra,0x2
    2382:	58a080e7          	jalr	1418(ra) # 4908 <mkdir>
    2386:	04054563          	bltz	a0,23d0 <iputtest+0x66>
  if(chdir("iputdir") < 0){
    238a:	00004517          	auipc	a0,0x4
    238e:	aae50513          	addi	a0,a0,-1362 # 5e38 <malloc+0x108a>
    2392:	00002097          	auipc	ra,0x2
    2396:	57e080e7          	jalr	1406(ra) # 4910 <chdir>
    239a:	04054963          	bltz	a0,23ec <iputtest+0x82>
  if(remove("../iputdir") < 0){
    239e:	00004517          	auipc	a0,0x4
    23a2:	ada50513          	addi	a0,a0,-1318 # 5e78 <malloc+0x10ca>
    23a6:	00002097          	auipc	ra,0x2
    23aa:	5ba080e7          	jalr	1466(ra) # 4960 <remove>
    23ae:	04054d63          	bltz	a0,2408 <iputtest+0x9e>
  if(chdir("/") < 0){
    23b2:	00004517          	auipc	a0,0x4
    23b6:	af650513          	addi	a0,a0,-1290 # 5ea8 <malloc+0x10fa>
    23ba:	00002097          	auipc	ra,0x2
    23be:	556080e7          	jalr	1366(ra) # 4910 <chdir>
    23c2:	06054163          	bltz	a0,2424 <iputtest+0xba>
}
    23c6:	60e2                	ld	ra,24(sp)
    23c8:	6442                	ld	s0,16(sp)
    23ca:	64a2                	ld	s1,8(sp)
    23cc:	6105                	addi	sp,sp,32
    23ce:	8082                	ret
    printf("%s: mkdir failed\n", s);
    23d0:	85a6                	mv	a1,s1
    23d2:	00004517          	auipc	a0,0x4
    23d6:	a6e50513          	addi	a0,a0,-1426 # 5e40 <malloc+0x1092>
    23da:	00003097          	auipc	ra,0x3
    23de:	8ee080e7          	jalr	-1810(ra) # 4cc8 <printf>
    exit(1);
    23e2:	4505                	li	a0,1
    23e4:	00002097          	auipc	ra,0x2
    23e8:	4d4080e7          	jalr	1236(ra) # 48b8 <exit>
    printf("%s: chdir iputdir failed\n", s);
    23ec:	85a6                	mv	a1,s1
    23ee:	00004517          	auipc	a0,0x4
    23f2:	a6a50513          	addi	a0,a0,-1430 # 5e58 <malloc+0x10aa>
    23f6:	00003097          	auipc	ra,0x3
    23fa:	8d2080e7          	jalr	-1838(ra) # 4cc8 <printf>
    exit(1);
    23fe:	4505                	li	a0,1
    2400:	00002097          	auipc	ra,0x2
    2404:	4b8080e7          	jalr	1208(ra) # 48b8 <exit>
    printf("%s: remove ../iputdir failed\n", s);
    2408:	85a6                	mv	a1,s1
    240a:	00004517          	auipc	a0,0x4
    240e:	a7e50513          	addi	a0,a0,-1410 # 5e88 <malloc+0x10da>
    2412:	00003097          	auipc	ra,0x3
    2416:	8b6080e7          	jalr	-1866(ra) # 4cc8 <printf>
    exit(1);
    241a:	4505                	li	a0,1
    241c:	00002097          	auipc	ra,0x2
    2420:	49c080e7          	jalr	1180(ra) # 48b8 <exit>
    printf("%s: chdir / failed\n", s);
    2424:	85a6                	mv	a1,s1
    2426:	00004517          	auipc	a0,0x4
    242a:	a8a50513          	addi	a0,a0,-1398 # 5eb0 <malloc+0x1102>
    242e:	00003097          	auipc	ra,0x3
    2432:	89a080e7          	jalr	-1894(ra) # 4cc8 <printf>
    exit(1);
    2436:	4505                	li	a0,1
    2438:	00002097          	auipc	ra,0x2
    243c:	480080e7          	jalr	1152(ra) # 48b8 <exit>

0000000000002440 <exitiputtest>:
{
    2440:	7179                	addi	sp,sp,-48
    2442:	f406                	sd	ra,40(sp)
    2444:	f022                	sd	s0,32(sp)
    2446:	ec26                	sd	s1,24(sp)
    2448:	1800                	addi	s0,sp,48
    244a:	84aa                	mv	s1,a0
  pid = fork();
    244c:	00002097          	auipc	ra,0x2
    2450:	464080e7          	jalr	1124(ra) # 48b0 <fork>
  if(pid < 0){
    2454:	04054663          	bltz	a0,24a0 <exitiputtest+0x60>
  if(pid == 0){
    2458:	ed45                	bnez	a0,2510 <exitiputtest+0xd0>
    if(mkdir("iputdir") < 0){
    245a:	00004517          	auipc	a0,0x4
    245e:	9de50513          	addi	a0,a0,-1570 # 5e38 <malloc+0x108a>
    2462:	00002097          	auipc	ra,0x2
    2466:	4a6080e7          	jalr	1190(ra) # 4908 <mkdir>
    246a:	04054963          	bltz	a0,24bc <exitiputtest+0x7c>
    if(chdir("iputdir") < 0){
    246e:	00004517          	auipc	a0,0x4
    2472:	9ca50513          	addi	a0,a0,-1590 # 5e38 <malloc+0x108a>
    2476:	00002097          	auipc	ra,0x2
    247a:	49a080e7          	jalr	1178(ra) # 4910 <chdir>
    247e:	04054d63          	bltz	a0,24d8 <exitiputtest+0x98>
    if(remove("../iputdir") < 0){
    2482:	00004517          	auipc	a0,0x4
    2486:	9f650513          	addi	a0,a0,-1546 # 5e78 <malloc+0x10ca>
    248a:	00002097          	auipc	ra,0x2
    248e:	4d6080e7          	jalr	1238(ra) # 4960 <remove>
    2492:	06054163          	bltz	a0,24f4 <exitiputtest+0xb4>
    exit(0);
    2496:	4501                	li	a0,0
    2498:	00002097          	auipc	ra,0x2
    249c:	420080e7          	jalr	1056(ra) # 48b8 <exit>
    printf("%s: fork failed\n", s);
    24a0:	85a6                	mv	a1,s1
    24a2:	00003517          	auipc	a0,0x3
    24a6:	39e50513          	addi	a0,a0,926 # 5840 <malloc+0xa92>
    24aa:	00003097          	auipc	ra,0x3
    24ae:	81e080e7          	jalr	-2018(ra) # 4cc8 <printf>
    exit(1);
    24b2:	4505                	li	a0,1
    24b4:	00002097          	auipc	ra,0x2
    24b8:	404080e7          	jalr	1028(ra) # 48b8 <exit>
      printf("%s: mkdir failed\n", s);
    24bc:	85a6                	mv	a1,s1
    24be:	00004517          	auipc	a0,0x4
    24c2:	98250513          	addi	a0,a0,-1662 # 5e40 <malloc+0x1092>
    24c6:	00003097          	auipc	ra,0x3
    24ca:	802080e7          	jalr	-2046(ra) # 4cc8 <printf>
      exit(1);
    24ce:	4505                	li	a0,1
    24d0:	00002097          	auipc	ra,0x2
    24d4:	3e8080e7          	jalr	1000(ra) # 48b8 <exit>
      printf("%s: child chdir failed\n", s);
    24d8:	85a6                	mv	a1,s1
    24da:	00004517          	auipc	a0,0x4
    24de:	9ee50513          	addi	a0,a0,-1554 # 5ec8 <malloc+0x111a>
    24e2:	00002097          	auipc	ra,0x2
    24e6:	7e6080e7          	jalr	2022(ra) # 4cc8 <printf>
      exit(1);
    24ea:	4505                	li	a0,1
    24ec:	00002097          	auipc	ra,0x2
    24f0:	3cc080e7          	jalr	972(ra) # 48b8 <exit>
      printf("%s: remove ../iputdir failed\n", s);
    24f4:	85a6                	mv	a1,s1
    24f6:	00004517          	auipc	a0,0x4
    24fa:	99250513          	addi	a0,a0,-1646 # 5e88 <malloc+0x10da>
    24fe:	00002097          	auipc	ra,0x2
    2502:	7ca080e7          	jalr	1994(ra) # 4cc8 <printf>
      exit(1);
    2506:	4505                	li	a0,1
    2508:	00002097          	auipc	ra,0x2
    250c:	3b0080e7          	jalr	944(ra) # 48b8 <exit>
  wait(&xstatus);
    2510:	fdc40513          	addi	a0,s0,-36
    2514:	00002097          	auipc	ra,0x2
    2518:	3ac080e7          	jalr	940(ra) # 48c0 <wait>
  exit(xstatus);
    251c:	fdc42503          	lw	a0,-36(s0)
    2520:	00002097          	auipc	ra,0x2
    2524:	398080e7          	jalr	920(ra) # 48b8 <exit>

0000000000002528 <subdir>:
{
    2528:	1101                	addi	sp,sp,-32
    252a:	ec06                	sd	ra,24(sp)
    252c:	e822                	sd	s0,16(sp)
    252e:	e426                	sd	s1,8(sp)
    2530:	e04a                	sd	s2,0(sp)
    2532:	1000                	addi	s0,sp,32
    2534:	892a                	mv	s2,a0
  remove("ff");
    2536:	00004517          	auipc	a0,0x4
    253a:	9aa50513          	addi	a0,a0,-1622 # 5ee0 <malloc+0x1132>
    253e:	00002097          	auipc	ra,0x2
    2542:	422080e7          	jalr	1058(ra) # 4960 <remove>
  if(mkdir("dd") != 0){
    2546:	00004517          	auipc	a0,0x4
    254a:	9a250513          	addi	a0,a0,-1630 # 5ee8 <malloc+0x113a>
    254e:	00002097          	auipc	ra,0x2
    2552:	3ba080e7          	jalr	954(ra) # 4908 <mkdir>
    2556:	24051363          	bnez	a0,279c <subdir+0x274>
  fd = open("dd/ff", O_CREATE | O_RDWR);
    255a:	20200593          	li	a1,514
    255e:	00004517          	auipc	a0,0x4
    2562:	9aa50513          	addi	a0,a0,-1622 # 5f08 <malloc+0x115a>
    2566:	00002097          	auipc	ra,0x2
    256a:	392080e7          	jalr	914(ra) # 48f8 <open>
    256e:	84aa                	mv	s1,a0
  if(fd < 0){
    2570:	24054463          	bltz	a0,27b8 <subdir+0x290>
  write(fd, "ff", 2);
    2574:	4609                	li	a2,2
    2576:	00004597          	auipc	a1,0x4
    257a:	96a58593          	addi	a1,a1,-1686 # 5ee0 <malloc+0x1132>
    257e:	00002097          	auipc	ra,0x2
    2582:	35a080e7          	jalr	858(ra) # 48d8 <write>
  close(fd);
    2586:	8526                	mv	a0,s1
    2588:	00002097          	auipc	ra,0x2
    258c:	358080e7          	jalr	856(ra) # 48e0 <close>
  if(remove("dd") >= 0){
    2590:	00004517          	auipc	a0,0x4
    2594:	95850513          	addi	a0,a0,-1704 # 5ee8 <malloc+0x113a>
    2598:	00002097          	auipc	ra,0x2
    259c:	3c8080e7          	jalr	968(ra) # 4960 <remove>
    25a0:	22055a63          	bgez	a0,27d4 <subdir+0x2ac>
  if(mkdir("/dd/dd") != 0){
    25a4:	00004517          	auipc	a0,0x4
    25a8:	9bc50513          	addi	a0,a0,-1604 # 5f60 <malloc+0x11b2>
    25ac:	00002097          	auipc	ra,0x2
    25b0:	35c080e7          	jalr	860(ra) # 4908 <mkdir>
    25b4:	22051e63          	bnez	a0,27f0 <subdir+0x2c8>
  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    25b8:	20200593          	li	a1,514
    25bc:	00004517          	auipc	a0,0x4
    25c0:	9cc50513          	addi	a0,a0,-1588 # 5f88 <malloc+0x11da>
    25c4:	00002097          	auipc	ra,0x2
    25c8:	334080e7          	jalr	820(ra) # 48f8 <open>
    25cc:	84aa                	mv	s1,a0
  if(fd < 0){
    25ce:	22054f63          	bltz	a0,280c <subdir+0x2e4>
  write(fd, "FF", 2);
    25d2:	4609                	li	a2,2
    25d4:	00004597          	auipc	a1,0x4
    25d8:	9e458593          	addi	a1,a1,-1564 # 5fb8 <malloc+0x120a>
    25dc:	00002097          	auipc	ra,0x2
    25e0:	2fc080e7          	jalr	764(ra) # 48d8 <write>
  close(fd);
    25e4:	8526                	mv	a0,s1
    25e6:	00002097          	auipc	ra,0x2
    25ea:	2fa080e7          	jalr	762(ra) # 48e0 <close>
  fd = open("dd/dd/../ff", 0);
    25ee:	4581                	li	a1,0
    25f0:	00004517          	auipc	a0,0x4
    25f4:	9d050513          	addi	a0,a0,-1584 # 5fc0 <malloc+0x1212>
    25f8:	00002097          	auipc	ra,0x2
    25fc:	300080e7          	jalr	768(ra) # 48f8 <open>
    2600:	84aa                	mv	s1,a0
  if(fd < 0){
    2602:	22054363          	bltz	a0,2828 <subdir+0x300>
  cc = read(fd, buf, sizeof(buf));
    2606:	6609                	lui	a2,0x2
    2608:	80060613          	addi	a2,a2,-2048 # 1800 <forkfork+0x68>
    260c:	00008597          	auipc	a1,0x8
    2610:	26458593          	addi	a1,a1,612 # a870 <buf>
    2614:	00002097          	auipc	ra,0x2
    2618:	2bc080e7          	jalr	700(ra) # 48d0 <read>
  if(cc != 2 || buf[0] != 'f'){
    261c:	4789                	li	a5,2
    261e:	22f51363          	bne	a0,a5,2844 <subdir+0x31c>
    2622:	00008717          	auipc	a4,0x8
    2626:	24e74703          	lbu	a4,590(a4) # a870 <buf>
    262a:	06600793          	li	a5,102
    262e:	20f71b63          	bne	a4,a5,2844 <subdir+0x31c>
  close(fd);
    2632:	8526                	mv	a0,s1
    2634:	00002097          	auipc	ra,0x2
    2638:	2ac080e7          	jalr	684(ra) # 48e0 <close>
  if(remove("dd/dd/ff") != 0){
    263c:	00004517          	auipc	a0,0x4
    2640:	94c50513          	addi	a0,a0,-1716 # 5f88 <malloc+0x11da>
    2644:	00002097          	auipc	ra,0x2
    2648:	31c080e7          	jalr	796(ra) # 4960 <remove>
    264c:	20051a63          	bnez	a0,2860 <subdir+0x338>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    2650:	4581                	li	a1,0
    2652:	00004517          	auipc	a0,0x4
    2656:	93650513          	addi	a0,a0,-1738 # 5f88 <malloc+0x11da>
    265a:	00002097          	auipc	ra,0x2
    265e:	29e080e7          	jalr	670(ra) # 48f8 <open>
    2662:	20055d63          	bgez	a0,287c <subdir+0x354>
  if(chdir("dd") != 0){
    2666:	00004517          	auipc	a0,0x4
    266a:	88250513          	addi	a0,a0,-1918 # 5ee8 <malloc+0x113a>
    266e:	00002097          	auipc	ra,0x2
    2672:	2a2080e7          	jalr	674(ra) # 4910 <chdir>
    2676:	22051163          	bnez	a0,2898 <subdir+0x370>
  if(chdir("dd/../../dd") != 0){
    267a:	00004517          	auipc	a0,0x4
    267e:	9f650513          	addi	a0,a0,-1546 # 6070 <malloc+0x12c2>
    2682:	00002097          	auipc	ra,0x2
    2686:	28e080e7          	jalr	654(ra) # 4910 <chdir>
    268a:	22051563          	bnez	a0,28b4 <subdir+0x38c>
  if(chdir("dd/../../../dd") != 0){
    268e:	00004517          	auipc	a0,0x4
    2692:	a1250513          	addi	a0,a0,-1518 # 60a0 <malloc+0x12f2>
    2696:	00002097          	auipc	ra,0x2
    269a:	27a080e7          	jalr	634(ra) # 4910 <chdir>
    269e:	22051963          	bnez	a0,28d0 <subdir+0x3a8>
  if(chdir("./..") != 0){
    26a2:	00004517          	auipc	a0,0x4
    26a6:	a2e50513          	addi	a0,a0,-1490 # 60d0 <malloc+0x1322>
    26aa:	00002097          	auipc	ra,0x2
    26ae:	266080e7          	jalr	614(ra) # 4910 <chdir>
    26b2:	22051d63          	bnez	a0,28ec <subdir+0x3c4>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    26b6:	4581                	li	a1,0
    26b8:	00004517          	auipc	a0,0x4
    26bc:	8d050513          	addi	a0,a0,-1840 # 5f88 <malloc+0x11da>
    26c0:	00002097          	auipc	ra,0x2
    26c4:	238080e7          	jalr	568(ra) # 48f8 <open>
    26c8:	24055063          	bgez	a0,2908 <subdir+0x3e0>
  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    26cc:	20200593          	li	a1,514
    26d0:	00004517          	auipc	a0,0x4
    26d4:	a5050513          	addi	a0,a0,-1456 # 6120 <malloc+0x1372>
    26d8:	00002097          	auipc	ra,0x2
    26dc:	220080e7          	jalr	544(ra) # 48f8 <open>
    26e0:	24055263          	bgez	a0,2924 <subdir+0x3fc>
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    26e4:	20200593          	li	a1,514
    26e8:	00004517          	auipc	a0,0x4
    26ec:	a6850513          	addi	a0,a0,-1432 # 6150 <malloc+0x13a2>
    26f0:	00002097          	auipc	ra,0x2
    26f4:	208080e7          	jalr	520(ra) # 48f8 <open>
    26f8:	24055463          	bgez	a0,2940 <subdir+0x418>
  if(open("dd", O_CREATE) >= 0){
    26fc:	20000593          	li	a1,512
    2700:	00003517          	auipc	a0,0x3
    2704:	7e850513          	addi	a0,a0,2024 # 5ee8 <malloc+0x113a>
    2708:	00002097          	auipc	ra,0x2
    270c:	1f0080e7          	jalr	496(ra) # 48f8 <open>
    2710:	24055663          	bgez	a0,295c <subdir+0x434>
  if(open("dd", O_RDWR) >= 0){
    2714:	4589                	li	a1,2
    2716:	00003517          	auipc	a0,0x3
    271a:	7d250513          	addi	a0,a0,2002 # 5ee8 <malloc+0x113a>
    271e:	00002097          	auipc	ra,0x2
    2722:	1da080e7          	jalr	474(ra) # 48f8 <open>
    2726:	24055963          	bgez	a0,2978 <subdir+0x450>
  if(open("dd", O_WRONLY) >= 0){
    272a:	4585                	li	a1,1
    272c:	00003517          	auipc	a0,0x3
    2730:	7bc50513          	addi	a0,a0,1980 # 5ee8 <malloc+0x113a>
    2734:	00002097          	auipc	ra,0x2
    2738:	1c4080e7          	jalr	452(ra) # 48f8 <open>
    273c:	24055c63          	bgez	a0,2994 <subdir+0x46c>
  if(remove("dd/ff") != 0){
    2740:	00003517          	auipc	a0,0x3
    2744:	7c850513          	addi	a0,a0,1992 # 5f08 <malloc+0x115a>
    2748:	00002097          	auipc	ra,0x2
    274c:	218080e7          	jalr	536(ra) # 4960 <remove>
    2750:	26051063          	bnez	a0,29b0 <subdir+0x488>
  if(remove("dd") == 0){
    2754:	00003517          	auipc	a0,0x3
    2758:	79450513          	addi	a0,a0,1940 # 5ee8 <malloc+0x113a>
    275c:	00002097          	auipc	ra,0x2
    2760:	204080e7          	jalr	516(ra) # 4960 <remove>
    2764:	26050463          	beqz	a0,29cc <subdir+0x4a4>
  if(remove("dd/dd") < 0){
    2768:	00004517          	auipc	a0,0x4
    276c:	ac050513          	addi	a0,a0,-1344 # 6228 <malloc+0x147a>
    2770:	00002097          	auipc	ra,0x2
    2774:	1f0080e7          	jalr	496(ra) # 4960 <remove>
    2778:	26054863          	bltz	a0,29e8 <subdir+0x4c0>
  if(remove("dd") < 0){
    277c:	00003517          	auipc	a0,0x3
    2780:	76c50513          	addi	a0,a0,1900 # 5ee8 <malloc+0x113a>
    2784:	00002097          	auipc	ra,0x2
    2788:	1dc080e7          	jalr	476(ra) # 4960 <remove>
    278c:	26054c63          	bltz	a0,2a04 <subdir+0x4dc>
}
    2790:	60e2                	ld	ra,24(sp)
    2792:	6442                	ld	s0,16(sp)
    2794:	64a2                	ld	s1,8(sp)
    2796:	6902                	ld	s2,0(sp)
    2798:	6105                	addi	sp,sp,32
    279a:	8082                	ret
    printf("%s: mkdir dd failed\n", s);
    279c:	85ca                	mv	a1,s2
    279e:	00003517          	auipc	a0,0x3
    27a2:	75250513          	addi	a0,a0,1874 # 5ef0 <malloc+0x1142>
    27a6:	00002097          	auipc	ra,0x2
    27aa:	522080e7          	jalr	1314(ra) # 4cc8 <printf>
    exit(1);
    27ae:	4505                	li	a0,1
    27b0:	00002097          	auipc	ra,0x2
    27b4:	108080e7          	jalr	264(ra) # 48b8 <exit>
    printf("%s: create dd/ff failed\n", s);
    27b8:	85ca                	mv	a1,s2
    27ba:	00003517          	auipc	a0,0x3
    27be:	75650513          	addi	a0,a0,1878 # 5f10 <malloc+0x1162>
    27c2:	00002097          	auipc	ra,0x2
    27c6:	506080e7          	jalr	1286(ra) # 4cc8 <printf>
    exit(1);
    27ca:	4505                	li	a0,1
    27cc:	00002097          	auipc	ra,0x2
    27d0:	0ec080e7          	jalr	236(ra) # 48b8 <exit>
    printf("%s: remove dd (non-empty dir) succeeded!\n", s);
    27d4:	85ca                	mv	a1,s2
    27d6:	00003517          	auipc	a0,0x3
    27da:	75a50513          	addi	a0,a0,1882 # 5f30 <malloc+0x1182>
    27de:	00002097          	auipc	ra,0x2
    27e2:	4ea080e7          	jalr	1258(ra) # 4cc8 <printf>
    exit(1);
    27e6:	4505                	li	a0,1
    27e8:	00002097          	auipc	ra,0x2
    27ec:	0d0080e7          	jalr	208(ra) # 48b8 <exit>
    printf("subdir mkdir dd/dd failed\n", s);
    27f0:	85ca                	mv	a1,s2
    27f2:	00003517          	auipc	a0,0x3
    27f6:	77650513          	addi	a0,a0,1910 # 5f68 <malloc+0x11ba>
    27fa:	00002097          	auipc	ra,0x2
    27fe:	4ce080e7          	jalr	1230(ra) # 4cc8 <printf>
    exit(1);
    2802:	4505                	li	a0,1
    2804:	00002097          	auipc	ra,0x2
    2808:	0b4080e7          	jalr	180(ra) # 48b8 <exit>
    printf("%s: create dd/dd/ff failed\n", s);
    280c:	85ca                	mv	a1,s2
    280e:	00003517          	auipc	a0,0x3
    2812:	78a50513          	addi	a0,a0,1930 # 5f98 <malloc+0x11ea>
    2816:	00002097          	auipc	ra,0x2
    281a:	4b2080e7          	jalr	1202(ra) # 4cc8 <printf>
    exit(1);
    281e:	4505                	li	a0,1
    2820:	00002097          	auipc	ra,0x2
    2824:	098080e7          	jalr	152(ra) # 48b8 <exit>
    printf("%s: open dd/dd/../ff failed\n", s);
    2828:	85ca                	mv	a1,s2
    282a:	00003517          	auipc	a0,0x3
    282e:	7a650513          	addi	a0,a0,1958 # 5fd0 <malloc+0x1222>
    2832:	00002097          	auipc	ra,0x2
    2836:	496080e7          	jalr	1174(ra) # 4cc8 <printf>
    exit(1);
    283a:	4505                	li	a0,1
    283c:	00002097          	auipc	ra,0x2
    2840:	07c080e7          	jalr	124(ra) # 48b8 <exit>
    printf("%s: dd/dd/../ff wrong content\n", s);
    2844:	85ca                	mv	a1,s2
    2846:	00003517          	auipc	a0,0x3
    284a:	7aa50513          	addi	a0,a0,1962 # 5ff0 <malloc+0x1242>
    284e:	00002097          	auipc	ra,0x2
    2852:	47a080e7          	jalr	1146(ra) # 4cc8 <printf>
    exit(1);
    2856:	4505                	li	a0,1
    2858:	00002097          	auipc	ra,0x2
    285c:	060080e7          	jalr	96(ra) # 48b8 <exit>
    printf("%s: remove dd/dd/ff failed\n", s);
    2860:	85ca                	mv	a1,s2
    2862:	00003517          	auipc	a0,0x3
    2866:	7ae50513          	addi	a0,a0,1966 # 6010 <malloc+0x1262>
    286a:	00002097          	auipc	ra,0x2
    286e:	45e080e7          	jalr	1118(ra) # 4cc8 <printf>
    exit(1);
    2872:	4505                	li	a0,1
    2874:	00002097          	auipc	ra,0x2
    2878:	044080e7          	jalr	68(ra) # 48b8 <exit>
    printf("%s: open (removeed) dd/dd/ff succeeded\n", s);
    287c:	85ca                	mv	a1,s2
    287e:	00003517          	auipc	a0,0x3
    2882:	7b250513          	addi	a0,a0,1970 # 6030 <malloc+0x1282>
    2886:	00002097          	auipc	ra,0x2
    288a:	442080e7          	jalr	1090(ra) # 4cc8 <printf>
    exit(1);
    288e:	4505                	li	a0,1
    2890:	00002097          	auipc	ra,0x2
    2894:	028080e7          	jalr	40(ra) # 48b8 <exit>
    printf("%s: chdir dd failed\n", s);
    2898:	85ca                	mv	a1,s2
    289a:	00003517          	auipc	a0,0x3
    289e:	7be50513          	addi	a0,a0,1982 # 6058 <malloc+0x12aa>
    28a2:	00002097          	auipc	ra,0x2
    28a6:	426080e7          	jalr	1062(ra) # 4cc8 <printf>
    exit(1);
    28aa:	4505                	li	a0,1
    28ac:	00002097          	auipc	ra,0x2
    28b0:	00c080e7          	jalr	12(ra) # 48b8 <exit>
    printf("%s: chdir dd/../../dd failed\n", s);
    28b4:	85ca                	mv	a1,s2
    28b6:	00003517          	auipc	a0,0x3
    28ba:	7ca50513          	addi	a0,a0,1994 # 6080 <malloc+0x12d2>
    28be:	00002097          	auipc	ra,0x2
    28c2:	40a080e7          	jalr	1034(ra) # 4cc8 <printf>
    exit(1);
    28c6:	4505                	li	a0,1
    28c8:	00002097          	auipc	ra,0x2
    28cc:	ff0080e7          	jalr	-16(ra) # 48b8 <exit>
    printf("chdir dd/../../dd failed\n", s);
    28d0:	85ca                	mv	a1,s2
    28d2:	00003517          	auipc	a0,0x3
    28d6:	7de50513          	addi	a0,a0,2014 # 60b0 <malloc+0x1302>
    28da:	00002097          	auipc	ra,0x2
    28de:	3ee080e7          	jalr	1006(ra) # 4cc8 <printf>
    exit(1);
    28e2:	4505                	li	a0,1
    28e4:	00002097          	auipc	ra,0x2
    28e8:	fd4080e7          	jalr	-44(ra) # 48b8 <exit>
    printf("%s: chdir ./.. failed\n", s);
    28ec:	85ca                	mv	a1,s2
    28ee:	00003517          	auipc	a0,0x3
    28f2:	7ea50513          	addi	a0,a0,2026 # 60d8 <malloc+0x132a>
    28f6:	00002097          	auipc	ra,0x2
    28fa:	3d2080e7          	jalr	978(ra) # 4cc8 <printf>
    exit(1);
    28fe:	4505                	li	a0,1
    2900:	00002097          	auipc	ra,0x2
    2904:	fb8080e7          	jalr	-72(ra) # 48b8 <exit>
    printf("%s: open (removeed) dd/dd/ff succeeded!\n", s);
    2908:	85ca                	mv	a1,s2
    290a:	00003517          	auipc	a0,0x3
    290e:	7e650513          	addi	a0,a0,2022 # 60f0 <malloc+0x1342>
    2912:	00002097          	auipc	ra,0x2
    2916:	3b6080e7          	jalr	950(ra) # 4cc8 <printf>
    exit(1);
    291a:	4505                	li	a0,1
    291c:	00002097          	auipc	ra,0x2
    2920:	f9c080e7          	jalr	-100(ra) # 48b8 <exit>
    printf("%s: create dd/ff/ff succeeded!\n", s);
    2924:	85ca                	mv	a1,s2
    2926:	00004517          	auipc	a0,0x4
    292a:	80a50513          	addi	a0,a0,-2038 # 6130 <malloc+0x1382>
    292e:	00002097          	auipc	ra,0x2
    2932:	39a080e7          	jalr	922(ra) # 4cc8 <printf>
    exit(1);
    2936:	4505                	li	a0,1
    2938:	00002097          	auipc	ra,0x2
    293c:	f80080e7          	jalr	-128(ra) # 48b8 <exit>
    printf("%s: create dd/xx/ff succeeded!\n", s);
    2940:	85ca                	mv	a1,s2
    2942:	00004517          	auipc	a0,0x4
    2946:	81e50513          	addi	a0,a0,-2018 # 6160 <malloc+0x13b2>
    294a:	00002097          	auipc	ra,0x2
    294e:	37e080e7          	jalr	894(ra) # 4cc8 <printf>
    exit(1);
    2952:	4505                	li	a0,1
    2954:	00002097          	auipc	ra,0x2
    2958:	f64080e7          	jalr	-156(ra) # 48b8 <exit>
    printf("%s: create dd succeeded!\n", s);
    295c:	85ca                	mv	a1,s2
    295e:	00004517          	auipc	a0,0x4
    2962:	82250513          	addi	a0,a0,-2014 # 6180 <malloc+0x13d2>
    2966:	00002097          	auipc	ra,0x2
    296a:	362080e7          	jalr	866(ra) # 4cc8 <printf>
    exit(1);
    296e:	4505                	li	a0,1
    2970:	00002097          	auipc	ra,0x2
    2974:	f48080e7          	jalr	-184(ra) # 48b8 <exit>
    printf("%s: open dd rdwr succeeded!\n", s);
    2978:	85ca                	mv	a1,s2
    297a:	00004517          	auipc	a0,0x4
    297e:	82650513          	addi	a0,a0,-2010 # 61a0 <malloc+0x13f2>
    2982:	00002097          	auipc	ra,0x2
    2986:	346080e7          	jalr	838(ra) # 4cc8 <printf>
    exit(1);
    298a:	4505                	li	a0,1
    298c:	00002097          	auipc	ra,0x2
    2990:	f2c080e7          	jalr	-212(ra) # 48b8 <exit>
    printf("%s: open dd wronly succeeded!\n", s);
    2994:	85ca                	mv	a1,s2
    2996:	00004517          	auipc	a0,0x4
    299a:	82a50513          	addi	a0,a0,-2006 # 61c0 <malloc+0x1412>
    299e:	00002097          	auipc	ra,0x2
    29a2:	32a080e7          	jalr	810(ra) # 4cc8 <printf>
    exit(1);
    29a6:	4505                	li	a0,1
    29a8:	00002097          	auipc	ra,0x2
    29ac:	f10080e7          	jalr	-240(ra) # 48b8 <exit>
    printf("%s: remove dd/ff failed\n", s);
    29b0:	85ca                	mv	a1,s2
    29b2:	00004517          	auipc	a0,0x4
    29b6:	82e50513          	addi	a0,a0,-2002 # 61e0 <malloc+0x1432>
    29ba:	00002097          	auipc	ra,0x2
    29be:	30e080e7          	jalr	782(ra) # 4cc8 <printf>
    exit(1);
    29c2:	4505                	li	a0,1
    29c4:	00002097          	auipc	ra,0x2
    29c8:	ef4080e7          	jalr	-268(ra) # 48b8 <exit>
    printf("%s: remove non-empty dd succeeded!\n", s);
    29cc:	85ca                	mv	a1,s2
    29ce:	00004517          	auipc	a0,0x4
    29d2:	83250513          	addi	a0,a0,-1998 # 6200 <malloc+0x1452>
    29d6:	00002097          	auipc	ra,0x2
    29da:	2f2080e7          	jalr	754(ra) # 4cc8 <printf>
    exit(1);
    29de:	4505                	li	a0,1
    29e0:	00002097          	auipc	ra,0x2
    29e4:	ed8080e7          	jalr	-296(ra) # 48b8 <exit>
    printf("%s: remove dd/dd failed\n", s);
    29e8:	85ca                	mv	a1,s2
    29ea:	00004517          	auipc	a0,0x4
    29ee:	84650513          	addi	a0,a0,-1978 # 6230 <malloc+0x1482>
    29f2:	00002097          	auipc	ra,0x2
    29f6:	2d6080e7          	jalr	726(ra) # 4cc8 <printf>
    exit(1);
    29fa:	4505                	li	a0,1
    29fc:	00002097          	auipc	ra,0x2
    2a00:	ebc080e7          	jalr	-324(ra) # 48b8 <exit>
    printf("%s: remove dd failed\n", s);
    2a04:	85ca                	mv	a1,s2
    2a06:	00004517          	auipc	a0,0x4
    2a0a:	84a50513          	addi	a0,a0,-1974 # 6250 <malloc+0x14a2>
    2a0e:	00002097          	auipc	ra,0x2
    2a12:	2ba080e7          	jalr	698(ra) # 4cc8 <printf>
    exit(1);
    2a16:	4505                	li	a0,1
    2a18:	00002097          	auipc	ra,0x2
    2a1c:	ea0080e7          	jalr	-352(ra) # 48b8 <exit>

0000000000002a20 <rmdot>:
{
    2a20:	1101                	addi	sp,sp,-32
    2a22:	ec06                	sd	ra,24(sp)
    2a24:	e822                	sd	s0,16(sp)
    2a26:	e426                	sd	s1,8(sp)
    2a28:	1000                	addi	s0,sp,32
    2a2a:	84aa                	mv	s1,a0
  if(mkdir("dots") != 0){
    2a2c:	00004517          	auipc	a0,0x4
    2a30:	83c50513          	addi	a0,a0,-1988 # 6268 <malloc+0x14ba>
    2a34:	00002097          	auipc	ra,0x2
    2a38:	ed4080e7          	jalr	-300(ra) # 4908 <mkdir>
    2a3c:	e549                	bnez	a0,2ac6 <rmdot+0xa6>
  if(chdir("dots") != 0){
    2a3e:	00004517          	auipc	a0,0x4
    2a42:	82a50513          	addi	a0,a0,-2006 # 6268 <malloc+0x14ba>
    2a46:	00002097          	auipc	ra,0x2
    2a4a:	eca080e7          	jalr	-310(ra) # 4910 <chdir>
    2a4e:	e951                	bnez	a0,2ae2 <rmdot+0xc2>
  if(remove(".") == 0){
    2a50:	00004517          	auipc	a0,0x4
    2a54:	85050513          	addi	a0,a0,-1968 # 62a0 <malloc+0x14f2>
    2a58:	00002097          	auipc	ra,0x2
    2a5c:	f08080e7          	jalr	-248(ra) # 4960 <remove>
    2a60:	cd59                	beqz	a0,2afe <rmdot+0xde>
  if(remove("..") == 0){
    2a62:	00004517          	auipc	a0,0x4
    2a66:	85e50513          	addi	a0,a0,-1954 # 62c0 <malloc+0x1512>
    2a6a:	00002097          	auipc	ra,0x2
    2a6e:	ef6080e7          	jalr	-266(ra) # 4960 <remove>
    2a72:	c545                	beqz	a0,2b1a <rmdot+0xfa>
  if(chdir("/") != 0){
    2a74:	00003517          	auipc	a0,0x3
    2a78:	43450513          	addi	a0,a0,1076 # 5ea8 <malloc+0x10fa>
    2a7c:	00002097          	auipc	ra,0x2
    2a80:	e94080e7          	jalr	-364(ra) # 4910 <chdir>
    2a84:	e94d                	bnez	a0,2b36 <rmdot+0x116>
  if(remove("dots/.") == 0){
    2a86:	00004517          	auipc	a0,0x4
    2a8a:	85a50513          	addi	a0,a0,-1958 # 62e0 <malloc+0x1532>
    2a8e:	00002097          	auipc	ra,0x2
    2a92:	ed2080e7          	jalr	-302(ra) # 4960 <remove>
    2a96:	cd55                	beqz	a0,2b52 <rmdot+0x132>
  if(remove("dots/..") == 0){
    2a98:	00004517          	auipc	a0,0x4
    2a9c:	87050513          	addi	a0,a0,-1936 # 6308 <malloc+0x155a>
    2aa0:	00002097          	auipc	ra,0x2
    2aa4:	ec0080e7          	jalr	-320(ra) # 4960 <remove>
    2aa8:	c179                	beqz	a0,2b6e <rmdot+0x14e>
  if(remove("dots") != 0){
    2aaa:	00003517          	auipc	a0,0x3
    2aae:	7be50513          	addi	a0,a0,1982 # 6268 <malloc+0x14ba>
    2ab2:	00002097          	auipc	ra,0x2
    2ab6:	eae080e7          	jalr	-338(ra) # 4960 <remove>
    2aba:	e961                	bnez	a0,2b8a <rmdot+0x16a>
}
    2abc:	60e2                	ld	ra,24(sp)
    2abe:	6442                	ld	s0,16(sp)
    2ac0:	64a2                	ld	s1,8(sp)
    2ac2:	6105                	addi	sp,sp,32
    2ac4:	8082                	ret
    printf("%s: mkdir dots failed\n", s);
    2ac6:	85a6                	mv	a1,s1
    2ac8:	00003517          	auipc	a0,0x3
    2acc:	7a850513          	addi	a0,a0,1960 # 6270 <malloc+0x14c2>
    2ad0:	00002097          	auipc	ra,0x2
    2ad4:	1f8080e7          	jalr	504(ra) # 4cc8 <printf>
    exit(1);
    2ad8:	4505                	li	a0,1
    2ada:	00002097          	auipc	ra,0x2
    2ade:	dde080e7          	jalr	-546(ra) # 48b8 <exit>
    printf("%s: chdir dots failed\n", s);
    2ae2:	85a6                	mv	a1,s1
    2ae4:	00003517          	auipc	a0,0x3
    2ae8:	7a450513          	addi	a0,a0,1956 # 6288 <malloc+0x14da>
    2aec:	00002097          	auipc	ra,0x2
    2af0:	1dc080e7          	jalr	476(ra) # 4cc8 <printf>
    exit(1);
    2af4:	4505                	li	a0,1
    2af6:	00002097          	auipc	ra,0x2
    2afa:	dc2080e7          	jalr	-574(ra) # 48b8 <exit>
    printf("%s: rm . worked!\n", s);
    2afe:	85a6                	mv	a1,s1
    2b00:	00003517          	auipc	a0,0x3
    2b04:	7a850513          	addi	a0,a0,1960 # 62a8 <malloc+0x14fa>
    2b08:	00002097          	auipc	ra,0x2
    2b0c:	1c0080e7          	jalr	448(ra) # 4cc8 <printf>
    exit(1);
    2b10:	4505                	li	a0,1
    2b12:	00002097          	auipc	ra,0x2
    2b16:	da6080e7          	jalr	-602(ra) # 48b8 <exit>
    printf("%s: rm .. worked!\n", s);
    2b1a:	85a6                	mv	a1,s1
    2b1c:	00003517          	auipc	a0,0x3
    2b20:	7ac50513          	addi	a0,a0,1964 # 62c8 <malloc+0x151a>
    2b24:	00002097          	auipc	ra,0x2
    2b28:	1a4080e7          	jalr	420(ra) # 4cc8 <printf>
    exit(1);
    2b2c:	4505                	li	a0,1
    2b2e:	00002097          	auipc	ra,0x2
    2b32:	d8a080e7          	jalr	-630(ra) # 48b8 <exit>
    printf("%s: chdir / failed\n", s);
    2b36:	85a6                	mv	a1,s1
    2b38:	00003517          	auipc	a0,0x3
    2b3c:	37850513          	addi	a0,a0,888 # 5eb0 <malloc+0x1102>
    2b40:	00002097          	auipc	ra,0x2
    2b44:	188080e7          	jalr	392(ra) # 4cc8 <printf>
    exit(1);
    2b48:	4505                	li	a0,1
    2b4a:	00002097          	auipc	ra,0x2
    2b4e:	d6e080e7          	jalr	-658(ra) # 48b8 <exit>
    printf("%s: remove dots/. worked!\n", s);
    2b52:	85a6                	mv	a1,s1
    2b54:	00003517          	auipc	a0,0x3
    2b58:	79450513          	addi	a0,a0,1940 # 62e8 <malloc+0x153a>
    2b5c:	00002097          	auipc	ra,0x2
    2b60:	16c080e7          	jalr	364(ra) # 4cc8 <printf>
    exit(1);
    2b64:	4505                	li	a0,1
    2b66:	00002097          	auipc	ra,0x2
    2b6a:	d52080e7          	jalr	-686(ra) # 48b8 <exit>
    printf("%s: remove dots/.. worked!\n", s);
    2b6e:	85a6                	mv	a1,s1
    2b70:	00003517          	auipc	a0,0x3
    2b74:	7a050513          	addi	a0,a0,1952 # 6310 <malloc+0x1562>
    2b78:	00002097          	auipc	ra,0x2
    2b7c:	150080e7          	jalr	336(ra) # 4cc8 <printf>
    exit(1);
    2b80:	4505                	li	a0,1
    2b82:	00002097          	auipc	ra,0x2
    2b86:	d36080e7          	jalr	-714(ra) # 48b8 <exit>
    printf("%s: remove dots failed!\n", s);
    2b8a:	85a6                	mv	a1,s1
    2b8c:	00003517          	auipc	a0,0x3
    2b90:	7a450513          	addi	a0,a0,1956 # 6330 <malloc+0x1582>
    2b94:	00002097          	auipc	ra,0x2
    2b98:	134080e7          	jalr	308(ra) # 4cc8 <printf>
    exit(1);
    2b9c:	4505                	li	a0,1
    2b9e:	00002097          	auipc	ra,0x2
    2ba2:	d1a080e7          	jalr	-742(ra) # 48b8 <exit>

0000000000002ba6 <dirfile>:
{
    2ba6:	1101                	addi	sp,sp,-32
    2ba8:	ec06                	sd	ra,24(sp)
    2baa:	e822                	sd	s0,16(sp)
    2bac:	e426                	sd	s1,8(sp)
    2bae:	e04a                	sd	s2,0(sp)
    2bb0:	1000                	addi	s0,sp,32
    2bb2:	892a                	mv	s2,a0
  fd = open("dirfile", O_CREATE);
    2bb4:	20000593          	li	a1,512
    2bb8:	00002517          	auipc	a0,0x2
    2bbc:	58850513          	addi	a0,a0,1416 # 5140 <malloc+0x392>
    2bc0:	00002097          	auipc	ra,0x2
    2bc4:	d38080e7          	jalr	-712(ra) # 48f8 <open>
  if(fd < 0){
    2bc8:	0c054d63          	bltz	a0,2ca2 <dirfile+0xfc>
  close(fd);
    2bcc:	00002097          	auipc	ra,0x2
    2bd0:	d14080e7          	jalr	-748(ra) # 48e0 <close>
  if(chdir("dirfile") == 0){
    2bd4:	00002517          	auipc	a0,0x2
    2bd8:	56c50513          	addi	a0,a0,1388 # 5140 <malloc+0x392>
    2bdc:	00002097          	auipc	ra,0x2
    2be0:	d34080e7          	jalr	-716(ra) # 4910 <chdir>
    2be4:	cd69                	beqz	a0,2cbe <dirfile+0x118>
  fd = open("dirfile/xx", 0);
    2be6:	4581                	li	a1,0
    2be8:	00003517          	auipc	a0,0x3
    2bec:	7a850513          	addi	a0,a0,1960 # 6390 <malloc+0x15e2>
    2bf0:	00002097          	auipc	ra,0x2
    2bf4:	d08080e7          	jalr	-760(ra) # 48f8 <open>
  if(fd >= 0){
    2bf8:	0e055163          	bgez	a0,2cda <dirfile+0x134>
  fd = open("dirfile/xx", O_CREATE);
    2bfc:	20000593          	li	a1,512
    2c00:	00003517          	auipc	a0,0x3
    2c04:	79050513          	addi	a0,a0,1936 # 6390 <malloc+0x15e2>
    2c08:	00002097          	auipc	ra,0x2
    2c0c:	cf0080e7          	jalr	-784(ra) # 48f8 <open>
  if(fd >= 0){
    2c10:	0e055363          	bgez	a0,2cf6 <dirfile+0x150>
  if(mkdir("dirfile/xx") == 0){
    2c14:	00003517          	auipc	a0,0x3
    2c18:	77c50513          	addi	a0,a0,1916 # 6390 <malloc+0x15e2>
    2c1c:	00002097          	auipc	ra,0x2
    2c20:	cec080e7          	jalr	-788(ra) # 4908 <mkdir>
    2c24:	c57d                	beqz	a0,2d12 <dirfile+0x16c>
  if(remove("dirfile/xx") == 0){
    2c26:	00003517          	auipc	a0,0x3
    2c2a:	76a50513          	addi	a0,a0,1898 # 6390 <malloc+0x15e2>
    2c2e:	00002097          	auipc	ra,0x2
    2c32:	d32080e7          	jalr	-718(ra) # 4960 <remove>
    2c36:	cd65                	beqz	a0,2d2e <dirfile+0x188>
  if(remove("dirfile") != 0){
    2c38:	00002517          	auipc	a0,0x2
    2c3c:	50850513          	addi	a0,a0,1288 # 5140 <malloc+0x392>
    2c40:	00002097          	auipc	ra,0x2
    2c44:	d20080e7          	jalr	-736(ra) # 4960 <remove>
    2c48:	10051163          	bnez	a0,2d4a <dirfile+0x1a4>
  fd = open(".", O_RDWR);
    2c4c:	4589                	li	a1,2
    2c4e:	00003517          	auipc	a0,0x3
    2c52:	65250513          	addi	a0,a0,1618 # 62a0 <malloc+0x14f2>
    2c56:	00002097          	auipc	ra,0x2
    2c5a:	ca2080e7          	jalr	-862(ra) # 48f8 <open>
  if(fd >= 0){
    2c5e:	10055463          	bgez	a0,2d66 <dirfile+0x1c0>
  fd = open(".", 0);
    2c62:	4581                	li	a1,0
    2c64:	00003517          	auipc	a0,0x3
    2c68:	63c50513          	addi	a0,a0,1596 # 62a0 <malloc+0x14f2>
    2c6c:	00002097          	auipc	ra,0x2
    2c70:	c8c080e7          	jalr	-884(ra) # 48f8 <open>
    2c74:	84aa                	mv	s1,a0
  if(write(fd, "x", 1) > 0){
    2c76:	4605                	li	a2,1
    2c78:	00002597          	auipc	a1,0x2
    2c7c:	5c858593          	addi	a1,a1,1480 # 5240 <malloc+0x492>
    2c80:	00002097          	auipc	ra,0x2
    2c84:	c58080e7          	jalr	-936(ra) # 48d8 <write>
    2c88:	0ea04d63          	bgtz	a0,2d82 <dirfile+0x1dc>
  close(fd);
    2c8c:	8526                	mv	a0,s1
    2c8e:	00002097          	auipc	ra,0x2
    2c92:	c52080e7          	jalr	-942(ra) # 48e0 <close>
}
    2c96:	60e2                	ld	ra,24(sp)
    2c98:	6442                	ld	s0,16(sp)
    2c9a:	64a2                	ld	s1,8(sp)
    2c9c:	6902                	ld	s2,0(sp)
    2c9e:	6105                	addi	sp,sp,32
    2ca0:	8082                	ret
    printf("%s: create dirfile failed\n", s);
    2ca2:	85ca                	mv	a1,s2
    2ca4:	00003517          	auipc	a0,0x3
    2ca8:	6ac50513          	addi	a0,a0,1708 # 6350 <malloc+0x15a2>
    2cac:	00002097          	auipc	ra,0x2
    2cb0:	01c080e7          	jalr	28(ra) # 4cc8 <printf>
    exit(1);
    2cb4:	4505                	li	a0,1
    2cb6:	00002097          	auipc	ra,0x2
    2cba:	c02080e7          	jalr	-1022(ra) # 48b8 <exit>
    printf("%s: chdir dirfile succeeded!\n", s);
    2cbe:	85ca                	mv	a1,s2
    2cc0:	00003517          	auipc	a0,0x3
    2cc4:	6b050513          	addi	a0,a0,1712 # 6370 <malloc+0x15c2>
    2cc8:	00002097          	auipc	ra,0x2
    2ccc:	000080e7          	jalr	ra # 4cc8 <printf>
    exit(1);
    2cd0:	4505                	li	a0,1
    2cd2:	00002097          	auipc	ra,0x2
    2cd6:	be6080e7          	jalr	-1050(ra) # 48b8 <exit>
    printf("%s: create dirfile/xx succeeded!\n", s);
    2cda:	85ca                	mv	a1,s2
    2cdc:	00003517          	auipc	a0,0x3
    2ce0:	6c450513          	addi	a0,a0,1732 # 63a0 <malloc+0x15f2>
    2ce4:	00002097          	auipc	ra,0x2
    2ce8:	fe4080e7          	jalr	-28(ra) # 4cc8 <printf>
    exit(1);
    2cec:	4505                	li	a0,1
    2cee:	00002097          	auipc	ra,0x2
    2cf2:	bca080e7          	jalr	-1078(ra) # 48b8 <exit>
    printf("%s: create dirfile/xx succeeded!\n", s);
    2cf6:	85ca                	mv	a1,s2
    2cf8:	00003517          	auipc	a0,0x3
    2cfc:	6a850513          	addi	a0,a0,1704 # 63a0 <malloc+0x15f2>
    2d00:	00002097          	auipc	ra,0x2
    2d04:	fc8080e7          	jalr	-56(ra) # 4cc8 <printf>
    exit(1);
    2d08:	4505                	li	a0,1
    2d0a:	00002097          	auipc	ra,0x2
    2d0e:	bae080e7          	jalr	-1106(ra) # 48b8 <exit>
    printf("%s: mkdir dirfile/xx succeeded!\n", s);
    2d12:	85ca                	mv	a1,s2
    2d14:	00003517          	auipc	a0,0x3
    2d18:	6b450513          	addi	a0,a0,1716 # 63c8 <malloc+0x161a>
    2d1c:	00002097          	auipc	ra,0x2
    2d20:	fac080e7          	jalr	-84(ra) # 4cc8 <printf>
    exit(1);
    2d24:	4505                	li	a0,1
    2d26:	00002097          	auipc	ra,0x2
    2d2a:	b92080e7          	jalr	-1134(ra) # 48b8 <exit>
    printf("%s: remove dirfile/xx succeeded!\n", s);
    2d2e:	85ca                	mv	a1,s2
    2d30:	00003517          	auipc	a0,0x3
    2d34:	6c050513          	addi	a0,a0,1728 # 63f0 <malloc+0x1642>
    2d38:	00002097          	auipc	ra,0x2
    2d3c:	f90080e7          	jalr	-112(ra) # 4cc8 <printf>
    exit(1);
    2d40:	4505                	li	a0,1
    2d42:	00002097          	auipc	ra,0x2
    2d46:	b76080e7          	jalr	-1162(ra) # 48b8 <exit>
    printf("%s: remove dirfile failed!\n", s);
    2d4a:	85ca                	mv	a1,s2
    2d4c:	00003517          	auipc	a0,0x3
    2d50:	6cc50513          	addi	a0,a0,1740 # 6418 <malloc+0x166a>
    2d54:	00002097          	auipc	ra,0x2
    2d58:	f74080e7          	jalr	-140(ra) # 4cc8 <printf>
    exit(1);
    2d5c:	4505                	li	a0,1
    2d5e:	00002097          	auipc	ra,0x2
    2d62:	b5a080e7          	jalr	-1190(ra) # 48b8 <exit>
    printf("%s: open . for writing succeeded!\n", s);
    2d66:	85ca                	mv	a1,s2
    2d68:	00003517          	auipc	a0,0x3
    2d6c:	6d050513          	addi	a0,a0,1744 # 6438 <malloc+0x168a>
    2d70:	00002097          	auipc	ra,0x2
    2d74:	f58080e7          	jalr	-168(ra) # 4cc8 <printf>
    exit(1);
    2d78:	4505                	li	a0,1
    2d7a:	00002097          	auipc	ra,0x2
    2d7e:	b3e080e7          	jalr	-1218(ra) # 48b8 <exit>
    printf("%s: write . succeeded!\n", s);
    2d82:	85ca                	mv	a1,s2
    2d84:	00003517          	auipc	a0,0x3
    2d88:	6dc50513          	addi	a0,a0,1756 # 6460 <malloc+0x16b2>
    2d8c:	00002097          	auipc	ra,0x2
    2d90:	f3c080e7          	jalr	-196(ra) # 4cc8 <printf>
    exit(1);
    2d94:	4505                	li	a0,1
    2d96:	00002097          	auipc	ra,0x2
    2d9a:	b22080e7          	jalr	-1246(ra) # 48b8 <exit>

0000000000002d9e <iref>:
{
    2d9e:	7139                	addi	sp,sp,-64
    2da0:	fc06                	sd	ra,56(sp)
    2da2:	f822                	sd	s0,48(sp)
    2da4:	f426                	sd	s1,40(sp)
    2da6:	f04a                	sd	s2,32(sp)
    2da8:	ec4e                	sd	s3,24(sp)
    2daa:	e852                	sd	s4,16(sp)
    2dac:	e456                	sd	s5,8(sp)
    2dae:	0080                	addi	s0,sp,64
    2db0:	8aaa                	mv	s5,a0
    2db2:	02e00493          	li	s1,46
    if(mkdir("irefd") != 0){
    2db6:	00003917          	auipc	s2,0x3
    2dba:	6c290913          	addi	s2,s2,1730 # 6478 <malloc+0x16ca>
    mkdir("");
    2dbe:	00003a17          	auipc	s4,0x3
    2dc2:	35aa0a13          	addi	s4,s4,858 # 6118 <malloc+0x136a>
    fd = open("xx", O_CREATE);
    2dc6:	00003997          	auipc	s3,0x3
    2dca:	5d298993          	addi	s3,s3,1490 # 6398 <malloc+0x15ea>
    2dce:	a889                	j	2e20 <iref+0x82>
      printf("%s: mkdir irefd failed\n", s);
    2dd0:	85d6                	mv	a1,s5
    2dd2:	00003517          	auipc	a0,0x3
    2dd6:	6ae50513          	addi	a0,a0,1710 # 6480 <malloc+0x16d2>
    2dda:	00002097          	auipc	ra,0x2
    2dde:	eee080e7          	jalr	-274(ra) # 4cc8 <printf>
      exit(1);
    2de2:	4505                	li	a0,1
    2de4:	00002097          	auipc	ra,0x2
    2de8:	ad4080e7          	jalr	-1324(ra) # 48b8 <exit>
      printf("%s: chdir irefd failed\n", s);
    2dec:	85d6                	mv	a1,s5
    2dee:	00003517          	auipc	a0,0x3
    2df2:	6aa50513          	addi	a0,a0,1706 # 6498 <malloc+0x16ea>
    2df6:	00002097          	auipc	ra,0x2
    2dfa:	ed2080e7          	jalr	-302(ra) # 4cc8 <printf>
      exit(1);
    2dfe:	4505                	li	a0,1
    2e00:	00002097          	auipc	ra,0x2
    2e04:	ab8080e7          	jalr	-1352(ra) # 48b8 <exit>
      close(fd);
    2e08:	00002097          	auipc	ra,0x2
    2e0c:	ad8080e7          	jalr	-1320(ra) # 48e0 <close>
    2e10:	a091                	j	2e54 <iref+0xb6>
    remove("xx");
    2e12:	854e                	mv	a0,s3
    2e14:	00002097          	auipc	ra,0x2
    2e18:	b4c080e7          	jalr	-1204(ra) # 4960 <remove>
  for(i = 0; i < NINODE - 4; i++){
    2e1c:	34fd                	addiw	s1,s1,-1
    2e1e:	c8a9                	beqz	s1,2e70 <iref+0xd2>
    if(mkdir("irefd") != 0){
    2e20:	854a                	mv	a0,s2
    2e22:	00002097          	auipc	ra,0x2
    2e26:	ae6080e7          	jalr	-1306(ra) # 4908 <mkdir>
    2e2a:	f15d                	bnez	a0,2dd0 <iref+0x32>
    if(chdir("irefd") != 0){
    2e2c:	854a                	mv	a0,s2
    2e2e:	00002097          	auipc	ra,0x2
    2e32:	ae2080e7          	jalr	-1310(ra) # 4910 <chdir>
    2e36:	f95d                	bnez	a0,2dec <iref+0x4e>
    mkdir("");
    2e38:	8552                	mv	a0,s4
    2e3a:	00002097          	auipc	ra,0x2
    2e3e:	ace080e7          	jalr	-1330(ra) # 4908 <mkdir>
    fd = open("", O_CREATE);
    2e42:	20000593          	li	a1,512
    2e46:	8552                	mv	a0,s4
    2e48:	00002097          	auipc	ra,0x2
    2e4c:	ab0080e7          	jalr	-1360(ra) # 48f8 <open>
    if(fd >= 0)
    2e50:	fa055ce3          	bgez	a0,2e08 <iref+0x6a>
    fd = open("xx", O_CREATE);
    2e54:	20000593          	li	a1,512
    2e58:	854e                	mv	a0,s3
    2e5a:	00002097          	auipc	ra,0x2
    2e5e:	a9e080e7          	jalr	-1378(ra) # 48f8 <open>
    if(fd >= 0)
    2e62:	fa0548e3          	bltz	a0,2e12 <iref+0x74>
      close(fd);
    2e66:	00002097          	auipc	ra,0x2
    2e6a:	a7a080e7          	jalr	-1414(ra) # 48e0 <close>
    2e6e:	b755                	j	2e12 <iref+0x74>
    2e70:	03300493          	li	s1,51
    chdir("..");
    2e74:	00003997          	auipc	s3,0x3
    2e78:	44c98993          	addi	s3,s3,1100 # 62c0 <malloc+0x1512>
    remove("irefd");
    2e7c:	00003917          	auipc	s2,0x3
    2e80:	5fc90913          	addi	s2,s2,1532 # 6478 <malloc+0x16ca>
    chdir("..");
    2e84:	854e                	mv	a0,s3
    2e86:	00002097          	auipc	ra,0x2
    2e8a:	a8a080e7          	jalr	-1398(ra) # 4910 <chdir>
    remove("irefd");
    2e8e:	854a                	mv	a0,s2
    2e90:	00002097          	auipc	ra,0x2
    2e94:	ad0080e7          	jalr	-1328(ra) # 4960 <remove>
  for(i = 0; i < NINODE + 1; i++){
    2e98:	34fd                	addiw	s1,s1,-1
    2e9a:	f4ed                	bnez	s1,2e84 <iref+0xe6>
  chdir("/");
    2e9c:	00003517          	auipc	a0,0x3
    2ea0:	00c50513          	addi	a0,a0,12 # 5ea8 <malloc+0x10fa>
    2ea4:	00002097          	auipc	ra,0x2
    2ea8:	a6c080e7          	jalr	-1428(ra) # 4910 <chdir>
}
    2eac:	70e2                	ld	ra,56(sp)
    2eae:	7442                	ld	s0,48(sp)
    2eb0:	74a2                	ld	s1,40(sp)
    2eb2:	7902                	ld	s2,32(sp)
    2eb4:	69e2                	ld	s3,24(sp)
    2eb6:	6a42                	ld	s4,16(sp)
    2eb8:	6aa2                	ld	s5,8(sp)
    2eba:	6121                	addi	sp,sp,64
    2ebc:	8082                	ret

0000000000002ebe <openiputtest>:
{
    2ebe:	7179                	addi	sp,sp,-48
    2ec0:	f406                	sd	ra,40(sp)
    2ec2:	f022                	sd	s0,32(sp)
    2ec4:	ec26                	sd	s1,24(sp)
    2ec6:	1800                	addi	s0,sp,48
    2ec8:	84aa                	mv	s1,a0
  if(mkdir("oidir") < 0){
    2eca:	00003517          	auipc	a0,0x3
    2ece:	5e650513          	addi	a0,a0,1510 # 64b0 <malloc+0x1702>
    2ed2:	00002097          	auipc	ra,0x2
    2ed6:	a36080e7          	jalr	-1482(ra) # 4908 <mkdir>
    2eda:	04054263          	bltz	a0,2f1e <openiputtest+0x60>
  pid = fork();
    2ede:	00002097          	auipc	ra,0x2
    2ee2:	9d2080e7          	jalr	-1582(ra) # 48b0 <fork>
  if(pid < 0){
    2ee6:	04054a63          	bltz	a0,2f3a <openiputtest+0x7c>
  if(pid == 0){
    2eea:	e93d                	bnez	a0,2f60 <openiputtest+0xa2>
    int fd = open("oidir", O_RDWR);
    2eec:	4589                	li	a1,2
    2eee:	00003517          	auipc	a0,0x3
    2ef2:	5c250513          	addi	a0,a0,1474 # 64b0 <malloc+0x1702>
    2ef6:	00002097          	auipc	ra,0x2
    2efa:	a02080e7          	jalr	-1534(ra) # 48f8 <open>
    if(fd >= 0){
    2efe:	04054c63          	bltz	a0,2f56 <openiputtest+0x98>
      printf("%s: open directory for write succeeded\n", s);
    2f02:	85a6                	mv	a1,s1
    2f04:	00003517          	auipc	a0,0x3
    2f08:	5cc50513          	addi	a0,a0,1484 # 64d0 <malloc+0x1722>
    2f0c:	00002097          	auipc	ra,0x2
    2f10:	dbc080e7          	jalr	-580(ra) # 4cc8 <printf>
      exit(1);
    2f14:	4505                	li	a0,1
    2f16:	00002097          	auipc	ra,0x2
    2f1a:	9a2080e7          	jalr	-1630(ra) # 48b8 <exit>
    printf("%s: mkdir oidir failed\n", s);
    2f1e:	85a6                	mv	a1,s1
    2f20:	00003517          	auipc	a0,0x3
    2f24:	59850513          	addi	a0,a0,1432 # 64b8 <malloc+0x170a>
    2f28:	00002097          	auipc	ra,0x2
    2f2c:	da0080e7          	jalr	-608(ra) # 4cc8 <printf>
    exit(1);
    2f30:	4505                	li	a0,1
    2f32:	00002097          	auipc	ra,0x2
    2f36:	986080e7          	jalr	-1658(ra) # 48b8 <exit>
    printf("%s: fork failed\n", s);
    2f3a:	85a6                	mv	a1,s1
    2f3c:	00003517          	auipc	a0,0x3
    2f40:	90450513          	addi	a0,a0,-1788 # 5840 <malloc+0xa92>
    2f44:	00002097          	auipc	ra,0x2
    2f48:	d84080e7          	jalr	-636(ra) # 4cc8 <printf>
    exit(1);
    2f4c:	4505                	li	a0,1
    2f4e:	00002097          	auipc	ra,0x2
    2f52:	96a080e7          	jalr	-1686(ra) # 48b8 <exit>
    exit(0);
    2f56:	4501                	li	a0,0
    2f58:	00002097          	auipc	ra,0x2
    2f5c:	960080e7          	jalr	-1696(ra) # 48b8 <exit>
  sleep(1);
    2f60:	4505                	li	a0,1
    2f62:	00002097          	auipc	ra,0x2
    2f66:	9ce080e7          	jalr	-1586(ra) # 4930 <sleep>
  if(remove("oidir") != 0){
    2f6a:	00003517          	auipc	a0,0x3
    2f6e:	54650513          	addi	a0,a0,1350 # 64b0 <malloc+0x1702>
    2f72:	00002097          	auipc	ra,0x2
    2f76:	9ee080e7          	jalr	-1554(ra) # 4960 <remove>
    2f7a:	cd19                	beqz	a0,2f98 <openiputtest+0xda>
    printf("%s: remove failed\n", s);
    2f7c:	85a6                	mv	a1,s1
    2f7e:	00003517          	auipc	a0,0x3
    2f82:	57a50513          	addi	a0,a0,1402 # 64f8 <malloc+0x174a>
    2f86:	00002097          	auipc	ra,0x2
    2f8a:	d42080e7          	jalr	-702(ra) # 4cc8 <printf>
    exit(1);
    2f8e:	4505                	li	a0,1
    2f90:	00002097          	auipc	ra,0x2
    2f94:	928080e7          	jalr	-1752(ra) # 48b8 <exit>
  wait(&xstatus);
    2f98:	fdc40513          	addi	a0,s0,-36
    2f9c:	00002097          	auipc	ra,0x2
    2fa0:	924080e7          	jalr	-1756(ra) # 48c0 <wait>
  exit(xstatus);
    2fa4:	fdc42503          	lw	a0,-36(s0)
    2fa8:	00002097          	auipc	ra,0x2
    2fac:	910080e7          	jalr	-1776(ra) # 48b8 <exit>

0000000000002fb0 <forkforkfork>:
{
    2fb0:	1101                	addi	sp,sp,-32
    2fb2:	ec06                	sd	ra,24(sp)
    2fb4:	e822                	sd	s0,16(sp)
    2fb6:	e426                	sd	s1,8(sp)
    2fb8:	1000                	addi	s0,sp,32
    2fba:	84aa                	mv	s1,a0
  remove("stopforking");
    2fbc:	00003517          	auipc	a0,0x3
    2fc0:	55450513          	addi	a0,a0,1364 # 6510 <malloc+0x1762>
    2fc4:	00002097          	auipc	ra,0x2
    2fc8:	99c080e7          	jalr	-1636(ra) # 4960 <remove>
  int pid = fork();
    2fcc:	00002097          	auipc	ra,0x2
    2fd0:	8e4080e7          	jalr	-1820(ra) # 48b0 <fork>
  if(pid < 0){
    2fd4:	04054d63          	bltz	a0,302e <forkforkfork+0x7e>
  if(pid == 0){
    2fd8:	c92d                	beqz	a0,304a <forkforkfork+0x9a>
  sleep(20); // two seconds
    2fda:	4551                	li	a0,20
    2fdc:	00002097          	auipc	ra,0x2
    2fe0:	954080e7          	jalr	-1708(ra) # 4930 <sleep>
  close(open("stopforking", O_CREATE|O_RDWR));
    2fe4:	20200593          	li	a1,514
    2fe8:	00003517          	auipc	a0,0x3
    2fec:	52850513          	addi	a0,a0,1320 # 6510 <malloc+0x1762>
    2ff0:	00002097          	auipc	ra,0x2
    2ff4:	908080e7          	jalr	-1784(ra) # 48f8 <open>
    2ff8:	00002097          	auipc	ra,0x2
    2ffc:	8e8080e7          	jalr	-1816(ra) # 48e0 <close>
  wait(0);
    3000:	4501                	li	a0,0
    3002:	00002097          	auipc	ra,0x2
    3006:	8be080e7          	jalr	-1858(ra) # 48c0 <wait>
  sleep(10); // one second
    300a:	4529                	li	a0,10
    300c:	00002097          	auipc	ra,0x2
    3010:	924080e7          	jalr	-1756(ra) # 4930 <sleep>
  remove("stopforking");
    3014:	00003517          	auipc	a0,0x3
    3018:	4fc50513          	addi	a0,a0,1276 # 6510 <malloc+0x1762>
    301c:	00002097          	auipc	ra,0x2
    3020:	944080e7          	jalr	-1724(ra) # 4960 <remove>
}
    3024:	60e2                	ld	ra,24(sp)
    3026:	6442                	ld	s0,16(sp)
    3028:	64a2                	ld	s1,8(sp)
    302a:	6105                	addi	sp,sp,32
    302c:	8082                	ret
    printf("%s: fork failed", s);
    302e:	85a6                	mv	a1,s1
    3030:	00003517          	auipc	a0,0x3
    3034:	9d050513          	addi	a0,a0,-1584 # 5a00 <malloc+0xc52>
    3038:	00002097          	auipc	ra,0x2
    303c:	c90080e7          	jalr	-880(ra) # 4cc8 <printf>
    exit(1);
    3040:	4505                	li	a0,1
    3042:	00002097          	auipc	ra,0x2
    3046:	876080e7          	jalr	-1930(ra) # 48b8 <exit>
      int fd = open("stopforking", 0);
    304a:	00003497          	auipc	s1,0x3
    304e:	4c648493          	addi	s1,s1,1222 # 6510 <malloc+0x1762>
    3052:	4581                	li	a1,0
    3054:	8526                	mv	a0,s1
    3056:	00002097          	auipc	ra,0x2
    305a:	8a2080e7          	jalr	-1886(ra) # 48f8 <open>
      if(fd >= 0){
    305e:	02055463          	bgez	a0,3086 <forkforkfork+0xd6>
      if(fork() < 0){
    3062:	00002097          	auipc	ra,0x2
    3066:	84e080e7          	jalr	-1970(ra) # 48b0 <fork>
    306a:	fe0554e3          	bgez	a0,3052 <forkforkfork+0xa2>
        close(open("stopforking", O_CREATE|O_RDWR));
    306e:	20200593          	li	a1,514
    3072:	8526                	mv	a0,s1
    3074:	00002097          	auipc	ra,0x2
    3078:	884080e7          	jalr	-1916(ra) # 48f8 <open>
    307c:	00002097          	auipc	ra,0x2
    3080:	864080e7          	jalr	-1948(ra) # 48e0 <close>
    3084:	b7f9                	j	3052 <forkforkfork+0xa2>
        exit(0);
    3086:	4501                	li	a0,0
    3088:	00002097          	auipc	ra,0x2
    308c:	830080e7          	jalr	-2000(ra) # 48b8 <exit>

0000000000003090 <preempt>:
{
    3090:	7139                	addi	sp,sp,-64
    3092:	fc06                	sd	ra,56(sp)
    3094:	f822                	sd	s0,48(sp)
    3096:	f426                	sd	s1,40(sp)
    3098:	f04a                	sd	s2,32(sp)
    309a:	ec4e                	sd	s3,24(sp)
    309c:	e852                	sd	s4,16(sp)
    309e:	0080                	addi	s0,sp,64
    30a0:	8a2a                	mv	s4,a0
  pid1 = fork();
    30a2:	00002097          	auipc	ra,0x2
    30a6:	80e080e7          	jalr	-2034(ra) # 48b0 <fork>
  if(pid1 < 0) {
    30aa:	00054563          	bltz	a0,30b4 <preempt+0x24>
    30ae:	89aa                	mv	s3,a0
  if(pid1 == 0)
    30b0:	ed19                	bnez	a0,30ce <preempt+0x3e>
    for(;;)
    30b2:	a001                	j	30b2 <preempt+0x22>
    printf("%s: fork failed");
    30b4:	00003517          	auipc	a0,0x3
    30b8:	94c50513          	addi	a0,a0,-1716 # 5a00 <malloc+0xc52>
    30bc:	00002097          	auipc	ra,0x2
    30c0:	c0c080e7          	jalr	-1012(ra) # 4cc8 <printf>
    exit(1);
    30c4:	4505                	li	a0,1
    30c6:	00001097          	auipc	ra,0x1
    30ca:	7f2080e7          	jalr	2034(ra) # 48b8 <exit>
  pid2 = fork();
    30ce:	00001097          	auipc	ra,0x1
    30d2:	7e2080e7          	jalr	2018(ra) # 48b0 <fork>
    30d6:	892a                	mv	s2,a0
  if(pid2 < 0) {
    30d8:	00054463          	bltz	a0,30e0 <preempt+0x50>
  if(pid2 == 0)
    30dc:	e105                	bnez	a0,30fc <preempt+0x6c>
    for(;;)
    30de:	a001                	j	30de <preempt+0x4e>
    printf("%s: fork failed\n", s);
    30e0:	85d2                	mv	a1,s4
    30e2:	00002517          	auipc	a0,0x2
    30e6:	75e50513          	addi	a0,a0,1886 # 5840 <malloc+0xa92>
    30ea:	00002097          	auipc	ra,0x2
    30ee:	bde080e7          	jalr	-1058(ra) # 4cc8 <printf>
    exit(1);
    30f2:	4505                	li	a0,1
    30f4:	00001097          	auipc	ra,0x1
    30f8:	7c4080e7          	jalr	1988(ra) # 48b8 <exit>
  pipe(pfds);
    30fc:	fc840513          	addi	a0,s0,-56
    3100:	00001097          	auipc	ra,0x1
    3104:	7c8080e7          	jalr	1992(ra) # 48c8 <pipe>
  pid3 = fork();
    3108:	00001097          	auipc	ra,0x1
    310c:	7a8080e7          	jalr	1960(ra) # 48b0 <fork>
    3110:	84aa                	mv	s1,a0
  if(pid3 < 0) {
    3112:	02054e63          	bltz	a0,314e <preempt+0xbe>
  if(pid3 == 0){
    3116:	e13d                	bnez	a0,317c <preempt+0xec>
    close(pfds[0]);
    3118:	fc842503          	lw	a0,-56(s0)
    311c:	00001097          	auipc	ra,0x1
    3120:	7c4080e7          	jalr	1988(ra) # 48e0 <close>
    if(write(pfds[1], "x", 1) != 1)
    3124:	4605                	li	a2,1
    3126:	00002597          	auipc	a1,0x2
    312a:	11a58593          	addi	a1,a1,282 # 5240 <malloc+0x492>
    312e:	fcc42503          	lw	a0,-52(s0)
    3132:	00001097          	auipc	ra,0x1
    3136:	7a6080e7          	jalr	1958(ra) # 48d8 <write>
    313a:	4785                	li	a5,1
    313c:	02f51763          	bne	a0,a5,316a <preempt+0xda>
    close(pfds[1]);
    3140:	fcc42503          	lw	a0,-52(s0)
    3144:	00001097          	auipc	ra,0x1
    3148:	79c080e7          	jalr	1948(ra) # 48e0 <close>
    for(;;)
    314c:	a001                	j	314c <preempt+0xbc>
     printf("%s: fork failed\n", s);
    314e:	85d2                	mv	a1,s4
    3150:	00002517          	auipc	a0,0x2
    3154:	6f050513          	addi	a0,a0,1776 # 5840 <malloc+0xa92>
    3158:	00002097          	auipc	ra,0x2
    315c:	b70080e7          	jalr	-1168(ra) # 4cc8 <printf>
     exit(1);
    3160:	4505                	li	a0,1
    3162:	00001097          	auipc	ra,0x1
    3166:	756080e7          	jalr	1878(ra) # 48b8 <exit>
      printf("%s: preempt write error");
    316a:	00003517          	auipc	a0,0x3
    316e:	3b650513          	addi	a0,a0,950 # 6520 <malloc+0x1772>
    3172:	00002097          	auipc	ra,0x2
    3176:	b56080e7          	jalr	-1194(ra) # 4cc8 <printf>
    317a:	b7d9                	j	3140 <preempt+0xb0>
  close(pfds[1]);
    317c:	fcc42503          	lw	a0,-52(s0)
    3180:	00001097          	auipc	ra,0x1
    3184:	760080e7          	jalr	1888(ra) # 48e0 <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
    3188:	6609                	lui	a2,0x2
    318a:	80060613          	addi	a2,a2,-2048 # 1800 <forkfork+0x68>
    318e:	00007597          	auipc	a1,0x7
    3192:	6e258593          	addi	a1,a1,1762 # a870 <buf>
    3196:	fc842503          	lw	a0,-56(s0)
    319a:	00001097          	auipc	ra,0x1
    319e:	736080e7          	jalr	1846(ra) # 48d0 <read>
    31a2:	4785                	li	a5,1
    31a4:	02f50263          	beq	a0,a5,31c8 <preempt+0x138>
    printf("%s: preempt read error");
    31a8:	00003517          	auipc	a0,0x3
    31ac:	39050513          	addi	a0,a0,912 # 6538 <malloc+0x178a>
    31b0:	00002097          	auipc	ra,0x2
    31b4:	b18080e7          	jalr	-1256(ra) # 4cc8 <printf>
}
    31b8:	70e2                	ld	ra,56(sp)
    31ba:	7442                	ld	s0,48(sp)
    31bc:	74a2                	ld	s1,40(sp)
    31be:	7902                	ld	s2,32(sp)
    31c0:	69e2                	ld	s3,24(sp)
    31c2:	6a42                	ld	s4,16(sp)
    31c4:	6121                	addi	sp,sp,64
    31c6:	8082                	ret
  close(pfds[0]);
    31c8:	fc842503          	lw	a0,-56(s0)
    31cc:	00001097          	auipc	ra,0x1
    31d0:	714080e7          	jalr	1812(ra) # 48e0 <close>
  printf("kill... ");
    31d4:	00003517          	auipc	a0,0x3
    31d8:	37c50513          	addi	a0,a0,892 # 6550 <malloc+0x17a2>
    31dc:	00002097          	auipc	ra,0x2
    31e0:	aec080e7          	jalr	-1300(ra) # 4cc8 <printf>
  kill(pid1);
    31e4:	854e                	mv	a0,s3
    31e6:	00001097          	auipc	ra,0x1
    31ea:	702080e7          	jalr	1794(ra) # 48e8 <kill>
  kill(pid2);
    31ee:	854a                	mv	a0,s2
    31f0:	00001097          	auipc	ra,0x1
    31f4:	6f8080e7          	jalr	1784(ra) # 48e8 <kill>
  kill(pid3);
    31f8:	8526                	mv	a0,s1
    31fa:	00001097          	auipc	ra,0x1
    31fe:	6ee080e7          	jalr	1774(ra) # 48e8 <kill>
  printf("wait... ");
    3202:	00003517          	auipc	a0,0x3
    3206:	35e50513          	addi	a0,a0,862 # 6560 <malloc+0x17b2>
    320a:	00002097          	auipc	ra,0x2
    320e:	abe080e7          	jalr	-1346(ra) # 4cc8 <printf>
  wait(0);
    3212:	4501                	li	a0,0
    3214:	00001097          	auipc	ra,0x1
    3218:	6ac080e7          	jalr	1708(ra) # 48c0 <wait>
  wait(0);
    321c:	4501                	li	a0,0
    321e:	00001097          	auipc	ra,0x1
    3222:	6a2080e7          	jalr	1698(ra) # 48c0 <wait>
  wait(0);
    3226:	4501                	li	a0,0
    3228:	00001097          	auipc	ra,0x1
    322c:	698080e7          	jalr	1688(ra) # 48c0 <wait>
    3230:	b761                	j	31b8 <preempt+0x128>

0000000000003232 <sbrkfail>:
{
    3232:	7119                	addi	sp,sp,-128
    3234:	fc86                	sd	ra,120(sp)
    3236:	f8a2                	sd	s0,112(sp)
    3238:	f4a6                	sd	s1,104(sp)
    323a:	f0ca                	sd	s2,96(sp)
    323c:	ecce                	sd	s3,88(sp)
    323e:	e8d2                	sd	s4,80(sp)
    3240:	e4d6                	sd	s5,72(sp)
    3242:	0100                	addi	s0,sp,128
    3244:	892a                	mv	s2,a0
  if(pipe(fds) != 0){
    3246:	fb040513          	addi	a0,s0,-80
    324a:	00001097          	auipc	ra,0x1
    324e:	67e080e7          	jalr	1662(ra) # 48c8 <pipe>
    3252:	e901                	bnez	a0,3262 <sbrkfail+0x30>
    3254:	f8040493          	addi	s1,s0,-128
    3258:	fa840a13          	addi	s4,s0,-88
    325c:	89a6                	mv	s3,s1
    if(pids[i] != -1)
    325e:	5afd                	li	s5,-1
    3260:	a08d                	j	32c2 <sbrkfail+0x90>
    printf("%s: pipe() failed\n", s);
    3262:	85ca                	mv	a1,s2
    3264:	00002517          	auipc	a0,0x2
    3268:	6e450513          	addi	a0,a0,1764 # 5948 <malloc+0xb9a>
    326c:	00002097          	auipc	ra,0x2
    3270:	a5c080e7          	jalr	-1444(ra) # 4cc8 <printf>
    exit(1);
    3274:	4505                	li	a0,1
    3276:	00001097          	auipc	ra,0x1
    327a:	642080e7          	jalr	1602(ra) # 48b8 <exit>
      sbrk(BIG - (uint64)sbrk(0));
    327e:	4501                	li	a0,0
    3280:	00001097          	auipc	ra,0x1
    3284:	6a8080e7          	jalr	1704(ra) # 4928 <sbrk>
    3288:	064007b7          	lui	a5,0x6400
    328c:	40a7853b          	subw	a0,a5,a0
    3290:	00001097          	auipc	ra,0x1
    3294:	698080e7          	jalr	1688(ra) # 4928 <sbrk>
      write(fds[1], "x", 1);
    3298:	4605                	li	a2,1
    329a:	00002597          	auipc	a1,0x2
    329e:	fa658593          	addi	a1,a1,-90 # 5240 <malloc+0x492>
    32a2:	fb442503          	lw	a0,-76(s0)
    32a6:	00001097          	auipc	ra,0x1
    32aa:	632080e7          	jalr	1586(ra) # 48d8 <write>
      for(;;) sleep(1000);
    32ae:	3e800513          	li	a0,1000
    32b2:	00001097          	auipc	ra,0x1
    32b6:	67e080e7          	jalr	1662(ra) # 4930 <sleep>
    32ba:	bfd5                	j	32ae <sbrkfail+0x7c>
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    32bc:	0991                	addi	s3,s3,4
    32be:	03498563          	beq	s3,s4,32e8 <sbrkfail+0xb6>
    if((pids[i] = fork()) == 0){
    32c2:	00001097          	auipc	ra,0x1
    32c6:	5ee080e7          	jalr	1518(ra) # 48b0 <fork>
    32ca:	00a9a023          	sw	a0,0(s3)
    32ce:	d945                	beqz	a0,327e <sbrkfail+0x4c>
    if(pids[i] != -1)
    32d0:	ff5506e3          	beq	a0,s5,32bc <sbrkfail+0x8a>
      read(fds[0], &scratch, 1);
    32d4:	4605                	li	a2,1
    32d6:	faf40593          	addi	a1,s0,-81
    32da:	fb042503          	lw	a0,-80(s0)
    32de:	00001097          	auipc	ra,0x1
    32e2:	5f2080e7          	jalr	1522(ra) # 48d0 <read>
    32e6:	bfd9                	j	32bc <sbrkfail+0x8a>
  c = sbrk(PGSIZE);
    32e8:	6505                	lui	a0,0x1
    32ea:	00001097          	auipc	ra,0x1
    32ee:	63e080e7          	jalr	1598(ra) # 4928 <sbrk>
    32f2:	89aa                	mv	s3,a0
    if(pids[i] == -1)
    32f4:	5afd                	li	s5,-1
    32f6:	a021                	j	32fe <sbrkfail+0xcc>
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    32f8:	0491                	addi	s1,s1,4
    32fa:	01448f63          	beq	s1,s4,3318 <sbrkfail+0xe6>
    if(pids[i] == -1)
    32fe:	4088                	lw	a0,0(s1)
    3300:	ff550ce3          	beq	a0,s5,32f8 <sbrkfail+0xc6>
    kill(pids[i]);
    3304:	00001097          	auipc	ra,0x1
    3308:	5e4080e7          	jalr	1508(ra) # 48e8 <kill>
    wait(0);
    330c:	4501                	li	a0,0
    330e:	00001097          	auipc	ra,0x1
    3312:	5b2080e7          	jalr	1458(ra) # 48c0 <wait>
    3316:	b7cd                	j	32f8 <sbrkfail+0xc6>
  if(c == (char*)0xffffffffffffffffL){
    3318:	57fd                	li	a5,-1
    331a:	04f98163          	beq	s3,a5,335c <sbrkfail+0x12a>
  pid = fork();
    331e:	00001097          	auipc	ra,0x1
    3322:	592080e7          	jalr	1426(ra) # 48b0 <fork>
    3326:	84aa                	mv	s1,a0
  if(pid < 0){
    3328:	04054863          	bltz	a0,3378 <sbrkfail+0x146>
  if(pid == 0){
    332c:	c525                	beqz	a0,3394 <sbrkfail+0x162>
  wait(&xstatus);
    332e:	fbc40513          	addi	a0,s0,-68
    3332:	00001097          	auipc	ra,0x1
    3336:	58e080e7          	jalr	1422(ra) # 48c0 <wait>
  if(xstatus != -1 && xstatus != 2)
    333a:	fbc42783          	lw	a5,-68(s0)
    333e:	577d                	li	a4,-1
    3340:	00e78563          	beq	a5,a4,334a <sbrkfail+0x118>
    3344:	4709                	li	a4,2
    3346:	08e79c63          	bne	a5,a4,33de <sbrkfail+0x1ac>
}
    334a:	70e6                	ld	ra,120(sp)
    334c:	7446                	ld	s0,112(sp)
    334e:	74a6                	ld	s1,104(sp)
    3350:	7906                	ld	s2,96(sp)
    3352:	69e6                	ld	s3,88(sp)
    3354:	6a46                	ld	s4,80(sp)
    3356:	6aa6                	ld	s5,72(sp)
    3358:	6109                	addi	sp,sp,128
    335a:	8082                	ret
    printf("%s: failed sbrk leaked memory\n", s);
    335c:	85ca                	mv	a1,s2
    335e:	00003517          	auipc	a0,0x3
    3362:	21250513          	addi	a0,a0,530 # 6570 <malloc+0x17c2>
    3366:	00002097          	auipc	ra,0x2
    336a:	962080e7          	jalr	-1694(ra) # 4cc8 <printf>
    exit(1);
    336e:	4505                	li	a0,1
    3370:	00001097          	auipc	ra,0x1
    3374:	548080e7          	jalr	1352(ra) # 48b8 <exit>
    printf("%s: fork failed\n", s);
    3378:	85ca                	mv	a1,s2
    337a:	00002517          	auipc	a0,0x2
    337e:	4c650513          	addi	a0,a0,1222 # 5840 <malloc+0xa92>
    3382:	00002097          	auipc	ra,0x2
    3386:	946080e7          	jalr	-1722(ra) # 4cc8 <printf>
    exit(1);
    338a:	4505                	li	a0,1
    338c:	00001097          	auipc	ra,0x1
    3390:	52c080e7          	jalr	1324(ra) # 48b8 <exit>
    a = sbrk(0);
    3394:	4501                	li	a0,0
    3396:	00001097          	auipc	ra,0x1
    339a:	592080e7          	jalr	1426(ra) # 4928 <sbrk>
    339e:	892a                	mv	s2,a0
    sbrk(10*BIG);
    33a0:	3e800537          	lui	a0,0x3e800
    33a4:	00001097          	auipc	ra,0x1
    33a8:	584080e7          	jalr	1412(ra) # 4928 <sbrk>
    for (i = 0; i < 10*BIG; i += PGSIZE) {
    33ac:	874a                	mv	a4,s2
    33ae:	3e8007b7          	lui	a5,0x3e800
    33b2:	97ca                	add	a5,a5,s2
    33b4:	6685                	lui	a3,0x1
      n += *(a+i);
    33b6:	00074603          	lbu	a2,0(a4)
    33ba:	9cb1                	addw	s1,s1,a2
    for (i = 0; i < 10*BIG; i += PGSIZE) {
    33bc:	9736                	add	a4,a4,a3
    33be:	fef71ce3          	bne	a4,a5,33b6 <sbrkfail+0x184>
    printf("%s: allocate a lot of memory succeeded %d\n", n);
    33c2:	85a6                	mv	a1,s1
    33c4:	00003517          	auipc	a0,0x3
    33c8:	1cc50513          	addi	a0,a0,460 # 6590 <malloc+0x17e2>
    33cc:	00002097          	auipc	ra,0x2
    33d0:	8fc080e7          	jalr	-1796(ra) # 4cc8 <printf>
    exit(1);
    33d4:	4505                	li	a0,1
    33d6:	00001097          	auipc	ra,0x1
    33da:	4e2080e7          	jalr	1250(ra) # 48b8 <exit>
    exit(1);
    33de:	4505                	li	a0,1
    33e0:	00001097          	auipc	ra,0x1
    33e4:	4d8080e7          	jalr	1240(ra) # 48b8 <exit>

00000000000033e8 <reparent>:
{
    33e8:	7179                	addi	sp,sp,-48
    33ea:	f406                	sd	ra,40(sp)
    33ec:	f022                	sd	s0,32(sp)
    33ee:	ec26                	sd	s1,24(sp)
    33f0:	e84a                	sd	s2,16(sp)
    33f2:	e44e                	sd	s3,8(sp)
    33f4:	e052                	sd	s4,0(sp)
    33f6:	1800                	addi	s0,sp,48
    33f8:	89aa                	mv	s3,a0
  int master_pid = getpid();
    33fa:	00001097          	auipc	ra,0x1
    33fe:	526080e7          	jalr	1318(ra) # 4920 <getpid>
    3402:	8a2a                	mv	s4,a0
    3404:	0c800913          	li	s2,200
    int pid = fork();
    3408:	00001097          	auipc	ra,0x1
    340c:	4a8080e7          	jalr	1192(ra) # 48b0 <fork>
    3410:	84aa                	mv	s1,a0
    if(pid < 0){
    3412:	02054263          	bltz	a0,3436 <reparent+0x4e>
    if(pid){
    3416:	cd21                	beqz	a0,346e <reparent+0x86>
      if(wait(0) != pid){
    3418:	4501                	li	a0,0
    341a:	00001097          	auipc	ra,0x1
    341e:	4a6080e7          	jalr	1190(ra) # 48c0 <wait>
    3422:	02951863          	bne	a0,s1,3452 <reparent+0x6a>
  for(int i = 0; i < 200; i++){
    3426:	397d                	addiw	s2,s2,-1
    3428:	fe0910e3          	bnez	s2,3408 <reparent+0x20>
  exit(0);
    342c:	4501                	li	a0,0
    342e:	00001097          	auipc	ra,0x1
    3432:	48a080e7          	jalr	1162(ra) # 48b8 <exit>
      printf("%s: fork failed\n", s);
    3436:	85ce                	mv	a1,s3
    3438:	00002517          	auipc	a0,0x2
    343c:	40850513          	addi	a0,a0,1032 # 5840 <malloc+0xa92>
    3440:	00002097          	auipc	ra,0x2
    3444:	888080e7          	jalr	-1912(ra) # 4cc8 <printf>
      exit(1);
    3448:	4505                	li	a0,1
    344a:	00001097          	auipc	ra,0x1
    344e:	46e080e7          	jalr	1134(ra) # 48b8 <exit>
        printf("%s: wait wrong pid\n", s);
    3452:	85ce                	mv	a1,s3
    3454:	00002517          	auipc	a0,0x2
    3458:	57450513          	addi	a0,a0,1396 # 59c8 <malloc+0xc1a>
    345c:	00002097          	auipc	ra,0x2
    3460:	86c080e7          	jalr	-1940(ra) # 4cc8 <printf>
        exit(1);
    3464:	4505                	li	a0,1
    3466:	00001097          	auipc	ra,0x1
    346a:	452080e7          	jalr	1106(ra) # 48b8 <exit>
      int pid2 = fork();
    346e:	00001097          	auipc	ra,0x1
    3472:	442080e7          	jalr	1090(ra) # 48b0 <fork>
      if(pid2 < 0){
    3476:	00054763          	bltz	a0,3484 <reparent+0x9c>
      exit(0);
    347a:	4501                	li	a0,0
    347c:	00001097          	auipc	ra,0x1
    3480:	43c080e7          	jalr	1084(ra) # 48b8 <exit>
        kill(master_pid);
    3484:	8552                	mv	a0,s4
    3486:	00001097          	auipc	ra,0x1
    348a:	462080e7          	jalr	1122(ra) # 48e8 <kill>
        exit(1);
    348e:	4505                	li	a0,1
    3490:	00001097          	auipc	ra,0x1
    3494:	428080e7          	jalr	1064(ra) # 48b8 <exit>

0000000000003498 <mem>:
{
    3498:	7139                	addi	sp,sp,-64
    349a:	fc06                	sd	ra,56(sp)
    349c:	f822                	sd	s0,48(sp)
    349e:	f426                	sd	s1,40(sp)
    34a0:	f04a                	sd	s2,32(sp)
    34a2:	ec4e                	sd	s3,24(sp)
    34a4:	0080                	addi	s0,sp,64
    34a6:	89aa                	mv	s3,a0
  if((pid = fork()) == 0){
    34a8:	00001097          	auipc	ra,0x1
    34ac:	408080e7          	jalr	1032(ra) # 48b0 <fork>
    m1 = 0;
    34b0:	4481                	li	s1,0
    while((m2 = malloc(10001)) != 0){
    34b2:	6909                	lui	s2,0x2
    34b4:	71190913          	addi	s2,s2,1809 # 2711 <subdir+0x1e9>
  if((pid = fork()) == 0){
    34b8:	ed39                	bnez	a0,3516 <mem+0x7e>
    while((m2 = malloc(10001)) != 0){
    34ba:	854a                	mv	a0,s2
    34bc:	00002097          	auipc	ra,0x2
    34c0:	8f2080e7          	jalr	-1806(ra) # 4dae <malloc>
    34c4:	c501                	beqz	a0,34cc <mem+0x34>
      *(char**)m2 = m1;
    34c6:	e104                	sd	s1,0(a0)
      m1 = m2;
    34c8:	84aa                	mv	s1,a0
    34ca:	bfc5                	j	34ba <mem+0x22>
    while(m1){
    34cc:	c881                	beqz	s1,34dc <mem+0x44>
      m2 = *(char**)m1;
    34ce:	8526                	mv	a0,s1
    34d0:	6084                	ld	s1,0(s1)
      free(m1);
    34d2:	00002097          	auipc	ra,0x2
    34d6:	854080e7          	jalr	-1964(ra) # 4d26 <free>
    while(m1){
    34da:	f8f5                	bnez	s1,34ce <mem+0x36>
    m1 = malloc(1024*20);
    34dc:	6515                	lui	a0,0x5
    34de:	00002097          	auipc	ra,0x2
    34e2:	8d0080e7          	jalr	-1840(ra) # 4dae <malloc>
    if(m1 == 0){
    34e6:	c911                	beqz	a0,34fa <mem+0x62>
    free(m1);
    34e8:	00002097          	auipc	ra,0x2
    34ec:	83e080e7          	jalr	-1986(ra) # 4d26 <free>
    exit(0);
    34f0:	4501                	li	a0,0
    34f2:	00001097          	auipc	ra,0x1
    34f6:	3c6080e7          	jalr	966(ra) # 48b8 <exit>
      printf("couldn't allocate mem?!!\n", s);
    34fa:	85ce                	mv	a1,s3
    34fc:	00003517          	auipc	a0,0x3
    3500:	0c450513          	addi	a0,a0,196 # 65c0 <malloc+0x1812>
    3504:	00001097          	auipc	ra,0x1
    3508:	7c4080e7          	jalr	1988(ra) # 4cc8 <printf>
      exit(1);
    350c:	4505                	li	a0,1
    350e:	00001097          	auipc	ra,0x1
    3512:	3aa080e7          	jalr	938(ra) # 48b8 <exit>
    wait(&xstatus);
    3516:	fcc40513          	addi	a0,s0,-52
    351a:	00001097          	auipc	ra,0x1
    351e:	3a6080e7          	jalr	934(ra) # 48c0 <wait>
    if(xstatus == -1){
    3522:	fcc42503          	lw	a0,-52(s0)
    3526:	57fd                	li	a5,-1
    3528:	00f50663          	beq	a0,a5,3534 <mem+0x9c>
    exit(xstatus);
    352c:	00001097          	auipc	ra,0x1
    3530:	38c080e7          	jalr	908(ra) # 48b8 <exit>
      exit(0);
    3534:	4501                	li	a0,0
    3536:	00001097          	auipc	ra,0x1
    353a:	382080e7          	jalr	898(ra) # 48b8 <exit>

000000000000353e <sharedfd>:
{
    353e:	7159                	addi	sp,sp,-112
    3540:	f486                	sd	ra,104(sp)
    3542:	f0a2                	sd	s0,96(sp)
    3544:	eca6                	sd	s1,88(sp)
    3546:	e8ca                	sd	s2,80(sp)
    3548:	e4ce                	sd	s3,72(sp)
    354a:	e0d2                	sd	s4,64(sp)
    354c:	fc56                	sd	s5,56(sp)
    354e:	f85a                	sd	s6,48(sp)
    3550:	f45e                	sd	s7,40(sp)
    3552:	1880                	addi	s0,sp,112
    3554:	8a2a                	mv	s4,a0
  remove("sharedfd");
    3556:	00002517          	auipc	a0,0x2
    355a:	aa250513          	addi	a0,a0,-1374 # 4ff8 <malloc+0x24a>
    355e:	00001097          	auipc	ra,0x1
    3562:	402080e7          	jalr	1026(ra) # 4960 <remove>
  fd = open("sharedfd", O_CREATE|O_RDWR);
    3566:	20200593          	li	a1,514
    356a:	00002517          	auipc	a0,0x2
    356e:	a8e50513          	addi	a0,a0,-1394 # 4ff8 <malloc+0x24a>
    3572:	00001097          	auipc	ra,0x1
    3576:	386080e7          	jalr	902(ra) # 48f8 <open>
  if(fd < 0){
    357a:	04054a63          	bltz	a0,35ce <sharedfd+0x90>
    357e:	892a                	mv	s2,a0
  pid = fork();
    3580:	00001097          	auipc	ra,0x1
    3584:	330080e7          	jalr	816(ra) # 48b0 <fork>
    3588:	89aa                	mv	s3,a0
  memset(buf, pid==0?'c':'p', sizeof(buf));
    358a:	06300593          	li	a1,99
    358e:	c119                	beqz	a0,3594 <sharedfd+0x56>
    3590:	07000593          	li	a1,112
    3594:	4629                	li	a2,10
    3596:	fa040513          	addi	a0,s0,-96
    359a:	00001097          	auipc	ra,0x1
    359e:	104080e7          	jalr	260(ra) # 469e <memset>
    35a2:	3e800493          	li	s1,1000
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
    35a6:	4629                	li	a2,10
    35a8:	fa040593          	addi	a1,s0,-96
    35ac:	854a                	mv	a0,s2
    35ae:	00001097          	auipc	ra,0x1
    35b2:	32a080e7          	jalr	810(ra) # 48d8 <write>
    35b6:	47a9                	li	a5,10
    35b8:	02f51963          	bne	a0,a5,35ea <sharedfd+0xac>
  for(i = 0; i < N; i++){
    35bc:	34fd                	addiw	s1,s1,-1
    35be:	f4e5                	bnez	s1,35a6 <sharedfd+0x68>
  if(pid == 0) {
    35c0:	04099363          	bnez	s3,3606 <sharedfd+0xc8>
    exit(0);
    35c4:	4501                	li	a0,0
    35c6:	00001097          	auipc	ra,0x1
    35ca:	2f2080e7          	jalr	754(ra) # 48b8 <exit>
    printf("%s: cannot open sharedfd for writing", s);
    35ce:	85d2                	mv	a1,s4
    35d0:	00003517          	auipc	a0,0x3
    35d4:	01050513          	addi	a0,a0,16 # 65e0 <malloc+0x1832>
    35d8:	00001097          	auipc	ra,0x1
    35dc:	6f0080e7          	jalr	1776(ra) # 4cc8 <printf>
    exit(1);
    35e0:	4505                	li	a0,1
    35e2:	00001097          	auipc	ra,0x1
    35e6:	2d6080e7          	jalr	726(ra) # 48b8 <exit>
      printf("%s: write sharedfd failed\n", s);
    35ea:	85d2                	mv	a1,s4
    35ec:	00003517          	auipc	a0,0x3
    35f0:	01c50513          	addi	a0,a0,28 # 6608 <malloc+0x185a>
    35f4:	00001097          	auipc	ra,0x1
    35f8:	6d4080e7          	jalr	1748(ra) # 4cc8 <printf>
      exit(1);
    35fc:	4505                	li	a0,1
    35fe:	00001097          	auipc	ra,0x1
    3602:	2ba080e7          	jalr	698(ra) # 48b8 <exit>
    wait(&xstatus);
    3606:	f9c40513          	addi	a0,s0,-100
    360a:	00001097          	auipc	ra,0x1
    360e:	2b6080e7          	jalr	694(ra) # 48c0 <wait>
    if(xstatus != 0)
    3612:	f9c42983          	lw	s3,-100(s0)
    3616:	00098763          	beqz	s3,3624 <sharedfd+0xe6>
      exit(xstatus);
    361a:	854e                	mv	a0,s3
    361c:	00001097          	auipc	ra,0x1
    3620:	29c080e7          	jalr	668(ra) # 48b8 <exit>
  close(fd);
    3624:	854a                	mv	a0,s2
    3626:	00001097          	auipc	ra,0x1
    362a:	2ba080e7          	jalr	698(ra) # 48e0 <close>
  fd = open("sharedfd", 0);
    362e:	4581                	li	a1,0
    3630:	00002517          	auipc	a0,0x2
    3634:	9c850513          	addi	a0,a0,-1592 # 4ff8 <malloc+0x24a>
    3638:	00001097          	auipc	ra,0x1
    363c:	2c0080e7          	jalr	704(ra) # 48f8 <open>
    3640:	8baa                	mv	s7,a0
  nc = np = 0;
    3642:	8ace                	mv	s5,s3
  if(fd < 0){
    3644:	02054563          	bltz	a0,366e <sharedfd+0x130>
    3648:	faa40913          	addi	s2,s0,-86
      if(buf[i] == 'c')
    364c:	06300493          	li	s1,99
      if(buf[i] == 'p')
    3650:	07000b13          	li	s6,112
  while((n = read(fd, buf, sizeof(buf))) > 0){
    3654:	4629                	li	a2,10
    3656:	fa040593          	addi	a1,s0,-96
    365a:	855e                	mv	a0,s7
    365c:	00001097          	auipc	ra,0x1
    3660:	274080e7          	jalr	628(ra) # 48d0 <read>
    3664:	02a05f63          	blez	a0,36a2 <sharedfd+0x164>
    3668:	fa040793          	addi	a5,s0,-96
    366c:	a01d                	j	3692 <sharedfd+0x154>
    printf("%s: cannot open sharedfd for reading\n", s);
    366e:	85d2                	mv	a1,s4
    3670:	00003517          	auipc	a0,0x3
    3674:	fb850513          	addi	a0,a0,-72 # 6628 <malloc+0x187a>
    3678:	00001097          	auipc	ra,0x1
    367c:	650080e7          	jalr	1616(ra) # 4cc8 <printf>
    exit(1);
    3680:	4505                	li	a0,1
    3682:	00001097          	auipc	ra,0x1
    3686:	236080e7          	jalr	566(ra) # 48b8 <exit>
        nc++;
    368a:	2985                	addiw	s3,s3,1
    for(i = 0; i < sizeof(buf); i++){
    368c:	0785                	addi	a5,a5,1
    368e:	fd2783e3          	beq	a5,s2,3654 <sharedfd+0x116>
      if(buf[i] == 'c')
    3692:	0007c703          	lbu	a4,0(a5) # 3e800000 <__BSS_END__+0x3e7f3f18>
    3696:	fe970ae3          	beq	a4,s1,368a <sharedfd+0x14c>
      if(buf[i] == 'p')
    369a:	ff6719e3          	bne	a4,s6,368c <sharedfd+0x14e>
        np++;
    369e:	2a85                	addiw	s5,s5,1
    36a0:	b7f5                	j	368c <sharedfd+0x14e>
  close(fd);
    36a2:	855e                	mv	a0,s7
    36a4:	00001097          	auipc	ra,0x1
    36a8:	23c080e7          	jalr	572(ra) # 48e0 <close>
  remove("sharedfd");
    36ac:	00002517          	auipc	a0,0x2
    36b0:	94c50513          	addi	a0,a0,-1716 # 4ff8 <malloc+0x24a>
    36b4:	00001097          	auipc	ra,0x1
    36b8:	2ac080e7          	jalr	684(ra) # 4960 <remove>
  if(nc == N*SZ && np == N*SZ){
    36bc:	6789                	lui	a5,0x2
    36be:	71078793          	addi	a5,a5,1808 # 2710 <subdir+0x1e8>
    36c2:	00f99763          	bne	s3,a5,36d0 <sharedfd+0x192>
    36c6:	6789                	lui	a5,0x2
    36c8:	71078793          	addi	a5,a5,1808 # 2710 <subdir+0x1e8>
    36cc:	02fa8063          	beq	s5,a5,36ec <sharedfd+0x1ae>
    printf("%s: nc/np test fails\n", s);
    36d0:	85d2                	mv	a1,s4
    36d2:	00003517          	auipc	a0,0x3
    36d6:	f7e50513          	addi	a0,a0,-130 # 6650 <malloc+0x18a2>
    36da:	00001097          	auipc	ra,0x1
    36de:	5ee080e7          	jalr	1518(ra) # 4cc8 <printf>
    exit(1);
    36e2:	4505                	li	a0,1
    36e4:	00001097          	auipc	ra,0x1
    36e8:	1d4080e7          	jalr	468(ra) # 48b8 <exit>
    exit(0);
    36ec:	4501                	li	a0,0
    36ee:	00001097          	auipc	ra,0x1
    36f2:	1ca080e7          	jalr	458(ra) # 48b8 <exit>

00000000000036f6 <fourfiles>:
{
    36f6:	7171                	addi	sp,sp,-176
    36f8:	f506                	sd	ra,168(sp)
    36fa:	f122                	sd	s0,160(sp)
    36fc:	ed26                	sd	s1,152(sp)
    36fe:	e94a                	sd	s2,144(sp)
    3700:	e54e                	sd	s3,136(sp)
    3702:	e152                	sd	s4,128(sp)
    3704:	fcd6                	sd	s5,120(sp)
    3706:	f8da                	sd	s6,112(sp)
    3708:	f4de                	sd	s7,104(sp)
    370a:	f0e2                	sd	s8,96(sp)
    370c:	ece6                	sd	s9,88(sp)
    370e:	e8ea                	sd	s10,80(sp)
    3710:	e4ee                	sd	s11,72(sp)
    3712:	1900                	addi	s0,sp,176
    3714:	f4a43c23          	sd	a0,-168(s0)
  char *names[] = { "f0", "f1", "f2", "f3" };
    3718:	00001797          	auipc	a5,0x1
    371c:	78078793          	addi	a5,a5,1920 # 4e98 <malloc+0xea>
    3720:	f6f43823          	sd	a5,-144(s0)
    3724:	00001797          	auipc	a5,0x1
    3728:	77c78793          	addi	a5,a5,1916 # 4ea0 <malloc+0xf2>
    372c:	f6f43c23          	sd	a5,-136(s0)
    3730:	00001797          	auipc	a5,0x1
    3734:	77878793          	addi	a5,a5,1912 # 4ea8 <malloc+0xfa>
    3738:	f8f43023          	sd	a5,-128(s0)
    373c:	00001797          	auipc	a5,0x1
    3740:	77478793          	addi	a5,a5,1908 # 4eb0 <malloc+0x102>
    3744:	f8f43423          	sd	a5,-120(s0)
  for(pi = 0; pi < NCHILD; pi++){
    3748:	f7040c13          	addi	s8,s0,-144
  char *names[] = { "f0", "f1", "f2", "f3" };
    374c:	8962                	mv	s2,s8
  for(pi = 0; pi < NCHILD; pi++){
    374e:	4481                	li	s1,0
    3750:	4a11                	li	s4,4
    fname = names[pi];
    3752:	00093983          	ld	s3,0(s2)
    remove(fname);
    3756:	854e                	mv	a0,s3
    3758:	00001097          	auipc	ra,0x1
    375c:	208080e7          	jalr	520(ra) # 4960 <remove>
    pid = fork();
    3760:	00001097          	auipc	ra,0x1
    3764:	150080e7          	jalr	336(ra) # 48b0 <fork>
    if(pid < 0){
    3768:	04054863          	bltz	a0,37b8 <fourfiles+0xc2>
    if(pid == 0){
    376c:	c52d                	beqz	a0,37d6 <fourfiles+0xe0>
  for(pi = 0; pi < NCHILD; pi++){
    376e:	2485                	addiw	s1,s1,1
    3770:	0921                	addi	s2,s2,8
    3772:	ff4490e3          	bne	s1,s4,3752 <fourfiles+0x5c>
    3776:	4491                	li	s1,4
    wait(&xstatus);
    3778:	f6c40513          	addi	a0,s0,-148
    377c:	00001097          	auipc	ra,0x1
    3780:	144080e7          	jalr	324(ra) # 48c0 <wait>
    if(xstatus != 0)
    3784:	f6c42503          	lw	a0,-148(s0)
    3788:	e175                	bnez	a0,386c <fourfiles+0x176>
  for(pi = 0; pi < NCHILD; pi++){
    378a:	34fd                	addiw	s1,s1,-1
    378c:	f4f5                	bnez	s1,3778 <fourfiles+0x82>
    378e:	03000b93          	li	s7,48
    total = 0;
    3792:	f4a43823          	sd	a0,-176(s0)
    while((n = read(fd, buf, sizeof(buf))) > 0){
    3796:	6a09                	lui	s4,0x2
    3798:	800a0a13          	addi	s4,s4,-2048 # 1800 <forkfork+0x68>
    379c:	00007a97          	auipc	s5,0x7
    37a0:	0d4a8a93          	addi	s5,s5,212 # a870 <buf>
    37a4:	00007b17          	auipc	s6,0x7
    37a8:	0cdb0b13          	addi	s6,s6,205 # a871 <buf+0x1>
    if(total != N*SZ){
    37ac:	6d85                	lui	s11,0x1
    37ae:	770d8d93          	addi	s11,s11,1904 # 1770 <twochildren+0x72>
  for(i = 0; i < NCHILD; i++){
    37b2:	03400d13          	li	s10,52
    37b6:	aa15                	j	38ea <fourfiles+0x1f4>
      printf("fork failed\n", s);
    37b8:	f5843583          	ld	a1,-168(s0)
    37bc:	00002517          	auipc	a0,0x2
    37c0:	40450513          	addi	a0,a0,1028 # 5bc0 <malloc+0xe12>
    37c4:	00001097          	auipc	ra,0x1
    37c8:	504080e7          	jalr	1284(ra) # 4cc8 <printf>
      exit(1);
    37cc:	4505                	li	a0,1
    37ce:	00001097          	auipc	ra,0x1
    37d2:	0ea080e7          	jalr	234(ra) # 48b8 <exit>
      fd = open(fname, O_CREATE | O_RDWR);
    37d6:	20200593          	li	a1,514
    37da:	854e                	mv	a0,s3
    37dc:	00001097          	auipc	ra,0x1
    37e0:	11c080e7          	jalr	284(ra) # 48f8 <open>
    37e4:	892a                	mv	s2,a0
      if(fd < 0){
    37e6:	04054763          	bltz	a0,3834 <fourfiles+0x13e>
      memset(buf, '0'+pi, SZ);
    37ea:	1f400613          	li	a2,500
    37ee:	0304859b          	addiw	a1,s1,48
    37f2:	00007517          	auipc	a0,0x7
    37f6:	07e50513          	addi	a0,a0,126 # a870 <buf>
    37fa:	00001097          	auipc	ra,0x1
    37fe:	ea4080e7          	jalr	-348(ra) # 469e <memset>
    3802:	44b1                	li	s1,12
        if((n = write(fd, buf, SZ)) != SZ){
    3804:	00007997          	auipc	s3,0x7
    3808:	06c98993          	addi	s3,s3,108 # a870 <buf>
    380c:	1f400613          	li	a2,500
    3810:	85ce                	mv	a1,s3
    3812:	854a                	mv	a0,s2
    3814:	00001097          	auipc	ra,0x1
    3818:	0c4080e7          	jalr	196(ra) # 48d8 <write>
    381c:	85aa                	mv	a1,a0
    381e:	1f400793          	li	a5,500
    3822:	02f51863          	bne	a0,a5,3852 <fourfiles+0x15c>
      for(i = 0; i < N; i++){
    3826:	34fd                	addiw	s1,s1,-1
    3828:	f0f5                	bnez	s1,380c <fourfiles+0x116>
      exit(0);
    382a:	4501                	li	a0,0
    382c:	00001097          	auipc	ra,0x1
    3830:	08c080e7          	jalr	140(ra) # 48b8 <exit>
        printf("create failed\n", s);
    3834:	f5843583          	ld	a1,-168(s0)
    3838:	00003517          	auipc	a0,0x3
    383c:	e3050513          	addi	a0,a0,-464 # 6668 <malloc+0x18ba>
    3840:	00001097          	auipc	ra,0x1
    3844:	488080e7          	jalr	1160(ra) # 4cc8 <printf>
        exit(1);
    3848:	4505                	li	a0,1
    384a:	00001097          	auipc	ra,0x1
    384e:	06e080e7          	jalr	110(ra) # 48b8 <exit>
          printf("write failed %d\n", n);
    3852:	00003517          	auipc	a0,0x3
    3856:	e2650513          	addi	a0,a0,-474 # 6678 <malloc+0x18ca>
    385a:	00001097          	auipc	ra,0x1
    385e:	46e080e7          	jalr	1134(ra) # 4cc8 <printf>
          exit(1);
    3862:	4505                	li	a0,1
    3864:	00001097          	auipc	ra,0x1
    3868:	054080e7          	jalr	84(ra) # 48b8 <exit>
      exit(xstatus);
    386c:	00001097          	auipc	ra,0x1
    3870:	04c080e7          	jalr	76(ra) # 48b8 <exit>
          printf("wrong char\n", s);
    3874:	f5843583          	ld	a1,-168(s0)
    3878:	00003517          	auipc	a0,0x3
    387c:	e1850513          	addi	a0,a0,-488 # 6690 <malloc+0x18e2>
    3880:	00001097          	auipc	ra,0x1
    3884:	448080e7          	jalr	1096(ra) # 4cc8 <printf>
          exit(1);
    3888:	4505                	li	a0,1
    388a:	00001097          	auipc	ra,0x1
    388e:	02e080e7          	jalr	46(ra) # 48b8 <exit>
      total += n;
    3892:	00a9093b          	addw	s2,s2,a0
    while((n = read(fd, buf, sizeof(buf))) > 0){
    3896:	8652                	mv	a2,s4
    3898:	85d6                	mv	a1,s5
    389a:	854e                	mv	a0,s3
    389c:	00001097          	auipc	ra,0x1
    38a0:	034080e7          	jalr	52(ra) # 48d0 <read>
    38a4:	02a05363          	blez	a0,38ca <fourfiles+0x1d4>
    38a8:	00007797          	auipc	a5,0x7
    38ac:	fc878793          	addi	a5,a5,-56 # a870 <buf>
    38b0:	fff5069b          	addiw	a3,a0,-1
    38b4:	1682                	slli	a3,a3,0x20
    38b6:	9281                	srli	a3,a3,0x20
    38b8:	96da                	add	a3,a3,s6
        if(buf[j] != '0'+i){
    38ba:	0007c703          	lbu	a4,0(a5)
    38be:	fa971be3          	bne	a4,s1,3874 <fourfiles+0x17e>
      for(j = 0; j < n; j++){
    38c2:	0785                	addi	a5,a5,1
    38c4:	fed79be3          	bne	a5,a3,38ba <fourfiles+0x1c4>
    38c8:	b7e9                	j	3892 <fourfiles+0x19c>
    close(fd);
    38ca:	854e                	mv	a0,s3
    38cc:	00001097          	auipc	ra,0x1
    38d0:	014080e7          	jalr	20(ra) # 48e0 <close>
    if(total != N*SZ){
    38d4:	03b91963          	bne	s2,s11,3906 <fourfiles+0x210>
    remove(fname);
    38d8:	8566                	mv	a0,s9
    38da:	00001097          	auipc	ra,0x1
    38de:	086080e7          	jalr	134(ra) # 4960 <remove>
  for(i = 0; i < NCHILD; i++){
    38e2:	0c21                	addi	s8,s8,8
    38e4:	2b85                	addiw	s7,s7,1
    38e6:	03ab8e63          	beq	s7,s10,3922 <fourfiles+0x22c>
    fname = names[i];
    38ea:	000c3c83          	ld	s9,0(s8)
    fd = open(fname, 0);
    38ee:	4581                	li	a1,0
    38f0:	8566                	mv	a0,s9
    38f2:	00001097          	auipc	ra,0x1
    38f6:	006080e7          	jalr	6(ra) # 48f8 <open>
    38fa:	89aa                	mv	s3,a0
    total = 0;
    38fc:	f5043903          	ld	s2,-176(s0)
        if(buf[j] != '0'+i){
    3900:	000b849b          	sext.w	s1,s7
    while((n = read(fd, buf, sizeof(buf))) > 0){
    3904:	bf49                	j	3896 <fourfiles+0x1a0>
      printf("wrong length %d\n", total);
    3906:	85ca                	mv	a1,s2
    3908:	00003517          	auipc	a0,0x3
    390c:	d9850513          	addi	a0,a0,-616 # 66a0 <malloc+0x18f2>
    3910:	00001097          	auipc	ra,0x1
    3914:	3b8080e7          	jalr	952(ra) # 4cc8 <printf>
      exit(1);
    3918:	4505                	li	a0,1
    391a:	00001097          	auipc	ra,0x1
    391e:	f9e080e7          	jalr	-98(ra) # 48b8 <exit>
}
    3922:	70aa                	ld	ra,168(sp)
    3924:	740a                	ld	s0,160(sp)
    3926:	64ea                	ld	s1,152(sp)
    3928:	694a                	ld	s2,144(sp)
    392a:	69aa                	ld	s3,136(sp)
    392c:	6a0a                	ld	s4,128(sp)
    392e:	7ae6                	ld	s5,120(sp)
    3930:	7b46                	ld	s6,112(sp)
    3932:	7ba6                	ld	s7,104(sp)
    3934:	7c06                	ld	s8,96(sp)
    3936:	6ce6                	ld	s9,88(sp)
    3938:	6d46                	ld	s10,80(sp)
    393a:	6da6                	ld	s11,72(sp)
    393c:	614d                	addi	sp,sp,176
    393e:	8082                	ret

0000000000003940 <bigfile>:
{
    3940:	7139                	addi	sp,sp,-64
    3942:	fc06                	sd	ra,56(sp)
    3944:	f822                	sd	s0,48(sp)
    3946:	f426                	sd	s1,40(sp)
    3948:	f04a                	sd	s2,32(sp)
    394a:	ec4e                	sd	s3,24(sp)
    394c:	e852                	sd	s4,16(sp)
    394e:	e456                	sd	s5,8(sp)
    3950:	0080                	addi	s0,sp,64
    3952:	8aaa                	mv	s5,a0
  remove("bigfile.dat");
    3954:	00003517          	auipc	a0,0x3
    3958:	d6450513          	addi	a0,a0,-668 # 66b8 <malloc+0x190a>
    395c:	00001097          	auipc	ra,0x1
    3960:	004080e7          	jalr	4(ra) # 4960 <remove>
  fd = open("bigfile.dat", O_CREATE | O_RDWR);
    3964:	20200593          	li	a1,514
    3968:	00003517          	auipc	a0,0x3
    396c:	d5050513          	addi	a0,a0,-688 # 66b8 <malloc+0x190a>
    3970:	00001097          	auipc	ra,0x1
    3974:	f88080e7          	jalr	-120(ra) # 48f8 <open>
    3978:	89aa                	mv	s3,a0
  for(i = 0; i < N; i++){
    397a:	4481                	li	s1,0
    memset(buf, i, SZ);
    397c:	00007917          	auipc	s2,0x7
    3980:	ef490913          	addi	s2,s2,-268 # a870 <buf>
  for(i = 0; i < N; i++){
    3984:	4a51                	li	s4,20
  if(fd < 0){
    3986:	0a054063          	bltz	a0,3a26 <bigfile+0xe6>
    memset(buf, i, SZ);
    398a:	25800613          	li	a2,600
    398e:	85a6                	mv	a1,s1
    3990:	854a                	mv	a0,s2
    3992:	00001097          	auipc	ra,0x1
    3996:	d0c080e7          	jalr	-756(ra) # 469e <memset>
    if(write(fd, buf, SZ) != SZ){
    399a:	25800613          	li	a2,600
    399e:	85ca                	mv	a1,s2
    39a0:	854e                	mv	a0,s3
    39a2:	00001097          	auipc	ra,0x1
    39a6:	f36080e7          	jalr	-202(ra) # 48d8 <write>
    39aa:	25800793          	li	a5,600
    39ae:	08f51a63          	bne	a0,a5,3a42 <bigfile+0x102>
  for(i = 0; i < N; i++){
    39b2:	2485                	addiw	s1,s1,1
    39b4:	fd449be3          	bne	s1,s4,398a <bigfile+0x4a>
  close(fd);
    39b8:	854e                	mv	a0,s3
    39ba:	00001097          	auipc	ra,0x1
    39be:	f26080e7          	jalr	-218(ra) # 48e0 <close>
  fd = open("bigfile.dat", 0);
    39c2:	4581                	li	a1,0
    39c4:	00003517          	auipc	a0,0x3
    39c8:	cf450513          	addi	a0,a0,-780 # 66b8 <malloc+0x190a>
    39cc:	00001097          	auipc	ra,0x1
    39d0:	f2c080e7          	jalr	-212(ra) # 48f8 <open>
    39d4:	8a2a                	mv	s4,a0
  total = 0;
    39d6:	4981                	li	s3,0
  for(i = 0; ; i++){
    39d8:	4481                	li	s1,0
    cc = read(fd, buf, SZ/2);
    39da:	00007917          	auipc	s2,0x7
    39de:	e9690913          	addi	s2,s2,-362 # a870 <buf>
  if(fd < 0){
    39e2:	06054e63          	bltz	a0,3a5e <bigfile+0x11e>
    cc = read(fd, buf, SZ/2);
    39e6:	12c00613          	li	a2,300
    39ea:	85ca                	mv	a1,s2
    39ec:	8552                	mv	a0,s4
    39ee:	00001097          	auipc	ra,0x1
    39f2:	ee2080e7          	jalr	-286(ra) # 48d0 <read>
    if(cc < 0){
    39f6:	08054263          	bltz	a0,3a7a <bigfile+0x13a>
    if(cc == 0)
    39fa:	c971                	beqz	a0,3ace <bigfile+0x18e>
    if(cc != SZ/2){
    39fc:	12c00793          	li	a5,300
    3a00:	08f51b63          	bne	a0,a5,3a96 <bigfile+0x156>
    if(buf[0] != i/2 || buf[SZ/2-1] != i/2){
    3a04:	01f4d79b          	srliw	a5,s1,0x1f
    3a08:	9fa5                	addw	a5,a5,s1
    3a0a:	4017d79b          	sraiw	a5,a5,0x1
    3a0e:	00094703          	lbu	a4,0(s2)
    3a12:	0af71063          	bne	a4,a5,3ab2 <bigfile+0x172>
    3a16:	12b94703          	lbu	a4,299(s2)
    3a1a:	08f71c63          	bne	a4,a5,3ab2 <bigfile+0x172>
    total += cc;
    3a1e:	12c9899b          	addiw	s3,s3,300
  for(i = 0; ; i++){
    3a22:	2485                	addiw	s1,s1,1
    cc = read(fd, buf, SZ/2);
    3a24:	b7c9                	j	39e6 <bigfile+0xa6>
    printf("%s: cannot create bigfile", s);
    3a26:	85d6                	mv	a1,s5
    3a28:	00003517          	auipc	a0,0x3
    3a2c:	ca050513          	addi	a0,a0,-864 # 66c8 <malloc+0x191a>
    3a30:	00001097          	auipc	ra,0x1
    3a34:	298080e7          	jalr	664(ra) # 4cc8 <printf>
    exit(1);
    3a38:	4505                	li	a0,1
    3a3a:	00001097          	auipc	ra,0x1
    3a3e:	e7e080e7          	jalr	-386(ra) # 48b8 <exit>
      printf("%s: write bigfile failed\n", s);
    3a42:	85d6                	mv	a1,s5
    3a44:	00003517          	auipc	a0,0x3
    3a48:	ca450513          	addi	a0,a0,-860 # 66e8 <malloc+0x193a>
    3a4c:	00001097          	auipc	ra,0x1
    3a50:	27c080e7          	jalr	636(ra) # 4cc8 <printf>
      exit(1);
    3a54:	4505                	li	a0,1
    3a56:	00001097          	auipc	ra,0x1
    3a5a:	e62080e7          	jalr	-414(ra) # 48b8 <exit>
    printf("%s: cannot open bigfile\n", s);
    3a5e:	85d6                	mv	a1,s5
    3a60:	00003517          	auipc	a0,0x3
    3a64:	ca850513          	addi	a0,a0,-856 # 6708 <malloc+0x195a>
    3a68:	00001097          	auipc	ra,0x1
    3a6c:	260080e7          	jalr	608(ra) # 4cc8 <printf>
    exit(1);
    3a70:	4505                	li	a0,1
    3a72:	00001097          	auipc	ra,0x1
    3a76:	e46080e7          	jalr	-442(ra) # 48b8 <exit>
      printf("%s: read bigfile failed\n", s);
    3a7a:	85d6                	mv	a1,s5
    3a7c:	00003517          	auipc	a0,0x3
    3a80:	cac50513          	addi	a0,a0,-852 # 6728 <malloc+0x197a>
    3a84:	00001097          	auipc	ra,0x1
    3a88:	244080e7          	jalr	580(ra) # 4cc8 <printf>
      exit(1);
    3a8c:	4505                	li	a0,1
    3a8e:	00001097          	auipc	ra,0x1
    3a92:	e2a080e7          	jalr	-470(ra) # 48b8 <exit>
      printf("%s: short read bigfile\n", s);
    3a96:	85d6                	mv	a1,s5
    3a98:	00003517          	auipc	a0,0x3
    3a9c:	cb050513          	addi	a0,a0,-848 # 6748 <malloc+0x199a>
    3aa0:	00001097          	auipc	ra,0x1
    3aa4:	228080e7          	jalr	552(ra) # 4cc8 <printf>
      exit(1);
    3aa8:	4505                	li	a0,1
    3aaa:	00001097          	auipc	ra,0x1
    3aae:	e0e080e7          	jalr	-498(ra) # 48b8 <exit>
      printf("%s: read bigfile wrong data\n", s);
    3ab2:	85d6                	mv	a1,s5
    3ab4:	00003517          	auipc	a0,0x3
    3ab8:	cac50513          	addi	a0,a0,-852 # 6760 <malloc+0x19b2>
    3abc:	00001097          	auipc	ra,0x1
    3ac0:	20c080e7          	jalr	524(ra) # 4cc8 <printf>
      exit(1);
    3ac4:	4505                	li	a0,1
    3ac6:	00001097          	auipc	ra,0x1
    3aca:	df2080e7          	jalr	-526(ra) # 48b8 <exit>
  close(fd);
    3ace:	8552                	mv	a0,s4
    3ad0:	00001097          	auipc	ra,0x1
    3ad4:	e10080e7          	jalr	-496(ra) # 48e0 <close>
  if(total != N*SZ){
    3ad8:	678d                	lui	a5,0x3
    3ada:	ee078793          	addi	a5,a5,-288 # 2ee0 <openiputtest+0x22>
    3ade:	02f99363          	bne	s3,a5,3b04 <bigfile+0x1c4>
  remove("bigfile.dat");
    3ae2:	00003517          	auipc	a0,0x3
    3ae6:	bd650513          	addi	a0,a0,-1066 # 66b8 <malloc+0x190a>
    3aea:	00001097          	auipc	ra,0x1
    3aee:	e76080e7          	jalr	-394(ra) # 4960 <remove>
}
    3af2:	70e2                	ld	ra,56(sp)
    3af4:	7442                	ld	s0,48(sp)
    3af6:	74a2                	ld	s1,40(sp)
    3af8:	7902                	ld	s2,32(sp)
    3afa:	69e2                	ld	s3,24(sp)
    3afc:	6a42                	ld	s4,16(sp)
    3afe:	6aa2                	ld	s5,8(sp)
    3b00:	6121                	addi	sp,sp,64
    3b02:	8082                	ret
    printf("%s: read bigfile wrong total\n", s);
    3b04:	85d6                	mv	a1,s5
    3b06:	00003517          	auipc	a0,0x3
    3b0a:	c7a50513          	addi	a0,a0,-902 # 6780 <malloc+0x19d2>
    3b0e:	00001097          	auipc	ra,0x1
    3b12:	1ba080e7          	jalr	442(ra) # 4cc8 <printf>
    exit(1);
    3b16:	4505                	li	a0,1
    3b18:	00001097          	auipc	ra,0x1
    3b1c:	da0080e7          	jalr	-608(ra) # 48b8 <exit>

0000000000003b20 <createdelete>:
{
    3b20:	7135                	addi	sp,sp,-160
    3b22:	ed06                	sd	ra,152(sp)
    3b24:	e922                	sd	s0,144(sp)
    3b26:	e526                	sd	s1,136(sp)
    3b28:	e14a                	sd	s2,128(sp)
    3b2a:	fcce                	sd	s3,120(sp)
    3b2c:	f8d2                	sd	s4,112(sp)
    3b2e:	f4d6                	sd	s5,104(sp)
    3b30:	f0da                	sd	s6,96(sp)
    3b32:	ecde                	sd	s7,88(sp)
    3b34:	e8e2                	sd	s8,80(sp)
    3b36:	e4e6                	sd	s9,72(sp)
    3b38:	1100                	addi	s0,sp,160
    3b3a:	8caa                	mv	s9,a0
  char illegal[] = { '\"', '*', '/', ':', '<', '>', '?', '\\', '|', 0 };
    3b3c:	00003797          	auipc	a5,0x3
    3b40:	ccc78793          	addi	a5,a5,-820 # 6808 <malloc+0x1a5a>
    3b44:	6398                	ld	a4,0(a5)
    3b46:	f6e43823          	sd	a4,-144(s0)
    3b4a:	0087d783          	lhu	a5,8(a5)
    3b4e:	f6f41c23          	sh	a5,-136(s0)
  for(pi = 0; pi < NCHILD; pi++){
    3b52:	4901                	li	s2,0
    3b54:	4991                	li	s3,4
    pid = fork();
    3b56:	00001097          	auipc	ra,0x1
    3b5a:	d5a080e7          	jalr	-678(ra) # 48b0 <fork>
    3b5e:	84aa                	mv	s1,a0
    if(pid < 0){
    3b60:	02054c63          	bltz	a0,3b98 <createdelete+0x78>
    if(pid == 0){
    3b64:	c921                	beqz	a0,3bb4 <createdelete+0x94>
  for(pi = 0; pi < NCHILD; pi++){
    3b66:	2905                	addiw	s2,s2,1
    3b68:	ff3917e3          	bne	s2,s3,3b56 <createdelete+0x36>
    3b6c:	4491                	li	s1,4
    wait(&xstatus);
    3b6e:	f6c40513          	addi	a0,s0,-148
    3b72:	00001097          	auipc	ra,0x1
    3b76:	d4e080e7          	jalr	-690(ra) # 48c0 <wait>
    if(xstatus != 0)
    3b7a:	f6c42983          	lw	s3,-148(s0)
    3b7e:	10099463          	bnez	s3,3c86 <createdelete+0x166>
  for(pi = 0; pi < NCHILD; pi++){
    3b82:	34fd                	addiw	s1,s1,-1
    3b84:	f4ed                	bnez	s1,3b6e <createdelete+0x4e>
  name[0] = name[1] = name[2] = 0;
    3b86:	f8040123          	sb	zero,-126(s0)
    3b8a:	03000913          	li	s2,48
    3b8e:	07000b93          	li	s7,112
      } else if((i >= 1 && i < N/2) && fd >= 0){
    3b92:	4b21                	li	s6,8
      if((i == 0 || i >= N/2) && fd < 0){
    3b94:	4c25                	li	s8,9
    3b96:	aa79                	j	3d34 <createdelete+0x214>
      printf("fork failed\n", s);
    3b98:	85e6                	mv	a1,s9
    3b9a:	00002517          	auipc	a0,0x2
    3b9e:	02650513          	addi	a0,a0,38 # 5bc0 <malloc+0xe12>
    3ba2:	00001097          	auipc	ra,0x1
    3ba6:	126080e7          	jalr	294(ra) # 4cc8 <printf>
      exit(1);
    3baa:	4505                	li	a0,1
    3bac:	00001097          	auipc	ra,0x1
    3bb0:	d0c080e7          	jalr	-756(ra) # 48b8 <exit>
      name[0] = 'p' + pi;
    3bb4:	0709091b          	addiw	s2,s2,112
    3bb8:	f9240023          	sb	s2,-128(s0)
      name[2] = '\0';
    3bbc:	f8040123          	sb	zero,-126(s0)
      for(i = 0; i < N; i++){
    3bc0:	4951                	li	s2,20
    3bc2:	a099                	j	3c08 <createdelete+0xe8>
          fd = open(name, O_CREATE | O_RDWR);
    3bc4:	20200593          	li	a1,514
    3bc8:	f8040513          	addi	a0,s0,-128
    3bcc:	00001097          	auipc	ra,0x1
    3bd0:	d2c080e7          	jalr	-724(ra) # 48f8 <open>
          if(fd < 0){
    3bd4:	00054763          	bltz	a0,3be2 <createdelete+0xc2>
          close(fd);
    3bd8:	00001097          	auipc	ra,0x1
    3bdc:	d08080e7          	jalr	-760(ra) # 48e0 <close>
    3be0:	a089                	j	3c22 <createdelete+0x102>
            printf("%s: create %s failed\n", s, name);
    3be2:	f8040613          	addi	a2,s0,-128
    3be6:	85e6                	mv	a1,s9
    3be8:	00003517          	auipc	a0,0x3
    3bec:	bb850513          	addi	a0,a0,-1096 # 67a0 <malloc+0x19f2>
    3bf0:	00001097          	auipc	ra,0x1
    3bf4:	0d8080e7          	jalr	216(ra) # 4cc8 <printf>
            exit(1);
    3bf8:	4505                	li	a0,1
    3bfa:	00001097          	auipc	ra,0x1
    3bfe:	cbe080e7          	jalr	-834(ra) # 48b8 <exit>
      for(i = 0; i < N; i++){
    3c02:	2485                	addiw	s1,s1,1
    3c04:	07248c63          	beq	s1,s2,3c7c <createdelete+0x15c>
        name[1] = '0' + i;
    3c08:	0304859b          	addiw	a1,s1,48
    3c0c:	0ff5f593          	andi	a1,a1,255
    3c10:	f8b400a3          	sb	a1,-127(s0)
        if (strchr(illegal, name[1]) == 0) {
    3c14:	f7040513          	addi	a0,s0,-144
    3c18:	00001097          	auipc	ra,0x1
    3c1c:	aac080e7          	jalr	-1364(ra) # 46c4 <strchr>
    3c20:	d155                	beqz	a0,3bc4 <createdelete+0xa4>
        if(i > 0 && (i % 2 ) == 0){
    3c22:	fe9050e3          	blez	s1,3c02 <createdelete+0xe2>
    3c26:	0014f793          	andi	a5,s1,1
    3c2a:	ffe1                	bnez	a5,3c02 <createdelete+0xe2>
          name[1] = '0' + (i / 2);
    3c2c:	01f4d59b          	srliw	a1,s1,0x1f
    3c30:	9da5                	addw	a1,a1,s1
    3c32:	4015d59b          	sraiw	a1,a1,0x1
    3c36:	0305859b          	addiw	a1,a1,48
    3c3a:	0ff5f593          	andi	a1,a1,255
    3c3e:	f8b400a3          	sb	a1,-127(s0)
          if (strchr(illegal, name[1]) == 0) {
    3c42:	f7040513          	addi	a0,s0,-144
    3c46:	00001097          	auipc	ra,0x1
    3c4a:	a7e080e7          	jalr	-1410(ra) # 46c4 <strchr>
    3c4e:	f955                	bnez	a0,3c02 <createdelete+0xe2>
            if(remove(name) < 0){
    3c50:	f8040513          	addi	a0,s0,-128
    3c54:	00001097          	auipc	ra,0x1
    3c58:	d0c080e7          	jalr	-756(ra) # 4960 <remove>
    3c5c:	fa0553e3          	bgez	a0,3c02 <createdelete+0xe2>
              printf("%s: remove failed\n", s);
    3c60:	85e6                	mv	a1,s9
    3c62:	00003517          	auipc	a0,0x3
    3c66:	89650513          	addi	a0,a0,-1898 # 64f8 <malloc+0x174a>
    3c6a:	00001097          	auipc	ra,0x1
    3c6e:	05e080e7          	jalr	94(ra) # 4cc8 <printf>
              exit(1);
    3c72:	4505                	li	a0,1
    3c74:	00001097          	auipc	ra,0x1
    3c78:	c44080e7          	jalr	-956(ra) # 48b8 <exit>
      exit(0);
    3c7c:	4501                	li	a0,0
    3c7e:	00001097          	auipc	ra,0x1
    3c82:	c3a080e7          	jalr	-966(ra) # 48b8 <exit>
      exit(1);
    3c86:	4505                	li	a0,1
    3c88:	00001097          	auipc	ra,0x1
    3c8c:	c30080e7          	jalr	-976(ra) # 48b8 <exit>
        printf("%s: oops createdelete %s didn't exist\n", s, name);
    3c90:	f8040613          	addi	a2,s0,-128
    3c94:	85e6                	mv	a1,s9
    3c96:	00003517          	auipc	a0,0x3
    3c9a:	b2250513          	addi	a0,a0,-1246 # 67b8 <malloc+0x1a0a>
    3c9e:	00001097          	auipc	ra,0x1
    3ca2:	02a080e7          	jalr	42(ra) # 4cc8 <printf>
        exit(1);
    3ca6:	4505                	li	a0,1
    3ca8:	00001097          	auipc	ra,0x1
    3cac:	c10080e7          	jalr	-1008(ra) # 48b8 <exit>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    3cb0:	055b7963          	bgeu	s6,s5,3d02 <createdelete+0x1e2>
      if(fd >= 0)
    3cb4:	04055263          	bgez	a0,3cf8 <createdelete+0x1d8>
    for(pi = 0; pi < NCHILD; pi++){
    3cb8:	2485                	addiw	s1,s1,1
    3cba:	0ff4f493          	andi	s1,s1,255
    3cbe:	07448463          	beq	s1,s4,3d26 <createdelete+0x206>
      name[0] = 'p' + pi;
    3cc2:	f8940023          	sb	s1,-128(s0)
      name[1] = '0' + i;
    3cc6:	f92400a3          	sb	s2,-127(s0)
      if (strchr(illegal, name[1]) != 0) { continue; }
    3cca:	85ca                	mv	a1,s2
    3ccc:	f7040513          	addi	a0,s0,-144
    3cd0:	00001097          	auipc	ra,0x1
    3cd4:	9f4080e7          	jalr	-1548(ra) # 46c4 <strchr>
    3cd8:	f165                	bnez	a0,3cb8 <createdelete+0x198>
      fd = open(name, 0);
    3cda:	4581                	li	a1,0
    3cdc:	f8040513          	addi	a0,s0,-128
    3ce0:	00001097          	auipc	ra,0x1
    3ce4:	c18080e7          	jalr	-1000(ra) # 48f8 <open>
      if((i == 0 || i >= N/2) && fd < 0){
    3ce8:	00098463          	beqz	s3,3cf0 <createdelete+0x1d0>
    3cec:	fd3c52e3          	bge	s8,s3,3cb0 <createdelete+0x190>
    3cf0:	fa0540e3          	bltz	a0,3c90 <createdelete+0x170>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    3cf4:	015b7963          	bgeu	s6,s5,3d06 <createdelete+0x1e6>
        close(fd);
    3cf8:	00001097          	auipc	ra,0x1
    3cfc:	be8080e7          	jalr	-1048(ra) # 48e0 <close>
    3d00:	bf65                	j	3cb8 <createdelete+0x198>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    3d02:	fa054be3          	bltz	a0,3cb8 <createdelete+0x198>
        printf("%s: oops createdelete %s did exist\n", s, name);
    3d06:	f8040613          	addi	a2,s0,-128
    3d0a:	85e6                	mv	a1,s9
    3d0c:	00003517          	auipc	a0,0x3
    3d10:	ad450513          	addi	a0,a0,-1324 # 67e0 <malloc+0x1a32>
    3d14:	00001097          	auipc	ra,0x1
    3d18:	fb4080e7          	jalr	-76(ra) # 4cc8 <printf>
        exit(1);
    3d1c:	4505                	li	a0,1
    3d1e:	00001097          	auipc	ra,0x1
    3d22:	b9a080e7          	jalr	-1126(ra) # 48b8 <exit>
  for(i = 0; i < N; i++){
    3d26:	2985                	addiw	s3,s3,1
    3d28:	2905                	addiw	s2,s2,1
    3d2a:	0ff97913          	andi	s2,s2,255
    3d2e:	47d1                	li	a5,20
    3d30:	02f98e63          	beq	s3,a5,3d6c <createdelete+0x24c>
    for(pi = 0; pi < NCHILD; pi++){
    3d34:	84de                	mv	s1,s7
      } else if((i >= 1 && i < N/2) && fd >= 0){
    3d36:	fff98a9b          	addiw	s5,s3,-1
    for(pi = 0; pi < NCHILD; pi++){
    3d3a:	07400a13          	li	s4,116
    3d3e:	b751                	j	3cc2 <createdelete+0x1a2>
  for(i = 0; i < N; i++){
    3d40:	2905                	addiw	s2,s2,1
    3d42:	0ff97913          	andi	s2,s2,255
    3d46:	03490c63          	beq	s2,s4,3d7e <createdelete+0x25e>
  name[0] = name[1] = name[2] = 0;
    3d4a:	84d6                	mv	s1,s5
      name[0] = 'p' + pi;
    3d4c:	f8940023          	sb	s1,-128(s0)
      name[1] = '0' + i;
    3d50:	f92400a3          	sb	s2,-127(s0)
      remove(name);
    3d54:	f8040513          	addi	a0,s0,-128
    3d58:	00001097          	auipc	ra,0x1
    3d5c:	c08080e7          	jalr	-1016(ra) # 4960 <remove>
    for(pi = 0; pi < NCHILD; pi++){
    3d60:	2485                	addiw	s1,s1,1
    3d62:	0ff4f493          	andi	s1,s1,255
    3d66:	ff3493e3          	bne	s1,s3,3d4c <createdelete+0x22c>
    3d6a:	bfd9                	j	3d40 <createdelete+0x220>
    3d6c:	03000913          	li	s2,48
  name[0] = name[1] = name[2] = 0;
    3d70:	07000a93          	li	s5,112
    for(pi = 0; pi < NCHILD; pi++){
    3d74:	07400993          	li	s3,116
  for(i = 0; i < N; i++){
    3d78:	04400a13          	li	s4,68
    3d7c:	b7f9                	j	3d4a <createdelete+0x22a>
}
    3d7e:	60ea                	ld	ra,152(sp)
    3d80:	644a                	ld	s0,144(sp)
    3d82:	64aa                	ld	s1,136(sp)
    3d84:	690a                	ld	s2,128(sp)
    3d86:	79e6                	ld	s3,120(sp)
    3d88:	7a46                	ld	s4,112(sp)
    3d8a:	7aa6                	ld	s5,104(sp)
    3d8c:	7b06                	ld	s6,96(sp)
    3d8e:	6be6                	ld	s7,88(sp)
    3d90:	6c46                	ld	s8,80(sp)
    3d92:	6ca6                	ld	s9,72(sp)
    3d94:	610d                	addi	sp,sp,160
    3d96:	8082                	ret

0000000000003d98 <dirtest>:
{
    3d98:	1101                	addi	sp,sp,-32
    3d9a:	ec06                	sd	ra,24(sp)
    3d9c:	e822                	sd	s0,16(sp)
    3d9e:	e426                	sd	s1,8(sp)
    3da0:	1000                	addi	s0,sp,32
    3da2:	84aa                	mv	s1,a0
  printf("mkdir test\n");
    3da4:	00003517          	auipc	a0,0x3
    3da8:	a7450513          	addi	a0,a0,-1420 # 6818 <malloc+0x1a6a>
    3dac:	00001097          	auipc	ra,0x1
    3db0:	f1c080e7          	jalr	-228(ra) # 4cc8 <printf>
  if(mkdir("dir0") < 0){
    3db4:	00003517          	auipc	a0,0x3
    3db8:	a7450513          	addi	a0,a0,-1420 # 6828 <malloc+0x1a7a>
    3dbc:	00001097          	auipc	ra,0x1
    3dc0:	b4c080e7          	jalr	-1204(ra) # 4908 <mkdir>
    3dc4:	04054d63          	bltz	a0,3e1e <dirtest+0x86>
  if(chdir("dir0") < 0){
    3dc8:	00003517          	auipc	a0,0x3
    3dcc:	a6050513          	addi	a0,a0,-1440 # 6828 <malloc+0x1a7a>
    3dd0:	00001097          	auipc	ra,0x1
    3dd4:	b40080e7          	jalr	-1216(ra) # 4910 <chdir>
    3dd8:	06054163          	bltz	a0,3e3a <dirtest+0xa2>
  if(chdir("..") < 0){
    3ddc:	00002517          	auipc	a0,0x2
    3de0:	4e450513          	addi	a0,a0,1252 # 62c0 <malloc+0x1512>
    3de4:	00001097          	auipc	ra,0x1
    3de8:	b2c080e7          	jalr	-1236(ra) # 4910 <chdir>
    3dec:	06054563          	bltz	a0,3e56 <dirtest+0xbe>
  if(remove("dir0") < 0){
    3df0:	00003517          	auipc	a0,0x3
    3df4:	a3850513          	addi	a0,a0,-1480 # 6828 <malloc+0x1a7a>
    3df8:	00001097          	auipc	ra,0x1
    3dfc:	b68080e7          	jalr	-1176(ra) # 4960 <remove>
    3e00:	06054963          	bltz	a0,3e72 <dirtest+0xda>
  printf("%s: mkdir test ok\n");
    3e04:	00003517          	auipc	a0,0x3
    3e08:	a7450513          	addi	a0,a0,-1420 # 6878 <malloc+0x1aca>
    3e0c:	00001097          	auipc	ra,0x1
    3e10:	ebc080e7          	jalr	-324(ra) # 4cc8 <printf>
}
    3e14:	60e2                	ld	ra,24(sp)
    3e16:	6442                	ld	s0,16(sp)
    3e18:	64a2                	ld	s1,8(sp)
    3e1a:	6105                	addi	sp,sp,32
    3e1c:	8082                	ret
    printf("%s: mkdir failed\n", s);
    3e1e:	85a6                	mv	a1,s1
    3e20:	00002517          	auipc	a0,0x2
    3e24:	02050513          	addi	a0,a0,32 # 5e40 <malloc+0x1092>
    3e28:	00001097          	auipc	ra,0x1
    3e2c:	ea0080e7          	jalr	-352(ra) # 4cc8 <printf>
    exit(1);
    3e30:	4505                	li	a0,1
    3e32:	00001097          	auipc	ra,0x1
    3e36:	a86080e7          	jalr	-1402(ra) # 48b8 <exit>
    printf("%s: chdir dir0 failed\n", s);
    3e3a:	85a6                	mv	a1,s1
    3e3c:	00003517          	auipc	a0,0x3
    3e40:	9f450513          	addi	a0,a0,-1548 # 6830 <malloc+0x1a82>
    3e44:	00001097          	auipc	ra,0x1
    3e48:	e84080e7          	jalr	-380(ra) # 4cc8 <printf>
    exit(1);
    3e4c:	4505                	li	a0,1
    3e4e:	00001097          	auipc	ra,0x1
    3e52:	a6a080e7          	jalr	-1430(ra) # 48b8 <exit>
    printf("%s: chdir .. failed\n", s);
    3e56:	85a6                	mv	a1,s1
    3e58:	00003517          	auipc	a0,0x3
    3e5c:	9f050513          	addi	a0,a0,-1552 # 6848 <malloc+0x1a9a>
    3e60:	00001097          	auipc	ra,0x1
    3e64:	e68080e7          	jalr	-408(ra) # 4cc8 <printf>
    exit(1);
    3e68:	4505                	li	a0,1
    3e6a:	00001097          	auipc	ra,0x1
    3e6e:	a4e080e7          	jalr	-1458(ra) # 48b8 <exit>
    printf("%s: remove dir0 failed\n", s);
    3e72:	85a6                	mv	a1,s1
    3e74:	00003517          	auipc	a0,0x3
    3e78:	9ec50513          	addi	a0,a0,-1556 # 6860 <malloc+0x1ab2>
    3e7c:	00001097          	auipc	ra,0x1
    3e80:	e4c080e7          	jalr	-436(ra) # 4cc8 <printf>
    exit(1);
    3e84:	4505                	li	a0,1
    3e86:	00001097          	auipc	ra,0x1
    3e8a:	a32080e7          	jalr	-1486(ra) # 48b8 <exit>

0000000000003e8e <fourteen>:
{
    3e8e:	1101                	addi	sp,sp,-32
    3e90:	ec06                	sd	ra,24(sp)
    3e92:	e822                	sd	s0,16(sp)
    3e94:	e426                	sd	s1,8(sp)
    3e96:	1000                	addi	s0,sp,32
    3e98:	84aa                	mv	s1,a0
  if(mkdir("12345678901234") != 0){
    3e9a:	00003517          	auipc	a0,0x3
    3e9e:	bc650513          	addi	a0,a0,-1082 # 6a60 <malloc+0x1cb2>
    3ea2:	00001097          	auipc	ra,0x1
    3ea6:	a66080e7          	jalr	-1434(ra) # 4908 <mkdir>
    3eaa:	e165                	bnez	a0,3f8a <fourteen+0xfc>
  if(mkdir("12345678901234/123456789012345") != 0){
    3eac:	00003517          	auipc	a0,0x3
    3eb0:	a0c50513          	addi	a0,a0,-1524 # 68b8 <malloc+0x1b0a>
    3eb4:	00001097          	auipc	ra,0x1
    3eb8:	a54080e7          	jalr	-1452(ra) # 4908 <mkdir>
    3ebc:	e56d                	bnez	a0,3fa6 <fourteen+0x118>
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    3ebe:	20000593          	li	a1,512
    3ec2:	00003517          	auipc	a0,0x3
    3ec6:	a4e50513          	addi	a0,a0,-1458 # 6910 <malloc+0x1b62>
    3eca:	00001097          	auipc	ra,0x1
    3ece:	a2e080e7          	jalr	-1490(ra) # 48f8 <open>
  if(fd < 0){
    3ed2:	0e054863          	bltz	a0,3fc2 <fourteen+0x134>
  close(fd);
    3ed6:	00001097          	auipc	ra,0x1
    3eda:	a0a080e7          	jalr	-1526(ra) # 48e0 <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    3ede:	4581                	li	a1,0
    3ee0:	00003517          	auipc	a0,0x3
    3ee4:	aa850513          	addi	a0,a0,-1368 # 6988 <malloc+0x1bda>
    3ee8:	00001097          	auipc	ra,0x1
    3eec:	a10080e7          	jalr	-1520(ra) # 48f8 <open>
  if(fd < 0){
    3ef0:	0e054763          	bltz	a0,3fde <fourteen+0x150>
  close(fd);
    3ef4:	00001097          	auipc	ra,0x1
    3ef8:	9ec080e7          	jalr	-1556(ra) # 48e0 <close>
  if(mkdir("12345678901234/12345678901234") == 0){
    3efc:	00003517          	auipc	a0,0x3
    3f00:	afc50513          	addi	a0,a0,-1284 # 69f8 <malloc+0x1c4a>
    3f04:	00001097          	auipc	ra,0x1
    3f08:	a04080e7          	jalr	-1532(ra) # 4908 <mkdir>
    3f0c:	c57d                	beqz	a0,3ffa <fourteen+0x16c>
  if(mkdir("123456789012345/12345678901234") == 0){
    3f0e:	00003517          	auipc	a0,0x3
    3f12:	b4250513          	addi	a0,a0,-1214 # 6a50 <malloc+0x1ca2>
    3f16:	00001097          	auipc	ra,0x1
    3f1a:	9f2080e7          	jalr	-1550(ra) # 4908 <mkdir>
    3f1e:	cd65                	beqz	a0,4016 <fourteen+0x188>
  remove("123456789012345/12345678901234");
    3f20:	00003517          	auipc	a0,0x3
    3f24:	b3050513          	addi	a0,a0,-1232 # 6a50 <malloc+0x1ca2>
    3f28:	00001097          	auipc	ra,0x1
    3f2c:	a38080e7          	jalr	-1480(ra) # 4960 <remove>
  remove("12345678901234/12345678901234");
    3f30:	00003517          	auipc	a0,0x3
    3f34:	ac850513          	addi	a0,a0,-1336 # 69f8 <malloc+0x1c4a>
    3f38:	00001097          	auipc	ra,0x1
    3f3c:	a28080e7          	jalr	-1496(ra) # 4960 <remove>
  remove("12345678901234/12345678901234/12345678901234");
    3f40:	00003517          	auipc	a0,0x3
    3f44:	a4850513          	addi	a0,a0,-1464 # 6988 <malloc+0x1bda>
    3f48:	00001097          	auipc	ra,0x1
    3f4c:	a18080e7          	jalr	-1512(ra) # 4960 <remove>
  remove("123456789012345/123456789012345/123456789012345");
    3f50:	00003517          	auipc	a0,0x3
    3f54:	9c050513          	addi	a0,a0,-1600 # 6910 <malloc+0x1b62>
    3f58:	00001097          	auipc	ra,0x1
    3f5c:	a08080e7          	jalr	-1528(ra) # 4960 <remove>
  remove("12345678901234/123456789012345");
    3f60:	00003517          	auipc	a0,0x3
    3f64:	95850513          	addi	a0,a0,-1704 # 68b8 <malloc+0x1b0a>
    3f68:	00001097          	auipc	ra,0x1
    3f6c:	9f8080e7          	jalr	-1544(ra) # 4960 <remove>
  remove("12345678901234");
    3f70:	00003517          	auipc	a0,0x3
    3f74:	af050513          	addi	a0,a0,-1296 # 6a60 <malloc+0x1cb2>
    3f78:	00001097          	auipc	ra,0x1
    3f7c:	9e8080e7          	jalr	-1560(ra) # 4960 <remove>
}
    3f80:	60e2                	ld	ra,24(sp)
    3f82:	6442                	ld	s0,16(sp)
    3f84:	64a2                	ld	s1,8(sp)
    3f86:	6105                	addi	sp,sp,32
    3f88:	8082                	ret
    printf("%s: mkdir 12345678901234 failed\n", s);
    3f8a:	85a6                	mv	a1,s1
    3f8c:	00003517          	auipc	a0,0x3
    3f90:	90450513          	addi	a0,a0,-1788 # 6890 <malloc+0x1ae2>
    3f94:	00001097          	auipc	ra,0x1
    3f98:	d34080e7          	jalr	-716(ra) # 4cc8 <printf>
    exit(1);
    3f9c:	4505                	li	a0,1
    3f9e:	00001097          	auipc	ra,0x1
    3fa2:	91a080e7          	jalr	-1766(ra) # 48b8 <exit>
    printf("%s: mkdir 12345678901234/123456789012345 failed\n", s);
    3fa6:	85a6                	mv	a1,s1
    3fa8:	00003517          	auipc	a0,0x3
    3fac:	93050513          	addi	a0,a0,-1744 # 68d8 <malloc+0x1b2a>
    3fb0:	00001097          	auipc	ra,0x1
    3fb4:	d18080e7          	jalr	-744(ra) # 4cc8 <printf>
    exit(1);
    3fb8:	4505                	li	a0,1
    3fba:	00001097          	auipc	ra,0x1
    3fbe:	8fe080e7          	jalr	-1794(ra) # 48b8 <exit>
    printf("%s: create 123456789012345/123456789012345/123456789012345 failed\n", s);
    3fc2:	85a6                	mv	a1,s1
    3fc4:	00003517          	auipc	a0,0x3
    3fc8:	97c50513          	addi	a0,a0,-1668 # 6940 <malloc+0x1b92>
    3fcc:	00001097          	auipc	ra,0x1
    3fd0:	cfc080e7          	jalr	-772(ra) # 4cc8 <printf>
    exit(1);
    3fd4:	4505                	li	a0,1
    3fd6:	00001097          	auipc	ra,0x1
    3fda:	8e2080e7          	jalr	-1822(ra) # 48b8 <exit>
    printf("%s: open 12345678901234/12345678901234/12345678901234 failed\n", s);
    3fde:	85a6                	mv	a1,s1
    3fe0:	00003517          	auipc	a0,0x3
    3fe4:	9d850513          	addi	a0,a0,-1576 # 69b8 <malloc+0x1c0a>
    3fe8:	00001097          	auipc	ra,0x1
    3fec:	ce0080e7          	jalr	-800(ra) # 4cc8 <printf>
    exit(1);
    3ff0:	4505                	li	a0,1
    3ff2:	00001097          	auipc	ra,0x1
    3ff6:	8c6080e7          	jalr	-1850(ra) # 48b8 <exit>
    printf("%s: mkdir 12345678901234/12345678901234 succeeded!\n", s);
    3ffa:	85a6                	mv	a1,s1
    3ffc:	00003517          	auipc	a0,0x3
    4000:	a1c50513          	addi	a0,a0,-1508 # 6a18 <malloc+0x1c6a>
    4004:	00001097          	auipc	ra,0x1
    4008:	cc4080e7          	jalr	-828(ra) # 4cc8 <printf>
    exit(1);
    400c:	4505                	li	a0,1
    400e:	00001097          	auipc	ra,0x1
    4012:	8aa080e7          	jalr	-1878(ra) # 48b8 <exit>
    printf("%s: mkdir 12345678901234/123456789012345 succeeded!\n", s);
    4016:	85a6                	mv	a1,s1
    4018:	00003517          	auipc	a0,0x3
    401c:	a5850513          	addi	a0,a0,-1448 # 6a70 <malloc+0x1cc2>
    4020:	00001097          	auipc	ra,0x1
    4024:	ca8080e7          	jalr	-856(ra) # 4cc8 <printf>
    exit(1);
    4028:	4505                	li	a0,1
    402a:	00001097          	auipc	ra,0x1
    402e:	88e080e7          	jalr	-1906(ra) # 48b8 <exit>

0000000000004032 <fsfull>:
{
    4032:	7171                	addi	sp,sp,-176
    4034:	f506                	sd	ra,168(sp)
    4036:	f122                	sd	s0,160(sp)
    4038:	ed26                	sd	s1,152(sp)
    403a:	e94a                	sd	s2,144(sp)
    403c:	e54e                	sd	s3,136(sp)
    403e:	e152                	sd	s4,128(sp)
    4040:	fcd6                	sd	s5,120(sp)
    4042:	f8da                	sd	s6,112(sp)
    4044:	f4de                	sd	s7,104(sp)
    4046:	f0e2                	sd	s8,96(sp)
    4048:	ece6                	sd	s9,88(sp)
    404a:	e8ea                	sd	s10,80(sp)
    404c:	e4ee                	sd	s11,72(sp)
    404e:	1900                	addi	s0,sp,176
  printf("fsfull test\n");
    4050:	00003517          	auipc	a0,0x3
    4054:	a5850513          	addi	a0,a0,-1448 # 6aa8 <malloc+0x1cfa>
    4058:	00001097          	auipc	ra,0x1
    405c:	c70080e7          	jalr	-912(ra) # 4cc8 <printf>
  for(nfiles = 0; ; nfiles++){
    4060:	4481                	li	s1,0
    name[0] = 'f';
    4062:	06600d13          	li	s10,102
    name[1] = '0' + nfiles / 1000;
    4066:	3e800c13          	li	s8,1000
    name[2] = '0' + (nfiles % 1000) / 100;
    406a:	06400b93          	li	s7,100
    name[3] = '0' + (nfiles % 100) / 10;
    406e:	4b29                	li	s6,10
    printf("%s: writing %s\n", name);
    4070:	00003c97          	auipc	s9,0x3
    4074:	a48c8c93          	addi	s9,s9,-1464 # 6ab8 <malloc+0x1d0a>
    int total = 0;
    4078:	4d81                	li	s11,0
      int cc = write(fd, buf, BSIZE);
    407a:	00006a17          	auipc	s4,0x6
    407e:	7f6a0a13          	addi	s4,s4,2038 # a870 <buf>
    name[0] = 'f';
    4082:	f5a40823          	sb	s10,-176(s0)
    name[1] = '0' + nfiles / 1000;
    4086:	0384c7bb          	divw	a5,s1,s8
    408a:	0307879b          	addiw	a5,a5,48
    408e:	f4f408a3          	sb	a5,-175(s0)
    name[2] = '0' + (nfiles % 1000) / 100;
    4092:	0384e7bb          	remw	a5,s1,s8
    4096:	0377c7bb          	divw	a5,a5,s7
    409a:	0307879b          	addiw	a5,a5,48
    409e:	f4f40923          	sb	a5,-174(s0)
    name[3] = '0' + (nfiles % 100) / 10;
    40a2:	0374e7bb          	remw	a5,s1,s7
    40a6:	0367c7bb          	divw	a5,a5,s6
    40aa:	0307879b          	addiw	a5,a5,48
    40ae:	f4f409a3          	sb	a5,-173(s0)
    name[4] = '0' + (nfiles % 10);
    40b2:	0364e7bb          	remw	a5,s1,s6
    40b6:	0307879b          	addiw	a5,a5,48
    40ba:	f4f40a23          	sb	a5,-172(s0)
    name[5] = '\0';
    40be:	f4040aa3          	sb	zero,-171(s0)
    printf("%s: writing %s\n", name);
    40c2:	f5040593          	addi	a1,s0,-176
    40c6:	8566                	mv	a0,s9
    40c8:	00001097          	auipc	ra,0x1
    40cc:	c00080e7          	jalr	-1024(ra) # 4cc8 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    40d0:	20200593          	li	a1,514
    40d4:	f5040513          	addi	a0,s0,-176
    40d8:	00001097          	auipc	ra,0x1
    40dc:	820080e7          	jalr	-2016(ra) # 48f8 <open>
    40e0:	892a                	mv	s2,a0
    if(fd < 0){
    40e2:	0a055663          	bgez	a0,418e <fsfull+0x15c>
      printf("%s: open %s failed\n", name);
    40e6:	f5040593          	addi	a1,s0,-176
    40ea:	00003517          	auipc	a0,0x3
    40ee:	9de50513          	addi	a0,a0,-1570 # 6ac8 <malloc+0x1d1a>
    40f2:	00001097          	auipc	ra,0x1
    40f6:	bd6080e7          	jalr	-1066(ra) # 4cc8 <printf>
  while(nfiles >= 0){
    40fa:	0604c363          	bltz	s1,4160 <fsfull+0x12e>
    name[0] = 'f';
    40fe:	06600b13          	li	s6,102
    name[1] = '0' + nfiles / 1000;
    4102:	3e800a13          	li	s4,1000
    name[2] = '0' + (nfiles % 1000) / 100;
    4106:	06400993          	li	s3,100
    name[3] = '0' + (nfiles % 100) / 10;
    410a:	4929                	li	s2,10
  while(nfiles >= 0){
    410c:	5afd                	li	s5,-1
    name[0] = 'f';
    410e:	f5640823          	sb	s6,-176(s0)
    name[1] = '0' + nfiles / 1000;
    4112:	0344c7bb          	divw	a5,s1,s4
    4116:	0307879b          	addiw	a5,a5,48
    411a:	f4f408a3          	sb	a5,-175(s0)
    name[2] = '0' + (nfiles % 1000) / 100;
    411e:	0344e7bb          	remw	a5,s1,s4
    4122:	0337c7bb          	divw	a5,a5,s3
    4126:	0307879b          	addiw	a5,a5,48
    412a:	f4f40923          	sb	a5,-174(s0)
    name[3] = '0' + (nfiles % 100) / 10;
    412e:	0334e7bb          	remw	a5,s1,s3
    4132:	0327c7bb          	divw	a5,a5,s2
    4136:	0307879b          	addiw	a5,a5,48
    413a:	f4f409a3          	sb	a5,-173(s0)
    name[4] = '0' + (nfiles % 10);
    413e:	0324e7bb          	remw	a5,s1,s2
    4142:	0307879b          	addiw	a5,a5,48
    4146:	f4f40a23          	sb	a5,-172(s0)
    name[5] = '\0';
    414a:	f4040aa3          	sb	zero,-171(s0)
    remove(name);
    414e:	f5040513          	addi	a0,s0,-176
    4152:	00001097          	auipc	ra,0x1
    4156:	80e080e7          	jalr	-2034(ra) # 4960 <remove>
    nfiles--;
    415a:	34fd                	addiw	s1,s1,-1
  while(nfiles >= 0){
    415c:	fb5499e3          	bne	s1,s5,410e <fsfull+0xdc>
  printf("fsfull test finished\n");
    4160:	00003517          	auipc	a0,0x3
    4164:	99850513          	addi	a0,a0,-1640 # 6af8 <malloc+0x1d4a>
    4168:	00001097          	auipc	ra,0x1
    416c:	b60080e7          	jalr	-1184(ra) # 4cc8 <printf>
}
    4170:	70aa                	ld	ra,168(sp)
    4172:	740a                	ld	s0,160(sp)
    4174:	64ea                	ld	s1,152(sp)
    4176:	694a                	ld	s2,144(sp)
    4178:	69aa                	ld	s3,136(sp)
    417a:	6a0a                	ld	s4,128(sp)
    417c:	7ae6                	ld	s5,120(sp)
    417e:	7b46                	ld	s6,112(sp)
    4180:	7ba6                	ld	s7,104(sp)
    4182:	7c06                	ld	s8,96(sp)
    4184:	6ce6                	ld	s9,88(sp)
    4186:	6d46                	ld	s10,80(sp)
    4188:	6da6                	ld	s11,72(sp)
    418a:	614d                	addi	sp,sp,176
    418c:	8082                	ret
    int total = 0;
    418e:	89ee                	mv	s3,s11
      if(cc < BSIZE)
    4190:	1ff00a93          	li	s5,511
      int cc = write(fd, buf, BSIZE);
    4194:	20000613          	li	a2,512
    4198:	85d2                	mv	a1,s4
    419a:	854a                	mv	a0,s2
    419c:	00000097          	auipc	ra,0x0
    41a0:	73c080e7          	jalr	1852(ra) # 48d8 <write>
      if(cc < BSIZE)
    41a4:	00aad563          	bge	s5,a0,41ae <fsfull+0x17c>
      total += cc;
    41a8:	00a989bb          	addw	s3,s3,a0
    while(1){
    41ac:	b7e5                	j	4194 <fsfull+0x162>
    printf("%s: wrote %d bytes\n", total);
    41ae:	85ce                	mv	a1,s3
    41b0:	00003517          	auipc	a0,0x3
    41b4:	93050513          	addi	a0,a0,-1744 # 6ae0 <malloc+0x1d32>
    41b8:	00001097          	auipc	ra,0x1
    41bc:	b10080e7          	jalr	-1264(ra) # 4cc8 <printf>
    close(fd);
    41c0:	854a                	mv	a0,s2
    41c2:	00000097          	auipc	ra,0x0
    41c6:	71e080e7          	jalr	1822(ra) # 48e0 <close>
    if(total == 0)
    41ca:	f20988e3          	beqz	s3,40fa <fsfull+0xc8>
  for(nfiles = 0; ; nfiles++){
    41ce:	2485                	addiw	s1,s1,1
    41d0:	bd4d                	j	4082 <fsfull+0x50>

00000000000041d2 <rand>:
{
    41d2:	1141                	addi	sp,sp,-16
    41d4:	e422                	sd	s0,8(sp)
    41d6:	0800                	addi	s0,sp,16
  randstate = randstate * 1664525 + 1013904223;
    41d8:	00003717          	auipc	a4,0x3
    41dc:	e6870713          	addi	a4,a4,-408 # 7040 <randstate>
    41e0:	6308                	ld	a0,0(a4)
    41e2:	001967b7          	lui	a5,0x196
    41e6:	60d78793          	addi	a5,a5,1549 # 19660d <__BSS_END__+0x18a525>
    41ea:	02f50533          	mul	a0,a0,a5
    41ee:	3c6ef7b7          	lui	a5,0x3c6ef
    41f2:	35f78793          	addi	a5,a5,863 # 3c6ef35f <__BSS_END__+0x3c6e3277>
    41f6:	953e                	add	a0,a0,a5
    41f8:	e308                	sd	a0,0(a4)
}
    41fa:	2501                	sext.w	a0,a0
    41fc:	6422                	ld	s0,8(sp)
    41fe:	0141                	addi	sp,sp,16
    4200:	8082                	ret

0000000000004202 <countfree>:
// because out of memory with lazy allocation results in the process
// taking a fault and being killed, fork and report back.
//
int
countfree()
{
    4202:	7139                	addi	sp,sp,-64
    4204:	fc06                	sd	ra,56(sp)
    4206:	f822                	sd	s0,48(sp)
    4208:	f426                	sd	s1,40(sp)
    420a:	f04a                	sd	s2,32(sp)
    420c:	ec4e                	sd	s3,24(sp)
    420e:	0080                	addi	s0,sp,64
  int fds[2];

  if(pipe(fds) < 0){
    4210:	fc840513          	addi	a0,s0,-56
    4214:	00000097          	auipc	ra,0x0
    4218:	6b4080e7          	jalr	1716(ra) # 48c8 <pipe>
    421c:	06054863          	bltz	a0,428c <countfree+0x8a>
    printf("pipe() failed in countfree()\n");
    exit(1);
  }
  
  int pid = fork();
    4220:	00000097          	auipc	ra,0x0
    4224:	690080e7          	jalr	1680(ra) # 48b0 <fork>

  if(pid < 0){
    4228:	06054f63          	bltz	a0,42a6 <countfree+0xa4>
    printf("fork failed in countfree()\n");
    exit(1);
  }

  if(pid == 0){
    422c:	ed59                	bnez	a0,42ca <countfree+0xc8>
    close(fds[0]);
    422e:	fc842503          	lw	a0,-56(s0)
    4232:	00000097          	auipc	ra,0x0
    4236:	6ae080e7          	jalr	1710(ra) # 48e0 <close>
    
    while(1){
      uint64 a = (uint64) sbrk(4096);
      if(a == 0xffffffffffffffff){
    423a:	54fd                	li	s1,-1
        break;
      }

      // modify the memory to make sure it's really allocated.
      *(char *)(a + 4096 - 1) = 1;
    423c:	4985                	li	s3,1

      // report back one more page.
      if(write(fds[1], "x", 1) != 1){
    423e:	00001917          	auipc	s2,0x1
    4242:	00290913          	addi	s2,s2,2 # 5240 <malloc+0x492>
      uint64 a = (uint64) sbrk(4096);
    4246:	6505                	lui	a0,0x1
    4248:	00000097          	auipc	ra,0x0
    424c:	6e0080e7          	jalr	1760(ra) # 4928 <sbrk>
      if(a == 0xffffffffffffffff){
    4250:	06950863          	beq	a0,s1,42c0 <countfree+0xbe>
      *(char *)(a + 4096 - 1) = 1;
    4254:	6785                	lui	a5,0x1
    4256:	953e                	add	a0,a0,a5
    4258:	ff350fa3          	sb	s3,-1(a0) # fff <copyinstr2+0xdb>
      if(write(fds[1], "x", 1) != 1){
    425c:	4605                	li	a2,1
    425e:	85ca                	mv	a1,s2
    4260:	fcc42503          	lw	a0,-52(s0)
    4264:	00000097          	auipc	ra,0x0
    4268:	674080e7          	jalr	1652(ra) # 48d8 <write>
    426c:	4785                	li	a5,1
    426e:	fcf50ce3          	beq	a0,a5,4246 <countfree+0x44>
        printf("write() failed in countfree()\n");
    4272:	00003517          	auipc	a0,0x3
    4276:	8de50513          	addi	a0,a0,-1826 # 6b50 <malloc+0x1da2>
    427a:	00001097          	auipc	ra,0x1
    427e:	a4e080e7          	jalr	-1458(ra) # 4cc8 <printf>
        exit(1);
    4282:	4505                	li	a0,1
    4284:	00000097          	auipc	ra,0x0
    4288:	634080e7          	jalr	1588(ra) # 48b8 <exit>
    printf("pipe() failed in countfree()\n");
    428c:	00003517          	auipc	a0,0x3
    4290:	88450513          	addi	a0,a0,-1916 # 6b10 <malloc+0x1d62>
    4294:	00001097          	auipc	ra,0x1
    4298:	a34080e7          	jalr	-1484(ra) # 4cc8 <printf>
    exit(1);
    429c:	4505                	li	a0,1
    429e:	00000097          	auipc	ra,0x0
    42a2:	61a080e7          	jalr	1562(ra) # 48b8 <exit>
    printf("fork failed in countfree()\n");
    42a6:	00003517          	auipc	a0,0x3
    42aa:	88a50513          	addi	a0,a0,-1910 # 6b30 <malloc+0x1d82>
    42ae:	00001097          	auipc	ra,0x1
    42b2:	a1a080e7          	jalr	-1510(ra) # 4cc8 <printf>
    exit(1);
    42b6:	4505                	li	a0,1
    42b8:	00000097          	auipc	ra,0x0
    42bc:	600080e7          	jalr	1536(ra) # 48b8 <exit>
      }
    }

    exit(0);
    42c0:	4501                	li	a0,0
    42c2:	00000097          	auipc	ra,0x0
    42c6:	5f6080e7          	jalr	1526(ra) # 48b8 <exit>
  }

  close(fds[1]);
    42ca:	fcc42503          	lw	a0,-52(s0)
    42ce:	00000097          	auipc	ra,0x0
    42d2:	612080e7          	jalr	1554(ra) # 48e0 <close>

  int n = 0;
    42d6:	4481                	li	s1,0
  while(1){
    char c;
    int cc = read(fds[0], &c, 1);
    42d8:	4605                	li	a2,1
    42da:	fc740593          	addi	a1,s0,-57
    42de:	fc842503          	lw	a0,-56(s0)
    42e2:	00000097          	auipc	ra,0x0
    42e6:	5ee080e7          	jalr	1518(ra) # 48d0 <read>
    if(cc < 0){
    42ea:	00054563          	bltz	a0,42f4 <countfree+0xf2>
      printf("read() failed in countfree()\n");
      exit(1);
    }
    if(cc == 0)
    42ee:	c105                	beqz	a0,430e <countfree+0x10c>
      break;
    n += 1;
    42f0:	2485                	addiw	s1,s1,1
  while(1){
    42f2:	b7dd                	j	42d8 <countfree+0xd6>
      printf("read() failed in countfree()\n");
    42f4:	00003517          	auipc	a0,0x3
    42f8:	87c50513          	addi	a0,a0,-1924 # 6b70 <malloc+0x1dc2>
    42fc:	00001097          	auipc	ra,0x1
    4300:	9cc080e7          	jalr	-1588(ra) # 4cc8 <printf>
      exit(1);
    4304:	4505                	li	a0,1
    4306:	00000097          	auipc	ra,0x0
    430a:	5b2080e7          	jalr	1458(ra) # 48b8 <exit>
  }

  close(fds[0]);
    430e:	fc842503          	lw	a0,-56(s0)
    4312:	00000097          	auipc	ra,0x0
    4316:	5ce080e7          	jalr	1486(ra) # 48e0 <close>
  wait((int*)0);
    431a:	4501                	li	a0,0
    431c:	00000097          	auipc	ra,0x0
    4320:	5a4080e7          	jalr	1444(ra) # 48c0 <wait>
  
  return n;
}
    4324:	8526                	mv	a0,s1
    4326:	70e2                	ld	ra,56(sp)
    4328:	7442                	ld	s0,48(sp)
    432a:	74a2                	ld	s1,40(sp)
    432c:	7902                	ld	s2,32(sp)
    432e:	69e2                	ld	s3,24(sp)
    4330:	6121                	addi	sp,sp,64
    4332:	8082                	ret

0000000000004334 <run>:

// run each test in its own process. run returns 1 if child's exit()
// indicates success.
int
run(void f(char *), char *s) {
    4334:	7179                	addi	sp,sp,-48
    4336:	f406                	sd	ra,40(sp)
    4338:	f022                	sd	s0,32(sp)
    433a:	ec26                	sd	s1,24(sp)
    433c:	e84a                	sd	s2,16(sp)
    433e:	1800                	addi	s0,sp,48
    4340:	84aa                	mv	s1,a0
    4342:	892e                	mv	s2,a1
  int pid;
  int xstatus;

  printf("test %s: ", s);
    4344:	00003517          	auipc	a0,0x3
    4348:	84c50513          	addi	a0,a0,-1972 # 6b90 <malloc+0x1de2>
    434c:	00001097          	auipc	ra,0x1
    4350:	97c080e7          	jalr	-1668(ra) # 4cc8 <printf>
  if((pid = fork()) < 0) {
    4354:	00000097          	auipc	ra,0x0
    4358:	55c080e7          	jalr	1372(ra) # 48b0 <fork>
    435c:	02054e63          	bltz	a0,4398 <run+0x64>
    printf("runtest: fork error\n");
    exit(1);
  }
  if(pid == 0) {
    4360:	c929                	beqz	a0,43b2 <run+0x7e>
    f(s);
    exit(0);
  } else {
    wait(&xstatus);
    4362:	fdc40513          	addi	a0,s0,-36
    4366:	00000097          	auipc	ra,0x0
    436a:	55a080e7          	jalr	1370(ra) # 48c0 <wait>
    if(xstatus != 0) 
    436e:	fdc42783          	lw	a5,-36(s0)
    4372:	c7b9                	beqz	a5,43c0 <run+0x8c>
      printf("FAILED\n");
    4374:	00003517          	auipc	a0,0x3
    4378:	84450513          	addi	a0,a0,-1980 # 6bb8 <malloc+0x1e0a>
    437c:	00001097          	auipc	ra,0x1
    4380:	94c080e7          	jalr	-1716(ra) # 4cc8 <printf>
    else
      printf("OK\n");
    return xstatus == 0;
    4384:	fdc42503          	lw	a0,-36(s0)
  }
}
    4388:	00153513          	seqz	a0,a0
    438c:	70a2                	ld	ra,40(sp)
    438e:	7402                	ld	s0,32(sp)
    4390:	64e2                	ld	s1,24(sp)
    4392:	6942                	ld	s2,16(sp)
    4394:	6145                	addi	sp,sp,48
    4396:	8082                	ret
    printf("runtest: fork error\n");
    4398:	00003517          	auipc	a0,0x3
    439c:	80850513          	addi	a0,a0,-2040 # 6ba0 <malloc+0x1df2>
    43a0:	00001097          	auipc	ra,0x1
    43a4:	928080e7          	jalr	-1752(ra) # 4cc8 <printf>
    exit(1);
    43a8:	4505                	li	a0,1
    43aa:	00000097          	auipc	ra,0x0
    43ae:	50e080e7          	jalr	1294(ra) # 48b8 <exit>
    f(s);
    43b2:	854a                	mv	a0,s2
    43b4:	9482                	jalr	s1
    exit(0);
    43b6:	4501                	li	a0,0
    43b8:	00000097          	auipc	ra,0x0
    43bc:	500080e7          	jalr	1280(ra) # 48b8 <exit>
      printf("OK\n");
    43c0:	00003517          	auipc	a0,0x3
    43c4:	80050513          	addi	a0,a0,-2048 # 6bc0 <malloc+0x1e12>
    43c8:	00001097          	auipc	ra,0x1
    43cc:	900080e7          	jalr	-1792(ra) # 4cc8 <printf>
    43d0:	bf55                	j	4384 <run+0x50>

00000000000043d2 <main>:

int
main(int argc, char *argv[])
{
    43d2:	c8010113          	addi	sp,sp,-896
    43d6:	36113c23          	sd	ra,888(sp)
    43da:	36813823          	sd	s0,880(sp)
    43de:	36913423          	sd	s1,872(sp)
    43e2:	37213023          	sd	s2,864(sp)
    43e6:	35313c23          	sd	s3,856(sp)
    43ea:	35413823          	sd	s4,848(sp)
    43ee:	35513423          	sd	s5,840(sp)
    43f2:	35613023          	sd	s6,832(sp)
    43f6:	0700                	addi	s0,sp,896
    43f8:	89aa                	mv	s3,a0
  int continuous = 0;
  char *justone = 0;

  if(argc == 2 && strcmp(argv[1], "-c") == 0){
    43fa:	4789                	li	a5,2
    43fc:	08f50763          	beq	a0,a5,448a <main+0xb8>
    continuous = 1;
  } else if(argc == 2 && strcmp(argv[1], "-C") == 0){
    continuous = 2;
  } else if(argc == 2 && argv[1][0] != '-'){
    justone = argv[1];
  } else if(argc > 1){
    4400:	4785                	li	a5,1
  char *justone = 0;
    4402:	4901                	li	s2,0
  } else if(argc > 1){
    4404:	0ca7c163          	blt	a5,a0,44c6 <main+0xf4>
  }
  
  struct test {
    void (*f)(char *);
    char *s;
  } tests[] = {
    4408:	00003797          	auipc	a5,0x3
    440c:	8d078793          	addi	a5,a5,-1840 # 6cd8 <malloc+0x1f2a>
    4410:	c8040713          	addi	a4,s0,-896
    4414:	00003817          	auipc	a6,0x3
    4418:	c0480813          	addi	a6,a6,-1020 # 7018 <malloc+0x226a>
    441c:	6388                	ld	a0,0(a5)
    441e:	678c                	ld	a1,8(a5)
    4420:	6b90                	ld	a2,16(a5)
    4422:	6f94                	ld	a3,24(a5)
    4424:	e308                	sd	a0,0(a4)
    4426:	e70c                	sd	a1,8(a4)
    4428:	eb10                	sd	a2,16(a4)
    442a:	ef14                	sd	a3,24(a4)
    442c:	02078793          	addi	a5,a5,32
    4430:	02070713          	addi	a4,a4,32
    4434:	ff0794e3          	bne	a5,a6,441c <main+0x4a>
          exit(1);
      }
    }
  }

  printf("usertests starting\n");
    4438:	00003517          	auipc	a0,0x3
    443c:	84050513          	addi	a0,a0,-1984 # 6c78 <malloc+0x1eca>
    4440:	00001097          	auipc	ra,0x1
    4444:	888080e7          	jalr	-1912(ra) # 4cc8 <printf>
  int free0 = countfree();
    4448:	00000097          	auipc	ra,0x0
    444c:	dba080e7          	jalr	-582(ra) # 4202 <countfree>
    4450:	8a2a                	mv	s4,a0
  int free1 = 0;
  int fail = 0;
  for (struct test *t = tests; t->s != 0; t++) {
    4452:	c8843503          	ld	a0,-888(s0)
    4456:	c8040493          	addi	s1,s0,-896
  int fail = 0;
    445a:	4981                	li	s3,0
    if((justone == 0) || strcmp(t->s, justone) == 0) {
      if(!run(t->f, t->s))
        fail = 1;
    445c:	4a85                	li	s5,1
  for (struct test *t = tests; t->s != 0; t++) {
    445e:	e55d                	bnez	a0,450c <main+0x13a>
  }

  if(fail){
    printf("SOME TESTS FAILED\n");
    exit(1);
  } else if((free1 = countfree()) < free0){
    4460:	00000097          	auipc	ra,0x0
    4464:	da2080e7          	jalr	-606(ra) # 4202 <countfree>
    4468:	85aa                	mv	a1,a0
    446a:	0f455163          	bge	a0,s4,454c <main+0x17a>
    printf("FAILED -- lost some free pages %d (out of %d)\n", free1, free0);
    446e:	8652                	mv	a2,s4
    4470:	00002517          	auipc	a0,0x2
    4474:	7c050513          	addi	a0,a0,1984 # 6c30 <malloc+0x1e82>
    4478:	00001097          	auipc	ra,0x1
    447c:	850080e7          	jalr	-1968(ra) # 4cc8 <printf>
    exit(1);
    4480:	4505                	li	a0,1
    4482:	00000097          	auipc	ra,0x0
    4486:	436080e7          	jalr	1078(ra) # 48b8 <exit>
    448a:	84ae                	mv	s1,a1
  if(argc == 2 && strcmp(argv[1], "-c") == 0){
    448c:	00002597          	auipc	a1,0x2
    4490:	73c58593          	addi	a1,a1,1852 # 6bc8 <malloc+0x1e1a>
    4494:	6488                	ld	a0,8(s1)
    4496:	00000097          	auipc	ra,0x0
    449a:	1b2080e7          	jalr	434(ra) # 4648 <strcmp>
    449e:	10050563          	beqz	a0,45a8 <main+0x1d6>
  } else if(argc == 2 && strcmp(argv[1], "-C") == 0){
    44a2:	00003597          	auipc	a1,0x3
    44a6:	80e58593          	addi	a1,a1,-2034 # 6cb0 <malloc+0x1f02>
    44aa:	6488                	ld	a0,8(s1)
    44ac:	00000097          	auipc	ra,0x0
    44b0:	19c080e7          	jalr	412(ra) # 4648 <strcmp>
    44b4:	c97d                	beqz	a0,45aa <main+0x1d8>
  } else if(argc == 2 && argv[1][0] != '-'){
    44b6:	0084b903          	ld	s2,8(s1)
    44ba:	00094703          	lbu	a4,0(s2)
    44be:	02d00793          	li	a5,45
    44c2:	f4f713e3          	bne	a4,a5,4408 <main+0x36>
    printf("Usage: usertests [-c] [testname]\n");
    44c6:	00002517          	auipc	a0,0x2
    44ca:	70a50513          	addi	a0,a0,1802 # 6bd0 <malloc+0x1e22>
    44ce:	00000097          	auipc	ra,0x0
    44d2:	7fa080e7          	jalr	2042(ra) # 4cc8 <printf>
    exit(1);
    44d6:	4505                	li	a0,1
    44d8:	00000097          	auipc	ra,0x0
    44dc:	3e0080e7          	jalr	992(ra) # 48b8 <exit>
          exit(1);
    44e0:	4505                	li	a0,1
    44e2:	00000097          	auipc	ra,0x0
    44e6:	3d6080e7          	jalr	982(ra) # 48b8 <exit>
        printf("FAILED -- lost %d free pages\n", free0 - free1);
    44ea:	40a905bb          	subw	a1,s2,a0
    44ee:	855a                	mv	a0,s6
    44f0:	00000097          	auipc	ra,0x0
    44f4:	7d8080e7          	jalr	2008(ra) # 4cc8 <printf>
        if(continuous != 2)
    44f8:	09498463          	beq	s3,s4,4580 <main+0x1ae>
          exit(1);
    44fc:	4505                	li	a0,1
    44fe:	00000097          	auipc	ra,0x0
    4502:	3ba080e7          	jalr	954(ra) # 48b8 <exit>
  for (struct test *t = tests; t->s != 0; t++) {
    4506:	04c1                	addi	s1,s1,16
    4508:	6488                	ld	a0,8(s1)
    450a:	c115                	beqz	a0,452e <main+0x15c>
    if((justone == 0) || strcmp(t->s, justone) == 0) {
    450c:	00090863          	beqz	s2,451c <main+0x14a>
    4510:	85ca                	mv	a1,s2
    4512:	00000097          	auipc	ra,0x0
    4516:	136080e7          	jalr	310(ra) # 4648 <strcmp>
    451a:	f575                	bnez	a0,4506 <main+0x134>
      if(!run(t->f, t->s))
    451c:	648c                	ld	a1,8(s1)
    451e:	6088                	ld	a0,0(s1)
    4520:	00000097          	auipc	ra,0x0
    4524:	e14080e7          	jalr	-492(ra) # 4334 <run>
    4528:	fd79                	bnez	a0,4506 <main+0x134>
        fail = 1;
    452a:	89d6                	mv	s3,s5
    452c:	bfe9                	j	4506 <main+0x134>
  if(fail){
    452e:	f20989e3          	beqz	s3,4460 <main+0x8e>
    printf("SOME TESTS FAILED\n");
    4532:	00002517          	auipc	a0,0x2
    4536:	6e650513          	addi	a0,a0,1766 # 6c18 <malloc+0x1e6a>
    453a:	00000097          	auipc	ra,0x0
    453e:	78e080e7          	jalr	1934(ra) # 4cc8 <printf>
    exit(1);
    4542:	4505                	li	a0,1
    4544:	00000097          	auipc	ra,0x0
    4548:	374080e7          	jalr	884(ra) # 48b8 <exit>
  } else {
    printf("ALL TESTS PASSED\n");
    454c:	00002517          	auipc	a0,0x2
    4550:	71450513          	addi	a0,a0,1812 # 6c60 <malloc+0x1eb2>
    4554:	00000097          	auipc	ra,0x0
    4558:	774080e7          	jalr	1908(ra) # 4cc8 <printf>
    exit(0);
    455c:	4501                	li	a0,0
    455e:	00000097          	auipc	ra,0x0
    4562:	35a080e7          	jalr	858(ra) # 48b8 <exit>
        printf("SOME TESTS FAILED\n");
    4566:	8556                	mv	a0,s5
    4568:	00000097          	auipc	ra,0x0
    456c:	760080e7          	jalr	1888(ra) # 4cc8 <printf>
        if(continuous != 2)
    4570:	f74998e3          	bne	s3,s4,44e0 <main+0x10e>
      int free1 = countfree();
    4574:	00000097          	auipc	ra,0x0
    4578:	c8e080e7          	jalr	-882(ra) # 4202 <countfree>
      if(free1 < free0){
    457c:	f72547e3          	blt	a0,s2,44ea <main+0x118>
      int free0 = countfree();
    4580:	00000097          	auipc	ra,0x0
    4584:	c82080e7          	jalr	-894(ra) # 4202 <countfree>
    4588:	892a                	mv	s2,a0
      for (struct test *t = tests; t->s != 0; t++) {
    458a:	c8843583          	ld	a1,-888(s0)
    458e:	d1fd                	beqz	a1,4574 <main+0x1a2>
    4590:	c8040493          	addi	s1,s0,-896
        if(!run(t->f, t->s)){
    4594:	6088                	ld	a0,0(s1)
    4596:	00000097          	auipc	ra,0x0
    459a:	d9e080e7          	jalr	-610(ra) # 4334 <run>
    459e:	d561                	beqz	a0,4566 <main+0x194>
      for (struct test *t = tests; t->s != 0; t++) {
    45a0:	04c1                	addi	s1,s1,16
    45a2:	648c                	ld	a1,8(s1)
    45a4:	f9e5                	bnez	a1,4594 <main+0x1c2>
    45a6:	b7f9                	j	4574 <main+0x1a2>
    continuous = 1;
    45a8:	4985                	li	s3,1
  } tests[] = {
    45aa:	00002797          	auipc	a5,0x2
    45ae:	72e78793          	addi	a5,a5,1838 # 6cd8 <malloc+0x1f2a>
    45b2:	c8040713          	addi	a4,s0,-896
    45b6:	00003817          	auipc	a6,0x3
    45ba:	a6280813          	addi	a6,a6,-1438 # 7018 <malloc+0x226a>
    45be:	6388                	ld	a0,0(a5)
    45c0:	678c                	ld	a1,8(a5)
    45c2:	6b90                	ld	a2,16(a5)
    45c4:	6f94                	ld	a3,24(a5)
    45c6:	e308                	sd	a0,0(a4)
    45c8:	e70c                	sd	a1,8(a4)
    45ca:	eb10                	sd	a2,16(a4)
    45cc:	ef14                	sd	a3,24(a4)
    45ce:	02078793          	addi	a5,a5,32
    45d2:	02070713          	addi	a4,a4,32
    45d6:	ff0794e3          	bne	a5,a6,45be <main+0x1ec>
    printf("continuous usertests starting\n");
    45da:	00002517          	auipc	a0,0x2
    45de:	6b650513          	addi	a0,a0,1718 # 6c90 <malloc+0x1ee2>
    45e2:	00000097          	auipc	ra,0x0
    45e6:	6e6080e7          	jalr	1766(ra) # 4cc8 <printf>
        printf("SOME TESTS FAILED\n");
    45ea:	00002a97          	auipc	s5,0x2
    45ee:	62ea8a93          	addi	s5,s5,1582 # 6c18 <malloc+0x1e6a>
        if(continuous != 2)
    45f2:	4a09                	li	s4,2
        printf("FAILED -- lost %d free pages\n", free0 - free1);
    45f4:	00002b17          	auipc	s6,0x2
    45f8:	604b0b13          	addi	s6,s6,1540 # 6bf8 <malloc+0x1e4a>
    45fc:	b751                	j	4580 <main+0x1ae>

00000000000045fe <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
    45fe:	1141                	addi	sp,sp,-16
    4600:	e422                	sd	s0,8(sp)
    4602:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    4604:	87aa                	mv	a5,a0
    4606:	0585                	addi	a1,a1,1
    4608:	0785                	addi	a5,a5,1
    460a:	fff5c703          	lbu	a4,-1(a1)
    460e:	fee78fa3          	sb	a4,-1(a5)
    4612:	fb75                	bnez	a4,4606 <strcpy+0x8>
    ;
  return os;
}
    4614:	6422                	ld	s0,8(sp)
    4616:	0141                	addi	sp,sp,16
    4618:	8082                	ret

000000000000461a <strcat>:

char*
strcat(char *s, const char *t)
{
    461a:	1141                	addi	sp,sp,-16
    461c:	e422                	sd	s0,8(sp)
    461e:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
    4620:	00054783          	lbu	a5,0(a0)
    4624:	c385                	beqz	a5,4644 <strcat+0x2a>
    4626:	87aa                	mv	a5,a0
    s++;
    4628:	0785                	addi	a5,a5,1
  while(*s)
    462a:	0007c703          	lbu	a4,0(a5)
    462e:	ff6d                	bnez	a4,4628 <strcat+0xe>
  while((*s++ = *t++))
    4630:	0585                	addi	a1,a1,1
    4632:	0785                	addi	a5,a5,1
    4634:	fff5c703          	lbu	a4,-1(a1)
    4638:	fee78fa3          	sb	a4,-1(a5)
    463c:	fb75                	bnez	a4,4630 <strcat+0x16>
    ;
  return os;
}
    463e:	6422                	ld	s0,8(sp)
    4640:	0141                	addi	sp,sp,16
    4642:	8082                	ret
  while(*s)
    4644:	87aa                	mv	a5,a0
    4646:	b7ed                	j	4630 <strcat+0x16>

0000000000004648 <strcmp>:


int
strcmp(const char *p, const char *q)
{
    4648:	1141                	addi	sp,sp,-16
    464a:	e422                	sd	s0,8(sp)
    464c:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
    464e:	00054783          	lbu	a5,0(a0)
    4652:	cb91                	beqz	a5,4666 <strcmp+0x1e>
    4654:	0005c703          	lbu	a4,0(a1)
    4658:	00f71763          	bne	a4,a5,4666 <strcmp+0x1e>
    p++, q++;
    465c:	0505                	addi	a0,a0,1
    465e:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
    4660:	00054783          	lbu	a5,0(a0)
    4664:	fbe5                	bnez	a5,4654 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
    4666:	0005c503          	lbu	a0,0(a1)
}
    466a:	40a7853b          	subw	a0,a5,a0
    466e:	6422                	ld	s0,8(sp)
    4670:	0141                	addi	sp,sp,16
    4672:	8082                	ret

0000000000004674 <strlen>:

uint
strlen(const char *s)
{
    4674:	1141                	addi	sp,sp,-16
    4676:	e422                	sd	s0,8(sp)
    4678:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
    467a:	00054783          	lbu	a5,0(a0)
    467e:	cf91                	beqz	a5,469a <strlen+0x26>
    4680:	0505                	addi	a0,a0,1
    4682:	87aa                	mv	a5,a0
    4684:	4685                	li	a3,1
    4686:	9e89                	subw	a3,a3,a0
    4688:	00f6853b          	addw	a0,a3,a5
    468c:	0785                	addi	a5,a5,1
    468e:	fff7c703          	lbu	a4,-1(a5)
    4692:	fb7d                	bnez	a4,4688 <strlen+0x14>
    ;
  return n;
}
    4694:	6422                	ld	s0,8(sp)
    4696:	0141                	addi	sp,sp,16
    4698:	8082                	ret
  for(n = 0; s[n]; n++)
    469a:	4501                	li	a0,0
    469c:	bfe5                	j	4694 <strlen+0x20>

000000000000469e <memset>:

void*
memset(void *dst, int c, uint n)
{
    469e:	1141                	addi	sp,sp,-16
    46a0:	e422                	sd	s0,8(sp)
    46a2:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
    46a4:	ce09                	beqz	a2,46be <memset+0x20>
    46a6:	87aa                	mv	a5,a0
    46a8:	fff6071b          	addiw	a4,a2,-1
    46ac:	1702                	slli	a4,a4,0x20
    46ae:	9301                	srli	a4,a4,0x20
    46b0:	0705                	addi	a4,a4,1
    46b2:	972a                	add	a4,a4,a0
    cdst[i] = c;
    46b4:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
    46b8:	0785                	addi	a5,a5,1
    46ba:	fee79de3          	bne	a5,a4,46b4 <memset+0x16>
  }
  return dst;
}
    46be:	6422                	ld	s0,8(sp)
    46c0:	0141                	addi	sp,sp,16
    46c2:	8082                	ret

00000000000046c4 <strchr>:

char*
strchr(const char *s, char c)
{
    46c4:	1141                	addi	sp,sp,-16
    46c6:	e422                	sd	s0,8(sp)
    46c8:	0800                	addi	s0,sp,16
  for(; *s; s++)
    46ca:	00054783          	lbu	a5,0(a0)
    46ce:	cb99                	beqz	a5,46e4 <strchr+0x20>
    if(*s == c)
    46d0:	00f58763          	beq	a1,a5,46de <strchr+0x1a>
  for(; *s; s++)
    46d4:	0505                	addi	a0,a0,1
    46d6:	00054783          	lbu	a5,0(a0)
    46da:	fbfd                	bnez	a5,46d0 <strchr+0xc>
      return (char*)s;
  return 0;
    46dc:	4501                	li	a0,0
}
    46de:	6422                	ld	s0,8(sp)
    46e0:	0141                	addi	sp,sp,16
    46e2:	8082                	ret
  return 0;
    46e4:	4501                	li	a0,0
    46e6:	bfe5                	j	46de <strchr+0x1a>

00000000000046e8 <gets>:

char*
gets(char *buf, int max)
{
    46e8:	711d                	addi	sp,sp,-96
    46ea:	ec86                	sd	ra,88(sp)
    46ec:	e8a2                	sd	s0,80(sp)
    46ee:	e4a6                	sd	s1,72(sp)
    46f0:	e0ca                	sd	s2,64(sp)
    46f2:	fc4e                	sd	s3,56(sp)
    46f4:	f852                	sd	s4,48(sp)
    46f6:	f456                	sd	s5,40(sp)
    46f8:	f05a                	sd	s6,32(sp)
    46fa:	ec5e                	sd	s7,24(sp)
    46fc:	1080                	addi	s0,sp,96
    46fe:	8baa                	mv	s7,a0
    4700:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    4702:	892a                	mv	s2,a0
    4704:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
    4706:	4aa9                	li	s5,10
    4708:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
    470a:	89a6                	mv	s3,s1
    470c:	2485                	addiw	s1,s1,1
    470e:	0344d863          	bge	s1,s4,473e <gets+0x56>
    cc = read(0, &c, 1);
    4712:	4605                	li	a2,1
    4714:	faf40593          	addi	a1,s0,-81
    4718:	4501                	li	a0,0
    471a:	00000097          	auipc	ra,0x0
    471e:	1b6080e7          	jalr	438(ra) # 48d0 <read>
    if(cc < 1)
    4722:	00a05e63          	blez	a0,473e <gets+0x56>
    buf[i++] = c;
    4726:	faf44783          	lbu	a5,-81(s0)
    472a:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
    472e:	01578763          	beq	a5,s5,473c <gets+0x54>
    4732:	0905                	addi	s2,s2,1
    4734:	fd679be3          	bne	a5,s6,470a <gets+0x22>
  for(i=0; i+1 < max; ){
    4738:	89a6                	mv	s3,s1
    473a:	a011                	j	473e <gets+0x56>
    473c:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
    473e:	99de                	add	s3,s3,s7
    4740:	00098023          	sb	zero,0(s3)
  return buf;
}
    4744:	855e                	mv	a0,s7
    4746:	60e6                	ld	ra,88(sp)
    4748:	6446                	ld	s0,80(sp)
    474a:	64a6                	ld	s1,72(sp)
    474c:	6906                	ld	s2,64(sp)
    474e:	79e2                	ld	s3,56(sp)
    4750:	7a42                	ld	s4,48(sp)
    4752:	7aa2                	ld	s5,40(sp)
    4754:	7b02                	ld	s6,32(sp)
    4756:	6be2                	ld	s7,24(sp)
    4758:	6125                	addi	sp,sp,96
    475a:	8082                	ret

000000000000475c <stat>:

int
stat(const char *n, struct stat *st)
{
    475c:	1101                	addi	sp,sp,-32
    475e:	ec06                	sd	ra,24(sp)
    4760:	e822                	sd	s0,16(sp)
    4762:	e426                	sd	s1,8(sp)
    4764:	e04a                	sd	s2,0(sp)
    4766:	1000                	addi	s0,sp,32
    4768:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    476a:	4581                	li	a1,0
    476c:	00000097          	auipc	ra,0x0
    4770:	18c080e7          	jalr	396(ra) # 48f8 <open>
  if(fd < 0)
    4774:	02054563          	bltz	a0,479e <stat+0x42>
    4778:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
    477a:	85ca                	mv	a1,s2
    477c:	00000097          	auipc	ra,0x0
    4780:	184080e7          	jalr	388(ra) # 4900 <fstat>
    4784:	892a                	mv	s2,a0
  close(fd);
    4786:	8526                	mv	a0,s1
    4788:	00000097          	auipc	ra,0x0
    478c:	158080e7          	jalr	344(ra) # 48e0 <close>
  return r;
}
    4790:	854a                	mv	a0,s2
    4792:	60e2                	ld	ra,24(sp)
    4794:	6442                	ld	s0,16(sp)
    4796:	64a2                	ld	s1,8(sp)
    4798:	6902                	ld	s2,0(sp)
    479a:	6105                	addi	sp,sp,32
    479c:	8082                	ret
    return -1;
    479e:	597d                	li	s2,-1
    47a0:	bfc5                	j	4790 <stat+0x34>

00000000000047a2 <atoi>:

int
atoi(const char *s)
{
    47a2:	1141                	addi	sp,sp,-16
    47a4:	e422                	sd	s0,8(sp)
    47a6:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
    47a8:	00054703          	lbu	a4,0(a0)
    47ac:	02d00793          	li	a5,45
  int neg = 1;
    47b0:	4805                	li	a6,1
  if (*s == '-') {
    47b2:	04f70363          	beq	a4,a5,47f8 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
    47b6:	00054683          	lbu	a3,0(a0)
    47ba:	fd06879b          	addiw	a5,a3,-48
    47be:	0ff7f793          	andi	a5,a5,255
    47c2:	4725                	li	a4,9
    47c4:	02f76d63          	bltu	a4,a5,47fe <atoi+0x5c>
  n = 0;
    47c8:	4601                	li	a2,0
  while('0' <= *s && *s <= '9')
    47ca:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
    47cc:	0505                	addi	a0,a0,1
    47ce:	0026179b          	slliw	a5,a2,0x2
    47d2:	9fb1                	addw	a5,a5,a2
    47d4:	0017979b          	slliw	a5,a5,0x1
    47d8:	9fb5                	addw	a5,a5,a3
    47da:	fd07861b          	addiw	a2,a5,-48
  while('0' <= *s && *s <= '9')
    47de:	00054683          	lbu	a3,0(a0)
    47e2:	fd06871b          	addiw	a4,a3,-48
    47e6:	0ff77713          	andi	a4,a4,255
    47ea:	fee5f1e3          	bgeu	a1,a4,47cc <atoi+0x2a>
  return n * neg;
}
    47ee:	02c8053b          	mulw	a0,a6,a2
    47f2:	6422                	ld	s0,8(sp)
    47f4:	0141                	addi	sp,sp,16
    47f6:	8082                	ret
    s++;
    47f8:	0505                	addi	a0,a0,1
    neg = -1;
    47fa:	587d                	li	a6,-1
    47fc:	bf6d                	j	47b6 <atoi+0x14>
  n = 0;
    47fe:	4601                	li	a2,0
    4800:	b7fd                	j	47ee <atoi+0x4c>

0000000000004802 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    4802:	1141                	addi	sp,sp,-16
    4804:	e422                	sd	s0,8(sp)
    4806:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
    4808:	02b57663          	bgeu	a0,a1,4834 <memmove+0x32>
    while(n-- > 0)
    480c:	02c05163          	blez	a2,482e <memmove+0x2c>
    4810:	fff6079b          	addiw	a5,a2,-1
    4814:	1782                	slli	a5,a5,0x20
    4816:	9381                	srli	a5,a5,0x20
    4818:	0785                	addi	a5,a5,1
    481a:	97aa                	add	a5,a5,a0
  dst = vdst;
    481c:	872a                	mv	a4,a0
      *dst++ = *src++;
    481e:	0585                	addi	a1,a1,1
    4820:	0705                	addi	a4,a4,1
    4822:	fff5c683          	lbu	a3,-1(a1)
    4826:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
    482a:	fee79ae3          	bne	a5,a4,481e <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
    482e:	6422                	ld	s0,8(sp)
    4830:	0141                	addi	sp,sp,16
    4832:	8082                	ret
    dst += n;
    4834:	00c50733          	add	a4,a0,a2
    src += n;
    4838:	95b2                	add	a1,a1,a2
    while(n-- > 0)
    483a:	fec05ae3          	blez	a2,482e <memmove+0x2c>
    483e:	fff6079b          	addiw	a5,a2,-1
    4842:	1782                	slli	a5,a5,0x20
    4844:	9381                	srli	a5,a5,0x20
    4846:	fff7c793          	not	a5,a5
    484a:	97ba                	add	a5,a5,a4
      *--dst = *--src;
    484c:	15fd                	addi	a1,a1,-1
    484e:	177d                	addi	a4,a4,-1
    4850:	0005c683          	lbu	a3,0(a1)
    4854:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
    4858:	fee79ae3          	bne	a5,a4,484c <memmove+0x4a>
    485c:	bfc9                	j	482e <memmove+0x2c>

000000000000485e <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
    485e:	1141                	addi	sp,sp,-16
    4860:	e422                	sd	s0,8(sp)
    4862:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
    4864:	ca05                	beqz	a2,4894 <memcmp+0x36>
    4866:	fff6069b          	addiw	a3,a2,-1
    486a:	1682                	slli	a3,a3,0x20
    486c:	9281                	srli	a3,a3,0x20
    486e:	0685                	addi	a3,a3,1
    4870:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
    4872:	00054783          	lbu	a5,0(a0)
    4876:	0005c703          	lbu	a4,0(a1)
    487a:	00e79863          	bne	a5,a4,488a <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
    487e:	0505                	addi	a0,a0,1
    p2++;
    4880:	0585                	addi	a1,a1,1
  while (n-- > 0) {
    4882:	fed518e3          	bne	a0,a3,4872 <memcmp+0x14>
  }
  return 0;
    4886:	4501                	li	a0,0
    4888:	a019                	j	488e <memcmp+0x30>
      return *p1 - *p2;
    488a:	40e7853b          	subw	a0,a5,a4
}
    488e:	6422                	ld	s0,8(sp)
    4890:	0141                	addi	sp,sp,16
    4892:	8082                	ret
  return 0;
    4894:	4501                	li	a0,0
    4896:	bfe5                	j	488e <memcmp+0x30>

0000000000004898 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
    4898:	1141                	addi	sp,sp,-16
    489a:	e406                	sd	ra,8(sp)
    489c:	e022                	sd	s0,0(sp)
    489e:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
    48a0:	00000097          	auipc	ra,0x0
    48a4:	f62080e7          	jalr	-158(ra) # 4802 <memmove>
}
    48a8:	60a2                	ld	ra,8(sp)
    48aa:	6402                	ld	s0,0(sp)
    48ac:	0141                	addi	sp,sp,16
    48ae:	8082                	ret

00000000000048b0 <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
    48b0:	4885                	li	a7,1
 ecall
    48b2:	00000073          	ecall
 ret
    48b6:	8082                	ret

00000000000048b8 <exit>:
.global exit
exit:
 li a7, SYS_exit
    48b8:	4889                	li	a7,2
 ecall
    48ba:	00000073          	ecall
 ret
    48be:	8082                	ret

00000000000048c0 <wait>:
.global wait
wait:
 li a7, SYS_wait
    48c0:	488d                	li	a7,3
 ecall
    48c2:	00000073          	ecall
 ret
    48c6:	8082                	ret

00000000000048c8 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
    48c8:	4891                	li	a7,4
 ecall
    48ca:	00000073          	ecall
 ret
    48ce:	8082                	ret

00000000000048d0 <read>:
.global read
read:
 li a7, SYS_read
    48d0:	4895                	li	a7,5
 ecall
    48d2:	00000073          	ecall
 ret
    48d6:	8082                	ret

00000000000048d8 <write>:
.global write
write:
 li a7, SYS_write
    48d8:	48c1                	li	a7,16
 ecall
    48da:	00000073          	ecall
 ret
    48de:	8082                	ret

00000000000048e0 <close>:
.global close
close:
 li a7, SYS_close
    48e0:	48d5                	li	a7,21
 ecall
    48e2:	00000073          	ecall
 ret
    48e6:	8082                	ret

00000000000048e8 <kill>:
.global kill
kill:
 li a7, SYS_kill
    48e8:	4899                	li	a7,6
 ecall
    48ea:	00000073          	ecall
 ret
    48ee:	8082                	ret

00000000000048f0 <exec>:
.global exec
exec:
 li a7, SYS_exec
    48f0:	489d                	li	a7,7
 ecall
    48f2:	00000073          	ecall
 ret
    48f6:	8082                	ret

00000000000048f8 <open>:
.global open
open:
 li a7, SYS_open
    48f8:	48bd                	li	a7,15
 ecall
    48fa:	00000073          	ecall
 ret
    48fe:	8082                	ret

0000000000004900 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
    4900:	48a1                	li	a7,8
 ecall
    4902:	00000073          	ecall
 ret
    4906:	8082                	ret

0000000000004908 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
    4908:	48d1                	li	a7,20
 ecall
    490a:	00000073          	ecall
 ret
    490e:	8082                	ret

0000000000004910 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
    4910:	48a5                	li	a7,9
 ecall
    4912:	00000073          	ecall
 ret
    4916:	8082                	ret

0000000000004918 <dup>:
.global dup
dup:
 li a7, SYS_dup
    4918:	48a9                	li	a7,10
 ecall
    491a:	00000073          	ecall
 ret
    491e:	8082                	ret

0000000000004920 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
    4920:	48ad                	li	a7,11
 ecall
    4922:	00000073          	ecall
 ret
    4926:	8082                	ret

0000000000004928 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
    4928:	48b1                	li	a7,12
 ecall
    492a:	00000073          	ecall
 ret
    492e:	8082                	ret

0000000000004930 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
    4930:	48b5                	li	a7,13
 ecall
    4932:	00000073          	ecall
 ret
    4936:	8082                	ret

0000000000004938 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
    4938:	48b9                	li	a7,14
 ecall
    493a:	00000073          	ecall
 ret
    493e:	8082                	ret

0000000000004940 <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
    4940:	48d9                	li	a7,22
 ecall
    4942:	00000073          	ecall
 ret
    4946:	8082                	ret

0000000000004948 <dev>:
.global dev
dev:
 li a7, SYS_dev
    4948:	48dd                	li	a7,23
 ecall
    494a:	00000073          	ecall
 ret
    494e:	8082                	ret

0000000000004950 <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
    4950:	48e1                	li	a7,24
 ecall
    4952:	00000073          	ecall
 ret
    4956:	8082                	ret

0000000000004958 <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
    4958:	48e5                	li	a7,25
 ecall
    495a:	00000073          	ecall
 ret
    495e:	8082                	ret

0000000000004960 <remove>:
.global remove
remove:
 li a7, SYS_remove
    4960:	48c5                	li	a7,17
 ecall
    4962:	00000073          	ecall
 ret
    4966:	8082                	ret

0000000000004968 <trace>:
.global trace
trace:
 li a7, SYS_trace
    4968:	48c9                	li	a7,18
 ecall
    496a:	00000073          	ecall
 ret
    496e:	8082                	ret

0000000000004970 <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
    4970:	48cd                	li	a7,19
 ecall
    4972:	00000073          	ecall
 ret
    4976:	8082                	ret

0000000000004978 <rename>:
.global rename
rename:
 li a7, SYS_rename
    4978:	48e9                	li	a7,26
 ecall
    497a:	00000073          	ecall
 ret
    497e:	8082                	ret

0000000000004980 <checkchar>:
.global checkchar
checkchar:
 li a7, SYS_checkchar
    4980:	48ed                	li	a7,27
 ecall
    4982:	00000073          	ecall
 ret
    4986:	8082                	ret

0000000000004988 <sprint>:
.global sprint
sprint:
 li a7, SYS_sprint
    4988:	48f1                	li	a7,28
 ecall
    498a:	00000073          	ecall
 ret
    498e:	8082                	ret

0000000000004990 <putc>:
static char digits[] = "0123456789ABCDEF";
static char printbuf[100];
static int  len = 0;
static void
putc(int fd, char c)
{
    4990:	1141                	addi	sp,sp,-16
    4992:	e422                	sd	s0,8(sp)
    4994:	0800                	addi	s0,sp,16
  printbuf[len++]=c;
    4996:	00002797          	auipc	a5,0x2
    499a:	6b678793          	addi	a5,a5,1718 # 704c <len>
    499e:	4398                	lw	a4,0(a5)
    49a0:	0017069b          	addiw	a3,a4,1
    49a4:	c394                	sw	a3,0(a5)
    49a6:	00007797          	auipc	a5,0x7
    49aa:	6ca78793          	addi	a5,a5,1738 # c070 <printbuf>
    49ae:	97ba                	add	a5,a5,a4
    49b0:	00b78023          	sb	a1,0(a5)
}
    49b4:	6422                	ld	s0,8(sp)
    49b6:	0141                	addi	sp,sp,16
    49b8:	8082                	ret

00000000000049ba <printint>:
	}
}

static void
printint(int fd, int xx, int base, int sgn)
{
    49ba:	7139                	addi	sp,sp,-64
    49bc:	fc06                	sd	ra,56(sp)
    49be:	f822                	sd	s0,48(sp)
    49c0:	f426                	sd	s1,40(sp)
    49c2:	f04a                	sd	s2,32(sp)
    49c4:	ec4e                	sd	s3,24(sp)
    49c6:	0080                	addi	s0,sp,64
    49c8:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    49ca:	c299                	beqz	a3,49d0 <printint+0x16>
    49cc:	0805c863          	bltz	a1,4a5c <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    49d0:	2581                	sext.w	a1,a1
  neg = 0;
    49d2:	4881                	li	a7,0
    49d4:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
    49d8:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
    49da:	2601                	sext.w	a2,a2
    49dc:	00002517          	auipc	a0,0x2
    49e0:	64450513          	addi	a0,a0,1604 # 7020 <digits>
    49e4:	883a                	mv	a6,a4
    49e6:	2705                	addiw	a4,a4,1
    49e8:	02c5f7bb          	remuw	a5,a1,a2
    49ec:	1782                	slli	a5,a5,0x20
    49ee:	9381                	srli	a5,a5,0x20
    49f0:	97aa                	add	a5,a5,a0
    49f2:	0007c783          	lbu	a5,0(a5)
    49f6:	00f68023          	sb	a5,0(a3) # 1000 <copyinstr2+0xdc>
  }while((x /= base) != 0);
    49fa:	0005879b          	sext.w	a5,a1
    49fe:	02c5d5bb          	divuw	a1,a1,a2
    4a02:	0685                	addi	a3,a3,1
    4a04:	fec7f0e3          	bgeu	a5,a2,49e4 <printint+0x2a>
  if(neg)
    4a08:	00088b63          	beqz	a7,4a1e <printint+0x64>
    buf[i++] = '-';
    4a0c:	fd040793          	addi	a5,s0,-48
    4a10:	973e                	add	a4,a4,a5
    4a12:	02d00793          	li	a5,45
    4a16:	fef70823          	sb	a5,-16(a4)
    4a1a:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
    4a1e:	02e05863          	blez	a4,4a4e <printint+0x94>
    4a22:	fc040793          	addi	a5,s0,-64
    4a26:	00e78933          	add	s2,a5,a4
    4a2a:	fff78993          	addi	s3,a5,-1
    4a2e:	99ba                	add	s3,s3,a4
    4a30:	377d                	addiw	a4,a4,-1
    4a32:	1702                	slli	a4,a4,0x20
    4a34:	9301                	srli	a4,a4,0x20
    4a36:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
    4a3a:	fff94583          	lbu	a1,-1(s2)
    4a3e:	8526                	mv	a0,s1
    4a40:	00000097          	auipc	ra,0x0
    4a44:	f50080e7          	jalr	-176(ra) # 4990 <putc>
  while(--i >= 0)
    4a48:	197d                	addi	s2,s2,-1
    4a4a:	ff3918e3          	bne	s2,s3,4a3a <printint+0x80>
}
    4a4e:	70e2                	ld	ra,56(sp)
    4a50:	7442                	ld	s0,48(sp)
    4a52:	74a2                	ld	s1,40(sp)
    4a54:	7902                	ld	s2,32(sp)
    4a56:	69e2                	ld	s3,24(sp)
    4a58:	6121                	addi	sp,sp,64
    4a5a:	8082                	ret
    x = -xx;
    4a5c:	40b005bb          	negw	a1,a1
    neg = 1;
    4a60:	4885                	li	a7,1
    x = -xx;
    4a62:	bf8d                	j	49d4 <printint+0x1a>

0000000000004a64 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
    4a64:	7119                	addi	sp,sp,-128
    4a66:	fc86                	sd	ra,120(sp)
    4a68:	f8a2                	sd	s0,112(sp)
    4a6a:	f4a6                	sd	s1,104(sp)
    4a6c:	f0ca                	sd	s2,96(sp)
    4a6e:	ecce                	sd	s3,88(sp)
    4a70:	e8d2                	sd	s4,80(sp)
    4a72:	e4d6                	sd	s5,72(sp)
    4a74:	e0da                	sd	s6,64(sp)
    4a76:	fc5e                	sd	s7,56(sp)
    4a78:	f862                	sd	s8,48(sp)
    4a7a:	f466                	sd	s9,40(sp)
    4a7c:	f06a                	sd	s10,32(sp)
    4a7e:	ec6e                	sd	s11,24(sp)
    4a80:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
    4a82:	0005c903          	lbu	s2,0(a1)
    4a86:	18090f63          	beqz	s2,4c24 <vprintf+0x1c0>
    4a8a:	8aaa                	mv	s5,a0
    4a8c:	8b32                	mv	s6,a2
    4a8e:	00158493          	addi	s1,a1,1
  state = 0;
    4a92:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    4a94:	02500a13          	li	s4,37
      if(c == 'd'){
    4a98:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
    4a9c:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
    4aa0:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
    4aa4:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
    4aa8:	00002b97          	auipc	s7,0x2
    4aac:	578b8b93          	addi	s7,s7,1400 # 7020 <digits>
    4ab0:	a839                	j	4ace <vprintf+0x6a>
        putc(fd, c);
    4ab2:	85ca                	mv	a1,s2
    4ab4:	8556                	mv	a0,s5
    4ab6:	00000097          	auipc	ra,0x0
    4aba:	eda080e7          	jalr	-294(ra) # 4990 <putc>
    4abe:	a019                	j	4ac4 <vprintf+0x60>
    } else if(state == '%'){
    4ac0:	01498f63          	beq	s3,s4,4ade <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
    4ac4:	0485                	addi	s1,s1,1
    4ac6:	fff4c903          	lbu	s2,-1(s1)
    4aca:	14090d63          	beqz	s2,4c24 <vprintf+0x1c0>
    c = fmt[i] & 0xff;
    4ace:	0009079b          	sext.w	a5,s2
    if(state == 0){
    4ad2:	fe0997e3          	bnez	s3,4ac0 <vprintf+0x5c>
      if(c == '%'){
    4ad6:	fd479ee3          	bne	a5,s4,4ab2 <vprintf+0x4e>
        state = '%';
    4ada:	89be                	mv	s3,a5
    4adc:	b7e5                	j	4ac4 <vprintf+0x60>
      if(c == 'd'){
    4ade:	05878063          	beq	a5,s8,4b1e <vprintf+0xba>
      } else if(c == 'l') {
    4ae2:	05978c63          	beq	a5,s9,4b3a <vprintf+0xd6>
      } else if(c == 'x') {
    4ae6:	07a78863          	beq	a5,s10,4b56 <vprintf+0xf2>
      } else if(c == 'p') {
    4aea:	09b78463          	beq	a5,s11,4b72 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
    4aee:	07300713          	li	a4,115
    4af2:	0ce78663          	beq	a5,a4,4bbe <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    4af6:	06300713          	li	a4,99
    4afa:	0ee78e63          	beq	a5,a4,4bf6 <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
    4afe:	11478863          	beq	a5,s4,4c0e <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    4b02:	85d2                	mv	a1,s4
    4b04:	8556                	mv	a0,s5
    4b06:	00000097          	auipc	ra,0x0
    4b0a:	e8a080e7          	jalr	-374(ra) # 4990 <putc>
        putc(fd, c);
    4b0e:	85ca                	mv	a1,s2
    4b10:	8556                	mv	a0,s5
    4b12:	00000097          	auipc	ra,0x0
    4b16:	e7e080e7          	jalr	-386(ra) # 4990 <putc>
      }
      state = 0;
    4b1a:	4981                	li	s3,0
    4b1c:	b765                	j	4ac4 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
    4b1e:	008b0913          	addi	s2,s6,8
    4b22:	4685                	li	a3,1
    4b24:	4629                	li	a2,10
    4b26:	000b2583          	lw	a1,0(s6)
    4b2a:	8556                	mv	a0,s5
    4b2c:	00000097          	auipc	ra,0x0
    4b30:	e8e080e7          	jalr	-370(ra) # 49ba <printint>
    4b34:	8b4a                	mv	s6,s2
      state = 0;
    4b36:	4981                	li	s3,0
    4b38:	b771                	j	4ac4 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
    4b3a:	008b0913          	addi	s2,s6,8
    4b3e:	4681                	li	a3,0
    4b40:	4629                	li	a2,10
    4b42:	000b2583          	lw	a1,0(s6)
    4b46:	8556                	mv	a0,s5
    4b48:	00000097          	auipc	ra,0x0
    4b4c:	e72080e7          	jalr	-398(ra) # 49ba <printint>
    4b50:	8b4a                	mv	s6,s2
      state = 0;
    4b52:	4981                	li	s3,0
    4b54:	bf85                	j	4ac4 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
    4b56:	008b0913          	addi	s2,s6,8
    4b5a:	4681                	li	a3,0
    4b5c:	4641                	li	a2,16
    4b5e:	000b2583          	lw	a1,0(s6)
    4b62:	8556                	mv	a0,s5
    4b64:	00000097          	auipc	ra,0x0
    4b68:	e56080e7          	jalr	-426(ra) # 49ba <printint>
    4b6c:	8b4a                	mv	s6,s2
      state = 0;
    4b6e:	4981                	li	s3,0
    4b70:	bf91                	j	4ac4 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
    4b72:	008b0793          	addi	a5,s6,8
    4b76:	f8f43423          	sd	a5,-120(s0)
    4b7a:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
    4b7e:	03000593          	li	a1,48
    4b82:	8556                	mv	a0,s5
    4b84:	00000097          	auipc	ra,0x0
    4b88:	e0c080e7          	jalr	-500(ra) # 4990 <putc>
  putc(fd, 'x');
    4b8c:	85ea                	mv	a1,s10
    4b8e:	8556                	mv	a0,s5
    4b90:	00000097          	auipc	ra,0x0
    4b94:	e00080e7          	jalr	-512(ra) # 4990 <putc>
    4b98:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
    4b9a:	03c9d793          	srli	a5,s3,0x3c
    4b9e:	97de                	add	a5,a5,s7
    4ba0:	0007c583          	lbu	a1,0(a5)
    4ba4:	8556                	mv	a0,s5
    4ba6:	00000097          	auipc	ra,0x0
    4baa:	dea080e7          	jalr	-534(ra) # 4990 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    4bae:	0992                	slli	s3,s3,0x4
    4bb0:	397d                	addiw	s2,s2,-1
    4bb2:	fe0914e3          	bnez	s2,4b9a <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
    4bb6:	f8843b03          	ld	s6,-120(s0)
      state = 0;
    4bba:	4981                	li	s3,0
    4bbc:	b721                	j	4ac4 <vprintf+0x60>
        s = va_arg(ap, char*);
    4bbe:	008b0993          	addi	s3,s6,8
    4bc2:	000b3903          	ld	s2,0(s6)
        if(s == 0)
    4bc6:	02090163          	beqz	s2,4be8 <vprintf+0x184>
        while(*s != 0){
    4bca:	00094583          	lbu	a1,0(s2)
    4bce:	c9a1                	beqz	a1,4c1e <vprintf+0x1ba>
          putc(fd, *s);
    4bd0:	8556                	mv	a0,s5
    4bd2:	00000097          	auipc	ra,0x0
    4bd6:	dbe080e7          	jalr	-578(ra) # 4990 <putc>
          s++;
    4bda:	0905                	addi	s2,s2,1
        while(*s != 0){
    4bdc:	00094583          	lbu	a1,0(s2)
    4be0:	f9e5                	bnez	a1,4bd0 <vprintf+0x16c>
        s = va_arg(ap, char*);
    4be2:	8b4e                	mv	s6,s3
      state = 0;
    4be4:	4981                	li	s3,0
    4be6:	bdf9                	j	4ac4 <vprintf+0x60>
          s = "(null)";
    4be8:	00002917          	auipc	s2,0x2
    4bec:	43090913          	addi	s2,s2,1072 # 7018 <malloc+0x226a>
        while(*s != 0){
    4bf0:	02800593          	li	a1,40
    4bf4:	bff1                	j	4bd0 <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
    4bf6:	008b0913          	addi	s2,s6,8
    4bfa:	000b4583          	lbu	a1,0(s6)
    4bfe:	8556                	mv	a0,s5
    4c00:	00000097          	auipc	ra,0x0
    4c04:	d90080e7          	jalr	-624(ra) # 4990 <putc>
    4c08:	8b4a                	mv	s6,s2
      state = 0;
    4c0a:	4981                	li	s3,0
    4c0c:	bd65                	j	4ac4 <vprintf+0x60>
        putc(fd, c);
    4c0e:	85d2                	mv	a1,s4
    4c10:	8556                	mv	a0,s5
    4c12:	00000097          	auipc	ra,0x0
    4c16:	d7e080e7          	jalr	-642(ra) # 4990 <putc>
      state = 0;
    4c1a:	4981                	li	s3,0
    4c1c:	b565                	j	4ac4 <vprintf+0x60>
        s = va_arg(ap, char*);
    4c1e:	8b4e                	mv	s6,s3
      state = 0;
    4c20:	4981                	li	s3,0
    4c22:	b54d                	j	4ac4 <vprintf+0x60>
    }
  }
}
    4c24:	70e6                	ld	ra,120(sp)
    4c26:	7446                	ld	s0,112(sp)
    4c28:	74a6                	ld	s1,104(sp)
    4c2a:	7906                	ld	s2,96(sp)
    4c2c:	69e6                	ld	s3,88(sp)
    4c2e:	6a46                	ld	s4,80(sp)
    4c30:	6aa6                	ld	s5,72(sp)
    4c32:	6b06                	ld	s6,64(sp)
    4c34:	7be2                	ld	s7,56(sp)
    4c36:	7c42                	ld	s8,48(sp)
    4c38:	7ca2                	ld	s9,40(sp)
    4c3a:	7d02                	ld	s10,32(sp)
    4c3c:	6de2                	ld	s11,24(sp)
    4c3e:	6109                	addi	sp,sp,128
    4c40:	8082                	ret

0000000000004c42 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
    4c42:	711d                	addi	sp,sp,-96
    4c44:	f406                	sd	ra,40(sp)
    4c46:	f022                	sd	s0,32(sp)
    4c48:	ec26                	sd	s1,24(sp)
    4c4a:	e84a                	sd	s2,16(sp)
    4c4c:	1800                	addi	s0,sp,48
    4c4e:	84aa                	mv	s1,a0
    4c50:	e010                	sd	a2,0(s0)
    4c52:	e414                	sd	a3,8(s0)
    4c54:	e818                	sd	a4,16(s0)
    4c56:	ec1c                	sd	a5,24(s0)
    4c58:	03043023          	sd	a6,32(s0)
    4c5c:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
    4c60:	fc843c23          	sd	s0,-40(s0)
  vprintf(fd, fmt, ap);
    4c64:	8622                	mv	a2,s0
    4c66:	00000097          	auipc	ra,0x0
    4c6a:	dfe080e7          	jalr	-514(ra) # 4a64 <vprintf>
	if(fd==1){
    4c6e:	4785                	li	a5,1
    4c70:	02f48963          	beq	s1,a5,4ca2 <fprintf+0x60>
	  write(fd, printbuf, len);
    4c74:	00002917          	auipc	s2,0x2
    4c78:	3d890913          	addi	s2,s2,984 # 704c <len>
    4c7c:	00092603          	lw	a2,0(s2)
    4c80:	00007597          	auipc	a1,0x7
    4c84:	3f058593          	addi	a1,a1,1008 # c070 <printbuf>
    4c88:	8526                	mv	a0,s1
    4c8a:	00000097          	auipc	ra,0x0
    4c8e:	c4e080e7          	jalr	-946(ra) # 48d8 <write>
	  len=0;
    4c92:	00092023          	sw	zero,0(s2)
  fflush(fd);
}
    4c96:	70a2                	ld	ra,40(sp)
    4c98:	7402                	ld	s0,32(sp)
    4c9a:	64e2                	ld	s1,24(sp)
    4c9c:	6942                	ld	s2,16(sp)
    4c9e:	6125                	addi	sp,sp,96
    4ca0:	8082                	ret
	  printbuf[len]=0;
    4ca2:	00007517          	auipc	a0,0x7
    4ca6:	3ce50513          	addi	a0,a0,974 # c070 <printbuf>
    4caa:	00002497          	auipc	s1,0x2
    4cae:	3a248493          	addi	s1,s1,930 # 704c <len>
    4cb2:	409c                	lw	a5,0(s1)
    4cb4:	97aa                	add	a5,a5,a0
    4cb6:	00078023          	sb	zero,0(a5)
	  sprint(printbuf);
    4cba:	00000097          	auipc	ra,0x0
    4cbe:	cce080e7          	jalr	-818(ra) # 4988 <sprint>
	  len=0;
    4cc2:	0004a023          	sw	zero,0(s1)
    4cc6:	bfc1                	j	4c96 <fprintf+0x54>

0000000000004cc8 <printf>:

void
printf(const char *fmt, ...)
{
    4cc8:	7159                	addi	sp,sp,-112
    4cca:	f406                	sd	ra,40(sp)
    4ccc:	f022                	sd	s0,32(sp)
    4cce:	ec26                	sd	s1,24(sp)
    4cd0:	1800                	addi	s0,sp,48
    4cd2:	e40c                	sd	a1,8(s0)
    4cd4:	e810                	sd	a2,16(s0)
    4cd6:	ec14                	sd	a3,24(s0)
    4cd8:	f018                	sd	a4,32(s0)
    4cda:	f41c                	sd	a5,40(s0)
    4cdc:	03043823          	sd	a6,48(s0)
    4ce0:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
    4ce4:	00840613          	addi	a2,s0,8
    4ce8:	fcc43c23          	sd	a2,-40(s0)
  vprintf(1, fmt, ap);
    4cec:	85aa                	mv	a1,a0
    4cee:	4505                	li	a0,1
    4cf0:	00000097          	auipc	ra,0x0
    4cf4:	d74080e7          	jalr	-652(ra) # 4a64 <vprintf>
	  printbuf[len]=0;
    4cf8:	00007517          	auipc	a0,0x7
    4cfc:	37850513          	addi	a0,a0,888 # c070 <printbuf>
    4d00:	00002497          	auipc	s1,0x2
    4d04:	34c48493          	addi	s1,s1,844 # 704c <len>
    4d08:	409c                	lw	a5,0(s1)
    4d0a:	97aa                	add	a5,a5,a0
    4d0c:	00078023          	sb	zero,0(a5)
	  sprint(printbuf);
    4d10:	00000097          	auipc	ra,0x0
    4d14:	c78080e7          	jalr	-904(ra) # 4988 <sprint>
	  len=0;
    4d18:	0004a023          	sw	zero,0(s1)
  fflush(1);
}
    4d1c:	70a2                	ld	ra,40(sp)
    4d1e:	7402                	ld	s0,32(sp)
    4d20:	64e2                	ld	s1,24(sp)
    4d22:	6165                	addi	sp,sp,112
    4d24:	8082                	ret

0000000000004d26 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    4d26:	1141                	addi	sp,sp,-16
    4d28:	e422                	sd	s0,8(sp)
    4d2a:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
    4d2c:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4d30:	00002797          	auipc	a5,0x2
    4d34:	3207b783          	ld	a5,800(a5) # 7050 <freep>
    4d38:	a805                	j	4d68 <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    4d3a:	4618                	lw	a4,8(a2)
    4d3c:	9db9                	addw	a1,a1,a4
    4d3e:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
    4d42:	6398                	ld	a4,0(a5)
    4d44:	6318                	ld	a4,0(a4)
    4d46:	fee53823          	sd	a4,-16(a0)
    4d4a:	a091                	j	4d8e <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    4d4c:	ff852703          	lw	a4,-8(a0)
    4d50:	9e39                	addw	a2,a2,a4
    4d52:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
    4d54:	ff053703          	ld	a4,-16(a0)
    4d58:	e398                	sd	a4,0(a5)
    4d5a:	a099                	j	4da0 <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    4d5c:	6398                	ld	a4,0(a5)
    4d5e:	00e7e463          	bltu	a5,a4,4d66 <free+0x40>
    4d62:	00e6ea63          	bltu	a3,a4,4d76 <free+0x50>
{
    4d66:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4d68:	fed7fae3          	bgeu	a5,a3,4d5c <free+0x36>
    4d6c:	6398                	ld	a4,0(a5)
    4d6e:	00e6e463          	bltu	a3,a4,4d76 <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    4d72:	fee7eae3          	bltu	a5,a4,4d66 <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
    4d76:	ff852583          	lw	a1,-8(a0)
    4d7a:	6390                	ld	a2,0(a5)
    4d7c:	02059713          	slli	a4,a1,0x20
    4d80:	9301                	srli	a4,a4,0x20
    4d82:	0712                	slli	a4,a4,0x4
    4d84:	9736                	add	a4,a4,a3
    4d86:	fae60ae3          	beq	a2,a4,4d3a <free+0x14>
    bp->s.ptr = p->s.ptr;
    4d8a:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
    4d8e:	4790                	lw	a2,8(a5)
    4d90:	02061713          	slli	a4,a2,0x20
    4d94:	9301                	srli	a4,a4,0x20
    4d96:	0712                	slli	a4,a4,0x4
    4d98:	973e                	add	a4,a4,a5
    4d9a:	fae689e3          	beq	a3,a4,4d4c <free+0x26>
  } else
    p->s.ptr = bp;
    4d9e:	e394                	sd	a3,0(a5)
  freep = p;
    4da0:	00002717          	auipc	a4,0x2
    4da4:	2af73823          	sd	a5,688(a4) # 7050 <freep>
}
    4da8:	6422                	ld	s0,8(sp)
    4daa:	0141                	addi	sp,sp,16
    4dac:	8082                	ret

0000000000004dae <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    4dae:	7139                	addi	sp,sp,-64
    4db0:	fc06                	sd	ra,56(sp)
    4db2:	f822                	sd	s0,48(sp)
    4db4:	f426                	sd	s1,40(sp)
    4db6:	f04a                	sd	s2,32(sp)
    4db8:	ec4e                	sd	s3,24(sp)
    4dba:	e852                	sd	s4,16(sp)
    4dbc:	e456                	sd	s5,8(sp)
    4dbe:	e05a                	sd	s6,0(sp)
    4dc0:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    4dc2:	02051493          	slli	s1,a0,0x20
    4dc6:	9081                	srli	s1,s1,0x20
    4dc8:	04bd                	addi	s1,s1,15
    4dca:	8091                	srli	s1,s1,0x4
    4dcc:	0014899b          	addiw	s3,s1,1
    4dd0:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
    4dd2:	00002517          	auipc	a0,0x2
    4dd6:	27e53503          	ld	a0,638(a0) # 7050 <freep>
    4dda:	c515                	beqz	a0,4e06 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    4ddc:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
    4dde:	4798                	lw	a4,8(a5)
    4de0:	02977f63          	bgeu	a4,s1,4e1e <malloc+0x70>
    4de4:	8a4e                	mv	s4,s3
    4de6:	0009871b          	sext.w	a4,s3
    4dea:	6685                	lui	a3,0x1
    4dec:	00d77363          	bgeu	a4,a3,4df2 <malloc+0x44>
    4df0:	6a05                	lui	s4,0x1
    4df2:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
    4df6:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    4dfa:	00002917          	auipc	s2,0x2
    4dfe:	25690913          	addi	s2,s2,598 # 7050 <freep>
  if(p == (char*)-1)
    4e02:	5afd                	li	s5,-1
    4e04:	a88d                	j	4e76 <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
    4e06:	00007797          	auipc	a5,0x7
    4e0a:	2d278793          	addi	a5,a5,722 # c0d8 <base>
    4e0e:	00002717          	auipc	a4,0x2
    4e12:	24f73123          	sd	a5,578(a4) # 7050 <freep>
    4e16:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
    4e18:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
    4e1c:	b7e1                	j	4de4 <malloc+0x36>
      if(p->s.size == nunits)
    4e1e:	02e48b63          	beq	s1,a4,4e54 <malloc+0xa6>
        p->s.size -= nunits;
    4e22:	4137073b          	subw	a4,a4,s3
    4e26:	c798                	sw	a4,8(a5)
        p += p->s.size;
    4e28:	1702                	slli	a4,a4,0x20
    4e2a:	9301                	srli	a4,a4,0x20
    4e2c:	0712                	slli	a4,a4,0x4
    4e2e:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
    4e30:	0137a423          	sw	s3,8(a5)
      freep = prevp;
    4e34:	00002717          	auipc	a4,0x2
    4e38:	20a73e23          	sd	a0,540(a4) # 7050 <freep>
      return (void*)(p + 1);
    4e3c:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    4e40:	70e2                	ld	ra,56(sp)
    4e42:	7442                	ld	s0,48(sp)
    4e44:	74a2                	ld	s1,40(sp)
    4e46:	7902                	ld	s2,32(sp)
    4e48:	69e2                	ld	s3,24(sp)
    4e4a:	6a42                	ld	s4,16(sp)
    4e4c:	6aa2                	ld	s5,8(sp)
    4e4e:	6b02                	ld	s6,0(sp)
    4e50:	6121                	addi	sp,sp,64
    4e52:	8082                	ret
        prevp->s.ptr = p->s.ptr;
    4e54:	6398                	ld	a4,0(a5)
    4e56:	e118                	sd	a4,0(a0)
    4e58:	bff1                	j	4e34 <malloc+0x86>
  hp->s.size = nu;
    4e5a:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
    4e5e:	0541                	addi	a0,a0,16
    4e60:	00000097          	auipc	ra,0x0
    4e64:	ec6080e7          	jalr	-314(ra) # 4d26 <free>
  return freep;
    4e68:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
    4e6c:	d971                	beqz	a0,4e40 <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    4e6e:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
    4e70:	4798                	lw	a4,8(a5)
    4e72:	fa9776e3          	bgeu	a4,s1,4e1e <malloc+0x70>
    if(p == freep)
    4e76:	00093703          	ld	a4,0(s2)
    4e7a:	853e                	mv	a0,a5
    4e7c:	fef719e3          	bne	a4,a5,4e6e <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
    4e80:	8552                	mv	a0,s4
    4e82:	00000097          	auipc	ra,0x0
    4e86:	aa6080e7          	jalr	-1370(ra) # 4928 <sbrk>
  if(p == (char*)-1)
    4e8a:	fd5518e3          	bne	a0,s5,4e5a <malloc+0xac>
        return 0;
    4e8e:	4501                	li	a0,0
    4e90:	bf45                	j	4e40 <malloc+0x92>
