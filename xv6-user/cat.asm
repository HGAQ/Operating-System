
xv6-user/_cat:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <cat>:

char buf[512];

void
cat(int fd)
{
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	ec26                	sd	s1,24(sp)
   8:	e84a                	sd	s2,16(sp)
   a:	e44e                	sd	s3,8(sp)
   c:	1800                	addi	s0,sp,48
   e:	89aa                	mv	s3,a0
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
  10:	00001917          	auipc	s2,0x1
  14:	9d890913          	addi	s2,s2,-1576 # 9e8 <buf>
  18:	20000613          	li	a2,512
  1c:	85ca                	mv	a1,s2
  1e:	854e                	mv	a0,s3
  20:	00000097          	auipc	ra,0x0
  24:	3ce080e7          	jalr	974(ra) # 3ee <read>
  28:	84aa                	mv	s1,a0
  2a:	02a05963          	blez	a0,5c <cat+0x5c>
    if (write(1, buf, n) != n) {
  2e:	8626                	mv	a2,s1
  30:	85ca                	mv	a1,s2
  32:	4505                	li	a0,1
  34:	00000097          	auipc	ra,0x0
  38:	3c2080e7          	jalr	962(ra) # 3f6 <write>
  3c:	fc950ee3          	beq	a0,s1,18 <cat+0x18>
      fprintf(2, "cat: write error\n");
  40:	00001597          	auipc	a1,0x1
  44:	8e858593          	addi	a1,a1,-1816 # 928 <malloc+0xea>
  48:	4509                	li	a0,2
  4a:	00000097          	auipc	ra,0x0
  4e:	70e080e7          	jalr	1806(ra) # 758 <fprintf>
      exit(1);
  52:	4505                	li	a0,1
  54:	00000097          	auipc	ra,0x0
  58:	382080e7          	jalr	898(ra) # 3d6 <exit>
    }
  }
  if(n < 0){
  5c:	00054963          	bltz	a0,6e <cat+0x6e>
    fprintf(2, "cat: read error\n");
    exit(1);
  }
}
  60:	70a2                	ld	ra,40(sp)
  62:	7402                	ld	s0,32(sp)
  64:	64e2                	ld	s1,24(sp)
  66:	6942                	ld	s2,16(sp)
  68:	69a2                	ld	s3,8(sp)
  6a:	6145                	addi	sp,sp,48
  6c:	8082                	ret
    fprintf(2, "cat: read error\n");
  6e:	00001597          	auipc	a1,0x1
  72:	8d258593          	addi	a1,a1,-1838 # 940 <malloc+0x102>
  76:	4509                	li	a0,2
  78:	00000097          	auipc	ra,0x0
  7c:	6e0080e7          	jalr	1760(ra) # 758 <fprintf>
    exit(1);
  80:	4505                	li	a0,1
  82:	00000097          	auipc	ra,0x0
  86:	354080e7          	jalr	852(ra) # 3d6 <exit>

000000000000008a <main>:

int
main(int argc, char *argv[])
{
  8a:	7179                	addi	sp,sp,-48
  8c:	f406                	sd	ra,40(sp)
  8e:	f022                	sd	s0,32(sp)
  90:	ec26                	sd	s1,24(sp)
  92:	e84a                	sd	s2,16(sp)
  94:	e44e                	sd	s3,8(sp)
  96:	e052                	sd	s4,0(sp)
  98:	1800                	addi	s0,sp,48
  int fd, i;

  if(argc <= 1){
  9a:	4785                	li	a5,1
  9c:	04a7d763          	bge	a5,a0,ea <main+0x60>
  a0:	00858913          	addi	s2,a1,8
  a4:	ffe5099b          	addiw	s3,a0,-2
  a8:	02099793          	slli	a5,s3,0x20
  ac:	01d7d993          	srli	s3,a5,0x1d
  b0:	05c1                	addi	a1,a1,16
  b2:	99ae                	add	s3,s3,a1
    cat(0);
    exit(0);
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  b4:	4581                	li	a1,0
  b6:	00093503          	ld	a0,0(s2)
  ba:	00000097          	auipc	ra,0x0
  be:	35c080e7          	jalr	860(ra) # 416 <open>
  c2:	84aa                	mv	s1,a0
  c4:	02054d63          	bltz	a0,fe <main+0x74>
      fprintf(2, "cat: cannot open %s\n", argv[i]);
      exit(1);
    }
    cat(fd);
  c8:	00000097          	auipc	ra,0x0
  cc:	f38080e7          	jalr	-200(ra) # 0 <cat>
    close(fd);
  d0:	8526                	mv	a0,s1
  d2:	00000097          	auipc	ra,0x0
  d6:	32c080e7          	jalr	812(ra) # 3fe <close>
  for(i = 1; i < argc; i++){
  da:	0921                	addi	s2,s2,8
  dc:	fd391ce3          	bne	s2,s3,b4 <main+0x2a>
  }
  exit(0);
  e0:	4501                	li	a0,0
  e2:	00000097          	auipc	ra,0x0
  e6:	2f4080e7          	jalr	756(ra) # 3d6 <exit>
    cat(0);
  ea:	4501                	li	a0,0
  ec:	00000097          	auipc	ra,0x0
  f0:	f14080e7          	jalr	-236(ra) # 0 <cat>
    exit(0);
  f4:	4501                	li	a0,0
  f6:	00000097          	auipc	ra,0x0
  fa:	2e0080e7          	jalr	736(ra) # 3d6 <exit>
      fprintf(2, "cat: cannot open %s\n", argv[i]);
  fe:	00093603          	ld	a2,0(s2)
 102:	00001597          	auipc	a1,0x1
 106:	85658593          	addi	a1,a1,-1962 # 958 <malloc+0x11a>
 10a:	4509                	li	a0,2
 10c:	00000097          	auipc	ra,0x0
 110:	64c080e7          	jalr	1612(ra) # 758 <fprintf>
      exit(1);
 114:	4505                	li	a0,1
 116:	00000097          	auipc	ra,0x0
 11a:	2c0080e7          	jalr	704(ra) # 3d6 <exit>

000000000000011e <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
 11e:	1141                	addi	sp,sp,-16
 120:	e422                	sd	s0,8(sp)
 122:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 124:	87aa                	mv	a5,a0
 126:	0585                	addi	a1,a1,1
 128:	0785                	addi	a5,a5,1
 12a:	fff5c703          	lbu	a4,-1(a1)
 12e:	fee78fa3          	sb	a4,-1(a5)
 132:	fb75                	bnez	a4,126 <strcpy+0x8>
    ;
  return os;
}
 134:	6422                	ld	s0,8(sp)
 136:	0141                	addi	sp,sp,16
 138:	8082                	ret

