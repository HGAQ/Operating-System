
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
  20:	99c58593          	addi	a1,a1,-1636 # 9b8 <malloc+0xee>
  24:	4509                	li	a0,2
  26:	00000097          	auipc	ra,0x0
  2a:	7be080e7          	jalr	1982(ra) # 7e4 <fprintf>
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
  92:	98258593          	addi	a1,a1,-1662 # a10 <malloc+0x146>
  96:	4509                	li	a0,2
  98:	00000097          	auipc	ra,0x0
  9c:	74c080e7          	jalr	1868(ra) # 7e4 <fprintf>
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
 13c:	8a058593          	addi	a1,a1,-1888 # 9d8 <malloc+0x10e>
 140:	4509                	li	a0,2
 142:	00000097          	auipc	ra,0x0
 146:	6a2080e7          	jalr	1698(ra) # 7e4 <fprintf>
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
 164:	8c850513          	addi	a0,a0,-1848 # a28 <malloc+0x15e>
 168:	00000097          	auipc	ra,0x0
 16c:	6aa080e7          	jalr	1706(ra) # 812 <printf>
    if (rename(src, dst) < 0) {
 170:	85ca                	mv	a1,s2
 172:	8526                	mv	a0,s1
 174:	00000097          	auipc	ra,0x0
 178:	3b4080e7          	jalr	948(ra) # 528 <rename>
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
 192:	8b258593          	addi	a1,a1,-1870 # a40 <malloc+0x176>
 196:	4509                	li	a0,2
 198:	00000097          	auipc	ra,0x0
 19c:	64c080e7          	jalr	1612(ra) # 7e4 <fprintf>
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
 4f2:	0e900893          	li	a7,233
 ecall
 4f6:	00000073          	ecall
 ret
 4fa:	8082                	ret

00000000000004fc <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 4fc:	0f400893          	li	a7,244
 ecall
 500:	00000073          	ecall
 ret
 504:	8082                	ret

0000000000000506 <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 506:	48e5                	li	a7,25
 ecall
 508:	00000073          	ecall
 ret
 50c:	8082                	ret

000000000000050e <remove>:
.global remove
remove:
 li a7, SYS_remove
 50e:	0b100893          	li	a7,177
 ecall
 512:	00000073          	ecall
 ret
 516:	8082                	ret

0000000000000518 <trace>:
.global trace
trace:
 li a7, SYS_trace
 518:	48c9                	li	a7,18
 ecall
 51a:	00000073          	ecall
 ret
 51e:	8082                	ret

0000000000000520 <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 520:	48cd                	li	a7,19
 ecall
 522:	00000073          	ecall
 ret
 526:	8082                	ret

0000000000000528 <rename>:
.global rename
rename:
 li a7, SYS_rename
 528:	48e9                	li	a7,26
 ecall
 52a:	00000073          	ecall
 ret
 52e:	8082                	ret

0000000000000530 <poweroff>:
.global poweroff
poweroff:
 li a7, SYS_poweroff
 530:	0d200893          	li	a7,210
 ecall
 534:	00000073          	ecall
 ret
 538:	8082                	ret

000000000000053a <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 53a:	1101                	addi	sp,sp,-32
 53c:	ec06                	sd	ra,24(sp)
 53e:	e822                	sd	s0,16(sp)
 540:	1000                	addi	s0,sp,32
 542:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 546:	4605                	li	a2,1
 548:	fef40593          	addi	a1,s0,-17
 54c:	00000097          	auipc	ra,0x0
 550:	f36080e7          	jalr	-202(ra) # 482 <write>
}
 554:	60e2                	ld	ra,24(sp)
 556:	6442                	ld	s0,16(sp)
 558:	6105                	addi	sp,sp,32
 55a:	8082                	ret

