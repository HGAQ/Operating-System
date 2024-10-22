
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
  1c:	496080e7          	jalr	1174(ra) # 4ae <dev>
  dup(0); // stdout
  20:	4501                	li	a0,0
  22:	00000097          	auipc	ra,0x0
  26:	45c080e7          	jalr	1116(ra) # 47e <dup>
  dup(0); // stderr
  2a:	4501                	li	a0,0
  2c:	00000097          	auipc	ra,0x0
  30:	452080e7          	jalr	1106(ra) # 47e <dup>

  for (int i = 0; i < counts; i++) {
  34:	00001797          	auipc	a5,0x1
  38:	b3c7a783          	lw	a5,-1220(a5) # b70 <counts>
  3c:	10f05363          	blez	a5,142 <main+0x142>
  40:	00001997          	auipc	s3,0x1
  44:	b3898993          	addi	s3,s3,-1224 # b78 <tests>
  48:	4901                	li	s2,0
    printf("init: starting %s\n", tests[i]);
  4a:	00001a17          	auipc	s4,0x1
  4e:	916a0a13          	addi	s4,s4,-1770 # 960 <malloc+0xea>
  for (int i = 0; i < counts; i++) {
  52:	00001a97          	auipc	s5,0x1
  56:	b1ea8a93          	addi	s5,s5,-1250 # b70 <counts>
    printf("init: starting %s\n", tests[i]);
  5a:	0009b583          	ld	a1,0(s3)
  5e:	8552                	mv	a0,s4
  60:	00000097          	auipc	ra,0x0
  64:	75e080e7          	jalr	1886(ra) # 7be <printf>
    pid = fork();
  68:	00000097          	auipc	ra,0x0
  6c:	3ae080e7          	jalr	942(ra) # 416 <fork>
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
  7e:	3ac080e7          	jalr	940(ra) # 426 <wait>
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
  a0:	38a080e7          	jalr	906(ra) # 426 <wait>
    if(wpid == pid){
  a4:	0a950163          	beq	a0,s1,146 <main+0x146>
      // the shell exited; restart it.
      break;
    } else if(wpid < 0){
  a8:	fe0559e3          	bgez	a0,9a <main+0x9a>
      printf("init: wait returned an error\n");
  ac:	00001517          	auipc	a0,0x1
  b0:	90c50513          	addi	a0,a0,-1780 # 9b8 <malloc+0x142>
  b4:	00000097          	auipc	ra,0x0
  b8:	70a080e7          	jalr	1802(ra) # 7be <printf>
      (*(volatile uint32 *) 0x100000)=0x5555;
  bc:	00100737          	lui	a4,0x100
  c0:	6795                	lui	a5,0x5
  c2:	55578793          	addi	a5,a5,1365 # 5555 <__global_pointer$+0x41e5>
  c6:	c31c                	sw	a5,0(a4)
      exit(1);
  c8:	4505                	li	a0,1
  ca:	00000097          	auipc	ra,0x0
  ce:	354080e7          	jalr	852(ra) # 41e <exit>
      printf("init: fork failed\n");
  d2:	00001517          	auipc	a0,0x1
  d6:	8a650513          	addi	a0,a0,-1882 # 978 <malloc+0x102>
  da:	00000097          	auipc	ra,0x0
  de:	6e4080e7          	jalr	1764(ra) # 7be <printf>
      exit(1);
  e2:	4505                	li	a0,1
  e4:	00000097          	auipc	ra,0x0
  e8:	33a080e7          	jalr	826(ra) # 41e <exit>
      exec(tests[i], argv);
  ec:	090e                	slli	s2,s2,0x3
  ee:	00001497          	auipc	s1,0x1
  f2:	a8a48493          	addi	s1,s1,-1398 # b78 <tests>
  f6:	94ca                	add	s1,s1,s2
  f8:	00001597          	auipc	a1,0x1
  fc:	b8858593          	addi	a1,a1,-1144 # c80 <argv>
 100:	6088                	ld	a0,0(s1)
 102:	00000097          	auipc	ra,0x0
 106:	354080e7          	jalr	852(ra) # 456 <exec>
      printf("init: exec %s",tests[i]);
 10a:	608c                	ld	a1,0(s1)
 10c:	00001517          	auipc	a0,0x1
 110:	88450513          	addi	a0,a0,-1916 # 990 <malloc+0x11a>
 114:	00000097          	auipc	ra,0x0
 118:	6aa080e7          	jalr	1706(ra) # 7be <printf>
      printf(tests[i]);
 11c:	6088                	ld	a0,0(s1)
 11e:	00000097          	auipc	ra,0x0
 122:	6a0080e7          	jalr	1696(ra) # 7be <printf>
      printf(" failed exec %s\n", tests[i]);
 126:	608c                	ld	a1,0(s1)
 128:	00001517          	auipc	a0,0x1
 12c:	87850513          	addi	a0,a0,-1928 # 9a0 <malloc+0x12a>
 130:	00000097          	auipc	ra,0x0
 134:	68e080e7          	jalr	1678(ra) # 7be <printf>
      exit(1);
 138:	4505                	li	a0,1
 13a:	00000097          	auipc	ra,0x0
 13e:	2e4080e7          	jalr	740(ra) # 41e <exit>
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
  return 0;
}
 152:	4501                	li	a0,0
 154:	70e2                	ld	ra,56(sp)
 156:	7442                	ld	s0,48(sp)
 158:	74a2                	ld	s1,40(sp)
 15a:	7902                	ld	s2,32(sp)
 15c:	69e2                	ld	s3,24(sp)
 15e:	6a42                	ld	s4,16(sp)
 160:	6aa2                	ld	s5,8(sp)
 162:	6121                	addi	sp,sp,64
 164:	8082                	ret

0000000000000166 <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
 166:	1141                	addi	sp,sp,-16
 168:	e422                	sd	s0,8(sp)
 16a:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 16c:	87aa                	mv	a5,a0
 16e:	0585                	addi	a1,a1,1
 170:	0785                	addi	a5,a5,1
 172:	fff5c703          	lbu	a4,-1(a1)
 176:	fee78fa3          	sb	a4,-1(a5)
 17a:	fb75                	bnez	a4,16e <strcpy+0x8>
    ;
  return os;
}
 17c:	6422                	ld	s0,8(sp)
 17e:	0141                	addi	sp,sp,16
 180:	8082                	ret

0000000000000182 <strcat>:

char*
strcat(char *s, const char *t)
{
 182:	1141                	addi	sp,sp,-16
 184:	e422                	sd	s0,8(sp)
 186:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
 188:	00054783          	lbu	a5,0(a0)
 18c:	c385                	beqz	a5,1ac <strcat+0x2a>
 18e:	87aa                	mv	a5,a0
    s++;
 190:	0785                	addi	a5,a5,1
  while(*s)
 192:	0007c703          	lbu	a4,0(a5)
 196:	ff6d                	bnez	a4,190 <strcat+0xe>
  while((*s++ = *t++))
 198:	0585                	addi	a1,a1,1
 19a:	0785                	addi	a5,a5,1
 19c:	fff5c703          	lbu	a4,-1(a1)
 1a0:	fee78fa3          	sb	a4,-1(a5)
 1a4:	fb75                	bnez	a4,198 <strcat+0x16>
    ;
  return os;
}
 1a6:	6422                	ld	s0,8(sp)
 1a8:	0141                	addi	sp,sp,16
 1aa:	8082                	ret
  while(*s)
 1ac:	87aa                	mv	a5,a0
 1ae:	b7ed                	j	198 <strcat+0x16>

00000000000001b0 <strcmp>:


int
strcmp(const char *p, const char *q)
{
 1b0:	1141                	addi	sp,sp,-16
 1b2:	e422                	sd	s0,8(sp)
 1b4:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 1b6:	00054783          	lbu	a5,0(a0)
 1ba:	cb91                	beqz	a5,1ce <strcmp+0x1e>
 1bc:	0005c703          	lbu	a4,0(a1)
 1c0:	00f71763          	bne	a4,a5,1ce <strcmp+0x1e>
    p++, q++;
 1c4:	0505                	addi	a0,a0,1
 1c6:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 1c8:	00054783          	lbu	a5,0(a0)
 1cc:	fbe5                	bnez	a5,1bc <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 1ce:	0005c503          	lbu	a0,0(a1)
}
 1d2:	40a7853b          	subw	a0,a5,a0
 1d6:	6422                	ld	s0,8(sp)
 1d8:	0141                	addi	sp,sp,16
 1da:	8082                	ret

00000000000001dc <strlen>:

uint
strlen(const char *s)
{
 1dc:	1141                	addi	sp,sp,-16
 1de:	e422                	sd	s0,8(sp)
 1e0:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 1e2:	00054783          	lbu	a5,0(a0)
 1e6:	cf91                	beqz	a5,202 <strlen+0x26>
 1e8:	0505                	addi	a0,a0,1
 1ea:	87aa                	mv	a5,a0
 1ec:	4685                	li	a3,1
 1ee:	9e89                	subw	a3,a3,a0
 1f0:	00f6853b          	addw	a0,a3,a5
 1f4:	0785                	addi	a5,a5,1
 1f6:	fff7c703          	lbu	a4,-1(a5)
 1fa:	fb7d                	bnez	a4,1f0 <strlen+0x14>
    ;
  return n;
}
 1fc:	6422                	ld	s0,8(sp)
 1fe:	0141                	addi	sp,sp,16
 200:	8082                	ret
  for(n = 0; s[n]; n++)
 202:	4501                	li	a0,0
 204:	bfe5                	j	1fc <strlen+0x20>

0000000000000206 <memset>:

void*
memset(void *dst, int c, uint n)
{
 206:	1141                	addi	sp,sp,-16
 208:	e422                	sd	s0,8(sp)
 20a:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 20c:	ca19                	beqz	a2,222 <memset+0x1c>
 20e:	87aa                	mv	a5,a0
 210:	1602                	slli	a2,a2,0x20
 212:	9201                	srli	a2,a2,0x20
 214:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 218:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 21c:	0785                	addi	a5,a5,1
 21e:	fee79de3          	bne	a5,a4,218 <memset+0x12>
  }
  return dst;
}
 222:	6422                	ld	s0,8(sp)
 224:	0141                	addi	sp,sp,16
 226:	8082                	ret