000000000000013a <strcat>:

char*
strcat(char *s, const char *t)
{
 13a:	1141                	addi	sp,sp,-16
 13c:	e422                	sd	s0,8(sp)
 13e:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
 140:	00054783          	lbu	a5,0(a0)
 144:	c385                	beqz	a5,164 <strcat+0x2a>
 146:	87aa                	mv	a5,a0
    s++;
 148:	0785                	addi	a5,a5,1
  while(*s)
 14a:	0007c703          	lbu	a4,0(a5)
 14e:	ff6d                	bnez	a4,148 <strcat+0xe>
  while((*s++ = *t++))
 150:	0585                	addi	a1,a1,1
 152:	0785                	addi	a5,a5,1
 154:	fff5c703          	lbu	a4,-1(a1)
 158:	fee78fa3          	sb	a4,-1(a5)
 15c:	fb75                	bnez	a4,150 <strcat+0x16>
    ;
  return os;
}
 15e:	6422                	ld	s0,8(sp)
 160:	0141                	addi	sp,sp,16
 162:	8082                	ret
  while(*s)
 164:	87aa                	mv	a5,a0
 166:	b7ed                	j	150 <strcat+0x16>

0000000000000168 <strcmp>:


int
strcmp(const char *p, const char *q)
{
 168:	1141                	addi	sp,sp,-16
 16a:	e422                	sd	s0,8(sp)
 16c:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 16e:	00054783          	lbu	a5,0(a0)
 172:	cb91                	beqz	a5,186 <strcmp+0x1e>
 174:	0005c703          	lbu	a4,0(a1)
 178:	00f71763          	bne	a4,a5,186 <strcmp+0x1e>
    p++, q++;
 17c:	0505                	addi	a0,a0,1
 17e:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 180:	00054783          	lbu	a5,0(a0)
 184:	fbe5                	bnez	a5,174 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 186:	0005c503          	lbu	a0,0(a1)
}
 18a:	40a7853b          	subw	a0,a5,a0
 18e:	6422                	ld	s0,8(sp)
 190:	0141                	addi	sp,sp,16
 192:	8082                	ret

0000000000000194 <strlen>:

uint
strlen(const char *s)
{
 194:	1141                	addi	sp,sp,-16
 196:	e422                	sd	s0,8(sp)
 198:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 19a:	00054783          	lbu	a5,0(a0)
 19e:	cf91                	beqz	a5,1ba <strlen+0x26>
 1a0:	0505                	addi	a0,a0,1
 1a2:	87aa                	mv	a5,a0
 1a4:	4685                	li	a3,1
 1a6:	9e89                	subw	a3,a3,a0
 1a8:	00f6853b          	addw	a0,a3,a5
 1ac:	0785                	addi	a5,a5,1
 1ae:	fff7c703          	lbu	a4,-1(a5)
 1b2:	fb7d                	bnez	a4,1a8 <strlen+0x14>
    ;
  return n;
}
 1b4:	6422                	ld	s0,8(sp)
 1b6:	0141                	addi	sp,sp,16
 1b8:	8082                	ret
  for(n = 0; s[n]; n++)
 1ba:	4501                	li	a0,0
 1bc:	bfe5                	j	1b4 <strlen+0x20>

00000000000001be <memset>:

void*
memset(void *dst, int c, uint n)
{
 1be:	1141                	addi	sp,sp,-16
 1c0:	e422                	sd	s0,8(sp)
 1c2:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 1c4:	ca19                	beqz	a2,1da <memset+0x1c>
 1c6:	87aa                	mv	a5,a0
 1c8:	1602                	slli	a2,a2,0x20
 1ca:	9201                	srli	a2,a2,0x20
 1cc:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 1d0:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 1d4:	0785                	addi	a5,a5,1
 1d6:	fee79de3          	bne	a5,a4,1d0 <memset+0x12>
  }
  return dst;
}
 1da:	6422                	ld	s0,8(sp)
 1dc:	0141                	addi	sp,sp,16
 1de:	8082                	ret

00000000000001e0 <strchr>:

char*
strchr(const char *s, char c)
{
 1e0:	1141                	addi	sp,sp,-16
 1e2:	e422                	sd	s0,8(sp)
 1e4:	0800                	addi	s0,sp,16
  for(; *s; s++)
 1e6:	00054783          	lbu	a5,0(a0)
 1ea:	cb99                	beqz	a5,200 <strchr+0x20>
    if(*s == c)
 1ec:	00f58763          	beq	a1,a5,1fa <strchr+0x1a>
  for(; *s; s++)
 1f0:	0505                	addi	a0,a0,1
 1f2:	00054783          	lbu	a5,0(a0)
 1f6:	fbfd                	bnez	a5,1ec <strchr+0xc>
      return (char*)s;
  return 0;
 1f8:	4501                	li	a0,0
}
 1fa:	6422                	ld	s0,8(sp)
 1fc:	0141                	addi	sp,sp,16
 1fe:	8082                	ret
  return 0;
 200:	4501                	li	a0,0
 202:	bfe5                	j	1fa <strchr+0x1a>

0000000000000204 <gets>:

char*
gets(char *buf, int max)
{
 204:	711d                	addi	sp,sp,-96
 206:	ec86                	sd	ra,88(sp)
 208:	e8a2                	sd	s0,80(sp)
 20a:	e4a6                	sd	s1,72(sp)
 20c:	e0ca                	sd	s2,64(sp)
 20e:	fc4e                	sd	s3,56(sp)
 210:	f852                	sd	s4,48(sp)
 212:	f456                	sd	s5,40(sp)
 214:	f05a                	sd	s6,32(sp)
 216:	ec5e                	sd	s7,24(sp)
 218:	e862                	sd	s8,16(sp)
 21a:	1080                	addi	s0,sp,96
 21c:	8baa                	mv	s7,a0
 21e:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 220:	892a                	mv	s2,a0
 222:	4481                	li	s1,0
    cc = read(0, &c, 1);
 224:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 228:	4b29                	li	s6,10
 22a:	4c35                	li	s8,13
  for(i=0; i+1 < max; ){
 22c:	89a6                	mv	s3,s1
 22e:	2485                	addiw	s1,s1,1
 230:	0344d763          	bge	s1,s4,25e <gets+0x5a>
    cc = read(0, &c, 1);
 234:	4605                	li	a2,1
 236:	85d6                	mv	a1,s5
 238:	4501                	li	a0,0
 23a:	00000097          	auipc	ra,0x0
 23e:	1b4080e7          	jalr	436(ra) # 3ee <read>
    if(cc < 1)
 242:	00a05e63          	blez	a0,25e <gets+0x5a>
    buf[i++] = c;
 246:	faf44783          	lbu	a5,-81(s0)
 24a:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 24e:	01678763          	beq	a5,s6,25c <gets+0x58>
 252:	0905                	addi	s2,s2,1
 254:	fd879ce3          	bne	a5,s8,22c <gets+0x28>
  for(i=0; i+1 < max; ){
 258:	89a6                	mv	s3,s1
 25a:	a011                	j	25e <gets+0x5a>
 25c:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 25e:	99de                	add	s3,s3,s7
 260:	00098023          	sb	zero,0(s3)
  return buf;
}
 264:	855e                	mv	a0,s7
 266:	60e6                	ld	ra,88(sp)
 268:	6446                	ld	s0,80(sp)
 26a:	64a6                	ld	s1,72(sp)
 26c:	6906                	ld	s2,64(sp)
 26e:	79e2                	ld	s3,56(sp)
 270:	7a42                	ld	s4,48(sp)
 272:	7aa2                	ld	s5,40(sp)
 274:	7b02                	ld	s6,32(sp)
 276:	6be2                	ld	s7,24(sp)
 278:	6c42                	ld	s8,16(sp)
 27a:	6125                	addi	sp,sp,96
 27c:	8082                	ret

000000000000027e <stat>:

int
stat(const char *n, struct stat *st)
{
 27e:	1101                	addi	sp,sp,-32
 280:	ec06                	sd	ra,24(sp)
 282:	e822                	sd	s0,16(sp)
 284:	e426                	sd	s1,8(sp)
 286:	e04a                	sd	s2,0(sp)
 288:	1000                	addi	s0,sp,32
 28a:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 28c:	4581                	li	a1,0
 28e:	00000097          	auipc	ra,0x0
 292:	188080e7          	jalr	392(ra) # 416 <open>
  if(fd < 0)
 296:	02054563          	bltz	a0,2c0 <stat+0x42>
 29a:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 29c:	85ca                	mv	a1,s2
 29e:	00000097          	auipc	ra,0x0
 2a2:	180080e7          	jalr	384(ra) # 41e <fstat>
 2a6:	892a                	mv	s2,a0
  close(fd);
 2a8:	8526                	mv	a0,s1
 2aa:	00000097          	auipc	ra,0x0
 2ae:	154080e7          	jalr	340(ra) # 3fe <close>
  return r;
}
 2b2:	854a                	mv	a0,s2
 2b4:	60e2                	ld	ra,24(sp)
 2b6:	6442                	ld	s0,16(sp)
 2b8:	64a2                	ld	s1,8(sp)
 2ba:	6902                	ld	s2,0(sp)
 2bc:	6105                	addi	sp,sp,32
 2be:	8082                	ret
    return -1;
 2c0:	597d                	li	s2,-1
 2c2:	bfc5                	j	2b2 <stat+0x34>

00000000000002c4 <atoi>:

int
atoi(const char *s)
{
 2c4:	1141                	addi	sp,sp,-16
 2c6:	e422                	sd	s0,8(sp)
 2c8:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 2ca:	00054703          	lbu	a4,0(a0)
 2ce:	02d00793          	li	a5,45
  int neg = 1;
 2d2:	4585                	li	a1,1
  if (*s == '-') {
 2d4:	04f70363          	beq	a4,a5,31a <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 2d8:	00054703          	lbu	a4,0(a0)
 2dc:	fd07079b          	addiw	a5,a4,-48
 2e0:	0ff7f793          	zext.b	a5,a5
 2e4:	46a5                	li	a3,9
 2e6:	02f6ed63          	bltu	a3,a5,320 <atoi+0x5c>
  n = 0;
 2ea:	4681                	li	a3,0
  while('0' <= *s && *s <= '9')
 2ec:	4625                	li	a2,9
    n = n*10 + *s++ - '0';
 2ee:	0505                	addi	a0,a0,1
 2f0:	0026979b          	slliw	a5,a3,0x2
 2f4:	9fb5                	addw	a5,a5,a3
 2f6:	0017979b          	slliw	a5,a5,0x1
 2fa:	9fb9                	addw	a5,a5,a4
 2fc:	fd07869b          	addiw	a3,a5,-48
  while('0' <= *s && *s <= '9')
 300:	00054703          	lbu	a4,0(a0)
 304:	fd07079b          	addiw	a5,a4,-48
 308:	0ff7f793          	zext.b	a5,a5
 30c:	fef671e3          	bgeu	a2,a5,2ee <atoi+0x2a>
  return n * neg;
}
 310:	02d5853b          	mulw	a0,a1,a3
 314:	6422                	ld	s0,8(sp)
 316:	0141                	addi	sp,sp,16
 318:	8082                	ret
    s++;
 31a:	0505                	addi	a0,a0,1
    neg = -1;
 31c:	55fd                	li	a1,-1
 31e:	bf6d                	j	2d8 <atoi+0x14>
  n = 0;
 320:	4681                	li	a3,0
 322:	b7fd                	j	310 <atoi+0x4c>

0000000000000324 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 324:	1141                	addi	sp,sp,-16
 326:	e422                	sd	s0,8(sp)
 328:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 32a:	02b57463          	bgeu	a0,a1,352 <memmove+0x2e>
    while(n-- > 0)
 32e:	00c05f63          	blez	a2,34c <memmove+0x28>
 332:	1602                	slli	a2,a2,0x20
 334:	9201                	srli	a2,a2,0x20
 336:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 33a:	872a                	mv	a4,a0
      *dst++ = *src++;
 33c:	0585                	addi	a1,a1,1
 33e:	0705                	addi	a4,a4,1
 340:	fff5c683          	lbu	a3,-1(a1)
 344:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 348:	fee79ae3          	bne	a5,a4,33c <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 34c:	6422                	ld	s0,8(sp)
 34e:	0141                	addi	sp,sp,16
 350:	8082                	ret
    dst += n;
 352:	00c50733          	add	a4,a0,a2
    src += n;
 356:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 358:	fec05ae3          	blez	a2,34c <memmove+0x28>
 35c:	fff6079b          	addiw	a5,a2,-1
 360:	1782                	slli	a5,a5,0x20
 362:	9381                	srli	a5,a5,0x20
 364:	fff7c793          	not	a5,a5
 368:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 36a:	15fd                	addi	a1,a1,-1
 36c:	177d                	addi	a4,a4,-1
 36e:	0005c683          	lbu	a3,0(a1)
 372:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 376:	fee79ae3          	bne	a5,a4,36a <memmove+0x46>
 37a:	bfc9                	j	34c <memmove+0x28>

000000000000037c <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 37c:	1141                	addi	sp,sp,-16
 37e:	e422                	sd	s0,8(sp)
 380:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 382:	ca05                	beqz	a2,3b2 <memcmp+0x36>
 384:	fff6069b          	addiw	a3,a2,-1
 388:	1682                	slli	a3,a3,0x20
 38a:	9281                	srli	a3,a3,0x20
 38c:	0685                	addi	a3,a3,1
 38e:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 390:	00054783          	lbu	a5,0(a0)
 394:	0005c703          	lbu	a4,0(a1)
 398:	00e79863          	bne	a5,a4,3a8 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 39c:	0505                	addi	a0,a0,1
    p2++;
 39e:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 3a0:	fed518e3          	bne	a0,a3,390 <memcmp+0x14>
  }
  return 0;
 3a4:	4501                	li	a0,0
 3a6:	a019                	j	3ac <memcmp+0x30>
      return *p1 - *p2;
 3a8:	40e7853b          	subw	a0,a5,a4
}
 3ac:	6422                	ld	s0,8(sp)
 3ae:	0141                	addi	sp,sp,16
 3b0:	8082                	ret
  return 0;
 3b2:	4501                	li	a0,0
 3b4:	bfe5                	j	3ac <memcmp+0x30>

00000000000003b6 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 3b6:	1141                	addi	sp,sp,-16
 3b8:	e406                	sd	ra,8(sp)
 3ba:	e022                	sd	s0,0(sp)
 3bc:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 3be:	00000097          	auipc	ra,0x0
 3c2:	f66080e7          	jalr	-154(ra) # 324 <memmove>
}
 3c6:	60a2                	ld	ra,8(sp)
 3c8:	6402                	ld	s0,0(sp)
 3ca:	0141                	addi	sp,sp,16
 3cc:	8082                	ret

