
xv6-user/_kill:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/include/stat.h"
#include "xv6-user/user.h"

int
main(int argc, char **argv)
{
   0:	1101                	addi	sp,sp,-32
   2:	ec06                	sd	ra,24(sp)
   4:	e822                	sd	s0,16(sp)
   6:	e426                	sd	s1,8(sp)
   8:	e04a                	sd	s2,0(sp)
   a:	1000                	addi	s0,sp,32
  int i;

  if(argc < 2){
   c:	4785                	li	a5,1
   e:	02a7dd63          	bge	a5,a0,48 <main+0x48>
  12:	00858493          	addi	s1,a1,8
  16:	ffe5091b          	addiw	s2,a0,-2
  1a:	02091793          	slli	a5,s2,0x20
  1e:	01d7d913          	srli	s2,a5,0x1d
  22:	05c1                	addi	a1,a1,16
  24:	992e                	add	s2,s2,a1
    fprintf(2, "usage: kill pid...\n");
    exit(1);
  }
  for(i=1; i<argc; i++)
    kill(atoi(argv[i]));
  26:	6088                	ld	a0,0(s1)
  28:	00000097          	auipc	ra,0x0
  2c:	1e2080e7          	jalr	482(ra) # 20a <atoi>
  30:	00000097          	auipc	ra,0x0
  34:	31c080e7          	jalr	796(ra) # 34c <kill>
  for(i=1; i<argc; i++)
  38:	04a1                	addi	s1,s1,8
  3a:	ff2496e3          	bne	s1,s2,26 <main+0x26>
  exit(0);
  3e:	4501                	li	a0,0
  40:	00000097          	auipc	ra,0x0
  44:	2dc080e7          	jalr	732(ra) # 31c <exit>
    fprintf(2, "usage: kill pid...\n");
  48:	00001597          	auipc	a1,0x1
  4c:	82058593          	addi	a1,a1,-2016 # 868 <malloc+0xea>
  50:	4509                	li	a0,2
  52:	00000097          	auipc	ra,0x0
  56:	646080e7          	jalr	1606(ra) # 698 <fprintf>
    exit(1);
  5a:	4505                	li	a0,1
  5c:	00000097          	auipc	ra,0x0
  60:	2c0080e7          	jalr	704(ra) # 31c <exit>

0000000000000064 <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
  64:	1141                	addi	sp,sp,-16
  66:	e422                	sd	s0,8(sp)
  68:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  6a:	87aa                	mv	a5,a0
  6c:	0585                	addi	a1,a1,1
  6e:	0785                	addi	a5,a5,1
  70:	fff5c703          	lbu	a4,-1(a1)
  74:	fee78fa3          	sb	a4,-1(a5)
  78:	fb75                	bnez	a4,6c <strcpy+0x8>
    ;
  return os;
}
  7a:	6422                	ld	s0,8(sp)
  7c:	0141                	addi	sp,sp,16
  7e:	8082                	ret

0000000000000080 <strcat>:

char*
strcat(char *s, const char *t)
{
  80:	1141                	addi	sp,sp,-16
  82:	e422                	sd	s0,8(sp)
  84:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
  86:	00054783          	lbu	a5,0(a0)
  8a:	c385                	beqz	a5,aa <strcat+0x2a>
  8c:	87aa                	mv	a5,a0
    s++;
  8e:	0785                	addi	a5,a5,1
  while(*s)
  90:	0007c703          	lbu	a4,0(a5)
  94:	ff6d                	bnez	a4,8e <strcat+0xe>
  while((*s++ = *t++))
  96:	0585                	addi	a1,a1,1
  98:	0785                	addi	a5,a5,1
  9a:	fff5c703          	lbu	a4,-1(a1)
  9e:	fee78fa3          	sb	a4,-1(a5)
  a2:	fb75                	bnez	a4,96 <strcat+0x16>
    ;
  return os;
}
  a4:	6422                	ld	s0,8(sp)
  a6:	0141                	addi	sp,sp,16
  a8:	8082                	ret
  while(*s)
  aa:	87aa                	mv	a5,a0
  ac:	b7ed                	j	96 <strcat+0x16>

00000000000000ae <strcmp>:


int
strcmp(const char *p, const char *q)
{
  ae:	1141                	addi	sp,sp,-16
  b0:	e422                	sd	s0,8(sp)
  b2:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
  b4:	00054783          	lbu	a5,0(a0)
  b8:	cb91                	beqz	a5,cc <strcmp+0x1e>
  ba:	0005c703          	lbu	a4,0(a1)
  be:	00f71763          	bne	a4,a5,cc <strcmp+0x1e>
    p++, q++;
  c2:	0505                	addi	a0,a0,1
  c4:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
  c6:	00054783          	lbu	a5,0(a0)
  ca:	fbe5                	bnez	a5,ba <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
  cc:	0005c503          	lbu	a0,0(a1)
}
  d0:	40a7853b          	subw	a0,a5,a0
  d4:	6422                	ld	s0,8(sp)
  d6:	0141                	addi	sp,sp,16
  d8:	8082                	ret

00000000000000da <strlen>:

uint
strlen(const char *s)
{
  da:	1141                	addi	sp,sp,-16
  dc:	e422                	sd	s0,8(sp)
  de:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
  e0:	00054783          	lbu	a5,0(a0)
  e4:	cf91                	beqz	a5,100 <strlen+0x26>
  e6:	0505                	addi	a0,a0,1
  e8:	87aa                	mv	a5,a0
  ea:	4685                	li	a3,1
  ec:	9e89                	subw	a3,a3,a0
  ee:	00f6853b          	addw	a0,a3,a5
  f2:	0785                	addi	a5,a5,1
  f4:	fff7c703          	lbu	a4,-1(a5)
  f8:	fb7d                	bnez	a4,ee <strlen+0x14>
    ;
  return n;
}
  fa:	6422                	ld	s0,8(sp)
  fc:	0141                	addi	sp,sp,16
  fe:	8082                	ret
  for(n = 0; s[n]; n++)
 100:	4501                	li	a0,0
 102:	bfe5                	j	fa <strlen+0x20>

