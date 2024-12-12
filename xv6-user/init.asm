
xv6-user/_init:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
 "write",               //////////////////////////////////////
 "yield",               //0/4
 "waitpid",             //1/4
};
int counts = sizeof(tests) / sizeof((tests)[0]);
int main(void) {
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	ec26                	sd	s1,24(sp)
   8:	e84a                	sd	s2,16(sp)
   a:	e44e                	sd	s3,8(sp)
   c:	1800                	addi	s0,sp,48
  int pid=0, wpid=0;
  dev(O_RDWR, CONSOLE, 0);
   e:	4601                	li	a2,0
  10:	4585                	li	a1,1
  12:	4509                	li	a0,2
  14:	00000097          	auipc	ra,0x0
  18:	448080e7          	jalr	1096(ra) # 45c <dev>
  dup(0); // stdout
  1c:	4501                	li	a0,0
  1e:	00000097          	auipc	ra,0x0
  22:	40e080e7          	jalr	1038(ra) # 42c <dup>
  dup(0); // stderr
  26:	4501                	li	a0,0
  28:	00000097          	auipc	ra,0x0
  2c:	404080e7          	jalr	1028(ra) # 42c <dup>

  for (int i = 0; i < counts; i++) {
  30:	00001797          	auipc	a5,0x1
  34:	ae07a783          	lw	a5,-1312(a5) # b10 <counts>
  38:	0cf05763          	blez	a5,106 <main+0x106>
  3c:	4901                	li	s2,0
  3e:	00001997          	auipc	s3,0x1
  42:	ad298993          	addi	s3,s3,-1326 # b10 <counts>
    //printf("====================================starting %s\n", tests[i]);
    pid = fork();
  46:	00000097          	auipc	ra,0x0
  4a:	37e080e7          	jalr	894(ra) # 3c4 <fork>
  4e:	84aa                	mv	s1,a0
    if (pid < 0) {
  50:	04054363          	bltz	a0,96 <main+0x96>
      printf("init: fork failed\n");
      exit(1);
    }
    if (pid == 0) {
  54:	cd31                	beqz	a0,b0 <main+0xb0>
      printf(tests[i]);
      printf(" failed exec %s\n", tests[i]);
      exit(1);
    }
    else{
      wait((int*)0);
  56:	4501                	li	a0,0
  58:	00000097          	auipc	ra,0x0
  5c:	37c080e7          	jalr	892(ra) # 3d4 <wait>
  for (int i = 0; i < counts; i++) {
  60:	2905                	addiw	s2,s2,1
  62:	0009a783          	lw	a5,0(s3)
  66:	fef940e3          	blt	s2,a5,46 <main+0x46>
    }
  }
  for(;;){
    wpid = wait((int *) 0);
  6a:	4501                	li	a0,0
  6c:	00000097          	auipc	ra,0x0
  70:	368080e7          	jalr	872(ra) # 3d4 <wait>
    if(wpid == pid){
  74:	08950b63          	beq	a0,s1,10a <main+0x10a>
      // the shell exited; restart it.
      break;
    } else if(wpid < 0){
  78:	fe0559e3          	bgez	a0,6a <main+0x6a>
      printf("init: wait returned\n");
  7c:	00001517          	auipc	a0,0x1
  80:	8e450513          	addi	a0,a0,-1820 # 960 <malloc+0x12c>
  84:	00000097          	auipc	ra,0x0
  88:	6f8080e7          	jalr	1784(ra) # 77c <printf>
      exit(-1);
  8c:	557d                	li	a0,-1
  8e:	00000097          	auipc	ra,0x0
  92:	33e080e7          	jalr	830(ra) # 3cc <exit>
      printf("init: fork failed\n");
  96:	00001517          	auipc	a0,0x1
  9a:	88a50513          	addi	a0,a0,-1910 # 920 <malloc+0xec>
  9e:	00000097          	auipc	ra,0x0
  a2:	6de080e7          	jalr	1758(ra) # 77c <printf>
      exit(1);
  a6:	4505                	li	a0,1
  a8:	00000097          	auipc	ra,0x0
  ac:	324080e7          	jalr	804(ra) # 3cc <exit>
      exec(tests[i], argv);
  b0:	090e                	slli	s2,s2,0x3
  b2:	00001497          	auipc	s1,0x1
  b6:	a6648493          	addi	s1,s1,-1434 # b18 <tests>
  ba:	94ca                	add	s1,s1,s2
  bc:	00001597          	auipc	a1,0x1
  c0:	b6458593          	addi	a1,a1,-1180 # c20 <argv>
  c4:	6088                	ld	a0,0(s1)
  c6:	00000097          	auipc	ra,0x0
  ca:	33e080e7          	jalr	830(ra) # 404 <exec>
      printf("init: exec %s",tests[i]);
  ce:	608c                	ld	a1,0(s1)
  d0:	00001517          	auipc	a0,0x1
  d4:	86850513          	addi	a0,a0,-1944 # 938 <malloc+0x104>
  d8:	00000097          	auipc	ra,0x0
  dc:	6a4080e7          	jalr	1700(ra) # 77c <printf>
      printf(tests[i]);
  e0:	6088                	ld	a0,0(s1)
  e2:	00000097          	auipc	ra,0x0
  e6:	69a080e7          	jalr	1690(ra) # 77c <printf>
      printf(" failed exec %s\n", tests[i]);
  ea:	608c                	ld	a1,0(s1)
  ec:	00001517          	auipc	a0,0x1
  f0:	85c50513          	addi	a0,a0,-1956 # 948 <malloc+0x114>
  f4:	00000097          	auipc	ra,0x0
  f8:	688080e7          	jalr	1672(ra) # 77c <printf>
      exit(1);
  fc:	4505                	li	a0,1
  fe:	00000097          	auipc	ra,0x0
 102:	2ce080e7          	jalr	718(ra) # 3cc <exit>
  int pid=0, wpid=0;
 106:	4481                	li	s1,0
 108:	b78d                	j	6a <main+0x6a>
    } else {
      // it was a parentless process; do nothing.
    }
  }
  exit(-1);
 10a:	557d                	li	a0,-1
 10c:	00000097          	auipc	ra,0x0
 110:	2c0080e7          	jalr	704(ra) # 3cc <exit>

0000000000000114 <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
 114:	1141                	addi	sp,sp,-16
 116:	e422                	sd	s0,8(sp)
 118:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 11a:	87aa                	mv	a5,a0
 11c:	0585                	addi	a1,a1,1
 11e:	0785                	addi	a5,a5,1
 120:	fff5c703          	lbu	a4,-1(a1)
 124:	fee78fa3          	sb	a4,-1(a5)
 128:	fb75                	bnez	a4,11c <strcpy+0x8>
    ;
  return os;
}
 12a:	6422                	ld	s0,8(sp)
 12c:	0141                	addi	sp,sp,16
 12e:	8082                	ret

0000000000000130 <strcat>:

char*
strcat(char *s, const char *t)
{
 130:	1141                	addi	sp,sp,-16
 132:	e422                	sd	s0,8(sp)
 134:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
 136:	00054783          	lbu	a5,0(a0)
 13a:	c385                	beqz	a5,15a <strcat+0x2a>
 13c:	87aa                	mv	a5,a0
    s++;
 13e:	0785                	addi	a5,a5,1
  while(*s)
 140:	0007c703          	lbu	a4,0(a5)
 144:	ff6d                	bnez	a4,13e <strcat+0xe>
  while((*s++ = *t++))
 146:	0585                	addi	a1,a1,1
 148:	0785                	addi	a5,a5,1
 14a:	fff5c703          	lbu	a4,-1(a1)
 14e:	fee78fa3          	sb	a4,-1(a5)
 152:	fb75                	bnez	a4,146 <strcat+0x16>
    ;
  return os;
}
 154:	6422                	ld	s0,8(sp)
 156:	0141                	addi	sp,sp,16
 158:	8082                	ret
  while(*s)
 15a:	87aa                	mv	a5,a0
 15c:	b7ed                	j	146 <strcat+0x16>

000000000000015e <strcmp>:


int
strcmp(const char *p, const char *q)
{
 15e:	1141                	addi	sp,sp,-16
 160:	e422                	sd	s0,8(sp)
 162:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 164:	00054783          	lbu	a5,0(a0)
 168:	cb91                	beqz	a5,17c <strcmp+0x1e>
 16a:	0005c703          	lbu	a4,0(a1)
 16e:	00f71763          	bne	a4,a5,17c <strcmp+0x1e>
    p++, q++;
 172:	0505                	addi	a0,a0,1
 174:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 176:	00054783          	lbu	a5,0(a0)
 17a:	fbe5                	bnez	a5,16a <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 17c:	0005c503          	lbu	a0,0(a1)
}
 180:	40a7853b          	subw	a0,a5,a0
 184:	6422                	ld	s0,8(sp)
 186:	0141                	addi	sp,sp,16
 188:	8082                	ret

000000000000018a <strlen>:

uint
strlen(const char *s)
{
 18a:	1141                	addi	sp,sp,-16
 18c:	e422                	sd	s0,8(sp)
 18e:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 190:	00054783          	lbu	a5,0(a0)
 194:	cf91                	beqz	a5,1b0 <strlen+0x26>
 196:	0505                	addi	a0,a0,1
 198:	87aa                	mv	a5,a0
 19a:	4685                	li	a3,1
 19c:	9e89                	subw	a3,a3,a0
 19e:	00f6853b          	addw	a0,a3,a5
 1a2:	0785                	addi	a5,a5,1
 1a4:	fff7c703          	lbu	a4,-1(a5)
 1a8:	fb7d                	bnez	a4,19e <strlen+0x14>
    ;
  return n;
}
 1aa:	6422                	ld	s0,8(sp)
 1ac:	0141                	addi	sp,sp,16
 1ae:	8082                	ret
  for(n = 0; s[n]; n++)
 1b0:	4501                	li	a0,0
 1b2:	bfe5                	j	1aa <strlen+0x20>

00000000000001b4 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1b4:	1141                	addi	sp,sp,-16
 1b6:	e422                	sd	s0,8(sp)
 1b8:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 1ba:	ca19                	beqz	a2,1d0 <memset+0x1c>
 1bc:	87aa                	mv	a5,a0
 1be:	1602                	slli	a2,a2,0x20
 1c0:	9201                	srli	a2,a2,0x20
 1c2:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 1c6:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 1ca:	0785                	addi	a5,a5,1
 1cc:	fee79de3          	bne	a5,a4,1c6 <memset+0x12>
  }
  return dst;
}
 1d0:	6422                	ld	s0,8(sp)
 1d2:	0141                	addi	sp,sp,16
 1d4:	8082                	ret

