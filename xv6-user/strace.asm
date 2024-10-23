
xv6-user/_strace:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/include/stat.h"
#include "xv6-user/user.h"

int
main(int argc, char *argv[])
{
   0:	712d                	addi	sp,sp,-288
   2:	ee06                	sd	ra,280(sp)
   4:	ea22                	sd	s0,272(sp)
   6:	e626                	sd	s1,264(sp)
   8:	e24a                	sd	s2,256(sp)
   a:	1200                	addi	s0,sp,288
   c:	892e                	mv	s2,a1
  int i;
  char *nargv[MAXARG];

  if(argc < 3 /*|| (argv[1][0] < '0' || argv[1][0] > '9')*/){
   e:	4789                	li	a5,2
  10:	02a7c163          	blt	a5,a0,32 <main+0x32>
    fprintf(2, "usage: %s MASK COMMAND\n", argv[0]);
  14:	6190                	ld	a2,0(a1)
  16:	00001597          	auipc	a1,0x1
  1a:	8b258593          	addi	a1,a1,-1870 # 8c8 <malloc+0xec>
  1e:	4509                	li	a0,2
  20:	00000097          	auipc	ra,0x0
  24:	6d6080e7          	jalr	1750(ra) # 6f6 <fprintf>
    exit(1);
  28:	4505                	li	a0,1
  2a:	00000097          	auipc	ra,0x0
  2e:	350080e7          	jalr	848(ra) # 37a <exit>
  32:	84aa                	mv	s1,a0
  }

  if (trace(atoi(argv[1])) < 0) {
  34:	6588                	ld	a0,8(a1)
  36:	00000097          	auipc	ra,0x0
  3a:	232080e7          	jalr	562(ra) # 268 <atoi>
  3e:	00000097          	auipc	ra,0x0
  42:	3ec080e7          	jalr	1004(ra) # 42a <trace>
  46:	04054e63          	bltz	a0,a2 <main+0xa2>
  4a:	01090793          	addi	a5,s2,16
  4e:	ee040713          	addi	a4,s0,-288
  52:	ffd4869b          	addiw	a3,s1,-3
  56:	02069613          	slli	a2,a3,0x20
  5a:	01d65693          	srli	a3,a2,0x1d
  5e:	96be                	add	a3,a3,a5
  60:	10090593          	addi	a1,s2,256
    fprintf(2, "%s: strace failed\n", argv[0]);
    exit(1);
  }
  
  for(i = 2; i < argc && i < MAXARG; i++){
    nargv[i-2] = argv[i];
  64:	6390                	ld	a2,0(a5)
  66:	e310                	sd	a2,0(a4)
  for(i = 2; i < argc && i < MAXARG; i++){
  68:	00d78663          	beq	a5,a3,74 <main+0x74>
  6c:	07a1                	addi	a5,a5,8
  6e:	0721                	addi	a4,a4,8
  70:	feb79ae3          	bne	a5,a1,64 <main+0x64>
  }
  exec(nargv[0], nargv);  
  74:	ee040593          	addi	a1,s0,-288
  78:	ee043503          	ld	a0,-288(s0)
  7c:	00000097          	auipc	ra,0x0
  80:	336080e7          	jalr	822(ra) # 3b2 <exec>
  printf("strace: exec %s fail\n", nargv[0]);
  84:	ee043583          	ld	a1,-288(s0)
  88:	00001517          	auipc	a0,0x1
  8c:	87050513          	addi	a0,a0,-1936 # 8f8 <malloc+0x11c>
  90:	00000097          	auipc	ra,0x0
  94:	694080e7          	jalr	1684(ra) # 724 <printf>
  exit(0);
  98:	4501                	li	a0,0
  9a:	00000097          	auipc	ra,0x0
  9e:	2e0080e7          	jalr	736(ra) # 37a <exit>
    fprintf(2, "%s: strace failed\n", argv[0]);
  a2:	00093603          	ld	a2,0(s2)
  a6:	00001597          	auipc	a1,0x1
  aa:	83a58593          	addi	a1,a1,-1990 # 8e0 <malloc+0x104>
  ae:	4509                	li	a0,2
  b0:	00000097          	auipc	ra,0x0
  b4:	646080e7          	jalr	1606(ra) # 6f6 <fprintf>
    exit(1);
  b8:	4505                	li	a0,1
  ba:	00000097          	auipc	ra,0x0
  be:	2c0080e7          	jalr	704(ra) # 37a <exit>

00000000000000c2 <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
  c2:	1141                	addi	sp,sp,-16
  c4:	e422                	sd	s0,8(sp)
  c6:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  c8:	87aa                	mv	a5,a0
  ca:	0585                	addi	a1,a1,1
  cc:	0785                	addi	a5,a5,1
  ce:	fff5c703          	lbu	a4,-1(a1)
  d2:	fee78fa3          	sb	a4,-1(a5)
  d6:	fb75                	bnez	a4,ca <strcpy+0x8>
    ;
  return os;
}
  d8:	6422                	ld	s0,8(sp)
  da:	0141                	addi	sp,sp,16
  dc:	8082                	ret

00000000000000de <strcat>:

char*
strcat(char *s, const char *t)
{
  de:	1141                	addi	sp,sp,-16
  e0:	e422                	sd	s0,8(sp)
  e2:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
  e4:	00054783          	lbu	a5,0(a0)
  e8:	c385                	beqz	a5,108 <strcat+0x2a>
  ea:	87aa                	mv	a5,a0
    s++;
  ec:	0785                	addi	a5,a5,1
  while(*s)
  ee:	0007c703          	lbu	a4,0(a5)
  f2:	ff6d                	bnez	a4,ec <strcat+0xe>
  while((*s++ = *t++))
  f4:	0585                	addi	a1,a1,1
  f6:	0785                	addi	a5,a5,1
  f8:	fff5c703          	lbu	a4,-1(a1)
  fc:	fee78fa3          	sb	a4,-1(a5)
 100:	fb75                	bnez	a4,f4 <strcat+0x16>
    ;
  return os;
}
 102:	6422                	ld	s0,8(sp)
 104:	0141                	addi	sp,sp,16
 106:	8082                	ret
  while(*s)
 108:	87aa                	mv	a5,a0
 10a:	b7ed                	j	f4 <strcat+0x16>

000000000000010c <strcmp>:


int
strcmp(const char *p, const char *q)
{
 10c:	1141                	addi	sp,sp,-16
 10e:	e422                	sd	s0,8(sp)
 110:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 112:	00054783          	lbu	a5,0(a0)
 116:	cb91                	beqz	a5,12a <strcmp+0x1e>
 118:	0005c703          	lbu	a4,0(a1)
 11c:	00f71763          	bne	a4,a5,12a <strcmp+0x1e>
    p++, q++;
 120:	0505                	addi	a0,a0,1
 122:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 124:	00054783          	lbu	a5,0(a0)
 128:	fbe5                	bnez	a5,118 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 12a:	0005c503          	lbu	a0,0(a1)
}
 12e:	40a7853b          	subw	a0,a5,a0
 132:	6422                	ld	s0,8(sp)
 134:	0141                	addi	sp,sp,16
 136:	8082                	ret

0000000000000138 <strlen>:

uint
strlen(const char *s)
{
 138:	1141                	addi	sp,sp,-16
 13a:	e422                	sd	s0,8(sp)
 13c:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 13e:	00054783          	lbu	a5,0(a0)
 142:	cf91                	beqz	a5,15e <strlen+0x26>
 144:	0505                	addi	a0,a0,1
 146:	87aa                	mv	a5,a0
 148:	4685                	li	a3,1
 14a:	9e89                	subw	a3,a3,a0
 14c:	00f6853b          	addw	a0,a3,a5
 150:	0785                	addi	a5,a5,1
 152:	fff7c703          	lbu	a4,-1(a5)
 156:	fb7d                	bnez	a4,14c <strlen+0x14>
    ;
  return n;
}
 158:	6422                	ld	s0,8(sp)
 15a:	0141                	addi	sp,sp,16
 15c:	8082                	ret
  for(n = 0; s[n]; n++)
 15e:	4501                	li	a0,0
 160:	bfe5                	j	158 <strlen+0x20>

0000000000000162 <memset>:

void*
memset(void *dst, int c, uint n)
{
 162:	1141                	addi	sp,sp,-16
 164:	e422                	sd	s0,8(sp)
 166:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 168:	ca19                	beqz	a2,17e <memset+0x1c>
 16a:	87aa                	mv	a5,a0
 16c:	1602                	slli	a2,a2,0x20
 16e:	9201                	srli	a2,a2,0x20
 170:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 174:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 178:	0785                	addi	a5,a5,1
 17a:	fee79de3          	bne	a5,a4,174 <memset+0x12>
  }
  return dst;
}
 17e:	6422                	ld	s0,8(sp)
 180:	0141                	addi	sp,sp,16
 182:	8082                	ret

