
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
  2c:	89098993          	addi	s3,s3,-1904 # 8b8 <malloc+0x104>
  30:	a015                	j	54 <main+0x54>
    fprintf(2, "Usage: rm files...\n");
  32:	00001597          	auipc	a1,0x1
  36:	86e58593          	addi	a1,a1,-1938 # 8a0 <malloc+0xec>
  3a:	4509                	li	a0,2
  3c:	00000097          	auipc	ra,0x0
  40:	692080e7          	jalr	1682(ra) # 6ce <fprintf>
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
  6c:	666080e7          	jalr	1638(ra) # 6ce <fprintf>
  70:	bff9                	j	4e <main+0x4e>
    }
  }

  exit(0);
  72:	4501                	li	a0,0
  74:	00000097          	auipc	ra,0x0
  78:	2c0080e7          	jalr	704(ra) # 334 <exit>

000000000000007c <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
  7c:	1141                	addi	sp,sp,-16
  7e:	e422                	sd	s0,8(sp)
  80:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  82:	87aa                	mv	a5,a0
  84:	0585                	addi	a1,a1,1
  86:	0785                	addi	a5,a5,1
  88:	fff5c703          	lbu	a4,-1(a1)
  8c:	fee78fa3          	sb	a4,-1(a5)
  90:	fb75                	bnez	a4,84 <strcpy+0x8>
    ;
  return os;
}
  92:	6422                	ld	s0,8(sp)
  94:	0141                	addi	sp,sp,16
  96:	8082                	ret

0000000000000098 <strcat>:

char*
strcat(char *s, const char *t)
{
  98:	1141                	addi	sp,sp,-16
  9a:	e422                	sd	s0,8(sp)
  9c:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
  9e:	00054783          	lbu	a5,0(a0)
  a2:	c385                	beqz	a5,c2 <strcat+0x2a>
  a4:	87aa                	mv	a5,a0
    s++;
  a6:	0785                	addi	a5,a5,1
  while(*s)
  a8:	0007c703          	lbu	a4,0(a5)
  ac:	ff6d                	bnez	a4,a6 <strcat+0xe>
  while((*s++ = *t++))
  ae:	0585                	addi	a1,a1,1
  b0:	0785                	addi	a5,a5,1
  b2:	fff5c703          	lbu	a4,-1(a1)
  b6:	fee78fa3          	sb	a4,-1(a5)
  ba:	fb75                	bnez	a4,ae <strcat+0x16>
    ;
  return os;
}
  bc:	6422                	ld	s0,8(sp)
  be:	0141                	addi	sp,sp,16
  c0:	8082                	ret
  while(*s)
  c2:	87aa                	mv	a5,a0
  c4:	b7ed                	j	ae <strcat+0x16>

00000000000000c6 <strcmp>:


int
strcmp(const char *p, const char *q)
{
  c6:	1141                	addi	sp,sp,-16
  c8:	e422                	sd	s0,8(sp)
  ca:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
  cc:	00054783          	lbu	a5,0(a0)
  d0:	cb91                	beqz	a5,e4 <strcmp+0x1e>
  d2:	0005c703          	lbu	a4,0(a1)
  d6:	00f71763          	bne	a4,a5,e4 <strcmp+0x1e>
    p++, q++;
  da:	0505                	addi	a0,a0,1
  dc:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
  de:	00054783          	lbu	a5,0(a0)
  e2:	fbe5                	bnez	a5,d2 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
  e4:	0005c503          	lbu	a0,0(a1)
}
  e8:	40a7853b          	subw	a0,a5,a0
  ec:	6422                	ld	s0,8(sp)
  ee:	0141                	addi	sp,sp,16
  f0:	8082                	ret

00000000000000f2 <strlen>:

uint
strlen(const char *s)
{
  f2:	1141                	addi	sp,sp,-16
  f4:	e422                	sd	s0,8(sp)
  f6:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
  f8:	00054783          	lbu	a5,0(a0)
  fc:	cf91                	beqz	a5,118 <strlen+0x26>
  fe:	0505                	addi	a0,a0,1
 100:	87aa                	mv	a5,a0
 102:	4685                	li	a3,1
 104:	9e89                	subw	a3,a3,a0
 106:	00f6853b          	addw	a0,a3,a5
 10a:	0785                	addi	a5,a5,1
 10c:	fff7c703          	lbu	a4,-1(a5)
 110:	fb7d                	bnez	a4,106 <strlen+0x14>
    ;
  return n;
}
 112:	6422                	ld	s0,8(sp)
 114:	0141                	addi	sp,sp,16
 116:	8082                	ret
  for(n = 0; s[n]; n++)
 118:	4501                	li	a0,0
 11a:	bfe5                	j	112 <strlen+0x20>

000000000000011c <memset>:

void*
memset(void *dst, int c, uint n)
{
 11c:	1141                	addi	sp,sp,-16
 11e:	e422                	sd	s0,8(sp)
 120:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 122:	ca19                	beqz	a2,138 <memset+0x1c>
 124:	87aa                	mv	a5,a0
 126:	1602                	slli	a2,a2,0x20
 128:	9201                	srli	a2,a2,0x20
 12a:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 12e:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 132:	0785                	addi	a5,a5,1
 134:	fee79de3          	bne	a5,a4,12e <memset+0x12>
  }
  return dst;
}
 138:	6422                	ld	s0,8(sp)
 13a:	0141                	addi	sp,sp,16
 13c:	8082                	ret

000000000000013e <strchr>:

char*
strchr(const char *s, char c)
{
 13e:	1141                	addi	sp,sp,-16
 140:	e422                	sd	s0,8(sp)
 142:	0800                	addi	s0,sp,16
  for(; *s; s++)
 144:	00054783          	lbu	a5,0(a0)
 148:	cb99                	beqz	a5,15e <strchr+0x20>
    if(*s == c)
 14a:	00f58763          	beq	a1,a5,158 <strchr+0x1a>
  for(; *s; s++)
 14e:	0505                	addi	a0,a0,1
 150:	00054783          	lbu	a5,0(a0)
 154:	fbfd                	bnez	a5,14a <strchr+0xc>
      return (char*)s;
  return 0;
 156:	4501                	li	a0,0
}
 158:	6422                	ld	s0,8(sp)
 15a:	0141                	addi	sp,sp,16
 15c:	8082                	ret
  return 0;
 15e:	4501                	li	a0,0
 160:	bfe5                	j	158 <strchr+0x1a>

0000000000000162 <gets>:

char*
gets(char *buf, int max)
{
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
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 17e:	892a                	mv	s2,a0
 180:	4481                	li	s1,0
    cc = read(0, &c, 1);
 182:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 186:	4b29                	li	s6,10
 188:	4c35                	li	s8,13
  for(i=0; i+1 < max; ){
 18a:	89a6                	mv	s3,s1
 18c:	2485                	addiw	s1,s1,1
 18e:	0344d763          	bge	s1,s4,1bc <gets+0x5a>
    cc = read(0, &c, 1);
 192:	4605                	li	a2,1
 194:	85d6                	mv	a1,s5
 196:	4501                	li	a0,0
 198:	00000097          	auipc	ra,0x0
 19c:	1b4080e7          	jalr	436(ra) # 34c <read>
    if(cc < 1)
 1a0:	00a05e63          	blez	a0,1bc <gets+0x5a>
    buf[i++] = c;
 1a4:	faf44783          	lbu	a5,-81(s0)
 1a8:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 1ac:	01678763          	beq	a5,s6,1ba <gets+0x58>
 1b0:	0905                	addi	s2,s2,1
 1b2:	fd879ce3          	bne	a5,s8,18a <gets+0x28>
  for(i=0; i+1 < max; ){
 1b6:	89a6                	mv	s3,s1
 1b8:	a011                	j	1bc <gets+0x5a>
 1ba:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 1bc:	99de                	add	s3,s3,s7
 1be:	00098023          	sb	zero,0(s3)
  return buf;
}
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

int
stat(const char *n, struct stat *st)
{
 1dc:	1101                	addi	sp,sp,-32
 1de:	ec06                	sd	ra,24(sp)
 1e0:	e822                	sd	s0,16(sp)
 1e2:	e426                	sd	s1,8(sp)
 1e4:	e04a                	sd	s2,0(sp)
 1e6:	1000                	addi	s0,sp,32
 1e8:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1ea:	4581                	li	a1,0
 1ec:	00000097          	auipc	ra,0x0
 1f0:	188080e7          	jalr	392(ra) # 374 <open>
  if(fd < 0)
 1f4:	02054563          	bltz	a0,21e <stat+0x42>
 1f8:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 1fa:	85ca                	mv	a1,s2
 1fc:	00000097          	auipc	ra,0x0
 200:	180080e7          	jalr	384(ra) # 37c <fstat>
 204:	892a                	mv	s2,a0
  close(fd);
 206:	8526                	mv	a0,s1
 208:	00000097          	auipc	ra,0x0
 20c:	154080e7          	jalr	340(ra) # 35c <close>
  return r;
}
 210:	854a                	mv	a0,s2
 212:	60e2                	ld	ra,24(sp)
 214:	6442                	ld	s0,16(sp)
 216:	64a2                	ld	s1,8(sp)
 218:	6902                	ld	s2,0(sp)
 21a:	6105                	addi	sp,sp,32
 21c:	8082                	ret
    return -1;
 21e:	597d                	li	s2,-1
 220:	bfc5                	j	210 <stat+0x34>

0000000000000222 <atoi>:

int
atoi(const char *s)
{
 222:	1141                	addi	sp,sp,-16
 224:	e422                	sd	s0,8(sp)
 226:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 228:	00054703          	lbu	a4,0(a0)
 22c:	02d00793          	li	a5,45
  int neg = 1;
 230:	4585                	li	a1,1
  if (*s == '-') {
 232:	04f70363          	beq	a4,a5,278 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 236:	00054703          	lbu	a4,0(a0)
 23a:	fd07079b          	addiw	a5,a4,-48
 23e:	0ff7f793          	zext.b	a5,a5
 242:	46a5                	li	a3,9
 244:	02f6ed63          	bltu	a3,a5,27e <atoi+0x5c>
  n = 0;
 248:	4681                	li	a3,0
  while('0' <= *s && *s <= '9')
 24a:	4625                	li	a2,9
    n = n*10 + *s++ - '0';
 24c:	0505                	addi	a0,a0,1
 24e:	0026979b          	slliw	a5,a3,0x2
 252:	9fb5                	addw	a5,a5,a3
 254:	0017979b          	slliw	a5,a5,0x1
 258:	9fb9                	addw	a5,a5,a4
 25a:	fd07869b          	addiw	a3,a5,-48
  while('0' <= *s && *s <= '9')
 25e:	00054703          	lbu	a4,0(a0)
 262:	fd07079b          	addiw	a5,a4,-48
 266:	0ff7f793          	zext.b	a5,a5
 26a:	fef671e3          	bgeu	a2,a5,24c <atoi+0x2a>
  return n * neg;
}
 26e:	02d5853b          	mulw	a0,a1,a3
 272:	6422                	ld	s0,8(sp)
 274:	0141                	addi	sp,sp,16
 276:	8082                	ret
    s++;
 278:	0505                	addi	a0,a0,1
    neg = -1;
 27a:	55fd                	li	a1,-1
 27c:	bf6d                	j	236 <atoi+0x14>
  n = 0;
 27e:	4681                	li	a3,0
 280:	b7fd                	j	26e <atoi+0x4c>

0000000000000282 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 282:	1141                	addi	sp,sp,-16
 284:	e422                	sd	s0,8(sp)
 286:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 288:	02b57463          	bgeu	a0,a1,2b0 <memmove+0x2e>
    while(n-- > 0)
 28c:	00c05f63          	blez	a2,2aa <memmove+0x28>
 290:	1602                	slli	a2,a2,0x20
 292:	9201                	srli	a2,a2,0x20
 294:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 298:	872a                	mv	a4,a0
      *dst++ = *src++;
 29a:	0585                	addi	a1,a1,1
 29c:	0705                	addi	a4,a4,1
 29e:	fff5c683          	lbu	a3,-1(a1)
 2a2:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 2a6:	fee79ae3          	bne	a5,a4,29a <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 2aa:	6422                	ld	s0,8(sp)
 2ac:	0141                	addi	sp,sp,16
 2ae:	8082                	ret
    dst += n;
 2b0:	00c50733          	add	a4,a0,a2
    src += n;
 2b4:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 2b6:	fec05ae3          	blez	a2,2aa <memmove+0x28>
 2ba:	fff6079b          	addiw	a5,a2,-1
 2be:	1782                	slli	a5,a5,0x20
 2c0:	9381                	srli	a5,a5,0x20
 2c2:	fff7c793          	not	a5,a5
 2c6:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 2c8:	15fd                	addi	a1,a1,-1
 2ca:	177d                	addi	a4,a4,-1
 2cc:	0005c683          	lbu	a3,0(a1)
 2d0:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 2d4:	fee79ae3          	bne	a5,a4,2c8 <memmove+0x46>
 2d8:	bfc9                	j	2aa <memmove+0x28>

00000000000002da <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 2da:	1141                	addi	sp,sp,-16
 2dc:	e422                	sd	s0,8(sp)
 2de:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 2e0:	ca05                	beqz	a2,310 <memcmp+0x36>
 2e2:	fff6069b          	addiw	a3,a2,-1
 2e6:	1682                	slli	a3,a3,0x20
 2e8:	9281                	srli	a3,a3,0x20
 2ea:	0685                	addi	a3,a3,1
 2ec:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 2ee:	00054783          	lbu	a5,0(a0)
 2f2:	0005c703          	lbu	a4,0(a1)
 2f6:	00e79863          	bne	a5,a4,306 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 2fa:	0505                	addi	a0,a0,1
    p2++;
 2fc:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 2fe:	fed518e3          	bne	a0,a3,2ee <memcmp+0x14>
  }
  return 0;
 302:	4501                	li	a0,0
 304:	a019                	j	30a <memcmp+0x30>
      return *p1 - *p2;
 306:	40e7853b          	subw	a0,a5,a4
}
 30a:	6422                	ld	s0,8(sp)
 30c:	0141                	addi	sp,sp,16
 30e:	8082                	ret
  return 0;
 310:	4501                	li	a0,0
 312:	bfe5                	j	30a <memcmp+0x30>

0000000000000314 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 314:	1141                	addi	sp,sp,-16
 316:	e406                	sd	ra,8(sp)
 318:	e022                	sd	s0,0(sp)
 31a:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 31c:	00000097          	auipc	ra,0x0
 320:	f66080e7          	jalr	-154(ra) # 282 <memmove>
}
 324:	60a2                	ld	ra,8(sp)
 326:	6402                	ld	s0,0(sp)
 328:	0141                	addi	sp,sp,16
 32a:	8082                	ret

