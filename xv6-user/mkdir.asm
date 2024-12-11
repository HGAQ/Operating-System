
xv6-user/_mkdir:     file format elf64-littleriscv


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
   c:	1800                	addi	s0,sp,48
  int i;

  if(argc < 2){
   e:	4785                	li	a5,1
  10:	02a7d763          	bge	a5,a0,3e <main+0x3e>
  14:	00858493          	addi	s1,a1,8
  18:	ffe5091b          	addiw	s2,a0,-2
  1c:	02091793          	slli	a5,s2,0x20
  20:	01d7d913          	srli	s2,a5,0x1d
  24:	05c1                	addi	a1,a1,16
  26:	992e                	add	s2,s2,a1
    fprintf(2, "Usage: mkdir files...\n");
    exit(1);
  }

  for(i = 1; i < argc; i++){
    if(mkdir(argv[i]) < 0){
  28:	6088                	ld	a0,0(s1)
  2a:	00000097          	auipc	ra,0x0
  2e:	356080e7          	jalr	854(ra) # 380 <mkdir>
  32:	02054463          	bltz	a0,5a <main+0x5a>
  for(i = 1; i < argc; i++){
  36:	04a1                	addi	s1,s1,8
  38:	ff2498e3          	bne	s1,s2,28 <main+0x28>
  3c:	a80d                	j	6e <main+0x6e>
    fprintf(2, "Usage: mkdir files...\n");
  3e:	00001597          	auipc	a1,0x1
  42:	86258593          	addi	a1,a1,-1950 # 8a0 <malloc+0xf0>
  46:	4509                	li	a0,2
  48:	00000097          	auipc	ra,0x0
  4c:	682080e7          	jalr	1666(ra) # 6ca <fprintf>
    exit(1);
  50:	4505                	li	a0,1
  52:	00000097          	auipc	ra,0x0
  56:	2de080e7          	jalr	734(ra) # 330 <exit>
      fprintf(2, "mkdir: %s failed to create\n", argv[i]);
  5a:	6090                	ld	a2,0(s1)
  5c:	00001597          	auipc	a1,0x1
  60:	85c58593          	addi	a1,a1,-1956 # 8b8 <malloc+0x108>
  64:	4509                	li	a0,2
  66:	00000097          	auipc	ra,0x0
  6a:	664080e7          	jalr	1636(ra) # 6ca <fprintf>
      break;
    }
  }

  exit(0);
  6e:	4501                	li	a0,0
  70:	00000097          	auipc	ra,0x0
  74:	2c0080e7          	jalr	704(ra) # 330 <exit>

0000000000000078 <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
  78:	1141                	addi	sp,sp,-16
  7a:	e422                	sd	s0,8(sp)
  7c:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  7e:	87aa                	mv	a5,a0
  80:	0585                	addi	a1,a1,1
  82:	0785                	addi	a5,a5,1
  84:	fff5c703          	lbu	a4,-1(a1)
  88:	fee78fa3          	sb	a4,-1(a5)
  8c:	fb75                	bnez	a4,80 <strcpy+0x8>
    ;
  return os;
}
  8e:	6422                	ld	s0,8(sp)
  90:	0141                	addi	sp,sp,16
  92:	8082                	ret

0000000000000094 <strcat>:

char*
strcat(char *s, const char *t)
{
  94:	1141                	addi	sp,sp,-16
  96:	e422                	sd	s0,8(sp)
  98:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
  9a:	00054783          	lbu	a5,0(a0)
  9e:	c385                	beqz	a5,be <strcat+0x2a>
  a0:	87aa                	mv	a5,a0
    s++;
  a2:	0785                	addi	a5,a5,1
  while(*s)
  a4:	0007c703          	lbu	a4,0(a5)
  a8:	ff6d                	bnez	a4,a2 <strcat+0xe>
  while((*s++ = *t++))
  aa:	0585                	addi	a1,a1,1
  ac:	0785                	addi	a5,a5,1
  ae:	fff5c703          	lbu	a4,-1(a1)
  b2:	fee78fa3          	sb	a4,-1(a5)
  b6:	fb75                	bnez	a4,aa <strcat+0x16>
    ;
  return os;
}
  b8:	6422                	ld	s0,8(sp)
  ba:	0141                	addi	sp,sp,16
  bc:	8082                	ret
  while(*s)
  be:	87aa                	mv	a5,a0
  c0:	b7ed                	j	aa <strcat+0x16>

00000000000000c2 <strcmp>:


int
strcmp(const char *p, const char *q)
{
  c2:	1141                	addi	sp,sp,-16
  c4:	e422                	sd	s0,8(sp)
  c6:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
  c8:	00054783          	lbu	a5,0(a0)
  cc:	cb91                	beqz	a5,e0 <strcmp+0x1e>
  ce:	0005c703          	lbu	a4,0(a1)
  d2:	00f71763          	bne	a4,a5,e0 <strcmp+0x1e>
    p++, q++;
  d6:	0505                	addi	a0,a0,1
  d8:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
  da:	00054783          	lbu	a5,0(a0)
  de:	fbe5                	bnez	a5,ce <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
  e0:	0005c503          	lbu	a0,0(a1)
}
  e4:	40a7853b          	subw	a0,a5,a0
  e8:	6422                	ld	s0,8(sp)
  ea:	0141                	addi	sp,sp,16
  ec:	8082                	ret

00000000000000ee <strlen>:

uint
strlen(const char *s)
{
  ee:	1141                	addi	sp,sp,-16
  f0:	e422                	sd	s0,8(sp)
  f2:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
  f4:	00054783          	lbu	a5,0(a0)
  f8:	cf91                	beqz	a5,114 <strlen+0x26>
  fa:	0505                	addi	a0,a0,1
  fc:	87aa                	mv	a5,a0
  fe:	4685                	li	a3,1
 100:	9e89                	subw	a3,a3,a0
 102:	00f6853b          	addw	a0,a3,a5
 106:	0785                	addi	a5,a5,1
 108:	fff7c703          	lbu	a4,-1(a5)
 10c:	fb7d                	bnez	a4,102 <strlen+0x14>
    ;
  return n;
}
 10e:	6422                	ld	s0,8(sp)
 110:	0141                	addi	sp,sp,16
 112:	8082                	ret
  for(n = 0; s[n]; n++)
 114:	4501                	li	a0,0
 116:	bfe5                	j	10e <strlen+0x20>

