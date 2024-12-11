
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
  1c:	468080e7          	jalr	1128(ra) # 480 <dev>
  dup(0); // stdout
  20:	4501                	li	a0,0
  22:	00000097          	auipc	ra,0x0
  26:	42e080e7          	jalr	1070(ra) # 450 <dup>
  dup(0); // stderr
  2a:	4501                	li	a0,0
  2c:	00000097          	auipc	ra,0x0
  30:	424080e7          	jalr	1060(ra) # 450 <dup>

  for (int i = 0; i < counts; i++) {
  34:	00001797          	auipc	a5,0x1
  38:	b247a783          	lw	a5,-1244(a5) # b58 <counts>
  3c:	0ef05763          	blez	a5,12a <main+0x12a>
  40:	00001997          	auipc	s3,0x1
  44:	b2098993          	addi	s3,s3,-1248 # b60 <tests>
  48:	4901                	li	s2,0
    printf("init: starting %s\n", tests[i]);
  4a:	00001a17          	auipc	s4,0x1
  4e:	8fea0a13          	addi	s4,s4,-1794 # 948 <malloc+0xec>
  for (int i = 0; i < counts; i++) {
  52:	00001a97          	auipc	s5,0x1
  56:	b06a8a93          	addi	s5,s5,-1274 # b58 <counts>
    printf("init: starting %s\n", tests[i]);
  5a:	0009b583          	ld	a1,0(s3)
  5e:	8552                	mv	a0,s4
  60:	00000097          	auipc	ra,0x0
  64:	744080e7          	jalr	1860(ra) # 7a4 <printf>
    pid = fork();
  68:	00000097          	auipc	ra,0x0
  6c:	380080e7          	jalr	896(ra) # 3e8 <fork>
  70:	84aa                	mv	s1,a0
    if (pid < 0) {
  72:	04054463          	bltz	a0,ba <main+0xba>
      printf("init: fork failed\n");
      exit(1);
    }
    if (pid == 0) {
  76:	cd39                	beqz	a0,d4 <main+0xd4>
      printf(tests[i]);
      printf(" failed exec %s\n", tests[i]);
      exit(1);
    }
    else{
      wait((int*)0);
  78:	4501                	li	a0,0
  7a:	00000097          	auipc	ra,0x0
  7e:	37e080e7          	jalr	894(ra) # 3f8 <wait>
  for (int i = 0; i < counts; i++) {
  82:	2905                	addiw	s2,s2,1
  84:	09a1                	addi	s3,s3,8
  86:	000aa783          	lw	a5,0(s5)
  8a:	fcf948e3          	blt	s2,a5,5a <main+0x5a>
    }
  }
  for(;;){
    wpid = wait((int *) 0);
  8e:	4501                	li	a0,0
  90:	00000097          	auipc	ra,0x0
  94:	368080e7          	jalr	872(ra) # 3f8 <wait>
    if(wpid == pid){
  98:	08950b63          	beq	a0,s1,12e <main+0x12e>
      // the shell exited; restart it.
      break;
    } else if(wpid < 0){
  9c:	fe0559e3          	bgez	a0,8e <main+0x8e>
      printf("init: wait returned an error\n");
  a0:	00001517          	auipc	a0,0x1
  a4:	90050513          	addi	a0,a0,-1792 # 9a0 <malloc+0x144>
  a8:	00000097          	auipc	ra,0x0
  ac:	6fc080e7          	jalr	1788(ra) # 7a4 <printf>
      exit(1);
  b0:	4505                	li	a0,1
  b2:	00000097          	auipc	ra,0x0
  b6:	33e080e7          	jalr	830(ra) # 3f0 <exit>
      printf("init: fork failed\n");
  ba:	00001517          	auipc	a0,0x1
  be:	8a650513          	addi	a0,a0,-1882 # 960 <malloc+0x104>
  c2:	00000097          	auipc	ra,0x0
  c6:	6e2080e7          	jalr	1762(ra) # 7a4 <printf>
      exit(1);
  ca:	4505                	li	a0,1
  cc:	00000097          	auipc	ra,0x0
  d0:	324080e7          	jalr	804(ra) # 3f0 <exit>
      exec(tests[i], argv);
  d4:	090e                	slli	s2,s2,0x3
  d6:	00001497          	auipc	s1,0x1
  da:	a8a48493          	addi	s1,s1,-1398 # b60 <tests>
  de:	94ca                	add	s1,s1,s2
  e0:	00001597          	auipc	a1,0x1
  e4:	b8858593          	addi	a1,a1,-1144 # c68 <argv>
  e8:	6088                	ld	a0,0(s1)
  ea:	00000097          	auipc	ra,0x0
  ee:	33e080e7          	jalr	830(ra) # 428 <exec>
      printf("init: exec %s",tests[i]);
  f2:	608c                	ld	a1,0(s1)
  f4:	00001517          	auipc	a0,0x1
  f8:	88450513          	addi	a0,a0,-1916 # 978 <malloc+0x11c>
  fc:	00000097          	auipc	ra,0x0
 100:	6a8080e7          	jalr	1704(ra) # 7a4 <printf>
      printf(tests[i]);
 104:	6088                	ld	a0,0(s1)
 106:	00000097          	auipc	ra,0x0
 10a:	69e080e7          	jalr	1694(ra) # 7a4 <printf>
      printf(" failed exec %s\n", tests[i]);
 10e:	608c                	ld	a1,0(s1)
 110:	00001517          	auipc	a0,0x1
 114:	87850513          	addi	a0,a0,-1928 # 988 <malloc+0x12c>
 118:	00000097          	auipc	ra,0x0
 11c:	68c080e7          	jalr	1676(ra) # 7a4 <printf>
      exit(1);
 120:	4505                	li	a0,1
 122:	00000097          	auipc	ra,0x0
 126:	2ce080e7          	jalr	718(ra) # 3f0 <exit>
  int pid=0, wpid=0;
 12a:	4481                	li	s1,0
 12c:	b78d                	j	8e <main+0x8e>
    } else {
      // it was a parentless process; do nothing.
    }
  }
  exit(-1);
 12e:	557d                	li	a0,-1
 130:	00000097          	auipc	ra,0x0
 134:	2c0080e7          	jalr	704(ra) # 3f0 <exit>

0000000000000138 <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
 138:	1141                	addi	sp,sp,-16
 13a:	e422                	sd	s0,8(sp)
 13c:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 13e:	87aa                	mv	a5,a0
 140:	0585                	addi	a1,a1,1
 142:	0785                	addi	a5,a5,1
 144:	fff5c703          	lbu	a4,-1(a1)
 148:	fee78fa3          	sb	a4,-1(a5)
 14c:	fb75                	bnez	a4,140 <strcpy+0x8>
    ;
  return os;
}
 14e:	6422                	ld	s0,8(sp)
 150:	0141                	addi	sp,sp,16
 152:	8082                	ret

0000000000000154 <strcat>:

char*
strcat(char *s, const char *t)
{
 154:	1141                	addi	sp,sp,-16
 156:	e422                	sd	s0,8(sp)
 158:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
 15a:	00054783          	lbu	a5,0(a0)
 15e:	c385                	beqz	a5,17e <strcat+0x2a>
 160:	87aa                	mv	a5,a0
    s++;
 162:	0785                	addi	a5,a5,1
  while(*s)
 164:	0007c703          	lbu	a4,0(a5)
 168:	ff6d                	bnez	a4,162 <strcat+0xe>
  while((*s++ = *t++))
 16a:	0585                	addi	a1,a1,1
 16c:	0785                	addi	a5,a5,1
 16e:	fff5c703          	lbu	a4,-1(a1)
 172:	fee78fa3          	sb	a4,-1(a5)
 176:	fb75                	bnez	a4,16a <strcat+0x16>
    ;
  return os;
}
 178:	6422                	ld	s0,8(sp)
 17a:	0141                	addi	sp,sp,16
 17c:	8082                	ret
  while(*s)
 17e:	87aa                	mv	a5,a0
 180:	b7ed                	j	16a <strcat+0x16>

0000000000000182 <strcmp>:


int
strcmp(const char *p, const char *q)
{
 182:	1141                	addi	sp,sp,-16
 184:	e422                	sd	s0,8(sp)
 186:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 188:	00054783          	lbu	a5,0(a0)
 18c:	cb91                	beqz	a5,1a0 <strcmp+0x1e>
 18e:	0005c703          	lbu	a4,0(a1)
 192:	00f71763          	bne	a4,a5,1a0 <strcmp+0x1e>
    p++, q++;
 196:	0505                	addi	a0,a0,1
 198:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 19a:	00054783          	lbu	a5,0(a0)
 19e:	fbe5                	bnez	a5,18e <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 1a0:	0005c503          	lbu	a0,0(a1)
}
 1a4:	40a7853b          	subw	a0,a5,a0
 1a8:	6422                	ld	s0,8(sp)
 1aa:	0141                	addi	sp,sp,16
 1ac:	8082                	ret

00000000000001ae <strlen>:

uint
strlen(const char *s)
{
 1ae:	1141                	addi	sp,sp,-16
 1b0:	e422                	sd	s0,8(sp)
 1b2:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 1b4:	00054783          	lbu	a5,0(a0)
 1b8:	cf91                	beqz	a5,1d4 <strlen+0x26>
 1ba:	0505                	addi	a0,a0,1
 1bc:	87aa                	mv	a5,a0
 1be:	4685                	li	a3,1
 1c0:	9e89                	subw	a3,a3,a0
 1c2:	00f6853b          	addw	a0,a3,a5
 1c6:	0785                	addi	a5,a5,1
 1c8:	fff7c703          	lbu	a4,-1(a5)
 1cc:	fb7d                	bnez	a4,1c2 <strlen+0x14>
    ;
  return n;
}
 1ce:	6422                	ld	s0,8(sp)
 1d0:	0141                	addi	sp,sp,16
 1d2:	8082                	ret
  for(n = 0; s[n]; n++)
 1d4:	4501                	li	a0,0
 1d6:	bfe5                	j	1ce <strlen+0x20>

00000000000001d8 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1d8:	1141                	addi	sp,sp,-16
 1da:	e422                	sd	s0,8(sp)
 1dc:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 1de:	ca19                	beqz	a2,1f4 <memset+0x1c>
 1e0:	87aa                	mv	a5,a0
 1e2:	1602                	slli	a2,a2,0x20
 1e4:	9201                	srli	a2,a2,0x20
 1e6:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 1ea:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 1ee:	0785                	addi	a5,a5,1
 1f0:	fee79de3          	bne	a5,a4,1ea <memset+0x12>
  }
  return dst;
}
 1f4:	6422                	ld	s0,8(sp)
 1f6:	0141                	addi	sp,sp,16
 1f8:	8082                	ret

