
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
  20:	97458593          	addi	a1,a1,-1676 # 990 <malloc+0xe8>
  24:	4509                	li	a0,2
  26:	00000097          	auipc	ra,0x0
  2a:	79c080e7          	jalr	1948(ra) # 7c2 <fprintf>
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
  92:	95a58593          	addi	a1,a1,-1702 # 9e8 <malloc+0x140>
  96:	4509                	li	a0,2
  98:	00000097          	auipc	ra,0x0
  9c:	72a080e7          	jalr	1834(ra) # 7c2 <fprintf>
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
 13c:	87858593          	addi	a1,a1,-1928 # 9b0 <malloc+0x108>
 140:	4509                	li	a0,2
 142:	00000097          	auipc	ra,0x0
 146:	680080e7          	jalr	1664(ra) # 7c2 <fprintf>
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
 164:	8a050513          	addi	a0,a0,-1888 # a00 <malloc+0x158>
 168:	00000097          	auipc	ra,0x0
 16c:	688080e7          	jalr	1672(ra) # 7f0 <printf>
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
 192:	88a58593          	addi	a1,a1,-1910 # a18 <malloc+0x170>
 196:	4509                	li	a0,2
 198:	00000097          	auipc	ra,0x0
 19c:	62a080e7          	jalr	1578(ra) # 7c2 <fprintf>
        exit(-1);
 1a0:	557d                	li	a0,-1
 1a2:	00000097          	auipc	ra,0x0
 1a6:	2c0080e7          	jalr	704(ra) # 462 <exit>

00000000000001aa <strcpy>:
 1aa:	1141                	addi	sp,sp,-16
 1ac:	e422                	sd	s0,8(sp)
 1ae:	0800                	addi	s0,sp,16
 1b0:	87aa                	mv	a5,a0
 1b2:	0585                	addi	a1,a1,1
 1b4:	0785                	addi	a5,a5,1
 1b6:	fff5c703          	lbu	a4,-1(a1)
 1ba:	fee78fa3          	sb	a4,-1(a5)
 1be:	fb75                	bnez	a4,1b2 <strcpy+0x8>
 1c0:	6422                	ld	s0,8(sp)
 1c2:	0141                	addi	sp,sp,16
 1c4:	8082                	ret

00000000000001c6 <strcat>:
 1c6:	1141                	addi	sp,sp,-16
 1c8:	e422                	sd	s0,8(sp)
 1ca:	0800                	addi	s0,sp,16
 1cc:	00054783          	lbu	a5,0(a0)
 1d0:	c385                	beqz	a5,1f0 <strcat+0x2a>
 1d2:	87aa                	mv	a5,a0
 1d4:	0785                	addi	a5,a5,1
 1d6:	0007c703          	lbu	a4,0(a5)
 1da:	ff6d                	bnez	a4,1d4 <strcat+0xe>
 1dc:	0585                	addi	a1,a1,1
 1de:	0785                	addi	a5,a5,1
 1e0:	fff5c703          	lbu	a4,-1(a1)
 1e4:	fee78fa3          	sb	a4,-1(a5)
 1e8:	fb75                	bnez	a4,1dc <strcat+0x16>
 1ea:	6422                	ld	s0,8(sp)
 1ec:	0141                	addi	sp,sp,16
 1ee:	8082                	ret
 1f0:	87aa                	mv	a5,a0
 1f2:	b7ed                	j	1dc <strcat+0x16>

00000000000001f4 <strcmp>:
 1f4:	1141                	addi	sp,sp,-16
 1f6:	e422                	sd	s0,8(sp)
 1f8:	0800                	addi	s0,sp,16
 1fa:	00054783          	lbu	a5,0(a0)
 1fe:	cb91                	beqz	a5,212 <strcmp+0x1e>
 200:	0005c703          	lbu	a4,0(a1)
 204:	00f71763          	bne	a4,a5,212 <strcmp+0x1e>
 208:	0505                	addi	a0,a0,1
 20a:	0585                	addi	a1,a1,1
 20c:	00054783          	lbu	a5,0(a0)
 210:	fbe5                	bnez	a5,200 <strcmp+0xc>
 212:	0005c503          	lbu	a0,0(a1)
 216:	40a7853b          	subw	a0,a5,a0
 21a:	6422                	ld	s0,8(sp)
 21c:	0141                	addi	sp,sp,16
 21e:	8082                	ret

0000000000000220 <strlen>:
 220:	1141                	addi	sp,sp,-16
 222:	e422                	sd	s0,8(sp)
 224:	0800                	addi	s0,sp,16
 226:	00054783          	lbu	a5,0(a0)
 22a:	cf91                	beqz	a5,246 <strlen+0x26>
 22c:	0505                	addi	a0,a0,1
 22e:	87aa                	mv	a5,a0
 230:	86be                	mv	a3,a5
 232:	0785                	addi	a5,a5,1
 234:	fff7c703          	lbu	a4,-1(a5)
 238:	ff65                	bnez	a4,230 <strlen+0x10>
 23a:	40a6853b          	subw	a0,a3,a0
 23e:	2505                	addiw	a0,a0,1
 240:	6422                	ld	s0,8(sp)
 242:	0141                	addi	sp,sp,16
 244:	8082                	ret
 246:	4501                	li	a0,0
 248:	bfe5                	j	240 <strlen+0x20>