0000000000000118 <memset>:

void*
memset(void *dst, int c, uint n)
{
 118:	1141                	addi	sp,sp,-16
 11a:	e422                	sd	s0,8(sp)
 11c:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 11e:	ca19                	beqz	a2,134 <memset+0x1c>
 120:	87aa                	mv	a5,a0
 122:	1602                	slli	a2,a2,0x20
 124:	9201                	srli	a2,a2,0x20
 126:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 12a:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 12e:	0785                	addi	a5,a5,1
 130:	fee79de3          	bne	a5,a4,12a <memset+0x12>
  }
  return dst;
}
 134:	6422                	ld	s0,8(sp)
 136:	0141                	addi	sp,sp,16
 138:	8082                	ret

000000000000013a <strchr>:

char*
strchr(const char *s, char c)
{
 13a:	1141                	addi	sp,sp,-16
 13c:	e422                	sd	s0,8(sp)
 13e:	0800                	addi	s0,sp,16
  for(; *s; s++)
 140:	00054783          	lbu	a5,0(a0)
 144:	cb99                	beqz	a5,15a <strchr+0x20>
    if(*s == c)
 146:	00f58763          	beq	a1,a5,154 <strchr+0x1a>
  for(; *s; s++)
 14a:	0505                	addi	a0,a0,1
 14c:	00054783          	lbu	a5,0(a0)
 150:	fbfd                	bnez	a5,146 <strchr+0xc>
      return (char*)s;
  return 0;
 152:	4501                	li	a0,0
}
 154:	6422                	ld	s0,8(sp)
 156:	0141                	addi	sp,sp,16
 158:	8082                	ret
  return 0;
 15a:	4501                	li	a0,0
 15c:	bfe5                	j	154 <strchr+0x1a>

000000000000015e <gets>:

char*
gets(char *buf, int max)
{
 15e:	711d                	addi	sp,sp,-96
 160:	ec86                	sd	ra,88(sp)
 162:	e8a2                	sd	s0,80(sp)
 164:	e4a6                	sd	s1,72(sp)
 166:	e0ca                	sd	s2,64(sp)
 168:	fc4e                	sd	s3,56(sp)
 16a:	f852                	sd	s4,48(sp)
 16c:	f456                	sd	s5,40(sp)
 16e:	f05a                	sd	s6,32(sp)
 170:	ec5e                	sd	s7,24(sp)
 172:	e862                	sd	s8,16(sp)
 174:	1080                	addi	s0,sp,96
 176:	8baa                	mv	s7,a0
 178:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 17a:	892a                	mv	s2,a0
 17c:	4481                	li	s1,0
    cc = read(0, &c, 1);
 17e:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 182:	4b29                	li	s6,10
 184:	4c35                	li	s8,13
  for(i=0; i+1 < max; ){
 186:	89a6                	mv	s3,s1
 188:	2485                	addiw	s1,s1,1
 18a:	0344d763          	bge	s1,s4,1b8 <gets+0x5a>
    cc = read(0, &c, 1);
 18e:	4605                	li	a2,1
 190:	85d6                	mv	a1,s5
 192:	4501                	li	a0,0
 194:	00000097          	auipc	ra,0x0
 198:	1b4080e7          	jalr	436(ra) # 348 <read>
    if(cc < 1)
 19c:	00a05e63          	blez	a0,1b8 <gets+0x5a>
    buf[i++] = c;
 1a0:	faf44783          	lbu	a5,-81(s0)
 1a4:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 1a8:	01678763          	beq	a5,s6,1b6 <gets+0x58>
 1ac:	0905                	addi	s2,s2,1
 1ae:	fd879ce3          	bne	a5,s8,186 <gets+0x28>
  for(i=0; i+1 < max; ){
 1b2:	89a6                	mv	s3,s1
 1b4:	a011                	j	1b8 <gets+0x5a>
 1b6:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 1b8:	99de                	add	s3,s3,s7
 1ba:	00098023          	sb	zero,0(s3)
  return buf;
}
 1be:	855e                	mv	a0,s7
 1c0:	60e6                	ld	ra,88(sp)
 1c2:	6446                	ld	s0,80(sp)
 1c4:	64a6                	ld	s1,72(sp)
 1c6:	6906                	ld	s2,64(sp)
 1c8:	79e2                	ld	s3,56(sp)
 1ca:	7a42                	ld	s4,48(sp)
 1cc:	7aa2                	ld	s5,40(sp)
 1ce:	7b02                	ld	s6,32(sp)
 1d0:	6be2                	ld	s7,24(sp)
 1d2:	6c42                	ld	s8,16(sp)
 1d4:	6125                	addi	sp,sp,96
 1d6:	8082                	ret

00000000000001d8 <stat>:

int
stat(const char *n, struct stat *st)
{
 1d8:	1101                	addi	sp,sp,-32
 1da:	ec06                	sd	ra,24(sp)
 1dc:	e822                	sd	s0,16(sp)
 1de:	e426                	sd	s1,8(sp)
 1e0:	e04a                	sd	s2,0(sp)
 1e2:	1000                	addi	s0,sp,32
 1e4:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1e6:	4581                	li	a1,0
 1e8:	00000097          	auipc	ra,0x0
 1ec:	188080e7          	jalr	392(ra) # 370 <open>
  if(fd < 0)
 1f0:	02054563          	bltz	a0,21a <stat+0x42>
 1f4:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 1f6:	85ca                	mv	a1,s2
 1f8:	00000097          	auipc	ra,0x0
 1fc:	180080e7          	jalr	384(ra) # 378 <fstat>
 200:	892a                	mv	s2,a0
  close(fd);
 202:	8526                	mv	a0,s1
 204:	00000097          	auipc	ra,0x0
 208:	154080e7          	jalr	340(ra) # 358 <close>
  return r;
}
 20c:	854a                	mv	a0,s2
 20e:	60e2                	ld	ra,24(sp)
 210:	6442                	ld	s0,16(sp)
 212:	64a2                	ld	s1,8(sp)
 214:	6902                	ld	s2,0(sp)
 216:	6105                	addi	sp,sp,32
 218:	8082                	ret
    return -1;
 21a:	597d                	li	s2,-1
 21c:	bfc5                	j	20c <stat+0x34>

000000000000021e <atoi>:

int
atoi(const char *s)
{
 21e:	1141                	addi	sp,sp,-16
 220:	e422                	sd	s0,8(sp)
 222:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 224:	00054703          	lbu	a4,0(a0)
 228:	02d00793          	li	a5,45
  int neg = 1;
 22c:	4585                	li	a1,1
  if (*s == '-') {
 22e:	04f70363          	beq	a4,a5,274 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 232:	00054703          	lbu	a4,0(a0)
 236:	fd07079b          	addiw	a5,a4,-48
 23a:	0ff7f793          	zext.b	a5,a5
 23e:	46a5                	li	a3,9
 240:	02f6ed63          	bltu	a3,a5,27a <atoi+0x5c>
  n = 0;
 244:	4681                	li	a3,0
  while('0' <= *s && *s <= '9')
 246:	4625                	li	a2,9
    n = n*10 + *s++ - '0';
 248:	0505                	addi	a0,a0,1
 24a:	0026979b          	slliw	a5,a3,0x2
 24e:	9fb5                	addw	a5,a5,a3
 250:	0017979b          	slliw	a5,a5,0x1
 254:	9fb9                	addw	a5,a5,a4
 256:	fd07869b          	addiw	a3,a5,-48
  while('0' <= *s && *s <= '9')
 25a:	00054703          	lbu	a4,0(a0)
 25e:	fd07079b          	addiw	a5,a4,-48
 262:	0ff7f793          	zext.b	a5,a5
 266:	fef671e3          	bgeu	a2,a5,248 <atoi+0x2a>
  return n * neg;
}
 26a:	02d5853b          	mulw	a0,a1,a3
 26e:	6422                	ld	s0,8(sp)
 270:	0141                	addi	sp,sp,16
 272:	8082                	ret
    s++;
 274:	0505                	addi	a0,a0,1
    neg = -1;
 276:	55fd                	li	a1,-1
 278:	bf6d                	j	232 <atoi+0x14>
  n = 0;
 27a:	4681                	li	a3,0
 27c:	b7fd                	j	26a <atoi+0x4c>

000000000000027e <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 27e:	1141                	addi	sp,sp,-16
 280:	e422                	sd	s0,8(sp)
 282:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 284:	02b57463          	bgeu	a0,a1,2ac <memmove+0x2e>
    while(n-- > 0)
 288:	00c05f63          	blez	a2,2a6 <memmove+0x28>
 28c:	1602                	slli	a2,a2,0x20
 28e:	9201                	srli	a2,a2,0x20
 290:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 294:	872a                	mv	a4,a0
      *dst++ = *src++;
 296:	0585                	addi	a1,a1,1
 298:	0705                	addi	a4,a4,1
 29a:	fff5c683          	lbu	a3,-1(a1)
 29e:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 2a2:	fee79ae3          	bne	a5,a4,296 <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 2a6:	6422                	ld	s0,8(sp)
 2a8:	0141                	addi	sp,sp,16
 2aa:	8082                	ret
    dst += n;
 2ac:	00c50733          	add	a4,a0,a2
    src += n;
 2b0:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 2b2:	fec05ae3          	blez	a2,2a6 <memmove+0x28>
 2b6:	fff6079b          	addiw	a5,a2,-1
 2ba:	1782                	slli	a5,a5,0x20
 2bc:	9381                	srli	a5,a5,0x20
 2be:	fff7c793          	not	a5,a5
 2c2:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 2c4:	15fd                	addi	a1,a1,-1
 2c6:	177d                	addi	a4,a4,-1
 2c8:	0005c683          	lbu	a3,0(a1)
 2cc:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 2d0:	fee79ae3          	bne	a5,a4,2c4 <memmove+0x46>
 2d4:	bfc9                	j	2a6 <memmove+0x28>

00000000000002d6 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 2d6:	1141                	addi	sp,sp,-16
 2d8:	e422                	sd	s0,8(sp)
 2da:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 2dc:	ca05                	beqz	a2,30c <memcmp+0x36>
 2de:	fff6069b          	addiw	a3,a2,-1
 2e2:	1682                	slli	a3,a3,0x20
 2e4:	9281                	srli	a3,a3,0x20
 2e6:	0685                	addi	a3,a3,1
 2e8:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 2ea:	00054783          	lbu	a5,0(a0)
 2ee:	0005c703          	lbu	a4,0(a1)
 2f2:	00e79863          	bne	a5,a4,302 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 2f6:	0505                	addi	a0,a0,1
    p2++;
 2f8:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 2fa:	fed518e3          	bne	a0,a3,2ea <memcmp+0x14>
  }
  return 0;
 2fe:	4501                	li	a0,0
 300:	a019                	j	306 <memcmp+0x30>
      return *p1 - *p2;
 302:	40e7853b          	subw	a0,a5,a4
}
 306:	6422                	ld	s0,8(sp)
 308:	0141                	addi	sp,sp,16
 30a:	8082                	ret
  return 0;
 30c:	4501                	li	a0,0
 30e:	bfe5                	j	306 <memcmp+0x30>

0000000000000310 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 310:	1141                	addi	sp,sp,-16
 312:	e406                	sd	ra,8(sp)
 314:	e022                	sd	s0,0(sp)
 316:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 318:	00000097          	auipc	ra,0x0
 31c:	f66080e7          	jalr	-154(ra) # 27e <memmove>
}
 320:	60a2                	ld	ra,8(sp)
 322:	6402                	ld	s0,0(sp)
 324:	0141                	addi	sp,sp,16
 326:	8082                	ret