00000000000001fa <strchr>:

char*
strchr(const char *s, char c)
{
 1fa:	1141                	addi	sp,sp,-16
 1fc:	e422                	sd	s0,8(sp)
 1fe:	0800                	addi	s0,sp,16
  for(; *s; s++)
 200:	00054783          	lbu	a5,0(a0)
 204:	cb99                	beqz	a5,21a <strchr+0x20>
    if(*s == c)
 206:	00f58763          	beq	a1,a5,214 <strchr+0x1a>
  for(; *s; s++)
 20a:	0505                	addi	a0,a0,1
 20c:	00054783          	lbu	a5,0(a0)
 210:	fbfd                	bnez	a5,206 <strchr+0xc>
      return (char*)s;
  return 0;
 212:	4501                	li	a0,0
}
 214:	6422                	ld	s0,8(sp)
 216:	0141                	addi	sp,sp,16
 218:	8082                	ret
  return 0;
 21a:	4501                	li	a0,0
 21c:	bfe5                	j	214 <strchr+0x1a>

000000000000021e <gets>:

char*
gets(char *buf, int max)
{
 21e:	711d                	addi	sp,sp,-96
 220:	ec86                	sd	ra,88(sp)
 222:	e8a2                	sd	s0,80(sp)
 224:	e4a6                	sd	s1,72(sp)
 226:	e0ca                	sd	s2,64(sp)
 228:	fc4e                	sd	s3,56(sp)
 22a:	f852                	sd	s4,48(sp)
 22c:	f456                	sd	s5,40(sp)
 22e:	f05a                	sd	s6,32(sp)
 230:	ec5e                	sd	s7,24(sp)
 232:	e862                	sd	s8,16(sp)
 234:	1080                	addi	s0,sp,96
 236:	8baa                	mv	s7,a0
 238:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 23a:	892a                	mv	s2,a0
 23c:	4481                	li	s1,0
    cc = read(0, &c, 1);
 23e:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 242:	4b29                	li	s6,10
 244:	4c35                	li	s8,13
  for(i=0; i+1 < max; ){
 246:	89a6                	mv	s3,s1
 248:	2485                	addiw	s1,s1,1
 24a:	0344d763          	bge	s1,s4,278 <gets+0x5a>
    cc = read(0, &c, 1);
 24e:	4605                	li	a2,1
 250:	85d6                	mv	a1,s5
 252:	4501                	li	a0,0
 254:	00000097          	auipc	ra,0x0
 258:	1b4080e7          	jalr	436(ra) # 408 <read>
    if(cc < 1)
 25c:	00a05e63          	blez	a0,278 <gets+0x5a>
    buf[i++] = c;
 260:	faf44783          	lbu	a5,-81(s0)
 264:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 268:	01678763          	beq	a5,s6,276 <gets+0x58>
 26c:	0905                	addi	s2,s2,1
 26e:	fd879ce3          	bne	a5,s8,246 <gets+0x28>
  for(i=0; i+1 < max; ){
 272:	89a6                	mv	s3,s1
 274:	a011                	j	278 <gets+0x5a>
 276:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 278:	99de                	add	s3,s3,s7
 27a:	00098023          	sb	zero,0(s3)
  return buf;
}
 27e:	855e                	mv	a0,s7
 280:	60e6                	ld	ra,88(sp)
 282:	6446                	ld	s0,80(sp)
 284:	64a6                	ld	s1,72(sp)
 286:	6906                	ld	s2,64(sp)
 288:	79e2                	ld	s3,56(sp)
 28a:	7a42                	ld	s4,48(sp)
 28c:	7aa2                	ld	s5,40(sp)
 28e:	7b02                	ld	s6,32(sp)
 290:	6be2                	ld	s7,24(sp)
 292:	6c42                	ld	s8,16(sp)
 294:	6125                	addi	sp,sp,96
 296:	8082                	ret

0000000000000298 <stat>:

int
stat(const char *n, struct stat *st)
{
 298:	1101                	addi	sp,sp,-32
 29a:	ec06                	sd	ra,24(sp)
 29c:	e822                	sd	s0,16(sp)
 29e:	e426                	sd	s1,8(sp)
 2a0:	e04a                	sd	s2,0(sp)
 2a2:	1000                	addi	s0,sp,32
 2a4:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2a6:	4581                	li	a1,0
 2a8:	00000097          	auipc	ra,0x0
 2ac:	188080e7          	jalr	392(ra) # 430 <open>
  if(fd < 0)
 2b0:	02054563          	bltz	a0,2da <stat+0x42>
 2b4:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 2b6:	85ca                	mv	a1,s2
 2b8:	00000097          	auipc	ra,0x0
 2bc:	180080e7          	jalr	384(ra) # 438 <fstat>
 2c0:	892a                	mv	s2,a0
  close(fd);
 2c2:	8526                	mv	a0,s1
 2c4:	00000097          	auipc	ra,0x0
 2c8:	154080e7          	jalr	340(ra) # 418 <close>
  return r;
}
 2cc:	854a                	mv	a0,s2
 2ce:	60e2                	ld	ra,24(sp)
 2d0:	6442                	ld	s0,16(sp)
 2d2:	64a2                	ld	s1,8(sp)
 2d4:	6902                	ld	s2,0(sp)
 2d6:	6105                	addi	sp,sp,32
 2d8:	8082                	ret
    return -1;
 2da:	597d                	li	s2,-1
 2dc:	bfc5                	j	2cc <stat+0x34>

00000000000002de <atoi>:

int
atoi(const char *s)
{
 2de:	1141                	addi	sp,sp,-16
 2e0:	e422                	sd	s0,8(sp)
 2e2:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 2e4:	00054703          	lbu	a4,0(a0)
 2e8:	02d00793          	li	a5,45
  int neg = 1;
 2ec:	4585                	li	a1,1
  if (*s == '-') {
 2ee:	04f70363          	beq	a4,a5,334 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 2f2:	00054703          	lbu	a4,0(a0)
 2f6:	fd07079b          	addiw	a5,a4,-48
 2fa:	0ff7f793          	zext.b	a5,a5
 2fe:	46a5                	li	a3,9
 300:	02f6ed63          	bltu	a3,a5,33a <atoi+0x5c>
  n = 0;
 304:	4681                	li	a3,0
  while('0' <= *s && *s <= '9')
 306:	4625                	li	a2,9
    n = n*10 + *s++ - '0';
 308:	0505                	addi	a0,a0,1
 30a:	0026979b          	slliw	a5,a3,0x2
 30e:	9fb5                	addw	a5,a5,a3
 310:	0017979b          	slliw	a5,a5,0x1
 314:	9fb9                	addw	a5,a5,a4
 316:	fd07869b          	addiw	a3,a5,-48
  while('0' <= *s && *s <= '9')
 31a:	00054703          	lbu	a4,0(a0)
 31e:	fd07079b          	addiw	a5,a4,-48
 322:	0ff7f793          	zext.b	a5,a5
 326:	fef671e3          	bgeu	a2,a5,308 <atoi+0x2a>
  return n * neg;
}
 32a:	02d5853b          	mulw	a0,a1,a3
 32e:	6422                	ld	s0,8(sp)
 330:	0141                	addi	sp,sp,16
 332:	8082                	ret
    s++;
 334:	0505                	addi	a0,a0,1
    neg = -1;
 336:	55fd                	li	a1,-1
 338:	bf6d                	j	2f2 <atoi+0x14>
  n = 0;
 33a:	4681                	li	a3,0
 33c:	b7fd                	j	32a <atoi+0x4c>

000000000000033e <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 33e:	1141                	addi	sp,sp,-16
 340:	e422                	sd	s0,8(sp)
 342:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 344:	02b57463          	bgeu	a0,a1,36c <memmove+0x2e>
    while(n-- > 0)
 348:	00c05f63          	blez	a2,366 <memmove+0x28>
 34c:	1602                	slli	a2,a2,0x20
 34e:	9201                	srli	a2,a2,0x20
 350:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 354:	872a                	mv	a4,a0
      *dst++ = *src++;
 356:	0585                	addi	a1,a1,1
 358:	0705                	addi	a4,a4,1
 35a:	fff5c683          	lbu	a3,-1(a1)
 35e:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 362:	fee79ae3          	bne	a5,a4,356 <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 366:	6422                	ld	s0,8(sp)
 368:	0141                	addi	sp,sp,16
 36a:	8082                	ret
    dst += n;
 36c:	00c50733          	add	a4,a0,a2
    src += n;
 370:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 372:	fec05ae3          	blez	a2,366 <memmove+0x28>
 376:	fff6079b          	addiw	a5,a2,-1
 37a:	1782                	slli	a5,a5,0x20
 37c:	9381                	srli	a5,a5,0x20
 37e:	fff7c793          	not	a5,a5
 382:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 384:	15fd                	addi	a1,a1,-1
 386:	177d                	addi	a4,a4,-1
 388:	0005c683          	lbu	a3,0(a1)
 38c:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 390:	fee79ae3          	bne	a5,a4,384 <memmove+0x46>
 394:	bfc9                	j	366 <memmove+0x28>

0000000000000396 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 396:	1141                	addi	sp,sp,-16
 398:	e422                	sd	s0,8(sp)
 39a:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 39c:	ca05                	beqz	a2,3cc <memcmp+0x36>
 39e:	fff6069b          	addiw	a3,a2,-1
 3a2:	1682                	slli	a3,a3,0x20
 3a4:	9281                	srli	a3,a3,0x20
 3a6:	0685                	addi	a3,a3,1
 3a8:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 3aa:	00054783          	lbu	a5,0(a0)
 3ae:	0005c703          	lbu	a4,0(a1)
 3b2:	00e79863          	bne	a5,a4,3c2 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 3b6:	0505                	addi	a0,a0,1
    p2++;
 3b8:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 3ba:	fed518e3          	bne	a0,a3,3aa <memcmp+0x14>
  }
  return 0;
 3be:	4501                	li	a0,0
 3c0:	a019                	j	3c6 <memcmp+0x30>
      return *p1 - *p2;
 3c2:	40e7853b          	subw	a0,a5,a4
}
 3c6:	6422                	ld	s0,8(sp)
 3c8:	0141                	addi	sp,sp,16
 3ca:	8082                	ret
  return 0;
 3cc:	4501                	li	a0,0
 3ce:	bfe5                	j	3c6 <memcmp+0x30>

00000000000003d0 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 3d0:	1141                	addi	sp,sp,-16
 3d2:	e406                	sd	ra,8(sp)
 3d4:	e022                	sd	s0,0(sp)
 3d6:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 3d8:	00000097          	auipc	ra,0x0
 3dc:	f66080e7          	jalr	-154(ra) # 33e <memmove>
}
 3e0:	60a2                	ld	ra,8(sp)
 3e2:	6402                	ld	s0,0(sp)
 3e4:	0141                	addi	sp,sp,16
 3e6:	8082                	ret