000000000000024a <memset>:
 24a:	1141                	addi	sp,sp,-16
 24c:	e422                	sd	s0,8(sp)
 24e:	0800                	addi	s0,sp,16
 250:	ca19                	beqz	a2,266 <memset+0x1c>
 252:	87aa                	mv	a5,a0
 254:	1602                	slli	a2,a2,0x20
 256:	9201                	srli	a2,a2,0x20
 258:	00a60733          	add	a4,a2,a0
 25c:	00b78023          	sb	a1,0(a5)
 260:	0785                	addi	a5,a5,1
 262:	fee79de3          	bne	a5,a4,25c <memset+0x12>
 266:	6422                	ld	s0,8(sp)
 268:	0141                	addi	sp,sp,16
 26a:	8082                	ret

000000000000026c <strchr>:
 26c:	1141                	addi	sp,sp,-16
 26e:	e422                	sd	s0,8(sp)
 270:	0800                	addi	s0,sp,16
 272:	00054783          	lbu	a5,0(a0)
 276:	cb99                	beqz	a5,28c <strchr+0x20>
 278:	00f58763          	beq	a1,a5,286 <strchr+0x1a>
 27c:	0505                	addi	a0,a0,1
 27e:	00054783          	lbu	a5,0(a0)
 282:	fbfd                	bnez	a5,278 <strchr+0xc>
 284:	4501                	li	a0,0
 286:	6422                	ld	s0,8(sp)
 288:	0141                	addi	sp,sp,16
 28a:	8082                	ret
 28c:	4501                	li	a0,0
 28e:	bfe5                	j	286 <strchr+0x1a>

0000000000000290 <gets>:
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
 2ac:	892a                	mv	s2,a0
 2ae:	4481                	li	s1,0
 2b0:	faf40a93          	addi	s5,s0,-81
 2b4:	4b29                	li	s6,10
 2b6:	4c35                	li	s8,13
 2b8:	89a6                	mv	s3,s1
 2ba:	2485                	addiw	s1,s1,1
 2bc:	0344d763          	bge	s1,s4,2ea <gets+0x5a>
 2c0:	4605                	li	a2,1
 2c2:	85d6                	mv	a1,s5
 2c4:	4501                	li	a0,0
 2c6:	00000097          	auipc	ra,0x0
 2ca:	1b4080e7          	jalr	436(ra) # 47a <read>
 2ce:	00a05e63          	blez	a0,2ea <gets+0x5a>
 2d2:	faf44783          	lbu	a5,-81(s0)
 2d6:	00f90023          	sb	a5,0(s2)
 2da:	01678763          	beq	a5,s6,2e8 <gets+0x58>
 2de:	0905                	addi	s2,s2,1
 2e0:	fd879ce3          	bne	a5,s8,2b8 <gets+0x28>
 2e4:	89a6                	mv	s3,s1
 2e6:	a011                	j	2ea <gets+0x5a>
 2e8:	89a6                	mv	s3,s1
 2ea:	99de                	add	s3,s3,s7
 2ec:	00098023          	sb	zero,0(s3)
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
 30a:	1101                	addi	sp,sp,-32
 30c:	ec06                	sd	ra,24(sp)
 30e:	e822                	sd	s0,16(sp)
 310:	e426                	sd	s1,8(sp)
 312:	e04a                	sd	s2,0(sp)
 314:	1000                	addi	s0,sp,32
 316:	892e                	mv	s2,a1
 318:	4581                	li	a1,0
 31a:	00000097          	auipc	ra,0x0
 31e:	188080e7          	jalr	392(ra) # 4a2 <open>
 322:	02054563          	bltz	a0,34c <stat+0x42>
 326:	84aa                	mv	s1,a0
 328:	85ca                	mv	a1,s2
 32a:	00000097          	auipc	ra,0x0
 32e:	180080e7          	jalr	384(ra) # 4aa <fstat>
 332:	892a                	mv	s2,a0
 334:	8526                	mv	a0,s1
 336:	00000097          	auipc	ra,0x0
 33a:	154080e7          	jalr	340(ra) # 48a <close>
 33e:	854a                	mv	a0,s2
 340:	60e2                	ld	ra,24(sp)
 342:	6442                	ld	s0,16(sp)
 344:	64a2                	ld	s1,8(sp)
 346:	6902                	ld	s2,0(sp)
 348:	6105                	addi	sp,sp,32
 34a:	8082                	ret
 34c:	597d                	li	s2,-1
 34e:	bfc5                	j	33e <stat+0x34>

