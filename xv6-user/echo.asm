
xv6-user/_echo:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/include/stat.h"
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
   c:	e052                	sd	s4,0(sp)
   e:	1800                	addi	s0,sp,48
  int i;

  for(i = 1; i < argc; i++){
  10:	4785                	li	a5,1
  12:	06a7d463          	bge	a5,a0,7a <main+0x7a>
  16:	00858493          	addi	s1,a1,8
  1a:	ffe5099b          	addiw	s3,a0,-2
  1e:	02099793          	slli	a5,s3,0x20
  22:	01d7d993          	srli	s3,a5,0x1d
  26:	05c1                	addi	a1,a1,16
  28:	99ae                	add	s3,s3,a1
    write(1, argv[i], strlen(argv[i]));
    if(i + 1 < argc){
      write(1, " ", 1);
  2a:	00001a17          	auipc	s4,0x1
  2e:	87ea0a13          	addi	s4,s4,-1922 # 8a8 <malloc+0xec>
    write(1, argv[i], strlen(argv[i]));
  32:	0004b903          	ld	s2,0(s1)
  36:	854a                	mv	a0,s2
  38:	00000097          	auipc	ra,0x0
  3c:	0c2080e7          	jalr	194(ra) # fa <strlen>
  40:	0005061b          	sext.w	a2,a0
  44:	85ca                	mv	a1,s2
  46:	4505                	li	a0,1
  48:	00000097          	auipc	ra,0x0
  4c:	314080e7          	jalr	788(ra) # 35c <write>
    if(i + 1 < argc){
  50:	04a1                	addi	s1,s1,8
  52:	01348a63          	beq	s1,s3,66 <main+0x66>
      write(1, " ", 1);
  56:	4605                	li	a2,1
  58:	85d2                	mv	a1,s4
  5a:	4505                	li	a0,1
  5c:	00000097          	auipc	ra,0x0
  60:	300080e7          	jalr	768(ra) # 35c <write>
  for(i = 1; i < argc; i++){
  64:	b7f9                	j	32 <main+0x32>
    } else {
      write(1, "\n", 1);
  66:	4605                	li	a2,1
  68:	00001597          	auipc	a1,0x1
  6c:	84858593          	addi	a1,a1,-1976 # 8b0 <malloc+0xf4>
  70:	4505                	li	a0,1
  72:	00000097          	auipc	ra,0x0
  76:	2ea080e7          	jalr	746(ra) # 35c <write>
    }
  }
  exit(0);
  7a:	4501                	li	a0,0
  7c:	00000097          	auipc	ra,0x0
  80:	2c0080e7          	jalr	704(ra) # 33c <exit>

0000000000000084 <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
  84:	1141                	addi	sp,sp,-16
  86:	e422                	sd	s0,8(sp)
  88:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  8a:	87aa                	mv	a5,a0
  8c:	0585                	addi	a1,a1,1
  8e:	0785                	addi	a5,a5,1
  90:	fff5c703          	lbu	a4,-1(a1)
  94:	fee78fa3          	sb	a4,-1(a5)
  98:	fb75                	bnez	a4,8c <strcpy+0x8>
    ;
  return os;
}
  9a:	6422                	ld	s0,8(sp)
  9c:	0141                	addi	sp,sp,16
  9e:	8082                	ret

00000000000000a0 <strcat>:

char*
strcat(char *s, const char *t)
{
  a0:	1141                	addi	sp,sp,-16
  a2:	e422                	sd	s0,8(sp)
  a4:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
  a6:	00054783          	lbu	a5,0(a0)
  aa:	c385                	beqz	a5,ca <strcat+0x2a>
  ac:	87aa                	mv	a5,a0
    s++;
  ae:	0785                	addi	a5,a5,1
  while(*s)
  b0:	0007c703          	lbu	a4,0(a5)
  b4:	ff6d                	bnez	a4,ae <strcat+0xe>
  while((*s++ = *t++))
  b6:	0585                	addi	a1,a1,1
  b8:	0785                	addi	a5,a5,1
  ba:	fff5c703          	lbu	a4,-1(a1)
  be:	fee78fa3          	sb	a4,-1(a5)
  c2:	fb75                	bnez	a4,b6 <strcat+0x16>
    ;
  return os;
}
  c4:	6422                	ld	s0,8(sp)
  c6:	0141                	addi	sp,sp,16
  c8:	8082                	ret
  while(*s)
  ca:	87aa                	mv	a5,a0
  cc:	b7ed                	j	b6 <strcat+0x16>

00000000000000ce <strcmp>:


int
strcmp(const char *p, const char *q)
{
  ce:	1141                	addi	sp,sp,-16
  d0:	e422                	sd	s0,8(sp)
  d2:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
  d4:	00054783          	lbu	a5,0(a0)
  d8:	cb91                	beqz	a5,ec <strcmp+0x1e>
  da:	0005c703          	lbu	a4,0(a1)
  de:	00f71763          	bne	a4,a5,ec <strcmp+0x1e>
    p++, q++;
  e2:	0505                	addi	a0,a0,1
  e4:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
  e6:	00054783          	lbu	a5,0(a0)
  ea:	fbe5                	bnez	a5,da <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
  ec:	0005c503          	lbu	a0,0(a1)
}
  f0:	40a7853b          	subw	a0,a5,a0
  f4:	6422                	ld	s0,8(sp)
  f6:	0141                	addi	sp,sp,16
  f8:	8082                	ret

00000000000000fa <strlen>:

uint
strlen(const char *s)
{
  fa:	1141                	addi	sp,sp,-16
  fc:	e422                	sd	s0,8(sp)
  fe:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 100:	00054783          	lbu	a5,0(a0)
 104:	cf91                	beqz	a5,120 <strlen+0x26>
 106:	0505                	addi	a0,a0,1
 108:	87aa                	mv	a5,a0
 10a:	4685                	li	a3,1
 10c:	9e89                	subw	a3,a3,a0
 10e:	00f6853b          	addw	a0,a3,a5
 112:	0785                	addi	a5,a5,1
 114:	fff7c703          	lbu	a4,-1(a5)
 118:	fb7d                	bnez	a4,10e <strlen+0x14>
    ;
  return n;
}
 11a:	6422                	ld	s0,8(sp)
 11c:	0141                	addi	sp,sp,16
 11e:	8082                	ret
  for(n = 0; s[n]; n++)
 120:	4501                	li	a0,0
 122:	bfe5                	j	11a <strlen+0x20>

0000000000000124 <memset>:

void*
memset(void *dst, int c, uint n)
{
 124:	1141                	addi	sp,sp,-16
 126:	e422                	sd	s0,8(sp)
 128:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 12a:	ca19                	beqz	a2,140 <memset+0x1c>
 12c:	87aa                	mv	a5,a0
 12e:	1602                	slli	a2,a2,0x20
 130:	9201                	srli	a2,a2,0x20
 132:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 136:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 13a:	0785                	addi	a5,a5,1
 13c:	fee79de3          	bne	a5,a4,136 <memset+0x12>
  }
  return dst;
}
 140:	6422                	ld	s0,8(sp)
 142:	0141                	addi	sp,sp,16
 144:	8082                	ret