0000000000000184 <strchr>:

char*
strchr(const char *s, char c)
{
 184:	1141                	addi	sp,sp,-16
 186:	e422                	sd	s0,8(sp)
 188:	0800                	addi	s0,sp,16
  for(; *s; s++)
 18a:	00054783          	lbu	a5,0(a0)
 18e:	cb99                	beqz	a5,1a4 <strchr+0x20>
    if(*s == c)
 190:	00f58763          	beq	a1,a5,19e <strchr+0x1a>
  for(; *s; s++)
 194:	0505                	addi	a0,a0,1
 196:	00054783          	lbu	a5,0(a0)
 19a:	fbfd                	bnez	a5,190 <strchr+0xc>
      return (char*)s;
  return 0;
 19c:	4501                	li	a0,0
}
 19e:	6422                	ld	s0,8(sp)
 1a0:	0141                	addi	sp,sp,16
 1a2:	8082                	ret
  return 0;
 1a4:	4501                	li	a0,0
 1a6:	bfe5                	j	19e <strchr+0x1a>

00000000000001a8 <gets>:

char*
gets(char *buf, int max)
{
 1a8:	711d                	addi	sp,sp,-96
 1aa:	ec86                	sd	ra,88(sp)
 1ac:	e8a2                	sd	s0,80(sp)
 1ae:	e4a6                	sd	s1,72(sp)
 1b0:	e0ca                	sd	s2,64(sp)
 1b2:	fc4e                	sd	s3,56(sp)
 1b4:	f852                	sd	s4,48(sp)
 1b6:	f456                	sd	s5,40(sp)
 1b8:	f05a                	sd	s6,32(sp)
 1ba:	ec5e                	sd	s7,24(sp)
 1bc:	e862                	sd	s8,16(sp)
 1be:	1080                	addi	s0,sp,96
 1c0:	8baa                	mv	s7,a0
 1c2:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1c4:	892a                	mv	s2,a0
 1c6:	4481                	li	s1,0
    cc = read(0, &c, 1);
 1c8:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 1cc:	4b29                	li	s6,10
 1ce:	4c35                	li	s8,13
  for(i=0; i+1 < max; ){
 1d0:	89a6                	mv	s3,s1
 1d2:	2485                	addiw	s1,s1,1
 1d4:	0344d763          	bge	s1,s4,202 <gets+0x5a>
    cc = read(0, &c, 1);
 1d8:	4605                	li	a2,1
 1da:	85d6                	mv	a1,s5
 1dc:	4501                	li	a0,0
 1de:	00000097          	auipc	ra,0x0
 1e2:	1b4080e7          	jalr	436(ra) # 392 <read>
    if(cc < 1)
 1e6:	00a05e63          	blez	a0,202 <gets+0x5a>
    buf[i++] = c;
 1ea:	faf44783          	lbu	a5,-81(s0)
 1ee:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 1f2:	01678763          	beq	a5,s6,200 <gets+0x58>
 1f6:	0905                	addi	s2,s2,1
 1f8:	fd879ce3          	bne	a5,s8,1d0 <gets+0x28>
  for(i=0; i+1 < max; ){
 1fc:	89a6                	mv	s3,s1
 1fe:	a011                	j	202 <gets+0x5a>
 200:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 202:	99de                	add	s3,s3,s7
 204:	00098023          	sb	zero,0(s3)
  return buf;
}
 208:	855e                	mv	a0,s7
 20a:	60e6                	ld	ra,88(sp)
 20c:	6446                	ld	s0,80(sp)
 20e:	64a6                	ld	s1,72(sp)
 210:	6906                	ld	s2,64(sp)
 212:	79e2                	ld	s3,56(sp)
 214:	7a42                	ld	s4,48(sp)
 216:	7aa2                	ld	s5,40(sp)
 218:	7b02                	ld	s6,32(sp)
 21a:	6be2                	ld	s7,24(sp)
 21c:	6c42                	ld	s8,16(sp)
 21e:	6125                	addi	sp,sp,96
 220:	8082                	ret

0000000000000222 <stat>:

int
stat(const char *n, struct stat *st)
{
 222:	1101                	addi	sp,sp,-32
 224:	ec06                	sd	ra,24(sp)
 226:	e822                	sd	s0,16(sp)
 228:	e426                	sd	s1,8(sp)
 22a:	e04a                	sd	s2,0(sp)
 22c:	1000                	addi	s0,sp,32
 22e:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 230:	4581                	li	a1,0
 232:	00000097          	auipc	ra,0x0
 236:	188080e7          	jalr	392(ra) # 3ba <open>
  if(fd < 0)
 23a:	02054563          	bltz	a0,264 <stat+0x42>
 23e:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 240:	85ca                	mv	a1,s2
 242:	00000097          	auipc	ra,0x0
 246:	180080e7          	jalr	384(ra) # 3c2 <fstat>
 24a:	892a                	mv	s2,a0
  close(fd);
 24c:	8526                	mv	a0,s1
 24e:	00000097          	auipc	ra,0x0
 252:	154080e7          	jalr	340(ra) # 3a2 <close>
  return r;
}
 256:	854a                	mv	a0,s2
 258:	60e2                	ld	ra,24(sp)
 25a:	6442                	ld	s0,16(sp)
 25c:	64a2                	ld	s1,8(sp)
 25e:	6902                	ld	s2,0(sp)
 260:	6105                	addi	sp,sp,32
 262:	8082                	ret
    return -1;
 264:	597d                	li	s2,-1
 266:	bfc5                	j	256 <stat+0x34>

0000000000000268 <atoi>:

int
atoi(const char *s)
{
 268:	1141                	addi	sp,sp,-16
 26a:	e422                	sd	s0,8(sp)
 26c:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 26e:	00054703          	lbu	a4,0(a0)
 272:	02d00793          	li	a5,45
  int neg = 1;
 276:	4585                	li	a1,1
  if (*s == '-') {
 278:	04f70363          	beq	a4,a5,2be <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 27c:	00054703          	lbu	a4,0(a0)
 280:	fd07079b          	addiw	a5,a4,-48
 284:	0ff7f793          	zext.b	a5,a5
 288:	46a5                	li	a3,9
 28a:	02f6ed63          	bltu	a3,a5,2c4 <atoi+0x5c>
  n = 0;
 28e:	4681                	li	a3,0
  while('0' <= *s && *s <= '9')
 290:	4625                	li	a2,9
    n = n*10 + *s++ - '0';
 292:	0505                	addi	a0,a0,1
 294:	0026979b          	slliw	a5,a3,0x2
 298:	9fb5                	addw	a5,a5,a3
 29a:	0017979b          	slliw	a5,a5,0x1
 29e:	9fb9                	addw	a5,a5,a4
 2a0:	fd07869b          	addiw	a3,a5,-48
  while('0' <= *s && *s <= '9')
 2a4:	00054703          	lbu	a4,0(a0)
 2a8:	fd07079b          	addiw	a5,a4,-48
 2ac:	0ff7f793          	zext.b	a5,a5
 2b0:	fef671e3          	bgeu	a2,a5,292 <atoi+0x2a>
  return n * neg;
}
 2b4:	02d5853b          	mulw	a0,a1,a3
 2b8:	6422                	ld	s0,8(sp)
 2ba:	0141                	addi	sp,sp,16
 2bc:	8082                	ret
    s++;
 2be:	0505                	addi	a0,a0,1
    neg = -1;
 2c0:	55fd                	li	a1,-1
 2c2:	bf6d                	j	27c <atoi+0x14>
  n = 0;
 2c4:	4681                	li	a3,0
 2c6:	b7fd                	j	2b4 <atoi+0x4c>

00000000000002c8 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2c8:	1141                	addi	sp,sp,-16
 2ca:	e422                	sd	s0,8(sp)
 2cc:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 2ce:	02b57463          	bgeu	a0,a1,2f6 <memmove+0x2e>
    while(n-- > 0)
 2d2:	00c05f63          	blez	a2,2f0 <memmove+0x28>
 2d6:	1602                	slli	a2,a2,0x20
 2d8:	9201                	srli	a2,a2,0x20
 2da:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 2de:	872a                	mv	a4,a0
      *dst++ = *src++;
 2e0:	0585                	addi	a1,a1,1
 2e2:	0705                	addi	a4,a4,1
 2e4:	fff5c683          	lbu	a3,-1(a1)
 2e8:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 2ec:	fee79ae3          	bne	a5,a4,2e0 <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 2f0:	6422                	ld	s0,8(sp)
 2f2:	0141                	addi	sp,sp,16
 2f4:	8082                	ret
    dst += n;
 2f6:	00c50733          	add	a4,a0,a2
    src += n;
 2fa:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 2fc:	fec05ae3          	blez	a2,2f0 <memmove+0x28>
 300:	fff6079b          	addiw	a5,a2,-1
 304:	1782                	slli	a5,a5,0x20
 306:	9381                	srli	a5,a5,0x20
 308:	fff7c793          	not	a5,a5
 30c:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 30e:	15fd                	addi	a1,a1,-1
 310:	177d                	addi	a4,a4,-1
 312:	0005c683          	lbu	a3,0(a1)
 316:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 31a:	fee79ae3          	bne	a5,a4,30e <memmove+0x46>
 31e:	bfc9                	j	2f0 <memmove+0x28>

0000000000000320 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 320:	1141                	addi	sp,sp,-16
 322:	e422                	sd	s0,8(sp)
 324:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 326:	ca05                	beqz	a2,356 <memcmp+0x36>
 328:	fff6069b          	addiw	a3,a2,-1
 32c:	1682                	slli	a3,a3,0x20
 32e:	9281                	srli	a3,a3,0x20
 330:	0685                	addi	a3,a3,1
 332:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 334:	00054783          	lbu	a5,0(a0)
 338:	0005c703          	lbu	a4,0(a1)
 33c:	00e79863          	bne	a5,a4,34c <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 340:	0505                	addi	a0,a0,1
    p2++;
 342:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 344:	fed518e3          	bne	a0,a3,334 <memcmp+0x14>
  }
  return 0;
 348:	4501                	li	a0,0
 34a:	a019                	j	350 <memcmp+0x30>
      return *p1 - *p2;
 34c:	40e7853b          	subw	a0,a5,a4
}
 350:	6422                	ld	s0,8(sp)
 352:	0141                	addi	sp,sp,16
 354:	8082                	ret
  return 0;
 356:	4501                	li	a0,0
 358:	bfe5                	j	350 <memcmp+0x30>

000000000000035a <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 35a:	1141                	addi	sp,sp,-16
 35c:	e406                	sd	ra,8(sp)
 35e:	e022                	sd	s0,0(sp)
 360:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 362:	00000097          	auipc	ra,0x0
 366:	f66080e7          	jalr	-154(ra) # 2c8 <memmove>
}
 36a:	60a2                	ld	ra,8(sp)
 36c:	6402                	ld	s0,0(sp)
 36e:	0141                	addi	sp,sp,16
 370:	8082                	ret