000000000000032c <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 32c:	4885                	li	a7,1
 ecall
 32e:	00000073          	ecall
 ret
 332:	8082                	ret

0000000000000334 <exit>:
.global exit
exit:
 li a7, SYS_exit
 334:	4889                	li	a7,2
 ecall
 336:	00000073          	ecall
 ret
 33a:	8082                	ret

000000000000033c <wait>:
.global wait
wait:
 li a7, SYS_wait
 33c:	488d                	li	a7,3
 ecall
 33e:	00000073          	ecall
 ret
 342:	8082                	ret

0000000000000344 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 344:	4891                	li	a7,4
 ecall
 346:	00000073          	ecall
 ret
 34a:	8082                	ret

000000000000034c <read>:
.global read
read:
 li a7, SYS_read
 34c:	4895                	li	a7,5
 ecall
 34e:	00000073          	ecall
 ret
 352:	8082                	ret

0000000000000354 <write>:
.global write
write:
 li a7, SYS_write
 354:	48c1                	li	a7,16
 ecall
 356:	00000073          	ecall
 ret
 35a:	8082                	ret

000000000000035c <close>:
.global close
close:
 li a7, SYS_close
 35c:	48d5                	li	a7,21
 ecall
 35e:	00000073          	ecall
 ret
 362:	8082                	ret

0000000000000364 <kill>:
.global kill
kill:
 li a7, SYS_kill
 364:	4899                	li	a7,6
 ecall
 366:	00000073          	ecall
 ret
 36a:	8082                	ret

