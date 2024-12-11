
xv6-user/_find:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <find>:
#include "xv6-user/user.h"

static char path[512];

void find(char *filename)
{
   0:	7175                	addi	sp,sp,-144
   2:	e506                	sd	ra,136(sp)
   4:	e122                	sd	s0,128(sp)
   6:	fca6                	sd	s1,120(sp)
   8:	f8ca                	sd	s2,112(sp)
   a:	f4ce                	sd	s3,104(sp)
   c:	f0d2                	sd	s4,96(sp)
   e:	ecd6                	sd	s5,88(sp)
  10:	e8da                	sd	s6,80(sp)
  12:	e4de                	sd	s7,72(sp)
  14:	e0e2                	sd	s8,64(sp)
  16:	0900                	addi	s0,sp,144
  18:	8a2a                	mv	s4,a0
    int fd;
    struct stat st;
    if ((fd = open(path, O_RDONLY)) < 0) {
  1a:	4581                	li	a1,0
  1c:	00001517          	auipc	a0,0x1
  20:	aec50513          	addi	a0,a0,-1300 # b08 <path>
  24:	00000097          	auipc	ra,0x0
  28:	4da080e7          	jalr	1242(ra) # 4fe <open>
  2c:	04054163          	bltz	a0,6e <find+0x6e>
  30:	84aa                	mv	s1,a0
        fprintf(2, "find: cannot open %s\n", path);
        return;
    }
    if (fstat(fd, &st) < 0) {
  32:	f7840593          	addi	a1,s0,-136
  36:	00000097          	auipc	ra,0x0
  3a:	4d0080e7          	jalr	1232(ra) # 506 <fstat>
  3e:	04054663          	bltz	a0,8a <find+0x8a>
        fprintf(2, "find: cannot stat %s\n", path);
        close(fd);
        return;
    }
    if (st.type != T_DIR) {
  42:	fa041703          	lh	a4,-96(s0)
  46:	4785                	li	a5,1
  48:	06f70463          	beq	a4,a5,b0 <find+0xb0>
        close(fd);
  4c:	8526                	mv	a0,s1
  4e:	00000097          	auipc	ra,0x0
  52:	498080e7          	jalr	1176(ra) # 4e6 <close>
        }
        find(filename);
    }
    close(fd);
    return;
}
  56:	60aa                	ld	ra,136(sp)
  58:	640a                	ld	s0,128(sp)
  5a:	74e6                	ld	s1,120(sp)
  5c:	7946                	ld	s2,112(sp)
  5e:	79a6                	ld	s3,104(sp)
  60:	7a06                	ld	s4,96(sp)
  62:	6ae6                	ld	s5,88(sp)
  64:	6b46                	ld	s6,80(sp)
  66:	6ba6                	ld	s7,72(sp)
  68:	6c06                	ld	s8,64(sp)
  6a:	6149                	addi	sp,sp,144
  6c:	8082                	ret
        fprintf(2, "find: cannot open %s\n", path);
  6e:	00001617          	auipc	a2,0x1
  72:	a9a60613          	addi	a2,a2,-1382 # b08 <path>
  76:	00001597          	auipc	a1,0x1
  7a:	99a58593          	addi	a1,a1,-1638 # a10 <malloc+0xea>
  7e:	4509                	li	a0,2
  80:	00000097          	auipc	ra,0x0
  84:	7c0080e7          	jalr	1984(ra) # 840 <fprintf>
        return;
  88:	b7f9                	j	56 <find+0x56>
        fprintf(2, "find: cannot stat %s\n", path);
  8a:	00001617          	auipc	a2,0x1
  8e:	a7e60613          	addi	a2,a2,-1410 # b08 <path>
  92:	00001597          	auipc	a1,0x1
  96:	99658593          	addi	a1,a1,-1642 # a28 <malloc+0x102>
  9a:	4509                	li	a0,2
  9c:	00000097          	auipc	ra,0x0
  a0:	7a4080e7          	jalr	1956(ra) # 840 <fprintf>
        close(fd);
  a4:	8526                	mv	a0,s1
  a6:	00000097          	auipc	ra,0x0
  aa:	440080e7          	jalr	1088(ra) # 4e6 <close>
        return;
  ae:	b765                	j	56 <find+0x56>
    if (strlen(path) + 255 + 2 > sizeof(path)) {
  b0:	00001517          	auipc	a0,0x1
  b4:	a5850513          	addi	a0,a0,-1448 # b08 <path>
  b8:	00000097          	auipc	ra,0x0
  bc:	1c4080e7          	jalr	452(ra) # 27c <strlen>
  c0:	1015051b          	addiw	a0,a0,257
  c4:	20000793          	li	a5,512
  c8:	0aa7e863          	bltu	a5,a0,178 <find+0x178>
    char *p = path + strlen(path) - 1;
  cc:	00001917          	auipc	s2,0x1
  d0:	a3c90913          	addi	s2,s2,-1476 # b08 <path>
  d4:	854a                	mv	a0,s2
  d6:	00000097          	auipc	ra,0x0
  da:	1a6080e7          	jalr	422(ra) # 27c <strlen>
  de:	1502                	slli	a0,a0,0x20
  e0:	9101                	srli	a0,a0,0x20
  e2:	fff50793          	addi	a5,a0,-1
  e6:	993e                	add	s2,s2,a5
    if (*p != '/') {
  e8:	00094703          	lbu	a4,0(s2)
  ec:	02f00793          	li	a5,47
  f0:	00f70963          	beq	a4,a5,102 <find+0x102>
        *++p = '/';
  f4:	00f900a3          	sb	a5,1(s2)
  f8:	00001917          	auipc	s2,0x1
  fc:	a1090913          	addi	s2,s2,-1520 # b08 <path>
 100:	992a                	add	s2,s2,a0
    p++;
 102:	0905                	addi	s2,s2,1
    while (readdir(fd, &st)) {
 104:	f7840993          	addi	s3,s0,-136
        if (strcmp(p, ".") == 0 || strcmp(p, "..") == 0) {
 108:	00001a97          	auipc	s5,0x1
 10c:	950a8a93          	addi	s5,s5,-1712 # a58 <malloc+0x132>
 110:	00001b17          	auipc	s6,0x1
 114:	950b0b13          	addi	s6,s6,-1712 # a60 <malloc+0x13a>
            fprintf(1, "%s\n", path);
 118:	00001c17          	auipc	s8,0x1
 11c:	9f0c0c13          	addi	s8,s8,-1552 # b08 <path>
 120:	00001b97          	auipc	s7,0x1
 124:	948b8b93          	addi	s7,s7,-1720 # a68 <malloc+0x142>
    while (readdir(fd, &st)) {
 128:	85ce                	mv	a1,s3
 12a:	8526                	mv	a0,s1
 12c:	00000097          	auipc	ra,0x0
 130:	42c080e7          	jalr	1068(ra) # 558 <readdir>
 134:	c92d                	beqz	a0,1a6 <find+0x1a6>
        strcpy(p, st.name);
 136:	85ce                	mv	a1,s3
 138:	854a                	mv	a0,s2
 13a:	00000097          	auipc	ra,0x0
 13e:	0cc080e7          	jalr	204(ra) # 206 <strcpy>
        if (strcmp(p, ".") == 0 || strcmp(p, "..") == 0) {
 142:	85d6                	mv	a1,s5
 144:	854a                	mv	a0,s2
 146:	00000097          	auipc	ra,0x0
 14a:	10a080e7          	jalr	266(ra) # 250 <strcmp>
 14e:	dd69                	beqz	a0,128 <find+0x128>
 150:	85da                	mv	a1,s6
 152:	854a                	mv	a0,s2
 154:	00000097          	auipc	ra,0x0
 158:	0fc080e7          	jalr	252(ra) # 250 <strcmp>
 15c:	d571                	beqz	a0,128 <find+0x128>
        if (strcmp(p, filename) == 0) {
 15e:	85d2                	mv	a1,s4
 160:	854a                	mv	a0,s2
 162:	00000097          	auipc	ra,0x0
 166:	0ee080e7          	jalr	238(ra) # 250 <strcmp>
 16a:	c515                	beqz	a0,196 <find+0x196>
        find(filename);
 16c:	8552                	mv	a0,s4
 16e:	00000097          	auipc	ra,0x0
 172:	e92080e7          	jalr	-366(ra) # 0 <find>
 176:	bf4d                	j	128 <find+0x128>
        fprintf(2, "find: path too long\n");
 178:	00001597          	auipc	a1,0x1
 17c:	8c858593          	addi	a1,a1,-1848 # a40 <malloc+0x11a>
 180:	4509                	li	a0,2
 182:	00000097          	auipc	ra,0x0
 186:	6be080e7          	jalr	1726(ra) # 840 <fprintf>
        close(fd);
 18a:	8526                	mv	a0,s1
 18c:	00000097          	auipc	ra,0x0
 190:	35a080e7          	jalr	858(ra) # 4e6 <close>
        return;
 194:	b5c9                	j	56 <find+0x56>
            fprintf(1, "%s\n", path);
 196:	8662                	mv	a2,s8
 198:	85de                	mv	a1,s7
 19a:	4505                	li	a0,1
 19c:	00000097          	auipc	ra,0x0
 1a0:	6a4080e7          	jalr	1700(ra) # 840 <fprintf>
 1a4:	b7e1                	j	16c <find+0x16c>
    close(fd);
 1a6:	8526                	mv	a0,s1
 1a8:	00000097          	auipc	ra,0x0
 1ac:	33e080e7          	jalr	830(ra) # 4e6 <close>
    return;
 1b0:	b55d                	j	56 <find+0x56>

00000000000001b2 <main>:


int main(int argc, char *argv[])
{
 1b2:	1101                	addi	sp,sp,-32
 1b4:	ec06                	sd	ra,24(sp)
 1b6:	e822                	sd	s0,16(sp)
 1b8:	e426                	sd	s1,8(sp)
 1ba:	1000                	addi	s0,sp,32
    if (argc < 3) {
 1bc:	4789                	li	a5,2
 1be:	02a7c063          	blt	a5,a0,1de <main+0x2c>
        fprintf(2, "Usage: find DIR FILENAME\n");
 1c2:	00001597          	auipc	a1,0x1
 1c6:	8ae58593          	addi	a1,a1,-1874 # a70 <malloc+0x14a>
 1ca:	4509                	li	a0,2
 1cc:	00000097          	auipc	ra,0x0
 1d0:	674080e7          	jalr	1652(ra) # 840 <fprintf>
        exit(0);
 1d4:	4501                	li	a0,0
 1d6:	00000097          	auipc	ra,0x0
 1da:	2e8080e7          	jalr	744(ra) # 4be <exit>
 1de:	84ae                	mv	s1,a1
    } else {
        strcpy(path, argv[1]);
 1e0:	658c                	ld	a1,8(a1)
 1e2:	00001517          	auipc	a0,0x1
 1e6:	92650513          	addi	a0,a0,-1754 # b08 <path>
 1ea:	00000097          	auipc	ra,0x0
 1ee:	01c080e7          	jalr	28(ra) # 206 <strcpy>
        find(argv[2]);
 1f2:	6888                	ld	a0,16(s1)
 1f4:	00000097          	auipc	ra,0x0
 1f8:	e0c080e7          	jalr	-500(ra) # 0 <find>
    }
    exit(0);
 1fc:	4501                	li	a0,0
 1fe:	00000097          	auipc	ra,0x0
 202:	2c0080e7          	jalr	704(ra) # 4be <exit>

0000000000000206 <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
 206:	1141                	addi	sp,sp,-16
 208:	e422                	sd	s0,8(sp)
 20a:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 20c:	87aa                	mv	a5,a0
 20e:	0585                	addi	a1,a1,1
 210:	0785                	addi	a5,a5,1
 212:	fff5c703          	lbu	a4,-1(a1)
 216:	fee78fa3          	sb	a4,-1(a5)
 21a:	fb75                	bnez	a4,20e <strcpy+0x8>
    ;
  return os;
}
 21c:	6422                	ld	s0,8(sp)
 21e:	0141                	addi	sp,sp,16
 220:	8082                	ret

0000000000000222 <strcat>:

char*
strcat(char *s, const char *t)
{
 222:	1141                	addi	sp,sp,-16
 224:	e422                	sd	s0,8(sp)
 226:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
 228:	00054783          	lbu	a5,0(a0)
 22c:	c385                	beqz	a5,24c <strcat+0x2a>
 22e:	87aa                	mv	a5,a0
    s++;
 230:	0785                	addi	a5,a5,1
  while(*s)
 232:	0007c703          	lbu	a4,0(a5)
 236:	ff6d                	bnez	a4,230 <strcat+0xe>
  while((*s++ = *t++))
 238:	0585                	addi	a1,a1,1
 23a:	0785                	addi	a5,a5,1
 23c:	fff5c703          	lbu	a4,-1(a1)
 240:	fee78fa3          	sb	a4,-1(a5)
 244:	fb75                	bnez	a4,238 <strcat+0x16>
    ;
  return os;
}
 246:	6422                	ld	s0,8(sp)
 248:	0141                	addi	sp,sp,16
 24a:	8082                	ret
  while(*s)
 24c:	87aa                	mv	a5,a0
 24e:	b7ed                	j	238 <strcat+0x16>

0000000000000250 <strcmp>:


int
strcmp(const char *p, const char *q)
{
 250:	1141                	addi	sp,sp,-16
 252:	e422                	sd	s0,8(sp)
 254:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 256:	00054783          	lbu	a5,0(a0)
 25a:	cb91                	beqz	a5,26e <strcmp+0x1e>
 25c:	0005c703          	lbu	a4,0(a1)
 260:	00f71763          	bne	a4,a5,26e <strcmp+0x1e>
    p++, q++;
 264:	0505                	addi	a0,a0,1
 266:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 268:	00054783          	lbu	a5,0(a0)
 26c:	fbe5                	bnez	a5,25c <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 26e:	0005c503          	lbu	a0,0(a1)
}
 272:	40a7853b          	subw	a0,a5,a0
 276:	6422                	ld	s0,8(sp)
 278:	0141                	addi	sp,sp,16
 27a:	8082                	ret

000000000000027c <strlen>:

uint
strlen(const char *s)
{
 27c:	1141                	addi	sp,sp,-16
 27e:	e422                	sd	s0,8(sp)
 280:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 282:	00054783          	lbu	a5,0(a0)
 286:	cf91                	beqz	a5,2a2 <strlen+0x26>
 288:	0505                	addi	a0,a0,1
 28a:	87aa                	mv	a5,a0
 28c:	4685                	li	a3,1
 28e:	9e89                	subw	a3,a3,a0
 290:	00f6853b          	addw	a0,a3,a5
 294:	0785                	addi	a5,a5,1
 296:	fff7c703          	lbu	a4,-1(a5)
 29a:	fb7d                	bnez	a4,290 <strlen+0x14>
    ;
  return n;
}
 29c:	6422                	ld	s0,8(sp)
 29e:	0141                	addi	sp,sp,16
 2a0:	8082                	ret
  for(n = 0; s[n]; n++)
 2a2:	4501                	li	a0,0
 2a4:	bfe5                	j	29c <strlen+0x20>

00000000000002a6 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2a6:	1141                	addi	sp,sp,-16
 2a8:	e422                	sd	s0,8(sp)
 2aa:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 2ac:	ca19                	beqz	a2,2c2 <memset+0x1c>
 2ae:	87aa                	mv	a5,a0
 2b0:	1602                	slli	a2,a2,0x20
 2b2:	9201                	srli	a2,a2,0x20
 2b4:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 2b8:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 2bc:	0785                	addi	a5,a5,1
 2be:	fee79de3          	bne	a5,a4,2b8 <memset+0x12>
  }
  return dst;
}
 2c2:	6422                	ld	s0,8(sp)
 2c4:	0141                	addi	sp,sp,16
 2c6:	8082                	ret

00000000000002c8 <strchr>:

char*
strchr(const char *s, char c)
{
 2c8:	1141                	addi	sp,sp,-16
 2ca:	e422                	sd	s0,8(sp)
 2cc:	0800                	addi	s0,sp,16
  for(; *s; s++)
 2ce:	00054783          	lbu	a5,0(a0)
 2d2:	cb99                	beqz	a5,2e8 <strchr+0x20>
    if(*s == c)
 2d4:	00f58763          	beq	a1,a5,2e2 <strchr+0x1a>
  for(; *s; s++)
 2d8:	0505                	addi	a0,a0,1
 2da:	00054783          	lbu	a5,0(a0)
 2de:	fbfd                	bnez	a5,2d4 <strchr+0xc>
      return (char*)s;
  return 0;
 2e0:	4501                	li	a0,0
}
 2e2:	6422                	ld	s0,8(sp)
 2e4:	0141                	addi	sp,sp,16
 2e6:	8082                	ret
  return 0;
 2e8:	4501                	li	a0,0
 2ea:	bfe5                	j	2e2 <strchr+0x1a>

00000000000002ec <gets>:

char*
gets(char *buf, int max)
{
 2ec:	711d                	addi	sp,sp,-96
 2ee:	ec86                	sd	ra,88(sp)
 2f0:	e8a2                	sd	s0,80(sp)
 2f2:	e4a6                	sd	s1,72(sp)
 2f4:	e0ca                	sd	s2,64(sp)
 2f6:	fc4e                	sd	s3,56(sp)
 2f8:	f852                	sd	s4,48(sp)
 2fa:	f456                	sd	s5,40(sp)
 2fc:	f05a                	sd	s6,32(sp)
 2fe:	ec5e                	sd	s7,24(sp)
 300:	e862                	sd	s8,16(sp)
 302:	1080                	addi	s0,sp,96
 304:	8baa                	mv	s7,a0
 306:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 308:	892a                	mv	s2,a0
 30a:	4481                	li	s1,0
    cc = read(0, &c, 1);
 30c:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 310:	4b29                	li	s6,10
 312:	4c35                	li	s8,13
  for(i=0; i+1 < max; ){
 314:	89a6                	mv	s3,s1
 316:	2485                	addiw	s1,s1,1
 318:	0344d763          	bge	s1,s4,346 <gets+0x5a>
    cc = read(0, &c, 1);
 31c:	4605                	li	a2,1
 31e:	85d6                	mv	a1,s5
 320:	4501                	li	a0,0
 322:	00000097          	auipc	ra,0x0
 326:	1b4080e7          	jalr	436(ra) # 4d6 <read>
    if(cc < 1)
 32a:	00a05e63          	blez	a0,346 <gets+0x5a>
    buf[i++] = c;
 32e:	faf44783          	lbu	a5,-81(s0)
 332:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 336:	01678763          	beq	a5,s6,344 <gets+0x58>
 33a:	0905                	addi	s2,s2,1
 33c:	fd879ce3          	bne	a5,s8,314 <gets+0x28>
  for(i=0; i+1 < max; ){
 340:	89a6                	mv	s3,s1
 342:	a011                	j	346 <gets+0x5a>
 344:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 346:	99de                	add	s3,s3,s7
 348:	00098023          	sb	zero,0(s3)
  return buf;
}
 34c:	855e                	mv	a0,s7
 34e:	60e6                	ld	ra,88(sp)
 350:	6446                	ld	s0,80(sp)
 352:	64a6                	ld	s1,72(sp)
 354:	6906                	ld	s2,64(sp)
 356:	79e2                	ld	s3,56(sp)
 358:	7a42                	ld	s4,48(sp)
 35a:	7aa2                	ld	s5,40(sp)
 35c:	7b02                	ld	s6,32(sp)
 35e:	6be2                	ld	s7,24(sp)
 360:	6c42                	ld	s8,16(sp)
 362:	6125                	addi	sp,sp,96
 364:	8082                	ret

0000000000000366 <stat>:

int
stat(const char *n, struct stat *st)
{
 366:	1101                	addi	sp,sp,-32
 368:	ec06                	sd	ra,24(sp)
 36a:	e822                	sd	s0,16(sp)
 36c:	e426                	sd	s1,8(sp)
 36e:	e04a                	sd	s2,0(sp)
 370:	1000                	addi	s0,sp,32
 372:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 374:	4581                	li	a1,0
 376:	00000097          	auipc	ra,0x0
 37a:	188080e7          	jalr	392(ra) # 4fe <open>
  if(fd < 0)
 37e:	02054563          	bltz	a0,3a8 <stat+0x42>
 382:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 384:	85ca                	mv	a1,s2
 386:	00000097          	auipc	ra,0x0
 38a:	180080e7          	jalr	384(ra) # 506 <fstat>
 38e:	892a                	mv	s2,a0
  close(fd);
 390:	8526                	mv	a0,s1
 392:	00000097          	auipc	ra,0x0
 396:	154080e7          	jalr	340(ra) # 4e6 <close>
  return r;
}
 39a:	854a                	mv	a0,s2
 39c:	60e2                	ld	ra,24(sp)
 39e:	6442                	ld	s0,16(sp)
 3a0:	64a2                	ld	s1,8(sp)
 3a2:	6902                	ld	s2,0(sp)
 3a4:	6105                	addi	sp,sp,32
 3a6:	8082                	ret
    return -1;
 3a8:	597d                	li	s2,-1
 3aa:	bfc5                	j	39a <stat+0x34>

00000000000003ac <atoi>:

int
atoi(const char *s)
{
 3ac:	1141                	addi	sp,sp,-16
 3ae:	e422                	sd	s0,8(sp)
 3b0:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 3b2:	00054703          	lbu	a4,0(a0)
 3b6:	02d00793          	li	a5,45
  int neg = 1;
 3ba:	4585                	li	a1,1
  if (*s == '-') {
 3bc:	04f70363          	beq	a4,a5,402 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 3c0:	00054703          	lbu	a4,0(a0)
 3c4:	fd07079b          	addiw	a5,a4,-48
 3c8:	0ff7f793          	zext.b	a5,a5
 3cc:	46a5                	li	a3,9
 3ce:	02f6ed63          	bltu	a3,a5,408 <atoi+0x5c>
  n = 0;
 3d2:	4681                	li	a3,0
  while('0' <= *s && *s <= '9')
 3d4:	4625                	li	a2,9
    n = n*10 + *s++ - '0';
 3d6:	0505                	addi	a0,a0,1
 3d8:	0026979b          	slliw	a5,a3,0x2
 3dc:	9fb5                	addw	a5,a5,a3
 3de:	0017979b          	slliw	a5,a5,0x1
 3e2:	9fb9                	addw	a5,a5,a4
 3e4:	fd07869b          	addiw	a3,a5,-48
  while('0' <= *s && *s <= '9')
 3e8:	00054703          	lbu	a4,0(a0)
 3ec:	fd07079b          	addiw	a5,a4,-48
 3f0:	0ff7f793          	zext.b	a5,a5
 3f4:	fef671e3          	bgeu	a2,a5,3d6 <atoi+0x2a>
  return n * neg;
}
 3f8:	02d5853b          	mulw	a0,a1,a3
 3fc:	6422                	ld	s0,8(sp)
 3fe:	0141                	addi	sp,sp,16
 400:	8082                	ret
    s++;
 402:	0505                	addi	a0,a0,1
    neg = -1;
 404:	55fd                	li	a1,-1
 406:	bf6d                	j	3c0 <atoi+0x14>
  n = 0;
 408:	4681                	li	a3,0
 40a:	b7fd                	j	3f8 <atoi+0x4c>

000000000000040c <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 40c:	1141                	addi	sp,sp,-16
 40e:	e422                	sd	s0,8(sp)
 410:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 412:	02b57463          	bgeu	a0,a1,43a <memmove+0x2e>
    while(n-- > 0)
 416:	00c05f63          	blez	a2,434 <memmove+0x28>
 41a:	1602                	slli	a2,a2,0x20
 41c:	9201                	srli	a2,a2,0x20
 41e:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 422:	872a                	mv	a4,a0
      *dst++ = *src++;
 424:	0585                	addi	a1,a1,1
 426:	0705                	addi	a4,a4,1
 428:	fff5c683          	lbu	a3,-1(a1)
 42c:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 430:	fee79ae3          	bne	a5,a4,424 <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 434:	6422                	ld	s0,8(sp)
 436:	0141                	addi	sp,sp,16
 438:	8082                	ret
    dst += n;
 43a:	00c50733          	add	a4,a0,a2
    src += n;
 43e:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 440:	fec05ae3          	blez	a2,434 <memmove+0x28>
 444:	fff6079b          	addiw	a5,a2,-1
 448:	1782                	slli	a5,a5,0x20
 44a:	9381                	srli	a5,a5,0x20
 44c:	fff7c793          	not	a5,a5
 450:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 452:	15fd                	addi	a1,a1,-1
 454:	177d                	addi	a4,a4,-1
 456:	0005c683          	lbu	a3,0(a1)
 45a:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 45e:	fee79ae3          	bne	a5,a4,452 <memmove+0x46>
 462:	bfc9                	j	434 <memmove+0x28>

0000000000000464 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 464:	1141                	addi	sp,sp,-16
 466:	e422                	sd	s0,8(sp)
 468:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 46a:	ca05                	beqz	a2,49a <memcmp+0x36>
 46c:	fff6069b          	addiw	a3,a2,-1
 470:	1682                	slli	a3,a3,0x20
 472:	9281                	srli	a3,a3,0x20
 474:	0685                	addi	a3,a3,1
 476:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 478:	00054783          	lbu	a5,0(a0)
 47c:	0005c703          	lbu	a4,0(a1)
 480:	00e79863          	bne	a5,a4,490 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 484:	0505                	addi	a0,a0,1
    p2++;
 486:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 488:	fed518e3          	bne	a0,a3,478 <memcmp+0x14>
  }
  return 0;
 48c:	4501                	li	a0,0
 48e:	a019                	j	494 <memcmp+0x30>
      return *p1 - *p2;
 490:	40e7853b          	subw	a0,a5,a4
}
 494:	6422                	ld	s0,8(sp)
 496:	0141                	addi	sp,sp,16
 498:	8082                	ret
  return 0;
 49a:	4501                	li	a0,0
 49c:	bfe5                	j	494 <memcmp+0x30>

000000000000049e <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 49e:	1141                	addi	sp,sp,-16
 4a0:	e406                	sd	ra,8(sp)
 4a2:	e022                	sd	s0,0(sp)
 4a4:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 4a6:	00000097          	auipc	ra,0x0
 4aa:	f66080e7          	jalr	-154(ra) # 40c <memmove>
}
 4ae:	60a2                	ld	ra,8(sp)
 4b0:	6402                	ld	s0,0(sp)
 4b2:	0141                	addi	sp,sp,16
 4b4:	8082                	ret

00000000000004b6 <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 4b6:	4885                	li	a7,1
 ecall
 4b8:	00000073          	ecall
 ret
 4bc:	8082                	ret

00000000000004be <exit>:
.global exit
exit:
 li a7, SYS_exit
 4be:	4889                	li	a7,2
 ecall
 4c0:	00000073          	ecall
 ret
 4c4:	8082                	ret

00000000000004c6 <wait>:
.global wait
wait:
 li a7, SYS_wait
 4c6:	488d                	li	a7,3
 ecall
 4c8:	00000073          	ecall
 ret
 4cc:	8082                	ret

00000000000004ce <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 4ce:	4891                	li	a7,4
 ecall
 4d0:	00000073          	ecall
 ret
 4d4:	8082                	ret

00000000000004d6 <read>:
.global read
read:
 li a7, SYS_read
 4d6:	4895                	li	a7,5
 ecall
 4d8:	00000073          	ecall
 ret
 4dc:	8082                	ret

00000000000004de <write>:
.global write
write:
 li a7, SYS_write
 4de:	48c1                	li	a7,16
 ecall
 4e0:	00000073          	ecall
 ret
 4e4:	8082                	ret

00000000000004e6 <close>:
.global close
close:
 li a7, SYS_close
 4e6:	48d5                	li	a7,21
 ecall
 4e8:	00000073          	ecall
 ret
 4ec:	8082                	ret

00000000000004ee <kill>:
.global kill
kill:
 li a7, SYS_kill
 4ee:	4899                	li	a7,6
 ecall
 4f0:	00000073          	ecall
 ret
 4f4:	8082                	ret

00000000000004f6 <exec>:
.global exec
exec:
 li a7, SYS_exec
 4f6:	489d                	li	a7,7
 ecall
 4f8:	00000073          	ecall
 ret
 4fc:	8082                	ret

00000000000004fe <open>:
.global open
open:
 li a7, SYS_open
 4fe:	48bd                	li	a7,15
 ecall
 500:	00000073          	ecall
 ret
 504:	8082                	ret

0000000000000506 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 506:	48a1                	li	a7,8
 ecall
 508:	00000073          	ecall
 ret
 50c:	8082                	ret

000000000000050e <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 50e:	48d1                	li	a7,20
 ecall
 510:	00000073          	ecall
 ret
 514:	8082                	ret

0000000000000516 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 516:	48a5                	li	a7,9
 ecall
 518:	00000073          	ecall
 ret
 51c:	8082                	ret

000000000000051e <dup>:
.global dup
dup:
 li a7, SYS_dup
 51e:	48a9                	li	a7,10
 ecall
 520:	00000073          	ecall
 ret
 524:	8082                	ret

0000000000000526 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 526:	48ad                	li	a7,11
 ecall
 528:	00000073          	ecall
 ret
 52c:	8082                	ret

000000000000052e <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 52e:	48b1                	li	a7,12
 ecall
 530:	00000073          	ecall
 ret
 534:	8082                	ret

0000000000000536 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 536:	48b5                	li	a7,13
 ecall
 538:	00000073          	ecall
 ret
 53c:	8082                	ret

000000000000053e <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 53e:	48b9                	li	a7,14
 ecall
 540:	00000073          	ecall
 ret
 544:	8082                	ret

0000000000000546 <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 546:	48d9                	li	a7,22
 ecall
 548:	00000073          	ecall
 ret
 54c:	8082                	ret

000000000000054e <dev>:
.global dev
dev:
 li a7, SYS_dev
 54e:	0e900893          	li	a7,233
 ecall
 552:	00000073          	ecall
 ret
 556:	8082                	ret

0000000000000558 <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 558:	0f400893          	li	a7,244
 ecall
 55c:	00000073          	ecall
 ret
 560:	8082                	ret

0000000000000562 <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 562:	48e5                	li	a7,25
 ecall
 564:	00000073          	ecall
 ret
 568:	8082                	ret

000000000000056a <remove>:
.global remove
remove:
 li a7, SYS_remove
 56a:	0b100893          	li	a7,177
 ecall
 56e:	00000073          	ecall
 ret
 572:	8082                	ret

0000000000000574 <trace>:
.global trace
trace:
 li a7, SYS_trace
 574:	48c9                	li	a7,18
 ecall
 576:	00000073          	ecall
 ret
 57a:	8082                	ret

000000000000057c <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 57c:	48cd                	li	a7,19
 ecall
 57e:	00000073          	ecall
 ret
 582:	8082                	ret

0000000000000584 <rename>:
.global rename
rename:
 li a7, SYS_rename
 584:	48e9                	li	a7,26
 ecall
 586:	00000073          	ecall
 ret
 58a:	8082                	ret

000000000000058c <poweroff>:
.global poweroff
poweroff:
 li a7, SYS_poweroff
 58c:	0d200893          	li	a7,210
 ecall
 590:	00000073          	ecall
 ret
 594:	8082                	ret

0000000000000596 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 596:	1101                	addi	sp,sp,-32
 598:	ec06                	sd	ra,24(sp)
 59a:	e822                	sd	s0,16(sp)
 59c:	1000                	addi	s0,sp,32
 59e:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 5a2:	4605                	li	a2,1
 5a4:	fef40593          	addi	a1,s0,-17
 5a8:	00000097          	auipc	ra,0x0
 5ac:	f36080e7          	jalr	-202(ra) # 4de <write>
}
 5b0:	60e2                	ld	ra,24(sp)
 5b2:	6442                	ld	s0,16(sp)
 5b4:	6105                	addi	sp,sp,32
 5b6:	8082                	ret

00000000000005b8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5b8:	7139                	addi	sp,sp,-64
 5ba:	fc06                	sd	ra,56(sp)
 5bc:	f822                	sd	s0,48(sp)
 5be:	f426                	sd	s1,40(sp)
 5c0:	f04a                	sd	s2,32(sp)
 5c2:	ec4e                	sd	s3,24(sp)
 5c4:	0080                	addi	s0,sp,64
 5c6:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5c8:	c299                	beqz	a3,5ce <printint+0x16>
 5ca:	0805c863          	bltz	a1,65a <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 5ce:	2581                	sext.w	a1,a1
  neg = 0;
 5d0:	4881                	li	a7,0
  }

  i = 0;
 5d2:	fc040993          	addi	s3,s0,-64
  neg = 0;
 5d6:	86ce                	mv	a3,s3
  i = 0;
 5d8:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 5da:	2601                	sext.w	a2,a2
 5dc:	00000517          	auipc	a0,0x0
 5e0:	51450513          	addi	a0,a0,1300 # af0 <digits>
 5e4:	883a                	mv	a6,a4
 5e6:	2705                	addiw	a4,a4,1
 5e8:	02c5f7bb          	remuw	a5,a1,a2
 5ec:	1782                	slli	a5,a5,0x20
 5ee:	9381                	srli	a5,a5,0x20
 5f0:	97aa                	add	a5,a5,a0
 5f2:	0007c783          	lbu	a5,0(a5)
 5f6:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 5fa:	0005879b          	sext.w	a5,a1
 5fe:	02c5d5bb          	divuw	a1,a1,a2
 602:	0685                	addi	a3,a3,1
 604:	fec7f0e3          	bgeu	a5,a2,5e4 <printint+0x2c>
  if(neg)
 608:	00088c63          	beqz	a7,620 <printint+0x68>
    buf[i++] = '-';
 60c:	fd070793          	addi	a5,a4,-48
 610:	00878733          	add	a4,a5,s0
 614:	02d00793          	li	a5,45
 618:	fef70823          	sb	a5,-16(a4)
 61c:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 620:	02e05663          	blez	a4,64c <printint+0x94>
 624:	fc040913          	addi	s2,s0,-64
 628:	993a                	add	s2,s2,a4
 62a:	19fd                	addi	s3,s3,-1
 62c:	99ba                	add	s3,s3,a4
 62e:	377d                	addiw	a4,a4,-1
 630:	1702                	slli	a4,a4,0x20
 632:	9301                	srli	a4,a4,0x20
 634:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 638:	fff94583          	lbu	a1,-1(s2)
 63c:	8526                	mv	a0,s1
 63e:	00000097          	auipc	ra,0x0
 642:	f58080e7          	jalr	-168(ra) # 596 <putc>
  while(--i >= 0)
 646:	197d                	addi	s2,s2,-1
 648:	ff3918e3          	bne	s2,s3,638 <printint+0x80>
}
 64c:	70e2                	ld	ra,56(sp)
 64e:	7442                	ld	s0,48(sp)
 650:	74a2                	ld	s1,40(sp)
 652:	7902                	ld	s2,32(sp)
 654:	69e2                	ld	s3,24(sp)
 656:	6121                	addi	sp,sp,64
 658:	8082                	ret
    x = -xx;
 65a:	40b005bb          	negw	a1,a1
    neg = 1;
 65e:	4885                	li	a7,1
    x = -xx;
 660:	bf8d                	j	5d2 <printint+0x1a>

0000000000000662 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 662:	7119                	addi	sp,sp,-128
 664:	fc86                	sd	ra,120(sp)
 666:	f8a2                	sd	s0,112(sp)
 668:	f4a6                	sd	s1,104(sp)
 66a:	f0ca                	sd	s2,96(sp)
 66c:	ecce                	sd	s3,88(sp)
 66e:	e8d2                	sd	s4,80(sp)
 670:	e4d6                	sd	s5,72(sp)
 672:	e0da                	sd	s6,64(sp)
 674:	fc5e                	sd	s7,56(sp)
 676:	f862                	sd	s8,48(sp)
 678:	f466                	sd	s9,40(sp)
 67a:	f06a                	sd	s10,32(sp)
 67c:	ec6e                	sd	s11,24(sp)
 67e:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 680:	0005c903          	lbu	s2,0(a1)
 684:	18090f63          	beqz	s2,822 <vprintf+0x1c0>
 688:	8aaa                	mv	s5,a0
 68a:	8b32                	mv	s6,a2
 68c:	00158493          	addi	s1,a1,1
  state = 0;
 690:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 692:	02500a13          	li	s4,37
 696:	4c55                	li	s8,21
 698:	00000c97          	auipc	s9,0x0
 69c:	400c8c93          	addi	s9,s9,1024 # a98 <malloc+0x172>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
        s = va_arg(ap, char*);
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 6a0:	02800d93          	li	s11,40
  putc(fd, 'x');
 6a4:	4d41                	li	s10,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 6a6:	00000b97          	auipc	s7,0x0
 6aa:	44ab8b93          	addi	s7,s7,1098 # af0 <digits>
 6ae:	a839                	j	6cc <vprintf+0x6a>
        putc(fd, c);
 6b0:	85ca                	mv	a1,s2
 6b2:	8556                	mv	a0,s5
 6b4:	00000097          	auipc	ra,0x0
 6b8:	ee2080e7          	jalr	-286(ra) # 596 <putc>
 6bc:	a019                	j	6c2 <vprintf+0x60>
    } else if(state == '%'){
 6be:	01498d63          	beq	s3,s4,6d8 <vprintf+0x76>
  for(i = 0; fmt[i]; i++){
 6c2:	0485                	addi	s1,s1,1
 6c4:	fff4c903          	lbu	s2,-1(s1)
 6c8:	14090d63          	beqz	s2,822 <vprintf+0x1c0>
    if(state == 0){
 6cc:	fe0999e3          	bnez	s3,6be <vprintf+0x5c>
      if(c == '%'){
 6d0:	ff4910e3          	bne	s2,s4,6b0 <vprintf+0x4e>
        state = '%';
 6d4:	89d2                	mv	s3,s4
 6d6:	b7f5                	j	6c2 <vprintf+0x60>
      if(c == 'd'){
 6d8:	11490c63          	beq	s2,s4,7f0 <vprintf+0x18e>
 6dc:	f9d9079b          	addiw	a5,s2,-99
 6e0:	0ff7f793          	zext.b	a5,a5
 6e4:	10fc6e63          	bltu	s8,a5,800 <vprintf+0x19e>
 6e8:	f9d9079b          	addiw	a5,s2,-99
 6ec:	0ff7f713          	zext.b	a4,a5
 6f0:	10ec6863          	bltu	s8,a4,800 <vprintf+0x19e>
 6f4:	00271793          	slli	a5,a4,0x2
 6f8:	97e6                	add	a5,a5,s9
 6fa:	439c                	lw	a5,0(a5)
 6fc:	97e6                	add	a5,a5,s9
 6fe:	8782                	jr	a5
        printint(fd, va_arg(ap, int), 10, 1);
 700:	008b0913          	addi	s2,s6,8
 704:	4685                	li	a3,1
 706:	4629                	li	a2,10
 708:	000b2583          	lw	a1,0(s6)
 70c:	8556                	mv	a0,s5
 70e:	00000097          	auipc	ra,0x0
 712:	eaa080e7          	jalr	-342(ra) # 5b8 <printint>
 716:	8b4a                	mv	s6,s2
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 718:	4981                	li	s3,0
 71a:	b765                	j	6c2 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 71c:	008b0913          	addi	s2,s6,8
 720:	4681                	li	a3,0
 722:	4629                	li	a2,10
 724:	000b2583          	lw	a1,0(s6)
 728:	8556                	mv	a0,s5
 72a:	00000097          	auipc	ra,0x0
 72e:	e8e080e7          	jalr	-370(ra) # 5b8 <printint>
 732:	8b4a                	mv	s6,s2
      state = 0;
 734:	4981                	li	s3,0
 736:	b771                	j	6c2 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 738:	008b0913          	addi	s2,s6,8
 73c:	4681                	li	a3,0
 73e:	866a                	mv	a2,s10
 740:	000b2583          	lw	a1,0(s6)
 744:	8556                	mv	a0,s5
 746:	00000097          	auipc	ra,0x0
 74a:	e72080e7          	jalr	-398(ra) # 5b8 <printint>
 74e:	8b4a                	mv	s6,s2
      state = 0;
 750:	4981                	li	s3,0
 752:	bf85                	j	6c2 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 754:	008b0793          	addi	a5,s6,8
 758:	f8f43423          	sd	a5,-120(s0)
 75c:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 760:	03000593          	li	a1,48
 764:	8556                	mv	a0,s5
 766:	00000097          	auipc	ra,0x0
 76a:	e30080e7          	jalr	-464(ra) # 596 <putc>
  putc(fd, 'x');
 76e:	07800593          	li	a1,120
 772:	8556                	mv	a0,s5
 774:	00000097          	auipc	ra,0x0
 778:	e22080e7          	jalr	-478(ra) # 596 <putc>
 77c:	896a                	mv	s2,s10
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 77e:	03c9d793          	srli	a5,s3,0x3c
 782:	97de                	add	a5,a5,s7
 784:	0007c583          	lbu	a1,0(a5)
 788:	8556                	mv	a0,s5
 78a:	00000097          	auipc	ra,0x0
 78e:	e0c080e7          	jalr	-500(ra) # 596 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 792:	0992                	slli	s3,s3,0x4
 794:	397d                	addiw	s2,s2,-1
 796:	fe0914e3          	bnez	s2,77e <vprintf+0x11c>
        printptr(fd, va_arg(ap, uint64));
 79a:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 79e:	4981                	li	s3,0
 7a0:	b70d                	j	6c2 <vprintf+0x60>
        s = va_arg(ap, char*);
 7a2:	008b0913          	addi	s2,s6,8
 7a6:	000b3983          	ld	s3,0(s6)
        if(s == 0)
 7aa:	02098163          	beqz	s3,7cc <vprintf+0x16a>
        while(*s != 0){
 7ae:	0009c583          	lbu	a1,0(s3)
 7b2:	c5ad                	beqz	a1,81c <vprintf+0x1ba>
          putc(fd, *s);
 7b4:	8556                	mv	a0,s5
 7b6:	00000097          	auipc	ra,0x0
 7ba:	de0080e7          	jalr	-544(ra) # 596 <putc>
          s++;
 7be:	0985                	addi	s3,s3,1
        while(*s != 0){
 7c0:	0009c583          	lbu	a1,0(s3)
 7c4:	f9e5                	bnez	a1,7b4 <vprintf+0x152>
        s = va_arg(ap, char*);
 7c6:	8b4a                	mv	s6,s2
      state = 0;
 7c8:	4981                	li	s3,0
 7ca:	bde5                	j	6c2 <vprintf+0x60>
          s = "(null)";
 7cc:	00000997          	auipc	s3,0x0
 7d0:	2c498993          	addi	s3,s3,708 # a90 <malloc+0x16a>
        while(*s != 0){
 7d4:	85ee                	mv	a1,s11
 7d6:	bff9                	j	7b4 <vprintf+0x152>
        putc(fd, va_arg(ap, uint));
 7d8:	008b0913          	addi	s2,s6,8
 7dc:	000b4583          	lbu	a1,0(s6)
 7e0:	8556                	mv	a0,s5
 7e2:	00000097          	auipc	ra,0x0
 7e6:	db4080e7          	jalr	-588(ra) # 596 <putc>
 7ea:	8b4a                	mv	s6,s2
      state = 0;
 7ec:	4981                	li	s3,0
 7ee:	bdd1                	j	6c2 <vprintf+0x60>
        putc(fd, c);
 7f0:	85d2                	mv	a1,s4
 7f2:	8556                	mv	a0,s5
 7f4:	00000097          	auipc	ra,0x0
 7f8:	da2080e7          	jalr	-606(ra) # 596 <putc>
      state = 0;
 7fc:	4981                	li	s3,0
 7fe:	b5d1                	j	6c2 <vprintf+0x60>
        putc(fd, '%');
 800:	85d2                	mv	a1,s4
 802:	8556                	mv	a0,s5
 804:	00000097          	auipc	ra,0x0
 808:	d92080e7          	jalr	-622(ra) # 596 <putc>
        putc(fd, c);
 80c:	85ca                	mv	a1,s2
 80e:	8556                	mv	a0,s5
 810:	00000097          	auipc	ra,0x0
 814:	d86080e7          	jalr	-634(ra) # 596 <putc>
      state = 0;
 818:	4981                	li	s3,0
 81a:	b565                	j	6c2 <vprintf+0x60>
        s = va_arg(ap, char*);
 81c:	8b4a                	mv	s6,s2
      state = 0;
 81e:	4981                	li	s3,0
 820:	b54d                	j	6c2 <vprintf+0x60>
    }
  }
}
 822:	70e6                	ld	ra,120(sp)
 824:	7446                	ld	s0,112(sp)
 826:	74a6                	ld	s1,104(sp)
 828:	7906                	ld	s2,96(sp)
 82a:	69e6                	ld	s3,88(sp)
 82c:	6a46                	ld	s4,80(sp)
 82e:	6aa6                	ld	s5,72(sp)
 830:	6b06                	ld	s6,64(sp)
 832:	7be2                	ld	s7,56(sp)
 834:	7c42                	ld	s8,48(sp)
 836:	7ca2                	ld	s9,40(sp)
 838:	7d02                	ld	s10,32(sp)
 83a:	6de2                	ld	s11,24(sp)
 83c:	6109                	addi	sp,sp,128
 83e:	8082                	ret

0000000000000840 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 840:	715d                	addi	sp,sp,-80
 842:	ec06                	sd	ra,24(sp)
 844:	e822                	sd	s0,16(sp)
 846:	1000                	addi	s0,sp,32
 848:	e010                	sd	a2,0(s0)
 84a:	e414                	sd	a3,8(s0)
 84c:	e818                	sd	a4,16(s0)
 84e:	ec1c                	sd	a5,24(s0)
 850:	03043023          	sd	a6,32(s0)
 854:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 858:	8622                	mv	a2,s0
 85a:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 85e:	00000097          	auipc	ra,0x0
 862:	e04080e7          	jalr	-508(ra) # 662 <vprintf>
}
 866:	60e2                	ld	ra,24(sp)
 868:	6442                	ld	s0,16(sp)
 86a:	6161                	addi	sp,sp,80
 86c:	8082                	ret

000000000000086e <printf>:

void
printf(const char *fmt, ...)
{
 86e:	711d                	addi	sp,sp,-96
 870:	ec06                	sd	ra,24(sp)
 872:	e822                	sd	s0,16(sp)
 874:	1000                	addi	s0,sp,32
 876:	e40c                	sd	a1,8(s0)
 878:	e810                	sd	a2,16(s0)
 87a:	ec14                	sd	a3,24(s0)
 87c:	f018                	sd	a4,32(s0)
 87e:	f41c                	sd	a5,40(s0)
 880:	03043823          	sd	a6,48(s0)
 884:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 888:	00840613          	addi	a2,s0,8
 88c:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 890:	85aa                	mv	a1,a0
 892:	4505                	li	a0,1
 894:	00000097          	auipc	ra,0x0
 898:	dce080e7          	jalr	-562(ra) # 662 <vprintf>
}
 89c:	60e2                	ld	ra,24(sp)
 89e:	6442                	ld	s0,16(sp)
 8a0:	6125                	addi	sp,sp,96
 8a2:	8082                	ret

00000000000008a4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8a4:	1141                	addi	sp,sp,-16
 8a6:	e422                	sd	s0,8(sp)
 8a8:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8aa:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8ae:	00000797          	auipc	a5,0x0
 8b2:	45a7b783          	ld	a5,1114(a5) # d08 <freep>
 8b6:	a02d                	j	8e0 <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 8b8:	4618                	lw	a4,8(a2)
 8ba:	9f2d                	addw	a4,a4,a1
 8bc:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 8c0:	6398                	ld	a4,0(a5)
 8c2:	6310                	ld	a2,0(a4)
 8c4:	a83d                	j	902 <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 8c6:	ff852703          	lw	a4,-8(a0)
 8ca:	9f31                	addw	a4,a4,a2
 8cc:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 8ce:	ff053683          	ld	a3,-16(a0)
 8d2:	a091                	j	916 <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8d4:	6398                	ld	a4,0(a5)
 8d6:	00e7e463          	bltu	a5,a4,8de <free+0x3a>
 8da:	00e6ea63          	bltu	a3,a4,8ee <free+0x4a>
{
 8de:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8e0:	fed7fae3          	bgeu	a5,a3,8d4 <free+0x30>
 8e4:	6398                	ld	a4,0(a5)
 8e6:	00e6e463          	bltu	a3,a4,8ee <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8ea:	fee7eae3          	bltu	a5,a4,8de <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
 8ee:	ff852583          	lw	a1,-8(a0)
 8f2:	6390                	ld	a2,0(a5)
 8f4:	02059813          	slli	a6,a1,0x20
 8f8:	01c85713          	srli	a4,a6,0x1c
 8fc:	9736                	add	a4,a4,a3
 8fe:	fae60de3          	beq	a2,a4,8b8 <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
 902:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 906:	4790                	lw	a2,8(a5)
 908:	02061593          	slli	a1,a2,0x20
 90c:	01c5d713          	srli	a4,a1,0x1c
 910:	973e                	add	a4,a4,a5
 912:	fae68ae3          	beq	a3,a4,8c6 <free+0x22>
    p->s.ptr = bp->s.ptr;
 916:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 918:	00000717          	auipc	a4,0x0
 91c:	3ef73823          	sd	a5,1008(a4) # d08 <freep>
}
 920:	6422                	ld	s0,8(sp)
 922:	0141                	addi	sp,sp,16
 924:	8082                	ret

0000000000000926 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 926:	7139                	addi	sp,sp,-64
 928:	fc06                	sd	ra,56(sp)
 92a:	f822                	sd	s0,48(sp)
 92c:	f426                	sd	s1,40(sp)
 92e:	f04a                	sd	s2,32(sp)
 930:	ec4e                	sd	s3,24(sp)
 932:	e852                	sd	s4,16(sp)
 934:	e456                	sd	s5,8(sp)
 936:	e05a                	sd	s6,0(sp)
 938:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 93a:	02051493          	slli	s1,a0,0x20
 93e:	9081                	srli	s1,s1,0x20
 940:	04bd                	addi	s1,s1,15
 942:	8091                	srli	s1,s1,0x4
 944:	00148a1b          	addiw	s4,s1,1
 948:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 94a:	00000517          	auipc	a0,0x0
 94e:	3be53503          	ld	a0,958(a0) # d08 <freep>
 952:	c515                	beqz	a0,97e <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 954:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 956:	4798                	lw	a4,8(a5)
 958:	04977163          	bgeu	a4,s1,99a <malloc+0x74>
 95c:	89d2                	mv	s3,s4
 95e:	000a071b          	sext.w	a4,s4
 962:	6685                	lui	a3,0x1
 964:	00d77363          	bgeu	a4,a3,96a <malloc+0x44>
 968:	6985                	lui	s3,0x1
 96a:	00098b1b          	sext.w	s6,s3
  p = sbrk(nu * sizeof(Header));
 96e:	0049999b          	slliw	s3,s3,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 972:	00000917          	auipc	s2,0x0
 976:	39690913          	addi	s2,s2,918 # d08 <freep>
  if(p == (char*)-1)
 97a:	5afd                	li	s5,-1
 97c:	a8a5                	j	9f4 <malloc+0xce>
    base.s.ptr = freep = prevp = &base;
 97e:	00000797          	auipc	a5,0x0
 982:	38a78793          	addi	a5,a5,906 # d08 <freep>
 986:	00000717          	auipc	a4,0x0
 98a:	38a70713          	addi	a4,a4,906 # d10 <base>
 98e:	e398                	sd	a4,0(a5)
 990:	e798                	sd	a4,8(a5)
    base.s.size = 0;
 992:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 996:	87ba                	mv	a5,a4
 998:	b7d1                	j	95c <malloc+0x36>
      if(p->s.size == nunits)
 99a:	02e48c63          	beq	s1,a4,9d2 <malloc+0xac>
        p->s.size -= nunits;
 99e:	4147073b          	subw	a4,a4,s4
 9a2:	c798                	sw	a4,8(a5)
        p += p->s.size;
 9a4:	02071693          	slli	a3,a4,0x20
 9a8:	01c6d713          	srli	a4,a3,0x1c
 9ac:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 9ae:	0147a423          	sw	s4,8(a5)
      freep = prevp;
 9b2:	00000717          	auipc	a4,0x0
 9b6:	34a73b23          	sd	a0,854(a4) # d08 <freep>
      return (void*)(p + 1);
 9ba:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9be:	70e2                	ld	ra,56(sp)
 9c0:	7442                	ld	s0,48(sp)
 9c2:	74a2                	ld	s1,40(sp)
 9c4:	7902                	ld	s2,32(sp)
 9c6:	69e2                	ld	s3,24(sp)
 9c8:	6a42                	ld	s4,16(sp)
 9ca:	6aa2                	ld	s5,8(sp)
 9cc:	6b02                	ld	s6,0(sp)
 9ce:	6121                	addi	sp,sp,64
 9d0:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 9d2:	6398                	ld	a4,0(a5)
 9d4:	e118                	sd	a4,0(a0)
 9d6:	bff1                	j	9b2 <malloc+0x8c>
  hp->s.size = nu;
 9d8:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 9dc:	0541                	addi	a0,a0,16
 9de:	00000097          	auipc	ra,0x0
 9e2:	ec6080e7          	jalr	-314(ra) # 8a4 <free>
  return freep;
 9e6:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 9ea:	d971                	beqz	a0,9be <malloc+0x98>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9ec:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 9ee:	4798                	lw	a4,8(a5)
 9f0:	fa9775e3          	bgeu	a4,s1,99a <malloc+0x74>
    if(p == freep)
 9f4:	00093703          	ld	a4,0(s2)
 9f8:	853e                	mv	a0,a5
 9fa:	fef719e3          	bne	a4,a5,9ec <malloc+0xc6>
  p = sbrk(nu * sizeof(Header));
 9fe:	854e                	mv	a0,s3
 a00:	00000097          	auipc	ra,0x0
 a04:	b2e080e7          	jalr	-1234(ra) # 52e <sbrk>
  if(p == (char*)-1)
 a08:	fd5518e3          	bne	a0,s5,9d8 <malloc+0xb2>
        return 0;
 a0c:	4501                	li	a0,0
 a0e:	bf45                	j	9be <malloc+0x98>
