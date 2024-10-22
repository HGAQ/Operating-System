
xv6-user/_cat:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <cat>:

char buf[512];

void
cat(int fd)
{
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	ec26                	sd	s1,24(sp)
   8:	e84a                	sd	s2,16(sp)
   a:	e44e                	sd	s3,8(sp)
   c:	1800                	addi	s0,sp,48
   e:	89aa                	mv	s3,a0
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
  10:	00001917          	auipc	s2,0x1
  14:	9b890913          	addi	s2,s2,-1608 # 9c8 <buf>
  18:	20000613          	li	a2,512
  1c:	85ca                	mv	a1,s2
  1e:	854e                	mv	a0,s3
  20:	00000097          	auipc	ra,0x0
  24:	3ce080e7          	jalr	974(ra) # 3ee <read>
  28:	84aa                	mv	s1,a0
  2a:	02a05963          	blez	a0,5c <cat+0x5c>
    if (write(1, buf, n) != n) {
  2e:	8626                	mv	a2,s1
  30:	85ca                	mv	a1,s2
  32:	4505                	li	a0,1
  34:	00000097          	auipc	ra,0x0
  38:	3c2080e7          	jalr	962(ra) # 3f6 <write>
  3c:	fc950ee3          	beq	a0,s1,18 <cat+0x18>
      fprintf(2, "cat: write error\n");
  40:	00001597          	auipc	a1,0x1
  44:	8c858593          	addi	a1,a1,-1848 # 908 <malloc+0xec>
  48:	4509                	li	a0,2
  4a:	00000097          	auipc	ra,0x0
  4e:	6ec080e7          	jalr	1772(ra) # 736 <fprintf>
      exit(1);
  52:	4505                	li	a0,1
  54:	00000097          	auipc	ra,0x0
  58:	382080e7          	jalr	898(ra) # 3d6 <exit>
    }
  }
  if(n < 0){
  5c:	00054963          	bltz	a0,6e <cat+0x6e>
    fprintf(2, "cat: read error\n");
    exit(1);
  }
}
  60:	70a2                	ld	ra,40(sp)
  62:	7402                	ld	s0,32(sp)
  64:	64e2                	ld	s1,24(sp)
  66:	6942                	ld	s2,16(sp)
  68:	69a2                	ld	s3,8(sp)
  6a:	6145                	addi	sp,sp,48
  6c:	8082                	ret
    fprintf(2, "cat: read error\n");
  6e:	00001597          	auipc	a1,0x1
  72:	8b258593          	addi	a1,a1,-1870 # 920 <malloc+0x104>
  76:	4509                	li	a0,2
  78:	00000097          	auipc	ra,0x0
  7c:	6be080e7          	jalr	1726(ra) # 736 <fprintf>
    exit(1);
  80:	4505                	li	a0,1
  82:	00000097          	auipc	ra,0x0
  86:	354080e7          	jalr	852(ra) # 3d6 <exit>

000000000000008a <main>:

int
main(int argc, char *argv[])
{
  8a:	7179                	addi	sp,sp,-48
  8c:	f406                	sd	ra,40(sp)
  8e:	f022                	sd	s0,32(sp)
  90:	ec26                	sd	s1,24(sp)
  92:	e84a                	sd	s2,16(sp)
  94:	e44e                	sd	s3,8(sp)
  96:	e052                	sd	s4,0(sp)
  98:	1800                	addi	s0,sp,48
  int fd, i;

  if(argc <= 1){
  9a:	4785                	li	a5,1
  9c:	04a7d763          	bge	a5,a0,ea <main+0x60>
  a0:	00858913          	addi	s2,a1,8
  a4:	ffe5099b          	addiw	s3,a0,-2
  a8:	02099793          	slli	a5,s3,0x20
  ac:	01d7d993          	srli	s3,a5,0x1d
  b0:	05c1                	addi	a1,a1,16
  b2:	99ae                	add	s3,s3,a1
    cat(0);
    exit(0);
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  b4:	4581                	li	a1,0
  b6:	00093503          	ld	a0,0(s2)
  ba:	00000097          	auipc	ra,0x0
  be:	35c080e7          	jalr	860(ra) # 416 <open>
  c2:	84aa                	mv	s1,a0
  c4:	02054d63          	bltz	a0,fe <main+0x74>
      fprintf(2, "cat: cannot open %s\n", argv[i]);
      exit(1);
    }
    cat(fd);
  c8:	00000097          	auipc	ra,0x0
  cc:	f38080e7          	jalr	-200(ra) # 0 <cat>
    close(fd);
  d0:	8526                	mv	a0,s1
  d2:	00000097          	auipc	ra,0x0
  d6:	32c080e7          	jalr	812(ra) # 3fe <close>
  for(i = 1; i < argc; i++){
  da:	0921                	addi	s2,s2,8
  dc:	fd391ce3          	bne	s2,s3,b4 <main+0x2a>
  }
  exit(0);
  e0:	4501                	li	a0,0
  e2:	00000097          	auipc	ra,0x0
  e6:	2f4080e7          	jalr	756(ra) # 3d6 <exit>
    cat(0);
  ea:	4501                	li	a0,0
  ec:	00000097          	auipc	ra,0x0
  f0:	f14080e7          	jalr	-236(ra) # 0 <cat>
    exit(0);
  f4:	4501                	li	a0,0
  f6:	00000097          	auipc	ra,0x0
  fa:	2e0080e7          	jalr	736(ra) # 3d6 <exit>
      fprintf(2, "cat: cannot open %s\n", argv[i]);
  fe:	00093603          	ld	a2,0(s2)
 102:	00001597          	auipc	a1,0x1
 106:	83658593          	addi	a1,a1,-1994 # 938 <malloc+0x11c>
 10a:	4509                	li	a0,2
 10c:	00000097          	auipc	ra,0x0
 110:	62a080e7          	jalr	1578(ra) # 736 <fprintf>
      exit(1);
 114:	4505                	li	a0,1
 116:	00000097          	auipc	ra,0x0
 11a:	2c0080e7          	jalr	704(ra) # 3d6 <exit>

000000000000011e <strcpy>:
 11e:	1141                	addi	sp,sp,-16
 120:	e422                	sd	s0,8(sp)
 122:	0800                	addi	s0,sp,16
 124:	87aa                	mv	a5,a0
 126:	0585                	addi	a1,a1,1
 128:	0785                	addi	a5,a5,1
 12a:	fff5c703          	lbu	a4,-1(a1)
 12e:	fee78fa3          	sb	a4,-1(a5)
 132:	fb75                	bnez	a4,126 <strcpy+0x8>
 134:	6422                	ld	s0,8(sp)
 136:	0141                	addi	sp,sp,16
 138:	8082                	ret

000000000000013a <strcat>:
 13a:	1141                	addi	sp,sp,-16
 13c:	e422                	sd	s0,8(sp)
 13e:	0800                	addi	s0,sp,16
 140:	00054783          	lbu	a5,0(a0)
 144:	c385                	beqz	a5,164 <strcat+0x2a>
 146:	87aa                	mv	a5,a0
 148:	0785                	addi	a5,a5,1
 14a:	0007c703          	lbu	a4,0(a5)
 14e:	ff6d                	bnez	a4,148 <strcat+0xe>
 150:	0585                	addi	a1,a1,1
 152:	0785                	addi	a5,a5,1
 154:	fff5c703          	lbu	a4,-1(a1)
 158:	fee78fa3          	sb	a4,-1(a5)
 15c:	fb75                	bnez	a4,150 <strcat+0x16>
 15e:	6422                	ld	s0,8(sp)
 160:	0141                	addi	sp,sp,16
 162:	8082                	ret
 164:	87aa                	mv	a5,a0
 166:	b7ed                	j	150 <strcat+0x16>

0000000000000168 <strcmp>:
 168:	1141                	addi	sp,sp,-16
 16a:	e422                	sd	s0,8(sp)
 16c:	0800                	addi	s0,sp,16
 16e:	00054783          	lbu	a5,0(a0)
 172:	cb91                	beqz	a5,186 <strcmp+0x1e>
 174:	0005c703          	lbu	a4,0(a1)
 178:	00f71763          	bne	a4,a5,186 <strcmp+0x1e>
 17c:	0505                	addi	a0,a0,1
 17e:	0585                	addi	a1,a1,1
 180:	00054783          	lbu	a5,0(a0)
 184:	fbe5                	bnez	a5,174 <strcmp+0xc>
 186:	0005c503          	lbu	a0,0(a1)
 18a:	40a7853b          	subw	a0,a5,a0
 18e:	6422                	ld	s0,8(sp)
 190:	0141                	addi	sp,sp,16
 192:	8082                	ret

0000000000000194 <strlen>:
 194:	1141                	addi	sp,sp,-16
 196:	e422                	sd	s0,8(sp)
 198:	0800                	addi	s0,sp,16
 19a:	00054783          	lbu	a5,0(a0)
 19e:	cf91                	beqz	a5,1ba <strlen+0x26>
 1a0:	0505                	addi	a0,a0,1
 1a2:	87aa                	mv	a5,a0
 1a4:	86be                	mv	a3,a5
 1a6:	0785                	addi	a5,a5,1
 1a8:	fff7c703          	lbu	a4,-1(a5)
 1ac:	ff65                	bnez	a4,1a4 <strlen+0x10>
 1ae:	40a6853b          	subw	a0,a3,a0
 1b2:	2505                	addiw	a0,a0,1
 1b4:	6422                	ld	s0,8(sp)
 1b6:	0141                	addi	sp,sp,16
 1b8:	8082                	ret
 1ba:	4501                	li	a0,0
 1bc:	bfe5                	j	1b4 <strlen+0x20>

00000000000001be <memset>:
 1be:	1141                	addi	sp,sp,-16
 1c0:	e422                	sd	s0,8(sp)
 1c2:	0800                	addi	s0,sp,16
 1c4:	ca19                	beqz	a2,1da <memset+0x1c>
 1c6:	87aa                	mv	a5,a0
 1c8:	1602                	slli	a2,a2,0x20
 1ca:	9201                	srli	a2,a2,0x20
 1cc:	00a60733          	add	a4,a2,a0
 1d0:	00b78023          	sb	a1,0(a5)
 1d4:	0785                	addi	a5,a5,1
 1d6:	fee79de3          	bne	a5,a4,1d0 <memset+0x12>
 1da:	6422                	ld	s0,8(sp)
 1dc:	0141                	addi	sp,sp,16
 1de:	8082                	ret

00000000000001e0 <strchr>:
 1e0:	1141                	addi	sp,sp,-16
 1e2:	e422                	sd	s0,8(sp)
 1e4:	0800                	addi	s0,sp,16
 1e6:	00054783          	lbu	a5,0(a0)
 1ea:	cb99                	beqz	a5,200 <strchr+0x20>
 1ec:	00f58763          	beq	a1,a5,1fa <strchr+0x1a>
 1f0:	0505                	addi	a0,a0,1
 1f2:	00054783          	lbu	a5,0(a0)
 1f6:	fbfd                	bnez	a5,1ec <strchr+0xc>
 1f8:	4501                	li	a0,0
 1fa:	6422                	ld	s0,8(sp)
 1fc:	0141                	addi	sp,sp,16
 1fe:	8082                	ret
 200:	4501                	li	a0,0
 202:	bfe5                	j	1fa <strchr+0x1a>

0000000000000204 <gets>:
 204:	711d                	addi	sp,sp,-96
 206:	ec86                	sd	ra,88(sp)
 208:	e8a2                	sd	s0,80(sp)
 20a:	e4a6                	sd	s1,72(sp)
 20c:	e0ca                	sd	s2,64(sp)
 20e:	fc4e                	sd	s3,56(sp)
 210:	f852                	sd	s4,48(sp)
 212:	f456                	sd	s5,40(sp)
 214:	f05a                	sd	s6,32(sp)
 216:	ec5e                	sd	s7,24(sp)
 218:	e862                	sd	s8,16(sp)
 21a:	1080                	addi	s0,sp,96
 21c:	8baa                	mv	s7,a0
 21e:	8a2e                	mv	s4,a1
 220:	892a                	mv	s2,a0
 222:	4481                	li	s1,0
 224:	faf40a93          	addi	s5,s0,-81
 228:	4b29                	li	s6,10
 22a:	4c35                	li	s8,13
 22c:	89a6                	mv	s3,s1
 22e:	2485                	addiw	s1,s1,1
 230:	0344d763          	bge	s1,s4,25e <gets+0x5a>
 234:	4605                	li	a2,1
 236:	85d6                	mv	a1,s5
 238:	4501                	li	a0,0
 23a:	00000097          	auipc	ra,0x0
 23e:	1b4080e7          	jalr	436(ra) # 3ee <read>
 242:	00a05e63          	blez	a0,25e <gets+0x5a>
 246:	faf44783          	lbu	a5,-81(s0)
 24a:	00f90023          	sb	a5,0(s2)
 24e:	01678763          	beq	a5,s6,25c <gets+0x58>
 252:	0905                	addi	s2,s2,1
 254:	fd879ce3          	bne	a5,s8,22c <gets+0x28>
 258:	89a6                	mv	s3,s1
 25a:	a011                	j	25e <gets+0x5a>
 25c:	89a6                	mv	s3,s1
 25e:	99de                	add	s3,s3,s7
 260:	00098023          	sb	zero,0(s3)
 264:	855e                	mv	a0,s7
 266:	60e6                	ld	ra,88(sp)
 268:	6446                	ld	s0,80(sp)
 26a:	64a6                	ld	s1,72(sp)
 26c:	6906                	ld	s2,64(sp)
 26e:	79e2                	ld	s3,56(sp)
 270:	7a42                	ld	s4,48(sp)
 272:	7aa2                	ld	s5,40(sp)
 274:	7b02                	ld	s6,32(sp)
 276:	6be2                	ld	s7,24(sp)
 278:	6c42                	ld	s8,16(sp)
 27a:	6125                	addi	sp,sp,96
 27c:	8082                	ret

000000000000027e <stat>:
 27e:	1101                	addi	sp,sp,-32
 280:	ec06                	sd	ra,24(sp)
 282:	e822                	sd	s0,16(sp)
 284:	e426                	sd	s1,8(sp)
 286:	e04a                	sd	s2,0(sp)
 288:	1000                	addi	s0,sp,32
 28a:	892e                	mv	s2,a1
 28c:	4581                	li	a1,0
 28e:	00000097          	auipc	ra,0x0
 292:	188080e7          	jalr	392(ra) # 416 <open>
 296:	02054563          	bltz	a0,2c0 <stat+0x42>
 29a:	84aa                	mv	s1,a0
 29c:	85ca                	mv	a1,s2
 29e:	00000097          	auipc	ra,0x0
 2a2:	180080e7          	jalr	384(ra) # 41e <fstat>
 2a6:	892a                	mv	s2,a0
 2a8:	8526                	mv	a0,s1
 2aa:	00000097          	auipc	ra,0x0
 2ae:	154080e7          	jalr	340(ra) # 3fe <close>
 2b2:	854a                	mv	a0,s2
 2b4:	60e2                	ld	ra,24(sp)
 2b6:	6442                	ld	s0,16(sp)
 2b8:	64a2                	ld	s1,8(sp)
 2ba:	6902                	ld	s2,0(sp)
 2bc:	6105                	addi	sp,sp,32
 2be:	8082                	ret
 2c0:	597d                	li	s2,-1
 2c2:	bfc5                	j	2b2 <stat+0x34>

00000000000002c4 <atoi>:
 2c4:	1141                	addi	sp,sp,-16
 2c6:	e422                	sd	s0,8(sp)
 2c8:	0800                	addi	s0,sp,16
 2ca:	00054703          	lbu	a4,0(a0)
 2ce:	02d00793          	li	a5,45
 2d2:	4585                	li	a1,1
 2d4:	04f70363          	beq	a4,a5,31a <atoi+0x56>
 2d8:	00054703          	lbu	a4,0(a0)
 2dc:	fd07079b          	addiw	a5,a4,-48
 2e0:	0ff7f793          	zext.b	a5,a5
 2e4:	46a5                	li	a3,9
 2e6:	02f6ed63          	bltu	a3,a5,320 <atoi+0x5c>
 2ea:	4681                	li	a3,0
 2ec:	4625                	li	a2,9
 2ee:	0505                	addi	a0,a0,1
 2f0:	0026979b          	slliw	a5,a3,0x2
 2f4:	9fb5                	addw	a5,a5,a3
 2f6:	0017979b          	slliw	a5,a5,0x1
 2fa:	9fb9                	addw	a5,a5,a4
 2fc:	fd07869b          	addiw	a3,a5,-48
 300:	00054703          	lbu	a4,0(a0)
 304:	fd07079b          	addiw	a5,a4,-48
 308:	0ff7f793          	zext.b	a5,a5
 30c:	fef671e3          	bgeu	a2,a5,2ee <atoi+0x2a>
 310:	02d5853b          	mulw	a0,a1,a3
 314:	6422                	ld	s0,8(sp)
 316:	0141                	addi	sp,sp,16
 318:	8082                	ret
 31a:	0505                	addi	a0,a0,1
 31c:	55fd                	li	a1,-1
 31e:	bf6d                	j	2d8 <atoi+0x14>
 320:	4681                	li	a3,0
 322:	b7fd                	j	310 <atoi+0x4c>

0000000000000324 <memmove>:
 324:	1141                	addi	sp,sp,-16
 326:	e422                	sd	s0,8(sp)
 328:	0800                	addi	s0,sp,16
 32a:	02b57463          	bgeu	a0,a1,352 <memmove+0x2e>
 32e:	00c05f63          	blez	a2,34c <memmove+0x28>
 332:	1602                	slli	a2,a2,0x20
 334:	9201                	srli	a2,a2,0x20
 336:	00c507b3          	add	a5,a0,a2
 33a:	872a                	mv	a4,a0
 33c:	0585                	addi	a1,a1,1
 33e:	0705                	addi	a4,a4,1
 340:	fff5c683          	lbu	a3,-1(a1)
 344:	fed70fa3          	sb	a3,-1(a4)
 348:	fee79ae3          	bne	a5,a4,33c <memmove+0x18>
 34c:	6422                	ld	s0,8(sp)
 34e:	0141                	addi	sp,sp,16
 350:	8082                	ret
 352:	00c50733          	add	a4,a0,a2
 356:	95b2                	add	a1,a1,a2
 358:	fec05ae3          	blez	a2,34c <memmove+0x28>
 35c:	fff6079b          	addiw	a5,a2,-1
 360:	1782                	slli	a5,a5,0x20
 362:	9381                	srli	a5,a5,0x20
 364:	fff7c793          	not	a5,a5
 368:	97ba                	add	a5,a5,a4
 36a:	15fd                	addi	a1,a1,-1
 36c:	177d                	addi	a4,a4,-1
 36e:	0005c683          	lbu	a3,0(a1)
 372:	00d70023          	sb	a3,0(a4)
 376:	fee79ae3          	bne	a5,a4,36a <memmove+0x46>
 37a:	bfc9                	j	34c <memmove+0x28>

000000000000037c <memcmp>:
 37c:	1141                	addi	sp,sp,-16
 37e:	e422                	sd	s0,8(sp)
 380:	0800                	addi	s0,sp,16
 382:	ca05                	beqz	a2,3b2 <memcmp+0x36>
 384:	fff6069b          	addiw	a3,a2,-1
 388:	1682                	slli	a3,a3,0x20
 38a:	9281                	srli	a3,a3,0x20
 38c:	0685                	addi	a3,a3,1
 38e:	96aa                	add	a3,a3,a0
 390:	00054783          	lbu	a5,0(a0)
 394:	0005c703          	lbu	a4,0(a1)
 398:	00e79863          	bne	a5,a4,3a8 <memcmp+0x2c>
 39c:	0505                	addi	a0,a0,1
 39e:	0585                	addi	a1,a1,1
 3a0:	fed518e3          	bne	a0,a3,390 <memcmp+0x14>
 3a4:	4501                	li	a0,0
 3a6:	a019                	j	3ac <memcmp+0x30>
 3a8:	40e7853b          	subw	a0,a5,a4
 3ac:	6422                	ld	s0,8(sp)
 3ae:	0141                	addi	sp,sp,16
 3b0:	8082                	ret
 3b2:	4501                	li	a0,0
 3b4:	bfe5                	j	3ac <memcmp+0x30>

00000000000003b6 <memcpy>:
 3b6:	1141                	addi	sp,sp,-16
 3b8:	e406                	sd	ra,8(sp)
 3ba:	e022                	sd	s0,0(sp)
 3bc:	0800                	addi	s0,sp,16
 3be:	00000097          	auipc	ra,0x0
 3c2:	f66080e7          	jalr	-154(ra) # 324 <memmove>
 3c6:	60a2                	ld	ra,8(sp)
 3c8:	6402                	ld	s0,0(sp)
 3ca:	0141                	addi	sp,sp,16
 3cc:	8082                	ret

00000000000003ce <fork>:
 3ce:	4885                	li	a7,1
 3d0:	00000073          	ecall
 3d4:	8082                	ret

00000000000003d6 <exit>:
 3d6:	4889                	li	a7,2
 3d8:	00000073          	ecall
 3dc:	8082                	ret

00000000000003de <wait>:
 3de:	488d                	li	a7,3
 3e0:	00000073          	ecall
 3e4:	8082                	ret

00000000000003e6 <pipe>:
 3e6:	4891                	li	a7,4
 3e8:	00000073          	ecall
 3ec:	8082                	ret

00000000000003ee <read>:
 3ee:	4895                	li	a7,5
 3f0:	00000073          	ecall
 3f4:	8082                	ret

00000000000003f6 <write>:
 3f6:	48c1                	li	a7,16
 3f8:	00000073          	ecall
 3fc:	8082                	ret

00000000000003fe <close>:
 3fe:	48d5                	li	a7,21
 400:	00000073          	ecall
 404:	8082                	ret

0000000000000406 <kill>:
 406:	4899                	li	a7,6
 408:	00000073          	ecall
 40c:	8082                	ret

000000000000040e <exec>:
 40e:	489d                	li	a7,7
 410:	00000073          	ecall
 414:	8082                	ret

0000000000000416 <open>:
 416:	48bd                	li	a7,15
 418:	00000073          	ecall
 41c:	8082                	ret

000000000000041e <fstat>:
 41e:	48a1                	li	a7,8
 420:	00000073          	ecall
 424:	8082                	ret

0000000000000426 <mkdir>:
 426:	48d1                	li	a7,20
 428:	00000073          	ecall
 42c:	8082                	ret

000000000000042e <chdir>:
 42e:	48a5                	li	a7,9
 430:	00000073          	ecall
 434:	8082                	ret

0000000000000436 <dup>:
 436:	48a9                	li	a7,10
 438:	00000073          	ecall
 43c:	8082                	ret

000000000000043e <getpid>:
 43e:	48ad                	li	a7,11
 440:	00000073          	ecall
 444:	8082                	ret

0000000000000446 <sbrk>:
 446:	48b1                	li	a7,12
 448:	00000073          	ecall
 44c:	8082                	ret

000000000000044e <sleep>:
 44e:	48b5                	li	a7,13
 450:	00000073          	ecall
 454:	8082                	ret

0000000000000456 <uptime>:
 456:	48b9                	li	a7,14
 458:	00000073          	ecall
 45c:	8082                	ret

000000000000045e <test_proc>:
 45e:	48d9                	li	a7,22
 460:	00000073          	ecall
 464:	8082                	ret

0000000000000466 <dev>:
 466:	48dd                	li	a7,23
 468:	00000073          	ecall
 46c:	8082                	ret

000000000000046e <readdir>:
 46e:	48e1                	li	a7,24
 470:	00000073          	ecall
 474:	8082                	ret

0000000000000476 <getcwd>:
 476:	48e5                	li	a7,25
 478:	00000073          	ecall
 47c:	8082                	ret

000000000000047e <remove>:
 47e:	48c5                	li	a7,17
 480:	00000073          	ecall
 484:	8082                	ret

0000000000000486 <trace>:
 486:	48c9                	li	a7,18
 488:	00000073          	ecall
 48c:	8082                	ret

000000000000048e <sysinfo>:
 48e:	48cd                	li	a7,19
 490:	00000073          	ecall
 494:	8082                	ret

0000000000000496 <rename>:
 496:	48e9                	li	a7,26
 498:	00000073          	ecall
 49c:	8082                	ret

000000000000049e <putc>:
 49e:	1101                	addi	sp,sp,-32
 4a0:	ec06                	sd	ra,24(sp)
 4a2:	e822                	sd	s0,16(sp)
 4a4:	1000                	addi	s0,sp,32
 4a6:	feb407a3          	sb	a1,-17(s0)
 4aa:	4605                	li	a2,1
 4ac:	fef40593          	addi	a1,s0,-17
 4b0:	00000097          	auipc	ra,0x0
 4b4:	f46080e7          	jalr	-186(ra) # 3f6 <write>
 4b8:	60e2                	ld	ra,24(sp)
 4ba:	6442                	ld	s0,16(sp)
 4bc:	6105                	addi	sp,sp,32
 4be:	8082                	ret

00000000000004c0 <printint>:
 4c0:	7139                	addi	sp,sp,-64
 4c2:	fc06                	sd	ra,56(sp)
 4c4:	f822                	sd	s0,48(sp)
 4c6:	f426                	sd	s1,40(sp)
 4c8:	f04a                	sd	s2,32(sp)
 4ca:	ec4e                	sd	s3,24(sp)
 4cc:	0080                	addi	s0,sp,64
 4ce:	84aa                	mv	s1,a0
 4d0:	c299                	beqz	a3,4d6 <printint+0x16>
 4d2:	0805c863          	bltz	a1,562 <printint+0xa2>
 4d6:	2581                	sext.w	a1,a1
 4d8:	4881                	li	a7,0
 4da:	fc040993          	addi	s3,s0,-64
 4de:	86ce                	mv	a3,s3
 4e0:	4701                	li	a4,0
 4e2:	2601                	sext.w	a2,a2
 4e4:	00000517          	auipc	a0,0x0
 4e8:	4cc50513          	addi	a0,a0,1228 # 9b0 <digits>
 4ec:	883a                	mv	a6,a4
 4ee:	2705                	addiw	a4,a4,1
 4f0:	02c5f7bb          	remuw	a5,a1,a2
 4f4:	1782                	slli	a5,a5,0x20
 4f6:	9381                	srli	a5,a5,0x20
 4f8:	97aa                	add	a5,a5,a0
 4fa:	0007c783          	lbu	a5,0(a5)
 4fe:	00f68023          	sb	a5,0(a3)
 502:	0005879b          	sext.w	a5,a1
 506:	02c5d5bb          	divuw	a1,a1,a2
 50a:	0685                	addi	a3,a3,1
 50c:	fec7f0e3          	bgeu	a5,a2,4ec <printint+0x2c>
 510:	00088c63          	beqz	a7,528 <printint+0x68>
 514:	fd070793          	addi	a5,a4,-48
 518:	00878733          	add	a4,a5,s0
 51c:	02d00793          	li	a5,45
 520:	fef70823          	sb	a5,-16(a4)
 524:	0028071b          	addiw	a4,a6,2
 528:	02e05663          	blez	a4,554 <printint+0x94>
 52c:	fc040913          	addi	s2,s0,-64
 530:	993a                	add	s2,s2,a4
 532:	19fd                	addi	s3,s3,-1
 534:	99ba                	add	s3,s3,a4
 536:	377d                	addiw	a4,a4,-1
 538:	1702                	slli	a4,a4,0x20
 53a:	9301                	srli	a4,a4,0x20
 53c:	40e989b3          	sub	s3,s3,a4
 540:	fff94583          	lbu	a1,-1(s2)
 544:	8526                	mv	a0,s1
 546:	00000097          	auipc	ra,0x0
 54a:	f58080e7          	jalr	-168(ra) # 49e <putc>
 54e:	197d                	addi	s2,s2,-1
 550:	ff3918e3          	bne	s2,s3,540 <printint+0x80>
 554:	70e2                	ld	ra,56(sp)
 556:	7442                	ld	s0,48(sp)
 558:	74a2                	ld	s1,40(sp)
 55a:	7902                	ld	s2,32(sp)
 55c:	69e2                	ld	s3,24(sp)
 55e:	6121                	addi	sp,sp,64
 560:	8082                	ret
 562:	40b005bb          	negw	a1,a1
 566:	4885                	li	a7,1
 568:	bf8d                	j	4da <printint+0x1a>

000000000000056a <vprintf>:
 56a:	715d                	addi	sp,sp,-80
 56c:	e486                	sd	ra,72(sp)
 56e:	e0a2                	sd	s0,64(sp)
 570:	fc26                	sd	s1,56(sp)
 572:	f84a                	sd	s2,48(sp)
 574:	f44e                	sd	s3,40(sp)
 576:	f052                	sd	s4,32(sp)
 578:	ec56                	sd	s5,24(sp)
 57a:	e85a                	sd	s6,16(sp)
 57c:	e45e                	sd	s7,8(sp)
 57e:	e062                	sd	s8,0(sp)
 580:	0880                	addi	s0,sp,80
 582:	0005c903          	lbu	s2,0(a1)
 586:	18090c63          	beqz	s2,71e <vprintf+0x1b4>
 58a:	8aaa                	mv	s5,a0
 58c:	8bb2                	mv	s7,a2
 58e:	00158493          	addi	s1,a1,1
 592:	4981                	li	s3,0
 594:	02500a13          	li	s4,37
 598:	4b55                	li	s6,21
 59a:	a839                	j	5b8 <vprintf+0x4e>
 59c:	85ca                	mv	a1,s2
 59e:	8556                	mv	a0,s5
 5a0:	00000097          	auipc	ra,0x0
 5a4:	efe080e7          	jalr	-258(ra) # 49e <putc>
 5a8:	a019                	j	5ae <vprintf+0x44>
 5aa:	01498d63          	beq	s3,s4,5c4 <vprintf+0x5a>
 5ae:	0485                	addi	s1,s1,1
 5b0:	fff4c903          	lbu	s2,-1(s1)
 5b4:	16090563          	beqz	s2,71e <vprintf+0x1b4>
 5b8:	fe0999e3          	bnez	s3,5aa <vprintf+0x40>
 5bc:	ff4910e3          	bne	s2,s4,59c <vprintf+0x32>
 5c0:	89d2                	mv	s3,s4
 5c2:	b7f5                	j	5ae <vprintf+0x44>
 5c4:	13490263          	beq	s2,s4,6e8 <vprintf+0x17e>
 5c8:	f9d9079b          	addiw	a5,s2,-99
 5cc:	0ff7f793          	zext.b	a5,a5
 5d0:	12fb6563          	bltu	s6,a5,6fa <vprintf+0x190>
 5d4:	f9d9079b          	addiw	a5,s2,-99
 5d8:	0ff7f713          	zext.b	a4,a5
 5dc:	10eb6f63          	bltu	s6,a4,6fa <vprintf+0x190>
 5e0:	00271793          	slli	a5,a4,0x2
 5e4:	00000717          	auipc	a4,0x0
 5e8:	37470713          	addi	a4,a4,884 # 958 <malloc+0x13c>
 5ec:	97ba                	add	a5,a5,a4
 5ee:	439c                	lw	a5,0(a5)
 5f0:	97ba                	add	a5,a5,a4
 5f2:	8782                	jr	a5
 5f4:	008b8913          	addi	s2,s7,8
 5f8:	4685                	li	a3,1
 5fa:	4629                	li	a2,10
 5fc:	000ba583          	lw	a1,0(s7)
 600:	8556                	mv	a0,s5
 602:	00000097          	auipc	ra,0x0
 606:	ebe080e7          	jalr	-322(ra) # 4c0 <printint>
 60a:	8bca                	mv	s7,s2
 60c:	4981                	li	s3,0
 60e:	b745                	j	5ae <vprintf+0x44>
 610:	008b8913          	addi	s2,s7,8
 614:	4681                	li	a3,0
 616:	4629                	li	a2,10
 618:	000ba583          	lw	a1,0(s7)
 61c:	8556                	mv	a0,s5
 61e:	00000097          	auipc	ra,0x0
 622:	ea2080e7          	jalr	-350(ra) # 4c0 <printint>
 626:	8bca                	mv	s7,s2
 628:	4981                	li	s3,0
 62a:	b751                	j	5ae <vprintf+0x44>
 62c:	008b8913          	addi	s2,s7,8
 630:	4681                	li	a3,0
 632:	4641                	li	a2,16
 634:	000ba583          	lw	a1,0(s7)
 638:	8556                	mv	a0,s5
 63a:	00000097          	auipc	ra,0x0
 63e:	e86080e7          	jalr	-378(ra) # 4c0 <printint>
 642:	8bca                	mv	s7,s2
 644:	4981                	li	s3,0
 646:	b7a5                	j	5ae <vprintf+0x44>
 648:	008b8c13          	addi	s8,s7,8
 64c:	000bb983          	ld	s3,0(s7)
 650:	03000593          	li	a1,48
 654:	8556                	mv	a0,s5
 656:	00000097          	auipc	ra,0x0
 65a:	e48080e7          	jalr	-440(ra) # 49e <putc>
 65e:	07800593          	li	a1,120
 662:	8556                	mv	a0,s5
 664:	00000097          	auipc	ra,0x0
 668:	e3a080e7          	jalr	-454(ra) # 49e <putc>
 66c:	4941                	li	s2,16
 66e:	00000b97          	auipc	s7,0x0
 672:	342b8b93          	addi	s7,s7,834 # 9b0 <digits>
 676:	03c9d793          	srli	a5,s3,0x3c
 67a:	97de                	add	a5,a5,s7
 67c:	0007c583          	lbu	a1,0(a5)
 680:	8556                	mv	a0,s5
 682:	00000097          	auipc	ra,0x0
 686:	e1c080e7          	jalr	-484(ra) # 49e <putc>
 68a:	0992                	slli	s3,s3,0x4
 68c:	397d                	addiw	s2,s2,-1
 68e:	fe0914e3          	bnez	s2,676 <vprintf+0x10c>
 692:	8be2                	mv	s7,s8
 694:	4981                	li	s3,0
 696:	bf21                	j	5ae <vprintf+0x44>
 698:	008b8993          	addi	s3,s7,8
 69c:	000bb903          	ld	s2,0(s7)
 6a0:	02090163          	beqz	s2,6c2 <vprintf+0x158>
 6a4:	00094583          	lbu	a1,0(s2)
 6a8:	c9a5                	beqz	a1,718 <vprintf+0x1ae>
 6aa:	8556                	mv	a0,s5
 6ac:	00000097          	auipc	ra,0x0
 6b0:	df2080e7          	jalr	-526(ra) # 49e <putc>
 6b4:	0905                	addi	s2,s2,1
 6b6:	00094583          	lbu	a1,0(s2)
 6ba:	f9e5                	bnez	a1,6aa <vprintf+0x140>
 6bc:	8bce                	mv	s7,s3
 6be:	4981                	li	s3,0
 6c0:	b5fd                	j	5ae <vprintf+0x44>
 6c2:	00000917          	auipc	s2,0x0
 6c6:	28e90913          	addi	s2,s2,654 # 950 <malloc+0x134>
 6ca:	02800593          	li	a1,40
 6ce:	bff1                	j	6aa <vprintf+0x140>
 6d0:	008b8913          	addi	s2,s7,8
 6d4:	000bc583          	lbu	a1,0(s7)
 6d8:	8556                	mv	a0,s5
 6da:	00000097          	auipc	ra,0x0
 6de:	dc4080e7          	jalr	-572(ra) # 49e <putc>
 6e2:	8bca                	mv	s7,s2
 6e4:	4981                	li	s3,0
 6e6:	b5e1                	j	5ae <vprintf+0x44>
 6e8:	02500593          	li	a1,37
 6ec:	8556                	mv	a0,s5
 6ee:	00000097          	auipc	ra,0x0
 6f2:	db0080e7          	jalr	-592(ra) # 49e <putc>
 6f6:	4981                	li	s3,0
 6f8:	bd5d                	j	5ae <vprintf+0x44>
 6fa:	02500593          	li	a1,37
 6fe:	8556                	mv	a0,s5
 700:	00000097          	auipc	ra,0x0
 704:	d9e080e7          	jalr	-610(ra) # 49e <putc>
 708:	85ca                	mv	a1,s2
 70a:	8556                	mv	a0,s5
 70c:	00000097          	auipc	ra,0x0
 710:	d92080e7          	jalr	-622(ra) # 49e <putc>
 714:	4981                	li	s3,0
 716:	bd61                	j	5ae <vprintf+0x44>
 718:	8bce                	mv	s7,s3
 71a:	4981                	li	s3,0
 71c:	bd49                	j	5ae <vprintf+0x44>
 71e:	60a6                	ld	ra,72(sp)
 720:	6406                	ld	s0,64(sp)
 722:	74e2                	ld	s1,56(sp)
 724:	7942                	ld	s2,48(sp)
 726:	79a2                	ld	s3,40(sp)
 728:	7a02                	ld	s4,32(sp)
 72a:	6ae2                	ld	s5,24(sp)
 72c:	6b42                	ld	s6,16(sp)
 72e:	6ba2                	ld	s7,8(sp)
 730:	6c02                	ld	s8,0(sp)
 732:	6161                	addi	sp,sp,80
 734:	8082                	ret

0000000000000736 <fprintf>:
 736:	715d                	addi	sp,sp,-80
 738:	ec06                	sd	ra,24(sp)
 73a:	e822                	sd	s0,16(sp)
 73c:	1000                	addi	s0,sp,32
 73e:	e010                	sd	a2,0(s0)
 740:	e414                	sd	a3,8(s0)
 742:	e818                	sd	a4,16(s0)
 744:	ec1c                	sd	a5,24(s0)
 746:	03043023          	sd	a6,32(s0)
 74a:	03143423          	sd	a7,40(s0)
 74e:	8622                	mv	a2,s0
 750:	fe843423          	sd	s0,-24(s0)
 754:	00000097          	auipc	ra,0x0
 758:	e16080e7          	jalr	-490(ra) # 56a <vprintf>
 75c:	60e2                	ld	ra,24(sp)
 75e:	6442                	ld	s0,16(sp)
 760:	6161                	addi	sp,sp,80
 762:	8082                	ret

0000000000000764 <printf>:
 764:	711d                	addi	sp,sp,-96
 766:	ec06                	sd	ra,24(sp)
 768:	e822                	sd	s0,16(sp)
 76a:	1000                	addi	s0,sp,32
 76c:	e40c                	sd	a1,8(s0)
 76e:	e810                	sd	a2,16(s0)
 770:	ec14                	sd	a3,24(s0)
 772:	f018                	sd	a4,32(s0)
 774:	f41c                	sd	a5,40(s0)
 776:	03043823          	sd	a6,48(s0)
 77a:	03143c23          	sd	a7,56(s0)
 77e:	00840613          	addi	a2,s0,8
 782:	fec43423          	sd	a2,-24(s0)
 786:	85aa                	mv	a1,a0
 788:	4505                	li	a0,1
 78a:	00000097          	auipc	ra,0x0
 78e:	de0080e7          	jalr	-544(ra) # 56a <vprintf>
 792:	60e2                	ld	ra,24(sp)
 794:	6442                	ld	s0,16(sp)
 796:	6125                	addi	sp,sp,96
 798:	8082                	ret

000000000000079a <free>:
 79a:	1141                	addi	sp,sp,-16
 79c:	e422                	sd	s0,8(sp)
 79e:	0800                	addi	s0,sp,16
 7a0:	ff050693          	addi	a3,a0,-16
 7a4:	00000797          	auipc	a5,0x0
 7a8:	4247b783          	ld	a5,1060(a5) # bc8 <freep>
 7ac:	a02d                	j	7d6 <free+0x3c>
 7ae:	4618                	lw	a4,8(a2)
 7b0:	9f2d                	addw	a4,a4,a1
 7b2:	fee52c23          	sw	a4,-8(a0)
 7b6:	6398                	ld	a4,0(a5)
 7b8:	6310                	ld	a2,0(a4)
 7ba:	a83d                	j	7f8 <free+0x5e>
 7bc:	ff852703          	lw	a4,-8(a0)
 7c0:	9f31                	addw	a4,a4,a2
 7c2:	c798                	sw	a4,8(a5)
 7c4:	ff053683          	ld	a3,-16(a0)
 7c8:	a091                	j	80c <free+0x72>
 7ca:	6398                	ld	a4,0(a5)
 7cc:	00e7e463          	bltu	a5,a4,7d4 <free+0x3a>
 7d0:	00e6ea63          	bltu	a3,a4,7e4 <free+0x4a>
 7d4:	87ba                	mv	a5,a4
 7d6:	fed7fae3          	bgeu	a5,a3,7ca <free+0x30>
 7da:	6398                	ld	a4,0(a5)
 7dc:	00e6e463          	bltu	a3,a4,7e4 <free+0x4a>
 7e0:	fee7eae3          	bltu	a5,a4,7d4 <free+0x3a>
 7e4:	ff852583          	lw	a1,-8(a0)
 7e8:	6390                	ld	a2,0(a5)
 7ea:	02059813          	slli	a6,a1,0x20
 7ee:	01c85713          	srli	a4,a6,0x1c
 7f2:	9736                	add	a4,a4,a3
 7f4:	fae60de3          	beq	a2,a4,7ae <free+0x14>
 7f8:	fec53823          	sd	a2,-16(a0)
 7fc:	4790                	lw	a2,8(a5)
 7fe:	02061593          	slli	a1,a2,0x20
 802:	01c5d713          	srli	a4,a1,0x1c
 806:	973e                	add	a4,a4,a5
 808:	fae68ae3          	beq	a3,a4,7bc <free+0x22>
 80c:	e394                	sd	a3,0(a5)
 80e:	00000717          	auipc	a4,0x0
 812:	3af73d23          	sd	a5,954(a4) # bc8 <freep>
 816:	6422                	ld	s0,8(sp)
 818:	0141                	addi	sp,sp,16
 81a:	8082                	ret

000000000000081c <malloc>:
 81c:	7139                	addi	sp,sp,-64
 81e:	fc06                	sd	ra,56(sp)
 820:	f822                	sd	s0,48(sp)
 822:	f426                	sd	s1,40(sp)
 824:	f04a                	sd	s2,32(sp)
 826:	ec4e                	sd	s3,24(sp)
 828:	e852                	sd	s4,16(sp)
 82a:	e456                	sd	s5,8(sp)
 82c:	e05a                	sd	s6,0(sp)
 82e:	0080                	addi	s0,sp,64
 830:	02051493          	slli	s1,a0,0x20
 834:	9081                	srli	s1,s1,0x20
 836:	04bd                	addi	s1,s1,15
 838:	8091                	srli	s1,s1,0x4
 83a:	0014899b          	addiw	s3,s1,1
 83e:	0485                	addi	s1,s1,1
 840:	00000517          	auipc	a0,0x0
 844:	38853503          	ld	a0,904(a0) # bc8 <freep>
 848:	c515                	beqz	a0,874 <malloc+0x58>
 84a:	611c                	ld	a5,0(a0)
 84c:	4798                	lw	a4,8(a5)
 84e:	04977063          	bgeu	a4,s1,88e <malloc+0x72>
 852:	8a4e                	mv	s4,s3
 854:	0009871b          	sext.w	a4,s3
 858:	6685                	lui	a3,0x1
 85a:	00d77363          	bgeu	a4,a3,860 <malloc+0x44>
 85e:	6a05                	lui	s4,0x1
 860:	000a0b1b          	sext.w	s6,s4
 864:	004a1a1b          	slliw	s4,s4,0x4
 868:	00000917          	auipc	s2,0x0
 86c:	36090913          	addi	s2,s2,864 # bc8 <freep>
 870:	5afd                	li	s5,-1
 872:	a89d                	j	8e8 <malloc+0xcc>
 874:	00000717          	auipc	a4,0x0
 878:	35470713          	addi	a4,a4,852 # bc8 <freep>
 87c:	00000797          	auipc	a5,0x0
 880:	35478793          	addi	a5,a5,852 # bd0 <base>
 884:	e31c                	sd	a5,0(a4)
 886:	e71c                	sd	a5,8(a4)
 888:	00072823          	sw	zero,16(a4)
 88c:	b7d9                	j	852 <malloc+0x36>
 88e:	02e48c63          	beq	s1,a4,8c6 <malloc+0xaa>
 892:	4137073b          	subw	a4,a4,s3
 896:	c798                	sw	a4,8(a5)
 898:	02071693          	slli	a3,a4,0x20
 89c:	01c6d713          	srli	a4,a3,0x1c
 8a0:	97ba                	add	a5,a5,a4
 8a2:	0137a423          	sw	s3,8(a5)
 8a6:	00000717          	auipc	a4,0x0
 8aa:	32a73123          	sd	a0,802(a4) # bc8 <freep>
 8ae:	01078513          	addi	a0,a5,16
 8b2:	70e2                	ld	ra,56(sp)
 8b4:	7442                	ld	s0,48(sp)
 8b6:	74a2                	ld	s1,40(sp)
 8b8:	7902                	ld	s2,32(sp)
 8ba:	69e2                	ld	s3,24(sp)
 8bc:	6a42                	ld	s4,16(sp)
 8be:	6aa2                	ld	s5,8(sp)
 8c0:	6b02                	ld	s6,0(sp)
 8c2:	6121                	addi	sp,sp,64
 8c4:	8082                	ret
 8c6:	6398                	ld	a4,0(a5)
 8c8:	e118                	sd	a4,0(a0)
 8ca:	bff1                	j	8a6 <malloc+0x8a>
 8cc:	01652423          	sw	s6,8(a0)
 8d0:	0541                	addi	a0,a0,16
 8d2:	00000097          	auipc	ra,0x0
 8d6:	ec8080e7          	jalr	-312(ra) # 79a <free>
 8da:	00093503          	ld	a0,0(s2)
 8de:	d971                	beqz	a0,8b2 <malloc+0x96>
 8e0:	611c                	ld	a5,0(a0)
 8e2:	4798                	lw	a4,8(a5)
 8e4:	fa9775e3          	bgeu	a4,s1,88e <malloc+0x72>
 8e8:	00093703          	ld	a4,0(s2)
 8ec:	853e                	mv	a0,a5
 8ee:	fef719e3          	bne	a4,a5,8e0 <malloc+0xc4>
 8f2:	8552                	mv	a0,s4
 8f4:	00000097          	auipc	ra,0x0
 8f8:	b52080e7          	jalr	-1198(ra) # 446 <sbrk>
 8fc:	fd5518e3          	bne	a0,s5,8cc <malloc+0xb0>
 900:	4501                	li	a0,0
 902:	bf45                	j	8b2 <malloc+0x96>