000000000000036c <exec>:
.global exec
exec:
 li a7, SYS_exec
 36c:	489d                	li	a7,7
 ecall
 36e:	00000073          	ecall
 ret
 372:	8082                	ret

0000000000000374 <open>:
.global open
open:
 li a7, SYS_open
 374:	48bd                	li	a7,15
 ecall
 376:	00000073          	ecall
 ret
 37a:	8082                	ret

000000000000037c <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 37c:	48a1                	li	a7,8
 ecall
 37e:	00000073          	ecall
 ret
 382:	8082                	ret

0000000000000384 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 384:	48d1                	li	a7,20
 ecall
 386:	00000073          	ecall
 ret
 38a:	8082                	ret

000000000000038c <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 38c:	48a5                	li	a7,9
 ecall
 38e:	00000073          	ecall
 ret
 392:	8082                	ret

0000000000000394 <dup>:
.global dup
dup:
 li a7, SYS_dup
 394:	48a9                	li	a7,10
 ecall
 396:	00000073          	ecall
 ret
 39a:	8082                	ret

000000000000039c <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 39c:	48ad                	li	a7,11
 ecall
 39e:	00000073          	ecall
 ret
 3a2:	8082                	ret

00000000000003a4 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 3a4:	48b1                	li	a7,12
 ecall
 3a6:	00000073          	ecall
 ret
 3aa:	8082                	ret

00000000000003ac <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 3ac:	48b5                	li	a7,13
 ecall
 3ae:	00000073          	ecall
 ret
 3b2:	8082                	ret

00000000000003b4 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 3b4:	48b9                	li	a7,14
 ecall
 3b6:	00000073          	ecall
 ret
 3ba:	8082                	ret

00000000000003bc <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 3bc:	48d9                	li	a7,22
 ecall
 3be:	00000073          	ecall
 ret
 3c2:	8082                	ret

00000000000003c4 <dev>:
.global dev
dev:
 li a7, SYS_dev
 3c4:	48dd                	li	a7,23
 ecall
 3c6:	00000073          	ecall
 ret
 3ca:	8082                	ret

00000000000003cc <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 3cc:	48e1                	li	a7,24
 ecall
 3ce:	00000073          	ecall
 ret
 3d2:	8082                	ret

00000000000003d4 <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 3d4:	48e5                	li	a7,25
 ecall
 3d6:	00000073          	ecall
 ret
 3da:	8082                	ret

00000000000003dc <remove>:
.global remove
remove:
 li a7, SYS_remove
 3dc:	48c5                	li	a7,17
 ecall
 3de:	00000073          	ecall
 ret
 3e2:	8082                	ret

00000000000003e4 <trace>:
.global trace
trace:
 li a7, SYS_trace
 3e4:	48c9                	li	a7,18
 ecall
 3e6:	00000073          	ecall
 ret
 3ea:	8082                	ret

00000000000003ec <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 3ec:	48cd                	li	a7,19
 ecall
 3ee:	00000073          	ecall
 ret
 3f2:	8082                	ret

00000000000003f4 <rename>:
.global rename
rename:
 li a7, SYS_rename
 3f4:	48e9                	li	a7,26
 ecall
 3f6:	00000073          	ecall
 ret
 3fa:	8082                	ret

00000000000003fc <poweroff>:
.global poweroff
poweroff:
 li a7, SYS_poweroff
 3fc:	0d200893          	li	a7,210
 ecall
 400:	00000073          	ecall
 ret
 404:	8082                	ret

0000000000000406 <mkdirat>:
.global mkdirat
mkdirat:
 li a7, SYS_mkdirat
 406:	02200893          	li	a7,34
 ecall
 40a:	00000073          	ecall
 ret
 40e:	8082                	ret

0000000000000410 <clone>:
.global clone
clone:
 li a7, SYS_clone
 410:	0dc00893          	li	a7,220
 ecall
 414:	00000073          	ecall
 ret
 418:	8082                	ret

000000000000041a <wait4>:
.global wait4
wait4:
 li a7, SYS_wait4
 41a:	10400893          	li	a7,260
 ecall
 41e:	00000073          	ecall
 ret
 422:	8082                	ret

0000000000000424 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 424:	1101                	addi	sp,sp,-32
 426:	ec06                	sd	ra,24(sp)
 428:	e822                	sd	s0,16(sp)
 42a:	1000                	addi	s0,sp,32
 42c:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 430:	4605                	li	a2,1
 432:	fef40593          	addi	a1,s0,-17
 436:	00000097          	auipc	ra,0x0
 43a:	f1e080e7          	jalr	-226(ra) # 354 <write>
}
 43e:	60e2                	ld	ra,24(sp)
 440:	6442                	ld	s0,16(sp)
 442:	6105                	addi	sp,sp,32
 444:	8082                	ret