0000000000000372 <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 372:	4885                	li	a7,1
 ecall
 374:	00000073          	ecall
 ret
 378:	8082                	ret

000000000000037a <exit>:
.global exit
exit:
 li a7, SYS_exit
 37a:	4889                	li	a7,2
 ecall
 37c:	00000073          	ecall
 ret
 380:	8082                	ret

0000000000000382 <wait>:
.global wait
wait:
 li a7, SYS_wait
 382:	488d                	li	a7,3
 ecall
 384:	00000073          	ecall
 ret
 388:	8082                	ret

000000000000038a <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 38a:	4891                	li	a7,4
 ecall
 38c:	00000073          	ecall
 ret
 390:	8082                	ret

0000000000000392 <read>:
.global read
read:
 li a7, SYS_read
 392:	4895                	li	a7,5
 ecall
 394:	00000073          	ecall
 ret
 398:	8082                	ret

000000000000039a <write>:
.global write
write:
 li a7, SYS_write
 39a:	48c1                	li	a7,16
 ecall
 39c:	00000073          	ecall
 ret
 3a0:	8082                	ret

00000000000003a2 <close>:
.global close
close:
 li a7, SYS_close
 3a2:	48d5                	li	a7,21
 ecall
 3a4:	00000073          	ecall
 ret
 3a8:	8082                	ret