0000000000000104 <memset>:

void*
memset(void *dst, int c, uint n)
{
 104:	1141                	addi	sp,sp,-16
 106:	e422                	sd	s0,8(sp)
 108:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 10a:	ca19                	beqz	a2,120 <memset+0x1c>
 10c:	87aa                	mv	a5,a0
 10e:	1602                	slli	a2,a2,0x20
 110:	9201                	srli	a2,a2,0x20
 112:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 116:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 11a:	0785                	addi	a5,a5,1
 11c:	fee79de3          	bne	a5,a4,116 <memset+0x12>
  }
  return dst;
}
 120:	6422                	ld	s0,8(sp)
 122:	0141                	addi	sp,sp,16
 124:	8082                	ret

0000000000000126 <strchr>:

char*
strchr(const char *s, char c)
{
 126:	1141                	addi	sp,sp,-16
 128:	e422                	sd	s0,8(sp)
 12a:	0800                	addi	s0,sp,16
  for(; *s; s++)
 12c:	00054783          	lbu	a5,0(a0)
 130:	cb99                	beqz	a5,146 <strchr+0x20>
    if(*s == c)
 132:	00f58763          	beq	a1,a5,140 <strchr+0x1a>
  for(; *s; s++)
 136:	0505                	addi	a0,a0,1
 138:	00054783          	lbu	a5,0(a0)
 13c:	fbfd                	bnez	a5,132 <strchr+0xc>
      return (char*)s;
  return 0;
 13e:	4501                	li	a0,0
}
 140:	6422                	ld	s0,8(sp)
 142:	0141                	addi	sp,sp,16
 144:	8082                	ret
  return 0;
 146:	4501                	li	a0,0
 148:	bfe5                	j	140 <strchr+0x1a>

000000000000014a <gets>:

char*
gets(char *buf, int max)
{
 14a:	711d                	addi	sp,sp,-96
 14c:	ec86                	sd	ra,88(sp)
 14e:	e8a2                	sd	s0,80(sp)
 150:	e4a6                	sd	s1,72(sp)
 152:	e0ca                	sd	s2,64(sp)
 154:	fc4e                	sd	s3,56(sp)
 156:	f852                	sd	s4,48(sp)
 158:	f456                	sd	s5,40(sp)
 15a:	f05a                	sd	s6,32(sp)
 15c:	ec5e                	sd	s7,24(sp)
 15e:	e862                	sd	s8,16(sp)
 160:	1080                	addi	s0,sp,96
 162:	8baa                	mv	s7,a0
 164:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 166:	892a                	mv	s2,a0
 168:	4481                	li	s1,0
    cc = read(0, &c, 1);
 16a:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 16e:	4b29                	li	s6,10
 170:	4c35                	li	s8,13
  for(i=0; i+1 < max; ){
 172:	89a6                	mv	s3,s1
 174:	2485                	addiw	s1,s1,1
 176:	0344d763          	bge	s1,s4,1a4 <gets+0x5a>
    cc = read(0, &c, 1);
 17a:	4605                	li	a2,1
 17c:	85d6                	mv	a1,s5
 17e:	4501                	li	a0,0
 180:	00000097          	auipc	ra,0x0
 184:	1b4080e7          	jalr	436(ra) # 334 <read>
    if(cc < 1)
 188:	00a05e63          	blez	a0,1a4 <gets+0x5a>
    buf[i++] = c;
 18c:	faf44783          	lbu	a5,-81(s0)
 190:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 194:	01678763          	beq	a5,s6,1a2 <gets+0x58>
 198:	0905                	addi	s2,s2,1
 19a:	fd879ce3          	bne	a5,s8,172 <gets+0x28>
  for(i=0; i+1 < max; ){
 19e:	89a6                	mv	s3,s1
 1a0:	a011                	j	1a4 <gets+0x5a>
 1a2:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 1a4:	99de                	add	s3,s3,s7
 1a6:	00098023          	sb	zero,0(s3)
  return buf;
}
 1aa:	855e                	mv	a0,s7
 1ac:	60e6                	ld	ra,88(sp)
 1ae:	6446                	ld	s0,80(sp)
 1b0:	64a6                	ld	s1,72(sp)
 1b2:	6906                	ld	s2,64(sp)
 1b4:	79e2                	ld	s3,56(sp)
 1b6:	7a42                	ld	s4,48(sp)
 1b8:	7aa2                	ld	s5,40(sp)
 1ba:	7b02                	ld	s6,32(sp)
 1bc:	6be2                	ld	s7,24(sp)
 1be:	6c42                	ld	s8,16(sp)
 1c0:	6125                	addi	sp,sp,96
 1c2:	8082                	ret

00000000000001c4 <stat>:

int
stat(const char *n, struct stat *st)
{
 1c4:	1101                	addi	sp,sp,-32
 1c6:	ec06                	sd	ra,24(sp)
 1c8:	e822                	sd	s0,16(sp)
 1ca:	e426                	sd	s1,8(sp)
 1cc:	e04a                	sd	s2,0(sp)
 1ce:	1000                	addi	s0,sp,32
 1d0:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1d2:	4581                	li	a1,0
 1d4:	00000097          	auipc	ra,0x0
 1d8:	188080e7          	jalr	392(ra) # 35c <open>
  if(fd < 0)
 1dc:	02054563          	bltz	a0,206 <stat+0x42>
 1e0:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 1e2:	85ca                	mv	a1,s2
 1e4:	00000097          	auipc	ra,0x0
 1e8:	180080e7          	jalr	384(ra) # 364 <fstat>
 1ec:	892a                	mv	s2,a0
  close(fd);
 1ee:	8526                	mv	a0,s1
 1f0:	00000097          	auipc	ra,0x0
 1f4:	154080e7          	jalr	340(ra) # 344 <close>
  return r;
}
 1f8:	854a                	mv	a0,s2
 1fa:	60e2                	ld	ra,24(sp)
 1fc:	6442                	ld	s0,16(sp)
 1fe:	64a2                	ld	s1,8(sp)
 200:	6902                	ld	s2,0(sp)
 202:	6105                	addi	sp,sp,32
 204:	8082                	ret
    return -1;
 206:	597d                	li	s2,-1
 208:	bfc5                	j	1f8 <stat+0x34>

000000000000020a <atoi>:

int
atoi(const char *s)
{
 20a:	1141                	addi	sp,sp,-16
 20c:	e422                	sd	s0,8(sp)
 20e:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 210:	00054703          	lbu	a4,0(a0)
 214:	02d00793          	li	a5,45
  int neg = 1;
 218:	4585                	li	a1,1
  if (*s == '-') {
 21a:	04f70363          	beq	a4,a5,260 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 21e:	00054703          	lbu	a4,0(a0)
 222:	fd07079b          	addiw	a5,a4,-48
 226:	0ff7f793          	zext.b	a5,a5
 22a:	46a5                	li	a3,9
 22c:	02f6ed63          	bltu	a3,a5,266 <atoi+0x5c>
  n = 0;
 230:	4681                	li	a3,0
  while('0' <= *s && *s <= '9')
 232:	4625                	li	a2,9
    n = n*10 + *s++ - '0';
 234:	0505                	addi	a0,a0,1
 236:	0026979b          	slliw	a5,a3,0x2
 23a:	9fb5                	addw	a5,a5,a3
 23c:	0017979b          	slliw	a5,a5,0x1
 240:	9fb9                	addw	a5,a5,a4
 242:	fd07869b          	addiw	a3,a5,-48
  while('0' <= *s && *s <= '9')
 246:	00054703          	lbu	a4,0(a0)
 24a:	fd07079b          	addiw	a5,a4,-48
 24e:	0ff7f793          	zext.b	a5,a5
 252:	fef671e3          	bgeu	a2,a5,234 <atoi+0x2a>
  return n * neg;
}
 256:	02d5853b          	mulw	a0,a1,a3
 25a:	6422                	ld	s0,8(sp)
 25c:	0141                	addi	sp,sp,16
 25e:	8082                	ret
    s++;
 260:	0505                	addi	a0,a0,1
    neg = -1;
 262:	55fd                	li	a1,-1
 264:	bf6d                	j	21e <atoi+0x14>
  n = 0;
 266:	4681                	li	a3,0
 268:	b7fd                	j	256 <atoi+0x4c>

000000000000026a <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 26a:	1141                	addi	sp,sp,-16
 26c:	e422                	sd	s0,8(sp)
 26e:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 270:	02b57463          	bgeu	a0,a1,298 <memmove+0x2e>
    while(n-- > 0)
 274:	00c05f63          	blez	a2,292 <memmove+0x28>
 278:	1602                	slli	a2,a2,0x20
 27a:	9201                	srli	a2,a2,0x20
 27c:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 280:	872a                	mv	a4,a0
      *dst++ = *src++;
 282:	0585                	addi	a1,a1,1
 284:	0705                	addi	a4,a4,1
 286:	fff5c683          	lbu	a3,-1(a1)
 28a:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 28e:	fee79ae3          	bne	a5,a4,282 <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 292:	6422                	ld	s0,8(sp)
 294:	0141                	addi	sp,sp,16
 296:	8082                	ret
    dst += n;
 298:	00c50733          	add	a4,a0,a2
    src += n;
 29c:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 29e:	fec05ae3          	blez	a2,292 <memmove+0x28>
 2a2:	fff6079b          	addiw	a5,a2,-1
 2a6:	1782                	slli	a5,a5,0x20
 2a8:	9381                	srli	a5,a5,0x20
 2aa:	fff7c793          	not	a5,a5
 2ae:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 2b0:	15fd                	addi	a1,a1,-1
 2b2:	177d                	addi	a4,a4,-1
 2b4:	0005c683          	lbu	a3,0(a1)
 2b8:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 2bc:	fee79ae3          	bne	a5,a4,2b0 <memmove+0x46>
 2c0:	bfc9                	j	292 <memmove+0x28>

00000000000002c2 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 2c2:	1141                	addi	sp,sp,-16
 2c4:	e422                	sd	s0,8(sp)
 2c6:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 2c8:	ca05                	beqz	a2,2f8 <memcmp+0x36>
 2ca:	fff6069b          	addiw	a3,a2,-1
 2ce:	1682                	slli	a3,a3,0x20
 2d0:	9281                	srli	a3,a3,0x20
 2d2:	0685                	addi	a3,a3,1
 2d4:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 2d6:	00054783          	lbu	a5,0(a0)
 2da:	0005c703          	lbu	a4,0(a1)
 2de:	00e79863          	bne	a5,a4,2ee <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 2e2:	0505                	addi	a0,a0,1
    p2++;
 2e4:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 2e6:	fed518e3          	bne	a0,a3,2d6 <memcmp+0x14>
  }
  return 0;
 2ea:	4501                	li	a0,0
 2ec:	a019                	j	2f2 <memcmp+0x30>
      return *p1 - *p2;
 2ee:	40e7853b          	subw	a0,a5,a4
}
 2f2:	6422                	ld	s0,8(sp)
 2f4:	0141                	addi	sp,sp,16
 2f6:	8082                	ret
  return 0;
 2f8:	4501                	li	a0,0
 2fa:	bfe5                	j	2f2 <memcmp+0x30>

00000000000002fc <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 2fc:	1141                	addi	sp,sp,-16
 2fe:	e406                	sd	ra,8(sp)
 300:	e022                	sd	s0,0(sp)
 302:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 304:	00000097          	auipc	ra,0x0
 308:	f66080e7          	jalr	-154(ra) # 26a <memmove>
}
 30c:	60a2                	ld	ra,8(sp)
 30e:	6402                	ld	s0,0(sp)
 310:	0141                	addi	sp,sp,16
 312:	8082                	ret