0000000000000350 <atoi>:
 350:	1141                	addi	sp,sp,-16
 352:	e422                	sd	s0,8(sp)
 354:	0800                	addi	s0,sp,16
 356:	00054703          	lbu	a4,0(a0)
 35a:	02d00793          	li	a5,45
 35e:	4585                	li	a1,1
 360:	04f70363          	beq	a4,a5,3a6 <atoi+0x56>
 364:	00054703          	lbu	a4,0(a0)
 368:	fd07079b          	addiw	a5,a4,-48
 36c:	0ff7f793          	zext.b	a5,a5
 370:	46a5                	li	a3,9
 372:	02f6ed63          	bltu	a3,a5,3ac <atoi+0x5c>
 376:	4681                	li	a3,0
 378:	4625                	li	a2,9
 37a:	0505                	addi	a0,a0,1
 37c:	0026979b          	slliw	a5,a3,0x2
 380:	9fb5                	addw	a5,a5,a3
 382:	0017979b          	slliw	a5,a5,0x1
 386:	9fb9                	addw	a5,a5,a4
 388:	fd07869b          	addiw	a3,a5,-48
 38c:	00054703          	lbu	a4,0(a0)
 390:	fd07079b          	addiw	a5,a4,-48
 394:	0ff7f793          	zext.b	a5,a5
 398:	fef671e3          	bgeu	a2,a5,37a <atoi+0x2a>
 39c:	02d5853b          	mulw	a0,a1,a3
 3a0:	6422                	ld	s0,8(sp)
 3a2:	0141                	addi	sp,sp,16
 3a4:	8082                	ret
 3a6:	0505                	addi	a0,a0,1
 3a8:	55fd                	li	a1,-1
 3aa:	bf6d                	j	364 <atoi+0x14>
 3ac:	4681                	li	a3,0
 3ae:	b7fd                	j	39c <atoi+0x4c>

00000000000003b0 <memmove>:
 3b0:	1141                	addi	sp,sp,-16
 3b2:	e422                	sd	s0,8(sp)
 3b4:	0800                	addi	s0,sp,16
 3b6:	02b57463          	bgeu	a0,a1,3de <memmove+0x2e>
 3ba:	00c05f63          	blez	a2,3d8 <memmove+0x28>
 3be:	1602                	slli	a2,a2,0x20
 3c0:	9201                	srli	a2,a2,0x20
 3c2:	00c507b3          	add	a5,a0,a2
 3c6:	872a                	mv	a4,a0
 3c8:	0585                	addi	a1,a1,1
 3ca:	0705                	addi	a4,a4,1
 3cc:	fff5c683          	lbu	a3,-1(a1)
 3d0:	fed70fa3          	sb	a3,-1(a4)
 3d4:	fee79ae3          	bne	a5,a4,3c8 <memmove+0x18>
 3d8:	6422                	ld	s0,8(sp)
 3da:	0141                	addi	sp,sp,16
 3dc:	8082                	ret
 3de:	00c50733          	add	a4,a0,a2
 3e2:	95b2                	add	a1,a1,a2
 3e4:	fec05ae3          	blez	a2,3d8 <memmove+0x28>
 3e8:	fff6079b          	addiw	a5,a2,-1
 3ec:	1782                	slli	a5,a5,0x20
 3ee:	9381                	srli	a5,a5,0x20
 3f0:	fff7c793          	not	a5,a5
 3f4:	97ba                	add	a5,a5,a4
 3f6:	15fd                	addi	a1,a1,-1
 3f8:	177d                	addi	a4,a4,-1
 3fa:	0005c683          	lbu	a3,0(a1)
 3fe:	00d70023          	sb	a3,0(a4)
 402:	fee79ae3          	bne	a5,a4,3f6 <memmove+0x46>
 406:	bfc9                	j	3d8 <memmove+0x28>

0000000000000408 <memcmp>:
 408:	1141                	addi	sp,sp,-16
 40a:	e422                	sd	s0,8(sp)
 40c:	0800                	addi	s0,sp,16
 40e:	ca05                	beqz	a2,43e <memcmp+0x36>
 410:	fff6069b          	addiw	a3,a2,-1
 414:	1682                	slli	a3,a3,0x20
 416:	9281                	srli	a3,a3,0x20
 418:	0685                	addi	a3,a3,1
 41a:	96aa                	add	a3,a3,a0
 41c:	00054783          	lbu	a5,0(a0)
 420:	0005c703          	lbu	a4,0(a1)
 424:	00e79863          	bne	a5,a4,434 <memcmp+0x2c>
 428:	0505                	addi	a0,a0,1
 42a:	0585                	addi	a1,a1,1
 42c:	fed518e3          	bne	a0,a3,41c <memcmp+0x14>
 430:	4501                	li	a0,0
 432:	a019                	j	438 <memcmp+0x30>
 434:	40e7853b          	subw	a0,a5,a4
 438:	6422                	ld	s0,8(sp)
 43a:	0141                	addi	sp,sp,16
 43c:	8082                	ret
 43e:	4501                	li	a0,0
 440:	bfe5                	j	438 <memcmp+0x30>

0000000000000442 <memcpy>:
 442:	1141                	addi	sp,sp,-16
 444:	e406                	sd	ra,8(sp)
 446:	e022                	sd	s0,0(sp)
 448:	0800                	addi	s0,sp,16
 44a:	00000097          	auipc	ra,0x0
 44e:	f66080e7          	jalr	-154(ra) # 3b0 <memmove>
 452:	60a2                	ld	ra,8(sp)
 454:	6402                	ld	s0,0(sp)
 456:	0141                	addi	sp,sp,16
 458:	8082                	ret

000000000000045a <fork>:
 45a:	4885                	li	a7,1
 45c:	00000073          	ecall
 460:	8082                	ret

0000000000000462 <exit>:
 462:	4889                	li	a7,2
 464:	00000073          	ecall
 468:	8082                	ret

