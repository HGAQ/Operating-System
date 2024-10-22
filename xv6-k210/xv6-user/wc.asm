
xv6-user/_wc:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
   0:	7119                	addi	sp,sp,-128
   2:	fc86                	sd	ra,120(sp)
   4:	f8a2                	sd	s0,112(sp)
   6:	f4a6                	sd	s1,104(sp)
   8:	f0ca                	sd	s2,96(sp)
   a:	ecce                	sd	s3,88(sp)
   c:	e8d2                	sd	s4,80(sp)
   e:	e4d6                	sd	s5,72(sp)
  10:	e0da                	sd	s6,64(sp)
  12:	fc5e                	sd	s7,56(sp)
  14:	f862                	sd	s8,48(sp)
  16:	f466                	sd	s9,40(sp)
  18:	f06a                	sd	s10,32(sp)
  1a:	ec6e                	sd	s11,24(sp)
  1c:	0100                	addi	s0,sp,128
  1e:	f8a43423          	sd	a0,-120(s0)
  22:	f8b43023          	sd	a1,-128(s0)
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  26:	4981                	li	s3,0
  l = w = c = 0;
  28:	4c81                	li	s9,0
  2a:	4c01                	li	s8,0
  2c:	4b81                	li	s7,0
  2e:	00001d97          	auipc	s11,0x1
  32:	a3bd8d93          	addi	s11,s11,-1477 # a69 <buf+0x1>
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
      c++;
      if(buf[i] == '\n')
  36:	4aa9                	li	s5,10
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
  38:	00001a17          	auipc	s4,0x1
  3c:	958a0a13          	addi	s4,s4,-1704 # 990 <malloc+0xea>
        inword = 0;
  40:	4b01                	li	s6,0
  while((n = read(fd, buf, sizeof(buf))) > 0){
  42:	a805                	j	72 <wc+0x72>
      if(strchr(" \r\t\n\v", buf[i]))
  44:	8552                	mv	a0,s4
  46:	00000097          	auipc	ra,0x0
  4a:	224080e7          	jalr	548(ra) # 26a <strchr>
  4e:	c919                	beqz	a0,64 <wc+0x64>
        inword = 0;
  50:	89da                	mv	s3,s6
    for(i=0; i<n; i++){
  52:	0485                	addi	s1,s1,1
  54:	01248d63          	beq	s1,s2,6e <wc+0x6e>
      if(buf[i] == '\n')
  58:	0004c583          	lbu	a1,0(s1)
  5c:	ff5594e3          	bne	a1,s5,44 <wc+0x44>
        l++;
  60:	2b85                	addiw	s7,s7,1
  62:	b7cd                	j	44 <wc+0x44>
      else if(!inword){
  64:	fe0997e3          	bnez	s3,52 <wc+0x52>
        w++;
  68:	2c05                	addiw	s8,s8,1
        inword = 1;
  6a:	4985                	li	s3,1
  6c:	b7dd                	j	52 <wc+0x52>
      c++;
  6e:	01ac8cbb          	addw	s9,s9,s10
  while((n = read(fd, buf, sizeof(buf))) > 0){
  72:	20000613          	li	a2,512
  76:	00001597          	auipc	a1,0x1
  7a:	9f258593          	addi	a1,a1,-1550 # a68 <buf>
  7e:	f8843503          	ld	a0,-120(s0)
  82:	00000097          	auipc	ra,0x0
  86:	3f6080e7          	jalr	1014(ra) # 478 <read>
  8a:	00a05f63          	blez	a0,a8 <wc+0xa8>
    for(i=0; i<n; i++){
  8e:	00001497          	auipc	s1,0x1
  92:	9da48493          	addi	s1,s1,-1574 # a68 <buf>
  96:	00050d1b          	sext.w	s10,a0
  9a:	fff5091b          	addiw	s2,a0,-1
  9e:	1902                	slli	s2,s2,0x20
  a0:	02095913          	srli	s2,s2,0x20
  a4:	996e                	add	s2,s2,s11
  a6:	bf4d                	j	58 <wc+0x58>
      }
    }
  }
  if(n < 0){
  a8:	02054e63          	bltz	a0,e4 <wc+0xe4>
    printf("wc: read error\n");
    exit(1);
  }
  printf("%d\t%d\t%d\t%s\n", l, w, c, name);
  ac:	f8043703          	ld	a4,-128(s0)
  b0:	86e6                	mv	a3,s9
  b2:	8662                	mv	a2,s8
  b4:	85de                	mv	a1,s7
  b6:	00001517          	auipc	a0,0x1
  ba:	8f250513          	addi	a0,a0,-1806 # 9a8 <malloc+0x102>
  be:	00000097          	auipc	ra,0x0
  c2:	730080e7          	jalr	1840(ra) # 7ee <printf>
}
  c6:	70e6                	ld	ra,120(sp)
  c8:	7446                	ld	s0,112(sp)
  ca:	74a6                	ld	s1,104(sp)
  cc:	7906                	ld	s2,96(sp)
  ce:	69e6                	ld	s3,88(sp)
  d0:	6a46                	ld	s4,80(sp)
  d2:	6aa6                	ld	s5,72(sp)
  d4:	6b06                	ld	s6,64(sp)
  d6:	7be2                	ld	s7,56(sp)
  d8:	7c42                	ld	s8,48(sp)
  da:	7ca2                	ld	s9,40(sp)
  dc:	7d02                	ld	s10,32(sp)
  de:	6de2                	ld	s11,24(sp)
  e0:	6109                	addi	sp,sp,128
  e2:	8082                	ret
    printf("wc: read error\n");
  e4:	00001517          	auipc	a0,0x1
  e8:	8b450513          	addi	a0,a0,-1868 # 998 <malloc+0xf2>
  ec:	00000097          	auipc	ra,0x0
  f0:	702080e7          	jalr	1794(ra) # 7ee <printf>
    exit(1);
  f4:	4505                	li	a0,1
  f6:	00000097          	auipc	ra,0x0
  fa:	36a080e7          	jalr	874(ra) # 460 <exit>

00000000000000fe <main>:

int
main(int argc, char *argv[])
{
  fe:	7179                	addi	sp,sp,-48
 100:	f406                	sd	ra,40(sp)
 102:	f022                	sd	s0,32(sp)
 104:	ec26                	sd	s1,24(sp)
 106:	e84a                	sd	s2,16(sp)
 108:	e44e                	sd	s3,8(sp)
 10a:	e052                	sd	s4,0(sp)
 10c:	1800                	addi	s0,sp,48
  int fd, i;

  if(argc <= 1){
 10e:	4785                	li	a5,1
 110:	06a7d063          	bge	a5,a0,170 <main+0x72>
 114:	89aa                	mv	s3,a0
 116:	892e                	mv	s2,a1
    wc(0, "");
    exit(0);
  }

  printf("LINE\tWORD\tBYTE\tFILE\n");
 118:	00001517          	auipc	a0,0x1
 11c:	8a850513          	addi	a0,a0,-1880 # 9c0 <malloc+0x11a>
 120:	00000097          	auipc	ra,0x0
 124:	6ce080e7          	jalr	1742(ra) # 7ee <printf>
  for(i = 1; i < argc; i++){
 128:	00890493          	addi	s1,s2,8
 12c:	39f9                	addiw	s3,s3,-2
 12e:	02099793          	slli	a5,s3,0x20
 132:	01d7d993          	srli	s3,a5,0x1d
 136:	0941                	addi	s2,s2,16
 138:	99ca                	add	s3,s3,s2
    if((fd = open(argv[i], 0)) < 0){
 13a:	4581                	li	a1,0
 13c:	6088                	ld	a0,0(s1)
 13e:	00000097          	auipc	ra,0x0
 142:	362080e7          	jalr	866(ra) # 4a0 <open>
 146:	892a                	mv	s2,a0
 148:	04054263          	bltz	a0,18c <main+0x8e>
      printf("wc: cannot open %s\n", argv[i]);
      exit(1);
    }
    wc(fd, argv[i]);
 14c:	608c                	ld	a1,0(s1)
 14e:	00000097          	auipc	ra,0x0
 152:	eb2080e7          	jalr	-334(ra) # 0 <wc>
    close(fd);
 156:	854a                	mv	a0,s2
 158:	00000097          	auipc	ra,0x0
 15c:	330080e7          	jalr	816(ra) # 488 <close>
  for(i = 1; i < argc; i++){
 160:	04a1                	addi	s1,s1,8
 162:	fd349ce3          	bne	s1,s3,13a <main+0x3c>
  }
  exit(0);
 166:	4501                	li	a0,0
 168:	00000097          	auipc	ra,0x0
 16c:	2f8080e7          	jalr	760(ra) # 460 <exit>
    wc(0, "");
 170:	00001597          	auipc	a1,0x1
 174:	84858593          	addi	a1,a1,-1976 # 9b8 <malloc+0x112>
 178:	4501                	li	a0,0
 17a:	00000097          	auipc	ra,0x0
 17e:	e86080e7          	jalr	-378(ra) # 0 <wc>
    exit(0);
 182:	4501                	li	a0,0
 184:	00000097          	auipc	ra,0x0
 188:	2dc080e7          	jalr	732(ra) # 460 <exit>
      printf("wc: cannot open %s\n", argv[i]);
 18c:	608c                	ld	a1,0(s1)
 18e:	00001517          	auipc	a0,0x1
 192:	84a50513          	addi	a0,a0,-1974 # 9d8 <malloc+0x132>
 196:	00000097          	auipc	ra,0x0
 19a:	658080e7          	jalr	1624(ra) # 7ee <printf>
      exit(1);
 19e:	4505                	li	a0,1
 1a0:	00000097          	auipc	ra,0x0
 1a4:	2c0080e7          	jalr	704(ra) # 460 <exit>

00000000000001a8 <strcpy>:
 1a8:	1141                	addi	sp,sp,-16
 1aa:	e422                	sd	s0,8(sp)
 1ac:	0800                	addi	s0,sp,16
 1ae:	87aa                	mv	a5,a0
 1b0:	0585                	addi	a1,a1,1
 1b2:	0785                	addi	a5,a5,1
 1b4:	fff5c703          	lbu	a4,-1(a1)
 1b8:	fee78fa3          	sb	a4,-1(a5)
 1bc:	fb75                	bnez	a4,1b0 <strcpy+0x8>
 1be:	6422                	ld	s0,8(sp)
 1c0:	0141                	addi	sp,sp,16
 1c2:	8082                	ret

00000000000001c4 <strcat>:
 1c4:	1141                	addi	sp,sp,-16
 1c6:	e422                	sd	s0,8(sp)
 1c8:	0800                	addi	s0,sp,16
 1ca:	00054783          	lbu	a5,0(a0)
 1ce:	c385                	beqz	a5,1ee <strcat+0x2a>
 1d0:	87aa                	mv	a5,a0
 1d2:	0785                	addi	a5,a5,1
 1d4:	0007c703          	lbu	a4,0(a5)
 1d8:	ff6d                	bnez	a4,1d2 <strcat+0xe>
 1da:	0585                	addi	a1,a1,1
 1dc:	0785                	addi	a5,a5,1
 1de:	fff5c703          	lbu	a4,-1(a1)
 1e2:	fee78fa3          	sb	a4,-1(a5)
 1e6:	fb75                	bnez	a4,1da <strcat+0x16>
 1e8:	6422                	ld	s0,8(sp)
 1ea:	0141                	addi	sp,sp,16
 1ec:	8082                	ret
 1ee:	87aa                	mv	a5,a0
 1f0:	b7ed                	j	1da <strcat+0x16>

00000000000001f2 <strcmp>:
 1f2:	1141                	addi	sp,sp,-16
 1f4:	e422                	sd	s0,8(sp)
 1f6:	0800                	addi	s0,sp,16
 1f8:	00054783          	lbu	a5,0(a0)
 1fc:	cb91                	beqz	a5,210 <strcmp+0x1e>
 1fe:	0005c703          	lbu	a4,0(a1)
 202:	00f71763          	bne	a4,a5,210 <strcmp+0x1e>
 206:	0505                	addi	a0,a0,1
 208:	0585                	addi	a1,a1,1
 20a:	00054783          	lbu	a5,0(a0)
 20e:	fbe5                	bnez	a5,1fe <strcmp+0xc>
 210:	0005c503          	lbu	a0,0(a1)
 214:	40a7853b          	subw	a0,a5,a0
 218:	6422                	ld	s0,8(sp)
 21a:	0141                	addi	sp,sp,16
 21c:	8082                	ret

000000000000021e <strlen>:
 21e:	1141                	addi	sp,sp,-16
 220:	e422                	sd	s0,8(sp)
 222:	0800                	addi	s0,sp,16
 224:	00054783          	lbu	a5,0(a0)
 228:	cf91                	beqz	a5,244 <strlen+0x26>
 22a:	0505                	addi	a0,a0,1
 22c:	87aa                	mv	a5,a0
 22e:	86be                	mv	a3,a5
 230:	0785                	addi	a5,a5,1
 232:	fff7c703          	lbu	a4,-1(a5)
 236:	ff65                	bnez	a4,22e <strlen+0x10>
 238:	40a6853b          	subw	a0,a3,a0
 23c:	2505                	addiw	a0,a0,1
 23e:	6422                	ld	s0,8(sp)
 240:	0141                	addi	sp,sp,16
 242:	8082                	ret
 244:	4501                	li	a0,0
 246:	bfe5                	j	23e <strlen+0x20>

0000000000000248 <memset>:
 248:	1141                	addi	sp,sp,-16
 24a:	e422                	sd	s0,8(sp)
 24c:	0800                	addi	s0,sp,16
 24e:	ca19                	beqz	a2,264 <memset+0x1c>
 250:	87aa                	mv	a5,a0
 252:	1602                	slli	a2,a2,0x20
 254:	9201                	srli	a2,a2,0x20
 256:	00a60733          	add	a4,a2,a0
 25a:	00b78023          	sb	a1,0(a5)
 25e:	0785                	addi	a5,a5,1
 260:	fee79de3          	bne	a5,a4,25a <memset+0x12>
 264:	6422                	ld	s0,8(sp)
 266:	0141                	addi	sp,sp,16
 268:	8082                	ret

000000000000026a <strchr>:
 26a:	1141                	addi	sp,sp,-16
 26c:	e422                	sd	s0,8(sp)
 26e:	0800                	addi	s0,sp,16
 270:	00054783          	lbu	a5,0(a0)
 274:	cb99                	beqz	a5,28a <strchr+0x20>
 276:	00f58763          	beq	a1,a5,284 <strchr+0x1a>
 27a:	0505                	addi	a0,a0,1
 27c:	00054783          	lbu	a5,0(a0)
 280:	fbfd                	bnez	a5,276 <strchr+0xc>
 282:	4501                	li	a0,0
 284:	6422                	ld	s0,8(sp)
 286:	0141                	addi	sp,sp,16
 288:	8082                	ret
 28a:	4501                	li	a0,0
 28c:	bfe5                	j	284 <strchr+0x1a>

000000000000028e <gets>:
 28e:	711d                	addi	sp,sp,-96
 290:	ec86                	sd	ra,88(sp)
 292:	e8a2                	sd	s0,80(sp)
 294:	e4a6                	sd	s1,72(sp)
 296:	e0ca                	sd	s2,64(sp)
 298:	fc4e                	sd	s3,56(sp)
 29a:	f852                	sd	s4,48(sp)
 29c:	f456                	sd	s5,40(sp)
 29e:	f05a                	sd	s6,32(sp)
 2a0:	ec5e                	sd	s7,24(sp)
 2a2:	e862                	sd	s8,16(sp)
 2a4:	1080                	addi	s0,sp,96
 2a6:	8baa                	mv	s7,a0
 2a8:	8a2e                	mv	s4,a1
 2aa:	892a                	mv	s2,a0
 2ac:	4481                	li	s1,0
 2ae:	faf40a93          	addi	s5,s0,-81
 2b2:	4b29                	li	s6,10
 2b4:	4c35                	li	s8,13
 2b6:	89a6                	mv	s3,s1
 2b8:	2485                	addiw	s1,s1,1
 2ba:	0344d763          	bge	s1,s4,2e8 <gets+0x5a>
 2be:	4605                	li	a2,1
 2c0:	85d6                	mv	a1,s5
 2c2:	4501                	li	a0,0
 2c4:	00000097          	auipc	ra,0x0
 2c8:	1b4080e7          	jalr	436(ra) # 478 <read>
 2cc:	00a05e63          	blez	a0,2e8 <gets+0x5a>
 2d0:	faf44783          	lbu	a5,-81(s0)
 2d4:	00f90023          	sb	a5,0(s2)
 2d8:	01678763          	beq	a5,s6,2e6 <gets+0x58>
 2dc:	0905                	addi	s2,s2,1
 2de:	fd879ce3          	bne	a5,s8,2b6 <gets+0x28>
 2e2:	89a6                	mv	s3,s1
 2e4:	a011                	j	2e8 <gets+0x5a>
 2e6:	89a6                	mv	s3,s1
 2e8:	99de                	add	s3,s3,s7
 2ea:	00098023          	sb	zero,0(s3)
 2ee:	855e                	mv	a0,s7
 2f0:	60e6                	ld	ra,88(sp)
 2f2:	6446                	ld	s0,80(sp)
 2f4:	64a6                	ld	s1,72(sp)
 2f6:	6906                	ld	s2,64(sp)
 2f8:	79e2                	ld	s3,56(sp)
 2fa:	7a42                	ld	s4,48(sp)
 2fc:	7aa2                	ld	s5,40(sp)
 2fe:	7b02                	ld	s6,32(sp)
 300:	6be2                	ld	s7,24(sp)
 302:	6c42                	ld	s8,16(sp)
 304:	6125                	addi	sp,sp,96
 306:	8082                	ret

0000000000000308 <stat>:
 308:	1101                	addi	sp,sp,-32
 30a:	ec06                	sd	ra,24(sp)
 30c:	e822                	sd	s0,16(sp)
 30e:	e426                	sd	s1,8(sp)
 310:	e04a                	sd	s2,0(sp)
 312:	1000                	addi	s0,sp,32
 314:	892e                	mv	s2,a1
 316:	4581                	li	a1,0
 318:	00000097          	auipc	ra,0x0
 31c:	188080e7          	jalr	392(ra) # 4a0 <open>
 320:	02054563          	bltz	a0,34a <stat+0x42>
 324:	84aa                	mv	s1,a0
 326:	85ca                	mv	a1,s2
 328:	00000097          	auipc	ra,0x0
 32c:	180080e7          	jalr	384(ra) # 4a8 <fstat>
 330:	892a                	mv	s2,a0
 332:	8526                	mv	a0,s1
 334:	00000097          	auipc	ra,0x0
 338:	154080e7          	jalr	340(ra) # 488 <close>
 33c:	854a                	mv	a0,s2
 33e:	60e2                	ld	ra,24(sp)
 340:	6442                	ld	s0,16(sp)
 342:	64a2                	ld	s1,8(sp)
 344:	6902                	ld	s2,0(sp)
 346:	6105                	addi	sp,sp,32
 348:	8082                	ret
 34a:	597d                	li	s2,-1
 34c:	bfc5                	j	33c <stat+0x34>

000000000000034e <atoi>:
 34e:	1141                	addi	sp,sp,-16
 350:	e422                	sd	s0,8(sp)
 352:	0800                	addi	s0,sp,16
 354:	00054703          	lbu	a4,0(a0)
 358:	02d00793          	li	a5,45
 35c:	4585                	li	a1,1
 35e:	04f70363          	beq	a4,a5,3a4 <atoi+0x56>
 362:	00054703          	lbu	a4,0(a0)
 366:	fd07079b          	addiw	a5,a4,-48
 36a:	0ff7f793          	zext.b	a5,a5
 36e:	46a5                	li	a3,9
 370:	02f6ed63          	bltu	a3,a5,3aa <atoi+0x5c>
 374:	4681                	li	a3,0
 376:	4625                	li	a2,9
 378:	0505                	addi	a0,a0,1
 37a:	0026979b          	slliw	a5,a3,0x2
 37e:	9fb5                	addw	a5,a5,a3
 380:	0017979b          	slliw	a5,a5,0x1
 384:	9fb9                	addw	a5,a5,a4
 386:	fd07869b          	addiw	a3,a5,-48
 38a:	00054703          	lbu	a4,0(a0)
 38e:	fd07079b          	addiw	a5,a4,-48
 392:	0ff7f793          	zext.b	a5,a5
 396:	fef671e3          	bgeu	a2,a5,378 <atoi+0x2a>
 39a:	02d5853b          	mulw	a0,a1,a3
 39e:	6422                	ld	s0,8(sp)
 3a0:	0141                	addi	sp,sp,16
 3a2:	8082                	ret
 3a4:	0505                	addi	a0,a0,1
 3a6:	55fd                	li	a1,-1
 3a8:	bf6d                	j	362 <atoi+0x14>
 3aa:	4681                	li	a3,0
 3ac:	b7fd                	j	39a <atoi+0x4c>

00000000000003ae <memmove>:
 3ae:	1141                	addi	sp,sp,-16
 3b0:	e422                	sd	s0,8(sp)
 3b2:	0800                	addi	s0,sp,16
 3b4:	02b57463          	bgeu	a0,a1,3dc <memmove+0x2e>
 3b8:	00c05f63          	blez	a2,3d6 <memmove+0x28>
 3bc:	1602                	slli	a2,a2,0x20
 3be:	9201                	srli	a2,a2,0x20
 3c0:	00c507b3          	add	a5,a0,a2
 3c4:	872a                	mv	a4,a0
 3c6:	0585                	addi	a1,a1,1
 3c8:	0705                	addi	a4,a4,1
 3ca:	fff5c683          	lbu	a3,-1(a1)
 3ce:	fed70fa3          	sb	a3,-1(a4)
 3d2:	fee79ae3          	bne	a5,a4,3c6 <memmove+0x18>
 3d6:	6422                	ld	s0,8(sp)
 3d8:	0141                	addi	sp,sp,16
 3da:	8082                	ret
 3dc:	00c50733          	add	a4,a0,a2
 3e0:	95b2                	add	a1,a1,a2
 3e2:	fec05ae3          	blez	a2,3d6 <memmove+0x28>
 3e6:	fff6079b          	addiw	a5,a2,-1
 3ea:	1782                	slli	a5,a5,0x20
 3ec:	9381                	srli	a5,a5,0x20
 3ee:	fff7c793          	not	a5,a5
 3f2:	97ba                	add	a5,a5,a4
 3f4:	15fd                	addi	a1,a1,-1
 3f6:	177d                	addi	a4,a4,-1
 3f8:	0005c683          	lbu	a3,0(a1)
 3fc:	00d70023          	sb	a3,0(a4)
 400:	fee79ae3          	bne	a5,a4,3f4 <memmove+0x46>
 404:	bfc9                	j	3d6 <memmove+0x28>

0000000000000406 <memcmp>:
 406:	1141                	addi	sp,sp,-16
 408:	e422                	sd	s0,8(sp)
 40a:	0800                	addi	s0,sp,16
 40c:	ca05                	beqz	a2,43c <memcmp+0x36>
 40e:	fff6069b          	addiw	a3,a2,-1
 412:	1682                	slli	a3,a3,0x20
 414:	9281                	srli	a3,a3,0x20
 416:	0685                	addi	a3,a3,1
 418:	96aa                	add	a3,a3,a0
 41a:	00054783          	lbu	a5,0(a0)
 41e:	0005c703          	lbu	a4,0(a1)
 422:	00e79863          	bne	a5,a4,432 <memcmp+0x2c>
 426:	0505                	addi	a0,a0,1
 428:	0585                	addi	a1,a1,1
 42a:	fed518e3          	bne	a0,a3,41a <memcmp+0x14>
 42e:	4501                	li	a0,0
 430:	a019                	j	436 <memcmp+0x30>
 432:	40e7853b          	subw	a0,a5,a4
 436:	6422                	ld	s0,8(sp)
 438:	0141                	addi	sp,sp,16
 43a:	8082                	ret
 43c:	4501                	li	a0,0
 43e:	bfe5                	j	436 <memcmp+0x30>

0000000000000440 <memcpy>:
 440:	1141                	addi	sp,sp,-16
 442:	e406                	sd	ra,8(sp)
 444:	e022                	sd	s0,0(sp)
 446:	0800                	addi	s0,sp,16
 448:	00000097          	auipc	ra,0x0
 44c:	f66080e7          	jalr	-154(ra) # 3ae <memmove>
 450:	60a2                	ld	ra,8(sp)
 452:	6402                	ld	s0,0(sp)
 454:	0141                	addi	sp,sp,16
 456:	8082                	ret

0000000000000458 <fork>:
 458:	4885                	li	a7,1
 45a:	00000073          	ecall
 45e:	8082                	ret

0000000000000460 <exit>:
 460:	4889                	li	a7,2
 462:	00000073          	ecall
 466:	8082                	ret

0000000000000468 <wait>:
 468:	488d                	li	a7,3
 46a:	00000073          	ecall
 46e:	8082                	ret

0000000000000470 <pipe>:
 470:	4891                	li	a7,4
 472:	00000073          	ecall
 476:	8082                	ret

0000000000000478 <read>:
 478:	4895                	li	a7,5
 47a:	00000073          	ecall
 47e:	8082                	ret

0000000000000480 <write>:
 480:	48c1                	li	a7,16
 482:	00000073          	ecall
 486:	8082                	ret

0000000000000488 <close>:
 488:	48d5                	li	a7,21
 48a:	00000073          	ecall
 48e:	8082                	ret

0000000000000490 <kill>:
 490:	4899                	li	a7,6
 492:	00000073          	ecall
 496:	8082                	ret

0000000000000498 <exec>:
 498:	489d                	li	a7,7
 49a:	00000073          	ecall
 49e:	8082                	ret

00000000000004a0 <open>:
 4a0:	48bd                	li	a7,15
 4a2:	00000073          	ecall
 4a6:	8082                	ret

00000000000004a8 <fstat>:
 4a8:	48a1                	li	a7,8
 4aa:	00000073          	ecall
 4ae:	8082                	ret

00000000000004b0 <mkdir>:
 4b0:	48d1                	li	a7,20
 4b2:	00000073          	ecall
 4b6:	8082                	ret

00000000000004b8 <chdir>:
 4b8:	48a5                	li	a7,9
 4ba:	00000073          	ecall
 4be:	8082                	ret

00000000000004c0 <dup>:
 4c0:	48a9                	li	a7,10
 4c2:	00000073          	ecall
 4c6:	8082                	ret

00000000000004c8 <getpid>:
 4c8:	48ad                	li	a7,11
 4ca:	00000073          	ecall
 4ce:	8082                	ret

00000000000004d0 <sbrk>:
 4d0:	48b1                	li	a7,12
 4d2:	00000073          	ecall
 4d6:	8082                	ret

00000000000004d8 <sleep>:
 4d8:	48b5                	li	a7,13
 4da:	00000073          	ecall
 4de:	8082                	ret

00000000000004e0 <uptime>:
 4e0:	48b9                	li	a7,14
 4e2:	00000073          	ecall
 4e6:	8082                	ret

00000000000004e8 <test_proc>:
 4e8:	48d9                	li	a7,22
 4ea:	00000073          	ecall
 4ee:	8082                	ret

00000000000004f0 <dev>:
 4f0:	48dd                	li	a7,23
 4f2:	00000073          	ecall
 4f6:	8082                	ret

00000000000004f8 <readdir>:
 4f8:	48e1                	li	a7,24
 4fa:	00000073          	ecall
 4fe:	8082                	ret

0000000000000500 <getcwd>:
 500:	48e5                	li	a7,25
 502:	00000073          	ecall
 506:	8082                	ret

0000000000000508 <remove>:
 508:	48c5                	li	a7,17
 50a:	00000073          	ecall
 50e:	8082                	ret

0000000000000510 <trace>:
 510:	48c9                	li	a7,18
 512:	00000073          	ecall
 516:	8082                	ret

0000000000000518 <sysinfo>:
 518:	48cd                	li	a7,19
 51a:	00000073          	ecall
 51e:	8082                	ret

0000000000000520 <rename>:
 520:	48e9                	li	a7,26
 522:	00000073          	ecall
 526:	8082                	ret

0000000000000528 <putc>:
 528:	1101                	addi	sp,sp,-32
 52a:	ec06                	sd	ra,24(sp)
 52c:	e822                	sd	s0,16(sp)
 52e:	1000                	addi	s0,sp,32
 530:	feb407a3          	sb	a1,-17(s0)
 534:	4605                	li	a2,1
 536:	fef40593          	addi	a1,s0,-17
 53a:	00000097          	auipc	ra,0x0
 53e:	f46080e7          	jalr	-186(ra) # 480 <write>
 542:	60e2                	ld	ra,24(sp)
 544:	6442                	ld	s0,16(sp)
 546:	6105                	addi	sp,sp,32
 548:	8082                	ret

000000000000054a <printint>:
 54a:	7139                	addi	sp,sp,-64
 54c:	fc06                	sd	ra,56(sp)
 54e:	f822                	sd	s0,48(sp)
 550:	f426                	sd	s1,40(sp)
 552:	f04a                	sd	s2,32(sp)
 554:	ec4e                	sd	s3,24(sp)
 556:	0080                	addi	s0,sp,64
 558:	84aa                	mv	s1,a0
 55a:	c299                	beqz	a3,560 <printint+0x16>
 55c:	0805c863          	bltz	a1,5ec <printint+0xa2>
 560:	2581                	sext.w	a1,a1
 562:	4881                	li	a7,0
 564:	fc040993          	addi	s3,s0,-64
 568:	86ce                	mv	a3,s3
 56a:	4701                	li	a4,0
 56c:	2601                	sext.w	a2,a2
 56e:	00000517          	auipc	a0,0x0
 572:	4e250513          	addi	a0,a0,1250 # a50 <digits>
 576:	883a                	mv	a6,a4
 578:	2705                	addiw	a4,a4,1
 57a:	02c5f7bb          	remuw	a5,a1,a2
 57e:	1782                	slli	a5,a5,0x20
 580:	9381                	srli	a5,a5,0x20
 582:	97aa                	add	a5,a5,a0
 584:	0007c783          	lbu	a5,0(a5)
 588:	00f68023          	sb	a5,0(a3)
 58c:	0005879b          	sext.w	a5,a1
 590:	02c5d5bb          	divuw	a1,a1,a2
 594:	0685                	addi	a3,a3,1
 596:	fec7f0e3          	bgeu	a5,a2,576 <printint+0x2c>
 59a:	00088c63          	beqz	a7,5b2 <printint+0x68>
 59e:	fd070793          	addi	a5,a4,-48
 5a2:	00878733          	add	a4,a5,s0
 5a6:	02d00793          	li	a5,45
 5aa:	fef70823          	sb	a5,-16(a4)
 5ae:	0028071b          	addiw	a4,a6,2
 5b2:	02e05663          	blez	a4,5de <printint+0x94>
 5b6:	fc040913          	addi	s2,s0,-64
 5ba:	993a                	add	s2,s2,a4
 5bc:	19fd                	addi	s3,s3,-1
 5be:	99ba                	add	s3,s3,a4
 5c0:	377d                	addiw	a4,a4,-1
 5c2:	1702                	slli	a4,a4,0x20
 5c4:	9301                	srli	a4,a4,0x20
 5c6:	40e989b3          	sub	s3,s3,a4
 5ca:	fff94583          	lbu	a1,-1(s2)
 5ce:	8526                	mv	a0,s1
 5d0:	00000097          	auipc	ra,0x0
 5d4:	f58080e7          	jalr	-168(ra) # 528 <putc>
 5d8:	197d                	addi	s2,s2,-1
 5da:	ff3918e3          	bne	s2,s3,5ca <printint+0x80>
 5de:	70e2                	ld	ra,56(sp)
 5e0:	7442                	ld	s0,48(sp)
 5e2:	74a2                	ld	s1,40(sp)
 5e4:	7902                	ld	s2,32(sp)
 5e6:	69e2                	ld	s3,24(sp)
 5e8:	6121                	addi	sp,sp,64
 5ea:	8082                	ret
 5ec:	40b005bb          	negw	a1,a1
 5f0:	4885                	li	a7,1
 5f2:	bf8d                	j	564 <printint+0x1a>

00000000000005f4 <vprintf>:
 5f4:	715d                	addi	sp,sp,-80
 5f6:	e486                	sd	ra,72(sp)
 5f8:	e0a2                	sd	s0,64(sp)
 5fa:	fc26                	sd	s1,56(sp)
 5fc:	f84a                	sd	s2,48(sp)
 5fe:	f44e                	sd	s3,40(sp)
 600:	f052                	sd	s4,32(sp)
 602:	ec56                	sd	s5,24(sp)
 604:	e85a                	sd	s6,16(sp)
 606:	e45e                	sd	s7,8(sp)
 608:	e062                	sd	s8,0(sp)
 60a:	0880                	addi	s0,sp,80
 60c:	0005c903          	lbu	s2,0(a1)
 610:	18090c63          	beqz	s2,7a8 <vprintf+0x1b4>
 614:	8aaa                	mv	s5,a0
 616:	8bb2                	mv	s7,a2
 618:	00158493          	addi	s1,a1,1
 61c:	4981                	li	s3,0
 61e:	02500a13          	li	s4,37
 622:	4b55                	li	s6,21
 624:	a839                	j	642 <vprintf+0x4e>
 626:	85ca                	mv	a1,s2
 628:	8556                	mv	a0,s5
 62a:	00000097          	auipc	ra,0x0
 62e:	efe080e7          	jalr	-258(ra) # 528 <putc>
 632:	a019                	j	638 <vprintf+0x44>
 634:	01498d63          	beq	s3,s4,64e <vprintf+0x5a>
 638:	0485                	addi	s1,s1,1
 63a:	fff4c903          	lbu	s2,-1(s1)
 63e:	16090563          	beqz	s2,7a8 <vprintf+0x1b4>
 642:	fe0999e3          	bnez	s3,634 <vprintf+0x40>
 646:	ff4910e3          	bne	s2,s4,626 <vprintf+0x32>
 64a:	89d2                	mv	s3,s4
 64c:	b7f5                	j	638 <vprintf+0x44>
 64e:	13490263          	beq	s2,s4,772 <vprintf+0x17e>
 652:	f9d9079b          	addiw	a5,s2,-99
 656:	0ff7f793          	zext.b	a5,a5
 65a:	12fb6563          	bltu	s6,a5,784 <vprintf+0x190>
 65e:	f9d9079b          	addiw	a5,s2,-99
 662:	0ff7f713          	zext.b	a4,a5
 666:	10eb6f63          	bltu	s6,a4,784 <vprintf+0x190>
 66a:	00271793          	slli	a5,a4,0x2
 66e:	00000717          	auipc	a4,0x0
 672:	38a70713          	addi	a4,a4,906 # 9f8 <malloc+0x152>
 676:	97ba                	add	a5,a5,a4
 678:	439c                	lw	a5,0(a5)
 67a:	97ba                	add	a5,a5,a4
 67c:	8782                	jr	a5
 67e:	008b8913          	addi	s2,s7,8
 682:	4685                	li	a3,1
 684:	4629                	li	a2,10
 686:	000ba583          	lw	a1,0(s7)
 68a:	8556                	mv	a0,s5
 68c:	00000097          	auipc	ra,0x0
 690:	ebe080e7          	jalr	-322(ra) # 54a <printint>
 694:	8bca                	mv	s7,s2
 696:	4981                	li	s3,0
 698:	b745                	j	638 <vprintf+0x44>
 69a:	008b8913          	addi	s2,s7,8
 69e:	4681                	li	a3,0
 6a0:	4629                	li	a2,10
 6a2:	000ba583          	lw	a1,0(s7)
 6a6:	8556                	mv	a0,s5
 6a8:	00000097          	auipc	ra,0x0
 6ac:	ea2080e7          	jalr	-350(ra) # 54a <printint>
 6b0:	8bca                	mv	s7,s2
 6b2:	4981                	li	s3,0
 6b4:	b751                	j	638 <vprintf+0x44>
 6b6:	008b8913          	addi	s2,s7,8
 6ba:	4681                	li	a3,0
 6bc:	4641                	li	a2,16
 6be:	000ba583          	lw	a1,0(s7)
 6c2:	8556                	mv	a0,s5
 6c4:	00000097          	auipc	ra,0x0
 6c8:	e86080e7          	jalr	-378(ra) # 54a <printint>
 6cc:	8bca                	mv	s7,s2
 6ce:	4981                	li	s3,0
 6d0:	b7a5                	j	638 <vprintf+0x44>
 6d2:	008b8c13          	addi	s8,s7,8
 6d6:	000bb983          	ld	s3,0(s7)
 6da:	03000593          	li	a1,48
 6de:	8556                	mv	a0,s5
 6e0:	00000097          	auipc	ra,0x0
 6e4:	e48080e7          	jalr	-440(ra) # 528 <putc>
 6e8:	07800593          	li	a1,120
 6ec:	8556                	mv	a0,s5
 6ee:	00000097          	auipc	ra,0x0
 6f2:	e3a080e7          	jalr	-454(ra) # 528 <putc>
 6f6:	4941                	li	s2,16
 6f8:	00000b97          	auipc	s7,0x0
 6fc:	358b8b93          	addi	s7,s7,856 # a50 <digits>
 700:	03c9d793          	srli	a5,s3,0x3c
 704:	97de                	add	a5,a5,s7
 706:	0007c583          	lbu	a1,0(a5)
 70a:	8556                	mv	a0,s5
 70c:	00000097          	auipc	ra,0x0
 710:	e1c080e7          	jalr	-484(ra) # 528 <putc>
 714:	0992                	slli	s3,s3,0x4
 716:	397d                	addiw	s2,s2,-1
 718:	fe0914e3          	bnez	s2,700 <vprintf+0x10c>
 71c:	8be2                	mv	s7,s8
 71e:	4981                	li	s3,0
 720:	bf21                	j	638 <vprintf+0x44>
 722:	008b8993          	addi	s3,s7,8
 726:	000bb903          	ld	s2,0(s7)
 72a:	02090163          	beqz	s2,74c <vprintf+0x158>
 72e:	00094583          	lbu	a1,0(s2)
 732:	c9a5                	beqz	a1,7a2 <vprintf+0x1ae>
 734:	8556                	mv	a0,s5
 736:	00000097          	auipc	ra,0x0
 73a:	df2080e7          	jalr	-526(ra) # 528 <putc>
 73e:	0905                	addi	s2,s2,1
 740:	00094583          	lbu	a1,0(s2)
 744:	f9e5                	bnez	a1,734 <vprintf+0x140>
 746:	8bce                	mv	s7,s3
 748:	4981                	li	s3,0
 74a:	b5fd                	j	638 <vprintf+0x44>
 74c:	00000917          	auipc	s2,0x0
 750:	2a490913          	addi	s2,s2,676 # 9f0 <malloc+0x14a>
 754:	02800593          	li	a1,40
 758:	bff1                	j	734 <vprintf+0x140>
 75a:	008b8913          	addi	s2,s7,8
 75e:	000bc583          	lbu	a1,0(s7)
 762:	8556                	mv	a0,s5
 764:	00000097          	auipc	ra,0x0
 768:	dc4080e7          	jalr	-572(ra) # 528 <putc>
 76c:	8bca                	mv	s7,s2
 76e:	4981                	li	s3,0
 770:	b5e1                	j	638 <vprintf+0x44>
 772:	02500593          	li	a1,37
 776:	8556                	mv	a0,s5
 778:	00000097          	auipc	ra,0x0
 77c:	db0080e7          	jalr	-592(ra) # 528 <putc>
 780:	4981                	li	s3,0
 782:	bd5d                	j	638 <vprintf+0x44>
 784:	02500593          	li	a1,37
 788:	8556                	mv	a0,s5
 78a:	00000097          	auipc	ra,0x0
 78e:	d9e080e7          	jalr	-610(ra) # 528 <putc>
 792:	85ca                	mv	a1,s2
 794:	8556                	mv	a0,s5
 796:	00000097          	auipc	ra,0x0
 79a:	d92080e7          	jalr	-622(ra) # 528 <putc>
 79e:	4981                	li	s3,0
 7a0:	bd61                	j	638 <vprintf+0x44>
 7a2:	8bce                	mv	s7,s3
 7a4:	4981                	li	s3,0
 7a6:	bd49                	j	638 <vprintf+0x44>
 7a8:	60a6                	ld	ra,72(sp)
 7aa:	6406                	ld	s0,64(sp)
 7ac:	74e2                	ld	s1,56(sp)
 7ae:	7942                	ld	s2,48(sp)
 7b0:	79a2                	ld	s3,40(sp)
 7b2:	7a02                	ld	s4,32(sp)
 7b4:	6ae2                	ld	s5,24(sp)
 7b6:	6b42                	ld	s6,16(sp)
 7b8:	6ba2                	ld	s7,8(sp)
 7ba:	6c02                	ld	s8,0(sp)
 7bc:	6161                	addi	sp,sp,80
 7be:	8082                	ret

00000000000007c0 <fprintf>:
 7c0:	715d                	addi	sp,sp,-80
 7c2:	ec06                	sd	ra,24(sp)
 7c4:	e822                	sd	s0,16(sp)
 7c6:	1000                	addi	s0,sp,32
 7c8:	e010                	sd	a2,0(s0)
 7ca:	e414                	sd	a3,8(s0)
 7cc:	e818                	sd	a4,16(s0)
 7ce:	ec1c                	sd	a5,24(s0)
 7d0:	03043023          	sd	a6,32(s0)
 7d4:	03143423          	sd	a7,40(s0)
 7d8:	8622                	mv	a2,s0
 7da:	fe843423          	sd	s0,-24(s0)
 7de:	00000097          	auipc	ra,0x0
 7e2:	e16080e7          	jalr	-490(ra) # 5f4 <vprintf>
 7e6:	60e2                	ld	ra,24(sp)
 7e8:	6442                	ld	s0,16(sp)
 7ea:	6161                	addi	sp,sp,80
 7ec:	8082                	ret

00000000000007ee <printf>:
 7ee:	711d                	addi	sp,sp,-96
 7f0:	ec06                	sd	ra,24(sp)
 7f2:	e822                	sd	s0,16(sp)
 7f4:	1000                	addi	s0,sp,32
 7f6:	e40c                	sd	a1,8(s0)
 7f8:	e810                	sd	a2,16(s0)
 7fa:	ec14                	sd	a3,24(s0)
 7fc:	f018                	sd	a4,32(s0)
 7fe:	f41c                	sd	a5,40(s0)
 800:	03043823          	sd	a6,48(s0)
 804:	03143c23          	sd	a7,56(s0)
 808:	00840613          	addi	a2,s0,8
 80c:	fec43423          	sd	a2,-24(s0)
 810:	85aa                	mv	a1,a0
 812:	4505                	li	a0,1
 814:	00000097          	auipc	ra,0x0
 818:	de0080e7          	jalr	-544(ra) # 5f4 <vprintf>
 81c:	60e2                	ld	ra,24(sp)
 81e:	6442                	ld	s0,16(sp)
 820:	6125                	addi	sp,sp,96
 822:	8082                	ret

0000000000000824 <free>:
 824:	1141                	addi	sp,sp,-16
 826:	e422                	sd	s0,8(sp)
 828:	0800                	addi	s0,sp,16
 82a:	ff050693          	addi	a3,a0,-16
 82e:	00000797          	auipc	a5,0x0
 832:	43a7b783          	ld	a5,1082(a5) # c68 <freep>
 836:	a02d                	j	860 <free+0x3c>
 838:	4618                	lw	a4,8(a2)
 83a:	9f2d                	addw	a4,a4,a1
 83c:	fee52c23          	sw	a4,-8(a0)
 840:	6398                	ld	a4,0(a5)
 842:	6310                	ld	a2,0(a4)
 844:	a83d                	j	882 <free+0x5e>
 846:	ff852703          	lw	a4,-8(a0)
 84a:	9f31                	addw	a4,a4,a2
 84c:	c798                	sw	a4,8(a5)
 84e:	ff053683          	ld	a3,-16(a0)
 852:	a091                	j	896 <free+0x72>
 854:	6398                	ld	a4,0(a5)
 856:	00e7e463          	bltu	a5,a4,85e <free+0x3a>
 85a:	00e6ea63          	bltu	a3,a4,86e <free+0x4a>
 85e:	87ba                	mv	a5,a4
 860:	fed7fae3          	bgeu	a5,a3,854 <free+0x30>
 864:	6398                	ld	a4,0(a5)
 866:	00e6e463          	bltu	a3,a4,86e <free+0x4a>
 86a:	fee7eae3          	bltu	a5,a4,85e <free+0x3a>
 86e:	ff852583          	lw	a1,-8(a0)
 872:	6390                	ld	a2,0(a5)
 874:	02059813          	slli	a6,a1,0x20
 878:	01c85713          	srli	a4,a6,0x1c
 87c:	9736                	add	a4,a4,a3
 87e:	fae60de3          	beq	a2,a4,838 <free+0x14>
 882:	fec53823          	sd	a2,-16(a0)
 886:	4790                	lw	a2,8(a5)
 888:	02061593          	slli	a1,a2,0x20
 88c:	01c5d713          	srli	a4,a1,0x1c
 890:	973e                	add	a4,a4,a5
 892:	fae68ae3          	beq	a3,a4,846 <free+0x22>
 896:	e394                	sd	a3,0(a5)
 898:	00000717          	auipc	a4,0x0
 89c:	3cf73823          	sd	a5,976(a4) # c68 <freep>
 8a0:	6422                	ld	s0,8(sp)
 8a2:	0141                	addi	sp,sp,16
 8a4:	8082                	ret

00000000000008a6 <malloc>:
 8a6:	7139                	addi	sp,sp,-64
 8a8:	fc06                	sd	ra,56(sp)
 8aa:	f822                	sd	s0,48(sp)
 8ac:	f426                	sd	s1,40(sp)
 8ae:	f04a                	sd	s2,32(sp)
 8b0:	ec4e                	sd	s3,24(sp)
 8b2:	e852                	sd	s4,16(sp)
 8b4:	e456                	sd	s5,8(sp)
 8b6:	e05a                	sd	s6,0(sp)
 8b8:	0080                	addi	s0,sp,64
 8ba:	02051493          	slli	s1,a0,0x20
 8be:	9081                	srli	s1,s1,0x20
 8c0:	04bd                	addi	s1,s1,15
 8c2:	8091                	srli	s1,s1,0x4
 8c4:	0014899b          	addiw	s3,s1,1
 8c8:	0485                	addi	s1,s1,1
 8ca:	00000517          	auipc	a0,0x0
 8ce:	39e53503          	ld	a0,926(a0) # c68 <freep>
 8d2:	c515                	beqz	a0,8fe <malloc+0x58>
 8d4:	611c                	ld	a5,0(a0)
 8d6:	4798                	lw	a4,8(a5)
 8d8:	04977063          	bgeu	a4,s1,918 <malloc+0x72>
 8dc:	8a4e                	mv	s4,s3
 8de:	0009871b          	sext.w	a4,s3
 8e2:	6685                	lui	a3,0x1
 8e4:	00d77363          	bgeu	a4,a3,8ea <malloc+0x44>
 8e8:	6a05                	lui	s4,0x1
 8ea:	000a0b1b          	sext.w	s6,s4
 8ee:	004a1a1b          	slliw	s4,s4,0x4
 8f2:	00000917          	auipc	s2,0x0
 8f6:	37690913          	addi	s2,s2,886 # c68 <freep>
 8fa:	5afd                	li	s5,-1
 8fc:	a89d                	j	972 <malloc+0xcc>
 8fe:	00000717          	auipc	a4,0x0
 902:	36a70713          	addi	a4,a4,874 # c68 <freep>
 906:	00000797          	auipc	a5,0x0
 90a:	36a78793          	addi	a5,a5,874 # c70 <base>
 90e:	e31c                	sd	a5,0(a4)
 910:	e71c                	sd	a5,8(a4)
 912:	00072823          	sw	zero,16(a4)
 916:	b7d9                	j	8dc <malloc+0x36>
 918:	02e48c63          	beq	s1,a4,950 <malloc+0xaa>
 91c:	4137073b          	subw	a4,a4,s3
 920:	c798                	sw	a4,8(a5)
 922:	02071693          	slli	a3,a4,0x20
 926:	01c6d713          	srli	a4,a3,0x1c
 92a:	97ba                	add	a5,a5,a4
 92c:	0137a423          	sw	s3,8(a5)
 930:	00000717          	auipc	a4,0x0
 934:	32a73c23          	sd	a0,824(a4) # c68 <freep>
 938:	01078513          	addi	a0,a5,16
 93c:	70e2                	ld	ra,56(sp)
 93e:	7442                	ld	s0,48(sp)
 940:	74a2                	ld	s1,40(sp)
 942:	7902                	ld	s2,32(sp)
 944:	69e2                	ld	s3,24(sp)
 946:	6a42                	ld	s4,16(sp)
 948:	6aa2                	ld	s5,8(sp)
 94a:	6b02                	ld	s6,0(sp)
 94c:	6121                	addi	sp,sp,64
 94e:	8082                	ret
 950:	6398                	ld	a4,0(a5)
 952:	e118                	sd	a4,0(a0)
 954:	bff1                	j	930 <malloc+0x8a>
 956:	01652423          	sw	s6,8(a0)
 95a:	0541                	addi	a0,a0,16
 95c:	00000097          	auipc	ra,0x0
 960:	ec8080e7          	jalr	-312(ra) # 824 <free>
 964:	00093503          	ld	a0,0(s2)
 968:	d971                	beqz	a0,93c <malloc+0x96>
 96a:	611c                	ld	a5,0(a0)
 96c:	4798                	lw	a4,8(a5)
 96e:	fa9775e3          	bgeu	a4,s1,918 <malloc+0x72>
 972:	00093703          	ld	a4,0(s2)
 976:	853e                	mv	a0,a5
 978:	fef719e3          	bne	a4,a5,96a <malloc+0xc4>
 97c:	8552                	mv	a0,s4
 97e:	00000097          	auipc	ra,0x0
 982:	b52080e7          	jalr	-1198(ra) # 4d0 <sbrk>
 986:	fd5518e3          	bne	a0,s5,956 <malloc+0xb0>
 98a:	4501                	li	a0,0
 98c:	bf45                	j	93c <malloc+0x96>
