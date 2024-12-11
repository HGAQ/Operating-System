
xv6-user/_sh:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <checkenvname>:

char mycwd[128];

int
checkenvname(char* s)
{
       0:	1141                	addi	sp,sp,-16
       2:	e422                	sd	s0,8(sp)
       4:	0800                	addi	s0,sp,16
       6:	88aa                	mv	a7,a0
  if((*s >= 'A' && *s <= 'Z') ||
       8:	00054703          	lbu	a4,0(a0)
       c:	fdf77793          	andi	a5,a4,-33
      10:	fbf7879b          	addiw	a5,a5,-65
      14:	0ff7f793          	zext.b	a5,a5
      18:	46e5                	li	a3,25
      1a:	00f6f763          	bgeu	a3,a5,28 <checkenvname+0x28>
     (*s >= 'a' && *s <= 'z') ||
      1e:	05f00793          	li	a5,95
      *s == '_')
    ;
  else
    return 0;
      22:	4501                	li	a0,0
     (*s >= 'a' && *s <= 'z') ||
      24:	02f71e63          	bne	a4,a5,60 <checkenvname+0x60>
  char *tmp = s + 1;
      28:	00188713          	addi	a4,a7,1
  while((*tmp >= 'A' && *tmp <= 'Z') ||
        (*tmp >= 'a' && *tmp <= 'z') ||
        (*tmp >= '0' && *tmp <= '9') ||
      2c:	4665                	li	a2,25
        (*tmp >= 'a' && *tmp <= 'z') ||
      2e:	45a5                	li	a1,9
        (*tmp >= '0' && *tmp <= '9') ||
      30:	05f00813          	li	a6,95
  while((*tmp >= 'A' && *tmp <= 'Z') ||
      34:	a011                	j	38 <checkenvname+0x38>
         *tmp == '_')
    tmp++;
      36:	0705                	addi	a4,a4,1
  while((*tmp >= 'A' && *tmp <= 'Z') ||
      38:	00074683          	lbu	a3,0(a4)
        (*tmp >= '0' && *tmp <= '9') ||
      3c:	fdf6f793          	andi	a5,a3,-33
      40:	fbf7879b          	addiw	a5,a5,-65
      44:	0ff7f793          	zext.b	a5,a5
      48:	fef677e3          	bgeu	a2,a5,36 <checkenvname+0x36>
      4c:	fd06879b          	addiw	a5,a3,-48
        (*tmp >= 'a' && *tmp <= 'z') ||
      50:	0ff7f793          	zext.b	a5,a5
      54:	fef5f1e3          	bgeu	a1,a5,36 <checkenvname+0x36>
        (*tmp >= '0' && *tmp <= '9') ||
      58:	fd068fe3          	beq	a3,a6,36 <checkenvname+0x36>
  return (int)(tmp - s);
      5c:	4117053b          	subw	a0,a4,a7
}
      60:	6422                	ld	s0,8(sp)
      62:	0141                	addi	sp,sp,16
      64:	8082                	ret

0000000000000066 <export>:

int
export(char *argv[])
{
      66:	7131                	addi	sp,sp,-192
      68:	fd06                	sd	ra,184(sp)
      6a:	f922                	sd	s0,176(sp)
      6c:	f526                	sd	s1,168(sp)
      6e:	f14a                	sd	s2,160(sp)
      70:	ed4e                	sd	s3,152(sp)
      72:	e952                	sd	s4,144(sp)
      74:	e556                	sd	s5,136(sp)
      76:	e15a                	sd	s6,128(sp)
      78:	0180                	addi	s0,sp,192
      7a:	84aa                	mv	s1,a0
  if(!strcmp(argv[1], "-p"))
      7c:	00001597          	auipc	a1,0x1
      80:	7cc58593          	addi	a1,a1,1996 # 1848 <malloc+0xf0>
      84:	6508                	ld	a0,8(a0)
      86:	00001097          	auipc	ra,0x1
      8a:	ffc080e7          	jalr	-4(ra) # 1082 <strcmp>
      8e:	e12d                	bnez	a0,f0 <export+0x8a>
      90:	89aa                	mv	s3,a0
  { // print all the env vars
    if(!nenv)
      92:	00002b17          	auipc	s6,0x2
      96:	a1eb2b03          	lw	s6,-1506(s6) # 1ab0 <nenv>
      9a:	040b0163          	beqz	s6,dc <export+0x76>
    {
      printf("NO env var exported\n");
      return 0;
    }
    for(int i=0; i<nenv; i++)
      9e:	00002497          	auipc	s1,0x2
      a2:	b0248493          	addi	s1,s1,-1278 # 1ba0 <envs>
      a6:	892a                	mv	s2,a0
      printf("export %s=%s\n", envs[i].name, envs[i].value);
      a8:	00001a97          	auipc	s5,0x1
      ac:	7c0a8a93          	addi	s5,s5,1984 # 1868 <malloc+0x110>
    for(int i=0; i<nenv; i++)
      b0:	00002a17          	auipc	s4,0x2
      b4:	a00a0a13          	addi	s4,s4,-1536 # 1ab0 <nenv>
      b8:	0f605c63          	blez	s6,1b0 <export+0x14a>
      printf("export %s=%s\n", envs[i].name, envs[i].value);
      bc:	02048613          	addi	a2,s1,32
      c0:	85a6                	mv	a1,s1
      c2:	8556                	mv	a0,s5
      c4:	00001097          	auipc	ra,0x1
      c8:	5dc080e7          	jalr	1500(ra) # 16a0 <printf>
    for(int i=0; i<nenv; i++)
      cc:	2905                	addiw	s2,s2,1
      ce:	08048493          	addi	s1,s1,128
      d2:	000a2783          	lw	a5,0(s4)
      d6:	fef943e3          	blt	s2,a5,bc <export+0x56>
      da:	a8d9                	j	1b0 <export+0x14a>
      printf("NO env var exported\n");
      dc:	00001517          	auipc	a0,0x1
      e0:	77450513          	addi	a0,a0,1908 # 1850 <malloc+0xf8>
      e4:	00001097          	auipc	ra,0x1
      e8:	5bc080e7          	jalr	1468(ra) # 16a0 <printf>
      return 0;
      ec:	89da                	mv	s3,s6
      ee:	a0c9                	j	1b0 <export+0x14a>
    return 0;
  }
  else if(nenv == NENVS)
      f0:	00002997          	auipc	s3,0x2
      f4:	9c09a983          	lw	s3,-1600(s3) # 1ab0 <nenv>
      f8:	47c1                	li	a5,16
      fa:	0cf98663          	beq	s3,a5,1c6 <export+0x160>
  {
    fprintf(2, "too many env vars\n");
    return -1;
  }
  char name[32], value[96];
  char *s = argv[1], *t = name;
      fe:	0084b903          	ld	s2,8(s1)

  for(s=argv[1], t=name; (*t=*s++)!='='; t++)
     102:	00190493          	addi	s1,s2,1
     106:	00094783          	lbu	a5,0(s2)
     10a:	faf40023          	sb	a5,-96(s0)
     10e:	03d00713          	li	a4,61
     112:	0ce78563          	beq	a5,a4,1dc <export+0x176>
     116:	fa040793          	addi	a5,s0,-96
     11a:	03d00693          	li	a3,61
     11e:	0785                	addi	a5,a5,1
     120:	0485                	addi	s1,s1,1
     122:	fff4c703          	lbu	a4,-1(s1)
     126:	00e78023          	sb	a4,0(a5)
     12a:	fed71ae3          	bne	a4,a3,11e <export+0xb8>
    ;
  *t = 0;
     12e:	00078023          	sb	zero,0(a5)

  if(checkenvname(name) != ((s - argv[1]) - 1))
     132:	fa040513          	addi	a0,s0,-96
     136:	00000097          	auipc	ra,0x0
     13a:	eca080e7          	jalr	-310(ra) # 0 <checkenvname>
     13e:	41248933          	sub	s2,s1,s2
     142:	197d                	addi	s2,s2,-1
     144:	09251f63          	bne	a0,s2,1e2 <export+0x17c>
  {
    fprintf(2, "Invalid NAME!\n");
    return -1;
  }
  for(t=value; (*t=*s); s++, t++)
     148:	0004c703          	lbu	a4,0(s1)
     14c:	f4e40023          	sb	a4,-192(s0)
     150:	f4040793          	addi	a5,s0,-192
     154:	cb01                	beqz	a4,164 <export+0xfe>
     156:	0485                	addi	s1,s1,1
     158:	0785                	addi	a5,a5,1
     15a:	0004c703          	lbu	a4,0(s1)
     15e:	00e78023          	sb	a4,0(a5)
     162:	fb75                	bnez	a4,156 <export+0xf0>
    ;
  if(*--t == '/')
     164:	fff7c683          	lbu	a3,-1(a5)
     168:	02f00713          	li	a4,47
     16c:	08e68663          	beq	a3,a4,1f8 <export+0x192>
    *t = 0;
  
  strcpy(envs[nenv].name, name);
     170:	00799513          	slli	a0,s3,0x7
     174:	00002917          	auipc	s2,0x2
     178:	a2c90913          	addi	s2,s2,-1492 # 1ba0 <envs>
     17c:	fa040593          	addi	a1,s0,-96
     180:	954a                	add	a0,a0,s2
     182:	00001097          	auipc	ra,0x1
     186:	eb6080e7          	jalr	-330(ra) # 1038 <strcpy>
  strcpy(envs[nenv].value, value);
     18a:	00002497          	auipc	s1,0x2
     18e:	92648493          	addi	s1,s1,-1754 # 1ab0 <nenv>
     192:	4088                	lw	a0,0(s1)
     194:	051e                	slli	a0,a0,0x7
     196:	02050513          	addi	a0,a0,32
     19a:	f4040593          	addi	a1,s0,-192
     19e:	954a                	add	a0,a0,s2
     1a0:	00001097          	auipc	ra,0x1
     1a4:	e98080e7          	jalr	-360(ra) # 1038 <strcpy>
  nenv++;
     1a8:	409c                	lw	a5,0(s1)
     1aa:	2785                	addiw	a5,a5,1
     1ac:	c09c                	sw	a5,0(s1)
  return 0;
     1ae:	4981                	li	s3,0
}
     1b0:	854e                	mv	a0,s3
     1b2:	70ea                	ld	ra,184(sp)
     1b4:	744a                	ld	s0,176(sp)
     1b6:	74aa                	ld	s1,168(sp)
     1b8:	790a                	ld	s2,160(sp)
     1ba:	69ea                	ld	s3,152(sp)
     1bc:	6a4a                	ld	s4,144(sp)
     1be:	6aaa                	ld	s5,136(sp)
     1c0:	6b0a                	ld	s6,128(sp)
     1c2:	6129                	addi	sp,sp,192
     1c4:	8082                	ret
    fprintf(2, "too many env vars\n");
     1c6:	00001597          	auipc	a1,0x1
     1ca:	6b258593          	addi	a1,a1,1714 # 1878 <malloc+0x120>
     1ce:	4509                	li	a0,2
     1d0:	00001097          	auipc	ra,0x1
     1d4:	4a2080e7          	jalr	1186(ra) # 1672 <fprintf>
    return -1;
     1d8:	59fd                	li	s3,-1
     1da:	bfd9                	j	1b0 <export+0x14a>
  for(s=argv[1], t=name; (*t=*s++)!='='; t++)
     1dc:	fa040793          	addi	a5,s0,-96
     1e0:	b7b9                	j	12e <export+0xc8>
    fprintf(2, "Invalid NAME!\n");
     1e2:	00001597          	auipc	a1,0x1
     1e6:	6ae58593          	addi	a1,a1,1710 # 1890 <malloc+0x138>
     1ea:	4509                	li	a0,2
     1ec:	00001097          	auipc	ra,0x1
     1f0:	486080e7          	jalr	1158(ra) # 1672 <fprintf>
    return -1;
     1f4:	59fd                	li	s3,-1
     1f6:	bf6d                	j	1b0 <export+0x14a>
    *t = 0;
     1f8:	fe078fa3          	sb	zero,-1(a5)
     1fc:	bf95                	j	170 <export+0x10a>

00000000000001fe <replace>:

int
replace(char *buf)
{
     1fe:	7111                	addi	sp,sp,-256
     200:	fd86                	sd	ra,248(sp)
     202:	f9a2                	sd	s0,240(sp)
     204:	f5a6                	sd	s1,232(sp)
     206:	f1ca                	sd	s2,224(sp)
     208:	edce                	sd	s3,216(sp)
     20a:	e9d2                	sd	s4,208(sp)
     20c:	e5d6                	sd	s5,200(sp)
     20e:	e1da                	sd	s6,192(sp)
     210:	fd5e                	sd	s7,184(sp)
     212:	f962                	sd	s8,176(sp)
     214:	f566                	sd	s9,168(sp)
     216:	f16a                	sd	s10,160(sp)
     218:	ed6e                	sd	s11,152(sp)
     21a:	0200                	addi	s0,sp,256
     21c:	89aa                	mv	s3,a0
  char raw[100], name[32], *s, *t, *tmp;
  int n = 0;
  strcpy(raw, buf);
     21e:	85aa                	mv	a1,a0
     220:	f2840513          	addi	a0,s0,-216
     224:	00001097          	auipc	ra,0x1
     228:	e14080e7          	jalr	-492(ra) # 1038 <strcpy>
  for(s=raw, t=buf; (*t=*s); t++)
     22c:	f2844783          	lbu	a5,-216(s0)
     230:	00f98023          	sb	a5,0(s3)
     234:	c7f5                	beqz	a5,320 <replace+0x122>
  int n = 0;
     236:	4c81                	li	s9,0
  for(s=raw, t=buf; (*t=*s); t++)
     238:	f2840713          	addi	a4,s0,-216
  {
    if(*s++ == '$'){
     23c:	02400c13          	li	s8,36
      tmp = name;
      if((*s >= 'A' && *s <= 'Z') || (*s >= 'a' && *s <= 'z') || *s == '_')
     240:	4965                	li	s2,25
      {
        *tmp++ = *s++;
        while((*s >= 'A' && *s <= 'Z') || (*s >= 'a' && *s <= 'z') || (*s >= '0' && *s <= '9') || *s == '_')
     242:	4a25                	li	s4,9
     244:	05f00a93          	li	s5,95
          *tmp++ = *s++;
        *tmp = 0;
        for(int i=0; i<nenv; i++)
     248:	00002b17          	auipc	s6,0x2
     24c:	868b0b13          	addi	s6,s6,-1944 # 1ab0 <nenv>
          if(!strcmp(name, envs[i].name))
     250:	f0840b93          	addi	s7,s0,-248
     254:	a03d                	j	282 <replace+0x84>
      if((*s >= 'A' && *s <= 'Z') || (*s >= 'a' && *s <= 'z') || *s == '_')
     256:	00174683          	lbu	a3,1(a4)
     25a:	fdf6f793          	andi	a5,a3,-33
     25e:	fbf7879b          	addiw	a5,a5,-65
     262:	0ff7f793          	zext.b	a5,a5
     266:	02f97563          	bgeu	s2,a5,290 <replace+0x92>
     26a:	03568363          	beq	a3,s5,290 <replace+0x92>
            for(tmp=envs[i].value; (*t=*tmp); t++, tmp++)
              ;
        t--;
      }
      n++;
     26e:	2c85                	addiw	s9,s9,1
     270:	86ce                	mv	a3,s3
     272:	8726                	mv	a4,s1
  for(s=raw, t=buf; (*t=*s); t++)
     274:	00168993          	addi	s3,a3,1
     278:	00074783          	lbu	a5,0(a4)
     27c:	00f680a3          	sb	a5,1(a3)
     280:	c3cd                	beqz	a5,322 <replace+0x124>
    if(*s++ == '$'){
     282:	00170493          	addi	s1,a4,1
     286:	fd8788e3          	beq	a5,s8,256 <replace+0x58>
     28a:	86ce                	mv	a3,s3
     28c:	8726                	mv	a4,s1
     28e:	b7dd                	j	274 <replace+0x76>
        *tmp++ = *s++;
     290:	00270493          	addi	s1,a4,2
     294:	f0d40423          	sb	a3,-248(s0)
     298:	f0940693          	addi	a3,s0,-247
        while((*s >= 'A' && *s <= 'Z') || (*s >= 'a' && *s <= 'z') || (*s >= '0' && *s <= '9') || *s == '_')
     29c:	a029                	j	2a6 <replace+0xa8>
          *tmp++ = *s++;
     29e:	0485                	addi	s1,s1,1
     2a0:	0685                	addi	a3,a3,1
     2a2:	fee68fa3          	sb	a4,-1(a3)
        while((*s >= 'A' && *s <= 'Z') || (*s >= 'a' && *s <= 'z') || (*s >= '0' && *s <= '9') || *s == '_')
     2a6:	0004c703          	lbu	a4,0(s1)
     2aa:	fdf77793          	andi	a5,a4,-33
     2ae:	fbf7879b          	addiw	a5,a5,-65
     2b2:	0ff7f793          	zext.b	a5,a5
     2b6:	fef974e3          	bgeu	s2,a5,29e <replace+0xa0>
     2ba:	fd07079b          	addiw	a5,a4,-48
     2be:	0ff7f793          	zext.b	a5,a5
     2c2:	fcfa7ee3          	bgeu	s4,a5,29e <replace+0xa0>
     2c6:	fd570ce3          	beq	a4,s5,29e <replace+0xa0>
        *tmp = 0;
     2ca:	00068023          	sb	zero,0(a3)
        for(int i=0; i<nenv; i++)
     2ce:	000b2783          	lw	a5,0(s6)
     2d2:	04f05563          	blez	a5,31c <replace+0x11e>
     2d6:	00002d17          	auipc	s10,0x2
     2da:	8ead0d13          	addi	s10,s10,-1814 # 1bc0 <envs+0x20>
     2de:	4d81                	li	s11,0
     2e0:	a801                	j	2f0 <replace+0xf2>
     2e2:	2d85                	addiw	s11,s11,1
     2e4:	080d0d13          	addi	s10,s10,128
     2e8:	000b2783          	lw	a5,0(s6)
     2ec:	02fdd863          	bge	s11,a5,31c <replace+0x11e>
          if(!strcmp(name, envs[i].name))
     2f0:	fe0d0593          	addi	a1,s10,-32
     2f4:	855e                	mv	a0,s7
     2f6:	00001097          	auipc	ra,0x1
     2fa:	d8c080e7          	jalr	-628(ra) # 1082 <strcmp>
     2fe:	f175                	bnez	a0,2e2 <replace+0xe4>
            for(tmp=envs[i].value; (*t=*tmp); t++, tmp++)
     300:	87ea                	mv	a5,s10
     302:	000d4703          	lbu	a4,0(s10)
     306:	00e98023          	sb	a4,0(s3)
     30a:	df61                	beqz	a4,2e2 <replace+0xe4>
     30c:	0985                	addi	s3,s3,1
     30e:	0785                	addi	a5,a5,1
     310:	0007c703          	lbu	a4,0(a5)
     314:	00e98023          	sb	a4,0(s3)
     318:	fb75                	bnez	a4,30c <replace+0x10e>
     31a:	b7e1                	j	2e2 <replace+0xe4>
        t--;
     31c:	19fd                	addi	s3,s3,-1
     31e:	bf81                	j	26e <replace+0x70>
  int n = 0;
     320:	4c81                	li	s9,0
    }
  }
  return n;
}
     322:	8566                	mv	a0,s9
     324:	70ee                	ld	ra,248(sp)
     326:	744e                	ld	s0,240(sp)
     328:	74ae                	ld	s1,232(sp)
     32a:	790e                	ld	s2,224(sp)
     32c:	69ee                	ld	s3,216(sp)
     32e:	6a4e                	ld	s4,208(sp)
     330:	6aae                	ld	s5,200(sp)
     332:	6b0e                	ld	s6,192(sp)
     334:	7bea                	ld	s7,184(sp)
     336:	7c4a                	ld	s8,176(sp)
     338:	7caa                	ld	s9,168(sp)
     33a:	7d0a                	ld	s10,160(sp)
     33c:	6dea                	ld	s11,152(sp)
     33e:	6111                	addi	sp,sp,256
     340:	8082                	ret

0000000000000342 <getcmd>:
  exit(0);
}

int
getcmd(char *buf, int nbuf)
{
     342:	1101                	addi	sp,sp,-32
     344:	ec06                	sd	ra,24(sp)
     346:	e822                	sd	s0,16(sp)
     348:	e426                	sd	s1,8(sp)
     34a:	e04a                	sd	s2,0(sp)
     34c:	1000                	addi	s0,sp,32
     34e:	84aa                	mv	s1,a0
     350:	892e                	mv	s2,a1
  fprintf(2, "-> %s $ ", mycwd);
     352:	00001617          	auipc	a2,0x1
     356:	76660613          	addi	a2,a2,1894 # 1ab8 <mycwd>
     35a:	00001597          	auipc	a1,0x1
     35e:	54658593          	addi	a1,a1,1350 # 18a0 <malloc+0x148>
     362:	4509                	li	a0,2
     364:	00001097          	auipc	ra,0x1
     368:	30e080e7          	jalr	782(ra) # 1672 <fprintf>
  memset(buf, 0, nbuf);
     36c:	864a                	mv	a2,s2
     36e:	4581                	li	a1,0
     370:	8526                	mv	a0,s1
     372:	00001097          	auipc	ra,0x1
     376:	d66080e7          	jalr	-666(ra) # 10d8 <memset>
  gets(buf, nbuf);
     37a:	85ca                	mv	a1,s2
     37c:	8526                	mv	a0,s1
     37e:	00001097          	auipc	ra,0x1
     382:	da0080e7          	jalr	-608(ra) # 111e <gets>
  if(buf[0] == 0) // EOF
     386:	0004c503          	lbu	a0,0(s1)
     38a:	00153513          	seqz	a0,a0
    return -1;
  return 0;
}
     38e:	40a00533          	neg	a0,a0
     392:	60e2                	ld	ra,24(sp)
     394:	6442                	ld	s0,16(sp)
     396:	64a2                	ld	s1,8(sp)
     398:	6902                	ld	s2,0(sp)
     39a:	6105                	addi	sp,sp,32
     39c:	8082                	ret

000000000000039e <panic>:
  exit(0);
}

void
panic(char *s)
{
     39e:	1141                	addi	sp,sp,-16
     3a0:	e406                	sd	ra,8(sp)
     3a2:	e022                	sd	s0,0(sp)
     3a4:	0800                	addi	s0,sp,16
     3a6:	862a                	mv	a2,a0
  fprintf(2, "%s\n", s);
     3a8:	00001597          	auipc	a1,0x1
     3ac:	50858593          	addi	a1,a1,1288 # 18b0 <malloc+0x158>
     3b0:	4509                	li	a0,2
     3b2:	00001097          	auipc	ra,0x1
     3b6:	2c0080e7          	jalr	704(ra) # 1672 <fprintf>
  exit(1);
     3ba:	4505                	li	a0,1
     3bc:	00001097          	auipc	ra,0x1
     3c0:	f34080e7          	jalr	-204(ra) # 12f0 <exit>

00000000000003c4 <fork1>:
}

int
fork1(void)
{
     3c4:	1141                	addi	sp,sp,-16
     3c6:	e406                	sd	ra,8(sp)
     3c8:	e022                	sd	s0,0(sp)
     3ca:	0800                	addi	s0,sp,16
  int pid;

  pid = fork();
     3cc:	00001097          	auipc	ra,0x1
     3d0:	f1c080e7          	jalr	-228(ra) # 12e8 <fork>
  if(pid == -1)
     3d4:	57fd                	li	a5,-1
     3d6:	00f50663          	beq	a0,a5,3e2 <fork1+0x1e>
    panic("fork");
  return pid;
}
     3da:	60a2                	ld	ra,8(sp)
     3dc:	6402                	ld	s0,0(sp)
     3de:	0141                	addi	sp,sp,16
     3e0:	8082                	ret
    panic("fork");
     3e2:	00001517          	auipc	a0,0x1
     3e6:	4d650513          	addi	a0,a0,1238 # 18b8 <malloc+0x160>
     3ea:	00000097          	auipc	ra,0x0
     3ee:	fb4080e7          	jalr	-76(ra) # 39e <panic>

00000000000003f2 <runcmd>:
{
     3f2:	7135                	addi	sp,sp,-160
     3f4:	ed06                	sd	ra,152(sp)
     3f6:	e922                	sd	s0,144(sp)
     3f8:	e526                	sd	s1,136(sp)
     3fa:	e14a                	sd	s2,128(sp)
     3fc:	fcce                	sd	s3,120(sp)
     3fe:	f8d2                	sd	s4,112(sp)
     400:	f4d6                	sd	s5,104(sp)
     402:	f0da                	sd	s6,96(sp)
     404:	ecde                	sd	s7,88(sp)
     406:	1100                	addi	s0,sp,160
  if(cmd == 0)
     408:	c10d                	beqz	a0,42a <runcmd+0x38>
     40a:	84aa                	mv	s1,a0
  switch(cmd->type){
     40c:	4118                	lw	a4,0(a0)
     40e:	4795                	li	a5,5
     410:	02e7e263          	bltu	a5,a4,434 <runcmd+0x42>
     414:	00056783          	lwu	a5,0(a0)
     418:	078a                	slli	a5,a5,0x2
     41a:	00001717          	auipc	a4,0x1
     41e:	5de70713          	addi	a4,a4,1502 # 19f8 <malloc+0x2a0>
     422:	97ba                	add	a5,a5,a4
     424:	439c                	lw	a5,0(a5)
     426:	97ba                	add	a5,a5,a4
     428:	8782                	jr	a5
    exit(1);
     42a:	4505                	li	a0,1
     42c:	00001097          	auipc	ra,0x1
     430:	ec4080e7          	jalr	-316(ra) # 12f0 <exit>
    panic("runcmd");
     434:	00001517          	auipc	a0,0x1
     438:	48c50513          	addi	a0,a0,1164 # 18c0 <malloc+0x168>
     43c:	00000097          	auipc	ra,0x0
     440:	f62080e7          	jalr	-158(ra) # 39e <panic>
    if(ecmd->argv[0] == 0)
     444:	6508                	ld	a0,8(a0)
     446:	c155                	beqz	a0,4ea <runcmd+0xf8>
    exec(ecmd->argv[0], ecmd->argv);
     448:	00848a13          	addi	s4,s1,8
     44c:	85d2                	mv	a1,s4
     44e:	00001097          	auipc	ra,0x1
     452:	eda080e7          	jalr	-294(ra) # 1328 <exec>
    for(i=0; i<nenv; i++)
     456:	00001797          	auipc	a5,0x1
     45a:	65a7a783          	lw	a5,1626(a5) # 1ab0 <nenv>
     45e:	06f05763          	blez	a5,4cc <runcmd+0xda>
     462:	00001917          	auipc	s2,0x1
     466:	75f90913          	addi	s2,s2,1887 # 1bc1 <envs+0x21>
     46a:	4981                	li	s3,0
      *s_tmp++ = '/';
     46c:	02f00b93          	li	s7,47
      exec(env_cmd, ecmd->argv);
     470:	f6840b13          	addi	s6,s0,-152
    for(i=0; i<nenv; i++)
     474:	00001a97          	auipc	s5,0x1
     478:	63ca8a93          	addi	s5,s5,1596 # 1ab0 <nenv>
      while((*s_tmp = *d_tmp++))
     47c:	874a                	mv	a4,s2
     47e:	fff94783          	lbu	a5,-1(s2)
     482:	f6f40423          	sb	a5,-152(s0)
     486:	c7bd                	beqz	a5,4f4 <runcmd+0x102>
      char *s_tmp = env_cmd;
     488:	f6840793          	addi	a5,s0,-152
        s_tmp++;
     48c:	0785                	addi	a5,a5,1
      while((*s_tmp = *d_tmp++))
     48e:	0705                	addi	a4,a4,1
     490:	fff74683          	lbu	a3,-1(a4)
     494:	00d78023          	sb	a3,0(a5)
     498:	faf5                	bnez	a3,48c <runcmd+0x9a>
      *s_tmp++ = '/';
     49a:	00178713          	addi	a4,a5,1
     49e:	01778023          	sb	s7,0(a5)
      d_tmp = ecmd->argv[0];
     4a2:	649c                	ld	a5,8(s1)
      while((*s_tmp++ = *d_tmp++))
     4a4:	0785                	addi	a5,a5,1
     4a6:	0705                	addi	a4,a4,1
     4a8:	fff7c683          	lbu	a3,-1(a5)
     4ac:	fed70fa3          	sb	a3,-1(a4)
     4b0:	faf5                	bnez	a3,4a4 <runcmd+0xb2>
      exec(env_cmd, ecmd->argv);
     4b2:	85d2                	mv	a1,s4
     4b4:	855a                	mv	a0,s6
     4b6:	00001097          	auipc	ra,0x1
     4ba:	e72080e7          	jalr	-398(ra) # 1328 <exec>
    for(i=0; i<nenv; i++)
     4be:	2985                	addiw	s3,s3,1
     4c0:	08090913          	addi	s2,s2,128
     4c4:	000aa783          	lw	a5,0(s5)
     4c8:	faf9cae3          	blt	s3,a5,47c <runcmd+0x8a>
    fprintf(2, "exec %s failed\n", ecmd->argv[0]);
     4cc:	6490                	ld	a2,8(s1)
     4ce:	00001597          	auipc	a1,0x1
     4d2:	3fa58593          	addi	a1,a1,1018 # 18c8 <malloc+0x170>
     4d6:	4509                	li	a0,2
     4d8:	00001097          	auipc	ra,0x1
     4dc:	19a080e7          	jalr	410(ra) # 1672 <fprintf>
  exit(0);
     4e0:	4501                	li	a0,0
     4e2:	00001097          	auipc	ra,0x1
     4e6:	e0e080e7          	jalr	-498(ra) # 12f0 <exit>
      exit(1);
     4ea:	4505                	li	a0,1
     4ec:	00001097          	auipc	ra,0x1
     4f0:	e04080e7          	jalr	-508(ra) # 12f0 <exit>
      char *s_tmp = env_cmd;
     4f4:	f6840793          	addi	a5,s0,-152
     4f8:	b74d                	j	49a <runcmd+0xa8>
    close(rcmd->fd);
     4fa:	5148                	lw	a0,36(a0)
     4fc:	00001097          	auipc	ra,0x1
     500:	e1c080e7          	jalr	-484(ra) # 1318 <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     504:	508c                	lw	a1,32(s1)
     506:	6888                	ld	a0,16(s1)
     508:	00001097          	auipc	ra,0x1
     50c:	e28080e7          	jalr	-472(ra) # 1330 <open>
     510:	00054763          	bltz	a0,51e <runcmd+0x12c>
    runcmd(rcmd->cmd);
     514:	6488                	ld	a0,8(s1)
     516:	00000097          	auipc	ra,0x0
     51a:	edc080e7          	jalr	-292(ra) # 3f2 <runcmd>
      fprintf(2, "open %s failed\n", rcmd->file);
     51e:	6890                	ld	a2,16(s1)
     520:	00001597          	auipc	a1,0x1
     524:	3b858593          	addi	a1,a1,952 # 18d8 <malloc+0x180>
     528:	4509                	li	a0,2
     52a:	00001097          	auipc	ra,0x1
     52e:	148080e7          	jalr	328(ra) # 1672 <fprintf>
      exit(1);
     532:	4505                	li	a0,1
     534:	00001097          	auipc	ra,0x1
     538:	dbc080e7          	jalr	-580(ra) # 12f0 <exit>
    if(fork1() == 0)
     53c:	00000097          	auipc	ra,0x0
     540:	e88080e7          	jalr	-376(ra) # 3c4 <fork1>
     544:	c919                	beqz	a0,55a <runcmd+0x168>
    wait(0);
     546:	4501                	li	a0,0
     548:	00001097          	auipc	ra,0x1
     54c:	db0080e7          	jalr	-592(ra) # 12f8 <wait>
    runcmd(lcmd->right);
     550:	6888                	ld	a0,16(s1)
     552:	00000097          	auipc	ra,0x0
     556:	ea0080e7          	jalr	-352(ra) # 3f2 <runcmd>
      runcmd(lcmd->left);
     55a:	6488                	ld	a0,8(s1)
     55c:	00000097          	auipc	ra,0x0
     560:	e96080e7          	jalr	-362(ra) # 3f2 <runcmd>
    if(pipe(p) < 0)
     564:	fa840513          	addi	a0,s0,-88
     568:	00001097          	auipc	ra,0x1
     56c:	d98080e7          	jalr	-616(ra) # 1300 <pipe>
     570:	04054363          	bltz	a0,5b6 <runcmd+0x1c4>
    if(fork1() == 0){
     574:	00000097          	auipc	ra,0x0
     578:	e50080e7          	jalr	-432(ra) # 3c4 <fork1>
     57c:	c529                	beqz	a0,5c6 <runcmd+0x1d4>
    if(fork1() == 0){
     57e:	00000097          	auipc	ra,0x0
     582:	e46080e7          	jalr	-442(ra) # 3c4 <fork1>
     586:	cd25                	beqz	a0,5fe <runcmd+0x20c>
    close(p[0]);
     588:	fa842503          	lw	a0,-88(s0)
     58c:	00001097          	auipc	ra,0x1
     590:	d8c080e7          	jalr	-628(ra) # 1318 <close>
    close(p[1]);
     594:	fac42503          	lw	a0,-84(s0)
     598:	00001097          	auipc	ra,0x1
     59c:	d80080e7          	jalr	-640(ra) # 1318 <close>
    wait(0);
     5a0:	4501                	li	a0,0
     5a2:	00001097          	auipc	ra,0x1
     5a6:	d56080e7          	jalr	-682(ra) # 12f8 <wait>
    wait(0);
     5aa:	4501                	li	a0,0
     5ac:	00001097          	auipc	ra,0x1
     5b0:	d4c080e7          	jalr	-692(ra) # 12f8 <wait>
    break;
     5b4:	b735                	j	4e0 <runcmd+0xee>
      panic("pipe");
     5b6:	00001517          	auipc	a0,0x1
     5ba:	33250513          	addi	a0,a0,818 # 18e8 <malloc+0x190>
     5be:	00000097          	auipc	ra,0x0
     5c2:	de0080e7          	jalr	-544(ra) # 39e <panic>
      close(1);
     5c6:	4505                	li	a0,1
     5c8:	00001097          	auipc	ra,0x1
     5cc:	d50080e7          	jalr	-688(ra) # 1318 <close>
      dup(p[1]);
     5d0:	fac42503          	lw	a0,-84(s0)
     5d4:	00001097          	auipc	ra,0x1
     5d8:	d7c080e7          	jalr	-644(ra) # 1350 <dup>
      close(p[0]);
     5dc:	fa842503          	lw	a0,-88(s0)
     5e0:	00001097          	auipc	ra,0x1
     5e4:	d38080e7          	jalr	-712(ra) # 1318 <close>
      close(p[1]);
     5e8:	fac42503          	lw	a0,-84(s0)
     5ec:	00001097          	auipc	ra,0x1
     5f0:	d2c080e7          	jalr	-724(ra) # 1318 <close>
      runcmd(pcmd->left);
     5f4:	6488                	ld	a0,8(s1)
     5f6:	00000097          	auipc	ra,0x0
     5fa:	dfc080e7          	jalr	-516(ra) # 3f2 <runcmd>
      close(0);
     5fe:	00001097          	auipc	ra,0x1
     602:	d1a080e7          	jalr	-742(ra) # 1318 <close>
      dup(p[0]);
     606:	fa842503          	lw	a0,-88(s0)
     60a:	00001097          	auipc	ra,0x1
     60e:	d46080e7          	jalr	-698(ra) # 1350 <dup>
      close(p[0]);
     612:	fa842503          	lw	a0,-88(s0)
     616:	00001097          	auipc	ra,0x1
     61a:	d02080e7          	jalr	-766(ra) # 1318 <close>
      close(p[1]);
     61e:	fac42503          	lw	a0,-84(s0)
     622:	00001097          	auipc	ra,0x1
     626:	cf6080e7          	jalr	-778(ra) # 1318 <close>
      runcmd(pcmd->right);
     62a:	6888                	ld	a0,16(s1)
     62c:	00000097          	auipc	ra,0x0
     630:	dc6080e7          	jalr	-570(ra) # 3f2 <runcmd>
    if(fork1() == 0)
     634:	00000097          	auipc	ra,0x0
     638:	d90080e7          	jalr	-624(ra) # 3c4 <fork1>
     63c:	ea0512e3          	bnez	a0,4e0 <runcmd+0xee>
      runcmd(bcmd->cmd);
     640:	6488                	ld	a0,8(s1)
     642:	00000097          	auipc	ra,0x0
     646:	db0080e7          	jalr	-592(ra) # 3f2 <runcmd>

000000000000064a <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     64a:	1101                	addi	sp,sp,-32
     64c:	ec06                	sd	ra,24(sp)
     64e:	e822                	sd	s0,16(sp)
     650:	e426                	sd	s1,8(sp)
     652:	1000                	addi	s0,sp,32
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     654:	0a800513          	li	a0,168
     658:	00001097          	auipc	ra,0x1
     65c:	100080e7          	jalr	256(ra) # 1758 <malloc>
     660:	84aa                	mv	s1,a0
  memset(cmd, 0, sizeof(*cmd));
     662:	0a800613          	li	a2,168
     666:	4581                	li	a1,0
     668:	00001097          	auipc	ra,0x1
     66c:	a70080e7          	jalr	-1424(ra) # 10d8 <memset>
  cmd->type = EXEC;
     670:	4785                	li	a5,1
     672:	c09c                	sw	a5,0(s1)
  return (struct cmd*)cmd;
}
     674:	8526                	mv	a0,s1
     676:	60e2                	ld	ra,24(sp)
     678:	6442                	ld	s0,16(sp)
     67a:	64a2                	ld	s1,8(sp)
     67c:	6105                	addi	sp,sp,32
     67e:	8082                	ret

0000000000000680 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     680:	7139                	addi	sp,sp,-64
     682:	fc06                	sd	ra,56(sp)
     684:	f822                	sd	s0,48(sp)
     686:	f426                	sd	s1,40(sp)
     688:	f04a                	sd	s2,32(sp)
     68a:	ec4e                	sd	s3,24(sp)
     68c:	e852                	sd	s4,16(sp)
     68e:	e456                	sd	s5,8(sp)
     690:	e05a                	sd	s6,0(sp)
     692:	0080                	addi	s0,sp,64
     694:	8b2a                	mv	s6,a0
     696:	8aae                	mv	s5,a1
     698:	8a32                	mv	s4,a2
     69a:	89b6                	mv	s3,a3
     69c:	893a                	mv	s2,a4
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     69e:	02800513          	li	a0,40
     6a2:	00001097          	auipc	ra,0x1
     6a6:	0b6080e7          	jalr	182(ra) # 1758 <malloc>
     6aa:	84aa                	mv	s1,a0
  memset(cmd, 0, sizeof(*cmd));
     6ac:	02800613          	li	a2,40
     6b0:	4581                	li	a1,0
     6b2:	00001097          	auipc	ra,0x1
     6b6:	a26080e7          	jalr	-1498(ra) # 10d8 <memset>
  cmd->type = REDIR;
     6ba:	4789                	li	a5,2
     6bc:	c09c                	sw	a5,0(s1)
  cmd->cmd = subcmd;
     6be:	0164b423          	sd	s6,8(s1)
  cmd->file = file;
     6c2:	0154b823          	sd	s5,16(s1)
  cmd->efile = efile;
     6c6:	0144bc23          	sd	s4,24(s1)
  cmd->mode = mode;
     6ca:	0334a023          	sw	s3,32(s1)
  cmd->fd = fd;
     6ce:	0324a223          	sw	s2,36(s1)
  return (struct cmd*)cmd;
}
     6d2:	8526                	mv	a0,s1
     6d4:	70e2                	ld	ra,56(sp)
     6d6:	7442                	ld	s0,48(sp)
     6d8:	74a2                	ld	s1,40(sp)
     6da:	7902                	ld	s2,32(sp)
     6dc:	69e2                	ld	s3,24(sp)
     6de:	6a42                	ld	s4,16(sp)
     6e0:	6aa2                	ld	s5,8(sp)
     6e2:	6b02                	ld	s6,0(sp)
     6e4:	6121                	addi	sp,sp,64
     6e6:	8082                	ret

00000000000006e8 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     6e8:	7179                	addi	sp,sp,-48
     6ea:	f406                	sd	ra,40(sp)
     6ec:	f022                	sd	s0,32(sp)
     6ee:	ec26                	sd	s1,24(sp)
     6f0:	e84a                	sd	s2,16(sp)
     6f2:	e44e                	sd	s3,8(sp)
     6f4:	1800                	addi	s0,sp,48
     6f6:	89aa                	mv	s3,a0
     6f8:	892e                	mv	s2,a1
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     6fa:	4561                	li	a0,24
     6fc:	00001097          	auipc	ra,0x1
     700:	05c080e7          	jalr	92(ra) # 1758 <malloc>
     704:	84aa                	mv	s1,a0
  memset(cmd, 0, sizeof(*cmd));
     706:	4661                	li	a2,24
     708:	4581                	li	a1,0
     70a:	00001097          	auipc	ra,0x1
     70e:	9ce080e7          	jalr	-1586(ra) # 10d8 <memset>
  cmd->type = PIPE;
     712:	478d                	li	a5,3
     714:	c09c                	sw	a5,0(s1)
  cmd->left = left;
     716:	0134b423          	sd	s3,8(s1)
  cmd->right = right;
     71a:	0124b823          	sd	s2,16(s1)
  return (struct cmd*)cmd;
}
     71e:	8526                	mv	a0,s1
     720:	70a2                	ld	ra,40(sp)
     722:	7402                	ld	s0,32(sp)
     724:	64e2                	ld	s1,24(sp)
     726:	6942                	ld	s2,16(sp)
     728:	69a2                	ld	s3,8(sp)
     72a:	6145                	addi	sp,sp,48
     72c:	8082                	ret

000000000000072e <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     72e:	7179                	addi	sp,sp,-48
     730:	f406                	sd	ra,40(sp)
     732:	f022                	sd	s0,32(sp)
     734:	ec26                	sd	s1,24(sp)
     736:	e84a                	sd	s2,16(sp)
     738:	e44e                	sd	s3,8(sp)
     73a:	1800                	addi	s0,sp,48
     73c:	89aa                	mv	s3,a0
     73e:	892e                	mv	s2,a1
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     740:	4561                	li	a0,24
     742:	00001097          	auipc	ra,0x1
     746:	016080e7          	jalr	22(ra) # 1758 <malloc>
     74a:	84aa                	mv	s1,a0
  memset(cmd, 0, sizeof(*cmd));
     74c:	4661                	li	a2,24
     74e:	4581                	li	a1,0
     750:	00001097          	auipc	ra,0x1
     754:	988080e7          	jalr	-1656(ra) # 10d8 <memset>
  cmd->type = LIST;
     758:	4791                	li	a5,4
     75a:	c09c                	sw	a5,0(s1)
  cmd->left = left;
     75c:	0134b423          	sd	s3,8(s1)
  cmd->right = right;
     760:	0124b823          	sd	s2,16(s1)
  return (struct cmd*)cmd;
}
     764:	8526                	mv	a0,s1
     766:	70a2                	ld	ra,40(sp)
     768:	7402                	ld	s0,32(sp)
     76a:	64e2                	ld	s1,24(sp)
     76c:	6942                	ld	s2,16(sp)
     76e:	69a2                	ld	s3,8(sp)
     770:	6145                	addi	sp,sp,48
     772:	8082                	ret

0000000000000774 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     774:	1101                	addi	sp,sp,-32
     776:	ec06                	sd	ra,24(sp)
     778:	e822                	sd	s0,16(sp)
     77a:	e426                	sd	s1,8(sp)
     77c:	e04a                	sd	s2,0(sp)
     77e:	1000                	addi	s0,sp,32
     780:	892a                	mv	s2,a0
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     782:	4541                	li	a0,16
     784:	00001097          	auipc	ra,0x1
     788:	fd4080e7          	jalr	-44(ra) # 1758 <malloc>
     78c:	84aa                	mv	s1,a0
  memset(cmd, 0, sizeof(*cmd));
     78e:	4641                	li	a2,16
     790:	4581                	li	a1,0
     792:	00001097          	auipc	ra,0x1
     796:	946080e7          	jalr	-1722(ra) # 10d8 <memset>
  cmd->type = BACK;
     79a:	4795                	li	a5,5
     79c:	c09c                	sw	a5,0(s1)
  cmd->cmd = subcmd;
     79e:	0124b423          	sd	s2,8(s1)
  return (struct cmd*)cmd;
}
     7a2:	8526                	mv	a0,s1
     7a4:	60e2                	ld	ra,24(sp)
     7a6:	6442                	ld	s0,16(sp)
     7a8:	64a2                	ld	s1,8(sp)
     7aa:	6902                	ld	s2,0(sp)
     7ac:	6105                	addi	sp,sp,32
     7ae:	8082                	ret