000000000000046a <wait>:
 46a:	488d                	li	a7,3
 46c:	00000073          	ecall
 470:	8082                	ret

0000000000000472 <pipe>:
 472:	4891                	li	a7,4
 474:	00000073          	ecall
 478:	8082                	ret

000000000000047a <read>:
 47a:	4895                	li	a7,5
 47c:	00000073          	ecall
 480:	8082                	ret

0000000000000482 <write>:
 482:	48c1                	li	a7,16
 484:	00000073          	ecall
 488:	8082                	ret

000000000000048a <close>:
 48a:	48d5                	li	a7,21
 48c:	00000073          	ecall
 490:	8082                	ret

0000000000000492 <kill>:
 492:	4899                	li	a7,6
 494:	00000073          	ecall
 498:	8082                	ret

000000000000049a <exec>:
 49a:	489d                	li	a7,7
 49c:	00000073          	ecall
 4a0:	8082                	ret

00000000000004a2 <open>:
 4a2:	48bd                	li	a7,15
 4a4:	00000073          	ecall
 4a8:	8082                	ret

00000000000004aa <fstat>:
 4aa:	48a1                	li	a7,8
 4ac:	00000073          	ecall
 4b0:	8082                	ret

00000000000004b2 <mkdir>:
 4b2:	48d1                	li	a7,20
 4b4:	00000073          	ecall
 4b8:	8082                	ret

00000000000004ba <chdir>:
 4ba:	48a5                	li	a7,9
 4bc:	00000073          	ecall
 4c0:	8082                	ret

00000000000004c2 <dup>:
 4c2:	48a9                	li	a7,10
 4c4:	00000073          	ecall
 4c8:	8082                	ret

00000000000004ca <getpid>:
 4ca:	48ad                	li	a7,11
 4cc:	00000073          	ecall
 4d0:	8082                	ret

00000000000004d2 <sbrk>:
 4d2:	48b1                	li	a7,12
 4d4:	00000073          	ecall
 4d8:	8082                	ret

00000000000004da <sleep>:
 4da:	48b5                	li	a7,13
 4dc:	00000073          	ecall
 4e0:	8082                	ret

00000000000004e2 <uptime>:
 4e2:	48b9                	li	a7,14
 4e4:	00000073          	ecall
 4e8:	8082                	ret

00000000000004ea <test_proc>:
 4ea:	48d9                	li	a7,22
 4ec:	00000073          	ecall
 4f0:	8082                	ret

00000000000004f2 <dev>:
 4f2:	48dd                	li	a7,23
 4f4:	00000073          	ecall
 4f8:	8082                	ret

00000000000004fa <readdir>:
 4fa:	48e1                	li	a7,24
 4fc:	00000073          	ecall
 500:	8082                	ret

0000000000000502 <getcwd>:
 502:	48e5                	li	a7,25
 504:	00000073          	ecall
 508:	8082                	ret

000000000000050a <remove>:
 50a:	48c5                	li	a7,17
 50c:	00000073          	ecall
 510:	8082                	ret

0000000000000512 <trace>:
 512:	48c9                	li	a7,18
 514:	00000073          	ecall
 518:	8082                	ret

000000000000051a <sysinfo>:
 51a:	48cd                	li	a7,19
 51c:	00000073          	ecall
 520:	8082                	ret

0000000000000522 <rename>:
 522:	48e9                	li	a7,26
 524:	00000073          	ecall
 528:	8082                	ret

000000000000052a <putc>:
 52a:	1101                	addi	sp,sp,-32
 52c:	ec06                	sd	ra,24(sp)
 52e:	e822                	sd	s0,16(sp)
 530:	1000                	addi	s0,sp,32
 532:	feb407a3          	sb	a1,-17(s0)
 536:	4605                	li	a2,1
 538:	fef40593          	addi	a1,s0,-17
 53c:	00000097          	auipc	ra,0x0
 540:	f46080e7          	jalr	-186(ra) # 482 <write>
 544:	60e2                	ld	ra,24(sp)
 546:	6442                	ld	s0,16(sp)
 548:	6105                	addi	sp,sp,32
 54a:	8082                	ret

