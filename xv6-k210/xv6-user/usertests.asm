
xv6-user/_usertests:     file format elf64-littleriscv


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
      14:	934080e7          	jalr	-1740(ra) # 4944 <open>
    if(fd >= 0){
      18:	02055063          	bgez	a0,38 <copyinstr1+0x38>
    int fd = open((char *)addr, O_CREATE|O_WRONLY);
      1c:	20100593          	li	a1,513
      20:	557d                	li	a0,-1
      22:	00005097          	auipc	ra,0x5
      26:	922080e7          	jalr	-1758(ra) # 4944 <open>
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
      42:	dfa50513          	addi	a0,a0,-518 # 4e38 <malloc+0xee>
      46:	00005097          	auipc	ra,0x5
      4a:	c4c080e7          	jalr	-948(ra) # 4c92 <printf>
      exit(1);
      4e:	4505                	li	a0,1
      50:	00005097          	auipc	ra,0x5
      54:	8b4080e7          	jalr	-1868(ra) # 4904 <exit>

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
      80:	8c8080e7          	jalr	-1848(ra) # 4944 <open>
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
      a8:	db450513          	addi	a0,a0,-588 # 4e58 <malloc+0x10e>
      ac:	00005097          	auipc	ra,0x5
      b0:	be6080e7          	jalr	-1050(ra) # 4c92 <printf>
      printf("bad string:[%s]\n", (char*)p);
      b4:	85a6                	mv	a1,s1
      b6:	00005517          	auipc	a0,0x5
      ba:	dc250513          	addi	a0,a0,-574 # 4e78 <malloc+0x12e>
      be:	00005097          	auipc	ra,0x5
      c2:	bd4080e7          	jalr	-1068(ra) # 4c92 <printf>
      exit(1);
      c6:	4505                	li	a0,1
      c8:	00005097          	auipc	ra,0x5
      cc:	83c080e7          	jalr	-1988(ra) # 4904 <exit>

00000000000000d0 <bsstest>:
void
bsstest(char *s)
{
  int i;

  for(i = 0; i < sizeof(uninit); i++){
      d0:	00008797          	auipc	a5,0x8
      d4:	08078793          	addi	a5,a5,128 # 8150 <uninit>
      d8:	0000a697          	auipc	a3,0xa
      dc:	78868693          	addi	a3,a3,1928 # a860 <buf>
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
      fc:	d9850513          	addi	a0,a0,-616 # 4e90 <malloc+0x146>
     100:	00005097          	auipc	ra,0x5
     104:	b92080e7          	jalr	-1134(ra) # 4c92 <printf>
      exit(1);
     108:	4505                	li	a0,1
     10a:	00004097          	auipc	ra,0x4
     10e:	7fa080e7          	jalr	2042(ra) # 4904 <exit>

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
     124:	d8850513          	addi	a0,a0,-632 # 4ea8 <malloc+0x15e>
     128:	00005097          	auipc	ra,0x5
     12c:	81c080e7          	jalr	-2020(ra) # 4944 <open>
  if(fd < 0){
     130:	02054663          	bltz	a0,15c <opentest+0x4a>
  close(fd);
     134:	00004097          	auipc	ra,0x4
     138:	7f8080e7          	jalr	2040(ra) # 492c <close>
  fd = open("doesnotexist", 0);
     13c:	4581                	li	a1,0
     13e:	00005517          	auipc	a0,0x5
     142:	d8a50513          	addi	a0,a0,-630 # 4ec8 <malloc+0x17e>
     146:	00004097          	auipc	ra,0x4
     14a:	7fe080e7          	jalr	2046(ra) # 4944 <open>
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
     162:	d5250513          	addi	a0,a0,-686 # 4eb0 <malloc+0x166>
     166:	00005097          	auipc	ra,0x5
     16a:	b2c080e7          	jalr	-1236(ra) # 4c92 <printf>
    exit(1);
     16e:	4505                	li	a0,1
     170:	00004097          	auipc	ra,0x4
     174:	794080e7          	jalr	1940(ra) # 4904 <exit>
    printf("%s: open doesnotexist succeeded!\n", s);
     178:	85a6                	mv	a1,s1
     17a:	00005517          	auipc	a0,0x5
     17e:	d5e50513          	addi	a0,a0,-674 # 4ed8 <malloc+0x18e>
     182:	00005097          	auipc	ra,0x5
     186:	b10080e7          	jalr	-1264(ra) # 4c92 <printf>
    exit(1);
     18a:	4505                	li	a0,1
     18c:	00004097          	auipc	ra,0x4
     190:	778080e7          	jalr	1912(ra) # 4904 <exit>

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
     1a8:	d5c50513          	addi	a0,a0,-676 # 4f00 <malloc+0x1b6>
     1ac:	00005097          	auipc	ra,0x5
     1b0:	800080e7          	jalr	-2048(ra) # 49ac <remove>
  int fd1 = open("truncfile", O_CREATE|O_TRUNC|O_WRONLY);
     1b4:	60100593          	li	a1,1537
     1b8:	00005517          	auipc	a0,0x5
     1bc:	d4850513          	addi	a0,a0,-696 # 4f00 <malloc+0x1b6>
     1c0:	00004097          	auipc	ra,0x4
     1c4:	784080e7          	jalr	1924(ra) # 4944 <open>
     1c8:	84aa                	mv	s1,a0
  write(fd1, "abcd", 4);
     1ca:	4611                	li	a2,4
     1cc:	00005597          	auipc	a1,0x5
     1d0:	d4458593          	addi	a1,a1,-700 # 4f10 <malloc+0x1c6>
     1d4:	00004097          	auipc	ra,0x4
     1d8:	750080e7          	jalr	1872(ra) # 4924 <write>
  int fd2 = open("truncfile", O_TRUNC|O_WRONLY);
     1dc:	40100593          	li	a1,1025
     1e0:	00005517          	auipc	a0,0x5
     1e4:	d2050513          	addi	a0,a0,-736 # 4f00 <malloc+0x1b6>
     1e8:	00004097          	auipc	ra,0x4
     1ec:	75c080e7          	jalr	1884(ra) # 4944 <open>
     1f0:	892a                	mv	s2,a0
  int n = write(fd1, "x", 1);
     1f2:	4605                	li	a2,1
     1f4:	00005597          	auipc	a1,0x5
     1f8:	d2458593          	addi	a1,a1,-732 # 4f18 <malloc+0x1ce>
     1fc:	8526                	mv	a0,s1
     1fe:	00004097          	auipc	ra,0x4
     202:	726080e7          	jalr	1830(ra) # 4924 <write>
  if(n != -1){
     206:	57fd                	li	a5,-1
     208:	02f51b63          	bne	a0,a5,23e <truncate2+0xaa>
  remove("truncfile");
     20c:	00005517          	auipc	a0,0x5
     210:	cf450513          	addi	a0,a0,-780 # 4f00 <malloc+0x1b6>
     214:	00004097          	auipc	ra,0x4
     218:	798080e7          	jalr	1944(ra) # 49ac <remove>
  close(fd1);
     21c:	8526                	mv	a0,s1
     21e:	00004097          	auipc	ra,0x4
     222:	70e080e7          	jalr	1806(ra) # 492c <close>
  close(fd2);
     226:	854a                	mv	a0,s2
     228:	00004097          	auipc	ra,0x4
     22c:	704080e7          	jalr	1796(ra) # 492c <close>
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
     246:	cde50513          	addi	a0,a0,-802 # 4f20 <malloc+0x1d6>
     24a:	00005097          	auipc	ra,0x5
     24e:	a48080e7          	jalr	-1464(ra) # 4c92 <printf>
    exit(1);
     252:	4505                	li	a0,1
     254:	00004097          	auipc	ra,0x4
     258:	6b0080e7          	jalr	1712(ra) # 4904 <exit>

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
     26e:	dd678793          	addi	a5,a5,-554 # 7040 <name>
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
     296:	6b2080e7          	jalr	1714(ra) # 4944 <open>
    close(fd);
     29a:	00004097          	auipc	ra,0x4
     29e:	692080e7          	jalr	1682(ra) # 492c <close>
  for(i = 0; i < N; i++){
     2a2:	2485                	addiw	s1,s1,1
     2a4:	0ff4f493          	zext.b	s1,s1
     2a8:	ff3490e3          	bne	s1,s3,288 <createtest+0x2c>
  name[0] = 'a';
     2ac:	00007797          	auipc	a5,0x7
     2b0:	d9478793          	addi	a5,a5,-620 # 7040 <name>
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
     2d4:	6dc080e7          	jalr	1756(ra) # 49ac <remove>
  for(i = 0; i < N; i++){
     2d8:	2485                	addiw	s1,s1,1
     2da:	0ff4f493          	zext.b	s1,s1
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
     30c:	c4050513          	addi	a0,a0,-960 # 4f48 <malloc+0x1fe>
     310:	00004097          	auipc	ra,0x4
     314:	69c080e7          	jalr	1692(ra) # 49ac <remove>
  for(sz = 499; sz < (MAXOPBLOCKS+2)*BSIZE; sz += 471){
     318:	1f300493          	li	s1,499
    fd = open("bigwrite", O_CREATE | O_RDWR);
     31c:	00005a97          	auipc	s5,0x5
     320:	c2ca8a93          	addi	s5,s5,-980 # 4f48 <malloc+0x1fe>
      int cc = write(fd, buf, sz);
     324:	0000aa17          	auipc	s4,0xa
     328:	53ca0a13          	addi	s4,s4,1340 # a860 <buf>
  for(sz = 499; sz < (MAXOPBLOCKS+2)*BSIZE; sz += 471){
     32c:	6b09                	lui	s6,0x2
     32e:	807b0b13          	addi	s6,s6,-2041 # 1807 <forkfork+0x49>
    fd = open("bigwrite", O_CREATE | O_RDWR);
     332:	20200593          	li	a1,514
     336:	8556                	mv	a0,s5
     338:	00004097          	auipc	ra,0x4
     33c:	60c080e7          	jalr	1548(ra) # 4944 <open>
     340:	892a                	mv	s2,a0
    if(fd < 0){
     342:	04054d63          	bltz	a0,39c <bigwrite+0xac>
      int cc = write(fd, buf, sz);
     346:	8626                	mv	a2,s1
     348:	85d2                	mv	a1,s4
     34a:	00004097          	auipc	ra,0x4
     34e:	5da080e7          	jalr	1498(ra) # 4924 <write>
     352:	89aa                	mv	s3,a0
      if(cc != sz){
     354:	06a49263          	bne	s1,a0,3b8 <bigwrite+0xc8>
      int cc = write(fd, buf, sz);
     358:	8626                	mv	a2,s1
     35a:	85d2                	mv	a1,s4
     35c:	854a                	mv	a0,s2
     35e:	00004097          	auipc	ra,0x4
     362:	5c6080e7          	jalr	1478(ra) # 4924 <write>
      if(cc != sz){
     366:	04951a63          	bne	a0,s1,3ba <bigwrite+0xca>
    close(fd);
     36a:	854a                	mv	a0,s2
     36c:	00004097          	auipc	ra,0x4
     370:	5c0080e7          	jalr	1472(ra) # 492c <close>
    remove("bigwrite");
     374:	8556                	mv	a0,s5
     376:	00004097          	auipc	ra,0x4
     37a:	636080e7          	jalr	1590(ra) # 49ac <remove>
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
     3a2:	bba50513          	addi	a0,a0,-1094 # 4f58 <malloc+0x20e>
     3a6:	00005097          	auipc	ra,0x5
     3aa:	8ec080e7          	jalr	-1812(ra) # 4c92 <printf>
      exit(1);
     3ae:	4505                	li	a0,1
     3b0:	00004097          	auipc	ra,0x4
     3b4:	554080e7          	jalr	1364(ra) # 4904 <exit>
      if(cc != sz){
     3b8:	89a6                	mv	s3,s1
        printf("%s: write(%d) ret %d\n", s, sz, cc);
     3ba:	86aa                	mv	a3,a0
     3bc:	864e                	mv	a2,s3
     3be:	85de                	mv	a1,s7
     3c0:	00005517          	auipc	a0,0x5
     3c4:	bb850513          	addi	a0,a0,-1096 # 4f78 <malloc+0x22e>
     3c8:	00005097          	auipc	ra,0x5
     3cc:	8ca080e7          	jalr	-1846(ra) # 4c92 <printf>
        exit(1);
     3d0:	4505                	li	a0,1
     3d2:	00004097          	auipc	ra,0x4
     3d6:	532080e7          	jalr	1330(ra) # 4904 <exit>

00000000000003da <badwrite>:
// file is deleted? if the kernel has this bug, it will panic: balloc:
// out of blocks. assumed_free may need to be raised to be more than
// the number of free blocks. this test takes a long time.
void
badwrite(char *s)
{
     3da:	7179                	addi	sp,sp,-48
     3dc:	f406                	sd	ra,40(sp)
     3de:	f022                	sd	s0,32(sp)
     3e0:	ec26                	sd	s1,24(sp)
     3e2:	e84a                	sd	s2,16(sp)
     3e4:	e44e                	sd	s3,8(sp)
     3e6:	e052                	sd	s4,0(sp)
     3e8:	1800                	addi	s0,sp,48
  int assumed_free = 600;
  
  remove("junk");
     3ea:	00005517          	auipc	a0,0x5
     3ee:	ba650513          	addi	a0,a0,-1114 # 4f90 <malloc+0x246>
     3f2:	00004097          	auipc	ra,0x4
     3f6:	5ba080e7          	jalr	1466(ra) # 49ac <remove>
     3fa:	25800913          	li	s2,600
  for(int i = 0; i < assumed_free; i++){
    int fd = open("junk", O_CREATE|O_WRONLY);
     3fe:	00005997          	auipc	s3,0x5
     402:	b9298993          	addi	s3,s3,-1134 # 4f90 <malloc+0x246>
    if(fd < 0){
      printf("open junk failed\n");
      exit(1);
    }
    write(fd, (char*)0xffffffffffL, 1);
     406:	5a7d                	li	s4,-1
     408:	018a5a13          	srli	s4,s4,0x18
    int fd = open("junk", O_CREATE|O_WRONLY);
     40c:	20100593          	li	a1,513
     410:	854e                	mv	a0,s3
     412:	00004097          	auipc	ra,0x4
     416:	532080e7          	jalr	1330(ra) # 4944 <open>
     41a:	84aa                	mv	s1,a0
    if(fd < 0){
     41c:	06054b63          	bltz	a0,492 <badwrite+0xb8>
    write(fd, (char*)0xffffffffffL, 1);
     420:	4605                	li	a2,1
     422:	85d2                	mv	a1,s4
     424:	00004097          	auipc	ra,0x4
     428:	500080e7          	jalr	1280(ra) # 4924 <write>
    close(fd);
     42c:	8526                	mv	a0,s1
     42e:	00004097          	auipc	ra,0x4
     432:	4fe080e7          	jalr	1278(ra) # 492c <close>
    remove("junk");
     436:	854e                	mv	a0,s3
     438:	00004097          	auipc	ra,0x4
     43c:	574080e7          	jalr	1396(ra) # 49ac <remove>
  for(int i = 0; i < assumed_free; i++){
     440:	397d                	addiw	s2,s2,-1
     442:	fc0915e3          	bnez	s2,40c <badwrite+0x32>
  }

  int fd = open("junk", O_CREATE|O_WRONLY);
     446:	20100593          	li	a1,513
     44a:	00005517          	auipc	a0,0x5
     44e:	b4650513          	addi	a0,a0,-1210 # 4f90 <malloc+0x246>
     452:	00004097          	auipc	ra,0x4
     456:	4f2080e7          	jalr	1266(ra) # 4944 <open>
     45a:	84aa                	mv	s1,a0
  if(fd < 0){
     45c:	04054863          	bltz	a0,4ac <badwrite+0xd2>
    printf("open junk failed\n");
    exit(1);
  }
  if(write(fd, "x", 1) != 1){
     460:	4605                	li	a2,1
     462:	00005597          	auipc	a1,0x5
     466:	ab658593          	addi	a1,a1,-1354 # 4f18 <malloc+0x1ce>
     46a:	00004097          	auipc	ra,0x4
     46e:	4ba080e7          	jalr	1210(ra) # 4924 <write>
     472:	4785                	li	a5,1
     474:	04f50963          	beq	a0,a5,4c6 <badwrite+0xec>
    printf("write failed\n");
     478:	00005517          	auipc	a0,0x5
     47c:	b3850513          	addi	a0,a0,-1224 # 4fb0 <malloc+0x266>
     480:	00005097          	auipc	ra,0x5
     484:	812080e7          	jalr	-2030(ra) # 4c92 <printf>
    exit(1);
     488:	4505                	li	a0,1
     48a:	00004097          	auipc	ra,0x4
     48e:	47a080e7          	jalr	1146(ra) # 4904 <exit>
      printf("open junk failed\n");
     492:	00005517          	auipc	a0,0x5
     496:	b0650513          	addi	a0,a0,-1274 # 4f98 <malloc+0x24e>
     49a:	00004097          	auipc	ra,0x4
     49e:	7f8080e7          	jalr	2040(ra) # 4c92 <printf>
      exit(1);
     4a2:	4505                	li	a0,1
     4a4:	00004097          	auipc	ra,0x4
     4a8:	460080e7          	jalr	1120(ra) # 4904 <exit>
    printf("open junk failed\n");
     4ac:	00005517          	auipc	a0,0x5
     4b0:	aec50513          	addi	a0,a0,-1300 # 4f98 <malloc+0x24e>
     4b4:	00004097          	auipc	ra,0x4
     4b8:	7de080e7          	jalr	2014(ra) # 4c92 <printf>
    exit(1);
     4bc:	4505                	li	a0,1
     4be:	00004097          	auipc	ra,0x4
     4c2:	446080e7          	jalr	1094(ra) # 4904 <exit>
  }
  close(fd);
     4c6:	8526                	mv	a0,s1
     4c8:	00004097          	auipc	ra,0x4
     4cc:	464080e7          	jalr	1124(ra) # 492c <close>
  remove("junk");
     4d0:	00005517          	auipc	a0,0x5
     4d4:	ac050513          	addi	a0,a0,-1344 # 4f90 <malloc+0x246>
     4d8:	00004097          	auipc	ra,0x4
     4dc:	4d4080e7          	jalr	1236(ra) # 49ac <remove>

  exit(0);
     4e0:	4501                	li	a0,0
     4e2:	00004097          	auipc	ra,0x4
     4e6:	422080e7          	jalr	1058(ra) # 4904 <exit>

00000000000004ea <copyin>:
{
     4ea:	7159                	addi	sp,sp,-112
     4ec:	f486                	sd	ra,104(sp)
     4ee:	f0a2                	sd	s0,96(sp)
     4f0:	eca6                	sd	s1,88(sp)
     4f2:	e8ca                	sd	s2,80(sp)
     4f4:	e4ce                	sd	s3,72(sp)
     4f6:	e0d2                	sd	s4,64(sp)
     4f8:	fc56                	sd	s5,56(sp)
     4fa:	1880                	addi	s0,sp,112
  uint64 addrs[] = { 0x80000000LL, 0xffffffffffffffff };
     4fc:	4785                	li	a5,1
     4fe:	07fe                	slli	a5,a5,0x1f
     500:	faf43823          	sd	a5,-80(s0)
     504:	57fd                	li	a5,-1
     506:	faf43c23          	sd	a5,-72(s0)
  for(int ai = 0; ai < 2; ai++){
     50a:	fb040913          	addi	s2,s0,-80
     50e:	fc040793          	addi	a5,s0,-64
     512:	f8f43c23          	sd	a5,-104(s0)
    int fd = open("copyin1", O_CREATE|O_WRONLY);
     516:	00005a17          	auipc	s4,0x5
     51a:	aaaa0a13          	addi	s4,s4,-1366 # 4fc0 <malloc+0x276>
    if(pipe(fds) < 0){
     51e:	fa840a93          	addi	s5,s0,-88
    uint64 addr = addrs[ai];
     522:	00093983          	ld	s3,0(s2)
    int fd = open("copyin1", O_CREATE|O_WRONLY);
     526:	20100593          	li	a1,513
     52a:	8552                	mv	a0,s4
     52c:	00004097          	auipc	ra,0x4
     530:	418080e7          	jalr	1048(ra) # 4944 <open>
     534:	84aa                	mv	s1,a0
    if(fd < 0){
     536:	08054863          	bltz	a0,5c6 <copyin+0xdc>
    int n = write(fd, (void*)addr, 8192);
     53a:	6609                	lui	a2,0x2
     53c:	85ce                	mv	a1,s3
     53e:	00004097          	auipc	ra,0x4
     542:	3e6080e7          	jalr	998(ra) # 4924 <write>
    if(n >= 0){
     546:	08055d63          	bgez	a0,5e0 <copyin+0xf6>
    close(fd);
     54a:	8526                	mv	a0,s1
     54c:	00004097          	auipc	ra,0x4
     550:	3e0080e7          	jalr	992(ra) # 492c <close>
    remove("copyin1");
     554:	8552                	mv	a0,s4
     556:	00004097          	auipc	ra,0x4
     55a:	456080e7          	jalr	1110(ra) # 49ac <remove>
    n = write(1, (char*)addr, 8192);
     55e:	6609                	lui	a2,0x2
     560:	85ce                	mv	a1,s3
     562:	4505                	li	a0,1
     564:	00004097          	auipc	ra,0x4
     568:	3c0080e7          	jalr	960(ra) # 4924 <write>
    if(n > 0){
     56c:	08a04963          	bgtz	a0,5fe <copyin+0x114>
    if(pipe(fds) < 0){
     570:	8556                	mv	a0,s5
     572:	00004097          	auipc	ra,0x4
     576:	3a2080e7          	jalr	930(ra) # 4914 <pipe>
     57a:	0a054163          	bltz	a0,61c <copyin+0x132>
    n = write(fds[1], (char*)addr, 8192);
     57e:	6609                	lui	a2,0x2
     580:	85ce                	mv	a1,s3
     582:	fac42503          	lw	a0,-84(s0)
     586:	00004097          	auipc	ra,0x4
     58a:	39e080e7          	jalr	926(ra) # 4924 <write>
    if(n > 0){
     58e:	0aa04463          	bgtz	a0,636 <copyin+0x14c>
    close(fds[0]);
     592:	fa842503          	lw	a0,-88(s0)
     596:	00004097          	auipc	ra,0x4
     59a:	396080e7          	jalr	918(ra) # 492c <close>
    close(fds[1]);
     59e:	fac42503          	lw	a0,-84(s0)
     5a2:	00004097          	auipc	ra,0x4
     5a6:	38a080e7          	jalr	906(ra) # 492c <close>
  for(int ai = 0; ai < 2; ai++){
     5aa:	0921                	addi	s2,s2,8
     5ac:	f9843783          	ld	a5,-104(s0)
     5b0:	f6f919e3          	bne	s2,a5,522 <copyin+0x38>
}
     5b4:	70a6                	ld	ra,104(sp)
     5b6:	7406                	ld	s0,96(sp)
     5b8:	64e6                	ld	s1,88(sp)
     5ba:	6946                	ld	s2,80(sp)
     5bc:	69a6                	ld	s3,72(sp)
     5be:	6a06                	ld	s4,64(sp)
     5c0:	7ae2                	ld	s5,56(sp)
     5c2:	6165                	addi	sp,sp,112
     5c4:	8082                	ret
      printf("open(copyin1) failed\n");
     5c6:	00005517          	auipc	a0,0x5
     5ca:	a0250513          	addi	a0,a0,-1534 # 4fc8 <malloc+0x27e>
     5ce:	00004097          	auipc	ra,0x4
     5d2:	6c4080e7          	jalr	1732(ra) # 4c92 <printf>
      exit(1);
     5d6:	4505                	li	a0,1
     5d8:	00004097          	auipc	ra,0x4
     5dc:	32c080e7          	jalr	812(ra) # 4904 <exit>
      printf("write(fd, %p, 8192) returned %d, not -1\n", addr, n);
     5e0:	862a                	mv	a2,a0
     5e2:	85ce                	mv	a1,s3
     5e4:	00005517          	auipc	a0,0x5
     5e8:	9fc50513          	addi	a0,a0,-1540 # 4fe0 <malloc+0x296>
     5ec:	00004097          	auipc	ra,0x4
     5f0:	6a6080e7          	jalr	1702(ra) # 4c92 <printf>
      exit(1);
     5f4:	4505                	li	a0,1
     5f6:	00004097          	auipc	ra,0x4
     5fa:	30e080e7          	jalr	782(ra) # 4904 <exit>
      printf("write(1, %p, 8192) returned %d, not -1 or 0\n", addr, n);
     5fe:	862a                	mv	a2,a0
     600:	85ce                	mv	a1,s3
     602:	00005517          	auipc	a0,0x5
     606:	a0e50513          	addi	a0,a0,-1522 # 5010 <malloc+0x2c6>
     60a:	00004097          	auipc	ra,0x4
     60e:	688080e7          	jalr	1672(ra) # 4c92 <printf>
      exit(1);
     612:	4505                	li	a0,1
     614:	00004097          	auipc	ra,0x4
     618:	2f0080e7          	jalr	752(ra) # 4904 <exit>
      printf("pipe() failed\n");
     61c:	00005517          	auipc	a0,0x5
     620:	a2450513          	addi	a0,a0,-1500 # 5040 <malloc+0x2f6>
     624:	00004097          	auipc	ra,0x4
     628:	66e080e7          	jalr	1646(ra) # 4c92 <printf>
      exit(1);
     62c:	4505                	li	a0,1
     62e:	00004097          	auipc	ra,0x4
     632:	2d6080e7          	jalr	726(ra) # 4904 <exit>
      printf("write(pipe, %p, 8192) returned %d, not -1 or 0\n", addr, n);
     636:	862a                	mv	a2,a0
     638:	85ce                	mv	a1,s3
     63a:	00005517          	auipc	a0,0x5
     63e:	a1650513          	addi	a0,a0,-1514 # 5050 <malloc+0x306>
     642:	00004097          	auipc	ra,0x4
     646:	650080e7          	jalr	1616(ra) # 4c92 <printf>
      exit(1);
     64a:	4505                	li	a0,1
     64c:	00004097          	auipc	ra,0x4
     650:	2b8080e7          	jalr	696(ra) # 4904 <exit>

0000000000000654 <copyout>:
{
     654:	7159                	addi	sp,sp,-112
     656:	f486                	sd	ra,104(sp)
     658:	f0a2                	sd	s0,96(sp)
     65a:	eca6                	sd	s1,88(sp)
     65c:	e8ca                	sd	s2,80(sp)
     65e:	e4ce                	sd	s3,72(sp)
     660:	e0d2                	sd	s4,64(sp)
     662:	fc56                	sd	s5,56(sp)
     664:	f85a                	sd	s6,48(sp)
     666:	1880                	addi	s0,sp,112
  uint64 addrs[] = { 0x80000000LL, 0xffffffffffffffff };
     668:	4785                	li	a5,1
     66a:	07fe                	slli	a5,a5,0x1f
     66c:	faf43823          	sd	a5,-80(s0)
     670:	57fd                	li	a5,-1
     672:	faf43c23          	sd	a5,-72(s0)
  for(int ai = 0; ai < 2; ai++){
     676:	fb040913          	addi	s2,s0,-80
     67a:	fc040793          	addi	a5,s0,-64
     67e:	f8f43c23          	sd	a5,-104(s0)
    int fd = open("README", 0);
     682:	00005a97          	auipc	s5,0x5
     686:	9fea8a93          	addi	s5,s5,-1538 # 5080 <malloc+0x336>
    if(pipe(fds) < 0){
     68a:	fa840a13          	addi	s4,s0,-88
    n = write(fds[1], "x", 1);
     68e:	00005b17          	auipc	s6,0x5
     692:	88ab0b13          	addi	s6,s6,-1910 # 4f18 <malloc+0x1ce>
    uint64 addr = addrs[ai];
     696:	00093983          	ld	s3,0(s2)
    int fd = open("README", 0);
     69a:	4581                	li	a1,0
     69c:	8556                	mv	a0,s5
     69e:	00004097          	auipc	ra,0x4
     6a2:	2a6080e7          	jalr	678(ra) # 4944 <open>
     6a6:	84aa                	mv	s1,a0
    if(fd < 0){
     6a8:	08054663          	bltz	a0,734 <copyout+0xe0>
    int n = read(fd, (void*)addr, 8192);
     6ac:	6609                	lui	a2,0x2
     6ae:	85ce                	mv	a1,s3
     6b0:	00004097          	auipc	ra,0x4
     6b4:	26c080e7          	jalr	620(ra) # 491c <read>
    if(n > 0){
     6b8:	08a04b63          	bgtz	a0,74e <copyout+0xfa>
    close(fd);
     6bc:	8526                	mv	a0,s1
     6be:	00004097          	auipc	ra,0x4
     6c2:	26e080e7          	jalr	622(ra) # 492c <close>
    if(pipe(fds) < 0){
     6c6:	8552                	mv	a0,s4
     6c8:	00004097          	auipc	ra,0x4
     6cc:	24c080e7          	jalr	588(ra) # 4914 <pipe>
     6d0:	08054e63          	bltz	a0,76c <copyout+0x118>
    n = write(fds[1], "x", 1);
     6d4:	4605                	li	a2,1
     6d6:	85da                	mv	a1,s6
     6d8:	fac42503          	lw	a0,-84(s0)
     6dc:	00004097          	auipc	ra,0x4
     6e0:	248080e7          	jalr	584(ra) # 4924 <write>
    if(n != 1){
     6e4:	4785                	li	a5,1
     6e6:	0af51063          	bne	a0,a5,786 <copyout+0x132>
    n = read(fds[0], (void*)addr, 8192);
     6ea:	6609                	lui	a2,0x2
     6ec:	85ce                	mv	a1,s3
     6ee:	fa842503          	lw	a0,-88(s0)
     6f2:	00004097          	auipc	ra,0x4
     6f6:	22a080e7          	jalr	554(ra) # 491c <read>
    if(n > 0){
     6fa:	0aa04363          	bgtz	a0,7a0 <copyout+0x14c>
    close(fds[0]);
     6fe:	fa842503          	lw	a0,-88(s0)
     702:	00004097          	auipc	ra,0x4
     706:	22a080e7          	jalr	554(ra) # 492c <close>
    close(fds[1]);
     70a:	fac42503          	lw	a0,-84(s0)
     70e:	00004097          	auipc	ra,0x4
     712:	21e080e7          	jalr	542(ra) # 492c <close>
  for(int ai = 0; ai < 2; ai++){
     716:	0921                	addi	s2,s2,8
     718:	f9843783          	ld	a5,-104(s0)
     71c:	f6f91de3          	bne	s2,a5,696 <copyout+0x42>
}
     720:	70a6                	ld	ra,104(sp)
     722:	7406                	ld	s0,96(sp)
     724:	64e6                	ld	s1,88(sp)
     726:	6946                	ld	s2,80(sp)
     728:	69a6                	ld	s3,72(sp)
     72a:	6a06                	ld	s4,64(sp)
     72c:	7ae2                	ld	s5,56(sp)
     72e:	7b42                	ld	s6,48(sp)
     730:	6165                	addi	sp,sp,112
     732:	8082                	ret
      printf("open(README) failed\n");
     734:	00005517          	auipc	a0,0x5
     738:	95450513          	addi	a0,a0,-1708 # 5088 <malloc+0x33e>
     73c:	00004097          	auipc	ra,0x4
     740:	556080e7          	jalr	1366(ra) # 4c92 <printf>
      exit(1);
     744:	4505                	li	a0,1
     746:	00004097          	auipc	ra,0x4
     74a:	1be080e7          	jalr	446(ra) # 4904 <exit>
      printf("read(fd, %p, 8192) returned %d, not -1 or 0\n", addr, n);
     74e:	862a                	mv	a2,a0
     750:	85ce                	mv	a1,s3
     752:	00005517          	auipc	a0,0x5
     756:	94e50513          	addi	a0,a0,-1714 # 50a0 <malloc+0x356>
     75a:	00004097          	auipc	ra,0x4
     75e:	538080e7          	jalr	1336(ra) # 4c92 <printf>
      exit(1);
     762:	4505                	li	a0,1
     764:	00004097          	auipc	ra,0x4
     768:	1a0080e7          	jalr	416(ra) # 4904 <exit>
      printf("pipe() failed\n");
     76c:	00005517          	auipc	a0,0x5
     770:	8d450513          	addi	a0,a0,-1836 # 5040 <malloc+0x2f6>
     774:	00004097          	auipc	ra,0x4
     778:	51e080e7          	jalr	1310(ra) # 4c92 <printf>
      exit(1);
     77c:	4505                	li	a0,1
     77e:	00004097          	auipc	ra,0x4
     782:	186080e7          	jalr	390(ra) # 4904 <exit>
      printf("pipe write failed\n");
     786:	00005517          	auipc	a0,0x5
     78a:	94a50513          	addi	a0,a0,-1718 # 50d0 <malloc+0x386>
     78e:	00004097          	auipc	ra,0x4
     792:	504080e7          	jalr	1284(ra) # 4c92 <printf>
      exit(1);
     796:	4505                	li	a0,1
     798:	00004097          	auipc	ra,0x4
     79c:	16c080e7          	jalr	364(ra) # 4904 <exit>
      printf("read(pipe, %p, 8192) returned %d, not -1 or 0\n", addr, n);
     7a0:	862a                	mv	a2,a0
     7a2:	85ce                	mv	a1,s3
     7a4:	00005517          	auipc	a0,0x5
     7a8:	94450513          	addi	a0,a0,-1724 # 50e8 <malloc+0x39e>
     7ac:	00004097          	auipc	ra,0x4
     7b0:	4e6080e7          	jalr	1254(ra) # 4c92 <printf>
      exit(1);
     7b4:	4505                	li	a0,1
     7b6:	00004097          	auipc	ra,0x4
     7ba:	14e080e7          	jalr	334(ra) # 4904 <exit>

00000000000007be <truncate1>:
{
     7be:	711d                	addi	sp,sp,-96
     7c0:	ec86                	sd	ra,88(sp)
     7c2:	e8a2                	sd	s0,80(sp)
     7c4:	e4a6                	sd	s1,72(sp)
     7c6:	e0ca                	sd	s2,64(sp)
     7c8:	fc4e                	sd	s3,56(sp)
     7ca:	f852                	sd	s4,48(sp)
     7cc:	f456                	sd	s5,40(sp)
     7ce:	1080                	addi	s0,sp,96
     7d0:	8aaa                	mv	s5,a0
  remove("truncfile");
     7d2:	00004517          	auipc	a0,0x4
     7d6:	72e50513          	addi	a0,a0,1838 # 4f00 <malloc+0x1b6>
     7da:	00004097          	auipc	ra,0x4
     7de:	1d2080e7          	jalr	466(ra) # 49ac <remove>
  int fd1 = open("truncfile", O_CREATE|O_WRONLY|O_TRUNC);
     7e2:	60100593          	li	a1,1537
     7e6:	00004517          	auipc	a0,0x4
     7ea:	71a50513          	addi	a0,a0,1818 # 4f00 <malloc+0x1b6>
     7ee:	00004097          	auipc	ra,0x4
     7f2:	156080e7          	jalr	342(ra) # 4944 <open>
     7f6:	84aa                	mv	s1,a0
  write(fd1, "abcd", 4);
     7f8:	4611                	li	a2,4
     7fa:	00004597          	auipc	a1,0x4
     7fe:	71658593          	addi	a1,a1,1814 # 4f10 <malloc+0x1c6>
     802:	00004097          	auipc	ra,0x4
     806:	122080e7          	jalr	290(ra) # 4924 <write>
  close(fd1);
     80a:	8526                	mv	a0,s1
     80c:	00004097          	auipc	ra,0x4
     810:	120080e7          	jalr	288(ra) # 492c <close>
  int fd2 = open("truncfile", O_RDONLY);
     814:	4581                	li	a1,0
     816:	00004517          	auipc	a0,0x4
     81a:	6ea50513          	addi	a0,a0,1770 # 4f00 <malloc+0x1b6>
     81e:	00004097          	auipc	ra,0x4
     822:	126080e7          	jalr	294(ra) # 4944 <open>
     826:	84aa                	mv	s1,a0
  int n = read(fd2, buf, sizeof(buf));
     828:	02000613          	li	a2,32
     82c:	fa040593          	addi	a1,s0,-96
     830:	00004097          	auipc	ra,0x4
     834:	0ec080e7          	jalr	236(ra) # 491c <read>
  if(n != 4){
     838:	4791                	li	a5,4
     83a:	0cf51e63          	bne	a0,a5,916 <truncate1+0x158>
  fd1 = open("truncfile", O_WRONLY|O_TRUNC);
     83e:	40100593          	li	a1,1025
     842:	00004517          	auipc	a0,0x4
     846:	6be50513          	addi	a0,a0,1726 # 4f00 <malloc+0x1b6>
     84a:	00004097          	auipc	ra,0x4
     84e:	0fa080e7          	jalr	250(ra) # 4944 <open>
     852:	89aa                	mv	s3,a0
  int fd3 = open("truncfile", O_RDONLY);
     854:	4581                	li	a1,0
     856:	00004517          	auipc	a0,0x4
     85a:	6aa50513          	addi	a0,a0,1706 # 4f00 <malloc+0x1b6>
     85e:	00004097          	auipc	ra,0x4
     862:	0e6080e7          	jalr	230(ra) # 4944 <open>
     866:	892a                	mv	s2,a0
  n = read(fd3, buf, sizeof(buf));
     868:	02000613          	li	a2,32
     86c:	fa040593          	addi	a1,s0,-96
     870:	00004097          	auipc	ra,0x4
     874:	0ac080e7          	jalr	172(ra) # 491c <read>
     878:	8a2a                	mv	s4,a0
  if(n != 0){
     87a:	ed4d                	bnez	a0,934 <truncate1+0x176>
  n = read(fd2, buf, sizeof(buf));
     87c:	02000613          	li	a2,32
     880:	fa040593          	addi	a1,s0,-96
     884:	8526                	mv	a0,s1
     886:	00004097          	auipc	ra,0x4
     88a:	096080e7          	jalr	150(ra) # 491c <read>
     88e:	8a2a                	mv	s4,a0
  if(n != 0){
     890:	e971                	bnez	a0,964 <truncate1+0x1a6>
  write(fd1, "abcdef", 6);
     892:	4619                	li	a2,6
     894:	00005597          	auipc	a1,0x5
     898:	8e458593          	addi	a1,a1,-1820 # 5178 <malloc+0x42e>
     89c:	854e                	mv	a0,s3
     89e:	00004097          	auipc	ra,0x4
     8a2:	086080e7          	jalr	134(ra) # 4924 <write>
  n = read(fd3, buf, sizeof(buf));
     8a6:	02000613          	li	a2,32
     8aa:	fa040593          	addi	a1,s0,-96
     8ae:	854a                	mv	a0,s2
     8b0:	00004097          	auipc	ra,0x4
     8b4:	06c080e7          	jalr	108(ra) # 491c <read>
  if(n != 6){
     8b8:	4799                	li	a5,6
     8ba:	0cf51d63          	bne	a0,a5,994 <truncate1+0x1d6>
  n = read(fd2, buf, sizeof(buf));
     8be:	02000613          	li	a2,32
     8c2:	fa040593          	addi	a1,s0,-96
     8c6:	8526                	mv	a0,s1
     8c8:	00004097          	auipc	ra,0x4
     8cc:	054080e7          	jalr	84(ra) # 491c <read>
  if(n != 2){
     8d0:	4789                	li	a5,2
     8d2:	0ef51063          	bne	a0,a5,9b2 <truncate1+0x1f4>
  remove("truncfile");
     8d6:	00004517          	auipc	a0,0x4
     8da:	62a50513          	addi	a0,a0,1578 # 4f00 <malloc+0x1b6>
     8de:	00004097          	auipc	ra,0x4
     8e2:	0ce080e7          	jalr	206(ra) # 49ac <remove>
  close(fd1);
     8e6:	854e                	mv	a0,s3
     8e8:	00004097          	auipc	ra,0x4
     8ec:	044080e7          	jalr	68(ra) # 492c <close>
  close(fd2);
     8f0:	8526                	mv	a0,s1
     8f2:	00004097          	auipc	ra,0x4
     8f6:	03a080e7          	jalr	58(ra) # 492c <close>
  close(fd3);
     8fa:	854a                	mv	a0,s2
     8fc:	00004097          	auipc	ra,0x4
     900:	030080e7          	jalr	48(ra) # 492c <close>
}
     904:	60e6                	ld	ra,88(sp)
     906:	6446                	ld	s0,80(sp)
     908:	64a6                	ld	s1,72(sp)
     90a:	6906                	ld	s2,64(sp)
     90c:	79e2                	ld	s3,56(sp)
     90e:	7a42                	ld	s4,48(sp)
     910:	7aa2                	ld	s5,40(sp)
     912:	6125                	addi	sp,sp,96
     914:	8082                	ret
    printf("%s: read %d bytes, wanted 4\n", s, n);
     916:	862a                	mv	a2,a0
     918:	85d6                	mv	a1,s5
     91a:	00004517          	auipc	a0,0x4
     91e:	7fe50513          	addi	a0,a0,2046 # 5118 <malloc+0x3ce>
     922:	00004097          	auipc	ra,0x4
     926:	370080e7          	jalr	880(ra) # 4c92 <printf>
    exit(1);
     92a:	4505                	li	a0,1
     92c:	00004097          	auipc	ra,0x4
     930:	fd8080e7          	jalr	-40(ra) # 4904 <exit>
    printf("aaa fd3=%d\n", fd3);
     934:	85ca                	mv	a1,s2
     936:	00005517          	auipc	a0,0x5
     93a:	80250513          	addi	a0,a0,-2046 # 5138 <malloc+0x3ee>
     93e:	00004097          	auipc	ra,0x4
     942:	354080e7          	jalr	852(ra) # 4c92 <printf>
    printf("%s: read %d bytes, wanted 0\n", s, n);
     946:	8652                	mv	a2,s4
     948:	85d6                	mv	a1,s5
     94a:	00004517          	auipc	a0,0x4
     94e:	7fe50513          	addi	a0,a0,2046 # 5148 <malloc+0x3fe>
     952:	00004097          	auipc	ra,0x4
     956:	340080e7          	jalr	832(ra) # 4c92 <printf>
    exit(1);
     95a:	4505                	li	a0,1
     95c:	00004097          	auipc	ra,0x4
     960:	fa8080e7          	jalr	-88(ra) # 4904 <exit>
    printf("bbb fd2=%d\n", fd2);
     964:	85a6                	mv	a1,s1
     966:	00005517          	auipc	a0,0x5
     96a:	80250513          	addi	a0,a0,-2046 # 5168 <malloc+0x41e>
     96e:	00004097          	auipc	ra,0x4
     972:	324080e7          	jalr	804(ra) # 4c92 <printf>
    printf("%s: read %d bytes, wanted 0\n", s, n);
     976:	8652                	mv	a2,s4
     978:	85d6                	mv	a1,s5
     97a:	00004517          	auipc	a0,0x4
     97e:	7ce50513          	addi	a0,a0,1998 # 5148 <malloc+0x3fe>
     982:	00004097          	auipc	ra,0x4
     986:	310080e7          	jalr	784(ra) # 4c92 <printf>
    exit(1);
     98a:	4505                	li	a0,1
     98c:	00004097          	auipc	ra,0x4
     990:	f78080e7          	jalr	-136(ra) # 4904 <exit>
    printf("%s: read %d bytes, wanted 6\n", s, n);
     994:	862a                	mv	a2,a0
     996:	85d6                	mv	a1,s5
     998:	00004517          	auipc	a0,0x4
     99c:	7e850513          	addi	a0,a0,2024 # 5180 <malloc+0x436>
     9a0:	00004097          	auipc	ra,0x4
     9a4:	2f2080e7          	jalr	754(ra) # 4c92 <printf>
    exit(1);
     9a8:	4505                	li	a0,1
     9aa:	00004097          	auipc	ra,0x4
     9ae:	f5a080e7          	jalr	-166(ra) # 4904 <exit>
    printf("%s: read %d bytes, wanted 2\n", s, n);
     9b2:	862a                	mv	a2,a0
     9b4:	85d6                	mv	a1,s5
     9b6:	00004517          	auipc	a0,0x4
     9ba:	7ea50513          	addi	a0,a0,2026 # 51a0 <malloc+0x456>
     9be:	00004097          	auipc	ra,0x4
     9c2:	2d4080e7          	jalr	724(ra) # 4c92 <printf>
    exit(1);
     9c6:	4505                	li	a0,1
     9c8:	00004097          	auipc	ra,0x4
     9cc:	f3c080e7          	jalr	-196(ra) # 4904 <exit>

00000000000009d0 <writetest>:
{
     9d0:	7139                	addi	sp,sp,-64
     9d2:	fc06                	sd	ra,56(sp)
     9d4:	f822                	sd	s0,48(sp)
     9d6:	f426                	sd	s1,40(sp)
     9d8:	f04a                	sd	s2,32(sp)
     9da:	ec4e                	sd	s3,24(sp)
     9dc:	e852                	sd	s4,16(sp)
     9de:	e456                	sd	s5,8(sp)
     9e0:	e05a                	sd	s6,0(sp)
     9e2:	0080                	addi	s0,sp,64
     9e4:	8b2a                	mv	s6,a0
  fd = open("small", O_CREATE|O_RDWR);
     9e6:	20200593          	li	a1,514
     9ea:	00004517          	auipc	a0,0x4
     9ee:	7d650513          	addi	a0,a0,2006 # 51c0 <malloc+0x476>
     9f2:	00004097          	auipc	ra,0x4
     9f6:	f52080e7          	jalr	-174(ra) # 4944 <open>
  if(fd < 0){
     9fa:	0a054d63          	bltz	a0,ab4 <writetest+0xe4>
     9fe:	892a                	mv	s2,a0
     a00:	4481                	li	s1,0
    if(write(fd, "aaaaaaaaaa", SZ) != SZ){
     a02:	00004997          	auipc	s3,0x4
     a06:	7e698993          	addi	s3,s3,2022 # 51e8 <malloc+0x49e>
    if(write(fd, "bbbbbbbbbb", SZ) != SZ){
     a0a:	00005a97          	auipc	s5,0x5
     a0e:	816a8a93          	addi	s5,s5,-2026 # 5220 <malloc+0x4d6>
  for(i = 0; i < N; i++){
     a12:	06400a13          	li	s4,100
    if(write(fd, "aaaaaaaaaa", SZ) != SZ){
     a16:	4629                	li	a2,10
     a18:	85ce                	mv	a1,s3
     a1a:	854a                	mv	a0,s2
     a1c:	00004097          	auipc	ra,0x4
     a20:	f08080e7          	jalr	-248(ra) # 4924 <write>
     a24:	47a9                	li	a5,10
     a26:	0af51563          	bne	a0,a5,ad0 <writetest+0x100>
    if(write(fd, "bbbbbbbbbb", SZ) != SZ){
     a2a:	4629                	li	a2,10
     a2c:	85d6                	mv	a1,s5
     a2e:	854a                	mv	a0,s2
     a30:	00004097          	auipc	ra,0x4
     a34:	ef4080e7          	jalr	-268(ra) # 4924 <write>
     a38:	47a9                	li	a5,10
     a3a:	0af51963          	bne	a0,a5,aec <writetest+0x11c>
  for(i = 0; i < N; i++){
     a3e:	2485                	addiw	s1,s1,1
     a40:	fd449be3          	bne	s1,s4,a16 <writetest+0x46>
  close(fd);
     a44:	854a                	mv	a0,s2
     a46:	00004097          	auipc	ra,0x4
     a4a:	ee6080e7          	jalr	-282(ra) # 492c <close>
  fd = open("small", O_RDONLY);
     a4e:	4581                	li	a1,0
     a50:	00004517          	auipc	a0,0x4
     a54:	77050513          	addi	a0,a0,1904 # 51c0 <malloc+0x476>
     a58:	00004097          	auipc	ra,0x4
     a5c:	eec080e7          	jalr	-276(ra) # 4944 <open>
     a60:	84aa                	mv	s1,a0
  if(fd < 0){
     a62:	0a054363          	bltz	a0,b08 <writetest+0x138>
  i = read(fd, buf, N*SZ*2);
     a66:	7d000613          	li	a2,2000
     a6a:	0000a597          	auipc	a1,0xa
     a6e:	df658593          	addi	a1,a1,-522 # a860 <buf>
     a72:	00004097          	auipc	ra,0x4
     a76:	eaa080e7          	jalr	-342(ra) # 491c <read>
  if(i != N*SZ*2){
     a7a:	7d000793          	li	a5,2000
     a7e:	0af51363          	bne	a0,a5,b24 <writetest+0x154>
  close(fd);
     a82:	8526                	mv	a0,s1
     a84:	00004097          	auipc	ra,0x4
     a88:	ea8080e7          	jalr	-344(ra) # 492c <close>
  if(remove("small") < 0){
     a8c:	00004517          	auipc	a0,0x4
     a90:	73450513          	addi	a0,a0,1844 # 51c0 <malloc+0x476>
     a94:	00004097          	auipc	ra,0x4
     a98:	f18080e7          	jalr	-232(ra) # 49ac <remove>
     a9c:	0a054263          	bltz	a0,b40 <writetest+0x170>
}
     aa0:	70e2                	ld	ra,56(sp)
     aa2:	7442                	ld	s0,48(sp)
     aa4:	74a2                	ld	s1,40(sp)
     aa6:	7902                	ld	s2,32(sp)
     aa8:	69e2                	ld	s3,24(sp)
     aaa:	6a42                	ld	s4,16(sp)
     aac:	6aa2                	ld	s5,8(sp)
     aae:	6b02                	ld	s6,0(sp)
     ab0:	6121                	addi	sp,sp,64
     ab2:	8082                	ret
    printf("%s: error: creat small failed!\n", s);
     ab4:	85da                	mv	a1,s6
     ab6:	00004517          	auipc	a0,0x4
     aba:	71250513          	addi	a0,a0,1810 # 51c8 <malloc+0x47e>
     abe:	00004097          	auipc	ra,0x4
     ac2:	1d4080e7          	jalr	468(ra) # 4c92 <printf>
    exit(1);
     ac6:	4505                	li	a0,1
     ac8:	00004097          	auipc	ra,0x4
     acc:	e3c080e7          	jalr	-452(ra) # 4904 <exit>
      printf("%s: error: write aa %d new file failed\n", i);
     ad0:	85a6                	mv	a1,s1
     ad2:	00004517          	auipc	a0,0x4
     ad6:	72650513          	addi	a0,a0,1830 # 51f8 <malloc+0x4ae>
     ada:	00004097          	auipc	ra,0x4
     ade:	1b8080e7          	jalr	440(ra) # 4c92 <printf>
      exit(1);
     ae2:	4505                	li	a0,1
     ae4:	00004097          	auipc	ra,0x4
     ae8:	e20080e7          	jalr	-480(ra) # 4904 <exit>
      printf("%s: error: write bb %d new file failed\n", i);
     aec:	85a6                	mv	a1,s1
     aee:	00004517          	auipc	a0,0x4
     af2:	74250513          	addi	a0,a0,1858 # 5230 <malloc+0x4e6>
     af6:	00004097          	auipc	ra,0x4
     afa:	19c080e7          	jalr	412(ra) # 4c92 <printf>
      exit(1);
     afe:	4505                	li	a0,1
     b00:	00004097          	auipc	ra,0x4
     b04:	e04080e7          	jalr	-508(ra) # 4904 <exit>
    printf("%s: error: open small failed!\n", s);
     b08:	85da                	mv	a1,s6
     b0a:	00004517          	auipc	a0,0x4
     b0e:	74e50513          	addi	a0,a0,1870 # 5258 <malloc+0x50e>
     b12:	00004097          	auipc	ra,0x4
     b16:	180080e7          	jalr	384(ra) # 4c92 <printf>
    exit(1);
     b1a:	4505                	li	a0,1
     b1c:	00004097          	auipc	ra,0x4
     b20:	de8080e7          	jalr	-536(ra) # 4904 <exit>
    printf("%s: read failed\n", s);
     b24:	85da                	mv	a1,s6
     b26:	00004517          	auipc	a0,0x4
     b2a:	75250513          	addi	a0,a0,1874 # 5278 <malloc+0x52e>
     b2e:	00004097          	auipc	ra,0x4
     b32:	164080e7          	jalr	356(ra) # 4c92 <printf>
    exit(1);
     b36:	4505                	li	a0,1
     b38:	00004097          	auipc	ra,0x4
     b3c:	dcc080e7          	jalr	-564(ra) # 4904 <exit>
    printf("%s: remove small failed\n", s);
     b40:	85da                	mv	a1,s6
     b42:	00004517          	auipc	a0,0x4
     b46:	74e50513          	addi	a0,a0,1870 # 5290 <malloc+0x546>
     b4a:	00004097          	auipc	ra,0x4
     b4e:	148080e7          	jalr	328(ra) # 4c92 <printf>
    exit(1);
     b52:	4505                	li	a0,1
     b54:	00004097          	auipc	ra,0x4
     b58:	db0080e7          	jalr	-592(ra) # 4904 <exit>

0000000000000b5c <writebig>:
{
     b5c:	7179                	addi	sp,sp,-48
     b5e:	f406                	sd	ra,40(sp)
     b60:	f022                	sd	s0,32(sp)
     b62:	ec26                	sd	s1,24(sp)
     b64:	e84a                	sd	s2,16(sp)
     b66:	e44e                	sd	s3,8(sp)
     b68:	e052                	sd	s4,0(sp)
     b6a:	1800                	addi	s0,sp,48
     b6c:	8a2a                	mv	s4,a0
  fd = open("big", O_CREATE|O_RDWR);
     b6e:	20200593          	li	a1,514
     b72:	00004517          	auipc	a0,0x4
     b76:	73e50513          	addi	a0,a0,1854 # 52b0 <malloc+0x566>
     b7a:	00004097          	auipc	ra,0x4
     b7e:	dca080e7          	jalr	-566(ra) # 4944 <open>
     b82:	89aa                	mv	s3,a0
  for(i = 0; i < MAXFILE; i++){
     b84:	4481                	li	s1,0
    ((int*)buf)[0] = i;
     b86:	0000a917          	auipc	s2,0xa
     b8a:	cda90913          	addi	s2,s2,-806 # a860 <buf>
  if(fd < 0){
     b8e:	06054e63          	bltz	a0,c0a <writebig+0xae>
    ((int*)buf)[0] = i;
     b92:	00992023          	sw	s1,0(s2)
    if(write(fd, buf, BSIZE) != BSIZE){
     b96:	20000613          	li	a2,512
     b9a:	85ca                	mv	a1,s2
     b9c:	854e                	mv	a0,s3
     b9e:	00004097          	auipc	ra,0x4
     ba2:	d86080e7          	jalr	-634(ra) # 4924 <write>
     ba6:	20000793          	li	a5,512
     baa:	06f51e63          	bne	a0,a5,c26 <writebig+0xca>
  for(i = 0; i < MAXFILE; i++){
     bae:	2485                	addiw	s1,s1,1
     bb0:	20000793          	li	a5,512
     bb4:	fcf49fe3          	bne	s1,a5,b92 <writebig+0x36>
  close(fd);
     bb8:	854e                	mv	a0,s3
     bba:	00004097          	auipc	ra,0x4
     bbe:	d72080e7          	jalr	-654(ra) # 492c <close>
  fd = open("big", O_RDONLY);
     bc2:	4581                	li	a1,0
     bc4:	00004517          	auipc	a0,0x4
     bc8:	6ec50513          	addi	a0,a0,1772 # 52b0 <malloc+0x566>
     bcc:	00004097          	auipc	ra,0x4
     bd0:	d78080e7          	jalr	-648(ra) # 4944 <open>
     bd4:	89aa                	mv	s3,a0
  n = 0;
     bd6:	4481                	li	s1,0
    i = read(fd, buf, BSIZE);
     bd8:	0000a917          	auipc	s2,0xa
     bdc:	c8890913          	addi	s2,s2,-888 # a860 <buf>
  if(fd < 0){
     be0:	06054163          	bltz	a0,c42 <writebig+0xe6>
    i = read(fd, buf, BSIZE);
     be4:	20000613          	li	a2,512
     be8:	85ca                	mv	a1,s2
     bea:	854e                	mv	a0,s3
     bec:	00004097          	auipc	ra,0x4
     bf0:	d30080e7          	jalr	-720(ra) # 491c <read>
    if(i == 0){
     bf4:	c52d                	beqz	a0,c5e <writebig+0x102>
    } else if(i != BSIZE){
     bf6:	20000793          	li	a5,512
     bfa:	0af51c63          	bne	a0,a5,cb2 <writebig+0x156>
    if(((int*)buf)[0] != n){
     bfe:	00092603          	lw	a2,0(s2)
     c02:	0c961663          	bne	a2,s1,cce <writebig+0x172>
    n++;
     c06:	2485                	addiw	s1,s1,1
    i = read(fd, buf, BSIZE);
     c08:	bff1                	j	be4 <writebig+0x88>
    printf("%s: error: creat big failed!\n", s);
     c0a:	85d2                	mv	a1,s4
     c0c:	00004517          	auipc	a0,0x4
     c10:	6ac50513          	addi	a0,a0,1708 # 52b8 <malloc+0x56e>
     c14:	00004097          	auipc	ra,0x4
     c18:	07e080e7          	jalr	126(ra) # 4c92 <printf>
    exit(1);
     c1c:	4505                	li	a0,1
     c1e:	00004097          	auipc	ra,0x4
     c22:	ce6080e7          	jalr	-794(ra) # 4904 <exit>
      printf("%s: error: write big file failed\n", i);
     c26:	85a6                	mv	a1,s1
     c28:	00004517          	auipc	a0,0x4
     c2c:	6b050513          	addi	a0,a0,1712 # 52d8 <malloc+0x58e>
     c30:	00004097          	auipc	ra,0x4
     c34:	062080e7          	jalr	98(ra) # 4c92 <printf>
      exit(1);
     c38:	4505                	li	a0,1
     c3a:	00004097          	auipc	ra,0x4
     c3e:	cca080e7          	jalr	-822(ra) # 4904 <exit>
    printf("%s: error: open big failed!\n", s);
     c42:	85d2                	mv	a1,s4
     c44:	00004517          	auipc	a0,0x4
     c48:	6bc50513          	addi	a0,a0,1724 # 5300 <malloc+0x5b6>
     c4c:	00004097          	auipc	ra,0x4
     c50:	046080e7          	jalr	70(ra) # 4c92 <printf>
    exit(1);
     c54:	4505                	li	a0,1
     c56:	00004097          	auipc	ra,0x4
     c5a:	cae080e7          	jalr	-850(ra) # 4904 <exit>
      if(n == MAXFILE - 1){
     c5e:	1ff00793          	li	a5,511
     c62:	02f48963          	beq	s1,a5,c94 <writebig+0x138>
  close(fd);
     c66:	854e                	mv	a0,s3
     c68:	00004097          	auipc	ra,0x4
     c6c:	cc4080e7          	jalr	-828(ra) # 492c <close>
  if(remove("big") < 0){
     c70:	00004517          	auipc	a0,0x4
     c74:	64050513          	addi	a0,a0,1600 # 52b0 <malloc+0x566>
     c78:	00004097          	auipc	ra,0x4
     c7c:	d34080e7          	jalr	-716(ra) # 49ac <remove>
     c80:	06054563          	bltz	a0,cea <writebig+0x18e>
}
     c84:	70a2                	ld	ra,40(sp)
     c86:	7402                	ld	s0,32(sp)
     c88:	64e2                	ld	s1,24(sp)
     c8a:	6942                	ld	s2,16(sp)
     c8c:	69a2                	ld	s3,8(sp)
     c8e:	6a02                	ld	s4,0(sp)
     c90:	6145                	addi	sp,sp,48
     c92:	8082                	ret
        printf("%s: read only %d blocks from big", n);
     c94:	1ff00593          	li	a1,511
     c98:	00004517          	auipc	a0,0x4
     c9c:	68850513          	addi	a0,a0,1672 # 5320 <malloc+0x5d6>
     ca0:	00004097          	auipc	ra,0x4
     ca4:	ff2080e7          	jalr	-14(ra) # 4c92 <printf>
        exit(1);
     ca8:	4505                	li	a0,1
     caa:	00004097          	auipc	ra,0x4
     cae:	c5a080e7          	jalr	-934(ra) # 4904 <exit>
      printf("%s: read failed %d\n", i);
     cb2:	85aa                	mv	a1,a0
     cb4:	00004517          	auipc	a0,0x4
     cb8:	69450513          	addi	a0,a0,1684 # 5348 <malloc+0x5fe>
     cbc:	00004097          	auipc	ra,0x4
     cc0:	fd6080e7          	jalr	-42(ra) # 4c92 <printf>
      exit(1);
     cc4:	4505                	li	a0,1
     cc6:	00004097          	auipc	ra,0x4
     cca:	c3e080e7          	jalr	-962(ra) # 4904 <exit>
      printf("%s: read content of block %d is %d\n",
     cce:	85a6                	mv	a1,s1
     cd0:	00004517          	auipc	a0,0x4
     cd4:	69050513          	addi	a0,a0,1680 # 5360 <malloc+0x616>
     cd8:	00004097          	auipc	ra,0x4
     cdc:	fba080e7          	jalr	-70(ra) # 4c92 <printf>
      exit(1);
     ce0:	4505                	li	a0,1
     ce2:	00004097          	auipc	ra,0x4
     ce6:	c22080e7          	jalr	-990(ra) # 4904 <exit>
    printf("%s: remove big failed\n", s);
     cea:	85d2                	mv	a1,s4
     cec:	00004517          	auipc	a0,0x4
     cf0:	69c50513          	addi	a0,a0,1692 # 5388 <malloc+0x63e>
     cf4:	00004097          	auipc	ra,0x4
     cf8:	f9e080e7          	jalr	-98(ra) # 4c92 <printf>
    exit(1);
     cfc:	4505                	li	a0,1
     cfe:	00004097          	auipc	ra,0x4
     d02:	c06080e7          	jalr	-1018(ra) # 4904 <exit>

0000000000000d06 <removeread>:
{
     d06:	7179                	addi	sp,sp,-48
     d08:	f406                	sd	ra,40(sp)
     d0a:	f022                	sd	s0,32(sp)
     d0c:	ec26                	sd	s1,24(sp)
     d0e:	e84a                	sd	s2,16(sp)
     d10:	e44e                	sd	s3,8(sp)
     d12:	1800                	addi	s0,sp,48
     d14:	89aa                	mv	s3,a0
  fd = open("removeread", O_CREATE | O_RDWR);
     d16:	20200593          	li	a1,514
     d1a:	00004517          	auipc	a0,0x4
     d1e:	68650513          	addi	a0,a0,1670 # 53a0 <malloc+0x656>
     d22:	00004097          	auipc	ra,0x4
     d26:	c22080e7          	jalr	-990(ra) # 4944 <open>
  if(fd < 0){
     d2a:	0e054763          	bltz	a0,e18 <removeread+0x112>
     d2e:	84aa                	mv	s1,a0
  write(fd, "hello", SZ);
     d30:	4615                	li	a2,5
     d32:	00004597          	auipc	a1,0x4
     d36:	69e58593          	addi	a1,a1,1694 # 53d0 <malloc+0x686>
     d3a:	00004097          	auipc	ra,0x4
     d3e:	bea080e7          	jalr	-1046(ra) # 4924 <write>
  close(fd);
     d42:	8526                	mv	a0,s1
     d44:	00004097          	auipc	ra,0x4
     d48:	be8080e7          	jalr	-1048(ra) # 492c <close>
  fd = open("removeread", O_RDWR);
     d4c:	4589                	li	a1,2
     d4e:	00004517          	auipc	a0,0x4
     d52:	65250513          	addi	a0,a0,1618 # 53a0 <malloc+0x656>
     d56:	00004097          	auipc	ra,0x4
     d5a:	bee080e7          	jalr	-1042(ra) # 4944 <open>
     d5e:	84aa                	mv	s1,a0
  if(fd < 0){
     d60:	0c054a63          	bltz	a0,e34 <removeread+0x12e>
  if(remove("removeread") != 0){
     d64:	00004517          	auipc	a0,0x4
     d68:	63c50513          	addi	a0,a0,1596 # 53a0 <malloc+0x656>
     d6c:	00004097          	auipc	ra,0x4
     d70:	c40080e7          	jalr	-960(ra) # 49ac <remove>
     d74:	ed71                	bnez	a0,e50 <removeread+0x14a>
  fd1 = open("removeread", O_CREATE | O_RDWR);
     d76:	20200593          	li	a1,514
     d7a:	00004517          	auipc	a0,0x4
     d7e:	62650513          	addi	a0,a0,1574 # 53a0 <malloc+0x656>
     d82:	00004097          	auipc	ra,0x4
     d86:	bc2080e7          	jalr	-1086(ra) # 4944 <open>
     d8a:	892a                	mv	s2,a0
  write(fd1, "yyy", 3);
     d8c:	460d                	li	a2,3
     d8e:	00004597          	auipc	a1,0x4
     d92:	68a58593          	addi	a1,a1,1674 # 5418 <malloc+0x6ce>
     d96:	00004097          	auipc	ra,0x4
     d9a:	b8e080e7          	jalr	-1138(ra) # 4924 <write>
  close(fd1);
     d9e:	854a                	mv	a0,s2
     da0:	00004097          	auipc	ra,0x4
     da4:	b8c080e7          	jalr	-1140(ra) # 492c <close>
  if(read(fd, buf, sizeof(buf)) != SZ){
     da8:	6609                	lui	a2,0x2
     daa:	80060613          	addi	a2,a2,-2048 # 1800 <forkfork+0x42>
     dae:	0000a597          	auipc	a1,0xa
     db2:	ab258593          	addi	a1,a1,-1358 # a860 <buf>
     db6:	8526                	mv	a0,s1
     db8:	00004097          	auipc	ra,0x4
     dbc:	b64080e7          	jalr	-1180(ra) # 491c <read>
     dc0:	4795                	li	a5,5
     dc2:	0af51563          	bne	a0,a5,e6c <removeread+0x166>
  if(buf[0] != 'h'){
     dc6:	0000a717          	auipc	a4,0xa
     dca:	a9a74703          	lbu	a4,-1382(a4) # a860 <buf>
     dce:	06800793          	li	a5,104
     dd2:	0af71b63          	bne	a4,a5,e88 <removeread+0x182>
  if(write(fd, buf, 10) != 10){
     dd6:	4629                	li	a2,10
     dd8:	0000a597          	auipc	a1,0xa
     ddc:	a8858593          	addi	a1,a1,-1400 # a860 <buf>
     de0:	8526                	mv	a0,s1
     de2:	00004097          	auipc	ra,0x4
     de6:	b42080e7          	jalr	-1214(ra) # 4924 <write>
     dea:	47a9                	li	a5,10
     dec:	0af51c63          	bne	a0,a5,ea4 <removeread+0x19e>
  close(fd);
     df0:	8526                	mv	a0,s1
     df2:	00004097          	auipc	ra,0x4
     df6:	b3a080e7          	jalr	-1222(ra) # 492c <close>
  remove("removeread");
     dfa:	00004517          	auipc	a0,0x4
     dfe:	5a650513          	addi	a0,a0,1446 # 53a0 <malloc+0x656>
     e02:	00004097          	auipc	ra,0x4
     e06:	baa080e7          	jalr	-1110(ra) # 49ac <remove>
}
     e0a:	70a2                	ld	ra,40(sp)
     e0c:	7402                	ld	s0,32(sp)
     e0e:	64e2                	ld	s1,24(sp)
     e10:	6942                	ld	s2,16(sp)
     e12:	69a2                	ld	s3,8(sp)
     e14:	6145                	addi	sp,sp,48
     e16:	8082                	ret
    printf("%s: create removeread failed\n", s);
     e18:	85ce                	mv	a1,s3
     e1a:	00004517          	auipc	a0,0x4
     e1e:	59650513          	addi	a0,a0,1430 # 53b0 <malloc+0x666>
     e22:	00004097          	auipc	ra,0x4
     e26:	e70080e7          	jalr	-400(ra) # 4c92 <printf>
    exit(1);
     e2a:	4505                	li	a0,1
     e2c:	00004097          	auipc	ra,0x4
     e30:	ad8080e7          	jalr	-1320(ra) # 4904 <exit>
    printf("%s: open removeread failed\n", s);
     e34:	85ce                	mv	a1,s3
     e36:	00004517          	auipc	a0,0x4
     e3a:	5a250513          	addi	a0,a0,1442 # 53d8 <malloc+0x68e>
     e3e:	00004097          	auipc	ra,0x4
     e42:	e54080e7          	jalr	-428(ra) # 4c92 <printf>
    exit(1);
     e46:	4505                	li	a0,1
     e48:	00004097          	auipc	ra,0x4
     e4c:	abc080e7          	jalr	-1348(ra) # 4904 <exit>
    printf("%s: remove removeread failed\n", s);
     e50:	85ce                	mv	a1,s3
     e52:	00004517          	auipc	a0,0x4
     e56:	5a650513          	addi	a0,a0,1446 # 53f8 <malloc+0x6ae>
     e5a:	00004097          	auipc	ra,0x4
     e5e:	e38080e7          	jalr	-456(ra) # 4c92 <printf>
    exit(1);
     e62:	4505                	li	a0,1
     e64:	00004097          	auipc	ra,0x4
     e68:	aa0080e7          	jalr	-1376(ra) # 4904 <exit>
    printf("%s: removeread read failed", s);
     e6c:	85ce                	mv	a1,s3
     e6e:	00004517          	auipc	a0,0x4
     e72:	5b250513          	addi	a0,a0,1458 # 5420 <malloc+0x6d6>
     e76:	00004097          	auipc	ra,0x4
     e7a:	e1c080e7          	jalr	-484(ra) # 4c92 <printf>
    exit(1);
     e7e:	4505                	li	a0,1
     e80:	00004097          	auipc	ra,0x4
     e84:	a84080e7          	jalr	-1404(ra) # 4904 <exit>
    printf("%s: removeread wrong data\n", s);
     e88:	85ce                	mv	a1,s3
     e8a:	00004517          	auipc	a0,0x4
     e8e:	5b650513          	addi	a0,a0,1462 # 5440 <malloc+0x6f6>
     e92:	00004097          	auipc	ra,0x4
     e96:	e00080e7          	jalr	-512(ra) # 4c92 <printf>
    exit(1);
     e9a:	4505                	li	a0,1
     e9c:	00004097          	auipc	ra,0x4
     ea0:	a68080e7          	jalr	-1432(ra) # 4904 <exit>
    printf("%s: removeread write failed\n", s);
     ea4:	85ce                	mv	a1,s3
     ea6:	00004517          	auipc	a0,0x4
     eaa:	5ba50513          	addi	a0,a0,1466 # 5460 <malloc+0x716>
     eae:	00004097          	auipc	ra,0x4
     eb2:	de4080e7          	jalr	-540(ra) # 4c92 <printf>
    exit(1);
     eb6:	4505                	li	a0,1
     eb8:	00004097          	auipc	ra,0x4
     ebc:	a4c080e7          	jalr	-1460(ra) # 4904 <exit>

0000000000000ec0 <pgbug>:
{
     ec0:	7179                	addi	sp,sp,-48
     ec2:	f406                	sd	ra,40(sp)
     ec4:	f022                	sd	s0,32(sp)
     ec6:	ec26                	sd	s1,24(sp)
     ec8:	1800                	addi	s0,sp,48
  argv[0] = 0;
     eca:	fc043c23          	sd	zero,-40(s0)
  exec((char*)0xeaeb0b5b00002f5e, argv);
     ece:	00006497          	auipc	s1,0x6
     ed2:	d8a4b483          	ld	s1,-630(s1) # 6c58 <malloc+0x1f0e>
     ed6:	fd840593          	addi	a1,s0,-40
     eda:	8526                	mv	a0,s1
     edc:	00004097          	auipc	ra,0x4
     ee0:	a60080e7          	jalr	-1440(ra) # 493c <exec>
  pipe((int*)0xeaeb0b5b00002f5e);
     ee4:	8526                	mv	a0,s1
     ee6:	00004097          	auipc	ra,0x4
     eea:	a2e080e7          	jalr	-1490(ra) # 4914 <pipe>
  exit(0);
     eee:	4501                	li	a0,0
     ef0:	00004097          	auipc	ra,0x4
     ef4:	a14080e7          	jalr	-1516(ra) # 4904 <exit>

0000000000000ef8 <badarg>:

// regression test. test whether exec() leaks memory if one of the
// arguments is invalid. the test passes if the kernel doesn't panic.
void
badarg(char *s)
{
     ef8:	7139                	addi	sp,sp,-64
     efa:	fc06                	sd	ra,56(sp)
     efc:	f822                	sd	s0,48(sp)
     efe:	f426                	sd	s1,40(sp)
     f00:	f04a                	sd	s2,32(sp)
     f02:	ec4e                	sd	s3,24(sp)
     f04:	e852                	sd	s4,16(sp)
     f06:	0080                	addi	s0,sp,64
     f08:	64b1                	lui	s1,0xc
     f0a:	35048493          	addi	s1,s1,848 # c350 <__BSS_END__+0x2d8>
  for(int i = 0; i < 50000; i++){
    char *argv[2];
    argv[0] = (char*)0xffffffff;
     f0e:	597d                	li	s2,-1
     f10:	02095913          	srli	s2,s2,0x20
    argv[1] = 0;
    exec("echo", argv);
     f14:	fc040a13          	addi	s4,s0,-64
     f18:	00004997          	auipc	s3,0x4
     f1c:	f9098993          	addi	s3,s3,-112 # 4ea8 <malloc+0x15e>
    argv[0] = (char*)0xffffffff;
     f20:	fd243023          	sd	s2,-64(s0)
    argv[1] = 0;
     f24:	fc043423          	sd	zero,-56(s0)
    exec("echo", argv);
     f28:	85d2                	mv	a1,s4
     f2a:	854e                	mv	a0,s3
     f2c:	00004097          	auipc	ra,0x4
     f30:	a10080e7          	jalr	-1520(ra) # 493c <exec>
  for(int i = 0; i < 50000; i++){
     f34:	34fd                	addiw	s1,s1,-1
     f36:	f4ed                	bnez	s1,f20 <badarg+0x28>
  }
  
  exit(0);
     f38:	4501                	li	a0,0
     f3a:	00004097          	auipc	ra,0x4
     f3e:	9ca080e7          	jalr	-1590(ra) # 4904 <exit>

0000000000000f42 <copyinstr2>:
{
     f42:	714d                	addi	sp,sp,-336
     f44:	e686                	sd	ra,328(sp)
     f46:	e2a2                	sd	s0,320(sp)
     f48:	0a80                	addi	s0,sp,336
  for(int i = 0; i < MAXPATH; i++)
     f4a:	ee840793          	addi	a5,s0,-280
     f4e:	fec40693          	addi	a3,s0,-20
    b[i] = 'x';
     f52:	07800713          	li	a4,120
     f56:	00e78023          	sb	a4,0(a5)
  for(int i = 0; i < MAXPATH; i++)
     f5a:	0785                	addi	a5,a5,1
     f5c:	fed79de3          	bne	a5,a3,f56 <copyinstr2+0x14>
  b[MAXPATH] = '\0';
     f60:	fe040623          	sb	zero,-20(s0)
  int ret = remove(b);
     f64:	ee840513          	addi	a0,s0,-280
     f68:	00004097          	auipc	ra,0x4
     f6c:	a44080e7          	jalr	-1468(ra) # 49ac <remove>
  if(ret != -1){
     f70:	57fd                	li	a5,-1
     f72:	0cf51663          	bne	a0,a5,103e <copyinstr2+0xfc>
  int fd = open(b, O_CREATE | O_WRONLY);
     f76:	20100593          	li	a1,513
     f7a:	ee840513          	addi	a0,s0,-280
     f7e:	00004097          	auipc	ra,0x4
     f82:	9c6080e7          	jalr	-1594(ra) # 4944 <open>
  if(fd != -1){
     f86:	57fd                	li	a5,-1
     f88:	0cf51b63          	bne	a0,a5,105e <copyinstr2+0x11c>
  char *args[] = { "xx", 0 };
     f8c:	00005797          	auipc	a5,0x5
     f90:	10c78793          	addi	a5,a5,268 # 6098 <malloc+0x134e>
     f94:	ecf43c23          	sd	a5,-296(s0)
     f98:	ee043023          	sd	zero,-288(s0)
  ret = exec(b, args);
     f9c:	ed840593          	addi	a1,s0,-296
     fa0:	ee840513          	addi	a0,s0,-280
     fa4:	00004097          	auipc	ra,0x4
     fa8:	998080e7          	jalr	-1640(ra) # 493c <exec>
  if(ret != -1){
     fac:	57fd                	li	a5,-1
     fae:	0cf51863          	bne	a0,a5,107e <copyinstr2+0x13c>
  int pid = fork();
     fb2:	00004097          	auipc	ra,0x4
     fb6:	94a080e7          	jalr	-1718(ra) # 48fc <fork>
  if(pid < 0){
     fba:	0e054263          	bltz	a0,109e <copyinstr2+0x15c>
  if(pid == 0){
     fbe:	10051363          	bnez	a0,10c4 <copyinstr2+0x182>
     fc2:	00006797          	auipc	a5,0x6
     fc6:	18678793          	addi	a5,a5,390 # 7148 <big.0>
     fca:	00007697          	auipc	a3,0x7
     fce:	17e68693          	addi	a3,a3,382 # 8148 <__global_pointer$+0x908>
      big[i] = 'x';
     fd2:	07800713          	li	a4,120
     fd6:	00e78023          	sb	a4,0(a5)
    for(int i = 0; i < PGSIZE; i++)
     fda:	0785                	addi	a5,a5,1
     fdc:	fed79de3          	bne	a5,a3,fd6 <copyinstr2+0x94>
    big[PGSIZE] = '\0';
     fe0:	00007797          	auipc	a5,0x7
     fe4:	16078423          	sb	zero,360(a5) # 8148 <__global_pointer$+0x908>
    char *args2[] = { big, big, big, 0 };
     fe8:	00006797          	auipc	a5,0x6
     fec:	cf078793          	addi	a5,a5,-784 # 6cd8 <__DATA_BEGIN__>
     ff0:	6390                	ld	a2,0(a5)
     ff2:	6794                	ld	a3,8(a5)
     ff4:	6b98                	ld	a4,16(a5)
     ff6:	6f9c                	ld	a5,24(a5)
     ff8:	eac43823          	sd	a2,-336(s0)
     ffc:	ead43c23          	sd	a3,-328(s0)
    1000:	ece43023          	sd	a4,-320(s0)
    1004:	ecf43423          	sd	a5,-312(s0)
    ret = exec("echo", args2);
    1008:	eb040593          	addi	a1,s0,-336
    100c:	00004517          	auipc	a0,0x4
    1010:	e9c50513          	addi	a0,a0,-356 # 4ea8 <malloc+0x15e>
    1014:	00004097          	auipc	ra,0x4
    1018:	928080e7          	jalr	-1752(ra) # 493c <exec>
    if(ret != -1){
    101c:	57fd                	li	a5,-1
    101e:	08f50d63          	beq	a0,a5,10b8 <copyinstr2+0x176>
      printf("exec(echo, BIG) returned %d, not -1\n", fd);
    1022:	55fd                	li	a1,-1
    1024:	00004517          	auipc	a0,0x4
    1028:	4bc50513          	addi	a0,a0,1212 # 54e0 <malloc+0x796>
    102c:	00004097          	auipc	ra,0x4
    1030:	c66080e7          	jalr	-922(ra) # 4c92 <printf>
      exit(1);
    1034:	4505                	li	a0,1
    1036:	00004097          	auipc	ra,0x4
    103a:	8ce080e7          	jalr	-1842(ra) # 4904 <exit>
    printf("remove(%s) returned %d, not -1\n", b, ret);
    103e:	862a                	mv	a2,a0
    1040:	ee840593          	addi	a1,s0,-280
    1044:	00004517          	auipc	a0,0x4
    1048:	43c50513          	addi	a0,a0,1084 # 5480 <malloc+0x736>
    104c:	00004097          	auipc	ra,0x4
    1050:	c46080e7          	jalr	-954(ra) # 4c92 <printf>
    exit(1);
    1054:	4505                	li	a0,1
    1056:	00004097          	auipc	ra,0x4
    105a:	8ae080e7          	jalr	-1874(ra) # 4904 <exit>
    printf("open(%s) returned %d, not -1\n", b, fd);
    105e:	862a                	mv	a2,a0
    1060:	ee840593          	addi	a1,s0,-280
    1064:	00004517          	auipc	a0,0x4
    1068:	43c50513          	addi	a0,a0,1084 # 54a0 <malloc+0x756>
    106c:	00004097          	auipc	ra,0x4
    1070:	c26080e7          	jalr	-986(ra) # 4c92 <printf>
    exit(1);
    1074:	4505                	li	a0,1
    1076:	00004097          	auipc	ra,0x4
    107a:	88e080e7          	jalr	-1906(ra) # 4904 <exit>
    printf("exec(%s) returned %d, not -1\n", b, fd);
    107e:	567d                	li	a2,-1
    1080:	ee840593          	addi	a1,s0,-280
    1084:	00004517          	auipc	a0,0x4
    1088:	43c50513          	addi	a0,a0,1084 # 54c0 <malloc+0x776>
    108c:	00004097          	auipc	ra,0x4
    1090:	c06080e7          	jalr	-1018(ra) # 4c92 <printf>
    exit(1);
    1094:	4505                	li	a0,1
    1096:	00004097          	auipc	ra,0x4
    109a:	86e080e7          	jalr	-1938(ra) # 4904 <exit>
    printf("fork failed\n");
    109e:	00005517          	auipc	a0,0x5
    10a2:	81a50513          	addi	a0,a0,-2022 # 58b8 <malloc+0xb6e>
    10a6:	00004097          	auipc	ra,0x4
    10aa:	bec080e7          	jalr	-1044(ra) # 4c92 <printf>
    exit(1);
    10ae:	4505                	li	a0,1
    10b0:	00004097          	auipc	ra,0x4
    10b4:	854080e7          	jalr	-1964(ra) # 4904 <exit>
    exit(747); // OK
    10b8:	2eb00513          	li	a0,747
    10bc:	00004097          	auipc	ra,0x4
    10c0:	848080e7          	jalr	-1976(ra) # 4904 <exit>
  int st = 0;
    10c4:	ec042a23          	sw	zero,-300(s0)
  wait(&st);
    10c8:	ed440513          	addi	a0,s0,-300
    10cc:	00004097          	auipc	ra,0x4
    10d0:	840080e7          	jalr	-1984(ra) # 490c <wait>
  if(st != 747){
    10d4:	ed442703          	lw	a4,-300(s0)
    10d8:	2eb00793          	li	a5,747
    10dc:	00f71663          	bne	a4,a5,10e8 <copyinstr2+0x1a6>
}
    10e0:	60b6                	ld	ra,328(sp)
    10e2:	6416                	ld	s0,320(sp)
    10e4:	6171                	addi	sp,sp,336
    10e6:	8082                	ret
    printf("exec(echo, BIG) succeeded, should have failed\n");
    10e8:	00004517          	auipc	a0,0x4
    10ec:	42050513          	addi	a0,a0,1056 # 5508 <malloc+0x7be>
    10f0:	00004097          	auipc	ra,0x4
    10f4:	ba2080e7          	jalr	-1118(ra) # 4c92 <printf>
    exit(1);
    10f8:	4505                	li	a0,1
    10fa:	00004097          	auipc	ra,0x4
    10fe:	80a080e7          	jalr	-2038(ra) # 4904 <exit>

0000000000001102 <truncate3>:
{
    1102:	7159                	addi	sp,sp,-112
    1104:	f486                	sd	ra,104(sp)
    1106:	f0a2                	sd	s0,96(sp)
    1108:	eca6                	sd	s1,88(sp)
    110a:	e8ca                	sd	s2,80(sp)
    110c:	e4ce                	sd	s3,72(sp)
    110e:	e0d2                	sd	s4,64(sp)
    1110:	fc56                	sd	s5,56(sp)
    1112:	f85a                	sd	s6,48(sp)
    1114:	1880                	addi	s0,sp,112
    1116:	892a                	mv	s2,a0
  close(open("truncfile", O_CREATE|O_TRUNC|O_WRONLY));
    1118:	60100593          	li	a1,1537
    111c:	00004517          	auipc	a0,0x4
    1120:	de450513          	addi	a0,a0,-540 # 4f00 <malloc+0x1b6>
    1124:	00004097          	auipc	ra,0x4
    1128:	820080e7          	jalr	-2016(ra) # 4944 <open>
    112c:	00004097          	auipc	ra,0x4
    1130:	800080e7          	jalr	-2048(ra) # 492c <close>
  pid = fork();
    1134:	00003097          	auipc	ra,0x3
    1138:	7c8080e7          	jalr	1992(ra) # 48fc <fork>
  if(pid < 0){
    113c:	08054163          	bltz	a0,11be <truncate3+0xbc>
  if(pid == 0){
    1140:	e971                	bnez	a0,1214 <truncate3+0x112>
    1142:	06400993          	li	s3,100
      int fd = open("truncfile", O_WRONLY);
    1146:	00004a17          	auipc	s4,0x4
    114a:	dbaa0a13          	addi	s4,s4,-582 # 4f00 <malloc+0x1b6>
      int n = write(fd, "1234567890", 10);
    114e:	00004a97          	auipc	s5,0x4
    1152:	41aa8a93          	addi	s5,s5,1050 # 5568 <malloc+0x81e>
      read(fd, buf, sizeof(buf));
    1156:	f9840b13          	addi	s6,s0,-104
      int fd = open("truncfile", O_WRONLY);
    115a:	4585                	li	a1,1
    115c:	8552                	mv	a0,s4
    115e:	00003097          	auipc	ra,0x3
    1162:	7e6080e7          	jalr	2022(ra) # 4944 <open>
    1166:	84aa                	mv	s1,a0
      if(fd < 0){
    1168:	06054963          	bltz	a0,11da <truncate3+0xd8>
      int n = write(fd, "1234567890", 10);
    116c:	4629                	li	a2,10
    116e:	85d6                	mv	a1,s5
    1170:	00003097          	auipc	ra,0x3
    1174:	7b4080e7          	jalr	1972(ra) # 4924 <write>
      if(n != 10){
    1178:	47a9                	li	a5,10
    117a:	06f51e63          	bne	a0,a5,11f6 <truncate3+0xf4>
      close(fd);
    117e:	8526                	mv	a0,s1
    1180:	00003097          	auipc	ra,0x3
    1184:	7ac080e7          	jalr	1964(ra) # 492c <close>
      fd = open("truncfile", O_RDONLY);
    1188:	4581                	li	a1,0
    118a:	8552                	mv	a0,s4
    118c:	00003097          	auipc	ra,0x3
    1190:	7b8080e7          	jalr	1976(ra) # 4944 <open>
    1194:	84aa                	mv	s1,a0
      read(fd, buf, sizeof(buf));
    1196:	02000613          	li	a2,32
    119a:	85da                	mv	a1,s6
    119c:	00003097          	auipc	ra,0x3
    11a0:	780080e7          	jalr	1920(ra) # 491c <read>
      close(fd);
    11a4:	8526                	mv	a0,s1
    11a6:	00003097          	auipc	ra,0x3
    11aa:	786080e7          	jalr	1926(ra) # 492c <close>
    for(int i = 0; i < 100; i++){
    11ae:	39fd                	addiw	s3,s3,-1
    11b0:	fa0995e3          	bnez	s3,115a <truncate3+0x58>
    exit(0);
    11b4:	4501                	li	a0,0
    11b6:	00003097          	auipc	ra,0x3
    11ba:	74e080e7          	jalr	1870(ra) # 4904 <exit>
    printf("%s: fork failed\n", s);
    11be:	85ca                	mv	a1,s2
    11c0:	00004517          	auipc	a0,0x4
    11c4:	37850513          	addi	a0,a0,888 # 5538 <malloc+0x7ee>
    11c8:	00004097          	auipc	ra,0x4
    11cc:	aca080e7          	jalr	-1334(ra) # 4c92 <printf>
    exit(1);
    11d0:	4505                	li	a0,1
    11d2:	00003097          	auipc	ra,0x3
    11d6:	732080e7          	jalr	1842(ra) # 4904 <exit>
        printf("%s: open failed\n", s);
    11da:	85ca                	mv	a1,s2
    11dc:	00004517          	auipc	a0,0x4
    11e0:	37450513          	addi	a0,a0,884 # 5550 <malloc+0x806>
    11e4:	00004097          	auipc	ra,0x4
    11e8:	aae080e7          	jalr	-1362(ra) # 4c92 <printf>
        exit(1);
    11ec:	4505                	li	a0,1
    11ee:	00003097          	auipc	ra,0x3
    11f2:	716080e7          	jalr	1814(ra) # 4904 <exit>
        printf("%s: write got %d, expected 10\n", s, n);
    11f6:	862a                	mv	a2,a0
    11f8:	85ca                	mv	a1,s2
    11fa:	00004517          	auipc	a0,0x4
    11fe:	37e50513          	addi	a0,a0,894 # 5578 <malloc+0x82e>
    1202:	00004097          	auipc	ra,0x4
    1206:	a90080e7          	jalr	-1392(ra) # 4c92 <printf>
        exit(1);
    120a:	4505                	li	a0,1
    120c:	00003097          	auipc	ra,0x3
    1210:	6f8080e7          	jalr	1784(ra) # 4904 <exit>
    1214:	09600993          	li	s3,150
    int fd = open("truncfile", O_CREATE|O_WRONLY|O_TRUNC);
    1218:	00004a17          	auipc	s4,0x4
    121c:	ce8a0a13          	addi	s4,s4,-792 # 4f00 <malloc+0x1b6>
    int n = write(fd, "xxx", 3);
    1220:	00004a97          	auipc	s5,0x4
    1224:	378a8a93          	addi	s5,s5,888 # 5598 <malloc+0x84e>
    int fd = open("truncfile", O_CREATE|O_WRONLY|O_TRUNC);
    1228:	60100593          	li	a1,1537
    122c:	8552                	mv	a0,s4
    122e:	00003097          	auipc	ra,0x3
    1232:	716080e7          	jalr	1814(ra) # 4944 <open>
    1236:	84aa                	mv	s1,a0
    if(fd < 0){
    1238:	04054763          	bltz	a0,1286 <truncate3+0x184>
    int n = write(fd, "xxx", 3);
    123c:	460d                	li	a2,3
    123e:	85d6                	mv	a1,s5
    1240:	00003097          	auipc	ra,0x3
    1244:	6e4080e7          	jalr	1764(ra) # 4924 <write>
    if(n != 3){
    1248:	478d                	li	a5,3
    124a:	04f51c63          	bne	a0,a5,12a2 <truncate3+0x1a0>
    close(fd);
    124e:	8526                	mv	a0,s1
    1250:	00003097          	auipc	ra,0x3
    1254:	6dc080e7          	jalr	1756(ra) # 492c <close>
  for(int i = 0; i < 150; i++){
    1258:	39fd                	addiw	s3,s3,-1
    125a:	fc0997e3          	bnez	s3,1228 <truncate3+0x126>
  wait(&xstatus);
    125e:	fbc40513          	addi	a0,s0,-68
    1262:	00003097          	auipc	ra,0x3
    1266:	6aa080e7          	jalr	1706(ra) # 490c <wait>
  remove("truncfile");
    126a:	00004517          	auipc	a0,0x4
    126e:	c9650513          	addi	a0,a0,-874 # 4f00 <malloc+0x1b6>
    1272:	00003097          	auipc	ra,0x3
    1276:	73a080e7          	jalr	1850(ra) # 49ac <remove>
  exit(xstatus);
    127a:	fbc42503          	lw	a0,-68(s0)
    127e:	00003097          	auipc	ra,0x3
    1282:	686080e7          	jalr	1670(ra) # 4904 <exit>
      printf("%s: open failed\n", s);
    1286:	85ca                	mv	a1,s2
    1288:	00004517          	auipc	a0,0x4
    128c:	2c850513          	addi	a0,a0,712 # 5550 <malloc+0x806>
    1290:	00004097          	auipc	ra,0x4
    1294:	a02080e7          	jalr	-1534(ra) # 4c92 <printf>
      exit(1);
    1298:	4505                	li	a0,1
    129a:	00003097          	auipc	ra,0x3
    129e:	66a080e7          	jalr	1642(ra) # 4904 <exit>
      printf("%s: write got %d, expected 3\n", s, n);
    12a2:	862a                	mv	a2,a0
    12a4:	85ca                	mv	a1,s2
    12a6:	00004517          	auipc	a0,0x4
    12aa:	2fa50513          	addi	a0,a0,762 # 55a0 <malloc+0x856>
    12ae:	00004097          	auipc	ra,0x4
    12b2:	9e4080e7          	jalr	-1564(ra) # 4c92 <printf>
      exit(1);
    12b6:	4505                	li	a0,1
    12b8:	00003097          	auipc	ra,0x3
    12bc:	64c080e7          	jalr	1612(ra) # 4904 <exit>

00000000000012c0 <exectest>:
{
    12c0:	715d                	addi	sp,sp,-80
    12c2:	e486                	sd	ra,72(sp)
    12c4:	e0a2                	sd	s0,64(sp)
    12c6:	fc26                	sd	s1,56(sp)
    12c8:	f84a                	sd	s2,48(sp)
    12ca:	0880                	addi	s0,sp,80
    12cc:	892a                	mv	s2,a0
  char *echoargv[] = { "echo", "OK", 0 };
    12ce:	00004797          	auipc	a5,0x4
    12d2:	bda78793          	addi	a5,a5,-1062 # 4ea8 <malloc+0x15e>
    12d6:	fcf43023          	sd	a5,-64(s0)
    12da:	00004797          	auipc	a5,0x4
    12de:	2e678793          	addi	a5,a5,742 # 55c0 <malloc+0x876>
    12e2:	fcf43423          	sd	a5,-56(s0)
    12e6:	fc043823          	sd	zero,-48(s0)
  remove("echo-ok");
    12ea:	00004517          	auipc	a0,0x4
    12ee:	2de50513          	addi	a0,a0,734 # 55c8 <malloc+0x87e>
    12f2:	00003097          	auipc	ra,0x3
    12f6:	6ba080e7          	jalr	1722(ra) # 49ac <remove>
  pid = fork();
    12fa:	00003097          	auipc	ra,0x3
    12fe:	602080e7          	jalr	1538(ra) # 48fc <fork>
  if(pid < 0) {
    1302:	04054663          	bltz	a0,134e <exectest+0x8e>
    1306:	84aa                	mv	s1,a0
  if(pid == 0) {
    1308:	e959                	bnez	a0,139e <exectest+0xde>
    close(1);
    130a:	4505                	li	a0,1
    130c:	00003097          	auipc	ra,0x3
    1310:	620080e7          	jalr	1568(ra) # 492c <close>
    fd = open("echo-ok", O_CREATE|O_WRONLY);
    1314:	20100593          	li	a1,513
    1318:	00004517          	auipc	a0,0x4
    131c:	2b050513          	addi	a0,a0,688 # 55c8 <malloc+0x87e>
    1320:	00003097          	auipc	ra,0x3
    1324:	624080e7          	jalr	1572(ra) # 4944 <open>
    if(fd < 0) {
    1328:	04054163          	bltz	a0,136a <exectest+0xaa>
    if(fd != 1) {
    132c:	4785                	li	a5,1
    132e:	04f50c63          	beq	a0,a5,1386 <exectest+0xc6>
      printf("%s: wrong fd\n", s);
    1332:	85ca                	mv	a1,s2
    1334:	00004517          	auipc	a0,0x4
    1338:	2b450513          	addi	a0,a0,692 # 55e8 <malloc+0x89e>
    133c:	00004097          	auipc	ra,0x4
    1340:	956080e7          	jalr	-1706(ra) # 4c92 <printf>
      exit(1);
    1344:	4505                	li	a0,1
    1346:	00003097          	auipc	ra,0x3
    134a:	5be080e7          	jalr	1470(ra) # 4904 <exit>
     printf("%s: fork failed\n", s);
    134e:	85ca                	mv	a1,s2
    1350:	00004517          	auipc	a0,0x4
    1354:	1e850513          	addi	a0,a0,488 # 5538 <malloc+0x7ee>
    1358:	00004097          	auipc	ra,0x4
    135c:	93a080e7          	jalr	-1734(ra) # 4c92 <printf>
     exit(1);
    1360:	4505                	li	a0,1
    1362:	00003097          	auipc	ra,0x3
    1366:	5a2080e7          	jalr	1442(ra) # 4904 <exit>
      printf("%s: create failed\n", s);
    136a:	85ca                	mv	a1,s2
    136c:	00004517          	auipc	a0,0x4
    1370:	26450513          	addi	a0,a0,612 # 55d0 <malloc+0x886>
    1374:	00004097          	auipc	ra,0x4
    1378:	91e080e7          	jalr	-1762(ra) # 4c92 <printf>
      exit(1);
    137c:	4505                	li	a0,1
    137e:	00003097          	auipc	ra,0x3
    1382:	586080e7          	jalr	1414(ra) # 4904 <exit>
    if(exec("echo", echoargv) < 0){
    1386:	fc040593          	addi	a1,s0,-64
    138a:	00004517          	auipc	a0,0x4
    138e:	b1e50513          	addi	a0,a0,-1250 # 4ea8 <malloc+0x15e>
    1392:	00003097          	auipc	ra,0x3
    1396:	5aa080e7          	jalr	1450(ra) # 493c <exec>
    139a:	02054163          	bltz	a0,13bc <exectest+0xfc>
  if (wait(&xstatus) != pid) {
    139e:	fdc40513          	addi	a0,s0,-36
    13a2:	00003097          	auipc	ra,0x3
    13a6:	56a080e7          	jalr	1386(ra) # 490c <wait>
    13aa:	02951763          	bne	a0,s1,13d8 <exectest+0x118>
  if(xstatus != 0)
    13ae:	fdc42503          	lw	a0,-36(s0)
    13b2:	cd0d                	beqz	a0,13ec <exectest+0x12c>
    exit(xstatus);
    13b4:	00003097          	auipc	ra,0x3
    13b8:	550080e7          	jalr	1360(ra) # 4904 <exit>
      printf("%s: exec echo failed\n", s);
    13bc:	85ca                	mv	a1,s2
    13be:	00004517          	auipc	a0,0x4
    13c2:	23a50513          	addi	a0,a0,570 # 55f8 <malloc+0x8ae>
    13c6:	00004097          	auipc	ra,0x4
    13ca:	8cc080e7          	jalr	-1844(ra) # 4c92 <printf>
      exit(1);
    13ce:	4505                	li	a0,1
    13d0:	00003097          	auipc	ra,0x3
    13d4:	534080e7          	jalr	1332(ra) # 4904 <exit>
    printf("%s: wait failed!\n", s);
    13d8:	85ca                	mv	a1,s2
    13da:	00004517          	auipc	a0,0x4
    13de:	23650513          	addi	a0,a0,566 # 5610 <malloc+0x8c6>
    13e2:	00004097          	auipc	ra,0x4
    13e6:	8b0080e7          	jalr	-1872(ra) # 4c92 <printf>
    13ea:	b7d1                	j	13ae <exectest+0xee>
  fd = open("echo-ok", O_RDONLY);
    13ec:	4581                	li	a1,0
    13ee:	00004517          	auipc	a0,0x4
    13f2:	1da50513          	addi	a0,a0,474 # 55c8 <malloc+0x87e>
    13f6:	00003097          	auipc	ra,0x3
    13fa:	54e080e7          	jalr	1358(ra) # 4944 <open>
  if(fd < 0) {
    13fe:	02054a63          	bltz	a0,1432 <exectest+0x172>
  if (read(fd, buf, 2) != 2) {
    1402:	4609                	li	a2,2
    1404:	fb840593          	addi	a1,s0,-72
    1408:	00003097          	auipc	ra,0x3
    140c:	514080e7          	jalr	1300(ra) # 491c <read>
    1410:	4789                	li	a5,2
    1412:	02f50e63          	beq	a0,a5,144e <exectest+0x18e>
    printf("%s: read failed\n", s);
    1416:	85ca                	mv	a1,s2
    1418:	00004517          	auipc	a0,0x4
    141c:	e6050513          	addi	a0,a0,-416 # 5278 <malloc+0x52e>
    1420:	00004097          	auipc	ra,0x4
    1424:	872080e7          	jalr	-1934(ra) # 4c92 <printf>
    exit(1);
    1428:	4505                	li	a0,1
    142a:	00003097          	auipc	ra,0x3
    142e:	4da080e7          	jalr	1242(ra) # 4904 <exit>
    printf("%s: open failed\n", s);
    1432:	85ca                	mv	a1,s2
    1434:	00004517          	auipc	a0,0x4
    1438:	11c50513          	addi	a0,a0,284 # 5550 <malloc+0x806>
    143c:	00004097          	auipc	ra,0x4
    1440:	856080e7          	jalr	-1962(ra) # 4c92 <printf>
    exit(1);
    1444:	4505                	li	a0,1
    1446:	00003097          	auipc	ra,0x3
    144a:	4be080e7          	jalr	1214(ra) # 4904 <exit>
  remove("echo-ok");
    144e:	00004517          	auipc	a0,0x4
    1452:	17a50513          	addi	a0,a0,378 # 55c8 <malloc+0x87e>
    1456:	00003097          	auipc	ra,0x3
    145a:	556080e7          	jalr	1366(ra) # 49ac <remove>
  if(buf[0] == 'O' && buf[1] == 'K')
    145e:	fb844703          	lbu	a4,-72(s0)
    1462:	04f00793          	li	a5,79
    1466:	00f71863          	bne	a4,a5,1476 <exectest+0x1b6>
    146a:	fb944703          	lbu	a4,-71(s0)
    146e:	04b00793          	li	a5,75
    1472:	02f70063          	beq	a4,a5,1492 <exectest+0x1d2>
    printf("%s: wrong output\n", s);
    1476:	85ca                	mv	a1,s2
    1478:	00004517          	auipc	a0,0x4
    147c:	1b050513          	addi	a0,a0,432 # 5628 <malloc+0x8de>
    1480:	00004097          	auipc	ra,0x4
    1484:	812080e7          	jalr	-2030(ra) # 4c92 <printf>
    exit(1);
    1488:	4505                	li	a0,1
    148a:	00003097          	auipc	ra,0x3
    148e:	47a080e7          	jalr	1146(ra) # 4904 <exit>
    exit(0);
    1492:	4501                	li	a0,0
    1494:	00003097          	auipc	ra,0x3
    1498:	470080e7          	jalr	1136(ra) # 4904 <exit>

000000000000149c <pipe1>:
{
    149c:	711d                	addi	sp,sp,-96
    149e:	ec86                	sd	ra,88(sp)
    14a0:	e8a2                	sd	s0,80(sp)
    14a2:	e4a6                	sd	s1,72(sp)
    14a4:	e0ca                	sd	s2,64(sp)
    14a6:	fc4e                	sd	s3,56(sp)
    14a8:	f852                	sd	s4,48(sp)
    14aa:	f456                	sd	s5,40(sp)
    14ac:	f05a                	sd	s6,32(sp)
    14ae:	ec5e                	sd	s7,24(sp)
    14b0:	1080                	addi	s0,sp,96
    14b2:	892a                	mv	s2,a0
  if(pipe(fds) != 0){
    14b4:	fa840513          	addi	a0,s0,-88
    14b8:	00003097          	auipc	ra,0x3
    14bc:	45c080e7          	jalr	1116(ra) # 4914 <pipe>
    14c0:	ed2d                	bnez	a0,153a <pipe1+0x9e>
    14c2:	84aa                	mv	s1,a0
  pid = fork();
    14c4:	00003097          	auipc	ra,0x3
    14c8:	438080e7          	jalr	1080(ra) # 48fc <fork>
    14cc:	8a2a                	mv	s4,a0
  if(pid == 0){
    14ce:	c541                	beqz	a0,1556 <pipe1+0xba>
  } else if(pid > 0){
    14d0:	16a05f63          	blez	a0,164e <pipe1+0x1b2>
    close(fds[1]);
    14d4:	fac42503          	lw	a0,-84(s0)
    14d8:	00003097          	auipc	ra,0x3
    14dc:	454080e7          	jalr	1108(ra) # 492c <close>
    total = 0;
    14e0:	8aa6                	mv	s5,s1
    cc = 1;
    14e2:	4985                	li	s3,1
    while((n = read(fds[0], buf, cc)) > 0){
    14e4:	00009b17          	auipc	s6,0x9
    14e8:	37cb0b13          	addi	s6,s6,892 # a860 <buf>
      if(cc > sizeof(buf))
    14ec:	6a09                	lui	s4,0x2
    14ee:	800a0a13          	addi	s4,s4,-2048 # 1800 <forkfork+0x42>
    while((n = read(fds[0], buf, cc)) > 0){
    14f2:	864e                	mv	a2,s3
    14f4:	85da                	mv	a1,s6
    14f6:	fa842503          	lw	a0,-88(s0)
    14fa:	00003097          	auipc	ra,0x3
    14fe:	422080e7          	jalr	1058(ra) # 491c <read>
    1502:	10a05163          	blez	a0,1604 <pipe1+0x168>
      for(i = 0; i < n; i++){
    1506:	00009717          	auipc	a4,0x9
    150a:	35a70713          	addi	a4,a4,858 # a860 <buf>
    150e:	00a4863b          	addw	a2,s1,a0
        if((buf[i] & 0xff) != (seq++ & 0xff)){
    1512:	00074683          	lbu	a3,0(a4)
    1516:	0ff4f793          	zext.b	a5,s1
    151a:	2485                	addiw	s1,s1,1
    151c:	0cf69063          	bne	a3,a5,15dc <pipe1+0x140>
      for(i = 0; i < n; i++){
    1520:	0705                	addi	a4,a4,1
    1522:	fec498e3          	bne	s1,a2,1512 <pipe1+0x76>
      total += n;
    1526:	00aa8abb          	addw	s5,s5,a0
      cc = cc * 2;
    152a:	0019979b          	slliw	a5,s3,0x1
    152e:	0007899b          	sext.w	s3,a5
      if(cc > sizeof(buf))
    1532:	fd3a70e3          	bgeu	s4,s3,14f2 <pipe1+0x56>
        cc = sizeof(buf);
    1536:	89d2                	mv	s3,s4
    1538:	bf6d                	j	14f2 <pipe1+0x56>
    printf("%s: pipe() failed\n", s);
    153a:	85ca                	mv	a1,s2
    153c:	00004517          	auipc	a0,0x4
    1540:	10450513          	addi	a0,a0,260 # 5640 <malloc+0x8f6>
    1544:	00003097          	auipc	ra,0x3
    1548:	74e080e7          	jalr	1870(ra) # 4c92 <printf>
    exit(1);
    154c:	4505                	li	a0,1
    154e:	00003097          	auipc	ra,0x3
    1552:	3b6080e7          	jalr	950(ra) # 4904 <exit>
    close(fds[0]);
    1556:	fa842503          	lw	a0,-88(s0)
    155a:	00003097          	auipc	ra,0x3
    155e:	3d2080e7          	jalr	978(ra) # 492c <close>
    for(n = 0; n < N; n++){
    1562:	00009b17          	auipc	s6,0x9
    1566:	2feb0b13          	addi	s6,s6,766 # a860 <buf>
    156a:	416004bb          	negw	s1,s6
    156e:	0ff4f493          	zext.b	s1,s1
    1572:	409b0993          	addi	s3,s6,1033
      if(write(fds[1], buf, SZ) != SZ){
    1576:	8bda                	mv	s7,s6
    for(n = 0; n < N; n++){
    1578:	6a85                	lui	s5,0x1
    157a:	42da8a93          	addi	s5,s5,1069 # 142d <exectest+0x16d>
{
    157e:	87da                	mv	a5,s6
        buf[i] = seq++;
    1580:	0097873b          	addw	a4,a5,s1
    1584:	00e78023          	sb	a4,0(a5)
      for(i = 0; i < SZ; i++)
    1588:	0785                	addi	a5,a5,1
    158a:	fef99be3          	bne	s3,a5,1580 <pipe1+0xe4>
        buf[i] = seq++;
    158e:	409a0a1b          	addiw	s4,s4,1033
      if(write(fds[1], buf, SZ) != SZ){
    1592:	40900613          	li	a2,1033
    1596:	85de                	mv	a1,s7
    1598:	fac42503          	lw	a0,-84(s0)
    159c:	00003097          	auipc	ra,0x3
    15a0:	388080e7          	jalr	904(ra) # 4924 <write>
    15a4:	40900793          	li	a5,1033
    15a8:	00f51c63          	bne	a0,a5,15c0 <pipe1+0x124>
    for(n = 0; n < N; n++){
    15ac:	24a5                	addiw	s1,s1,9
    15ae:	0ff4f493          	zext.b	s1,s1
    15b2:	fd5a16e3          	bne	s4,s5,157e <pipe1+0xe2>
    exit(0);
    15b6:	4501                	li	a0,0
    15b8:	00003097          	auipc	ra,0x3
    15bc:	34c080e7          	jalr	844(ra) # 4904 <exit>
        printf("%s: pipe1 oops 1\n", s);
    15c0:	85ca                	mv	a1,s2
    15c2:	00004517          	auipc	a0,0x4
    15c6:	09650513          	addi	a0,a0,150 # 5658 <malloc+0x90e>
    15ca:	00003097          	auipc	ra,0x3
    15ce:	6c8080e7          	jalr	1736(ra) # 4c92 <printf>
        exit(1);
    15d2:	4505                	li	a0,1
    15d4:	00003097          	auipc	ra,0x3
    15d8:	330080e7          	jalr	816(ra) # 4904 <exit>
          printf("%s: pipe1 oops 2\n", s);
    15dc:	85ca                	mv	a1,s2
    15de:	00004517          	auipc	a0,0x4
    15e2:	09250513          	addi	a0,a0,146 # 5670 <malloc+0x926>
    15e6:	00003097          	auipc	ra,0x3
    15ea:	6ac080e7          	jalr	1708(ra) # 4c92 <printf>
}
    15ee:	60e6                	ld	ra,88(sp)
    15f0:	6446                	ld	s0,80(sp)
    15f2:	64a6                	ld	s1,72(sp)
    15f4:	6906                	ld	s2,64(sp)
    15f6:	79e2                	ld	s3,56(sp)
    15f8:	7a42                	ld	s4,48(sp)
    15fa:	7aa2                	ld	s5,40(sp)
    15fc:	7b02                	ld	s6,32(sp)
    15fe:	6be2                	ld	s7,24(sp)
    1600:	6125                	addi	sp,sp,96
    1602:	8082                	ret
    if(total != N * SZ){
    1604:	6785                	lui	a5,0x1
    1606:	42d78793          	addi	a5,a5,1069 # 142d <exectest+0x16d>
    160a:	02fa8063          	beq	s5,a5,162a <pipe1+0x18e>
      printf("%s: pipe1 oops 3 total %d\n", total);
    160e:	85d6                	mv	a1,s5
    1610:	00004517          	auipc	a0,0x4
    1614:	07850513          	addi	a0,a0,120 # 5688 <malloc+0x93e>
    1618:	00003097          	auipc	ra,0x3
    161c:	67a080e7          	jalr	1658(ra) # 4c92 <printf>
      exit(1);
    1620:	4505                	li	a0,1
    1622:	00003097          	auipc	ra,0x3
    1626:	2e2080e7          	jalr	738(ra) # 4904 <exit>
    close(fds[0]);
    162a:	fa842503          	lw	a0,-88(s0)
    162e:	00003097          	auipc	ra,0x3
    1632:	2fe080e7          	jalr	766(ra) # 492c <close>
    wait(&xstatus);
    1636:	fa440513          	addi	a0,s0,-92
    163a:	00003097          	auipc	ra,0x3
    163e:	2d2080e7          	jalr	722(ra) # 490c <wait>
    exit(xstatus);
    1642:	fa442503          	lw	a0,-92(s0)
    1646:	00003097          	auipc	ra,0x3
    164a:	2be080e7          	jalr	702(ra) # 4904 <exit>
    printf("%s: fork() failed\n", s);
    164e:	85ca                	mv	a1,s2
    1650:	00004517          	auipc	a0,0x4
    1654:	05850513          	addi	a0,a0,88 # 56a8 <malloc+0x95e>
    1658:	00003097          	auipc	ra,0x3
    165c:	63a080e7          	jalr	1594(ra) # 4c92 <printf>
    exit(1);
    1660:	4505                	li	a0,1
    1662:	00003097          	auipc	ra,0x3
    1666:	2a2080e7          	jalr	674(ra) # 4904 <exit>

000000000000166a <exitwait>:
{
    166a:	715d                	addi	sp,sp,-80
    166c:	e486                	sd	ra,72(sp)
    166e:	e0a2                	sd	s0,64(sp)
    1670:	fc26                	sd	s1,56(sp)
    1672:	f84a                	sd	s2,48(sp)
    1674:	f44e                	sd	s3,40(sp)
    1676:	f052                	sd	s4,32(sp)
    1678:	ec56                	sd	s5,24(sp)
    167a:	0880                	addi	s0,sp,80
    167c:	8aaa                	mv	s5,a0
  for(i = 0; i < 100; i++){
    167e:	4901                	li	s2,0
      if(wait(&xstate) != pid){
    1680:	fbc40993          	addi	s3,s0,-68
  for(i = 0; i < 100; i++){
    1684:	06400a13          	li	s4,100
    pid = fork();
    1688:	00003097          	auipc	ra,0x3
    168c:	274080e7          	jalr	628(ra) # 48fc <fork>
    1690:	84aa                	mv	s1,a0
    if(pid < 0){
    1692:	02054a63          	bltz	a0,16c6 <exitwait+0x5c>
    if(pid){
    1696:	c151                	beqz	a0,171a <exitwait+0xb0>
      if(wait(&xstate) != pid){
    1698:	854e                	mv	a0,s3
    169a:	00003097          	auipc	ra,0x3
    169e:	272080e7          	jalr	626(ra) # 490c <wait>
    16a2:	04951063          	bne	a0,s1,16e2 <exitwait+0x78>
      if(i != xstate) {
    16a6:	fbc42783          	lw	a5,-68(s0)
    16aa:	05279a63          	bne	a5,s2,16fe <exitwait+0x94>
  for(i = 0; i < 100; i++){
    16ae:	2905                	addiw	s2,s2,1
    16b0:	fd491ce3          	bne	s2,s4,1688 <exitwait+0x1e>
}
    16b4:	60a6                	ld	ra,72(sp)
    16b6:	6406                	ld	s0,64(sp)
    16b8:	74e2                	ld	s1,56(sp)
    16ba:	7942                	ld	s2,48(sp)
    16bc:	79a2                	ld	s3,40(sp)
    16be:	7a02                	ld	s4,32(sp)
    16c0:	6ae2                	ld	s5,24(sp)
    16c2:	6161                	addi	sp,sp,80
    16c4:	8082                	ret
      printf("%s: fork failed\n", s);
    16c6:	85d6                	mv	a1,s5
    16c8:	00004517          	auipc	a0,0x4
    16cc:	e7050513          	addi	a0,a0,-400 # 5538 <malloc+0x7ee>
    16d0:	00003097          	auipc	ra,0x3
    16d4:	5c2080e7          	jalr	1474(ra) # 4c92 <printf>
      exit(1);
    16d8:	4505                	li	a0,1
    16da:	00003097          	auipc	ra,0x3
    16de:	22a080e7          	jalr	554(ra) # 4904 <exit>
        printf("%s: wait wrong pid\n", s);
    16e2:	85d6                	mv	a1,s5
    16e4:	00004517          	auipc	a0,0x4
    16e8:	fdc50513          	addi	a0,a0,-36 # 56c0 <malloc+0x976>
    16ec:	00003097          	auipc	ra,0x3
    16f0:	5a6080e7          	jalr	1446(ra) # 4c92 <printf>
        exit(1);
    16f4:	4505                	li	a0,1
    16f6:	00003097          	auipc	ra,0x3
    16fa:	20e080e7          	jalr	526(ra) # 4904 <exit>
        printf("%s: wait wrong exit status\n", s);
    16fe:	85d6                	mv	a1,s5
    1700:	00004517          	auipc	a0,0x4
    1704:	fd850513          	addi	a0,a0,-40 # 56d8 <malloc+0x98e>
    1708:	00003097          	auipc	ra,0x3
    170c:	58a080e7          	jalr	1418(ra) # 4c92 <printf>
        exit(1);
    1710:	4505                	li	a0,1
    1712:	00003097          	auipc	ra,0x3
    1716:	1f2080e7          	jalr	498(ra) # 4904 <exit>
      exit(i);
    171a:	854a                	mv	a0,s2
    171c:	00003097          	auipc	ra,0x3
    1720:	1e8080e7          	jalr	488(ra) # 4904 <exit>

0000000000001724 <twochildren>:
{
    1724:	1101                	addi	sp,sp,-32
    1726:	ec06                	sd	ra,24(sp)
    1728:	e822                	sd	s0,16(sp)
    172a:	e426                	sd	s1,8(sp)
    172c:	e04a                	sd	s2,0(sp)
    172e:	1000                	addi	s0,sp,32
    1730:	892a                	mv	s2,a0
    1732:	3e800493          	li	s1,1000
    int pid1 = fork();
    1736:	00003097          	auipc	ra,0x3
    173a:	1c6080e7          	jalr	454(ra) # 48fc <fork>
    if(pid1 < 0){
    173e:	02054c63          	bltz	a0,1776 <twochildren+0x52>
    if(pid1 == 0){
    1742:	c921                	beqz	a0,1792 <twochildren+0x6e>
      int pid2 = fork();
    1744:	00003097          	auipc	ra,0x3
    1748:	1b8080e7          	jalr	440(ra) # 48fc <fork>
      if(pid2 < 0){
    174c:	04054763          	bltz	a0,179a <twochildren+0x76>
      if(pid2 == 0){
    1750:	c13d                	beqz	a0,17b6 <twochildren+0x92>
        wait(0);
    1752:	4501                	li	a0,0
    1754:	00003097          	auipc	ra,0x3
    1758:	1b8080e7          	jalr	440(ra) # 490c <wait>
        wait(0);
    175c:	4501                	li	a0,0
    175e:	00003097          	auipc	ra,0x3
    1762:	1ae080e7          	jalr	430(ra) # 490c <wait>
  for(int i = 0; i < 1000; i++){
    1766:	34fd                	addiw	s1,s1,-1
    1768:	f4f9                	bnez	s1,1736 <twochildren+0x12>
}
    176a:	60e2                	ld	ra,24(sp)
    176c:	6442                	ld	s0,16(sp)
    176e:	64a2                	ld	s1,8(sp)
    1770:	6902                	ld	s2,0(sp)
    1772:	6105                	addi	sp,sp,32
    1774:	8082                	ret
      printf("%s: fork failed\n", s);
    1776:	85ca                	mv	a1,s2
    1778:	00004517          	auipc	a0,0x4
    177c:	dc050513          	addi	a0,a0,-576 # 5538 <malloc+0x7ee>
    1780:	00003097          	auipc	ra,0x3
    1784:	512080e7          	jalr	1298(ra) # 4c92 <printf>
      exit(1);
    1788:	4505                	li	a0,1
    178a:	00003097          	auipc	ra,0x3
    178e:	17a080e7          	jalr	378(ra) # 4904 <exit>
      exit(0);
    1792:	00003097          	auipc	ra,0x3
    1796:	172080e7          	jalr	370(ra) # 4904 <exit>
        printf("%s: fork failed\n", s);
    179a:	85ca                	mv	a1,s2
    179c:	00004517          	auipc	a0,0x4
    17a0:	d9c50513          	addi	a0,a0,-612 # 5538 <malloc+0x7ee>
    17a4:	00003097          	auipc	ra,0x3
    17a8:	4ee080e7          	jalr	1262(ra) # 4c92 <printf>
        exit(1);
    17ac:	4505                	li	a0,1
    17ae:	00003097          	auipc	ra,0x3
    17b2:	156080e7          	jalr	342(ra) # 4904 <exit>
        exit(0);
    17b6:	00003097          	auipc	ra,0x3
    17ba:	14e080e7          	jalr	334(ra) # 4904 <exit>

00000000000017be <forkfork>:
{
    17be:	7179                	addi	sp,sp,-48
    17c0:	f406                	sd	ra,40(sp)
    17c2:	f022                	sd	s0,32(sp)
    17c4:	ec26                	sd	s1,24(sp)
    17c6:	1800                	addi	s0,sp,48
    17c8:	84aa                	mv	s1,a0
    int pid = fork();
    17ca:	00003097          	auipc	ra,0x3
    17ce:	132080e7          	jalr	306(ra) # 48fc <fork>
    if(pid < 0){
    17d2:	04054163          	bltz	a0,1814 <forkfork+0x56>
    if(pid == 0){
    17d6:	cd29                	beqz	a0,1830 <forkfork+0x72>
    int pid = fork();
    17d8:	00003097          	auipc	ra,0x3
    17dc:	124080e7          	jalr	292(ra) # 48fc <fork>
    if(pid < 0){
    17e0:	02054a63          	bltz	a0,1814 <forkfork+0x56>
    if(pid == 0){
    17e4:	c531                	beqz	a0,1830 <forkfork+0x72>
    wait(&xstatus);
    17e6:	fdc40513          	addi	a0,s0,-36
    17ea:	00003097          	auipc	ra,0x3
    17ee:	122080e7          	jalr	290(ra) # 490c <wait>
    if(xstatus != 0) {
    17f2:	fdc42783          	lw	a5,-36(s0)
    17f6:	ebbd                	bnez	a5,186c <forkfork+0xae>
    wait(&xstatus);
    17f8:	fdc40513          	addi	a0,s0,-36
    17fc:	00003097          	auipc	ra,0x3
    1800:	110080e7          	jalr	272(ra) # 490c <wait>
    if(xstatus != 0) {
    1804:	fdc42783          	lw	a5,-36(s0)
    1808:	e3b5                	bnez	a5,186c <forkfork+0xae>
}
    180a:	70a2                	ld	ra,40(sp)
    180c:	7402                	ld	s0,32(sp)
    180e:	64e2                	ld	s1,24(sp)
    1810:	6145                	addi	sp,sp,48
    1812:	8082                	ret
      printf("%s: fork failed", s);
    1814:	85a6                	mv	a1,s1
    1816:	00004517          	auipc	a0,0x4
    181a:	ee250513          	addi	a0,a0,-286 # 56f8 <malloc+0x9ae>
    181e:	00003097          	auipc	ra,0x3
    1822:	474080e7          	jalr	1140(ra) # 4c92 <printf>
      exit(1);
    1826:	4505                	li	a0,1
    1828:	00003097          	auipc	ra,0x3
    182c:	0dc080e7          	jalr	220(ra) # 4904 <exit>
{
    1830:	0c800493          	li	s1,200
        int pid1 = fork();
    1834:	00003097          	auipc	ra,0x3
    1838:	0c8080e7          	jalr	200(ra) # 48fc <fork>
        if(pid1 < 0){
    183c:	00054f63          	bltz	a0,185a <forkfork+0x9c>
        if(pid1 == 0){
    1840:	c115                	beqz	a0,1864 <forkfork+0xa6>
        wait(0);
    1842:	4501                	li	a0,0
    1844:	00003097          	auipc	ra,0x3
    1848:	0c8080e7          	jalr	200(ra) # 490c <wait>
      for(int j = 0; j < 200; j++){
    184c:	34fd                	addiw	s1,s1,-1
    184e:	f0fd                	bnez	s1,1834 <forkfork+0x76>
      exit(0);
    1850:	4501                	li	a0,0
    1852:	00003097          	auipc	ra,0x3
    1856:	0b2080e7          	jalr	178(ra) # 4904 <exit>
          exit(1);
    185a:	4505                	li	a0,1
    185c:	00003097          	auipc	ra,0x3
    1860:	0a8080e7          	jalr	168(ra) # 4904 <exit>
          exit(0);
    1864:	00003097          	auipc	ra,0x3
    1868:	0a0080e7          	jalr	160(ra) # 4904 <exit>
      printf("%s: fork in child failed", s);
    186c:	85a6                	mv	a1,s1
    186e:	00004517          	auipc	a0,0x4
    1872:	e9a50513          	addi	a0,a0,-358 # 5708 <malloc+0x9be>
    1876:	00003097          	auipc	ra,0x3
    187a:	41c080e7          	jalr	1052(ra) # 4c92 <printf>
      exit(1);
    187e:	4505                	li	a0,1
    1880:	00003097          	auipc	ra,0x3
    1884:	084080e7          	jalr	132(ra) # 4904 <exit>

0000000000001888 <reparent2>:
{
    1888:	1101                	addi	sp,sp,-32
    188a:	ec06                	sd	ra,24(sp)
    188c:	e822                	sd	s0,16(sp)
    188e:	e426                	sd	s1,8(sp)
    1890:	1000                	addi	s0,sp,32
    1892:	32000493          	li	s1,800
    int pid1 = fork();
    1896:	00003097          	auipc	ra,0x3
    189a:	066080e7          	jalr	102(ra) # 48fc <fork>
    if(pid1 < 0){
    189e:	00054f63          	bltz	a0,18bc <reparent2+0x34>
    if(pid1 == 0){
    18a2:	c915                	beqz	a0,18d6 <reparent2+0x4e>
    wait(0);
    18a4:	4501                	li	a0,0
    18a6:	00003097          	auipc	ra,0x3
    18aa:	066080e7          	jalr	102(ra) # 490c <wait>
  for(int i = 0; i < 800; i++){
    18ae:	34fd                	addiw	s1,s1,-1
    18b0:	f0fd                	bnez	s1,1896 <reparent2+0xe>
  exit(0);
    18b2:	4501                	li	a0,0
    18b4:	00003097          	auipc	ra,0x3
    18b8:	050080e7          	jalr	80(ra) # 4904 <exit>
      printf("fork failed\n");
    18bc:	00004517          	auipc	a0,0x4
    18c0:	ffc50513          	addi	a0,a0,-4 # 58b8 <malloc+0xb6e>
    18c4:	00003097          	auipc	ra,0x3
    18c8:	3ce080e7          	jalr	974(ra) # 4c92 <printf>
      exit(1);
    18cc:	4505                	li	a0,1
    18ce:	00003097          	auipc	ra,0x3
    18d2:	036080e7          	jalr	54(ra) # 4904 <exit>
      fork();
    18d6:	00003097          	auipc	ra,0x3
    18da:	026080e7          	jalr	38(ra) # 48fc <fork>
      fork();
    18de:	00003097          	auipc	ra,0x3
    18e2:	01e080e7          	jalr	30(ra) # 48fc <fork>
      exit(0);
    18e6:	4501                	li	a0,0
    18e8:	00003097          	auipc	ra,0x3
    18ec:	01c080e7          	jalr	28(ra) # 4904 <exit>

00000000000018f0 <forktest>:
{
    18f0:	7179                	addi	sp,sp,-48
    18f2:	f406                	sd	ra,40(sp)
    18f4:	f022                	sd	s0,32(sp)
    18f6:	ec26                	sd	s1,24(sp)
    18f8:	e84a                	sd	s2,16(sp)
    18fa:	e44e                	sd	s3,8(sp)
    18fc:	1800                	addi	s0,sp,48
    18fe:	89aa                	mv	s3,a0
  for(n=0; n<N; n++){
    1900:	4481                	li	s1,0
    1902:	3e800913          	li	s2,1000
    pid = fork();
    1906:	00003097          	auipc	ra,0x3
    190a:	ff6080e7          	jalr	-10(ra) # 48fc <fork>
    if(pid < 0)
    190e:	02054863          	bltz	a0,193e <forktest+0x4e>
    if(pid == 0)
    1912:	c115                	beqz	a0,1936 <forktest+0x46>
  for(n=0; n<N; n++){
    1914:	2485                	addiw	s1,s1,1
    1916:	ff2498e3          	bne	s1,s2,1906 <forktest+0x16>
    printf("%s: fork claimed to work 1000 times!\n", s);
    191a:	85ce                	mv	a1,s3
    191c:	00004517          	auipc	a0,0x4
    1920:	e2450513          	addi	a0,a0,-476 # 5740 <malloc+0x9f6>
    1924:	00003097          	auipc	ra,0x3
    1928:	36e080e7          	jalr	878(ra) # 4c92 <printf>
    exit(1);
    192c:	4505                	li	a0,1
    192e:	00003097          	auipc	ra,0x3
    1932:	fd6080e7          	jalr	-42(ra) # 4904 <exit>
      exit(0);
    1936:	00003097          	auipc	ra,0x3
    193a:	fce080e7          	jalr	-50(ra) # 4904 <exit>
  if (n == 0) {
    193e:	cc9d                	beqz	s1,197c <forktest+0x8c>
  if(n == N){
    1940:	3e800793          	li	a5,1000
    1944:	fcf48be3          	beq	s1,a5,191a <forktest+0x2a>
  for(; n > 0; n--){
    1948:	00905b63          	blez	s1,195e <forktest+0x6e>
    if(wait(0) < 0){
    194c:	4501                	li	a0,0
    194e:	00003097          	auipc	ra,0x3
    1952:	fbe080e7          	jalr	-66(ra) # 490c <wait>
    1956:	04054163          	bltz	a0,1998 <forktest+0xa8>
  for(; n > 0; n--){
    195a:	34fd                	addiw	s1,s1,-1
    195c:	f8e5                	bnez	s1,194c <forktest+0x5c>
  if(wait(0) != -1){
    195e:	4501                	li	a0,0
    1960:	00003097          	auipc	ra,0x3
    1964:	fac080e7          	jalr	-84(ra) # 490c <wait>
    1968:	57fd                	li	a5,-1
    196a:	04f51563          	bne	a0,a5,19b4 <forktest+0xc4>
}
    196e:	70a2                	ld	ra,40(sp)
    1970:	7402                	ld	s0,32(sp)
    1972:	64e2                	ld	s1,24(sp)
    1974:	6942                	ld	s2,16(sp)
    1976:	69a2                	ld	s3,8(sp)
    1978:	6145                	addi	sp,sp,48
    197a:	8082                	ret
    printf("%s: no fork at all!\n", s);
    197c:	85ce                	mv	a1,s3
    197e:	00004517          	auipc	a0,0x4
    1982:	daa50513          	addi	a0,a0,-598 # 5728 <malloc+0x9de>
    1986:	00003097          	auipc	ra,0x3
    198a:	30c080e7          	jalr	780(ra) # 4c92 <printf>
    exit(1);
    198e:	4505                	li	a0,1
    1990:	00003097          	auipc	ra,0x3
    1994:	f74080e7          	jalr	-140(ra) # 4904 <exit>
      printf("%s: wait stopped early\n", s);
    1998:	85ce                	mv	a1,s3
    199a:	00004517          	auipc	a0,0x4
    199e:	dce50513          	addi	a0,a0,-562 # 5768 <malloc+0xa1e>
    19a2:	00003097          	auipc	ra,0x3
    19a6:	2f0080e7          	jalr	752(ra) # 4c92 <printf>
      exit(1);
    19aa:	4505                	li	a0,1
    19ac:	00003097          	auipc	ra,0x3
    19b0:	f58080e7          	jalr	-168(ra) # 4904 <exit>
    printf("%s: wait got too many\n", s);
    19b4:	85ce                	mv	a1,s3
    19b6:	00004517          	auipc	a0,0x4
    19ba:	dca50513          	addi	a0,a0,-566 # 5780 <malloc+0xa36>
    19be:	00003097          	auipc	ra,0x3
    19c2:	2d4080e7          	jalr	724(ra) # 4c92 <printf>
    exit(1);
    19c6:	4505                	li	a0,1
    19c8:	00003097          	auipc	ra,0x3
    19cc:	f3c080e7          	jalr	-196(ra) # 4904 <exit>

00000000000019d0 <kernmem>:
{
    19d0:	715d                	addi	sp,sp,-80
    19d2:	e486                	sd	ra,72(sp)
    19d4:	e0a2                	sd	s0,64(sp)
    19d6:	fc26                	sd	s1,56(sp)
    19d8:	f84a                	sd	s2,48(sp)
    19da:	f44e                	sd	s3,40(sp)
    19dc:	f052                	sd	s4,32(sp)
    19de:	ec56                	sd	s5,24(sp)
    19e0:	e85a                	sd	s6,16(sp)
    19e2:	0880                	addi	s0,sp,80
    19e4:	8b2a                	mv	s6,a0
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    19e6:	40100493          	li	s1,1025
    19ea:	04d6                	slli	s1,s1,0x15
    wait(&xstatus);
    19ec:	fbc40a93          	addi	s5,s0,-68
    if(xstatus != -1)  // did kernel kill child?
    19f0:	5a7d                	li	s4,-1
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    19f2:	69b1                	lui	s3,0xc
    19f4:	35098993          	addi	s3,s3,848 # c350 <__BSS_END__+0x2d8>
    19f8:	1007d937          	lui	s2,0x1007d
    19fc:	090e                	slli	s2,s2,0x3
    19fe:	48090913          	addi	s2,s2,1152 # 1007d480 <__BSS_END__+0x10071408>
    pid = fork();
    1a02:	00003097          	auipc	ra,0x3
    1a06:	efa080e7          	jalr	-262(ra) # 48fc <fork>
    if(pid < 0){
    1a0a:	02054963          	bltz	a0,1a3c <kernmem+0x6c>
    if(pid == 0){
    1a0e:	c529                	beqz	a0,1a58 <kernmem+0x88>
    wait(&xstatus);
    1a10:	8556                	mv	a0,s5
    1a12:	00003097          	auipc	ra,0x3
    1a16:	efa080e7          	jalr	-262(ra) # 490c <wait>
    if(xstatus != -1)  // did kernel kill child?
    1a1a:	fbc42783          	lw	a5,-68(s0)
    1a1e:	05479d63          	bne	a5,s4,1a78 <kernmem+0xa8>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    1a22:	94ce                	add	s1,s1,s3
    1a24:	fd249fe3          	bne	s1,s2,1a02 <kernmem+0x32>
}
    1a28:	60a6                	ld	ra,72(sp)
    1a2a:	6406                	ld	s0,64(sp)
    1a2c:	74e2                	ld	s1,56(sp)
    1a2e:	7942                	ld	s2,48(sp)
    1a30:	79a2                	ld	s3,40(sp)
    1a32:	7a02                	ld	s4,32(sp)
    1a34:	6ae2                	ld	s5,24(sp)
    1a36:	6b42                	ld	s6,16(sp)
    1a38:	6161                	addi	sp,sp,80
    1a3a:	8082                	ret
      printf("%s: fork failed\n", s);
    1a3c:	85da                	mv	a1,s6
    1a3e:	00004517          	auipc	a0,0x4
    1a42:	afa50513          	addi	a0,a0,-1286 # 5538 <malloc+0x7ee>
    1a46:	00003097          	auipc	ra,0x3
    1a4a:	24c080e7          	jalr	588(ra) # 4c92 <printf>
      exit(1);
    1a4e:	4505                	li	a0,1
    1a50:	00003097          	auipc	ra,0x3
    1a54:	eb4080e7          	jalr	-332(ra) # 4904 <exit>
      printf("%s: oops could read %x = %x\n", a, *a);
    1a58:	0004c603          	lbu	a2,0(s1)
    1a5c:	85a6                	mv	a1,s1
    1a5e:	00004517          	auipc	a0,0x4
    1a62:	d3a50513          	addi	a0,a0,-710 # 5798 <malloc+0xa4e>
    1a66:	00003097          	auipc	ra,0x3
    1a6a:	22c080e7          	jalr	556(ra) # 4c92 <printf>
      exit(1);
    1a6e:	4505                	li	a0,1
    1a70:	00003097          	auipc	ra,0x3
    1a74:	e94080e7          	jalr	-364(ra) # 4904 <exit>
      exit(1);
    1a78:	4505                	li	a0,1
    1a7a:	00003097          	auipc	ra,0x3
    1a7e:	e8a080e7          	jalr	-374(ra) # 4904 <exit>

0000000000001a82 <bigargtest>:
{
    1a82:	7179                	addi	sp,sp,-48
    1a84:	f406                	sd	ra,40(sp)
    1a86:	f022                	sd	s0,32(sp)
    1a88:	ec26                	sd	s1,24(sp)
    1a8a:	1800                	addi	s0,sp,48
    1a8c:	84aa                	mv	s1,a0
  remove("bigarg-ok");
    1a8e:	00004517          	auipc	a0,0x4
    1a92:	d2a50513          	addi	a0,a0,-726 # 57b8 <malloc+0xa6e>
    1a96:	00003097          	auipc	ra,0x3
    1a9a:	f16080e7          	jalr	-234(ra) # 49ac <remove>
  pid = fork();
    1a9e:	00003097          	auipc	ra,0x3
    1aa2:	e5e080e7          	jalr	-418(ra) # 48fc <fork>
  if(pid == 0){
    1aa6:	c921                	beqz	a0,1af6 <bigargtest+0x74>
  } else if(pid < 0){
    1aa8:	0a054a63          	bltz	a0,1b5c <bigargtest+0xda>
  wait(&xstatus);
    1aac:	fdc40513          	addi	a0,s0,-36
    1ab0:	00003097          	auipc	ra,0x3
    1ab4:	e5c080e7          	jalr	-420(ra) # 490c <wait>
  if(xstatus != 0)
    1ab8:	fdc42503          	lw	a0,-36(s0)
    1abc:	ed55                	bnez	a0,1b78 <bigargtest+0xf6>
  fd = open("bigarg-ok", 0);
    1abe:	4581                	li	a1,0
    1ac0:	00004517          	auipc	a0,0x4
    1ac4:	cf850513          	addi	a0,a0,-776 # 57b8 <malloc+0xa6e>
    1ac8:	00003097          	auipc	ra,0x3
    1acc:	e7c080e7          	jalr	-388(ra) # 4944 <open>
  if(fd < 0){
    1ad0:	0a054863          	bltz	a0,1b80 <bigargtest+0xfe>
  close(fd);
    1ad4:	00003097          	auipc	ra,0x3
    1ad8:	e58080e7          	jalr	-424(ra) # 492c <close>
  remove("bigarg-ok");
    1adc:	00004517          	auipc	a0,0x4
    1ae0:	cdc50513          	addi	a0,a0,-804 # 57b8 <malloc+0xa6e>
    1ae4:	00003097          	auipc	ra,0x3
    1ae8:	ec8080e7          	jalr	-312(ra) # 49ac <remove>
}
    1aec:	70a2                	ld	ra,40(sp)
    1aee:	7402                	ld	s0,32(sp)
    1af0:	64e2                	ld	s1,24(sp)
    1af2:	6145                	addi	sp,sp,48
    1af4:	8082                	ret
    1af6:	00005797          	auipc	a5,0x5
    1afa:	55278793          	addi	a5,a5,1362 # 7048 <args.1>
    1afe:	00005697          	auipc	a3,0x5
    1b02:	64268693          	addi	a3,a3,1602 # 7140 <args.1+0xf8>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    1b06:	00004717          	auipc	a4,0x4
    1b0a:	cc270713          	addi	a4,a4,-830 # 57c8 <malloc+0xa7e>
    1b0e:	e398                	sd	a4,0(a5)
    for(i = 0; i < MAXARG-1; i++)
    1b10:	07a1                	addi	a5,a5,8
    1b12:	fed79ee3          	bne	a5,a3,1b0e <bigargtest+0x8c>
    args[MAXARG-1] = 0;
    1b16:	00005797          	auipc	a5,0x5
    1b1a:	6207b523          	sd	zero,1578(a5) # 7140 <args.1+0xf8>
    exec("echo", args);
    1b1e:	00005597          	auipc	a1,0x5
    1b22:	52a58593          	addi	a1,a1,1322 # 7048 <args.1>
    1b26:	00003517          	auipc	a0,0x3
    1b2a:	38250513          	addi	a0,a0,898 # 4ea8 <malloc+0x15e>
    1b2e:	00003097          	auipc	ra,0x3
    1b32:	e0e080e7          	jalr	-498(ra) # 493c <exec>
    fd = open("bigarg-ok", O_CREATE);
    1b36:	20000593          	li	a1,512
    1b3a:	00004517          	auipc	a0,0x4
    1b3e:	c7e50513          	addi	a0,a0,-898 # 57b8 <malloc+0xa6e>
    1b42:	00003097          	auipc	ra,0x3
    1b46:	e02080e7          	jalr	-510(ra) # 4944 <open>
    close(fd);
    1b4a:	00003097          	auipc	ra,0x3
    1b4e:	de2080e7          	jalr	-542(ra) # 492c <close>
    exit(0);
    1b52:	4501                	li	a0,0
    1b54:	00003097          	auipc	ra,0x3
    1b58:	db0080e7          	jalr	-592(ra) # 4904 <exit>
    printf("%s: bigargtest: fork failed\n", s);
    1b5c:	85a6                	mv	a1,s1
    1b5e:	00004517          	auipc	a0,0x4
    1b62:	d4a50513          	addi	a0,a0,-694 # 58a8 <malloc+0xb5e>
    1b66:	00003097          	auipc	ra,0x3
    1b6a:	12c080e7          	jalr	300(ra) # 4c92 <printf>
    exit(1);
    1b6e:	4505                	li	a0,1
    1b70:	00003097          	auipc	ra,0x3
    1b74:	d94080e7          	jalr	-620(ra) # 4904 <exit>
    exit(xstatus);
    1b78:	00003097          	auipc	ra,0x3
    1b7c:	d8c080e7          	jalr	-628(ra) # 4904 <exit>
    printf("%s: bigarg test failed!\n", s);
    1b80:	85a6                	mv	a1,s1
    1b82:	00004517          	auipc	a0,0x4
    1b86:	d4650513          	addi	a0,a0,-698 # 58c8 <malloc+0xb7e>
    1b8a:	00003097          	auipc	ra,0x3
    1b8e:	108080e7          	jalr	264(ra) # 4c92 <printf>
    exit(1);
    1b92:	4505                	li	a0,1
    1b94:	00003097          	auipc	ra,0x3
    1b98:	d70080e7          	jalr	-656(ra) # 4904 <exit>

0000000000001b9c <stacktest>:
{
    1b9c:	7179                	addi	sp,sp,-48
    1b9e:	f406                	sd	ra,40(sp)
    1ba0:	f022                	sd	s0,32(sp)
    1ba2:	ec26                	sd	s1,24(sp)
    1ba4:	1800                	addi	s0,sp,48
    1ba6:	84aa                	mv	s1,a0
  pid = fork();
    1ba8:	00003097          	auipc	ra,0x3
    1bac:	d54080e7          	jalr	-684(ra) # 48fc <fork>
  if(pid == 0) {
    1bb0:	c115                	beqz	a0,1bd4 <stacktest+0x38>
  } else if(pid < 0){
    1bb2:	04054363          	bltz	a0,1bf8 <stacktest+0x5c>
  wait(&xstatus);
    1bb6:	fdc40513          	addi	a0,s0,-36
    1bba:	00003097          	auipc	ra,0x3
    1bbe:	d52080e7          	jalr	-686(ra) # 490c <wait>
  if(xstatus == -1)  // kernel killed child?
    1bc2:	fdc42503          	lw	a0,-36(s0)
    1bc6:	57fd                	li	a5,-1
    1bc8:	04f50663          	beq	a0,a5,1c14 <stacktest+0x78>
    exit(xstatus);
    1bcc:	00003097          	auipc	ra,0x3
    1bd0:	d38080e7          	jalr	-712(ra) # 4904 <exit>

static inline uint64
r_sp()
{
  uint64 x;
  asm volatile("mv %0, sp" : "=r" (x) );
    1bd4:	870a                	mv	a4,sp
    printf("%s: stacktest: read below stack %p\n", *sp);
    1bd6:	77fd                	lui	a5,0xfffff
    1bd8:	97ba                	add	a5,a5,a4
    1bda:	0007c583          	lbu	a1,0(a5) # fffffffffffff000 <__BSS_END__+0xffffffffffff2f88>
    1bde:	00004517          	auipc	a0,0x4
    1be2:	d0a50513          	addi	a0,a0,-758 # 58e8 <malloc+0xb9e>
    1be6:	00003097          	auipc	ra,0x3
    1bea:	0ac080e7          	jalr	172(ra) # 4c92 <printf>
    exit(1);
    1bee:	4505                	li	a0,1
    1bf0:	00003097          	auipc	ra,0x3
    1bf4:	d14080e7          	jalr	-748(ra) # 4904 <exit>
    printf("%s: fork failed\n", s);
    1bf8:	85a6                	mv	a1,s1
    1bfa:	00004517          	auipc	a0,0x4
    1bfe:	93e50513          	addi	a0,a0,-1730 # 5538 <malloc+0x7ee>
    1c02:	00003097          	auipc	ra,0x3
    1c06:	090080e7          	jalr	144(ra) # 4c92 <printf>
    exit(1);
    1c0a:	4505                	li	a0,1
    1c0c:	00003097          	auipc	ra,0x3
    1c10:	cf8080e7          	jalr	-776(ra) # 4904 <exit>
    exit(0);
    1c14:	4501                	li	a0,0
    1c16:	00003097          	auipc	ra,0x3
    1c1a:	cee080e7          	jalr	-786(ra) # 4904 <exit>

0000000000001c1e <copyinstr3>:
{
    1c1e:	7179                	addi	sp,sp,-48
    1c20:	f406                	sd	ra,40(sp)
    1c22:	f022                	sd	s0,32(sp)
    1c24:	ec26                	sd	s1,24(sp)
    1c26:	1800                	addi	s0,sp,48
  sbrk(8192);
    1c28:	6509                	lui	a0,0x2
    1c2a:	00003097          	auipc	ra,0x3
    1c2e:	d4a080e7          	jalr	-694(ra) # 4974 <sbrk>
  uint64 top = (uint64) sbrk(0);
    1c32:	4501                	li	a0,0
    1c34:	00003097          	auipc	ra,0x3
    1c38:	d40080e7          	jalr	-704(ra) # 4974 <sbrk>
  if((top % PGSIZE) != 0){
    1c3c:	03451793          	slli	a5,a0,0x34
    1c40:	eba5                	bnez	a5,1cb0 <copyinstr3+0x92>
  top = (uint64) sbrk(0);
    1c42:	4501                	li	a0,0
    1c44:	00003097          	auipc	ra,0x3
    1c48:	d30080e7          	jalr	-720(ra) # 4974 <sbrk>
  if(top % PGSIZE){
    1c4c:	03451793          	slli	a5,a0,0x34
    1c50:	ebb5                	bnez	a5,1cc4 <copyinstr3+0xa6>
  char *b = (char *) (top - 1);
    1c52:	fff50493          	addi	s1,a0,-1 # 1fff <sbrkmuch+0x143>
  *b = 'x';
    1c56:	07800793          	li	a5,120
    1c5a:	fef50fa3          	sb	a5,-1(a0)
  int ret = remove(b);
    1c5e:	8526                	mv	a0,s1
    1c60:	00003097          	auipc	ra,0x3
    1c64:	d4c080e7          	jalr	-692(ra) # 49ac <remove>
  if(ret != -1){
    1c68:	57fd                	li	a5,-1
    1c6a:	06f51a63          	bne	a0,a5,1cde <copyinstr3+0xc0>
  int fd = open(b, O_CREATE | O_WRONLY);
    1c6e:	20100593          	li	a1,513
    1c72:	8526                	mv	a0,s1
    1c74:	00003097          	auipc	ra,0x3
    1c78:	cd0080e7          	jalr	-816(ra) # 4944 <open>
  if(fd != -1){
    1c7c:	57fd                	li	a5,-1
    1c7e:	06f51f63          	bne	a0,a5,1cfc <copyinstr3+0xde>
  char *args[] = { "xx", 0 };
    1c82:	00004797          	auipc	a5,0x4
    1c86:	41678793          	addi	a5,a5,1046 # 6098 <malloc+0x134e>
    1c8a:	fcf43823          	sd	a5,-48(s0)
    1c8e:	fc043c23          	sd	zero,-40(s0)
  ret = exec(b, args);
    1c92:	fd040593          	addi	a1,s0,-48
    1c96:	8526                	mv	a0,s1
    1c98:	00003097          	auipc	ra,0x3
    1c9c:	ca4080e7          	jalr	-860(ra) # 493c <exec>
  if(ret != -1){
    1ca0:	57fd                	li	a5,-1
    1ca2:	06f51c63          	bne	a0,a5,1d1a <copyinstr3+0xfc>
}
    1ca6:	70a2                	ld	ra,40(sp)
    1ca8:	7402                	ld	s0,32(sp)
    1caa:	64e2                	ld	s1,24(sp)
    1cac:	6145                	addi	sp,sp,48
    1cae:	8082                	ret
    sbrk(PGSIZE - (top % PGSIZE));
    1cb0:	0347d513          	srli	a0,a5,0x34
    1cb4:	6785                	lui	a5,0x1
    1cb6:	40a7853b          	subw	a0,a5,a0
    1cba:	00003097          	auipc	ra,0x3
    1cbe:	cba080e7          	jalr	-838(ra) # 4974 <sbrk>
    1cc2:	b741                	j	1c42 <copyinstr3+0x24>
    printf("oops\n");
    1cc4:	00004517          	auipc	a0,0x4
    1cc8:	c4c50513          	addi	a0,a0,-948 # 5910 <malloc+0xbc6>
    1ccc:	00003097          	auipc	ra,0x3
    1cd0:	fc6080e7          	jalr	-58(ra) # 4c92 <printf>
    exit(1);
    1cd4:	4505                	li	a0,1
    1cd6:	00003097          	auipc	ra,0x3
    1cda:	c2e080e7          	jalr	-978(ra) # 4904 <exit>
    printf("remove(%s) returned %d, not -1\n", b, ret);
    1cde:	862a                	mv	a2,a0
    1ce0:	85a6                	mv	a1,s1
    1ce2:	00003517          	auipc	a0,0x3
    1ce6:	79e50513          	addi	a0,a0,1950 # 5480 <malloc+0x736>
    1cea:	00003097          	auipc	ra,0x3
    1cee:	fa8080e7          	jalr	-88(ra) # 4c92 <printf>
    exit(1);
    1cf2:	4505                	li	a0,1
    1cf4:	00003097          	auipc	ra,0x3
    1cf8:	c10080e7          	jalr	-1008(ra) # 4904 <exit>
    printf("open(%s) returned %d, not -1\n", b, fd);
    1cfc:	862a                	mv	a2,a0
    1cfe:	85a6                	mv	a1,s1
    1d00:	00003517          	auipc	a0,0x3
    1d04:	7a050513          	addi	a0,a0,1952 # 54a0 <malloc+0x756>
    1d08:	00003097          	auipc	ra,0x3
    1d0c:	f8a080e7          	jalr	-118(ra) # 4c92 <printf>
    exit(1);
    1d10:	4505                	li	a0,1
    1d12:	00003097          	auipc	ra,0x3
    1d16:	bf2080e7          	jalr	-1038(ra) # 4904 <exit>
    printf("exec(%s) returned %d, not -1\n", b, fd);
    1d1a:	567d                	li	a2,-1
    1d1c:	85a6                	mv	a1,s1
    1d1e:	00003517          	auipc	a0,0x3
    1d22:	7a250513          	addi	a0,a0,1954 # 54c0 <malloc+0x776>
    1d26:	00003097          	auipc	ra,0x3
    1d2a:	f6c080e7          	jalr	-148(ra) # 4c92 <printf>
    exit(1);
    1d2e:	4505                	li	a0,1
    1d30:	00003097          	auipc	ra,0x3
    1d34:	bd4080e7          	jalr	-1068(ra) # 4904 <exit>

0000000000001d38 <sbrkbasic>:
{
    1d38:	7139                	addi	sp,sp,-64
    1d3a:	fc06                	sd	ra,56(sp)
    1d3c:	f822                	sd	s0,48(sp)
    1d3e:	f426                	sd	s1,40(sp)
    1d40:	f04a                	sd	s2,32(sp)
    1d42:	ec4e                	sd	s3,24(sp)
    1d44:	e852                	sd	s4,16(sp)
    1d46:	0080                	addi	s0,sp,64
    1d48:	8a2a                	mv	s4,a0
  pid = fork();
    1d4a:	00003097          	auipc	ra,0x3
    1d4e:	bb2080e7          	jalr	-1102(ra) # 48fc <fork>
  if(pid < 0){
    1d52:	02054c63          	bltz	a0,1d8a <sbrkbasic+0x52>
  if(pid == 0){
    1d56:	ed21                	bnez	a0,1dae <sbrkbasic+0x76>
    a = sbrk(TOOMUCH);
    1d58:	40000537          	lui	a0,0x40000
    1d5c:	00003097          	auipc	ra,0x3
    1d60:	c18080e7          	jalr	-1000(ra) # 4974 <sbrk>
    if(a == (char*)0xffffffffffffffffL){
    1d64:	57fd                	li	a5,-1
    1d66:	02f50f63          	beq	a0,a5,1da4 <sbrkbasic+0x6c>
    for(b = a; b < a+TOOMUCH; b += 4096){
    1d6a:	400007b7          	lui	a5,0x40000
    1d6e:	97aa                	add	a5,a5,a0
      *b = 99;
    1d70:	06300693          	li	a3,99
    for(b = a; b < a+TOOMUCH; b += 4096){
    1d74:	6705                	lui	a4,0x1
      *b = 99;
    1d76:	00d50023          	sb	a3,0(a0) # 40000000 <__BSS_END__+0x3fff3f88>
    for(b = a; b < a+TOOMUCH; b += 4096){
    1d7a:	953a                	add	a0,a0,a4
    1d7c:	fef51de3          	bne	a0,a5,1d76 <sbrkbasic+0x3e>
    exit(1);
    1d80:	4505                	li	a0,1
    1d82:	00003097          	auipc	ra,0x3
    1d86:	b82080e7          	jalr	-1150(ra) # 4904 <exit>
    printf("fork failed in sbrkbasic\n");
    1d8a:	00004517          	auipc	a0,0x4
    1d8e:	b8e50513          	addi	a0,a0,-1138 # 5918 <malloc+0xbce>
    1d92:	00003097          	auipc	ra,0x3
    1d96:	f00080e7          	jalr	-256(ra) # 4c92 <printf>
    exit(1);
    1d9a:	4505                	li	a0,1
    1d9c:	00003097          	auipc	ra,0x3
    1da0:	b68080e7          	jalr	-1176(ra) # 4904 <exit>
      exit(0);
    1da4:	4501                	li	a0,0
    1da6:	00003097          	auipc	ra,0x3
    1daa:	b5e080e7          	jalr	-1186(ra) # 4904 <exit>
  wait(&xstatus);
    1dae:	fcc40513          	addi	a0,s0,-52
    1db2:	00003097          	auipc	ra,0x3
    1db6:	b5a080e7          	jalr	-1190(ra) # 490c <wait>
  if(xstatus == 1){
    1dba:	fcc42703          	lw	a4,-52(s0)
    1dbe:	4785                	li	a5,1
    1dc0:	00f70d63          	beq	a4,a5,1dda <sbrkbasic+0xa2>
  a = sbrk(0);
    1dc4:	4501                	li	a0,0
    1dc6:	00003097          	auipc	ra,0x3
    1dca:	bae080e7          	jalr	-1106(ra) # 4974 <sbrk>
    1dce:	84aa                	mv	s1,a0
  for(i = 0; i < 5000; i++){
    1dd0:	4901                	li	s2,0
    1dd2:	6985                	lui	s3,0x1
    1dd4:	38898993          	addi	s3,s3,904 # 1388 <exectest+0xc8>
    1dd8:	a005                	j	1df8 <sbrkbasic+0xc0>
    printf("%s: too much memory allocated!\n", s);
    1dda:	85d2                	mv	a1,s4
    1ddc:	00004517          	auipc	a0,0x4
    1de0:	b5c50513          	addi	a0,a0,-1188 # 5938 <malloc+0xbee>
    1de4:	00003097          	auipc	ra,0x3
    1de8:	eae080e7          	jalr	-338(ra) # 4c92 <printf>
    exit(1);
    1dec:	4505                	li	a0,1
    1dee:	00003097          	auipc	ra,0x3
    1df2:	b16080e7          	jalr	-1258(ra) # 4904 <exit>
    a = b + 1;
    1df6:	84be                	mv	s1,a5
    b = sbrk(1);
    1df8:	4505                	li	a0,1
    1dfa:	00003097          	auipc	ra,0x3
    1dfe:	b7a080e7          	jalr	-1158(ra) # 4974 <sbrk>
    if(b != a){
    1e02:	04951c63          	bne	a0,s1,1e5a <sbrkbasic+0x122>
    *b = 1;
    1e06:	4785                	li	a5,1
    1e08:	00f48023          	sb	a5,0(s1)
    a = b + 1;
    1e0c:	00148793          	addi	a5,s1,1
  for(i = 0; i < 5000; i++){
    1e10:	2905                	addiw	s2,s2,1
    1e12:	ff3912e3          	bne	s2,s3,1df6 <sbrkbasic+0xbe>
  pid = fork();
    1e16:	00003097          	auipc	ra,0x3
    1e1a:	ae6080e7          	jalr	-1306(ra) # 48fc <fork>
    1e1e:	892a                	mv	s2,a0
  if(pid < 0){
    1e20:	04054d63          	bltz	a0,1e7a <sbrkbasic+0x142>
  c = sbrk(1);
    1e24:	4505                	li	a0,1
    1e26:	00003097          	auipc	ra,0x3
    1e2a:	b4e080e7          	jalr	-1202(ra) # 4974 <sbrk>
  c = sbrk(1);
    1e2e:	4505                	li	a0,1
    1e30:	00003097          	auipc	ra,0x3
    1e34:	b44080e7          	jalr	-1212(ra) # 4974 <sbrk>
  if(c != a + 1){
    1e38:	0489                	addi	s1,s1,2
    1e3a:	04a48e63          	beq	s1,a0,1e96 <sbrkbasic+0x15e>
    printf("%s: sbrk test failed post-fork\n", s);
    1e3e:	85d2                	mv	a1,s4
    1e40:	00004517          	auipc	a0,0x4
    1e44:	b5850513          	addi	a0,a0,-1192 # 5998 <malloc+0xc4e>
    1e48:	00003097          	auipc	ra,0x3
    1e4c:	e4a080e7          	jalr	-438(ra) # 4c92 <printf>
    exit(1);
    1e50:	4505                	li	a0,1
    1e52:	00003097          	auipc	ra,0x3
    1e56:	ab2080e7          	jalr	-1358(ra) # 4904 <exit>
      printf("%s: sbrk test failed %d %x %x\n", i, a, b);
    1e5a:	86aa                	mv	a3,a0
    1e5c:	8626                	mv	a2,s1
    1e5e:	85ca                	mv	a1,s2
    1e60:	00004517          	auipc	a0,0x4
    1e64:	af850513          	addi	a0,a0,-1288 # 5958 <malloc+0xc0e>
    1e68:	00003097          	auipc	ra,0x3
    1e6c:	e2a080e7          	jalr	-470(ra) # 4c92 <printf>
      exit(1);
    1e70:	4505                	li	a0,1
    1e72:	00003097          	auipc	ra,0x3
    1e76:	a92080e7          	jalr	-1390(ra) # 4904 <exit>
    printf("%s: sbrk test fork failed\n", s);
    1e7a:	85d2                	mv	a1,s4
    1e7c:	00004517          	auipc	a0,0x4
    1e80:	afc50513          	addi	a0,a0,-1284 # 5978 <malloc+0xc2e>
    1e84:	00003097          	auipc	ra,0x3
    1e88:	e0e080e7          	jalr	-498(ra) # 4c92 <printf>
    exit(1);
    1e8c:	4505                	li	a0,1
    1e8e:	00003097          	auipc	ra,0x3
    1e92:	a76080e7          	jalr	-1418(ra) # 4904 <exit>
  if(pid == 0)
    1e96:	00091763          	bnez	s2,1ea4 <sbrkbasic+0x16c>
    exit(0);
    1e9a:	4501                	li	a0,0
    1e9c:	00003097          	auipc	ra,0x3
    1ea0:	a68080e7          	jalr	-1432(ra) # 4904 <exit>
  wait(&xstatus);
    1ea4:	fcc40513          	addi	a0,s0,-52
    1ea8:	00003097          	auipc	ra,0x3
    1eac:	a64080e7          	jalr	-1436(ra) # 490c <wait>
  exit(xstatus);
    1eb0:	fcc42503          	lw	a0,-52(s0)
    1eb4:	00003097          	auipc	ra,0x3
    1eb8:	a50080e7          	jalr	-1456(ra) # 4904 <exit>

0000000000001ebc <sbrkmuch>:
{
    1ebc:	7179                	addi	sp,sp,-48
    1ebe:	f406                	sd	ra,40(sp)
    1ec0:	f022                	sd	s0,32(sp)
    1ec2:	ec26                	sd	s1,24(sp)
    1ec4:	e84a                	sd	s2,16(sp)
    1ec6:	e44e                	sd	s3,8(sp)
    1ec8:	e052                	sd	s4,0(sp)
    1eca:	1800                	addi	s0,sp,48
    1ecc:	89aa                	mv	s3,a0
  oldbrk = sbrk(0);
    1ece:	4501                	li	a0,0
    1ed0:	00003097          	auipc	ra,0x3
    1ed4:	aa4080e7          	jalr	-1372(ra) # 4974 <sbrk>
    1ed8:	892a                	mv	s2,a0
  a = sbrk(0);
    1eda:	4501                	li	a0,0
    1edc:	00003097          	auipc	ra,0x3
    1ee0:	a98080e7          	jalr	-1384(ra) # 4974 <sbrk>
    1ee4:	84aa                	mv	s1,a0
  p = sbrk(amt);
    1ee6:	00300537          	lui	a0,0x300
    1eea:	9d05                	subw	a0,a0,s1
    1eec:	00003097          	auipc	ra,0x3
    1ef0:	a88080e7          	jalr	-1400(ra) # 4974 <sbrk>
  if (p != a) {
    1ef4:	0ca49863          	bne	s1,a0,1fc4 <sbrkmuch+0x108>
  char *eee = sbrk(0);
    1ef8:	4501                	li	a0,0
    1efa:	00003097          	auipc	ra,0x3
    1efe:	a7a080e7          	jalr	-1414(ra) # 4974 <sbrk>
    1f02:	87aa                	mv	a5,a0
  for(char *pp = a; pp < eee; pp += 4096)
    1f04:	00a4f963          	bgeu	s1,a0,1f16 <sbrkmuch+0x5a>
    *pp = 1;
    1f08:	4685                	li	a3,1
  for(char *pp = a; pp < eee; pp += 4096)
    1f0a:	6705                	lui	a4,0x1
    *pp = 1;
    1f0c:	00d48023          	sb	a3,0(s1)
  for(char *pp = a; pp < eee; pp += 4096)
    1f10:	94ba                	add	s1,s1,a4
    1f12:	fef4ede3          	bltu	s1,a5,1f0c <sbrkmuch+0x50>
  *lastaddr = 99;
    1f16:	003007b7          	lui	a5,0x300
    1f1a:	06300713          	li	a4,99
    1f1e:	fee78fa3          	sb	a4,-1(a5) # 2fffff <__BSS_END__+0x2f3f87>
  a = sbrk(0);
    1f22:	4501                	li	a0,0
    1f24:	00003097          	auipc	ra,0x3
    1f28:	a50080e7          	jalr	-1456(ra) # 4974 <sbrk>
    1f2c:	84aa                	mv	s1,a0
  c = sbrk(-PGSIZE);
    1f2e:	757d                	lui	a0,0xfffff
    1f30:	00003097          	auipc	ra,0x3
    1f34:	a44080e7          	jalr	-1468(ra) # 4974 <sbrk>
  if(c == (char*)0xffffffffffffffffL){
    1f38:	57fd                	li	a5,-1
    1f3a:	0af50363          	beq	a0,a5,1fe0 <sbrkmuch+0x124>
  c = sbrk(0);
    1f3e:	4501                	li	a0,0
    1f40:	00003097          	auipc	ra,0x3
    1f44:	a34080e7          	jalr	-1484(ra) # 4974 <sbrk>
  if(c != a - PGSIZE){
    1f48:	77fd                	lui	a5,0xfffff
    1f4a:	97a6                	add	a5,a5,s1
    1f4c:	0af51863          	bne	a0,a5,1ffc <sbrkmuch+0x140>
  a = sbrk(0);
    1f50:	4501                	li	a0,0
    1f52:	00003097          	auipc	ra,0x3
    1f56:	a22080e7          	jalr	-1502(ra) # 4974 <sbrk>
    1f5a:	84aa                	mv	s1,a0
  c = sbrk(PGSIZE);
    1f5c:	6505                	lui	a0,0x1
    1f5e:	00003097          	auipc	ra,0x3
    1f62:	a16080e7          	jalr	-1514(ra) # 4974 <sbrk>
    1f66:	8a2a                	mv	s4,a0
  if(c != a || sbrk(0) != a + PGSIZE){
    1f68:	0aa49963          	bne	s1,a0,201a <sbrkmuch+0x15e>
    1f6c:	4501                	li	a0,0
    1f6e:	00003097          	auipc	ra,0x3
    1f72:	a06080e7          	jalr	-1530(ra) # 4974 <sbrk>
    1f76:	6785                	lui	a5,0x1
    1f78:	97a6                	add	a5,a5,s1
    1f7a:	0af51063          	bne	a0,a5,201a <sbrkmuch+0x15e>
  if(*lastaddr == 99){
    1f7e:	003007b7          	lui	a5,0x300
    1f82:	fff7c703          	lbu	a4,-1(a5) # 2fffff <__BSS_END__+0x2f3f87>
    1f86:	06300793          	li	a5,99
    1f8a:	0af70763          	beq	a4,a5,2038 <sbrkmuch+0x17c>
  a = sbrk(0);
    1f8e:	4501                	li	a0,0
    1f90:	00003097          	auipc	ra,0x3
    1f94:	9e4080e7          	jalr	-1564(ra) # 4974 <sbrk>
    1f98:	84aa                	mv	s1,a0
  c = sbrk(-(sbrk(0) - oldbrk));
    1f9a:	4501                	li	a0,0
    1f9c:	00003097          	auipc	ra,0x3
    1fa0:	9d8080e7          	jalr	-1576(ra) # 4974 <sbrk>
    1fa4:	40a9053b          	subw	a0,s2,a0
    1fa8:	00003097          	auipc	ra,0x3
    1fac:	9cc080e7          	jalr	-1588(ra) # 4974 <sbrk>
  if(c != a){
    1fb0:	0aa49263          	bne	s1,a0,2054 <sbrkmuch+0x198>
}
    1fb4:	70a2                	ld	ra,40(sp)
    1fb6:	7402                	ld	s0,32(sp)
    1fb8:	64e2                	ld	s1,24(sp)
    1fba:	6942                	ld	s2,16(sp)
    1fbc:	69a2                	ld	s3,8(sp)
    1fbe:	6a02                	ld	s4,0(sp)
    1fc0:	6145                	addi	sp,sp,48
    1fc2:	8082                	ret
    printf("%s: sbrk test failed to grow big address space; enough phys mem?\n", s);
    1fc4:	85ce                	mv	a1,s3
    1fc6:	00004517          	auipc	a0,0x4
    1fca:	9f250513          	addi	a0,a0,-1550 # 59b8 <malloc+0xc6e>
    1fce:	00003097          	auipc	ra,0x3
    1fd2:	cc4080e7          	jalr	-828(ra) # 4c92 <printf>
    exit(1);
    1fd6:	4505                	li	a0,1
    1fd8:	00003097          	auipc	ra,0x3
    1fdc:	92c080e7          	jalr	-1748(ra) # 4904 <exit>
    printf("%s: sbrk could not deallocate\n", s);
    1fe0:	85ce                	mv	a1,s3
    1fe2:	00004517          	auipc	a0,0x4
    1fe6:	a1e50513          	addi	a0,a0,-1506 # 5a00 <malloc+0xcb6>
    1fea:	00003097          	auipc	ra,0x3
    1fee:	ca8080e7          	jalr	-856(ra) # 4c92 <printf>
    exit(1);
    1ff2:	4505                	li	a0,1
    1ff4:	00003097          	auipc	ra,0x3
    1ff8:	910080e7          	jalr	-1776(ra) # 4904 <exit>
    printf("%s: sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    1ffc:	862a                	mv	a2,a0
    1ffe:	85a6                	mv	a1,s1
    2000:	00004517          	auipc	a0,0x4
    2004:	a2050513          	addi	a0,a0,-1504 # 5a20 <malloc+0xcd6>
    2008:	00003097          	auipc	ra,0x3
    200c:	c8a080e7          	jalr	-886(ra) # 4c92 <printf>
    exit(1);
    2010:	4505                	li	a0,1
    2012:	00003097          	auipc	ra,0x3
    2016:	8f2080e7          	jalr	-1806(ra) # 4904 <exit>
    printf("%s: sbrk re-allocation failed, a %x c %x\n", a, c);
    201a:	8652                	mv	a2,s4
    201c:	85a6                	mv	a1,s1
    201e:	00004517          	auipc	a0,0x4
    2022:	a4250513          	addi	a0,a0,-1470 # 5a60 <malloc+0xd16>
    2026:	00003097          	auipc	ra,0x3
    202a:	c6c080e7          	jalr	-916(ra) # 4c92 <printf>
    exit(1);
    202e:	4505                	li	a0,1
    2030:	00003097          	auipc	ra,0x3
    2034:	8d4080e7          	jalr	-1836(ra) # 4904 <exit>
    printf("%s: sbrk de-allocation didn't really deallocate\n", s);
    2038:	85ce                	mv	a1,s3
    203a:	00004517          	auipc	a0,0x4
    203e:	a5650513          	addi	a0,a0,-1450 # 5a90 <malloc+0xd46>
    2042:	00003097          	auipc	ra,0x3
    2046:	c50080e7          	jalr	-944(ra) # 4c92 <printf>
    exit(1);
    204a:	4505                	li	a0,1
    204c:	00003097          	auipc	ra,0x3
    2050:	8b8080e7          	jalr	-1864(ra) # 4904 <exit>
    printf("%s: sbrk downsize failed, a %x c %x\n", a, c);
    2054:	862a                	mv	a2,a0
    2056:	85a6                	mv	a1,s1
    2058:	00004517          	auipc	a0,0x4
    205c:	a7050513          	addi	a0,a0,-1424 # 5ac8 <malloc+0xd7e>
    2060:	00003097          	auipc	ra,0x3
    2064:	c32080e7          	jalr	-974(ra) # 4c92 <printf>
    exit(1);
    2068:	4505                	li	a0,1
    206a:	00003097          	auipc	ra,0x3
    206e:	89a080e7          	jalr	-1894(ra) # 4904 <exit>

0000000000002072 <sbrkarg>:
{
    2072:	7179                	addi	sp,sp,-48
    2074:	f406                	sd	ra,40(sp)
    2076:	f022                	sd	s0,32(sp)
    2078:	ec26                	sd	s1,24(sp)
    207a:	e84a                	sd	s2,16(sp)
    207c:	e44e                	sd	s3,8(sp)
    207e:	1800                	addi	s0,sp,48
    2080:	89aa                	mv	s3,a0
  a = sbrk(PGSIZE);
    2082:	6505                	lui	a0,0x1
    2084:	00003097          	auipc	ra,0x3
    2088:	8f0080e7          	jalr	-1808(ra) # 4974 <sbrk>
    208c:	892a                	mv	s2,a0
  fd = open("sbrk", O_CREATE|O_WRONLY);
    208e:	20100593          	li	a1,513
    2092:	00004517          	auipc	a0,0x4
    2096:	a5e50513          	addi	a0,a0,-1442 # 5af0 <malloc+0xda6>
    209a:	00003097          	auipc	ra,0x3
    209e:	8aa080e7          	jalr	-1878(ra) # 4944 <open>
    20a2:	84aa                	mv	s1,a0
  remove("sbrk");
    20a4:	00004517          	auipc	a0,0x4
    20a8:	a4c50513          	addi	a0,a0,-1460 # 5af0 <malloc+0xda6>
    20ac:	00003097          	auipc	ra,0x3
    20b0:	900080e7          	jalr	-1792(ra) # 49ac <remove>
  if(fd < 0)  {
    20b4:	0404c163          	bltz	s1,20f6 <sbrkarg+0x84>
  if ((n = write(fd, a, PGSIZE)) < 0) {
    20b8:	6605                	lui	a2,0x1
    20ba:	85ca                	mv	a1,s2
    20bc:	8526                	mv	a0,s1
    20be:	00003097          	auipc	ra,0x3
    20c2:	866080e7          	jalr	-1946(ra) # 4924 <write>
    20c6:	04054663          	bltz	a0,2112 <sbrkarg+0xa0>
  close(fd);
    20ca:	8526                	mv	a0,s1
    20cc:	00003097          	auipc	ra,0x3
    20d0:	860080e7          	jalr	-1952(ra) # 492c <close>
  a = sbrk(PGSIZE);
    20d4:	6505                	lui	a0,0x1
    20d6:	00003097          	auipc	ra,0x3
    20da:	89e080e7          	jalr	-1890(ra) # 4974 <sbrk>
  if(pipe((int *) a) != 0){
    20de:	00003097          	auipc	ra,0x3
    20e2:	836080e7          	jalr	-1994(ra) # 4914 <pipe>
    20e6:	e521                	bnez	a0,212e <sbrkarg+0xbc>
}
    20e8:	70a2                	ld	ra,40(sp)
    20ea:	7402                	ld	s0,32(sp)
    20ec:	64e2                	ld	s1,24(sp)
    20ee:	6942                	ld	s2,16(sp)
    20f0:	69a2                	ld	s3,8(sp)
    20f2:	6145                	addi	sp,sp,48
    20f4:	8082                	ret
    printf("%s: open sbrk failed\n", s);
    20f6:	85ce                	mv	a1,s3
    20f8:	00004517          	auipc	a0,0x4
    20fc:	a0050513          	addi	a0,a0,-1536 # 5af8 <malloc+0xdae>
    2100:	00003097          	auipc	ra,0x3
    2104:	b92080e7          	jalr	-1134(ra) # 4c92 <printf>
    exit(1);
    2108:	4505                	li	a0,1
    210a:	00002097          	auipc	ra,0x2
    210e:	7fa080e7          	jalr	2042(ra) # 4904 <exit>
    printf("%s: write sbrk failed\n", s);
    2112:	85ce                	mv	a1,s3
    2114:	00004517          	auipc	a0,0x4
    2118:	9fc50513          	addi	a0,a0,-1540 # 5b10 <malloc+0xdc6>
    211c:	00003097          	auipc	ra,0x3
    2120:	b76080e7          	jalr	-1162(ra) # 4c92 <printf>
    exit(1);
    2124:	4505                	li	a0,1
    2126:	00002097          	auipc	ra,0x2
    212a:	7de080e7          	jalr	2014(ra) # 4904 <exit>
    printf("%s: pipe() failed\n", s);
    212e:	85ce                	mv	a1,s3
    2130:	00003517          	auipc	a0,0x3
    2134:	51050513          	addi	a0,a0,1296 # 5640 <malloc+0x8f6>
    2138:	00003097          	auipc	ra,0x3
    213c:	b5a080e7          	jalr	-1190(ra) # 4c92 <printf>
    exit(1);
    2140:	4505                	li	a0,1
    2142:	00002097          	auipc	ra,0x2
    2146:	7c2080e7          	jalr	1986(ra) # 4904 <exit>

000000000000214a <argptest>:
{
    214a:	1101                	addi	sp,sp,-32
    214c:	ec06                	sd	ra,24(sp)
    214e:	e822                	sd	s0,16(sp)
    2150:	e426                	sd	s1,8(sp)
    2152:	e04a                	sd	s2,0(sp)
    2154:	1000                	addi	s0,sp,32
    2156:	892a                	mv	s2,a0
  fd = open("init", O_RDONLY);
    2158:	4581                	li	a1,0
    215a:	00004517          	auipc	a0,0x4
    215e:	9ce50513          	addi	a0,a0,-1586 # 5b28 <malloc+0xdde>
    2162:	00002097          	auipc	ra,0x2
    2166:	7e2080e7          	jalr	2018(ra) # 4944 <open>
  if (fd < 0) {
    216a:	02054b63          	bltz	a0,21a0 <argptest+0x56>
    216e:	84aa                	mv	s1,a0
  read(fd, sbrk(0) - 1, -1);
    2170:	4501                	li	a0,0
    2172:	00003097          	auipc	ra,0x3
    2176:	802080e7          	jalr	-2046(ra) # 4974 <sbrk>
    217a:	567d                	li	a2,-1
    217c:	fff50593          	addi	a1,a0,-1
    2180:	8526                	mv	a0,s1
    2182:	00002097          	auipc	ra,0x2
    2186:	79a080e7          	jalr	1946(ra) # 491c <read>
  close(fd);
    218a:	8526                	mv	a0,s1
    218c:	00002097          	auipc	ra,0x2
    2190:	7a0080e7          	jalr	1952(ra) # 492c <close>
}
    2194:	60e2                	ld	ra,24(sp)
    2196:	6442                	ld	s0,16(sp)
    2198:	64a2                	ld	s1,8(sp)
    219a:	6902                	ld	s2,0(sp)
    219c:	6105                	addi	sp,sp,32
    219e:	8082                	ret
    printf("%s: open failed\n", s);
    21a0:	85ca                	mv	a1,s2
    21a2:	00003517          	auipc	a0,0x3
    21a6:	3ae50513          	addi	a0,a0,942 # 5550 <malloc+0x806>
    21aa:	00003097          	auipc	ra,0x3
    21ae:	ae8080e7          	jalr	-1304(ra) # 4c92 <printf>
    exit(1);
    21b2:	4505                	li	a0,1
    21b4:	00002097          	auipc	ra,0x2
    21b8:	750080e7          	jalr	1872(ra) # 4904 <exit>

00000000000021bc <sbrkbugs>:
{
    21bc:	1141                	addi	sp,sp,-16
    21be:	e406                	sd	ra,8(sp)
    21c0:	e022                	sd	s0,0(sp)
    21c2:	0800                	addi	s0,sp,16
  int pid = fork();
    21c4:	00002097          	auipc	ra,0x2
    21c8:	738080e7          	jalr	1848(ra) # 48fc <fork>
  if(pid < 0){
    21cc:	02054263          	bltz	a0,21f0 <sbrkbugs+0x34>
  if(pid == 0){
    21d0:	ed0d                	bnez	a0,220a <sbrkbugs+0x4e>
    int sz = (uint64) sbrk(0);
    21d2:	00002097          	auipc	ra,0x2
    21d6:	7a2080e7          	jalr	1954(ra) # 4974 <sbrk>
    sbrk(-sz);
    21da:	40a0053b          	negw	a0,a0
    21de:	00002097          	auipc	ra,0x2
    21e2:	796080e7          	jalr	1942(ra) # 4974 <sbrk>
    exit(0);
    21e6:	4501                	li	a0,0
    21e8:	00002097          	auipc	ra,0x2
    21ec:	71c080e7          	jalr	1820(ra) # 4904 <exit>
    printf("fork failed\n");
    21f0:	00003517          	auipc	a0,0x3
    21f4:	6c850513          	addi	a0,a0,1736 # 58b8 <malloc+0xb6e>
    21f8:	00003097          	auipc	ra,0x3
    21fc:	a9a080e7          	jalr	-1382(ra) # 4c92 <printf>
    exit(1);
    2200:	4505                	li	a0,1
    2202:	00002097          	auipc	ra,0x2
    2206:	702080e7          	jalr	1794(ra) # 4904 <exit>
  wait(0);
    220a:	4501                	li	a0,0
    220c:	00002097          	auipc	ra,0x2
    2210:	700080e7          	jalr	1792(ra) # 490c <wait>
  pid = fork();
    2214:	00002097          	auipc	ra,0x2
    2218:	6e8080e7          	jalr	1768(ra) # 48fc <fork>
  if(pid < 0){
    221c:	02054563          	bltz	a0,2246 <sbrkbugs+0x8a>
  if(pid == 0){
    2220:	e121                	bnez	a0,2260 <sbrkbugs+0xa4>
    int sz = (uint64) sbrk(0);
    2222:	00002097          	auipc	ra,0x2
    2226:	752080e7          	jalr	1874(ra) # 4974 <sbrk>
    sbrk(-(sz - 3500));
    222a:	6785                	lui	a5,0x1
    222c:	dac7879b          	addiw	a5,a5,-596 # dac <removeread+0xa6>
    2230:	40a7853b          	subw	a0,a5,a0
    2234:	00002097          	auipc	ra,0x2
    2238:	740080e7          	jalr	1856(ra) # 4974 <sbrk>
    exit(0);
    223c:	4501                	li	a0,0
    223e:	00002097          	auipc	ra,0x2
    2242:	6c6080e7          	jalr	1734(ra) # 4904 <exit>
    printf("fork failed\n");
    2246:	00003517          	auipc	a0,0x3
    224a:	67250513          	addi	a0,a0,1650 # 58b8 <malloc+0xb6e>
    224e:	00003097          	auipc	ra,0x3
    2252:	a44080e7          	jalr	-1468(ra) # 4c92 <printf>
    exit(1);
    2256:	4505                	li	a0,1
    2258:	00002097          	auipc	ra,0x2
    225c:	6ac080e7          	jalr	1708(ra) # 4904 <exit>
  wait(0);
    2260:	4501                	li	a0,0
    2262:	00002097          	auipc	ra,0x2
    2266:	6aa080e7          	jalr	1706(ra) # 490c <wait>
  pid = fork();
    226a:	00002097          	auipc	ra,0x2
    226e:	692080e7          	jalr	1682(ra) # 48fc <fork>
  if(pid < 0){
    2272:	02054a63          	bltz	a0,22a6 <sbrkbugs+0xea>
  if(pid == 0){
    2276:	e529                	bnez	a0,22c0 <sbrkbugs+0x104>
    sbrk((10*4096 + 2048) - (uint64)sbrk(0));
    2278:	00002097          	auipc	ra,0x2
    227c:	6fc080e7          	jalr	1788(ra) # 4974 <sbrk>
    2280:	67ad                	lui	a5,0xb
    2282:	8007879b          	addiw	a5,a5,-2048 # a800 <uninit+0x26b0>
    2286:	40a7853b          	subw	a0,a5,a0
    228a:	00002097          	auipc	ra,0x2
    228e:	6ea080e7          	jalr	1770(ra) # 4974 <sbrk>
    sbrk(-10);
    2292:	5559                	li	a0,-10
    2294:	00002097          	auipc	ra,0x2
    2298:	6e0080e7          	jalr	1760(ra) # 4974 <sbrk>
    exit(0);
    229c:	4501                	li	a0,0
    229e:	00002097          	auipc	ra,0x2
    22a2:	666080e7          	jalr	1638(ra) # 4904 <exit>
    printf("fork failed\n");
    22a6:	00003517          	auipc	a0,0x3
    22aa:	61250513          	addi	a0,a0,1554 # 58b8 <malloc+0xb6e>
    22ae:	00003097          	auipc	ra,0x3
    22b2:	9e4080e7          	jalr	-1564(ra) # 4c92 <printf>
    exit(1);
    22b6:	4505                	li	a0,1
    22b8:	00002097          	auipc	ra,0x2
    22bc:	64c080e7          	jalr	1612(ra) # 4904 <exit>
  wait(0);
    22c0:	4501                	li	a0,0
    22c2:	00002097          	auipc	ra,0x2
    22c6:	64a080e7          	jalr	1610(ra) # 490c <wait>
  exit(0);
    22ca:	4501                	li	a0,0
    22cc:	00002097          	auipc	ra,0x2
    22d0:	638080e7          	jalr	1592(ra) # 4904 <exit>

00000000000022d4 <execout>:
// test the exec() code that cleans up if it runs out
// of memory. it's really a test that such a condition
// doesn't cause a panic.
void
execout(char *s)
{
    22d4:	715d                	addi	sp,sp,-80
    22d6:	e486                	sd	ra,72(sp)
    22d8:	e0a2                	sd	s0,64(sp)
    22da:	fc26                	sd	s1,56(sp)
    22dc:	f84a                	sd	s2,48(sp)
    22de:	f44e                	sd	s3,40(sp)
    22e0:	f052                	sd	s4,32(sp)
    22e2:	0880                	addi	s0,sp,80
  for(int avail = 0; avail < 15; avail++){
    22e4:	4901                	li	s2,0
    22e6:	49bd                	li	s3,15
    int pid = fork();
    22e8:	00002097          	auipc	ra,0x2
    22ec:	614080e7          	jalr	1556(ra) # 48fc <fork>
    22f0:	84aa                	mv	s1,a0
    if(pid < 0){
    22f2:	02054063          	bltz	a0,2312 <execout+0x3e>
      printf("fork failed\n");
      exit(1);
    } else if(pid == 0){
    22f6:	c91d                	beqz	a0,232c <execout+0x58>
      close(1);
      char *args[] = { "echo", "x", 0 };
      exec("echo", args);
      exit(0);
    } else {
      wait((int*)0);
    22f8:	4501                	li	a0,0
    22fa:	00002097          	auipc	ra,0x2
    22fe:	612080e7          	jalr	1554(ra) # 490c <wait>
  for(int avail = 0; avail < 15; avail++){
    2302:	2905                	addiw	s2,s2,1
    2304:	ff3912e3          	bne	s2,s3,22e8 <execout+0x14>
    }
  }

  exit(0);
    2308:	4501                	li	a0,0
    230a:	00002097          	auipc	ra,0x2
    230e:	5fa080e7          	jalr	1530(ra) # 4904 <exit>
      printf("fork failed\n");
    2312:	00003517          	auipc	a0,0x3
    2316:	5a650513          	addi	a0,a0,1446 # 58b8 <malloc+0xb6e>
    231a:	00003097          	auipc	ra,0x3
    231e:	978080e7          	jalr	-1672(ra) # 4c92 <printf>
      exit(1);
    2322:	4505                	li	a0,1
    2324:	00002097          	auipc	ra,0x2
    2328:	5e0080e7          	jalr	1504(ra) # 4904 <exit>
        if(a == 0xffffffffffffffffLL)
    232c:	59fd                	li	s3,-1
        *(char*)(a + 4096 - 1) = 1;
    232e:	4a05                	li	s4,1
        uint64 a = (uint64) sbrk(4096);
    2330:	6505                	lui	a0,0x1
    2332:	00002097          	auipc	ra,0x2
    2336:	642080e7          	jalr	1602(ra) # 4974 <sbrk>
        if(a == 0xffffffffffffffffLL)
    233a:	01350763          	beq	a0,s3,2348 <execout+0x74>
        *(char*)(a + 4096 - 1) = 1;
    233e:	6785                	lui	a5,0x1
    2340:	97aa                	add	a5,a5,a0
    2342:	ff478fa3          	sb	s4,-1(a5) # fff <copyinstr2+0xbd>
      while(1){
    2346:	b7ed                	j	2330 <execout+0x5c>
      for(int i = 0; i < avail; i++)
    2348:	01205a63          	blez	s2,235c <execout+0x88>
        sbrk(-4096);
    234c:	757d                	lui	a0,0xfffff
    234e:	00002097          	auipc	ra,0x2
    2352:	626080e7          	jalr	1574(ra) # 4974 <sbrk>
      for(int i = 0; i < avail; i++)
    2356:	2485                	addiw	s1,s1,1
    2358:	ff249ae3          	bne	s1,s2,234c <execout+0x78>
      close(1);
    235c:	4505                	li	a0,1
    235e:	00002097          	auipc	ra,0x2
    2362:	5ce080e7          	jalr	1486(ra) # 492c <close>
      char *args[] = { "echo", "x", 0 };
    2366:	00003517          	auipc	a0,0x3
    236a:	b4250513          	addi	a0,a0,-1214 # 4ea8 <malloc+0x15e>
    236e:	faa43c23          	sd	a0,-72(s0)
    2372:	00003797          	auipc	a5,0x3
    2376:	ba678793          	addi	a5,a5,-1114 # 4f18 <malloc+0x1ce>
    237a:	fcf43023          	sd	a5,-64(s0)
    237e:	fc043423          	sd	zero,-56(s0)
      exec("echo", args);
    2382:	fb840593          	addi	a1,s0,-72
    2386:	00002097          	auipc	ra,0x2
    238a:	5b6080e7          	jalr	1462(ra) # 493c <exec>
      exit(0);
    238e:	4501                	li	a0,0
    2390:	00002097          	auipc	ra,0x2
    2394:	574080e7          	jalr	1396(ra) # 4904 <exit>

0000000000002398 <iputtest>:
{
    2398:	1101                	addi	sp,sp,-32
    239a:	ec06                	sd	ra,24(sp)
    239c:	e822                	sd	s0,16(sp)
    239e:	e426                	sd	s1,8(sp)
    23a0:	1000                	addi	s0,sp,32
    23a2:	84aa                	mv	s1,a0
  if(mkdir("iputdir") < 0){
    23a4:	00003517          	auipc	a0,0x3
    23a8:	78c50513          	addi	a0,a0,1932 # 5b30 <malloc+0xde6>
    23ac:	00002097          	auipc	ra,0x2
    23b0:	5a8080e7          	jalr	1448(ra) # 4954 <mkdir>
    23b4:	04054563          	bltz	a0,23fe <iputtest+0x66>
  if(chdir("iputdir") < 0){
    23b8:	00003517          	auipc	a0,0x3
    23bc:	77850513          	addi	a0,a0,1912 # 5b30 <malloc+0xde6>
    23c0:	00002097          	auipc	ra,0x2
    23c4:	59c080e7          	jalr	1436(ra) # 495c <chdir>
    23c8:	04054963          	bltz	a0,241a <iputtest+0x82>
  if(remove("../iputdir") < 0){
    23cc:	00003517          	auipc	a0,0x3
    23d0:	7a450513          	addi	a0,a0,1956 # 5b70 <malloc+0xe26>
    23d4:	00002097          	auipc	ra,0x2
    23d8:	5d8080e7          	jalr	1496(ra) # 49ac <remove>
    23dc:	04054d63          	bltz	a0,2436 <iputtest+0x9e>
  if(chdir("/") < 0){
    23e0:	00003517          	auipc	a0,0x3
    23e4:	7c050513          	addi	a0,a0,1984 # 5ba0 <malloc+0xe56>
    23e8:	00002097          	auipc	ra,0x2
    23ec:	574080e7          	jalr	1396(ra) # 495c <chdir>
    23f0:	06054163          	bltz	a0,2452 <iputtest+0xba>
}
    23f4:	60e2                	ld	ra,24(sp)
    23f6:	6442                	ld	s0,16(sp)
    23f8:	64a2                	ld	s1,8(sp)
    23fa:	6105                	addi	sp,sp,32
    23fc:	8082                	ret
    printf("%s: mkdir failed\n", s);
    23fe:	85a6                	mv	a1,s1
    2400:	00003517          	auipc	a0,0x3
    2404:	73850513          	addi	a0,a0,1848 # 5b38 <malloc+0xdee>
    2408:	00003097          	auipc	ra,0x3
    240c:	88a080e7          	jalr	-1910(ra) # 4c92 <printf>
    exit(1);
    2410:	4505                	li	a0,1
    2412:	00002097          	auipc	ra,0x2
    2416:	4f2080e7          	jalr	1266(ra) # 4904 <exit>
    printf("%s: chdir iputdir failed\n", s);
    241a:	85a6                	mv	a1,s1
    241c:	00003517          	auipc	a0,0x3
    2420:	73450513          	addi	a0,a0,1844 # 5b50 <malloc+0xe06>
    2424:	00003097          	auipc	ra,0x3
    2428:	86e080e7          	jalr	-1938(ra) # 4c92 <printf>
    exit(1);
    242c:	4505                	li	a0,1
    242e:	00002097          	auipc	ra,0x2
    2432:	4d6080e7          	jalr	1238(ra) # 4904 <exit>
    printf("%s: remove ../iputdir failed\n", s);
    2436:	85a6                	mv	a1,s1
    2438:	00003517          	auipc	a0,0x3
    243c:	74850513          	addi	a0,a0,1864 # 5b80 <malloc+0xe36>
    2440:	00003097          	auipc	ra,0x3
    2444:	852080e7          	jalr	-1966(ra) # 4c92 <printf>
    exit(1);
    2448:	4505                	li	a0,1
    244a:	00002097          	auipc	ra,0x2
    244e:	4ba080e7          	jalr	1210(ra) # 4904 <exit>
    printf("%s: chdir / failed\n", s);
    2452:	85a6                	mv	a1,s1
    2454:	00003517          	auipc	a0,0x3
    2458:	75450513          	addi	a0,a0,1876 # 5ba8 <malloc+0xe5e>
    245c:	00003097          	auipc	ra,0x3
    2460:	836080e7          	jalr	-1994(ra) # 4c92 <printf>
    exit(1);
    2464:	4505                	li	a0,1
    2466:	00002097          	auipc	ra,0x2
    246a:	49e080e7          	jalr	1182(ra) # 4904 <exit>

000000000000246e <exitiputtest>:
{
    246e:	7179                	addi	sp,sp,-48
    2470:	f406                	sd	ra,40(sp)
    2472:	f022                	sd	s0,32(sp)
    2474:	ec26                	sd	s1,24(sp)
    2476:	1800                	addi	s0,sp,48
    2478:	84aa                	mv	s1,a0
  pid = fork();
    247a:	00002097          	auipc	ra,0x2
    247e:	482080e7          	jalr	1154(ra) # 48fc <fork>
  if(pid < 0){
    2482:	04054663          	bltz	a0,24ce <exitiputtest+0x60>
  if(pid == 0){
    2486:	ed45                	bnez	a0,253e <exitiputtest+0xd0>
    if(mkdir("iputdir") < 0){
    2488:	00003517          	auipc	a0,0x3
    248c:	6a850513          	addi	a0,a0,1704 # 5b30 <malloc+0xde6>
    2490:	00002097          	auipc	ra,0x2
    2494:	4c4080e7          	jalr	1220(ra) # 4954 <mkdir>
    2498:	04054963          	bltz	a0,24ea <exitiputtest+0x7c>
    if(chdir("iputdir") < 0){
    249c:	00003517          	auipc	a0,0x3
    24a0:	69450513          	addi	a0,a0,1684 # 5b30 <malloc+0xde6>
    24a4:	00002097          	auipc	ra,0x2
    24a8:	4b8080e7          	jalr	1208(ra) # 495c <chdir>
    24ac:	04054d63          	bltz	a0,2506 <exitiputtest+0x98>
    if(remove("../iputdir") < 0){
    24b0:	00003517          	auipc	a0,0x3
    24b4:	6c050513          	addi	a0,a0,1728 # 5b70 <malloc+0xe26>
    24b8:	00002097          	auipc	ra,0x2
    24bc:	4f4080e7          	jalr	1268(ra) # 49ac <remove>
    24c0:	06054163          	bltz	a0,2522 <exitiputtest+0xb4>
    exit(0);
    24c4:	4501                	li	a0,0
    24c6:	00002097          	auipc	ra,0x2
    24ca:	43e080e7          	jalr	1086(ra) # 4904 <exit>
    printf("%s: fork failed\n", s);
    24ce:	85a6                	mv	a1,s1
    24d0:	00003517          	auipc	a0,0x3
    24d4:	06850513          	addi	a0,a0,104 # 5538 <malloc+0x7ee>
    24d8:	00002097          	auipc	ra,0x2
    24dc:	7ba080e7          	jalr	1978(ra) # 4c92 <printf>
    exit(1);
    24e0:	4505                	li	a0,1
    24e2:	00002097          	auipc	ra,0x2
    24e6:	422080e7          	jalr	1058(ra) # 4904 <exit>
      printf("%s: mkdir failed\n", s);
    24ea:	85a6                	mv	a1,s1
    24ec:	00003517          	auipc	a0,0x3
    24f0:	64c50513          	addi	a0,a0,1612 # 5b38 <malloc+0xdee>
    24f4:	00002097          	auipc	ra,0x2
    24f8:	79e080e7          	jalr	1950(ra) # 4c92 <printf>
      exit(1);
    24fc:	4505                	li	a0,1
    24fe:	00002097          	auipc	ra,0x2
    2502:	406080e7          	jalr	1030(ra) # 4904 <exit>
      printf("%s: child chdir failed\n", s);
    2506:	85a6                	mv	a1,s1
    2508:	00003517          	auipc	a0,0x3
    250c:	6b850513          	addi	a0,a0,1720 # 5bc0 <malloc+0xe76>
    2510:	00002097          	auipc	ra,0x2
    2514:	782080e7          	jalr	1922(ra) # 4c92 <printf>
      exit(1);
    2518:	4505                	li	a0,1
    251a:	00002097          	auipc	ra,0x2
    251e:	3ea080e7          	jalr	1002(ra) # 4904 <exit>
      printf("%s: remove ../iputdir failed\n", s);
    2522:	85a6                	mv	a1,s1
    2524:	00003517          	auipc	a0,0x3
    2528:	65c50513          	addi	a0,a0,1628 # 5b80 <malloc+0xe36>
    252c:	00002097          	auipc	ra,0x2
    2530:	766080e7          	jalr	1894(ra) # 4c92 <printf>
      exit(1);
    2534:	4505                	li	a0,1
    2536:	00002097          	auipc	ra,0x2
    253a:	3ce080e7          	jalr	974(ra) # 4904 <exit>
  wait(&xstatus);
    253e:	fdc40513          	addi	a0,s0,-36
    2542:	00002097          	auipc	ra,0x2
    2546:	3ca080e7          	jalr	970(ra) # 490c <wait>
  exit(xstatus);
    254a:	fdc42503          	lw	a0,-36(s0)
    254e:	00002097          	auipc	ra,0x2
    2552:	3b6080e7          	jalr	950(ra) # 4904 <exit>

0000000000002556 <subdir>:
{
    2556:	1101                	addi	sp,sp,-32
    2558:	ec06                	sd	ra,24(sp)
    255a:	e822                	sd	s0,16(sp)
    255c:	e426                	sd	s1,8(sp)
    255e:	e04a                	sd	s2,0(sp)
    2560:	1000                	addi	s0,sp,32
    2562:	892a                	mv	s2,a0
  remove("ff");
    2564:	00003517          	auipc	a0,0x3
    2568:	67450513          	addi	a0,a0,1652 # 5bd8 <malloc+0xe8e>
    256c:	00002097          	auipc	ra,0x2
    2570:	440080e7          	jalr	1088(ra) # 49ac <remove>
  if(mkdir("dd") != 0){
    2574:	00003517          	auipc	a0,0x3
    2578:	66c50513          	addi	a0,a0,1644 # 5be0 <malloc+0xe96>
    257c:	00002097          	auipc	ra,0x2
    2580:	3d8080e7          	jalr	984(ra) # 4954 <mkdir>
    2584:	24051363          	bnez	a0,27ca <subdir+0x274>
  fd = open("dd/ff", O_CREATE | O_RDWR);
    2588:	20200593          	li	a1,514
    258c:	00003517          	auipc	a0,0x3
    2590:	67450513          	addi	a0,a0,1652 # 5c00 <malloc+0xeb6>
    2594:	00002097          	auipc	ra,0x2
    2598:	3b0080e7          	jalr	944(ra) # 4944 <open>
    259c:	84aa                	mv	s1,a0
  if(fd < 0){
    259e:	24054463          	bltz	a0,27e6 <subdir+0x290>
  write(fd, "ff", 2);
    25a2:	4609                	li	a2,2
    25a4:	00003597          	auipc	a1,0x3
    25a8:	63458593          	addi	a1,a1,1588 # 5bd8 <malloc+0xe8e>
    25ac:	00002097          	auipc	ra,0x2
    25b0:	378080e7          	jalr	888(ra) # 4924 <write>
  close(fd);
    25b4:	8526                	mv	a0,s1
    25b6:	00002097          	auipc	ra,0x2
    25ba:	376080e7          	jalr	886(ra) # 492c <close>
  if(remove("dd") >= 0){
    25be:	00003517          	auipc	a0,0x3
    25c2:	62250513          	addi	a0,a0,1570 # 5be0 <malloc+0xe96>
    25c6:	00002097          	auipc	ra,0x2
    25ca:	3e6080e7          	jalr	998(ra) # 49ac <remove>
    25ce:	22055a63          	bgez	a0,2802 <subdir+0x2ac>
  if(mkdir("/dd/dd") != 0){
    25d2:	00003517          	auipc	a0,0x3
    25d6:	68650513          	addi	a0,a0,1670 # 5c58 <malloc+0xf0e>
    25da:	00002097          	auipc	ra,0x2
    25de:	37a080e7          	jalr	890(ra) # 4954 <mkdir>
    25e2:	22051e63          	bnez	a0,281e <subdir+0x2c8>
  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    25e6:	20200593          	li	a1,514
    25ea:	00003517          	auipc	a0,0x3
    25ee:	69650513          	addi	a0,a0,1686 # 5c80 <malloc+0xf36>
    25f2:	00002097          	auipc	ra,0x2
    25f6:	352080e7          	jalr	850(ra) # 4944 <open>
    25fa:	84aa                	mv	s1,a0
  if(fd < 0){
    25fc:	22054f63          	bltz	a0,283a <subdir+0x2e4>
  write(fd, "FF", 2);
    2600:	4609                	li	a2,2
    2602:	00003597          	auipc	a1,0x3
    2606:	6ae58593          	addi	a1,a1,1710 # 5cb0 <malloc+0xf66>
    260a:	00002097          	auipc	ra,0x2
    260e:	31a080e7          	jalr	794(ra) # 4924 <write>
  close(fd);
    2612:	8526                	mv	a0,s1
    2614:	00002097          	auipc	ra,0x2
    2618:	318080e7          	jalr	792(ra) # 492c <close>
  fd = open("dd/dd/../ff", 0);
    261c:	4581                	li	a1,0
    261e:	00003517          	auipc	a0,0x3
    2622:	69a50513          	addi	a0,a0,1690 # 5cb8 <malloc+0xf6e>
    2626:	00002097          	auipc	ra,0x2
    262a:	31e080e7          	jalr	798(ra) # 4944 <open>
    262e:	84aa                	mv	s1,a0
  if(fd < 0){
    2630:	22054363          	bltz	a0,2856 <subdir+0x300>
  cc = read(fd, buf, sizeof(buf));
    2634:	6609                	lui	a2,0x2
    2636:	80060613          	addi	a2,a2,-2048 # 1800 <forkfork+0x42>
    263a:	00008597          	auipc	a1,0x8
    263e:	22658593          	addi	a1,a1,550 # a860 <buf>
    2642:	00002097          	auipc	ra,0x2
    2646:	2da080e7          	jalr	730(ra) # 491c <read>
  if(cc != 2 || buf[0] != 'f'){
    264a:	4789                	li	a5,2
    264c:	22f51363          	bne	a0,a5,2872 <subdir+0x31c>
    2650:	00008717          	auipc	a4,0x8
    2654:	21074703          	lbu	a4,528(a4) # a860 <buf>
    2658:	06600793          	li	a5,102
    265c:	20f71b63          	bne	a4,a5,2872 <subdir+0x31c>
  close(fd);
    2660:	8526                	mv	a0,s1
    2662:	00002097          	auipc	ra,0x2
    2666:	2ca080e7          	jalr	714(ra) # 492c <close>
  if(remove("dd/dd/ff") != 0){
    266a:	00003517          	auipc	a0,0x3
    266e:	61650513          	addi	a0,a0,1558 # 5c80 <malloc+0xf36>
    2672:	00002097          	auipc	ra,0x2
    2676:	33a080e7          	jalr	826(ra) # 49ac <remove>
    267a:	20051a63          	bnez	a0,288e <subdir+0x338>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    267e:	4581                	li	a1,0
    2680:	00003517          	auipc	a0,0x3
    2684:	60050513          	addi	a0,a0,1536 # 5c80 <malloc+0xf36>
    2688:	00002097          	auipc	ra,0x2
    268c:	2bc080e7          	jalr	700(ra) # 4944 <open>
    2690:	20055d63          	bgez	a0,28aa <subdir+0x354>
  if(chdir("dd") != 0){
    2694:	00003517          	auipc	a0,0x3
    2698:	54c50513          	addi	a0,a0,1356 # 5be0 <malloc+0xe96>
    269c:	00002097          	auipc	ra,0x2
    26a0:	2c0080e7          	jalr	704(ra) # 495c <chdir>
    26a4:	22051163          	bnez	a0,28c6 <subdir+0x370>
  if(chdir("dd/../../dd") != 0){
    26a8:	00003517          	auipc	a0,0x3
    26ac:	6c050513          	addi	a0,a0,1728 # 5d68 <malloc+0x101e>
    26b0:	00002097          	auipc	ra,0x2
    26b4:	2ac080e7          	jalr	684(ra) # 495c <chdir>
    26b8:	22051563          	bnez	a0,28e2 <subdir+0x38c>
  if(chdir("dd/../../../dd") != 0){
    26bc:	00003517          	auipc	a0,0x3
    26c0:	6dc50513          	addi	a0,a0,1756 # 5d98 <malloc+0x104e>
    26c4:	00002097          	auipc	ra,0x2
    26c8:	298080e7          	jalr	664(ra) # 495c <chdir>
    26cc:	22051963          	bnez	a0,28fe <subdir+0x3a8>
  if(chdir("./..") != 0){
    26d0:	00003517          	auipc	a0,0x3
    26d4:	6f850513          	addi	a0,a0,1784 # 5dc8 <malloc+0x107e>
    26d8:	00002097          	auipc	ra,0x2
    26dc:	284080e7          	jalr	644(ra) # 495c <chdir>
    26e0:	22051d63          	bnez	a0,291a <subdir+0x3c4>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    26e4:	4581                	li	a1,0
    26e6:	00003517          	auipc	a0,0x3
    26ea:	59a50513          	addi	a0,a0,1434 # 5c80 <malloc+0xf36>
    26ee:	00002097          	auipc	ra,0x2
    26f2:	256080e7          	jalr	598(ra) # 4944 <open>
    26f6:	24055063          	bgez	a0,2936 <subdir+0x3e0>
  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    26fa:	20200593          	li	a1,514
    26fe:	00003517          	auipc	a0,0x3
    2702:	71a50513          	addi	a0,a0,1818 # 5e18 <malloc+0x10ce>
    2706:	00002097          	auipc	ra,0x2
    270a:	23e080e7          	jalr	574(ra) # 4944 <open>
    270e:	24055263          	bgez	a0,2952 <subdir+0x3fc>
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    2712:	20200593          	li	a1,514
    2716:	00003517          	auipc	a0,0x3
    271a:	73250513          	addi	a0,a0,1842 # 5e48 <malloc+0x10fe>
    271e:	00002097          	auipc	ra,0x2
    2722:	226080e7          	jalr	550(ra) # 4944 <open>
    2726:	24055463          	bgez	a0,296e <subdir+0x418>
  if(open("dd", O_CREATE) >= 0){
    272a:	20000593          	li	a1,512
    272e:	00003517          	auipc	a0,0x3
    2732:	4b250513          	addi	a0,a0,1202 # 5be0 <malloc+0xe96>
    2736:	00002097          	auipc	ra,0x2
    273a:	20e080e7          	jalr	526(ra) # 4944 <open>
    273e:	24055663          	bgez	a0,298a <subdir+0x434>
  if(open("dd", O_RDWR) >= 0){
    2742:	4589                	li	a1,2
    2744:	00003517          	auipc	a0,0x3
    2748:	49c50513          	addi	a0,a0,1180 # 5be0 <malloc+0xe96>
    274c:	00002097          	auipc	ra,0x2
    2750:	1f8080e7          	jalr	504(ra) # 4944 <open>
    2754:	24055963          	bgez	a0,29a6 <subdir+0x450>
  if(open("dd", O_WRONLY) >= 0){
    2758:	4585                	li	a1,1
    275a:	00003517          	auipc	a0,0x3
    275e:	48650513          	addi	a0,a0,1158 # 5be0 <malloc+0xe96>
    2762:	00002097          	auipc	ra,0x2
    2766:	1e2080e7          	jalr	482(ra) # 4944 <open>
    276a:	24055c63          	bgez	a0,29c2 <subdir+0x46c>
  if(remove("dd/ff") != 0){
    276e:	00003517          	auipc	a0,0x3
    2772:	49250513          	addi	a0,a0,1170 # 5c00 <malloc+0xeb6>
    2776:	00002097          	auipc	ra,0x2
    277a:	236080e7          	jalr	566(ra) # 49ac <remove>
    277e:	26051063          	bnez	a0,29de <subdir+0x488>
  if(remove("dd") == 0){
    2782:	00003517          	auipc	a0,0x3
    2786:	45e50513          	addi	a0,a0,1118 # 5be0 <malloc+0xe96>
    278a:	00002097          	auipc	ra,0x2
    278e:	222080e7          	jalr	546(ra) # 49ac <remove>
    2792:	26050463          	beqz	a0,29fa <subdir+0x4a4>
  if(remove("dd/dd") < 0){
    2796:	00003517          	auipc	a0,0x3
    279a:	78a50513          	addi	a0,a0,1930 # 5f20 <malloc+0x11d6>
    279e:	00002097          	auipc	ra,0x2
    27a2:	20e080e7          	jalr	526(ra) # 49ac <remove>
    27a6:	26054863          	bltz	a0,2a16 <subdir+0x4c0>
  if(remove("dd") < 0){
    27aa:	00003517          	auipc	a0,0x3
    27ae:	43650513          	addi	a0,a0,1078 # 5be0 <malloc+0xe96>
    27b2:	00002097          	auipc	ra,0x2
    27b6:	1fa080e7          	jalr	506(ra) # 49ac <remove>
    27ba:	26054c63          	bltz	a0,2a32 <subdir+0x4dc>
}
    27be:	60e2                	ld	ra,24(sp)
    27c0:	6442                	ld	s0,16(sp)
    27c2:	64a2                	ld	s1,8(sp)
    27c4:	6902                	ld	s2,0(sp)
    27c6:	6105                	addi	sp,sp,32
    27c8:	8082                	ret
    printf("%s: mkdir dd failed\n", s);
    27ca:	85ca                	mv	a1,s2
    27cc:	00003517          	auipc	a0,0x3
    27d0:	41c50513          	addi	a0,a0,1052 # 5be8 <malloc+0xe9e>
    27d4:	00002097          	auipc	ra,0x2
    27d8:	4be080e7          	jalr	1214(ra) # 4c92 <printf>
    exit(1);
    27dc:	4505                	li	a0,1
    27de:	00002097          	auipc	ra,0x2
    27e2:	126080e7          	jalr	294(ra) # 4904 <exit>
    printf("%s: create dd/ff failed\n", s);
    27e6:	85ca                	mv	a1,s2
    27e8:	00003517          	auipc	a0,0x3
    27ec:	42050513          	addi	a0,a0,1056 # 5c08 <malloc+0xebe>
    27f0:	00002097          	auipc	ra,0x2
    27f4:	4a2080e7          	jalr	1186(ra) # 4c92 <printf>
    exit(1);
    27f8:	4505                	li	a0,1
    27fa:	00002097          	auipc	ra,0x2
    27fe:	10a080e7          	jalr	266(ra) # 4904 <exit>
    printf("%s: remove dd (non-empty dir) succeeded!\n", s);
    2802:	85ca                	mv	a1,s2
    2804:	00003517          	auipc	a0,0x3
    2808:	42450513          	addi	a0,a0,1060 # 5c28 <malloc+0xede>
    280c:	00002097          	auipc	ra,0x2
    2810:	486080e7          	jalr	1158(ra) # 4c92 <printf>
    exit(1);
    2814:	4505                	li	a0,1
    2816:	00002097          	auipc	ra,0x2
    281a:	0ee080e7          	jalr	238(ra) # 4904 <exit>
    printf("subdir mkdir dd/dd failed\n", s);
    281e:	85ca                	mv	a1,s2
    2820:	00003517          	auipc	a0,0x3
    2824:	44050513          	addi	a0,a0,1088 # 5c60 <malloc+0xf16>
    2828:	00002097          	auipc	ra,0x2
    282c:	46a080e7          	jalr	1130(ra) # 4c92 <printf>
    exit(1);
    2830:	4505                	li	a0,1
    2832:	00002097          	auipc	ra,0x2
    2836:	0d2080e7          	jalr	210(ra) # 4904 <exit>
    printf("%s: create dd/dd/ff failed\n", s);
    283a:	85ca                	mv	a1,s2
    283c:	00003517          	auipc	a0,0x3
    2840:	45450513          	addi	a0,a0,1108 # 5c90 <malloc+0xf46>
    2844:	00002097          	auipc	ra,0x2
    2848:	44e080e7          	jalr	1102(ra) # 4c92 <printf>
    exit(1);
    284c:	4505                	li	a0,1
    284e:	00002097          	auipc	ra,0x2
    2852:	0b6080e7          	jalr	182(ra) # 4904 <exit>
    printf("%s: open dd/dd/../ff failed\n", s);
    2856:	85ca                	mv	a1,s2
    2858:	00003517          	auipc	a0,0x3
    285c:	47050513          	addi	a0,a0,1136 # 5cc8 <malloc+0xf7e>
    2860:	00002097          	auipc	ra,0x2
    2864:	432080e7          	jalr	1074(ra) # 4c92 <printf>
    exit(1);
    2868:	4505                	li	a0,1
    286a:	00002097          	auipc	ra,0x2
    286e:	09a080e7          	jalr	154(ra) # 4904 <exit>
    printf("%s: dd/dd/../ff wrong content\n", s);
    2872:	85ca                	mv	a1,s2
    2874:	00003517          	auipc	a0,0x3
    2878:	47450513          	addi	a0,a0,1140 # 5ce8 <malloc+0xf9e>
    287c:	00002097          	auipc	ra,0x2
    2880:	416080e7          	jalr	1046(ra) # 4c92 <printf>
    exit(1);
    2884:	4505                	li	a0,1
    2886:	00002097          	auipc	ra,0x2
    288a:	07e080e7          	jalr	126(ra) # 4904 <exit>
    printf("%s: remove dd/dd/ff failed\n", s);
    288e:	85ca                	mv	a1,s2
    2890:	00003517          	auipc	a0,0x3
    2894:	47850513          	addi	a0,a0,1144 # 5d08 <malloc+0xfbe>
    2898:	00002097          	auipc	ra,0x2
    289c:	3fa080e7          	jalr	1018(ra) # 4c92 <printf>
    exit(1);
    28a0:	4505                	li	a0,1
    28a2:	00002097          	auipc	ra,0x2
    28a6:	062080e7          	jalr	98(ra) # 4904 <exit>
    printf("%s: open (removeed) dd/dd/ff succeeded\n", s);
    28aa:	85ca                	mv	a1,s2
    28ac:	00003517          	auipc	a0,0x3
    28b0:	47c50513          	addi	a0,a0,1148 # 5d28 <malloc+0xfde>
    28b4:	00002097          	auipc	ra,0x2
    28b8:	3de080e7          	jalr	990(ra) # 4c92 <printf>
    exit(1);
    28bc:	4505                	li	a0,1
    28be:	00002097          	auipc	ra,0x2
    28c2:	046080e7          	jalr	70(ra) # 4904 <exit>
    printf("%s: chdir dd failed\n", s);
    28c6:	85ca                	mv	a1,s2
    28c8:	00003517          	auipc	a0,0x3
    28cc:	48850513          	addi	a0,a0,1160 # 5d50 <malloc+0x1006>
    28d0:	00002097          	auipc	ra,0x2
    28d4:	3c2080e7          	jalr	962(ra) # 4c92 <printf>
    exit(1);
    28d8:	4505                	li	a0,1
    28da:	00002097          	auipc	ra,0x2
    28de:	02a080e7          	jalr	42(ra) # 4904 <exit>
    printf("%s: chdir dd/../../dd failed\n", s);
    28e2:	85ca                	mv	a1,s2
    28e4:	00003517          	auipc	a0,0x3
    28e8:	49450513          	addi	a0,a0,1172 # 5d78 <malloc+0x102e>
    28ec:	00002097          	auipc	ra,0x2
    28f0:	3a6080e7          	jalr	934(ra) # 4c92 <printf>
    exit(1);
    28f4:	4505                	li	a0,1
    28f6:	00002097          	auipc	ra,0x2
    28fa:	00e080e7          	jalr	14(ra) # 4904 <exit>
    printf("chdir dd/../../dd failed\n", s);
    28fe:	85ca                	mv	a1,s2
    2900:	00003517          	auipc	a0,0x3
    2904:	4a850513          	addi	a0,a0,1192 # 5da8 <malloc+0x105e>
    2908:	00002097          	auipc	ra,0x2
    290c:	38a080e7          	jalr	906(ra) # 4c92 <printf>
    exit(1);
    2910:	4505                	li	a0,1
    2912:	00002097          	auipc	ra,0x2
    2916:	ff2080e7          	jalr	-14(ra) # 4904 <exit>
    printf("%s: chdir ./.. failed\n", s);
    291a:	85ca                	mv	a1,s2
    291c:	00003517          	auipc	a0,0x3
    2920:	4b450513          	addi	a0,a0,1204 # 5dd0 <malloc+0x1086>
    2924:	00002097          	auipc	ra,0x2
    2928:	36e080e7          	jalr	878(ra) # 4c92 <printf>
    exit(1);
    292c:	4505                	li	a0,1
    292e:	00002097          	auipc	ra,0x2
    2932:	fd6080e7          	jalr	-42(ra) # 4904 <exit>
    printf("%s: open (removeed) dd/dd/ff succeeded!\n", s);
    2936:	85ca                	mv	a1,s2
    2938:	00003517          	auipc	a0,0x3
    293c:	4b050513          	addi	a0,a0,1200 # 5de8 <malloc+0x109e>
    2940:	00002097          	auipc	ra,0x2
    2944:	352080e7          	jalr	850(ra) # 4c92 <printf>
    exit(1);
    2948:	4505                	li	a0,1
    294a:	00002097          	auipc	ra,0x2
    294e:	fba080e7          	jalr	-70(ra) # 4904 <exit>
    printf("%s: create dd/ff/ff succeeded!\n", s);
    2952:	85ca                	mv	a1,s2
    2954:	00003517          	auipc	a0,0x3
    2958:	4d450513          	addi	a0,a0,1236 # 5e28 <malloc+0x10de>
    295c:	00002097          	auipc	ra,0x2
    2960:	336080e7          	jalr	822(ra) # 4c92 <printf>
    exit(1);
    2964:	4505                	li	a0,1
    2966:	00002097          	auipc	ra,0x2
    296a:	f9e080e7          	jalr	-98(ra) # 4904 <exit>
    printf("%s: create dd/xx/ff succeeded!\n", s);
    296e:	85ca                	mv	a1,s2
    2970:	00003517          	auipc	a0,0x3
    2974:	4e850513          	addi	a0,a0,1256 # 5e58 <malloc+0x110e>
    2978:	00002097          	auipc	ra,0x2
    297c:	31a080e7          	jalr	794(ra) # 4c92 <printf>
    exit(1);
    2980:	4505                	li	a0,1
    2982:	00002097          	auipc	ra,0x2
    2986:	f82080e7          	jalr	-126(ra) # 4904 <exit>
    printf("%s: create dd succeeded!\n", s);
    298a:	85ca                	mv	a1,s2
    298c:	00003517          	auipc	a0,0x3
    2990:	4ec50513          	addi	a0,a0,1260 # 5e78 <malloc+0x112e>
    2994:	00002097          	auipc	ra,0x2
    2998:	2fe080e7          	jalr	766(ra) # 4c92 <printf>
    exit(1);
    299c:	4505                	li	a0,1
    299e:	00002097          	auipc	ra,0x2
    29a2:	f66080e7          	jalr	-154(ra) # 4904 <exit>
    printf("%s: open dd rdwr succeeded!\n", s);
    29a6:	85ca                	mv	a1,s2
    29a8:	00003517          	auipc	a0,0x3
    29ac:	4f050513          	addi	a0,a0,1264 # 5e98 <malloc+0x114e>
    29b0:	00002097          	auipc	ra,0x2
    29b4:	2e2080e7          	jalr	738(ra) # 4c92 <printf>
    exit(1);
    29b8:	4505                	li	a0,1
    29ba:	00002097          	auipc	ra,0x2
    29be:	f4a080e7          	jalr	-182(ra) # 4904 <exit>
    printf("%s: open dd wronly succeeded!\n", s);
    29c2:	85ca                	mv	a1,s2
    29c4:	00003517          	auipc	a0,0x3
    29c8:	4f450513          	addi	a0,a0,1268 # 5eb8 <malloc+0x116e>
    29cc:	00002097          	auipc	ra,0x2
    29d0:	2c6080e7          	jalr	710(ra) # 4c92 <printf>
    exit(1);
    29d4:	4505                	li	a0,1
    29d6:	00002097          	auipc	ra,0x2
    29da:	f2e080e7          	jalr	-210(ra) # 4904 <exit>
    printf("%s: remove dd/ff failed\n", s);
    29de:	85ca                	mv	a1,s2
    29e0:	00003517          	auipc	a0,0x3
    29e4:	4f850513          	addi	a0,a0,1272 # 5ed8 <malloc+0x118e>
    29e8:	00002097          	auipc	ra,0x2
    29ec:	2aa080e7          	jalr	682(ra) # 4c92 <printf>
    exit(1);
    29f0:	4505                	li	a0,1
    29f2:	00002097          	auipc	ra,0x2
    29f6:	f12080e7          	jalr	-238(ra) # 4904 <exit>
    printf("%s: remove non-empty dd succeeded!\n", s);
    29fa:	85ca                	mv	a1,s2
    29fc:	00003517          	auipc	a0,0x3
    2a00:	4fc50513          	addi	a0,a0,1276 # 5ef8 <malloc+0x11ae>
    2a04:	00002097          	auipc	ra,0x2
    2a08:	28e080e7          	jalr	654(ra) # 4c92 <printf>
    exit(1);
    2a0c:	4505                	li	a0,1
    2a0e:	00002097          	auipc	ra,0x2
    2a12:	ef6080e7          	jalr	-266(ra) # 4904 <exit>
    printf("%s: remove dd/dd failed\n", s);
    2a16:	85ca                	mv	a1,s2
    2a18:	00003517          	auipc	a0,0x3
    2a1c:	51050513          	addi	a0,a0,1296 # 5f28 <malloc+0x11de>
    2a20:	00002097          	auipc	ra,0x2
    2a24:	272080e7          	jalr	626(ra) # 4c92 <printf>
    exit(1);
    2a28:	4505                	li	a0,1
    2a2a:	00002097          	auipc	ra,0x2
    2a2e:	eda080e7          	jalr	-294(ra) # 4904 <exit>
    printf("%s: remove dd failed\n", s);
    2a32:	85ca                	mv	a1,s2
    2a34:	00003517          	auipc	a0,0x3
    2a38:	51450513          	addi	a0,a0,1300 # 5f48 <malloc+0x11fe>
    2a3c:	00002097          	auipc	ra,0x2
    2a40:	256080e7          	jalr	598(ra) # 4c92 <printf>
    exit(1);
    2a44:	4505                	li	a0,1
    2a46:	00002097          	auipc	ra,0x2
    2a4a:	ebe080e7          	jalr	-322(ra) # 4904 <exit>

0000000000002a4e <rmdot>:
{
    2a4e:	1101                	addi	sp,sp,-32
    2a50:	ec06                	sd	ra,24(sp)
    2a52:	e822                	sd	s0,16(sp)
    2a54:	e426                	sd	s1,8(sp)
    2a56:	1000                	addi	s0,sp,32
    2a58:	84aa                	mv	s1,a0
  if(mkdir("dots") != 0){
    2a5a:	00003517          	auipc	a0,0x3
    2a5e:	50650513          	addi	a0,a0,1286 # 5f60 <malloc+0x1216>
    2a62:	00002097          	auipc	ra,0x2
    2a66:	ef2080e7          	jalr	-270(ra) # 4954 <mkdir>
    2a6a:	e549                	bnez	a0,2af4 <rmdot+0xa6>
  if(chdir("dots") != 0){
    2a6c:	00003517          	auipc	a0,0x3
    2a70:	4f450513          	addi	a0,a0,1268 # 5f60 <malloc+0x1216>
    2a74:	00002097          	auipc	ra,0x2
    2a78:	ee8080e7          	jalr	-280(ra) # 495c <chdir>
    2a7c:	e951                	bnez	a0,2b10 <rmdot+0xc2>
  if(remove(".") == 0){
    2a7e:	00003517          	auipc	a0,0x3
    2a82:	51a50513          	addi	a0,a0,1306 # 5f98 <malloc+0x124e>
    2a86:	00002097          	auipc	ra,0x2
    2a8a:	f26080e7          	jalr	-218(ra) # 49ac <remove>
    2a8e:	cd59                	beqz	a0,2b2c <rmdot+0xde>
  if(remove("..") == 0){
    2a90:	00003517          	auipc	a0,0x3
    2a94:	52850513          	addi	a0,a0,1320 # 5fb8 <malloc+0x126e>
    2a98:	00002097          	auipc	ra,0x2
    2a9c:	f14080e7          	jalr	-236(ra) # 49ac <remove>
    2aa0:	c545                	beqz	a0,2b48 <rmdot+0xfa>
  if(chdir("/") != 0){
    2aa2:	00003517          	auipc	a0,0x3
    2aa6:	0fe50513          	addi	a0,a0,254 # 5ba0 <malloc+0xe56>
    2aaa:	00002097          	auipc	ra,0x2
    2aae:	eb2080e7          	jalr	-334(ra) # 495c <chdir>
    2ab2:	e94d                	bnez	a0,2b64 <rmdot+0x116>
  if(remove("dots/.") == 0){
    2ab4:	00003517          	auipc	a0,0x3
    2ab8:	52450513          	addi	a0,a0,1316 # 5fd8 <malloc+0x128e>
    2abc:	00002097          	auipc	ra,0x2
    2ac0:	ef0080e7          	jalr	-272(ra) # 49ac <remove>
    2ac4:	cd55                	beqz	a0,2b80 <rmdot+0x132>
  if(remove("dots/..") == 0){
    2ac6:	00003517          	auipc	a0,0x3
    2aca:	53a50513          	addi	a0,a0,1338 # 6000 <malloc+0x12b6>
    2ace:	00002097          	auipc	ra,0x2
    2ad2:	ede080e7          	jalr	-290(ra) # 49ac <remove>
    2ad6:	c179                	beqz	a0,2b9c <rmdot+0x14e>
  if(remove("dots") != 0){
    2ad8:	00003517          	auipc	a0,0x3
    2adc:	48850513          	addi	a0,a0,1160 # 5f60 <malloc+0x1216>
    2ae0:	00002097          	auipc	ra,0x2
    2ae4:	ecc080e7          	jalr	-308(ra) # 49ac <remove>
    2ae8:	e961                	bnez	a0,2bb8 <rmdot+0x16a>
}
    2aea:	60e2                	ld	ra,24(sp)
    2aec:	6442                	ld	s0,16(sp)
    2aee:	64a2                	ld	s1,8(sp)
    2af0:	6105                	addi	sp,sp,32
    2af2:	8082                	ret
    printf("%s: mkdir dots failed\n", s);
    2af4:	85a6                	mv	a1,s1
    2af6:	00003517          	auipc	a0,0x3
    2afa:	47250513          	addi	a0,a0,1138 # 5f68 <malloc+0x121e>
    2afe:	00002097          	auipc	ra,0x2
    2b02:	194080e7          	jalr	404(ra) # 4c92 <printf>
    exit(1);
    2b06:	4505                	li	a0,1
    2b08:	00002097          	auipc	ra,0x2
    2b0c:	dfc080e7          	jalr	-516(ra) # 4904 <exit>
    printf("%s: chdir dots failed\n", s);
    2b10:	85a6                	mv	a1,s1
    2b12:	00003517          	auipc	a0,0x3
    2b16:	46e50513          	addi	a0,a0,1134 # 5f80 <malloc+0x1236>
    2b1a:	00002097          	auipc	ra,0x2
    2b1e:	178080e7          	jalr	376(ra) # 4c92 <printf>
    exit(1);
    2b22:	4505                	li	a0,1
    2b24:	00002097          	auipc	ra,0x2
    2b28:	de0080e7          	jalr	-544(ra) # 4904 <exit>
    printf("%s: rm . worked!\n", s);
    2b2c:	85a6                	mv	a1,s1
    2b2e:	00003517          	auipc	a0,0x3
    2b32:	47250513          	addi	a0,a0,1138 # 5fa0 <malloc+0x1256>
    2b36:	00002097          	auipc	ra,0x2
    2b3a:	15c080e7          	jalr	348(ra) # 4c92 <printf>
    exit(1);
    2b3e:	4505                	li	a0,1
    2b40:	00002097          	auipc	ra,0x2
    2b44:	dc4080e7          	jalr	-572(ra) # 4904 <exit>
    printf("%s: rm .. worked!\n", s);
    2b48:	85a6                	mv	a1,s1
    2b4a:	00003517          	auipc	a0,0x3
    2b4e:	47650513          	addi	a0,a0,1142 # 5fc0 <malloc+0x1276>
    2b52:	00002097          	auipc	ra,0x2
    2b56:	140080e7          	jalr	320(ra) # 4c92 <printf>
    exit(1);
    2b5a:	4505                	li	a0,1
    2b5c:	00002097          	auipc	ra,0x2
    2b60:	da8080e7          	jalr	-600(ra) # 4904 <exit>
    printf("%s: chdir / failed\n", s);
    2b64:	85a6                	mv	a1,s1
    2b66:	00003517          	auipc	a0,0x3
    2b6a:	04250513          	addi	a0,a0,66 # 5ba8 <malloc+0xe5e>
    2b6e:	00002097          	auipc	ra,0x2
    2b72:	124080e7          	jalr	292(ra) # 4c92 <printf>
    exit(1);
    2b76:	4505                	li	a0,1
    2b78:	00002097          	auipc	ra,0x2
    2b7c:	d8c080e7          	jalr	-628(ra) # 4904 <exit>
    printf("%s: remove dots/. worked!\n", s);
    2b80:	85a6                	mv	a1,s1
    2b82:	00003517          	auipc	a0,0x3
    2b86:	45e50513          	addi	a0,a0,1118 # 5fe0 <malloc+0x1296>
    2b8a:	00002097          	auipc	ra,0x2
    2b8e:	108080e7          	jalr	264(ra) # 4c92 <printf>
    exit(1);
    2b92:	4505                	li	a0,1
    2b94:	00002097          	auipc	ra,0x2
    2b98:	d70080e7          	jalr	-656(ra) # 4904 <exit>
    printf("%s: remove dots/.. worked!\n", s);
    2b9c:	85a6                	mv	a1,s1
    2b9e:	00003517          	auipc	a0,0x3
    2ba2:	46a50513          	addi	a0,a0,1130 # 6008 <malloc+0x12be>
    2ba6:	00002097          	auipc	ra,0x2
    2baa:	0ec080e7          	jalr	236(ra) # 4c92 <printf>
    exit(1);
    2bae:	4505                	li	a0,1
    2bb0:	00002097          	auipc	ra,0x2
    2bb4:	d54080e7          	jalr	-684(ra) # 4904 <exit>
    printf("%s: remove dots failed!\n", s);
    2bb8:	85a6                	mv	a1,s1
    2bba:	00003517          	auipc	a0,0x3
    2bbe:	46e50513          	addi	a0,a0,1134 # 6028 <malloc+0x12de>
    2bc2:	00002097          	auipc	ra,0x2
    2bc6:	0d0080e7          	jalr	208(ra) # 4c92 <printf>
    exit(1);
    2bca:	4505                	li	a0,1
    2bcc:	00002097          	auipc	ra,0x2
    2bd0:	d38080e7          	jalr	-712(ra) # 4904 <exit>

0000000000002bd4 <dirfile>:
{
    2bd4:	1101                	addi	sp,sp,-32
    2bd6:	ec06                	sd	ra,24(sp)
    2bd8:	e822                	sd	s0,16(sp)
    2bda:	e426                	sd	s1,8(sp)
    2bdc:	e04a                	sd	s2,0(sp)
    2bde:	1000                	addi	s0,sp,32
    2be0:	892a                	mv	s2,a0
  fd = open("dirfile", O_CREATE);
    2be2:	20000593          	li	a1,512
    2be6:	00003517          	auipc	a0,0x3
    2bea:	46250513          	addi	a0,a0,1122 # 6048 <malloc+0x12fe>
    2bee:	00002097          	auipc	ra,0x2
    2bf2:	d56080e7          	jalr	-682(ra) # 4944 <open>
  if(fd < 0){
    2bf6:	0c054d63          	bltz	a0,2cd0 <dirfile+0xfc>
  close(fd);
    2bfa:	00002097          	auipc	ra,0x2
    2bfe:	d32080e7          	jalr	-718(ra) # 492c <close>
  if(chdir("dirfile") == 0){
    2c02:	00003517          	auipc	a0,0x3
    2c06:	44650513          	addi	a0,a0,1094 # 6048 <malloc+0x12fe>
    2c0a:	00002097          	auipc	ra,0x2
    2c0e:	d52080e7          	jalr	-686(ra) # 495c <chdir>
    2c12:	cd69                	beqz	a0,2cec <dirfile+0x118>
  fd = open("dirfile/xx", 0);
    2c14:	4581                	li	a1,0
    2c16:	00003517          	auipc	a0,0x3
    2c1a:	47a50513          	addi	a0,a0,1146 # 6090 <malloc+0x1346>
    2c1e:	00002097          	auipc	ra,0x2
    2c22:	d26080e7          	jalr	-730(ra) # 4944 <open>
  if(fd >= 0){
    2c26:	0e055163          	bgez	a0,2d08 <dirfile+0x134>
  fd = open("dirfile/xx", O_CREATE);
    2c2a:	20000593          	li	a1,512
    2c2e:	00003517          	auipc	a0,0x3
    2c32:	46250513          	addi	a0,a0,1122 # 6090 <malloc+0x1346>
    2c36:	00002097          	auipc	ra,0x2
    2c3a:	d0e080e7          	jalr	-754(ra) # 4944 <open>
  if(fd >= 0){
    2c3e:	0e055363          	bgez	a0,2d24 <dirfile+0x150>
  if(mkdir("dirfile/xx") == 0){
    2c42:	00003517          	auipc	a0,0x3
    2c46:	44e50513          	addi	a0,a0,1102 # 6090 <malloc+0x1346>
    2c4a:	00002097          	auipc	ra,0x2
    2c4e:	d0a080e7          	jalr	-758(ra) # 4954 <mkdir>
    2c52:	c57d                	beqz	a0,2d40 <dirfile+0x16c>
  if(remove("dirfile/xx") == 0){
    2c54:	00003517          	auipc	a0,0x3
    2c58:	43c50513          	addi	a0,a0,1084 # 6090 <malloc+0x1346>
    2c5c:	00002097          	auipc	ra,0x2
    2c60:	d50080e7          	jalr	-688(ra) # 49ac <remove>
    2c64:	cd65                	beqz	a0,2d5c <dirfile+0x188>
  if(remove("dirfile") != 0){
    2c66:	00003517          	auipc	a0,0x3
    2c6a:	3e250513          	addi	a0,a0,994 # 6048 <malloc+0x12fe>
    2c6e:	00002097          	auipc	ra,0x2
    2c72:	d3e080e7          	jalr	-706(ra) # 49ac <remove>
    2c76:	10051163          	bnez	a0,2d78 <dirfile+0x1a4>
  fd = open(".", O_RDWR);
    2c7a:	4589                	li	a1,2
    2c7c:	00003517          	auipc	a0,0x3
    2c80:	31c50513          	addi	a0,a0,796 # 5f98 <malloc+0x124e>
    2c84:	00002097          	auipc	ra,0x2
    2c88:	cc0080e7          	jalr	-832(ra) # 4944 <open>
  if(fd >= 0){
    2c8c:	10055463          	bgez	a0,2d94 <dirfile+0x1c0>
  fd = open(".", 0);
    2c90:	4581                	li	a1,0
    2c92:	00003517          	auipc	a0,0x3
    2c96:	30650513          	addi	a0,a0,774 # 5f98 <malloc+0x124e>
    2c9a:	00002097          	auipc	ra,0x2
    2c9e:	caa080e7          	jalr	-854(ra) # 4944 <open>
    2ca2:	84aa                	mv	s1,a0
  if(write(fd, "x", 1) > 0){
    2ca4:	4605                	li	a2,1
    2ca6:	00002597          	auipc	a1,0x2
    2caa:	27258593          	addi	a1,a1,626 # 4f18 <malloc+0x1ce>
    2cae:	00002097          	auipc	ra,0x2
    2cb2:	c76080e7          	jalr	-906(ra) # 4924 <write>
    2cb6:	0ea04d63          	bgtz	a0,2db0 <dirfile+0x1dc>
  close(fd);
    2cba:	8526                	mv	a0,s1
    2cbc:	00002097          	auipc	ra,0x2
    2cc0:	c70080e7          	jalr	-912(ra) # 492c <close>
}
    2cc4:	60e2                	ld	ra,24(sp)
    2cc6:	6442                	ld	s0,16(sp)
    2cc8:	64a2                	ld	s1,8(sp)
    2cca:	6902                	ld	s2,0(sp)
    2ccc:	6105                	addi	sp,sp,32
    2cce:	8082                	ret
    printf("%s: create dirfile failed\n", s);
    2cd0:	85ca                	mv	a1,s2
    2cd2:	00003517          	auipc	a0,0x3
    2cd6:	37e50513          	addi	a0,a0,894 # 6050 <malloc+0x1306>
    2cda:	00002097          	auipc	ra,0x2
    2cde:	fb8080e7          	jalr	-72(ra) # 4c92 <printf>
    exit(1);
    2ce2:	4505                	li	a0,1
    2ce4:	00002097          	auipc	ra,0x2
    2ce8:	c20080e7          	jalr	-992(ra) # 4904 <exit>
    printf("%s: chdir dirfile succeeded!\n", s);
    2cec:	85ca                	mv	a1,s2
    2cee:	00003517          	auipc	a0,0x3
    2cf2:	38250513          	addi	a0,a0,898 # 6070 <malloc+0x1326>
    2cf6:	00002097          	auipc	ra,0x2
    2cfa:	f9c080e7          	jalr	-100(ra) # 4c92 <printf>
    exit(1);
    2cfe:	4505                	li	a0,1
    2d00:	00002097          	auipc	ra,0x2
    2d04:	c04080e7          	jalr	-1020(ra) # 4904 <exit>
    printf("%s: create dirfile/xx succeeded!\n", s);
    2d08:	85ca                	mv	a1,s2
    2d0a:	00003517          	auipc	a0,0x3
    2d0e:	39650513          	addi	a0,a0,918 # 60a0 <malloc+0x1356>
    2d12:	00002097          	auipc	ra,0x2
    2d16:	f80080e7          	jalr	-128(ra) # 4c92 <printf>
    exit(1);
    2d1a:	4505                	li	a0,1
    2d1c:	00002097          	auipc	ra,0x2
    2d20:	be8080e7          	jalr	-1048(ra) # 4904 <exit>
    printf("%s: create dirfile/xx succeeded!\n", s);
    2d24:	85ca                	mv	a1,s2
    2d26:	00003517          	auipc	a0,0x3
    2d2a:	37a50513          	addi	a0,a0,890 # 60a0 <malloc+0x1356>
    2d2e:	00002097          	auipc	ra,0x2
    2d32:	f64080e7          	jalr	-156(ra) # 4c92 <printf>
    exit(1);
    2d36:	4505                	li	a0,1
    2d38:	00002097          	auipc	ra,0x2
    2d3c:	bcc080e7          	jalr	-1076(ra) # 4904 <exit>
    printf("%s: mkdir dirfile/xx succeeded!\n", s);
    2d40:	85ca                	mv	a1,s2
    2d42:	00003517          	auipc	a0,0x3
    2d46:	38650513          	addi	a0,a0,902 # 60c8 <malloc+0x137e>
    2d4a:	00002097          	auipc	ra,0x2
    2d4e:	f48080e7          	jalr	-184(ra) # 4c92 <printf>
    exit(1);
    2d52:	4505                	li	a0,1
    2d54:	00002097          	auipc	ra,0x2
    2d58:	bb0080e7          	jalr	-1104(ra) # 4904 <exit>
    printf("%s: remove dirfile/xx succeeded!\n", s);
    2d5c:	85ca                	mv	a1,s2
    2d5e:	00003517          	auipc	a0,0x3
    2d62:	39250513          	addi	a0,a0,914 # 60f0 <malloc+0x13a6>
    2d66:	00002097          	auipc	ra,0x2
    2d6a:	f2c080e7          	jalr	-212(ra) # 4c92 <printf>
    exit(1);
    2d6e:	4505                	li	a0,1
    2d70:	00002097          	auipc	ra,0x2
    2d74:	b94080e7          	jalr	-1132(ra) # 4904 <exit>
    printf("%s: remove dirfile failed!\n", s);
    2d78:	85ca                	mv	a1,s2
    2d7a:	00003517          	auipc	a0,0x3
    2d7e:	39e50513          	addi	a0,a0,926 # 6118 <malloc+0x13ce>
    2d82:	00002097          	auipc	ra,0x2
    2d86:	f10080e7          	jalr	-240(ra) # 4c92 <printf>
    exit(1);
    2d8a:	4505                	li	a0,1
    2d8c:	00002097          	auipc	ra,0x2
    2d90:	b78080e7          	jalr	-1160(ra) # 4904 <exit>
    printf("%s: open . for writing succeeded!\n", s);
    2d94:	85ca                	mv	a1,s2
    2d96:	00003517          	auipc	a0,0x3
    2d9a:	3a250513          	addi	a0,a0,930 # 6138 <malloc+0x13ee>
    2d9e:	00002097          	auipc	ra,0x2
    2da2:	ef4080e7          	jalr	-268(ra) # 4c92 <printf>
    exit(1);
    2da6:	4505                	li	a0,1
    2da8:	00002097          	auipc	ra,0x2
    2dac:	b5c080e7          	jalr	-1188(ra) # 4904 <exit>
    printf("%s: write . succeeded!\n", s);
    2db0:	85ca                	mv	a1,s2
    2db2:	00003517          	auipc	a0,0x3
    2db6:	3ae50513          	addi	a0,a0,942 # 6160 <malloc+0x1416>
    2dba:	00002097          	auipc	ra,0x2
    2dbe:	ed8080e7          	jalr	-296(ra) # 4c92 <printf>
    exit(1);
    2dc2:	4505                	li	a0,1
    2dc4:	00002097          	auipc	ra,0x2
    2dc8:	b40080e7          	jalr	-1216(ra) # 4904 <exit>

0000000000002dcc <iref>:
{
    2dcc:	7139                	addi	sp,sp,-64
    2dce:	fc06                	sd	ra,56(sp)
    2dd0:	f822                	sd	s0,48(sp)
    2dd2:	f426                	sd	s1,40(sp)
    2dd4:	f04a                	sd	s2,32(sp)
    2dd6:	ec4e                	sd	s3,24(sp)
    2dd8:	e852                	sd	s4,16(sp)
    2dda:	e456                	sd	s5,8(sp)
    2ddc:	0080                	addi	s0,sp,64
    2dde:	8aaa                	mv	s5,a0
    2de0:	02e00493          	li	s1,46
    if(mkdir("irefd") != 0){
    2de4:	00003917          	auipc	s2,0x3
    2de8:	39490913          	addi	s2,s2,916 # 6178 <malloc+0x142e>
    mkdir("");
    2dec:	00003a17          	auipc	s4,0x3
    2df0:	024a0a13          	addi	s4,s4,36 # 5e10 <malloc+0x10c6>
    fd = open("xx", O_CREATE);
    2df4:	00003997          	auipc	s3,0x3
    2df8:	2a498993          	addi	s3,s3,676 # 6098 <malloc+0x134e>
    2dfc:	a889                	j	2e4e <iref+0x82>
      printf("%s: mkdir irefd failed\n", s);
    2dfe:	85d6                	mv	a1,s5
    2e00:	00003517          	auipc	a0,0x3
    2e04:	38050513          	addi	a0,a0,896 # 6180 <malloc+0x1436>
    2e08:	00002097          	auipc	ra,0x2
    2e0c:	e8a080e7          	jalr	-374(ra) # 4c92 <printf>
      exit(1);
    2e10:	4505                	li	a0,1
    2e12:	00002097          	auipc	ra,0x2
    2e16:	af2080e7          	jalr	-1294(ra) # 4904 <exit>
      printf("%s: chdir irefd failed\n", s);
    2e1a:	85d6                	mv	a1,s5
    2e1c:	00003517          	auipc	a0,0x3
    2e20:	37c50513          	addi	a0,a0,892 # 6198 <malloc+0x144e>
    2e24:	00002097          	auipc	ra,0x2
    2e28:	e6e080e7          	jalr	-402(ra) # 4c92 <printf>
      exit(1);
    2e2c:	4505                	li	a0,1
    2e2e:	00002097          	auipc	ra,0x2
    2e32:	ad6080e7          	jalr	-1322(ra) # 4904 <exit>
      close(fd);
    2e36:	00002097          	auipc	ra,0x2
    2e3a:	af6080e7          	jalr	-1290(ra) # 492c <close>
    2e3e:	a091                	j	2e82 <iref+0xb6>
    remove("xx");
    2e40:	854e                	mv	a0,s3
    2e42:	00002097          	auipc	ra,0x2
    2e46:	b6a080e7          	jalr	-1174(ra) # 49ac <remove>
  for(i = 0; i < NINODE - 4; i++){
    2e4a:	34fd                	addiw	s1,s1,-1
    2e4c:	c8a9                	beqz	s1,2e9e <iref+0xd2>
    if(mkdir("irefd") != 0){
    2e4e:	854a                	mv	a0,s2
    2e50:	00002097          	auipc	ra,0x2
    2e54:	b04080e7          	jalr	-1276(ra) # 4954 <mkdir>
    2e58:	f15d                	bnez	a0,2dfe <iref+0x32>
    if(chdir("irefd") != 0){
    2e5a:	854a                	mv	a0,s2
    2e5c:	00002097          	auipc	ra,0x2
    2e60:	b00080e7          	jalr	-1280(ra) # 495c <chdir>
    2e64:	f95d                	bnez	a0,2e1a <iref+0x4e>
    mkdir("");
    2e66:	8552                	mv	a0,s4
    2e68:	00002097          	auipc	ra,0x2
    2e6c:	aec080e7          	jalr	-1300(ra) # 4954 <mkdir>
    fd = open("", O_CREATE);
    2e70:	20000593          	li	a1,512
    2e74:	8552                	mv	a0,s4
    2e76:	00002097          	auipc	ra,0x2
    2e7a:	ace080e7          	jalr	-1330(ra) # 4944 <open>
    if(fd >= 0)
    2e7e:	fa055ce3          	bgez	a0,2e36 <iref+0x6a>
    fd = open("xx", O_CREATE);
    2e82:	20000593          	li	a1,512
    2e86:	854e                	mv	a0,s3
    2e88:	00002097          	auipc	ra,0x2
    2e8c:	abc080e7          	jalr	-1348(ra) # 4944 <open>
    if(fd >= 0)
    2e90:	fa0548e3          	bltz	a0,2e40 <iref+0x74>
      close(fd);
    2e94:	00002097          	auipc	ra,0x2
    2e98:	a98080e7          	jalr	-1384(ra) # 492c <close>
    2e9c:	b755                	j	2e40 <iref+0x74>
    2e9e:	03300493          	li	s1,51
    chdir("..");
    2ea2:	00003997          	auipc	s3,0x3
    2ea6:	11698993          	addi	s3,s3,278 # 5fb8 <malloc+0x126e>
    remove("irefd");
    2eaa:	00003917          	auipc	s2,0x3
    2eae:	2ce90913          	addi	s2,s2,718 # 6178 <malloc+0x142e>
    chdir("..");
    2eb2:	854e                	mv	a0,s3
    2eb4:	00002097          	auipc	ra,0x2
    2eb8:	aa8080e7          	jalr	-1368(ra) # 495c <chdir>
    remove("irefd");
    2ebc:	854a                	mv	a0,s2
    2ebe:	00002097          	auipc	ra,0x2
    2ec2:	aee080e7          	jalr	-1298(ra) # 49ac <remove>
  for(i = 0; i < NINODE + 1; i++){
    2ec6:	34fd                	addiw	s1,s1,-1
    2ec8:	f4ed                	bnez	s1,2eb2 <iref+0xe6>
  chdir("/");
    2eca:	00003517          	auipc	a0,0x3
    2ece:	cd650513          	addi	a0,a0,-810 # 5ba0 <malloc+0xe56>
    2ed2:	00002097          	auipc	ra,0x2
    2ed6:	a8a080e7          	jalr	-1398(ra) # 495c <chdir>
}
    2eda:	70e2                	ld	ra,56(sp)
    2edc:	7442                	ld	s0,48(sp)
    2ede:	74a2                	ld	s1,40(sp)
    2ee0:	7902                	ld	s2,32(sp)
    2ee2:	69e2                	ld	s3,24(sp)
    2ee4:	6a42                	ld	s4,16(sp)
    2ee6:	6aa2                	ld	s5,8(sp)
    2ee8:	6121                	addi	sp,sp,64
    2eea:	8082                	ret

0000000000002eec <openiputtest>:
{
    2eec:	7179                	addi	sp,sp,-48
    2eee:	f406                	sd	ra,40(sp)
    2ef0:	f022                	sd	s0,32(sp)
    2ef2:	ec26                	sd	s1,24(sp)
    2ef4:	1800                	addi	s0,sp,48
    2ef6:	84aa                	mv	s1,a0
  if(mkdir("oidir") < 0){
    2ef8:	00003517          	auipc	a0,0x3
    2efc:	2b850513          	addi	a0,a0,696 # 61b0 <malloc+0x1466>
    2f00:	00002097          	auipc	ra,0x2
    2f04:	a54080e7          	jalr	-1452(ra) # 4954 <mkdir>
    2f08:	04054263          	bltz	a0,2f4c <openiputtest+0x60>
  pid = fork();
    2f0c:	00002097          	auipc	ra,0x2
    2f10:	9f0080e7          	jalr	-1552(ra) # 48fc <fork>
  if(pid < 0){
    2f14:	04054a63          	bltz	a0,2f68 <openiputtest+0x7c>
  if(pid == 0){
    2f18:	e93d                	bnez	a0,2f8e <openiputtest+0xa2>
    int fd = open("oidir", O_RDWR);
    2f1a:	4589                	li	a1,2
    2f1c:	00003517          	auipc	a0,0x3
    2f20:	29450513          	addi	a0,a0,660 # 61b0 <malloc+0x1466>
    2f24:	00002097          	auipc	ra,0x2
    2f28:	a20080e7          	jalr	-1504(ra) # 4944 <open>
    if(fd >= 0){
    2f2c:	04054c63          	bltz	a0,2f84 <openiputtest+0x98>
      printf("%s: open directory for write succeeded\n", s);
    2f30:	85a6                	mv	a1,s1
    2f32:	00003517          	auipc	a0,0x3
    2f36:	29e50513          	addi	a0,a0,670 # 61d0 <malloc+0x1486>
    2f3a:	00002097          	auipc	ra,0x2
    2f3e:	d58080e7          	jalr	-680(ra) # 4c92 <printf>
      exit(1);
    2f42:	4505                	li	a0,1
    2f44:	00002097          	auipc	ra,0x2
    2f48:	9c0080e7          	jalr	-1600(ra) # 4904 <exit>
    printf("%s: mkdir oidir failed\n", s);
    2f4c:	85a6                	mv	a1,s1
    2f4e:	00003517          	auipc	a0,0x3
    2f52:	26a50513          	addi	a0,a0,618 # 61b8 <malloc+0x146e>
    2f56:	00002097          	auipc	ra,0x2
    2f5a:	d3c080e7          	jalr	-708(ra) # 4c92 <printf>
    exit(1);
    2f5e:	4505                	li	a0,1
    2f60:	00002097          	auipc	ra,0x2
    2f64:	9a4080e7          	jalr	-1628(ra) # 4904 <exit>
    printf("%s: fork failed\n", s);
    2f68:	85a6                	mv	a1,s1
    2f6a:	00002517          	auipc	a0,0x2
    2f6e:	5ce50513          	addi	a0,a0,1486 # 5538 <malloc+0x7ee>
    2f72:	00002097          	auipc	ra,0x2
    2f76:	d20080e7          	jalr	-736(ra) # 4c92 <printf>
    exit(1);
    2f7a:	4505                	li	a0,1
    2f7c:	00002097          	auipc	ra,0x2
    2f80:	988080e7          	jalr	-1656(ra) # 4904 <exit>
    exit(0);
    2f84:	4501                	li	a0,0
    2f86:	00002097          	auipc	ra,0x2
    2f8a:	97e080e7          	jalr	-1666(ra) # 4904 <exit>
  sleep(1);
    2f8e:	4505                	li	a0,1
    2f90:	00002097          	auipc	ra,0x2
    2f94:	9ec080e7          	jalr	-1556(ra) # 497c <sleep>
  if(remove("oidir") != 0){
    2f98:	00003517          	auipc	a0,0x3
    2f9c:	21850513          	addi	a0,a0,536 # 61b0 <malloc+0x1466>
    2fa0:	00002097          	auipc	ra,0x2
    2fa4:	a0c080e7          	jalr	-1524(ra) # 49ac <remove>
    2fa8:	cd19                	beqz	a0,2fc6 <openiputtest+0xda>
    printf("%s: remove failed\n", s);
    2faa:	85a6                	mv	a1,s1
    2fac:	00003517          	auipc	a0,0x3
    2fb0:	24c50513          	addi	a0,a0,588 # 61f8 <malloc+0x14ae>
    2fb4:	00002097          	auipc	ra,0x2
    2fb8:	cde080e7          	jalr	-802(ra) # 4c92 <printf>
    exit(1);
    2fbc:	4505                	li	a0,1
    2fbe:	00002097          	auipc	ra,0x2
    2fc2:	946080e7          	jalr	-1722(ra) # 4904 <exit>
  wait(&xstatus);
    2fc6:	fdc40513          	addi	a0,s0,-36
    2fca:	00002097          	auipc	ra,0x2
    2fce:	942080e7          	jalr	-1726(ra) # 490c <wait>
  exit(xstatus);
    2fd2:	fdc42503          	lw	a0,-36(s0)
    2fd6:	00002097          	auipc	ra,0x2
    2fda:	92e080e7          	jalr	-1746(ra) # 4904 <exit>

0000000000002fde <forkforkfork>:
{
    2fde:	1101                	addi	sp,sp,-32
    2fe0:	ec06                	sd	ra,24(sp)
    2fe2:	e822                	sd	s0,16(sp)
    2fe4:	e426                	sd	s1,8(sp)
    2fe6:	1000                	addi	s0,sp,32
    2fe8:	84aa                	mv	s1,a0
  remove("stopforking");
    2fea:	00003517          	auipc	a0,0x3
    2fee:	22650513          	addi	a0,a0,550 # 6210 <malloc+0x14c6>
    2ff2:	00002097          	auipc	ra,0x2
    2ff6:	9ba080e7          	jalr	-1606(ra) # 49ac <remove>
  int pid = fork();
    2ffa:	00002097          	auipc	ra,0x2
    2ffe:	902080e7          	jalr	-1790(ra) # 48fc <fork>
  if(pid < 0){
    3002:	04054d63          	bltz	a0,305c <forkforkfork+0x7e>
  if(pid == 0){
    3006:	c92d                	beqz	a0,3078 <forkforkfork+0x9a>
  sleep(20); // two seconds
    3008:	4551                	li	a0,20
    300a:	00002097          	auipc	ra,0x2
    300e:	972080e7          	jalr	-1678(ra) # 497c <sleep>
  close(open("stopforking", O_CREATE|O_RDWR));
    3012:	20200593          	li	a1,514
    3016:	00003517          	auipc	a0,0x3
    301a:	1fa50513          	addi	a0,a0,506 # 6210 <malloc+0x14c6>
    301e:	00002097          	auipc	ra,0x2
    3022:	926080e7          	jalr	-1754(ra) # 4944 <open>
    3026:	00002097          	auipc	ra,0x2
    302a:	906080e7          	jalr	-1786(ra) # 492c <close>
  wait(0);
    302e:	4501                	li	a0,0
    3030:	00002097          	auipc	ra,0x2
    3034:	8dc080e7          	jalr	-1828(ra) # 490c <wait>
  sleep(10); // one second
    3038:	4529                	li	a0,10
    303a:	00002097          	auipc	ra,0x2
    303e:	942080e7          	jalr	-1726(ra) # 497c <sleep>
  remove("stopforking");
    3042:	00003517          	auipc	a0,0x3
    3046:	1ce50513          	addi	a0,a0,462 # 6210 <malloc+0x14c6>
    304a:	00002097          	auipc	ra,0x2
    304e:	962080e7          	jalr	-1694(ra) # 49ac <remove>
}
    3052:	60e2                	ld	ra,24(sp)
    3054:	6442                	ld	s0,16(sp)
    3056:	64a2                	ld	s1,8(sp)
    3058:	6105                	addi	sp,sp,32
    305a:	8082                	ret
    printf("%s: fork failed", s);
    305c:	85a6                	mv	a1,s1
    305e:	00002517          	auipc	a0,0x2
    3062:	69a50513          	addi	a0,a0,1690 # 56f8 <malloc+0x9ae>
    3066:	00002097          	auipc	ra,0x2
    306a:	c2c080e7          	jalr	-980(ra) # 4c92 <printf>
    exit(1);
    306e:	4505                	li	a0,1
    3070:	00002097          	auipc	ra,0x2
    3074:	894080e7          	jalr	-1900(ra) # 4904 <exit>
      int fd = open("stopforking", 0);
    3078:	00003497          	auipc	s1,0x3
    307c:	19848493          	addi	s1,s1,408 # 6210 <malloc+0x14c6>
    3080:	4581                	li	a1,0
    3082:	8526                	mv	a0,s1
    3084:	00002097          	auipc	ra,0x2
    3088:	8c0080e7          	jalr	-1856(ra) # 4944 <open>
      if(fd >= 0){
    308c:	02055463          	bgez	a0,30b4 <forkforkfork+0xd6>
      if(fork() < 0){
    3090:	00002097          	auipc	ra,0x2
    3094:	86c080e7          	jalr	-1940(ra) # 48fc <fork>
    3098:	fe0554e3          	bgez	a0,3080 <forkforkfork+0xa2>
        close(open("stopforking", O_CREATE|O_RDWR));
    309c:	20200593          	li	a1,514
    30a0:	8526                	mv	a0,s1
    30a2:	00002097          	auipc	ra,0x2
    30a6:	8a2080e7          	jalr	-1886(ra) # 4944 <open>
    30aa:	00002097          	auipc	ra,0x2
    30ae:	882080e7          	jalr	-1918(ra) # 492c <close>
    30b2:	b7f9                	j	3080 <forkforkfork+0xa2>
        exit(0);
    30b4:	4501                	li	a0,0
    30b6:	00002097          	auipc	ra,0x2
    30ba:	84e080e7          	jalr	-1970(ra) # 4904 <exit>

00000000000030be <preempt>:
{
    30be:	7139                	addi	sp,sp,-64
    30c0:	fc06                	sd	ra,56(sp)
    30c2:	f822                	sd	s0,48(sp)
    30c4:	f426                	sd	s1,40(sp)
    30c6:	f04a                	sd	s2,32(sp)
    30c8:	ec4e                	sd	s3,24(sp)
    30ca:	e852                	sd	s4,16(sp)
    30cc:	0080                	addi	s0,sp,64
    30ce:	892a                	mv	s2,a0
  pid1 = fork();
    30d0:	00002097          	auipc	ra,0x2
    30d4:	82c080e7          	jalr	-2004(ra) # 48fc <fork>
  if(pid1 < 0) {
    30d8:	00054563          	bltz	a0,30e2 <preempt+0x24>
    30dc:	84aa                	mv	s1,a0
  if(pid1 == 0)
    30de:	ed19                	bnez	a0,30fc <preempt+0x3e>
    for(;;)
    30e0:	a001                	j	30e0 <preempt+0x22>
    printf("%s: fork failed");
    30e2:	00002517          	auipc	a0,0x2
    30e6:	61650513          	addi	a0,a0,1558 # 56f8 <malloc+0x9ae>
    30ea:	00002097          	auipc	ra,0x2
    30ee:	ba8080e7          	jalr	-1112(ra) # 4c92 <printf>
    exit(1);
    30f2:	4505                	li	a0,1
    30f4:	00002097          	auipc	ra,0x2
    30f8:	810080e7          	jalr	-2032(ra) # 4904 <exit>
  pid2 = fork();
    30fc:	00002097          	auipc	ra,0x2
    3100:	800080e7          	jalr	-2048(ra) # 48fc <fork>
    3104:	89aa                	mv	s3,a0
  if(pid2 < 0) {
    3106:	00054463          	bltz	a0,310e <preempt+0x50>
  if(pid2 == 0)
    310a:	e105                	bnez	a0,312a <preempt+0x6c>
    for(;;)
    310c:	a001                	j	310c <preempt+0x4e>
    printf("%s: fork failed\n", s);
    310e:	85ca                	mv	a1,s2
    3110:	00002517          	auipc	a0,0x2
    3114:	42850513          	addi	a0,a0,1064 # 5538 <malloc+0x7ee>
    3118:	00002097          	auipc	ra,0x2
    311c:	b7a080e7          	jalr	-1158(ra) # 4c92 <printf>
    exit(1);
    3120:	4505                	li	a0,1
    3122:	00001097          	auipc	ra,0x1
    3126:	7e2080e7          	jalr	2018(ra) # 4904 <exit>
  pipe(pfds);
    312a:	fc840513          	addi	a0,s0,-56
    312e:	00001097          	auipc	ra,0x1
    3132:	7e6080e7          	jalr	2022(ra) # 4914 <pipe>
  pid3 = fork();
    3136:	00001097          	auipc	ra,0x1
    313a:	7c6080e7          	jalr	1990(ra) # 48fc <fork>
    313e:	8a2a                	mv	s4,a0
  if(pid3 < 0) {
    3140:	02054e63          	bltz	a0,317c <preempt+0xbe>
  if(pid3 == 0){
    3144:	e13d                	bnez	a0,31aa <preempt+0xec>
    close(pfds[0]);
    3146:	fc842503          	lw	a0,-56(s0)
    314a:	00001097          	auipc	ra,0x1
    314e:	7e2080e7          	jalr	2018(ra) # 492c <close>
    if(write(pfds[1], "x", 1) != 1)
    3152:	4605                	li	a2,1
    3154:	00002597          	auipc	a1,0x2
    3158:	dc458593          	addi	a1,a1,-572 # 4f18 <malloc+0x1ce>
    315c:	fcc42503          	lw	a0,-52(s0)
    3160:	00001097          	auipc	ra,0x1
    3164:	7c4080e7          	jalr	1988(ra) # 4924 <write>
    3168:	4785                	li	a5,1
    316a:	02f51763          	bne	a0,a5,3198 <preempt+0xda>
    close(pfds[1]);
    316e:	fcc42503          	lw	a0,-52(s0)
    3172:	00001097          	auipc	ra,0x1
    3176:	7ba080e7          	jalr	1978(ra) # 492c <close>
    for(;;)
    317a:	a001                	j	317a <preempt+0xbc>
     printf("%s: fork failed\n", s);
    317c:	85ca                	mv	a1,s2
    317e:	00002517          	auipc	a0,0x2
    3182:	3ba50513          	addi	a0,a0,954 # 5538 <malloc+0x7ee>
    3186:	00002097          	auipc	ra,0x2
    318a:	b0c080e7          	jalr	-1268(ra) # 4c92 <printf>
     exit(1);
    318e:	4505                	li	a0,1
    3190:	00001097          	auipc	ra,0x1
    3194:	774080e7          	jalr	1908(ra) # 4904 <exit>
      printf("%s: preempt write error");
    3198:	00003517          	auipc	a0,0x3
    319c:	08850513          	addi	a0,a0,136 # 6220 <malloc+0x14d6>
    31a0:	00002097          	auipc	ra,0x2
    31a4:	af2080e7          	jalr	-1294(ra) # 4c92 <printf>
    31a8:	b7d9                	j	316e <preempt+0xb0>
  close(pfds[1]);
    31aa:	fcc42503          	lw	a0,-52(s0)
    31ae:	00001097          	auipc	ra,0x1
    31b2:	77e080e7          	jalr	1918(ra) # 492c <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
    31b6:	6609                	lui	a2,0x2
    31b8:	80060613          	addi	a2,a2,-2048 # 1800 <forkfork+0x42>
    31bc:	00007597          	auipc	a1,0x7
    31c0:	6a458593          	addi	a1,a1,1700 # a860 <buf>
    31c4:	fc842503          	lw	a0,-56(s0)
    31c8:	00001097          	auipc	ra,0x1
    31cc:	754080e7          	jalr	1876(ra) # 491c <read>
    31d0:	4785                	li	a5,1
    31d2:	02f50263          	beq	a0,a5,31f6 <preempt+0x138>
    printf("%s: preempt read error");
    31d6:	00003517          	auipc	a0,0x3
    31da:	06250513          	addi	a0,a0,98 # 6238 <malloc+0x14ee>
    31de:	00002097          	auipc	ra,0x2
    31e2:	ab4080e7          	jalr	-1356(ra) # 4c92 <printf>
}
    31e6:	70e2                	ld	ra,56(sp)
    31e8:	7442                	ld	s0,48(sp)
    31ea:	74a2                	ld	s1,40(sp)
    31ec:	7902                	ld	s2,32(sp)
    31ee:	69e2                	ld	s3,24(sp)
    31f0:	6a42                	ld	s4,16(sp)
    31f2:	6121                	addi	sp,sp,64
    31f4:	8082                	ret
  close(pfds[0]);
    31f6:	fc842503          	lw	a0,-56(s0)
    31fa:	00001097          	auipc	ra,0x1
    31fe:	732080e7          	jalr	1842(ra) # 492c <close>
  printf("kill... ");
    3202:	00003517          	auipc	a0,0x3
    3206:	04e50513          	addi	a0,a0,78 # 6250 <malloc+0x1506>
    320a:	00002097          	auipc	ra,0x2
    320e:	a88080e7          	jalr	-1400(ra) # 4c92 <printf>
  kill(pid1);
    3212:	8526                	mv	a0,s1
    3214:	00001097          	auipc	ra,0x1
    3218:	720080e7          	jalr	1824(ra) # 4934 <kill>
  kill(pid2);
    321c:	854e                	mv	a0,s3
    321e:	00001097          	auipc	ra,0x1
    3222:	716080e7          	jalr	1814(ra) # 4934 <kill>
  kill(pid3);
    3226:	8552                	mv	a0,s4
    3228:	00001097          	auipc	ra,0x1
    322c:	70c080e7          	jalr	1804(ra) # 4934 <kill>
  printf("wait... ");
    3230:	00003517          	auipc	a0,0x3
    3234:	03050513          	addi	a0,a0,48 # 6260 <malloc+0x1516>
    3238:	00002097          	auipc	ra,0x2
    323c:	a5a080e7          	jalr	-1446(ra) # 4c92 <printf>
  wait(0);
    3240:	4501                	li	a0,0
    3242:	00001097          	auipc	ra,0x1
    3246:	6ca080e7          	jalr	1738(ra) # 490c <wait>
  wait(0);
    324a:	4501                	li	a0,0
    324c:	00001097          	auipc	ra,0x1
    3250:	6c0080e7          	jalr	1728(ra) # 490c <wait>
  wait(0);
    3254:	4501                	li	a0,0
    3256:	00001097          	auipc	ra,0x1
    325a:	6b6080e7          	jalr	1718(ra) # 490c <wait>
    325e:	b761                	j	31e6 <preempt+0x128>

0000000000003260 <sbrkfail>:
{
    3260:	7119                	addi	sp,sp,-128
    3262:	fc86                	sd	ra,120(sp)
    3264:	f8a2                	sd	s0,112(sp)
    3266:	f4a6                	sd	s1,104(sp)
    3268:	f0ca                	sd	s2,96(sp)
    326a:	ecce                	sd	s3,88(sp)
    326c:	e8d2                	sd	s4,80(sp)
    326e:	e4d6                	sd	s5,72(sp)
    3270:	e0da                	sd	s6,64(sp)
    3272:	0100                	addi	s0,sp,128
    3274:	8b2a                	mv	s6,a0
  if(pipe(fds) != 0){
    3276:	fb040513          	addi	a0,s0,-80
    327a:	00001097          	auipc	ra,0x1
    327e:	69a080e7          	jalr	1690(ra) # 4914 <pipe>
    3282:	e911                	bnez	a0,3296 <sbrkfail+0x36>
    3284:	f8040493          	addi	s1,s0,-128
    3288:	fa840993          	addi	s3,s0,-88
    328c:	8926                	mv	s2,s1
    if(pids[i] != -1)
    328e:	5a7d                	li	s4,-1
      read(fds[0], &scratch, 1);
    3290:	faf40a93          	addi	s5,s0,-81
    3294:	a085                	j	32f4 <sbrkfail+0x94>
    printf("%s: pipe() failed\n", s);
    3296:	85da                	mv	a1,s6
    3298:	00002517          	auipc	a0,0x2
    329c:	3a850513          	addi	a0,a0,936 # 5640 <malloc+0x8f6>
    32a0:	00002097          	auipc	ra,0x2
    32a4:	9f2080e7          	jalr	-1550(ra) # 4c92 <printf>
    exit(1);
    32a8:	4505                	li	a0,1
    32aa:	00001097          	auipc	ra,0x1
    32ae:	65a080e7          	jalr	1626(ra) # 4904 <exit>
      sbrk(BIG - (uint64)sbrk(0));
    32b2:	00001097          	auipc	ra,0x1
    32b6:	6c2080e7          	jalr	1730(ra) # 4974 <sbrk>
    32ba:	064007b7          	lui	a5,0x6400
    32be:	40a7853b          	subw	a0,a5,a0
    32c2:	00001097          	auipc	ra,0x1
    32c6:	6b2080e7          	jalr	1714(ra) # 4974 <sbrk>
      write(fds[1], "x", 1);
    32ca:	4605                	li	a2,1
    32cc:	00002597          	auipc	a1,0x2
    32d0:	c4c58593          	addi	a1,a1,-948 # 4f18 <malloc+0x1ce>
    32d4:	fb442503          	lw	a0,-76(s0)
    32d8:	00001097          	auipc	ra,0x1
    32dc:	64c080e7          	jalr	1612(ra) # 4924 <write>
      for(;;) sleep(1000);
    32e0:	3e800513          	li	a0,1000
    32e4:	00001097          	auipc	ra,0x1
    32e8:	698080e7          	jalr	1688(ra) # 497c <sleep>
    32ec:	bfd5                	j	32e0 <sbrkfail+0x80>
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    32ee:	0911                	addi	s2,s2,4
    32f0:	03390463          	beq	s2,s3,3318 <sbrkfail+0xb8>
    if((pids[i] = fork()) == 0){
    32f4:	00001097          	auipc	ra,0x1
    32f8:	608080e7          	jalr	1544(ra) # 48fc <fork>
    32fc:	00a92023          	sw	a0,0(s2)
    3300:	d94d                	beqz	a0,32b2 <sbrkfail+0x52>
    if(pids[i] != -1)
    3302:	ff4506e3          	beq	a0,s4,32ee <sbrkfail+0x8e>
      read(fds[0], &scratch, 1);
    3306:	4605                	li	a2,1
    3308:	85d6                	mv	a1,s5
    330a:	fb042503          	lw	a0,-80(s0)
    330e:	00001097          	auipc	ra,0x1
    3312:	60e080e7          	jalr	1550(ra) # 491c <read>
    3316:	bfe1                	j	32ee <sbrkfail+0x8e>
  c = sbrk(PGSIZE);
    3318:	6505                	lui	a0,0x1
    331a:	00001097          	auipc	ra,0x1
    331e:	65a080e7          	jalr	1626(ra) # 4974 <sbrk>
    3322:	8a2a                	mv	s4,a0
    if(pids[i] == -1)
    3324:	597d                	li	s2,-1
    3326:	a021                	j	332e <sbrkfail+0xce>
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3328:	0491                	addi	s1,s1,4
    332a:	01348f63          	beq	s1,s3,3348 <sbrkfail+0xe8>
    if(pids[i] == -1)
    332e:	4088                	lw	a0,0(s1)
    3330:	ff250ce3          	beq	a0,s2,3328 <sbrkfail+0xc8>
    kill(pids[i]);
    3334:	00001097          	auipc	ra,0x1
    3338:	600080e7          	jalr	1536(ra) # 4934 <kill>
    wait(0);
    333c:	4501                	li	a0,0
    333e:	00001097          	auipc	ra,0x1
    3342:	5ce080e7          	jalr	1486(ra) # 490c <wait>
    3346:	b7cd                	j	3328 <sbrkfail+0xc8>
  if(c == (char*)0xffffffffffffffffL){
    3348:	57fd                	li	a5,-1
    334a:	04fa0263          	beq	s4,a5,338e <sbrkfail+0x12e>
  pid = fork();
    334e:	00001097          	auipc	ra,0x1
    3352:	5ae080e7          	jalr	1454(ra) # 48fc <fork>
    3356:	84aa                	mv	s1,a0
  if(pid < 0){
    3358:	04054963          	bltz	a0,33aa <sbrkfail+0x14a>
  if(pid == 0){
    335c:	c52d                	beqz	a0,33c6 <sbrkfail+0x166>
  wait(&xstatus);
    335e:	fbc40513          	addi	a0,s0,-68
    3362:	00001097          	auipc	ra,0x1
    3366:	5aa080e7          	jalr	1450(ra) # 490c <wait>
  if(xstatus != -1 && xstatus != 2)
    336a:	fbc42783          	lw	a5,-68(s0)
    336e:	577d                	li	a4,-1
    3370:	00e78563          	beq	a5,a4,337a <sbrkfail+0x11a>
    3374:	4709                	li	a4,2
    3376:	08e79d63          	bne	a5,a4,3410 <sbrkfail+0x1b0>
}
    337a:	70e6                	ld	ra,120(sp)
    337c:	7446                	ld	s0,112(sp)
    337e:	74a6                	ld	s1,104(sp)
    3380:	7906                	ld	s2,96(sp)
    3382:	69e6                	ld	s3,88(sp)
    3384:	6a46                	ld	s4,80(sp)
    3386:	6aa6                	ld	s5,72(sp)
    3388:	6b06                	ld	s6,64(sp)
    338a:	6109                	addi	sp,sp,128
    338c:	8082                	ret
    printf("%s: failed sbrk leaked memory\n", s);
    338e:	85da                	mv	a1,s6
    3390:	00003517          	auipc	a0,0x3
    3394:	ee050513          	addi	a0,a0,-288 # 6270 <malloc+0x1526>
    3398:	00002097          	auipc	ra,0x2
    339c:	8fa080e7          	jalr	-1798(ra) # 4c92 <printf>
    exit(1);
    33a0:	4505                	li	a0,1
    33a2:	00001097          	auipc	ra,0x1
    33a6:	562080e7          	jalr	1378(ra) # 4904 <exit>
    printf("%s: fork failed\n", s);
    33aa:	85da                	mv	a1,s6
    33ac:	00002517          	auipc	a0,0x2
    33b0:	18c50513          	addi	a0,a0,396 # 5538 <malloc+0x7ee>
    33b4:	00002097          	auipc	ra,0x2
    33b8:	8de080e7          	jalr	-1826(ra) # 4c92 <printf>
    exit(1);
    33bc:	4505                	li	a0,1
    33be:	00001097          	auipc	ra,0x1
    33c2:	546080e7          	jalr	1350(ra) # 4904 <exit>
    a = sbrk(0);
    33c6:	4501                	li	a0,0
    33c8:	00001097          	auipc	ra,0x1
    33cc:	5ac080e7          	jalr	1452(ra) # 4974 <sbrk>
    33d0:	892a                	mv	s2,a0
    sbrk(10*BIG);
    33d2:	3e800537          	lui	a0,0x3e800
    33d6:	00001097          	auipc	ra,0x1
    33da:	59e080e7          	jalr	1438(ra) # 4974 <sbrk>
    for (i = 0; i < 10*BIG; i += PGSIZE) {
    33de:	87ca                	mv	a5,s2
    33e0:	3e800737          	lui	a4,0x3e800
    33e4:	993a                	add	s2,s2,a4
    33e6:	6705                	lui	a4,0x1
      n += *(a+i);
    33e8:	0007c683          	lbu	a3,0(a5) # 6400000 <__BSS_END__+0x63f3f88>
    33ec:	9cb5                	addw	s1,s1,a3
    for (i = 0; i < 10*BIG; i += PGSIZE) {
    33ee:	97ba                	add	a5,a5,a4
    33f0:	ff279ce3          	bne	a5,s2,33e8 <sbrkfail+0x188>
    printf("%s: allocate a lot of memory succeeded %d\n", n);
    33f4:	85a6                	mv	a1,s1
    33f6:	00003517          	auipc	a0,0x3
    33fa:	e9a50513          	addi	a0,a0,-358 # 6290 <malloc+0x1546>
    33fe:	00002097          	auipc	ra,0x2
    3402:	894080e7          	jalr	-1900(ra) # 4c92 <printf>
    exit(1);
    3406:	4505                	li	a0,1
    3408:	00001097          	auipc	ra,0x1
    340c:	4fc080e7          	jalr	1276(ra) # 4904 <exit>
    exit(1);
    3410:	4505                	li	a0,1
    3412:	00001097          	auipc	ra,0x1
    3416:	4f2080e7          	jalr	1266(ra) # 4904 <exit>

000000000000341a <reparent>:
{
    341a:	7179                	addi	sp,sp,-48
    341c:	f406                	sd	ra,40(sp)
    341e:	f022                	sd	s0,32(sp)
    3420:	ec26                	sd	s1,24(sp)
    3422:	e84a                	sd	s2,16(sp)
    3424:	e44e                	sd	s3,8(sp)
    3426:	e052                	sd	s4,0(sp)
    3428:	1800                	addi	s0,sp,48
    342a:	89aa                	mv	s3,a0
  int master_pid = getpid();
    342c:	00001097          	auipc	ra,0x1
    3430:	540080e7          	jalr	1344(ra) # 496c <getpid>
    3434:	8a2a                	mv	s4,a0
    3436:	0c800913          	li	s2,200
    int pid = fork();
    343a:	00001097          	auipc	ra,0x1
    343e:	4c2080e7          	jalr	1218(ra) # 48fc <fork>
    3442:	84aa                	mv	s1,a0
    if(pid < 0){
    3444:	02054263          	bltz	a0,3468 <reparent+0x4e>
    if(pid){
    3448:	cd21                	beqz	a0,34a0 <reparent+0x86>
      if(wait(0) != pid){
    344a:	4501                	li	a0,0
    344c:	00001097          	auipc	ra,0x1
    3450:	4c0080e7          	jalr	1216(ra) # 490c <wait>
    3454:	02951863          	bne	a0,s1,3484 <reparent+0x6a>
  for(int i = 0; i < 200; i++){
    3458:	397d                	addiw	s2,s2,-1
    345a:	fe0910e3          	bnez	s2,343a <reparent+0x20>
  exit(0);
    345e:	4501                	li	a0,0
    3460:	00001097          	auipc	ra,0x1
    3464:	4a4080e7          	jalr	1188(ra) # 4904 <exit>
      printf("%s: fork failed\n", s);
    3468:	85ce                	mv	a1,s3
    346a:	00002517          	auipc	a0,0x2
    346e:	0ce50513          	addi	a0,a0,206 # 5538 <malloc+0x7ee>
    3472:	00002097          	auipc	ra,0x2
    3476:	820080e7          	jalr	-2016(ra) # 4c92 <printf>
      exit(1);
    347a:	4505                	li	a0,1
    347c:	00001097          	auipc	ra,0x1
    3480:	488080e7          	jalr	1160(ra) # 4904 <exit>
        printf("%s: wait wrong pid\n", s);
    3484:	85ce                	mv	a1,s3
    3486:	00002517          	auipc	a0,0x2
    348a:	23a50513          	addi	a0,a0,570 # 56c0 <malloc+0x976>
    348e:	00002097          	auipc	ra,0x2
    3492:	804080e7          	jalr	-2044(ra) # 4c92 <printf>
        exit(1);
    3496:	4505                	li	a0,1
    3498:	00001097          	auipc	ra,0x1
    349c:	46c080e7          	jalr	1132(ra) # 4904 <exit>
      int pid2 = fork();
    34a0:	00001097          	auipc	ra,0x1
    34a4:	45c080e7          	jalr	1116(ra) # 48fc <fork>
      if(pid2 < 0){
    34a8:	00054763          	bltz	a0,34b6 <reparent+0x9c>
      exit(0);
    34ac:	4501                	li	a0,0
    34ae:	00001097          	auipc	ra,0x1
    34b2:	456080e7          	jalr	1110(ra) # 4904 <exit>
        kill(master_pid);
    34b6:	8552                	mv	a0,s4
    34b8:	00001097          	auipc	ra,0x1
    34bc:	47c080e7          	jalr	1148(ra) # 4934 <kill>
        exit(1);
    34c0:	4505                	li	a0,1
    34c2:	00001097          	auipc	ra,0x1
    34c6:	442080e7          	jalr	1090(ra) # 4904 <exit>

00000000000034ca <mem>:
{
    34ca:	7139                	addi	sp,sp,-64
    34cc:	fc06                	sd	ra,56(sp)
    34ce:	f822                	sd	s0,48(sp)
    34d0:	f426                	sd	s1,40(sp)
    34d2:	f04a                	sd	s2,32(sp)
    34d4:	ec4e                	sd	s3,24(sp)
    34d6:	0080                	addi	s0,sp,64
    34d8:	89aa                	mv	s3,a0
  if((pid = fork()) == 0){
    34da:	00001097          	auipc	ra,0x1
    34de:	422080e7          	jalr	1058(ra) # 48fc <fork>
    m1 = 0;
    34e2:	4481                	li	s1,0
    while((m2 = malloc(10001)) != 0){
    34e4:	6909                	lui	s2,0x2
    34e6:	71190913          	addi	s2,s2,1809 # 2711 <subdir+0x1bb>
  if((pid = fork()) == 0){
    34ea:	c115                	beqz	a0,350e <mem+0x44>
    wait(&xstatus);
    34ec:	fcc40513          	addi	a0,s0,-52
    34f0:	00001097          	auipc	ra,0x1
    34f4:	41c080e7          	jalr	1052(ra) # 490c <wait>
    if(xstatus == -1){
    34f8:	fcc42503          	lw	a0,-52(s0)
    34fc:	57fd                	li	a5,-1
    34fe:	06f50363          	beq	a0,a5,3564 <mem+0x9a>
    exit(xstatus);
    3502:	00001097          	auipc	ra,0x1
    3506:	402080e7          	jalr	1026(ra) # 4904 <exit>
      *(char**)m2 = m1;
    350a:	e104                	sd	s1,0(a0)
      m1 = m2;
    350c:	84aa                	mv	s1,a0
    while((m2 = malloc(10001)) != 0){
    350e:	854a                	mv	a0,s2
    3510:	00002097          	auipc	ra,0x2
    3514:	83a080e7          	jalr	-1990(ra) # 4d4a <malloc>
    3518:	f96d                	bnez	a0,350a <mem+0x40>
    while(m1){
    351a:	c881                	beqz	s1,352a <mem+0x60>
      m2 = *(char**)m1;
    351c:	8526                	mv	a0,s1
    351e:	6084                	ld	s1,0(s1)
      free(m1);
    3520:	00001097          	auipc	ra,0x1
    3524:	7a8080e7          	jalr	1960(ra) # 4cc8 <free>
    while(m1){
    3528:	f8f5                	bnez	s1,351c <mem+0x52>
    m1 = malloc(1024*20);
    352a:	6515                	lui	a0,0x5
    352c:	00002097          	auipc	ra,0x2
    3530:	81e080e7          	jalr	-2018(ra) # 4d4a <malloc>
    if(m1 == 0){
    3534:	c911                	beqz	a0,3548 <mem+0x7e>
    free(m1);
    3536:	00001097          	auipc	ra,0x1
    353a:	792080e7          	jalr	1938(ra) # 4cc8 <free>
    exit(0);
    353e:	4501                	li	a0,0
    3540:	00001097          	auipc	ra,0x1
    3544:	3c4080e7          	jalr	964(ra) # 4904 <exit>
      printf("couldn't allocate mem?!!\n", s);
    3548:	85ce                	mv	a1,s3
    354a:	00003517          	auipc	a0,0x3
    354e:	d7650513          	addi	a0,a0,-650 # 62c0 <malloc+0x1576>
    3552:	00001097          	auipc	ra,0x1
    3556:	740080e7          	jalr	1856(ra) # 4c92 <printf>
      exit(1);
    355a:	4505                	li	a0,1
    355c:	00001097          	auipc	ra,0x1
    3560:	3a8080e7          	jalr	936(ra) # 4904 <exit>
      exit(0);
    3564:	4501                	li	a0,0
    3566:	00001097          	auipc	ra,0x1
    356a:	39e080e7          	jalr	926(ra) # 4904 <exit>

000000000000356e <sharedfd>:
{
    356e:	7159                	addi	sp,sp,-112
    3570:	f486                	sd	ra,104(sp)
    3572:	f0a2                	sd	s0,96(sp)
    3574:	eca6                	sd	s1,88(sp)
    3576:	e8ca                	sd	s2,80(sp)
    3578:	e4ce                	sd	s3,72(sp)
    357a:	e0d2                	sd	s4,64(sp)
    357c:	fc56                	sd	s5,56(sp)
    357e:	f85a                	sd	s6,48(sp)
    3580:	f45e                	sd	s7,40(sp)
    3582:	f062                	sd	s8,32(sp)
    3584:	1880                	addi	s0,sp,112
    3586:	8aaa                	mv	s5,a0
  remove("sharedfd");
    3588:	00003517          	auipc	a0,0x3
    358c:	d5850513          	addi	a0,a0,-680 # 62e0 <malloc+0x1596>
    3590:	00001097          	auipc	ra,0x1
    3594:	41c080e7          	jalr	1052(ra) # 49ac <remove>
  fd = open("sharedfd", O_CREATE|O_RDWR);
    3598:	20200593          	li	a1,514
    359c:	00003517          	auipc	a0,0x3
    35a0:	d4450513          	addi	a0,a0,-700 # 62e0 <malloc+0x1596>
    35a4:	00001097          	auipc	ra,0x1
    35a8:	3a0080e7          	jalr	928(ra) # 4944 <open>
  if(fd < 0){
    35ac:	04054b63          	bltz	a0,3602 <sharedfd+0x94>
    35b0:	892a                	mv	s2,a0
  pid = fork();
    35b2:	00001097          	auipc	ra,0x1
    35b6:	34a080e7          	jalr	842(ra) # 48fc <fork>
    35ba:	8a2a                	mv	s4,a0
  memset(buf, pid==0?'c':'p', sizeof(buf));
    35bc:	06300593          	li	a1,99
    35c0:	c119                	beqz	a0,35c6 <sharedfd+0x58>
    35c2:	07000593          	li	a1,112
    35c6:	4629                	li	a2,10
    35c8:	fa040513          	addi	a0,s0,-96
    35cc:	00001097          	auipc	ra,0x1
    35d0:	120080e7          	jalr	288(ra) # 46ec <memset>
    35d4:	3e800493          	li	s1,1000
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
    35d8:	fa040993          	addi	s3,s0,-96
    35dc:	4629                	li	a2,10
    35de:	85ce                	mv	a1,s3
    35e0:	854a                	mv	a0,s2
    35e2:	00001097          	auipc	ra,0x1
    35e6:	342080e7          	jalr	834(ra) # 4924 <write>
    35ea:	47a9                	li	a5,10
    35ec:	02f51963          	bne	a0,a5,361e <sharedfd+0xb0>
  for(i = 0; i < N; i++){
    35f0:	34fd                	addiw	s1,s1,-1
    35f2:	f4ed                	bnez	s1,35dc <sharedfd+0x6e>
  if(pid == 0) {
    35f4:	040a1363          	bnez	s4,363a <sharedfd+0xcc>
    exit(0);
    35f8:	4501                	li	a0,0
    35fa:	00001097          	auipc	ra,0x1
    35fe:	30a080e7          	jalr	778(ra) # 4904 <exit>
    printf("%s: cannot open sharedfd for writing", s);
    3602:	85d6                	mv	a1,s5
    3604:	00003517          	auipc	a0,0x3
    3608:	cec50513          	addi	a0,a0,-788 # 62f0 <malloc+0x15a6>
    360c:	00001097          	auipc	ra,0x1
    3610:	686080e7          	jalr	1670(ra) # 4c92 <printf>
    exit(1);
    3614:	4505                	li	a0,1
    3616:	00001097          	auipc	ra,0x1
    361a:	2ee080e7          	jalr	750(ra) # 4904 <exit>
      printf("%s: write sharedfd failed\n", s);
    361e:	85d6                	mv	a1,s5
    3620:	00003517          	auipc	a0,0x3
    3624:	cf850513          	addi	a0,a0,-776 # 6318 <malloc+0x15ce>
    3628:	00001097          	auipc	ra,0x1
    362c:	66a080e7          	jalr	1642(ra) # 4c92 <printf>
      exit(1);
    3630:	4505                	li	a0,1
    3632:	00001097          	auipc	ra,0x1
    3636:	2d2080e7          	jalr	722(ra) # 4904 <exit>
    wait(&xstatus);
    363a:	f9c40513          	addi	a0,s0,-100
    363e:	00001097          	auipc	ra,0x1
    3642:	2ce080e7          	jalr	718(ra) # 490c <wait>
    if(xstatus != 0)
    3646:	f9c42983          	lw	s3,-100(s0)
    364a:	00098763          	beqz	s3,3658 <sharedfd+0xea>
      exit(xstatus);
    364e:	854e                	mv	a0,s3
    3650:	00001097          	auipc	ra,0x1
    3654:	2b4080e7          	jalr	692(ra) # 4904 <exit>
  close(fd);
    3658:	854a                	mv	a0,s2
    365a:	00001097          	auipc	ra,0x1
    365e:	2d2080e7          	jalr	722(ra) # 492c <close>
  fd = open("sharedfd", 0);
    3662:	4581                	li	a1,0
    3664:	00003517          	auipc	a0,0x3
    3668:	c7c50513          	addi	a0,a0,-900 # 62e0 <malloc+0x1596>
    366c:	00001097          	auipc	ra,0x1
    3670:	2d8080e7          	jalr	728(ra) # 4944 <open>
    3674:	8baa                	mv	s7,a0
  nc = np = 0;
    3676:	8a4e                	mv	s4,s3
  if(fd < 0){
    3678:	02054663          	bltz	a0,36a4 <sharedfd+0x136>
  while((n = read(fd, buf, sizeof(buf))) > 0){
    367c:	fa040c13          	addi	s8,s0,-96
    3680:	faa40913          	addi	s2,s0,-86
      if(buf[i] == 'c')
    3684:	06300493          	li	s1,99
      if(buf[i] == 'p')
    3688:	07000b13          	li	s6,112
  while((n = read(fd, buf, sizeof(buf))) > 0){
    368c:	4629                	li	a2,10
    368e:	85e2                	mv	a1,s8
    3690:	855e                	mv	a0,s7
    3692:	00001097          	auipc	ra,0x1
    3696:	28a080e7          	jalr	650(ra) # 491c <read>
    369a:	02a05f63          	blez	a0,36d8 <sharedfd+0x16a>
    369e:	fa040793          	addi	a5,s0,-96
    36a2:	a01d                	j	36c8 <sharedfd+0x15a>
    printf("%s: cannot open sharedfd for reading\n", s);
    36a4:	85d6                	mv	a1,s5
    36a6:	00003517          	auipc	a0,0x3
    36aa:	c9250513          	addi	a0,a0,-878 # 6338 <malloc+0x15ee>
    36ae:	00001097          	auipc	ra,0x1
    36b2:	5e4080e7          	jalr	1508(ra) # 4c92 <printf>
    exit(1);
    36b6:	4505                	li	a0,1
    36b8:	00001097          	auipc	ra,0x1
    36bc:	24c080e7          	jalr	588(ra) # 4904 <exit>
        nc++;
    36c0:	2985                	addiw	s3,s3,1
    for(i = 0; i < sizeof(buf); i++){
    36c2:	0785                	addi	a5,a5,1
    36c4:	fd2784e3          	beq	a5,s2,368c <sharedfd+0x11e>
      if(buf[i] == 'c')
    36c8:	0007c703          	lbu	a4,0(a5)
    36cc:	fe970ae3          	beq	a4,s1,36c0 <sharedfd+0x152>
      if(buf[i] == 'p')
    36d0:	ff6719e3          	bne	a4,s6,36c2 <sharedfd+0x154>
        np++;
    36d4:	2a05                	addiw	s4,s4,1
    36d6:	b7f5                	j	36c2 <sharedfd+0x154>
  close(fd);
    36d8:	855e                	mv	a0,s7
    36da:	00001097          	auipc	ra,0x1
    36de:	252080e7          	jalr	594(ra) # 492c <close>
  remove("sharedfd");
    36e2:	00003517          	auipc	a0,0x3
    36e6:	bfe50513          	addi	a0,a0,-1026 # 62e0 <malloc+0x1596>
    36ea:	00001097          	auipc	ra,0x1
    36ee:	2c2080e7          	jalr	706(ra) # 49ac <remove>
  if(nc == N*SZ && np == N*SZ){
    36f2:	6789                	lui	a5,0x2
    36f4:	71078793          	addi	a5,a5,1808 # 2710 <subdir+0x1ba>
    36f8:	00f99763          	bne	s3,a5,3706 <sharedfd+0x198>
    36fc:	6789                	lui	a5,0x2
    36fe:	71078793          	addi	a5,a5,1808 # 2710 <subdir+0x1ba>
    3702:	02fa0063          	beq	s4,a5,3722 <sharedfd+0x1b4>
    printf("%s: nc/np test fails\n", s);
    3706:	85d6                	mv	a1,s5
    3708:	00003517          	auipc	a0,0x3
    370c:	c5850513          	addi	a0,a0,-936 # 6360 <malloc+0x1616>
    3710:	00001097          	auipc	ra,0x1
    3714:	582080e7          	jalr	1410(ra) # 4c92 <printf>
    exit(1);
    3718:	4505                	li	a0,1
    371a:	00001097          	auipc	ra,0x1
    371e:	1ea080e7          	jalr	490(ra) # 4904 <exit>
    exit(0);
    3722:	4501                	li	a0,0
    3724:	00001097          	auipc	ra,0x1
    3728:	1e0080e7          	jalr	480(ra) # 4904 <exit>

000000000000372c <fourfiles>:
{
    372c:	7171                	addi	sp,sp,-176
    372e:	f506                	sd	ra,168(sp)
    3730:	f122                	sd	s0,160(sp)
    3732:	ed26                	sd	s1,152(sp)
    3734:	e94a                	sd	s2,144(sp)
    3736:	e54e                	sd	s3,136(sp)
    3738:	e152                	sd	s4,128(sp)
    373a:	fcd6                	sd	s5,120(sp)
    373c:	f8da                	sd	s6,112(sp)
    373e:	f4de                	sd	s7,104(sp)
    3740:	f0e2                	sd	s8,96(sp)
    3742:	ece6                	sd	s9,88(sp)
    3744:	e8ea                	sd	s10,80(sp)
    3746:	e4ee                	sd	s11,72(sp)
    3748:	1900                	addi	s0,sp,176
    374a:	f4a43c23          	sd	a0,-168(s0)
  char *names[] = { "f0", "f1", "f2", "f3" };
    374e:	00003797          	auipc	a5,0x3
    3752:	c2a78793          	addi	a5,a5,-982 # 6378 <malloc+0x162e>
    3756:	f6f43823          	sd	a5,-144(s0)
    375a:	00003797          	auipc	a5,0x3
    375e:	c2678793          	addi	a5,a5,-986 # 6380 <malloc+0x1636>
    3762:	f6f43c23          	sd	a5,-136(s0)
    3766:	00003797          	auipc	a5,0x3
    376a:	c2278793          	addi	a5,a5,-990 # 6388 <malloc+0x163e>
    376e:	f8f43023          	sd	a5,-128(s0)
    3772:	00003797          	auipc	a5,0x3
    3776:	c1e78793          	addi	a5,a5,-994 # 6390 <malloc+0x1646>
    377a:	f8f43423          	sd	a5,-120(s0)
  for(pi = 0; pi < NCHILD; pi++){
    377e:	f7040c93          	addi	s9,s0,-144
  char *names[] = { "f0", "f1", "f2", "f3" };
    3782:	8966                	mv	s2,s9
  for(pi = 0; pi < NCHILD; pi++){
    3784:	4481                	li	s1,0
    3786:	4a11                	li	s4,4
    fname = names[pi];
    3788:	00093983          	ld	s3,0(s2)
    remove(fname);
    378c:	854e                	mv	a0,s3
    378e:	00001097          	auipc	ra,0x1
    3792:	21e080e7          	jalr	542(ra) # 49ac <remove>
    pid = fork();
    3796:	00001097          	auipc	ra,0x1
    379a:	166080e7          	jalr	358(ra) # 48fc <fork>
    if(pid < 0){
    379e:	04054a63          	bltz	a0,37f2 <fourfiles+0xc6>
    if(pid == 0){
    37a2:	c53d                	beqz	a0,3810 <fourfiles+0xe4>
  for(pi = 0; pi < NCHILD; pi++){
    37a4:	2485                	addiw	s1,s1,1
    37a6:	0921                	addi	s2,s2,8
    37a8:	ff4490e3          	bne	s1,s4,3788 <fourfiles+0x5c>
    37ac:	4491                	li	s1,4
    wait(&xstatus);
    37ae:	f6c40913          	addi	s2,s0,-148
    37b2:	854a                	mv	a0,s2
    37b4:	00001097          	auipc	ra,0x1
    37b8:	158080e7          	jalr	344(ra) # 490c <wait>
    if(xstatus != 0)
    37bc:	f6c42b83          	lw	s7,-148(s0)
    37c0:	0e0b9363          	bnez	s7,38a6 <fourfiles+0x17a>
  for(pi = 0; pi < NCHILD; pi++){
    37c4:	34fd                	addiw	s1,s1,-1
    37c6:	f4f5                	bnez	s1,37b2 <fourfiles+0x86>
    37c8:	03000c13          	li	s8,48
    while((n = read(fd, buf, sizeof(buf))) > 0){
    37cc:	6a09                	lui	s4,0x2
    37ce:	800a0a13          	addi	s4,s4,-2048 # 1800 <forkfork+0x42>
    37d2:	00007a97          	auipc	s5,0x7
    37d6:	08ea8a93          	addi	s5,s5,142 # a860 <buf>
    37da:	00007b17          	auipc	s6,0x7
    37de:	087b0b13          	addi	s6,s6,135 # a861 <buf+0x1>
    if(total != N*SZ){
    37e2:	6785                	lui	a5,0x1
    37e4:	77078793          	addi	a5,a5,1904 # 1770 <twochildren+0x4c>
    37e8:	f4f43823          	sd	a5,-176(s0)
  for(i = 0; i < NCHILD; i++){
    37ec:	03400d93          	li	s11,52
    37f0:	aa2d                	j	392a <fourfiles+0x1fe>
      printf("fork failed\n", s);
    37f2:	f5843583          	ld	a1,-168(s0)
    37f6:	00002517          	auipc	a0,0x2
    37fa:	0c250513          	addi	a0,a0,194 # 58b8 <malloc+0xb6e>
    37fe:	00001097          	auipc	ra,0x1
    3802:	494080e7          	jalr	1172(ra) # 4c92 <printf>
      exit(1);
    3806:	4505                	li	a0,1
    3808:	00001097          	auipc	ra,0x1
    380c:	0fc080e7          	jalr	252(ra) # 4904 <exit>
      fd = open(fname, O_CREATE | O_RDWR);
    3810:	20200593          	li	a1,514
    3814:	854e                	mv	a0,s3
    3816:	00001097          	auipc	ra,0x1
    381a:	12e080e7          	jalr	302(ra) # 4944 <open>
    381e:	892a                	mv	s2,a0
      if(fd < 0){
    3820:	04054763          	bltz	a0,386e <fourfiles+0x142>
      memset(buf, '0'+pi, SZ);
    3824:	1f400613          	li	a2,500
    3828:	0304859b          	addiw	a1,s1,48
    382c:	00007517          	auipc	a0,0x7
    3830:	03450513          	addi	a0,a0,52 # a860 <buf>
    3834:	00001097          	auipc	ra,0x1
    3838:	eb8080e7          	jalr	-328(ra) # 46ec <memset>
    383c:	44b1                	li	s1,12
        if((n = write(fd, buf, SZ)) != SZ){
    383e:	00007997          	auipc	s3,0x7
    3842:	02298993          	addi	s3,s3,34 # a860 <buf>
    3846:	1f400613          	li	a2,500
    384a:	85ce                	mv	a1,s3
    384c:	854a                	mv	a0,s2
    384e:	00001097          	auipc	ra,0x1
    3852:	0d6080e7          	jalr	214(ra) # 4924 <write>
    3856:	85aa                	mv	a1,a0
    3858:	1f400793          	li	a5,500
    385c:	02f51863          	bne	a0,a5,388c <fourfiles+0x160>
      for(i = 0; i < N; i++){
    3860:	34fd                	addiw	s1,s1,-1
    3862:	f0f5                	bnez	s1,3846 <fourfiles+0x11a>
      exit(0);
    3864:	4501                	li	a0,0
    3866:	00001097          	auipc	ra,0x1
    386a:	09e080e7          	jalr	158(ra) # 4904 <exit>
        printf("create failed\n", s);
    386e:	f5843583          	ld	a1,-168(s0)
    3872:	00003517          	auipc	a0,0x3
    3876:	b2650513          	addi	a0,a0,-1242 # 6398 <malloc+0x164e>
    387a:	00001097          	auipc	ra,0x1
    387e:	418080e7          	jalr	1048(ra) # 4c92 <printf>
        exit(1);
    3882:	4505                	li	a0,1
    3884:	00001097          	auipc	ra,0x1
    3888:	080080e7          	jalr	128(ra) # 4904 <exit>
          printf("write failed %d\n", n);
    388c:	00003517          	auipc	a0,0x3
    3890:	b1c50513          	addi	a0,a0,-1252 # 63a8 <malloc+0x165e>
    3894:	00001097          	auipc	ra,0x1
    3898:	3fe080e7          	jalr	1022(ra) # 4c92 <printf>
          exit(1);
    389c:	4505                	li	a0,1
    389e:	00001097          	auipc	ra,0x1
    38a2:	066080e7          	jalr	102(ra) # 4904 <exit>
      exit(xstatus);
    38a6:	855e                	mv	a0,s7
    38a8:	00001097          	auipc	ra,0x1
    38ac:	05c080e7          	jalr	92(ra) # 4904 <exit>
          printf("wrong char\n", s);
    38b0:	f5843583          	ld	a1,-168(s0)
    38b4:	00003517          	auipc	a0,0x3
    38b8:	b0c50513          	addi	a0,a0,-1268 # 63c0 <malloc+0x1676>
    38bc:	00001097          	auipc	ra,0x1
    38c0:	3d6080e7          	jalr	982(ra) # 4c92 <printf>
          exit(1);
    38c4:	4505                	li	a0,1
    38c6:	00001097          	auipc	ra,0x1
    38ca:	03e080e7          	jalr	62(ra) # 4904 <exit>
      total += n;
    38ce:	00a9093b          	addw	s2,s2,a0
    while((n = read(fd, buf, sizeof(buf))) > 0){
    38d2:	8652                	mv	a2,s4
    38d4:	85d6                	mv	a1,s5
    38d6:	854e                	mv	a0,s3
    38d8:	00001097          	auipc	ra,0x1
    38dc:	044080e7          	jalr	68(ra) # 491c <read>
    38e0:	02a05363          	blez	a0,3906 <fourfiles+0x1da>
    38e4:	00007797          	auipc	a5,0x7
    38e8:	f7c78793          	addi	a5,a5,-132 # a860 <buf>
    38ec:	fff5069b          	addiw	a3,a0,-1
    38f0:	1682                	slli	a3,a3,0x20
    38f2:	9281                	srli	a3,a3,0x20
    38f4:	96da                	add	a3,a3,s6
        if(buf[j] != '0'+i){
    38f6:	0007c703          	lbu	a4,0(a5)
    38fa:	fa971be3          	bne	a4,s1,38b0 <fourfiles+0x184>
      for(j = 0; j < n; j++){
    38fe:	0785                	addi	a5,a5,1
    3900:	fed79be3          	bne	a5,a3,38f6 <fourfiles+0x1ca>
    3904:	b7e9                	j	38ce <fourfiles+0x1a2>
    close(fd);
    3906:	854e                	mv	a0,s3
    3908:	00001097          	auipc	ra,0x1
    390c:	024080e7          	jalr	36(ra) # 492c <close>
    if(total != N*SZ){
    3910:	f5043783          	ld	a5,-176(s0)
    3914:	02f91863          	bne	s2,a5,3944 <fourfiles+0x218>
    remove(fname);
    3918:	856a                	mv	a0,s10
    391a:	00001097          	auipc	ra,0x1
    391e:	092080e7          	jalr	146(ra) # 49ac <remove>
  for(i = 0; i < NCHILD; i++){
    3922:	0ca1                	addi	s9,s9,8
    3924:	2c05                	addiw	s8,s8,1
    3926:	03bc0d63          	beq	s8,s11,3960 <fourfiles+0x234>
    fname = names[i];
    392a:	000cbd03          	ld	s10,0(s9)
    fd = open(fname, 0);
    392e:	4581                	li	a1,0
    3930:	856a                	mv	a0,s10
    3932:	00001097          	auipc	ra,0x1
    3936:	012080e7          	jalr	18(ra) # 4944 <open>
    393a:	89aa                	mv	s3,a0
    total = 0;
    393c:	895e                	mv	s2,s7
        if(buf[j] != '0'+i){
    393e:	000c049b          	sext.w	s1,s8
    while((n = read(fd, buf, sizeof(buf))) > 0){
    3942:	bf41                	j	38d2 <fourfiles+0x1a6>
      printf("wrong length %d\n", total);
    3944:	85ca                	mv	a1,s2
    3946:	00003517          	auipc	a0,0x3
    394a:	a8a50513          	addi	a0,a0,-1398 # 63d0 <malloc+0x1686>
    394e:	00001097          	auipc	ra,0x1
    3952:	344080e7          	jalr	836(ra) # 4c92 <printf>
      exit(1);
    3956:	4505                	li	a0,1
    3958:	00001097          	auipc	ra,0x1
    395c:	fac080e7          	jalr	-84(ra) # 4904 <exit>
}
    3960:	70aa                	ld	ra,168(sp)
    3962:	740a                	ld	s0,160(sp)
    3964:	64ea                	ld	s1,152(sp)
    3966:	694a                	ld	s2,144(sp)
    3968:	69aa                	ld	s3,136(sp)
    396a:	6a0a                	ld	s4,128(sp)
    396c:	7ae6                	ld	s5,120(sp)
    396e:	7b46                	ld	s6,112(sp)
    3970:	7ba6                	ld	s7,104(sp)
    3972:	7c06                	ld	s8,96(sp)
    3974:	6ce6                	ld	s9,88(sp)
    3976:	6d46                	ld	s10,80(sp)
    3978:	6da6                	ld	s11,72(sp)
    397a:	614d                	addi	sp,sp,176
    397c:	8082                	ret

000000000000397e <bigfile>:
{
    397e:	7139                	addi	sp,sp,-64
    3980:	fc06                	sd	ra,56(sp)
    3982:	f822                	sd	s0,48(sp)
    3984:	f426                	sd	s1,40(sp)
    3986:	f04a                	sd	s2,32(sp)
    3988:	ec4e                	sd	s3,24(sp)
    398a:	e852                	sd	s4,16(sp)
    398c:	e456                	sd	s5,8(sp)
    398e:	0080                	addi	s0,sp,64
    3990:	8aaa                	mv	s5,a0
  remove("bigfile.dat");
    3992:	00003517          	auipc	a0,0x3
    3996:	a5650513          	addi	a0,a0,-1450 # 63e8 <malloc+0x169e>
    399a:	00001097          	auipc	ra,0x1
    399e:	012080e7          	jalr	18(ra) # 49ac <remove>
  fd = open("bigfile.dat", O_CREATE | O_RDWR);
    39a2:	20200593          	li	a1,514
    39a6:	00003517          	auipc	a0,0x3
    39aa:	a4250513          	addi	a0,a0,-1470 # 63e8 <malloc+0x169e>
    39ae:	00001097          	auipc	ra,0x1
    39b2:	f96080e7          	jalr	-106(ra) # 4944 <open>
    39b6:	89aa                	mv	s3,a0
  for(i = 0; i < N; i++){
    39b8:	4481                	li	s1,0
    memset(buf, i, SZ);
    39ba:	00007917          	auipc	s2,0x7
    39be:	ea690913          	addi	s2,s2,-346 # a860 <buf>
  for(i = 0; i < N; i++){
    39c2:	4a51                	li	s4,20
  if(fd < 0){
    39c4:	0a054063          	bltz	a0,3a64 <bigfile+0xe6>
    memset(buf, i, SZ);
    39c8:	25800613          	li	a2,600
    39cc:	85a6                	mv	a1,s1
    39ce:	854a                	mv	a0,s2
    39d0:	00001097          	auipc	ra,0x1
    39d4:	d1c080e7          	jalr	-740(ra) # 46ec <memset>
    if(write(fd, buf, SZ) != SZ){
    39d8:	25800613          	li	a2,600
    39dc:	85ca                	mv	a1,s2
    39de:	854e                	mv	a0,s3
    39e0:	00001097          	auipc	ra,0x1
    39e4:	f44080e7          	jalr	-188(ra) # 4924 <write>
    39e8:	25800793          	li	a5,600
    39ec:	08f51a63          	bne	a0,a5,3a80 <bigfile+0x102>
  for(i = 0; i < N; i++){
    39f0:	2485                	addiw	s1,s1,1
    39f2:	fd449be3          	bne	s1,s4,39c8 <bigfile+0x4a>
  close(fd);
    39f6:	854e                	mv	a0,s3
    39f8:	00001097          	auipc	ra,0x1
    39fc:	f34080e7          	jalr	-204(ra) # 492c <close>
  fd = open("bigfile.dat", 0);
    3a00:	4581                	li	a1,0
    3a02:	00003517          	auipc	a0,0x3
    3a06:	9e650513          	addi	a0,a0,-1562 # 63e8 <malloc+0x169e>
    3a0a:	00001097          	auipc	ra,0x1
    3a0e:	f3a080e7          	jalr	-198(ra) # 4944 <open>
    3a12:	8a2a                	mv	s4,a0
  total = 0;
    3a14:	4981                	li	s3,0
  for(i = 0; ; i++){
    3a16:	4481                	li	s1,0
    cc = read(fd, buf, SZ/2);
    3a18:	00007917          	auipc	s2,0x7
    3a1c:	e4890913          	addi	s2,s2,-440 # a860 <buf>
  if(fd < 0){
    3a20:	06054e63          	bltz	a0,3a9c <bigfile+0x11e>
    cc = read(fd, buf, SZ/2);
    3a24:	12c00613          	li	a2,300
    3a28:	85ca                	mv	a1,s2
    3a2a:	8552                	mv	a0,s4
    3a2c:	00001097          	auipc	ra,0x1
    3a30:	ef0080e7          	jalr	-272(ra) # 491c <read>
    if(cc < 0){
    3a34:	08054263          	bltz	a0,3ab8 <bigfile+0x13a>
    if(cc == 0)
    3a38:	c971                	beqz	a0,3b0c <bigfile+0x18e>
    if(cc != SZ/2){
    3a3a:	12c00793          	li	a5,300
    3a3e:	08f51b63          	bne	a0,a5,3ad4 <bigfile+0x156>
    if(buf[0] != i/2 || buf[SZ/2-1] != i/2){
    3a42:	01f4d79b          	srliw	a5,s1,0x1f
    3a46:	9fa5                	addw	a5,a5,s1
    3a48:	4017d79b          	sraiw	a5,a5,0x1
    3a4c:	00094703          	lbu	a4,0(s2)
    3a50:	0af71063          	bne	a4,a5,3af0 <bigfile+0x172>
    3a54:	12b94703          	lbu	a4,299(s2)
    3a58:	08f71c63          	bne	a4,a5,3af0 <bigfile+0x172>
    total += cc;
    3a5c:	12c9899b          	addiw	s3,s3,300
  for(i = 0; ; i++){
    3a60:	2485                	addiw	s1,s1,1
    cc = read(fd, buf, SZ/2);
    3a62:	b7c9                	j	3a24 <bigfile+0xa6>
    printf("%s: cannot create bigfile", s);
    3a64:	85d6                	mv	a1,s5
    3a66:	00003517          	auipc	a0,0x3
    3a6a:	99250513          	addi	a0,a0,-1646 # 63f8 <malloc+0x16ae>
    3a6e:	00001097          	auipc	ra,0x1
    3a72:	224080e7          	jalr	548(ra) # 4c92 <printf>
    exit(1);
    3a76:	4505                	li	a0,1
    3a78:	00001097          	auipc	ra,0x1
    3a7c:	e8c080e7          	jalr	-372(ra) # 4904 <exit>
      printf("%s: write bigfile failed\n", s);
    3a80:	85d6                	mv	a1,s5
    3a82:	00003517          	auipc	a0,0x3
    3a86:	99650513          	addi	a0,a0,-1642 # 6418 <malloc+0x16ce>
    3a8a:	00001097          	auipc	ra,0x1
    3a8e:	208080e7          	jalr	520(ra) # 4c92 <printf>
      exit(1);
    3a92:	4505                	li	a0,1
    3a94:	00001097          	auipc	ra,0x1
    3a98:	e70080e7          	jalr	-400(ra) # 4904 <exit>
    printf("%s: cannot open bigfile\n", s);
    3a9c:	85d6                	mv	a1,s5
    3a9e:	00003517          	auipc	a0,0x3
    3aa2:	99a50513          	addi	a0,a0,-1638 # 6438 <malloc+0x16ee>
    3aa6:	00001097          	auipc	ra,0x1
    3aaa:	1ec080e7          	jalr	492(ra) # 4c92 <printf>
    exit(1);
    3aae:	4505                	li	a0,1
    3ab0:	00001097          	auipc	ra,0x1
    3ab4:	e54080e7          	jalr	-428(ra) # 4904 <exit>
      printf("%s: read bigfile failed\n", s);
    3ab8:	85d6                	mv	a1,s5
    3aba:	00003517          	auipc	a0,0x3
    3abe:	99e50513          	addi	a0,a0,-1634 # 6458 <malloc+0x170e>
    3ac2:	00001097          	auipc	ra,0x1
    3ac6:	1d0080e7          	jalr	464(ra) # 4c92 <printf>
      exit(1);
    3aca:	4505                	li	a0,1
    3acc:	00001097          	auipc	ra,0x1
    3ad0:	e38080e7          	jalr	-456(ra) # 4904 <exit>
      printf("%s: short read bigfile\n", s);
    3ad4:	85d6                	mv	a1,s5
    3ad6:	00003517          	auipc	a0,0x3
    3ada:	9a250513          	addi	a0,a0,-1630 # 6478 <malloc+0x172e>
    3ade:	00001097          	auipc	ra,0x1
    3ae2:	1b4080e7          	jalr	436(ra) # 4c92 <printf>
      exit(1);
    3ae6:	4505                	li	a0,1
    3ae8:	00001097          	auipc	ra,0x1
    3aec:	e1c080e7          	jalr	-484(ra) # 4904 <exit>
      printf("%s: read bigfile wrong data\n", s);
    3af0:	85d6                	mv	a1,s5
    3af2:	00003517          	auipc	a0,0x3
    3af6:	99e50513          	addi	a0,a0,-1634 # 6490 <malloc+0x1746>
    3afa:	00001097          	auipc	ra,0x1
    3afe:	198080e7          	jalr	408(ra) # 4c92 <printf>
      exit(1);
    3b02:	4505                	li	a0,1
    3b04:	00001097          	auipc	ra,0x1
    3b08:	e00080e7          	jalr	-512(ra) # 4904 <exit>
  close(fd);
    3b0c:	8552                	mv	a0,s4
    3b0e:	00001097          	auipc	ra,0x1
    3b12:	e1e080e7          	jalr	-482(ra) # 492c <close>
  if(total != N*SZ){
    3b16:	678d                	lui	a5,0x3
    3b18:	ee078793          	addi	a5,a5,-288 # 2ee0 <iref+0x114>
    3b1c:	02f99363          	bne	s3,a5,3b42 <bigfile+0x1c4>
  remove("bigfile.dat");
    3b20:	00003517          	auipc	a0,0x3
    3b24:	8c850513          	addi	a0,a0,-1848 # 63e8 <malloc+0x169e>
    3b28:	00001097          	auipc	ra,0x1
    3b2c:	e84080e7          	jalr	-380(ra) # 49ac <remove>
}
    3b30:	70e2                	ld	ra,56(sp)
    3b32:	7442                	ld	s0,48(sp)
    3b34:	74a2                	ld	s1,40(sp)
    3b36:	7902                	ld	s2,32(sp)
    3b38:	69e2                	ld	s3,24(sp)
    3b3a:	6a42                	ld	s4,16(sp)
    3b3c:	6aa2                	ld	s5,8(sp)
    3b3e:	6121                	addi	sp,sp,64
    3b40:	8082                	ret
    printf("%s: read bigfile wrong total\n", s);
    3b42:	85d6                	mv	a1,s5
    3b44:	00003517          	auipc	a0,0x3
    3b48:	96c50513          	addi	a0,a0,-1684 # 64b0 <malloc+0x1766>
    3b4c:	00001097          	auipc	ra,0x1
    3b50:	146080e7          	jalr	326(ra) # 4c92 <printf>
    exit(1);
    3b54:	4505                	li	a0,1
    3b56:	00001097          	auipc	ra,0x1
    3b5a:	dae080e7          	jalr	-594(ra) # 4904 <exit>

0000000000003b5e <createdelete>:
{
    3b5e:	7171                	addi	sp,sp,-176
    3b60:	f506                	sd	ra,168(sp)
    3b62:	f122                	sd	s0,160(sp)
    3b64:	ed26                	sd	s1,152(sp)
    3b66:	e94a                	sd	s2,144(sp)
    3b68:	e54e                	sd	s3,136(sp)
    3b6a:	e152                	sd	s4,128(sp)
    3b6c:	fcd6                	sd	s5,120(sp)
    3b6e:	f8da                	sd	s6,112(sp)
    3b70:	f4de                	sd	s7,104(sp)
    3b72:	f0e2                	sd	s8,96(sp)
    3b74:	ece6                	sd	s9,88(sp)
    3b76:	e8ea                	sd	s10,80(sp)
    3b78:	e4ee                	sd	s11,72(sp)
    3b7a:	1900                	addi	s0,sp,176
    3b7c:	8daa                	mv	s11,a0
  char illegal[] = { '\"', '*', '/', ':', '<', '>', '?', '\\', '|', 0 };
    3b7e:	00003797          	auipc	a5,0x3
    3b82:	9ba78793          	addi	a5,a5,-1606 # 6538 <malloc+0x17ee>
    3b86:	6398                	ld	a4,0(a5)
    3b88:	f6e43023          	sd	a4,-160(s0)
    3b8c:	0087d783          	lhu	a5,8(a5)
    3b90:	f6f41423          	sh	a5,-152(s0)
  for(pi = 0; pi < NCHILD; pi++){
    3b94:	4901                	li	s2,0
    3b96:	4991                	li	s3,4
    pid = fork();
    3b98:	00001097          	auipc	ra,0x1
    3b9c:	d64080e7          	jalr	-668(ra) # 48fc <fork>
    3ba0:	84aa                	mv	s1,a0
    if(pid < 0){
    3ba2:	04054263          	bltz	a0,3be6 <createdelete+0x88>
    if(pid == 0){
    3ba6:	cd31                	beqz	a0,3c02 <createdelete+0xa4>
  for(pi = 0; pi < NCHILD; pi++){
    3ba8:	2905                	addiw	s2,s2,1
    3baa:	ff3917e3          	bne	s2,s3,3b98 <createdelete+0x3a>
    3bae:	4491                	li	s1,4
    wait(&xstatus);
    3bb0:	f5c40913          	addi	s2,s0,-164
    3bb4:	854a                	mv	a0,s2
    3bb6:	00001097          	auipc	ra,0x1
    3bba:	d56080e7          	jalr	-682(ra) # 490c <wait>
    if(xstatus != 0)
    3bbe:	f5c42983          	lw	s3,-164(s0)
    3bc2:	10099963          	bnez	s3,3cd4 <createdelete+0x176>
  for(pi = 0; pi < NCHILD; pi++){
    3bc6:	34fd                	addiw	s1,s1,-1
    3bc8:	f4f5                	bnez	s1,3bb4 <createdelete+0x56>
  name[0] = name[1] = name[2] = 0;
    3bca:	f6040923          	sb	zero,-142(s0)
    3bce:	03000913          	li	s2,48
    3bd2:	5b7d                	li	s6,-1
    3bd4:	07000c93          	li	s9,112
      if (strchr(illegal, name[1]) != 0) { continue; }
    3bd8:	f6040a93          	addi	s5,s0,-160
      fd = open(name, 0);
    3bdc:	f7040c13          	addi	s8,s0,-144
      } else if((i >= 1 && i < N/2) && fd >= 0){
    3be0:	4ba1                	li	s7,8
      if((i == 0 || i >= N/2) && fd < 0){
    3be2:	4d25                	li	s10,9
    3be4:	aa71                	j	3d80 <createdelete+0x222>
      printf("fork failed\n", s);
    3be6:	85ee                	mv	a1,s11
    3be8:	00002517          	auipc	a0,0x2
    3bec:	cd050513          	addi	a0,a0,-816 # 58b8 <malloc+0xb6e>
    3bf0:	00001097          	auipc	ra,0x1
    3bf4:	0a2080e7          	jalr	162(ra) # 4c92 <printf>
      exit(1);
    3bf8:	4505                	li	a0,1
    3bfa:	00001097          	auipc	ra,0x1
    3bfe:	d0a080e7          	jalr	-758(ra) # 4904 <exit>
      name[0] = 'p' + pi;
    3c02:	0709091b          	addiw	s2,s2,112
    3c06:	f7240823          	sb	s2,-144(s0)
      name[2] = '\0';
    3c0a:	f6040923          	sb	zero,-142(s0)
        if (strchr(illegal, name[1]) == 0) {
    3c0e:	f6040913          	addi	s2,s0,-160
          fd = open(name, O_CREATE | O_RDWR);
    3c12:	f7040a13          	addi	s4,s0,-144
      for(i = 0; i < N; i++){
    3c16:	49d1                	li	s3,20
    3c18:	a091                	j	3c5c <createdelete+0xfe>
          fd = open(name, O_CREATE | O_RDWR);
    3c1a:	20200593          	li	a1,514
    3c1e:	8552                	mv	a0,s4
    3c20:	00001097          	auipc	ra,0x1
    3c24:	d24080e7          	jalr	-732(ra) # 4944 <open>
          if(fd < 0){
    3c28:	00054763          	bltz	a0,3c36 <createdelete+0xd8>
          close(fd);
    3c2c:	00001097          	auipc	ra,0x1
    3c30:	d00080e7          	jalr	-768(ra) # 492c <close>
    3c34:	a081                	j	3c74 <createdelete+0x116>
            printf("%s: create %s failed\n", s, name);
    3c36:	f7040613          	addi	a2,s0,-144
    3c3a:	85ee                	mv	a1,s11
    3c3c:	00003517          	auipc	a0,0x3
    3c40:	89450513          	addi	a0,a0,-1900 # 64d0 <malloc+0x1786>
    3c44:	00001097          	auipc	ra,0x1
    3c48:	04e080e7          	jalr	78(ra) # 4c92 <printf>
            exit(1);
    3c4c:	4505                	li	a0,1
    3c4e:	00001097          	auipc	ra,0x1
    3c52:	cb6080e7          	jalr	-842(ra) # 4904 <exit>
      for(i = 0; i < N; i++){
    3c56:	2485                	addiw	s1,s1,1
    3c58:	07348963          	beq	s1,s3,3cca <createdelete+0x16c>
        name[1] = '0' + i;
    3c5c:	0304859b          	addiw	a1,s1,48
    3c60:	0ff5f593          	zext.b	a1,a1
    3c64:	f6b408a3          	sb	a1,-143(s0)
        if (strchr(illegal, name[1]) == 0) {
    3c68:	854a                	mv	a0,s2
    3c6a:	00001097          	auipc	ra,0x1
    3c6e:	aa4080e7          	jalr	-1372(ra) # 470e <strchr>
    3c72:	d545                	beqz	a0,3c1a <createdelete+0xbc>
        if(i > 0 && (i % 2 ) == 0){
    3c74:	fe9051e3          	blez	s1,3c56 <createdelete+0xf8>
    3c78:	0014f793          	andi	a5,s1,1
    3c7c:	ffe9                	bnez	a5,3c56 <createdelete+0xf8>
          name[1] = '0' + (i / 2);
    3c7e:	01f4d59b          	srliw	a1,s1,0x1f
    3c82:	9da5                	addw	a1,a1,s1
    3c84:	4015d59b          	sraiw	a1,a1,0x1
    3c88:	0305859b          	addiw	a1,a1,48
    3c8c:	0ff5f593          	zext.b	a1,a1
    3c90:	f6b408a3          	sb	a1,-143(s0)
          if (strchr(illegal, name[1]) == 0) {
    3c94:	854a                	mv	a0,s2
    3c96:	00001097          	auipc	ra,0x1
    3c9a:	a78080e7          	jalr	-1416(ra) # 470e <strchr>
    3c9e:	fd45                	bnez	a0,3c56 <createdelete+0xf8>
            if(remove(name) < 0){
    3ca0:	8552                	mv	a0,s4
    3ca2:	00001097          	auipc	ra,0x1
    3ca6:	d0a080e7          	jalr	-758(ra) # 49ac <remove>
    3caa:	fa0556e3          	bgez	a0,3c56 <createdelete+0xf8>
              printf("%s: remove failed\n", s);
    3cae:	85ee                	mv	a1,s11
    3cb0:	00002517          	auipc	a0,0x2
    3cb4:	54850513          	addi	a0,a0,1352 # 61f8 <malloc+0x14ae>
    3cb8:	00001097          	auipc	ra,0x1
    3cbc:	fda080e7          	jalr	-38(ra) # 4c92 <printf>
              exit(1);
    3cc0:	4505                	li	a0,1
    3cc2:	00001097          	auipc	ra,0x1
    3cc6:	c42080e7          	jalr	-958(ra) # 4904 <exit>
      exit(0);
    3cca:	4501                	li	a0,0
    3ccc:	00001097          	auipc	ra,0x1
    3cd0:	c38080e7          	jalr	-968(ra) # 4904 <exit>
      exit(1);
    3cd4:	4505                	li	a0,1
    3cd6:	00001097          	auipc	ra,0x1
    3cda:	c2e080e7          	jalr	-978(ra) # 4904 <exit>
        printf("%s: oops createdelete %s didn't exist\n", s, name);
    3cde:	f7040613          	addi	a2,s0,-144
    3ce2:	85ee                	mv	a1,s11
    3ce4:	00003517          	auipc	a0,0x3
    3ce8:	80450513          	addi	a0,a0,-2044 # 64e8 <malloc+0x179e>
    3cec:	00001097          	auipc	ra,0x1
    3cf0:	fa6080e7          	jalr	-90(ra) # 4c92 <printf>
        exit(1);
    3cf4:	4505                	li	a0,1
    3cf6:	00001097          	auipc	ra,0x1
    3cfa:	c0e080e7          	jalr	-1010(ra) # 4904 <exit>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    3cfe:	056bf763          	bgeu	s7,s6,3d4c <createdelete+0x1ee>
      if(fd >= 0)
    3d02:	04055063          	bgez	a0,3d42 <createdelete+0x1e4>
    for(pi = 0; pi < NCHILD; pi++){
    3d06:	2485                	addiw	s1,s1,1
    3d08:	0ff4f493          	zext.b	s1,s1
    3d0c:	07448263          	beq	s1,s4,3d70 <createdelete+0x212>
      name[0] = 'p' + pi;
    3d10:	f6940823          	sb	s1,-144(s0)
      name[1] = '0' + i;
    3d14:	f72408a3          	sb	s2,-143(s0)
      if (strchr(illegal, name[1]) != 0) { continue; }
    3d18:	85ca                	mv	a1,s2
    3d1a:	8556                	mv	a0,s5
    3d1c:	00001097          	auipc	ra,0x1
    3d20:	9f2080e7          	jalr	-1550(ra) # 470e <strchr>
    3d24:	f16d                	bnez	a0,3d06 <createdelete+0x1a8>
      fd = open(name, 0);
    3d26:	4581                	li	a1,0
    3d28:	8562                	mv	a0,s8
    3d2a:	00001097          	auipc	ra,0x1
    3d2e:	c1a080e7          	jalr	-998(ra) # 4944 <open>
      if((i == 0 || i >= N/2) && fd < 0){
    3d32:	00098463          	beqz	s3,3d3a <createdelete+0x1dc>
    3d36:	fd3d54e3          	bge	s10,s3,3cfe <createdelete+0x1a0>
    3d3a:	fa0542e3          	bltz	a0,3cde <createdelete+0x180>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    3d3e:	016bf963          	bgeu	s7,s6,3d50 <createdelete+0x1f2>
        close(fd);
    3d42:	00001097          	auipc	ra,0x1
    3d46:	bea080e7          	jalr	-1046(ra) # 492c <close>
    3d4a:	bf75                	j	3d06 <createdelete+0x1a8>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    3d4c:	fa054de3          	bltz	a0,3d06 <createdelete+0x1a8>
        printf("%s: oops createdelete %s did exist\n", s, name);
    3d50:	f7040613          	addi	a2,s0,-144
    3d54:	85ee                	mv	a1,s11
    3d56:	00002517          	auipc	a0,0x2
    3d5a:	7ba50513          	addi	a0,a0,1978 # 6510 <malloc+0x17c6>
    3d5e:	00001097          	auipc	ra,0x1
    3d62:	f34080e7          	jalr	-204(ra) # 4c92 <printf>
        exit(1);
    3d66:	4505                	li	a0,1
    3d68:	00001097          	auipc	ra,0x1
    3d6c:	b9c080e7          	jalr	-1124(ra) # 4904 <exit>
  for(i = 0; i < N; i++){
    3d70:	2985                	addiw	s3,s3,1
    3d72:	2b05                	addiw	s6,s6,1
    3d74:	2905                	addiw	s2,s2,1
    3d76:	0ff97913          	zext.b	s2,s2
    3d7a:	47d1                	li	a5,20
    3d7c:	02f98b63          	beq	s3,a5,3db2 <createdelete+0x254>
    for(pi = 0; pi < NCHILD; pi++){
    3d80:	84e6                	mv	s1,s9
    3d82:	07400a13          	li	s4,116
    3d86:	b769                	j	3d10 <createdelete+0x1b2>
  for(i = 0; i < N; i++){
    3d88:	2905                	addiw	s2,s2,1
    3d8a:	0ff97913          	zext.b	s2,s2
    3d8e:	03590d63          	beq	s2,s5,3dc8 <createdelete+0x26a>
  name[0] = name[1] = name[2] = 0;
    3d92:	84da                	mv	s1,s6
      name[0] = 'p' + pi;
    3d94:	f6940823          	sb	s1,-144(s0)
      name[1] = '0' + i;
    3d98:	f72408a3          	sb	s2,-143(s0)
      remove(name);
    3d9c:	8552                	mv	a0,s4
    3d9e:	00001097          	auipc	ra,0x1
    3da2:	c0e080e7          	jalr	-1010(ra) # 49ac <remove>
    for(pi = 0; pi < NCHILD; pi++){
    3da6:	2485                	addiw	s1,s1,1
    3da8:	0ff4f493          	zext.b	s1,s1
    3dac:	ff3494e3          	bne	s1,s3,3d94 <createdelete+0x236>
    3db0:	bfe1                	j	3d88 <createdelete+0x22a>
    3db2:	03000913          	li	s2,48
  name[0] = name[1] = name[2] = 0;
    3db6:	07000b13          	li	s6,112
      remove(name);
    3dba:	f7040a13          	addi	s4,s0,-144
    for(pi = 0; pi < NCHILD; pi++){
    3dbe:	07400993          	li	s3,116
  for(i = 0; i < N; i++){
    3dc2:	04400a93          	li	s5,68
    3dc6:	b7f1                	j	3d92 <createdelete+0x234>
}
    3dc8:	70aa                	ld	ra,168(sp)
    3dca:	740a                	ld	s0,160(sp)
    3dcc:	64ea                	ld	s1,152(sp)
    3dce:	694a                	ld	s2,144(sp)
    3dd0:	69aa                	ld	s3,136(sp)
    3dd2:	6a0a                	ld	s4,128(sp)
    3dd4:	7ae6                	ld	s5,120(sp)
    3dd6:	7b46                	ld	s6,112(sp)
    3dd8:	7ba6                	ld	s7,104(sp)
    3dda:	7c06                	ld	s8,96(sp)
    3ddc:	6ce6                	ld	s9,88(sp)
    3dde:	6d46                	ld	s10,80(sp)
    3de0:	6da6                	ld	s11,72(sp)
    3de2:	614d                	addi	sp,sp,176
    3de4:	8082                	ret

0000000000003de6 <dirtest>:
{
    3de6:	1101                	addi	sp,sp,-32
    3de8:	ec06                	sd	ra,24(sp)
    3dea:	e822                	sd	s0,16(sp)
    3dec:	e426                	sd	s1,8(sp)
    3dee:	1000                	addi	s0,sp,32
    3df0:	84aa                	mv	s1,a0
  printf("mkdir test\n");
    3df2:	00002517          	auipc	a0,0x2
    3df6:	75650513          	addi	a0,a0,1878 # 6548 <malloc+0x17fe>
    3dfa:	00001097          	auipc	ra,0x1
    3dfe:	e98080e7          	jalr	-360(ra) # 4c92 <printf>
  if(mkdir("dir0") < 0){
    3e02:	00002517          	auipc	a0,0x2
    3e06:	75650513          	addi	a0,a0,1878 # 6558 <malloc+0x180e>
    3e0a:	00001097          	auipc	ra,0x1
    3e0e:	b4a080e7          	jalr	-1206(ra) # 4954 <mkdir>
    3e12:	04054d63          	bltz	a0,3e6c <dirtest+0x86>
  if(chdir("dir0") < 0){
    3e16:	00002517          	auipc	a0,0x2
    3e1a:	74250513          	addi	a0,a0,1858 # 6558 <malloc+0x180e>
    3e1e:	00001097          	auipc	ra,0x1
    3e22:	b3e080e7          	jalr	-1218(ra) # 495c <chdir>
    3e26:	06054163          	bltz	a0,3e88 <dirtest+0xa2>
  if(chdir("..") < 0){
    3e2a:	00002517          	auipc	a0,0x2
    3e2e:	18e50513          	addi	a0,a0,398 # 5fb8 <malloc+0x126e>
    3e32:	00001097          	auipc	ra,0x1
    3e36:	b2a080e7          	jalr	-1238(ra) # 495c <chdir>
    3e3a:	06054563          	bltz	a0,3ea4 <dirtest+0xbe>
  if(remove("dir0") < 0){
    3e3e:	00002517          	auipc	a0,0x2
    3e42:	71a50513          	addi	a0,a0,1818 # 6558 <malloc+0x180e>
    3e46:	00001097          	auipc	ra,0x1
    3e4a:	b66080e7          	jalr	-1178(ra) # 49ac <remove>
    3e4e:	06054963          	bltz	a0,3ec0 <dirtest+0xda>
  printf("%s: mkdir test ok\n");
    3e52:	00002517          	auipc	a0,0x2
    3e56:	75650513          	addi	a0,a0,1878 # 65a8 <malloc+0x185e>
    3e5a:	00001097          	auipc	ra,0x1
    3e5e:	e38080e7          	jalr	-456(ra) # 4c92 <printf>
}
    3e62:	60e2                	ld	ra,24(sp)
    3e64:	6442                	ld	s0,16(sp)
    3e66:	64a2                	ld	s1,8(sp)
    3e68:	6105                	addi	sp,sp,32
    3e6a:	8082                	ret
    printf("%s: mkdir failed\n", s);
    3e6c:	85a6                	mv	a1,s1
    3e6e:	00002517          	auipc	a0,0x2
    3e72:	cca50513          	addi	a0,a0,-822 # 5b38 <malloc+0xdee>
    3e76:	00001097          	auipc	ra,0x1
    3e7a:	e1c080e7          	jalr	-484(ra) # 4c92 <printf>
    exit(1);
    3e7e:	4505                	li	a0,1
    3e80:	00001097          	auipc	ra,0x1
    3e84:	a84080e7          	jalr	-1404(ra) # 4904 <exit>
    printf("%s: chdir dir0 failed\n", s);
    3e88:	85a6                	mv	a1,s1
    3e8a:	00002517          	auipc	a0,0x2
    3e8e:	6d650513          	addi	a0,a0,1750 # 6560 <malloc+0x1816>
    3e92:	00001097          	auipc	ra,0x1
    3e96:	e00080e7          	jalr	-512(ra) # 4c92 <printf>
    exit(1);
    3e9a:	4505                	li	a0,1
    3e9c:	00001097          	auipc	ra,0x1
    3ea0:	a68080e7          	jalr	-1432(ra) # 4904 <exit>
    printf("%s: chdir .. failed\n", s);
    3ea4:	85a6                	mv	a1,s1
    3ea6:	00002517          	auipc	a0,0x2
    3eaa:	6d250513          	addi	a0,a0,1746 # 6578 <malloc+0x182e>
    3eae:	00001097          	auipc	ra,0x1
    3eb2:	de4080e7          	jalr	-540(ra) # 4c92 <printf>
    exit(1);
    3eb6:	4505                	li	a0,1
    3eb8:	00001097          	auipc	ra,0x1
    3ebc:	a4c080e7          	jalr	-1460(ra) # 4904 <exit>
    printf("%s: remove dir0 failed\n", s);
    3ec0:	85a6                	mv	a1,s1
    3ec2:	00002517          	auipc	a0,0x2
    3ec6:	6ce50513          	addi	a0,a0,1742 # 6590 <malloc+0x1846>
    3eca:	00001097          	auipc	ra,0x1
    3ece:	dc8080e7          	jalr	-568(ra) # 4c92 <printf>
    exit(1);
    3ed2:	4505                	li	a0,1
    3ed4:	00001097          	auipc	ra,0x1
    3ed8:	a30080e7          	jalr	-1488(ra) # 4904 <exit>

0000000000003edc <fourteen>:
{
    3edc:	1101                	addi	sp,sp,-32
    3ede:	ec06                	sd	ra,24(sp)
    3ee0:	e822                	sd	s0,16(sp)
    3ee2:	e426                	sd	s1,8(sp)
    3ee4:	1000                	addi	s0,sp,32
    3ee6:	84aa                	mv	s1,a0
  if(mkdir("12345678901234") != 0){
    3ee8:	00003517          	auipc	a0,0x3
    3eec:	8a850513          	addi	a0,a0,-1880 # 6790 <malloc+0x1a46>
    3ef0:	00001097          	auipc	ra,0x1
    3ef4:	a64080e7          	jalr	-1436(ra) # 4954 <mkdir>
    3ef8:	e165                	bnez	a0,3fd8 <fourteen+0xfc>
  if(mkdir("12345678901234/123456789012345") != 0){
    3efa:	00002517          	auipc	a0,0x2
    3efe:	6ee50513          	addi	a0,a0,1774 # 65e8 <malloc+0x189e>
    3f02:	00001097          	auipc	ra,0x1
    3f06:	a52080e7          	jalr	-1454(ra) # 4954 <mkdir>
    3f0a:	e56d                	bnez	a0,3ff4 <fourteen+0x118>
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    3f0c:	20000593          	li	a1,512
    3f10:	00002517          	auipc	a0,0x2
    3f14:	73050513          	addi	a0,a0,1840 # 6640 <malloc+0x18f6>
    3f18:	00001097          	auipc	ra,0x1
    3f1c:	a2c080e7          	jalr	-1492(ra) # 4944 <open>
  if(fd < 0){
    3f20:	0e054863          	bltz	a0,4010 <fourteen+0x134>
  close(fd);
    3f24:	00001097          	auipc	ra,0x1
    3f28:	a08080e7          	jalr	-1528(ra) # 492c <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    3f2c:	4581                	li	a1,0
    3f2e:	00002517          	auipc	a0,0x2
    3f32:	78a50513          	addi	a0,a0,1930 # 66b8 <malloc+0x196e>
    3f36:	00001097          	auipc	ra,0x1
    3f3a:	a0e080e7          	jalr	-1522(ra) # 4944 <open>
  if(fd < 0){
    3f3e:	0e054763          	bltz	a0,402c <fourteen+0x150>
  close(fd);
    3f42:	00001097          	auipc	ra,0x1
    3f46:	9ea080e7          	jalr	-1558(ra) # 492c <close>
  if(mkdir("12345678901234/12345678901234") == 0){
    3f4a:	00002517          	auipc	a0,0x2
    3f4e:	7de50513          	addi	a0,a0,2014 # 6728 <malloc+0x19de>
    3f52:	00001097          	auipc	ra,0x1
    3f56:	a02080e7          	jalr	-1534(ra) # 4954 <mkdir>
    3f5a:	c57d                	beqz	a0,4048 <fourteen+0x16c>
  if(mkdir("123456789012345/12345678901234") == 0){
    3f5c:	00003517          	auipc	a0,0x3
    3f60:	82450513          	addi	a0,a0,-2012 # 6780 <malloc+0x1a36>
    3f64:	00001097          	auipc	ra,0x1
    3f68:	9f0080e7          	jalr	-1552(ra) # 4954 <mkdir>
    3f6c:	cd65                	beqz	a0,4064 <fourteen+0x188>
  remove("123456789012345/12345678901234");
    3f6e:	00003517          	auipc	a0,0x3
    3f72:	81250513          	addi	a0,a0,-2030 # 6780 <malloc+0x1a36>
    3f76:	00001097          	auipc	ra,0x1
    3f7a:	a36080e7          	jalr	-1482(ra) # 49ac <remove>
  remove("12345678901234/12345678901234");
    3f7e:	00002517          	auipc	a0,0x2
    3f82:	7aa50513          	addi	a0,a0,1962 # 6728 <malloc+0x19de>
    3f86:	00001097          	auipc	ra,0x1
    3f8a:	a26080e7          	jalr	-1498(ra) # 49ac <remove>
  remove("12345678901234/12345678901234/12345678901234");
    3f8e:	00002517          	auipc	a0,0x2
    3f92:	72a50513          	addi	a0,a0,1834 # 66b8 <malloc+0x196e>
    3f96:	00001097          	auipc	ra,0x1
    3f9a:	a16080e7          	jalr	-1514(ra) # 49ac <remove>
  remove("123456789012345/123456789012345/123456789012345");
    3f9e:	00002517          	auipc	a0,0x2
    3fa2:	6a250513          	addi	a0,a0,1698 # 6640 <malloc+0x18f6>
    3fa6:	00001097          	auipc	ra,0x1
    3faa:	a06080e7          	jalr	-1530(ra) # 49ac <remove>
  remove("12345678901234/123456789012345");
    3fae:	00002517          	auipc	a0,0x2
    3fb2:	63a50513          	addi	a0,a0,1594 # 65e8 <malloc+0x189e>
    3fb6:	00001097          	auipc	ra,0x1
    3fba:	9f6080e7          	jalr	-1546(ra) # 49ac <remove>
  remove("12345678901234");
    3fbe:	00002517          	auipc	a0,0x2
    3fc2:	7d250513          	addi	a0,a0,2002 # 6790 <malloc+0x1a46>
    3fc6:	00001097          	auipc	ra,0x1
    3fca:	9e6080e7          	jalr	-1562(ra) # 49ac <remove>
}
    3fce:	60e2                	ld	ra,24(sp)
    3fd0:	6442                	ld	s0,16(sp)
    3fd2:	64a2                	ld	s1,8(sp)
    3fd4:	6105                	addi	sp,sp,32
    3fd6:	8082                	ret
    printf("%s: mkdir 12345678901234 failed\n", s);
    3fd8:	85a6                	mv	a1,s1
    3fda:	00002517          	auipc	a0,0x2
    3fde:	5e650513          	addi	a0,a0,1510 # 65c0 <malloc+0x1876>
    3fe2:	00001097          	auipc	ra,0x1
    3fe6:	cb0080e7          	jalr	-848(ra) # 4c92 <printf>
    exit(1);
    3fea:	4505                	li	a0,1
    3fec:	00001097          	auipc	ra,0x1
    3ff0:	918080e7          	jalr	-1768(ra) # 4904 <exit>
    printf("%s: mkdir 12345678901234/123456789012345 failed\n", s);
    3ff4:	85a6                	mv	a1,s1
    3ff6:	00002517          	auipc	a0,0x2
    3ffa:	61250513          	addi	a0,a0,1554 # 6608 <malloc+0x18be>
    3ffe:	00001097          	auipc	ra,0x1
    4002:	c94080e7          	jalr	-876(ra) # 4c92 <printf>
    exit(1);
    4006:	4505                	li	a0,1
    4008:	00001097          	auipc	ra,0x1
    400c:	8fc080e7          	jalr	-1796(ra) # 4904 <exit>
    printf("%s: create 123456789012345/123456789012345/123456789012345 failed\n", s);
    4010:	85a6                	mv	a1,s1
    4012:	00002517          	auipc	a0,0x2
    4016:	65e50513          	addi	a0,a0,1630 # 6670 <malloc+0x1926>
    401a:	00001097          	auipc	ra,0x1
    401e:	c78080e7          	jalr	-904(ra) # 4c92 <printf>
    exit(1);
    4022:	4505                	li	a0,1
    4024:	00001097          	auipc	ra,0x1
    4028:	8e0080e7          	jalr	-1824(ra) # 4904 <exit>
    printf("%s: open 12345678901234/12345678901234/12345678901234 failed\n", s);
    402c:	85a6                	mv	a1,s1
    402e:	00002517          	auipc	a0,0x2
    4032:	6ba50513          	addi	a0,a0,1722 # 66e8 <malloc+0x199e>
    4036:	00001097          	auipc	ra,0x1
    403a:	c5c080e7          	jalr	-932(ra) # 4c92 <printf>
    exit(1);
    403e:	4505                	li	a0,1
    4040:	00001097          	auipc	ra,0x1
    4044:	8c4080e7          	jalr	-1852(ra) # 4904 <exit>
    printf("%s: mkdir 12345678901234/12345678901234 succeeded!\n", s);
    4048:	85a6                	mv	a1,s1
    404a:	00002517          	auipc	a0,0x2
    404e:	6fe50513          	addi	a0,a0,1790 # 6748 <malloc+0x19fe>
    4052:	00001097          	auipc	ra,0x1
    4056:	c40080e7          	jalr	-960(ra) # 4c92 <printf>
    exit(1);
    405a:	4505                	li	a0,1
    405c:	00001097          	auipc	ra,0x1
    4060:	8a8080e7          	jalr	-1880(ra) # 4904 <exit>
    printf("%s: mkdir 12345678901234/123456789012345 succeeded!\n", s);
    4064:	85a6                	mv	a1,s1
    4066:	00002517          	auipc	a0,0x2
    406a:	73a50513          	addi	a0,a0,1850 # 67a0 <malloc+0x1a56>
    406e:	00001097          	auipc	ra,0x1
    4072:	c24080e7          	jalr	-988(ra) # 4c92 <printf>
    exit(1);
    4076:	4505                	li	a0,1
    4078:	00001097          	auipc	ra,0x1
    407c:	88c080e7          	jalr	-1908(ra) # 4904 <exit>

0000000000004080 <fsfull>:
{
    4080:	7171                	addi	sp,sp,-176
    4082:	f506                	sd	ra,168(sp)
    4084:	f122                	sd	s0,160(sp)
    4086:	ed26                	sd	s1,152(sp)
    4088:	e94a                	sd	s2,144(sp)
    408a:	e54e                	sd	s3,136(sp)
    408c:	e152                	sd	s4,128(sp)
    408e:	fcd6                	sd	s5,120(sp)
    4090:	f8da                	sd	s6,112(sp)
    4092:	f4de                	sd	s7,104(sp)
    4094:	f0e2                	sd	s8,96(sp)
    4096:	ece6                	sd	s9,88(sp)
    4098:	e8ea                	sd	s10,80(sp)
    409a:	e4ee                	sd	s11,72(sp)
    409c:	1900                	addi	s0,sp,176
  printf("fsfull test\n");
    409e:	00002517          	auipc	a0,0x2
    40a2:	73a50513          	addi	a0,a0,1850 # 67d8 <malloc+0x1a8e>
    40a6:	00001097          	auipc	ra,0x1
    40aa:	bec080e7          	jalr	-1044(ra) # 4c92 <printf>
  for(nfiles = 0; ; nfiles++){
    40ae:	4481                	li	s1,0
    name[0] = 'f';
    40b0:	06600d93          	li	s11,102
    name[1] = '0' + nfiles / 1000;
    40b4:	3e800c93          	li	s9,1000
    name[2] = '0' + (nfiles % 1000) / 100;
    40b8:	06400c13          	li	s8,100
    name[3] = '0' + (nfiles % 100) / 10;
    40bc:	4ba9                	li	s7,10
    printf("%s: writing %s\n", name);
    40be:	f5040b13          	addi	s6,s0,-176
    40c2:	00002d17          	auipc	s10,0x2
    40c6:	726d0d13          	addi	s10,s10,1830 # 67e8 <malloc+0x1a9e>
      int cc = write(fd, buf, BSIZE);
    40ca:	00006a17          	auipc	s4,0x6
    40ce:	796a0a13          	addi	s4,s4,1942 # a860 <buf>
    name[0] = 'f';
    40d2:	f5b40823          	sb	s11,-176(s0)
    name[1] = '0' + nfiles / 1000;
    40d6:	0394c7bb          	divw	a5,s1,s9
    40da:	0307879b          	addiw	a5,a5,48
    40de:	f4f408a3          	sb	a5,-175(s0)
    name[2] = '0' + (nfiles % 1000) / 100;
    40e2:	0394e7bb          	remw	a5,s1,s9
    40e6:	0387c7bb          	divw	a5,a5,s8
    40ea:	0307879b          	addiw	a5,a5,48
    40ee:	f4f40923          	sb	a5,-174(s0)
    name[3] = '0' + (nfiles % 100) / 10;
    40f2:	0384e7bb          	remw	a5,s1,s8
    40f6:	0377c7bb          	divw	a5,a5,s7
    40fa:	0307879b          	addiw	a5,a5,48
    40fe:	f4f409a3          	sb	a5,-173(s0)
    name[4] = '0' + (nfiles % 10);
    4102:	0374e7bb          	remw	a5,s1,s7
    4106:	0307879b          	addiw	a5,a5,48
    410a:	f4f40a23          	sb	a5,-172(s0)
    name[5] = '\0';
    410e:	f4040aa3          	sb	zero,-171(s0)
    printf("%s: writing %s\n", name);
    4112:	85da                	mv	a1,s6
    4114:	856a                	mv	a0,s10
    4116:	00001097          	auipc	ra,0x1
    411a:	b7c080e7          	jalr	-1156(ra) # 4c92 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    411e:	20200593          	li	a1,514
    4122:	855a                	mv	a0,s6
    4124:	00001097          	auipc	ra,0x1
    4128:	820080e7          	jalr	-2016(ra) # 4944 <open>
    412c:	892a                	mv	s2,a0
    if(fd < 0){
    412e:	0a055763          	bgez	a0,41dc <fsfull+0x15c>
      printf("%s: open %s failed\n", name);
    4132:	f5040593          	addi	a1,s0,-176
    4136:	00002517          	auipc	a0,0x2
    413a:	6c250513          	addi	a0,a0,1730 # 67f8 <malloc+0x1aae>
    413e:	00001097          	auipc	ra,0x1
    4142:	b54080e7          	jalr	-1196(ra) # 4c92 <printf>
  while(nfiles >= 0){
    4146:	0604c463          	bltz	s1,41ae <fsfull+0x12e>
    name[0] = 'f';
    414a:	06600b93          	li	s7,102
    name[1] = '0' + nfiles / 1000;
    414e:	3e800a13          	li	s4,1000
    name[2] = '0' + (nfiles % 1000) / 100;
    4152:	06400993          	li	s3,100
    name[3] = '0' + (nfiles % 100) / 10;
    4156:	4929                	li	s2,10
    remove(name);
    4158:	f5040b13          	addi	s6,s0,-176
  while(nfiles >= 0){
    415c:	5afd                	li	s5,-1
    name[0] = 'f';
    415e:	f5740823          	sb	s7,-176(s0)
    name[1] = '0' + nfiles / 1000;
    4162:	0344c7bb          	divw	a5,s1,s4
    4166:	0307879b          	addiw	a5,a5,48
    416a:	f4f408a3          	sb	a5,-175(s0)
    name[2] = '0' + (nfiles % 1000) / 100;
    416e:	0344e7bb          	remw	a5,s1,s4
    4172:	0337c7bb          	divw	a5,a5,s3
    4176:	0307879b          	addiw	a5,a5,48
    417a:	f4f40923          	sb	a5,-174(s0)
    name[3] = '0' + (nfiles % 100) / 10;
    417e:	0334e7bb          	remw	a5,s1,s3
    4182:	0327c7bb          	divw	a5,a5,s2
    4186:	0307879b          	addiw	a5,a5,48
    418a:	f4f409a3          	sb	a5,-173(s0)
    name[4] = '0' + (nfiles % 10);
    418e:	0324e7bb          	remw	a5,s1,s2
    4192:	0307879b          	addiw	a5,a5,48
    4196:	f4f40a23          	sb	a5,-172(s0)
    name[5] = '\0';
    419a:	f4040aa3          	sb	zero,-171(s0)
    remove(name);
    419e:	855a                	mv	a0,s6
    41a0:	00001097          	auipc	ra,0x1
    41a4:	80c080e7          	jalr	-2036(ra) # 49ac <remove>
    nfiles--;
    41a8:	34fd                	addiw	s1,s1,-1
  while(nfiles >= 0){
    41aa:	fb549ae3          	bne	s1,s5,415e <fsfull+0xde>
  printf("fsfull test finished\n");
    41ae:	00002517          	auipc	a0,0x2
    41b2:	67a50513          	addi	a0,a0,1658 # 6828 <malloc+0x1ade>
    41b6:	00001097          	auipc	ra,0x1
    41ba:	adc080e7          	jalr	-1316(ra) # 4c92 <printf>
}
    41be:	70aa                	ld	ra,168(sp)
    41c0:	740a                	ld	s0,160(sp)
    41c2:	64ea                	ld	s1,152(sp)
    41c4:	694a                	ld	s2,144(sp)
    41c6:	69aa                	ld	s3,136(sp)
    41c8:	6a0a                	ld	s4,128(sp)
    41ca:	7ae6                	ld	s5,120(sp)
    41cc:	7b46                	ld	s6,112(sp)
    41ce:	7ba6                	ld	s7,104(sp)
    41d0:	7c06                	ld	s8,96(sp)
    41d2:	6ce6                	ld	s9,88(sp)
    41d4:	6d46                	ld	s10,80(sp)
    41d6:	6da6                	ld	s11,72(sp)
    41d8:	614d                	addi	sp,sp,176
    41da:	8082                	ret
    int total = 0;
    41dc:	4981                	li	s3,0
      if(cc < BSIZE)
    41de:	1ff00a93          	li	s5,511
      int cc = write(fd, buf, BSIZE);
    41e2:	20000613          	li	a2,512
    41e6:	85d2                	mv	a1,s4
    41e8:	854a                	mv	a0,s2
    41ea:	00000097          	auipc	ra,0x0
    41ee:	73a080e7          	jalr	1850(ra) # 4924 <write>
      if(cc < BSIZE)
    41f2:	00aad563          	bge	s5,a0,41fc <fsfull+0x17c>
      total += cc;
    41f6:	00a989bb          	addw	s3,s3,a0
    while(1){
    41fa:	b7e5                	j	41e2 <fsfull+0x162>
    printf("%s: wrote %d bytes\n", total);
    41fc:	85ce                	mv	a1,s3
    41fe:	00002517          	auipc	a0,0x2
    4202:	61250513          	addi	a0,a0,1554 # 6810 <malloc+0x1ac6>
    4206:	00001097          	auipc	ra,0x1
    420a:	a8c080e7          	jalr	-1396(ra) # 4c92 <printf>
    close(fd);
    420e:	854a                	mv	a0,s2
    4210:	00000097          	auipc	ra,0x0
    4214:	71c080e7          	jalr	1820(ra) # 492c <close>
    if(total == 0)
    4218:	f20987e3          	beqz	s3,4146 <fsfull+0xc6>
  for(nfiles = 0; ; nfiles++){
    421c:	2485                	addiw	s1,s1,1
    421e:	bd55                	j	40d2 <fsfull+0x52>

0000000000004220 <rand>:
{
    4220:	1141                	addi	sp,sp,-16
    4222:	e422                	sd	s0,8(sp)
    4224:	0800                	addi	s0,sp,16
  randstate = randstate * 1664525 + 1013904223;
    4226:	00003717          	auipc	a4,0x3
    422a:	ab270713          	addi	a4,a4,-1358 # 6cd8 <__DATA_BEGIN__>
    422e:	7308                	ld	a0,32(a4)
    4230:	001967b7          	lui	a5,0x196
    4234:	60d78793          	addi	a5,a5,1549 # 19660d <__BSS_END__+0x18a595>
    4238:	02f50533          	mul	a0,a0,a5
    423c:	3c6ef7b7          	lui	a5,0x3c6ef
    4240:	35f78793          	addi	a5,a5,863 # 3c6ef35f <__BSS_END__+0x3c6e32e7>
    4244:	953e                	add	a0,a0,a5
    4246:	f308                	sd	a0,32(a4)
}
    4248:	2501                	sext.w	a0,a0
    424a:	6422                	ld	s0,8(sp)
    424c:	0141                	addi	sp,sp,16
    424e:	8082                	ret

0000000000004250 <countfree>:
// because out of memory with lazy allocation results in the process
// taking a fault and being killed, fork and report back.
//
int
countfree()
{
    4250:	7139                	addi	sp,sp,-64
    4252:	fc06                	sd	ra,56(sp)
    4254:	f822                	sd	s0,48(sp)
    4256:	f426                	sd	s1,40(sp)
    4258:	f04a                	sd	s2,32(sp)
    425a:	ec4e                	sd	s3,24(sp)
    425c:	0080                	addi	s0,sp,64
  int fds[2];

  if(pipe(fds) < 0){
    425e:	fc840513          	addi	a0,s0,-56
    4262:	00000097          	auipc	ra,0x0
    4266:	6b2080e7          	jalr	1714(ra) # 4914 <pipe>
    426a:	06054763          	bltz	a0,42d8 <countfree+0x88>
    printf("pipe() failed in countfree()\n");
    exit(1);
  }
  
  int pid = fork();
    426e:	00000097          	auipc	ra,0x0
    4272:	68e080e7          	jalr	1678(ra) # 48fc <fork>

  if(pid < 0){
    4276:	06054e63          	bltz	a0,42f2 <countfree+0xa2>
    printf("fork failed in countfree()\n");
    exit(1);
  }

  if(pid == 0){
    427a:	ed51                	bnez	a0,4316 <countfree+0xc6>
    close(fds[0]);
    427c:	fc842503          	lw	a0,-56(s0)
    4280:	00000097          	auipc	ra,0x0
    4284:	6ac080e7          	jalr	1708(ra) # 492c <close>
    
    while(1){
      uint64 a = (uint64) sbrk(4096);
      if(a == 0xffffffffffffffff){
    4288:	597d                	li	s2,-1
        break;
      }

      // modify the memory to make sure it's really allocated.
      *(char *)(a + 4096 - 1) = 1;
    428a:	4485                	li	s1,1

      // report back one more page.
      if(write(fds[1], "x", 1) != 1){
    428c:	00001997          	auipc	s3,0x1
    4290:	c8c98993          	addi	s3,s3,-884 # 4f18 <malloc+0x1ce>
      uint64 a = (uint64) sbrk(4096);
    4294:	6505                	lui	a0,0x1
    4296:	00000097          	auipc	ra,0x0
    429a:	6de080e7          	jalr	1758(ra) # 4974 <sbrk>
      if(a == 0xffffffffffffffff){
    429e:	07250763          	beq	a0,s2,430c <countfree+0xbc>
      *(char *)(a + 4096 - 1) = 1;
    42a2:	6785                	lui	a5,0x1
    42a4:	97aa                	add	a5,a5,a0
    42a6:	fe978fa3          	sb	s1,-1(a5) # fff <copyinstr2+0xbd>
      if(write(fds[1], "x", 1) != 1){
    42aa:	8626                	mv	a2,s1
    42ac:	85ce                	mv	a1,s3
    42ae:	fcc42503          	lw	a0,-52(s0)
    42b2:	00000097          	auipc	ra,0x0
    42b6:	672080e7          	jalr	1650(ra) # 4924 <write>
    42ba:	fc950de3          	beq	a0,s1,4294 <countfree+0x44>
        printf("write() failed in countfree()\n");
    42be:	00002517          	auipc	a0,0x2
    42c2:	5c250513          	addi	a0,a0,1474 # 6880 <malloc+0x1b36>
    42c6:	00001097          	auipc	ra,0x1
    42ca:	9cc080e7          	jalr	-1588(ra) # 4c92 <printf>
        exit(1);
    42ce:	4505                	li	a0,1
    42d0:	00000097          	auipc	ra,0x0
    42d4:	634080e7          	jalr	1588(ra) # 4904 <exit>
    printf("pipe() failed in countfree()\n");
    42d8:	00002517          	auipc	a0,0x2
    42dc:	56850513          	addi	a0,a0,1384 # 6840 <malloc+0x1af6>
    42e0:	00001097          	auipc	ra,0x1
    42e4:	9b2080e7          	jalr	-1614(ra) # 4c92 <printf>
    exit(1);
    42e8:	4505                	li	a0,1
    42ea:	00000097          	auipc	ra,0x0
    42ee:	61a080e7          	jalr	1562(ra) # 4904 <exit>
    printf("fork failed in countfree()\n");
    42f2:	00002517          	auipc	a0,0x2
    42f6:	56e50513          	addi	a0,a0,1390 # 6860 <malloc+0x1b16>
    42fa:	00001097          	auipc	ra,0x1
    42fe:	998080e7          	jalr	-1640(ra) # 4c92 <printf>
    exit(1);
    4302:	4505                	li	a0,1
    4304:	00000097          	auipc	ra,0x0
    4308:	600080e7          	jalr	1536(ra) # 4904 <exit>
      }
    }

    exit(0);
    430c:	4501                	li	a0,0
    430e:	00000097          	auipc	ra,0x0
    4312:	5f6080e7          	jalr	1526(ra) # 4904 <exit>
  }

  close(fds[1]);
    4316:	fcc42503          	lw	a0,-52(s0)
    431a:	00000097          	auipc	ra,0x0
    431e:	612080e7          	jalr	1554(ra) # 492c <close>

  int n = 0;
    4322:	4481                	li	s1,0
  while(1){
    char c;
    int cc = read(fds[0], &c, 1);
    4324:	fc740913          	addi	s2,s0,-57
    4328:	4605                	li	a2,1
    432a:	85ca                	mv	a1,s2
    432c:	fc842503          	lw	a0,-56(s0)
    4330:	00000097          	auipc	ra,0x0
    4334:	5ec080e7          	jalr	1516(ra) # 491c <read>
    if(cc < 0){
    4338:	00054563          	bltz	a0,4342 <countfree+0xf2>
      printf("read() failed in countfree()\n");
      exit(1);
    }
    if(cc == 0)
    433c:	c105                	beqz	a0,435c <countfree+0x10c>
      break;
    n += 1;
    433e:	2485                	addiw	s1,s1,1
  while(1){
    4340:	b7e5                	j	4328 <countfree+0xd8>
      printf("read() failed in countfree()\n");
    4342:	00002517          	auipc	a0,0x2
    4346:	55e50513          	addi	a0,a0,1374 # 68a0 <malloc+0x1b56>
    434a:	00001097          	auipc	ra,0x1
    434e:	948080e7          	jalr	-1720(ra) # 4c92 <printf>
      exit(1);
    4352:	4505                	li	a0,1
    4354:	00000097          	auipc	ra,0x0
    4358:	5b0080e7          	jalr	1456(ra) # 4904 <exit>
  }

  close(fds[0]);
    435c:	fc842503          	lw	a0,-56(s0)
    4360:	00000097          	auipc	ra,0x0
    4364:	5cc080e7          	jalr	1484(ra) # 492c <close>
  wait((int*)0);
    4368:	4501                	li	a0,0
    436a:	00000097          	auipc	ra,0x0
    436e:	5a2080e7          	jalr	1442(ra) # 490c <wait>
  
  return n;
}
    4372:	8526                	mv	a0,s1
    4374:	70e2                	ld	ra,56(sp)
    4376:	7442                	ld	s0,48(sp)
    4378:	74a2                	ld	s1,40(sp)
    437a:	7902                	ld	s2,32(sp)
    437c:	69e2                	ld	s3,24(sp)
    437e:	6121                	addi	sp,sp,64
    4380:	8082                	ret

0000000000004382 <run>:

// run each test in its own process. run returns 1 if child's exit()
// indicates success.
int
run(void f(char *), char *s) {
    4382:	7179                	addi	sp,sp,-48
    4384:	f406                	sd	ra,40(sp)
    4386:	f022                	sd	s0,32(sp)
    4388:	ec26                	sd	s1,24(sp)
    438a:	e84a                	sd	s2,16(sp)
    438c:	1800                	addi	s0,sp,48
    438e:	84aa                	mv	s1,a0
    4390:	892e                	mv	s2,a1
  int pid;
  int xstatus;

  printf("test %s: ", s);
    4392:	00002517          	auipc	a0,0x2
    4396:	52e50513          	addi	a0,a0,1326 # 68c0 <malloc+0x1b76>
    439a:	00001097          	auipc	ra,0x1
    439e:	8f8080e7          	jalr	-1800(ra) # 4c92 <printf>
  if((pid = fork()) < 0) {
    43a2:	00000097          	auipc	ra,0x0
    43a6:	55a080e7          	jalr	1370(ra) # 48fc <fork>
    43aa:	02054e63          	bltz	a0,43e6 <run+0x64>
    printf("runtest: fork error\n");
    exit(1);
  }
  if(pid == 0) {
    43ae:	c929                	beqz	a0,4400 <run+0x7e>
    f(s);
    exit(0);
  } else {
    wait(&xstatus);
    43b0:	fdc40513          	addi	a0,s0,-36
    43b4:	00000097          	auipc	ra,0x0
    43b8:	558080e7          	jalr	1368(ra) # 490c <wait>
    if(xstatus != 0) 
    43bc:	fdc42783          	lw	a5,-36(s0)
    43c0:	c7b9                	beqz	a5,440e <run+0x8c>
      printf("FAILED\n");
    43c2:	00002517          	auipc	a0,0x2
    43c6:	52650513          	addi	a0,a0,1318 # 68e8 <malloc+0x1b9e>
    43ca:	00001097          	auipc	ra,0x1
    43ce:	8c8080e7          	jalr	-1848(ra) # 4c92 <printf>
    else
      printf("OK\n");
    return xstatus == 0;
    43d2:	fdc42503          	lw	a0,-36(s0)
  }
}
    43d6:	00153513          	seqz	a0,a0
    43da:	70a2                	ld	ra,40(sp)
    43dc:	7402                	ld	s0,32(sp)
    43de:	64e2                	ld	s1,24(sp)
    43e0:	6942                	ld	s2,16(sp)
    43e2:	6145                	addi	sp,sp,48
    43e4:	8082                	ret
    printf("runtest: fork error\n");
    43e6:	00002517          	auipc	a0,0x2
    43ea:	4ea50513          	addi	a0,a0,1258 # 68d0 <malloc+0x1b86>
    43ee:	00001097          	auipc	ra,0x1
    43f2:	8a4080e7          	jalr	-1884(ra) # 4c92 <printf>
    exit(1);
    43f6:	4505                	li	a0,1
    43f8:	00000097          	auipc	ra,0x0
    43fc:	50c080e7          	jalr	1292(ra) # 4904 <exit>
    f(s);
    4400:	854a                	mv	a0,s2
    4402:	9482                	jalr	s1
    exit(0);
    4404:	4501                	li	a0,0
    4406:	00000097          	auipc	ra,0x0
    440a:	4fe080e7          	jalr	1278(ra) # 4904 <exit>
      printf("OK\n");
    440e:	00002517          	auipc	a0,0x2
    4412:	4e250513          	addi	a0,a0,1250 # 68f0 <malloc+0x1ba6>
    4416:	00001097          	auipc	ra,0x1
    441a:	87c080e7          	jalr	-1924(ra) # 4c92 <printf>
    441e:	bf55                	j	43d2 <run+0x50>

0000000000004420 <main>:

int
main(int argc, char *argv[])
{
    4420:	c8010113          	addi	sp,sp,-896
    4424:	36113c23          	sd	ra,888(sp)
    4428:	36813823          	sd	s0,880(sp)
    442c:	36913423          	sd	s1,872(sp)
    4430:	37213023          	sd	s2,864(sp)
    4434:	35313c23          	sd	s3,856(sp)
    4438:	35413823          	sd	s4,848(sp)
    443c:	35513423          	sd	s5,840(sp)
    4440:	35613023          	sd	s6,832(sp)
    4444:	0700                	addi	s0,sp,896
    4446:	89aa                	mv	s3,a0
  int continuous = 0;
  char *justone = 0;

  if(argc == 2 && strcmp(argv[1], "-c") == 0){
    4448:	4789                	li	a5,2
    444a:	08f50763          	beq	a0,a5,44d8 <main+0xb8>
    continuous = 1;
  } else if(argc == 2 && strcmp(argv[1], "-C") == 0){
    continuous = 2;
  } else if(argc == 2 && argv[1][0] != '-'){
    justone = argv[1];
  } else if(argc > 1){
    444e:	4785                	li	a5,1
  char *justone = 0;
    4450:	4901                	li	s2,0
  } else if(argc > 1){
    4452:	0ca7c163          	blt	a5,a0,4514 <main+0xf4>
  }
  
  struct test {
    void (*f)(char *);
    char *s;
  } tests[] = {
    4456:	00003797          	auipc	a5,0x3
    445a:	8aa78793          	addi	a5,a5,-1878 # 6d00 <randstate+0x8>
    445e:	c8040713          	addi	a4,s0,-896
    4462:	00003817          	auipc	a6,0x3
    4466:	bde80813          	addi	a6,a6,-1058 # 7040 <name>
    446a:	6388                	ld	a0,0(a5)
    446c:	678c                	ld	a1,8(a5)
    446e:	6b90                	ld	a2,16(a5)
    4470:	6f94                	ld	a3,24(a5)
    4472:	e308                	sd	a0,0(a4)
    4474:	e70c                	sd	a1,8(a4)
    4476:	eb10                	sd	a2,16(a4)
    4478:	ef14                	sd	a3,24(a4)
    447a:	02078793          	addi	a5,a5,32
    447e:	02070713          	addi	a4,a4,32
    4482:	ff0794e3          	bne	a5,a6,446a <main+0x4a>
          exit(1);
      }
    }
  }

  printf("usertests starting\n");
    4486:	00002517          	auipc	a0,0x2
    448a:	52250513          	addi	a0,a0,1314 # 69a8 <malloc+0x1c5e>
    448e:	00001097          	auipc	ra,0x1
    4492:	804080e7          	jalr	-2044(ra) # 4c92 <printf>
  int free0 = countfree();
    4496:	00000097          	auipc	ra,0x0
    449a:	dba080e7          	jalr	-582(ra) # 4250 <countfree>
    449e:	8a2a                	mv	s4,a0
  int free1 = 0;
  int fail = 0;
  for (struct test *t = tests; t->s != 0; t++) {
    44a0:	c8843503          	ld	a0,-888(s0)
    44a4:	c8040493          	addi	s1,s0,-896
  int fail = 0;
    44a8:	4981                	li	s3,0
    if((justone == 0) || strcmp(t->s, justone) == 0) {
      if(!run(t->f, t->s))
        fail = 1;
    44aa:	4a85                	li	s5,1
  for (struct test *t = tests; t->s != 0; t++) {
    44ac:	e55d                	bnez	a0,455a <main+0x13a>
  }

  if(fail){
    printf("SOME TESTS FAILED\n");
    exit(1);
  } else if((free1 = countfree()) < free0){
    44ae:	00000097          	auipc	ra,0x0
    44b2:	da2080e7          	jalr	-606(ra) # 4250 <countfree>
    44b6:	85aa                	mv	a1,a0
    44b8:	0f455163          	bge	a0,s4,459a <main+0x17a>
    printf("FAILED -- lost some free pages %d (out of %d)\n", free1, free0);
    44bc:	8652                	mv	a2,s4
    44be:	00002517          	auipc	a0,0x2
    44c2:	4a250513          	addi	a0,a0,1186 # 6960 <malloc+0x1c16>
    44c6:	00000097          	auipc	ra,0x0
    44ca:	7cc080e7          	jalr	1996(ra) # 4c92 <printf>
    exit(1);
    44ce:	4505                	li	a0,1
    44d0:	00000097          	auipc	ra,0x0
    44d4:	434080e7          	jalr	1076(ra) # 4904 <exit>
    44d8:	84ae                	mv	s1,a1
  if(argc == 2 && strcmp(argv[1], "-c") == 0){
    44da:	00002597          	auipc	a1,0x2
    44de:	41e58593          	addi	a1,a1,1054 # 68f8 <malloc+0x1bae>
    44e2:	6488                	ld	a0,8(s1)
    44e4:	00000097          	auipc	ra,0x0
    44e8:	1b2080e7          	jalr	434(ra) # 4696 <strcmp>
    44ec:	10050563          	beqz	a0,45f6 <main+0x1d6>
  } else if(argc == 2 && strcmp(argv[1], "-C") == 0){
    44f0:	00002597          	auipc	a1,0x2
    44f4:	4f058593          	addi	a1,a1,1264 # 69e0 <malloc+0x1c96>
    44f8:	6488                	ld	a0,8(s1)
    44fa:	00000097          	auipc	ra,0x0
    44fe:	19c080e7          	jalr	412(ra) # 4696 <strcmp>
    4502:	c97d                	beqz	a0,45f8 <main+0x1d8>
  } else if(argc == 2 && argv[1][0] != '-'){
    4504:	0084b903          	ld	s2,8(s1)
    4508:	00094703          	lbu	a4,0(s2)
    450c:	02d00793          	li	a5,45
    4510:	f4f713e3          	bne	a4,a5,4456 <main+0x36>
    printf("Usage: usertests [-c] [testname]\n");
    4514:	00002517          	auipc	a0,0x2
    4518:	3ec50513          	addi	a0,a0,1004 # 6900 <malloc+0x1bb6>
    451c:	00000097          	auipc	ra,0x0
    4520:	776080e7          	jalr	1910(ra) # 4c92 <printf>
    exit(1);
    4524:	4505                	li	a0,1
    4526:	00000097          	auipc	ra,0x0
    452a:	3de080e7          	jalr	990(ra) # 4904 <exit>
          exit(1);
    452e:	4505                	li	a0,1
    4530:	00000097          	auipc	ra,0x0
    4534:	3d4080e7          	jalr	980(ra) # 4904 <exit>
        printf("FAILED -- lost %d free pages\n", free0 - free1);
    4538:	40a905bb          	subw	a1,s2,a0
    453c:	855a                	mv	a0,s6
    453e:	00000097          	auipc	ra,0x0
    4542:	754080e7          	jalr	1876(ra) # 4c92 <printf>
        if(continuous != 2)
    4546:	09498463          	beq	s3,s4,45ce <main+0x1ae>
          exit(1);
    454a:	4505                	li	a0,1
    454c:	00000097          	auipc	ra,0x0
    4550:	3b8080e7          	jalr	952(ra) # 4904 <exit>
  for (struct test *t = tests; t->s != 0; t++) {
    4554:	04c1                	addi	s1,s1,16
    4556:	6488                	ld	a0,8(s1)
    4558:	c115                	beqz	a0,457c <main+0x15c>
    if((justone == 0) || strcmp(t->s, justone) == 0) {
    455a:	00090863          	beqz	s2,456a <main+0x14a>
    455e:	85ca                	mv	a1,s2
    4560:	00000097          	auipc	ra,0x0
    4564:	136080e7          	jalr	310(ra) # 4696 <strcmp>
    4568:	f575                	bnez	a0,4554 <main+0x134>
      if(!run(t->f, t->s))
    456a:	648c                	ld	a1,8(s1)
    456c:	6088                	ld	a0,0(s1)
    456e:	00000097          	auipc	ra,0x0
    4572:	e14080e7          	jalr	-492(ra) # 4382 <run>
    4576:	fd79                	bnez	a0,4554 <main+0x134>
        fail = 1;
    4578:	89d6                	mv	s3,s5
    457a:	bfe9                	j	4554 <main+0x134>
  if(fail){
    457c:	f20989e3          	beqz	s3,44ae <main+0x8e>
    printf("SOME TESTS FAILED\n");
    4580:	00002517          	auipc	a0,0x2
    4584:	3c850513          	addi	a0,a0,968 # 6948 <malloc+0x1bfe>
    4588:	00000097          	auipc	ra,0x0
    458c:	70a080e7          	jalr	1802(ra) # 4c92 <printf>
    exit(1);
    4590:	4505                	li	a0,1
    4592:	00000097          	auipc	ra,0x0
    4596:	372080e7          	jalr	882(ra) # 4904 <exit>
  } else {
    printf("ALL TESTS PASSED\n");
    459a:	00002517          	auipc	a0,0x2
    459e:	3f650513          	addi	a0,a0,1014 # 6990 <malloc+0x1c46>
    45a2:	00000097          	auipc	ra,0x0
    45a6:	6f0080e7          	jalr	1776(ra) # 4c92 <printf>
    exit(0);
    45aa:	4501                	li	a0,0
    45ac:	00000097          	auipc	ra,0x0
    45b0:	358080e7          	jalr	856(ra) # 4904 <exit>
        printf("SOME TESTS FAILED\n");
    45b4:	8556                	mv	a0,s5
    45b6:	00000097          	auipc	ra,0x0
    45ba:	6dc080e7          	jalr	1756(ra) # 4c92 <printf>
        if(continuous != 2)
    45be:	f74998e3          	bne	s3,s4,452e <main+0x10e>
      int free1 = countfree();
    45c2:	00000097          	auipc	ra,0x0
    45c6:	c8e080e7          	jalr	-882(ra) # 4250 <countfree>
      if(free1 < free0){
    45ca:	f72547e3          	blt	a0,s2,4538 <main+0x118>
      int free0 = countfree();
    45ce:	00000097          	auipc	ra,0x0
    45d2:	c82080e7          	jalr	-894(ra) # 4250 <countfree>
    45d6:	892a                	mv	s2,a0
      for (struct test *t = tests; t->s != 0; t++) {
    45d8:	c8843583          	ld	a1,-888(s0)
    45dc:	d1fd                	beqz	a1,45c2 <main+0x1a2>
    45de:	c8040493          	addi	s1,s0,-896
        if(!run(t->f, t->s)){
    45e2:	6088                	ld	a0,0(s1)
    45e4:	00000097          	auipc	ra,0x0
    45e8:	d9e080e7          	jalr	-610(ra) # 4382 <run>
    45ec:	d561                	beqz	a0,45b4 <main+0x194>
      for (struct test *t = tests; t->s != 0; t++) {
    45ee:	04c1                	addi	s1,s1,16
    45f0:	648c                	ld	a1,8(s1)
    45f2:	f9e5                	bnez	a1,45e2 <main+0x1c2>
    45f4:	b7f9                	j	45c2 <main+0x1a2>
    continuous = 1;
    45f6:	4985                	li	s3,1
  } tests[] = {
    45f8:	00002797          	auipc	a5,0x2
    45fc:	70878793          	addi	a5,a5,1800 # 6d00 <randstate+0x8>
    4600:	c8040713          	addi	a4,s0,-896
    4604:	00003817          	auipc	a6,0x3
    4608:	a3c80813          	addi	a6,a6,-1476 # 7040 <name>
    460c:	6388                	ld	a0,0(a5)
    460e:	678c                	ld	a1,8(a5)
    4610:	6b90                	ld	a2,16(a5)
    4612:	6f94                	ld	a3,24(a5)
    4614:	e308                	sd	a0,0(a4)
    4616:	e70c                	sd	a1,8(a4)
    4618:	eb10                	sd	a2,16(a4)
    461a:	ef14                	sd	a3,24(a4)
    461c:	02078793          	addi	a5,a5,32
    4620:	02070713          	addi	a4,a4,32
    4624:	ff0794e3          	bne	a5,a6,460c <main+0x1ec>
    printf("continuous usertests starting\n");
    4628:	00002517          	auipc	a0,0x2
    462c:	39850513          	addi	a0,a0,920 # 69c0 <malloc+0x1c76>
    4630:	00000097          	auipc	ra,0x0
    4634:	662080e7          	jalr	1634(ra) # 4c92 <printf>
        printf("SOME TESTS FAILED\n");
    4638:	00002a97          	auipc	s5,0x2
    463c:	310a8a93          	addi	s5,s5,784 # 6948 <malloc+0x1bfe>
        if(continuous != 2)
    4640:	4a09                	li	s4,2
        printf("FAILED -- lost %d free pages\n", free0 - free1);
    4642:	00002b17          	auipc	s6,0x2
    4646:	2e6b0b13          	addi	s6,s6,742 # 6928 <malloc+0x1bde>
    464a:	b751                	j	45ce <main+0x1ae>

000000000000464c <strcpy>:
    464c:	1141                	addi	sp,sp,-16
    464e:	e422                	sd	s0,8(sp)
    4650:	0800                	addi	s0,sp,16
    4652:	87aa                	mv	a5,a0
    4654:	0585                	addi	a1,a1,1
    4656:	0785                	addi	a5,a5,1
    4658:	fff5c703          	lbu	a4,-1(a1)
    465c:	fee78fa3          	sb	a4,-1(a5)
    4660:	fb75                	bnez	a4,4654 <strcpy+0x8>
    4662:	6422                	ld	s0,8(sp)
    4664:	0141                	addi	sp,sp,16
    4666:	8082                	ret

0000000000004668 <strcat>:
    4668:	1141                	addi	sp,sp,-16
    466a:	e422                	sd	s0,8(sp)
    466c:	0800                	addi	s0,sp,16
    466e:	00054783          	lbu	a5,0(a0)
    4672:	c385                	beqz	a5,4692 <strcat+0x2a>
    4674:	87aa                	mv	a5,a0
    4676:	0785                	addi	a5,a5,1
    4678:	0007c703          	lbu	a4,0(a5)
    467c:	ff6d                	bnez	a4,4676 <strcat+0xe>
    467e:	0585                	addi	a1,a1,1
    4680:	0785                	addi	a5,a5,1
    4682:	fff5c703          	lbu	a4,-1(a1)
    4686:	fee78fa3          	sb	a4,-1(a5)
    468a:	fb75                	bnez	a4,467e <strcat+0x16>
    468c:	6422                	ld	s0,8(sp)
    468e:	0141                	addi	sp,sp,16
    4690:	8082                	ret
    4692:	87aa                	mv	a5,a0
    4694:	b7ed                	j	467e <strcat+0x16>

0000000000004696 <strcmp>:
    4696:	1141                	addi	sp,sp,-16
    4698:	e422                	sd	s0,8(sp)
    469a:	0800                	addi	s0,sp,16
    469c:	00054783          	lbu	a5,0(a0)
    46a0:	cb91                	beqz	a5,46b4 <strcmp+0x1e>
    46a2:	0005c703          	lbu	a4,0(a1)
    46a6:	00f71763          	bne	a4,a5,46b4 <strcmp+0x1e>
    46aa:	0505                	addi	a0,a0,1
    46ac:	0585                	addi	a1,a1,1
    46ae:	00054783          	lbu	a5,0(a0)
    46b2:	fbe5                	bnez	a5,46a2 <strcmp+0xc>
    46b4:	0005c503          	lbu	a0,0(a1)
    46b8:	40a7853b          	subw	a0,a5,a0
    46bc:	6422                	ld	s0,8(sp)
    46be:	0141                	addi	sp,sp,16
    46c0:	8082                	ret

00000000000046c2 <strlen>:
    46c2:	1141                	addi	sp,sp,-16
    46c4:	e422                	sd	s0,8(sp)
    46c6:	0800                	addi	s0,sp,16
    46c8:	00054783          	lbu	a5,0(a0)
    46cc:	cf91                	beqz	a5,46e8 <strlen+0x26>
    46ce:	0505                	addi	a0,a0,1
    46d0:	87aa                	mv	a5,a0
    46d2:	86be                	mv	a3,a5
    46d4:	0785                	addi	a5,a5,1
    46d6:	fff7c703          	lbu	a4,-1(a5)
    46da:	ff65                	bnez	a4,46d2 <strlen+0x10>
    46dc:	40a6853b          	subw	a0,a3,a0
    46e0:	2505                	addiw	a0,a0,1
    46e2:	6422                	ld	s0,8(sp)
    46e4:	0141                	addi	sp,sp,16
    46e6:	8082                	ret
    46e8:	4501                	li	a0,0
    46ea:	bfe5                	j	46e2 <strlen+0x20>

00000000000046ec <memset>:
    46ec:	1141                	addi	sp,sp,-16
    46ee:	e422                	sd	s0,8(sp)
    46f0:	0800                	addi	s0,sp,16
    46f2:	ca19                	beqz	a2,4708 <memset+0x1c>
    46f4:	87aa                	mv	a5,a0
    46f6:	1602                	slli	a2,a2,0x20
    46f8:	9201                	srli	a2,a2,0x20
    46fa:	00a60733          	add	a4,a2,a0
    46fe:	00b78023          	sb	a1,0(a5)
    4702:	0785                	addi	a5,a5,1
    4704:	fee79de3          	bne	a5,a4,46fe <memset+0x12>
    4708:	6422                	ld	s0,8(sp)
    470a:	0141                	addi	sp,sp,16
    470c:	8082                	ret

000000000000470e <strchr>:
    470e:	1141                	addi	sp,sp,-16
    4710:	e422                	sd	s0,8(sp)
    4712:	0800                	addi	s0,sp,16
    4714:	00054783          	lbu	a5,0(a0)
    4718:	cb99                	beqz	a5,472e <strchr+0x20>
    471a:	00f58763          	beq	a1,a5,4728 <strchr+0x1a>
    471e:	0505                	addi	a0,a0,1
    4720:	00054783          	lbu	a5,0(a0)
    4724:	fbfd                	bnez	a5,471a <strchr+0xc>
    4726:	4501                	li	a0,0
    4728:	6422                	ld	s0,8(sp)
    472a:	0141                	addi	sp,sp,16
    472c:	8082                	ret
    472e:	4501                	li	a0,0
    4730:	bfe5                	j	4728 <strchr+0x1a>

0000000000004732 <gets>:
    4732:	711d                	addi	sp,sp,-96
    4734:	ec86                	sd	ra,88(sp)
    4736:	e8a2                	sd	s0,80(sp)
    4738:	e4a6                	sd	s1,72(sp)
    473a:	e0ca                	sd	s2,64(sp)
    473c:	fc4e                	sd	s3,56(sp)
    473e:	f852                	sd	s4,48(sp)
    4740:	f456                	sd	s5,40(sp)
    4742:	f05a                	sd	s6,32(sp)
    4744:	ec5e                	sd	s7,24(sp)
    4746:	e862                	sd	s8,16(sp)
    4748:	1080                	addi	s0,sp,96
    474a:	8baa                	mv	s7,a0
    474c:	8a2e                	mv	s4,a1
    474e:	892a                	mv	s2,a0
    4750:	4481                	li	s1,0
    4752:	faf40a93          	addi	s5,s0,-81
    4756:	4b29                	li	s6,10
    4758:	4c35                	li	s8,13
    475a:	89a6                	mv	s3,s1
    475c:	2485                	addiw	s1,s1,1
    475e:	0344d763          	bge	s1,s4,478c <gets+0x5a>
    4762:	4605                	li	a2,1
    4764:	85d6                	mv	a1,s5
    4766:	4501                	li	a0,0
    4768:	00000097          	auipc	ra,0x0
    476c:	1b4080e7          	jalr	436(ra) # 491c <read>
    4770:	00a05e63          	blez	a0,478c <gets+0x5a>
    4774:	faf44783          	lbu	a5,-81(s0)
    4778:	00f90023          	sb	a5,0(s2)
    477c:	01678763          	beq	a5,s6,478a <gets+0x58>
    4780:	0905                	addi	s2,s2,1
    4782:	fd879ce3          	bne	a5,s8,475a <gets+0x28>
    4786:	89a6                	mv	s3,s1
    4788:	a011                	j	478c <gets+0x5a>
    478a:	89a6                	mv	s3,s1
    478c:	99de                	add	s3,s3,s7
    478e:	00098023          	sb	zero,0(s3)
    4792:	855e                	mv	a0,s7
    4794:	60e6                	ld	ra,88(sp)
    4796:	6446                	ld	s0,80(sp)
    4798:	64a6                	ld	s1,72(sp)
    479a:	6906                	ld	s2,64(sp)
    479c:	79e2                	ld	s3,56(sp)
    479e:	7a42                	ld	s4,48(sp)
    47a0:	7aa2                	ld	s5,40(sp)
    47a2:	7b02                	ld	s6,32(sp)
    47a4:	6be2                	ld	s7,24(sp)
    47a6:	6c42                	ld	s8,16(sp)
    47a8:	6125                	addi	sp,sp,96
    47aa:	8082                	ret

00000000000047ac <stat>:
    47ac:	1101                	addi	sp,sp,-32
    47ae:	ec06                	sd	ra,24(sp)
    47b0:	e822                	sd	s0,16(sp)
    47b2:	e426                	sd	s1,8(sp)
    47b4:	e04a                	sd	s2,0(sp)
    47b6:	1000                	addi	s0,sp,32
    47b8:	892e                	mv	s2,a1
    47ba:	4581                	li	a1,0
    47bc:	00000097          	auipc	ra,0x0
    47c0:	188080e7          	jalr	392(ra) # 4944 <open>
    47c4:	02054563          	bltz	a0,47ee <stat+0x42>
    47c8:	84aa                	mv	s1,a0
    47ca:	85ca                	mv	a1,s2
    47cc:	00000097          	auipc	ra,0x0
    47d0:	180080e7          	jalr	384(ra) # 494c <fstat>
    47d4:	892a                	mv	s2,a0
    47d6:	8526                	mv	a0,s1
    47d8:	00000097          	auipc	ra,0x0
    47dc:	154080e7          	jalr	340(ra) # 492c <close>
    47e0:	854a                	mv	a0,s2
    47e2:	60e2                	ld	ra,24(sp)
    47e4:	6442                	ld	s0,16(sp)
    47e6:	64a2                	ld	s1,8(sp)
    47e8:	6902                	ld	s2,0(sp)
    47ea:	6105                	addi	sp,sp,32
    47ec:	8082                	ret
    47ee:	597d                	li	s2,-1
    47f0:	bfc5                	j	47e0 <stat+0x34>

00000000000047f2 <atoi>:
    47f2:	1141                	addi	sp,sp,-16
    47f4:	e422                	sd	s0,8(sp)
    47f6:	0800                	addi	s0,sp,16
    47f8:	00054703          	lbu	a4,0(a0)
    47fc:	02d00793          	li	a5,45
    4800:	4585                	li	a1,1
    4802:	04f70363          	beq	a4,a5,4848 <atoi+0x56>
    4806:	00054703          	lbu	a4,0(a0)
    480a:	fd07079b          	addiw	a5,a4,-48
    480e:	0ff7f793          	zext.b	a5,a5
    4812:	46a5                	li	a3,9
    4814:	02f6ed63          	bltu	a3,a5,484e <atoi+0x5c>
    4818:	4681                	li	a3,0
    481a:	4625                	li	a2,9
    481c:	0505                	addi	a0,a0,1
    481e:	0026979b          	slliw	a5,a3,0x2
    4822:	9fb5                	addw	a5,a5,a3
    4824:	0017979b          	slliw	a5,a5,0x1
    4828:	9fb9                	addw	a5,a5,a4
    482a:	fd07869b          	addiw	a3,a5,-48
    482e:	00054703          	lbu	a4,0(a0)
    4832:	fd07079b          	addiw	a5,a4,-48
    4836:	0ff7f793          	zext.b	a5,a5
    483a:	fef671e3          	bgeu	a2,a5,481c <atoi+0x2a>
    483e:	02d5853b          	mulw	a0,a1,a3
    4842:	6422                	ld	s0,8(sp)
    4844:	0141                	addi	sp,sp,16
    4846:	8082                	ret
    4848:	0505                	addi	a0,a0,1
    484a:	55fd                	li	a1,-1
    484c:	bf6d                	j	4806 <atoi+0x14>
    484e:	4681                	li	a3,0
    4850:	b7fd                	j	483e <atoi+0x4c>

0000000000004852 <memmove>:
    4852:	1141                	addi	sp,sp,-16
    4854:	e422                	sd	s0,8(sp)
    4856:	0800                	addi	s0,sp,16
    4858:	02b57463          	bgeu	a0,a1,4880 <memmove+0x2e>
    485c:	00c05f63          	blez	a2,487a <memmove+0x28>
    4860:	1602                	slli	a2,a2,0x20
    4862:	9201                	srli	a2,a2,0x20
    4864:	00c507b3          	add	a5,a0,a2
    4868:	872a                	mv	a4,a0
    486a:	0585                	addi	a1,a1,1
    486c:	0705                	addi	a4,a4,1
    486e:	fff5c683          	lbu	a3,-1(a1)
    4872:	fed70fa3          	sb	a3,-1(a4)
    4876:	fee79ae3          	bne	a5,a4,486a <memmove+0x18>
    487a:	6422                	ld	s0,8(sp)
    487c:	0141                	addi	sp,sp,16
    487e:	8082                	ret
    4880:	00c50733          	add	a4,a0,a2
    4884:	95b2                	add	a1,a1,a2
    4886:	fec05ae3          	blez	a2,487a <memmove+0x28>
    488a:	fff6079b          	addiw	a5,a2,-1
    488e:	1782                	slli	a5,a5,0x20
    4890:	9381                	srli	a5,a5,0x20
    4892:	fff7c793          	not	a5,a5
    4896:	97ba                	add	a5,a5,a4
    4898:	15fd                	addi	a1,a1,-1
    489a:	177d                	addi	a4,a4,-1
    489c:	0005c683          	lbu	a3,0(a1)
    48a0:	00d70023          	sb	a3,0(a4)
    48a4:	fee79ae3          	bne	a5,a4,4898 <memmove+0x46>
    48a8:	bfc9                	j	487a <memmove+0x28>

00000000000048aa <memcmp>:
    48aa:	1141                	addi	sp,sp,-16
    48ac:	e422                	sd	s0,8(sp)
    48ae:	0800                	addi	s0,sp,16
    48b0:	ca05                	beqz	a2,48e0 <memcmp+0x36>
    48b2:	fff6069b          	addiw	a3,a2,-1
    48b6:	1682                	slli	a3,a3,0x20
    48b8:	9281                	srli	a3,a3,0x20
    48ba:	0685                	addi	a3,a3,1
    48bc:	96aa                	add	a3,a3,a0
    48be:	00054783          	lbu	a5,0(a0)
    48c2:	0005c703          	lbu	a4,0(a1)
    48c6:	00e79863          	bne	a5,a4,48d6 <memcmp+0x2c>
    48ca:	0505                	addi	a0,a0,1
    48cc:	0585                	addi	a1,a1,1
    48ce:	fed518e3          	bne	a0,a3,48be <memcmp+0x14>
    48d2:	4501                	li	a0,0
    48d4:	a019                	j	48da <memcmp+0x30>
    48d6:	40e7853b          	subw	a0,a5,a4
    48da:	6422                	ld	s0,8(sp)
    48dc:	0141                	addi	sp,sp,16
    48de:	8082                	ret
    48e0:	4501                	li	a0,0
    48e2:	bfe5                	j	48da <memcmp+0x30>

00000000000048e4 <memcpy>:
    48e4:	1141                	addi	sp,sp,-16
    48e6:	e406                	sd	ra,8(sp)
    48e8:	e022                	sd	s0,0(sp)
    48ea:	0800                	addi	s0,sp,16
    48ec:	00000097          	auipc	ra,0x0
    48f0:	f66080e7          	jalr	-154(ra) # 4852 <memmove>
    48f4:	60a2                	ld	ra,8(sp)
    48f6:	6402                	ld	s0,0(sp)
    48f8:	0141                	addi	sp,sp,16
    48fa:	8082                	ret

00000000000048fc <fork>:
    48fc:	4885                	li	a7,1
    48fe:	00000073          	ecall
    4902:	8082                	ret

0000000000004904 <exit>:
    4904:	4889                	li	a7,2
    4906:	00000073          	ecall
    490a:	8082                	ret

000000000000490c <wait>:
    490c:	488d                	li	a7,3
    490e:	00000073          	ecall
    4912:	8082                	ret

0000000000004914 <pipe>:
    4914:	4891                	li	a7,4
    4916:	00000073          	ecall
    491a:	8082                	ret

000000000000491c <read>:
    491c:	4895                	li	a7,5
    491e:	00000073          	ecall
    4922:	8082                	ret

0000000000004924 <write>:
    4924:	48c1                	li	a7,16
    4926:	00000073          	ecall
    492a:	8082                	ret

000000000000492c <close>:
    492c:	48d5                	li	a7,21
    492e:	00000073          	ecall
    4932:	8082                	ret

0000000000004934 <kill>:
    4934:	4899                	li	a7,6
    4936:	00000073          	ecall
    493a:	8082                	ret

000000000000493c <exec>:
    493c:	489d                	li	a7,7
    493e:	00000073          	ecall
    4942:	8082                	ret

0000000000004944 <open>:
    4944:	48bd                	li	a7,15
    4946:	00000073          	ecall
    494a:	8082                	ret

000000000000494c <fstat>:
    494c:	48a1                	li	a7,8
    494e:	00000073          	ecall
    4952:	8082                	ret

0000000000004954 <mkdir>:
    4954:	48d1                	li	a7,20
    4956:	00000073          	ecall
    495a:	8082                	ret

000000000000495c <chdir>:
    495c:	48a5                	li	a7,9
    495e:	00000073          	ecall
    4962:	8082                	ret

0000000000004964 <dup>:
    4964:	48a9                	li	a7,10
    4966:	00000073          	ecall
    496a:	8082                	ret

000000000000496c <getpid>:
    496c:	48ad                	li	a7,11
    496e:	00000073          	ecall
    4972:	8082                	ret

0000000000004974 <sbrk>:
    4974:	48b1                	li	a7,12
    4976:	00000073          	ecall
    497a:	8082                	ret

000000000000497c <sleep>:
    497c:	48b5                	li	a7,13
    497e:	00000073          	ecall
    4982:	8082                	ret

0000000000004984 <uptime>:
    4984:	48b9                	li	a7,14
    4986:	00000073          	ecall
    498a:	8082                	ret

000000000000498c <test_proc>:
    498c:	48d9                	li	a7,22
    498e:	00000073          	ecall
    4992:	8082                	ret

0000000000004994 <dev>:
    4994:	48dd                	li	a7,23
    4996:	00000073          	ecall
    499a:	8082                	ret

000000000000499c <readdir>:
    499c:	48e1                	li	a7,24
    499e:	00000073          	ecall
    49a2:	8082                	ret

00000000000049a4 <getcwd>:
    49a4:	48e5                	li	a7,25
    49a6:	00000073          	ecall
    49aa:	8082                	ret

00000000000049ac <remove>:
    49ac:	48c5                	li	a7,17
    49ae:	00000073          	ecall
    49b2:	8082                	ret

00000000000049b4 <trace>:
    49b4:	48c9                	li	a7,18
    49b6:	00000073          	ecall
    49ba:	8082                	ret

00000000000049bc <sysinfo>:
    49bc:	48cd                	li	a7,19
    49be:	00000073          	ecall
    49c2:	8082                	ret

00000000000049c4 <rename>:
    49c4:	48e9                	li	a7,26
    49c6:	00000073          	ecall
    49ca:	8082                	ret

00000000000049cc <putc>:
    49cc:	1101                	addi	sp,sp,-32
    49ce:	ec06                	sd	ra,24(sp)
    49d0:	e822                	sd	s0,16(sp)
    49d2:	1000                	addi	s0,sp,32
    49d4:	feb407a3          	sb	a1,-17(s0)
    49d8:	4605                	li	a2,1
    49da:	fef40593          	addi	a1,s0,-17
    49de:	00000097          	auipc	ra,0x0
    49e2:	f46080e7          	jalr	-186(ra) # 4924 <write>
    49e6:	60e2                	ld	ra,24(sp)
    49e8:	6442                	ld	s0,16(sp)
    49ea:	6105                	addi	sp,sp,32
    49ec:	8082                	ret

00000000000049ee <printint>:
    49ee:	7139                	addi	sp,sp,-64
    49f0:	fc06                	sd	ra,56(sp)
    49f2:	f822                	sd	s0,48(sp)
    49f4:	f426                	sd	s1,40(sp)
    49f6:	f04a                	sd	s2,32(sp)
    49f8:	ec4e                	sd	s3,24(sp)
    49fa:	0080                	addi	s0,sp,64
    49fc:	84aa                	mv	s1,a0
    49fe:	c299                	beqz	a3,4a04 <printint+0x16>
    4a00:	0805c863          	bltz	a1,4a90 <printint+0xa2>
    4a04:	2581                	sext.w	a1,a1
    4a06:	4881                	li	a7,0
    4a08:	fc040993          	addi	s3,s0,-64
    4a0c:	86ce                	mv	a3,s3
    4a0e:	4701                	li	a4,0
    4a10:	2601                	sext.w	a2,a2
    4a12:	00002517          	auipc	a0,0x2
    4a16:	2ae50513          	addi	a0,a0,686 # 6cc0 <digits>
    4a1a:	883a                	mv	a6,a4
    4a1c:	2705                	addiw	a4,a4,1
    4a1e:	02c5f7bb          	remuw	a5,a1,a2
    4a22:	1782                	slli	a5,a5,0x20
    4a24:	9381                	srli	a5,a5,0x20
    4a26:	97aa                	add	a5,a5,a0
    4a28:	0007c783          	lbu	a5,0(a5)
    4a2c:	00f68023          	sb	a5,0(a3)
    4a30:	0005879b          	sext.w	a5,a1
    4a34:	02c5d5bb          	divuw	a1,a1,a2
    4a38:	0685                	addi	a3,a3,1
    4a3a:	fec7f0e3          	bgeu	a5,a2,4a1a <printint+0x2c>
    4a3e:	00088c63          	beqz	a7,4a56 <printint+0x68>
    4a42:	fd070793          	addi	a5,a4,-48
    4a46:	00878733          	add	a4,a5,s0
    4a4a:	02d00793          	li	a5,45
    4a4e:	fef70823          	sb	a5,-16(a4)
    4a52:	0028071b          	addiw	a4,a6,2
    4a56:	02e05663          	blez	a4,4a82 <printint+0x94>
    4a5a:	fc040913          	addi	s2,s0,-64
    4a5e:	993a                	add	s2,s2,a4
    4a60:	19fd                	addi	s3,s3,-1
    4a62:	99ba                	add	s3,s3,a4
    4a64:	377d                	addiw	a4,a4,-1
    4a66:	1702                	slli	a4,a4,0x20
    4a68:	9301                	srli	a4,a4,0x20
    4a6a:	40e989b3          	sub	s3,s3,a4
    4a6e:	fff94583          	lbu	a1,-1(s2)
    4a72:	8526                	mv	a0,s1
    4a74:	00000097          	auipc	ra,0x0
    4a78:	f58080e7          	jalr	-168(ra) # 49cc <putc>
    4a7c:	197d                	addi	s2,s2,-1
    4a7e:	ff3918e3          	bne	s2,s3,4a6e <printint+0x80>
    4a82:	70e2                	ld	ra,56(sp)
    4a84:	7442                	ld	s0,48(sp)
    4a86:	74a2                	ld	s1,40(sp)
    4a88:	7902                	ld	s2,32(sp)
    4a8a:	69e2                	ld	s3,24(sp)
    4a8c:	6121                	addi	sp,sp,64
    4a8e:	8082                	ret
    4a90:	40b005bb          	negw	a1,a1
    4a94:	4885                	li	a7,1
    4a96:	bf8d                	j	4a08 <printint+0x1a>

0000000000004a98 <vprintf>:
    4a98:	715d                	addi	sp,sp,-80
    4a9a:	e486                	sd	ra,72(sp)
    4a9c:	e0a2                	sd	s0,64(sp)
    4a9e:	fc26                	sd	s1,56(sp)
    4aa0:	f84a                	sd	s2,48(sp)
    4aa2:	f44e                	sd	s3,40(sp)
    4aa4:	f052                	sd	s4,32(sp)
    4aa6:	ec56                	sd	s5,24(sp)
    4aa8:	e85a                	sd	s6,16(sp)
    4aaa:	e45e                	sd	s7,8(sp)
    4aac:	e062                	sd	s8,0(sp)
    4aae:	0880                	addi	s0,sp,80
    4ab0:	0005c903          	lbu	s2,0(a1)
    4ab4:	18090c63          	beqz	s2,4c4c <vprintf+0x1b4>
    4ab8:	8aaa                	mv	s5,a0
    4aba:	8bb2                	mv	s7,a2
    4abc:	00158493          	addi	s1,a1,1
    4ac0:	4981                	li	s3,0
    4ac2:	02500a13          	li	s4,37
    4ac6:	4b55                	li	s6,21
    4ac8:	a839                	j	4ae6 <vprintf+0x4e>
    4aca:	85ca                	mv	a1,s2
    4acc:	8556                	mv	a0,s5
    4ace:	00000097          	auipc	ra,0x0
    4ad2:	efe080e7          	jalr	-258(ra) # 49cc <putc>
    4ad6:	a019                	j	4adc <vprintf+0x44>
    4ad8:	01498d63          	beq	s3,s4,4af2 <vprintf+0x5a>
    4adc:	0485                	addi	s1,s1,1
    4ade:	fff4c903          	lbu	s2,-1(s1)
    4ae2:	16090563          	beqz	s2,4c4c <vprintf+0x1b4>
    4ae6:	fe0999e3          	bnez	s3,4ad8 <vprintf+0x40>
    4aea:	ff4910e3          	bne	s2,s4,4aca <vprintf+0x32>
    4aee:	89d2                	mv	s3,s4
    4af0:	b7f5                	j	4adc <vprintf+0x44>
    4af2:	13490263          	beq	s2,s4,4c16 <vprintf+0x17e>
    4af6:	f9d9079b          	addiw	a5,s2,-99
    4afa:	0ff7f793          	zext.b	a5,a5
    4afe:	12fb6563          	bltu	s6,a5,4c28 <vprintf+0x190>
    4b02:	f9d9079b          	addiw	a5,s2,-99
    4b06:	0ff7f713          	zext.b	a4,a5
    4b0a:	10eb6f63          	bltu	s6,a4,4c28 <vprintf+0x190>
    4b0e:	00271793          	slli	a5,a4,0x2
    4b12:	00002717          	auipc	a4,0x2
    4b16:	15670713          	addi	a4,a4,342 # 6c68 <malloc+0x1f1e>
    4b1a:	97ba                	add	a5,a5,a4
    4b1c:	439c                	lw	a5,0(a5)
    4b1e:	97ba                	add	a5,a5,a4
    4b20:	8782                	jr	a5
    4b22:	008b8913          	addi	s2,s7,8
    4b26:	4685                	li	a3,1
    4b28:	4629                	li	a2,10
    4b2a:	000ba583          	lw	a1,0(s7)
    4b2e:	8556                	mv	a0,s5
    4b30:	00000097          	auipc	ra,0x0
    4b34:	ebe080e7          	jalr	-322(ra) # 49ee <printint>
    4b38:	8bca                	mv	s7,s2
    4b3a:	4981                	li	s3,0
    4b3c:	b745                	j	4adc <vprintf+0x44>
    4b3e:	008b8913          	addi	s2,s7,8
    4b42:	4681                	li	a3,0
    4b44:	4629                	li	a2,10
    4b46:	000ba583          	lw	a1,0(s7)
    4b4a:	8556                	mv	a0,s5
    4b4c:	00000097          	auipc	ra,0x0
    4b50:	ea2080e7          	jalr	-350(ra) # 49ee <printint>
    4b54:	8bca                	mv	s7,s2
    4b56:	4981                	li	s3,0
    4b58:	b751                	j	4adc <vprintf+0x44>
    4b5a:	008b8913          	addi	s2,s7,8
    4b5e:	4681                	li	a3,0
    4b60:	4641                	li	a2,16
    4b62:	000ba583          	lw	a1,0(s7)
    4b66:	8556                	mv	a0,s5
    4b68:	00000097          	auipc	ra,0x0
    4b6c:	e86080e7          	jalr	-378(ra) # 49ee <printint>
    4b70:	8bca                	mv	s7,s2
    4b72:	4981                	li	s3,0
    4b74:	b7a5                	j	4adc <vprintf+0x44>
    4b76:	008b8c13          	addi	s8,s7,8
    4b7a:	000bb983          	ld	s3,0(s7)
    4b7e:	03000593          	li	a1,48
    4b82:	8556                	mv	a0,s5
    4b84:	00000097          	auipc	ra,0x0
    4b88:	e48080e7          	jalr	-440(ra) # 49cc <putc>
    4b8c:	07800593          	li	a1,120
    4b90:	8556                	mv	a0,s5
    4b92:	00000097          	auipc	ra,0x0
    4b96:	e3a080e7          	jalr	-454(ra) # 49cc <putc>
    4b9a:	4941                	li	s2,16
    4b9c:	00002b97          	auipc	s7,0x2
    4ba0:	124b8b93          	addi	s7,s7,292 # 6cc0 <digits>
    4ba4:	03c9d793          	srli	a5,s3,0x3c
    4ba8:	97de                	add	a5,a5,s7
    4baa:	0007c583          	lbu	a1,0(a5)
    4bae:	8556                	mv	a0,s5
    4bb0:	00000097          	auipc	ra,0x0
    4bb4:	e1c080e7          	jalr	-484(ra) # 49cc <putc>
    4bb8:	0992                	slli	s3,s3,0x4
    4bba:	397d                	addiw	s2,s2,-1
    4bbc:	fe0914e3          	bnez	s2,4ba4 <vprintf+0x10c>
    4bc0:	8be2                	mv	s7,s8
    4bc2:	4981                	li	s3,0
    4bc4:	bf21                	j	4adc <vprintf+0x44>
    4bc6:	008b8993          	addi	s3,s7,8
    4bca:	000bb903          	ld	s2,0(s7)
    4bce:	02090163          	beqz	s2,4bf0 <vprintf+0x158>
    4bd2:	00094583          	lbu	a1,0(s2)
    4bd6:	c9a5                	beqz	a1,4c46 <vprintf+0x1ae>
    4bd8:	8556                	mv	a0,s5
    4bda:	00000097          	auipc	ra,0x0
    4bde:	df2080e7          	jalr	-526(ra) # 49cc <putc>
    4be2:	0905                	addi	s2,s2,1
    4be4:	00094583          	lbu	a1,0(s2)
    4be8:	f9e5                	bnez	a1,4bd8 <vprintf+0x140>
    4bea:	8bce                	mv	s7,s3
    4bec:	4981                	li	s3,0
    4bee:	b5fd                	j	4adc <vprintf+0x44>
    4bf0:	00002917          	auipc	s2,0x2
    4bf4:	07090913          	addi	s2,s2,112 # 6c60 <malloc+0x1f16>
    4bf8:	02800593          	li	a1,40
    4bfc:	bff1                	j	4bd8 <vprintf+0x140>
    4bfe:	008b8913          	addi	s2,s7,8
    4c02:	000bc583          	lbu	a1,0(s7)
    4c06:	8556                	mv	a0,s5
    4c08:	00000097          	auipc	ra,0x0
    4c0c:	dc4080e7          	jalr	-572(ra) # 49cc <putc>
    4c10:	8bca                	mv	s7,s2
    4c12:	4981                	li	s3,0
    4c14:	b5e1                	j	4adc <vprintf+0x44>
    4c16:	02500593          	li	a1,37
    4c1a:	8556                	mv	a0,s5
    4c1c:	00000097          	auipc	ra,0x0
    4c20:	db0080e7          	jalr	-592(ra) # 49cc <putc>
    4c24:	4981                	li	s3,0
    4c26:	bd5d                	j	4adc <vprintf+0x44>
    4c28:	02500593          	li	a1,37
    4c2c:	8556                	mv	a0,s5
    4c2e:	00000097          	auipc	ra,0x0
    4c32:	d9e080e7          	jalr	-610(ra) # 49cc <putc>
    4c36:	85ca                	mv	a1,s2
    4c38:	8556                	mv	a0,s5
    4c3a:	00000097          	auipc	ra,0x0
    4c3e:	d92080e7          	jalr	-622(ra) # 49cc <putc>
    4c42:	4981                	li	s3,0
    4c44:	bd61                	j	4adc <vprintf+0x44>
    4c46:	8bce                	mv	s7,s3
    4c48:	4981                	li	s3,0
    4c4a:	bd49                	j	4adc <vprintf+0x44>
    4c4c:	60a6                	ld	ra,72(sp)
    4c4e:	6406                	ld	s0,64(sp)
    4c50:	74e2                	ld	s1,56(sp)
    4c52:	7942                	ld	s2,48(sp)
    4c54:	79a2                	ld	s3,40(sp)
    4c56:	7a02                	ld	s4,32(sp)
    4c58:	6ae2                	ld	s5,24(sp)
    4c5a:	6b42                	ld	s6,16(sp)
    4c5c:	6ba2                	ld	s7,8(sp)
    4c5e:	6c02                	ld	s8,0(sp)
    4c60:	6161                	addi	sp,sp,80
    4c62:	8082                	ret

0000000000004c64 <fprintf>:
    4c64:	715d                	addi	sp,sp,-80
    4c66:	ec06                	sd	ra,24(sp)
    4c68:	e822                	sd	s0,16(sp)
    4c6a:	1000                	addi	s0,sp,32
    4c6c:	e010                	sd	a2,0(s0)
    4c6e:	e414                	sd	a3,8(s0)
    4c70:	e818                	sd	a4,16(s0)
    4c72:	ec1c                	sd	a5,24(s0)
    4c74:	03043023          	sd	a6,32(s0)
    4c78:	03143423          	sd	a7,40(s0)
    4c7c:	8622                	mv	a2,s0
    4c7e:	fe843423          	sd	s0,-24(s0)
    4c82:	00000097          	auipc	ra,0x0
    4c86:	e16080e7          	jalr	-490(ra) # 4a98 <vprintf>
    4c8a:	60e2                	ld	ra,24(sp)
    4c8c:	6442                	ld	s0,16(sp)
    4c8e:	6161                	addi	sp,sp,80
    4c90:	8082                	ret

0000000000004c92 <printf>:
    4c92:	711d                	addi	sp,sp,-96
    4c94:	ec06                	sd	ra,24(sp)
    4c96:	e822                	sd	s0,16(sp)
    4c98:	1000                	addi	s0,sp,32
    4c9a:	e40c                	sd	a1,8(s0)
    4c9c:	e810                	sd	a2,16(s0)
    4c9e:	ec14                	sd	a3,24(s0)
    4ca0:	f018                	sd	a4,32(s0)
    4ca2:	f41c                	sd	a5,40(s0)
    4ca4:	03043823          	sd	a6,48(s0)
    4ca8:	03143c23          	sd	a7,56(s0)
    4cac:	00840613          	addi	a2,s0,8
    4cb0:	fec43423          	sd	a2,-24(s0)
    4cb4:	85aa                	mv	a1,a0
    4cb6:	4505                	li	a0,1
    4cb8:	00000097          	auipc	ra,0x0
    4cbc:	de0080e7          	jalr	-544(ra) # 4a98 <vprintf>
    4cc0:	60e2                	ld	ra,24(sp)
    4cc2:	6442                	ld	s0,16(sp)
    4cc4:	6125                	addi	sp,sp,96
    4cc6:	8082                	ret

0000000000004cc8 <free>:
    4cc8:	1141                	addi	sp,sp,-16
    4cca:	e422                	sd	s0,8(sp)
    4ccc:	0800                	addi	s0,sp,16
    4cce:	ff050693          	addi	a3,a0,-16
    4cd2:	00007797          	auipc	a5,0x7
    4cd6:	38e7b783          	ld	a5,910(a5) # c060 <freep>
    4cda:	a02d                	j	4d04 <free+0x3c>
    4cdc:	4618                	lw	a4,8(a2)
    4cde:	9f2d                	addw	a4,a4,a1
    4ce0:	fee52c23          	sw	a4,-8(a0)
    4ce4:	6398                	ld	a4,0(a5)
    4ce6:	6310                	ld	a2,0(a4)
    4ce8:	a83d                	j	4d26 <free+0x5e>
    4cea:	ff852703          	lw	a4,-8(a0)
    4cee:	9f31                	addw	a4,a4,a2
    4cf0:	c798                	sw	a4,8(a5)
    4cf2:	ff053683          	ld	a3,-16(a0)
    4cf6:	a091                	j	4d3a <free+0x72>
    4cf8:	6398                	ld	a4,0(a5)
    4cfa:	00e7e463          	bltu	a5,a4,4d02 <free+0x3a>
    4cfe:	00e6ea63          	bltu	a3,a4,4d12 <free+0x4a>
    4d02:	87ba                	mv	a5,a4
    4d04:	fed7fae3          	bgeu	a5,a3,4cf8 <free+0x30>
    4d08:	6398                	ld	a4,0(a5)
    4d0a:	00e6e463          	bltu	a3,a4,4d12 <free+0x4a>
    4d0e:	fee7eae3          	bltu	a5,a4,4d02 <free+0x3a>
    4d12:	ff852583          	lw	a1,-8(a0)
    4d16:	6390                	ld	a2,0(a5)
    4d18:	02059813          	slli	a6,a1,0x20
    4d1c:	01c85713          	srli	a4,a6,0x1c
    4d20:	9736                	add	a4,a4,a3
    4d22:	fae60de3          	beq	a2,a4,4cdc <free+0x14>
    4d26:	fec53823          	sd	a2,-16(a0)
    4d2a:	4790                	lw	a2,8(a5)
    4d2c:	02061593          	slli	a1,a2,0x20
    4d30:	01c5d713          	srli	a4,a1,0x1c
    4d34:	973e                	add	a4,a4,a5
    4d36:	fae68ae3          	beq	a3,a4,4cea <free+0x22>
    4d3a:	e394                	sd	a3,0(a5)
    4d3c:	00007717          	auipc	a4,0x7
    4d40:	32f73223          	sd	a5,804(a4) # c060 <freep>
    4d44:	6422                	ld	s0,8(sp)
    4d46:	0141                	addi	sp,sp,16
    4d48:	8082                	ret

0000000000004d4a <malloc>:
    4d4a:	7139                	addi	sp,sp,-64
    4d4c:	fc06                	sd	ra,56(sp)
    4d4e:	f822                	sd	s0,48(sp)
    4d50:	f426                	sd	s1,40(sp)
    4d52:	f04a                	sd	s2,32(sp)
    4d54:	ec4e                	sd	s3,24(sp)
    4d56:	e852                	sd	s4,16(sp)
    4d58:	e456                	sd	s5,8(sp)
    4d5a:	e05a                	sd	s6,0(sp)
    4d5c:	0080                	addi	s0,sp,64
    4d5e:	02051493          	slli	s1,a0,0x20
    4d62:	9081                	srli	s1,s1,0x20
    4d64:	04bd                	addi	s1,s1,15
    4d66:	8091                	srli	s1,s1,0x4
    4d68:	0014899b          	addiw	s3,s1,1
    4d6c:	0485                	addi	s1,s1,1
    4d6e:	00007517          	auipc	a0,0x7
    4d72:	2f253503          	ld	a0,754(a0) # c060 <freep>
    4d76:	c515                	beqz	a0,4da2 <malloc+0x58>
    4d78:	611c                	ld	a5,0(a0)
    4d7a:	4798                	lw	a4,8(a5)
    4d7c:	04977063          	bgeu	a4,s1,4dbc <malloc+0x72>
    4d80:	8a4e                	mv	s4,s3
    4d82:	0009871b          	sext.w	a4,s3
    4d86:	6685                	lui	a3,0x1
    4d88:	00d77363          	bgeu	a4,a3,4d8e <malloc+0x44>
    4d8c:	6a05                	lui	s4,0x1
    4d8e:	000a0b1b          	sext.w	s6,s4
    4d92:	004a1a1b          	slliw	s4,s4,0x4
    4d96:	00007917          	auipc	s2,0x7
    4d9a:	2ca90913          	addi	s2,s2,714 # c060 <freep>
    4d9e:	5afd                	li	s5,-1
    4da0:	a89d                	j	4e16 <malloc+0xcc>
    4da2:	00007717          	auipc	a4,0x7
    4da6:	2be70713          	addi	a4,a4,702 # c060 <freep>
    4daa:	00007797          	auipc	a5,0x7
    4dae:	2be78793          	addi	a5,a5,702 # c068 <base>
    4db2:	e31c                	sd	a5,0(a4)
    4db4:	e71c                	sd	a5,8(a4)
    4db6:	00072823          	sw	zero,16(a4)
    4dba:	b7d9                	j	4d80 <malloc+0x36>
    4dbc:	02e48c63          	beq	s1,a4,4df4 <malloc+0xaa>
    4dc0:	4137073b          	subw	a4,a4,s3
    4dc4:	c798                	sw	a4,8(a5)
    4dc6:	02071693          	slli	a3,a4,0x20
    4dca:	01c6d713          	srli	a4,a3,0x1c
    4dce:	97ba                	add	a5,a5,a4
    4dd0:	0137a423          	sw	s3,8(a5)
    4dd4:	00007717          	auipc	a4,0x7
    4dd8:	28a73623          	sd	a0,652(a4) # c060 <freep>
    4ddc:	01078513          	addi	a0,a5,16
    4de0:	70e2                	ld	ra,56(sp)
    4de2:	7442                	ld	s0,48(sp)
    4de4:	74a2                	ld	s1,40(sp)
    4de6:	7902                	ld	s2,32(sp)
    4de8:	69e2                	ld	s3,24(sp)
    4dea:	6a42                	ld	s4,16(sp)
    4dec:	6aa2                	ld	s5,8(sp)
    4dee:	6b02                	ld	s6,0(sp)
    4df0:	6121                	addi	sp,sp,64
    4df2:	8082                	ret
    4df4:	6398                	ld	a4,0(a5)
    4df6:	e118                	sd	a4,0(a0)
    4df8:	bff1                	j	4dd4 <malloc+0x8a>
    4dfa:	01652423          	sw	s6,8(a0)
    4dfe:	0541                	addi	a0,a0,16
    4e00:	00000097          	auipc	ra,0x0
    4e04:	ec8080e7          	jalr	-312(ra) # 4cc8 <free>
    4e08:	00093503          	ld	a0,0(s2)
    4e0c:	d971                	beqz	a0,4de0 <malloc+0x96>
    4e0e:	611c                	ld	a5,0(a0)
    4e10:	4798                	lw	a4,8(a5)
    4e12:	fa9775e3          	bgeu	a4,s1,4dbc <malloc+0x72>
    4e16:	00093703          	ld	a4,0(s2)
    4e1a:	853e                	mv	a0,a5
    4e1c:	fef719e3          	bne	a4,a5,4e0e <malloc+0xc4>
    4e20:	8552                	mv	a0,s4
    4e22:	00000097          	auipc	ra,0x0
    4e26:	b52080e7          	jalr	-1198(ra) # 4974 <sbrk>
    4e2a:	fd5518e3          	bne	a0,s5,4dfa <malloc+0xb0>
    4e2e:	4501                	li	a0,0
    4e30:	bf45                	j	4de0 <malloc+0x96>