00000000000003aa <kill>:
.global kill
kill:
 li a7, SYS_kill
 3aa:	4899                	li	a7,6
 ecall
 3ac:	00000073          	ecall
 ret
 3b0:	8082                	ret

00000000000003b2 <exec>:
.global exec
exec:
 li a7, SYS_exec
 3b2:	489d                	li	a7,7
 ecall
 3b4:	00000073          	ecall
 ret
 3b8:	8082                	ret

00000000000003ba <open>:
.global open
open:
 li a7, SYS_open
 3ba:	48bd                	li	a7,15
 ecall
 3bc:	00000073          	ecall
 ret
 3c0:	8082                	ret

00000000000003c2 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 3c2:	48a1                	li	a7,8
 ecall
 3c4:	00000073          	ecall
 ret
 3c8:	8082                	ret

00000000000003ca <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 3ca:	48d1                	li	a7,20
 ecall
 3cc:	00000073          	ecall
 ret
 3d0:	8082                	ret

00000000000003d2 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 3d2:	48a5                	li	a7,9
 ecall
 3d4:	00000073          	ecall
 ret
 3d8:	8082                	ret

00000000000003da <dup>:
.global dup
dup:
 li a7, SYS_dup
 3da:	48a9                	li	a7,10
 ecall
 3dc:	00000073          	ecall
 ret
 3e0:	8082                	ret

00000000000003e2 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 3e2:	48ad                	li	a7,11
 ecall
 3e4:	00000073          	ecall
 ret
 3e8:	8082                	ret

00000000000003ea <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 3ea:	48b1                	li	a7,12
 ecall
 3ec:	00000073          	ecall
 ret
 3f0:	8082                	ret

00000000000003f2 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 3f2:	48b5                	li	a7,13
 ecall
 3f4:	00000073          	ecall
 ret
 3f8:	8082                	ret

00000000000003fa <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 3fa:	48b9                	li	a7,14
 ecall
 3fc:	00000073          	ecall
 ret
 400:	8082                	ret

0000000000000402 <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 402:	48d9                	li	a7,22
 ecall
 404:	00000073          	ecall
 ret
 408:	8082                	ret

000000000000040a <dev>:
.global dev
dev:
 li a7, SYS_dev
 40a:	48dd                	li	a7,23
 ecall
 40c:	00000073          	ecall
 ret
 410:	8082                	ret

0000000000000412 <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 412:	48e1                	li	a7,24
 ecall
 414:	00000073          	ecall
 ret
 418:	8082                	ret

000000000000041a <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 41a:	48e5                	li	a7,25
 ecall
 41c:	00000073          	ecall
 ret
 420:	8082                	ret

0000000000000422 <remove>:
.global remove
remove:
 li a7, SYS_remove
 422:	48c5                	li	a7,17
 ecall
 424:	00000073          	ecall
 ret
 428:	8082                	ret

000000000000042a <trace>:
.global trace
trace:
 li a7, SYS_trace
 42a:	48c9                	li	a7,18
 ecall
 42c:	00000073          	ecall
 ret
 430:	8082                	ret

