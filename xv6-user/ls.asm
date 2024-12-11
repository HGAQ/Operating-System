
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
  80:	97478793          	addi	a5,a5,-1676 # 9f0 <malloc+0xea>
  84:	f8f43423          	sd	a5,-120(s0)
  88:	00001797          	auipc	a5,0x1
  8c:	97078793          	addi	a5,a5,-1680 # 9f8 <malloc+0xf2>
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
  c8:	96ca0a13          	addi	s4,s4,-1684 # a30 <malloc+0x12a>
  cc:	a08d                	j	12e <ls+0xc8>
    fprintf(2, "ls: cannot open %s\n", path);
  ce:	864a                	mv	a2,s2
  d0:	00001597          	auipc	a1,0x1
  d4:	93058593          	addi	a1,a1,-1744 # a00 <malloc+0xfa>
  d8:	4509                	li	a0,2
  da:	00000097          	auipc	ra,0x0
  de:	746080e7          	jalr	1862(ra) # 820 <fprintf>
    return;
  e2:	a09d                	j	148 <ls+0xe2>
    fprintf(2, "ls: cannot stat %s\n", path);
  e4:	864a                	mv	a2,s2
  e6:	00001597          	auipc	a1,0x1
  ea:	93258593          	addi	a1,a1,-1742 # a18 <malloc+0x112>
  ee:	4509                	li	a0,2
  f0:	00000097          	auipc	ra,0x0
  f4:	730080e7          	jalr	1840(ra) # 820 <fprintf>
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
 12a:	728080e7          	jalr	1832(ra) # 84e <printf>
    while(readdir(fd, &st) == 1){
 12e:	85ca                	mv	a1,s2
 130:	8526                	mv	a0,s1
 132:	00000097          	auipc	ra,0x0
 136:	406080e7          	jalr	1030(ra) # 538 <readdir>
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
 17e:	8c650513          	addi	a0,a0,-1850 # a40 <malloc+0x13a>
 182:	00000097          	auipc	ra,0x0
 186:	6cc080e7          	jalr	1740(ra) # 84e <printf>
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
 1d0:	88450513          	addi	a0,a0,-1916 # a50 <malloc+0x14a>
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
 52e:	0e900893          	li	a7,233
 ecall
 532:	00000073          	ecall
 ret
 536:	8082                	ret

0000000000000538 <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 538:	0f400893          	li	a7,244
 ecall
 53c:	00000073          	ecall
 ret
 540:	8082                	ret

0000000000000542 <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 542:	48e5                	li	a7,25
 ecall
 544:	00000073          	ecall
 ret
 548:	8082                	ret

000000000000054a <remove>:
.global remove
remove:
 li a7, SYS_remove
 54a:	0b100893          	li	a7,177
 ecall
 54e:	00000073          	ecall
 ret
 552:	8082                	ret

0000000000000554 <trace>:
.global trace
trace:
 li a7, SYS_trace
 554:	48c9                	li	a7,18
 ecall
 556:	00000073          	ecall
 ret
 55a:	8082                	ret

000000000000055c <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 55c:	48cd                	li	a7,19
 ecall
 55e:	00000073          	ecall
 ret
 562:	8082                	ret

0000000000000564 <rename>:
.global rename
rename:
 li a7, SYS_rename
 564:	48e9                	li	a7,26
 ecall
 566:	00000073          	ecall
 ret
 56a:	8082                	ret

000000000000056c <poweroff>:
.global poweroff
poweroff:
 li a7, SYS_poweroff
 56c:	0d200893          	li	a7,210
 ecall
 570:	00000073          	ecall
 ret
 574:	8082                	ret

0000000000000576 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 576:	1101                	addi	sp,sp,-32
 578:	ec06                	sd	ra,24(sp)
 57a:	e822                	sd	s0,16(sp)
 57c:	1000                	addi	s0,sp,32
 57e:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 582:	4605                	li	a2,1
 584:	fef40593          	addi	a1,s0,-17
 588:	00000097          	auipc	ra,0x0
 58c:	f36080e7          	jalr	-202(ra) # 4be <write>
}
 590:	60e2                	ld	ra,24(sp)
 592:	6442                	ld	s0,16(sp)
 594:	6105                	addi	sp,sp,32
 596:	8082                	ret

