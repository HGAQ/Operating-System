
xv6-user/_strace:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/include/stat.h"
#include "xv6-user/user.h"

int
main(int argc, char *argv[])
{
   0:	712d                	addi	sp,sp,-288
   2:	ee06                	sd	ra,280(sp)
   4:	ea22                	sd	s0,272(sp)
   6:	e626                	sd	s1,264(sp)
   8:	e24a                	sd	s2,256(sp)
   a:	1200                	addi	s0,sp,288
   c:	892e                	mv	s2,a1
  int i;
  char *nargv[MAXARG];

  if(argc < 3 /*|| (argv[1][0] < '0' || argv[1][0] > '9')*/){
   e:	4789                	li	a5,2
  10:	02a7c163          	blt	a5,a0,32 <main+0x32>
    fprintf(2, "usage: %s MASK COMMAND\n", argv[0]);
  14:	6190                	ld	a2,0(a1)
  16:	00001597          	auipc	a1,0x1
  1a:	89258593          	addi	a1,a1,-1902 # 8a8 <malloc+0xe8>
  1e:	4509                	li	a0,2
  20:	00000097          	auipc	ra,0x0
  24:	6ba080e7          	jalr	1722(ra) # 6da <fprintf>
    exit(1);
  28:	4505                	li	a0,1
  2a:	00000097          	auipc	ra,0x0
  2e:	350080e7          	jalr	848(ra) # 37a <exit>
  32:	84aa                	mv	s1,a0
  }

  if (trace(atoi(argv[1])) < 0) {
  34:	6588                	ld	a0,8(a1)
  36:	00000097          	auipc	ra,0x0
  3a:	232080e7          	jalr	562(ra) # 268 <atoi>
  3e:	00000097          	auipc	ra,0x0
  42:	3ec080e7          	jalr	1004(ra) # 42a <trace>
  46:	04054e63          	bltz	a0,a2 <main+0xa2>
  4a:	01090793          	addi	a5,s2,16
  4e:	ee040713          	addi	a4,s0,-288
  52:	ffd4869b          	addiw	a3,s1,-3
  56:	02069613          	slli	a2,a3,0x20
  5a:	01d65693          	srli	a3,a2,0x1d
  5e:	96be                	add	a3,a3,a5
  60:	10090593          	addi	a1,s2,256
    fprintf(2, "%s: strace failed\n", argv[0]);
    exit(1);
  }
  
  for(i = 2; i < argc && i < MAXARG; i++){
    nargv[i-2] = argv[i];
  64:	6390                	ld	a2,0(a5)
  66:	e310                	sd	a2,0(a4)
  for(i = 2; i < argc && i < MAXARG; i++){
  68:	00d78663          	beq	a5,a3,74 <main+0x74>
  6c:	07a1                	addi	a5,a5,8
  6e:	0721                	addi	a4,a4,8
  70:	feb79ae3          	bne	a5,a1,64 <main+0x64>
  }
  exec(nargv[0], nargv);  
  74:	ee040593          	addi	a1,s0,-288
  78:	ee043503          	ld	a0,-288(s0)
  7c:	00000097          	auipc	ra,0x0
  80:	336080e7          	jalr	822(ra) # 3b2 <exec>
  printf("strace: exec %s fail\n", nargv[0]);
  84:	ee043583          	ld	a1,-288(s0)
  88:	00001517          	auipc	a0,0x1
  8c:	85050513          	addi	a0,a0,-1968 # 8d8 <malloc+0x118>
  90:	00000097          	auipc	ra,0x0
  94:	678080e7          	jalr	1656(ra) # 708 <printf>
  exit(0);
  98:	4501                	li	a0,0
  9a:	00000097          	auipc	ra,0x0
  9e:	2e0080e7          	jalr	736(ra) # 37a <exit>
    fprintf(2, "%s: strace failed\n", argv[0]);
  a2:	00093603          	ld	a2,0(s2)
  a6:	00001597          	auipc	a1,0x1
  aa:	81a58593          	addi	a1,a1,-2022 # 8c0 <malloc+0x100>
  ae:	4509                	li	a0,2
  b0:	00000097          	auipc	ra,0x0
  b4:	62a080e7          	jalr	1578(ra) # 6da <fprintf>
    exit(1);
  b8:	4505                	li	a0,1
  ba:	00000097          	auipc	ra,0x0
  be:	2c0080e7          	jalr	704(ra) # 37a <exit>

00000000000000c2 <strcpy>:
  c2:	1141                	addi	sp,sp,-16
  c4:	e422                	sd	s0,8(sp)
  c6:	0800                	addi	s0,sp,16
  c8:	87aa                	mv	a5,a0
  ca:	0585                	addi	a1,a1,1
  cc:	0785                	addi	a5,a5,1
  ce:	fff5c703          	lbu	a4,-1(a1)
  d2:	fee78fa3          	sb	a4,-1(a5)
  d6:	fb75                	bnez	a4,ca <strcpy+0x8>
  d8:	6422                	ld	s0,8(sp)
  da:	0141                	addi	sp,sp,16
  dc:	8082                	ret

00000000000000de <strcat>:
  de:	1141                	addi	sp,sp,-16
  e0:	e422                	sd	s0,8(sp)
  e2:	0800                	addi	s0,sp,16
  e4:	00054783          	lbu	a5,0(a0)
  e8:	c385                	beqz	a5,108 <strcat+0x2a>
  ea:	87aa                	mv	a5,a0
  ec:	0785                	addi	a5,a5,1
  ee:	0007c703          	lbu	a4,0(a5)
  f2:	ff6d                	bnez	a4,ec <strcat+0xe>
  f4:	0585                	addi	a1,a1,1
  f6:	0785                	addi	a5,a5,1
  f8:	fff5c703          	lbu	a4,-1(a1)
  fc:	fee78fa3          	sb	a4,-1(a5)
 100:	fb75                	bnez	a4,f4 <strcat+0x16>
 102:	6422                	ld	s0,8(sp)
 104:	0141                	addi	sp,sp,16
 106:	8082                	ret
 108:	87aa                	mv	a5,a0
 10a:	b7ed                	j	f4 <strcat+0x16>

000000000000010c <strcmp>:
 10c:	1141                	addi	sp,sp,-16
 10e:	e422                	sd	s0,8(sp)
 110:	0800                	addi	s0,sp,16
 112:	00054783          	lbu	a5,0(a0)
 116:	cb91                	beqz	a5,12a <strcmp+0x1e>
 118:	0005c703          	lbu	a4,0(a1)
 11c:	00f71763          	bne	a4,a5,12a <strcmp+0x1e>
 120:	0505                	addi	a0,a0,1
 122:	0585                	addi	a1,a1,1
 124:	00054783          	lbu	a5,0(a0)
 128:	fbe5                	bnez	a5,118 <strcmp+0xc>
 12a:	0005c503          	lbu	a0,0(a1)
 12e:	40a7853b          	subw	a0,a5,a0
 132:	6422                	ld	s0,8(sp)
 134:	0141                	addi	sp,sp,16
 136:	8082                	ret

0000000000000138 <strlen>:
 138:	1141                	addi	sp,sp,-16
 13a:	e422                	sd	s0,8(sp)
 13c:	0800                	addi	s0,sp,16
 13e:	00054783          	lbu	a5,0(a0)
 142:	cf91                	beqz	a5,15e <strlen+0x26>
 144:	0505                	addi	a0,a0,1
 146:	87aa                	mv	a5,a0
 148:	86be                	mv	a3,a5
 14a:	0785                	addi	a5,a5,1
 14c:	fff7c703          	lbu	a4,-1(a5)
 150:	ff65                	bnez	a4,148 <strlen+0x10>
 152:	40a6853b          	subw	a0,a3,a0
 156:	2505                	addiw	a0,a0,1
 158:	6422                	ld	s0,8(sp)
 15a:	0141                	addi	sp,sp,16
 15c:	8082                	ret
 15e:	4501                	li	a0,0
 160:	bfe5                	j	158 <strlen+0x20>

0000000000000162 <memset>:
 162:	1141                	addi	sp,sp,-16
 164:	e422                	sd	s0,8(sp)
 166:	0800                	addi	s0,sp,16
 168:	ca19                	beqz	a2,17e <memset+0x1c>
 16a:	87aa                	mv	a5,a0
 16c:	1602                	slli	a2,a2,0x20
 16e:	9201                	srli	a2,a2,0x20
 170:	00a60733          	add	a4,a2,a0
 174:	00b78023          	sb	a1,0(a5)
 178:	0785                	addi	a5,a5,1
 17a:	fee79de3          	bne	a5,a4,174 <memset+0x12>
 17e:	6422                	ld	s0,8(sp)
 180:	0141                	addi	sp,sp,16
 182:	8082                	ret

0000000000000184 <strchr>:
 184:	1141                	addi	sp,sp,-16
 186:	e422                	sd	s0,8(sp)
 188:	0800                	addi	s0,sp,16
 18a:	00054783          	lbu	a5,0(a0)
 18e:	cb99                	beqz	a5,1a4 <strchr+0x20>
 190:	00f58763          	beq	a1,a5,19e <strchr+0x1a>
 194:	0505                	addi	a0,a0,1
 196:	00054783          	lbu	a5,0(a0)
 19a:	fbfd                	bnez	a5,190 <strchr+0xc>
 19c:	4501                	li	a0,0
 19e:	6422                	ld	s0,8(sp)
 1a0:	0141                	addi	sp,sp,16
 1a2:	8082                	ret
 1a4:	4501                	li	a0,0
 1a6:	bfe5                	j	19e <strchr+0x1a>

00000000000001a8 <gets>:
 1a8:	711d                	addi	sp,sp,-96
 1aa:	ec86                	sd	ra,88(sp)
 1ac:	e8a2                	sd	s0,80(sp)
 1ae:	e4a6                	sd	s1,72(sp)
 1b0:	e0ca                	sd	s2,64(sp)
 1b2:	fc4e                	sd	s3,56(sp)
 1b4:	f852                	sd	s4,48(sp)
 1b6:	f456                	sd	s5,40(sp)
 1b8:	f05a                	sd	s6,32(sp)
 1ba:	ec5e                	sd	s7,24(sp)
 1bc:	e862                	sd	s8,16(sp)
 1be:	1080                	addi	s0,sp,96
 1c0:	8baa                	mv	s7,a0
 1c2:	8a2e                	mv	s4,a1
 1c4:	892a                	mv	s2,a0
 1c6:	4481                	li	s1,0
 1c8:	faf40a93          	addi	s5,s0,-81
 1cc:	4b29                	li	s6,10
 1ce:	4c35                	li	s8,13
 1d0:	89a6                	mv	s3,s1
 1d2:	2485                	addiw	s1,s1,1
 1d4:	0344d763          	bge	s1,s4,202 <gets+0x5a>
 1d8:	4605                	li	a2,1
 1da:	85d6                	mv	a1,s5
 1dc:	4501                	li	a0,0
 1de:	00000097          	auipc	ra,0x0
 1e2:	1b4080e7          	jalr	436(ra) # 392 <read>
 1e6:	00a05e63          	blez	a0,202 <gets+0x5a>
 1ea:	faf44783          	lbu	a5,-81(s0)
 1ee:	00f90023          	sb	a5,0(s2)
 1f2:	01678763          	beq	a5,s6,200 <gets+0x58>
 1f6:	0905                	addi	s2,s2,1
 1f8:	fd879ce3          	bne	a5,s8,1d0 <gets+0x28>
 1fc:	89a6                	mv	s3,s1
 1fe:	a011                	j	202 <gets+0x5a>
 200:	89a6                	mv	s3,s1
 202:	99de                	add	s3,s3,s7
 204:	00098023          	sb	zero,0(s3)
 208:	855e                	mv	a0,s7
 20a:	60e6                	ld	ra,88(sp)
 20c:	6446                	ld	s0,80(sp)
 20e:	64a6                	ld	s1,72(sp)
 210:	6906                	ld	s2,64(sp)
 212:	79e2                	ld	s3,56(sp)
 214:	7a42                	ld	s4,48(sp)
 216:	7aa2                	ld	s5,40(sp)
 218:	7b02                	ld	s6,32(sp)
 21a:	6be2                	ld	s7,24(sp)
 21c:	6c42                	ld	s8,16(sp)
 21e:	6125                	addi	sp,sp,96
 220:	8082                	ret

0000000000000222 <stat>:
 222:	1101                	addi	sp,sp,-32
 224:	ec06                	sd	ra,24(sp)
 226:	e822                	sd	s0,16(sp)
 228:	e426                	sd	s1,8(sp)
 22a:	e04a                	sd	s2,0(sp)
 22c:	1000                	addi	s0,sp,32
 22e:	892e                	mv	s2,a1
 230:	4581                	li	a1,0
 232:	00000097          	auipc	ra,0x0
 236:	188080e7          	jalr	392(ra) # 3ba <open>
 23a:	02054563          	bltz	a0,264 <stat+0x42>
 23e:	84aa                	mv	s1,a0
 240:	85ca                	mv	a1,s2
 242:	00000097          	auipc	ra,0x0
 246:	180080e7          	jalr	384(ra) # 3c2 <fstat>
 24a:	892a                	mv	s2,a0
 24c:	8526                	mv	a0,s1
 24e:	00000097          	auipc	ra,0x0
 252:	154080e7          	jalr	340(ra) # 3a2 <close>
 256:	854a                	mv	a0,s2
 258:	60e2                	ld	ra,24(sp)
 25a:	6442                	ld	s0,16(sp)
 25c:	64a2                	ld	s1,8(sp)
 25e:	6902                	ld	s2,0(sp)
 260:	6105                	addi	sp,sp,32
 262:	8082                	ret
 264:	597d                	li	s2,-1
 266:	bfc5                	j	256 <stat+0x34>

0000000000000268 <atoi>:
 268:	1141                	addi	sp,sp,-16
 26a:	e422                	sd	s0,8(sp)
 26c:	0800                	addi	s0,sp,16
 26e:	00054703          	lbu	a4,0(a0)
 272:	02d00793          	li	a5,45
 276:	4585                	li	a1,1
 278:	04f70363          	beq	a4,a5,2be <atoi+0x56>
 27c:	00054703          	lbu	a4,0(a0)
 280:	fd07079b          	addiw	a5,a4,-48
 284:	0ff7f793          	zext.b	a5,a5
 288:	46a5                	li	a3,9
 28a:	02f6ed63          	bltu	a3,a5,2c4 <atoi+0x5c>
 28e:	4681                	li	a3,0
 290:	4625                	li	a2,9
 292:	0505                	addi	a0,a0,1
 294:	0026979b          	slliw	a5,a3,0x2
 298:	9fb5                	addw	a5,a5,a3
 29a:	0017979b          	slliw	a5,a5,0x1
 29e:	9fb9                	addw	a5,a5,a4
 2a0:	fd07869b          	addiw	a3,a5,-48
 2a4:	00054703          	lbu	a4,0(a0)
 2a8:	fd07079b          	addiw	a5,a4,-48
 2ac:	0ff7f793          	zext.b	a5,a5
 2b0:	fef671e3          	bgeu	a2,a5,292 <atoi+0x2a>
 2b4:	02d5853b          	mulw	a0,a1,a3
 2b8:	6422                	ld	s0,8(sp)
 2ba:	0141                	addi	sp,sp,16
 2bc:	8082                	ret
 2be:	0505                	addi	a0,a0,1
 2c0:	55fd                	li	a1,-1
 2c2:	bf6d                	j	27c <atoi+0x14>
 2c4:	4681                	li	a3,0
 2c6:	b7fd                	j	2b4 <atoi+0x4c>

00000000000002c8 <memmove>:
 2c8:	1141                	addi	sp,sp,-16
 2ca:	e422                	sd	s0,8(sp)
 2cc:	0800                	addi	s0,sp,16
 2ce:	02b57463          	bgeu	a0,a1,2f6 <memmove+0x2e>
 2d2:	00c05f63          	blez	a2,2f0 <memmove+0x28>
 2d6:	1602                	slli	a2,a2,0x20
 2d8:	9201                	srli	a2,a2,0x20
 2da:	00c507b3          	add	a5,a0,a2
 2de:	872a                	mv	a4,a0
 2e0:	0585                	addi	a1,a1,1
 2e2:	0705                	addi	a4,a4,1
 2e4:	fff5c683          	lbu	a3,-1(a1)
 2e8:	fed70fa3          	sb	a3,-1(a4)
 2ec:	fee79ae3          	bne	a5,a4,2e0 <memmove+0x18>
 2f0:	6422                	ld	s0,8(sp)
 2f2:	0141                	addi	sp,sp,16
 2f4:	8082                	ret
 2f6:	00c50733          	add	a4,a0,a2
 2fa:	95b2                	add	a1,a1,a2
 2fc:	fec05ae3          	blez	a2,2f0 <memmove+0x28>
 300:	fff6079b          	addiw	a5,a2,-1
 304:	1782                	slli	a5,a5,0x20
 306:	9381                	srli	a5,a5,0x20
 308:	fff7c793          	not	a5,a5
 30c:	97ba                	add	a5,a5,a4
 30e:	15fd                	addi	a1,a1,-1
 310:	177d                	addi	a4,a4,-1
 312:	0005c683          	lbu	a3,0(a1)
 316:	00d70023          	sb	a3,0(a4)
 31a:	fee79ae3          	bne	a5,a4,30e <memmove+0x46>
 31e:	bfc9                	j	2f0 <memmove+0x28>

0000000000000320 <memcmp>:
 320:	1141                	addi	sp,sp,-16
 322:	e422                	sd	s0,8(sp)
 324:	0800                	addi	s0,sp,16
 326:	ca05                	beqz	a2,356 <memcmp+0x36>
 328:	fff6069b          	addiw	a3,a2,-1
 32c:	1682                	slli	a3,a3,0x20
 32e:	9281                	srli	a3,a3,0x20
 330:	0685                	addi	a3,a3,1
 332:	96aa                	add	a3,a3,a0
 334:	00054783          	lbu	a5,0(a0)
 338:	0005c703          	lbu	a4,0(a1)
 33c:	00e79863          	bne	a5,a4,34c <memcmp+0x2c>
 340:	0505                	addi	a0,a0,1
 342:	0585                	addi	a1,a1,1
 344:	fed518e3          	bne	a0,a3,334 <memcmp+0x14>
 348:	4501                	li	a0,0
 34a:	a019                	j	350 <memcmp+0x30>
 34c:	40e7853b          	subw	a0,a5,a4
 350:	6422                	ld	s0,8(sp)
 352:	0141                	addi	sp,sp,16
 354:	8082                	ret
 356:	4501                	li	a0,0
 358:	bfe5                	j	350 <memcmp+0x30>

000000000000035a <memcpy>:
 35a:	1141                	addi	sp,sp,-16
 35c:	e406                	sd	ra,8(sp)
 35e:	e022                	sd	s0,0(sp)
 360:	0800                	addi	s0,sp,16
 362:	00000097          	auipc	ra,0x0
 366:	f66080e7          	jalr	-154(ra) # 2c8 <memmove>
 36a:	60a2                	ld	ra,8(sp)
 36c:	6402                	ld	s0,0(sp)
 36e:	0141                	addi	sp,sp,16
 370:	8082                	ret

0000000000000372 <fork>:
 372:	4885                	li	a7,1
 374:	00000073          	ecall
 378:	8082                	ret

000000000000037a <exit>:
 37a:	4889                	li	a7,2
 37c:	00000073          	ecall
 380:	8082                	ret

0000000000000382 <wait>:
 382:	488d                	li	a7,3
 384:	00000073          	ecall
 388:	8082                	ret

000000000000038a <pipe>:
 38a:	4891                	li	a7,4
 38c:	00000073          	ecall
 390:	8082                	ret

0000000000000392 <read>:
 392:	4895                	li	a7,5
 394:	00000073          	ecall
 398:	8082                	ret

000000000000039a <write>:
 39a:	48c1                	li	a7,16
 39c:	00000073          	ecall
 3a0:	8082                	ret

00000000000003a2 <close>:
 3a2:	48d5                	li	a7,21
 3a4:	00000073          	ecall
 3a8:	8082                	ret

00000000000003aa <kill>:
 3aa:	4899                	li	a7,6
 3ac:	00000073          	ecall
 3b0:	8082                	ret

00000000000003b2 <exec>:
 3b2:	489d                	li	a7,7
 3b4:	00000073          	ecall
 3b8:	8082                	ret

00000000000003ba <open>:
 3ba:	48bd                	li	a7,15
 3bc:	00000073          	ecall
 3c0:	8082                	ret

00000000000003c2 <fstat>:
 3c2:	48a1                	li	a7,8
 3c4:	00000073          	ecall
 3c8:	8082                	ret

00000000000003ca <mkdir>:
 3ca:	48d1                	li	a7,20
 3cc:	00000073          	ecall
 3d0:	8082                	ret

00000000000003d2 <chdir>:
 3d2:	48a5                	li	a7,9
 3d4:	00000073          	ecall
 3d8:	8082                	ret

00000000000003da <dup>:
 3da:	48a9                	li	a7,10
 3dc:	00000073          	ecall
 3e0:	8082                	ret

00000000000003e2 <getpid>:
 3e2:	48ad                	li	a7,11
 3e4:	00000073          	ecall
 3e8:	8082                	ret

00000000000003ea <sbrk>:
 3ea:	48b1                	li	a7,12
 3ec:	00000073          	ecall
 3f0:	8082                	ret

00000000000003f2 <sleep>:
 3f2:	48b5                	li	a7,13
 3f4:	00000073          	ecall
 3f8:	8082                	ret

00000000000003fa <uptime>:
 3fa:	48b9                	li	a7,14
 3fc:	00000073          	ecall
 400:	8082                	ret

0000000000000402 <test_proc>:
 402:	48d9                	li	a7,22
 404:	00000073          	ecall
 408:	8082                	ret

000000000000040a <dev>:
 40a:	48dd                	li	a7,23
 40c:	00000073          	ecall
 410:	8082                	ret

0000000000000412 <readdir>:
 412:	48e1                	li	a7,24
 414:	00000073          	ecall
 418:	8082                	ret

000000000000041a <getcwd>:
 41a:	48e5                	li	a7,25
 41c:	00000073          	ecall
 420:	8082                	ret

0000000000000422 <remove>:
 422:	48c5                	li	a7,17
 424:	00000073          	ecall
 428:	8082                	ret

000000000000042a <trace>:
 42a:	48c9                	li	a7,18
 42c:	00000073          	ecall
 430:	8082                	ret

0000000000000432 <sysinfo>:
 432:	48cd                	li	a7,19
 434:	00000073          	ecall
 438:	8082                	ret

000000000000043a <rename>:
 43a:	48e9                	li	a7,26
 43c:	00000073          	ecall
 440:	8082                	ret

0000000000000442 <putc>:
 442:	1101                	addi	sp,sp,-32
 444:	ec06                	sd	ra,24(sp)
 446:	e822                	sd	s0,16(sp)
 448:	1000                	addi	s0,sp,32
 44a:	feb407a3          	sb	a1,-17(s0)
 44e:	4605                	li	a2,1
 450:	fef40593          	addi	a1,s0,-17
 454:	00000097          	auipc	ra,0x0
 458:	f46080e7          	jalr	-186(ra) # 39a <write>
 45c:	60e2                	ld	ra,24(sp)
 45e:	6442                	ld	s0,16(sp)
 460:	6105                	addi	sp,sp,32
 462:	8082                	ret

0000000000000464 <printint>:
 464:	7139                	addi	sp,sp,-64
 466:	fc06                	sd	ra,56(sp)
 468:	f822                	sd	s0,48(sp)
 46a:	f426                	sd	s1,40(sp)
 46c:	f04a                	sd	s2,32(sp)
 46e:	ec4e                	sd	s3,24(sp)
 470:	0080                	addi	s0,sp,64
 472:	84aa                	mv	s1,a0
 474:	c299                	beqz	a3,47a <printint+0x16>
 476:	0805c863          	bltz	a1,506 <printint+0xa2>
 47a:	2581                	sext.w	a1,a1
 47c:	4881                	li	a7,0
 47e:	fc040993          	addi	s3,s0,-64
 482:	86ce                	mv	a3,s3
 484:	4701                	li	a4,0
 486:	2601                	sext.w	a2,a2
 488:	00000517          	auipc	a0,0x0
 48c:	4c850513          	addi	a0,a0,1224 # 950 <digits>
 490:	883a                	mv	a6,a4
 492:	2705                	addiw	a4,a4,1
 494:	02c5f7bb          	remuw	a5,a1,a2
 498:	1782                	slli	a5,a5,0x20
 49a:	9381                	srli	a5,a5,0x20
 49c:	97aa                	add	a5,a5,a0
 49e:	0007c783          	lbu	a5,0(a5)
 4a2:	00f68023          	sb	a5,0(a3)
 4a6:	0005879b          	sext.w	a5,a1
 4aa:	02c5d5bb          	divuw	a1,a1,a2
 4ae:	0685                	addi	a3,a3,1
 4b0:	fec7f0e3          	bgeu	a5,a2,490 <printint+0x2c>
 4b4:	00088c63          	beqz	a7,4cc <printint+0x68>
 4b8:	fd070793          	addi	a5,a4,-48
 4bc:	00878733          	add	a4,a5,s0
 4c0:	02d00793          	li	a5,45
 4c4:	fef70823          	sb	a5,-16(a4)
 4c8:	0028071b          	addiw	a4,a6,2
 4cc:	02e05663          	blez	a4,4f8 <printint+0x94>
 4d0:	fc040913          	addi	s2,s0,-64
 4d4:	993a                	add	s2,s2,a4
 4d6:	19fd                	addi	s3,s3,-1
 4d8:	99ba                	add	s3,s3,a4
 4da:	377d                	addiw	a4,a4,-1
 4dc:	1702                	slli	a4,a4,0x20
 4de:	9301                	srli	a4,a4,0x20
 4e0:	40e989b3          	sub	s3,s3,a4
 4e4:	fff94583          	lbu	a1,-1(s2)
 4e8:	8526                	mv	a0,s1
 4ea:	00000097          	auipc	ra,0x0
 4ee:	f58080e7          	jalr	-168(ra) # 442 <putc>
 4f2:	197d                	addi	s2,s2,-1
 4f4:	ff3918e3          	bne	s2,s3,4e4 <printint+0x80>
 4f8:	70e2                	ld	ra,56(sp)
 4fa:	7442                	ld	s0,48(sp)
 4fc:	74a2                	ld	s1,40(sp)
 4fe:	7902                	ld	s2,32(sp)
 500:	69e2                	ld	s3,24(sp)
 502:	6121                	addi	sp,sp,64
 504:	8082                	ret
 506:	40b005bb          	negw	a1,a1
 50a:	4885                	li	a7,1
 50c:	bf8d                	j	47e <printint+0x1a>

000000000000050e <vprintf>:
 50e:	715d                	addi	sp,sp,-80
 510:	e486                	sd	ra,72(sp)
 512:	e0a2                	sd	s0,64(sp)
 514:	fc26                	sd	s1,56(sp)
 516:	f84a                	sd	s2,48(sp)
 518:	f44e                	sd	s3,40(sp)
 51a:	f052                	sd	s4,32(sp)
 51c:	ec56                	sd	s5,24(sp)
 51e:	e85a                	sd	s6,16(sp)
 520:	e45e                	sd	s7,8(sp)
 522:	e062                	sd	s8,0(sp)
 524:	0880                	addi	s0,sp,80
 526:	0005c903          	lbu	s2,0(a1)
 52a:	18090c63          	beqz	s2,6c2 <vprintf+0x1b4>
 52e:	8aaa                	mv	s5,a0
 530:	8bb2                	mv	s7,a2
 532:	00158493          	addi	s1,a1,1
 536:	4981                	li	s3,0
 538:	02500a13          	li	s4,37
 53c:	4b55                	li	s6,21
 53e:	a839                	j	55c <vprintf+0x4e>
 540:	85ca                	mv	a1,s2
 542:	8556                	mv	a0,s5
 544:	00000097          	auipc	ra,0x0
 548:	efe080e7          	jalr	-258(ra) # 442 <putc>
 54c:	a019                	j	552 <vprintf+0x44>
 54e:	01498d63          	beq	s3,s4,568 <vprintf+0x5a>
 552:	0485                	addi	s1,s1,1
 554:	fff4c903          	lbu	s2,-1(s1)
 558:	16090563          	beqz	s2,6c2 <vprintf+0x1b4>
 55c:	fe0999e3          	bnez	s3,54e <vprintf+0x40>
 560:	ff4910e3          	bne	s2,s4,540 <vprintf+0x32>
 564:	89d2                	mv	s3,s4
 566:	b7f5                	j	552 <vprintf+0x44>
 568:	13490263          	beq	s2,s4,68c <vprintf+0x17e>
 56c:	f9d9079b          	addiw	a5,s2,-99
 570:	0ff7f793          	zext.b	a5,a5
 574:	12fb6563          	bltu	s6,a5,69e <vprintf+0x190>
 578:	f9d9079b          	addiw	a5,s2,-99
 57c:	0ff7f713          	zext.b	a4,a5
 580:	10eb6f63          	bltu	s6,a4,69e <vprintf+0x190>
 584:	00271793          	slli	a5,a4,0x2
 588:	00000717          	auipc	a4,0x0
 58c:	37070713          	addi	a4,a4,880 # 8f8 <malloc+0x138>
 590:	97ba                	add	a5,a5,a4
 592:	439c                	lw	a5,0(a5)
 594:	97ba                	add	a5,a5,a4
 596:	8782                	jr	a5
 598:	008b8913          	addi	s2,s7,8
 59c:	4685                	li	a3,1
 59e:	4629                	li	a2,10
 5a0:	000ba583          	lw	a1,0(s7)
 5a4:	8556                	mv	a0,s5
 5a6:	00000097          	auipc	ra,0x0
 5aa:	ebe080e7          	jalr	-322(ra) # 464 <printint>
 5ae:	8bca                	mv	s7,s2
 5b0:	4981                	li	s3,0
 5b2:	b745                	j	552 <vprintf+0x44>
 5b4:	008b8913          	addi	s2,s7,8
 5b8:	4681                	li	a3,0
 5ba:	4629                	li	a2,10
 5bc:	000ba583          	lw	a1,0(s7)
 5c0:	8556                	mv	a0,s5
 5c2:	00000097          	auipc	ra,0x0
 5c6:	ea2080e7          	jalr	-350(ra) # 464 <printint>
 5ca:	8bca                	mv	s7,s2
 5cc:	4981                	li	s3,0
 5ce:	b751                	j	552 <vprintf+0x44>
 5d0:	008b8913          	addi	s2,s7,8
 5d4:	4681                	li	a3,0
 5d6:	4641                	li	a2,16
 5d8:	000ba583          	lw	a1,0(s7)
 5dc:	8556                	mv	a0,s5
 5de:	00000097          	auipc	ra,0x0
 5e2:	e86080e7          	jalr	-378(ra) # 464 <printint>
 5e6:	8bca                	mv	s7,s2
 5e8:	4981                	li	s3,0
 5ea:	b7a5                	j	552 <vprintf+0x44>
 5ec:	008b8c13          	addi	s8,s7,8
 5f0:	000bb983          	ld	s3,0(s7)
 5f4:	03000593          	li	a1,48
 5f8:	8556                	mv	a0,s5
 5fa:	00000097          	auipc	ra,0x0
 5fe:	e48080e7          	jalr	-440(ra) # 442 <putc>
 602:	07800593          	li	a1,120
 606:	8556                	mv	a0,s5
 608:	00000097          	auipc	ra,0x0
 60c:	e3a080e7          	jalr	-454(ra) # 442 <putc>
 610:	4941                	li	s2,16
 612:	00000b97          	auipc	s7,0x0
 616:	33eb8b93          	addi	s7,s7,830 # 950 <digits>
 61a:	03c9d793          	srli	a5,s3,0x3c
 61e:	97de                	add	a5,a5,s7
 620:	0007c583          	lbu	a1,0(a5)
 624:	8556                	mv	a0,s5
 626:	00000097          	auipc	ra,0x0
 62a:	e1c080e7          	jalr	-484(ra) # 442 <putc>
 62e:	0992                	slli	s3,s3,0x4
 630:	397d                	addiw	s2,s2,-1
 632:	fe0914e3          	bnez	s2,61a <vprintf+0x10c>
 636:	8be2                	mv	s7,s8
 638:	4981                	li	s3,0
 63a:	bf21                	j	552 <vprintf+0x44>
 63c:	008b8993          	addi	s3,s7,8
 640:	000bb903          	ld	s2,0(s7)
 644:	02090163          	beqz	s2,666 <vprintf+0x158>
 648:	00094583          	lbu	a1,0(s2)
 64c:	c9a5                	beqz	a1,6bc <vprintf+0x1ae>
 64e:	8556                	mv	a0,s5
 650:	00000097          	auipc	ra,0x0
 654:	df2080e7          	jalr	-526(ra) # 442 <putc>
 658:	0905                	addi	s2,s2,1
 65a:	00094583          	lbu	a1,0(s2)
 65e:	f9e5                	bnez	a1,64e <vprintf+0x140>
 660:	8bce                	mv	s7,s3
 662:	4981                	li	s3,0
 664:	b5fd                	j	552 <vprintf+0x44>
 666:	00000917          	auipc	s2,0x0
 66a:	28a90913          	addi	s2,s2,650 # 8f0 <malloc+0x130>
 66e:	02800593          	li	a1,40
 672:	bff1                	j	64e <vprintf+0x140>
 674:	008b8913          	addi	s2,s7,8
 678:	000bc583          	lbu	a1,0(s7)
 67c:	8556                	mv	a0,s5
 67e:	00000097          	auipc	ra,0x0
 682:	dc4080e7          	jalr	-572(ra) # 442 <putc>
 686:	8bca                	mv	s7,s2
 688:	4981                	li	s3,0
 68a:	b5e1                	j	552 <vprintf+0x44>
 68c:	02500593          	li	a1,37
 690:	8556                	mv	a0,s5
 692:	00000097          	auipc	ra,0x0
 696:	db0080e7          	jalr	-592(ra) # 442 <putc>
 69a:	4981                	li	s3,0
 69c:	bd5d                	j	552 <vprintf+0x44>
 69e:	02500593          	li	a1,37
 6a2:	8556                	mv	a0,s5
 6a4:	00000097          	auipc	ra,0x0
 6a8:	d9e080e7          	jalr	-610(ra) # 442 <putc>
 6ac:	85ca                	mv	a1,s2
 6ae:	8556                	mv	a0,s5
 6b0:	00000097          	auipc	ra,0x0
 6b4:	d92080e7          	jalr	-622(ra) # 442 <putc>
 6b8:	4981                	li	s3,0
 6ba:	bd61                	j	552 <vprintf+0x44>
 6bc:	8bce                	mv	s7,s3
 6be:	4981                	li	s3,0
 6c0:	bd49                	j	552 <vprintf+0x44>
 6c2:	60a6                	ld	ra,72(sp)
 6c4:	6406                	ld	s0,64(sp)
 6c6:	74e2                	ld	s1,56(sp)
 6c8:	7942                	ld	s2,48(sp)
 6ca:	79a2                	ld	s3,40(sp)
 6cc:	7a02                	ld	s4,32(sp)
 6ce:	6ae2                	ld	s5,24(sp)
 6d0:	6b42                	ld	s6,16(sp)
 6d2:	6ba2                	ld	s7,8(sp)
 6d4:	6c02                	ld	s8,0(sp)
 6d6:	6161                	addi	sp,sp,80
 6d8:	8082                	ret

00000000000006da <fprintf>:
 6da:	715d                	addi	sp,sp,-80
 6dc:	ec06                	sd	ra,24(sp)
 6de:	e822                	sd	s0,16(sp)
 6e0:	1000                	addi	s0,sp,32
 6e2:	e010                	sd	a2,0(s0)
 6e4:	e414                	sd	a3,8(s0)
 6e6:	e818                	sd	a4,16(s0)
 6e8:	ec1c                	sd	a5,24(s0)
 6ea:	03043023          	sd	a6,32(s0)
 6ee:	03143423          	sd	a7,40(s0)
 6f2:	8622                	mv	a2,s0
 6f4:	fe843423          	sd	s0,-24(s0)
 6f8:	00000097          	auipc	ra,0x0
 6fc:	e16080e7          	jalr	-490(ra) # 50e <vprintf>
 700:	60e2                	ld	ra,24(sp)
 702:	6442                	ld	s0,16(sp)
 704:	6161                	addi	sp,sp,80
 706:	8082                	ret

0000000000000708 <printf>:
 708:	711d                	addi	sp,sp,-96
 70a:	ec06                	sd	ra,24(sp)
 70c:	e822                	sd	s0,16(sp)
 70e:	1000                	addi	s0,sp,32
 710:	e40c                	sd	a1,8(s0)
 712:	e810                	sd	a2,16(s0)
 714:	ec14                	sd	a3,24(s0)
 716:	f018                	sd	a4,32(s0)
 718:	f41c                	sd	a5,40(s0)
 71a:	03043823          	sd	a6,48(s0)
 71e:	03143c23          	sd	a7,56(s0)
 722:	00840613          	addi	a2,s0,8
 726:	fec43423          	sd	a2,-24(s0)
 72a:	85aa                	mv	a1,a0
 72c:	4505                	li	a0,1
 72e:	00000097          	auipc	ra,0x0
 732:	de0080e7          	jalr	-544(ra) # 50e <vprintf>
 736:	60e2                	ld	ra,24(sp)
 738:	6442                	ld	s0,16(sp)
 73a:	6125                	addi	sp,sp,96
 73c:	8082                	ret

000000000000073e <free>:
 73e:	1141                	addi	sp,sp,-16
 740:	e422                	sd	s0,8(sp)
 742:	0800                	addi	s0,sp,16
 744:	ff050693          	addi	a3,a0,-16
 748:	00000797          	auipc	a5,0x0
 74c:	2207b783          	ld	a5,544(a5) # 968 <freep>
 750:	a02d                	j	77a <free+0x3c>
 752:	4618                	lw	a4,8(a2)
 754:	9f2d                	addw	a4,a4,a1
 756:	fee52c23          	sw	a4,-8(a0)
 75a:	6398                	ld	a4,0(a5)
 75c:	6310                	ld	a2,0(a4)
 75e:	a83d                	j	79c <free+0x5e>
 760:	ff852703          	lw	a4,-8(a0)
 764:	9f31                	addw	a4,a4,a2
 766:	c798                	sw	a4,8(a5)
 768:	ff053683          	ld	a3,-16(a0)
 76c:	a091                	j	7b0 <free+0x72>
 76e:	6398                	ld	a4,0(a5)
 770:	00e7e463          	bltu	a5,a4,778 <free+0x3a>
 774:	00e6ea63          	bltu	a3,a4,788 <free+0x4a>
 778:	87ba                	mv	a5,a4
 77a:	fed7fae3          	bgeu	a5,a3,76e <free+0x30>
 77e:	6398                	ld	a4,0(a5)
 780:	00e6e463          	bltu	a3,a4,788 <free+0x4a>
 784:	fee7eae3          	bltu	a5,a4,778 <free+0x3a>
 788:	ff852583          	lw	a1,-8(a0)
 78c:	6390                	ld	a2,0(a5)
 78e:	02059813          	slli	a6,a1,0x20
 792:	01c85713          	srli	a4,a6,0x1c
 796:	9736                	add	a4,a4,a3
 798:	fae60de3          	beq	a2,a4,752 <free+0x14>
 79c:	fec53823          	sd	a2,-16(a0)
 7a0:	4790                	lw	a2,8(a5)
 7a2:	02061593          	slli	a1,a2,0x20
 7a6:	01c5d713          	srli	a4,a1,0x1c
 7aa:	973e                	add	a4,a4,a5
 7ac:	fae68ae3          	beq	a3,a4,760 <free+0x22>
 7b0:	e394                	sd	a3,0(a5)
 7b2:	00000717          	auipc	a4,0x0
 7b6:	1af73b23          	sd	a5,438(a4) # 968 <freep>
 7ba:	6422                	ld	s0,8(sp)
 7bc:	0141                	addi	sp,sp,16
 7be:	8082                	ret

00000000000007c0 <malloc>:
 7c0:	7139                	addi	sp,sp,-64
 7c2:	fc06                	sd	ra,56(sp)
 7c4:	f822                	sd	s0,48(sp)
 7c6:	f426                	sd	s1,40(sp)
 7c8:	f04a                	sd	s2,32(sp)
 7ca:	ec4e                	sd	s3,24(sp)
 7cc:	e852                	sd	s4,16(sp)
 7ce:	e456                	sd	s5,8(sp)
 7d0:	e05a                	sd	s6,0(sp)
 7d2:	0080                	addi	s0,sp,64
 7d4:	02051493          	slli	s1,a0,0x20
 7d8:	9081                	srli	s1,s1,0x20
 7da:	04bd                	addi	s1,s1,15
 7dc:	8091                	srli	s1,s1,0x4
 7de:	0014899b          	addiw	s3,s1,1
 7e2:	0485                	addi	s1,s1,1
 7e4:	00000517          	auipc	a0,0x0
 7e8:	18453503          	ld	a0,388(a0) # 968 <freep>
 7ec:	c515                	beqz	a0,818 <malloc+0x58>
 7ee:	611c                	ld	a5,0(a0)
 7f0:	4798                	lw	a4,8(a5)
 7f2:	04977063          	bgeu	a4,s1,832 <malloc+0x72>
 7f6:	8a4e                	mv	s4,s3
 7f8:	0009871b          	sext.w	a4,s3
 7fc:	6685                	lui	a3,0x1
 7fe:	00d77363          	bgeu	a4,a3,804 <malloc+0x44>
 802:	6a05                	lui	s4,0x1
 804:	000a0b1b          	sext.w	s6,s4
 808:	004a1a1b          	slliw	s4,s4,0x4
 80c:	00000917          	auipc	s2,0x0
 810:	15c90913          	addi	s2,s2,348 # 968 <freep>
 814:	5afd                	li	s5,-1
 816:	a89d                	j	88c <malloc+0xcc>
 818:	00000717          	auipc	a4,0x0
 81c:	15070713          	addi	a4,a4,336 # 968 <freep>
 820:	00000797          	auipc	a5,0x0
 824:	15078793          	addi	a5,a5,336 # 970 <base>
 828:	e31c                	sd	a5,0(a4)
 82a:	e71c                	sd	a5,8(a4)
 82c:	00072823          	sw	zero,16(a4)
 830:	b7d9                	j	7f6 <malloc+0x36>
 832:	02e48c63          	beq	s1,a4,86a <malloc+0xaa>
 836:	4137073b          	subw	a4,a4,s3
 83a:	c798                	sw	a4,8(a5)
 83c:	02071693          	slli	a3,a4,0x20
 840:	01c6d713          	srli	a4,a3,0x1c
 844:	97ba                	add	a5,a5,a4
 846:	0137a423          	sw	s3,8(a5)
 84a:	00000717          	auipc	a4,0x0
 84e:	10a73f23          	sd	a0,286(a4) # 968 <freep>
 852:	01078513          	addi	a0,a5,16
 856:	70e2                	ld	ra,56(sp)
 858:	7442                	ld	s0,48(sp)
 85a:	74a2                	ld	s1,40(sp)
 85c:	7902                	ld	s2,32(sp)
 85e:	69e2                	ld	s3,24(sp)
 860:	6a42                	ld	s4,16(sp)
 862:	6aa2                	ld	s5,8(sp)
 864:	6b02                	ld	s6,0(sp)
 866:	6121                	addi	sp,sp,64
 868:	8082                	ret
 86a:	6398                	ld	a4,0(a5)
 86c:	e118                	sd	a4,0(a0)
 86e:	bff1                	j	84a <malloc+0x8a>
 870:	01652423          	sw	s6,8(a0)
 874:	0541                	addi	a0,a0,16
 876:	00000097          	auipc	ra,0x0
 87a:	ec8080e7          	jalr	-312(ra) # 73e <free>
 87e:	00093503          	ld	a0,0(s2)
 882:	d971                	beqz	a0,856 <malloc+0x96>
 884:	611c                	ld	a5,0(a0)
 886:	4798                	lw	a4,8(a5)
 888:	fa9775e3          	bgeu	a4,s1,832 <malloc+0x72>
 88c:	00093703          	ld	a4,0(s2)
 890:	853e                	mv	a0,a5
 892:	fef719e3          	bne	a4,a5,884 <malloc+0xc4>
 896:	8552                	mv	a0,s4
 898:	00000097          	auipc	ra,0x0
 89c:	b52080e7          	jalr	-1198(ra) # 3ea <sbrk>
 8a0:	fd5518e3          	bne	a0,s5,870 <malloc+0xb0>
 8a4:	4501                	li	a0,0
 8a6:	bf45                	j	856 <malloc+0x96>