0000000000000146 <strchr>:

char*
strchr(const char *s, char c)
{
 146:	1141                	addi	sp,sp,-16
 148:	e422                	sd	s0,8(sp)
 14a:	0800                	addi	s0,sp,16
  for(; *s; s++)
 14c:	00054783          	lbu	a5,0(a0)
 150:	cb99                	beqz	a5,166 <strchr+0x20>
    if(*s == c)
 152:	00f58763          	beq	a1,a5,160 <strchr+0x1a>
  for(; *s; s++)
 156:	0505                	addi	a0,a0,1
 158:	00054783          	lbu	a5,0(a0)
 15c:	fbfd                	bnez	a5,152 <strchr+0xc>
      return (char*)s;
  return 0;
 15e:	4501                	li	a0,0
}
 160:	6422                	ld	s0,8(sp)
 162:	0141                	addi	sp,sp,16
 164:	8082                	ret
  return 0;
 166:	4501                	li	a0,0
 168:	bfe5                	j	160 <strchr+0x1a>

000000000000016a <gets>:

char*
gets(char *buf, int max)
{
 16a:	711d                	addi	sp,sp,-96
 16c:	ec86                	sd	ra,88(sp)
 16e:	e8a2                	sd	s0,80(sp)
 170:	e4a6                	sd	s1,72(sp)
 172:	e0ca                	sd	s2,64(sp)
 174:	fc4e                	sd	s3,56(sp)
 176:	f852                	sd	s4,48(sp)
 178:	f456                	sd	s5,40(sp)
 17a:	f05a                	sd	s6,32(sp)
 17c:	ec5e                	sd	s7,24(sp)
 17e:	e862                	sd	s8,16(sp)
 180:	1080                	addi	s0,sp,96
 182:	8baa                	mv	s7,a0
 184:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 186:	892a                	mv	s2,a0
 188:	4481                	li	s1,0
    cc = read(0, &c, 1);
 18a:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 18e:	4b29                	li	s6,10
 190:	4c35                	li	s8,13
  for(i=0; i+1 < max; ){
 192:	89a6                	mv	s3,s1
 194:	2485                	addiw	s1,s1,1
 196:	0344d763          	bge	s1,s4,1c4 <gets+0x5a>
    cc = read(0, &c, 1);
 19a:	4605                	li	a2,1
 19c:	85d6                	mv	a1,s5
 19e:	4501                	li	a0,0
 1a0:	00000097          	auipc	ra,0x0
 1a4:	1b4080e7          	jalr	436(ra) # 354 <read>
    if(cc < 1)
 1a8:	00a05e63          	blez	a0,1c4 <gets+0x5a>
    buf[i++] = c;
 1ac:	faf44783          	lbu	a5,-81(s0)
 1b0:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 1b4:	01678763          	beq	a5,s6,1c2 <gets+0x58>
 1b8:	0905                	addi	s2,s2,1
 1ba:	fd879ce3          	bne	a5,s8,192 <gets+0x28>
  for(i=0; i+1 < max; ){
 1be:	89a6                	mv	s3,s1
 1c0:	a011                	j	1c4 <gets+0x5a>
 1c2:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 1c4:	99de                	add	s3,s3,s7
 1c6:	00098023          	sb	zero,0(s3)
  return buf;
}
 1ca:	855e                	mv	a0,s7
 1cc:	60e6                	ld	ra,88(sp)
 1ce:	6446                	ld	s0,80(sp)
 1d0:	64a6                	ld	s1,72(sp)
 1d2:	6906                	ld	s2,64(sp)
 1d4:	79e2                	ld	s3,56(sp)
 1d6:	7a42                	ld	s4,48(sp)
 1d8:	7aa2                	ld	s5,40(sp)
 1da:	7b02                	ld	s6,32(sp)
 1dc:	6be2                	ld	s7,24(sp)
 1de:	6c42                	ld	s8,16(sp)
 1e0:	6125                	addi	sp,sp,96
 1e2:	8082                	ret

00000000000001e4 <stat>:

int
stat(const char *n, struct stat *st)
{
 1e4:	1101                	addi	sp,sp,-32
 1e6:	ec06                	sd	ra,24(sp)
 1e8:	e822                	sd	s0,16(sp)
 1ea:	e426                	sd	s1,8(sp)
 1ec:	e04a                	sd	s2,0(sp)
 1ee:	1000                	addi	s0,sp,32
 1f0:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f2:	4581                	li	a1,0
 1f4:	00000097          	auipc	ra,0x0
 1f8:	188080e7          	jalr	392(ra) # 37c <open>
  if(fd < 0)
 1fc:	02054563          	bltz	a0,226 <stat+0x42>
 200:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 202:	85ca                	mv	a1,s2
 204:	00000097          	auipc	ra,0x0
 208:	180080e7          	jalr	384(ra) # 384 <fstat>
 20c:	892a                	mv	s2,a0
  close(fd);
 20e:	8526                	mv	a0,s1
 210:	00000097          	auipc	ra,0x0
 214:	154080e7          	jalr	340(ra) # 364 <close>
  return r;
}
 218:	854a                	mv	a0,s2
 21a:	60e2                	ld	ra,24(sp)
 21c:	6442                	ld	s0,16(sp)
 21e:	64a2                	ld	s1,8(sp)
 220:	6902                	ld	s2,0(sp)
 222:	6105                	addi	sp,sp,32
 224:	8082                	ret
    return -1;
 226:	597d                	li	s2,-1
 228:	bfc5                	j	218 <stat+0x34>

000000000000022a <atoi>:

int
atoi(const char *s)
{
 22a:	1141                	addi	sp,sp,-16
 22c:	e422                	sd	s0,8(sp)
 22e:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 230:	00054703          	lbu	a4,0(a0)
 234:	02d00793          	li	a5,45
  int neg = 1;
 238:	4585                	li	a1,1
  if (*s == '-') {
 23a:	04f70363          	beq	a4,a5,280 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 23e:	00054703          	lbu	a4,0(a0)
 242:	fd07079b          	addiw	a5,a4,-48
 246:	0ff7f793          	zext.b	a5,a5
 24a:	46a5                	li	a3,9
 24c:	02f6ed63          	bltu	a3,a5,286 <atoi+0x5c>
  n = 0;
 250:	4681                	li	a3,0
  while('0' <= *s && *s <= '9')
 252:	4625                	li	a2,9
    n = n*10 + *s++ - '0';
 254:	0505                	addi	a0,a0,1
 256:	0026979b          	slliw	a5,a3,0x2
 25a:	9fb5                	addw	a5,a5,a3
 25c:	0017979b          	slliw	a5,a5,0x1
 260:	9fb9                	addw	a5,a5,a4
 262:	fd07869b          	addiw	a3,a5,-48
  while('0' <= *s && *s <= '9')
 266:	00054703          	lbu	a4,0(a0)
 26a:	fd07079b          	addiw	a5,a4,-48
 26e:	0ff7f793          	zext.b	a5,a5
 272:	fef671e3          	bgeu	a2,a5,254 <atoi+0x2a>
  return n * neg;
}
 276:	02d5853b          	mulw	a0,a1,a3
 27a:	6422                	ld	s0,8(sp)
 27c:	0141                	addi	sp,sp,16
 27e:	8082                	ret
    s++;
 280:	0505                	addi	a0,a0,1
    neg = -1;
 282:	55fd                	li	a1,-1
 284:	bf6d                	j	23e <atoi+0x14>
  n = 0;
 286:	4681                	li	a3,0
 288:	b7fd                	j	276 <atoi+0x4c>

000000000000028a <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 28a:	1141                	addi	sp,sp,-16
 28c:	e422                	sd	s0,8(sp)
 28e:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 290:	02b57463          	bgeu	a0,a1,2b8 <memmove+0x2e>
    while(n-- > 0)
 294:	00c05f63          	blez	a2,2b2 <memmove+0x28>
 298:	1602                	slli	a2,a2,0x20
 29a:	9201                	srli	a2,a2,0x20
 29c:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 2a0:	872a                	mv	a4,a0
      *dst++ = *src++;
 2a2:	0585                	addi	a1,a1,1
 2a4:	0705                	addi	a4,a4,1
 2a6:	fff5c683          	lbu	a3,-1(a1)
 2aa:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 2ae:	fee79ae3          	bne	a5,a4,2a2 <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 2b2:	6422                	ld	s0,8(sp)
 2b4:	0141                	addi	sp,sp,16
 2b6:	8082                	ret
    dst += n;
 2b8:	00c50733          	add	a4,a0,a2
    src += n;
 2bc:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 2be:	fec05ae3          	blez	a2,2b2 <memmove+0x28>
 2c2:	fff6079b          	addiw	a5,a2,-1
 2c6:	1782                	slli	a5,a5,0x20
 2c8:	9381                	srli	a5,a5,0x20
 2ca:	fff7c793          	not	a5,a5
 2ce:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 2d0:	15fd                	addi	a1,a1,-1
 2d2:	177d                	addi	a4,a4,-1
 2d4:	0005c683          	lbu	a3,0(a1)
 2d8:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 2dc:	fee79ae3          	bne	a5,a4,2d0 <memmove+0x46>
 2e0:	bfc9                	j	2b2 <memmove+0x28>

00000000000002e2 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 2e2:	1141                	addi	sp,sp,-16
 2e4:	e422                	sd	s0,8(sp)
 2e6:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 2e8:	ca05                	beqz	a2,318 <memcmp+0x36>
 2ea:	fff6069b          	addiw	a3,a2,-1
 2ee:	1682                	slli	a3,a3,0x20
 2f0:	9281                	srli	a3,a3,0x20
 2f2:	0685                	addi	a3,a3,1
 2f4:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 2f6:	00054783          	lbu	a5,0(a0)
 2fa:	0005c703          	lbu	a4,0(a1)
 2fe:	00e79863          	bne	a5,a4,30e <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 302:	0505                	addi	a0,a0,1
    p2++;
 304:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 306:	fed518e3          	bne	a0,a3,2f6 <memcmp+0x14>
  }
  return 0;
 30a:	4501                	li	a0,0
 30c:	a019                	j	312 <memcmp+0x30>
      return *p1 - *p2;
 30e:	40e7853b          	subw	a0,a5,a4
}
 312:	6422                	ld	s0,8(sp)
 314:	0141                	addi	sp,sp,16
 316:	8082                	ret
  return 0;
 318:	4501                	li	a0,0
 31a:	bfe5                	j	312 <memcmp+0x30>

000000000000031c <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 31c:	1141                	addi	sp,sp,-16
 31e:	e406                	sd	ra,8(sp)
 320:	e022                	sd	s0,0(sp)
 322:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 324:	00000097          	auipc	ra,0x0
 328:	f66080e7          	jalr	-154(ra) # 28a <memmove>
}
 32c:	60a2                	ld	ra,8(sp)
 32e:	6402                	ld	s0,0(sp)
 330:	0141                	addi	sp,sp,16
 332:	8082                	ret