00000000000001d6 <strchr>:

char*
strchr(const char *s, char c)
{
 1d6:	1141                	addi	sp,sp,-16
 1d8:	e422                	sd	s0,8(sp)
 1da:	0800                	addi	s0,sp,16
  for(; *s; s++)
 1dc:	00054783          	lbu	a5,0(a0)
 1e0:	cb99                	beqz	a5,1f6 <strchr+0x20>
    if(*s == c)
 1e2:	00f58763          	beq	a1,a5,1f0 <strchr+0x1a>
  for(; *s; s++)
 1e6:	0505                	addi	a0,a0,1
 1e8:	00054783          	lbu	a5,0(a0)
 1ec:	fbfd                	bnez	a5,1e2 <strchr+0xc>
      return (char*)s;
  return 0;
 1ee:	4501                	li	a0,0
}
 1f0:	6422                	ld	s0,8(sp)
 1f2:	0141                	addi	sp,sp,16
 1f4:	8082                	ret
  return 0;
 1f6:	4501                	li	a0,0
 1f8:	bfe5                	j	1f0 <strchr+0x1a>

00000000000001fa <gets>:

char*
gets(char *buf, int max)
{
 1fa:	711d                	addi	sp,sp,-96
 1fc:	ec86                	sd	ra,88(sp)
 1fe:	e8a2                	sd	s0,80(sp)
 200:	e4a6                	sd	s1,72(sp)
 202:	e0ca                	sd	s2,64(sp)
 204:	fc4e                	sd	s3,56(sp)
 206:	f852                	sd	s4,48(sp)
 208:	f456                	sd	s5,40(sp)
 20a:	f05a                	sd	s6,32(sp)
 20c:	ec5e                	sd	s7,24(sp)
 20e:	e862                	sd	s8,16(sp)
 210:	1080                	addi	s0,sp,96
 212:	8baa                	mv	s7,a0
 214:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 216:	892a                	mv	s2,a0
 218:	4481                	li	s1,0
    cc = read(0, &c, 1);
 21a:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 21e:	4b29                	li	s6,10
 220:	4c35                	li	s8,13
  for(i=0; i+1 < max; ){
 222:	89a6                	mv	s3,s1
 224:	2485                	addiw	s1,s1,1
 226:	0344d763          	bge	s1,s4,254 <gets+0x5a>
    cc = read(0, &c, 1);
 22a:	4605                	li	a2,1
 22c:	85d6                	mv	a1,s5
 22e:	4501                	li	a0,0
 230:	00000097          	auipc	ra,0x0
 234:	1b4080e7          	jalr	436(ra) # 3e4 <read>
    if(cc < 1)
 238:	00a05e63          	blez	a0,254 <gets+0x5a>
    buf[i++] = c;
 23c:	faf44783          	lbu	a5,-81(s0)
 240:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 244:	01678763          	beq	a5,s6,252 <gets+0x58>
 248:	0905                	addi	s2,s2,1
 24a:	fd879ce3          	bne	a5,s8,222 <gets+0x28>
  for(i=0; i+1 < max; ){
 24e:	89a6                	mv	s3,s1
 250:	a011                	j	254 <gets+0x5a>
 252:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 254:	99de                	add	s3,s3,s7
 256:	00098023          	sb	zero,0(s3)
  return buf;
}
 25a:	855e                	mv	a0,s7
 25c:	60e6                	ld	ra,88(sp)
 25e:	6446                	ld	s0,80(sp)
 260:	64a6                	ld	s1,72(sp)
 262:	6906                	ld	s2,64(sp)
 264:	79e2                	ld	s3,56(sp)
 266:	7a42                	ld	s4,48(sp)
 268:	7aa2                	ld	s5,40(sp)
 26a:	7b02                	ld	s6,32(sp)
 26c:	6be2                	ld	s7,24(sp)
 26e:	6c42                	ld	s8,16(sp)
 270:	6125                	addi	sp,sp,96
 272:	8082                	ret

0000000000000274 <stat>:

int
stat(const char *n, struct stat *st)
{
 274:	1101                	addi	sp,sp,-32
 276:	ec06                	sd	ra,24(sp)
 278:	e822                	sd	s0,16(sp)
 27a:	e426                	sd	s1,8(sp)
 27c:	e04a                	sd	s2,0(sp)
 27e:	1000                	addi	s0,sp,32
 280:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 282:	4581                	li	a1,0
 284:	00000097          	auipc	ra,0x0
 288:	188080e7          	jalr	392(ra) # 40c <open>
  if(fd < 0)
 28c:	02054563          	bltz	a0,2b6 <stat+0x42>
 290:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 292:	85ca                	mv	a1,s2
 294:	00000097          	auipc	ra,0x0
 298:	180080e7          	jalr	384(ra) # 414 <fstat>
 29c:	892a                	mv	s2,a0
  close(fd);
 29e:	8526                	mv	a0,s1
 2a0:	00000097          	auipc	ra,0x0
 2a4:	154080e7          	jalr	340(ra) # 3f4 <close>
  return r;
}
 2a8:	854a                	mv	a0,s2
 2aa:	60e2                	ld	ra,24(sp)
 2ac:	6442                	ld	s0,16(sp)
 2ae:	64a2                	ld	s1,8(sp)
 2b0:	6902                	ld	s2,0(sp)
 2b2:	6105                	addi	sp,sp,32
 2b4:	8082                	ret
    return -1;
 2b6:	597d                	li	s2,-1
 2b8:	bfc5                	j	2a8 <stat+0x34>

00000000000002ba <atoi>:

int
atoi(const char *s)
{
 2ba:	1141                	addi	sp,sp,-16
 2bc:	e422                	sd	s0,8(sp)
 2be:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 2c0:	00054703          	lbu	a4,0(a0)
 2c4:	02d00793          	li	a5,45
  int neg = 1;
 2c8:	4585                	li	a1,1
  if (*s == '-') {
 2ca:	04f70363          	beq	a4,a5,310 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 2ce:	00054703          	lbu	a4,0(a0)
 2d2:	fd07079b          	addiw	a5,a4,-48
 2d6:	0ff7f793          	zext.b	a5,a5
 2da:	46a5                	li	a3,9
 2dc:	02f6ed63          	bltu	a3,a5,316 <atoi+0x5c>
  n = 0;
 2e0:	4681                	li	a3,0
  while('0' <= *s && *s <= '9')
 2e2:	4625                	li	a2,9
    n = n*10 + *s++ - '0';
 2e4:	0505                	addi	a0,a0,1
 2e6:	0026979b          	slliw	a5,a3,0x2
 2ea:	9fb5                	addw	a5,a5,a3
 2ec:	0017979b          	slliw	a5,a5,0x1
 2f0:	9fb9                	addw	a5,a5,a4
 2f2:	fd07869b          	addiw	a3,a5,-48
  while('0' <= *s && *s <= '9')
 2f6:	00054703          	lbu	a4,0(a0)
 2fa:	fd07079b          	addiw	a5,a4,-48
 2fe:	0ff7f793          	zext.b	a5,a5
 302:	fef671e3          	bgeu	a2,a5,2e4 <atoi+0x2a>
  return n * neg;
}
 306:	02d5853b          	mulw	a0,a1,a3
 30a:	6422                	ld	s0,8(sp)
 30c:	0141                	addi	sp,sp,16
 30e:	8082                	ret
    s++;
 310:	0505                	addi	a0,a0,1
    neg = -1;
 312:	55fd                	li	a1,-1
 314:	bf6d                	j	2ce <atoi+0x14>
  n = 0;
 316:	4681                	li	a3,0
 318:	b7fd                	j	306 <atoi+0x4c>

000000000000031a <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 31a:	1141                	addi	sp,sp,-16
 31c:	e422                	sd	s0,8(sp)
 31e:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 320:	02b57463          	bgeu	a0,a1,348 <memmove+0x2e>
    while(n-- > 0)
 324:	00c05f63          	blez	a2,342 <memmove+0x28>
 328:	1602                	slli	a2,a2,0x20
 32a:	9201                	srli	a2,a2,0x20
 32c:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 330:	872a                	mv	a4,a0
      *dst++ = *src++;
 332:	0585                	addi	a1,a1,1
 334:	0705                	addi	a4,a4,1
 336:	fff5c683          	lbu	a3,-1(a1)
 33a:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 33e:	fee79ae3          	bne	a5,a4,332 <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 342:	6422                	ld	s0,8(sp)
 344:	0141                	addi	sp,sp,16
 346:	8082                	ret
    dst += n;
 348:	00c50733          	add	a4,a0,a2
    src += n;
 34c:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 34e:	fec05ae3          	blez	a2,342 <memmove+0x28>
 352:	fff6079b          	addiw	a5,a2,-1
 356:	1782                	slli	a5,a5,0x20
 358:	9381                	srli	a5,a5,0x20
 35a:	fff7c793          	not	a5,a5
 35e:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 360:	15fd                	addi	a1,a1,-1
 362:	177d                	addi	a4,a4,-1
 364:	0005c683          	lbu	a3,0(a1)
 368:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 36c:	fee79ae3          	bne	a5,a4,360 <memmove+0x46>
 370:	bfc9                	j	342 <memmove+0x28>

0000000000000372 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 372:	1141                	addi	sp,sp,-16
 374:	e422                	sd	s0,8(sp)
 376:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 378:	ca05                	beqz	a2,3a8 <memcmp+0x36>
 37a:	fff6069b          	addiw	a3,a2,-1
 37e:	1682                	slli	a3,a3,0x20
 380:	9281                	srli	a3,a3,0x20
 382:	0685                	addi	a3,a3,1
 384:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 386:	00054783          	lbu	a5,0(a0)
 38a:	0005c703          	lbu	a4,0(a1)
 38e:	00e79863          	bne	a5,a4,39e <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 392:	0505                	addi	a0,a0,1
    p2++;
 394:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 396:	fed518e3          	bne	a0,a3,386 <memcmp+0x14>
  }
  return 0;
 39a:	4501                	li	a0,0
 39c:	a019                	j	3a2 <memcmp+0x30>
      return *p1 - *p2;
 39e:	40e7853b          	subw	a0,a5,a4
}
 3a2:	6422                	ld	s0,8(sp)
 3a4:	0141                	addi	sp,sp,16
 3a6:	8082                	ret
  return 0;
 3a8:	4501                	li	a0,0
 3aa:	bfe5                	j	3a2 <memcmp+0x30>

00000000000003ac <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 3ac:	1141                	addi	sp,sp,-16
 3ae:	e406                	sd	ra,8(sp)
 3b0:	e022                	sd	s0,0(sp)
 3b2:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 3b4:	00000097          	auipc	ra,0x0
 3b8:	f66080e7          	jalr	-154(ra) # 31a <memmove>
}
 3bc:	60a2                	ld	ra,8(sp)
 3be:	6402                	ld	s0,0(sp)
 3c0:	0141                	addi	sp,sp,16
 3c2:	8082                	ret

