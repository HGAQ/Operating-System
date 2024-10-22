
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
  20:	acc50513          	addi	a0,a0,-1332 # ae8 <path>
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
  72:	a7a60613          	addi	a2,a2,-1414 # ae8 <path>
  76:	00001597          	auipc	a1,0x1
  7a:	97a58593          	addi	a1,a1,-1670 # 9f0 <malloc+0xec>
  7e:	4509                	li	a0,2
  80:	00000097          	auipc	ra,0x0
  84:	79e080e7          	jalr	1950(ra) # 81e <fprintf>
        return;
  88:	b7f9                	j	56 <find+0x56>
        fprintf(2, "find: cannot stat %s\n", path);
  8a:	00001617          	auipc	a2,0x1
  8e:	a5e60613          	addi	a2,a2,-1442 # ae8 <path>
  92:	00001597          	auipc	a1,0x1
  96:	97658593          	addi	a1,a1,-1674 # a08 <malloc+0x104>
  9a:	4509                	li	a0,2
  9c:	00000097          	auipc	ra,0x0
  a0:	782080e7          	jalr	1922(ra) # 81e <fprintf>
        close(fd);
  a4:	8526                	mv	a0,s1
  a6:	00000097          	auipc	ra,0x0
  aa:	440080e7          	jalr	1088(ra) # 4e6 <close>
        return;
  ae:	b765                	j	56 <find+0x56>
    if (strlen(path) + 255 + 2 > sizeof(path)) {
  b0:	00001517          	auipc	a0,0x1
  b4:	a3850513          	addi	a0,a0,-1480 # ae8 <path>
  b8:	00000097          	auipc	ra,0x0
  bc:	1c4080e7          	jalr	452(ra) # 27c <strlen>
  c0:	1015051b          	addiw	a0,a0,257
  c4:	20000793          	li	a5,512
  c8:	0aa7e863          	bltu	a5,a0,178 <find+0x178>
    char *p = path + strlen(path) - 1;
  cc:	00001917          	auipc	s2,0x1
  d0:	a1c90913          	addi	s2,s2,-1508 # ae8 <path>
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
  fc:	9f090913          	addi	s2,s2,-1552 # ae8 <path>
 100:	992a                	add	s2,s2,a0
    p++;
 102:	0905                	addi	s2,s2,1
    while (readdir(fd, &st)) {
 104:	f7840993          	addi	s3,s0,-136
        if (strcmp(p, ".") == 0 || strcmp(p, "..") == 0) {
 108:	00001a97          	auipc	s5,0x1
 10c:	930a8a93          	addi	s5,s5,-1744 # a38 <malloc+0x134>
 110:	00001b17          	auipc	s6,0x1
 114:	930b0b13          	addi	s6,s6,-1744 # a40 <malloc+0x13c>
            fprintf(1, "%s\n", path);
 118:	00001c17          	auipc	s8,0x1
 11c:	9d0c0c13          	addi	s8,s8,-1584 # ae8 <path>
 120:	00001b97          	auipc	s7,0x1
 124:	928b8b93          	addi	s7,s7,-1752 # a48 <malloc+0x144>
    while (readdir(fd, &st)) {
 128:	85ce                	mv	a1,s3
 12a:	8526                	mv	a0,s1
 12c:	00000097          	auipc	ra,0x0
 130:	42a080e7          	jalr	1066(ra) # 556 <readdir>
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
 17c:	8a858593          	addi	a1,a1,-1880 # a20 <malloc+0x11c>
 180:	4509                	li	a0,2
 182:	00000097          	auipc	ra,0x0
 186:	69c080e7          	jalr	1692(ra) # 81e <fprintf>
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
 1a0:	682080e7          	jalr	1666(ra) # 81e <fprintf>
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
 1c6:	88e58593          	addi	a1,a1,-1906 # a50 <malloc+0x14c>
 1ca:	4509                	li	a0,2
 1cc:	00000097          	auipc	ra,0x0
 1d0:	652080e7          	jalr	1618(ra) # 81e <fprintf>
        exit(0);
 1d4:	4501                	li	a0,0
 1d6:	00000097          	auipc	ra,0x0
 1da:	2e8080e7          	jalr	744(ra) # 4be <exit>
 1de:	84ae                	mv	s1,a1
    } else {
        strcpy(path, argv[1]);
 1e0:	658c                	ld	a1,8(a1)
 1e2:	00001517          	auipc	a0,0x1
 1e6:	90650513          	addi	a0,a0,-1786 # ae8 <path>
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
 206:	1141                	addi	sp,sp,-16
 208:	e422                	sd	s0,8(sp)
 20a:	0800                	addi	s0,sp,16
 20c:	87aa                	mv	a5,a0
 20e:	0585                	addi	a1,a1,1
 210:	0785                	addi	a5,a5,1
 212:	fff5c703          	lbu	a4,-1(a1)
 216:	fee78fa3          	sb	a4,-1(a5)
 21a:	fb75                	bnez	a4,20e <strcpy+0x8>
 21c:	6422                	ld	s0,8(sp)
 21e:	0141                	addi	sp,sp,16
 220:	8082                	ret

0000000000000222 <strcat>:
 222:	1141                	addi	sp,sp,-16
 224:	e422                	sd	s0,8(sp)
 226:	0800                	addi	s0,sp,16
 228:	00054783          	lbu	a5,0(a0)
 22c:	c385                	beqz	a5,24c <strcat+0x2a>
 22e:	87aa                	mv	a5,a0
 230:	0785                	addi	a5,a5,1
 232:	0007c703          	lbu	a4,0(a5)
 236:	ff6d                	bnez	a4,230 <strcat+0xe>
 238:	0585                	addi	a1,a1,1
 23a:	0785                	addi	a5,a5,1
 23c:	fff5c703          	lbu	a4,-1(a1)
 240:	fee78fa3          	sb	a4,-1(a5)
 244:	fb75                	bnez	a4,238 <strcat+0x16>
 246:	6422                	ld	s0,8(sp)
 248:	0141                	addi	sp,sp,16
 24a:	8082                	ret
 24c:	87aa                	mv	a5,a0
 24e:	b7ed                	j	238 <strcat+0x16>

0000000000000250 <strcmp>:
 250:	1141                	addi	sp,sp,-16
 252:	e422                	sd	s0,8(sp)
 254:	0800                	addi	s0,sp,16
 256:	00054783          	lbu	a5,0(a0)
 25a:	cb91                	beqz	a5,26e <strcmp+0x1e>
 25c:	0005c703          	lbu	a4,0(a1)
 260:	00f71763          	bne	a4,a5,26e <strcmp+0x1e>
 264:	0505                	addi	a0,a0,1
 266:	0585                	addi	a1,a1,1
 268:	00054783          	lbu	a5,0(a0)
 26c:	fbe5                	bnez	a5,25c <strcmp+0xc>
 26e:	0005c503          	lbu	a0,0(a1)
 272:	40a7853b          	subw	a0,a5,a0
 276:	6422                	ld	s0,8(sp)
 278:	0141                	addi	sp,sp,16
 27a:	8082                	ret

000000000000027c <strlen>:
 27c:	1141                	addi	sp,sp,-16
 27e:	e422                	sd	s0,8(sp)
 280:	0800                	addi	s0,sp,16
 282:	00054783          	lbu	a5,0(a0)
 286:	cf91                	beqz	a5,2a2 <strlen+0x26>
 288:	0505                	addi	a0,a0,1
 28a:	87aa                	mv	a5,a0
 28c:	86be                	mv	a3,a5
 28e:	0785                	addi	a5,a5,1
 290:	fff7c703          	lbu	a4,-1(a5)
 294:	ff65                	bnez	a4,28c <strlen+0x10>
 296:	40a6853b          	subw	a0,a3,a0
 29a:	2505                	addiw	a0,a0,1
 29c:	6422                	ld	s0,8(sp)
 29e:	0141                	addi	sp,sp,16
 2a0:	8082                	ret
 2a2:	4501                	li	a0,0
 2a4:	bfe5                	j	29c <strlen+0x20>

00000000000002a6 <memset>:
 2a6:	1141                	addi	sp,sp,-16
 2a8:	e422                	sd	s0,8(sp)
 2aa:	0800                	addi	s0,sp,16
 2ac:	ca19                	beqz	a2,2c2 <memset+0x1c>
 2ae:	87aa                	mv	a5,a0
 2b0:	1602                	slli	a2,a2,0x20
 2b2:	9201                	srli	a2,a2,0x20
 2b4:	00a60733          	add	a4,a2,a0
 2b8:	00b78023          	sb	a1,0(a5)
 2bc:	0785                	addi	a5,a5,1
 2be:	fee79de3          	bne	a5,a4,2b8 <memset+0x12>
 2c2:	6422                	ld	s0,8(sp)
 2c4:	0141                	addi	sp,sp,16
 2c6:	8082                	ret

00000000000002c8 <strchr>:
 2c8:	1141                	addi	sp,sp,-16
 2ca:	e422                	sd	s0,8(sp)
 2cc:	0800                	addi	s0,sp,16
 2ce:	00054783          	lbu	a5,0(a0)
 2d2:	cb99                	beqz	a5,2e8 <strchr+0x20>
 2d4:	00f58763          	beq	a1,a5,2e2 <strchr+0x1a>
 2d8:	0505                	addi	a0,a0,1
 2da:	00054783          	lbu	a5,0(a0)
 2de:	fbfd                	bnez	a5,2d4 <strchr+0xc>
 2e0:	4501                	li	a0,0
 2e2:	6422                	ld	s0,8(sp)
 2e4:	0141                	addi	sp,sp,16
 2e6:	8082                	ret
 2e8:	4501                	li	a0,0
 2ea:	bfe5                	j	2e2 <strchr+0x1a>

00000000000002ec <gets>:
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
 308:	892a                	mv	s2,a0
 30a:	4481                	li	s1,0
 30c:	faf40a93          	addi	s5,s0,-81
 310:	4b29                	li	s6,10
 312:	4c35                	li	s8,13
 314:	89a6                	mv	s3,s1
 316:	2485                	addiw	s1,s1,1
 318:	0344d763          	bge	s1,s4,346 <gets+0x5a>
 31c:	4605                	li	a2,1
 31e:	85d6                	mv	a1,s5
 320:	4501                	li	a0,0
 322:	00000097          	auipc	ra,0x0
 326:	1b4080e7          	jalr	436(ra) # 4d6 <read>
 32a:	00a05e63          	blez	a0,346 <gets+0x5a>
 32e:	faf44783          	lbu	a5,-81(s0)
 332:	00f90023          	sb	a5,0(s2)
 336:	01678763          	beq	a5,s6,344 <gets+0x58>
 33a:	0905                	addi	s2,s2,1
 33c:	fd879ce3          	bne	a5,s8,314 <gets+0x28>
 340:	89a6                	mv	s3,s1
 342:	a011                	j	346 <gets+0x5a>
 344:	89a6                	mv	s3,s1
 346:	99de                	add	s3,s3,s7
 348:	00098023          	sb	zero,0(s3)
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
 366:	1101                	addi	sp,sp,-32
 368:	ec06                	sd	ra,24(sp)
 36a:	e822                	sd	s0,16(sp)
 36c:	e426                	sd	s1,8(sp)
 36e:	e04a                	sd	s2,0(sp)
 370:	1000                	addi	s0,sp,32
 372:	892e                	mv	s2,a1
 374:	4581                	li	a1,0
 376:	00000097          	auipc	ra,0x0
 37a:	188080e7          	jalr	392(ra) # 4fe <open>
 37e:	02054563          	bltz	a0,3a8 <stat+0x42>
 382:	84aa                	mv	s1,a0
 384:	85ca                	mv	a1,s2
 386:	00000097          	auipc	ra,0x0
 38a:	180080e7          	jalr	384(ra) # 506 <fstat>
 38e:	892a                	mv	s2,a0
 390:	8526                	mv	a0,s1
 392:	00000097          	auipc	ra,0x0
 396:	154080e7          	jalr	340(ra) # 4e6 <close>
 39a:	854a                	mv	a0,s2
 39c:	60e2                	ld	ra,24(sp)
 39e:	6442                	ld	s0,16(sp)
 3a0:	64a2                	ld	s1,8(sp)
 3a2:	6902                	ld	s2,0(sp)
 3a4:	6105                	addi	sp,sp,32
 3a6:	8082                	ret
 3a8:	597d                	li	s2,-1
 3aa:	bfc5                	j	39a <stat+0x34>

00000000000003ac <atoi>:
 3ac:	1141                	addi	sp,sp,-16
 3ae:	e422                	sd	s0,8(sp)
 3b0:	0800                	addi	s0,sp,16
 3b2:	00054703          	lbu	a4,0(a0)
 3b6:	02d00793          	li	a5,45
 3ba:	4585                	li	a1,1
 3bc:	04f70363          	beq	a4,a5,402 <atoi+0x56>
 3c0:	00054703          	lbu	a4,0(a0)
 3c4:	fd07079b          	addiw	a5,a4,-48
 3c8:	0ff7f793          	zext.b	a5,a5
 3cc:	46a5                	li	a3,9
 3ce:	02f6ed63          	bltu	a3,a5,408 <atoi+0x5c>
 3d2:	4681                	li	a3,0
 3d4:	4625                	li	a2,9
 3d6:	0505                	addi	a0,a0,1
 3d8:	0026979b          	slliw	a5,a3,0x2
 3dc:	9fb5                	addw	a5,a5,a3
 3de:	0017979b          	slliw	a5,a5,0x1
 3e2:	9fb9                	addw	a5,a5,a4
 3e4:	fd07869b          	addiw	a3,a5,-48
 3e8:	00054703          	lbu	a4,0(a0)
 3ec:	fd07079b          	addiw	a5,a4,-48
 3f0:	0ff7f793          	zext.b	a5,a5
 3f4:	fef671e3          	bgeu	a2,a5,3d6 <atoi+0x2a>
 3f8:	02d5853b          	mulw	a0,a1,a3
 3fc:	6422                	ld	s0,8(sp)
 3fe:	0141                	addi	sp,sp,16
 400:	8082                	ret
 402:	0505                	addi	a0,a0,1
 404:	55fd                	li	a1,-1
 406:	bf6d                	j	3c0 <atoi+0x14>
 408:	4681                	li	a3,0
 40a:	b7fd                	j	3f8 <atoi+0x4c>

000000000000040c <memmove>:
 40c:	1141                	addi	sp,sp,-16
 40e:	e422                	sd	s0,8(sp)
 410:	0800                	addi	s0,sp,16
 412:	02b57463          	bgeu	a0,a1,43a <memmove+0x2e>
 416:	00c05f63          	blez	a2,434 <memmove+0x28>
 41a:	1602                	slli	a2,a2,0x20
 41c:	9201                	srli	a2,a2,0x20
 41e:	00c507b3          	add	a5,a0,a2
 422:	872a                	mv	a4,a0
 424:	0585                	addi	a1,a1,1
 426:	0705                	addi	a4,a4,1
 428:	fff5c683          	lbu	a3,-1(a1)
 42c:	fed70fa3          	sb	a3,-1(a4)
 430:	fee79ae3          	bne	a5,a4,424 <memmove+0x18>
 434:	6422                	ld	s0,8(sp)
 436:	0141                	addi	sp,sp,16
 438:	8082                	ret
 43a:	00c50733          	add	a4,a0,a2
 43e:	95b2                	add	a1,a1,a2
 440:	fec05ae3          	blez	a2,434 <memmove+0x28>
 444:	fff6079b          	addiw	a5,a2,-1
 448:	1782                	slli	a5,a5,0x20
 44a:	9381                	srli	a5,a5,0x20
 44c:	fff7c793          	not	a5,a5
 450:	97ba                	add	a5,a5,a4
 452:	15fd                	addi	a1,a1,-1
 454:	177d                	addi	a4,a4,-1
 456:	0005c683          	lbu	a3,0(a1)
 45a:	00d70023          	sb	a3,0(a4)
 45e:	fee79ae3          	bne	a5,a4,452 <memmove+0x46>
 462:	bfc9                	j	434 <memmove+0x28>

0000000000000464 <memcmp>:
 464:	1141                	addi	sp,sp,-16
 466:	e422                	sd	s0,8(sp)
 468:	0800                	addi	s0,sp,16
 46a:	ca05                	beqz	a2,49a <memcmp+0x36>
 46c:	fff6069b          	addiw	a3,a2,-1
 470:	1682                	slli	a3,a3,0x20
 472:	9281                	srli	a3,a3,0x20
 474:	0685                	addi	a3,a3,1
 476:	96aa                	add	a3,a3,a0
 478:	00054783          	lbu	a5,0(a0)
 47c:	0005c703          	lbu	a4,0(a1)
 480:	00e79863          	bne	a5,a4,490 <memcmp+0x2c>
 484:	0505                	addi	a0,a0,1
 486:	0585                	addi	a1,a1,1
 488:	fed518e3          	bne	a0,a3,478 <memcmp+0x14>
 48c:	4501                	li	a0,0
 48e:	a019                	j	494 <memcmp+0x30>
 490:	40e7853b          	subw	a0,a5,a4
 494:	6422                	ld	s0,8(sp)
 496:	0141                	addi	sp,sp,16
 498:	8082                	ret
 49a:	4501                	li	a0,0
 49c:	bfe5                	j	494 <memcmp+0x30>

000000000000049e <memcpy>:
 49e:	1141                	addi	sp,sp,-16
 4a0:	e406                	sd	ra,8(sp)
 4a2:	e022                	sd	s0,0(sp)
 4a4:	0800                	addi	s0,sp,16
 4a6:	00000097          	auipc	ra,0x0
 4aa:	f66080e7          	jalr	-154(ra) # 40c <memmove>
 4ae:	60a2                	ld	ra,8(sp)
 4b0:	6402                	ld	s0,0(sp)
 4b2:	0141                	addi	sp,sp,16
 4b4:	8082                	ret

00000000000004b6 <fork>:
 4b6:	4885                	li	a7,1
 4b8:	00000073          	ecall
 4bc:	8082                	ret

00000000000004be <exit>:
 4be:	4889                	li	a7,2
 4c0:	00000073          	ecall
 4c4:	8082                	ret

00000000000004c6 <wait>:
 4c6:	488d                	li	a7,3
 4c8:	00000073          	ecall
 4cc:	8082                	ret

00000000000004ce <pipe>:
 4ce:	4891                	li	a7,4
 4d0:	00000073          	ecall
 4d4:	8082                	ret

00000000000004d6 <read>:
 4d6:	4895                	li	a7,5
 4d8:	00000073          	ecall
 4dc:	8082                	ret

00000000000004de <write>:
 4de:	48c1                	li	a7,16
 4e0:	00000073          	ecall
 4e4:	8082                	ret

00000000000004e6 <close>:
 4e6:	48d5                	li	a7,21
 4e8:	00000073          	ecall
 4ec:	8082                	ret

00000000000004ee <kill>:
 4ee:	4899                	li	a7,6
 4f0:	00000073          	ecall
 4f4:	8082                	ret

00000000000004f6 <exec>:
 4f6:	489d                	li	a7,7
 4f8:	00000073          	ecall
 4fc:	8082                	ret

00000000000004fe <open>:
 4fe:	48bd                	li	a7,15
 500:	00000073          	ecall
 504:	8082                	ret

0000000000000506 <fstat>:
 506:	48a1                	li	a7,8
 508:	00000073          	ecall
 50c:	8082                	ret

000000000000050e <mkdir>:
 50e:	48d1                	li	a7,20
 510:	00000073          	ecall
 514:	8082                	ret

0000000000000516 <chdir>:
 516:	48a5                	li	a7,9
 518:	00000073          	ecall
 51c:	8082                	ret

000000000000051e <dup>:
 51e:	48a9                	li	a7,10
 520:	00000073          	ecall
 524:	8082                	ret

0000000000000526 <getpid>:
 526:	48ad                	li	a7,11
 528:	00000073          	ecall
 52c:	8082                	ret

000000000000052e <sbrk>:
 52e:	48b1                	li	a7,12
 530:	00000073          	ecall
 534:	8082                	ret

0000000000000536 <sleep>:
 536:	48b5                	li	a7,13
 538:	00000073          	ecall
 53c:	8082                	ret

000000000000053e <uptime>:
 53e:	48b9                	li	a7,14
 540:	00000073          	ecall
 544:	8082                	ret

0000000000000546 <test_proc>:
 546:	48d9                	li	a7,22
 548:	00000073          	ecall
 54c:	8082                	ret

000000000000054e <dev>:
 54e:	48dd                	li	a7,23
 550:	00000073          	ecall
 554:	8082                	ret

0000000000000556 <readdir>:
 556:	48e1                	li	a7,24
 558:	00000073          	ecall
 55c:	8082                	ret

000000000000055e <getcwd>:
 55e:	48e5                	li	a7,25
 560:	00000073          	ecall
 564:	8082                	ret

0000000000000566 <remove>:
 566:	48c5                	li	a7,17
 568:	00000073          	ecall
 56c:	8082                	ret

000000000000056e <trace>:
 56e:	48c9                	li	a7,18
 570:	00000073          	ecall
 574:	8082                	ret

0000000000000576 <sysinfo>:
 576:	48cd                	li	a7,19
 578:	00000073          	ecall
 57c:	8082                	ret

000000000000057e <rename>:
 57e:	48e9                	li	a7,26
 580:	00000073          	ecall
 584:	8082                	ret

0000000000000586 <putc>:
 586:	1101                	addi	sp,sp,-32
 588:	ec06                	sd	ra,24(sp)
 58a:	e822                	sd	s0,16(sp)
 58c:	1000                	addi	s0,sp,32
 58e:	feb407a3          	sb	a1,-17(s0)
 592:	4605                	li	a2,1
 594:	fef40593          	addi	a1,s0,-17
 598:	00000097          	auipc	ra,0x0
 59c:	f46080e7          	jalr	-186(ra) # 4de <write>
 5a0:	60e2                	ld	ra,24(sp)
 5a2:	6442                	ld	s0,16(sp)
 5a4:	6105                	addi	sp,sp,32
 5a6:	8082                	ret

00000000000005a8 <printint>:
 5a8:	7139                	addi	sp,sp,-64
 5aa:	fc06                	sd	ra,56(sp)
 5ac:	f822                	sd	s0,48(sp)
 5ae:	f426                	sd	s1,40(sp)
 5b0:	f04a                	sd	s2,32(sp)
 5b2:	ec4e                	sd	s3,24(sp)
 5b4:	0080                	addi	s0,sp,64
 5b6:	84aa                	mv	s1,a0
 5b8:	c299                	beqz	a3,5be <printint+0x16>
 5ba:	0805c863          	bltz	a1,64a <printint+0xa2>
 5be:	2581                	sext.w	a1,a1
 5c0:	4881                	li	a7,0
 5c2:	fc040993          	addi	s3,s0,-64
 5c6:	86ce                	mv	a3,s3
 5c8:	4701                	li	a4,0
 5ca:	2601                	sext.w	a2,a2
 5cc:	00000517          	auipc	a0,0x0
 5d0:	50450513          	addi	a0,a0,1284 # ad0 <digits>
 5d4:	883a                	mv	a6,a4
 5d6:	2705                	addiw	a4,a4,1
 5d8:	02c5f7bb          	remuw	a5,a1,a2
 5dc:	1782                	slli	a5,a5,0x20
 5de:	9381                	srli	a5,a5,0x20
 5e0:	97aa                	add	a5,a5,a0
 5e2:	0007c783          	lbu	a5,0(a5)
 5e6:	00f68023          	sb	a5,0(a3)
 5ea:	0005879b          	sext.w	a5,a1
 5ee:	02c5d5bb          	divuw	a1,a1,a2
 5f2:	0685                	addi	a3,a3,1
 5f4:	fec7f0e3          	bgeu	a5,a2,5d4 <printint+0x2c>
 5f8:	00088c63          	beqz	a7,610 <printint+0x68>
 5fc:	fd070793          	addi	a5,a4,-48
 600:	00878733          	add	a4,a5,s0
 604:	02d00793          	li	a5,45
 608:	fef70823          	sb	a5,-16(a4)
 60c:	0028071b          	addiw	a4,a6,2
 610:	02e05663          	blez	a4,63c <printint+0x94>
 614:	fc040913          	addi	s2,s0,-64
 618:	993a                	add	s2,s2,a4
 61a:	19fd                	addi	s3,s3,-1
 61c:	99ba                	add	s3,s3,a4
 61e:	377d                	addiw	a4,a4,-1
 620:	1702                	slli	a4,a4,0x20
 622:	9301                	srli	a4,a4,0x20
 624:	40e989b3          	sub	s3,s3,a4
 628:	fff94583          	lbu	a1,-1(s2)
 62c:	8526                	mv	a0,s1
 62e:	00000097          	auipc	ra,0x0
 632:	f58080e7          	jalr	-168(ra) # 586 <putc>
 636:	197d                	addi	s2,s2,-1
 638:	ff3918e3          	bne	s2,s3,628 <printint+0x80>
 63c:	70e2                	ld	ra,56(sp)
 63e:	7442                	ld	s0,48(sp)
 640:	74a2                	ld	s1,40(sp)
 642:	7902                	ld	s2,32(sp)
 644:	69e2                	ld	s3,24(sp)
 646:	6121                	addi	sp,sp,64
 648:	8082                	ret
 64a:	40b005bb          	negw	a1,a1
 64e:	4885                	li	a7,1
 650:	bf8d                	j	5c2 <printint+0x1a>

0000000000000652 <vprintf>:
 652:	715d                	addi	sp,sp,-80
 654:	e486                	sd	ra,72(sp)
 656:	e0a2                	sd	s0,64(sp)
 658:	fc26                	sd	s1,56(sp)
 65a:	f84a                	sd	s2,48(sp)
 65c:	f44e                	sd	s3,40(sp)
 65e:	f052                	sd	s4,32(sp)
 660:	ec56                	sd	s5,24(sp)
 662:	e85a                	sd	s6,16(sp)
 664:	e45e                	sd	s7,8(sp)
 666:	e062                	sd	s8,0(sp)
 668:	0880                	addi	s0,sp,80
 66a:	0005c903          	lbu	s2,0(a1)
 66e:	18090c63          	beqz	s2,806 <vprintf+0x1b4>
 672:	8aaa                	mv	s5,a0
 674:	8bb2                	mv	s7,a2
 676:	00158493          	addi	s1,a1,1
 67a:	4981                	li	s3,0
 67c:	02500a13          	li	s4,37
 680:	4b55                	li	s6,21
 682:	a839                	j	6a0 <vprintf+0x4e>
 684:	85ca                	mv	a1,s2
 686:	8556                	mv	a0,s5
 688:	00000097          	auipc	ra,0x0
 68c:	efe080e7          	jalr	-258(ra) # 586 <putc>
 690:	a019                	j	696 <vprintf+0x44>
 692:	01498d63          	beq	s3,s4,6ac <vprintf+0x5a>
 696:	0485                	addi	s1,s1,1
 698:	fff4c903          	lbu	s2,-1(s1)
 69c:	16090563          	beqz	s2,806 <vprintf+0x1b4>
 6a0:	fe0999e3          	bnez	s3,692 <vprintf+0x40>
 6a4:	ff4910e3          	bne	s2,s4,684 <vprintf+0x32>
 6a8:	89d2                	mv	s3,s4
 6aa:	b7f5                	j	696 <vprintf+0x44>
 6ac:	13490263          	beq	s2,s4,7d0 <vprintf+0x17e>
 6b0:	f9d9079b          	addiw	a5,s2,-99
 6b4:	0ff7f793          	zext.b	a5,a5
 6b8:	12fb6563          	bltu	s6,a5,7e2 <vprintf+0x190>
 6bc:	f9d9079b          	addiw	a5,s2,-99
 6c0:	0ff7f713          	zext.b	a4,a5
 6c4:	10eb6f63          	bltu	s6,a4,7e2 <vprintf+0x190>
 6c8:	00271793          	slli	a5,a4,0x2
 6cc:	00000717          	auipc	a4,0x0
 6d0:	3ac70713          	addi	a4,a4,940 # a78 <malloc+0x174>
 6d4:	97ba                	add	a5,a5,a4
 6d6:	439c                	lw	a5,0(a5)
 6d8:	97ba                	add	a5,a5,a4
 6da:	8782                	jr	a5
 6dc:	008b8913          	addi	s2,s7,8
 6e0:	4685                	li	a3,1
 6e2:	4629                	li	a2,10
 6e4:	000ba583          	lw	a1,0(s7)
 6e8:	8556                	mv	a0,s5
 6ea:	00000097          	auipc	ra,0x0
 6ee:	ebe080e7          	jalr	-322(ra) # 5a8 <printint>
 6f2:	8bca                	mv	s7,s2
 6f4:	4981                	li	s3,0
 6f6:	b745                	j	696 <vprintf+0x44>
 6f8:	008b8913          	addi	s2,s7,8
 6fc:	4681                	li	a3,0
 6fe:	4629                	li	a2,10
 700:	000ba583          	lw	a1,0(s7)
 704:	8556                	mv	a0,s5
 706:	00000097          	auipc	ra,0x0
 70a:	ea2080e7          	jalr	-350(ra) # 5a8 <printint>
 70e:	8bca                	mv	s7,s2
 710:	4981                	li	s3,0
 712:	b751                	j	696 <vprintf+0x44>
 714:	008b8913          	addi	s2,s7,8
 718:	4681                	li	a3,0
 71a:	4641                	li	a2,16
 71c:	000ba583          	lw	a1,0(s7)
 720:	8556                	mv	a0,s5
 722:	00000097          	auipc	ra,0x0
 726:	e86080e7          	jalr	-378(ra) # 5a8 <printint>
 72a:	8bca                	mv	s7,s2
 72c:	4981                	li	s3,0
 72e:	b7a5                	j	696 <vprintf+0x44>
 730:	008b8c13          	addi	s8,s7,8
 734:	000bb983          	ld	s3,0(s7)
 738:	03000593          	li	a1,48
 73c:	8556                	mv	a0,s5
 73e:	00000097          	auipc	ra,0x0
 742:	e48080e7          	jalr	-440(ra) # 586 <putc>
 746:	07800593          	li	a1,120
 74a:	8556                	mv	a0,s5
 74c:	00000097          	auipc	ra,0x0
 750:	e3a080e7          	jalr	-454(ra) # 586 <putc>
 754:	4941                	li	s2,16
 756:	00000b97          	auipc	s7,0x0
 75a:	37ab8b93          	addi	s7,s7,890 # ad0 <digits>
 75e:	03c9d793          	srli	a5,s3,0x3c
 762:	97de                	add	a5,a5,s7
 764:	0007c583          	lbu	a1,0(a5)
 768:	8556                	mv	a0,s5
 76a:	00000097          	auipc	ra,0x0
 76e:	e1c080e7          	jalr	-484(ra) # 586 <putc>
 772:	0992                	slli	s3,s3,0x4
 774:	397d                	addiw	s2,s2,-1
 776:	fe0914e3          	bnez	s2,75e <vprintf+0x10c>
 77a:	8be2                	mv	s7,s8
 77c:	4981                	li	s3,0
 77e:	bf21                	j	696 <vprintf+0x44>
 780:	008b8993          	addi	s3,s7,8
 784:	000bb903          	ld	s2,0(s7)
 788:	02090163          	beqz	s2,7aa <vprintf+0x158>
 78c:	00094583          	lbu	a1,0(s2)
 790:	c9a5                	beqz	a1,800 <vprintf+0x1ae>
 792:	8556                	mv	a0,s5
 794:	00000097          	auipc	ra,0x0
 798:	df2080e7          	jalr	-526(ra) # 586 <putc>
 79c:	0905                	addi	s2,s2,1
 79e:	00094583          	lbu	a1,0(s2)
 7a2:	f9e5                	bnez	a1,792 <vprintf+0x140>
 7a4:	8bce                	mv	s7,s3
 7a6:	4981                	li	s3,0
 7a8:	b5fd                	j	696 <vprintf+0x44>
 7aa:	00000917          	auipc	s2,0x0
 7ae:	2c690913          	addi	s2,s2,710 # a70 <malloc+0x16c>
 7b2:	02800593          	li	a1,40
 7b6:	bff1                	j	792 <vprintf+0x140>
 7b8:	008b8913          	addi	s2,s7,8
 7bc:	000bc583          	lbu	a1,0(s7)
 7c0:	8556                	mv	a0,s5
 7c2:	00000097          	auipc	ra,0x0
 7c6:	dc4080e7          	jalr	-572(ra) # 586 <putc>
 7ca:	8bca                	mv	s7,s2
 7cc:	4981                	li	s3,0
 7ce:	b5e1                	j	696 <vprintf+0x44>
 7d0:	02500593          	li	a1,37
 7d4:	8556                	mv	a0,s5
 7d6:	00000097          	auipc	ra,0x0
 7da:	db0080e7          	jalr	-592(ra) # 586 <putc>
 7de:	4981                	li	s3,0
 7e0:	bd5d                	j	696 <vprintf+0x44>
 7e2:	02500593          	li	a1,37
 7e6:	8556                	mv	a0,s5
 7e8:	00000097          	auipc	ra,0x0
 7ec:	d9e080e7          	jalr	-610(ra) # 586 <putc>
 7f0:	85ca                	mv	a1,s2
 7f2:	8556                	mv	a0,s5
 7f4:	00000097          	auipc	ra,0x0
 7f8:	d92080e7          	jalr	-622(ra) # 586 <putc>
 7fc:	4981                	li	s3,0
 7fe:	bd61                	j	696 <vprintf+0x44>
 800:	8bce                	mv	s7,s3
 802:	4981                	li	s3,0
 804:	bd49                	j	696 <vprintf+0x44>
 806:	60a6                	ld	ra,72(sp)
 808:	6406                	ld	s0,64(sp)
 80a:	74e2                	ld	s1,56(sp)
 80c:	7942                	ld	s2,48(sp)
 80e:	79a2                	ld	s3,40(sp)
 810:	7a02                	ld	s4,32(sp)
 812:	6ae2                	ld	s5,24(sp)
 814:	6b42                	ld	s6,16(sp)
 816:	6ba2                	ld	s7,8(sp)
 818:	6c02                	ld	s8,0(sp)
 81a:	6161                	addi	sp,sp,80
 81c:	8082                	ret

000000000000081e <fprintf>:
 81e:	715d                	addi	sp,sp,-80
 820:	ec06                	sd	ra,24(sp)
 822:	e822                	sd	s0,16(sp)
 824:	1000                	addi	s0,sp,32
 826:	e010                	sd	a2,0(s0)
 828:	e414                	sd	a3,8(s0)
 82a:	e818                	sd	a4,16(s0)
 82c:	ec1c                	sd	a5,24(s0)
 82e:	03043023          	sd	a6,32(s0)
 832:	03143423          	sd	a7,40(s0)
 836:	8622                	mv	a2,s0
 838:	fe843423          	sd	s0,-24(s0)
 83c:	00000097          	auipc	ra,0x0
 840:	e16080e7          	jalr	-490(ra) # 652 <vprintf>
 844:	60e2                	ld	ra,24(sp)
 846:	6442                	ld	s0,16(sp)
 848:	6161                	addi	sp,sp,80
 84a:	8082                	ret

000000000000084c <printf>:
 84c:	711d                	addi	sp,sp,-96
 84e:	ec06                	sd	ra,24(sp)
 850:	e822                	sd	s0,16(sp)
 852:	1000                	addi	s0,sp,32
 854:	e40c                	sd	a1,8(s0)
 856:	e810                	sd	a2,16(s0)
 858:	ec14                	sd	a3,24(s0)
 85a:	f018                	sd	a4,32(s0)
 85c:	f41c                	sd	a5,40(s0)
 85e:	03043823          	sd	a6,48(s0)
 862:	03143c23          	sd	a7,56(s0)
 866:	00840613          	addi	a2,s0,8
 86a:	fec43423          	sd	a2,-24(s0)
 86e:	85aa                	mv	a1,a0
 870:	4505                	li	a0,1
 872:	00000097          	auipc	ra,0x0
 876:	de0080e7          	jalr	-544(ra) # 652 <vprintf>
 87a:	60e2                	ld	ra,24(sp)
 87c:	6442                	ld	s0,16(sp)
 87e:	6125                	addi	sp,sp,96
 880:	8082                	ret

0000000000000882 <free>:
 882:	1141                	addi	sp,sp,-16
 884:	e422                	sd	s0,8(sp)
 886:	0800                	addi	s0,sp,16
 888:	ff050693          	addi	a3,a0,-16
 88c:	00000797          	auipc	a5,0x0
 890:	45c7b783          	ld	a5,1116(a5) # ce8 <freep>
 894:	a02d                	j	8be <free+0x3c>
 896:	4618                	lw	a4,8(a2)
 898:	9f2d                	addw	a4,a4,a1
 89a:	fee52c23          	sw	a4,-8(a0)
 89e:	6398                	ld	a4,0(a5)
 8a0:	6310                	ld	a2,0(a4)
 8a2:	a83d                	j	8e0 <free+0x5e>
 8a4:	ff852703          	lw	a4,-8(a0)
 8a8:	9f31                	addw	a4,a4,a2
 8aa:	c798                	sw	a4,8(a5)
 8ac:	ff053683          	ld	a3,-16(a0)
 8b0:	a091                	j	8f4 <free+0x72>
 8b2:	6398                	ld	a4,0(a5)
 8b4:	00e7e463          	bltu	a5,a4,8bc <free+0x3a>
 8b8:	00e6ea63          	bltu	a3,a4,8cc <free+0x4a>
 8bc:	87ba                	mv	a5,a4
 8be:	fed7fae3          	bgeu	a5,a3,8b2 <free+0x30>
 8c2:	6398                	ld	a4,0(a5)
 8c4:	00e6e463          	bltu	a3,a4,8cc <free+0x4a>
 8c8:	fee7eae3          	bltu	a5,a4,8bc <free+0x3a>
 8cc:	ff852583          	lw	a1,-8(a0)
 8d0:	6390                	ld	a2,0(a5)
 8d2:	02059813          	slli	a6,a1,0x20
 8d6:	01c85713          	srli	a4,a6,0x1c
 8da:	9736                	add	a4,a4,a3
 8dc:	fae60de3          	beq	a2,a4,896 <free+0x14>
 8e0:	fec53823          	sd	a2,-16(a0)
 8e4:	4790                	lw	a2,8(a5)
 8e6:	02061593          	slli	a1,a2,0x20
 8ea:	01c5d713          	srli	a4,a1,0x1c
 8ee:	973e                	add	a4,a4,a5
 8f0:	fae68ae3          	beq	a3,a4,8a4 <free+0x22>
 8f4:	e394                	sd	a3,0(a5)
 8f6:	00000717          	auipc	a4,0x0
 8fa:	3ef73923          	sd	a5,1010(a4) # ce8 <freep>
 8fe:	6422                	ld	s0,8(sp)
 900:	0141                	addi	sp,sp,16
 902:	8082                	ret

0000000000000904 <malloc>:
 904:	7139                	addi	sp,sp,-64
 906:	fc06                	sd	ra,56(sp)
 908:	f822                	sd	s0,48(sp)
 90a:	f426                	sd	s1,40(sp)
 90c:	f04a                	sd	s2,32(sp)
 90e:	ec4e                	sd	s3,24(sp)
 910:	e852                	sd	s4,16(sp)
 912:	e456                	sd	s5,8(sp)
 914:	e05a                	sd	s6,0(sp)
 916:	0080                	addi	s0,sp,64
 918:	02051493          	slli	s1,a0,0x20
 91c:	9081                	srli	s1,s1,0x20
 91e:	04bd                	addi	s1,s1,15
 920:	8091                	srli	s1,s1,0x4
 922:	0014899b          	addiw	s3,s1,1
 926:	0485                	addi	s1,s1,1
 928:	00000517          	auipc	a0,0x0
 92c:	3c053503          	ld	a0,960(a0) # ce8 <freep>
 930:	c515                	beqz	a0,95c <malloc+0x58>
 932:	611c                	ld	a5,0(a0)
 934:	4798                	lw	a4,8(a5)
 936:	04977063          	bgeu	a4,s1,976 <malloc+0x72>
 93a:	8a4e                	mv	s4,s3
 93c:	0009871b          	sext.w	a4,s3
 940:	6685                	lui	a3,0x1
 942:	00d77363          	bgeu	a4,a3,948 <malloc+0x44>
 946:	6a05                	lui	s4,0x1
 948:	000a0b1b          	sext.w	s6,s4
 94c:	004a1a1b          	slliw	s4,s4,0x4
 950:	00000917          	auipc	s2,0x0
 954:	39890913          	addi	s2,s2,920 # ce8 <freep>
 958:	5afd                	li	s5,-1
 95a:	a89d                	j	9d0 <malloc+0xcc>
 95c:	00000717          	auipc	a4,0x0
 960:	38c70713          	addi	a4,a4,908 # ce8 <freep>
 964:	00000797          	auipc	a5,0x0
 968:	38c78793          	addi	a5,a5,908 # cf0 <base>
 96c:	e31c                	sd	a5,0(a4)
 96e:	e71c                	sd	a5,8(a4)
 970:	00072823          	sw	zero,16(a4)
 974:	b7d9                	j	93a <malloc+0x36>
 976:	02e48c63          	beq	s1,a4,9ae <malloc+0xaa>
 97a:	4137073b          	subw	a4,a4,s3
 97e:	c798                	sw	a4,8(a5)
 980:	02071693          	slli	a3,a4,0x20
 984:	01c6d713          	srli	a4,a3,0x1c
 988:	97ba                	add	a5,a5,a4
 98a:	0137a423          	sw	s3,8(a5)
 98e:	00000717          	auipc	a4,0x0
 992:	34a73d23          	sd	a0,858(a4) # ce8 <freep>
 996:	01078513          	addi	a0,a5,16
 99a:	70e2                	ld	ra,56(sp)
 99c:	7442                	ld	s0,48(sp)
 99e:	74a2                	ld	s1,40(sp)
 9a0:	7902                	ld	s2,32(sp)
 9a2:	69e2                	ld	s3,24(sp)
 9a4:	6a42                	ld	s4,16(sp)
 9a6:	6aa2                	ld	s5,8(sp)
 9a8:	6b02                	ld	s6,0(sp)
 9aa:	6121                	addi	sp,sp,64
 9ac:	8082                	ret
 9ae:	6398                	ld	a4,0(a5)
 9b0:	e118                	sd	a4,0(a0)
 9b2:	bff1                	j	98e <malloc+0x8a>
 9b4:	01652423          	sw	s6,8(a0)
 9b8:	0541                	addi	a0,a0,16
 9ba:	00000097          	auipc	ra,0x0
 9be:	ec8080e7          	jalr	-312(ra) # 882 <free>
 9c2:	00093503          	ld	a0,0(s2)
 9c6:	d971                	beqz	a0,99a <malloc+0x96>
 9c8:	611c                	ld	a5,0(a0)
 9ca:	4798                	lw	a4,8(a5)
 9cc:	fa9775e3          	bgeu	a4,s1,976 <malloc+0x72>
 9d0:	00093703          	ld	a4,0(s2)
 9d4:	853e                	mv	a0,a5
 9d6:	fef719e3          	bne	a4,a5,9c8 <malloc+0xc4>
 9da:	8552                	mv	a0,s4
 9dc:	00000097          	auipc	ra,0x0
 9e0:	b52080e7          	jalr	-1198(ra) # 52e <sbrk>
 9e4:	fd5518e3          	bne	a0,s5,9b4 <malloc+0xb0>
 9e8:	4501                	li	a0,0
 9ea:	bf45                	j	99a <malloc+0x96>
