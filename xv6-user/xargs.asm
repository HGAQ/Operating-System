
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
 11c:	8a858593          	addi	a1,a1,-1880 # 9c0 <malloc+0xf0>
 120:	4509                	li	a0,2
 122:	00000097          	auipc	ra,0x0
 126:	6c8080e7          	jalr	1736(ra) # 7ea <fprintf>
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
 166:	88650513          	addi	a0,a0,-1914 # 9e8 <malloc+0x118>
 16a:	00000097          	auipc	ra,0x0
 16e:	6ae080e7          	jalr	1710(ra) # 818 <printf>
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
 1a0:	84c50513          	addi	a0,a0,-1972 # 9e8 <malloc+0x118>
 1a4:	00000097          	auipc	ra,0x0
 1a8:	674080e7          	jalr	1652(ra) # 818 <printf>
                exit(0);
 1ac:	4501                	li	a0,0
 1ae:	00000097          	auipc	ra,0x0
 1b2:	2c0080e7          	jalr	704(ra) # 46e <exit>

00000000000001b6 <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
 1b6:	1141                	addi	sp,sp,-16
 1b8:	e422                	sd	s0,8(sp)
 1ba:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1bc:	87aa                	mv	a5,a0
 1be:	0585                	addi	a1,a1,1
 1c0:	0785                	addi	a5,a5,1
 1c2:	fff5c703          	lbu	a4,-1(a1)
 1c6:	fee78fa3          	sb	a4,-1(a5)
 1ca:	fb75                	bnez	a4,1be <strcpy+0x8>
    ;
  return os;
}
 1cc:	6422                	ld	s0,8(sp)
 1ce:	0141                	addi	sp,sp,16
 1d0:	8082                	ret

00000000000001d2 <strcat>:

char*
strcat(char *s, const char *t)
{
 1d2:	1141                	addi	sp,sp,-16
 1d4:	e422                	sd	s0,8(sp)
 1d6:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
 1d8:	00054783          	lbu	a5,0(a0)
 1dc:	c385                	beqz	a5,1fc <strcat+0x2a>
 1de:	87aa                	mv	a5,a0
    s++;
 1e0:	0785                	addi	a5,a5,1
  while(*s)
 1e2:	0007c703          	lbu	a4,0(a5)
 1e6:	ff6d                	bnez	a4,1e0 <strcat+0xe>
  while((*s++ = *t++))
 1e8:	0585                	addi	a1,a1,1
 1ea:	0785                	addi	a5,a5,1
 1ec:	fff5c703          	lbu	a4,-1(a1)
 1f0:	fee78fa3          	sb	a4,-1(a5)
 1f4:	fb75                	bnez	a4,1e8 <strcat+0x16>
    ;
  return os;
}
 1f6:	6422                	ld	s0,8(sp)
 1f8:	0141                	addi	sp,sp,16
 1fa:	8082                	ret
  while(*s)
 1fc:	87aa                	mv	a5,a0
 1fe:	b7ed                	j	1e8 <strcat+0x16>

0000000000000200 <strcmp>:


int
strcmp(const char *p, const char *q)
{
 200:	1141                	addi	sp,sp,-16
 202:	e422                	sd	s0,8(sp)
 204:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 206:	00054783          	lbu	a5,0(a0)
 20a:	cb91                	beqz	a5,21e <strcmp+0x1e>
 20c:	0005c703          	lbu	a4,0(a1)
 210:	00f71763          	bne	a4,a5,21e <strcmp+0x1e>
    p++, q++;
 214:	0505                	addi	a0,a0,1
 216:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 218:	00054783          	lbu	a5,0(a0)
 21c:	fbe5                	bnez	a5,20c <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 21e:	0005c503          	lbu	a0,0(a1)
}
 222:	40a7853b          	subw	a0,a5,a0
 226:	6422                	ld	s0,8(sp)
 228:	0141                	addi	sp,sp,16
 22a:	8082                	ret

000000000000022c <strlen>:

uint
strlen(const char *s)
{
 22c:	1141                	addi	sp,sp,-16
 22e:	e422                	sd	s0,8(sp)
 230:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 232:	00054783          	lbu	a5,0(a0)
 236:	cf91                	beqz	a5,252 <strlen+0x26>
 238:	0505                	addi	a0,a0,1
 23a:	87aa                	mv	a5,a0
 23c:	4685                	li	a3,1
 23e:	9e89                	subw	a3,a3,a0
 240:	00f6853b          	addw	a0,a3,a5
 244:	0785                	addi	a5,a5,1
 246:	fff7c703          	lbu	a4,-1(a5)
 24a:	fb7d                	bnez	a4,240 <strlen+0x14>
    ;
  return n;
}
 24c:	6422                	ld	s0,8(sp)
 24e:	0141                	addi	sp,sp,16
 250:	8082                	ret
  for(n = 0; s[n]; n++)
 252:	4501                	li	a0,0
 254:	bfe5                	j	24c <strlen+0x20>

0000000000000256 <memset>:

void*
memset(void *dst, int c, uint n)
{
 256:	1141                	addi	sp,sp,-16
 258:	e422                	sd	s0,8(sp)
 25a:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 25c:	ca19                	beqz	a2,272 <memset+0x1c>
 25e:	87aa                	mv	a5,a0
 260:	1602                	slli	a2,a2,0x20
 262:	9201                	srli	a2,a2,0x20
 264:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 268:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 26c:	0785                	addi	a5,a5,1
 26e:	fee79de3          	bne	a5,a4,268 <memset+0x12>
  }
  return dst;
}
 272:	6422                	ld	s0,8(sp)
 274:	0141                	addi	sp,sp,16
 276:	8082                	ret