00000000000003ce <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 3ce:	4885                	li	a7,1
 ecall
 3d0:	00000073          	ecall
 ret
 3d4:	8082                	ret

00000000000003d6 <exit>:
.global exit
exit:
 li a7, SYS_exit
 3d6:	4889                	li	a7,2
 ecall
 3d8:	00000073          	ecall
 ret
 3dc:	8082                	ret

00000000000003de <wait>:
.global wait
wait:
 li a7, SYS_wait
 3de:	488d                	li	a7,3
 ecall
 3e0:	00000073          	ecall
 ret
 3e4:	8082                	ret

00000000000003e6 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 3e6:	4891                	li	a7,4
 ecall
 3e8:	00000073          	ecall
 ret
 3ec:	8082                	ret

00000000000003ee <read>:
.global read
read:
 li a7, SYS_read
 3ee:	4895                	li	a7,5
 ecall
 3f0:	00000073          	ecall
 ret
 3f4:	8082                	ret

00000000000003f6 <write>:
.global write
write:
 li a7, SYS_write
 3f6:	48c1                	li	a7,16
 ecall
 3f8:	00000073          	ecall
 ret
 3fc:	8082                	ret

00000000000003fe <close>:
.global close
close:
 li a7, SYS_close
 3fe:	48d5                	li	a7,21
 ecall
 400:	00000073          	ecall
 ret
 404:	8082                	ret

0000000000000406 <kill>:
.global kill
kill:
 li a7, SYS_kill
 406:	4899                	li	a7,6
 ecall
 408:	00000073          	ecall
 ret
 40c:	8082                	ret

000000000000040e <exec>:
.global exec
exec:
 li a7, SYS_exec
 40e:	489d                	li	a7,7
 ecall
 410:	00000073          	ecall
 ret
 414:	8082                	ret

0000000000000416 <open>:
.global open
open:
 li a7, SYS_open
 416:	48bd                	li	a7,15
 ecall
 418:	00000073          	ecall
 ret
 41c:	8082                	ret

000000000000041e <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 41e:	48a1                	li	a7,8
 ecall
 420:	00000073          	ecall
 ret
 424:	8082                	ret

0000000000000426 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 426:	48d1                	li	a7,20
 ecall
 428:	00000073          	ecall
 ret
 42c:	8082                	ret

000000000000042e <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 42e:	48a5                	li	a7,9
 ecall
 430:	00000073          	ecall
 ret
 434:	8082                	ret

0000000000000436 <dup>:
.global dup
dup:
 li a7, SYS_dup
 436:	48a9                	li	a7,10
 ecall
 438:	00000073          	ecall
 ret
 43c:	8082                	ret

000000000000043e <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 43e:	48ad                	li	a7,11
 ecall
 440:	00000073          	ecall
 ret
 444:	8082                	ret

0000000000000446 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 446:	48b1                	li	a7,12
 ecall
 448:	00000073          	ecall
 ret
 44c:	8082                	ret

000000000000044e <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 44e:	48b5                	li	a7,13
 ecall
 450:	00000073          	ecall
 ret
 454:	8082                	ret

0000000000000456 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 456:	48b9                	li	a7,14
 ecall
 458:	00000073          	ecall
 ret
 45c:	8082                	ret

000000000000045e <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 45e:	48d9                	li	a7,22
 ecall
 460:	00000073          	ecall
 ret
 464:	8082                	ret

0000000000000466 <dev>:
.global dev
dev:
 li a7, SYS_dev
 466:	0e900893          	li	a7,233
 ecall
 46a:	00000073          	ecall
 ret
 46e:	8082                	ret

