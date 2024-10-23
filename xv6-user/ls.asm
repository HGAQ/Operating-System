
xv6-user/_ls:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <fmtname>:
#include "kernel/include/stat.h"
#include "xv6-user/user.h"

char*
fmtname(char *name)
{
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	ec26                	sd	s1,24(sp)
   8:	e84a                	sd	s2,16(sp)
   a:	e44e                	sd	s3,8(sp)
   c:	1800                	addi	s0,sp,48
   e:	892a                	mv	s2,a0
  static char buf[STAT_MAX_NAME+1];
  int len = strlen(name);
  10:	00000097          	auipc	ra,0x0
  14:	24c080e7          	jalr	588(ra) # 25c <strlen>
  18:	0005049b          	sext.w	s1,a0

  // Return blank-padded name.
  if(len >= STAT_MAX_NAME)
  1c:	47fd                	li	a5,31
  1e:	0097da63          	bge	a5,s1,32 <fmtname+0x32>
    return name;
  memmove(buf, name, len);
  memset(buf + len, ' ', STAT_MAX_NAME - len);
  buf[STAT_MAX_NAME] = '\0';
  return buf;
}
  22:	854a                	mv	a0,s2
  24:	70a2                	ld	ra,40(sp)
  26:	7402                	ld	s0,32(sp)
  28:	64e2                	ld	s1,24(sp)
  2a:	6942                	ld	s2,16(sp)
  2c:	69a2                	ld	s3,8(sp)
  2e:	6145                	addi	sp,sp,48
  30:	8082                	ret
  memmove(buf, name, len);
  32:	00001997          	auipc	s3,0x1
  36:	a9e98993          	addi	s3,s3,-1378 # ad0 <buf.0>
  3a:	8626                	mv	a2,s1
  3c:	85ca                	mv	a1,s2
  3e:	854e                	mv	a0,s3
  40:	00000097          	auipc	ra,0x0
  44:	3ac080e7          	jalr	940(ra) # 3ec <memmove>
  memset(buf + len, ' ', STAT_MAX_NAME - len);
  48:	02000613          	li	a2,32
  4c:	9e05                	subw	a2,a2,s1
  4e:	02000593          	li	a1,32
  52:	00998533          	add	a0,s3,s1
  56:	00000097          	auipc	ra,0x0
  5a:	230080e7          	jalr	560(ra) # 286 <memset>
  buf[STAT_MAX_NAME] = '\0';
  5e:	02098023          	sb	zero,32(s3)
  return buf;
  62:	894e                	mv	s2,s3
  64:	bf7d                	j	22 <fmtname+0x22>

0000000000000066 <ls>:

void
ls(char *path)
{
  66:	7119                	addi	sp,sp,-128
  68:	fc86                	sd	ra,120(sp)
  6a:	f8a2                	sd	s0,112(sp)
  6c:	f4a6                	sd	s1,104(sp)
  6e:	f0ca                	sd	s2,96(sp)
  70:	ecce                	sd	s3,88(sp)
  72:	e8d2                	sd	s4,80(sp)
  74:	0100                	addi	s0,sp,128
  76:	892a                	mv	s2,a0
  int fd;
  struct stat st;
  char *types[] = {
  78:	f8043023          	sd	zero,-128(s0)
  7c:	00001797          	auipc	a5,0x1
  80:	97478793          	addi	a5,a5,-1676 # 9f0 <malloc+0xf0>
  84:	f8f43423          	sd	a5,-120(s0)
  88:	00001797          	auipc	a5,0x1
  8c:	97078793          	addi	a5,a5,-1680 # 9f8 <malloc+0xf8>
  90:	f8f43823          	sd	a5,-112(s0)
    [T_DIR]   "DIR ",
    [T_FILE]  "FILE",
  };

  if((fd = open(path, 0)) < 0){
  94:	4581                	li	a1,0
  96:	00000097          	auipc	ra,0x0
  9a:	448080e7          	jalr	1096(ra) # 4de <open>
  9e:	02054863          	bltz	a0,ce <ls+0x68>
  a2:	84aa                	mv	s1,a0
    fprintf(2, "ls: cannot open %s\n", path);
    return;
  }

  if(fstat(fd, &st) < 0){
  a4:	f9840593          	addi	a1,s0,-104
  a8:	00000097          	auipc	ra,0x0
  ac:	43e080e7          	jalr	1086(ra) # 4e6 <fstat>
  b0:	02054a63          	bltz	a0,e4 <ls+0x7e>
    fprintf(2, "ls: cannot stat %s\n", path);
    close(fd);
    return;
  }

  if (st.type == T_DIR){
  b4:	fc041703          	lh	a4,-64(s0)
  b8:	4785                	li	a5,1
  ba:	08f71f63          	bne	a4,a5,158 <ls+0xf2>
    while(readdir(fd, &st) == 1){
  be:	f9840913          	addi	s2,s0,-104
  c2:	4985                	li	s3,1
      printf("%s %s\t%d\n", fmtname(st.name), types[st.type], st.size);
  c4:	00001a17          	auipc	s4,0x1
  c8:	96ca0a13          	addi	s4,s4,-1684 # a30 <malloc+0x130>
  cc:	a08d                	j	12e <ls+0xc8>
    fprintf(2, "ls: cannot open %s\n", path);
  ce:	864a                	mv	a2,s2
  d0:	00001597          	auipc	a1,0x1
  d4:	93058593          	addi	a1,a1,-1744 # a00 <malloc+0x100>
  d8:	4509                	li	a0,2
  da:	00000097          	auipc	ra,0x0
  de:	740080e7          	jalr	1856(ra) # 81a <fprintf>
    return;
  e2:	a09d                	j	148 <ls+0xe2>
    fprintf(2, "ls: cannot stat %s\n", path);
  e4:	864a                	mv	a2,s2
  e6:	00001597          	auipc	a1,0x1
  ea:	93258593          	addi	a1,a1,-1742 # a18 <malloc+0x118>
  ee:	4509                	li	a0,2
  f0:	00000097          	auipc	ra,0x0
  f4:	72a080e7          	jalr	1834(ra) # 81a <fprintf>
    close(fd);
  f8:	8526                	mv	a0,s1
  fa:	00000097          	auipc	ra,0x0
  fe:	3cc080e7          	jalr	972(ra) # 4c6 <close>
    return;
 102:	a099                	j	148 <ls+0xe2>
      printf("%s %s\t%d\n", fmtname(st.name), types[st.type], st.size);
 104:	854a                	mv	a0,s2
 106:	00000097          	auipc	ra,0x0
 10a:	efa080e7          	jalr	-262(ra) # 0 <fmtname>
 10e:	85aa                	mv	a1,a0
 110:	fc041783          	lh	a5,-64(s0)
 114:	078e                	slli	a5,a5,0x3
 116:	fd078793          	addi	a5,a5,-48
 11a:	97a2                	add	a5,a5,s0
 11c:	fc843683          	ld	a3,-56(s0)
 120:	fb07b603          	ld	a2,-80(a5)
 124:	8552                	mv	a0,s4
 126:	00000097          	auipc	ra,0x0
 12a:	722080e7          	jalr	1826(ra) # 848 <printf>
    while(readdir(fd, &st) == 1){
 12e:	85ca                	mv	a1,s2
 130:	8526                	mv	a0,s1
 132:	00000097          	auipc	ra,0x0
 136:	404080e7          	jalr	1028(ra) # 536 <readdir>
 13a:	fd3505e3          	beq	a0,s3,104 <ls+0x9e>
    }
  } else {
    printf("%s %s\t%l\n", fmtname(st.name), types[st.type], st.size);
  }
  close(fd);
 13e:	8526                	mv	a0,s1
 140:	00000097          	auipc	ra,0x0
 144:	386080e7          	jalr	902(ra) # 4c6 <close>
}
 148:	70e6                	ld	ra,120(sp)
 14a:	7446                	ld	s0,112(sp)
 14c:	74a6                	ld	s1,104(sp)
 14e:	7906                	ld	s2,96(sp)
 150:	69e6                	ld	s3,88(sp)
 152:	6a46                	ld	s4,80(sp)
 154:	6109                	addi	sp,sp,128
 156:	8082                	ret
    printf("%s %s\t%l\n", fmtname(st.name), types[st.type], st.size);
 158:	f9840513          	addi	a0,s0,-104
 15c:	00000097          	auipc	ra,0x0
 160:	ea4080e7          	jalr	-348(ra) # 0 <fmtname>
 164:	85aa                	mv	a1,a0
 166:	fc041783          	lh	a5,-64(s0)
 16a:	078e                	slli	a5,a5,0x3
 16c:	fd078793          	addi	a5,a5,-48
 170:	97a2                	add	a5,a5,s0
 172:	fc843683          	ld	a3,-56(s0)
 176:	fb07b603          	ld	a2,-80(a5)
 17a:	00001517          	auipc	a0,0x1
 17e:	8c650513          	addi	a0,a0,-1850 # a40 <malloc+0x140>
 182:	00000097          	auipc	ra,0x0
 186:	6c6080e7          	jalr	1734(ra) # 848 <printf>
 18a:	bf55                	j	13e <ls+0xd8>

000000000000018c <main>:

int
main(int argc, char *argv[])
{
 18c:	1101                	addi	sp,sp,-32
 18e:	ec06                	sd	ra,24(sp)
 190:	e822                	sd	s0,16(sp)
 192:	e426                	sd	s1,8(sp)
 194:	e04a                	sd	s2,0(sp)
 196:	1000                	addi	s0,sp,32
  int i;

  if(argc < 2){
 198:	4785                	li	a5,1
 19a:	02a7d963          	bge	a5,a0,1cc <main+0x40>
 19e:	00858493          	addi	s1,a1,8
 1a2:	ffe5091b          	addiw	s2,a0,-2
 1a6:	02091793          	slli	a5,s2,0x20
 1aa:	01d7d913          	srli	s2,a5,0x1d
 1ae:	05c1                	addi	a1,a1,16
 1b0:	992e                	add	s2,s2,a1
    ls(".");
    exit(0);
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
 1b2:	6088                	ld	a0,0(s1)
 1b4:	00000097          	auipc	ra,0x0
 1b8:	eb2080e7          	jalr	-334(ra) # 66 <ls>
  for(i=1; i<argc; i++)
 1bc:	04a1                	addi	s1,s1,8
 1be:	ff249ae3          	bne	s1,s2,1b2 <main+0x26>
  exit(0);
 1c2:	4501                	li	a0,0
 1c4:	00000097          	auipc	ra,0x0
 1c8:	2da080e7          	jalr	730(ra) # 49e <exit>
    ls(".");
 1cc:	00001517          	auipc	a0,0x1
 1d0:	88450513          	addi	a0,a0,-1916 # a50 <malloc+0x150>
 1d4:	00000097          	auipc	ra,0x0
 1d8:	e92080e7          	jalr	-366(ra) # 66 <ls>
    exit(0);
 1dc:	4501                	li	a0,0
 1de:	00000097          	auipc	ra,0x0
 1e2:	2c0080e7          	jalr	704(ra) # 49e <exit>

00000000000001e6 <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
 1e6:	1141                	addi	sp,sp,-16
 1e8:	e422                	sd	s0,8(sp)
 1ea:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1ec:	87aa                	mv	a5,a0
 1ee:	0585                	addi	a1,a1,1
 1f0:	0785                	addi	a5,a5,1
 1f2:	fff5c703          	lbu	a4,-1(a1)
 1f6:	fee78fa3          	sb	a4,-1(a5)
 1fa:	fb75                	bnez	a4,1ee <strcpy+0x8>
    ;
  return os;
}
 1fc:	6422                	ld	s0,8(sp)
 1fe:	0141                	addi	sp,sp,16
 200:	8082                	ret

0000000000000202 <strcat>:

char*
strcat(char *s, const char *t)
{
 202:	1141                	addi	sp,sp,-16
 204:	e422                	sd	s0,8(sp)
 206:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
 208:	00054783          	lbu	a5,0(a0)
 20c:	c385                	beqz	a5,22c <strcat+0x2a>
 20e:	87aa                	mv	a5,a0
    s++;
 210:	0785                	addi	a5,a5,1
  while(*s)
 212:	0007c703          	lbu	a4,0(a5)
 216:	ff6d                	bnez	a4,210 <strcat+0xe>
  while((*s++ = *t++))
 218:	0585                	addi	a1,a1,1
 21a:	0785                	addi	a5,a5,1
 21c:	fff5c703          	lbu	a4,-1(a1)
 220:	fee78fa3          	sb	a4,-1(a5)
 224:	fb75                	bnez	a4,218 <strcat+0x16>
    ;
  return os;
}
 226:	6422                	ld	s0,8(sp)
 228:	0141                	addi	sp,sp,16
 22a:	8082                	ret
  while(*s)
 22c:	87aa                	mv	a5,a0
 22e:	b7ed                	j	218 <strcat+0x16>

0000000000000230 <strcmp>:


int
strcmp(const char *p, const char *q)
{
 230:	1141                	addi	sp,sp,-16
 232:	e422                	sd	s0,8(sp)
 234:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 236:	00054783          	lbu	a5,0(a0)
 23a:	cb91                	beqz	a5,24e <strcmp+0x1e>
 23c:	0005c703          	lbu	a4,0(a1)
 240:	00f71763          	bne	a4,a5,24e <strcmp+0x1e>
    p++, q++;
 244:	0505                	addi	a0,a0,1
 246:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 248:	00054783          	lbu	a5,0(a0)
 24c:	fbe5                	bnez	a5,23c <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 24e:	0005c503          	lbu	a0,0(a1)
}
 252:	40a7853b          	subw	a0,a5,a0
 256:	6422                	ld	s0,8(sp)
 258:	0141                	addi	sp,sp,16
 25a:	8082                	ret

000000000000025c <strlen>:

uint
strlen(const char *s)
{
 25c:	1141                	addi	sp,sp,-16
 25e:	e422                	sd	s0,8(sp)
 260:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 262:	00054783          	lbu	a5,0(a0)
 266:	cf91                	beqz	a5,282 <strlen+0x26>
 268:	0505                	addi	a0,a0,1
 26a:	87aa                	mv	a5,a0
 26c:	4685                	li	a3,1
 26e:	9e89                	subw	a3,a3,a0
 270:	00f6853b          	addw	a0,a3,a5
 274:	0785                	addi	a5,a5,1
 276:	fff7c703          	lbu	a4,-1(a5)
 27a:	fb7d                	bnez	a4,270 <strlen+0x14>
    ;
  return n;
}
 27c:	6422                	ld	s0,8(sp)
 27e:	0141                	addi	sp,sp,16
 280:	8082                	ret
  for(n = 0; s[n]; n++)
 282:	4501                	li	a0,0
 284:	bfe5                	j	27c <strlen+0x20>

0000000000000286 <memset>:

void*
memset(void *dst, int c, uint n)
{
 286:	1141                	addi	sp,sp,-16
 288:	e422                	sd	s0,8(sp)
 28a:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 28c:	ca19                	beqz	a2,2a2 <memset+0x1c>
 28e:	87aa                	mv	a5,a0
 290:	1602                	slli	a2,a2,0x20
 292:	9201                	srli	a2,a2,0x20
 294:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 298:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 29c:	0785                	addi	a5,a5,1
 29e:	fee79de3          	bne	a5,a4,298 <memset+0x12>
  }
  return dst;
}
 2a2:	6422                	ld	s0,8(sp)
 2a4:	0141                	addi	sp,sp,16
 2a6:	8082                	ret

00000000000002a8 <strchr>:

char*
strchr(const char *s, char c)
{
 2a8:	1141                	addi	sp,sp,-16
 2aa:	e422                	sd	s0,8(sp)
 2ac:	0800                	addi	s0,sp,16
  for(; *s; s++)
 2ae:	00054783          	lbu	a5,0(a0)
 2b2:	cb99                	beqz	a5,2c8 <strchr+0x20>
    if(*s == c)
 2b4:	00f58763          	beq	a1,a5,2c2 <strchr+0x1a>
  for(; *s; s++)
 2b8:	0505                	addi	a0,a0,1
 2ba:	00054783          	lbu	a5,0(a0)
 2be:	fbfd                	bnez	a5,2b4 <strchr+0xc>
      return (char*)s;
  return 0;
 2c0:	4501                	li	a0,0
}
 2c2:	6422                	ld	s0,8(sp)
 2c4:	0141                	addi	sp,sp,16
 2c6:	8082                	ret
  return 0;
 2c8:	4501                	li	a0,0
 2ca:	bfe5                	j	2c2 <strchr+0x1a>

00000000000002cc <gets>:

char*
gets(char *buf, int max)
{
 2cc:	711d                	addi	sp,sp,-96
 2ce:	ec86                	sd	ra,88(sp)
 2d0:	e8a2                	sd	s0,80(sp)
 2d2:	e4a6                	sd	s1,72(sp)
 2d4:	e0ca                	sd	s2,64(sp)
 2d6:	fc4e                	sd	s3,56(sp)
 2d8:	f852                	sd	s4,48(sp)
 2da:	f456                	sd	s5,40(sp)
 2dc:	f05a                	sd	s6,32(sp)
 2de:	ec5e                	sd	s7,24(sp)
 2e0:	e862                	sd	s8,16(sp)
 2e2:	1080                	addi	s0,sp,96
 2e4:	8baa                	mv	s7,a0
 2e6:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2e8:	892a                	mv	s2,a0
 2ea:	4481                	li	s1,0
    cc = read(0, &c, 1);
 2ec:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 2f0:	4b29                	li	s6,10
 2f2:	4c35                	li	s8,13
  for(i=0; i+1 < max; ){
 2f4:	89a6                	mv	s3,s1
 2f6:	2485                	addiw	s1,s1,1
 2f8:	0344d763          	bge	s1,s4,326 <gets+0x5a>
    cc = read(0, &c, 1);
 2fc:	4605                	li	a2,1
 2fe:	85d6                	mv	a1,s5
 300:	4501                	li	a0,0
 302:	00000097          	auipc	ra,0x0
 306:	1b4080e7          	jalr	436(ra) # 4b6 <read>
    if(cc < 1)
 30a:	00a05e63          	blez	a0,326 <gets+0x5a>
    buf[i++] = c;
 30e:	faf44783          	lbu	a5,-81(s0)
 312:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 316:	01678763          	beq	a5,s6,324 <gets+0x58>
 31a:	0905                	addi	s2,s2,1
 31c:	fd879ce3          	bne	a5,s8,2f4 <gets+0x28>
  for(i=0; i+1 < max; ){
 320:	89a6                	mv	s3,s1
 322:	a011                	j	326 <gets+0x5a>
 324:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 326:	99de                	add	s3,s3,s7
 328:	00098023          	sb	zero,0(s3)
  return buf;
}
 32c:	855e                	mv	a0,s7
 32e:	60e6                	ld	ra,88(sp)
 330:	6446                	ld	s0,80(sp)
 332:	64a6                	ld	s1,72(sp)
 334:	6906                	ld	s2,64(sp)
 336:	79e2                	ld	s3,56(sp)
 338:	7a42                	ld	s4,48(sp)
 33a:	7aa2                	ld	s5,40(sp)
 33c:	7b02                	ld	s6,32(sp)
 33e:	6be2                	ld	s7,24(sp)
 340:	6c42                	ld	s8,16(sp)
 342:	6125                	addi	sp,sp,96
 344:	8082                	ret

0000000000000346 <stat>:

int
stat(const char *n, struct stat *st)
{
 346:	1101                	addi	sp,sp,-32
 348:	ec06                	sd	ra,24(sp)
 34a:	e822                	sd	s0,16(sp)
 34c:	e426                	sd	s1,8(sp)
 34e:	e04a                	sd	s2,0(sp)
 350:	1000                	addi	s0,sp,32
 352:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 354:	4581                	li	a1,0
 356:	00000097          	auipc	ra,0x0
 35a:	188080e7          	jalr	392(ra) # 4de <open>
  if(fd < 0)
 35e:	02054563          	bltz	a0,388 <stat+0x42>
 362:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 364:	85ca                	mv	a1,s2
 366:	00000097          	auipc	ra,0x0
 36a:	180080e7          	jalr	384(ra) # 4e6 <fstat>
 36e:	892a                	mv	s2,a0
  close(fd);
 370:	8526                	mv	a0,s1
 372:	00000097          	auipc	ra,0x0
 376:	154080e7          	jalr	340(ra) # 4c6 <close>
  return r;
}
 37a:	854a                	mv	a0,s2
 37c:	60e2                	ld	ra,24(sp)
 37e:	6442                	ld	s0,16(sp)
 380:	64a2                	ld	s1,8(sp)
 382:	6902                	ld	s2,0(sp)
 384:	6105                	addi	sp,sp,32
 386:	8082                	ret
    return -1;
 388:	597d                	li	s2,-1
 38a:	bfc5                	j	37a <stat+0x34>

000000000000038c <atoi>:

int
atoi(const char *s)
{
 38c:	1141                	addi	sp,sp,-16
 38e:	e422                	sd	s0,8(sp)
 390:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 392:	00054703          	lbu	a4,0(a0)
 396:	02d00793          	li	a5,45
  int neg = 1;
 39a:	4585                	li	a1,1
  if (*s == '-') {
 39c:	04f70363          	beq	a4,a5,3e2 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 3a0:	00054703          	lbu	a4,0(a0)
 3a4:	fd07079b          	addiw	a5,a4,-48
 3a8:	0ff7f793          	zext.b	a5,a5
 3ac:	46a5                	li	a3,9
 3ae:	02f6ed63          	bltu	a3,a5,3e8 <atoi+0x5c>
  n = 0;
 3b2:	4681                	li	a3,0
  while('0' <= *s && *s <= '9')
 3b4:	4625                	li	a2,9
    n = n*10 + *s++ - '0';
 3b6:	0505                	addi	a0,a0,1
 3b8:	0026979b          	slliw	a5,a3,0x2
 3bc:	9fb5                	addw	a5,a5,a3
 3be:	0017979b          	slliw	a5,a5,0x1
 3c2:	9fb9                	addw	a5,a5,a4
 3c4:	fd07869b          	addiw	a3,a5,-48
  while('0' <= *s && *s <= '9')
 3c8:	00054703          	lbu	a4,0(a0)
 3cc:	fd07079b          	addiw	a5,a4,-48
 3d0:	0ff7f793          	zext.b	a5,a5
 3d4:	fef671e3          	bgeu	a2,a5,3b6 <atoi+0x2a>
  return n * neg;
}
 3d8:	02d5853b          	mulw	a0,a1,a3
 3dc:	6422                	ld	s0,8(sp)
 3de:	0141                	addi	sp,sp,16
 3e0:	8082                	ret
    s++;
 3e2:	0505                	addi	a0,a0,1
    neg = -1;
 3e4:	55fd                	li	a1,-1
 3e6:	bf6d                	j	3a0 <atoi+0x14>
  n = 0;
 3e8:	4681                	li	a3,0
 3ea:	b7fd                	j	3d8 <atoi+0x4c>

00000000000003ec <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3ec:	1141                	addi	sp,sp,-16
 3ee:	e422                	sd	s0,8(sp)
 3f0:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 3f2:	02b57463          	bgeu	a0,a1,41a <memmove+0x2e>
    while(n-- > 0)
 3f6:	00c05f63          	blez	a2,414 <memmove+0x28>
 3fa:	1602                	slli	a2,a2,0x20
 3fc:	9201                	srli	a2,a2,0x20
 3fe:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 402:	872a                	mv	a4,a0
      *dst++ = *src++;
 404:	0585                	addi	a1,a1,1
 406:	0705                	addi	a4,a4,1
 408:	fff5c683          	lbu	a3,-1(a1)
 40c:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 410:	fee79ae3          	bne	a5,a4,404 <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 414:	6422                	ld	s0,8(sp)
 416:	0141                	addi	sp,sp,16
 418:	8082                	ret
    dst += n;
 41a:	00c50733          	add	a4,a0,a2
    src += n;
 41e:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 420:	fec05ae3          	blez	a2,414 <memmove+0x28>
 424:	fff6079b          	addiw	a5,a2,-1
 428:	1782                	slli	a5,a5,0x20
 42a:	9381                	srli	a5,a5,0x20
 42c:	fff7c793          	not	a5,a5
 430:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 432:	15fd                	addi	a1,a1,-1
 434:	177d                	addi	a4,a4,-1
 436:	0005c683          	lbu	a3,0(a1)
 43a:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 43e:	fee79ae3          	bne	a5,a4,432 <memmove+0x46>
 442:	bfc9                	j	414 <memmove+0x28>

0000000000000444 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 444:	1141                	addi	sp,sp,-16
 446:	e422                	sd	s0,8(sp)
 448:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 44a:	ca05                	beqz	a2,47a <memcmp+0x36>
 44c:	fff6069b          	addiw	a3,a2,-1
 450:	1682                	slli	a3,a3,0x20
 452:	9281                	srli	a3,a3,0x20
 454:	0685                	addi	a3,a3,1
 456:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 458:	00054783          	lbu	a5,0(a0)
 45c:	0005c703          	lbu	a4,0(a1)
 460:	00e79863          	bne	a5,a4,470 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 464:	0505                	addi	a0,a0,1
    p2++;
 466:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 468:	fed518e3          	bne	a0,a3,458 <memcmp+0x14>
  }
  return 0;
 46c:	4501                	li	a0,0
 46e:	a019                	j	474 <memcmp+0x30>
      return *p1 - *p2;
 470:	40e7853b          	subw	a0,a5,a4
}
 474:	6422                	ld	s0,8(sp)
 476:	0141                	addi	sp,sp,16
 478:	8082                	ret
  return 0;
 47a:	4501                	li	a0,0
 47c:	bfe5                	j	474 <memcmp+0x30>

000000000000047e <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 47e:	1141                	addi	sp,sp,-16
 480:	e406                	sd	ra,8(sp)
 482:	e022                	sd	s0,0(sp)
 484:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 486:	00000097          	auipc	ra,0x0
 48a:	f66080e7          	jalr	-154(ra) # 3ec <memmove>
}
 48e:	60a2                	ld	ra,8(sp)
 490:	6402                	ld	s0,0(sp)
 492:	0141                	addi	sp,sp,16
 494:	8082                	ret

0000000000000496 <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 496:	4885                	li	a7,1
 ecall
 498:	00000073          	ecall
 ret
 49c:	8082                	ret

000000000000049e <exit>:
.global exit
exit:
 li a7, SYS_exit
 49e:	4889                	li	a7,2
 ecall
 4a0:	00000073          	ecall
 ret
 4a4:	8082                	ret

00000000000004a6 <wait>:
.global wait
wait:
 li a7, SYS_wait
 4a6:	488d                	li	a7,3
 ecall
 4a8:	00000073          	ecall
 ret
 4ac:	8082                	ret

00000000000004ae <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 4ae:	4891                	li	a7,4
 ecall
 4b0:	00000073          	ecall
 ret
 4b4:	8082                	ret

00000000000004b6 <read>:
.global read
read:
 li a7, SYS_read
 4b6:	4895                	li	a7,5
 ecall
 4b8:	00000073          	ecall
 ret
 4bc:	8082                	ret

00000000000004be <write>:
.global write
write:
 li a7, SYS_write
 4be:	48c1                	li	a7,16
 ecall
 4c0:	00000073          	ecall
 ret
 4c4:	8082                	ret

00000000000004c6 <close>:
.global close
close:
 li a7, SYS_close
 4c6:	48d5                	li	a7,21
 ecall
 4c8:	00000073          	ecall
 ret
 4cc:	8082                	ret

00000000000004ce <kill>:
.global kill
kill:
 li a7, SYS_kill
 4ce:	4899                	li	a7,6
 ecall
 4d0:	00000073          	ecall
 ret
 4d4:	8082                	ret

00000000000004d6 <exec>:
.global exec
exec:
 li a7, SYS_exec
 4d6:	489d                	li	a7,7
 ecall
 4d8:	00000073          	ecall
 ret
 4dc:	8082                	ret

00000000000004de <open>:
.global open
open:
 li a7, SYS_open
 4de:	48bd                	li	a7,15
 ecall
 4e0:	00000073          	ecall
 ret
 4e4:	8082                	ret

00000000000004e6 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 4e6:	48a1                	li	a7,8
 ecall
 4e8:	00000073          	ecall
 ret
 4ec:	8082                	ret

00000000000004ee <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 4ee:	48d1                	li	a7,20
 ecall
 4f0:	00000073          	ecall
 ret
 4f4:	8082                	ret

00000000000004f6 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 4f6:	48a5                	li	a7,9
 ecall
 4f8:	00000073          	ecall
 ret
 4fc:	8082                	ret

00000000000004fe <dup>:
.global dup
dup:
 li a7, SYS_dup
 4fe:	48a9                	li	a7,10
 ecall
 500:	00000073          	ecall
 ret
 504:	8082                	ret

0000000000000506 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 506:	48ad                	li	a7,11
 ecall
 508:	00000073          	ecall
 ret
 50c:	8082                	ret

000000000000050e <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 50e:	48b1                	li	a7,12
 ecall
 510:	00000073          	ecall
 ret
 514:	8082                	ret

0000000000000516 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 516:	48b5                	li	a7,13
 ecall
 518:	00000073          	ecall
 ret
 51c:	8082                	ret

000000000000051e <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 51e:	48b9                	li	a7,14
 ecall
 520:	00000073          	ecall
 ret
 524:	8082                	ret

0000000000000526 <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 526:	48d9                	li	a7,22
 ecall
 528:	00000073          	ecall
 ret
 52c:	8082                	ret

000000000000052e <dev>:
.global dev
dev:
 li a7, SYS_dev
 52e:	48dd                	li	a7,23
 ecall
 530:	00000073          	ecall
 ret
 534:	8082                	ret

0000000000000536 <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 536:	48e1                	li	a7,24
 ecall
 538:	00000073          	ecall
 ret
 53c:	8082                	ret

000000000000053e <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 53e:	48e5                	li	a7,25
 ecall
 540:	00000073          	ecall
 ret
 544:	8082                	ret

0000000000000546 <remove>:
.global remove
remove:
 li a7, SYS_remove
 546:	48c5                	li	a7,17
 ecall
 548:	00000073          	ecall
 ret
 54c:	8082                	ret

000000000000054e <trace>:
.global trace
trace:
 li a7, SYS_trace
 54e:	48c9                	li	a7,18
 ecall
 550:	00000073          	ecall
 ret
 554:	8082                	ret

0000000000000556 <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 556:	48cd                	li	a7,19
 ecall
 558:	00000073          	ecall
 ret
 55c:	8082                	ret

000000000000055e <rename>:
.global rename
rename:
 li a7, SYS_rename
 55e:	48e9                	li	a7,26
 ecall
 560:	00000073          	ecall
 ret
 564:	8082                	ret

0000000000000566 <poweroff>:
.global poweroff
poweroff:
 li a7, SYS_poweroff
 566:	0d200893          	li	a7,210
 ecall
 56a:	00000073          	ecall
 ret
 56e:	8082                	ret

0000000000000570 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 570:	1101                	addi	sp,sp,-32
 572:	ec06                	sd	ra,24(sp)
 574:	e822                	sd	s0,16(sp)
 576:	1000                	addi	s0,sp,32
 578:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 57c:	4605                	li	a2,1
 57e:	fef40593          	addi	a1,s0,-17
 582:	00000097          	auipc	ra,0x0
 586:	f3c080e7          	jalr	-196(ra) # 4be <write>
}
 58a:	60e2                	ld	ra,24(sp)
 58c:	6442                	ld	s0,16(sp)
 58e:	6105                	addi	sp,sp,32
 590:	8082                	ret

