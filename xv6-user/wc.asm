
xv6-user/_wc:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
   0:	7119                	addi	sp,sp,-128
   2:	fc86                	sd	ra,120(sp)
   4:	f8a2                	sd	s0,112(sp)
   6:	f4a6                	sd	s1,104(sp)
   8:	f0ca                	sd	s2,96(sp)
   a:	ecce                	sd	s3,88(sp)
   c:	e8d2                	sd	s4,80(sp)
   e:	e4d6                	sd	s5,72(sp)
  10:	e0da                	sd	s6,64(sp)
  12:	fc5e                	sd	s7,56(sp)
  14:	f862                	sd	s8,48(sp)
  16:	f466                	sd	s9,40(sp)
  18:	f06a                	sd	s10,32(sp)
  1a:	ec6e                	sd	s11,24(sp)
  1c:	0100                	addi	s0,sp,128
  1e:	f8a43423          	sd	a0,-120(s0)
  22:	f8b43023          	sd	a1,-128(s0)
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  26:	4981                	li	s3,0
  l = w = c = 0;
  28:	4c81                	li	s9,0
  2a:	4c01                	li	s8,0
  2c:	4b81                	li	s7,0
  2e:	00001d97          	auipc	s11,0x1
  32:	a5bd8d93          	addi	s11,s11,-1445 # a89 <buf+0x1>
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
      c++;
      if(buf[i] == '\n')
  36:	4aa9                	li	s5,10
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
  38:	00001a17          	auipc	s4,0x1
  3c:	978a0a13          	addi	s4,s4,-1672 # 9b0 <malloc+0xee>
        inword = 0;
  40:	4b01                	li	s6,0
  while((n = read(fd, buf, sizeof(buf))) > 0){
  42:	a805                	j	72 <wc+0x72>
      if(strchr(" \r\t\n\v", buf[i]))
  44:	8552                	mv	a0,s4
  46:	00000097          	auipc	ra,0x0
  4a:	224080e7          	jalr	548(ra) # 26a <strchr>
  4e:	c919                	beqz	a0,64 <wc+0x64>
        inword = 0;
  50:	89da                	mv	s3,s6
    for(i=0; i<n; i++){
  52:	0485                	addi	s1,s1,1
  54:	01248d63          	beq	s1,s2,6e <wc+0x6e>
      if(buf[i] == '\n')
  58:	0004c583          	lbu	a1,0(s1)
  5c:	ff5594e3          	bne	a1,s5,44 <wc+0x44>
        l++;
  60:	2b85                	addiw	s7,s7,1
  62:	b7cd                	j	44 <wc+0x44>
      else if(!inword){
  64:	fe0997e3          	bnez	s3,52 <wc+0x52>
        w++;
  68:	2c05                	addiw	s8,s8,1
        inword = 1;
  6a:	4985                	li	s3,1
  6c:	b7dd                	j	52 <wc+0x52>
      c++;
  6e:	01ac8cbb          	addw	s9,s9,s10
  while((n = read(fd, buf, sizeof(buf))) > 0){
  72:	20000613          	li	a2,512
  76:	00001597          	auipc	a1,0x1
  7a:	a1258593          	addi	a1,a1,-1518 # a88 <buf>
  7e:	f8843503          	ld	a0,-120(s0)
  82:	00000097          	auipc	ra,0x0
  86:	3f6080e7          	jalr	1014(ra) # 478 <read>
  8a:	00a05f63          	blez	a0,a8 <wc+0xa8>
    for(i=0; i<n; i++){
  8e:	00001497          	auipc	s1,0x1
  92:	9fa48493          	addi	s1,s1,-1542 # a88 <buf>
  96:	00050d1b          	sext.w	s10,a0
  9a:	fff5091b          	addiw	s2,a0,-1
  9e:	1902                	slli	s2,s2,0x20
  a0:	02095913          	srli	s2,s2,0x20
  a4:	996e                	add	s2,s2,s11
  a6:	bf4d                	j	58 <wc+0x58>
      }
    }
  }
  if(n < 0){
  a8:	02054e63          	bltz	a0,e4 <wc+0xe4>
    printf("wc: read error\n");
    exit(1);
  }
  printf("%d\t%d\t%d\t%s\n", l, w, c, name);
  ac:	f8043703          	ld	a4,-128(s0)
  b0:	86e6                	mv	a3,s9
  b2:	8662                	mv	a2,s8
  b4:	85de                	mv	a1,s7
  b6:	00001517          	auipc	a0,0x1
  ba:	91250513          	addi	a0,a0,-1774 # 9c8 <malloc+0x106>
  be:	00000097          	auipc	ra,0x0
  c2:	74c080e7          	jalr	1868(ra) # 80a <printf>
}
  c6:	70e6                	ld	ra,120(sp)
  c8:	7446                	ld	s0,112(sp)
  ca:	74a6                	ld	s1,104(sp)
  cc:	7906                	ld	s2,96(sp)
  ce:	69e6                	ld	s3,88(sp)
  d0:	6a46                	ld	s4,80(sp)
  d2:	6aa6                	ld	s5,72(sp)
  d4:	6b06                	ld	s6,64(sp)
  d6:	7be2                	ld	s7,56(sp)
  d8:	7c42                	ld	s8,48(sp)
  da:	7ca2                	ld	s9,40(sp)
  dc:	7d02                	ld	s10,32(sp)
  de:	6de2                	ld	s11,24(sp)
  e0:	6109                	addi	sp,sp,128
  e2:	8082                	ret
    printf("wc: read error\n");
  e4:	00001517          	auipc	a0,0x1
  e8:	8d450513          	addi	a0,a0,-1836 # 9b8 <malloc+0xf6>
  ec:	00000097          	auipc	ra,0x0
  f0:	71e080e7          	jalr	1822(ra) # 80a <printf>
    exit(1);
  f4:	4505                	li	a0,1
  f6:	00000097          	auipc	ra,0x0
  fa:	36a080e7          	jalr	874(ra) # 460 <exit>

00000000000000fe <main>:

int
main(int argc, char *argv[])
{
  fe:	7179                	addi	sp,sp,-48
 100:	f406                	sd	ra,40(sp)
 102:	f022                	sd	s0,32(sp)
 104:	ec26                	sd	s1,24(sp)
 106:	e84a                	sd	s2,16(sp)
 108:	e44e                	sd	s3,8(sp)
 10a:	e052                	sd	s4,0(sp)
 10c:	1800                	addi	s0,sp,48
  int fd, i;

  if(argc <= 1){
 10e:	4785                	li	a5,1
 110:	06a7d063          	bge	a5,a0,170 <main+0x72>
 114:	89aa                	mv	s3,a0
 116:	892e                	mv	s2,a1
    wc(0, "");
    exit(0);
  }

  printf("LINE\tWORD\tBYTE\tFILE\n");
 118:	00001517          	auipc	a0,0x1
 11c:	8c850513          	addi	a0,a0,-1848 # 9e0 <malloc+0x11e>
 120:	00000097          	auipc	ra,0x0
 124:	6ea080e7          	jalr	1770(ra) # 80a <printf>
  for(i = 1; i < argc; i++){
 128:	00890493          	addi	s1,s2,8
 12c:	39f9                	addiw	s3,s3,-2
 12e:	02099793          	slli	a5,s3,0x20
 132:	01d7d993          	srli	s3,a5,0x1d
 136:	0941                	addi	s2,s2,16
 138:	99ca                	add	s3,s3,s2
    if((fd = open(argv[i], 0)) < 0){
 13a:	4581                	li	a1,0
 13c:	6088                	ld	a0,0(s1)
 13e:	00000097          	auipc	ra,0x0
 142:	362080e7          	jalr	866(ra) # 4a0 <open>
 146:	892a                	mv	s2,a0
 148:	04054263          	bltz	a0,18c <main+0x8e>
      printf("wc: cannot open %s\n", argv[i]);
      exit(1);
    }
    wc(fd, argv[i]);
 14c:	608c                	ld	a1,0(s1)
 14e:	00000097          	auipc	ra,0x0
 152:	eb2080e7          	jalr	-334(ra) # 0 <wc>
    close(fd);
 156:	854a                	mv	a0,s2
 158:	00000097          	auipc	ra,0x0
 15c:	330080e7          	jalr	816(ra) # 488 <close>
  for(i = 1; i < argc; i++){
 160:	04a1                	addi	s1,s1,8
 162:	fd349ce3          	bne	s1,s3,13a <main+0x3c>
  }
  exit(0);
 166:	4501                	li	a0,0
 168:	00000097          	auipc	ra,0x0
 16c:	2f8080e7          	jalr	760(ra) # 460 <exit>
    wc(0, "");
 170:	00001597          	auipc	a1,0x1
 174:	86858593          	addi	a1,a1,-1944 # 9d8 <malloc+0x116>
 178:	4501                	li	a0,0
 17a:	00000097          	auipc	ra,0x0
 17e:	e86080e7          	jalr	-378(ra) # 0 <wc>
    exit(0);
 182:	4501                	li	a0,0
 184:	00000097          	auipc	ra,0x0
 188:	2dc080e7          	jalr	732(ra) # 460 <exit>
      printf("wc: cannot open %s\n", argv[i]);
 18c:	608c                	ld	a1,0(s1)
 18e:	00001517          	auipc	a0,0x1
 192:	86a50513          	addi	a0,a0,-1942 # 9f8 <malloc+0x136>
 196:	00000097          	auipc	ra,0x0
 19a:	674080e7          	jalr	1652(ra) # 80a <printf>
      exit(1);
 19e:	4505                	li	a0,1
 1a0:	00000097          	auipc	ra,0x0
 1a4:	2c0080e7          	jalr	704(ra) # 460 <exit>

00000000000001a8 <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
 1a8:	1141                	addi	sp,sp,-16
 1aa:	e422                	sd	s0,8(sp)
 1ac:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1ae:	87aa                	mv	a5,a0
 1b0:	0585                	addi	a1,a1,1
 1b2:	0785                	addi	a5,a5,1
 1b4:	fff5c703          	lbu	a4,-1(a1)
 1b8:	fee78fa3          	sb	a4,-1(a5)
 1bc:	fb75                	bnez	a4,1b0 <strcpy+0x8>
    ;
  return os;
}
 1be:	6422                	ld	s0,8(sp)
 1c0:	0141                	addi	sp,sp,16
 1c2:	8082                	ret

00000000000001c4 <strcat>:

char*
strcat(char *s, const char *t)
{
 1c4:	1141                	addi	sp,sp,-16
 1c6:	e422                	sd	s0,8(sp)
 1c8:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
 1ca:	00054783          	lbu	a5,0(a0)
 1ce:	c385                	beqz	a5,1ee <strcat+0x2a>
 1d0:	87aa                	mv	a5,a0
    s++;
 1d2:	0785                	addi	a5,a5,1
  while(*s)
 1d4:	0007c703          	lbu	a4,0(a5)
 1d8:	ff6d                	bnez	a4,1d2 <strcat+0xe>
  while((*s++ = *t++))
 1da:	0585                	addi	a1,a1,1
 1dc:	0785                	addi	a5,a5,1
 1de:	fff5c703          	lbu	a4,-1(a1)
 1e2:	fee78fa3          	sb	a4,-1(a5)
 1e6:	fb75                	bnez	a4,1da <strcat+0x16>
    ;
  return os;
}
 1e8:	6422                	ld	s0,8(sp)
 1ea:	0141                	addi	sp,sp,16
 1ec:	8082                	ret
  while(*s)
 1ee:	87aa                	mv	a5,a0
 1f0:	b7ed                	j	1da <strcat+0x16>

00000000000001f2 <strcmp>:


int
strcmp(const char *p, const char *q)
{
 1f2:	1141                	addi	sp,sp,-16
 1f4:	e422                	sd	s0,8(sp)
 1f6:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 1f8:	00054783          	lbu	a5,0(a0)
 1fc:	cb91                	beqz	a5,210 <strcmp+0x1e>
 1fe:	0005c703          	lbu	a4,0(a1)
 202:	00f71763          	bne	a4,a5,210 <strcmp+0x1e>
    p++, q++;
 206:	0505                	addi	a0,a0,1
 208:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 20a:	00054783          	lbu	a5,0(a0)
 20e:	fbe5                	bnez	a5,1fe <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 210:	0005c503          	lbu	a0,0(a1)
}
 214:	40a7853b          	subw	a0,a5,a0
 218:	6422                	ld	s0,8(sp)
 21a:	0141                	addi	sp,sp,16
 21c:	8082                	ret

000000000000021e <strlen>:

uint
strlen(const char *s)
{
 21e:	1141                	addi	sp,sp,-16
 220:	e422                	sd	s0,8(sp)
 222:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 224:	00054783          	lbu	a5,0(a0)
 228:	cf91                	beqz	a5,244 <strlen+0x26>
 22a:	0505                	addi	a0,a0,1
 22c:	87aa                	mv	a5,a0
 22e:	4685                	li	a3,1
 230:	9e89                	subw	a3,a3,a0
 232:	00f6853b          	addw	a0,a3,a5
 236:	0785                	addi	a5,a5,1
 238:	fff7c703          	lbu	a4,-1(a5)
 23c:	fb7d                	bnez	a4,232 <strlen+0x14>
    ;
  return n;
}
 23e:	6422                	ld	s0,8(sp)
 240:	0141                	addi	sp,sp,16
 242:	8082                	ret
  for(n = 0; s[n]; n++)
 244:	4501                	li	a0,0
 246:	bfe5                	j	23e <strlen+0x20>

0000000000000248 <memset>:

void*
memset(void *dst, int c, uint n)
{
 248:	1141                	addi	sp,sp,-16
 24a:	e422                	sd	s0,8(sp)
 24c:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 24e:	ca19                	beqz	a2,264 <memset+0x1c>
 250:	87aa                	mv	a5,a0
 252:	1602                	slli	a2,a2,0x20
 254:	9201                	srli	a2,a2,0x20
 256:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 25a:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 25e:	0785                	addi	a5,a5,1
 260:	fee79de3          	bne	a5,a4,25a <memset+0x12>
  }
  return dst;
}
 264:	6422                	ld	s0,8(sp)
 266:	0141                	addi	sp,sp,16
 268:	8082                	ret

000000000000026a <strchr>:

char*
strchr(const char *s, char c)
{
 26a:	1141                	addi	sp,sp,-16
 26c:	e422                	sd	s0,8(sp)
 26e:	0800                	addi	s0,sp,16
  for(; *s; s++)
 270:	00054783          	lbu	a5,0(a0)
 274:	cb99                	beqz	a5,28a <strchr+0x20>
    if(*s == c)
 276:	00f58763          	beq	a1,a5,284 <strchr+0x1a>
  for(; *s; s++)
 27a:	0505                	addi	a0,a0,1
 27c:	00054783          	lbu	a5,0(a0)
 280:	fbfd                	bnez	a5,276 <strchr+0xc>
      return (char*)s;
  return 0;
 282:	4501                	li	a0,0
}
 284:	6422                	ld	s0,8(sp)
 286:	0141                	addi	sp,sp,16
 288:	8082                	ret
  return 0;
 28a:	4501                	li	a0,0
 28c:	bfe5                	j	284 <strchr+0x1a>

000000000000028e <gets>:

char*
gets(char *buf, int max)
{
 28e:	711d                	addi	sp,sp,-96
 290:	ec86                	sd	ra,88(sp)
 292:	e8a2                	sd	s0,80(sp)
 294:	e4a6                	sd	s1,72(sp)
 296:	e0ca                	sd	s2,64(sp)
 298:	fc4e                	sd	s3,56(sp)
 29a:	f852                	sd	s4,48(sp)
 29c:	f456                	sd	s5,40(sp)
 29e:	f05a                	sd	s6,32(sp)
 2a0:	ec5e                	sd	s7,24(sp)
 2a2:	e862                	sd	s8,16(sp)
 2a4:	1080                	addi	s0,sp,96
 2a6:	8baa                	mv	s7,a0
 2a8:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2aa:	892a                	mv	s2,a0
 2ac:	4481                	li	s1,0
    cc = read(0, &c, 1);
 2ae:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 2b2:	4b29                	li	s6,10
 2b4:	4c35                	li	s8,13
  for(i=0; i+1 < max; ){
 2b6:	89a6                	mv	s3,s1
 2b8:	2485                	addiw	s1,s1,1
 2ba:	0344d763          	bge	s1,s4,2e8 <gets+0x5a>
    cc = read(0, &c, 1);
 2be:	4605                	li	a2,1
 2c0:	85d6                	mv	a1,s5
 2c2:	4501                	li	a0,0
 2c4:	00000097          	auipc	ra,0x0
 2c8:	1b4080e7          	jalr	436(ra) # 478 <read>
    if(cc < 1)
 2cc:	00a05e63          	blez	a0,2e8 <gets+0x5a>
    buf[i++] = c;
 2d0:	faf44783          	lbu	a5,-81(s0)
 2d4:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 2d8:	01678763          	beq	a5,s6,2e6 <gets+0x58>
 2dc:	0905                	addi	s2,s2,1
 2de:	fd879ce3          	bne	a5,s8,2b6 <gets+0x28>
  for(i=0; i+1 < max; ){
 2e2:	89a6                	mv	s3,s1
 2e4:	a011                	j	2e8 <gets+0x5a>
 2e6:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 2e8:	99de                	add	s3,s3,s7
 2ea:	00098023          	sb	zero,0(s3)
  return buf;
}
 2ee:	855e                	mv	a0,s7
 2f0:	60e6                	ld	ra,88(sp)
 2f2:	6446                	ld	s0,80(sp)
 2f4:	64a6                	ld	s1,72(sp)
 2f6:	6906                	ld	s2,64(sp)
 2f8:	79e2                	ld	s3,56(sp)
 2fa:	7a42                	ld	s4,48(sp)
 2fc:	7aa2                	ld	s5,40(sp)
 2fe:	7b02                	ld	s6,32(sp)
 300:	6be2                	ld	s7,24(sp)
 302:	6c42                	ld	s8,16(sp)
 304:	6125                	addi	sp,sp,96
 306:	8082                	ret

0000000000000308 <stat>:

int
stat(const char *n, struct stat *st)
{
 308:	1101                	addi	sp,sp,-32
 30a:	ec06                	sd	ra,24(sp)
 30c:	e822                	sd	s0,16(sp)
 30e:	e426                	sd	s1,8(sp)
 310:	e04a                	sd	s2,0(sp)
 312:	1000                	addi	s0,sp,32
 314:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 316:	4581                	li	a1,0
 318:	00000097          	auipc	ra,0x0
 31c:	188080e7          	jalr	392(ra) # 4a0 <open>
  if(fd < 0)
 320:	02054563          	bltz	a0,34a <stat+0x42>
 324:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 326:	85ca                	mv	a1,s2
 328:	00000097          	auipc	ra,0x0
 32c:	180080e7          	jalr	384(ra) # 4a8 <fstat>
 330:	892a                	mv	s2,a0
  close(fd);
 332:	8526                	mv	a0,s1
 334:	00000097          	auipc	ra,0x0
 338:	154080e7          	jalr	340(ra) # 488 <close>
  return r;
}
 33c:	854a                	mv	a0,s2
 33e:	60e2                	ld	ra,24(sp)
 340:	6442                	ld	s0,16(sp)
 342:	64a2                	ld	s1,8(sp)
 344:	6902                	ld	s2,0(sp)
 346:	6105                	addi	sp,sp,32
 348:	8082                	ret
    return -1;
 34a:	597d                	li	s2,-1
 34c:	bfc5                	j	33c <stat+0x34>

000000000000034e <atoi>:

int
atoi(const char *s)
{
 34e:	1141                	addi	sp,sp,-16
 350:	e422                	sd	s0,8(sp)
 352:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 354:	00054703          	lbu	a4,0(a0)
 358:	02d00793          	li	a5,45
  int neg = 1;
 35c:	4585                	li	a1,1
  if (*s == '-') {
 35e:	04f70363          	beq	a4,a5,3a4 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 362:	00054703          	lbu	a4,0(a0)
 366:	fd07079b          	addiw	a5,a4,-48
 36a:	0ff7f793          	zext.b	a5,a5
 36e:	46a5                	li	a3,9
 370:	02f6ed63          	bltu	a3,a5,3aa <atoi+0x5c>
  n = 0;
 374:	4681                	li	a3,0
  while('0' <= *s && *s <= '9')
 376:	4625                	li	a2,9
    n = n*10 + *s++ - '0';
 378:	0505                	addi	a0,a0,1
 37a:	0026979b          	slliw	a5,a3,0x2
 37e:	9fb5                	addw	a5,a5,a3
 380:	0017979b          	slliw	a5,a5,0x1
 384:	9fb9                	addw	a5,a5,a4
 386:	fd07869b          	addiw	a3,a5,-48
  while('0' <= *s && *s <= '9')
 38a:	00054703          	lbu	a4,0(a0)
 38e:	fd07079b          	addiw	a5,a4,-48
 392:	0ff7f793          	zext.b	a5,a5
 396:	fef671e3          	bgeu	a2,a5,378 <atoi+0x2a>
  return n * neg;
}
 39a:	02d5853b          	mulw	a0,a1,a3
 39e:	6422                	ld	s0,8(sp)
 3a0:	0141                	addi	sp,sp,16
 3a2:	8082                	ret
    s++;
 3a4:	0505                	addi	a0,a0,1
    neg = -1;
 3a6:	55fd                	li	a1,-1
 3a8:	bf6d                	j	362 <atoi+0x14>
  n = 0;
 3aa:	4681                	li	a3,0
 3ac:	b7fd                	j	39a <atoi+0x4c>

00000000000003ae <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3ae:	1141                	addi	sp,sp,-16
 3b0:	e422                	sd	s0,8(sp)
 3b2:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 3b4:	02b57463          	bgeu	a0,a1,3dc <memmove+0x2e>
    while(n-- > 0)
 3b8:	00c05f63          	blez	a2,3d6 <memmove+0x28>
 3bc:	1602                	slli	a2,a2,0x20
 3be:	9201                	srli	a2,a2,0x20
 3c0:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 3c4:	872a                	mv	a4,a0
      *dst++ = *src++;
 3c6:	0585                	addi	a1,a1,1
 3c8:	0705                	addi	a4,a4,1
 3ca:	fff5c683          	lbu	a3,-1(a1)
 3ce:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 3d2:	fee79ae3          	bne	a5,a4,3c6 <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 3d6:	6422                	ld	s0,8(sp)
 3d8:	0141                	addi	sp,sp,16
 3da:	8082                	ret
    dst += n;
 3dc:	00c50733          	add	a4,a0,a2
    src += n;
 3e0:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 3e2:	fec05ae3          	blez	a2,3d6 <memmove+0x28>
 3e6:	fff6079b          	addiw	a5,a2,-1
 3ea:	1782                	slli	a5,a5,0x20
 3ec:	9381                	srli	a5,a5,0x20
 3ee:	fff7c793          	not	a5,a5
 3f2:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 3f4:	15fd                	addi	a1,a1,-1
 3f6:	177d                	addi	a4,a4,-1
 3f8:	0005c683          	lbu	a3,0(a1)
 3fc:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 400:	fee79ae3          	bne	a5,a4,3f4 <memmove+0x46>
 404:	bfc9                	j	3d6 <memmove+0x28>

0000000000000406 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 406:	1141                	addi	sp,sp,-16
 408:	e422                	sd	s0,8(sp)
 40a:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 40c:	ca05                	beqz	a2,43c <memcmp+0x36>
 40e:	fff6069b          	addiw	a3,a2,-1
 412:	1682                	slli	a3,a3,0x20
 414:	9281                	srli	a3,a3,0x20
 416:	0685                	addi	a3,a3,1
 418:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 41a:	00054783          	lbu	a5,0(a0)
 41e:	0005c703          	lbu	a4,0(a1)
 422:	00e79863          	bne	a5,a4,432 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 426:	0505                	addi	a0,a0,1
    p2++;
 428:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 42a:	fed518e3          	bne	a0,a3,41a <memcmp+0x14>
  }
  return 0;
 42e:	4501                	li	a0,0
 430:	a019                	j	436 <memcmp+0x30>
      return *p1 - *p2;
 432:	40e7853b          	subw	a0,a5,a4
}
 436:	6422                	ld	s0,8(sp)
 438:	0141                	addi	sp,sp,16
 43a:	8082                	ret
  return 0;
 43c:	4501                	li	a0,0
 43e:	bfe5                	j	436 <memcmp+0x30>

0000000000000440 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 440:	1141                	addi	sp,sp,-16
 442:	e406                	sd	ra,8(sp)
 444:	e022                	sd	s0,0(sp)
 446:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 448:	00000097          	auipc	ra,0x0
 44c:	f66080e7          	jalr	-154(ra) # 3ae <memmove>
}
 450:	60a2                	ld	ra,8(sp)
 452:	6402                	ld	s0,0(sp)
 454:	0141                	addi	sp,sp,16
 456:	8082                	ret

0000000000000458 <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 458:	4885                	li	a7,1
 ecall
 45a:	00000073          	ecall
 ret
 45e:	8082                	ret

0000000000000460 <exit>:
.global exit
exit:
 li a7, SYS_exit
 460:	4889                	li	a7,2
 ecall
 462:	00000073          	ecall
 ret
 466:	8082                	ret

0000000000000468 <wait>:
.global wait
wait:
 li a7, SYS_wait
 468:	488d                	li	a7,3
 ecall
 46a:	00000073          	ecall
 ret
 46e:	8082                	ret

0000000000000470 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 470:	4891                	li	a7,4
 ecall
 472:	00000073          	ecall
 ret
 476:	8082                	ret

0000000000000478 <read>:
.global read
read:
 li a7, SYS_read
 478:	4895                	li	a7,5
 ecall
 47a:	00000073          	ecall
 ret
 47e:	8082                	ret

0000000000000480 <write>:
.global write
write:
 li a7, SYS_write
 480:	48c1                	li	a7,16
 ecall
 482:	00000073          	ecall
 ret
 486:	8082                	ret

0000000000000488 <close>:
.global close
close:
 li a7, SYS_close
 488:	48d5                	li	a7,21
 ecall
 48a:	00000073          	ecall
 ret
 48e:	8082                	ret

0000000000000490 <kill>:
.global kill
kill:
 li a7, SYS_kill
 490:	4899                	li	a7,6
 ecall
 492:	00000073          	ecall
 ret
 496:	8082                	ret

0000000000000498 <exec>:
.global exec
exec:
 li a7, SYS_exec
 498:	489d                	li	a7,7
 ecall
 49a:	00000073          	ecall
 ret
 49e:	8082                	ret

00000000000004a0 <open>:
.global open
open:
 li a7, SYS_open
 4a0:	48bd                	li	a7,15
 ecall
 4a2:	00000073          	ecall
 ret
 4a6:	8082                	ret

00000000000004a8 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 4a8:	48a1                	li	a7,8
 ecall
 4aa:	00000073          	ecall
 ret
 4ae:	8082                	ret

00000000000004b0 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 4b0:	48d1                	li	a7,20
 ecall
 4b2:	00000073          	ecall
 ret
 4b6:	8082                	ret

00000000000004b8 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 4b8:	48a5                	li	a7,9
 ecall
 4ba:	00000073          	ecall
 ret
 4be:	8082                	ret

00000000000004c0 <dup>:
.global dup
dup:
 li a7, SYS_dup
 4c0:	48a9                	li	a7,10
 ecall
 4c2:	00000073          	ecall
 ret
 4c6:	8082                	ret

00000000000004c8 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 4c8:	48ad                	li	a7,11
 ecall
 4ca:	00000073          	ecall
 ret
 4ce:	8082                	ret

00000000000004d0 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 4d0:	48b1                	li	a7,12
 ecall
 4d2:	00000073          	ecall
 ret
 4d6:	8082                	ret

00000000000004d8 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 4d8:	48b5                	li	a7,13
 ecall
 4da:	00000073          	ecall
 ret
 4de:	8082                	ret

00000000000004e0 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 4e0:	48b9                	li	a7,14
 ecall
 4e2:	00000073          	ecall
 ret
 4e6:	8082                	ret

00000000000004e8 <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 4e8:	48d9                	li	a7,22
 ecall
 4ea:	00000073          	ecall
 ret
 4ee:	8082                	ret

00000000000004f0 <dev>:
.global dev
dev:
 li a7, SYS_dev
 4f0:	48dd                	li	a7,23
 ecall
 4f2:	00000073          	ecall
 ret
 4f6:	8082                	ret

00000000000004f8 <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 4f8:	48e1                	li	a7,24
 ecall
 4fa:	00000073          	ecall
 ret
 4fe:	8082                	ret

0000000000000500 <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 500:	48e5                	li	a7,25
 ecall
 502:	00000073          	ecall
 ret
 506:	8082                	ret

0000000000000508 <remove>:
.global remove
remove:
 li a7, SYS_remove
 508:	48c5                	li	a7,17
 ecall
 50a:	00000073          	ecall
 ret
 50e:	8082                	ret

0000000000000510 <trace>:
.global trace
trace:
 li a7, SYS_trace
 510:	48c9                	li	a7,18
 ecall
 512:	00000073          	ecall
 ret
 516:	8082                	ret

0000000000000518 <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 518:	48cd                	li	a7,19
 ecall
 51a:	00000073          	ecall
 ret
 51e:	8082                	ret

0000000000000520 <rename>:
.global rename
rename:
 li a7, SYS_rename
 520:	48e9                	li	a7,26
 ecall
 522:	00000073          	ecall
 ret
 526:	8082                	ret

0000000000000528 <poweroff>:
.global poweroff
poweroff:
 li a7, SYS_poweroff
 528:	0d200893          	li	a7,210
 ecall
 52c:	00000073          	ecall
 ret
 530:	8082                	ret

0000000000000532 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 532:	1101                	addi	sp,sp,-32
 534:	ec06                	sd	ra,24(sp)
 536:	e822                	sd	s0,16(sp)
 538:	1000                	addi	s0,sp,32
 53a:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 53e:	4605                	li	a2,1
 540:	fef40593          	addi	a1,s0,-17
 544:	00000097          	auipc	ra,0x0
 548:	f3c080e7          	jalr	-196(ra) # 480 <write>
}
 54c:	60e2                	ld	ra,24(sp)
 54e:	6442                	ld	s0,16(sp)
 550:	6105                	addi	sp,sp,32
 552:	8082                	ret