0000000000000278 <strchr>:

char*
strchr(const char *s, char c)
{
 278:	1141                	addi	sp,sp,-16
 27a:	e422                	sd	s0,8(sp)
 27c:	0800                	addi	s0,sp,16
  for(; *s; s++)
 27e:	00054783          	lbu	a5,0(a0)
 282:	cb99                	beqz	a5,298 <strchr+0x20>
    if(*s == c)
 284:	00f58763          	beq	a1,a5,292 <strchr+0x1a>
  for(; *s; s++)
 288:	0505                	addi	a0,a0,1
 28a:	00054783          	lbu	a5,0(a0)
 28e:	fbfd                	bnez	a5,284 <strchr+0xc>
      return (char*)s;
  return 0;
 290:	4501                	li	a0,0
}
 292:	6422                	ld	s0,8(sp)
 294:	0141                	addi	sp,sp,16
 296:	8082                	ret
  return 0;
 298:	4501                	li	a0,0
 29a:	bfe5                	j	292 <strchr+0x1a>

000000000000029c <gets>:

char*
gets(char *buf, int max)
{
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
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2b8:	892a                	mv	s2,a0
 2ba:	4481                	li	s1,0
    cc = read(0, &c, 1);
 2bc:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 2c0:	4b29                	li	s6,10
 2c2:	4c35                	li	s8,13
  for(i=0; i+1 < max; ){
 2c4:	89a6                	mv	s3,s1
 2c6:	2485                	addiw	s1,s1,1
 2c8:	0344d763          	bge	s1,s4,2f6 <gets+0x5a>
    cc = read(0, &c, 1);
 2cc:	4605                	li	a2,1
 2ce:	85d6                	mv	a1,s5
 2d0:	4501                	li	a0,0
 2d2:	00000097          	auipc	ra,0x0
 2d6:	1b4080e7          	jalr	436(ra) # 486 <read>
    if(cc < 1)
 2da:	00a05e63          	blez	a0,2f6 <gets+0x5a>
    buf[i++] = c;
 2de:	faf44783          	lbu	a5,-81(s0)
 2e2:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 2e6:	01678763          	beq	a5,s6,2f4 <gets+0x58>
 2ea:	0905                	addi	s2,s2,1
 2ec:	fd879ce3          	bne	a5,s8,2c4 <gets+0x28>
  for(i=0; i+1 < max; ){
 2f0:	89a6                	mv	s3,s1
 2f2:	a011                	j	2f6 <gets+0x5a>
 2f4:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 2f6:	99de                	add	s3,s3,s7
 2f8:	00098023          	sb	zero,0(s3)
  return buf;
}
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

int
stat(const char *n, struct stat *st)
{
 316:	1101                	addi	sp,sp,-32
 318:	ec06                	sd	ra,24(sp)
 31a:	e822                	sd	s0,16(sp)
 31c:	e426                	sd	s1,8(sp)
 31e:	e04a                	sd	s2,0(sp)
 320:	1000                	addi	s0,sp,32
 322:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 324:	4581                	li	a1,0
 326:	00000097          	auipc	ra,0x0
 32a:	188080e7          	jalr	392(ra) # 4ae <open>
  if(fd < 0)
 32e:	02054563          	bltz	a0,358 <stat+0x42>
 332:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 334:	85ca                	mv	a1,s2
 336:	00000097          	auipc	ra,0x0
 33a:	180080e7          	jalr	384(ra) # 4b6 <fstat>
 33e:	892a                	mv	s2,a0
  close(fd);
 340:	8526                	mv	a0,s1
 342:	00000097          	auipc	ra,0x0
 346:	154080e7          	jalr	340(ra) # 496 <close>
  return r;
}
 34a:	854a                	mv	a0,s2
 34c:	60e2                	ld	ra,24(sp)
 34e:	6442                	ld	s0,16(sp)
 350:	64a2                	ld	s1,8(sp)
 352:	6902                	ld	s2,0(sp)
 354:	6105                	addi	sp,sp,32
 356:	8082                	ret
    return -1;
 358:	597d                	li	s2,-1
 35a:	bfc5                	j	34a <stat+0x34>

000000000000035c <atoi>:

int
atoi(const char *s)
{
 35c:	1141                	addi	sp,sp,-16
 35e:	e422                	sd	s0,8(sp)
 360:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 362:	00054703          	lbu	a4,0(a0)
 366:	02d00793          	li	a5,45
  int neg = 1;
 36a:	4585                	li	a1,1
  if (*s == '-') {
 36c:	04f70363          	beq	a4,a5,3b2 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 370:	00054703          	lbu	a4,0(a0)
 374:	fd07079b          	addiw	a5,a4,-48
 378:	0ff7f793          	zext.b	a5,a5
 37c:	46a5                	li	a3,9
 37e:	02f6ed63          	bltu	a3,a5,3b8 <atoi+0x5c>
  n = 0;
 382:	4681                	li	a3,0
  while('0' <= *s && *s <= '9')
 384:	4625                	li	a2,9
    n = n*10 + *s++ - '0';
 386:	0505                	addi	a0,a0,1
 388:	0026979b          	slliw	a5,a3,0x2
 38c:	9fb5                	addw	a5,a5,a3
 38e:	0017979b          	slliw	a5,a5,0x1
 392:	9fb9                	addw	a5,a5,a4
 394:	fd07869b          	addiw	a3,a5,-48
  while('0' <= *s && *s <= '9')
 398:	00054703          	lbu	a4,0(a0)
 39c:	fd07079b          	addiw	a5,a4,-48
 3a0:	0ff7f793          	zext.b	a5,a5
 3a4:	fef671e3          	bgeu	a2,a5,386 <atoi+0x2a>
  return n * neg;
}
 3a8:	02d5853b          	mulw	a0,a1,a3
 3ac:	6422                	ld	s0,8(sp)
 3ae:	0141                	addi	sp,sp,16
 3b0:	8082                	ret
    s++;
 3b2:	0505                	addi	a0,a0,1
    neg = -1;
 3b4:	55fd                	li	a1,-1
 3b6:	bf6d                	j	370 <atoi+0x14>
  n = 0;
 3b8:	4681                	li	a3,0
 3ba:	b7fd                	j	3a8 <atoi+0x4c>

00000000000003bc <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3bc:	1141                	addi	sp,sp,-16
 3be:	e422                	sd	s0,8(sp)
 3c0:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 3c2:	02b57463          	bgeu	a0,a1,3ea <memmove+0x2e>
    while(n-- > 0)
 3c6:	00c05f63          	blez	a2,3e4 <memmove+0x28>
 3ca:	1602                	slli	a2,a2,0x20
 3cc:	9201                	srli	a2,a2,0x20
 3ce:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 3d2:	872a                	mv	a4,a0
      *dst++ = *src++;
 3d4:	0585                	addi	a1,a1,1
 3d6:	0705                	addi	a4,a4,1
 3d8:	fff5c683          	lbu	a3,-1(a1)
 3dc:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 3e0:	fee79ae3          	bne	a5,a4,3d4 <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 3e4:	6422                	ld	s0,8(sp)
 3e6:	0141                	addi	sp,sp,16
 3e8:	8082                	ret
    dst += n;
 3ea:	00c50733          	add	a4,a0,a2
    src += n;
 3ee:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 3f0:	fec05ae3          	blez	a2,3e4 <memmove+0x28>
 3f4:	fff6079b          	addiw	a5,a2,-1
 3f8:	1782                	slli	a5,a5,0x20
 3fa:	9381                	srli	a5,a5,0x20
 3fc:	fff7c793          	not	a5,a5
 400:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 402:	15fd                	addi	a1,a1,-1
 404:	177d                	addi	a4,a4,-1
 406:	0005c683          	lbu	a3,0(a1)
 40a:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 40e:	fee79ae3          	bne	a5,a4,402 <memmove+0x46>
 412:	bfc9                	j	3e4 <memmove+0x28>

0000000000000414 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 414:	1141                	addi	sp,sp,-16
 416:	e422                	sd	s0,8(sp)
 418:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 41a:	ca05                	beqz	a2,44a <memcmp+0x36>
 41c:	fff6069b          	addiw	a3,a2,-1
 420:	1682                	slli	a3,a3,0x20
 422:	9281                	srli	a3,a3,0x20
 424:	0685                	addi	a3,a3,1
 426:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 428:	00054783          	lbu	a5,0(a0)
 42c:	0005c703          	lbu	a4,0(a1)
 430:	00e79863          	bne	a5,a4,440 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 434:	0505                	addi	a0,a0,1
    p2++;
 436:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 438:	fed518e3          	bne	a0,a3,428 <memcmp+0x14>
  }
  return 0;
 43c:	4501                	li	a0,0
 43e:	a019                	j	444 <memcmp+0x30>
      return *p1 - *p2;
 440:	40e7853b          	subw	a0,a5,a4
}
 444:	6422                	ld	s0,8(sp)
 446:	0141                	addi	sp,sp,16
 448:	8082                	ret
  return 0;
 44a:	4501                	li	a0,0
 44c:	bfe5                	j	444 <memcmp+0x30>

000000000000044e <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 44e:	1141                	addi	sp,sp,-16
 450:	e406                	sd	ra,8(sp)
 452:	e022                	sd	s0,0(sp)
 454:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 456:	00000097          	auipc	ra,0x0
 45a:	f66080e7          	jalr	-154(ra) # 3bc <memmove>
}
 45e:	60a2                	ld	ra,8(sp)
 460:	6402                	ld	s0,0(sp)
 462:	0141                	addi	sp,sp,16
 464:	8082                	ret