0000000000000228 <strchr>:

char*
strchr(const char *s, char c)
{
 228:	1141                	addi	sp,sp,-16
 22a:	e422                	sd	s0,8(sp)
 22c:	0800                	addi	s0,sp,16
  for(; *s; s++)
 22e:	00054783          	lbu	a5,0(a0)
 232:	cb99                	beqz	a5,248 <strchr+0x20>
    if(*s == c)
 234:	00f58763          	beq	a1,a5,242 <strchr+0x1a>
  for(; *s; s++)
 238:	0505                	addi	a0,a0,1
 23a:	00054783          	lbu	a5,0(a0)
 23e:	fbfd                	bnez	a5,234 <strchr+0xc>
      return (char*)s;
  return 0;
 240:	4501                	li	a0,0
}
 242:	6422                	ld	s0,8(sp)
 244:	0141                	addi	sp,sp,16
 246:	8082                	ret
  return 0;
 248:	4501                	li	a0,0
 24a:	bfe5                	j	242 <strchr+0x1a>

000000000000024c <gets>:

char*
gets(char *buf, int max)
{
 24c:	711d                	addi	sp,sp,-96
 24e:	ec86                	sd	ra,88(sp)
 250:	e8a2                	sd	s0,80(sp)
 252:	e4a6                	sd	s1,72(sp)
 254:	e0ca                	sd	s2,64(sp)
 256:	fc4e                	sd	s3,56(sp)
 258:	f852                	sd	s4,48(sp)
 25a:	f456                	sd	s5,40(sp)
 25c:	f05a                	sd	s6,32(sp)
 25e:	ec5e                	sd	s7,24(sp)
 260:	e862                	sd	s8,16(sp)
 262:	1080                	addi	s0,sp,96
 264:	8baa                	mv	s7,a0
 266:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 268:	892a                	mv	s2,a0
 26a:	4481                	li	s1,0
    cc = read(0, &c, 1);
 26c:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 270:	4b29                	li	s6,10
 272:	4c35                	li	s8,13
  for(i=0; i+1 < max; ){
 274:	89a6                	mv	s3,s1
 276:	2485                	addiw	s1,s1,1
 278:	0344d763          	bge	s1,s4,2a6 <gets+0x5a>
    cc = read(0, &c, 1);
 27c:	4605                	li	a2,1
 27e:	85d6                	mv	a1,s5
 280:	4501                	li	a0,0
 282:	00000097          	auipc	ra,0x0
 286:	1b4080e7          	jalr	436(ra) # 436 <read>
    if(cc < 1)
 28a:	00a05e63          	blez	a0,2a6 <gets+0x5a>
    buf[i++] = c;
 28e:	faf44783          	lbu	a5,-81(s0)
 292:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 296:	01678763          	beq	a5,s6,2a4 <gets+0x58>
 29a:	0905                	addi	s2,s2,1
 29c:	fd879ce3          	bne	a5,s8,274 <gets+0x28>
  for(i=0; i+1 < max; ){
 2a0:	89a6                	mv	s3,s1
 2a2:	a011                	j	2a6 <gets+0x5a>
 2a4:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 2a6:	99de                	add	s3,s3,s7
 2a8:	00098023          	sb	zero,0(s3)
  return buf;
}
 2ac:	855e                	mv	a0,s7
 2ae:	60e6                	ld	ra,88(sp)
 2b0:	6446                	ld	s0,80(sp)
 2b2:	64a6                	ld	s1,72(sp)
 2b4:	6906                	ld	s2,64(sp)
 2b6:	79e2                	ld	s3,56(sp)
 2b8:	7a42                	ld	s4,48(sp)
 2ba:	7aa2                	ld	s5,40(sp)
 2bc:	7b02                	ld	s6,32(sp)
 2be:	6be2                	ld	s7,24(sp)
 2c0:	6c42                	ld	s8,16(sp)
 2c2:	6125                	addi	sp,sp,96
 2c4:	8082                	ret

00000000000002c6 <stat>:

int
stat(const char *n, struct stat *st)
{
 2c6:	1101                	addi	sp,sp,-32
 2c8:	ec06                	sd	ra,24(sp)
 2ca:	e822                	sd	s0,16(sp)
 2cc:	e426                	sd	s1,8(sp)
 2ce:	e04a                	sd	s2,0(sp)
 2d0:	1000                	addi	s0,sp,32
 2d2:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2d4:	4581                	li	a1,0
 2d6:	00000097          	auipc	ra,0x0
 2da:	188080e7          	jalr	392(ra) # 45e <open>
  if(fd < 0)
 2de:	02054563          	bltz	a0,308 <stat+0x42>
 2e2:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 2e4:	85ca                	mv	a1,s2
 2e6:	00000097          	auipc	ra,0x0
 2ea:	180080e7          	jalr	384(ra) # 466 <fstat>
 2ee:	892a                	mv	s2,a0
  close(fd);
 2f0:	8526                	mv	a0,s1
 2f2:	00000097          	auipc	ra,0x0
 2f6:	154080e7          	jalr	340(ra) # 446 <close>
  return r;
}
 2fa:	854a                	mv	a0,s2
 2fc:	60e2                	ld	ra,24(sp)
 2fe:	6442                	ld	s0,16(sp)
 300:	64a2                	ld	s1,8(sp)
 302:	6902                	ld	s2,0(sp)
 304:	6105                	addi	sp,sp,32
 306:	8082                	ret
    return -1;
 308:	597d                	li	s2,-1
 30a:	bfc5                	j	2fa <stat+0x34>

000000000000030c <atoi>:

int
atoi(const char *s)
{
 30c:	1141                	addi	sp,sp,-16
 30e:	e422                	sd	s0,8(sp)
 310:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 312:	00054703          	lbu	a4,0(a0)
 316:	02d00793          	li	a5,45
  int neg = 1;
 31a:	4585                	li	a1,1
  if (*s == '-') {
 31c:	04f70363          	beq	a4,a5,362 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 320:	00054703          	lbu	a4,0(a0)
 324:	fd07079b          	addiw	a5,a4,-48 # fffd0 <__global_pointer$+0xfec60>
 328:	0ff7f793          	zext.b	a5,a5
 32c:	46a5                	li	a3,9
 32e:	02f6ed63          	bltu	a3,a5,368 <atoi+0x5c>
  n = 0;
 332:	4681                	li	a3,0
  while('0' <= *s && *s <= '9')
 334:	4625                	li	a2,9
    n = n*10 + *s++ - '0';
 336:	0505                	addi	a0,a0,1
 338:	0026979b          	slliw	a5,a3,0x2
 33c:	9fb5                	addw	a5,a5,a3
 33e:	0017979b          	slliw	a5,a5,0x1
 342:	9fb9                	addw	a5,a5,a4
 344:	fd07869b          	addiw	a3,a5,-48
  while('0' <= *s && *s <= '9')
 348:	00054703          	lbu	a4,0(a0)
 34c:	fd07079b          	addiw	a5,a4,-48
 350:	0ff7f793          	zext.b	a5,a5
 354:	fef671e3          	bgeu	a2,a5,336 <atoi+0x2a>
  return n * neg;
}
 358:	02d5853b          	mulw	a0,a1,a3
 35c:	6422                	ld	s0,8(sp)
 35e:	0141                	addi	sp,sp,16
 360:	8082                	ret
    s++;
 362:	0505                	addi	a0,a0,1
    neg = -1;
 364:	55fd                	li	a1,-1
 366:	bf6d                	j	320 <atoi+0x14>
  n = 0;
 368:	4681                	li	a3,0
 36a:	b7fd                	j	358 <atoi+0x4c>

000000000000036c <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 36c:	1141                	addi	sp,sp,-16
 36e:	e422                	sd	s0,8(sp)
 370:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 372:	02b57463          	bgeu	a0,a1,39a <memmove+0x2e>
    while(n-- > 0)
 376:	00c05f63          	blez	a2,394 <memmove+0x28>
 37a:	1602                	slli	a2,a2,0x20
 37c:	9201                	srli	a2,a2,0x20
 37e:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 382:	872a                	mv	a4,a0
      *dst++ = *src++;
 384:	0585                	addi	a1,a1,1
 386:	0705                	addi	a4,a4,1
 388:	fff5c683          	lbu	a3,-1(a1)
 38c:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 390:	fee79ae3          	bne	a5,a4,384 <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 394:	6422                	ld	s0,8(sp)
 396:	0141                	addi	sp,sp,16
 398:	8082                	ret
    dst += n;
 39a:	00c50733          	add	a4,a0,a2
    src += n;
 39e:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 3a0:	fec05ae3          	blez	a2,394 <memmove+0x28>
 3a4:	fff6079b          	addiw	a5,a2,-1
 3a8:	1782                	slli	a5,a5,0x20
 3aa:	9381                	srli	a5,a5,0x20
 3ac:	fff7c793          	not	a5,a5
 3b0:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 3b2:	15fd                	addi	a1,a1,-1
 3b4:	177d                	addi	a4,a4,-1
 3b6:	0005c683          	lbu	a3,0(a1)
 3ba:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 3be:	fee79ae3          	bne	a5,a4,3b2 <memmove+0x46>
 3c2:	bfc9                	j	394 <memmove+0x28>

00000000000003c4 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 3c4:	1141                	addi	sp,sp,-16
 3c6:	e422                	sd	s0,8(sp)
 3c8:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 3ca:	ca05                	beqz	a2,3fa <memcmp+0x36>
 3cc:	fff6069b          	addiw	a3,a2,-1
 3d0:	1682                	slli	a3,a3,0x20
 3d2:	9281                	srli	a3,a3,0x20
 3d4:	0685                	addi	a3,a3,1
 3d6:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 3d8:	00054783          	lbu	a5,0(a0)
 3dc:	0005c703          	lbu	a4,0(a1)
 3e0:	00e79863          	bne	a5,a4,3f0 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 3e4:	0505                	addi	a0,a0,1
    p2++;
 3e6:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 3e8:	fed518e3          	bne	a0,a3,3d8 <memcmp+0x14>
  }
  return 0;
 3ec:	4501                	li	a0,0
 3ee:	a019                	j	3f4 <memcmp+0x30>
      return *p1 - *p2;
 3f0:	40e7853b          	subw	a0,a5,a4
}
 3f4:	6422                	ld	s0,8(sp)
 3f6:	0141                	addi	sp,sp,16
 3f8:	8082                	ret
  return 0;
 3fa:	4501                	li	a0,0
 3fc:	bfe5                	j	3f4 <memcmp+0x30>

00000000000003fe <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 3fe:	1141                	addi	sp,sp,-16
 400:	e406                	sd	ra,8(sp)
 402:	e022                	sd	s0,0(sp)
 404:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 406:	00000097          	auipc	ra,0x0
 40a:	f66080e7          	jalr	-154(ra) # 36c <memmove>
}
 40e:	60a2                	ld	ra,8(sp)
 410:	6402                	ld	s0,0(sp)
 412:	0141                	addi	sp,sp,16
 414:	8082                	ret