0000000000000314 <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 314:	4885                	li	a7,1
 ecall
 316:	00000073          	ecall
 ret
 31a:	8082                	ret

000000000000031c <exit>:
.global exit
exit:
 li a7, SYS_exit
 31c:	4889                	li	a7,2
 ecall
 31e:	00000073          	ecall
 ret
 322:	8082                	ret

0000000000000324 <wait>:
.global wait
wait:
 li a7, SYS_wait
 324:	488d                	li	a7,3
 ecall
 326:	00000073          	ecall
 ret
 32a:	8082                	ret

000000000000032c <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 32c:	4891                	li	a7,4
 ecall
 32e:	00000073          	ecall
 ret
 332:	8082                	ret

0000000000000334 <read>:
.global read
read:
 li a7, SYS_read
 334:	4895                	li	a7,5
 ecall
 336:	00000073          	ecall
 ret
 33a:	8082                	ret

000000000000033c <write>:
.global write
write:
 li a7, SYS_write
 33c:	48c1                	li	a7,16
 ecall
 33e:	00000073          	ecall
 ret
 342:	8082                	ret

0000000000000344 <close>:
.global close
close:
 li a7, SYS_close
 344:	48d5                	li	a7,21
 ecall
 346:	00000073          	ecall
 ret
 34a:	8082                	ret

000000000000034c <kill>:
.global kill
kill:
 li a7, SYS_kill
 34c:	4899                	li	a7,6
 ecall
 34e:	00000073          	ecall
 ret
 352:	8082                	ret

0000000000000354 <exec>:
.global exec
exec:
 li a7, SYS_exec
 354:	489d                	li	a7,7
 ecall
 356:	00000073          	ecall
 ret
 35a:	8082                	ret

000000000000035c <open>:
.global open
open:
 li a7, SYS_open
 35c:	48bd                	li	a7,15
 ecall
 35e:	00000073          	ecall
 ret
 362:	8082                	ret

0000000000000364 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 364:	48a1                	li	a7,8
 ecall
 366:	00000073          	ecall
 ret
 36a:	8082                	ret

000000000000036c <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 36c:	48d1                	li	a7,20
 ecall
 36e:	00000073          	ecall
 ret
 372:	8082                	ret

0000000000000374 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 374:	48a5                	li	a7,9
 ecall
 376:	00000073          	ecall
 ret
 37a:	8082                	ret

000000000000037c <dup>:
.global dup
dup:
 li a7, SYS_dup
 37c:	48a9                	li	a7,10
 ecall
 37e:	00000073          	ecall
 ret
 382:	8082                	ret

0000000000000384 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 384:	48ad                	li	a7,11
 ecall
 386:	00000073          	ecall
 ret
 38a:	8082                	ret

000000000000038c <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 38c:	48b1                	li	a7,12
 ecall
 38e:	00000073          	ecall
 ret
 392:	8082                	ret

0000000000000394 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 394:	48b5                	li	a7,13
 ecall
 396:	00000073          	ecall
 ret
 39a:	8082                	ret

000000000000039c <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 39c:	48b9                	li	a7,14
 ecall
 39e:	00000073          	ecall
 ret
 3a2:	8082                	ret

00000000000003a4 <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 3a4:	48d9                	li	a7,22
 ecall
 3a6:	00000073          	ecall
 ret
 3aa:	8082                	ret

00000000000003ac <dev>:
.global dev
dev:
 li a7, SYS_dev
 3ac:	48dd                	li	a7,23
 ecall
 3ae:	00000073          	ecall
 ret
 3b2:	8082                	ret

00000000000003b4 <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 3b4:	48e1                	li	a7,24
 ecall
 3b6:	00000073          	ecall
 ret
 3ba:	8082                	ret

00000000000003bc <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 3bc:	48e5                	li	a7,25
 ecall
 3be:	00000073          	ecall
 ret
 3c2:	8082                	ret

00000000000003c4 <remove>:
.global remove
remove:
 li a7, SYS_remove
 3c4:	48c5                	li	a7,17
 ecall
 3c6:	00000073          	ecall
 ret
 3ca:	8082                	ret

00000000000003cc <trace>:
.global trace
trace:
 li a7, SYS_trace
 3cc:	48c9                	li	a7,18
 ecall
 3ce:	00000073          	ecall
 ret
 3d2:	8082                	ret

00000000000003d4 <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 3d4:	48cd                	li	a7,19
 ecall
 3d6:	00000073          	ecall
 ret
 3da:	8082                	ret

00000000000003dc <rename>:
.global rename
rename:
 li a7, SYS_rename
 3dc:	48e9                	li	a7,26
 ecall
 3de:	00000073          	ecall
 ret
 3e2:	8082                	ret

00000000000003e4 <poweroff>:
.global poweroff
poweroff:
 li a7, SYS_poweroff
 3e4:	0d200893          	li	a7,210
 ecall
 3e8:	00000073          	ecall
 ret
 3ec:	8082                	ret

00000000000003ee <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 3ee:	1101                	addi	sp,sp,-32
 3f0:	ec06                	sd	ra,24(sp)
 3f2:	e822                	sd	s0,16(sp)
 3f4:	1000                	addi	s0,sp,32
 3f6:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 3fa:	4605                	li	a2,1
 3fc:	fef40593          	addi	a1,s0,-17
 400:	00000097          	auipc	ra,0x0
 404:	f3c080e7          	jalr	-196(ra) # 33c <write>
}
 408:	60e2                	ld	ra,24(sp)
 40a:	6442                	ld	s0,16(sp)
 40c:	6105                	addi	sp,sp,32
 40e:	8082                	ret

