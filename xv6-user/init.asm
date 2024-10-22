
xv6-user/_init:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
 "wait","write",
 "yield",
 "waitpid",
};
int counts = sizeof(tests) / sizeof((tests)[0]);
int main(void) {
   0:	7139                	addi	sp,sp,-64
   2:	fc06                	sd	ra,56(sp)
   4:	f822                	sd	s0,48(sp)
   6:	f426                	sd	s1,40(sp)
   8:	f04a                	sd	s2,32(sp)
   a:	ec4e                	sd	s3,24(sp)
   c:	e852                	sd	s4,16(sp)
   e:	e456                	sd	s5,8(sp)
  10:	0080                	addi	s0,sp,64
  int pid=0, wpid=0;
  dev(O_RDWR, CONSOLE, 0);
  12:	4601                	li	a2,0
  14:	4585                	li	a1,1
  16:	4509                	li	a0,2
  18:	00000097          	auipc	ra,0x0
  1c:	4a4080e7          	jalr	1188(ra) # 4bc <dev>
  dup(0); // stdout
  20:	4501                	li	a0,0
  22:	00000097          	auipc	ra,0x0
  26:	46a080e7          	jalr	1130(ra) # 48c <dup>
  dup(0); // stderr
  2a:	4501                	li	a0,0
  2c:	00000097          	auipc	ra,0x0
  30:	460080e7          	jalr	1120(ra) # 48c <dup>

  for (int i = 0; i < counts; i++) {
  34:	00001797          	auipc	a5,0x1
  38:	b3c7a783          	lw	a5,-1220(a5) # b70 <counts>
  3c:	10f05363          	blez	a5,142 <main+0x142>
  40:	00001997          	auipc	s3,0x1
  44:	b3898993          	addi	s3,s3,-1224 # b78 <tests>
  48:	4901                	li	s2,0
    printf("init: starting %s\n", tests[i]);
  4a:	00001a17          	auipc	s4,0x1
  4e:	916a0a13          	addi	s4,s4,-1770 # 960 <malloc+0xee>
  for (int i = 0; i < counts; i++) {
  52:	00001a97          	auipc	s5,0x1
  56:	b1ea8a93          	addi	s5,s5,-1250 # b70 <counts>
    printf("init: starting %s\n", tests[i]);
  5a:	0009b583          	ld	a1,0(s3)
  5e:	8552                	mv	a0,s4
  60:	00000097          	auipc	ra,0x0
  64:	75a080e7          	jalr	1882(ra) # 7ba <printf>
    pid = fork();
  68:	00000097          	auipc	ra,0x0
  6c:	3bc080e7          	jalr	956(ra) # 424 <fork>
  70:	84aa                	mv	s1,a0
    if (pid < 0) {
  72:	06054063          	bltz	a0,d2 <main+0xd2>
      printf("init: fork failed\n");
      exit(1);
    }
    if (pid == 0) {
  76:	c93d                	beqz	a0,ec <main+0xec>
      printf(tests[i]);
      printf(" failed exec %s\n", tests[i]);
      exit(1);
    }
    else{
      wait((int*)0);
  78:	4501                	li	a0,0
  7a:	00000097          	auipc	ra,0x0
  7e:	3ba080e7          	jalr	954(ra) # 434 <wait>
  for (int i = 0; i < counts; i++) {
  82:	2905                	addiw	s2,s2,1
  84:	09a1                	addi	s3,s3,8
  86:	000aa783          	lw	a5,0(s5)
  8a:	fcf948e3          	blt	s2,a5,5a <main+0x5a>
    }
  }
  (*(volatile uint32 *) 0x100000)=0x5555;
  8e:	00100737          	lui	a4,0x100
  92:	6795                	lui	a5,0x5
  94:	55578793          	addi	a5,a5,1365 # 5555 <__global_pointer$+0x41e5>
  98:	c31c                	sw	a5,0(a4)
  for(;;){
    wpid = wait((int *) 0);
  9a:	4501                	li	a0,0
  9c:	00000097          	auipc	ra,0x0
  a0:	398080e7          	jalr	920(ra) # 434 <wait>
    if(wpid == pid){
  a4:	0a950163          	beq	a0,s1,146 <main+0x146>
      // the shell exited; restart it.
      break;
    } else if(wpid < 0){
  a8:	fe0559e3          	bgez	a0,9a <main+0x9a>
      printf("init: wait returned an error\n");
  ac:	00001517          	auipc	a0,0x1
  b0:	90c50513          	addi	a0,a0,-1780 # 9b8 <malloc+0x146>
  b4:	00000097          	auipc	ra,0x0
  b8:	706080e7          	jalr	1798(ra) # 7ba <printf>
      (*(volatile uint32 *) 0x100000)=0x5555;
  bc:	00100737          	lui	a4,0x100
  c0:	6795                	lui	a5,0x5
  c2:	55578793          	addi	a5,a5,1365 # 5555 <__global_pointer$+0x41e5>
  c6:	c31c                	sw	a5,0(a4)
      exit(1);
  c8:	4505                	li	a0,1
  ca:	00000097          	auipc	ra,0x0
  ce:	362080e7          	jalr	866(ra) # 42c <exit>
      printf("init: fork failed\n");
  d2:	00001517          	auipc	a0,0x1
  d6:	8a650513          	addi	a0,a0,-1882 # 978 <malloc+0x106>
  da:	00000097          	auipc	ra,0x0
  de:	6e0080e7          	jalr	1760(ra) # 7ba <printf>
      exit(1);
  e2:	4505                	li	a0,1
  e4:	00000097          	auipc	ra,0x0
  e8:	348080e7          	jalr	840(ra) # 42c <exit>
      exec(tests[i], argv);
  ec:	090e                	slli	s2,s2,0x3
  ee:	00001497          	auipc	s1,0x1
  f2:	a8a48493          	addi	s1,s1,-1398 # b78 <tests>
  f6:	94ca                	add	s1,s1,s2
  f8:	00001597          	auipc	a1,0x1
  fc:	b8858593          	addi	a1,a1,-1144 # c80 <argv>
 100:	6088                	ld	a0,0(s1)
 102:	00000097          	auipc	ra,0x0
 106:	362080e7          	jalr	866(ra) # 464 <exec>
      printf("init: exec %s",tests[i]);
 10a:	608c                	ld	a1,0(s1)
 10c:	00001517          	auipc	a0,0x1
 110:	88450513          	addi	a0,a0,-1916 # 990 <malloc+0x11e>
 114:	00000097          	auipc	ra,0x0
 118:	6a6080e7          	jalr	1702(ra) # 7ba <printf>
      printf(tests[i]);
 11c:	6088                	ld	a0,0(s1)
 11e:	00000097          	auipc	ra,0x0
 122:	69c080e7          	jalr	1692(ra) # 7ba <printf>
      printf(" failed exec %s\n", tests[i]);
 126:	608c                	ld	a1,0(s1)
 128:	00001517          	auipc	a0,0x1
 12c:	87850513          	addi	a0,a0,-1928 # 9a0 <malloc+0x12e>
 130:	00000097          	auipc	ra,0x0
 134:	68a080e7          	jalr	1674(ra) # 7ba <printf>
      exit(1);
 138:	4505                	li	a0,1
 13a:	00000097          	auipc	ra,0x0
 13e:	2f2080e7          	jalr	754(ra) # 42c <exit>
  int pid=0, wpid=0;
 142:	4481                	li	s1,0
 144:	b7a9                	j	8e <main+0x8e>
    } else {
      // it was a parentless process; do nothing.
    }
  }
  (*(volatile uint32 *) 0x100000)=0x5555;
 146:	00100737          	lui	a4,0x100
 14a:	6795                	lui	a5,0x5
 14c:	55578793          	addi	a5,a5,1365 # 5555 <__global_pointer$+0x41e5>
 150:	c31c                	sw	a5,0(a4)
	SBI_CALL_1(SBI_SET_TIMER, stime_value);
}

static inline void sbi_shutdown(void)
{
	SBI_CALL_0(SBI_SHUTDOWN);
 152:	4501                	li	a0,0
 154:	4581                	li	a1,0
 156:	4601                	li	a2,0
 158:	4681                	li	a3,0
 15a:	48a1                	li	a7,8
 15c:	00000073          	ecall
  sbi_shutdown();
  return 0;
 160:	4501                	li	a0,0
 162:	70e2                	ld	ra,56(sp)
 164:	7442                	ld	s0,48(sp)
 166:	74a2                	ld	s1,40(sp)
 168:	7902                	ld	s2,32(sp)
 16a:	69e2                	ld	s3,24(sp)
 16c:	6a42                	ld	s4,16(sp)
 16e:	6aa2                	ld	s5,8(sp)
 170:	6121                	addi	sp,sp,64
 172:	8082                	ret

0000000000000174 <strcpy>:
 174:	1141                	addi	sp,sp,-16
 176:	e422                	sd	s0,8(sp)
 178:	0800                	addi	s0,sp,16
 17a:	87aa                	mv	a5,a0
 17c:	0585                	addi	a1,a1,1
 17e:	0785                	addi	a5,a5,1
 180:	fff5c703          	lbu	a4,-1(a1)
 184:	fee78fa3          	sb	a4,-1(a5)
 188:	fb75                	bnez	a4,17c <strcpy+0x8>
 18a:	6422                	ld	s0,8(sp)
 18c:	0141                	addi	sp,sp,16
 18e:	8082                	ret

0000000000000190 <strcat>:
 190:	1141                	addi	sp,sp,-16
 192:	e422                	sd	s0,8(sp)
 194:	0800                	addi	s0,sp,16
 196:	00054783          	lbu	a5,0(a0)
 19a:	c385                	beqz	a5,1ba <strcat+0x2a>
 19c:	87aa                	mv	a5,a0
 19e:	0785                	addi	a5,a5,1
 1a0:	0007c703          	lbu	a4,0(a5)
 1a4:	ff6d                	bnez	a4,19e <strcat+0xe>
 1a6:	0585                	addi	a1,a1,1
 1a8:	0785                	addi	a5,a5,1
 1aa:	fff5c703          	lbu	a4,-1(a1)
 1ae:	fee78fa3          	sb	a4,-1(a5)
 1b2:	fb75                	bnez	a4,1a6 <strcat+0x16>
 1b4:	6422                	ld	s0,8(sp)
 1b6:	0141                	addi	sp,sp,16
 1b8:	8082                	ret
 1ba:	87aa                	mv	a5,a0
 1bc:	b7ed                	j	1a6 <strcat+0x16>

00000000000001be <strcmp>:
 1be:	1141                	addi	sp,sp,-16
 1c0:	e422                	sd	s0,8(sp)
 1c2:	0800                	addi	s0,sp,16
 1c4:	00054783          	lbu	a5,0(a0)
 1c8:	cb91                	beqz	a5,1dc <strcmp+0x1e>
 1ca:	0005c703          	lbu	a4,0(a1)
 1ce:	00f71763          	bne	a4,a5,1dc <strcmp+0x1e>
 1d2:	0505                	addi	a0,a0,1
 1d4:	0585                	addi	a1,a1,1
 1d6:	00054783          	lbu	a5,0(a0)
 1da:	fbe5                	bnez	a5,1ca <strcmp+0xc>
 1dc:	0005c503          	lbu	a0,0(a1)
 1e0:	40a7853b          	subw	a0,a5,a0
 1e4:	6422                	ld	s0,8(sp)
 1e6:	0141                	addi	sp,sp,16
 1e8:	8082                	ret

00000000000001ea <strlen>:
 1ea:	1141                	addi	sp,sp,-16
 1ec:	e422                	sd	s0,8(sp)
 1ee:	0800                	addi	s0,sp,16
 1f0:	00054783          	lbu	a5,0(a0)
 1f4:	cf91                	beqz	a5,210 <strlen+0x26>
 1f6:	0505                	addi	a0,a0,1
 1f8:	87aa                	mv	a5,a0
 1fa:	86be                	mv	a3,a5
 1fc:	0785                	addi	a5,a5,1
 1fe:	fff7c703          	lbu	a4,-1(a5)
 202:	ff65                	bnez	a4,1fa <strlen+0x10>
 204:	40a6853b          	subw	a0,a3,a0
 208:	2505                	addiw	a0,a0,1
 20a:	6422                	ld	s0,8(sp)
 20c:	0141                	addi	sp,sp,16
 20e:	8082                	ret
 210:	4501                	li	a0,0
 212:	bfe5                	j	20a <strlen+0x20>

0000000000000214 <memset>:
 214:	1141                	addi	sp,sp,-16
 216:	e422                	sd	s0,8(sp)
 218:	0800                	addi	s0,sp,16
 21a:	ca19                	beqz	a2,230 <memset+0x1c>
 21c:	87aa                	mv	a5,a0
 21e:	1602                	slli	a2,a2,0x20
 220:	9201                	srli	a2,a2,0x20
 222:	00a60733          	add	a4,a2,a0
 226:	00b78023          	sb	a1,0(a5)
 22a:	0785                	addi	a5,a5,1
 22c:	fee79de3          	bne	a5,a4,226 <memset+0x12>
 230:	6422                	ld	s0,8(sp)
 232:	0141                	addi	sp,sp,16
 234:	8082                	ret

0000000000000236 <strchr>:
 236:	1141                	addi	sp,sp,-16
 238:	e422                	sd	s0,8(sp)
 23a:	0800                	addi	s0,sp,16
 23c:	00054783          	lbu	a5,0(a0)
 240:	cb99                	beqz	a5,256 <strchr+0x20>
 242:	00f58763          	beq	a1,a5,250 <strchr+0x1a>
 246:	0505                	addi	a0,a0,1
 248:	00054783          	lbu	a5,0(a0)
 24c:	fbfd                	bnez	a5,242 <strchr+0xc>
 24e:	4501                	li	a0,0
 250:	6422                	ld	s0,8(sp)
 252:	0141                	addi	sp,sp,16
 254:	8082                	ret
 256:	4501                	li	a0,0
 258:	bfe5                	j	250 <strchr+0x1a>

000000000000025a <gets>:
 25a:	711d                	addi	sp,sp,-96
 25c:	ec86                	sd	ra,88(sp)
 25e:	e8a2                	sd	s0,80(sp)
 260:	e4a6                	sd	s1,72(sp)
 262:	e0ca                	sd	s2,64(sp)
 264:	fc4e                	sd	s3,56(sp)
 266:	f852                	sd	s4,48(sp)
 268:	f456                	sd	s5,40(sp)
 26a:	f05a                	sd	s6,32(sp)
 26c:	ec5e                	sd	s7,24(sp)
 26e:	e862                	sd	s8,16(sp)
 270:	1080                	addi	s0,sp,96
 272:	8baa                	mv	s7,a0
 274:	8a2e                	mv	s4,a1
 276:	892a                	mv	s2,a0
 278:	4481                	li	s1,0
 27a:	faf40a93          	addi	s5,s0,-81
 27e:	4b29                	li	s6,10
 280:	4c35                	li	s8,13
 282:	89a6                	mv	s3,s1
 284:	2485                	addiw	s1,s1,1
 286:	0344d763          	bge	s1,s4,2b4 <gets+0x5a>
 28a:	4605                	li	a2,1
 28c:	85d6                	mv	a1,s5
 28e:	4501                	li	a0,0
 290:	00000097          	auipc	ra,0x0
 294:	1b4080e7          	jalr	436(ra) # 444 <read>
 298:	00a05e63          	blez	a0,2b4 <gets+0x5a>
 29c:	faf44783          	lbu	a5,-81(s0)
 2a0:	00f90023          	sb	a5,0(s2)
 2a4:	01678763          	beq	a5,s6,2b2 <gets+0x58>
 2a8:	0905                	addi	s2,s2,1
 2aa:	fd879ce3          	bne	a5,s8,282 <gets+0x28>
 2ae:	89a6                	mv	s3,s1
 2b0:	a011                	j	2b4 <gets+0x5a>
 2b2:	89a6                	mv	s3,s1
 2b4:	99de                	add	s3,s3,s7
 2b6:	00098023          	sb	zero,0(s3)
 2ba:	855e                	mv	a0,s7
 2bc:	60e6                	ld	ra,88(sp)
 2be:	6446                	ld	s0,80(sp)
 2c0:	64a6                	ld	s1,72(sp)
 2c2:	6906                	ld	s2,64(sp)
 2c4:	79e2                	ld	s3,56(sp)
 2c6:	7a42                	ld	s4,48(sp)
 2c8:	7aa2                	ld	s5,40(sp)
 2ca:	7b02                	ld	s6,32(sp)
 2cc:	6be2                	ld	s7,24(sp)
 2ce:	6c42                	ld	s8,16(sp)
 2d0:	6125                	addi	sp,sp,96
 2d2:	8082                	ret

00000000000002d4 <stat>:
 2d4:	1101                	addi	sp,sp,-32
 2d6:	ec06                	sd	ra,24(sp)
 2d8:	e822                	sd	s0,16(sp)
 2da:	e426                	sd	s1,8(sp)
 2dc:	e04a                	sd	s2,0(sp)
 2de:	1000                	addi	s0,sp,32
 2e0:	892e                	mv	s2,a1
 2e2:	4581                	li	a1,0
 2e4:	00000097          	auipc	ra,0x0
 2e8:	188080e7          	jalr	392(ra) # 46c <open>
 2ec:	02054563          	bltz	a0,316 <stat+0x42>
 2f0:	84aa                	mv	s1,a0
 2f2:	85ca                	mv	a1,s2
 2f4:	00000097          	auipc	ra,0x0
 2f8:	180080e7          	jalr	384(ra) # 474 <fstat>
 2fc:	892a                	mv	s2,a0
 2fe:	8526                	mv	a0,s1
 300:	00000097          	auipc	ra,0x0
 304:	154080e7          	jalr	340(ra) # 454 <close>
 308:	854a                	mv	a0,s2
 30a:	60e2                	ld	ra,24(sp)
 30c:	6442                	ld	s0,16(sp)
 30e:	64a2                	ld	s1,8(sp)
 310:	6902                	ld	s2,0(sp)
 312:	6105                	addi	sp,sp,32
 314:	8082                	ret
 316:	597d                	li	s2,-1
 318:	bfc5                	j	308 <stat+0x34>

000000000000031a <atoi>:
 31a:	1141                	addi	sp,sp,-16
 31c:	e422                	sd	s0,8(sp)
 31e:	0800                	addi	s0,sp,16
 320:	00054703          	lbu	a4,0(a0)
 324:	02d00793          	li	a5,45
 328:	4585                	li	a1,1
 32a:	04f70363          	beq	a4,a5,370 <atoi+0x56>
 32e:	00054703          	lbu	a4,0(a0)
 332:	fd07079b          	addiw	a5,a4,-48 # fffd0 <__global_pointer$+0xfec60>
 336:	0ff7f793          	zext.b	a5,a5
 33a:	46a5                	li	a3,9
 33c:	02f6ed63          	bltu	a3,a5,376 <atoi+0x5c>
 340:	4681                	li	a3,0
 342:	4625                	li	a2,9
 344:	0505                	addi	a0,a0,1
 346:	0026979b          	slliw	a5,a3,0x2
 34a:	9fb5                	addw	a5,a5,a3
 34c:	0017979b          	slliw	a5,a5,0x1
 350:	9fb9                	addw	a5,a5,a4
 352:	fd07869b          	addiw	a3,a5,-48
 356:	00054703          	lbu	a4,0(a0)
 35a:	fd07079b          	addiw	a5,a4,-48
 35e:	0ff7f793          	zext.b	a5,a5
 362:	fef671e3          	bgeu	a2,a5,344 <atoi+0x2a>
 366:	02d5853b          	mulw	a0,a1,a3
 36a:	6422                	ld	s0,8(sp)
 36c:	0141                	addi	sp,sp,16
 36e:	8082                	ret
 370:	0505                	addi	a0,a0,1
 372:	55fd                	li	a1,-1
 374:	bf6d                	j	32e <atoi+0x14>
 376:	4681                	li	a3,0
 378:	b7fd                	j	366 <atoi+0x4c>

000000000000037a <memmove>:
 37a:	1141                	addi	sp,sp,-16
 37c:	e422                	sd	s0,8(sp)
 37e:	0800                	addi	s0,sp,16
 380:	02b57463          	bgeu	a0,a1,3a8 <memmove+0x2e>
 384:	00c05f63          	blez	a2,3a2 <memmove+0x28>
 388:	1602                	slli	a2,a2,0x20
 38a:	9201                	srli	a2,a2,0x20
 38c:	00c507b3          	add	a5,a0,a2
 390:	872a                	mv	a4,a0
 392:	0585                	addi	a1,a1,1
 394:	0705                	addi	a4,a4,1
 396:	fff5c683          	lbu	a3,-1(a1)
 39a:	fed70fa3          	sb	a3,-1(a4)
 39e:	fee79ae3          	bne	a5,a4,392 <memmove+0x18>
 3a2:	6422                	ld	s0,8(sp)
 3a4:	0141                	addi	sp,sp,16
 3a6:	8082                	ret
 3a8:	00c50733          	add	a4,a0,a2
 3ac:	95b2                	add	a1,a1,a2
 3ae:	fec05ae3          	blez	a2,3a2 <memmove+0x28>
 3b2:	fff6079b          	addiw	a5,a2,-1
 3b6:	1782                	slli	a5,a5,0x20
 3b8:	9381                	srli	a5,a5,0x20
 3ba:	fff7c793          	not	a5,a5
 3be:	97ba                	add	a5,a5,a4
 3c0:	15fd                	addi	a1,a1,-1
 3c2:	177d                	addi	a4,a4,-1
 3c4:	0005c683          	lbu	a3,0(a1)
 3c8:	00d70023          	sb	a3,0(a4)
 3cc:	fee79ae3          	bne	a5,a4,3c0 <memmove+0x46>
 3d0:	bfc9                	j	3a2 <memmove+0x28>

00000000000003d2 <memcmp>:
 3d2:	1141                	addi	sp,sp,-16
 3d4:	e422                	sd	s0,8(sp)
 3d6:	0800                	addi	s0,sp,16
 3d8:	ca05                	beqz	a2,408 <memcmp+0x36>
 3da:	fff6069b          	addiw	a3,a2,-1
 3de:	1682                	slli	a3,a3,0x20
 3e0:	9281                	srli	a3,a3,0x20
 3e2:	0685                	addi	a3,a3,1
 3e4:	96aa                	add	a3,a3,a0
 3e6:	00054783          	lbu	a5,0(a0)
 3ea:	0005c703          	lbu	a4,0(a1)
 3ee:	00e79863          	bne	a5,a4,3fe <memcmp+0x2c>
 3f2:	0505                	addi	a0,a0,1
 3f4:	0585                	addi	a1,a1,1
 3f6:	fed518e3          	bne	a0,a3,3e6 <memcmp+0x14>
 3fa:	4501                	li	a0,0
 3fc:	a019                	j	402 <memcmp+0x30>
 3fe:	40e7853b          	subw	a0,a5,a4
 402:	6422                	ld	s0,8(sp)
 404:	0141                	addi	sp,sp,16
 406:	8082                	ret
 408:	4501                	li	a0,0
 40a:	bfe5                	j	402 <memcmp+0x30>

000000000000040c <memcpy>:
 40c:	1141                	addi	sp,sp,-16
 40e:	e406                	sd	ra,8(sp)
 410:	e022                	sd	s0,0(sp)
 412:	0800                	addi	s0,sp,16
 414:	00000097          	auipc	ra,0x0
 418:	f66080e7          	jalr	-154(ra) # 37a <memmove>
 41c:	60a2                	ld	ra,8(sp)
 41e:	6402                	ld	s0,0(sp)
 420:	0141                	addi	sp,sp,16
 422:	8082                	ret

0000000000000424 <fork>:
 424:	4885                	li	a7,1
 426:	00000073          	ecall
 42a:	8082                	ret

000000000000042c <exit>:
 42c:	4889                	li	a7,2
 42e:	00000073          	ecall
 432:	8082                	ret

0000000000000434 <wait>:
 434:	488d                	li	a7,3
 436:	00000073          	ecall
 43a:	8082                	ret

000000000000043c <pipe>:
 43c:	4891                	li	a7,4
 43e:	00000073          	ecall
 442:	8082                	ret

0000000000000444 <read>:
 444:	4895                	li	a7,5
 446:	00000073          	ecall
 44a:	8082                	ret

000000000000044c <write>:
 44c:	48c1                	li	a7,16
 44e:	00000073          	ecall
 452:	8082                	ret

0000000000000454 <close>:
 454:	48d5                	li	a7,21
 456:	00000073          	ecall
 45a:	8082                	ret

000000000000045c <kill>:
 45c:	4899                	li	a7,6
 45e:	00000073          	ecall
 462:	8082                	ret

0000000000000464 <exec>:
 464:	489d                	li	a7,7
 466:	00000073          	ecall
 46a:	8082                	ret

000000000000046c <open>:
 46c:	48bd                	li	a7,15
 46e:	00000073          	ecall
 472:	8082                	ret

0000000000000474 <fstat>:
 474:	48a1                	li	a7,8
 476:	00000073          	ecall
 47a:	8082                	ret

000000000000047c <mkdir>:
 47c:	48d1                	li	a7,20
 47e:	00000073          	ecall
 482:	8082                	ret

0000000000000484 <chdir>:
 484:	48a5                	li	a7,9
 486:	00000073          	ecall
 48a:	8082                	ret

000000000000048c <dup>:
 48c:	48a9                	li	a7,10
 48e:	00000073          	ecall
 492:	8082                	ret

0000000000000494 <getpid>:
 494:	48ad                	li	a7,11
 496:	00000073          	ecall
 49a:	8082                	ret

000000000000049c <sbrk>:
 49c:	48b1                	li	a7,12
 49e:	00000073          	ecall
 4a2:	8082                	ret

00000000000004a4 <sleep>:
 4a4:	48b5                	li	a7,13
 4a6:	00000073          	ecall
 4aa:	8082                	ret

00000000000004ac <uptime>:
 4ac:	48b9                	li	a7,14
 4ae:	00000073          	ecall
 4b2:	8082                	ret

00000000000004b4 <test_proc>:
 4b4:	48d9                	li	a7,22
 4b6:	00000073          	ecall
 4ba:	8082                	ret

00000000000004bc <dev>:
 4bc:	48dd                	li	a7,23
 4be:	00000073          	ecall
 4c2:	8082                	ret

00000000000004c4 <readdir>:
 4c4:	48e1                	li	a7,24
 4c6:	00000073          	ecall
 4ca:	8082                	ret

00000000000004cc <getcwd>:
 4cc:	48e5                	li	a7,25
 4ce:	00000073          	ecall
 4d2:	8082                	ret

00000000000004d4 <remove>:
 4d4:	48c5                	li	a7,17
 4d6:	00000073          	ecall
 4da:	8082                	ret

00000000000004dc <trace>:
 4dc:	48c9                	li	a7,18
 4de:	00000073          	ecall
 4e2:	8082                	ret

00000000000004e4 <sysinfo>:
 4e4:	48cd                	li	a7,19
 4e6:	00000073          	ecall
 4ea:	8082                	ret

00000000000004ec <rename>:
 4ec:	48e9                	li	a7,26
 4ee:	00000073          	ecall
 4f2:	8082                	ret

00000000000004f4 <putc>:
 4f4:	1101                	addi	sp,sp,-32
 4f6:	ec06                	sd	ra,24(sp)
 4f8:	e822                	sd	s0,16(sp)
 4fa:	1000                	addi	s0,sp,32
 4fc:	feb407a3          	sb	a1,-17(s0)
 500:	4605                	li	a2,1
 502:	fef40593          	addi	a1,s0,-17
 506:	00000097          	auipc	ra,0x0
 50a:	f46080e7          	jalr	-186(ra) # 44c <write>
 50e:	60e2                	ld	ra,24(sp)
 510:	6442                	ld	s0,16(sp)
 512:	6105                	addi	sp,sp,32
 514:	8082                	ret

0000000000000516 <printint>:
 516:	7139                	addi	sp,sp,-64
 518:	fc06                	sd	ra,56(sp)
 51a:	f822                	sd	s0,48(sp)
 51c:	f426                	sd	s1,40(sp)
 51e:	f04a                	sd	s2,32(sp)
 520:	ec4e                	sd	s3,24(sp)
 522:	0080                	addi	s0,sp,64
 524:	84aa                	mv	s1,a0
 526:	c299                	beqz	a3,52c <printint+0x16>
 528:	0805c863          	bltz	a1,5b8 <printint+0xa2>
 52c:	2581                	sext.w	a1,a1
 52e:	4881                	li	a7,0
 530:	fc040993          	addi	s3,s0,-64
 534:	86ce                	mv	a3,s3
 536:	4701                	li	a4,0
 538:	2601                	sext.w	a2,a2
 53a:	00000517          	auipc	a0,0x0
 53e:	61e50513          	addi	a0,a0,1566 # b58 <digits>
 542:	883a                	mv	a6,a4
 544:	2705                	addiw	a4,a4,1
 546:	02c5f7bb          	remuw	a5,a1,a2
 54a:	1782                	slli	a5,a5,0x20
 54c:	9381                	srli	a5,a5,0x20
 54e:	97aa                	add	a5,a5,a0
 550:	0007c783          	lbu	a5,0(a5)
 554:	00f68023          	sb	a5,0(a3)
 558:	0005879b          	sext.w	a5,a1
 55c:	02c5d5bb          	divuw	a1,a1,a2
 560:	0685                	addi	a3,a3,1
 562:	fec7f0e3          	bgeu	a5,a2,542 <printint+0x2c>
 566:	00088c63          	beqz	a7,57e <printint+0x68>
 56a:	fd070793          	addi	a5,a4,-48
 56e:	00878733          	add	a4,a5,s0
 572:	02d00793          	li	a5,45
 576:	fef70823          	sb	a5,-16(a4)
 57a:	0028071b          	addiw	a4,a6,2
 57e:	02e05663          	blez	a4,5aa <printint+0x94>
 582:	fc040913          	addi	s2,s0,-64
 586:	993a                	add	s2,s2,a4
 588:	19fd                	addi	s3,s3,-1
 58a:	99ba                	add	s3,s3,a4
 58c:	377d                	addiw	a4,a4,-1
 58e:	1702                	slli	a4,a4,0x20
 590:	9301                	srli	a4,a4,0x20
 592:	40e989b3          	sub	s3,s3,a4
 596:	fff94583          	lbu	a1,-1(s2)
 59a:	8526                	mv	a0,s1
 59c:	00000097          	auipc	ra,0x0
 5a0:	f58080e7          	jalr	-168(ra) # 4f4 <putc>
 5a4:	197d                	addi	s2,s2,-1
 5a6:	ff3918e3          	bne	s2,s3,596 <printint+0x80>
 5aa:	70e2                	ld	ra,56(sp)
 5ac:	7442                	ld	s0,48(sp)
 5ae:	74a2                	ld	s1,40(sp)
 5b0:	7902                	ld	s2,32(sp)
 5b2:	69e2                	ld	s3,24(sp)
 5b4:	6121                	addi	sp,sp,64
 5b6:	8082                	ret
 5b8:	40b005bb          	negw	a1,a1
 5bc:	4885                	li	a7,1
 5be:	bf8d                	j	530 <printint+0x1a>

00000000000005c0 <vprintf>:
 5c0:	715d                	addi	sp,sp,-80
 5c2:	e486                	sd	ra,72(sp)
 5c4:	e0a2                	sd	s0,64(sp)
 5c6:	fc26                	sd	s1,56(sp)
 5c8:	f84a                	sd	s2,48(sp)
 5ca:	f44e                	sd	s3,40(sp)
 5cc:	f052                	sd	s4,32(sp)
 5ce:	ec56                	sd	s5,24(sp)
 5d0:	e85a                	sd	s6,16(sp)
 5d2:	e45e                	sd	s7,8(sp)
 5d4:	e062                	sd	s8,0(sp)
 5d6:	0880                	addi	s0,sp,80
 5d8:	0005c903          	lbu	s2,0(a1)
 5dc:	18090c63          	beqz	s2,774 <vprintf+0x1b4>
 5e0:	8aaa                	mv	s5,a0
 5e2:	8bb2                	mv	s7,a2
 5e4:	00158493          	addi	s1,a1,1
 5e8:	4981                	li	s3,0
 5ea:	02500a13          	li	s4,37
 5ee:	4b55                	li	s6,21
 5f0:	a839                	j	60e <vprintf+0x4e>
 5f2:	85ca                	mv	a1,s2
 5f4:	8556                	mv	a0,s5
 5f6:	00000097          	auipc	ra,0x0
 5fa:	efe080e7          	jalr	-258(ra) # 4f4 <putc>
 5fe:	a019                	j	604 <vprintf+0x44>
 600:	01498d63          	beq	s3,s4,61a <vprintf+0x5a>
 604:	0485                	addi	s1,s1,1
 606:	fff4c903          	lbu	s2,-1(s1)
 60a:	16090563          	beqz	s2,774 <vprintf+0x1b4>
 60e:	fe0999e3          	bnez	s3,600 <vprintf+0x40>
 612:	ff4910e3          	bne	s2,s4,5f2 <vprintf+0x32>
 616:	89d2                	mv	s3,s4
 618:	b7f5                	j	604 <vprintf+0x44>
 61a:	13490263          	beq	s2,s4,73e <vprintf+0x17e>
 61e:	f9d9079b          	addiw	a5,s2,-99
 622:	0ff7f793          	zext.b	a5,a5
 626:	12fb6563          	bltu	s6,a5,750 <vprintf+0x190>
 62a:	f9d9079b          	addiw	a5,s2,-99
 62e:	0ff7f713          	zext.b	a4,a5
 632:	10eb6f63          	bltu	s6,a4,750 <vprintf+0x190>
 636:	00271793          	slli	a5,a4,0x2
 63a:	00000717          	auipc	a4,0x0
 63e:	4c670713          	addi	a4,a4,1222 # b00 <malloc+0x28e>
 642:	97ba                	add	a5,a5,a4
 644:	439c                	lw	a5,0(a5)
 646:	97ba                	add	a5,a5,a4
 648:	8782                	jr	a5
 64a:	008b8913          	addi	s2,s7,8
 64e:	4685                	li	a3,1
 650:	4629                	li	a2,10
 652:	000ba583          	lw	a1,0(s7)
 656:	8556                	mv	a0,s5
 658:	00000097          	auipc	ra,0x0
 65c:	ebe080e7          	jalr	-322(ra) # 516 <printint>
 660:	8bca                	mv	s7,s2
 662:	4981                	li	s3,0
 664:	b745                	j	604 <vprintf+0x44>
 666:	008b8913          	addi	s2,s7,8
 66a:	4681                	li	a3,0
 66c:	4629                	li	a2,10
 66e:	000ba583          	lw	a1,0(s7)
 672:	8556                	mv	a0,s5
 674:	00000097          	auipc	ra,0x0
 678:	ea2080e7          	jalr	-350(ra) # 516 <printint>
 67c:	8bca                	mv	s7,s2
 67e:	4981                	li	s3,0
 680:	b751                	j	604 <vprintf+0x44>
 682:	008b8913          	addi	s2,s7,8
 686:	4681                	li	a3,0
 688:	4641                	li	a2,16
 68a:	000ba583          	lw	a1,0(s7)
 68e:	8556                	mv	a0,s5
 690:	00000097          	auipc	ra,0x0
 694:	e86080e7          	jalr	-378(ra) # 516 <printint>
 698:	8bca                	mv	s7,s2
 69a:	4981                	li	s3,0
 69c:	b7a5                	j	604 <vprintf+0x44>
 69e:	008b8c13          	addi	s8,s7,8
 6a2:	000bb983          	ld	s3,0(s7)
 6a6:	03000593          	li	a1,48
 6aa:	8556                	mv	a0,s5
 6ac:	00000097          	auipc	ra,0x0
 6b0:	e48080e7          	jalr	-440(ra) # 4f4 <putc>
 6b4:	07800593          	li	a1,120
 6b8:	8556                	mv	a0,s5
 6ba:	00000097          	auipc	ra,0x0
 6be:	e3a080e7          	jalr	-454(ra) # 4f4 <putc>
 6c2:	4941                	li	s2,16
 6c4:	00000b97          	auipc	s7,0x0
 6c8:	494b8b93          	addi	s7,s7,1172 # b58 <digits>
 6cc:	03c9d793          	srli	a5,s3,0x3c
 6d0:	97de                	add	a5,a5,s7
 6d2:	0007c583          	lbu	a1,0(a5)
 6d6:	8556                	mv	a0,s5
 6d8:	00000097          	auipc	ra,0x0
 6dc:	e1c080e7          	jalr	-484(ra) # 4f4 <putc>
 6e0:	0992                	slli	s3,s3,0x4
 6e2:	397d                	addiw	s2,s2,-1
 6e4:	fe0914e3          	bnez	s2,6cc <vprintf+0x10c>
 6e8:	8be2                	mv	s7,s8
 6ea:	4981                	li	s3,0
 6ec:	bf21                	j	604 <vprintf+0x44>
 6ee:	008b8993          	addi	s3,s7,8
 6f2:	000bb903          	ld	s2,0(s7)
 6f6:	02090163          	beqz	s2,718 <vprintf+0x158>
 6fa:	00094583          	lbu	a1,0(s2)
 6fe:	c9a5                	beqz	a1,76e <vprintf+0x1ae>
 700:	8556                	mv	a0,s5
 702:	00000097          	auipc	ra,0x0
 706:	df2080e7          	jalr	-526(ra) # 4f4 <putc>
 70a:	0905                	addi	s2,s2,1
 70c:	00094583          	lbu	a1,0(s2)
 710:	f9e5                	bnez	a1,700 <vprintf+0x140>
 712:	8bce                	mv	s7,s3
 714:	4981                	li	s3,0
 716:	b5fd                	j	604 <vprintf+0x44>
 718:	00000917          	auipc	s2,0x0
 71c:	3e090913          	addi	s2,s2,992 # af8 <malloc+0x286>
 720:	02800593          	li	a1,40
 724:	bff1                	j	700 <vprintf+0x140>
 726:	008b8913          	addi	s2,s7,8
 72a:	000bc583          	lbu	a1,0(s7)
 72e:	8556                	mv	a0,s5
 730:	00000097          	auipc	ra,0x0
 734:	dc4080e7          	jalr	-572(ra) # 4f4 <putc>
 738:	8bca                	mv	s7,s2
 73a:	4981                	li	s3,0
 73c:	b5e1                	j	604 <vprintf+0x44>
 73e:	02500593          	li	a1,37
 742:	8556                	mv	a0,s5
 744:	00000097          	auipc	ra,0x0
 748:	db0080e7          	jalr	-592(ra) # 4f4 <putc>
 74c:	4981                	li	s3,0
 74e:	bd5d                	j	604 <vprintf+0x44>
 750:	02500593          	li	a1,37
 754:	8556                	mv	a0,s5
 756:	00000097          	auipc	ra,0x0
 75a:	d9e080e7          	jalr	-610(ra) # 4f4 <putc>
 75e:	85ca                	mv	a1,s2
 760:	8556                	mv	a0,s5
 762:	00000097          	auipc	ra,0x0
 766:	d92080e7          	jalr	-622(ra) # 4f4 <putc>
 76a:	4981                	li	s3,0
 76c:	bd61                	j	604 <vprintf+0x44>
 76e:	8bce                	mv	s7,s3
 770:	4981                	li	s3,0
 772:	bd49                	j	604 <vprintf+0x44>
 774:	60a6                	ld	ra,72(sp)
 776:	6406                	ld	s0,64(sp)
 778:	74e2                	ld	s1,56(sp)
 77a:	7942                	ld	s2,48(sp)
 77c:	79a2                	ld	s3,40(sp)
 77e:	7a02                	ld	s4,32(sp)
 780:	6ae2                	ld	s5,24(sp)
 782:	6b42                	ld	s6,16(sp)
 784:	6ba2                	ld	s7,8(sp)
 786:	6c02                	ld	s8,0(sp)
 788:	6161                	addi	sp,sp,80
 78a:	8082                	ret

000000000000078c <fprintf>:
 78c:	715d                	addi	sp,sp,-80
 78e:	ec06                	sd	ra,24(sp)
 790:	e822                	sd	s0,16(sp)
 792:	1000                	addi	s0,sp,32
 794:	e010                	sd	a2,0(s0)
 796:	e414                	sd	a3,8(s0)
 798:	e818                	sd	a4,16(s0)
 79a:	ec1c                	sd	a5,24(s0)
 79c:	03043023          	sd	a6,32(s0)
 7a0:	03143423          	sd	a7,40(s0)
 7a4:	8622                	mv	a2,s0
 7a6:	fe843423          	sd	s0,-24(s0)
 7aa:	00000097          	auipc	ra,0x0
 7ae:	e16080e7          	jalr	-490(ra) # 5c0 <vprintf>
 7b2:	60e2                	ld	ra,24(sp)
 7b4:	6442                	ld	s0,16(sp)
 7b6:	6161                	addi	sp,sp,80
 7b8:	8082                	ret

00000000000007ba <printf>:
 7ba:	711d                	addi	sp,sp,-96
 7bc:	ec06                	sd	ra,24(sp)
 7be:	e822                	sd	s0,16(sp)
 7c0:	1000                	addi	s0,sp,32
 7c2:	e40c                	sd	a1,8(s0)
 7c4:	e810                	sd	a2,16(s0)
 7c6:	ec14                	sd	a3,24(s0)
 7c8:	f018                	sd	a4,32(s0)
 7ca:	f41c                	sd	a5,40(s0)
 7cc:	03043823          	sd	a6,48(s0)
 7d0:	03143c23          	sd	a7,56(s0)
 7d4:	00840613          	addi	a2,s0,8
 7d8:	fec43423          	sd	a2,-24(s0)
 7dc:	85aa                	mv	a1,a0
 7de:	4505                	li	a0,1
 7e0:	00000097          	auipc	ra,0x0
 7e4:	de0080e7          	jalr	-544(ra) # 5c0 <vprintf>
 7e8:	60e2                	ld	ra,24(sp)
 7ea:	6442                	ld	s0,16(sp)
 7ec:	6125                	addi	sp,sp,96
 7ee:	8082                	ret

00000000000007f0 <free>:
 7f0:	1141                	addi	sp,sp,-16
 7f2:	e422                	sd	s0,8(sp)
 7f4:	0800                	addi	s0,sp,16
 7f6:	ff050693          	addi	a3,a0,-16
 7fa:	00000797          	auipc	a5,0x0
 7fe:	48e7b783          	ld	a5,1166(a5) # c88 <freep>
 802:	a02d                	j	82c <free+0x3c>
 804:	4618                	lw	a4,8(a2)
 806:	9f2d                	addw	a4,a4,a1
 808:	fee52c23          	sw	a4,-8(a0)
 80c:	6398                	ld	a4,0(a5)
 80e:	6310                	ld	a2,0(a4)
 810:	a83d                	j	84e <free+0x5e>
 812:	ff852703          	lw	a4,-8(a0)
 816:	9f31                	addw	a4,a4,a2
 818:	c798                	sw	a4,8(a5)
 81a:	ff053683          	ld	a3,-16(a0)
 81e:	a091                	j	862 <free+0x72>
 820:	6398                	ld	a4,0(a5)
 822:	00e7e463          	bltu	a5,a4,82a <free+0x3a>
 826:	00e6ea63          	bltu	a3,a4,83a <free+0x4a>
 82a:	87ba                	mv	a5,a4
 82c:	fed7fae3          	bgeu	a5,a3,820 <free+0x30>
 830:	6398                	ld	a4,0(a5)
 832:	00e6e463          	bltu	a3,a4,83a <free+0x4a>
 836:	fee7eae3          	bltu	a5,a4,82a <free+0x3a>
 83a:	ff852583          	lw	a1,-8(a0)
 83e:	6390                	ld	a2,0(a5)
 840:	02059813          	slli	a6,a1,0x20
 844:	01c85713          	srli	a4,a6,0x1c
 848:	9736                	add	a4,a4,a3
 84a:	fae60de3          	beq	a2,a4,804 <free+0x14>
 84e:	fec53823          	sd	a2,-16(a0)
 852:	4790                	lw	a2,8(a5)
 854:	02061593          	slli	a1,a2,0x20
 858:	01c5d713          	srli	a4,a1,0x1c
 85c:	973e                	add	a4,a4,a5
 85e:	fae68ae3          	beq	a3,a4,812 <free+0x22>
 862:	e394                	sd	a3,0(a5)
 864:	00000717          	auipc	a4,0x0
 868:	42f73223          	sd	a5,1060(a4) # c88 <freep>
 86c:	6422                	ld	s0,8(sp)
 86e:	0141                	addi	sp,sp,16
 870:	8082                	ret

0000000000000872 <malloc>:
 872:	7139                	addi	sp,sp,-64
 874:	fc06                	sd	ra,56(sp)
 876:	f822                	sd	s0,48(sp)
 878:	f426                	sd	s1,40(sp)
 87a:	f04a                	sd	s2,32(sp)
 87c:	ec4e                	sd	s3,24(sp)
 87e:	e852                	sd	s4,16(sp)
 880:	e456                	sd	s5,8(sp)
 882:	e05a                	sd	s6,0(sp)
 884:	0080                	addi	s0,sp,64
 886:	02051493          	slli	s1,a0,0x20
 88a:	9081                	srli	s1,s1,0x20
 88c:	04bd                	addi	s1,s1,15
 88e:	8091                	srli	s1,s1,0x4
 890:	0014899b          	addiw	s3,s1,1
 894:	0485                	addi	s1,s1,1
 896:	00000517          	auipc	a0,0x0
 89a:	3f253503          	ld	a0,1010(a0) # c88 <freep>
 89e:	c515                	beqz	a0,8ca <malloc+0x58>
 8a0:	611c                	ld	a5,0(a0)
 8a2:	4798                	lw	a4,8(a5)
 8a4:	04977063          	bgeu	a4,s1,8e4 <malloc+0x72>
 8a8:	8a4e                	mv	s4,s3
 8aa:	0009871b          	sext.w	a4,s3
 8ae:	6685                	lui	a3,0x1
 8b0:	00d77363          	bgeu	a4,a3,8b6 <malloc+0x44>
 8b4:	6a05                	lui	s4,0x1
 8b6:	000a0b1b          	sext.w	s6,s4
 8ba:	004a1a1b          	slliw	s4,s4,0x4
 8be:	00000917          	auipc	s2,0x0
 8c2:	3ca90913          	addi	s2,s2,970 # c88 <freep>
 8c6:	5afd                	li	s5,-1
 8c8:	a89d                	j	93e <malloc+0xcc>
 8ca:	00000717          	auipc	a4,0x0
 8ce:	3be70713          	addi	a4,a4,958 # c88 <freep>
 8d2:	00000797          	auipc	a5,0x0
 8d6:	3be78793          	addi	a5,a5,958 # c90 <base>
 8da:	e31c                	sd	a5,0(a4)
 8dc:	e71c                	sd	a5,8(a4)
 8de:	00072823          	sw	zero,16(a4)
 8e2:	b7d9                	j	8a8 <malloc+0x36>
 8e4:	02e48c63          	beq	s1,a4,91c <malloc+0xaa>
 8e8:	4137073b          	subw	a4,a4,s3
 8ec:	c798                	sw	a4,8(a5)
 8ee:	02071693          	slli	a3,a4,0x20
 8f2:	01c6d713          	srli	a4,a3,0x1c
 8f6:	97ba                	add	a5,a5,a4
 8f8:	0137a423          	sw	s3,8(a5)
 8fc:	00000717          	auipc	a4,0x0
 900:	38a73623          	sd	a0,908(a4) # c88 <freep>
 904:	01078513          	addi	a0,a5,16
 908:	70e2                	ld	ra,56(sp)
 90a:	7442                	ld	s0,48(sp)
 90c:	74a2                	ld	s1,40(sp)
 90e:	7902                	ld	s2,32(sp)
 910:	69e2                	ld	s3,24(sp)
 912:	6a42                	ld	s4,16(sp)
 914:	6aa2                	ld	s5,8(sp)
 916:	6b02                	ld	s6,0(sp)
 918:	6121                	addi	sp,sp,64
 91a:	8082                	ret
 91c:	6398                	ld	a4,0(a5)
 91e:	e118                	sd	a4,0(a0)
 920:	bff1                	j	8fc <malloc+0x8a>
 922:	01652423          	sw	s6,8(a0)
 926:	0541                	addi	a0,a0,16
 928:	00000097          	auipc	ra,0x0
 92c:	ec8080e7          	jalr	-312(ra) # 7f0 <free>
 930:	00093503          	ld	a0,0(s2)
 934:	d971                	beqz	a0,908 <malloc+0x96>
 936:	611c                	ld	a5,0(a0)
 938:	4798                	lw	a4,8(a5)
 93a:	fa9775e3          	bgeu	a4,s1,8e4 <malloc+0x72>
 93e:	00093703          	ld	a4,0(s2)
 942:	853e                	mv	a0,a5
 944:	fef719e3          	bne	a4,a5,936 <malloc+0xc4>
 948:	8552                	mv	a0,s4
 94a:	00000097          	auipc	ra,0x0
 94e:	b52080e7          	jalr	-1198(ra) # 49c <sbrk>
 952:	fd5518e3          	bne	a0,s5,922 <malloc+0xb0>
 956:	4501                	li	a0,0
 958:	bf45                	j	908 <malloc+0x96>
