
xv6-user/_xargs:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <readline>:
/**
 * len:    include the 0 in the end.
 * return: the number of bytes that read successfully (0 in the end is not included)
 */
int readline(int fd, char *buf, int len)
{
   0:	7139                	addi	sp,sp,-64
   2:	fc06                	sd	ra,56(sp)
   4:	f822                	sd	s0,48(sp)
   6:	f426                	sd	s1,40(sp)
   8:	f04a                	sd	s2,32(sp)
   a:	ec4e                	sd	s3,24(sp)
   c:	e852                	sd	s4,16(sp)
   e:	e456                	sd	s5,8(sp)
  10:	0080                	addi	s0,sp,64
  12:	89aa                	mv	s3,a0
  14:	892e                	mv	s2,a1
    char *p = buf;
  16:	84ae                	mv	s1,a1
    while (read(fd, p, 1) != 0 && p < buf + len) {
  18:	00c58a33          	add	s4,a1,a2
        if (*p == '\n') {
  1c:	4aa9                	li	s5,10
    while (read(fd, p, 1) != 0 && p < buf + len) {
  1e:	a011                	j	22 <readline+0x22>
                continue;
            }
            *p = '\0';
            break;
        }
        p++;
  20:	0485                	addi	s1,s1,1
    while (read(fd, p, 1) != 0 && p < buf + len) {
  22:	4605                	li	a2,1
  24:	85a6                	mv	a1,s1
  26:	854e                	mv	a0,s3
  28:	00000097          	auipc	ra,0x0
  2c:	45e080e7          	jalr	1118(ra) # 486 <read>
  30:	c905                	beqz	a0,60 <readline+0x60>
  32:	0344f763          	bgeu	s1,s4,60 <readline+0x60>
        if (*p == '\n') {
  36:	0004c783          	lbu	a5,0(s1)
  3a:	ff5793e3          	bne	a5,s5,20 <readline+0x20>
            if (p == buf) {     // ignore empty line
  3e:	01248f63          	beq	s1,s2,5c <readline+0x5c>
            *p = '\0';
  42:	00048023          	sb	zero,0(s1)
    }
    if (p == buf) {
        return 0;
    }
    return p - buf;
  46:	4124853b          	subw	a0,s1,s2
}
  4a:	70e2                	ld	ra,56(sp)
  4c:	7442                	ld	s0,48(sp)
  4e:	74a2                	ld	s1,40(sp)
  50:	7902                	ld	s2,32(sp)
  52:	69e2                	ld	s3,24(sp)
  54:	6a42                	ld	s4,16(sp)
  56:	6aa2                	ld	s5,8(sp)
  58:	6121                	addi	sp,sp,64
  5a:	8082                	ret
  5c:	84ca                	mv	s1,s2
  5e:	b7d1                	j	22 <readline+0x22>
        return 0;
  60:	4501                	li	a0,0
    if (p == buf) {
  62:	ff2484e3          	beq	s1,s2,4a <readline+0x4a>
  66:	b7c5                	j	46 <readline+0x46>

0000000000000068 <main>:

int main(int argc, char *argv[])
{
  68:	7161                	addi	sp,sp,-432
  6a:	f706                	sd	ra,424(sp)
  6c:	f322                	sd	s0,416(sp)
  6e:	ef26                	sd	s1,408(sp)
  70:	eb4a                	sd	s2,400(sp)
  72:	e74e                	sd	s3,392(sp)
  74:	1b00                	addi	s0,sp,432
    if (argc < 2) {
  76:	4785                	li	a5,1
  78:	0aa7d063          	bge	a5,a0,118 <main+0xb0>
  7c:	84aa                	mv	s1,a0
  7e:	892e                	mv	s2,a1
  80:	00858713          	addi	a4,a1,8
  84:	ed040793          	addi	a5,s0,-304
  88:	0005059b          	sext.w	a1,a0
  8c:	ffe5061b          	addiw	a2,a0,-2
  90:	02061693          	slli	a3,a2,0x20
  94:	01d6d613          	srli	a2,a3,0x1d
  98:	ed840693          	addi	a3,s0,-296
  9c:	9636                	add	a2,a2,a3
    }
    char *argvs[MAXARG];
    char buf[128];
    int i;
    for (i = 1; i < argc; i++) {
        argvs[i - 1] = argv[i];         // argvs[0] = COMMAND
  9e:	6314                	ld	a3,0(a4)
  a0:	e394                	sd	a3,0(a5)
    for (i = 1; i < argc; i++) {
  a2:	0721                	addi	a4,a4,8
  a4:	07a1                	addi	a5,a5,8
  a6:	fec79ce3          	bne	a5,a2,9e <main+0x36>
  aa:	fff5899b          	addiw	s3,a1,-1
    }
    i--;
    if (readline(0, buf, 128) == 0) {   // if there is no input
  ae:	08000613          	li	a2,128
  b2:	e5040593          	addi	a1,s0,-432
  b6:	4501                	li	a0,0
  b8:	00000097          	auipc	ra,0x0
  bc:	f48080e7          	jalr	-184(ra) # 0 <readline>
  c0:	c935                	beqz	a0,134 <main+0xcc>
            printf("xargs: exec %s fail\n", argv[1]);
            exit(0);
        }
        wait(0);
    } else {
        argvs[i] = buf;
  c2:	00399593          	slli	a1,s3,0x3
  c6:	fd058793          	addi	a5,a1,-48
  ca:	008785b3          	add	a1,a5,s0
  ce:	e5040793          	addi	a5,s0,-432
  d2:	f0f5b023          	sd	a5,-256(a1)
        argvs[i + 1] = 0;
  d6:	048e                	slli	s1,s1,0x3
  d8:	fd048793          	addi	a5,s1,-48
  dc:	008784b3          	add	s1,a5,s0
  e0:	f004b023          	sd	zero,-256(s1)
                exec(argv[1], argvs);
                printf("xargs: exec %s fail\n", argv[1]);
                exit(0);
            }
            wait(0);
        } while (readline(0, buf, 128) != 0);
  e4:	e5040493          	addi	s1,s0,-432
            if (fork() == 0) {
  e8:	00000097          	auipc	ra,0x0
  ec:	37e080e7          	jalr	894(ra) # 466 <fork>
  f0:	cd41                	beqz	a0,188 <main+0x120>
            wait(0);
  f2:	4501                	li	a0,0
  f4:	00000097          	auipc	ra,0x0
  f8:	382080e7          	jalr	898(ra) # 476 <wait>
        } while (readline(0, buf, 128) != 0);
  fc:	08000613          	li	a2,128
 100:	85a6                	mv	a1,s1
 102:	4501                	li	a0,0
 104:	00000097          	auipc	ra,0x0
 108:	efc080e7          	jalr	-260(ra) # 0 <readline>
 10c:	fd71                	bnez	a0,e8 <main+0x80>
    }
    exit(0);
 10e:	4501                	li	a0,0
 110:	00000097          	auipc	ra,0x0
 114:	35e080e7          	jalr	862(ra) # 46e <exit>
        fprintf(2, "Usage: xargs COMMAND [INITIAL-ARGS]...\n");
 118:	00001597          	auipc	a1,0x1
 11c:	88858593          	addi	a1,a1,-1912 # 9a0 <malloc+0xec>
 120:	4509                	li	a0,2
 122:	00000097          	auipc	ra,0x0
 126:	6ac080e7          	jalr	1708(ra) # 7ce <fprintf>
        exit(-1);
 12a:	557d                	li	a0,-1
 12c:	00000097          	auipc	ra,0x0
 130:	342080e7          	jalr	834(ra) # 46e <exit>
        argvs[i] = 0;
 134:	00399593          	slli	a1,s3,0x3
 138:	fd058793          	addi	a5,a1,-48
 13c:	008785b3          	add	a1,a5,s0
 140:	f005b023          	sd	zero,-256(a1)
        if (fork() == 0) {
 144:	00000097          	auipc	ra,0x0
 148:	322080e7          	jalr	802(ra) # 466 <fork>
 14c:	e905                	bnez	a0,17c <main+0x114>
            exec(argv[1], argvs);
 14e:	ed040593          	addi	a1,s0,-304
 152:	00893503          	ld	a0,8(s2)
 156:	00000097          	auipc	ra,0x0
 15a:	350080e7          	jalr	848(ra) # 4a6 <exec>
            printf("xargs: exec %s fail\n", argv[1]);
 15e:	00893583          	ld	a1,8(s2)
 162:	00001517          	auipc	a0,0x1
 166:	86650513          	addi	a0,a0,-1946 # 9c8 <malloc+0x114>
 16a:	00000097          	auipc	ra,0x0
 16e:	692080e7          	jalr	1682(ra) # 7fc <printf>
            exit(0);
 172:	4501                	li	a0,0
 174:	00000097          	auipc	ra,0x0
 178:	2fa080e7          	jalr	762(ra) # 46e <exit>
        wait(0);
 17c:	4501                	li	a0,0
 17e:	00000097          	auipc	ra,0x0
 182:	2f8080e7          	jalr	760(ra) # 476 <wait>
 186:	b761                	j	10e <main+0xa6>
                exec(argv[1], argvs);
 188:	ed040593          	addi	a1,s0,-304
 18c:	00893503          	ld	a0,8(s2)
 190:	00000097          	auipc	ra,0x0
 194:	316080e7          	jalr	790(ra) # 4a6 <exec>
                printf("xargs: exec %s fail\n", argv[1]);
 198:	00893583          	ld	a1,8(s2)
 19c:	00001517          	auipc	a0,0x1
 1a0:	82c50513          	addi	a0,a0,-2004 # 9c8 <malloc+0x114>
 1a4:	00000097          	auipc	ra,0x0
 1a8:	658080e7          	jalr	1624(ra) # 7fc <printf>
                exit(0);
 1ac:	4501                	li	a0,0
 1ae:	00000097          	auipc	ra,0x0
 1b2:	2c0080e7          	jalr	704(ra) # 46e <exit>

00000000000001b6 <strcpy>:
 1b6:	1141                	addi	sp,sp,-16
 1b8:	e422                	sd	s0,8(sp)
 1ba:	0800                	addi	s0,sp,16
 1bc:	87aa                	mv	a5,a0
 1be:	0585                	addi	a1,a1,1
 1c0:	0785                	addi	a5,a5,1
 1c2:	fff5c703          	lbu	a4,-1(a1)
 1c6:	fee78fa3          	sb	a4,-1(a5)
 1ca:	fb75                	bnez	a4,1be <strcpy+0x8>
 1cc:	6422                	ld	s0,8(sp)
 1ce:	0141                	addi	sp,sp,16
 1d0:	8082                	ret

00000000000001d2 <strcat>:
 1d2:	1141                	addi	sp,sp,-16
 1d4:	e422                	sd	s0,8(sp)
 1d6:	0800                	addi	s0,sp,16
 1d8:	00054783          	lbu	a5,0(a0)
 1dc:	c385                	beqz	a5,1fc <strcat+0x2a>
 1de:	87aa                	mv	a5,a0
 1e0:	0785                	addi	a5,a5,1
 1e2:	0007c703          	lbu	a4,0(a5)
 1e6:	ff6d                	bnez	a4,1e0 <strcat+0xe>
 1e8:	0585                	addi	a1,a1,1
 1ea:	0785                	addi	a5,a5,1
 1ec:	fff5c703          	lbu	a4,-1(a1)
 1f0:	fee78fa3          	sb	a4,-1(a5)
 1f4:	fb75                	bnez	a4,1e8 <strcat+0x16>
 1f6:	6422                	ld	s0,8(sp)
 1f8:	0141                	addi	sp,sp,16
 1fa:	8082                	ret
 1fc:	87aa                	mv	a5,a0
 1fe:	b7ed                	j	1e8 <strcat+0x16>

0000000000000200 <strcmp>:
 200:	1141                	addi	sp,sp,-16
 202:	e422                	sd	s0,8(sp)
 204:	0800                	addi	s0,sp,16
 206:	00054783          	lbu	a5,0(a0)
 20a:	cb91                	beqz	a5,21e <strcmp+0x1e>
 20c:	0005c703          	lbu	a4,0(a1)
 210:	00f71763          	bne	a4,a5,21e <strcmp+0x1e>
 214:	0505                	addi	a0,a0,1
 216:	0585                	addi	a1,a1,1
 218:	00054783          	lbu	a5,0(a0)
 21c:	fbe5                	bnez	a5,20c <strcmp+0xc>
 21e:	0005c503          	lbu	a0,0(a1)
 222:	40a7853b          	subw	a0,a5,a0
 226:	6422                	ld	s0,8(sp)
 228:	0141                	addi	sp,sp,16
 22a:	8082                	ret

000000000000022c <strlen>:
 22c:	1141                	addi	sp,sp,-16
 22e:	e422                	sd	s0,8(sp)
 230:	0800                	addi	s0,sp,16
 232:	00054783          	lbu	a5,0(a0)
 236:	cf91                	beqz	a5,252 <strlen+0x26>
 238:	0505                	addi	a0,a0,1
 23a:	87aa                	mv	a5,a0
 23c:	86be                	mv	a3,a5
 23e:	0785                	addi	a5,a5,1
 240:	fff7c703          	lbu	a4,-1(a5)
 244:	ff65                	bnez	a4,23c <strlen+0x10>
 246:	40a6853b          	subw	a0,a3,a0
 24a:	2505                	addiw	a0,a0,1
 24c:	6422                	ld	s0,8(sp)
 24e:	0141                	addi	sp,sp,16
 250:	8082                	ret
 252:	4501                	li	a0,0
 254:	bfe5                	j	24c <strlen+0x20>

0000000000000256 <memset>:
 256:	1141                	addi	sp,sp,-16
 258:	e422                	sd	s0,8(sp)
 25a:	0800                	addi	s0,sp,16
 25c:	ca19                	beqz	a2,272 <memset+0x1c>
 25e:	87aa                	mv	a5,a0
 260:	1602                	slli	a2,a2,0x20
 262:	9201                	srli	a2,a2,0x20
 264:	00a60733          	add	a4,a2,a0
 268:	00b78023          	sb	a1,0(a5)
 26c:	0785                	addi	a5,a5,1
 26e:	fee79de3          	bne	a5,a4,268 <memset+0x12>
 272:	6422                	ld	s0,8(sp)
 274:	0141                	addi	sp,sp,16
 276:	8082                	ret

0000000000000278 <strchr>:
 278:	1141                	addi	sp,sp,-16
 27a:	e422                	sd	s0,8(sp)
 27c:	0800                	addi	s0,sp,16
 27e:	00054783          	lbu	a5,0(a0)
 282:	cb99                	beqz	a5,298 <strchr+0x20>
 284:	00f58763          	beq	a1,a5,292 <strchr+0x1a>
 288:	0505                	addi	a0,a0,1
 28a:	00054783          	lbu	a5,0(a0)
 28e:	fbfd                	bnez	a5,284 <strchr+0xc>
 290:	4501                	li	a0,0
 292:	6422                	ld	s0,8(sp)
 294:	0141                	addi	sp,sp,16
 296:	8082                	ret
 298:	4501                	li	a0,0
 29a:	bfe5                	j	292 <strchr+0x1a>

000000000000029c <gets>:
 29c:	711d                	addi	sp,sp,-96
 29e:	ec86                	sd	ra,88(sp)
 2a0:	e8a2                	sd	s0,80(sp)
 2a2:	e4a6                	sd	s1,72(sp)
 2a4:	e0ca                	sd	s2,64(sp)
 2a6:	fc4e                	sd	s3,56(sp)
 2a8:	f852                	sd	s4,48(sp)
 2aa:	f456                	sd	s5,40(sp)
 2ac:	f05a                	sd	s6,32(sp)
 2ae:	ec5e                	sd	s7,24(sp)
 2b0:	e862                	sd	s8,16(sp)
 2b2:	1080                	addi	s0,sp,96
 2b4:	8baa                	mv	s7,a0
 2b6:	8a2e                	mv	s4,a1
 2b8:	892a                	mv	s2,a0
 2ba:	4481                	li	s1,0
 2bc:	faf40a93          	addi	s5,s0,-81
 2c0:	4b29                	li	s6,10
 2c2:	4c35                	li	s8,13
 2c4:	89a6                	mv	s3,s1
 2c6:	2485                	addiw	s1,s1,1
 2c8:	0344d763          	bge	s1,s4,2f6 <gets+0x5a>
 2cc:	4605                	li	a2,1
 2ce:	85d6                	mv	a1,s5
 2d0:	4501                	li	a0,0
 2d2:	00000097          	auipc	ra,0x0
 2d6:	1b4080e7          	jalr	436(ra) # 486 <read>
 2da:	00a05e63          	blez	a0,2f6 <gets+0x5a>
 2de:	faf44783          	lbu	a5,-81(s0)
 2e2:	00f90023          	sb	a5,0(s2)
 2e6:	01678763          	beq	a5,s6,2f4 <gets+0x58>
 2ea:	0905                	addi	s2,s2,1
 2ec:	fd879ce3          	bne	a5,s8,2c4 <gets+0x28>
 2f0:	89a6                	mv	s3,s1
 2f2:	a011                	j	2f6 <gets+0x5a>
 2f4:	89a6                	mv	s3,s1
 2f6:	99de                	add	s3,s3,s7
 2f8:	00098023          	sb	zero,0(s3)
 2fc:	855e                	mv	a0,s7
 2fe:	60e6                	ld	ra,88(sp)
 300:	6446                	ld	s0,80(sp)
 302:	64a6                	ld	s1,72(sp)
 304:	6906                	ld	s2,64(sp)
 306:	79e2                	ld	s3,56(sp)
 308:	7a42                	ld	s4,48(sp)
 30a:	7aa2                	ld	s5,40(sp)
 30c:	7b02                	ld	s6,32(sp)
 30e:	6be2                	ld	s7,24(sp)
 310:	6c42                	ld	s8,16(sp)
 312:	6125                	addi	sp,sp,96
 314:	8082                	ret

0000000000000316 <stat>:
 316:	1101                	addi	sp,sp,-32
 318:	ec06                	sd	ra,24(sp)
 31a:	e822                	sd	s0,16(sp)
 31c:	e426                	sd	s1,8(sp)
 31e:	e04a                	sd	s2,0(sp)
 320:	1000                	addi	s0,sp,32
 322:	892e                	mv	s2,a1
 324:	4581                	li	a1,0
 326:	00000097          	auipc	ra,0x0
 32a:	188080e7          	jalr	392(ra) # 4ae <open>
 32e:	02054563          	bltz	a0,358 <stat+0x42>
 332:	84aa                	mv	s1,a0
 334:	85ca                	mv	a1,s2
 336:	00000097          	auipc	ra,0x0
 33a:	180080e7          	jalr	384(ra) # 4b6 <fstat>
 33e:	892a                	mv	s2,a0
 340:	8526                	mv	a0,s1
 342:	00000097          	auipc	ra,0x0
 346:	154080e7          	jalr	340(ra) # 496 <close>
 34a:	854a                	mv	a0,s2
 34c:	60e2                	ld	ra,24(sp)
 34e:	6442                	ld	s0,16(sp)
 350:	64a2                	ld	s1,8(sp)
 352:	6902                	ld	s2,0(sp)
 354:	6105                	addi	sp,sp,32
 356:	8082                	ret
 358:	597d                	li	s2,-1
 35a:	bfc5                	j	34a <stat+0x34>

000000000000035c <atoi>:
 35c:	1141                	addi	sp,sp,-16
 35e:	e422                	sd	s0,8(sp)
 360:	0800                	addi	s0,sp,16
 362:	00054703          	lbu	a4,0(a0)
 366:	02d00793          	li	a5,45
 36a:	4585                	li	a1,1
 36c:	04f70363          	beq	a4,a5,3b2 <atoi+0x56>
 370:	00054703          	lbu	a4,0(a0)
 374:	fd07079b          	addiw	a5,a4,-48
 378:	0ff7f793          	zext.b	a5,a5
 37c:	46a5                	li	a3,9
 37e:	02f6ed63          	bltu	a3,a5,3b8 <atoi+0x5c>
 382:	4681                	li	a3,0
 384:	4625                	li	a2,9
 386:	0505                	addi	a0,a0,1
 388:	0026979b          	slliw	a5,a3,0x2
 38c:	9fb5                	addw	a5,a5,a3
 38e:	0017979b          	slliw	a5,a5,0x1
 392:	9fb9                	addw	a5,a5,a4
 394:	fd07869b          	addiw	a3,a5,-48
 398:	00054703          	lbu	a4,0(a0)
 39c:	fd07079b          	addiw	a5,a4,-48
 3a0:	0ff7f793          	zext.b	a5,a5
 3a4:	fef671e3          	bgeu	a2,a5,386 <atoi+0x2a>
 3a8:	02d5853b          	mulw	a0,a1,a3
 3ac:	6422                	ld	s0,8(sp)
 3ae:	0141                	addi	sp,sp,16
 3b0:	8082                	ret
 3b2:	0505                	addi	a0,a0,1
 3b4:	55fd                	li	a1,-1
 3b6:	bf6d                	j	370 <atoi+0x14>
 3b8:	4681                	li	a3,0
 3ba:	b7fd                	j	3a8 <atoi+0x4c>

00000000000003bc <memmove>:
 3bc:	1141                	addi	sp,sp,-16
 3be:	e422                	sd	s0,8(sp)
 3c0:	0800                	addi	s0,sp,16
 3c2:	02b57463          	bgeu	a0,a1,3ea <memmove+0x2e>
 3c6:	00c05f63          	blez	a2,3e4 <memmove+0x28>
 3ca:	1602                	slli	a2,a2,0x20
 3cc:	9201                	srli	a2,a2,0x20
 3ce:	00c507b3          	add	a5,a0,a2
 3d2:	872a                	mv	a4,a0
 3d4:	0585                	addi	a1,a1,1
 3d6:	0705                	addi	a4,a4,1
 3d8:	fff5c683          	lbu	a3,-1(a1)
 3dc:	fed70fa3          	sb	a3,-1(a4)
 3e0:	fee79ae3          	bne	a5,a4,3d4 <memmove+0x18>
 3e4:	6422                	ld	s0,8(sp)
 3e6:	0141                	addi	sp,sp,16
 3e8:	8082                	ret
 3ea:	00c50733          	add	a4,a0,a2
 3ee:	95b2                	add	a1,a1,a2
 3f0:	fec05ae3          	blez	a2,3e4 <memmove+0x28>
 3f4:	fff6079b          	addiw	a5,a2,-1
 3f8:	1782                	slli	a5,a5,0x20
 3fa:	9381                	srli	a5,a5,0x20
 3fc:	fff7c793          	not	a5,a5
 400:	97ba                	add	a5,a5,a4
 402:	15fd                	addi	a1,a1,-1
 404:	177d                	addi	a4,a4,-1
 406:	0005c683          	lbu	a3,0(a1)
 40a:	00d70023          	sb	a3,0(a4)
 40e:	fee79ae3          	bne	a5,a4,402 <memmove+0x46>
 412:	bfc9                	j	3e4 <memmove+0x28>

0000000000000414 <memcmp>:
 414:	1141                	addi	sp,sp,-16
 416:	e422                	sd	s0,8(sp)
 418:	0800                	addi	s0,sp,16
 41a:	ca05                	beqz	a2,44a <memcmp+0x36>
 41c:	fff6069b          	addiw	a3,a2,-1
 420:	1682                	slli	a3,a3,0x20
 422:	9281                	srli	a3,a3,0x20
 424:	0685                	addi	a3,a3,1
 426:	96aa                	add	a3,a3,a0
 428:	00054783          	lbu	a5,0(a0)
 42c:	0005c703          	lbu	a4,0(a1)
 430:	00e79863          	bne	a5,a4,440 <memcmp+0x2c>
 434:	0505                	addi	a0,a0,1
 436:	0585                	addi	a1,a1,1
 438:	fed518e3          	bne	a0,a3,428 <memcmp+0x14>
 43c:	4501                	li	a0,0
 43e:	a019                	j	444 <memcmp+0x30>
 440:	40e7853b          	subw	a0,a5,a4
 444:	6422                	ld	s0,8(sp)
 446:	0141                	addi	sp,sp,16
 448:	8082                	ret
 44a:	4501                	li	a0,0
 44c:	bfe5                	j	444 <memcmp+0x30>

000000000000044e <memcpy>:
 44e:	1141                	addi	sp,sp,-16
 450:	e406                	sd	ra,8(sp)
 452:	e022                	sd	s0,0(sp)
 454:	0800                	addi	s0,sp,16
 456:	00000097          	auipc	ra,0x0
 45a:	f66080e7          	jalr	-154(ra) # 3bc <memmove>
 45e:	60a2                	ld	ra,8(sp)
 460:	6402                	ld	s0,0(sp)
 462:	0141                	addi	sp,sp,16
 464:	8082                	ret

0000000000000466 <fork>:
 466:	4885                	li	a7,1
 468:	00000073          	ecall
 46c:	8082                	ret

000000000000046e <exit>:
 46e:	4889                	li	a7,2
 470:	00000073          	ecall
 474:	8082                	ret

0000000000000476 <wait>:
 476:	488d                	li	a7,3
 478:	00000073          	ecall
 47c:	8082                	ret

000000000000047e <pipe>:
 47e:	4891                	li	a7,4
 480:	00000073          	ecall
 484:	8082                	ret

0000000000000486 <read>:
 486:	4895                	li	a7,5
 488:	00000073          	ecall
 48c:	8082                	ret

000000000000048e <write>:
 48e:	48c1                	li	a7,16
 490:	00000073          	ecall
 494:	8082                	ret

0000000000000496 <close>:
 496:	48d5                	li	a7,21
 498:	00000073          	ecall
 49c:	8082                	ret

000000000000049e <kill>:
 49e:	4899                	li	a7,6
 4a0:	00000073          	ecall
 4a4:	8082                	ret

00000000000004a6 <exec>:
 4a6:	489d                	li	a7,7
 4a8:	00000073          	ecall
 4ac:	8082                	ret

00000000000004ae <open>:
 4ae:	48bd                	li	a7,15
 4b0:	00000073          	ecall
 4b4:	8082                	ret

00000000000004b6 <fstat>:
 4b6:	48a1                	li	a7,8
 4b8:	00000073          	ecall
 4bc:	8082                	ret

00000000000004be <mkdir>:
 4be:	48d1                	li	a7,20
 4c0:	00000073          	ecall
 4c4:	8082                	ret

00000000000004c6 <chdir>:
 4c6:	48a5                	li	a7,9
 4c8:	00000073          	ecall
 4cc:	8082                	ret

00000000000004ce <dup>:
 4ce:	48a9                	li	a7,10
 4d0:	00000073          	ecall
 4d4:	8082                	ret

00000000000004d6 <getpid>:
 4d6:	48ad                	li	a7,11
 4d8:	00000073          	ecall
 4dc:	8082                	ret

00000000000004de <sbrk>:
 4de:	48b1                	li	a7,12
 4e0:	00000073          	ecall
 4e4:	8082                	ret

00000000000004e6 <sleep>:
 4e6:	48b5                	li	a7,13
 4e8:	00000073          	ecall
 4ec:	8082                	ret

00000000000004ee <uptime>:
 4ee:	48b9                	li	a7,14
 4f0:	00000073          	ecall
 4f4:	8082                	ret

00000000000004f6 <test_proc>:
 4f6:	48d9                	li	a7,22
 4f8:	00000073          	ecall
 4fc:	8082                	ret

00000000000004fe <dev>:
 4fe:	48dd                	li	a7,23
 500:	00000073          	ecall
 504:	8082                	ret

0000000000000506 <readdir>:
 506:	48e1                	li	a7,24
 508:	00000073          	ecall
 50c:	8082                	ret

000000000000050e <getcwd>:
 50e:	48e5                	li	a7,25
 510:	00000073          	ecall
 514:	8082                	ret

0000000000000516 <remove>:
 516:	48c5                	li	a7,17
 518:	00000073          	ecall
 51c:	8082                	ret

000000000000051e <trace>:
 51e:	48c9                	li	a7,18
 520:	00000073          	ecall
 524:	8082                	ret

0000000000000526 <sysinfo>:
 526:	48cd                	li	a7,19
 528:	00000073          	ecall
 52c:	8082                	ret

000000000000052e <rename>:
 52e:	48e9                	li	a7,26
 530:	00000073          	ecall
 534:	8082                	ret

0000000000000536 <putc>:
 536:	1101                	addi	sp,sp,-32
 538:	ec06                	sd	ra,24(sp)
 53a:	e822                	sd	s0,16(sp)
 53c:	1000                	addi	s0,sp,32
 53e:	feb407a3          	sb	a1,-17(s0)
 542:	4605                	li	a2,1
 544:	fef40593          	addi	a1,s0,-17
 548:	00000097          	auipc	ra,0x0
 54c:	f46080e7          	jalr	-186(ra) # 48e <write>
 550:	60e2                	ld	ra,24(sp)
 552:	6442                	ld	s0,16(sp)
 554:	6105                	addi	sp,sp,32
 556:	8082                	ret

0000000000000558 <printint>:
 558:	7139                	addi	sp,sp,-64
 55a:	fc06                	sd	ra,56(sp)
 55c:	f822                	sd	s0,48(sp)
 55e:	f426                	sd	s1,40(sp)
 560:	f04a                	sd	s2,32(sp)
 562:	ec4e                	sd	s3,24(sp)
 564:	0080                	addi	s0,sp,64
 566:	84aa                	mv	s1,a0
 568:	c299                	beqz	a3,56e <printint+0x16>
 56a:	0805c863          	bltz	a1,5fa <printint+0xa2>
 56e:	2581                	sext.w	a1,a1
 570:	4881                	li	a7,0
 572:	fc040993          	addi	s3,s0,-64
 576:	86ce                	mv	a3,s3
 578:	4701                	li	a4,0
 57a:	2601                	sext.w	a2,a2
 57c:	00000517          	auipc	a0,0x0
 580:	4c450513          	addi	a0,a0,1220 # a40 <digits>
 584:	883a                	mv	a6,a4
 586:	2705                	addiw	a4,a4,1
 588:	02c5f7bb          	remuw	a5,a1,a2
 58c:	1782                	slli	a5,a5,0x20
 58e:	9381                	srli	a5,a5,0x20
 590:	97aa                	add	a5,a5,a0
 592:	0007c783          	lbu	a5,0(a5)
 596:	00f68023          	sb	a5,0(a3)
 59a:	0005879b          	sext.w	a5,a1
 59e:	02c5d5bb          	divuw	a1,a1,a2
 5a2:	0685                	addi	a3,a3,1
 5a4:	fec7f0e3          	bgeu	a5,a2,584 <printint+0x2c>
 5a8:	00088c63          	beqz	a7,5c0 <printint+0x68>
 5ac:	fd070793          	addi	a5,a4,-48
 5b0:	00878733          	add	a4,a5,s0
 5b4:	02d00793          	li	a5,45
 5b8:	fef70823          	sb	a5,-16(a4)
 5bc:	0028071b          	addiw	a4,a6,2
 5c0:	02e05663          	blez	a4,5ec <printint+0x94>
 5c4:	fc040913          	addi	s2,s0,-64
 5c8:	993a                	add	s2,s2,a4
 5ca:	19fd                	addi	s3,s3,-1
 5cc:	99ba                	add	s3,s3,a4
 5ce:	377d                	addiw	a4,a4,-1
 5d0:	1702                	slli	a4,a4,0x20
 5d2:	9301                	srli	a4,a4,0x20
 5d4:	40e989b3          	sub	s3,s3,a4
 5d8:	fff94583          	lbu	a1,-1(s2)
 5dc:	8526                	mv	a0,s1
 5de:	00000097          	auipc	ra,0x0
 5e2:	f58080e7          	jalr	-168(ra) # 536 <putc>
 5e6:	197d                	addi	s2,s2,-1
 5e8:	ff3918e3          	bne	s2,s3,5d8 <printint+0x80>
 5ec:	70e2                	ld	ra,56(sp)
 5ee:	7442                	ld	s0,48(sp)
 5f0:	74a2                	ld	s1,40(sp)
 5f2:	7902                	ld	s2,32(sp)
 5f4:	69e2                	ld	s3,24(sp)
 5f6:	6121                	addi	sp,sp,64
 5f8:	8082                	ret
 5fa:	40b005bb          	negw	a1,a1
 5fe:	4885                	li	a7,1
 600:	bf8d                	j	572 <printint+0x1a>

0000000000000602 <vprintf>:
 602:	715d                	addi	sp,sp,-80
 604:	e486                	sd	ra,72(sp)
 606:	e0a2                	sd	s0,64(sp)
 608:	fc26                	sd	s1,56(sp)
 60a:	f84a                	sd	s2,48(sp)
 60c:	f44e                	sd	s3,40(sp)
 60e:	f052                	sd	s4,32(sp)
 610:	ec56                	sd	s5,24(sp)
 612:	e85a                	sd	s6,16(sp)
 614:	e45e                	sd	s7,8(sp)
 616:	e062                	sd	s8,0(sp)
 618:	0880                	addi	s0,sp,80
 61a:	0005c903          	lbu	s2,0(a1)
 61e:	18090c63          	beqz	s2,7b6 <vprintf+0x1b4>
 622:	8aaa                	mv	s5,a0
 624:	8bb2                	mv	s7,a2
 626:	00158493          	addi	s1,a1,1
 62a:	4981                	li	s3,0
 62c:	02500a13          	li	s4,37
 630:	4b55                	li	s6,21
 632:	a839                	j	650 <vprintf+0x4e>
 634:	85ca                	mv	a1,s2
 636:	8556                	mv	a0,s5
 638:	00000097          	auipc	ra,0x0
 63c:	efe080e7          	jalr	-258(ra) # 536 <putc>
 640:	a019                	j	646 <vprintf+0x44>
 642:	01498d63          	beq	s3,s4,65c <vprintf+0x5a>
 646:	0485                	addi	s1,s1,1
 648:	fff4c903          	lbu	s2,-1(s1)
 64c:	16090563          	beqz	s2,7b6 <vprintf+0x1b4>
 650:	fe0999e3          	bnez	s3,642 <vprintf+0x40>
 654:	ff4910e3          	bne	s2,s4,634 <vprintf+0x32>
 658:	89d2                	mv	s3,s4
 65a:	b7f5                	j	646 <vprintf+0x44>
 65c:	13490263          	beq	s2,s4,780 <vprintf+0x17e>
 660:	f9d9079b          	addiw	a5,s2,-99
 664:	0ff7f793          	zext.b	a5,a5
 668:	12fb6563          	bltu	s6,a5,792 <vprintf+0x190>
 66c:	f9d9079b          	addiw	a5,s2,-99
 670:	0ff7f713          	zext.b	a4,a5
 674:	10eb6f63          	bltu	s6,a4,792 <vprintf+0x190>
 678:	00271793          	slli	a5,a4,0x2
 67c:	00000717          	auipc	a4,0x0
 680:	36c70713          	addi	a4,a4,876 # 9e8 <malloc+0x134>
 684:	97ba                	add	a5,a5,a4
 686:	439c                	lw	a5,0(a5)
 688:	97ba                	add	a5,a5,a4
 68a:	8782                	jr	a5
 68c:	008b8913          	addi	s2,s7,8
 690:	4685                	li	a3,1
 692:	4629                	li	a2,10
 694:	000ba583          	lw	a1,0(s7)
 698:	8556                	mv	a0,s5
 69a:	00000097          	auipc	ra,0x0
 69e:	ebe080e7          	jalr	-322(ra) # 558 <printint>
 6a2:	8bca                	mv	s7,s2
 6a4:	4981                	li	s3,0
 6a6:	b745                	j	646 <vprintf+0x44>
 6a8:	008b8913          	addi	s2,s7,8
 6ac:	4681                	li	a3,0
 6ae:	4629                	li	a2,10
 6b0:	000ba583          	lw	a1,0(s7)
 6b4:	8556                	mv	a0,s5
 6b6:	00000097          	auipc	ra,0x0
 6ba:	ea2080e7          	jalr	-350(ra) # 558 <printint>
 6be:	8bca                	mv	s7,s2
 6c0:	4981                	li	s3,0
 6c2:	b751                	j	646 <vprintf+0x44>
 6c4:	008b8913          	addi	s2,s7,8
 6c8:	4681                	li	a3,0
 6ca:	4641                	li	a2,16
 6cc:	000ba583          	lw	a1,0(s7)
 6d0:	8556                	mv	a0,s5
 6d2:	00000097          	auipc	ra,0x0
 6d6:	e86080e7          	jalr	-378(ra) # 558 <printint>
 6da:	8bca                	mv	s7,s2
 6dc:	4981                	li	s3,0
 6de:	b7a5                	j	646 <vprintf+0x44>
 6e0:	008b8c13          	addi	s8,s7,8
 6e4:	000bb983          	ld	s3,0(s7)
 6e8:	03000593          	li	a1,48
 6ec:	8556                	mv	a0,s5
 6ee:	00000097          	auipc	ra,0x0
 6f2:	e48080e7          	jalr	-440(ra) # 536 <putc>
 6f6:	07800593          	li	a1,120
 6fa:	8556                	mv	a0,s5
 6fc:	00000097          	auipc	ra,0x0
 700:	e3a080e7          	jalr	-454(ra) # 536 <putc>
 704:	4941                	li	s2,16
 706:	00000b97          	auipc	s7,0x0
 70a:	33ab8b93          	addi	s7,s7,826 # a40 <digits>
 70e:	03c9d793          	srli	a5,s3,0x3c
 712:	97de                	add	a5,a5,s7
 714:	0007c583          	lbu	a1,0(a5)
 718:	8556                	mv	a0,s5
 71a:	00000097          	auipc	ra,0x0
 71e:	e1c080e7          	jalr	-484(ra) # 536 <putc>
 722:	0992                	slli	s3,s3,0x4
 724:	397d                	addiw	s2,s2,-1
 726:	fe0914e3          	bnez	s2,70e <vprintf+0x10c>
 72a:	8be2                	mv	s7,s8
 72c:	4981                	li	s3,0
 72e:	bf21                	j	646 <vprintf+0x44>
 730:	008b8993          	addi	s3,s7,8
 734:	000bb903          	ld	s2,0(s7)
 738:	02090163          	beqz	s2,75a <vprintf+0x158>
 73c:	00094583          	lbu	a1,0(s2)
 740:	c9a5                	beqz	a1,7b0 <vprintf+0x1ae>
 742:	8556                	mv	a0,s5
 744:	00000097          	auipc	ra,0x0
 748:	df2080e7          	jalr	-526(ra) # 536 <putc>
 74c:	0905                	addi	s2,s2,1
 74e:	00094583          	lbu	a1,0(s2)
 752:	f9e5                	bnez	a1,742 <vprintf+0x140>
 754:	8bce                	mv	s7,s3
 756:	4981                	li	s3,0
 758:	b5fd                	j	646 <vprintf+0x44>
 75a:	00000917          	auipc	s2,0x0
 75e:	28690913          	addi	s2,s2,646 # 9e0 <malloc+0x12c>
 762:	02800593          	li	a1,40
 766:	bff1                	j	742 <vprintf+0x140>
 768:	008b8913          	addi	s2,s7,8
 76c:	000bc583          	lbu	a1,0(s7)
 770:	8556                	mv	a0,s5
 772:	00000097          	auipc	ra,0x0
 776:	dc4080e7          	jalr	-572(ra) # 536 <putc>
 77a:	8bca                	mv	s7,s2
 77c:	4981                	li	s3,0
 77e:	b5e1                	j	646 <vprintf+0x44>
 780:	02500593          	li	a1,37
 784:	8556                	mv	a0,s5
 786:	00000097          	auipc	ra,0x0
 78a:	db0080e7          	jalr	-592(ra) # 536 <putc>
 78e:	4981                	li	s3,0
 790:	bd5d                	j	646 <vprintf+0x44>
 792:	02500593          	li	a1,37
 796:	8556                	mv	a0,s5
 798:	00000097          	auipc	ra,0x0
 79c:	d9e080e7          	jalr	-610(ra) # 536 <putc>
 7a0:	85ca                	mv	a1,s2
 7a2:	8556                	mv	a0,s5
 7a4:	00000097          	auipc	ra,0x0
 7a8:	d92080e7          	jalr	-622(ra) # 536 <putc>
 7ac:	4981                	li	s3,0
 7ae:	bd61                	j	646 <vprintf+0x44>
 7b0:	8bce                	mv	s7,s3
 7b2:	4981                	li	s3,0
 7b4:	bd49                	j	646 <vprintf+0x44>
 7b6:	60a6                	ld	ra,72(sp)
 7b8:	6406                	ld	s0,64(sp)
 7ba:	74e2                	ld	s1,56(sp)
 7bc:	7942                	ld	s2,48(sp)
 7be:	79a2                	ld	s3,40(sp)
 7c0:	7a02                	ld	s4,32(sp)
 7c2:	6ae2                	ld	s5,24(sp)
 7c4:	6b42                	ld	s6,16(sp)
 7c6:	6ba2                	ld	s7,8(sp)
 7c8:	6c02                	ld	s8,0(sp)
 7ca:	6161                	addi	sp,sp,80
 7cc:	8082                	ret

00000000000007ce <fprintf>:
 7ce:	715d                	addi	sp,sp,-80
 7d0:	ec06                	sd	ra,24(sp)
 7d2:	e822                	sd	s0,16(sp)
 7d4:	1000                	addi	s0,sp,32
 7d6:	e010                	sd	a2,0(s0)
 7d8:	e414                	sd	a3,8(s0)
 7da:	e818                	sd	a4,16(s0)
 7dc:	ec1c                	sd	a5,24(s0)
 7de:	03043023          	sd	a6,32(s0)
 7e2:	03143423          	sd	a7,40(s0)
 7e6:	8622                	mv	a2,s0
 7e8:	fe843423          	sd	s0,-24(s0)
 7ec:	00000097          	auipc	ra,0x0
 7f0:	e16080e7          	jalr	-490(ra) # 602 <vprintf>
 7f4:	60e2                	ld	ra,24(sp)
 7f6:	6442                	ld	s0,16(sp)
 7f8:	6161                	addi	sp,sp,80
 7fa:	8082                	ret

00000000000007fc <printf>:
 7fc:	711d                	addi	sp,sp,-96
 7fe:	ec06                	sd	ra,24(sp)
 800:	e822                	sd	s0,16(sp)
 802:	1000                	addi	s0,sp,32
 804:	e40c                	sd	a1,8(s0)
 806:	e810                	sd	a2,16(s0)
 808:	ec14                	sd	a3,24(s0)
 80a:	f018                	sd	a4,32(s0)
 80c:	f41c                	sd	a5,40(s0)
 80e:	03043823          	sd	a6,48(s0)
 812:	03143c23          	sd	a7,56(s0)
 816:	00840613          	addi	a2,s0,8
 81a:	fec43423          	sd	a2,-24(s0)
 81e:	85aa                	mv	a1,a0
 820:	4505                	li	a0,1
 822:	00000097          	auipc	ra,0x0
 826:	de0080e7          	jalr	-544(ra) # 602 <vprintf>
 82a:	60e2                	ld	ra,24(sp)
 82c:	6442                	ld	s0,16(sp)
 82e:	6125                	addi	sp,sp,96
 830:	8082                	ret

0000000000000832 <free>:
 832:	1141                	addi	sp,sp,-16
 834:	e422                	sd	s0,8(sp)
 836:	0800                	addi	s0,sp,16
 838:	ff050693          	addi	a3,a0,-16
 83c:	00000797          	auipc	a5,0x0
 840:	21c7b783          	ld	a5,540(a5) # a58 <freep>
 844:	a02d                	j	86e <free+0x3c>
 846:	4618                	lw	a4,8(a2)
 848:	9f2d                	addw	a4,a4,a1
 84a:	fee52c23          	sw	a4,-8(a0)
 84e:	6398                	ld	a4,0(a5)
 850:	6310                	ld	a2,0(a4)
 852:	a83d                	j	890 <free+0x5e>
 854:	ff852703          	lw	a4,-8(a0)
 858:	9f31                	addw	a4,a4,a2
 85a:	c798                	sw	a4,8(a5)
 85c:	ff053683          	ld	a3,-16(a0)
 860:	a091                	j	8a4 <free+0x72>
 862:	6398                	ld	a4,0(a5)
 864:	00e7e463          	bltu	a5,a4,86c <free+0x3a>
 868:	00e6ea63          	bltu	a3,a4,87c <free+0x4a>
 86c:	87ba                	mv	a5,a4
 86e:	fed7fae3          	bgeu	a5,a3,862 <free+0x30>
 872:	6398                	ld	a4,0(a5)
 874:	00e6e463          	bltu	a3,a4,87c <free+0x4a>
 878:	fee7eae3          	bltu	a5,a4,86c <free+0x3a>
 87c:	ff852583          	lw	a1,-8(a0)
 880:	6390                	ld	a2,0(a5)
 882:	02059813          	slli	a6,a1,0x20
 886:	01c85713          	srli	a4,a6,0x1c
 88a:	9736                	add	a4,a4,a3
 88c:	fae60de3          	beq	a2,a4,846 <free+0x14>
 890:	fec53823          	sd	a2,-16(a0)
 894:	4790                	lw	a2,8(a5)
 896:	02061593          	slli	a1,a2,0x20
 89a:	01c5d713          	srli	a4,a1,0x1c
 89e:	973e                	add	a4,a4,a5
 8a0:	fae68ae3          	beq	a3,a4,854 <free+0x22>
 8a4:	e394                	sd	a3,0(a5)
 8a6:	00000717          	auipc	a4,0x0
 8aa:	1af73923          	sd	a5,434(a4) # a58 <freep>
 8ae:	6422                	ld	s0,8(sp)
 8b0:	0141                	addi	sp,sp,16
 8b2:	8082                	ret

00000000000008b4 <malloc>:
 8b4:	7139                	addi	sp,sp,-64
 8b6:	fc06                	sd	ra,56(sp)
 8b8:	f822                	sd	s0,48(sp)
 8ba:	f426                	sd	s1,40(sp)
 8bc:	f04a                	sd	s2,32(sp)
 8be:	ec4e                	sd	s3,24(sp)
 8c0:	e852                	sd	s4,16(sp)
 8c2:	e456                	sd	s5,8(sp)
 8c4:	e05a                	sd	s6,0(sp)
 8c6:	0080                	addi	s0,sp,64
 8c8:	02051493          	slli	s1,a0,0x20
 8cc:	9081                	srli	s1,s1,0x20
 8ce:	04bd                	addi	s1,s1,15
 8d0:	8091                	srli	s1,s1,0x4
 8d2:	0014899b          	addiw	s3,s1,1
 8d6:	0485                	addi	s1,s1,1
 8d8:	00000517          	auipc	a0,0x0
 8dc:	18053503          	ld	a0,384(a0) # a58 <freep>
 8e0:	c515                	beqz	a0,90c <malloc+0x58>
 8e2:	611c                	ld	a5,0(a0)
 8e4:	4798                	lw	a4,8(a5)
 8e6:	04977063          	bgeu	a4,s1,926 <malloc+0x72>
 8ea:	8a4e                	mv	s4,s3
 8ec:	0009871b          	sext.w	a4,s3
 8f0:	6685                	lui	a3,0x1
 8f2:	00d77363          	bgeu	a4,a3,8f8 <malloc+0x44>
 8f6:	6a05                	lui	s4,0x1
 8f8:	000a0b1b          	sext.w	s6,s4
 8fc:	004a1a1b          	slliw	s4,s4,0x4
 900:	00000917          	auipc	s2,0x0
 904:	15890913          	addi	s2,s2,344 # a58 <freep>
 908:	5afd                	li	s5,-1
 90a:	a89d                	j	980 <malloc+0xcc>
 90c:	00000717          	auipc	a4,0x0
 910:	14c70713          	addi	a4,a4,332 # a58 <freep>
 914:	00000797          	auipc	a5,0x0
 918:	14c78793          	addi	a5,a5,332 # a60 <base>
 91c:	e31c                	sd	a5,0(a4)
 91e:	e71c                	sd	a5,8(a4)
 920:	00072823          	sw	zero,16(a4)
 924:	b7d9                	j	8ea <malloc+0x36>
 926:	02e48c63          	beq	s1,a4,95e <malloc+0xaa>
 92a:	4137073b          	subw	a4,a4,s3
 92e:	c798                	sw	a4,8(a5)
 930:	02071693          	slli	a3,a4,0x20
 934:	01c6d713          	srli	a4,a3,0x1c
 938:	97ba                	add	a5,a5,a4
 93a:	0137a423          	sw	s3,8(a5)
 93e:	00000717          	auipc	a4,0x0
 942:	10a73d23          	sd	a0,282(a4) # a58 <freep>
 946:	01078513          	addi	a0,a5,16
 94a:	70e2                	ld	ra,56(sp)
 94c:	7442                	ld	s0,48(sp)
 94e:	74a2                	ld	s1,40(sp)
 950:	7902                	ld	s2,32(sp)
 952:	69e2                	ld	s3,24(sp)
 954:	6a42                	ld	s4,16(sp)
 956:	6aa2                	ld	s5,8(sp)
 958:	6b02                	ld	s6,0(sp)
 95a:	6121                	addi	sp,sp,64
 95c:	8082                	ret
 95e:	6398                	ld	a4,0(a5)
 960:	e118                	sd	a4,0(a0)
 962:	bff1                	j	93e <malloc+0x8a>
 964:	01652423          	sw	s6,8(a0)
 968:	0541                	addi	a0,a0,16
 96a:	00000097          	auipc	ra,0x0
 96e:	ec8080e7          	jalr	-312(ra) # 832 <free>
 972:	00093503          	ld	a0,0(s2)
 976:	d971                	beqz	a0,94a <malloc+0x96>
 978:	611c                	ld	a5,0(a0)
 97a:	4798                	lw	a4,8(a5)
 97c:	fa9775e3          	bgeu	a4,s1,926 <malloc+0x72>
 980:	00093703          	ld	a4,0(s2)
 984:	853e                	mv	a0,a5
 986:	fef719e3          	bne	a4,a5,978 <malloc+0xc4>
 98a:	8552                	mv	a0,s4
 98c:	00000097          	auipc	ra,0x0
 990:	b52080e7          	jalr	-1198(ra) # 4de <sbrk>
 994:	fd5518e3          	bne	a0,s5,964 <malloc+0xb0>
 998:	4501                	li	a0,0
 99a:	bf45                	j	94a <malloc+0x96>