000000000000055c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 55c:	7139                	addi	sp,sp,-64
 55e:	fc06                	sd	ra,56(sp)
 560:	f822                	sd	s0,48(sp)
 562:	f426                	sd	s1,40(sp)
 564:	f04a                	sd	s2,32(sp)
 566:	ec4e                	sd	s3,24(sp)
 568:	0080                	addi	s0,sp,64
 56a:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 56c:	c299                	beqz	a3,572 <printint+0x16>
 56e:	0805c863          	bltz	a1,5fe <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 572:	2581                	sext.w	a1,a1
  neg = 0;
 574:	4881                	li	a7,0
  }

  i = 0;
 576:	fc040993          	addi	s3,s0,-64
  neg = 0;
 57a:	86ce                	mv	a3,s3
  i = 0;
 57c:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 57e:	2601                	sext.w	a2,a2
 580:	00000517          	auipc	a0,0x0
 584:	54050513          	addi	a0,a0,1344 # ac0 <digits>
 588:	883a                	mv	a6,a4
 58a:	2705                	addiw	a4,a4,1
 58c:	02c5f7bb          	remuw	a5,a1,a2
 590:	1782                	slli	a5,a5,0x20
 592:	9381                	srli	a5,a5,0x20
 594:	97aa                	add	a5,a5,a0
 596:	0007c783          	lbu	a5,0(a5)
 59a:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 59e:	0005879b          	sext.w	a5,a1
 5a2:	02c5d5bb          	divuw	a1,a1,a2
 5a6:	0685                	addi	a3,a3,1
 5a8:	fec7f0e3          	bgeu	a5,a2,588 <printint+0x2c>
  if(neg)
 5ac:	00088c63          	beqz	a7,5c4 <printint+0x68>
    buf[i++] = '-';
 5b0:	fd070793          	addi	a5,a4,-48
 5b4:	00878733          	add	a4,a5,s0
 5b8:	02d00793          	li	a5,45
 5bc:	fef70823          	sb	a5,-16(a4)
 5c0:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 5c4:	02e05663          	blez	a4,5f0 <printint+0x94>
 5c8:	fc040913          	addi	s2,s0,-64
 5cc:	993a                	add	s2,s2,a4
 5ce:	19fd                	addi	s3,s3,-1
 5d0:	99ba                	add	s3,s3,a4
 5d2:	377d                	addiw	a4,a4,-1
 5d4:	1702                	slli	a4,a4,0x20
 5d6:	9301                	srli	a4,a4,0x20
 5d8:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 5dc:	fff94583          	lbu	a1,-1(s2)
 5e0:	8526                	mv	a0,s1
 5e2:	00000097          	auipc	ra,0x0
 5e6:	f58080e7          	jalr	-168(ra) # 53a <putc>
  while(--i >= 0)
 5ea:	197d                	addi	s2,s2,-1
 5ec:	ff3918e3          	bne	s2,s3,5dc <printint+0x80>
}
 5f0:	70e2                	ld	ra,56(sp)
 5f2:	7442                	ld	s0,48(sp)
 5f4:	74a2                	ld	s1,40(sp)
 5f6:	7902                	ld	s2,32(sp)
 5f8:	69e2                	ld	s3,24(sp)
 5fa:	6121                	addi	sp,sp,64
 5fc:	8082                	ret
    x = -xx;
 5fe:	40b005bb          	negw	a1,a1
    neg = 1;
 602:	4885                	li	a7,1
    x = -xx;
 604:	bf8d                	j	576 <printint+0x1a>