0000000000000432 <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 432:	48cd                	li	a7,19
 ecall
 434:	00000073          	ecall
 ret
 438:	8082                	ret

000000000000043a <rename>:
.global rename
rename:
 li a7, SYS_rename
 43a:	48e9                	li	a7,26
 ecall
 43c:	00000073          	ecall
 ret
 440:	8082                	ret

0000000000000442 <poweroff>:
.global poweroff
poweroff:
 li a7, SYS_poweroff
 442:	0d200893          	li	a7,210
 ecall
 446:	00000073          	ecall
 ret
 44a:	8082                	ret

000000000000044c <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 44c:	1101                	addi	sp,sp,-32
 44e:	ec06                	sd	ra,24(sp)
 450:	e822                	sd	s0,16(sp)
 452:	1000                	addi	s0,sp,32
 454:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 458:	4605                	li	a2,1
 45a:	fef40593          	addi	a1,s0,-17
 45e:	00000097          	auipc	ra,0x0
 462:	f3c080e7          	jalr	-196(ra) # 39a <write>
}
 466:	60e2                	ld	ra,24(sp)
 468:	6442                	ld	s0,16(sp)
 46a:	6105                	addi	sp,sp,32
 46c:	8082                	ret

000000000000046e <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 46e:	7139                	addi	sp,sp,-64
 470:	fc06                	sd	ra,56(sp)
 472:	f822                	sd	s0,48(sp)
 474:	f426                	sd	s1,40(sp)
 476:	f04a                	sd	s2,32(sp)
 478:	ec4e                	sd	s3,24(sp)
 47a:	0080                	addi	s0,sp,64
 47c:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 47e:	c299                	beqz	a3,484 <printint+0x16>
 480:	0805c863          	bltz	a1,510 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 484:	2581                	sext.w	a1,a1
  neg = 0;
 486:	4881                	li	a7,0
  }

  i = 0;
 488:	fc040993          	addi	s3,s0,-64
  neg = 0;
 48c:	86ce                	mv	a3,s3
  i = 0;
 48e:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 490:	2601                	sext.w	a2,a2
 492:	00000517          	auipc	a0,0x0
 496:	4de50513          	addi	a0,a0,1246 # 970 <digits>
 49a:	883a                	mv	a6,a4
 49c:	2705                	addiw	a4,a4,1
 49e:	02c5f7bb          	remuw	a5,a1,a2
 4a2:	1782                	slli	a5,a5,0x20
 4a4:	9381                	srli	a5,a5,0x20
 4a6:	97aa                	add	a5,a5,a0
 4a8:	0007c783          	lbu	a5,0(a5)
 4ac:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 4b0:	0005879b          	sext.w	a5,a1
 4b4:	02c5d5bb          	divuw	a1,a1,a2
 4b8:	0685                	addi	a3,a3,1
 4ba:	fec7f0e3          	bgeu	a5,a2,49a <printint+0x2c>
  if(neg)
 4be:	00088c63          	beqz	a7,4d6 <printint+0x68>
    buf[i++] = '-';
 4c2:	fd070793          	addi	a5,a4,-48
 4c6:	00878733          	add	a4,a5,s0
 4ca:	02d00793          	li	a5,45
 4ce:	fef70823          	sb	a5,-16(a4)
 4d2:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 4d6:	02e05663          	blez	a4,502 <printint+0x94>
 4da:	fc040913          	addi	s2,s0,-64
 4de:	993a                	add	s2,s2,a4
 4e0:	19fd                	addi	s3,s3,-1
 4e2:	99ba                	add	s3,s3,a4
 4e4:	377d                	addiw	a4,a4,-1
 4e6:	1702                	slli	a4,a4,0x20
 4e8:	9301                	srli	a4,a4,0x20
 4ea:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 4ee:	fff94583          	lbu	a1,-1(s2)
 4f2:	8526                	mv	a0,s1
 4f4:	00000097          	auipc	ra,0x0
 4f8:	f58080e7          	jalr	-168(ra) # 44c <putc>
  while(--i >= 0)
 4fc:	197d                	addi	s2,s2,-1
 4fe:	ff3918e3          	bne	s2,s3,4ee <printint+0x80>
}
 502:	70e2                	ld	ra,56(sp)
 504:	7442                	ld	s0,48(sp)
 506:	74a2                	ld	s1,40(sp)
 508:	7902                	ld	s2,32(sp)
 50a:	69e2                	ld	s3,24(sp)
 50c:	6121                	addi	sp,sp,64
 50e:	8082                	ret
    x = -xx;
 510:	40b005bb          	negw	a1,a1
    neg = 1;
 514:	4885                	li	a7,1
    x = -xx;
 516:	bf8d                	j	488 <printint+0x1a>