0000000000000328 <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 328:	4885                	li	a7,1
 ecall
 32a:	00000073          	ecall
 ret
 32e:	8082                	ret

0000000000000330 <exit>:
.global exit
exit:
 li a7, SYS_exit
 330:	4889                	li	a7,2
 ecall
 332:	00000073          	ecall
 ret
 336:	8082                	ret

0000000000000338 <wait>:
.global wait
wait:
 li a7, SYS_wait
 338:	488d                	li	a7,3
 ecall
 33a:	00000073          	ecall
 ret
 33e:	8082                	ret

0000000000000340 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 340:	4891                	li	a7,4
 ecall
 342:	00000073          	ecall
 ret
 346:	8082                	ret

0000000000000348 <read>:
.global read
read:
 li a7, SYS_read
 348:	4895                	li	a7,5
 ecall
 34a:	00000073          	ecall
 ret
 34e:	8082                	ret

0000000000000350 <write>:
.global write
write:
 li a7, SYS_write
 350:	48c1                	li	a7,16
 ecall
 352:	00000073          	ecall
 ret
 356:	8082                	ret

0000000000000358 <close>:
.global close
close:
 li a7, SYS_close
 358:	48d5                	li	a7,21
 ecall
 35a:	00000073          	ecall
 ret
 35e:	8082                	ret

0000000000000360 <kill>:
.global kill
kill:
 li a7, SYS_kill
 360:	4899                	li	a7,6
 ecall
 362:	00000073          	ecall
 ret
 366:	8082                	ret

0000000000000368 <exec>:
.global exec
exec:
 li a7, SYS_exec
 368:	489d                	li	a7,7
 ecall
 36a:	00000073          	ecall
 ret
 36e:	8082                	ret

0000000000000370 <open>:
.global open
open:
 li a7, SYS_open
 370:	48bd                	li	a7,15
 ecall
 372:	00000073          	ecall
 ret
 376:	8082                	ret

0000000000000378 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 378:	48a1                	li	a7,8
 ecall
 37a:	00000073          	ecall
 ret
 37e:	8082                	ret

0000000000000380 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 380:	48d1                	li	a7,20
 ecall
 382:	00000073          	ecall
 ret
 386:	8082                	ret

0000000000000388 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 388:	48a5                	li	a7,9
 ecall
 38a:	00000073          	ecall
 ret
 38e:	8082                	ret

0000000000000390 <dup>:
.global dup
dup:
 li a7, SYS_dup
 390:	48a9                	li	a7,10
 ecall
 392:	00000073          	ecall
 ret
 396:	8082                	ret

0000000000000398 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 398:	48ad                	li	a7,11
 ecall
 39a:	00000073          	ecall
 ret
 39e:	8082                	ret

00000000000003a0 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 3a0:	48b1                	li	a7,12
 ecall
 3a2:	00000073          	ecall
 ret
 3a6:	8082                	ret

00000000000003a8 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 3a8:	48b5                	li	a7,13
 ecall
 3aa:	00000073          	ecall
 ret
 3ae:	8082                	ret

00000000000003b0 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 3b0:	48b9                	li	a7,14
 ecall
 3b2:	00000073          	ecall
 ret
 3b6:	8082                	ret

00000000000003b8 <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 3b8:	48d9                	li	a7,22
 ecall
 3ba:	00000073          	ecall
 ret
 3be:	8082                	ret

00000000000003c0 <dev>:
.global dev
dev:
 li a7, SYS_dev
 3c0:	48dd                	li	a7,23
 ecall
 3c2:	00000073          	ecall
 ret
 3c6:	8082                	ret

00000000000003c8 <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 3c8:	48e1                	li	a7,24
 ecall
 3ca:	00000073          	ecall
 ret
 3ce:	8082                	ret

00000000000003d0 <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 3d0:	48e5                	li	a7,25
 ecall
 3d2:	00000073          	ecall
 ret
 3d6:	8082                	ret

00000000000003d8 <remove>:
.global remove
remove:
 li a7, SYS_remove
 3d8:	48c5                	li	a7,17
 ecall
 3da:	00000073          	ecall
 ret
 3de:	8082                	ret

00000000000003e0 <trace>:
.global trace
trace:
 li a7, SYS_trace
 3e0:	48c9                	li	a7,18
 ecall
 3e2:	00000073          	ecall
 ret
 3e6:	8082                	ret

00000000000003e8 <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 3e8:	48cd                	li	a7,19
 ecall
 3ea:	00000073          	ecall
 ret
 3ee:	8082                	ret

00000000000003f0 <rename>:
.global rename
rename:
 li a7, SYS_rename
 3f0:	48e9                	li	a7,26
 ecall
 3f2:	00000073          	ecall
 ret
 3f6:	8082                	ret

00000000000003f8 <poweroff>:
.global poweroff
poweroff:
 li a7, SYS_poweroff
 3f8:	0d200893          	li	a7,210
 ecall
 3fc:	00000073          	ecall
 ret
 400:	8082                	ret

0000000000000402 <mkdirat>:
.global mkdirat
mkdirat:
 li a7, SYS_mkdirat
 402:	02200893          	li	a7,34
 ecall
 406:	00000073          	ecall
 ret
 40a:	8082                	ret

000000000000040c <clone>:
.global clone
clone:
 li a7, SYS_clone
 40c:	0dc00893          	li	a7,220
 ecall
 410:	00000073          	ecall
 ret
 414:	8082                	ret

0000000000000416 <wait4>:
.global wait4
wait4:
 li a7, SYS_wait4
 416:	10400893          	li	a7,260
 ecall
 41a:	00000073          	ecall
 ret
 41e:	8082                	ret