0000000000000466 <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 466:	4885                	li	a7,1
 ecall
 468:	00000073          	ecall
 ret
 46c:	8082                	ret

000000000000046e <exit>:
.global exit
exit:
 li a7, SYS_exit
 46e:	4889                	li	a7,2
 ecall
 470:	00000073          	ecall
 ret
 474:	8082                	ret

0000000000000476 <wait>:
.global wait
wait:
 li a7, SYS_wait
 476:	488d                	li	a7,3
 ecall
 478:	00000073          	ecall
 ret
 47c:	8082                	ret

000000000000047e <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 47e:	4891                	li	a7,4
 ecall
 480:	00000073          	ecall
 ret
 484:	8082                	ret

0000000000000486 <read>:
.global read
read:
 li a7, SYS_read
 486:	4895                	li	a7,5
 ecall
 488:	00000073          	ecall
 ret
 48c:	8082                	ret

000000000000048e <write>:
.global write
write:
 li a7, SYS_write
 48e:	48c1                	li	a7,16
 ecall
 490:	00000073          	ecall
 ret
 494:	8082                	ret

0000000000000496 <close>:
.global close
close:
 li a7, SYS_close
 496:	48d5                	li	a7,21
 ecall
 498:	00000073          	ecall
 ret
 49c:	8082                	ret