00000000000007b0 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     7b0:	7139                	addi	sp,sp,-64
     7b2:	fc06                	sd	ra,56(sp)
     7b4:	f822                	sd	s0,48(sp)
     7b6:	f426                	sd	s1,40(sp)
     7b8:	f04a                	sd	s2,32(sp)
     7ba:	ec4e                	sd	s3,24(sp)
     7bc:	e852                	sd	s4,16(sp)
     7be:	e456                	sd	s5,8(sp)
     7c0:	e05a                	sd	s6,0(sp)
     7c2:	0080                	addi	s0,sp,64
     7c4:	8a2a                	mv	s4,a0
     7c6:	892e                	mv	s2,a1
     7c8:	8ab2                	mv	s5,a2
     7ca:	8b36                	mv	s6,a3
  char *s;
  int ret;

  s = *ps;
     7cc:	6104                	ld	s1,0(a0)
  while(s < es && strchr(whitespace, *s))
     7ce:	00001997          	auipc	s3,0x1
     7d2:	2d298993          	addi	s3,s3,722 # 1aa0 <whitespace>
     7d6:	00b4fe63          	bgeu	s1,a1,7f2 <gettoken+0x42>
     7da:	0004c583          	lbu	a1,0(s1)
     7de:	854e                	mv	a0,s3
     7e0:	00001097          	auipc	ra,0x1
     7e4:	91a080e7          	jalr	-1766(ra) # 10fa <strchr>
     7e8:	c509                	beqz	a0,7f2 <gettoken+0x42>
    s++;
     7ea:	0485                	addi	s1,s1,1
  while(s < es && strchr(whitespace, *s))
     7ec:	fe9917e3          	bne	s2,s1,7da <gettoken+0x2a>
    s++;
     7f0:	84ca                	mv	s1,s2
  if(q)
     7f2:	000a8463          	beqz	s5,7fa <gettoken+0x4a>
    *q = s;
     7f6:	009ab023          	sd	s1,0(s5)
  ret = *s;
     7fa:	0004c783          	lbu	a5,0(s1)
     7fe:	00078a9b          	sext.w	s5,a5
  switch(*s){
     802:	03c00713          	li	a4,60
     806:	06f76663          	bltu	a4,a5,872 <gettoken+0xc2>
     80a:	03a00713          	li	a4,58
     80e:	00f76e63          	bltu	a4,a5,82a <gettoken+0x7a>
     812:	cf89                	beqz	a5,82c <gettoken+0x7c>
     814:	02600713          	li	a4,38
     818:	00e78963          	beq	a5,a4,82a <gettoken+0x7a>
     81c:	fd87879b          	addiw	a5,a5,-40
     820:	0ff7f793          	zext.b	a5,a5
     824:	4705                	li	a4,1
     826:	06f76d63          	bltu	a4,a5,8a0 <gettoken+0xf0>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
     82a:	0485                	addi	s1,s1,1
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     82c:	000b0463          	beqz	s6,834 <gettoken+0x84>
    *eq = s;
     830:	009b3023          	sd	s1,0(s6)

  while(s < es && strchr(whitespace, *s))
     834:	00001997          	auipc	s3,0x1
     838:	26c98993          	addi	s3,s3,620 # 1aa0 <whitespace>
     83c:	0124fe63          	bgeu	s1,s2,858 <gettoken+0xa8>
     840:	0004c583          	lbu	a1,0(s1)
     844:	854e                	mv	a0,s3
     846:	00001097          	auipc	ra,0x1
     84a:	8b4080e7          	jalr	-1868(ra) # 10fa <strchr>
     84e:	c509                	beqz	a0,858 <gettoken+0xa8>
    s++;
     850:	0485                	addi	s1,s1,1
  while(s < es && strchr(whitespace, *s))
     852:	fe9917e3          	bne	s2,s1,840 <gettoken+0x90>
    s++;
     856:	84ca                	mv	s1,s2
  *ps = s;
     858:	009a3023          	sd	s1,0(s4)
  return ret;
}
     85c:	8556                	mv	a0,s5
     85e:	70e2                	ld	ra,56(sp)
     860:	7442                	ld	s0,48(sp)
     862:	74a2                	ld	s1,40(sp)
     864:	7902                	ld	s2,32(sp)
     866:	69e2                	ld	s3,24(sp)
     868:	6a42                	ld	s4,16(sp)
     86a:	6aa2                	ld	s5,8(sp)
     86c:	6b02                	ld	s6,0(sp)
     86e:	6121                	addi	sp,sp,64
     870:	8082                	ret
  switch(*s){
     872:	03e00713          	li	a4,62
     876:	02e79163          	bne	a5,a4,898 <gettoken+0xe8>
    s++;
     87a:	00148693          	addi	a3,s1,1
    if(*s == '>'){
     87e:	0014c703          	lbu	a4,1(s1)
     882:	03e00793          	li	a5,62
      s++;
     886:	0489                	addi	s1,s1,2
      ret = '+';
     888:	02b00a93          	li	s5,43
    if(*s == '>'){
     88c:	faf700e3          	beq	a4,a5,82c <gettoken+0x7c>
    s++;
     890:	84b6                	mv	s1,a3
  ret = *s;
     892:	03e00a93          	li	s5,62
     896:	bf59                	j	82c <gettoken+0x7c>
  switch(*s){
     898:	07c00713          	li	a4,124
     89c:	f8e787e3          	beq	a5,a4,82a <gettoken+0x7a>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     8a0:	00001997          	auipc	s3,0x1
     8a4:	20098993          	addi	s3,s3,512 # 1aa0 <whitespace>
     8a8:	00001a97          	auipc	s5,0x1
     8ac:	200a8a93          	addi	s5,s5,512 # 1aa8 <symbols>
     8b0:	0324f663          	bgeu	s1,s2,8dc <gettoken+0x12c>
     8b4:	0004c583          	lbu	a1,0(s1)
     8b8:	854e                	mv	a0,s3
     8ba:	00001097          	auipc	ra,0x1
     8be:	840080e7          	jalr	-1984(ra) # 10fa <strchr>
     8c2:	e50d                	bnez	a0,8ec <gettoken+0x13c>
     8c4:	0004c583          	lbu	a1,0(s1)
     8c8:	8556                	mv	a0,s5
     8ca:	00001097          	auipc	ra,0x1
     8ce:	830080e7          	jalr	-2000(ra) # 10fa <strchr>
     8d2:	e911                	bnez	a0,8e6 <gettoken+0x136>
      s++;
     8d4:	0485                	addi	s1,s1,1
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     8d6:	fc991fe3          	bne	s2,s1,8b4 <gettoken+0x104>
      s++;
     8da:	84ca                	mv	s1,s2
  if(eq)
     8dc:	06100a93          	li	s5,97
     8e0:	f40b18e3          	bnez	s6,830 <gettoken+0x80>
     8e4:	bf95                	j	858 <gettoken+0xa8>
    ret = 'a';
     8e6:	06100a93          	li	s5,97
     8ea:	b789                	j	82c <gettoken+0x7c>
     8ec:	06100a93          	li	s5,97
     8f0:	bf35                	j	82c <gettoken+0x7c>

00000000000008f2 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     8f2:	7139                	addi	sp,sp,-64
     8f4:	fc06                	sd	ra,56(sp)
     8f6:	f822                	sd	s0,48(sp)
     8f8:	f426                	sd	s1,40(sp)
     8fa:	f04a                	sd	s2,32(sp)
     8fc:	ec4e                	sd	s3,24(sp)
     8fe:	e852                	sd	s4,16(sp)
     900:	e456                	sd	s5,8(sp)
     902:	0080                	addi	s0,sp,64
     904:	8a2a                	mv	s4,a0
     906:	892e                	mv	s2,a1
     908:	8ab2                	mv	s5,a2
  char *s;

  s = *ps;
     90a:	6104                	ld	s1,0(a0)
  while(s < es && strchr(whitespace, *s))
     90c:	00001997          	auipc	s3,0x1
     910:	19498993          	addi	s3,s3,404 # 1aa0 <whitespace>
     914:	00b4fe63          	bgeu	s1,a1,930 <peek+0x3e>
     918:	0004c583          	lbu	a1,0(s1)
     91c:	854e                	mv	a0,s3
     91e:	00000097          	auipc	ra,0x0
     922:	7dc080e7          	jalr	2012(ra) # 10fa <strchr>
     926:	c509                	beqz	a0,930 <peek+0x3e>
    s++;
     928:	0485                	addi	s1,s1,1
  while(s < es && strchr(whitespace, *s))
     92a:	fe9917e3          	bne	s2,s1,918 <peek+0x26>
    s++;
     92e:	84ca                	mv	s1,s2
  *ps = s;
     930:	009a3023          	sd	s1,0(s4)
  return *s && strchr(toks, *s);
     934:	0004c583          	lbu	a1,0(s1)
     938:	4501                	li	a0,0
     93a:	e991                	bnez	a1,94e <peek+0x5c>
}
     93c:	70e2                	ld	ra,56(sp)
     93e:	7442                	ld	s0,48(sp)
     940:	74a2                	ld	s1,40(sp)
     942:	7902                	ld	s2,32(sp)
     944:	69e2                	ld	s3,24(sp)
     946:	6a42                	ld	s4,16(sp)
     948:	6aa2                	ld	s5,8(sp)
     94a:	6121                	addi	sp,sp,64
     94c:	8082                	ret
  return *s && strchr(toks, *s);
     94e:	8556                	mv	a0,s5
     950:	00000097          	auipc	ra,0x0
     954:	7aa080e7          	jalr	1962(ra) # 10fa <strchr>
     958:	00a03533          	snez	a0,a0
     95c:	b7c5                	j	93c <peek+0x4a>

000000000000095e <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     95e:	7119                	addi	sp,sp,-128
     960:	fc86                	sd	ra,120(sp)
     962:	f8a2                	sd	s0,112(sp)
     964:	f4a6                	sd	s1,104(sp)
     966:	f0ca                	sd	s2,96(sp)
     968:	ecce                	sd	s3,88(sp)
     96a:	e8d2                	sd	s4,80(sp)
     96c:	e4d6                	sd	s5,72(sp)
     96e:	e0da                	sd	s6,64(sp)
     970:	fc5e                	sd	s7,56(sp)
     972:	f862                	sd	s8,48(sp)
     974:	f466                	sd	s9,40(sp)
     976:	f06a                	sd	s10,32(sp)
     978:	ec6e                	sd	s11,24(sp)
     97a:	0100                	addi	s0,sp,128
     97c:	8a2a                	mv	s4,a0
     97e:	89ae                	mv	s3,a1
     980:	8932                	mv	s2,a2
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     982:	00001b97          	auipc	s7,0x1
     986:	f8eb8b93          	addi	s7,s7,-114 # 1910 <malloc+0x1b8>
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
     98a:	f8040d13          	addi	s10,s0,-128
     98e:	f8840c93          	addi	s9,s0,-120
     992:	06100c13          	li	s8,97
      panic("missing file for redirection");
    switch(tok){
     996:	03c00d93          	li	s11,60
  while(peek(ps, es, "<>")){
     99a:	a02d                	j	9c4 <parseredirs+0x66>
      panic("missing file for redirection");
     99c:	00001517          	auipc	a0,0x1
     9a0:	f5450513          	addi	a0,a0,-172 # 18f0 <malloc+0x198>
     9a4:	00000097          	auipc	ra,0x0
     9a8:	9fa080e7          	jalr	-1542(ra) # 39e <panic>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     9ac:	4701                	li	a4,0
     9ae:	4681                	li	a3,0
     9b0:	f8043603          	ld	a2,-128(s0)
     9b4:	f8843583          	ld	a1,-120(s0)
     9b8:	8552                	mv	a0,s4
     9ba:	00000097          	auipc	ra,0x0
     9be:	cc6080e7          	jalr	-826(ra) # 680 <redircmd>
     9c2:	8a2a                	mv	s4,a0
    switch(tok){
     9c4:	03e00b13          	li	s6,62
     9c8:	02b00a93          	li	s5,43
  while(peek(ps, es, "<>")){
     9cc:	865e                	mv	a2,s7
     9ce:	85ca                	mv	a1,s2
     9d0:	854e                	mv	a0,s3
     9d2:	00000097          	auipc	ra,0x0
     9d6:	f20080e7          	jalr	-224(ra) # 8f2 <peek>
     9da:	c535                	beqz	a0,a46 <parseredirs+0xe8>
    tok = gettoken(ps, es, 0, 0);
     9dc:	4681                	li	a3,0
     9de:	4601                	li	a2,0
     9e0:	85ca                	mv	a1,s2
     9e2:	854e                	mv	a0,s3
     9e4:	00000097          	auipc	ra,0x0
     9e8:	dcc080e7          	jalr	-564(ra) # 7b0 <gettoken>
     9ec:	84aa                	mv	s1,a0
    if(gettoken(ps, es, &q, &eq) != 'a')
     9ee:	86ea                	mv	a3,s10
     9f0:	8666                	mv	a2,s9
     9f2:	85ca                	mv	a1,s2
     9f4:	854e                	mv	a0,s3
     9f6:	00000097          	auipc	ra,0x0
     9fa:	dba080e7          	jalr	-582(ra) # 7b0 <gettoken>
     9fe:	f9851fe3          	bne	a0,s8,99c <parseredirs+0x3e>
    switch(tok){
     a02:	fbb485e3          	beq	s1,s11,9ac <parseredirs+0x4e>
     a06:	03648263          	beq	s1,s6,a2a <parseredirs+0xcc>
     a0a:	fd5491e3          	bne	s1,s5,9cc <parseredirs+0x6e>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE|O_TRUNC, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE|O_APPEND, 1);
     a0e:	4705                	li	a4,1
     a10:	04500693          	li	a3,69
     a14:	f8043603          	ld	a2,-128(s0)
     a18:	f8843583          	ld	a1,-120(s0)
     a1c:	8552                	mv	a0,s4
     a1e:	00000097          	auipc	ra,0x0
     a22:	c62080e7          	jalr	-926(ra) # 680 <redircmd>
     a26:	8a2a                	mv	s4,a0
      break;
     a28:	bf71                	j	9c4 <parseredirs+0x66>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE|O_TRUNC, 1);
     a2a:	4705                	li	a4,1
     a2c:	44100693          	li	a3,1089
     a30:	f8043603          	ld	a2,-128(s0)
     a34:	f8843583          	ld	a1,-120(s0)
     a38:	8552                	mv	a0,s4
     a3a:	00000097          	auipc	ra,0x0
     a3e:	c46080e7          	jalr	-954(ra) # 680 <redircmd>
     a42:	8a2a                	mv	s4,a0
      break;
     a44:	b741                	j	9c4 <parseredirs+0x66>
    }
  }
  return cmd;
}
     a46:	8552                	mv	a0,s4
     a48:	70e6                	ld	ra,120(sp)
     a4a:	7446                	ld	s0,112(sp)
     a4c:	74a6                	ld	s1,104(sp)
     a4e:	7906                	ld	s2,96(sp)
     a50:	69e6                	ld	s3,88(sp)
     a52:	6a46                	ld	s4,80(sp)
     a54:	6aa6                	ld	s5,72(sp)
     a56:	6b06                	ld	s6,64(sp)
     a58:	7be2                	ld	s7,56(sp)
     a5a:	7c42                	ld	s8,48(sp)
     a5c:	7ca2                	ld	s9,40(sp)
     a5e:	7d02                	ld	s10,32(sp)
     a60:	6de2                	ld	s11,24(sp)
     a62:	6109                	addi	sp,sp,128
     a64:	8082                	ret

0000000000000a66 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     a66:	7119                	addi	sp,sp,-128
     a68:	fc86                	sd	ra,120(sp)
     a6a:	f8a2                	sd	s0,112(sp)
     a6c:	f4a6                	sd	s1,104(sp)
     a6e:	f0ca                	sd	s2,96(sp)
     a70:	ecce                	sd	s3,88(sp)
     a72:	e8d2                	sd	s4,80(sp)
     a74:	e4d6                	sd	s5,72(sp)
     a76:	e0da                	sd	s6,64(sp)
     a78:	fc5e                	sd	s7,56(sp)
     a7a:	f862                	sd	s8,48(sp)
     a7c:	f466                	sd	s9,40(sp)
     a7e:	f06a                	sd	s10,32(sp)
     a80:	ec6e                	sd	s11,24(sp)
     a82:	0100                	addi	s0,sp,128
     a84:	8a2a                	mv	s4,a0
     a86:	8aae                	mv	s5,a1
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     a88:	00001617          	auipc	a2,0x1
     a8c:	e9060613          	addi	a2,a2,-368 # 1918 <malloc+0x1c0>
     a90:	00000097          	auipc	ra,0x0
     a94:	e62080e7          	jalr	-414(ra) # 8f2 <peek>
     a98:	ed05                	bnez	a0,ad0 <parseexec+0x6a>
     a9a:	89aa                	mv	s3,a0
    return parseblock(ps, es);

  ret = execcmd();
     a9c:	00000097          	auipc	ra,0x0
     aa0:	bae080e7          	jalr	-1106(ra) # 64a <execcmd>
     aa4:	8daa                	mv	s11,a0
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     aa6:	8656                	mv	a2,s5
     aa8:	85d2                	mv	a1,s4
     aaa:	00000097          	auipc	ra,0x0
     aae:	eb4080e7          	jalr	-332(ra) # 95e <parseredirs>
     ab2:	84aa                	mv	s1,a0
  while(!peek(ps, es, "|)&;")){
     ab4:	008d8913          	addi	s2,s11,8
     ab8:	00001b17          	auipc	s6,0x1
     abc:	e80b0b13          	addi	s6,s6,-384 # 1938 <malloc+0x1e0>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     ac0:	f8040c13          	addi	s8,s0,-128
     ac4:	f8840b93          	addi	s7,s0,-120
      break;
    if(tok != 'a')
     ac8:	06100d13          	li	s10,97
      panic("syntax");
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
     acc:	4ca9                	li	s9,10
  while(!peek(ps, es, "|)&;")){
     ace:	a881                	j	b1e <parseexec+0xb8>
    return parseblock(ps, es);
     ad0:	85d6                	mv	a1,s5
     ad2:	8552                	mv	a0,s4
     ad4:	00000097          	auipc	ra,0x0
     ad8:	1bc080e7          	jalr	444(ra) # c90 <parseblock>
     adc:	84aa                	mv	s1,a0
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     ade:	8526                	mv	a0,s1
     ae0:	70e6                	ld	ra,120(sp)
     ae2:	7446                	ld	s0,112(sp)
     ae4:	74a6                	ld	s1,104(sp)
     ae6:	7906                	ld	s2,96(sp)
     ae8:	69e6                	ld	s3,88(sp)
     aea:	6a46                	ld	s4,80(sp)
     aec:	6aa6                	ld	s5,72(sp)
     aee:	6b06                	ld	s6,64(sp)
     af0:	7be2                	ld	s7,56(sp)
     af2:	7c42                	ld	s8,48(sp)
     af4:	7ca2                	ld	s9,40(sp)
     af6:	7d02                	ld	s10,32(sp)
     af8:	6de2                	ld	s11,24(sp)
     afa:	6109                	addi	sp,sp,128
     afc:	8082                	ret
      panic("syntax");
     afe:	00001517          	auipc	a0,0x1
     b02:	e2250513          	addi	a0,a0,-478 # 1920 <malloc+0x1c8>
     b06:	00000097          	auipc	ra,0x0
     b0a:	898080e7          	jalr	-1896(ra) # 39e <panic>
    ret = parseredirs(ret, ps, es);
     b0e:	8656                	mv	a2,s5
     b10:	85d2                	mv	a1,s4
     b12:	8526                	mv	a0,s1
     b14:	00000097          	auipc	ra,0x0
     b18:	e4a080e7          	jalr	-438(ra) # 95e <parseredirs>
     b1c:	84aa                	mv	s1,a0
  while(!peek(ps, es, "|)&;")){
     b1e:	865a                	mv	a2,s6
     b20:	85d6                	mv	a1,s5
     b22:	8552                	mv	a0,s4
     b24:	00000097          	auipc	ra,0x0
     b28:	dce080e7          	jalr	-562(ra) # 8f2 <peek>
     b2c:	e121                	bnez	a0,b6c <parseexec+0x106>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     b2e:	86e2                	mv	a3,s8
     b30:	865e                	mv	a2,s7
     b32:	85d6                	mv	a1,s5
     b34:	8552                	mv	a0,s4
     b36:	00000097          	auipc	ra,0x0
     b3a:	c7a080e7          	jalr	-902(ra) # 7b0 <gettoken>
     b3e:	c51d                	beqz	a0,b6c <parseexec+0x106>
    if(tok != 'a')
     b40:	fba51fe3          	bne	a0,s10,afe <parseexec+0x98>
    cmd->argv[argc] = q;
     b44:	f8843783          	ld	a5,-120(s0)
     b48:	00f93023          	sd	a5,0(s2)
    cmd->eargv[argc] = eq;
     b4c:	f8043783          	ld	a5,-128(s0)
     b50:	04f93823          	sd	a5,80(s2)
    argc++;
     b54:	2985                	addiw	s3,s3,1
    if(argc >= MAXARGS)
     b56:	0921                	addi	s2,s2,8
     b58:	fb999be3          	bne	s3,s9,b0e <parseexec+0xa8>
      panic("too many args");
     b5c:	00001517          	auipc	a0,0x1
     b60:	dcc50513          	addi	a0,a0,-564 # 1928 <malloc+0x1d0>
     b64:	00000097          	auipc	ra,0x0
     b68:	83a080e7          	jalr	-1990(ra) # 39e <panic>
  cmd->argv[argc] = 0;
     b6c:	098e                	slli	s3,s3,0x3
     b6e:	9dce                	add	s11,s11,s3
     b70:	000db423          	sd	zero,8(s11)
  cmd->eargv[argc] = 0;
     b74:	040dbc23          	sd	zero,88(s11)
  return ret;
     b78:	b79d                	j	ade <parseexec+0x78>

0000000000000b7a <parsepipe>:
{
     b7a:	7179                	addi	sp,sp,-48
     b7c:	f406                	sd	ra,40(sp)
     b7e:	f022                	sd	s0,32(sp)
     b80:	ec26                	sd	s1,24(sp)
     b82:	e84a                	sd	s2,16(sp)
     b84:	e44e                	sd	s3,8(sp)
     b86:	1800                	addi	s0,sp,48
     b88:	892a                	mv	s2,a0
     b8a:	89ae                	mv	s3,a1
  cmd = parseexec(ps, es);
     b8c:	00000097          	auipc	ra,0x0
     b90:	eda080e7          	jalr	-294(ra) # a66 <parseexec>
     b94:	84aa                	mv	s1,a0
  if(peek(ps, es, "|")){
     b96:	00001617          	auipc	a2,0x1
     b9a:	daa60613          	addi	a2,a2,-598 # 1940 <malloc+0x1e8>
     b9e:	85ce                	mv	a1,s3
     ba0:	854a                	mv	a0,s2
     ba2:	00000097          	auipc	ra,0x0
     ba6:	d50080e7          	jalr	-688(ra) # 8f2 <peek>
     baa:	e909                	bnez	a0,bbc <parsepipe+0x42>
}
     bac:	8526                	mv	a0,s1
     bae:	70a2                	ld	ra,40(sp)
     bb0:	7402                	ld	s0,32(sp)
     bb2:	64e2                	ld	s1,24(sp)
     bb4:	6942                	ld	s2,16(sp)
     bb6:	69a2                	ld	s3,8(sp)
     bb8:	6145                	addi	sp,sp,48
     bba:	8082                	ret
    gettoken(ps, es, 0, 0);
     bbc:	4681                	li	a3,0
     bbe:	4601                	li	a2,0
     bc0:	85ce                	mv	a1,s3
     bc2:	854a                	mv	a0,s2
     bc4:	00000097          	auipc	ra,0x0
     bc8:	bec080e7          	jalr	-1044(ra) # 7b0 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     bcc:	85ce                	mv	a1,s3
     bce:	854a                	mv	a0,s2
     bd0:	00000097          	auipc	ra,0x0
     bd4:	faa080e7          	jalr	-86(ra) # b7a <parsepipe>
     bd8:	85aa                	mv	a1,a0
     bda:	8526                	mv	a0,s1
     bdc:	00000097          	auipc	ra,0x0
     be0:	b0c080e7          	jalr	-1268(ra) # 6e8 <pipecmd>
     be4:	84aa                	mv	s1,a0
  return cmd;
     be6:	b7d9                	j	bac <parsepipe+0x32>

0000000000000be8 <parseline>:
{
     be8:	7179                	addi	sp,sp,-48
     bea:	f406                	sd	ra,40(sp)
     bec:	f022                	sd	s0,32(sp)
     bee:	ec26                	sd	s1,24(sp)
     bf0:	e84a                	sd	s2,16(sp)
     bf2:	e44e                	sd	s3,8(sp)
     bf4:	e052                	sd	s4,0(sp)
     bf6:	1800                	addi	s0,sp,48
     bf8:	892a                	mv	s2,a0
     bfa:	89ae                	mv	s3,a1
  cmd = parsepipe(ps, es);
     bfc:	00000097          	auipc	ra,0x0
     c00:	f7e080e7          	jalr	-130(ra) # b7a <parsepipe>
     c04:	84aa                	mv	s1,a0
  while(peek(ps, es, "&")){
     c06:	00001a17          	auipc	s4,0x1
     c0a:	d42a0a13          	addi	s4,s4,-702 # 1948 <malloc+0x1f0>
     c0e:	a839                	j	c2c <parseline+0x44>
    gettoken(ps, es, 0, 0);
     c10:	4681                	li	a3,0
     c12:	4601                	li	a2,0
     c14:	85ce                	mv	a1,s3
     c16:	854a                	mv	a0,s2
     c18:	00000097          	auipc	ra,0x0
     c1c:	b98080e7          	jalr	-1128(ra) # 7b0 <gettoken>
    cmd = backcmd(cmd);
     c20:	8526                	mv	a0,s1
     c22:	00000097          	auipc	ra,0x0
     c26:	b52080e7          	jalr	-1198(ra) # 774 <backcmd>
     c2a:	84aa                	mv	s1,a0
  while(peek(ps, es, "&")){
     c2c:	8652                	mv	a2,s4
     c2e:	85ce                	mv	a1,s3
     c30:	854a                	mv	a0,s2
     c32:	00000097          	auipc	ra,0x0
     c36:	cc0080e7          	jalr	-832(ra) # 8f2 <peek>
     c3a:	f979                	bnez	a0,c10 <parseline+0x28>
  if(peek(ps, es, ";")){
     c3c:	00001617          	auipc	a2,0x1
     c40:	d1460613          	addi	a2,a2,-748 # 1950 <malloc+0x1f8>
     c44:	85ce                	mv	a1,s3
     c46:	854a                	mv	a0,s2
     c48:	00000097          	auipc	ra,0x0
     c4c:	caa080e7          	jalr	-854(ra) # 8f2 <peek>
     c50:	e911                	bnez	a0,c64 <parseline+0x7c>
}
     c52:	8526                	mv	a0,s1
     c54:	70a2                	ld	ra,40(sp)
     c56:	7402                	ld	s0,32(sp)
     c58:	64e2                	ld	s1,24(sp)
     c5a:	6942                	ld	s2,16(sp)
     c5c:	69a2                	ld	s3,8(sp)
     c5e:	6a02                	ld	s4,0(sp)
     c60:	6145                	addi	sp,sp,48
     c62:	8082                	ret
    gettoken(ps, es, 0, 0);
     c64:	4681                	li	a3,0
     c66:	4601                	li	a2,0
     c68:	85ce                	mv	a1,s3
     c6a:	854a                	mv	a0,s2
     c6c:	00000097          	auipc	ra,0x0
     c70:	b44080e7          	jalr	-1212(ra) # 7b0 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     c74:	85ce                	mv	a1,s3
     c76:	854a                	mv	a0,s2
     c78:	00000097          	auipc	ra,0x0
     c7c:	f70080e7          	jalr	-144(ra) # be8 <parseline>
     c80:	85aa                	mv	a1,a0
     c82:	8526                	mv	a0,s1
     c84:	00000097          	auipc	ra,0x0
     c88:	aaa080e7          	jalr	-1366(ra) # 72e <listcmd>
     c8c:	84aa                	mv	s1,a0
  return cmd;
     c8e:	b7d1                	j	c52 <parseline+0x6a>

0000000000000c90 <parseblock>:
{
     c90:	7179                	addi	sp,sp,-48
     c92:	f406                	sd	ra,40(sp)
     c94:	f022                	sd	s0,32(sp)
     c96:	ec26                	sd	s1,24(sp)
     c98:	e84a                	sd	s2,16(sp)
     c9a:	e44e                	sd	s3,8(sp)
     c9c:	1800                	addi	s0,sp,48
     c9e:	84aa                	mv	s1,a0
     ca0:	892e                	mv	s2,a1
  if(!peek(ps, es, "("))
     ca2:	00001617          	auipc	a2,0x1
     ca6:	c7660613          	addi	a2,a2,-906 # 1918 <malloc+0x1c0>
     caa:	00000097          	auipc	ra,0x0
     cae:	c48080e7          	jalr	-952(ra) # 8f2 <peek>
     cb2:	c12d                	beqz	a0,d14 <parseblock+0x84>
  gettoken(ps, es, 0, 0);
     cb4:	4681                	li	a3,0
     cb6:	4601                	li	a2,0
     cb8:	85ca                	mv	a1,s2
     cba:	8526                	mv	a0,s1
     cbc:	00000097          	auipc	ra,0x0
     cc0:	af4080e7          	jalr	-1292(ra) # 7b0 <gettoken>
  cmd = parseline(ps, es);
     cc4:	85ca                	mv	a1,s2
     cc6:	8526                	mv	a0,s1
     cc8:	00000097          	auipc	ra,0x0
     ccc:	f20080e7          	jalr	-224(ra) # be8 <parseline>
     cd0:	89aa                	mv	s3,a0
  if(!peek(ps, es, ")"))
     cd2:	00001617          	auipc	a2,0x1
     cd6:	c9660613          	addi	a2,a2,-874 # 1968 <malloc+0x210>
     cda:	85ca                	mv	a1,s2
     cdc:	8526                	mv	a0,s1
     cde:	00000097          	auipc	ra,0x0
     ce2:	c14080e7          	jalr	-1004(ra) # 8f2 <peek>
     ce6:	cd1d                	beqz	a0,d24 <parseblock+0x94>
  gettoken(ps, es, 0, 0);
     ce8:	4681                	li	a3,0
     cea:	4601                	li	a2,0
     cec:	85ca                	mv	a1,s2
     cee:	8526                	mv	a0,s1
     cf0:	00000097          	auipc	ra,0x0
     cf4:	ac0080e7          	jalr	-1344(ra) # 7b0 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     cf8:	864a                	mv	a2,s2
     cfa:	85a6                	mv	a1,s1
     cfc:	854e                	mv	a0,s3
     cfe:	00000097          	auipc	ra,0x0
     d02:	c60080e7          	jalr	-928(ra) # 95e <parseredirs>
}
     d06:	70a2                	ld	ra,40(sp)
     d08:	7402                	ld	s0,32(sp)
     d0a:	64e2                	ld	s1,24(sp)
     d0c:	6942                	ld	s2,16(sp)
     d0e:	69a2                	ld	s3,8(sp)
     d10:	6145                	addi	sp,sp,48
     d12:	8082                	ret
    panic("parseblock");
     d14:	00001517          	auipc	a0,0x1
     d18:	c4450513          	addi	a0,a0,-956 # 1958 <malloc+0x200>
     d1c:	fffff097          	auipc	ra,0xfffff
     d20:	682080e7          	jalr	1666(ra) # 39e <panic>
    panic("syntax - missing )");
     d24:	00001517          	auipc	a0,0x1
     d28:	c4c50513          	addi	a0,a0,-948 # 1970 <malloc+0x218>
     d2c:	fffff097          	auipc	ra,0xfffff
     d30:	672080e7          	jalr	1650(ra) # 39e <panic>

0000000000000d34 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     d34:	1101                	addi	sp,sp,-32
     d36:	ec06                	sd	ra,24(sp)
     d38:	e822                	sd	s0,16(sp)
     d3a:	e426                	sd	s1,8(sp)
     d3c:	1000                	addi	s0,sp,32
     d3e:	84aa                	mv	s1,a0
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     d40:	c521                	beqz	a0,d88 <nulterminate+0x54>
    return 0;

  switch(cmd->type){
     d42:	4118                	lw	a4,0(a0)
     d44:	4795                	li	a5,5
     d46:	04e7e163          	bltu	a5,a4,d88 <nulterminate+0x54>
     d4a:	00056783          	lwu	a5,0(a0)
     d4e:	078a                	slli	a5,a5,0x2
     d50:	00001717          	auipc	a4,0x1
     d54:	cc070713          	addi	a4,a4,-832 # 1a10 <malloc+0x2b8>
     d58:	97ba                	add	a5,a5,a4
     d5a:	439c                	lw	a5,0(a5)
     d5c:	97ba                	add	a5,a5,a4
     d5e:	8782                	jr	a5
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     d60:	651c                	ld	a5,8(a0)
     d62:	c39d                	beqz	a5,d88 <nulterminate+0x54>
     d64:	01050793          	addi	a5,a0,16
      *ecmd->eargv[i] = 0;
     d68:	67b8                	ld	a4,72(a5)
     d6a:	00070023          	sb	zero,0(a4)
    for(i=0; ecmd->argv[i]; i++)
     d6e:	07a1                	addi	a5,a5,8
     d70:	ff87b703          	ld	a4,-8(a5)
     d74:	fb75                	bnez	a4,d68 <nulterminate+0x34>
     d76:	a809                	j	d88 <nulterminate+0x54>
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
     d78:	6508                	ld	a0,8(a0)
     d7a:	00000097          	auipc	ra,0x0
     d7e:	fba080e7          	jalr	-70(ra) # d34 <nulterminate>
    *rcmd->efile = 0;
     d82:	6c9c                	ld	a5,24(s1)
     d84:	00078023          	sb	zero,0(a5)
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
     d88:	8526                	mv	a0,s1
     d8a:	60e2                	ld	ra,24(sp)
     d8c:	6442                	ld	s0,16(sp)
     d8e:	64a2                	ld	s1,8(sp)
     d90:	6105                	addi	sp,sp,32
     d92:	8082                	ret
    nulterminate(pcmd->left);
     d94:	6508                	ld	a0,8(a0)
     d96:	00000097          	auipc	ra,0x0
     d9a:	f9e080e7          	jalr	-98(ra) # d34 <nulterminate>
    nulterminate(pcmd->right);
     d9e:	6888                	ld	a0,16(s1)
     da0:	00000097          	auipc	ra,0x0
     da4:	f94080e7          	jalr	-108(ra) # d34 <nulterminate>
    break;
     da8:	b7c5                	j	d88 <nulterminate+0x54>
    nulterminate(lcmd->left);
     daa:	6508                	ld	a0,8(a0)
     dac:	00000097          	auipc	ra,0x0
     db0:	f88080e7          	jalr	-120(ra) # d34 <nulterminate>
    nulterminate(lcmd->right);
     db4:	6888                	ld	a0,16(s1)
     db6:	00000097          	auipc	ra,0x0
     dba:	f7e080e7          	jalr	-130(ra) # d34 <nulterminate>
    break;
     dbe:	b7e9                	j	d88 <nulterminate+0x54>
    nulterminate(bcmd->cmd);
     dc0:	6508                	ld	a0,8(a0)
     dc2:	00000097          	auipc	ra,0x0
     dc6:	f72080e7          	jalr	-142(ra) # d34 <nulterminate>
    break;
     dca:	bf7d                	j	d88 <nulterminate+0x54>

0000000000000dcc <parsecmd>:
{
     dcc:	7139                	addi	sp,sp,-64
     dce:	fc06                	sd	ra,56(sp)
     dd0:	f822                	sd	s0,48(sp)
     dd2:	f426                	sd	s1,40(sp)
     dd4:	f04a                	sd	s2,32(sp)
     dd6:	ec4e                	sd	s3,24(sp)
     dd8:	0080                	addi	s0,sp,64
     dda:	fca43423          	sd	a0,-56(s0)
  es = s + strlen(s);
     dde:	84aa                	mv	s1,a0
     de0:	00000097          	auipc	ra,0x0
     de4:	2ce080e7          	jalr	718(ra) # 10ae <strlen>
     de8:	1502                	slli	a0,a0,0x20
     dea:	9101                	srli	a0,a0,0x20
     dec:	94aa                	add	s1,s1,a0
  cmd = parseline(&s, es);
     dee:	85a6                	mv	a1,s1
     df0:	fc840913          	addi	s2,s0,-56
     df4:	854a                	mv	a0,s2
     df6:	00000097          	auipc	ra,0x0
     dfa:	df2080e7          	jalr	-526(ra) # be8 <parseline>
     dfe:	89aa                	mv	s3,a0
  peek(&s, es, "");
     e00:	00001617          	auipc	a2,0x1
     e04:	be060613          	addi	a2,a2,-1056 # 19e0 <malloc+0x288>
     e08:	85a6                	mv	a1,s1
     e0a:	854a                	mv	a0,s2
     e0c:	00000097          	auipc	ra,0x0
     e10:	ae6080e7          	jalr	-1306(ra) # 8f2 <peek>
  if(s != es){
     e14:	fc843603          	ld	a2,-56(s0)
     e18:	00961f63          	bne	a2,s1,e36 <parsecmd+0x6a>
  nulterminate(cmd);
     e1c:	854e                	mv	a0,s3
     e1e:	00000097          	auipc	ra,0x0
     e22:	f16080e7          	jalr	-234(ra) # d34 <nulterminate>
}
     e26:	854e                	mv	a0,s3
     e28:	70e2                	ld	ra,56(sp)
     e2a:	7442                	ld	s0,48(sp)
     e2c:	74a2                	ld	s1,40(sp)
     e2e:	7902                	ld	s2,32(sp)
     e30:	69e2                	ld	s3,24(sp)
     e32:	6121                	addi	sp,sp,64
     e34:	8082                	ret
    fprintf(2, "leftovers: %s\n", s);
     e36:	00001597          	auipc	a1,0x1
     e3a:	b5258593          	addi	a1,a1,-1198 # 1988 <malloc+0x230>
     e3e:	4509                	li	a0,2
     e40:	00001097          	auipc	ra,0x1
     e44:	832080e7          	jalr	-1998(ra) # 1672 <fprintf>
    panic("syntax");
     e48:	00001517          	auipc	a0,0x1
     e4c:	ad850513          	addi	a0,a0,-1320 # 1920 <malloc+0x1c8>
     e50:	fffff097          	auipc	ra,0xfffff
     e54:	54e080e7          	jalr	1358(ra) # 39e <panic>

0000000000000e58 <main>:
{
     e58:	711d                	addi	sp,sp,-96
     e5a:	ec86                	sd	ra,88(sp)
     e5c:	e8a2                	sd	s0,80(sp)
     e5e:	e4a6                	sd	s1,72(sp)
     e60:	e0ca                	sd	s2,64(sp)
     e62:	fc4e                	sd	s3,56(sp)
     e64:	f852                	sd	s4,48(sp)
     e66:	f456                	sd	s5,40(sp)
     e68:	f05a                	sd	s6,32(sp)
     e6a:	ec5e                	sd	s7,24(sp)
     e6c:	e862                	sd	s8,16(sp)
     e6e:	e466                	sd	s9,8(sp)
     e70:	1080                	addi	s0,sp,96
  while((fd = dev(O_RDWR, 1, 0)) >= 0){
     e72:	4601                	li	a2,0
     e74:	4585                	li	a1,1
     e76:	4509                	li	a0,2
     e78:	00000097          	auipc	ra,0x0
     e7c:	508080e7          	jalr	1288(ra) # 1380 <dev>
     e80:	00054963          	bltz	a0,e92 <main+0x3a>
    if(fd >= 3){
     e84:	4789                	li	a5,2
     e86:	fea7d6e3          	bge	a5,a0,e72 <main+0x1a>
      close(fd);
     e8a:	00000097          	auipc	ra,0x0
     e8e:	48e080e7          	jalr	1166(ra) # 1318 <close>
  strcpy(envs[nenv].name, "SHELL");
     e92:	00001497          	auipc	s1,0x1
     e96:	c1e48493          	addi	s1,s1,-994 # 1ab0 <nenv>
     e9a:	4088                	lw	a0,0(s1)
     e9c:	051e                	slli	a0,a0,0x7
     e9e:	00001917          	auipc	s2,0x1
     ea2:	d0290913          	addi	s2,s2,-766 # 1ba0 <envs>
     ea6:	00001597          	auipc	a1,0x1
     eaa:	af258593          	addi	a1,a1,-1294 # 1998 <malloc+0x240>
     eae:	954a                	add	a0,a0,s2
     eb0:	00000097          	auipc	ra,0x0
     eb4:	188080e7          	jalr	392(ra) # 1038 <strcpy>
  strcpy(envs[nenv].value, "/bin");
     eb8:	4088                	lw	a0,0(s1)
     eba:	051e                	slli	a0,a0,0x7
     ebc:	02050513          	addi	a0,a0,32
     ec0:	00001597          	auipc	a1,0x1
     ec4:	ae058593          	addi	a1,a1,-1312 # 19a0 <malloc+0x248>
     ec8:	954a                	add	a0,a0,s2
     eca:	00000097          	auipc	ra,0x0
     ece:	16e080e7          	jalr	366(ra) # 1038 <strcpy>
  nenv++;
     ed2:	409c                	lw	a5,0(s1)
     ed4:	2785                	addiw	a5,a5,1
     ed6:	c09c                	sw	a5,0(s1)
  getcwd(mycwd);
     ed8:	00001517          	auipc	a0,0x1
     edc:	be050513          	addi	a0,a0,-1056 # 1ab8 <mycwd>
     ee0:	00000097          	auipc	ra,0x0
     ee4:	4b4080e7          	jalr	1204(ra) # 1394 <getcwd>
  while(getcmd(buf, sizeof(buf)) >= 0){
     ee8:	00001917          	auipc	s2,0x1
     eec:	c5090913          	addi	s2,s2,-944 # 1b38 <buf.0>
    replace(buf);
     ef0:	89a6                	mv	s3,s1
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     ef2:	06300a13          	li	s4,99
      else if(!strcmp(ecmd->argv[0], "export"))
     ef6:	00001a97          	auipc	s5,0x1
     efa:	ac2a8a93          	addi	s5,s5,-1342 # 19b8 <malloc+0x260>
          fprintf(2, "export failed\n");
     efe:	00001b97          	auipc	s7,0x1
     f02:	aeab8b93          	addi	s7,s7,-1302 # 19e8 <malloc+0x290>
          fprintf(2, "Usage: export [-p] [NAME=VALUE]\n");
     f06:	00001b17          	auipc	s6,0x1
     f0a:	abab0b13          	addi	s6,s6,-1350 # 19c0 <malloc+0x268>
      if(chdir(buf+3) < 0)
     f0e:	00001c17          	auipc	s8,0x1
     f12:	c2dc0c13          	addi	s8,s8,-979 # 1b3b <buf.0+0x3>
      getcwd(mycwd);
     f16:	00001c97          	auipc	s9,0x1
     f1a:	ba2c8c93          	addi	s9,s9,-1118 # 1ab8 <mycwd>
  while(getcmd(buf, sizeof(buf)) >= 0){
     f1e:	a8a5                	j	f96 <main+0x13e>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     f20:	08a9c703          	lbu	a4,138(s3)
     f24:	02000793          	li	a5,32
     f28:	08f71f63          	bne	a4,a5,fc6 <main+0x16e>
      buf[strlen(buf)-1] = 0;  // chop \n
     f2c:	854a                	mv	a0,s2
     f2e:	00000097          	auipc	ra,0x0
     f32:	180080e7          	jalr	384(ra) # 10ae <strlen>
     f36:	fff5079b          	addiw	a5,a0,-1
     f3a:	1782                	slli	a5,a5,0x20
     f3c:	9381                	srli	a5,a5,0x20
     f3e:	97ce                	add	a5,a5,s3
     f40:	08078423          	sb	zero,136(a5)
      if(chdir(buf+3) < 0)
     f44:	8562                	mv	a0,s8
     f46:	00000097          	auipc	ra,0x0
     f4a:	402080e7          	jalr	1026(ra) # 1348 <chdir>
     f4e:	00054863          	bltz	a0,f5e <main+0x106>
      getcwd(mycwd);
     f52:	8566                	mv	a0,s9
     f54:	00000097          	auipc	ra,0x0
     f58:	440080e7          	jalr	1088(ra) # 1394 <getcwd>
     f5c:	a82d                	j	f96 <main+0x13e>
        fprintf(2, "cannot cd %s\n", buf+3);
     f5e:	8662                	mv	a2,s8
     f60:	00001597          	auipc	a1,0x1
     f64:	a4858593          	addi	a1,a1,-1464 # 19a8 <malloc+0x250>
     f68:	4509                	li	a0,2
     f6a:	00000097          	auipc	ra,0x0
     f6e:	708080e7          	jalr	1800(ra) # 1672 <fprintf>
     f72:	b7c5                	j	f52 <main+0xfa>
        free(cmd);
     f74:	8526                	mv	a0,s1
     f76:	00000097          	auipc	ra,0x0
     f7a:	760080e7          	jalr	1888(ra) # 16d6 <free>
        continue;
     f7e:	a821                	j	f96 <main+0x13e>
          fprintf(2, "Usage: export [-p] [NAME=VALUE]\n");
     f80:	85da                	mv	a1,s6
     f82:	4509                	li	a0,2
     f84:	00000097          	auipc	ra,0x0
     f88:	6ee080e7          	jalr	1774(ra) # 1672 <fprintf>
        free(cmd);
     f8c:	8526                	mv	a0,s1
     f8e:	00000097          	auipc	ra,0x0
     f92:	748080e7          	jalr	1864(ra) # 16d6 <free>
  while(getcmd(buf, sizeof(buf)) >= 0){
     f96:	06400593          	li	a1,100
     f9a:	854a                	mv	a0,s2
     f9c:	fffff097          	auipc	ra,0xfffff
     fa0:	3a6080e7          	jalr	934(ra) # 342 <getcmd>
     fa4:	08054563          	bltz	a0,102e <main+0x1d6>
    replace(buf);
     fa8:	854a                	mv	a0,s2
     faa:	fffff097          	auipc	ra,0xfffff
     fae:	254080e7          	jalr	596(ra) # 1fe <replace>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     fb2:	0889c783          	lbu	a5,136(s3)
     fb6:	01479863          	bne	a5,s4,fc6 <main+0x16e>
     fba:	0899c703          	lbu	a4,137(s3)
     fbe:	06400793          	li	a5,100
     fc2:	f4f70fe3          	beq	a4,a5,f20 <main+0xc8>
      struct cmd *cmd = parsecmd(buf);
     fc6:	854a                	mv	a0,s2
     fc8:	00000097          	auipc	ra,0x0
     fcc:	e04080e7          	jalr	-508(ra) # dcc <parsecmd>
     fd0:	84aa                	mv	s1,a0
      if(ecmd->argv[0] == 0) {
     fd2:	6508                	ld	a0,8(a0)
     fd4:	d145                	beqz	a0,f74 <main+0x11c>
      else if(!strcmp(ecmd->argv[0], "export"))
     fd6:	85d6                	mv	a1,s5
     fd8:	00000097          	auipc	ra,0x0
     fdc:	0aa080e7          	jalr	170(ra) # 1082 <strcmp>
     fe0:	e115                	bnez	a0,1004 <main+0x1ac>
        if(ecmd->argv[1] == NULL)
     fe2:	689c                	ld	a5,16(s1)
     fe4:	dfd1                	beqz	a5,f80 <main+0x128>
        else if(export(ecmd->argv) < 0)
     fe6:	00848513          	addi	a0,s1,8
     fea:	fffff097          	auipc	ra,0xfffff
     fee:	07c080e7          	jalr	124(ra) # 66 <export>
     ff2:	f8055de3          	bgez	a0,f8c <main+0x134>
          fprintf(2, "export failed\n");
     ff6:	85de                	mv	a1,s7
     ff8:	4509                	li	a0,2
     ffa:	00000097          	auipc	ra,0x0
     ffe:	678080e7          	jalr	1656(ra) # 1672 <fprintf>
    1002:	b769                	j	f8c <main+0x134>
      else if(fork1() == 0) 
    1004:	fffff097          	auipc	ra,0xfffff
    1008:	3c0080e7          	jalr	960(ra) # 3c4 <fork1>
    100c:	cd01                	beqz	a0,1024 <main+0x1cc>
      wait(0);
    100e:	4501                	li	a0,0
    1010:	00000097          	auipc	ra,0x0
    1014:	2e8080e7          	jalr	744(ra) # 12f8 <wait>
      free(cmd);
    1018:	8526                	mv	a0,s1
    101a:	00000097          	auipc	ra,0x0
    101e:	6bc080e7          	jalr	1724(ra) # 16d6 <free>
    1022:	bf95                	j	f96 <main+0x13e>
        runcmd(cmd);
    1024:	8526                	mv	a0,s1
    1026:	fffff097          	auipc	ra,0xfffff
    102a:	3cc080e7          	jalr	972(ra) # 3f2 <runcmd>
  exit(0);
    102e:	4501                	li	a0,0
    1030:	00000097          	auipc	ra,0x0
    1034:	2c0080e7          	jalr	704(ra) # 12f0 <exit>

0000000000001038 <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
    1038:	1141                	addi	sp,sp,-16
    103a:	e422                	sd	s0,8(sp)
    103c:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    103e:	87aa                	mv	a5,a0
    1040:	0585                	addi	a1,a1,1
    1042:	0785                	addi	a5,a5,1
    1044:	fff5c703          	lbu	a4,-1(a1)
    1048:	fee78fa3          	sb	a4,-1(a5)
    104c:	fb75                	bnez	a4,1040 <strcpy+0x8>
    ;
  return os;
}
    104e:	6422                	ld	s0,8(sp)
    1050:	0141                	addi	sp,sp,16
    1052:	8082                	ret

0000000000001054 <strcat>:

char*
strcat(char *s, const char *t)
{
    1054:	1141                	addi	sp,sp,-16
    1056:	e422                	sd	s0,8(sp)
    1058:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
    105a:	00054783          	lbu	a5,0(a0)
    105e:	c385                	beqz	a5,107e <strcat+0x2a>
    1060:	87aa                	mv	a5,a0
    s++;
    1062:	0785                	addi	a5,a5,1
  while(*s)
    1064:	0007c703          	lbu	a4,0(a5)
    1068:	ff6d                	bnez	a4,1062 <strcat+0xe>
  while((*s++ = *t++))
    106a:	0585                	addi	a1,a1,1
    106c:	0785                	addi	a5,a5,1
    106e:	fff5c703          	lbu	a4,-1(a1)
    1072:	fee78fa3          	sb	a4,-1(a5)
    1076:	fb75                	bnez	a4,106a <strcat+0x16>
    ;
  return os;
}
    1078:	6422                	ld	s0,8(sp)
    107a:	0141                	addi	sp,sp,16
    107c:	8082                	ret
  while(*s)
    107e:	87aa                	mv	a5,a0
    1080:	b7ed                	j	106a <strcat+0x16>

0000000000001082 <strcmp>:


int
strcmp(const char *p, const char *q)
{
    1082:	1141                	addi	sp,sp,-16
    1084:	e422                	sd	s0,8(sp)
    1086:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
    1088:	00054783          	lbu	a5,0(a0)
    108c:	cb91                	beqz	a5,10a0 <strcmp+0x1e>
    108e:	0005c703          	lbu	a4,0(a1)
    1092:	00f71763          	bne	a4,a5,10a0 <strcmp+0x1e>
    p++, q++;
    1096:	0505                	addi	a0,a0,1
    1098:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
    109a:	00054783          	lbu	a5,0(a0)
    109e:	fbe5                	bnez	a5,108e <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
    10a0:	0005c503          	lbu	a0,0(a1)
}
    10a4:	40a7853b          	subw	a0,a5,a0
    10a8:	6422                	ld	s0,8(sp)
    10aa:	0141                	addi	sp,sp,16
    10ac:	8082                	ret

00000000000010ae <strlen>:

uint
strlen(const char *s)
{
    10ae:	1141                	addi	sp,sp,-16
    10b0:	e422                	sd	s0,8(sp)
    10b2:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
    10b4:	00054783          	lbu	a5,0(a0)
    10b8:	cf91                	beqz	a5,10d4 <strlen+0x26>
    10ba:	0505                	addi	a0,a0,1
    10bc:	87aa                	mv	a5,a0
    10be:	4685                	li	a3,1
    10c0:	9e89                	subw	a3,a3,a0
    10c2:	00f6853b          	addw	a0,a3,a5
    10c6:	0785                	addi	a5,a5,1
    10c8:	fff7c703          	lbu	a4,-1(a5)
    10cc:	fb7d                	bnez	a4,10c2 <strlen+0x14>
    ;
  return n;
}
    10ce:	6422                	ld	s0,8(sp)
    10d0:	0141                	addi	sp,sp,16
    10d2:	8082                	ret
  for(n = 0; s[n]; n++)
    10d4:	4501                	li	a0,0
    10d6:	bfe5                	j	10ce <strlen+0x20>

00000000000010d8 <memset>:

void*
memset(void *dst, int c, uint n)
{
    10d8:	1141                	addi	sp,sp,-16
    10da:	e422                	sd	s0,8(sp)
    10dc:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
    10de:	ca19                	beqz	a2,10f4 <memset+0x1c>
    10e0:	87aa                	mv	a5,a0
    10e2:	1602                	slli	a2,a2,0x20
    10e4:	9201                	srli	a2,a2,0x20
    10e6:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
    10ea:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
    10ee:	0785                	addi	a5,a5,1
    10f0:	fee79de3          	bne	a5,a4,10ea <memset+0x12>
  }
  return dst;
}
    10f4:	6422                	ld	s0,8(sp)
    10f6:	0141                	addi	sp,sp,16
    10f8:	8082                	ret

00000000000010fa <strchr>:

char*
strchr(const char *s, char c)
{
    10fa:	1141                	addi	sp,sp,-16
    10fc:	e422                	sd	s0,8(sp)
    10fe:	0800                	addi	s0,sp,16
  for(; *s; s++)
    1100:	00054783          	lbu	a5,0(a0)
    1104:	cb99                	beqz	a5,111a <strchr+0x20>
    if(*s == c)
    1106:	00f58763          	beq	a1,a5,1114 <strchr+0x1a>
  for(; *s; s++)
    110a:	0505                	addi	a0,a0,1
    110c:	00054783          	lbu	a5,0(a0)
    1110:	fbfd                	bnez	a5,1106 <strchr+0xc>
      return (char*)s;
  return 0;
    1112:	4501                	li	a0,0
}
    1114:	6422                	ld	s0,8(sp)
    1116:	0141                	addi	sp,sp,16
    1118:	8082                	ret
  return 0;
    111a:	4501                	li	a0,0
    111c:	bfe5                	j	1114 <strchr+0x1a>

000000000000111e <gets>:

char*
gets(char *buf, int max)
{
    111e:	711d                	addi	sp,sp,-96
    1120:	ec86                	sd	ra,88(sp)
    1122:	e8a2                	sd	s0,80(sp)
    1124:	e4a6                	sd	s1,72(sp)
    1126:	e0ca                	sd	s2,64(sp)
    1128:	fc4e                	sd	s3,56(sp)
    112a:	f852                	sd	s4,48(sp)
    112c:	f456                	sd	s5,40(sp)
    112e:	f05a                	sd	s6,32(sp)
    1130:	ec5e                	sd	s7,24(sp)
    1132:	e862                	sd	s8,16(sp)
    1134:	1080                	addi	s0,sp,96
    1136:	8baa                	mv	s7,a0
    1138:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    113a:	892a                	mv	s2,a0
    113c:	4481                	li	s1,0
    cc = read(0, &c, 1);
    113e:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
    1142:	4b29                	li	s6,10
    1144:	4c35                	li	s8,13
  for(i=0; i+1 < max; ){
    1146:	89a6                	mv	s3,s1
    1148:	2485                	addiw	s1,s1,1
    114a:	0344d763          	bge	s1,s4,1178 <gets+0x5a>
    cc = read(0, &c, 1);
    114e:	4605                	li	a2,1
    1150:	85d6                	mv	a1,s5
    1152:	4501                	li	a0,0
    1154:	00000097          	auipc	ra,0x0
    1158:	1b4080e7          	jalr	436(ra) # 1308 <read>
    if(cc < 1)
    115c:	00a05e63          	blez	a0,1178 <gets+0x5a>
    buf[i++] = c;
    1160:	faf44783          	lbu	a5,-81(s0)
    1164:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
    1168:	01678763          	beq	a5,s6,1176 <gets+0x58>
    116c:	0905                	addi	s2,s2,1
    116e:	fd879ce3          	bne	a5,s8,1146 <gets+0x28>
  for(i=0; i+1 < max; ){
    1172:	89a6                	mv	s3,s1
    1174:	a011                	j	1178 <gets+0x5a>
    1176:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
    1178:	99de                	add	s3,s3,s7
    117a:	00098023          	sb	zero,0(s3)
  return buf;
}
    117e:	855e                	mv	a0,s7
    1180:	60e6                	ld	ra,88(sp)
    1182:	6446                	ld	s0,80(sp)
    1184:	64a6                	ld	s1,72(sp)
    1186:	6906                	ld	s2,64(sp)
    1188:	79e2                	ld	s3,56(sp)
    118a:	7a42                	ld	s4,48(sp)
    118c:	7aa2                	ld	s5,40(sp)
    118e:	7b02                	ld	s6,32(sp)
    1190:	6be2                	ld	s7,24(sp)
    1192:	6c42                	ld	s8,16(sp)
    1194:	6125                	addi	sp,sp,96
    1196:	8082                	ret

0000000000001198 <stat>:

int
stat(const char *n, struct stat *st)
{
    1198:	1101                	addi	sp,sp,-32
    119a:	ec06                	sd	ra,24(sp)
    119c:	e822                	sd	s0,16(sp)
    119e:	e426                	sd	s1,8(sp)
    11a0:	e04a                	sd	s2,0(sp)
    11a2:	1000                	addi	s0,sp,32
    11a4:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    11a6:	4581                	li	a1,0
    11a8:	00000097          	auipc	ra,0x0
    11ac:	188080e7          	jalr	392(ra) # 1330 <open>
  if(fd < 0)
    11b0:	02054563          	bltz	a0,11da <stat+0x42>
    11b4:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
    11b6:	85ca                	mv	a1,s2
    11b8:	00000097          	auipc	ra,0x0
    11bc:	180080e7          	jalr	384(ra) # 1338 <fstat>
    11c0:	892a                	mv	s2,a0
  close(fd);
    11c2:	8526                	mv	a0,s1
    11c4:	00000097          	auipc	ra,0x0
    11c8:	154080e7          	jalr	340(ra) # 1318 <close>
  return r;
}
    11cc:	854a                	mv	a0,s2
    11ce:	60e2                	ld	ra,24(sp)
    11d0:	6442                	ld	s0,16(sp)
    11d2:	64a2                	ld	s1,8(sp)
    11d4:	6902                	ld	s2,0(sp)
    11d6:	6105                	addi	sp,sp,32
    11d8:	8082                	ret
    return -1;
    11da:	597d                	li	s2,-1
    11dc:	bfc5                	j	11cc <stat+0x34>

00000000000011de <atoi>:

int
atoi(const char *s)
{
    11de:	1141                	addi	sp,sp,-16
    11e0:	e422                	sd	s0,8(sp)
    11e2:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
    11e4:	00054703          	lbu	a4,0(a0)
    11e8:	02d00793          	li	a5,45
  int neg = 1;
    11ec:	4585                	li	a1,1
  if (*s == '-') {
    11ee:	04f70363          	beq	a4,a5,1234 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
    11f2:	00054703          	lbu	a4,0(a0)
    11f6:	fd07079b          	addiw	a5,a4,-48
    11fa:	0ff7f793          	zext.b	a5,a5
    11fe:	46a5                	li	a3,9
    1200:	02f6ed63          	bltu	a3,a5,123a <atoi+0x5c>
  n = 0;
    1204:	4681                	li	a3,0
  while('0' <= *s && *s <= '9')
    1206:	4625                	li	a2,9
    n = n*10 + *s++ - '0';
    1208:	0505                	addi	a0,a0,1
    120a:	0026979b          	slliw	a5,a3,0x2
    120e:	9fb5                	addw	a5,a5,a3
    1210:	0017979b          	slliw	a5,a5,0x1
    1214:	9fb9                	addw	a5,a5,a4
    1216:	fd07869b          	addiw	a3,a5,-48
  while('0' <= *s && *s <= '9')
    121a:	00054703          	lbu	a4,0(a0)
    121e:	fd07079b          	addiw	a5,a4,-48
    1222:	0ff7f793          	zext.b	a5,a5
    1226:	fef671e3          	bgeu	a2,a5,1208 <atoi+0x2a>
  return n * neg;
}
    122a:	02d5853b          	mulw	a0,a1,a3
    122e:	6422                	ld	s0,8(sp)
    1230:	0141                	addi	sp,sp,16
    1232:	8082                	ret
    s++;
    1234:	0505                	addi	a0,a0,1
    neg = -1;
    1236:	55fd                	li	a1,-1
    1238:	bf6d                	j	11f2 <atoi+0x14>
  n = 0;
    123a:	4681                	li	a3,0
    123c:	b7fd                	j	122a <atoi+0x4c>

000000000000123e <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    123e:	1141                	addi	sp,sp,-16
    1240:	e422                	sd	s0,8(sp)
    1242:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
    1244:	02b57463          	bgeu	a0,a1,126c <memmove+0x2e>
    while(n-- > 0)
    1248:	00c05f63          	blez	a2,1266 <memmove+0x28>
    124c:	1602                	slli	a2,a2,0x20
    124e:	9201                	srli	a2,a2,0x20
    1250:	00c507b3          	add	a5,a0,a2
  dst = vdst;
    1254:	872a                	mv	a4,a0
      *dst++ = *src++;
    1256:	0585                	addi	a1,a1,1
    1258:	0705                	addi	a4,a4,1
    125a:	fff5c683          	lbu	a3,-1(a1)
    125e:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
    1262:	fee79ae3          	bne	a5,a4,1256 <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
    1266:	6422                	ld	s0,8(sp)
    1268:	0141                	addi	sp,sp,16
    126a:	8082                	ret
    dst += n;
    126c:	00c50733          	add	a4,a0,a2
    src += n;
    1270:	95b2                	add	a1,a1,a2
    while(n-- > 0)
    1272:	fec05ae3          	blez	a2,1266 <memmove+0x28>
    1276:	fff6079b          	addiw	a5,a2,-1
    127a:	1782                	slli	a5,a5,0x20
    127c:	9381                	srli	a5,a5,0x20
    127e:	fff7c793          	not	a5,a5
    1282:	97ba                	add	a5,a5,a4
      *--dst = *--src;
    1284:	15fd                	addi	a1,a1,-1
    1286:	177d                	addi	a4,a4,-1
    1288:	0005c683          	lbu	a3,0(a1)
    128c:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
    1290:	fee79ae3          	bne	a5,a4,1284 <memmove+0x46>
    1294:	bfc9                	j	1266 <memmove+0x28>

0000000000001296 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
    1296:	1141                	addi	sp,sp,-16
    1298:	e422                	sd	s0,8(sp)
    129a:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
    129c:	ca05                	beqz	a2,12cc <memcmp+0x36>
    129e:	fff6069b          	addiw	a3,a2,-1
    12a2:	1682                	slli	a3,a3,0x20
    12a4:	9281                	srli	a3,a3,0x20
    12a6:	0685                	addi	a3,a3,1
    12a8:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
    12aa:	00054783          	lbu	a5,0(a0)
    12ae:	0005c703          	lbu	a4,0(a1)
    12b2:	00e79863          	bne	a5,a4,12c2 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
    12b6:	0505                	addi	a0,a0,1
    p2++;
    12b8:	0585                	addi	a1,a1,1
  while (n-- > 0) {
    12ba:	fed518e3          	bne	a0,a3,12aa <memcmp+0x14>
  }
  return 0;
    12be:	4501                	li	a0,0
    12c0:	a019                	j	12c6 <memcmp+0x30>
      return *p1 - *p2;
    12c2:	40e7853b          	subw	a0,a5,a4
}
    12c6:	6422                	ld	s0,8(sp)
    12c8:	0141                	addi	sp,sp,16
    12ca:	8082                	ret
  return 0;
    12cc:	4501                	li	a0,0
    12ce:	bfe5                	j	12c6 <memcmp+0x30>

00000000000012d0 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
    12d0:	1141                	addi	sp,sp,-16
    12d2:	e406                	sd	ra,8(sp)
    12d4:	e022                	sd	s0,0(sp)
    12d6:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
    12d8:	00000097          	auipc	ra,0x0
    12dc:	f66080e7          	jalr	-154(ra) # 123e <memmove>
}
    12e0:	60a2                	ld	ra,8(sp)
    12e2:	6402                	ld	s0,0(sp)
    12e4:	0141                	addi	sp,sp,16
    12e6:	8082                	ret

00000000000012e8 <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
    12e8:	4885                	li	a7,1
 ecall
    12ea:	00000073          	ecall
 ret
    12ee:	8082                	ret

00000000000012f0 <exit>:
.global exit
exit:
 li a7, SYS_exit
    12f0:	4889                	li	a7,2
 ecall
    12f2:	00000073          	ecall
 ret
    12f6:	8082                	ret

00000000000012f8 <wait>:
.global wait
wait:
 li a7, SYS_wait
    12f8:	488d                	li	a7,3
 ecall
    12fa:	00000073          	ecall
 ret
    12fe:	8082                	ret

0000000000001300 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
    1300:	4891                	li	a7,4
 ecall
    1302:	00000073          	ecall
 ret
    1306:	8082                	ret

0000000000001308 <read>:
.global read
read:
 li a7, SYS_read
    1308:	4895                	li	a7,5
 ecall
    130a:	00000073          	ecall
 ret
    130e:	8082                	ret

0000000000001310 <write>:
.global write
write:
 li a7, SYS_write
    1310:	48c1                	li	a7,16
 ecall
    1312:	00000073          	ecall
 ret
    1316:	8082                	ret

0000000000001318 <close>:
.global close
close:
 li a7, SYS_close
    1318:	48d5                	li	a7,21
 ecall
    131a:	00000073          	ecall
 ret
    131e:	8082                	ret

0000000000001320 <kill>:
.global kill
kill:
 li a7, SYS_kill
    1320:	4899                	li	a7,6
 ecall
    1322:	00000073          	ecall
 ret
    1326:	8082                	ret

0000000000001328 <exec>:
.global exec
exec:
 li a7, SYS_exec
    1328:	489d                	li	a7,7
 ecall
    132a:	00000073          	ecall
 ret
    132e:	8082                	ret

0000000000001330 <open>:
.global open
open:
 li a7, SYS_open
    1330:	48bd                	li	a7,15
 ecall
    1332:	00000073          	ecall
 ret
    1336:	8082                	ret

0000000000001338 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
    1338:	48a1                	li	a7,8
 ecall
    133a:	00000073          	ecall
 ret
    133e:	8082                	ret

0000000000001340 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
    1340:	48d1                	li	a7,20
 ecall
    1342:	00000073          	ecall
 ret
    1346:	8082                	ret

0000000000001348 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
    1348:	48a5                	li	a7,9
 ecall
    134a:	00000073          	ecall
 ret
    134e:	8082                	ret

0000000000001350 <dup>:
.global dup
dup:
 li a7, SYS_dup
    1350:	48a9                	li	a7,10
 ecall
    1352:	00000073          	ecall
 ret
    1356:	8082                	ret

0000000000001358 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
    1358:	48ad                	li	a7,11
 ecall
    135a:	00000073          	ecall
 ret
    135e:	8082                	ret

0000000000001360 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
    1360:	48b1                	li	a7,12
 ecall
    1362:	00000073          	ecall
 ret
    1366:	8082                	ret

0000000000001368 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
    1368:	48b5                	li	a7,13
 ecall
    136a:	00000073          	ecall
 ret
    136e:	8082                	ret

0000000000001370 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
    1370:	48b9                	li	a7,14
 ecall
    1372:	00000073          	ecall
 ret
    1376:	8082                	ret

0000000000001378 <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
    1378:	48d9                	li	a7,22
 ecall
    137a:	00000073          	ecall
 ret
    137e:	8082                	ret

0000000000001380 <dev>:
.global dev
dev:
 li a7, SYS_dev
    1380:	0e900893          	li	a7,233
 ecall
    1384:	00000073          	ecall
 ret
    1388:	8082                	ret

000000000000138a <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
    138a:	0f400893          	li	a7,244
 ecall
    138e:	00000073          	ecall
 ret
    1392:	8082                	ret

0000000000001394 <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
    1394:	48e5                	li	a7,25
 ecall
    1396:	00000073          	ecall
 ret
    139a:	8082                	ret

000000000000139c <remove>:
.global remove
remove:
 li a7, SYS_remove
    139c:	0b100893          	li	a7,177
 ecall
    13a0:	00000073          	ecall
 ret
    13a4:	8082                	ret

00000000000013a6 <trace>:
.global trace
trace:
 li a7, SYS_trace
    13a6:	48c9                	li	a7,18
 ecall
    13a8:	00000073          	ecall
 ret
    13ac:	8082                	ret

00000000000013ae <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
    13ae:	48cd                	li	a7,19
 ecall
    13b0:	00000073          	ecall
 ret
    13b4:	8082                	ret

00000000000013b6 <rename>:
.global rename
rename:
 li a7, SYS_rename
    13b6:	48e9                	li	a7,26
 ecall
    13b8:	00000073          	ecall
 ret
    13bc:	8082                	ret

00000000000013be <poweroff>:
.global poweroff
poweroff:
 li a7, SYS_poweroff
    13be:	0d200893          	li	a7,210
 ecall
    13c2:	00000073          	ecall
 ret
    13c6:	8082                	ret

00000000000013c8 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
    13c8:	1101                	addi	sp,sp,-32
    13ca:	ec06                	sd	ra,24(sp)
    13cc:	e822                	sd	s0,16(sp)
    13ce:	1000                	addi	s0,sp,32
    13d0:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
    13d4:	4605                	li	a2,1
    13d6:	fef40593          	addi	a1,s0,-17
    13da:	00000097          	auipc	ra,0x0
    13de:	f36080e7          	jalr	-202(ra) # 1310 <write>
}
    13e2:	60e2                	ld	ra,24(sp)
    13e4:	6442                	ld	s0,16(sp)
    13e6:	6105                	addi	sp,sp,32
    13e8:	8082                	ret

00000000000013ea <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    13ea:	7139                	addi	sp,sp,-64
    13ec:	fc06                	sd	ra,56(sp)
    13ee:	f822                	sd	s0,48(sp)
    13f0:	f426                	sd	s1,40(sp)
    13f2:	f04a                	sd	s2,32(sp)
    13f4:	ec4e                	sd	s3,24(sp)
    13f6:	0080                	addi	s0,sp,64
    13f8:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    13fa:	c299                	beqz	a3,1400 <printint+0x16>
    13fc:	0805c863          	bltz	a1,148c <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    1400:	2581                	sext.w	a1,a1
  neg = 0;
    1402:	4881                	li	a7,0
  }

  i = 0;
    1404:	fc040993          	addi	s3,s0,-64
  neg = 0;
    1408:	86ce                	mv	a3,s3
  i = 0;
    140a:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
    140c:	2601                	sext.w	a2,a2
    140e:	00000517          	auipc	a0,0x0
    1412:	67a50513          	addi	a0,a0,1658 # 1a88 <digits>
    1416:	883a                	mv	a6,a4
    1418:	2705                	addiw	a4,a4,1
    141a:	02c5f7bb          	remuw	a5,a1,a2
    141e:	1782                	slli	a5,a5,0x20
    1420:	9381                	srli	a5,a5,0x20
    1422:	97aa                	add	a5,a5,a0
    1424:	0007c783          	lbu	a5,0(a5)
    1428:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
    142c:	0005879b          	sext.w	a5,a1
    1430:	02c5d5bb          	divuw	a1,a1,a2
    1434:	0685                	addi	a3,a3,1
    1436:	fec7f0e3          	bgeu	a5,a2,1416 <printint+0x2c>
  if(neg)
    143a:	00088c63          	beqz	a7,1452 <printint+0x68>
    buf[i++] = '-';
    143e:	fd070793          	addi	a5,a4,-48
    1442:	00878733          	add	a4,a5,s0
    1446:	02d00793          	li	a5,45
    144a:	fef70823          	sb	a5,-16(a4)
    144e:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
    1452:	02e05663          	blez	a4,147e <printint+0x94>
    1456:	fc040913          	addi	s2,s0,-64
    145a:	993a                	add	s2,s2,a4
    145c:	19fd                	addi	s3,s3,-1
    145e:	99ba                	add	s3,s3,a4
    1460:	377d                	addiw	a4,a4,-1
    1462:	1702                	slli	a4,a4,0x20
    1464:	9301                	srli	a4,a4,0x20
    1466:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
    146a:	fff94583          	lbu	a1,-1(s2)
    146e:	8526                	mv	a0,s1
    1470:	00000097          	auipc	ra,0x0
    1474:	f58080e7          	jalr	-168(ra) # 13c8 <putc>
  while(--i >= 0)
    1478:	197d                	addi	s2,s2,-1
    147a:	ff3918e3          	bne	s2,s3,146a <printint+0x80>
}
    147e:	70e2                	ld	ra,56(sp)
    1480:	7442                	ld	s0,48(sp)
    1482:	74a2                	ld	s1,40(sp)
    1484:	7902                	ld	s2,32(sp)
    1486:	69e2                	ld	s3,24(sp)
    1488:	6121                	addi	sp,sp,64
    148a:	8082                	ret
    x = -xx;
    148c:	40b005bb          	negw	a1,a1
    neg = 1;
    1490:	4885                	li	a7,1
    x = -xx;
    1492:	bf8d                	j	1404 <printint+0x1a>

0000000000001494 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
    1494:	7119                	addi	sp,sp,-128
    1496:	fc86                	sd	ra,120(sp)
    1498:	f8a2                	sd	s0,112(sp)
    149a:	f4a6                	sd	s1,104(sp)
    149c:	f0ca                	sd	s2,96(sp)
    149e:	ecce                	sd	s3,88(sp)
    14a0:	e8d2                	sd	s4,80(sp)
    14a2:	e4d6                	sd	s5,72(sp)
    14a4:	e0da                	sd	s6,64(sp)
    14a6:	fc5e                	sd	s7,56(sp)
    14a8:	f862                	sd	s8,48(sp)
    14aa:	f466                	sd	s9,40(sp)
    14ac:	f06a                	sd	s10,32(sp)
    14ae:	ec6e                	sd	s11,24(sp)
    14b0:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
    14b2:	0005c903          	lbu	s2,0(a1)
    14b6:	18090f63          	beqz	s2,1654 <vprintf+0x1c0>
    14ba:	8aaa                	mv	s5,a0
    14bc:	8b32                	mv	s6,a2
    14be:	00158493          	addi	s1,a1,1
  state = 0;
    14c2:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    14c4:	02500a13          	li	s4,37
    14c8:	4c55                	li	s8,21
    14ca:	00000c97          	auipc	s9,0x0
    14ce:	566c8c93          	addi	s9,s9,1382 # 1a30 <malloc+0x2d8>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
        s = va_arg(ap, char*);
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    14d2:	02800d93          	li	s11,40
  putc(fd, 'x');
    14d6:	4d41                	li	s10,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
    14d8:	00000b97          	auipc	s7,0x0
    14dc:	5b0b8b93          	addi	s7,s7,1456 # 1a88 <digits>
    14e0:	a839                	j	14fe <vprintf+0x6a>
        putc(fd, c);
    14e2:	85ca                	mv	a1,s2
    14e4:	8556                	mv	a0,s5
    14e6:	00000097          	auipc	ra,0x0
    14ea:	ee2080e7          	jalr	-286(ra) # 13c8 <putc>
    14ee:	a019                	j	14f4 <vprintf+0x60>
    } else if(state == '%'){
    14f0:	01498d63          	beq	s3,s4,150a <vprintf+0x76>
  for(i = 0; fmt[i]; i++){
    14f4:	0485                	addi	s1,s1,1
    14f6:	fff4c903          	lbu	s2,-1(s1)
    14fa:	14090d63          	beqz	s2,1654 <vprintf+0x1c0>
    if(state == 0){
    14fe:	fe0999e3          	bnez	s3,14f0 <vprintf+0x5c>
      if(c == '%'){
    1502:	ff4910e3          	bne	s2,s4,14e2 <vprintf+0x4e>
        state = '%';
    1506:	89d2                	mv	s3,s4
    1508:	b7f5                	j	14f4 <vprintf+0x60>
      if(c == 'd'){
    150a:	11490c63          	beq	s2,s4,1622 <vprintf+0x18e>
    150e:	f9d9079b          	addiw	a5,s2,-99
    1512:	0ff7f793          	zext.b	a5,a5
    1516:	10fc6e63          	bltu	s8,a5,1632 <vprintf+0x19e>
    151a:	f9d9079b          	addiw	a5,s2,-99
    151e:	0ff7f713          	zext.b	a4,a5
    1522:	10ec6863          	bltu	s8,a4,1632 <vprintf+0x19e>
    1526:	00271793          	slli	a5,a4,0x2
    152a:	97e6                	add	a5,a5,s9
    152c:	439c                	lw	a5,0(a5)
    152e:	97e6                	add	a5,a5,s9
    1530:	8782                	jr	a5
        printint(fd, va_arg(ap, int), 10, 1);
    1532:	008b0913          	addi	s2,s6,8
    1536:	4685                	li	a3,1
    1538:	4629                	li	a2,10
    153a:	000b2583          	lw	a1,0(s6)
    153e:	8556                	mv	a0,s5
    1540:	00000097          	auipc	ra,0x0
    1544:	eaa080e7          	jalr	-342(ra) # 13ea <printint>
    1548:	8b4a                	mv	s6,s2
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    154a:	4981                	li	s3,0
    154c:	b765                	j	14f4 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
    154e:	008b0913          	addi	s2,s6,8
    1552:	4681                	li	a3,0
    1554:	4629                	li	a2,10
    1556:	000b2583          	lw	a1,0(s6)
    155a:	8556                	mv	a0,s5
    155c:	00000097          	auipc	ra,0x0
    1560:	e8e080e7          	jalr	-370(ra) # 13ea <printint>
    1564:	8b4a                	mv	s6,s2
      state = 0;
    1566:	4981                	li	s3,0
    1568:	b771                	j	14f4 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
    156a:	008b0913          	addi	s2,s6,8
    156e:	4681                	li	a3,0
    1570:	866a                	mv	a2,s10
    1572:	000b2583          	lw	a1,0(s6)
    1576:	8556                	mv	a0,s5
    1578:	00000097          	auipc	ra,0x0
    157c:	e72080e7          	jalr	-398(ra) # 13ea <printint>
    1580:	8b4a                	mv	s6,s2
      state = 0;
    1582:	4981                	li	s3,0
    1584:	bf85                	j	14f4 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
    1586:	008b0793          	addi	a5,s6,8
    158a:	f8f43423          	sd	a5,-120(s0)
    158e:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
    1592:	03000593          	li	a1,48
    1596:	8556                	mv	a0,s5
    1598:	00000097          	auipc	ra,0x0
    159c:	e30080e7          	jalr	-464(ra) # 13c8 <putc>
  putc(fd, 'x');
    15a0:	07800593          	li	a1,120
    15a4:	8556                	mv	a0,s5
    15a6:	00000097          	auipc	ra,0x0
    15aa:	e22080e7          	jalr	-478(ra) # 13c8 <putc>
    15ae:	896a                	mv	s2,s10
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
    15b0:	03c9d793          	srli	a5,s3,0x3c
    15b4:	97de                	add	a5,a5,s7
    15b6:	0007c583          	lbu	a1,0(a5)
    15ba:	8556                	mv	a0,s5
    15bc:	00000097          	auipc	ra,0x0
    15c0:	e0c080e7          	jalr	-500(ra) # 13c8 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    15c4:	0992                	slli	s3,s3,0x4
    15c6:	397d                	addiw	s2,s2,-1
    15c8:	fe0914e3          	bnez	s2,15b0 <vprintf+0x11c>
        printptr(fd, va_arg(ap, uint64));
    15cc:	f8843b03          	ld	s6,-120(s0)
      state = 0;
    15d0:	4981                	li	s3,0
    15d2:	b70d                	j	14f4 <vprintf+0x60>
        s = va_arg(ap, char*);
    15d4:	008b0913          	addi	s2,s6,8
    15d8:	000b3983          	ld	s3,0(s6)
        if(s == 0)
    15dc:	02098163          	beqz	s3,15fe <vprintf+0x16a>
        while(*s != 0){
    15e0:	0009c583          	lbu	a1,0(s3)
    15e4:	c5ad                	beqz	a1,164e <vprintf+0x1ba>
          putc(fd, *s);
    15e6:	8556                	mv	a0,s5
    15e8:	00000097          	auipc	ra,0x0
    15ec:	de0080e7          	jalr	-544(ra) # 13c8 <putc>
          s++;
    15f0:	0985                	addi	s3,s3,1
        while(*s != 0){
    15f2:	0009c583          	lbu	a1,0(s3)
    15f6:	f9e5                	bnez	a1,15e6 <vprintf+0x152>
        s = va_arg(ap, char*);
    15f8:	8b4a                	mv	s6,s2
      state = 0;
    15fa:	4981                	li	s3,0
    15fc:	bde5                	j	14f4 <vprintf+0x60>
          s = "(null)";
    15fe:	00000997          	auipc	s3,0x0
    1602:	42a98993          	addi	s3,s3,1066 # 1a28 <malloc+0x2d0>
        while(*s != 0){
    1606:	85ee                	mv	a1,s11
    1608:	bff9                	j	15e6 <vprintf+0x152>
        putc(fd, va_arg(ap, uint));
    160a:	008b0913          	addi	s2,s6,8
    160e:	000b4583          	lbu	a1,0(s6)
    1612:	8556                	mv	a0,s5
    1614:	00000097          	auipc	ra,0x0
    1618:	db4080e7          	jalr	-588(ra) # 13c8 <putc>
    161c:	8b4a                	mv	s6,s2
      state = 0;
    161e:	4981                	li	s3,0
    1620:	bdd1                	j	14f4 <vprintf+0x60>
        putc(fd, c);
    1622:	85d2                	mv	a1,s4
    1624:	8556                	mv	a0,s5
    1626:	00000097          	auipc	ra,0x0
    162a:	da2080e7          	jalr	-606(ra) # 13c8 <putc>
      state = 0;
    162e:	4981                	li	s3,0
    1630:	b5d1                	j	14f4 <vprintf+0x60>
        putc(fd, '%');
    1632:	85d2                	mv	a1,s4
    1634:	8556                	mv	a0,s5
    1636:	00000097          	auipc	ra,0x0
    163a:	d92080e7          	jalr	-622(ra) # 13c8 <putc>
        putc(fd, c);
    163e:	85ca                	mv	a1,s2
    1640:	8556                	mv	a0,s5
    1642:	00000097          	auipc	ra,0x0
    1646:	d86080e7          	jalr	-634(ra) # 13c8 <putc>
      state = 0;
    164a:	4981                	li	s3,0
    164c:	b565                	j	14f4 <vprintf+0x60>
        s = va_arg(ap, char*);
    164e:	8b4a                	mv	s6,s2
      state = 0;
    1650:	4981                	li	s3,0
    1652:	b54d                	j	14f4 <vprintf+0x60>
    }
  }
}
    1654:	70e6                	ld	ra,120(sp)
    1656:	7446                	ld	s0,112(sp)
    1658:	74a6                	ld	s1,104(sp)
    165a:	7906                	ld	s2,96(sp)
    165c:	69e6                	ld	s3,88(sp)
    165e:	6a46                	ld	s4,80(sp)
    1660:	6aa6                	ld	s5,72(sp)
    1662:	6b06                	ld	s6,64(sp)
    1664:	7be2                	ld	s7,56(sp)
    1666:	7c42                	ld	s8,48(sp)
    1668:	7ca2                	ld	s9,40(sp)
    166a:	7d02                	ld	s10,32(sp)
    166c:	6de2                	ld	s11,24(sp)
    166e:	6109                	addi	sp,sp,128
    1670:	8082                	ret

0000000000001672 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
    1672:	715d                	addi	sp,sp,-80
    1674:	ec06                	sd	ra,24(sp)
    1676:	e822                	sd	s0,16(sp)
    1678:	1000                	addi	s0,sp,32
    167a:	e010                	sd	a2,0(s0)
    167c:	e414                	sd	a3,8(s0)
    167e:	e818                	sd	a4,16(s0)
    1680:	ec1c                	sd	a5,24(s0)
    1682:	03043023          	sd	a6,32(s0)
    1686:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
    168a:	8622                	mv	a2,s0
    168c:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
    1690:	00000097          	auipc	ra,0x0
    1694:	e04080e7          	jalr	-508(ra) # 1494 <vprintf>
}
    1698:	60e2                	ld	ra,24(sp)
    169a:	6442                	ld	s0,16(sp)
    169c:	6161                	addi	sp,sp,80
    169e:	8082                	ret

00000000000016a0 <printf>:

void
printf(const char *fmt, ...)
{
    16a0:	711d                	addi	sp,sp,-96
    16a2:	ec06                	sd	ra,24(sp)
    16a4:	e822                	sd	s0,16(sp)
    16a6:	1000                	addi	s0,sp,32
    16a8:	e40c                	sd	a1,8(s0)
    16aa:	e810                	sd	a2,16(s0)
    16ac:	ec14                	sd	a3,24(s0)
    16ae:	f018                	sd	a4,32(s0)
    16b0:	f41c                	sd	a5,40(s0)
    16b2:	03043823          	sd	a6,48(s0)
    16b6:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
    16ba:	00840613          	addi	a2,s0,8
    16be:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
    16c2:	85aa                	mv	a1,a0
    16c4:	4505                	li	a0,1
    16c6:	00000097          	auipc	ra,0x0
    16ca:	dce080e7          	jalr	-562(ra) # 1494 <vprintf>
}
    16ce:	60e2                	ld	ra,24(sp)
    16d0:	6442                	ld	s0,16(sp)
    16d2:	6125                	addi	sp,sp,96
    16d4:	8082                	ret

00000000000016d6 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    16d6:	1141                	addi	sp,sp,-16
    16d8:	e422                	sd	s0,8(sp)
    16da:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
    16dc:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16e0:	00001797          	auipc	a5,0x1
    16e4:	cc07b783          	ld	a5,-832(a5) # 23a0 <freep>
    16e8:	a02d                	j	1712 <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    16ea:	4618                	lw	a4,8(a2)
    16ec:	9f2d                	addw	a4,a4,a1
    16ee:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
    16f2:	6398                	ld	a4,0(a5)
    16f4:	6310                	ld	a2,0(a4)
    16f6:	a83d                	j	1734 <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    16f8:	ff852703          	lw	a4,-8(a0)
    16fc:	9f31                	addw	a4,a4,a2
    16fe:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
    1700:	ff053683          	ld	a3,-16(a0)
    1704:	a091                	j	1748 <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1706:	6398                	ld	a4,0(a5)
    1708:	00e7e463          	bltu	a5,a4,1710 <free+0x3a>
    170c:	00e6ea63          	bltu	a3,a4,1720 <free+0x4a>
{
    1710:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1712:	fed7fae3          	bgeu	a5,a3,1706 <free+0x30>
    1716:	6398                	ld	a4,0(a5)
    1718:	00e6e463          	bltu	a3,a4,1720 <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    171c:	fee7eae3          	bltu	a5,a4,1710 <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
    1720:	ff852583          	lw	a1,-8(a0)
    1724:	6390                	ld	a2,0(a5)
    1726:	02059813          	slli	a6,a1,0x20
    172a:	01c85713          	srli	a4,a6,0x1c
    172e:	9736                	add	a4,a4,a3
    1730:	fae60de3          	beq	a2,a4,16ea <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
    1734:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
    1738:	4790                	lw	a2,8(a5)
    173a:	02061593          	slli	a1,a2,0x20
    173e:	01c5d713          	srli	a4,a1,0x1c
    1742:	973e                	add	a4,a4,a5
    1744:	fae68ae3          	beq	a3,a4,16f8 <free+0x22>
    p->s.ptr = bp->s.ptr;
    1748:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
    174a:	00001717          	auipc	a4,0x1
    174e:	c4f73b23          	sd	a5,-938(a4) # 23a0 <freep>
}
    1752:	6422                	ld	s0,8(sp)
    1754:	0141                	addi	sp,sp,16
    1756:	8082                	ret

0000000000001758 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1758:	7139                	addi	sp,sp,-64
    175a:	fc06                	sd	ra,56(sp)
    175c:	f822                	sd	s0,48(sp)
    175e:	f426                	sd	s1,40(sp)
    1760:	f04a                	sd	s2,32(sp)
    1762:	ec4e                	sd	s3,24(sp)
    1764:	e852                	sd	s4,16(sp)
    1766:	e456                	sd	s5,8(sp)
    1768:	e05a                	sd	s6,0(sp)
    176a:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    176c:	02051493          	slli	s1,a0,0x20
    1770:	9081                	srli	s1,s1,0x20
    1772:	04bd                	addi	s1,s1,15
    1774:	8091                	srli	s1,s1,0x4
    1776:	00148a1b          	addiw	s4,s1,1
    177a:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
    177c:	00001517          	auipc	a0,0x1
    1780:	c2453503          	ld	a0,-988(a0) # 23a0 <freep>
    1784:	c515                	beqz	a0,17b0 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1786:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
    1788:	4798                	lw	a4,8(a5)
    178a:	04977163          	bgeu	a4,s1,17cc <malloc+0x74>
    178e:	89d2                	mv	s3,s4
    1790:	000a071b          	sext.w	a4,s4
    1794:	6685                	lui	a3,0x1
    1796:	00d77363          	bgeu	a4,a3,179c <malloc+0x44>
    179a:	6985                	lui	s3,0x1
    179c:	00098b1b          	sext.w	s6,s3
  p = sbrk(nu * sizeof(Header));
    17a0:	0049999b          	slliw	s3,s3,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    17a4:	00001917          	auipc	s2,0x1
    17a8:	bfc90913          	addi	s2,s2,-1028 # 23a0 <freep>
  if(p == (char*)-1)
    17ac:	5afd                	li	s5,-1
    17ae:	a8a5                	j	1826 <malloc+0xce>
    base.s.ptr = freep = prevp = &base;
    17b0:	00001797          	auipc	a5,0x1
    17b4:	bf078793          	addi	a5,a5,-1040 # 23a0 <freep>
    17b8:	00001717          	auipc	a4,0x1
    17bc:	bf070713          	addi	a4,a4,-1040 # 23a8 <base>
    17c0:	e398                	sd	a4,0(a5)
    17c2:	e798                	sd	a4,8(a5)
    base.s.size = 0;
    17c4:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    17c8:	87ba                	mv	a5,a4
    17ca:	b7d1                	j	178e <malloc+0x36>
      if(p->s.size == nunits)
    17cc:	02e48c63          	beq	s1,a4,1804 <malloc+0xac>
        p->s.size -= nunits;
    17d0:	4147073b          	subw	a4,a4,s4
    17d4:	c798                	sw	a4,8(a5)
        p += p->s.size;
    17d6:	02071693          	slli	a3,a4,0x20
    17da:	01c6d713          	srli	a4,a3,0x1c
    17de:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
    17e0:	0147a423          	sw	s4,8(a5)
      freep = prevp;
    17e4:	00001717          	auipc	a4,0x1
    17e8:	baa73e23          	sd	a0,-1092(a4) # 23a0 <freep>
      return (void*)(p + 1);
    17ec:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    17f0:	70e2                	ld	ra,56(sp)
    17f2:	7442                	ld	s0,48(sp)
    17f4:	74a2                	ld	s1,40(sp)
    17f6:	7902                	ld	s2,32(sp)
    17f8:	69e2                	ld	s3,24(sp)
    17fa:	6a42                	ld	s4,16(sp)
    17fc:	6aa2                	ld	s5,8(sp)
    17fe:	6b02                	ld	s6,0(sp)
    1800:	6121                	addi	sp,sp,64
    1802:	8082                	ret
        prevp->s.ptr = p->s.ptr;
    1804:	6398                	ld	a4,0(a5)
    1806:	e118                	sd	a4,0(a0)
    1808:	bff1                	j	17e4 <malloc+0x8c>
  hp->s.size = nu;
    180a:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
    180e:	0541                	addi	a0,a0,16
    1810:	00000097          	auipc	ra,0x0
    1814:	ec6080e7          	jalr	-314(ra) # 16d6 <free>
  return freep;
    1818:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
    181c:	d971                	beqz	a0,17f0 <malloc+0x98>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    181e:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
    1820:	4798                	lw	a4,8(a5)
    1822:	fa9775e3          	bgeu	a4,s1,17cc <malloc+0x74>
    if(p == freep)
    1826:	00093703          	ld	a4,0(s2)
    182a:	853e                	mv	a0,a5
    182c:	fef719e3          	bne	a4,a5,181e <malloc+0xc6>
  p = sbrk(nu * sizeof(Header));
    1830:	854e                	mv	a0,s3
    1832:	00000097          	auipc	ra,0x0
    1836:	b2e080e7          	jalr	-1234(ra) # 1360 <sbrk>
  if(p == (char*)-1)
    183a:	fd5518e3          	bne	a0,s5,180a <malloc+0xb2>
        return 0;
    183e:	4501                	li	a0,0
    1840:	bf45                	j	17f0 <malloc+0x98>