00000000000003e8 <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 3e8:	4885                	li	a7,1
 ecall
 3ea:	00000073          	ecall
 ret
 3ee:	8082                	ret

00000000000003f0 <exit>:
.global exit
exit:
 li a7, SYS_exit
 3f0:	4889                	li	a7,2
 ecall
 3f2:	00000073          	ecall
 ret
 3f6:	8082                	ret

00000000000003f8 <wait>:
.global wait
wait:
 li a7, SYS_wait
 3f8:	488d                	li	a7,3
 ecall
 3fa:	00000073          	ecall
 ret
 3fe:	8082                	ret

0000000000000400 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 400:	4891                	li	a7,4
 ecall
 402:	00000073          	ecall
 ret
 406:	8082                	ret

0000000000000408 <read>:
.global read
read:
 li a7, SYS_read
 408:	4895                	li	a7,5
 ecall
 40a:	00000073          	ecall
 ret
 40e:	8082                	ret

0000000000000410 <write>:
.global write
write:
 li a7, SYS_write
 410:	48c1                	li	a7,16
 ecall
 412:	00000073          	ecall
 ret
 416:	8082                	ret

0000000000000418 <close>:
.global close
close:
 li a7, SYS_close
 418:	48d5                	li	a7,21
 ecall
 41a:	00000073          	ecall
 ret
 41e:	8082                	ret