000000000000049e <kill>:
.global kill
kill:
 li a7, SYS_kill
 49e:	4899                	li	a7,6
 ecall
 4a0:	00000073          	ecall
 ret
 4a4:	8082                	ret

00000000000004a6 <exec>:
.global exec
exec:
 li a7, SYS_exec
 4a6:	489d                	li	a7,7
 ecall
 4a8:	00000073          	ecall
 ret
 4ac:	8082                	ret

00000000000004ae <open>:
.global open
open:
 li a7, SYS_open
 4ae:	48bd                	li	a7,15
 ecall
 4b0:	00000073          	ecall
 ret
 4b4:	8082                	ret

00000000000004b6 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 4b6:	48a1                	li	a7,8
 ecall
 4b8:	00000073          	ecall
 ret
 4bc:	8082                	ret

00000000000004be <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 4be:	48d1                	li	a7,20
 ecall
 4c0:	00000073          	ecall
 ret
 4c4:	8082                	ret

00000000000004c6 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 4c6:	48a5                	li	a7,9
 ecall
 4c8:	00000073          	ecall
 ret
 4cc:	8082                	ret

00000000000004ce <dup>:
.global dup
dup:
 li a7, SYS_dup
 4ce:	48a9                	li	a7,10
 ecall
 4d0:	00000073          	ecall
 ret
 4d4:	8082                	ret

00000000000004d6 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 4d6:	48ad                	li	a7,11
 ecall
 4d8:	00000073          	ecall
 ret
 4dc:	8082                	ret

00000000000004de <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 4de:	48b1                	li	a7,12
 ecall
 4e0:	00000073          	ecall
 ret
 4e4:	8082                	ret

00000000000004e6 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 4e6:	48b5                	li	a7,13
 ecall
 4e8:	00000073          	ecall
 ret
 4ec:	8082                	ret

00000000000004ee <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 4ee:	48b9                	li	a7,14
 ecall
 4f0:	00000073          	ecall
 ret
 4f4:	8082                	ret

00000000000004f6 <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 4f6:	48d9                	li	a7,22
 ecall
 4f8:	00000073          	ecall
 ret
 4fc:	8082                	ret

00000000000004fe <dev>:
.global dev
dev:
 li a7, SYS_dev
 4fe:	48dd                	li	a7,23
 ecall
 500:	00000073          	ecall
 ret
 504:	8082                	ret

0000000000000506 <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 506:	48e1                	li	a7,24
 ecall
 508:	00000073          	ecall
 ret
 50c:	8082                	ret

000000000000050e <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 50e:	48e5                	li	a7,25
 ecall
 510:	00000073          	ecall
 ret
 514:	8082                	ret

0000000000000516 <remove>:
.global remove
remove:
 li a7, SYS_remove
 516:	48c5                	li	a7,17
 ecall
 518:	00000073          	ecall
 ret
 51c:	8082                	ret

000000000000051e <trace>:
.global trace
trace:
 li a7, SYS_trace
 51e:	48c9                	li	a7,18
 ecall
 520:	00000073          	ecall
 ret
 524:	8082                	ret

0000000000000526 <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 526:	48cd                	li	a7,19
 ecall
 528:	00000073          	ecall
 ret
 52c:	8082                	ret

000000000000052e <rename>:
.global rename
rename:
 li a7, SYS_rename
 52e:	48e9                	li	a7,26
 ecall
 530:	00000073          	ecall
 ret
 534:	8082                	ret

0000000000000536 <poweroff>:
.global poweroff
poweroff:
 li a7, SYS_poweroff
 536:	0d200893          	li	a7,210
 ecall
 53a:	00000073          	ecall
 ret
 53e:	8082                	ret

0000000000000540 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 540:	1101                	addi	sp,sp,-32
 542:	ec06                	sd	ra,24(sp)
 544:	e822                	sd	s0,16(sp)
 546:	1000                	addi	s0,sp,32
 548:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 54c:	4605                	li	a2,1
 54e:	fef40593          	addi	a1,s0,-17
 552:	00000097          	auipc	ra,0x0
 556:	f3c080e7          	jalr	-196(ra) # 48e <write>
}
 55a:	60e2                	ld	ra,24(sp)
 55c:	6442                	ld	s0,16(sp)
 55e:	6105                	addi	sp,sp,32
 560:	8082                	ret