0000000000000606 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 606:	7119                	addi	sp,sp,-128
 608:	fc86                	sd	ra,120(sp)
 60a:	f8a2                	sd	s0,112(sp)
 60c:	f4a6                	sd	s1,104(sp)
 60e:	f0ca                	sd	s2,96(sp)
 610:	ecce                	sd	s3,88(sp)
 612:	e8d2                	sd	s4,80(sp)
 614:	e4d6                	sd	s5,72(sp)
 616:	e0da                	sd	s6,64(sp)
 618:	fc5e                	sd	s7,56(sp)
 61a:	f862                	sd	s8,48(sp)
 61c:	f466                	sd	s9,40(sp)
 61e:	f06a                	sd	s10,32(sp)
 620:	ec6e                	sd	s11,24(sp)
 622:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 624:	0005c903          	lbu	s2,0(a1)
 628:	18090f63          	beqz	s2,7c6 <vprintf+0x1c0>
 62c:	8aaa                	mv	s5,a0
 62e:	8b32                	mv	s6,a2
 630:	00158493          	addi	s1,a1,1
  state = 0;
 634:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 636:	02500a13          	li	s4,37
 63a:	4c55                	li	s8,21
 63c:	00000c97          	auipc	s9,0x0
 640:	42cc8c93          	addi	s9,s9,1068 # a68 <malloc+0x19e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
        s = va_arg(ap, char*);
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 644:	02800d93          	li	s11,40
  putc(fd, 'x');
 648:	4d41                	li	s10,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 64a:	00000b97          	auipc	s7,0x0
 64e:	476b8b93          	addi	s7,s7,1142 # ac0 <digits>
 652:	a839                	j	670 <vprintf+0x6a>
        putc(fd, c);
 654:	85ca                	mv	a1,s2
 656:	8556                	mv	a0,s5
 658:	00000097          	auipc	ra,0x0
 65c:	ee2080e7          	jalr	-286(ra) # 53a <putc>
 660:	a019                	j	666 <vprintf+0x60>
    } else if(state == '%'){
 662:	01498d63          	beq	s3,s4,67c <vprintf+0x76>
  for(i = 0; fmt[i]; i++){
 666:	0485                	addi	s1,s1,1
 668:	fff4c903          	lbu	s2,-1(s1)
 66c:	14090d63          	beqz	s2,7c6 <vprintf+0x1c0>
    if(state == 0){
 670:	fe0999e3          	bnez	s3,662 <vprintf+0x5c>
      if(c == '%'){
 674:	ff4910e3          	bne	s2,s4,654 <vprintf+0x4e>
        state = '%';
 678:	89d2                	mv	s3,s4
 67a:	b7f5                	j	666 <vprintf+0x60>
      if(c == 'd'){
 67c:	11490c63          	beq	s2,s4,794 <vprintf+0x18e>
 680:	f9d9079b          	addiw	a5,s2,-99
 684:	0ff7f793          	zext.b	a5,a5
 688:	10fc6e63          	bltu	s8,a5,7a4 <vprintf+0x19e>
 68c:	f9d9079b          	addiw	a5,s2,-99
 690:	0ff7f713          	zext.b	a4,a5
 694:	10ec6863          	bltu	s8,a4,7a4 <vprintf+0x19e>
 698:	00271793          	slli	a5,a4,0x2
 69c:	97e6                	add	a5,a5,s9
 69e:	439c                	lw	a5,0(a5)
 6a0:	97e6                	add	a5,a5,s9
 6a2:	8782                	jr	a5
        printint(fd, va_arg(ap, int), 10, 1);
 6a4:	008b0913          	addi	s2,s6,8
 6a8:	4685                	li	a3,1
 6aa:	4629                	li	a2,10
 6ac:	000b2583          	lw	a1,0(s6)
 6b0:	8556                	mv	a0,s5
 6b2:	00000097          	auipc	ra,0x0
 6b6:	eaa080e7          	jalr	-342(ra) # 55c <printint>
 6ba:	8b4a                	mv	s6,s2
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6bc:	4981                	li	s3,0
 6be:	b765                	j	666 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 6c0:	008b0913          	addi	s2,s6,8
 6c4:	4681                	li	a3,0
 6c6:	4629                	li	a2,10
 6c8:	000b2583          	lw	a1,0(s6)
 6cc:	8556                	mv	a0,s5
 6ce:	00000097          	auipc	ra,0x0
 6d2:	e8e080e7          	jalr	-370(ra) # 55c <printint>
 6d6:	8b4a                	mv	s6,s2
      state = 0;
 6d8:	4981                	li	s3,0
 6da:	b771                	j	666 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 6dc:	008b0913          	addi	s2,s6,8
 6e0:	4681                	li	a3,0
 6e2:	866a                	mv	a2,s10
 6e4:	000b2583          	lw	a1,0(s6)
 6e8:	8556                	mv	a0,s5
 6ea:	00000097          	auipc	ra,0x0
 6ee:	e72080e7          	jalr	-398(ra) # 55c <printint>
 6f2:	8b4a                	mv	s6,s2
      state = 0;
 6f4:	4981                	li	s3,0
 6f6:	bf85                	j	666 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 6f8:	008b0793          	addi	a5,s6,8
 6fc:	f8f43423          	sd	a5,-120(s0)
 700:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 704:	03000593          	li	a1,48
 708:	8556                	mv	a0,s5
 70a:	00000097          	auipc	ra,0x0
 70e:	e30080e7          	jalr	-464(ra) # 53a <putc>
  putc(fd, 'x');
 712:	07800593          	li	a1,120
 716:	8556                	mv	a0,s5
 718:	00000097          	auipc	ra,0x0
 71c:	e22080e7          	jalr	-478(ra) # 53a <putc>
 720:	896a                	mv	s2,s10
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 722:	03c9d793          	srli	a5,s3,0x3c
 726:	97de                	add	a5,a5,s7
 728:	0007c583          	lbu	a1,0(a5)
 72c:	8556                	mv	a0,s5
 72e:	00000097          	auipc	ra,0x0
 732:	e0c080e7          	jalr	-500(ra) # 53a <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 736:	0992                	slli	s3,s3,0x4
 738:	397d                	addiw	s2,s2,-1
 73a:	fe0914e3          	bnez	s2,722 <vprintf+0x11c>
        printptr(fd, va_arg(ap, uint64));
 73e:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 742:	4981                	li	s3,0
 744:	b70d                	j	666 <vprintf+0x60>
        s = va_arg(ap, char*);
 746:	008b0913          	addi	s2,s6,8
 74a:	000b3983          	ld	s3,0(s6)
        if(s == 0)
 74e:	02098163          	beqz	s3,770 <vprintf+0x16a>
        while(*s != 0){
 752:	0009c583          	lbu	a1,0(s3)
 756:	c5ad                	beqz	a1,7c0 <vprintf+0x1ba>
          putc(fd, *s);
 758:	8556                	mv	a0,s5
 75a:	00000097          	auipc	ra,0x0
 75e:	de0080e7          	jalr	-544(ra) # 53a <putc>
          s++;
 762:	0985                	addi	s3,s3,1
        while(*s != 0){
 764:	0009c583          	lbu	a1,0(s3)
 768:	f9e5                	bnez	a1,758 <vprintf+0x152>
        s = va_arg(ap, char*);
 76a:	8b4a                	mv	s6,s2
      state = 0;
 76c:	4981                	li	s3,0
 76e:	bde5                	j	666 <vprintf+0x60>
          s = "(null)";
 770:	00000997          	auipc	s3,0x0
 774:	2f098993          	addi	s3,s3,752 # a60 <malloc+0x196>
        while(*s != 0){
 778:	85ee                	mv	a1,s11
 77a:	bff9                	j	758 <vprintf+0x152>
        putc(fd, va_arg(ap, uint));
 77c:	008b0913          	addi	s2,s6,8
 780:	000b4583          	lbu	a1,0(s6)
 784:	8556                	mv	a0,s5
 786:	00000097          	auipc	ra,0x0
 78a:	db4080e7          	jalr	-588(ra) # 53a <putc>
 78e:	8b4a                	mv	s6,s2
      state = 0;
 790:	4981                	li	s3,0
 792:	bdd1                	j	666 <vprintf+0x60>
        putc(fd, c);
 794:	85d2                	mv	a1,s4
 796:	8556                	mv	a0,s5
 798:	00000097          	auipc	ra,0x0
 79c:	da2080e7          	jalr	-606(ra) # 53a <putc>
      state = 0;
 7a0:	4981                	li	s3,0
 7a2:	b5d1                	j	666 <vprintf+0x60>
        putc(fd, '%');
 7a4:	85d2                	mv	a1,s4
 7a6:	8556                	mv	a0,s5
 7a8:	00000097          	auipc	ra,0x0
 7ac:	d92080e7          	jalr	-622(ra) # 53a <putc>
        putc(fd, c);
 7b0:	85ca                	mv	a1,s2
 7b2:	8556                	mv	a0,s5
 7b4:	00000097          	auipc	ra,0x0
 7b8:	d86080e7          	jalr	-634(ra) # 53a <putc>
      state = 0;
 7bc:	4981                	li	s3,0
 7be:	b565                	j	666 <vprintf+0x60>
        s = va_arg(ap, char*);
 7c0:	8b4a                	mv	s6,s2
      state = 0;
 7c2:	4981                	li	s3,0
 7c4:	b54d                	j	666 <vprintf+0x60>
    }
  }
}
 7c6:	70e6                	ld	ra,120(sp)
 7c8:	7446                	ld	s0,112(sp)
 7ca:	74a6                	ld	s1,104(sp)
 7cc:	7906                	ld	s2,96(sp)
 7ce:	69e6                	ld	s3,88(sp)
 7d0:	6a46                	ld	s4,80(sp)
 7d2:	6aa6                	ld	s5,72(sp)
 7d4:	6b06                	ld	s6,64(sp)
 7d6:	7be2                	ld	s7,56(sp)
 7d8:	7c42                	ld	s8,48(sp)
 7da:	7ca2                	ld	s9,40(sp)
 7dc:	7d02                	ld	s10,32(sp)
 7de:	6de2                	ld	s11,24(sp)
 7e0:	6109                	addi	sp,sp,128
 7e2:	8082                	ret

00000000000007e4 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 7e4:	715d                	addi	sp,sp,-80
 7e6:	ec06                	sd	ra,24(sp)
 7e8:	e822                	sd	s0,16(sp)
 7ea:	1000                	addi	s0,sp,32
 7ec:	e010                	sd	a2,0(s0)
 7ee:	e414                	sd	a3,8(s0)
 7f0:	e818                	sd	a4,16(s0)
 7f2:	ec1c                	sd	a5,24(s0)
 7f4:	03043023          	sd	a6,32(s0)
 7f8:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 7fc:	8622                	mv	a2,s0
 7fe:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 802:	00000097          	auipc	ra,0x0
 806:	e04080e7          	jalr	-508(ra) # 606 <vprintf>
}
 80a:	60e2                	ld	ra,24(sp)
 80c:	6442                	ld	s0,16(sp)
 80e:	6161                	addi	sp,sp,80
 810:	8082                	ret

0000000000000812 <printf>:

void
printf(const char *fmt, ...)
{
 812:	711d                	addi	sp,sp,-96
 814:	ec06                	sd	ra,24(sp)
 816:	e822                	sd	s0,16(sp)
 818:	1000                	addi	s0,sp,32
 81a:	e40c                	sd	a1,8(s0)
 81c:	e810                	sd	a2,16(s0)
 81e:	ec14                	sd	a3,24(s0)
 820:	f018                	sd	a4,32(s0)
 822:	f41c                	sd	a5,40(s0)
 824:	03043823          	sd	a6,48(s0)
 828:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 82c:	00840613          	addi	a2,s0,8
 830:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 834:	85aa                	mv	a1,a0
 836:	4505                	li	a0,1
 838:	00000097          	auipc	ra,0x0
 83c:	dce080e7          	jalr	-562(ra) # 606 <vprintf>
}
 840:	60e2                	ld	ra,24(sp)
 842:	6442                	ld	s0,16(sp)
 844:	6125                	addi	sp,sp,96
 846:	8082                	ret

0000000000000848 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 848:	1141                	addi	sp,sp,-16
 84a:	e422                	sd	s0,8(sp)
 84c:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 84e:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 852:	00000797          	auipc	a5,0x0
 856:	2867b783          	ld	a5,646(a5) # ad8 <freep>
 85a:	a02d                	j	884 <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 85c:	4618                	lw	a4,8(a2)
 85e:	9f2d                	addw	a4,a4,a1
 860:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 864:	6398                	ld	a4,0(a5)
 866:	6310                	ld	a2,0(a4)
 868:	a83d                	j	8a6 <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 86a:	ff852703          	lw	a4,-8(a0)
 86e:	9f31                	addw	a4,a4,a2
 870:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 872:	ff053683          	ld	a3,-16(a0)
 876:	a091                	j	8ba <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 878:	6398                	ld	a4,0(a5)
 87a:	00e7e463          	bltu	a5,a4,882 <free+0x3a>
 87e:	00e6ea63          	bltu	a3,a4,892 <free+0x4a>
{
 882:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 884:	fed7fae3          	bgeu	a5,a3,878 <free+0x30>
 888:	6398                	ld	a4,0(a5)
 88a:	00e6e463          	bltu	a3,a4,892 <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 88e:	fee7eae3          	bltu	a5,a4,882 <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
 892:	ff852583          	lw	a1,-8(a0)
 896:	6390                	ld	a2,0(a5)
 898:	02059813          	slli	a6,a1,0x20
 89c:	01c85713          	srli	a4,a6,0x1c
 8a0:	9736                	add	a4,a4,a3
 8a2:	fae60de3          	beq	a2,a4,85c <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
 8a6:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 8aa:	4790                	lw	a2,8(a5)
 8ac:	02061593          	slli	a1,a2,0x20
 8b0:	01c5d713          	srli	a4,a1,0x1c
 8b4:	973e                	add	a4,a4,a5
 8b6:	fae68ae3          	beq	a3,a4,86a <free+0x22>
    p->s.ptr = bp->s.ptr;
 8ba:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 8bc:	00000717          	auipc	a4,0x0
 8c0:	20f73e23          	sd	a5,540(a4) # ad8 <freep>
}
 8c4:	6422                	ld	s0,8(sp)
 8c6:	0141                	addi	sp,sp,16
 8c8:	8082                	ret

00000000000008ca <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8ca:	7139                	addi	sp,sp,-64
 8cc:	fc06                	sd	ra,56(sp)
 8ce:	f822                	sd	s0,48(sp)
 8d0:	f426                	sd	s1,40(sp)
 8d2:	f04a                	sd	s2,32(sp)
 8d4:	ec4e                	sd	s3,24(sp)
 8d6:	e852                	sd	s4,16(sp)
 8d8:	e456                	sd	s5,8(sp)
 8da:	e05a                	sd	s6,0(sp)
 8dc:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8de:	02051493          	slli	s1,a0,0x20
 8e2:	9081                	srli	s1,s1,0x20
 8e4:	04bd                	addi	s1,s1,15
 8e6:	8091                	srli	s1,s1,0x4
 8e8:	00148a1b          	addiw	s4,s1,1
 8ec:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 8ee:	00000517          	auipc	a0,0x0
 8f2:	1ea53503          	ld	a0,490(a0) # ad8 <freep>
 8f6:	c515                	beqz	a0,922 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f8:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 8fa:	4798                	lw	a4,8(a5)
 8fc:	04977163          	bgeu	a4,s1,93e <malloc+0x74>
 900:	89d2                	mv	s3,s4
 902:	000a071b          	sext.w	a4,s4
 906:	6685                	lui	a3,0x1
 908:	00d77363          	bgeu	a4,a3,90e <malloc+0x44>
 90c:	6985                	lui	s3,0x1
 90e:	00098b1b          	sext.w	s6,s3
  p = sbrk(nu * sizeof(Header));
 912:	0049999b          	slliw	s3,s3,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 916:	00000917          	auipc	s2,0x0
 91a:	1c290913          	addi	s2,s2,450 # ad8 <freep>
  if(p == (char*)-1)
 91e:	5afd                	li	s5,-1
 920:	a8a5                	j	998 <malloc+0xce>
    base.s.ptr = freep = prevp = &base;
 922:	00000797          	auipc	a5,0x0
 926:	1b678793          	addi	a5,a5,438 # ad8 <freep>
 92a:	00000717          	auipc	a4,0x0
 92e:	1b670713          	addi	a4,a4,438 # ae0 <base>
 932:	e398                	sd	a4,0(a5)
 934:	e798                	sd	a4,8(a5)
    base.s.size = 0;
 936:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 93a:	87ba                	mv	a5,a4
 93c:	b7d1                	j	900 <malloc+0x36>
      if(p->s.size == nunits)
 93e:	02e48c63          	beq	s1,a4,976 <malloc+0xac>
        p->s.size -= nunits;
 942:	4147073b          	subw	a4,a4,s4
 946:	c798                	sw	a4,8(a5)
        p += p->s.size;
 948:	02071693          	slli	a3,a4,0x20
 94c:	01c6d713          	srli	a4,a3,0x1c
 950:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 952:	0147a423          	sw	s4,8(a5)
      freep = prevp;
 956:	00000717          	auipc	a4,0x0
 95a:	18a73123          	sd	a0,386(a4) # ad8 <freep>
      return (void*)(p + 1);
 95e:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 962:	70e2                	ld	ra,56(sp)
 964:	7442                	ld	s0,48(sp)
 966:	74a2                	ld	s1,40(sp)
 968:	7902                	ld	s2,32(sp)
 96a:	69e2                	ld	s3,24(sp)
 96c:	6a42                	ld	s4,16(sp)
 96e:	6aa2                	ld	s5,8(sp)
 970:	6b02                	ld	s6,0(sp)
 972:	6121                	addi	sp,sp,64
 974:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 976:	6398                	ld	a4,0(a5)
 978:	e118                	sd	a4,0(a0)
 97a:	bff1                	j	956 <malloc+0x8c>
  hp->s.size = nu;
 97c:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 980:	0541                	addi	a0,a0,16
 982:	00000097          	auipc	ra,0x0
 986:	ec6080e7          	jalr	-314(ra) # 848 <free>
  return freep;
 98a:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 98e:	d971                	beqz	a0,962 <malloc+0x98>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 990:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 992:	4798                	lw	a4,8(a5)
 994:	fa9775e3          	bgeu	a4,s1,93e <malloc+0x74>
    if(p == freep)
 998:	00093703          	ld	a4,0(s2)
 99c:	853e                	mv	a0,a5
 99e:	fef719e3          	bne	a4,a5,990 <malloc+0xc6>
  p = sbrk(nu * sizeof(Header));
 9a2:	854e                	mv	a0,s3
 9a4:	00000097          	auipc	ra,0x0
 9a8:	b2e080e7          	jalr	-1234(ra) # 4d2 <sbrk>
  if(p == (char*)-1)
 9ac:	fd5518e3          	bne	a0,s5,97c <malloc+0xb2>
        return 0;
 9b0:	4501                	li	a0,0
 9b2:	bf45                	j	962 <malloc+0x98>