0000000000000592 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 592:	7139                	addi	sp,sp,-64
 594:	fc06                	sd	ra,56(sp)
 596:	f822                	sd	s0,48(sp)
 598:	f426                	sd	s1,40(sp)
 59a:	f04a                	sd	s2,32(sp)
 59c:	ec4e                	sd	s3,24(sp)
 59e:	0080                	addi	s0,sp,64
 5a0:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5a2:	c299                	beqz	a3,5a8 <printint+0x16>
 5a4:	0805c863          	bltz	a1,634 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 5a8:	2581                	sext.w	a1,a1
  neg = 0;
 5aa:	4881                	li	a7,0
  }

  i = 0;
 5ac:	fc040993          	addi	s3,s0,-64
  neg = 0;
 5b0:	86ce                	mv	a3,s3
  i = 0;
 5b2:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 5b4:	2601                	sext.w	a2,a2
 5b6:	00000517          	auipc	a0,0x0
 5ba:	50250513          	addi	a0,a0,1282 # ab8 <digits>
 5be:	883a                	mv	a6,a4
 5c0:	2705                	addiw	a4,a4,1
 5c2:	02c5f7bb          	remuw	a5,a1,a2
 5c6:	1782                	slli	a5,a5,0x20
 5c8:	9381                	srli	a5,a5,0x20
 5ca:	97aa                	add	a5,a5,a0
 5cc:	0007c783          	lbu	a5,0(a5)
 5d0:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 5d4:	0005879b          	sext.w	a5,a1
 5d8:	02c5d5bb          	divuw	a1,a1,a2
 5dc:	0685                	addi	a3,a3,1
 5de:	fec7f0e3          	bgeu	a5,a2,5be <printint+0x2c>
  if(neg)
 5e2:	00088c63          	beqz	a7,5fa <printint+0x68>
    buf[i++] = '-';
 5e6:	fd070793          	addi	a5,a4,-48
 5ea:	00878733          	add	a4,a5,s0
 5ee:	02d00793          	li	a5,45
 5f2:	fef70823          	sb	a5,-16(a4)
 5f6:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 5fa:	02e05663          	blez	a4,626 <printint+0x94>
 5fe:	fc040913          	addi	s2,s0,-64
 602:	993a                	add	s2,s2,a4
 604:	19fd                	addi	s3,s3,-1
 606:	99ba                	add	s3,s3,a4
 608:	377d                	addiw	a4,a4,-1
 60a:	1702                	slli	a4,a4,0x20
 60c:	9301                	srli	a4,a4,0x20
 60e:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 612:	fff94583          	lbu	a1,-1(s2)
 616:	8526                	mv	a0,s1
 618:	00000097          	auipc	ra,0x0
 61c:	f58080e7          	jalr	-168(ra) # 570 <putc>
  while(--i >= 0)
 620:	197d                	addi	s2,s2,-1
 622:	ff3918e3          	bne	s2,s3,612 <printint+0x80>
}
 626:	70e2                	ld	ra,56(sp)
 628:	7442                	ld	s0,48(sp)
 62a:	74a2                	ld	s1,40(sp)
 62c:	7902                	ld	s2,32(sp)
 62e:	69e2                	ld	s3,24(sp)
 630:	6121                	addi	sp,sp,64
 632:	8082                	ret
    x = -xx;
 634:	40b005bb          	negw	a1,a1
    neg = 1;
 638:	4885                	li	a7,1
    x = -xx;
 63a:	bf8d                	j	5ac <printint+0x1a>