0000000000000598 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 598:	7139                	addi	sp,sp,-64
 59a:	fc06                	sd	ra,56(sp)
 59c:	f822                	sd	s0,48(sp)
 59e:	f426                	sd	s1,40(sp)
 5a0:	f04a                	sd	s2,32(sp)
 5a2:	ec4e                	sd	s3,24(sp)
 5a4:	0080                	addi	s0,sp,64
 5a6:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5a8:	c299                	beqz	a3,5ae <printint+0x16>
 5aa:	0805c863          	bltz	a1,63a <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 5ae:	2581                	sext.w	a1,a1
  neg = 0;
 5b0:	4881                	li	a7,0
  }

  i = 0;
 5b2:	fc040993          	addi	s3,s0,-64
  neg = 0;
 5b6:	86ce                	mv	a3,s3
  i = 0;
 5b8:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 5ba:	2601                	sext.w	a2,a2
 5bc:	00000517          	auipc	a0,0x0
 5c0:	4fc50513          	addi	a0,a0,1276 # ab8 <digits>
 5c4:	883a                	mv	a6,a4
 5c6:	2705                	addiw	a4,a4,1
 5c8:	02c5f7bb          	remuw	a5,a1,a2
 5cc:	1782                	slli	a5,a5,0x20
 5ce:	9381                	srli	a5,a5,0x20
 5d0:	97aa                	add	a5,a5,a0
 5d2:	0007c783          	lbu	a5,0(a5)
 5d6:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 5da:	0005879b          	sext.w	a5,a1
 5de:	02c5d5bb          	divuw	a1,a1,a2
 5e2:	0685                	addi	a3,a3,1
 5e4:	fec7f0e3          	bgeu	a5,a2,5c4 <printint+0x2c>
  if(neg)
 5e8:	00088c63          	beqz	a7,600 <printint+0x68>
    buf[i++] = '-';
 5ec:	fd070793          	addi	a5,a4,-48
 5f0:	00878733          	add	a4,a5,s0
 5f4:	02d00793          	li	a5,45
 5f8:	fef70823          	sb	a5,-16(a4)
 5fc:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 600:	02e05663          	blez	a4,62c <printint+0x94>
 604:	fc040913          	addi	s2,s0,-64
 608:	993a                	add	s2,s2,a4
 60a:	19fd                	addi	s3,s3,-1
 60c:	99ba                	add	s3,s3,a4
 60e:	377d                	addiw	a4,a4,-1
 610:	1702                	slli	a4,a4,0x20
 612:	9301                	srli	a4,a4,0x20
 614:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 618:	fff94583          	lbu	a1,-1(s2)
 61c:	8526                	mv	a0,s1
 61e:	00000097          	auipc	ra,0x0
 622:	f58080e7          	jalr	-168(ra) # 576 <putc>
  while(--i >= 0)
 626:	197d                	addi	s2,s2,-1
 628:	ff3918e3          	bne	s2,s3,618 <printint+0x80>
}
 62c:	70e2                	ld	ra,56(sp)
 62e:	7442                	ld	s0,48(sp)
 630:	74a2                	ld	s1,40(sp)
 632:	7902                	ld	s2,32(sp)
 634:	69e2                	ld	s3,24(sp)
 636:	6121                	addi	sp,sp,64
 638:	8082                	ret
    x = -xx;
 63a:	40b005bb          	negw	a1,a1
    neg = 1;
 63e:	4885                	li	a7,1
    x = -xx;
 640:	bf8d                	j	5b2 <printint+0x1a>

