
xv6-user/_rm:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/include/fcntl.h"
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
  10:	02a7d163          	bge	a5,a0,32 <main+0x32>
  14:	00858493          	addi	s1,a1,8
  18:	ffe5091b          	addiw	s2,a0,-2
  1c:	02091793          	slli	a5,s2,0x20
  20:	01d7d913          	srli	s2,a5,0x1d
  24:	05c1                	addi	a1,a1,16
  26:	992e                	add	s2,s2,a1
    exit(1);
  }

  for(i = 1; i < argc; i++){
    if(remove(argv[i]) < 0){
      fprintf(2, "rm: %s failed to delete\n", argv[i]);
  28:	00001997          	auipc	s3,0x1
  2c:	85898993          	addi	s3,s3,-1960 # 880 <malloc+0x106>
  30:	a015                	j	54 <main+0x54>
    fprintf(2, "Usage: rm files...\n");
  32:	00001597          	auipc	a1,0x1
  36:	83658593          	addi	a1,a1,-1994 # 868 <malloc+0xee>
  3a:	4509                	li	a0,2
  3c:	00000097          	auipc	ra,0x0
  40:	658080e7          	jalr	1624(ra) # 694 <fprintf>
    exit(1);
  44:	4505                	li	a0,1
  46:	00000097          	auipc	ra,0x0
  4a:	2ee080e7          	jalr	750(ra) # 334 <exit>
  for(i = 1; i < argc; i++){
  4e:	04a1                	addi	s1,s1,8
  50:	03248163          	beq	s1,s2,72 <main+0x72>
    if(remove(argv[i]) < 0){
  54:	6088                	ld	a0,0(s1)
  56:	00000097          	auipc	ra,0x0
  5a:	386080e7          	jalr	902(ra) # 3dc <remove>
  5e:	fe0558e3          	bgez	a0,4e <main+0x4e>
      fprintf(2, "rm: %s failed to delete\n", argv[i]);
  62:	6090                	ld	a2,0(s1)
  64:	85ce                	mv	a1,s3
  66:	4509                	li	a0,2
  68:	00000097          	auipc	ra,0x0
  6c:	62c080e7          	jalr	1580(ra) # 694 <fprintf>
  70:	bff9                	j	4e <main+0x4e>
    }
  }

  exit(0);
  72:	4501                	li	a0,0
  74:	00000097          	auipc	ra,0x0
  78:	2c0080e7          	jalr	704(ra) # 334 <exit>

000000000000007c <strcpy>:
  7c:	1141                	addi	sp,sp,-16
  7e:	e422                	sd	s0,8(sp)
  80:	0800                	addi	s0,sp,16
  82:	87aa                	mv	a5,a0
  84:	0585                	addi	a1,a1,1
  86:	0785                	addi	a5,a5,1
  88:	fff5c703          	lbu	a4,-1(a1)
  8c:	fee78fa3          	sb	a4,-1(a5)
  90:	fb75                	bnez	a4,84 <strcpy+0x8>
  92:	6422                	ld	s0,8(sp)
  94:	0141                	addi	sp,sp,16
  96:	8082                	ret

0000000000000098 <strcat>:
  98:	1141                	addi	sp,sp,-16
  9a:	e422                	sd	s0,8(sp)
  9c:	0800                	addi	s0,sp,16
  9e:	00054783          	lbu	a5,0(a0)
  a2:	c385                	beqz	a5,c2 <strcat+0x2a>
  a4:	87aa                	mv	a5,a0
  a6:	0785                	addi	a5,a5,1
  a8:	0007c703          	lbu	a4,0(a5)
  ac:	ff6d                	bnez	a4,a6 <strcat+0xe>
  ae:	0585                	addi	a1,a1,1
  b0:	0785                	addi	a5,a5,1
  b2:	fff5c703          	lbu	a4,-1(a1)
  b6:	fee78fa3          	sb	a4,-1(a5)
  ba:	fb75                	bnez	a4,ae <strcat+0x16>
  bc:	6422                	ld	s0,8(sp)
  be:	0141                	addi	sp,sp,16
  c0:	8082                	ret
  c2:	87aa                	mv	a5,a0
  c4:	b7ed                	j	ae <strcat+0x16>

00000000000000c6 <strcmp>:
  c6:	1141                	addi	sp,sp,-16
  c8:	e422                	sd	s0,8(sp)
  ca:	0800                	addi	s0,sp,16
  cc:	00054783          	lbu	a5,0(a0)
  d0:	cb91                	beqz	a5,e4 <strcmp+0x1e>
  d2:	0005c703          	lbu	a4,0(a1)
  d6:	00f71763          	bne	a4,a5,e4 <strcmp+0x1e>
  da:	0505                	addi	a0,a0,1
  dc:	0585                	addi	a1,a1,1
  de:	00054783          	lbu	a5,0(a0)
  e2:	fbe5                	bnez	a5,d2 <strcmp+0xc>
  e4:	0005c503          	lbu	a0,0(a1)
  e8:	40a7853b          	subw	a0,a5,a0
  ec:	6422                	ld	s0,8(sp)
  ee:	0141                	addi	sp,sp,16
  f0:	8082                	ret

00000000000000f2 <strlen>:
  f2:	1141                	addi	sp,sp,-16
  f4:	e422                	sd	s0,8(sp)
  f6:	0800                	addi	s0,sp,16
  f8:	00054783          	lbu	a5,0(a0)
  fc:	cf91                	beqz	a5,118 <strlen+0x26>
  fe:	0505                	addi	a0,a0,1
 100:	87aa                	mv	a5,a0
 102:	86be                	mv	a3,a5
 104:	0785                	addi	a5,a5,1
 106:	fff7c703          	lbu	a4,-1(a5)
 10a:	ff65                	bnez	a4,102 <strlen+0x10>
 10c:	40a6853b          	subw	a0,a3,a0
 110:	2505                	addiw	a0,a0,1
 112:	6422                	ld	s0,8(sp)
 114:	0141                	addi	sp,sp,16
 116:	8082                	ret
 118:	4501                	li	a0,0
 11a:	bfe5                	j	112 <strlen+0x20>

000000000000011c <memset>:
 11c:	1141                	addi	sp,sp,-16
 11e:	e422                	sd	s0,8(sp)
 120:	0800                	addi	s0,sp,16
 122:	ca19                	beqz	a2,138 <memset+0x1c>
 124:	87aa                	mv	a5,a0
 126:	1602                	slli	a2,a2,0x20
 128:	9201                	srli	a2,a2,0x20
 12a:	00a60733          	add	a4,a2,a0
 12e:	00b78023          	sb	a1,0(a5)
 132:	0785                	addi	a5,a5,1
 134:	fee79de3          	bne	a5,a4,12e <memset+0x12>
 138:	6422                	ld	s0,8(sp)
 13a:	0141                	addi	sp,sp,16
 13c:	8082                	ret

000000000000013e <strchr>:
 13e:	1141                	addi	sp,sp,-16
 140:	e422                	sd	s0,8(sp)
 142:	0800                	addi	s0,sp,16
 144:	00054783          	lbu	a5,0(a0)
 148:	cb99                	beqz	a5,15e <strchr+0x20>
 14a:	00f58763          	beq	a1,a5,158 <strchr+0x1a>
 14e:	0505                	addi	a0,a0,1
 150:	00054783          	lbu	a5,0(a0)
 154:	fbfd                	bnez	a5,14a <strchr+0xc>
 156:	4501                	li	a0,0
 158:	6422                	ld	s0,8(sp)
 15a:	0141                	addi	sp,sp,16
 15c:	8082                	ret
 15e:	4501                	li	a0,0
 160:	bfe5                	j	158 <strchr+0x1a>

0000000000000162 <gets>:
 162:	711d                	addi	sp,sp,-96
 164:	ec86                	sd	ra,88(sp)
 166:	e8a2                	sd	s0,80(sp)
 168:	e4a6                	sd	s1,72(sp)
 16a:	e0ca                	sd	s2,64(sp)
 16c:	fc4e                	sd	s3,56(sp)
 16e:	f852                	sd	s4,48(sp)
 170:	f456                	sd	s5,40(sp)
 172:	f05a                	sd	s6,32(sp)
 174:	ec5e                	sd	s7,24(sp)
 176:	e862                	sd	s8,16(sp)
 178:	1080                	addi	s0,sp,96
 17a:	8baa                	mv	s7,a0
 17c:	8a2e                	mv	s4,a1
 17e:	892a                	mv	s2,a0
 180:	4481                	li	s1,0
 182:	faf40a93          	addi	s5,s0,-81
 186:	4b29                	li	s6,10
 188:	4c35                	li	s8,13
 18a:	89a6                	mv	s3,s1
 18c:	2485                	addiw	s1,s1,1
 18e:	0344d763          	bge	s1,s4,1bc <gets+0x5a>
 192:	4605                	li	a2,1
 194:	85d6                	mv	a1,s5
 196:	4501                	li	a0,0
 198:	00000097          	auipc	ra,0x0
 19c:	1b4080e7          	jalr	436(ra) # 34c <read>
 1a0:	00a05e63          	blez	a0,1bc <gets+0x5a>
 1a4:	faf44783          	lbu	a5,-81(s0)
 1a8:	00f90023          	sb	a5,0(s2)
 1ac:	01678763          	beq	a5,s6,1ba <gets+0x58>
 1b0:	0905                	addi	s2,s2,1
 1b2:	fd879ce3          	bne	a5,s8,18a <gets+0x28>
 1b6:	89a6                	mv	s3,s1
 1b8:	a011                	j	1bc <gets+0x5a>
 1ba:	89a6                	mv	s3,s1
 1bc:	99de                	add	s3,s3,s7
 1be:	00098023          	sb	zero,0(s3)
 1c2:	855e                	mv	a0,s7
 1c4:	60e6                	ld	ra,88(sp)
 1c6:	6446                	ld	s0,80(sp)
 1c8:	64a6                	ld	s1,72(sp)
 1ca:	6906                	ld	s2,64(sp)
 1cc:	79e2                	ld	s3,56(sp)
 1ce:	7a42                	ld	s4,48(sp)
 1d0:	7aa2                	ld	s5,40(sp)
 1d2:	7b02                	ld	s6,32(sp)
 1d4:	6be2                	ld	s7,24(sp)
 1d6:	6c42                	ld	s8,16(sp)
 1d8:	6125                	addi	sp,sp,96
 1da:	8082                	ret

00000000000001dc <stat>:
 1dc:	1101                	addi	sp,sp,-32
 1de:	ec06                	sd	ra,24(sp)
 1e0:	e822                	sd	s0,16(sp)
 1e2:	e426                	sd	s1,8(sp)
 1e4:	e04a                	sd	s2,0(sp)
 1e6:	1000                	addi	s0,sp,32
 1e8:	892e                	mv	s2,a1
 1ea:	4581                	li	a1,0
 1ec:	00000097          	auipc	ra,0x0
 1f0:	188080e7          	jalr	392(ra) # 374 <open>
 1f4:	02054563          	bltz	a0,21e <stat+0x42>
 1f8:	84aa                	mv	s1,a0
 1fa:	85ca                	mv	a1,s2
 1fc:	00000097          	auipc	ra,0x0
 200:	180080e7          	jalr	384(ra) # 37c <fstat>
 204:	892a                	mv	s2,a0
 206:	8526                	mv	a0,s1
 208:	00000097          	auipc	ra,0x0
 20c:	154080e7          	jalr	340(ra) # 35c <close>
 210:	854a                	mv	a0,s2
 212:	60e2                	ld	ra,24(sp)
 214:	6442                	ld	s0,16(sp)
 216:	64a2                	ld	s1,8(sp)
 218:	6902                	ld	s2,0(sp)
 21a:	6105                	addi	sp,sp,32
 21c:	8082                	ret
 21e:	597d                	li	s2,-1
 220:	bfc5                	j	210 <stat+0x34>

0000000000000222 <atoi>:
 222:	1141                	addi	sp,sp,-16
 224:	e422                	sd	s0,8(sp)
 226:	0800                	addi	s0,sp,16
 228:	00054703          	lbu	a4,0(a0)
 22c:	02d00793          	li	a5,45
 230:	4585                	li	a1,1
 232:	04f70363          	beq	a4,a5,278 <atoi+0x56>
 236:	00054703          	lbu	a4,0(a0)
 23a:	fd07079b          	addiw	a5,a4,-48
 23e:	0ff7f793          	zext.b	a5,a5
 242:	46a5                	li	a3,9
 244:	02f6ed63          	bltu	a3,a5,27e <atoi+0x5c>
 248:	4681                	li	a3,0
 24a:	4625                	li	a2,9
 24c:	0505                	addi	a0,a0,1
 24e:	0026979b          	slliw	a5,a3,0x2
 252:	9fb5                	addw	a5,a5,a3
 254:	0017979b          	slliw	a5,a5,0x1
 258:	9fb9                	addw	a5,a5,a4
 25a:	fd07869b          	addiw	a3,a5,-48
 25e:	00054703          	lbu	a4,0(a0)
 262:	fd07079b          	addiw	a5,a4,-48
 266:	0ff7f793          	zext.b	a5,a5
 26a:	fef671e3          	bgeu	a2,a5,24c <atoi+0x2a>
 26e:	02d5853b          	mulw	a0,a1,a3
 272:	6422                	ld	s0,8(sp)
 274:	0141                	addi	sp,sp,16
 276:	8082                	ret
 278:	0505                	addi	a0,a0,1
 27a:	55fd                	li	a1,-1
 27c:	bf6d                	j	236 <atoi+0x14>
 27e:	4681                	li	a3,0
 280:	b7fd                	j	26e <atoi+0x4c>

0000000000000282 <memmove>:
 282:	1141                	addi	sp,sp,-16
 284:	e422                	sd	s0,8(sp)
 286:	0800                	addi	s0,sp,16
 288:	02b57463          	bgeu	a0,a1,2b0 <memmove+0x2e>
 28c:	00c05f63          	blez	a2,2aa <memmove+0x28>
 290:	1602                	slli	a2,a2,0x20
 292:	9201                	srli	a2,a2,0x20
 294:	00c507b3          	add	a5,a0,a2
 298:	872a                	mv	a4,a0
 29a:	0585                	addi	a1,a1,1
 29c:	0705                	addi	a4,a4,1
 29e:	fff5c683          	lbu	a3,-1(a1)
 2a2:	fed70fa3          	sb	a3,-1(a4)
 2a6:	fee79ae3          	bne	a5,a4,29a <memmove+0x18>
 2aa:	6422                	ld	s0,8(sp)
 2ac:	0141                	addi	sp,sp,16
 2ae:	8082                	ret
 2b0:	00c50733          	add	a4,a0,a2
 2b4:	95b2                	add	a1,a1,a2
 2b6:	fec05ae3          	blez	a2,2aa <memmove+0x28>
 2ba:	fff6079b          	addiw	a5,a2,-1
 2be:	1782                	slli	a5,a5,0x20
 2c0:	9381                	srli	a5,a5,0x20
 2c2:	fff7c793          	not	a5,a5
 2c6:	97ba                	add	a5,a5,a4
 2c8:	15fd                	addi	a1,a1,-1
 2ca:	177d                	addi	a4,a4,-1
 2cc:	0005c683          	lbu	a3,0(a1)
 2d0:	00d70023          	sb	a3,0(a4)
 2d4:	fee79ae3          	bne	a5,a4,2c8 <memmove+0x46>
 2d8:	bfc9                	j	2aa <memmove+0x28>

00000000000002da <memcmp>:
 2da:	1141                	addi	sp,sp,-16
 2dc:	e422                	sd	s0,8(sp)
 2de:	0800                	addi	s0,sp,16
 2e0:	ca05                	beqz	a2,310 <memcmp+0x36>
 2e2:	fff6069b          	addiw	a3,a2,-1
 2e6:	1682                	slli	a3,a3,0x20
 2e8:	9281                	srli	a3,a3,0x20
 2ea:	0685                	addi	a3,a3,1
 2ec:	96aa                	add	a3,a3,a0
 2ee:	00054783          	lbu	a5,0(a0)
 2f2:	0005c703          	lbu	a4,0(a1)
 2f6:	00e79863          	bne	a5,a4,306 <memcmp+0x2c>
 2fa:	0505                	addi	a0,a0,1
 2fc:	0585                	addi	a1,a1,1
 2fe:	fed518e3          	bne	a0,a3,2ee <memcmp+0x14>
 302:	4501                	li	a0,0
 304:	a019                	j	30a <memcmp+0x30>
 306:	40e7853b          	subw	a0,a5,a4
 30a:	6422                	ld	s0,8(sp)
 30c:	0141                	addi	sp,sp,16
 30e:	8082                	ret
 310:	4501                	li	a0,0
 312:	bfe5                	j	30a <memcmp+0x30>

0000000000000314 <memcpy>:
 314:	1141                	addi	sp,sp,-16
 316:	e406                	sd	ra,8(sp)
 318:	e022                	sd	s0,0(sp)
 31a:	0800                	addi	s0,sp,16
 31c:	00000097          	auipc	ra,0x0
 320:	f66080e7          	jalr	-154(ra) # 282 <memmove>
 324:	60a2                	ld	ra,8(sp)
 326:	6402                	ld	s0,0(sp)
 328:	0141                	addi	sp,sp,16
 32a:	8082                	ret

000000000000032c <fork>:
 32c:	4885                	li	a7,1
 32e:	00000073          	ecall
 332:	8082                	ret

0000000000000334 <exit>:
 334:	4889                	li	a7,2
 336:	00000073          	ecall
 33a:	8082                	ret

000000000000033c <wait>:
 33c:	488d                	li	a7,3
 33e:	00000073          	ecall
 342:	8082                	ret

0000000000000344 <pipe>:
 344:	4891                	li	a7,4
 346:	00000073          	ecall
 34a:	8082                	ret

000000000000034c <read>:
 34c:	4895                	li	a7,5
 34e:	00000073          	ecall
 352:	8082                	ret

0000000000000354 <write>:
 354:	48c1                	li	a7,16
 356:	00000073          	ecall
 35a:	8082                	ret

000000000000035c <close>:
 35c:	48d5                	li	a7,21
 35e:	00000073          	ecall
 362:	8082                	ret

0000000000000364 <kill>:
 364:	4899                	li	a7,6
 366:	00000073          	ecall
 36a:	8082                	ret

000000000000036c <exec>:
 36c:	489d                	li	a7,7
 36e:	00000073          	ecall
 372:	8082                	ret

0000000000000374 <open>:
 374:	48bd                	li	a7,15
 376:	00000073          	ecall
 37a:	8082                	ret

000000000000037c <fstat>:
 37c:	48a1                	li	a7,8
 37e:	00000073          	ecall
 382:	8082                	ret

0000000000000384 <mkdir>:
 384:	48d1                	li	a7,20
 386:	00000073          	ecall
 38a:	8082                	ret

000000000000038c <chdir>:
 38c:	48a5                	li	a7,9
 38e:	00000073          	ecall
 392:	8082                	ret

0000000000000394 <dup>:
 394:	48a9                	li	a7,10
 396:	00000073          	ecall
 39a:	8082                	ret

000000000000039c <getpid>:
 39c:	48ad                	li	a7,11
 39e:	00000073          	ecall
 3a2:	8082                	ret

00000000000003a4 <sbrk>:
 3a4:	48b1                	li	a7,12
 3a6:	00000073          	ecall
 3aa:	8082                	ret

00000000000003ac <sleep>:
 3ac:	48b5                	li	a7,13
 3ae:	00000073          	ecall
 3b2:	8082                	ret

00000000000003b4 <uptime>:
 3b4:	48b9                	li	a7,14
 3b6:	00000073          	ecall
 3ba:	8082                	ret

00000000000003bc <test_proc>:
 3bc:	48d9                	li	a7,22
 3be:	00000073          	ecall
 3c2:	8082                	ret

00000000000003c4 <dev>:
 3c4:	48dd                	li	a7,23
 3c6:	00000073          	ecall
 3ca:	8082                	ret

00000000000003cc <readdir>:
 3cc:	48e1                	li	a7,24
 3ce:	00000073          	ecall
 3d2:	8082                	ret

00000000000003d4 <getcwd>:
 3d4:	48e5                	li	a7,25
 3d6:	00000073          	ecall
 3da:	8082                	ret

00000000000003dc <remove>:
 3dc:	48c5                	li	a7,17
 3de:	00000073          	ecall
 3e2:	8082                	ret

00000000000003e4 <trace>:
 3e4:	48c9                	li	a7,18
 3e6:	00000073          	ecall
 3ea:	8082                	ret

00000000000003ec <sysinfo>:
 3ec:	48cd                	li	a7,19
 3ee:	00000073          	ecall
 3f2:	8082                	ret

00000000000003f4 <rename>:
 3f4:	48e9                	li	a7,26
 3f6:	00000073          	ecall
 3fa:	8082                	ret

00000000000003fc <putc>:
 3fc:	1101                	addi	sp,sp,-32
 3fe:	ec06                	sd	ra,24(sp)
 400:	e822                	sd	s0,16(sp)
 402:	1000                	addi	s0,sp,32
 404:	feb407a3          	sb	a1,-17(s0)
 408:	4605                	li	a2,1
 40a:	fef40593          	addi	a1,s0,-17
 40e:	00000097          	auipc	ra,0x0
 412:	f46080e7          	jalr	-186(ra) # 354 <write>
 416:	60e2                	ld	ra,24(sp)
 418:	6442                	ld	s0,16(sp)
 41a:	6105                	addi	sp,sp,32
 41c:	8082                	ret

000000000000041e <printint>:
 41e:	7139                	addi	sp,sp,-64
 420:	fc06                	sd	ra,56(sp)
 422:	f822                	sd	s0,48(sp)
 424:	f426                	sd	s1,40(sp)
 426:	f04a                	sd	s2,32(sp)
 428:	ec4e                	sd	s3,24(sp)
 42a:	0080                	addi	s0,sp,64
 42c:	84aa                	mv	s1,a0
 42e:	c299                	beqz	a3,434 <printint+0x16>
 430:	0805c863          	bltz	a1,4c0 <printint+0xa2>
 434:	2581                	sext.w	a1,a1
 436:	4881                	li	a7,0
 438:	fc040993          	addi	s3,s0,-64
 43c:	86ce                	mv	a3,s3
 43e:	4701                	li	a4,0
 440:	2601                	sext.w	a2,a2
 442:	00000517          	auipc	a0,0x0
 446:	4be50513          	addi	a0,a0,1214 # 900 <digits>
 44a:	883a                	mv	a6,a4
 44c:	2705                	addiw	a4,a4,1
 44e:	02c5f7bb          	remuw	a5,a1,a2
 452:	1782                	slli	a5,a5,0x20
 454:	9381                	srli	a5,a5,0x20
 456:	97aa                	add	a5,a5,a0
 458:	0007c783          	lbu	a5,0(a5)
 45c:	00f68023          	sb	a5,0(a3)
 460:	0005879b          	sext.w	a5,a1
 464:	02c5d5bb          	divuw	a1,a1,a2
 468:	0685                	addi	a3,a3,1
 46a:	fec7f0e3          	bgeu	a5,a2,44a <printint+0x2c>
 46e:	00088c63          	beqz	a7,486 <printint+0x68>
 472:	fd070793          	addi	a5,a4,-48
 476:	00878733          	add	a4,a5,s0
 47a:	02d00793          	li	a5,45
 47e:	fef70823          	sb	a5,-16(a4)
 482:	0028071b          	addiw	a4,a6,2
 486:	02e05663          	blez	a4,4b2 <printint+0x94>
 48a:	fc040913          	addi	s2,s0,-64
 48e:	993a                	add	s2,s2,a4
 490:	19fd                	addi	s3,s3,-1
 492:	99ba                	add	s3,s3,a4
 494:	377d                	addiw	a4,a4,-1
 496:	1702                	slli	a4,a4,0x20
 498:	9301                	srli	a4,a4,0x20
 49a:	40e989b3          	sub	s3,s3,a4
 49e:	fff94583          	lbu	a1,-1(s2)
 4a2:	8526                	mv	a0,s1
 4a4:	00000097          	auipc	ra,0x0
 4a8:	f58080e7          	jalr	-168(ra) # 3fc <putc>
 4ac:	197d                	addi	s2,s2,-1
 4ae:	ff3918e3          	bne	s2,s3,49e <printint+0x80>
 4b2:	70e2                	ld	ra,56(sp)
 4b4:	7442                	ld	s0,48(sp)
 4b6:	74a2                	ld	s1,40(sp)
 4b8:	7902                	ld	s2,32(sp)
 4ba:	69e2                	ld	s3,24(sp)
 4bc:	6121                	addi	sp,sp,64
 4be:	8082                	ret
 4c0:	40b005bb          	negw	a1,a1
 4c4:	4885                	li	a7,1
 4c6:	bf8d                	j	438 <printint+0x1a>

00000000000004c8 <vprintf>:
 4c8:	715d                	addi	sp,sp,-80
 4ca:	e486                	sd	ra,72(sp)
 4cc:	e0a2                	sd	s0,64(sp)
 4ce:	fc26                	sd	s1,56(sp)
 4d0:	f84a                	sd	s2,48(sp)
 4d2:	f44e                	sd	s3,40(sp)
 4d4:	f052                	sd	s4,32(sp)
 4d6:	ec56                	sd	s5,24(sp)
 4d8:	e85a                	sd	s6,16(sp)
 4da:	e45e                	sd	s7,8(sp)
 4dc:	e062                	sd	s8,0(sp)
 4de:	0880                	addi	s0,sp,80
 4e0:	0005c903          	lbu	s2,0(a1)
 4e4:	18090c63          	beqz	s2,67c <vprintf+0x1b4>
 4e8:	8aaa                	mv	s5,a0
 4ea:	8bb2                	mv	s7,a2
 4ec:	00158493          	addi	s1,a1,1
 4f0:	4981                	li	s3,0
 4f2:	02500a13          	li	s4,37
 4f6:	4b55                	li	s6,21
 4f8:	a839                	j	516 <vprintf+0x4e>
 4fa:	85ca                	mv	a1,s2
 4fc:	8556                	mv	a0,s5
 4fe:	00000097          	auipc	ra,0x0
 502:	efe080e7          	jalr	-258(ra) # 3fc <putc>
 506:	a019                	j	50c <vprintf+0x44>
 508:	01498d63          	beq	s3,s4,522 <vprintf+0x5a>
 50c:	0485                	addi	s1,s1,1
 50e:	fff4c903          	lbu	s2,-1(s1)
 512:	16090563          	beqz	s2,67c <vprintf+0x1b4>
 516:	fe0999e3          	bnez	s3,508 <vprintf+0x40>
 51a:	ff4910e3          	bne	s2,s4,4fa <vprintf+0x32>
 51e:	89d2                	mv	s3,s4
 520:	b7f5                	j	50c <vprintf+0x44>
 522:	13490263          	beq	s2,s4,646 <vprintf+0x17e>
 526:	f9d9079b          	addiw	a5,s2,-99
 52a:	0ff7f793          	zext.b	a5,a5
 52e:	12fb6563          	bltu	s6,a5,658 <vprintf+0x190>
 532:	f9d9079b          	addiw	a5,s2,-99
 536:	0ff7f713          	zext.b	a4,a5
 53a:	10eb6f63          	bltu	s6,a4,658 <vprintf+0x190>
 53e:	00271793          	slli	a5,a4,0x2
 542:	00000717          	auipc	a4,0x0
 546:	36670713          	addi	a4,a4,870 # 8a8 <malloc+0x12e>
 54a:	97ba                	add	a5,a5,a4
 54c:	439c                	lw	a5,0(a5)
 54e:	97ba                	add	a5,a5,a4
 550:	8782                	jr	a5
 552:	008b8913          	addi	s2,s7,8
 556:	4685                	li	a3,1
 558:	4629                	li	a2,10
 55a:	000ba583          	lw	a1,0(s7)
 55e:	8556                	mv	a0,s5
 560:	00000097          	auipc	ra,0x0
 564:	ebe080e7          	jalr	-322(ra) # 41e <printint>
 568:	8bca                	mv	s7,s2
 56a:	4981                	li	s3,0
 56c:	b745                	j	50c <vprintf+0x44>
 56e:	008b8913          	addi	s2,s7,8
 572:	4681                	li	a3,0
 574:	4629                	li	a2,10
 576:	000ba583          	lw	a1,0(s7)
 57a:	8556                	mv	a0,s5
 57c:	00000097          	auipc	ra,0x0
 580:	ea2080e7          	jalr	-350(ra) # 41e <printint>
 584:	8bca                	mv	s7,s2
 586:	4981                	li	s3,0
 588:	b751                	j	50c <vprintf+0x44>
 58a:	008b8913          	addi	s2,s7,8
 58e:	4681                	li	a3,0
 590:	4641                	li	a2,16
 592:	000ba583          	lw	a1,0(s7)
 596:	8556                	mv	a0,s5
 598:	00000097          	auipc	ra,0x0
 59c:	e86080e7          	jalr	-378(ra) # 41e <printint>
 5a0:	8bca                	mv	s7,s2
 5a2:	4981                	li	s3,0
 5a4:	b7a5                	j	50c <vprintf+0x44>
 5a6:	008b8c13          	addi	s8,s7,8
 5aa:	000bb983          	ld	s3,0(s7)
 5ae:	03000593          	li	a1,48
 5b2:	8556                	mv	a0,s5
 5b4:	00000097          	auipc	ra,0x0
 5b8:	e48080e7          	jalr	-440(ra) # 3fc <putc>
 5bc:	07800593          	li	a1,120
 5c0:	8556                	mv	a0,s5
 5c2:	00000097          	auipc	ra,0x0
 5c6:	e3a080e7          	jalr	-454(ra) # 3fc <putc>
 5ca:	4941                	li	s2,16
 5cc:	00000b97          	auipc	s7,0x0
 5d0:	334b8b93          	addi	s7,s7,820 # 900 <digits>
 5d4:	03c9d793          	srli	a5,s3,0x3c
 5d8:	97de                	add	a5,a5,s7
 5da:	0007c583          	lbu	a1,0(a5)
 5de:	8556                	mv	a0,s5
 5e0:	00000097          	auipc	ra,0x0
 5e4:	e1c080e7          	jalr	-484(ra) # 3fc <putc>
 5e8:	0992                	slli	s3,s3,0x4
 5ea:	397d                	addiw	s2,s2,-1
 5ec:	fe0914e3          	bnez	s2,5d4 <vprintf+0x10c>
 5f0:	8be2                	mv	s7,s8
 5f2:	4981                	li	s3,0
 5f4:	bf21                	j	50c <vprintf+0x44>
 5f6:	008b8993          	addi	s3,s7,8
 5fa:	000bb903          	ld	s2,0(s7)
 5fe:	02090163          	beqz	s2,620 <vprintf+0x158>
 602:	00094583          	lbu	a1,0(s2)
 606:	c9a5                	beqz	a1,676 <vprintf+0x1ae>
 608:	8556                	mv	a0,s5
 60a:	00000097          	auipc	ra,0x0
 60e:	df2080e7          	jalr	-526(ra) # 3fc <putc>
 612:	0905                	addi	s2,s2,1
 614:	00094583          	lbu	a1,0(s2)
 618:	f9e5                	bnez	a1,608 <vprintf+0x140>
 61a:	8bce                	mv	s7,s3
 61c:	4981                	li	s3,0
 61e:	b5fd                	j	50c <vprintf+0x44>
 620:	00000917          	auipc	s2,0x0
 624:	28090913          	addi	s2,s2,640 # 8a0 <malloc+0x126>
 628:	02800593          	li	a1,40
 62c:	bff1                	j	608 <vprintf+0x140>
 62e:	008b8913          	addi	s2,s7,8
 632:	000bc583          	lbu	a1,0(s7)
 636:	8556                	mv	a0,s5
 638:	00000097          	auipc	ra,0x0
 63c:	dc4080e7          	jalr	-572(ra) # 3fc <putc>
 640:	8bca                	mv	s7,s2
 642:	4981                	li	s3,0
 644:	b5e1                	j	50c <vprintf+0x44>
 646:	02500593          	li	a1,37
 64a:	8556                	mv	a0,s5
 64c:	00000097          	auipc	ra,0x0
 650:	db0080e7          	jalr	-592(ra) # 3fc <putc>
 654:	4981                	li	s3,0
 656:	bd5d                	j	50c <vprintf+0x44>
 658:	02500593          	li	a1,37
 65c:	8556                	mv	a0,s5
 65e:	00000097          	auipc	ra,0x0
 662:	d9e080e7          	jalr	-610(ra) # 3fc <putc>
 666:	85ca                	mv	a1,s2
 668:	8556                	mv	a0,s5
 66a:	00000097          	auipc	ra,0x0
 66e:	d92080e7          	jalr	-622(ra) # 3fc <putc>
 672:	4981                	li	s3,0
 674:	bd61                	j	50c <vprintf+0x44>
 676:	8bce                	mv	s7,s3
 678:	4981                	li	s3,0
 67a:	bd49                	j	50c <vprintf+0x44>
 67c:	60a6                	ld	ra,72(sp)
 67e:	6406                	ld	s0,64(sp)
 680:	74e2                	ld	s1,56(sp)
 682:	7942                	ld	s2,48(sp)
 684:	79a2                	ld	s3,40(sp)
 686:	7a02                	ld	s4,32(sp)
 688:	6ae2                	ld	s5,24(sp)
 68a:	6b42                	ld	s6,16(sp)
 68c:	6ba2                	ld	s7,8(sp)
 68e:	6c02                	ld	s8,0(sp)
 690:	6161                	addi	sp,sp,80
 692:	8082                	ret

0000000000000694 <fprintf>:
 694:	715d                	addi	sp,sp,-80
 696:	ec06                	sd	ra,24(sp)
 698:	e822                	sd	s0,16(sp)
 69a:	1000                	addi	s0,sp,32
 69c:	e010                	sd	a2,0(s0)
 69e:	e414                	sd	a3,8(s0)
 6a0:	e818                	sd	a4,16(s0)
 6a2:	ec1c                	sd	a5,24(s0)
 6a4:	03043023          	sd	a6,32(s0)
 6a8:	03143423          	sd	a7,40(s0)
 6ac:	8622                	mv	a2,s0
 6ae:	fe843423          	sd	s0,-24(s0)
 6b2:	00000097          	auipc	ra,0x0
 6b6:	e16080e7          	jalr	-490(ra) # 4c8 <vprintf>
 6ba:	60e2                	ld	ra,24(sp)
 6bc:	6442                	ld	s0,16(sp)
 6be:	6161                	addi	sp,sp,80
 6c0:	8082                	ret

00000000000006c2 <printf>:
 6c2:	711d                	addi	sp,sp,-96
 6c4:	ec06                	sd	ra,24(sp)
 6c6:	e822                	sd	s0,16(sp)
 6c8:	1000                	addi	s0,sp,32
 6ca:	e40c                	sd	a1,8(s0)
 6cc:	e810                	sd	a2,16(s0)
 6ce:	ec14                	sd	a3,24(s0)
 6d0:	f018                	sd	a4,32(s0)
 6d2:	f41c                	sd	a5,40(s0)
 6d4:	03043823          	sd	a6,48(s0)
 6d8:	03143c23          	sd	a7,56(s0)
 6dc:	00840613          	addi	a2,s0,8
 6e0:	fec43423          	sd	a2,-24(s0)
 6e4:	85aa                	mv	a1,a0
 6e6:	4505                	li	a0,1
 6e8:	00000097          	auipc	ra,0x0
 6ec:	de0080e7          	jalr	-544(ra) # 4c8 <vprintf>
 6f0:	60e2                	ld	ra,24(sp)
 6f2:	6442                	ld	s0,16(sp)
 6f4:	6125                	addi	sp,sp,96
 6f6:	8082                	ret

00000000000006f8 <free>:
 6f8:	1141                	addi	sp,sp,-16
 6fa:	e422                	sd	s0,8(sp)
 6fc:	0800                	addi	s0,sp,16
 6fe:	ff050693          	addi	a3,a0,-16
 702:	00000797          	auipc	a5,0x0
 706:	2167b783          	ld	a5,534(a5) # 918 <freep>
 70a:	a02d                	j	734 <free+0x3c>
 70c:	4618                	lw	a4,8(a2)
 70e:	9f2d                	addw	a4,a4,a1
 710:	fee52c23          	sw	a4,-8(a0)
 714:	6398                	ld	a4,0(a5)
 716:	6310                	ld	a2,0(a4)
 718:	a83d                	j	756 <free+0x5e>
 71a:	ff852703          	lw	a4,-8(a0)
 71e:	9f31                	addw	a4,a4,a2
 720:	c798                	sw	a4,8(a5)
 722:	ff053683          	ld	a3,-16(a0)
 726:	a091                	j	76a <free+0x72>
 728:	6398                	ld	a4,0(a5)
 72a:	00e7e463          	bltu	a5,a4,732 <free+0x3a>
 72e:	00e6ea63          	bltu	a3,a4,742 <free+0x4a>
 732:	87ba                	mv	a5,a4
 734:	fed7fae3          	bgeu	a5,a3,728 <free+0x30>
 738:	6398                	ld	a4,0(a5)
 73a:	00e6e463          	bltu	a3,a4,742 <free+0x4a>
 73e:	fee7eae3          	bltu	a5,a4,732 <free+0x3a>
 742:	ff852583          	lw	a1,-8(a0)
 746:	6390                	ld	a2,0(a5)
 748:	02059813          	slli	a6,a1,0x20
 74c:	01c85713          	srli	a4,a6,0x1c
 750:	9736                	add	a4,a4,a3
 752:	fae60de3          	beq	a2,a4,70c <free+0x14>
 756:	fec53823          	sd	a2,-16(a0)
 75a:	4790                	lw	a2,8(a5)
 75c:	02061593          	slli	a1,a2,0x20
 760:	01c5d713          	srli	a4,a1,0x1c
 764:	973e                	add	a4,a4,a5
 766:	fae68ae3          	beq	a3,a4,71a <free+0x22>
 76a:	e394                	sd	a3,0(a5)
 76c:	00000717          	auipc	a4,0x0
 770:	1af73623          	sd	a5,428(a4) # 918 <freep>
 774:	6422                	ld	s0,8(sp)
 776:	0141                	addi	sp,sp,16
 778:	8082                	ret

000000000000077a <malloc>:
 77a:	7139                	addi	sp,sp,-64
 77c:	fc06                	sd	ra,56(sp)
 77e:	f822                	sd	s0,48(sp)
 780:	f426                	sd	s1,40(sp)
 782:	f04a                	sd	s2,32(sp)
 784:	ec4e                	sd	s3,24(sp)
 786:	e852                	sd	s4,16(sp)
 788:	e456                	sd	s5,8(sp)
 78a:	e05a                	sd	s6,0(sp)
 78c:	0080                	addi	s0,sp,64
 78e:	02051493          	slli	s1,a0,0x20
 792:	9081                	srli	s1,s1,0x20
 794:	04bd                	addi	s1,s1,15
 796:	8091                	srli	s1,s1,0x4
 798:	0014899b          	addiw	s3,s1,1
 79c:	0485                	addi	s1,s1,1
 79e:	00000517          	auipc	a0,0x0
 7a2:	17a53503          	ld	a0,378(a0) # 918 <freep>
 7a6:	c515                	beqz	a0,7d2 <malloc+0x58>
 7a8:	611c                	ld	a5,0(a0)
 7aa:	4798                	lw	a4,8(a5)
 7ac:	04977063          	bgeu	a4,s1,7ec <malloc+0x72>
 7b0:	8a4e                	mv	s4,s3
 7b2:	0009871b          	sext.w	a4,s3
 7b6:	6685                	lui	a3,0x1
 7b8:	00d77363          	bgeu	a4,a3,7be <malloc+0x44>
 7bc:	6a05                	lui	s4,0x1
 7be:	000a0b1b          	sext.w	s6,s4
 7c2:	004a1a1b          	slliw	s4,s4,0x4
 7c6:	00000917          	auipc	s2,0x0
 7ca:	15290913          	addi	s2,s2,338 # 918 <freep>
 7ce:	5afd                	li	s5,-1
 7d0:	a89d                	j	846 <malloc+0xcc>
 7d2:	00000717          	auipc	a4,0x0
 7d6:	14670713          	addi	a4,a4,326 # 918 <freep>
 7da:	00000797          	auipc	a5,0x0
 7de:	14678793          	addi	a5,a5,326 # 920 <base>
 7e2:	e31c                	sd	a5,0(a4)
 7e4:	e71c                	sd	a5,8(a4)
 7e6:	00072823          	sw	zero,16(a4)
 7ea:	b7d9                	j	7b0 <malloc+0x36>
 7ec:	02e48c63          	beq	s1,a4,824 <malloc+0xaa>
 7f0:	4137073b          	subw	a4,a4,s3
 7f4:	c798                	sw	a4,8(a5)
 7f6:	02071693          	slli	a3,a4,0x20
 7fa:	01c6d713          	srli	a4,a3,0x1c
 7fe:	97ba                	add	a5,a5,a4
 800:	0137a423          	sw	s3,8(a5)
 804:	00000717          	auipc	a4,0x0
 808:	10a73a23          	sd	a0,276(a4) # 918 <freep>
 80c:	01078513          	addi	a0,a5,16
 810:	70e2                	ld	ra,56(sp)
 812:	7442                	ld	s0,48(sp)
 814:	74a2                	ld	s1,40(sp)
 816:	7902                	ld	s2,32(sp)
 818:	69e2                	ld	s3,24(sp)
 81a:	6a42                	ld	s4,16(sp)
 81c:	6aa2                	ld	s5,8(sp)
 81e:	6b02                	ld	s6,0(sp)
 820:	6121                	addi	sp,sp,64
 822:	8082                	ret
 824:	6398                	ld	a4,0(a5)
 826:	e118                	sd	a4,0(a0)
 828:	bff1                	j	804 <malloc+0x8a>
 82a:	01652423          	sw	s6,8(a0)
 82e:	0541                	addi	a0,a0,16
 830:	00000097          	auipc	ra,0x0
 834:	ec8080e7          	jalr	-312(ra) # 6f8 <free>
 838:	00093503          	ld	a0,0(s2)
 83c:	d971                	beqz	a0,810 <malloc+0x96>
 83e:	611c                	ld	a5,0(a0)
 840:	4798                	lw	a4,8(a5)
 842:	fa9775e3          	bgeu	a4,s1,7ec <malloc+0x72>
 846:	00093703          	ld	a4,0(s2)
 84a:	853e                	mv	a0,a5
 84c:	fef719e3          	bne	a4,a5,83e <malloc+0xc4>
 850:	8552                	mv	a0,s4
 852:	00000097          	auipc	ra,0x0
 856:	b52080e7          	jalr	-1198(ra) # 3a4 <sbrk>
 85a:	fd5518e3          	bne	a0,s5,82a <malloc+0xb0>
 85e:	4501                	li	a0,0
 860:	bf45                	j	810 <malloc+0x96>