000000000000054c <printint>:
 54c:	7139                	addi	sp,sp,-64
 54e:	fc06                	sd	ra,56(sp)
 550:	f822                	sd	s0,48(sp)
 552:	f426                	sd	s1,40(sp)
 554:	f04a                	sd	s2,32(sp)
 556:	ec4e                	sd	s3,24(sp)
 558:	0080                	addi	s0,sp,64
 55a:	84aa                	mv	s1,a0
 55c:	c299                	beqz	a3,562 <printint+0x16>
 55e:	0805c863          	bltz	a1,5ee <printint+0xa2>
 562:	2581                	sext.w	a1,a1
 564:	4881                	li	a7,0
 566:	fc040993          	addi	s3,s0,-64
 56a:	86ce                	mv	a3,s3
 56c:	4701                	li	a4,0
 56e:	2601                	sext.w	a2,a2
 570:	00000517          	auipc	a0,0x0
 574:	52850513          	addi	a0,a0,1320 # a98 <digits>
 578:	883a                	mv	a6,a4
 57a:	2705                	addiw	a4,a4,1
 57c:	02c5f7bb          	remuw	a5,a1,a2
 580:	1782                	slli	a5,a5,0x20
 582:	9381                	srli	a5,a5,0x20
 584:	97aa                	add	a5,a5,a0
 586:	0007c783          	lbu	a5,0(a5)
 58a:	00f68023          	sb	a5,0(a3)
 58e:	0005879b          	sext.w	a5,a1
 592:	02c5d5bb          	divuw	a1,a1,a2
 596:	0685                	addi	a3,a3,1
 598:	fec7f0e3          	bgeu	a5,a2,578 <printint+0x2c>
 59c:	00088c63          	beqz	a7,5b4 <printint+0x68>
 5a0:	fd070793          	addi	a5,a4,-48
 5a4:	00878733          	add	a4,a5,s0
 5a8:	02d00793          	li	a5,45
 5ac:	fef70823          	sb	a5,-16(a4)
 5b0:	0028071b          	addiw	a4,a6,2
 5b4:	02e05663          	blez	a4,5e0 <printint+0x94>
 5b8:	fc040913          	addi	s2,s0,-64
 5bc:	993a                	add	s2,s2,a4
 5be:	19fd                	addi	s3,s3,-1
 5c0:	99ba                	add	s3,s3,a4
 5c2:	377d                	addiw	a4,a4,-1
 5c4:	1702                	slli	a4,a4,0x20
 5c6:	9301                	srli	a4,a4,0x20
 5c8:	40e989b3          	sub	s3,s3,a4
 5cc:	fff94583          	lbu	a1,-1(s2)
 5d0:	8526                	mv	a0,s1
 5d2:	00000097          	auipc	ra,0x0
 5d6:	f58080e7          	jalr	-168(ra) # 52a <putc>
 5da:	197d                	addi	s2,s2,-1
 5dc:	ff3918e3          	bne	s2,s3,5cc <printint+0x80>
 5e0:	70e2                	ld	ra,56(sp)
 5e2:	7442                	ld	s0,48(sp)
 5e4:	74a2                	ld	s1,40(sp)
 5e6:	7902                	ld	s2,32(sp)
 5e8:	69e2                	ld	s3,24(sp)
 5ea:	6121                	addi	sp,sp,64
 5ec:	8082                	ret
 5ee:	40b005bb          	negw	a1,a1
 5f2:	4885                	li	a7,1
 5f4:	bf8d                	j	566 <printint+0x1a>

