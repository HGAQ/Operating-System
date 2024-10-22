
xv6-user/_grep:     file format elf64-littleriscv


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
 11a:	715d                	addi	sp,sp,-80
 11c:	e486                	sd	ra,72(sp)
 11e:	e0a2                	sd	s0,64(sp)
 120:	fc26                	sd	s1,56(sp)
 122:	f84a                	sd	s2,48(sp)
 124:	f44e                	sd	s3,40(sp)
 126:	f052                	sd	s4,32(sp)
 128:	ec56                	sd	s5,24(sp)
 12a:	e85a                	sd	s6,16(sp)
 12c:	e45e                	sd	s7,8(sp)
 12e:	0880                	addi	s0,sp,80
 130:	89aa                	mv	s3,a0
 132:	8b2e                	mv	s6,a1
  m = 0;
 134:	4a01                	li	s4,0
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 136:	3ff00b93          	li	s7,1023
 13a:	00001a97          	auipc	s5,0x1
 13e:	9fea8a93          	addi	s5,s5,-1538 # b38 <buf>
 142:	a0a1                	j	18a <grep+0x70>
      p = q+1;
 144:	00148913          	addi	s2,s1,1
    while((q = strchr(p, '\n')) != 0){
 148:	45a9                	li	a1,10
 14a:	854a                	mv	a0,s2
 14c:	00000097          	auipc	ra,0x0
 150:	214080e7          	jalr	532(ra) # 360 <strchr>
 154:	84aa                	mv	s1,a0
 156:	c905                	beqz	a0,186 <grep+0x6c>
      *q = 0;
 158:	00048023          	sb	zero,0(s1)
      if(match(pattern, p)){
 15c:	85ca                	mv	a1,s2
 15e:	854e                	mv	a0,s3
 160:	00000097          	auipc	ra,0x0
 164:	f6c080e7          	jalr	-148(ra) # cc <match>
 168:	dd71                	beqz	a0,144 <grep+0x2a>
        *q = '\n';
 16a:	47a9                	li	a5,10
 16c:	00f48023          	sb	a5,0(s1)
        write(1, p, q+1 - p);
 170:	00148613          	addi	a2,s1,1
 174:	4126063b          	subw	a2,a2,s2
 178:	85ca                	mv	a1,s2
 17a:	4505                	li	a0,1
 17c:	00000097          	auipc	ra,0x0
 180:	3fa080e7          	jalr	1018(ra) # 576 <write>
 184:	b7c1                	j	144 <grep+0x2a>
    if(m > 0){
 186:	03404563          	bgtz	s4,1b0 <grep+0x96>
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 18a:	414b863b          	subw	a2,s7,s4
 18e:	014a85b3          	add	a1,s5,s4
 192:	855a                	mv	a0,s6
 194:	00000097          	auipc	ra,0x0
 198:	3da080e7          	jalr	986(ra) # 56e <read>
 19c:	02a05663          	blez	a0,1c8 <grep+0xae>
    m += n;
 1a0:	00aa0a3b          	addw	s4,s4,a0
    buf[m] = '\0';
 1a4:	014a87b3          	add	a5,s5,s4
 1a8:	00078023          	sb	zero,0(a5)
    p = buf;
 1ac:	8956                	mv	s2,s5
    while((q = strchr(p, '\n')) != 0){
 1ae:	bf69                	j	148 <grep+0x2e>
      m -= p - buf;
 1b0:	415907b3          	sub	a5,s2,s5
 1b4:	40fa0a3b          	subw	s4,s4,a5
      memmove(buf, p, m);
 1b8:	8652                	mv	a2,s4
 1ba:	85ca                	mv	a1,s2
 1bc:	8556                	mv	a0,s5
 1be:	00000097          	auipc	ra,0x0
 1c2:	2e6080e7          	jalr	742(ra) # 4a4 <memmove>
 1c6:	b7d1                	j	18a <grep+0x70>
}
 1c8:	60a6                	ld	ra,72(sp)
 1ca:	6406                	ld	s0,64(sp)
 1cc:	74e2                	ld	s1,56(sp)
 1ce:	7942                	ld	s2,48(sp)
 1d0:	79a2                	ld	s3,40(sp)
 1d2:	7a02                	ld	s4,32(sp)
 1d4:	6ae2                	ld	s5,24(sp)
 1d6:	6b42                	ld	s6,16(sp)
 1d8:	6ba2                	ld	s7,8(sp)
 1da:	6161                	addi	sp,sp,80
 1dc:	8082                	ret

00000000000001de <main>:
{
 1de:	7139                	addi	sp,sp,-64
 1e0:	fc06                	sd	ra,56(sp)
 1e2:	f822                	sd	s0,48(sp)
 1e4:	f426                	sd	s1,40(sp)
 1e6:	f04a                	sd	s2,32(sp)
 1e8:	ec4e                	sd	s3,24(sp)
 1ea:	e852                	sd	s4,16(sp)
 1ec:	e456                	sd	s5,8(sp)
 1ee:	0080                	addi	s0,sp,64
  if(argc <= 1){
 1f0:	4785                	li	a5,1
 1f2:	04a7de63          	bge	a5,a0,24e <main+0x70>
  pattern = argv[1];
 1f6:	0085ba03          	ld	s4,8(a1)
  if(argc <= 2){
 1fa:	4789                	li	a5,2
 1fc:	06a7d763          	bge	a5,a0,26a <main+0x8c>
 200:	01058913          	addi	s2,a1,16
 204:	ffd5099b          	addiw	s3,a0,-3
 208:	02099793          	slli	a5,s3,0x20
 20c:	01d7d993          	srli	s3,a5,0x1d
 210:	05e1                	addi	a1,a1,24
 212:	99ae                	add	s3,s3,a1
    if((fd = open(argv[i], 0)) < 0){
 214:	4581                	li	a1,0
 216:	00093503          	ld	a0,0(s2)
 21a:	00000097          	auipc	ra,0x0
 21e:	37c080e7          	jalr	892(ra) # 596 <open>
 222:	84aa                	mv	s1,a0
 224:	04054e63          	bltz	a0,280 <main+0xa2>
    grep(pattern, fd);
 228:	85aa                	mv	a1,a0
 22a:	8552                	mv	a0,s4
 22c:	00000097          	auipc	ra,0x0
 230:	eee080e7          	jalr	-274(ra) # 11a <grep>
    close(fd);
 234:	8526                	mv	a0,s1
 236:	00000097          	auipc	ra,0x0
 23a:	348080e7          	jalr	840(ra) # 57e <close>
  for(i = 2; i < argc; i++){
 23e:	0921                	addi	s2,s2,8
 240:	fd391ae3          	bne	s2,s3,214 <main+0x36>
  exit(0);
 244:	4501                	li	a0,0
 246:	00000097          	auipc	ra,0x0
 24a:	310080e7          	jalr	784(ra) # 556 <exit>
    fprintf(2, "usage: grep pattern [file ...]\n");
 24e:	00001597          	auipc	a1,0x1
 252:	83a58593          	addi	a1,a1,-1990 # a88 <malloc+0xec>
 256:	4509                	li	a0,2
 258:	00000097          	auipc	ra,0x0
 25c:	65e080e7          	jalr	1630(ra) # 8b6 <fprintf>
    exit(1);
 260:	4505                	li	a0,1
 262:	00000097          	auipc	ra,0x0
 266:	2f4080e7          	jalr	756(ra) # 556 <exit>
    grep(pattern, 0);
 26a:	4581                	li	a1,0
 26c:	8552                	mv	a0,s4
 26e:	00000097          	auipc	ra,0x0
 272:	eac080e7          	jalr	-340(ra) # 11a <grep>
    exit(0);
 276:	4501                	li	a0,0
 278:	00000097          	auipc	ra,0x0
 27c:	2de080e7          	jalr	734(ra) # 556 <exit>
      printf("grep: cannot open %s\n", argv[i]);
 280:	00093583          	ld	a1,0(s2)
 284:	00001517          	auipc	a0,0x1
 288:	82450513          	addi	a0,a0,-2012 # aa8 <malloc+0x10c>
 28c:	00000097          	auipc	ra,0x0
 290:	658080e7          	jalr	1624(ra) # 8e4 <printf>
      exit(1);
 294:	4505                	li	a0,1
 296:	00000097          	auipc	ra,0x0
 29a:	2c0080e7          	jalr	704(ra) # 556 <exit>

000000000000029e <strcpy>:
 29e:	1141                	addi	sp,sp,-16
 2a0:	e422                	sd	s0,8(sp)
 2a2:	0800                	addi	s0,sp,16
 2a4:	87aa                	mv	a5,a0
 2a6:	0585                	addi	a1,a1,1
 2a8:	0785                	addi	a5,a5,1
 2aa:	fff5c703          	lbu	a4,-1(a1)
 2ae:	fee78fa3          	sb	a4,-1(a5)
 2b2:	fb75                	bnez	a4,2a6 <strcpy+0x8>
 2b4:	6422                	ld	s0,8(sp)
 2b6:	0141                	addi	sp,sp,16
 2b8:	8082                	ret

00000000000002ba <strcat>:
 2ba:	1141                	addi	sp,sp,-16
 2bc:	e422                	sd	s0,8(sp)
 2be:	0800                	addi	s0,sp,16
 2c0:	00054783          	lbu	a5,0(a0)
 2c4:	c385                	beqz	a5,2e4 <strcat+0x2a>
 2c6:	87aa                	mv	a5,a0
 2c8:	0785                	addi	a5,a5,1
 2ca:	0007c703          	lbu	a4,0(a5)
 2ce:	ff6d                	bnez	a4,2c8 <strcat+0xe>
 2d0:	0585                	addi	a1,a1,1
 2d2:	0785                	addi	a5,a5,1
 2d4:	fff5c703          	lbu	a4,-1(a1)
 2d8:	fee78fa3          	sb	a4,-1(a5)
 2dc:	fb75                	bnez	a4,2d0 <strcat+0x16>
 2de:	6422                	ld	s0,8(sp)
 2e0:	0141                	addi	sp,sp,16
 2e2:	8082                	ret
 2e4:	87aa                	mv	a5,a0
 2e6:	b7ed                	j	2d0 <strcat+0x16>

00000000000002e8 <strcmp>:
 2e8:	1141                	addi	sp,sp,-16
 2ea:	e422                	sd	s0,8(sp)
 2ec:	0800                	addi	s0,sp,16
 2ee:	00054783          	lbu	a5,0(a0)
 2f2:	cb91                	beqz	a5,306 <strcmp+0x1e>
 2f4:	0005c703          	lbu	a4,0(a1)
 2f8:	00f71763          	bne	a4,a5,306 <strcmp+0x1e>
 2fc:	0505                	addi	a0,a0,1
 2fe:	0585                	addi	a1,a1,1
 300:	00054783          	lbu	a5,0(a0)
 304:	fbe5                	bnez	a5,2f4 <strcmp+0xc>
 306:	0005c503          	lbu	a0,0(a1)
 30a:	40a7853b          	subw	a0,a5,a0
 30e:	6422                	ld	s0,8(sp)
 310:	0141                	addi	sp,sp,16
 312:	8082                	ret

0000000000000314 <strlen>:
 314:	1141                	addi	sp,sp,-16
 316:	e422                	sd	s0,8(sp)
 318:	0800                	addi	s0,sp,16
 31a:	00054783          	lbu	a5,0(a0)
 31e:	cf91                	beqz	a5,33a <strlen+0x26>
 320:	0505                	addi	a0,a0,1
 322:	87aa                	mv	a5,a0
 324:	86be                	mv	a3,a5
 326:	0785                	addi	a5,a5,1
 328:	fff7c703          	lbu	a4,-1(a5)
 32c:	ff65                	bnez	a4,324 <strlen+0x10>
 32e:	40a6853b          	subw	a0,a3,a0
 332:	2505                	addiw	a0,a0,1
 334:	6422                	ld	s0,8(sp)
 336:	0141                	addi	sp,sp,16
 338:	8082                	ret
 33a:	4501                	li	a0,0
 33c:	bfe5                	j	334 <strlen+0x20>

000000000000033e <memset>:
 33e:	1141                	addi	sp,sp,-16
 340:	e422                	sd	s0,8(sp)
 342:	0800                	addi	s0,sp,16
 344:	ca19                	beqz	a2,35a <memset+0x1c>
 346:	87aa                	mv	a5,a0
 348:	1602                	slli	a2,a2,0x20
 34a:	9201                	srli	a2,a2,0x20
 34c:	00a60733          	add	a4,a2,a0
 350:	00b78023          	sb	a1,0(a5)
 354:	0785                	addi	a5,a5,1
 356:	fee79de3          	bne	a5,a4,350 <memset+0x12>
 35a:	6422                	ld	s0,8(sp)
 35c:	0141                	addi	sp,sp,16
 35e:	8082                	ret

0000000000000360 <strchr>:
 360:	1141                	addi	sp,sp,-16
 362:	e422                	sd	s0,8(sp)
 364:	0800                	addi	s0,sp,16
 366:	00054783          	lbu	a5,0(a0)
 36a:	cb99                	beqz	a5,380 <strchr+0x20>
 36c:	00f58763          	beq	a1,a5,37a <strchr+0x1a>
 370:	0505                	addi	a0,a0,1
 372:	00054783          	lbu	a5,0(a0)
 376:	fbfd                	bnez	a5,36c <strchr+0xc>
 378:	4501                	li	a0,0
 37a:	6422                	ld	s0,8(sp)
 37c:	0141                	addi	sp,sp,16
 37e:	8082                	ret
 380:	4501                	li	a0,0
 382:	bfe5                	j	37a <strchr+0x1a>

0000000000000384 <gets>:
 384:	711d                	addi	sp,sp,-96
 386:	ec86                	sd	ra,88(sp)
 388:	e8a2                	sd	s0,80(sp)
 38a:	e4a6                	sd	s1,72(sp)
 38c:	e0ca                	sd	s2,64(sp)
 38e:	fc4e                	sd	s3,56(sp)
 390:	f852                	sd	s4,48(sp)
 392:	f456                	sd	s5,40(sp)
 394:	f05a                	sd	s6,32(sp)
 396:	ec5e                	sd	s7,24(sp)
 398:	e862                	sd	s8,16(sp)
 39a:	1080                	addi	s0,sp,96
 39c:	8baa                	mv	s7,a0
 39e:	8a2e                	mv	s4,a1
 3a0:	892a                	mv	s2,a0
 3a2:	4481                	li	s1,0
 3a4:	faf40a93          	addi	s5,s0,-81
 3a8:	4b29                	li	s6,10
 3aa:	4c35                	li	s8,13
 3ac:	89a6                	mv	s3,s1
 3ae:	2485                	addiw	s1,s1,1
 3b0:	0344d763          	bge	s1,s4,3de <gets+0x5a>
 3b4:	4605                	li	a2,1
 3b6:	85d6                	mv	a1,s5
 3b8:	4501                	li	a0,0
 3ba:	00000097          	auipc	ra,0x0
 3be:	1b4080e7          	jalr	436(ra) # 56e <read>
 3c2:	00a05e63          	blez	a0,3de <gets+0x5a>
 3c6:	faf44783          	lbu	a5,-81(s0)
 3ca:	00f90023          	sb	a5,0(s2)
 3ce:	01678763          	beq	a5,s6,3dc <gets+0x58>
 3d2:	0905                	addi	s2,s2,1
 3d4:	fd879ce3          	bne	a5,s8,3ac <gets+0x28>
 3d8:	89a6                	mv	s3,s1
 3da:	a011                	j	3de <gets+0x5a>
 3dc:	89a6                	mv	s3,s1
 3de:	99de                	add	s3,s3,s7
 3e0:	00098023          	sb	zero,0(s3)
 3e4:	855e                	mv	a0,s7
 3e6:	60e6                	ld	ra,88(sp)
 3e8:	6446                	ld	s0,80(sp)
 3ea:	64a6                	ld	s1,72(sp)
 3ec:	6906                	ld	s2,64(sp)
 3ee:	79e2                	ld	s3,56(sp)
 3f0:	7a42                	ld	s4,48(sp)
 3f2:	7aa2                	ld	s5,40(sp)
 3f4:	7b02                	ld	s6,32(sp)
 3f6:	6be2                	ld	s7,24(sp)
 3f8:	6c42                	ld	s8,16(sp)
 3fa:	6125                	addi	sp,sp,96
 3fc:	8082                	ret

00000000000003fe <stat>:
 3fe:	1101                	addi	sp,sp,-32
 400:	ec06                	sd	ra,24(sp)
 402:	e822                	sd	s0,16(sp)
 404:	e426                	sd	s1,8(sp)
 406:	e04a                	sd	s2,0(sp)
 408:	1000                	addi	s0,sp,32
 40a:	892e                	mv	s2,a1
 40c:	4581                	li	a1,0
 40e:	00000097          	auipc	ra,0x0
 412:	188080e7          	jalr	392(ra) # 596 <open>
 416:	02054563          	bltz	a0,440 <stat+0x42>
 41a:	84aa                	mv	s1,a0
 41c:	85ca                	mv	a1,s2
 41e:	00000097          	auipc	ra,0x0
 422:	180080e7          	jalr	384(ra) # 59e <fstat>
 426:	892a                	mv	s2,a0
 428:	8526                	mv	a0,s1
 42a:	00000097          	auipc	ra,0x0
 42e:	154080e7          	jalr	340(ra) # 57e <close>
 432:	854a                	mv	a0,s2
 434:	60e2                	ld	ra,24(sp)
 436:	6442                	ld	s0,16(sp)
 438:	64a2                	ld	s1,8(sp)
 43a:	6902                	ld	s2,0(sp)
 43c:	6105                	addi	sp,sp,32
 43e:	8082                	ret
 440:	597d                	li	s2,-1
 442:	bfc5                	j	432 <stat+0x34>

0000000000000444 <atoi>:
 444:	1141                	addi	sp,sp,-16
 446:	e422                	sd	s0,8(sp)
 448:	0800                	addi	s0,sp,16
 44a:	00054703          	lbu	a4,0(a0)
 44e:	02d00793          	li	a5,45
 452:	4585                	li	a1,1
 454:	04f70363          	beq	a4,a5,49a <atoi+0x56>
 458:	00054703          	lbu	a4,0(a0)
 45c:	fd07079b          	addiw	a5,a4,-48
 460:	0ff7f793          	zext.b	a5,a5
 464:	46a5                	li	a3,9
 466:	02f6ed63          	bltu	a3,a5,4a0 <atoi+0x5c>
 46a:	4681                	li	a3,0
 46c:	4625                	li	a2,9
 46e:	0505                	addi	a0,a0,1
 470:	0026979b          	slliw	a5,a3,0x2
 474:	9fb5                	addw	a5,a5,a3
 476:	0017979b          	slliw	a5,a5,0x1
 47a:	9fb9                	addw	a5,a5,a4
 47c:	fd07869b          	addiw	a3,a5,-48
 480:	00054703          	lbu	a4,0(a0)
 484:	fd07079b          	addiw	a5,a4,-48
 488:	0ff7f793          	zext.b	a5,a5
 48c:	fef671e3          	bgeu	a2,a5,46e <atoi+0x2a>
 490:	02d5853b          	mulw	a0,a1,a3
 494:	6422                	ld	s0,8(sp)
 496:	0141                	addi	sp,sp,16
 498:	8082                	ret
 49a:	0505                	addi	a0,a0,1
 49c:	55fd                	li	a1,-1
 49e:	bf6d                	j	458 <atoi+0x14>
 4a0:	4681                	li	a3,0
 4a2:	b7fd                	j	490 <atoi+0x4c>

00000000000004a4 <memmove>:
 4a4:	1141                	addi	sp,sp,-16
 4a6:	e422                	sd	s0,8(sp)
 4a8:	0800                	addi	s0,sp,16
 4aa:	02b57463          	bgeu	a0,a1,4d2 <memmove+0x2e>
 4ae:	00c05f63          	blez	a2,4cc <memmove+0x28>
 4b2:	1602                	slli	a2,a2,0x20
 4b4:	9201                	srli	a2,a2,0x20
 4b6:	00c507b3          	add	a5,a0,a2
 4ba:	872a                	mv	a4,a0
 4bc:	0585                	addi	a1,a1,1
 4be:	0705                	addi	a4,a4,1
 4c0:	fff5c683          	lbu	a3,-1(a1)
 4c4:	fed70fa3          	sb	a3,-1(a4)
 4c8:	fee79ae3          	bne	a5,a4,4bc <memmove+0x18>
 4cc:	6422                	ld	s0,8(sp)
 4ce:	0141                	addi	sp,sp,16
 4d0:	8082                	ret
 4d2:	00c50733          	add	a4,a0,a2
 4d6:	95b2                	add	a1,a1,a2
 4d8:	fec05ae3          	blez	a2,4cc <memmove+0x28>
 4dc:	fff6079b          	addiw	a5,a2,-1
 4e0:	1782                	slli	a5,a5,0x20
 4e2:	9381                	srli	a5,a5,0x20
 4e4:	fff7c793          	not	a5,a5
 4e8:	97ba                	add	a5,a5,a4
 4ea:	15fd                	addi	a1,a1,-1
 4ec:	177d                	addi	a4,a4,-1
 4ee:	0005c683          	lbu	a3,0(a1)
 4f2:	00d70023          	sb	a3,0(a4)
 4f6:	fee79ae3          	bne	a5,a4,4ea <memmove+0x46>
 4fa:	bfc9                	j	4cc <memmove+0x28>

00000000000004fc <memcmp>:
 4fc:	1141                	addi	sp,sp,-16
 4fe:	e422                	sd	s0,8(sp)
 500:	0800                	addi	s0,sp,16
 502:	ca05                	beqz	a2,532 <memcmp+0x36>
 504:	fff6069b          	addiw	a3,a2,-1
 508:	1682                	slli	a3,a3,0x20
 50a:	9281                	srli	a3,a3,0x20
 50c:	0685                	addi	a3,a3,1
 50e:	96aa                	add	a3,a3,a0
 510:	00054783          	lbu	a5,0(a0)
 514:	0005c703          	lbu	a4,0(a1)
 518:	00e79863          	bne	a5,a4,528 <memcmp+0x2c>
 51c:	0505                	addi	a0,a0,1
 51e:	0585                	addi	a1,a1,1
 520:	fed518e3          	bne	a0,a3,510 <memcmp+0x14>
 524:	4501                	li	a0,0
 526:	a019                	j	52c <memcmp+0x30>
 528:	40e7853b          	subw	a0,a5,a4
 52c:	6422                	ld	s0,8(sp)
 52e:	0141                	addi	sp,sp,16
 530:	8082                	ret
 532:	4501                	li	a0,0
 534:	bfe5                	j	52c <memcmp+0x30>

0000000000000536 <memcpy>:
 536:	1141                	addi	sp,sp,-16
 538:	e406                	sd	ra,8(sp)
 53a:	e022                	sd	s0,0(sp)
 53c:	0800                	addi	s0,sp,16
 53e:	00000097          	auipc	ra,0x0
 542:	f66080e7          	jalr	-154(ra) # 4a4 <memmove>
 546:	60a2                	ld	ra,8(sp)
 548:	6402                	ld	s0,0(sp)
 54a:	0141                	addi	sp,sp,16
 54c:	8082                	ret

000000000000054e <fork>:
 54e:	4885                	li	a7,1
 550:	00000073          	ecall
 554:	8082                	ret

0000000000000556 <exit>:
 556:	4889                	li	a7,2
 558:	00000073          	ecall
 55c:	8082                	ret

000000000000055e <wait>:
 55e:	488d                	li	a7,3
 560:	00000073          	ecall
 564:	8082                	ret

0000000000000566 <pipe>:
 566:	4891                	li	a7,4
 568:	00000073          	ecall
 56c:	8082                	ret

000000000000056e <read>:
 56e:	4895                	li	a7,5
 570:	00000073          	ecall
 574:	8082                	ret

0000000000000576 <write>:
 576:	48c1                	li	a7,16
 578:	00000073          	ecall
 57c:	8082                	ret

000000000000057e <close>:
 57e:	48d5                	li	a7,21
 580:	00000073          	ecall
 584:	8082                	ret

0000000000000586 <kill>:
 586:	4899                	li	a7,6
 588:	00000073          	ecall
 58c:	8082                	ret

000000000000058e <exec>:
 58e:	489d                	li	a7,7
 590:	00000073          	ecall
 594:	8082                	ret

0000000000000596 <open>:
 596:	48bd                	li	a7,15
 598:	00000073          	ecall
 59c:	8082                	ret

000000000000059e <fstat>:
 59e:	48a1                	li	a7,8
 5a0:	00000073          	ecall
 5a4:	8082                	ret

00000000000005a6 <mkdir>:
 5a6:	48d1                	li	a7,20
 5a8:	00000073          	ecall
 5ac:	8082                	ret

00000000000005ae <chdir>:
 5ae:	48a5                	li	a7,9
 5b0:	00000073          	ecall
 5b4:	8082                	ret

00000000000005b6 <dup>:
 5b6:	48a9                	li	a7,10
 5b8:	00000073          	ecall
 5bc:	8082                	ret

00000000000005be <getpid>:
 5be:	48ad                	li	a7,11
 5c0:	00000073          	ecall
 5c4:	8082                	ret

00000000000005c6 <sbrk>:
 5c6:	48b1                	li	a7,12
 5c8:	00000073          	ecall
 5cc:	8082                	ret

00000000000005ce <sleep>:
 5ce:	48b5                	li	a7,13
 5d0:	00000073          	ecall
 5d4:	8082                	ret

00000000000005d6 <uptime>:
 5d6:	48b9                	li	a7,14
 5d8:	00000073          	ecall
 5dc:	8082                	ret

00000000000005de <test_proc>:
 5de:	48d9                	li	a7,22
 5e0:	00000073          	ecall
 5e4:	8082                	ret

00000000000005e6 <dev>:
 5e6:	48dd                	li	a7,23
 5e8:	00000073          	ecall
 5ec:	8082                	ret

00000000000005ee <readdir>:
 5ee:	48e1                	li	a7,24
 5f0:	00000073          	ecall
 5f4:	8082                	ret

00000000000005f6 <getcwd>:
 5f6:	48e5                	li	a7,25
 5f8:	00000073          	ecall
 5fc:	8082                	ret

00000000000005fe <remove>:
 5fe:	48c5                	li	a7,17
 600:	00000073          	ecall
 604:	8082                	ret

0000000000000606 <trace>:
 606:	48c9                	li	a7,18
 608:	00000073          	ecall
 60c:	8082                	ret

000000000000060e <sysinfo>:
 60e:	48cd                	li	a7,19
 610:	00000073          	ecall
 614:	8082                	ret

0000000000000616 <rename>:
 616:	48e9                	li	a7,26
 618:	00000073          	ecall
 61c:	8082                	ret

000000000000061e <putc>:
 61e:	1101                	addi	sp,sp,-32
 620:	ec06                	sd	ra,24(sp)
 622:	e822                	sd	s0,16(sp)
 624:	1000                	addi	s0,sp,32
 626:	feb407a3          	sb	a1,-17(s0)
 62a:	4605                	li	a2,1
 62c:	fef40593          	addi	a1,s0,-17
 630:	00000097          	auipc	ra,0x0
 634:	f46080e7          	jalr	-186(ra) # 576 <write>
 638:	60e2                	ld	ra,24(sp)
 63a:	6442                	ld	s0,16(sp)
 63c:	6105                	addi	sp,sp,32
 63e:	8082                	ret

0000000000000640 <printint>:
 640:	7139                	addi	sp,sp,-64
 642:	fc06                	sd	ra,56(sp)
 644:	f822                	sd	s0,48(sp)
 646:	f426                	sd	s1,40(sp)
 648:	f04a                	sd	s2,32(sp)
 64a:	ec4e                	sd	s3,24(sp)
 64c:	0080                	addi	s0,sp,64
 64e:	84aa                	mv	s1,a0
 650:	c299                	beqz	a3,656 <printint+0x16>
 652:	0805c863          	bltz	a1,6e2 <printint+0xa2>
 656:	2581                	sext.w	a1,a1
 658:	4881                	li	a7,0
 65a:	fc040993          	addi	s3,s0,-64
 65e:	86ce                	mv	a3,s3
 660:	4701                	li	a4,0
 662:	2601                	sext.w	a2,a2
 664:	00000517          	auipc	a0,0x0
 668:	4bc50513          	addi	a0,a0,1212 # b20 <digits>
 66c:	883a                	mv	a6,a4
 66e:	2705                	addiw	a4,a4,1
 670:	02c5f7bb          	remuw	a5,a1,a2
 674:	1782                	slli	a5,a5,0x20
 676:	9381                	srli	a5,a5,0x20
 678:	97aa                	add	a5,a5,a0
 67a:	0007c783          	lbu	a5,0(a5)
 67e:	00f68023          	sb	a5,0(a3)
 682:	0005879b          	sext.w	a5,a1
 686:	02c5d5bb          	divuw	a1,a1,a2
 68a:	0685                	addi	a3,a3,1
 68c:	fec7f0e3          	bgeu	a5,a2,66c <printint+0x2c>
 690:	00088c63          	beqz	a7,6a8 <printint+0x68>
 694:	fd070793          	addi	a5,a4,-48
 698:	00878733          	add	a4,a5,s0
 69c:	02d00793          	li	a5,45
 6a0:	fef70823          	sb	a5,-16(a4)
 6a4:	0028071b          	addiw	a4,a6,2
 6a8:	02e05663          	blez	a4,6d4 <printint+0x94>
 6ac:	fc040913          	addi	s2,s0,-64
 6b0:	993a                	add	s2,s2,a4
 6b2:	19fd                	addi	s3,s3,-1
 6b4:	99ba                	add	s3,s3,a4
 6b6:	377d                	addiw	a4,a4,-1
 6b8:	1702                	slli	a4,a4,0x20
 6ba:	9301                	srli	a4,a4,0x20
 6bc:	40e989b3          	sub	s3,s3,a4
 6c0:	fff94583          	lbu	a1,-1(s2)
 6c4:	8526                	mv	a0,s1
 6c6:	00000097          	auipc	ra,0x0
 6ca:	f58080e7          	jalr	-168(ra) # 61e <putc>
 6ce:	197d                	addi	s2,s2,-1
 6d0:	ff3918e3          	bne	s2,s3,6c0 <printint+0x80>
 6d4:	70e2                	ld	ra,56(sp)
 6d6:	7442                	ld	s0,48(sp)
 6d8:	74a2                	ld	s1,40(sp)
 6da:	7902                	ld	s2,32(sp)
 6dc:	69e2                	ld	s3,24(sp)
 6de:	6121                	addi	sp,sp,64
 6e0:	8082                	ret
 6e2:	40b005bb          	negw	a1,a1
 6e6:	4885                	li	a7,1
 6e8:	bf8d                	j	65a <printint+0x1a>

00000000000006ea <vprintf>:
 6ea:	715d                	addi	sp,sp,-80
 6ec:	e486                	sd	ra,72(sp)
 6ee:	e0a2                	sd	s0,64(sp)
 6f0:	fc26                	sd	s1,56(sp)
 6f2:	f84a                	sd	s2,48(sp)
 6f4:	f44e                	sd	s3,40(sp)
 6f6:	f052                	sd	s4,32(sp)
 6f8:	ec56                	sd	s5,24(sp)
 6fa:	e85a                	sd	s6,16(sp)
 6fc:	e45e                	sd	s7,8(sp)
 6fe:	e062                	sd	s8,0(sp)
 700:	0880                	addi	s0,sp,80
 702:	0005c903          	lbu	s2,0(a1)
 706:	18090c63          	beqz	s2,89e <vprintf+0x1b4>
 70a:	8aaa                	mv	s5,a0
 70c:	8bb2                	mv	s7,a2
 70e:	00158493          	addi	s1,a1,1
 712:	4981                	li	s3,0
 714:	02500a13          	li	s4,37
 718:	4b55                	li	s6,21
 71a:	a839                	j	738 <vprintf+0x4e>
 71c:	85ca                	mv	a1,s2
 71e:	8556                	mv	a0,s5
 720:	00000097          	auipc	ra,0x0
 724:	efe080e7          	jalr	-258(ra) # 61e <putc>
 728:	a019                	j	72e <vprintf+0x44>
 72a:	01498d63          	beq	s3,s4,744 <vprintf+0x5a>
 72e:	0485                	addi	s1,s1,1
 730:	fff4c903          	lbu	s2,-1(s1)
 734:	16090563          	beqz	s2,89e <vprintf+0x1b4>
 738:	fe0999e3          	bnez	s3,72a <vprintf+0x40>
 73c:	ff4910e3          	bne	s2,s4,71c <vprintf+0x32>
 740:	89d2                	mv	s3,s4
 742:	b7f5                	j	72e <vprintf+0x44>
 744:	13490263          	beq	s2,s4,868 <vprintf+0x17e>
 748:	f9d9079b          	addiw	a5,s2,-99
 74c:	0ff7f793          	zext.b	a5,a5
 750:	12fb6563          	bltu	s6,a5,87a <vprintf+0x190>
 754:	f9d9079b          	addiw	a5,s2,-99
 758:	0ff7f713          	zext.b	a4,a5
 75c:	10eb6f63          	bltu	s6,a4,87a <vprintf+0x190>
 760:	00271793          	slli	a5,a4,0x2
 764:	00000717          	auipc	a4,0x0
 768:	36470713          	addi	a4,a4,868 # ac8 <malloc+0x12c>
 76c:	97ba                	add	a5,a5,a4
 76e:	439c                	lw	a5,0(a5)
 770:	97ba                	add	a5,a5,a4
 772:	8782                	jr	a5
 774:	008b8913          	addi	s2,s7,8
 778:	4685                	li	a3,1
 77a:	4629                	li	a2,10
 77c:	000ba583          	lw	a1,0(s7)
 780:	8556                	mv	a0,s5
 782:	00000097          	auipc	ra,0x0
 786:	ebe080e7          	jalr	-322(ra) # 640 <printint>
 78a:	8bca                	mv	s7,s2
 78c:	4981                	li	s3,0
 78e:	b745                	j	72e <vprintf+0x44>
 790:	008b8913          	addi	s2,s7,8
 794:	4681                	li	a3,0
 796:	4629                	li	a2,10
 798:	000ba583          	lw	a1,0(s7)
 79c:	8556                	mv	a0,s5
 79e:	00000097          	auipc	ra,0x0
 7a2:	ea2080e7          	jalr	-350(ra) # 640 <printint>
 7a6:	8bca                	mv	s7,s2
 7a8:	4981                	li	s3,0
 7aa:	b751                	j	72e <vprintf+0x44>
 7ac:	008b8913          	addi	s2,s7,8
 7b0:	4681                	li	a3,0
 7b2:	4641                	li	a2,16
 7b4:	000ba583          	lw	a1,0(s7)
 7b8:	8556                	mv	a0,s5
 7ba:	00000097          	auipc	ra,0x0
 7be:	e86080e7          	jalr	-378(ra) # 640 <printint>
 7c2:	8bca                	mv	s7,s2
 7c4:	4981                	li	s3,0
 7c6:	b7a5                	j	72e <vprintf+0x44>
 7c8:	008b8c13          	addi	s8,s7,8
 7cc:	000bb983          	ld	s3,0(s7)
 7d0:	03000593          	li	a1,48
 7d4:	8556                	mv	a0,s5
 7d6:	00000097          	auipc	ra,0x0
 7da:	e48080e7          	jalr	-440(ra) # 61e <putc>
 7de:	07800593          	li	a1,120
 7e2:	8556                	mv	a0,s5
 7e4:	00000097          	auipc	ra,0x0
 7e8:	e3a080e7          	jalr	-454(ra) # 61e <putc>
 7ec:	4941                	li	s2,16
 7ee:	00000b97          	auipc	s7,0x0
 7f2:	332b8b93          	addi	s7,s7,818 # b20 <digits>
 7f6:	03c9d793          	srli	a5,s3,0x3c
 7fa:	97de                	add	a5,a5,s7
 7fc:	0007c583          	lbu	a1,0(a5)
 800:	8556                	mv	a0,s5
 802:	00000097          	auipc	ra,0x0
 806:	e1c080e7          	jalr	-484(ra) # 61e <putc>
 80a:	0992                	slli	s3,s3,0x4
 80c:	397d                	addiw	s2,s2,-1
 80e:	fe0914e3          	bnez	s2,7f6 <vprintf+0x10c>
 812:	8be2                	mv	s7,s8
 814:	4981                	li	s3,0
 816:	bf21                	j	72e <vprintf+0x44>
 818:	008b8993          	addi	s3,s7,8
 81c:	000bb903          	ld	s2,0(s7)
 820:	02090163          	beqz	s2,842 <vprintf+0x158>
 824:	00094583          	lbu	a1,0(s2)
 828:	c9a5                	beqz	a1,898 <vprintf+0x1ae>
 82a:	8556                	mv	a0,s5
 82c:	00000097          	auipc	ra,0x0
 830:	df2080e7          	jalr	-526(ra) # 61e <putc>
 834:	0905                	addi	s2,s2,1
 836:	00094583          	lbu	a1,0(s2)
 83a:	f9e5                	bnez	a1,82a <vprintf+0x140>
 83c:	8bce                	mv	s7,s3
 83e:	4981                	li	s3,0
 840:	b5fd                	j	72e <vprintf+0x44>
 842:	00000917          	auipc	s2,0x0
 846:	27e90913          	addi	s2,s2,638 # ac0 <malloc+0x124>
 84a:	02800593          	li	a1,40
 84e:	bff1                	j	82a <vprintf+0x140>
 850:	008b8913          	addi	s2,s7,8
 854:	000bc583          	lbu	a1,0(s7)
 858:	8556                	mv	a0,s5
 85a:	00000097          	auipc	ra,0x0
 85e:	dc4080e7          	jalr	-572(ra) # 61e <putc>
 862:	8bca                	mv	s7,s2
 864:	4981                	li	s3,0
 866:	b5e1                	j	72e <vprintf+0x44>
 868:	02500593          	li	a1,37
 86c:	8556                	mv	a0,s5
 86e:	00000097          	auipc	ra,0x0
 872:	db0080e7          	jalr	-592(ra) # 61e <putc>
 876:	4981                	li	s3,0
 878:	bd5d                	j	72e <vprintf+0x44>
 87a:	02500593          	li	a1,37
 87e:	8556                	mv	a0,s5
 880:	00000097          	auipc	ra,0x0
 884:	d9e080e7          	jalr	-610(ra) # 61e <putc>
 888:	85ca                	mv	a1,s2
 88a:	8556                	mv	a0,s5
 88c:	00000097          	auipc	ra,0x0
 890:	d92080e7          	jalr	-622(ra) # 61e <putc>
 894:	4981                	li	s3,0
 896:	bd61                	j	72e <vprintf+0x44>
 898:	8bce                	mv	s7,s3
 89a:	4981                	li	s3,0
 89c:	bd49                	j	72e <vprintf+0x44>
 89e:	60a6                	ld	ra,72(sp)
 8a0:	6406                	ld	s0,64(sp)
 8a2:	74e2                	ld	s1,56(sp)
 8a4:	7942                	ld	s2,48(sp)
 8a6:	79a2                	ld	s3,40(sp)
 8a8:	7a02                	ld	s4,32(sp)
 8aa:	6ae2                	ld	s5,24(sp)
 8ac:	6b42                	ld	s6,16(sp)
 8ae:	6ba2                	ld	s7,8(sp)
 8b0:	6c02                	ld	s8,0(sp)
 8b2:	6161                	addi	sp,sp,80
 8b4:	8082                	ret

00000000000008b6 <fprintf>:
 8b6:	715d                	addi	sp,sp,-80
 8b8:	ec06                	sd	ra,24(sp)
 8ba:	e822                	sd	s0,16(sp)
 8bc:	1000                	addi	s0,sp,32
 8be:	e010                	sd	a2,0(s0)
 8c0:	e414                	sd	a3,8(s0)
 8c2:	e818                	sd	a4,16(s0)
 8c4:	ec1c                	sd	a5,24(s0)
 8c6:	03043023          	sd	a6,32(s0)
 8ca:	03143423          	sd	a7,40(s0)
 8ce:	8622                	mv	a2,s0
 8d0:	fe843423          	sd	s0,-24(s0)
 8d4:	00000097          	auipc	ra,0x0
 8d8:	e16080e7          	jalr	-490(ra) # 6ea <vprintf>
 8dc:	60e2                	ld	ra,24(sp)
 8de:	6442                	ld	s0,16(sp)
 8e0:	6161                	addi	sp,sp,80
 8e2:	8082                	ret

00000000000008e4 <printf>:
 8e4:	711d                	addi	sp,sp,-96
 8e6:	ec06                	sd	ra,24(sp)
 8e8:	e822                	sd	s0,16(sp)
 8ea:	1000                	addi	s0,sp,32
 8ec:	e40c                	sd	a1,8(s0)
 8ee:	e810                	sd	a2,16(s0)
 8f0:	ec14                	sd	a3,24(s0)
 8f2:	f018                	sd	a4,32(s0)
 8f4:	f41c                	sd	a5,40(s0)
 8f6:	03043823          	sd	a6,48(s0)
 8fa:	03143c23          	sd	a7,56(s0)
 8fe:	00840613          	addi	a2,s0,8
 902:	fec43423          	sd	a2,-24(s0)
 906:	85aa                	mv	a1,a0
 908:	4505                	li	a0,1
 90a:	00000097          	auipc	ra,0x0
 90e:	de0080e7          	jalr	-544(ra) # 6ea <vprintf>
 912:	60e2                	ld	ra,24(sp)
 914:	6442                	ld	s0,16(sp)
 916:	6125                	addi	sp,sp,96
 918:	8082                	ret

000000000000091a <free>:
 91a:	1141                	addi	sp,sp,-16
 91c:	e422                	sd	s0,8(sp)
 91e:	0800                	addi	s0,sp,16
 920:	ff050693          	addi	a3,a0,-16
 924:	00000797          	auipc	a5,0x0
 928:	6147b783          	ld	a5,1556(a5) # f38 <freep>
 92c:	a02d                	j	956 <free+0x3c>
 92e:	4618                	lw	a4,8(a2)
 930:	9f2d                	addw	a4,a4,a1
 932:	fee52c23          	sw	a4,-8(a0)
 936:	6398                	ld	a4,0(a5)
 938:	6310                	ld	a2,0(a4)
 93a:	a83d                	j	978 <free+0x5e>
 93c:	ff852703          	lw	a4,-8(a0)
 940:	9f31                	addw	a4,a4,a2
 942:	c798                	sw	a4,8(a5)
 944:	ff053683          	ld	a3,-16(a0)
 948:	a091                	j	98c <free+0x72>
 94a:	6398                	ld	a4,0(a5)
 94c:	00e7e463          	bltu	a5,a4,954 <free+0x3a>
 950:	00e6ea63          	bltu	a3,a4,964 <free+0x4a>
 954:	87ba                	mv	a5,a4
 956:	fed7fae3          	bgeu	a5,a3,94a <free+0x30>
 95a:	6398                	ld	a4,0(a5)
 95c:	00e6e463          	bltu	a3,a4,964 <free+0x4a>
 960:	fee7eae3          	bltu	a5,a4,954 <free+0x3a>
 964:	ff852583          	lw	a1,-8(a0)
 968:	6390                	ld	a2,0(a5)
 96a:	02059813          	slli	a6,a1,0x20
 96e:	01c85713          	srli	a4,a6,0x1c
 972:	9736                	add	a4,a4,a3
 974:	fae60de3          	beq	a2,a4,92e <free+0x14>
 978:	fec53823          	sd	a2,-16(a0)
 97c:	4790                	lw	a2,8(a5)
 97e:	02061593          	slli	a1,a2,0x20
 982:	01c5d713          	srli	a4,a1,0x1c
 986:	973e                	add	a4,a4,a5
 988:	fae68ae3          	beq	a3,a4,93c <free+0x22>
 98c:	e394                	sd	a3,0(a5)
 98e:	00000717          	auipc	a4,0x0
 992:	5af73523          	sd	a5,1450(a4) # f38 <freep>
 996:	6422                	ld	s0,8(sp)
 998:	0141                	addi	sp,sp,16
 99a:	8082                	ret

000000000000099c <malloc>:
 99c:	7139                	addi	sp,sp,-64
 99e:	fc06                	sd	ra,56(sp)
 9a0:	f822                	sd	s0,48(sp)
 9a2:	f426                	sd	s1,40(sp)
 9a4:	f04a                	sd	s2,32(sp)
 9a6:	ec4e                	sd	s3,24(sp)
 9a8:	e852                	sd	s4,16(sp)
 9aa:	e456                	sd	s5,8(sp)
 9ac:	e05a                	sd	s6,0(sp)
 9ae:	0080                	addi	s0,sp,64
 9b0:	02051493          	slli	s1,a0,0x20
 9b4:	9081                	srli	s1,s1,0x20
 9b6:	04bd                	addi	s1,s1,15
 9b8:	8091                	srli	s1,s1,0x4
 9ba:	0014899b          	addiw	s3,s1,1
 9be:	0485                	addi	s1,s1,1
 9c0:	00000517          	auipc	a0,0x0
 9c4:	57853503          	ld	a0,1400(a0) # f38 <freep>
 9c8:	c515                	beqz	a0,9f4 <malloc+0x58>
 9ca:	611c                	ld	a5,0(a0)
 9cc:	4798                	lw	a4,8(a5)
 9ce:	04977063          	bgeu	a4,s1,a0e <malloc+0x72>
 9d2:	8a4e                	mv	s4,s3
 9d4:	0009871b          	sext.w	a4,s3
 9d8:	6685                	lui	a3,0x1
 9da:	00d77363          	bgeu	a4,a3,9e0 <malloc+0x44>
 9de:	6a05                	lui	s4,0x1
 9e0:	000a0b1b          	sext.w	s6,s4
 9e4:	004a1a1b          	slliw	s4,s4,0x4
 9e8:	00000917          	auipc	s2,0x0
 9ec:	55090913          	addi	s2,s2,1360 # f38 <freep>
 9f0:	5afd                	li	s5,-1
 9f2:	a89d                	j	a68 <malloc+0xcc>
 9f4:	00000717          	auipc	a4,0x0
 9f8:	54470713          	addi	a4,a4,1348 # f38 <freep>
 9fc:	00000797          	auipc	a5,0x0
 a00:	54478793          	addi	a5,a5,1348 # f40 <base>
 a04:	e31c                	sd	a5,0(a4)
 a06:	e71c                	sd	a5,8(a4)
 a08:	00072823          	sw	zero,16(a4)
 a0c:	b7d9                	j	9d2 <malloc+0x36>
 a0e:	02e48c63          	beq	s1,a4,a46 <malloc+0xaa>
 a12:	4137073b          	subw	a4,a4,s3
 a16:	c798                	sw	a4,8(a5)
 a18:	02071693          	slli	a3,a4,0x20
 a1c:	01c6d713          	srli	a4,a3,0x1c
 a20:	97ba                	add	a5,a5,a4
 a22:	0137a423          	sw	s3,8(a5)
 a26:	00000717          	auipc	a4,0x0
 a2a:	50a73923          	sd	a0,1298(a4) # f38 <freep>
 a2e:	01078513          	addi	a0,a5,16
 a32:	70e2                	ld	ra,56(sp)
 a34:	7442                	ld	s0,48(sp)
 a36:	74a2                	ld	s1,40(sp)
 a38:	7902                	ld	s2,32(sp)
 a3a:	69e2                	ld	s3,24(sp)
 a3c:	6a42                	ld	s4,16(sp)
 a3e:	6aa2                	ld	s5,8(sp)
 a40:	6b02                	ld	s6,0(sp)
 a42:	6121                	addi	sp,sp,64
 a44:	8082                	ret
 a46:	6398                	ld	a4,0(a5)
 a48:	e118                	sd	a4,0(a0)
 a4a:	bff1                	j	a26 <malloc+0x8a>
 a4c:	01652423          	sw	s6,8(a0)
 a50:	0541                	addi	a0,a0,16
 a52:	00000097          	auipc	ra,0x0
 a56:	ec8080e7          	jalr	-312(ra) # 91a <free>
 a5a:	00093503          	ld	a0,0(s2)
 a5e:	d971                	beqz	a0,a32 <malloc+0x96>
 a60:	611c                	ld	a5,0(a0)
 a62:	4798                	lw	a4,8(a5)
 a64:	fa9775e3          	bgeu	a4,s1,a0e <malloc+0x72>
 a68:	00093703          	ld	a4,0(s2)
 a6c:	853e                	mv	a0,a5
 a6e:	fef719e3          	bne	a4,a5,a60 <malloc+0xc4>
 a72:	8552                	mv	a0,s4
 a74:	00000097          	auipc	ra,0x0
 a78:	b52080e7          	jalr	-1198(ra) # 5c6 <sbrk>
 a7c:	fd5518e3          	bne	a0,s5,a4c <malloc+0xb0>
 a80:	4501                	li	a0,0
 a82:	bf45                	j	a32 <malloc+0x96>
