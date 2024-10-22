
xv6-user/_mkdir:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/include/stat.h"
#include "xv6-user/user.h"

int
main(int argc, char *argv[])
{
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	ec26                	sd	s1,24(sp)
   8:	e84a                	sd	s2,16(sp)
   a:	e44e                	sd	s3,8(sp)
   c:	1800                	addi	s0,sp,48
  int i;

  if(argc < 2){
   e:	4785                	li	a5,1
  10:	02a7d763          	bge	a5,a0,3e <main+0x3e>
  14:	00858493          	addi	s1,a1,8
  18:	ffe5091b          	addiw	s2,a0,-2
  1c:	02091793          	slli	a5,s2,0x20
  20:	01d7d913          	srli	s2,a5,0x1d
  24:	05c1                	addi	a1,a1,16
  26:	992e                	add	s2,s2,a1
    fprintf(2, "Usage: mkdir files...\n");
    exit(1);
  }

  for(i = 1; i < argc; i++){
    if(mkdir(argv[i]) < 0){
  28:	6088                	ld	a0,0(s1)
  2a:	00000097          	auipc	ra,0x0
  2e:	356080e7          	jalr	854(ra) # 380 <mkdir>
  32:	02054463          	bltz	a0,5a <main+0x5a>
  for(i = 1; i < argc; i++){
  36:	04a1                	addi	s1,s1,8
  38:	ff2498e3          	bne	s1,s2,28 <main+0x28>
  3c:	a80d                	j	6e <main+0x6e>
    fprintf(2, "Usage: mkdir files...\n");
  3e:	00001597          	auipc	a1,0x1
  42:	82258593          	addi	a1,a1,-2014 # 860 <malloc+0xea>
  46:	4509                	li	a0,2
  48:	00000097          	auipc	ra,0x0
  4c:	648080e7          	jalr	1608(ra) # 690 <fprintf>
    exit(1);
  50:	4505                	li	a0,1
  52:	00000097          	auipc	ra,0x0
  56:	2de080e7          	jalr	734(ra) # 330 <exit>
      fprintf(2, "mkdir: %s failed to create\n", argv[i]);
  5a:	6090                	ld	a2,0(s1)
  5c:	00001597          	auipc	a1,0x1
  60:	81c58593          	addi	a1,a1,-2020 # 878 <malloc+0x102>
  64:	4509                	li	a0,2
  66:	00000097          	auipc	ra,0x0
  6a:	62a080e7          	jalr	1578(ra) # 690 <fprintf>
      break;
    }
  }

  exit(0);
  6e:	4501                	li	a0,0
  70:	00000097          	auipc	ra,0x0
  74:	2c0080e7          	jalr	704(ra) # 330 <exit>

0000000000000078 <strcpy>:
  78:	1141                	addi	sp,sp,-16
  7a:	e422                	sd	s0,8(sp)
  7c:	0800                	addi	s0,sp,16
  7e:	87aa                	mv	a5,a0
  80:	0585                	addi	a1,a1,1
  82:	0785                	addi	a5,a5,1
  84:	fff5c703          	lbu	a4,-1(a1)
  88:	fee78fa3          	sb	a4,-1(a5)
  8c:	fb75                	bnez	a4,80 <strcpy+0x8>
  8e:	6422                	ld	s0,8(sp)
  90:	0141                	addi	sp,sp,16
  92:	8082                	ret

0000000000000094 <strcat>:
  94:	1141                	addi	sp,sp,-16
  96:	e422                	sd	s0,8(sp)
  98:	0800                	addi	s0,sp,16
  9a:	00054783          	lbu	a5,0(a0)
  9e:	c385                	beqz	a5,be <strcat+0x2a>
  a0:	87aa                	mv	a5,a0
  a2:	0785                	addi	a5,a5,1
  a4:	0007c703          	lbu	a4,0(a5)
  a8:	ff6d                	bnez	a4,a2 <strcat+0xe>
  aa:	0585                	addi	a1,a1,1
  ac:	0785                	addi	a5,a5,1
  ae:	fff5c703          	lbu	a4,-1(a1)
  b2:	fee78fa3          	sb	a4,-1(a5)
  b6:	fb75                	bnez	a4,aa <strcat+0x16>
  b8:	6422                	ld	s0,8(sp)
  ba:	0141                	addi	sp,sp,16
  bc:	8082                	ret
  be:	87aa                	mv	a5,a0
  c0:	b7ed                	j	aa <strcat+0x16>

00000000000000c2 <strcmp>:
  c2:	1141                	addi	sp,sp,-16
  c4:	e422                	sd	s0,8(sp)
  c6:	0800                	addi	s0,sp,16
  c8:	00054783          	lbu	a5,0(a0)
  cc:	cb91                	beqz	a5,e0 <strcmp+0x1e>
  ce:	0005c703          	lbu	a4,0(a1)
  d2:	00f71763          	bne	a4,a5,e0 <strcmp+0x1e>
  d6:	0505                	addi	a0,a0,1
  d8:	0585                	addi	a1,a1,1
  da:	00054783          	lbu	a5,0(a0)
  de:	fbe5                	bnez	a5,ce <strcmp+0xc>
  e0:	0005c503          	lbu	a0,0(a1)
  e4:	40a7853b          	subw	a0,a5,a0
  e8:	6422                	ld	s0,8(sp)
  ea:	0141                	addi	sp,sp,16
  ec:	8082                	ret

00000000000000ee <strlen>:
  ee:	1141                	addi	sp,sp,-16
  f0:	e422                	sd	s0,8(sp)
  f2:	0800                	addi	s0,sp,16
  f4:	00054783          	lbu	a5,0(a0)
  f8:	cf91                	beqz	a5,114 <strlen+0x26>
  fa:	0505                	addi	a0,a0,1
  fc:	87aa                	mv	a5,a0
  fe:	86be                	mv	a3,a5
 100:	0785                	addi	a5,a5,1
 102:	fff7c703          	lbu	a4,-1(a5)
 106:	ff65                	bnez	a4,fe <strlen+0x10>
 108:	40a6853b          	subw	a0,a3,a0
 10c:	2505                	addiw	a0,a0,1
 10e:	6422                	ld	s0,8(sp)
 110:	0141                	addi	sp,sp,16
 112:	8082                	ret
 114:	4501                	li	a0,0
 116:	bfe5                	j	10e <strlen+0x20>

0000000000000118 <memset>:
 118:	1141                	addi	sp,sp,-16
 11a:	e422                	sd	s0,8(sp)
 11c:	0800                	addi	s0,sp,16
 11e:	ca19                	beqz	a2,134 <memset+0x1c>
 120:	87aa                	mv	a5,a0
 122:	1602                	slli	a2,a2,0x20
 124:	9201                	srli	a2,a2,0x20
 126:	00a60733          	add	a4,a2,a0
 12a:	00b78023          	sb	a1,0(a5)
 12e:	0785                	addi	a5,a5,1
 130:	fee79de3          	bne	a5,a4,12a <memset+0x12>
 134:	6422                	ld	s0,8(sp)
 136:	0141                	addi	sp,sp,16
 138:	8082                	ret

000000000000013a <strchr>:
 13a:	1141                	addi	sp,sp,-16
 13c:	e422                	sd	s0,8(sp)
 13e:	0800                	addi	s0,sp,16
 140:	00054783          	lbu	a5,0(a0)
 144:	cb99                	beqz	a5,15a <strchr+0x20>
 146:	00f58763          	beq	a1,a5,154 <strchr+0x1a>
 14a:	0505                	addi	a0,a0,1
 14c:	00054783          	lbu	a5,0(a0)
 150:	fbfd                	bnez	a5,146 <strchr+0xc>
 152:	4501                	li	a0,0
 154:	6422                	ld	s0,8(sp)
 156:	0141                	addi	sp,sp,16
 158:	8082                	ret
 15a:	4501                	li	a0,0
 15c:	bfe5                	j	154 <strchr+0x1a>

000000000000015e <gets>:
 15e:	711d                	addi	sp,sp,-96
 160:	ec86                	sd	ra,88(sp)
 162:	e8a2                	sd	s0,80(sp)
 164:	e4a6                	sd	s1,72(sp)
 166:	e0ca                	sd	s2,64(sp)
 168:	fc4e                	sd	s3,56(sp)
 16a:	f852                	sd	s4,48(sp)
 16c:	f456                	sd	s5,40(sp)
 16e:	f05a                	sd	s6,32(sp)
 170:	ec5e                	sd	s7,24(sp)
 172:	e862                	sd	s8,16(sp)
 174:	1080                	addi	s0,sp,96
 176:	8baa                	mv	s7,a0
 178:	8a2e                	mv	s4,a1
 17a:	892a                	mv	s2,a0
 17c:	4481                	li	s1,0
 17e:	faf40a93          	addi	s5,s0,-81
 182:	4b29                	li	s6,10
 184:	4c35                	li	s8,13
 186:	89a6                	mv	s3,s1
 188:	2485                	addiw	s1,s1,1
 18a:	0344d763          	bge	s1,s4,1b8 <gets+0x5a>
 18e:	4605                	li	a2,1
 190:	85d6                	mv	a1,s5
 192:	4501                	li	a0,0
 194:	00000097          	auipc	ra,0x0
 198:	1b4080e7          	jalr	436(ra) # 348 <read>
 19c:	00a05e63          	blez	a0,1b8 <gets+0x5a>
 1a0:	faf44783          	lbu	a5,-81(s0)
 1a4:	00f90023          	sb	a5,0(s2)
 1a8:	01678763          	beq	a5,s6,1b6 <gets+0x58>
 1ac:	0905                	addi	s2,s2,1
 1ae:	fd879ce3          	bne	a5,s8,186 <gets+0x28>
 1b2:	89a6                	mv	s3,s1
 1b4:	a011                	j	1b8 <gets+0x5a>
 1b6:	89a6                	mv	s3,s1
 1b8:	99de                	add	s3,s3,s7
 1ba:	00098023          	sb	zero,0(s3)
 1be:	855e                	mv	a0,s7
 1c0:	60e6                	ld	ra,88(sp)
 1c2:	6446                	ld	s0,80(sp)
 1c4:	64a6                	ld	s1,72(sp)
 1c6:	6906                	ld	s2,64(sp)
 1c8:	79e2                	ld	s3,56(sp)
 1ca:	7a42                	ld	s4,48(sp)
 1cc:	7aa2                	ld	s5,40(sp)
 1ce:	7b02                	ld	s6,32(sp)
 1d0:	6be2                	ld	s7,24(sp)
 1d2:	6c42                	ld	s8,16(sp)
 1d4:	6125                	addi	sp,sp,96
 1d6:	8082                	ret

00000000000001d8 <stat>:
 1d8:	1101                	addi	sp,sp,-32
 1da:	ec06                	sd	ra,24(sp)
 1dc:	e822                	sd	s0,16(sp)
 1de:	e426                	sd	s1,8(sp)
 1e0:	e04a                	sd	s2,0(sp)
 1e2:	1000                	addi	s0,sp,32
 1e4:	892e                	mv	s2,a1
 1e6:	4581                	li	a1,0
 1e8:	00000097          	auipc	ra,0x0
 1ec:	188080e7          	jalr	392(ra) # 370 <open>
 1f0:	02054563          	bltz	a0,21a <stat+0x42>
 1f4:	84aa                	mv	s1,a0
 1f6:	85ca                	mv	a1,s2
 1f8:	00000097          	auipc	ra,0x0
 1fc:	180080e7          	jalr	384(ra) # 378 <fstat>
 200:	892a                	mv	s2,a0
 202:	8526                	mv	a0,s1
 204:	00000097          	auipc	ra,0x0
 208:	154080e7          	jalr	340(ra) # 358 <close>
 20c:	854a                	mv	a0,s2
 20e:	60e2                	ld	ra,24(sp)
 210:	6442                	ld	s0,16(sp)
 212:	64a2                	ld	s1,8(sp)
 214:	6902                	ld	s2,0(sp)
 216:	6105                	addi	sp,sp,32
 218:	8082                	ret
 21a:	597d                	li	s2,-1
 21c:	bfc5                	j	20c <stat+0x34>

000000000000021e <atoi>:
 21e:	1141                	addi	sp,sp,-16
 220:	e422                	sd	s0,8(sp)
 222:	0800                	addi	s0,sp,16
 224:	00054703          	lbu	a4,0(a0)
 228:	02d00793          	li	a5,45
 22c:	4585                	li	a1,1
 22e:	04f70363          	beq	a4,a5,274 <atoi+0x56>
 232:	00054703          	lbu	a4,0(a0)
 236:	fd07079b          	addiw	a5,a4,-48
 23a:	0ff7f793          	zext.b	a5,a5
 23e:	46a5                	li	a3,9
 240:	02f6ed63          	bltu	a3,a5,27a <atoi+0x5c>
 244:	4681                	li	a3,0
 246:	4625                	li	a2,9
 248:	0505                	addi	a0,a0,1
 24a:	0026979b          	slliw	a5,a3,0x2
 24e:	9fb5                	addw	a5,a5,a3
 250:	0017979b          	slliw	a5,a5,0x1
 254:	9fb9                	addw	a5,a5,a4
 256:	fd07869b          	addiw	a3,a5,-48
 25a:	00054703          	lbu	a4,0(a0)
 25e:	fd07079b          	addiw	a5,a4,-48
 262:	0ff7f793          	zext.b	a5,a5
 266:	fef671e3          	bgeu	a2,a5,248 <atoi+0x2a>
 26a:	02d5853b          	mulw	a0,a1,a3
 26e:	6422                	ld	s0,8(sp)
 270:	0141                	addi	sp,sp,16
 272:	8082                	ret
 274:	0505                	addi	a0,a0,1
 276:	55fd                	li	a1,-1
 278:	bf6d                	j	232 <atoi+0x14>
 27a:	4681                	li	a3,0
 27c:	b7fd                	j	26a <atoi+0x4c>

000000000000027e <memmove>:
 27e:	1141                	addi	sp,sp,-16
 280:	e422                	sd	s0,8(sp)
 282:	0800                	addi	s0,sp,16
 284:	02b57463          	bgeu	a0,a1,2ac <memmove+0x2e>
 288:	00c05f63          	blez	a2,2a6 <memmove+0x28>
 28c:	1602                	slli	a2,a2,0x20
 28e:	9201                	srli	a2,a2,0x20
 290:	00c507b3          	add	a5,a0,a2
 294:	872a                	mv	a4,a0
 296:	0585                	addi	a1,a1,1
 298:	0705                	addi	a4,a4,1
 29a:	fff5c683          	lbu	a3,-1(a1)
 29e:	fed70fa3          	sb	a3,-1(a4)
 2a2:	fee79ae3          	bne	a5,a4,296 <memmove+0x18>
 2a6:	6422                	ld	s0,8(sp)
 2a8:	0141                	addi	sp,sp,16
 2aa:	8082                	ret
 2ac:	00c50733          	add	a4,a0,a2
 2b0:	95b2                	add	a1,a1,a2
 2b2:	fec05ae3          	blez	a2,2a6 <memmove+0x28>
 2b6:	fff6079b          	addiw	a5,a2,-1
 2ba:	1782                	slli	a5,a5,0x20
 2bc:	9381                	srli	a5,a5,0x20
 2be:	fff7c793          	not	a5,a5
 2c2:	97ba                	add	a5,a5,a4
 2c4:	15fd                	addi	a1,a1,-1
 2c6:	177d                	addi	a4,a4,-1
 2c8:	0005c683          	lbu	a3,0(a1)
 2cc:	00d70023          	sb	a3,0(a4)
 2d0:	fee79ae3          	bne	a5,a4,2c4 <memmove+0x46>
 2d4:	bfc9                	j	2a6 <memmove+0x28>

00000000000002d6 <memcmp>:
 2d6:	1141                	addi	sp,sp,-16
 2d8:	e422                	sd	s0,8(sp)
 2da:	0800                	addi	s0,sp,16
 2dc:	ca05                	beqz	a2,30c <memcmp+0x36>
 2de:	fff6069b          	addiw	a3,a2,-1
 2e2:	1682                	slli	a3,a3,0x20
 2e4:	9281                	srli	a3,a3,0x20
 2e6:	0685                	addi	a3,a3,1
 2e8:	96aa                	add	a3,a3,a0
 2ea:	00054783          	lbu	a5,0(a0)
 2ee:	0005c703          	lbu	a4,0(a1)
 2f2:	00e79863          	bne	a5,a4,302 <memcmp+0x2c>
 2f6:	0505                	addi	a0,a0,1
 2f8:	0585                	addi	a1,a1,1
 2fa:	fed518e3          	bne	a0,a3,2ea <memcmp+0x14>
 2fe:	4501                	li	a0,0
 300:	a019                	j	306 <memcmp+0x30>
 302:	40e7853b          	subw	a0,a5,a4
 306:	6422                	ld	s0,8(sp)
 308:	0141                	addi	sp,sp,16
 30a:	8082                	ret
 30c:	4501                	li	a0,0
 30e:	bfe5                	j	306 <memcmp+0x30>

0000000000000310 <memcpy>:
 310:	1141                	addi	sp,sp,-16
 312:	e406                	sd	ra,8(sp)
 314:	e022                	sd	s0,0(sp)
 316:	0800                	addi	s0,sp,16
 318:	00000097          	auipc	ra,0x0
 31c:	f66080e7          	jalr	-154(ra) # 27e <memmove>
 320:	60a2                	ld	ra,8(sp)
 322:	6402                	ld	s0,0(sp)
 324:	0141                	addi	sp,sp,16
 326:	8082                	ret

0000000000000328 <fork>:
 328:	4885                	li	a7,1
 32a:	00000073          	ecall
 32e:	8082                	ret

0000000000000330 <exit>:
 330:	4889                	li	a7,2
 332:	00000073          	ecall
 336:	8082                	ret

0000000000000338 <wait>:
 338:	488d                	li	a7,3
 33a:	00000073          	ecall
 33e:	8082                	ret

0000000000000340 <pipe>:
 340:	4891                	li	a7,4
 342:	00000073          	ecall
 346:	8082                	ret

0000000000000348 <read>:
 348:	4895                	li	a7,5
 34a:	00000073          	ecall
 34e:	8082                	ret

0000000000000350 <write>:
 350:	48c1                	li	a7,16
 352:	00000073          	ecall
 356:	8082                	ret

0000000000000358 <close>:
 358:	48d5                	li	a7,21
 35a:	00000073          	ecall
 35e:	8082                	ret

0000000000000360 <kill>:
 360:	4899                	li	a7,6
 362:	00000073          	ecall
 366:	8082                	ret

0000000000000368 <exec>:
 368:	489d                	li	a7,7
 36a:	00000073          	ecall
 36e:	8082                	ret

0000000000000370 <open>:
 370:	48bd                	li	a7,15
 372:	00000073          	ecall
 376:	8082                	ret

0000000000000378 <fstat>:
 378:	48a1                	li	a7,8
 37a:	00000073          	ecall
 37e:	8082                	ret

0000000000000380 <mkdir>:
 380:	48d1                	li	a7,20
 382:	00000073          	ecall
 386:	8082                	ret

0000000000000388 <chdir>:
 388:	48a5                	li	a7,9
 38a:	00000073          	ecall
 38e:	8082                	ret

0000000000000390 <dup>:
 390:	48a9                	li	a7,10
 392:	00000073          	ecall
 396:	8082                	ret

0000000000000398 <getpid>:
 398:	48ad                	li	a7,11
 39a:	00000073          	ecall
 39e:	8082                	ret

00000000000003a0 <sbrk>:
 3a0:	48b1                	li	a7,12
 3a2:	00000073          	ecall
 3a6:	8082                	ret

00000000000003a8 <sleep>:
 3a8:	48b5                	li	a7,13
 3aa:	00000073          	ecall
 3ae:	8082                	ret

00000000000003b0 <uptime>:
 3b0:	48b9                	li	a7,14
 3b2:	00000073          	ecall
 3b6:	8082                	ret

00000000000003b8 <test_proc>:
 3b8:	48d9                	li	a7,22
 3ba:	00000073          	ecall
 3be:	8082                	ret

00000000000003c0 <dev>:
 3c0:	48dd                	li	a7,23
 3c2:	00000073          	ecall
 3c6:	8082                	ret

00000000000003c8 <readdir>:
 3c8:	48e1                	li	a7,24
 3ca:	00000073          	ecall
 3ce:	8082                	ret

00000000000003d0 <getcwd>:
 3d0:	48e5                	li	a7,25
 3d2:	00000073          	ecall
 3d6:	8082                	ret

00000000000003d8 <remove>:
 3d8:	48c5                	li	a7,17
 3da:	00000073          	ecall
 3de:	8082                	ret

00000000000003e0 <trace>:
 3e0:	48c9                	li	a7,18
 3e2:	00000073          	ecall
 3e6:	8082                	ret

00000000000003e8 <sysinfo>:
 3e8:	48cd                	li	a7,19
 3ea:	00000073          	ecall
 3ee:	8082                	ret

00000000000003f0 <rename>:
 3f0:	48e9                	li	a7,26
 3f2:	00000073          	ecall
 3f6:	8082                	ret

00000000000003f8 <putc>:
 3f8:	1101                	addi	sp,sp,-32
 3fa:	ec06                	sd	ra,24(sp)
 3fc:	e822                	sd	s0,16(sp)
 3fe:	1000                	addi	s0,sp,32
 400:	feb407a3          	sb	a1,-17(s0)
 404:	4605                	li	a2,1
 406:	fef40593          	addi	a1,s0,-17
 40a:	00000097          	auipc	ra,0x0
 40e:	f46080e7          	jalr	-186(ra) # 350 <write>
 412:	60e2                	ld	ra,24(sp)
 414:	6442                	ld	s0,16(sp)
 416:	6105                	addi	sp,sp,32
 418:	8082                	ret

000000000000041a <printint>:
 41a:	7139                	addi	sp,sp,-64
 41c:	fc06                	sd	ra,56(sp)
 41e:	f822                	sd	s0,48(sp)
 420:	f426                	sd	s1,40(sp)
 422:	f04a                	sd	s2,32(sp)
 424:	ec4e                	sd	s3,24(sp)
 426:	0080                	addi	s0,sp,64
 428:	84aa                	mv	s1,a0
 42a:	c299                	beqz	a3,430 <printint+0x16>
 42c:	0805c863          	bltz	a1,4bc <printint+0xa2>
 430:	2581                	sext.w	a1,a1
 432:	4881                	li	a7,0
 434:	fc040993          	addi	s3,s0,-64
 438:	86ce                	mv	a3,s3
 43a:	4701                	li	a4,0
 43c:	2601                	sext.w	a2,a2
 43e:	00000517          	auipc	a0,0x0
 442:	4ba50513          	addi	a0,a0,1210 # 8f8 <digits>
 446:	883a                	mv	a6,a4
 448:	2705                	addiw	a4,a4,1
 44a:	02c5f7bb          	remuw	a5,a1,a2
 44e:	1782                	slli	a5,a5,0x20
 450:	9381                	srli	a5,a5,0x20
 452:	97aa                	add	a5,a5,a0
 454:	0007c783          	lbu	a5,0(a5)
 458:	00f68023          	sb	a5,0(a3)
 45c:	0005879b          	sext.w	a5,a1
 460:	02c5d5bb          	divuw	a1,a1,a2
 464:	0685                	addi	a3,a3,1
 466:	fec7f0e3          	bgeu	a5,a2,446 <printint+0x2c>
 46a:	00088c63          	beqz	a7,482 <printint+0x68>
 46e:	fd070793          	addi	a5,a4,-48
 472:	00878733          	add	a4,a5,s0
 476:	02d00793          	li	a5,45
 47a:	fef70823          	sb	a5,-16(a4)
 47e:	0028071b          	addiw	a4,a6,2
 482:	02e05663          	blez	a4,4ae <printint+0x94>
 486:	fc040913          	addi	s2,s0,-64
 48a:	993a                	add	s2,s2,a4
 48c:	19fd                	addi	s3,s3,-1
 48e:	99ba                	add	s3,s3,a4
 490:	377d                	addiw	a4,a4,-1
 492:	1702                	slli	a4,a4,0x20
 494:	9301                	srli	a4,a4,0x20
 496:	40e989b3          	sub	s3,s3,a4
 49a:	fff94583          	lbu	a1,-1(s2)
 49e:	8526                	mv	a0,s1
 4a0:	00000097          	auipc	ra,0x0
 4a4:	f58080e7          	jalr	-168(ra) # 3f8 <putc>
 4a8:	197d                	addi	s2,s2,-1
 4aa:	ff3918e3          	bne	s2,s3,49a <printint+0x80>
 4ae:	70e2                	ld	ra,56(sp)
 4b0:	7442                	ld	s0,48(sp)
 4b2:	74a2                	ld	s1,40(sp)
 4b4:	7902                	ld	s2,32(sp)
 4b6:	69e2                	ld	s3,24(sp)
 4b8:	6121                	addi	sp,sp,64
 4ba:	8082                	ret
 4bc:	40b005bb          	negw	a1,a1
 4c0:	4885                	li	a7,1
 4c2:	bf8d                	j	434 <printint+0x1a>

00000000000004c4 <vprintf>:
 4c4:	715d                	addi	sp,sp,-80
 4c6:	e486                	sd	ra,72(sp)
 4c8:	e0a2                	sd	s0,64(sp)
 4ca:	fc26                	sd	s1,56(sp)
 4cc:	f84a                	sd	s2,48(sp)
 4ce:	f44e                	sd	s3,40(sp)
 4d0:	f052                	sd	s4,32(sp)
 4d2:	ec56                	sd	s5,24(sp)
 4d4:	e85a                	sd	s6,16(sp)
 4d6:	e45e                	sd	s7,8(sp)
 4d8:	e062                	sd	s8,0(sp)
 4da:	0880                	addi	s0,sp,80
 4dc:	0005c903          	lbu	s2,0(a1)
 4e0:	18090c63          	beqz	s2,678 <vprintf+0x1b4>
 4e4:	8aaa                	mv	s5,a0
 4e6:	8bb2                	mv	s7,a2
 4e8:	00158493          	addi	s1,a1,1
 4ec:	4981                	li	s3,0
 4ee:	02500a13          	li	s4,37
 4f2:	4b55                	li	s6,21
 4f4:	a839                	j	512 <vprintf+0x4e>
 4f6:	85ca                	mv	a1,s2
 4f8:	8556                	mv	a0,s5
 4fa:	00000097          	auipc	ra,0x0
 4fe:	efe080e7          	jalr	-258(ra) # 3f8 <putc>
 502:	a019                	j	508 <vprintf+0x44>
 504:	01498d63          	beq	s3,s4,51e <vprintf+0x5a>
 508:	0485                	addi	s1,s1,1
 50a:	fff4c903          	lbu	s2,-1(s1)
 50e:	16090563          	beqz	s2,678 <vprintf+0x1b4>
 512:	fe0999e3          	bnez	s3,504 <vprintf+0x40>
 516:	ff4910e3          	bne	s2,s4,4f6 <vprintf+0x32>
 51a:	89d2                	mv	s3,s4
 51c:	b7f5                	j	508 <vprintf+0x44>
 51e:	13490263          	beq	s2,s4,642 <vprintf+0x17e>
 522:	f9d9079b          	addiw	a5,s2,-99
 526:	0ff7f793          	zext.b	a5,a5
 52a:	12fb6563          	bltu	s6,a5,654 <vprintf+0x190>
 52e:	f9d9079b          	addiw	a5,s2,-99
 532:	0ff7f713          	zext.b	a4,a5
 536:	10eb6f63          	bltu	s6,a4,654 <vprintf+0x190>
 53a:	00271793          	slli	a5,a4,0x2
 53e:	00000717          	auipc	a4,0x0
 542:	36270713          	addi	a4,a4,866 # 8a0 <malloc+0x12a>
 546:	97ba                	add	a5,a5,a4
 548:	439c                	lw	a5,0(a5)
 54a:	97ba                	add	a5,a5,a4
 54c:	8782                	jr	a5
 54e:	008b8913          	addi	s2,s7,8
 552:	4685                	li	a3,1
 554:	4629                	li	a2,10
 556:	000ba583          	lw	a1,0(s7)
 55a:	8556                	mv	a0,s5
 55c:	00000097          	auipc	ra,0x0
 560:	ebe080e7          	jalr	-322(ra) # 41a <printint>
 564:	8bca                	mv	s7,s2
 566:	4981                	li	s3,0
 568:	b745                	j	508 <vprintf+0x44>
 56a:	008b8913          	addi	s2,s7,8
 56e:	4681                	li	a3,0
 570:	4629                	li	a2,10
 572:	000ba583          	lw	a1,0(s7)
 576:	8556                	mv	a0,s5
 578:	00000097          	auipc	ra,0x0
 57c:	ea2080e7          	jalr	-350(ra) # 41a <printint>
 580:	8bca                	mv	s7,s2
 582:	4981                	li	s3,0
 584:	b751                	j	508 <vprintf+0x44>
 586:	008b8913          	addi	s2,s7,8
 58a:	4681                	li	a3,0
 58c:	4641                	li	a2,16
 58e:	000ba583          	lw	a1,0(s7)
 592:	8556                	mv	a0,s5
 594:	00000097          	auipc	ra,0x0
 598:	e86080e7          	jalr	-378(ra) # 41a <printint>
 59c:	8bca                	mv	s7,s2
 59e:	4981                	li	s3,0
 5a0:	b7a5                	j	508 <vprintf+0x44>
 5a2:	008b8c13          	addi	s8,s7,8
 5a6:	000bb983          	ld	s3,0(s7)
 5aa:	03000593          	li	a1,48
 5ae:	8556                	mv	a0,s5
 5b0:	00000097          	auipc	ra,0x0
 5b4:	e48080e7          	jalr	-440(ra) # 3f8 <putc>
 5b8:	07800593          	li	a1,120
 5bc:	8556                	mv	a0,s5
 5be:	00000097          	auipc	ra,0x0
 5c2:	e3a080e7          	jalr	-454(ra) # 3f8 <putc>
 5c6:	4941                	li	s2,16
 5c8:	00000b97          	auipc	s7,0x0
 5cc:	330b8b93          	addi	s7,s7,816 # 8f8 <digits>
 5d0:	03c9d793          	srli	a5,s3,0x3c
 5d4:	97de                	add	a5,a5,s7
 5d6:	0007c583          	lbu	a1,0(a5)
 5da:	8556                	mv	a0,s5
 5dc:	00000097          	auipc	ra,0x0
 5e0:	e1c080e7          	jalr	-484(ra) # 3f8 <putc>
 5e4:	0992                	slli	s3,s3,0x4
 5e6:	397d                	addiw	s2,s2,-1
 5e8:	fe0914e3          	bnez	s2,5d0 <vprintf+0x10c>
 5ec:	8be2                	mv	s7,s8
 5ee:	4981                	li	s3,0
 5f0:	bf21                	j	508 <vprintf+0x44>
 5f2:	008b8993          	addi	s3,s7,8
 5f6:	000bb903          	ld	s2,0(s7)
 5fa:	02090163          	beqz	s2,61c <vprintf+0x158>
 5fe:	00094583          	lbu	a1,0(s2)
 602:	c9a5                	beqz	a1,672 <vprintf+0x1ae>
 604:	8556                	mv	a0,s5
 606:	00000097          	auipc	ra,0x0
 60a:	df2080e7          	jalr	-526(ra) # 3f8 <putc>
 60e:	0905                	addi	s2,s2,1
 610:	00094583          	lbu	a1,0(s2)
 614:	f9e5                	bnez	a1,604 <vprintf+0x140>
 616:	8bce                	mv	s7,s3
 618:	4981                	li	s3,0
 61a:	b5fd                	j	508 <vprintf+0x44>
 61c:	00000917          	auipc	s2,0x0
 620:	27c90913          	addi	s2,s2,636 # 898 <malloc+0x122>
 624:	02800593          	li	a1,40
 628:	bff1                	j	604 <vprintf+0x140>
 62a:	008b8913          	addi	s2,s7,8
 62e:	000bc583          	lbu	a1,0(s7)
 632:	8556                	mv	a0,s5
 634:	00000097          	auipc	ra,0x0
 638:	dc4080e7          	jalr	-572(ra) # 3f8 <putc>
 63c:	8bca                	mv	s7,s2
 63e:	4981                	li	s3,0
 640:	b5e1                	j	508 <vprintf+0x44>
 642:	02500593          	li	a1,37
 646:	8556                	mv	a0,s5
 648:	00000097          	auipc	ra,0x0
 64c:	db0080e7          	jalr	-592(ra) # 3f8 <putc>
 650:	4981                	li	s3,0
 652:	bd5d                	j	508 <vprintf+0x44>
 654:	02500593          	li	a1,37
 658:	8556                	mv	a0,s5
 65a:	00000097          	auipc	ra,0x0
 65e:	d9e080e7          	jalr	-610(ra) # 3f8 <putc>
 662:	85ca                	mv	a1,s2
 664:	8556                	mv	a0,s5
 666:	00000097          	auipc	ra,0x0
 66a:	d92080e7          	jalr	-622(ra) # 3f8 <putc>
 66e:	4981                	li	s3,0
 670:	bd61                	j	508 <vprintf+0x44>
 672:	8bce                	mv	s7,s3
 674:	4981                	li	s3,0
 676:	bd49                	j	508 <vprintf+0x44>
 678:	60a6                	ld	ra,72(sp)
 67a:	6406                	ld	s0,64(sp)
 67c:	74e2                	ld	s1,56(sp)
 67e:	7942                	ld	s2,48(sp)
 680:	79a2                	ld	s3,40(sp)
 682:	7a02                	ld	s4,32(sp)
 684:	6ae2                	ld	s5,24(sp)
 686:	6b42                	ld	s6,16(sp)
 688:	6ba2                	ld	s7,8(sp)
 68a:	6c02                	ld	s8,0(sp)
 68c:	6161                	addi	sp,sp,80
 68e:	8082                	ret

0000000000000690 <fprintf>:
 690:	715d                	addi	sp,sp,-80
 692:	ec06                	sd	ra,24(sp)
 694:	e822                	sd	s0,16(sp)
 696:	1000                	addi	s0,sp,32
 698:	e010                	sd	a2,0(s0)
 69a:	e414                	sd	a3,8(s0)
 69c:	e818                	sd	a4,16(s0)
 69e:	ec1c                	sd	a5,24(s0)
 6a0:	03043023          	sd	a6,32(s0)
 6a4:	03143423          	sd	a7,40(s0)
 6a8:	8622                	mv	a2,s0
 6aa:	fe843423          	sd	s0,-24(s0)
 6ae:	00000097          	auipc	ra,0x0
 6b2:	e16080e7          	jalr	-490(ra) # 4c4 <vprintf>
 6b6:	60e2                	ld	ra,24(sp)
 6b8:	6442                	ld	s0,16(sp)
 6ba:	6161                	addi	sp,sp,80
 6bc:	8082                	ret

00000000000006be <printf>:
 6be:	711d                	addi	sp,sp,-96
 6c0:	ec06                	sd	ra,24(sp)
 6c2:	e822                	sd	s0,16(sp)
 6c4:	1000                	addi	s0,sp,32
 6c6:	e40c                	sd	a1,8(s0)
 6c8:	e810                	sd	a2,16(s0)
 6ca:	ec14                	sd	a3,24(s0)
 6cc:	f018                	sd	a4,32(s0)
 6ce:	f41c                	sd	a5,40(s0)
 6d0:	03043823          	sd	a6,48(s0)
 6d4:	03143c23          	sd	a7,56(s0)
 6d8:	00840613          	addi	a2,s0,8
 6dc:	fec43423          	sd	a2,-24(s0)
 6e0:	85aa                	mv	a1,a0
 6e2:	4505                	li	a0,1
 6e4:	00000097          	auipc	ra,0x0
 6e8:	de0080e7          	jalr	-544(ra) # 4c4 <vprintf>
 6ec:	60e2                	ld	ra,24(sp)
 6ee:	6442                	ld	s0,16(sp)
 6f0:	6125                	addi	sp,sp,96
 6f2:	8082                	ret

00000000000006f4 <free>:
 6f4:	1141                	addi	sp,sp,-16
 6f6:	e422                	sd	s0,8(sp)
 6f8:	0800                	addi	s0,sp,16
 6fa:	ff050693          	addi	a3,a0,-16
 6fe:	00000797          	auipc	a5,0x0
 702:	2127b783          	ld	a5,530(a5) # 910 <freep>
 706:	a02d                	j	730 <free+0x3c>
 708:	4618                	lw	a4,8(a2)
 70a:	9f2d                	addw	a4,a4,a1
 70c:	fee52c23          	sw	a4,-8(a0)
 710:	6398                	ld	a4,0(a5)
 712:	6310                	ld	a2,0(a4)
 714:	a83d                	j	752 <free+0x5e>
 716:	ff852703          	lw	a4,-8(a0)
 71a:	9f31                	addw	a4,a4,a2
 71c:	c798                	sw	a4,8(a5)
 71e:	ff053683          	ld	a3,-16(a0)
 722:	a091                	j	766 <free+0x72>
 724:	6398                	ld	a4,0(a5)
 726:	00e7e463          	bltu	a5,a4,72e <free+0x3a>
 72a:	00e6ea63          	bltu	a3,a4,73e <free+0x4a>
 72e:	87ba                	mv	a5,a4
 730:	fed7fae3          	bgeu	a5,a3,724 <free+0x30>
 734:	6398                	ld	a4,0(a5)
 736:	00e6e463          	bltu	a3,a4,73e <free+0x4a>
 73a:	fee7eae3          	bltu	a5,a4,72e <free+0x3a>
 73e:	ff852583          	lw	a1,-8(a0)
 742:	6390                	ld	a2,0(a5)
 744:	02059813          	slli	a6,a1,0x20
 748:	01c85713          	srli	a4,a6,0x1c
 74c:	9736                	add	a4,a4,a3
 74e:	fae60de3          	beq	a2,a4,708 <free+0x14>
 752:	fec53823          	sd	a2,-16(a0)
 756:	4790                	lw	a2,8(a5)
 758:	02061593          	slli	a1,a2,0x20
 75c:	01c5d713          	srli	a4,a1,0x1c
 760:	973e                	add	a4,a4,a5
 762:	fae68ae3          	beq	a3,a4,716 <free+0x22>
 766:	e394                	sd	a3,0(a5)
 768:	00000717          	auipc	a4,0x0
 76c:	1af73423          	sd	a5,424(a4) # 910 <freep>
 770:	6422                	ld	s0,8(sp)
 772:	0141                	addi	sp,sp,16
 774:	8082                	ret

0000000000000776 <malloc>:
 776:	7139                	addi	sp,sp,-64
 778:	fc06                	sd	ra,56(sp)
 77a:	f822                	sd	s0,48(sp)
 77c:	f426                	sd	s1,40(sp)
 77e:	f04a                	sd	s2,32(sp)
 780:	ec4e                	sd	s3,24(sp)
 782:	e852                	sd	s4,16(sp)
 784:	e456                	sd	s5,8(sp)
 786:	e05a                	sd	s6,0(sp)
 788:	0080                	addi	s0,sp,64
 78a:	02051493          	slli	s1,a0,0x20
 78e:	9081                	srli	s1,s1,0x20
 790:	04bd                	addi	s1,s1,15
 792:	8091                	srli	s1,s1,0x4
 794:	0014899b          	addiw	s3,s1,1
 798:	0485                	addi	s1,s1,1
 79a:	00000517          	auipc	a0,0x0
 79e:	17653503          	ld	a0,374(a0) # 910 <freep>
 7a2:	c515                	beqz	a0,7ce <malloc+0x58>
 7a4:	611c                	ld	a5,0(a0)
 7a6:	4798                	lw	a4,8(a5)
 7a8:	04977063          	bgeu	a4,s1,7e8 <malloc+0x72>
 7ac:	8a4e                	mv	s4,s3
 7ae:	0009871b          	sext.w	a4,s3
 7b2:	6685                	lui	a3,0x1
 7b4:	00d77363          	bgeu	a4,a3,7ba <malloc+0x44>
 7b8:	6a05                	lui	s4,0x1
 7ba:	000a0b1b          	sext.w	s6,s4
 7be:	004a1a1b          	slliw	s4,s4,0x4
 7c2:	00000917          	auipc	s2,0x0
 7c6:	14e90913          	addi	s2,s2,334 # 910 <freep>
 7ca:	5afd                	li	s5,-1
 7cc:	a89d                	j	842 <malloc+0xcc>
 7ce:	00000717          	auipc	a4,0x0
 7d2:	14270713          	addi	a4,a4,322 # 910 <freep>
 7d6:	00000797          	auipc	a5,0x0
 7da:	14278793          	addi	a5,a5,322 # 918 <base>
 7de:	e31c                	sd	a5,0(a4)
 7e0:	e71c                	sd	a5,8(a4)
 7e2:	00072823          	sw	zero,16(a4)
 7e6:	b7d9                	j	7ac <malloc+0x36>
 7e8:	02e48c63          	beq	s1,a4,820 <malloc+0xaa>
 7ec:	4137073b          	subw	a4,a4,s3
 7f0:	c798                	sw	a4,8(a5)
 7f2:	02071693          	slli	a3,a4,0x20
 7f6:	01c6d713          	srli	a4,a3,0x1c
 7fa:	97ba                	add	a5,a5,a4
 7fc:	0137a423          	sw	s3,8(a5)
 800:	00000717          	auipc	a4,0x0
 804:	10a73823          	sd	a0,272(a4) # 910 <freep>
 808:	01078513          	addi	a0,a5,16
 80c:	70e2                	ld	ra,56(sp)
 80e:	7442                	ld	s0,48(sp)
 810:	74a2                	ld	s1,40(sp)
 812:	7902                	ld	s2,32(sp)
 814:	69e2                	ld	s3,24(sp)
 816:	6a42                	ld	s4,16(sp)
 818:	6aa2                	ld	s5,8(sp)
 81a:	6b02                	ld	s6,0(sp)
 81c:	6121                	addi	sp,sp,64
 81e:	8082                	ret
 820:	6398                	ld	a4,0(a5)
 822:	e118                	sd	a4,0(a0)
 824:	bff1                	j	800 <malloc+0x8a>
 826:	01652423          	sw	s6,8(a0)
 82a:	0541                	addi	a0,a0,16
 82c:	00000097          	auipc	ra,0x0
 830:	ec8080e7          	jalr	-312(ra) # 6f4 <free>
 834:	00093503          	ld	a0,0(s2)
 838:	d971                	beqz	a0,80c <malloc+0x96>
 83a:	611c                	ld	a5,0(a0)
 83c:	4798                	lw	a4,8(a5)
 83e:	fa9775e3          	bgeu	a4,s1,7e8 <malloc+0x72>
 842:	00093703          	ld	a4,0(s2)
 846:	853e                	mv	a0,a5
 848:	fef719e3          	bne	a4,a5,83a <malloc+0xc4>
 84c:	8552                	mv	a0,s4
 84e:	00000097          	auipc	ra,0x0
 852:	b52080e7          	jalr	-1198(ra) # 3a0 <sbrk>
 856:	fd5518e3          	bne	a0,s5,826 <malloc+0xb0>
 85a:	4501                	li	a0,0
 85c:	bf45                	j	80c <malloc+0x96>