00000000000005f6 <vprintf>:
 5f6:	715d                	addi	sp,sp,-80
 5f8:	e486                	sd	ra,72(sp)
 5fa:	e0a2                	sd	s0,64(sp)
 5fc:	fc26                	sd	s1,56(sp)
 5fe:	f84a                	sd	s2,48(sp)
 600:	f44e                	sd	s3,40(sp)
 602:	f052                	sd	s4,32(sp)
 604:	ec56                	sd	s5,24(sp)
 606:	e85a                	sd	s6,16(sp)
 608:	e45e                	sd	s7,8(sp)
 60a:	e062                	sd	s8,0(sp)
 60c:	0880                	addi	s0,sp,80
 60e:	0005c903          	lbu	s2,0(a1)
 612:	18090c63          	beqz	s2,7aa <vprintf+0x1b4>
 616:	8aaa                	mv	s5,a0
 618:	8bb2                	mv	s7,a2
 61a:	00158493          	addi	s1,a1,1
 61e:	4981                	li	s3,0
 620:	02500a13          	li	s4,37
 624:	4b55                	li	s6,21
 626:	a839                	j	644 <vprintf+0x4e>
 628:	85ca                	mv	a1,s2
 62a:	8556                	mv	a0,s5
 62c:	00000097          	auipc	ra,0x0
 630:	efe080e7          	jalr	-258(ra) # 52a <putc>
 634:	a019                	j	63a <vprintf+0x44>
 636:	01498d63          	beq	s3,s4,650 <vprintf+0x5a>
 63a:	0485                	addi	s1,s1,1
 63c:	fff4c903          	lbu	s2,-1(s1)
 640:	16090563          	beqz	s2,7aa <vprintf+0x1b4>
 644:	fe0999e3          	bnez	s3,636 <vprintf+0x40>
 648:	ff4910e3          	bne	s2,s4,628 <vprintf+0x32>
 64c:	89d2                	mv	s3,s4
 64e:	b7f5                	j	63a <vprintf+0x44>
 650:	13490263          	beq	s2,s4,774 <vprintf+0x17e>
 654:	f9d9079b          	addiw	a5,s2,-99
 658:	0ff7f793          	zext.b	a5,a5
 65c:	12fb6563          	bltu	s6,a5,786 <vprintf+0x190>
 660:	f9d9079b          	addiw	a5,s2,-99
 664:	0ff7f713          	zext.b	a4,a5
 668:	10eb6f63          	bltu	s6,a4,786 <vprintf+0x190>
 66c:	00271793          	slli	a5,a4,0x2
 670:	00000717          	auipc	a4,0x0
 674:	3d070713          	addi	a4,a4,976 # a40 <malloc+0x198>
 678:	97ba                	add	a5,a5,a4
 67a:	439c                	lw	a5,0(a5)
 67c:	97ba                	add	a5,a5,a4
 67e:	8782                	jr	a5
 680:	008b8913          	addi	s2,s7,8
 684:	4685                	li	a3,1
 686:	4629                	li	a2,10
 688:	000ba583          	lw	a1,0(s7)
 68c:	8556                	mv	a0,s5
 68e:	00000097          	auipc	ra,0x0
 692:	ebe080e7          	jalr	-322(ra) # 54c <printint>
 696:	8bca                	mv	s7,s2
 698:	4981                	li	s3,0
 69a:	b745                	j	63a <vprintf+0x44>
 69c:	008b8913          	addi	s2,s7,8
 6a0:	4681                	li	a3,0
 6a2:	4629                	li	a2,10
 6a4:	000ba583          	lw	a1,0(s7)
 6a8:	8556                	mv	a0,s5
 6aa:	00000097          	auipc	ra,0x0
 6ae:	ea2080e7          	jalr	-350(ra) # 54c <printint>
 6b2:	8bca                	mv	s7,s2
 6b4:	4981                	li	s3,0
 6b6:	b751                	j	63a <vprintf+0x44>
 6b8:	008b8913          	addi	s2,s7,8
 6bc:	4681                	li	a3,0
 6be:	4641                	li	a2,16
 6c0:	000ba583          	lw	a1,0(s7)
 6c4:	8556                	mv	a0,s5
 6c6:	00000097          	auipc	ra,0x0
 6ca:	e86080e7          	jalr	-378(ra) # 54c <printint>
 6ce:	8bca                	mv	s7,s2
 6d0:	4981                	li	s3,0
 6d2:	b7a5                	j	63a <vprintf+0x44>
 6d4:	008b8c13          	addi	s8,s7,8
 6d8:	000bb983          	ld	s3,0(s7)
 6dc:	03000593          	li	a1,48
 6e0:	8556                	mv	a0,s5
 6e2:	00000097          	auipc	ra,0x0
 6e6:	e48080e7          	jalr	-440(ra) # 52a <putc>
 6ea:	07800593          	li	a1,120
 6ee:	8556                	mv	a0,s5
 6f0:	00000097          	auipc	ra,0x0
 6f4:	e3a080e7          	jalr	-454(ra) # 52a <putc>
 6f8:	4941                	li	s2,16
 6fa:	00000b97          	auipc	s7,0x0
 6fe:	39eb8b93          	addi	s7,s7,926 # a98 <digits>
 702:	03c9d793          	srli	a5,s3,0x3c
 706:	97de                	add	a5,a5,s7
 708:	0007c583          	lbu	a1,0(a5)
 70c:	8556                	mv	a0,s5
 70e:	00000097          	auipc	ra,0x0
 712:	e1c080e7          	jalr	-484(ra) # 52a <putc>
 716:	0992                	slli	s3,s3,0x4
 718:	397d                	addiw	s2,s2,-1
 71a:	fe0914e3          	bnez	s2,702 <vprintf+0x10c>
 71e:	8be2                	mv	s7,s8
 720:	4981                	li	s3,0
 722:	bf21                	j	63a <vprintf+0x44>
 724:	008b8993          	addi	s3,s7,8
 728:	000bb903          	ld	s2,0(s7)
 72c:	02090163          	beqz	s2,74e <vprintf+0x158>
 730:	00094583          	lbu	a1,0(s2)
 734:	c9a5                	beqz	a1,7a4 <vprintf+0x1ae>
 736:	8556                	mv	a0,s5
 738:	00000097          	auipc	ra,0x0
 73c:	df2080e7          	jalr	-526(ra) # 52a <putc>
 740:	0905                	addi	s2,s2,1
 742:	00094583          	lbu	a1,0(s2)
 746:	f9e5                	bnez	a1,736 <vprintf+0x140>
 748:	8bce                	mv	s7,s3
 74a:	4981                	li	s3,0
 74c:	b5fd                	j	63a <vprintf+0x44>
 74e:	00000917          	auipc	s2,0x0
 752:	2ea90913          	addi	s2,s2,746 # a38 <malloc+0x190>
 756:	02800593          	li	a1,40
 75a:	bff1                	j	736 <vprintf+0x140>
 75c:	008b8913          	addi	s2,s7,8
 760:	000bc583          	lbu	a1,0(s7)
 764:	8556                	mv	a0,s5
 766:	00000097          	auipc	ra,0x0
 76a:	dc4080e7          	jalr	-572(ra) # 52a <putc>
 76e:	8bca                	mv	s7,s2
 770:	4981                	li	s3,0
 772:	b5e1                	j	63a <vprintf+0x44>
 774:	02500593          	li	a1,37
 778:	8556                	mv	a0,s5
 77a:	00000097          	auipc	ra,0x0
 77e:	db0080e7          	jalr	-592(ra) # 52a <putc>
 782:	4981                	li	s3,0
 784:	bd5d                	j	63a <vprintf+0x44>
 786:	02500593          	li	a1,37
 78a:	8556                	mv	a0,s5
 78c:	00000097          	auipc	ra,0x0
 790:	d9e080e7          	jalr	-610(ra) # 52a <putc>
 794:	85ca                	mv	a1,s2
 796:	8556                	mv	a0,s5
 798:	00000097          	auipc	ra,0x0
 79c:	d92080e7          	jalr	-622(ra) # 52a <putc>
 7a0:	4981                	li	s3,0
 7a2:	bd61                	j	63a <vprintf+0x44>
 7a4:	8bce                	mv	s7,s3
 7a6:	4981                	li	s3,0
 7a8:	bd49                	j	63a <vprintf+0x44>
 7aa:	60a6                	ld	ra,72(sp)
 7ac:	6406                	ld	s0,64(sp)
 7ae:	74e2                	ld	s1,56(sp)
 7b0:	7942                	ld	s2,48(sp)
 7b2:	79a2                	ld	s3,40(sp)
 7b4:	7a02                	ld	s4,32(sp)
 7b6:	6ae2                	ld	s5,24(sp)
 7b8:	6b42                	ld	s6,16(sp)
 7ba:	6ba2                	ld	s7,8(sp)
 7bc:	6c02                	ld	s8,0(sp)
 7be:	6161                	addi	sp,sp,80
 7c0:	8082                	ret