0000000000000554 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 554:	7139                	addi	sp,sp,-64
 556:	fc06                	sd	ra,56(sp)
 558:	f822                	sd	s0,48(sp)
 55a:	f426                	sd	s1,40(sp)
 55c:	f04a                	sd	s2,32(sp)
 55e:	ec4e                	sd	s3,24(sp)
 560:	0080                	addi	s0,sp,64
 562:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 564:	c299                	beqz	a3,56a <printint+0x16>
 566:	0805c863          	bltz	a1,5f6 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 56a:	2581                	sext.w	a1,a1
  neg = 0;
 56c:	4881                	li	a7,0
  }

  i = 0;
 56e:	fc040993          	addi	s3,s0,-64
  neg = 0;
 572:	86ce                	mv	a3,s3
  i = 0;
 574:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 576:	2601                	sext.w	a2,a2
 578:	00000517          	auipc	a0,0x0
 57c:	4f850513          	addi	a0,a0,1272 # a70 <digits>
 580:	883a                	mv	a6,a4
 582:	2705                	addiw	a4,a4,1
 584:	02c5f7bb          	remuw	a5,a1,a2
 588:	1782                	slli	a5,a5,0x20
 58a:	9381                	srli	a5,a5,0x20
 58c:	97aa                	add	a5,a5,a0
 58e:	0007c783          	lbu	a5,0(a5)
 592:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 596:	0005879b          	sext.w	a5,a1
 59a:	02c5d5bb          	divuw	a1,a1,a2
 59e:	0685                	addi	a3,a3,1
 5a0:	fec7f0e3          	bgeu	a5,a2,580 <printint+0x2c>
  if(neg)
 5a4:	00088c63          	beqz	a7,5bc <printint+0x68>
    buf[i++] = '-';
 5a8:	fd070793          	addi	a5,a4,-48
 5ac:	00878733          	add	a4,a5,s0
 5b0:	02d00793          	li	a5,45
 5b4:	fef70823          	sb	a5,-16(a4)
 5b8:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 5bc:	02e05663          	blez	a4,5e8 <printint+0x94>
 5c0:	fc040913          	addi	s2,s0,-64
 5c4:	993a                	add	s2,s2,a4
 5c6:	19fd                	addi	s3,s3,-1
 5c8:	99ba                	add	s3,s3,a4
 5ca:	377d                	addiw	a4,a4,-1
 5cc:	1702                	slli	a4,a4,0x20
 5ce:	9301                	srli	a4,a4,0x20
 5d0:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 5d4:	fff94583          	lbu	a1,-1(s2)
 5d8:	8526                	mv	a0,s1
 5da:	00000097          	auipc	ra,0x0
 5de:	f58080e7          	jalr	-168(ra) # 532 <putc>
  while(--i >= 0)
 5e2:	197d                	addi	s2,s2,-1
 5e4:	ff3918e3          	bne	s2,s3,5d4 <printint+0x80>
}
 5e8:	70e2                	ld	ra,56(sp)
 5ea:	7442                	ld	s0,48(sp)
 5ec:	74a2                	ld	s1,40(sp)
 5ee:	7902                	ld	s2,32(sp)
 5f0:	69e2                	ld	s3,24(sp)
 5f2:	6121                	addi	sp,sp,64
 5f4:	8082                	ret
    x = -xx;
 5f6:	40b005bb          	negw	a1,a1
    neg = 1;
 5fa:	4885                	li	a7,1
    x = -xx;
 5fc:	bf8d                	j	56e <printint+0x1a>