00000000000003c4 <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 3c4:	4885                	li	a7,1
 ecall
 3c6:	00000073          	ecall
 ret
 3ca:	8082                	ret

00000000000003cc <exit>:
.global exit
exit:
 li a7, SYS_exit
 3cc:	4889                	li	a7,2
 ecall
 3ce:	00000073          	ecall
 ret
 3d2:	8082                	ret

00000000000003d4 <wait>:
.global wait
wait:
 li a7, SYS_wait
 3d4:	488d                	li	a7,3
 ecall
 3d6:	00000073          	ecall
 ret
 3da:	8082                	ret

00000000000003dc <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 3dc:	4891                	li	a7,4
 ecall
 3de:	00000073          	ecall
 ret
 3e2:	8082                	ret

00000000000003e4 <read>:
.global read
read:
 li a7, SYS_read
 3e4:	4895                	li	a7,5
 ecall
 3e6:	00000073          	ecall
 ret
 3ea:	8082                	ret

00000000000003ec <write>:
.global write
write:
 li a7, SYS_write
 3ec:	48c1                	li	a7,16
 ecall
 3ee:	00000073          	ecall
 ret
 3f2:	8082                	ret

00000000000003f4 <close>:
.global close
close:
 li a7, SYS_close
 3f4:	48d5                	li	a7,21
 ecall
 3f6:	00000073          	ecall
 ret
 3fa:	8082                	ret