0000000000000446 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 446:	7139                	addi	sp,sp,-64
 448:	fc06                	sd	ra,56(sp)
 44a:	f822                	sd	s0,48(sp)
 44c:	f426                	sd	s1,40(sp)
 44e:	f04a                	sd	s2,32(sp)
 450:	ec4e                	sd	s3,24(sp)
 452:	0080                	addi	s0,sp,64
 454:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 456:	c299                	beqz	a3,45c <printint+0x16>
 458:	0805c863          	bltz	a1,4e8 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 45c:	2581                	sext.w	a1,a1
  neg = 0;
 45e:	4881                	li	a7,0
  }

  i = 0;
 460:	fc040993          	addi	s3,s0,-64
  neg = 0;
 464:	86ce                	mv	a3,s3
  i = 0;
 466:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 468:	2601                	sext.w	a2,a2
 46a:	00000517          	auipc	a0,0x0
 46e:	4ce50513          	addi	a0,a0,1230 # 938 <digits>
 472:	883a                	mv	a6,a4
 474:	2705                	addiw	a4,a4,1
 476:	02c5f7bb          	remuw	a5,a1,a2
 47a:	1782                	slli	a5,a5,0x20
 47c:	9381                	srli	a5,a5,0x20
 47e:	97aa                	add	a5,a5,a0
 480:	0007c783          	lbu	a5,0(a5)
 484:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 488:	0005879b          	sext.w	a5,a1
 48c:	02c5d5bb          	divuw	a1,a1,a2
 490:	0685                	addi	a3,a3,1
 492:	fec7f0e3          	bgeu	a5,a2,472 <printint+0x2c>
  if(neg)
 496:	00088c63          	beqz	a7,4ae <printint+0x68>
    buf[i++] = '-';
 49a:	fd070793          	addi	a5,a4,-48
 49e:	00878733          	add	a4,a5,s0
 4a2:	02d00793          	li	a5,45
 4a6:	fef70823          	sb	a5,-16(a4)
 4aa:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 4ae:	02e05663          	blez	a4,4da <printint+0x94>
 4b2:	fc040913          	addi	s2,s0,-64
 4b6:	993a                	add	s2,s2,a4
 4b8:	19fd                	addi	s3,s3,-1
 4ba:	99ba                	add	s3,s3,a4
 4bc:	377d                	addiw	a4,a4,-1
 4be:	1702                	slli	a4,a4,0x20
 4c0:	9301                	srli	a4,a4,0x20
 4c2:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 4c6:	fff94583          	lbu	a1,-1(s2)
 4ca:	8526                	mv	a0,s1
 4cc:	00000097          	auipc	ra,0x0
 4d0:	f58080e7          	jalr	-168(ra) # 424 <putc>
  while(--i >= 0)
 4d4:	197d                	addi	s2,s2,-1
 4d6:	ff3918e3          	bne	s2,s3,4c6 <printint+0x80>
}
 4da:	70e2                	ld	ra,56(sp)
 4dc:	7442                	ld	s0,48(sp)
 4de:	74a2                	ld	s1,40(sp)
 4e0:	7902                	ld	s2,32(sp)
 4e2:	69e2                	ld	s3,24(sp)
 4e4:	6121                	addi	sp,sp,64
 4e6:	8082                	ret
    x = -xx;
 4e8:	40b005bb          	negw	a1,a1
    neg = 1;
 4ec:	4885                	li	a7,1
    x = -xx;
 4ee:	bf8d                	j	460 <printint+0x1a>

