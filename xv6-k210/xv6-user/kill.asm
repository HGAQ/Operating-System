
xv6-user/_kill:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/include/stat.h"
#include "xv6-user/user.h"

int
main(int argc, char **argv)
{
   0:	1101                	addi	sp,sp,-32
   2:	ec06                	sd	ra,24(sp)
   4:	e822                	sd	s0,16(sp)
   6:	e426                	sd	s1,8(sp)
   8:	e04a                	sd	s2,0(sp)
   a:	1000                	addi	s0,sp,32
  int i;

  if(argc < 2){
   c:	4785                	li	a5,1
   e:	02a7dd63          	bge	a5,a0,48 <main+0x48>
  12:	00858493          	addi	s1,a1,8
  16:	ffe5091b          	addiw	s2,a0,-2
  1a:	02091793          	slli	a5,s2,0x20
  1e:	01d7d913          	srli	s2,a5,0x1d
  22:	05c1                	addi	a1,a1,16
  24:	992e                	add	s2,s2,a1
    fprintf(2, "usage: kill pid...\n");
    exit(1);
  }
  for(i=1; i<argc; i++)
    kill(atoi(argv[i]));
  26:	6088                	ld	a0,0(s1)
  28:	00000097          	auipc	ra,0x0
  2c:	1e2080e7          	jalr	482(ra) # 20a <atoi>
  30:	00000097          	auipc	ra,0x0
  34:	31c080e7          	jalr	796(ra) # 34c <kill>
  for(i=1; i<argc; i++)
  38:	04a1                	addi	s1,s1,8
  3a:	ff2496e3          	bne	s1,s2,26 <main+0x26>
  exit(0);
  3e:	4501                	li	a0,0
  40:	00000097          	auipc	ra,0x0
  44:	2dc080e7          	jalr	732(ra) # 31c <exit>
    fprintf(2, "usage: kill pid...\n");
  48:	00001597          	auipc	a1,0x1
  4c:	80858593          	addi	a1,a1,-2040 # 850 <malloc+0xee>
  50:	4509                	li	a0,2
  52:	00000097          	auipc	ra,0x0
  56:	62a080e7          	jalr	1578(ra) # 67c <fprintf>
    exit(1);
  5a:	4505                	li	a0,1
  5c:	00000097          	auipc	ra,0x0
  60:	2c0080e7          	jalr	704(ra) # 31c <exit>

0000000000000064 <strcpy>:
  64:	1141                	addi	sp,sp,-16
  66:	e422                	sd	s0,8(sp)
  68:	0800                	addi	s0,sp,16
  6a:	87aa                	mv	a5,a0
  6c:	0585                	addi	a1,a1,1
  6e:	0785                	addi	a5,a5,1
  70:	fff5c703          	lbu	a4,-1(a1)
  74:	fee78fa3          	sb	a4,-1(a5)
  78:	fb75                	bnez	a4,6c <strcpy+0x8>
  7a:	6422                	ld	s0,8(sp)
  7c:	0141                	addi	sp,sp,16
  7e:	8082                	ret

0000000000000080 <strcat>:
  80:	1141                	addi	sp,sp,-16
  82:	e422                	sd	s0,8(sp)
  84:	0800                	addi	s0,sp,16
  86:	00054783          	lbu	a5,0(a0)
  8a:	c385                	beqz	a5,aa <strcat+0x2a>
  8c:	87aa                	mv	a5,a0
  8e:	0785                	addi	a5,a5,1
  90:	0007c703          	lbu	a4,0(a5)
  94:	ff6d                	bnez	a4,8e <strcat+0xe>
  96:	0585                	addi	a1,a1,1
  98:	0785                	addi	a5,a5,1
  9a:	fff5c703          	lbu	a4,-1(a1)
  9e:	fee78fa3          	sb	a4,-1(a5)
  a2:	fb75                	bnez	a4,96 <strcat+0x16>
  a4:	6422                	ld	s0,8(sp)
  a6:	0141                	addi	sp,sp,16
  a8:	8082                	ret
  aa:	87aa                	mv	a5,a0
  ac:	b7ed                	j	96 <strcat+0x16>

00000000000000ae <strcmp>:
  ae:	1141                	addi	sp,sp,-16
  b0:	e422                	sd	s0,8(sp)
  b2:	0800                	addi	s0,sp,16
  b4:	00054783          	lbu	a5,0(a0)
  b8:	cb91                	beqz	a5,cc <strcmp+0x1e>
  ba:	0005c703          	lbu	a4,0(a1)
  be:	00f71763          	bne	a4,a5,cc <strcmp+0x1e>
  c2:	0505                	addi	a0,a0,1
  c4:	0585                	addi	a1,a1,1
  c6:	00054783          	lbu	a5,0(a0)
  ca:	fbe5                	bnez	a5,ba <strcmp+0xc>
  cc:	0005c503          	lbu	a0,0(a1)
  d0:	40a7853b          	subw	a0,a5,a0
  d4:	6422                	ld	s0,8(sp)
  d6:	0141                	addi	sp,sp,16
  d8:	8082                	ret

00000000000000da <strlen>:
  da:	1141                	addi	sp,sp,-16
  dc:	e422                	sd	s0,8(sp)
  de:	0800                	addi	s0,sp,16
  e0:	00054783          	lbu	a5,0(a0)
  e4:	cf91                	beqz	a5,100 <strlen+0x26>
  e6:	0505                	addi	a0,a0,1
  e8:	87aa                	mv	a5,a0
  ea:	86be                	mv	a3,a5
  ec:	0785                	addi	a5,a5,1
  ee:	fff7c703          	lbu	a4,-1(a5)
  f2:	ff65                	bnez	a4,ea <strlen+0x10>
  f4:	40a6853b          	subw	a0,a3,a0
  f8:	2505                	addiw	a0,a0,1
  fa:	6422                	ld	s0,8(sp)
  fc:	0141                	addi	sp,sp,16
  fe:	8082                	ret
 100:	4501                	li	a0,0
 102:	bfe5                	j	fa <strlen+0x20>

0000000000000104 <memset>:
 104:	1141                	addi	sp,sp,-16
 106:	e422                	sd	s0,8(sp)
 108:	0800                	addi	s0,sp,16
 10a:	ca19                	beqz	a2,120 <memset+0x1c>
 10c:	87aa                	mv	a5,a0
 10e:	1602                	slli	a2,a2,0x20
 110:	9201                	srli	a2,a2,0x20
 112:	00a60733          	add	a4,a2,a0
 116:	00b78023          	sb	a1,0(a5)
 11a:	0785                	addi	a5,a5,1
 11c:	fee79de3          	bne	a5,a4,116 <memset+0x12>
 120:	6422                	ld	s0,8(sp)
 122:	0141                	addi	sp,sp,16
 124:	8082                	ret

0000000000000126 <strchr>:
 126:	1141                	addi	sp,sp,-16
 128:	e422                	sd	s0,8(sp)
 12a:	0800                	addi	s0,sp,16
 12c:	00054783          	lbu	a5,0(a0)
 130:	cb99                	beqz	a5,146 <strchr+0x20>
 132:	00f58763          	beq	a1,a5,140 <strchr+0x1a>
 136:	0505                	addi	a0,a0,1
 138:	00054783          	lbu	a5,0(a0)
 13c:	fbfd                	bnez	a5,132 <strchr+0xc>
 13e:	4501                	li	a0,0
 140:	6422                	ld	s0,8(sp)
 142:	0141                	addi	sp,sp,16
 144:	8082                	ret
 146:	4501                	li	a0,0
 148:	bfe5                	j	140 <strchr+0x1a>

000000000000014a <gets>:
 14a:	711d                	addi	sp,sp,-96
 14c:	ec86                	sd	ra,88(sp)
 14e:	e8a2                	sd	s0,80(sp)
 150:	e4a6                	sd	s1,72(sp)
 152:	e0ca                	sd	s2,64(sp)
 154:	fc4e                	sd	s3,56(sp)
 156:	f852                	sd	s4,48(sp)
 158:	f456                	sd	s5,40(sp)
 15a:	f05a                	sd	s6,32(sp)
 15c:	ec5e                	sd	s7,24(sp)
 15e:	e862                	sd	s8,16(sp)
 160:	1080                	addi	s0,sp,96
 162:	8baa                	mv	s7,a0
 164:	8a2e                	mv	s4,a1
 166:	892a                	mv	s2,a0
 168:	4481                	li	s1,0
 16a:	faf40a93          	addi	s5,s0,-81
 16e:	4b29                	li	s6,10
 170:	4c35                	li	s8,13
 172:	89a6                	mv	s3,s1
 174:	2485                	addiw	s1,s1,1
 176:	0344d763          	bge	s1,s4,1a4 <gets+0x5a>
 17a:	4605                	li	a2,1
 17c:	85d6                	mv	a1,s5
 17e:	4501                	li	a0,0
 180:	00000097          	auipc	ra,0x0
 184:	1b4080e7          	jalr	436(ra) # 334 <read>
 188:	00a05e63          	blez	a0,1a4 <gets+0x5a>
 18c:	faf44783          	lbu	a5,-81(s0)
 190:	00f90023          	sb	a5,0(s2)
 194:	01678763          	beq	a5,s6,1a2 <gets+0x58>
 198:	0905                	addi	s2,s2,1
 19a:	fd879ce3          	bne	a5,s8,172 <gets+0x28>
 19e:	89a6                	mv	s3,s1
 1a0:	a011                	j	1a4 <gets+0x5a>
 1a2:	89a6                	mv	s3,s1
 1a4:	99de                	add	s3,s3,s7
 1a6:	00098023          	sb	zero,0(s3)
 1aa:	855e                	mv	a0,s7
 1ac:	60e6                	ld	ra,88(sp)
 1ae:	6446                	ld	s0,80(sp)
 1b0:	64a6                	ld	s1,72(sp)
 1b2:	6906                	ld	s2,64(sp)
 1b4:	79e2                	ld	s3,56(sp)
 1b6:	7a42                	ld	s4,48(sp)
 1b8:	7aa2                	ld	s5,40(sp)
 1ba:	7b02                	ld	s6,32(sp)
 1bc:	6be2                	ld	s7,24(sp)
 1be:	6c42                	ld	s8,16(sp)
 1c0:	6125                	addi	sp,sp,96
 1c2:	8082                	ret

00000000000001c4 <stat>:
 1c4:	1101                	addi	sp,sp,-32
 1c6:	ec06                	sd	ra,24(sp)
 1c8:	e822                	sd	s0,16(sp)
 1ca:	e426                	sd	s1,8(sp)
 1cc:	e04a                	sd	s2,0(sp)
 1ce:	1000                	addi	s0,sp,32
 1d0:	892e                	mv	s2,a1
 1d2:	4581                	li	a1,0
 1d4:	00000097          	auipc	ra,0x0
 1d8:	188080e7          	jalr	392(ra) # 35c <open>
 1dc:	02054563          	bltz	a0,206 <stat+0x42>
 1e0:	84aa                	mv	s1,a0
 1e2:	85ca                	mv	a1,s2
 1e4:	00000097          	auipc	ra,0x0
 1e8:	180080e7          	jalr	384(ra) # 364 <fstat>
 1ec:	892a                	mv	s2,a0
 1ee:	8526                	mv	a0,s1
 1f0:	00000097          	auipc	ra,0x0
 1f4:	154080e7          	jalr	340(ra) # 344 <close>
 1f8:	854a                	mv	a0,s2
 1fa:	60e2                	ld	ra,24(sp)
 1fc:	6442                	ld	s0,16(sp)
 1fe:	64a2                	ld	s1,8(sp)
 200:	6902                	ld	s2,0(sp)
 202:	6105                	addi	sp,sp,32
 204:	8082                	ret
 206:	597d                	li	s2,-1
 208:	bfc5                	j	1f8 <stat+0x34>

000000000000020a <atoi>:
 20a:	1141                	addi	sp,sp,-16
 20c:	e422                	sd	s0,8(sp)
 20e:	0800                	addi	s0,sp,16
 210:	00054703          	lbu	a4,0(a0)
 214:	02d00793          	li	a5,45
 218:	4585                	li	a1,1
 21a:	04f70363          	beq	a4,a5,260 <atoi+0x56>
 21e:	00054703          	lbu	a4,0(a0)
 222:	fd07079b          	addiw	a5,a4,-48
 226:	0ff7f793          	zext.b	a5,a5
 22a:	46a5                	li	a3,9
 22c:	02f6ed63          	bltu	a3,a5,266 <atoi+0x5c>
 230:	4681                	li	a3,0
 232:	4625                	li	a2,9
 234:	0505                	addi	a0,a0,1
 236:	0026979b          	slliw	a5,a3,0x2
 23a:	9fb5                	addw	a5,a5,a3
 23c:	0017979b          	slliw	a5,a5,0x1
 240:	9fb9                	addw	a5,a5,a4
 242:	fd07869b          	addiw	a3,a5,-48
 246:	00054703          	lbu	a4,0(a0)
 24a:	fd07079b          	addiw	a5,a4,-48
 24e:	0ff7f793          	zext.b	a5,a5
 252:	fef671e3          	bgeu	a2,a5,234 <atoi+0x2a>
 256:	02d5853b          	mulw	a0,a1,a3
 25a:	6422                	ld	s0,8(sp)
 25c:	0141                	addi	sp,sp,16
 25e:	8082                	ret
 260:	0505                	addi	a0,a0,1
 262:	55fd                	li	a1,-1
 264:	bf6d                	j	21e <atoi+0x14>
 266:	4681                	li	a3,0
 268:	b7fd                	j	256 <atoi+0x4c>

000000000000026a <memmove>:
 26a:	1141                	addi	sp,sp,-16
 26c:	e422                	sd	s0,8(sp)
 26e:	0800                	addi	s0,sp,16
 270:	02b57463          	bgeu	a0,a1,298 <memmove+0x2e>
 274:	00c05f63          	blez	a2,292 <memmove+0x28>
 278:	1602                	slli	a2,a2,0x20
 27a:	9201                	srli	a2,a2,0x20
 27c:	00c507b3          	add	a5,a0,a2
 280:	872a                	mv	a4,a0
 282:	0585                	addi	a1,a1,1
 284:	0705                	addi	a4,a4,1
 286:	fff5c683          	lbu	a3,-1(a1)
 28a:	fed70fa3          	sb	a3,-1(a4)
 28e:	fee79ae3          	bne	a5,a4,282 <memmove+0x18>
 292:	6422                	ld	s0,8(sp)
 294:	0141                	addi	sp,sp,16
 296:	8082                	ret
 298:	00c50733          	add	a4,a0,a2
 29c:	95b2                	add	a1,a1,a2
 29e:	fec05ae3          	blez	a2,292 <memmove+0x28>
 2a2:	fff6079b          	addiw	a5,a2,-1
 2a6:	1782                	slli	a5,a5,0x20
 2a8:	9381                	srli	a5,a5,0x20
 2aa:	fff7c793          	not	a5,a5
 2ae:	97ba                	add	a5,a5,a4
 2b0:	15fd                	addi	a1,a1,-1
 2b2:	177d                	addi	a4,a4,-1
 2b4:	0005c683          	lbu	a3,0(a1)
 2b8:	00d70023          	sb	a3,0(a4)
 2bc:	fee79ae3          	bne	a5,a4,2b0 <memmove+0x46>
 2c0:	bfc9                	j	292 <memmove+0x28>

00000000000002c2 <memcmp>:
 2c2:	1141                	addi	sp,sp,-16
 2c4:	e422                	sd	s0,8(sp)
 2c6:	0800                	addi	s0,sp,16
 2c8:	ca05                	beqz	a2,2f8 <memcmp+0x36>
 2ca:	fff6069b          	addiw	a3,a2,-1
 2ce:	1682                	slli	a3,a3,0x20
 2d0:	9281                	srli	a3,a3,0x20
 2d2:	0685                	addi	a3,a3,1
 2d4:	96aa                	add	a3,a3,a0
 2d6:	00054783          	lbu	a5,0(a0)
 2da:	0005c703          	lbu	a4,0(a1)
 2de:	00e79863          	bne	a5,a4,2ee <memcmp+0x2c>
 2e2:	0505                	addi	a0,a0,1
 2e4:	0585                	addi	a1,a1,1
 2e6:	fed518e3          	bne	a0,a3,2d6 <memcmp+0x14>
 2ea:	4501                	li	a0,0
 2ec:	a019                	j	2f2 <memcmp+0x30>
 2ee:	40e7853b          	subw	a0,a5,a4
 2f2:	6422                	ld	s0,8(sp)
 2f4:	0141                	addi	sp,sp,16
 2f6:	8082                	ret
 2f8:	4501                	li	a0,0
 2fa:	bfe5                	j	2f2 <memcmp+0x30>

00000000000002fc <memcpy>:
 2fc:	1141                	addi	sp,sp,-16
 2fe:	e406                	sd	ra,8(sp)
 300:	e022                	sd	s0,0(sp)
 302:	0800                	addi	s0,sp,16
 304:	00000097          	auipc	ra,0x0
 308:	f66080e7          	jalr	-154(ra) # 26a <memmove>
 30c:	60a2                	ld	ra,8(sp)
 30e:	6402                	ld	s0,0(sp)
 310:	0141                	addi	sp,sp,16
 312:	8082                	ret

0000000000000314 <fork>:
 314:	4885                	li	a7,1
 316:	00000073          	ecall
 31a:	8082                	ret

000000000000031c <exit>:
 31c:	4889                	li	a7,2
 31e:	00000073          	ecall
 322:	8082                	ret

0000000000000324 <wait>:
 324:	488d                	li	a7,3
 326:	00000073          	ecall
 32a:	8082                	ret

000000000000032c <pipe>:
 32c:	4891                	li	a7,4
 32e:	00000073          	ecall
 332:	8082                	ret

0000000000000334 <read>:
 334:	4895                	li	a7,5
 336:	00000073          	ecall
 33a:	8082                	ret

000000000000033c <write>:
 33c:	48c1                	li	a7,16
 33e:	00000073          	ecall
 342:	8082                	ret

0000000000000344 <close>:
 344:	48d5                	li	a7,21
 346:	00000073          	ecall
 34a:	8082                	ret

000000000000034c <kill>:
 34c:	4899                	li	a7,6
 34e:	00000073          	ecall
 352:	8082                	ret

0000000000000354 <exec>:
 354:	489d                	li	a7,7
 356:	00000073          	ecall
 35a:	8082                	ret

000000000000035c <open>:
 35c:	48bd                	li	a7,15
 35e:	00000073          	ecall
 362:	8082                	ret

0000000000000364 <fstat>:
 364:	48a1                	li	a7,8
 366:	00000073          	ecall
 36a:	8082                	ret

000000000000036c <mkdir>:
 36c:	48d1                	li	a7,20
 36e:	00000073          	ecall
 372:	8082                	ret

0000000000000374 <chdir>:
 374:	48a5                	li	a7,9
 376:	00000073          	ecall
 37a:	8082                	ret

000000000000037c <dup>:
 37c:	48a9                	li	a7,10
 37e:	00000073          	ecall
 382:	8082                	ret

0000000000000384 <getpid>:
 384:	48ad                	li	a7,11
 386:	00000073          	ecall
 38a:	8082                	ret

000000000000038c <sbrk>:
 38c:	48b1                	li	a7,12
 38e:	00000073          	ecall
 392:	8082                	ret

0000000000000394 <sleep>:
 394:	48b5                	li	a7,13
 396:	00000073          	ecall
 39a:	8082                	ret

000000000000039c <uptime>:
 39c:	48b9                	li	a7,14
 39e:	00000073          	ecall
 3a2:	8082                	ret

00000000000003a4 <test_proc>:
 3a4:	48d9                	li	a7,22
 3a6:	00000073          	ecall
 3aa:	8082                	ret

00000000000003ac <dev>:
 3ac:	48dd                	li	a7,23
 3ae:	00000073          	ecall
 3b2:	8082                	ret

00000000000003b4 <readdir>:
 3b4:	48e1                	li	a7,24
 3b6:	00000073          	ecall
 3ba:	8082                	ret

00000000000003bc <getcwd>:
 3bc:	48e5                	li	a7,25
 3be:	00000073          	ecall
 3c2:	8082                	ret

00000000000003c4 <remove>:
 3c4:	48c5                	li	a7,17
 3c6:	00000073          	ecall
 3ca:	8082                	ret

00000000000003cc <trace>:
 3cc:	48c9                	li	a7,18
 3ce:	00000073          	ecall
 3d2:	8082                	ret

00000000000003d4 <sysinfo>:
 3d4:	48cd                	li	a7,19
 3d6:	00000073          	ecall
 3da:	8082                	ret

00000000000003dc <rename>:
 3dc:	48e9                	li	a7,26
 3de:	00000073          	ecall
 3e2:	8082                	ret

00000000000003e4 <putc>:
 3e4:	1101                	addi	sp,sp,-32
 3e6:	ec06                	sd	ra,24(sp)
 3e8:	e822                	sd	s0,16(sp)
 3ea:	1000                	addi	s0,sp,32
 3ec:	feb407a3          	sb	a1,-17(s0)
 3f0:	4605                	li	a2,1
 3f2:	fef40593          	addi	a1,s0,-17
 3f6:	00000097          	auipc	ra,0x0
 3fa:	f46080e7          	jalr	-186(ra) # 33c <write>
 3fe:	60e2                	ld	ra,24(sp)
 400:	6442                	ld	s0,16(sp)
 402:	6105                	addi	sp,sp,32
 404:	8082                	ret

0000000000000406 <printint>:
 406:	7139                	addi	sp,sp,-64
 408:	fc06                	sd	ra,56(sp)
 40a:	f822                	sd	s0,48(sp)
 40c:	f426                	sd	s1,40(sp)
 40e:	f04a                	sd	s2,32(sp)
 410:	ec4e                	sd	s3,24(sp)
 412:	0080                	addi	s0,sp,64
 414:	84aa                	mv	s1,a0
 416:	c299                	beqz	a3,41c <printint+0x16>
 418:	0805c863          	bltz	a1,4a8 <printint+0xa2>
 41c:	2581                	sext.w	a1,a1
 41e:	4881                	li	a7,0
 420:	fc040993          	addi	s3,s0,-64
 424:	86ce                	mv	a3,s3
 426:	4701                	li	a4,0
 428:	2601                	sext.w	a2,a2
 42a:	00000517          	auipc	a0,0x0
 42e:	49e50513          	addi	a0,a0,1182 # 8c8 <digits>
 432:	883a                	mv	a6,a4
 434:	2705                	addiw	a4,a4,1
 436:	02c5f7bb          	remuw	a5,a1,a2
 43a:	1782                	slli	a5,a5,0x20
 43c:	9381                	srli	a5,a5,0x20
 43e:	97aa                	add	a5,a5,a0
 440:	0007c783          	lbu	a5,0(a5)
 444:	00f68023          	sb	a5,0(a3)
 448:	0005879b          	sext.w	a5,a1
 44c:	02c5d5bb          	divuw	a1,a1,a2
 450:	0685                	addi	a3,a3,1
 452:	fec7f0e3          	bgeu	a5,a2,432 <printint+0x2c>
 456:	00088c63          	beqz	a7,46e <printint+0x68>
 45a:	fd070793          	addi	a5,a4,-48
 45e:	00878733          	add	a4,a5,s0
 462:	02d00793          	li	a5,45
 466:	fef70823          	sb	a5,-16(a4)
 46a:	0028071b          	addiw	a4,a6,2
 46e:	02e05663          	blez	a4,49a <printint+0x94>
 472:	fc040913          	addi	s2,s0,-64
 476:	993a                	add	s2,s2,a4
 478:	19fd                	addi	s3,s3,-1
 47a:	99ba                	add	s3,s3,a4
 47c:	377d                	addiw	a4,a4,-1
 47e:	1702                	slli	a4,a4,0x20
 480:	9301                	srli	a4,a4,0x20
 482:	40e989b3          	sub	s3,s3,a4
 486:	fff94583          	lbu	a1,-1(s2)
 48a:	8526                	mv	a0,s1
 48c:	00000097          	auipc	ra,0x0
 490:	f58080e7          	jalr	-168(ra) # 3e4 <putc>
 494:	197d                	addi	s2,s2,-1
 496:	ff3918e3          	bne	s2,s3,486 <printint+0x80>
 49a:	70e2                	ld	ra,56(sp)
 49c:	7442                	ld	s0,48(sp)
 49e:	74a2                	ld	s1,40(sp)
 4a0:	7902                	ld	s2,32(sp)
 4a2:	69e2                	ld	s3,24(sp)
 4a4:	6121                	addi	sp,sp,64
 4a6:	8082                	ret
 4a8:	40b005bb          	negw	a1,a1
 4ac:	4885                	li	a7,1
 4ae:	bf8d                	j	420 <printint+0x1a>

00000000000004b0 <vprintf>:
 4b0:	715d                	addi	sp,sp,-80
 4b2:	e486                	sd	ra,72(sp)
 4b4:	e0a2                	sd	s0,64(sp)
 4b6:	fc26                	sd	s1,56(sp)
 4b8:	f84a                	sd	s2,48(sp)
 4ba:	f44e                	sd	s3,40(sp)
 4bc:	f052                	sd	s4,32(sp)
 4be:	ec56                	sd	s5,24(sp)
 4c0:	e85a                	sd	s6,16(sp)
 4c2:	e45e                	sd	s7,8(sp)
 4c4:	e062                	sd	s8,0(sp)
 4c6:	0880                	addi	s0,sp,80
 4c8:	0005c903          	lbu	s2,0(a1)
 4cc:	18090c63          	beqz	s2,664 <vprintf+0x1b4>
 4d0:	8aaa                	mv	s5,a0
 4d2:	8bb2                	mv	s7,a2
 4d4:	00158493          	addi	s1,a1,1
 4d8:	4981                	li	s3,0
 4da:	02500a13          	li	s4,37
 4de:	4b55                	li	s6,21
 4e0:	a839                	j	4fe <vprintf+0x4e>
 4e2:	85ca                	mv	a1,s2
 4e4:	8556                	mv	a0,s5
 4e6:	00000097          	auipc	ra,0x0
 4ea:	efe080e7          	jalr	-258(ra) # 3e4 <putc>
 4ee:	a019                	j	4f4 <vprintf+0x44>
 4f0:	01498d63          	beq	s3,s4,50a <vprintf+0x5a>
 4f4:	0485                	addi	s1,s1,1
 4f6:	fff4c903          	lbu	s2,-1(s1)
 4fa:	16090563          	beqz	s2,664 <vprintf+0x1b4>
 4fe:	fe0999e3          	bnez	s3,4f0 <vprintf+0x40>
 502:	ff4910e3          	bne	s2,s4,4e2 <vprintf+0x32>
 506:	89d2                	mv	s3,s4
 508:	b7f5                	j	4f4 <vprintf+0x44>
 50a:	13490263          	beq	s2,s4,62e <vprintf+0x17e>
 50e:	f9d9079b          	addiw	a5,s2,-99
 512:	0ff7f793          	zext.b	a5,a5
 516:	12fb6563          	bltu	s6,a5,640 <vprintf+0x190>
 51a:	f9d9079b          	addiw	a5,s2,-99
 51e:	0ff7f713          	zext.b	a4,a5
 522:	10eb6f63          	bltu	s6,a4,640 <vprintf+0x190>
 526:	00271793          	slli	a5,a4,0x2
 52a:	00000717          	auipc	a4,0x0
 52e:	34670713          	addi	a4,a4,838 # 870 <malloc+0x10e>
 532:	97ba                	add	a5,a5,a4
 534:	439c                	lw	a5,0(a5)
 536:	97ba                	add	a5,a5,a4
 538:	8782                	jr	a5
 53a:	008b8913          	addi	s2,s7,8
 53e:	4685                	li	a3,1
 540:	4629                	li	a2,10
 542:	000ba583          	lw	a1,0(s7)
 546:	8556                	mv	a0,s5
 548:	00000097          	auipc	ra,0x0
 54c:	ebe080e7          	jalr	-322(ra) # 406 <printint>
 550:	8bca                	mv	s7,s2
 552:	4981                	li	s3,0
 554:	b745                	j	4f4 <vprintf+0x44>
 556:	008b8913          	addi	s2,s7,8
 55a:	4681                	li	a3,0
 55c:	4629                	li	a2,10
 55e:	000ba583          	lw	a1,0(s7)
 562:	8556                	mv	a0,s5
 564:	00000097          	auipc	ra,0x0
 568:	ea2080e7          	jalr	-350(ra) # 406 <printint>
 56c:	8bca                	mv	s7,s2
 56e:	4981                	li	s3,0
 570:	b751                	j	4f4 <vprintf+0x44>
 572:	008b8913          	addi	s2,s7,8
 576:	4681                	li	a3,0
 578:	4641                	li	a2,16
 57a:	000ba583          	lw	a1,0(s7)
 57e:	8556                	mv	a0,s5
 580:	00000097          	auipc	ra,0x0
 584:	e86080e7          	jalr	-378(ra) # 406 <printint>
 588:	8bca                	mv	s7,s2
 58a:	4981                	li	s3,0
 58c:	b7a5                	j	4f4 <vprintf+0x44>
 58e:	008b8c13          	addi	s8,s7,8
 592:	000bb983          	ld	s3,0(s7)
 596:	03000593          	li	a1,48
 59a:	8556                	mv	a0,s5
 59c:	00000097          	auipc	ra,0x0
 5a0:	e48080e7          	jalr	-440(ra) # 3e4 <putc>
 5a4:	07800593          	li	a1,120
 5a8:	8556                	mv	a0,s5
 5aa:	00000097          	auipc	ra,0x0
 5ae:	e3a080e7          	jalr	-454(ra) # 3e4 <putc>
 5b2:	4941                	li	s2,16
 5b4:	00000b97          	auipc	s7,0x0
 5b8:	314b8b93          	addi	s7,s7,788 # 8c8 <digits>
 5bc:	03c9d793          	srli	a5,s3,0x3c
 5c0:	97de                	add	a5,a5,s7
 5c2:	0007c583          	lbu	a1,0(a5)
 5c6:	8556                	mv	a0,s5
 5c8:	00000097          	auipc	ra,0x0
 5cc:	e1c080e7          	jalr	-484(ra) # 3e4 <putc>
 5d0:	0992                	slli	s3,s3,0x4
 5d2:	397d                	addiw	s2,s2,-1
 5d4:	fe0914e3          	bnez	s2,5bc <vprintf+0x10c>
 5d8:	8be2                	mv	s7,s8
 5da:	4981                	li	s3,0
 5dc:	bf21                	j	4f4 <vprintf+0x44>
 5de:	008b8993          	addi	s3,s7,8
 5e2:	000bb903          	ld	s2,0(s7)
 5e6:	02090163          	beqz	s2,608 <vprintf+0x158>
 5ea:	00094583          	lbu	a1,0(s2)
 5ee:	c9a5                	beqz	a1,65e <vprintf+0x1ae>
 5f0:	8556                	mv	a0,s5
 5f2:	00000097          	auipc	ra,0x0
 5f6:	df2080e7          	jalr	-526(ra) # 3e4 <putc>
 5fa:	0905                	addi	s2,s2,1
 5fc:	00094583          	lbu	a1,0(s2)
 600:	f9e5                	bnez	a1,5f0 <vprintf+0x140>
 602:	8bce                	mv	s7,s3
 604:	4981                	li	s3,0
 606:	b5fd                	j	4f4 <vprintf+0x44>
 608:	00000917          	auipc	s2,0x0
 60c:	26090913          	addi	s2,s2,608 # 868 <malloc+0x106>
 610:	02800593          	li	a1,40
 614:	bff1                	j	5f0 <vprintf+0x140>
 616:	008b8913          	addi	s2,s7,8
 61a:	000bc583          	lbu	a1,0(s7)
 61e:	8556                	mv	a0,s5
 620:	00000097          	auipc	ra,0x0
 624:	dc4080e7          	jalr	-572(ra) # 3e4 <putc>
 628:	8bca                	mv	s7,s2
 62a:	4981                	li	s3,0
 62c:	b5e1                	j	4f4 <vprintf+0x44>
 62e:	02500593          	li	a1,37
 632:	8556                	mv	a0,s5
 634:	00000097          	auipc	ra,0x0
 638:	db0080e7          	jalr	-592(ra) # 3e4 <putc>
 63c:	4981                	li	s3,0
 63e:	bd5d                	j	4f4 <vprintf+0x44>
 640:	02500593          	li	a1,37
 644:	8556                	mv	a0,s5
 646:	00000097          	auipc	ra,0x0
 64a:	d9e080e7          	jalr	-610(ra) # 3e4 <putc>
 64e:	85ca                	mv	a1,s2
 650:	8556                	mv	a0,s5
 652:	00000097          	auipc	ra,0x0
 656:	d92080e7          	jalr	-622(ra) # 3e4 <putc>
 65a:	4981                	li	s3,0
 65c:	bd61                	j	4f4 <vprintf+0x44>
 65e:	8bce                	mv	s7,s3
 660:	4981                	li	s3,0
 662:	bd49                	j	4f4 <vprintf+0x44>
 664:	60a6                	ld	ra,72(sp)
 666:	6406                	ld	s0,64(sp)
 668:	74e2                	ld	s1,56(sp)
 66a:	7942                	ld	s2,48(sp)
 66c:	79a2                	ld	s3,40(sp)
 66e:	7a02                	ld	s4,32(sp)
 670:	6ae2                	ld	s5,24(sp)
 672:	6b42                	ld	s6,16(sp)
 674:	6ba2                	ld	s7,8(sp)
 676:	6c02                	ld	s8,0(sp)
 678:	6161                	addi	sp,sp,80
 67a:	8082                	ret

000000000000067c <fprintf>:
 67c:	715d                	addi	sp,sp,-80
 67e:	ec06                	sd	ra,24(sp)
 680:	e822                	sd	s0,16(sp)
 682:	1000                	addi	s0,sp,32
 684:	e010                	sd	a2,0(s0)
 686:	e414                	sd	a3,8(s0)
 688:	e818                	sd	a4,16(s0)
 68a:	ec1c                	sd	a5,24(s0)
 68c:	03043023          	sd	a6,32(s0)
 690:	03143423          	sd	a7,40(s0)
 694:	8622                	mv	a2,s0
 696:	fe843423          	sd	s0,-24(s0)
 69a:	00000097          	auipc	ra,0x0
 69e:	e16080e7          	jalr	-490(ra) # 4b0 <vprintf>
 6a2:	60e2                	ld	ra,24(sp)
 6a4:	6442                	ld	s0,16(sp)
 6a6:	6161                	addi	sp,sp,80
 6a8:	8082                	ret

00000000000006aa <printf>:
 6aa:	711d                	addi	sp,sp,-96
 6ac:	ec06                	sd	ra,24(sp)
 6ae:	e822                	sd	s0,16(sp)
 6b0:	1000                	addi	s0,sp,32
 6b2:	e40c                	sd	a1,8(s0)
 6b4:	e810                	sd	a2,16(s0)
 6b6:	ec14                	sd	a3,24(s0)
 6b8:	f018                	sd	a4,32(s0)
 6ba:	f41c                	sd	a5,40(s0)
 6bc:	03043823          	sd	a6,48(s0)
 6c0:	03143c23          	sd	a7,56(s0)
 6c4:	00840613          	addi	a2,s0,8
 6c8:	fec43423          	sd	a2,-24(s0)
 6cc:	85aa                	mv	a1,a0
 6ce:	4505                	li	a0,1
 6d0:	00000097          	auipc	ra,0x0
 6d4:	de0080e7          	jalr	-544(ra) # 4b0 <vprintf>
 6d8:	60e2                	ld	ra,24(sp)
 6da:	6442                	ld	s0,16(sp)
 6dc:	6125                	addi	sp,sp,96
 6de:	8082                	ret

00000000000006e0 <free>:
 6e0:	1141                	addi	sp,sp,-16
 6e2:	e422                	sd	s0,8(sp)
 6e4:	0800                	addi	s0,sp,16
 6e6:	ff050693          	addi	a3,a0,-16
 6ea:	00000797          	auipc	a5,0x0
 6ee:	1f67b783          	ld	a5,502(a5) # 8e0 <freep>
 6f2:	a02d                	j	71c <free+0x3c>
 6f4:	4618                	lw	a4,8(a2)
 6f6:	9f2d                	addw	a4,a4,a1
 6f8:	fee52c23          	sw	a4,-8(a0)
 6fc:	6398                	ld	a4,0(a5)
 6fe:	6310                	ld	a2,0(a4)
 700:	a83d                	j	73e <free+0x5e>
 702:	ff852703          	lw	a4,-8(a0)
 706:	9f31                	addw	a4,a4,a2
 708:	c798                	sw	a4,8(a5)
 70a:	ff053683          	ld	a3,-16(a0)
 70e:	a091                	j	752 <free+0x72>
 710:	6398                	ld	a4,0(a5)
 712:	00e7e463          	bltu	a5,a4,71a <free+0x3a>
 716:	00e6ea63          	bltu	a3,a4,72a <free+0x4a>
 71a:	87ba                	mv	a5,a4
 71c:	fed7fae3          	bgeu	a5,a3,710 <free+0x30>
 720:	6398                	ld	a4,0(a5)
 722:	00e6e463          	bltu	a3,a4,72a <free+0x4a>
 726:	fee7eae3          	bltu	a5,a4,71a <free+0x3a>
 72a:	ff852583          	lw	a1,-8(a0)
 72e:	6390                	ld	a2,0(a5)
 730:	02059813          	slli	a6,a1,0x20
 734:	01c85713          	srli	a4,a6,0x1c
 738:	9736                	add	a4,a4,a3
 73a:	fae60de3          	beq	a2,a4,6f4 <free+0x14>
 73e:	fec53823          	sd	a2,-16(a0)
 742:	4790                	lw	a2,8(a5)
 744:	02061593          	slli	a1,a2,0x20
 748:	01c5d713          	srli	a4,a1,0x1c
 74c:	973e                	add	a4,a4,a5
 74e:	fae68ae3          	beq	a3,a4,702 <free+0x22>
 752:	e394                	sd	a3,0(a5)
 754:	00000717          	auipc	a4,0x0
 758:	18f73623          	sd	a5,396(a4) # 8e0 <freep>
 75c:	6422                	ld	s0,8(sp)
 75e:	0141                	addi	sp,sp,16
 760:	8082                	ret

0000000000000762 <malloc>:
 762:	7139                	addi	sp,sp,-64
 764:	fc06                	sd	ra,56(sp)
 766:	f822                	sd	s0,48(sp)
 768:	f426                	sd	s1,40(sp)
 76a:	f04a                	sd	s2,32(sp)
 76c:	ec4e                	sd	s3,24(sp)
 76e:	e852                	sd	s4,16(sp)
 770:	e456                	sd	s5,8(sp)
 772:	e05a                	sd	s6,0(sp)
 774:	0080                	addi	s0,sp,64
 776:	02051493          	slli	s1,a0,0x20
 77a:	9081                	srli	s1,s1,0x20
 77c:	04bd                	addi	s1,s1,15
 77e:	8091                	srli	s1,s1,0x4
 780:	0014899b          	addiw	s3,s1,1
 784:	0485                	addi	s1,s1,1
 786:	00000517          	auipc	a0,0x0
 78a:	15a53503          	ld	a0,346(a0) # 8e0 <freep>
 78e:	c515                	beqz	a0,7ba <malloc+0x58>
 790:	611c                	ld	a5,0(a0)
 792:	4798                	lw	a4,8(a5)
 794:	04977063          	bgeu	a4,s1,7d4 <malloc+0x72>
 798:	8a4e                	mv	s4,s3
 79a:	0009871b          	sext.w	a4,s3
 79e:	6685                	lui	a3,0x1
 7a0:	00d77363          	bgeu	a4,a3,7a6 <malloc+0x44>
 7a4:	6a05                	lui	s4,0x1
 7a6:	000a0b1b          	sext.w	s6,s4
 7aa:	004a1a1b          	slliw	s4,s4,0x4
 7ae:	00000917          	auipc	s2,0x0
 7b2:	13290913          	addi	s2,s2,306 # 8e0 <freep>
 7b6:	5afd                	li	s5,-1
 7b8:	a89d                	j	82e <malloc+0xcc>
 7ba:	00000717          	auipc	a4,0x0
 7be:	12670713          	addi	a4,a4,294 # 8e0 <freep>
 7c2:	00000797          	auipc	a5,0x0
 7c6:	12678793          	addi	a5,a5,294 # 8e8 <base>
 7ca:	e31c                	sd	a5,0(a4)
 7cc:	e71c                	sd	a5,8(a4)
 7ce:	00072823          	sw	zero,16(a4)
 7d2:	b7d9                	j	798 <malloc+0x36>
 7d4:	02e48c63          	beq	s1,a4,80c <malloc+0xaa>
 7d8:	4137073b          	subw	a4,a4,s3
 7dc:	c798                	sw	a4,8(a5)
 7de:	02071693          	slli	a3,a4,0x20
 7e2:	01c6d713          	srli	a4,a3,0x1c
 7e6:	97ba                	add	a5,a5,a4
 7e8:	0137a423          	sw	s3,8(a5)
 7ec:	00000717          	auipc	a4,0x0
 7f0:	0ea73a23          	sd	a0,244(a4) # 8e0 <freep>
 7f4:	01078513          	addi	a0,a5,16
 7f8:	70e2                	ld	ra,56(sp)
 7fa:	7442                	ld	s0,48(sp)
 7fc:	74a2                	ld	s1,40(sp)
 7fe:	7902                	ld	s2,32(sp)
 800:	69e2                	ld	s3,24(sp)
 802:	6a42                	ld	s4,16(sp)
 804:	6aa2                	ld	s5,8(sp)
 806:	6b02                	ld	s6,0(sp)
 808:	6121                	addi	sp,sp,64
 80a:	8082                	ret
 80c:	6398                	ld	a4,0(a5)
 80e:	e118                	sd	a4,0(a0)
 810:	bff1                	j	7ec <malloc+0x8a>
 812:	01652423          	sw	s6,8(a0)
 816:	0541                	addi	a0,a0,16
 818:	00000097          	auipc	ra,0x0
 81c:	ec8080e7          	jalr	-312(ra) # 6e0 <free>
 820:	00093503          	ld	a0,0(s2)
 824:	d971                	beqz	a0,7f8 <malloc+0x96>
 826:	611c                	ld	a5,0(a0)
 828:	4798                	lw	a4,8(a5)
 82a:	fa9775e3          	bgeu	a4,s1,7d4 <malloc+0x72>
 82e:	00093703          	ld	a4,0(s2)
 832:	853e                	mv	a0,a5
 834:	fef719e3          	bne	a4,a5,826 <malloc+0xc4>
 838:	8552                	mv	a0,s4
 83a:	00000097          	auipc	ra,0x0
 83e:	b52080e7          	jalr	-1198(ra) # 38c <sbrk>
 842:	fd5518e3          	bne	a0,s5,812 <malloc+0xb0>
 846:	4501                	li	a0,0
 848:	bf45                	j	7f8 <malloc+0x96>