00000000000003fc <kill>:
.global kill
kill:
 li a7, SYS_kill
 3fc:	4899                	li	a7,6
 ecall
 3fe:	00000073          	ecall
 ret
 402:	8082                	ret

0000000000000404 <exec>:
.global exec
exec:
 li a7, SYS_exec
 404:	489d                	li	a7,7
 ecall
 406:	00000073          	ecall
 ret
 40a:	8082                	ret

000000000000040c <open>:
.global open
open:
 li a7, SYS_open
 40c:	48bd                	li	a7,15
 ecall
 40e:	00000073          	ecall
 ret
 412:	8082                	ret

0000000000000414 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 414:	48a1                	li	a7,8
 ecall
 416:	00000073          	ecall
 ret
 41a:	8082                	ret

000000000000041c <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 41c:	48d1                	li	a7,20
 ecall
 41e:	00000073          	ecall
 ret
 422:	8082                	ret

0000000000000424 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 424:	48a5                	li	a7,9
 ecall
 426:	00000073          	ecall
 ret
 42a:	8082                	ret

000000000000042c <dup>:
.global dup
dup:
 li a7, SYS_dup
 42c:	48a9                	li	a7,10
 ecall
 42e:	00000073          	ecall
 ret
 432:	8082                	ret

0000000000000434 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 434:	48ad                	li	a7,11
 ecall
 436:	00000073          	ecall
 ret
 43a:	8082                	ret

000000000000043c <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 43c:	48b1                	li	a7,12
 ecall
 43e:	00000073          	ecall
 ret
 442:	8082                	ret

0000000000000444 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 444:	48b5                	li	a7,13
 ecall
 446:	00000073          	ecall
 ret
 44a:	8082                	ret

000000000000044c <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 44c:	48b9                	li	a7,14
 ecall
 44e:	00000073          	ecall
 ret
 452:	8082                	ret

0000000000000454 <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 454:	48d9                	li	a7,22
 ecall
 456:	00000073          	ecall
 ret
 45a:	8082                	ret

