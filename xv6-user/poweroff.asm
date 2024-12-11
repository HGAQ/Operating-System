
xv6-user/_poweroff:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/include/stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	1141                	addi	sp,sp,-16
   2:	e406                	sd	ra,8(sp)
   4:	e022                	sd	s0,0(sp)
   6:	0800                	addi	s0,sp,16
  poweroff();
   8:	00000097          	auipc	ra,0x0
   c:	392080e7          	jalr	914(ra) # 39a <poweroff>
  exit(1); // never reached
  10:	4505                	li	a0,1
  12:	00000097          	auipc	ra,0x0
  16:	2c0080e7          	jalr	704(ra) # 2d2 <exit>

000000000000001a <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
  1a:	1141                	addi	sp,sp,-16
  1c:	e422                	sd	s0,8(sp)
  1e:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  20:	87aa                	mv	a5,a0
  22:	0585                	addi	a1,a1,1
  24:	0785                	addi	a5,a5,1
  26:	fff5c703          	lbu	a4,-1(a1)
  2a:	fee78fa3          	sb	a4,-1(a5)
  2e:	fb75                	bnez	a4,22 <strcpy+0x8>
    ;
  return os;
}
  30:	6422                	ld	s0,8(sp)
  32:	0141                	addi	sp,sp,16
  34:	8082                	ret

0000000000000036 <strcat>:

char*
strcat(char *s, const char *t)
{
  36:	1141                	addi	sp,sp,-16
  38:	e422                	sd	s0,8(sp)
  3a:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
  3c:	00054783          	lbu	a5,0(a0)
  40:	c385                	beqz	a5,60 <strcat+0x2a>
  42:	87aa                	mv	a5,a0
    s++;
  44:	0785                	addi	a5,a5,1
  while(*s)
  46:	0007c703          	lbu	a4,0(a5)
  4a:	ff6d                	bnez	a4,44 <strcat+0xe>
  while((*s++ = *t++))
  4c:	0585                	addi	a1,a1,1
  4e:	0785                	addi	a5,a5,1
  50:	fff5c703          	lbu	a4,-1(a1)
  54:	fee78fa3          	sb	a4,-1(a5)
  58:	fb75                	bnez	a4,4c <strcat+0x16>
    ;
  return os;
}
  5a:	6422                	ld	s0,8(sp)
  5c:	0141                	addi	sp,sp,16
  5e:	8082                	ret
  while(*s)
  60:	87aa                	mv	a5,a0
  62:	b7ed                	j	4c <strcat+0x16>

0000000000000064 <strcmp>:


int
strcmp(const char *p, const char *q)
{
  64:	1141                	addi	sp,sp,-16
  66:	e422                	sd	s0,8(sp)
  68:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
  6a:	00054783          	lbu	a5,0(a0)
  6e:	cb91                	beqz	a5,82 <strcmp+0x1e>
  70:	0005c703          	lbu	a4,0(a1)
  74:	00f71763          	bne	a4,a5,82 <strcmp+0x1e>
    p++, q++;
  78:	0505                	addi	a0,a0,1
  7a:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
  7c:	00054783          	lbu	a5,0(a0)
  80:	fbe5                	bnez	a5,70 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
  82:	0005c503          	lbu	a0,0(a1)
}
  86:	40a7853b          	subw	a0,a5,a0
  8a:	6422                	ld	s0,8(sp)
  8c:	0141                	addi	sp,sp,16
  8e:	8082                	ret

0000000000000090 <strlen>:

uint
strlen(const char *s)
{
  90:	1141                	addi	sp,sp,-16
  92:	e422                	sd	s0,8(sp)
  94:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
  96:	00054783          	lbu	a5,0(a0)
  9a:	cf91                	beqz	a5,b6 <strlen+0x26>
  9c:	0505                	addi	a0,a0,1
  9e:	87aa                	mv	a5,a0
  a0:	4685                	li	a3,1
  a2:	9e89                	subw	a3,a3,a0
  a4:	00f6853b          	addw	a0,a3,a5
  a8:	0785                	addi	a5,a5,1
  aa:	fff7c703          	lbu	a4,-1(a5)
  ae:	fb7d                	bnez	a4,a4 <strlen+0x14>
    ;
  return n;
}
  b0:	6422                	ld	s0,8(sp)
  b2:	0141                	addi	sp,sp,16
  b4:	8082                	ret
  for(n = 0; s[n]; n++)
  b6:	4501                	li	a0,0
  b8:	bfe5                	j	b0 <strlen+0x20>

00000000000000ba <memset>:

void*
memset(void *dst, int c, uint n)
{
  ba:	1141                	addi	sp,sp,-16
  bc:	e422                	sd	s0,8(sp)
  be:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
  c0:	ca19                	beqz	a2,d6 <memset+0x1c>
  c2:	87aa                	mv	a5,a0
  c4:	1602                	slli	a2,a2,0x20
  c6:	9201                	srli	a2,a2,0x20
  c8:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
  cc:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
  d0:	0785                	addi	a5,a5,1
  d2:	fee79de3          	bne	a5,a4,cc <memset+0x12>
  }
  return dst;
}
  d6:	6422                	ld	s0,8(sp)
  d8:	0141                	addi	sp,sp,16
  da:	8082                	ret

00000000000000dc <strchr>:

char*
strchr(const char *s, char c)
{
  dc:	1141                	addi	sp,sp,-16
  de:	e422                	sd	s0,8(sp)
  e0:	0800                	addi	s0,sp,16
  for(; *s; s++)
  e2:	00054783          	lbu	a5,0(a0)
  e6:	cb99                	beqz	a5,fc <strchr+0x20>
    if(*s == c)
  e8:	00f58763          	beq	a1,a5,f6 <strchr+0x1a>
  for(; *s; s++)
  ec:	0505                	addi	a0,a0,1
  ee:	00054783          	lbu	a5,0(a0)
  f2:	fbfd                	bnez	a5,e8 <strchr+0xc>
      return (char*)s;
  return 0;
  f4:	4501                	li	a0,0
}
  f6:	6422                	ld	s0,8(sp)
  f8:	0141                	addi	sp,sp,16
  fa:	8082                	ret
  return 0;
  fc:	4501                	li	a0,0
  fe:	bfe5                	j	f6 <strchr+0x1a>

0000000000000100 <gets>:

char*
gets(char *buf, int max)
{
 100:	711d                	addi	sp,sp,-96
 102:	ec86                	sd	ra,88(sp)
 104:	e8a2                	sd	s0,80(sp)
 106:	e4a6                	sd	s1,72(sp)
 108:	e0ca                	sd	s2,64(sp)
 10a:	fc4e                	sd	s3,56(sp)
 10c:	f852                	sd	s4,48(sp)
 10e:	f456                	sd	s5,40(sp)
 110:	f05a                	sd	s6,32(sp)
 112:	ec5e                	sd	s7,24(sp)
 114:	e862                	sd	s8,16(sp)
 116:	1080                	addi	s0,sp,96
 118:	8baa                	mv	s7,a0
 11a:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 11c:	892a                	mv	s2,a0
 11e:	4481                	li	s1,0
    cc = read(0, &c, 1);
 120:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 124:	4b29                	li	s6,10
 126:	4c35                	li	s8,13
  for(i=0; i+1 < max; ){
 128:	89a6                	mv	s3,s1
 12a:	2485                	addiw	s1,s1,1
 12c:	0344d763          	bge	s1,s4,15a <gets+0x5a>
    cc = read(0, &c, 1);
 130:	4605                	li	a2,1
 132:	85d6                	mv	a1,s5
 134:	4501                	li	a0,0
 136:	00000097          	auipc	ra,0x0
 13a:	1b4080e7          	jalr	436(ra) # 2ea <read>
    if(cc < 1)
 13e:	00a05e63          	blez	a0,15a <gets+0x5a>
    buf[i++] = c;
 142:	faf44783          	lbu	a5,-81(s0)
 146:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 14a:	01678763          	beq	a5,s6,158 <gets+0x58>
 14e:	0905                	addi	s2,s2,1
 150:	fd879ce3          	bne	a5,s8,128 <gets+0x28>
  for(i=0; i+1 < max; ){
 154:	89a6                	mv	s3,s1
 156:	a011                	j	15a <gets+0x5a>
 158:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 15a:	99de                	add	s3,s3,s7
 15c:	00098023          	sb	zero,0(s3)
  return buf;
}
 160:	855e                	mv	a0,s7
 162:	60e6                	ld	ra,88(sp)
 164:	6446                	ld	s0,80(sp)
 166:	64a6                	ld	s1,72(sp)
 168:	6906                	ld	s2,64(sp)
 16a:	79e2                	ld	s3,56(sp)
 16c:	7a42                	ld	s4,48(sp)
 16e:	7aa2                	ld	s5,40(sp)
 170:	7b02                	ld	s6,32(sp)
 172:	6be2                	ld	s7,24(sp)
 174:	6c42                	ld	s8,16(sp)
 176:	6125                	addi	sp,sp,96
 178:	8082                	ret

000000000000017a <stat>:

int
stat(const char *n, struct stat *st)
{
 17a:	1101                	addi	sp,sp,-32
 17c:	ec06                	sd	ra,24(sp)
 17e:	e822                	sd	s0,16(sp)
 180:	e426                	sd	s1,8(sp)
 182:	e04a                	sd	s2,0(sp)
 184:	1000                	addi	s0,sp,32
 186:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 188:	4581                	li	a1,0
 18a:	00000097          	auipc	ra,0x0
 18e:	188080e7          	jalr	392(ra) # 312 <open>
  if(fd < 0)
 192:	02054563          	bltz	a0,1bc <stat+0x42>
 196:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 198:	85ca                	mv	a1,s2
 19a:	00000097          	auipc	ra,0x0
 19e:	180080e7          	jalr	384(ra) # 31a <fstat>
 1a2:	892a                	mv	s2,a0
  close(fd);
 1a4:	8526                	mv	a0,s1
 1a6:	00000097          	auipc	ra,0x0
 1aa:	154080e7          	jalr	340(ra) # 2fa <close>
  return r;
}
 1ae:	854a                	mv	a0,s2
 1b0:	60e2                	ld	ra,24(sp)
 1b2:	6442                	ld	s0,16(sp)
 1b4:	64a2                	ld	s1,8(sp)
 1b6:	6902                	ld	s2,0(sp)
 1b8:	6105                	addi	sp,sp,32
 1ba:	8082                	ret
    return -1;
 1bc:	597d                	li	s2,-1
 1be:	bfc5                	j	1ae <stat+0x34>

00000000000001c0 <atoi>:

int
atoi(const char *s)
{
 1c0:	1141                	addi	sp,sp,-16
 1c2:	e422                	sd	s0,8(sp)
 1c4:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 1c6:	00054703          	lbu	a4,0(a0)
 1ca:	02d00793          	li	a5,45
  int neg = 1;
 1ce:	4585                	li	a1,1
  if (*s == '-') {
 1d0:	04f70363          	beq	a4,a5,216 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 1d4:	00054703          	lbu	a4,0(a0)
 1d8:	fd07079b          	addiw	a5,a4,-48
 1dc:	0ff7f793          	zext.b	a5,a5
 1e0:	46a5                	li	a3,9
 1e2:	02f6ed63          	bltu	a3,a5,21c <atoi+0x5c>
  n = 0;
 1e6:	4681                	li	a3,0
  while('0' <= *s && *s <= '9')
 1e8:	4625                	li	a2,9
    n = n*10 + *s++ - '0';
 1ea:	0505                	addi	a0,a0,1
 1ec:	0026979b          	slliw	a5,a3,0x2
 1f0:	9fb5                	addw	a5,a5,a3
 1f2:	0017979b          	slliw	a5,a5,0x1
 1f6:	9fb9                	addw	a5,a5,a4
 1f8:	fd07869b          	addiw	a3,a5,-48
  while('0' <= *s && *s <= '9')
 1fc:	00054703          	lbu	a4,0(a0)
 200:	fd07079b          	addiw	a5,a4,-48
 204:	0ff7f793          	zext.b	a5,a5
 208:	fef671e3          	bgeu	a2,a5,1ea <atoi+0x2a>
  return n * neg;
}
 20c:	02d5853b          	mulw	a0,a1,a3
 210:	6422                	ld	s0,8(sp)
 212:	0141                	addi	sp,sp,16
 214:	8082                	ret
    s++;
 216:	0505                	addi	a0,a0,1
    neg = -1;
 218:	55fd                	li	a1,-1
 21a:	bf6d                	j	1d4 <atoi+0x14>
  n = 0;
 21c:	4681                	li	a3,0
 21e:	b7fd                	j	20c <atoi+0x4c>

0000000000000220 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 220:	1141                	addi	sp,sp,-16
 222:	e422                	sd	s0,8(sp)
 224:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 226:	02b57463          	bgeu	a0,a1,24e <memmove+0x2e>
    while(n-- > 0)
 22a:	00c05f63          	blez	a2,248 <memmove+0x28>
 22e:	1602                	slli	a2,a2,0x20
 230:	9201                	srli	a2,a2,0x20
 232:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 236:	872a                	mv	a4,a0
      *dst++ = *src++;
 238:	0585                	addi	a1,a1,1
 23a:	0705                	addi	a4,a4,1
 23c:	fff5c683          	lbu	a3,-1(a1)
 240:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 244:	fee79ae3          	bne	a5,a4,238 <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 248:	6422                	ld	s0,8(sp)
 24a:	0141                	addi	sp,sp,16
 24c:	8082                	ret
    dst += n;
 24e:	00c50733          	add	a4,a0,a2
    src += n;
 252:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 254:	fec05ae3          	blez	a2,248 <memmove+0x28>
 258:	fff6079b          	addiw	a5,a2,-1
 25c:	1782                	slli	a5,a5,0x20
 25e:	9381                	srli	a5,a5,0x20
 260:	fff7c793          	not	a5,a5
 264:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 266:	15fd                	addi	a1,a1,-1
 268:	177d                	addi	a4,a4,-1
 26a:	0005c683          	lbu	a3,0(a1)
 26e:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 272:	fee79ae3          	bne	a5,a4,266 <memmove+0x46>
 276:	bfc9                	j	248 <memmove+0x28>

0000000000000278 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 278:	1141                	addi	sp,sp,-16
 27a:	e422                	sd	s0,8(sp)
 27c:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 27e:	ca05                	beqz	a2,2ae <memcmp+0x36>
 280:	fff6069b          	addiw	a3,a2,-1
 284:	1682                	slli	a3,a3,0x20
 286:	9281                	srli	a3,a3,0x20
 288:	0685                	addi	a3,a3,1
 28a:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 28c:	00054783          	lbu	a5,0(a0)
 290:	0005c703          	lbu	a4,0(a1)
 294:	00e79863          	bne	a5,a4,2a4 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 298:	0505                	addi	a0,a0,1
    p2++;
 29a:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 29c:	fed518e3          	bne	a0,a3,28c <memcmp+0x14>
  }
  return 0;
 2a0:	4501                	li	a0,0
 2a2:	a019                	j	2a8 <memcmp+0x30>
      return *p1 - *p2;
 2a4:	40e7853b          	subw	a0,a5,a4
}
 2a8:	6422                	ld	s0,8(sp)
 2aa:	0141                	addi	sp,sp,16
 2ac:	8082                	ret
  return 0;
 2ae:	4501                	li	a0,0
 2b0:	bfe5                	j	2a8 <memcmp+0x30>

00000000000002b2 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 2b2:	1141                	addi	sp,sp,-16
 2b4:	e406                	sd	ra,8(sp)
 2b6:	e022                	sd	s0,0(sp)
 2b8:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 2ba:	00000097          	auipc	ra,0x0
 2be:	f66080e7          	jalr	-154(ra) # 220 <memmove>
}
 2c2:	60a2                	ld	ra,8(sp)
 2c4:	6402                	ld	s0,0(sp)
 2c6:	0141                	addi	sp,sp,16
 2c8:	8082                	ret