0000000000000562 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 562:	7139                	addi	sp,sp,-64
 564:	fc06                	sd	ra,56(sp)
 566:	f822                	sd	s0,48(sp)
 568:	f426                	sd	s1,40(sp)
 56a:	f04a                	sd	s2,32(sp)
 56c:	ec4e                	sd	s3,24(sp)
 56e:	0080                	addi	s0,sp,64
 570:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 572:	c299                	beqz	a3,578 <printint+0x16>
 574:	0805c863          	bltz	a1,604 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 578:	2581                	sext.w	a1,a1
  neg = 0;
 57a:	4881                	li	a7,0
  }

  i = 0;
 57c:	fc040993          	addi	s3,s0,-64
  neg = 0;
 580:	86ce                	mv	a3,s3
  i = 0;
 582:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 584:	2601                	sext.w	a2,a2
 586:	00000517          	auipc	a0,0x0
 58a:	4da50513          	addi	a0,a0,1242 # a60 <digits>
 58e:	883a                	mv	a6,a4
 590:	2705                	addiw	a4,a4,1
 592:	02c5f7bb          	remuw	a5,a1,a2
 596:	1782                	slli	a5,a5,0x20
 598:	9381                	srli	a5,a5,0x20
 59a:	97aa                	add	a5,a5,a0
 59c:	0007c783          	lbu	a5,0(a5)
 5a0:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 5a4:	0005879b          	sext.w	a5,a1
 5a8:	02c5d5bb          	divuw	a1,a1,a2
 5ac:	0685                	addi	a3,a3,1
 5ae:	fec7f0e3          	bgeu	a5,a2,58e <printint+0x2c>
  if(neg)
 5b2:	00088c63          	beqz	a7,5ca <printint+0x68>
    buf[i++] = '-';
 5b6:	fd070793          	addi	a5,a4,-48
 5ba:	00878733          	add	a4,a5,s0
 5be:	02d00793          	li	a5,45
 5c2:	fef70823          	sb	a5,-16(a4)
 5c6:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 5ca:	02e05663          	blez	a4,5f6 <printint+0x94>
 5ce:	fc040913          	addi	s2,s0,-64
 5d2:	993a                	add	s2,s2,a4
 5d4:	19fd                	addi	s3,s3,-1
 5d6:	99ba                	add	s3,s3,a4
 5d8:	377d                	addiw	a4,a4,-1
 5da:	1702                	slli	a4,a4,0x20
 5dc:	9301                	srli	a4,a4,0x20
 5de:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 5e2:	fff94583          	lbu	a1,-1(s2)
 5e6:	8526                	mv	a0,s1
 5e8:	00000097          	auipc	ra,0x0
 5ec:	f58080e7          	jalr	-168(ra) # 540 <putc>
  while(--i >= 0)
 5f0:	197d                	addi	s2,s2,-1
 5f2:	ff3918e3          	bne	s2,s3,5e2 <printint+0x80>
}
 5f6:	70e2                	ld	ra,56(sp)
 5f8:	7442                	ld	s0,48(sp)
 5fa:	74a2                	ld	s1,40(sp)
 5fc:	7902                	ld	s2,32(sp)
 5fe:	69e2                	ld	s3,24(sp)
 600:	6121                	addi	sp,sp,64
 602:	8082                	ret
    x = -xx;
 604:	40b005bb          	negw	a1,a1
    neg = 1;
 608:	4885                	li	a7,1
    x = -xx;
 60a:	bf8d                	j	57c <printint+0x1a>