000000000000045c <dev>:
.global dev
dev:
 li a7, SYS_dev
 45c:	0e900893          	li	a7,233
 ecall
 460:	00000073          	ecall
 ret
 464:	8082                	ret

0000000000000466 <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 466:	0f400893          	li	a7,244
 ecall
 46a:	00000073          	ecall
 ret
 46e:	8082                	ret

0000000000000470 <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 470:	48e5                	li	a7,25
 ecall
 472:	00000073          	ecall
 ret
 476:	8082                	ret

0000000000000478 <remove>:
.global remove
remove:
 li a7, SYS_remove
 478:	0b100893          	li	a7,177
 ecall
 47c:	00000073          	ecall
 ret
 480:	8082                	ret

0000000000000482 <trace>:
.global trace
trace:
 li a7, SYS_trace
 482:	48c9                	li	a7,18
 ecall
 484:	00000073          	ecall
 ret
 488:	8082                	ret

000000000000048a <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 48a:	48cd                	li	a7,19
 ecall
 48c:	00000073          	ecall
 ret
 490:	8082                	ret

0000000000000492 <rename>:
.global rename
rename:
 li a7, SYS_rename
 492:	48e9                	li	a7,26
 ecall
 494:	00000073          	ecall
 ret
 498:	8082                	ret

000000000000049a <poweroff>:
.global poweroff
poweroff:
 li a7, SYS_poweroff
 49a:	0d200893          	li	a7,210
 ecall
 49e:	00000073          	ecall
 ret
 4a2:	8082                	ret

00000000000004a4 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 4a4:	1101                	addi	sp,sp,-32
 4a6:	ec06                	sd	ra,24(sp)
 4a8:	e822                	sd	s0,16(sp)
 4aa:	1000                	addi	s0,sp,32
 4ac:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 4b0:	4605                	li	a2,1
 4b2:	fef40593          	addi	a1,s0,-17
 4b6:	00000097          	auipc	ra,0x0
 4ba:	f36080e7          	jalr	-202(ra) # 3ec <write>
}
 4be:	60e2                	ld	ra,24(sp)
 4c0:	6442                	ld	s0,16(sp)
 4c2:	6105                	addi	sp,sp,32
 4c4:	8082                	ret

00000000000004c6 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4c6:	7139                	addi	sp,sp,-64
 4c8:	fc06                	sd	ra,56(sp)
 4ca:	f822                	sd	s0,48(sp)
 4cc:	f426                	sd	s1,40(sp)
 4ce:	f04a                	sd	s2,32(sp)
 4d0:	ec4e                	sd	s3,24(sp)
 4d2:	0080                	addi	s0,sp,64
 4d4:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4d6:	c299                	beqz	a3,4dc <printint+0x16>
 4d8:	0805c863          	bltz	a1,568 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 4dc:	2581                	sext.w	a1,a1
  neg = 0;
 4de:	4881                	li	a7,0
  }

  i = 0;
 4e0:	fc040993          	addi	s3,s0,-64
  neg = 0;
 4e4:	86ce                	mv	a3,s3
  i = 0;
 4e6:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 4e8:	2601                	sext.w	a2,a2
 4ea:	00000517          	auipc	a0,0x0
 4ee:	60e50513          	addi	a0,a0,1550 # af8 <digits>
 4f2:	883a                	mv	a6,a4
 4f4:	2705                	addiw	a4,a4,1
 4f6:	02c5f7bb          	remuw	a5,a1,a2
 4fa:	1782                	slli	a5,a5,0x20
 4fc:	9381                	srli	a5,a5,0x20
 4fe:	97aa                	add	a5,a5,a0
 500:	0007c783          	lbu	a5,0(a5)
 504:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 508:	0005879b          	sext.w	a5,a1
 50c:	02c5d5bb          	divuw	a1,a1,a2
 510:	0685                	addi	a3,a3,1
 512:	fec7f0e3          	bgeu	a5,a2,4f2 <printint+0x2c>
  if(neg)
 516:	00088c63          	beqz	a7,52e <printint+0x68>
    buf[i++] = '-';
 51a:	fd070793          	addi	a5,a4,-48
 51e:	00878733          	add	a4,a5,s0
 522:	02d00793          	li	a5,45
 526:	fef70823          	sb	a5,-16(a4)
 52a:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 52e:	02e05663          	blez	a4,55a <printint+0x94>
 532:	fc040913          	addi	s2,s0,-64
 536:	993a                	add	s2,s2,a4
 538:	19fd                	addi	s3,s3,-1
 53a:	99ba                	add	s3,s3,a4
 53c:	377d                	addiw	a4,a4,-1
 53e:	1702                	slli	a4,a4,0x20
 540:	9301                	srli	a4,a4,0x20
 542:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 546:	fff94583          	lbu	a1,-1(s2)
 54a:	8526                	mv	a0,s1
 54c:	00000097          	auipc	ra,0x0
 550:	f58080e7          	jalr	-168(ra) # 4a4 <putc>
  while(--i >= 0)
 554:	197d                	addi	s2,s2,-1
 556:	ff3918e3          	bne	s2,s3,546 <printint+0x80>
}
 55a:	70e2                	ld	ra,56(sp)
 55c:	7442                	ld	s0,48(sp)
 55e:	74a2                	ld	s1,40(sp)
 560:	7902                	ld	s2,32(sp)
 562:	69e2                	ld	s3,24(sp)
 564:	6121                	addi	sp,sp,64
 566:	8082                	ret
    x = -xx;
 568:	40b005bb          	negw	a1,a1
    neg = 1;
 56c:	4885                	li	a7,1
    x = -xx;
 56e:	bf8d                	j	4e0 <printint+0x1a>