00000000000002ca <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 2ca:	4885                	li	a7,1
 ecall
 2cc:	00000073          	ecall
 ret
 2d0:	8082                	ret

00000000000002d2 <exit>:
.global exit
exit:
 li a7, SYS_exit
 2d2:	4889                	li	a7,2
 ecall
 2d4:	00000073          	ecall
 ret
 2d8:	8082                	ret

00000000000002da <wait>:
.global wait
wait:
 li a7, SYS_wait
 2da:	488d                	li	a7,3
 ecall
 2dc:	00000073          	ecall
 ret
 2e0:	8082                	ret

00000000000002e2 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 2e2:	4891                	li	a7,4
 ecall
 2e4:	00000073          	ecall
 ret
 2e8:	8082                	ret

00000000000002ea <read>:
.global read
read:
 li a7, SYS_read
 2ea:	4895                	li	a7,5
 ecall
 2ec:	00000073          	ecall
 ret
 2f0:	8082                	ret

00000000000002f2 <write>:
.global write
write:
 li a7, SYS_write
 2f2:	48c1                	li	a7,16
 ecall
 2f4:	00000073          	ecall
 ret
 2f8:	8082                	ret

00000000000002fa <close>:
.global close
close:
 li a7, SYS_close
 2fa:	48d5                	li	a7,21
 ecall
 2fc:	00000073          	ecall
 ret
 300:	8082                	ret