000000000000063c <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 63c:	7119                	addi	sp,sp,-128
 63e:	fc86                	sd	ra,120(sp)
 640:	f8a2                	sd	s0,112(sp)
 642:	f4a6                	sd	s1,104(sp)
 644:	f0ca                	sd	s2,96(sp)
 646:	ecce                	sd	s3,88(sp)
 648:	e8d2                	sd	s4,80(sp)
 64a:	e4d6                	sd	s5,72(sp)
 64c:	e0da                	sd	s6,64(sp)
 64e:	fc5e                	sd	s7,56(sp)
 650:	f862                	sd	s8,48(sp)
 652:	f466                	sd	s9,40(sp)
 654:	f06a                	sd	s10,32(sp)
 656:	ec6e                	sd	s11,24(sp)
 658:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 65a:	0005c903          	lbu	s2,0(a1)
 65e:	18090f63          	beqz	s2,7fc <vprintf+0x1c0>
 662:	8aaa                	mv	s5,a0
 664:	8b32                	mv	s6,a2
 666:	00158493          	addi	s1,a1,1
  state = 0;
 66a:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 66c:	02500a13          	li	s4,37
 670:	4c55                	li	s8,21
 672:	00000c97          	auipc	s9,0x0
 676:	3eec8c93          	addi	s9,s9,1006 # a60 <malloc+0x160>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
        s = va_arg(ap, char*);
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 67a:	02800d93          	li	s11,40
  putc(fd, 'x');
 67e:	4d41                	li	s10,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 680:	00000b97          	auipc	s7,0x0
 684:	438b8b93          	addi	s7,s7,1080 # ab8 <digits>
 688:	a839                	j	6a6 <vprintf+0x6a>
        putc(fd, c);
 68a:	85ca                	mv	a1,s2
 68c:	8556                	mv	a0,s5
 68e:	00000097          	auipc	ra,0x0
 692:	ee2080e7          	jalr	-286(ra) # 570 <putc>
 696:	a019                	j	69c <vprintf+0x60>
    } else if(state == '%'){
 698:	01498d63          	beq	s3,s4,6b2 <vprintf+0x76>
  for(i = 0; fmt[i]; i++){
 69c:	0485                	addi	s1,s1,1
 69e:	fff4c903          	lbu	s2,-1(s1)
 6a2:	14090d63          	beqz	s2,7fc <vprintf+0x1c0>
    if(state == 0){
 6a6:	fe0999e3          	bnez	s3,698 <vprintf+0x5c>
      if(c == '%'){
 6aa:	ff4910e3          	bne	s2,s4,68a <vprintf+0x4e>
        state = '%';
 6ae:	89d2                	mv	s3,s4
 6b0:	b7f5                	j	69c <vprintf+0x60>
      if(c == 'd'){
 6b2:	11490c63          	beq	s2,s4,7ca <vprintf+0x18e>
 6b6:	f9d9079b          	addiw	a5,s2,-99
 6ba:	0ff7f793          	zext.b	a5,a5
 6be:	10fc6e63          	bltu	s8,a5,7da <vprintf+0x19e>
 6c2:	f9d9079b          	addiw	a5,s2,-99
 6c6:	0ff7f713          	zext.b	a4,a5
 6ca:	10ec6863          	bltu	s8,a4,7da <vprintf+0x19e>
 6ce:	00271793          	slli	a5,a4,0x2
 6d2:	97e6                	add	a5,a5,s9
 6d4:	439c                	lw	a5,0(a5)
 6d6:	97e6                	add	a5,a5,s9
 6d8:	8782                	jr	a5
        printint(fd, va_arg(ap, int), 10, 1);
 6da:	008b0913          	addi	s2,s6,8
 6de:	4685                	li	a3,1
 6e0:	4629                	li	a2,10
 6e2:	000b2583          	lw	a1,0(s6)
 6e6:	8556                	mv	a0,s5
 6e8:	00000097          	auipc	ra,0x0
 6ec:	eaa080e7          	jalr	-342(ra) # 592 <printint>
 6f0:	8b4a                	mv	s6,s2
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6f2:	4981                	li	s3,0
 6f4:	b765                	j	69c <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 6f6:	008b0913          	addi	s2,s6,8
 6fa:	4681                	li	a3,0
 6fc:	4629                	li	a2,10
 6fe:	000b2583          	lw	a1,0(s6)
 702:	8556                	mv	a0,s5
 704:	00000097          	auipc	ra,0x0
 708:	e8e080e7          	jalr	-370(ra) # 592 <printint>
 70c:	8b4a                	mv	s6,s2
      state = 0;
 70e:	4981                	li	s3,0
 710:	b771                	j	69c <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 712:	008b0913          	addi	s2,s6,8
 716:	4681                	li	a3,0
 718:	866a                	mv	a2,s10
 71a:	000b2583          	lw	a1,0(s6)
 71e:	8556                	mv	a0,s5
 720:	00000097          	auipc	ra,0x0
 724:	e72080e7          	jalr	-398(ra) # 592 <printint>
 728:	8b4a                	mv	s6,s2
      state = 0;
 72a:	4981                	li	s3,0
 72c:	bf85                	j	69c <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 72e:	008b0793          	addi	a5,s6,8
 732:	f8f43423          	sd	a5,-120(s0)
 736:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 73a:	03000593          	li	a1,48
 73e:	8556                	mv	a0,s5
 740:	00000097          	auipc	ra,0x0
 744:	e30080e7          	jalr	-464(ra) # 570 <putc>
  putc(fd, 'x');
 748:	07800593          	li	a1,120
 74c:	8556                	mv	a0,s5
 74e:	00000097          	auipc	ra,0x0
 752:	e22080e7          	jalr	-478(ra) # 570 <putc>
 756:	896a                	mv	s2,s10
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 758:	03c9d793          	srli	a5,s3,0x3c
 75c:	97de                	add	a5,a5,s7
 75e:	0007c583          	lbu	a1,0(a5)
 762:	8556                	mv	a0,s5
 764:	00000097          	auipc	ra,0x0
 768:	e0c080e7          	jalr	-500(ra) # 570 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 76c:	0992                	slli	s3,s3,0x4
 76e:	397d                	addiw	s2,s2,-1
 770:	fe0914e3          	bnez	s2,758 <vprintf+0x11c>
        printptr(fd, va_arg(ap, uint64));
 774:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 778:	4981                	li	s3,0
 77a:	b70d                	j	69c <vprintf+0x60>
        s = va_arg(ap, char*);
 77c:	008b0913          	addi	s2,s6,8
 780:	000b3983          	ld	s3,0(s6)
        if(s == 0)
 784:	02098163          	beqz	s3,7a6 <vprintf+0x16a>
        while(*s != 0){
 788:	0009c583          	lbu	a1,0(s3)
 78c:	c5ad                	beqz	a1,7f6 <vprintf+0x1ba>
          putc(fd, *s);
 78e:	8556                	mv	a0,s5
 790:	00000097          	auipc	ra,0x0
 794:	de0080e7          	jalr	-544(ra) # 570 <putc>
          s++;
 798:	0985                	addi	s3,s3,1
        while(*s != 0){
 79a:	0009c583          	lbu	a1,0(s3)
 79e:	f9e5                	bnez	a1,78e <vprintf+0x152>
        s = va_arg(ap, char*);
 7a0:	8b4a                	mv	s6,s2
      state = 0;
 7a2:	4981                	li	s3,0
 7a4:	bde5                	j	69c <vprintf+0x60>
          s = "(null)";
 7a6:	00000997          	auipc	s3,0x0
 7aa:	2b298993          	addi	s3,s3,690 # a58 <malloc+0x158>
        while(*s != 0){
 7ae:	85ee                	mv	a1,s11
 7b0:	bff9                	j	78e <vprintf+0x152>
        putc(fd, va_arg(ap, uint));
 7b2:	008b0913          	addi	s2,s6,8
 7b6:	000b4583          	lbu	a1,0(s6)
 7ba:	8556                	mv	a0,s5
 7bc:	00000097          	auipc	ra,0x0
 7c0:	db4080e7          	jalr	-588(ra) # 570 <putc>
 7c4:	8b4a                	mv	s6,s2
      state = 0;
 7c6:	4981                	li	s3,0
 7c8:	bdd1                	j	69c <vprintf+0x60>
        putc(fd, c);
 7ca:	85d2                	mv	a1,s4
 7cc:	8556                	mv	a0,s5
 7ce:	00000097          	auipc	ra,0x0
 7d2:	da2080e7          	jalr	-606(ra) # 570 <putc>
      state = 0;
 7d6:	4981                	li	s3,0
 7d8:	b5d1                	j	69c <vprintf+0x60>
        putc(fd, '%');
 7da:	85d2                	mv	a1,s4
 7dc:	8556                	mv	a0,s5
 7de:	00000097          	auipc	ra,0x0
 7e2:	d92080e7          	jalr	-622(ra) # 570 <putc>
        putc(fd, c);
 7e6:	85ca                	mv	a1,s2
 7e8:	8556                	mv	a0,s5
 7ea:	00000097          	auipc	ra,0x0
 7ee:	d86080e7          	jalr	-634(ra) # 570 <putc>
      state = 0;
 7f2:	4981                	li	s3,0
 7f4:	b565                	j	69c <vprintf+0x60>
        s = va_arg(ap, char*);
 7f6:	8b4a                	mv	s6,s2
      state = 0;
 7f8:	4981                	li	s3,0
 7fa:	b54d                	j	69c <vprintf+0x60>
    }
  }
}
 7fc:	70e6                	ld	ra,120(sp)
 7fe:	7446                	ld	s0,112(sp)
 800:	74a6                	ld	s1,104(sp)
 802:	7906                	ld	s2,96(sp)
 804:	69e6                	ld	s3,88(sp)
 806:	6a46                	ld	s4,80(sp)
 808:	6aa6                	ld	s5,72(sp)
 80a:	6b06                	ld	s6,64(sp)
 80c:	7be2                	ld	s7,56(sp)
 80e:	7c42                	ld	s8,48(sp)
 810:	7ca2                	ld	s9,40(sp)
 812:	7d02                	ld	s10,32(sp)
 814:	6de2                	ld	s11,24(sp)
 816:	6109                	addi	sp,sp,128
 818:	8082                	ret

000000000000081a <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 81a:	715d                	addi	sp,sp,-80
 81c:	ec06                	sd	ra,24(sp)
 81e:	e822                	sd	s0,16(sp)
 820:	1000                	addi	s0,sp,32
 822:	e010                	sd	a2,0(s0)
 824:	e414                	sd	a3,8(s0)
 826:	e818                	sd	a4,16(s0)
 828:	ec1c                	sd	a5,24(s0)
 82a:	03043023          	sd	a6,32(s0)
 82e:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 832:	8622                	mv	a2,s0
 834:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 838:	00000097          	auipc	ra,0x0
 83c:	e04080e7          	jalr	-508(ra) # 63c <vprintf>
}
 840:	60e2                	ld	ra,24(sp)
 842:	6442                	ld	s0,16(sp)
 844:	6161                	addi	sp,sp,80
 846:	8082                	ret

0000000000000848 <printf>:

void
printf(const char *fmt, ...)
{
 848:	711d                	addi	sp,sp,-96
 84a:	ec06                	sd	ra,24(sp)
 84c:	e822                	sd	s0,16(sp)
 84e:	1000                	addi	s0,sp,32
 850:	e40c                	sd	a1,8(s0)
 852:	e810                	sd	a2,16(s0)
 854:	ec14                	sd	a3,24(s0)
 856:	f018                	sd	a4,32(s0)
 858:	f41c                	sd	a5,40(s0)
 85a:	03043823          	sd	a6,48(s0)
 85e:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 862:	00840613          	addi	a2,s0,8
 866:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 86a:	85aa                	mv	a1,a0
 86c:	4505                	li	a0,1
 86e:	00000097          	auipc	ra,0x0
 872:	dce080e7          	jalr	-562(ra) # 63c <vprintf>
}
 876:	60e2                	ld	ra,24(sp)
 878:	6442                	ld	s0,16(sp)
 87a:	6125                	addi	sp,sp,96
 87c:	8082                	ret

000000000000087e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 87e:	1141                	addi	sp,sp,-16
 880:	e422                	sd	s0,8(sp)
 882:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 884:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 888:	00000797          	auipc	a5,0x0
 88c:	2707b783          	ld	a5,624(a5) # af8 <freep>
 890:	a02d                	j	8ba <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 892:	4618                	lw	a4,8(a2)
 894:	9f2d                	addw	a4,a4,a1
 896:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 89a:	6398                	ld	a4,0(a5)
 89c:	6310                	ld	a2,0(a4)
 89e:	a83d                	j	8dc <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 8a0:	ff852703          	lw	a4,-8(a0)
 8a4:	9f31                	addw	a4,a4,a2
 8a6:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 8a8:	ff053683          	ld	a3,-16(a0)
 8ac:	a091                	j	8f0 <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8ae:	6398                	ld	a4,0(a5)
 8b0:	00e7e463          	bltu	a5,a4,8b8 <free+0x3a>
 8b4:	00e6ea63          	bltu	a3,a4,8c8 <free+0x4a>
{
 8b8:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8ba:	fed7fae3          	bgeu	a5,a3,8ae <free+0x30>
 8be:	6398                	ld	a4,0(a5)
 8c0:	00e6e463          	bltu	a3,a4,8c8 <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8c4:	fee7eae3          	bltu	a5,a4,8b8 <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
 8c8:	ff852583          	lw	a1,-8(a0)
 8cc:	6390                	ld	a2,0(a5)
 8ce:	02059813          	slli	a6,a1,0x20
 8d2:	01c85713          	srli	a4,a6,0x1c
 8d6:	9736                	add	a4,a4,a3
 8d8:	fae60de3          	beq	a2,a4,892 <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
 8dc:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 8e0:	4790                	lw	a2,8(a5)
 8e2:	02061593          	slli	a1,a2,0x20
 8e6:	01c5d713          	srli	a4,a1,0x1c
 8ea:	973e                	add	a4,a4,a5
 8ec:	fae68ae3          	beq	a3,a4,8a0 <free+0x22>
    p->s.ptr = bp->s.ptr;
 8f0:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 8f2:	00000717          	auipc	a4,0x0
 8f6:	20f73323          	sd	a5,518(a4) # af8 <freep>
}
 8fa:	6422                	ld	s0,8(sp)
 8fc:	0141                	addi	sp,sp,16
 8fe:	8082                	ret

0000000000000900 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 900:	7139                	addi	sp,sp,-64
 902:	fc06                	sd	ra,56(sp)
 904:	f822                	sd	s0,48(sp)
 906:	f426                	sd	s1,40(sp)
 908:	f04a                	sd	s2,32(sp)
 90a:	ec4e                	sd	s3,24(sp)
 90c:	e852                	sd	s4,16(sp)
 90e:	e456                	sd	s5,8(sp)
 910:	e05a                	sd	s6,0(sp)
 912:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 914:	02051493          	slli	s1,a0,0x20
 918:	9081                	srli	s1,s1,0x20
 91a:	04bd                	addi	s1,s1,15
 91c:	8091                	srli	s1,s1,0x4
 91e:	00148a1b          	addiw	s4,s1,1
 922:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 924:	00000517          	auipc	a0,0x0
 928:	1d453503          	ld	a0,468(a0) # af8 <freep>
 92c:	c515                	beqz	a0,958 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 92e:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 930:	4798                	lw	a4,8(a5)
 932:	04977163          	bgeu	a4,s1,974 <malloc+0x74>
 936:	89d2                	mv	s3,s4
 938:	000a071b          	sext.w	a4,s4
 93c:	6685                	lui	a3,0x1
 93e:	00d77363          	bgeu	a4,a3,944 <malloc+0x44>
 942:	6985                	lui	s3,0x1
 944:	00098b1b          	sext.w	s6,s3
  p = sbrk(nu * sizeof(Header));
 948:	0049999b          	slliw	s3,s3,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 94c:	00000917          	auipc	s2,0x0
 950:	1ac90913          	addi	s2,s2,428 # af8 <freep>
  if(p == (char*)-1)
 954:	5afd                	li	s5,-1
 956:	a8a5                	j	9ce <malloc+0xce>
    base.s.ptr = freep = prevp = &base;
 958:	00000797          	auipc	a5,0x0
 95c:	1a078793          	addi	a5,a5,416 # af8 <freep>
 960:	00000717          	auipc	a4,0x0
 964:	1a070713          	addi	a4,a4,416 # b00 <base>
 968:	e398                	sd	a4,0(a5)
 96a:	e798                	sd	a4,8(a5)
    base.s.size = 0;
 96c:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 970:	87ba                	mv	a5,a4
 972:	b7d1                	j	936 <malloc+0x36>
      if(p->s.size == nunits)
 974:	02e48c63          	beq	s1,a4,9ac <malloc+0xac>
        p->s.size -= nunits;
 978:	4147073b          	subw	a4,a4,s4
 97c:	c798                	sw	a4,8(a5)
        p += p->s.size;
 97e:	02071693          	slli	a3,a4,0x20
 982:	01c6d713          	srli	a4,a3,0x1c
 986:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 988:	0147a423          	sw	s4,8(a5)
      freep = prevp;
 98c:	00000717          	auipc	a4,0x0
 990:	16a73623          	sd	a0,364(a4) # af8 <freep>
      return (void*)(p + 1);
 994:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 998:	70e2                	ld	ra,56(sp)
 99a:	7442                	ld	s0,48(sp)
 99c:	74a2                	ld	s1,40(sp)
 99e:	7902                	ld	s2,32(sp)
 9a0:	69e2                	ld	s3,24(sp)
 9a2:	6a42                	ld	s4,16(sp)
 9a4:	6aa2                	ld	s5,8(sp)
 9a6:	6b02                	ld	s6,0(sp)
 9a8:	6121                	addi	sp,sp,64
 9aa:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 9ac:	6398                	ld	a4,0(a5)
 9ae:	e118                	sd	a4,0(a0)
 9b0:	bff1                	j	98c <malloc+0x8c>
  hp->s.size = nu;
 9b2:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 9b6:	0541                	addi	a0,a0,16
 9b8:	00000097          	auipc	ra,0x0
 9bc:	ec6080e7          	jalr	-314(ra) # 87e <free>
  return freep;
 9c0:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 9c4:	d971                	beqz	a0,998 <malloc+0x98>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9c6:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 9c8:	4798                	lw	a4,8(a5)
 9ca:	fa9775e3          	bgeu	a4,s1,974 <malloc+0x74>
    if(p == freep)
 9ce:	00093703          	ld	a4,0(s2)
 9d2:	853e                	mv	a0,a5
 9d4:	fef719e3          	bne	a4,a5,9c6 <malloc+0xc6>
  p = sbrk(nu * sizeof(Header));
 9d8:	854e                	mv	a0,s3
 9da:	00000097          	auipc	ra,0x0
 9de:	b34080e7          	jalr	-1228(ra) # 50e <sbrk>
  if(p == (char*)-1)
 9e2:	fd5518e3          	bne	a0,s5,9b2 <malloc+0xb2>
        return 0;
 9e6:	4501                	li	a0,0
 9e8:	bf45                	j	998 <malloc+0x98>