00000000000005fe <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 5fe:	7119                	addi	sp,sp,-128
 600:	fc86                	sd	ra,120(sp)
 602:	f8a2                	sd	s0,112(sp)
 604:	f4a6                	sd	s1,104(sp)
 606:	f0ca                	sd	s2,96(sp)
 608:	ecce                	sd	s3,88(sp)
 60a:	e8d2                	sd	s4,80(sp)
 60c:	e4d6                	sd	s5,72(sp)
 60e:	e0da                	sd	s6,64(sp)
 610:	fc5e                	sd	s7,56(sp)
 612:	f862                	sd	s8,48(sp)
 614:	f466                	sd	s9,40(sp)
 616:	f06a                	sd	s10,32(sp)
 618:	ec6e                	sd	s11,24(sp)
 61a:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 61c:	0005c903          	lbu	s2,0(a1)
 620:	18090f63          	beqz	s2,7be <vprintf+0x1c0>
 624:	8aaa                	mv	s5,a0
 626:	8b32                	mv	s6,a2
 628:	00158493          	addi	s1,a1,1
  state = 0;
 62c:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 62e:	02500a13          	li	s4,37
 632:	4c55                	li	s8,21
 634:	00000c97          	auipc	s9,0x0
 638:	3e4c8c93          	addi	s9,s9,996 # a18 <malloc+0x156>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
        s = va_arg(ap, char*);
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 63c:	02800d93          	li	s11,40
  putc(fd, 'x');
 640:	4d41                	li	s10,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 642:	00000b97          	auipc	s7,0x0
 646:	42eb8b93          	addi	s7,s7,1070 # a70 <digits>
 64a:	a839                	j	668 <vprintf+0x6a>
        putc(fd, c);
 64c:	85ca                	mv	a1,s2
 64e:	8556                	mv	a0,s5
 650:	00000097          	auipc	ra,0x0
 654:	ee2080e7          	jalr	-286(ra) # 532 <putc>
 658:	a019                	j	65e <vprintf+0x60>
    } else if(state == '%'){
 65a:	01498d63          	beq	s3,s4,674 <vprintf+0x76>
  for(i = 0; fmt[i]; i++){
 65e:	0485                	addi	s1,s1,1
 660:	fff4c903          	lbu	s2,-1(s1)
 664:	14090d63          	beqz	s2,7be <vprintf+0x1c0>
    if(state == 0){
 668:	fe0999e3          	bnez	s3,65a <vprintf+0x5c>
      if(c == '%'){
 66c:	ff4910e3          	bne	s2,s4,64c <vprintf+0x4e>
        state = '%';
 670:	89d2                	mv	s3,s4
 672:	b7f5                	j	65e <vprintf+0x60>
      if(c == 'd'){
 674:	11490c63          	beq	s2,s4,78c <vprintf+0x18e>
 678:	f9d9079b          	addiw	a5,s2,-99
 67c:	0ff7f793          	zext.b	a5,a5
 680:	10fc6e63          	bltu	s8,a5,79c <vprintf+0x19e>
 684:	f9d9079b          	addiw	a5,s2,-99
 688:	0ff7f713          	zext.b	a4,a5
 68c:	10ec6863          	bltu	s8,a4,79c <vprintf+0x19e>
 690:	00271793          	slli	a5,a4,0x2
 694:	97e6                	add	a5,a5,s9
 696:	439c                	lw	a5,0(a5)
 698:	97e6                	add	a5,a5,s9
 69a:	8782                	jr	a5
        printint(fd, va_arg(ap, int), 10, 1);
 69c:	008b0913          	addi	s2,s6,8
 6a0:	4685                	li	a3,1
 6a2:	4629                	li	a2,10
 6a4:	000b2583          	lw	a1,0(s6)
 6a8:	8556                	mv	a0,s5
 6aa:	00000097          	auipc	ra,0x0
 6ae:	eaa080e7          	jalr	-342(ra) # 554 <printint>
 6b2:	8b4a                	mv	s6,s2
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6b4:	4981                	li	s3,0
 6b6:	b765                	j	65e <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 6b8:	008b0913          	addi	s2,s6,8
 6bc:	4681                	li	a3,0
 6be:	4629                	li	a2,10
 6c0:	000b2583          	lw	a1,0(s6)
 6c4:	8556                	mv	a0,s5
 6c6:	00000097          	auipc	ra,0x0
 6ca:	e8e080e7          	jalr	-370(ra) # 554 <printint>
 6ce:	8b4a                	mv	s6,s2
      state = 0;
 6d0:	4981                	li	s3,0
 6d2:	b771                	j	65e <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 6d4:	008b0913          	addi	s2,s6,8
 6d8:	4681                	li	a3,0
 6da:	866a                	mv	a2,s10
 6dc:	000b2583          	lw	a1,0(s6)
 6e0:	8556                	mv	a0,s5
 6e2:	00000097          	auipc	ra,0x0
 6e6:	e72080e7          	jalr	-398(ra) # 554 <printint>
 6ea:	8b4a                	mv	s6,s2
      state = 0;
 6ec:	4981                	li	s3,0
 6ee:	bf85                	j	65e <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 6f0:	008b0793          	addi	a5,s6,8
 6f4:	f8f43423          	sd	a5,-120(s0)
 6f8:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 6fc:	03000593          	li	a1,48
 700:	8556                	mv	a0,s5
 702:	00000097          	auipc	ra,0x0
 706:	e30080e7          	jalr	-464(ra) # 532 <putc>
  putc(fd, 'x');
 70a:	07800593          	li	a1,120
 70e:	8556                	mv	a0,s5
 710:	00000097          	auipc	ra,0x0
 714:	e22080e7          	jalr	-478(ra) # 532 <putc>
 718:	896a                	mv	s2,s10
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 71a:	03c9d793          	srli	a5,s3,0x3c
 71e:	97de                	add	a5,a5,s7
 720:	0007c583          	lbu	a1,0(a5)
 724:	8556                	mv	a0,s5
 726:	00000097          	auipc	ra,0x0
 72a:	e0c080e7          	jalr	-500(ra) # 532 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 72e:	0992                	slli	s3,s3,0x4
 730:	397d                	addiw	s2,s2,-1
 732:	fe0914e3          	bnez	s2,71a <vprintf+0x11c>
        printptr(fd, va_arg(ap, uint64));
 736:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 73a:	4981                	li	s3,0
 73c:	b70d                	j	65e <vprintf+0x60>
        s = va_arg(ap, char*);
 73e:	008b0913          	addi	s2,s6,8
 742:	000b3983          	ld	s3,0(s6)
        if(s == 0)
 746:	02098163          	beqz	s3,768 <vprintf+0x16a>
        while(*s != 0){
 74a:	0009c583          	lbu	a1,0(s3)
 74e:	c5ad                	beqz	a1,7b8 <vprintf+0x1ba>
          putc(fd, *s);
 750:	8556                	mv	a0,s5
 752:	00000097          	auipc	ra,0x0
 756:	de0080e7          	jalr	-544(ra) # 532 <putc>
          s++;
 75a:	0985                	addi	s3,s3,1
        while(*s != 0){
 75c:	0009c583          	lbu	a1,0(s3)
 760:	f9e5                	bnez	a1,750 <vprintf+0x152>
        s = va_arg(ap, char*);
 762:	8b4a                	mv	s6,s2
      state = 0;
 764:	4981                	li	s3,0
 766:	bde5                	j	65e <vprintf+0x60>
          s = "(null)";
 768:	00000997          	auipc	s3,0x0
 76c:	2a898993          	addi	s3,s3,680 # a10 <malloc+0x14e>
        while(*s != 0){
 770:	85ee                	mv	a1,s11
 772:	bff9                	j	750 <vprintf+0x152>
        putc(fd, va_arg(ap, uint));
 774:	008b0913          	addi	s2,s6,8
 778:	000b4583          	lbu	a1,0(s6)
 77c:	8556                	mv	a0,s5
 77e:	00000097          	auipc	ra,0x0
 782:	db4080e7          	jalr	-588(ra) # 532 <putc>
 786:	8b4a                	mv	s6,s2
      state = 0;
 788:	4981                	li	s3,0
 78a:	bdd1                	j	65e <vprintf+0x60>
        putc(fd, c);
 78c:	85d2                	mv	a1,s4
 78e:	8556                	mv	a0,s5
 790:	00000097          	auipc	ra,0x0
 794:	da2080e7          	jalr	-606(ra) # 532 <putc>
      state = 0;
 798:	4981                	li	s3,0
 79a:	b5d1                	j	65e <vprintf+0x60>
        putc(fd, '%');
 79c:	85d2                	mv	a1,s4
 79e:	8556                	mv	a0,s5
 7a0:	00000097          	auipc	ra,0x0
 7a4:	d92080e7          	jalr	-622(ra) # 532 <putc>
        putc(fd, c);
 7a8:	85ca                	mv	a1,s2
 7aa:	8556                	mv	a0,s5
 7ac:	00000097          	auipc	ra,0x0
 7b0:	d86080e7          	jalr	-634(ra) # 532 <putc>
      state = 0;
 7b4:	4981                	li	s3,0
 7b6:	b565                	j	65e <vprintf+0x60>
        s = va_arg(ap, char*);
 7b8:	8b4a                	mv	s6,s2
      state = 0;
 7ba:	4981                	li	s3,0
 7bc:	b54d                	j	65e <vprintf+0x60>
    }
  }
}
 7be:	70e6                	ld	ra,120(sp)
 7c0:	7446                	ld	s0,112(sp)
 7c2:	74a6                	ld	s1,104(sp)
 7c4:	7906                	ld	s2,96(sp)
 7c6:	69e6                	ld	s3,88(sp)
 7c8:	6a46                	ld	s4,80(sp)
 7ca:	6aa6                	ld	s5,72(sp)
 7cc:	6b06                	ld	s6,64(sp)
 7ce:	7be2                	ld	s7,56(sp)
 7d0:	7c42                	ld	s8,48(sp)
 7d2:	7ca2                	ld	s9,40(sp)
 7d4:	7d02                	ld	s10,32(sp)
 7d6:	6de2                	ld	s11,24(sp)
 7d8:	6109                	addi	sp,sp,128
 7da:	8082                	ret

00000000000007dc <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 7dc:	715d                	addi	sp,sp,-80
 7de:	ec06                	sd	ra,24(sp)
 7e0:	e822                	sd	s0,16(sp)
 7e2:	1000                	addi	s0,sp,32
 7e4:	e010                	sd	a2,0(s0)
 7e6:	e414                	sd	a3,8(s0)
 7e8:	e818                	sd	a4,16(s0)
 7ea:	ec1c                	sd	a5,24(s0)
 7ec:	03043023          	sd	a6,32(s0)
 7f0:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 7f4:	8622                	mv	a2,s0
 7f6:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 7fa:	00000097          	auipc	ra,0x0
 7fe:	e04080e7          	jalr	-508(ra) # 5fe <vprintf>
}
 802:	60e2                	ld	ra,24(sp)
 804:	6442                	ld	s0,16(sp)
 806:	6161                	addi	sp,sp,80
 808:	8082                	ret

000000000000080a <printf>:

void
printf(const char *fmt, ...)
{
 80a:	711d                	addi	sp,sp,-96
 80c:	ec06                	sd	ra,24(sp)
 80e:	e822                	sd	s0,16(sp)
 810:	1000                	addi	s0,sp,32
 812:	e40c                	sd	a1,8(s0)
 814:	e810                	sd	a2,16(s0)
 816:	ec14                	sd	a3,24(s0)
 818:	f018                	sd	a4,32(s0)
 81a:	f41c                	sd	a5,40(s0)
 81c:	03043823          	sd	a6,48(s0)
 820:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 824:	00840613          	addi	a2,s0,8
 828:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 82c:	85aa                	mv	a1,a0
 82e:	4505                	li	a0,1
 830:	00000097          	auipc	ra,0x0
 834:	dce080e7          	jalr	-562(ra) # 5fe <vprintf>
}
 838:	60e2                	ld	ra,24(sp)
 83a:	6442                	ld	s0,16(sp)
 83c:	6125                	addi	sp,sp,96
 83e:	8082                	ret

0000000000000840 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 840:	1141                	addi	sp,sp,-16
 842:	e422                	sd	s0,8(sp)
 844:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 846:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 84a:	00000797          	auipc	a5,0x0
 84e:	43e7b783          	ld	a5,1086(a5) # c88 <freep>
 852:	a02d                	j	87c <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 854:	4618                	lw	a4,8(a2)
 856:	9f2d                	addw	a4,a4,a1
 858:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 85c:	6398                	ld	a4,0(a5)
 85e:	6310                	ld	a2,0(a4)
 860:	a83d                	j	89e <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 862:	ff852703          	lw	a4,-8(a0)
 866:	9f31                	addw	a4,a4,a2
 868:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 86a:	ff053683          	ld	a3,-16(a0)
 86e:	a091                	j	8b2 <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 870:	6398                	ld	a4,0(a5)
 872:	00e7e463          	bltu	a5,a4,87a <free+0x3a>
 876:	00e6ea63          	bltu	a3,a4,88a <free+0x4a>
{
 87a:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 87c:	fed7fae3          	bgeu	a5,a3,870 <free+0x30>
 880:	6398                	ld	a4,0(a5)
 882:	00e6e463          	bltu	a3,a4,88a <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 886:	fee7eae3          	bltu	a5,a4,87a <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
 88a:	ff852583          	lw	a1,-8(a0)
 88e:	6390                	ld	a2,0(a5)
 890:	02059813          	slli	a6,a1,0x20
 894:	01c85713          	srli	a4,a6,0x1c
 898:	9736                	add	a4,a4,a3
 89a:	fae60de3          	beq	a2,a4,854 <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
 89e:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 8a2:	4790                	lw	a2,8(a5)
 8a4:	02061593          	slli	a1,a2,0x20
 8a8:	01c5d713          	srli	a4,a1,0x1c
 8ac:	973e                	add	a4,a4,a5
 8ae:	fae68ae3          	beq	a3,a4,862 <free+0x22>
    p->s.ptr = bp->s.ptr;
 8b2:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 8b4:	00000717          	auipc	a4,0x0
 8b8:	3cf73a23          	sd	a5,980(a4) # c88 <freep>
}
 8bc:	6422                	ld	s0,8(sp)
 8be:	0141                	addi	sp,sp,16
 8c0:	8082                	ret

00000000000008c2 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8c2:	7139                	addi	sp,sp,-64
 8c4:	fc06                	sd	ra,56(sp)
 8c6:	f822                	sd	s0,48(sp)
 8c8:	f426                	sd	s1,40(sp)
 8ca:	f04a                	sd	s2,32(sp)
 8cc:	ec4e                	sd	s3,24(sp)
 8ce:	e852                	sd	s4,16(sp)
 8d0:	e456                	sd	s5,8(sp)
 8d2:	e05a                	sd	s6,0(sp)
 8d4:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8d6:	02051493          	slli	s1,a0,0x20
 8da:	9081                	srli	s1,s1,0x20
 8dc:	04bd                	addi	s1,s1,15
 8de:	8091                	srli	s1,s1,0x4
 8e0:	00148a1b          	addiw	s4,s1,1
 8e4:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 8e6:	00000517          	auipc	a0,0x0
 8ea:	3a253503          	ld	a0,930(a0) # c88 <freep>
 8ee:	c515                	beqz	a0,91a <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f0:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 8f2:	4798                	lw	a4,8(a5)
 8f4:	04977163          	bgeu	a4,s1,936 <malloc+0x74>
 8f8:	89d2                	mv	s3,s4
 8fa:	000a071b          	sext.w	a4,s4
 8fe:	6685                	lui	a3,0x1
 900:	00d77363          	bgeu	a4,a3,906 <malloc+0x44>
 904:	6985                	lui	s3,0x1
 906:	00098b1b          	sext.w	s6,s3
  p = sbrk(nu * sizeof(Header));
 90a:	0049999b          	slliw	s3,s3,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 90e:	00000917          	auipc	s2,0x0
 912:	37a90913          	addi	s2,s2,890 # c88 <freep>
  if(p == (char*)-1)
 916:	5afd                	li	s5,-1
 918:	a8a5                	j	990 <malloc+0xce>
    base.s.ptr = freep = prevp = &base;
 91a:	00000797          	auipc	a5,0x0
 91e:	36e78793          	addi	a5,a5,878 # c88 <freep>
 922:	00000717          	auipc	a4,0x0
 926:	36e70713          	addi	a4,a4,878 # c90 <base>
 92a:	e398                	sd	a4,0(a5)
 92c:	e798                	sd	a4,8(a5)
    base.s.size = 0;
 92e:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 932:	87ba                	mv	a5,a4
 934:	b7d1                	j	8f8 <malloc+0x36>
      if(p->s.size == nunits)
 936:	02e48c63          	beq	s1,a4,96e <malloc+0xac>
        p->s.size -= nunits;
 93a:	4147073b          	subw	a4,a4,s4
 93e:	c798                	sw	a4,8(a5)
        p += p->s.size;
 940:	02071693          	slli	a3,a4,0x20
 944:	01c6d713          	srli	a4,a3,0x1c
 948:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 94a:	0147a423          	sw	s4,8(a5)
      freep = prevp;
 94e:	00000717          	auipc	a4,0x0
 952:	32a73d23          	sd	a0,826(a4) # c88 <freep>
      return (void*)(p + 1);
 956:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 95a:	70e2                	ld	ra,56(sp)
 95c:	7442                	ld	s0,48(sp)
 95e:	74a2                	ld	s1,40(sp)
 960:	7902                	ld	s2,32(sp)
 962:	69e2                	ld	s3,24(sp)
 964:	6a42                	ld	s4,16(sp)
 966:	6aa2                	ld	s5,8(sp)
 968:	6b02                	ld	s6,0(sp)
 96a:	6121                	addi	sp,sp,64
 96c:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 96e:	6398                	ld	a4,0(a5)
 970:	e118                	sd	a4,0(a0)
 972:	bff1                	j	94e <malloc+0x8c>
  hp->s.size = nu;
 974:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 978:	0541                	addi	a0,a0,16
 97a:	00000097          	auipc	ra,0x0
 97e:	ec6080e7          	jalr	-314(ra) # 840 <free>
  return freep;
 982:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 986:	d971                	beqz	a0,95a <malloc+0x98>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 988:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 98a:	4798                	lw	a4,8(a5)
 98c:	fa9775e3          	bgeu	a4,s1,936 <malloc+0x74>
    if(p == freep)
 990:	00093703          	ld	a4,0(s2)
 994:	853e                	mv	a0,a5
 996:	fef719e3          	bne	a4,a5,988 <malloc+0xc6>
  p = sbrk(nu * sizeof(Header));
 99a:	854e                	mv	a0,s3
 99c:	00000097          	auipc	ra,0x0
 9a0:	b34080e7          	jalr	-1228(ra) # 4d0 <sbrk>
  if(p == (char*)-1)
 9a4:	fd5518e3          	bne	a0,s5,974 <malloc+0xb2>
        return 0;
 9a8:	4501                	li	a0,0
 9aa:	bf45                	j	95a <malloc+0x98>