00000000000007c2 <fprintf>:
 7c2:	715d                	addi	sp,sp,-80
 7c4:	ec06                	sd	ra,24(sp)
 7c6:	e822                	sd	s0,16(sp)
 7c8:	1000                	addi	s0,sp,32
 7ca:	e010                	sd	a2,0(s0)
 7cc:	e414                	sd	a3,8(s0)
 7ce:	e818                	sd	a4,16(s0)
 7d0:	ec1c                	sd	a5,24(s0)
 7d2:	03043023          	sd	a6,32(s0)
 7d6:	03143423          	sd	a7,40(s0)
 7da:	8622                	mv	a2,s0
 7dc:	fe843423          	sd	s0,-24(s0)
 7e0:	00000097          	auipc	ra,0x0
 7e4:	e16080e7          	jalr	-490(ra) # 5f6 <vprintf>
 7e8:	60e2                	ld	ra,24(sp)
 7ea:	6442                	ld	s0,16(sp)
 7ec:	6161                	addi	sp,sp,80
 7ee:	8082                	ret

00000000000007f0 <printf>:
 7f0:	711d                	addi	sp,sp,-96
 7f2:	ec06                	sd	ra,24(sp)
 7f4:	e822                	sd	s0,16(sp)
 7f6:	1000                	addi	s0,sp,32
 7f8:	e40c                	sd	a1,8(s0)
 7fa:	e810                	sd	a2,16(s0)
 7fc:	ec14                	sd	a3,24(s0)
 7fe:	f018                	sd	a4,32(s0)
 800:	f41c                	sd	a5,40(s0)
 802:	03043823          	sd	a6,48(s0)
 806:	03143c23          	sd	a7,56(s0)
 80a:	00840613          	addi	a2,s0,8
 80e:	fec43423          	sd	a2,-24(s0)
 812:	85aa                	mv	a1,a0
 814:	4505                	li	a0,1
 816:	00000097          	auipc	ra,0x0
 81a:	de0080e7          	jalr	-544(ra) # 5f6 <vprintf>
 81e:	60e2                	ld	ra,24(sp)
 820:	6442                	ld	s0,16(sp)
 822:	6125                	addi	sp,sp,96
 824:	8082                	ret

0000000000000826 <free>:
 826:	1141                	addi	sp,sp,-16
 828:	e422                	sd	s0,8(sp)
 82a:	0800                	addi	s0,sp,16
 82c:	ff050693          	addi	a3,a0,-16
 830:	00000797          	auipc	a5,0x0
 834:	2807b783          	ld	a5,640(a5) # ab0 <freep>
 838:	a02d                	j	862 <free+0x3c>
 83a:	4618                	lw	a4,8(a2)
 83c:	9f2d                	addw	a4,a4,a1
 83e:	fee52c23          	sw	a4,-8(a0)
 842:	6398                	ld	a4,0(a5)
 844:	6310                	ld	a2,0(a4)
 846:	a83d                	j	884 <free+0x5e>
 848:	ff852703          	lw	a4,-8(a0)
 84c:	9f31                	addw	a4,a4,a2
 84e:	c798                	sw	a4,8(a5)
 850:	ff053683          	ld	a3,-16(a0)
 854:	a091                	j	898 <free+0x72>
 856:	6398                	ld	a4,0(a5)
 858:	00e7e463          	bltu	a5,a4,860 <free+0x3a>
 85c:	00e6ea63          	bltu	a3,a4,870 <free+0x4a>
 860:	87ba                	mv	a5,a4
 862:	fed7fae3          	bgeu	a5,a3,856 <free+0x30>
 866:	6398                	ld	a4,0(a5)
 868:	00e6e463          	bltu	a3,a4,870 <free+0x4a>
 86c:	fee7eae3          	bltu	a5,a4,860 <free+0x3a>
 870:	ff852583          	lw	a1,-8(a0)
 874:	6390                	ld	a2,0(a5)
 876:	02059813          	slli	a6,a1,0x20
 87a:	01c85713          	srli	a4,a6,0x1c
 87e:	9736                	add	a4,a4,a3
 880:	fae60de3          	beq	a2,a4,83a <free+0x14>
 884:	fec53823          	sd	a2,-16(a0)
 888:	4790                	lw	a2,8(a5)
 88a:	02061593          	slli	a1,a2,0x20
 88e:	01c5d713          	srli	a4,a1,0x1c
 892:	973e                	add	a4,a4,a5
 894:	fae68ae3          	beq	a3,a4,848 <free+0x22>
 898:	e394                	sd	a3,0(a5)
 89a:	00000717          	auipc	a4,0x0
 89e:	20f73b23          	sd	a5,534(a4) # ab0 <freep>
 8a2:	6422                	ld	s0,8(sp)
 8a4:	0141                	addi	sp,sp,16
 8a6:	8082                	ret