0000000000000420 <kill>:
.global kill
kill:
 li a7, SYS_kill
 420:	4899                	li	a7,6
 ecall
 422:	00000073          	ecall
 ret
 426:	8082                	ret

0000000000000428 <exec>:
.global exec
exec:
 li a7, SYS_exec
 428:	489d                	li	a7,7
 ecall
 42a:	00000073          	ecall
 ret
 42e:	8082                	ret

0000000000000430 <open>:
.global open
open:
 li a7, SYS_open
 430:	48bd                	li	a7,15
 ecall
 432:	00000073          	ecall
 ret
 436:	8082                	ret

0000000000000438 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 438:	48a1                	li	a7,8
 ecall
 43a:	00000073          	ecall
 ret
 43e:	8082                	ret

0000000000000440 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 440:	48d1                	li	a7,20
 ecall
 442:	00000073          	ecall
 ret
 446:	8082                	ret

0000000000000448 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 448:	48a5                	li	a7,9
 ecall
 44a:	00000073          	ecall
 ret
 44e:	8082                	ret

0000000000000450 <dup>:
.global dup
dup:
 li a7, SYS_dup
 450:	48a9                	li	a7,10
 ecall
 452:	00000073          	ecall
 ret
 456:	8082                	ret

0000000000000458 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 458:	48ad                	li	a7,11
 ecall
 45a:	00000073          	ecall
 ret
 45e:	8082                	ret

0000000000000460 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 460:	48b1                	li	a7,12
 ecall
 462:	00000073          	ecall
 ret
 466:	8082                	ret

0000000000000468 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 468:	48b5                	li	a7,13
 ecall
 46a:	00000073          	ecall
 ret
 46e:	8082                	ret

0000000000000470 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 470:	48b9                	li	a7,14
 ecall
 472:	00000073          	ecall
 ret
 476:	8082                	ret

0000000000000478 <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 478:	48d9                	li	a7,22
 ecall
 47a:	00000073          	ecall
 ret
 47e:	8082                	ret

0000000000000480 <dev>:
.global dev
dev:
 li a7, SYS_dev
 480:	48dd                	li	a7,23
 ecall
 482:	00000073          	ecall
 ret
 486:	8082                	ret