00000000000004f0 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 4f0:	7119                	addi	sp,sp,-128
 4f2:	fc86                	sd	ra,120(sp)
 4f4:	f8a2                	sd	s0,112(sp)
 4f6:	f4a6                	sd	s1,104(sp)
 4f8:	f0ca                	sd	s2,96(sp)
 4fa:	ecce                	sd	s3,88(sp)
 4fc:	e8d2                	sd	s4,80(sp)
 4fe:	e4d6                	sd	s5,72(sp)
 500:	e0da                	sd	s6,64(sp)
 502:	fc5e                	sd	s7,56(sp)
 504:	f862                	sd	s8,48(sp)
 506:	f466                	sd	s9,40(sp)
 508:	f06a                	sd	s10,32(sp)
 50a:	ec6e                	sd	s11,24(sp)
 50c:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 50e:	0005c903          	lbu	s2,0(a1)
 512:	18090f63          	beqz	s2,6b0 <vprintf+0x1c0>
 516:	8aaa                	mv	s5,a0
 518:	8b32                	mv	s6,a2
 51a:	00158493          	addi	s1,a1,1
  state = 0;
 51e:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 520:	02500a13          	li	s4,37
 524:	4c55                	li	s8,21
 526:	00000c97          	auipc	s9,0x0
 52a:	3bac8c93          	addi	s9,s9,954 # 8e0 <malloc+0x12c>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
        s = va_arg(ap, char*);
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 52e:	02800d93          	li	s11,40
  putc(fd, 'x');
 532:	4d41                	li	s10,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 534:	00000b97          	auipc	s7,0x0
 538:	404b8b93          	addi	s7,s7,1028 # 938 <digits>
 53c:	a839                	j	55a <vprintf+0x6a>
        putc(fd, c);
 53e:	85ca                	mv	a1,s2
 540:	8556                	mv	a0,s5
 542:	00000097          	auipc	ra,0x0
 546:	ee2080e7          	jalr	-286(ra) # 424 <putc>
 54a:	a019                	j	550 <vprintf+0x60>
    } else if(state == '%'){
 54c:	01498d63          	beq	s3,s4,566 <vprintf+0x76>
  for(i = 0; fmt[i]; i++){
 550:	0485                	addi	s1,s1,1
 552:	fff4c903          	lbu	s2,-1(s1)
 556:	14090d63          	beqz	s2,6b0 <vprintf+0x1c0>
    if(state == 0){
 55a:	fe0999e3          	bnez	s3,54c <vprintf+0x5c>
      if(c == '%'){
 55e:	ff4910e3          	bne	s2,s4,53e <vprintf+0x4e>
        state = '%';
 562:	89d2                	mv	s3,s4
 564:	b7f5                	j	550 <vprintf+0x60>
      if(c == 'd'){
 566:	11490c63          	beq	s2,s4,67e <vprintf+0x18e>
 56a:	f9d9079b          	addiw	a5,s2,-99
 56e:	0ff7f793          	zext.b	a5,a5
 572:	10fc6e63          	bltu	s8,a5,68e <vprintf+0x19e>
 576:	f9d9079b          	addiw	a5,s2,-99
 57a:	0ff7f713          	zext.b	a4,a5
 57e:	10ec6863          	bltu	s8,a4,68e <vprintf+0x19e>
 582:	00271793          	slli	a5,a4,0x2
 586:	97e6                	add	a5,a5,s9
 588:	439c                	lw	a5,0(a5)
 58a:	97e6                	add	a5,a5,s9
 58c:	8782                	jr	a5
        printint(fd, va_arg(ap, int), 10, 1);
 58e:	008b0913          	addi	s2,s6,8
 592:	4685                	li	a3,1
 594:	4629                	li	a2,10
 596:	000b2583          	lw	a1,0(s6)
 59a:	8556                	mv	a0,s5
 59c:	00000097          	auipc	ra,0x0
 5a0:	eaa080e7          	jalr	-342(ra) # 446 <printint>
 5a4:	8b4a                	mv	s6,s2
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5a6:	4981                	li	s3,0
 5a8:	b765                	j	550 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 5aa:	008b0913          	addi	s2,s6,8
 5ae:	4681                	li	a3,0
 5b0:	4629                	li	a2,10
 5b2:	000b2583          	lw	a1,0(s6)
 5b6:	8556                	mv	a0,s5
 5b8:	00000097          	auipc	ra,0x0
 5bc:	e8e080e7          	jalr	-370(ra) # 446 <printint>
 5c0:	8b4a                	mv	s6,s2
      state = 0;
 5c2:	4981                	li	s3,0
 5c4:	b771                	j	550 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 5c6:	008b0913          	addi	s2,s6,8
 5ca:	4681                	li	a3,0
 5cc:	866a                	mv	a2,s10
 5ce:	000b2583          	lw	a1,0(s6)
 5d2:	8556                	mv	a0,s5
 5d4:	00000097          	auipc	ra,0x0
 5d8:	e72080e7          	jalr	-398(ra) # 446 <printint>
 5dc:	8b4a                	mv	s6,s2
      state = 0;
 5de:	4981                	li	s3,0
 5e0:	bf85                	j	550 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 5e2:	008b0793          	addi	a5,s6,8
 5e6:	f8f43423          	sd	a5,-120(s0)
 5ea:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 5ee:	03000593          	li	a1,48
 5f2:	8556                	mv	a0,s5
 5f4:	00000097          	auipc	ra,0x0
 5f8:	e30080e7          	jalr	-464(ra) # 424 <putc>
  putc(fd, 'x');
 5fc:	07800593          	li	a1,120
 600:	8556                	mv	a0,s5
 602:	00000097          	auipc	ra,0x0
 606:	e22080e7          	jalr	-478(ra) # 424 <putc>
 60a:	896a                	mv	s2,s10
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 60c:	03c9d793          	srli	a5,s3,0x3c
 610:	97de                	add	a5,a5,s7
 612:	0007c583          	lbu	a1,0(a5)
 616:	8556                	mv	a0,s5
 618:	00000097          	auipc	ra,0x0
 61c:	e0c080e7          	jalr	-500(ra) # 424 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 620:	0992                	slli	s3,s3,0x4
 622:	397d                	addiw	s2,s2,-1
 624:	fe0914e3          	bnez	s2,60c <vprintf+0x11c>
        printptr(fd, va_arg(ap, uint64));
 628:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 62c:	4981                	li	s3,0
 62e:	b70d                	j	550 <vprintf+0x60>
        s = va_arg(ap, char*);
 630:	008b0913          	addi	s2,s6,8
 634:	000b3983          	ld	s3,0(s6)
        if(s == 0)
 638:	02098163          	beqz	s3,65a <vprintf+0x16a>
        while(*s != 0){
 63c:	0009c583          	lbu	a1,0(s3)
 640:	c5ad                	beqz	a1,6aa <vprintf+0x1ba>
          putc(fd, *s);
 642:	8556                	mv	a0,s5
 644:	00000097          	auipc	ra,0x0
 648:	de0080e7          	jalr	-544(ra) # 424 <putc>
          s++;
 64c:	0985                	addi	s3,s3,1
        while(*s != 0){
 64e:	0009c583          	lbu	a1,0(s3)
 652:	f9e5                	bnez	a1,642 <vprintf+0x152>
        s = va_arg(ap, char*);
 654:	8b4a                	mv	s6,s2
      state = 0;
 656:	4981                	li	s3,0
 658:	bde5                	j	550 <vprintf+0x60>
          s = "(null)";
 65a:	00000997          	auipc	s3,0x0
 65e:	27e98993          	addi	s3,s3,638 # 8d8 <malloc+0x124>
        while(*s != 0){
 662:	85ee                	mv	a1,s11
 664:	bff9                	j	642 <vprintf+0x152>
        putc(fd, va_arg(ap, uint));
 666:	008b0913          	addi	s2,s6,8
 66a:	000b4583          	lbu	a1,0(s6)
 66e:	8556                	mv	a0,s5
 670:	00000097          	auipc	ra,0x0
 674:	db4080e7          	jalr	-588(ra) # 424 <putc>
 678:	8b4a                	mv	s6,s2
      state = 0;
 67a:	4981                	li	s3,0
 67c:	bdd1                	j	550 <vprintf+0x60>
        putc(fd, c);
 67e:	85d2                	mv	a1,s4
 680:	8556                	mv	a0,s5
 682:	00000097          	auipc	ra,0x0
 686:	da2080e7          	jalr	-606(ra) # 424 <putc>
      state = 0;
 68a:	4981                	li	s3,0
 68c:	b5d1                	j	550 <vprintf+0x60>
        putc(fd, '%');
 68e:	85d2                	mv	a1,s4
 690:	8556                	mv	a0,s5
 692:	00000097          	auipc	ra,0x0
 696:	d92080e7          	jalr	-622(ra) # 424 <putc>
        putc(fd, c);
 69a:	85ca                	mv	a1,s2
 69c:	8556                	mv	a0,s5
 69e:	00000097          	auipc	ra,0x0
 6a2:	d86080e7          	jalr	-634(ra) # 424 <putc>
      state = 0;
 6a6:	4981                	li	s3,0
 6a8:	b565                	j	550 <vprintf+0x60>
        s = va_arg(ap, char*);
 6aa:	8b4a                	mv	s6,s2
      state = 0;
 6ac:	4981                	li	s3,0
 6ae:	b54d                	j	550 <vprintf+0x60>
    }
  }
}
 6b0:	70e6                	ld	ra,120(sp)
 6b2:	7446                	ld	s0,112(sp)
 6b4:	74a6                	ld	s1,104(sp)
 6b6:	7906                	ld	s2,96(sp)
 6b8:	69e6                	ld	s3,88(sp)
 6ba:	6a46                	ld	s4,80(sp)
 6bc:	6aa6                	ld	s5,72(sp)
 6be:	6b06                	ld	s6,64(sp)
 6c0:	7be2                	ld	s7,56(sp)
 6c2:	7c42                	ld	s8,48(sp)
 6c4:	7ca2                	ld	s9,40(sp)
 6c6:	7d02                	ld	s10,32(sp)
 6c8:	6de2                	ld	s11,24(sp)
 6ca:	6109                	addi	sp,sp,128
 6cc:	8082                	ret

00000000000006ce <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 6ce:	715d                	addi	sp,sp,-80
 6d0:	ec06                	sd	ra,24(sp)
 6d2:	e822                	sd	s0,16(sp)
 6d4:	1000                	addi	s0,sp,32
 6d6:	e010                	sd	a2,0(s0)
 6d8:	e414                	sd	a3,8(s0)
 6da:	e818                	sd	a4,16(s0)
 6dc:	ec1c                	sd	a5,24(s0)
 6de:	03043023          	sd	a6,32(s0)
 6e2:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 6e6:	8622                	mv	a2,s0
 6e8:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 6ec:	00000097          	auipc	ra,0x0
 6f0:	e04080e7          	jalr	-508(ra) # 4f0 <vprintf>
}
 6f4:	60e2                	ld	ra,24(sp)
 6f6:	6442                	ld	s0,16(sp)
 6f8:	6161                	addi	sp,sp,80
 6fa:	8082                	ret

00000000000006fc <printf>:

void
printf(const char *fmt, ...)
{
 6fc:	711d                	addi	sp,sp,-96
 6fe:	ec06                	sd	ra,24(sp)
 700:	e822                	sd	s0,16(sp)
 702:	1000                	addi	s0,sp,32
 704:	e40c                	sd	a1,8(s0)
 706:	e810                	sd	a2,16(s0)
 708:	ec14                	sd	a3,24(s0)
 70a:	f018                	sd	a4,32(s0)
 70c:	f41c                	sd	a5,40(s0)
 70e:	03043823          	sd	a6,48(s0)
 712:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 716:	00840613          	addi	a2,s0,8
 71a:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 71e:	85aa                	mv	a1,a0
 720:	4505                	li	a0,1
 722:	00000097          	auipc	ra,0x0
 726:	dce080e7          	jalr	-562(ra) # 4f0 <vprintf>
}
 72a:	60e2                	ld	ra,24(sp)
 72c:	6442                	ld	s0,16(sp)
 72e:	6125                	addi	sp,sp,96
 730:	8082                	ret

0000000000000732 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 732:	1141                	addi	sp,sp,-16
 734:	e422                	sd	s0,8(sp)
 736:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 738:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 73c:	00000797          	auipc	a5,0x0
 740:	2147b783          	ld	a5,532(a5) # 950 <freep>
 744:	a02d                	j	76e <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 746:	4618                	lw	a4,8(a2)
 748:	9f2d                	addw	a4,a4,a1
 74a:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 74e:	6398                	ld	a4,0(a5)
 750:	6310                	ld	a2,0(a4)
 752:	a83d                	j	790 <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 754:	ff852703          	lw	a4,-8(a0)
 758:	9f31                	addw	a4,a4,a2
 75a:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 75c:	ff053683          	ld	a3,-16(a0)
 760:	a091                	j	7a4 <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 762:	6398                	ld	a4,0(a5)
 764:	00e7e463          	bltu	a5,a4,76c <free+0x3a>
 768:	00e6ea63          	bltu	a3,a4,77c <free+0x4a>
{
 76c:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 76e:	fed7fae3          	bgeu	a5,a3,762 <free+0x30>
 772:	6398                	ld	a4,0(a5)
 774:	00e6e463          	bltu	a3,a4,77c <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 778:	fee7eae3          	bltu	a5,a4,76c <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
 77c:	ff852583          	lw	a1,-8(a0)
 780:	6390                	ld	a2,0(a5)
 782:	02059813          	slli	a6,a1,0x20
 786:	01c85713          	srli	a4,a6,0x1c
 78a:	9736                	add	a4,a4,a3
 78c:	fae60de3          	beq	a2,a4,746 <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
 790:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 794:	4790                	lw	a2,8(a5)
 796:	02061593          	slli	a1,a2,0x20
 79a:	01c5d713          	srli	a4,a1,0x1c
 79e:	973e                	add	a4,a4,a5
 7a0:	fae68ae3          	beq	a3,a4,754 <free+0x22>
    p->s.ptr = bp->s.ptr;
 7a4:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 7a6:	00000717          	auipc	a4,0x0
 7aa:	1af73523          	sd	a5,426(a4) # 950 <freep>
}
 7ae:	6422                	ld	s0,8(sp)
 7b0:	0141                	addi	sp,sp,16
 7b2:	8082                	ret

00000000000007b4 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7b4:	7139                	addi	sp,sp,-64
 7b6:	fc06                	sd	ra,56(sp)
 7b8:	f822                	sd	s0,48(sp)
 7ba:	f426                	sd	s1,40(sp)
 7bc:	f04a                	sd	s2,32(sp)
 7be:	ec4e                	sd	s3,24(sp)
 7c0:	e852                	sd	s4,16(sp)
 7c2:	e456                	sd	s5,8(sp)
 7c4:	e05a                	sd	s6,0(sp)
 7c6:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7c8:	02051493          	slli	s1,a0,0x20
 7cc:	9081                	srli	s1,s1,0x20
 7ce:	04bd                	addi	s1,s1,15
 7d0:	8091                	srli	s1,s1,0x4
 7d2:	00148a1b          	addiw	s4,s1,1
 7d6:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 7d8:	00000517          	auipc	a0,0x0
 7dc:	17853503          	ld	a0,376(a0) # 950 <freep>
 7e0:	c515                	beqz	a0,80c <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e2:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 7e4:	4798                	lw	a4,8(a5)
 7e6:	04977163          	bgeu	a4,s1,828 <malloc+0x74>
 7ea:	89d2                	mv	s3,s4
 7ec:	000a071b          	sext.w	a4,s4
 7f0:	6685                	lui	a3,0x1
 7f2:	00d77363          	bgeu	a4,a3,7f8 <malloc+0x44>
 7f6:	6985                	lui	s3,0x1
 7f8:	00098b1b          	sext.w	s6,s3
  p = sbrk(nu * sizeof(Header));
 7fc:	0049999b          	slliw	s3,s3,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 800:	00000917          	auipc	s2,0x0
 804:	15090913          	addi	s2,s2,336 # 950 <freep>
  if(p == (char*)-1)
 808:	5afd                	li	s5,-1
 80a:	a8a5                	j	882 <malloc+0xce>
    base.s.ptr = freep = prevp = &base;
 80c:	00000797          	auipc	a5,0x0
 810:	14478793          	addi	a5,a5,324 # 950 <freep>
 814:	00000717          	auipc	a4,0x0
 818:	14470713          	addi	a4,a4,324 # 958 <base>
 81c:	e398                	sd	a4,0(a5)
 81e:	e798                	sd	a4,8(a5)
    base.s.size = 0;
 820:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 824:	87ba                	mv	a5,a4
 826:	b7d1                	j	7ea <malloc+0x36>
      if(p->s.size == nunits)
 828:	02e48c63          	beq	s1,a4,860 <malloc+0xac>
        p->s.size -= nunits;
 82c:	4147073b          	subw	a4,a4,s4
 830:	c798                	sw	a4,8(a5)
        p += p->s.size;
 832:	02071693          	slli	a3,a4,0x20
 836:	01c6d713          	srli	a4,a3,0x1c
 83a:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 83c:	0147a423          	sw	s4,8(a5)
      freep = prevp;
 840:	00000717          	auipc	a4,0x0
 844:	10a73823          	sd	a0,272(a4) # 950 <freep>
      return (void*)(p + 1);
 848:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 84c:	70e2                	ld	ra,56(sp)
 84e:	7442                	ld	s0,48(sp)
 850:	74a2                	ld	s1,40(sp)
 852:	7902                	ld	s2,32(sp)
 854:	69e2                	ld	s3,24(sp)
 856:	6a42                	ld	s4,16(sp)
 858:	6aa2                	ld	s5,8(sp)
 85a:	6b02                	ld	s6,0(sp)
 85c:	6121                	addi	sp,sp,64
 85e:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 860:	6398                	ld	a4,0(a5)
 862:	e118                	sd	a4,0(a0)
 864:	bff1                	j	840 <malloc+0x8c>
  hp->s.size = nu;
 866:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 86a:	0541                	addi	a0,a0,16
 86c:	00000097          	auipc	ra,0x0
 870:	ec6080e7          	jalr	-314(ra) # 732 <free>
  return freep;
 874:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 878:	d971                	beqz	a0,84c <malloc+0x98>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 87a:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 87c:	4798                	lw	a4,8(a5)
 87e:	fa9775e3          	bgeu	a4,s1,828 <malloc+0x74>
    if(p == freep)
 882:	00093703          	ld	a4,0(s2)
 886:	853e                	mv	a0,a5
 888:	fef719e3          	bne	a4,a5,87a <malloc+0xc6>
  p = sbrk(nu * sizeof(Header));
 88c:	854e                	mv	a0,s3
 88e:	00000097          	auipc	ra,0x0
 892:	b16080e7          	jalr	-1258(ra) # 3a4 <sbrk>
  if(p == (char*)-1)
 896:	fd5518e3          	bne	a0,s5,866 <malloc+0xb2>
        return 0;
 89a:	4501                	li	a0,0
 89c:	bf45                	j	84c <malloc+0x98>