0000000000000416 <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 416:	4885                	li	a7,1
 ecall
 418:	00000073          	ecall
 ret
 41c:	8082                	ret

000000000000041e <exit>:
.global exit
exit:
 li a7, SYS_exit
 41e:	4889                	li	a7,2
 ecall
 420:	00000073          	ecall
 ret
 424:	8082                	ret

0000000000000426 <wait>:
.global wait
wait:
 li a7, SYS_wait
 426:	488d                	li	a7,3
 ecall
 428:	00000073          	ecall
 ret
 42c:	8082                	ret

000000000000042e <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 42e:	4891                	li	a7,4
 ecall
 430:	00000073          	ecall
 ret
 434:	8082                	ret

0000000000000436 <read>:
.global read
read:
 li a7, SYS_read
 436:	4895                	li	a7,5
 ecall
 438:	00000073          	ecall
 ret
 43c:	8082                	ret

000000000000043e <write>:
.global write
write:
 li a7, SYS_write
 43e:	48c1                	li	a7,16
 ecall
 440:	00000073          	ecall
 ret
 444:	8082                	ret

0000000000000446 <close>:
.global close
close:
 li a7, SYS_close
 446:	48d5                	li	a7,21
 ecall
 448:	00000073          	ecall
 ret
 44c:	8082                	ret

