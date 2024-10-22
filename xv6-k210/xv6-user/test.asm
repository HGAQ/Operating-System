
xv6-user/_test:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/include/stat.h"
#include "kernel/include/sysinfo.h"
#include "xv6-user/user.h"

int main()
{
   0:	1101                	addi	sp,sp,-32
   2:	ec06                	sd	ra,24(sp)
   4:	e822                	sd	s0,16(sp)
   6:	1000                	addi	s0,sp,32
    struct sysinfo info;
    if (sysinfo(&info) < 0) {
   8:	fe040513          	addi	a0,s0,-32
   c:	00000097          	auipc	ra,0x0
  10:	3c2080e7          	jalr	962(ra) # 3ce <sysinfo>
  14:	02054c63          	bltz	a0,4c <main+0x4c>
        printf("sysinfo fail!\n");
    } else {
        printf("memory left: %d KB\n", info.freemem >> 10);
  18:	fe043583          	ld	a1,-32(s0)
  1c:	81a9                	srli	a1,a1,0xa
  1e:	00001517          	auipc	a0,0x1
  22:	83a50513          	addi	a0,a0,-1990 # 858 <malloc+0xfc>
  26:	00000097          	auipc	ra,0x0
  2a:	67e080e7          	jalr	1662(ra) # 6a4 <printf>
        printf("process amount: %d\n", info.nproc);
  2e:	fe843583          	ld	a1,-24(s0)
  32:	00001517          	auipc	a0,0x1
  36:	83e50513          	addi	a0,a0,-1986 # 870 <malloc+0x114>
  3a:	00000097          	auipc	ra,0x0
  3e:	66a080e7          	jalr	1642(ra) # 6a4 <printf>
    }
    exit(0);
  42:	4501                	li	a0,0
  44:	00000097          	auipc	ra,0x0
  48:	2d2080e7          	jalr	722(ra) # 316 <exit>
        printf("sysinfo fail!\n");
  4c:	00000517          	auipc	a0,0x0
  50:	7fc50513          	addi	a0,a0,2044 # 848 <malloc+0xec>
  54:	00000097          	auipc	ra,0x0
  58:	650080e7          	jalr	1616(ra) # 6a4 <printf>
  5c:	b7dd                	j	42 <main+0x42>

000000000000005e <strcpy>:
  5e:	1141                	addi	sp,sp,-16
  60:	e422                	sd	s0,8(sp)
  62:	0800                	addi	s0,sp,16
  64:	87aa                	mv	a5,a0
  66:	0585                	addi	a1,a1,1
  68:	0785                	addi	a5,a5,1
  6a:	fff5c703          	lbu	a4,-1(a1)
  6e:	fee78fa3          	sb	a4,-1(a5)
  72:	fb75                	bnez	a4,66 <strcpy+0x8>
  74:	6422                	ld	s0,8(sp)
  76:	0141                	addi	sp,sp,16
  78:	8082                	ret

000000000000007a <strcat>:
  7a:	1141                	addi	sp,sp,-16
  7c:	e422                	sd	s0,8(sp)
  7e:	0800                	addi	s0,sp,16
  80:	00054783          	lbu	a5,0(a0)
  84:	c385                	beqz	a5,a4 <strcat+0x2a>
  86:	87aa                	mv	a5,a0
  88:	0785                	addi	a5,a5,1
  8a:	0007c703          	lbu	a4,0(a5)
  8e:	ff6d                	bnez	a4,88 <strcat+0xe>
  90:	0585                	addi	a1,a1,1
  92:	0785                	addi	a5,a5,1
  94:	fff5c703          	lbu	a4,-1(a1)
  98:	fee78fa3          	sb	a4,-1(a5)
  9c:	fb75                	bnez	a4,90 <strcat+0x16>
  9e:	6422                	ld	s0,8(sp)
  a0:	0141                	addi	sp,sp,16
  a2:	8082                	ret
  a4:	87aa                	mv	a5,a0
  a6:	b7ed                	j	90 <strcat+0x16>

00000000000000a8 <strcmp>:
  a8:	1141                	addi	sp,sp,-16
  aa:	e422                	sd	s0,8(sp)
  ac:	0800                	addi	s0,sp,16
  ae:	00054783          	lbu	a5,0(a0)
  b2:	cb91                	beqz	a5,c6 <strcmp+0x1e>
  b4:	0005c703          	lbu	a4,0(a1)
  b8:	00f71763          	bne	a4,a5,c6 <strcmp+0x1e>
  bc:	0505                	addi	a0,a0,1
  be:	0585                	addi	a1,a1,1
  c0:	00054783          	lbu	a5,0(a0)
  c4:	fbe5                	bnez	a5,b4 <strcmp+0xc>
  c6:	0005c503          	lbu	a0,0(a1)
  ca:	40a7853b          	subw	a0,a5,a0
  ce:	6422                	ld	s0,8(sp)
  d0:	0141                	addi	sp,sp,16
  d2:	8082                	ret

00000000000000d4 <strlen>:
  d4:	1141                	addi	sp,sp,-16
  d6:	e422                	sd	s0,8(sp)
  d8:	0800                	addi	s0,sp,16
  da:	00054783          	lbu	a5,0(a0)
  de:	cf91                	beqz	a5,fa <strlen+0x26>
  e0:	0505                	addi	a0,a0,1
  e2:	87aa                	mv	a5,a0
  e4:	86be                	mv	a3,a5
  e6:	0785                	addi	a5,a5,1
  e8:	fff7c703          	lbu	a4,-1(a5)
  ec:	ff65                	bnez	a4,e4 <strlen+0x10>
  ee:	40a6853b          	subw	a0,a3,a0
  f2:	2505                	addiw	a0,a0,1
  f4:	6422                	ld	s0,8(sp)
  f6:	0141                	addi	sp,sp,16
  f8:	8082                	ret
  fa:	4501                	li	a0,0
  fc:	bfe5                	j	f4 <strlen+0x20>

00000000000000fe <memset>:
  fe:	1141                	addi	sp,sp,-16
 100:	e422                	sd	s0,8(sp)
 102:	0800                	addi	s0,sp,16
 104:	ca19                	beqz	a2,11a <memset+0x1c>
 106:	87aa                	mv	a5,a0
 108:	1602                	slli	a2,a2,0x20
 10a:	9201                	srli	a2,a2,0x20
 10c:	00a60733          	add	a4,a2,a0
 110:	00b78023          	sb	a1,0(a5)
 114:	0785                	addi	a5,a5,1
 116:	fee79de3          	bne	a5,a4,110 <memset+0x12>
 11a:	6422                	ld	s0,8(sp)
 11c:	0141                	addi	sp,sp,16
 11e:	8082                	ret

0000000000000120 <strchr>:
 120:	1141                	addi	sp,sp,-16
 122:	e422                	sd	s0,8(sp)
 124:	0800                	addi	s0,sp,16
 126:	00054783          	lbu	a5,0(a0)
 12a:	cb99                	beqz	a5,140 <strchr+0x20>
 12c:	00f58763          	beq	a1,a5,13a <strchr+0x1a>
 130:	0505                	addi	a0,a0,1
 132:	00054783          	lbu	a5,0(a0)
 136:	fbfd                	bnez	a5,12c <strchr+0xc>
 138:	4501                	li	a0,0
 13a:	6422                	ld	s0,8(sp)
 13c:	0141                	addi	sp,sp,16
 13e:	8082                	ret
 140:	4501                	li	a0,0
 142:	bfe5                	j	13a <strchr+0x1a>

0000000000000144 <gets>:
 144:	711d                	addi	sp,sp,-96
 146:	ec86                	sd	ra,88(sp)
 148:	e8a2                	sd	s0,80(sp)
 14a:	e4a6                	sd	s1,72(sp)
 14c:	e0ca                	sd	s2,64(sp)
 14e:	fc4e                	sd	s3,56(sp)
 150:	f852                	sd	s4,48(sp)
 152:	f456                	sd	s5,40(sp)
 154:	f05a                	sd	s6,32(sp)
 156:	ec5e                	sd	s7,24(sp)
 158:	e862                	sd	s8,16(sp)
 15a:	1080                	addi	s0,sp,96
 15c:	8baa                	mv	s7,a0
 15e:	8a2e                	mv	s4,a1
 160:	892a                	mv	s2,a0
 162:	4481                	li	s1,0
 164:	faf40a93          	addi	s5,s0,-81
 168:	4b29                	li	s6,10
 16a:	4c35                	li	s8,13
 16c:	89a6                	mv	s3,s1
 16e:	2485                	addiw	s1,s1,1
 170:	0344d763          	bge	s1,s4,19e <gets+0x5a>
 174:	4605                	li	a2,1
 176:	85d6                	mv	a1,s5
 178:	4501                	li	a0,0
 17a:	00000097          	auipc	ra,0x0
 17e:	1b4080e7          	jalr	436(ra) # 32e <read>
 182:	00a05e63          	blez	a0,19e <gets+0x5a>
 186:	faf44783          	lbu	a5,-81(s0)
 18a:	00f90023          	sb	a5,0(s2)
 18e:	01678763          	beq	a5,s6,19c <gets+0x58>
 192:	0905                	addi	s2,s2,1
 194:	fd879ce3          	bne	a5,s8,16c <gets+0x28>
 198:	89a6                	mv	s3,s1
 19a:	a011                	j	19e <gets+0x5a>
 19c:	89a6                	mv	s3,s1
 19e:	99de                	add	s3,s3,s7
 1a0:	00098023          	sb	zero,0(s3)
 1a4:	855e                	mv	a0,s7
 1a6:	60e6                	ld	ra,88(sp)
 1a8:	6446                	ld	s0,80(sp)
 1aa:	64a6                	ld	s1,72(sp)
 1ac:	6906                	ld	s2,64(sp)
 1ae:	79e2                	ld	s3,56(sp)
 1b0:	7a42                	ld	s4,48(sp)
 1b2:	7aa2                	ld	s5,40(sp)
 1b4:	7b02                	ld	s6,32(sp)
 1b6:	6be2                	ld	s7,24(sp)
 1b8:	6c42                	ld	s8,16(sp)
 1ba:	6125                	addi	sp,sp,96
 1bc:	8082                	ret

00000000000001be <stat>:
 1be:	1101                	addi	sp,sp,-32
 1c0:	ec06                	sd	ra,24(sp)
 1c2:	e822                	sd	s0,16(sp)
 1c4:	e426                	sd	s1,8(sp)
 1c6:	e04a                	sd	s2,0(sp)
 1c8:	1000                	addi	s0,sp,32
 1ca:	892e                	mv	s2,a1
 1cc:	4581                	li	a1,0
 1ce:	00000097          	auipc	ra,0x0
 1d2:	188080e7          	jalr	392(ra) # 356 <open>
 1d6:	02054563          	bltz	a0,200 <stat+0x42>
 1da:	84aa                	mv	s1,a0
 1dc:	85ca                	mv	a1,s2
 1de:	00000097          	auipc	ra,0x0
 1e2:	180080e7          	jalr	384(ra) # 35e <fstat>
 1e6:	892a                	mv	s2,a0
 1e8:	8526                	mv	a0,s1
 1ea:	00000097          	auipc	ra,0x0
 1ee:	154080e7          	jalr	340(ra) # 33e <close>
 1f2:	854a                	mv	a0,s2
 1f4:	60e2                	ld	ra,24(sp)
 1f6:	6442                	ld	s0,16(sp)
 1f8:	64a2                	ld	s1,8(sp)
 1fa:	6902                	ld	s2,0(sp)
 1fc:	6105                	addi	sp,sp,32
 1fe:	8082                	ret
 200:	597d                	li	s2,-1
 202:	bfc5                	j	1f2 <stat+0x34>

0000000000000204 <atoi>:
 204:	1141                	addi	sp,sp,-16
 206:	e422                	sd	s0,8(sp)
 208:	0800                	addi	s0,sp,16
 20a:	00054703          	lbu	a4,0(a0)
 20e:	02d00793          	li	a5,45
 212:	4585                	li	a1,1
 214:	04f70363          	beq	a4,a5,25a <atoi+0x56>
 218:	00054703          	lbu	a4,0(a0)
 21c:	fd07079b          	addiw	a5,a4,-48
 220:	0ff7f793          	zext.b	a5,a5
 224:	46a5                	li	a3,9
 226:	02f6ed63          	bltu	a3,a5,260 <atoi+0x5c>
 22a:	4681                	li	a3,0
 22c:	4625                	li	a2,9
 22e:	0505                	addi	a0,a0,1
 230:	0026979b          	slliw	a5,a3,0x2
 234:	9fb5                	addw	a5,a5,a3
 236:	0017979b          	slliw	a5,a5,0x1
 23a:	9fb9                	addw	a5,a5,a4
 23c:	fd07869b          	addiw	a3,a5,-48
 240:	00054703          	lbu	a4,0(a0)
 244:	fd07079b          	addiw	a5,a4,-48
 248:	0ff7f793          	zext.b	a5,a5
 24c:	fef671e3          	bgeu	a2,a5,22e <atoi+0x2a>
 250:	02d5853b          	mulw	a0,a1,a3
 254:	6422                	ld	s0,8(sp)
 256:	0141                	addi	sp,sp,16
 258:	8082                	ret
 25a:	0505                	addi	a0,a0,1
 25c:	55fd                	li	a1,-1
 25e:	bf6d                	j	218 <atoi+0x14>
 260:	4681                	li	a3,0
 262:	b7fd                	j	250 <atoi+0x4c>

0000000000000264 <memmove>:
 264:	1141                	addi	sp,sp,-16
 266:	e422                	sd	s0,8(sp)
 268:	0800                	addi	s0,sp,16
 26a:	02b57463          	bgeu	a0,a1,292 <memmove+0x2e>
 26e:	00c05f63          	blez	a2,28c <memmove+0x28>
 272:	1602                	slli	a2,a2,0x20
 274:	9201                	srli	a2,a2,0x20
 276:	00c507b3          	add	a5,a0,a2
 27a:	872a                	mv	a4,a0
 27c:	0585                	addi	a1,a1,1
 27e:	0705                	addi	a4,a4,1
 280:	fff5c683          	lbu	a3,-1(a1)
 284:	fed70fa3          	sb	a3,-1(a4)
 288:	fee79ae3          	bne	a5,a4,27c <memmove+0x18>
 28c:	6422                	ld	s0,8(sp)
 28e:	0141                	addi	sp,sp,16
 290:	8082                	ret
 292:	00c50733          	add	a4,a0,a2
 296:	95b2                	add	a1,a1,a2
 298:	fec05ae3          	blez	a2,28c <memmove+0x28>
 29c:	fff6079b          	addiw	a5,a2,-1
 2a0:	1782                	slli	a5,a5,0x20
 2a2:	9381                	srli	a5,a5,0x20
 2a4:	fff7c793          	not	a5,a5
 2a8:	97ba                	add	a5,a5,a4
 2aa:	15fd                	addi	a1,a1,-1
 2ac:	177d                	addi	a4,a4,-1
 2ae:	0005c683          	lbu	a3,0(a1)
 2b2:	00d70023          	sb	a3,0(a4)
 2b6:	fee79ae3          	bne	a5,a4,2aa <memmove+0x46>
 2ba:	bfc9                	j	28c <memmove+0x28>

00000000000002bc <memcmp>:
 2bc:	1141                	addi	sp,sp,-16
 2be:	e422                	sd	s0,8(sp)
 2c0:	0800                	addi	s0,sp,16
 2c2:	ca05                	beqz	a2,2f2 <memcmp+0x36>
 2c4:	fff6069b          	addiw	a3,a2,-1
 2c8:	1682                	slli	a3,a3,0x20
 2ca:	9281                	srli	a3,a3,0x20
 2cc:	0685                	addi	a3,a3,1
 2ce:	96aa                	add	a3,a3,a0
 2d0:	00054783          	lbu	a5,0(a0)
 2d4:	0005c703          	lbu	a4,0(a1)
 2d8:	00e79863          	bne	a5,a4,2e8 <memcmp+0x2c>
 2dc:	0505                	addi	a0,a0,1
 2de:	0585                	addi	a1,a1,1
 2e0:	fed518e3          	bne	a0,a3,2d0 <memcmp+0x14>
 2e4:	4501                	li	a0,0
 2e6:	a019                	j	2ec <memcmp+0x30>
 2e8:	40e7853b          	subw	a0,a5,a4
 2ec:	6422                	ld	s0,8(sp)
 2ee:	0141                	addi	sp,sp,16
 2f0:	8082                	ret
 2f2:	4501                	li	a0,0
 2f4:	bfe5                	j	2ec <memcmp+0x30>

00000000000002f6 <memcpy>:
 2f6:	1141                	addi	sp,sp,-16
 2f8:	e406                	sd	ra,8(sp)
 2fa:	e022                	sd	s0,0(sp)
 2fc:	0800                	addi	s0,sp,16
 2fe:	00000097          	auipc	ra,0x0
 302:	f66080e7          	jalr	-154(ra) # 264 <memmove>
 306:	60a2                	ld	ra,8(sp)
 308:	6402                	ld	s0,0(sp)
 30a:	0141                	addi	sp,sp,16
 30c:	8082                	ret

000000000000030e <fork>:
 30e:	4885                	li	a7,1
 310:	00000073          	ecall
 314:	8082                	ret

0000000000000316 <exit>:
 316:	4889                	li	a7,2
 318:	00000073          	ecall
 31c:	8082                	ret

000000000000031e <wait>:
 31e:	488d                	li	a7,3
 320:	00000073          	ecall
 324:	8082                	ret

0000000000000326 <pipe>:
 326:	4891                	li	a7,4
 328:	00000073          	ecall
 32c:	8082                	ret

000000000000032e <read>:
 32e:	4895                	li	a7,5
 330:	00000073          	ecall
 334:	8082                	ret

0000000000000336 <write>:
 336:	48c1                	li	a7,16
 338:	00000073          	ecall
 33c:	8082                	ret

000000000000033e <close>:
 33e:	48d5                	li	a7,21
 340:	00000073          	ecall
 344:	8082                	ret

0000000000000346 <kill>:
 346:	4899                	li	a7,6
 348:	00000073          	ecall
 34c:	8082                	ret

000000000000034e <exec>:
 34e:	489d                	li	a7,7
 350:	00000073          	ecall
 354:	8082                	ret

0000000000000356 <open>:
 356:	48bd                	li	a7,15
 358:	00000073          	ecall
 35c:	8082                	ret

000000000000035e <fstat>:
 35e:	48a1                	li	a7,8
 360:	00000073          	ecall
 364:	8082                	ret

0000000000000366 <mkdir>:
 366:	48d1                	li	a7,20
 368:	00000073          	ecall
 36c:	8082                	ret

000000000000036e <chdir>:
 36e:	48a5                	li	a7,9
 370:	00000073          	ecall
 374:	8082                	ret

0000000000000376 <dup>:
 376:	48a9                	li	a7,10
 378:	00000073          	ecall
 37c:	8082                	ret

000000000000037e <getpid>:
 37e:	48ad                	li	a7,11
 380:	00000073          	ecall
 384:	8082                	ret

0000000000000386 <sbrk>:
 386:	48b1                	li	a7,12
 388:	00000073          	ecall
 38c:	8082                	ret

000000000000038e <sleep>:
 38e:	48b5                	li	a7,13
 390:	00000073          	ecall
 394:	8082                	ret

0000000000000396 <uptime>:
 396:	48b9                	li	a7,14
 398:	00000073          	ecall
 39c:	8082                	ret

000000000000039e <test_proc>:
 39e:	48d9                	li	a7,22
 3a0:	00000073          	ecall
 3a4:	8082                	ret

00000000000003a6 <dev>:
 3a6:	48dd                	li	a7,23
 3a8:	00000073          	ecall
 3ac:	8082                	ret

00000000000003ae <readdir>:
 3ae:	48e1                	li	a7,24
 3b0:	00000073          	ecall
 3b4:	8082                	ret

00000000000003b6 <getcwd>:
 3b6:	48e5                	li	a7,25
 3b8:	00000073          	ecall
 3bc:	8082                	ret

00000000000003be <remove>:
 3be:	48c5                	li	a7,17
 3c0:	00000073          	ecall
 3c4:	8082                	ret

00000000000003c6 <trace>:
 3c6:	48c9                	li	a7,18
 3c8:	00000073          	ecall
 3cc:	8082                	ret

00000000000003ce <sysinfo>:
 3ce:	48cd                	li	a7,19
 3d0:	00000073          	ecall
 3d4:	8082                	ret

00000000000003d6 <rename>:
 3d6:	48e9                	li	a7,26
 3d8:	00000073          	ecall
 3dc:	8082                	ret

00000000000003de <putc>:
 3de:	1101                	addi	sp,sp,-32
 3e0:	ec06                	sd	ra,24(sp)
 3e2:	e822                	sd	s0,16(sp)
 3e4:	1000                	addi	s0,sp,32
 3e6:	feb407a3          	sb	a1,-17(s0)
 3ea:	4605                	li	a2,1
 3ec:	fef40593          	addi	a1,s0,-17
 3f0:	00000097          	auipc	ra,0x0
 3f4:	f46080e7          	jalr	-186(ra) # 336 <write>
 3f8:	60e2                	ld	ra,24(sp)
 3fa:	6442                	ld	s0,16(sp)
 3fc:	6105                	addi	sp,sp,32
 3fe:	8082                	ret

0000000000000400 <printint>:
 400:	7139                	addi	sp,sp,-64
 402:	fc06                	sd	ra,56(sp)
 404:	f822                	sd	s0,48(sp)
 406:	f426                	sd	s1,40(sp)
 408:	f04a                	sd	s2,32(sp)
 40a:	ec4e                	sd	s3,24(sp)
 40c:	0080                	addi	s0,sp,64
 40e:	84aa                	mv	s1,a0
 410:	c299                	beqz	a3,416 <printint+0x16>
 412:	0805c863          	bltz	a1,4a2 <printint+0xa2>
 416:	2581                	sext.w	a1,a1
 418:	4881                	li	a7,0
 41a:	fc040993          	addi	s3,s0,-64
 41e:	86ce                	mv	a3,s3
 420:	4701                	li	a4,0
 422:	2601                	sext.w	a2,a2
 424:	00000517          	auipc	a0,0x0
 428:	4c450513          	addi	a0,a0,1220 # 8e8 <digits>
 42c:	883a                	mv	a6,a4
 42e:	2705                	addiw	a4,a4,1
 430:	02c5f7bb          	remuw	a5,a1,a2
 434:	1782                	slli	a5,a5,0x20
 436:	9381                	srli	a5,a5,0x20
 438:	97aa                	add	a5,a5,a0
 43a:	0007c783          	lbu	a5,0(a5)
 43e:	00f68023          	sb	a5,0(a3)
 442:	0005879b          	sext.w	a5,a1
 446:	02c5d5bb          	divuw	a1,a1,a2
 44a:	0685                	addi	a3,a3,1
 44c:	fec7f0e3          	bgeu	a5,a2,42c <printint+0x2c>
 450:	00088c63          	beqz	a7,468 <printint+0x68>
 454:	fd070793          	addi	a5,a4,-48
 458:	00878733          	add	a4,a5,s0
 45c:	02d00793          	li	a5,45
 460:	fef70823          	sb	a5,-16(a4)
 464:	0028071b          	addiw	a4,a6,2
 468:	02e05663          	blez	a4,494 <printint+0x94>
 46c:	fc040913          	addi	s2,s0,-64
 470:	993a                	add	s2,s2,a4
 472:	19fd                	addi	s3,s3,-1
 474:	99ba                	add	s3,s3,a4
 476:	377d                	addiw	a4,a4,-1
 478:	1702                	slli	a4,a4,0x20
 47a:	9301                	srli	a4,a4,0x20
 47c:	40e989b3          	sub	s3,s3,a4
 480:	fff94583          	lbu	a1,-1(s2)
 484:	8526                	mv	a0,s1
 486:	00000097          	auipc	ra,0x0
 48a:	f58080e7          	jalr	-168(ra) # 3de <putc>
 48e:	197d                	addi	s2,s2,-1
 490:	ff3918e3          	bne	s2,s3,480 <printint+0x80>
 494:	70e2                	ld	ra,56(sp)
 496:	7442                	ld	s0,48(sp)
 498:	74a2                	ld	s1,40(sp)
 49a:	7902                	ld	s2,32(sp)
 49c:	69e2                	ld	s3,24(sp)
 49e:	6121                	addi	sp,sp,64
 4a0:	8082                	ret
 4a2:	40b005bb          	negw	a1,a1
 4a6:	4885                	li	a7,1
 4a8:	bf8d                	j	41a <printint+0x1a>

00000000000004aa <vprintf>:
 4aa:	715d                	addi	sp,sp,-80
 4ac:	e486                	sd	ra,72(sp)
 4ae:	e0a2                	sd	s0,64(sp)
 4b0:	fc26                	sd	s1,56(sp)
 4b2:	f84a                	sd	s2,48(sp)
 4b4:	f44e                	sd	s3,40(sp)
 4b6:	f052                	sd	s4,32(sp)
 4b8:	ec56                	sd	s5,24(sp)
 4ba:	e85a                	sd	s6,16(sp)
 4bc:	e45e                	sd	s7,8(sp)
 4be:	e062                	sd	s8,0(sp)
 4c0:	0880                	addi	s0,sp,80
 4c2:	0005c903          	lbu	s2,0(a1)
 4c6:	18090c63          	beqz	s2,65e <vprintf+0x1b4>
 4ca:	8aaa                	mv	s5,a0
 4cc:	8bb2                	mv	s7,a2
 4ce:	00158493          	addi	s1,a1,1
 4d2:	4981                	li	s3,0
 4d4:	02500a13          	li	s4,37
 4d8:	4b55                	li	s6,21
 4da:	a839                	j	4f8 <vprintf+0x4e>
 4dc:	85ca                	mv	a1,s2
 4de:	8556                	mv	a0,s5
 4e0:	00000097          	auipc	ra,0x0
 4e4:	efe080e7          	jalr	-258(ra) # 3de <putc>
 4e8:	a019                	j	4ee <vprintf+0x44>
 4ea:	01498d63          	beq	s3,s4,504 <vprintf+0x5a>
 4ee:	0485                	addi	s1,s1,1
 4f0:	fff4c903          	lbu	s2,-1(s1)
 4f4:	16090563          	beqz	s2,65e <vprintf+0x1b4>
 4f8:	fe0999e3          	bnez	s3,4ea <vprintf+0x40>
 4fc:	ff4910e3          	bne	s2,s4,4dc <vprintf+0x32>
 500:	89d2                	mv	s3,s4
 502:	b7f5                	j	4ee <vprintf+0x44>
 504:	13490263          	beq	s2,s4,628 <vprintf+0x17e>
 508:	f9d9079b          	addiw	a5,s2,-99
 50c:	0ff7f793          	zext.b	a5,a5
 510:	12fb6563          	bltu	s6,a5,63a <vprintf+0x190>
 514:	f9d9079b          	addiw	a5,s2,-99
 518:	0ff7f713          	zext.b	a4,a5
 51c:	10eb6f63          	bltu	s6,a4,63a <vprintf+0x190>
 520:	00271793          	slli	a5,a4,0x2
 524:	00000717          	auipc	a4,0x0
 528:	36c70713          	addi	a4,a4,876 # 890 <malloc+0x134>
 52c:	97ba                	add	a5,a5,a4
 52e:	439c                	lw	a5,0(a5)
 530:	97ba                	add	a5,a5,a4
 532:	8782                	jr	a5
 534:	008b8913          	addi	s2,s7,8
 538:	4685                	li	a3,1
 53a:	4629                	li	a2,10
 53c:	000ba583          	lw	a1,0(s7)
 540:	8556                	mv	a0,s5
 542:	00000097          	auipc	ra,0x0
 546:	ebe080e7          	jalr	-322(ra) # 400 <printint>
 54a:	8bca                	mv	s7,s2
 54c:	4981                	li	s3,0
 54e:	b745                	j	4ee <vprintf+0x44>
 550:	008b8913          	addi	s2,s7,8
 554:	4681                	li	a3,0
 556:	4629                	li	a2,10
 558:	000ba583          	lw	a1,0(s7)
 55c:	8556                	mv	a0,s5
 55e:	00000097          	auipc	ra,0x0
 562:	ea2080e7          	jalr	-350(ra) # 400 <printint>
 566:	8bca                	mv	s7,s2
 568:	4981                	li	s3,0
 56a:	b751                	j	4ee <vprintf+0x44>
 56c:	008b8913          	addi	s2,s7,8
 570:	4681                	li	a3,0
 572:	4641                	li	a2,16
 574:	000ba583          	lw	a1,0(s7)
 578:	8556                	mv	a0,s5
 57a:	00000097          	auipc	ra,0x0
 57e:	e86080e7          	jalr	-378(ra) # 400 <printint>
 582:	8bca                	mv	s7,s2
 584:	4981                	li	s3,0
 586:	b7a5                	j	4ee <vprintf+0x44>
 588:	008b8c13          	addi	s8,s7,8
 58c:	000bb983          	ld	s3,0(s7)
 590:	03000593          	li	a1,48
 594:	8556                	mv	a0,s5
 596:	00000097          	auipc	ra,0x0
 59a:	e48080e7          	jalr	-440(ra) # 3de <putc>
 59e:	07800593          	li	a1,120
 5a2:	8556                	mv	a0,s5
 5a4:	00000097          	auipc	ra,0x0
 5a8:	e3a080e7          	jalr	-454(ra) # 3de <putc>
 5ac:	4941                	li	s2,16
 5ae:	00000b97          	auipc	s7,0x0
 5b2:	33ab8b93          	addi	s7,s7,826 # 8e8 <digits>
 5b6:	03c9d793          	srli	a5,s3,0x3c
 5ba:	97de                	add	a5,a5,s7
 5bc:	0007c583          	lbu	a1,0(a5)
 5c0:	8556                	mv	a0,s5
 5c2:	00000097          	auipc	ra,0x0
 5c6:	e1c080e7          	jalr	-484(ra) # 3de <putc>
 5ca:	0992                	slli	s3,s3,0x4
 5cc:	397d                	addiw	s2,s2,-1
 5ce:	fe0914e3          	bnez	s2,5b6 <vprintf+0x10c>
 5d2:	8be2                	mv	s7,s8
 5d4:	4981                	li	s3,0
 5d6:	bf21                	j	4ee <vprintf+0x44>
 5d8:	008b8993          	addi	s3,s7,8
 5dc:	000bb903          	ld	s2,0(s7)
 5e0:	02090163          	beqz	s2,602 <vprintf+0x158>
 5e4:	00094583          	lbu	a1,0(s2)
 5e8:	c9a5                	beqz	a1,658 <vprintf+0x1ae>
 5ea:	8556                	mv	a0,s5
 5ec:	00000097          	auipc	ra,0x0
 5f0:	df2080e7          	jalr	-526(ra) # 3de <putc>
 5f4:	0905                	addi	s2,s2,1
 5f6:	00094583          	lbu	a1,0(s2)
 5fa:	f9e5                	bnez	a1,5ea <vprintf+0x140>
 5fc:	8bce                	mv	s7,s3
 5fe:	4981                	li	s3,0
 600:	b5fd                	j	4ee <vprintf+0x44>
 602:	00000917          	auipc	s2,0x0
 606:	28690913          	addi	s2,s2,646 # 888 <malloc+0x12c>
 60a:	02800593          	li	a1,40
 60e:	bff1                	j	5ea <vprintf+0x140>
 610:	008b8913          	addi	s2,s7,8
 614:	000bc583          	lbu	a1,0(s7)
 618:	8556                	mv	a0,s5
 61a:	00000097          	auipc	ra,0x0
 61e:	dc4080e7          	jalr	-572(ra) # 3de <putc>
 622:	8bca                	mv	s7,s2
 624:	4981                	li	s3,0
 626:	b5e1                	j	4ee <vprintf+0x44>
 628:	02500593          	li	a1,37
 62c:	8556                	mv	a0,s5
 62e:	00000097          	auipc	ra,0x0
 632:	db0080e7          	jalr	-592(ra) # 3de <putc>
 636:	4981                	li	s3,0
 638:	bd5d                	j	4ee <vprintf+0x44>
 63a:	02500593          	li	a1,37
 63e:	8556                	mv	a0,s5
 640:	00000097          	auipc	ra,0x0
 644:	d9e080e7          	jalr	-610(ra) # 3de <putc>
 648:	85ca                	mv	a1,s2
 64a:	8556                	mv	a0,s5
 64c:	00000097          	auipc	ra,0x0
 650:	d92080e7          	jalr	-622(ra) # 3de <putc>
 654:	4981                	li	s3,0
 656:	bd61                	j	4ee <vprintf+0x44>
 658:	8bce                	mv	s7,s3
 65a:	4981                	li	s3,0
 65c:	bd49                	j	4ee <vprintf+0x44>
 65e:	60a6                	ld	ra,72(sp)
 660:	6406                	ld	s0,64(sp)
 662:	74e2                	ld	s1,56(sp)
 664:	7942                	ld	s2,48(sp)
 666:	79a2                	ld	s3,40(sp)
 668:	7a02                	ld	s4,32(sp)
 66a:	6ae2                	ld	s5,24(sp)
 66c:	6b42                	ld	s6,16(sp)
 66e:	6ba2                	ld	s7,8(sp)
 670:	6c02                	ld	s8,0(sp)
 672:	6161                	addi	sp,sp,80
 674:	8082                	ret

0000000000000676 <fprintf>:
 676:	715d                	addi	sp,sp,-80
 678:	ec06                	sd	ra,24(sp)
 67a:	e822                	sd	s0,16(sp)
 67c:	1000                	addi	s0,sp,32
 67e:	e010                	sd	a2,0(s0)
 680:	e414                	sd	a3,8(s0)
 682:	e818                	sd	a4,16(s0)
 684:	ec1c                	sd	a5,24(s0)
 686:	03043023          	sd	a6,32(s0)
 68a:	03143423          	sd	a7,40(s0)
 68e:	8622                	mv	a2,s0
 690:	fe843423          	sd	s0,-24(s0)
 694:	00000097          	auipc	ra,0x0
 698:	e16080e7          	jalr	-490(ra) # 4aa <vprintf>
 69c:	60e2                	ld	ra,24(sp)
 69e:	6442                	ld	s0,16(sp)
 6a0:	6161                	addi	sp,sp,80
 6a2:	8082                	ret

00000000000006a4 <printf>:
 6a4:	711d                	addi	sp,sp,-96
 6a6:	ec06                	sd	ra,24(sp)
 6a8:	e822                	sd	s0,16(sp)
 6aa:	1000                	addi	s0,sp,32
 6ac:	e40c                	sd	a1,8(s0)
 6ae:	e810                	sd	a2,16(s0)
 6b0:	ec14                	sd	a3,24(s0)
 6b2:	f018                	sd	a4,32(s0)
 6b4:	f41c                	sd	a5,40(s0)
 6b6:	03043823          	sd	a6,48(s0)
 6ba:	03143c23          	sd	a7,56(s0)
 6be:	00840613          	addi	a2,s0,8
 6c2:	fec43423          	sd	a2,-24(s0)
 6c6:	85aa                	mv	a1,a0
 6c8:	4505                	li	a0,1
 6ca:	00000097          	auipc	ra,0x0
 6ce:	de0080e7          	jalr	-544(ra) # 4aa <vprintf>
 6d2:	60e2                	ld	ra,24(sp)
 6d4:	6442                	ld	s0,16(sp)
 6d6:	6125                	addi	sp,sp,96
 6d8:	8082                	ret

00000000000006da <free>:
 6da:	1141                	addi	sp,sp,-16
 6dc:	e422                	sd	s0,8(sp)
 6de:	0800                	addi	s0,sp,16
 6e0:	ff050693          	addi	a3,a0,-16
 6e4:	00000797          	auipc	a5,0x0
 6e8:	21c7b783          	ld	a5,540(a5) # 900 <freep>
 6ec:	a02d                	j	716 <free+0x3c>
 6ee:	4618                	lw	a4,8(a2)
 6f0:	9f2d                	addw	a4,a4,a1
 6f2:	fee52c23          	sw	a4,-8(a0)
 6f6:	6398                	ld	a4,0(a5)
 6f8:	6310                	ld	a2,0(a4)
 6fa:	a83d                	j	738 <free+0x5e>
 6fc:	ff852703          	lw	a4,-8(a0)
 700:	9f31                	addw	a4,a4,a2
 702:	c798                	sw	a4,8(a5)
 704:	ff053683          	ld	a3,-16(a0)
 708:	a091                	j	74c <free+0x72>
 70a:	6398                	ld	a4,0(a5)
 70c:	00e7e463          	bltu	a5,a4,714 <free+0x3a>
 710:	00e6ea63          	bltu	a3,a4,724 <free+0x4a>
 714:	87ba                	mv	a5,a4
 716:	fed7fae3          	bgeu	a5,a3,70a <free+0x30>
 71a:	6398                	ld	a4,0(a5)
 71c:	00e6e463          	bltu	a3,a4,724 <free+0x4a>
 720:	fee7eae3          	bltu	a5,a4,714 <free+0x3a>
 724:	ff852583          	lw	a1,-8(a0)
 728:	6390                	ld	a2,0(a5)
 72a:	02059813          	slli	a6,a1,0x20
 72e:	01c85713          	srli	a4,a6,0x1c
 732:	9736                	add	a4,a4,a3
 734:	fae60de3          	beq	a2,a4,6ee <free+0x14>
 738:	fec53823          	sd	a2,-16(a0)
 73c:	4790                	lw	a2,8(a5)
 73e:	02061593          	slli	a1,a2,0x20
 742:	01c5d713          	srli	a4,a1,0x1c
 746:	973e                	add	a4,a4,a5
 748:	fae68ae3          	beq	a3,a4,6fc <free+0x22>
 74c:	e394                	sd	a3,0(a5)
 74e:	00000717          	auipc	a4,0x0
 752:	1af73923          	sd	a5,434(a4) # 900 <freep>
 756:	6422                	ld	s0,8(sp)
 758:	0141                	addi	sp,sp,16
 75a:	8082                	ret

000000000000075c <malloc>:
 75c:	7139                	addi	sp,sp,-64
 75e:	fc06                	sd	ra,56(sp)
 760:	f822                	sd	s0,48(sp)
 762:	f426                	sd	s1,40(sp)
 764:	f04a                	sd	s2,32(sp)
 766:	ec4e                	sd	s3,24(sp)
 768:	e852                	sd	s4,16(sp)
 76a:	e456                	sd	s5,8(sp)
 76c:	e05a                	sd	s6,0(sp)
 76e:	0080                	addi	s0,sp,64
 770:	02051493          	slli	s1,a0,0x20
 774:	9081                	srli	s1,s1,0x20
 776:	04bd                	addi	s1,s1,15
 778:	8091                	srli	s1,s1,0x4
 77a:	0014899b          	addiw	s3,s1,1
 77e:	0485                	addi	s1,s1,1
 780:	00000517          	auipc	a0,0x0
 784:	18053503          	ld	a0,384(a0) # 900 <freep>
 788:	c515                	beqz	a0,7b4 <malloc+0x58>
 78a:	611c                	ld	a5,0(a0)
 78c:	4798                	lw	a4,8(a5)
 78e:	04977063          	bgeu	a4,s1,7ce <malloc+0x72>
 792:	8a4e                	mv	s4,s3
 794:	0009871b          	sext.w	a4,s3
 798:	6685                	lui	a3,0x1
 79a:	00d77363          	bgeu	a4,a3,7a0 <malloc+0x44>
 79e:	6a05                	lui	s4,0x1
 7a0:	000a0b1b          	sext.w	s6,s4
 7a4:	004a1a1b          	slliw	s4,s4,0x4
 7a8:	00000917          	auipc	s2,0x0
 7ac:	15890913          	addi	s2,s2,344 # 900 <freep>
 7b0:	5afd                	li	s5,-1
 7b2:	a89d                	j	828 <malloc+0xcc>
 7b4:	00000717          	auipc	a4,0x0
 7b8:	14c70713          	addi	a4,a4,332 # 900 <freep>
 7bc:	00000797          	auipc	a5,0x0
 7c0:	14c78793          	addi	a5,a5,332 # 908 <base>
 7c4:	e31c                	sd	a5,0(a4)
 7c6:	e71c                	sd	a5,8(a4)
 7c8:	00072823          	sw	zero,16(a4)
 7cc:	b7d9                	j	792 <malloc+0x36>
 7ce:	02e48c63          	beq	s1,a4,806 <malloc+0xaa>
 7d2:	4137073b          	subw	a4,a4,s3
 7d6:	c798                	sw	a4,8(a5)
 7d8:	02071693          	slli	a3,a4,0x20
 7dc:	01c6d713          	srli	a4,a3,0x1c
 7e0:	97ba                	add	a5,a5,a4
 7e2:	0137a423          	sw	s3,8(a5)
 7e6:	00000717          	auipc	a4,0x0
 7ea:	10a73d23          	sd	a0,282(a4) # 900 <freep>
 7ee:	01078513          	addi	a0,a5,16
 7f2:	70e2                	ld	ra,56(sp)
 7f4:	7442                	ld	s0,48(sp)
 7f6:	74a2                	ld	s1,40(sp)
 7f8:	7902                	ld	s2,32(sp)
 7fa:	69e2                	ld	s3,24(sp)
 7fc:	6a42                	ld	s4,16(sp)
 7fe:	6aa2                	ld	s5,8(sp)
 800:	6b02                	ld	s6,0(sp)
 802:	6121                	addi	sp,sp,64
 804:	8082                	ret
 806:	6398                	ld	a4,0(a5)
 808:	e118                	sd	a4,0(a0)
 80a:	bff1                	j	7e6 <malloc+0x8a>
 80c:	01652423          	sw	s6,8(a0)
 810:	0541                	addi	a0,a0,16
 812:	00000097          	auipc	ra,0x0
 816:	ec8080e7          	jalr	-312(ra) # 6da <free>
 81a:	00093503          	ld	a0,0(s2)
 81e:	d971                	beqz	a0,7f2 <malloc+0x96>
 820:	611c                	ld	a5,0(a0)
 822:	4798                	lw	a4,8(a5)
 824:	fa9775e3          	bgeu	a4,s1,7ce <malloc+0x72>
 828:	00093703          	ld	a4,0(s2)
 82c:	853e                	mv	a0,a5
 82e:	fef719e3          	bne	a4,a5,820 <malloc+0xc4>
 832:	8552                	mv	a0,s4
 834:	00000097          	auipc	ra,0x0
 838:	b52080e7          	jalr	-1198(ra) # 386 <sbrk>
 83c:	fd5518e3          	bne	a0,s5,80c <malloc+0xb0>
 840:	4501                	li	a0,0
 842:	bf45                	j	7f2 <malloc+0x96>