0000000000000410 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 410:	7139                	addi	sp,sp,-64
 412:	fc06                	sd	ra,56(sp)
 414:	f822                	sd	s0,48(sp)
 416:	f426                	sd	s1,40(sp)
 418:	f04a                	sd	s2,32(sp)
 41a:	ec4e                	sd	s3,24(sp)
 41c:	0080                	addi	s0,sp,64
 41e:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 420:	c299                	beqz	a3,426 <printint+0x16>
 422:	0805c863          	bltz	a1,4b2 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 426:	2581                	sext.w	a1,a1
  neg = 0;
 428:	4881                	li	a7,0
  }

  i = 0;
 42a:	fc040993          	addi	s3,s0,-64
  neg = 0;
 42e:	86ce                	mv	a3,s3
  i = 0;
 430:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 432:	2601                	sext.w	a2,a2
 434:	00000517          	auipc	a0,0x0
 438:	4ac50513          	addi	a0,a0,1196 # 8e0 <digits>
 43c:	883a                	mv	a6,a4
 43e:	2705                	addiw	a4,a4,1
 440:	02c5f7bb          	remuw	a5,a1,a2
 444:	1782                	slli	a5,a5,0x20
 446:	9381                	srli	a5,a5,0x20
 448:	97aa                	add	a5,a5,a0
 44a:	0007c783          	lbu	a5,0(a5)
 44e:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 452:	0005879b          	sext.w	a5,a1
 456:	02c5d5bb          	divuw	a1,a1,a2
 45a:	0685                	addi	a3,a3,1
 45c:	fec7f0e3          	bgeu	a5,a2,43c <printint+0x2c>
  if(neg)
 460:	00088c63          	beqz	a7,478 <printint+0x68>
    buf[i++] = '-';
 464:	fd070793          	addi	a5,a4,-48
 468:	00878733          	add	a4,a5,s0
 46c:	02d00793          	li	a5,45
 470:	fef70823          	sb	a5,-16(a4)
 474:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 478:	02e05663          	blez	a4,4a4 <printint+0x94>
 47c:	fc040913          	addi	s2,s0,-64
 480:	993a                	add	s2,s2,a4
 482:	19fd                	addi	s3,s3,-1
 484:	99ba                	add	s3,s3,a4
 486:	377d                	addiw	a4,a4,-1
 488:	1702                	slli	a4,a4,0x20
 48a:	9301                	srli	a4,a4,0x20
 48c:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 490:	fff94583          	lbu	a1,-1(s2)
 494:	8526                	mv	a0,s1
 496:	00000097          	auipc	ra,0x0
 49a:	f58080e7          	jalr	-168(ra) # 3ee <putc>
  while(--i >= 0)
 49e:	197d                	addi	s2,s2,-1
 4a0:	ff3918e3          	bne	s2,s3,490 <printint+0x80>
}
 4a4:	70e2                	ld	ra,56(sp)
 4a6:	7442                	ld	s0,48(sp)
 4a8:	74a2                	ld	s1,40(sp)
 4aa:	7902                	ld	s2,32(sp)
 4ac:	69e2                	ld	s3,24(sp)
 4ae:	6121                	addi	sp,sp,64
 4b0:	8082                	ret
    x = -xx;
 4b2:	40b005bb          	negw	a1,a1
    neg = 1;
 4b6:	4885                	li	a7,1
    x = -xx;
 4b8:	bf8d                	j	42a <printint+0x1a>