0000000000000420 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 420:	1101                	addi	sp,sp,-32
 422:	ec06                	sd	ra,24(sp)
 424:	e822                	sd	s0,16(sp)
 426:	1000                	addi	s0,sp,32
 428:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 42c:	4605                	li	a2,1
 42e:	fef40593          	addi	a1,s0,-17
 432:	00000097          	auipc	ra,0x0
 436:	f1e080e7          	jalr	-226(ra) # 350 <write>
}
 43a:	60e2                	ld	ra,24(sp)
 43c:	6442                	ld	s0,16(sp)
 43e:	6105                	addi	sp,sp,32
 440:	8082                	ret

0000000000000442 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 442:	7139                	addi	sp,sp,-64
 444:	fc06                	sd	ra,56(sp)
 446:	f822                	sd	s0,48(sp)
 448:	f426                	sd	s1,40(sp)
 44a:	f04a                	sd	s2,32(sp)
 44c:	ec4e                	sd	s3,24(sp)
 44e:	0080                	addi	s0,sp,64
 450:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 452:	c299                	beqz	a3,458 <printint+0x16>
 454:	0805c863          	bltz	a1,4e4 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 458:	2581                	sext.w	a1,a1
  neg = 0;
 45a:	4881                	li	a7,0
  }

  i = 0;
 45c:	fc040993          	addi	s3,s0,-64
  neg = 0;
 460:	86ce                	mv	a3,s3
  i = 0;
 462:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 464:	2601                	sext.w	a2,a2
 466:	00000517          	auipc	a0,0x0
 46a:	4d250513          	addi	a0,a0,1234 # 938 <digits>
 46e:	883a                	mv	a6,a4
 470:	2705                	addiw	a4,a4,1
 472:	02c5f7bb          	remuw	a5,a1,a2
 476:	1782                	slli	a5,a5,0x20
 478:	9381                	srli	a5,a5,0x20
 47a:	97aa                	add	a5,a5,a0
 47c:	0007c783          	lbu	a5,0(a5)
 480:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 484:	0005879b          	sext.w	a5,a1
 488:	02c5d5bb          	divuw	a1,a1,a2
 48c:	0685                	addi	a3,a3,1
 48e:	fec7f0e3          	bgeu	a5,a2,46e <printint+0x2c>
  if(neg)
 492:	00088c63          	beqz	a7,4aa <printint+0x68>
    buf[i++] = '-';
 496:	fd070793          	addi	a5,a4,-48
 49a:	00878733          	add	a4,a5,s0
 49e:	02d00793          	li	a5,45
 4a2:	fef70823          	sb	a5,-16(a4)
 4a6:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 4aa:	02e05663          	blez	a4,4d6 <printint+0x94>
 4ae:	fc040913          	addi	s2,s0,-64
 4b2:	993a                	add	s2,s2,a4
 4b4:	19fd                	addi	s3,s3,-1
 4b6:	99ba                	add	s3,s3,a4
 4b8:	377d                	addiw	a4,a4,-1
 4ba:	1702                	slli	a4,a4,0x20
 4bc:	9301                	srli	a4,a4,0x20
 4be:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 4c2:	fff94583          	lbu	a1,-1(s2)
 4c6:	8526                	mv	a0,s1
 4c8:	00000097          	auipc	ra,0x0
 4cc:	f58080e7          	jalr	-168(ra) # 420 <putc>
  while(--i >= 0)
 4d0:	197d                	addi	s2,s2,-1
 4d2:	ff3918e3          	bne	s2,s3,4c2 <printint+0x80>
}
 4d6:	70e2                	ld	ra,56(sp)
 4d8:	7442                	ld	s0,48(sp)
 4da:	74a2                	ld	s1,40(sp)
 4dc:	7902                	ld	s2,32(sp)
 4de:	69e2                	ld	s3,24(sp)
 4e0:	6121                	addi	sp,sp,64
 4e2:	8082                	ret
    x = -xx;
 4e4:	40b005bb          	negw	a1,a1
    neg = 1;
 4e8:	4885                	li	a7,1
    x = -xx;
 4ea:	bf8d                	j	45c <printint+0x1a>