000000000000044e <kill>:
.global kill
kill:
 li a7, SYS_kill
 44e:	4899                	li	a7,6
 ecall
 450:	00000073          	ecall
 ret
 454:	8082                	ret

0000000000000456 <exec>:
.global exec
exec:
 li a7, SYS_exec
 456:	489d                	li	a7,7
 ecall
 458:	00000073          	ecall
 ret
 45c:	8082                	ret

000000000000045e <open>:
.global open
open:
 li a7, SYS_open
 45e:	48bd                	li	a7,15
 ecall
 460:	00000073          	ecall
 ret
 464:	8082                	ret

0000000000000466 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 466:	48a1                	li	a7,8
 ecall
 468:	00000073          	ecall
 ret
 46c:	8082                	ret

000000000000046e <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 46e:	48d1                	li	a7,20
 ecall
 470:	00000073          	ecall
 ret
 474:	8082                	ret

0000000000000476 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 476:	48a5                	li	a7,9
 ecall
 478:	00000073          	ecall
 ret
 47c:	8082                	ret

000000000000047e <dup>:
.global dup
dup:
 li a7, SYS_dup
 47e:	48a9                	li	a7,10
 ecall
 480:	00000073          	ecall
 ret
 484:	8082                	ret

0000000000000486 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 486:	48ad                	li	a7,11
 ecall
 488:	00000073          	ecall
 ret
 48c:	8082                	ret

000000000000048e <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 48e:	48b1                	li	a7,12
 ecall
 490:	00000073          	ecall
 ret
 494:	8082                	ret

0000000000000496 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 496:	48b5                	li	a7,13
 ecall
 498:	00000073          	ecall
 ret
 49c:	8082                	ret

000000000000049e <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 49e:	48b9                	li	a7,14
 ecall
 4a0:	00000073          	ecall
 ret
 4a4:	8082                	ret

00000000000004a6 <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 4a6:	48d9                	li	a7,22
 ecall
 4a8:	00000073          	ecall
 ret
 4ac:	8082                	ret