0000000000000334 <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 334:	4885                	li	a7,1
 ecall
 336:	00000073          	ecall
 ret
 33a:	8082                	ret

000000000000033c <exit>:
.global exit
exit:
 li a7, SYS_exit
 33c:	4889                	li	a7,2
 ecall
 33e:	00000073          	ecall
 ret
 342:	8082                	ret

0000000000000344 <wait>:
.global wait
wait:
 li a7, SYS_wait
 344:	488d                	li	a7,3
 ecall
 346:	00000073          	ecall
 ret
 34a:	8082                	ret

000000000000034c <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 34c:	4891                	li	a7,4
 ecall
 34e:	00000073          	ecall
 ret
 352:	8082                	ret

0000000000000354 <read>:
.global read
read:
 li a7, SYS_read
 354:	4895                	li	a7,5
 ecall
 356:	00000073          	ecall
 ret
 35a:	8082                	ret

000000000000035c <write>:
.global write
write:
 li a7, SYS_write
 35c:	48c1                	li	a7,16
 ecall
 35e:	00000073          	ecall
 ret
 362:	8082                	ret

0000000000000364 <close>:
.global close
close:
 li a7, SYS_close
 364:	48d5                	li	a7,21
 ecall
 366:	00000073          	ecall
 ret
 36a:	8082                	ret