00000000000004ec <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 4ec:	7119                	addi	sp,sp,-128
 4ee:	fc86                	sd	ra,120(sp)
 4f0:	f8a2                	sd	s0,112(sp)
 4f2:	f4a6                	sd	s1,104(sp)
 4f4:	f0ca                	sd	s2,96(sp)
 4f6:	ecce                	sd	s3,88(sp)
 4f8:	e8d2                	sd	s4,80(sp)
 4fa:	e4d6                	sd	s5,72(sp)
 4fc:	e0da                	sd	s6,64(sp)
 4fe:	fc5e                	sd	s7,56(sp)
 500:	f862                	sd	s8,48(sp)
 502:	f466                	sd	s9,40(sp)
 504:	f06a                	sd	s10,32(sp)
 506:	ec6e                	sd	s11,24(sp)
 508:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 50a:	0005c903          	lbu	s2,0(a1)
 50e:	18090f63          	beqz	s2,6ac <vprintf+0x1c0>
 512:	8aaa                	mv	s5,a0
 514:	8b32                	mv	s6,a2
 516:	00158493          	addi	s1,a1,1
  state = 0;
 51a:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 51c:	02500a13          	li	s4,37
 520:	4c55                	li	s8,21
 522:	00000c97          	auipc	s9,0x0
 526:	3bec8c93          	addi	s9,s9,958 # 8e0 <malloc+0x130>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
        s = va_arg(ap, char*);
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 52a:	02800d93          	li	s11,40
  putc(fd, 'x');
 52e:	4d41                	li	s10,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 530:	00000b97          	auipc	s7,0x0
 534:	408b8b93          	addi	s7,s7,1032 # 938 <digits>
 538:	a839                	j	556 <vprintf+0x6a>
        putc(fd, c);
 53a:	85ca                	mv	a1,s2
 53c:	8556                	mv	a0,s5
 53e:	00000097          	auipc	ra,0x0
 542:	ee2080e7          	jalr	-286(ra) # 420 <putc>
 546:	a019                	j	54c <vprintf+0x60>
    } else if(state == '%'){
 548:	01498d63          	beq	s3,s4,562 <vprintf+0x76>
  for(i = 0; fmt[i]; i++){
 54c:	0485                	addi	s1,s1,1
 54e:	fff4c903          	lbu	s2,-1(s1)
 552:	14090d63          	beqz	s2,6ac <vprintf+0x1c0>
    if(state == 0){
 556:	fe0999e3          	bnez	s3,548 <vprintf+0x5c>
      if(c == '%'){
 55a:	ff4910e3          	bne	s2,s4,53a <vprintf+0x4e>
        state = '%';
 55e:	89d2                	mv	s3,s4
 560:	b7f5                	j	54c <vprintf+0x60>
      if(c == 'd'){
 562:	11490c63          	beq	s2,s4,67a <vprintf+0x18e>
 566:	f9d9079b          	addiw	a5,s2,-99
 56a:	0ff7f793          	zext.b	a5,a5
 56e:	10fc6e63          	bltu	s8,a5,68a <vprintf+0x19e>
 572:	f9d9079b          	addiw	a5,s2,-99
 576:	0ff7f713          	zext.b	a4,a5
 57a:	10ec6863          	bltu	s8,a4,68a <vprintf+0x19e>
 57e:	00271793          	slli	a5,a4,0x2
 582:	97e6                	add	a5,a5,s9
 584:	439c                	lw	a5,0(a5)
 586:	97e6                	add	a5,a5,s9
 588:	8782                	jr	a5
        printint(fd, va_arg(ap, int), 10, 1);
 58a:	008b0913          	addi	s2,s6,8
 58e:	4685                	li	a3,1
 590:	4629                	li	a2,10
 592:	000b2583          	lw	a1,0(s6)
 596:	8556                	mv	a0,s5
 598:	00000097          	auipc	ra,0x0
 59c:	eaa080e7          	jalr	-342(ra) # 442 <printint>
 5a0:	8b4a                	mv	s6,s2
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5a2:	4981                	li	s3,0
 5a4:	b765                	j	54c <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 5a6:	008b0913          	addi	s2,s6,8
 5aa:	4681                	li	a3,0
 5ac:	4629                	li	a2,10
 5ae:	000b2583          	lw	a1,0(s6)
 5b2:	8556                	mv	a0,s5
 5b4:	00000097          	auipc	ra,0x0
 5b8:	e8e080e7          	jalr	-370(ra) # 442 <printint>
 5bc:	8b4a                	mv	s6,s2
      state = 0;
 5be:	4981                	li	s3,0
 5c0:	b771                	j	54c <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 5c2:	008b0913          	addi	s2,s6,8
 5c6:	4681                	li	a3,0
 5c8:	866a                	mv	a2,s10
 5ca:	000b2583          	lw	a1,0(s6)
 5ce:	8556                	mv	a0,s5
 5d0:	00000097          	auipc	ra,0x0
 5d4:	e72080e7          	jalr	-398(ra) # 442 <printint>
 5d8:	8b4a                	mv	s6,s2
      state = 0;
 5da:	4981                	li	s3,0
 5dc:	bf85                	j	54c <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 5de:	008b0793          	addi	a5,s6,8
 5e2:	f8f43423          	sd	a5,-120(s0)
 5e6:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 5ea:	03000593          	li	a1,48
 5ee:	8556                	mv	a0,s5
 5f0:	00000097          	auipc	ra,0x0
 5f4:	e30080e7          	jalr	-464(ra) # 420 <putc>
  putc(fd, 'x');
 5f8:	07800593          	li	a1,120
 5fc:	8556                	mv	a0,s5
 5fe:	00000097          	auipc	ra,0x0
 602:	e22080e7          	jalr	-478(ra) # 420 <putc>
 606:	896a                	mv	s2,s10
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 608:	03c9d793          	srli	a5,s3,0x3c
 60c:	97de                	add	a5,a5,s7
 60e:	0007c583          	lbu	a1,0(a5)
 612:	8556                	mv	a0,s5
 614:	00000097          	auipc	ra,0x0
 618:	e0c080e7          	jalr	-500(ra) # 420 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 61c:	0992                	slli	s3,s3,0x4
 61e:	397d                	addiw	s2,s2,-1
 620:	fe0914e3          	bnez	s2,608 <vprintf+0x11c>
        printptr(fd, va_arg(ap, uint64));
 624:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 628:	4981                	li	s3,0
 62a:	b70d                	j	54c <vprintf+0x60>
        s = va_arg(ap, char*);
 62c:	008b0913          	addi	s2,s6,8
 630:	000b3983          	ld	s3,0(s6)
        if(s == 0)
 634:	02098163          	beqz	s3,656 <vprintf+0x16a>
        while(*s != 0){
 638:	0009c583          	lbu	a1,0(s3)
 63c:	c5ad                	beqz	a1,6a6 <vprintf+0x1ba>
          putc(fd, *s);
 63e:	8556                	mv	a0,s5
 640:	00000097          	auipc	ra,0x0
 644:	de0080e7          	jalr	-544(ra) # 420 <putc>
          s++;
 648:	0985                	addi	s3,s3,1
        while(*s != 0){
 64a:	0009c583          	lbu	a1,0(s3)
 64e:	f9e5                	bnez	a1,63e <vprintf+0x152>
        s = va_arg(ap, char*);
 650:	8b4a                	mv	s6,s2
      state = 0;
 652:	4981                	li	s3,0
 654:	bde5                	j	54c <vprintf+0x60>
          s = "(null)";
 656:	00000997          	auipc	s3,0x0
 65a:	28298993          	addi	s3,s3,642 # 8d8 <malloc+0x128>
        while(*s != 0){
 65e:	85ee                	mv	a1,s11
 660:	bff9                	j	63e <vprintf+0x152>
        putc(fd, va_arg(ap, uint));
 662:	008b0913          	addi	s2,s6,8
 666:	000b4583          	lbu	a1,0(s6)
 66a:	8556                	mv	a0,s5
 66c:	00000097          	auipc	ra,0x0
 670:	db4080e7          	jalr	-588(ra) # 420 <putc>
 674:	8b4a                	mv	s6,s2
      state = 0;
 676:	4981                	li	s3,0
 678:	bdd1                	j	54c <vprintf+0x60>
        putc(fd, c);
 67a:	85d2                	mv	a1,s4
 67c:	8556                	mv	a0,s5
 67e:	00000097          	auipc	ra,0x0
 682:	da2080e7          	jalr	-606(ra) # 420 <putc>
      state = 0;
 686:	4981                	li	s3,0
 688:	b5d1                	j	54c <vprintf+0x60>
        putc(fd, '%');
 68a:	85d2                	mv	a1,s4
 68c:	8556                	mv	a0,s5
 68e:	00000097          	auipc	ra,0x0
 692:	d92080e7          	jalr	-622(ra) # 420 <putc>
        putc(fd, c);
 696:	85ca                	mv	a1,s2
 698:	8556                	mv	a0,s5
 69a:	00000097          	auipc	ra,0x0
 69e:	d86080e7          	jalr	-634(ra) # 420 <putc>
      state = 0;
 6a2:	4981                	li	s3,0
 6a4:	b565                	j	54c <vprintf+0x60>
        s = va_arg(ap, char*);
 6a6:	8b4a                	mv	s6,s2
      state = 0;
 6a8:	4981                	li	s3,0
 6aa:	b54d                	j	54c <vprintf+0x60>
    }
  }
}
 6ac:	70e6                	ld	ra,120(sp)
 6ae:	7446                	ld	s0,112(sp)
 6b0:	74a6                	ld	s1,104(sp)
 6b2:	7906                	ld	s2,96(sp)
 6b4:	69e6                	ld	s3,88(sp)
 6b6:	6a46                	ld	s4,80(sp)
 6b8:	6aa6                	ld	s5,72(sp)
 6ba:	6b06                	ld	s6,64(sp)
 6bc:	7be2                	ld	s7,56(sp)
 6be:	7c42                	ld	s8,48(sp)
 6c0:	7ca2                	ld	s9,40(sp)
 6c2:	7d02                	ld	s10,32(sp)
 6c4:	6de2                	ld	s11,24(sp)
 6c6:	6109                	addi	sp,sp,128
 6c8:	8082                	ret

00000000000006ca <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 6ca:	715d                	addi	sp,sp,-80
 6cc:	ec06                	sd	ra,24(sp)
 6ce:	e822                	sd	s0,16(sp)
 6d0:	1000                	addi	s0,sp,32
 6d2:	e010                	sd	a2,0(s0)
 6d4:	e414                	sd	a3,8(s0)
 6d6:	e818                	sd	a4,16(s0)
 6d8:	ec1c                	sd	a5,24(s0)
 6da:	03043023          	sd	a6,32(s0)
 6de:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 6e2:	8622                	mv	a2,s0
 6e4:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 6e8:	00000097          	auipc	ra,0x0
 6ec:	e04080e7          	jalr	-508(ra) # 4ec <vprintf>
}
 6f0:	60e2                	ld	ra,24(sp)
 6f2:	6442                	ld	s0,16(sp)
 6f4:	6161                	addi	sp,sp,80
 6f6:	8082                	ret

00000000000006f8 <printf>:

void
printf(const char *fmt, ...)
{
 6f8:	711d                	addi	sp,sp,-96
 6fa:	ec06                	sd	ra,24(sp)
 6fc:	e822                	sd	s0,16(sp)
 6fe:	1000                	addi	s0,sp,32
 700:	e40c                	sd	a1,8(s0)
 702:	e810                	sd	a2,16(s0)
 704:	ec14                	sd	a3,24(s0)
 706:	f018                	sd	a4,32(s0)
 708:	f41c                	sd	a5,40(s0)
 70a:	03043823          	sd	a6,48(s0)
 70e:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 712:	00840613          	addi	a2,s0,8
 716:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 71a:	85aa                	mv	a1,a0
 71c:	4505                	li	a0,1
 71e:	00000097          	auipc	ra,0x0
 722:	dce080e7          	jalr	-562(ra) # 4ec <vprintf>
}
 726:	60e2                	ld	ra,24(sp)
 728:	6442                	ld	s0,16(sp)
 72a:	6125                	addi	sp,sp,96
 72c:	8082                	ret

000000000000072e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 72e:	1141                	addi	sp,sp,-16
 730:	e422                	sd	s0,8(sp)
 732:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 734:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 738:	00000797          	auipc	a5,0x0
 73c:	2187b783          	ld	a5,536(a5) # 950 <freep>
 740:	a02d                	j	76a <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 742:	4618                	lw	a4,8(a2)
 744:	9f2d                	addw	a4,a4,a1
 746:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 74a:	6398                	ld	a4,0(a5)
 74c:	6310                	ld	a2,0(a4)
 74e:	a83d                	j	78c <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 750:	ff852703          	lw	a4,-8(a0)
 754:	9f31                	addw	a4,a4,a2
 756:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 758:	ff053683          	ld	a3,-16(a0)
 75c:	a091                	j	7a0 <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 75e:	6398                	ld	a4,0(a5)
 760:	00e7e463          	bltu	a5,a4,768 <free+0x3a>
 764:	00e6ea63          	bltu	a3,a4,778 <free+0x4a>
{
 768:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 76a:	fed7fae3          	bgeu	a5,a3,75e <free+0x30>
 76e:	6398                	ld	a4,0(a5)
 770:	00e6e463          	bltu	a3,a4,778 <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 774:	fee7eae3          	bltu	a5,a4,768 <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
 778:	ff852583          	lw	a1,-8(a0)
 77c:	6390                	ld	a2,0(a5)
 77e:	02059813          	slli	a6,a1,0x20
 782:	01c85713          	srli	a4,a6,0x1c
 786:	9736                	add	a4,a4,a3
 788:	fae60de3          	beq	a2,a4,742 <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
 78c:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 790:	4790                	lw	a2,8(a5)
 792:	02061593          	slli	a1,a2,0x20
 796:	01c5d713          	srli	a4,a1,0x1c
 79a:	973e                	add	a4,a4,a5
 79c:	fae68ae3          	beq	a3,a4,750 <free+0x22>
    p->s.ptr = bp->s.ptr;
 7a0:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 7a2:	00000717          	auipc	a4,0x0
 7a6:	1af73723          	sd	a5,430(a4) # 950 <freep>
}
 7aa:	6422                	ld	s0,8(sp)
 7ac:	0141                	addi	sp,sp,16
 7ae:	8082                	ret

00000000000007b0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7b0:	7139                	addi	sp,sp,-64
 7b2:	fc06                	sd	ra,56(sp)
 7b4:	f822                	sd	s0,48(sp)
 7b6:	f426                	sd	s1,40(sp)
 7b8:	f04a                	sd	s2,32(sp)
 7ba:	ec4e                	sd	s3,24(sp)
 7bc:	e852                	sd	s4,16(sp)
 7be:	e456                	sd	s5,8(sp)
 7c0:	e05a                	sd	s6,0(sp)
 7c2:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7c4:	02051493          	slli	s1,a0,0x20
 7c8:	9081                	srli	s1,s1,0x20
 7ca:	04bd                	addi	s1,s1,15
 7cc:	8091                	srli	s1,s1,0x4
 7ce:	00148a1b          	addiw	s4,s1,1
 7d2:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 7d4:	00000517          	auipc	a0,0x0
 7d8:	17c53503          	ld	a0,380(a0) # 950 <freep>
 7dc:	c515                	beqz	a0,808 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7de:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 7e0:	4798                	lw	a4,8(a5)
 7e2:	04977163          	bgeu	a4,s1,824 <malloc+0x74>
 7e6:	89d2                	mv	s3,s4
 7e8:	000a071b          	sext.w	a4,s4
 7ec:	6685                	lui	a3,0x1
 7ee:	00d77363          	bgeu	a4,a3,7f4 <malloc+0x44>
 7f2:	6985                	lui	s3,0x1
 7f4:	00098b1b          	sext.w	s6,s3
  p = sbrk(nu * sizeof(Header));
 7f8:	0049999b          	slliw	s3,s3,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7fc:	00000917          	auipc	s2,0x0
 800:	15490913          	addi	s2,s2,340 # 950 <freep>
  if(p == (char*)-1)
 804:	5afd                	li	s5,-1
 806:	a8a5                	j	87e <malloc+0xce>
    base.s.ptr = freep = prevp = &base;
 808:	00000797          	auipc	a5,0x0
 80c:	14878793          	addi	a5,a5,328 # 950 <freep>
 810:	00000717          	auipc	a4,0x0
 814:	14870713          	addi	a4,a4,328 # 958 <base>
 818:	e398                	sd	a4,0(a5)
 81a:	e798                	sd	a4,8(a5)
    base.s.size = 0;
 81c:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 820:	87ba                	mv	a5,a4
 822:	b7d1                	j	7e6 <malloc+0x36>
      if(p->s.size == nunits)
 824:	02e48c63          	beq	s1,a4,85c <malloc+0xac>
        p->s.size -= nunits;
 828:	4147073b          	subw	a4,a4,s4
 82c:	c798                	sw	a4,8(a5)
        p += p->s.size;
 82e:	02071693          	slli	a3,a4,0x20
 832:	01c6d713          	srli	a4,a3,0x1c
 836:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 838:	0147a423          	sw	s4,8(a5)
      freep = prevp;
 83c:	00000717          	auipc	a4,0x0
 840:	10a73a23          	sd	a0,276(a4) # 950 <freep>
      return (void*)(p + 1);
 844:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 848:	70e2                	ld	ra,56(sp)
 84a:	7442                	ld	s0,48(sp)
 84c:	74a2                	ld	s1,40(sp)
 84e:	7902                	ld	s2,32(sp)
 850:	69e2                	ld	s3,24(sp)
 852:	6a42                	ld	s4,16(sp)
 854:	6aa2                	ld	s5,8(sp)
 856:	6b02                	ld	s6,0(sp)
 858:	6121                	addi	sp,sp,64
 85a:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 85c:	6398                	ld	a4,0(a5)
 85e:	e118                	sd	a4,0(a0)
 860:	bff1                	j	83c <malloc+0x8c>
  hp->s.size = nu;
 862:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 866:	0541                	addi	a0,a0,16
 868:	00000097          	auipc	ra,0x0
 86c:	ec6080e7          	jalr	-314(ra) # 72e <free>
  return freep;
 870:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 874:	d971                	beqz	a0,848 <malloc+0x98>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 876:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 878:	4798                	lw	a4,8(a5)
 87a:	fa9775e3          	bgeu	a4,s1,824 <malloc+0x74>
    if(p == freep)
 87e:	00093703          	ld	a4,0(s2)
 882:	853e                	mv	a0,a5
 884:	fef719e3          	bne	a4,a5,876 <malloc+0xc6>
  p = sbrk(nu * sizeof(Header));
 888:	854e                	mv	a0,s3
 88a:	00000097          	auipc	ra,0x0
 88e:	b16080e7          	jalr	-1258(ra) # 3a0 <sbrk>
  if(p == (char*)-1)
 892:	fd5518e3          	bne	a0,s5,862 <malloc+0xb2>
        return 0;
 896:	4501                	li	a0,0
 898:	bf45                	j	848 <malloc+0x98>