00000000000004ae <dev>:
.global dev
dev:
 li a7, SYS_dev
 4ae:	48dd                	li	a7,23
 ecall
 4b0:	00000073          	ecall
 ret
 4b4:	8082                	ret

00000000000004b6 <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 4b6:	48e1                	li	a7,24
 ecall
 4b8:	00000073          	ecall
 ret
 4bc:	8082                	ret

00000000000004be <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 4be:	48e5                	li	a7,25
 ecall
 4c0:	00000073          	ecall
 ret
 4c4:	8082                	ret

00000000000004c6 <remove>:
.global remove
remove:
 li a7, SYS_remove
 4c6:	48c5                	li	a7,17
 ecall
 4c8:	00000073          	ecall
 ret
 4cc:	8082                	ret

00000000000004ce <trace>:
.global trace
trace:
 li a7, SYS_trace
 4ce:	48c9                	li	a7,18
 ecall
 4d0:	00000073          	ecall
 ret
 4d4:	8082                	ret

00000000000004d6 <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 4d6:	48cd                	li	a7,19
 ecall
 4d8:	00000073          	ecall
 ret
 4dc:	8082                	ret

00000000000004de <rename>:
.global rename
rename:
 li a7, SYS_rename
 4de:	48e9                	li	a7,26
 ecall
 4e0:	00000073          	ecall
 ret
 4e4:	8082                	ret

00000000000004e6 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 4e6:	1101                	addi	sp,sp,-32
 4e8:	ec06                	sd	ra,24(sp)
 4ea:	e822                	sd	s0,16(sp)
 4ec:	1000                	addi	s0,sp,32
 4ee:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 4f2:	4605                	li	a2,1
 4f4:	fef40593          	addi	a1,s0,-17
 4f8:	00000097          	auipc	ra,0x0
 4fc:	f46080e7          	jalr	-186(ra) # 43e <write>
}
 500:	60e2                	ld	ra,24(sp)
 502:	6442                	ld	s0,16(sp)
 504:	6105                	addi	sp,sp,32
 506:	8082                	ret

0000000000000508 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 508:	7139                	addi	sp,sp,-64
 50a:	fc06                	sd	ra,56(sp)
 50c:	f822                	sd	s0,48(sp)
 50e:	f426                	sd	s1,40(sp)
 510:	f04a                	sd	s2,32(sp)
 512:	ec4e                	sd	s3,24(sp)
 514:	0080                	addi	s0,sp,64
 516:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 518:	c299                	beqz	a3,51e <printint+0x16>
 51a:	0805c863          	bltz	a1,5aa <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 51e:	2581                	sext.w	a1,a1
  neg = 0;
 520:	4881                	li	a7,0
  }

  i = 0;
 522:	fc040993          	addi	s3,s0,-64
  neg = 0;
 526:	86ce                	mv	a3,s3
  i = 0;
 528:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 52a:	2601                	sext.w	a2,a2
 52c:	00000517          	auipc	a0,0x0
 530:	62c50513          	addi	a0,a0,1580 # b58 <digits>
 534:	883a                	mv	a6,a4
 536:	2705                	addiw	a4,a4,1
 538:	02c5f7bb          	remuw	a5,a1,a2
 53c:	1782                	slli	a5,a5,0x20
 53e:	9381                	srli	a5,a5,0x20
 540:	97aa                	add	a5,a5,a0
 542:	0007c783          	lbu	a5,0(a5)
 546:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 54a:	0005879b          	sext.w	a5,a1
 54e:	02c5d5bb          	divuw	a1,a1,a2
 552:	0685                	addi	a3,a3,1
 554:	fec7f0e3          	bgeu	a5,a2,534 <printint+0x2c>
  if(neg)
 558:	00088c63          	beqz	a7,570 <printint+0x68>
    buf[i++] = '-';
 55c:	fd070793          	addi	a5,a4,-48
 560:	00878733          	add	a4,a5,s0
 564:	02d00793          	li	a5,45
 568:	fef70823          	sb	a5,-16(a4)
 56c:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 570:	02e05663          	blez	a4,59c <printint+0x94>
 574:	fc040913          	addi	s2,s0,-64
 578:	993a                	add	s2,s2,a4
 57a:	19fd                	addi	s3,s3,-1
 57c:	99ba                	add	s3,s3,a4
 57e:	377d                	addiw	a4,a4,-1
 580:	1702                	slli	a4,a4,0x20
 582:	9301                	srli	a4,a4,0x20
 584:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 588:	fff94583          	lbu	a1,-1(s2)
 58c:	8526                	mv	a0,s1
 58e:	00000097          	auipc	ra,0x0
 592:	f58080e7          	jalr	-168(ra) # 4e6 <putc>
  while(--i >= 0)
 596:	197d                	addi	s2,s2,-1
 598:	ff3918e3          	bne	s2,s3,588 <printint+0x80>
}
 59c:	70e2                	ld	ra,56(sp)
 59e:	7442                	ld	s0,48(sp)
 5a0:	74a2                	ld	s1,40(sp)
 5a2:	7902                	ld	s2,32(sp)
 5a4:	69e2                	ld	s3,24(sp)
 5a6:	6121                	addi	sp,sp,64
 5a8:	8082                	ret
    x = -xx;
 5aa:	40b005bb          	negw	a1,a1
    neg = 1;
 5ae:	4885                	li	a7,1
    x = -xx;
 5b0:	bf8d                	j	522 <printint+0x1a>

