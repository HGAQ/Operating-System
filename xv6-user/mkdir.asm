
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
  42:	83a58593          	addi	a1,a1,-1990 # 878 <malloc+0xf0>
  46:	4509                	li	a0,2
  48:	00000097          	auipc	ra,0x0
  4c:	65a080e7          	jalr	1626(ra) # 6a2 <fprintf>
    exit(1);
  50:	4505                	li	a0,1
  52:	00000097          	auipc	ra,0x0
  56:	2de080e7          	jalr	734(ra) # 330 <exit>
      fprintf(2, "mkdir: %s failed to create\n", argv[i]);
  5a:	6090                	ld	a2,0(s1)
  5c:	00001597          	auipc	a1,0x1
  60:	83458593          	addi	a1,a1,-1996 # 890 <malloc+0x108>
  64:	4509                	li	a0,2
  66:	00000097          	auipc	ra,0x0
  6a:	63c080e7          	jalr	1596(ra) # 6a2 <fprintf>
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

00000000000003f8 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 3f8:	1101                	addi	sp,sp,-32
 3fa:	ec06                	sd	ra,24(sp)
 3fc:	e822                	sd	s0,16(sp)
 3fe:	1000                	addi	s0,sp,32
 400:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 404:	4605                	li	a2,1
 406:	fef40593          	addi	a1,s0,-17
 40a:	00000097          	auipc	ra,0x0
 40e:	f46080e7          	jalr	-186(ra) # 350 <write>
}
 412:	60e2                	ld	ra,24(sp)
 414:	6442                	ld	s0,16(sp)
 416:	6105                	addi	sp,sp,32
 418:	8082                	ret

000000000000041a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 41a:	7139                	addi	sp,sp,-64
 41c:	fc06                	sd	ra,56(sp)
 41e:	f822                	sd	s0,48(sp)
 420:	f426                	sd	s1,40(sp)
 422:	f04a                	sd	s2,32(sp)
 424:	ec4e                	sd	s3,24(sp)
 426:	0080                	addi	s0,sp,64
 428:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 42a:	c299                	beqz	a3,430 <printint+0x16>
 42c:	0805c863          	bltz	a1,4bc <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 430:	2581                	sext.w	a1,a1
  neg = 0;
 432:	4881                	li	a7,0
  }

  i = 0;
 434:	fc040993          	addi	s3,s0,-64
  neg = 0;
 438:	86ce                	mv	a3,s3
  i = 0;
 43a:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 43c:	2601                	sext.w	a2,a2
 43e:	00000517          	auipc	a0,0x0
 442:	4d250513          	addi	a0,a0,1234 # 910 <digits>
 446:	883a                	mv	a6,a4
 448:	2705                	addiw	a4,a4,1
 44a:	02c5f7bb          	remuw	a5,a1,a2
 44e:	1782                	slli	a5,a5,0x20
 450:	9381                	srli	a5,a5,0x20
 452:	97aa                	add	a5,a5,a0
 454:	0007c783          	lbu	a5,0(a5)
 458:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 45c:	0005879b          	sext.w	a5,a1
 460:	02c5d5bb          	divuw	a1,a1,a2
 464:	0685                	addi	a3,a3,1
 466:	fec7f0e3          	bgeu	a5,a2,446 <printint+0x2c>
  if(neg)
 46a:	00088c63          	beqz	a7,482 <printint+0x68>
    buf[i++] = '-';
 46e:	fd070793          	addi	a5,a4,-48
 472:	00878733          	add	a4,a5,s0
 476:	02d00793          	li	a5,45
 47a:	fef70823          	sb	a5,-16(a4)
 47e:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 482:	02e05663          	blez	a4,4ae <printint+0x94>
 486:	fc040913          	addi	s2,s0,-64
 48a:	993a                	add	s2,s2,a4
 48c:	19fd                	addi	s3,s3,-1
 48e:	99ba                	add	s3,s3,a4
 490:	377d                	addiw	a4,a4,-1
 492:	1702                	slli	a4,a4,0x20
 494:	9301                	srli	a4,a4,0x20
 496:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 49a:	fff94583          	lbu	a1,-1(s2)
 49e:	8526                	mv	a0,s1
 4a0:	00000097          	auipc	ra,0x0
 4a4:	f58080e7          	jalr	-168(ra) # 3f8 <putc>
  while(--i >= 0)
 4a8:	197d                	addi	s2,s2,-1
 4aa:	ff3918e3          	bne	s2,s3,49a <printint+0x80>
}
 4ae:	70e2                	ld	ra,56(sp)
 4b0:	7442                	ld	s0,48(sp)
 4b2:	74a2                	ld	s1,40(sp)
 4b4:	7902                	ld	s2,32(sp)
 4b6:	69e2                	ld	s3,24(sp)
 4b8:	6121                	addi	sp,sp,64
 4ba:	8082                	ret
    x = -xx;
 4bc:	40b005bb          	negw	a1,a1
    neg = 1;
 4c0:	4885                	li	a7,1
    x = -xx;
 4c2:	bf8d                	j	434 <printint+0x1a>