0000000000000518 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 518:	7119                	addi	sp,sp,-128
 51a:	fc86                	sd	ra,120(sp)
 51c:	f8a2                	sd	s0,112(sp)
 51e:	f4a6                	sd	s1,104(sp)
 520:	f0ca                	sd	s2,96(sp)
 522:	ecce                	sd	s3,88(sp)
 524:	e8d2                	sd	s4,80(sp)
 526:	e4d6                	sd	s5,72(sp)
 528:	e0da                	sd	s6,64(sp)
 52a:	fc5e                	sd	s7,56(sp)
 52c:	f862                	sd	s8,48(sp)
 52e:	f466                	sd	s9,40(sp)
 530:	f06a                	sd	s10,32(sp)
 532:	ec6e                	sd	s11,24(sp)
 534:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 536:	0005c903          	lbu	s2,0(a1)
 53a:	18090f63          	beqz	s2,6d8 <vprintf+0x1c0>
 53e:	8aaa                	mv	s5,a0
 540:	8b32                	mv	s6,a2
 542:	00158493          	addi	s1,a1,1
  state = 0;
 546:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 548:	02500a13          	li	s4,37
 54c:	4c55                	li	s8,21
 54e:	00000c97          	auipc	s9,0x0
 552:	3cac8c93          	addi	s9,s9,970 # 918 <malloc+0x13c>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
        s = va_arg(ap, char*);
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 556:	02800d93          	li	s11,40
  putc(fd, 'x');
 55a:	4d41                	li	s10,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 55c:	00000b97          	auipc	s7,0x0
 560:	414b8b93          	addi	s7,s7,1044 # 970 <digits>
 564:	a839                	j	582 <vprintf+0x6a>
        putc(fd, c);
 566:	85ca                	mv	a1,s2
 568:	8556                	mv	a0,s5
 56a:	00000097          	auipc	ra,0x0
 56e:	ee2080e7          	jalr	-286(ra) # 44c <putc>
 572:	a019                	j	578 <vprintf+0x60>
    } else if(state == '%'){
 574:	01498d63          	beq	s3,s4,58e <vprintf+0x76>
  for(i = 0; fmt[i]; i++){
 578:	0485                	addi	s1,s1,1
 57a:	fff4c903          	lbu	s2,-1(s1)
 57e:	14090d63          	beqz	s2,6d8 <vprintf+0x1c0>
    if(state == 0){
 582:	fe0999e3          	bnez	s3,574 <vprintf+0x5c>
      if(c == '%'){
 586:	ff4910e3          	bne	s2,s4,566 <vprintf+0x4e>
        state = '%';
 58a:	89d2                	mv	s3,s4
 58c:	b7f5                	j	578 <vprintf+0x60>
      if(c == 'd'){
 58e:	11490c63          	beq	s2,s4,6a6 <vprintf+0x18e>
 592:	f9d9079b          	addiw	a5,s2,-99
 596:	0ff7f793          	zext.b	a5,a5
 59a:	10fc6e63          	bltu	s8,a5,6b6 <vprintf+0x19e>
 59e:	f9d9079b          	addiw	a5,s2,-99
 5a2:	0ff7f713          	zext.b	a4,a5
 5a6:	10ec6863          	bltu	s8,a4,6b6 <vprintf+0x19e>
 5aa:	00271793          	slli	a5,a4,0x2
 5ae:	97e6                	add	a5,a5,s9
 5b0:	439c                	lw	a5,0(a5)
 5b2:	97e6                	add	a5,a5,s9
 5b4:	8782                	jr	a5
        printint(fd, va_arg(ap, int), 10, 1);
 5b6:	008b0913          	addi	s2,s6,8
 5ba:	4685                	li	a3,1
 5bc:	4629                	li	a2,10
 5be:	000b2583          	lw	a1,0(s6)
 5c2:	8556                	mv	a0,s5
 5c4:	00000097          	auipc	ra,0x0
 5c8:	eaa080e7          	jalr	-342(ra) # 46e <printint>
 5cc:	8b4a                	mv	s6,s2
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5ce:	4981                	li	s3,0
 5d0:	b765                	j	578 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 5d2:	008b0913          	addi	s2,s6,8
 5d6:	4681                	li	a3,0
 5d8:	4629                	li	a2,10
 5da:	000b2583          	lw	a1,0(s6)
 5de:	8556                	mv	a0,s5
 5e0:	00000097          	auipc	ra,0x0
 5e4:	e8e080e7          	jalr	-370(ra) # 46e <printint>
 5e8:	8b4a                	mv	s6,s2
      state = 0;
 5ea:	4981                	li	s3,0
 5ec:	b771                	j	578 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 5ee:	008b0913          	addi	s2,s6,8
 5f2:	4681                	li	a3,0
 5f4:	866a                	mv	a2,s10
 5f6:	000b2583          	lw	a1,0(s6)
 5fa:	8556                	mv	a0,s5
 5fc:	00000097          	auipc	ra,0x0
 600:	e72080e7          	jalr	-398(ra) # 46e <printint>
 604:	8b4a                	mv	s6,s2
      state = 0;
 606:	4981                	li	s3,0
 608:	bf85                	j	578 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 60a:	008b0793          	addi	a5,s6,8
 60e:	f8f43423          	sd	a5,-120(s0)
 612:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 616:	03000593          	li	a1,48
 61a:	8556                	mv	a0,s5
 61c:	00000097          	auipc	ra,0x0
 620:	e30080e7          	jalr	-464(ra) # 44c <putc>
  putc(fd, 'x');
 624:	07800593          	li	a1,120
 628:	8556                	mv	a0,s5
 62a:	00000097          	auipc	ra,0x0
 62e:	e22080e7          	jalr	-478(ra) # 44c <putc>
 632:	896a                	mv	s2,s10
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 634:	03c9d793          	srli	a5,s3,0x3c
 638:	97de                	add	a5,a5,s7
 63a:	0007c583          	lbu	a1,0(a5)
 63e:	8556                	mv	a0,s5
 640:	00000097          	auipc	ra,0x0
 644:	e0c080e7          	jalr	-500(ra) # 44c <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 648:	0992                	slli	s3,s3,0x4
 64a:	397d                	addiw	s2,s2,-1
 64c:	fe0914e3          	bnez	s2,634 <vprintf+0x11c>
        printptr(fd, va_arg(ap, uint64));
 650:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 654:	4981                	li	s3,0
 656:	b70d                	j	578 <vprintf+0x60>
        s = va_arg(ap, char*);
 658:	008b0913          	addi	s2,s6,8
 65c:	000b3983          	ld	s3,0(s6)
        if(s == 0)
 660:	02098163          	beqz	s3,682 <vprintf+0x16a>
        while(*s != 0){
 664:	0009c583          	lbu	a1,0(s3)
 668:	c5ad                	beqz	a1,6d2 <vprintf+0x1ba>
          putc(fd, *s);
 66a:	8556                	mv	a0,s5
 66c:	00000097          	auipc	ra,0x0
 670:	de0080e7          	jalr	-544(ra) # 44c <putc>
          s++;
 674:	0985                	addi	s3,s3,1
        while(*s != 0){
 676:	0009c583          	lbu	a1,0(s3)
 67a:	f9e5                	bnez	a1,66a <vprintf+0x152>
        s = va_arg(ap, char*);
 67c:	8b4a                	mv	s6,s2
      state = 0;
 67e:	4981                	li	s3,0
 680:	bde5                	j	578 <vprintf+0x60>
          s = "(null)";
 682:	00000997          	auipc	s3,0x0
 686:	28e98993          	addi	s3,s3,654 # 910 <malloc+0x134>
        while(*s != 0){
 68a:	85ee                	mv	a1,s11
 68c:	bff9                	j	66a <vprintf+0x152>
        putc(fd, va_arg(ap, uint));
 68e:	008b0913          	addi	s2,s6,8
 692:	000b4583          	lbu	a1,0(s6)
 696:	8556                	mv	a0,s5
 698:	00000097          	auipc	ra,0x0
 69c:	db4080e7          	jalr	-588(ra) # 44c <putc>
 6a0:	8b4a                	mv	s6,s2
      state = 0;
 6a2:	4981                	li	s3,0
 6a4:	bdd1                	j	578 <vprintf+0x60>
        putc(fd, c);
 6a6:	85d2                	mv	a1,s4
 6a8:	8556                	mv	a0,s5
 6aa:	00000097          	auipc	ra,0x0
 6ae:	da2080e7          	jalr	-606(ra) # 44c <putc>
      state = 0;
 6b2:	4981                	li	s3,0
 6b4:	b5d1                	j	578 <vprintf+0x60>
        putc(fd, '%');
 6b6:	85d2                	mv	a1,s4
 6b8:	8556                	mv	a0,s5
 6ba:	00000097          	auipc	ra,0x0
 6be:	d92080e7          	jalr	-622(ra) # 44c <putc>
        putc(fd, c);
 6c2:	85ca                	mv	a1,s2
 6c4:	8556                	mv	a0,s5
 6c6:	00000097          	auipc	ra,0x0
 6ca:	d86080e7          	jalr	-634(ra) # 44c <putc>
      state = 0;
 6ce:	4981                	li	s3,0
 6d0:	b565                	j	578 <vprintf+0x60>
        s = va_arg(ap, char*);
 6d2:	8b4a                	mv	s6,s2
      state = 0;
 6d4:	4981                	li	s3,0
 6d6:	b54d                	j	578 <vprintf+0x60>
    }
  }
}
 6d8:	70e6                	ld	ra,120(sp)
 6da:	7446                	ld	s0,112(sp)
 6dc:	74a6                	ld	s1,104(sp)
 6de:	7906                	ld	s2,96(sp)
 6e0:	69e6                	ld	s3,88(sp)
 6e2:	6a46                	ld	s4,80(sp)
 6e4:	6aa6                	ld	s5,72(sp)
 6e6:	6b06                	ld	s6,64(sp)
 6e8:	7be2                	ld	s7,56(sp)
 6ea:	7c42                	ld	s8,48(sp)
 6ec:	7ca2                	ld	s9,40(sp)
 6ee:	7d02                	ld	s10,32(sp)
 6f0:	6de2                	ld	s11,24(sp)
 6f2:	6109                	addi	sp,sp,128
 6f4:	8082                	ret

00000000000006f6 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 6f6:	715d                	addi	sp,sp,-80
 6f8:	ec06                	sd	ra,24(sp)
 6fa:	e822                	sd	s0,16(sp)
 6fc:	1000                	addi	s0,sp,32
 6fe:	e010                	sd	a2,0(s0)
 700:	e414                	sd	a3,8(s0)
 702:	e818                	sd	a4,16(s0)
 704:	ec1c                	sd	a5,24(s0)
 706:	03043023          	sd	a6,32(s0)
 70a:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 70e:	8622                	mv	a2,s0
 710:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 714:	00000097          	auipc	ra,0x0
 718:	e04080e7          	jalr	-508(ra) # 518 <vprintf>
}
 71c:	60e2                	ld	ra,24(sp)
 71e:	6442                	ld	s0,16(sp)
 720:	6161                	addi	sp,sp,80
 722:	8082                	ret

0000000000000724 <printf>:

void
printf(const char *fmt, ...)
{
 724:	711d                	addi	sp,sp,-96
 726:	ec06                	sd	ra,24(sp)
 728:	e822                	sd	s0,16(sp)
 72a:	1000                	addi	s0,sp,32
 72c:	e40c                	sd	a1,8(s0)
 72e:	e810                	sd	a2,16(s0)
 730:	ec14                	sd	a3,24(s0)
 732:	f018                	sd	a4,32(s0)
 734:	f41c                	sd	a5,40(s0)
 736:	03043823          	sd	a6,48(s0)
 73a:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 73e:	00840613          	addi	a2,s0,8
 742:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 746:	85aa                	mv	a1,a0
 748:	4505                	li	a0,1
 74a:	00000097          	auipc	ra,0x0
 74e:	dce080e7          	jalr	-562(ra) # 518 <vprintf>
}
 752:	60e2                	ld	ra,24(sp)
 754:	6442                	ld	s0,16(sp)
 756:	6125                	addi	sp,sp,96
 758:	8082                	ret

000000000000075a <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 75a:	1141                	addi	sp,sp,-16
 75c:	e422                	sd	s0,8(sp)
 75e:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 760:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 764:	00000797          	auipc	a5,0x0
 768:	2247b783          	ld	a5,548(a5) # 988 <freep>
 76c:	a02d                	j	796 <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 76e:	4618                	lw	a4,8(a2)
 770:	9f2d                	addw	a4,a4,a1
 772:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 776:	6398                	ld	a4,0(a5)
 778:	6310                	ld	a2,0(a4)
 77a:	a83d                	j	7b8 <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 77c:	ff852703          	lw	a4,-8(a0)
 780:	9f31                	addw	a4,a4,a2
 782:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 784:	ff053683          	ld	a3,-16(a0)
 788:	a091                	j	7cc <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 78a:	6398                	ld	a4,0(a5)
 78c:	00e7e463          	bltu	a5,a4,794 <free+0x3a>
 790:	00e6ea63          	bltu	a3,a4,7a4 <free+0x4a>
{
 794:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 796:	fed7fae3          	bgeu	a5,a3,78a <free+0x30>
 79a:	6398                	ld	a4,0(a5)
 79c:	00e6e463          	bltu	a3,a4,7a4 <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7a0:	fee7eae3          	bltu	a5,a4,794 <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
 7a4:	ff852583          	lw	a1,-8(a0)
 7a8:	6390                	ld	a2,0(a5)
 7aa:	02059813          	slli	a6,a1,0x20
 7ae:	01c85713          	srli	a4,a6,0x1c
 7b2:	9736                	add	a4,a4,a3
 7b4:	fae60de3          	beq	a2,a4,76e <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
 7b8:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 7bc:	4790                	lw	a2,8(a5)
 7be:	02061593          	slli	a1,a2,0x20
 7c2:	01c5d713          	srli	a4,a1,0x1c
 7c6:	973e                	add	a4,a4,a5
 7c8:	fae68ae3          	beq	a3,a4,77c <free+0x22>
    p->s.ptr = bp->s.ptr;
 7cc:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 7ce:	00000717          	auipc	a4,0x0
 7d2:	1af73d23          	sd	a5,442(a4) # 988 <freep>
}
 7d6:	6422                	ld	s0,8(sp)
 7d8:	0141                	addi	sp,sp,16
 7da:	8082                	ret

00000000000007dc <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7dc:	7139                	addi	sp,sp,-64
 7de:	fc06                	sd	ra,56(sp)
 7e0:	f822                	sd	s0,48(sp)
 7e2:	f426                	sd	s1,40(sp)
 7e4:	f04a                	sd	s2,32(sp)
 7e6:	ec4e                	sd	s3,24(sp)
 7e8:	e852                	sd	s4,16(sp)
 7ea:	e456                	sd	s5,8(sp)
 7ec:	e05a                	sd	s6,0(sp)
 7ee:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7f0:	02051493          	slli	s1,a0,0x20
 7f4:	9081                	srli	s1,s1,0x20
 7f6:	04bd                	addi	s1,s1,15
 7f8:	8091                	srli	s1,s1,0x4
 7fa:	00148a1b          	addiw	s4,s1,1
 7fe:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 800:	00000517          	auipc	a0,0x0
 804:	18853503          	ld	a0,392(a0) # 988 <freep>
 808:	c515                	beqz	a0,834 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 80a:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 80c:	4798                	lw	a4,8(a5)
 80e:	04977163          	bgeu	a4,s1,850 <malloc+0x74>
 812:	89d2                	mv	s3,s4
 814:	000a071b          	sext.w	a4,s4
 818:	6685                	lui	a3,0x1
 81a:	00d77363          	bgeu	a4,a3,820 <malloc+0x44>
 81e:	6985                	lui	s3,0x1
 820:	00098b1b          	sext.w	s6,s3
  p = sbrk(nu * sizeof(Header));
 824:	0049999b          	slliw	s3,s3,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 828:	00000917          	auipc	s2,0x0
 82c:	16090913          	addi	s2,s2,352 # 988 <freep>
  if(p == (char*)-1)
 830:	5afd                	li	s5,-1
 832:	a8a5                	j	8aa <malloc+0xce>
    base.s.ptr = freep = prevp = &base;
 834:	00000797          	auipc	a5,0x0
 838:	15478793          	addi	a5,a5,340 # 988 <freep>
 83c:	00000717          	auipc	a4,0x0
 840:	15470713          	addi	a4,a4,340 # 990 <base>
 844:	e398                	sd	a4,0(a5)
 846:	e798                	sd	a4,8(a5)
    base.s.size = 0;
 848:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 84c:	87ba                	mv	a5,a4
 84e:	b7d1                	j	812 <malloc+0x36>
      if(p->s.size == nunits)
 850:	02e48c63          	beq	s1,a4,888 <malloc+0xac>
        p->s.size -= nunits;
 854:	4147073b          	subw	a4,a4,s4
 858:	c798                	sw	a4,8(a5)
        p += p->s.size;
 85a:	02071693          	slli	a3,a4,0x20
 85e:	01c6d713          	srli	a4,a3,0x1c
 862:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 864:	0147a423          	sw	s4,8(a5)
      freep = prevp;
 868:	00000717          	auipc	a4,0x0
 86c:	12a73023          	sd	a0,288(a4) # 988 <freep>
      return (void*)(p + 1);
 870:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 874:	70e2                	ld	ra,56(sp)
 876:	7442                	ld	s0,48(sp)
 878:	74a2                	ld	s1,40(sp)
 87a:	7902                	ld	s2,32(sp)
 87c:	69e2                	ld	s3,24(sp)
 87e:	6a42                	ld	s4,16(sp)
 880:	6aa2                	ld	s5,8(sp)
 882:	6b02                	ld	s6,0(sp)
 884:	6121                	addi	sp,sp,64
 886:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 888:	6398                	ld	a4,0(a5)
 88a:	e118                	sd	a4,0(a0)
 88c:	bff1                	j	868 <malloc+0x8c>
  hp->s.size = nu;
 88e:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 892:	0541                	addi	a0,a0,16
 894:	00000097          	auipc	ra,0x0
 898:	ec6080e7          	jalr	-314(ra) # 75a <free>
  return freep;
 89c:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 8a0:	d971                	beqz	a0,874 <malloc+0x98>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a2:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 8a4:	4798                	lw	a4,8(a5)
 8a6:	fa9775e3          	bgeu	a4,s1,850 <malloc+0x74>
    if(p == freep)
 8aa:	00093703          	ld	a4,0(s2)
 8ae:	853e                	mv	a0,a5
 8b0:	fef719e3          	bne	a4,a5,8a2 <malloc+0xc6>
  p = sbrk(nu * sizeof(Header));
 8b4:	854e                	mv	a0,s3
 8b6:	00000097          	auipc	ra,0x0
 8ba:	b34080e7          	jalr	-1228(ra) # 3ea <sbrk>
  if(p == (char*)-1)
 8be:	fd5518e3          	bne	a0,s5,88e <malloc+0xb2>
        return 0;
 8c2:	4501                	li	a0,0
 8c4:	bf45                	j	874 <malloc+0x98>