0000000000000570 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 570:	7119                	addi	sp,sp,-128
 572:	fc86                	sd	ra,120(sp)
 574:	f8a2                	sd	s0,112(sp)
 576:	f4a6                	sd	s1,104(sp)
 578:	f0ca                	sd	s2,96(sp)
 57a:	ecce                	sd	s3,88(sp)
 57c:	e8d2                	sd	s4,80(sp)
 57e:	e4d6                	sd	s5,72(sp)
 580:	e0da                	sd	s6,64(sp)
 582:	fc5e                	sd	s7,56(sp)
 584:	f862                	sd	s8,48(sp)
 586:	f466                	sd	s9,40(sp)
 588:	f06a                	sd	s10,32(sp)
 58a:	ec6e                	sd	s11,24(sp)
 58c:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 58e:	0005c903          	lbu	s2,0(a1)
 592:	18090f63          	beqz	s2,730 <vprintf+0x1c0>
 596:	8aaa                	mv	s5,a0
 598:	8b32                	mv	s6,a2
 59a:	00158493          	addi	s1,a1,1
  state = 0;
 59e:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 5a0:	02500a13          	li	s4,37
 5a4:	4c55                	li	s8,21
 5a6:	00000c97          	auipc	s9,0x0
 5aa:	4fac8c93          	addi	s9,s9,1274 # aa0 <malloc+0x26c>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
        s = va_arg(ap, char*);
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5ae:	02800d93          	li	s11,40
  putc(fd, 'x');
 5b2:	4d41                	li	s10,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 5b4:	00000b97          	auipc	s7,0x0
 5b8:	544b8b93          	addi	s7,s7,1348 # af8 <digits>
 5bc:	a839                	j	5da <vprintf+0x6a>
        putc(fd, c);
 5be:	85ca                	mv	a1,s2
 5c0:	8556                	mv	a0,s5
 5c2:	00000097          	auipc	ra,0x0
 5c6:	ee2080e7          	jalr	-286(ra) # 4a4 <putc>
 5ca:	a019                	j	5d0 <vprintf+0x60>
    } else if(state == '%'){
 5cc:	01498d63          	beq	s3,s4,5e6 <vprintf+0x76>
  for(i = 0; fmt[i]; i++){
 5d0:	0485                	addi	s1,s1,1
 5d2:	fff4c903          	lbu	s2,-1(s1)
 5d6:	14090d63          	beqz	s2,730 <vprintf+0x1c0>
    if(state == 0){
 5da:	fe0999e3          	bnez	s3,5cc <vprintf+0x5c>
      if(c == '%'){
 5de:	ff4910e3          	bne	s2,s4,5be <vprintf+0x4e>
        state = '%';
 5e2:	89d2                	mv	s3,s4
 5e4:	b7f5                	j	5d0 <vprintf+0x60>
      if(c == 'd'){
 5e6:	11490c63          	beq	s2,s4,6fe <vprintf+0x18e>
 5ea:	f9d9079b          	addiw	a5,s2,-99
 5ee:	0ff7f793          	zext.b	a5,a5
 5f2:	10fc6e63          	bltu	s8,a5,70e <vprintf+0x19e>
 5f6:	f9d9079b          	addiw	a5,s2,-99
 5fa:	0ff7f713          	zext.b	a4,a5
 5fe:	10ec6863          	bltu	s8,a4,70e <vprintf+0x19e>
 602:	00271793          	slli	a5,a4,0x2
 606:	97e6                	add	a5,a5,s9
 608:	439c                	lw	a5,0(a5)
 60a:	97e6                	add	a5,a5,s9
 60c:	8782                	jr	a5
        printint(fd, va_arg(ap, int), 10, 1);
 60e:	008b0913          	addi	s2,s6,8
 612:	4685                	li	a3,1
 614:	4629                	li	a2,10
 616:	000b2583          	lw	a1,0(s6)
 61a:	8556                	mv	a0,s5
 61c:	00000097          	auipc	ra,0x0
 620:	eaa080e7          	jalr	-342(ra) # 4c6 <printint>
 624:	8b4a                	mv	s6,s2
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 626:	4981                	li	s3,0
 628:	b765                	j	5d0 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 62a:	008b0913          	addi	s2,s6,8
 62e:	4681                	li	a3,0
 630:	4629                	li	a2,10
 632:	000b2583          	lw	a1,0(s6)
 636:	8556                	mv	a0,s5
 638:	00000097          	auipc	ra,0x0
 63c:	e8e080e7          	jalr	-370(ra) # 4c6 <printint>
 640:	8b4a                	mv	s6,s2
      state = 0;
 642:	4981                	li	s3,0
 644:	b771                	j	5d0 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 646:	008b0913          	addi	s2,s6,8
 64a:	4681                	li	a3,0
 64c:	866a                	mv	a2,s10
 64e:	000b2583          	lw	a1,0(s6)
 652:	8556                	mv	a0,s5
 654:	00000097          	auipc	ra,0x0
 658:	e72080e7          	jalr	-398(ra) # 4c6 <printint>
 65c:	8b4a                	mv	s6,s2
      state = 0;
 65e:	4981                	li	s3,0
 660:	bf85                	j	5d0 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 662:	008b0793          	addi	a5,s6,8
 666:	f8f43423          	sd	a5,-120(s0)
 66a:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 66e:	03000593          	li	a1,48
 672:	8556                	mv	a0,s5
 674:	00000097          	auipc	ra,0x0
 678:	e30080e7          	jalr	-464(ra) # 4a4 <putc>
  putc(fd, 'x');
 67c:	07800593          	li	a1,120
 680:	8556                	mv	a0,s5
 682:	00000097          	auipc	ra,0x0
 686:	e22080e7          	jalr	-478(ra) # 4a4 <putc>
 68a:	896a                	mv	s2,s10
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 68c:	03c9d793          	srli	a5,s3,0x3c
 690:	97de                	add	a5,a5,s7
 692:	0007c583          	lbu	a1,0(a5)
 696:	8556                	mv	a0,s5
 698:	00000097          	auipc	ra,0x0
 69c:	e0c080e7          	jalr	-500(ra) # 4a4 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 6a0:	0992                	slli	s3,s3,0x4
 6a2:	397d                	addiw	s2,s2,-1
 6a4:	fe0914e3          	bnez	s2,68c <vprintf+0x11c>
        printptr(fd, va_arg(ap, uint64));
 6a8:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 6ac:	4981                	li	s3,0
 6ae:	b70d                	j	5d0 <vprintf+0x60>
        s = va_arg(ap, char*);
 6b0:	008b0913          	addi	s2,s6,8
 6b4:	000b3983          	ld	s3,0(s6)
        if(s == 0)
 6b8:	02098163          	beqz	s3,6da <vprintf+0x16a>
        while(*s != 0){
 6bc:	0009c583          	lbu	a1,0(s3)
 6c0:	c5ad                	beqz	a1,72a <vprintf+0x1ba>
          putc(fd, *s);
 6c2:	8556                	mv	a0,s5
 6c4:	00000097          	auipc	ra,0x0
 6c8:	de0080e7          	jalr	-544(ra) # 4a4 <putc>
          s++;
 6cc:	0985                	addi	s3,s3,1
        while(*s != 0){
 6ce:	0009c583          	lbu	a1,0(s3)
 6d2:	f9e5                	bnez	a1,6c2 <vprintf+0x152>
        s = va_arg(ap, char*);
 6d4:	8b4a                	mv	s6,s2
      state = 0;
 6d6:	4981                	li	s3,0
 6d8:	bde5                	j	5d0 <vprintf+0x60>
          s = "(null)";
 6da:	00000997          	auipc	s3,0x0
 6de:	3be98993          	addi	s3,s3,958 # a98 <malloc+0x264>
        while(*s != 0){
 6e2:	85ee                	mv	a1,s11
 6e4:	bff9                	j	6c2 <vprintf+0x152>
        putc(fd, va_arg(ap, uint));
 6e6:	008b0913          	addi	s2,s6,8
 6ea:	000b4583          	lbu	a1,0(s6)
 6ee:	8556                	mv	a0,s5
 6f0:	00000097          	auipc	ra,0x0
 6f4:	db4080e7          	jalr	-588(ra) # 4a4 <putc>
 6f8:	8b4a                	mv	s6,s2
      state = 0;
 6fa:	4981                	li	s3,0
 6fc:	bdd1                	j	5d0 <vprintf+0x60>
        putc(fd, c);
 6fe:	85d2                	mv	a1,s4
 700:	8556                	mv	a0,s5
 702:	00000097          	auipc	ra,0x0
 706:	da2080e7          	jalr	-606(ra) # 4a4 <putc>
      state = 0;
 70a:	4981                	li	s3,0
 70c:	b5d1                	j	5d0 <vprintf+0x60>
        putc(fd, '%');
 70e:	85d2                	mv	a1,s4
 710:	8556                	mv	a0,s5
 712:	00000097          	auipc	ra,0x0
 716:	d92080e7          	jalr	-622(ra) # 4a4 <putc>
        putc(fd, c);
 71a:	85ca                	mv	a1,s2
 71c:	8556                	mv	a0,s5
 71e:	00000097          	auipc	ra,0x0
 722:	d86080e7          	jalr	-634(ra) # 4a4 <putc>
      state = 0;
 726:	4981                	li	s3,0
 728:	b565                	j	5d0 <vprintf+0x60>
        s = va_arg(ap, char*);
 72a:	8b4a                	mv	s6,s2
      state = 0;
 72c:	4981                	li	s3,0
 72e:	b54d                	j	5d0 <vprintf+0x60>
    }
  }
}
 730:	70e6                	ld	ra,120(sp)
 732:	7446                	ld	s0,112(sp)
 734:	74a6                	ld	s1,104(sp)
 736:	7906                	ld	s2,96(sp)
 738:	69e6                	ld	s3,88(sp)
 73a:	6a46                	ld	s4,80(sp)
 73c:	6aa6                	ld	s5,72(sp)
 73e:	6b06                	ld	s6,64(sp)
 740:	7be2                	ld	s7,56(sp)
 742:	7c42                	ld	s8,48(sp)
 744:	7ca2                	ld	s9,40(sp)
 746:	7d02                	ld	s10,32(sp)
 748:	6de2                	ld	s11,24(sp)
 74a:	6109                	addi	sp,sp,128
 74c:	8082                	ret

000000000000074e <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 74e:	715d                	addi	sp,sp,-80
 750:	ec06                	sd	ra,24(sp)
 752:	e822                	sd	s0,16(sp)
 754:	1000                	addi	s0,sp,32
 756:	e010                	sd	a2,0(s0)
 758:	e414                	sd	a3,8(s0)
 75a:	e818                	sd	a4,16(s0)
 75c:	ec1c                	sd	a5,24(s0)
 75e:	03043023          	sd	a6,32(s0)
 762:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 766:	8622                	mv	a2,s0
 768:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 76c:	00000097          	auipc	ra,0x0
 770:	e04080e7          	jalr	-508(ra) # 570 <vprintf>
}
 774:	60e2                	ld	ra,24(sp)
 776:	6442                	ld	s0,16(sp)
 778:	6161                	addi	sp,sp,80
 77a:	8082                	ret

000000000000077c <printf>:

void
printf(const char *fmt, ...)
{
 77c:	711d                	addi	sp,sp,-96
 77e:	ec06                	sd	ra,24(sp)
 780:	e822                	sd	s0,16(sp)
 782:	1000                	addi	s0,sp,32
 784:	e40c                	sd	a1,8(s0)
 786:	e810                	sd	a2,16(s0)
 788:	ec14                	sd	a3,24(s0)
 78a:	f018                	sd	a4,32(s0)
 78c:	f41c                	sd	a5,40(s0)
 78e:	03043823          	sd	a6,48(s0)
 792:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 796:	00840613          	addi	a2,s0,8
 79a:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 79e:	85aa                	mv	a1,a0
 7a0:	4505                	li	a0,1
 7a2:	00000097          	auipc	ra,0x0
 7a6:	dce080e7          	jalr	-562(ra) # 570 <vprintf>
}
 7aa:	60e2                	ld	ra,24(sp)
 7ac:	6442                	ld	s0,16(sp)
 7ae:	6125                	addi	sp,sp,96
 7b0:	8082                	ret

00000000000007b2 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7b2:	1141                	addi	sp,sp,-16
 7b4:	e422                	sd	s0,8(sp)
 7b6:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7b8:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7bc:	00000797          	auipc	a5,0x0
 7c0:	46c7b783          	ld	a5,1132(a5) # c28 <freep>
 7c4:	a02d                	j	7ee <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 7c6:	4618                	lw	a4,8(a2)
 7c8:	9f2d                	addw	a4,a4,a1
 7ca:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 7ce:	6398                	ld	a4,0(a5)
 7d0:	6310                	ld	a2,0(a4)
 7d2:	a83d                	j	810 <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 7d4:	ff852703          	lw	a4,-8(a0)
 7d8:	9f31                	addw	a4,a4,a2
 7da:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 7dc:	ff053683          	ld	a3,-16(a0)
 7e0:	a091                	j	824 <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7e2:	6398                	ld	a4,0(a5)
 7e4:	00e7e463          	bltu	a5,a4,7ec <free+0x3a>
 7e8:	00e6ea63          	bltu	a3,a4,7fc <free+0x4a>
{
 7ec:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7ee:	fed7fae3          	bgeu	a5,a3,7e2 <free+0x30>
 7f2:	6398                	ld	a4,0(a5)
 7f4:	00e6e463          	bltu	a3,a4,7fc <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7f8:	fee7eae3          	bltu	a5,a4,7ec <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
 7fc:	ff852583          	lw	a1,-8(a0)
 800:	6390                	ld	a2,0(a5)
 802:	02059813          	slli	a6,a1,0x20
 806:	01c85713          	srli	a4,a6,0x1c
 80a:	9736                	add	a4,a4,a3
 80c:	fae60de3          	beq	a2,a4,7c6 <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
 810:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 814:	4790                	lw	a2,8(a5)
 816:	02061593          	slli	a1,a2,0x20
 81a:	01c5d713          	srli	a4,a1,0x1c
 81e:	973e                	add	a4,a4,a5
 820:	fae68ae3          	beq	a3,a4,7d4 <free+0x22>
    p->s.ptr = bp->s.ptr;
 824:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 826:	00000717          	auipc	a4,0x0
 82a:	40f73123          	sd	a5,1026(a4) # c28 <freep>
}
 82e:	6422                	ld	s0,8(sp)
 830:	0141                	addi	sp,sp,16
 832:	8082                	ret

0000000000000834 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 834:	7139                	addi	sp,sp,-64
 836:	fc06                	sd	ra,56(sp)
 838:	f822                	sd	s0,48(sp)
 83a:	f426                	sd	s1,40(sp)
 83c:	f04a                	sd	s2,32(sp)
 83e:	ec4e                	sd	s3,24(sp)
 840:	e852                	sd	s4,16(sp)
 842:	e456                	sd	s5,8(sp)
 844:	e05a                	sd	s6,0(sp)
 846:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 848:	02051493          	slli	s1,a0,0x20
 84c:	9081                	srli	s1,s1,0x20
 84e:	04bd                	addi	s1,s1,15
 850:	8091                	srli	s1,s1,0x4
 852:	00148a1b          	addiw	s4,s1,1
 856:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 858:	00000517          	auipc	a0,0x0
 85c:	3d053503          	ld	a0,976(a0) # c28 <freep>
 860:	c515                	beqz	a0,88c <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 862:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 864:	4798                	lw	a4,8(a5)
 866:	04977163          	bgeu	a4,s1,8a8 <malloc+0x74>
 86a:	89d2                	mv	s3,s4
 86c:	000a071b          	sext.w	a4,s4
 870:	6685                	lui	a3,0x1
 872:	00d77363          	bgeu	a4,a3,878 <malloc+0x44>
 876:	6985                	lui	s3,0x1
 878:	00098b1b          	sext.w	s6,s3
  p = sbrk(nu * sizeof(Header));
 87c:	0049999b          	slliw	s3,s3,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 880:	00000917          	auipc	s2,0x0
 884:	3a890913          	addi	s2,s2,936 # c28 <freep>
  if(p == (char*)-1)
 888:	5afd                	li	s5,-1
 88a:	a8a5                	j	902 <malloc+0xce>
    base.s.ptr = freep = prevp = &base;
 88c:	00000797          	auipc	a5,0x0
 890:	39c78793          	addi	a5,a5,924 # c28 <freep>
 894:	00000717          	auipc	a4,0x0
 898:	39c70713          	addi	a4,a4,924 # c30 <base>
 89c:	e398                	sd	a4,0(a5)
 89e:	e798                	sd	a4,8(a5)
    base.s.size = 0;
 8a0:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a4:	87ba                	mv	a5,a4
 8a6:	b7d1                	j	86a <malloc+0x36>
      if(p->s.size == nunits)
 8a8:	02e48c63          	beq	s1,a4,8e0 <malloc+0xac>
        p->s.size -= nunits;
 8ac:	4147073b          	subw	a4,a4,s4
 8b0:	c798                	sw	a4,8(a5)
        p += p->s.size;
 8b2:	02071693          	slli	a3,a4,0x20
 8b6:	01c6d713          	srli	a4,a3,0x1c
 8ba:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 8bc:	0147a423          	sw	s4,8(a5)
      freep = prevp;
 8c0:	00000717          	auipc	a4,0x0
 8c4:	36a73423          	sd	a0,872(a4) # c28 <freep>
      return (void*)(p + 1);
 8c8:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8cc:	70e2                	ld	ra,56(sp)
 8ce:	7442                	ld	s0,48(sp)
 8d0:	74a2                	ld	s1,40(sp)
 8d2:	7902                	ld	s2,32(sp)
 8d4:	69e2                	ld	s3,24(sp)
 8d6:	6a42                	ld	s4,16(sp)
 8d8:	6aa2                	ld	s5,8(sp)
 8da:	6b02                	ld	s6,0(sp)
 8dc:	6121                	addi	sp,sp,64
 8de:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 8e0:	6398                	ld	a4,0(a5)
 8e2:	e118                	sd	a4,0(a0)
 8e4:	bff1                	j	8c0 <malloc+0x8c>
  hp->s.size = nu;
 8e6:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 8ea:	0541                	addi	a0,a0,16
 8ec:	00000097          	auipc	ra,0x0
 8f0:	ec6080e7          	jalr	-314(ra) # 7b2 <free>
  return freep;
 8f4:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 8f8:	d971                	beqz	a0,8cc <malloc+0x98>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8fa:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 8fc:	4798                	lw	a4,8(a5)
 8fe:	fa9775e3          	bgeu	a4,s1,8a8 <malloc+0x74>
    if(p == freep)
 902:	00093703          	ld	a4,0(s2)
 906:	853e                	mv	a0,a5
 908:	fef719e3          	bne	a4,a5,8fa <malloc+0xc6>
  p = sbrk(nu * sizeof(Header));
 90c:	854e                	mv	a0,s3
 90e:	00000097          	auipc	ra,0x0
 912:	b2e080e7          	jalr	-1234(ra) # 43c <sbrk>
  if(p == (char*)-1)
 916:	fd5518e3          	bne	a0,s5,8e6 <malloc+0xb2>
        return 0;
 91a:	4501                	li	a0,0
 91c:	bf45                	j	8cc <malloc+0x98>