00000000000004c4 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 4c4:	7119                	addi	sp,sp,-128
 4c6:	fc86                	sd	ra,120(sp)
 4c8:	f8a2                	sd	s0,112(sp)
 4ca:	f4a6                	sd	s1,104(sp)
 4cc:	f0ca                	sd	s2,96(sp)
 4ce:	ecce                	sd	s3,88(sp)
 4d0:	e8d2                	sd	s4,80(sp)
 4d2:	e4d6                	sd	s5,72(sp)
 4d4:	e0da                	sd	s6,64(sp)
 4d6:	fc5e                	sd	s7,56(sp)
 4d8:	f862                	sd	s8,48(sp)
 4da:	f466                	sd	s9,40(sp)
 4dc:	f06a                	sd	s10,32(sp)
 4de:	ec6e                	sd	s11,24(sp)
 4e0:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 4e2:	0005c903          	lbu	s2,0(a1)
 4e6:	18090f63          	beqz	s2,684 <vprintf+0x1c0>
 4ea:	8aaa                	mv	s5,a0
 4ec:	8b32                	mv	s6,a2
 4ee:	00158493          	addi	s1,a1,1
  state = 0;
 4f2:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 4f4:	02500a13          	li	s4,37
 4f8:	4c55                	li	s8,21
 4fa:	00000c97          	auipc	s9,0x0
 4fe:	3bec8c93          	addi	s9,s9,958 # 8b8 <malloc+0x130>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
        s = va_arg(ap, char*);
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 502:	02800d93          	li	s11,40
  putc(fd, 'x');
 506:	4d41                	li	s10,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 508:	00000b97          	auipc	s7,0x0
 50c:	408b8b93          	addi	s7,s7,1032 # 910 <digits>
 510:	a839                	j	52e <vprintf+0x6a>
        putc(fd, c);
 512:	85ca                	mv	a1,s2
 514:	8556                	mv	a0,s5
 516:	00000097          	auipc	ra,0x0
 51a:	ee2080e7          	jalr	-286(ra) # 3f8 <putc>
 51e:	a019                	j	524 <vprintf+0x60>
    } else if(state == '%'){
 520:	01498d63          	beq	s3,s4,53a <vprintf+0x76>
  for(i = 0; fmt[i]; i++){
 524:	0485                	addi	s1,s1,1
 526:	fff4c903          	lbu	s2,-1(s1)
 52a:	14090d63          	beqz	s2,684 <vprintf+0x1c0>
    if(state == 0){
 52e:	fe0999e3          	bnez	s3,520 <vprintf+0x5c>
      if(c == '%'){
 532:	ff4910e3          	bne	s2,s4,512 <vprintf+0x4e>
        state = '%';
 536:	89d2                	mv	s3,s4
 538:	b7f5                	j	524 <vprintf+0x60>
      if(c == 'd'){
 53a:	11490c63          	beq	s2,s4,652 <vprintf+0x18e>
 53e:	f9d9079b          	addiw	a5,s2,-99
 542:	0ff7f793          	zext.b	a5,a5
 546:	10fc6e63          	bltu	s8,a5,662 <vprintf+0x19e>
 54a:	f9d9079b          	addiw	a5,s2,-99
 54e:	0ff7f713          	zext.b	a4,a5
 552:	10ec6863          	bltu	s8,a4,662 <vprintf+0x19e>
 556:	00271793          	slli	a5,a4,0x2
 55a:	97e6                	add	a5,a5,s9
 55c:	439c                	lw	a5,0(a5)
 55e:	97e6                	add	a5,a5,s9
 560:	8782                	jr	a5
        printint(fd, va_arg(ap, int), 10, 1);
 562:	008b0913          	addi	s2,s6,8
 566:	4685                	li	a3,1
 568:	4629                	li	a2,10
 56a:	000b2583          	lw	a1,0(s6)
 56e:	8556                	mv	a0,s5
 570:	00000097          	auipc	ra,0x0
 574:	eaa080e7          	jalr	-342(ra) # 41a <printint>
 578:	8b4a                	mv	s6,s2
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 57a:	4981                	li	s3,0
 57c:	b765                	j	524 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 57e:	008b0913          	addi	s2,s6,8
 582:	4681                	li	a3,0
 584:	4629                	li	a2,10
 586:	000b2583          	lw	a1,0(s6)
 58a:	8556                	mv	a0,s5
 58c:	00000097          	auipc	ra,0x0
 590:	e8e080e7          	jalr	-370(ra) # 41a <printint>
 594:	8b4a                	mv	s6,s2
      state = 0;
 596:	4981                	li	s3,0
 598:	b771                	j	524 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 59a:	008b0913          	addi	s2,s6,8
 59e:	4681                	li	a3,0
 5a0:	866a                	mv	a2,s10
 5a2:	000b2583          	lw	a1,0(s6)
 5a6:	8556                	mv	a0,s5
 5a8:	00000097          	auipc	ra,0x0
 5ac:	e72080e7          	jalr	-398(ra) # 41a <printint>
 5b0:	8b4a                	mv	s6,s2
      state = 0;
 5b2:	4981                	li	s3,0
 5b4:	bf85                	j	524 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 5b6:	008b0793          	addi	a5,s6,8
 5ba:	f8f43423          	sd	a5,-120(s0)
 5be:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 5c2:	03000593          	li	a1,48
 5c6:	8556                	mv	a0,s5
 5c8:	00000097          	auipc	ra,0x0
 5cc:	e30080e7          	jalr	-464(ra) # 3f8 <putc>
  putc(fd, 'x');
 5d0:	07800593          	li	a1,120
 5d4:	8556                	mv	a0,s5
 5d6:	00000097          	auipc	ra,0x0
 5da:	e22080e7          	jalr	-478(ra) # 3f8 <putc>
 5de:	896a                	mv	s2,s10
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 5e0:	03c9d793          	srli	a5,s3,0x3c
 5e4:	97de                	add	a5,a5,s7
 5e6:	0007c583          	lbu	a1,0(a5)
 5ea:	8556                	mv	a0,s5
 5ec:	00000097          	auipc	ra,0x0
 5f0:	e0c080e7          	jalr	-500(ra) # 3f8 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 5f4:	0992                	slli	s3,s3,0x4
 5f6:	397d                	addiw	s2,s2,-1
 5f8:	fe0914e3          	bnez	s2,5e0 <vprintf+0x11c>
        printptr(fd, va_arg(ap, uint64));
 5fc:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 600:	4981                	li	s3,0
 602:	b70d                	j	524 <vprintf+0x60>
        s = va_arg(ap, char*);
 604:	008b0913          	addi	s2,s6,8
 608:	000b3983          	ld	s3,0(s6)
        if(s == 0)
 60c:	02098163          	beqz	s3,62e <vprintf+0x16a>
        while(*s != 0){
 610:	0009c583          	lbu	a1,0(s3)
 614:	c5ad                	beqz	a1,67e <vprintf+0x1ba>
          putc(fd, *s);
 616:	8556                	mv	a0,s5
 618:	00000097          	auipc	ra,0x0
 61c:	de0080e7          	jalr	-544(ra) # 3f8 <putc>
          s++;
 620:	0985                	addi	s3,s3,1
        while(*s != 0){
 622:	0009c583          	lbu	a1,0(s3)
 626:	f9e5                	bnez	a1,616 <vprintf+0x152>
        s = va_arg(ap, char*);
 628:	8b4a                	mv	s6,s2
      state = 0;
 62a:	4981                	li	s3,0
 62c:	bde5                	j	524 <vprintf+0x60>
          s = "(null)";
 62e:	00000997          	auipc	s3,0x0
 632:	28298993          	addi	s3,s3,642 # 8b0 <malloc+0x128>
        while(*s != 0){
 636:	85ee                	mv	a1,s11
 638:	bff9                	j	616 <vprintf+0x152>
        putc(fd, va_arg(ap, uint));
 63a:	008b0913          	addi	s2,s6,8
 63e:	000b4583          	lbu	a1,0(s6)
 642:	8556                	mv	a0,s5
 644:	00000097          	auipc	ra,0x0
 648:	db4080e7          	jalr	-588(ra) # 3f8 <putc>
 64c:	8b4a                	mv	s6,s2
      state = 0;
 64e:	4981                	li	s3,0
 650:	bdd1                	j	524 <vprintf+0x60>
        putc(fd, c);
 652:	85d2                	mv	a1,s4
 654:	8556                	mv	a0,s5
 656:	00000097          	auipc	ra,0x0
 65a:	da2080e7          	jalr	-606(ra) # 3f8 <putc>
      state = 0;
 65e:	4981                	li	s3,0
 660:	b5d1                	j	524 <vprintf+0x60>
        putc(fd, '%');
 662:	85d2                	mv	a1,s4
 664:	8556                	mv	a0,s5
 666:	00000097          	auipc	ra,0x0
 66a:	d92080e7          	jalr	-622(ra) # 3f8 <putc>
        putc(fd, c);
 66e:	85ca                	mv	a1,s2
 670:	8556                	mv	a0,s5
 672:	00000097          	auipc	ra,0x0
 676:	d86080e7          	jalr	-634(ra) # 3f8 <putc>
      state = 0;
 67a:	4981                	li	s3,0
 67c:	b565                	j	524 <vprintf+0x60>
        s = va_arg(ap, char*);
 67e:	8b4a                	mv	s6,s2
      state = 0;
 680:	4981                	li	s3,0
 682:	b54d                	j	524 <vprintf+0x60>
    }
  }
}
 684:	70e6                	ld	ra,120(sp)
 686:	7446                	ld	s0,112(sp)
 688:	74a6                	ld	s1,104(sp)
 68a:	7906                	ld	s2,96(sp)
 68c:	69e6                	ld	s3,88(sp)
 68e:	6a46                	ld	s4,80(sp)
 690:	6aa6                	ld	s5,72(sp)
 692:	6b06                	ld	s6,64(sp)
 694:	7be2                	ld	s7,56(sp)
 696:	7c42                	ld	s8,48(sp)
 698:	7ca2                	ld	s9,40(sp)
 69a:	7d02                	ld	s10,32(sp)
 69c:	6de2                	ld	s11,24(sp)
 69e:	6109                	addi	sp,sp,128
 6a0:	8082                	ret

00000000000006a2 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 6a2:	715d                	addi	sp,sp,-80
 6a4:	ec06                	sd	ra,24(sp)
 6a6:	e822                	sd	s0,16(sp)
 6a8:	1000                	addi	s0,sp,32
 6aa:	e010                	sd	a2,0(s0)
 6ac:	e414                	sd	a3,8(s0)
 6ae:	e818                	sd	a4,16(s0)
 6b0:	ec1c                	sd	a5,24(s0)
 6b2:	03043023          	sd	a6,32(s0)
 6b6:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 6ba:	8622                	mv	a2,s0
 6bc:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 6c0:	00000097          	auipc	ra,0x0
 6c4:	e04080e7          	jalr	-508(ra) # 4c4 <vprintf>
}
 6c8:	60e2                	ld	ra,24(sp)
 6ca:	6442                	ld	s0,16(sp)
 6cc:	6161                	addi	sp,sp,80
 6ce:	8082                	ret

00000000000006d0 <printf>:

void
printf(const char *fmt, ...)
{
 6d0:	711d                	addi	sp,sp,-96
 6d2:	ec06                	sd	ra,24(sp)
 6d4:	e822                	sd	s0,16(sp)
 6d6:	1000                	addi	s0,sp,32
 6d8:	e40c                	sd	a1,8(s0)
 6da:	e810                	sd	a2,16(s0)
 6dc:	ec14                	sd	a3,24(s0)
 6de:	f018                	sd	a4,32(s0)
 6e0:	f41c                	sd	a5,40(s0)
 6e2:	03043823          	sd	a6,48(s0)
 6e6:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 6ea:	00840613          	addi	a2,s0,8
 6ee:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 6f2:	85aa                	mv	a1,a0
 6f4:	4505                	li	a0,1
 6f6:	00000097          	auipc	ra,0x0
 6fa:	dce080e7          	jalr	-562(ra) # 4c4 <vprintf>
}
 6fe:	60e2                	ld	ra,24(sp)
 700:	6442                	ld	s0,16(sp)
 702:	6125                	addi	sp,sp,96
 704:	8082                	ret

0000000000000706 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 706:	1141                	addi	sp,sp,-16
 708:	e422                	sd	s0,8(sp)
 70a:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 70c:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 710:	00000797          	auipc	a5,0x0
 714:	2187b783          	ld	a5,536(a5) # 928 <freep>
 718:	a02d                	j	742 <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 71a:	4618                	lw	a4,8(a2)
 71c:	9f2d                	addw	a4,a4,a1
 71e:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 722:	6398                	ld	a4,0(a5)
 724:	6310                	ld	a2,0(a4)
 726:	a83d                	j	764 <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 728:	ff852703          	lw	a4,-8(a0)
 72c:	9f31                	addw	a4,a4,a2
 72e:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 730:	ff053683          	ld	a3,-16(a0)
 734:	a091                	j	778 <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 736:	6398                	ld	a4,0(a5)
 738:	00e7e463          	bltu	a5,a4,740 <free+0x3a>
 73c:	00e6ea63          	bltu	a3,a4,750 <free+0x4a>
{
 740:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 742:	fed7fae3          	bgeu	a5,a3,736 <free+0x30>
 746:	6398                	ld	a4,0(a5)
 748:	00e6e463          	bltu	a3,a4,750 <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 74c:	fee7eae3          	bltu	a5,a4,740 <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
 750:	ff852583          	lw	a1,-8(a0)
 754:	6390                	ld	a2,0(a5)
 756:	02059813          	slli	a6,a1,0x20
 75a:	01c85713          	srli	a4,a6,0x1c
 75e:	9736                	add	a4,a4,a3
 760:	fae60de3          	beq	a2,a4,71a <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
 764:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 768:	4790                	lw	a2,8(a5)
 76a:	02061593          	slli	a1,a2,0x20
 76e:	01c5d713          	srli	a4,a1,0x1c
 772:	973e                	add	a4,a4,a5
 774:	fae68ae3          	beq	a3,a4,728 <free+0x22>
    p->s.ptr = bp->s.ptr;
 778:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 77a:	00000717          	auipc	a4,0x0
 77e:	1af73723          	sd	a5,430(a4) # 928 <freep>
}
 782:	6422                	ld	s0,8(sp)
 784:	0141                	addi	sp,sp,16
 786:	8082                	ret

0000000000000788 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 788:	7139                	addi	sp,sp,-64
 78a:	fc06                	sd	ra,56(sp)
 78c:	f822                	sd	s0,48(sp)
 78e:	f426                	sd	s1,40(sp)
 790:	f04a                	sd	s2,32(sp)
 792:	ec4e                	sd	s3,24(sp)
 794:	e852                	sd	s4,16(sp)
 796:	e456                	sd	s5,8(sp)
 798:	e05a                	sd	s6,0(sp)
 79a:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 79c:	02051493          	slli	s1,a0,0x20
 7a0:	9081                	srli	s1,s1,0x20
 7a2:	04bd                	addi	s1,s1,15
 7a4:	8091                	srli	s1,s1,0x4
 7a6:	00148a1b          	addiw	s4,s1,1
 7aa:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 7ac:	00000517          	auipc	a0,0x0
 7b0:	17c53503          	ld	a0,380(a0) # 928 <freep>
 7b4:	c515                	beqz	a0,7e0 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7b6:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 7b8:	4798                	lw	a4,8(a5)
 7ba:	04977163          	bgeu	a4,s1,7fc <malloc+0x74>
 7be:	89d2                	mv	s3,s4
 7c0:	000a071b          	sext.w	a4,s4
 7c4:	6685                	lui	a3,0x1
 7c6:	00d77363          	bgeu	a4,a3,7cc <malloc+0x44>
 7ca:	6985                	lui	s3,0x1
 7cc:	00098b1b          	sext.w	s6,s3
  p = sbrk(nu * sizeof(Header));
 7d0:	0049999b          	slliw	s3,s3,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7d4:	00000917          	auipc	s2,0x0
 7d8:	15490913          	addi	s2,s2,340 # 928 <freep>
  if(p == (char*)-1)
 7dc:	5afd                	li	s5,-1
 7de:	a8a5                	j	856 <malloc+0xce>
    base.s.ptr = freep = prevp = &base;
 7e0:	00000797          	auipc	a5,0x0
 7e4:	14878793          	addi	a5,a5,328 # 928 <freep>
 7e8:	00000717          	auipc	a4,0x0
 7ec:	14870713          	addi	a4,a4,328 # 930 <base>
 7f0:	e398                	sd	a4,0(a5)
 7f2:	e798                	sd	a4,8(a5)
    base.s.size = 0;
 7f4:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7f8:	87ba                	mv	a5,a4
 7fa:	b7d1                	j	7be <malloc+0x36>
      if(p->s.size == nunits)
 7fc:	02e48c63          	beq	s1,a4,834 <malloc+0xac>
        p->s.size -= nunits;
 800:	4147073b          	subw	a4,a4,s4
 804:	c798                	sw	a4,8(a5)
        p += p->s.size;
 806:	02071693          	slli	a3,a4,0x20
 80a:	01c6d713          	srli	a4,a3,0x1c
 80e:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 810:	0147a423          	sw	s4,8(a5)
      freep = prevp;
 814:	00000717          	auipc	a4,0x0
 818:	10a73a23          	sd	a0,276(a4) # 928 <freep>
      return (void*)(p + 1);
 81c:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 820:	70e2                	ld	ra,56(sp)
 822:	7442                	ld	s0,48(sp)
 824:	74a2                	ld	s1,40(sp)
 826:	7902                	ld	s2,32(sp)
 828:	69e2                	ld	s3,24(sp)
 82a:	6a42                	ld	s4,16(sp)
 82c:	6aa2                	ld	s5,8(sp)
 82e:	6b02                	ld	s6,0(sp)
 830:	6121                	addi	sp,sp,64
 832:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 834:	6398                	ld	a4,0(a5)
 836:	e118                	sd	a4,0(a0)
 838:	bff1                	j	814 <malloc+0x8c>
  hp->s.size = nu;
 83a:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 83e:	0541                	addi	a0,a0,16
 840:	00000097          	auipc	ra,0x0
 844:	ec6080e7          	jalr	-314(ra) # 706 <free>
  return freep;
 848:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 84c:	d971                	beqz	a0,820 <malloc+0x98>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 84e:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 850:	4798                	lw	a4,8(a5)
 852:	fa9775e3          	bgeu	a4,s1,7fc <malloc+0x74>
    if(p == freep)
 856:	00093703          	ld	a4,0(s2)
 85a:	853e                	mv	a0,a5
 85c:	fef719e3          	bne	a4,a5,84e <malloc+0xc6>
  p = sbrk(nu * sizeof(Header));
 860:	854e                	mv	a0,s3
 862:	00000097          	auipc	ra,0x0
 866:	b3e080e7          	jalr	-1218(ra) # 3a0 <sbrk>
  if(p == (char*)-1)
 86a:	fd5518e3          	bne	a0,s5,83a <malloc+0xb2>
        return 0;
 86e:	4501                	li	a0,0
 870:	bf45                	j	820 <malloc+0x98>