0000000000000302 <kill>:
.global kill
kill:
 li a7, SYS_kill
 302:	4899                	li	a7,6
 ecall
 304:	00000073          	ecall
 ret
 308:	8082                	ret

000000000000030a <exec>:
.global exec
exec:
 li a7, SYS_exec
 30a:	489d                	li	a7,7
 ecall
 30c:	00000073          	ecall
 ret
 310:	8082                	ret

0000000000000312 <open>:
.global open
open:
 li a7, SYS_open
 312:	48bd                	li	a7,15
 ecall
 314:	00000073          	ecall
 ret
 318:	8082                	ret

000000000000031a <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 31a:	48a1                	li	a7,8
 ecall
 31c:	00000073          	ecall
 ret
 320:	8082                	ret

0000000000000322 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 322:	48d1                	li	a7,20
 ecall
 324:	00000073          	ecall
 ret
 328:	8082                	ret

000000000000032a <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 32a:	48a5                	li	a7,9
 ecall
 32c:	00000073          	ecall
 ret
 330:	8082                	ret

0000000000000332 <dup>:
.global dup
dup:
 li a7, SYS_dup
 332:	48a9                	li	a7,10
 ecall
 334:	00000073          	ecall
 ret
 338:	8082                	ret

000000000000033a <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 33a:	48ad                	li	a7,11
 ecall
 33c:	00000073          	ecall
 ret
 340:	8082                	ret

0000000000000342 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 342:	48b1                	li	a7,12
 ecall
 344:	00000073          	ecall
 ret
 348:	8082                	ret

000000000000034a <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 34a:	48b5                	li	a7,13
 ecall
 34c:	00000073          	ecall
 ret
 350:	8082                	ret

0000000000000352 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 352:	48b9                	li	a7,14
 ecall
 354:	00000073          	ecall
 ret
 358:	8082                	ret

000000000000035a <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 35a:	48d9                	li	a7,22
 ecall
 35c:	00000073          	ecall
 ret
 360:	8082                	ret

0000000000000362 <dev>:
.global dev
dev:
 li a7, SYS_dev
 362:	48dd                	li	a7,23
 ecall
 364:	00000073          	ecall
 ret
 368:	8082                	ret

000000000000036a <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 36a:	48e1                	li	a7,24
 ecall
 36c:	00000073          	ecall
 ret
 370:	8082                	ret

0000000000000372 <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 372:	48e5                	li	a7,25
 ecall
 374:	00000073          	ecall
 ret
 378:	8082                	ret

000000000000037a <remove>:
.global remove
remove:
 li a7, SYS_remove
 37a:	48c5                	li	a7,17
 ecall
 37c:	00000073          	ecall
 ret
 380:	8082                	ret

0000000000000382 <trace>:
.global trace
trace:
 li a7, SYS_trace
 382:	48c9                	li	a7,18
 ecall
 384:	00000073          	ecall
 ret
 388:	8082                	ret

000000000000038a <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 38a:	48cd                	li	a7,19
 ecall
 38c:	00000073          	ecall
 ret
 390:	8082                	ret

0000000000000392 <rename>:
.global rename
rename:
 li a7, SYS_rename
 392:	48e9                	li	a7,26
 ecall
 394:	00000073          	ecall
 ret
 398:	8082                	ret

000000000000039a <poweroff>:
.global poweroff
poweroff:
 li a7, SYS_poweroff
 39a:	0d200893          	li	a7,210
 ecall
 39e:	00000073          	ecall
 ret
 3a2:	8082                	ret

00000000000003a4 <mkdirat>:
.global mkdirat
mkdirat:
 li a7, SYS_mkdirat
 3a4:	02200893          	li	a7,34
 ecall
 3a8:	00000073          	ecall
 ret
 3ac:	8082                	ret

00000000000003ae <clone>:
.global clone
clone:
 li a7, SYS_clone
 3ae:	0dc00893          	li	a7,220
 ecall
 3b2:	00000073          	ecall
 ret
 3b6:	8082                	ret

00000000000003b8 <wait4>:
.global wait4
wait4:
 li a7, SYS_wait4
 3b8:	10400893          	li	a7,260
 ecall
 3bc:	00000073          	ecall
 ret
 3c0:	8082                	ret

00000000000003c2 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 3c2:	1101                	addi	sp,sp,-32
 3c4:	ec06                	sd	ra,24(sp)
 3c6:	e822                	sd	s0,16(sp)
 3c8:	1000                	addi	s0,sp,32
 3ca:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 3ce:	4605                	li	a2,1
 3d0:	fef40593          	addi	a1,s0,-17
 3d4:	00000097          	auipc	ra,0x0
 3d8:	f1e080e7          	jalr	-226(ra) # 2f2 <write>
}
 3dc:	60e2                	ld	ra,24(sp)
 3de:	6442                	ld	s0,16(sp)
 3e0:	6105                	addi	sp,sp,32
 3e2:	8082                	ret