00000000000008a8 <malloc>:
 8a8:	7139                	addi	sp,sp,-64
 8aa:	fc06                	sd	ra,56(sp)
 8ac:	f822                	sd	s0,48(sp)
 8ae:	f426                	sd	s1,40(sp)
 8b0:	f04a                	sd	s2,32(sp)
 8b2:	ec4e                	sd	s3,24(sp)
 8b4:	e852                	sd	s4,16(sp)
 8b6:	e456                	sd	s5,8(sp)
 8b8:	e05a                	sd	s6,0(sp)
 8ba:	0080                	addi	s0,sp,64
 8bc:	02051493          	slli	s1,a0,0x20
 8c0:	9081                	srli	s1,s1,0x20
 8c2:	04bd                	addi	s1,s1,15
 8c4:	8091                	srli	s1,s1,0x4
 8c6:	0014899b          	addiw	s3,s1,1
 8ca:	0485                	addi	s1,s1,1
 8cc:	00000517          	auipc	a0,0x0
 8d0:	1e453503          	ld	a0,484(a0) # ab0 <freep>
 8d4:	c515                	beqz	a0,900 <malloc+0x58>
 8d6:	611c                	ld	a5,0(a0)
 8d8:	4798                	lw	a4,8(a5)
 8da:	04977063          	bgeu	a4,s1,91a <malloc+0x72>
 8de:	8a4e                	mv	s4,s3
 8e0:	0009871b          	sext.w	a4,s3
 8e4:	6685                	lui	a3,0x1
 8e6:	00d77363          	bgeu	a4,a3,8ec <malloc+0x44>
 8ea:	6a05                	lui	s4,0x1
 8ec:	000a0b1b          	sext.w	s6,s4
 8f0:	004a1a1b          	slliw	s4,s4,0x4
 8f4:	00000917          	auipc	s2,0x0
 8f8:	1bc90913          	addi	s2,s2,444 # ab0 <freep>
 8fc:	5afd                	li	s5,-1
 8fe:	a89d                	j	974 <malloc+0xcc>
 900:	00000717          	auipc	a4,0x0
 904:	1b070713          	addi	a4,a4,432 # ab0 <freep>
 908:	00000797          	auipc	a5,0x0
 90c:	1b078793          	addi	a5,a5,432 # ab8 <base>
 910:	e31c                	sd	a5,0(a4)
 912:	e71c                	sd	a5,8(a4)
 914:	00072823          	sw	zero,16(a4)
 918:	b7d9                	j	8de <malloc+0x36>
 91a:	02e48c63          	beq	s1,a4,952 <malloc+0xaa>
 91e:	4137073b          	subw	a4,a4,s3
 922:	c798                	sw	a4,8(a5)
 924:	02071693          	slli	a3,a4,0x20
 928:	01c6d713          	srli	a4,a3,0x1c
 92c:	97ba                	add	a5,a5,a4
 92e:	0137a423          	sw	s3,8(a5)
 932:	00000717          	auipc	a4,0x0
 936:	16a73f23          	sd	a0,382(a4) # ab0 <freep>
 93a:	01078513          	addi	a0,a5,16
 93e:	70e2                	ld	ra,56(sp)
 940:	7442                	ld	s0,48(sp)
 942:	74a2                	ld	s1,40(sp)
 944:	7902                	ld	s2,32(sp)
 946:	69e2                	ld	s3,24(sp)
 948:	6a42                	ld	s4,16(sp)
 94a:	6aa2                	ld	s5,8(sp)
 94c:	6b02                	ld	s6,0(sp)
 94e:	6121                	addi	sp,sp,64
 950:	8082                	ret
 952:	6398                	ld	a4,0(a5)
 954:	e118                	sd	a4,0(a0)
 956:	bff1                	j	932 <malloc+0x8a>
 958:	01652423          	sw	s6,8(a0)
 95c:	0541                	addi	a0,a0,16
 95e:	00000097          	auipc	ra,0x0
 962:	ec8080e7          	jalr	-312(ra) # 826 <free>
 966:	00093503          	ld	a0,0(s2)
 96a:	d971                	beqz	a0,93e <malloc+0x96>
 96c:	611c                	ld	a5,0(a0)
 96e:	4798                	lw	a4,8(a5)
 970:	fa9775e3          	bgeu	a4,s1,91a <malloc+0x72>
 974:	00093703          	ld	a4,0(s2)
 978:	853e                	mv	a0,a5
 97a:	fef719e3          	bne	a4,a5,96c <malloc+0xc4>
 97e:	8552                	mv	a0,s4
 980:	00000097          	auipc	ra,0x0
 984:	b52080e7          	jalr	-1198(ra) # 4d2 <sbrk>
 988:	fd5518e3          	bne	a0,s5,958 <malloc+0xb0>
 98c:	4501                	li	a0,0
 98e:	bf45                	j	93e <malloc+0x96>