0000000000000642 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 642:	7119                	addi	sp,sp,-128
 644:	fc86                	sd	ra,120(sp)
 646:	f8a2                	sd	s0,112(sp)
 648:	f4a6                	sd	s1,104(sp)
 64a:	f0ca                	sd	s2,96(sp)
 64c:	ecce                	sd	s3,88(sp)
 64e:	e8d2                	sd	s4,80(sp)
 650:	e4d6                	sd	s5,72(sp)
 652:	e0da                	sd	s6,64(sp)
 654:	fc5e                	sd	s7,56(sp)
 656:	f862                	sd	s8,48(sp)
 658:	f466                	sd	s9,40(sp)
 65a:	f06a                	sd	s10,32(sp)
 65c:	ec6e                	sd	s11,24(sp)
 65e:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 660:	0005c903          	lbu	s2,0(a1)
 664:	18090f63          	beqz	s2,802 <vprintf+0x1c0>
 668:	8aaa                	mv	s5,a0
 66a:	8b32                	mv	s6,a2
 66c:	00158493          	addi	s1,a1,1
  state = 0;
 670:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 672:	02500a13          	li	s4,37
 676:	4c55                	li	s8,21
 678:	00000c97          	auipc	s9,0x0
 67c:	3e8c8c93          	addi	s9,s9,1000 # a60 <malloc+0x15a>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
        s = va_arg(ap, char*);
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 680:	02800d93          	li	s11,40
  putc(fd, 'x');
 684:	4d41                	li	s10,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 686:	00000b97          	auipc	s7,0x0
 68a:	432b8b93          	addi	s7,s7,1074 # ab8 <digits>
 68e:	a839                	j	6ac <vprintf+0x6a>
        putc(fd, c);
 690:	85ca                	mv	a1,s2
 692:	8556                	mv	a0,s5
 694:	00000097          	auipc	ra,0x0
 698:	ee2080e7          	jalr	-286(ra) # 576 <putc>
 69c:	a019                	j	6a2 <vprintf+0x60>
    } else if(state == '%'){
 69e:	01498d63          	beq	s3,s4,6b8 <vprintf+0x76>
  for(i = 0; fmt[i]; i++){
 6a2:	0485                	addi	s1,s1,1
 6a4:	fff4c903          	lbu	s2,-1(s1)
 6a8:	14090d63          	beqz	s2,802 <vprintf+0x1c0>
    if(state == 0){
 6ac:	fe0999e3          	bnez	s3,69e <vprintf+0x5c>
      if(c == '%'){
 6b0:	ff4910e3          	bne	s2,s4,690 <vprintf+0x4e>
        state = '%';
 6b4:	89d2                	mv	s3,s4
 6b6:	b7f5                	j	6a2 <vprintf+0x60>
      if(c == 'd'){
 6b8:	11490c63          	beq	s2,s4,7d0 <vprintf+0x18e>
 6bc:	f9d9079b          	addiw	a5,s2,-99
 6c0:	0ff7f793          	zext.b	a5,a5
 6c4:	10fc6e63          	bltu	s8,a5,7e0 <vprintf+0x19e>
 6c8:	f9d9079b          	addiw	a5,s2,-99
 6cc:	0ff7f713          	zext.b	a4,a5
 6d0:	10ec6863          	bltu	s8,a4,7e0 <vprintf+0x19e>
 6d4:	00271793          	slli	a5,a4,0x2
 6d8:	97e6                	add	a5,a5,s9
 6da:	439c                	lw	a5,0(a5)
 6dc:	97e6                	add	a5,a5,s9
 6de:	8782                	jr	a5
        printint(fd, va_arg(ap, int), 10, 1);
 6e0:	008b0913          	addi	s2,s6,8
 6e4:	4685                	li	a3,1
 6e6:	4629                	li	a2,10
 6e8:	000b2583          	lw	a1,0(s6)
 6ec:	8556                	mv	a0,s5
 6ee:	00000097          	auipc	ra,0x0
 6f2:	eaa080e7          	jalr	-342(ra) # 598 <printint>
 6f6:	8b4a                	mv	s6,s2
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6f8:	4981                	li	s3,0
 6fa:	b765                	j	6a2 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 6fc:	008b0913          	addi	s2,s6,8
 700:	4681                	li	a3,0
 702:	4629                	li	a2,10
 704:	000b2583          	lw	a1,0(s6)
 708:	8556                	mv	a0,s5
 70a:	00000097          	auipc	ra,0x0
 70e:	e8e080e7          	jalr	-370(ra) # 598 <printint>
 712:	8b4a                	mv	s6,s2
      state = 0;
 714:	4981                	li	s3,0
 716:	b771                	j	6a2 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 718:	008b0913          	addi	s2,s6,8
 71c:	4681                	li	a3,0
 71e:	866a                	mv	a2,s10
 720:	000b2583          	lw	a1,0(s6)
 724:	8556                	mv	a0,s5
 726:	00000097          	auipc	ra,0x0
 72a:	e72080e7          	jalr	-398(ra) # 598 <printint>
 72e:	8b4a                	mv	s6,s2
      state = 0;
 730:	4981                	li	s3,0
 732:	bf85                	j	6a2 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 734:	008b0793          	addi	a5,s6,8
 738:	f8f43423          	sd	a5,-120(s0)
 73c:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 740:	03000593          	li	a1,48
 744:	8556                	mv	a0,s5
 746:	00000097          	auipc	ra,0x0
 74a:	e30080e7          	jalr	-464(ra) # 576 <putc>
  putc(fd, 'x');
 74e:	07800593          	li	a1,120
 752:	8556                	mv	a0,s5
 754:	00000097          	auipc	ra,0x0
 758:	e22080e7          	jalr	-478(ra) # 576 <putc>
 75c:	896a                	mv	s2,s10
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 75e:	03c9d793          	srli	a5,s3,0x3c
 762:	97de                	add	a5,a5,s7
 764:	0007c583          	lbu	a1,0(a5)
 768:	8556                	mv	a0,s5
 76a:	00000097          	auipc	ra,0x0
 76e:	e0c080e7          	jalr	-500(ra) # 576 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 772:	0992                	slli	s3,s3,0x4
 774:	397d                	addiw	s2,s2,-1
 776:	fe0914e3          	bnez	s2,75e <vprintf+0x11c>
        printptr(fd, va_arg(ap, uint64));
 77a:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 77e:	4981                	li	s3,0
 780:	b70d                	j	6a2 <vprintf+0x60>
        s = va_arg(ap, char*);
 782:	008b0913          	addi	s2,s6,8
 786:	000b3983          	ld	s3,0(s6)
        if(s == 0)
 78a:	02098163          	beqz	s3,7ac <vprintf+0x16a>
        while(*s != 0){
 78e:	0009c583          	lbu	a1,0(s3)
 792:	c5ad                	beqz	a1,7fc <vprintf+0x1ba>
          putc(fd, *s);
 794:	8556                	mv	a0,s5
 796:	00000097          	auipc	ra,0x0
 79a:	de0080e7          	jalr	-544(ra) # 576 <putc>
          s++;
 79e:	0985                	addi	s3,s3,1
        while(*s != 0){
 7a0:	0009c583          	lbu	a1,0(s3)
 7a4:	f9e5                	bnez	a1,794 <vprintf+0x152>
        s = va_arg(ap, char*);
 7a6:	8b4a                	mv	s6,s2
      state = 0;
 7a8:	4981                	li	s3,0
 7aa:	bde5                	j	6a2 <vprintf+0x60>
          s = "(null)";
 7ac:	00000997          	auipc	s3,0x0
 7b0:	2ac98993          	addi	s3,s3,684 # a58 <malloc+0x152>
        while(*s != 0){
 7b4:	85ee                	mv	a1,s11
 7b6:	bff9                	j	794 <vprintf+0x152>
        putc(fd, va_arg(ap, uint));
 7b8:	008b0913          	addi	s2,s6,8
 7bc:	000b4583          	lbu	a1,0(s6)
 7c0:	8556                	mv	a0,s5
 7c2:	00000097          	auipc	ra,0x0
 7c6:	db4080e7          	jalr	-588(ra) # 576 <putc>
 7ca:	8b4a                	mv	s6,s2
      state = 0;
 7cc:	4981                	li	s3,0
 7ce:	bdd1                	j	6a2 <vprintf+0x60>
        putc(fd, c);
 7d0:	85d2                	mv	a1,s4
 7d2:	8556                	mv	a0,s5
 7d4:	00000097          	auipc	ra,0x0
 7d8:	da2080e7          	jalr	-606(ra) # 576 <putc>
      state = 0;
 7dc:	4981                	li	s3,0
 7de:	b5d1                	j	6a2 <vprintf+0x60>
        putc(fd, '%');
 7e0:	85d2                	mv	a1,s4
 7e2:	8556                	mv	a0,s5
 7e4:	00000097          	auipc	ra,0x0
 7e8:	d92080e7          	jalr	-622(ra) # 576 <putc>
        putc(fd, c);
 7ec:	85ca                	mv	a1,s2
 7ee:	8556                	mv	a0,s5
 7f0:	00000097          	auipc	ra,0x0
 7f4:	d86080e7          	jalr	-634(ra) # 576 <putc>
      state = 0;
 7f8:	4981                	li	s3,0
 7fa:	b565                	j	6a2 <vprintf+0x60>
        s = va_arg(ap, char*);
 7fc:	8b4a                	mv	s6,s2
      state = 0;
 7fe:	4981                	li	s3,0
 800:	b54d                	j	6a2 <vprintf+0x60>
    }
  }
}
 802:	70e6                	ld	ra,120(sp)
 804:	7446                	ld	s0,112(sp)
 806:	74a6                	ld	s1,104(sp)
 808:	7906                	ld	s2,96(sp)
 80a:	69e6                	ld	s3,88(sp)
 80c:	6a46                	ld	s4,80(sp)
 80e:	6aa6                	ld	s5,72(sp)
 810:	6b06                	ld	s6,64(sp)
 812:	7be2                	ld	s7,56(sp)
 814:	7c42                	ld	s8,48(sp)
 816:	7ca2                	ld	s9,40(sp)
 818:	7d02                	ld	s10,32(sp)
 81a:	6de2                	ld	s11,24(sp)
 81c:	6109                	addi	sp,sp,128
 81e:	8082                	ret

0000000000000820 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 820:	715d                	addi	sp,sp,-80
 822:	ec06                	sd	ra,24(sp)
 824:	e822                	sd	s0,16(sp)
 826:	1000                	addi	s0,sp,32
 828:	e010                	sd	a2,0(s0)
 82a:	e414                	sd	a3,8(s0)
 82c:	e818                	sd	a4,16(s0)
 82e:	ec1c                	sd	a5,24(s0)
 830:	03043023          	sd	a6,32(s0)
 834:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 838:	8622                	mv	a2,s0
 83a:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 83e:	00000097          	auipc	ra,0x0
 842:	e04080e7          	jalr	-508(ra) # 642 <vprintf>
}
 846:	60e2                	ld	ra,24(sp)
 848:	6442                	ld	s0,16(sp)
 84a:	6161                	addi	sp,sp,80
 84c:	8082                	ret

000000000000084e <printf>:

void
printf(const char *fmt, ...)
{
 84e:	711d                	addi	sp,sp,-96
 850:	ec06                	sd	ra,24(sp)
 852:	e822                	sd	s0,16(sp)
 854:	1000                	addi	s0,sp,32
 856:	e40c                	sd	a1,8(s0)
 858:	e810                	sd	a2,16(s0)
 85a:	ec14                	sd	a3,24(s0)
 85c:	f018                	sd	a4,32(s0)
 85e:	f41c                	sd	a5,40(s0)
 860:	03043823          	sd	a6,48(s0)
 864:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 868:	00840613          	addi	a2,s0,8
 86c:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 870:	85aa                	mv	a1,a0
 872:	4505                	li	a0,1
 874:	00000097          	auipc	ra,0x0
 878:	dce080e7          	jalr	-562(ra) # 642 <vprintf>
}
 87c:	60e2                	ld	ra,24(sp)
 87e:	6442                	ld	s0,16(sp)
 880:	6125                	addi	sp,sp,96
 882:	8082                	ret

0000000000000884 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 884:	1141                	addi	sp,sp,-16
 886:	e422                	sd	s0,8(sp)
 888:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 88a:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 88e:	00000797          	auipc	a5,0x0
 892:	26a7b783          	ld	a5,618(a5) # af8 <freep>
 896:	a02d                	j	8c0 <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 898:	4618                	lw	a4,8(a2)
 89a:	9f2d                	addw	a4,a4,a1
 89c:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 8a0:	6398                	ld	a4,0(a5)
 8a2:	6310                	ld	a2,0(a4)
 8a4:	a83d                	j	8e2 <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 8a6:	ff852703          	lw	a4,-8(a0)
 8aa:	9f31                	addw	a4,a4,a2
 8ac:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 8ae:	ff053683          	ld	a3,-16(a0)
 8b2:	a091                	j	8f6 <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8b4:	6398                	ld	a4,0(a5)
 8b6:	00e7e463          	bltu	a5,a4,8be <free+0x3a>
 8ba:	00e6ea63          	bltu	a3,a4,8ce <free+0x4a>
{
 8be:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8c0:	fed7fae3          	bgeu	a5,a3,8b4 <free+0x30>
 8c4:	6398                	ld	a4,0(a5)
 8c6:	00e6e463          	bltu	a3,a4,8ce <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8ca:	fee7eae3          	bltu	a5,a4,8be <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
 8ce:	ff852583          	lw	a1,-8(a0)
 8d2:	6390                	ld	a2,0(a5)
 8d4:	02059813          	slli	a6,a1,0x20
 8d8:	01c85713          	srli	a4,a6,0x1c
 8dc:	9736                	add	a4,a4,a3
 8de:	fae60de3          	beq	a2,a4,898 <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
 8e2:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 8e6:	4790                	lw	a2,8(a5)
 8e8:	02061593          	slli	a1,a2,0x20
 8ec:	01c5d713          	srli	a4,a1,0x1c
 8f0:	973e                	add	a4,a4,a5
 8f2:	fae68ae3          	beq	a3,a4,8a6 <free+0x22>
    p->s.ptr = bp->s.ptr;
 8f6:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 8f8:	00000717          	auipc	a4,0x0
 8fc:	20f73023          	sd	a5,512(a4) # af8 <freep>
}
 900:	6422                	ld	s0,8(sp)
 902:	0141                	addi	sp,sp,16
 904:	8082                	ret

0000000000000906 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 906:	7139                	addi	sp,sp,-64
 908:	fc06                	sd	ra,56(sp)
 90a:	f822                	sd	s0,48(sp)
 90c:	f426                	sd	s1,40(sp)
 90e:	f04a                	sd	s2,32(sp)
 910:	ec4e                	sd	s3,24(sp)
 912:	e852                	sd	s4,16(sp)
 914:	e456                	sd	s5,8(sp)
 916:	e05a                	sd	s6,0(sp)
 918:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 91a:	02051493          	slli	s1,a0,0x20
 91e:	9081                	srli	s1,s1,0x20
 920:	04bd                	addi	s1,s1,15
 922:	8091                	srli	s1,s1,0x4
 924:	00148a1b          	addiw	s4,s1,1
 928:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 92a:	00000517          	auipc	a0,0x0
 92e:	1ce53503          	ld	a0,462(a0) # af8 <freep>
 932:	c515                	beqz	a0,95e <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 934:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 936:	4798                	lw	a4,8(a5)
 938:	04977163          	bgeu	a4,s1,97a <malloc+0x74>
 93c:	89d2                	mv	s3,s4
 93e:	000a071b          	sext.w	a4,s4
 942:	6685                	lui	a3,0x1
 944:	00d77363          	bgeu	a4,a3,94a <malloc+0x44>
 948:	6985                	lui	s3,0x1
 94a:	00098b1b          	sext.w	s6,s3
  p = sbrk(nu * sizeof(Header));
 94e:	0049999b          	slliw	s3,s3,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 952:	00000917          	auipc	s2,0x0
 956:	1a690913          	addi	s2,s2,422 # af8 <freep>
  if(p == (char*)-1)
 95a:	5afd                	li	s5,-1
 95c:	a8a5                	j	9d4 <malloc+0xce>
    base.s.ptr = freep = prevp = &base;
 95e:	00000797          	auipc	a5,0x0
 962:	19a78793          	addi	a5,a5,410 # af8 <freep>
 966:	00000717          	auipc	a4,0x0
 96a:	19a70713          	addi	a4,a4,410 # b00 <base>
 96e:	e398                	sd	a4,0(a5)
 970:	e798                	sd	a4,8(a5)
    base.s.size = 0;
 972:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 976:	87ba                	mv	a5,a4
 978:	b7d1                	j	93c <malloc+0x36>
      if(p->s.size == nunits)
 97a:	02e48c63          	beq	s1,a4,9b2 <malloc+0xac>
        p->s.size -= nunits;
 97e:	4147073b          	subw	a4,a4,s4
 982:	c798                	sw	a4,8(a5)
        p += p->s.size;
 984:	02071693          	slli	a3,a4,0x20
 988:	01c6d713          	srli	a4,a3,0x1c
 98c:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 98e:	0147a423          	sw	s4,8(a5)
      freep = prevp;
 992:	00000717          	auipc	a4,0x0
 996:	16a73323          	sd	a0,358(a4) # af8 <freep>
      return (void*)(p + 1);
 99a:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 99e:	70e2                	ld	ra,56(sp)
 9a0:	7442                	ld	s0,48(sp)
 9a2:	74a2                	ld	s1,40(sp)
 9a4:	7902                	ld	s2,32(sp)
 9a6:	69e2                	ld	s3,24(sp)
 9a8:	6a42                	ld	s4,16(sp)
 9aa:	6aa2                	ld	s5,8(sp)
 9ac:	6b02                	ld	s6,0(sp)
 9ae:	6121                	addi	sp,sp,64
 9b0:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 9b2:	6398                	ld	a4,0(a5)
 9b4:	e118                	sd	a4,0(a0)
 9b6:	bff1                	j	992 <malloc+0x8c>
  hp->s.size = nu;
 9b8:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 9bc:	0541                	addi	a0,a0,16
 9be:	00000097          	auipc	ra,0x0
 9c2:	ec6080e7          	jalr	-314(ra) # 884 <free>
  return freep;
 9c6:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 9ca:	d971                	beqz	a0,99e <malloc+0x98>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9cc:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 9ce:	4798                	lw	a4,8(a5)
 9d0:	fa9775e3          	bgeu	a4,s1,97a <malloc+0x74>
    if(p == freep)
 9d4:	00093703          	ld	a4,0(s2)
 9d8:	853e                	mv	a0,a5
 9da:	fef719e3          	bne	a4,a5,9cc <malloc+0xc6>
  p = sbrk(nu * sizeof(Header));
 9de:	854e                	mv	a0,s3
 9e0:	00000097          	auipc	ra,0x0
 9e4:	b2e080e7          	jalr	-1234(ra) # 50e <sbrk>
  if(p == (char*)-1)
 9e8:	fd5518e3          	bne	a0,s5,9b8 <malloc+0xb2>
        return 0;
 9ec:	4501                	li	a0,0
 9ee:	bf45                	j	99e <malloc+0x98>