0000000000000488 <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 488:	48e1                	li	a7,24
 ecall
 48a:	00000073          	ecall
 ret
 48e:	8082                	ret

0000000000000490 <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 490:	48e5                	li	a7,25
 ecall
 492:	00000073          	ecall
 ret
 496:	8082                	ret

0000000000000498 <remove>:
.global remove
remove:
 li a7, SYS_remove
 498:	48c5                	li	a7,17
 ecall
 49a:	00000073          	ecall
 ret
 49e:	8082                	ret

00000000000004a0 <trace>:
.global trace
trace:
 li a7, SYS_trace
 4a0:	48c9                	li	a7,18
 ecall
 4a2:	00000073          	ecall
 ret
 4a6:	8082                	ret

00000000000004a8 <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 4a8:	48cd                	li	a7,19
 ecall
 4aa:	00000073          	ecall
 ret
 4ae:	8082                	ret

00000000000004b0 <rename>:
.global rename
rename:
 li a7, SYS_rename
 4b0:	48e9                	li	a7,26
 ecall
 4b2:	00000073          	ecall
 ret
 4b6:	8082                	ret

00000000000004b8 <poweroff>:
.global poweroff
poweroff:
 li a7, SYS_poweroff
 4b8:	0d200893          	li	a7,210
 ecall
 4bc:	00000073          	ecall
 ret
 4c0:	8082                	ret

00000000000004c2 <mkdirat>:
.global mkdirat
mkdirat:
 li a7, SYS_mkdirat
 4c2:	02200893          	li	a7,34
 ecall
 4c6:	00000073          	ecall
 ret
 4ca:	8082                	ret

00000000000004cc <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 4cc:	1101                	addi	sp,sp,-32
 4ce:	ec06                	sd	ra,24(sp)
 4d0:	e822                	sd	s0,16(sp)
 4d2:	1000                	addi	s0,sp,32
 4d4:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 4d8:	4605                	li	a2,1
 4da:	fef40593          	addi	a1,s0,-17
 4de:	00000097          	auipc	ra,0x0
 4e2:	f32080e7          	jalr	-206(ra) # 410 <write>
}
 4e6:	60e2                	ld	ra,24(sp)
 4e8:	6442                	ld	s0,16(sp)
 4ea:	6105                	addi	sp,sp,32
 4ec:	8082                	ret

00000000000004ee <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4ee:	7139                	addi	sp,sp,-64
 4f0:	fc06                	sd	ra,56(sp)
 4f2:	f822                	sd	s0,48(sp)
 4f4:	f426                	sd	s1,40(sp)
 4f6:	f04a                	sd	s2,32(sp)
 4f8:	ec4e                	sd	s3,24(sp)
 4fa:	0080                	addi	s0,sp,64
 4fc:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4fe:	c299                	beqz	a3,504 <printint+0x16>
 500:	0805c863          	bltz	a1,590 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 504:	2581                	sext.w	a1,a1
  neg = 0;
 506:	4881                	li	a7,0
  }

  i = 0;
 508:	fc040993          	addi	s3,s0,-64
  neg = 0;
 50c:	86ce                	mv	a3,s3
  i = 0;
 50e:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 510:	2601                	sext.w	a2,a2
 512:	00000517          	auipc	a0,0x0
 516:	62e50513          	addi	a0,a0,1582 # b40 <digits>
 51a:	883a                	mv	a6,a4
 51c:	2705                	addiw	a4,a4,1
 51e:	02c5f7bb          	remuw	a5,a1,a2
 522:	1782                	slli	a5,a5,0x20
 524:	9381                	srli	a5,a5,0x20
 526:	97aa                	add	a5,a5,a0
 528:	0007c783          	lbu	a5,0(a5)
 52c:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 530:	0005879b          	sext.w	a5,a1
 534:	02c5d5bb          	divuw	a1,a1,a2
 538:	0685                	addi	a3,a3,1
 53a:	fec7f0e3          	bgeu	a5,a2,51a <printint+0x2c>
  if(neg)
 53e:	00088c63          	beqz	a7,556 <printint+0x68>
    buf[i++] = '-';
 542:	fd070793          	addi	a5,a4,-48
 546:	00878733          	add	a4,a5,s0
 54a:	02d00793          	li	a5,45
 54e:	fef70823          	sb	a5,-16(a4)
 552:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 556:	02e05663          	blez	a4,582 <printint+0x94>
 55a:	fc040913          	addi	s2,s0,-64
 55e:	993a                	add	s2,s2,a4
 560:	19fd                	addi	s3,s3,-1
 562:	99ba                	add	s3,s3,a4
 564:	377d                	addiw	a4,a4,-1
 566:	1702                	slli	a4,a4,0x20
 568:	9301                	srli	a4,a4,0x20
 56a:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 56e:	fff94583          	lbu	a1,-1(s2)
 572:	8526                	mv	a0,s1
 574:	00000097          	auipc	ra,0x0
 578:	f58080e7          	jalr	-168(ra) # 4cc <putc>
  while(--i >= 0)
 57c:	197d                	addi	s2,s2,-1
 57e:	ff3918e3          	bne	s2,s3,56e <printint+0x80>
}
 582:	70e2                	ld	ra,56(sp)
 584:	7442                	ld	s0,48(sp)
 586:	74a2                	ld	s1,40(sp)
 588:	7902                	ld	s2,32(sp)
 58a:	69e2                	ld	s3,24(sp)
 58c:	6121                	addi	sp,sp,64
 58e:	8082                	ret
    x = -xx;
 590:	40b005bb          	negw	a1,a1
    neg = 1;
 594:	4885                	li	a7,1
    x = -xx;
 596:	bf8d                	j	508 <printint+0x1a>

