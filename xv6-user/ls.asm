
xv6-user/_ls:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <fmtname>:
#include "kernel/include/stat.h"
#include "xv6-user/user.h"

char*
fmtname(char *name)
{
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	ec26                	sd	s1,24(sp)
   8:	e84a                	sd	s2,16(sp)
   a:	e44e                	sd	s3,8(sp)
   c:	1800                	addi	s0,sp,48
   e:	892a                	mv	s2,a0
  static char buf[STAT_MAX_NAME+1];
  int len = strlen(name);
  10:	00000097          	auipc	ra,0x0
  14:	24c080e7          	jalr	588(ra) # 25c <strlen>
  18:	0005049b          	sext.w	s1,a0

  // Return blank-padded name.
  if(len >= STAT_MAX_NAME)
  1c:	47fd                	li	a5,31
  1e:	0097da63          	bge	a5,s1,32 <fmtname+0x32>
    return name;
  memmove(buf, name, len);
  memset(buf + len, ' ', STAT_MAX_NAME - len);
  buf[STAT_MAX_NAME] = '\0';
  return buf;
}
  22:	854a                	mv	a0,s2
  24:	70a2                	ld	ra,40(sp)
  26:	7402                	ld	s0,32(sp)
  28:	64e2                	ld	s1,24(sp)
  2a:	6942                	ld	s2,16(sp)
  2c:	69a2                	ld	s3,8(sp)
  2e:	6145                	addi	sp,sp,48
  30:	8082                	ret
  memmove(buf, name, len);
  32:	00001997          	auipc	s3,0x1
  36:	a7e98993          	addi	s3,s3,-1410 # ab0 <buf.0>
  3a:	8626                	mv	a2,s1
  3c:	85ca                	mv	a1,s2
  3e:	854e                	mv	a0,s3
  40:	00000097          	auipc	ra,0x0
  44:	3ac080e7          	jalr	940(ra) # 3ec <memmove>
  memset(buf + len, ' ', STAT_MAX_NAME - len);
  48:	02000613          	li	a2,32
  4c:	9e05                	subw	a2,a2,s1
  4e:	02000593          	li	a1,32
  52:	00998533          	add	a0,s3,s1
  56:	00000097          	auipc	ra,0x0
  5a:	230080e7          	jalr	560(ra) # 286 <memset>
  buf[STAT_MAX_NAME] = '\0';
  5e:	02098023          	sb	zero,32(s3)
  return buf;
  62:	894e                	mv	s2,s3
  64:	bf7d                	j	22 <fmtname+0x22>

0000000000000066 <ls>:

void
ls(char *path)
{
  66:	7119                	addi	sp,sp,-128
  68:	fc86                	sd	ra,120(sp)
  6a:	f8a2                	sd	s0,112(sp)
  6c:	f4a6                	sd	s1,104(sp)
  6e:	f0ca                	sd	s2,96(sp)
  70:	ecce                	sd	s3,88(sp)
  72:	e8d2                	sd	s4,80(sp)
  74:	0100                	addi	s0,sp,128
  76:	892a                	mv	s2,a0
  int fd;
  struct stat st;
  char *types[] = {
  78:	f8043023          	sd	zero,-128(s0)
  7c:	00001797          	auipc	a5,0x1
  80:	95478793          	addi	a5,a5,-1708 # 9d0 <malloc+0xec>
  84:	f8f43423          	sd	a5,-120(s0)
  88:	00001797          	auipc	a5,0x1
  8c:	95078793          	addi	a5,a5,-1712 # 9d8 <malloc+0xf4>
  90:	f8f43823          	sd	a5,-112(s0)
    [T_DIR]   "DIR ",
    [T_FILE]  "FILE",
  };

  if((fd = open(path, 0)) < 0){
  94:	4581                	li	a1,0
  96:	00000097          	auipc	ra,0x0
  9a:	448080e7          	jalr	1096(ra) # 4de <open>
  9e:	02054863          	bltz	a0,ce <ls+0x68>
  a2:	84aa                	mv	s1,a0
    fprintf(2, "ls: cannot open %s\n", path);
    return;
  }

  if(fstat(fd, &st) < 0){
  a4:	f9840593          	addi	a1,s0,-104
  a8:	00000097          	auipc	ra,0x0
  ac:	43e080e7          	jalr	1086(ra) # 4e6 <fstat>
  b0:	02054a63          	bltz	a0,e4 <ls+0x7e>
    fprintf(2, "ls: cannot stat %s\n", path);
    close(fd);
    return;
  }

  if (st.type == T_DIR){
  b4:	fc041703          	lh	a4,-64(s0)
  b8:	4785                	li	a5,1
  ba:	08f71f63          	bne	a4,a5,158 <ls+0xf2>
    while(readdir(fd, &st) == 1){
  be:	f9840913          	addi	s2,s0,-104
  c2:	4985                	li	s3,1
      printf("%s %s\t%d\n", fmtname(st.name), types[st.type], st.size);
  c4:	00001a17          	auipc	s4,0x1
  c8:	94ca0a13          	addi	s4,s4,-1716 # a10 <malloc+0x12c>
  cc:	a08d                	j	12e <ls+0xc8>
    fprintf(2, "ls: cannot open %s\n", path);
  ce:	864a                	mv	a2,s2
  d0:	00001597          	auipc	a1,0x1
  d4:	91058593          	addi	a1,a1,-1776 # 9e0 <malloc+0xfc>
  d8:	4509                	li	a0,2
  da:	00000097          	auipc	ra,0x0
  de:	724080e7          	jalr	1828(ra) # 7fe <fprintf>
    return;
  e2:	a09d                	j	148 <ls+0xe2>
    fprintf(2, "ls: cannot stat %s\n", path);
  e4:	864a                	mv	a2,s2
  e6:	00001597          	auipc	a1,0x1
  ea:	91258593          	addi	a1,a1,-1774 # 9f8 <malloc+0x114>
  ee:	4509                	li	a0,2
  f0:	00000097          	auipc	ra,0x0
  f4:	70e080e7          	jalr	1806(ra) # 7fe <fprintf>
    close(fd);
  f8:	8526                	mv	a0,s1
  fa:	00000097          	auipc	ra,0x0
  fe:	3cc080e7          	jalr	972(ra) # 4c6 <close>
    return;
 102:	a099                	j	148 <ls+0xe2>
      printf("%s %s\t%d\n", fmtname(st.name), types[st.type], st.size);
 104:	854a                	mv	a0,s2
 106:	00000097          	auipc	ra,0x0
 10a:	efa080e7          	jalr	-262(ra) # 0 <fmtname>
 10e:	85aa                	mv	a1,a0
 110:	fc041783          	lh	a5,-64(s0)
 114:	078e                	slli	a5,a5,0x3
 116:	fd078793          	addi	a5,a5,-48
 11a:	97a2                	add	a5,a5,s0
 11c:	fc843683          	ld	a3,-56(s0)
 120:	fb07b603          	ld	a2,-80(a5)
 124:	8552                	mv	a0,s4
 126:	00000097          	auipc	ra,0x0
 12a:	706080e7          	jalr	1798(ra) # 82c <printf>
    while(readdir(fd, &st) == 1){
 12e:	85ca                	mv	a1,s2
 130:	8526                	mv	a0,s1
 132:	00000097          	auipc	ra,0x0
 136:	404080e7          	jalr	1028(ra) # 536 <readdir>
 13a:	fd3505e3          	beq	a0,s3,104 <ls+0x9e>
    }
  } else {
    printf("%s %s\t%l\n", fmtname(st.name), types[st.type], st.size);
  }
  close(fd);
 13e:	8526                	mv	a0,s1
 140:	00000097          	auipc	ra,0x0
 144:	386080e7          	jalr	902(ra) # 4c6 <close>
}
 148:	70e6                	ld	ra,120(sp)
 14a:	7446                	ld	s0,112(sp)
 14c:	74a6                	ld	s1,104(sp)
 14e:	7906                	ld	s2,96(sp)
 150:	69e6                	ld	s3,88(sp)
 152:	6a46                	ld	s4,80(sp)
 154:	6109                	addi	sp,sp,128
 156:	8082                	ret
    printf("%s %s\t%l\n", fmtname(st.name), types[st.type], st.size);
 158:	f9840513          	addi	a0,s0,-104
 15c:	00000097          	auipc	ra,0x0
 160:	ea4080e7          	jalr	-348(ra) # 0 <fmtname>
 164:	85aa                	mv	a1,a0
 166:	fc041783          	lh	a5,-64(s0)
 16a:	078e                	slli	a5,a5,0x3
 16c:	fd078793          	addi	a5,a5,-48
 170:	97a2                	add	a5,a5,s0
 172:	fc843683          	ld	a3,-56(s0)
 176:	fb07b603          	ld	a2,-80(a5)
 17a:	00001517          	auipc	a0,0x1
 17e:	8a650513          	addi	a0,a0,-1882 # a20 <malloc+0x13c>
 182:	00000097          	auipc	ra,0x0
 186:	6aa080e7          	jalr	1706(ra) # 82c <printf>
 18a:	bf55                	j	13e <ls+0xd8>

000000000000018c <main>:

int
main(int argc, char *argv[])
{
 18c:	1101                	addi	sp,sp,-32
 18e:	ec06                	sd	ra,24(sp)
 190:	e822                	sd	s0,16(sp)
 192:	e426                	sd	s1,8(sp)
 194:	e04a                	sd	s2,0(sp)
 196:	1000                	addi	s0,sp,32
  int i;

  if(argc < 2){
 198:	4785                	li	a5,1
 19a:	02a7d963          	bge	a5,a0,1cc <main+0x40>
 19e:	00858493          	addi	s1,a1,8
 1a2:	ffe5091b          	addiw	s2,a0,-2
 1a6:	02091793          	slli	a5,s2,0x20
 1aa:	01d7d913          	srli	s2,a5,0x1d
 1ae:	05c1                	addi	a1,a1,16
 1b0:	992e                	add	s2,s2,a1
    ls(".");
    exit(0);
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
 1b2:	6088                	ld	a0,0(s1)
 1b4:	00000097          	auipc	ra,0x0
 1b8:	eb2080e7          	jalr	-334(ra) # 66 <ls>
  for(i=1; i<argc; i++)
 1bc:	04a1                	addi	s1,s1,8
 1be:	ff249ae3          	bne	s1,s2,1b2 <main+0x26>
  exit(0);
 1c2:	4501                	li	a0,0
 1c4:	00000097          	auipc	ra,0x0
 1c8:	2da080e7          	jalr	730(ra) # 49e <exit>
    ls(".");
 1cc:	00001517          	auipc	a0,0x1
 1d0:	86450513          	addi	a0,a0,-1948 # a30 <malloc+0x14c>
 1d4:	00000097          	auipc	ra,0x0
 1d8:	e92080e7          	jalr	-366(ra) # 66 <ls>
    exit(0);
 1dc:	4501                	li	a0,0
 1de:	00000097          	auipc	ra,0x0
 1e2:	2c0080e7          	jalr	704(ra) # 49e <exit>

00000000000001e6 <strcpy>:
 1e6:	1141                	addi	sp,sp,-16
 1e8:	e422                	sd	s0,8(sp)
 1ea:	0800                	addi	s0,sp,16
 1ec:	87aa                	mv	a5,a0
 1ee:	0585                	addi	a1,a1,1
 1f0:	0785                	addi	a5,a5,1
 1f2:	fff5c703          	lbu	a4,-1(a1)
 1f6:	fee78fa3          	sb	a4,-1(a5)
 1fa:	fb75                	bnez	a4,1ee <strcpy+0x8>
 1fc:	6422                	ld	s0,8(sp)
 1fe:	0141                	addi	sp,sp,16
 200:	8082                	ret

0000000000000202 <strcat>:
 202:	1141                	addi	sp,sp,-16
 204:	e422                	sd	s0,8(sp)
 206:	0800                	addi	s0,sp,16
 208:	00054783          	lbu	a5,0(a0)
 20c:	c385                	beqz	a5,22c <strcat+0x2a>
 20e:	87aa                	mv	a5,a0
 210:	0785                	addi	a5,a5,1
 212:	0007c703          	lbu	a4,0(a5)
 216:	ff6d                	bnez	a4,210 <strcat+0xe>
 218:	0585                	addi	a1,a1,1
 21a:	0785                	addi	a5,a5,1
 21c:	fff5c703          	lbu	a4,-1(a1)
 220:	fee78fa3          	sb	a4,-1(a5)
 224:	fb75                	bnez	a4,218 <strcat+0x16>
 226:	6422                	ld	s0,8(sp)
 228:	0141                	addi	sp,sp,16
 22a:	8082                	ret
 22c:	87aa                	mv	a5,a0
 22e:	b7ed                	j	218 <strcat+0x16>

0000000000000230 <strcmp>:
 230:	1141                	addi	sp,sp,-16
 232:	e422                	sd	s0,8(sp)
 234:	0800                	addi	s0,sp,16
 236:	00054783          	lbu	a5,0(a0)
 23a:	cb91                	beqz	a5,24e <strcmp+0x1e>
 23c:	0005c703          	lbu	a4,0(a1)
 240:	00f71763          	bne	a4,a5,24e <strcmp+0x1e>
 244:	0505                	addi	a0,a0,1
 246:	0585                	addi	a1,a1,1
 248:	00054783          	lbu	a5,0(a0)
 24c:	fbe5                	bnez	a5,23c <strcmp+0xc>
 24e:	0005c503          	lbu	a0,0(a1)
 252:	40a7853b          	subw	a0,a5,a0
 256:	6422                	ld	s0,8(sp)
 258:	0141                	addi	sp,sp,16
 25a:	8082                	ret

000000000000025c <strlen>:
 25c:	1141                	addi	sp,sp,-16
 25e:	e422                	sd	s0,8(sp)
 260:	0800                	addi	s0,sp,16
 262:	00054783          	lbu	a5,0(a0)
 266:	cf91                	beqz	a5,282 <strlen+0x26>
 268:	0505                	addi	a0,a0,1
 26a:	87aa                	mv	a5,a0
 26c:	86be                	mv	a3,a5
 26e:	0785                	addi	a5,a5,1
 270:	fff7c703          	lbu	a4,-1(a5)
 274:	ff65                	bnez	a4,26c <strlen+0x10>
 276:	40a6853b          	subw	a0,a3,a0
 27a:	2505                	addiw	a0,a0,1
 27c:	6422                	ld	s0,8(sp)
 27e:	0141                	addi	sp,sp,16
 280:	8082                	ret
 282:	4501                	li	a0,0
 284:	bfe5                	j	27c <strlen+0x20>

0000000000000286 <memset>:
 286:	1141                	addi	sp,sp,-16
 288:	e422                	sd	s0,8(sp)
 28a:	0800                	addi	s0,sp,16
 28c:	ca19                	beqz	a2,2a2 <memset+0x1c>
 28e:	87aa                	mv	a5,a0
 290:	1602                	slli	a2,a2,0x20
 292:	9201                	srli	a2,a2,0x20
 294:	00a60733          	add	a4,a2,a0
 298:	00b78023          	sb	a1,0(a5)
 29c:	0785                	addi	a5,a5,1
 29e:	fee79de3          	bne	a5,a4,298 <memset+0x12>
 2a2:	6422                	ld	s0,8(sp)
 2a4:	0141                	addi	sp,sp,16
 2a6:	8082                	ret

00000000000002a8 <strchr>:
 2a8:	1141                	addi	sp,sp,-16
 2aa:	e422                	sd	s0,8(sp)
 2ac:	0800                	addi	s0,sp,16
 2ae:	00054783          	lbu	a5,0(a0)
 2b2:	cb99                	beqz	a5,2c8 <strchr+0x20>
 2b4:	00f58763          	beq	a1,a5,2c2 <strchr+0x1a>
 2b8:	0505                	addi	a0,a0,1
 2ba:	00054783          	lbu	a5,0(a0)
 2be:	fbfd                	bnez	a5,2b4 <strchr+0xc>
 2c0:	4501                	li	a0,0
 2c2:	6422                	ld	s0,8(sp)
 2c4:	0141                	addi	sp,sp,16
 2c6:	8082                	ret
 2c8:	4501                	li	a0,0
 2ca:	bfe5                	j	2c2 <strchr+0x1a>

00000000000002cc <gets>:
 2cc:	711d                	addi	sp,sp,-96
 2ce:	ec86                	sd	ra,88(sp)
 2d0:	e8a2                	sd	s0,80(sp)
 2d2:	e4a6                	sd	s1,72(sp)
 2d4:	e0ca                	sd	s2,64(sp)
 2d6:	fc4e                	sd	s3,56(sp)
 2d8:	f852                	sd	s4,48(sp)
 2da:	f456                	sd	s5,40(sp)
 2dc:	f05a                	sd	s6,32(sp)
 2de:	ec5e                	sd	s7,24(sp)
 2e0:	e862                	sd	s8,16(sp)
 2e2:	1080                	addi	s0,sp,96
 2e4:	8baa                	mv	s7,a0
 2e6:	8a2e                	mv	s4,a1
 2e8:	892a                	mv	s2,a0
 2ea:	4481                	li	s1,0
 2ec:	faf40a93          	addi	s5,s0,-81
 2f0:	4b29                	li	s6,10
 2f2:	4c35                	li	s8,13
 2f4:	89a6                	mv	s3,s1
 2f6:	2485                	addiw	s1,s1,1
 2f8:	0344d763          	bge	s1,s4,326 <gets+0x5a>
 2fc:	4605                	li	a2,1
 2fe:	85d6                	mv	a1,s5
 300:	4501                	li	a0,0
 302:	00000097          	auipc	ra,0x0
 306:	1b4080e7          	jalr	436(ra) # 4b6 <read>
 30a:	00a05e63          	blez	a0,326 <gets+0x5a>
 30e:	faf44783          	lbu	a5,-81(s0)
 312:	00f90023          	sb	a5,0(s2)
 316:	01678763          	beq	a5,s6,324 <gets+0x58>
 31a:	0905                	addi	s2,s2,1
 31c:	fd879ce3          	bne	a5,s8,2f4 <gets+0x28>
 320:	89a6                	mv	s3,s1
 322:	a011                	j	326 <gets+0x5a>
 324:	89a6                	mv	s3,s1
 326:	99de                	add	s3,s3,s7
 328:	00098023          	sb	zero,0(s3)
 32c:	855e                	mv	a0,s7
 32e:	60e6                	ld	ra,88(sp)
 330:	6446                	ld	s0,80(sp)
 332:	64a6                	ld	s1,72(sp)
 334:	6906                	ld	s2,64(sp)
 336:	79e2                	ld	s3,56(sp)
 338:	7a42                	ld	s4,48(sp)
 33a:	7aa2                	ld	s5,40(sp)
 33c:	7b02                	ld	s6,32(sp)
 33e:	6be2                	ld	s7,24(sp)
 340:	6c42                	ld	s8,16(sp)
 342:	6125                	addi	sp,sp,96
 344:	8082                	ret

0000000000000346 <stat>:
 346:	1101                	addi	sp,sp,-32
 348:	ec06                	sd	ra,24(sp)
 34a:	e822                	sd	s0,16(sp)
 34c:	e426                	sd	s1,8(sp)
 34e:	e04a                	sd	s2,0(sp)
 350:	1000                	addi	s0,sp,32
 352:	892e                	mv	s2,a1
 354:	4581                	li	a1,0
 356:	00000097          	auipc	ra,0x0
 35a:	188080e7          	jalr	392(ra) # 4de <open>
 35e:	02054563          	bltz	a0,388 <stat+0x42>
 362:	84aa                	mv	s1,a0
 364:	85ca                	mv	a1,s2
 366:	00000097          	auipc	ra,0x0
 36a:	180080e7          	jalr	384(ra) # 4e6 <fstat>
 36e:	892a                	mv	s2,a0
 370:	8526                	mv	a0,s1
 372:	00000097          	auipc	ra,0x0
 376:	154080e7          	jalr	340(ra) # 4c6 <close>
 37a:	854a                	mv	a0,s2
 37c:	60e2                	ld	ra,24(sp)
 37e:	6442                	ld	s0,16(sp)
 380:	64a2                	ld	s1,8(sp)
 382:	6902                	ld	s2,0(sp)
 384:	6105                	addi	sp,sp,32
 386:	8082                	ret
 388:	597d                	li	s2,-1
 38a:	bfc5                	j	37a <stat+0x34>

000000000000038c <atoi>:
 38c:	1141                	addi	sp,sp,-16
 38e:	e422                	sd	s0,8(sp)
 390:	0800                	addi	s0,sp,16
 392:	00054703          	lbu	a4,0(a0)
 396:	02d00793          	li	a5,45
 39a:	4585                	li	a1,1
 39c:	04f70363          	beq	a4,a5,3e2 <atoi+0x56>
 3a0:	00054703          	lbu	a4,0(a0)
 3a4:	fd07079b          	addiw	a5,a4,-48
 3a8:	0ff7f793          	zext.b	a5,a5
 3ac:	46a5                	li	a3,9
 3ae:	02f6ed63          	bltu	a3,a5,3e8 <atoi+0x5c>
 3b2:	4681                	li	a3,0
 3b4:	4625                	li	a2,9
 3b6:	0505                	addi	a0,a0,1
 3b8:	0026979b          	slliw	a5,a3,0x2
 3bc:	9fb5                	addw	a5,a5,a3
 3be:	0017979b          	slliw	a5,a5,0x1
 3c2:	9fb9                	addw	a5,a5,a4
 3c4:	fd07869b          	addiw	a3,a5,-48
 3c8:	00054703          	lbu	a4,0(a0)
 3cc:	fd07079b          	addiw	a5,a4,-48
 3d0:	0ff7f793          	zext.b	a5,a5
 3d4:	fef671e3          	bgeu	a2,a5,3b6 <atoi+0x2a>
 3d8:	02d5853b          	mulw	a0,a1,a3
 3dc:	6422                	ld	s0,8(sp)
 3de:	0141                	addi	sp,sp,16
 3e0:	8082                	ret
 3e2:	0505                	addi	a0,a0,1
 3e4:	55fd                	li	a1,-1
 3e6:	bf6d                	j	3a0 <atoi+0x14>
 3e8:	4681                	li	a3,0
 3ea:	b7fd                	j	3d8 <atoi+0x4c>

00000000000003ec <memmove>:
 3ec:	1141                	addi	sp,sp,-16
 3ee:	e422                	sd	s0,8(sp)
 3f0:	0800                	addi	s0,sp,16
 3f2:	02b57463          	bgeu	a0,a1,41a <memmove+0x2e>
 3f6:	00c05f63          	blez	a2,414 <memmove+0x28>
 3fa:	1602                	slli	a2,a2,0x20
 3fc:	9201                	srli	a2,a2,0x20
 3fe:	00c507b3          	add	a5,a0,a2
 402:	872a                	mv	a4,a0
 404:	0585                	addi	a1,a1,1
 406:	0705                	addi	a4,a4,1
 408:	fff5c683          	lbu	a3,-1(a1)
 40c:	fed70fa3          	sb	a3,-1(a4)
 410:	fee79ae3          	bne	a5,a4,404 <memmove+0x18>
 414:	6422                	ld	s0,8(sp)
 416:	0141                	addi	sp,sp,16
 418:	8082                	ret
 41a:	00c50733          	add	a4,a0,a2
 41e:	95b2                	add	a1,a1,a2
 420:	fec05ae3          	blez	a2,414 <memmove+0x28>
 424:	fff6079b          	addiw	a5,a2,-1
 428:	1782                	slli	a5,a5,0x20
 42a:	9381                	srli	a5,a5,0x20
 42c:	fff7c793          	not	a5,a5
 430:	97ba                	add	a5,a5,a4
 432:	15fd                	addi	a1,a1,-1
 434:	177d                	addi	a4,a4,-1
 436:	0005c683          	lbu	a3,0(a1)
 43a:	00d70023          	sb	a3,0(a4)
 43e:	fee79ae3          	bne	a5,a4,432 <memmove+0x46>
 442:	bfc9                	j	414 <memmove+0x28>

0000000000000444 <memcmp>:
 444:	1141                	addi	sp,sp,-16
 446:	e422                	sd	s0,8(sp)
 448:	0800                	addi	s0,sp,16
 44a:	ca05                	beqz	a2,47a <memcmp+0x36>
 44c:	fff6069b          	addiw	a3,a2,-1
 450:	1682                	slli	a3,a3,0x20
 452:	9281                	srli	a3,a3,0x20
 454:	0685                	addi	a3,a3,1
 456:	96aa                	add	a3,a3,a0
 458:	00054783          	lbu	a5,0(a0)
 45c:	0005c703          	lbu	a4,0(a1)
 460:	00e79863          	bne	a5,a4,470 <memcmp+0x2c>
 464:	0505                	addi	a0,a0,1
 466:	0585                	addi	a1,a1,1
 468:	fed518e3          	bne	a0,a3,458 <memcmp+0x14>
 46c:	4501                	li	a0,0
 46e:	a019                	j	474 <memcmp+0x30>
 470:	40e7853b          	subw	a0,a5,a4
 474:	6422                	ld	s0,8(sp)
 476:	0141                	addi	sp,sp,16
 478:	8082                	ret
 47a:	4501                	li	a0,0
 47c:	bfe5                	j	474 <memcmp+0x30>

000000000000047e <memcpy>:
 47e:	1141                	addi	sp,sp,-16
 480:	e406                	sd	ra,8(sp)
 482:	e022                	sd	s0,0(sp)
 484:	0800                	addi	s0,sp,16
 486:	00000097          	auipc	ra,0x0
 48a:	f66080e7          	jalr	-154(ra) # 3ec <memmove>
 48e:	60a2                	ld	ra,8(sp)
 490:	6402                	ld	s0,0(sp)
 492:	0141                	addi	sp,sp,16
 494:	8082                	ret

0000000000000496 <fork>:
 496:	4885                	li	a7,1
 498:	00000073          	ecall
 49c:	8082                	ret

000000000000049e <exit>:
 49e:	4889                	li	a7,2
 4a0:	00000073          	ecall
 4a4:	8082                	ret

00000000000004a6 <wait>:
 4a6:	488d                	li	a7,3
 4a8:	00000073          	ecall
 4ac:	8082                	ret

00000000000004ae <pipe>:
 4ae:	4891                	li	a7,4
 4b0:	00000073          	ecall
 4b4:	8082                	ret

00000000000004b6 <read>:
 4b6:	4895                	li	a7,5
 4b8:	00000073          	ecall
 4bc:	8082                	ret

00000000000004be <write>:
 4be:	48c1                	li	a7,16
 4c0:	00000073          	ecall
 4c4:	8082                	ret

00000000000004c6 <close>:
 4c6:	48d5                	li	a7,21
 4c8:	00000073          	ecall
 4cc:	8082                	ret

00000000000004ce <kill>:
 4ce:	4899                	li	a7,6
 4d0:	00000073          	ecall
 4d4:	8082                	ret

00000000000004d6 <exec>:
 4d6:	489d                	li	a7,7
 4d8:	00000073          	ecall
 4dc:	8082                	ret

00000000000004de <open>:
 4de:	48bd                	li	a7,15
 4e0:	00000073          	ecall
 4e4:	8082                	ret

00000000000004e6 <fstat>:
 4e6:	48a1                	li	a7,8
 4e8:	00000073          	ecall
 4ec:	8082                	ret

00000000000004ee <mkdir>:
 4ee:	48d1                	li	a7,20
 4f0:	00000073          	ecall
 4f4:	8082                	ret

00000000000004f6 <chdir>:
 4f6:	48a5                	li	a7,9
 4f8:	00000073          	ecall
 4fc:	8082                	ret

00000000000004fe <dup>:
 4fe:	48a9                	li	a7,10
 500:	00000073          	ecall
 504:	8082                	ret

0000000000000506 <getpid>:
 506:	48ad                	li	a7,11
 508:	00000073          	ecall
 50c:	8082                	ret

000000000000050e <sbrk>:
 50e:	48b1                	li	a7,12
 510:	00000073          	ecall
 514:	8082                	ret

0000000000000516 <sleep>:
 516:	48b5                	li	a7,13
 518:	00000073          	ecall
 51c:	8082                	ret

000000000000051e <uptime>:
 51e:	48b9                	li	a7,14
 520:	00000073          	ecall
 524:	8082                	ret

0000000000000526 <test_proc>:
 526:	48d9                	li	a7,22
 528:	00000073          	ecall
 52c:	8082                	ret

000000000000052e <dev>:
 52e:	48dd                	li	a7,23
 530:	00000073          	ecall
 534:	8082                	ret

0000000000000536 <readdir>:
 536:	48e1                	li	a7,24
 538:	00000073          	ecall
 53c:	8082                	ret

000000000000053e <getcwd>:
 53e:	48e5                	li	a7,25
 540:	00000073          	ecall
 544:	8082                	ret

0000000000000546 <remove>:
 546:	48c5                	li	a7,17
 548:	00000073          	ecall
 54c:	8082                	ret

000000000000054e <trace>:
 54e:	48c9                	li	a7,18
 550:	00000073          	ecall
 554:	8082                	ret

0000000000000556 <sysinfo>:
 556:	48cd                	li	a7,19
 558:	00000073          	ecall
 55c:	8082                	ret

000000000000055e <rename>:
 55e:	48e9                	li	a7,26
 560:	00000073          	ecall
 564:	8082                	ret

0000000000000566 <putc>:
 566:	1101                	addi	sp,sp,-32
 568:	ec06                	sd	ra,24(sp)
 56a:	e822                	sd	s0,16(sp)
 56c:	1000                	addi	s0,sp,32
 56e:	feb407a3          	sb	a1,-17(s0)
 572:	4605                	li	a2,1
 574:	fef40593          	addi	a1,s0,-17
 578:	00000097          	auipc	ra,0x0
 57c:	f46080e7          	jalr	-186(ra) # 4be <write>
 580:	60e2                	ld	ra,24(sp)
 582:	6442                	ld	s0,16(sp)
 584:	6105                	addi	sp,sp,32
 586:	8082                	ret

0000000000000588 <printint>:
 588:	7139                	addi	sp,sp,-64
 58a:	fc06                	sd	ra,56(sp)
 58c:	f822                	sd	s0,48(sp)
 58e:	f426                	sd	s1,40(sp)
 590:	f04a                	sd	s2,32(sp)
 592:	ec4e                	sd	s3,24(sp)
 594:	0080                	addi	s0,sp,64
 596:	84aa                	mv	s1,a0
 598:	c299                	beqz	a3,59e <printint+0x16>
 59a:	0805c863          	bltz	a1,62a <printint+0xa2>
 59e:	2581                	sext.w	a1,a1
 5a0:	4881                	li	a7,0
 5a2:	fc040993          	addi	s3,s0,-64
 5a6:	86ce                	mv	a3,s3
 5a8:	4701                	li	a4,0
 5aa:	2601                	sext.w	a2,a2
 5ac:	00000517          	auipc	a0,0x0
 5b0:	4ec50513          	addi	a0,a0,1260 # a98 <digits>
 5b4:	883a                	mv	a6,a4
 5b6:	2705                	addiw	a4,a4,1
 5b8:	02c5f7bb          	remuw	a5,a1,a2
 5bc:	1782                	slli	a5,a5,0x20
 5be:	9381                	srli	a5,a5,0x20
 5c0:	97aa                	add	a5,a5,a0
 5c2:	0007c783          	lbu	a5,0(a5)
 5c6:	00f68023          	sb	a5,0(a3)
 5ca:	0005879b          	sext.w	a5,a1
 5ce:	02c5d5bb          	divuw	a1,a1,a2
 5d2:	0685                	addi	a3,a3,1
 5d4:	fec7f0e3          	bgeu	a5,a2,5b4 <printint+0x2c>
 5d8:	00088c63          	beqz	a7,5f0 <printint+0x68>
 5dc:	fd070793          	addi	a5,a4,-48
 5e0:	00878733          	add	a4,a5,s0
 5e4:	02d00793          	li	a5,45
 5e8:	fef70823          	sb	a5,-16(a4)
 5ec:	0028071b          	addiw	a4,a6,2
 5f0:	02e05663          	blez	a4,61c <printint+0x94>
 5f4:	fc040913          	addi	s2,s0,-64
 5f8:	993a                	add	s2,s2,a4
 5fa:	19fd                	addi	s3,s3,-1
 5fc:	99ba                	add	s3,s3,a4
 5fe:	377d                	addiw	a4,a4,-1
 600:	1702                	slli	a4,a4,0x20
 602:	9301                	srli	a4,a4,0x20
 604:	40e989b3          	sub	s3,s3,a4
 608:	fff94583          	lbu	a1,-1(s2)
 60c:	8526                	mv	a0,s1
 60e:	00000097          	auipc	ra,0x0
 612:	f58080e7          	jalr	-168(ra) # 566 <putc>
 616:	197d                	addi	s2,s2,-1
 618:	ff3918e3          	bne	s2,s3,608 <printint+0x80>
 61c:	70e2                	ld	ra,56(sp)
 61e:	7442                	ld	s0,48(sp)
 620:	74a2                	ld	s1,40(sp)
 622:	7902                	ld	s2,32(sp)
 624:	69e2                	ld	s3,24(sp)
 626:	6121                	addi	sp,sp,64
 628:	8082                	ret
 62a:	40b005bb          	negw	a1,a1
 62e:	4885                	li	a7,1
 630:	bf8d                	j	5a2 <printint+0x1a>

0000000000000632 <vprintf>:
 632:	715d                	addi	sp,sp,-80
 634:	e486                	sd	ra,72(sp)
 636:	e0a2                	sd	s0,64(sp)
 638:	fc26                	sd	s1,56(sp)
 63a:	f84a                	sd	s2,48(sp)
 63c:	f44e                	sd	s3,40(sp)
 63e:	f052                	sd	s4,32(sp)
 640:	ec56                	sd	s5,24(sp)
 642:	e85a                	sd	s6,16(sp)
 644:	e45e                	sd	s7,8(sp)
 646:	e062                	sd	s8,0(sp)
 648:	0880                	addi	s0,sp,80
 64a:	0005c903          	lbu	s2,0(a1)
 64e:	18090c63          	beqz	s2,7e6 <vprintf+0x1b4>
 652:	8aaa                	mv	s5,a0
 654:	8bb2                	mv	s7,a2
 656:	00158493          	addi	s1,a1,1
 65a:	4981                	li	s3,0
 65c:	02500a13          	li	s4,37
 660:	4b55                	li	s6,21
 662:	a839                	j	680 <vprintf+0x4e>
 664:	85ca                	mv	a1,s2
 666:	8556                	mv	a0,s5
 668:	00000097          	auipc	ra,0x0
 66c:	efe080e7          	jalr	-258(ra) # 566 <putc>
 670:	a019                	j	676 <vprintf+0x44>
 672:	01498d63          	beq	s3,s4,68c <vprintf+0x5a>
 676:	0485                	addi	s1,s1,1
 678:	fff4c903          	lbu	s2,-1(s1)
 67c:	16090563          	beqz	s2,7e6 <vprintf+0x1b4>
 680:	fe0999e3          	bnez	s3,672 <vprintf+0x40>
 684:	ff4910e3          	bne	s2,s4,664 <vprintf+0x32>
 688:	89d2                	mv	s3,s4
 68a:	b7f5                	j	676 <vprintf+0x44>
 68c:	13490263          	beq	s2,s4,7b0 <vprintf+0x17e>
 690:	f9d9079b          	addiw	a5,s2,-99
 694:	0ff7f793          	zext.b	a5,a5
 698:	12fb6563          	bltu	s6,a5,7c2 <vprintf+0x190>
 69c:	f9d9079b          	addiw	a5,s2,-99
 6a0:	0ff7f713          	zext.b	a4,a5
 6a4:	10eb6f63          	bltu	s6,a4,7c2 <vprintf+0x190>
 6a8:	00271793          	slli	a5,a4,0x2
 6ac:	00000717          	auipc	a4,0x0
 6b0:	39470713          	addi	a4,a4,916 # a40 <malloc+0x15c>
 6b4:	97ba                	add	a5,a5,a4
 6b6:	439c                	lw	a5,0(a5)
 6b8:	97ba                	add	a5,a5,a4
 6ba:	8782                	jr	a5
 6bc:	008b8913          	addi	s2,s7,8
 6c0:	4685                	li	a3,1
 6c2:	4629                	li	a2,10
 6c4:	000ba583          	lw	a1,0(s7)
 6c8:	8556                	mv	a0,s5
 6ca:	00000097          	auipc	ra,0x0
 6ce:	ebe080e7          	jalr	-322(ra) # 588 <printint>
 6d2:	8bca                	mv	s7,s2
 6d4:	4981                	li	s3,0
 6d6:	b745                	j	676 <vprintf+0x44>
 6d8:	008b8913          	addi	s2,s7,8
 6dc:	4681                	li	a3,0
 6de:	4629                	li	a2,10
 6e0:	000ba583          	lw	a1,0(s7)
 6e4:	8556                	mv	a0,s5
 6e6:	00000097          	auipc	ra,0x0
 6ea:	ea2080e7          	jalr	-350(ra) # 588 <printint>
 6ee:	8bca                	mv	s7,s2
 6f0:	4981                	li	s3,0
 6f2:	b751                	j	676 <vprintf+0x44>
 6f4:	008b8913          	addi	s2,s7,8
 6f8:	4681                	li	a3,0
 6fa:	4641                	li	a2,16
 6fc:	000ba583          	lw	a1,0(s7)
 700:	8556                	mv	a0,s5
 702:	00000097          	auipc	ra,0x0
 706:	e86080e7          	jalr	-378(ra) # 588 <printint>
 70a:	8bca                	mv	s7,s2
 70c:	4981                	li	s3,0
 70e:	b7a5                	j	676 <vprintf+0x44>
 710:	008b8c13          	addi	s8,s7,8
 714:	000bb983          	ld	s3,0(s7)
 718:	03000593          	li	a1,48
 71c:	8556                	mv	a0,s5
 71e:	00000097          	auipc	ra,0x0
 722:	e48080e7          	jalr	-440(ra) # 566 <putc>
 726:	07800593          	li	a1,120
 72a:	8556                	mv	a0,s5
 72c:	00000097          	auipc	ra,0x0
 730:	e3a080e7          	jalr	-454(ra) # 566 <putc>
 734:	4941                	li	s2,16
 736:	00000b97          	auipc	s7,0x0
 73a:	362b8b93          	addi	s7,s7,866 # a98 <digits>
 73e:	03c9d793          	srli	a5,s3,0x3c
 742:	97de                	add	a5,a5,s7
 744:	0007c583          	lbu	a1,0(a5)
 748:	8556                	mv	a0,s5
 74a:	00000097          	auipc	ra,0x0
 74e:	e1c080e7          	jalr	-484(ra) # 566 <putc>
 752:	0992                	slli	s3,s3,0x4
 754:	397d                	addiw	s2,s2,-1
 756:	fe0914e3          	bnez	s2,73e <vprintf+0x10c>
 75a:	8be2                	mv	s7,s8
 75c:	4981                	li	s3,0
 75e:	bf21                	j	676 <vprintf+0x44>
 760:	008b8993          	addi	s3,s7,8
 764:	000bb903          	ld	s2,0(s7)
 768:	02090163          	beqz	s2,78a <vprintf+0x158>
 76c:	00094583          	lbu	a1,0(s2)
 770:	c9a5                	beqz	a1,7e0 <vprintf+0x1ae>
 772:	8556                	mv	a0,s5
 774:	00000097          	auipc	ra,0x0
 778:	df2080e7          	jalr	-526(ra) # 566 <putc>
 77c:	0905                	addi	s2,s2,1
 77e:	00094583          	lbu	a1,0(s2)
 782:	f9e5                	bnez	a1,772 <vprintf+0x140>
 784:	8bce                	mv	s7,s3
 786:	4981                	li	s3,0
 788:	b5fd                	j	676 <vprintf+0x44>
 78a:	00000917          	auipc	s2,0x0
 78e:	2ae90913          	addi	s2,s2,686 # a38 <malloc+0x154>
 792:	02800593          	li	a1,40
 796:	bff1                	j	772 <vprintf+0x140>
 798:	008b8913          	addi	s2,s7,8
 79c:	000bc583          	lbu	a1,0(s7)
 7a0:	8556                	mv	a0,s5
 7a2:	00000097          	auipc	ra,0x0
 7a6:	dc4080e7          	jalr	-572(ra) # 566 <putc>
 7aa:	8bca                	mv	s7,s2
 7ac:	4981                	li	s3,0
 7ae:	b5e1                	j	676 <vprintf+0x44>
 7b0:	02500593          	li	a1,37
 7b4:	8556                	mv	a0,s5
 7b6:	00000097          	auipc	ra,0x0
 7ba:	db0080e7          	jalr	-592(ra) # 566 <putc>
 7be:	4981                	li	s3,0
 7c0:	bd5d                	j	676 <vprintf+0x44>
 7c2:	02500593          	li	a1,37
 7c6:	8556                	mv	a0,s5
 7c8:	00000097          	auipc	ra,0x0
 7cc:	d9e080e7          	jalr	-610(ra) # 566 <putc>
 7d0:	85ca                	mv	a1,s2
 7d2:	8556                	mv	a0,s5
 7d4:	00000097          	auipc	ra,0x0
 7d8:	d92080e7          	jalr	-622(ra) # 566 <putc>
 7dc:	4981                	li	s3,0
 7de:	bd61                	j	676 <vprintf+0x44>
 7e0:	8bce                	mv	s7,s3
 7e2:	4981                	li	s3,0
 7e4:	bd49                	j	676 <vprintf+0x44>
 7e6:	60a6                	ld	ra,72(sp)
 7e8:	6406                	ld	s0,64(sp)
 7ea:	74e2                	ld	s1,56(sp)
 7ec:	7942                	ld	s2,48(sp)
 7ee:	79a2                	ld	s3,40(sp)
 7f0:	7a02                	ld	s4,32(sp)
 7f2:	6ae2                	ld	s5,24(sp)
 7f4:	6b42                	ld	s6,16(sp)
 7f6:	6ba2                	ld	s7,8(sp)
 7f8:	6c02                	ld	s8,0(sp)
 7fa:	6161                	addi	sp,sp,80
 7fc:	8082                	ret

00000000000007fe <fprintf>:
 7fe:	715d                	addi	sp,sp,-80
 800:	ec06                	sd	ra,24(sp)
 802:	e822                	sd	s0,16(sp)
 804:	1000                	addi	s0,sp,32
 806:	e010                	sd	a2,0(s0)
 808:	e414                	sd	a3,8(s0)
 80a:	e818                	sd	a4,16(s0)
 80c:	ec1c                	sd	a5,24(s0)
 80e:	03043023          	sd	a6,32(s0)
 812:	03143423          	sd	a7,40(s0)
 816:	8622                	mv	a2,s0
 818:	fe843423          	sd	s0,-24(s0)
 81c:	00000097          	auipc	ra,0x0
 820:	e16080e7          	jalr	-490(ra) # 632 <vprintf>
 824:	60e2                	ld	ra,24(sp)
 826:	6442                	ld	s0,16(sp)
 828:	6161                	addi	sp,sp,80
 82a:	8082                	ret

000000000000082c <printf>:
 82c:	711d                	addi	sp,sp,-96
 82e:	ec06                	sd	ra,24(sp)
 830:	e822                	sd	s0,16(sp)
 832:	1000                	addi	s0,sp,32
 834:	e40c                	sd	a1,8(s0)
 836:	e810                	sd	a2,16(s0)
 838:	ec14                	sd	a3,24(s0)
 83a:	f018                	sd	a4,32(s0)
 83c:	f41c                	sd	a5,40(s0)
 83e:	03043823          	sd	a6,48(s0)
 842:	03143c23          	sd	a7,56(s0)
 846:	00840613          	addi	a2,s0,8
 84a:	fec43423          	sd	a2,-24(s0)
 84e:	85aa                	mv	a1,a0
 850:	4505                	li	a0,1
 852:	00000097          	auipc	ra,0x0
 856:	de0080e7          	jalr	-544(ra) # 632 <vprintf>
 85a:	60e2                	ld	ra,24(sp)
 85c:	6442                	ld	s0,16(sp)
 85e:	6125                	addi	sp,sp,96
 860:	8082                	ret

0000000000000862 <free>:
 862:	1141                	addi	sp,sp,-16
 864:	e422                	sd	s0,8(sp)
 866:	0800                	addi	s0,sp,16
 868:	ff050693          	addi	a3,a0,-16
 86c:	00000797          	auipc	a5,0x0
 870:	26c7b783          	ld	a5,620(a5) # ad8 <freep>
 874:	a02d                	j	89e <free+0x3c>
 876:	4618                	lw	a4,8(a2)
 878:	9f2d                	addw	a4,a4,a1
 87a:	fee52c23          	sw	a4,-8(a0)
 87e:	6398                	ld	a4,0(a5)
 880:	6310                	ld	a2,0(a4)
 882:	a83d                	j	8c0 <free+0x5e>
 884:	ff852703          	lw	a4,-8(a0)
 888:	9f31                	addw	a4,a4,a2
 88a:	c798                	sw	a4,8(a5)
 88c:	ff053683          	ld	a3,-16(a0)
 890:	a091                	j	8d4 <free+0x72>
 892:	6398                	ld	a4,0(a5)
 894:	00e7e463          	bltu	a5,a4,89c <free+0x3a>
 898:	00e6ea63          	bltu	a3,a4,8ac <free+0x4a>
 89c:	87ba                	mv	a5,a4
 89e:	fed7fae3          	bgeu	a5,a3,892 <free+0x30>
 8a2:	6398                	ld	a4,0(a5)
 8a4:	00e6e463          	bltu	a3,a4,8ac <free+0x4a>
 8a8:	fee7eae3          	bltu	a5,a4,89c <free+0x3a>
 8ac:	ff852583          	lw	a1,-8(a0)
 8b0:	6390                	ld	a2,0(a5)
 8b2:	02059813          	slli	a6,a1,0x20
 8b6:	01c85713          	srli	a4,a6,0x1c
 8ba:	9736                	add	a4,a4,a3
 8bc:	fae60de3          	beq	a2,a4,876 <free+0x14>
 8c0:	fec53823          	sd	a2,-16(a0)
 8c4:	4790                	lw	a2,8(a5)
 8c6:	02061593          	slli	a1,a2,0x20
 8ca:	01c5d713          	srli	a4,a1,0x1c
 8ce:	973e                	add	a4,a4,a5
 8d0:	fae68ae3          	beq	a3,a4,884 <free+0x22>
 8d4:	e394                	sd	a3,0(a5)
 8d6:	00000717          	auipc	a4,0x0
 8da:	20f73123          	sd	a5,514(a4) # ad8 <freep>
 8de:	6422                	ld	s0,8(sp)
 8e0:	0141                	addi	sp,sp,16
 8e2:	8082                	ret

00000000000008e4 <malloc>:
 8e4:	7139                	addi	sp,sp,-64
 8e6:	fc06                	sd	ra,56(sp)
 8e8:	f822                	sd	s0,48(sp)
 8ea:	f426                	sd	s1,40(sp)
 8ec:	f04a                	sd	s2,32(sp)
 8ee:	ec4e                	sd	s3,24(sp)
 8f0:	e852                	sd	s4,16(sp)
 8f2:	e456                	sd	s5,8(sp)
 8f4:	e05a                	sd	s6,0(sp)
 8f6:	0080                	addi	s0,sp,64
 8f8:	02051493          	slli	s1,a0,0x20
 8fc:	9081                	srli	s1,s1,0x20
 8fe:	04bd                	addi	s1,s1,15
 900:	8091                	srli	s1,s1,0x4
 902:	0014899b          	addiw	s3,s1,1
 906:	0485                	addi	s1,s1,1
 908:	00000517          	auipc	a0,0x0
 90c:	1d053503          	ld	a0,464(a0) # ad8 <freep>
 910:	c515                	beqz	a0,93c <malloc+0x58>
 912:	611c                	ld	a5,0(a0)
 914:	4798                	lw	a4,8(a5)
 916:	04977063          	bgeu	a4,s1,956 <malloc+0x72>
 91a:	8a4e                	mv	s4,s3
 91c:	0009871b          	sext.w	a4,s3
 920:	6685                	lui	a3,0x1
 922:	00d77363          	bgeu	a4,a3,928 <malloc+0x44>
 926:	6a05                	lui	s4,0x1
 928:	000a0b1b          	sext.w	s6,s4
 92c:	004a1a1b          	slliw	s4,s4,0x4
 930:	00000917          	auipc	s2,0x0
 934:	1a890913          	addi	s2,s2,424 # ad8 <freep>
 938:	5afd                	li	s5,-1
 93a:	a89d                	j	9b0 <malloc+0xcc>
 93c:	00000717          	auipc	a4,0x0
 940:	19c70713          	addi	a4,a4,412 # ad8 <freep>
 944:	00000797          	auipc	a5,0x0
 948:	19c78793          	addi	a5,a5,412 # ae0 <base>
 94c:	e31c                	sd	a5,0(a4)
 94e:	e71c                	sd	a5,8(a4)
 950:	00072823          	sw	zero,16(a4)
 954:	b7d9                	j	91a <malloc+0x36>
 956:	02e48c63          	beq	s1,a4,98e <malloc+0xaa>
 95a:	4137073b          	subw	a4,a4,s3
 95e:	c798                	sw	a4,8(a5)
 960:	02071693          	slli	a3,a4,0x20
 964:	01c6d713          	srli	a4,a3,0x1c
 968:	97ba                	add	a5,a5,a4
 96a:	0137a423          	sw	s3,8(a5)
 96e:	00000717          	auipc	a4,0x0
 972:	16a73523          	sd	a0,362(a4) # ad8 <freep>
 976:	01078513          	addi	a0,a5,16
 97a:	70e2                	ld	ra,56(sp)
 97c:	7442                	ld	s0,48(sp)
 97e:	74a2                	ld	s1,40(sp)
 980:	7902                	ld	s2,32(sp)
 982:	69e2                	ld	s3,24(sp)
 984:	6a42                	ld	s4,16(sp)
 986:	6aa2                	ld	s5,8(sp)
 988:	6b02                	ld	s6,0(sp)
 98a:	6121                	addi	sp,sp,64
 98c:	8082                	ret
 98e:	6398                	ld	a4,0(a5)
 990:	e118                	sd	a4,0(a0)
 992:	bff1                	j	96e <malloc+0x8a>
 994:	01652423          	sw	s6,8(a0)
 998:	0541                	addi	a0,a0,16
 99a:	00000097          	auipc	ra,0x0
 99e:	ec8080e7          	jalr	-312(ra) # 862 <free>
 9a2:	00093503          	ld	a0,0(s2)
 9a6:	d971                	beqz	a0,97a <malloc+0x96>
 9a8:	611c                	ld	a5,0(a0)
 9aa:	4798                	lw	a4,8(a5)
 9ac:	fa9775e3          	bgeu	a4,s1,956 <malloc+0x72>
 9b0:	00093703          	ld	a4,0(s2)
 9b4:	853e                	mv	a0,a5
 9b6:	fef719e3          	bne	a4,a5,9a8 <malloc+0xc4>
 9ba:	8552                	mv	a0,s4
 9bc:	00000097          	auipc	ra,0x0
 9c0:	b52080e7          	jalr	-1198(ra) # 50e <sbrk>
 9c4:	fd5518e3          	bne	a0,s5,994 <malloc+0xb0>
 9c8:	4501                	li	a0,0
 9ca:	bf45                	j	97a <malloc+0x96>