0000000000000470 <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 470:	0f400893          	li	a7,244
 ecall
 474:	00000073          	ecall
 ret
 478:	8082                	ret

000000000000047a <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 47a:	48e5                	li	a7,25
 ecall
 47c:	00000073          	ecall
 ret
 480:	8082                	ret

0000000000000482 <remove>:
.global remove
remove:
 li a7, SYS_remove
 482:	0b100893          	li	a7,177
 ecall
 486:	00000073          	ecall
 ret
 48a:	8082                	ret

000000000000048c <trace>:
.global trace
trace:
 li a7, SYS_trace
 48c:	48c9                	li	a7,18
 ecall
 48e:	00000073          	ecall
 ret
 492:	8082                	ret

0000000000000494 <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 494:	48cd                	li	a7,19
 ecall
 496:	00000073          	ecall
 ret
 49a:	8082                	ret

000000000000049c <rename>:
.global rename
rename:
 li a7, SYS_rename
 49c:	48e9                	li	a7,26
 ecall
 49e:	00000073          	ecall
 ret
 4a2:	8082                	ret

00000000000004a4 <poweroff>:
.global poweroff
poweroff:
 li a7, SYS_poweroff
 4a4:	0d200893          	li	a7,210
 ecall
 4a8:	00000073          	ecall
 ret
 4ac:	8082                	ret

00000000000004ae <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 4ae:	1101                	addi	sp,sp,-32
 4b0:	ec06                	sd	ra,24(sp)
 4b2:	e822                	sd	s0,16(sp)
 4b4:	1000                	addi	s0,sp,32
 4b6:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 4ba:	4605                	li	a2,1
 4bc:	fef40593          	addi	a1,s0,-17
 4c0:	00000097          	auipc	ra,0x0
 4c4:	f36080e7          	jalr	-202(ra) # 3f6 <write>
}
 4c8:	60e2                	ld	ra,24(sp)
 4ca:	6442                	ld	s0,16(sp)
 4cc:	6105                	addi	sp,sp,32
 4ce:	8082                	ret

00000000000004d0 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4d0:	7139                	addi	sp,sp,-64
 4d2:	fc06                	sd	ra,56(sp)
 4d4:	f822                	sd	s0,48(sp)
 4d6:	f426                	sd	s1,40(sp)
 4d8:	f04a                	sd	s2,32(sp)
 4da:	ec4e                	sd	s3,24(sp)
 4dc:	0080                	addi	s0,sp,64
 4de:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4e0:	c299                	beqz	a3,4e6 <printint+0x16>
 4e2:	0805c863          	bltz	a1,572 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 4e6:	2581                	sext.w	a1,a1
  neg = 0;
 4e8:	4881                	li	a7,0
  }

  i = 0;
 4ea:	fc040993          	addi	s3,s0,-64
  neg = 0;
 4ee:	86ce                	mv	a3,s3
  i = 0;
 4f0:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 4f2:	2601                	sext.w	a2,a2
 4f4:	00000517          	auipc	a0,0x0
 4f8:	4dc50513          	addi	a0,a0,1244 # 9d0 <digits>
 4fc:	883a                	mv	a6,a4
 4fe:	2705                	addiw	a4,a4,1
 500:	02c5f7bb          	remuw	a5,a1,a2
 504:	1782                	slli	a5,a5,0x20
 506:	9381                	srli	a5,a5,0x20
 508:	97aa                	add	a5,a5,a0
 50a:	0007c783          	lbu	a5,0(a5)
 50e:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 512:	0005879b          	sext.w	a5,a1
 516:	02c5d5bb          	divuw	a1,a1,a2
 51a:	0685                	addi	a3,a3,1
 51c:	fec7f0e3          	bgeu	a5,a2,4fc <printint+0x2c>
  if(neg)
 520:	00088c63          	beqz	a7,538 <printint+0x68>
    buf[i++] = '-';
 524:	fd070793          	addi	a5,a4,-48
 528:	00878733          	add	a4,a5,s0
 52c:	02d00793          	li	a5,45
 530:	fef70823          	sb	a5,-16(a4)
 534:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 538:	02e05663          	blez	a4,564 <printint+0x94>
 53c:	fc040913          	addi	s2,s0,-64
 540:	993a                	add	s2,s2,a4
 542:	19fd                	addi	s3,s3,-1
 544:	99ba                	add	s3,s3,a4
 546:	377d                	addiw	a4,a4,-1
 548:	1702                	slli	a4,a4,0x20
 54a:	9301                	srli	a4,a4,0x20
 54c:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 550:	fff94583          	lbu	a1,-1(s2)
 554:	8526                	mv	a0,s1
 556:	00000097          	auipc	ra,0x0
 55a:	f58080e7          	jalr	-168(ra) # 4ae <putc>
  while(--i >= 0)
 55e:	197d                	addi	s2,s2,-1
 560:	ff3918e3          	bne	s2,s3,550 <printint+0x80>
}
 564:	70e2                	ld	ra,56(sp)
 566:	7442                	ld	s0,48(sp)
 568:	74a2                	ld	s1,40(sp)
 56a:	7902                	ld	s2,32(sp)
 56c:	69e2                	ld	s3,24(sp)
 56e:	6121                	addi	sp,sp,64
 570:	8082                	ret
    x = -xx;
 572:	40b005bb          	negw	a1,a1
    neg = 1;
 576:	4885                	li	a7,1
    x = -xx;
 578:	bf8d                	j	4ea <printint+0x1a>