00000000000003e4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3e4:	7139                	addi	sp,sp,-64
 3e6:	fc06                	sd	ra,56(sp)
 3e8:	f822                	sd	s0,48(sp)
 3ea:	f426                	sd	s1,40(sp)
 3ec:	f04a                	sd	s2,32(sp)
 3ee:	ec4e                	sd	s3,24(sp)
 3f0:	0080                	addi	s0,sp,64
 3f2:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3f4:	c299                	beqz	a3,3fa <printint+0x16>
 3f6:	0805c863          	bltz	a1,486 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 3fa:	2581                	sext.w	a1,a1
  neg = 0;
 3fc:	4881                	li	a7,0
  }

  i = 0;
 3fe:	fc040993          	addi	s3,s0,-64
  neg = 0;
 402:	86ce                	mv	a3,s3
  i = 0;
 404:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 406:	2601                	sext.w	a2,a2
 408:	00000517          	auipc	a0,0x0
 40c:	49850513          	addi	a0,a0,1176 # 8a0 <digits>
 410:	883a                	mv	a6,a4
 412:	2705                	addiw	a4,a4,1
 414:	02c5f7bb          	remuw	a5,a1,a2
 418:	1782                	slli	a5,a5,0x20
 41a:	9381                	srli	a5,a5,0x20
 41c:	97aa                	add	a5,a5,a0
 41e:	0007c783          	lbu	a5,0(a5)
 422:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 426:	0005879b          	sext.w	a5,a1
 42a:	02c5d5bb          	divuw	a1,a1,a2
 42e:	0685                	addi	a3,a3,1
 430:	fec7f0e3          	bgeu	a5,a2,410 <printint+0x2c>
  if(neg)
 434:	00088c63          	beqz	a7,44c <printint+0x68>
    buf[i++] = '-';
 438:	fd070793          	addi	a5,a4,-48
 43c:	00878733          	add	a4,a5,s0
 440:	02d00793          	li	a5,45
 444:	fef70823          	sb	a5,-16(a4)
 448:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 44c:	02e05663          	blez	a4,478 <printint+0x94>
 450:	fc040913          	addi	s2,s0,-64
 454:	993a                	add	s2,s2,a4
 456:	19fd                	addi	s3,s3,-1
 458:	99ba                	add	s3,s3,a4
 45a:	377d                	addiw	a4,a4,-1
 45c:	1702                	slli	a4,a4,0x20
 45e:	9301                	srli	a4,a4,0x20
 460:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 464:	fff94583          	lbu	a1,-1(s2)
 468:	8526                	mv	a0,s1
 46a:	00000097          	auipc	ra,0x0
 46e:	f58080e7          	jalr	-168(ra) # 3c2 <putc>
  while(--i >= 0)
 472:	197d                	addi	s2,s2,-1
 474:	ff3918e3          	bne	s2,s3,464 <printint+0x80>
}
 478:	70e2                	ld	ra,56(sp)
 47a:	7442                	ld	s0,48(sp)
 47c:	74a2                	ld	s1,40(sp)
 47e:	7902                	ld	s2,32(sp)
 480:	69e2                	ld	s3,24(sp)
 482:	6121                	addi	sp,sp,64
 484:	8082                	ret
    x = -xx;
 486:	40b005bb          	negw	a1,a1
    neg = 1;
 48a:	4885                	li	a7,1
    x = -xx;
 48c:	bf8d                	j	3fe <printint+0x1a>