000000000000036c <kill>:
.global kill
kill:
 li a7, SYS_kill
 36c:	4899                	li	a7,6
 ecall
 36e:	00000073          	ecall
 ret
 372:	8082                	ret

0000000000000374 <exec>:
.global exec
exec:
 li a7, SYS_exec
 374:	489d                	li	a7,7
 ecall
 376:	00000073          	ecall
 ret
 37a:	8082                	ret

000000000000037c <open>:
.global open
open:
 li a7, SYS_open
 37c:	48bd                	li	a7,15
 ecall
 37e:	00000073          	ecall
 ret
 382:	8082                	ret

0000000000000384 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 384:	48a1                	li	a7,8
 ecall
 386:	00000073          	ecall
 ret
 38a:	8082                	ret

000000000000038c <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 38c:	48d1                	li	a7,20
 ecall
 38e:	00000073          	ecall
 ret
 392:	8082                	ret

0000000000000394 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 394:	48a5                	li	a7,9
 ecall
 396:	00000073          	ecall
 ret
 39a:	8082                	ret

000000000000039c <dup>:
.global dup
dup:
 li a7, SYS_dup
 39c:	48a9                	li	a7,10
 ecall
 39e:	00000073          	ecall
 ret
 3a2:	8082                	ret

00000000000003a4 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 3a4:	48ad                	li	a7,11
 ecall
 3a6:	00000073          	ecall
 ret
 3aa:	8082                	ret

00000000000003ac <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 3ac:	48b1                	li	a7,12
 ecall
 3ae:	00000073          	ecall
 ret
 3b2:	8082                	ret

00000000000003b4 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 3b4:	48b5                	li	a7,13
 ecall
 3b6:	00000073          	ecall
 ret
 3ba:	8082                	ret

00000000000003bc <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 3bc:	48b9                	li	a7,14
 ecall
 3be:	00000073          	ecall
 ret
 3c2:	8082                	ret

00000000000003c4 <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 3c4:	48d9                	li	a7,22
 ecall
 3c6:	00000073          	ecall
 ret
 3ca:	8082                	ret

00000000000003cc <dev>:
.global dev
dev:
 li a7, SYS_dev
 3cc:	48dd                	li	a7,23
 ecall
 3ce:	00000073          	ecall
 ret
 3d2:	8082                	ret

00000000000003d4 <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 3d4:	48e1                	li	a7,24
 ecall
 3d6:	00000073          	ecall
 ret
 3da:	8082                	ret

00000000000003dc <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 3dc:	48e5                	li	a7,25
 ecall
 3de:	00000073          	ecall
 ret
 3e2:	8082                	ret

00000000000003e4 <remove>:
.global remove
remove:
 li a7, SYS_remove
 3e4:	48c5                	li	a7,17
 ecall
 3e6:	00000073          	ecall
 ret
 3ea:	8082                	ret

00000000000003ec <trace>:
.global trace
trace:
 li a7, SYS_trace
 3ec:	48c9                	li	a7,18
 ecall
 3ee:	00000073          	ecall
 ret
 3f2:	8082                	ret

00000000000003f4 <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 3f4:	48cd                	li	a7,19
 ecall
 3f6:	00000073          	ecall
 ret
 3fa:	8082                	ret

00000000000003fc <rename>:
.global rename
rename:
 li a7, SYS_rename
 3fc:	48e9                	li	a7,26
 ecall
 3fe:	00000073          	ecall
 ret
 402:	8082                	ret

0000000000000404 <poweroff>:
.global poweroff
poweroff:
 li a7, SYS_poweroff
 404:	0d200893          	li	a7,210
 ecall
 408:	00000073          	ecall
 ret
 40c:	8082                	ret

000000000000040e <mkdirat>:
.global mkdirat
mkdirat:
 li a7, SYS_mkdirat
 40e:	02200893          	li	a7,34
 ecall
 412:	00000073          	ecall
 ret
 416:	8082                	ret

0000000000000418 <clone>:
.global clone
clone:
 li a7, SYS_clone
 418:	0dc00893          	li	a7,220
 ecall
 41c:	00000073          	ecall
 ret
 420:	8082                	ret