000000000000057a <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 57a:	7119                	addi	sp,sp,-128
 57c:	fc86                	sd	ra,120(sp)
 57e:	f8a2                	sd	s0,112(sp)
 580:	f4a6                	sd	s1,104(sp)
 582:	f0ca                	sd	s2,96(sp)
 584:	ecce                	sd	s3,88(sp)
 586:	e8d2                	sd	s4,80(sp)
 588:	e4d6                	sd	s5,72(sp)
 58a:	e0da                	sd	s6,64(sp)
 58c:	fc5e                	sd	s7,56(sp)
 58e:	f862                	sd	s8,48(sp)
 590:	f466                	sd	s9,40(sp)
 592:	f06a                	sd	s10,32(sp)
 594:	ec6e                	sd	s11,24(sp)
 596:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 598:	0005c903          	lbu	s2,0(a1)
 59c:	18090f63          	beqz	s2,73a <vprintf+0x1c0>
 5a0:	8aaa                	mv	s5,a0
 5a2:	8b32                	mv	s6,a2
 5a4:	00158493          	addi	s1,a1,1
  state = 0;
 5a8:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 5aa:	02500a13          	li	s4,37
 5ae:	4c55                	li	s8,21
 5b0:	00000c97          	auipc	s9,0x0
 5b4:	3c8c8c93          	addi	s9,s9,968 # 978 <malloc+0x13a>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
        s = va_arg(ap, char*);
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5b8:	02800d93          	li	s11,40
  putc(fd, 'x');
 5bc:	4d41                	li	s10,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 5be:	00000b97          	auipc	s7,0x0
 5c2:	412b8b93          	addi	s7,s7,1042 # 9d0 <digits>
 5c6:	a839                	j	5e4 <vprintf+0x6a>
        putc(fd, c);
 5c8:	85ca                	mv	a1,s2
 5ca:	8556                	mv	a0,s5
 5cc:	00000097          	auipc	ra,0x0
 5d0:	ee2080e7          	jalr	-286(ra) # 4ae <putc>
 5d4:	a019                	j	5da <vprintf+0x60>
    } else if(state == '%'){
 5d6:	01498d63          	beq	s3,s4,5f0 <vprintf+0x76>
  for(i = 0; fmt[i]; i++){
 5da:	0485                	addi	s1,s1,1
 5dc:	fff4c903          	lbu	s2,-1(s1)
 5e0:	14090d63          	beqz	s2,73a <vprintf+0x1c0>
    if(state == 0){
 5e4:	fe0999e3          	bnez	s3,5d6 <vprintf+0x5c>
      if(c == '%'){
 5e8:	ff4910e3          	bne	s2,s4,5c8 <vprintf+0x4e>
        state = '%';
 5ec:	89d2                	mv	s3,s4
 5ee:	b7f5                	j	5da <vprintf+0x60>
      if(c == 'd'){
 5f0:	11490c63          	beq	s2,s4,708 <vprintf+0x18e>
 5f4:	f9d9079b          	addiw	a5,s2,-99
 5f8:	0ff7f793          	zext.b	a5,a5
 5fc:	10fc6e63          	bltu	s8,a5,718 <vprintf+0x19e>
 600:	f9d9079b          	addiw	a5,s2,-99
 604:	0ff7f713          	zext.b	a4,a5
 608:	10ec6863          	bltu	s8,a4,718 <vprintf+0x19e>
 60c:	00271793          	slli	a5,a4,0x2
 610:	97e6                	add	a5,a5,s9
 612:	439c                	lw	a5,0(a5)
 614:	97e6                	add	a5,a5,s9
 616:	8782                	jr	a5
        printint(fd, va_arg(ap, int), 10, 1);
 618:	008b0913          	addi	s2,s6,8
 61c:	4685                	li	a3,1
 61e:	4629                	li	a2,10
 620:	000b2583          	lw	a1,0(s6)
 624:	8556                	mv	a0,s5
 626:	00000097          	auipc	ra,0x0
 62a:	eaa080e7          	jalr	-342(ra) # 4d0 <printint>
 62e:	8b4a                	mv	s6,s2
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 630:	4981                	li	s3,0
 632:	b765                	j	5da <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 634:	008b0913          	addi	s2,s6,8
 638:	4681                	li	a3,0
 63a:	4629                	li	a2,10
 63c:	000b2583          	lw	a1,0(s6)
 640:	8556                	mv	a0,s5
 642:	00000097          	auipc	ra,0x0
 646:	e8e080e7          	jalr	-370(ra) # 4d0 <printint>
 64a:	8b4a                	mv	s6,s2
      state = 0;
 64c:	4981                	li	s3,0
 64e:	b771                	j	5da <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 650:	008b0913          	addi	s2,s6,8
 654:	4681                	li	a3,0
 656:	866a                	mv	a2,s10
 658:	000b2583          	lw	a1,0(s6)
 65c:	8556                	mv	a0,s5
 65e:	00000097          	auipc	ra,0x0
 662:	e72080e7          	jalr	-398(ra) # 4d0 <printint>
 666:	8b4a                	mv	s6,s2
      state = 0;
 668:	4981                	li	s3,0
 66a:	bf85                	j	5da <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 66c:	008b0793          	addi	a5,s6,8
 670:	f8f43423          	sd	a5,-120(s0)
 674:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 678:	03000593          	li	a1,48
 67c:	8556                	mv	a0,s5
 67e:	00000097          	auipc	ra,0x0
 682:	e30080e7          	jalr	-464(ra) # 4ae <putc>
  putc(fd, 'x');
 686:	07800593          	li	a1,120
 68a:	8556                	mv	a0,s5
 68c:	00000097          	auipc	ra,0x0
 690:	e22080e7          	jalr	-478(ra) # 4ae <putc>
 694:	896a                	mv	s2,s10
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 696:	03c9d793          	srli	a5,s3,0x3c
 69a:	97de                	add	a5,a5,s7
 69c:	0007c583          	lbu	a1,0(a5)
 6a0:	8556                	mv	a0,s5
 6a2:	00000097          	auipc	ra,0x0
 6a6:	e0c080e7          	jalr	-500(ra) # 4ae <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 6aa:	0992                	slli	s3,s3,0x4
 6ac:	397d                	addiw	s2,s2,-1
 6ae:	fe0914e3          	bnez	s2,696 <vprintf+0x11c>
        printptr(fd, va_arg(ap, uint64));
 6b2:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 6b6:	4981                	li	s3,0
 6b8:	b70d                	j	5da <vprintf+0x60>
        s = va_arg(ap, char*);
 6ba:	008b0913          	addi	s2,s6,8
 6be:	000b3983          	ld	s3,0(s6)
        if(s == 0)
 6c2:	02098163          	beqz	s3,6e4 <vprintf+0x16a>
        while(*s != 0){
 6c6:	0009c583          	lbu	a1,0(s3)
 6ca:	c5ad                	beqz	a1,734 <vprintf+0x1ba>
          putc(fd, *s);
 6cc:	8556                	mv	a0,s5
 6ce:	00000097          	auipc	ra,0x0
 6d2:	de0080e7          	jalr	-544(ra) # 4ae <putc>
          s++;
 6d6:	0985                	addi	s3,s3,1
        while(*s != 0){
 6d8:	0009c583          	lbu	a1,0(s3)
 6dc:	f9e5                	bnez	a1,6cc <vprintf+0x152>
        s = va_arg(ap, char*);
 6de:	8b4a                	mv	s6,s2
      state = 0;
 6e0:	4981                	li	s3,0
 6e2:	bde5                	j	5da <vprintf+0x60>
          s = "(null)";
 6e4:	00000997          	auipc	s3,0x0
 6e8:	28c98993          	addi	s3,s3,652 # 970 <malloc+0x132>
        while(*s != 0){
 6ec:	85ee                	mv	a1,s11
 6ee:	bff9                	j	6cc <vprintf+0x152>
        putc(fd, va_arg(ap, uint));
 6f0:	008b0913          	addi	s2,s6,8
 6f4:	000b4583          	lbu	a1,0(s6)
 6f8:	8556                	mv	a0,s5
 6fa:	00000097          	auipc	ra,0x0
 6fe:	db4080e7          	jalr	-588(ra) # 4ae <putc>
 702:	8b4a                	mv	s6,s2
      state = 0;
 704:	4981                	li	s3,0
 706:	bdd1                	j	5da <vprintf+0x60>
        putc(fd, c);
 708:	85d2                	mv	a1,s4
 70a:	8556                	mv	a0,s5
 70c:	00000097          	auipc	ra,0x0
 710:	da2080e7          	jalr	-606(ra) # 4ae <putc>
      state = 0;
 714:	4981                	li	s3,0
 716:	b5d1                	j	5da <vprintf+0x60>
        putc(fd, '%');
 718:	85d2                	mv	a1,s4
 71a:	8556                	mv	a0,s5
 71c:	00000097          	auipc	ra,0x0
 720:	d92080e7          	jalr	-622(ra) # 4ae <putc>
        putc(fd, c);
 724:	85ca                	mv	a1,s2
 726:	8556                	mv	a0,s5
 728:	00000097          	auipc	ra,0x0
 72c:	d86080e7          	jalr	-634(ra) # 4ae <putc>
      state = 0;
 730:	4981                	li	s3,0
 732:	b565                	j	5da <vprintf+0x60>
        s = va_arg(ap, char*);
 734:	8b4a                	mv	s6,s2
      state = 0;
 736:	4981                	li	s3,0
 738:	b54d                	j	5da <vprintf+0x60>
    }
  }
}
 73a:	70e6                	ld	ra,120(sp)
 73c:	7446                	ld	s0,112(sp)
 73e:	74a6                	ld	s1,104(sp)
 740:	7906                	ld	s2,96(sp)
 742:	69e6                	ld	s3,88(sp)
 744:	6a46                	ld	s4,80(sp)
 746:	6aa6                	ld	s5,72(sp)
 748:	6b06                	ld	s6,64(sp)
 74a:	7be2                	ld	s7,56(sp)
 74c:	7c42                	ld	s8,48(sp)
 74e:	7ca2                	ld	s9,40(sp)
 750:	7d02                	ld	s10,32(sp)
 752:	6de2                	ld	s11,24(sp)
 754:	6109                	addi	sp,sp,128
 756:	8082                	ret

0000000000000758 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 758:	715d                	addi	sp,sp,-80
 75a:	ec06                	sd	ra,24(sp)
 75c:	e822                	sd	s0,16(sp)
 75e:	1000                	addi	s0,sp,32
 760:	e010                	sd	a2,0(s0)
 762:	e414                	sd	a3,8(s0)
 764:	e818                	sd	a4,16(s0)
 766:	ec1c                	sd	a5,24(s0)
 768:	03043023          	sd	a6,32(s0)
 76c:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 770:	8622                	mv	a2,s0
 772:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 776:	00000097          	auipc	ra,0x0
 77a:	e04080e7          	jalr	-508(ra) # 57a <vprintf>
}
 77e:	60e2                	ld	ra,24(sp)
 780:	6442                	ld	s0,16(sp)
 782:	6161                	addi	sp,sp,80
 784:	8082                	ret

0000000000000786 <printf>:

void
printf(const char *fmt, ...)
{
 786:	711d                	addi	sp,sp,-96
 788:	ec06                	sd	ra,24(sp)
 78a:	e822                	sd	s0,16(sp)
 78c:	1000                	addi	s0,sp,32
 78e:	e40c                	sd	a1,8(s0)
 790:	e810                	sd	a2,16(s0)
 792:	ec14                	sd	a3,24(s0)
 794:	f018                	sd	a4,32(s0)
 796:	f41c                	sd	a5,40(s0)
 798:	03043823          	sd	a6,48(s0)
 79c:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 7a0:	00840613          	addi	a2,s0,8
 7a4:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 7a8:	85aa                	mv	a1,a0
 7aa:	4505                	li	a0,1
 7ac:	00000097          	auipc	ra,0x0
 7b0:	dce080e7          	jalr	-562(ra) # 57a <vprintf>
}
 7b4:	60e2                	ld	ra,24(sp)
 7b6:	6442                	ld	s0,16(sp)
 7b8:	6125                	addi	sp,sp,96
 7ba:	8082                	ret

00000000000007bc <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7bc:	1141                	addi	sp,sp,-16
 7be:	e422                	sd	s0,8(sp)
 7c0:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7c2:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7c6:	00000797          	auipc	a5,0x0
 7ca:	4227b783          	ld	a5,1058(a5) # be8 <freep>
 7ce:	a02d                	j	7f8 <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 7d0:	4618                	lw	a4,8(a2)
 7d2:	9f2d                	addw	a4,a4,a1
 7d4:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 7d8:	6398                	ld	a4,0(a5)
 7da:	6310                	ld	a2,0(a4)
 7dc:	a83d                	j	81a <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 7de:	ff852703          	lw	a4,-8(a0)
 7e2:	9f31                	addw	a4,a4,a2
 7e4:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 7e6:	ff053683          	ld	a3,-16(a0)
 7ea:	a091                	j	82e <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7ec:	6398                	ld	a4,0(a5)
 7ee:	00e7e463          	bltu	a5,a4,7f6 <free+0x3a>
 7f2:	00e6ea63          	bltu	a3,a4,806 <free+0x4a>
{
 7f6:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7f8:	fed7fae3          	bgeu	a5,a3,7ec <free+0x30>
 7fc:	6398                	ld	a4,0(a5)
 7fe:	00e6e463          	bltu	a3,a4,806 <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 802:	fee7eae3          	bltu	a5,a4,7f6 <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
 806:	ff852583          	lw	a1,-8(a0)
 80a:	6390                	ld	a2,0(a5)
 80c:	02059813          	slli	a6,a1,0x20
 810:	01c85713          	srli	a4,a6,0x1c
 814:	9736                	add	a4,a4,a3
 816:	fae60de3          	beq	a2,a4,7d0 <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
 81a:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 81e:	4790                	lw	a2,8(a5)
 820:	02061593          	slli	a1,a2,0x20
 824:	01c5d713          	srli	a4,a1,0x1c
 828:	973e                	add	a4,a4,a5
 82a:	fae68ae3          	beq	a3,a4,7de <free+0x22>
    p->s.ptr = bp->s.ptr;
 82e:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 830:	00000717          	auipc	a4,0x0
 834:	3af73c23          	sd	a5,952(a4) # be8 <freep>
}
 838:	6422                	ld	s0,8(sp)
 83a:	0141                	addi	sp,sp,16
 83c:	8082                	ret

000000000000083e <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 83e:	7139                	addi	sp,sp,-64
 840:	fc06                	sd	ra,56(sp)
 842:	f822                	sd	s0,48(sp)
 844:	f426                	sd	s1,40(sp)
 846:	f04a                	sd	s2,32(sp)
 848:	ec4e                	sd	s3,24(sp)
 84a:	e852                	sd	s4,16(sp)
 84c:	e456                	sd	s5,8(sp)
 84e:	e05a                	sd	s6,0(sp)
 850:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 852:	02051493          	slli	s1,a0,0x20
 856:	9081                	srli	s1,s1,0x20
 858:	04bd                	addi	s1,s1,15
 85a:	8091                	srli	s1,s1,0x4
 85c:	00148a1b          	addiw	s4,s1,1
 860:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 862:	00000517          	auipc	a0,0x0
 866:	38653503          	ld	a0,902(a0) # be8 <freep>
 86a:	c515                	beqz	a0,896 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 86c:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 86e:	4798                	lw	a4,8(a5)
 870:	04977163          	bgeu	a4,s1,8b2 <malloc+0x74>
 874:	89d2                	mv	s3,s4
 876:	000a071b          	sext.w	a4,s4
 87a:	6685                	lui	a3,0x1
 87c:	00d77363          	bgeu	a4,a3,882 <malloc+0x44>
 880:	6985                	lui	s3,0x1
 882:	00098b1b          	sext.w	s6,s3
  p = sbrk(nu * sizeof(Header));
 886:	0049999b          	slliw	s3,s3,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 88a:	00000917          	auipc	s2,0x0
 88e:	35e90913          	addi	s2,s2,862 # be8 <freep>
  if(p == (char*)-1)
 892:	5afd                	li	s5,-1
 894:	a8a5                	j	90c <malloc+0xce>
    base.s.ptr = freep = prevp = &base;
 896:	00000797          	auipc	a5,0x0
 89a:	35278793          	addi	a5,a5,850 # be8 <freep>
 89e:	00000717          	auipc	a4,0x0
 8a2:	35270713          	addi	a4,a4,850 # bf0 <base>
 8a6:	e398                	sd	a4,0(a5)
 8a8:	e798                	sd	a4,8(a5)
    base.s.size = 0;
 8aa:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8ae:	87ba                	mv	a5,a4
 8b0:	b7d1                	j	874 <malloc+0x36>
      if(p->s.size == nunits)
 8b2:	02e48c63          	beq	s1,a4,8ea <malloc+0xac>
        p->s.size -= nunits;
 8b6:	4147073b          	subw	a4,a4,s4
 8ba:	c798                	sw	a4,8(a5)
        p += p->s.size;
 8bc:	02071693          	slli	a3,a4,0x20
 8c0:	01c6d713          	srli	a4,a3,0x1c
 8c4:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 8c6:	0147a423          	sw	s4,8(a5)
      freep = prevp;
 8ca:	00000717          	auipc	a4,0x0
 8ce:	30a73f23          	sd	a0,798(a4) # be8 <freep>
      return (void*)(p + 1);
 8d2:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8d6:	70e2                	ld	ra,56(sp)
 8d8:	7442                	ld	s0,48(sp)
 8da:	74a2                	ld	s1,40(sp)
 8dc:	7902                	ld	s2,32(sp)
 8de:	69e2                	ld	s3,24(sp)
 8e0:	6a42                	ld	s4,16(sp)
 8e2:	6aa2                	ld	s5,8(sp)
 8e4:	6b02                	ld	s6,0(sp)
 8e6:	6121                	addi	sp,sp,64
 8e8:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 8ea:	6398                	ld	a4,0(a5)
 8ec:	e118                	sd	a4,0(a0)
 8ee:	bff1                	j	8ca <malloc+0x8c>
  hp->s.size = nu;
 8f0:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 8f4:	0541                	addi	a0,a0,16
 8f6:	00000097          	auipc	ra,0x0
 8fa:	ec6080e7          	jalr	-314(ra) # 7bc <free>
  return freep;
 8fe:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 902:	d971                	beqz	a0,8d6 <malloc+0x98>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 904:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 906:	4798                	lw	a4,8(a5)
 908:	fa9775e3          	bgeu	a4,s1,8b2 <malloc+0x74>
    if(p == freep)
 90c:	00093703          	ld	a4,0(s2)
 910:	853e                	mv	a0,a5
 912:	fef719e3          	bne	a4,a5,904 <malloc+0xc6>
  p = sbrk(nu * sizeof(Header));
 916:	854e                	mv	a0,s3
 918:	00000097          	auipc	ra,0x0
 91c:	b2e080e7          	jalr	-1234(ra) # 446 <sbrk>
  if(p == (char*)-1)
 920:	fd5518e3          	bne	a0,s5,8f0 <malloc+0xb2>
        return 0;
 924:	4501                	li	a0,0
 926:	bf45                	j	8d6 <malloc+0x98>