000000000000048e <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 48e:	7119                	addi	sp,sp,-128
 490:	fc86                	sd	ra,120(sp)
 492:	f8a2                	sd	s0,112(sp)
 494:	f4a6                	sd	s1,104(sp)
 496:	f0ca                	sd	s2,96(sp)
 498:	ecce                	sd	s3,88(sp)
 49a:	e8d2                	sd	s4,80(sp)
 49c:	e4d6                	sd	s5,72(sp)
 49e:	e0da                	sd	s6,64(sp)
 4a0:	fc5e                	sd	s7,56(sp)
 4a2:	f862                	sd	s8,48(sp)
 4a4:	f466                	sd	s9,40(sp)
 4a6:	f06a                	sd	s10,32(sp)
 4a8:	ec6e                	sd	s11,24(sp)
 4aa:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 4ac:	0005c903          	lbu	s2,0(a1)
 4b0:	18090f63          	beqz	s2,64e <vprintf+0x1c0>
 4b4:	8aaa                	mv	s5,a0
 4b6:	8b32                	mv	s6,a2
 4b8:	00158493          	addi	s1,a1,1
  state = 0;
 4bc:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 4be:	02500a13          	li	s4,37
 4c2:	4c55                	li	s8,21
 4c4:	00000c97          	auipc	s9,0x0
 4c8:	384c8c93          	addi	s9,s9,900 # 848 <malloc+0xf6>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
        s = va_arg(ap, char*);
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 4cc:	02800d93          	li	s11,40
  putc(fd, 'x');
 4d0:	4d41                	li	s10,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 4d2:	00000b97          	auipc	s7,0x0
 4d6:	3ceb8b93          	addi	s7,s7,974 # 8a0 <digits>
 4da:	a839                	j	4f8 <vprintf+0x6a>
        putc(fd, c);
 4dc:	85ca                	mv	a1,s2
 4de:	8556                	mv	a0,s5
 4e0:	00000097          	auipc	ra,0x0
 4e4:	ee2080e7          	jalr	-286(ra) # 3c2 <putc>
 4e8:	a019                	j	4ee <vprintf+0x60>
    } else if(state == '%'){
 4ea:	01498d63          	beq	s3,s4,504 <vprintf+0x76>
  for(i = 0; fmt[i]; i++){
 4ee:	0485                	addi	s1,s1,1
 4f0:	fff4c903          	lbu	s2,-1(s1)
 4f4:	14090d63          	beqz	s2,64e <vprintf+0x1c0>
    if(state == 0){
 4f8:	fe0999e3          	bnez	s3,4ea <vprintf+0x5c>
      if(c == '%'){
 4fc:	ff4910e3          	bne	s2,s4,4dc <vprintf+0x4e>
        state = '%';
 500:	89d2                	mv	s3,s4
 502:	b7f5                	j	4ee <vprintf+0x60>
      if(c == 'd'){
 504:	11490c63          	beq	s2,s4,61c <vprintf+0x18e>
 508:	f9d9079b          	addiw	a5,s2,-99
 50c:	0ff7f793          	zext.b	a5,a5
 510:	10fc6e63          	bltu	s8,a5,62c <vprintf+0x19e>
 514:	f9d9079b          	addiw	a5,s2,-99
 518:	0ff7f713          	zext.b	a4,a5
 51c:	10ec6863          	bltu	s8,a4,62c <vprintf+0x19e>
 520:	00271793          	slli	a5,a4,0x2
 524:	97e6                	add	a5,a5,s9
 526:	439c                	lw	a5,0(a5)
 528:	97e6                	add	a5,a5,s9
 52a:	8782                	jr	a5
        printint(fd, va_arg(ap, int), 10, 1);
 52c:	008b0913          	addi	s2,s6,8
 530:	4685                	li	a3,1
 532:	4629                	li	a2,10
 534:	000b2583          	lw	a1,0(s6)
 538:	8556                	mv	a0,s5
 53a:	00000097          	auipc	ra,0x0
 53e:	eaa080e7          	jalr	-342(ra) # 3e4 <printint>
 542:	8b4a                	mv	s6,s2
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 544:	4981                	li	s3,0
 546:	b765                	j	4ee <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 548:	008b0913          	addi	s2,s6,8
 54c:	4681                	li	a3,0
 54e:	4629                	li	a2,10
 550:	000b2583          	lw	a1,0(s6)
 554:	8556                	mv	a0,s5
 556:	00000097          	auipc	ra,0x0
 55a:	e8e080e7          	jalr	-370(ra) # 3e4 <printint>
 55e:	8b4a                	mv	s6,s2
      state = 0;
 560:	4981                	li	s3,0
 562:	b771                	j	4ee <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 564:	008b0913          	addi	s2,s6,8
 568:	4681                	li	a3,0
 56a:	866a                	mv	a2,s10
 56c:	000b2583          	lw	a1,0(s6)
 570:	8556                	mv	a0,s5
 572:	00000097          	auipc	ra,0x0
 576:	e72080e7          	jalr	-398(ra) # 3e4 <printint>
 57a:	8b4a                	mv	s6,s2
      state = 0;
 57c:	4981                	li	s3,0
 57e:	bf85                	j	4ee <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 580:	008b0793          	addi	a5,s6,8
 584:	f8f43423          	sd	a5,-120(s0)
 588:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 58c:	03000593          	li	a1,48
 590:	8556                	mv	a0,s5
 592:	00000097          	auipc	ra,0x0
 596:	e30080e7          	jalr	-464(ra) # 3c2 <putc>
  putc(fd, 'x');
 59a:	07800593          	li	a1,120
 59e:	8556                	mv	a0,s5
 5a0:	00000097          	auipc	ra,0x0
 5a4:	e22080e7          	jalr	-478(ra) # 3c2 <putc>
 5a8:	896a                	mv	s2,s10
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 5aa:	03c9d793          	srli	a5,s3,0x3c
 5ae:	97de                	add	a5,a5,s7
 5b0:	0007c583          	lbu	a1,0(a5)
 5b4:	8556                	mv	a0,s5
 5b6:	00000097          	auipc	ra,0x0
 5ba:	e0c080e7          	jalr	-500(ra) # 3c2 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 5be:	0992                	slli	s3,s3,0x4
 5c0:	397d                	addiw	s2,s2,-1
 5c2:	fe0914e3          	bnez	s2,5aa <vprintf+0x11c>
        printptr(fd, va_arg(ap, uint64));
 5c6:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 5ca:	4981                	li	s3,0
 5cc:	b70d                	j	4ee <vprintf+0x60>
        s = va_arg(ap, char*);
 5ce:	008b0913          	addi	s2,s6,8
 5d2:	000b3983          	ld	s3,0(s6)
        if(s == 0)
 5d6:	02098163          	beqz	s3,5f8 <vprintf+0x16a>
        while(*s != 0){
 5da:	0009c583          	lbu	a1,0(s3)
 5de:	c5ad                	beqz	a1,648 <vprintf+0x1ba>
          putc(fd, *s);
 5e0:	8556                	mv	a0,s5
 5e2:	00000097          	auipc	ra,0x0
 5e6:	de0080e7          	jalr	-544(ra) # 3c2 <putc>
          s++;
 5ea:	0985                	addi	s3,s3,1
        while(*s != 0){
 5ec:	0009c583          	lbu	a1,0(s3)
 5f0:	f9e5                	bnez	a1,5e0 <vprintf+0x152>
        s = va_arg(ap, char*);
 5f2:	8b4a                	mv	s6,s2
      state = 0;
 5f4:	4981                	li	s3,0
 5f6:	bde5                	j	4ee <vprintf+0x60>
          s = "(null)";
 5f8:	00000997          	auipc	s3,0x0
 5fc:	24898993          	addi	s3,s3,584 # 840 <malloc+0xee>
        while(*s != 0){
 600:	85ee                	mv	a1,s11
 602:	bff9                	j	5e0 <vprintf+0x152>
        putc(fd, va_arg(ap, uint));
 604:	008b0913          	addi	s2,s6,8
 608:	000b4583          	lbu	a1,0(s6)
 60c:	8556                	mv	a0,s5
 60e:	00000097          	auipc	ra,0x0
 612:	db4080e7          	jalr	-588(ra) # 3c2 <putc>
 616:	8b4a                	mv	s6,s2
      state = 0;
 618:	4981                	li	s3,0
 61a:	bdd1                	j	4ee <vprintf+0x60>
        putc(fd, c);
 61c:	85d2                	mv	a1,s4
 61e:	8556                	mv	a0,s5
 620:	00000097          	auipc	ra,0x0
 624:	da2080e7          	jalr	-606(ra) # 3c2 <putc>
      state = 0;
 628:	4981                	li	s3,0
 62a:	b5d1                	j	4ee <vprintf+0x60>
        putc(fd, '%');
 62c:	85d2                	mv	a1,s4
 62e:	8556                	mv	a0,s5
 630:	00000097          	auipc	ra,0x0
 634:	d92080e7          	jalr	-622(ra) # 3c2 <putc>
        putc(fd, c);
 638:	85ca                	mv	a1,s2
 63a:	8556                	mv	a0,s5
 63c:	00000097          	auipc	ra,0x0
 640:	d86080e7          	jalr	-634(ra) # 3c2 <putc>
      state = 0;
 644:	4981                	li	s3,0
 646:	b565                	j	4ee <vprintf+0x60>
        s = va_arg(ap, char*);
 648:	8b4a                	mv	s6,s2
      state = 0;
 64a:	4981                	li	s3,0
 64c:	b54d                	j	4ee <vprintf+0x60>
    }
  }
}
 64e:	70e6                	ld	ra,120(sp)
 650:	7446                	ld	s0,112(sp)
 652:	74a6                	ld	s1,104(sp)
 654:	7906                	ld	s2,96(sp)
 656:	69e6                	ld	s3,88(sp)
 658:	6a46                	ld	s4,80(sp)
 65a:	6aa6                	ld	s5,72(sp)
 65c:	6b06                	ld	s6,64(sp)
 65e:	7be2                	ld	s7,56(sp)
 660:	7c42                	ld	s8,48(sp)
 662:	7ca2                	ld	s9,40(sp)
 664:	7d02                	ld	s10,32(sp)
 666:	6de2                	ld	s11,24(sp)
 668:	6109                	addi	sp,sp,128
 66a:	8082                	ret

000000000000066c <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 66c:	715d                	addi	sp,sp,-80
 66e:	ec06                	sd	ra,24(sp)
 670:	e822                	sd	s0,16(sp)
 672:	1000                	addi	s0,sp,32
 674:	e010                	sd	a2,0(s0)
 676:	e414                	sd	a3,8(s0)
 678:	e818                	sd	a4,16(s0)
 67a:	ec1c                	sd	a5,24(s0)
 67c:	03043023          	sd	a6,32(s0)
 680:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 684:	8622                	mv	a2,s0
 686:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 68a:	00000097          	auipc	ra,0x0
 68e:	e04080e7          	jalr	-508(ra) # 48e <vprintf>
}
 692:	60e2                	ld	ra,24(sp)
 694:	6442                	ld	s0,16(sp)
 696:	6161                	addi	sp,sp,80
 698:	8082                	ret

000000000000069a <printf>:

void
printf(const char *fmt, ...)
{
 69a:	711d                	addi	sp,sp,-96
 69c:	ec06                	sd	ra,24(sp)
 69e:	e822                	sd	s0,16(sp)
 6a0:	1000                	addi	s0,sp,32
 6a2:	e40c                	sd	a1,8(s0)
 6a4:	e810                	sd	a2,16(s0)
 6a6:	ec14                	sd	a3,24(s0)
 6a8:	f018                	sd	a4,32(s0)
 6aa:	f41c                	sd	a5,40(s0)
 6ac:	03043823          	sd	a6,48(s0)
 6b0:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 6b4:	00840613          	addi	a2,s0,8
 6b8:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 6bc:	85aa                	mv	a1,a0
 6be:	4505                	li	a0,1
 6c0:	00000097          	auipc	ra,0x0
 6c4:	dce080e7          	jalr	-562(ra) # 48e <vprintf>
}
 6c8:	60e2                	ld	ra,24(sp)
 6ca:	6442                	ld	s0,16(sp)
 6cc:	6125                	addi	sp,sp,96
 6ce:	8082                	ret

00000000000006d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6d0:	1141                	addi	sp,sp,-16
 6d2:	e422                	sd	s0,8(sp)
 6d4:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6d6:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6da:	00000797          	auipc	a5,0x0
 6de:	1de7b783          	ld	a5,478(a5) # 8b8 <freep>
 6e2:	a02d                	j	70c <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 6e4:	4618                	lw	a4,8(a2)
 6e6:	9f2d                	addw	a4,a4,a1
 6e8:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 6ec:	6398                	ld	a4,0(a5)
 6ee:	6310                	ld	a2,0(a4)
 6f0:	a83d                	j	72e <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 6f2:	ff852703          	lw	a4,-8(a0)
 6f6:	9f31                	addw	a4,a4,a2
 6f8:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 6fa:	ff053683          	ld	a3,-16(a0)
 6fe:	a091                	j	742 <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 700:	6398                	ld	a4,0(a5)
 702:	00e7e463          	bltu	a5,a4,70a <free+0x3a>
 706:	00e6ea63          	bltu	a3,a4,71a <free+0x4a>
{
 70a:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 70c:	fed7fae3          	bgeu	a5,a3,700 <free+0x30>
 710:	6398                	ld	a4,0(a5)
 712:	00e6e463          	bltu	a3,a4,71a <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 716:	fee7eae3          	bltu	a5,a4,70a <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
 71a:	ff852583          	lw	a1,-8(a0)
 71e:	6390                	ld	a2,0(a5)
 720:	02059813          	slli	a6,a1,0x20
 724:	01c85713          	srli	a4,a6,0x1c
 728:	9736                	add	a4,a4,a3
 72a:	fae60de3          	beq	a2,a4,6e4 <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
 72e:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 732:	4790                	lw	a2,8(a5)
 734:	02061593          	slli	a1,a2,0x20
 738:	01c5d713          	srli	a4,a1,0x1c
 73c:	973e                	add	a4,a4,a5
 73e:	fae68ae3          	beq	a3,a4,6f2 <free+0x22>
    p->s.ptr = bp->s.ptr;
 742:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 744:	00000717          	auipc	a4,0x0
 748:	16f73a23          	sd	a5,372(a4) # 8b8 <freep>
}
 74c:	6422                	ld	s0,8(sp)
 74e:	0141                	addi	sp,sp,16
 750:	8082                	ret

0000000000000752 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 752:	7139                	addi	sp,sp,-64
 754:	fc06                	sd	ra,56(sp)
 756:	f822                	sd	s0,48(sp)
 758:	f426                	sd	s1,40(sp)
 75a:	f04a                	sd	s2,32(sp)
 75c:	ec4e                	sd	s3,24(sp)
 75e:	e852                	sd	s4,16(sp)
 760:	e456                	sd	s5,8(sp)
 762:	e05a                	sd	s6,0(sp)
 764:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 766:	02051493          	slli	s1,a0,0x20
 76a:	9081                	srli	s1,s1,0x20
 76c:	04bd                	addi	s1,s1,15
 76e:	8091                	srli	s1,s1,0x4
 770:	00148a1b          	addiw	s4,s1,1
 774:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 776:	00000517          	auipc	a0,0x0
 77a:	14253503          	ld	a0,322(a0) # 8b8 <freep>
 77e:	c515                	beqz	a0,7aa <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 780:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 782:	4798                	lw	a4,8(a5)
 784:	04977163          	bgeu	a4,s1,7c6 <malloc+0x74>
 788:	89d2                	mv	s3,s4
 78a:	000a071b          	sext.w	a4,s4
 78e:	6685                	lui	a3,0x1
 790:	00d77363          	bgeu	a4,a3,796 <malloc+0x44>
 794:	6985                	lui	s3,0x1
 796:	00098b1b          	sext.w	s6,s3
  p = sbrk(nu * sizeof(Header));
 79a:	0049999b          	slliw	s3,s3,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 79e:	00000917          	auipc	s2,0x0
 7a2:	11a90913          	addi	s2,s2,282 # 8b8 <freep>
  if(p == (char*)-1)
 7a6:	5afd                	li	s5,-1
 7a8:	a8a5                	j	820 <malloc+0xce>
    base.s.ptr = freep = prevp = &base;
 7aa:	00000797          	auipc	a5,0x0
 7ae:	10e78793          	addi	a5,a5,270 # 8b8 <freep>
 7b2:	00000717          	auipc	a4,0x0
 7b6:	10e70713          	addi	a4,a4,270 # 8c0 <base>
 7ba:	e398                	sd	a4,0(a5)
 7bc:	e798                	sd	a4,8(a5)
    base.s.size = 0;
 7be:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7c2:	87ba                	mv	a5,a4
 7c4:	b7d1                	j	788 <malloc+0x36>
      if(p->s.size == nunits)
 7c6:	02e48c63          	beq	s1,a4,7fe <malloc+0xac>
        p->s.size -= nunits;
 7ca:	4147073b          	subw	a4,a4,s4
 7ce:	c798                	sw	a4,8(a5)
        p += p->s.size;
 7d0:	02071693          	slli	a3,a4,0x20
 7d4:	01c6d713          	srli	a4,a3,0x1c
 7d8:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 7da:	0147a423          	sw	s4,8(a5)
      freep = prevp;
 7de:	00000717          	auipc	a4,0x0
 7e2:	0ca73d23          	sd	a0,218(a4) # 8b8 <freep>
      return (void*)(p + 1);
 7e6:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 7ea:	70e2                	ld	ra,56(sp)
 7ec:	7442                	ld	s0,48(sp)
 7ee:	74a2                	ld	s1,40(sp)
 7f0:	7902                	ld	s2,32(sp)
 7f2:	69e2                	ld	s3,24(sp)
 7f4:	6a42                	ld	s4,16(sp)
 7f6:	6aa2                	ld	s5,8(sp)
 7f8:	6b02                	ld	s6,0(sp)
 7fa:	6121                	addi	sp,sp,64
 7fc:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 7fe:	6398                	ld	a4,0(a5)
 800:	e118                	sd	a4,0(a0)
 802:	bff1                	j	7de <malloc+0x8c>
  hp->s.size = nu;
 804:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 808:	0541                	addi	a0,a0,16
 80a:	00000097          	auipc	ra,0x0
 80e:	ec6080e7          	jalr	-314(ra) # 6d0 <free>
  return freep;
 812:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 816:	d971                	beqz	a0,7ea <malloc+0x98>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 818:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 81a:	4798                	lw	a4,8(a5)
 81c:	fa9775e3          	bgeu	a4,s1,7c6 <malloc+0x74>
    if(p == freep)
 820:	00093703          	ld	a4,0(s2)
 824:	853e                	mv	a0,a5
 826:	fef719e3          	bne	a4,a5,818 <malloc+0xc6>
  p = sbrk(nu * sizeof(Header));
 82a:	854e                	mv	a0,s3
 82c:	00000097          	auipc	ra,0x0
 830:	b16080e7          	jalr	-1258(ra) # 342 <sbrk>
  if(p == (char*)-1)
 834:	fd5518e3          	bne	a0,s5,804 <malloc+0xb2>
        return 0;
 838:	4501                	li	a0,0
 83a:	bf45                	j	7ea <malloc+0x98>
