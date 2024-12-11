
xv6-user/_mv:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/include/fcntl.h"
#include "kernel/include/param.h"
#include "xv6-user/user.h"

int main(int argc, char *argv[])
{
   0:	d9010113          	addi	sp,sp,-624
   4:	26113423          	sd	ra,616(sp)
   8:	26813023          	sd	s0,608(sp)
   c:	24913c23          	sd	s1,600(sp)
  10:	25213823          	sd	s2,592(sp)
  14:	1c80                	addi	s0,sp,624
    if (argc < 3) {
  16:	4789                	li	a5,2
  18:	02a7c063          	blt	a5,a0,38 <main+0x38>
        fprintf(2, "Usage: mv old_name new_name\n");
  1c:	00001597          	auipc	a1,0x1
  20:	9b458593          	addi	a1,a1,-1612 # 9d0 <malloc+0xee>
  24:	4509                	li	a0,2
  26:	00000097          	auipc	ra,0x0
  2a:	7d6080e7          	jalr	2006(ra) # 7fc <fprintf>
        exit(1);
  2e:	4505                	li	a0,1
  30:	00000097          	auipc	ra,0x0
  34:	432080e7          	jalr	1074(ra) # 462 <exit>
  38:	84ae                	mv	s1,a1
    }

    char src[MAXPATH];
    char dst[MAXPATH];
    strcpy(src, argv[1]);
  3a:	658c                	ld	a1,8(a1)
  3c:	ed840513          	addi	a0,s0,-296
  40:	00000097          	auipc	ra,0x0
  44:	16a080e7          	jalr	362(ra) # 1aa <strcpy>
    strcpy(dst, argv[2]);
  48:	688c                	ld	a1,16(s1)
  4a:	dd040493          	addi	s1,s0,-560
  4e:	8526                	mv	a0,s1
  50:	00000097          	auipc	ra,0x0
  54:	15a080e7          	jalr	346(ra) # 1aa <strcpy>
    int fd = open(dst, O_RDONLY);
  58:	4581                	li	a1,0
  5a:	8526                	mv	a0,s1
  5c:	00000097          	auipc	ra,0x0
  60:	446080e7          	jalr	1094(ra) # 4a2 <open>
  64:	84aa                	mv	s1,a0
    if (fd >= 0) {
  66:	0e054763          	bltz	a0,154 <main+0x154>
        struct stat st;
        fstat(fd, &st);
  6a:	d9840593          	addi	a1,s0,-616
  6e:	00000097          	auipc	ra,0x0
  72:	43c080e7          	jalr	1084(ra) # 4aa <fstat>
        close(fd);
  76:	8526                	mv	a0,s1
  78:	00000097          	auipc	ra,0x0
  7c:	412080e7          	jalr	1042(ra) # 48a <close>
        if (st.type == T_DIR) {
  80:	dc041703          	lh	a4,-576(s0)
  84:	4785                	li	a5,1
  86:	02f70263          	beq	a4,a5,aa <main+0xaa>
                    fprintf(2, "mv: fail! final dst path too long (exceed MAX=%d)!\n", MAXPATH);
                    exit(-1);
                }
            }
        } else {
            fprintf(2, "mv: fail! %s exists!\n", dst);
  8a:	dd040613          	addi	a2,s0,-560
  8e:	00001597          	auipc	a1,0x1
  92:	99a58593          	addi	a1,a1,-1638 # a28 <malloc+0x146>
  96:	4509                	li	a0,2
  98:	00000097          	auipc	ra,0x0
  9c:	764080e7          	jalr	1892(ra) # 7fc <fprintf>
            exit(-1);
  a0:	557d                	li	a0,-1
  a2:	00000097          	auipc	ra,0x0
  a6:	3c0080e7          	jalr	960(ra) # 462 <exit>
            for (ps = src + strlen(src) - 1; ps >= src; ps--) { // trim '/' in tail
  aa:	ed840493          	addi	s1,s0,-296
  ae:	8526                	mv	a0,s1
  b0:	00000097          	auipc	ra,0x0
  b4:	170080e7          	jalr	368(ra) # 220 <strlen>
  b8:	02051793          	slli	a5,a0,0x20
  bc:	9381                	srli	a5,a5,0x20
  be:	17fd                	addi	a5,a5,-1
  c0:	97a6                	add	a5,a5,s1
  c2:	0297ec63          	bltu	a5,s1,fa <main+0xfa>
                if (*ps != '/') {
  c6:	02f00693          	li	a3,47
            for (ps = src + strlen(src) - 1; ps >= src; ps--) { // trim '/' in tail
  ca:	8626                	mv	a2,s1
                if (*ps != '/') {
  cc:	0007c703          	lbu	a4,0(a5)
  d0:	00d71663          	bne	a4,a3,dc <main+0xdc>
            for (ps = src + strlen(src) - 1; ps >= src; ps--) { // trim '/' in tail
  d4:	17fd                	addi	a5,a5,-1
  d6:	fec7fbe3          	bgeu	a5,a2,cc <main+0xcc>
  da:	a005                	j	fa <main+0xfa>
                    *(ps + 1) = '\0';
  dc:	000780a3          	sb	zero,1(a5)
            for (; ps >= src && *ps != '/'; ps--);
  e0:	02f00693          	li	a3,47
  e4:	ed840613          	addi	a2,s0,-296
  e8:	00c7e963          	bltu	a5,a2,fa <main+0xfa>
  ec:	0007c703          	lbu	a4,0(a5)
  f0:	00d70563          	beq	a4,a3,fa <main+0xfa>
  f4:	17fd                	addi	a5,a5,-1
  f6:	fec7fbe3          	bgeu	a5,a2,ec <main+0xec>
            ps++;
  fa:	00178493          	addi	s1,a5,1
            pd = dst + strlen(dst);
  fe:	dd040913          	addi	s2,s0,-560
 102:	854a                	mv	a0,s2
 104:	00000097          	auipc	ra,0x0
 108:	11c080e7          	jalr	284(ra) # 220 <strlen>
 10c:	1502                	slli	a0,a0,0x20
 10e:	9101                	srli	a0,a0,0x20
 110:	992a                	add	s2,s2,a0
            *pd++ = '/';
 112:	00190793          	addi	a5,s2,1
 116:	02f00713          	li	a4,47
 11a:	00e90023          	sb	a4,0(s2)
                if (pd >= dst + MAXPATH) {
 11e:	ed440693          	addi	a3,s0,-300
            while (*ps) {
 122:	0004c703          	lbu	a4,0(s1)
 126:	c71d                	beqz	a4,154 <main+0x154>
                *pd++ = *ps++;
 128:	0485                	addi	s1,s1,1
 12a:	0785                	addi	a5,a5,1
 12c:	fee78fa3          	sb	a4,-1(a5)
                if (pd >= dst + MAXPATH) {
 130:	fed7e9e3          	bltu	a5,a3,122 <main+0x122>
                    fprintf(2, "mv: fail! final dst path too long (exceed MAX=%d)!\n", MAXPATH);
 134:	10400613          	li	a2,260
 138:	00001597          	auipc	a1,0x1
 13c:	8b858593          	addi	a1,a1,-1864 # 9f0 <malloc+0x10e>
 140:	4509                	li	a0,2
 142:	00000097          	auipc	ra,0x0
 146:	6ba080e7          	jalr	1722(ra) # 7fc <fprintf>
                    exit(-1);
 14a:	557d                	li	a0,-1
 14c:	00000097          	auipc	ra,0x0
 150:	316080e7          	jalr	790(ra) # 462 <exit>
        }
    }
    printf("moving [%s] to [%s]\n", src, dst);
 154:	dd040913          	addi	s2,s0,-560
 158:	864a                	mv	a2,s2
 15a:	ed840493          	addi	s1,s0,-296
 15e:	85a6                	mv	a1,s1
 160:	00001517          	auipc	a0,0x1
 164:	8e050513          	addi	a0,a0,-1824 # a40 <malloc+0x15e>
 168:	00000097          	auipc	ra,0x0
 16c:	6c2080e7          	jalr	1730(ra) # 82a <printf>
    if (rename(src, dst) < 0) {
 170:	85ca                	mv	a1,s2
 172:	8526                	mv	a0,s1
 174:	00000097          	auipc	ra,0x0
 178:	3ae080e7          	jalr	942(ra) # 522 <rename>
 17c:	00054763          	bltz	a0,18a <main+0x18a>
        fprintf(2, "mv: fail to rename %s to %s!\n", src, dst);
        exit(-1);
    }
    exit(0);
 180:	4501                	li	a0,0
 182:	00000097          	auipc	ra,0x0
 186:	2e0080e7          	jalr	736(ra) # 462 <exit>
        fprintf(2, "mv: fail to rename %s to %s!\n", src, dst);
 18a:	86ca                	mv	a3,s2
 18c:	8626                	mv	a2,s1
 18e:	00001597          	auipc	a1,0x1
 192:	8ca58593          	addi	a1,a1,-1846 # a58 <malloc+0x176>
 196:	4509                	li	a0,2
 198:	00000097          	auipc	ra,0x0
 19c:	664080e7          	jalr	1636(ra) # 7fc <fprintf>
        exit(-1);
 1a0:	557d                	li	a0,-1
 1a2:	00000097          	auipc	ra,0x0
 1a6:	2c0080e7          	jalr	704(ra) # 462 <exit>

00000000000001aa <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
 1aa:	1141                	addi	sp,sp,-16
 1ac:	e422                	sd	s0,8(sp)
 1ae:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1b0:	87aa                	mv	a5,a0
 1b2:	0585                	addi	a1,a1,1
 1b4:	0785                	addi	a5,a5,1
 1b6:	fff5c703          	lbu	a4,-1(a1)
 1ba:	fee78fa3          	sb	a4,-1(a5)
 1be:	fb75                	bnez	a4,1b2 <strcpy+0x8>
    ;
  return os;
}
 1c0:	6422                	ld	s0,8(sp)
 1c2:	0141                	addi	sp,sp,16
 1c4:	8082                	ret

00000000000001c6 <strcat>:

char*
strcat(char *s, const char *t)
{
 1c6:	1141                	addi	sp,sp,-16
 1c8:	e422                	sd	s0,8(sp)
 1ca:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
 1cc:	00054783          	lbu	a5,0(a0)
 1d0:	c385                	beqz	a5,1f0 <strcat+0x2a>
 1d2:	87aa                	mv	a5,a0
    s++;
 1d4:	0785                	addi	a5,a5,1
  while(*s)
 1d6:	0007c703          	lbu	a4,0(a5)
 1da:	ff6d                	bnez	a4,1d4 <strcat+0xe>
  while((*s++ = *t++))
 1dc:	0585                	addi	a1,a1,1
 1de:	0785                	addi	a5,a5,1
 1e0:	fff5c703          	lbu	a4,-1(a1)
 1e4:	fee78fa3          	sb	a4,-1(a5)
 1e8:	fb75                	bnez	a4,1dc <strcat+0x16>
    ;
  return os;
}
 1ea:	6422                	ld	s0,8(sp)
 1ec:	0141                	addi	sp,sp,16
 1ee:	8082                	ret
  while(*s)
 1f0:	87aa                	mv	a5,a0
 1f2:	b7ed                	j	1dc <strcat+0x16>

00000000000001f4 <strcmp>:


int
strcmp(const char *p, const char *q)
{
 1f4:	1141                	addi	sp,sp,-16
 1f6:	e422                	sd	s0,8(sp)
 1f8:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 1fa:	00054783          	lbu	a5,0(a0)
 1fe:	cb91                	beqz	a5,212 <strcmp+0x1e>
 200:	0005c703          	lbu	a4,0(a1)
 204:	00f71763          	bne	a4,a5,212 <strcmp+0x1e>
    p++, q++;
 208:	0505                	addi	a0,a0,1
 20a:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 20c:	00054783          	lbu	a5,0(a0)
 210:	fbe5                	bnez	a5,200 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 212:	0005c503          	lbu	a0,0(a1)
}
 216:	40a7853b          	subw	a0,a5,a0
 21a:	6422                	ld	s0,8(sp)
 21c:	0141                	addi	sp,sp,16
 21e:	8082                	ret

0000000000000220 <strlen>:

uint
strlen(const char *s)
{
 220:	1141                	addi	sp,sp,-16
 222:	e422                	sd	s0,8(sp)
 224:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 226:	00054783          	lbu	a5,0(a0)
 22a:	cf91                	beqz	a5,246 <strlen+0x26>
 22c:	0505                	addi	a0,a0,1
 22e:	87aa                	mv	a5,a0
 230:	4685                	li	a3,1
 232:	9e89                	subw	a3,a3,a0
 234:	00f6853b          	addw	a0,a3,a5
 238:	0785                	addi	a5,a5,1
 23a:	fff7c703          	lbu	a4,-1(a5)
 23e:	fb7d                	bnez	a4,234 <strlen+0x14>
    ;
  return n;
}
 240:	6422                	ld	s0,8(sp)
 242:	0141                	addi	sp,sp,16
 244:	8082                	ret
  for(n = 0; s[n]; n++)
 246:	4501                	li	a0,0
 248:	bfe5                	j	240 <strlen+0x20>

000000000000024a <memset>:

void*
memset(void *dst, int c, uint n)
{
 24a:	1141                	addi	sp,sp,-16
 24c:	e422                	sd	s0,8(sp)
 24e:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 250:	ca19                	beqz	a2,266 <memset+0x1c>
 252:	87aa                	mv	a5,a0
 254:	1602                	slli	a2,a2,0x20
 256:	9201                	srli	a2,a2,0x20
 258:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 25c:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 260:	0785                	addi	a5,a5,1
 262:	fee79de3          	bne	a5,a4,25c <memset+0x12>
  }
  return dst;
}
 266:	6422                	ld	s0,8(sp)
 268:	0141                	addi	sp,sp,16
 26a:	8082                	ret

000000000000026c <strchr>:

char*
strchr(const char *s, char c)
{
 26c:	1141                	addi	sp,sp,-16
 26e:	e422                	sd	s0,8(sp)
 270:	0800                	addi	s0,sp,16
  for(; *s; s++)
 272:	00054783          	lbu	a5,0(a0)
 276:	cb99                	beqz	a5,28c <strchr+0x20>
    if(*s == c)
 278:	00f58763          	beq	a1,a5,286 <strchr+0x1a>
  for(; *s; s++)
 27c:	0505                	addi	a0,a0,1
 27e:	00054783          	lbu	a5,0(a0)
 282:	fbfd                	bnez	a5,278 <strchr+0xc>
      return (char*)s;
  return 0;
 284:	4501                	li	a0,0
}
 286:	6422                	ld	s0,8(sp)
 288:	0141                	addi	sp,sp,16
 28a:	8082                	ret
  return 0;
 28c:	4501                	li	a0,0
 28e:	bfe5                	j	286 <strchr+0x1a>

0000000000000290 <gets>:

char*
gets(char *buf, int max)
{
 290:	711d                	addi	sp,sp,-96
 292:	ec86                	sd	ra,88(sp)
 294:	e8a2                	sd	s0,80(sp)
 296:	e4a6                	sd	s1,72(sp)
 298:	e0ca                	sd	s2,64(sp)
 29a:	fc4e                	sd	s3,56(sp)
 29c:	f852                	sd	s4,48(sp)
 29e:	f456                	sd	s5,40(sp)
 2a0:	f05a                	sd	s6,32(sp)
 2a2:	ec5e                	sd	s7,24(sp)
 2a4:	e862                	sd	s8,16(sp)
 2a6:	1080                	addi	s0,sp,96
 2a8:	8baa                	mv	s7,a0
 2aa:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2ac:	892a                	mv	s2,a0
 2ae:	4481                	li	s1,0
    cc = read(0, &c, 1);
 2b0:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 2b4:	4b29                	li	s6,10
 2b6:	4c35                	li	s8,13
  for(i=0; i+1 < max; ){
 2b8:	89a6                	mv	s3,s1
 2ba:	2485                	addiw	s1,s1,1
 2bc:	0344d763          	bge	s1,s4,2ea <gets+0x5a>
    cc = read(0, &c, 1);
 2c0:	4605                	li	a2,1
 2c2:	85d6                	mv	a1,s5
 2c4:	4501                	li	a0,0
 2c6:	00000097          	auipc	ra,0x0
 2ca:	1b4080e7          	jalr	436(ra) # 47a <read>
    if(cc < 1)
 2ce:	00a05e63          	blez	a0,2ea <gets+0x5a>
    buf[i++] = c;
 2d2:	faf44783          	lbu	a5,-81(s0)
 2d6:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 2da:	01678763          	beq	a5,s6,2e8 <gets+0x58>
 2de:	0905                	addi	s2,s2,1
 2e0:	fd879ce3          	bne	a5,s8,2b8 <gets+0x28>
  for(i=0; i+1 < max; ){
 2e4:	89a6                	mv	s3,s1
 2e6:	a011                	j	2ea <gets+0x5a>
 2e8:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 2ea:	99de                	add	s3,s3,s7
 2ec:	00098023          	sb	zero,0(s3)
  return buf;
}
 2f0:	855e                	mv	a0,s7
 2f2:	60e6                	ld	ra,88(sp)
 2f4:	6446                	ld	s0,80(sp)
 2f6:	64a6                	ld	s1,72(sp)
 2f8:	6906                	ld	s2,64(sp)
 2fa:	79e2                	ld	s3,56(sp)
 2fc:	7a42                	ld	s4,48(sp)
 2fe:	7aa2                	ld	s5,40(sp)
 300:	7b02                	ld	s6,32(sp)
 302:	6be2                	ld	s7,24(sp)
 304:	6c42                	ld	s8,16(sp)
 306:	6125                	addi	sp,sp,96
 308:	8082                	ret

000000000000030a <stat>:

int
stat(const char *n, struct stat *st)
{
 30a:	1101                	addi	sp,sp,-32
 30c:	ec06                	sd	ra,24(sp)
 30e:	e822                	sd	s0,16(sp)
 310:	e426                	sd	s1,8(sp)
 312:	e04a                	sd	s2,0(sp)
 314:	1000                	addi	s0,sp,32
 316:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 318:	4581                	li	a1,0
 31a:	00000097          	auipc	ra,0x0
 31e:	188080e7          	jalr	392(ra) # 4a2 <open>
  if(fd < 0)
 322:	02054563          	bltz	a0,34c <stat+0x42>
 326:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 328:	85ca                	mv	a1,s2
 32a:	00000097          	auipc	ra,0x0
 32e:	180080e7          	jalr	384(ra) # 4aa <fstat>
 332:	892a                	mv	s2,a0
  close(fd);
 334:	8526                	mv	a0,s1
 336:	00000097          	auipc	ra,0x0
 33a:	154080e7          	jalr	340(ra) # 48a <close>
  return r;
}
 33e:	854a                	mv	a0,s2
 340:	60e2                	ld	ra,24(sp)
 342:	6442                	ld	s0,16(sp)
 344:	64a2                	ld	s1,8(sp)
 346:	6902                	ld	s2,0(sp)
 348:	6105                	addi	sp,sp,32
 34a:	8082                	ret
    return -1;
 34c:	597d                	li	s2,-1
 34e:	bfc5                	j	33e <stat+0x34>

0000000000000350 <atoi>:

int
atoi(const char *s)
{
 350:	1141                	addi	sp,sp,-16
 352:	e422                	sd	s0,8(sp)
 354:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 356:	00054703          	lbu	a4,0(a0)
 35a:	02d00793          	li	a5,45
  int neg = 1;
 35e:	4585                	li	a1,1
  if (*s == '-') {
 360:	04f70363          	beq	a4,a5,3a6 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 364:	00054703          	lbu	a4,0(a0)
 368:	fd07079b          	addiw	a5,a4,-48
 36c:	0ff7f793          	zext.b	a5,a5
 370:	46a5                	li	a3,9
 372:	02f6ed63          	bltu	a3,a5,3ac <atoi+0x5c>
  n = 0;
 376:	4681                	li	a3,0
  while('0' <= *s && *s <= '9')
 378:	4625                	li	a2,9
    n = n*10 + *s++ - '0';
 37a:	0505                	addi	a0,a0,1
 37c:	0026979b          	slliw	a5,a3,0x2
 380:	9fb5                	addw	a5,a5,a3
 382:	0017979b          	slliw	a5,a5,0x1
 386:	9fb9                	addw	a5,a5,a4
 388:	fd07869b          	addiw	a3,a5,-48
  while('0' <= *s && *s <= '9')
 38c:	00054703          	lbu	a4,0(a0)
 390:	fd07079b          	addiw	a5,a4,-48
 394:	0ff7f793          	zext.b	a5,a5
 398:	fef671e3          	bgeu	a2,a5,37a <atoi+0x2a>
  return n * neg;
}
 39c:	02d5853b          	mulw	a0,a1,a3
 3a0:	6422                	ld	s0,8(sp)
 3a2:	0141                	addi	sp,sp,16
 3a4:	8082                	ret
    s++;
 3a6:	0505                	addi	a0,a0,1
    neg = -1;
 3a8:	55fd                	li	a1,-1
 3aa:	bf6d                	j	364 <atoi+0x14>
  n = 0;
 3ac:	4681                	li	a3,0
 3ae:	b7fd                	j	39c <atoi+0x4c>

00000000000003b0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3b0:	1141                	addi	sp,sp,-16
 3b2:	e422                	sd	s0,8(sp)
 3b4:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 3b6:	02b57463          	bgeu	a0,a1,3de <memmove+0x2e>
    while(n-- > 0)
 3ba:	00c05f63          	blez	a2,3d8 <memmove+0x28>
 3be:	1602                	slli	a2,a2,0x20
 3c0:	9201                	srli	a2,a2,0x20
 3c2:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 3c6:	872a                	mv	a4,a0
      *dst++ = *src++;
 3c8:	0585                	addi	a1,a1,1
 3ca:	0705                	addi	a4,a4,1
 3cc:	fff5c683          	lbu	a3,-1(a1)
 3d0:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 3d4:	fee79ae3          	bne	a5,a4,3c8 <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 3d8:	6422                	ld	s0,8(sp)
 3da:	0141                	addi	sp,sp,16
 3dc:	8082                	ret
    dst += n;
 3de:	00c50733          	add	a4,a0,a2
    src += n;
 3e2:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 3e4:	fec05ae3          	blez	a2,3d8 <memmove+0x28>
 3e8:	fff6079b          	addiw	a5,a2,-1
 3ec:	1782                	slli	a5,a5,0x20
 3ee:	9381                	srli	a5,a5,0x20
 3f0:	fff7c793          	not	a5,a5
 3f4:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 3f6:	15fd                	addi	a1,a1,-1
 3f8:	177d                	addi	a4,a4,-1
 3fa:	0005c683          	lbu	a3,0(a1)
 3fe:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 402:	fee79ae3          	bne	a5,a4,3f6 <memmove+0x46>
 406:	bfc9                	j	3d8 <memmove+0x28>

0000000000000408 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 408:	1141                	addi	sp,sp,-16
 40a:	e422                	sd	s0,8(sp)
 40c:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 40e:	ca05                	beqz	a2,43e <memcmp+0x36>
 410:	fff6069b          	addiw	a3,a2,-1
 414:	1682                	slli	a3,a3,0x20
 416:	9281                	srli	a3,a3,0x20
 418:	0685                	addi	a3,a3,1
 41a:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 41c:	00054783          	lbu	a5,0(a0)
 420:	0005c703          	lbu	a4,0(a1)
 424:	00e79863          	bne	a5,a4,434 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 428:	0505                	addi	a0,a0,1
    p2++;
 42a:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 42c:	fed518e3          	bne	a0,a3,41c <memcmp+0x14>
  }
  return 0;
 430:	4501                	li	a0,0
 432:	a019                	j	438 <memcmp+0x30>
      return *p1 - *p2;
 434:	40e7853b          	subw	a0,a5,a4
}
 438:	6422                	ld	s0,8(sp)
 43a:	0141                	addi	sp,sp,16
 43c:	8082                	ret
  return 0;
 43e:	4501                	li	a0,0
 440:	bfe5                	j	438 <memcmp+0x30>

0000000000000442 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 442:	1141                	addi	sp,sp,-16
 444:	e406                	sd	ra,8(sp)
 446:	e022                	sd	s0,0(sp)
 448:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 44a:	00000097          	auipc	ra,0x0
 44e:	f66080e7          	jalr	-154(ra) # 3b0 <memmove>
}
 452:	60a2                	ld	ra,8(sp)
 454:	6402                	ld	s0,0(sp)
 456:	0141                	addi	sp,sp,16
 458:	8082                	ret

000000000000045a <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 45a:	4885                	li	a7,1
 ecall
 45c:	00000073          	ecall
 ret
 460:	8082                	ret

0000000000000462 <exit>:
.global exit
exit:
 li a7, SYS_exit
 462:	4889                	li	a7,2
 ecall
 464:	00000073          	ecall
 ret
 468:	8082                	ret

000000000000046a <wait>:
.global wait
wait:
 li a7, SYS_wait
 46a:	488d                	li	a7,3
 ecall
 46c:	00000073          	ecall
 ret
 470:	8082                	ret

0000000000000472 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 472:	4891                	li	a7,4
 ecall
 474:	00000073          	ecall
 ret
 478:	8082                	ret

000000000000047a <read>:
.global read
read:
 li a7, SYS_read
 47a:	4895                	li	a7,5
 ecall
 47c:	00000073          	ecall
 ret
 480:	8082                	ret

0000000000000482 <write>:
.global write
write:
 li a7, SYS_write
 482:	48c1                	li	a7,16
 ecall
 484:	00000073          	ecall
 ret
 488:	8082                	ret

000000000000048a <close>:
.global close
close:
 li a7, SYS_close
 48a:	48d5                	li	a7,21
 ecall
 48c:	00000073          	ecall
 ret
 490:	8082                	ret

0000000000000492 <kill>:
.global kill
kill:
 li a7, SYS_kill
 492:	4899                	li	a7,6
 ecall
 494:	00000073          	ecall
 ret
 498:	8082                	ret

000000000000049a <exec>:
.global exec
exec:
 li a7, SYS_exec
 49a:	489d                	li	a7,7
 ecall
 49c:	00000073          	ecall
 ret
 4a0:	8082                	ret

00000000000004a2 <open>:
.global open
open:
 li a7, SYS_open
 4a2:	48bd                	li	a7,15
 ecall
 4a4:	00000073          	ecall
 ret
 4a8:	8082                	ret

00000000000004aa <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 4aa:	48a1                	li	a7,8
 ecall
 4ac:	00000073          	ecall
 ret
 4b0:	8082                	ret

00000000000004b2 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 4b2:	48d1                	li	a7,20
 ecall
 4b4:	00000073          	ecall
 ret
 4b8:	8082                	ret

00000000000004ba <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 4ba:	48a5                	li	a7,9
 ecall
 4bc:	00000073          	ecall
 ret
 4c0:	8082                	ret

00000000000004c2 <dup>:
.global dup
dup:
 li a7, SYS_dup
 4c2:	48a9                	li	a7,10
 ecall
 4c4:	00000073          	ecall
 ret
 4c8:	8082                	ret

00000000000004ca <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 4ca:	48ad                	li	a7,11
 ecall
 4cc:	00000073          	ecall
 ret
 4d0:	8082                	ret

00000000000004d2 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 4d2:	48b1                	li	a7,12
 ecall
 4d4:	00000073          	ecall
 ret
 4d8:	8082                	ret

00000000000004da <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 4da:	48b5                	li	a7,13
 ecall
 4dc:	00000073          	ecall
 ret
 4e0:	8082                	ret

00000000000004e2 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 4e2:	48b9                	li	a7,14
 ecall
 4e4:	00000073          	ecall
 ret
 4e8:	8082                	ret

00000000000004ea <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 4ea:	48d9                	li	a7,22
 ecall
 4ec:	00000073          	ecall
 ret
 4f0:	8082                	ret

00000000000004f2 <dev>:
.global dev
dev:
 li a7, SYS_dev
 4f2:	48dd                	li	a7,23
 ecall
 4f4:	00000073          	ecall
 ret
 4f8:	8082                	ret

00000000000004fa <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 4fa:	48e1                	li	a7,24
 ecall
 4fc:	00000073          	ecall
 ret
 500:	8082                	ret

0000000000000502 <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 502:	48e5                	li	a7,25
 ecall
 504:	00000073          	ecall
 ret
 508:	8082                	ret

000000000000050a <remove>:
.global remove
remove:
 li a7, SYS_remove
 50a:	48c5                	li	a7,17
 ecall
 50c:	00000073          	ecall
 ret
 510:	8082                	ret

0000000000000512 <trace>:
.global trace
trace:
 li a7, SYS_trace
 512:	48c9                	li	a7,18
 ecall
 514:	00000073          	ecall
 ret
 518:	8082                	ret

000000000000051a <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 51a:	48cd                	li	a7,19
 ecall
 51c:	00000073          	ecall
 ret
 520:	8082                	ret

0000000000000522 <rename>:
.global rename
rename:
 li a7, SYS_rename
 522:	48e9                	li	a7,26
 ecall
 524:	00000073          	ecall
 ret
 528:	8082                	ret

000000000000052a <poweroff>:
.global poweroff
poweroff:
 li a7, SYS_poweroff
 52a:	0d200893          	li	a7,210
 ecall
 52e:	00000073          	ecall
 ret
 532:	8082                	ret

0000000000000534 <mkdirat>:
.global mkdirat
mkdirat:
 li a7, SYS_mkdirat
 534:	02200893          	li	a7,34
 ecall
 538:	00000073          	ecall
 ret
 53c:	8082                	ret

000000000000053e <clone>:
.global clone
clone:
 li a7, SYS_clone
 53e:	0dc00893          	li	a7,220
 ecall
 542:	00000073          	ecall
 ret
 546:	8082                	ret

0000000000000548 <wait4>:
.global wait4
wait4:
 li a7, SYS_wait4
 548:	10400893          	li	a7,260
 ecall
 54c:	00000073          	ecall
 ret
 550:	8082                	ret

0000000000000552 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 552:	1101                	addi	sp,sp,-32
 554:	ec06                	sd	ra,24(sp)
 556:	e822                	sd	s0,16(sp)
 558:	1000                	addi	s0,sp,32
 55a:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 55e:	4605                	li	a2,1
 560:	fef40593          	addi	a1,s0,-17
 564:	00000097          	auipc	ra,0x0
 568:	f1e080e7          	jalr	-226(ra) # 482 <write>
}
 56c:	60e2                	ld	ra,24(sp)
 56e:	6442                	ld	s0,16(sp)
 570:	6105                	addi	sp,sp,32
 572:	8082                	ret

0000000000000574 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 574:	7139                	addi	sp,sp,-64
 576:	fc06                	sd	ra,56(sp)
 578:	f822                	sd	s0,48(sp)
 57a:	f426                	sd	s1,40(sp)
 57c:	f04a                	sd	s2,32(sp)
 57e:	ec4e                	sd	s3,24(sp)
 580:	0080                	addi	s0,sp,64
 582:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 584:	c299                	beqz	a3,58a <printint+0x16>
 586:	0805c863          	bltz	a1,616 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 58a:	2581                	sext.w	a1,a1
  neg = 0;
 58c:	4881                	li	a7,0
  }

  i = 0;
 58e:	fc040993          	addi	s3,s0,-64
  neg = 0;
 592:	86ce                	mv	a3,s3
  i = 0;
 594:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 596:	2601                	sext.w	a2,a2
 598:	00000517          	auipc	a0,0x0
 59c:	54050513          	addi	a0,a0,1344 # ad8 <digits>
 5a0:	883a                	mv	a6,a4
 5a2:	2705                	addiw	a4,a4,1
 5a4:	02c5f7bb          	remuw	a5,a1,a2
 5a8:	1782                	slli	a5,a5,0x20
 5aa:	9381                	srli	a5,a5,0x20
 5ac:	97aa                	add	a5,a5,a0
 5ae:	0007c783          	lbu	a5,0(a5)
 5b2:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 5b6:	0005879b          	sext.w	a5,a1
 5ba:	02c5d5bb          	divuw	a1,a1,a2
 5be:	0685                	addi	a3,a3,1
 5c0:	fec7f0e3          	bgeu	a5,a2,5a0 <printint+0x2c>
  if(neg)
 5c4:	00088c63          	beqz	a7,5dc <printint+0x68>
    buf[i++] = '-';
 5c8:	fd070793          	addi	a5,a4,-48
 5cc:	00878733          	add	a4,a5,s0
 5d0:	02d00793          	li	a5,45
 5d4:	fef70823          	sb	a5,-16(a4)
 5d8:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 5dc:	02e05663          	blez	a4,608 <printint+0x94>
 5e0:	fc040913          	addi	s2,s0,-64
 5e4:	993a                	add	s2,s2,a4
 5e6:	19fd                	addi	s3,s3,-1
 5e8:	99ba                	add	s3,s3,a4
 5ea:	377d                	addiw	a4,a4,-1
 5ec:	1702                	slli	a4,a4,0x20
 5ee:	9301                	srli	a4,a4,0x20
 5f0:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 5f4:	fff94583          	lbu	a1,-1(s2)
 5f8:	8526                	mv	a0,s1
 5fa:	00000097          	auipc	ra,0x0
 5fe:	f58080e7          	jalr	-168(ra) # 552 <putc>
  while(--i >= 0)
 602:	197d                	addi	s2,s2,-1
 604:	ff3918e3          	bne	s2,s3,5f4 <printint+0x80>
}
 608:	70e2                	ld	ra,56(sp)
 60a:	7442                	ld	s0,48(sp)
 60c:	74a2                	ld	s1,40(sp)
 60e:	7902                	ld	s2,32(sp)
 610:	69e2                	ld	s3,24(sp)
 612:	6121                	addi	sp,sp,64
 614:	8082                	ret
    x = -xx;
 616:	40b005bb          	negw	a1,a1
    neg = 1;
 61a:	4885                	li	a7,1
    x = -xx;
 61c:	bf8d                	j	58e <printint+0x1a>

000000000000061e <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 61e:	7119                	addi	sp,sp,-128
 620:	fc86                	sd	ra,120(sp)
 622:	f8a2                	sd	s0,112(sp)
 624:	f4a6                	sd	s1,104(sp)
 626:	f0ca                	sd	s2,96(sp)
 628:	ecce                	sd	s3,88(sp)
 62a:	e8d2                	sd	s4,80(sp)
 62c:	e4d6                	sd	s5,72(sp)
 62e:	e0da                	sd	s6,64(sp)
 630:	fc5e                	sd	s7,56(sp)
 632:	f862                	sd	s8,48(sp)
 634:	f466                	sd	s9,40(sp)
 636:	f06a                	sd	s10,32(sp)
 638:	ec6e                	sd	s11,24(sp)
 63a:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 63c:	0005c903          	lbu	s2,0(a1)
 640:	18090f63          	beqz	s2,7de <vprintf+0x1c0>
 644:	8aaa                	mv	s5,a0
 646:	8b32                	mv	s6,a2
 648:	00158493          	addi	s1,a1,1
  state = 0;
 64c:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 64e:	02500a13          	li	s4,37
 652:	4c55                	li	s8,21
 654:	00000c97          	auipc	s9,0x0
 658:	42cc8c93          	addi	s9,s9,1068 # a80 <malloc+0x19e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
        s = va_arg(ap, char*);
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 65c:	02800d93          	li	s11,40
  putc(fd, 'x');
 660:	4d41                	li	s10,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 662:	00000b97          	auipc	s7,0x0
 666:	476b8b93          	addi	s7,s7,1142 # ad8 <digits>
 66a:	a839                	j	688 <vprintf+0x6a>
        putc(fd, c);
 66c:	85ca                	mv	a1,s2
 66e:	8556                	mv	a0,s5
 670:	00000097          	auipc	ra,0x0
 674:	ee2080e7          	jalr	-286(ra) # 552 <putc>
 678:	a019                	j	67e <vprintf+0x60>
    } else if(state == '%'){
 67a:	01498d63          	beq	s3,s4,694 <vprintf+0x76>
  for(i = 0; fmt[i]; i++){
 67e:	0485                	addi	s1,s1,1
 680:	fff4c903          	lbu	s2,-1(s1)
 684:	14090d63          	beqz	s2,7de <vprintf+0x1c0>
    if(state == 0){
 688:	fe0999e3          	bnez	s3,67a <vprintf+0x5c>
      if(c == '%'){
 68c:	ff4910e3          	bne	s2,s4,66c <vprintf+0x4e>
        state = '%';
 690:	89d2                	mv	s3,s4
 692:	b7f5                	j	67e <vprintf+0x60>
      if(c == 'd'){
 694:	11490c63          	beq	s2,s4,7ac <vprintf+0x18e>
 698:	f9d9079b          	addiw	a5,s2,-99
 69c:	0ff7f793          	zext.b	a5,a5
 6a0:	10fc6e63          	bltu	s8,a5,7bc <vprintf+0x19e>
 6a4:	f9d9079b          	addiw	a5,s2,-99
 6a8:	0ff7f713          	zext.b	a4,a5
 6ac:	10ec6863          	bltu	s8,a4,7bc <vprintf+0x19e>
 6b0:	00271793          	slli	a5,a4,0x2
 6b4:	97e6                	add	a5,a5,s9
 6b6:	439c                	lw	a5,0(a5)
 6b8:	97e6                	add	a5,a5,s9
 6ba:	8782                	jr	a5
        printint(fd, va_arg(ap, int), 10, 1);
 6bc:	008b0913          	addi	s2,s6,8
 6c0:	4685                	li	a3,1
 6c2:	4629                	li	a2,10
 6c4:	000b2583          	lw	a1,0(s6)
 6c8:	8556                	mv	a0,s5
 6ca:	00000097          	auipc	ra,0x0
 6ce:	eaa080e7          	jalr	-342(ra) # 574 <printint>
 6d2:	8b4a                	mv	s6,s2
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6d4:	4981                	li	s3,0
 6d6:	b765                	j	67e <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 6d8:	008b0913          	addi	s2,s6,8
 6dc:	4681                	li	a3,0
 6de:	4629                	li	a2,10
 6e0:	000b2583          	lw	a1,0(s6)
 6e4:	8556                	mv	a0,s5
 6e6:	00000097          	auipc	ra,0x0
 6ea:	e8e080e7          	jalr	-370(ra) # 574 <printint>
 6ee:	8b4a                	mv	s6,s2
      state = 0;
 6f0:	4981                	li	s3,0
 6f2:	b771                	j	67e <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 6f4:	008b0913          	addi	s2,s6,8
 6f8:	4681                	li	a3,0
 6fa:	866a                	mv	a2,s10
 6fc:	000b2583          	lw	a1,0(s6)
 700:	8556                	mv	a0,s5
 702:	00000097          	auipc	ra,0x0
 706:	e72080e7          	jalr	-398(ra) # 574 <printint>
 70a:	8b4a                	mv	s6,s2
      state = 0;
 70c:	4981                	li	s3,0
 70e:	bf85                	j	67e <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 710:	008b0793          	addi	a5,s6,8
 714:	f8f43423          	sd	a5,-120(s0)
 718:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 71c:	03000593          	li	a1,48
 720:	8556                	mv	a0,s5
 722:	00000097          	auipc	ra,0x0
 726:	e30080e7          	jalr	-464(ra) # 552 <putc>
  putc(fd, 'x');
 72a:	07800593          	li	a1,120
 72e:	8556                	mv	a0,s5
 730:	00000097          	auipc	ra,0x0
 734:	e22080e7          	jalr	-478(ra) # 552 <putc>
 738:	896a                	mv	s2,s10
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 73a:	03c9d793          	srli	a5,s3,0x3c
 73e:	97de                	add	a5,a5,s7
 740:	0007c583          	lbu	a1,0(a5)
 744:	8556                	mv	a0,s5
 746:	00000097          	auipc	ra,0x0
 74a:	e0c080e7          	jalr	-500(ra) # 552 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 74e:	0992                	slli	s3,s3,0x4
 750:	397d                	addiw	s2,s2,-1
 752:	fe0914e3          	bnez	s2,73a <vprintf+0x11c>
        printptr(fd, va_arg(ap, uint64));
 756:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 75a:	4981                	li	s3,0
 75c:	b70d                	j	67e <vprintf+0x60>
        s = va_arg(ap, char*);
 75e:	008b0913          	addi	s2,s6,8
 762:	000b3983          	ld	s3,0(s6)
        if(s == 0)
 766:	02098163          	beqz	s3,788 <vprintf+0x16a>
        while(*s != 0){
 76a:	0009c583          	lbu	a1,0(s3)
 76e:	c5ad                	beqz	a1,7d8 <vprintf+0x1ba>
          putc(fd, *s);
 770:	8556                	mv	a0,s5
 772:	00000097          	auipc	ra,0x0
 776:	de0080e7          	jalr	-544(ra) # 552 <putc>
          s++;
 77a:	0985                	addi	s3,s3,1
        while(*s != 0){
 77c:	0009c583          	lbu	a1,0(s3)
 780:	f9e5                	bnez	a1,770 <vprintf+0x152>
        s = va_arg(ap, char*);
 782:	8b4a                	mv	s6,s2
      state = 0;
 784:	4981                	li	s3,0
 786:	bde5                	j	67e <vprintf+0x60>
          s = "(null)";
 788:	00000997          	auipc	s3,0x0
 78c:	2f098993          	addi	s3,s3,752 # a78 <malloc+0x196>
        while(*s != 0){
 790:	85ee                	mv	a1,s11
 792:	bff9                	j	770 <vprintf+0x152>
        putc(fd, va_arg(ap, uint));
 794:	008b0913          	addi	s2,s6,8
 798:	000b4583          	lbu	a1,0(s6)
 79c:	8556                	mv	a0,s5
 79e:	00000097          	auipc	ra,0x0
 7a2:	db4080e7          	jalr	-588(ra) # 552 <putc>
 7a6:	8b4a                	mv	s6,s2
      state = 0;
 7a8:	4981                	li	s3,0
 7aa:	bdd1                	j	67e <vprintf+0x60>
        putc(fd, c);
 7ac:	85d2                	mv	a1,s4
 7ae:	8556                	mv	a0,s5
 7b0:	00000097          	auipc	ra,0x0
 7b4:	da2080e7          	jalr	-606(ra) # 552 <putc>
      state = 0;
 7b8:	4981                	li	s3,0
 7ba:	b5d1                	j	67e <vprintf+0x60>
        putc(fd, '%');
 7bc:	85d2                	mv	a1,s4
 7be:	8556                	mv	a0,s5
 7c0:	00000097          	auipc	ra,0x0
 7c4:	d92080e7          	jalr	-622(ra) # 552 <putc>
        putc(fd, c);
 7c8:	85ca                	mv	a1,s2
 7ca:	8556                	mv	a0,s5
 7cc:	00000097          	auipc	ra,0x0
 7d0:	d86080e7          	jalr	-634(ra) # 552 <putc>
      state = 0;
 7d4:	4981                	li	s3,0
 7d6:	b565                	j	67e <vprintf+0x60>
        s = va_arg(ap, char*);
 7d8:	8b4a                	mv	s6,s2
      state = 0;
 7da:	4981                	li	s3,0
 7dc:	b54d                	j	67e <vprintf+0x60>
    }
  }
}
 7de:	70e6                	ld	ra,120(sp)
 7e0:	7446                	ld	s0,112(sp)
 7e2:	74a6                	ld	s1,104(sp)
 7e4:	7906                	ld	s2,96(sp)
 7e6:	69e6                	ld	s3,88(sp)
 7e8:	6a46                	ld	s4,80(sp)
 7ea:	6aa6                	ld	s5,72(sp)
 7ec:	6b06                	ld	s6,64(sp)
 7ee:	7be2                	ld	s7,56(sp)
 7f0:	7c42                	ld	s8,48(sp)
 7f2:	7ca2                	ld	s9,40(sp)
 7f4:	7d02                	ld	s10,32(sp)
 7f6:	6de2                	ld	s11,24(sp)
 7f8:	6109                	addi	sp,sp,128
 7fa:	8082                	ret

00000000000007fc <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 7fc:	715d                	addi	sp,sp,-80
 7fe:	ec06                	sd	ra,24(sp)
 800:	e822                	sd	s0,16(sp)
 802:	1000                	addi	s0,sp,32
 804:	e010                	sd	a2,0(s0)
 806:	e414                	sd	a3,8(s0)
 808:	e818                	sd	a4,16(s0)
 80a:	ec1c                	sd	a5,24(s0)
 80c:	03043023          	sd	a6,32(s0)
 810:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 814:	8622                	mv	a2,s0
 816:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 81a:	00000097          	auipc	ra,0x0
 81e:	e04080e7          	jalr	-508(ra) # 61e <vprintf>
}
 822:	60e2                	ld	ra,24(sp)
 824:	6442                	ld	s0,16(sp)
 826:	6161                	addi	sp,sp,80
 828:	8082                	ret

000000000000082a <printf>:

void
printf(const char *fmt, ...)
{
 82a:	711d                	addi	sp,sp,-96
 82c:	ec06                	sd	ra,24(sp)
 82e:	e822                	sd	s0,16(sp)
 830:	1000                	addi	s0,sp,32
 832:	e40c                	sd	a1,8(s0)
 834:	e810                	sd	a2,16(s0)
 836:	ec14                	sd	a3,24(s0)
 838:	f018                	sd	a4,32(s0)
 83a:	f41c                	sd	a5,40(s0)
 83c:	03043823          	sd	a6,48(s0)
 840:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 844:	00840613          	addi	a2,s0,8
 848:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 84c:	85aa                	mv	a1,a0
 84e:	4505                	li	a0,1
 850:	00000097          	auipc	ra,0x0
 854:	dce080e7          	jalr	-562(ra) # 61e <vprintf>
}
 858:	60e2                	ld	ra,24(sp)
 85a:	6442                	ld	s0,16(sp)
 85c:	6125                	addi	sp,sp,96
 85e:	8082                	ret

0000000000000860 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 860:	1141                	addi	sp,sp,-16
 862:	e422                	sd	s0,8(sp)
 864:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 866:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 86a:	00000797          	auipc	a5,0x0
 86e:	2867b783          	ld	a5,646(a5) # af0 <freep>
 872:	a02d                	j	89c <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 874:	4618                	lw	a4,8(a2)
 876:	9f2d                	addw	a4,a4,a1
 878:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 87c:	6398                	ld	a4,0(a5)
 87e:	6310                	ld	a2,0(a4)
 880:	a83d                	j	8be <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 882:	ff852703          	lw	a4,-8(a0)
 886:	9f31                	addw	a4,a4,a2
 888:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 88a:	ff053683          	ld	a3,-16(a0)
 88e:	a091                	j	8d2 <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 890:	6398                	ld	a4,0(a5)
 892:	00e7e463          	bltu	a5,a4,89a <free+0x3a>
 896:	00e6ea63          	bltu	a3,a4,8aa <free+0x4a>
{
 89a:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 89c:	fed7fae3          	bgeu	a5,a3,890 <free+0x30>
 8a0:	6398                	ld	a4,0(a5)
 8a2:	00e6e463          	bltu	a3,a4,8aa <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8a6:	fee7eae3          	bltu	a5,a4,89a <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
 8aa:	ff852583          	lw	a1,-8(a0)
 8ae:	6390                	ld	a2,0(a5)
 8b0:	02059813          	slli	a6,a1,0x20
 8b4:	01c85713          	srli	a4,a6,0x1c
 8b8:	9736                	add	a4,a4,a3
 8ba:	fae60de3          	beq	a2,a4,874 <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
 8be:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 8c2:	4790                	lw	a2,8(a5)
 8c4:	02061593          	slli	a1,a2,0x20
 8c8:	01c5d713          	srli	a4,a1,0x1c
 8cc:	973e                	add	a4,a4,a5
 8ce:	fae68ae3          	beq	a3,a4,882 <free+0x22>
    p->s.ptr = bp->s.ptr;
 8d2:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 8d4:	00000717          	auipc	a4,0x0
 8d8:	20f73e23          	sd	a5,540(a4) # af0 <freep>
}
 8dc:	6422                	ld	s0,8(sp)
 8de:	0141                	addi	sp,sp,16
 8e0:	8082                	ret

00000000000008e2 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8e2:	7139                	addi	sp,sp,-64
 8e4:	fc06                	sd	ra,56(sp)
 8e6:	f822                	sd	s0,48(sp)
 8e8:	f426                	sd	s1,40(sp)
 8ea:	f04a                	sd	s2,32(sp)
 8ec:	ec4e                	sd	s3,24(sp)
 8ee:	e852                	sd	s4,16(sp)
 8f0:	e456                	sd	s5,8(sp)
 8f2:	e05a                	sd	s6,0(sp)
 8f4:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8f6:	02051493          	slli	s1,a0,0x20
 8fa:	9081                	srli	s1,s1,0x20
 8fc:	04bd                	addi	s1,s1,15
 8fe:	8091                	srli	s1,s1,0x4
 900:	00148a1b          	addiw	s4,s1,1
 904:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 906:	00000517          	auipc	a0,0x0
 90a:	1ea53503          	ld	a0,490(a0) # af0 <freep>
 90e:	c515                	beqz	a0,93a <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 910:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 912:	4798                	lw	a4,8(a5)
 914:	04977163          	bgeu	a4,s1,956 <malloc+0x74>
 918:	89d2                	mv	s3,s4
 91a:	000a071b          	sext.w	a4,s4
 91e:	6685                	lui	a3,0x1
 920:	00d77363          	bgeu	a4,a3,926 <malloc+0x44>
 924:	6985                	lui	s3,0x1
 926:	00098b1b          	sext.w	s6,s3
  p = sbrk(nu * sizeof(Header));
 92a:	0049999b          	slliw	s3,s3,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 92e:	00000917          	auipc	s2,0x0
 932:	1c290913          	addi	s2,s2,450 # af0 <freep>
  if(p == (char*)-1)
 936:	5afd                	li	s5,-1
 938:	a8a5                	j	9b0 <malloc+0xce>
    base.s.ptr = freep = prevp = &base;
 93a:	00000797          	auipc	a5,0x0
 93e:	1b678793          	addi	a5,a5,438 # af0 <freep>
 942:	00000717          	auipc	a4,0x0
 946:	1b670713          	addi	a4,a4,438 # af8 <base>
 94a:	e398                	sd	a4,0(a5)
 94c:	e798                	sd	a4,8(a5)
    base.s.size = 0;
 94e:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 952:	87ba                	mv	a5,a4
 954:	b7d1                	j	918 <malloc+0x36>
      if(p->s.size == nunits)
 956:	02e48c63          	beq	s1,a4,98e <malloc+0xac>
        p->s.size -= nunits;
 95a:	4147073b          	subw	a4,a4,s4
 95e:	c798                	sw	a4,8(a5)
        p += p->s.size;
 960:	02071693          	slli	a3,a4,0x20
 964:	01c6d713          	srli	a4,a3,0x1c
 968:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 96a:	0147a423          	sw	s4,8(a5)
      freep = prevp;
 96e:	00000717          	auipc	a4,0x0
 972:	18a73123          	sd	a0,386(a4) # af0 <freep>
      return (void*)(p + 1);
 976:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 97a:	70e2                	ld	ra,56(sp)
 97c:	7442                	ld	s0,48(sp)
 97e:	74a2                	ld	s1,40(sp)
 980:	7902                	ld	s2,32(sp)
 982:	69e2                	ld	s3,24(sp)
 984:	6a42                	ld	s4,16(sp)
 986:	6aa2                	ld	s5,8(sp)
 988:	6b02                	ld	s6,0(sp)
 98a:	6121                	addi	sp,sp,64
 98c:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 98e:	6398                	ld	a4,0(a5)
 990:	e118                	sd	a4,0(a0)
 992:	bff1                	j	96e <malloc+0x8c>
  hp->s.size = nu;
 994:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 998:	0541                	addi	a0,a0,16
 99a:	00000097          	auipc	ra,0x0
 99e:	ec6080e7          	jalr	-314(ra) # 860 <free>
  return freep;
 9a2:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 9a6:	d971                	beqz	a0,97a <malloc+0x98>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9a8:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 9aa:	4798                	lw	a4,8(a5)
 9ac:	fa9775e3          	bgeu	a4,s1,956 <malloc+0x74>
    if(p == freep)
 9b0:	00093703          	ld	a4,0(s2)
 9b4:	853e                	mv	a0,a5
 9b6:	fef719e3          	bne	a4,a5,9a8 <malloc+0xc6>
  p = sbrk(nu * sizeof(Header));
 9ba:	854e                	mv	a0,s3
 9bc:	00000097          	auipc	ra,0x0
 9c0:	b16080e7          	jalr	-1258(ra) # 4d2 <sbrk>
  if(p == (char*)-1)
 9c4:	fd5518e3          	bne	a0,s5,994 <malloc+0xb2>
        return 0;
 9c8:	4501                	li	a0,0
 9ca:	bf45                	j	97a <malloc+0x98>