0000000000000598 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 598:	7119                	addi	sp,sp,-128
 59a:	fc86                	sd	ra,120(sp)
 59c:	f8a2                	sd	s0,112(sp)
 59e:	f4a6                	sd	s1,104(sp)
 5a0:	f0ca                	sd	s2,96(sp)
 5a2:	ecce                	sd	s3,88(sp)
 5a4:	e8d2                	sd	s4,80(sp)
 5a6:	e4d6                	sd	s5,72(sp)
 5a8:	e0da                	sd	s6,64(sp)
 5aa:	fc5e                	sd	s7,56(sp)
 5ac:	f862                	sd	s8,48(sp)
 5ae:	f466                	sd	s9,40(sp)
 5b0:	f06a                	sd	s10,32(sp)
 5b2:	ec6e                	sd	s11,24(sp)
 5b4:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 5b6:	0005c903          	lbu	s2,0(a1)
 5ba:	18090f63          	beqz	s2,758 <vprintf+0x1c0>
 5be:	8aaa                	mv	s5,a0
 5c0:	8b32                	mv	s6,a2
 5c2:	00158493          	addi	s1,a1,1
  state = 0;
 5c6:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 5c8:	02500a13          	li	s4,37
 5cc:	4c55                	li	s8,21
 5ce:	00000c97          	auipc	s9,0x0
 5d2:	51ac8c93          	addi	s9,s9,1306 # ae8 <malloc+0x28c>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
        s = va_arg(ap, char*);
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5d6:	02800d93          	li	s11,40
  putc(fd, 'x');
 5da:	4d41                	li	s10,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 5dc:	00000b97          	auipc	s7,0x0
 5e0:	564b8b93          	addi	s7,s7,1380 # b40 <digits>
 5e4:	a839                	j	602 <vprintf+0x6a>
        putc(fd, c);
 5e6:	85ca                	mv	a1,s2
 5e8:	8556                	mv	a0,s5
 5ea:	00000097          	auipc	ra,0x0
 5ee:	ee2080e7          	jalr	-286(ra) # 4cc <putc>
 5f2:	a019                	j	5f8 <vprintf+0x60>
    } else if(state == '%'){
 5f4:	01498d63          	beq	s3,s4,60e <vprintf+0x76>
  for(i = 0; fmt[i]; i++){
 5f8:	0485                	addi	s1,s1,1
 5fa:	fff4c903          	lbu	s2,-1(s1)
 5fe:	14090d63          	beqz	s2,758 <vprintf+0x1c0>
    if(state == 0){
 602:	fe0999e3          	bnez	s3,5f4 <vprintf+0x5c>
      if(c == '%'){
 606:	ff4910e3          	bne	s2,s4,5e6 <vprintf+0x4e>
        state = '%';
 60a:	89d2                	mv	s3,s4
 60c:	b7f5                	j	5f8 <vprintf+0x60>
      if(c == 'd'){
 60e:	11490c63          	beq	s2,s4,726 <vprintf+0x18e>
 612:	f9d9079b          	addiw	a5,s2,-99
 616:	0ff7f793          	zext.b	a5,a5
 61a:	10fc6e63          	bltu	s8,a5,736 <vprintf+0x19e>
 61e:	f9d9079b          	addiw	a5,s2,-99
 622:	0ff7f713          	zext.b	a4,a5
 626:	10ec6863          	bltu	s8,a4,736 <vprintf+0x19e>
 62a:	00271793          	slli	a5,a4,0x2
 62e:	97e6                	add	a5,a5,s9
 630:	439c                	lw	a5,0(a5)
 632:	97e6                	add	a5,a5,s9
 634:	8782                	jr	a5
        printint(fd, va_arg(ap, int), 10, 1);
 636:	008b0913          	addi	s2,s6,8
 63a:	4685                	li	a3,1
 63c:	4629                	li	a2,10
 63e:	000b2583          	lw	a1,0(s6)
 642:	8556                	mv	a0,s5
 644:	00000097          	auipc	ra,0x0
 648:	eaa080e7          	jalr	-342(ra) # 4ee <printint>
 64c:	8b4a                	mv	s6,s2
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 64e:	4981                	li	s3,0
 650:	b765                	j	5f8 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 652:	008b0913          	addi	s2,s6,8
 656:	4681                	li	a3,0
 658:	4629                	li	a2,10
 65a:	000b2583          	lw	a1,0(s6)
 65e:	8556                	mv	a0,s5
 660:	00000097          	auipc	ra,0x0
 664:	e8e080e7          	jalr	-370(ra) # 4ee <printint>
 668:	8b4a                	mv	s6,s2
      state = 0;
 66a:	4981                	li	s3,0
 66c:	b771                	j	5f8 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 66e:	008b0913          	addi	s2,s6,8
 672:	4681                	li	a3,0
 674:	866a                	mv	a2,s10
 676:	000b2583          	lw	a1,0(s6)
 67a:	8556                	mv	a0,s5
 67c:	00000097          	auipc	ra,0x0
 680:	e72080e7          	jalr	-398(ra) # 4ee <printint>
 684:	8b4a                	mv	s6,s2
      state = 0;
 686:	4981                	li	s3,0
 688:	bf85                	j	5f8 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 68a:	008b0793          	addi	a5,s6,8
 68e:	f8f43423          	sd	a5,-120(s0)
 692:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 696:	03000593          	li	a1,48
 69a:	8556                	mv	a0,s5
 69c:	00000097          	auipc	ra,0x0
 6a0:	e30080e7          	jalr	-464(ra) # 4cc <putc>
  putc(fd, 'x');
 6a4:	07800593          	li	a1,120
 6a8:	8556                	mv	a0,s5
 6aa:	00000097          	auipc	ra,0x0
 6ae:	e22080e7          	jalr	-478(ra) # 4cc <putc>
 6b2:	896a                	mv	s2,s10
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 6b4:	03c9d793          	srli	a5,s3,0x3c
 6b8:	97de                	add	a5,a5,s7
 6ba:	0007c583          	lbu	a1,0(a5)
 6be:	8556                	mv	a0,s5
 6c0:	00000097          	auipc	ra,0x0
 6c4:	e0c080e7          	jalr	-500(ra) # 4cc <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 6c8:	0992                	slli	s3,s3,0x4
 6ca:	397d                	addiw	s2,s2,-1
 6cc:	fe0914e3          	bnez	s2,6b4 <vprintf+0x11c>
        printptr(fd, va_arg(ap, uint64));
 6d0:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 6d4:	4981                	li	s3,0
 6d6:	b70d                	j	5f8 <vprintf+0x60>
        s = va_arg(ap, char*);
 6d8:	008b0913          	addi	s2,s6,8
 6dc:	000b3983          	ld	s3,0(s6)
        if(s == 0)
 6e0:	02098163          	beqz	s3,702 <vprintf+0x16a>
        while(*s != 0){
 6e4:	0009c583          	lbu	a1,0(s3)
 6e8:	c5ad                	beqz	a1,752 <vprintf+0x1ba>
          putc(fd, *s);
 6ea:	8556                	mv	a0,s5
 6ec:	00000097          	auipc	ra,0x0
 6f0:	de0080e7          	jalr	-544(ra) # 4cc <putc>
          s++;
 6f4:	0985                	addi	s3,s3,1
        while(*s != 0){
 6f6:	0009c583          	lbu	a1,0(s3)
 6fa:	f9e5                	bnez	a1,6ea <vprintf+0x152>
        s = va_arg(ap, char*);
 6fc:	8b4a                	mv	s6,s2
      state = 0;
 6fe:	4981                	li	s3,0
 700:	bde5                	j	5f8 <vprintf+0x60>
          s = "(null)";
 702:	00000997          	auipc	s3,0x0
 706:	3de98993          	addi	s3,s3,990 # ae0 <malloc+0x284>
        while(*s != 0){
 70a:	85ee                	mv	a1,s11
 70c:	bff9                	j	6ea <vprintf+0x152>
        putc(fd, va_arg(ap, uint));
 70e:	008b0913          	addi	s2,s6,8
 712:	000b4583          	lbu	a1,0(s6)
 716:	8556                	mv	a0,s5
 718:	00000097          	auipc	ra,0x0
 71c:	db4080e7          	jalr	-588(ra) # 4cc <putc>
 720:	8b4a                	mv	s6,s2
      state = 0;
 722:	4981                	li	s3,0
 724:	bdd1                	j	5f8 <vprintf+0x60>
        putc(fd, c);
 726:	85d2                	mv	a1,s4
 728:	8556                	mv	a0,s5
 72a:	00000097          	auipc	ra,0x0
 72e:	da2080e7          	jalr	-606(ra) # 4cc <putc>
      state = 0;
 732:	4981                	li	s3,0
 734:	b5d1                	j	5f8 <vprintf+0x60>
        putc(fd, '%');
 736:	85d2                	mv	a1,s4
 738:	8556                	mv	a0,s5
 73a:	00000097          	auipc	ra,0x0
 73e:	d92080e7          	jalr	-622(ra) # 4cc <putc>
        putc(fd, c);
 742:	85ca                	mv	a1,s2
 744:	8556                	mv	a0,s5
 746:	00000097          	auipc	ra,0x0
 74a:	d86080e7          	jalr	-634(ra) # 4cc <putc>
      state = 0;
 74e:	4981                	li	s3,0
 750:	b565                	j	5f8 <vprintf+0x60>
        s = va_arg(ap, char*);
 752:	8b4a                	mv	s6,s2
      state = 0;
 754:	4981                	li	s3,0
 756:	b54d                	j	5f8 <vprintf+0x60>
    }
  }
}
 758:	70e6                	ld	ra,120(sp)
 75a:	7446                	ld	s0,112(sp)
 75c:	74a6                	ld	s1,104(sp)
 75e:	7906                	ld	s2,96(sp)
 760:	69e6                	ld	s3,88(sp)
 762:	6a46                	ld	s4,80(sp)
 764:	6aa6                	ld	s5,72(sp)
 766:	6b06                	ld	s6,64(sp)
 768:	7be2                	ld	s7,56(sp)
 76a:	7c42                	ld	s8,48(sp)
 76c:	7ca2                	ld	s9,40(sp)
 76e:	7d02                	ld	s10,32(sp)
 770:	6de2                	ld	s11,24(sp)
 772:	6109                	addi	sp,sp,128
 774:	8082                	ret

0000000000000776 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 776:	715d                	addi	sp,sp,-80
 778:	ec06                	sd	ra,24(sp)
 77a:	e822                	sd	s0,16(sp)
 77c:	1000                	addi	s0,sp,32
 77e:	e010                	sd	a2,0(s0)
 780:	e414                	sd	a3,8(s0)
 782:	e818                	sd	a4,16(s0)
 784:	ec1c                	sd	a5,24(s0)
 786:	03043023          	sd	a6,32(s0)
 78a:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 78e:	8622                	mv	a2,s0
 790:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 794:	00000097          	auipc	ra,0x0
 798:	e04080e7          	jalr	-508(ra) # 598 <vprintf>
}
 79c:	60e2                	ld	ra,24(sp)
 79e:	6442                	ld	s0,16(sp)
 7a0:	6161                	addi	sp,sp,80
 7a2:	8082                	ret

00000000000007a4 <printf>:

void
printf(const char *fmt, ...)
{
 7a4:	711d                	addi	sp,sp,-96
 7a6:	ec06                	sd	ra,24(sp)
 7a8:	e822                	sd	s0,16(sp)
 7aa:	1000                	addi	s0,sp,32
 7ac:	e40c                	sd	a1,8(s0)
 7ae:	e810                	sd	a2,16(s0)
 7b0:	ec14                	sd	a3,24(s0)
 7b2:	f018                	sd	a4,32(s0)
 7b4:	f41c                	sd	a5,40(s0)
 7b6:	03043823          	sd	a6,48(s0)
 7ba:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 7be:	00840613          	addi	a2,s0,8
 7c2:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 7c6:	85aa                	mv	a1,a0
 7c8:	4505                	li	a0,1
 7ca:	00000097          	auipc	ra,0x0
 7ce:	dce080e7          	jalr	-562(ra) # 598 <vprintf>
}
 7d2:	60e2                	ld	ra,24(sp)
 7d4:	6442                	ld	s0,16(sp)
 7d6:	6125                	addi	sp,sp,96
 7d8:	8082                	ret

00000000000007da <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7da:	1141                	addi	sp,sp,-16
 7dc:	e422                	sd	s0,8(sp)
 7de:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7e0:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7e4:	00000797          	auipc	a5,0x0
 7e8:	48c7b783          	ld	a5,1164(a5) # c70 <freep>
 7ec:	a02d                	j	816 <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 7ee:	4618                	lw	a4,8(a2)
 7f0:	9f2d                	addw	a4,a4,a1
 7f2:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 7f6:	6398                	ld	a4,0(a5)
 7f8:	6310                	ld	a2,0(a4)
 7fa:	a83d                	j	838 <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 7fc:	ff852703          	lw	a4,-8(a0)
 800:	9f31                	addw	a4,a4,a2
 802:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 804:	ff053683          	ld	a3,-16(a0)
 808:	a091                	j	84c <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 80a:	6398                	ld	a4,0(a5)
 80c:	00e7e463          	bltu	a5,a4,814 <free+0x3a>
 810:	00e6ea63          	bltu	a3,a4,824 <free+0x4a>
{
 814:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 816:	fed7fae3          	bgeu	a5,a3,80a <free+0x30>
 81a:	6398                	ld	a4,0(a5)
 81c:	00e6e463          	bltu	a3,a4,824 <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 820:	fee7eae3          	bltu	a5,a4,814 <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
 824:	ff852583          	lw	a1,-8(a0)
 828:	6390                	ld	a2,0(a5)
 82a:	02059813          	slli	a6,a1,0x20
 82e:	01c85713          	srli	a4,a6,0x1c
 832:	9736                	add	a4,a4,a3
 834:	fae60de3          	beq	a2,a4,7ee <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
 838:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 83c:	4790                	lw	a2,8(a5)
 83e:	02061593          	slli	a1,a2,0x20
 842:	01c5d713          	srli	a4,a1,0x1c
 846:	973e                	add	a4,a4,a5
 848:	fae68ae3          	beq	a3,a4,7fc <free+0x22>
    p->s.ptr = bp->s.ptr;
 84c:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 84e:	00000717          	auipc	a4,0x0
 852:	42f73123          	sd	a5,1058(a4) # c70 <freep>
}
 856:	6422                	ld	s0,8(sp)
 858:	0141                	addi	sp,sp,16
 85a:	8082                	ret

000000000000085c <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 85c:	7139                	addi	sp,sp,-64
 85e:	fc06                	sd	ra,56(sp)
 860:	f822                	sd	s0,48(sp)
 862:	f426                	sd	s1,40(sp)
 864:	f04a                	sd	s2,32(sp)
 866:	ec4e                	sd	s3,24(sp)
 868:	e852                	sd	s4,16(sp)
 86a:	e456                	sd	s5,8(sp)
 86c:	e05a                	sd	s6,0(sp)
 86e:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 870:	02051493          	slli	s1,a0,0x20
 874:	9081                	srli	s1,s1,0x20
 876:	04bd                	addi	s1,s1,15
 878:	8091                	srli	s1,s1,0x4
 87a:	00148a1b          	addiw	s4,s1,1
 87e:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 880:	00000517          	auipc	a0,0x0
 884:	3f053503          	ld	a0,1008(a0) # c70 <freep>
 888:	c515                	beqz	a0,8b4 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 88a:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 88c:	4798                	lw	a4,8(a5)
 88e:	04977163          	bgeu	a4,s1,8d0 <malloc+0x74>
 892:	89d2                	mv	s3,s4
 894:	000a071b          	sext.w	a4,s4
 898:	6685                	lui	a3,0x1
 89a:	00d77363          	bgeu	a4,a3,8a0 <malloc+0x44>
 89e:	6985                	lui	s3,0x1
 8a0:	00098b1b          	sext.w	s6,s3
  p = sbrk(nu * sizeof(Header));
 8a4:	0049999b          	slliw	s3,s3,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 8a8:	00000917          	auipc	s2,0x0
 8ac:	3c890913          	addi	s2,s2,968 # c70 <freep>
  if(p == (char*)-1)
 8b0:	5afd                	li	s5,-1
 8b2:	a8a5                	j	92a <malloc+0xce>
    base.s.ptr = freep = prevp = &base;
 8b4:	00000797          	auipc	a5,0x0
 8b8:	3bc78793          	addi	a5,a5,956 # c70 <freep>
 8bc:	00000717          	auipc	a4,0x0
 8c0:	3bc70713          	addi	a4,a4,956 # c78 <base>
 8c4:	e398                	sd	a4,0(a5)
 8c6:	e798                	sd	a4,8(a5)
    base.s.size = 0;
 8c8:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8cc:	87ba                	mv	a5,a4
 8ce:	b7d1                	j	892 <malloc+0x36>
      if(p->s.size == nunits)
 8d0:	02e48c63          	beq	s1,a4,908 <malloc+0xac>
        p->s.size -= nunits;
 8d4:	4147073b          	subw	a4,a4,s4
 8d8:	c798                	sw	a4,8(a5)
        p += p->s.size;
 8da:	02071693          	slli	a3,a4,0x20
 8de:	01c6d713          	srli	a4,a3,0x1c
 8e2:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 8e4:	0147a423          	sw	s4,8(a5)
      freep = prevp;
 8e8:	00000717          	auipc	a4,0x0
 8ec:	38a73423          	sd	a0,904(a4) # c70 <freep>
      return (void*)(p + 1);
 8f0:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8f4:	70e2                	ld	ra,56(sp)
 8f6:	7442                	ld	s0,48(sp)
 8f8:	74a2                	ld	s1,40(sp)
 8fa:	7902                	ld	s2,32(sp)
 8fc:	69e2                	ld	s3,24(sp)
 8fe:	6a42                	ld	s4,16(sp)
 900:	6aa2                	ld	s5,8(sp)
 902:	6b02                	ld	s6,0(sp)
 904:	6121                	addi	sp,sp,64
 906:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 908:	6398                	ld	a4,0(a5)
 90a:	e118                	sd	a4,0(a0)
 90c:	bff1                	j	8e8 <malloc+0x8c>
  hp->s.size = nu;
 90e:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 912:	0541                	addi	a0,a0,16
 914:	00000097          	auipc	ra,0x0
 918:	ec6080e7          	jalr	-314(ra) # 7da <free>
  return freep;
 91c:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 920:	d971                	beqz	a0,8f4 <malloc+0x98>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 922:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 924:	4798                	lw	a4,8(a5)
 926:	fa9775e3          	bgeu	a4,s1,8d0 <malloc+0x74>
    if(p == freep)
 92a:	00093703          	ld	a4,0(s2)
 92e:	853e                	mv	a0,a5
 930:	fef719e3          	bne	a4,a5,922 <malloc+0xc6>
  p = sbrk(nu * sizeof(Header));
 934:	854e                	mv	a0,s3
 936:	00000097          	auipc	ra,0x0
 93a:	b2a080e7          	jalr	-1238(ra) # 460 <sbrk>
  if(p == (char*)-1)
 93e:	fd5518e3          	bne	a0,s5,90e <malloc+0xb2>
        return 0;
 942:	4501                	li	a0,0
 944:	bf45                	j	8f4 <malloc+0x98>