00000000000004ba <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 4ba:	7119                	addi	sp,sp,-128
 4bc:	fc86                	sd	ra,120(sp)
 4be:	f8a2                	sd	s0,112(sp)
 4c0:	f4a6                	sd	s1,104(sp)
 4c2:	f0ca                	sd	s2,96(sp)
 4c4:	ecce                	sd	s3,88(sp)
 4c6:	e8d2                	sd	s4,80(sp)
 4c8:	e4d6                	sd	s5,72(sp)
 4ca:	e0da                	sd	s6,64(sp)
 4cc:	fc5e                	sd	s7,56(sp)
 4ce:	f862                	sd	s8,48(sp)
 4d0:	f466                	sd	s9,40(sp)
 4d2:	f06a                	sd	s10,32(sp)
 4d4:	ec6e                	sd	s11,24(sp)
 4d6:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 4d8:	0005c903          	lbu	s2,0(a1)
 4dc:	18090f63          	beqz	s2,67a <vprintf+0x1c0>
 4e0:	8aaa                	mv	s5,a0
 4e2:	8b32                	mv	s6,a2
 4e4:	00158493          	addi	s1,a1,1
  state = 0;
 4e8:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 4ea:	02500a13          	li	s4,37
 4ee:	4c55                	li	s8,21
 4f0:	00000c97          	auipc	s9,0x0
 4f4:	398c8c93          	addi	s9,s9,920 # 888 <malloc+0x10a>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
        s = va_arg(ap, char*);
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 4f8:	02800d93          	li	s11,40
  putc(fd, 'x');
 4fc:	4d41                	li	s10,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 4fe:	00000b97          	auipc	s7,0x0
 502:	3e2b8b93          	addi	s7,s7,994 # 8e0 <digits>
 506:	a839                	j	524 <vprintf+0x6a>
        putc(fd, c);
 508:	85ca                	mv	a1,s2
 50a:	8556                	mv	a0,s5
 50c:	00000097          	auipc	ra,0x0
 510:	ee2080e7          	jalr	-286(ra) # 3ee <putc>
 514:	a019                	j	51a <vprintf+0x60>
    } else if(state == '%'){
 516:	01498d63          	beq	s3,s4,530 <vprintf+0x76>
  for(i = 0; fmt[i]; i++){
 51a:	0485                	addi	s1,s1,1
 51c:	fff4c903          	lbu	s2,-1(s1)
 520:	14090d63          	beqz	s2,67a <vprintf+0x1c0>
    if(state == 0){
 524:	fe0999e3          	bnez	s3,516 <vprintf+0x5c>
      if(c == '%'){
 528:	ff4910e3          	bne	s2,s4,508 <vprintf+0x4e>
        state = '%';
 52c:	89d2                	mv	s3,s4
 52e:	b7f5                	j	51a <vprintf+0x60>
      if(c == 'd'){
 530:	11490c63          	beq	s2,s4,648 <vprintf+0x18e>
 534:	f9d9079b          	addiw	a5,s2,-99
 538:	0ff7f793          	zext.b	a5,a5
 53c:	10fc6e63          	bltu	s8,a5,658 <vprintf+0x19e>
 540:	f9d9079b          	addiw	a5,s2,-99
 544:	0ff7f713          	zext.b	a4,a5
 548:	10ec6863          	bltu	s8,a4,658 <vprintf+0x19e>
 54c:	00271793          	slli	a5,a4,0x2
 550:	97e6                	add	a5,a5,s9
 552:	439c                	lw	a5,0(a5)
 554:	97e6                	add	a5,a5,s9
 556:	8782                	jr	a5
        printint(fd, va_arg(ap, int), 10, 1);
 558:	008b0913          	addi	s2,s6,8
 55c:	4685                	li	a3,1
 55e:	4629                	li	a2,10
 560:	000b2583          	lw	a1,0(s6)
 564:	8556                	mv	a0,s5
 566:	00000097          	auipc	ra,0x0
 56a:	eaa080e7          	jalr	-342(ra) # 410 <printint>
 56e:	8b4a                	mv	s6,s2
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 570:	4981                	li	s3,0
 572:	b765                	j	51a <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 574:	008b0913          	addi	s2,s6,8
 578:	4681                	li	a3,0
 57a:	4629                	li	a2,10
 57c:	000b2583          	lw	a1,0(s6)
 580:	8556                	mv	a0,s5
 582:	00000097          	auipc	ra,0x0
 586:	e8e080e7          	jalr	-370(ra) # 410 <printint>
 58a:	8b4a                	mv	s6,s2
      state = 0;
 58c:	4981                	li	s3,0
 58e:	b771                	j	51a <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 590:	008b0913          	addi	s2,s6,8
 594:	4681                	li	a3,0
 596:	866a                	mv	a2,s10
 598:	000b2583          	lw	a1,0(s6)
 59c:	8556                	mv	a0,s5
 59e:	00000097          	auipc	ra,0x0
 5a2:	e72080e7          	jalr	-398(ra) # 410 <printint>
 5a6:	8b4a                	mv	s6,s2
      state = 0;
 5a8:	4981                	li	s3,0
 5aa:	bf85                	j	51a <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 5ac:	008b0793          	addi	a5,s6,8
 5b0:	f8f43423          	sd	a5,-120(s0)
 5b4:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 5b8:	03000593          	li	a1,48
 5bc:	8556                	mv	a0,s5
 5be:	00000097          	auipc	ra,0x0
 5c2:	e30080e7          	jalr	-464(ra) # 3ee <putc>
  putc(fd, 'x');
 5c6:	07800593          	li	a1,120
 5ca:	8556                	mv	a0,s5
 5cc:	00000097          	auipc	ra,0x0
 5d0:	e22080e7          	jalr	-478(ra) # 3ee <putc>
 5d4:	896a                	mv	s2,s10
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 5d6:	03c9d793          	srli	a5,s3,0x3c
 5da:	97de                	add	a5,a5,s7
 5dc:	0007c583          	lbu	a1,0(a5)
 5e0:	8556                	mv	a0,s5
 5e2:	00000097          	auipc	ra,0x0
 5e6:	e0c080e7          	jalr	-500(ra) # 3ee <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 5ea:	0992                	slli	s3,s3,0x4
 5ec:	397d                	addiw	s2,s2,-1
 5ee:	fe0914e3          	bnez	s2,5d6 <vprintf+0x11c>
        printptr(fd, va_arg(ap, uint64));
 5f2:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 5f6:	4981                	li	s3,0
 5f8:	b70d                	j	51a <vprintf+0x60>
        s = va_arg(ap, char*);
 5fa:	008b0913          	addi	s2,s6,8
 5fe:	000b3983          	ld	s3,0(s6)
        if(s == 0)
 602:	02098163          	beqz	s3,624 <vprintf+0x16a>
        while(*s != 0){
 606:	0009c583          	lbu	a1,0(s3)
 60a:	c5ad                	beqz	a1,674 <vprintf+0x1ba>
          putc(fd, *s);
 60c:	8556                	mv	a0,s5
 60e:	00000097          	auipc	ra,0x0
 612:	de0080e7          	jalr	-544(ra) # 3ee <putc>
          s++;
 616:	0985                	addi	s3,s3,1
        while(*s != 0){
 618:	0009c583          	lbu	a1,0(s3)
 61c:	f9e5                	bnez	a1,60c <vprintf+0x152>
        s = va_arg(ap, char*);
 61e:	8b4a                	mv	s6,s2
      state = 0;
 620:	4981                	li	s3,0
 622:	bde5                	j	51a <vprintf+0x60>
          s = "(null)";
 624:	00000997          	auipc	s3,0x0
 628:	25c98993          	addi	s3,s3,604 # 880 <malloc+0x102>
        while(*s != 0){
 62c:	85ee                	mv	a1,s11
 62e:	bff9                	j	60c <vprintf+0x152>
        putc(fd, va_arg(ap, uint));
 630:	008b0913          	addi	s2,s6,8
 634:	000b4583          	lbu	a1,0(s6)
 638:	8556                	mv	a0,s5
 63a:	00000097          	auipc	ra,0x0
 63e:	db4080e7          	jalr	-588(ra) # 3ee <putc>
 642:	8b4a                	mv	s6,s2
      state = 0;
 644:	4981                	li	s3,0
 646:	bdd1                	j	51a <vprintf+0x60>
        putc(fd, c);
 648:	85d2                	mv	a1,s4
 64a:	8556                	mv	a0,s5
 64c:	00000097          	auipc	ra,0x0
 650:	da2080e7          	jalr	-606(ra) # 3ee <putc>
      state = 0;
 654:	4981                	li	s3,0
 656:	b5d1                	j	51a <vprintf+0x60>
        putc(fd, '%');
 658:	85d2                	mv	a1,s4
 65a:	8556                	mv	a0,s5
 65c:	00000097          	auipc	ra,0x0
 660:	d92080e7          	jalr	-622(ra) # 3ee <putc>
        putc(fd, c);
 664:	85ca                	mv	a1,s2
 666:	8556                	mv	a0,s5
 668:	00000097          	auipc	ra,0x0
 66c:	d86080e7          	jalr	-634(ra) # 3ee <putc>
      state = 0;
 670:	4981                	li	s3,0
 672:	b565                	j	51a <vprintf+0x60>
        s = va_arg(ap, char*);
 674:	8b4a                	mv	s6,s2
      state = 0;
 676:	4981                	li	s3,0
 678:	b54d                	j	51a <vprintf+0x60>
    }
  }
}
 67a:	70e6                	ld	ra,120(sp)
 67c:	7446                	ld	s0,112(sp)
 67e:	74a6                	ld	s1,104(sp)
 680:	7906                	ld	s2,96(sp)
 682:	69e6                	ld	s3,88(sp)
 684:	6a46                	ld	s4,80(sp)
 686:	6aa6                	ld	s5,72(sp)
 688:	6b06                	ld	s6,64(sp)
 68a:	7be2                	ld	s7,56(sp)
 68c:	7c42                	ld	s8,48(sp)
 68e:	7ca2                	ld	s9,40(sp)
 690:	7d02                	ld	s10,32(sp)
 692:	6de2                	ld	s11,24(sp)
 694:	6109                	addi	sp,sp,128
 696:	8082                	ret

0000000000000698 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 698:	715d                	addi	sp,sp,-80
 69a:	ec06                	sd	ra,24(sp)
 69c:	e822                	sd	s0,16(sp)
 69e:	1000                	addi	s0,sp,32
 6a0:	e010                	sd	a2,0(s0)
 6a2:	e414                	sd	a3,8(s0)
 6a4:	e818                	sd	a4,16(s0)
 6a6:	ec1c                	sd	a5,24(s0)
 6a8:	03043023          	sd	a6,32(s0)
 6ac:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 6b0:	8622                	mv	a2,s0
 6b2:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 6b6:	00000097          	auipc	ra,0x0
 6ba:	e04080e7          	jalr	-508(ra) # 4ba <vprintf>
}
 6be:	60e2                	ld	ra,24(sp)
 6c0:	6442                	ld	s0,16(sp)
 6c2:	6161                	addi	sp,sp,80
 6c4:	8082                	ret

00000000000006c6 <printf>:

void
printf(const char *fmt, ...)
{
 6c6:	711d                	addi	sp,sp,-96
 6c8:	ec06                	sd	ra,24(sp)
 6ca:	e822                	sd	s0,16(sp)
 6cc:	1000                	addi	s0,sp,32
 6ce:	e40c                	sd	a1,8(s0)
 6d0:	e810                	sd	a2,16(s0)
 6d2:	ec14                	sd	a3,24(s0)
 6d4:	f018                	sd	a4,32(s0)
 6d6:	f41c                	sd	a5,40(s0)
 6d8:	03043823          	sd	a6,48(s0)
 6dc:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 6e0:	00840613          	addi	a2,s0,8
 6e4:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 6e8:	85aa                	mv	a1,a0
 6ea:	4505                	li	a0,1
 6ec:	00000097          	auipc	ra,0x0
 6f0:	dce080e7          	jalr	-562(ra) # 4ba <vprintf>
}
 6f4:	60e2                	ld	ra,24(sp)
 6f6:	6442                	ld	s0,16(sp)
 6f8:	6125                	addi	sp,sp,96
 6fa:	8082                	ret

00000000000006fc <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6fc:	1141                	addi	sp,sp,-16
 6fe:	e422                	sd	s0,8(sp)
 700:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 702:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 706:	00000797          	auipc	a5,0x0
 70a:	1f27b783          	ld	a5,498(a5) # 8f8 <freep>
 70e:	a02d                	j	738 <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 710:	4618                	lw	a4,8(a2)
 712:	9f2d                	addw	a4,a4,a1
 714:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 718:	6398                	ld	a4,0(a5)
 71a:	6310                	ld	a2,0(a4)
 71c:	a83d                	j	75a <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 71e:	ff852703          	lw	a4,-8(a0)
 722:	9f31                	addw	a4,a4,a2
 724:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 726:	ff053683          	ld	a3,-16(a0)
 72a:	a091                	j	76e <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 72c:	6398                	ld	a4,0(a5)
 72e:	00e7e463          	bltu	a5,a4,736 <free+0x3a>
 732:	00e6ea63          	bltu	a3,a4,746 <free+0x4a>
{
 736:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 738:	fed7fae3          	bgeu	a5,a3,72c <free+0x30>
 73c:	6398                	ld	a4,0(a5)
 73e:	00e6e463          	bltu	a3,a4,746 <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 742:	fee7eae3          	bltu	a5,a4,736 <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
 746:	ff852583          	lw	a1,-8(a0)
 74a:	6390                	ld	a2,0(a5)
 74c:	02059813          	slli	a6,a1,0x20
 750:	01c85713          	srli	a4,a6,0x1c
 754:	9736                	add	a4,a4,a3
 756:	fae60de3          	beq	a2,a4,710 <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
 75a:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 75e:	4790                	lw	a2,8(a5)
 760:	02061593          	slli	a1,a2,0x20
 764:	01c5d713          	srli	a4,a1,0x1c
 768:	973e                	add	a4,a4,a5
 76a:	fae68ae3          	beq	a3,a4,71e <free+0x22>
    p->s.ptr = bp->s.ptr;
 76e:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 770:	00000717          	auipc	a4,0x0
 774:	18f73423          	sd	a5,392(a4) # 8f8 <freep>
}
 778:	6422                	ld	s0,8(sp)
 77a:	0141                	addi	sp,sp,16
 77c:	8082                	ret

000000000000077e <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 77e:	7139                	addi	sp,sp,-64
 780:	fc06                	sd	ra,56(sp)
 782:	f822                	sd	s0,48(sp)
 784:	f426                	sd	s1,40(sp)
 786:	f04a                	sd	s2,32(sp)
 788:	ec4e                	sd	s3,24(sp)
 78a:	e852                	sd	s4,16(sp)
 78c:	e456                	sd	s5,8(sp)
 78e:	e05a                	sd	s6,0(sp)
 790:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 792:	02051493          	slli	s1,a0,0x20
 796:	9081                	srli	s1,s1,0x20
 798:	04bd                	addi	s1,s1,15
 79a:	8091                	srli	s1,s1,0x4
 79c:	00148a1b          	addiw	s4,s1,1
 7a0:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 7a2:	00000517          	auipc	a0,0x0
 7a6:	15653503          	ld	a0,342(a0) # 8f8 <freep>
 7aa:	c515                	beqz	a0,7d6 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7ac:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 7ae:	4798                	lw	a4,8(a5)
 7b0:	04977163          	bgeu	a4,s1,7f2 <malloc+0x74>
 7b4:	89d2                	mv	s3,s4
 7b6:	000a071b          	sext.w	a4,s4
 7ba:	6685                	lui	a3,0x1
 7bc:	00d77363          	bgeu	a4,a3,7c2 <malloc+0x44>
 7c0:	6985                	lui	s3,0x1
 7c2:	00098b1b          	sext.w	s6,s3
  p = sbrk(nu * sizeof(Header));
 7c6:	0049999b          	slliw	s3,s3,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7ca:	00000917          	auipc	s2,0x0
 7ce:	12e90913          	addi	s2,s2,302 # 8f8 <freep>
  if(p == (char*)-1)
 7d2:	5afd                	li	s5,-1
 7d4:	a8a5                	j	84c <malloc+0xce>
    base.s.ptr = freep = prevp = &base;
 7d6:	00000797          	auipc	a5,0x0
 7da:	12278793          	addi	a5,a5,290 # 8f8 <freep>
 7de:	00000717          	auipc	a4,0x0
 7e2:	12270713          	addi	a4,a4,290 # 900 <base>
 7e6:	e398                	sd	a4,0(a5)
 7e8:	e798                	sd	a4,8(a5)
    base.s.size = 0;
 7ea:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7ee:	87ba                	mv	a5,a4
 7f0:	b7d1                	j	7b4 <malloc+0x36>
      if(p->s.size == nunits)
 7f2:	02e48c63          	beq	s1,a4,82a <malloc+0xac>
        p->s.size -= nunits;
 7f6:	4147073b          	subw	a4,a4,s4
 7fa:	c798                	sw	a4,8(a5)
        p += p->s.size;
 7fc:	02071693          	slli	a3,a4,0x20
 800:	01c6d713          	srli	a4,a3,0x1c
 804:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 806:	0147a423          	sw	s4,8(a5)
      freep = prevp;
 80a:	00000717          	auipc	a4,0x0
 80e:	0ea73723          	sd	a0,238(a4) # 8f8 <freep>
      return (void*)(p + 1);
 812:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 816:	70e2                	ld	ra,56(sp)
 818:	7442                	ld	s0,48(sp)
 81a:	74a2                	ld	s1,40(sp)
 81c:	7902                	ld	s2,32(sp)
 81e:	69e2                	ld	s3,24(sp)
 820:	6a42                	ld	s4,16(sp)
 822:	6aa2                	ld	s5,8(sp)
 824:	6b02                	ld	s6,0(sp)
 826:	6121                	addi	sp,sp,64
 828:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 82a:	6398                	ld	a4,0(a5)
 82c:	e118                	sd	a4,0(a0)
 82e:	bff1                	j	80a <malloc+0x8c>
  hp->s.size = nu;
 830:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 834:	0541                	addi	a0,a0,16
 836:	00000097          	auipc	ra,0x0
 83a:	ec6080e7          	jalr	-314(ra) # 6fc <free>
  return freep;
 83e:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 842:	d971                	beqz	a0,816 <malloc+0x98>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 844:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 846:	4798                	lw	a4,8(a5)
 848:	fa9775e3          	bgeu	a4,s1,7f2 <malloc+0x74>
    if(p == freep)
 84c:	00093703          	ld	a4,0(s2)
 850:	853e                	mv	a0,a5
 852:	fef719e3          	bne	a4,a5,844 <malloc+0xc6>
  p = sbrk(nu * sizeof(Header));
 856:	854e                	mv	a0,s3
 858:	00000097          	auipc	ra,0x0
 85c:	b34080e7          	jalr	-1228(ra) # 38c <sbrk>
  if(p == (char*)-1)
 860:	fd5518e3          	bne	a0,s5,830 <malloc+0xb2>
        return 0;
 864:	4501                	li	a0,0
 866:	bf45                	j	816 <malloc+0x98>
