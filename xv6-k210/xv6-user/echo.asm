
xv6-user/_echo:     file format elf64-littleriscv


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
   c:	e052                	sd	s4,0(sp)
   e:	1800                	addi	s0,sp,48
  int i;

  for(i = 1; i < argc; i++){
  10:	4785                	li	a5,1
  12:	06a7d463          	bge	a5,a0,7a <main+0x7a>
  16:	00858493          	addi	s1,a1,8
  1a:	ffe5099b          	addiw	s3,a0,-2
  1e:	02099793          	slli	a5,s3,0x20
  22:	01d7d993          	srli	s3,a5,0x1d
  26:	05c1                	addi	a1,a1,16
  28:	99ae                	add	s3,s3,a1
    write(1, argv[i], strlen(argv[i]));
    if(i + 1 < argc){
      write(1, " ", 1);
  2a:	00001a17          	auipc	s4,0x1
  2e:	846a0a13          	addi	s4,s4,-1978 # 870 <malloc+0xee>
    write(1, argv[i], strlen(argv[i]));
  32:	0004b903          	ld	s2,0(s1)
  36:	854a                	mv	a0,s2
  38:	00000097          	auipc	ra,0x0
  3c:	0c2080e7          	jalr	194(ra) # fa <strlen>
  40:	0005061b          	sext.w	a2,a0
  44:	85ca                	mv	a1,s2
  46:	4505                	li	a0,1
  48:	00000097          	auipc	ra,0x0
  4c:	314080e7          	jalr	788(ra) # 35c <write>
    if(i + 1 < argc){
  50:	04a1                	addi	s1,s1,8
  52:	01348a63          	beq	s1,s3,66 <main+0x66>
      write(1, " ", 1);
  56:	4605                	li	a2,1
  58:	85d2                	mv	a1,s4
  5a:	4505                	li	a0,1
  5c:	00000097          	auipc	ra,0x0
  60:	300080e7          	jalr	768(ra) # 35c <write>
  for(i = 1; i < argc; i++){
  64:	b7f9                	j	32 <main+0x32>
    } else {
      write(1, "\n", 1);
  66:	4605                	li	a2,1
  68:	00001597          	auipc	a1,0x1
  6c:	81058593          	addi	a1,a1,-2032 # 878 <malloc+0xf6>
  70:	4505                	li	a0,1
  72:	00000097          	auipc	ra,0x0
  76:	2ea080e7          	jalr	746(ra) # 35c <write>
    }
  }
  exit(0);
  7a:	4501                	li	a0,0
  7c:	00000097          	auipc	ra,0x0
  80:	2c0080e7          	jalr	704(ra) # 33c <exit>

0000000000000084 <strcpy>:
  84:	1141                	addi	sp,sp,-16
  86:	e422                	sd	s0,8(sp)
  88:	0800                	addi	s0,sp,16
  8a:	87aa                	mv	a5,a0
  8c:	0585                	addi	a1,a1,1
  8e:	0785                	addi	a5,a5,1
  90:	fff5c703          	lbu	a4,-1(a1)
  94:	fee78fa3          	sb	a4,-1(a5)
  98:	fb75                	bnez	a4,8c <strcpy+0x8>
  9a:	6422                	ld	s0,8(sp)
  9c:	0141                	addi	sp,sp,16
  9e:	8082                	ret

00000000000000a0 <strcat>:
  a0:	1141                	addi	sp,sp,-16
  a2:	e422                	sd	s0,8(sp)
  a4:	0800                	addi	s0,sp,16
  a6:	00054783          	lbu	a5,0(a0)
  aa:	c385                	beqz	a5,ca <strcat+0x2a>
  ac:	87aa                	mv	a5,a0
  ae:	0785                	addi	a5,a5,1
  b0:	0007c703          	lbu	a4,0(a5)
  b4:	ff6d                	bnez	a4,ae <strcat+0xe>
  b6:	0585                	addi	a1,a1,1
  b8:	0785                	addi	a5,a5,1
  ba:	fff5c703          	lbu	a4,-1(a1)
  be:	fee78fa3          	sb	a4,-1(a5)
  c2:	fb75                	bnez	a4,b6 <strcat+0x16>
  c4:	6422                	ld	s0,8(sp)
  c6:	0141                	addi	sp,sp,16
  c8:	8082                	ret
  ca:	87aa                	mv	a5,a0
  cc:	b7ed                	j	b6 <strcat+0x16>

00000000000000ce <strcmp>:
  ce:	1141                	addi	sp,sp,-16
  d0:	e422                	sd	s0,8(sp)
  d2:	0800                	addi	s0,sp,16
  d4:	00054783          	lbu	a5,0(a0)
  d8:	cb91                	beqz	a5,ec <strcmp+0x1e>
  da:	0005c703          	lbu	a4,0(a1)
  de:	00f71763          	bne	a4,a5,ec <strcmp+0x1e>
  e2:	0505                	addi	a0,a0,1
  e4:	0585                	addi	a1,a1,1
  e6:	00054783          	lbu	a5,0(a0)
  ea:	fbe5                	bnez	a5,da <strcmp+0xc>
  ec:	0005c503          	lbu	a0,0(a1)
  f0:	40a7853b          	subw	a0,a5,a0
  f4:	6422                	ld	s0,8(sp)
  f6:	0141                	addi	sp,sp,16
  f8:	8082                	ret

00000000000000fa <strlen>:
  fa:	1141                	addi	sp,sp,-16
  fc:	e422                	sd	s0,8(sp)
  fe:	0800                	addi	s0,sp,16
 100:	00054783          	lbu	a5,0(a0)
 104:	cf91                	beqz	a5,120 <strlen+0x26>
 106:	0505                	addi	a0,a0,1
 108:	87aa                	mv	a5,a0
 10a:	86be                	mv	a3,a5
 10c:	0785                	addi	a5,a5,1
 10e:	fff7c703          	lbu	a4,-1(a5)
 112:	ff65                	bnez	a4,10a <strlen+0x10>
 114:	40a6853b          	subw	a0,a3,a0
 118:	2505                	addiw	a0,a0,1
 11a:	6422                	ld	s0,8(sp)
 11c:	0141                	addi	sp,sp,16
 11e:	8082                	ret
 120:	4501                	li	a0,0
 122:	bfe5                	j	11a <strlen+0x20>

0000000000000124 <memset>:
 124:	1141                	addi	sp,sp,-16
 126:	e422                	sd	s0,8(sp)
 128:	0800                	addi	s0,sp,16
 12a:	ca19                	beqz	a2,140 <memset+0x1c>
 12c:	87aa                	mv	a5,a0
 12e:	1602                	slli	a2,a2,0x20
 130:	9201                	srli	a2,a2,0x20
 132:	00a60733          	add	a4,a2,a0
 136:	00b78023          	sb	a1,0(a5)
 13a:	0785                	addi	a5,a5,1
 13c:	fee79de3          	bne	a5,a4,136 <memset+0x12>
 140:	6422                	ld	s0,8(sp)
 142:	0141                	addi	sp,sp,16
 144:	8082                	ret

0000000000000146 <strchr>:
 146:	1141                	addi	sp,sp,-16
 148:	e422                	sd	s0,8(sp)
 14a:	0800                	addi	s0,sp,16
 14c:	00054783          	lbu	a5,0(a0)
 150:	cb99                	beqz	a5,166 <strchr+0x20>
 152:	00f58763          	beq	a1,a5,160 <strchr+0x1a>
 156:	0505                	addi	a0,a0,1
 158:	00054783          	lbu	a5,0(a0)
 15c:	fbfd                	bnez	a5,152 <strchr+0xc>
 15e:	4501                	li	a0,0
 160:	6422                	ld	s0,8(sp)
 162:	0141                	addi	sp,sp,16
 164:	8082                	ret
 166:	4501                	li	a0,0
 168:	bfe5                	j	160 <strchr+0x1a>

000000000000016a <gets>:
 16a:	711d                	addi	sp,sp,-96
 16c:	ec86                	sd	ra,88(sp)
 16e:	e8a2                	sd	s0,80(sp)
 170:	e4a6                	sd	s1,72(sp)
 172:	e0ca                	sd	s2,64(sp)
 174:	fc4e                	sd	s3,56(sp)
 176:	f852                	sd	s4,48(sp)
 178:	f456                	sd	s5,40(sp)
 17a:	f05a                	sd	s6,32(sp)
 17c:	ec5e                	sd	s7,24(sp)
 17e:	e862                	sd	s8,16(sp)
 180:	1080                	addi	s0,sp,96
 182:	8baa                	mv	s7,a0
 184:	8a2e                	mv	s4,a1
 186:	892a                	mv	s2,a0
 188:	4481                	li	s1,0
 18a:	faf40a93          	addi	s5,s0,-81
 18e:	4b29                	li	s6,10
 190:	4c35                	li	s8,13
 192:	89a6                	mv	s3,s1
 194:	2485                	addiw	s1,s1,1
 196:	0344d763          	bge	s1,s4,1c4 <gets+0x5a>
 19a:	4605                	li	a2,1
 19c:	85d6                	mv	a1,s5
 19e:	4501                	li	a0,0
 1a0:	00000097          	auipc	ra,0x0
 1a4:	1b4080e7          	jalr	436(ra) # 354 <read>
 1a8:	00a05e63          	blez	a0,1c4 <gets+0x5a>
 1ac:	faf44783          	lbu	a5,-81(s0)
 1b0:	00f90023          	sb	a5,0(s2)
 1b4:	01678763          	beq	a5,s6,1c2 <gets+0x58>
 1b8:	0905                	addi	s2,s2,1
 1ba:	fd879ce3          	bne	a5,s8,192 <gets+0x28>
 1be:	89a6                	mv	s3,s1
 1c0:	a011                	j	1c4 <gets+0x5a>
 1c2:	89a6                	mv	s3,s1
 1c4:	99de                	add	s3,s3,s7
 1c6:	00098023          	sb	zero,0(s3)
 1ca:	855e                	mv	a0,s7
 1cc:	60e6                	ld	ra,88(sp)
 1ce:	6446                	ld	s0,80(sp)
 1d0:	64a6                	ld	s1,72(sp)
 1d2:	6906                	ld	s2,64(sp)
 1d4:	79e2                	ld	s3,56(sp)
 1d6:	7a42                	ld	s4,48(sp)
 1d8:	7aa2                	ld	s5,40(sp)
 1da:	7b02                	ld	s6,32(sp)
 1dc:	6be2                	ld	s7,24(sp)
 1de:	6c42                	ld	s8,16(sp)
 1e0:	6125                	addi	sp,sp,96
 1e2:	8082                	ret

00000000000001e4 <stat>:
 1e4:	1101                	addi	sp,sp,-32
 1e6:	ec06                	sd	ra,24(sp)
 1e8:	e822                	sd	s0,16(sp)
 1ea:	e426                	sd	s1,8(sp)
 1ec:	e04a                	sd	s2,0(sp)
 1ee:	1000                	addi	s0,sp,32
 1f0:	892e                	mv	s2,a1
 1f2:	4581                	li	a1,0
 1f4:	00000097          	auipc	ra,0x0
 1f8:	188080e7          	jalr	392(ra) # 37c <open>
 1fc:	02054563          	bltz	a0,226 <stat+0x42>
 200:	84aa                	mv	s1,a0
 202:	85ca                	mv	a1,s2
 204:	00000097          	auipc	ra,0x0
 208:	180080e7          	jalr	384(ra) # 384 <fstat>
 20c:	892a                	mv	s2,a0
 20e:	8526                	mv	a0,s1
 210:	00000097          	auipc	ra,0x0
 214:	154080e7          	jalr	340(ra) # 364 <close>
 218:	854a                	mv	a0,s2
 21a:	60e2                	ld	ra,24(sp)
 21c:	6442                	ld	s0,16(sp)
 21e:	64a2                	ld	s1,8(sp)
 220:	6902                	ld	s2,0(sp)
 222:	6105                	addi	sp,sp,32
 224:	8082                	ret
 226:	597d                	li	s2,-1
 228:	bfc5                	j	218 <stat+0x34>

000000000000022a <atoi>:
 22a:	1141                	addi	sp,sp,-16
 22c:	e422                	sd	s0,8(sp)
 22e:	0800                	addi	s0,sp,16
 230:	00054703          	lbu	a4,0(a0)
 234:	02d00793          	li	a5,45
 238:	4585                	li	a1,1
 23a:	04f70363          	beq	a4,a5,280 <atoi+0x56>
 23e:	00054703          	lbu	a4,0(a0)
 242:	fd07079b          	addiw	a5,a4,-48
 246:	0ff7f793          	zext.b	a5,a5
 24a:	46a5                	li	a3,9
 24c:	02f6ed63          	bltu	a3,a5,286 <atoi+0x5c>
 250:	4681                	li	a3,0
 252:	4625                	li	a2,9
 254:	0505                	addi	a0,a0,1
 256:	0026979b          	slliw	a5,a3,0x2
 25a:	9fb5                	addw	a5,a5,a3
 25c:	0017979b          	slliw	a5,a5,0x1
 260:	9fb9                	addw	a5,a5,a4
 262:	fd07869b          	addiw	a3,a5,-48
 266:	00054703          	lbu	a4,0(a0)
 26a:	fd07079b          	addiw	a5,a4,-48
 26e:	0ff7f793          	zext.b	a5,a5
 272:	fef671e3          	bgeu	a2,a5,254 <atoi+0x2a>
 276:	02d5853b          	mulw	a0,a1,a3
 27a:	6422                	ld	s0,8(sp)
 27c:	0141                	addi	sp,sp,16
 27e:	8082                	ret
 280:	0505                	addi	a0,a0,1
 282:	55fd                	li	a1,-1
 284:	bf6d                	j	23e <atoi+0x14>
 286:	4681                	li	a3,0
 288:	b7fd                	j	276 <atoi+0x4c>

000000000000028a <memmove>:
 28a:	1141                	addi	sp,sp,-16
 28c:	e422                	sd	s0,8(sp)
 28e:	0800                	addi	s0,sp,16
 290:	02b57463          	bgeu	a0,a1,2b8 <memmove+0x2e>
 294:	00c05f63          	blez	a2,2b2 <memmove+0x28>
 298:	1602                	slli	a2,a2,0x20
 29a:	9201                	srli	a2,a2,0x20
 29c:	00c507b3          	add	a5,a0,a2
 2a0:	872a                	mv	a4,a0
 2a2:	0585                	addi	a1,a1,1
 2a4:	0705                	addi	a4,a4,1
 2a6:	fff5c683          	lbu	a3,-1(a1)
 2aa:	fed70fa3          	sb	a3,-1(a4)
 2ae:	fee79ae3          	bne	a5,a4,2a2 <memmove+0x18>
 2b2:	6422                	ld	s0,8(sp)
 2b4:	0141                	addi	sp,sp,16
 2b6:	8082                	ret
 2b8:	00c50733          	add	a4,a0,a2
 2bc:	95b2                	add	a1,a1,a2
 2be:	fec05ae3          	blez	a2,2b2 <memmove+0x28>
 2c2:	fff6079b          	addiw	a5,a2,-1
 2c6:	1782                	slli	a5,a5,0x20
 2c8:	9381                	srli	a5,a5,0x20
 2ca:	fff7c793          	not	a5,a5
 2ce:	97ba                	add	a5,a5,a4
 2d0:	15fd                	addi	a1,a1,-1
 2d2:	177d                	addi	a4,a4,-1
 2d4:	0005c683          	lbu	a3,0(a1)
 2d8:	00d70023          	sb	a3,0(a4)
 2dc:	fee79ae3          	bne	a5,a4,2d0 <memmove+0x46>
 2e0:	bfc9                	j	2b2 <memmove+0x28>

00000000000002e2 <memcmp>:
 2e2:	1141                	addi	sp,sp,-16
 2e4:	e422                	sd	s0,8(sp)
 2e6:	0800                	addi	s0,sp,16
 2e8:	ca05                	beqz	a2,318 <memcmp+0x36>
 2ea:	fff6069b          	addiw	a3,a2,-1
 2ee:	1682                	slli	a3,a3,0x20
 2f0:	9281                	srli	a3,a3,0x20
 2f2:	0685                	addi	a3,a3,1
 2f4:	96aa                	add	a3,a3,a0
 2f6:	00054783          	lbu	a5,0(a0)
 2fa:	0005c703          	lbu	a4,0(a1)
 2fe:	00e79863          	bne	a5,a4,30e <memcmp+0x2c>
 302:	0505                	addi	a0,a0,1
 304:	0585                	addi	a1,a1,1
 306:	fed518e3          	bne	a0,a3,2f6 <memcmp+0x14>
 30a:	4501                	li	a0,0
 30c:	a019                	j	312 <memcmp+0x30>
 30e:	40e7853b          	subw	a0,a5,a4
 312:	6422                	ld	s0,8(sp)
 314:	0141                	addi	sp,sp,16
 316:	8082                	ret
 318:	4501                	li	a0,0
 31a:	bfe5                	j	312 <memcmp+0x30>

000000000000031c <memcpy>:
 31c:	1141                	addi	sp,sp,-16
 31e:	e406                	sd	ra,8(sp)
 320:	e022                	sd	s0,0(sp)
 322:	0800                	addi	s0,sp,16
 324:	00000097          	auipc	ra,0x0
 328:	f66080e7          	jalr	-154(ra) # 28a <memmove>
 32c:	60a2                	ld	ra,8(sp)
 32e:	6402                	ld	s0,0(sp)
 330:	0141                	addi	sp,sp,16
 332:	8082                	ret

0000000000000334 <fork>:
 334:	4885                	li	a7,1
 336:	00000073          	ecall
 33a:	8082                	ret

000000000000033c <exit>:
 33c:	4889                	li	a7,2
 33e:	00000073          	ecall
 342:	8082                	ret

0000000000000344 <wait>:
 344:	488d                	li	a7,3
 346:	00000073          	ecall
 34a:	8082                	ret

000000000000034c <pipe>:
 34c:	4891                	li	a7,4
 34e:	00000073          	ecall
 352:	8082                	ret

0000000000000354 <read>:
 354:	4895                	li	a7,5
 356:	00000073          	ecall
 35a:	8082                	ret

000000000000035c <write>:
 35c:	48c1                	li	a7,16
 35e:	00000073          	ecall
 362:	8082                	ret

0000000000000364 <close>:
 364:	48d5                	li	a7,21
 366:	00000073          	ecall
 36a:	8082                	ret

000000000000036c <kill>:
 36c:	4899                	li	a7,6
 36e:	00000073          	ecall
 372:	8082                	ret

0000000000000374 <exec>:
 374:	489d                	li	a7,7
 376:	00000073          	ecall
 37a:	8082                	ret

000000000000037c <open>:
 37c:	48bd                	li	a7,15
 37e:	00000073          	ecall
 382:	8082                	ret

0000000000000384 <fstat>:
 384:	48a1                	li	a7,8
 386:	00000073          	ecall
 38a:	8082                	ret

000000000000038c <mkdir>:
 38c:	48d1                	li	a7,20
 38e:	00000073          	ecall
 392:	8082                	ret

0000000000000394 <chdir>:
 394:	48a5                	li	a7,9
 396:	00000073          	ecall
 39a:	8082                	ret

000000000000039c <dup>:
 39c:	48a9                	li	a7,10
 39e:	00000073          	ecall
 3a2:	8082                	ret

00000000000003a4 <getpid>:
 3a4:	48ad                	li	a7,11
 3a6:	00000073          	ecall
 3aa:	8082                	ret

00000000000003ac <sbrk>:
 3ac:	48b1                	li	a7,12
 3ae:	00000073          	ecall
 3b2:	8082                	ret

00000000000003b4 <sleep>:
 3b4:	48b5                	li	a7,13
 3b6:	00000073          	ecall
 3ba:	8082                	ret

00000000000003bc <uptime>:
 3bc:	48b9                	li	a7,14
 3be:	00000073          	ecall
 3c2:	8082                	ret

00000000000003c4 <test_proc>:
 3c4:	48d9                	li	a7,22
 3c6:	00000073          	ecall
 3ca:	8082                	ret

00000000000003cc <dev>:
 3cc:	48dd                	li	a7,23
 3ce:	00000073          	ecall
 3d2:	8082                	ret

00000000000003d4 <readdir>:
 3d4:	48e1                	li	a7,24
 3d6:	00000073          	ecall
 3da:	8082                	ret

00000000000003dc <getcwd>:
 3dc:	48e5                	li	a7,25
 3de:	00000073          	ecall
 3e2:	8082                	ret

00000000000003e4 <remove>:
 3e4:	48c5                	li	a7,17
 3e6:	00000073          	ecall
 3ea:	8082                	ret

00000000000003ec <trace>:
 3ec:	48c9                	li	a7,18
 3ee:	00000073          	ecall
 3f2:	8082                	ret

00000000000003f4 <sysinfo>:
 3f4:	48cd                	li	a7,19
 3f6:	00000073          	ecall
 3fa:	8082                	ret

00000000000003fc <rename>:
 3fc:	48e9                	li	a7,26
 3fe:	00000073          	ecall
 402:	8082                	ret

0000000000000404 <putc>:
 404:	1101                	addi	sp,sp,-32
 406:	ec06                	sd	ra,24(sp)
 408:	e822                	sd	s0,16(sp)
 40a:	1000                	addi	s0,sp,32
 40c:	feb407a3          	sb	a1,-17(s0)
 410:	4605                	li	a2,1
 412:	fef40593          	addi	a1,s0,-17
 416:	00000097          	auipc	ra,0x0
 41a:	f46080e7          	jalr	-186(ra) # 35c <write>
 41e:	60e2                	ld	ra,24(sp)
 420:	6442                	ld	s0,16(sp)
 422:	6105                	addi	sp,sp,32
 424:	8082                	ret

0000000000000426 <printint>:
 426:	7139                	addi	sp,sp,-64
 428:	fc06                	sd	ra,56(sp)
 42a:	f822                	sd	s0,48(sp)
 42c:	f426                	sd	s1,40(sp)
 42e:	f04a                	sd	s2,32(sp)
 430:	ec4e                	sd	s3,24(sp)
 432:	0080                	addi	s0,sp,64
 434:	84aa                	mv	s1,a0
 436:	c299                	beqz	a3,43c <printint+0x16>
 438:	0805c863          	bltz	a1,4c8 <printint+0xa2>
 43c:	2581                	sext.w	a1,a1
 43e:	4881                	li	a7,0
 440:	fc040993          	addi	s3,s0,-64
 444:	86ce                	mv	a3,s3
 446:	4701                	li	a4,0
 448:	2601                	sext.w	a2,a2
 44a:	00000517          	auipc	a0,0x0
 44e:	49650513          	addi	a0,a0,1174 # 8e0 <digits>
 452:	883a                	mv	a6,a4
 454:	2705                	addiw	a4,a4,1
 456:	02c5f7bb          	remuw	a5,a1,a2
 45a:	1782                	slli	a5,a5,0x20
 45c:	9381                	srli	a5,a5,0x20
 45e:	97aa                	add	a5,a5,a0
 460:	0007c783          	lbu	a5,0(a5)
 464:	00f68023          	sb	a5,0(a3)
 468:	0005879b          	sext.w	a5,a1
 46c:	02c5d5bb          	divuw	a1,a1,a2
 470:	0685                	addi	a3,a3,1
 472:	fec7f0e3          	bgeu	a5,a2,452 <printint+0x2c>
 476:	00088c63          	beqz	a7,48e <printint+0x68>
 47a:	fd070793          	addi	a5,a4,-48
 47e:	00878733          	add	a4,a5,s0
 482:	02d00793          	li	a5,45
 486:	fef70823          	sb	a5,-16(a4)
 48a:	0028071b          	addiw	a4,a6,2
 48e:	02e05663          	blez	a4,4ba <printint+0x94>
 492:	fc040913          	addi	s2,s0,-64
 496:	993a                	add	s2,s2,a4
 498:	19fd                	addi	s3,s3,-1
 49a:	99ba                	add	s3,s3,a4
 49c:	377d                	addiw	a4,a4,-1
 49e:	1702                	slli	a4,a4,0x20
 4a0:	9301                	srli	a4,a4,0x20
 4a2:	40e989b3          	sub	s3,s3,a4
 4a6:	fff94583          	lbu	a1,-1(s2)
 4aa:	8526                	mv	a0,s1
 4ac:	00000097          	auipc	ra,0x0
 4b0:	f58080e7          	jalr	-168(ra) # 404 <putc>
 4b4:	197d                	addi	s2,s2,-1
 4b6:	ff3918e3          	bne	s2,s3,4a6 <printint+0x80>
 4ba:	70e2                	ld	ra,56(sp)
 4bc:	7442                	ld	s0,48(sp)
 4be:	74a2                	ld	s1,40(sp)
 4c0:	7902                	ld	s2,32(sp)
 4c2:	69e2                	ld	s3,24(sp)
 4c4:	6121                	addi	sp,sp,64
 4c6:	8082                	ret
 4c8:	40b005bb          	negw	a1,a1
 4cc:	4885                	li	a7,1
 4ce:	bf8d                	j	440 <printint+0x1a>

00000000000004d0 <vprintf>:
 4d0:	715d                	addi	sp,sp,-80
 4d2:	e486                	sd	ra,72(sp)
 4d4:	e0a2                	sd	s0,64(sp)
 4d6:	fc26                	sd	s1,56(sp)
 4d8:	f84a                	sd	s2,48(sp)
 4da:	f44e                	sd	s3,40(sp)
 4dc:	f052                	sd	s4,32(sp)
 4de:	ec56                	sd	s5,24(sp)
 4e0:	e85a                	sd	s6,16(sp)
 4e2:	e45e                	sd	s7,8(sp)
 4e4:	e062                	sd	s8,0(sp)
 4e6:	0880                	addi	s0,sp,80
 4e8:	0005c903          	lbu	s2,0(a1)
 4ec:	18090c63          	beqz	s2,684 <vprintf+0x1b4>
 4f0:	8aaa                	mv	s5,a0
 4f2:	8bb2                	mv	s7,a2
 4f4:	00158493          	addi	s1,a1,1
 4f8:	4981                	li	s3,0
 4fa:	02500a13          	li	s4,37
 4fe:	4b55                	li	s6,21
 500:	a839                	j	51e <vprintf+0x4e>
 502:	85ca                	mv	a1,s2
 504:	8556                	mv	a0,s5
 506:	00000097          	auipc	ra,0x0
 50a:	efe080e7          	jalr	-258(ra) # 404 <putc>
 50e:	a019                	j	514 <vprintf+0x44>
 510:	01498d63          	beq	s3,s4,52a <vprintf+0x5a>
 514:	0485                	addi	s1,s1,1
 516:	fff4c903          	lbu	s2,-1(s1)
 51a:	16090563          	beqz	s2,684 <vprintf+0x1b4>
 51e:	fe0999e3          	bnez	s3,510 <vprintf+0x40>
 522:	ff4910e3          	bne	s2,s4,502 <vprintf+0x32>
 526:	89d2                	mv	s3,s4
 528:	b7f5                	j	514 <vprintf+0x44>
 52a:	13490263          	beq	s2,s4,64e <vprintf+0x17e>
 52e:	f9d9079b          	addiw	a5,s2,-99
 532:	0ff7f793          	zext.b	a5,a5
 536:	12fb6563          	bltu	s6,a5,660 <vprintf+0x190>
 53a:	f9d9079b          	addiw	a5,s2,-99
 53e:	0ff7f713          	zext.b	a4,a5
 542:	10eb6f63          	bltu	s6,a4,660 <vprintf+0x190>
 546:	00271793          	slli	a5,a4,0x2
 54a:	00000717          	auipc	a4,0x0
 54e:	33e70713          	addi	a4,a4,830 # 888 <malloc+0x106>
 552:	97ba                	add	a5,a5,a4
 554:	439c                	lw	a5,0(a5)
 556:	97ba                	add	a5,a5,a4
 558:	8782                	jr	a5
 55a:	008b8913          	addi	s2,s7,8
 55e:	4685                	li	a3,1
 560:	4629                	li	a2,10
 562:	000ba583          	lw	a1,0(s7)
 566:	8556                	mv	a0,s5
 568:	00000097          	auipc	ra,0x0
 56c:	ebe080e7          	jalr	-322(ra) # 426 <printint>
 570:	8bca                	mv	s7,s2
 572:	4981                	li	s3,0
 574:	b745                	j	514 <vprintf+0x44>
 576:	008b8913          	addi	s2,s7,8
 57a:	4681                	li	a3,0
 57c:	4629                	li	a2,10
 57e:	000ba583          	lw	a1,0(s7)
 582:	8556                	mv	a0,s5
 584:	00000097          	auipc	ra,0x0
 588:	ea2080e7          	jalr	-350(ra) # 426 <printint>
 58c:	8bca                	mv	s7,s2
 58e:	4981                	li	s3,0
 590:	b751                	j	514 <vprintf+0x44>
 592:	008b8913          	addi	s2,s7,8
 596:	4681                	li	a3,0
 598:	4641                	li	a2,16
 59a:	000ba583          	lw	a1,0(s7)
 59e:	8556                	mv	a0,s5
 5a0:	00000097          	auipc	ra,0x0
 5a4:	e86080e7          	jalr	-378(ra) # 426 <printint>
 5a8:	8bca                	mv	s7,s2
 5aa:	4981                	li	s3,0
 5ac:	b7a5                	j	514 <vprintf+0x44>
 5ae:	008b8c13          	addi	s8,s7,8
 5b2:	000bb983          	ld	s3,0(s7)
 5b6:	03000593          	li	a1,48
 5ba:	8556                	mv	a0,s5
 5bc:	00000097          	auipc	ra,0x0
 5c0:	e48080e7          	jalr	-440(ra) # 404 <putc>
 5c4:	07800593          	li	a1,120
 5c8:	8556                	mv	a0,s5
 5ca:	00000097          	auipc	ra,0x0
 5ce:	e3a080e7          	jalr	-454(ra) # 404 <putc>
 5d2:	4941                	li	s2,16
 5d4:	00000b97          	auipc	s7,0x0
 5d8:	30cb8b93          	addi	s7,s7,780 # 8e0 <digits>
 5dc:	03c9d793          	srli	a5,s3,0x3c
 5e0:	97de                	add	a5,a5,s7
 5e2:	0007c583          	lbu	a1,0(a5)
 5e6:	8556                	mv	a0,s5
 5e8:	00000097          	auipc	ra,0x0
 5ec:	e1c080e7          	jalr	-484(ra) # 404 <putc>
 5f0:	0992                	slli	s3,s3,0x4
 5f2:	397d                	addiw	s2,s2,-1
 5f4:	fe0914e3          	bnez	s2,5dc <vprintf+0x10c>
 5f8:	8be2                	mv	s7,s8
 5fa:	4981                	li	s3,0
 5fc:	bf21                	j	514 <vprintf+0x44>
 5fe:	008b8993          	addi	s3,s7,8
 602:	000bb903          	ld	s2,0(s7)
 606:	02090163          	beqz	s2,628 <vprintf+0x158>
 60a:	00094583          	lbu	a1,0(s2)
 60e:	c9a5                	beqz	a1,67e <vprintf+0x1ae>
 610:	8556                	mv	a0,s5
 612:	00000097          	auipc	ra,0x0
 616:	df2080e7          	jalr	-526(ra) # 404 <putc>
 61a:	0905                	addi	s2,s2,1
 61c:	00094583          	lbu	a1,0(s2)
 620:	f9e5                	bnez	a1,610 <vprintf+0x140>
 622:	8bce                	mv	s7,s3
 624:	4981                	li	s3,0
 626:	b5fd                	j	514 <vprintf+0x44>
 628:	00000917          	auipc	s2,0x0
 62c:	25890913          	addi	s2,s2,600 # 880 <malloc+0xfe>
 630:	02800593          	li	a1,40
 634:	bff1                	j	610 <vprintf+0x140>
 636:	008b8913          	addi	s2,s7,8
 63a:	000bc583          	lbu	a1,0(s7)
 63e:	8556                	mv	a0,s5
 640:	00000097          	auipc	ra,0x0
 644:	dc4080e7          	jalr	-572(ra) # 404 <putc>
 648:	8bca                	mv	s7,s2
 64a:	4981                	li	s3,0
 64c:	b5e1                	j	514 <vprintf+0x44>
 64e:	02500593          	li	a1,37
 652:	8556                	mv	a0,s5
 654:	00000097          	auipc	ra,0x0
 658:	db0080e7          	jalr	-592(ra) # 404 <putc>
 65c:	4981                	li	s3,0
 65e:	bd5d                	j	514 <vprintf+0x44>
 660:	02500593          	li	a1,37
 664:	8556                	mv	a0,s5
 666:	00000097          	auipc	ra,0x0
 66a:	d9e080e7          	jalr	-610(ra) # 404 <putc>
 66e:	85ca                	mv	a1,s2
 670:	8556                	mv	a0,s5
 672:	00000097          	auipc	ra,0x0
 676:	d92080e7          	jalr	-622(ra) # 404 <putc>
 67a:	4981                	li	s3,0
 67c:	bd61                	j	514 <vprintf+0x44>
 67e:	8bce                	mv	s7,s3
 680:	4981                	li	s3,0
 682:	bd49                	j	514 <vprintf+0x44>
 684:	60a6                	ld	ra,72(sp)
 686:	6406                	ld	s0,64(sp)
 688:	74e2                	ld	s1,56(sp)
 68a:	7942                	ld	s2,48(sp)
 68c:	79a2                	ld	s3,40(sp)
 68e:	7a02                	ld	s4,32(sp)
 690:	6ae2                	ld	s5,24(sp)
 692:	6b42                	ld	s6,16(sp)
 694:	6ba2                	ld	s7,8(sp)
 696:	6c02                	ld	s8,0(sp)
 698:	6161                	addi	sp,sp,80
 69a:	8082                	ret

000000000000069c <fprintf>:
 69c:	715d                	addi	sp,sp,-80
 69e:	ec06                	sd	ra,24(sp)
 6a0:	e822                	sd	s0,16(sp)
 6a2:	1000                	addi	s0,sp,32
 6a4:	e010                	sd	a2,0(s0)
 6a6:	e414                	sd	a3,8(s0)
 6a8:	e818                	sd	a4,16(s0)
 6aa:	ec1c                	sd	a5,24(s0)
 6ac:	03043023          	sd	a6,32(s0)
 6b0:	03143423          	sd	a7,40(s0)
 6b4:	8622                	mv	a2,s0
 6b6:	fe843423          	sd	s0,-24(s0)
 6ba:	00000097          	auipc	ra,0x0
 6be:	e16080e7          	jalr	-490(ra) # 4d0 <vprintf>
 6c2:	60e2                	ld	ra,24(sp)
 6c4:	6442                	ld	s0,16(sp)
 6c6:	6161                	addi	sp,sp,80
 6c8:	8082                	ret

00000000000006ca <printf>:
 6ca:	711d                	addi	sp,sp,-96
 6cc:	ec06                	sd	ra,24(sp)
 6ce:	e822                	sd	s0,16(sp)
 6d0:	1000                	addi	s0,sp,32
 6d2:	e40c                	sd	a1,8(s0)
 6d4:	e810                	sd	a2,16(s0)
 6d6:	ec14                	sd	a3,24(s0)
 6d8:	f018                	sd	a4,32(s0)
 6da:	f41c                	sd	a5,40(s0)
 6dc:	03043823          	sd	a6,48(s0)
 6e0:	03143c23          	sd	a7,56(s0)
 6e4:	00840613          	addi	a2,s0,8
 6e8:	fec43423          	sd	a2,-24(s0)
 6ec:	85aa                	mv	a1,a0
 6ee:	4505                	li	a0,1
 6f0:	00000097          	auipc	ra,0x0
 6f4:	de0080e7          	jalr	-544(ra) # 4d0 <vprintf>
 6f8:	60e2                	ld	ra,24(sp)
 6fa:	6442                	ld	s0,16(sp)
 6fc:	6125                	addi	sp,sp,96
 6fe:	8082                	ret

0000000000000700 <free>:
 700:	1141                	addi	sp,sp,-16
 702:	e422                	sd	s0,8(sp)
 704:	0800                	addi	s0,sp,16
 706:	ff050693          	addi	a3,a0,-16
 70a:	00000797          	auipc	a5,0x0
 70e:	1ee7b783          	ld	a5,494(a5) # 8f8 <freep>
 712:	a02d                	j	73c <free+0x3c>
 714:	4618                	lw	a4,8(a2)
 716:	9f2d                	addw	a4,a4,a1
 718:	fee52c23          	sw	a4,-8(a0)
 71c:	6398                	ld	a4,0(a5)
 71e:	6310                	ld	a2,0(a4)
 720:	a83d                	j	75e <free+0x5e>
 722:	ff852703          	lw	a4,-8(a0)
 726:	9f31                	addw	a4,a4,a2
 728:	c798                	sw	a4,8(a5)
 72a:	ff053683          	ld	a3,-16(a0)
 72e:	a091                	j	772 <free+0x72>
 730:	6398                	ld	a4,0(a5)
 732:	00e7e463          	bltu	a5,a4,73a <free+0x3a>
 736:	00e6ea63          	bltu	a3,a4,74a <free+0x4a>
 73a:	87ba                	mv	a5,a4
 73c:	fed7fae3          	bgeu	a5,a3,730 <free+0x30>
 740:	6398                	ld	a4,0(a5)
 742:	00e6e463          	bltu	a3,a4,74a <free+0x4a>
 746:	fee7eae3          	bltu	a5,a4,73a <free+0x3a>
 74a:	ff852583          	lw	a1,-8(a0)
 74e:	6390                	ld	a2,0(a5)
 750:	02059813          	slli	a6,a1,0x20
 754:	01c85713          	srli	a4,a6,0x1c
 758:	9736                	add	a4,a4,a3
 75a:	fae60de3          	beq	a2,a4,714 <free+0x14>
 75e:	fec53823          	sd	a2,-16(a0)
 762:	4790                	lw	a2,8(a5)
 764:	02061593          	slli	a1,a2,0x20
 768:	01c5d713          	srli	a4,a1,0x1c
 76c:	973e                	add	a4,a4,a5
 76e:	fae68ae3          	beq	a3,a4,722 <free+0x22>
 772:	e394                	sd	a3,0(a5)
 774:	00000717          	auipc	a4,0x0
 778:	18f73223          	sd	a5,388(a4) # 8f8 <freep>
 77c:	6422                	ld	s0,8(sp)
 77e:	0141                	addi	sp,sp,16
 780:	8082                	ret

0000000000000782 <malloc>:
 782:	7139                	addi	sp,sp,-64
 784:	fc06                	sd	ra,56(sp)
 786:	f822                	sd	s0,48(sp)
 788:	f426                	sd	s1,40(sp)
 78a:	f04a                	sd	s2,32(sp)
 78c:	ec4e                	sd	s3,24(sp)
 78e:	e852                	sd	s4,16(sp)
 790:	e456                	sd	s5,8(sp)
 792:	e05a                	sd	s6,0(sp)
 794:	0080                	addi	s0,sp,64
 796:	02051493          	slli	s1,a0,0x20
 79a:	9081                	srli	s1,s1,0x20
 79c:	04bd                	addi	s1,s1,15
 79e:	8091                	srli	s1,s1,0x4
 7a0:	0014899b          	addiw	s3,s1,1
 7a4:	0485                	addi	s1,s1,1
 7a6:	00000517          	auipc	a0,0x0
 7aa:	15253503          	ld	a0,338(a0) # 8f8 <freep>
 7ae:	c515                	beqz	a0,7da <malloc+0x58>
 7b0:	611c                	ld	a5,0(a0)
 7b2:	4798                	lw	a4,8(a5)
 7b4:	04977063          	bgeu	a4,s1,7f4 <malloc+0x72>
 7b8:	8a4e                	mv	s4,s3
 7ba:	0009871b          	sext.w	a4,s3
 7be:	6685                	lui	a3,0x1
 7c0:	00d77363          	bgeu	a4,a3,7c6 <malloc+0x44>
 7c4:	6a05                	lui	s4,0x1
 7c6:	000a0b1b          	sext.w	s6,s4
 7ca:	004a1a1b          	slliw	s4,s4,0x4
 7ce:	00000917          	auipc	s2,0x0
 7d2:	12a90913          	addi	s2,s2,298 # 8f8 <freep>
 7d6:	5afd                	li	s5,-1
 7d8:	a89d                	j	84e <malloc+0xcc>
 7da:	00000717          	auipc	a4,0x0
 7de:	11e70713          	addi	a4,a4,286 # 8f8 <freep>
 7e2:	00000797          	auipc	a5,0x0
 7e6:	11e78793          	addi	a5,a5,286 # 900 <base>
 7ea:	e31c                	sd	a5,0(a4)
 7ec:	e71c                	sd	a5,8(a4)
 7ee:	00072823          	sw	zero,16(a4)
 7f2:	b7d9                	j	7b8 <malloc+0x36>
 7f4:	02e48c63          	beq	s1,a4,82c <malloc+0xaa>
 7f8:	4137073b          	subw	a4,a4,s3
 7fc:	c798                	sw	a4,8(a5)
 7fe:	02071693          	slli	a3,a4,0x20
 802:	01c6d713          	srli	a4,a3,0x1c
 806:	97ba                	add	a5,a5,a4
 808:	0137a423          	sw	s3,8(a5)
 80c:	00000717          	auipc	a4,0x0
 810:	0ea73623          	sd	a0,236(a4) # 8f8 <freep>
 814:	01078513          	addi	a0,a5,16
 818:	70e2                	ld	ra,56(sp)
 81a:	7442                	ld	s0,48(sp)
 81c:	74a2                	ld	s1,40(sp)
 81e:	7902                	ld	s2,32(sp)
 820:	69e2                	ld	s3,24(sp)
 822:	6a42                	ld	s4,16(sp)
 824:	6aa2                	ld	s5,8(sp)
 826:	6b02                	ld	s6,0(sp)
 828:	6121                	addi	sp,sp,64
 82a:	8082                	ret
 82c:	6398                	ld	a4,0(a5)
 82e:	e118                	sd	a4,0(a0)
 830:	bff1                	j	80c <malloc+0x8a>
 832:	01652423          	sw	s6,8(a0)
 836:	0541                	addi	a0,a0,16
 838:	00000097          	auipc	ra,0x0
 83c:	ec8080e7          	jalr	-312(ra) # 700 <free>
 840:	00093503          	ld	a0,0(s2)
 844:	d971                	beqz	a0,818 <malloc+0x96>
 846:	611c                	ld	a5,0(a0)
 848:	4798                	lw	a4,8(a5)
 84a:	fa9775e3          	bgeu	a4,s1,7f4 <malloc+0x72>
 84e:	00093703          	ld	a4,0(s2)
 852:	853e                	mv	a0,a5
 854:	fef719e3          	bne	a4,a5,846 <malloc+0xc4>
 858:	8552                	mv	a0,s4
 85a:	00000097          	auipc	ra,0x0
 85e:	b52080e7          	jalr	-1198(ra) # 3ac <sbrk>
 862:	fd5518e3          	bne	a0,s5,832 <malloc+0xb0>
 866:	4501                	li	a0,0
 868:	bf45                	j	818 <malloc+0x96>