00000000000005b2 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 5b2:	7119                	addi	sp,sp,-128
 5b4:	fc86                	sd	ra,120(sp)
 5b6:	f8a2                	sd	s0,112(sp)
 5b8:	f4a6                	sd	s1,104(sp)
 5ba:	f0ca                	sd	s2,96(sp)
 5bc:	ecce                	sd	s3,88(sp)
 5be:	e8d2                	sd	s4,80(sp)
 5c0:	e4d6                	sd	s5,72(sp)
 5c2:	e0da                	sd	s6,64(sp)
 5c4:	fc5e                	sd	s7,56(sp)
 5c6:	f862                	sd	s8,48(sp)
 5c8:	f466                	sd	s9,40(sp)
 5ca:	f06a                	sd	s10,32(sp)
 5cc:	ec6e                	sd	s11,24(sp)
 5ce:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 5d0:	0005c903          	lbu	s2,0(a1)
 5d4:	18090f63          	beqz	s2,772 <vprintf+0x1c0>
 5d8:	8aaa                	mv	s5,a0
 5da:	8b32                	mv	s6,a2
 5dc:	00158493          	addi	s1,a1,1
  state = 0;
 5e0:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 5e2:	02500a13          	li	s4,37
 5e6:	4c55                	li	s8,21
 5e8:	00000c97          	auipc	s9,0x0
 5ec:	518c8c93          	addi	s9,s9,1304 # b00 <malloc+0x28a>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
        s = va_arg(ap, char*);
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5f0:	02800d93          	li	s11,40
  putc(fd, 'x');
 5f4:	4d41                	li	s10,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 5f6:	00000b97          	auipc	s7,0x0
 5fa:	562b8b93          	addi	s7,s7,1378 # b58 <digits>
 5fe:	a839                	j	61c <vprintf+0x6a>
        putc(fd, c);
 600:	85ca                	mv	a1,s2
 602:	8556                	mv	a0,s5
 604:	00000097          	auipc	ra,0x0
 608:	ee2080e7          	jalr	-286(ra) # 4e6 <putc>
 60c:	a019                	j	612 <vprintf+0x60>
    } else if(state == '%'){
 60e:	01498d63          	beq	s3,s4,628 <vprintf+0x76>
  for(i = 0; fmt[i]; i++){
 612:	0485                	addi	s1,s1,1
 614:	fff4c903          	lbu	s2,-1(s1)
 618:	14090d63          	beqz	s2,772 <vprintf+0x1c0>
    if(state == 0){
 61c:	fe0999e3          	bnez	s3,60e <vprintf+0x5c>
      if(c == '%'){
 620:	ff4910e3          	bne	s2,s4,600 <vprintf+0x4e>
        state = '%';
 624:	89d2                	mv	s3,s4
 626:	b7f5                	j	612 <vprintf+0x60>
      if(c == 'd'){
 628:	11490c63          	beq	s2,s4,740 <vprintf+0x18e>
 62c:	f9d9079b          	addiw	a5,s2,-99
 630:	0ff7f793          	zext.b	a5,a5
 634:	10fc6e63          	bltu	s8,a5,750 <vprintf+0x19e>
 638:	f9d9079b          	addiw	a5,s2,-99
 63c:	0ff7f713          	zext.b	a4,a5
 640:	10ec6863          	bltu	s8,a4,750 <vprintf+0x19e>
 644:	00271793          	slli	a5,a4,0x2
 648:	97e6                	add	a5,a5,s9
 64a:	439c                	lw	a5,0(a5)
 64c:	97e6                	add	a5,a5,s9
 64e:	8782                	jr	a5
        printint(fd, va_arg(ap, int), 10, 1);
 650:	008b0913          	addi	s2,s6,8
 654:	4685                	li	a3,1
 656:	4629                	li	a2,10
 658:	000b2583          	lw	a1,0(s6)
 65c:	8556                	mv	a0,s5
 65e:	00000097          	auipc	ra,0x0
 662:	eaa080e7          	jalr	-342(ra) # 508 <printint>
 666:	8b4a                	mv	s6,s2
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 668:	4981                	li	s3,0
 66a:	b765                	j	612 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 66c:	008b0913          	addi	s2,s6,8
 670:	4681                	li	a3,0
 672:	4629                	li	a2,10
 674:	000b2583          	lw	a1,0(s6)
 678:	8556                	mv	a0,s5
 67a:	00000097          	auipc	ra,0x0
 67e:	e8e080e7          	jalr	-370(ra) # 508 <printint>
 682:	8b4a                	mv	s6,s2
      state = 0;
 684:	4981                	li	s3,0
 686:	b771                	j	612 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 688:	008b0913          	addi	s2,s6,8
 68c:	4681                	li	a3,0
 68e:	866a                	mv	a2,s10
 690:	000b2583          	lw	a1,0(s6)
 694:	8556                	mv	a0,s5
 696:	00000097          	auipc	ra,0x0
 69a:	e72080e7          	jalr	-398(ra) # 508 <printint>
 69e:	8b4a                	mv	s6,s2
      state = 0;
 6a0:	4981                	li	s3,0
 6a2:	bf85                	j	612 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 6a4:	008b0793          	addi	a5,s6,8
 6a8:	f8f43423          	sd	a5,-120(s0)
 6ac:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 6b0:	03000593          	li	a1,48
 6b4:	8556                	mv	a0,s5
 6b6:	00000097          	auipc	ra,0x0
 6ba:	e30080e7          	jalr	-464(ra) # 4e6 <putc>
  putc(fd, 'x');
 6be:	07800593          	li	a1,120
 6c2:	8556                	mv	a0,s5
 6c4:	00000097          	auipc	ra,0x0
 6c8:	e22080e7          	jalr	-478(ra) # 4e6 <putc>
 6cc:	896a                	mv	s2,s10
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 6ce:	03c9d793          	srli	a5,s3,0x3c
 6d2:	97de                	add	a5,a5,s7
 6d4:	0007c583          	lbu	a1,0(a5)
 6d8:	8556                	mv	a0,s5
 6da:	00000097          	auipc	ra,0x0
 6de:	e0c080e7          	jalr	-500(ra) # 4e6 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 6e2:	0992                	slli	s3,s3,0x4
 6e4:	397d                	addiw	s2,s2,-1
 6e6:	fe0914e3          	bnez	s2,6ce <vprintf+0x11c>
        printptr(fd, va_arg(ap, uint64));
 6ea:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 6ee:	4981                	li	s3,0
 6f0:	b70d                	j	612 <vprintf+0x60>
        s = va_arg(ap, char*);
 6f2:	008b0913          	addi	s2,s6,8
 6f6:	000b3983          	ld	s3,0(s6)
        if(s == 0)
 6fa:	02098163          	beqz	s3,71c <vprintf+0x16a>
        while(*s != 0){
 6fe:	0009c583          	lbu	a1,0(s3)
 702:	c5ad                	beqz	a1,76c <vprintf+0x1ba>
          putc(fd, *s);
 704:	8556                	mv	a0,s5
 706:	00000097          	auipc	ra,0x0
 70a:	de0080e7          	jalr	-544(ra) # 4e6 <putc>
          s++;
 70e:	0985                	addi	s3,s3,1
        while(*s != 0){
 710:	0009c583          	lbu	a1,0(s3)
 714:	f9e5                	bnez	a1,704 <vprintf+0x152>
        s = va_arg(ap, char*);
 716:	8b4a                	mv	s6,s2
      state = 0;
 718:	4981                	li	s3,0
 71a:	bde5                	j	612 <vprintf+0x60>
          s = "(null)";
 71c:	00000997          	auipc	s3,0x0
 720:	3dc98993          	addi	s3,s3,988 # af8 <malloc+0x282>
        while(*s != 0){
 724:	85ee                	mv	a1,s11
 726:	bff9                	j	704 <vprintf+0x152>
        putc(fd, va_arg(ap, uint));
 728:	008b0913          	addi	s2,s6,8
 72c:	000b4583          	lbu	a1,0(s6)
 730:	8556                	mv	a0,s5
 732:	00000097          	auipc	ra,0x0
 736:	db4080e7          	jalr	-588(ra) # 4e6 <putc>
 73a:	8b4a                	mv	s6,s2
      state = 0;
 73c:	4981                	li	s3,0
 73e:	bdd1                	j	612 <vprintf+0x60>
        putc(fd, c);
 740:	85d2                	mv	a1,s4
 742:	8556                	mv	a0,s5
 744:	00000097          	auipc	ra,0x0
 748:	da2080e7          	jalr	-606(ra) # 4e6 <putc>
      state = 0;
 74c:	4981                	li	s3,0
 74e:	b5d1                	j	612 <vprintf+0x60>
        putc(fd, '%');
 750:	85d2                	mv	a1,s4
 752:	8556                	mv	a0,s5
 754:	00000097          	auipc	ra,0x0
 758:	d92080e7          	jalr	-622(ra) # 4e6 <putc>
        putc(fd, c);
 75c:	85ca                	mv	a1,s2
 75e:	8556                	mv	a0,s5
 760:	00000097          	auipc	ra,0x0
 764:	d86080e7          	jalr	-634(ra) # 4e6 <putc>
      state = 0;
 768:	4981                	li	s3,0
 76a:	b565                	j	612 <vprintf+0x60>
        s = va_arg(ap, char*);
 76c:	8b4a                	mv	s6,s2
      state = 0;
 76e:	4981                	li	s3,0
 770:	b54d                	j	612 <vprintf+0x60>
    }
  }
}
 772:	70e6                	ld	ra,120(sp)
 774:	7446                	ld	s0,112(sp)
 776:	74a6                	ld	s1,104(sp)
 778:	7906                	ld	s2,96(sp)
 77a:	69e6                	ld	s3,88(sp)
 77c:	6a46                	ld	s4,80(sp)
 77e:	6aa6                	ld	s5,72(sp)
 780:	6b06                	ld	s6,64(sp)
 782:	7be2                	ld	s7,56(sp)
 784:	7c42                	ld	s8,48(sp)
 786:	7ca2                	ld	s9,40(sp)
 788:	7d02                	ld	s10,32(sp)
 78a:	6de2                	ld	s11,24(sp)
 78c:	6109                	addi	sp,sp,128
 78e:	8082                	ret

0000000000000790 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 790:	715d                	addi	sp,sp,-80
 792:	ec06                	sd	ra,24(sp)
 794:	e822                	sd	s0,16(sp)
 796:	1000                	addi	s0,sp,32
 798:	e010                	sd	a2,0(s0)
 79a:	e414                	sd	a3,8(s0)
 79c:	e818                	sd	a4,16(s0)
 79e:	ec1c                	sd	a5,24(s0)
 7a0:	03043023          	sd	a6,32(s0)
 7a4:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 7a8:	8622                	mv	a2,s0
 7aa:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 7ae:	00000097          	auipc	ra,0x0
 7b2:	e04080e7          	jalr	-508(ra) # 5b2 <vprintf>
}
 7b6:	60e2                	ld	ra,24(sp)
 7b8:	6442                	ld	s0,16(sp)
 7ba:	6161                	addi	sp,sp,80
 7bc:	8082                	ret

00000000000007be <printf>:

void
printf(const char *fmt, ...)
{
 7be:	711d                	addi	sp,sp,-96
 7c0:	ec06                	sd	ra,24(sp)
 7c2:	e822                	sd	s0,16(sp)
 7c4:	1000                	addi	s0,sp,32
 7c6:	e40c                	sd	a1,8(s0)
 7c8:	e810                	sd	a2,16(s0)
 7ca:	ec14                	sd	a3,24(s0)
 7cc:	f018                	sd	a4,32(s0)
 7ce:	f41c                	sd	a5,40(s0)
 7d0:	03043823          	sd	a6,48(s0)
 7d4:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 7d8:	00840613          	addi	a2,s0,8
 7dc:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 7e0:	85aa                	mv	a1,a0
 7e2:	4505                	li	a0,1
 7e4:	00000097          	auipc	ra,0x0
 7e8:	dce080e7          	jalr	-562(ra) # 5b2 <vprintf>
}
 7ec:	60e2                	ld	ra,24(sp)
 7ee:	6442                	ld	s0,16(sp)
 7f0:	6125                	addi	sp,sp,96
 7f2:	8082                	ret

00000000000007f4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7f4:	1141                	addi	sp,sp,-16
 7f6:	e422                	sd	s0,8(sp)
 7f8:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7fa:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7fe:	00000797          	auipc	a5,0x0
 802:	48a7b783          	ld	a5,1162(a5) # c88 <freep>
 806:	a02d                	j	830 <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 808:	4618                	lw	a4,8(a2)
 80a:	9f2d                	addw	a4,a4,a1
 80c:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 810:	6398                	ld	a4,0(a5)
 812:	6310                	ld	a2,0(a4)
 814:	a83d                	j	852 <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 816:	ff852703          	lw	a4,-8(a0)
 81a:	9f31                	addw	a4,a4,a2
 81c:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 81e:	ff053683          	ld	a3,-16(a0)
 822:	a091                	j	866 <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 824:	6398                	ld	a4,0(a5)
 826:	00e7e463          	bltu	a5,a4,82e <free+0x3a>
 82a:	00e6ea63          	bltu	a3,a4,83e <free+0x4a>
{
 82e:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 830:	fed7fae3          	bgeu	a5,a3,824 <free+0x30>
 834:	6398                	ld	a4,0(a5)
 836:	00e6e463          	bltu	a3,a4,83e <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 83a:	fee7eae3          	bltu	a5,a4,82e <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
 83e:	ff852583          	lw	a1,-8(a0)
 842:	6390                	ld	a2,0(a5)
 844:	02059813          	slli	a6,a1,0x20
 848:	01c85713          	srli	a4,a6,0x1c
 84c:	9736                	add	a4,a4,a3
 84e:	fae60de3          	beq	a2,a4,808 <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
 852:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 856:	4790                	lw	a2,8(a5)
 858:	02061593          	slli	a1,a2,0x20
 85c:	01c5d713          	srli	a4,a1,0x1c
 860:	973e                	add	a4,a4,a5
 862:	fae68ae3          	beq	a3,a4,816 <free+0x22>
    p->s.ptr = bp->s.ptr;
 866:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 868:	00000717          	auipc	a4,0x0
 86c:	42f73023          	sd	a5,1056(a4) # c88 <freep>
}
 870:	6422                	ld	s0,8(sp)
 872:	0141                	addi	sp,sp,16
 874:	8082                	ret

0000000000000876 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 876:	7139                	addi	sp,sp,-64
 878:	fc06                	sd	ra,56(sp)
 87a:	f822                	sd	s0,48(sp)
 87c:	f426                	sd	s1,40(sp)
 87e:	f04a                	sd	s2,32(sp)
 880:	ec4e                	sd	s3,24(sp)
 882:	e852                	sd	s4,16(sp)
 884:	e456                	sd	s5,8(sp)
 886:	e05a                	sd	s6,0(sp)
 888:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 88a:	02051493          	slli	s1,a0,0x20
 88e:	9081                	srli	s1,s1,0x20
 890:	04bd                	addi	s1,s1,15
 892:	8091                	srli	s1,s1,0x4
 894:	00148a1b          	addiw	s4,s1,1
 898:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 89a:	00000517          	auipc	a0,0x0
 89e:	3ee53503          	ld	a0,1006(a0) # c88 <freep>
 8a2:	c515                	beqz	a0,8ce <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a4:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 8a6:	4798                	lw	a4,8(a5)
 8a8:	04977163          	bgeu	a4,s1,8ea <malloc+0x74>
 8ac:	89d2                	mv	s3,s4
 8ae:	000a071b          	sext.w	a4,s4
 8b2:	6685                	lui	a3,0x1
 8b4:	00d77363          	bgeu	a4,a3,8ba <malloc+0x44>
 8b8:	6985                	lui	s3,0x1
 8ba:	00098b1b          	sext.w	s6,s3
  p = sbrk(nu * sizeof(Header));
 8be:	0049999b          	slliw	s3,s3,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 8c2:	00000917          	auipc	s2,0x0
 8c6:	3c690913          	addi	s2,s2,966 # c88 <freep>
  if(p == (char*)-1)
 8ca:	5afd                	li	s5,-1
 8cc:	a8a5                	j	944 <malloc+0xce>
    base.s.ptr = freep = prevp = &base;
 8ce:	00000797          	auipc	a5,0x0
 8d2:	3ba78793          	addi	a5,a5,954 # c88 <freep>
 8d6:	00000717          	auipc	a4,0x0
 8da:	3ba70713          	addi	a4,a4,954 # c90 <base>
 8de:	e398                	sd	a4,0(a5)
 8e0:	e798                	sd	a4,8(a5)
    base.s.size = 0;
 8e2:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8e6:	87ba                	mv	a5,a4
 8e8:	b7d1                	j	8ac <malloc+0x36>
      if(p->s.size == nunits)
 8ea:	02e48c63          	beq	s1,a4,922 <malloc+0xac>
        p->s.size -= nunits;
 8ee:	4147073b          	subw	a4,a4,s4
 8f2:	c798                	sw	a4,8(a5)
        p += p->s.size;
 8f4:	02071693          	slli	a3,a4,0x20
 8f8:	01c6d713          	srli	a4,a3,0x1c
 8fc:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 8fe:	0147a423          	sw	s4,8(a5)
      freep = prevp;
 902:	00000717          	auipc	a4,0x0
 906:	38a73323          	sd	a0,902(a4) # c88 <freep>
      return (void*)(p + 1);
 90a:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 90e:	70e2                	ld	ra,56(sp)
 910:	7442                	ld	s0,48(sp)
 912:	74a2                	ld	s1,40(sp)
 914:	7902                	ld	s2,32(sp)
 916:	69e2                	ld	s3,24(sp)
 918:	6a42                	ld	s4,16(sp)
 91a:	6aa2                	ld	s5,8(sp)
 91c:	6b02                	ld	s6,0(sp)
 91e:	6121                	addi	sp,sp,64
 920:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 922:	6398                	ld	a4,0(a5)
 924:	e118                	sd	a4,0(a0)
 926:	bff1                	j	902 <malloc+0x8c>
  hp->s.size = nu;
 928:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 92c:	0541                	addi	a0,a0,16
 92e:	00000097          	auipc	ra,0x0
 932:	ec6080e7          	jalr	-314(ra) # 7f4 <free>
  return freep;
 936:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 93a:	d971                	beqz	a0,90e <malloc+0x98>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 93c:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 93e:	4798                	lw	a4,8(a5)
 940:	fa9775e3          	bgeu	a4,s1,8ea <malloc+0x74>
    if(p == freep)
 944:	00093703          	ld	a4,0(s2)
 948:	853e                	mv	a0,a5
 94a:	fef719e3          	bne	a4,a5,93c <malloc+0xc6>
  p = sbrk(nu * sizeof(Header));
 94e:	854e                	mv	a0,s3
 950:	00000097          	auipc	ra,0x0
 954:	b3e080e7          	jalr	-1218(ra) # 48e <sbrk>
  if(p == (char*)-1)
 958:	fd5518e3          	bne	a0,s5,928 <malloc+0xb2>
        return 0;
 95c:	4501                	li	a0,0
 95e:	bf45                	j	90e <malloc+0x98>