000000000000060c <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 60c:	7119                	addi	sp,sp,-128
 60e:	fc86                	sd	ra,120(sp)
 610:	f8a2                	sd	s0,112(sp)
 612:	f4a6                	sd	s1,104(sp)
 614:	f0ca                	sd	s2,96(sp)
 616:	ecce                	sd	s3,88(sp)
 618:	e8d2                	sd	s4,80(sp)
 61a:	e4d6                	sd	s5,72(sp)
 61c:	e0da                	sd	s6,64(sp)
 61e:	fc5e                	sd	s7,56(sp)
 620:	f862                	sd	s8,48(sp)
 622:	f466                	sd	s9,40(sp)
 624:	f06a                	sd	s10,32(sp)
 626:	ec6e                	sd	s11,24(sp)
 628:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 62a:	0005c903          	lbu	s2,0(a1)
 62e:	18090f63          	beqz	s2,7cc <vprintf+0x1c0>
 632:	8aaa                	mv	s5,a0
 634:	8b32                	mv	s6,a2
 636:	00158493          	addi	s1,a1,1
  state = 0;
 63a:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 63c:	02500a13          	li	s4,37
 640:	4c55                	li	s8,21
 642:	00000c97          	auipc	s9,0x0
 646:	3c6c8c93          	addi	s9,s9,966 # a08 <malloc+0x138>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
        s = va_arg(ap, char*);
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 64a:	02800d93          	li	s11,40
  putc(fd, 'x');
 64e:	4d41                	li	s10,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 650:	00000b97          	auipc	s7,0x0
 654:	410b8b93          	addi	s7,s7,1040 # a60 <digits>
 658:	a839                	j	676 <vprintf+0x6a>
        putc(fd, c);
 65a:	85ca                	mv	a1,s2
 65c:	8556                	mv	a0,s5
 65e:	00000097          	auipc	ra,0x0
 662:	ee2080e7          	jalr	-286(ra) # 540 <putc>
 666:	a019                	j	66c <vprintf+0x60>
    } else if(state == '%'){
 668:	01498d63          	beq	s3,s4,682 <vprintf+0x76>
  for(i = 0; fmt[i]; i++){
 66c:	0485                	addi	s1,s1,1
 66e:	fff4c903          	lbu	s2,-1(s1)
 672:	14090d63          	beqz	s2,7cc <vprintf+0x1c0>
    if(state == 0){
 676:	fe0999e3          	bnez	s3,668 <vprintf+0x5c>
      if(c == '%'){
 67a:	ff4910e3          	bne	s2,s4,65a <vprintf+0x4e>
        state = '%';
 67e:	89d2                	mv	s3,s4
 680:	b7f5                	j	66c <vprintf+0x60>
      if(c == 'd'){
 682:	11490c63          	beq	s2,s4,79a <vprintf+0x18e>
 686:	f9d9079b          	addiw	a5,s2,-99
 68a:	0ff7f793          	zext.b	a5,a5
 68e:	10fc6e63          	bltu	s8,a5,7aa <vprintf+0x19e>
 692:	f9d9079b          	addiw	a5,s2,-99
 696:	0ff7f713          	zext.b	a4,a5
 69a:	10ec6863          	bltu	s8,a4,7aa <vprintf+0x19e>
 69e:	00271793          	slli	a5,a4,0x2
 6a2:	97e6                	add	a5,a5,s9
 6a4:	439c                	lw	a5,0(a5)
 6a6:	97e6                	add	a5,a5,s9
 6a8:	8782                	jr	a5
        printint(fd, va_arg(ap, int), 10, 1);
 6aa:	008b0913          	addi	s2,s6,8
 6ae:	4685                	li	a3,1
 6b0:	4629                	li	a2,10
 6b2:	000b2583          	lw	a1,0(s6)
 6b6:	8556                	mv	a0,s5
 6b8:	00000097          	auipc	ra,0x0
 6bc:	eaa080e7          	jalr	-342(ra) # 562 <printint>
 6c0:	8b4a                	mv	s6,s2
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6c2:	4981                	li	s3,0
 6c4:	b765                	j	66c <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 6c6:	008b0913          	addi	s2,s6,8
 6ca:	4681                	li	a3,0
 6cc:	4629                	li	a2,10
 6ce:	000b2583          	lw	a1,0(s6)
 6d2:	8556                	mv	a0,s5
 6d4:	00000097          	auipc	ra,0x0
 6d8:	e8e080e7          	jalr	-370(ra) # 562 <printint>
 6dc:	8b4a                	mv	s6,s2
      state = 0;
 6de:	4981                	li	s3,0
 6e0:	b771                	j	66c <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 6e2:	008b0913          	addi	s2,s6,8
 6e6:	4681                	li	a3,0
 6e8:	866a                	mv	a2,s10
 6ea:	000b2583          	lw	a1,0(s6)
 6ee:	8556                	mv	a0,s5
 6f0:	00000097          	auipc	ra,0x0
 6f4:	e72080e7          	jalr	-398(ra) # 562 <printint>
 6f8:	8b4a                	mv	s6,s2
      state = 0;
 6fa:	4981                	li	s3,0
 6fc:	bf85                	j	66c <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 6fe:	008b0793          	addi	a5,s6,8
 702:	f8f43423          	sd	a5,-120(s0)
 706:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 70a:	03000593          	li	a1,48
 70e:	8556                	mv	a0,s5
 710:	00000097          	auipc	ra,0x0
 714:	e30080e7          	jalr	-464(ra) # 540 <putc>
  putc(fd, 'x');
 718:	07800593          	li	a1,120
 71c:	8556                	mv	a0,s5
 71e:	00000097          	auipc	ra,0x0
 722:	e22080e7          	jalr	-478(ra) # 540 <putc>
 726:	896a                	mv	s2,s10
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 728:	03c9d793          	srli	a5,s3,0x3c
 72c:	97de                	add	a5,a5,s7
 72e:	0007c583          	lbu	a1,0(a5)
 732:	8556                	mv	a0,s5
 734:	00000097          	auipc	ra,0x0
 738:	e0c080e7          	jalr	-500(ra) # 540 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 73c:	0992                	slli	s3,s3,0x4
 73e:	397d                	addiw	s2,s2,-1
 740:	fe0914e3          	bnez	s2,728 <vprintf+0x11c>
        printptr(fd, va_arg(ap, uint64));
 744:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 748:	4981                	li	s3,0
 74a:	b70d                	j	66c <vprintf+0x60>
        s = va_arg(ap, char*);
 74c:	008b0913          	addi	s2,s6,8
 750:	000b3983          	ld	s3,0(s6)
        if(s == 0)
 754:	02098163          	beqz	s3,776 <vprintf+0x16a>
        while(*s != 0){
 758:	0009c583          	lbu	a1,0(s3)
 75c:	c5ad                	beqz	a1,7c6 <vprintf+0x1ba>
          putc(fd, *s);
 75e:	8556                	mv	a0,s5
 760:	00000097          	auipc	ra,0x0
 764:	de0080e7          	jalr	-544(ra) # 540 <putc>
          s++;
 768:	0985                	addi	s3,s3,1
        while(*s != 0){
 76a:	0009c583          	lbu	a1,0(s3)
 76e:	f9e5                	bnez	a1,75e <vprintf+0x152>
        s = va_arg(ap, char*);
 770:	8b4a                	mv	s6,s2
      state = 0;
 772:	4981                	li	s3,0
 774:	bde5                	j	66c <vprintf+0x60>
          s = "(null)";
 776:	00000997          	auipc	s3,0x0
 77a:	28a98993          	addi	s3,s3,650 # a00 <malloc+0x130>
        while(*s != 0){
 77e:	85ee                	mv	a1,s11
 780:	bff9                	j	75e <vprintf+0x152>
        putc(fd, va_arg(ap, uint));
 782:	008b0913          	addi	s2,s6,8
 786:	000b4583          	lbu	a1,0(s6)
 78a:	8556                	mv	a0,s5
 78c:	00000097          	auipc	ra,0x0
 790:	db4080e7          	jalr	-588(ra) # 540 <putc>
 794:	8b4a                	mv	s6,s2
      state = 0;
 796:	4981                	li	s3,0
 798:	bdd1                	j	66c <vprintf+0x60>
        putc(fd, c);
 79a:	85d2                	mv	a1,s4
 79c:	8556                	mv	a0,s5
 79e:	00000097          	auipc	ra,0x0
 7a2:	da2080e7          	jalr	-606(ra) # 540 <putc>
      state = 0;
 7a6:	4981                	li	s3,0
 7a8:	b5d1                	j	66c <vprintf+0x60>
        putc(fd, '%');
 7aa:	85d2                	mv	a1,s4
 7ac:	8556                	mv	a0,s5
 7ae:	00000097          	auipc	ra,0x0
 7b2:	d92080e7          	jalr	-622(ra) # 540 <putc>
        putc(fd, c);
 7b6:	85ca                	mv	a1,s2
 7b8:	8556                	mv	a0,s5
 7ba:	00000097          	auipc	ra,0x0
 7be:	d86080e7          	jalr	-634(ra) # 540 <putc>
      state = 0;
 7c2:	4981                	li	s3,0
 7c4:	b565                	j	66c <vprintf+0x60>
        s = va_arg(ap, char*);
 7c6:	8b4a                	mv	s6,s2
      state = 0;
 7c8:	4981                	li	s3,0
 7ca:	b54d                	j	66c <vprintf+0x60>
    }
  }
}
 7cc:	70e6                	ld	ra,120(sp)
 7ce:	7446                	ld	s0,112(sp)
 7d0:	74a6                	ld	s1,104(sp)
 7d2:	7906                	ld	s2,96(sp)
 7d4:	69e6                	ld	s3,88(sp)
 7d6:	6a46                	ld	s4,80(sp)
 7d8:	6aa6                	ld	s5,72(sp)
 7da:	6b06                	ld	s6,64(sp)
 7dc:	7be2                	ld	s7,56(sp)
 7de:	7c42                	ld	s8,48(sp)
 7e0:	7ca2                	ld	s9,40(sp)
 7e2:	7d02                	ld	s10,32(sp)
 7e4:	6de2                	ld	s11,24(sp)
 7e6:	6109                	addi	sp,sp,128
 7e8:	8082                	ret

00000000000007ea <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 7ea:	715d                	addi	sp,sp,-80
 7ec:	ec06                	sd	ra,24(sp)
 7ee:	e822                	sd	s0,16(sp)
 7f0:	1000                	addi	s0,sp,32
 7f2:	e010                	sd	a2,0(s0)
 7f4:	e414                	sd	a3,8(s0)
 7f6:	e818                	sd	a4,16(s0)
 7f8:	ec1c                	sd	a5,24(s0)
 7fa:	03043023          	sd	a6,32(s0)
 7fe:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 802:	8622                	mv	a2,s0
 804:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 808:	00000097          	auipc	ra,0x0
 80c:	e04080e7          	jalr	-508(ra) # 60c <vprintf>
}
 810:	60e2                	ld	ra,24(sp)
 812:	6442                	ld	s0,16(sp)
 814:	6161                	addi	sp,sp,80
 816:	8082                	ret

0000000000000818 <printf>:

void
printf(const char *fmt, ...)
{
 818:	711d                	addi	sp,sp,-96
 81a:	ec06                	sd	ra,24(sp)
 81c:	e822                	sd	s0,16(sp)
 81e:	1000                	addi	s0,sp,32
 820:	e40c                	sd	a1,8(s0)
 822:	e810                	sd	a2,16(s0)
 824:	ec14                	sd	a3,24(s0)
 826:	f018                	sd	a4,32(s0)
 828:	f41c                	sd	a5,40(s0)
 82a:	03043823          	sd	a6,48(s0)
 82e:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 832:	00840613          	addi	a2,s0,8
 836:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 83a:	85aa                	mv	a1,a0
 83c:	4505                	li	a0,1
 83e:	00000097          	auipc	ra,0x0
 842:	dce080e7          	jalr	-562(ra) # 60c <vprintf>
}
 846:	60e2                	ld	ra,24(sp)
 848:	6442                	ld	s0,16(sp)
 84a:	6125                	addi	sp,sp,96
 84c:	8082                	ret

000000000000084e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 84e:	1141                	addi	sp,sp,-16
 850:	e422                	sd	s0,8(sp)
 852:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 854:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 858:	00000797          	auipc	a5,0x0
 85c:	2207b783          	ld	a5,544(a5) # a78 <freep>
 860:	a02d                	j	88a <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 862:	4618                	lw	a4,8(a2)
 864:	9f2d                	addw	a4,a4,a1
 866:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 86a:	6398                	ld	a4,0(a5)
 86c:	6310                	ld	a2,0(a4)
 86e:	a83d                	j	8ac <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 870:	ff852703          	lw	a4,-8(a0)
 874:	9f31                	addw	a4,a4,a2
 876:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 878:	ff053683          	ld	a3,-16(a0)
 87c:	a091                	j	8c0 <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 87e:	6398                	ld	a4,0(a5)
 880:	00e7e463          	bltu	a5,a4,888 <free+0x3a>
 884:	00e6ea63          	bltu	a3,a4,898 <free+0x4a>
{
 888:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 88a:	fed7fae3          	bgeu	a5,a3,87e <free+0x30>
 88e:	6398                	ld	a4,0(a5)
 890:	00e6e463          	bltu	a3,a4,898 <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 894:	fee7eae3          	bltu	a5,a4,888 <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
 898:	ff852583          	lw	a1,-8(a0)
 89c:	6390                	ld	a2,0(a5)
 89e:	02059813          	slli	a6,a1,0x20
 8a2:	01c85713          	srli	a4,a6,0x1c
 8a6:	9736                	add	a4,a4,a3
 8a8:	fae60de3          	beq	a2,a4,862 <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
 8ac:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 8b0:	4790                	lw	a2,8(a5)
 8b2:	02061593          	slli	a1,a2,0x20
 8b6:	01c5d713          	srli	a4,a1,0x1c
 8ba:	973e                	add	a4,a4,a5
 8bc:	fae68ae3          	beq	a3,a4,870 <free+0x22>
    p->s.ptr = bp->s.ptr;
 8c0:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 8c2:	00000717          	auipc	a4,0x0
 8c6:	1af73b23          	sd	a5,438(a4) # a78 <freep>
}
 8ca:	6422                	ld	s0,8(sp)
 8cc:	0141                	addi	sp,sp,16
 8ce:	8082                	ret

00000000000008d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8d0:	7139                	addi	sp,sp,-64
 8d2:	fc06                	sd	ra,56(sp)
 8d4:	f822                	sd	s0,48(sp)
 8d6:	f426                	sd	s1,40(sp)
 8d8:	f04a                	sd	s2,32(sp)
 8da:	ec4e                	sd	s3,24(sp)
 8dc:	e852                	sd	s4,16(sp)
 8de:	e456                	sd	s5,8(sp)
 8e0:	e05a                	sd	s6,0(sp)
 8e2:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8e4:	02051493          	slli	s1,a0,0x20
 8e8:	9081                	srli	s1,s1,0x20
 8ea:	04bd                	addi	s1,s1,15
 8ec:	8091                	srli	s1,s1,0x4
 8ee:	00148a1b          	addiw	s4,s1,1
 8f2:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 8f4:	00000517          	auipc	a0,0x0
 8f8:	18453503          	ld	a0,388(a0) # a78 <freep>
 8fc:	c515                	beqz	a0,928 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8fe:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 900:	4798                	lw	a4,8(a5)
 902:	04977163          	bgeu	a4,s1,944 <malloc+0x74>
 906:	89d2                	mv	s3,s4
 908:	000a071b          	sext.w	a4,s4
 90c:	6685                	lui	a3,0x1
 90e:	00d77363          	bgeu	a4,a3,914 <malloc+0x44>
 912:	6985                	lui	s3,0x1
 914:	00098b1b          	sext.w	s6,s3
  p = sbrk(nu * sizeof(Header));
 918:	0049999b          	slliw	s3,s3,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 91c:	00000917          	auipc	s2,0x0
 920:	15c90913          	addi	s2,s2,348 # a78 <freep>
  if(p == (char*)-1)
 924:	5afd                	li	s5,-1
 926:	a8a5                	j	99e <malloc+0xce>
    base.s.ptr = freep = prevp = &base;
 928:	00000797          	auipc	a5,0x0
 92c:	15078793          	addi	a5,a5,336 # a78 <freep>
 930:	00000717          	auipc	a4,0x0
 934:	15070713          	addi	a4,a4,336 # a80 <base>
 938:	e398                	sd	a4,0(a5)
 93a:	e798                	sd	a4,8(a5)
    base.s.size = 0;
 93c:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 940:	87ba                	mv	a5,a4
 942:	b7d1                	j	906 <malloc+0x36>
      if(p->s.size == nunits)
 944:	02e48c63          	beq	s1,a4,97c <malloc+0xac>
        p->s.size -= nunits;
 948:	4147073b          	subw	a4,a4,s4
 94c:	c798                	sw	a4,8(a5)
        p += p->s.size;
 94e:	02071693          	slli	a3,a4,0x20
 952:	01c6d713          	srli	a4,a3,0x1c
 956:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 958:	0147a423          	sw	s4,8(a5)
      freep = prevp;
 95c:	00000717          	auipc	a4,0x0
 960:	10a73e23          	sd	a0,284(a4) # a78 <freep>
      return (void*)(p + 1);
 964:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 968:	70e2                	ld	ra,56(sp)
 96a:	7442                	ld	s0,48(sp)
 96c:	74a2                	ld	s1,40(sp)
 96e:	7902                	ld	s2,32(sp)
 970:	69e2                	ld	s3,24(sp)
 972:	6a42                	ld	s4,16(sp)
 974:	6aa2                	ld	s5,8(sp)
 976:	6b02                	ld	s6,0(sp)
 978:	6121                	addi	sp,sp,64
 97a:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 97c:	6398                	ld	a4,0(a5)
 97e:	e118                	sd	a4,0(a0)
 980:	bff1                	j	95c <malloc+0x8c>
  hp->s.size = nu;
 982:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 986:	0541                	addi	a0,a0,16
 988:	00000097          	auipc	ra,0x0
 98c:	ec6080e7          	jalr	-314(ra) # 84e <free>
  return freep;
 990:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 994:	d971                	beqz	a0,968 <malloc+0x98>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 996:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 998:	4798                	lw	a4,8(a5)
 99a:	fa9775e3          	bgeu	a4,s1,944 <malloc+0x74>
    if(p == freep)
 99e:	00093703          	ld	a4,0(s2)
 9a2:	853e                	mv	a0,a5
 9a4:	fef719e3          	bne	a4,a5,996 <malloc+0xc6>
  p = sbrk(nu * sizeof(Header));
 9a8:	854e                	mv	a0,s3
 9aa:	00000097          	auipc	ra,0x0
 9ae:	b34080e7          	jalr	-1228(ra) # 4de <sbrk>
  if(p == (char*)-1)
 9b2:	fd5518e3          	bne	a0,s5,982 <malloc+0xb2>
        return 0;
 9b6:	4501                	li	a0,0
 9b8:	bf45                	j	968 <malloc+0x98>