0000000000000422 <wait4>:
.global wait4
wait4:
 li a7, SYS_wait4
 422:	10400893          	li	a7,260
 ecall
 426:	00000073          	ecall
 ret
 42a:	8082                	ret

000000000000042c <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 42c:	1101                	addi	sp,sp,-32
 42e:	ec06                	sd	ra,24(sp)
 430:	e822                	sd	s0,16(sp)
 432:	1000                	addi	s0,sp,32
 434:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 438:	4605                	li	a2,1
 43a:	fef40593          	addi	a1,s0,-17
 43e:	00000097          	auipc	ra,0x0
 442:	f1e080e7          	jalr	-226(ra) # 35c <write>
}
 446:	60e2                	ld	ra,24(sp)
 448:	6442                	ld	s0,16(sp)
 44a:	6105                	addi	sp,sp,32
 44c:	8082                	ret

000000000000044e <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 44e:	7139                	addi	sp,sp,-64
 450:	fc06                	sd	ra,56(sp)
 452:	f822                	sd	s0,48(sp)
 454:	f426                	sd	s1,40(sp)
 456:	f04a                	sd	s2,32(sp)
 458:	ec4e                	sd	s3,24(sp)
 45a:	0080                	addi	s0,sp,64
 45c:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 45e:	c299                	beqz	a3,464 <printint+0x16>
 460:	0805c863          	bltz	a1,4f0 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 464:	2581                	sext.w	a1,a1
  neg = 0;
 466:	4881                	li	a7,0
  }

  i = 0;
 468:	fc040993          	addi	s3,s0,-64
  neg = 0;
 46c:	86ce                	mv	a3,s3
  i = 0;
 46e:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 470:	2601                	sext.w	a2,a2
 472:	00000517          	auipc	a0,0x0
 476:	4a650513          	addi	a0,a0,1190 # 918 <digits>
 47a:	883a                	mv	a6,a4
 47c:	2705                	addiw	a4,a4,1
 47e:	02c5f7bb          	remuw	a5,a1,a2
 482:	1782                	slli	a5,a5,0x20
 484:	9381                	srli	a5,a5,0x20
 486:	97aa                	add	a5,a5,a0
 488:	0007c783          	lbu	a5,0(a5)
 48c:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 490:	0005879b          	sext.w	a5,a1
 494:	02c5d5bb          	divuw	a1,a1,a2
 498:	0685                	addi	a3,a3,1
 49a:	fec7f0e3          	bgeu	a5,a2,47a <printint+0x2c>
  if(neg)
 49e:	00088c63          	beqz	a7,4b6 <printint+0x68>
    buf[i++] = '-';
 4a2:	fd070793          	addi	a5,a4,-48
 4a6:	00878733          	add	a4,a5,s0
 4aa:	02d00793          	li	a5,45
 4ae:	fef70823          	sb	a5,-16(a4)
 4b2:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 4b6:	02e05663          	blez	a4,4e2 <printint+0x94>
 4ba:	fc040913          	addi	s2,s0,-64
 4be:	993a                	add	s2,s2,a4
 4c0:	19fd                	addi	s3,s3,-1
 4c2:	99ba                	add	s3,s3,a4
 4c4:	377d                	addiw	a4,a4,-1
 4c6:	1702                	slli	a4,a4,0x20
 4c8:	9301                	srli	a4,a4,0x20
 4ca:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 4ce:	fff94583          	lbu	a1,-1(s2)
 4d2:	8526                	mv	a0,s1
 4d4:	00000097          	auipc	ra,0x0
 4d8:	f58080e7          	jalr	-168(ra) # 42c <putc>
  while(--i >= 0)
 4dc:	197d                	addi	s2,s2,-1
 4de:	ff3918e3          	bne	s2,s3,4ce <printint+0x80>
}
 4e2:	70e2                	ld	ra,56(sp)
 4e4:	7442                	ld	s0,48(sp)
 4e6:	74a2                	ld	s1,40(sp)
 4e8:	7902                	ld	s2,32(sp)
 4ea:	69e2                	ld	s3,24(sp)
 4ec:	6121                	addi	sp,sp,64
 4ee:	8082                	ret
    x = -xx;
 4f0:	40b005bb          	negw	a1,a1
    neg = 1;
 4f4:	4885                	li	a7,1
    x = -xx;
 4f6:	bf8d                	j	468 <printint+0x1a>

00000000000004f8 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 4f8:	7119                	addi	sp,sp,-128
 4fa:	fc86                	sd	ra,120(sp)
 4fc:	f8a2                	sd	s0,112(sp)
 4fe:	f4a6                	sd	s1,104(sp)
 500:	f0ca                	sd	s2,96(sp)
 502:	ecce                	sd	s3,88(sp)
 504:	e8d2                	sd	s4,80(sp)
 506:	e4d6                	sd	s5,72(sp)
 508:	e0da                	sd	s6,64(sp)
 50a:	fc5e                	sd	s7,56(sp)
 50c:	f862                	sd	s8,48(sp)
 50e:	f466                	sd	s9,40(sp)
 510:	f06a                	sd	s10,32(sp)
 512:	ec6e                	sd	s11,24(sp)
 514:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 516:	0005c903          	lbu	s2,0(a1)
 51a:	18090f63          	beqz	s2,6b8 <vprintf+0x1c0>
 51e:	8aaa                	mv	s5,a0
 520:	8b32                	mv	s6,a2
 522:	00158493          	addi	s1,a1,1
  state = 0;
 526:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 528:	02500a13          	li	s4,37
 52c:	4c55                	li	s8,21
 52e:	00000c97          	auipc	s9,0x0
 532:	392c8c93          	addi	s9,s9,914 # 8c0 <malloc+0x104>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
        s = va_arg(ap, char*);
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 536:	02800d93          	li	s11,40
  putc(fd, 'x');
 53a:	4d41                	li	s10,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 53c:	00000b97          	auipc	s7,0x0
 540:	3dcb8b93          	addi	s7,s7,988 # 918 <digits>
 544:	a839                	j	562 <vprintf+0x6a>
        putc(fd, c);
 546:	85ca                	mv	a1,s2
 548:	8556                	mv	a0,s5
 54a:	00000097          	auipc	ra,0x0
 54e:	ee2080e7          	jalr	-286(ra) # 42c <putc>
 552:	a019                	j	558 <vprintf+0x60>
    } else if(state == '%'){
 554:	01498d63          	beq	s3,s4,56e <vprintf+0x76>
  for(i = 0; fmt[i]; i++){
 558:	0485                	addi	s1,s1,1
 55a:	fff4c903          	lbu	s2,-1(s1)
 55e:	14090d63          	beqz	s2,6b8 <vprintf+0x1c0>
    if(state == 0){
 562:	fe0999e3          	bnez	s3,554 <vprintf+0x5c>
      if(c == '%'){
 566:	ff4910e3          	bne	s2,s4,546 <vprintf+0x4e>
        state = '%';
 56a:	89d2                	mv	s3,s4
 56c:	b7f5                	j	558 <vprintf+0x60>
      if(c == 'd'){
 56e:	11490c63          	beq	s2,s4,686 <vprintf+0x18e>
 572:	f9d9079b          	addiw	a5,s2,-99
 576:	0ff7f793          	zext.b	a5,a5
 57a:	10fc6e63          	bltu	s8,a5,696 <vprintf+0x19e>
 57e:	f9d9079b          	addiw	a5,s2,-99
 582:	0ff7f713          	zext.b	a4,a5
 586:	10ec6863          	bltu	s8,a4,696 <vprintf+0x19e>
 58a:	00271793          	slli	a5,a4,0x2
 58e:	97e6                	add	a5,a5,s9
 590:	439c                	lw	a5,0(a5)
 592:	97e6                	add	a5,a5,s9
 594:	8782                	jr	a5
        printint(fd, va_arg(ap, int), 10, 1);
 596:	008b0913          	addi	s2,s6,8
 59a:	4685                	li	a3,1
 59c:	4629                	li	a2,10
 59e:	000b2583          	lw	a1,0(s6)
 5a2:	8556                	mv	a0,s5
 5a4:	00000097          	auipc	ra,0x0
 5a8:	eaa080e7          	jalr	-342(ra) # 44e <printint>
 5ac:	8b4a                	mv	s6,s2
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5ae:	4981                	li	s3,0
 5b0:	b765                	j	558 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 5b2:	008b0913          	addi	s2,s6,8
 5b6:	4681                	li	a3,0
 5b8:	4629                	li	a2,10
 5ba:	000b2583          	lw	a1,0(s6)
 5be:	8556                	mv	a0,s5
 5c0:	00000097          	auipc	ra,0x0
 5c4:	e8e080e7          	jalr	-370(ra) # 44e <printint>
 5c8:	8b4a                	mv	s6,s2
      state = 0;
 5ca:	4981                	li	s3,0
 5cc:	b771                	j	558 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 5ce:	008b0913          	addi	s2,s6,8
 5d2:	4681                	li	a3,0
 5d4:	866a                	mv	a2,s10
 5d6:	000b2583          	lw	a1,0(s6)
 5da:	8556                	mv	a0,s5
 5dc:	00000097          	auipc	ra,0x0
 5e0:	e72080e7          	jalr	-398(ra) # 44e <printint>
 5e4:	8b4a                	mv	s6,s2
      state = 0;
 5e6:	4981                	li	s3,0
 5e8:	bf85                	j	558 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 5ea:	008b0793          	addi	a5,s6,8
 5ee:	f8f43423          	sd	a5,-120(s0)
 5f2:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 5f6:	03000593          	li	a1,48
 5fa:	8556                	mv	a0,s5
 5fc:	00000097          	auipc	ra,0x0
 600:	e30080e7          	jalr	-464(ra) # 42c <putc>
  putc(fd, 'x');
 604:	07800593          	li	a1,120
 608:	8556                	mv	a0,s5
 60a:	00000097          	auipc	ra,0x0
 60e:	e22080e7          	jalr	-478(ra) # 42c <putc>
 612:	896a                	mv	s2,s10
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 614:	03c9d793          	srli	a5,s3,0x3c
 618:	97de                	add	a5,a5,s7
 61a:	0007c583          	lbu	a1,0(a5)
 61e:	8556                	mv	a0,s5
 620:	00000097          	auipc	ra,0x0
 624:	e0c080e7          	jalr	-500(ra) # 42c <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 628:	0992                	slli	s3,s3,0x4
 62a:	397d                	addiw	s2,s2,-1
 62c:	fe0914e3          	bnez	s2,614 <vprintf+0x11c>
        printptr(fd, va_arg(ap, uint64));
 630:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 634:	4981                	li	s3,0
 636:	b70d                	j	558 <vprintf+0x60>
        s = va_arg(ap, char*);
 638:	008b0913          	addi	s2,s6,8
 63c:	000b3983          	ld	s3,0(s6)
        if(s == 0)
 640:	02098163          	beqz	s3,662 <vprintf+0x16a>
        while(*s != 0){
 644:	0009c583          	lbu	a1,0(s3)
 648:	c5ad                	beqz	a1,6b2 <vprintf+0x1ba>
          putc(fd, *s);
 64a:	8556                	mv	a0,s5
 64c:	00000097          	auipc	ra,0x0
 650:	de0080e7          	jalr	-544(ra) # 42c <putc>
          s++;
 654:	0985                	addi	s3,s3,1
        while(*s != 0){
 656:	0009c583          	lbu	a1,0(s3)
 65a:	f9e5                	bnez	a1,64a <vprintf+0x152>
        s = va_arg(ap, char*);
 65c:	8b4a                	mv	s6,s2
      state = 0;
 65e:	4981                	li	s3,0
 660:	bde5                	j	558 <vprintf+0x60>
          s = "(null)";
 662:	00000997          	auipc	s3,0x0
 666:	25698993          	addi	s3,s3,598 # 8b8 <malloc+0xfc>
        while(*s != 0){
 66a:	85ee                	mv	a1,s11
 66c:	bff9                	j	64a <vprintf+0x152>
        putc(fd, va_arg(ap, uint));
 66e:	008b0913          	addi	s2,s6,8
 672:	000b4583          	lbu	a1,0(s6)
 676:	8556                	mv	a0,s5
 678:	00000097          	auipc	ra,0x0
 67c:	db4080e7          	jalr	-588(ra) # 42c <putc>
 680:	8b4a                	mv	s6,s2
      state = 0;
 682:	4981                	li	s3,0
 684:	bdd1                	j	558 <vprintf+0x60>
        putc(fd, c);
 686:	85d2                	mv	a1,s4
 688:	8556                	mv	a0,s5
 68a:	00000097          	auipc	ra,0x0
 68e:	da2080e7          	jalr	-606(ra) # 42c <putc>
      state = 0;
 692:	4981                	li	s3,0
 694:	b5d1                	j	558 <vprintf+0x60>
        putc(fd, '%');
 696:	85d2                	mv	a1,s4
 698:	8556                	mv	a0,s5
 69a:	00000097          	auipc	ra,0x0
 69e:	d92080e7          	jalr	-622(ra) # 42c <putc>
        putc(fd, c);
 6a2:	85ca                	mv	a1,s2
 6a4:	8556                	mv	a0,s5
 6a6:	00000097          	auipc	ra,0x0
 6aa:	d86080e7          	jalr	-634(ra) # 42c <putc>
      state = 0;
 6ae:	4981                	li	s3,0
 6b0:	b565                	j	558 <vprintf+0x60>
        s = va_arg(ap, char*);
 6b2:	8b4a                	mv	s6,s2
      state = 0;
 6b4:	4981                	li	s3,0
 6b6:	b54d                	j	558 <vprintf+0x60>
    }
  }
}
 6b8:	70e6                	ld	ra,120(sp)
 6ba:	7446                	ld	s0,112(sp)
 6bc:	74a6                	ld	s1,104(sp)
 6be:	7906                	ld	s2,96(sp)
 6c0:	69e6                	ld	s3,88(sp)
 6c2:	6a46                	ld	s4,80(sp)
 6c4:	6aa6                	ld	s5,72(sp)
 6c6:	6b06                	ld	s6,64(sp)
 6c8:	7be2                	ld	s7,56(sp)
 6ca:	7c42                	ld	s8,48(sp)
 6cc:	7ca2                	ld	s9,40(sp)
 6ce:	7d02                	ld	s10,32(sp)
 6d0:	6de2                	ld	s11,24(sp)
 6d2:	6109                	addi	sp,sp,128
 6d4:	8082                	ret

00000000000006d6 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 6d6:	715d                	addi	sp,sp,-80
 6d8:	ec06                	sd	ra,24(sp)
 6da:	e822                	sd	s0,16(sp)
 6dc:	1000                	addi	s0,sp,32
 6de:	e010                	sd	a2,0(s0)
 6e0:	e414                	sd	a3,8(s0)
 6e2:	e818                	sd	a4,16(s0)
 6e4:	ec1c                	sd	a5,24(s0)
 6e6:	03043023          	sd	a6,32(s0)
 6ea:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 6ee:	8622                	mv	a2,s0
 6f0:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 6f4:	00000097          	auipc	ra,0x0
 6f8:	e04080e7          	jalr	-508(ra) # 4f8 <vprintf>
}
 6fc:	60e2                	ld	ra,24(sp)
 6fe:	6442                	ld	s0,16(sp)
 700:	6161                	addi	sp,sp,80
 702:	8082                	ret

0000000000000704 <printf>:

void
printf(const char *fmt, ...)
{
 704:	711d                	addi	sp,sp,-96
 706:	ec06                	sd	ra,24(sp)
 708:	e822                	sd	s0,16(sp)
 70a:	1000                	addi	s0,sp,32
 70c:	e40c                	sd	a1,8(s0)
 70e:	e810                	sd	a2,16(s0)
 710:	ec14                	sd	a3,24(s0)
 712:	f018                	sd	a4,32(s0)
 714:	f41c                	sd	a5,40(s0)
 716:	03043823          	sd	a6,48(s0)
 71a:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 71e:	00840613          	addi	a2,s0,8
 722:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 726:	85aa                	mv	a1,a0
 728:	4505                	li	a0,1
 72a:	00000097          	auipc	ra,0x0
 72e:	dce080e7          	jalr	-562(ra) # 4f8 <vprintf>
}
 732:	60e2                	ld	ra,24(sp)
 734:	6442                	ld	s0,16(sp)
 736:	6125                	addi	sp,sp,96
 738:	8082                	ret

000000000000073a <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 73a:	1141                	addi	sp,sp,-16
 73c:	e422                	sd	s0,8(sp)
 73e:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 740:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 744:	00000797          	auipc	a5,0x0
 748:	1ec7b783          	ld	a5,492(a5) # 930 <freep>
 74c:	a02d                	j	776 <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 74e:	4618                	lw	a4,8(a2)
 750:	9f2d                	addw	a4,a4,a1
 752:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 756:	6398                	ld	a4,0(a5)
 758:	6310                	ld	a2,0(a4)
 75a:	a83d                	j	798 <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 75c:	ff852703          	lw	a4,-8(a0)
 760:	9f31                	addw	a4,a4,a2
 762:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 764:	ff053683          	ld	a3,-16(a0)
 768:	a091                	j	7ac <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 76a:	6398                	ld	a4,0(a5)
 76c:	00e7e463          	bltu	a5,a4,774 <free+0x3a>
 770:	00e6ea63          	bltu	a3,a4,784 <free+0x4a>
{
 774:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 776:	fed7fae3          	bgeu	a5,a3,76a <free+0x30>
 77a:	6398                	ld	a4,0(a5)
 77c:	00e6e463          	bltu	a3,a4,784 <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 780:	fee7eae3          	bltu	a5,a4,774 <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
 784:	ff852583          	lw	a1,-8(a0)
 788:	6390                	ld	a2,0(a5)
 78a:	02059813          	slli	a6,a1,0x20
 78e:	01c85713          	srli	a4,a6,0x1c
 792:	9736                	add	a4,a4,a3
 794:	fae60de3          	beq	a2,a4,74e <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
 798:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 79c:	4790                	lw	a2,8(a5)
 79e:	02061593          	slli	a1,a2,0x20
 7a2:	01c5d713          	srli	a4,a1,0x1c
 7a6:	973e                	add	a4,a4,a5
 7a8:	fae68ae3          	beq	a3,a4,75c <free+0x22>
    p->s.ptr = bp->s.ptr;
 7ac:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 7ae:	00000717          	auipc	a4,0x0
 7b2:	18f73123          	sd	a5,386(a4) # 930 <freep>
}
 7b6:	6422                	ld	s0,8(sp)
 7b8:	0141                	addi	sp,sp,16
 7ba:	8082                	ret

00000000000007bc <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7bc:	7139                	addi	sp,sp,-64
 7be:	fc06                	sd	ra,56(sp)
 7c0:	f822                	sd	s0,48(sp)
 7c2:	f426                	sd	s1,40(sp)
 7c4:	f04a                	sd	s2,32(sp)
 7c6:	ec4e                	sd	s3,24(sp)
 7c8:	e852                	sd	s4,16(sp)
 7ca:	e456                	sd	s5,8(sp)
 7cc:	e05a                	sd	s6,0(sp)
 7ce:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7d0:	02051493          	slli	s1,a0,0x20
 7d4:	9081                	srli	s1,s1,0x20
 7d6:	04bd                	addi	s1,s1,15
 7d8:	8091                	srli	s1,s1,0x4
 7da:	00148a1b          	addiw	s4,s1,1
 7de:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 7e0:	00000517          	auipc	a0,0x0
 7e4:	15053503          	ld	a0,336(a0) # 930 <freep>
 7e8:	c515                	beqz	a0,814 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7ea:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 7ec:	4798                	lw	a4,8(a5)
 7ee:	04977163          	bgeu	a4,s1,830 <malloc+0x74>
 7f2:	89d2                	mv	s3,s4
 7f4:	000a071b          	sext.w	a4,s4
 7f8:	6685                	lui	a3,0x1
 7fa:	00d77363          	bgeu	a4,a3,800 <malloc+0x44>
 7fe:	6985                	lui	s3,0x1
 800:	00098b1b          	sext.w	s6,s3
  p = sbrk(nu * sizeof(Header));
 804:	0049999b          	slliw	s3,s3,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 808:	00000917          	auipc	s2,0x0
 80c:	12890913          	addi	s2,s2,296 # 930 <freep>
  if(p == (char*)-1)
 810:	5afd                	li	s5,-1
 812:	a8a5                	j	88a <malloc+0xce>
    base.s.ptr = freep = prevp = &base;
 814:	00000797          	auipc	a5,0x0
 818:	11c78793          	addi	a5,a5,284 # 930 <freep>
 81c:	00000717          	auipc	a4,0x0
 820:	11c70713          	addi	a4,a4,284 # 938 <base>
 824:	e398                	sd	a4,0(a5)
 826:	e798                	sd	a4,8(a5)
    base.s.size = 0;
 828:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 82c:	87ba                	mv	a5,a4
 82e:	b7d1                	j	7f2 <malloc+0x36>
      if(p->s.size == nunits)
 830:	02e48c63          	beq	s1,a4,868 <malloc+0xac>
        p->s.size -= nunits;
 834:	4147073b          	subw	a4,a4,s4
 838:	c798                	sw	a4,8(a5)
        p += p->s.size;
 83a:	02071693          	slli	a3,a4,0x20
 83e:	01c6d713          	srli	a4,a3,0x1c
 842:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 844:	0147a423          	sw	s4,8(a5)
      freep = prevp;
 848:	00000717          	auipc	a4,0x0
 84c:	0ea73423          	sd	a0,232(a4) # 930 <freep>
      return (void*)(p + 1);
 850:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 854:	70e2                	ld	ra,56(sp)
 856:	7442                	ld	s0,48(sp)
 858:	74a2                	ld	s1,40(sp)
 85a:	7902                	ld	s2,32(sp)
 85c:	69e2                	ld	s3,24(sp)
 85e:	6a42                	ld	s4,16(sp)
 860:	6aa2                	ld	s5,8(sp)
 862:	6b02                	ld	s6,0(sp)
 864:	6121                	addi	sp,sp,64
 866:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 868:	6398                	ld	a4,0(a5)
 86a:	e118                	sd	a4,0(a0)
 86c:	bff1                	j	848 <malloc+0x8c>
  hp->s.size = nu;
 86e:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 872:	0541                	addi	a0,a0,16
 874:	00000097          	auipc	ra,0x0
 878:	ec6080e7          	jalr	-314(ra) # 73a <free>
  return freep;
 87c:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 880:	d971                	beqz	a0,854 <malloc+0x98>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 882:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 884:	4798                	lw	a4,8(a5)
 886:	fa9775e3          	bgeu	a4,s1,830 <malloc+0x74>
    if(p == freep)
 88a:	00093703          	ld	a4,0(s2)
 88e:	853e                	mv	a0,a5
 890:	fef719e3          	bne	a4,a5,882 <malloc+0xc6>
  p = sbrk(nu * sizeof(Header));
 894:	854e                	mv	a0,s3
 896:	00000097          	auipc	ra,0x0
 89a:	b16080e7          	jalr	-1258(ra) # 3ac <sbrk>
  if(p == (char*)-1)
 89e:	fd5518e3          	bne	a0,s5,86e <malloc+0xb2>
        return 0;
 8a2:	4501                	li	a0,0
 8a4:	bf45                	j	854 <malloc+0x98>
