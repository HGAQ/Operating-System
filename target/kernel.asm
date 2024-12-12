
target/kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080200000 <_entry>:
    80200000:	00150293          	addi	t0,a0,1
    80200004:	02ba                	slli	t0,t0,0xe
    80200006:	0000d117          	auipc	sp,0xd
    8020000a:	d0213103          	ld	sp,-766(sp) # 8020cd08 <_GLOBAL_OFFSET_TABLE_+0x50>
    8020000e:	9116                	add	sp,sp,t0
    80200010:	1d5000ef          	jal	ra,802009e4 <main>

0000000080200014 <loop>:
    80200014:	a001                	j	80200014 <loop>

0000000080200016 <printint>:
    }
}

static void
printint(int xx, int base, int sign)
{
    80200016:	7179                	addi	sp,sp,-48
    80200018:	f406                	sd	ra,40(sp)
    8020001a:	f022                	sd	s0,32(sp)
    8020001c:	ec26                	sd	s1,24(sp)
    8020001e:	e84a                	sd	s2,16(sp)
    80200020:	1800                	addi	s0,sp,48
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
    80200022:	c219                	beqz	a2,80200028 <printint+0x12>
    80200024:	08054663          	bltz	a0,802000b0 <printint+0x9a>
    x = -xx;
  else
    x = xx;
    80200028:	2501                	sext.w	a0,a0
    8020002a:	4881                	li	a7,0

  i = 0;
    8020002c:	fd040913          	addi	s2,s0,-48
    x = xx;
    80200030:	86ca                	mv	a3,s2
  i = 0;
    80200032:	4701                	li	a4,0
  do {
    buf[i++] = digits[x % base];
    80200034:	2581                	sext.w	a1,a1
    80200036:	00009617          	auipc	a2,0x9
    8020003a:	34a60613          	addi	a2,a2,842 # 80209380 <digits>
    8020003e:	883a                	mv	a6,a4
    80200040:	2705                	addiw	a4,a4,1
    80200042:	02b577bb          	remuw	a5,a0,a1
    80200046:	1782                	slli	a5,a5,0x20
    80200048:	9381                	srli	a5,a5,0x20
    8020004a:	97b2                	add	a5,a5,a2
    8020004c:	0007c783          	lbu	a5,0(a5)
    80200050:	00f68023          	sb	a5,0(a3)
  } while((x /= base) != 0);
    80200054:	0005079b          	sext.w	a5,a0
    80200058:	02b5553b          	divuw	a0,a0,a1
    8020005c:	0685                	addi	a3,a3,1
    8020005e:	feb7f0e3          	bgeu	a5,a1,8020003e <printint+0x28>

  if(sign)
    80200062:	00088c63          	beqz	a7,8020007a <printint+0x64>
    buf[i++] = '-';
    80200066:	fe070793          	addi	a5,a4,-32
    8020006a:	00878733          	add	a4,a5,s0
    8020006e:	02d00793          	li	a5,45
    80200072:	fef70823          	sb	a5,-16(a4)
    80200076:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
    8020007a:	02e05563          	blez	a4,802000a4 <printint+0x8e>
    8020007e:	fd040493          	addi	s1,s0,-48
    80200082:	94ba                	add	s1,s1,a4
    80200084:	197d                	addi	s2,s2,-1
    80200086:	993a                	add	s2,s2,a4
    80200088:	377d                	addiw	a4,a4,-1
    8020008a:	1702                	slli	a4,a4,0x20
    8020008c:	9301                	srli	a4,a4,0x20
    8020008e:	40e90933          	sub	s2,s2,a4
    consputc(buf[i]);
    80200092:	fff4c503          	lbu	a0,-1(s1)
    80200096:	00007097          	auipc	ra,0x7
    8020009a:	700080e7          	jalr	1792(ra) # 80207796 <consputc>
  while(--i >= 0)
    8020009e:	14fd                	addi	s1,s1,-1
    802000a0:	ff2499e3          	bne	s1,s2,80200092 <printint+0x7c>
}
    802000a4:	70a2                	ld	ra,40(sp)
    802000a6:	7402                	ld	s0,32(sp)
    802000a8:	64e2                	ld	s1,24(sp)
    802000aa:	6942                	ld	s2,16(sp)
    802000ac:	6145                	addi	sp,sp,48
    802000ae:	8082                	ret
    x = -xx;
    802000b0:	40a0053b          	negw	a0,a0
  if(sign && (sign = xx < 0))
    802000b4:	4885                	li	a7,1
    x = -xx;
    802000b6:	bf9d                	j	8020002c <printint+0x16>

00000000802000b8 <printstring>:
void printstring(const char* s) {
    802000b8:	1101                	addi	sp,sp,-32
    802000ba:	ec06                	sd	ra,24(sp)
    802000bc:	e822                	sd	s0,16(sp)
    802000be:	e426                	sd	s1,8(sp)
    802000c0:	1000                	addi	s0,sp,32
    802000c2:	84aa                	mv	s1,a0
    while (*s)
    802000c4:	00054503          	lbu	a0,0(a0)
    802000c8:	c909                	beqz	a0,802000da <printstring+0x22>
        consputc(*s++);
    802000ca:	0485                	addi	s1,s1,1
    802000cc:	00007097          	auipc	ra,0x7
    802000d0:	6ca080e7          	jalr	1738(ra) # 80207796 <consputc>
    while (*s)
    802000d4:	0004c503          	lbu	a0,0(s1)
    802000d8:	f96d                	bnez	a0,802000ca <printstring+0x12>
}
    802000da:	60e2                	ld	ra,24(sp)
    802000dc:	6442                	ld	s0,16(sp)
    802000de:	64a2                	ld	s1,8(sp)
    802000e0:	6105                	addi	sp,sp,32
    802000e2:	8082                	ret

00000000802000e4 <backtrace>:
  for(;;)
    ;
}

void backtrace()
{
    802000e4:	7179                	addi	sp,sp,-48
    802000e6:	f406                	sd	ra,40(sp)
    802000e8:	f022                	sd	s0,32(sp)
    802000ea:	ec26                	sd	s1,24(sp)
    802000ec:	e84a                	sd	s2,16(sp)
    802000ee:	e44e                	sd	s3,8(sp)
    802000f0:	1800                	addi	s0,sp,48

static inline uint64
r_fp()
{
  uint64 x;
  asm volatile("mv %0, s0" : "=r" (x) );
    802000f2:	8922                	mv	s2,s0
  uint64 *fp = (uint64 *)r_fp();
    802000f4:	84ca                	mv	s1,s2
  uint64 *bottom = (uint64 *)PGROUNDUP((uint64)fp);
    802000f6:	6785                	lui	a5,0x1
    802000f8:	17fd                	addi	a5,a5,-1 # fff <_entry-0x801ff001>
    802000fa:	993e                	add	s2,s2,a5
    802000fc:	77fd                	lui	a5,0xfffff
    802000fe:	00f97933          	and	s2,s2,a5
  printf("backtrace:\n");
    80200102:	00009517          	auipc	a0,0x9
    80200106:	efe50513          	addi	a0,a0,-258 # 80209000 <etext>
    8020010a:	00000097          	auipc	ra,0x0
    8020010e:	084080e7          	jalr	132(ra) # 8020018e <printf>
  while (fp < bottom) {
    80200112:	0324f263          	bgeu	s1,s2,80200136 <backtrace+0x52>
    uint64 ra = *(fp - 1);
    printf("%p\n", ra - 4);
    80200116:	00009997          	auipc	s3,0x9
    8020011a:	4d298993          	addi	s3,s3,1234 # 802095e8 <digits+0x268>
    8020011e:	ff84b583          	ld	a1,-8(s1)
    80200122:	15f1                	addi	a1,a1,-4
    80200124:	854e                	mv	a0,s3
    80200126:	00000097          	auipc	ra,0x0
    8020012a:	068080e7          	jalr	104(ra) # 8020018e <printf>
    fp = (uint64 *)*(fp - 2);
    8020012e:	ff04b483          	ld	s1,-16(s1)
  while (fp < bottom) {
    80200132:	ff24e6e3          	bltu	s1,s2,8020011e <backtrace+0x3a>
  }
}
    80200136:	70a2                	ld	ra,40(sp)
    80200138:	7402                	ld	s0,32(sp)
    8020013a:	64e2                	ld	s1,24(sp)
    8020013c:	6942                	ld	s2,16(sp)
    8020013e:	69a2                	ld	s3,8(sp)
    80200140:	6145                	addi	sp,sp,48
    80200142:	8082                	ret

0000000080200144 <panic>:
{
    80200144:	1101                	addi	sp,sp,-32
    80200146:	ec06                	sd	ra,24(sp)
    80200148:	e822                	sd	s0,16(sp)
    8020014a:	e426                	sd	s1,8(sp)
    8020014c:	1000                	addi	s0,sp,32
    8020014e:	84aa                	mv	s1,a0
  printf("panic: ");
    80200150:	00009517          	auipc	a0,0x9
    80200154:	ec050513          	addi	a0,a0,-320 # 80209010 <etext+0x10>
    80200158:	00000097          	auipc	ra,0x0
    8020015c:	036080e7          	jalr	54(ra) # 8020018e <printf>
  printf(s);
    80200160:	8526                	mv	a0,s1
    80200162:	00000097          	auipc	ra,0x0
    80200166:	02c080e7          	jalr	44(ra) # 8020018e <printf>
  printf("\n");
    8020016a:	00009517          	auipc	a0,0x9
    8020016e:	f6e50513          	addi	a0,a0,-146 # 802090d8 <etext+0xd8>
    80200172:	00000097          	auipc	ra,0x0
    80200176:	01c080e7          	jalr	28(ra) # 8020018e <printf>
  backtrace();
    8020017a:	00000097          	auipc	ra,0x0
    8020017e:	f6a080e7          	jalr	-150(ra) # 802000e4 <backtrace>
  panicked = 1; // freeze uart output from other CPUs
    80200182:	4785                	li	a5,1
    80200184:	00015717          	auipc	a4,0x15
    80200188:	e6f72e23          	sw	a5,-388(a4) # 80215000 <panicked>
  for(;;)
    8020018c:	a001                	j	8020018c <panic+0x48>

000000008020018e <printf>:
{
    8020018e:	7131                	addi	sp,sp,-192
    80200190:	fc86                	sd	ra,120(sp)
    80200192:	f8a2                	sd	s0,112(sp)
    80200194:	f4a6                	sd	s1,104(sp)
    80200196:	f0ca                	sd	s2,96(sp)
    80200198:	ecce                	sd	s3,88(sp)
    8020019a:	e8d2                	sd	s4,80(sp)
    8020019c:	e4d6                	sd	s5,72(sp)
    8020019e:	e0da                	sd	s6,64(sp)
    802001a0:	fc5e                	sd	s7,56(sp)
    802001a2:	f862                	sd	s8,48(sp)
    802001a4:	f466                	sd	s9,40(sp)
    802001a6:	f06a                	sd	s10,32(sp)
    802001a8:	ec6e                	sd	s11,24(sp)
    802001aa:	0100                	addi	s0,sp,128
    802001ac:	8a2a                	mv	s4,a0
    802001ae:	e40c                	sd	a1,8(s0)
    802001b0:	e810                	sd	a2,16(s0)
    802001b2:	ec14                	sd	a3,24(s0)
    802001b4:	f018                	sd	a4,32(s0)
    802001b6:	f41c                	sd	a5,40(s0)
    802001b8:	03043823          	sd	a6,48(s0)
    802001bc:	03143c23          	sd	a7,56(s0)
  locking = pr.locking;
    802001c0:	00015d97          	auipc	s11,0x15
    802001c4:	e60dad83          	lw	s11,-416(s11) # 80215020 <pr+0x18>
  if(locking)
    802001c8:	020d9b63          	bnez	s11,802001fe <printf+0x70>
  if (fmt == 0)
    802001cc:	040a0263          	beqz	s4,80200210 <printf+0x82>
  va_start(ap, fmt);
    802001d0:	00840793          	addi	a5,s0,8
    802001d4:	f8f43423          	sd	a5,-120(s0)
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    802001d8:	000a4503          	lbu	a0,0(s4)
    802001dc:	14050f63          	beqz	a0,8020033a <printf+0x1ac>
    802001e0:	4981                	li	s3,0
    if(c != '%'){
    802001e2:	02500a93          	li	s5,37
    switch(c){
    802001e6:	07000b93          	li	s7,112
  consputc('x');
    802001ea:	4d41                	li	s10,16
    consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
    802001ec:	00009b17          	auipc	s6,0x9
    802001f0:	194b0b13          	addi	s6,s6,404 # 80209380 <digits>
    switch(c){
    802001f4:	07300c93          	li	s9,115
    802001f8:	06400c13          	li	s8,100
    802001fc:	a82d                	j	80200236 <printf+0xa8>
    acquire(&pr.lock);
    802001fe:	00015517          	auipc	a0,0x15
    80200202:	e0a50513          	addi	a0,a0,-502 # 80215008 <pr>
    80200206:	00000097          	auipc	ra,0x0
    8020020a:	4c0080e7          	jalr	1216(ra) # 802006c6 <acquire>
    8020020e:	bf7d                	j	802001cc <printf+0x3e>
    panic("null fmt");
    80200210:	00009517          	auipc	a0,0x9
    80200214:	e1050513          	addi	a0,a0,-496 # 80209020 <etext+0x20>
    80200218:	00000097          	auipc	ra,0x0
    8020021c:	f2c080e7          	jalr	-212(ra) # 80200144 <panic>
      consputc(c);
    80200220:	00007097          	auipc	ra,0x7
    80200224:	576080e7          	jalr	1398(ra) # 80207796 <consputc>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    80200228:	2985                	addiw	s3,s3,1
    8020022a:	013a07b3          	add	a5,s4,s3
    8020022e:	0007c503          	lbu	a0,0(a5) # fffffffffffff000 <ebss_clear+0xffffffff7fdd8000>
    80200232:	10050463          	beqz	a0,8020033a <printf+0x1ac>
    if(c != '%'){
    80200236:	ff5515e3          	bne	a0,s5,80200220 <printf+0x92>
    c = fmt[++i] & 0xff;
    8020023a:	2985                	addiw	s3,s3,1
    8020023c:	013a07b3          	add	a5,s4,s3
    80200240:	0007c783          	lbu	a5,0(a5)
    80200244:	0007849b          	sext.w	s1,a5
    if(c == 0)
    80200248:	cbed                	beqz	a5,8020033a <printf+0x1ac>
    switch(c){
    8020024a:	05778a63          	beq	a5,s7,8020029e <printf+0x110>
    8020024e:	02fbf663          	bgeu	s7,a5,8020027a <printf+0xec>
    80200252:	09978863          	beq	a5,s9,802002e2 <printf+0x154>
    80200256:	07800713          	li	a4,120
    8020025a:	0ce79563          	bne	a5,a4,80200324 <printf+0x196>
      printint(va_arg(ap, int), 16, 1);
    8020025e:	f8843783          	ld	a5,-120(s0)
    80200262:	00878713          	addi	a4,a5,8
    80200266:	f8e43423          	sd	a4,-120(s0)
    8020026a:	4605                	li	a2,1
    8020026c:	85ea                	mv	a1,s10
    8020026e:	4388                	lw	a0,0(a5)
    80200270:	00000097          	auipc	ra,0x0
    80200274:	da6080e7          	jalr	-602(ra) # 80200016 <printint>
      break;
    80200278:	bf45                	j	80200228 <printf+0x9a>
    switch(c){
    8020027a:	09578f63          	beq	a5,s5,80200318 <printf+0x18a>
    8020027e:	0b879363          	bne	a5,s8,80200324 <printf+0x196>
      printint(va_arg(ap, int), 10, 1);
    80200282:	f8843783          	ld	a5,-120(s0)
    80200286:	00878713          	addi	a4,a5,8
    8020028a:	f8e43423          	sd	a4,-120(s0)
    8020028e:	4605                	li	a2,1
    80200290:	45a9                	li	a1,10
    80200292:	4388                	lw	a0,0(a5)
    80200294:	00000097          	auipc	ra,0x0
    80200298:	d82080e7          	jalr	-638(ra) # 80200016 <printint>
      break;
    8020029c:	b771                	j	80200228 <printf+0x9a>
      printptr(va_arg(ap, uint64));
    8020029e:	f8843783          	ld	a5,-120(s0)
    802002a2:	00878713          	addi	a4,a5,8
    802002a6:	f8e43423          	sd	a4,-120(s0)
    802002aa:	0007b903          	ld	s2,0(a5)
  consputc('0');
    802002ae:	03000513          	li	a0,48
    802002b2:	00007097          	auipc	ra,0x7
    802002b6:	4e4080e7          	jalr	1252(ra) # 80207796 <consputc>
  consputc('x');
    802002ba:	07800513          	li	a0,120
    802002be:	00007097          	auipc	ra,0x7
    802002c2:	4d8080e7          	jalr	1240(ra) # 80207796 <consputc>
    802002c6:	84ea                	mv	s1,s10
    consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
    802002c8:	03c95793          	srli	a5,s2,0x3c
    802002cc:	97da                	add	a5,a5,s6
    802002ce:	0007c503          	lbu	a0,0(a5)
    802002d2:	00007097          	auipc	ra,0x7
    802002d6:	4c4080e7          	jalr	1220(ra) # 80207796 <consputc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    802002da:	0912                	slli	s2,s2,0x4
    802002dc:	34fd                	addiw	s1,s1,-1
    802002de:	f4ed                	bnez	s1,802002c8 <printf+0x13a>
    802002e0:	b7a1                	j	80200228 <printf+0x9a>
      if((s = va_arg(ap, char*)) == 0)
    802002e2:	f8843783          	ld	a5,-120(s0)
    802002e6:	00878713          	addi	a4,a5,8
    802002ea:	f8e43423          	sd	a4,-120(s0)
    802002ee:	6384                	ld	s1,0(a5)
    802002f0:	cc89                	beqz	s1,8020030a <printf+0x17c>
      for(; *s; s++)
    802002f2:	0004c503          	lbu	a0,0(s1)
    802002f6:	d90d                	beqz	a0,80200228 <printf+0x9a>
        consputc(*s);
    802002f8:	00007097          	auipc	ra,0x7
    802002fc:	49e080e7          	jalr	1182(ra) # 80207796 <consputc>
      for(; *s; s++)
    80200300:	0485                	addi	s1,s1,1
    80200302:	0004c503          	lbu	a0,0(s1)
    80200306:	f96d                	bnez	a0,802002f8 <printf+0x16a>
    80200308:	b705                	j	80200228 <printf+0x9a>
        s = "(null)";
    8020030a:	00009497          	auipc	s1,0x9
    8020030e:	d0e48493          	addi	s1,s1,-754 # 80209018 <etext+0x18>
      for(; *s; s++)
    80200312:	02800513          	li	a0,40
    80200316:	b7cd                	j	802002f8 <printf+0x16a>
      consputc('%');
    80200318:	8556                	mv	a0,s5
    8020031a:	00007097          	auipc	ra,0x7
    8020031e:	47c080e7          	jalr	1148(ra) # 80207796 <consputc>
      break;
    80200322:	b719                	j	80200228 <printf+0x9a>
      consputc('%');
    80200324:	8556                	mv	a0,s5
    80200326:	00007097          	auipc	ra,0x7
    8020032a:	470080e7          	jalr	1136(ra) # 80207796 <consputc>
      consputc(c);
    8020032e:	8526                	mv	a0,s1
    80200330:	00007097          	auipc	ra,0x7
    80200334:	466080e7          	jalr	1126(ra) # 80207796 <consputc>
      break;
    80200338:	bdc5                	j	80200228 <printf+0x9a>
  if(locking)
    8020033a:	020d9163          	bnez	s11,8020035c <printf+0x1ce>
}
    8020033e:	70e6                	ld	ra,120(sp)
    80200340:	7446                	ld	s0,112(sp)
    80200342:	74a6                	ld	s1,104(sp)
    80200344:	7906                	ld	s2,96(sp)
    80200346:	69e6                	ld	s3,88(sp)
    80200348:	6a46                	ld	s4,80(sp)
    8020034a:	6aa6                	ld	s5,72(sp)
    8020034c:	6b06                	ld	s6,64(sp)
    8020034e:	7be2                	ld	s7,56(sp)
    80200350:	7c42                	ld	s8,48(sp)
    80200352:	7ca2                	ld	s9,40(sp)
    80200354:	7d02                	ld	s10,32(sp)
    80200356:	6de2                	ld	s11,24(sp)
    80200358:	6129                	addi	sp,sp,192
    8020035a:	8082                	ret
    release(&pr.lock);
    8020035c:	00015517          	auipc	a0,0x15
    80200360:	cac50513          	addi	a0,a0,-852 # 80215008 <pr>
    80200364:	00000097          	auipc	ra,0x0
    80200368:	3b6080e7          	jalr	950(ra) # 8020071a <release>
}
    8020036c:	bfc9                	j	8020033e <printf+0x1b0>

000000008020036e <printfinit>:

void
printfinit(void)
{
    8020036e:	1141                	addi	sp,sp,-16
    80200370:	e406                	sd	ra,8(sp)
    80200372:	e022                	sd	s0,0(sp)
    80200374:	0800                	addi	s0,sp,16
  initlock(&pr.lock, "pr");
    80200376:	00009597          	auipc	a1,0x9
    8020037a:	cba58593          	addi	a1,a1,-838 # 80209030 <etext+0x30>
    8020037e:	00015517          	auipc	a0,0x15
    80200382:	c8a50513          	addi	a0,a0,-886 # 80215008 <pr>
    80200386:	00000097          	auipc	ra,0x0
    8020038a:	2fc080e7          	jalr	764(ra) # 80200682 <initlock>
  pr.locking = 1;   // changed, used to be 1
    8020038e:	4785                	li	a5,1
    80200390:	00015717          	auipc	a4,0x15
    80200394:	c8f72823          	sw	a5,-880(a4) # 80215020 <pr+0x18>
}
    80200398:	60a2                	ld	ra,8(sp)
    8020039a:	6402                	ld	s0,0(sp)
    8020039c:	0141                	addi	sp,sp,16
    8020039e:	8082                	ret

00000000802003a0 <print_logo>:

#ifdef QEMU
void print_logo() {
    802003a0:	1141                	addi	sp,sp,-16
    802003a2:	e406                	sd	ra,8(sp)
    802003a4:	e022                	sd	s0,0(sp)
    802003a6:	0800                	addi	s0,sp,16
    printf("  (`-.            (`-.                            .-')       ('-.    _   .-')\n");
    802003a8:	00009517          	auipc	a0,0x9
    802003ac:	c9050513          	addi	a0,a0,-880 # 80209038 <etext+0x38>
    802003b0:	00000097          	auipc	ra,0x0
    802003b4:	dde080e7          	jalr	-546(ra) # 8020018e <printf>
    printf(" ( OO ).        _(OO  )_                        .(  OO)    _(  OO)  ( '.( OO )_ \n");
    802003b8:	00009517          	auipc	a0,0x9
    802003bc:	cd050513          	addi	a0,a0,-816 # 80209088 <etext+0x88>
    802003c0:	00000097          	auipc	ra,0x0
    802003c4:	dce080e7          	jalr	-562(ra) # 8020018e <printf>
    printf("(_/.  \\_)-. ,--(_/   ,. \\  ,--.                (_)---\\_)  (,------.  ,--.   ,--.) ,--. ,--.  \n");
    802003c8:	00009517          	auipc	a0,0x9
    802003cc:	d1850513          	addi	a0,a0,-744 # 802090e0 <etext+0xe0>
    802003d0:	00000097          	auipc	ra,0x0
    802003d4:	dbe080e7          	jalr	-578(ra) # 8020018e <printf>
    printf(" \\  `.'  /  \\   \\   /(__/ /  .'       .-')     '  .-.  '   |  .---'  |   `.'   |  |  | |  |   \n");
    802003d8:	00009517          	auipc	a0,0x9
    802003dc:	d6850513          	addi	a0,a0,-664 # 80209140 <etext+0x140>
    802003e0:	00000097          	auipc	ra,0x0
    802003e4:	dae080e7          	jalr	-594(ra) # 8020018e <printf>
    printf("  \\     /\\   \\   \\ /   / .  / -.    _(  OO)   ,|  | |  |   |  |      |         |  |  | | .-')\n");
    802003e8:	00009517          	auipc	a0,0x9
    802003ec:	db850513          	addi	a0,a0,-584 # 802091a0 <etext+0x1a0>
    802003f0:	00000097          	auipc	ra,0x0
    802003f4:	d9e080e7          	jalr	-610(ra) # 8020018e <printf>
    printf("   \\   \\ |    \\   '   /, | .-.  '  (,------. (_|  | |  |  (|  '--.   |  |'.'|  |  |  |_|( OO )\n");
    802003f8:	00009517          	auipc	a0,0x9
    802003fc:	e0850513          	addi	a0,a0,-504 # 80209200 <etext+0x200>
    80200400:	00000097          	auipc	ra,0x0
    80200404:	d8e080e7          	jalr	-626(ra) # 8020018e <printf>
    printf("  .'    \\_)    \\     /__)' \\  |  |  '------'   |  | |  |   |  .--'   |  |   |  |  |  | | `-' /\n");
    80200408:	00009517          	auipc	a0,0x9
    8020040c:	e5850513          	addi	a0,a0,-424 # 80209260 <etext+0x260>
    80200410:	00000097          	auipc	ra,0x0
    80200414:	d7e080e7          	jalr	-642(ra) # 8020018e <printf>
    printf(" /  .'.  \\      \\   /    \\  `'  /              '  '-'  '-. |  `---.  |  |   |  | ('  '-'(_.-'\n");
    80200418:	00009517          	auipc	a0,0x9
    8020041c:	ea850513          	addi	a0,a0,-344 # 802092c0 <etext+0x2c0>
    80200420:	00000097          	auipc	ra,0x0
    80200424:	d6e080e7          	jalr	-658(ra) # 8020018e <printf>
    printf("'--'   '--'      `-'      `----'                `-----'--' `------'  `--'   `--'   `-----'\n");
    80200428:	00009517          	auipc	a0,0x9
    8020042c:	ef850513          	addi	a0,a0,-264 # 80209320 <etext+0x320>
    80200430:	00000097          	auipc	ra,0x0
    80200434:	d5e080e7          	jalr	-674(ra) # 8020018e <printf>
}
    80200438:	60a2                	ld	ra,8(sp)
    8020043a:	6402                	ld	s0,0(sp)
    8020043c:	0141                	addi	sp,sp,16
    8020043e:	8082                	ret

0000000080200440 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(void *pa)
{
    80200440:	1101                	addi	sp,sp,-32
    80200442:	ec06                	sd	ra,24(sp)
    80200444:	e822                	sd	s0,16(sp)
    80200446:	e426                	sd	s1,8(sp)
    80200448:	e04a                	sd	s2,0(sp)
    8020044a:	1000                	addi	s0,sp,32
  struct run *r;
  
  if(((uint64)pa % PGSIZE) != 0 || (char*)pa < kernel_end || (uint64)pa >= PHYSTOP)
    8020044c:	03451793          	slli	a5,a0,0x34
    80200450:	e3ad                	bnez	a5,802004b2 <kfree+0x72>
    80200452:	84aa                	mv	s1,a0
    80200454:	0000d797          	auipc	a5,0xd
    80200458:	88c7b783          	ld	a5,-1908(a5) # 8020cce0 <_GLOBAL_OFFSET_TABLE_+0x28>
    8020045c:	04f56b63          	bltu	a0,a5,802004b2 <kfree+0x72>
    80200460:	40300793          	li	a5,1027
    80200464:	07d6                	slli	a5,a5,0x15
    80200466:	04f57663          	bgeu	a0,a5,802004b2 <kfree+0x72>
    panic("kfree");

  // Fill with junk to catch dangling refs.
  memset(pa, 1, PGSIZE);
    8020046a:	6605                	lui	a2,0x1
    8020046c:	4585                	li	a1,1
    8020046e:	00000097          	auipc	ra,0x0
    80200472:	2f4080e7          	jalr	756(ra) # 80200762 <memset>

  r = (struct run*)pa;

  acquire(&kmem.lock);
    80200476:	00015917          	auipc	s2,0x15
    8020047a:	bb290913          	addi	s2,s2,-1102 # 80215028 <kmem>
    8020047e:	854a                	mv	a0,s2
    80200480:	00000097          	auipc	ra,0x0
    80200484:	246080e7          	jalr	582(ra) # 802006c6 <acquire>
  r->next = kmem.freelist;
    80200488:	01893783          	ld	a5,24(s2)
    8020048c:	e09c                	sd	a5,0(s1)
  kmem.freelist = r;
    8020048e:	00993c23          	sd	s1,24(s2)
  kmem.npage++;
    80200492:	02093783          	ld	a5,32(s2)
    80200496:	0785                	addi	a5,a5,1
    80200498:	02f93023          	sd	a5,32(s2)
  release(&kmem.lock);
    8020049c:	854a                	mv	a0,s2
    8020049e:	00000097          	auipc	ra,0x0
    802004a2:	27c080e7          	jalr	636(ra) # 8020071a <release>
}
    802004a6:	60e2                	ld	ra,24(sp)
    802004a8:	6442                	ld	s0,16(sp)
    802004aa:	64a2                	ld	s1,8(sp)
    802004ac:	6902                	ld	s2,0(sp)
    802004ae:	6105                	addi	sp,sp,32
    802004b0:	8082                	ret
    panic("kfree");
    802004b2:	00009517          	auipc	a0,0x9
    802004b6:	ee650513          	addi	a0,a0,-282 # 80209398 <digits+0x18>
    802004ba:	00000097          	auipc	ra,0x0
    802004be:	c8a080e7          	jalr	-886(ra) # 80200144 <panic>

00000000802004c2 <freerange>:
{
    802004c2:	7179                	addi	sp,sp,-48
    802004c4:	f406                	sd	ra,40(sp)
    802004c6:	f022                	sd	s0,32(sp)
    802004c8:	ec26                	sd	s1,24(sp)
    802004ca:	e84a                	sd	s2,16(sp)
    802004cc:	e44e                	sd	s3,8(sp)
    802004ce:	e052                	sd	s4,0(sp)
    802004d0:	1800                	addi	s0,sp,48
  p = (char*)PGROUNDUP((uint64)pa_start);
    802004d2:	6785                	lui	a5,0x1
    802004d4:	fff78713          	addi	a4,a5,-1 # fff <_entry-0x801ff001>
    802004d8:	00e504b3          	add	s1,a0,a4
    802004dc:	777d                	lui	a4,0xfffff
    802004de:	8cf9                	and	s1,s1,a4
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    802004e0:	94be                	add	s1,s1,a5
    802004e2:	0095ee63          	bltu	a1,s1,802004fe <freerange+0x3c>
    802004e6:	892e                	mv	s2,a1
    kfree(p);
    802004e8:	7a7d                	lui	s4,0xfffff
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    802004ea:	6985                	lui	s3,0x1
    kfree(p);
    802004ec:	01448533          	add	a0,s1,s4
    802004f0:	00000097          	auipc	ra,0x0
    802004f4:	f50080e7          	jalr	-176(ra) # 80200440 <kfree>
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    802004f8:	94ce                	add	s1,s1,s3
    802004fa:	fe9979e3          	bgeu	s2,s1,802004ec <freerange+0x2a>
}
    802004fe:	70a2                	ld	ra,40(sp)
    80200500:	7402                	ld	s0,32(sp)
    80200502:	64e2                	ld	s1,24(sp)
    80200504:	6942                	ld	s2,16(sp)
    80200506:	69a2                	ld	s3,8(sp)
    80200508:	6a02                	ld	s4,0(sp)
    8020050a:	6145                	addi	sp,sp,48
    8020050c:	8082                	ret

000000008020050e <kinit>:
{
    8020050e:	1101                	addi	sp,sp,-32
    80200510:	ec06                	sd	ra,24(sp)
    80200512:	e822                	sd	s0,16(sp)
    80200514:	e426                	sd	s1,8(sp)
    80200516:	1000                	addi	s0,sp,32
  initlock(&kmem.lock, "kmem");
    80200518:	00015497          	auipc	s1,0x15
    8020051c:	b1048493          	addi	s1,s1,-1264 # 80215028 <kmem>
    80200520:	00009597          	auipc	a1,0x9
    80200524:	e8058593          	addi	a1,a1,-384 # 802093a0 <digits+0x20>
    80200528:	8526                	mv	a0,s1
    8020052a:	00000097          	auipc	ra,0x0
    8020052e:	158080e7          	jalr	344(ra) # 80200682 <initlock>
  kmem.freelist = 0;
    80200532:	0004bc23          	sd	zero,24(s1)
  kmem.npage = 0;
    80200536:	0204b023          	sd	zero,32(s1)
  freerange(kernel_end, (void*)PHYSTOP);
    8020053a:	40300593          	li	a1,1027
    8020053e:	05d6                	slli	a1,a1,0x15
    80200540:	0000c517          	auipc	a0,0xc
    80200544:	7a053503          	ld	a0,1952(a0) # 8020cce0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80200548:	00000097          	auipc	ra,0x0
    8020054c:	f7a080e7          	jalr	-134(ra) # 802004c2 <freerange>
}
    80200550:	60e2                	ld	ra,24(sp)
    80200552:	6442                	ld	s0,16(sp)
    80200554:	64a2                	ld	s1,8(sp)
    80200556:	6105                	addi	sp,sp,32
    80200558:	8082                	ret

000000008020055a <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
void *
kalloc(void)
{
    8020055a:	1101                	addi	sp,sp,-32
    8020055c:	ec06                	sd	ra,24(sp)
    8020055e:	e822                	sd	s0,16(sp)
    80200560:	e426                	sd	s1,8(sp)
    80200562:	1000                	addi	s0,sp,32
  struct run *r;

  acquire(&kmem.lock);
    80200564:	00015497          	auipc	s1,0x15
    80200568:	ac448493          	addi	s1,s1,-1340 # 80215028 <kmem>
    8020056c:	8526                	mv	a0,s1
    8020056e:	00000097          	auipc	ra,0x0
    80200572:	158080e7          	jalr	344(ra) # 802006c6 <acquire>
  r = kmem.freelist;
    80200576:	6c84                	ld	s1,24(s1)
  if(r) {
    80200578:	c89d                	beqz	s1,802005ae <kalloc+0x54>
    kmem.freelist = r->next;
    8020057a:	609c                	ld	a5,0(s1)
    8020057c:	00015517          	auipc	a0,0x15
    80200580:	aac50513          	addi	a0,a0,-1364 # 80215028 <kmem>
    80200584:	ed1c                	sd	a5,24(a0)
    kmem.npage--;
    80200586:	711c                	ld	a5,32(a0)
    80200588:	17fd                	addi	a5,a5,-1
    8020058a:	f11c                	sd	a5,32(a0)
  }
  release(&kmem.lock);
    8020058c:	00000097          	auipc	ra,0x0
    80200590:	18e080e7          	jalr	398(ra) # 8020071a <release>

  if(r)
    memset((char*)r, 5, PGSIZE); // fill with junk
    80200594:	6605                	lui	a2,0x1
    80200596:	4595                	li	a1,5
    80200598:	8526                	mv	a0,s1
    8020059a:	00000097          	auipc	ra,0x0
    8020059e:	1c8080e7          	jalr	456(ra) # 80200762 <memset>
  return (void*)r;
}
    802005a2:	8526                	mv	a0,s1
    802005a4:	60e2                	ld	ra,24(sp)
    802005a6:	6442                	ld	s0,16(sp)
    802005a8:	64a2                	ld	s1,8(sp)
    802005aa:	6105                	addi	sp,sp,32
    802005ac:	8082                	ret
  release(&kmem.lock);
    802005ae:	00015517          	auipc	a0,0x15
    802005b2:	a7a50513          	addi	a0,a0,-1414 # 80215028 <kmem>
    802005b6:	00000097          	auipc	ra,0x0
    802005ba:	164080e7          	jalr	356(ra) # 8020071a <release>
  if(r)
    802005be:	b7d5                	j	802005a2 <kalloc+0x48>

00000000802005c0 <freemem_amount>:

uint64
freemem_amount(void)
{
    802005c0:	1141                	addi	sp,sp,-16
    802005c2:	e422                	sd	s0,8(sp)
    802005c4:	0800                	addi	s0,sp,16
  return kmem.npage << PGSHIFT;
}
    802005c6:	00015517          	auipc	a0,0x15
    802005ca:	a8253503          	ld	a0,-1406(a0) # 80215048 <kmem+0x20>
    802005ce:	0532                	slli	a0,a0,0xc
    802005d0:	6422                	ld	s0,8(sp)
    802005d2:	0141                	addi	sp,sp,16
    802005d4:	8082                	ret

00000000802005d6 <push_off>:
// it takes two pop_off()s to undo two push_off()s.  Also, if interrupts
// are initially off, then push_off, pop_off leaves them off.

void
push_off(void)
{
    802005d6:	1101                	addi	sp,sp,-32
    802005d8:	ec06                	sd	ra,24(sp)
    802005da:	e822                	sd	s0,16(sp)
    802005dc:	e426                	sd	s1,8(sp)
    802005de:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802005e0:	100024f3          	csrr	s1,sstatus
    802005e4:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    802005e8:	9bf5                	andi	a5,a5,-3
  asm volatile("csrw sstatus, %0" : : "r" (x));
    802005ea:	10079073          	csrw	sstatus,a5
  int old = intr_get();

  intr_off();
  //printf("\e[32mpush_off()\e[0m: cpuid(): %d\n", cpuid());
  if(mycpu()->noff == 0)
    802005ee:	00001097          	auipc	ra,0x1
    802005f2:	484080e7          	jalr	1156(ra) # 80201a72 <mycpu>
    802005f6:	5d3c                	lw	a5,120(a0)
    802005f8:	cf89                	beqz	a5,80200612 <push_off+0x3c>
    mycpu()->intena = old;
  mycpu()->noff += 1;
    802005fa:	00001097          	auipc	ra,0x1
    802005fe:	478080e7          	jalr	1144(ra) # 80201a72 <mycpu>
    80200602:	5d3c                	lw	a5,120(a0)
    80200604:	2785                	addiw	a5,a5,1
    80200606:	dd3c                	sw	a5,120(a0)
}
    80200608:	60e2                	ld	ra,24(sp)
    8020060a:	6442                	ld	s0,16(sp)
    8020060c:	64a2                	ld	s1,8(sp)
    8020060e:	6105                	addi	sp,sp,32
    80200610:	8082                	ret
    mycpu()->intena = old;
    80200612:	00001097          	auipc	ra,0x1
    80200616:	460080e7          	jalr	1120(ra) # 80201a72 <mycpu>
  return (x & SSTATUS_SIE) != 0;
    8020061a:	8085                	srli	s1,s1,0x1
    8020061c:	8885                	andi	s1,s1,1
    8020061e:	dd64                	sw	s1,124(a0)
    80200620:	bfe9                	j	802005fa <push_off+0x24>

0000000080200622 <pop_off>:

void
pop_off(void)
{
    80200622:	1141                	addi	sp,sp,-16
    80200624:	e406                	sd	ra,8(sp)
    80200626:	e022                	sd	s0,0(sp)
    80200628:	0800                	addi	s0,sp,16
  struct cpu *c = mycpu();
    8020062a:	00001097          	auipc	ra,0x1
    8020062e:	448080e7          	jalr	1096(ra) # 80201a72 <mycpu>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80200632:	100027f3          	csrr	a5,sstatus
  return (x & SSTATUS_SIE) != 0;
    80200636:	8b89                	andi	a5,a5,2

  //printf("\e[31mpop_off()\e[0m: cpuid(): %d\n", cpuid());
  if(intr_get())
    80200638:	e78d                	bnez	a5,80200662 <pop_off+0x40>
    panic("pop_off - interruptible");
  if(c->noff < 1) {
    8020063a:	5d3c                	lw	a5,120(a0)
    8020063c:	02f05b63          	blez	a5,80200672 <pop_off+0x50>
    //printf("c->noff = %d\n", c->noff);
    panic("pop_off");
  }
  //printf("c->noff: %d\n", c->noff);
  //printf("c: %x\n", c);
  c->noff -= 1;
    80200640:	37fd                	addiw	a5,a5,-1
    80200642:	0007871b          	sext.w	a4,a5
    80200646:	dd3c                	sw	a5,120(a0)
  if(c->noff == 0 && c->intena)
    80200648:	eb09                	bnez	a4,8020065a <pop_off+0x38>
    8020064a:	5d7c                	lw	a5,124(a0)
    8020064c:	c799                	beqz	a5,8020065a <pop_off+0x38>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    8020064e:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80200652:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80200656:	10079073          	csrw	sstatus,a5
    intr_on();
}
    8020065a:	60a2                	ld	ra,8(sp)
    8020065c:	6402                	ld	s0,0(sp)
    8020065e:	0141                	addi	sp,sp,16
    80200660:	8082                	ret
    panic("pop_off - interruptible");
    80200662:	00009517          	auipc	a0,0x9
    80200666:	d4650513          	addi	a0,a0,-698 # 802093a8 <digits+0x28>
    8020066a:	00000097          	auipc	ra,0x0
    8020066e:	ada080e7          	jalr	-1318(ra) # 80200144 <panic>
    panic("pop_off");
    80200672:	00009517          	auipc	a0,0x9
    80200676:	d4e50513          	addi	a0,a0,-690 # 802093c0 <digits+0x40>
    8020067a:	00000097          	auipc	ra,0x0
    8020067e:	aca080e7          	jalr	-1334(ra) # 80200144 <panic>

0000000080200682 <initlock>:
#include "include/intr.h"
#include "include/printf.h"

void
initlock(struct spinlock *lk, char *name)
{
    80200682:	1141                	addi	sp,sp,-16
    80200684:	e422                	sd	s0,8(sp)
    80200686:	0800                	addi	s0,sp,16
  lk->name = name;
    80200688:	e50c                	sd	a1,8(a0)
  lk->locked = 0;
    8020068a:	00052023          	sw	zero,0(a0)
  lk->cpu = 0;
    8020068e:	00053823          	sd	zero,16(a0)
}
    80200692:	6422                	ld	s0,8(sp)
    80200694:	0141                	addi	sp,sp,16
    80200696:	8082                	ret

0000000080200698 <holding>:
// Interrupts must be off.
int
holding(struct spinlock *lk)
{
  int r;
  r = (lk->locked && lk->cpu == mycpu());
    80200698:	411c                	lw	a5,0(a0)
    8020069a:	e399                	bnez	a5,802006a0 <holding+0x8>
    8020069c:	4501                	li	a0,0
  return r;
}
    8020069e:	8082                	ret
{
    802006a0:	1101                	addi	sp,sp,-32
    802006a2:	ec06                	sd	ra,24(sp)
    802006a4:	e822                	sd	s0,16(sp)
    802006a6:	e426                	sd	s1,8(sp)
    802006a8:	1000                	addi	s0,sp,32
  r = (lk->locked && lk->cpu == mycpu());
    802006aa:	6904                	ld	s1,16(a0)
    802006ac:	00001097          	auipc	ra,0x1
    802006b0:	3c6080e7          	jalr	966(ra) # 80201a72 <mycpu>
    802006b4:	40a48533          	sub	a0,s1,a0
    802006b8:	00153513          	seqz	a0,a0
}
    802006bc:	60e2                	ld	ra,24(sp)
    802006be:	6442                	ld	s0,16(sp)
    802006c0:	64a2                	ld	s1,8(sp)
    802006c2:	6105                	addi	sp,sp,32
    802006c4:	8082                	ret

00000000802006c6 <acquire>:
{
    802006c6:	1101                	addi	sp,sp,-32
    802006c8:	ec06                	sd	ra,24(sp)
    802006ca:	e822                	sd	s0,16(sp)
    802006cc:	e426                	sd	s1,8(sp)
    802006ce:	1000                	addi	s0,sp,32
    802006d0:	84aa                	mv	s1,a0
  push_off(); // disable interrupts to avoid deadlock.
    802006d2:	00000097          	auipc	ra,0x0
    802006d6:	f04080e7          	jalr	-252(ra) # 802005d6 <push_off>
  if(holding(lk))
    802006da:	8526                	mv	a0,s1
    802006dc:	00000097          	auipc	ra,0x0
    802006e0:	fbc080e7          	jalr	-68(ra) # 80200698 <holding>
  while(__sync_lock_test_and_set(&lk->locked, 1) != 0)
    802006e4:	4705                	li	a4,1
  if(holding(lk))
    802006e6:	e115                	bnez	a0,8020070a <acquire+0x44>
  while(__sync_lock_test_and_set(&lk->locked, 1) != 0)
    802006e8:	87ba                	mv	a5,a4
    802006ea:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    802006ee:	2781                	sext.w	a5,a5
    802006f0:	ffe5                	bnez	a5,802006e8 <acquire+0x22>
  __sync_synchronize();
    802006f2:	0ff0000f          	fence
  lk->cpu = mycpu();
    802006f6:	00001097          	auipc	ra,0x1
    802006fa:	37c080e7          	jalr	892(ra) # 80201a72 <mycpu>
    802006fe:	e888                	sd	a0,16(s1)
}
    80200700:	60e2                	ld	ra,24(sp)
    80200702:	6442                	ld	s0,16(sp)
    80200704:	64a2                	ld	s1,8(sp)
    80200706:	6105                	addi	sp,sp,32
    80200708:	8082                	ret
    panic("acquire");
    8020070a:	00009517          	auipc	a0,0x9
    8020070e:	cbe50513          	addi	a0,a0,-834 # 802093c8 <digits+0x48>
    80200712:	00000097          	auipc	ra,0x0
    80200716:	a32080e7          	jalr	-1486(ra) # 80200144 <panic>

000000008020071a <release>:
{
    8020071a:	1101                	addi	sp,sp,-32
    8020071c:	ec06                	sd	ra,24(sp)
    8020071e:	e822                	sd	s0,16(sp)
    80200720:	e426                	sd	s1,8(sp)
    80200722:	1000                	addi	s0,sp,32
    80200724:	84aa                	mv	s1,a0
  if(!holding(lk))
    80200726:	00000097          	auipc	ra,0x0
    8020072a:	f72080e7          	jalr	-142(ra) # 80200698 <holding>
    8020072e:	c115                	beqz	a0,80200752 <release+0x38>
  lk->cpu = 0;
    80200730:	0004b823          	sd	zero,16(s1)
  __sync_synchronize();
    80200734:	0ff0000f          	fence
  __sync_lock_release(&lk->locked);
    80200738:	0f50000f          	fence	iorw,ow
    8020073c:	0804a02f          	amoswap.w	zero,zero,(s1)
  pop_off();
    80200740:	00000097          	auipc	ra,0x0
    80200744:	ee2080e7          	jalr	-286(ra) # 80200622 <pop_off>
}
    80200748:	60e2                	ld	ra,24(sp)
    8020074a:	6442                	ld	s0,16(sp)
    8020074c:	64a2                	ld	s1,8(sp)
    8020074e:	6105                	addi	sp,sp,32
    80200750:	8082                	ret
    panic("release");
    80200752:	00009517          	auipc	a0,0x9
    80200756:	c7e50513          	addi	a0,a0,-898 # 802093d0 <digits+0x50>
    8020075a:	00000097          	auipc	ra,0x0
    8020075e:	9ea080e7          	jalr	-1558(ra) # 80200144 <panic>

0000000080200762 <memset>:
#include "include/types.h"

void*
memset(void *dst, int c, uint n)
{
    80200762:	1141                	addi	sp,sp,-16
    80200764:	e422                	sd	s0,8(sp)
    80200766:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
    80200768:	ca19                	beqz	a2,8020077e <memset+0x1c>
    8020076a:	87aa                	mv	a5,a0
    8020076c:	1602                	slli	a2,a2,0x20
    8020076e:	9201                	srli	a2,a2,0x20
    80200770:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
    80200774:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
    80200778:	0785                	addi	a5,a5,1
    8020077a:	fee79de3          	bne	a5,a4,80200774 <memset+0x12>
  }
  return dst;
}
    8020077e:	6422                	ld	s0,8(sp)
    80200780:	0141                	addi	sp,sp,16
    80200782:	8082                	ret

0000000080200784 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
    80200784:	1141                	addi	sp,sp,-16
    80200786:	e422                	sd	s0,8(sp)
    80200788:	0800                	addi	s0,sp,16
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
    8020078a:	ca05                	beqz	a2,802007ba <memcmp+0x36>
    8020078c:	fff6069b          	addiw	a3,a2,-1 # fff <_entry-0x801ff001>
    80200790:	1682                	slli	a3,a3,0x20
    80200792:	9281                	srli	a3,a3,0x20
    80200794:	0685                	addi	a3,a3,1
    80200796:	96aa                	add	a3,a3,a0
    if(*s1 != *s2)
    80200798:	00054783          	lbu	a5,0(a0)
    8020079c:	0005c703          	lbu	a4,0(a1)
    802007a0:	00e79863          	bne	a5,a4,802007b0 <memcmp+0x2c>
      return *s1 - *s2;
    s1++, s2++;
    802007a4:	0505                	addi	a0,a0,1
    802007a6:	0585                	addi	a1,a1,1
  while(n-- > 0){
    802007a8:	fed518e3          	bne	a0,a3,80200798 <memcmp+0x14>
  }

  return 0;
    802007ac:	4501                	li	a0,0
    802007ae:	a019                	j	802007b4 <memcmp+0x30>
      return *s1 - *s2;
    802007b0:	40e7853b          	subw	a0,a5,a4
}
    802007b4:	6422                	ld	s0,8(sp)
    802007b6:	0141                	addi	sp,sp,16
    802007b8:	8082                	ret
  return 0;
    802007ba:	4501                	li	a0,0
    802007bc:	bfe5                	j	802007b4 <memcmp+0x30>

00000000802007be <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
    802007be:	1141                	addi	sp,sp,-16
    802007c0:	e422                	sd	s0,8(sp)
    802007c2:	0800                	addi	s0,sp,16
  const char *s;
  char *d;

  s = src;
  d = dst;
  if(s < d && s + n > d){
    802007c4:	02a5e563          	bltu	a1,a0,802007ee <memmove+0x30>
    s += n;
    d += n;
    while(n-- > 0)
      *--d = *--s;
  } else
    while(n-- > 0)
    802007c8:	fff6069b          	addiw	a3,a2,-1
    802007cc:	ce11                	beqz	a2,802007e8 <memmove+0x2a>
    802007ce:	1682                	slli	a3,a3,0x20
    802007d0:	9281                	srli	a3,a3,0x20
    802007d2:	0685                	addi	a3,a3,1
    802007d4:	96ae                	add	a3,a3,a1
    802007d6:	87aa                	mv	a5,a0
      *d++ = *s++;
    802007d8:	0585                	addi	a1,a1,1
    802007da:	0785                	addi	a5,a5,1
    802007dc:	fff5c703          	lbu	a4,-1(a1)
    802007e0:	fee78fa3          	sb	a4,-1(a5)
    while(n-- > 0)
    802007e4:	fed59ae3          	bne	a1,a3,802007d8 <memmove+0x1a>

  return dst;
}
    802007e8:	6422                	ld	s0,8(sp)
    802007ea:	0141                	addi	sp,sp,16
    802007ec:	8082                	ret
  if(s < d && s + n > d){
    802007ee:	02061713          	slli	a4,a2,0x20
    802007f2:	9301                	srli	a4,a4,0x20
    802007f4:	00e587b3          	add	a5,a1,a4
    802007f8:	fcf578e3          	bgeu	a0,a5,802007c8 <memmove+0xa>
    d += n;
    802007fc:	972a                	add	a4,a4,a0
    while(n-- > 0)
    802007fe:	fff6069b          	addiw	a3,a2,-1
    80200802:	d27d                	beqz	a2,802007e8 <memmove+0x2a>
    80200804:	02069613          	slli	a2,a3,0x20
    80200808:	9201                	srli	a2,a2,0x20
    8020080a:	fff64613          	not	a2,a2
    8020080e:	963e                	add	a2,a2,a5
      *--d = *--s;
    80200810:	17fd                	addi	a5,a5,-1
    80200812:	177d                	addi	a4,a4,-1 # ffffffffffffefff <ebss_clear+0xffffffff7fdd7fff>
    80200814:	0007c683          	lbu	a3,0(a5)
    80200818:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
    8020081c:	fef61ae3          	bne	a2,a5,80200810 <memmove+0x52>
    80200820:	b7e1                	j	802007e8 <memmove+0x2a>

0000000080200822 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
    80200822:	1141                	addi	sp,sp,-16
    80200824:	e406                	sd	ra,8(sp)
    80200826:	e022                	sd	s0,0(sp)
    80200828:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
    8020082a:	00000097          	auipc	ra,0x0
    8020082e:	f94080e7          	jalr	-108(ra) # 802007be <memmove>
}
    80200832:	60a2                	ld	ra,8(sp)
    80200834:	6402                	ld	s0,0(sp)
    80200836:	0141                	addi	sp,sp,16
    80200838:	8082                	ret

000000008020083a <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
    8020083a:	1141                	addi	sp,sp,-16
    8020083c:	e422                	sd	s0,8(sp)
    8020083e:	0800                	addi	s0,sp,16
  while(n > 0 && *p && *p == *q)
    80200840:	ce11                	beqz	a2,8020085c <strncmp+0x22>
    80200842:	00054783          	lbu	a5,0(a0)
    80200846:	cf89                	beqz	a5,80200860 <strncmp+0x26>
    80200848:	0005c703          	lbu	a4,0(a1)
    8020084c:	00f71a63          	bne	a4,a5,80200860 <strncmp+0x26>
    n--, p++, q++;
    80200850:	367d                	addiw	a2,a2,-1
    80200852:	0505                	addi	a0,a0,1
    80200854:	0585                	addi	a1,a1,1
  while(n > 0 && *p && *p == *q)
    80200856:	f675                	bnez	a2,80200842 <strncmp+0x8>
  if(n == 0)
    return 0;
    80200858:	4501                	li	a0,0
    8020085a:	a809                	j	8020086c <strncmp+0x32>
    8020085c:	4501                	li	a0,0
    8020085e:	a039                	j	8020086c <strncmp+0x32>
  if(n == 0)
    80200860:	ca09                	beqz	a2,80200872 <strncmp+0x38>
  return (uchar)*p - (uchar)*q;
    80200862:	00054503          	lbu	a0,0(a0)
    80200866:	0005c783          	lbu	a5,0(a1)
    8020086a:	9d1d                	subw	a0,a0,a5
}
    8020086c:	6422                	ld	s0,8(sp)
    8020086e:	0141                	addi	sp,sp,16
    80200870:	8082                	ret
    return 0;
    80200872:	4501                	li	a0,0
    80200874:	bfe5                	j	8020086c <strncmp+0x32>

0000000080200876 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
    80200876:	1141                	addi	sp,sp,-16
    80200878:	e422                	sd	s0,8(sp)
    8020087a:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    8020087c:	872a                	mv	a4,a0
    8020087e:	8832                	mv	a6,a2
    80200880:	367d                	addiw	a2,a2,-1
    80200882:	01005963          	blez	a6,80200894 <strncpy+0x1e>
    80200886:	0705                	addi	a4,a4,1
    80200888:	0005c783          	lbu	a5,0(a1)
    8020088c:	fef70fa3          	sb	a5,-1(a4)
    80200890:	0585                	addi	a1,a1,1
    80200892:	f7f5                	bnez	a5,8020087e <strncpy+0x8>
    ;
  while(n-- > 0)
    80200894:	86ba                	mv	a3,a4
    80200896:	00c05c63          	blez	a2,802008ae <strncpy+0x38>
    *s++ = 0;
    8020089a:	0685                	addi	a3,a3,1
    8020089c:	fe068fa3          	sb	zero,-1(a3)
  while(n-- > 0)
    802008a0:	40d707bb          	subw	a5,a4,a3
    802008a4:	37fd                	addiw	a5,a5,-1
    802008a6:	010787bb          	addw	a5,a5,a6
    802008aa:	fef048e3          	bgtz	a5,8020089a <strncpy+0x24>
  return os;
}
    802008ae:	6422                	ld	s0,8(sp)
    802008b0:	0141                	addi	sp,sp,16
    802008b2:	8082                	ret

00000000802008b4 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
    802008b4:	1141                	addi	sp,sp,-16
    802008b6:	e422                	sd	s0,8(sp)
    802008b8:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  if(n <= 0)
    802008ba:	02c05363          	blez	a2,802008e0 <safestrcpy+0x2c>
    802008be:	fff6069b          	addiw	a3,a2,-1
    802008c2:	1682                	slli	a3,a3,0x20
    802008c4:	9281                	srli	a3,a3,0x20
    802008c6:	96ae                	add	a3,a3,a1
    802008c8:	87aa                	mv	a5,a0
    return os;
  while(--n > 0 && (*s++ = *t++) != 0)
    802008ca:	00d58963          	beq	a1,a3,802008dc <safestrcpy+0x28>
    802008ce:	0585                	addi	a1,a1,1
    802008d0:	0785                	addi	a5,a5,1
    802008d2:	fff5c703          	lbu	a4,-1(a1)
    802008d6:	fee78fa3          	sb	a4,-1(a5)
    802008da:	fb65                	bnez	a4,802008ca <safestrcpy+0x16>
    ;
  *s = 0;
    802008dc:	00078023          	sb	zero,0(a5)
  return os;
}
    802008e0:	6422                	ld	s0,8(sp)
    802008e2:	0141                	addi	sp,sp,16
    802008e4:	8082                	ret

00000000802008e6 <strlen>:

int
strlen(const char *s)
{
    802008e6:	1141                	addi	sp,sp,-16
    802008e8:	e422                	sd	s0,8(sp)
    802008ea:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
    802008ec:	00054783          	lbu	a5,0(a0)
    802008f0:	cf91                	beqz	a5,8020090c <strlen+0x26>
    802008f2:	0505                	addi	a0,a0,1
    802008f4:	87aa                	mv	a5,a0
    802008f6:	4685                	li	a3,1
    802008f8:	9e89                	subw	a3,a3,a0
    802008fa:	00f6853b          	addw	a0,a3,a5
    802008fe:	0785                	addi	a5,a5,1
    80200900:	fff7c703          	lbu	a4,-1(a5)
    80200904:	fb7d                	bnez	a4,802008fa <strlen+0x14>
    ;
  return n;
}
    80200906:	6422                	ld	s0,8(sp)
    80200908:	0141                	addi	sp,sp,16
    8020090a:	8082                	ret
  for(n = 0; s[n]; n++)
    8020090c:	4501                	li	a0,0
    8020090e:	bfe5                	j	80200906 <strlen+0x20>

0000000080200910 <wnstr>:

// convert uchar string into wide char string 
void wnstr(wchar *dst, char const *src, int len) {
    80200910:	1141                	addi	sp,sp,-16
    80200912:	e422                	sd	s0,8(sp)
    80200914:	0800                	addi	s0,sp,16
  while (len -- && *src) {
    80200916:	c20d                	beqz	a2,80200938 <wnstr+0x28>
    80200918:	02061793          	slli	a5,a2,0x20
    8020091c:	01f7d613          	srli	a2,a5,0x1f
    80200920:	00c50733          	add	a4,a0,a2
    80200924:	0005c783          	lbu	a5,0(a1)
    80200928:	cb81                	beqz	a5,80200938 <wnstr+0x28>
    *(uchar*)dst = *src++;
    8020092a:	0585                	addi	a1,a1,1
    8020092c:	00f50023          	sb	a5,0(a0)
    dst ++;
    80200930:	0509                	addi	a0,a0,2
  while (len -- && *src) {
    80200932:	fee519e3          	bne	a0,a4,80200924 <wnstr+0x14>
    dst ++;
    80200936:	853a                	mv	a0,a4
  }

  *dst = 0;
    80200938:	00051023          	sh	zero,0(a0)
}
    8020093c:	6422                	ld	s0,8(sp)
    8020093e:	0141                	addi	sp,sp,16
    80200940:	8082                	ret

0000000080200942 <snstr>:

// convert wide char string into uchar string 
void snstr(char *dst, wchar const *src, int len) {
    80200942:	1141                	addi	sp,sp,-16
    80200944:	e422                	sd	s0,8(sp)
    80200946:	0800                	addi	s0,sp,16
  while (len -- && *src) {
    80200948:	fff6071b          	addiw	a4,a2,-1
    8020094c:	02061693          	slli	a3,a2,0x20
    80200950:	9281                	srli	a3,a3,0x20
    80200952:	96aa                	add	a3,a3,a0
    80200954:	c61d                	beqz	a2,80200982 <snstr+0x40>
    80200956:	0005d783          	lhu	a5,0(a1)
    8020095a:	cb89                	beqz	a5,8020096c <snstr+0x2a>
    *dst++ = (uchar)(*src & 0xff);
    8020095c:	0505                	addi	a0,a0,1
    8020095e:	fef50fa3          	sb	a5,-1(a0)
    src ++;
    80200962:	0589                	addi	a1,a1,2
  while (len -- && *src) {
    80200964:	377d                	addiw	a4,a4,-1
    80200966:	fed518e3          	bne	a0,a3,80200956 <snstr+0x14>
    *dst++ = (uchar)(*src & 0xff);
    8020096a:	8536                	mv	a0,a3
  }
  while(len-- > 0)
    8020096c:	02071793          	slli	a5,a4,0x20
    80200970:	9381                	srli	a5,a5,0x20
    80200972:	97aa                	add	a5,a5,a0
    80200974:	00e05763          	blez	a4,80200982 <snstr+0x40>
    *dst++ = 0;
    80200978:	0505                	addi	a0,a0,1
    8020097a:	fe050fa3          	sb	zero,-1(a0)
  while(len-- > 0)
    8020097e:	fea79de3          	bne	a5,a0,80200978 <snstr+0x36>
}
    80200982:	6422                	ld	s0,8(sp)
    80200984:	0141                	addi	sp,sp,16
    80200986:	8082                	ret

0000000080200988 <wcsncmp>:

int wcsncmp(wchar const *s1, wchar const *s2, int len) {
    80200988:	1141                	addi	sp,sp,-16
    8020098a:	e422                	sd	s0,8(sp)
    8020098c:	0800                	addi	s0,sp,16
    8020098e:	872a                	mv	a4,a0
  int ret = 0;

  while (len-- && *s1) {
    80200990:	02061793          	slli	a5,a2,0x20
    80200994:	01f7d613          	srli	a2,a5,0x1f
    80200998:	962e                	add	a2,a2,a1
    8020099a:	00c58f63          	beq	a1,a2,802009b8 <wcsncmp+0x30>
    8020099e:	00075783          	lhu	a5,0(a4)
    802009a2:	cb89                	beqz	a5,802009b4 <wcsncmp+0x2c>
    ret = (int)(*s1++ - *s2++);
    802009a4:	0709                	addi	a4,a4,2
    802009a6:	0589                	addi	a1,a1,2
    802009a8:	ffe5d683          	lhu	a3,-2(a1)
    802009ac:	40d7853b          	subw	a0,a5,a3
    if (ret) break;
    802009b0:	d56d                	beqz	a0,8020099a <wcsncmp+0x12>
    802009b2:	a021                	j	802009ba <wcsncmp+0x32>
    802009b4:	4501                	li	a0,0
    802009b6:	a011                	j	802009ba <wcsncmp+0x32>
    802009b8:	4501                	li	a0,0
  }

  return ret;
}
    802009ba:	6422                	ld	s0,8(sp)
    802009bc:	0141                	addi	sp,sp,16
    802009be:	8082                	ret

00000000802009c0 <strchr>:

char*
strchr(const char *s, char c)
{
    802009c0:	1141                	addi	sp,sp,-16
    802009c2:	e422                	sd	s0,8(sp)
    802009c4:	0800                	addi	s0,sp,16
  for(; *s; s++)
    802009c6:	00054783          	lbu	a5,0(a0)
    802009ca:	cb99                	beqz	a5,802009e0 <strchr+0x20>
    if(*s == c)
    802009cc:	00f58763          	beq	a1,a5,802009da <strchr+0x1a>
  for(; *s; s++)
    802009d0:	0505                	addi	a0,a0,1
    802009d2:	00054783          	lbu	a5,0(a0)
    802009d6:	fbfd                	bnez	a5,802009cc <strchr+0xc>
      return (char*)s;
  return 0;
    802009d8:	4501                	li	a0,0
    802009da:	6422                	ld	s0,8(sp)
    802009dc:	0141                	addi	sp,sp,16
    802009de:	8082                	ret
  return 0;
    802009e0:	4501                	li	a0,0
    802009e2:	bfe5                	j	802009da <strchr+0x1a>

00000000802009e4 <main>:

volatile static int started = 0;

void
main(unsigned long hartid, unsigned long dtb_pa)
{
    802009e4:	1101                	addi	sp,sp,-32
    802009e6:	ec06                	sd	ra,24(sp)
    802009e8:	e822                	sd	s0,16(sp)
    802009ea:	1000                	addi	s0,sp,32
  asm volatile("mv tp, %0" : : "r" (hartid & 0x1));
    802009ec:	00157793          	andi	a5,a0,1
    802009f0:	823e                	mv	tp,a5
    started = 1;
  }
  else
  {
    // hart 1
    while (started == 0)
    802009f2:	00014717          	auipc	a4,0x14
    802009f6:	65e70713          	addi	a4,a4,1630 # 80215050 <started>
  if (hartid == 0) {
    802009fa:	cd15                	beqz	a0,80200a36 <main+0x52>
    while (started == 0)
    802009fc:	431c                	lw	a5,0(a4)
    802009fe:	2781                	sext.w	a5,a5
    80200a00:	dff5                	beqz	a5,802009fc <main+0x18>
      ;
    __sync_synchronize();
    80200a02:	0ff0000f          	fence
    #ifdef DEBUG
    printf("hart %d enter main()...\n", hartid);
    #endif
    kvminithart();
    80200a06:	00000097          	auipc	ra,0x0
    80200a0a:	0de080e7          	jalr	222(ra) # 80200ae4 <kvminithart>
    trapinithart();
    80200a0e:	00002097          	auipc	ra,0x2
    80200a12:	fb2080e7          	jalr	-78(ra) # 802029c0 <trapinithart>
    plicinithart();  // ask PLIC for device interrupts
    80200a16:	00007097          	auipc	ra,0x7
    80200a1a:	b3e080e7          	jalr	-1218(ra) # 80207554 <plicinithart>
    printf("hart 1 init done\n");
    80200a1e:	00009517          	auipc	a0,0x9
    80200a22:	9d250513          	addi	a0,a0,-1582 # 802093f0 <digits+0x70>
    80200a26:	fffff097          	auipc	ra,0xfffff
    80200a2a:	768080e7          	jalr	1896(ra) # 8020018e <printf>
  }
  scheduler();
    80200a2e:	00001097          	auipc	ra,0x1
    80200a32:	5e4080e7          	jalr	1508(ra) # 80202012 <scheduler>
    consoleinit();
    80200a36:	00007097          	auipc	ra,0x7
    80200a3a:	f30080e7          	jalr	-208(ra) # 80207966 <consoleinit>
    printfinit();   // init a lock for printf 
    80200a3e:	00000097          	auipc	ra,0x0
    80200a42:	930080e7          	jalr	-1744(ra) # 8020036e <printfinit>
    print_logo();
    80200a46:	00000097          	auipc	ra,0x0
    80200a4a:	95a080e7          	jalr	-1702(ra) # 802003a0 <print_logo>
    kinit();         // physical page allocator
    80200a4e:	00000097          	auipc	ra,0x0
    80200a52:	ac0080e7          	jalr	-1344(ra) # 8020050e <kinit>
    kvminit();       // create kernel page table
    80200a56:	00000097          	auipc	ra,0x0
    80200a5a:	2d8080e7          	jalr	728(ra) # 80200d2e <kvminit>
    kvminithart();   // turn on paging
    80200a5e:	00000097          	auipc	ra,0x0
    80200a62:	086080e7          	jalr	134(ra) # 80200ae4 <kvminithart>
    timerinit();     // init a lock for timer
    80200a66:	00005097          	auipc	ra,0x5
    80200a6a:	fd8080e7          	jalr	-40(ra) # 80205a3e <timerinit>
    trapinithart();  // install kernel trap vector, including interrupt handler
    80200a6e:	00002097          	auipc	ra,0x2
    80200a72:	f52080e7          	jalr	-174(ra) # 802029c0 <trapinithart>
    procinit();
    80200a76:	00001097          	auipc	ra,0x1
    80200a7a:	f76080e7          	jalr	-138(ra) # 802019ec <procinit>
    plicinit();
    80200a7e:	00007097          	auipc	ra,0x7
    80200a82:	abe080e7          	jalr	-1346(ra) # 8020753c <plicinit>
    plicinithart();
    80200a86:	00007097          	auipc	ra,0x7
    80200a8a:	ace080e7          	jalr	-1330(ra) # 80207554 <plicinithart>
    disk_init();
    80200a8e:	00005097          	auipc	ra,0x5
    80200a92:	04c080e7          	jalr	76(ra) # 80205ada <disk_init>
    binit();         // buffer cache
    80200a96:	00003097          	auipc	ra,0x3
    80200a9a:	e46080e7          	jalr	-442(ra) # 802038dc <binit>
    fileinit();      // file table
    80200a9e:	00003097          	auipc	ra,0x3
    80200aa2:	24a080e7          	jalr	586(ra) # 80203ce8 <fileinit>
    userinit();      // first user process
    80200aa6:	00001097          	auipc	ra,0x1
    80200aaa:	2f6080e7          	jalr	758(ra) # 80201d9c <userinit>
    printf("hart 0 init done\n");
    80200aae:	00009517          	auipc	a0,0x9
    80200ab2:	92a50513          	addi	a0,a0,-1750 # 802093d8 <digits+0x58>
    80200ab6:	fffff097          	auipc	ra,0xfffff
    80200aba:	6d8080e7          	jalr	1752(ra) # 8020018e <printf>
      unsigned long mask = 1 << i;
    80200abe:	4789                	li	a5,2
    80200ac0:	fef43423          	sd	a5,-24(s0)
	SBI_CALL_0(SBI_CLEAR_IPI);
}

static inline void sbi_send_ipi(const unsigned long *hart_mask)
{
	SBI_CALL_1(SBI_SEND_IPI, hart_mask);
    80200ac4:	fe840513          	addi	a0,s0,-24
    80200ac8:	4581                	li	a1,0
    80200aca:	4601                	li	a2,0
    80200acc:	4681                	li	a3,0
    80200ace:	4891                	li	a7,4
    80200ad0:	00000073          	ecall
    __sync_synchronize();
    80200ad4:	0ff0000f          	fence
    started = 1;
    80200ad8:	4785                	li	a5,1
    80200ada:	00014717          	auipc	a4,0x14
    80200ade:	56f72b23          	sw	a5,1398(a4) # 80215050 <started>
    80200ae2:	b7b1                	j	80200a2e <main+0x4a>

0000000080200ae4 <kvminithart>:

// Switch h/w page table register to the kernel's page table,
// and enable paging.
void
kvminithart()
{
    80200ae4:	1141                	addi	sp,sp,-16
    80200ae6:	e422                	sd	s0,8(sp)
    80200ae8:	0800                	addi	s0,sp,16
  w_satp(MAKE_SATP(kernel_pagetable));
    80200aea:	00014797          	auipc	a5,0x14
    80200aee:	56e7b783          	ld	a5,1390(a5) # 80215058 <kernel_pagetable>
    80200af2:	83b1                	srli	a5,a5,0xc
    80200af4:	577d                	li	a4,-1
    80200af6:	177e                	slli	a4,a4,0x3f
    80200af8:	8fd9                	or	a5,a5,a4
  asm volatile("csrw satp, %0" : : "r" (x));
    80200afa:	18079073          	csrw	satp,a5
static inline void
sfence_vma()
{
  // the zero, zero means flush all TLB entries.
  // asm volatile("sfence.vma zero, zero");
  asm volatile("sfence.vma");
    80200afe:	12000073          	sfence.vma
  // reg_info();
  sfence_vma();
  #ifdef DEBUG
  printf("kvminithart\n");
  #endif
}
    80200b02:	6422                	ld	s0,8(sp)
    80200b04:	0141                	addi	sp,sp,16
    80200b06:	8082                	ret

0000000080200b08 <walk>:
//   21..29 -- 9 bits of level-1 index.
//   12..20 -- 9 bits of level-0 index.
//    0..11 -- 12 bits of byte offset within the page.
pte_t *
walk(pagetable_t pagetable, uint64 va, int alloc)
{
    80200b08:	7139                	addi	sp,sp,-64
    80200b0a:	fc06                	sd	ra,56(sp)
    80200b0c:	f822                	sd	s0,48(sp)
    80200b0e:	f426                	sd	s1,40(sp)
    80200b10:	f04a                	sd	s2,32(sp)
    80200b12:	ec4e                	sd	s3,24(sp)
    80200b14:	e852                	sd	s4,16(sp)
    80200b16:	e456                	sd	s5,8(sp)
    80200b18:	e05a                	sd	s6,0(sp)
    80200b1a:	0080                	addi	s0,sp,64
    80200b1c:	84aa                	mv	s1,a0
    80200b1e:	89ae                	mv	s3,a1
    80200b20:	8ab2                	mv	s5,a2
  
  if(va >= MAXVA)
    80200b22:	57fd                	li	a5,-1
    80200b24:	83e9                	srli	a5,a5,0x1a
    80200b26:	4a79                	li	s4,30
    panic("walk");

  for(int level = 2; level > 0; level--) {
    80200b28:	4b31                	li	s6,12
  if(va >= MAXVA)
    80200b2a:	04b7f263          	bgeu	a5,a1,80200b6e <walk+0x66>
    panic("walk");
    80200b2e:	00009517          	auipc	a0,0x9
    80200b32:	8da50513          	addi	a0,a0,-1830 # 80209408 <digits+0x88>
    80200b36:	fffff097          	auipc	ra,0xfffff
    80200b3a:	60e080e7          	jalr	1550(ra) # 80200144 <panic>
    pte_t *pte = &pagetable[PX(level, va)];
    if(*pte & PTE_V) {
      pagetable = (pagetable_t)PTE2PA(*pte);
    } else {
      if(!alloc || (pagetable = (pde_t*)kalloc()) == NULL)
    80200b3e:	060a8663          	beqz	s5,80200baa <walk+0xa2>
    80200b42:	00000097          	auipc	ra,0x0
    80200b46:	a18080e7          	jalr	-1512(ra) # 8020055a <kalloc>
    80200b4a:	84aa                	mv	s1,a0
    80200b4c:	c529                	beqz	a0,80200b96 <walk+0x8e>
        return NULL;
      memset(pagetable, 0, PGSIZE);
    80200b4e:	6605                	lui	a2,0x1
    80200b50:	4581                	li	a1,0
    80200b52:	00000097          	auipc	ra,0x0
    80200b56:	c10080e7          	jalr	-1008(ra) # 80200762 <memset>
      *pte = PA2PTE(pagetable) | PTE_V;
    80200b5a:	00c4d793          	srli	a5,s1,0xc
    80200b5e:	07aa                	slli	a5,a5,0xa
    80200b60:	0017e793          	ori	a5,a5,1
    80200b64:	00f93023          	sd	a5,0(s2)
  for(int level = 2; level > 0; level--) {
    80200b68:	3a5d                	addiw	s4,s4,-9 # ffffffffffffeff7 <ebss_clear+0xffffffff7fdd7ff7>
    80200b6a:	036a0063          	beq	s4,s6,80200b8a <walk+0x82>
    pte_t *pte = &pagetable[PX(level, va)];
    80200b6e:	0149d933          	srl	s2,s3,s4
    80200b72:	1ff97913          	andi	s2,s2,511
    80200b76:	090e                	slli	s2,s2,0x3
    80200b78:	9926                	add	s2,s2,s1
    if(*pte & PTE_V) {
    80200b7a:	00093483          	ld	s1,0(s2)
    80200b7e:	0014f793          	andi	a5,s1,1
    80200b82:	dfd5                	beqz	a5,80200b3e <walk+0x36>
      pagetable = (pagetable_t)PTE2PA(*pte);
    80200b84:	80a9                	srli	s1,s1,0xa
    80200b86:	04b2                	slli	s1,s1,0xc
    80200b88:	b7c5                	j	80200b68 <walk+0x60>
    }
  }
  return &pagetable[PX(0, va)];
    80200b8a:	00c9d513          	srli	a0,s3,0xc
    80200b8e:	1ff57513          	andi	a0,a0,511
    80200b92:	050e                	slli	a0,a0,0x3
    80200b94:	9526                	add	a0,a0,s1
}
    80200b96:	70e2                	ld	ra,56(sp)
    80200b98:	7442                	ld	s0,48(sp)
    80200b9a:	74a2                	ld	s1,40(sp)
    80200b9c:	7902                	ld	s2,32(sp)
    80200b9e:	69e2                	ld	s3,24(sp)
    80200ba0:	6a42                	ld	s4,16(sp)
    80200ba2:	6aa2                	ld	s5,8(sp)
    80200ba4:	6b02                	ld	s6,0(sp)
    80200ba6:	6121                	addi	sp,sp,64
    80200ba8:	8082                	ret
        return NULL;
    80200baa:	4501                	li	a0,0
    80200bac:	b7ed                	j	80200b96 <walk+0x8e>

0000000080200bae <walkaddr>:
walkaddr(pagetable_t pagetable, uint64 va)
{
  pte_t *pte;
  uint64 pa;

  if(va >= MAXVA)
    80200bae:	57fd                	li	a5,-1
    80200bb0:	83e9                	srli	a5,a5,0x1a
    80200bb2:	00b7f463          	bgeu	a5,a1,80200bba <walkaddr+0xc>
    return NULL;
    80200bb6:	4501                	li	a0,0
    return NULL;
  if((*pte & PTE_U) == 0)
    return NULL;
  pa = PTE2PA(*pte);
  return pa;
}
    80200bb8:	8082                	ret
{
    80200bba:	1141                	addi	sp,sp,-16
    80200bbc:	e406                	sd	ra,8(sp)
    80200bbe:	e022                	sd	s0,0(sp)
    80200bc0:	0800                	addi	s0,sp,16
  pte = walk(pagetable, va, 0);
    80200bc2:	4601                	li	a2,0
    80200bc4:	00000097          	auipc	ra,0x0
    80200bc8:	f44080e7          	jalr	-188(ra) # 80200b08 <walk>
  if(pte == 0)
    80200bcc:	c105                	beqz	a0,80200bec <walkaddr+0x3e>
  if((*pte & PTE_V) == 0)
    80200bce:	611c                	ld	a5,0(a0)
  if((*pte & PTE_U) == 0)
    80200bd0:	0117f693          	andi	a3,a5,17
    80200bd4:	4745                	li	a4,17
    return NULL;
    80200bd6:	4501                	li	a0,0
  if((*pte & PTE_U) == 0)
    80200bd8:	00e68663          	beq	a3,a4,80200be4 <walkaddr+0x36>
}
    80200bdc:	60a2                	ld	ra,8(sp)
    80200bde:	6402                	ld	s0,0(sp)
    80200be0:	0141                	addi	sp,sp,16
    80200be2:	8082                	ret
  pa = PTE2PA(*pte);
    80200be4:	83a9                	srli	a5,a5,0xa
    80200be6:	00c79513          	slli	a0,a5,0xc
  return pa;
    80200bea:	bfcd                	j	80200bdc <walkaddr+0x2e>
    return NULL;
    80200bec:	4501                	li	a0,0
    80200bee:	b7fd                	j	80200bdc <walkaddr+0x2e>

0000000080200bf0 <kwalkaddr>:
  return kwalkaddr(kernel_pagetable, va);
}

uint64
kwalkaddr(pagetable_t kpt, uint64 va)
{
    80200bf0:	1101                	addi	sp,sp,-32
    80200bf2:	ec06                	sd	ra,24(sp)
    80200bf4:	e822                	sd	s0,16(sp)
    80200bf6:	e426                	sd	s1,8(sp)
    80200bf8:	1000                	addi	s0,sp,32
  uint64 off = va % PGSIZE;
    80200bfa:	03459793          	slli	a5,a1,0x34
    80200bfe:	0347d493          	srli	s1,a5,0x34
  pte_t *pte;
  uint64 pa;
  
  pte = walk(kpt, va, 0);
    80200c02:	4601                	li	a2,0
    80200c04:	00000097          	auipc	ra,0x0
    80200c08:	f04080e7          	jalr	-252(ra) # 80200b08 <walk>
  if(pte == 0)
    80200c0c:	cd09                	beqz	a0,80200c26 <kwalkaddr+0x36>
    panic("kvmpa");
  if((*pte & PTE_V) == 0)
    80200c0e:	6108                	ld	a0,0(a0)
    80200c10:	00157793          	andi	a5,a0,1
    80200c14:	c38d                	beqz	a5,80200c36 <kwalkaddr+0x46>
    panic("kvmpa");
  pa = PTE2PA(*pte);
    80200c16:	8129                	srli	a0,a0,0xa
    80200c18:	0532                	slli	a0,a0,0xc
  return pa+off;
}
    80200c1a:	9526                	add	a0,a0,s1
    80200c1c:	60e2                	ld	ra,24(sp)
    80200c1e:	6442                	ld	s0,16(sp)
    80200c20:	64a2                	ld	s1,8(sp)
    80200c22:	6105                	addi	sp,sp,32
    80200c24:	8082                	ret
    panic("kvmpa");
    80200c26:	00008517          	auipc	a0,0x8
    80200c2a:	7ea50513          	addi	a0,a0,2026 # 80209410 <digits+0x90>
    80200c2e:	fffff097          	auipc	ra,0xfffff
    80200c32:	516080e7          	jalr	1302(ra) # 80200144 <panic>
    panic("kvmpa");
    80200c36:	00008517          	auipc	a0,0x8
    80200c3a:	7da50513          	addi	a0,a0,2010 # 80209410 <digits+0x90>
    80200c3e:	fffff097          	auipc	ra,0xfffff
    80200c42:	506080e7          	jalr	1286(ra) # 80200144 <panic>

0000000080200c46 <kvmpa>:
{
    80200c46:	1141                	addi	sp,sp,-16
    80200c48:	e406                	sd	ra,8(sp)
    80200c4a:	e022                	sd	s0,0(sp)
    80200c4c:	0800                	addi	s0,sp,16
    80200c4e:	85aa                	mv	a1,a0
  return kwalkaddr(kernel_pagetable, va);
    80200c50:	00014517          	auipc	a0,0x14
    80200c54:	40853503          	ld	a0,1032(a0) # 80215058 <kernel_pagetable>
    80200c58:	00000097          	auipc	ra,0x0
    80200c5c:	f98080e7          	jalr	-104(ra) # 80200bf0 <kwalkaddr>
}
    80200c60:	60a2                	ld	ra,8(sp)
    80200c62:	6402                	ld	s0,0(sp)
    80200c64:	0141                	addi	sp,sp,16
    80200c66:	8082                	ret

0000000080200c68 <mappages>:
// physical addresses starting at pa. va and size might not
// be page-aligned. Returns 0 on success, -1 if walk() couldn't
// allocate a needed page-table page.
int
mappages(pagetable_t pagetable, uint64 va, uint64 size, uint64 pa, int perm)
{
    80200c68:	715d                	addi	sp,sp,-80
    80200c6a:	e486                	sd	ra,72(sp)
    80200c6c:	e0a2                	sd	s0,64(sp)
    80200c6e:	fc26                	sd	s1,56(sp)
    80200c70:	f84a                	sd	s2,48(sp)
    80200c72:	f44e                	sd	s3,40(sp)
    80200c74:	f052                	sd	s4,32(sp)
    80200c76:	ec56                	sd	s5,24(sp)
    80200c78:	e85a                	sd	s6,16(sp)
    80200c7a:	e45e                	sd	s7,8(sp)
    80200c7c:	0880                	addi	s0,sp,80
    80200c7e:	8aaa                	mv	s5,a0
    80200c80:	8b3a                	mv	s6,a4
  uint64 a, last;
  pte_t *pte;

  a = PGROUNDDOWN(va);
    80200c82:	777d                	lui	a4,0xfffff
    80200c84:	00e5f7b3          	and	a5,a1,a4
  last = PGROUNDDOWN(va + size - 1);
    80200c88:	fff60993          	addi	s3,a2,-1 # fff <_entry-0x801ff001>
    80200c8c:	99ae                	add	s3,s3,a1
    80200c8e:	00e9f9b3          	and	s3,s3,a4
  a = PGROUNDDOWN(va);
    80200c92:	893e                	mv	s2,a5
    80200c94:	40f68a33          	sub	s4,a3,a5
    if(*pte & PTE_V)
      panic("remap");
    *pte = PA2PTE(pa) | perm | PTE_V;
    if(a == last)
      break;
    a += PGSIZE;
    80200c98:	6b85                	lui	s7,0x1
    80200c9a:	012a04b3          	add	s1,s4,s2
    if((pte = walk(pagetable, a, 1)) == NULL)
    80200c9e:	4605                	li	a2,1
    80200ca0:	85ca                	mv	a1,s2
    80200ca2:	8556                	mv	a0,s5
    80200ca4:	00000097          	auipc	ra,0x0
    80200ca8:	e64080e7          	jalr	-412(ra) # 80200b08 <walk>
    80200cac:	c51d                	beqz	a0,80200cda <mappages+0x72>
    if(*pte & PTE_V)
    80200cae:	611c                	ld	a5,0(a0)
    80200cb0:	8b85                	andi	a5,a5,1
    80200cb2:	ef81                	bnez	a5,80200cca <mappages+0x62>
    *pte = PA2PTE(pa) | perm | PTE_V;
    80200cb4:	80b1                	srli	s1,s1,0xc
    80200cb6:	04aa                	slli	s1,s1,0xa
    80200cb8:	0164e4b3          	or	s1,s1,s6
    80200cbc:	0014e493          	ori	s1,s1,1
    80200cc0:	e104                	sd	s1,0(a0)
    if(a == last)
    80200cc2:	03390863          	beq	s2,s3,80200cf2 <mappages+0x8a>
    a += PGSIZE;
    80200cc6:	995e                	add	s2,s2,s7
    if((pte = walk(pagetable, a, 1)) == NULL)
    80200cc8:	bfc9                	j	80200c9a <mappages+0x32>
      panic("remap");
    80200cca:	00008517          	auipc	a0,0x8
    80200cce:	74e50513          	addi	a0,a0,1870 # 80209418 <digits+0x98>
    80200cd2:	fffff097          	auipc	ra,0xfffff
    80200cd6:	472080e7          	jalr	1138(ra) # 80200144 <panic>
      return -1;
    80200cda:	557d                	li	a0,-1
    pa += PGSIZE;
  }
  return 0;
}
    80200cdc:	60a6                	ld	ra,72(sp)
    80200cde:	6406                	ld	s0,64(sp)
    80200ce0:	74e2                	ld	s1,56(sp)
    80200ce2:	7942                	ld	s2,48(sp)
    80200ce4:	79a2                	ld	s3,40(sp)
    80200ce6:	7a02                	ld	s4,32(sp)
    80200ce8:	6ae2                	ld	s5,24(sp)
    80200cea:	6b42                	ld	s6,16(sp)
    80200cec:	6ba2                	ld	s7,8(sp)
    80200cee:	6161                	addi	sp,sp,80
    80200cf0:	8082                	ret
  return 0;
    80200cf2:	4501                	li	a0,0
    80200cf4:	b7e5                	j	80200cdc <mappages+0x74>

0000000080200cf6 <kvmmap>:
{
    80200cf6:	1141                	addi	sp,sp,-16
    80200cf8:	e406                	sd	ra,8(sp)
    80200cfa:	e022                	sd	s0,0(sp)
    80200cfc:	0800                	addi	s0,sp,16
    80200cfe:	8736                	mv	a4,a3
  if(mappages(kernel_pagetable, va ,sz, pa, perm) != 0)
    80200d00:	86ae                	mv	a3,a1
    80200d02:	85aa                	mv	a1,a0
    80200d04:	00014517          	auipc	a0,0x14
    80200d08:	35453503          	ld	a0,852(a0) # 80215058 <kernel_pagetable>
    80200d0c:	00000097          	auipc	ra,0x0
    80200d10:	f5c080e7          	jalr	-164(ra) # 80200c68 <mappages>
    80200d14:	e509                	bnez	a0,80200d1e <kvmmap+0x28>
}
    80200d16:	60a2                	ld	ra,8(sp)
    80200d18:	6402                	ld	s0,0(sp)
    80200d1a:	0141                	addi	sp,sp,16
    80200d1c:	8082                	ret
    panic("kvmmap");
    80200d1e:	00008517          	auipc	a0,0x8
    80200d22:	70250513          	addi	a0,a0,1794 # 80209420 <digits+0xa0>
    80200d26:	fffff097          	auipc	ra,0xfffff
    80200d2a:	41e080e7          	jalr	1054(ra) # 80200144 <panic>

0000000080200d2e <kvminit>:
{
    80200d2e:	1101                	addi	sp,sp,-32
    80200d30:	ec06                	sd	ra,24(sp)
    80200d32:	e822                	sd	s0,16(sp)
    80200d34:	e426                	sd	s1,8(sp)
    80200d36:	1000                	addi	s0,sp,32
  kernel_pagetable = (pagetable_t) kalloc();
    80200d38:	00000097          	auipc	ra,0x0
    80200d3c:	822080e7          	jalr	-2014(ra) # 8020055a <kalloc>
    80200d40:	00014717          	auipc	a4,0x14
    80200d44:	30a73c23          	sd	a0,792(a4) # 80215058 <kernel_pagetable>
  memset(kernel_pagetable, 0, PGSIZE);
    80200d48:	6605                	lui	a2,0x1
    80200d4a:	4581                	li	a1,0
    80200d4c:	00000097          	auipc	ra,0x0
    80200d50:	a16080e7          	jalr	-1514(ra) # 80200762 <memset>
  kvmmap(UART_V, UART, PGSIZE, PTE_R | PTE_W);
    80200d54:	4699                	li	a3,6
    80200d56:	6605                	lui	a2,0x1
    80200d58:	100005b7          	lui	a1,0x10000
    80200d5c:	3f100513          	li	a0,1009
    80200d60:	0572                	slli	a0,a0,0x1c
    80200d62:	00000097          	auipc	ra,0x0
    80200d66:	f94080e7          	jalr	-108(ra) # 80200cf6 <kvmmap>
  kvmmap(VIRTIO0_V, VIRTIO0, PGSIZE, PTE_R | PTE_W);
    80200d6a:	4699                	li	a3,6
    80200d6c:	6605                	lui	a2,0x1
    80200d6e:	100015b7          	lui	a1,0x10001
    80200d72:	03f10537          	lui	a0,0x3f10
    80200d76:	0505                	addi	a0,a0,1 # 3f10001 <_entry-0x7c2effff>
    80200d78:	0532                	slli	a0,a0,0xc
    80200d7a:	00000097          	auipc	ra,0x0
    80200d7e:	f7c080e7          	jalr	-132(ra) # 80200cf6 <kvmmap>
  kvmmap(CLINT_V, CLINT, 0x10000, PTE_R | PTE_W);
    80200d82:	4699                	li	a3,6
    80200d84:	6641                	lui	a2,0x10
    80200d86:	020005b7          	lui	a1,0x2000
    80200d8a:	01f81537          	lui	a0,0x1f81
    80200d8e:	0536                	slli	a0,a0,0xd
    80200d90:	00000097          	auipc	ra,0x0
    80200d94:	f66080e7          	jalr	-154(ra) # 80200cf6 <kvmmap>
  kvmmap(PLIC_V, PLIC, 0x4000, PTE_R | PTE_W);
    80200d98:	4699                	li	a3,6
    80200d9a:	6611                	lui	a2,0x4
    80200d9c:	0c0005b7          	lui	a1,0xc000
    80200da0:	00fc3537          	lui	a0,0xfc3
    80200da4:	053a                	slli	a0,a0,0xe
    80200da6:	00000097          	auipc	ra,0x0
    80200daa:	f50080e7          	jalr	-176(ra) # 80200cf6 <kvmmap>
  kvmmap(PLIC_V + 0x200000, PLIC + 0x200000, 0x4000, PTE_R | PTE_W);
    80200dae:	4699                	li	a3,6
    80200db0:	6611                	lui	a2,0x4
    80200db2:	0c2005b7          	lui	a1,0xc200
    80200db6:	1f861537          	lui	a0,0x1f861
    80200dba:	0526                	slli	a0,a0,0x9
    80200dbc:	00000097          	auipc	ra,0x0
    80200dc0:	f3a080e7          	jalr	-198(ra) # 80200cf6 <kvmmap>
  kvmmap(KERNBASE, KERNBASE, (uint64)etext - KERNBASE, PTE_R | PTE_X);
    80200dc4:	0000c497          	auipc	s1,0xc
    80200dc8:	f144b483          	ld	s1,-236(s1) # 8020ccd8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80200dcc:	46a9                	li	a3,10
    80200dce:	bff00613          	li	a2,-1025
    80200dd2:	0656                	slli	a2,a2,0x15
    80200dd4:	9626                	add	a2,a2,s1
    80200dd6:	40100593          	li	a1,1025
    80200dda:	05d6                	slli	a1,a1,0x15
    80200ddc:	852e                	mv	a0,a1
    80200dde:	00000097          	auipc	ra,0x0
    80200de2:	f18080e7          	jalr	-232(ra) # 80200cf6 <kvmmap>
  kvmmap((uint64)etext, (uint64)etext, PHYSTOP - (uint64)etext, PTE_R | PTE_W);
    80200de6:	4699                	li	a3,6
    80200de8:	40300613          	li	a2,1027
    80200dec:	0656                	slli	a2,a2,0x15
    80200dee:	8e05                	sub	a2,a2,s1
    80200df0:	85a6                	mv	a1,s1
    80200df2:	8526                	mv	a0,s1
    80200df4:	00000097          	auipc	ra,0x0
    80200df8:	f02080e7          	jalr	-254(ra) # 80200cf6 <kvmmap>
  kvmmap(TRAMPOLINE, (uint64)trampoline, PGSIZE, PTE_R | PTE_X);
    80200dfc:	46a9                	li	a3,10
    80200dfe:	6605                	lui	a2,0x1
    80200e00:	0000c597          	auipc	a1,0xc
    80200e04:	ec05b583          	ld	a1,-320(a1) # 8020ccc0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80200e08:	04000537          	lui	a0,0x4000
    80200e0c:	157d                	addi	a0,a0,-1 # 3ffffff <_entry-0x7c200001>
    80200e0e:	0532                	slli	a0,a0,0xc
    80200e10:	00000097          	auipc	ra,0x0
    80200e14:	ee6080e7          	jalr	-282(ra) # 80200cf6 <kvmmap>
}
    80200e18:	60e2                	ld	ra,24(sp)
    80200e1a:	6442                	ld	s0,16(sp)
    80200e1c:	64a2                	ld	s1,8(sp)
    80200e1e:	6105                	addi	sp,sp,32
    80200e20:	8082                	ret

0000000080200e22 <vmunmap>:
// Remove npages of mappings starting from va. va must be
// page-aligned. The mappings must exist.
// Optionally free the physical memory.
void
vmunmap(pagetable_t pagetable, uint64 va, uint64 npages, int do_free)
{
    80200e22:	715d                	addi	sp,sp,-80
    80200e24:	e486                	sd	ra,72(sp)
    80200e26:	e0a2                	sd	s0,64(sp)
    80200e28:	fc26                	sd	s1,56(sp)
    80200e2a:	f84a                	sd	s2,48(sp)
    80200e2c:	f44e                	sd	s3,40(sp)
    80200e2e:	f052                	sd	s4,32(sp)
    80200e30:	ec56                	sd	s5,24(sp)
    80200e32:	e85a                	sd	s6,16(sp)
    80200e34:	e45e                	sd	s7,8(sp)
    80200e36:	0880                	addi	s0,sp,80
  uint64 a;
  pte_t *pte;

  if((va % PGSIZE) != 0)
    80200e38:	03459793          	slli	a5,a1,0x34
    80200e3c:	e795                	bnez	a5,80200e68 <vmunmap+0x46>
    80200e3e:	8a2a                	mv	s4,a0
    80200e40:	892e                	mv	s2,a1
    80200e42:	8ab6                	mv	s5,a3
    panic("vmunmap: not aligned");

  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80200e44:	0632                	slli	a2,a2,0xc
    80200e46:	00b609b3          	add	s3,a2,a1
    if((pte = walk(pagetable, a, 0)) == 0)
      panic("vmunmap: walk");
    if((*pte & PTE_V) == 0)
      panic("vmunmap: not mapped");
    if(PTE_FLAGS(*pte) == PTE_V)
    80200e4a:	4b85                	li	s7,1
  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80200e4c:	6b05                	lui	s6,0x1
    80200e4e:	0735e263          	bltu	a1,s3,80200eb2 <vmunmap+0x90>
      uint64 pa = PTE2PA(*pte);
      kfree((void*)pa);
    }
    *pte = 0;
  }
}
    80200e52:	60a6                	ld	ra,72(sp)
    80200e54:	6406                	ld	s0,64(sp)
    80200e56:	74e2                	ld	s1,56(sp)
    80200e58:	7942                	ld	s2,48(sp)
    80200e5a:	79a2                	ld	s3,40(sp)
    80200e5c:	7a02                	ld	s4,32(sp)
    80200e5e:	6ae2                	ld	s5,24(sp)
    80200e60:	6b42                	ld	s6,16(sp)
    80200e62:	6ba2                	ld	s7,8(sp)
    80200e64:	6161                	addi	sp,sp,80
    80200e66:	8082                	ret
    panic("vmunmap: not aligned");
    80200e68:	00008517          	auipc	a0,0x8
    80200e6c:	5c050513          	addi	a0,a0,1472 # 80209428 <digits+0xa8>
    80200e70:	fffff097          	auipc	ra,0xfffff
    80200e74:	2d4080e7          	jalr	724(ra) # 80200144 <panic>
      panic("vmunmap: walk");
    80200e78:	00008517          	auipc	a0,0x8
    80200e7c:	5c850513          	addi	a0,a0,1480 # 80209440 <digits+0xc0>
    80200e80:	fffff097          	auipc	ra,0xfffff
    80200e84:	2c4080e7          	jalr	708(ra) # 80200144 <panic>
      panic("vmunmap: not mapped");
    80200e88:	00008517          	auipc	a0,0x8
    80200e8c:	5c850513          	addi	a0,a0,1480 # 80209450 <digits+0xd0>
    80200e90:	fffff097          	auipc	ra,0xfffff
    80200e94:	2b4080e7          	jalr	692(ra) # 80200144 <panic>
      panic("vmunmap: not a leaf");
    80200e98:	00008517          	auipc	a0,0x8
    80200e9c:	5d050513          	addi	a0,a0,1488 # 80209468 <digits+0xe8>
    80200ea0:	fffff097          	auipc	ra,0xfffff
    80200ea4:	2a4080e7          	jalr	676(ra) # 80200144 <panic>
    *pte = 0;
    80200ea8:	0004b023          	sd	zero,0(s1)
  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80200eac:	995a                	add	s2,s2,s6
    80200eae:	fb3972e3          	bgeu	s2,s3,80200e52 <vmunmap+0x30>
    if((pte = walk(pagetable, a, 0)) == 0)
    80200eb2:	4601                	li	a2,0
    80200eb4:	85ca                	mv	a1,s2
    80200eb6:	8552                	mv	a0,s4
    80200eb8:	00000097          	auipc	ra,0x0
    80200ebc:	c50080e7          	jalr	-944(ra) # 80200b08 <walk>
    80200ec0:	84aa                	mv	s1,a0
    80200ec2:	d95d                	beqz	a0,80200e78 <vmunmap+0x56>
    if((*pte & PTE_V) == 0)
    80200ec4:	6108                	ld	a0,0(a0)
    80200ec6:	00157793          	andi	a5,a0,1
    80200eca:	dfdd                	beqz	a5,80200e88 <vmunmap+0x66>
    if(PTE_FLAGS(*pte) == PTE_V)
    80200ecc:	3ff57793          	andi	a5,a0,1023
    80200ed0:	fd7784e3          	beq	a5,s7,80200e98 <vmunmap+0x76>
    if(do_free){
    80200ed4:	fc0a8ae3          	beqz	s5,80200ea8 <vmunmap+0x86>
      uint64 pa = PTE2PA(*pte);
    80200ed8:	8129                	srli	a0,a0,0xa
      kfree((void*)pa);
    80200eda:	0532                	slli	a0,a0,0xc
    80200edc:	fffff097          	auipc	ra,0xfffff
    80200ee0:	564080e7          	jalr	1380(ra) # 80200440 <kfree>
    80200ee4:	b7d1                	j	80200ea8 <vmunmap+0x86>

0000000080200ee6 <uvmcreate>:

// create an empty user page table.
// returns 0 if out of memory.
pagetable_t
uvmcreate()
{
    80200ee6:	1101                	addi	sp,sp,-32
    80200ee8:	ec06                	sd	ra,24(sp)
    80200eea:	e822                	sd	s0,16(sp)
    80200eec:	e426                	sd	s1,8(sp)
    80200eee:	1000                	addi	s0,sp,32
  pagetable_t pagetable;
  pagetable = (pagetable_t) kalloc();
    80200ef0:	fffff097          	auipc	ra,0xfffff
    80200ef4:	66a080e7          	jalr	1642(ra) # 8020055a <kalloc>
    80200ef8:	84aa                	mv	s1,a0
  if(pagetable == NULL)
    80200efa:	c519                	beqz	a0,80200f08 <uvmcreate+0x22>
    return NULL;
  memset(pagetable, 0, PGSIZE);
    80200efc:	6605                	lui	a2,0x1
    80200efe:	4581                	li	a1,0
    80200f00:	00000097          	auipc	ra,0x0
    80200f04:	862080e7          	jalr	-1950(ra) # 80200762 <memset>
  return pagetable;
}
    80200f08:	8526                	mv	a0,s1
    80200f0a:	60e2                	ld	ra,24(sp)
    80200f0c:	6442                	ld	s0,16(sp)
    80200f0e:	64a2                	ld	s1,8(sp)
    80200f10:	6105                	addi	sp,sp,32
    80200f12:	8082                	ret

0000000080200f14 <uvminit>:
// Load the user initcode into address 0 of pagetable,
// for the very first process.
// sz must be less than a page.
void
uvminit(pagetable_t pagetable, pagetable_t kpagetable, uchar *src, uint sz)
{
    80200f14:	7139                	addi	sp,sp,-64
    80200f16:	fc06                	sd	ra,56(sp)
    80200f18:	f822                	sd	s0,48(sp)
    80200f1a:	f426                	sd	s1,40(sp)
    80200f1c:	f04a                	sd	s2,32(sp)
    80200f1e:	ec4e                	sd	s3,24(sp)
    80200f20:	e852                	sd	s4,16(sp)
    80200f22:	e456                	sd	s5,8(sp)
    80200f24:	0080                	addi	s0,sp,64
  char *mem;

  if(sz >= PGSIZE)
    80200f26:	6785                	lui	a5,0x1
    80200f28:	06f6f363          	bgeu	a3,a5,80200f8e <uvminit+0x7a>
    80200f2c:	8aaa                	mv	s5,a0
    80200f2e:	8a2e                	mv	s4,a1
    80200f30:	89b2                	mv	s3,a2
    80200f32:	8936                	mv	s2,a3
    panic("inituvm: more than a page");
  mem = kalloc();
    80200f34:	fffff097          	auipc	ra,0xfffff
    80200f38:	626080e7          	jalr	1574(ra) # 8020055a <kalloc>
    80200f3c:	84aa                	mv	s1,a0
  // printf("[uvminit]kalloc: %p\n", mem);
  memset(mem, 0, PGSIZE);
    80200f3e:	6605                	lui	a2,0x1
    80200f40:	4581                	li	a1,0
    80200f42:	00000097          	auipc	ra,0x0
    80200f46:	820080e7          	jalr	-2016(ra) # 80200762 <memset>
  mappages(pagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X|PTE_U);
    80200f4a:	4779                	li	a4,30
    80200f4c:	86a6                	mv	a3,s1
    80200f4e:	6605                	lui	a2,0x1
    80200f50:	4581                	li	a1,0
    80200f52:	8556                	mv	a0,s5
    80200f54:	00000097          	auipc	ra,0x0
    80200f58:	d14080e7          	jalr	-748(ra) # 80200c68 <mappages>
  mappages(kpagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X);
    80200f5c:	4739                	li	a4,14
    80200f5e:	86a6                	mv	a3,s1
    80200f60:	6605                	lui	a2,0x1
    80200f62:	4581                	li	a1,0
    80200f64:	8552                	mv	a0,s4
    80200f66:	00000097          	auipc	ra,0x0
    80200f6a:	d02080e7          	jalr	-766(ra) # 80200c68 <mappages>
  memmove(mem, src, sz);
    80200f6e:	864a                	mv	a2,s2
    80200f70:	85ce                	mv	a1,s3
    80200f72:	8526                	mv	a0,s1
    80200f74:	00000097          	auipc	ra,0x0
    80200f78:	84a080e7          	jalr	-1974(ra) # 802007be <memmove>
  // for (int i = 0; i < sz; i ++) {
  //   printf("[uvminit]mem: %p, %x\n", mem + i, mem[i]);
  // }
}
    80200f7c:	70e2                	ld	ra,56(sp)
    80200f7e:	7442                	ld	s0,48(sp)
    80200f80:	74a2                	ld	s1,40(sp)
    80200f82:	7902                	ld	s2,32(sp)
    80200f84:	69e2                	ld	s3,24(sp)
    80200f86:	6a42                	ld	s4,16(sp)
    80200f88:	6aa2                	ld	s5,8(sp)
    80200f8a:	6121                	addi	sp,sp,64
    80200f8c:	8082                	ret
    panic("inituvm: more than a page");
    80200f8e:	00008517          	auipc	a0,0x8
    80200f92:	4f250513          	addi	a0,a0,1266 # 80209480 <digits+0x100>
    80200f96:	fffff097          	auipc	ra,0xfffff
    80200f9a:	1ae080e7          	jalr	430(ra) # 80200144 <panic>

0000000080200f9e <uvmdealloc>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
uint64
uvmdealloc(pagetable_t pagetable, pagetable_t kpagetable, uint64 oldsz, uint64 newsz)
{
    80200f9e:	7179                	addi	sp,sp,-48
    80200fa0:	f406                	sd	ra,40(sp)
    80200fa2:	f022                	sd	s0,32(sp)
    80200fa4:	ec26                	sd	s1,24(sp)
    80200fa6:	e84a                	sd	s2,16(sp)
    80200fa8:	e44e                	sd	s3,8(sp)
    80200faa:	e052                	sd	s4,0(sp)
    80200fac:	1800                	addi	s0,sp,48
  if(newsz >= oldsz)
    return oldsz;
    80200fae:	8932                	mv	s2,a2
  if(newsz >= oldsz)
    80200fb0:	02c6f063          	bgeu	a3,a2,80200fd0 <uvmdealloc+0x32>
    80200fb4:	89aa                	mv	s3,a0
    80200fb6:	852e                	mv	a0,a1
    80200fb8:	8936                	mv	s2,a3

  if(PGROUNDUP(newsz) < PGROUNDUP(oldsz)){
    80200fba:	6785                	lui	a5,0x1
    80200fbc:	17fd                	addi	a5,a5,-1 # fff <_entry-0x801ff001>
    80200fbe:	00f68a33          	add	s4,a3,a5
    80200fc2:	777d                	lui	a4,0xfffff
    80200fc4:	00ea7a33          	and	s4,s4,a4
    80200fc8:	963e                	add	a2,a2,a5
    80200fca:	8e79                	and	a2,a2,a4
    80200fcc:	00ca6b63          	bltu	s4,a2,80200fe2 <uvmdealloc+0x44>
    vmunmap(kpagetable, PGROUNDUP(newsz), npages, 0);
    vmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
  }

  return newsz;
}
    80200fd0:	854a                	mv	a0,s2
    80200fd2:	70a2                	ld	ra,40(sp)
    80200fd4:	7402                	ld	s0,32(sp)
    80200fd6:	64e2                	ld	s1,24(sp)
    80200fd8:	6942                	ld	s2,16(sp)
    80200fda:	69a2                	ld	s3,8(sp)
    80200fdc:	6a02                	ld	s4,0(sp)
    80200fde:	6145                	addi	sp,sp,48
    80200fe0:	8082                	ret
    int npages = (PGROUNDUP(oldsz) - PGROUNDUP(newsz)) / PGSIZE;
    80200fe2:	414604b3          	sub	s1,a2,s4
    80200fe6:	80b1                	srli	s1,s1,0xc
    vmunmap(kpagetable, PGROUNDUP(newsz), npages, 0);
    80200fe8:	2481                	sext.w	s1,s1
    80200fea:	4681                	li	a3,0
    80200fec:	8626                	mv	a2,s1
    80200fee:	85d2                	mv	a1,s4
    80200ff0:	00000097          	auipc	ra,0x0
    80200ff4:	e32080e7          	jalr	-462(ra) # 80200e22 <vmunmap>
    vmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
    80200ff8:	4685                	li	a3,1
    80200ffa:	8626                	mv	a2,s1
    80200ffc:	85d2                	mv	a1,s4
    80200ffe:	854e                	mv	a0,s3
    80201000:	00000097          	auipc	ra,0x0
    80201004:	e22080e7          	jalr	-478(ra) # 80200e22 <vmunmap>
    80201008:	b7e1                	j	80200fd0 <uvmdealloc+0x32>

000000008020100a <uvmalloc>:
  if(newsz < oldsz)
    8020100a:	0ec6e763          	bltu	a3,a2,802010f8 <uvmalloc+0xee>
{
    8020100e:	7139                	addi	sp,sp,-64
    80201010:	fc06                	sd	ra,56(sp)
    80201012:	f822                	sd	s0,48(sp)
    80201014:	f426                	sd	s1,40(sp)
    80201016:	f04a                	sd	s2,32(sp)
    80201018:	ec4e                	sd	s3,24(sp)
    8020101a:	e852                	sd	s4,16(sp)
    8020101c:	e456                	sd	s5,8(sp)
    8020101e:	e05a                	sd	s6,0(sp)
    80201020:	0080                	addi	s0,sp,64
    80201022:	8a2a                	mv	s4,a0
    80201024:	8aae                	mv	s5,a1
    80201026:	8b36                	mv	s6,a3
  oldsz = PGROUNDUP(oldsz);
    80201028:	6785                	lui	a5,0x1
    8020102a:	17fd                	addi	a5,a5,-1 # fff <_entry-0x801ff001>
    8020102c:	963e                	add	a2,a2,a5
    8020102e:	77fd                	lui	a5,0xfffff
    80201030:	00f679b3          	and	s3,a2,a5
  for(a = oldsz; a < newsz; a += PGSIZE){
    80201034:	0cd9f463          	bgeu	s3,a3,802010fc <uvmalloc+0xf2>
    80201038:	894e                	mv	s2,s3
    mem = kalloc();
    8020103a:	fffff097          	auipc	ra,0xfffff
    8020103e:	520080e7          	jalr	1312(ra) # 8020055a <kalloc>
    80201042:	84aa                	mv	s1,a0
    if(mem == NULL){
    80201044:	c129                	beqz	a0,80201086 <uvmalloc+0x7c>
    memset(mem, 0, PGSIZE);
    80201046:	6605                	lui	a2,0x1
    80201048:	4581                	li	a1,0
    8020104a:	fffff097          	auipc	ra,0xfffff
    8020104e:	718080e7          	jalr	1816(ra) # 80200762 <memset>
    if (mappages(pagetable, a, PGSIZE, (uint64)mem, PTE_W|PTE_X|PTE_R|PTE_U) != 0) {
    80201052:	4779                	li	a4,30
    80201054:	86a6                	mv	a3,s1
    80201056:	6605                	lui	a2,0x1
    80201058:	85ca                	mv	a1,s2
    8020105a:	8552                	mv	a0,s4
    8020105c:	00000097          	auipc	ra,0x0
    80201060:	c0c080e7          	jalr	-1012(ra) # 80200c68 <mappages>
    80201064:	e521                	bnez	a0,802010ac <uvmalloc+0xa2>
    if (mappages(kpagetable, a, PGSIZE, (uint64)mem, PTE_W|PTE_X|PTE_R) != 0){
    80201066:	4739                	li	a4,14
    80201068:	86a6                	mv	a3,s1
    8020106a:	6605                	lui	a2,0x1
    8020106c:	85ca                	mv	a1,s2
    8020106e:	8556                	mv	a0,s5
    80201070:	00000097          	auipc	ra,0x0
    80201074:	bf8080e7          	jalr	-1032(ra) # 80200c68 <mappages>
    80201078:	e929                	bnez	a0,802010ca <uvmalloc+0xc0>
  for(a = oldsz; a < newsz; a += PGSIZE){
    8020107a:	6785                	lui	a5,0x1
    8020107c:	993e                	add	s2,s2,a5
    8020107e:	fb696ee3          	bltu	s2,s6,8020103a <uvmalloc+0x30>
  return newsz;
    80201082:	855a                	mv	a0,s6
    80201084:	a811                	j	80201098 <uvmalloc+0x8e>
      uvmdealloc(pagetable, kpagetable, a, oldsz);
    80201086:	86ce                	mv	a3,s3
    80201088:	864a                	mv	a2,s2
    8020108a:	85d6                	mv	a1,s5
    8020108c:	8552                	mv	a0,s4
    8020108e:	00000097          	auipc	ra,0x0
    80201092:	f10080e7          	jalr	-240(ra) # 80200f9e <uvmdealloc>
      return 0;
    80201096:	4501                	li	a0,0
}
    80201098:	70e2                	ld	ra,56(sp)
    8020109a:	7442                	ld	s0,48(sp)
    8020109c:	74a2                	ld	s1,40(sp)
    8020109e:	7902                	ld	s2,32(sp)
    802010a0:	69e2                	ld	s3,24(sp)
    802010a2:	6a42                	ld	s4,16(sp)
    802010a4:	6aa2                	ld	s5,8(sp)
    802010a6:	6b02                	ld	s6,0(sp)
    802010a8:	6121                	addi	sp,sp,64
    802010aa:	8082                	ret
      kfree(mem);
    802010ac:	8526                	mv	a0,s1
    802010ae:	fffff097          	auipc	ra,0xfffff
    802010b2:	392080e7          	jalr	914(ra) # 80200440 <kfree>
      uvmdealloc(pagetable, kpagetable, a, oldsz);
    802010b6:	86ce                	mv	a3,s3
    802010b8:	864a                	mv	a2,s2
    802010ba:	85d6                	mv	a1,s5
    802010bc:	8552                	mv	a0,s4
    802010be:	00000097          	auipc	ra,0x0
    802010c2:	ee0080e7          	jalr	-288(ra) # 80200f9e <uvmdealloc>
      return 0;
    802010c6:	4501                	li	a0,0
    802010c8:	bfc1                	j	80201098 <uvmalloc+0x8e>
      int npages = (a - oldsz) / PGSIZE;
    802010ca:	41390633          	sub	a2,s2,s3
    802010ce:	8231                	srli	a2,a2,0xc
    802010d0:	0006049b          	sext.w	s1,a2
      vmunmap(pagetable, oldsz, npages + 1, 1);   // plus the page allocated above.
    802010d4:	4685                	li	a3,1
    802010d6:	2605                	addiw	a2,a2,1 # 1001 <_entry-0x801fefff>
    802010d8:	85ce                	mv	a1,s3
    802010da:	8552                	mv	a0,s4
    802010dc:	00000097          	auipc	ra,0x0
    802010e0:	d46080e7          	jalr	-698(ra) # 80200e22 <vmunmap>
      vmunmap(kpagetable, oldsz, npages, 0);
    802010e4:	4681                	li	a3,0
    802010e6:	8626                	mv	a2,s1
    802010e8:	85ce                	mv	a1,s3
    802010ea:	8556                	mv	a0,s5
    802010ec:	00000097          	auipc	ra,0x0
    802010f0:	d36080e7          	jalr	-714(ra) # 80200e22 <vmunmap>
      return 0;
    802010f4:	4501                	li	a0,0
    802010f6:	b74d                	j	80201098 <uvmalloc+0x8e>
    return oldsz;
    802010f8:	8532                	mv	a0,a2
}
    802010fa:	8082                	ret
  return newsz;
    802010fc:	8536                	mv	a0,a3
    802010fe:	bf69                	j	80201098 <uvmalloc+0x8e>

0000000080201100 <freewalk>:

// Recursively free page-table pages.
// All leaf mappings must already have been removed.
void
freewalk(pagetable_t pagetable)
{
    80201100:	7179                	addi	sp,sp,-48
    80201102:	f406                	sd	ra,40(sp)
    80201104:	f022                	sd	s0,32(sp)
    80201106:	ec26                	sd	s1,24(sp)
    80201108:	e84a                	sd	s2,16(sp)
    8020110a:	e44e                	sd	s3,8(sp)
    8020110c:	e052                	sd	s4,0(sp)
    8020110e:	1800                	addi	s0,sp,48
    80201110:	8a2a                	mv	s4,a0
  // there are 2^9 = 512 PTEs in a page table.
  for(int i = 0; i < 512; i++){
    80201112:	84aa                	mv	s1,a0
    80201114:	6905                	lui	s2,0x1
    80201116:	992a                	add	s2,s2,a0
    pte_t pte = pagetable[i];
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    80201118:	4985                	li	s3,1
    8020111a:	a829                	j	80201134 <freewalk+0x34>
      // this PTE points to a lower-level page table.
      uint64 child = PTE2PA(pte);
    8020111c:	83a9                	srli	a5,a5,0xa
      freewalk((pagetable_t)child);
    8020111e:	00c79513          	slli	a0,a5,0xc
    80201122:	00000097          	auipc	ra,0x0
    80201126:	fde080e7          	jalr	-34(ra) # 80201100 <freewalk>
      pagetable[i] = 0;
    8020112a:	0004b023          	sd	zero,0(s1)
  for(int i = 0; i < 512; i++){
    8020112e:	04a1                	addi	s1,s1,8
    80201130:	03248163          	beq	s1,s2,80201152 <freewalk+0x52>
    pte_t pte = pagetable[i];
    80201134:	609c                	ld	a5,0(s1)
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    80201136:	00f7f713          	andi	a4,a5,15
    8020113a:	ff3701e3          	beq	a4,s3,8020111c <freewalk+0x1c>
    } else if(pte & PTE_V){
    8020113e:	8b85                	andi	a5,a5,1
    80201140:	d7fd                	beqz	a5,8020112e <freewalk+0x2e>
      panic("freewalk: leaf");
    80201142:	00008517          	auipc	a0,0x8
    80201146:	35e50513          	addi	a0,a0,862 # 802094a0 <digits+0x120>
    8020114a:	fffff097          	auipc	ra,0xfffff
    8020114e:	ffa080e7          	jalr	-6(ra) # 80200144 <panic>
    }
  }
  kfree((void*)pagetable);
    80201152:	8552                	mv	a0,s4
    80201154:	fffff097          	auipc	ra,0xfffff
    80201158:	2ec080e7          	jalr	748(ra) # 80200440 <kfree>
}
    8020115c:	70a2                	ld	ra,40(sp)
    8020115e:	7402                	ld	s0,32(sp)
    80201160:	64e2                	ld	s1,24(sp)
    80201162:	6942                	ld	s2,16(sp)
    80201164:	69a2                	ld	s3,8(sp)
    80201166:	6a02                	ld	s4,0(sp)
    80201168:	6145                	addi	sp,sp,48
    8020116a:	8082                	ret

000000008020116c <uvmfree>:

// Free user memory pages,
// then free page-table pages.
void
uvmfree(pagetable_t pagetable, uint64 sz)
{
    8020116c:	1101                	addi	sp,sp,-32
    8020116e:	ec06                	sd	ra,24(sp)
    80201170:	e822                	sd	s0,16(sp)
    80201172:	e426                	sd	s1,8(sp)
    80201174:	1000                	addi	s0,sp,32
    80201176:	84aa                	mv	s1,a0
  if(sz > 0)
    80201178:	e999                	bnez	a1,8020118e <uvmfree+0x22>
    vmunmap(pagetable, 0, PGROUNDUP(sz)/PGSIZE, 1);
  freewalk(pagetable);
    8020117a:	8526                	mv	a0,s1
    8020117c:	00000097          	auipc	ra,0x0
    80201180:	f84080e7          	jalr	-124(ra) # 80201100 <freewalk>
}
    80201184:	60e2                	ld	ra,24(sp)
    80201186:	6442                	ld	s0,16(sp)
    80201188:	64a2                	ld	s1,8(sp)
    8020118a:	6105                	addi	sp,sp,32
    8020118c:	8082                	ret
    vmunmap(pagetable, 0, PGROUNDUP(sz)/PGSIZE, 1);
    8020118e:	6785                	lui	a5,0x1
    80201190:	17fd                	addi	a5,a5,-1 # fff <_entry-0x801ff001>
    80201192:	95be                	add	a1,a1,a5
    80201194:	4685                	li	a3,1
    80201196:	00c5d613          	srli	a2,a1,0xc
    8020119a:	4581                	li	a1,0
    8020119c:	00000097          	auipc	ra,0x0
    802011a0:	c86080e7          	jalr	-890(ra) # 80200e22 <vmunmap>
    802011a4:	bfd9                	j	8020117a <uvmfree+0xe>

00000000802011a6 <uvmcopy>:
  pte_t *pte;
  uint64 pa, i = 0, ki = 0;
  uint flags;
  char *mem;

  while (i < sz){
    802011a6:	10068563          	beqz	a3,802012b0 <uvmcopy+0x10a>
{
    802011aa:	715d                	addi	sp,sp,-80
    802011ac:	e486                	sd	ra,72(sp)
    802011ae:	e0a2                	sd	s0,64(sp)
    802011b0:	fc26                	sd	s1,56(sp)
    802011b2:	f84a                	sd	s2,48(sp)
    802011b4:	f44e                	sd	s3,40(sp)
    802011b6:	f052                	sd	s4,32(sp)
    802011b8:	ec56                	sd	s5,24(sp)
    802011ba:	e85a                	sd	s6,16(sp)
    802011bc:	e45e                	sd	s7,8(sp)
    802011be:	e062                	sd	s8,0(sp)
    802011c0:	0880                	addi	s0,sp,80
    802011c2:	8baa                	mv	s7,a0
    802011c4:	8a2e                	mv	s4,a1
    802011c6:	8b32                	mv	s6,a2
    802011c8:	8ab6                	mv	s5,a3
  uint64 pa, i = 0, ki = 0;
    802011ca:	4981                	li	s3,0
    802011cc:	a011                	j	802011d0 <uvmcopy+0x2a>
    memmove(mem, (char*)pa, PGSIZE);
    if(mappages(new, i, PGSIZE, (uint64)mem, flags) != 0) {
      kfree(mem);
      goto err;
    }
    i += PGSIZE;
    802011ce:	89e2                	mv	s3,s8
    if((pte = walk(old, i, 0)) == NULL)
    802011d0:	4601                	li	a2,0
    802011d2:	85ce                	mv	a1,s3
    802011d4:	855e                	mv	a0,s7
    802011d6:	00000097          	auipc	ra,0x0
    802011da:	932080e7          	jalr	-1742(ra) # 80200b08 <walk>
    802011de:	c135                	beqz	a0,80201242 <uvmcopy+0x9c>
    if((*pte & PTE_V) == 0)
    802011e0:	6118                	ld	a4,0(a0)
    802011e2:	00177793          	andi	a5,a4,1
    802011e6:	c7b5                	beqz	a5,80201252 <uvmcopy+0xac>
    pa = PTE2PA(*pte);
    802011e8:	00a75593          	srli	a1,a4,0xa
    802011ec:	00c59c13          	slli	s8,a1,0xc
    flags = PTE_FLAGS(*pte);
    802011f0:	3ff77493          	andi	s1,a4,1023
    if((mem = kalloc()) == NULL)
    802011f4:	fffff097          	auipc	ra,0xfffff
    802011f8:	366080e7          	jalr	870(ra) # 8020055a <kalloc>
    802011fc:	892a                	mv	s2,a0
    802011fe:	c92d                	beqz	a0,80201270 <uvmcopy+0xca>
    memmove(mem, (char*)pa, PGSIZE);
    80201200:	6605                	lui	a2,0x1
    80201202:	85e2                	mv	a1,s8
    80201204:	fffff097          	auipc	ra,0xfffff
    80201208:	5ba080e7          	jalr	1466(ra) # 802007be <memmove>
    if(mappages(new, i, PGSIZE, (uint64)mem, flags) != 0) {
    8020120c:	2481                	sext.w	s1,s1
    8020120e:	8726                	mv	a4,s1
    80201210:	86ca                	mv	a3,s2
    80201212:	6605                	lui	a2,0x1
    80201214:	85ce                	mv	a1,s3
    80201216:	8552                	mv	a0,s4
    80201218:	00000097          	auipc	ra,0x0
    8020121c:	a50080e7          	jalr	-1456(ra) # 80200c68 <mappages>
    80201220:	e129                	bnez	a0,80201262 <uvmcopy+0xbc>
    i += PGSIZE;
    80201222:	6c05                	lui	s8,0x1
    80201224:	9c4e                	add	s8,s8,s3
    if(mappages(knew, ki, PGSIZE, (uint64)mem, flags & ~PTE_U) != 0){
    80201226:	3ef4f713          	andi	a4,s1,1007
    8020122a:	86ca                	mv	a3,s2
    8020122c:	6605                	lui	a2,0x1
    8020122e:	85ce                	mv	a1,s3
    80201230:	855a                	mv	a0,s6
    80201232:	00000097          	auipc	ra,0x0
    80201236:	a36080e7          	jalr	-1482(ra) # 80200c68 <mappages>
    8020123a:	ed05                	bnez	a0,80201272 <uvmcopy+0xcc>
  while (i < sz){
    8020123c:	f95c69e3          	bltu	s8,s5,802011ce <uvmcopy+0x28>
    80201240:	a8a1                	j	80201298 <uvmcopy+0xf2>
      panic("uvmcopy: pte should exist");
    80201242:	00008517          	auipc	a0,0x8
    80201246:	26e50513          	addi	a0,a0,622 # 802094b0 <digits+0x130>
    8020124a:	fffff097          	auipc	ra,0xfffff
    8020124e:	efa080e7          	jalr	-262(ra) # 80200144 <panic>
      panic("uvmcopy: page not present");
    80201252:	00008517          	auipc	a0,0x8
    80201256:	27e50513          	addi	a0,a0,638 # 802094d0 <digits+0x150>
    8020125a:	fffff097          	auipc	ra,0xfffff
    8020125e:	eea080e7          	jalr	-278(ra) # 80200144 <panic>
      kfree(mem);
    80201262:	854a                	mv	a0,s2
    80201264:	fffff097          	auipc	ra,0xfffff
    80201268:	1dc080e7          	jalr	476(ra) # 80200440 <kfree>
      goto err;
    8020126c:	8c4e                	mv	s8,s3
    8020126e:	a011                	j	80201272 <uvmcopy+0xcc>
    80201270:	8c4e                	mv	s8,s3
    ki += PGSIZE;
  }
  return 0;

 err:
  vmunmap(knew, 0, ki / PGSIZE, 0);
    80201272:	4681                	li	a3,0
    80201274:	00c9d613          	srli	a2,s3,0xc
    80201278:	4581                	li	a1,0
    8020127a:	855a                	mv	a0,s6
    8020127c:	00000097          	auipc	ra,0x0
    80201280:	ba6080e7          	jalr	-1114(ra) # 80200e22 <vmunmap>
  vmunmap(new, 0, i / PGSIZE, 1);
    80201284:	4685                	li	a3,1
    80201286:	00cc5613          	srli	a2,s8,0xc
    8020128a:	4581                	li	a1,0
    8020128c:	8552                	mv	a0,s4
    8020128e:	00000097          	auipc	ra,0x0
    80201292:	b94080e7          	jalr	-1132(ra) # 80200e22 <vmunmap>
  return -1;
    80201296:	557d                	li	a0,-1
}
    80201298:	60a6                	ld	ra,72(sp)
    8020129a:	6406                	ld	s0,64(sp)
    8020129c:	74e2                	ld	s1,56(sp)
    8020129e:	7942                	ld	s2,48(sp)
    802012a0:	79a2                	ld	s3,40(sp)
    802012a2:	7a02                	ld	s4,32(sp)
    802012a4:	6ae2                	ld	s5,24(sp)
    802012a6:	6b42                	ld	s6,16(sp)
    802012a8:	6ba2                	ld	s7,8(sp)
    802012aa:	6c02                	ld	s8,0(sp)
    802012ac:	6161                	addi	sp,sp,80
    802012ae:	8082                	ret
  return 0;
    802012b0:	4501                	li	a0,0
}
    802012b2:	8082                	ret

00000000802012b4 <uvmclear>:

// mark a PTE invalid for user access.
// used by exec for the user stack guard page.
void
uvmclear(pagetable_t pagetable, uint64 va)
{
    802012b4:	1141                	addi	sp,sp,-16
    802012b6:	e406                	sd	ra,8(sp)
    802012b8:	e022                	sd	s0,0(sp)
    802012ba:	0800                	addi	s0,sp,16
  pte_t *pte;
  
  pte = walk(pagetable, va, 0);
    802012bc:	4601                	li	a2,0
    802012be:	00000097          	auipc	ra,0x0
    802012c2:	84a080e7          	jalr	-1974(ra) # 80200b08 <walk>
  if(pte == NULL)
    802012c6:	c901                	beqz	a0,802012d6 <uvmclear+0x22>
    panic("uvmclear");
  *pte &= ~PTE_U;
    802012c8:	611c                	ld	a5,0(a0)
    802012ca:	9bbd                	andi	a5,a5,-17
    802012cc:	e11c                	sd	a5,0(a0)
}
    802012ce:	60a2                	ld	ra,8(sp)
    802012d0:	6402                	ld	s0,0(sp)
    802012d2:	0141                	addi	sp,sp,16
    802012d4:	8082                	ret
    panic("uvmclear");
    802012d6:	00008517          	auipc	a0,0x8
    802012da:	21a50513          	addi	a0,a0,538 # 802094f0 <digits+0x170>
    802012de:	fffff097          	auipc	ra,0xfffff
    802012e2:	e66080e7          	jalr	-410(ra) # 80200144 <panic>

00000000802012e6 <copyout>:
int
copyout(pagetable_t pagetable, uint64 dstva, char *src, uint64 len)
{
  uint64 n, va0, pa0;

  while(len > 0){
    802012e6:	c6bd                	beqz	a3,80201354 <copyout+0x6e>
{
    802012e8:	715d                	addi	sp,sp,-80
    802012ea:	e486                	sd	ra,72(sp)
    802012ec:	e0a2                	sd	s0,64(sp)
    802012ee:	fc26                	sd	s1,56(sp)
    802012f0:	f84a                	sd	s2,48(sp)
    802012f2:	f44e                	sd	s3,40(sp)
    802012f4:	f052                	sd	s4,32(sp)
    802012f6:	ec56                	sd	s5,24(sp)
    802012f8:	e85a                	sd	s6,16(sp)
    802012fa:	e45e                	sd	s7,8(sp)
    802012fc:	e062                	sd	s8,0(sp)
    802012fe:	0880                	addi	s0,sp,80
    80201300:	8b2a                	mv	s6,a0
    80201302:	8c2e                	mv	s8,a1
    80201304:	8a32                	mv	s4,a2
    80201306:	89b6                	mv	s3,a3
    va0 = PGROUNDDOWN(dstva);
    80201308:	7bfd                	lui	s7,0xfffff
    pa0 = walkaddr(pagetable, va0);
    if(pa0 == NULL)
      return -1;
    n = PGSIZE - (dstva - va0);
    8020130a:	6a85                	lui	s5,0x1
    8020130c:	a015                	j	80201330 <copyout+0x4a>
    if(n > len)
      n = len;
    memmove((void *)(pa0 + (dstva - va0)), src, n);
    8020130e:	9562                	add	a0,a0,s8
    80201310:	0004861b          	sext.w	a2,s1
    80201314:	85d2                	mv	a1,s4
    80201316:	41250533          	sub	a0,a0,s2
    8020131a:	fffff097          	auipc	ra,0xfffff
    8020131e:	4a4080e7          	jalr	1188(ra) # 802007be <memmove>

    len -= n;
    80201322:	409989b3          	sub	s3,s3,s1
    src += n;
    80201326:	9a26                	add	s4,s4,s1
    dstva = va0 + PGSIZE;
    80201328:	01590c33          	add	s8,s2,s5
  while(len > 0){
    8020132c:	02098263          	beqz	s3,80201350 <copyout+0x6a>
    va0 = PGROUNDDOWN(dstva);
    80201330:	017c7933          	and	s2,s8,s7
    pa0 = walkaddr(pagetable, va0);
    80201334:	85ca                	mv	a1,s2
    80201336:	855a                	mv	a0,s6
    80201338:	00000097          	auipc	ra,0x0
    8020133c:	876080e7          	jalr	-1930(ra) # 80200bae <walkaddr>
    if(pa0 == NULL)
    80201340:	cd01                	beqz	a0,80201358 <copyout+0x72>
    n = PGSIZE - (dstva - va0);
    80201342:	418904b3          	sub	s1,s2,s8
    80201346:	94d6                	add	s1,s1,s5
    80201348:	fc99f3e3          	bgeu	s3,s1,8020130e <copyout+0x28>
    8020134c:	84ce                	mv	s1,s3
    8020134e:	b7c1                	j	8020130e <copyout+0x28>
  }
  return 0;
    80201350:	4501                	li	a0,0
    80201352:	a021                	j	8020135a <copyout+0x74>
    80201354:	4501                	li	a0,0
}
    80201356:	8082                	ret
      return -1;
    80201358:	557d                	li	a0,-1
}
    8020135a:	60a6                	ld	ra,72(sp)
    8020135c:	6406                	ld	s0,64(sp)
    8020135e:	74e2                	ld	s1,56(sp)
    80201360:	7942                	ld	s2,48(sp)
    80201362:	79a2                	ld	s3,40(sp)
    80201364:	7a02                	ld	s4,32(sp)
    80201366:	6ae2                	ld	s5,24(sp)
    80201368:	6b42                	ld	s6,16(sp)
    8020136a:	6ba2                	ld	s7,8(sp)
    8020136c:	6c02                	ld	s8,0(sp)
    8020136e:	6161                	addi	sp,sp,80
    80201370:	8082                	ret

0000000080201372 <copyout2>:

int
copyout2(uint64 dstva, char *src, uint64 len)
{
    80201372:	7179                	addi	sp,sp,-48
    80201374:	f406                	sd	ra,40(sp)
    80201376:	f022                	sd	s0,32(sp)
    80201378:	ec26                	sd	s1,24(sp)
    8020137a:	e84a                	sd	s2,16(sp)
    8020137c:	e44e                	sd	s3,8(sp)
    8020137e:	1800                	addi	s0,sp,48
    80201380:	84aa                	mv	s1,a0
    80201382:	89ae                	mv	s3,a1
    80201384:	8932                	mv	s2,a2
  uint64 sz = myproc()->sz;
    80201386:	00000097          	auipc	ra,0x0
    8020138a:	708080e7          	jalr	1800(ra) # 80201a8e <myproc>
    8020138e:	653c                	ld	a5,72(a0)
  if (dstva + len > sz || dstva >= sz) {
    80201390:	01248733          	add	a4,s1,s2
    80201394:	02e7e463          	bltu	a5,a4,802013bc <copyout2+0x4a>
    80201398:	02f4f463          	bgeu	s1,a5,802013c0 <copyout2+0x4e>
    return -1;
  }
  memmove((void *)dstva, src, len);
    8020139c:	0009061b          	sext.w	a2,s2
    802013a0:	85ce                	mv	a1,s3
    802013a2:	8526                	mv	a0,s1
    802013a4:	fffff097          	auipc	ra,0xfffff
    802013a8:	41a080e7          	jalr	1050(ra) # 802007be <memmove>
  return 0;
    802013ac:	4501                	li	a0,0
}
    802013ae:	70a2                	ld	ra,40(sp)
    802013b0:	7402                	ld	s0,32(sp)
    802013b2:	64e2                	ld	s1,24(sp)
    802013b4:	6942                	ld	s2,16(sp)
    802013b6:	69a2                	ld	s3,8(sp)
    802013b8:	6145                	addi	sp,sp,48
    802013ba:	8082                	ret
    return -1;
    802013bc:	557d                	li	a0,-1
    802013be:	bfc5                	j	802013ae <copyout2+0x3c>
    802013c0:	557d                	li	a0,-1
    802013c2:	b7f5                	j	802013ae <copyout2+0x3c>

00000000802013c4 <copyout3>:

int
copyout3(char* dst, char *src, uint64 len)
{
    802013c4:	7179                	addi	sp,sp,-48
    802013c6:	f406                	sd	ra,40(sp)
    802013c8:	f022                	sd	s0,32(sp)
    802013ca:	ec26                	sd	s1,24(sp)
    802013cc:	e84a                	sd	s2,16(sp)
    802013ce:	e44e                	sd	s3,8(sp)
    802013d0:	1800                	addi	s0,sp,48
    802013d2:	892a                	mv	s2,a0
    802013d4:	89ae                	mv	s3,a1
    802013d6:	84b2                	mv	s1,a2
  uint64 sz = myproc()->sz;
    802013d8:	00000097          	auipc	ra,0x0
    802013dc:	6b6080e7          	jalr	1718(ra) # 80201a8e <myproc>
    802013e0:	653c                	ld	a5,72(a0)
  if (2* len > sz || len >= sz) {
    802013e2:	00149713          	slli	a4,s1,0x1
    802013e6:	02e7e463          	bltu	a5,a4,8020140e <copyout3+0x4a>
    802013ea:	02f4f463          	bgeu	s1,a5,80201412 <copyout3+0x4e>
    return -1;
  }
  memmove((void *)dst, src, len);
    802013ee:	0004861b          	sext.w	a2,s1
    802013f2:	85ce                	mv	a1,s3
    802013f4:	854a                	mv	a0,s2
    802013f6:	fffff097          	auipc	ra,0xfffff
    802013fa:	3c8080e7          	jalr	968(ra) # 802007be <memmove>
  return 0;
    802013fe:	4501                	li	a0,0
}
    80201400:	70a2                	ld	ra,40(sp)
    80201402:	7402                	ld	s0,32(sp)
    80201404:	64e2                	ld	s1,24(sp)
    80201406:	6942                	ld	s2,16(sp)
    80201408:	69a2                	ld	s3,8(sp)
    8020140a:	6145                	addi	sp,sp,48
    8020140c:	8082                	ret
    return -1;
    8020140e:	557d                	li	a0,-1
    80201410:	bfc5                	j	80201400 <copyout3+0x3c>
    80201412:	557d                	li	a0,-1
    80201414:	b7f5                	j	80201400 <copyout3+0x3c>

0000000080201416 <copyin>:
int
copyin(pagetable_t pagetable, char *dst, uint64 srcva, uint64 len)
{
  uint64 n, va0, pa0;

  while(len > 0){
    80201416:	caa5                	beqz	a3,80201486 <copyin+0x70>
{
    80201418:	715d                	addi	sp,sp,-80
    8020141a:	e486                	sd	ra,72(sp)
    8020141c:	e0a2                	sd	s0,64(sp)
    8020141e:	fc26                	sd	s1,56(sp)
    80201420:	f84a                	sd	s2,48(sp)
    80201422:	f44e                	sd	s3,40(sp)
    80201424:	f052                	sd	s4,32(sp)
    80201426:	ec56                	sd	s5,24(sp)
    80201428:	e85a                	sd	s6,16(sp)
    8020142a:	e45e                	sd	s7,8(sp)
    8020142c:	e062                	sd	s8,0(sp)
    8020142e:	0880                	addi	s0,sp,80
    80201430:	8b2a                	mv	s6,a0
    80201432:	8a2e                	mv	s4,a1
    80201434:	8c32                	mv	s8,a2
    80201436:	89b6                	mv	s3,a3
    va0 = PGROUNDDOWN(srcva);
    80201438:	7bfd                	lui	s7,0xfffff
    pa0 = walkaddr(pagetable, va0);
    if(pa0 == NULL)
      return -1;
    n = PGSIZE - (srcva - va0);
    8020143a:	6a85                	lui	s5,0x1
    8020143c:	a01d                	j	80201462 <copyin+0x4c>
    if(n > len)
      n = len;
    memmove(dst, (void *)(pa0 + (srcva - va0)), n);
    8020143e:	018505b3          	add	a1,a0,s8
    80201442:	0004861b          	sext.w	a2,s1
    80201446:	412585b3          	sub	a1,a1,s2
    8020144a:	8552                	mv	a0,s4
    8020144c:	fffff097          	auipc	ra,0xfffff
    80201450:	372080e7          	jalr	882(ra) # 802007be <memmove>

    len -= n;
    80201454:	409989b3          	sub	s3,s3,s1
    dst += n;
    80201458:	9a26                	add	s4,s4,s1
    srcva = va0 + PGSIZE;
    8020145a:	01590c33          	add	s8,s2,s5
  while(len > 0){
    8020145e:	02098263          	beqz	s3,80201482 <copyin+0x6c>
    va0 = PGROUNDDOWN(srcva);
    80201462:	017c7933          	and	s2,s8,s7
    pa0 = walkaddr(pagetable, va0);
    80201466:	85ca                	mv	a1,s2
    80201468:	855a                	mv	a0,s6
    8020146a:	fffff097          	auipc	ra,0xfffff
    8020146e:	744080e7          	jalr	1860(ra) # 80200bae <walkaddr>
    if(pa0 == NULL)
    80201472:	cd01                	beqz	a0,8020148a <copyin+0x74>
    n = PGSIZE - (srcva - va0);
    80201474:	418904b3          	sub	s1,s2,s8
    80201478:	94d6                	add	s1,s1,s5
    8020147a:	fc99f2e3          	bgeu	s3,s1,8020143e <copyin+0x28>
    8020147e:	84ce                	mv	s1,s3
    80201480:	bf7d                	j	8020143e <copyin+0x28>
  }
  return 0;
    80201482:	4501                	li	a0,0
    80201484:	a021                	j	8020148c <copyin+0x76>
    80201486:	4501                	li	a0,0
}
    80201488:	8082                	ret
      return -1;
    8020148a:	557d                	li	a0,-1
}
    8020148c:	60a6                	ld	ra,72(sp)
    8020148e:	6406                	ld	s0,64(sp)
    80201490:	74e2                	ld	s1,56(sp)
    80201492:	7942                	ld	s2,48(sp)
    80201494:	79a2                	ld	s3,40(sp)
    80201496:	7a02                	ld	s4,32(sp)
    80201498:	6ae2                	ld	s5,24(sp)
    8020149a:	6b42                	ld	s6,16(sp)
    8020149c:	6ba2                	ld	s7,8(sp)
    8020149e:	6c02                	ld	s8,0(sp)
    802014a0:	6161                	addi	sp,sp,80
    802014a2:	8082                	ret

00000000802014a4 <copyin2>:

int
copyin2(char *dst, uint64 srcva, uint64 len)
{
    802014a4:	7179                	addi	sp,sp,-48
    802014a6:	f406                	sd	ra,40(sp)
    802014a8:	f022                	sd	s0,32(sp)
    802014aa:	ec26                	sd	s1,24(sp)
    802014ac:	e84a                	sd	s2,16(sp)
    802014ae:	e44e                	sd	s3,8(sp)
    802014b0:	1800                	addi	s0,sp,48
    802014b2:	89aa                	mv	s3,a0
    802014b4:	84ae                	mv	s1,a1
    802014b6:	8932                	mv	s2,a2
  uint64 sz = myproc()->sz;
    802014b8:	00000097          	auipc	ra,0x0
    802014bc:	5d6080e7          	jalr	1494(ra) # 80201a8e <myproc>
    802014c0:	653c                	ld	a5,72(a0)
  if (srcva + len > sz || srcva >= sz) {
    802014c2:	01248733          	add	a4,s1,s2
    802014c6:	02e7e463          	bltu	a5,a4,802014ee <copyin2+0x4a>
    802014ca:	02f4f463          	bgeu	s1,a5,802014f2 <copyin2+0x4e>
    return -1;
  }
  memmove(dst, (void *)srcva, len);
    802014ce:	0009061b          	sext.w	a2,s2
    802014d2:	85a6                	mv	a1,s1
    802014d4:	854e                	mv	a0,s3
    802014d6:	fffff097          	auipc	ra,0xfffff
    802014da:	2e8080e7          	jalr	744(ra) # 802007be <memmove>
  return 0;
    802014de:	4501                	li	a0,0
}
    802014e0:	70a2                	ld	ra,40(sp)
    802014e2:	7402                	ld	s0,32(sp)
    802014e4:	64e2                	ld	s1,24(sp)
    802014e6:	6942                	ld	s2,16(sp)
    802014e8:	69a2                	ld	s3,8(sp)
    802014ea:	6145                	addi	sp,sp,48
    802014ec:	8082                	ret
    return -1;
    802014ee:	557d                	li	a0,-1
    802014f0:	bfc5                	j	802014e0 <copyin2+0x3c>
    802014f2:	557d                	li	a0,-1
    802014f4:	b7f5                	j	802014e0 <copyin2+0x3c>

00000000802014f6 <copyinstr>:
copyinstr(pagetable_t pagetable, char *dst, uint64 srcva, uint64 max)
{
  uint64 n, va0, pa0;
  int got_null = 0;

  while(got_null == 0 && max > 0){
    802014f6:	c2dd                	beqz	a3,8020159c <copyinstr+0xa6>
{
    802014f8:	715d                	addi	sp,sp,-80
    802014fa:	e486                	sd	ra,72(sp)
    802014fc:	e0a2                	sd	s0,64(sp)
    802014fe:	fc26                	sd	s1,56(sp)
    80201500:	f84a                	sd	s2,48(sp)
    80201502:	f44e                	sd	s3,40(sp)
    80201504:	f052                	sd	s4,32(sp)
    80201506:	ec56                	sd	s5,24(sp)
    80201508:	e85a                	sd	s6,16(sp)
    8020150a:	e45e                	sd	s7,8(sp)
    8020150c:	0880                	addi	s0,sp,80
    8020150e:	8a2a                	mv	s4,a0
    80201510:	8b2e                	mv	s6,a1
    80201512:	8bb2                	mv	s7,a2
    80201514:	84b6                	mv	s1,a3
    va0 = PGROUNDDOWN(srcva);
    80201516:	7afd                	lui	s5,0xfffff
    pa0 = walkaddr(pagetable, va0);
    if(pa0 == NULL)
      return -1;
    n = PGSIZE - (srcva - va0);
    80201518:	6985                	lui	s3,0x1
    8020151a:	a02d                	j	80201544 <copyinstr+0x4e>
      n = max;

    char *p = (char *) (pa0 + (srcva - va0));
    while(n > 0){
      if(*p == '\0'){
        *dst = '\0';
    8020151c:	00078023          	sb	zero,0(a5)
    80201520:	4785                	li	a5,1
      dst++;
    }

    srcva = va0 + PGSIZE;
  }
  if(got_null){
    80201522:	37fd                	addiw	a5,a5,-1
    80201524:	0007851b          	sext.w	a0,a5
    return 0;
  } else {
    return -1;
  }
}
    80201528:	60a6                	ld	ra,72(sp)
    8020152a:	6406                	ld	s0,64(sp)
    8020152c:	74e2                	ld	s1,56(sp)
    8020152e:	7942                	ld	s2,48(sp)
    80201530:	79a2                	ld	s3,40(sp)
    80201532:	7a02                	ld	s4,32(sp)
    80201534:	6ae2                	ld	s5,24(sp)
    80201536:	6b42                	ld	s6,16(sp)
    80201538:	6ba2                	ld	s7,8(sp)
    8020153a:	6161                	addi	sp,sp,80
    8020153c:	8082                	ret
    srcva = va0 + PGSIZE;
    8020153e:	01390bb3          	add	s7,s2,s3
  while(got_null == 0 && max > 0){
    80201542:	c8a9                	beqz	s1,80201594 <copyinstr+0x9e>
    va0 = PGROUNDDOWN(srcva);
    80201544:	015bf933          	and	s2,s7,s5
    pa0 = walkaddr(pagetable, va0);
    80201548:	85ca                	mv	a1,s2
    8020154a:	8552                	mv	a0,s4
    8020154c:	fffff097          	auipc	ra,0xfffff
    80201550:	662080e7          	jalr	1634(ra) # 80200bae <walkaddr>
    if(pa0 == NULL)
    80201554:	c131                	beqz	a0,80201598 <copyinstr+0xa2>
    n = PGSIZE - (srcva - va0);
    80201556:	417906b3          	sub	a3,s2,s7
    8020155a:	96ce                	add	a3,a3,s3
    8020155c:	00d4f363          	bgeu	s1,a3,80201562 <copyinstr+0x6c>
    80201560:	86a6                	mv	a3,s1
    char *p = (char *) (pa0 + (srcva - va0));
    80201562:	955e                	add	a0,a0,s7
    80201564:	41250533          	sub	a0,a0,s2
    while(n > 0){
    80201568:	daf9                	beqz	a3,8020153e <copyinstr+0x48>
    8020156a:	87da                	mv	a5,s6
      if(*p == '\0'){
    8020156c:	41650633          	sub	a2,a0,s6
    80201570:	fff48593          	addi	a1,s1,-1
    80201574:	95da                	add	a1,a1,s6
    while(n > 0){
    80201576:	96da                	add	a3,a3,s6
      if(*p == '\0'){
    80201578:	00f60733          	add	a4,a2,a5
    8020157c:	00074703          	lbu	a4,0(a4) # fffffffffffff000 <ebss_clear+0xffffffff7fdd8000>
    80201580:	df51                	beqz	a4,8020151c <copyinstr+0x26>
        *dst = *p;
    80201582:	00e78023          	sb	a4,0(a5)
      --max;
    80201586:	40f584b3          	sub	s1,a1,a5
      dst++;
    8020158a:	0785                	addi	a5,a5,1
    while(n > 0){
    8020158c:	fed796e3          	bne	a5,a3,80201578 <copyinstr+0x82>
      dst++;
    80201590:	8b3e                	mv	s6,a5
    80201592:	b775                	j	8020153e <copyinstr+0x48>
    80201594:	4781                	li	a5,0
    80201596:	b771                	j	80201522 <copyinstr+0x2c>
      return -1;
    80201598:	557d                	li	a0,-1
    8020159a:	b779                	j	80201528 <copyinstr+0x32>
  int got_null = 0;
    8020159c:	4781                	li	a5,0
  if(got_null){
    8020159e:	37fd                	addiw	a5,a5,-1
    802015a0:	0007851b          	sext.w	a0,a5
}
    802015a4:	8082                	ret

00000000802015a6 <copyinstr2>:

int
copyinstr2(char *dst, uint64 srcva, uint64 max)
{
    802015a6:	7179                	addi	sp,sp,-48
    802015a8:	f406                	sd	ra,40(sp)
    802015aa:	f022                	sd	s0,32(sp)
    802015ac:	ec26                	sd	s1,24(sp)
    802015ae:	e84a                	sd	s2,16(sp)
    802015b0:	e44e                	sd	s3,8(sp)
    802015b2:	1800                	addi	s0,sp,48
    802015b4:	89aa                	mv	s3,a0
    802015b6:	84ae                	mv	s1,a1
    802015b8:	8932                	mv	s2,a2
  int got_null = 0;
  uint64 sz = myproc()->sz;
    802015ba:	00000097          	auipc	ra,0x0
    802015be:	4d4080e7          	jalr	1236(ra) # 80201a8e <myproc>
    802015c2:	6534                	ld	a3,72(a0)
  while(srcva < sz && max > 0){
    802015c4:	04d4f363          	bgeu	s1,a3,8020160a <copyinstr2+0x64>
    802015c8:	04090363          	beqz	s2,8020160e <copyinstr2+0x68>
    802015cc:	01298633          	add	a2,s3,s2
    802015d0:	8e85                	sub	a3,a3,s1
    802015d2:	96ce                	add	a3,a3,s3
    802015d4:	87ce                	mv	a5,s3
    char *p = (char *)srcva;
    if(*p == '\0'){
    802015d6:	413485b3          	sub	a1,s1,s3
    802015da:	00b78733          	add	a4,a5,a1
    802015de:	00074703          	lbu	a4,0(a4)
    802015e2:	cb11                	beqz	a4,802015f6 <copyinstr2+0x50>
      *dst = '\0';
      got_null = 1;
      break;
    } else {
      *dst = *p;
    802015e4:	00e78023          	sb	a4,0(a5)
    }
    --max;
    srcva++;
    dst++;
    802015e8:	0785                	addi	a5,a5,1
  while(srcva < sz && max > 0){
    802015ea:	02d78463          	beq	a5,a3,80201612 <copyinstr2+0x6c>
    802015ee:	fec796e3          	bne	a5,a2,802015da <copyinstr2+0x34>
  }
  if(got_null){
    return 0;
  } else {
    return -1;
    802015f2:	557d                	li	a0,-1
    802015f4:	a021                	j	802015fc <copyinstr2+0x56>
      *dst = '\0';
    802015f6:	00078023          	sb	zero,0(a5)
    return 0;
    802015fa:	4501                	li	a0,0
  }
}
    802015fc:	70a2                	ld	ra,40(sp)
    802015fe:	7402                	ld	s0,32(sp)
    80201600:	64e2                	ld	s1,24(sp)
    80201602:	6942                	ld	s2,16(sp)
    80201604:	69a2                	ld	s3,8(sp)
    80201606:	6145                	addi	sp,sp,48
    80201608:	8082                	ret
    return -1;
    8020160a:	557d                	li	a0,-1
    8020160c:	bfc5                	j	802015fc <copyinstr2+0x56>
    8020160e:	557d                	li	a0,-1
    80201610:	b7f5                	j	802015fc <copyinstr2+0x56>
    80201612:	557d                	li	a0,-1
    80201614:	b7e5                	j	802015fc <copyinstr2+0x56>

0000000080201616 <kfreewalk>:
}

// only free page table, not physical pages
void
kfreewalk(pagetable_t kpt)
{
    80201616:	7179                	addi	sp,sp,-48
    80201618:	f406                	sd	ra,40(sp)
    8020161a:	f022                	sd	s0,32(sp)
    8020161c:	ec26                	sd	s1,24(sp)
    8020161e:	e84a                	sd	s2,16(sp)
    80201620:	e44e                	sd	s3,8(sp)
    80201622:	e052                	sd	s4,0(sp)
    80201624:	1800                	addi	s0,sp,48
    80201626:	8a2a                	mv	s4,a0
  for (int i = 0; i < 512; i++) {
    80201628:	84aa                	mv	s1,a0
    8020162a:	6905                	lui	s2,0x1
    8020162c:	992a                	add	s2,s2,a0
    pte_t pte = kpt[i];
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    8020162e:	4985                	li	s3,1
    80201630:	a829                	j	8020164a <kfreewalk+0x34>
      kfreewalk((pagetable_t) PTE2PA(pte));
    80201632:	83a9                	srli	a5,a5,0xa
    80201634:	00c79513          	slli	a0,a5,0xc
    80201638:	00000097          	auipc	ra,0x0
    8020163c:	fde080e7          	jalr	-34(ra) # 80201616 <kfreewalk>
      kpt[i] = 0;
    80201640:	0004b023          	sd	zero,0(s1)
  for (int i = 0; i < 512; i++) {
    80201644:	04a1                	addi	s1,s1,8
    80201646:	01248963          	beq	s1,s2,80201658 <kfreewalk+0x42>
    pte_t pte = kpt[i];
    8020164a:	609c                	ld	a5,0(s1)
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    8020164c:	00f7f713          	andi	a4,a5,15
    80201650:	ff3701e3          	beq	a4,s3,80201632 <kfreewalk+0x1c>
    } else if (pte & PTE_V) {
    80201654:	8b85                	andi	a5,a5,1
    80201656:	d7fd                	beqz	a5,80201644 <kfreewalk+0x2e>
      break;
    }
  }
  kfree((void *) kpt);
    80201658:	8552                	mv	a0,s4
    8020165a:	fffff097          	auipc	ra,0xfffff
    8020165e:	de6080e7          	jalr	-538(ra) # 80200440 <kfree>
}
    80201662:	70a2                	ld	ra,40(sp)
    80201664:	7402                	ld	s0,32(sp)
    80201666:	64e2                	ld	s1,24(sp)
    80201668:	6942                	ld	s2,16(sp)
    8020166a:	69a2                	ld	s3,8(sp)
    8020166c:	6a02                	ld	s4,0(sp)
    8020166e:	6145                	addi	sp,sp,48
    80201670:	8082                	ret

0000000080201672 <kvmfreeusr>:

void
kvmfreeusr(pagetable_t kpt)
{
    80201672:	1101                	addi	sp,sp,-32
    80201674:	ec06                	sd	ra,24(sp)
    80201676:	e822                	sd	s0,16(sp)
    80201678:	e426                	sd	s1,8(sp)
    8020167a:	1000                	addi	s0,sp,32
    8020167c:	84aa                	mv	s1,a0
  pte_t pte;
  for (int i = 0; i < PX(2, MAXUVA); i++) {
    pte = kpt[i];
    8020167e:	6108                	ld	a0,0(a0)
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    80201680:	00f57713          	andi	a4,a0,15
    80201684:	4785                	li	a5,1
    80201686:	00f70d63          	beq	a4,a5,802016a0 <kvmfreeusr+0x2e>
    pte = kpt[i];
    8020168a:	6488                	ld	a0,8(s1)
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    8020168c:	00f57713          	andi	a4,a0,15
    80201690:	4785                	li	a5,1
    80201692:	02f70063          	beq	a4,a5,802016b2 <kvmfreeusr+0x40>
      kfreewalk((pagetable_t) PTE2PA(pte));
      kpt[i] = 0;
    }
  }
}
    80201696:	60e2                	ld	ra,24(sp)
    80201698:	6442                	ld	s0,16(sp)
    8020169a:	64a2                	ld	s1,8(sp)
    8020169c:	6105                	addi	sp,sp,32
    8020169e:	8082                	ret
      kfreewalk((pagetable_t) PTE2PA(pte));
    802016a0:	8129                	srli	a0,a0,0xa
    802016a2:	0532                	slli	a0,a0,0xc
    802016a4:	00000097          	auipc	ra,0x0
    802016a8:	f72080e7          	jalr	-142(ra) # 80201616 <kfreewalk>
      kpt[i] = 0;
    802016ac:	0004b023          	sd	zero,0(s1)
    802016b0:	bfe9                	j	8020168a <kvmfreeusr+0x18>
      kfreewalk((pagetable_t) PTE2PA(pte));
    802016b2:	8129                	srli	a0,a0,0xa
    802016b4:	0532                	slli	a0,a0,0xc
    802016b6:	00000097          	auipc	ra,0x0
    802016ba:	f60080e7          	jalr	-160(ra) # 80201616 <kfreewalk>
      kpt[i] = 0;
    802016be:	0004b423          	sd	zero,8(s1)
}
    802016c2:	bfd1                	j	80201696 <kvmfreeusr+0x24>

00000000802016c4 <kvmfree>:

void
kvmfree(pagetable_t kpt, int stack_free)
{
    802016c4:	1101                	addi	sp,sp,-32
    802016c6:	ec06                	sd	ra,24(sp)
    802016c8:	e822                	sd	s0,16(sp)
    802016ca:	e426                	sd	s1,8(sp)
    802016cc:	1000                	addi	s0,sp,32
    802016ce:	84aa                	mv	s1,a0
  if (stack_free) {
    802016d0:	e185                	bnez	a1,802016f0 <kvmfree+0x2c>
    pte_t pte = kpt[PX(2, VKSTACK)];
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
      kfreewalk((pagetable_t) PTE2PA(pte));
    }
  }
  kvmfreeusr(kpt);
    802016d2:	8526                	mv	a0,s1
    802016d4:	00000097          	auipc	ra,0x0
    802016d8:	f9e080e7          	jalr	-98(ra) # 80201672 <kvmfreeusr>
  kfree(kpt);
    802016dc:	8526                	mv	a0,s1
    802016de:	fffff097          	auipc	ra,0xfffff
    802016e2:	d62080e7          	jalr	-670(ra) # 80200440 <kfree>
}
    802016e6:	60e2                	ld	ra,24(sp)
    802016e8:	6442                	ld	s0,16(sp)
    802016ea:	64a2                	ld	s1,8(sp)
    802016ec:	6105                	addi	sp,sp,32
    802016ee:	8082                	ret
    vmunmap(kpt, VKSTACK, 1, 1);
    802016f0:	4685                	li	a3,1
    802016f2:	4605                	li	a2,1
    802016f4:	0fb00593          	li	a1,251
    802016f8:	05fa                	slli	a1,a1,0x1e
    802016fa:	fffff097          	auipc	ra,0xfffff
    802016fe:	728080e7          	jalr	1832(ra) # 80200e22 <vmunmap>
    pte_t pte = kpt[PX(2, VKSTACK)];
    80201702:	7d84b503          	ld	a0,2008(s1)
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    80201706:	00f57713          	andi	a4,a0,15
    8020170a:	4785                	li	a5,1
    8020170c:	fcf713e3          	bne	a4,a5,802016d2 <kvmfree+0xe>
      kfreewalk((pagetable_t) PTE2PA(pte));
    80201710:	8129                	srli	a0,a0,0xa
    80201712:	0532                	slli	a0,a0,0xc
    80201714:	00000097          	auipc	ra,0x0
    80201718:	f02080e7          	jalr	-254(ra) # 80201616 <kfreewalk>
    8020171c:	bf5d                	j	802016d2 <kvmfree+0xe>

000000008020171e <proc_kpagetable>:
{
    8020171e:	1101                	addi	sp,sp,-32
    80201720:	ec06                	sd	ra,24(sp)
    80201722:	e822                	sd	s0,16(sp)
    80201724:	e426                	sd	s1,8(sp)
    80201726:	1000                	addi	s0,sp,32
  pagetable_t kpt = (pagetable_t) kalloc();
    80201728:	fffff097          	auipc	ra,0xfffff
    8020172c:	e32080e7          	jalr	-462(ra) # 8020055a <kalloc>
    80201730:	84aa                	mv	s1,a0
  if (kpt == NULL)
    80201732:	c91d                	beqz	a0,80201768 <proc_kpagetable+0x4a>
  memmove(kpt, kernel_pagetable, PGSIZE);
    80201734:	6605                	lui	a2,0x1
    80201736:	00014597          	auipc	a1,0x14
    8020173a:	9225b583          	ld	a1,-1758(a1) # 80215058 <kernel_pagetable>
    8020173e:	fffff097          	auipc	ra,0xfffff
    80201742:	080080e7          	jalr	128(ra) # 802007be <memmove>
  char *pstack = kalloc();
    80201746:	fffff097          	auipc	ra,0xfffff
    8020174a:	e14080e7          	jalr	-492(ra) # 8020055a <kalloc>
    8020174e:	86aa                	mv	a3,a0
  if(pstack == NULL)
    80201750:	c115                	beqz	a0,80201774 <proc_kpagetable+0x56>
  if (mappages(kpt, VKSTACK, PGSIZE, (uint64)pstack, PTE_R | PTE_W) != 0)
    80201752:	4719                	li	a4,6
    80201754:	6605                	lui	a2,0x1
    80201756:	0fb00593          	li	a1,251
    8020175a:	05fa                	slli	a1,a1,0x1e
    8020175c:	8526                	mv	a0,s1
    8020175e:	fffff097          	auipc	ra,0xfffff
    80201762:	50a080e7          	jalr	1290(ra) # 80200c68 <mappages>
    80201766:	e519                	bnez	a0,80201774 <proc_kpagetable+0x56>
}
    80201768:	8526                	mv	a0,s1
    8020176a:	60e2                	ld	ra,24(sp)
    8020176c:	6442                	ld	s0,16(sp)
    8020176e:	64a2                	ld	s1,8(sp)
    80201770:	6105                	addi	sp,sp,32
    80201772:	8082                	ret
  kvmfree(kpt, 1);
    80201774:	4585                	li	a1,1
    80201776:	8526                	mv	a0,s1
    80201778:	00000097          	auipc	ra,0x0
    8020177c:	f4c080e7          	jalr	-180(ra) # 802016c4 <kvmfree>
  return NULL;
    80201780:	4481                	li	s1,0
    80201782:	b7dd                	j	80201768 <proc_kpagetable+0x4a>

0000000080201784 <vmprint>:

void vmprint(pagetable_t pagetable)
{
    80201784:	7119                	addi	sp,sp,-128
    80201786:	fc86                	sd	ra,120(sp)
    80201788:	f8a2                	sd	s0,112(sp)
    8020178a:	f4a6                	sd	s1,104(sp)
    8020178c:	f0ca                	sd	s2,96(sp)
    8020178e:	ecce                	sd	s3,88(sp)
    80201790:	e8d2                	sd	s4,80(sp)
    80201792:	e4d6                	sd	s5,72(sp)
    80201794:	e0da                	sd	s6,64(sp)
    80201796:	fc5e                	sd	s7,56(sp)
    80201798:	f862                	sd	s8,48(sp)
    8020179a:	f466                	sd	s9,40(sp)
    8020179c:	f06a                	sd	s10,32(sp)
    8020179e:	ec6e                	sd	s11,24(sp)
    802017a0:	0100                	addi	s0,sp,128
    802017a2:	8baa                	mv	s7,a0
    802017a4:	f8a43423          	sd	a0,-120(s0)
  const int capacity = 512;
  printf("page table %p\n", pagetable);
    802017a8:	85aa                	mv	a1,a0
    802017aa:	00008517          	auipc	a0,0x8
    802017ae:	d5650513          	addi	a0,a0,-682 # 80209500 <digits+0x180>
    802017b2:	fffff097          	auipc	ra,0xfffff
    802017b6:	9dc080e7          	jalr	-1572(ra) # 8020018e <printf>
  for (pte_t *pte = (pte_t *) pagetable; pte < pagetable + capacity; pte++) {
    802017ba:	6d85                	lui	s11,0x1
    802017bc:	9dde                	add	s11,s11,s7
    802017be:	6c85                	lui	s9,0x1

      for (pte_t *pte2 = (pte_t *) pt2; pte2 < pt2 + capacity; pte2++) {
        if (*pte2 & PTE_V)
        {
          pagetable_t pt3 = (pagetable_t) PTE2PA(*pte2);
          printf(".. ..%d: pte %p pa %p\n", pte2 - pt2, *pte2, pt3);
    802017c0:	00008d17          	auipc	s10,0x8
    802017c4:	d68d0d13          	addi	s10,s10,-664 # 80209528 <digits+0x1a8>

          for (pte_t *pte3 = (pte_t *) pt3; pte3 < pt3 + capacity; pte3++)
            if (*pte3 & PTE_V)
              printf(".. .. ..%d: pte %p pa %p\n", pte3 - pt3, *pte3, PTE2PA(*pte3));
    802017c8:	00008a17          	auipc	s4,0x8
    802017cc:	d78a0a13          	addi	s4,s4,-648 # 80209540 <digits+0x1c0>
    802017d0:	a885                	j	80201840 <vmprint+0xbc>
          for (pte_t *pte3 = (pte_t *) pt3; pte3 < pt3 + capacity; pte3++)
    802017d2:	04a1                	addi	s1,s1,8
    802017d4:	197d                	addi	s2,s2,-1 # fff <_entry-0x801ff001>
    802017d6:	02090263          	beqz	s2,802017fa <vmprint+0x76>
            if (*pte3 & PTE_V)
    802017da:	6090                	ld	a2,0(s1)
    802017dc:	00167793          	andi	a5,a2,1
    802017e0:	dbed                	beqz	a5,802017d2 <vmprint+0x4e>
              printf(".. .. ..%d: pte %p pa %p\n", pte3 - pt3, *pte3, PTE2PA(*pte3));
    802017e2:	00a65693          	srli	a3,a2,0xa
    802017e6:	413485b3          	sub	a1,s1,s3
    802017ea:	06b2                	slli	a3,a3,0xc
    802017ec:	858d                	srai	a1,a1,0x3
    802017ee:	8552                	mv	a0,s4
    802017f0:	fffff097          	auipc	ra,0xfffff
    802017f4:	99e080e7          	jalr	-1634(ra) # 8020018e <printf>
    802017f8:	bfe9                	j	802017d2 <vmprint+0x4e>
      for (pte_t *pte2 = (pte_t *) pt2; pte2 < pt2 + capacity; pte2++) {
    802017fa:	0aa1                	addi	s5,s5,8 # fffffffffffff008 <ebss_clear+0xffffffff7fdd8008>
    802017fc:	1b7d                	addi	s6,s6,-1 # fff <_entry-0x801ff001>
    802017fe:	020b0e63          	beqz	s6,8020183a <vmprint+0xb6>
        if (*pte2 & PTE_V)
    80201802:	000ab603          	ld	a2,0(s5)
    80201806:	00167793          	andi	a5,a2,1
    8020180a:	dbe5                	beqz	a5,802017fa <vmprint+0x76>
          pagetable_t pt3 = (pagetable_t) PTE2PA(*pte2);
    8020180c:	00a65993          	srli	s3,a2,0xa
    80201810:	09b2                	slli	s3,s3,0xc
          printf(".. ..%d: pte %p pa %p\n", pte2 - pt2, *pte2, pt3);
    80201812:	418a85b3          	sub	a1,s5,s8
    80201816:	86ce                	mv	a3,s3
    80201818:	858d                	srai	a1,a1,0x3
    8020181a:	856a                	mv	a0,s10
    8020181c:	fffff097          	auipc	ra,0xfffff
    80201820:	972080e7          	jalr	-1678(ra) # 8020018e <printf>
          for (pte_t *pte3 = (pte_t *) pt3; pte3 < pt3 + capacity; pte3++)
    80201824:	00898713          	addi	a4,s3,8 # 1008 <_entry-0x801feff8>
    80201828:	019987b3          	add	a5,s3,s9
    8020182c:	20000913          	li	s2,512
    80201830:	00e7f363          	bgeu	a5,a4,80201836 <vmprint+0xb2>
    80201834:	4905                	li	s2,1
    80201836:	84ce                	mv	s1,s3
    80201838:	b74d                	j	802017da <vmprint+0x56>
  for (pte_t *pte = (pte_t *) pagetable; pte < pagetable + capacity; pte++) {
    8020183a:	0ba1                	addi	s7,s7,8 # fffffffffffff008 <ebss_clear+0xffffffff7fdd8008>
    8020183c:	05bb8463          	beq	s7,s11,80201884 <vmprint+0x100>
    if (*pte & PTE_V)
    80201840:	000bb603          	ld	a2,0(s7)
    80201844:	00167793          	andi	a5,a2,1
    80201848:	dbed                	beqz	a5,8020183a <vmprint+0xb6>
      pagetable_t pt2 = (pagetable_t) PTE2PA(*pte); 
    8020184a:	00a65c13          	srli	s8,a2,0xa
    8020184e:	0c32                	slli	s8,s8,0xc
      printf("..%d: pte %p pa %p\n", pte - pagetable, *pte, pt2);
    80201850:	f8843783          	ld	a5,-120(s0)
    80201854:	40fb87b3          	sub	a5,s7,a5
    80201858:	86e2                	mv	a3,s8
    8020185a:	4037d593          	srai	a1,a5,0x3
    8020185e:	00008517          	auipc	a0,0x8
    80201862:	cb250513          	addi	a0,a0,-846 # 80209510 <digits+0x190>
    80201866:	fffff097          	auipc	ra,0xfffff
    8020186a:	928080e7          	jalr	-1752(ra) # 8020018e <printf>
      for (pte_t *pte2 = (pte_t *) pt2; pte2 < pt2 + capacity; pte2++) {
    8020186e:	019c0733          	add	a4,s8,s9
    80201872:	008c0793          	addi	a5,s8,8 # 1008 <_entry-0x801feff8>
    80201876:	20000b13          	li	s6,512
    8020187a:	00f77363          	bgeu	a4,a5,80201880 <vmprint+0xfc>
    8020187e:	4b05                	li	s6,1
    80201880:	8ae2                	mv	s5,s8
    80201882:	b741                	j	80201802 <vmprint+0x7e>
        }
      }
    }
  }
  return;
    80201884:	70e6                	ld	ra,120(sp)
    80201886:	7446                	ld	s0,112(sp)
    80201888:	74a6                	ld	s1,104(sp)
    8020188a:	7906                	ld	s2,96(sp)
    8020188c:	69e6                	ld	s3,88(sp)
    8020188e:	6a46                	ld	s4,80(sp)
    80201890:	6aa6                	ld	s5,72(sp)
    80201892:	6b06                	ld	s6,64(sp)
    80201894:	7be2                	ld	s7,56(sp)
    80201896:	7c42                	ld	s8,48(sp)
    80201898:	7ca2                	ld	s9,40(sp)
    8020189a:	7d02                	ld	s10,32(sp)
    8020189c:	6de2                	ld	s11,24(sp)
    8020189e:	6109                	addi	sp,sp,128
    802018a0:	8082                	ret

00000000802018a2 <wakeup1>:

// Wake up p if it is sleeping in wait(); used by exit().
// Caller must hold p->lock.
static void
wakeup1(struct proc *p)
{
    802018a2:	1101                	addi	sp,sp,-32
    802018a4:	ec06                	sd	ra,24(sp)
    802018a6:	e822                	sd	s0,16(sp)
    802018a8:	e426                	sd	s1,8(sp)
    802018aa:	1000                	addi	s0,sp,32
    802018ac:	84aa                	mv	s1,a0
  if(!holding(&p->lock))
    802018ae:	fffff097          	auipc	ra,0xfffff
    802018b2:	dea080e7          	jalr	-534(ra) # 80200698 <holding>
    802018b6:	c909                	beqz	a0,802018c8 <wakeup1+0x26>
    panic("wakeup1");
  if(p->chan == p && p->state == SLEEPING) {
    802018b8:	749c                	ld	a5,40(s1)
    802018ba:	00978f63          	beq	a5,s1,802018d8 <wakeup1+0x36>
    p->state = RUNNABLE;
  }
}
    802018be:	60e2                	ld	ra,24(sp)
    802018c0:	6442                	ld	s0,16(sp)
    802018c2:	64a2                	ld	s1,8(sp)
    802018c4:	6105                	addi	sp,sp,32
    802018c6:	8082                	ret
    panic("wakeup1");
    802018c8:	00008517          	auipc	a0,0x8
    802018cc:	c9850513          	addi	a0,a0,-872 # 80209560 <digits+0x1e0>
    802018d0:	fffff097          	auipc	ra,0xfffff
    802018d4:	874080e7          	jalr	-1932(ra) # 80200144 <panic>
  if(p->chan == p && p->state == SLEEPING) {
    802018d8:	4c98                	lw	a4,24(s1)
    802018da:	4785                	li	a5,1
    802018dc:	fef711e3          	bne	a4,a5,802018be <wakeup1+0x1c>
    p->state = RUNNABLE;
    802018e0:	4789                	li	a5,2
    802018e2:	cc9c                	sw	a5,24(s1)
}
    802018e4:	bfe9                	j	802018be <wakeup1+0x1c>

00000000802018e6 <reg_info>:
void reg_info(void) {
    802018e6:	1141                	addi	sp,sp,-16
    802018e8:	e406                	sd	ra,8(sp)
    802018ea:	e022                	sd	s0,0(sp)
    802018ec:	0800                	addi	s0,sp,16
  printf("register info: {\n");
    802018ee:	00008517          	auipc	a0,0x8
    802018f2:	c7a50513          	addi	a0,a0,-902 # 80209568 <digits+0x1e8>
    802018f6:	fffff097          	auipc	ra,0xfffff
    802018fa:	898080e7          	jalr	-1896(ra) # 8020018e <printf>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802018fe:	100025f3          	csrr	a1,sstatus
  printf("sstatus: %p\n", r_sstatus());
    80201902:	00008517          	auipc	a0,0x8
    80201906:	c7e50513          	addi	a0,a0,-898 # 80209580 <digits+0x200>
    8020190a:	fffff097          	auipc	ra,0xfffff
    8020190e:	884080e7          	jalr	-1916(ra) # 8020018e <printf>
  asm volatile("csrr %0, sip" : "=r" (x) );
    80201912:	144025f3          	csrr	a1,sip
  printf("sip: %p\n", r_sip());
    80201916:	00008517          	auipc	a0,0x8
    8020191a:	c7a50513          	addi	a0,a0,-902 # 80209590 <digits+0x210>
    8020191e:	fffff097          	auipc	ra,0xfffff
    80201922:	870080e7          	jalr	-1936(ra) # 8020018e <printf>
  asm volatile("csrr %0, sie" : "=r" (x) );
    80201926:	104025f3          	csrr	a1,sie
  printf("sie: %p\n", r_sie());
    8020192a:	00008517          	auipc	a0,0x8
    8020192e:	c7650513          	addi	a0,a0,-906 # 802095a0 <digits+0x220>
    80201932:	fffff097          	auipc	ra,0xfffff
    80201936:	85c080e7          	jalr	-1956(ra) # 8020018e <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    8020193a:	141025f3          	csrr	a1,sepc
  printf("sepc: %p\n", r_sepc());
    8020193e:	00008517          	auipc	a0,0x8
    80201942:	c7250513          	addi	a0,a0,-910 # 802095b0 <digits+0x230>
    80201946:	fffff097          	auipc	ra,0xfffff
    8020194a:	848080e7          	jalr	-1976(ra) # 8020018e <printf>
  asm volatile("csrr %0, stvec" : "=r" (x) );
    8020194e:	105025f3          	csrr	a1,stvec
  printf("stvec: %p\n", r_stvec());
    80201952:	00008517          	auipc	a0,0x8
    80201956:	c6e50513          	addi	a0,a0,-914 # 802095c0 <digits+0x240>
    8020195a:	fffff097          	auipc	ra,0xfffff
    8020195e:	834080e7          	jalr	-1996(ra) # 8020018e <printf>
  asm volatile("csrr %0, satp" : "=r" (x) );
    80201962:	180025f3          	csrr	a1,satp
  printf("satp: %p\n", r_satp());
    80201966:	00008517          	auipc	a0,0x8
    8020196a:	c6a50513          	addi	a0,a0,-918 # 802095d0 <digits+0x250>
    8020196e:	fffff097          	auipc	ra,0xfffff
    80201972:	820080e7          	jalr	-2016(ra) # 8020018e <printf>
  asm volatile("csrr %0, scause" : "=r" (x) );
    80201976:	142025f3          	csrr	a1,scause
  printf("scause: %p\n", r_scause());
    8020197a:	00008517          	auipc	a0,0x8
    8020197e:	c6650513          	addi	a0,a0,-922 # 802095e0 <digits+0x260>
    80201982:	fffff097          	auipc	ra,0xfffff
    80201986:	80c080e7          	jalr	-2036(ra) # 8020018e <printf>
  asm volatile("csrr %0, stval" : "=r" (x) );
    8020198a:	143025f3          	csrr	a1,stval
  printf("stval: %p\n", r_stval());
    8020198e:	00008517          	auipc	a0,0x8
    80201992:	c6250513          	addi	a0,a0,-926 # 802095f0 <digits+0x270>
    80201996:	ffffe097          	auipc	ra,0xffffe
    8020199a:	7f8080e7          	jalr	2040(ra) # 8020018e <printf>
  asm volatile("mv %0, sp" : "=r" (x) );
    8020199e:	858a                	mv	a1,sp
  printf("sp: %p\n", r_sp());
    802019a0:	00008517          	auipc	a0,0x8
    802019a4:	c6050513          	addi	a0,a0,-928 # 80209600 <digits+0x280>
    802019a8:	ffffe097          	auipc	ra,0xffffe
    802019ac:	7e6080e7          	jalr	2022(ra) # 8020018e <printf>
  asm volatile("mv %0, tp" : "=r" (x) );
    802019b0:	8592                	mv	a1,tp
  printf("tp: %p\n", r_tp());
    802019b2:	00008517          	auipc	a0,0x8
    802019b6:	c5650513          	addi	a0,a0,-938 # 80209608 <digits+0x288>
    802019ba:	ffffe097          	auipc	ra,0xffffe
    802019be:	7d4080e7          	jalr	2004(ra) # 8020018e <printf>
  asm volatile("mv %0, ra" : "=r" (x) );
    802019c2:	8586                	mv	a1,ra
  printf("ra: %p\n", r_ra());
    802019c4:	00008517          	auipc	a0,0x8
    802019c8:	c4c50513          	addi	a0,a0,-948 # 80209610 <digits+0x290>
    802019cc:	ffffe097          	auipc	ra,0xffffe
    802019d0:	7c2080e7          	jalr	1986(ra) # 8020018e <printf>
  printf("}\n");
    802019d4:	00008517          	auipc	a0,0x8
    802019d8:	c4450513          	addi	a0,a0,-956 # 80209618 <digits+0x298>
    802019dc:	ffffe097          	auipc	ra,0xffffe
    802019e0:	7b2080e7          	jalr	1970(ra) # 8020018e <printf>
}
    802019e4:	60a2                	ld	ra,8(sp)
    802019e6:	6402                	ld	s0,0(sp)
    802019e8:	0141                	addi	sp,sp,16
    802019ea:	8082                	ret

00000000802019ec <procinit>:
{
    802019ec:	7179                	addi	sp,sp,-48
    802019ee:	f406                	sd	ra,40(sp)
    802019f0:	f022                	sd	s0,32(sp)
    802019f2:	ec26                	sd	s1,24(sp)
    802019f4:	e84a                	sd	s2,16(sp)
    802019f6:	e44e                	sd	s3,8(sp)
    802019f8:	1800                	addi	s0,sp,48
  initlock(&pid_lock, "nextpid");
    802019fa:	00008597          	auipc	a1,0x8
    802019fe:	c2658593          	addi	a1,a1,-986 # 80209620 <digits+0x2a0>
    80201a02:	00013517          	auipc	a0,0x13
    80201a06:	65e50513          	addi	a0,a0,1630 # 80215060 <pid_lock>
    80201a0a:	fffff097          	auipc	ra,0xfffff
    80201a0e:	c78080e7          	jalr	-904(ra) # 80200682 <initlock>
  for(p = proc; p < &proc[NPROC]; p++) {
    80201a12:	00013497          	auipc	s1,0x13
    80201a16:	76e48493          	addi	s1,s1,1902 # 80215180 <proc>
      initlock(&p->lock, "proc");
    80201a1a:	00008997          	auipc	s3,0x8
    80201a1e:	c0e98993          	addi	s3,s3,-1010 # 80209628 <digits+0x2a8>
  for(p = proc; p < &proc[NPROC]; p++) {
    80201a22:	00018917          	auipc	s2,0x18
    80201a26:	0ce90913          	addi	s2,s2,206 # 80219af0 <bcache>
      initlock(&p->lock, "proc");
    80201a2a:	85ce                	mv	a1,s3
    80201a2c:	8526                	mv	a0,s1
    80201a2e:	fffff097          	auipc	ra,0xfffff
    80201a32:	c54080e7          	jalr	-940(ra) # 80200682 <initlock>
  for(p = proc; p < &proc[NPROC]; p++) {
    80201a36:	17848493          	addi	s1,s1,376
    80201a3a:	ff2498e3          	bne	s1,s2,80201a2a <procinit+0x3e>
  memset(cpus, 0, sizeof(cpus));
    80201a3e:	10000613          	li	a2,256
    80201a42:	4581                	li	a1,0
    80201a44:	00013517          	auipc	a0,0x13
    80201a48:	63450513          	addi	a0,a0,1588 # 80215078 <cpus>
    80201a4c:	fffff097          	auipc	ra,0xfffff
    80201a50:	d16080e7          	jalr	-746(ra) # 80200762 <memset>
}
    80201a54:	70a2                	ld	ra,40(sp)
    80201a56:	7402                	ld	s0,32(sp)
    80201a58:	64e2                	ld	s1,24(sp)
    80201a5a:	6942                	ld	s2,16(sp)
    80201a5c:	69a2                	ld	s3,8(sp)
    80201a5e:	6145                	addi	sp,sp,48
    80201a60:	8082                	ret

0000000080201a62 <cpuid>:
{
    80201a62:	1141                	addi	sp,sp,-16
    80201a64:	e422                	sd	s0,8(sp)
    80201a66:	0800                	addi	s0,sp,16
  asm volatile("mv %0, tp" : "=r" (x) );
    80201a68:	8512                	mv	a0,tp
}
    80201a6a:	2501                	sext.w	a0,a0
    80201a6c:	6422                	ld	s0,8(sp)
    80201a6e:	0141                	addi	sp,sp,16
    80201a70:	8082                	ret

0000000080201a72 <mycpu>:
mycpu(void) {
    80201a72:	1141                	addi	sp,sp,-16
    80201a74:	e422                	sd	s0,8(sp)
    80201a76:	0800                	addi	s0,sp,16
    80201a78:	8792                	mv	a5,tp
  struct cpu *c = &cpus[id];
    80201a7a:	2781                	sext.w	a5,a5
    80201a7c:	079e                	slli	a5,a5,0x7
}
    80201a7e:	00013517          	auipc	a0,0x13
    80201a82:	5fa50513          	addi	a0,a0,1530 # 80215078 <cpus>
    80201a86:	953e                	add	a0,a0,a5
    80201a88:	6422                	ld	s0,8(sp)
    80201a8a:	0141                	addi	sp,sp,16
    80201a8c:	8082                	ret

0000000080201a8e <myproc>:
myproc(void) {
    80201a8e:	1101                	addi	sp,sp,-32
    80201a90:	ec06                	sd	ra,24(sp)
    80201a92:	e822                	sd	s0,16(sp)
    80201a94:	e426                	sd	s1,8(sp)
    80201a96:	1000                	addi	s0,sp,32
  push_off();
    80201a98:	fffff097          	auipc	ra,0xfffff
    80201a9c:	b3e080e7          	jalr	-1218(ra) # 802005d6 <push_off>
    80201aa0:	8792                	mv	a5,tp
  struct proc *p = c->proc;
    80201aa2:	2781                	sext.w	a5,a5
    80201aa4:	079e                	slli	a5,a5,0x7
    80201aa6:	00013717          	auipc	a4,0x13
    80201aaa:	5ba70713          	addi	a4,a4,1466 # 80215060 <pid_lock>
    80201aae:	97ba                	add	a5,a5,a4
    80201ab0:	6f84                	ld	s1,24(a5)
  pop_off();
    80201ab2:	fffff097          	auipc	ra,0xfffff
    80201ab6:	b70080e7          	jalr	-1168(ra) # 80200622 <pop_off>
}
    80201aba:	8526                	mv	a0,s1
    80201abc:	60e2                	ld	ra,24(sp)
    80201abe:	6442                	ld	s0,16(sp)
    80201ac0:	64a2                	ld	s1,8(sp)
    80201ac2:	6105                	addi	sp,sp,32
    80201ac4:	8082                	ret

0000000080201ac6 <forkret>:
{
    80201ac6:	1101                	addi	sp,sp,-32
    80201ac8:	ec06                	sd	ra,24(sp)
    80201aca:	e822                	sd	s0,16(sp)
    80201acc:	e426                	sd	s1,8(sp)
    80201ace:	1000                	addi	s0,sp,32
  release(&myproc()->lock);
    80201ad0:	00000097          	auipc	ra,0x0
    80201ad4:	fbe080e7          	jalr	-66(ra) # 80201a8e <myproc>
    80201ad8:	fffff097          	auipc	ra,0xfffff
    80201adc:	c42080e7          	jalr	-958(ra) # 8020071a <release>
  if (first) {
    80201ae0:	00009797          	auipc	a5,0x9
    80201ae4:	5207a783          	lw	a5,1312(a5) # 8020b000 <first.1>
    80201ae8:	eb91                	bnez	a5,80201afc <forkret+0x36>
  usertrapret();
    80201aea:	00001097          	auipc	ra,0x1
    80201aee:	f12080e7          	jalr	-238(ra) # 802029fc <usertrapret>
}
    80201af2:	60e2                	ld	ra,24(sp)
    80201af4:	6442                	ld	s0,16(sp)
    80201af6:	64a2                	ld	s1,8(sp)
    80201af8:	6105                	addi	sp,sp,32
    80201afa:	8082                	ret
    first = 0;
    80201afc:	00009797          	auipc	a5,0x9
    80201b00:	5007a223          	sw	zero,1284(a5) # 8020b000 <first.1>
    fat32_init();
    80201b04:	00004097          	auipc	ra,0x4
    80201b08:	74e080e7          	jalr	1870(ra) # 80206252 <fat32_init>
    myproc()->cwd = ename("/");
    80201b0c:	00000097          	auipc	ra,0x0
    80201b10:	f82080e7          	jalr	-126(ra) # 80201a8e <myproc>
    80201b14:	84aa                	mv	s1,a0
    80201b16:	00008517          	auipc	a0,0x8
    80201b1a:	b1a50513          	addi	a0,a0,-1254 # 80209630 <digits+0x2b0>
    80201b1e:	00006097          	auipc	ra,0x6
    80201b22:	938080e7          	jalr	-1736(ra) # 80207456 <ename>
    80201b26:	14a4bc23          	sd	a0,344(s1)
    80201b2a:	b7c1                	j	80201aea <forkret+0x24>

0000000080201b2c <allocpid>:
allocpid() {
    80201b2c:	1101                	addi	sp,sp,-32
    80201b2e:	ec06                	sd	ra,24(sp)
    80201b30:	e822                	sd	s0,16(sp)
    80201b32:	e426                	sd	s1,8(sp)
    80201b34:	e04a                	sd	s2,0(sp)
    80201b36:	1000                	addi	s0,sp,32
  acquire(&pid_lock);
    80201b38:	00013917          	auipc	s2,0x13
    80201b3c:	52890913          	addi	s2,s2,1320 # 80215060 <pid_lock>
    80201b40:	854a                	mv	a0,s2
    80201b42:	fffff097          	auipc	ra,0xfffff
    80201b46:	b84080e7          	jalr	-1148(ra) # 802006c6 <acquire>
  pid = nextpid;
    80201b4a:	00009797          	auipc	a5,0x9
    80201b4e:	4b678793          	addi	a5,a5,1206 # 8020b000 <first.1>
    80201b52:	43c4                	lw	s1,4(a5)
  nextpid = nextpid + 1;
    80201b54:	0014871b          	addiw	a4,s1,1
    80201b58:	c3d8                	sw	a4,4(a5)
  release(&pid_lock);
    80201b5a:	854a                	mv	a0,s2
    80201b5c:	fffff097          	auipc	ra,0xfffff
    80201b60:	bbe080e7          	jalr	-1090(ra) # 8020071a <release>
}
    80201b64:	8526                	mv	a0,s1
    80201b66:	60e2                	ld	ra,24(sp)
    80201b68:	6442                	ld	s0,16(sp)
    80201b6a:	64a2                	ld	s1,8(sp)
    80201b6c:	6902                	ld	s2,0(sp)
    80201b6e:	6105                	addi	sp,sp,32
    80201b70:	8082                	ret

0000000080201b72 <proc_pagetable>:
{
    80201b72:	1101                	addi	sp,sp,-32
    80201b74:	ec06                	sd	ra,24(sp)
    80201b76:	e822                	sd	s0,16(sp)
    80201b78:	e426                	sd	s1,8(sp)
    80201b7a:	e04a                	sd	s2,0(sp)
    80201b7c:	1000                	addi	s0,sp,32
    80201b7e:	892a                	mv	s2,a0
  pagetable = uvmcreate();
    80201b80:	fffff097          	auipc	ra,0xfffff
    80201b84:	366080e7          	jalr	870(ra) # 80200ee6 <uvmcreate>
    80201b88:	84aa                	mv	s1,a0
  if(pagetable == 0)
    80201b8a:	c121                	beqz	a0,80201bca <proc_pagetable+0x58>
  if(mappages(pagetable, TRAMPOLINE, PGSIZE,
    80201b8c:	4729                	li	a4,10
    80201b8e:	0000b697          	auipc	a3,0xb
    80201b92:	1326b683          	ld	a3,306(a3) # 8020ccc0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80201b96:	6605                	lui	a2,0x1
    80201b98:	040005b7          	lui	a1,0x4000
    80201b9c:	15fd                	addi	a1,a1,-1 # 3ffffff <_entry-0x7c200001>
    80201b9e:	05b2                	slli	a1,a1,0xc
    80201ba0:	fffff097          	auipc	ra,0xfffff
    80201ba4:	0c8080e7          	jalr	200(ra) # 80200c68 <mappages>
    80201ba8:	02054863          	bltz	a0,80201bd8 <proc_pagetable+0x66>
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
    80201bac:	4719                	li	a4,6
    80201bae:	06093683          	ld	a3,96(s2)
    80201bb2:	6605                	lui	a2,0x1
    80201bb4:	020005b7          	lui	a1,0x2000
    80201bb8:	15fd                	addi	a1,a1,-1 # 1ffffff <_entry-0x7e200001>
    80201bba:	05b6                	slli	a1,a1,0xd
    80201bbc:	8526                	mv	a0,s1
    80201bbe:	fffff097          	auipc	ra,0xfffff
    80201bc2:	0aa080e7          	jalr	170(ra) # 80200c68 <mappages>
    80201bc6:	02054163          	bltz	a0,80201be8 <proc_pagetable+0x76>
}
    80201bca:	8526                	mv	a0,s1
    80201bcc:	60e2                	ld	ra,24(sp)
    80201bce:	6442                	ld	s0,16(sp)
    80201bd0:	64a2                	ld	s1,8(sp)
    80201bd2:	6902                	ld	s2,0(sp)
    80201bd4:	6105                	addi	sp,sp,32
    80201bd6:	8082                	ret
    uvmfree(pagetable, 0);
    80201bd8:	4581                	li	a1,0
    80201bda:	8526                	mv	a0,s1
    80201bdc:	fffff097          	auipc	ra,0xfffff
    80201be0:	590080e7          	jalr	1424(ra) # 8020116c <uvmfree>
    return NULL;
    80201be4:	4481                	li	s1,0
    80201be6:	b7d5                	j	80201bca <proc_pagetable+0x58>
    vmunmap(pagetable, TRAMPOLINE, 1, 0);
    80201be8:	4681                	li	a3,0
    80201bea:	4605                	li	a2,1
    80201bec:	040005b7          	lui	a1,0x4000
    80201bf0:	15fd                	addi	a1,a1,-1 # 3ffffff <_entry-0x7c200001>
    80201bf2:	05b2                	slli	a1,a1,0xc
    80201bf4:	8526                	mv	a0,s1
    80201bf6:	fffff097          	auipc	ra,0xfffff
    80201bfa:	22c080e7          	jalr	556(ra) # 80200e22 <vmunmap>
    uvmfree(pagetable, 0);
    80201bfe:	4581                	li	a1,0
    80201c00:	8526                	mv	a0,s1
    80201c02:	fffff097          	auipc	ra,0xfffff
    80201c06:	56a080e7          	jalr	1386(ra) # 8020116c <uvmfree>
    return NULL;
    80201c0a:	4481                	li	s1,0
    80201c0c:	bf7d                	j	80201bca <proc_pagetable+0x58>

0000000080201c0e <proc_freepagetable>:
{
    80201c0e:	1101                	addi	sp,sp,-32
    80201c10:	ec06                	sd	ra,24(sp)
    80201c12:	e822                	sd	s0,16(sp)
    80201c14:	e426                	sd	s1,8(sp)
    80201c16:	e04a                	sd	s2,0(sp)
    80201c18:	1000                	addi	s0,sp,32
    80201c1a:	84aa                	mv	s1,a0
    80201c1c:	892e                	mv	s2,a1
  vmunmap(pagetable, TRAMPOLINE, 1, 0);
    80201c1e:	4681                	li	a3,0
    80201c20:	4605                	li	a2,1
    80201c22:	040005b7          	lui	a1,0x4000
    80201c26:	15fd                	addi	a1,a1,-1 # 3ffffff <_entry-0x7c200001>
    80201c28:	05b2                	slli	a1,a1,0xc
    80201c2a:	fffff097          	auipc	ra,0xfffff
    80201c2e:	1f8080e7          	jalr	504(ra) # 80200e22 <vmunmap>
  vmunmap(pagetable, TRAPFRAME, 1, 0);
    80201c32:	4681                	li	a3,0
    80201c34:	4605                	li	a2,1
    80201c36:	020005b7          	lui	a1,0x2000
    80201c3a:	15fd                	addi	a1,a1,-1 # 1ffffff <_entry-0x7e200001>
    80201c3c:	05b6                	slli	a1,a1,0xd
    80201c3e:	8526                	mv	a0,s1
    80201c40:	fffff097          	auipc	ra,0xfffff
    80201c44:	1e2080e7          	jalr	482(ra) # 80200e22 <vmunmap>
  uvmfree(pagetable, sz);
    80201c48:	85ca                	mv	a1,s2
    80201c4a:	8526                	mv	a0,s1
    80201c4c:	fffff097          	auipc	ra,0xfffff
    80201c50:	520080e7          	jalr	1312(ra) # 8020116c <uvmfree>
}
    80201c54:	60e2                	ld	ra,24(sp)
    80201c56:	6442                	ld	s0,16(sp)
    80201c58:	64a2                	ld	s1,8(sp)
    80201c5a:	6902                	ld	s2,0(sp)
    80201c5c:	6105                	addi	sp,sp,32
    80201c5e:	8082                	ret

0000000080201c60 <freeproc>:
{
    80201c60:	1101                	addi	sp,sp,-32
    80201c62:	ec06                	sd	ra,24(sp)
    80201c64:	e822                	sd	s0,16(sp)
    80201c66:	e426                	sd	s1,8(sp)
    80201c68:	1000                	addi	s0,sp,32
    80201c6a:	84aa                	mv	s1,a0
  if(p->trapframe)
    80201c6c:	7128                	ld	a0,96(a0)
    80201c6e:	c509                	beqz	a0,80201c78 <freeproc+0x18>
    kfree((void*)p->trapframe);
    80201c70:	ffffe097          	auipc	ra,0xffffe
    80201c74:	7d0080e7          	jalr	2000(ra) # 80200440 <kfree>
  p->trapframe = 0;
    80201c78:	0604b023          	sd	zero,96(s1)
  if (p->kpagetable) {
    80201c7c:	6ca8                	ld	a0,88(s1)
    80201c7e:	c511                	beqz	a0,80201c8a <freeproc+0x2a>
    kvmfree(p->kpagetable, 1);
    80201c80:	4585                	li	a1,1
    80201c82:	00000097          	auipc	ra,0x0
    80201c86:	a42080e7          	jalr	-1470(ra) # 802016c4 <kvmfree>
  p->kpagetable = 0;
    80201c8a:	0404bc23          	sd	zero,88(s1)
  if(p->pagetable)
    80201c8e:	68a8                	ld	a0,80(s1)
    80201c90:	c511                	beqz	a0,80201c9c <freeproc+0x3c>
    proc_freepagetable(p->pagetable, p->sz);
    80201c92:	64ac                	ld	a1,72(s1)
    80201c94:	00000097          	auipc	ra,0x0
    80201c98:	f7a080e7          	jalr	-134(ra) # 80201c0e <proc_freepagetable>
  p->pagetable = 0;
    80201c9c:	0404b823          	sd	zero,80(s1)
  p->sz = 0;
    80201ca0:	0404b423          	sd	zero,72(s1)
  p->pid = 0;
    80201ca4:	0204ac23          	sw	zero,56(s1)
  p->parent = 0;
    80201ca8:	0204b023          	sd	zero,32(s1)
  p->name[0] = 0;
    80201cac:	16048023          	sb	zero,352(s1)
  p->chan = 0;
    80201cb0:	0204b423          	sd	zero,40(s1)
  p->killed = 0;
    80201cb4:	0204a823          	sw	zero,48(s1)
  p->xstate = 0;
    80201cb8:	0204aa23          	sw	zero,52(s1)
  p->state = UNUSED;
    80201cbc:	0004ac23          	sw	zero,24(s1)
}
    80201cc0:	60e2                	ld	ra,24(sp)
    80201cc2:	6442                	ld	s0,16(sp)
    80201cc4:	64a2                	ld	s1,8(sp)
    80201cc6:	6105                	addi	sp,sp,32
    80201cc8:	8082                	ret

0000000080201cca <allocproc>:
{
    80201cca:	1101                	addi	sp,sp,-32
    80201ccc:	ec06                	sd	ra,24(sp)
    80201cce:	e822                	sd	s0,16(sp)
    80201cd0:	e426                	sd	s1,8(sp)
    80201cd2:	e04a                	sd	s2,0(sp)
    80201cd4:	1000                	addi	s0,sp,32
  for(p = proc; p < &proc[NPROC]; p++) {
    80201cd6:	00013497          	auipc	s1,0x13
    80201cda:	4aa48493          	addi	s1,s1,1194 # 80215180 <proc>
    80201cde:	00018917          	auipc	s2,0x18
    80201ce2:	e1290913          	addi	s2,s2,-494 # 80219af0 <bcache>
    acquire(&p->lock);
    80201ce6:	8526                	mv	a0,s1
    80201ce8:	fffff097          	auipc	ra,0xfffff
    80201cec:	9de080e7          	jalr	-1570(ra) # 802006c6 <acquire>
    if(p->state == UNUSED) {
    80201cf0:	4c9c                	lw	a5,24(s1)
    80201cf2:	cf81                	beqz	a5,80201d0a <allocproc+0x40>
      release(&p->lock);
    80201cf4:	8526                	mv	a0,s1
    80201cf6:	fffff097          	auipc	ra,0xfffff
    80201cfa:	a24080e7          	jalr	-1500(ra) # 8020071a <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    80201cfe:	17848493          	addi	s1,s1,376
    80201d02:	ff2492e3          	bne	s1,s2,80201ce6 <allocproc+0x1c>
  return NULL;
    80201d06:	4481                	li	s1,0
    80201d08:	a085                	j	80201d68 <allocproc+0x9e>
  p->pid = allocpid();
    80201d0a:	00000097          	auipc	ra,0x0
    80201d0e:	e22080e7          	jalr	-478(ra) # 80201b2c <allocpid>
    80201d12:	dc88                	sw	a0,56(s1)
  if((p->trapframe = (struct trapframe *)kalloc()) == NULL){
    80201d14:	fffff097          	auipc	ra,0xfffff
    80201d18:	846080e7          	jalr	-1978(ra) # 8020055a <kalloc>
    80201d1c:	892a                	mv	s2,a0
    80201d1e:	f0a8                	sd	a0,96(s1)
    80201d20:	c939                	beqz	a0,80201d76 <allocproc+0xac>
  if ((p->pagetable = proc_pagetable(p)) == NULL ||
    80201d22:	8526                	mv	a0,s1
    80201d24:	00000097          	auipc	ra,0x0
    80201d28:	e4e080e7          	jalr	-434(ra) # 80201b72 <proc_pagetable>
    80201d2c:	e8a8                	sd	a0,80(s1)
    80201d2e:	c939                	beqz	a0,80201d84 <allocproc+0xba>
      (p->kpagetable = proc_kpagetable()) == NULL) {
    80201d30:	00000097          	auipc	ra,0x0
    80201d34:	9ee080e7          	jalr	-1554(ra) # 8020171e <proc_kpagetable>
    80201d38:	eca8                	sd	a0,88(s1)
  if ((p->pagetable = proc_pagetable(p)) == NULL ||
    80201d3a:	c529                	beqz	a0,80201d84 <allocproc+0xba>
  p->kstack = VKSTACK;
    80201d3c:	0fb00793          	li	a5,251
    80201d40:	07fa                	slli	a5,a5,0x1e
    80201d42:	e0bc                	sd	a5,64(s1)
  memset(&p->context, 0, sizeof(p->context));
    80201d44:	07000613          	li	a2,112
    80201d48:	4581                	li	a1,0
    80201d4a:	06848513          	addi	a0,s1,104
    80201d4e:	fffff097          	auipc	ra,0xfffff
    80201d52:	a14080e7          	jalr	-1516(ra) # 80200762 <memset>
  p->context.ra = (uint64)forkret;
    80201d56:	00000797          	auipc	a5,0x0
    80201d5a:	d7078793          	addi	a5,a5,-656 # 80201ac6 <forkret>
    80201d5e:	f4bc                	sd	a5,104(s1)
  p->context.sp = p->kstack + PGSIZE;
    80201d60:	60bc                	ld	a5,64(s1)
    80201d62:	6705                	lui	a4,0x1
    80201d64:	97ba                	add	a5,a5,a4
    80201d66:	f8bc                	sd	a5,112(s1)
}
    80201d68:	8526                	mv	a0,s1
    80201d6a:	60e2                	ld	ra,24(sp)
    80201d6c:	6442                	ld	s0,16(sp)
    80201d6e:	64a2                	ld	s1,8(sp)
    80201d70:	6902                	ld	s2,0(sp)
    80201d72:	6105                	addi	sp,sp,32
    80201d74:	8082                	ret
    release(&p->lock);
    80201d76:	8526                	mv	a0,s1
    80201d78:	fffff097          	auipc	ra,0xfffff
    80201d7c:	9a2080e7          	jalr	-1630(ra) # 8020071a <release>
    return NULL;
    80201d80:	84ca                	mv	s1,s2
    80201d82:	b7dd                	j	80201d68 <allocproc+0x9e>
    freeproc(p);
    80201d84:	8526                	mv	a0,s1
    80201d86:	00000097          	auipc	ra,0x0
    80201d8a:	eda080e7          	jalr	-294(ra) # 80201c60 <freeproc>
    release(&p->lock);
    80201d8e:	8526                	mv	a0,s1
    80201d90:	fffff097          	auipc	ra,0xfffff
    80201d94:	98a080e7          	jalr	-1654(ra) # 8020071a <release>
    return NULL;
    80201d98:	4481                	li	s1,0
    80201d9a:	b7f9                	j	80201d68 <allocproc+0x9e>

0000000080201d9c <userinit>:
{
    80201d9c:	1101                	addi	sp,sp,-32
    80201d9e:	ec06                	sd	ra,24(sp)
    80201da0:	e822                	sd	s0,16(sp)
    80201da2:	e426                	sd	s1,8(sp)
    80201da4:	e04a                	sd	s2,0(sp)
    80201da6:	1000                	addi	s0,sp,32
  p = allocproc();
    80201da8:	00000097          	auipc	ra,0x0
    80201dac:	f22080e7          	jalr	-222(ra) # 80201cca <allocproc>
    80201db0:	84aa                	mv	s1,a0
  initproc = p;
    80201db2:	00013797          	auipc	a5,0x13
    80201db6:	3ca7b323          	sd	a0,966(a5) # 80215178 <initproc>
  uvminit(p->pagetable , p->kpagetable, initcode, sizeof(initcode));
    80201dba:	6905                	lui	s2,0x1
    80201dbc:	c2090693          	addi	a3,s2,-992 # c20 <_entry-0x801ff3e0>
    80201dc0:	00009617          	auipc	a2,0x9
    80201dc4:	24860613          	addi	a2,a2,584 # 8020b008 <initcode>
    80201dc8:	6d2c                	ld	a1,88(a0)
    80201dca:	6928                	ld	a0,80(a0)
    80201dcc:	fffff097          	auipc	ra,0xfffff
    80201dd0:	148080e7          	jalr	328(ra) # 80200f14 <uvminit>
  p->sz = PGSIZE;
    80201dd4:	0524b423          	sd	s2,72(s1)
  p->trapframe->epc = 0x0;      // user program counter
    80201dd8:	70bc                	ld	a5,96(s1)
    80201dda:	0007bc23          	sd	zero,24(a5)
  p->trapframe->sp = PGSIZE;  // user stack pointer
    80201dde:	70bc                	ld	a5,96(s1)
    80201de0:	0327b823          	sd	s2,48(a5)
  safestrcpy(p->name, "initcode", sizeof(p->name));
    80201de4:	4641                	li	a2,16
    80201de6:	00008597          	auipc	a1,0x8
    80201dea:	85258593          	addi	a1,a1,-1966 # 80209638 <digits+0x2b8>
    80201dee:	16048513          	addi	a0,s1,352
    80201df2:	fffff097          	auipc	ra,0xfffff
    80201df6:	ac2080e7          	jalr	-1342(ra) # 802008b4 <safestrcpy>
  p->state = RUNNABLE;
    80201dfa:	4789                	li	a5,2
    80201dfc:	cc9c                	sw	a5,24(s1)
  p->tmask = 0;
    80201dfe:	1604a823          	sw	zero,368(s1)
  release(&p->lock);
    80201e02:	8526                	mv	a0,s1
    80201e04:	fffff097          	auipc	ra,0xfffff
    80201e08:	916080e7          	jalr	-1770(ra) # 8020071a <release>
}
    80201e0c:	60e2                	ld	ra,24(sp)
    80201e0e:	6442                	ld	s0,16(sp)
    80201e10:	64a2                	ld	s1,8(sp)
    80201e12:	6902                	ld	s2,0(sp)
    80201e14:	6105                	addi	sp,sp,32
    80201e16:	8082                	ret

0000000080201e18 <growproc>:
{
    80201e18:	1101                	addi	sp,sp,-32
    80201e1a:	ec06                	sd	ra,24(sp)
    80201e1c:	e822                	sd	s0,16(sp)
    80201e1e:	e426                	sd	s1,8(sp)
    80201e20:	e04a                	sd	s2,0(sp)
    80201e22:	1000                	addi	s0,sp,32
    80201e24:	84aa                	mv	s1,a0
  struct proc *p = myproc();
    80201e26:	00000097          	auipc	ra,0x0
    80201e2a:	c68080e7          	jalr	-920(ra) # 80201a8e <myproc>
    80201e2e:	892a                	mv	s2,a0
  sz = p->sz;
    80201e30:	6530                	ld	a2,72(a0)
    80201e32:	0006079b          	sext.w	a5,a2
  if(n > 0){
    80201e36:	00904f63          	bgtz	s1,80201e54 <growproc+0x3c>
  } else if(n < 0){
    80201e3a:	0204ce63          	bltz	s1,80201e76 <growproc+0x5e>
  p->sz = sz;
    80201e3e:	1782                	slli	a5,a5,0x20
    80201e40:	9381                	srli	a5,a5,0x20
    80201e42:	04f93423          	sd	a5,72(s2)
  return 0;
    80201e46:	4501                	li	a0,0
}
    80201e48:	60e2                	ld	ra,24(sp)
    80201e4a:	6442                	ld	s0,16(sp)
    80201e4c:	64a2                	ld	s1,8(sp)
    80201e4e:	6902                	ld	s2,0(sp)
    80201e50:	6105                	addi	sp,sp,32
    80201e52:	8082                	ret
    if((sz = uvmalloc(p->pagetable, p->kpagetable, sz, sz + n)) == 0) {
    80201e54:	00f486bb          	addw	a3,s1,a5
    80201e58:	1682                	slli	a3,a3,0x20
    80201e5a:	9281                	srli	a3,a3,0x20
    80201e5c:	1602                	slli	a2,a2,0x20
    80201e5e:	9201                	srli	a2,a2,0x20
    80201e60:	6d2c                	ld	a1,88(a0)
    80201e62:	6928                	ld	a0,80(a0)
    80201e64:	fffff097          	auipc	ra,0xfffff
    80201e68:	1a6080e7          	jalr	422(ra) # 8020100a <uvmalloc>
    80201e6c:	0005079b          	sext.w	a5,a0
    80201e70:	f7f9                	bnez	a5,80201e3e <growproc+0x26>
      return -1;
    80201e72:	557d                	li	a0,-1
    80201e74:	bfd1                	j	80201e48 <growproc+0x30>
    sz = uvmdealloc(p->pagetable, p->kpagetable, sz, sz + n);
    80201e76:	00f486bb          	addw	a3,s1,a5
    80201e7a:	1682                	slli	a3,a3,0x20
    80201e7c:	9281                	srli	a3,a3,0x20
    80201e7e:	1602                	slli	a2,a2,0x20
    80201e80:	9201                	srli	a2,a2,0x20
    80201e82:	6d2c                	ld	a1,88(a0)
    80201e84:	6928                	ld	a0,80(a0)
    80201e86:	fffff097          	auipc	ra,0xfffff
    80201e8a:	118080e7          	jalr	280(ra) # 80200f9e <uvmdealloc>
    80201e8e:	0005079b          	sext.w	a5,a0
    80201e92:	b775                	j	80201e3e <growproc+0x26>

0000000080201e94 <fork>:
{
    80201e94:	7139                	addi	sp,sp,-64
    80201e96:	fc06                	sd	ra,56(sp)
    80201e98:	f822                	sd	s0,48(sp)
    80201e9a:	f426                	sd	s1,40(sp)
    80201e9c:	f04a                	sd	s2,32(sp)
    80201e9e:	ec4e                	sd	s3,24(sp)
    80201ea0:	e852                	sd	s4,16(sp)
    80201ea2:	e456                	sd	s5,8(sp)
    80201ea4:	0080                	addi	s0,sp,64
  struct proc *p = myproc();
    80201ea6:	00000097          	auipc	ra,0x0
    80201eaa:	be8080e7          	jalr	-1048(ra) # 80201a8e <myproc>
    80201eae:	8aaa                	mv	s5,a0
  if((np = allocproc()) == NULL){
    80201eb0:	00000097          	auipc	ra,0x0
    80201eb4:	e1a080e7          	jalr	-486(ra) # 80201cca <allocproc>
    80201eb8:	c965                	beqz	a0,80201fa8 <fork+0x114>
    80201eba:	8a2a                	mv	s4,a0
  if(uvmcopy(p->pagetable, np->pagetable, np->kpagetable, p->sz) < 0){
    80201ebc:	048ab683          	ld	a3,72(s5)
    80201ec0:	6d30                	ld	a2,88(a0)
    80201ec2:	692c                	ld	a1,80(a0)
    80201ec4:	050ab503          	ld	a0,80(s5)
    80201ec8:	fffff097          	auipc	ra,0xfffff
    80201ecc:	2de080e7          	jalr	734(ra) # 802011a6 <uvmcopy>
    80201ed0:	04054e63          	bltz	a0,80201f2c <fork+0x98>
  np->sz = p->sz;
    80201ed4:	048ab783          	ld	a5,72(s5)
    80201ed8:	04fa3423          	sd	a5,72(s4)
  np->parent = p;
    80201edc:	035a3023          	sd	s5,32(s4)
  np->tmask = p->tmask;
    80201ee0:	170aa783          	lw	a5,368(s5)
    80201ee4:	16fa2823          	sw	a5,368(s4)
  *(np->trapframe) = *(p->trapframe);
    80201ee8:	060ab683          	ld	a3,96(s5)
    80201eec:	87b6                	mv	a5,a3
    80201eee:	060a3703          	ld	a4,96(s4)
    80201ef2:	12068693          	addi	a3,a3,288
    80201ef6:	0007b803          	ld	a6,0(a5)
    80201efa:	6788                	ld	a0,8(a5)
    80201efc:	6b8c                	ld	a1,16(a5)
    80201efe:	6f90                	ld	a2,24(a5)
    80201f00:	01073023          	sd	a6,0(a4) # 1000 <_entry-0x801ff000>
    80201f04:	e708                	sd	a0,8(a4)
    80201f06:	eb0c                	sd	a1,16(a4)
    80201f08:	ef10                	sd	a2,24(a4)
    80201f0a:	02078793          	addi	a5,a5,32
    80201f0e:	02070713          	addi	a4,a4,32
    80201f12:	fed792e3          	bne	a5,a3,80201ef6 <fork+0x62>
  np->trapframe->a0 = 0;
    80201f16:	060a3783          	ld	a5,96(s4)
    80201f1a:	0607b823          	sd	zero,112(a5)
  for(i = 0; i < NOFILE; i++)
    80201f1e:	0d8a8493          	addi	s1,s5,216
    80201f22:	0d8a0913          	addi	s2,s4,216
    80201f26:	158a8993          	addi	s3,s5,344
    80201f2a:	a00d                	j	80201f4c <fork+0xb8>
    freeproc(np);
    80201f2c:	8552                	mv	a0,s4
    80201f2e:	00000097          	auipc	ra,0x0
    80201f32:	d32080e7          	jalr	-718(ra) # 80201c60 <freeproc>
    release(&np->lock);
    80201f36:	8552                	mv	a0,s4
    80201f38:	ffffe097          	auipc	ra,0xffffe
    80201f3c:	7e2080e7          	jalr	2018(ra) # 8020071a <release>
    return -1;
    80201f40:	54fd                	li	s1,-1
    80201f42:	a889                	j	80201f94 <fork+0x100>
  for(i = 0; i < NOFILE; i++)
    80201f44:	04a1                	addi	s1,s1,8
    80201f46:	0921                	addi	s2,s2,8
    80201f48:	01348b63          	beq	s1,s3,80201f5e <fork+0xca>
    if(p->ofile[i])
    80201f4c:	6088                	ld	a0,0(s1)
    80201f4e:	d97d                	beqz	a0,80201f44 <fork+0xb0>
      np->ofile[i] = filedup(p->ofile[i]);
    80201f50:	00002097          	auipc	ra,0x2
    80201f54:	e5a080e7          	jalr	-422(ra) # 80203daa <filedup>
    80201f58:	00a93023          	sd	a0,0(s2)
    80201f5c:	b7e5                	j	80201f44 <fork+0xb0>
  np->cwd = edup(p->cwd);
    80201f5e:	158ab503          	ld	a0,344(s5)
    80201f62:	00005097          	auipc	ra,0x5
    80201f66:	b5c080e7          	jalr	-1188(ra) # 80206abe <edup>
    80201f6a:	14aa3c23          	sd	a0,344(s4)
  safestrcpy(np->name, p->name, sizeof(p->name));
    80201f6e:	4641                	li	a2,16
    80201f70:	160a8593          	addi	a1,s5,352
    80201f74:	160a0513          	addi	a0,s4,352
    80201f78:	fffff097          	auipc	ra,0xfffff
    80201f7c:	93c080e7          	jalr	-1732(ra) # 802008b4 <safestrcpy>
  pid = np->pid;
    80201f80:	038a2483          	lw	s1,56(s4)
  np->state = RUNNABLE;
    80201f84:	4789                	li	a5,2
    80201f86:	00fa2c23          	sw	a5,24(s4)
  release(&np->lock);
    80201f8a:	8552                	mv	a0,s4
    80201f8c:	ffffe097          	auipc	ra,0xffffe
    80201f90:	78e080e7          	jalr	1934(ra) # 8020071a <release>
}
    80201f94:	8526                	mv	a0,s1
    80201f96:	70e2                	ld	ra,56(sp)
    80201f98:	7442                	ld	s0,48(sp)
    80201f9a:	74a2                	ld	s1,40(sp)
    80201f9c:	7902                	ld	s2,32(sp)
    80201f9e:	69e2                	ld	s3,24(sp)
    80201fa0:	6a42                	ld	s4,16(sp)
    80201fa2:	6aa2                	ld	s5,8(sp)
    80201fa4:	6121                	addi	sp,sp,64
    80201fa6:	8082                	ret
    return -1;
    80201fa8:	54fd                	li	s1,-1
    80201faa:	b7ed                	j	80201f94 <fork+0x100>

0000000080201fac <reparent>:
{
    80201fac:	7179                	addi	sp,sp,-48
    80201fae:	f406                	sd	ra,40(sp)
    80201fb0:	f022                	sd	s0,32(sp)
    80201fb2:	ec26                	sd	s1,24(sp)
    80201fb4:	e84a                	sd	s2,16(sp)
    80201fb6:	e44e                	sd	s3,8(sp)
    80201fb8:	e052                	sd	s4,0(sp)
    80201fba:	1800                	addi	s0,sp,48
    80201fbc:	892a                	mv	s2,a0
  for(pp = proc; pp < &proc[NPROC]; pp++){
    80201fbe:	00013497          	auipc	s1,0x13
    80201fc2:	1c248493          	addi	s1,s1,450 # 80215180 <proc>
      pp->parent = initproc;
    80201fc6:	00013a17          	auipc	s4,0x13
    80201fca:	09aa0a13          	addi	s4,s4,154 # 80215060 <pid_lock>
  for(pp = proc; pp < &proc[NPROC]; pp++){
    80201fce:	00018997          	auipc	s3,0x18
    80201fd2:	b2298993          	addi	s3,s3,-1246 # 80219af0 <bcache>
    80201fd6:	a029                	j	80201fe0 <reparent+0x34>
    80201fd8:	17848493          	addi	s1,s1,376
    80201fdc:	03348363          	beq	s1,s3,80202002 <reparent+0x56>
    if(pp->parent == p){
    80201fe0:	709c                	ld	a5,32(s1)
    80201fe2:	ff279be3          	bne	a5,s2,80201fd8 <reparent+0x2c>
      acquire(&pp->lock);
    80201fe6:	8526                	mv	a0,s1
    80201fe8:	ffffe097          	auipc	ra,0xffffe
    80201fec:	6de080e7          	jalr	1758(ra) # 802006c6 <acquire>
      pp->parent = initproc;
    80201ff0:	118a3783          	ld	a5,280(s4)
    80201ff4:	f09c                	sd	a5,32(s1)
      release(&pp->lock);
    80201ff6:	8526                	mv	a0,s1
    80201ff8:	ffffe097          	auipc	ra,0xffffe
    80201ffc:	722080e7          	jalr	1826(ra) # 8020071a <release>
    80202000:	bfe1                	j	80201fd8 <reparent+0x2c>
}
    80202002:	70a2                	ld	ra,40(sp)
    80202004:	7402                	ld	s0,32(sp)
    80202006:	64e2                	ld	s1,24(sp)
    80202008:	6942                	ld	s2,16(sp)
    8020200a:	69a2                	ld	s3,8(sp)
    8020200c:	6a02                	ld	s4,0(sp)
    8020200e:	6145                	addi	sp,sp,48
    80202010:	8082                	ret

0000000080202012 <scheduler>:
{
    80202012:	715d                	addi	sp,sp,-80
    80202014:	e486                	sd	ra,72(sp)
    80202016:	e0a2                	sd	s0,64(sp)
    80202018:	fc26                	sd	s1,56(sp)
    8020201a:	f84a                	sd	s2,48(sp)
    8020201c:	f44e                	sd	s3,40(sp)
    8020201e:	f052                	sd	s4,32(sp)
    80202020:	ec56                	sd	s5,24(sp)
    80202022:	e85a                	sd	s6,16(sp)
    80202024:	e45e                	sd	s7,8(sp)
    80202026:	e062                	sd	s8,0(sp)
    80202028:	0880                	addi	s0,sp,80
    8020202a:	8792                	mv	a5,tp
  int id = r_tp();
    8020202c:	2781                	sext.w	a5,a5
  c->proc = 0;
    8020202e:	00779b13          	slli	s6,a5,0x7
    80202032:	00013717          	auipc	a4,0x13
    80202036:	02e70713          	addi	a4,a4,46 # 80215060 <pid_lock>
    8020203a:	975a                	add	a4,a4,s6
    8020203c:	00073c23          	sd	zero,24(a4)
        swtch(&c->context, &p->context);
    80202040:	00013717          	auipc	a4,0x13
    80202044:	04070713          	addi	a4,a4,64 # 80215080 <cpus+0x8>
    80202048:	9b3a                	add	s6,s6,a4
        c->proc = p;
    8020204a:	079e                	slli	a5,a5,0x7
    8020204c:	00013a97          	auipc	s5,0x13
    80202050:	014a8a93          	addi	s5,s5,20 # 80215060 <pid_lock>
    80202054:	9abe                	add	s5,s5,a5
        w_satp(MAKE_SATP(p->kpagetable));
    80202056:	5a7d                	li	s4,-1
    80202058:	1a7e                	slli	s4,s4,0x3f
        w_satp(MAKE_SATP(kernel_pagetable));
    8020205a:	0000bb97          	auipc	s7,0xb
    8020205e:	ca6bbb83          	ld	s7,-858(s7) # 8020cd00 <_GLOBAL_OFFSET_TABLE_+0x48>
    80202062:	a8a5                	j	802020da <scheduler+0xc8>
      release(&p->lock);
    80202064:	8526                	mv	a0,s1
    80202066:	ffffe097          	auipc	ra,0xffffe
    8020206a:	6b4080e7          	jalr	1716(ra) # 8020071a <release>
    for(p = proc; p < &proc[NPROC]; p++) {
    8020206e:	17848493          	addi	s1,s1,376
    80202072:	05248a63          	beq	s1,s2,802020c6 <scheduler+0xb4>
      acquire(&p->lock);
    80202076:	8526                	mv	a0,s1
    80202078:	ffffe097          	auipc	ra,0xffffe
    8020207c:	64e080e7          	jalr	1614(ra) # 802006c6 <acquire>
      if(p->state == RUNNABLE) {
    80202080:	4c9c                	lw	a5,24(s1)
    80202082:	ff3791e3          	bne	a5,s3,80202064 <scheduler+0x52>
        p->state = RUNNING;
    80202086:	478d                	li	a5,3
    80202088:	cc9c                	sw	a5,24(s1)
        c->proc = p;
    8020208a:	009abc23          	sd	s1,24(s5)
        w_satp(MAKE_SATP(p->kpagetable));
    8020208e:	6cbc                	ld	a5,88(s1)
    80202090:	83b1                	srli	a5,a5,0xc
    80202092:	0147e7b3          	or	a5,a5,s4
  asm volatile("csrw satp, %0" : : "r" (x));
    80202096:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    8020209a:	12000073          	sfence.vma
        swtch(&c->context, &p->context);
    8020209e:	06848593          	addi	a1,s1,104
    802020a2:	855a                	mv	a0,s6
    802020a4:	00001097          	auipc	ra,0x1
    802020a8:	8b2080e7          	jalr	-1870(ra) # 80202956 <swtch>
        w_satp(MAKE_SATP(kernel_pagetable));
    802020ac:	000bb783          	ld	a5,0(s7)
    802020b0:	83b1                	srli	a5,a5,0xc
    802020b2:	0147e7b3          	or	a5,a5,s4
  asm volatile("csrw satp, %0" : : "r" (x));
    802020b6:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    802020ba:	12000073          	sfence.vma
        c->proc = 0;
    802020be:	000abc23          	sd	zero,24(s5)
        found = 1;
    802020c2:	4c05                	li	s8,1
    802020c4:	b745                	j	80202064 <scheduler+0x52>
    if(found == 0) {
    802020c6:	000c1a63          	bnez	s8,802020da <scheduler+0xc8>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802020ca:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    802020ce:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    802020d2:	10079073          	csrw	sstatus,a5
      asm volatile("wfi");
    802020d6:	10500073          	wfi
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802020da:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    802020de:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    802020e2:	10079073          	csrw	sstatus,a5
    int found = 0;
    802020e6:	4c01                	li	s8,0
    for(p = proc; p < &proc[NPROC]; p++) {
    802020e8:	00013497          	auipc	s1,0x13
    802020ec:	09848493          	addi	s1,s1,152 # 80215180 <proc>
      if(p->state == RUNNABLE) {
    802020f0:	4989                	li	s3,2
    for(p = proc; p < &proc[NPROC]; p++) {
    802020f2:	00018917          	auipc	s2,0x18
    802020f6:	9fe90913          	addi	s2,s2,-1538 # 80219af0 <bcache>
    802020fa:	bfb5                	j	80202076 <scheduler+0x64>

00000000802020fc <sched>:
{
    802020fc:	7179                	addi	sp,sp,-48
    802020fe:	f406                	sd	ra,40(sp)
    80202100:	f022                	sd	s0,32(sp)
    80202102:	ec26                	sd	s1,24(sp)
    80202104:	e84a                	sd	s2,16(sp)
    80202106:	e44e                	sd	s3,8(sp)
    80202108:	1800                	addi	s0,sp,48
  struct proc *p = myproc();
    8020210a:	00000097          	auipc	ra,0x0
    8020210e:	984080e7          	jalr	-1660(ra) # 80201a8e <myproc>
    80202112:	84aa                	mv	s1,a0
  if(!holding(&p->lock))
    80202114:	ffffe097          	auipc	ra,0xffffe
    80202118:	584080e7          	jalr	1412(ra) # 80200698 <holding>
    8020211c:	c93d                	beqz	a0,80202192 <sched+0x96>
  asm volatile("mv %0, tp" : "=r" (x) );
    8020211e:	8792                	mv	a5,tp
  if(mycpu()->noff != 1)
    80202120:	2781                	sext.w	a5,a5
    80202122:	079e                	slli	a5,a5,0x7
    80202124:	00013717          	auipc	a4,0x13
    80202128:	f3c70713          	addi	a4,a4,-196 # 80215060 <pid_lock>
    8020212c:	97ba                	add	a5,a5,a4
    8020212e:	0907a703          	lw	a4,144(a5)
    80202132:	4785                	li	a5,1
    80202134:	06f71763          	bne	a4,a5,802021a2 <sched+0xa6>
  if(p->state == RUNNING)
    80202138:	4c98                	lw	a4,24(s1)
    8020213a:	478d                	li	a5,3
    8020213c:	06f70b63          	beq	a4,a5,802021b2 <sched+0xb6>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202140:	100027f3          	csrr	a5,sstatus
  return (x & SSTATUS_SIE) != 0;
    80202144:	8b89                	andi	a5,a5,2
  if(intr_get())
    80202146:	efb5                	bnez	a5,802021c2 <sched+0xc6>
  asm volatile("mv %0, tp" : "=r" (x) );
    80202148:	8792                	mv	a5,tp
  intena = mycpu()->intena;
    8020214a:	00013917          	auipc	s2,0x13
    8020214e:	f1690913          	addi	s2,s2,-234 # 80215060 <pid_lock>
    80202152:	2781                	sext.w	a5,a5
    80202154:	079e                	slli	a5,a5,0x7
    80202156:	97ca                	add	a5,a5,s2
    80202158:	0947a983          	lw	s3,148(a5)
    8020215c:	8792                	mv	a5,tp
  swtch(&p->context, &mycpu()->context);
    8020215e:	2781                	sext.w	a5,a5
    80202160:	079e                	slli	a5,a5,0x7
    80202162:	00013597          	auipc	a1,0x13
    80202166:	f1e58593          	addi	a1,a1,-226 # 80215080 <cpus+0x8>
    8020216a:	95be                	add	a1,a1,a5
    8020216c:	06848513          	addi	a0,s1,104
    80202170:	00000097          	auipc	ra,0x0
    80202174:	7e6080e7          	jalr	2022(ra) # 80202956 <swtch>
    80202178:	8792                	mv	a5,tp
  mycpu()->intena = intena;
    8020217a:	2781                	sext.w	a5,a5
    8020217c:	079e                	slli	a5,a5,0x7
    8020217e:	993e                	add	s2,s2,a5
    80202180:	09392a23          	sw	s3,148(s2)
}
    80202184:	70a2                	ld	ra,40(sp)
    80202186:	7402                	ld	s0,32(sp)
    80202188:	64e2                	ld	s1,24(sp)
    8020218a:	6942                	ld	s2,16(sp)
    8020218c:	69a2                	ld	s3,8(sp)
    8020218e:	6145                	addi	sp,sp,48
    80202190:	8082                	ret
    panic("sched p->lock");
    80202192:	00007517          	auipc	a0,0x7
    80202196:	4b650513          	addi	a0,a0,1206 # 80209648 <digits+0x2c8>
    8020219a:	ffffe097          	auipc	ra,0xffffe
    8020219e:	faa080e7          	jalr	-86(ra) # 80200144 <panic>
    panic("sched locks");
    802021a2:	00007517          	auipc	a0,0x7
    802021a6:	4b650513          	addi	a0,a0,1206 # 80209658 <digits+0x2d8>
    802021aa:	ffffe097          	auipc	ra,0xffffe
    802021ae:	f9a080e7          	jalr	-102(ra) # 80200144 <panic>
    panic("sched running");
    802021b2:	00007517          	auipc	a0,0x7
    802021b6:	4b650513          	addi	a0,a0,1206 # 80209668 <digits+0x2e8>
    802021ba:	ffffe097          	auipc	ra,0xffffe
    802021be:	f8a080e7          	jalr	-118(ra) # 80200144 <panic>
    panic("sched interruptible");
    802021c2:	00007517          	auipc	a0,0x7
    802021c6:	4b650513          	addi	a0,a0,1206 # 80209678 <digits+0x2f8>
    802021ca:	ffffe097          	auipc	ra,0xffffe
    802021ce:	f7a080e7          	jalr	-134(ra) # 80200144 <panic>

00000000802021d2 <exit>:
{
    802021d2:	7179                	addi	sp,sp,-48
    802021d4:	f406                	sd	ra,40(sp)
    802021d6:	f022                	sd	s0,32(sp)
    802021d8:	ec26                	sd	s1,24(sp)
    802021da:	e84a                	sd	s2,16(sp)
    802021dc:	e44e                	sd	s3,8(sp)
    802021de:	e052                	sd	s4,0(sp)
    802021e0:	1800                	addi	s0,sp,48
    802021e2:	8a2a                	mv	s4,a0
  struct proc *p = myproc();
    802021e4:	00000097          	auipc	ra,0x0
    802021e8:	8aa080e7          	jalr	-1878(ra) # 80201a8e <myproc>
    802021ec:	89aa                	mv	s3,a0
  if (status == -1 && p == initproc){
    802021ee:	57fd                	li	a5,-1
    802021f0:	00fa0d63          	beq	s4,a5,8020220a <exit+0x38>
  if(p == initproc)
    802021f4:	00013797          	auipc	a5,0x13
    802021f8:	f847b783          	ld	a5,-124(a5) # 80215178 <initproc>
    802021fc:	03378563          	beq	a5,s3,80202226 <exit+0x54>
  for(int fd = 0; fd < NOFILE; fd++){
    80202200:	0d898493          	addi	s1,s3,216
    80202204:	15898913          	addi	s2,s3,344
    80202208:	a081                	j	80202248 <exit+0x76>
  if (status == -1 && p == initproc){
    8020220a:	00013797          	auipc	a5,0x13
    8020220e:	f6e7b783          	ld	a5,-146(a5) # 80215178 <initproc>
    80202212:	fea797e3          	bne	a5,a0,80202200 <exit+0x2e>
	SBI_CALL_0(SBI_SHUTDOWN);
    80202216:	4501                	li	a0,0
    80202218:	4581                	li	a1,0
    8020221a:	4601                	li	a2,0
    8020221c:	4681                	li	a3,0
    8020221e:	48a1                	li	a7,8
    80202220:	00000073          	ecall
}
    80202224:	bfc1                	j	802021f4 <exit+0x22>
    panic("initexiting");
    80202226:	00007517          	auipc	a0,0x7
    8020222a:	46a50513          	addi	a0,a0,1130 # 80209690 <digits+0x310>
    8020222e:	ffffe097          	auipc	ra,0xffffe
    80202232:	f16080e7          	jalr	-234(ra) # 80200144 <panic>
      fileclose(f);
    80202236:	00002097          	auipc	ra,0x2
    8020223a:	bc6080e7          	jalr	-1082(ra) # 80203dfc <fileclose>
      p->ofile[fd] = 0;
    8020223e:	0004b023          	sd	zero,0(s1)
  for(int fd = 0; fd < NOFILE; fd++){
    80202242:	04a1                	addi	s1,s1,8
    80202244:	01248563          	beq	s1,s2,8020224e <exit+0x7c>
    if(p->ofile[fd]){
    80202248:	6088                	ld	a0,0(s1)
    8020224a:	f575                	bnez	a0,80202236 <exit+0x64>
    8020224c:	bfdd                	j	80202242 <exit+0x70>
  eput(p->cwd);
    8020224e:	1589b503          	ld	a0,344(s3)
    80202252:	00005097          	auipc	ra,0x5
    80202256:	b4e080e7          	jalr	-1202(ra) # 80206da0 <eput>
  p->cwd = 0;
    8020225a:	1409bc23          	sd	zero,344(s3)
  acquire(&initproc->lock);
    8020225e:	00013497          	auipc	s1,0x13
    80202262:	e0248493          	addi	s1,s1,-510 # 80215060 <pid_lock>
    80202266:	1184b503          	ld	a0,280(s1)
    8020226a:	ffffe097          	auipc	ra,0xffffe
    8020226e:	45c080e7          	jalr	1116(ra) # 802006c6 <acquire>
  wakeup1(initproc);
    80202272:	1184b503          	ld	a0,280(s1)
    80202276:	fffff097          	auipc	ra,0xfffff
    8020227a:	62c080e7          	jalr	1580(ra) # 802018a2 <wakeup1>
  release(&initproc->lock);
    8020227e:	1184b503          	ld	a0,280(s1)
    80202282:	ffffe097          	auipc	ra,0xffffe
    80202286:	498080e7          	jalr	1176(ra) # 8020071a <release>
  acquire(&p->lock);
    8020228a:	854e                	mv	a0,s3
    8020228c:	ffffe097          	auipc	ra,0xffffe
    80202290:	43a080e7          	jalr	1082(ra) # 802006c6 <acquire>
  struct proc *original_parent = p->parent;
    80202294:	0209b483          	ld	s1,32(s3)
  release(&p->lock);
    80202298:	854e                	mv	a0,s3
    8020229a:	ffffe097          	auipc	ra,0xffffe
    8020229e:	480080e7          	jalr	1152(ra) # 8020071a <release>
  acquire(&original_parent->lock);
    802022a2:	8526                	mv	a0,s1
    802022a4:	ffffe097          	auipc	ra,0xffffe
    802022a8:	422080e7          	jalr	1058(ra) # 802006c6 <acquire>
  acquire(&p->lock);
    802022ac:	854e                	mv	a0,s3
    802022ae:	ffffe097          	auipc	ra,0xffffe
    802022b2:	418080e7          	jalr	1048(ra) # 802006c6 <acquire>
  reparent(p);
    802022b6:	854e                	mv	a0,s3
    802022b8:	00000097          	auipc	ra,0x0
    802022bc:	cf4080e7          	jalr	-780(ra) # 80201fac <reparent>
  wakeup1(original_parent);
    802022c0:	8526                	mv	a0,s1
    802022c2:	fffff097          	auipc	ra,0xfffff
    802022c6:	5e0080e7          	jalr	1504(ra) # 802018a2 <wakeup1>
  p->xstate = status;
    802022ca:	0349aa23          	sw	s4,52(s3)
  p->state = ZOMBIE;
    802022ce:	4791                	li	a5,4
    802022d0:	00f9ac23          	sw	a5,24(s3)
  release(&original_parent->lock);
    802022d4:	8526                	mv	a0,s1
    802022d6:	ffffe097          	auipc	ra,0xffffe
    802022da:	444080e7          	jalr	1092(ra) # 8020071a <release>
  sched();
    802022de:	00000097          	auipc	ra,0x0
    802022e2:	e1e080e7          	jalr	-482(ra) # 802020fc <sched>
  panic("zombie exit");
    802022e6:	00007517          	auipc	a0,0x7
    802022ea:	3ba50513          	addi	a0,a0,954 # 802096a0 <digits+0x320>
    802022ee:	ffffe097          	auipc	ra,0xffffe
    802022f2:	e56080e7          	jalr	-426(ra) # 80200144 <panic>

00000000802022f6 <yield>:
{
    802022f6:	1101                	addi	sp,sp,-32
    802022f8:	ec06                	sd	ra,24(sp)
    802022fa:	e822                	sd	s0,16(sp)
    802022fc:	e426                	sd	s1,8(sp)
    802022fe:	1000                	addi	s0,sp,32
  struct proc *p = myproc();
    80202300:	fffff097          	auipc	ra,0xfffff
    80202304:	78e080e7          	jalr	1934(ra) # 80201a8e <myproc>
    80202308:	84aa                	mv	s1,a0
  acquire(&p->lock);
    8020230a:	ffffe097          	auipc	ra,0xffffe
    8020230e:	3bc080e7          	jalr	956(ra) # 802006c6 <acquire>
  p->state = RUNNABLE;
    80202312:	4789                	li	a5,2
    80202314:	cc9c                	sw	a5,24(s1)
  sched();
    80202316:	00000097          	auipc	ra,0x0
    8020231a:	de6080e7          	jalr	-538(ra) # 802020fc <sched>
  release(&p->lock);
    8020231e:	8526                	mv	a0,s1
    80202320:	ffffe097          	auipc	ra,0xffffe
    80202324:	3fa080e7          	jalr	1018(ra) # 8020071a <release>
}
    80202328:	60e2                	ld	ra,24(sp)
    8020232a:	6442                	ld	s0,16(sp)
    8020232c:	64a2                	ld	s1,8(sp)
    8020232e:	6105                	addi	sp,sp,32
    80202330:	8082                	ret

0000000080202332 <sleep>:
{
    80202332:	7179                	addi	sp,sp,-48
    80202334:	f406                	sd	ra,40(sp)
    80202336:	f022                	sd	s0,32(sp)
    80202338:	ec26                	sd	s1,24(sp)
    8020233a:	e84a                	sd	s2,16(sp)
    8020233c:	e44e                	sd	s3,8(sp)
    8020233e:	1800                	addi	s0,sp,48
    80202340:	89aa                	mv	s3,a0
    80202342:	892e                	mv	s2,a1
  struct proc *p = myproc();
    80202344:	fffff097          	auipc	ra,0xfffff
    80202348:	74a080e7          	jalr	1866(ra) # 80201a8e <myproc>
    8020234c:	84aa                	mv	s1,a0
  if(lk != &p->lock){  //DOC: sleeplock0
    8020234e:	05250663          	beq	a0,s2,8020239a <sleep+0x68>
    acquire(&p->lock);  //DOC: sleeplock1
    80202352:	ffffe097          	auipc	ra,0xffffe
    80202356:	374080e7          	jalr	884(ra) # 802006c6 <acquire>
    release(lk);
    8020235a:	854a                	mv	a0,s2
    8020235c:	ffffe097          	auipc	ra,0xffffe
    80202360:	3be080e7          	jalr	958(ra) # 8020071a <release>
  p->chan = chan;
    80202364:	0334b423          	sd	s3,40(s1)
  p->state = SLEEPING;
    80202368:	4785                	li	a5,1
    8020236a:	cc9c                	sw	a5,24(s1)
  sched();
    8020236c:	00000097          	auipc	ra,0x0
    80202370:	d90080e7          	jalr	-624(ra) # 802020fc <sched>
  p->chan = 0;
    80202374:	0204b423          	sd	zero,40(s1)
    release(&p->lock);
    80202378:	8526                	mv	a0,s1
    8020237a:	ffffe097          	auipc	ra,0xffffe
    8020237e:	3a0080e7          	jalr	928(ra) # 8020071a <release>
    acquire(lk);
    80202382:	854a                	mv	a0,s2
    80202384:	ffffe097          	auipc	ra,0xffffe
    80202388:	342080e7          	jalr	834(ra) # 802006c6 <acquire>
}
    8020238c:	70a2                	ld	ra,40(sp)
    8020238e:	7402                	ld	s0,32(sp)
    80202390:	64e2                	ld	s1,24(sp)
    80202392:	6942                	ld	s2,16(sp)
    80202394:	69a2                	ld	s3,8(sp)
    80202396:	6145                	addi	sp,sp,48
    80202398:	8082                	ret
  p->chan = chan;
    8020239a:	03353423          	sd	s3,40(a0)
  p->state = SLEEPING;
    8020239e:	4785                	li	a5,1
    802023a0:	cd1c                	sw	a5,24(a0)
  sched();
    802023a2:	00000097          	auipc	ra,0x0
    802023a6:	d5a080e7          	jalr	-678(ra) # 802020fc <sched>
  p->chan = 0;
    802023aa:	0204b423          	sd	zero,40(s1)
  if(lk != &p->lock){
    802023ae:	bff9                	j	8020238c <sleep+0x5a>

00000000802023b0 <wait>:
{
    802023b0:	715d                	addi	sp,sp,-80
    802023b2:	e486                	sd	ra,72(sp)
    802023b4:	e0a2                	sd	s0,64(sp)
    802023b6:	fc26                	sd	s1,56(sp)
    802023b8:	f84a                	sd	s2,48(sp)
    802023ba:	f44e                	sd	s3,40(sp)
    802023bc:	f052                	sd	s4,32(sp)
    802023be:	ec56                	sd	s5,24(sp)
    802023c0:	e85a                	sd	s6,16(sp)
    802023c2:	e45e                	sd	s7,8(sp)
    802023c4:	0880                	addi	s0,sp,80
    802023c6:	8b2a                	mv	s6,a0
  struct proc *p = myproc();
    802023c8:	fffff097          	auipc	ra,0xfffff
    802023cc:	6c6080e7          	jalr	1734(ra) # 80201a8e <myproc>
    802023d0:	892a                	mv	s2,a0
  acquire(&p->lock);
    802023d2:	ffffe097          	auipc	ra,0xffffe
    802023d6:	2f4080e7          	jalr	756(ra) # 802006c6 <acquire>
    havekids = 0;
    802023da:	4b81                	li	s7,0
        if(np->state == ZOMBIE){
    802023dc:	4a11                	li	s4,4
        havekids = 1;
    802023de:	4a85                	li	s5,1
    for(np = proc; np < &proc[NPROC]; np++){
    802023e0:	00017997          	auipc	s3,0x17
    802023e4:	71098993          	addi	s3,s3,1808 # 80219af0 <bcache>
    havekids = 0;
    802023e8:	875e                	mv	a4,s7
    for(np = proc; np < &proc[NPROC]; np++){
    802023ea:	00013497          	auipc	s1,0x13
    802023ee:	d9648493          	addi	s1,s1,-618 # 80215180 <proc>
    802023f2:	a8b9                	j	80202450 <wait+0xa0>
          pid = np->pid;
    802023f4:	0384a983          	lw	s3,56(s1)
          if(addr != 0 && copyout2(addr, (char *)&np->xstate, sizeof(np->xstate)) < 0) {
    802023f8:	000b0c63          	beqz	s6,80202410 <wait+0x60>
    802023fc:	4611                	li	a2,4
    802023fe:	03448593          	addi	a1,s1,52
    80202402:	855a                	mv	a0,s6
    80202404:	fffff097          	auipc	ra,0xfffff
    80202408:	f6e080e7          	jalr	-146(ra) # 80201372 <copyout2>
    8020240c:	02054263          	bltz	a0,80202430 <wait+0x80>
          freeproc(np);
    80202410:	8526                	mv	a0,s1
    80202412:	00000097          	auipc	ra,0x0
    80202416:	84e080e7          	jalr	-1970(ra) # 80201c60 <freeproc>
          release(&np->lock);
    8020241a:	8526                	mv	a0,s1
    8020241c:	ffffe097          	auipc	ra,0xffffe
    80202420:	2fe080e7          	jalr	766(ra) # 8020071a <release>
          release(&p->lock);
    80202424:	854a                	mv	a0,s2
    80202426:	ffffe097          	auipc	ra,0xffffe
    8020242a:	2f4080e7          	jalr	756(ra) # 8020071a <release>
          return pid;
    8020242e:	a8a9                	j	80202488 <wait+0xd8>
            release(&np->lock);
    80202430:	8526                	mv	a0,s1
    80202432:	ffffe097          	auipc	ra,0xffffe
    80202436:	2e8080e7          	jalr	744(ra) # 8020071a <release>
            release(&p->lock);
    8020243a:	854a                	mv	a0,s2
    8020243c:	ffffe097          	auipc	ra,0xffffe
    80202440:	2de080e7          	jalr	734(ra) # 8020071a <release>
            return -1;
    80202444:	59fd                	li	s3,-1
    80202446:	a089                	j	80202488 <wait+0xd8>
    for(np = proc; np < &proc[NPROC]; np++){
    80202448:	17848493          	addi	s1,s1,376
    8020244c:	03348463          	beq	s1,s3,80202474 <wait+0xc4>
      if(np->parent == p){
    80202450:	709c                	ld	a5,32(s1)
    80202452:	ff279be3          	bne	a5,s2,80202448 <wait+0x98>
        acquire(&np->lock);
    80202456:	8526                	mv	a0,s1
    80202458:	ffffe097          	auipc	ra,0xffffe
    8020245c:	26e080e7          	jalr	622(ra) # 802006c6 <acquire>
        if(np->state == ZOMBIE){
    80202460:	4c9c                	lw	a5,24(s1)
    80202462:	f94789e3          	beq	a5,s4,802023f4 <wait+0x44>
        release(&np->lock);
    80202466:	8526                	mv	a0,s1
    80202468:	ffffe097          	auipc	ra,0xffffe
    8020246c:	2b2080e7          	jalr	690(ra) # 8020071a <release>
        havekids = 1;
    80202470:	8756                	mv	a4,s5
    80202472:	bfd9                	j	80202448 <wait+0x98>
    if(!havekids || p->killed){
    80202474:	c701                	beqz	a4,8020247c <wait+0xcc>
    80202476:	03092783          	lw	a5,48(s2)
    8020247a:	c39d                	beqz	a5,802024a0 <wait+0xf0>
      release(&p->lock);
    8020247c:	854a                	mv	a0,s2
    8020247e:	ffffe097          	auipc	ra,0xffffe
    80202482:	29c080e7          	jalr	668(ra) # 8020071a <release>
      return -1;
    80202486:	59fd                	li	s3,-1
}
    80202488:	854e                	mv	a0,s3
    8020248a:	60a6                	ld	ra,72(sp)
    8020248c:	6406                	ld	s0,64(sp)
    8020248e:	74e2                	ld	s1,56(sp)
    80202490:	7942                	ld	s2,48(sp)
    80202492:	79a2                	ld	s3,40(sp)
    80202494:	7a02                	ld	s4,32(sp)
    80202496:	6ae2                	ld	s5,24(sp)
    80202498:	6b42                	ld	s6,16(sp)
    8020249a:	6ba2                	ld	s7,8(sp)
    8020249c:	6161                	addi	sp,sp,80
    8020249e:	8082                	ret
    sleep(p, &p->lock);  //DOC: wait-sleep
    802024a0:	85ca                	mv	a1,s2
    802024a2:	854a                	mv	a0,s2
    802024a4:	00000097          	auipc	ra,0x0
    802024a8:	e8e080e7          	jalr	-370(ra) # 80202332 <sleep>
    havekids = 0;
    802024ac:	bf35                	j	802023e8 <wait+0x38>

00000000802024ae <wakeup>:
{
    802024ae:	7139                	addi	sp,sp,-64
    802024b0:	fc06                	sd	ra,56(sp)
    802024b2:	f822                	sd	s0,48(sp)
    802024b4:	f426                	sd	s1,40(sp)
    802024b6:	f04a                	sd	s2,32(sp)
    802024b8:	ec4e                	sd	s3,24(sp)
    802024ba:	e852                	sd	s4,16(sp)
    802024bc:	e456                	sd	s5,8(sp)
    802024be:	0080                	addi	s0,sp,64
    802024c0:	8a2a                	mv	s4,a0
  for(p = proc; p < &proc[NPROC]; p++) {
    802024c2:	00013497          	auipc	s1,0x13
    802024c6:	cbe48493          	addi	s1,s1,-834 # 80215180 <proc>
    if(p->state == SLEEPING && p->chan == chan) {
    802024ca:	4985                	li	s3,1
      p->state = RUNNABLE;
    802024cc:	4a89                	li	s5,2
  for(p = proc; p < &proc[NPROC]; p++) {
    802024ce:	00017917          	auipc	s2,0x17
    802024d2:	62290913          	addi	s2,s2,1570 # 80219af0 <bcache>
    802024d6:	a811                	j	802024ea <wakeup+0x3c>
    release(&p->lock);
    802024d8:	8526                	mv	a0,s1
    802024da:	ffffe097          	auipc	ra,0xffffe
    802024de:	240080e7          	jalr	576(ra) # 8020071a <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    802024e2:	17848493          	addi	s1,s1,376
    802024e6:	03248063          	beq	s1,s2,80202506 <wakeup+0x58>
    acquire(&p->lock);
    802024ea:	8526                	mv	a0,s1
    802024ec:	ffffe097          	auipc	ra,0xffffe
    802024f0:	1da080e7          	jalr	474(ra) # 802006c6 <acquire>
    if(p->state == SLEEPING && p->chan == chan) {
    802024f4:	4c9c                	lw	a5,24(s1)
    802024f6:	ff3791e3          	bne	a5,s3,802024d8 <wakeup+0x2a>
    802024fa:	749c                	ld	a5,40(s1)
    802024fc:	fd479ee3          	bne	a5,s4,802024d8 <wakeup+0x2a>
      p->state = RUNNABLE;
    80202500:	0154ac23          	sw	s5,24(s1)
    80202504:	bfd1                	j	802024d8 <wakeup+0x2a>
}
    80202506:	70e2                	ld	ra,56(sp)
    80202508:	7442                	ld	s0,48(sp)
    8020250a:	74a2                	ld	s1,40(sp)
    8020250c:	7902                	ld	s2,32(sp)
    8020250e:	69e2                	ld	s3,24(sp)
    80202510:	6a42                	ld	s4,16(sp)
    80202512:	6aa2                	ld	s5,8(sp)
    80202514:	6121                	addi	sp,sp,64
    80202516:	8082                	ret

0000000080202518 <kill>:
// Kill the process with the given pid.
// The victim won't exit until it tries to return
// to user space (see usertrap() in trap.c).
int
kill(int pid)
{
    80202518:	7179                	addi	sp,sp,-48
    8020251a:	f406                	sd	ra,40(sp)
    8020251c:	f022                	sd	s0,32(sp)
    8020251e:	ec26                	sd	s1,24(sp)
    80202520:	e84a                	sd	s2,16(sp)
    80202522:	e44e                	sd	s3,8(sp)
    80202524:	1800                	addi	s0,sp,48
    80202526:	892a                	mv	s2,a0
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++){
    80202528:	00013497          	auipc	s1,0x13
    8020252c:	c5848493          	addi	s1,s1,-936 # 80215180 <proc>
    80202530:	00017997          	auipc	s3,0x17
    80202534:	5c098993          	addi	s3,s3,1472 # 80219af0 <bcache>
    acquire(&p->lock);
    80202538:	8526                	mv	a0,s1
    8020253a:	ffffe097          	auipc	ra,0xffffe
    8020253e:	18c080e7          	jalr	396(ra) # 802006c6 <acquire>
    if(p->pid == pid){
    80202542:	5c9c                	lw	a5,56(s1)
    80202544:	01278d63          	beq	a5,s2,8020255e <kill+0x46>
        p->state = RUNNABLE;
      }
      release(&p->lock);
      return 0;
    }
    release(&p->lock);
    80202548:	8526                	mv	a0,s1
    8020254a:	ffffe097          	auipc	ra,0xffffe
    8020254e:	1d0080e7          	jalr	464(ra) # 8020071a <release>
  for(p = proc; p < &proc[NPROC]; p++){
    80202552:	17848493          	addi	s1,s1,376
    80202556:	ff3491e3          	bne	s1,s3,80202538 <kill+0x20>
  }
  return -1;
    8020255a:	557d                	li	a0,-1
    8020255c:	a821                	j	80202574 <kill+0x5c>
      p->killed = 1;
    8020255e:	4785                	li	a5,1
    80202560:	d89c                	sw	a5,48(s1)
      if(p->state == SLEEPING){
    80202562:	4c98                	lw	a4,24(s1)
    80202564:	00f70f63          	beq	a4,a5,80202582 <kill+0x6a>
      release(&p->lock);
    80202568:	8526                	mv	a0,s1
    8020256a:	ffffe097          	auipc	ra,0xffffe
    8020256e:	1b0080e7          	jalr	432(ra) # 8020071a <release>
      return 0;
    80202572:	4501                	li	a0,0
}
    80202574:	70a2                	ld	ra,40(sp)
    80202576:	7402                	ld	s0,32(sp)
    80202578:	64e2                	ld	s1,24(sp)
    8020257a:	6942                	ld	s2,16(sp)
    8020257c:	69a2                	ld	s3,8(sp)
    8020257e:	6145                	addi	sp,sp,48
    80202580:	8082                	ret
        p->state = RUNNABLE;
    80202582:	4789                	li	a5,2
    80202584:	cc9c                	sw	a5,24(s1)
    80202586:	b7cd                	j	80202568 <kill+0x50>

0000000080202588 <either_copyout>:
// Copy to either a user address, or kernel address,
// depending on usr_dst.
// Returns 0 on success, -1 on error.
int
either_copyout(int user_dst, uint64 dst, void *src, uint64 len)
{
    80202588:	1101                	addi	sp,sp,-32
    8020258a:	ec06                	sd	ra,24(sp)
    8020258c:	e822                	sd	s0,16(sp)
    8020258e:	e426                	sd	s1,8(sp)
    80202590:	1000                	addi	s0,sp,32
    80202592:	84aa                	mv	s1,a0
    80202594:	852e                	mv	a0,a1
    80202596:	85b2                	mv	a1,a2
    80202598:	8636                	mv	a2,a3
  // struct proc *p = myproc();
  if(user_dst){
    8020259a:	c891                	beqz	s1,802025ae <either_copyout+0x26>
    // return copyout(p->pagetable, dst, src, len);
    return copyout2(dst, src, len);
    8020259c:	fffff097          	auipc	ra,0xfffff
    802025a0:	dd6080e7          	jalr	-554(ra) # 80201372 <copyout2>
  } else {
    memmove((char *)dst, src, len);
    return 0;
  }
}
    802025a4:	60e2                	ld	ra,24(sp)
    802025a6:	6442                	ld	s0,16(sp)
    802025a8:	64a2                	ld	s1,8(sp)
    802025aa:	6105                	addi	sp,sp,32
    802025ac:	8082                	ret
    memmove((char *)dst, src, len);
    802025ae:	0006861b          	sext.w	a2,a3
    802025b2:	ffffe097          	auipc	ra,0xffffe
    802025b6:	20c080e7          	jalr	524(ra) # 802007be <memmove>
    return 0;
    802025ba:	8526                	mv	a0,s1
    802025bc:	b7e5                	j	802025a4 <either_copyout+0x1c>

00000000802025be <either_copyin>:
// Copy from either a user address, or kernel address,
// depending on usr_src.
// Returns 0 on success, -1 on error.
int
either_copyin(void *dst, int user_src, uint64 src, uint64 len)
{
    802025be:	1101                	addi	sp,sp,-32
    802025c0:	ec06                	sd	ra,24(sp)
    802025c2:	e822                	sd	s0,16(sp)
    802025c4:	e426                	sd	s1,8(sp)
    802025c6:	1000                	addi	s0,sp,32
    802025c8:	84ae                	mv	s1,a1
    802025ca:	85b2                	mv	a1,a2
    802025cc:	8636                	mv	a2,a3
  // struct proc *p = myproc();
  if(user_src){
    802025ce:	c891                	beqz	s1,802025e2 <either_copyin+0x24>
    // return copyin(p->pagetable, dst, src, len);
    return copyin2(dst, src, len);
    802025d0:	fffff097          	auipc	ra,0xfffff
    802025d4:	ed4080e7          	jalr	-300(ra) # 802014a4 <copyin2>
  } else {
    memmove(dst, (char*)src, len);
    return 0;
  }
}
    802025d8:	60e2                	ld	ra,24(sp)
    802025da:	6442                	ld	s0,16(sp)
    802025dc:	64a2                	ld	s1,8(sp)
    802025de:	6105                	addi	sp,sp,32
    802025e0:	8082                	ret
    memmove(dst, (char*)src, len);
    802025e2:	0006861b          	sext.w	a2,a3
    802025e6:	ffffe097          	auipc	ra,0xffffe
    802025ea:	1d8080e7          	jalr	472(ra) # 802007be <memmove>
    return 0;
    802025ee:	8526                	mv	a0,s1
    802025f0:	b7e5                	j	802025d8 <either_copyin+0x1a>

00000000802025f2 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
    802025f2:	715d                	addi	sp,sp,-80
    802025f4:	e486                	sd	ra,72(sp)
    802025f6:	e0a2                	sd	s0,64(sp)
    802025f8:	fc26                	sd	s1,56(sp)
    802025fa:	f84a                	sd	s2,48(sp)
    802025fc:	f44e                	sd	s3,40(sp)
    802025fe:	f052                	sd	s4,32(sp)
    80202600:	ec56                	sd	s5,24(sp)
    80202602:	e85a                	sd	s6,16(sp)
    80202604:	e45e                	sd	s7,8(sp)
    80202606:	0880                	addi	s0,sp,80
  [ZOMBIE]    "zombie"
  };
  struct proc *p;
  char *state;

  printf("\nPID\tSTATE\tNAME\tMEM\n");
    80202608:	00007517          	auipc	a0,0x7
    8020260c:	0b050513          	addi	a0,a0,176 # 802096b8 <digits+0x338>
    80202610:	ffffe097          	auipc	ra,0xffffe
    80202614:	b7e080e7          	jalr	-1154(ra) # 8020018e <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    80202618:	00013497          	auipc	s1,0x13
    8020261c:	cc848493          	addi	s1,s1,-824 # 802152e0 <proc+0x160>
    80202620:	00017917          	auipc	s2,0x17
    80202624:	63090913          	addi	s2,s2,1584 # 80219c50 <bcache+0x160>
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    80202628:	4b11                	li	s6,4
      state = states[p->state];
    else
      state = "???";
    8020262a:	00007997          	auipc	s3,0x7
    8020262e:	08698993          	addi	s3,s3,134 # 802096b0 <digits+0x330>
    printf("%d\t%s\t%s\t%d", p->pid, state, p->name, p->sz);
    80202632:	00007a97          	auipc	s5,0x7
    80202636:	09ea8a93          	addi	s5,s5,158 # 802096d0 <digits+0x350>
    printf("\n");
    8020263a:	00007a17          	auipc	s4,0x7
    8020263e:	a9ea0a13          	addi	s4,s4,-1378 # 802090d8 <etext+0xd8>
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    80202642:	00009b97          	auipc	s7,0x9
    80202646:	5e6b8b93          	addi	s7,s7,1510 # 8020bc28 <states.0>
    8020264a:	a01d                	j	80202670 <procdump+0x7e>
    printf("%d\t%s\t%s\t%d", p->pid, state, p->name, p->sz);
    8020264c:	ee86b703          	ld	a4,-280(a3)
    80202650:	ed86a583          	lw	a1,-296(a3)
    80202654:	8556                	mv	a0,s5
    80202656:	ffffe097          	auipc	ra,0xffffe
    8020265a:	b38080e7          	jalr	-1224(ra) # 8020018e <printf>
    printf("\n");
    8020265e:	8552                	mv	a0,s4
    80202660:	ffffe097          	auipc	ra,0xffffe
    80202664:	b2e080e7          	jalr	-1234(ra) # 8020018e <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    80202668:	17848493          	addi	s1,s1,376
    8020266c:	03248263          	beq	s1,s2,80202690 <procdump+0x9e>
    if(p->state == UNUSED)
    80202670:	86a6                	mv	a3,s1
    80202672:	eb84a783          	lw	a5,-328(s1)
    80202676:	dbed                	beqz	a5,80202668 <procdump+0x76>
      state = "???";
    80202678:	864e                	mv	a2,s3
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    8020267a:	fcfb69e3          	bltu	s6,a5,8020264c <procdump+0x5a>
    8020267e:	02079713          	slli	a4,a5,0x20
    80202682:	01d75793          	srli	a5,a4,0x1d
    80202686:	97de                	add	a5,a5,s7
    80202688:	6390                	ld	a2,0(a5)
    8020268a:	f269                	bnez	a2,8020264c <procdump+0x5a>
      state = "???";
    8020268c:	864e                	mv	a2,s3
    8020268e:	bf7d                	j	8020264c <procdump+0x5a>
  }
}
    80202690:	60a6                	ld	ra,72(sp)
    80202692:	6406                	ld	s0,64(sp)
    80202694:	74e2                	ld	s1,56(sp)
    80202696:	7942                	ld	s2,48(sp)
    80202698:	79a2                	ld	s3,40(sp)
    8020269a:	7a02                	ld	s4,32(sp)
    8020269c:	6ae2                	ld	s5,24(sp)
    8020269e:	6b42                	ld	s6,16(sp)
    802026a0:	6ba2                	ld	s7,8(sp)
    802026a2:	6161                	addi	sp,sp,80
    802026a4:	8082                	ret

00000000802026a6 <procnum>:

uint64
procnum(void)
{
    802026a6:	1141                	addi	sp,sp,-16
    802026a8:	e422                	sd	s0,8(sp)
    802026aa:	0800                	addi	s0,sp,16
  int num = 0;
  struct proc *p;

  for (p = proc; p < &proc[NPROC]; p++) {
    802026ac:	00013797          	auipc	a5,0x13
    802026b0:	ad478793          	addi	a5,a5,-1324 # 80215180 <proc>
  int num = 0;
    802026b4:	4501                	li	a0,0
  for (p = proc; p < &proc[NPROC]; p++) {
    802026b6:	00017697          	auipc	a3,0x17
    802026ba:	43a68693          	addi	a3,a3,1082 # 80219af0 <bcache>
    802026be:	a029                	j	802026c8 <procnum+0x22>
    802026c0:	17878793          	addi	a5,a5,376
    802026c4:	00d78663          	beq	a5,a3,802026d0 <procnum+0x2a>
    if (p->state != UNUSED) {
    802026c8:	4f98                	lw	a4,24(a5)
    802026ca:	db7d                	beqz	a4,802026c0 <procnum+0x1a>
      num++;
    802026cc:	2505                	addiw	a0,a0,1
    802026ce:	bfcd                	j	802026c0 <procnum+0x1a>
    }
  }

  return num;
}
    802026d0:	6422                	ld	s0,8(sp)
    802026d2:	0141                	addi	sp,sp,16
    802026d4:	8082                	ret

00000000802026d6 <clone>:

/////////////////////////////////////


int clone(uint64 flag, uint64 stack) {
    802026d6:	7139                	addi	sp,sp,-64
    802026d8:	fc06                	sd	ra,56(sp)
    802026da:	f822                	sd	s0,48(sp)
    802026dc:	f426                	sd	s1,40(sp)
    802026de:	f04a                	sd	s2,32(sp)
    802026e0:	ec4e                	sd	s3,24(sp)
    802026e2:	e852                	sd	s4,16(sp)
    802026e4:	e456                	sd	s5,8(sp)
    802026e6:	0080                	addi	s0,sp,64
    802026e8:	84ae                	mv	s1,a1
	int i, pid;
  struct proc *parent;
  struct proc *child = myproc();
    802026ea:	fffff097          	auipc	ra,0xfffff
    802026ee:	3a4080e7          	jalr	932(ra) # 80201a8e <myproc>
    802026f2:	8aaa                	mv	s5,a0

  // Allocate process.
  if((parent = allocproc()) == NULL){
    802026f4:	fffff097          	auipc	ra,0xfffff
    802026f8:	5d6080e7          	jalr	1494(ra) # 80201cca <allocproc>
    802026fc:	cd3d                	beqz	a0,8020277a <clone+0xa4>
    802026fe:	89aa                	mv	s3,a0
    printf("?\n");
    return -1;
  }
  
  // Copy user memory from parent to child.
  if(uvmcopy(child->pagetable, parent->pagetable, parent->kpagetable, child->sz) < 0){
    80202700:	048ab683          	ld	a3,72(s5)
    80202704:	6d30                	ld	a2,88(a0)
    80202706:	692c                	ld	a1,80(a0)
    80202708:	050ab503          	ld	a0,80(s5)
    8020270c:	fffff097          	auipc	ra,0xfffff
    80202710:	a9a080e7          	jalr	-1382(ra) # 802011a6 <uvmcopy>
    80202714:	06054d63          	bltz	a0,8020278e <clone+0xb8>
    printf("?\n");
    freeproc(parent);
    release(&parent->lock);
    return -1;
  }
  parent->sz = child->sz;
    80202718:	048ab783          	ld	a5,72(s5)
    8020271c:	04f9b423          	sd	a5,72(s3)

  parent->parent = child;
    80202720:	0359b023          	sd	s5,32(s3)

  // copy tracing mask from parent.
  parent->tmask = child->tmask;
    80202724:	170aa783          	lw	a5,368(s5)
    80202728:	16f9a823          	sw	a5,368(s3)

  // copy saved user registers.
  *(parent->trapframe) = *(child->trapframe);
    8020272c:	060ab683          	ld	a3,96(s5)
    80202730:	87b6                	mv	a5,a3
    80202732:	0609b703          	ld	a4,96(s3)
    80202736:	12068693          	addi	a3,a3,288
    8020273a:	0007b883          	ld	a7,0(a5)
    8020273e:	0087b803          	ld	a6,8(a5)
    80202742:	6b88                	ld	a0,16(a5)
    80202744:	6f90                	ld	a2,24(a5)
    80202746:	01173023          	sd	a7,0(a4)
    8020274a:	01073423          	sd	a6,8(a4)
    8020274e:	eb08                	sd	a0,16(a4)
    80202750:	ef10                	sd	a2,24(a4)
    80202752:	02078793          	addi	a5,a5,32
    80202756:	02070713          	addi	a4,a4,32
    8020275a:	fed790e3          	bne	a5,a3,8020273a <clone+0x64>

  // Cause fork to return 0 in the child.
  parent->trapframe->a0 = 0;
    8020275e:	0609b783          	ld	a5,96(s3)
    80202762:	0607b823          	sd	zero,112(a5)
  parent->trapframe->sp = stack;
    80202766:	0609b783          	ld	a5,96(s3)
    8020276a:	fb84                	sd	s1,48(a5)

  // increment reference counts on open file descriptors.
  for(i = 0; i < NOFILE; i++)
    8020276c:	0d8a8493          	addi	s1,s5,216
    80202770:	0d898913          	addi	s2,s3,216
    80202774:	158a8a13          	addi	s4,s5,344
    80202778:	a889                	j	802027ca <clone+0xf4>
    printf("?\n");
    8020277a:	00007517          	auipc	a0,0x7
    8020277e:	f6650513          	addi	a0,a0,-154 # 802096e0 <digits+0x360>
    80202782:	ffffe097          	auipc	ra,0xffffe
    80202786:	a0c080e7          	jalr	-1524(ra) # 8020018e <printf>
    return -1;
    8020278a:	54fd                	li	s1,-1
    8020278c:	a8ad                	j	80202806 <clone+0x130>
    printf("?\n");
    8020278e:	00007517          	auipc	a0,0x7
    80202792:	f5250513          	addi	a0,a0,-174 # 802096e0 <digits+0x360>
    80202796:	ffffe097          	auipc	ra,0xffffe
    8020279a:	9f8080e7          	jalr	-1544(ra) # 8020018e <printf>
    freeproc(parent);
    8020279e:	854e                	mv	a0,s3
    802027a0:	fffff097          	auipc	ra,0xfffff
    802027a4:	4c0080e7          	jalr	1216(ra) # 80201c60 <freeproc>
    release(&parent->lock);
    802027a8:	854e                	mv	a0,s3
    802027aa:	ffffe097          	auipc	ra,0xffffe
    802027ae:	f70080e7          	jalr	-144(ra) # 8020071a <release>
    return -1;
    802027b2:	54fd                	li	s1,-1
    802027b4:	a889                	j	80202806 <clone+0x130>
    if(child->ofile[i])
      parent->ofile[i] = filedup(child->ofile[i]);
    802027b6:	00001097          	auipc	ra,0x1
    802027ba:	5f4080e7          	jalr	1524(ra) # 80203daa <filedup>
    802027be:	00a93023          	sd	a0,0(s2)
  for(i = 0; i < NOFILE; i++)
    802027c2:	04a1                	addi	s1,s1,8
    802027c4:	0921                	addi	s2,s2,8
    802027c6:	01448563          	beq	s1,s4,802027d0 <clone+0xfa>
    if(child->ofile[i])
    802027ca:	6088                	ld	a0,0(s1)
    802027cc:	f56d                	bnez	a0,802027b6 <clone+0xe0>
    802027ce:	bfd5                	j	802027c2 <clone+0xec>
  parent->cwd = edup(child->cwd);
    802027d0:	158ab503          	ld	a0,344(s5)
    802027d4:	00004097          	auipc	ra,0x4
    802027d8:	2ea080e7          	jalr	746(ra) # 80206abe <edup>
    802027dc:	14a9bc23          	sd	a0,344(s3)

  safestrcpy(parent->name, child->name, sizeof(child->name));
    802027e0:	4641                	li	a2,16
    802027e2:	160a8593          	addi	a1,s5,352
    802027e6:	16098513          	addi	a0,s3,352
    802027ea:	ffffe097          	auipc	ra,0xffffe
    802027ee:	0ca080e7          	jalr	202(ra) # 802008b4 <safestrcpy>

  pid = parent->pid;
    802027f2:	0389a483          	lw	s1,56(s3)

  parent->state = RUNNABLE;
    802027f6:	4789                	li	a5,2
    802027f8:	00f9ac23          	sw	a5,24(s3)

  release(&parent->lock);
    802027fc:	854e                	mv	a0,s3
    802027fe:	ffffe097          	auipc	ra,0xffffe
    80202802:	f1c080e7          	jalr	-228(ra) # 8020071a <release>

  return pid;
}
    80202806:	8526                	mv	a0,s1
    80202808:	70e2                	ld	ra,56(sp)
    8020280a:	7442                	ld	s0,48(sp)
    8020280c:	74a2                	ld	s1,40(sp)
    8020280e:	7902                	ld	s2,32(sp)
    80202810:	69e2                	ld	s3,24(sp)
    80202812:	6a42                	ld	s4,16(sp)
    80202814:	6aa2                	ld	s5,8(sp)
    80202816:	6121                	addi	sp,sp,64
    80202818:	8082                	ret

000000008020281a <waitpid>:

int
waitpid(int pid_to_wait, uint64 status, int options)
{
    8020281a:	7159                	addi	sp,sp,-112
    8020281c:	f486                	sd	ra,104(sp)
    8020281e:	f0a2                	sd	s0,96(sp)
    80202820:	eca6                	sd	s1,88(sp)
    80202822:	e8ca                	sd	s2,80(sp)
    80202824:	e4ce                	sd	s3,72(sp)
    80202826:	e0d2                	sd	s4,64(sp)
    80202828:	fc56                	sd	s5,56(sp)
    8020282a:	f85a                	sd	s6,48(sp)
    8020282c:	f45e                	sd	s7,40(sp)
    8020282e:	f062                	sd	s8,32(sp)
    80202830:	ec66                	sd	s9,24(sp)
    80202832:	e86a                	sd	s10,16(sp)
    80202834:	e46e                	sd	s11,8(sp)
    80202836:	1880                	addi	s0,sp,112
    80202838:	8a2a                	mv	s4,a0
    8020283a:	8cae                	mv	s9,a1
    8020283c:	8d32                	mv	s10,a2
  struct proc *np;
  int havekids, pid;
  struct proc *p = myproc();
    8020283e:	fffff097          	auipc	ra,0xfffff
    80202842:	250080e7          	jalr	592(ra) # 80201a8e <myproc>
    80202846:	892a                	mv	s2,a0
  
  // printf("[waitpid] pid_to_wait: %d\n", pid_to_wait);
  acquire(&p->lock);
    80202848:	ffffe097          	auipc	ra,0xffffe
    8020284c:	e7e080e7          	jalr	-386(ra) # 802006c6 <acquire>

  while(1){
    havekids = 0;
    80202850:	4d81                	li	s11,0
    for (np = proc; np < &proc[NPROC]; np++) {
      if(np->parent == p){
        if(pid_to_wait == -1) {}
    80202852:	5afd                	li	s5,-1
        }
        else
          return -1;
        acquire(&np->lock);
        havekids = 1;
        if(np->state == ZOMBIE) {
    80202854:	4b91                	li	s7,4
        havekids = 1;
    80202856:	4c05                	li	s8,1
    for (np = proc; np < &proc[NPROC]; np++) {
    80202858:	00017997          	auipc	s3,0x17
    8020285c:	29898993          	addi	s3,s3,664 # 80219af0 <bcache>
    havekids = 0;
    80202860:	8b6e                	mv	s6,s11
    for (np = proc; np < &proc[NPROC]; np++) {
    80202862:	00013497          	auipc	s1,0x13
    80202866:	91e48493          	addi	s1,s1,-1762 # 80215180 <proc>
    8020286a:	a01d                	j	80202890 <waitpid+0x76>
        acquire(&np->lock);
    8020286c:	8526                	mv	a0,s1
    8020286e:	ffffe097          	auipc	ra,0xffffe
    80202872:	e58080e7          	jalr	-424(ra) # 802006c6 <acquire>
        if(np->state == ZOMBIE) {
    80202876:	4c9c                	lw	a5,24(s1)
    80202878:	03778763          	beq	a5,s7,802028a6 <waitpid+0x8c>
          freeproc(np);
          release(&np->lock);
          release(&p->lock);
          return pid;
        }
        release(&np->lock);
    8020287c:	8526                	mv	a0,s1
    8020287e:	ffffe097          	auipc	ra,0xffffe
    80202882:	e9c080e7          	jalr	-356(ra) # 8020071a <release>
        havekids = 1;
    80202886:	8b62                	mv	s6,s8
    for (np = proc; np < &proc[NPROC]; np++) {
    80202888:	17848493          	addi	s1,s1,376
    8020288c:	07348863          	beq	s1,s3,802028fc <waitpid+0xe2>
      if(np->parent == p){
    80202890:	709c                	ld	a5,32(s1)
    80202892:	ff279be3          	bne	a5,s2,80202888 <waitpid+0x6e>
        if(pid_to_wait == -1) {}
    80202896:	fd5a0be3          	beq	s4,s5,8020286c <waitpid+0x52>
        else if(pid_to_wait > 0) {
    8020289a:	0b405c63          	blez	s4,80202952 <waitpid+0x138>
          if(np->pid != pid_to_wait)
    8020289e:	5c9c                	lw	a5,56(s1)
    802028a0:	fd4786e3          	beq	a5,s4,8020286c <waitpid+0x52>
    802028a4:	b7d5                	j	80202888 <waitpid+0x6e>
          pid = np->pid;
    802028a6:	0384ab03          	lw	s6,56(s1)
          if (status != 0 && copyout2(status + 1, (char *)&np->xstate, sizeof(np->xstate)) < 0){
    802028aa:	000c8d63          	beqz	s9,802028c4 <waitpid+0xaa>
    802028ae:	4611                	li	a2,4
    802028b0:	03448593          	addi	a1,s1,52
    802028b4:	001c8513          	addi	a0,s9,1 # 1001 <_entry-0x801fefff>
    802028b8:	fffff097          	auipc	ra,0xfffff
    802028bc:	aba080e7          	jalr	-1350(ra) # 80201372 <copyout2>
    802028c0:	02054263          	bltz	a0,802028e4 <waitpid+0xca>
          freeproc(np);
    802028c4:	8526                	mv	a0,s1
    802028c6:	fffff097          	auipc	ra,0xfffff
    802028ca:	39a080e7          	jalr	922(ra) # 80201c60 <freeproc>
          release(&np->lock);
    802028ce:	8526                	mv	a0,s1
    802028d0:	ffffe097          	auipc	ra,0xffffe
    802028d4:	e4a080e7          	jalr	-438(ra) # 8020071a <release>
          release(&p->lock);
    802028d8:	854a                	mv	a0,s2
    802028da:	ffffe097          	auipc	ra,0xffffe
    802028de:	e40080e7          	jalr	-448(ra) # 8020071a <release>
          return pid;
    802028e2:	a089                	j	80202924 <waitpid+0x10a>
            release(&np->lock);
    802028e4:	8526                	mv	a0,s1
    802028e6:	ffffe097          	auipc	ra,0xffffe
    802028ea:	e34080e7          	jalr	-460(ra) # 8020071a <release>
            release(&p->lock);
    802028ee:	854a                	mv	a0,s2
    802028f0:	ffffe097          	auipc	ra,0xffffe
    802028f4:	e2a080e7          	jalr	-470(ra) # 8020071a <release>
            return -1;
    802028f8:	5b7d                	li	s6,-1
    802028fa:	a02d                	j	80202924 <waitpid+0x10a>
      }
    }

    if (!havekids && options == WNOHANG){
    802028fc:	000b1b63          	bnez	s6,80202912 <waitpid+0xf8>
    80202900:	4785                	li	a5,1
    80202902:	00fd1b63          	bne	s10,a5,80202918 <waitpid+0xfe>
      release(&p->lock);
    80202906:	854a                	mv	a0,s2
    80202908:	ffffe097          	auipc	ra,0xffffe
    8020290c:	e12080e7          	jalr	-494(ra) # 8020071a <release>
      return 0;
    80202910:	a811                	j	80202924 <waitpid+0x10a>
    }

    if (!havekids || p->killed){
    80202912:	03092783          	lw	a5,48(s2)
    80202916:	c79d                	beqz	a5,80202944 <waitpid+0x12a>
      release(&p->lock);
    80202918:	854a                	mv	a0,s2
    8020291a:	ffffe097          	auipc	ra,0xffffe
    8020291e:	e00080e7          	jalr	-512(ra) # 8020071a <release>
      return -1;
    80202922:	5b7d                	li	s6,-1
    }

    // Wait for a child to exit.
    sleep(p, &p->lock); // DOC: wait-sleep
  }
}
    80202924:	855a                	mv	a0,s6
    80202926:	70a6                	ld	ra,104(sp)
    80202928:	7406                	ld	s0,96(sp)
    8020292a:	64e6                	ld	s1,88(sp)
    8020292c:	6946                	ld	s2,80(sp)
    8020292e:	69a6                	ld	s3,72(sp)
    80202930:	6a06                	ld	s4,64(sp)
    80202932:	7ae2                	ld	s5,56(sp)
    80202934:	7b42                	ld	s6,48(sp)
    80202936:	7ba2                	ld	s7,40(sp)
    80202938:	7c02                	ld	s8,32(sp)
    8020293a:	6ce2                	ld	s9,24(sp)
    8020293c:	6d42                	ld	s10,16(sp)
    8020293e:	6da2                	ld	s11,8(sp)
    80202940:	6165                	addi	sp,sp,112
    80202942:	8082                	ret
    sleep(p, &p->lock); // DOC: wait-sleep
    80202944:	85ca                	mv	a1,s2
    80202946:	854a                	mv	a0,s2
    80202948:	00000097          	auipc	ra,0x0
    8020294c:	9ea080e7          	jalr	-1558(ra) # 80202332 <sleep>
    havekids = 0;
    80202950:	bf01                	j	80202860 <waitpid+0x46>
          return -1;
    80202952:	5b7d                	li	s6,-1
    80202954:	bfc1                	j	80202924 <waitpid+0x10a>

0000000080202956 <swtch>:
    80202956:	00153023          	sd	ra,0(a0)
    8020295a:	00253423          	sd	sp,8(a0)
    8020295e:	e900                	sd	s0,16(a0)
    80202960:	ed04                	sd	s1,24(a0)
    80202962:	03253023          	sd	s2,32(a0)
    80202966:	03353423          	sd	s3,40(a0)
    8020296a:	03453823          	sd	s4,48(a0)
    8020296e:	03553c23          	sd	s5,56(a0)
    80202972:	05653023          	sd	s6,64(a0)
    80202976:	05753423          	sd	s7,72(a0)
    8020297a:	05853823          	sd	s8,80(a0)
    8020297e:	05953c23          	sd	s9,88(a0)
    80202982:	07a53023          	sd	s10,96(a0)
    80202986:	07b53423          	sd	s11,104(a0)
    8020298a:	0005b083          	ld	ra,0(a1)
    8020298e:	0085b103          	ld	sp,8(a1)
    80202992:	6980                	ld	s0,16(a1)
    80202994:	6d84                	ld	s1,24(a1)
    80202996:	0205b903          	ld	s2,32(a1)
    8020299a:	0285b983          	ld	s3,40(a1)
    8020299e:	0305ba03          	ld	s4,48(a1)
    802029a2:	0385ba83          	ld	s5,56(a1)
    802029a6:	0405bb03          	ld	s6,64(a1)
    802029aa:	0485bb83          	ld	s7,72(a1)
    802029ae:	0505bc03          	ld	s8,80(a1)
    802029b2:	0585bc83          	ld	s9,88(a1)
    802029b6:	0605bd03          	ld	s10,96(a1)
    802029ba:	0685bd83          	ld	s11,104(a1)
    802029be:	8082                	ret

00000000802029c0 <trapinithart>:
// }

// set up to take exceptions and traps while in the kernel.
void
trapinithart(void)
{
    802029c0:	1141                	addi	sp,sp,-16
    802029c2:	e406                	sd	ra,8(sp)
    802029c4:	e022                	sd	s0,0(sp)
    802029c6:	0800                	addi	s0,sp,16
  asm volatile("csrw stvec, %0" : : "r" (x));
    802029c8:	0000a797          	auipc	a5,0xa
    802029cc:	3087b783          	ld	a5,776(a5) # 8020ccd0 <_GLOBAL_OFFSET_TABLE_+0x18>
    802029d0:	10579073          	csrw	stvec,a5
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802029d4:	100027f3          	csrr	a5,sstatus
  w_stvec((uint64)kernelvec);
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    802029d8:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    802029dc:	10079073          	csrw	sstatus,a5
  asm volatile("csrr %0, sie" : "=r" (x) );
    802029e0:	104027f3          	csrr	a5,sie
  // enable supervisor-mode timer interrupts.
  w_sie(r_sie() | SIE_SEIE | SIE_SSIE | SIE_STIE);
    802029e4:	2227e793          	ori	a5,a5,546
  asm volatile("csrw sie, %0" : : "r" (x));
    802029e8:	10479073          	csrw	sie,a5
  set_next_timeout();
    802029ec:	00003097          	auipc	ra,0x3
    802029f0:	07a080e7          	jalr	122(ra) # 80205a66 <set_next_timeout>
  #ifdef DEBUG
  printf("trapinithart\n");
  #endif
}
    802029f4:	60a2                	ld	ra,8(sp)
    802029f6:	6402                	ld	s0,0(sp)
    802029f8:	0141                	addi	sp,sp,16
    802029fa:	8082                	ret

00000000802029fc <usertrapret>:
//
// return to user space
//
void
usertrapret(void)
{
    802029fc:	1141                	addi	sp,sp,-16
    802029fe:	e406                	sd	ra,8(sp)
    80202a00:	e022                	sd	s0,0(sp)
    80202a02:	0800                	addi	s0,sp,16
  struct proc *p = myproc();
    80202a04:	fffff097          	auipc	ra,0xfffff
    80202a08:	08a080e7          	jalr	138(ra) # 80201a8e <myproc>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202a0c:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    80202a10:	9bf5                	andi	a5,a5,-3
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202a12:	10079073          	csrw	sstatus,a5
  // kerneltrap() to usertrap(), so turn off interrupts until
  // we're back in user space, where usertrap() is correct.
  intr_off();

  // send syscalls, interrupts, and exceptions to trampoline.S
  w_stvec(TRAMPOLINE + (uservec - trampoline));
    80202a16:	0000a697          	auipc	a3,0xa
    80202a1a:	2aa6b683          	ld	a3,682(a3) # 8020ccc0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80202a1e:	0000a717          	auipc	a4,0xa
    80202a22:	2d273703          	ld	a4,722(a4) # 8020ccf0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80202a26:	8f15                	sub	a4,a4,a3
    80202a28:	040007b7          	lui	a5,0x4000
    80202a2c:	17fd                	addi	a5,a5,-1 # 3ffffff <_entry-0x7c200001>
    80202a2e:	07b2                	slli	a5,a5,0xc
    80202a30:	973e                	add	a4,a4,a5
  asm volatile("csrw stvec, %0" : : "r" (x));
    80202a32:	10571073          	csrw	stvec,a4

  // set up trapframe values that uservec will need when
  // the process next re-enters the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
    80202a36:	7138                	ld	a4,96(a0)
  asm volatile("csrr %0, satp" : "=r" (x) );
    80202a38:	18002673          	csrr	a2,satp
    80202a3c:	e310                	sd	a2,0(a4)
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
    80202a3e:	7130                	ld	a2,96(a0)
    80202a40:	6138                	ld	a4,64(a0)
    80202a42:	6585                	lui	a1,0x1
    80202a44:	972e                	add	a4,a4,a1
    80202a46:	e618                	sd	a4,8(a2)
  p->trapframe->kernel_trap = (uint64)usertrap;
    80202a48:	7138                	ld	a4,96(a0)
    80202a4a:	00000617          	auipc	a2,0x0
    80202a4e:	0f460613          	addi	a2,a2,244 # 80202b3e <usertrap>
    80202a52:	eb10                	sd	a2,16(a4)
  p->trapframe->kernel_hartid = r_tp();         // hartid for cpuid()
    80202a54:	7138                	ld	a4,96(a0)
  asm volatile("mv %0, tp" : "=r" (x) );
    80202a56:	8612                	mv	a2,tp
    80202a58:	f310                	sd	a2,32(a4)
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202a5a:	10002773          	csrr	a4,sstatus
  // set up the registers that trampoline.S's sret will use
  // to get to user space.
  
  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
    80202a5e:	eff77713          	andi	a4,a4,-257
  x |= SSTATUS_SPIE; // enable interrupts in user mode
    80202a62:	02076713          	ori	a4,a4,32
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202a66:	10071073          	csrw	sstatus,a4
  w_sstatus(x);

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);
    80202a6a:	7138                	ld	a4,96(a0)
  asm volatile("csrw sepc, %0" : : "r" (x));
    80202a6c:	6f18                	ld	a4,24(a4)
    80202a6e:	14171073          	csrw	sepc,a4

  // tell trampoline.S the user page table to switch to.
  // printf("[usertrapret]p->pagetable: %p\n", p->pagetable);
  uint64 satp = MAKE_SATP(p->pagetable);
    80202a72:	692c                	ld	a1,80(a0)
    80202a74:	81b1                	srli	a1,a1,0xc

  // jump to trampoline.S at the top of memory, which 
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 fn = TRAMPOLINE + (userret - trampoline);
    80202a76:	0000a717          	auipc	a4,0xa
    80202a7a:	25273703          	ld	a4,594(a4) # 8020ccc8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80202a7e:	8f15                	sub	a4,a4,a3
    80202a80:	97ba                	add	a5,a5,a4
  ((void (*)(uint64,uint64))fn)(TRAPFRAME, satp);
    80202a82:	577d                	li	a4,-1
    80202a84:	177e                	slli	a4,a4,0x3f
    80202a86:	8dd9                	or	a1,a1,a4
    80202a88:	02000537          	lui	a0,0x2000
    80202a8c:	157d                	addi	a0,a0,-1 # 1ffffff <_entry-0x7e200001>
    80202a8e:	0536                	slli	a0,a0,0xd
    80202a90:	9782                	jalr	a5
}
    80202a92:	60a2                	ld	ra,8(sp)
    80202a94:	6402                	ld	s0,0(sp)
    80202a96:	0141                	addi	sp,sp,16
    80202a98:	8082                	ret

0000000080202a9a <devintr>:
// Check if it's an external/software interrupt, 
// and handle it. 
// returns  2 if timer interrupt, 
//          1 if other device, 
//          0 if not recognized. 
int devintr(void) {
    80202a9a:	1101                	addi	sp,sp,-32
    80202a9c:	ec06                	sd	ra,24(sp)
    80202a9e:	e822                	sd	s0,16(sp)
    80202aa0:	e426                	sd	s1,8(sp)
    80202aa2:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202aa4:	14202773          	csrr	a4,scause
	uint64 scause = r_scause();

	#ifdef QEMU 
	// handle external interrupt 
	if ((0x8000000000000000L & scause) && 9 == (scause & 0xff)) 
    80202aa8:	00074d63          	bltz	a4,80202ac2 <devintr+0x28>
		sbi_set_mie();
		#endif 

		return 1;
	}
	else if (0x8000000000000005L == scause) {
    80202aac:	57fd                	li	a5,-1
    80202aae:	17fe                	slli	a5,a5,0x3f
    80202ab0:	0795                	addi	a5,a5,5
		timer_tick();
		return 2;
	}
	else { return 0;}
    80202ab2:	4501                	li	a0,0
	else if (0x8000000000000005L == scause) {
    80202ab4:	06f70f63          	beq	a4,a5,80202b32 <devintr+0x98>
}
    80202ab8:	60e2                	ld	ra,24(sp)
    80202aba:	6442                	ld	s0,16(sp)
    80202abc:	64a2                	ld	s1,8(sp)
    80202abe:	6105                	addi	sp,sp,32
    80202ac0:	8082                	ret
	if ((0x8000000000000000L & scause) && 9 == (scause & 0xff)) 
    80202ac2:	0ff77793          	zext.b	a5,a4
    80202ac6:	46a5                	li	a3,9
    80202ac8:	fed792e3          	bne	a5,a3,80202aac <devintr+0x12>
		int irq = plic_claim();
    80202acc:	00005097          	auipc	ra,0x5
    80202ad0:	aca080e7          	jalr	-1334(ra) # 80207596 <plic_claim>
    80202ad4:	84aa                	mv	s1,a0
		if (UART_IRQ == irq) {
    80202ad6:	47a9                	li	a5,10
    80202ad8:	02f50163          	beq	a0,a5,80202afa <devintr+0x60>
		else if (DISK_IRQ == irq) {
    80202adc:	4785                	li	a5,1
    80202ade:	04f50563          	beq	a0,a5,80202b28 <devintr+0x8e>
		return 1;
    80202ae2:	4505                	li	a0,1
		else if (irq) {
    80202ae4:	d8f1                	beqz	s1,80202ab8 <devintr+0x1e>
			printf("unexpected interrupt irq = %d\n", irq);
    80202ae6:	85a6                	mv	a1,s1
    80202ae8:	00007517          	auipc	a0,0x7
    80202aec:	c2850513          	addi	a0,a0,-984 # 80209710 <digits+0x390>
    80202af0:	ffffd097          	auipc	ra,0xffffd
    80202af4:	69e080e7          	jalr	1694(ra) # 8020018e <printf>
    80202af8:	a821                	j	80202b10 <devintr+0x76>
	return SBI_CALL_0(SBI_CONSOLE_GETCHAR);
    80202afa:	4501                	li	a0,0
    80202afc:	4581                	li	a1,0
    80202afe:	4601                	li	a2,0
    80202b00:	4681                	li	a3,0
    80202b02:	4889                	li	a7,2
    80202b04:	00000073          	ecall
    80202b08:	2501                	sext.w	a0,a0
			if (-1 != c) {
    80202b0a:	57fd                	li	a5,-1
    80202b0c:	00f51963          	bne	a0,a5,80202b1e <devintr+0x84>
		if (irq) { plic_complete(irq);}
    80202b10:	8526                	mv	a0,s1
    80202b12:	00005097          	auipc	ra,0x5
    80202b16:	aae080e7          	jalr	-1362(ra) # 802075c0 <plic_complete>
		return 1;
    80202b1a:	4505                	li	a0,1
    80202b1c:	bf71                	j	80202ab8 <devintr+0x1e>
				consoleintr(c);
    80202b1e:	00005097          	auipc	ra,0x5
    80202b22:	cb6080e7          	jalr	-842(ra) # 802077d4 <consoleintr>
    80202b26:	b7ed                	j	80202b10 <devintr+0x76>
			disk_intr();
    80202b28:	00003097          	auipc	ra,0x3
    80202b2c:	ffe080e7          	jalr	-2(ra) # 80205b26 <disk_intr>
    80202b30:	b7c5                	j	80202b10 <devintr+0x76>
		timer_tick();
    80202b32:	00003097          	auipc	ra,0x3
    80202b36:	f5a080e7          	jalr	-166(ra) # 80205a8c <timer_tick>
		return 2;
    80202b3a:	4509                	li	a0,2
    80202b3c:	bfb5                	j	80202ab8 <devintr+0x1e>

0000000080202b3e <usertrap>:
{
    80202b3e:	1101                	addi	sp,sp,-32
    80202b40:	ec06                	sd	ra,24(sp)
    80202b42:	e822                	sd	s0,16(sp)
    80202b44:	e426                	sd	s1,8(sp)
    80202b46:	e04a                	sd	s2,0(sp)
    80202b48:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202b4a:	100027f3          	csrr	a5,sstatus
  if((r_sstatus() & SSTATUS_SPP) != 0)
    80202b4e:	1007f793          	andi	a5,a5,256
    80202b52:	e3ad                	bnez	a5,80202bb4 <usertrap+0x76>
  asm volatile("csrw stvec, %0" : : "r" (x));
    80202b54:	0000a797          	auipc	a5,0xa
    80202b58:	17c7b783          	ld	a5,380(a5) # 8020ccd0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80202b5c:	10579073          	csrw	stvec,a5
  struct proc *p = myproc();
    80202b60:	fffff097          	auipc	ra,0xfffff
    80202b64:	f2e080e7          	jalr	-210(ra) # 80201a8e <myproc>
    80202b68:	84aa                	mv	s1,a0
  p->trapframe->epc = r_sepc();
    80202b6a:	713c                	ld	a5,96(a0)
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202b6c:	14102773          	csrr	a4,sepc
    80202b70:	ef98                	sd	a4,24(a5)
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202b72:	14202773          	csrr	a4,scause
  if(r_scause() == 8){
    80202b76:	47a1                	li	a5,8
    80202b78:	04f71c63          	bne	a4,a5,80202bd0 <usertrap+0x92>
    if(p->killed)
    80202b7c:	591c                	lw	a5,48(a0)
    80202b7e:	e3b9                	bnez	a5,80202bc4 <usertrap+0x86>
    p->trapframe->epc += 4;
    80202b80:	70b8                	ld	a4,96(s1)
    80202b82:	6f1c                	ld	a5,24(a4)
    80202b84:	0791                	addi	a5,a5,4
    80202b86:	ef1c                	sd	a5,24(a4)
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202b88:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80202b8c:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202b90:	10079073          	csrw	sstatus,a5
    syscall();
    80202b94:	00000097          	auipc	ra,0x0
    80202b98:	5d4080e7          	jalr	1492(ra) # 80203168 <syscall>
  if(p->killed)
    80202b9c:	589c                	lw	a5,48(s1)
    80202b9e:	ebd1                	bnez	a5,80202c32 <usertrap+0xf4>
  usertrapret();
    80202ba0:	00000097          	auipc	ra,0x0
    80202ba4:	e5c080e7          	jalr	-420(ra) # 802029fc <usertrapret>
}
    80202ba8:	60e2                	ld	ra,24(sp)
    80202baa:	6442                	ld	s0,16(sp)
    80202bac:	64a2                	ld	s1,8(sp)
    80202bae:	6902                	ld	s2,0(sp)
    80202bb0:	6105                	addi	sp,sp,32
    80202bb2:	8082                	ret
    panic("usertrap: not from user mode");
    80202bb4:	00007517          	auipc	a0,0x7
    80202bb8:	b7c50513          	addi	a0,a0,-1156 # 80209730 <digits+0x3b0>
    80202bbc:	ffffd097          	auipc	ra,0xffffd
    80202bc0:	588080e7          	jalr	1416(ra) # 80200144 <panic>
      exit(-1);
    80202bc4:	557d                	li	a0,-1
    80202bc6:	fffff097          	auipc	ra,0xfffff
    80202bca:	60c080e7          	jalr	1548(ra) # 802021d2 <exit>
    80202bce:	bf4d                	j	80202b80 <usertrap+0x42>
  else if((which_dev = devintr()) != 0){
    80202bd0:	00000097          	auipc	ra,0x0
    80202bd4:	eca080e7          	jalr	-310(ra) # 80202a9a <devintr>
    80202bd8:	892a                	mv	s2,a0
    80202bda:	c501                	beqz	a0,80202be2 <usertrap+0xa4>
  if(p->killed)
    80202bdc:	589c                	lw	a5,48(s1)
    80202bde:	c3b1                	beqz	a5,80202c22 <usertrap+0xe4>
    80202be0:	a825                	j	80202c18 <usertrap+0xda>
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202be2:	142025f3          	csrr	a1,scause
    printf("\nusertrap(): unexpected scause %p pid=%d %s\n", r_scause(), p->pid, p->name);
    80202be6:	16048693          	addi	a3,s1,352
    80202bea:	5c90                	lw	a2,56(s1)
    80202bec:	00007517          	auipc	a0,0x7
    80202bf0:	b6450513          	addi	a0,a0,-1180 # 80209750 <digits+0x3d0>
    80202bf4:	ffffd097          	auipc	ra,0xffffd
    80202bf8:	59a080e7          	jalr	1434(ra) # 8020018e <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202bfc:	141025f3          	csrr	a1,sepc
  asm volatile("csrr %0, stval" : "=r" (x) );
    80202c00:	14302673          	csrr	a2,stval
    printf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    80202c04:	00007517          	auipc	a0,0x7
    80202c08:	b7c50513          	addi	a0,a0,-1156 # 80209780 <digits+0x400>
    80202c0c:	ffffd097          	auipc	ra,0xffffd
    80202c10:	582080e7          	jalr	1410(ra) # 8020018e <printf>
    p->killed = 1;
    80202c14:	4785                	li	a5,1
    80202c16:	d89c                	sw	a5,48(s1)
    exit(-1);
    80202c18:	557d                	li	a0,-1
    80202c1a:	fffff097          	auipc	ra,0xfffff
    80202c1e:	5b8080e7          	jalr	1464(ra) # 802021d2 <exit>
  if(which_dev == 2)
    80202c22:	4789                	li	a5,2
    80202c24:	f6f91ee3          	bne	s2,a5,80202ba0 <usertrap+0x62>
    yield();
    80202c28:	fffff097          	auipc	ra,0xfffff
    80202c2c:	6ce080e7          	jalr	1742(ra) # 802022f6 <yield>
    80202c30:	bf85                	j	80202ba0 <usertrap+0x62>
  int which_dev = 0;
    80202c32:	4901                	li	s2,0
    80202c34:	b7d5                	j	80202c18 <usertrap+0xda>

0000000080202c36 <kerneltrap>:
kerneltrap() {
    80202c36:	7179                	addi	sp,sp,-48
    80202c38:	f406                	sd	ra,40(sp)
    80202c3a:	f022                	sd	s0,32(sp)
    80202c3c:	ec26                	sd	s1,24(sp)
    80202c3e:	e84a                	sd	s2,16(sp)
    80202c40:	e44e                	sd	s3,8(sp)
    80202c42:	1800                	addi	s0,sp,48
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202c44:	14102973          	csrr	s2,sepc
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202c48:	100024f3          	csrr	s1,sstatus
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202c4c:	142029f3          	csrr	s3,scause
  if((sstatus & SSTATUS_SPP) == 0)
    80202c50:	1004f793          	andi	a5,s1,256
    80202c54:	cb85                	beqz	a5,80202c84 <kerneltrap+0x4e>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202c56:	100027f3          	csrr	a5,sstatus
  return (x & SSTATUS_SIE) != 0;
    80202c5a:	8b89                	andi	a5,a5,2
  if(intr_get() != 0)
    80202c5c:	ef85                	bnez	a5,80202c94 <kerneltrap+0x5e>
  if((which_dev = devintr()) == 0){
    80202c5e:	00000097          	auipc	ra,0x0
    80202c62:	e3c080e7          	jalr	-452(ra) # 80202a9a <devintr>
    80202c66:	cd1d                	beqz	a0,80202ca4 <kerneltrap+0x6e>
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING) {
    80202c68:	4789                	li	a5,2
    80202c6a:	08f50b63          	beq	a0,a5,80202d00 <kerneltrap+0xca>
  asm volatile("csrw sepc, %0" : : "r" (x));
    80202c6e:	14191073          	csrw	sepc,s2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202c72:	10049073          	csrw	sstatus,s1
}
    80202c76:	70a2                	ld	ra,40(sp)
    80202c78:	7402                	ld	s0,32(sp)
    80202c7a:	64e2                	ld	s1,24(sp)
    80202c7c:	6942                	ld	s2,16(sp)
    80202c7e:	69a2                	ld	s3,8(sp)
    80202c80:	6145                	addi	sp,sp,48
    80202c82:	8082                	ret
    panic("kerneltrap: not from supervisor mode");
    80202c84:	00007517          	auipc	a0,0x7
    80202c88:	b1c50513          	addi	a0,a0,-1252 # 802097a0 <digits+0x420>
    80202c8c:	ffffd097          	auipc	ra,0xffffd
    80202c90:	4b8080e7          	jalr	1208(ra) # 80200144 <panic>
    panic("kerneltrap: interrupts enabled");
    80202c94:	00007517          	auipc	a0,0x7
    80202c98:	b3450513          	addi	a0,a0,-1228 # 802097c8 <digits+0x448>
    80202c9c:	ffffd097          	auipc	ra,0xffffd
    80202ca0:	4a8080e7          	jalr	1192(ra) # 80200144 <panic>
    printf("\nscause %p\n", scause);
    80202ca4:	85ce                	mv	a1,s3
    80202ca6:	00007517          	auipc	a0,0x7
    80202caa:	b4250513          	addi	a0,a0,-1214 # 802097e8 <digits+0x468>
    80202cae:	ffffd097          	auipc	ra,0xffffd
    80202cb2:	4e0080e7          	jalr	1248(ra) # 8020018e <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202cb6:	141025f3          	csrr	a1,sepc
  asm volatile("csrr %0, stval" : "=r" (x) );
    80202cba:	14302673          	csrr	a2,stval
  asm volatile("mv %0, tp" : "=r" (x) );
    80202cbe:	8692                	mv	a3,tp
    printf("sepc=%p stval=%p hart=%d\n", r_sepc(), r_stval(), r_tp());
    80202cc0:	00007517          	auipc	a0,0x7
    80202cc4:	b3850513          	addi	a0,a0,-1224 # 802097f8 <digits+0x478>
    80202cc8:	ffffd097          	auipc	ra,0xffffd
    80202ccc:	4c6080e7          	jalr	1222(ra) # 8020018e <printf>
    struct proc *p = myproc();
    80202cd0:	fffff097          	auipc	ra,0xfffff
    80202cd4:	dbe080e7          	jalr	-578(ra) # 80201a8e <myproc>
    if (p != 0) {
    80202cd8:	cd01                	beqz	a0,80202cf0 <kerneltrap+0xba>
      printf("pid: %d, name: %s\n", p->pid, p->name);
    80202cda:	16050613          	addi	a2,a0,352
    80202cde:	5d0c                	lw	a1,56(a0)
    80202ce0:	00007517          	auipc	a0,0x7
    80202ce4:	b3850513          	addi	a0,a0,-1224 # 80209818 <digits+0x498>
    80202ce8:	ffffd097          	auipc	ra,0xffffd
    80202cec:	4a6080e7          	jalr	1190(ra) # 8020018e <printf>
    panic("kerneltrap");
    80202cf0:	00007517          	auipc	a0,0x7
    80202cf4:	b4050513          	addi	a0,a0,-1216 # 80209830 <digits+0x4b0>
    80202cf8:	ffffd097          	auipc	ra,0xffffd
    80202cfc:	44c080e7          	jalr	1100(ra) # 80200144 <panic>
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING) {
    80202d00:	fffff097          	auipc	ra,0xfffff
    80202d04:	d8e080e7          	jalr	-626(ra) # 80201a8e <myproc>
    80202d08:	d13d                	beqz	a0,80202c6e <kerneltrap+0x38>
    80202d0a:	fffff097          	auipc	ra,0xfffff
    80202d0e:	d84080e7          	jalr	-636(ra) # 80201a8e <myproc>
    80202d12:	4d18                	lw	a4,24(a0)
    80202d14:	478d                	li	a5,3
    80202d16:	f4f71ce3          	bne	a4,a5,80202c6e <kerneltrap+0x38>
    yield();
    80202d1a:	fffff097          	auipc	ra,0xfffff
    80202d1e:	5dc080e7          	jalr	1500(ra) # 802022f6 <yield>
    80202d22:	b7b1                	j	80202c6e <kerneltrap+0x38>

0000000080202d24 <trapframedump>:

void trapframedump(struct trapframe *tf)
{
    80202d24:	1101                	addi	sp,sp,-32
    80202d26:	ec06                	sd	ra,24(sp)
    80202d28:	e822                	sd	s0,16(sp)
    80202d2a:	e426                	sd	s1,8(sp)
    80202d2c:	1000                	addi	s0,sp,32
    80202d2e:	84aa                	mv	s1,a0
  printf("a0: %p\t", tf->a0);
    80202d30:	792c                	ld	a1,112(a0)
    80202d32:	00007517          	auipc	a0,0x7
    80202d36:	b0e50513          	addi	a0,a0,-1266 # 80209840 <digits+0x4c0>
    80202d3a:	ffffd097          	auipc	ra,0xffffd
    80202d3e:	454080e7          	jalr	1108(ra) # 8020018e <printf>
  printf("a1: %p\t", tf->a1);
    80202d42:	7cac                	ld	a1,120(s1)
    80202d44:	00007517          	auipc	a0,0x7
    80202d48:	b0450513          	addi	a0,a0,-1276 # 80209848 <digits+0x4c8>
    80202d4c:	ffffd097          	auipc	ra,0xffffd
    80202d50:	442080e7          	jalr	1090(ra) # 8020018e <printf>
  printf("a2: %p\t", tf->a2);
    80202d54:	60cc                	ld	a1,128(s1)
    80202d56:	00007517          	auipc	a0,0x7
    80202d5a:	afa50513          	addi	a0,a0,-1286 # 80209850 <digits+0x4d0>
    80202d5e:	ffffd097          	auipc	ra,0xffffd
    80202d62:	430080e7          	jalr	1072(ra) # 8020018e <printf>
  printf("a3: %p\n", tf->a3);
    80202d66:	64cc                	ld	a1,136(s1)
    80202d68:	00007517          	auipc	a0,0x7
    80202d6c:	af050513          	addi	a0,a0,-1296 # 80209858 <digits+0x4d8>
    80202d70:	ffffd097          	auipc	ra,0xffffd
    80202d74:	41e080e7          	jalr	1054(ra) # 8020018e <printf>
  printf("a4: %p\t", tf->a4);
    80202d78:	68cc                	ld	a1,144(s1)
    80202d7a:	00007517          	auipc	a0,0x7
    80202d7e:	ae650513          	addi	a0,a0,-1306 # 80209860 <digits+0x4e0>
    80202d82:	ffffd097          	auipc	ra,0xffffd
    80202d86:	40c080e7          	jalr	1036(ra) # 8020018e <printf>
  printf("a5: %p\t", tf->a5);
    80202d8a:	6ccc                	ld	a1,152(s1)
    80202d8c:	00007517          	auipc	a0,0x7
    80202d90:	adc50513          	addi	a0,a0,-1316 # 80209868 <digits+0x4e8>
    80202d94:	ffffd097          	auipc	ra,0xffffd
    80202d98:	3fa080e7          	jalr	1018(ra) # 8020018e <printf>
  printf("a6: %p\t", tf->a6);
    80202d9c:	70cc                	ld	a1,160(s1)
    80202d9e:	00007517          	auipc	a0,0x7
    80202da2:	ad250513          	addi	a0,a0,-1326 # 80209870 <digits+0x4f0>
    80202da6:	ffffd097          	auipc	ra,0xffffd
    80202daa:	3e8080e7          	jalr	1000(ra) # 8020018e <printf>
  printf("a7: %p\n", tf->a7);
    80202dae:	74cc                	ld	a1,168(s1)
    80202db0:	00007517          	auipc	a0,0x7
    80202db4:	ac850513          	addi	a0,a0,-1336 # 80209878 <digits+0x4f8>
    80202db8:	ffffd097          	auipc	ra,0xffffd
    80202dbc:	3d6080e7          	jalr	982(ra) # 8020018e <printf>
  printf("t0: %p\t", tf->t0);
    80202dc0:	64ac                	ld	a1,72(s1)
    80202dc2:	00007517          	auipc	a0,0x7
    80202dc6:	abe50513          	addi	a0,a0,-1346 # 80209880 <digits+0x500>
    80202dca:	ffffd097          	auipc	ra,0xffffd
    80202dce:	3c4080e7          	jalr	964(ra) # 8020018e <printf>
  printf("t1: %p\t", tf->t1);
    80202dd2:	68ac                	ld	a1,80(s1)
    80202dd4:	00007517          	auipc	a0,0x7
    80202dd8:	ab450513          	addi	a0,a0,-1356 # 80209888 <digits+0x508>
    80202ddc:	ffffd097          	auipc	ra,0xffffd
    80202de0:	3b2080e7          	jalr	946(ra) # 8020018e <printf>
  printf("t2: %p\t", tf->t2);
    80202de4:	6cac                	ld	a1,88(s1)
    80202de6:	00007517          	auipc	a0,0x7
    80202dea:	aaa50513          	addi	a0,a0,-1366 # 80209890 <digits+0x510>
    80202dee:	ffffd097          	auipc	ra,0xffffd
    80202df2:	3a0080e7          	jalr	928(ra) # 8020018e <printf>
  printf("t3: %p\n", tf->t3);
    80202df6:	1004b583          	ld	a1,256(s1)
    80202dfa:	00007517          	auipc	a0,0x7
    80202dfe:	a9e50513          	addi	a0,a0,-1378 # 80209898 <digits+0x518>
    80202e02:	ffffd097          	auipc	ra,0xffffd
    80202e06:	38c080e7          	jalr	908(ra) # 8020018e <printf>
  printf("t4: %p\t", tf->t4);
    80202e0a:	1084b583          	ld	a1,264(s1)
    80202e0e:	00007517          	auipc	a0,0x7
    80202e12:	a9250513          	addi	a0,a0,-1390 # 802098a0 <digits+0x520>
    80202e16:	ffffd097          	auipc	ra,0xffffd
    80202e1a:	378080e7          	jalr	888(ra) # 8020018e <printf>
  printf("t5: %p\t", tf->t5);
    80202e1e:	1104b583          	ld	a1,272(s1)
    80202e22:	00007517          	auipc	a0,0x7
    80202e26:	a8650513          	addi	a0,a0,-1402 # 802098a8 <digits+0x528>
    80202e2a:	ffffd097          	auipc	ra,0xffffd
    80202e2e:	364080e7          	jalr	868(ra) # 8020018e <printf>
  printf("t6: %p\t", tf->t6);
    80202e32:	1184b583          	ld	a1,280(s1)
    80202e36:	00007517          	auipc	a0,0x7
    80202e3a:	a7a50513          	addi	a0,a0,-1414 # 802098b0 <digits+0x530>
    80202e3e:	ffffd097          	auipc	ra,0xffffd
    80202e42:	350080e7          	jalr	848(ra) # 8020018e <printf>
  printf("s0: %p\n", tf->s0);
    80202e46:	70ac                	ld	a1,96(s1)
    80202e48:	00007517          	auipc	a0,0x7
    80202e4c:	a7050513          	addi	a0,a0,-1424 # 802098b8 <digits+0x538>
    80202e50:	ffffd097          	auipc	ra,0xffffd
    80202e54:	33e080e7          	jalr	830(ra) # 8020018e <printf>
  printf("s1: %p\t", tf->s1);
    80202e58:	74ac                	ld	a1,104(s1)
    80202e5a:	00007517          	auipc	a0,0x7
    80202e5e:	a6650513          	addi	a0,a0,-1434 # 802098c0 <digits+0x540>
    80202e62:	ffffd097          	auipc	ra,0xffffd
    80202e66:	32c080e7          	jalr	812(ra) # 8020018e <printf>
  printf("s2: %p\t", tf->s2);
    80202e6a:	78cc                	ld	a1,176(s1)
    80202e6c:	00007517          	auipc	a0,0x7
    80202e70:	a5c50513          	addi	a0,a0,-1444 # 802098c8 <digits+0x548>
    80202e74:	ffffd097          	auipc	ra,0xffffd
    80202e78:	31a080e7          	jalr	794(ra) # 8020018e <printf>
  printf("s3: %p\t", tf->s3);
    80202e7c:	7ccc                	ld	a1,184(s1)
    80202e7e:	00007517          	auipc	a0,0x7
    80202e82:	a5250513          	addi	a0,a0,-1454 # 802098d0 <digits+0x550>
    80202e86:	ffffd097          	auipc	ra,0xffffd
    80202e8a:	308080e7          	jalr	776(ra) # 8020018e <printf>
  printf("s4: %p\n", tf->s4);
    80202e8e:	60ec                	ld	a1,192(s1)
    80202e90:	00007517          	auipc	a0,0x7
    80202e94:	a4850513          	addi	a0,a0,-1464 # 802098d8 <digits+0x558>
    80202e98:	ffffd097          	auipc	ra,0xffffd
    80202e9c:	2f6080e7          	jalr	758(ra) # 8020018e <printf>
  printf("s5: %p\t", tf->s5);
    80202ea0:	64ec                	ld	a1,200(s1)
    80202ea2:	00007517          	auipc	a0,0x7
    80202ea6:	a3e50513          	addi	a0,a0,-1474 # 802098e0 <digits+0x560>
    80202eaa:	ffffd097          	auipc	ra,0xffffd
    80202eae:	2e4080e7          	jalr	740(ra) # 8020018e <printf>
  printf("s6: %p\t", tf->s6);
    80202eb2:	68ec                	ld	a1,208(s1)
    80202eb4:	00007517          	auipc	a0,0x7
    80202eb8:	a3450513          	addi	a0,a0,-1484 # 802098e8 <digits+0x568>
    80202ebc:	ffffd097          	auipc	ra,0xffffd
    80202ec0:	2d2080e7          	jalr	722(ra) # 8020018e <printf>
  printf("s7: %p\t", tf->s7);
    80202ec4:	6cec                	ld	a1,216(s1)
    80202ec6:	00007517          	auipc	a0,0x7
    80202eca:	a2a50513          	addi	a0,a0,-1494 # 802098f0 <digits+0x570>
    80202ece:	ffffd097          	auipc	ra,0xffffd
    80202ed2:	2c0080e7          	jalr	704(ra) # 8020018e <printf>
  printf("s8: %p\n", tf->s8);
    80202ed6:	70ec                	ld	a1,224(s1)
    80202ed8:	00007517          	auipc	a0,0x7
    80202edc:	a2050513          	addi	a0,a0,-1504 # 802098f8 <digits+0x578>
    80202ee0:	ffffd097          	auipc	ra,0xffffd
    80202ee4:	2ae080e7          	jalr	686(ra) # 8020018e <printf>
  printf("s9: %p\t", tf->s9);
    80202ee8:	74ec                	ld	a1,232(s1)
    80202eea:	00007517          	auipc	a0,0x7
    80202eee:	a1650513          	addi	a0,a0,-1514 # 80209900 <digits+0x580>
    80202ef2:	ffffd097          	auipc	ra,0xffffd
    80202ef6:	29c080e7          	jalr	668(ra) # 8020018e <printf>
  printf("s10: %p\t", tf->s10);
    80202efa:	78ec                	ld	a1,240(s1)
    80202efc:	00007517          	auipc	a0,0x7
    80202f00:	a0c50513          	addi	a0,a0,-1524 # 80209908 <digits+0x588>
    80202f04:	ffffd097          	auipc	ra,0xffffd
    80202f08:	28a080e7          	jalr	650(ra) # 8020018e <printf>
  printf("s11: %p\t", tf->s11);
    80202f0c:	7cec                	ld	a1,248(s1)
    80202f0e:	00007517          	auipc	a0,0x7
    80202f12:	a0a50513          	addi	a0,a0,-1526 # 80209918 <digits+0x598>
    80202f16:	ffffd097          	auipc	ra,0xffffd
    80202f1a:	278080e7          	jalr	632(ra) # 8020018e <printf>
  printf("ra: %p\n", tf->ra);
    80202f1e:	748c                	ld	a1,40(s1)
    80202f20:	00006517          	auipc	a0,0x6
    80202f24:	6f050513          	addi	a0,a0,1776 # 80209610 <digits+0x290>
    80202f28:	ffffd097          	auipc	ra,0xffffd
    80202f2c:	266080e7          	jalr	614(ra) # 8020018e <printf>
  printf("sp: %p\t", tf->sp);
    80202f30:	788c                	ld	a1,48(s1)
    80202f32:	00007517          	auipc	a0,0x7
    80202f36:	9f650513          	addi	a0,a0,-1546 # 80209928 <digits+0x5a8>
    80202f3a:	ffffd097          	auipc	ra,0xffffd
    80202f3e:	254080e7          	jalr	596(ra) # 8020018e <printf>
  printf("gp: %p\t", tf->gp);
    80202f42:	7c8c                	ld	a1,56(s1)
    80202f44:	00007517          	auipc	a0,0x7
    80202f48:	9ec50513          	addi	a0,a0,-1556 # 80209930 <digits+0x5b0>
    80202f4c:	ffffd097          	auipc	ra,0xffffd
    80202f50:	242080e7          	jalr	578(ra) # 8020018e <printf>
  printf("tp: %p\t", tf->tp);
    80202f54:	60ac                	ld	a1,64(s1)
    80202f56:	00007517          	auipc	a0,0x7
    80202f5a:	9e250513          	addi	a0,a0,-1566 # 80209938 <digits+0x5b8>
    80202f5e:	ffffd097          	auipc	ra,0xffffd
    80202f62:	230080e7          	jalr	560(ra) # 8020018e <printf>
  printf("epc: %p\n", tf->epc);
    80202f66:	6c8c                	ld	a1,24(s1)
    80202f68:	00007517          	auipc	a0,0x7
    80202f6c:	9d850513          	addi	a0,a0,-1576 # 80209940 <digits+0x5c0>
    80202f70:	ffffd097          	auipc	ra,0xffffd
    80202f74:	21e080e7          	jalr	542(ra) # 8020018e <printf>
}
    80202f78:	60e2                	ld	ra,24(sp)
    80202f7a:	6442                	ld	s0,16(sp)
    80202f7c:	64a2                	ld	s1,8(sp)
    80202f7e:	6105                	addi	sp,sp,32
    80202f80:	8082                	ret

0000000080202f82 <argraw>:
  return strlen(buf);
}

static uint64
argraw(int n)
{
    80202f82:	1101                	addi	sp,sp,-32
    80202f84:	ec06                	sd	ra,24(sp)
    80202f86:	e822                	sd	s0,16(sp)
    80202f88:	e426                	sd	s1,8(sp)
    80202f8a:	1000                	addi	s0,sp,32
    80202f8c:	84aa                	mv	s1,a0
  struct proc *p = myproc();
    80202f8e:	fffff097          	auipc	ra,0xfffff
    80202f92:	b00080e7          	jalr	-1280(ra) # 80201a8e <myproc>
  switch (n) {
    80202f96:	4795                	li	a5,5
    80202f98:	0497e163          	bltu	a5,s1,80202fda <argraw+0x58>
    80202f9c:	048a                	slli	s1,s1,0x2
    80202f9e:	00007717          	auipc	a4,0x7
    80202fa2:	b6270713          	addi	a4,a4,-1182 # 80209b00 <digits+0x780>
    80202fa6:	94ba                	add	s1,s1,a4
    80202fa8:	409c                	lw	a5,0(s1)
    80202faa:	97ba                	add	a5,a5,a4
    80202fac:	8782                	jr	a5
  case 0:
    return p->trapframe->a0;
    80202fae:	713c                	ld	a5,96(a0)
    80202fb0:	7ba8                	ld	a0,112(a5)
  case 5:
    return p->trapframe->a5;
  }
  panic("argraw");
  return -1;
}
    80202fb2:	60e2                	ld	ra,24(sp)
    80202fb4:	6442                	ld	s0,16(sp)
    80202fb6:	64a2                	ld	s1,8(sp)
    80202fb8:	6105                	addi	sp,sp,32
    80202fba:	8082                	ret
    return p->trapframe->a1;
    80202fbc:	713c                	ld	a5,96(a0)
    80202fbe:	7fa8                	ld	a0,120(a5)
    80202fc0:	bfcd                	j	80202fb2 <argraw+0x30>
    return p->trapframe->a2;
    80202fc2:	713c                	ld	a5,96(a0)
    80202fc4:	63c8                	ld	a0,128(a5)
    80202fc6:	b7f5                	j	80202fb2 <argraw+0x30>
    return p->trapframe->a3;
    80202fc8:	713c                	ld	a5,96(a0)
    80202fca:	67c8                	ld	a0,136(a5)
    80202fcc:	b7dd                	j	80202fb2 <argraw+0x30>
    return p->trapframe->a4;
    80202fce:	713c                	ld	a5,96(a0)
    80202fd0:	6bc8                	ld	a0,144(a5)
    80202fd2:	b7c5                	j	80202fb2 <argraw+0x30>
    return p->trapframe->a5;
    80202fd4:	713c                	ld	a5,96(a0)
    80202fd6:	6fc8                	ld	a0,152(a5)
    80202fd8:	bfe9                	j	80202fb2 <argraw+0x30>
  panic("argraw");
    80202fda:	00007517          	auipc	a0,0x7
    80202fde:	97650513          	addi	a0,a0,-1674 # 80209950 <digits+0x5d0>
    80202fe2:	ffffd097          	auipc	ra,0xffffd
    80202fe6:	162080e7          	jalr	354(ra) # 80200144 <panic>

0000000080202fea <sys_sysinfo>:
    return 0;
}

uint64
sys_sysinfo(void)
{
    80202fea:	7179                	addi	sp,sp,-48
    80202fec:	f406                	sd	ra,40(sp)
    80202fee:	f022                	sd	s0,32(sp)
    80202ff0:	ec26                	sd	s1,24(sp)
    80202ff2:	1800                	addi	s0,sp,48
  *ip = argraw(n);
    80202ff4:	4501                	li	a0,0
    80202ff6:	00000097          	auipc	ra,0x0
    80202ffa:	f8c080e7          	jalr	-116(ra) # 80202f82 <argraw>
    80202ffe:	84aa                	mv	s1,a0
  if (argaddr(0, &addr) < 0) {
    return -1;
  }

  struct sysinfo info;
  info.freemem = freemem_amount();
    80203000:	ffffd097          	auipc	ra,0xffffd
    80203004:	5c0080e7          	jalr	1472(ra) # 802005c0 <freemem_amount>
    80203008:	fca43823          	sd	a0,-48(s0)
  info.nproc = procnum();
    8020300c:	fffff097          	auipc	ra,0xfffff
    80203010:	69a080e7          	jalr	1690(ra) # 802026a6 <procnum>
    80203014:	fca43c23          	sd	a0,-40(s0)

  // if (copyout(p->pagetable, addr, (char *)&info, sizeof(info)) < 0) {
  if (copyout2(addr, (char *)&info, sizeof(info)) < 0) {
    80203018:	4641                	li	a2,16
    8020301a:	fd040593          	addi	a1,s0,-48
    8020301e:	8526                	mv	a0,s1
    80203020:	ffffe097          	auipc	ra,0xffffe
    80203024:	352080e7          	jalr	850(ra) # 80201372 <copyout2>
    return -1;
  }

  return 0;
}
    80203028:	957d                	srai	a0,a0,0x3f
    8020302a:	70a2                	ld	ra,40(sp)
    8020302c:	7402                	ld	s0,32(sp)
    8020302e:	64e2                	ld	s1,24(sp)
    80203030:	6145                	addi	sp,sp,48
    80203032:	8082                	ret

0000000080203034 <fetchaddr>:
{
    80203034:	1101                	addi	sp,sp,-32
    80203036:	ec06                	sd	ra,24(sp)
    80203038:	e822                	sd	s0,16(sp)
    8020303a:	e426                	sd	s1,8(sp)
    8020303c:	e04a                	sd	s2,0(sp)
    8020303e:	1000                	addi	s0,sp,32
    80203040:	84aa                	mv	s1,a0
    80203042:	892e                	mv	s2,a1
  struct proc *p = myproc();
    80203044:	fffff097          	auipc	ra,0xfffff
    80203048:	a4a080e7          	jalr	-1462(ra) # 80201a8e <myproc>
  if(addr >= p->sz || addr+sizeof(uint64) > p->sz)
    8020304c:	653c                	ld	a5,72(a0)
    8020304e:	02f4f763          	bgeu	s1,a5,8020307c <fetchaddr+0x48>
    80203052:	00848713          	addi	a4,s1,8
    80203056:	02e7e563          	bltu	a5,a4,80203080 <fetchaddr+0x4c>
  if(copyin2((char *)ip, addr, sizeof(*ip)) != 0)
    8020305a:	4621                	li	a2,8
    8020305c:	85a6                	mv	a1,s1
    8020305e:	854a                	mv	a0,s2
    80203060:	ffffe097          	auipc	ra,0xffffe
    80203064:	444080e7          	jalr	1092(ra) # 802014a4 <copyin2>
    80203068:	00a03533          	snez	a0,a0
    8020306c:	40a00533          	neg	a0,a0
}
    80203070:	60e2                	ld	ra,24(sp)
    80203072:	6442                	ld	s0,16(sp)
    80203074:	64a2                	ld	s1,8(sp)
    80203076:	6902                	ld	s2,0(sp)
    80203078:	6105                	addi	sp,sp,32
    8020307a:	8082                	ret
    return -1;
    8020307c:	557d                	li	a0,-1
    8020307e:	bfcd                	j	80203070 <fetchaddr+0x3c>
    80203080:	557d                	li	a0,-1
    80203082:	b7fd                	j	80203070 <fetchaddr+0x3c>

0000000080203084 <fetchstr>:
{
    80203084:	1101                	addi	sp,sp,-32
    80203086:	ec06                	sd	ra,24(sp)
    80203088:	e822                	sd	s0,16(sp)
    8020308a:	e426                	sd	s1,8(sp)
    8020308c:	1000                	addi	s0,sp,32
    8020308e:	84ae                	mv	s1,a1
  int err = copyinstr2(buf, addr, max);
    80203090:	85aa                	mv	a1,a0
    80203092:	8526                	mv	a0,s1
    80203094:	ffffe097          	auipc	ra,0xffffe
    80203098:	512080e7          	jalr	1298(ra) # 802015a6 <copyinstr2>
  if(err < 0)
    8020309c:	00054763          	bltz	a0,802030aa <fetchstr+0x26>
  return strlen(buf);
    802030a0:	8526                	mv	a0,s1
    802030a2:	ffffe097          	auipc	ra,0xffffe
    802030a6:	844080e7          	jalr	-1980(ra) # 802008e6 <strlen>
}
    802030aa:	60e2                	ld	ra,24(sp)
    802030ac:	6442                	ld	s0,16(sp)
    802030ae:	64a2                	ld	s1,8(sp)
    802030b0:	6105                	addi	sp,sp,32
    802030b2:	8082                	ret

00000000802030b4 <argint>:
{
    802030b4:	1101                	addi	sp,sp,-32
    802030b6:	ec06                	sd	ra,24(sp)
    802030b8:	e822                	sd	s0,16(sp)
    802030ba:	e426                	sd	s1,8(sp)
    802030bc:	1000                	addi	s0,sp,32
    802030be:	84ae                	mv	s1,a1
  *ip = argraw(n);
    802030c0:	00000097          	auipc	ra,0x0
    802030c4:	ec2080e7          	jalr	-318(ra) # 80202f82 <argraw>
    802030c8:	c088                	sw	a0,0(s1)
}
    802030ca:	4501                	li	a0,0
    802030cc:	60e2                	ld	ra,24(sp)
    802030ce:	6442                	ld	s0,16(sp)
    802030d0:	64a2                	ld	s1,8(sp)
    802030d2:	6105                	addi	sp,sp,32
    802030d4:	8082                	ret

00000000802030d6 <sys_test_proc>:
sys_test_proc(void) {
    802030d6:	1101                	addi	sp,sp,-32
    802030d8:	ec06                	sd	ra,24(sp)
    802030da:	e822                	sd	s0,16(sp)
    802030dc:	1000                	addi	s0,sp,32
    argint(0, &n);
    802030de:	fec40593          	addi	a1,s0,-20
    802030e2:	4501                	li	a0,0
    802030e4:	00000097          	auipc	ra,0x0
    802030e8:	fd0080e7          	jalr	-48(ra) # 802030b4 <argint>
    printf("hello world from proc %d, hart %d, arg %d\n", myproc()->pid, r_tp(), n);
    802030ec:	fffff097          	auipc	ra,0xfffff
    802030f0:	9a2080e7          	jalr	-1630(ra) # 80201a8e <myproc>
    802030f4:	8612                	mv	a2,tp
    802030f6:	fec42683          	lw	a3,-20(s0)
    802030fa:	5d0c                	lw	a1,56(a0)
    802030fc:	00007517          	auipc	a0,0x7
    80203100:	85c50513          	addi	a0,a0,-1956 # 80209958 <digits+0x5d8>
    80203104:	ffffd097          	auipc	ra,0xffffd
    80203108:	08a080e7          	jalr	138(ra) # 8020018e <printf>
}
    8020310c:	4501                	li	a0,0
    8020310e:	60e2                	ld	ra,24(sp)
    80203110:	6442                	ld	s0,16(sp)
    80203112:	6105                	addi	sp,sp,32
    80203114:	8082                	ret

0000000080203116 <argaddr>:
{
    80203116:	1101                	addi	sp,sp,-32
    80203118:	ec06                	sd	ra,24(sp)
    8020311a:	e822                	sd	s0,16(sp)
    8020311c:	e426                	sd	s1,8(sp)
    8020311e:	1000                	addi	s0,sp,32
    80203120:	84ae                	mv	s1,a1
  *ip = argraw(n);
    80203122:	00000097          	auipc	ra,0x0
    80203126:	e60080e7          	jalr	-416(ra) # 80202f82 <argraw>
    8020312a:	e088                	sd	a0,0(s1)
}
    8020312c:	4501                	li	a0,0
    8020312e:	60e2                	ld	ra,24(sp)
    80203130:	6442                	ld	s0,16(sp)
    80203132:	64a2                	ld	s1,8(sp)
    80203134:	6105                	addi	sp,sp,32
    80203136:	8082                	ret

0000000080203138 <argstr>:
{
    80203138:	1101                	addi	sp,sp,-32
    8020313a:	ec06                	sd	ra,24(sp)
    8020313c:	e822                	sd	s0,16(sp)
    8020313e:	e426                	sd	s1,8(sp)
    80203140:	e04a                	sd	s2,0(sp)
    80203142:	1000                	addi	s0,sp,32
    80203144:	84ae                	mv	s1,a1
    80203146:	8932                	mv	s2,a2
  *ip = argraw(n);
    80203148:	00000097          	auipc	ra,0x0
    8020314c:	e3a080e7          	jalr	-454(ra) # 80202f82 <argraw>
  return fetchstr(addr, buf, max);
    80203150:	864a                	mv	a2,s2
    80203152:	85a6                	mv	a1,s1
    80203154:	00000097          	auipc	ra,0x0
    80203158:	f30080e7          	jalr	-208(ra) # 80203084 <fetchstr>
}
    8020315c:	60e2                	ld	ra,24(sp)
    8020315e:	6442                	ld	s0,16(sp)
    80203160:	64a2                	ld	s1,8(sp)
    80203162:	6902                	ld	s2,0(sp)
    80203164:	6105                	addi	sp,sp,32
    80203166:	8082                	ret

0000000080203168 <syscall>:
{
    80203168:	7179                	addi	sp,sp,-48
    8020316a:	f406                	sd	ra,40(sp)
    8020316c:	f022                	sd	s0,32(sp)
    8020316e:	ec26                	sd	s1,24(sp)
    80203170:	e84a                	sd	s2,16(sp)
    80203172:	e44e                	sd	s3,8(sp)
    80203174:	1800                	addi	s0,sp,48
  struct proc *p = myproc();
    80203176:	fffff097          	auipc	ra,0xfffff
    8020317a:	918080e7          	jalr	-1768(ra) # 80201a8e <myproc>
    8020317e:	84aa                	mv	s1,a0
  num = p->trapframe->a7;
    80203180:	06053903          	ld	s2,96(a0)
    80203184:	0a893783          	ld	a5,168(s2)
    80203188:	0007899b          	sext.w	s3,a5
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    8020318c:	37fd                	addiw	a5,a5,-1
    8020318e:	10300713          	li	a4,259
    80203192:	04f76763          	bltu	a4,a5,802031e0 <syscall+0x78>
    80203196:	00399713          	slli	a4,s3,0x3
    8020319a:	00009797          	auipc	a5,0x9
    8020319e:	ab678793          	addi	a5,a5,-1354 # 8020bc50 <syscalls>
    802031a2:	97ba                	add	a5,a5,a4
    802031a4:	639c                	ld	a5,0(a5)
    802031a6:	cf8d                	beqz	a5,802031e0 <syscall+0x78>
    p->trapframe->a0 = syscalls[num]();
    802031a8:	9782                	jalr	a5
    802031aa:	06a93823          	sd	a0,112(s2)
    if ((p->tmask & (1 << num)) != 0) {
    802031ae:	1704a783          	lw	a5,368(s1)
    802031b2:	4137d7bb          	sraw	a5,a5,s3
    802031b6:	8b85                	andi	a5,a5,1
    802031b8:	c3b9                	beqz	a5,802031fe <syscall+0x96>
      printf("pid %d: %s -> %d\n", p->pid, sysnames[num], p->trapframe->a0);
    802031ba:	70b8                	ld	a4,96(s1)
    802031bc:	098e                	slli	s3,s3,0x3
    802031be:	00009797          	auipc	a5,0x9
    802031c2:	2ba78793          	addi	a5,a5,698 # 8020c478 <sysnames>
    802031c6:	97ce                	add	a5,a5,s3
    802031c8:	7b34                	ld	a3,112(a4)
    802031ca:	6390                	ld	a2,0(a5)
    802031cc:	5c8c                	lw	a1,56(s1)
    802031ce:	00006517          	auipc	a0,0x6
    802031d2:	7ba50513          	addi	a0,a0,1978 # 80209988 <digits+0x608>
    802031d6:	ffffd097          	auipc	ra,0xffffd
    802031da:	fb8080e7          	jalr	-72(ra) # 8020018e <printf>
    802031de:	a005                	j	802031fe <syscall+0x96>
    printf("pid %d %s: unknown sys call %d\n",
    802031e0:	86ce                	mv	a3,s3
    802031e2:	16048613          	addi	a2,s1,352
    802031e6:	5c8c                	lw	a1,56(s1)
    802031e8:	00006517          	auipc	a0,0x6
    802031ec:	7b850513          	addi	a0,a0,1976 # 802099a0 <digits+0x620>
    802031f0:	ffffd097          	auipc	ra,0xffffd
    802031f4:	f9e080e7          	jalr	-98(ra) # 8020018e <printf>
    p->trapframe->a0 = -1;
    802031f8:	70bc                	ld	a5,96(s1)
    802031fa:	577d                	li	a4,-1
    802031fc:	fbb8                	sd	a4,112(a5)
}
    802031fe:	70a2                	ld	ra,40(sp)
    80203200:	7402                	ld	s0,32(sp)
    80203202:	64e2                	ld	s1,24(sp)
    80203204:	6942                	ld	s2,16(sp)
    80203206:	69a2                	ld	s3,8(sp)
    80203208:	6145                	addi	sp,sp,48
    8020320a:	8082                	ret

000000008020320c <sys_exec>:

extern int exec(char *path, char **argv);

uint64
sys_exec(void)
{
    8020320c:	d9010113          	addi	sp,sp,-624
    80203210:	26113423          	sd	ra,616(sp)
    80203214:	26813023          	sd	s0,608(sp)
    80203218:	24913c23          	sd	s1,600(sp)
    8020321c:	25213823          	sd	s2,592(sp)
    80203220:	25313423          	sd	s3,584(sp)
    80203224:	25413023          	sd	s4,576(sp)
    80203228:	23513c23          	sd	s5,568(sp)
    8020322c:	23613823          	sd	s6,560(sp)
    80203230:	23713423          	sd	s7,552(sp)
    80203234:	1c80                	addi	s0,sp,624
  char path[FAT32_MAX_PATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    80203236:	10400613          	li	a2,260
    8020323a:	ea840593          	addi	a1,s0,-344
    8020323e:	4501                	li	a0,0
    80203240:	00000097          	auipc	ra,0x0
    80203244:	ef8080e7          	jalr	-264(ra) # 80203138 <argstr>
    return -1;
    80203248:	597d                	li	s2,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    8020324a:	0c054c63          	bltz	a0,80203322 <sys_exec+0x116>
    8020324e:	da040593          	addi	a1,s0,-608
    80203252:	4505                	li	a0,1
    80203254:	00000097          	auipc	ra,0x0
    80203258:	ec2080e7          	jalr	-318(ra) # 80203116 <argaddr>
    8020325c:	0c054363          	bltz	a0,80203322 <sys_exec+0x116>
  }
  memset(argv, 0, sizeof(argv));
    80203260:	da840a13          	addi	s4,s0,-600
    80203264:	10000613          	li	a2,256
    80203268:	4581                	li	a1,0
    8020326a:	8552                	mv	a0,s4
    8020326c:	ffffd097          	auipc	ra,0xffffd
    80203270:	4f6080e7          	jalr	1270(ra) # 80200762 <memset>
  for(i=0;; i++){
    if(i >= NELEM(argv)){
    80203274:	84d2                	mv	s1,s4
  memset(argv, 0, sizeof(argv));
    80203276:	89d2                	mv	s3,s4
    80203278:	4901                	li	s2,0
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    8020327a:	d9840a93          	addi	s5,s0,-616
    if(i >= NELEM(argv)){
    8020327e:	02000b13          	li	s6,32
    80203282:	00090b9b          	sext.w	s7,s2
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    80203286:	00391513          	slli	a0,s2,0x3
    8020328a:	85d6                	mv	a1,s5
    8020328c:	da043783          	ld	a5,-608(s0)
    80203290:	953e                	add	a0,a0,a5
    80203292:	00000097          	auipc	ra,0x0
    80203296:	da2080e7          	jalr	-606(ra) # 80203034 <fetchaddr>
    8020329a:	02054a63          	bltz	a0,802032ce <sys_exec+0xc2>
      goto bad;
    }
    if(uarg == 0){
    8020329e:	d9843783          	ld	a5,-616(s0)
    802032a2:	c3b9                	beqz	a5,802032e8 <sys_exec+0xdc>
      argv[i] = 0;
      break;
    }
    argv[i] = kalloc();
    802032a4:	ffffd097          	auipc	ra,0xffffd
    802032a8:	2b6080e7          	jalr	694(ra) # 8020055a <kalloc>
    802032ac:	85aa                	mv	a1,a0
    802032ae:	00a9b023          	sd	a0,0(s3)
    if(argv[i] == 0)
    802032b2:	cd11                	beqz	a0,802032ce <sys_exec+0xc2>
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    802032b4:	6605                	lui	a2,0x1
    802032b6:	d9843503          	ld	a0,-616(s0)
    802032ba:	00000097          	auipc	ra,0x0
    802032be:	dca080e7          	jalr	-566(ra) # 80203084 <fetchstr>
    802032c2:	00054663          	bltz	a0,802032ce <sys_exec+0xc2>
    if(i >= NELEM(argv)){
    802032c6:	0905                	addi	s2,s2,1
    802032c8:	09a1                	addi	s3,s3,8
    802032ca:	fb691ce3          	bne	s2,s6,80203282 <sys_exec+0x76>
    kfree(argv[i]);

  return ret;

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    802032ce:	100a0a13          	addi	s4,s4,256
    802032d2:	6088                	ld	a0,0(s1)
    802032d4:	c531                	beqz	a0,80203320 <sys_exec+0x114>
    kfree(argv[i]);
    802032d6:	ffffd097          	auipc	ra,0xffffd
    802032da:	16a080e7          	jalr	362(ra) # 80200440 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    802032de:	04a1                	addi	s1,s1,8
    802032e0:	ff4499e3          	bne	s1,s4,802032d2 <sys_exec+0xc6>
  return -1;
    802032e4:	597d                	li	s2,-1
    802032e6:	a835                	j	80203322 <sys_exec+0x116>
      argv[i] = 0;
    802032e8:	0b8e                	slli	s7,s7,0x3
    802032ea:	fb0b8793          	addi	a5,s7,-80
    802032ee:	00878bb3          	add	s7,a5,s0
    802032f2:	de0bbc23          	sd	zero,-520(s7)
  int ret = exec(path, argv);
    802032f6:	da840593          	addi	a1,s0,-600
    802032fa:	ea840513          	addi	a0,s0,-344
    802032fe:	00001097          	auipc	ra,0x1
    80203302:	314080e7          	jalr	788(ra) # 80204612 <exec>
    80203306:	892a                	mv	s2,a0
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80203308:	100a0a13          	addi	s4,s4,256
    8020330c:	6088                	ld	a0,0(s1)
    8020330e:	c911                	beqz	a0,80203322 <sys_exec+0x116>
    kfree(argv[i]);
    80203310:	ffffd097          	auipc	ra,0xffffd
    80203314:	130080e7          	jalr	304(ra) # 80200440 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80203318:	04a1                	addi	s1,s1,8
    8020331a:	ff4499e3          	bne	s1,s4,8020330c <sys_exec+0x100>
    8020331e:	a011                	j	80203322 <sys_exec+0x116>
  return -1;
    80203320:	597d                	li	s2,-1
}
    80203322:	854a                	mv	a0,s2
    80203324:	26813083          	ld	ra,616(sp)
    80203328:	26013403          	ld	s0,608(sp)
    8020332c:	25813483          	ld	s1,600(sp)
    80203330:	25013903          	ld	s2,592(sp)
    80203334:	24813983          	ld	s3,584(sp)
    80203338:	24013a03          	ld	s4,576(sp)
    8020333c:	23813a83          	ld	s5,568(sp)
    80203340:	23013b03          	ld	s6,560(sp)
    80203344:	22813b83          	ld	s7,552(sp)
    80203348:	27010113          	addi	sp,sp,624
    8020334c:	8082                	ret

000000008020334e <sys_exit>:

uint64
sys_exit(void)
{
    8020334e:	1101                	addi	sp,sp,-32
    80203350:	ec06                	sd	ra,24(sp)
    80203352:	e822                	sd	s0,16(sp)
    80203354:	1000                	addi	s0,sp,32
  int n;
  if(argint(0, &n) < 0)
    80203356:	fec40593          	addi	a1,s0,-20
    8020335a:	4501                	li	a0,0
    8020335c:	00000097          	auipc	ra,0x0
    80203360:	d58080e7          	jalr	-680(ra) # 802030b4 <argint>
    return -1;
    80203364:	57fd                	li	a5,-1
  if(argint(0, &n) < 0)
    80203366:	00054963          	bltz	a0,80203378 <sys_exit+0x2a>
  exit(n);
    8020336a:	fec42503          	lw	a0,-20(s0)
    8020336e:	fffff097          	auipc	ra,0xfffff
    80203372:	e64080e7          	jalr	-412(ra) # 802021d2 <exit>
  return 0;  // not reached
    80203376:	4781                	li	a5,0
}
    80203378:	853e                	mv	a0,a5
    8020337a:	60e2                	ld	ra,24(sp)
    8020337c:	6442                	ld	s0,16(sp)
    8020337e:	6105                	addi	sp,sp,32
    80203380:	8082                	ret

0000000080203382 <sys_getpid>:

uint64
sys_getpid(void)
{
    80203382:	1141                	addi	sp,sp,-16
    80203384:	e406                	sd	ra,8(sp)
    80203386:	e022                	sd	s0,0(sp)
    80203388:	0800                	addi	s0,sp,16
  return myproc()->pid;
    8020338a:	ffffe097          	auipc	ra,0xffffe
    8020338e:	704080e7          	jalr	1796(ra) # 80201a8e <myproc>
}
    80203392:	5d08                	lw	a0,56(a0)
    80203394:	60a2                	ld	ra,8(sp)
    80203396:	6402                	ld	s0,0(sp)
    80203398:	0141                	addi	sp,sp,16
    8020339a:	8082                	ret

000000008020339c <sys_fork>:

uint64
sys_fork(void)
{
    8020339c:	1141                	addi	sp,sp,-16
    8020339e:	e406                	sd	ra,8(sp)
    802033a0:	e022                	sd	s0,0(sp)
    802033a2:	0800                	addi	s0,sp,16
  return fork();
    802033a4:	fffff097          	auipc	ra,0xfffff
    802033a8:	af0080e7          	jalr	-1296(ra) # 80201e94 <fork>
}
    802033ac:	60a2                	ld	ra,8(sp)
    802033ae:	6402                	ld	s0,0(sp)
    802033b0:	0141                	addi	sp,sp,16
    802033b2:	8082                	ret

00000000802033b4 <sys_wait>:

uint64
sys_wait(void)
{
    802033b4:	1101                	addi	sp,sp,-32
    802033b6:	ec06                	sd	ra,24(sp)
    802033b8:	e822                	sd	s0,16(sp)
    802033ba:	1000                	addi	s0,sp,32
  uint64 p;
  if(argaddr(0, &p) < 0)
    802033bc:	fe840593          	addi	a1,s0,-24
    802033c0:	4501                	li	a0,0
    802033c2:	00000097          	auipc	ra,0x0
    802033c6:	d54080e7          	jalr	-684(ra) # 80203116 <argaddr>
    802033ca:	87aa                	mv	a5,a0
    return -1;
    802033cc:	557d                	li	a0,-1
  if(argaddr(0, &p) < 0)
    802033ce:	0007c863          	bltz	a5,802033de <sys_wait+0x2a>
  return wait(p);
    802033d2:	fe843503          	ld	a0,-24(s0)
    802033d6:	fffff097          	auipc	ra,0xfffff
    802033da:	fda080e7          	jalr	-38(ra) # 802023b0 <wait>
}
    802033de:	60e2                	ld	ra,24(sp)
    802033e0:	6442                	ld	s0,16(sp)
    802033e2:	6105                	addi	sp,sp,32
    802033e4:	8082                	ret

00000000802033e6 <sys_sbrk>:

uint64
sys_sbrk(void)
{
    802033e6:	7179                	addi	sp,sp,-48
    802033e8:	f406                	sd	ra,40(sp)
    802033ea:	f022                	sd	s0,32(sp)
    802033ec:	ec26                	sd	s1,24(sp)
    802033ee:	1800                	addi	s0,sp,48
  int addr;
  int n;

  if(argint(0, &n) < 0)
    802033f0:	fdc40593          	addi	a1,s0,-36
    802033f4:	4501                	li	a0,0
    802033f6:	00000097          	auipc	ra,0x0
    802033fa:	cbe080e7          	jalr	-834(ra) # 802030b4 <argint>
    802033fe:	87aa                	mv	a5,a0
    return -1;
    80203400:	557d                	li	a0,-1
  if(argint(0, &n) < 0)
    80203402:	0207c063          	bltz	a5,80203422 <sys_sbrk+0x3c>
  addr = myproc()->sz;
    80203406:	ffffe097          	auipc	ra,0xffffe
    8020340a:	688080e7          	jalr	1672(ra) # 80201a8e <myproc>
    8020340e:	4524                	lw	s1,72(a0)
  if(growproc(n) < 0)
    80203410:	fdc42503          	lw	a0,-36(s0)
    80203414:	fffff097          	auipc	ra,0xfffff
    80203418:	a04080e7          	jalr	-1532(ra) # 80201e18 <growproc>
    8020341c:	00054863          	bltz	a0,8020342c <sys_sbrk+0x46>
    return -1;
  return addr;
    80203420:	8526                	mv	a0,s1
}
    80203422:	70a2                	ld	ra,40(sp)
    80203424:	7402                	ld	s0,32(sp)
    80203426:	64e2                	ld	s1,24(sp)
    80203428:	6145                	addi	sp,sp,48
    8020342a:	8082                	ret
    return -1;
    8020342c:	557d                	li	a0,-1
    8020342e:	bfd5                	j	80203422 <sys_sbrk+0x3c>

0000000080203430 <sys_sleep>:

uint64
sys_sleep(void)
{
    80203430:	7139                	addi	sp,sp,-64
    80203432:	fc06                	sd	ra,56(sp)
    80203434:	f822                	sd	s0,48(sp)
    80203436:	f426                	sd	s1,40(sp)
    80203438:	f04a                	sd	s2,32(sp)
    8020343a:	ec4e                	sd	s3,24(sp)
    8020343c:	0080                	addi	s0,sp,64
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    8020343e:	fcc40593          	addi	a1,s0,-52
    80203442:	4501                	li	a0,0
    80203444:	00000097          	auipc	ra,0x0
    80203448:	c70080e7          	jalr	-912(ra) # 802030b4 <argint>
    return -1;
    8020344c:	57fd                	li	a5,-1
  if(argint(0, &n) < 0)
    8020344e:	06054763          	bltz	a0,802034bc <sys_sleep+0x8c>
  acquire(&tickslock);
    80203452:	0000a517          	auipc	a0,0xa
    80203456:	89653503          	ld	a0,-1898(a0) # 8020cce8 <_GLOBAL_OFFSET_TABLE_+0x30>
    8020345a:	ffffd097          	auipc	ra,0xffffd
    8020345e:	26c080e7          	jalr	620(ra) # 802006c6 <acquire>
  ticks0 = ticks;
    80203462:	0000a797          	auipc	a5,0xa
    80203466:	8967b783          	ld	a5,-1898(a5) # 8020ccf8 <_GLOBAL_OFFSET_TABLE_+0x40>
    8020346a:	0007a903          	lw	s2,0(a5)
  while(ticks - ticks0 < n){
    8020346e:	fcc42783          	lw	a5,-52(s0)
    80203472:	cf85                	beqz	a5,802034aa <sys_sleep+0x7a>
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
    80203474:	0000a997          	auipc	s3,0xa
    80203478:	8749b983          	ld	s3,-1932(s3) # 8020cce8 <_GLOBAL_OFFSET_TABLE_+0x30>
    8020347c:	0000a497          	auipc	s1,0xa
    80203480:	87c4b483          	ld	s1,-1924(s1) # 8020ccf8 <_GLOBAL_OFFSET_TABLE_+0x40>
    if(myproc()->killed){
    80203484:	ffffe097          	auipc	ra,0xffffe
    80203488:	60a080e7          	jalr	1546(ra) # 80201a8e <myproc>
    8020348c:	591c                	lw	a5,48(a0)
    8020348e:	ef9d                	bnez	a5,802034cc <sys_sleep+0x9c>
    sleep(&ticks, &tickslock);
    80203490:	85ce                	mv	a1,s3
    80203492:	8526                	mv	a0,s1
    80203494:	fffff097          	auipc	ra,0xfffff
    80203498:	e9e080e7          	jalr	-354(ra) # 80202332 <sleep>
  while(ticks - ticks0 < n){
    8020349c:	409c                	lw	a5,0(s1)
    8020349e:	412787bb          	subw	a5,a5,s2
    802034a2:	fcc42703          	lw	a4,-52(s0)
    802034a6:	fce7efe3          	bltu	a5,a4,80203484 <sys_sleep+0x54>
  }
  release(&tickslock);
    802034aa:	0000a517          	auipc	a0,0xa
    802034ae:	83e53503          	ld	a0,-1986(a0) # 8020cce8 <_GLOBAL_OFFSET_TABLE_+0x30>
    802034b2:	ffffd097          	auipc	ra,0xffffd
    802034b6:	268080e7          	jalr	616(ra) # 8020071a <release>
  return 0;
    802034ba:	4781                	li	a5,0
}
    802034bc:	853e                	mv	a0,a5
    802034be:	70e2                	ld	ra,56(sp)
    802034c0:	7442                	ld	s0,48(sp)
    802034c2:	74a2                	ld	s1,40(sp)
    802034c4:	7902                	ld	s2,32(sp)
    802034c6:	69e2                	ld	s3,24(sp)
    802034c8:	6121                	addi	sp,sp,64
    802034ca:	8082                	ret
      release(&tickslock);
    802034cc:	0000a517          	auipc	a0,0xa
    802034d0:	81c53503          	ld	a0,-2020(a0) # 8020cce8 <_GLOBAL_OFFSET_TABLE_+0x30>
    802034d4:	ffffd097          	auipc	ra,0xffffd
    802034d8:	246080e7          	jalr	582(ra) # 8020071a <release>
      return -1;
    802034dc:	57fd                	li	a5,-1
    802034de:	bff9                	j	802034bc <sys_sleep+0x8c>

00000000802034e0 <sys_kill>:

uint64
sys_kill(void)
{
    802034e0:	1101                	addi	sp,sp,-32
    802034e2:	ec06                	sd	ra,24(sp)
    802034e4:	e822                	sd	s0,16(sp)
    802034e6:	1000                	addi	s0,sp,32
  int pid;

  if(argint(0, &pid) < 0)
    802034e8:	fec40593          	addi	a1,s0,-20
    802034ec:	4501                	li	a0,0
    802034ee:	00000097          	auipc	ra,0x0
    802034f2:	bc6080e7          	jalr	-1082(ra) # 802030b4 <argint>
    802034f6:	87aa                	mv	a5,a0
    return -1;
    802034f8:	557d                	li	a0,-1
  if(argint(0, &pid) < 0)
    802034fa:	0007c863          	bltz	a5,8020350a <sys_kill+0x2a>
  return kill(pid);
    802034fe:	fec42503          	lw	a0,-20(s0)
    80203502:	fffff097          	auipc	ra,0xfffff
    80203506:	016080e7          	jalr	22(ra) # 80202518 <kill>
}
    8020350a:	60e2                	ld	ra,24(sp)
    8020350c:	6442                	ld	s0,16(sp)
    8020350e:	6105                	addi	sp,sp,32
    80203510:	8082                	ret

0000000080203512 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
    80203512:	1101                	addi	sp,sp,-32
    80203514:	ec06                	sd	ra,24(sp)
    80203516:	e822                	sd	s0,16(sp)
    80203518:	e426                	sd	s1,8(sp)
    8020351a:	1000                	addi	s0,sp,32
  uint xticks;

  acquire(&tickslock);
    8020351c:	00009517          	auipc	a0,0x9
    80203520:	7cc53503          	ld	a0,1996(a0) # 8020cce8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80203524:	ffffd097          	auipc	ra,0xffffd
    80203528:	1a2080e7          	jalr	418(ra) # 802006c6 <acquire>
  xticks = ticks;
    8020352c:	00009797          	auipc	a5,0x9
    80203530:	7cc7b783          	ld	a5,1996(a5) # 8020ccf8 <_GLOBAL_OFFSET_TABLE_+0x40>
    80203534:	4384                	lw	s1,0(a5)
  release(&tickslock);
    80203536:	00009517          	auipc	a0,0x9
    8020353a:	7b253503          	ld	a0,1970(a0) # 8020cce8 <_GLOBAL_OFFSET_TABLE_+0x30>
    8020353e:	ffffd097          	auipc	ra,0xffffd
    80203542:	1dc080e7          	jalr	476(ra) # 8020071a <release>
  return xticks;
}
    80203546:	02049513          	slli	a0,s1,0x20
    8020354a:	9101                	srli	a0,a0,0x20
    8020354c:	60e2                	ld	ra,24(sp)
    8020354e:	6442                	ld	s0,16(sp)
    80203550:	64a2                	ld	s1,8(sp)
    80203552:	6105                	addi	sp,sp,32
    80203554:	8082                	ret

0000000080203556 <sys_trace>:

uint64
sys_trace(void)
{
    80203556:	1101                	addi	sp,sp,-32
    80203558:	ec06                	sd	ra,24(sp)
    8020355a:	e822                	sd	s0,16(sp)
    8020355c:	1000                	addi	s0,sp,32
  int mask;
  if(argint(0, &mask) < 0) {
    8020355e:	fec40593          	addi	a1,s0,-20
    80203562:	4501                	li	a0,0
    80203564:	00000097          	auipc	ra,0x0
    80203568:	b50080e7          	jalr	-1200(ra) # 802030b4 <argint>
    return -1;
    8020356c:	57fd                	li	a5,-1
  if(argint(0, &mask) < 0) {
    8020356e:	00054b63          	bltz	a0,80203584 <sys_trace+0x2e>
  }
  myproc()->tmask = mask;
    80203572:	ffffe097          	auipc	ra,0xffffe
    80203576:	51c080e7          	jalr	1308(ra) # 80201a8e <myproc>
    8020357a:	fec42783          	lw	a5,-20(s0)
    8020357e:	16f52823          	sw	a5,368(a0)
  return 0;
    80203582:	4781                	li	a5,0
}
    80203584:	853e                	mv	a0,a5
    80203586:	60e2                	ld	ra,24(sp)
    80203588:	6442                	ld	s0,16(sp)
    8020358a:	6105                	addi	sp,sp,32
    8020358c:	8082                	ret

000000008020358e <sys_brk>:
/////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////


uint64
sys_brk(void){
    8020358e:	7179                	addi	sp,sp,-48
    80203590:	f406                	sd	ra,40(sp)
    80203592:	f022                	sd	s0,32(sp)
    80203594:	ec26                	sd	s1,24(sp)
    80203596:	1800                	addi	s0,sp,48
  uint64 curr_addr;
  uint64 next_addr;
  if(argaddr(0, &next_addr) < 0)
    80203598:	fd840593          	addi	a1,s0,-40
    8020359c:	4501                	li	a0,0
    8020359e:	00000097          	auipc	ra,0x0
    802035a2:	b78080e7          	jalr	-1160(ra) # 80203116 <argaddr>
    return -1;
    802035a6:	54fd                	li	s1,-1
  if(argaddr(0, &next_addr) < 0)
    802035a8:	02054863          	bltz	a0,802035d8 <sys_brk+0x4a>
  curr_addr = myproc()->sz; // Size of process memory
    802035ac:	ffffe097          	auipc	ra,0xffffe
    802035b0:	4e2080e7          	jalr	1250(ra) # 80201a8e <myproc>
    802035b4:	6524                	ld	s1,72(a0)
  printf("Running: BRK ... curr_addr: %d ... next_addr: %d\n", curr_addr, next_addr);
    802035b6:	fd843603          	ld	a2,-40(s0)
    802035ba:	85a6                	mv	a1,s1
    802035bc:	00006517          	auipc	a0,0x6
    802035c0:	55c50513          	addi	a0,a0,1372 # 80209b18 <digits+0x798>
    802035c4:	ffffd097          	auipc	ra,0xffffd
    802035c8:	bca080e7          	jalr	-1078(ra) # 8020018e <printf>
  if (next_addr == 0)
    802035cc:	fd843503          	ld	a0,-40(s0)
    802035d0:	c501                	beqz	a0,802035d8 <sys_brk+0x4a>
  {
    return curr_addr;
  }
  if (next_addr >= curr_addr)
    802035d2:	00957963          	bgeu	a0,s1,802035e4 <sys_brk+0x56>
  {
    if(growproc(next_addr - curr_addr) < 0)
      return -1;
    else return myproc()->sz;
  }
  return 0;
    802035d6:	4481                	li	s1,0
}
    802035d8:	8526                	mv	a0,s1
    802035da:	70a2                	ld	ra,40(sp)
    802035dc:	7402                	ld	s0,32(sp)
    802035de:	64e2                	ld	s1,24(sp)
    802035e0:	6145                	addi	sp,sp,48
    802035e2:	8082                	ret
    if(growproc(next_addr - curr_addr) < 0)
    802035e4:	9d05                	subw	a0,a0,s1
    802035e6:	fffff097          	auipc	ra,0xfffff
    802035ea:	832080e7          	jalr	-1998(ra) # 80201e18 <growproc>
      return -1;
    802035ee:	54fd                	li	s1,-1
    if(growproc(next_addr - curr_addr) < 0)
    802035f0:	fe0544e3          	bltz	a0,802035d8 <sys_brk+0x4a>
    else return myproc()->sz;
    802035f4:	ffffe097          	auipc	ra,0xffffe
    802035f8:	49a080e7          	jalr	1178(ra) # 80201a8e <myproc>
    802035fc:	6524                	ld	s1,72(a0)
    802035fe:	bfe9                	j	802035d8 <sys_brk+0x4a>

0000000080203600 <sys_clone>:


uint64
sys_clone(void){
    80203600:	1101                	addi	sp,sp,-32
    80203602:	ec06                	sd	ra,24(sp)
    80203604:	e822                	sd	s0,16(sp)
    80203606:	1000                	addi	s0,sp,32
  uint64 flag, stack;
	if (argaddr(0, &flag) < 0) 
    80203608:	fe840593          	addi	a1,s0,-24
    8020360c:	4501                	li	a0,0
    8020360e:	00000097          	auipc	ra,0x0
    80203612:	b08080e7          	jalr	-1272(ra) # 80203116 <argaddr>
		return -1;
    80203616:	57fd                	li	a5,-1
	if (argaddr(0, &flag) < 0) 
    80203618:	04054263          	bltz	a0,8020365c <sys_clone+0x5c>
	if (argaddr(1, &stack) < 0) 
    8020361c:	fe040593          	addi	a1,s0,-32
    80203620:	4505                	li	a0,1
    80203622:	00000097          	auipc	ra,0x0
    80203626:	af4080e7          	jalr	-1292(ra) # 80203116 <argaddr>
		return -1;
    8020362a:	57fd                	li	a5,-1
	if (argaddr(1, &stack) < 0) 
    8020362c:	02054863          	bltz	a0,8020365c <sys_clone+0x5c>
  printf("Running: CLONE ... flag: %ld ... stack: %ld\n", flag, stack);
    80203630:	fe043603          	ld	a2,-32(s0)
    80203634:	fe843583          	ld	a1,-24(s0)
    80203638:	00006517          	auipc	a0,0x6
    8020363c:	51850513          	addi	a0,a0,1304 # 80209b50 <digits+0x7d0>
    80203640:	ffffd097          	auipc	ra,0xffffd
    80203644:	b4e080e7          	jalr	-1202(ra) # 8020018e <printf>
  if (stack != 0)
    80203648:	fe043583          	ld	a1,-32(s0)
    8020364c:	cd89                	beqz	a1,80203666 <sys_clone+0x66>
	  return clone(flag, stack);
    8020364e:	fe843503          	ld	a0,-24(s0)
    80203652:	fffff097          	auipc	ra,0xfffff
    80203656:	084080e7          	jalr	132(ra) # 802026d6 <clone>
    8020365a:	87aa                	mv	a5,a0
  else
    return fork();
}
    8020365c:	853e                	mv	a0,a5
    8020365e:	60e2                	ld	ra,24(sp)
    80203660:	6442                	ld	s0,16(sp)
    80203662:	6105                	addi	sp,sp,32
    80203664:	8082                	ret
    return fork();
    80203666:	fffff097          	auipc	ra,0xfffff
    8020366a:	82e080e7          	jalr	-2002(ra) # 80201e94 <fork>
    8020366e:	87aa                	mv	a5,a0
    80203670:	b7f5                	j	8020365c <sys_clone+0x5c>

0000000080203672 <sys_wait4>:

uint64
sys_wait4(void)
{
    80203672:	1101                	addi	sp,sp,-32
    80203674:	ec06                	sd	ra,24(sp)
    80203676:	e822                	sd	s0,16(sp)
    80203678:	1000                	addi	s0,sp,32
  uint64 status;
  int pid, options;
  if(argaddr(1, &status) < 0 || argint(0, &pid) < 0 || argint(2, &options) < 0){
    8020367a:	fe840593          	addi	a1,s0,-24
    8020367e:	4505                	li	a0,1
    80203680:	00000097          	auipc	ra,0x0
    80203684:	a96080e7          	jalr	-1386(ra) # 80203116 <argaddr>
    return -1;}
    80203688:	57fd                	li	a5,-1
  if(argaddr(1, &status) < 0 || argint(0, &pid) < 0 || argint(2, &options) < 0){
    8020368a:	04054d63          	bltz	a0,802036e4 <sys_wait4+0x72>
    8020368e:	fe440593          	addi	a1,s0,-28
    80203692:	4501                	li	a0,0
    80203694:	00000097          	auipc	ra,0x0
    80203698:	a20080e7          	jalr	-1504(ra) # 802030b4 <argint>
    return -1;}
    8020369c:	57fd                	li	a5,-1
  if(argaddr(1, &status) < 0 || argint(0, &pid) < 0 || argint(2, &options) < 0){
    8020369e:	04054363          	bltz	a0,802036e4 <sys_wait4+0x72>
    802036a2:	fe040593          	addi	a1,s0,-32
    802036a6:	4509                	li	a0,2
    802036a8:	00000097          	auipc	ra,0x0
    802036ac:	a0c080e7          	jalr	-1524(ra) # 802030b4 <argint>
    return -1;}
    802036b0:	57fd                	li	a5,-1
  if(argaddr(1, &status) < 0 || argint(0, &pid) < 0 || argint(2, &options) < 0){
    802036b2:	02054963          	bltz	a0,802036e4 <sys_wait4+0x72>
  printf("Running: WAIT4 ... pid: %ld ... options: %ld\n", pid, options);
    802036b6:	fe042603          	lw	a2,-32(s0)
    802036ba:	fe442583          	lw	a1,-28(s0)
    802036be:	00006517          	auipc	a0,0x6
    802036c2:	4c250513          	addi	a0,a0,1218 # 80209b80 <digits+0x800>
    802036c6:	ffffd097          	auipc	ra,0xffffd
    802036ca:	ac8080e7          	jalr	-1336(ra) # 8020018e <printf>
  return waitpid(pid, status, options);
    802036ce:	fe042603          	lw	a2,-32(s0)
    802036d2:	fe843583          	ld	a1,-24(s0)
    802036d6:	fe442503          	lw	a0,-28(s0)
    802036da:	fffff097          	auipc	ra,0xfffff
    802036de:	140080e7          	jalr	320(ra) # 8020281a <waitpid>
    802036e2:	87aa                	mv	a5,a0
}
    802036e4:	853e                	mv	a0,a5
    802036e6:	60e2                	ld	ra,24(sp)
    802036e8:	6442                	ld	s0,16(sp)
    802036ea:	6105                	addi	sp,sp,32
    802036ec:	8082                	ret

00000000802036ee <sys_execve>:

uint64
sys_execve(void)
{
    802036ee:	d9010113          	addi	sp,sp,-624
    802036f2:	26113423          	sd	ra,616(sp)
    802036f6:	26813023          	sd	s0,608(sp)
    802036fa:	24913c23          	sd	s1,600(sp)
    802036fe:	25213823          	sd	s2,592(sp)
    80203702:	25313423          	sd	s3,584(sp)
    80203706:	25413023          	sd	s4,576(sp)
    8020370a:	23513c23          	sd	s5,568(sp)
    8020370e:	23613823          	sd	s6,560(sp)
    80203712:	23713423          	sd	s7,552(sp)
    80203716:	1c80                	addi	s0,sp,624
  char path[FAT32_MAX_PATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    80203718:	10400613          	li	a2,260
    8020371c:	ea840593          	addi	a1,s0,-344
    80203720:	4501                	li	a0,0
    80203722:	00000097          	auipc	ra,0x0
    80203726:	a16080e7          	jalr	-1514(ra) # 80203138 <argstr>
    return -1;
    8020372a:	597d                	li	s2,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    8020372c:	0c054c63          	bltz	a0,80203804 <sys_execve+0x116>
    80203730:	da040593          	addi	a1,s0,-608
    80203734:	4505                	li	a0,1
    80203736:	00000097          	auipc	ra,0x0
    8020373a:	9e0080e7          	jalr	-1568(ra) # 80203116 <argaddr>
    8020373e:	0c054363          	bltz	a0,80203804 <sys_execve+0x116>
  }
  memset(argv, 0, sizeof(argv));
    80203742:	da840a13          	addi	s4,s0,-600
    80203746:	10000613          	li	a2,256
    8020374a:	4581                	li	a1,0
    8020374c:	8552                	mv	a0,s4
    8020374e:	ffffd097          	auipc	ra,0xffffd
    80203752:	014080e7          	jalr	20(ra) # 80200762 <memset>
  for(i=0;; i++){
    if(i >= NELEM(argv)){
    80203756:	84d2                	mv	s1,s4
  memset(argv, 0, sizeof(argv));
    80203758:	89d2                	mv	s3,s4
    8020375a:	4901                	li	s2,0
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    8020375c:	d9840a93          	addi	s5,s0,-616
    if(i >= NELEM(argv)){
    80203760:	02000b13          	li	s6,32
    80203764:	00090b9b          	sext.w	s7,s2
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    80203768:	00391513          	slli	a0,s2,0x3
    8020376c:	85d6                	mv	a1,s5
    8020376e:	da043783          	ld	a5,-608(s0)
    80203772:	953e                	add	a0,a0,a5
    80203774:	00000097          	auipc	ra,0x0
    80203778:	8c0080e7          	jalr	-1856(ra) # 80203034 <fetchaddr>
    8020377c:	02054a63          	bltz	a0,802037b0 <sys_execve+0xc2>
      goto bad;
    }
    if(uarg == 0){
    80203780:	d9843783          	ld	a5,-616(s0)
    80203784:	c3b9                	beqz	a5,802037ca <sys_execve+0xdc>
      argv[i] = 0;
      break;
    }
    argv[i] = kalloc();
    80203786:	ffffd097          	auipc	ra,0xffffd
    8020378a:	dd4080e7          	jalr	-556(ra) # 8020055a <kalloc>
    8020378e:	85aa                	mv	a1,a0
    80203790:	00a9b023          	sd	a0,0(s3)
    if(argv[i] == 0)
    80203794:	cd11                	beqz	a0,802037b0 <sys_execve+0xc2>
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    80203796:	6605                	lui	a2,0x1
    80203798:	d9843503          	ld	a0,-616(s0)
    8020379c:	00000097          	auipc	ra,0x0
    802037a0:	8e8080e7          	jalr	-1816(ra) # 80203084 <fetchstr>
    802037a4:	00054663          	bltz	a0,802037b0 <sys_execve+0xc2>
    if(i >= NELEM(argv)){
    802037a8:	0905                	addi	s2,s2,1
    802037aa:	09a1                	addi	s3,s3,8
    802037ac:	fb691ce3          	bne	s2,s6,80203764 <sys_execve+0x76>
    kfree(argv[i]);

  return ret;

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    802037b0:	100a0a13          	addi	s4,s4,256
    802037b4:	6088                	ld	a0,0(s1)
    802037b6:	c531                	beqz	a0,80203802 <sys_execve+0x114>
    kfree(argv[i]);
    802037b8:	ffffd097          	auipc	ra,0xffffd
    802037bc:	c88080e7          	jalr	-888(ra) # 80200440 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    802037c0:	04a1                	addi	s1,s1,8
    802037c2:	ff4499e3          	bne	s1,s4,802037b4 <sys_execve+0xc6>
  return -1;
    802037c6:	597d                	li	s2,-1
    802037c8:	a835                	j	80203804 <sys_execve+0x116>
      argv[i] = 0;
    802037ca:	0b8e                	slli	s7,s7,0x3
    802037cc:	fb0b8793          	addi	a5,s7,-80
    802037d0:	00878bb3          	add	s7,a5,s0
    802037d4:	de0bbc23          	sd	zero,-520(s7)
  int ret = exec(path, argv);
    802037d8:	da840593          	addi	a1,s0,-600
    802037dc:	ea840513          	addi	a0,s0,-344
    802037e0:	00001097          	auipc	ra,0x1
    802037e4:	e32080e7          	jalr	-462(ra) # 80204612 <exec>
    802037e8:	892a                	mv	s2,a0
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    802037ea:	100a0a13          	addi	s4,s4,256
    802037ee:	6088                	ld	a0,0(s1)
    802037f0:	c911                	beqz	a0,80203804 <sys_execve+0x116>
    kfree(argv[i]);
    802037f2:	ffffd097          	auipc	ra,0xffffd
    802037f6:	c4e080e7          	jalr	-946(ra) # 80200440 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    802037fa:	04a1                	addi	s1,s1,8
    802037fc:	ff4499e3          	bne	s1,s4,802037ee <sys_execve+0x100>
    80203800:	a011                	j	80203804 <sys_execve+0x116>
  return -1;
    80203802:	597d                	li	s2,-1
}
    80203804:	854a                	mv	a0,s2
    80203806:	26813083          	ld	ra,616(sp)
    8020380a:	26013403          	ld	s0,608(sp)
    8020380e:	25813483          	ld	s1,600(sp)
    80203812:	25013903          	ld	s2,592(sp)
    80203816:	24813983          	ld	s3,584(sp)
    8020381a:	24013a03          	ld	s4,576(sp)
    8020381e:	23813a83          	ld	s5,568(sp)
    80203822:	23013b03          	ld	s6,560(sp)
    80203826:	22813b83          	ld	s7,552(sp)
    8020382a:	27010113          	addi	sp,sp,624
    8020382e:	8082                	ret

0000000080203830 <sys_getppid>:

uint64
sys_getppid(void)
{
    80203830:	1141                	addi	sp,sp,-16
    80203832:	e406                	sd	ra,8(sp)
    80203834:	e022                	sd	s0,0(sp)
    80203836:	0800                	addi	s0,sp,16
  return myproc()->parent->pid;
    80203838:	ffffe097          	auipc	ra,0xffffe
    8020383c:	256080e7          	jalr	598(ra) # 80201a8e <myproc>
    80203840:	711c                	ld	a5,32(a0)
}
    80203842:	5f88                	lw	a0,56(a5)
    80203844:	60a2                	ld	ra,8(sp)
    80203846:	6402                	ld	s0,0(sp)
    80203848:	0141                	addi	sp,sp,16
    8020384a:	8082                	ret

000000008020384c <sys_gettimeofday>:

uint64
sys_gettimeofday(void){
    8020384c:	7179                	addi	sp,sp,-48
    8020384e:	f406                	sd	ra,40(sp)
    80203850:	f022                	sd	s0,32(sp)
    80203852:	1800                	addi	s0,sp,48
  asm volatile("rdtime %0" : "=r" (x) );
    80203854:	c0102773          	rdtime	a4
  TimeVal tval;
	uint64 tmp_ticks = r_time();
	tval.sec = tmp_ticks / CLK_FREQ * 10;
    80203858:	025317b7          	lui	a5,0x2531
    8020385c:	7c078793          	addi	a5,a5,1984 # 25317c0 <_entry-0x7dcce840>
    80203860:	02f75733          	divu	a4,a4,a5
    80203864:	00271793          	slli	a5,a4,0x2
    80203868:	97ba                	add	a5,a5,a4
    8020386a:	0786                	slli	a5,a5,0x1
    8020386c:	fef43023          	sd	a5,-32(s0)
  uint64 ptval;
  if (argaddr(0, &ptval) < 0) {
    80203870:	fd840593          	addi	a1,s0,-40
    80203874:	4501                	li	a0,0
    80203876:	00000097          	auipc	ra,0x0
    8020387a:	8a0080e7          	jalr	-1888(ra) # 80203116 <argaddr>
    8020387e:	02054263          	bltz	a0,802038a2 <sys_gettimeofday+0x56>
		return -1;
	}
	if (ptval && copyout2(ptval, (char*)&tval, sizeof(tval)) < 0) {
    80203882:	fd843503          	ld	a0,-40(s0)
    80203886:	e509                	bnez	a0,80203890 <sys_gettimeofday+0x44>
		return -1;
	}
	return 0;
}
    80203888:	70a2                	ld	ra,40(sp)
    8020388a:	7402                	ld	s0,32(sp)
    8020388c:	6145                	addi	sp,sp,48
    8020388e:	8082                	ret
	if (ptval && copyout2(ptval, (char*)&tval, sizeof(tval)) < 0) {
    80203890:	4641                	li	a2,16
    80203892:	fe040593          	addi	a1,s0,-32
    80203896:	ffffe097          	auipc	ra,0xffffe
    8020389a:	adc080e7          	jalr	-1316(ra) # 80201372 <copyout2>
    8020389e:	957d                	srai	a0,a0,0x3f
    802038a0:	b7e5                	j	80203888 <sys_gettimeofday+0x3c>
		return -1;
    802038a2:	557d                	li	a0,-1
    802038a4:	b7d5                	j	80203888 <sys_gettimeofday+0x3c>

00000000802038a6 <sys_poweroff>:


// Power off QEMU
uint64
sys_poweroff(void)
{
    802038a6:	1141                	addi	sp,sp,-16
    802038a8:	e406                	sd	ra,8(sp)
    802038aa:	e022                	sd	s0,0(sp)
    802038ac:	0800                	addi	s0,sp,16
  printf("Powering off...\n");
    802038ae:	00006517          	auipc	a0,0x6
    802038b2:	30250513          	addi	a0,a0,770 # 80209bb0 <digits+0x830>
    802038b6:	ffffd097          	auipc	ra,0xffffd
    802038ba:	8d8080e7          	jalr	-1832(ra) # 8020018e <printf>
	SBI_CALL_0(SBI_SHUTDOWN);
    802038be:	4501                	li	a0,0
    802038c0:	4581                	li	a1,0
    802038c2:	4601                	li	a2,0
    802038c4:	4681                	li	a3,0
    802038c6:	48a1                	li	a7,8
    802038c8:	00000073          	ecall
  sbi_shutdown();
  panic("sys_poweroff");
    802038cc:	00006517          	auipc	a0,0x6
    802038d0:	2fc50513          	addi	a0,a0,764 # 80209bc8 <digits+0x848>
    802038d4:	ffffd097          	auipc	ra,0xffffd
    802038d8:	870080e7          	jalr	-1936(ra) # 80200144 <panic>

00000000802038dc <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
    802038dc:	7139                	addi	sp,sp,-64
    802038de:	fc06                	sd	ra,56(sp)
    802038e0:	f822                	sd	s0,48(sp)
    802038e2:	f426                	sd	s1,40(sp)
    802038e4:	f04a                	sd	s2,32(sp)
    802038e6:	ec4e                	sd	s3,24(sp)
    802038e8:	e852                	sd	s4,16(sp)
    802038ea:	e456                	sd	s5,8(sp)
    802038ec:	0080                	addi	s0,sp,64
  struct buf *b;

  initlock(&bcache.lock, "bcache");
    802038ee:	00006597          	auipc	a1,0x6
    802038f2:	2ea58593          	addi	a1,a1,746 # 80209bd8 <digits+0x858>
    802038f6:	00016517          	auipc	a0,0x16
    802038fa:	1fa50513          	addi	a0,a0,506 # 80219af0 <bcache>
    802038fe:	ffffd097          	auipc	ra,0xffffd
    80203902:	d84080e7          	jalr	-636(ra) # 80200682 <initlock>

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
    80203906:	0001a797          	auipc	a5,0x1a
    8020390a:	1ea78793          	addi	a5,a5,490 # 8021daf0 <bcache+0x4000>
    8020390e:	0001b717          	auipc	a4,0x1b
    80203912:	84a70713          	addi	a4,a4,-1974 # 8021e158 <bcache+0x4668>
    80203916:	6ae7b823          	sd	a4,1712(a5)
  bcache.head.next = &bcache.head;
    8020391a:	6ae7bc23          	sd	a4,1720(a5)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    8020391e:	00016497          	auipc	s1,0x16
    80203922:	1ea48493          	addi	s1,s1,490 # 80219b08 <bcache+0x18>
    b->refcnt = 0;
    b->sectorno = ~0;
    80203926:	5a7d                	li	s4,-1
    b->dev = ~0;
    b->next = bcache.head.next;
    80203928:	893e                	mv	s2,a5
    b->prev = &bcache.head;
    8020392a:	89ba                	mv	s3,a4
    initsleeplock(&b->lock, "buffer");
    8020392c:	00006a97          	auipc	s5,0x6
    80203930:	2b4a8a93          	addi	s5,s5,692 # 80209be0 <digits+0x860>
    b->refcnt = 0;
    80203934:	0404a023          	sw	zero,64(s1)
    b->sectorno = ~0;
    80203938:	0144a623          	sw	s4,12(s1)
    b->dev = ~0;
    8020393c:	0144a423          	sw	s4,8(s1)
    b->next = bcache.head.next;
    80203940:	6b893783          	ld	a5,1720(s2)
    80203944:	e8bc                	sd	a5,80(s1)
    b->prev = &bcache.head;
    80203946:	0534b423          	sd	s3,72(s1)
    initsleeplock(&b->lock, "buffer");
    8020394a:	85d6                	mv	a1,s5
    8020394c:	01048513          	addi	a0,s1,16
    80203950:	00000097          	auipc	ra,0x0
    80203954:	26e080e7          	jalr	622(ra) # 80203bbe <initsleeplock>
    bcache.head.next->prev = b;
    80203958:	6b893783          	ld	a5,1720(s2)
    8020395c:	e7a4                	sd	s1,72(a5)
    bcache.head.next = b;
    8020395e:	6a993c23          	sd	s1,1720(s2)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    80203962:	25848493          	addi	s1,s1,600
    80203966:	fd3497e3          	bne	s1,s3,80203934 <binit+0x58>
  }
  #ifdef DEBUG
  printf("binit\n");
  #endif
}
    8020396a:	70e2                	ld	ra,56(sp)
    8020396c:	7442                	ld	s0,48(sp)
    8020396e:	74a2                	ld	s1,40(sp)
    80203970:	7902                	ld	s2,32(sp)
    80203972:	69e2                	ld	s3,24(sp)
    80203974:	6a42                	ld	s4,16(sp)
    80203976:	6aa2                	ld	s5,8(sp)
    80203978:	6121                	addi	sp,sp,64
    8020397a:	8082                	ret

000000008020397c <bread>:
  panic("bget: no buffers");
}

// Return a locked buf with the contents of the indicated block.
struct buf* 
bread(uint dev, uint sectorno) {
    8020397c:	7179                	addi	sp,sp,-48
    8020397e:	f406                	sd	ra,40(sp)
    80203980:	f022                	sd	s0,32(sp)
    80203982:	ec26                	sd	s1,24(sp)
    80203984:	e84a                	sd	s2,16(sp)
    80203986:	e44e                	sd	s3,8(sp)
    80203988:	1800                	addi	s0,sp,48
    8020398a:	892a                	mv	s2,a0
    8020398c:	89ae                	mv	s3,a1
  acquire(&bcache.lock);
    8020398e:	00016517          	auipc	a0,0x16
    80203992:	16250513          	addi	a0,a0,354 # 80219af0 <bcache>
    80203996:	ffffd097          	auipc	ra,0xffffd
    8020399a:	d30080e7          	jalr	-720(ra) # 802006c6 <acquire>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    8020399e:	0001b497          	auipc	s1,0x1b
    802039a2:	80a4b483          	ld	s1,-2038(s1) # 8021e1a8 <bcache+0x46b8>
    802039a6:	0001a797          	auipc	a5,0x1a
    802039aa:	7b278793          	addi	a5,a5,1970 # 8021e158 <bcache+0x4668>
    802039ae:	02f48f63          	beq	s1,a5,802039ec <bread+0x70>
    802039b2:	873e                	mv	a4,a5
    802039b4:	a021                	j	802039bc <bread+0x40>
    802039b6:	68a4                	ld	s1,80(s1)
    802039b8:	02e48a63          	beq	s1,a4,802039ec <bread+0x70>
    if(b->dev == dev && b->sectorno == sectorno){
    802039bc:	449c                	lw	a5,8(s1)
    802039be:	ff279ce3          	bne	a5,s2,802039b6 <bread+0x3a>
    802039c2:	44dc                	lw	a5,12(s1)
    802039c4:	ff3799e3          	bne	a5,s3,802039b6 <bread+0x3a>
      b->refcnt++;
    802039c8:	40bc                	lw	a5,64(s1)
    802039ca:	2785                	addiw	a5,a5,1
    802039cc:	c0bc                	sw	a5,64(s1)
      release(&bcache.lock);
    802039ce:	00016517          	auipc	a0,0x16
    802039d2:	12250513          	addi	a0,a0,290 # 80219af0 <bcache>
    802039d6:	ffffd097          	auipc	ra,0xffffd
    802039da:	d44080e7          	jalr	-700(ra) # 8020071a <release>
      acquiresleep(&b->lock);
    802039de:	01048513          	addi	a0,s1,16
    802039e2:	00000097          	auipc	ra,0x0
    802039e6:	216080e7          	jalr	534(ra) # 80203bf8 <acquiresleep>
      return b;
    802039ea:	a8b9                	j	80203a48 <bread+0xcc>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    802039ec:	0001a497          	auipc	s1,0x1a
    802039f0:	7b44b483          	ld	s1,1972(s1) # 8021e1a0 <bcache+0x46b0>
    802039f4:	0001a797          	auipc	a5,0x1a
    802039f8:	76478793          	addi	a5,a5,1892 # 8021e158 <bcache+0x4668>
    802039fc:	00f48863          	beq	s1,a5,80203a0c <bread+0x90>
    80203a00:	873e                	mv	a4,a5
    if(b->refcnt == 0) {
    80203a02:	40bc                	lw	a5,64(s1)
    80203a04:	cf81                	beqz	a5,80203a1c <bread+0xa0>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80203a06:	64a4                	ld	s1,72(s1)
    80203a08:	fee49de3          	bne	s1,a4,80203a02 <bread+0x86>
  panic("bget: no buffers");
    80203a0c:	00006517          	auipc	a0,0x6
    80203a10:	1dc50513          	addi	a0,a0,476 # 80209be8 <digits+0x868>
    80203a14:	ffffc097          	auipc	ra,0xffffc
    80203a18:	730080e7          	jalr	1840(ra) # 80200144 <panic>
      b->dev = dev;
    80203a1c:	0124a423          	sw	s2,8(s1)
      b->sectorno = sectorno;
    80203a20:	0134a623          	sw	s3,12(s1)
      b->valid = 0;
    80203a24:	0004a023          	sw	zero,0(s1)
      b->refcnt = 1;
    80203a28:	4785                	li	a5,1
    80203a2a:	c0bc                	sw	a5,64(s1)
      release(&bcache.lock);
    80203a2c:	00016517          	auipc	a0,0x16
    80203a30:	0c450513          	addi	a0,a0,196 # 80219af0 <bcache>
    80203a34:	ffffd097          	auipc	ra,0xffffd
    80203a38:	ce6080e7          	jalr	-794(ra) # 8020071a <release>
      acquiresleep(&b->lock);
    80203a3c:	01048513          	addi	a0,s1,16
    80203a40:	00000097          	auipc	ra,0x0
    80203a44:	1b8080e7          	jalr	440(ra) # 80203bf8 <acquiresleep>
  struct buf *b;

  b = bget(dev, sectorno);
  if (!b->valid) {
    80203a48:	409c                	lw	a5,0(s1)
    80203a4a:	cb89                	beqz	a5,80203a5c <bread+0xe0>
    disk_read(b);
    b->valid = 1;
  }

  return b;
}
    80203a4c:	8526                	mv	a0,s1
    80203a4e:	70a2                	ld	ra,40(sp)
    80203a50:	7402                	ld	s0,32(sp)
    80203a52:	64e2                	ld	s1,24(sp)
    80203a54:	6942                	ld	s2,16(sp)
    80203a56:	69a2                	ld	s3,8(sp)
    80203a58:	6145                	addi	sp,sp,48
    80203a5a:	8082                	ret
    disk_read(b);
    80203a5c:	8526                	mv	a0,s1
    80203a5e:	00002097          	auipc	ra,0x2
    80203a62:	094080e7          	jalr	148(ra) # 80205af2 <disk_read>
    b->valid = 1;
    80203a66:	4785                	li	a5,1
    80203a68:	c09c                	sw	a5,0(s1)
  return b;
    80203a6a:	b7cd                	j	80203a4c <bread+0xd0>

0000000080203a6c <bwrite>:

// Write b's contents to disk.  Must be locked.
void 
bwrite(struct buf *b) {
    80203a6c:	1101                	addi	sp,sp,-32
    80203a6e:	ec06                	sd	ra,24(sp)
    80203a70:	e822                	sd	s0,16(sp)
    80203a72:	e426                	sd	s1,8(sp)
    80203a74:	1000                	addi	s0,sp,32
    80203a76:	84aa                	mv	s1,a0
  if(!holdingsleep(&b->lock))
    80203a78:	0541                	addi	a0,a0,16
    80203a7a:	00000097          	auipc	ra,0x0
    80203a7e:	218080e7          	jalr	536(ra) # 80203c92 <holdingsleep>
    80203a82:	c919                	beqz	a0,80203a98 <bwrite+0x2c>
    panic("bwrite");
  disk_write(b);
    80203a84:	8526                	mv	a0,s1
    80203a86:	00002097          	auipc	ra,0x2
    80203a8a:	086080e7          	jalr	134(ra) # 80205b0c <disk_write>
}
    80203a8e:	60e2                	ld	ra,24(sp)
    80203a90:	6442                	ld	s0,16(sp)
    80203a92:	64a2                	ld	s1,8(sp)
    80203a94:	6105                	addi	sp,sp,32
    80203a96:	8082                	ret
    panic("bwrite");
    80203a98:	00006517          	auipc	a0,0x6
    80203a9c:	16850513          	addi	a0,a0,360 # 80209c00 <digits+0x880>
    80203aa0:	ffffc097          	auipc	ra,0xffffc
    80203aa4:	6a4080e7          	jalr	1700(ra) # 80200144 <panic>

0000000080203aa8 <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
    80203aa8:	1101                	addi	sp,sp,-32
    80203aaa:	ec06                	sd	ra,24(sp)
    80203aac:	e822                	sd	s0,16(sp)
    80203aae:	e426                	sd	s1,8(sp)
    80203ab0:	e04a                	sd	s2,0(sp)
    80203ab2:	1000                	addi	s0,sp,32
    80203ab4:	84aa                	mv	s1,a0
  if(!holdingsleep(&b->lock))
    80203ab6:	01050913          	addi	s2,a0,16
    80203aba:	854a                	mv	a0,s2
    80203abc:	00000097          	auipc	ra,0x0
    80203ac0:	1d6080e7          	jalr	470(ra) # 80203c92 <holdingsleep>
    80203ac4:	c92d                	beqz	a0,80203b36 <brelse+0x8e>
    panic("brelse");

  releasesleep(&b->lock);
    80203ac6:	854a                	mv	a0,s2
    80203ac8:	00000097          	auipc	ra,0x0
    80203acc:	186080e7          	jalr	390(ra) # 80203c4e <releasesleep>

  acquire(&bcache.lock);
    80203ad0:	00016517          	auipc	a0,0x16
    80203ad4:	02050513          	addi	a0,a0,32 # 80219af0 <bcache>
    80203ad8:	ffffd097          	auipc	ra,0xffffd
    80203adc:	bee080e7          	jalr	-1042(ra) # 802006c6 <acquire>
  b->refcnt--;
    80203ae0:	40bc                	lw	a5,64(s1)
    80203ae2:	37fd                	addiw	a5,a5,-1
    80203ae4:	0007871b          	sext.w	a4,a5
    80203ae8:	c0bc                	sw	a5,64(s1)
  if (b->refcnt == 0) {
    80203aea:	eb05                	bnez	a4,80203b1a <brelse+0x72>
    // no one is waiting for it.
    b->next->prev = b->prev;
    80203aec:	68bc                	ld	a5,80(s1)
    80203aee:	64b8                	ld	a4,72(s1)
    80203af0:	e7b8                	sd	a4,72(a5)
    b->prev->next = b->next;
    80203af2:	64bc                	ld	a5,72(s1)
    80203af4:	68b8                	ld	a4,80(s1)
    80203af6:	ebb8                	sd	a4,80(a5)
    b->next = bcache.head.next;
    80203af8:	0001a797          	auipc	a5,0x1a
    80203afc:	ff878793          	addi	a5,a5,-8 # 8021daf0 <bcache+0x4000>
    80203b00:	6b87b703          	ld	a4,1720(a5)
    80203b04:	e8b8                	sd	a4,80(s1)
    b->prev = &bcache.head;
    80203b06:	0001a717          	auipc	a4,0x1a
    80203b0a:	65270713          	addi	a4,a4,1618 # 8021e158 <bcache+0x4668>
    80203b0e:	e4b8                	sd	a4,72(s1)
    bcache.head.next->prev = b;
    80203b10:	6b87b703          	ld	a4,1720(a5)
    80203b14:	e724                	sd	s1,72(a4)
    bcache.head.next = b;
    80203b16:	6a97bc23          	sd	s1,1720(a5)
  }
  
  release(&bcache.lock);
    80203b1a:	00016517          	auipc	a0,0x16
    80203b1e:	fd650513          	addi	a0,a0,-42 # 80219af0 <bcache>
    80203b22:	ffffd097          	auipc	ra,0xffffd
    80203b26:	bf8080e7          	jalr	-1032(ra) # 8020071a <release>
}
    80203b2a:	60e2                	ld	ra,24(sp)
    80203b2c:	6442                	ld	s0,16(sp)
    80203b2e:	64a2                	ld	s1,8(sp)
    80203b30:	6902                	ld	s2,0(sp)
    80203b32:	6105                	addi	sp,sp,32
    80203b34:	8082                	ret
    panic("brelse");
    80203b36:	00006517          	auipc	a0,0x6
    80203b3a:	0d250513          	addi	a0,a0,210 # 80209c08 <digits+0x888>
    80203b3e:	ffffc097          	auipc	ra,0xffffc
    80203b42:	606080e7          	jalr	1542(ra) # 80200144 <panic>

0000000080203b46 <bpin>:

void
bpin(struct buf *b) {
    80203b46:	1101                	addi	sp,sp,-32
    80203b48:	ec06                	sd	ra,24(sp)
    80203b4a:	e822                	sd	s0,16(sp)
    80203b4c:	e426                	sd	s1,8(sp)
    80203b4e:	1000                	addi	s0,sp,32
    80203b50:	84aa                	mv	s1,a0
  acquire(&bcache.lock);
    80203b52:	00016517          	auipc	a0,0x16
    80203b56:	f9e50513          	addi	a0,a0,-98 # 80219af0 <bcache>
    80203b5a:	ffffd097          	auipc	ra,0xffffd
    80203b5e:	b6c080e7          	jalr	-1172(ra) # 802006c6 <acquire>
  b->refcnt++;
    80203b62:	40bc                	lw	a5,64(s1)
    80203b64:	2785                	addiw	a5,a5,1
    80203b66:	c0bc                	sw	a5,64(s1)
  release(&bcache.lock);
    80203b68:	00016517          	auipc	a0,0x16
    80203b6c:	f8850513          	addi	a0,a0,-120 # 80219af0 <bcache>
    80203b70:	ffffd097          	auipc	ra,0xffffd
    80203b74:	baa080e7          	jalr	-1110(ra) # 8020071a <release>
}
    80203b78:	60e2                	ld	ra,24(sp)
    80203b7a:	6442                	ld	s0,16(sp)
    80203b7c:	64a2                	ld	s1,8(sp)
    80203b7e:	6105                	addi	sp,sp,32
    80203b80:	8082                	ret

0000000080203b82 <bunpin>:

void
bunpin(struct buf *b) {
    80203b82:	1101                	addi	sp,sp,-32
    80203b84:	ec06                	sd	ra,24(sp)
    80203b86:	e822                	sd	s0,16(sp)
    80203b88:	e426                	sd	s1,8(sp)
    80203b8a:	1000                	addi	s0,sp,32
    80203b8c:	84aa                	mv	s1,a0
  acquire(&bcache.lock);
    80203b8e:	00016517          	auipc	a0,0x16
    80203b92:	f6250513          	addi	a0,a0,-158 # 80219af0 <bcache>
    80203b96:	ffffd097          	auipc	ra,0xffffd
    80203b9a:	b30080e7          	jalr	-1232(ra) # 802006c6 <acquire>
  b->refcnt--;
    80203b9e:	40bc                	lw	a5,64(s1)
    80203ba0:	37fd                	addiw	a5,a5,-1
    80203ba2:	c0bc                	sw	a5,64(s1)
  release(&bcache.lock);
    80203ba4:	00016517          	auipc	a0,0x16
    80203ba8:	f4c50513          	addi	a0,a0,-180 # 80219af0 <bcache>
    80203bac:	ffffd097          	auipc	ra,0xffffd
    80203bb0:	b6e080e7          	jalr	-1170(ra) # 8020071a <release>
}
    80203bb4:	60e2                	ld	ra,24(sp)
    80203bb6:	6442                	ld	s0,16(sp)
    80203bb8:	64a2                	ld	s1,8(sp)
    80203bba:	6105                	addi	sp,sp,32
    80203bbc:	8082                	ret

0000000080203bbe <initsleeplock>:
#include "include/proc.h"
#include "include/sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
    80203bbe:	1101                	addi	sp,sp,-32
    80203bc0:	ec06                	sd	ra,24(sp)
    80203bc2:	e822                	sd	s0,16(sp)
    80203bc4:	e426                	sd	s1,8(sp)
    80203bc6:	e04a                	sd	s2,0(sp)
    80203bc8:	1000                	addi	s0,sp,32
    80203bca:	84aa                	mv	s1,a0
    80203bcc:	892e                	mv	s2,a1
  initlock(&lk->lk, "sleep lock");
    80203bce:	00006597          	auipc	a1,0x6
    80203bd2:	04258593          	addi	a1,a1,66 # 80209c10 <digits+0x890>
    80203bd6:	0521                	addi	a0,a0,8
    80203bd8:	ffffd097          	auipc	ra,0xffffd
    80203bdc:	aaa080e7          	jalr	-1366(ra) # 80200682 <initlock>
  lk->name = name;
    80203be0:	0324b023          	sd	s2,32(s1)
  lk->locked = 0;
    80203be4:	0004a023          	sw	zero,0(s1)
  lk->pid = 0;
    80203be8:	0204a423          	sw	zero,40(s1)
}
    80203bec:	60e2                	ld	ra,24(sp)
    80203bee:	6442                	ld	s0,16(sp)
    80203bf0:	64a2                	ld	s1,8(sp)
    80203bf2:	6902                	ld	s2,0(sp)
    80203bf4:	6105                	addi	sp,sp,32
    80203bf6:	8082                	ret

0000000080203bf8 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
    80203bf8:	1101                	addi	sp,sp,-32
    80203bfa:	ec06                	sd	ra,24(sp)
    80203bfc:	e822                	sd	s0,16(sp)
    80203bfe:	e426                	sd	s1,8(sp)
    80203c00:	e04a                	sd	s2,0(sp)
    80203c02:	1000                	addi	s0,sp,32
    80203c04:	84aa                	mv	s1,a0
  acquire(&lk->lk);
    80203c06:	00850913          	addi	s2,a0,8
    80203c0a:	854a                	mv	a0,s2
    80203c0c:	ffffd097          	auipc	ra,0xffffd
    80203c10:	aba080e7          	jalr	-1350(ra) # 802006c6 <acquire>
  while (lk->locked) {
    80203c14:	409c                	lw	a5,0(s1)
    80203c16:	cb89                	beqz	a5,80203c28 <acquiresleep+0x30>
    sleep(lk, &lk->lk);
    80203c18:	85ca                	mv	a1,s2
    80203c1a:	8526                	mv	a0,s1
    80203c1c:	ffffe097          	auipc	ra,0xffffe
    80203c20:	716080e7          	jalr	1814(ra) # 80202332 <sleep>
  while (lk->locked) {
    80203c24:	409c                	lw	a5,0(s1)
    80203c26:	fbed                	bnez	a5,80203c18 <acquiresleep+0x20>
  }
  lk->locked = 1;
    80203c28:	4785                	li	a5,1
    80203c2a:	c09c                	sw	a5,0(s1)
  lk->pid = myproc()->pid;
    80203c2c:	ffffe097          	auipc	ra,0xffffe
    80203c30:	e62080e7          	jalr	-414(ra) # 80201a8e <myproc>
    80203c34:	5d1c                	lw	a5,56(a0)
    80203c36:	d49c                	sw	a5,40(s1)
  release(&lk->lk);
    80203c38:	854a                	mv	a0,s2
    80203c3a:	ffffd097          	auipc	ra,0xffffd
    80203c3e:	ae0080e7          	jalr	-1312(ra) # 8020071a <release>
}
    80203c42:	60e2                	ld	ra,24(sp)
    80203c44:	6442                	ld	s0,16(sp)
    80203c46:	64a2                	ld	s1,8(sp)
    80203c48:	6902                	ld	s2,0(sp)
    80203c4a:	6105                	addi	sp,sp,32
    80203c4c:	8082                	ret

0000000080203c4e <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
    80203c4e:	1101                	addi	sp,sp,-32
    80203c50:	ec06                	sd	ra,24(sp)
    80203c52:	e822                	sd	s0,16(sp)
    80203c54:	e426                	sd	s1,8(sp)
    80203c56:	e04a                	sd	s2,0(sp)
    80203c58:	1000                	addi	s0,sp,32
    80203c5a:	84aa                	mv	s1,a0
  acquire(&lk->lk);
    80203c5c:	00850913          	addi	s2,a0,8
    80203c60:	854a                	mv	a0,s2
    80203c62:	ffffd097          	auipc	ra,0xffffd
    80203c66:	a64080e7          	jalr	-1436(ra) # 802006c6 <acquire>
  lk->locked = 0;
    80203c6a:	0004a023          	sw	zero,0(s1)
  lk->pid = 0;
    80203c6e:	0204a423          	sw	zero,40(s1)
  wakeup(lk);
    80203c72:	8526                	mv	a0,s1
    80203c74:	fffff097          	auipc	ra,0xfffff
    80203c78:	83a080e7          	jalr	-1990(ra) # 802024ae <wakeup>
  release(&lk->lk);
    80203c7c:	854a                	mv	a0,s2
    80203c7e:	ffffd097          	auipc	ra,0xffffd
    80203c82:	a9c080e7          	jalr	-1380(ra) # 8020071a <release>
}
    80203c86:	60e2                	ld	ra,24(sp)
    80203c88:	6442                	ld	s0,16(sp)
    80203c8a:	64a2                	ld	s1,8(sp)
    80203c8c:	6902                	ld	s2,0(sp)
    80203c8e:	6105                	addi	sp,sp,32
    80203c90:	8082                	ret

0000000080203c92 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
    80203c92:	7179                	addi	sp,sp,-48
    80203c94:	f406                	sd	ra,40(sp)
    80203c96:	f022                	sd	s0,32(sp)
    80203c98:	ec26                	sd	s1,24(sp)
    80203c9a:	e84a                	sd	s2,16(sp)
    80203c9c:	e44e                	sd	s3,8(sp)
    80203c9e:	1800                	addi	s0,sp,48
    80203ca0:	84aa                	mv	s1,a0
  int r;
  
  acquire(&lk->lk);
    80203ca2:	00850913          	addi	s2,a0,8
    80203ca6:	854a                	mv	a0,s2
    80203ca8:	ffffd097          	auipc	ra,0xffffd
    80203cac:	a1e080e7          	jalr	-1506(ra) # 802006c6 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
    80203cb0:	409c                	lw	a5,0(s1)
    80203cb2:	ef99                	bnez	a5,80203cd0 <holdingsleep+0x3e>
    80203cb4:	4481                	li	s1,0
  release(&lk->lk);
    80203cb6:	854a                	mv	a0,s2
    80203cb8:	ffffd097          	auipc	ra,0xffffd
    80203cbc:	a62080e7          	jalr	-1438(ra) # 8020071a <release>
  return r;
}
    80203cc0:	8526                	mv	a0,s1
    80203cc2:	70a2                	ld	ra,40(sp)
    80203cc4:	7402                	ld	s0,32(sp)
    80203cc6:	64e2                	ld	s1,24(sp)
    80203cc8:	6942                	ld	s2,16(sp)
    80203cca:	69a2                	ld	s3,8(sp)
    80203ccc:	6145                	addi	sp,sp,48
    80203cce:	8082                	ret
  r = lk->locked && (lk->pid == myproc()->pid);
    80203cd0:	0284a983          	lw	s3,40(s1)
    80203cd4:	ffffe097          	auipc	ra,0xffffe
    80203cd8:	dba080e7          	jalr	-582(ra) # 80201a8e <myproc>
    80203cdc:	5d04                	lw	s1,56(a0)
    80203cde:	413484b3          	sub	s1,s1,s3
    80203ce2:	0014b493          	seqz	s1,s1
    80203ce6:	bfc1                	j	80203cb6 <holdingsleep+0x24>

0000000080203ce8 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
    80203ce8:	1101                	addi	sp,sp,-32
    80203cea:	ec06                	sd	ra,24(sp)
    80203cec:	e822                	sd	s0,16(sp)
    80203cee:	e426                	sd	s1,8(sp)
    80203cf0:	e04a                	sd	s2,0(sp)
    80203cf2:	1000                	addi	s0,sp,32
  initlock(&ftable.lock, "ftable");
    80203cf4:	00006597          	auipc	a1,0x6
    80203cf8:	f2c58593          	addi	a1,a1,-212 # 80209c20 <digits+0x8a0>
    80203cfc:	0001a517          	auipc	a0,0x1a
    80203d00:	75450513          	addi	a0,a0,1876 # 8021e450 <ftable>
    80203d04:	ffffd097          	auipc	ra,0xffffd
    80203d08:	97e080e7          	jalr	-1666(ra) # 80200682 <initlock>
  struct file *f;
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203d0c:	0001a497          	auipc	s1,0x1a
    80203d10:	75c48493          	addi	s1,s1,1884 # 8021e468 <ftable+0x18>
    80203d14:	0001b917          	auipc	s2,0x1b
    80203d18:	6f490913          	addi	s2,s2,1780 # 8021f408 <tickslock>
    memset(f, 0, sizeof(struct file));
    80203d1c:	02800613          	li	a2,40
    80203d20:	4581                	li	a1,0
    80203d22:	8526                	mv	a0,s1
    80203d24:	ffffd097          	auipc	ra,0xffffd
    80203d28:	a3e080e7          	jalr	-1474(ra) # 80200762 <memset>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203d2c:	02848493          	addi	s1,s1,40
    80203d30:	ff2496e3          	bne	s1,s2,80203d1c <fileinit+0x34>
  }
  #ifdef DEBUG
  printf("fileinit\n");
  #endif
}
    80203d34:	60e2                	ld	ra,24(sp)
    80203d36:	6442                	ld	s0,16(sp)
    80203d38:	64a2                	ld	s1,8(sp)
    80203d3a:	6902                	ld	s2,0(sp)
    80203d3c:	6105                	addi	sp,sp,32
    80203d3e:	8082                	ret

0000000080203d40 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
    80203d40:	1101                	addi	sp,sp,-32
    80203d42:	ec06                	sd	ra,24(sp)
    80203d44:	e822                	sd	s0,16(sp)
    80203d46:	e426                	sd	s1,8(sp)
    80203d48:	1000                	addi	s0,sp,32
  struct file *f;

  acquire(&ftable.lock);
    80203d4a:	0001a517          	auipc	a0,0x1a
    80203d4e:	70650513          	addi	a0,a0,1798 # 8021e450 <ftable>
    80203d52:	ffffd097          	auipc	ra,0xffffd
    80203d56:	974080e7          	jalr	-1676(ra) # 802006c6 <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203d5a:	0001a497          	auipc	s1,0x1a
    80203d5e:	70e48493          	addi	s1,s1,1806 # 8021e468 <ftable+0x18>
    80203d62:	0001b717          	auipc	a4,0x1b
    80203d66:	6a670713          	addi	a4,a4,1702 # 8021f408 <tickslock>
    if(f->ref == 0){
    80203d6a:	40dc                	lw	a5,4(s1)
    80203d6c:	cf99                	beqz	a5,80203d8a <filealloc+0x4a>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203d6e:	02848493          	addi	s1,s1,40
    80203d72:	fee49ce3          	bne	s1,a4,80203d6a <filealloc+0x2a>
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
    80203d76:	0001a517          	auipc	a0,0x1a
    80203d7a:	6da50513          	addi	a0,a0,1754 # 8021e450 <ftable>
    80203d7e:	ffffd097          	auipc	ra,0xffffd
    80203d82:	99c080e7          	jalr	-1636(ra) # 8020071a <release>
  return NULL;
    80203d86:	4481                	li	s1,0
    80203d88:	a819                	j	80203d9e <filealloc+0x5e>
      f->ref = 1;
    80203d8a:	4785                	li	a5,1
    80203d8c:	c0dc                	sw	a5,4(s1)
      release(&ftable.lock);
    80203d8e:	0001a517          	auipc	a0,0x1a
    80203d92:	6c250513          	addi	a0,a0,1730 # 8021e450 <ftable>
    80203d96:	ffffd097          	auipc	ra,0xffffd
    80203d9a:	984080e7          	jalr	-1660(ra) # 8020071a <release>
}
    80203d9e:	8526                	mv	a0,s1
    80203da0:	60e2                	ld	ra,24(sp)
    80203da2:	6442                	ld	s0,16(sp)
    80203da4:	64a2                	ld	s1,8(sp)
    80203da6:	6105                	addi	sp,sp,32
    80203da8:	8082                	ret

0000000080203daa <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
    80203daa:	1101                	addi	sp,sp,-32
    80203dac:	ec06                	sd	ra,24(sp)
    80203dae:	e822                	sd	s0,16(sp)
    80203db0:	e426                	sd	s1,8(sp)
    80203db2:	1000                	addi	s0,sp,32
    80203db4:	84aa                	mv	s1,a0
  acquire(&ftable.lock);
    80203db6:	0001a517          	auipc	a0,0x1a
    80203dba:	69a50513          	addi	a0,a0,1690 # 8021e450 <ftable>
    80203dbe:	ffffd097          	auipc	ra,0xffffd
    80203dc2:	908080e7          	jalr	-1784(ra) # 802006c6 <acquire>
  if(f->ref < 1)
    80203dc6:	40dc                	lw	a5,4(s1)
    80203dc8:	02f05263          	blez	a5,80203dec <filedup+0x42>
    panic("filedup");
  f->ref++;
    80203dcc:	2785                	addiw	a5,a5,1
    80203dce:	c0dc                	sw	a5,4(s1)
  release(&ftable.lock);
    80203dd0:	0001a517          	auipc	a0,0x1a
    80203dd4:	68050513          	addi	a0,a0,1664 # 8021e450 <ftable>
    80203dd8:	ffffd097          	auipc	ra,0xffffd
    80203ddc:	942080e7          	jalr	-1726(ra) # 8020071a <release>
  return f;
}
    80203de0:	8526                	mv	a0,s1
    80203de2:	60e2                	ld	ra,24(sp)
    80203de4:	6442                	ld	s0,16(sp)
    80203de6:	64a2                	ld	s1,8(sp)
    80203de8:	6105                	addi	sp,sp,32
    80203dea:	8082                	ret
    panic("filedup");
    80203dec:	00006517          	auipc	a0,0x6
    80203df0:	e3c50513          	addi	a0,a0,-452 # 80209c28 <digits+0x8a8>
    80203df4:	ffffc097          	auipc	ra,0xffffc
    80203df8:	350080e7          	jalr	848(ra) # 80200144 <panic>

0000000080203dfc <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
    80203dfc:	7139                	addi	sp,sp,-64
    80203dfe:	fc06                	sd	ra,56(sp)
    80203e00:	f822                	sd	s0,48(sp)
    80203e02:	f426                	sd	s1,40(sp)
    80203e04:	f04a                	sd	s2,32(sp)
    80203e06:	ec4e                	sd	s3,24(sp)
    80203e08:	e852                	sd	s4,16(sp)
    80203e0a:	e456                	sd	s5,8(sp)
    80203e0c:	0080                	addi	s0,sp,64
    80203e0e:	84aa                	mv	s1,a0
  struct file ff;

  acquire(&ftable.lock);
    80203e10:	0001a517          	auipc	a0,0x1a
    80203e14:	64050513          	addi	a0,a0,1600 # 8021e450 <ftable>
    80203e18:	ffffd097          	auipc	ra,0xffffd
    80203e1c:	8ae080e7          	jalr	-1874(ra) # 802006c6 <acquire>
  if(f->ref < 1)
    80203e20:	40dc                	lw	a5,4(s1)
    80203e22:	04f05863          	blez	a5,80203e72 <fileclose+0x76>
    panic("fileclose");
  if(--f->ref > 0){
    80203e26:	37fd                	addiw	a5,a5,-1
    80203e28:	0007871b          	sext.w	a4,a5
    80203e2c:	c0dc                	sw	a5,4(s1)
    80203e2e:	04e04a63          	bgtz	a4,80203e82 <fileclose+0x86>
    release(&ftable.lock);
    return;
  }
  ff = *f;
    80203e32:	0004a903          	lw	s2,0(s1)
    80203e36:	0094ca03          	lbu	s4,9(s1)
    80203e3a:	0104b983          	ld	s3,16(s1)
    80203e3e:	0184ba83          	ld	s5,24(s1)
  f->ref = 0;
    80203e42:	0004a223          	sw	zero,4(s1)
  f->type = FD_NONE;
    80203e46:	0004a023          	sw	zero,0(s1)
  release(&ftable.lock);
    80203e4a:	0001a517          	auipc	a0,0x1a
    80203e4e:	60650513          	addi	a0,a0,1542 # 8021e450 <ftable>
    80203e52:	ffffd097          	auipc	ra,0xffffd
    80203e56:	8c8080e7          	jalr	-1848(ra) # 8020071a <release>

  if(ff.type == FD_PIPE){
    80203e5a:	4785                	li	a5,1
    80203e5c:	04f90463          	beq	s2,a5,80203ea4 <fileclose+0xa8>
    pipeclose(ff.pipe, ff.writable);
  } else if(ff.type == FD_ENTRY){
    80203e60:	4789                	li	a5,2
    80203e62:	02f91863          	bne	s2,a5,80203e92 <fileclose+0x96>
    eput(ff.ep);
    80203e66:	8556                	mv	a0,s5
    80203e68:	00003097          	auipc	ra,0x3
    80203e6c:	f38080e7          	jalr	-200(ra) # 80206da0 <eput>
    80203e70:	a00d                	j	80203e92 <fileclose+0x96>
    panic("fileclose");
    80203e72:	00006517          	auipc	a0,0x6
    80203e76:	dbe50513          	addi	a0,a0,-578 # 80209c30 <digits+0x8b0>
    80203e7a:	ffffc097          	auipc	ra,0xffffc
    80203e7e:	2ca080e7          	jalr	714(ra) # 80200144 <panic>
    release(&ftable.lock);
    80203e82:	0001a517          	auipc	a0,0x1a
    80203e86:	5ce50513          	addi	a0,a0,1486 # 8021e450 <ftable>
    80203e8a:	ffffd097          	auipc	ra,0xffffd
    80203e8e:	890080e7          	jalr	-1904(ra) # 8020071a <release>
  } else if (ff.type == FD_DEVICE) {

  }
}
    80203e92:	70e2                	ld	ra,56(sp)
    80203e94:	7442                	ld	s0,48(sp)
    80203e96:	74a2                	ld	s1,40(sp)
    80203e98:	7902                	ld	s2,32(sp)
    80203e9a:	69e2                	ld	s3,24(sp)
    80203e9c:	6a42                	ld	s4,16(sp)
    80203e9e:	6aa2                	ld	s5,8(sp)
    80203ea0:	6121                	addi	sp,sp,64
    80203ea2:	8082                	ret
    pipeclose(ff.pipe, ff.writable);
    80203ea4:	85d2                	mv	a1,s4
    80203ea6:	854e                	mv	a0,s3
    80203ea8:	00000097          	auipc	ra,0x0
    80203eac:	510080e7          	jalr	1296(ra) # 802043b8 <pipeclose>
    80203eb0:	b7cd                	j	80203e92 <fileclose+0x96>

0000000080203eb2 <filestat>:
filestat(struct file *f, uint64 addr)
{
  // struct proc *p = myproc();
  struct stat st;
  
  if(f->type == FD_ENTRY){
    80203eb2:	4118                	lw	a4,0(a0)
    80203eb4:	4789                	li	a5,2
    80203eb6:	04f71e63          	bne	a4,a5,80203f12 <filestat+0x60>
{
    80203eba:	7159                	addi	sp,sp,-112
    80203ebc:	f486                	sd	ra,104(sp)
    80203ebe:	f0a2                	sd	s0,96(sp)
    80203ec0:	eca6                	sd	s1,88(sp)
    80203ec2:	e8ca                	sd	s2,80(sp)
    80203ec4:	e4ce                	sd	s3,72(sp)
    80203ec6:	1880                	addi	s0,sp,112
    80203ec8:	84aa                	mv	s1,a0
    80203eca:	892e                	mv	s2,a1
    elock(f->ep);
    80203ecc:	6d08                	ld	a0,24(a0)
    80203ece:	00003097          	auipc	ra,0x3
    80203ed2:	e4e080e7          	jalr	-434(ra) # 80206d1c <elock>
    estat(f->ep, &st);
    80203ed6:	f9840993          	addi	s3,s0,-104
    80203eda:	85ce                	mv	a1,s3
    80203edc:	6c88                	ld	a0,24(s1)
    80203ede:	00003097          	auipc	ra,0x3
    80203ee2:	ffa080e7          	jalr	-6(ra) # 80206ed8 <estat>
    eunlock(f->ep);
    80203ee6:	6c88                	ld	a0,24(s1)
    80203ee8:	00003097          	auipc	ra,0x3
    80203eec:	e6a080e7          	jalr	-406(ra) # 80206d52 <eunlock>
    // if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    80203ef0:	03800613          	li	a2,56
    80203ef4:	85ce                	mv	a1,s3
    80203ef6:	854a                	mv	a0,s2
    80203ef8:	ffffd097          	auipc	ra,0xffffd
    80203efc:	47a080e7          	jalr	1146(ra) # 80201372 <copyout2>
    80203f00:	41f5551b          	sraiw	a0,a0,0x1f
      return -1;
    return 0;
  }
  return -1;
}
    80203f04:	70a6                	ld	ra,104(sp)
    80203f06:	7406                	ld	s0,96(sp)
    80203f08:	64e6                	ld	s1,88(sp)
    80203f0a:	6946                	ld	s2,80(sp)
    80203f0c:	69a6                	ld	s3,72(sp)
    80203f0e:	6165                	addi	sp,sp,112
    80203f10:	8082                	ret
  return -1;
    80203f12:	557d                	li	a0,-1
}
    80203f14:	8082                	ret

0000000080203f16 <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
    80203f16:	7179                	addi	sp,sp,-48
    80203f18:	f406                	sd	ra,40(sp)
    80203f1a:	f022                	sd	s0,32(sp)
    80203f1c:	ec26                	sd	s1,24(sp)
    80203f1e:	e84a                	sd	s2,16(sp)
    80203f20:	e44e                	sd	s3,8(sp)
    80203f22:	1800                	addi	s0,sp,48
  int r = 0;

  if(f->readable == 0)
    80203f24:	00854783          	lbu	a5,8(a0)
    80203f28:	c3d5                	beqz	a5,80203fcc <fileread+0xb6>
    80203f2a:	84aa                	mv	s1,a0
    80203f2c:	89ae                	mv	s3,a1
    80203f2e:	8932                	mv	s2,a2
    return -1;

  switch (f->type) {
    80203f30:	411c                	lw	a5,0(a0)
    80203f32:	4709                	li	a4,2
    80203f34:	06e78263          	beq	a5,a4,80203f98 <fileread+0x82>
    80203f38:	470d                	li	a4,3
    80203f3a:	02e78b63          	beq	a5,a4,80203f70 <fileread+0x5a>
    80203f3e:	4705                	li	a4,1
    80203f40:	00e78a63          	beq	a5,a4,80203f54 <fileread+0x3e>
          if((r = eread(f->ep, 1, addr, f->off, n)) > 0)
            f->off += r;
        eunlock(f->ep);
        break;
    default:
      panic("fileread");
    80203f44:	00006517          	auipc	a0,0x6
    80203f48:	cfc50513          	addi	a0,a0,-772 # 80209c40 <digits+0x8c0>
    80203f4c:	ffffc097          	auipc	ra,0xffffc
    80203f50:	1f8080e7          	jalr	504(ra) # 80200144 <panic>
        r = piperead(f->pipe, addr, n);
    80203f54:	6908                	ld	a0,16(a0)
    80203f56:	00000097          	auipc	ra,0x0
    80203f5a:	5d6080e7          	jalr	1494(ra) # 8020452c <piperead>
    80203f5e:	892a                	mv	s2,a0
  }

  return r;
}
    80203f60:	854a                	mv	a0,s2
    80203f62:	70a2                	ld	ra,40(sp)
    80203f64:	7402                	ld	s0,32(sp)
    80203f66:	64e2                	ld	s1,24(sp)
    80203f68:	6942                	ld	s2,16(sp)
    80203f6a:	69a2                	ld	s3,8(sp)
    80203f6c:	6145                	addi	sp,sp,48
    80203f6e:	8082                	ret
        if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
    80203f70:	02451783          	lh	a5,36(a0)
    80203f74:	03079693          	slli	a3,a5,0x30
    80203f78:	92c1                	srli	a3,a3,0x30
    80203f7a:	4725                	li	a4,9
    80203f7c:	04d76a63          	bltu	a4,a3,80203fd0 <fileread+0xba>
    80203f80:	0792                	slli	a5,a5,0x4
    80203f82:	0001a717          	auipc	a4,0x1a
    80203f86:	42e70713          	addi	a4,a4,1070 # 8021e3b0 <devsw>
    80203f8a:	97ba                	add	a5,a5,a4
    80203f8c:	639c                	ld	a5,0(a5)
    80203f8e:	c3b9                	beqz	a5,80203fd4 <fileread+0xbe>
        r = devsw[f->major].read(1, addr, n);
    80203f90:	4505                	li	a0,1
    80203f92:	9782                	jalr	a5
    80203f94:	892a                	mv	s2,a0
        break;
    80203f96:	b7e9                	j	80203f60 <fileread+0x4a>
        elock(f->ep);
    80203f98:	6d08                	ld	a0,24(a0)
    80203f9a:	00003097          	auipc	ra,0x3
    80203f9e:	d82080e7          	jalr	-638(ra) # 80206d1c <elock>
          if((r = eread(f->ep, 1, addr, f->off, n)) > 0)
    80203fa2:	874a                	mv	a4,s2
    80203fa4:	5094                	lw	a3,32(s1)
    80203fa6:	864e                	mv	a2,s3
    80203fa8:	4585                	li	a1,1
    80203faa:	6c88                	ld	a0,24(s1)
    80203fac:	00002097          	auipc	ra,0x2
    80203fb0:	46c080e7          	jalr	1132(ra) # 80206418 <eread>
    80203fb4:	892a                	mv	s2,a0
    80203fb6:	00a05563          	blez	a0,80203fc0 <fileread+0xaa>
            f->off += r;
    80203fba:	509c                	lw	a5,32(s1)
    80203fbc:	9fa9                	addw	a5,a5,a0
    80203fbe:	d09c                	sw	a5,32(s1)
        eunlock(f->ep);
    80203fc0:	6c88                	ld	a0,24(s1)
    80203fc2:	00003097          	auipc	ra,0x3
    80203fc6:	d90080e7          	jalr	-624(ra) # 80206d52 <eunlock>
        break;
    80203fca:	bf59                	j	80203f60 <fileread+0x4a>
    return -1;
    80203fcc:	597d                	li	s2,-1
    80203fce:	bf49                	j	80203f60 <fileread+0x4a>
          return -1;
    80203fd0:	597d                	li	s2,-1
    80203fd2:	b779                	j	80203f60 <fileread+0x4a>
    80203fd4:	597d                	li	s2,-1
    80203fd6:	b769                	j	80203f60 <fileread+0x4a>

0000000080203fd8 <filewrite>:

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
    80203fd8:	7179                	addi	sp,sp,-48
    80203fda:	f406                	sd	ra,40(sp)
    80203fdc:	f022                	sd	s0,32(sp)
    80203fde:	ec26                	sd	s1,24(sp)
    80203fe0:	e84a                	sd	s2,16(sp)
    80203fe2:	e44e                	sd	s3,8(sp)
    80203fe4:	e052                	sd	s4,0(sp)
    80203fe6:	1800                	addi	s0,sp,48
  int ret = 0;

  if(f->writable == 0)
    80203fe8:	00954783          	lbu	a5,9(a0)
    80203fec:	cbc5                	beqz	a5,8020409c <filewrite+0xc4>
    80203fee:	84aa                	mv	s1,a0
    80203ff0:	892e                	mv	s2,a1
    80203ff2:	89b2                	mv	s3,a2
    return -1;

  if(f->type == FD_PIPE){
    80203ff4:	411c                	lw	a5,0(a0)
    80203ff6:	4705                	li	a4,1
    80203ff8:	04e78963          	beq	a5,a4,8020404a <filewrite+0x72>
    ret = pipewrite(f->pipe, addr, n);
  } else if(f->type == FD_DEVICE){
    80203ffc:	470d                	li	a4,3
    80203ffe:	04e78d63          	beq	a5,a4,80204058 <filewrite+0x80>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
      return -1;
    ret = devsw[f->major].write(1, addr, n);
  } else if(f->type == FD_ENTRY){
    80204002:	4709                	li	a4,2
    80204004:	08e79463          	bne	a5,a4,8020408c <filewrite+0xb4>
    elock(f->ep);
    80204008:	6d08                	ld	a0,24(a0)
    8020400a:	00003097          	auipc	ra,0x3
    8020400e:	d12080e7          	jalr	-750(ra) # 80206d1c <elock>
    if (ewrite(f->ep, 1, addr, f->off, n) == n) {
    80204012:	00098a1b          	sext.w	s4,s3
    80204016:	8752                	mv	a4,s4
    80204018:	5094                	lw	a3,32(s1)
    8020401a:	864a                	mv	a2,s2
    8020401c:	4585                	li	a1,1
    8020401e:	6c88                	ld	a0,24(s1)
    80204020:	00002097          	auipc	ra,0x2
    80204024:	4f0080e7          	jalr	1264(ra) # 80206510 <ewrite>
      ret = n;
      f->off += n;
    } else {
      ret = -1;
    80204028:	597d                	li	s2,-1
    if (ewrite(f->ep, 1, addr, f->off, n) == n) {
    8020402a:	05350b63          	beq	a0,s3,80204080 <filewrite+0xa8>
    }
    eunlock(f->ep);
    8020402e:	6c88                	ld	a0,24(s1)
    80204030:	00003097          	auipc	ra,0x3
    80204034:	d22080e7          	jalr	-734(ra) # 80206d52 <eunlock>
  } else {
    panic("filewrite");
  }

  return ret;
}
    80204038:	854a                	mv	a0,s2
    8020403a:	70a2                	ld	ra,40(sp)
    8020403c:	7402                	ld	s0,32(sp)
    8020403e:	64e2                	ld	s1,24(sp)
    80204040:	6942                	ld	s2,16(sp)
    80204042:	69a2                	ld	s3,8(sp)
    80204044:	6a02                	ld	s4,0(sp)
    80204046:	6145                	addi	sp,sp,48
    80204048:	8082                	ret
    ret = pipewrite(f->pipe, addr, n);
    8020404a:	6908                	ld	a0,16(a0)
    8020404c:	00000097          	auipc	ra,0x0
    80204050:	3dc080e7          	jalr	988(ra) # 80204428 <pipewrite>
    80204054:	892a                	mv	s2,a0
    80204056:	b7cd                	j	80204038 <filewrite+0x60>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
    80204058:	02451783          	lh	a5,36(a0)
    8020405c:	03079693          	slli	a3,a5,0x30
    80204060:	92c1                	srli	a3,a3,0x30
    80204062:	4725                	li	a4,9
    80204064:	02d76e63          	bltu	a4,a3,802040a0 <filewrite+0xc8>
    80204068:	0792                	slli	a5,a5,0x4
    8020406a:	0001a717          	auipc	a4,0x1a
    8020406e:	34670713          	addi	a4,a4,838 # 8021e3b0 <devsw>
    80204072:	97ba                	add	a5,a5,a4
    80204074:	679c                	ld	a5,8(a5)
    80204076:	c79d                	beqz	a5,802040a4 <filewrite+0xcc>
    ret = devsw[f->major].write(1, addr, n);
    80204078:	4505                	li	a0,1
    8020407a:	9782                	jalr	a5
    8020407c:	892a                	mv	s2,a0
    8020407e:	bf6d                	j	80204038 <filewrite+0x60>
      f->off += n;
    80204080:	509c                	lw	a5,32(s1)
    80204082:	014787bb          	addw	a5,a5,s4
    80204086:	d09c                	sw	a5,32(s1)
      ret = n;
    80204088:	894e                	mv	s2,s3
    8020408a:	b755                	j	8020402e <filewrite+0x56>
    panic("filewrite");
    8020408c:	00006517          	auipc	a0,0x6
    80204090:	bc450513          	addi	a0,a0,-1084 # 80209c50 <digits+0x8d0>
    80204094:	ffffc097          	auipc	ra,0xffffc
    80204098:	0b0080e7          	jalr	176(ra) # 80200144 <panic>
    return -1;
    8020409c:	597d                	li	s2,-1
    8020409e:	bf69                	j	80204038 <filewrite+0x60>
      return -1;
    802040a0:	597d                	li	s2,-1
    802040a2:	bf59                	j	80204038 <filewrite+0x60>
    802040a4:	597d                	li	s2,-1
    802040a6:	bf49                	j	80204038 <filewrite+0x60>

00000000802040a8 <dirnext>:
int
dirnext(struct file *f, uint64 addr)
{
  // struct proc *p = myproc();

  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    802040a8:	00854783          	lbu	a5,8(a0)
    802040ac:	cfdd                	beqz	a5,8020416a <dirnext+0xc2>
{
    802040ae:	7141                	addi	sp,sp,-496
    802040b0:	f786                	sd	ra,488(sp)
    802040b2:	f3a2                	sd	s0,480(sp)
    802040b4:	efa6                	sd	s1,472(sp)
    802040b6:	ebca                	sd	s2,464(sp)
    802040b8:	e7ce                	sd	s3,456(sp)
    802040ba:	e3d2                	sd	s4,448(sp)
    802040bc:	ff56                	sd	s5,440(sp)
    802040be:	1b80                	addi	s0,sp,496
    802040c0:	84aa                	mv	s1,a0
    802040c2:	8aae                	mv	s5,a1
  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    802040c4:	6d18                	ld	a4,24(a0)
    802040c6:	10074783          	lbu	a5,256(a4)
    802040ca:	8bc1                	andi	a5,a5,16
    return -1;
    802040cc:	557d                	li	a0,-1
  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    802040ce:	eb91                	bnez	a5,802040e2 <dirnext+0x3a>
  // if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    return -1;

  return 1;
}
    802040d0:	70be                	ld	ra,488(sp)
    802040d2:	741e                	ld	s0,480(sp)
    802040d4:	64fe                	ld	s1,472(sp)
    802040d6:	695e                	ld	s2,464(sp)
    802040d8:	69be                	ld	s3,456(sp)
    802040da:	6a1e                	ld	s4,448(sp)
    802040dc:	7afa                	ld	s5,440(sp)
    802040de:	617d                	addi	sp,sp,496
    802040e0:	8082                	ret
  int count = 0;
    802040e2:	e0042e23          	sw	zero,-484(s0)
  elock(f->ep);
    802040e6:	853a                	mv	a0,a4
    802040e8:	00003097          	auipc	ra,0x3
    802040ec:	c34080e7          	jalr	-972(ra) # 80206d1c <elock>
  while ((ret = enext(f->ep, &de, f->off, &count)) == 0) {  // skip empty entry
    802040f0:	e1c40a13          	addi	s4,s0,-484
    802040f4:	e5840993          	addi	s3,s0,-424
    802040f8:	a801                	j	80204108 <dirnext+0x60>
    f->off += count * 32;
    802040fa:	e1c42783          	lw	a5,-484(s0)
    802040fe:	0057979b          	slliw	a5,a5,0x5
    80204102:	5098                	lw	a4,32(s1)
    80204104:	9fb9                	addw	a5,a5,a4
    80204106:	d09c                	sw	a5,32(s1)
  while ((ret = enext(f->ep, &de, f->off, &count)) == 0) {  // skip empty entry
    80204108:	86d2                	mv	a3,s4
    8020410a:	5090                	lw	a2,32(s1)
    8020410c:	85ce                	mv	a1,s3
    8020410e:	6c88                	ld	a0,24(s1)
    80204110:	00003097          	auipc	ra,0x3
    80204114:	e10080e7          	jalr	-496(ra) # 80206f20 <enext>
    80204118:	892a                	mv	s2,a0
    8020411a:	d165                	beqz	a0,802040fa <dirnext+0x52>
  eunlock(f->ep);
    8020411c:	6c88                	ld	a0,24(s1)
    8020411e:	00003097          	auipc	ra,0x3
    80204122:	c34080e7          	jalr	-972(ra) # 80206d52 <eunlock>
  if (ret == -1)
    80204126:	57fd                	li	a5,-1
    return 0;
    80204128:	4501                	li	a0,0
  if (ret == -1)
    8020412a:	faf903e3          	beq	s2,a5,802040d0 <dirnext+0x28>
  f->off += count * 32;
    8020412e:	e1c42783          	lw	a5,-484(s0)
    80204132:	0057979b          	slliw	a5,a5,0x5
    80204136:	5098                	lw	a4,32(s1)
    80204138:	9fb9                	addw	a5,a5,a4
    8020413a:	d09c                	sw	a5,32(s1)
  estat(&de, &st);
    8020413c:	e2040493          	addi	s1,s0,-480
    80204140:	85a6                	mv	a1,s1
    80204142:	e5840513          	addi	a0,s0,-424
    80204146:	00003097          	auipc	ra,0x3
    8020414a:	d92080e7          	jalr	-622(ra) # 80206ed8 <estat>
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    8020414e:	03800613          	li	a2,56
    80204152:	85a6                	mv	a1,s1
    80204154:	8556                	mv	a0,s5
    80204156:	ffffd097          	auipc	ra,0xffffd
    8020415a:	21c080e7          	jalr	540(ra) # 80201372 <copyout2>
    return -1;
    8020415e:	fff54513          	not	a0,a0
    80204162:	957d                	srai	a0,a0,0x3f
    80204164:	8909                	andi	a0,a0,2
    80204166:	157d                	addi	a0,a0,-1
    80204168:	b7a5                	j	802040d0 <dirnext+0x28>
    return -1;
    8020416a:	557d                	li	a0,-1
}
    8020416c:	8082                	ret

000000008020416e <dirnext_>:

//////////////////////////////////////////////////

int dirnext_(struct file *f, uint64 buffer, int len){
  
  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    8020416e:	00854783          	lbu	a5,8(a0)
    80204172:	12078263          	beqz	a5,80204296 <dirnext_+0x128>
int dirnext_(struct file *f, uint64 buffer, int len){
    80204176:	d0010113          	addi	sp,sp,-768
    8020417a:	2e113c23          	sd	ra,760(sp)
    8020417e:	2e813823          	sd	s0,752(sp)
    80204182:	2e913423          	sd	s1,744(sp)
    80204186:	2f213023          	sd	s2,736(sp)
    8020418a:	2d313c23          	sd	s3,728(sp)
    8020418e:	2d413823          	sd	s4,720(sp)
    80204192:	2d513423          	sd	s5,712(sp)
    80204196:	2d613023          	sd	s6,704(sp)
    8020419a:	2b713c23          	sd	s7,696(sp)
    8020419e:	2b813823          	sd	s8,688(sp)
    802041a2:	2b913423          	sd	s9,680(sp)
    802041a6:	2ba13023          	sd	s10,672(sp)
    802041aa:	29b13c23          	sd	s11,664(sp)
    802041ae:	0600                	addi	s0,sp,768
    802041b0:	84aa                	mv	s1,a0
    802041b2:	892e                	mv	s2,a1
    802041b4:	8db2                	mv	s11,a2
  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    802041b6:	6d08                	ld	a0,24(a0)
    802041b8:	10054783          	lbu	a5,256(a0)
    802041bc:	8bc1                	andi	a5,a5,16
    802041be:	cff1                	beqz	a5,8020429a <dirnext_+0x12c>
    return -1;

  struct dirent de;
  struct __dirent__ de_;
  int count = 0;
    802041c0:	d0042623          	sw	zero,-756(s0)
  int ret_size = len;
  int ret;
  elock(f->ep);
    802041c4:	00003097          	auipc	ra,0x3
    802041c8:	b58080e7          	jalr	-1192(ra) # 80206d1c <elock>
    802041cc:	89ee                	mv	s3,s11
  while(1){
    de_.d_off = f-> off;
    ret = enext(f->ep, &de, f->off, &count);
    802041ce:	d0c40b13          	addi	s6,s0,-756
    802041d2:	e2840a13          	addi	s4,s0,-472
    f->off += count * 32;
    if(ret == 0) {
      continue;
    }
    if(ret == -1) {
    802041d6:	5c7d                	li	s8,-1
      return 0;
    }
    copyout3(de_.d_name, de.filename, sizeof(de.filename));
    802041d8:	d2340a93          	addi	s5,s0,-733
    } else{
      de_.d_type = T_FILE;
    }
    de_.d_ino = 0;
    int size = sizeof(struct __dirent__) - sizeof(de_.d_name) + strlen(de_.d_name) + 1;
    size += (sizeof(uint64) - (size % sizeof(uint64))) % sizeof(uint64); // Align to 8.
    802041dc:	5c9d                	li	s9,-25
    de_.d_reclen = size;
    if(de_.d_reclen > len){
    802041de:	6bc1                	lui	s7,0x10
    802041e0:	1bfd                	addi	s7,s7,-1 # ffff <_entry-0x801f0001>
      break;
    }
    if(copyout2(buffer, (char *)&de_, sizeof(de_.d_reclen)) < 0)
    802041e2:	d1040d13          	addi	s10,s0,-752
    de_.d_off = f-> off;
    802041e6:	5090                	lw	a2,32(s1)
    802041e8:	02061793          	slli	a5,a2,0x20
    802041ec:	9381                	srli	a5,a5,0x20
    802041ee:	d0f43c23          	sd	a5,-744(s0)
    ret = enext(f->ep, &de, f->off, &count);
    802041f2:	86da                	mv	a3,s6
    802041f4:	85d2                	mv	a1,s4
    802041f6:	6c88                	ld	a0,24(s1)
    802041f8:	00003097          	auipc	ra,0x3
    802041fc:	d28080e7          	jalr	-728(ra) # 80206f20 <enext>
    f->off += count * 32;
    80204200:	d0c42783          	lw	a5,-756(s0)
    80204204:	0057979b          	slliw	a5,a5,0x5
    80204208:	5098                	lw	a4,32(s1)
    8020420a:	9fb9                	addw	a5,a5,a4
    8020420c:	d09c                	sw	a5,32(s1)
    if(ret == 0) {
    8020420e:	dd61                	beqz	a0,802041e6 <dirnext_+0x78>
    if(ret == -1) {
    80204210:	09850763          	beq	a0,s8,8020429e <dirnext_+0x130>
    copyout3(de_.d_name, de.filename, sizeof(de.filename));
    80204214:	10000613          	li	a2,256
    80204218:	85d2                	mv	a1,s4
    8020421a:	8556                	mv	a0,s5
    8020421c:	ffffd097          	auipc	ra,0xffffd
    80204220:	1a8080e7          	jalr	424(ra) # 802013c4 <copyout3>
    if(de.attribute & ATTR_DIRECTORY){
    80204224:	f2844783          	lbu	a5,-216(s0)
    80204228:	8bc1                	andi	a5,a5,16
      de_.d_type = T_FILE;
    8020422a:	0017b793          	seqz	a5,a5
    8020422e:	0785                	addi	a5,a5,1
    80204230:	d2f40123          	sb	a5,-734(s0)
    de_.d_ino = 0;
    80204234:	d0043823          	sd	zero,-752(s0)
    int size = sizeof(struct __dirent__) - sizeof(de_.d_name) + strlen(de_.d_name) + 1;
    80204238:	8556                	mv	a0,s5
    8020423a:	ffffc097          	auipc	ra,0xffffc
    8020423e:	6ac080e7          	jalr	1708(ra) # 802008e6 <strlen>
    size += (sizeof(uint64) - (size % sizeof(uint64))) % sizeof(uint64); // Align to 8.
    80204242:	40ac87bb          	subw	a5,s9,a0
    80204246:	8b9d                	andi	a5,a5,7
    int size = sizeof(struct __dirent__) - sizeof(de_.d_name) + strlen(de_.d_name) + 1;
    80204248:	2565                	addiw	a0,a0,25
    size += (sizeof(uint64) - (size % sizeof(uint64))) % sizeof(uint64); // Align to 8.
    8020424a:	9d3d                	addw	a0,a0,a5
    de_.d_reclen = size;
    8020424c:	d2a41023          	sh	a0,-736(s0)
    if(de_.d_reclen > len){
    80204250:	00abf533          	and	a0,s7,a0
    80204254:	2501                	sext.w	a0,a0
    80204256:	02a9c163          	blt	s3,a0,80204278 <dirnext_+0x10a>
    if(copyout2(buffer, (char *)&de_, sizeof(de_.d_reclen)) < 0)
    8020425a:	4609                	li	a2,2
    8020425c:	85ea                	mv	a1,s10
    8020425e:	854a                	mv	a0,s2
    80204260:	ffffd097          	auipc	ra,0xffffd
    80204264:	112080e7          	jalr	274(ra) # 80201372 <copyout2>
    80204268:	06054963          	bltz	a0,802042da <dirnext_+0x16c>
      return -1;
    buffer += de_.d_reclen;
    8020426c:	d2045783          	lhu	a5,-736(s0)
    80204270:	993e                	add	s2,s2,a5
    len -= de_.d_reclen;
    80204272:	40f989bb          	subw	s3,s3,a5
    80204276:	bf85                	j	802041e6 <dirnext_+0x78>
  }
  eunlock(f->ep);
    80204278:	6c88                	ld	a0,24(s1)
    8020427a:	00003097          	auipc	ra,0x3
    8020427e:	ad8080e7          	jalr	-1320(ra) # 80206d52 <eunlock>
  f->off += count * 32;
    80204282:	d0c42783          	lw	a5,-756(s0)
    80204286:	0057979b          	slliw	a5,a5,0x5
    8020428a:	5098                	lw	a4,32(s1)
    8020428c:	9fb9                	addw	a5,a5,a4
    8020428e:	d09c                	sw	a5,32(s1)
  return ret_size - len;
    80204290:	413d853b          	subw	a0,s11,s3
    80204294:	a031                	j	802042a0 <dirnext_+0x132>
    return -1;
    80204296:	557d                	li	a0,-1
}
    80204298:	8082                	ret
    return -1;
    8020429a:	557d                	li	a0,-1
    8020429c:	a011                	j	802042a0 <dirnext_+0x132>
      return 0;
    8020429e:	4501                	li	a0,0
}
    802042a0:	2f813083          	ld	ra,760(sp)
    802042a4:	2f013403          	ld	s0,752(sp)
    802042a8:	2e813483          	ld	s1,744(sp)
    802042ac:	2e013903          	ld	s2,736(sp)
    802042b0:	2d813983          	ld	s3,728(sp)
    802042b4:	2d013a03          	ld	s4,720(sp)
    802042b8:	2c813a83          	ld	s5,712(sp)
    802042bc:	2c013b03          	ld	s6,704(sp)
    802042c0:	2b813b83          	ld	s7,696(sp)
    802042c4:	2b013c03          	ld	s8,688(sp)
    802042c8:	2a813c83          	ld	s9,680(sp)
    802042cc:	2a013d03          	ld	s10,672(sp)
    802042d0:	29813d83          	ld	s11,664(sp)
    802042d4:	30010113          	addi	sp,sp,768
    802042d8:	8082                	ret
      return -1;
    802042da:	557d                	li	a0,-1
    802042dc:	b7d1                	j	802042a0 <dirnext_+0x132>

00000000802042de <pipealloc>:
#include "include/kalloc.h"
#include "include/vm.h"

int
pipealloc(struct file **f0, struct file **f1)
{
    802042de:	7179                	addi	sp,sp,-48
    802042e0:	f406                	sd	ra,40(sp)
    802042e2:	f022                	sd	s0,32(sp)
    802042e4:	ec26                	sd	s1,24(sp)
    802042e6:	e84a                	sd	s2,16(sp)
    802042e8:	e44e                	sd	s3,8(sp)
    802042ea:	e052                	sd	s4,0(sp)
    802042ec:	1800                	addi	s0,sp,48
    802042ee:	84aa                	mv	s1,a0
    802042f0:	8a2e                	mv	s4,a1
  struct pipe *pi;

  pi = 0;
  *f0 = *f1 = 0;
    802042f2:	0005b023          	sd	zero,0(a1)
    802042f6:	00053023          	sd	zero,0(a0)
  if((*f0 = filealloc()) == NULL || (*f1 = filealloc()) == NULL)
    802042fa:	00000097          	auipc	ra,0x0
    802042fe:	a46080e7          	jalr	-1466(ra) # 80203d40 <filealloc>
    80204302:	e088                	sd	a0,0(s1)
    80204304:	c551                	beqz	a0,80204390 <pipealloc+0xb2>
    80204306:	00000097          	auipc	ra,0x0
    8020430a:	a3a080e7          	jalr	-1478(ra) # 80203d40 <filealloc>
    8020430e:	00aa3023          	sd	a0,0(s4)
    80204312:	c92d                	beqz	a0,80204384 <pipealloc+0xa6>
    goto bad;
  if((pi = (struct pipe*)kalloc()) == NULL)
    80204314:	ffffc097          	auipc	ra,0xffffc
    80204318:	246080e7          	jalr	582(ra) # 8020055a <kalloc>
    8020431c:	892a                	mv	s2,a0
    8020431e:	c125                	beqz	a0,8020437e <pipealloc+0xa0>
    goto bad;
  pi->readopen = 1;
    80204320:	4985                	li	s3,1
    80204322:	23352023          	sw	s3,544(a0)
  pi->writeopen = 1;
    80204326:	23352223          	sw	s3,548(a0)
  pi->nwrite = 0;
    8020432a:	20052e23          	sw	zero,540(a0)
  pi->nread = 0;
    8020432e:	20052c23          	sw	zero,536(a0)
  initlock(&pi->lock, "pipe");
    80204332:	00005597          	auipc	a1,0x5
    80204336:	6a658593          	addi	a1,a1,1702 # 802099d8 <digits+0x658>
    8020433a:	ffffc097          	auipc	ra,0xffffc
    8020433e:	348080e7          	jalr	840(ra) # 80200682 <initlock>
  (*f0)->type = FD_PIPE;
    80204342:	609c                	ld	a5,0(s1)
    80204344:	0137a023          	sw	s3,0(a5)
  (*f0)->readable = 1;
    80204348:	609c                	ld	a5,0(s1)
    8020434a:	01378423          	sb	s3,8(a5)
  (*f0)->writable = 0;
    8020434e:	609c                	ld	a5,0(s1)
    80204350:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
    80204354:	609c                	ld	a5,0(s1)
    80204356:	0127b823          	sd	s2,16(a5)
  (*f1)->type = FD_PIPE;
    8020435a:	000a3783          	ld	a5,0(s4)
    8020435e:	0137a023          	sw	s3,0(a5)
  (*f1)->readable = 0;
    80204362:	000a3783          	ld	a5,0(s4)
    80204366:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
    8020436a:	000a3783          	ld	a5,0(s4)
    8020436e:	013784a3          	sb	s3,9(a5)
  (*f1)->pipe = pi;
    80204372:	000a3783          	ld	a5,0(s4)
    80204376:	0127b823          	sd	s2,16(a5)
  return 0;
    8020437a:	4501                	li	a0,0
    8020437c:	a025                	j	802043a4 <pipealloc+0xc6>

 bad:
  if(pi)
    kfree((char*)pi);
  if(*f0)
    8020437e:	6088                	ld	a0,0(s1)
    80204380:	e501                	bnez	a0,80204388 <pipealloc+0xaa>
    80204382:	a039                	j	80204390 <pipealloc+0xb2>
    80204384:	6088                	ld	a0,0(s1)
    80204386:	c51d                	beqz	a0,802043b4 <pipealloc+0xd6>
    fileclose(*f0);
    80204388:	00000097          	auipc	ra,0x0
    8020438c:	a74080e7          	jalr	-1420(ra) # 80203dfc <fileclose>
  if(*f1)
    80204390:	000a3783          	ld	a5,0(s4)
    fileclose(*f1);
  return -1;
    80204394:	557d                	li	a0,-1
  if(*f1)
    80204396:	c799                	beqz	a5,802043a4 <pipealloc+0xc6>
    fileclose(*f1);
    80204398:	853e                	mv	a0,a5
    8020439a:	00000097          	auipc	ra,0x0
    8020439e:	a62080e7          	jalr	-1438(ra) # 80203dfc <fileclose>
  return -1;
    802043a2:	557d                	li	a0,-1
}
    802043a4:	70a2                	ld	ra,40(sp)
    802043a6:	7402                	ld	s0,32(sp)
    802043a8:	64e2                	ld	s1,24(sp)
    802043aa:	6942                	ld	s2,16(sp)
    802043ac:	69a2                	ld	s3,8(sp)
    802043ae:	6a02                	ld	s4,0(sp)
    802043b0:	6145                	addi	sp,sp,48
    802043b2:	8082                	ret
  return -1;
    802043b4:	557d                	li	a0,-1
    802043b6:	b7fd                	j	802043a4 <pipealloc+0xc6>

00000000802043b8 <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
    802043b8:	1101                	addi	sp,sp,-32
    802043ba:	ec06                	sd	ra,24(sp)
    802043bc:	e822                	sd	s0,16(sp)
    802043be:	e426                	sd	s1,8(sp)
    802043c0:	e04a                	sd	s2,0(sp)
    802043c2:	1000                	addi	s0,sp,32
    802043c4:	84aa                	mv	s1,a0
    802043c6:	892e                	mv	s2,a1
  acquire(&pi->lock);
    802043c8:	ffffc097          	auipc	ra,0xffffc
    802043cc:	2fe080e7          	jalr	766(ra) # 802006c6 <acquire>
  if(writable){
    802043d0:	02090d63          	beqz	s2,8020440a <pipeclose+0x52>
    pi->writeopen = 0;
    802043d4:	2204a223          	sw	zero,548(s1)
    wakeup(&pi->nread);
    802043d8:	21848513          	addi	a0,s1,536
    802043dc:	ffffe097          	auipc	ra,0xffffe
    802043e0:	0d2080e7          	jalr	210(ra) # 802024ae <wakeup>
  } else {
    pi->readopen = 0;
    wakeup(&pi->nwrite);
  }
  if(pi->readopen == 0 && pi->writeopen == 0){
    802043e4:	2204b783          	ld	a5,544(s1)
    802043e8:	eb95                	bnez	a5,8020441c <pipeclose+0x64>
    release(&pi->lock);
    802043ea:	8526                	mv	a0,s1
    802043ec:	ffffc097          	auipc	ra,0xffffc
    802043f0:	32e080e7          	jalr	814(ra) # 8020071a <release>
    kfree((char*)pi);
    802043f4:	8526                	mv	a0,s1
    802043f6:	ffffc097          	auipc	ra,0xffffc
    802043fa:	04a080e7          	jalr	74(ra) # 80200440 <kfree>
  } else
    release(&pi->lock);
}
    802043fe:	60e2                	ld	ra,24(sp)
    80204400:	6442                	ld	s0,16(sp)
    80204402:	64a2                	ld	s1,8(sp)
    80204404:	6902                	ld	s2,0(sp)
    80204406:	6105                	addi	sp,sp,32
    80204408:	8082                	ret
    pi->readopen = 0;
    8020440a:	2204a023          	sw	zero,544(s1)
    wakeup(&pi->nwrite);
    8020440e:	21c48513          	addi	a0,s1,540
    80204412:	ffffe097          	auipc	ra,0xffffe
    80204416:	09c080e7          	jalr	156(ra) # 802024ae <wakeup>
    8020441a:	b7e9                	j	802043e4 <pipeclose+0x2c>
    release(&pi->lock);
    8020441c:	8526                	mv	a0,s1
    8020441e:	ffffc097          	auipc	ra,0xffffc
    80204422:	2fc080e7          	jalr	764(ra) # 8020071a <release>
}
    80204426:	bfe1                	j	802043fe <pipeclose+0x46>

0000000080204428 <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
    80204428:	7159                	addi	sp,sp,-112
    8020442a:	f486                	sd	ra,104(sp)
    8020442c:	f0a2                	sd	s0,96(sp)
    8020442e:	eca6                	sd	s1,88(sp)
    80204430:	e8ca                	sd	s2,80(sp)
    80204432:	e4ce                	sd	s3,72(sp)
    80204434:	e0d2                	sd	s4,64(sp)
    80204436:	fc56                	sd	s5,56(sp)
    80204438:	f85a                	sd	s6,48(sp)
    8020443a:	f45e                	sd	s7,40(sp)
    8020443c:	f062                	sd	s8,32(sp)
    8020443e:	ec66                	sd	s9,24(sp)
    80204440:	1880                	addi	s0,sp,112
    80204442:	84aa                	mv	s1,a0
    80204444:	8b2e                	mv	s6,a1
    80204446:	8ab2                	mv	s5,a2
  int i;
  char ch;
  struct proc *pr = myproc();
    80204448:	ffffd097          	auipc	ra,0xffffd
    8020444c:	646080e7          	jalr	1606(ra) # 80201a8e <myproc>
    80204450:	892a                	mv	s2,a0

  acquire(&pi->lock);
    80204452:	8526                	mv	a0,s1
    80204454:	ffffc097          	auipc	ra,0xffffc
    80204458:	272080e7          	jalr	626(ra) # 802006c6 <acquire>
  for(i = 0; i < n; i++){
    8020445c:	09505763          	blez	s5,802044ea <pipewrite+0xc2>
    80204460:	4b81                	li	s7,0
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
      if(pi->readopen == 0 || pr->killed){
        release(&pi->lock);
        return -1;
      }
      wakeup(&pi->nread);
    80204462:	21848a13          	addi	s4,s1,536
      sleep(&pi->nwrite, &pi->lock);
    80204466:	21c48993          	addi	s3,s1,540
    }
    // if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    if(copyin2(&ch, addr + i, 1) == -1)
    8020446a:	f9f40c93          	addi	s9,s0,-97
    8020446e:	5c7d                	li	s8,-1
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
    80204470:	2184a783          	lw	a5,536(s1)
    80204474:	21c4a703          	lw	a4,540(s1)
    80204478:	2007879b          	addiw	a5,a5,512
    8020447c:	02f71b63          	bne	a4,a5,802044b2 <pipewrite+0x8a>
      if(pi->readopen == 0 || pr->killed){
    80204480:	2204a783          	lw	a5,544(s1)
    80204484:	c3c1                	beqz	a5,80204504 <pipewrite+0xdc>
    80204486:	03092783          	lw	a5,48(s2)
    8020448a:	efad                	bnez	a5,80204504 <pipewrite+0xdc>
      wakeup(&pi->nread);
    8020448c:	8552                	mv	a0,s4
    8020448e:	ffffe097          	auipc	ra,0xffffe
    80204492:	020080e7          	jalr	32(ra) # 802024ae <wakeup>
      sleep(&pi->nwrite, &pi->lock);
    80204496:	85a6                	mv	a1,s1
    80204498:	854e                	mv	a0,s3
    8020449a:	ffffe097          	auipc	ra,0xffffe
    8020449e:	e98080e7          	jalr	-360(ra) # 80202332 <sleep>
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
    802044a2:	2184a783          	lw	a5,536(s1)
    802044a6:	21c4a703          	lw	a4,540(s1)
    802044aa:	2007879b          	addiw	a5,a5,512
    802044ae:	fcf709e3          	beq	a4,a5,80204480 <pipewrite+0x58>
    if(copyin2(&ch, addr + i, 1) == -1)
    802044b2:	4605                	li	a2,1
    802044b4:	85da                	mv	a1,s6
    802044b6:	8566                	mv	a0,s9
    802044b8:	ffffd097          	auipc	ra,0xffffd
    802044bc:	fec080e7          	jalr	-20(ra) # 802014a4 <copyin2>
    802044c0:	03850663          	beq	a0,s8,802044ec <pipewrite+0xc4>
      break;
    pi->data[pi->nwrite++ % PIPESIZE] = ch;
    802044c4:	21c4a783          	lw	a5,540(s1)
    802044c8:	0017871b          	addiw	a4,a5,1
    802044cc:	20e4ae23          	sw	a4,540(s1)
    802044d0:	1ff7f793          	andi	a5,a5,511
    802044d4:	97a6                	add	a5,a5,s1
    802044d6:	f9f44703          	lbu	a4,-97(s0)
    802044da:	00e78c23          	sb	a4,24(a5)
  for(i = 0; i < n; i++){
    802044de:	2b85                	addiw	s7,s7,1
    802044e0:	0b05                	addi	s6,s6,1
    802044e2:	f97a97e3          	bne	s5,s7,80204470 <pipewrite+0x48>
    802044e6:	8bd6                	mv	s7,s5
    802044e8:	a011                	j	802044ec <pipewrite+0xc4>
    802044ea:	4b81                	li	s7,0
  }
  wakeup(&pi->nread);
    802044ec:	21848513          	addi	a0,s1,536
    802044f0:	ffffe097          	auipc	ra,0xffffe
    802044f4:	fbe080e7          	jalr	-66(ra) # 802024ae <wakeup>
  release(&pi->lock);
    802044f8:	8526                	mv	a0,s1
    802044fa:	ffffc097          	auipc	ra,0xffffc
    802044fe:	220080e7          	jalr	544(ra) # 8020071a <release>
  return i;
    80204502:	a039                	j	80204510 <pipewrite+0xe8>
        release(&pi->lock);
    80204504:	8526                	mv	a0,s1
    80204506:	ffffc097          	auipc	ra,0xffffc
    8020450a:	214080e7          	jalr	532(ra) # 8020071a <release>
        return -1;
    8020450e:	5bfd                	li	s7,-1
}
    80204510:	855e                	mv	a0,s7
    80204512:	70a6                	ld	ra,104(sp)
    80204514:	7406                	ld	s0,96(sp)
    80204516:	64e6                	ld	s1,88(sp)
    80204518:	6946                	ld	s2,80(sp)
    8020451a:	69a6                	ld	s3,72(sp)
    8020451c:	6a06                	ld	s4,64(sp)
    8020451e:	7ae2                	ld	s5,56(sp)
    80204520:	7b42                	ld	s6,48(sp)
    80204522:	7ba2                	ld	s7,40(sp)
    80204524:	7c02                	ld	s8,32(sp)
    80204526:	6ce2                	ld	s9,24(sp)
    80204528:	6165                	addi	sp,sp,112
    8020452a:	8082                	ret

000000008020452c <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
    8020452c:	715d                	addi	sp,sp,-80
    8020452e:	e486                	sd	ra,72(sp)
    80204530:	e0a2                	sd	s0,64(sp)
    80204532:	fc26                	sd	s1,56(sp)
    80204534:	f84a                	sd	s2,48(sp)
    80204536:	f44e                	sd	s3,40(sp)
    80204538:	f052                	sd	s4,32(sp)
    8020453a:	ec56                	sd	s5,24(sp)
    8020453c:	e85a                	sd	s6,16(sp)
    8020453e:	0880                	addi	s0,sp,80
    80204540:	84aa                	mv	s1,a0
    80204542:	892e                	mv	s2,a1
    80204544:	8a32                	mv	s4,a2
  int i;
  struct proc *pr = myproc();
    80204546:	ffffd097          	auipc	ra,0xffffd
    8020454a:	548080e7          	jalr	1352(ra) # 80201a8e <myproc>
    8020454e:	89aa                	mv	s3,a0
  char ch;

  acquire(&pi->lock);
    80204550:	8526                	mv	a0,s1
    80204552:	ffffc097          	auipc	ra,0xffffc
    80204556:	174080e7          	jalr	372(ra) # 802006c6 <acquire>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    8020455a:	2184a703          	lw	a4,536(s1)
    8020455e:	21c4a783          	lw	a5,540(s1)
    if(pr->killed){
      release(&pi->lock);
      return -1;
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    80204562:	21848a93          	addi	s5,s1,536
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80204566:	02f71463          	bne	a4,a5,8020458e <piperead+0x62>
    8020456a:	2244a783          	lw	a5,548(s1)
    8020456e:	c385                	beqz	a5,8020458e <piperead+0x62>
    if(pr->killed){
    80204570:	0309a783          	lw	a5,48(s3)
    80204574:	ebc1                	bnez	a5,80204604 <piperead+0xd8>
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    80204576:	85a6                	mv	a1,s1
    80204578:	8556                	mv	a0,s5
    8020457a:	ffffe097          	auipc	ra,0xffffe
    8020457e:	db8080e7          	jalr	-584(ra) # 80202332 <sleep>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80204582:	2184a703          	lw	a4,536(s1)
    80204586:	21c4a783          	lw	a5,540(s1)
    8020458a:	fef700e3          	beq	a4,a5,8020456a <piperead+0x3e>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    8020458e:	4981                	li	s3,0
    if(pi->nread == pi->nwrite)
      break;
    ch = pi->data[pi->nread++ % PIPESIZE];
    // if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    if(copyout2(addr + i, &ch, 1) == -1)
    80204590:	fbf40b13          	addi	s6,s0,-65
    80204594:	5afd                	li	s5,-1
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    80204596:	05405163          	blez	s4,802045d8 <piperead+0xac>
    if(pi->nread == pi->nwrite)
    8020459a:	2184a783          	lw	a5,536(s1)
    8020459e:	21c4a703          	lw	a4,540(s1)
    802045a2:	02f70b63          	beq	a4,a5,802045d8 <piperead+0xac>
    ch = pi->data[pi->nread++ % PIPESIZE];
    802045a6:	0017871b          	addiw	a4,a5,1
    802045aa:	20e4ac23          	sw	a4,536(s1)
    802045ae:	1ff7f793          	andi	a5,a5,511
    802045b2:	97a6                	add	a5,a5,s1
    802045b4:	0187c783          	lbu	a5,24(a5)
    802045b8:	faf40fa3          	sb	a5,-65(s0)
    if(copyout2(addr + i, &ch, 1) == -1)
    802045bc:	4605                	li	a2,1
    802045be:	85da                	mv	a1,s6
    802045c0:	854a                	mv	a0,s2
    802045c2:	ffffd097          	auipc	ra,0xffffd
    802045c6:	db0080e7          	jalr	-592(ra) # 80201372 <copyout2>
    802045ca:	01550763          	beq	a0,s5,802045d8 <piperead+0xac>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    802045ce:	2985                	addiw	s3,s3,1
    802045d0:	0905                	addi	s2,s2,1
    802045d2:	fd3a14e3          	bne	s4,s3,8020459a <piperead+0x6e>
    802045d6:	89d2                	mv	s3,s4
      break;
  }
  wakeup(&pi->nwrite);  //DOC: piperead-wakeup
    802045d8:	21c48513          	addi	a0,s1,540
    802045dc:	ffffe097          	auipc	ra,0xffffe
    802045e0:	ed2080e7          	jalr	-302(ra) # 802024ae <wakeup>
  release(&pi->lock);
    802045e4:	8526                	mv	a0,s1
    802045e6:	ffffc097          	auipc	ra,0xffffc
    802045ea:	134080e7          	jalr	308(ra) # 8020071a <release>
  return i;
}
    802045ee:	854e                	mv	a0,s3
    802045f0:	60a6                	ld	ra,72(sp)
    802045f2:	6406                	ld	s0,64(sp)
    802045f4:	74e2                	ld	s1,56(sp)
    802045f6:	7942                	ld	s2,48(sp)
    802045f8:	79a2                	ld	s3,40(sp)
    802045fa:	7a02                	ld	s4,32(sp)
    802045fc:	6ae2                	ld	s5,24(sp)
    802045fe:	6b42                	ld	s6,16(sp)
    80204600:	6161                	addi	sp,sp,80
    80204602:	8082                	ret
      release(&pi->lock);
    80204604:	8526                	mv	a0,s1
    80204606:	ffffc097          	auipc	ra,0xffffc
    8020460a:	114080e7          	jalr	276(ra) # 8020071a <release>
      return -1;
    8020460e:	59fd                	li	s3,-1
    80204610:	bff9                	j	802045ee <piperead+0xc2>

0000000080204612 <exec>:
  return 0;
}


int exec(char *path, char **argv)
{
    80204612:	dd010113          	addi	sp,sp,-560
    80204616:	22113423          	sd	ra,552(sp)
    8020461a:	22813023          	sd	s0,544(sp)
    8020461e:	20913c23          	sd	s1,536(sp)
    80204622:	21213823          	sd	s2,528(sp)
    80204626:	21313423          	sd	s3,520(sp)
    8020462a:	21413023          	sd	s4,512(sp)
    8020462e:	ffd6                	sd	s5,504(sp)
    80204630:	fbda                	sd	s6,496(sp)
    80204632:	f7de                	sd	s7,488(sp)
    80204634:	f3e2                	sd	s8,480(sp)
    80204636:	efe6                	sd	s9,472(sp)
    80204638:	ebea                	sd	s10,464(sp)
    8020463a:	e7ee                	sd	s11,456(sp)
    8020463c:	1c00                	addi	s0,sp,560
    8020463e:	892a                	mv	s2,a0
    80204640:	dca43c23          	sd	a0,-552(s0)
    80204644:	deb43423          	sd	a1,-536(s0)
  struct elfhdr elf;
  struct dirent *ep;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
  pagetable_t kpagetable = 0, oldkpagetable;
  struct proc *p = myproc();
    80204648:	ffffd097          	auipc	ra,0xffffd
    8020464c:	446080e7          	jalr	1094(ra) # 80201a8e <myproc>
    80204650:	84aa                	mv	s1,a0

  // Make a copy of p->kpt without old user space, 
  // but with the same kstack we are using now, which can't be changed
  if ((kpagetable = (pagetable_t)kalloc()) == NULL) {
    80204652:	ffffc097          	auipc	ra,0xffffc
    80204656:	f08080e7          	jalr	-248(ra) # 8020055a <kalloc>
    8020465a:	2a050863          	beqz	a0,8020490a <exec+0x2f8>
    8020465e:	8b2a                	mv	s6,a0
    return -1;
  }
  memmove(kpagetable, p->kpagetable, PGSIZE);
    80204660:	6605                	lui	a2,0x1
    80204662:	6cac                	ld	a1,88(s1)
    80204664:	ffffc097          	auipc	ra,0xffffc
    80204668:	15a080e7          	jalr	346(ra) # 802007be <memmove>
  for (int i = 0; i < PX(2, MAXUVA); i++) {
    kpagetable[i] = 0;
    8020466c:	000b3023          	sd	zero,0(s6)
    80204670:	000b3423          	sd	zero,8(s6)
  }

  if((ep = ename(path)) == NULL) {
    80204674:	854a                	mv	a0,s2
    80204676:	00003097          	auipc	ra,0x3
    8020467a:	de0080e7          	jalr	-544(ra) # 80207456 <ename>
    8020467e:	8a2a                	mv	s4,a0
    80204680:	3a050e63          	beqz	a0,80204a3c <exec+0x42a>
    #ifdef DEBUG
    printf("[exec] %s not found\n", path);
    #endif
    goto bad;
  }
  elock(ep);
    80204684:	00002097          	auipc	ra,0x2
    80204688:	698080e7          	jalr	1688(ra) # 80206d1c <elock>

  // Check ELF header
  if(eread(ep, 0, (uint64) &elf, 0, sizeof(elf)) != sizeof(elf))
    8020468c:	04000713          	li	a4,64
    80204690:	4681                	li	a3,0
    80204692:	e4840613          	addi	a2,s0,-440
    80204696:	4581                	li	a1,0
    80204698:	8552                	mv	a0,s4
    8020469a:	00002097          	auipc	ra,0x2
    8020469e:	d7e080e7          	jalr	-642(ra) # 80206418 <eread>
    802046a2:	04000793          	li	a5,64
    802046a6:	00f51a63          	bne	a0,a5,802046ba <exec+0xa8>
    goto bad;
  if(elf.magic != ELF_MAGIC)
    802046aa:	e4842703          	lw	a4,-440(s0)
    802046ae:	464c47b7          	lui	a5,0x464c4
    802046b2:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39d3ba81>
    802046b6:	00f70963          	beq	a4,a5,802046c8 <exec+0xb6>
  printf("[exec] reach bad\n");
  #endif
  if(pagetable)
    proc_freepagetable(pagetable, sz);
  if(kpagetable)
    kvmfree(kpagetable, 0);
    802046ba:	4581                	li	a1,0
    802046bc:	855a                	mv	a0,s6
    802046be:	ffffd097          	auipc	ra,0xffffd
    802046c2:	006080e7          	jalr	6(ra) # 802016c4 <kvmfree>
  if(ep){
    802046c6:	a4bd                	j	80204934 <exec+0x322>
  if((pagetable = proc_pagetable(p)) == NULL)
    802046c8:	8526                	mv	a0,s1
    802046ca:	ffffd097          	auipc	ra,0xffffd
    802046ce:	4a8080e7          	jalr	1192(ra) # 80201b72 <proc_pagetable>
    802046d2:	e0a43423          	sd	a0,-504(s0)
    802046d6:	d175                	beqz	a0,802046ba <exec+0xa8>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    802046d8:	e6842783          	lw	a5,-408(s0)
    802046dc:	e8045703          	lhu	a4,-384(s0)
    802046e0:	cb3d                	beqz	a4,80204756 <exec+0x144>
  uint64 argc, sz = 0, sp, ustack[MAXARG+1], stackbase;
    802046e2:	4481                	li	s1,0
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    802046e4:	e0043023          	sd	zero,-512(s0)
    if(eread(ep, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    802046e8:	e1040713          	addi	a4,s0,-496
    802046ec:	dee43023          	sd	a4,-544(s0)
    if(ph.vaddr % PGSIZE != 0)
    802046f0:	6a85                	lui	s5,0x1
    802046f2:	fffa8713          	addi	a4,s5,-1 # fff <_entry-0x801ff001>
    802046f6:	dce43823          	sd	a4,-560(s0)
  for(i = 0; i < sz; i += PGSIZE){
    802046fa:	6d85                	lui	s11,0x1
    802046fc:	7d7d                	lui	s10,0xfffff
    802046fe:	a4c9                	j	802049c0 <exec+0x3ae>
      panic("loadseg: address should exist");
    80204700:	00005517          	auipc	a0,0x5
    80204704:	56050513          	addi	a0,a0,1376 # 80209c60 <digits+0x8e0>
    80204708:	ffffc097          	auipc	ra,0xffffc
    8020470c:	a3c080e7          	jalr	-1476(ra) # 80200144 <panic>
    if(eread(ep, 0, (uint64)pa, offset+i, n) != n)
    80204710:	874a                	mv	a4,s2
    80204712:	009c86bb          	addw	a3,s9,s1
    80204716:	4581                	li	a1,0
    80204718:	8552                	mv	a0,s4
    8020471a:	00002097          	auipc	ra,0x2
    8020471e:	cfe080e7          	jalr	-770(ra) # 80206418 <eread>
    80204722:	2501                	sext.w	a0,a0
    80204724:	1ea91763          	bne	s2,a0,80204912 <exec+0x300>
  for(i = 0; i < sz; i += PGSIZE){
    80204728:	009d84bb          	addw	s1,s11,s1
    8020472c:	013d09bb          	addw	s3,s10,s3
    80204730:	2774f863          	bgeu	s1,s7,802049a0 <exec+0x38e>
    pa = walkaddr(pagetable, va + i);
    80204734:	02049593          	slli	a1,s1,0x20
    80204738:	9181                	srli	a1,a1,0x20
    8020473a:	95e2                	add	a1,a1,s8
    8020473c:	e0843503          	ld	a0,-504(s0)
    80204740:	ffffc097          	auipc	ra,0xffffc
    80204744:	46e080e7          	jalr	1134(ra) # 80200bae <walkaddr>
    80204748:	862a                	mv	a2,a0
    if(pa == NULL)
    8020474a:	d95d                	beqz	a0,80204700 <exec+0xee>
      n = PGSIZE;
    8020474c:	8956                	mv	s2,s5
    if(sz - i < PGSIZE)
    8020474e:	fd59f1e3          	bgeu	s3,s5,80204710 <exec+0xfe>
      n = sz - i;
    80204752:	894e                	mv	s2,s3
    80204754:	bf75                	j	80204710 <exec+0xfe>
  uint64 argc, sz = 0, sp, ustack[MAXARG+1], stackbase;
    80204756:	4481                	li	s1,0
  eunlock(ep);
    80204758:	8552                	mv	a0,s4
    8020475a:	00002097          	auipc	ra,0x2
    8020475e:	5f8080e7          	jalr	1528(ra) # 80206d52 <eunlock>
  eput(ep);
    80204762:	8552                	mv	a0,s4
    80204764:	00002097          	auipc	ra,0x2
    80204768:	63c080e7          	jalr	1596(ra) # 80206da0 <eput>
  p = myproc();
    8020476c:	ffffd097          	auipc	ra,0xffffd
    80204770:	322080e7          	jalr	802(ra) # 80201a8e <myproc>
    80204774:	8aaa                	mv	s5,a0
  uint64 oldsz = p->sz;
    80204776:	04853d03          	ld	s10,72(a0)
  sz = PGROUNDUP(sz);
    8020477a:	6785                	lui	a5,0x1
    8020477c:	17fd                	addi	a5,a5,-1 # fff <_entry-0x801ff001>
    8020477e:	97a6                	add	a5,a5,s1
    80204780:	777d                	lui	a4,0xfffff
    80204782:	8ff9                	and	a5,a5,a4
    80204784:	def43823          	sd	a5,-528(s0)
  if((sz1 = uvmalloc(pagetable, kpagetable, sz, sz + 2*PGSIZE)) == 0)
    80204788:	6689                	lui	a3,0x2
    8020478a:	96be                	add	a3,a3,a5
    8020478c:	863e                	mv	a2,a5
    8020478e:	85da                	mv	a1,s6
    80204790:	e0843483          	ld	s1,-504(s0)
    80204794:	8526                	mv	a0,s1
    80204796:	ffffd097          	auipc	ra,0xffffd
    8020479a:	874080e7          	jalr	-1932(ra) # 8020100a <uvmalloc>
    8020479e:	8caa                	mv	s9,a0
  ep = 0;
    802047a0:	4a01                	li	s4,0
  if((sz1 = uvmalloc(pagetable, kpagetable, sz, sz + 2*PGSIZE)) == 0)
    802047a2:	16050863          	beqz	a0,80204912 <exec+0x300>
  uvmclear(pagetable, sz-2*PGSIZE);
    802047a6:	75f9                	lui	a1,0xffffe
    802047a8:	95aa                	add	a1,a1,a0
    802047aa:	8526                	mv	a0,s1
    802047ac:	ffffd097          	auipc	ra,0xffffd
    802047b0:	b08080e7          	jalr	-1272(ra) # 802012b4 <uvmclear>
  stackbase = sp - PGSIZE;
    802047b4:	7bfd                	lui	s7,0xfffff
    802047b6:	9be6                	add	s7,s7,s9
  for(argc = 0; argv[argc]; argc++) {
    802047b8:	de843783          	ld	a5,-536(s0)
    802047bc:	6388                	ld	a0,0(a5)
    802047be:	c92d                	beqz	a0,80204830 <exec+0x21e>
    802047c0:	e8840993          	addi	s3,s0,-376
    802047c4:	f8840c13          	addi	s8,s0,-120
  sp = sz;
    802047c8:	8966                	mv	s2,s9
  for(argc = 0; argv[argc]; argc++) {
    802047ca:	4481                	li	s1,0
    sp -= strlen(argv[argc]) + 1;
    802047cc:	ffffc097          	auipc	ra,0xffffc
    802047d0:	11a080e7          	jalr	282(ra) # 802008e6 <strlen>
    802047d4:	0015079b          	addiw	a5,a0,1
    802047d8:	40f907b3          	sub	a5,s2,a5
    sp -= sp % 16; // riscv sp must be 16-byte aligned
    802047dc:	ff07f913          	andi	s2,a5,-16
    if(sp < stackbase)
    802047e0:	1b796463          	bltu	s2,s7,80204988 <exec+0x376>
    if(copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
    802047e4:	de843d83          	ld	s11,-536(s0)
    802047e8:	000dba03          	ld	s4,0(s11) # 1000 <_entry-0x801ff000>
    802047ec:	8552                	mv	a0,s4
    802047ee:	ffffc097          	auipc	ra,0xffffc
    802047f2:	0f8080e7          	jalr	248(ra) # 802008e6 <strlen>
    802047f6:	0015069b          	addiw	a3,a0,1
    802047fa:	8652                	mv	a2,s4
    802047fc:	85ca                	mv	a1,s2
    802047fe:	e0843503          	ld	a0,-504(s0)
    80204802:	ffffd097          	auipc	ra,0xffffd
    80204806:	ae4080e7          	jalr	-1308(ra) # 802012e6 <copyout>
    8020480a:	18054363          	bltz	a0,80204990 <exec+0x37e>
    ustack[argc] = sp;
    8020480e:	0129b023          	sd	s2,0(s3)
  for(argc = 0; argv[argc]; argc++) {
    80204812:	0485                	addi	s1,s1,1
    80204814:	008d8793          	addi	a5,s11,8
    80204818:	def43423          	sd	a5,-536(s0)
    8020481c:	008db503          	ld	a0,8(s11)
    80204820:	c911                	beqz	a0,80204834 <exec+0x222>
    if(argc >= MAXARG)
    80204822:	09a1                	addi	s3,s3,8
    80204824:	fb3c14e3          	bne	s8,s3,802047cc <exec+0x1ba>
  sz = sz1;
    80204828:	df943823          	sd	s9,-528(s0)
  ep = 0;
    8020482c:	4a01                	li	s4,0
    8020482e:	a0d5                	j	80204912 <exec+0x300>
  sp = sz;
    80204830:	8966                	mv	s2,s9
  for(argc = 0; argv[argc]; argc++) {
    80204832:	4481                	li	s1,0
  ustack[argc] = 0;
    80204834:	00349793          	slli	a5,s1,0x3
    80204838:	f9078793          	addi	a5,a5,-112
    8020483c:	97a2                	add	a5,a5,s0
    8020483e:	ee07bc23          	sd	zero,-264(a5)
  sp -= (argc+1) * sizeof(uint64);
    80204842:	00148693          	addi	a3,s1,1
    80204846:	068e                	slli	a3,a3,0x3
    80204848:	40d90933          	sub	s2,s2,a3
  sp -= sp % 16;
    8020484c:	ff097913          	andi	s2,s2,-16
  if(sp < stackbase)
    80204850:	01797663          	bgeu	s2,s7,8020485c <exec+0x24a>
  sz = sz1;
    80204854:	df943823          	sd	s9,-528(s0)
  ep = 0;
    80204858:	4a01                	li	s4,0
    8020485a:	a865                	j	80204912 <exec+0x300>
  if(copyout(pagetable, sp, (char *)ustack, (argc+1)*sizeof(uint64)) < 0)
    8020485c:	e8840613          	addi	a2,s0,-376
    80204860:	85ca                	mv	a1,s2
    80204862:	e0843503          	ld	a0,-504(s0)
    80204866:	ffffd097          	auipc	ra,0xffffd
    8020486a:	a80080e7          	jalr	-1408(ra) # 802012e6 <copyout>
    8020486e:	12054563          	bltz	a0,80204998 <exec+0x386>
  p->trapframe->a1 = sp;
    80204872:	060ab783          	ld	a5,96(s5)
    80204876:	0727bc23          	sd	s2,120(a5)
  for(last=s=path; *s; s++)
    8020487a:	dd843783          	ld	a5,-552(s0)
    8020487e:	0007c703          	lbu	a4,0(a5)
    80204882:	cf11                	beqz	a4,8020489e <exec+0x28c>
    80204884:	0785                	addi	a5,a5,1
    if(*s == '/')
    80204886:	02f00693          	li	a3,47
    8020488a:	a039                	j	80204898 <exec+0x286>
      last = s+1;
    8020488c:	dcf43c23          	sd	a5,-552(s0)
  for(last=s=path; *s; s++)
    80204890:	0785                	addi	a5,a5,1
    80204892:	fff7c703          	lbu	a4,-1(a5)
    80204896:	c701                	beqz	a4,8020489e <exec+0x28c>
    if(*s == '/')
    80204898:	fed71ce3          	bne	a4,a3,80204890 <exec+0x27e>
    8020489c:	bfc5                	j	8020488c <exec+0x27a>
  safestrcpy(p->name, last, sizeof(p->name));
    8020489e:	4641                	li	a2,16
    802048a0:	dd843583          	ld	a1,-552(s0)
    802048a4:	160a8513          	addi	a0,s5,352
    802048a8:	ffffc097          	auipc	ra,0xffffc
    802048ac:	00c080e7          	jalr	12(ra) # 802008b4 <safestrcpy>
  oldpagetable = p->pagetable;
    802048b0:	050ab503          	ld	a0,80(s5)
  oldkpagetable = p->kpagetable;
    802048b4:	058ab983          	ld	s3,88(s5)
  p->pagetable = pagetable;
    802048b8:	e0843783          	ld	a5,-504(s0)
    802048bc:	04fab823          	sd	a5,80(s5)
  p->kpagetable = kpagetable;
    802048c0:	056abc23          	sd	s6,88(s5)
  p->sz = sz;
    802048c4:	059ab423          	sd	s9,72(s5)
  p->trapframe->epc = elf.entry;  // initial program counter = main
    802048c8:	060ab783          	ld	a5,96(s5)
    802048cc:	e6043703          	ld	a4,-416(s0)
    802048d0:	ef98                	sd	a4,24(a5)
  p->trapframe->sp = sp; // initial stack pointer
    802048d2:	060ab783          	ld	a5,96(s5)
    802048d6:	0327b823          	sd	s2,48(a5)
  proc_freepagetable(oldpagetable, oldsz);
    802048da:	85ea                	mv	a1,s10
    802048dc:	ffffd097          	auipc	ra,0xffffd
    802048e0:	332080e7          	jalr	818(ra) # 80201c0e <proc_freepagetable>
  w_satp(MAKE_SATP(p->kpagetable));
    802048e4:	058ab783          	ld	a5,88(s5)
    802048e8:	83b1                	srli	a5,a5,0xc
    802048ea:	577d                	li	a4,-1
    802048ec:	177e                	slli	a4,a4,0x3f
    802048ee:	8fd9                	or	a5,a5,a4
  asm volatile("csrw satp, %0" : : "r" (x));
    802048f0:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    802048f4:	12000073          	sfence.vma
  kvmfree(oldkpagetable, 0);
    802048f8:	4581                	li	a1,0
    802048fa:	854e                	mv	a0,s3
    802048fc:	ffffd097          	auipc	ra,0xffffd
    80204900:	dc8080e7          	jalr	-568(ra) # 802016c4 <kvmfree>
  return argc; // this ends up in a0, the first argument to main(argc, argv)
    80204904:	0004851b          	sext.w	a0,s1
    80204908:	a089                	j	8020494a <exec+0x338>
    return -1;
    8020490a:	557d                	li	a0,-1
    8020490c:	a83d                	j	8020494a <exec+0x338>
    8020490e:	de943823          	sd	s1,-528(s0)
    proc_freepagetable(pagetable, sz);
    80204912:	df043583          	ld	a1,-528(s0)
    80204916:	e0843503          	ld	a0,-504(s0)
    8020491a:	ffffd097          	auipc	ra,0xffffd
    8020491e:	2f4080e7          	jalr	756(ra) # 80201c0e <proc_freepagetable>
    kvmfree(kpagetable, 0);
    80204922:	4581                	li	a1,0
    80204924:	855a                	mv	a0,s6
    80204926:	ffffd097          	auipc	ra,0xffffd
    8020492a:	d9e080e7          	jalr	-610(ra) # 802016c4 <kvmfree>
    eunlock(ep);
    eput(ep);
  }
  return -1;
    8020492e:	557d                	li	a0,-1
  if(ep){
    80204930:	000a0d63          	beqz	s4,8020494a <exec+0x338>
    eunlock(ep);
    80204934:	8552                	mv	a0,s4
    80204936:	00002097          	auipc	ra,0x2
    8020493a:	41c080e7          	jalr	1052(ra) # 80206d52 <eunlock>
    eput(ep);
    8020493e:	8552                	mv	a0,s4
    80204940:	00002097          	auipc	ra,0x2
    80204944:	460080e7          	jalr	1120(ra) # 80206da0 <eput>
  return -1;
    80204948:	557d                	li	a0,-1
}
    8020494a:	22813083          	ld	ra,552(sp)
    8020494e:	22013403          	ld	s0,544(sp)
    80204952:	21813483          	ld	s1,536(sp)
    80204956:	21013903          	ld	s2,528(sp)
    8020495a:	20813983          	ld	s3,520(sp)
    8020495e:	20013a03          	ld	s4,512(sp)
    80204962:	7afe                	ld	s5,504(sp)
    80204964:	7b5e                	ld	s6,496(sp)
    80204966:	7bbe                	ld	s7,488(sp)
    80204968:	7c1e                	ld	s8,480(sp)
    8020496a:	6cfe                	ld	s9,472(sp)
    8020496c:	6d5e                	ld	s10,464(sp)
    8020496e:	6dbe                	ld	s11,456(sp)
    80204970:	23010113          	addi	sp,sp,560
    80204974:	8082                	ret
    80204976:	de943823          	sd	s1,-528(s0)
    8020497a:	bf61                	j	80204912 <exec+0x300>
    8020497c:	de943823          	sd	s1,-528(s0)
    80204980:	bf49                	j	80204912 <exec+0x300>
    80204982:	de943823          	sd	s1,-528(s0)
    80204986:	b771                	j	80204912 <exec+0x300>
  sz = sz1;
    80204988:	df943823          	sd	s9,-528(s0)
  ep = 0;
    8020498c:	4a01                	li	s4,0
    8020498e:	b751                	j	80204912 <exec+0x300>
  sz = sz1;
    80204990:	df943823          	sd	s9,-528(s0)
  ep = 0;
    80204994:	4a01                	li	s4,0
    80204996:	bfb5                	j	80204912 <exec+0x300>
  sz = sz1;
    80204998:	df943823          	sd	s9,-528(s0)
  ep = 0;
    8020499c:	4a01                	li	s4,0
    8020499e:	bf95                	j	80204912 <exec+0x300>
    if((sz1 = uvmalloc(pagetable, kpagetable, sz, ph.vaddr + ph.memsz)) == 0)
    802049a0:	df043483          	ld	s1,-528(s0)
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    802049a4:	e0043783          	ld	a5,-512(s0)
    802049a8:	0017869b          	addiw	a3,a5,1
    802049ac:	e0d43023          	sd	a3,-512(s0)
    802049b0:	df843783          	ld	a5,-520(s0)
    802049b4:	0387879b          	addiw	a5,a5,56
    802049b8:	e8045703          	lhu	a4,-384(s0)
    802049bc:	d8e6dee3          	bge	a3,a4,80204758 <exec+0x146>
    if(eread(ep, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    802049c0:	2781                	sext.w	a5,a5
    802049c2:	def43c23          	sd	a5,-520(s0)
    802049c6:	03800713          	li	a4,56
    802049ca:	86be                	mv	a3,a5
    802049cc:	de043603          	ld	a2,-544(s0)
    802049d0:	4581                	li	a1,0
    802049d2:	8552                	mv	a0,s4
    802049d4:	00002097          	auipc	ra,0x2
    802049d8:	a44080e7          	jalr	-1468(ra) # 80206418 <eread>
    802049dc:	03800793          	li	a5,56
    802049e0:	f2f517e3          	bne	a0,a5,8020490e <exec+0x2fc>
    if(ph.type != ELF_PROG_LOAD)
    802049e4:	e1042783          	lw	a5,-496(s0)
    802049e8:	4705                	li	a4,1
    802049ea:	fae79de3          	bne	a5,a4,802049a4 <exec+0x392>
    if(ph.memsz < ph.filesz)
    802049ee:	e3843683          	ld	a3,-456(s0)
    802049f2:	e3043783          	ld	a5,-464(s0)
    802049f6:	f8f6e0e3          	bltu	a3,a5,80204976 <exec+0x364>
    if(ph.vaddr + ph.memsz < ph.vaddr)
    802049fa:	e2043783          	ld	a5,-480(s0)
    802049fe:	96be                	add	a3,a3,a5
    80204a00:	f6f6eee3          	bltu	a3,a5,8020497c <exec+0x36a>
    if((sz1 = uvmalloc(pagetable, kpagetable, sz, ph.vaddr + ph.memsz)) == 0)
    80204a04:	8626                	mv	a2,s1
    80204a06:	85da                	mv	a1,s6
    80204a08:	e0843503          	ld	a0,-504(s0)
    80204a0c:	ffffc097          	auipc	ra,0xffffc
    80204a10:	5fe080e7          	jalr	1534(ra) # 8020100a <uvmalloc>
    80204a14:	dea43823          	sd	a0,-528(s0)
    80204a18:	d52d                	beqz	a0,80204982 <exec+0x370>
    if(ph.vaddr % PGSIZE != 0)
    80204a1a:	e2043c03          	ld	s8,-480(s0)
    80204a1e:	dd043783          	ld	a5,-560(s0)
    80204a22:	00fc77b3          	and	a5,s8,a5
    80204a26:	ee0796e3          	bnez	a5,80204912 <exec+0x300>
    if(loadseg(pagetable, ph.vaddr, ep, ph.off, ph.filesz) < 0)
    80204a2a:	e1842c83          	lw	s9,-488(s0)
    80204a2e:	e3042b83          	lw	s7,-464(s0)
  for(i = 0; i < sz; i += PGSIZE){
    80204a32:	f60b87e3          	beqz	s7,802049a0 <exec+0x38e>
    80204a36:	89de                	mv	s3,s7
    80204a38:	4481                	li	s1,0
    80204a3a:	b9ed                	j	80204734 <exec+0x122>
    kvmfree(kpagetable, 0);
    80204a3c:	4581                	li	a1,0
    80204a3e:	855a                	mv	a0,s6
    80204a40:	ffffd097          	auipc	ra,0xffffd
    80204a44:	c84080e7          	jalr	-892(ra) # 802016c4 <kvmfree>
  return -1;
    80204a48:	557d                	li	a0,-1
    80204a4a:	b701                	j	8020494a <exec+0x338>

0000000080204a4c <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
    80204a4c:	7179                	addi	sp,sp,-48
    80204a4e:	f406                	sd	ra,40(sp)
    80204a50:	f022                	sd	s0,32(sp)
    80204a52:	ec26                	sd	s1,24(sp)
    80204a54:	e84a                	sd	s2,16(sp)
    80204a56:	1800                	addi	s0,sp,48
    80204a58:	892e                	mv	s2,a1
    80204a5a:	84b2                	mv	s1,a2
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    80204a5c:	fdc40593          	addi	a1,s0,-36
    80204a60:	ffffe097          	auipc	ra,0xffffe
    80204a64:	654080e7          	jalr	1620(ra) # 802030b4 <argint>
    80204a68:	04054063          	bltz	a0,80204aa8 <argfd+0x5c>
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == NULL)
    80204a6c:	fdc42703          	lw	a4,-36(s0)
    80204a70:	47bd                	li	a5,15
    80204a72:	02e7ed63          	bltu	a5,a4,80204aac <argfd+0x60>
    80204a76:	ffffd097          	auipc	ra,0xffffd
    80204a7a:	018080e7          	jalr	24(ra) # 80201a8e <myproc>
    80204a7e:	fdc42703          	lw	a4,-36(s0)
    80204a82:	01a70793          	addi	a5,a4,26 # fffffffffffff01a <ebss_clear+0xffffffff7fdd801a>
    80204a86:	078e                	slli	a5,a5,0x3
    80204a88:	953e                	add	a0,a0,a5
    80204a8a:	651c                	ld	a5,8(a0)
    80204a8c:	c395                	beqz	a5,80204ab0 <argfd+0x64>
    return -1;
  if(pfd)
    80204a8e:	00090463          	beqz	s2,80204a96 <argfd+0x4a>
    *pfd = fd;
    80204a92:	00e92023          	sw	a4,0(s2)
  if(pf)
    *pf = f;
  return 0;
    80204a96:	4501                	li	a0,0
  if(pf)
    80204a98:	c091                	beqz	s1,80204a9c <argfd+0x50>
    *pf = f;
    80204a9a:	e09c                	sd	a5,0(s1)
}
    80204a9c:	70a2                	ld	ra,40(sp)
    80204a9e:	7402                	ld	s0,32(sp)
    80204aa0:	64e2                	ld	s1,24(sp)
    80204aa2:	6942                	ld	s2,16(sp)
    80204aa4:	6145                	addi	sp,sp,48
    80204aa6:	8082                	ret
    return -1;
    80204aa8:	557d                	li	a0,-1
    80204aaa:	bfcd                	j	80204a9c <argfd+0x50>
    return -1;
    80204aac:	557d                	li	a0,-1
    80204aae:	b7fd                	j	80204a9c <argfd+0x50>
    80204ab0:	557d                	li	a0,-1
    80204ab2:	b7ed                	j	80204a9c <argfd+0x50>

0000000080204ab4 <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
    80204ab4:	1101                	addi	sp,sp,-32
    80204ab6:	ec06                	sd	ra,24(sp)
    80204ab8:	e822                	sd	s0,16(sp)
    80204aba:	e426                	sd	s1,8(sp)
    80204abc:	1000                	addi	s0,sp,32
    80204abe:	84aa                	mv	s1,a0
  int fd;
  struct proc *p = myproc();
    80204ac0:	ffffd097          	auipc	ra,0xffffd
    80204ac4:	fce080e7          	jalr	-50(ra) # 80201a8e <myproc>
    80204ac8:	862a                	mv	a2,a0

  for(fd = 0; fd < NOFILE; fd++){
    80204aca:	0d850793          	addi	a5,a0,216
    80204ace:	4501                	li	a0,0
    80204ad0:	46c1                	li	a3,16
    if(p->ofile[fd] == 0){
    80204ad2:	6398                	ld	a4,0(a5)
    80204ad4:	cb19                	beqz	a4,80204aea <fdalloc+0x36>
  for(fd = 0; fd < NOFILE; fd++){
    80204ad6:	2505                	addiw	a0,a0,1
    80204ad8:	07a1                	addi	a5,a5,8
    80204ada:	fed51ce3          	bne	a0,a3,80204ad2 <fdalloc+0x1e>
      p->ofile[fd] = f;
      return fd;
    }
  }
  return -1;
    80204ade:	557d                	li	a0,-1
}
    80204ae0:	60e2                	ld	ra,24(sp)
    80204ae2:	6442                	ld	s0,16(sp)
    80204ae4:	64a2                	ld	s1,8(sp)
    80204ae6:	6105                	addi	sp,sp,32
    80204ae8:	8082                	ret
      p->ofile[fd] = f;
    80204aea:	01a50793          	addi	a5,a0,26
    80204aee:	078e                	slli	a5,a5,0x3
    80204af0:	963e                	add	a2,a2,a5
    80204af2:	e604                	sd	s1,8(a2)
      return fd;
    80204af4:	b7f5                	j	80204ae0 <fdalloc+0x2c>

0000000080204af6 <create>:
  return filestat(f, st);
}

static struct dirent*
create(char *path, short type, int mode)
{
    80204af6:	7169                	addi	sp,sp,-304
    80204af8:	f606                	sd	ra,296(sp)
    80204afa:	f222                	sd	s0,288(sp)
    80204afc:	ee26                	sd	s1,280(sp)
    80204afe:	ea4a                	sd	s2,272(sp)
    80204b00:	e64e                	sd	s3,264(sp)
    80204b02:	1a00                	addi	s0,sp,304
    80204b04:	892e                	mv	s2,a1
  struct dirent *ep, *dp;
  char name[FAT32_MAX_FILENAME + 1];

  if((dp = enameparent(path, name)) == NULL)
    80204b06:	ed040593          	addi	a1,s0,-304
    80204b0a:	00003097          	auipc	ra,0x3
    80204b0e:	a16080e7          	jalr	-1514(ra) # 80207520 <enameparent>
    80204b12:	84aa                	mv	s1,a0
    80204b14:	c945                	beqz	a0,80204bc4 <create+0xce>
    mode = ATTR_READ_ONLY;
  } else {
    mode = 0;  
  }

  elock(dp);
    80204b16:	00002097          	auipc	ra,0x2
    80204b1a:	206080e7          	jalr	518(ra) # 80206d1c <elock>
  if (type == T_DIR) {
    80204b1e:	fff90613          	addi	a2,s2,-1
    80204b22:	00163613          	seqz	a2,a2
  if ((ep = ealloc(dp, name, mode)) == NULL) {
    80204b26:	0046161b          	slliw	a2,a2,0x4
    80204b2a:	ed040593          	addi	a1,s0,-304
    80204b2e:	8526                	mv	a0,s1
    80204b30:	00002097          	auipc	ra,0x2
    80204b34:	6d8080e7          	jalr	1752(ra) # 80207208 <ealloc>
    80204b38:	89aa                	mv	s3,a0
    80204b3a:	c529                	beqz	a0,80204b84 <create+0x8e>
    eunlock(dp);
    eput(dp);
    return NULL;
  }
  
  if ((type == T_DIR && !(ep->attribute & ATTR_DIRECTORY)) ||
    80204b3c:	0009079b          	sext.w	a5,s2
    80204b40:	4705                	li	a4,1
    80204b42:	04e78c63          	beq	a5,a4,80204b9a <create+0xa4>
    80204b46:	2901                	sext.w	s2,s2
    80204b48:	4789                	li	a5,2
    80204b4a:	00f91663          	bne	s2,a5,80204b56 <create+0x60>
      (type == T_FILE && (ep->attribute & ATTR_DIRECTORY))) {
    80204b4e:	10054783          	lbu	a5,256(a0)
    80204b52:	8bc1                	andi	a5,a5,16
    80204b54:	e7b9                	bnez	a5,80204ba2 <create+0xac>
    eput(ep);
    eput(dp);
    return NULL;
  }

  eunlock(dp);
    80204b56:	8526                	mv	a0,s1
    80204b58:	00002097          	auipc	ra,0x2
    80204b5c:	1fa080e7          	jalr	506(ra) # 80206d52 <eunlock>
  eput(dp);
    80204b60:	8526                	mv	a0,s1
    80204b62:	00002097          	auipc	ra,0x2
    80204b66:	23e080e7          	jalr	574(ra) # 80206da0 <eput>

  elock(ep);
    80204b6a:	854e                	mv	a0,s3
    80204b6c:	00002097          	auipc	ra,0x2
    80204b70:	1b0080e7          	jalr	432(ra) # 80206d1c <elock>
  return ep;
}
    80204b74:	854e                	mv	a0,s3
    80204b76:	70b2                	ld	ra,296(sp)
    80204b78:	7412                	ld	s0,288(sp)
    80204b7a:	64f2                	ld	s1,280(sp)
    80204b7c:	6952                	ld	s2,272(sp)
    80204b7e:	69b2                	ld	s3,264(sp)
    80204b80:	6155                	addi	sp,sp,304
    80204b82:	8082                	ret
    eunlock(dp);
    80204b84:	8526                	mv	a0,s1
    80204b86:	00002097          	auipc	ra,0x2
    80204b8a:	1cc080e7          	jalr	460(ra) # 80206d52 <eunlock>
    eput(dp);
    80204b8e:	8526                	mv	a0,s1
    80204b90:	00002097          	auipc	ra,0x2
    80204b94:	210080e7          	jalr	528(ra) # 80206da0 <eput>
    return NULL;
    80204b98:	bff1                	j	80204b74 <create+0x7e>
  if ((type == T_DIR && !(ep->attribute & ATTR_DIRECTORY)) ||
    80204b9a:	10054783          	lbu	a5,256(a0)
    80204b9e:	8bc1                	andi	a5,a5,16
    80204ba0:	fbdd                	bnez	a5,80204b56 <create+0x60>
    eunlock(dp);
    80204ba2:	8526                	mv	a0,s1
    80204ba4:	00002097          	auipc	ra,0x2
    80204ba8:	1ae080e7          	jalr	430(ra) # 80206d52 <eunlock>
    eput(ep);
    80204bac:	854e                	mv	a0,s3
    80204bae:	00002097          	auipc	ra,0x2
    80204bb2:	1f2080e7          	jalr	498(ra) # 80206da0 <eput>
    eput(dp);
    80204bb6:	8526                	mv	a0,s1
    80204bb8:	00002097          	auipc	ra,0x2
    80204bbc:	1e8080e7          	jalr	488(ra) # 80206da0 <eput>
    return NULL;
    80204bc0:	4981                	li	s3,0
    80204bc2:	bf4d                	j	80204b74 <create+0x7e>
    return NULL;
    80204bc4:	89aa                	mv	s3,a0
    80204bc6:	b77d                	j	80204b74 <create+0x7e>

0000000080204bc8 <sys_dup>:
{
    80204bc8:	7179                	addi	sp,sp,-48
    80204bca:	f406                	sd	ra,40(sp)
    80204bcc:	f022                	sd	s0,32(sp)
    80204bce:	ec26                	sd	s1,24(sp)
    80204bd0:	e84a                	sd	s2,16(sp)
    80204bd2:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0)
    80204bd4:	fd840613          	addi	a2,s0,-40
    80204bd8:	4581                	li	a1,0
    80204bda:	4501                	li	a0,0
    80204bdc:	00000097          	auipc	ra,0x0
    80204be0:	e70080e7          	jalr	-400(ra) # 80204a4c <argfd>
    return -1;
    80204be4:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0)
    80204be6:	02054363          	bltz	a0,80204c0c <sys_dup+0x44>
  if((fd=fdalloc(f)) < 0)
    80204bea:	fd843903          	ld	s2,-40(s0)
    80204bee:	854a                	mv	a0,s2
    80204bf0:	00000097          	auipc	ra,0x0
    80204bf4:	ec4080e7          	jalr	-316(ra) # 80204ab4 <fdalloc>
    80204bf8:	84aa                	mv	s1,a0
    return -1;
    80204bfa:	57fd                	li	a5,-1
  if((fd=fdalloc(f)) < 0)
    80204bfc:	00054863          	bltz	a0,80204c0c <sys_dup+0x44>
  filedup(f);
    80204c00:	854a                	mv	a0,s2
    80204c02:	fffff097          	auipc	ra,0xfffff
    80204c06:	1a8080e7          	jalr	424(ra) # 80203daa <filedup>
  return fd;
    80204c0a:	87a6                	mv	a5,s1
}
    80204c0c:	853e                	mv	a0,a5
    80204c0e:	70a2                	ld	ra,40(sp)
    80204c10:	7402                	ld	s0,32(sp)
    80204c12:	64e2                	ld	s1,24(sp)
    80204c14:	6942                	ld	s2,16(sp)
    80204c16:	6145                	addi	sp,sp,48
    80204c18:	8082                	ret

0000000080204c1a <sys_read>:
{
    80204c1a:	7179                	addi	sp,sp,-48
    80204c1c:	f406                	sd	ra,40(sp)
    80204c1e:	f022                	sd	s0,32(sp)
    80204c20:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204c22:	fe840613          	addi	a2,s0,-24
    80204c26:	4581                	li	a1,0
    80204c28:	4501                	li	a0,0
    80204c2a:	00000097          	auipc	ra,0x0
    80204c2e:	e22080e7          	jalr	-478(ra) # 80204a4c <argfd>
    return -1;
    80204c32:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204c34:	04054163          	bltz	a0,80204c76 <sys_read+0x5c>
    80204c38:	fe440593          	addi	a1,s0,-28
    80204c3c:	4509                	li	a0,2
    80204c3e:	ffffe097          	auipc	ra,0xffffe
    80204c42:	476080e7          	jalr	1142(ra) # 802030b4 <argint>
    return -1;
    80204c46:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204c48:	02054763          	bltz	a0,80204c76 <sys_read+0x5c>
    80204c4c:	fd840593          	addi	a1,s0,-40
    80204c50:	4505                	li	a0,1
    80204c52:	ffffe097          	auipc	ra,0xffffe
    80204c56:	4c4080e7          	jalr	1220(ra) # 80203116 <argaddr>
    return -1;
    80204c5a:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204c5c:	00054d63          	bltz	a0,80204c76 <sys_read+0x5c>
  return fileread(f, p, n);
    80204c60:	fe442603          	lw	a2,-28(s0)
    80204c64:	fd843583          	ld	a1,-40(s0)
    80204c68:	fe843503          	ld	a0,-24(s0)
    80204c6c:	fffff097          	auipc	ra,0xfffff
    80204c70:	2aa080e7          	jalr	682(ra) # 80203f16 <fileread>
    80204c74:	87aa                	mv	a5,a0
}
    80204c76:	853e                	mv	a0,a5
    80204c78:	70a2                	ld	ra,40(sp)
    80204c7a:	7402                	ld	s0,32(sp)
    80204c7c:	6145                	addi	sp,sp,48
    80204c7e:	8082                	ret

0000000080204c80 <sys_write>:
{
    80204c80:	7179                	addi	sp,sp,-48
    80204c82:	f406                	sd	ra,40(sp)
    80204c84:	f022                	sd	s0,32(sp)
    80204c86:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204c88:	fe840613          	addi	a2,s0,-24
    80204c8c:	4581                	li	a1,0
    80204c8e:	4501                	li	a0,0
    80204c90:	00000097          	auipc	ra,0x0
    80204c94:	dbc080e7          	jalr	-580(ra) # 80204a4c <argfd>
    return -1;
    80204c98:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204c9a:	04054163          	bltz	a0,80204cdc <sys_write+0x5c>
    80204c9e:	fe440593          	addi	a1,s0,-28
    80204ca2:	4509                	li	a0,2
    80204ca4:	ffffe097          	auipc	ra,0xffffe
    80204ca8:	410080e7          	jalr	1040(ra) # 802030b4 <argint>
    return -1;
    80204cac:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204cae:	02054763          	bltz	a0,80204cdc <sys_write+0x5c>
    80204cb2:	fd840593          	addi	a1,s0,-40
    80204cb6:	4505                	li	a0,1
    80204cb8:	ffffe097          	auipc	ra,0xffffe
    80204cbc:	45e080e7          	jalr	1118(ra) # 80203116 <argaddr>
    return -1;
    80204cc0:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204cc2:	00054d63          	bltz	a0,80204cdc <sys_write+0x5c>
  return filewrite(f, p, n);
    80204cc6:	fe442603          	lw	a2,-28(s0)
    80204cca:	fd843583          	ld	a1,-40(s0)
    80204cce:	fe843503          	ld	a0,-24(s0)
    80204cd2:	fffff097          	auipc	ra,0xfffff
    80204cd6:	306080e7          	jalr	774(ra) # 80203fd8 <filewrite>
    80204cda:	87aa                	mv	a5,a0
}
    80204cdc:	853e                	mv	a0,a5
    80204cde:	70a2                	ld	ra,40(sp)
    80204ce0:	7402                	ld	s0,32(sp)
    80204ce2:	6145                	addi	sp,sp,48
    80204ce4:	8082                	ret

0000000080204ce6 <sys_close>:
{
    80204ce6:	1101                	addi	sp,sp,-32
    80204ce8:	ec06                	sd	ra,24(sp)
    80204cea:	e822                	sd	s0,16(sp)
    80204cec:	1000                	addi	s0,sp,32
  if(argfd(0, &fd, &f) < 0)
    80204cee:	fe040613          	addi	a2,s0,-32
    80204cf2:	fec40593          	addi	a1,s0,-20
    80204cf6:	4501                	li	a0,0
    80204cf8:	00000097          	auipc	ra,0x0
    80204cfc:	d54080e7          	jalr	-684(ra) # 80204a4c <argfd>
    return -1;
    80204d00:	57fd                	li	a5,-1
  if(argfd(0, &fd, &f) < 0)
    80204d02:	02054463          	bltz	a0,80204d2a <sys_close+0x44>
  myproc()->ofile[fd] = 0;
    80204d06:	ffffd097          	auipc	ra,0xffffd
    80204d0a:	d88080e7          	jalr	-632(ra) # 80201a8e <myproc>
    80204d0e:	fec42783          	lw	a5,-20(s0)
    80204d12:	07e9                	addi	a5,a5,26
    80204d14:	078e                	slli	a5,a5,0x3
    80204d16:	953e                	add	a0,a0,a5
    80204d18:	00053423          	sd	zero,8(a0)
  fileclose(f);
    80204d1c:	fe043503          	ld	a0,-32(s0)
    80204d20:	fffff097          	auipc	ra,0xfffff
    80204d24:	0dc080e7          	jalr	220(ra) # 80203dfc <fileclose>
  return 0;
    80204d28:	4781                	li	a5,0
}
    80204d2a:	853e                	mv	a0,a5
    80204d2c:	60e2                	ld	ra,24(sp)
    80204d2e:	6442                	ld	s0,16(sp)
    80204d30:	6105                	addi	sp,sp,32
    80204d32:	8082                	ret

0000000080204d34 <sys_fstat>:
{
    80204d34:	1101                	addi	sp,sp,-32
    80204d36:	ec06                	sd	ra,24(sp)
    80204d38:	e822                	sd	s0,16(sp)
    80204d3a:	1000                	addi	s0,sp,32
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204d3c:	fe840613          	addi	a2,s0,-24
    80204d40:	4581                	li	a1,0
    80204d42:	4501                	li	a0,0
    80204d44:	00000097          	auipc	ra,0x0
    80204d48:	d08080e7          	jalr	-760(ra) # 80204a4c <argfd>
    return -1;
    80204d4c:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204d4e:	02054563          	bltz	a0,80204d78 <sys_fstat+0x44>
    80204d52:	fe040593          	addi	a1,s0,-32
    80204d56:	4505                	li	a0,1
    80204d58:	ffffe097          	auipc	ra,0xffffe
    80204d5c:	3be080e7          	jalr	958(ra) # 80203116 <argaddr>
    return -1;
    80204d60:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204d62:	00054b63          	bltz	a0,80204d78 <sys_fstat+0x44>
  return filestat(f, st);
    80204d66:	fe043583          	ld	a1,-32(s0)
    80204d6a:	fe843503          	ld	a0,-24(s0)
    80204d6e:	fffff097          	auipc	ra,0xfffff
    80204d72:	144080e7          	jalr	324(ra) # 80203eb2 <filestat>
    80204d76:	87aa                	mv	a5,a0
}
    80204d78:	853e                	mv	a0,a5
    80204d7a:	60e2                	ld	ra,24(sp)
    80204d7c:	6442                	ld	s0,16(sp)
    80204d7e:	6105                	addi	sp,sp,32
    80204d80:	8082                	ret

0000000080204d82 <sys_open>:

uint64
sys_open(void)
{
    80204d82:	7129                	addi	sp,sp,-320
    80204d84:	fe06                	sd	ra,312(sp)
    80204d86:	fa22                	sd	s0,304(sp)
    80204d88:	f626                	sd	s1,296(sp)
    80204d8a:	f24a                	sd	s2,288(sp)
    80204d8c:	ee4e                	sd	s3,280(sp)
    80204d8e:	0280                	addi	s0,sp,320
  char path[FAT32_MAX_PATH];
  int fd, omode;
  struct file *f;
  struct dirent *ep;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argint(1, &omode) < 0)
    80204d90:	10400613          	li	a2,260
    80204d94:	ec840593          	addi	a1,s0,-312
    80204d98:	4501                	li	a0,0
    80204d9a:	ffffe097          	auipc	ra,0xffffe
    80204d9e:	39e080e7          	jalr	926(ra) # 80203138 <argstr>
    80204da2:	87aa                	mv	a5,a0
    return -1;
    80204da4:	557d                	li	a0,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argint(1, &omode) < 0)
    80204da6:	0807ce63          	bltz	a5,80204e42 <sys_open+0xc0>
    80204daa:	ec440593          	addi	a1,s0,-316
    80204dae:	4505                	li	a0,1
    80204db0:	ffffe097          	auipc	ra,0xffffe
    80204db4:	304080e7          	jalr	772(ra) # 802030b4 <argint>
    80204db8:	0e054163          	bltz	a0,80204e9a <sys_open+0x118>

  if(omode & O_CREATE){
    80204dbc:	ec442603          	lw	a2,-316(s0)
    80204dc0:	04067793          	andi	a5,a2,64
    80204dc4:	c7d1                	beqz	a5,80204e50 <sys_open+0xce>
    ep = create(path, T_FILE, omode);
    80204dc6:	4589                	li	a1,2
    80204dc8:	ec840513          	addi	a0,s0,-312
    80204dcc:	00000097          	auipc	ra,0x0
    80204dd0:	d2a080e7          	jalr	-726(ra) # 80204af6 <create>
    80204dd4:	892a                	mv	s2,a0
    if(ep == NULL){
    80204dd6:	c561                	beqz	a0,80204e9e <sys_open+0x11c>
      eput(ep);
      return -1;
    }
  }

  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    80204dd8:	fffff097          	auipc	ra,0xfffff
    80204ddc:	f68080e7          	jalr	-152(ra) # 80203d40 <filealloc>
    80204de0:	89aa                	mv	s3,a0
    80204de2:	c579                	beqz	a0,80204eb0 <sys_open+0x12e>
    80204de4:	00000097          	auipc	ra,0x0
    80204de8:	cd0080e7          	jalr	-816(ra) # 80204ab4 <fdalloc>
    80204dec:	84aa                	mv	s1,a0
    80204dee:	0a054c63          	bltz	a0,80204ea6 <sys_open+0x124>
    eunlock(ep);
    eput(ep);
    return -1;
  }

  if(!(ep->attribute & ATTR_DIRECTORY) && (omode & O_TRUNC)){
    80204df2:	10094783          	lbu	a5,256(s2)
    80204df6:	8bc1                	andi	a5,a5,16
    80204df8:	e791                	bnez	a5,80204e04 <sys_open+0x82>
    80204dfa:	ec442783          	lw	a5,-316(s0)
    80204dfe:	4007f793          	andi	a5,a5,1024
    80204e02:	e7d1                	bnez	a5,80204e8e <sys_open+0x10c>
    etrunc(ep);
  }

  f->type = FD_ENTRY;
    80204e04:	4789                	li	a5,2
    80204e06:	00f9a023          	sw	a5,0(s3)
  f->off = (omode & O_APPEND) ? ep->file_size : 0;
    80204e0a:	ec442783          	lw	a5,-316(s0)
    80204e0e:	0047f693          	andi	a3,a5,4
    80204e12:	4701                	li	a4,0
    80204e14:	c299                	beqz	a3,80204e1a <sys_open+0x98>
    80204e16:	10892703          	lw	a4,264(s2)
    80204e1a:	02e9a023          	sw	a4,32(s3)
  f->ep = ep;
    80204e1e:	0129bc23          	sd	s2,24(s3)
  f->readable = !(omode & O_WRONLY);
    80204e22:	0017c713          	xori	a4,a5,1
    80204e26:	8b05                	andi	a4,a4,1
    80204e28:	00e98423          	sb	a4,8(s3)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80204e2c:	8b8d                	andi	a5,a5,3
    80204e2e:	00f037b3          	snez	a5,a5
    80204e32:	00f984a3          	sb	a5,9(s3)

  eunlock(ep);
    80204e36:	854a                	mv	a0,s2
    80204e38:	00002097          	auipc	ra,0x2
    80204e3c:	f1a080e7          	jalr	-230(ra) # 80206d52 <eunlock>

  return fd;
    80204e40:	8526                	mv	a0,s1
}
    80204e42:	70f2                	ld	ra,312(sp)
    80204e44:	7452                	ld	s0,304(sp)
    80204e46:	74b2                	ld	s1,296(sp)
    80204e48:	7912                	ld	s2,288(sp)
    80204e4a:	69f2                	ld	s3,280(sp)
    80204e4c:	6131                	addi	sp,sp,320
    80204e4e:	8082                	ret
    if((ep = ename(path)) == NULL){
    80204e50:	ec840513          	addi	a0,s0,-312
    80204e54:	00002097          	auipc	ra,0x2
    80204e58:	602080e7          	jalr	1538(ra) # 80207456 <ename>
    80204e5c:	892a                	mv	s2,a0
    80204e5e:	c131                	beqz	a0,80204ea2 <sys_open+0x120>
    elock(ep);
    80204e60:	00002097          	auipc	ra,0x2
    80204e64:	ebc080e7          	jalr	-324(ra) # 80206d1c <elock>
    if((ep->attribute & ATTR_DIRECTORY) && omode != O_RDONLY){
    80204e68:	10094783          	lbu	a5,256(s2)
    80204e6c:	8bc1                	andi	a5,a5,16
    80204e6e:	d7ad                	beqz	a5,80204dd8 <sys_open+0x56>
    80204e70:	ec442783          	lw	a5,-316(s0)
    80204e74:	d3b5                	beqz	a5,80204dd8 <sys_open+0x56>
      eunlock(ep);
    80204e76:	854a                	mv	a0,s2
    80204e78:	00002097          	auipc	ra,0x2
    80204e7c:	eda080e7          	jalr	-294(ra) # 80206d52 <eunlock>
      eput(ep);
    80204e80:	854a                	mv	a0,s2
    80204e82:	00002097          	auipc	ra,0x2
    80204e86:	f1e080e7          	jalr	-226(ra) # 80206da0 <eput>
      return -1;
    80204e8a:	557d                	li	a0,-1
    80204e8c:	bf5d                	j	80204e42 <sys_open+0xc0>
    etrunc(ep);
    80204e8e:	854a                	mv	a0,s2
    80204e90:	00002097          	auipc	ra,0x2
    80204e94:	e22080e7          	jalr	-478(ra) # 80206cb2 <etrunc>
    80204e98:	b7b5                	j	80204e04 <sys_open+0x82>
    return -1;
    80204e9a:	557d                	li	a0,-1
    80204e9c:	b75d                	j	80204e42 <sys_open+0xc0>
      return -1;
    80204e9e:	557d                	li	a0,-1
    80204ea0:	b74d                	j	80204e42 <sys_open+0xc0>
      return -1;
    80204ea2:	557d                	li	a0,-1
    80204ea4:	bf79                	j	80204e42 <sys_open+0xc0>
      fileclose(f);
    80204ea6:	854e                	mv	a0,s3
    80204ea8:	fffff097          	auipc	ra,0xfffff
    80204eac:	f54080e7          	jalr	-172(ra) # 80203dfc <fileclose>
    eunlock(ep);
    80204eb0:	854a                	mv	a0,s2
    80204eb2:	00002097          	auipc	ra,0x2
    80204eb6:	ea0080e7          	jalr	-352(ra) # 80206d52 <eunlock>
    eput(ep);
    80204eba:	854a                	mv	a0,s2
    80204ebc:	00002097          	auipc	ra,0x2
    80204ec0:	ee4080e7          	jalr	-284(ra) # 80206da0 <eput>
    return -1;
    80204ec4:	557d                	li	a0,-1
    80204ec6:	bfb5                	j	80204e42 <sys_open+0xc0>

0000000080204ec8 <sys_mkdir>:

uint64
sys_mkdir(void)
{
    80204ec8:	7169                	addi	sp,sp,-304
    80204eca:	f606                	sd	ra,296(sp)
    80204ecc:	f222                	sd	s0,288(sp)
    80204ece:	ee26                	sd	s1,280(sp)
    80204ed0:	1a00                	addi	s0,sp,304
  char path[FAT32_MAX_PATH];
  struct dirent *ep;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = create(path, T_DIR, 0)) == 0){
    80204ed2:	10400613          	li	a2,260
    80204ed6:	ed840593          	addi	a1,s0,-296
    80204eda:	4501                	li	a0,0
    80204edc:	ffffe097          	auipc	ra,0xffffe
    80204ee0:	25c080e7          	jalr	604(ra) # 80203138 <argstr>
    return -1;
    80204ee4:	57fd                	li	a5,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = create(path, T_DIR, 0)) == 0){
    80204ee6:	02054663          	bltz	a0,80204f12 <sys_mkdir+0x4a>
    80204eea:	4601                	li	a2,0
    80204eec:	4585                	li	a1,1
    80204eee:	ed840513          	addi	a0,s0,-296
    80204ef2:	00000097          	auipc	ra,0x0
    80204ef6:	c04080e7          	jalr	-1020(ra) # 80204af6 <create>
    80204efa:	84aa                	mv	s1,a0
    80204efc:	c10d                	beqz	a0,80204f1e <sys_mkdir+0x56>
  }
  eunlock(ep);
    80204efe:	00002097          	auipc	ra,0x2
    80204f02:	e54080e7          	jalr	-428(ra) # 80206d52 <eunlock>
  eput(ep);
    80204f06:	8526                	mv	a0,s1
    80204f08:	00002097          	auipc	ra,0x2
    80204f0c:	e98080e7          	jalr	-360(ra) # 80206da0 <eput>
  return 0;
    80204f10:	4781                	li	a5,0
}
    80204f12:	853e                	mv	a0,a5
    80204f14:	70b2                	ld	ra,296(sp)
    80204f16:	7412                	ld	s0,288(sp)
    80204f18:	64f2                	ld	s1,280(sp)
    80204f1a:	6155                	addi	sp,sp,304
    80204f1c:	8082                	ret
    return -1;
    80204f1e:	57fd                	li	a5,-1
    80204f20:	bfcd                	j	80204f12 <sys_mkdir+0x4a>

0000000080204f22 <sys_chdir>:

uint64
sys_chdir(void)
{
    80204f22:	7169                	addi	sp,sp,-304
    80204f24:	f606                	sd	ra,296(sp)
    80204f26:	f222                	sd	s0,288(sp)
    80204f28:	ee26                	sd	s1,280(sp)
    80204f2a:	ea4a                	sd	s2,272(sp)
    80204f2c:	1a00                	addi	s0,sp,304
  char path[FAT32_MAX_PATH];
  struct dirent *ep;
  struct proc *curr_proc = myproc();
    80204f2e:	ffffd097          	auipc	ra,0xffffd
    80204f32:	b60080e7          	jalr	-1184(ra) # 80201a8e <myproc>
    80204f36:	892a                	mv	s2,a0
  
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = ename(path)) == NULL){
    80204f38:	10400613          	li	a2,260
    80204f3c:	ed840593          	addi	a1,s0,-296
    80204f40:	4501                	li	a0,0
    80204f42:	ffffe097          	auipc	ra,0xffffe
    80204f46:	1f6080e7          	jalr	502(ra) # 80203138 <argstr>
    return -1;
    80204f4a:	57fd                	li	a5,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = ename(path)) == NULL){
    80204f4c:	04054b63          	bltz	a0,80204fa2 <sys_chdir+0x80>
    80204f50:	ed840513          	addi	a0,s0,-296
    80204f54:	00002097          	auipc	ra,0x2
    80204f58:	502080e7          	jalr	1282(ra) # 80207456 <ename>
    80204f5c:	84aa                	mv	s1,a0
    80204f5e:	c52d                	beqz	a0,80204fc8 <sys_chdir+0xa6>
  }
  printf("Running: CHDIR ... path: %s\n",  path);
    80204f60:	ed840593          	addi	a1,s0,-296
    80204f64:	00005517          	auipc	a0,0x5
    80204f68:	d1c50513          	addi	a0,a0,-740 # 80209c80 <digits+0x900>
    80204f6c:	ffffb097          	auipc	ra,0xffffb
    80204f70:	222080e7          	jalr	546(ra) # 8020018e <printf>
  elock(ep);
    80204f74:	8526                	mv	a0,s1
    80204f76:	00002097          	auipc	ra,0x2
    80204f7a:	da6080e7          	jalr	-602(ra) # 80206d1c <elock>
  if(!(ep->attribute & ATTR_DIRECTORY)){
    80204f7e:	1004c783          	lbu	a5,256(s1)
    80204f82:	8bc1                	andi	a5,a5,16
    80204f84:	c795                	beqz	a5,80204fb0 <sys_chdir+0x8e>
    eunlock(ep);
    eput(ep);
    return -1;
  }
  eunlock(ep);
    80204f86:	8526                	mv	a0,s1
    80204f88:	00002097          	auipc	ra,0x2
    80204f8c:	dca080e7          	jalr	-566(ra) # 80206d52 <eunlock>
  eput(curr_proc->cwd);
    80204f90:	15893503          	ld	a0,344(s2)
    80204f94:	00002097          	auipc	ra,0x2
    80204f98:	e0c080e7          	jalr	-500(ra) # 80206da0 <eput>
  curr_proc->cwd = ep;
    80204f9c:	14993c23          	sd	s1,344(s2)
  return 0;
    80204fa0:	4781                	li	a5,0
}
    80204fa2:	853e                	mv	a0,a5
    80204fa4:	70b2                	ld	ra,296(sp)
    80204fa6:	7412                	ld	s0,288(sp)
    80204fa8:	64f2                	ld	s1,280(sp)
    80204faa:	6952                	ld	s2,272(sp)
    80204fac:	6155                	addi	sp,sp,304
    80204fae:	8082                	ret
    eunlock(ep);
    80204fb0:	8526                	mv	a0,s1
    80204fb2:	00002097          	auipc	ra,0x2
    80204fb6:	da0080e7          	jalr	-608(ra) # 80206d52 <eunlock>
    eput(ep);
    80204fba:	8526                	mv	a0,s1
    80204fbc:	00002097          	auipc	ra,0x2
    80204fc0:	de4080e7          	jalr	-540(ra) # 80206da0 <eput>
    return -1;
    80204fc4:	57fd                	li	a5,-1
    80204fc6:	bff1                	j	80204fa2 <sys_chdir+0x80>
    return -1;
    80204fc8:	57fd                	li	a5,-1
    80204fca:	bfe1                	j	80204fa2 <sys_chdir+0x80>

0000000080204fcc <sys_pipe>:

uint64
sys_pipe(void)
{
    80204fcc:	7139                	addi	sp,sp,-64
    80204fce:	fc06                	sd	ra,56(sp)
    80204fd0:	f822                	sd	s0,48(sp)
    80204fd2:	f426                	sd	s1,40(sp)
    80204fd4:	0080                	addi	s0,sp,64
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();
    80204fd6:	ffffd097          	auipc	ra,0xffffd
    80204fda:	ab8080e7          	jalr	-1352(ra) # 80201a8e <myproc>
    80204fde:	84aa                	mv	s1,a0

  if(argaddr(0, &fdarray) < 0)
    80204fe0:	fd840593          	addi	a1,s0,-40
    80204fe4:	4501                	li	a0,0
    80204fe6:	ffffe097          	auipc	ra,0xffffe
    80204fea:	130080e7          	jalr	304(ra) # 80203116 <argaddr>
    return -1;
    80204fee:	57fd                	li	a5,-1
  if(argaddr(0, &fdarray) < 0)
    80204ff0:	0c054e63          	bltz	a0,802050cc <sys_pipe+0x100>
  if(pipealloc(&rf, &wf) < 0)
    80204ff4:	fc840593          	addi	a1,s0,-56
    80204ff8:	fd040513          	addi	a0,s0,-48
    80204ffc:	fffff097          	auipc	ra,0xfffff
    80205000:	2e2080e7          	jalr	738(ra) # 802042de <pipealloc>
    return -1;
    80205004:	57fd                	li	a5,-1
  if(pipealloc(&rf, &wf) < 0)
    80205006:	0c054363          	bltz	a0,802050cc <sys_pipe+0x100>
  fd0 = -1;
    8020500a:	fcf42223          	sw	a5,-60(s0)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    8020500e:	fd043503          	ld	a0,-48(s0)
    80205012:	00000097          	auipc	ra,0x0
    80205016:	aa2080e7          	jalr	-1374(ra) # 80204ab4 <fdalloc>
    8020501a:	fca42223          	sw	a0,-60(s0)
    8020501e:	08054a63          	bltz	a0,802050b2 <sys_pipe+0xe6>
    80205022:	fc843503          	ld	a0,-56(s0)
    80205026:	00000097          	auipc	ra,0x0
    8020502a:	a8e080e7          	jalr	-1394(ra) # 80204ab4 <fdalloc>
    8020502e:	fca42023          	sw	a0,-64(s0)
    80205032:	06054763          	bltz	a0,802050a0 <sys_pipe+0xd4>
    fileclose(wf);
    return -1;
  }
  // if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
  //    copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
  if(copyout2(fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80205036:	4611                	li	a2,4
    80205038:	fc440593          	addi	a1,s0,-60
    8020503c:	fd843503          	ld	a0,-40(s0)
    80205040:	ffffc097          	auipc	ra,0xffffc
    80205044:	332080e7          	jalr	818(ra) # 80201372 <copyout2>
    80205048:	00054f63          	bltz	a0,80205066 <sys_pipe+0x9a>
     copyout2(fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    8020504c:	4611                	li	a2,4
    8020504e:	fc040593          	addi	a1,s0,-64
    80205052:	fd843503          	ld	a0,-40(s0)
    80205056:	0511                	addi	a0,a0,4
    80205058:	ffffc097          	auipc	ra,0xffffc
    8020505c:	31a080e7          	jalr	794(ra) # 80201372 <copyout2>
    p->ofile[fd1] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  return 0;
    80205060:	4781                	li	a5,0
  if(copyout2(fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80205062:	06055563          	bgez	a0,802050cc <sys_pipe+0x100>
    p->ofile[fd0] = 0;
    80205066:	fc442783          	lw	a5,-60(s0)
    8020506a:	07e9                	addi	a5,a5,26
    8020506c:	078e                	slli	a5,a5,0x3
    8020506e:	97a6                	add	a5,a5,s1
    80205070:	0007b423          	sd	zero,8(a5)
    p->ofile[fd1] = 0;
    80205074:	fc042783          	lw	a5,-64(s0)
    80205078:	07e9                	addi	a5,a5,26
    8020507a:	078e                	slli	a5,a5,0x3
    8020507c:	00f48533          	add	a0,s1,a5
    80205080:	00053423          	sd	zero,8(a0)
    fileclose(rf);
    80205084:	fd043503          	ld	a0,-48(s0)
    80205088:	fffff097          	auipc	ra,0xfffff
    8020508c:	d74080e7          	jalr	-652(ra) # 80203dfc <fileclose>
    fileclose(wf);
    80205090:	fc843503          	ld	a0,-56(s0)
    80205094:	fffff097          	auipc	ra,0xfffff
    80205098:	d68080e7          	jalr	-664(ra) # 80203dfc <fileclose>
    return -1;
    8020509c:	57fd                	li	a5,-1
    8020509e:	a03d                	j	802050cc <sys_pipe+0x100>
    if(fd0 >= 0)
    802050a0:	fc442783          	lw	a5,-60(s0)
    802050a4:	0007c763          	bltz	a5,802050b2 <sys_pipe+0xe6>
      p->ofile[fd0] = 0;
    802050a8:	07e9                	addi	a5,a5,26
    802050aa:	078e                	slli	a5,a5,0x3
    802050ac:	97a6                	add	a5,a5,s1
    802050ae:	0007b423          	sd	zero,8(a5)
    fileclose(rf);
    802050b2:	fd043503          	ld	a0,-48(s0)
    802050b6:	fffff097          	auipc	ra,0xfffff
    802050ba:	d46080e7          	jalr	-698(ra) # 80203dfc <fileclose>
    fileclose(wf);
    802050be:	fc843503          	ld	a0,-56(s0)
    802050c2:	fffff097          	auipc	ra,0xfffff
    802050c6:	d3a080e7          	jalr	-710(ra) # 80203dfc <fileclose>
    return -1;
    802050ca:	57fd                	li	a5,-1
}
    802050cc:	853e                	mv	a0,a5
    802050ce:	70e2                	ld	ra,56(sp)
    802050d0:	7442                	ld	s0,48(sp)
    802050d2:	74a2                	ld	s1,40(sp)
    802050d4:	6121                	addi	sp,sp,64
    802050d6:	8082                	ret

00000000802050d8 <sys_dev>:

// To open console device.
uint64
sys_dev(void)
{
    802050d8:	7179                	addi	sp,sp,-48
    802050da:	f406                	sd	ra,40(sp)
    802050dc:	f022                	sd	s0,32(sp)
    802050de:	ec26                	sd	s1,24(sp)
    802050e0:	1800                	addi	s0,sp,48
  int fd, omode;
  int major, minor;
  struct file *f;

  if(argint(0, &omode) < 0 || argint(1, &major) < 0 || argint(2, &minor) < 0){
    802050e2:	fdc40593          	addi	a1,s0,-36
    802050e6:	4501                	li	a0,0
    802050e8:	ffffe097          	auipc	ra,0xffffe
    802050ec:	fcc080e7          	jalr	-52(ra) # 802030b4 <argint>
    802050f0:	08054a63          	bltz	a0,80205184 <sys_dev+0xac>
    802050f4:	fd840593          	addi	a1,s0,-40
    802050f8:	4505                	li	a0,1
    802050fa:	ffffe097          	auipc	ra,0xffffe
    802050fe:	fba080e7          	jalr	-70(ra) # 802030b4 <argint>
    80205102:	08054763          	bltz	a0,80205190 <sys_dev+0xb8>
    80205106:	fd440593          	addi	a1,s0,-44
    8020510a:	4509                	li	a0,2
    8020510c:	ffffe097          	auipc	ra,0xffffe
    80205110:	fa8080e7          	jalr	-88(ra) # 802030b4 <argint>
    80205114:	08054063          	bltz	a0,80205194 <sys_dev+0xbc>
    return -1;
  }

  if(omode & O_CREATE){
    80205118:	fdc42783          	lw	a5,-36(s0)
    8020511c:	0407f793          	andi	a5,a5,64
    80205120:	ebb1                	bnez	a5,80205174 <sys_dev+0x9c>
    panic("dev file on FAT");
  }

  if(major < 0 || major >= NDEV)
    80205122:	fd842703          	lw	a4,-40(s0)
    80205126:	47a5                	li	a5,9
    return -1;
    80205128:	557d                	li	a0,-1
  if(major < 0 || major >= NDEV)
    8020512a:	04e7ee63          	bltu	a5,a4,80205186 <sys_dev+0xae>

  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    8020512e:	fffff097          	auipc	ra,0xfffff
    80205132:	c12080e7          	jalr	-1006(ra) # 80203d40 <filealloc>
    80205136:	84aa                	mv	s1,a0
    80205138:	c125                	beqz	a0,80205198 <sys_dev+0xc0>
    8020513a:	00000097          	auipc	ra,0x0
    8020513e:	97a080e7          	jalr	-1670(ra) # 80204ab4 <fdalloc>
    80205142:	04054d63          	bltz	a0,8020519c <sys_dev+0xc4>
    if(f)
      fileclose(f);
    return -1;
  }

  f->type = FD_DEVICE;
    80205146:	478d                	li	a5,3
    80205148:	c09c                	sw	a5,0(s1)
  f->off = 0;
    8020514a:	0204a023          	sw	zero,32(s1)
  f->ep = 0;
    8020514e:	0004bc23          	sd	zero,24(s1)
  f->major = major;
    80205152:	fd842783          	lw	a5,-40(s0)
    80205156:	02f49223          	sh	a5,36(s1)
  f->readable = !(omode & O_WRONLY);
    8020515a:	fdc42783          	lw	a5,-36(s0)
    8020515e:	0017c713          	xori	a4,a5,1
    80205162:	8b05                	andi	a4,a4,1
    80205164:	00e48423          	sb	a4,8(s1)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80205168:	8b8d                	andi	a5,a5,3
    8020516a:	00f037b3          	snez	a5,a5
    8020516e:	00f484a3          	sb	a5,9(s1)

  return fd;
    80205172:	a811                	j	80205186 <sys_dev+0xae>
    panic("dev file on FAT");
    80205174:	00005517          	auipc	a0,0x5
    80205178:	b2c50513          	addi	a0,a0,-1236 # 80209ca0 <digits+0x920>
    8020517c:	ffffb097          	auipc	ra,0xffffb
    80205180:	fc8080e7          	jalr	-56(ra) # 80200144 <panic>
    return -1;
    80205184:	557d                	li	a0,-1
}
    80205186:	70a2                	ld	ra,40(sp)
    80205188:	7402                	ld	s0,32(sp)
    8020518a:	64e2                	ld	s1,24(sp)
    8020518c:	6145                	addi	sp,sp,48
    8020518e:	8082                	ret
    return -1;
    80205190:	557d                	li	a0,-1
    80205192:	bfd5                	j	80205186 <sys_dev+0xae>
    80205194:	557d                	li	a0,-1
    80205196:	bfc5                	j	80205186 <sys_dev+0xae>
    return -1;
    80205198:	557d                	li	a0,-1
    8020519a:	b7f5                	j	80205186 <sys_dev+0xae>
      fileclose(f);
    8020519c:	8526                	mv	a0,s1
    8020519e:	fffff097          	auipc	ra,0xfffff
    802051a2:	c5e080e7          	jalr	-930(ra) # 80203dfc <fileclose>
    return -1;
    802051a6:	557d                	li	a0,-1
    802051a8:	bff9                	j	80205186 <sys_dev+0xae>

00000000802051aa <sys_readdir>:

// To support ls command
uint64
sys_readdir(void)
{
    802051aa:	1101                	addi	sp,sp,-32
    802051ac:	ec06                	sd	ra,24(sp)
    802051ae:	e822                	sd	s0,16(sp)
    802051b0:	1000                	addi	s0,sp,32
  struct file *f;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    802051b2:	fe840613          	addi	a2,s0,-24
    802051b6:	4581                	li	a1,0
    802051b8:	4501                	li	a0,0
    802051ba:	00000097          	auipc	ra,0x0
    802051be:	892080e7          	jalr	-1902(ra) # 80204a4c <argfd>
    return -1;
    802051c2:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    802051c4:	02054563          	bltz	a0,802051ee <sys_readdir+0x44>
    802051c8:	fe040593          	addi	a1,s0,-32
    802051cc:	4505                	li	a0,1
    802051ce:	ffffe097          	auipc	ra,0xffffe
    802051d2:	f48080e7          	jalr	-184(ra) # 80203116 <argaddr>
    return -1;
    802051d6:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    802051d8:	00054b63          	bltz	a0,802051ee <sys_readdir+0x44>
  return dirnext(f, p);
    802051dc:	fe043583          	ld	a1,-32(s0)
    802051e0:	fe843503          	ld	a0,-24(s0)
    802051e4:	fffff097          	auipc	ra,0xfffff
    802051e8:	ec4080e7          	jalr	-316(ra) # 802040a8 <dirnext>
    802051ec:	87aa                	mv	a5,a0
}
    802051ee:	853e                	mv	a0,a5
    802051f0:	60e2                	ld	ra,24(sp)
    802051f2:	6442                	ld	s0,16(sp)
    802051f4:	6105                	addi	sp,sp,32
    802051f6:	8082                	ret

00000000802051f8 <sys_getcwd>:

// get absolute cwd string
uint64
sys_getcwd(void)
{
    802051f8:	714d                	addi	sp,sp,-336
    802051fa:	e686                	sd	ra,328(sp)
    802051fc:	e2a2                	sd	s0,320(sp)
    802051fe:	fe26                	sd	s1,312(sp)
    80205200:	fa4a                	sd	s2,304(sp)
    80205202:	f64e                	sd	s3,296(sp)
    80205204:	f252                	sd	s4,288(sp)
    80205206:	ee56                	sd	s5,280(sp)
    80205208:	0a80                	addi	s0,sp,336
 uint64 addr;
  if (argaddr(0, &addr) < 0)
    8020520a:	fb840593          	addi	a1,s0,-72
    8020520e:	4501                	li	a0,0
    80205210:	ffffe097          	auipc	ra,0xffffe
    80205214:	f06080e7          	jalr	-250(ra) # 80203116 <argaddr>
    return -1;
    80205218:	54fd                	li	s1,-1
  if (argaddr(0, &addr) < 0)
    8020521a:	08054763          	bltz	a0,802052a8 <sys_getcwd+0xb0>

  struct dirent *de = myproc()->cwd;
    8020521e:	ffffd097          	auipc	ra,0xffffd
    80205222:	870080e7          	jalr	-1936(ra) # 80201a8e <myproc>
    80205226:	15853483          	ld	s1,344(a0)
  char path[FAT32_MAX_PATH];
  char *s;
  int len;

  if (de->parent == NULL) {
    8020522a:	1204b783          	ld	a5,288(s1)
    8020522e:	c7bd                	beqz	a5,8020529c <sys_getcwd+0xa4>
    s = "/";
  } else {
    s = path + FAT32_MAX_PATH - 1;
    *s = '\0';
    80205230:	fa0409a3          	sb	zero,-77(s0)
    s = path + FAT32_MAX_PATH - 1;
    80205234:	fb340993          	addi	s3,s0,-77
    while (de->parent) {
      len = strlen(de->filename);
      s -= len;
      if (s <= path)          // can't reach root "/"
    80205238:	eb040a13          	addi	s4,s0,-336
        return -1;
      strncpy(s, de->filename, len);
      *--s = '/';
    8020523c:	02f00a93          	li	s5,47
      len = strlen(de->filename);
    80205240:	8526                	mv	a0,s1
    80205242:	ffffb097          	auipc	ra,0xffffb
    80205246:	6a4080e7          	jalr	1700(ra) # 802008e6 <strlen>
    8020524a:	862a                	mv	a2,a0
      s -= len;
    8020524c:	40a98933          	sub	s2,s3,a0
      if (s <= path)          // can't reach root "/"
    80205250:	052a7b63          	bgeu	s4,s2,802052a6 <sys_getcwd+0xae>
      strncpy(s, de->filename, len);
    80205254:	85a6                	mv	a1,s1
    80205256:	854a                	mv	a0,s2
    80205258:	ffffb097          	auipc	ra,0xffffb
    8020525c:	61e080e7          	jalr	1566(ra) # 80200876 <strncpy>
      *--s = '/';
    80205260:	fff90993          	addi	s3,s2,-1
    80205264:	ff590fa3          	sb	s5,-1(s2)
      de = de->parent;
    80205268:	1204b483          	ld	s1,288(s1)
    while (de->parent) {
    8020526c:	1204b783          	ld	a5,288(s1)
    80205270:	fbe1                	bnez	a5,80205240 <sys_getcwd+0x48>
    }
  }
  if(addr==0){
    80205272:	fb843483          	ld	s1,-72(s0)
    80205276:	c88d                	beqz	s1,802052a8 <sys_getcwd+0xb0>
    return 0;
  }
  // if (copyout(myproc()->pagetable, addr, s, strlen(s) + 1) < 0)
  if (copyout2(addr, s, strlen(s) + 1) < 0)
    80205278:	854e                	mv	a0,s3
    8020527a:	ffffb097          	auipc	ra,0xffffb
    8020527e:	66c080e7          	jalr	1644(ra) # 802008e6 <strlen>
    80205282:	0015061b          	addiw	a2,a0,1
    80205286:	85ce                	mv	a1,s3
    80205288:	8526                	mv	a0,s1
    8020528a:	ffffc097          	auipc	ra,0xffffc
    8020528e:	0e8080e7          	jalr	232(ra) # 80201372 <copyout2>
    80205292:	02054563          	bltz	a0,802052bc <sys_getcwd+0xc4>
    return -1;
  return addr;
    80205296:	fb843483          	ld	s1,-72(s0)
    8020529a:	a039                	j	802052a8 <sys_getcwd+0xb0>
    s = "/";
    8020529c:	00004997          	auipc	s3,0x4
    802052a0:	39498993          	addi	s3,s3,916 # 80209630 <digits+0x2b0>
    802052a4:	b7f9                	j	80205272 <sys_getcwd+0x7a>
        return -1;
    802052a6:	54fd                	li	s1,-1
}
    802052a8:	8526                	mv	a0,s1
    802052aa:	60b6                	ld	ra,328(sp)
    802052ac:	6416                	ld	s0,320(sp)
    802052ae:	74f2                	ld	s1,312(sp)
    802052b0:	7952                	ld	s2,304(sp)
    802052b2:	79b2                	ld	s3,296(sp)
    802052b4:	7a12                	ld	s4,288(sp)
    802052b6:	6af2                	ld	s5,280(sp)
    802052b8:	6171                	addi	sp,sp,336
    802052ba:	8082                	ret
    return -1;
    802052bc:	54fd                	li	s1,-1
    802052be:	b7ed                	j	802052a8 <sys_getcwd+0xb0>

00000000802052c0 <sys_remove>:
  return ret == -1;
}

uint64
sys_remove(void)
{
    802052c0:	d6010113          	addi	sp,sp,-672
    802052c4:	28113c23          	sd	ra,664(sp)
    802052c8:	28813823          	sd	s0,656(sp)
    802052cc:	28913423          	sd	s1,648(sp)
    802052d0:	1500                	addi	s0,sp,672
  char path[FAT32_MAX_PATH];
  struct dirent *ep;
  int len;
  if((len = argstr(0, path, FAT32_MAX_PATH)) <= 0)
    802052d2:	10400613          	li	a2,260
    802052d6:	ed840593          	addi	a1,s0,-296
    802052da:	4501                	li	a0,0
    802052dc:	ffffe097          	auipc	ra,0xffffe
    802052e0:	e5c080e7          	jalr	-420(ra) # 80203138 <argstr>
    802052e4:	0ea05a63          	blez	a0,802053d8 <sys_remove+0x118>
    return -1;

  char *s = path + len - 1;
    802052e8:	157d                	addi	a0,a0,-1
    802052ea:	ed840713          	addi	a4,s0,-296
    802052ee:	00a707b3          	add	a5,a4,a0
  while (s >= path && *s == '/') {
    802052f2:	02f00693          	li	a3,47
    802052f6:	863a                	mv	a2,a4
    802052f8:	00e7e963          	bltu	a5,a4,8020530a <sys_remove+0x4a>
    802052fc:	0007c703          	lbu	a4,0(a5)
    80205300:	08d71a63          	bne	a4,a3,80205394 <sys_remove+0xd4>
    s--;
    80205304:	17fd                	addi	a5,a5,-1
  while (s >= path && *s == '/') {
    80205306:	fec7fbe3          	bgeu	a5,a2,802052fc <sys_remove+0x3c>
  }
  if (s >= path && *s == '.' && (s == path || *--s == '/')) {
    return -1;
  }
  
  if((ep = ename(path)) == NULL){
    8020530a:	ed840513          	addi	a0,s0,-296
    8020530e:	00002097          	auipc	ra,0x2
    80205312:	148080e7          	jalr	328(ra) # 80207456 <ename>
    80205316:	84aa                	mv	s1,a0
    80205318:	c561                	beqz	a0,802053e0 <sys_remove+0x120>
    return -1;
  }
  elock(ep);
    8020531a:	00002097          	auipc	ra,0x2
    8020531e:	a02080e7          	jalr	-1534(ra) # 80206d1c <elock>
  if((ep->attribute & ATTR_DIRECTORY) && !isdirempty(ep)){
    80205322:	1004c783          	lbu	a5,256(s1)
    80205326:	8bc1                	andi	a5,a5,16
    80205328:	c38d                	beqz	a5,8020534a <sys_remove+0x8a>
  ep.valid = 0;
    8020532a:	e8041323          	sh	zero,-378(s0)
  ret = enext(dp, &ep, 2 * 32, &count);   // skip the "." and ".."
    8020532e:	d6c40693          	addi	a3,s0,-660
    80205332:	04000613          	li	a2,64
    80205336:	d7040593          	addi	a1,s0,-656
    8020533a:	8526                	mv	a0,s1
    8020533c:	00002097          	auipc	ra,0x2
    80205340:	be4080e7          	jalr	-1052(ra) # 80206f20 <enext>
  if((ep->attribute & ATTR_DIRECTORY) && !isdirempty(ep)){
    80205344:	57fd                	li	a5,-1
    80205346:	06f51d63          	bne	a0,a5,802053c0 <sys_remove+0x100>
      eunlock(ep);
      eput(ep);
      return -1;
  }
  elock(ep->parent);      // Will this lead to deadlock?
    8020534a:	1204b503          	ld	a0,288(s1)
    8020534e:	00002097          	auipc	ra,0x2
    80205352:	9ce080e7          	jalr	-1586(ra) # 80206d1c <elock>
  eremove(ep);
    80205356:	8526                	mv	a0,s1
    80205358:	00002097          	auipc	ra,0x2
    8020535c:	890080e7          	jalr	-1904(ra) # 80206be8 <eremove>
  eunlock(ep->parent);
    80205360:	1204b503          	ld	a0,288(s1)
    80205364:	00002097          	auipc	ra,0x2
    80205368:	9ee080e7          	jalr	-1554(ra) # 80206d52 <eunlock>
  eunlock(ep);
    8020536c:	8526                	mv	a0,s1
    8020536e:	00002097          	auipc	ra,0x2
    80205372:	9e4080e7          	jalr	-1564(ra) # 80206d52 <eunlock>
  eput(ep);
    80205376:	8526                	mv	a0,s1
    80205378:	00002097          	auipc	ra,0x2
    8020537c:	a28080e7          	jalr	-1496(ra) # 80206da0 <eput>

  return 0;
    80205380:	4501                	li	a0,0
}
    80205382:	29813083          	ld	ra,664(sp)
    80205386:	29013403          	ld	s0,656(sp)
    8020538a:	28813483          	ld	s1,648(sp)
    8020538e:	2a010113          	addi	sp,sp,672
    80205392:	8082                	ret
  if (s >= path && *s == '.' && (s == path || *--s == '/')) {
    80205394:	ed840713          	addi	a4,s0,-296
    80205398:	f6e7e9e3          	bltu	a5,a4,8020530a <sys_remove+0x4a>
    8020539c:	0007c683          	lbu	a3,0(a5)
    802053a0:	02e00713          	li	a4,46
    802053a4:	f6e693e3          	bne	a3,a4,8020530a <sys_remove+0x4a>
    802053a8:	ed840713          	addi	a4,s0,-296
    802053ac:	02e78863          	beq	a5,a4,802053dc <sys_remove+0x11c>
    802053b0:	fff7c703          	lbu	a4,-1(a5)
    802053b4:	02f00793          	li	a5,47
    802053b8:	f4f719e3          	bne	a4,a5,8020530a <sys_remove+0x4a>
    return -1;
    802053bc:	557d                	li	a0,-1
    802053be:	b7d1                	j	80205382 <sys_remove+0xc2>
      eunlock(ep);
    802053c0:	8526                	mv	a0,s1
    802053c2:	00002097          	auipc	ra,0x2
    802053c6:	990080e7          	jalr	-1648(ra) # 80206d52 <eunlock>
      eput(ep);
    802053ca:	8526                	mv	a0,s1
    802053cc:	00002097          	auipc	ra,0x2
    802053d0:	9d4080e7          	jalr	-1580(ra) # 80206da0 <eput>
      return -1;
    802053d4:	557d                	li	a0,-1
    802053d6:	b775                	j	80205382 <sys_remove+0xc2>
    return -1;
    802053d8:	557d                	li	a0,-1
    802053da:	b765                	j	80205382 <sys_remove+0xc2>
    return -1;
    802053dc:	557d                	li	a0,-1
    802053de:	b755                	j	80205382 <sys_remove+0xc2>
    return -1;
    802053e0:	557d                	li	a0,-1
    802053e2:	b745                	j	80205382 <sys_remove+0xc2>

00000000802053e4 <sys_rename>:

// Must hold too many locks at a time! It's possible to raise a deadlock.
// Because this op takes some steps, we can't promise
uint64
sys_rename(void)
{
    802053e4:	c4010113          	addi	sp,sp,-960
    802053e8:	3a113c23          	sd	ra,952(sp)
    802053ec:	3a813823          	sd	s0,944(sp)
    802053f0:	3a913423          	sd	s1,936(sp)
    802053f4:	3b213023          	sd	s2,928(sp)
    802053f8:	39313c23          	sd	s3,920(sp)
    802053fc:	39413823          	sd	s4,912(sp)
    80205400:	0780                	addi	s0,sp,960
  char old[FAT32_MAX_PATH], new[FAT32_MAX_PATH];
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    80205402:	10400613          	li	a2,260
    80205406:	ec840593          	addi	a1,s0,-312
    8020540a:	4501                	li	a0,0
    8020540c:	ffffe097          	auipc	ra,0xffffe
    80205410:	d2c080e7          	jalr	-724(ra) # 80203138 <argstr>
      return -1;
    80205414:	57fd                	li	a5,-1
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    80205416:	0c054d63          	bltz	a0,802054f0 <sys_rename+0x10c>
    8020541a:	10400613          	li	a2,260
    8020541e:	dc040593          	addi	a1,s0,-576
    80205422:	4505                	li	a0,1
    80205424:	ffffe097          	auipc	ra,0xffffe
    80205428:	d14080e7          	jalr	-748(ra) # 80203138 <argstr>
      return -1;
    8020542c:	57fd                	li	a5,-1
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    8020542e:	0c054163          	bltz	a0,802054f0 <sys_rename+0x10c>
  }

  struct dirent *src = NULL, *dst = NULL, *pdst = NULL;
  int srclock = 0;
  char *name;
  if ((src = ename(old)) == NULL || (pdst = enameparent(new, old)) == NULL
    80205432:	ec840513          	addi	a0,s0,-312
    80205436:	00002097          	auipc	ra,0x2
    8020543a:	020080e7          	jalr	32(ra) # 80207456 <ename>
    8020543e:	84aa                	mv	s1,a0
    80205440:	1c050963          	beqz	a0,80205612 <sys_rename+0x22e>
    80205444:	ec840593          	addi	a1,s0,-312
    80205448:	dc040513          	addi	a0,s0,-576
    8020544c:	00002097          	auipc	ra,0x2
    80205450:	0d4080e7          	jalr	212(ra) # 80207520 <enameparent>
    80205454:	892a                	mv	s2,a0
    80205456:	cd35                	beqz	a0,802054d2 <sys_rename+0xee>
      || (name = formatname(old)) == NULL) {
    80205458:	ec840513          	addi	a0,s0,-312
    8020545c:	00001097          	auipc	ra,0x1
    80205460:	1e0080e7          	jalr	480(ra) # 8020663c <formatname>
    80205464:	89aa                	mv	s3,a0
    80205466:	c535                	beqz	a0,802054d2 <sys_rename+0xee>
    goto fail;          // src doesn't exist || dst parent doesn't exist || illegal new name
  }
  for (struct dirent *ep = pdst; ep != NULL; ep = ep->parent) {
    if (ep == src) {    // In what universe can we move a directory into its child?
    80205468:	07248563          	beq	s1,s2,802054d2 <sys_rename+0xee>
  for (struct dirent *ep = pdst; ep != NULL; ep = ep->parent) {
    8020546c:	87ca                	mv	a5,s2
    8020546e:	1207b783          	ld	a5,288(a5)
    80205472:	c781                	beqz	a5,8020547a <sys_rename+0x96>
    if (ep == src) {    // In what universe can we move a directory into its child?
    80205474:	fef49de3          	bne	s1,a5,8020546e <sys_rename+0x8a>
    80205478:	a8a9                	j	802054d2 <sys_rename+0xee>
      goto fail;
    }
  }

  uint off;
  elock(src);     // must hold child's lock before acquiring parent's, because we do so in other similar cases
    8020547a:	8526                	mv	a0,s1
    8020547c:	00002097          	auipc	ra,0x2
    80205480:	8a0080e7          	jalr	-1888(ra) # 80206d1c <elock>
  srclock = 1;
  elock(pdst);
    80205484:	854a                	mv	a0,s2
    80205486:	00002097          	auipc	ra,0x2
    8020548a:	896080e7          	jalr	-1898(ra) # 80206d1c <elock>
  dst = dirlookup(pdst, name, &off);
    8020548e:	dbc40613          	addi	a2,s0,-580
    80205492:	85ce                	mv	a1,s3
    80205494:	854a                	mv	a0,s2
    80205496:	00002097          	auipc	ra,0x2
    8020549a:	c14080e7          	jalr	-1004(ra) # 802070aa <dirlookup>
    8020549e:	8a2a                	mv	s4,a0
  if (dst != NULL) {
    802054a0:	cd45                	beqz	a0,80205558 <sys_rename+0x174>
    eunlock(pdst);
    802054a2:	854a                	mv	a0,s2
    802054a4:	00002097          	auipc	ra,0x2
    802054a8:	8ae080e7          	jalr	-1874(ra) # 80206d52 <eunlock>
    if (src == dst) {
    802054ac:	01448963          	beq	s1,s4,802054be <sys_rename+0xda>
      goto fail;
    } else if (src->attribute & dst->attribute & ATTR_DIRECTORY) {
    802054b0:	1004c783          	lbu	a5,256(s1)
    802054b4:	100a4703          	lbu	a4,256(s4)
    802054b8:	8ff9                	and	a5,a5,a4
    802054ba:	8bc1                	andi	a5,a5,16
    802054bc:	ebb1                	bnez	a5,80205510 <sys_rename+0x12c>

  return 0;

fail:
  if (srclock)
    eunlock(src);
    802054be:	8526                	mv	a0,s1
    802054c0:	00002097          	auipc	ra,0x2
    802054c4:	892080e7          	jalr	-1902(ra) # 80206d52 <eunlock>
  if (dst)
    eput(dst);
    802054c8:	8552                	mv	a0,s4
    802054ca:	00002097          	auipc	ra,0x2
    802054ce:	8d6080e7          	jalr	-1834(ra) # 80206da0 <eput>
  if (pdst)
    802054d2:	00090763          	beqz	s2,802054e0 <sys_rename+0xfc>
    eput(pdst);
    802054d6:	854a                	mv	a0,s2
    802054d8:	00002097          	auipc	ra,0x2
    802054dc:	8c8080e7          	jalr	-1848(ra) # 80206da0 <eput>
  if (src)
    eput(src);
  return -1;
    802054e0:	57fd                	li	a5,-1
  if (src)
    802054e2:	c499                	beqz	s1,802054f0 <sys_rename+0x10c>
    eput(src);
    802054e4:	8526                	mv	a0,s1
    802054e6:	00002097          	auipc	ra,0x2
    802054ea:	8ba080e7          	jalr	-1862(ra) # 80206da0 <eput>
  return -1;
    802054ee:	57fd                	li	a5,-1
}
    802054f0:	853e                	mv	a0,a5
    802054f2:	3b813083          	ld	ra,952(sp)
    802054f6:	3b013403          	ld	s0,944(sp)
    802054fa:	3a813483          	ld	s1,936(sp)
    802054fe:	3a013903          	ld	s2,928(sp)
    80205502:	39813983          	ld	s3,920(sp)
    80205506:	39013a03          	ld	s4,912(sp)
    8020550a:	3c010113          	addi	sp,sp,960
    8020550e:	8082                	ret
      elock(dst);
    80205510:	8552                	mv	a0,s4
    80205512:	00002097          	auipc	ra,0x2
    80205516:	80a080e7          	jalr	-2038(ra) # 80206d1c <elock>
  ep.valid = 0;
    8020551a:	d6041323          	sh	zero,-666(s0)
  ret = enext(dp, &ep, 2 * 32, &count);   // skip the "." and ".."
    8020551e:	c4c40693          	addi	a3,s0,-948
    80205522:	04000613          	li	a2,64
    80205526:	c5040593          	addi	a1,s0,-944
    8020552a:	8552                	mv	a0,s4
    8020552c:	00002097          	auipc	ra,0x2
    80205530:	9f4080e7          	jalr	-1548(ra) # 80206f20 <enext>
      if (!isdirempty(dst)) {    // it's ok to overwrite an empty dir
    80205534:	57fd                	li	a5,-1
    80205536:	0cf51863          	bne	a0,a5,80205606 <sys_rename+0x222>
      elock(pdst);
    8020553a:	854a                	mv	a0,s2
    8020553c:	00001097          	auipc	ra,0x1
    80205540:	7e0080e7          	jalr	2016(ra) # 80206d1c <elock>
    eremove(dst);
    80205544:	8552                	mv	a0,s4
    80205546:	00001097          	auipc	ra,0x1
    8020554a:	6a2080e7          	jalr	1698(ra) # 80206be8 <eremove>
    eunlock(dst);
    8020554e:	8552                	mv	a0,s4
    80205550:	00002097          	auipc	ra,0x2
    80205554:	802080e7          	jalr	-2046(ra) # 80206d52 <eunlock>
  memmove(src->filename, name, FAT32_MAX_FILENAME);
    80205558:	0ff00613          	li	a2,255
    8020555c:	85ce                	mv	a1,s3
    8020555e:	8526                	mv	a0,s1
    80205560:	ffffb097          	auipc	ra,0xffffb
    80205564:	25e080e7          	jalr	606(ra) # 802007be <memmove>
  emake(pdst, src, off);
    80205568:	dbc42603          	lw	a2,-580(s0)
    8020556c:	85a6                	mv	a1,s1
    8020556e:	854a                	mv	a0,s2
    80205570:	00001097          	auipc	ra,0x1
    80205574:	184080e7          	jalr	388(ra) # 802066f4 <emake>
  if (src->parent != pdst) {
    80205578:	1204b783          	ld	a5,288(s1)
    8020557c:	01278d63          	beq	a5,s2,80205596 <sys_rename+0x1b2>
    eunlock(pdst);
    80205580:	854a                	mv	a0,s2
    80205582:	00001097          	auipc	ra,0x1
    80205586:	7d0080e7          	jalr	2000(ra) # 80206d52 <eunlock>
    elock(src->parent);
    8020558a:	1204b503          	ld	a0,288(s1)
    8020558e:	00001097          	auipc	ra,0x1
    80205592:	78e080e7          	jalr	1934(ra) # 80206d1c <elock>
  eremove(src);
    80205596:	8526                	mv	a0,s1
    80205598:	00001097          	auipc	ra,0x1
    8020559c:	650080e7          	jalr	1616(ra) # 80206be8 <eremove>
  eunlock(src->parent);
    802055a0:	1204b503          	ld	a0,288(s1)
    802055a4:	00001097          	auipc	ra,0x1
    802055a8:	7ae080e7          	jalr	1966(ra) # 80206d52 <eunlock>
  struct dirent *psrc = src->parent;  // src must not be root, or it won't pass the for-loop test
    802055ac:	1204b983          	ld	s3,288(s1)
  src->parent = edup(pdst);
    802055b0:	854a                	mv	a0,s2
    802055b2:	00001097          	auipc	ra,0x1
    802055b6:	50c080e7          	jalr	1292(ra) # 80206abe <edup>
    802055ba:	12a4b023          	sd	a0,288(s1)
  src->off = off;
    802055be:	dbc42783          	lw	a5,-580(s0)
    802055c2:	10f4ae23          	sw	a5,284(s1)
  src->valid = 1;
    802055c6:	4785                	li	a5,1
    802055c8:	10f49b23          	sh	a5,278(s1)
  eunlock(src);
    802055cc:	8526                	mv	a0,s1
    802055ce:	00001097          	auipc	ra,0x1
    802055d2:	784080e7          	jalr	1924(ra) # 80206d52 <eunlock>
  eput(psrc);
    802055d6:	854e                	mv	a0,s3
    802055d8:	00001097          	auipc	ra,0x1
    802055dc:	7c8080e7          	jalr	1992(ra) # 80206da0 <eput>
  if (dst) {
    802055e0:	000a0763          	beqz	s4,802055ee <sys_rename+0x20a>
    eput(dst);
    802055e4:	8552                	mv	a0,s4
    802055e6:	00001097          	auipc	ra,0x1
    802055ea:	7ba080e7          	jalr	1978(ra) # 80206da0 <eput>
  eput(pdst);
    802055ee:	854a                	mv	a0,s2
    802055f0:	00001097          	auipc	ra,0x1
    802055f4:	7b0080e7          	jalr	1968(ra) # 80206da0 <eput>
  eput(src);
    802055f8:	8526                	mv	a0,s1
    802055fa:	00001097          	auipc	ra,0x1
    802055fe:	7a6080e7          	jalr	1958(ra) # 80206da0 <eput>
  return 0;
    80205602:	4781                	li	a5,0
    80205604:	b5f5                	j	802054f0 <sys_rename+0x10c>
        eunlock(dst);
    80205606:	8552                	mv	a0,s4
    80205608:	00001097          	auipc	ra,0x1
    8020560c:	74a080e7          	jalr	1866(ra) # 80206d52 <eunlock>
        goto fail;
    80205610:	b57d                	j	802054be <sys_rename+0xda>
  struct dirent *src = NULL, *dst = NULL, *pdst = NULL;
    80205612:	892a                	mv	s2,a0
  if (dst)
    80205614:	bd7d                	j	802054d2 <sys_rename+0xee>

0000000080205616 <sys_mkdirat>:
////////////////////////////////////////////////////////////////////////////


uint64
sys_mkdirat(void)
{
    80205616:	7169                	addi	sp,sp,-304
    80205618:	f606                	sd	ra,296(sp)
    8020561a:	f222                	sd	s0,288(sp)
    8020561c:	ee26                	sd	s1,280(sp)
    8020561e:	1a00                	addi	s0,sp,304
  char path[FAT32_MAX_PATH];
  int dirfd, mode;
  struct dirent *ep;
  if (argint(0, &dirfd) < 0 || argstr(1, path, FAT32_MAX_PATH) < 0 || argint(2, &mode) < 0) {
    80205620:	ed440593          	addi	a1,s0,-300
    80205624:	4501                	li	a0,0
    80205626:	ffffe097          	auipc	ra,0xffffe
    8020562a:	a8e080e7          	jalr	-1394(ra) # 802030b4 <argint>
    return -1;
    8020562e:	57fd                	li	a5,-1
  if (argint(0, &dirfd) < 0 || argstr(1, path, FAT32_MAX_PATH) < 0 || argint(2, &mode) < 0) {
    80205630:	06054a63          	bltz	a0,802056a4 <sys_mkdirat+0x8e>
    80205634:	10400613          	li	a2,260
    80205638:	ed840593          	addi	a1,s0,-296
    8020563c:	4505                	li	a0,1
    8020563e:	ffffe097          	auipc	ra,0xffffe
    80205642:	afa080e7          	jalr	-1286(ra) # 80203138 <argstr>
    return -1;
    80205646:	57fd                	li	a5,-1
  if (argint(0, &dirfd) < 0 || argstr(1, path, FAT32_MAX_PATH) < 0 || argint(2, &mode) < 0) {
    80205648:	04054e63          	bltz	a0,802056a4 <sys_mkdirat+0x8e>
    8020564c:	ed040593          	addi	a1,s0,-304
    80205650:	4509                	li	a0,2
    80205652:	ffffe097          	auipc	ra,0xffffe
    80205656:	a62080e7          	jalr	-1438(ra) # 802030b4 <argint>
    return -1;
    8020565a:	57fd                	li	a5,-1
  if (argint(0, &dirfd) < 0 || argstr(1, path, FAT32_MAX_PATH) < 0 || argint(2, &mode) < 0) {
    8020565c:	04054463          	bltz	a0,802056a4 <sys_mkdirat+0x8e>
  }
  printf("Running: MKDIR ... dirfd: %d ... mode: 0x%x... path: %s\n", dirfd, mode, path);
    80205660:	ed840493          	addi	s1,s0,-296
    80205664:	86a6                	mv	a3,s1
    80205666:	ed042603          	lw	a2,-304(s0)
    8020566a:	ed442583          	lw	a1,-300(s0)
    8020566e:	00004517          	auipc	a0,0x4
    80205672:	64250513          	addi	a0,a0,1602 # 80209cb0 <digits+0x930>
    80205676:	ffffb097          	auipc	ra,0xffffb
    8020567a:	b18080e7          	jalr	-1256(ra) # 8020018e <printf>
  ep = create(path, T_DIR, mode);
    8020567e:	ed042603          	lw	a2,-304(s0)
    80205682:	4585                	li	a1,1
    80205684:	8526                	mv	a0,s1
    80205686:	fffff097          	auipc	ra,0xfffff
    8020568a:	470080e7          	jalr	1136(ra) # 80204af6 <create>
    8020568e:	84aa                	mv	s1,a0
  eunlock(ep);
    80205690:	00001097          	auipc	ra,0x1
    80205694:	6c2080e7          	jalr	1730(ra) # 80206d52 <eunlock>
  eput(ep);
    80205698:	8526                	mv	a0,s1
    8020569a:	00001097          	auipc	ra,0x1
    8020569e:	706080e7          	jalr	1798(ra) # 80206da0 <eput>
  return 0;
    802056a2:	4781                	li	a5,0
}
    802056a4:	853e                	mv	a0,a5
    802056a6:	70b2                	ld	ra,296(sp)
    802056a8:	7412                	ld	s0,288(sp)
    802056aa:	64f2                	ld	s1,280(sp)
    802056ac:	6155                	addi	sp,sp,304
    802056ae:	8082                	ret

00000000802056b0 <sys_openat>:


uint64
sys_openat(void)
{
    802056b0:	714d                	addi	sp,sp,-336
    802056b2:	e686                	sd	ra,328(sp)
    802056b4:	e2a2                	sd	s0,320(sp)
    802056b6:	fe26                	sd	s1,312(sp)
    802056b8:	fa4a                	sd	s2,304(sp)
    802056ba:	f64e                	sd	s3,296(sp)
    802056bc:	0a80                	addi	s0,sp,336
  struct file *f;
  struct file *curr_f;
  struct dirent *ep;
  struct dirent *dest_ep;

  if(argint(0, &curr_fd) < 0 || argstr(1, path, FAT32_MAX_PATH) < 0 || argint(2, &omode) < 0 ||argint(3, &mode)<0)
    802056be:	ec440593          	addi	a1,s0,-316
    802056c2:	4501                	li	a0,0
    802056c4:	ffffe097          	auipc	ra,0xffffe
    802056c8:	9f0080e7          	jalr	-1552(ra) # 802030b4 <argint>
    return -1;
    802056cc:	54fd                	li	s1,-1
  if(argint(0, &curr_fd) < 0 || argstr(1, path, FAT32_MAX_PATH) < 0 || argint(2, &omode) < 0 ||argint(3, &mode)<0)
    802056ce:	0e054f63          	bltz	a0,802057cc <sys_openat+0x11c>
    802056d2:	10400613          	li	a2,260
    802056d6:	ec840593          	addi	a1,s0,-312
    802056da:	4505                	li	a0,1
    802056dc:	ffffe097          	auipc	ra,0xffffe
    802056e0:	a5c080e7          	jalr	-1444(ra) # 80203138 <argstr>
    802056e4:	0e054463          	bltz	a0,802057cc <sys_openat+0x11c>
    802056e8:	ec040593          	addi	a1,s0,-320
    802056ec:	4509                	li	a0,2
    802056ee:	ffffe097          	auipc	ra,0xffffe
    802056f2:	9c6080e7          	jalr	-1594(ra) # 802030b4 <argint>
    802056f6:	0c054b63          	bltz	a0,802057cc <sys_openat+0x11c>
    802056fa:	ebc40593          	addi	a1,s0,-324
    802056fe:	450d                	li	a0,3
    80205700:	ffffe097          	auipc	ra,0xffffe
    80205704:	9b4080e7          	jalr	-1612(ra) # 802030b4 <argint>
    80205708:	0c054263          	bltz	a0,802057cc <sys_openat+0x11c>
  printf("Running: OPENAT ... filefd: %d ... mode: 0x%x ... omode: 0x%x... path: %s\n", curr_fd, mode, omode, path);
    8020570c:	ec840713          	addi	a4,s0,-312
    80205710:	ec042683          	lw	a3,-320(s0)
    80205714:	ebc42603          	lw	a2,-324(s0)
    80205718:	ec442583          	lw	a1,-316(s0)
    8020571c:	00004517          	auipc	a0,0x4
    80205720:	5d450513          	addi	a0,a0,1492 # 80209cf0 <digits+0x970>
    80205724:	ffffb097          	auipc	ra,0xffffb
    80205728:	a6a080e7          	jalr	-1430(ra) # 8020018e <printf>
  relative = 1;
  if(path[0] != '/' && curr_fd != AT_FDCWD){/*绝对路径，忽略fd*/
    8020572c:	ec844703          	lbu	a4,-312(s0)
    80205730:	02f00793          	li	a5,47
    80205734:	00f70863          	beq	a4,a5,80205744 <sys_openat+0x94>
    80205738:	ec442703          	lw	a4,-316(s0)
    8020573c:	f9c00793          	li	a5,-100
    80205740:	08f71e63          	bne	a4,a5,802057dc <sys_openat+0x12c>
  else{
    relative = 1;
    dest_ep = 0;
  }
  /*open*/
  if(omode & O_CREATE){
    80205744:	ec042603          	lw	a2,-320(s0)
    80205748:	04067793          	andi	a5,a2,64
    8020574c:	cbed                	beqz	a5,8020583e <sys_openat+0x18e>
    ep = create(path, T_FILE, omode);
    8020574e:	4589                	li	a1,2
    80205750:	ec840513          	addi	a0,s0,-312
    80205754:	fffff097          	auipc	ra,0xfffff
    80205758:	3a2080e7          	jalr	930(ra) # 80204af6 <create>
    8020575c:	892a                	mv	s2,a0
    if(ep == NULL){
    8020575e:	10050263          	beqz	a0,80205862 <sys_openat+0x1b2>
      eput(ep);
      return -1;
    }
  }

  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    80205762:	ffffe097          	auipc	ra,0xffffe
    80205766:	5de080e7          	jalr	1502(ra) # 80203d40 <filealloc>
    8020576a:	89aa                	mv	s3,a0
    8020576c:	10050463          	beqz	a0,80205874 <sys_openat+0x1c4>
    80205770:	fffff097          	auipc	ra,0xfffff
    80205774:	344080e7          	jalr	836(ra) # 80204ab4 <fdalloc>
    80205778:	84aa                	mv	s1,a0
    8020577a:	0e054863          	bltz	a0,8020586a <sys_openat+0x1ba>
    eunlock(ep);
    eput(ep);
    return -1;
  }

  if(!(ep->attribute & ATTR_DIRECTORY) && (omode & O_TRUNC)){
    8020577e:	10094783          	lbu	a5,256(s2)
    80205782:	8bc1                	andi	a5,a5,16
    80205784:	e791                	bnez	a5,80205790 <sys_openat+0xe0>
    80205786:	ec042783          	lw	a5,-320(s0)
    8020578a:	4007f793          	andi	a5,a5,1024
    8020578e:	e3f1                	bnez	a5,80205852 <sys_openat+0x1a2>
    etrunc(ep);
  }

  f->type = FD_ENTRY;
    80205790:	4789                	li	a5,2
    80205792:	00f9a023          	sw	a5,0(s3)
  f->off = (omode & O_APPEND) ? ep->file_size : 0;
    80205796:	ec042783          	lw	a5,-320(s0)
    8020579a:	0047f693          	andi	a3,a5,4
    8020579e:	4701                	li	a4,0
    802057a0:	c299                	beqz	a3,802057a6 <sys_openat+0xf6>
    802057a2:	10892703          	lw	a4,264(s2)
    802057a6:	02e9a023          	sw	a4,32(s3)
  f->ep = ep;
    802057aa:	0129bc23          	sd	s2,24(s3)
  f->readable = !(omode & O_WRONLY);
    802057ae:	0017c713          	xori	a4,a5,1
    802057b2:	8b05                	andi	a4,a4,1
    802057b4:	00e98423          	sb	a4,8(s3)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    802057b8:	8b8d                	andi	a5,a5,3
    802057ba:	00f037b3          	snez	a5,a5
    802057be:	00f984a3          	sb	a5,9(s3)

  eunlock(ep);
    802057c2:	854a                	mv	a0,s2
    802057c4:	00001097          	auipc	ra,0x1
    802057c8:	58e080e7          	jalr	1422(ra) # 80206d52 <eunlock>

  return fd;
}
    802057cc:	8526                	mv	a0,s1
    802057ce:	60b6                	ld	ra,328(sp)
    802057d0:	6416                	ld	s0,320(sp)
    802057d2:	74f2                	ld	s1,312(sp)
    802057d4:	7952                	ld	s2,304(sp)
    802057d6:	79b2                	ld	s3,296(sp)
    802057d8:	6171                	addi	sp,sp,336
    802057da:	8082                	ret
    curr_f = myproc()->ofile[curr_fd];
    802057dc:	ffffc097          	auipc	ra,0xffffc
    802057e0:	2b2080e7          	jalr	690(ra) # 80201a8e <myproc>
    802057e4:	ec442783          	lw	a5,-316(s0)
    802057e8:	07e9                	addi	a5,a5,26
    802057ea:	078e                	slli	a5,a5,0x3
    802057ec:	953e                	add	a0,a0,a5
    802057ee:	651c                	ld	a5,8(a0)
    if(curr_f == 0) return -1;
    802057f0:	c7bd                	beqz	a5,8020585e <sys_openat+0x1ae>
    dest_ep = curr_f->ep;
    802057f2:	6f88                	ld	a0,24(a5)
  if(omode & O_CREATE){
    802057f4:	ec042603          	lw	a2,-320(s0)
    802057f8:	04067793          	andi	a5,a2,64
    802057fc:	fba9                	bnez	a5,8020574e <sys_openat+0x9e>
      if((ep = ename_env(dest_ep, path))== NULL){
    802057fe:	ec840593          	addi	a1,s0,-312
    80205802:	00002097          	auipc	ra,0x2
    80205806:	c72080e7          	jalr	-910(ra) # 80207474 <ename_env>
    8020580a:	892a                	mv	s2,a0
    8020580c:	cd29                	beqz	a0,80205866 <sys_openat+0x1b6>
    elock(ep);
    8020580e:	854a                	mv	a0,s2
    80205810:	00001097          	auipc	ra,0x1
    80205814:	50c080e7          	jalr	1292(ra) # 80206d1c <elock>
    if((ep->attribute & ATTR_DIRECTORY) && omode != O_RDONLY){
    80205818:	10094783          	lbu	a5,256(s2)
    8020581c:	8bc1                	andi	a5,a5,16
    8020581e:	d3b1                	beqz	a5,80205762 <sys_openat+0xb2>
    80205820:	ec042783          	lw	a5,-320(s0)
    80205824:	df9d                	beqz	a5,80205762 <sys_openat+0xb2>
      eunlock(ep);
    80205826:	854a                	mv	a0,s2
    80205828:	00001097          	auipc	ra,0x1
    8020582c:	52a080e7          	jalr	1322(ra) # 80206d52 <eunlock>
      eput(ep);
    80205830:	854a                	mv	a0,s2
    80205832:	00001097          	auipc	ra,0x1
    80205836:	56e080e7          	jalr	1390(ra) # 80206da0 <eput>
      return -1;
    8020583a:	54fd                	li	s1,-1
    8020583c:	bf41                	j	802057cc <sys_openat+0x11c>
      if((ep = ename(path)) == NULL){
    8020583e:	ec840513          	addi	a0,s0,-312
    80205842:	00002097          	auipc	ra,0x2
    80205846:	c14080e7          	jalr	-1004(ra) # 80207456 <ename>
    8020584a:	892a                	mv	s2,a0
    8020584c:	f169                	bnez	a0,8020580e <sys_openat+0x15e>
        return -1;
    8020584e:	54fd                	li	s1,-1
    80205850:	bfb5                	j	802057cc <sys_openat+0x11c>
    etrunc(ep);
    80205852:	854a                	mv	a0,s2
    80205854:	00001097          	auipc	ra,0x1
    80205858:	45e080e7          	jalr	1118(ra) # 80206cb2 <etrunc>
    8020585c:	bf15                	j	80205790 <sys_openat+0xe0>
    if(curr_f == 0) return -1;
    8020585e:	54fd                	li	s1,-1
    80205860:	b7b5                	j	802057cc <sys_openat+0x11c>
      return -1;
    80205862:	54fd                	li	s1,-1
    80205864:	b7a5                	j	802057cc <sys_openat+0x11c>
        return -1;
    80205866:	54fd                	li	s1,-1
    80205868:	b795                	j	802057cc <sys_openat+0x11c>
      fileclose(f);
    8020586a:	854e                	mv	a0,s3
    8020586c:	ffffe097          	auipc	ra,0xffffe
    80205870:	590080e7          	jalr	1424(ra) # 80203dfc <fileclose>
    eunlock(ep);
    80205874:	854a                	mv	a0,s2
    80205876:	00001097          	auipc	ra,0x1
    8020587a:	4dc080e7          	jalr	1244(ra) # 80206d52 <eunlock>
    eput(ep);
    8020587e:	854a                	mv	a0,s2
    80205880:	00001097          	auipc	ra,0x1
    80205884:	520080e7          	jalr	1312(ra) # 80206da0 <eput>
    return -1;
    80205888:	54fd                	li	s1,-1
    8020588a:	b789                	j	802057cc <sys_openat+0x11c>

000000008020588c <sys_dup3>:


uint64
sys_dup3(void)
{
    8020588c:	7179                	addi	sp,sp,-48
    8020588e:	f406                	sd	ra,40(sp)
    80205890:	f022                	sd	s0,32(sp)
    80205892:	ec26                	sd	s1,24(sp)
    80205894:	1800                	addi	s0,sp,48
  struct file *f;
  int newfd;
  
  if(argfd(0, 0, &f) < 0) 
    80205896:	fd840613          	addi	a2,s0,-40
    8020589a:	4581                	li	a1,0
    8020589c:	4501                	li	a0,0
    8020589e:	fffff097          	auipc	ra,0xfffff
    802058a2:	1ae080e7          	jalr	430(ra) # 80204a4c <argfd>
    return -1;
    802058a6:	577d                	li	a4,-1
  if(argfd(0, 0, &f) < 0) 
    802058a8:	06054963          	bltz	a0,8020591a <sys_dup3+0x8e>
  if(argint(1, &newfd) < 0 || newfd < 0)
    802058ac:	fd440593          	addi	a1,s0,-44
    802058b0:	4505                	li	a0,1
    802058b2:	ffffe097          	auipc	ra,0xffffe
    802058b6:	802080e7          	jalr	-2046(ra) # 802030b4 <argint>
    802058ba:	fd442783          	lw	a5,-44(s0)
    802058be:	8fc9                	or	a5,a5,a0
    802058c0:	2781                	sext.w	a5,a5
    return -1;
    802058c2:	577d                	li	a4,-1
  if(argint(1, &newfd) < 0 || newfd < 0)
    802058c4:	0407cb63          	bltz	a5,8020591a <sys_dup3+0x8e>
  if(myproc()->ofile[newfd] != f) 
    802058c8:	ffffc097          	auipc	ra,0xffffc
    802058cc:	1c6080e7          	jalr	454(ra) # 80201a8e <myproc>
    802058d0:	fd843483          	ld	s1,-40(s0)
    802058d4:	fd442783          	lw	a5,-44(s0)
    802058d8:	07e9                	addi	a5,a5,26
    802058da:	078e                	slli	a5,a5,0x3
    802058dc:	953e                	add	a0,a0,a5
    802058de:	651c                	ld	a5,8(a0)
    802058e0:	02978163          	beq	a5,s1,80205902 <sys_dup3+0x76>
  {
    myproc()->ofile[newfd] = f;
    802058e4:	ffffc097          	auipc	ra,0xffffc
    802058e8:	1aa080e7          	jalr	426(ra) # 80201a8e <myproc>
    802058ec:	fd442783          	lw	a5,-44(s0)
    802058f0:	07e9                	addi	a5,a5,26
    802058f2:	078e                	slli	a5,a5,0x3
    802058f4:	953e                	add	a0,a0,a5
    802058f6:	e504                	sd	s1,8(a0)
    filedup(f);
    802058f8:	8526                	mv	a0,s1
    802058fa:	ffffe097          	auipc	ra,0xffffe
    802058fe:	4b0080e7          	jalr	1200(ra) # 80203daa <filedup>
  }
  printf("Running: DUP3 ... newfd: %d \n", newfd);
    80205902:	fd442583          	lw	a1,-44(s0)
    80205906:	00004517          	auipc	a0,0x4
    8020590a:	43a50513          	addi	a0,a0,1082 # 80209d40 <digits+0x9c0>
    8020590e:	ffffb097          	auipc	ra,0xffffb
    80205912:	880080e7          	jalr	-1920(ra) # 8020018e <printf>
  return newfd;
    80205916:	fd442703          	lw	a4,-44(s0)
}
    8020591a:	853a                	mv	a0,a4
    8020591c:	70a2                	ld	ra,40(sp)
    8020591e:	7402                	ld	s0,32(sp)
    80205920:	64e2                	ld	s1,24(sp)
    80205922:	6145                	addi	sp,sp,48
    80205924:	8082                	ret

0000000080205926 <sys_getdents64>:

uint64
sys_getdents64(void){
    80205926:	7179                	addi	sp,sp,-48
    80205928:	f406                	sd	ra,40(sp)
    8020592a:	f022                	sd	s0,32(sp)
    8020592c:	1800                	addi	s0,sp,48
  struct file *f;
  uint64 buf;
  int len, fd;

  if (argfd(0, &fd, &f) < 0 || argaddr(1, &buf) < 0 || argint(2, &len) < 0)
    8020592e:	fe840613          	addi	a2,s0,-24
    80205932:	fd840593          	addi	a1,s0,-40
    80205936:	4501                	li	a0,0
    80205938:	fffff097          	auipc	ra,0xfffff
    8020593c:	114080e7          	jalr	276(ra) # 80204a4c <argfd>
    return -1;
    80205940:	57fd                	li	a5,-1
  if (argfd(0, &fd, &f) < 0 || argaddr(1, &buf) < 0 || argint(2, &len) < 0)
    80205942:	04054f63          	bltz	a0,802059a0 <sys_getdents64+0x7a>
    80205946:	fe040593          	addi	a1,s0,-32
    8020594a:	4505                	li	a0,1
    8020594c:	ffffd097          	auipc	ra,0xffffd
    80205950:	7ca080e7          	jalr	1994(ra) # 80203116 <argaddr>
    return -1;
    80205954:	57fd                	li	a5,-1
  if (argfd(0, &fd, &f) < 0 || argaddr(1, &buf) < 0 || argint(2, &len) < 0)
    80205956:	04054563          	bltz	a0,802059a0 <sys_getdents64+0x7a>
    8020595a:	fdc40593          	addi	a1,s0,-36
    8020595e:	4509                	li	a0,2
    80205960:	ffffd097          	auipc	ra,0xffffd
    80205964:	754080e7          	jalr	1876(ra) # 802030b4 <argint>
    return -1;
    80205968:	57fd                	li	a5,-1
  if (argfd(0, &fd, &f) < 0 || argaddr(1, &buf) < 0 || argint(2, &len) < 0)
    8020596a:	02054b63          	bltz	a0,802059a0 <sys_getdents64+0x7a>
  printf("Running: OPENAT ... filefd: %d ... buf: 0x%x ... len: %d\n", fd, buf, len);
    8020596e:	fdc42683          	lw	a3,-36(s0)
    80205972:	fe043603          	ld	a2,-32(s0)
    80205976:	fd842583          	lw	a1,-40(s0)
    8020597a:	00004517          	auipc	a0,0x4
    8020597e:	3e650513          	addi	a0,a0,998 # 80209d60 <digits+0x9e0>
    80205982:	ffffb097          	auipc	ra,0xffffb
    80205986:	80c080e7          	jalr	-2036(ra) # 8020018e <printf>
  return dirnext_(f,buf,len);
    8020598a:	fdc42603          	lw	a2,-36(s0)
    8020598e:	fe043583          	ld	a1,-32(s0)
    80205992:	fe843503          	ld	a0,-24(s0)
    80205996:	ffffe097          	auipc	ra,0xffffe
    8020599a:	7d8080e7          	jalr	2008(ra) # 8020416e <dirnext_>
    8020599e:	87aa                	mv	a5,a0
}
    802059a0:	853e                	mv	a0,a5
    802059a2:	70a2                	ld	ra,40(sp)
    802059a4:	7402                	ld	s0,32(sp)
    802059a6:	6145                	addi	sp,sp,48
    802059a8:	8082                	ret
    802059aa:	0000                	unimp
    802059ac:	0000                	unimp
	...

00000000802059b0 <kernelvec>:
    802059b0:	7111                	addi	sp,sp,-256
    802059b2:	e006                	sd	ra,0(sp)
    802059b4:	e40a                	sd	sp,8(sp)
    802059b6:	e80e                	sd	gp,16(sp)
    802059b8:	ec12                	sd	tp,24(sp)
    802059ba:	f016                	sd	t0,32(sp)
    802059bc:	f41a                	sd	t1,40(sp)
    802059be:	f81e                	sd	t2,48(sp)
    802059c0:	fc22                	sd	s0,56(sp)
    802059c2:	e0a6                	sd	s1,64(sp)
    802059c4:	e4aa                	sd	a0,72(sp)
    802059c6:	e8ae                	sd	a1,80(sp)
    802059c8:	ecb2                	sd	a2,88(sp)
    802059ca:	f0b6                	sd	a3,96(sp)
    802059cc:	f4ba                	sd	a4,104(sp)
    802059ce:	f8be                	sd	a5,112(sp)
    802059d0:	fcc2                	sd	a6,120(sp)
    802059d2:	e146                	sd	a7,128(sp)
    802059d4:	e54a                	sd	s2,136(sp)
    802059d6:	e94e                	sd	s3,144(sp)
    802059d8:	ed52                	sd	s4,152(sp)
    802059da:	f156                	sd	s5,160(sp)
    802059dc:	f55a                	sd	s6,168(sp)
    802059de:	f95e                	sd	s7,176(sp)
    802059e0:	fd62                	sd	s8,184(sp)
    802059e2:	e1e6                	sd	s9,192(sp)
    802059e4:	e5ea                	sd	s10,200(sp)
    802059e6:	e9ee                	sd	s11,208(sp)
    802059e8:	edf2                	sd	t3,216(sp)
    802059ea:	f1f6                	sd	t4,224(sp)
    802059ec:	f5fa                	sd	t5,232(sp)
    802059ee:	f9fe                	sd	t6,240(sp)
    802059f0:	a46fd0ef          	jal	ra,80202c36 <kerneltrap>
    802059f4:	6082                	ld	ra,0(sp)
    802059f6:	6122                	ld	sp,8(sp)
    802059f8:	61c2                	ld	gp,16(sp)
    802059fa:	7282                	ld	t0,32(sp)
    802059fc:	7322                	ld	t1,40(sp)
    802059fe:	73c2                	ld	t2,48(sp)
    80205a00:	7462                	ld	s0,56(sp)
    80205a02:	6486                	ld	s1,64(sp)
    80205a04:	6526                	ld	a0,72(sp)
    80205a06:	65c6                	ld	a1,80(sp)
    80205a08:	6666                	ld	a2,88(sp)
    80205a0a:	7686                	ld	a3,96(sp)
    80205a0c:	7726                	ld	a4,104(sp)
    80205a0e:	77c6                	ld	a5,112(sp)
    80205a10:	7866                	ld	a6,120(sp)
    80205a12:	688a                	ld	a7,128(sp)
    80205a14:	692a                	ld	s2,136(sp)
    80205a16:	69ca                	ld	s3,144(sp)
    80205a18:	6a6a                	ld	s4,152(sp)
    80205a1a:	7a8a                	ld	s5,160(sp)
    80205a1c:	7b2a                	ld	s6,168(sp)
    80205a1e:	7bca                	ld	s7,176(sp)
    80205a20:	7c6a                	ld	s8,184(sp)
    80205a22:	6c8e                	ld	s9,192(sp)
    80205a24:	6d2e                	ld	s10,200(sp)
    80205a26:	6dce                	ld	s11,208(sp)
    80205a28:	6e6e                	ld	t3,216(sp)
    80205a2a:	7e8e                	ld	t4,224(sp)
    80205a2c:	7f2e                	ld	t5,232(sp)
    80205a2e:	7fce                	ld	t6,240(sp)
    80205a30:	6111                	addi	sp,sp,256
    80205a32:	10200073          	sret
	...

0000000080205a3e <timerinit>:
#include "include/proc.h"

struct spinlock tickslock;
uint ticks;

void timerinit() {
    80205a3e:	1141                	addi	sp,sp,-16
    80205a40:	e406                	sd	ra,8(sp)
    80205a42:	e022                	sd	s0,0(sp)
    80205a44:	0800                	addi	s0,sp,16
    initlock(&tickslock, "time");
    80205a46:	00004597          	auipc	a1,0x4
    80205a4a:	35a58593          	addi	a1,a1,858 # 80209da0 <digits+0xa20>
    80205a4e:	0001a517          	auipc	a0,0x1a
    80205a52:	9ba50513          	addi	a0,a0,-1606 # 8021f408 <tickslock>
    80205a56:	ffffb097          	auipc	ra,0xffffb
    80205a5a:	c2c080e7          	jalr	-980(ra) # 80200682 <initlock>
    #ifdef DEBUG
    printf("timerinit\n");
    #endif
}
    80205a5e:	60a2                	ld	ra,8(sp)
    80205a60:	6402                	ld	s0,0(sp)
    80205a62:	0141                	addi	sp,sp,16
    80205a64:	8082                	ret

0000000080205a66 <set_next_timeout>:

void
set_next_timeout() {
    80205a66:	1141                	addi	sp,sp,-16
    80205a68:	e422                	sd	s0,8(sp)
    80205a6a:	0800                	addi	s0,sp,16
  asm volatile("rdtime %0" : "=r" (x) );
    80205a6c:	c0102573          	rdtime	a0
    // if comment the `printf` line below
    // the timer will not work.

    // this bug seems to disappear automatically
    // printf("");
    sbi_set_timer(r_time() + INTERVAL);
    80205a70:	001dc7b7          	lui	a5,0x1dc
    80205a74:	13078793          	addi	a5,a5,304 # 1dc130 <_entry-0x80023ed0>
    80205a78:	953e                	add	a0,a0,a5
	SBI_CALL_1(SBI_SET_TIMER, stime_value);
    80205a7a:	4581                	li	a1,0
    80205a7c:	4601                	li	a2,0
    80205a7e:	4681                	li	a3,0
    80205a80:	4881                	li	a7,0
    80205a82:	00000073          	ecall
}
    80205a86:	6422                	ld	s0,8(sp)
    80205a88:	0141                	addi	sp,sp,16
    80205a8a:	8082                	ret

0000000080205a8c <timer_tick>:

void timer_tick() {
    80205a8c:	1101                	addi	sp,sp,-32
    80205a8e:	ec06                	sd	ra,24(sp)
    80205a90:	e822                	sd	s0,16(sp)
    80205a92:	e426                	sd	s1,8(sp)
    80205a94:	1000                	addi	s0,sp,32
    acquire(&tickslock);
    80205a96:	0001a497          	auipc	s1,0x1a
    80205a9a:	97248493          	addi	s1,s1,-1678 # 8021f408 <tickslock>
    80205a9e:	8526                	mv	a0,s1
    80205aa0:	ffffb097          	auipc	ra,0xffffb
    80205aa4:	c26080e7          	jalr	-986(ra) # 802006c6 <acquire>
    ticks++;
    80205aa8:	4c9c                	lw	a5,24(s1)
    80205aaa:	2785                	addiw	a5,a5,1
    80205aac:	cc9c                	sw	a5,24(s1)
    wakeup(&ticks);
    80205aae:	0001a517          	auipc	a0,0x1a
    80205ab2:	97250513          	addi	a0,a0,-1678 # 8021f420 <ticks>
    80205ab6:	ffffd097          	auipc	ra,0xffffd
    80205aba:	9f8080e7          	jalr	-1544(ra) # 802024ae <wakeup>
    release(&tickslock);
    80205abe:	8526                	mv	a0,s1
    80205ac0:	ffffb097          	auipc	ra,0xffffb
    80205ac4:	c5a080e7          	jalr	-934(ra) # 8020071a <release>
    set_next_timeout();
    80205ac8:	00000097          	auipc	ra,0x0
    80205acc:	f9e080e7          	jalr	-98(ra) # 80205a66 <set_next_timeout>
}
    80205ad0:	60e2                	ld	ra,24(sp)
    80205ad2:	6442                	ld	s0,16(sp)
    80205ad4:	64a2                	ld	s1,8(sp)
    80205ad6:	6105                	addi	sp,sp,32
    80205ad8:	8082                	ret

0000000080205ada <disk_init>:
#else
#include "include/virtio.h"
#endif 

void disk_init(void)
{
    80205ada:	1141                	addi	sp,sp,-16
    80205adc:	e406                	sd	ra,8(sp)
    80205ade:	e022                	sd	s0,0(sp)
    80205ae0:	0800                	addi	s0,sp,16
    #ifdef QEMU
    virtio_disk_init();
    80205ae2:	00002097          	auipc	ra,0x2
    80205ae6:	f5a080e7          	jalr	-166(ra) # 80207a3c <virtio_disk_init>
	#else 
	sdcard_init();
    #endif
}
    80205aea:	60a2                	ld	ra,8(sp)
    80205aec:	6402                	ld	s0,0(sp)
    80205aee:	0141                	addi	sp,sp,16
    80205af0:	8082                	ret

0000000080205af2 <disk_read>:

void disk_read(struct buf *b)
{
    80205af2:	1141                	addi	sp,sp,-16
    80205af4:	e406                	sd	ra,8(sp)
    80205af6:	e022                	sd	s0,0(sp)
    80205af8:	0800                	addi	s0,sp,16
    #ifdef QEMU
	virtio_disk_rw(b, 0);
    80205afa:	4581                	li	a1,0
    80205afc:	00002097          	auipc	ra,0x2
    80205b00:	0c6080e7          	jalr	198(ra) # 80207bc2 <virtio_disk_rw>
    #else 
	sdcard_read_sector(b->data, b->sectorno);
	#endif
}
    80205b04:	60a2                	ld	ra,8(sp)
    80205b06:	6402                	ld	s0,0(sp)
    80205b08:	0141                	addi	sp,sp,16
    80205b0a:	8082                	ret

0000000080205b0c <disk_write>:

void disk_write(struct buf *b)
{
    80205b0c:	1141                	addi	sp,sp,-16
    80205b0e:	e406                	sd	ra,8(sp)
    80205b10:	e022                	sd	s0,0(sp)
    80205b12:	0800                	addi	s0,sp,16
    #ifdef QEMU
	virtio_disk_rw(b, 1);
    80205b14:	4585                	li	a1,1
    80205b16:	00002097          	auipc	ra,0x2
    80205b1a:	0ac080e7          	jalr	172(ra) # 80207bc2 <virtio_disk_rw>
    #else 
	sdcard_write_sector(b->data, b->sectorno);
	#endif
}
    80205b1e:	60a2                	ld	ra,8(sp)
    80205b20:	6402                	ld	s0,0(sp)
    80205b22:	0141                	addi	sp,sp,16
    80205b24:	8082                	ret

0000000080205b26 <disk_intr>:

void disk_intr(void)
{
    80205b26:	1141                	addi	sp,sp,-16
    80205b28:	e406                	sd	ra,8(sp)
    80205b2a:	e022                	sd	s0,0(sp)
    80205b2c:	0800                	addi	s0,sp,16
    #ifdef QEMU
    virtio_disk_intr();
    80205b2e:	00002097          	auipc	ra,0x2
    80205b32:	320080e7          	jalr	800(ra) # 80207e4e <virtio_disk_intr>
    #else 
    dmac_intr(DMAC_CHANNEL0);
    #endif
}
    80205b36:	60a2                	ld	ra,8(sp)
    80205b38:	6402                	ld	s0,0(sp)
    80205b3a:	0141                	addi	sp,sp,16
    80205b3c:	8082                	ret

0000000080205b3e <skipelem>:
    eput(ep);
    return NULL;
}

static char *skipelem(char *path, char *name)
{
    80205b3e:	1101                	addi	sp,sp,-32
    80205b40:	ec06                	sd	ra,24(sp)
    80205b42:	e822                	sd	s0,16(sp)
    80205b44:	e426                	sd	s1,8(sp)
    80205b46:	1000                	addi	s0,sp,32
    80205b48:	87aa                	mv	a5,a0
    80205b4a:	852e                	mv	a0,a1
    while (*path == '/') {
    80205b4c:	0007c703          	lbu	a4,0(a5)
    80205b50:	02f00693          	li	a3,47
    80205b54:	00d71763          	bne	a4,a3,80205b62 <skipelem+0x24>
        path++;
    80205b58:	0785                	addi	a5,a5,1
    while (*path == '/') {
    80205b5a:	0007c703          	lbu	a4,0(a5)
    80205b5e:	fed70de3          	beq	a4,a3,80205b58 <skipelem+0x1a>
    }
    if (*path == 0) { return NULL; }
    80205b62:	4481                	li	s1,0
    80205b64:	cf31                	beqz	a4,80205bc0 <skipelem+0x82>
    char *s = path;
    while (*path != '/' && *path != 0) {
    80205b66:	0007c703          	lbu	a4,0(a5)
    80205b6a:	84be                	mv	s1,a5
    80205b6c:	02f00693          	li	a3,47
    80205b70:	c711                	beqz	a4,80205b7c <skipelem+0x3e>
        path++;
    80205b72:	0485                	addi	s1,s1,1
    while (*path != '/' && *path != 0) {
    80205b74:	0004c703          	lbu	a4,0(s1)
    80205b78:	fed71ce3          	bne	a4,a3,80205b70 <skipelem+0x32>
    }
    int len = path - s;
    80205b7c:	40f48733          	sub	a4,s1,a5
    80205b80:	863a                	mv	a2,a4
    80205b82:	2701                	sext.w	a4,a4
    80205b84:	0ff00693          	li	a3,255
    80205b88:	00e6d463          	bge	a3,a4,80205b90 <skipelem+0x52>
    80205b8c:	0ff00613          	li	a2,255
    80205b90:	0006071b          	sext.w	a4,a2
    if (len > FAT32_MAX_FILENAME) {
        len = FAT32_MAX_FILENAME;
    }
    name[len] = 0;
    80205b94:	972a                	add	a4,a4,a0
    80205b96:	00070023          	sb	zero,0(a4)
    memmove(name, s, len);
    80205b9a:	2601                	sext.w	a2,a2
    80205b9c:	85be                	mv	a1,a5
    80205b9e:	ffffb097          	auipc	ra,0xffffb
    80205ba2:	c20080e7          	jalr	-992(ra) # 802007be <memmove>
    while (*path == '/') {
    80205ba6:	0004c703          	lbu	a4,0(s1)
    80205baa:	02f00793          	li	a5,47
    80205bae:	00f71963          	bne	a4,a5,80205bc0 <skipelem+0x82>
    80205bb2:	02f00713          	li	a4,47
        path++;
    80205bb6:	0485                	addi	s1,s1,1
    while (*path == '/') {
    80205bb8:	0004c783          	lbu	a5,0(s1)
    80205bbc:	fee78de3          	beq	a5,a4,80205bb6 <skipelem+0x78>
    }
    return path;
}
    80205bc0:	8526                	mv	a0,s1
    80205bc2:	60e2                	ld	ra,24(sp)
    80205bc4:	6442                	ld	s0,16(sp)
    80205bc6:	64a2                	ld	s1,8(sp)
    80205bc8:	6105                	addi	sp,sp,32
    80205bca:	8082                	ret

0000000080205bcc <read_fat>:
{
    80205bcc:	1101                	addi	sp,sp,-32
    80205bce:	ec06                	sd	ra,24(sp)
    80205bd0:	e822                	sd	s0,16(sp)
    80205bd2:	e426                	sd	s1,8(sp)
    80205bd4:	e04a                	sd	s2,0(sp)
    80205bd6:	1000                	addi	s0,sp,32
    if (cluster >= FAT32_EOC) {
    80205bd8:	100007b7          	lui	a5,0x10000
    80205bdc:	17dd                	addi	a5,a5,-9 # ffffff7 <_entry-0x70200009>
        return cluster;
    80205bde:	84aa                	mv	s1,a0
    if (cluster >= FAT32_EOC) {
    80205be0:	00a7ea63          	bltu	a5,a0,80205bf4 <read_fat+0x28>
    if (cluster > fat.data_clus_cnt + 1) {     // because cluster number starts at 2, not 0
    80205be4:	0001a797          	auipc	a5,0x1a
    80205be8:	84c7a783          	lw	a5,-1972(a5) # 8021f430 <fat+0x8>
    80205bec:	2785                	addiw	a5,a5,1
        return 0;
    80205bee:	4481                	li	s1,0
    if (cluster > fat.data_clus_cnt + 1) {     // because cluster number starts at 2, not 0
    80205bf0:	00a7f963          	bgeu	a5,a0,80205c02 <read_fat+0x36>
}
    80205bf4:	8526                	mv	a0,s1
    80205bf6:	60e2                	ld	ra,24(sp)
    80205bf8:	6442                	ld	s0,16(sp)
    80205bfa:	64a2                	ld	s1,8(sp)
    80205bfc:	6902                	ld	s2,0(sp)
    80205bfe:	6105                	addi	sp,sp,32
    80205c00:	8082                	ret
    return fat.bpb.rsvd_sec_cnt + (cluster << 2) / fat.bpb.byts_per_sec + fat.bpb.fat_sz * (fat_num - 1);
    80205c02:	0025149b          	slliw	s1,a0,0x2
    80205c06:	0001a917          	auipc	s2,0x1a
    80205c0a:	82290913          	addi	s2,s2,-2014 # 8021f428 <fat>
    80205c0e:	01095783          	lhu	a5,16(s2)
    80205c12:	02f4d7bb          	divuw	a5,s1,a5
    80205c16:	01495583          	lhu	a1,20(s2)
    struct buf *b = bread(0, fat_sec);
    80205c1a:	9dbd                	addw	a1,a1,a5
    80205c1c:	4501                	li	a0,0
    80205c1e:	ffffe097          	auipc	ra,0xffffe
    80205c22:	d5e080e7          	jalr	-674(ra) # 8020397c <bread>
    return (cluster << 2) % fat.bpb.byts_per_sec;
    80205c26:	01095783          	lhu	a5,16(s2)
    80205c2a:	02f4f4bb          	remuw	s1,s1,a5
    uint32 next_clus = *(uint32 *)(b->data + fat_offset_of_clus(cluster));
    80205c2e:	1482                	slli	s1,s1,0x20
    80205c30:	9081                	srli	s1,s1,0x20
    80205c32:	009507b3          	add	a5,a0,s1
    80205c36:	4fa4                	lw	s1,88(a5)
    brelse(b);
    80205c38:	ffffe097          	auipc	ra,0xffffe
    80205c3c:	e70080e7          	jalr	-400(ra) # 80203aa8 <brelse>
    return next_clus;
    80205c40:	bf55                	j	80205bf4 <read_fat+0x28>

0000000080205c42 <alloc_clus>:
{
    80205c42:	711d                	addi	sp,sp,-96
    80205c44:	ec86                	sd	ra,88(sp)
    80205c46:	e8a2                	sd	s0,80(sp)
    80205c48:	e4a6                	sd	s1,72(sp)
    80205c4a:	e0ca                	sd	s2,64(sp)
    80205c4c:	fc4e                	sd	s3,56(sp)
    80205c4e:	f852                	sd	s4,48(sp)
    80205c50:	f456                	sd	s5,40(sp)
    80205c52:	f05a                	sd	s6,32(sp)
    80205c54:	ec5e                	sd	s7,24(sp)
    80205c56:	e862                	sd	s8,16(sp)
    80205c58:	e466                	sd	s9,8(sp)
    80205c5a:	1080                	addi	s0,sp,96
    uint32 sec = fat.bpb.rsvd_sec_cnt;
    80205c5c:	00019797          	auipc	a5,0x19
    80205c60:	7cc78793          	addi	a5,a5,1996 # 8021f428 <fat>
    80205c64:	0147db83          	lhu	s7,20(a5)
    uint32 const ent_per_sec = fat.bpb.byts_per_sec / sizeof(uint32);
    80205c68:	0107d903          	lhu	s2,16(a5)
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    80205c6c:	539c                	lw	a5,32(a5)
    80205c6e:	10078363          	beqz	a5,80205d74 <alloc_clus+0x132>
    80205c72:	0029591b          	srliw	s2,s2,0x2
    80205c76:	0009099b          	sext.w	s3,s2
    80205c7a:	4b01                	li	s6,0
        b = bread(dev, sec);
    80205c7c:	00050a9b          	sext.w	s5,a0
        for (uint32 j = 0; j < ent_per_sec; j++) {
    80205c80:	4c01                	li	s8,0
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    80205c82:	00019c97          	auipc	s9,0x19
    80205c86:	7a6c8c93          	addi	s9,s9,1958 # 8021f428 <fat>
    80205c8a:	a0c9                	j	80205d4c <alloc_clus+0x10a>
                ((uint32 *)(b->data))[j] = FAT32_EOC + 7;
    80205c8c:	100007b7          	lui	a5,0x10000
    80205c90:	17fd                	addi	a5,a5,-1 # fffffff <_entry-0x70200001>
    80205c92:	c29c                	sw	a5,0(a3)
                bwrite(b);
    80205c94:	8552                	mv	a0,s4
    80205c96:	ffffe097          	auipc	ra,0xffffe
    80205c9a:	dd6080e7          	jalr	-554(ra) # 80203a6c <bwrite>
                brelse(b);
    80205c9e:	8552                	mv	a0,s4
    80205ca0:	ffffe097          	auipc	ra,0xffffe
    80205ca4:	e08080e7          	jalr	-504(ra) # 80203aa8 <brelse>
                uint32 clus = i * ent_per_sec + j;
    80205ca8:	0369093b          	mulw	s2,s2,s6
    80205cac:	0099093b          	addw	s2,s2,s1
    80205cb0:	00090a9b          	sext.w	s5,s2
    return ((cluster - 2) * fat.bpb.sec_per_clus) + fat.first_data_sec;
    80205cb4:	00019717          	auipc	a4,0x19
    80205cb8:	77470713          	addi	a4,a4,1908 # 8021f428 <fat>
    80205cbc:	01274783          	lbu	a5,18(a4)
    80205cc0:	ffe9099b          	addiw	s3,s2,-2
    80205cc4:	02f989bb          	mulw	s3,s3,a5
    80205cc8:	4318                	lw	a4,0(a4)
    80205cca:	00e989bb          	addw	s3,s3,a4
    for (int i = 0; i < fat.bpb.sec_per_clus; i++) {
    80205cce:	c7b1                	beqz	a5,80205d1a <alloc_clus+0xd8>
    80205cd0:	4901                	li	s2,0
    80205cd2:	00019a17          	auipc	s4,0x19
    80205cd6:	756a0a13          	addi	s4,s4,1878 # 8021f428 <fat>
        b = bread(0, sec++);
    80205cda:	013905bb          	addw	a1,s2,s3
    80205cde:	4501                	li	a0,0
    80205ce0:	ffffe097          	auipc	ra,0xffffe
    80205ce4:	c9c080e7          	jalr	-868(ra) # 8020397c <bread>
    80205ce8:	84aa                	mv	s1,a0
        memset(b->data, 0, BSIZE);
    80205cea:	20000613          	li	a2,512
    80205cee:	4581                	li	a1,0
    80205cf0:	05850513          	addi	a0,a0,88
    80205cf4:	ffffb097          	auipc	ra,0xffffb
    80205cf8:	a6e080e7          	jalr	-1426(ra) # 80200762 <memset>
        bwrite(b);
    80205cfc:	8526                	mv	a0,s1
    80205cfe:	ffffe097          	auipc	ra,0xffffe
    80205d02:	d6e080e7          	jalr	-658(ra) # 80203a6c <bwrite>
        brelse(b);
    80205d06:	8526                	mv	a0,s1
    80205d08:	ffffe097          	auipc	ra,0xffffe
    80205d0c:	da0080e7          	jalr	-608(ra) # 80203aa8 <brelse>
    for (int i = 0; i < fat.bpb.sec_per_clus; i++) {
    80205d10:	2905                	addiw	s2,s2,1
    80205d12:	012a4783          	lbu	a5,18(s4)
    80205d16:	fcf942e3          	blt	s2,a5,80205cda <alloc_clus+0x98>
}
    80205d1a:	8556                	mv	a0,s5
    80205d1c:	60e6                	ld	ra,88(sp)
    80205d1e:	6446                	ld	s0,80(sp)
    80205d20:	64a6                	ld	s1,72(sp)
    80205d22:	6906                	ld	s2,64(sp)
    80205d24:	79e2                	ld	s3,56(sp)
    80205d26:	7a42                	ld	s4,48(sp)
    80205d28:	7aa2                	ld	s5,40(sp)
    80205d2a:	7b02                	ld	s6,32(sp)
    80205d2c:	6be2                	ld	s7,24(sp)
    80205d2e:	6c42                	ld	s8,16(sp)
    80205d30:	6ca2                	ld	s9,8(sp)
    80205d32:	6125                	addi	sp,sp,96
    80205d34:	8082                	ret
        brelse(b);
    80205d36:	8552                	mv	a0,s4
    80205d38:	ffffe097          	auipc	ra,0xffffe
    80205d3c:	d70080e7          	jalr	-656(ra) # 80203aa8 <brelse>
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    80205d40:	2b05                	addiw	s6,s6,1
    80205d42:	2b85                	addiw	s7,s7,1 # fffffffffffff001 <ebss_clear+0xffffffff7fdd8001>
    80205d44:	020ca783          	lw	a5,32(s9)
    80205d48:	02fb7663          	bgeu	s6,a5,80205d74 <alloc_clus+0x132>
        b = bread(dev, sec);
    80205d4c:	85de                	mv	a1,s7
    80205d4e:	8556                	mv	a0,s5
    80205d50:	ffffe097          	auipc	ra,0xffffe
    80205d54:	c2c080e7          	jalr	-980(ra) # 8020397c <bread>
    80205d58:	8a2a                	mv	s4,a0
        for (uint32 j = 0; j < ent_per_sec; j++) {
    80205d5a:	fc098ee3          	beqz	s3,80205d36 <alloc_clus+0xf4>
    80205d5e:	05850793          	addi	a5,a0,88
    80205d62:	84e2                	mv	s1,s8
            if (((uint32 *)(b->data))[j] == 0) {
    80205d64:	86be                	mv	a3,a5
    80205d66:	4398                	lw	a4,0(a5)
    80205d68:	d315                	beqz	a4,80205c8c <alloc_clus+0x4a>
        for (uint32 j = 0; j < ent_per_sec; j++) {
    80205d6a:	2485                	addiw	s1,s1,1
    80205d6c:	0791                	addi	a5,a5,4
    80205d6e:	fe999be3          	bne	s3,s1,80205d64 <alloc_clus+0x122>
    80205d72:	b7d1                	j	80205d36 <alloc_clus+0xf4>
    panic("no clusters");
    80205d74:	00004517          	auipc	a0,0x4
    80205d78:	03450513          	addi	a0,a0,52 # 80209da8 <digits+0xa28>
    80205d7c:	ffffa097          	auipc	ra,0xffffa
    80205d80:	3c8080e7          	jalr	968(ra) # 80200144 <panic>

0000000080205d84 <write_fat>:
    if (cluster > fat.data_clus_cnt + 1) {
    80205d84:	00019797          	auipc	a5,0x19
    80205d88:	6ac7a783          	lw	a5,1708(a5) # 8021f430 <fat+0x8>
    80205d8c:	2785                	addiw	a5,a5,1
    80205d8e:	06a7e963          	bltu	a5,a0,80205e00 <write_fat+0x7c>
{
    80205d92:	7179                	addi	sp,sp,-48
    80205d94:	f406                	sd	ra,40(sp)
    80205d96:	f022                	sd	s0,32(sp)
    80205d98:	ec26                	sd	s1,24(sp)
    80205d9a:	e84a                	sd	s2,16(sp)
    80205d9c:	e44e                	sd	s3,8(sp)
    80205d9e:	e052                	sd	s4,0(sp)
    80205da0:	1800                	addi	s0,sp,48
    80205da2:	89ae                	mv	s3,a1
    return fat.bpb.rsvd_sec_cnt + (cluster << 2) / fat.bpb.byts_per_sec + fat.bpb.fat_sz * (fat_num - 1);
    80205da4:	0025149b          	slliw	s1,a0,0x2
    80205da8:	00019a17          	auipc	s4,0x19
    80205dac:	680a0a13          	addi	s4,s4,1664 # 8021f428 <fat>
    80205db0:	010a5783          	lhu	a5,16(s4)
    80205db4:	02f4d7bb          	divuw	a5,s1,a5
    80205db8:	014a5583          	lhu	a1,20(s4)
    struct buf *b = bread(0, fat_sec);
    80205dbc:	9dbd                	addw	a1,a1,a5
    80205dbe:	4501                	li	a0,0
    80205dc0:	ffffe097          	auipc	ra,0xffffe
    80205dc4:	bbc080e7          	jalr	-1092(ra) # 8020397c <bread>
    80205dc8:	892a                	mv	s2,a0
    return (cluster << 2) % fat.bpb.byts_per_sec;
    80205dca:	010a5783          	lhu	a5,16(s4)
    80205dce:	02f4f4bb          	remuw	s1,s1,a5
    *(uint32 *)(b->data + off) = content;
    80205dd2:	1482                	slli	s1,s1,0x20
    80205dd4:	9081                	srli	s1,s1,0x20
    80205dd6:	94aa                	add	s1,s1,a0
    80205dd8:	0534ac23          	sw	s3,88(s1)
    bwrite(b);
    80205ddc:	ffffe097          	auipc	ra,0xffffe
    80205de0:	c90080e7          	jalr	-880(ra) # 80203a6c <bwrite>
    brelse(b);
    80205de4:	854a                	mv	a0,s2
    80205de6:	ffffe097          	auipc	ra,0xffffe
    80205dea:	cc2080e7          	jalr	-830(ra) # 80203aa8 <brelse>
    return 0;
    80205dee:	4501                	li	a0,0
}
    80205df0:	70a2                	ld	ra,40(sp)
    80205df2:	7402                	ld	s0,32(sp)
    80205df4:	64e2                	ld	s1,24(sp)
    80205df6:	6942                	ld	s2,16(sp)
    80205df8:	69a2                	ld	s3,8(sp)
    80205dfa:	6a02                	ld	s4,0(sp)
    80205dfc:	6145                	addi	sp,sp,48
    80205dfe:	8082                	ret
        return -1;
    80205e00:	557d                	li	a0,-1
}
    80205e02:	8082                	ret

0000000080205e04 <reloc_clus>:
{
    80205e04:	715d                	addi	sp,sp,-80
    80205e06:	e486                	sd	ra,72(sp)
    80205e08:	e0a2                	sd	s0,64(sp)
    80205e0a:	fc26                	sd	s1,56(sp)
    80205e0c:	f84a                	sd	s2,48(sp)
    80205e0e:	f44e                	sd	s3,40(sp)
    80205e10:	f052                	sd	s4,32(sp)
    80205e12:	ec56                	sd	s5,24(sp)
    80205e14:	e85a                	sd	s6,16(sp)
    80205e16:	e45e                	sd	s7,8(sp)
    80205e18:	0880                	addi	s0,sp,80
    80205e1a:	84aa                	mv	s1,a0
    80205e1c:	8a2e                	mv	s4,a1
    int clus_num = off / fat.byts_per_clus;
    80205e1e:	00019b97          	auipc	s7,0x19
    80205e22:	616bab83          	lw	s7,1558(s7) # 8021f434 <fat+0xc>
    80205e26:	0375d9bb          	divuw	s3,a1,s7
    while (clus_num > entry->clus_cnt) {
    80205e2a:	11052703          	lw	a4,272(a0)
    80205e2e:	07377563          	bgeu	a4,s3,80205e98 <reloc_clus+0x94>
    80205e32:	8b32                	mv	s6,a2
        if (clus >= FAT32_EOC) {
    80205e34:	10000ab7          	lui	s5,0x10000
    80205e38:	1add                	addi	s5,s5,-9 # ffffff7 <_entry-0x70200009>
    80205e3a:	a81d                	j	80205e70 <reloc_clus+0x6c>
                clus = alloc_clus(entry->dev);
    80205e3c:	1144c503          	lbu	a0,276(s1)
    80205e40:	00000097          	auipc	ra,0x0
    80205e44:	e02080e7          	jalr	-510(ra) # 80205c42 <alloc_clus>
    80205e48:	0005091b          	sext.w	s2,a0
                write_fat(entry->cur_clus, clus);
    80205e4c:	85ca                	mv	a1,s2
    80205e4e:	10c4a503          	lw	a0,268(s1)
    80205e52:	00000097          	auipc	ra,0x0
    80205e56:	f32080e7          	jalr	-206(ra) # 80205d84 <write_fat>
        entry->cur_clus = clus;
    80205e5a:	1124a623          	sw	s2,268(s1)
        entry->clus_cnt++;
    80205e5e:	1104a783          	lw	a5,272(s1)
    80205e62:	2785                	addiw	a5,a5,1
    80205e64:	0007871b          	sext.w	a4,a5
    80205e68:	10f4a823          	sw	a5,272(s1)
    while (clus_num > entry->clus_cnt) {
    80205e6c:	03377663          	bgeu	a4,s3,80205e98 <reloc_clus+0x94>
        int clus = read_fat(entry->cur_clus);
    80205e70:	10c4a503          	lw	a0,268(s1)
    80205e74:	00000097          	auipc	ra,0x0
    80205e78:	d58080e7          	jalr	-680(ra) # 80205bcc <read_fat>
    80205e7c:	0005091b          	sext.w	s2,a0
        if (clus >= FAT32_EOC) {
    80205e80:	fd2adde3          	bge	s5,s2,80205e5a <reloc_clus+0x56>
            if (alloc) {
    80205e84:	fa0b1ce3          	bnez	s6,80205e3c <reloc_clus+0x38>
                entry->cur_clus = entry->first_clus;
    80205e88:	1044a783          	lw	a5,260(s1)
    80205e8c:	10f4a623          	sw	a5,268(s1)
                entry->clus_cnt = 0;
    80205e90:	1004a823          	sw	zero,272(s1)
                return -1;
    80205e94:	557d                	li	a0,-1
    80205e96:	a881                	j	80205ee6 <reloc_clus+0xe2>
    if (clus_num < entry->clus_cnt) {
    80205e98:	04e9f163          	bgeu	s3,a4,80205eda <reloc_clus+0xd6>
        entry->cur_clus = entry->first_clus;
    80205e9c:	1044a783          	lw	a5,260(s1)
    80205ea0:	10f4a623          	sw	a5,268(s1)
        entry->clus_cnt = 0;
    80205ea4:	1004a823          	sw	zero,272(s1)
        while (entry->clus_cnt < clus_num) {
    80205ea8:	037a6963          	bltu	s4,s7,80205eda <reloc_clus+0xd6>
            if (entry->cur_clus >= FAT32_EOC) {
    80205eac:	10000937          	lui	s2,0x10000
    80205eb0:	195d                	addi	s2,s2,-9 # ffffff7 <_entry-0x70200009>
            entry->cur_clus = read_fat(entry->cur_clus);
    80205eb2:	10c4a503          	lw	a0,268(s1)
    80205eb6:	00000097          	auipc	ra,0x0
    80205eba:	d16080e7          	jalr	-746(ra) # 80205bcc <read_fat>
    80205ebe:	2501                	sext.w	a0,a0
    80205ec0:	10a4a623          	sw	a0,268(s1)
            if (entry->cur_clus >= FAT32_EOC) {
    80205ec4:	02a96c63          	bltu	s2,a0,80205efc <reloc_clus+0xf8>
            entry->clus_cnt++;
    80205ec8:	1104a783          	lw	a5,272(s1)
    80205ecc:	2785                	addiw	a5,a5,1
    80205ece:	0007871b          	sext.w	a4,a5
    80205ed2:	10f4a823          	sw	a5,272(s1)
        while (entry->clus_cnt < clus_num) {
    80205ed6:	fd376ee3          	bltu	a4,s3,80205eb2 <reloc_clus+0xae>
    return off % fat.byts_per_clus;
    80205eda:	00019797          	auipc	a5,0x19
    80205ede:	55a7a783          	lw	a5,1370(a5) # 8021f434 <fat+0xc>
    80205ee2:	02fa753b          	remuw	a0,s4,a5
}
    80205ee6:	60a6                	ld	ra,72(sp)
    80205ee8:	6406                	ld	s0,64(sp)
    80205eea:	74e2                	ld	s1,56(sp)
    80205eec:	7942                	ld	s2,48(sp)
    80205eee:	79a2                	ld	s3,40(sp)
    80205ef0:	7a02                	ld	s4,32(sp)
    80205ef2:	6ae2                	ld	s5,24(sp)
    80205ef4:	6b42                	ld	s6,16(sp)
    80205ef6:	6ba2                	ld	s7,8(sp)
    80205ef8:	6161                	addi	sp,sp,80
    80205efa:	8082                	ret
                panic("reloc_clus");
    80205efc:	00004517          	auipc	a0,0x4
    80205f00:	ebc50513          	addi	a0,a0,-324 # 80209db8 <digits+0xa38>
    80205f04:	ffffa097          	auipc	ra,0xffffa
    80205f08:	240080e7          	jalr	576(ra) # 80200144 <panic>

0000000080205f0c <rw_clus>:
{
    80205f0c:	7119                	addi	sp,sp,-128
    80205f0e:	fc86                	sd	ra,120(sp)
    80205f10:	f8a2                	sd	s0,112(sp)
    80205f12:	f4a6                	sd	s1,104(sp)
    80205f14:	f0ca                	sd	s2,96(sp)
    80205f16:	ecce                	sd	s3,88(sp)
    80205f18:	e8d2                	sd	s4,80(sp)
    80205f1a:	e4d6                	sd	s5,72(sp)
    80205f1c:	e0da                	sd	s6,64(sp)
    80205f1e:	fc5e                	sd	s7,56(sp)
    80205f20:	f862                	sd	s8,48(sp)
    80205f22:	f466                	sd	s9,40(sp)
    80205f24:	f06a                	sd	s10,32(sp)
    80205f26:	ec6e                	sd	s11,24(sp)
    80205f28:	0100                	addi	s0,sp,128
    80205f2a:	f8c43423          	sd	a2,-120(s0)
    80205f2e:	8b36                	mv	s6,a3
    80205f30:	8c3e                	mv	s8,a5
    if (off + n > fat.byts_per_clus)
    80205f32:	00f706bb          	addw	a3,a4,a5
    80205f36:	00019797          	auipc	a5,0x19
    80205f3a:	4fe7a783          	lw	a5,1278(a5) # 8021f434 <fat+0xc>
    80205f3e:	02d7ef63          	bltu	a5,a3,80205f7c <rw_clus+0x70>
    80205f42:	8cae                	mv	s9,a1
    uint sec = first_sec_of_clus(cluster) + off / fat.bpb.byts_per_sec;
    80205f44:	00019797          	auipc	a5,0x19
    80205f48:	4e478793          	addi	a5,a5,1252 # 8021f428 <fat>
    80205f4c:	0107d683          	lhu	a3,16(a5)
    return ((cluster - 2) * fat.bpb.sec_per_clus) + fat.first_data_sec;
    80205f50:	ffe5099b          	addiw	s3,a0,-2
    80205f54:	0127c603          	lbu	a2,18(a5)
    80205f58:	02c989bb          	mulw	s3,s3,a2
    80205f5c:	439c                	lw	a5,0(a5)
    80205f5e:	00f989bb          	addw	s3,s3,a5
    uint sec = first_sec_of_clus(cluster) + off / fat.bpb.byts_per_sec;
    80205f62:	02d757bb          	divuw	a5,a4,a3
    80205f66:	00f989bb          	addw	s3,s3,a5
    off = off % fat.bpb.byts_per_sec;
    80205f6a:	02d77abb          	remuw	s5,a4,a3
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    80205f6e:	0e0c0363          	beqz	s8,80206054 <rw_clus+0x148>
    80205f72:	4a01                	li	s4,0
        m = BSIZE - off % BSIZE;
    80205f74:	20000d93          	li	s11,512
        if (bad == -1) {
    80205f78:	5d7d                	li	s10,-1
    80205f7a:	a095                	j	80205fde <rw_clus+0xd2>
        panic("offset out of range");
    80205f7c:	00004517          	auipc	a0,0x4
    80205f80:	e4c50513          	addi	a0,a0,-436 # 80209dc8 <digits+0xa48>
    80205f84:	ffffa097          	auipc	ra,0xffffa
    80205f88:	1c0080e7          	jalr	448(ra) # 80200144 <panic>
                bwrite(bp);
    80205f8c:	854a                	mv	a0,s2
    80205f8e:	ffffe097          	auipc	ra,0xffffe
    80205f92:	ade080e7          	jalr	-1314(ra) # 80203a6c <bwrite>
        brelse(bp);
    80205f96:	854a                	mv	a0,s2
    80205f98:	ffffe097          	auipc	ra,0xffffe
    80205f9c:	b10080e7          	jalr	-1264(ra) # 80203aa8 <brelse>
        if (bad == -1) {
    80205fa0:	a02d                	j	80205fca <rw_clus+0xbe>
            bad = either_copyout(user, data, bp->data + (off % BSIZE), m);
    80205fa2:	05890613          	addi	a2,s2,88
    80205fa6:	1682                	slli	a3,a3,0x20
    80205fa8:	9281                	srli	a3,a3,0x20
    80205faa:	963a                	add	a2,a2,a4
    80205fac:	85da                	mv	a1,s6
    80205fae:	f8843503          	ld	a0,-120(s0)
    80205fb2:	ffffc097          	auipc	ra,0xffffc
    80205fb6:	5d6080e7          	jalr	1494(ra) # 80202588 <either_copyout>
    80205fba:	8baa                	mv	s7,a0
        brelse(bp);
    80205fbc:	854a                	mv	a0,s2
    80205fbe:	ffffe097          	auipc	ra,0xffffe
    80205fc2:	aea080e7          	jalr	-1302(ra) # 80203aa8 <brelse>
        if (bad == -1) {
    80205fc6:	07ab8763          	beq	s7,s10,80206034 <rw_clus+0x128>
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    80205fca:	01448a3b          	addw	s4,s1,s4
    80205fce:	01548abb          	addw	s5,s1,s5
    80205fd2:	1482                	slli	s1,s1,0x20
    80205fd4:	9081                	srli	s1,s1,0x20
    80205fd6:	9b26                	add	s6,s6,s1
    80205fd8:	2985                	addiw	s3,s3,1
    80205fda:	058a7d63          	bgeu	s4,s8,80206034 <rw_clus+0x128>
        bp = bread(0, sec);
    80205fde:	85ce                	mv	a1,s3
    80205fe0:	4501                	li	a0,0
    80205fe2:	ffffe097          	auipc	ra,0xffffe
    80205fe6:	99a080e7          	jalr	-1638(ra) # 8020397c <bread>
    80205fea:	892a                	mv	s2,a0
        m = BSIZE - off % BSIZE;
    80205fec:	1ffaf713          	andi	a4,s5,511
        if (n - tot < m) {
    80205ff0:	414c07bb          	subw	a5,s8,s4
        m = BSIZE - off % BSIZE;
    80205ff4:	40ed863b          	subw	a2,s11,a4
    80205ff8:	86be                	mv	a3,a5
    80205ffa:	2781                	sext.w	a5,a5
    80205ffc:	0006059b          	sext.w	a1,a2
    80206000:	00f5f363          	bgeu	a1,a5,80206006 <rw_clus+0xfa>
    80206004:	86b2                	mv	a3,a2
    80206006:	0006849b          	sext.w	s1,a3
        if (write) {
    8020600a:	f80c8ce3          	beqz	s9,80205fa2 <rw_clus+0x96>
            if ((bad = either_copyin(bp->data + (off % BSIZE), user, data, m)) != -1) {
    8020600e:	05890513          	addi	a0,s2,88
    80206012:	1682                	slli	a3,a3,0x20
    80206014:	9281                	srli	a3,a3,0x20
    80206016:	865a                	mv	a2,s6
    80206018:	f8843583          	ld	a1,-120(s0)
    8020601c:	953a                	add	a0,a0,a4
    8020601e:	ffffc097          	auipc	ra,0xffffc
    80206022:	5a0080e7          	jalr	1440(ra) # 802025be <either_copyin>
    80206026:	f7a513e3          	bne	a0,s10,80205f8c <rw_clus+0x80>
        brelse(bp);
    8020602a:	854a                	mv	a0,s2
    8020602c:	ffffe097          	auipc	ra,0xffffe
    80206030:	a7c080e7          	jalr	-1412(ra) # 80203aa8 <brelse>
}
    80206034:	8552                	mv	a0,s4
    80206036:	70e6                	ld	ra,120(sp)
    80206038:	7446                	ld	s0,112(sp)
    8020603a:	74a6                	ld	s1,104(sp)
    8020603c:	7906                	ld	s2,96(sp)
    8020603e:	69e6                	ld	s3,88(sp)
    80206040:	6a46                	ld	s4,80(sp)
    80206042:	6aa6                	ld	s5,72(sp)
    80206044:	6b06                	ld	s6,64(sp)
    80206046:	7be2                	ld	s7,56(sp)
    80206048:	7c42                	ld	s8,48(sp)
    8020604a:	7ca2                	ld	s9,40(sp)
    8020604c:	7d02                	ld	s10,32(sp)
    8020604e:	6de2                	ld	s11,24(sp)
    80206050:	6109                	addi	sp,sp,128
    80206052:	8082                	ret
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    80206054:	8a62                	mv	s4,s8
    80206056:	bff9                	j	80206034 <rw_clus+0x128>

0000000080206058 <eget>:
{
    80206058:	7139                	addi	sp,sp,-64
    8020605a:	fc06                	sd	ra,56(sp)
    8020605c:	f822                	sd	s0,48(sp)
    8020605e:	f426                	sd	s1,40(sp)
    80206060:	f04a                	sd	s2,32(sp)
    80206062:	ec4e                	sd	s3,24(sp)
    80206064:	e852                	sd	s4,16(sp)
    80206066:	e456                	sd	s5,8(sp)
    80206068:	0080                	addi	s0,sp,64
    8020606a:	8a2a                	mv	s4,a0
    8020606c:	8aae                	mv	s5,a1
    acquire(&ecache.lock);
    8020606e:	00019517          	auipc	a0,0x19
    80206072:	54a50513          	addi	a0,a0,1354 # 8021f5b8 <ecache>
    80206076:	ffffa097          	auipc	ra,0xffffa
    8020607a:	650080e7          	jalr	1616(ra) # 802006c6 <acquire>
    if (name) {
    8020607e:	060a8b63          	beqz	s5,802060f4 <eget+0x9c>
        for (ep = root.next; ep != &root; ep = ep->next) {          // LRU algo
    80206082:	00019497          	auipc	s1,0x19
    80206086:	4f64b483          	ld	s1,1270(s1) # 8021f578 <root+0x128>
    8020608a:	00019797          	auipc	a5,0x19
    8020608e:	3c678793          	addi	a5,a5,966 # 8021f450 <root>
    80206092:	06f48163          	beq	s1,a5,802060f4 <eget+0x9c>
            if (ep->valid == 1 && ep->parent == parent
    80206096:	4905                	li	s2,1
        for (ep = root.next; ep != &root; ep = ep->next) {          // LRU algo
    80206098:	89be                	mv	s3,a5
    8020609a:	a029                	j	802060a4 <eget+0x4c>
    8020609c:	1284b483          	ld	s1,296(s1)
    802060a0:	05348a63          	beq	s1,s3,802060f4 <eget+0x9c>
            if (ep->valid == 1 && ep->parent == parent
    802060a4:	11649783          	lh	a5,278(s1)
    802060a8:	ff279ae3          	bne	a5,s2,8020609c <eget+0x44>
    802060ac:	1204b783          	ld	a5,288(s1)
    802060b0:	ff4796e3          	bne	a5,s4,8020609c <eget+0x44>
                && strncmp(ep->filename, name, FAT32_MAX_FILENAME) == 0) {
    802060b4:	0ff00613          	li	a2,255
    802060b8:	85d6                	mv	a1,s5
    802060ba:	8526                	mv	a0,s1
    802060bc:	ffffa097          	auipc	ra,0xffffa
    802060c0:	77e080e7          	jalr	1918(ra) # 8020083a <strncmp>
    802060c4:	fd61                	bnez	a0,8020609c <eget+0x44>
                if (ep->ref++ == 0) {
    802060c6:	1184a783          	lw	a5,280(s1)
    802060ca:	0017871b          	addiw	a4,a5,1
    802060ce:	10e4ac23          	sw	a4,280(s1)
    802060d2:	eb81                	bnez	a5,802060e2 <eget+0x8a>
                    ep->parent->ref++;
    802060d4:	1204b703          	ld	a4,288(s1)
    802060d8:	11872783          	lw	a5,280(a4)
    802060dc:	2785                	addiw	a5,a5,1
    802060de:	10f72c23          	sw	a5,280(a4)
                release(&ecache.lock);
    802060e2:	00019517          	auipc	a0,0x19
    802060e6:	4d650513          	addi	a0,a0,1238 # 8021f5b8 <ecache>
    802060ea:	ffffa097          	auipc	ra,0xffffa
    802060ee:	630080e7          	jalr	1584(ra) # 8020071a <release>
                return ep;
    802060f2:	a085                	j	80206152 <eget+0xfa>
    for (ep = root.prev; ep != &root; ep = ep->prev) {              // LRU algo
    802060f4:	00019497          	auipc	s1,0x19
    802060f8:	48c4b483          	ld	s1,1164(s1) # 8021f580 <root+0x130>
    802060fc:	00019797          	auipc	a5,0x19
    80206100:	35478793          	addi	a5,a5,852 # 8021f450 <root>
    80206104:	00f48a63          	beq	s1,a5,80206118 <eget+0xc0>
    80206108:	873e                	mv	a4,a5
        if (ep->ref == 0) {
    8020610a:	1184a783          	lw	a5,280(s1)
    8020610e:	cf89                	beqz	a5,80206128 <eget+0xd0>
    for (ep = root.prev; ep != &root; ep = ep->prev) {              // LRU algo
    80206110:	1304b483          	ld	s1,304(s1)
    80206114:	fee49be3          	bne	s1,a4,8020610a <eget+0xb2>
    panic("eget: insufficient ecache");
    80206118:	00004517          	auipc	a0,0x4
    8020611c:	cc850513          	addi	a0,a0,-824 # 80209de0 <digits+0xa60>
    80206120:	ffffa097          	auipc	ra,0xffffa
    80206124:	024080e7          	jalr	36(ra) # 80200144 <panic>
            ep->ref = 1;
    80206128:	4785                	li	a5,1
    8020612a:	10f4ac23          	sw	a5,280(s1)
            ep->dev = parent->dev;
    8020612e:	114a4783          	lbu	a5,276(s4)
    80206132:	10f48a23          	sb	a5,276(s1)
            ep->off = 0;
    80206136:	1004ae23          	sw	zero,284(s1)
            ep->valid = 0;
    8020613a:	10049b23          	sh	zero,278(s1)
            ep->dirty = 0;
    8020613e:	10048aa3          	sb	zero,277(s1)
            release(&ecache.lock);
    80206142:	00019517          	auipc	a0,0x19
    80206146:	47650513          	addi	a0,a0,1142 # 8021f5b8 <ecache>
    8020614a:	ffffa097          	auipc	ra,0xffffa
    8020614e:	5d0080e7          	jalr	1488(ra) # 8020071a <release>
}
    80206152:	8526                	mv	a0,s1
    80206154:	70e2                	ld	ra,56(sp)
    80206156:	7442                	ld	s0,48(sp)
    80206158:	74a2                	ld	s1,40(sp)
    8020615a:	7902                	ld	s2,32(sp)
    8020615c:	69e2                	ld	s3,24(sp)
    8020615e:	6a42                	ld	s4,16(sp)
    80206160:	6aa2                	ld	s5,8(sp)
    80206162:	6121                	addi	sp,sp,64
    80206164:	8082                	ret

0000000080206166 <read_entry_name>:
{
    80206166:	7139                	addi	sp,sp,-64
    80206168:	fc06                	sd	ra,56(sp)
    8020616a:	f822                	sd	s0,48(sp)
    8020616c:	f426                	sd	s1,40(sp)
    8020616e:	f04a                	sd	s2,32(sp)
    80206170:	ec4e                	sd	s3,24(sp)
    80206172:	0080                	addi	s0,sp,64
    80206174:	84aa                	mv	s1,a0
    80206176:	892e                	mv	s2,a1
    if (d->lne.attr == ATTR_LONG_NAME) {                       // long entry branch
    80206178:	00b5c703          	lbu	a4,11(a1)
    8020617c:	47bd                	li	a5,15
    8020617e:	08f70563          	beq	a4,a5,80206208 <read_entry_name+0xa2>
        memset(buffer, 0, CHAR_SHORT_NAME + 2); // plus '.' and '\0'
    80206182:	4635                	li	a2,13
    80206184:	4581                	li	a1,0
    80206186:	ffffa097          	auipc	ra,0xffffa
    8020618a:	5dc080e7          	jalr	1500(ra) # 80200762 <memset>
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    8020618e:	00094703          	lbu	a4,0(s2)
    80206192:	02000793          	li	a5,32
    80206196:	0af70c63          	beq	a4,a5,8020624e <read_entry_name+0xe8>
    8020619a:	4785                	li	a5,1
    8020619c:	02000613          	li	a2,32
    802061a0:	45a5                	li	a1,9
            buffer[i] = d->sne.name[i];
    802061a2:	00f486b3          	add	a3,s1,a5
    802061a6:	fee68fa3          	sb	a4,-1(a3) # 1fff <_entry-0x801fe001>
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    802061aa:	0007869b          	sext.w	a3,a5
    802061ae:	00f90733          	add	a4,s2,a5
    802061b2:	00074703          	lbu	a4,0(a4)
    802061b6:	00c70563          	beq	a4,a2,802061c0 <read_entry_name+0x5a>
    802061ba:	0785                	addi	a5,a5,1
    802061bc:	feb793e3          	bne	a5,a1,802061a2 <read_entry_name+0x3c>
        if (d->sne.name[8] != ' ') {
    802061c0:	00894703          	lbu	a4,8(s2)
    802061c4:	02000793          	li	a5,32
    802061c8:	00f70963          	beq	a4,a5,802061da <read_entry_name+0x74>
            buffer[i++] = '.';
    802061cc:	00d487b3          	add	a5,s1,a3
    802061d0:	02e00713          	li	a4,46
    802061d4:	00e78023          	sb	a4,0(a5)
    802061d8:	2685                	addiw	a3,a3,1
        for (int j = 8; j < CHAR_SHORT_NAME; j++, i++) {
    802061da:	00890793          	addi	a5,s2,8
    802061de:	94b6                	add	s1,s1,a3
    802061e0:	092d                	addi	s2,s2,11
            if (d->sne.name[j] == ' ') { break; }
    802061e2:	02000693          	li	a3,32
    802061e6:	0007c703          	lbu	a4,0(a5)
    802061ea:	00d70863          	beq	a4,a3,802061fa <read_entry_name+0x94>
            buffer[i] = d->sne.name[j];
    802061ee:	00e48023          	sb	a4,0(s1)
        for (int j = 8; j < CHAR_SHORT_NAME; j++, i++) {
    802061f2:	0785                	addi	a5,a5,1
    802061f4:	0485                	addi	s1,s1,1
    802061f6:	ff2798e3          	bne	a5,s2,802061e6 <read_entry_name+0x80>
}
    802061fa:	70e2                	ld	ra,56(sp)
    802061fc:	7442                	ld	s0,48(sp)
    802061fe:	74a2                	ld	s1,40(sp)
    80206200:	7902                	ld	s2,32(sp)
    80206202:	69e2                	ld	s3,24(sp)
    80206204:	6121                	addi	sp,sp,64
    80206206:	8082                	ret
        memmove(temp, d->lne.name1, sizeof(temp));
    80206208:	4629                	li	a2,10
    8020620a:	0585                	addi	a1,a1,1
    8020620c:	fc040993          	addi	s3,s0,-64
    80206210:	854e                	mv	a0,s3
    80206212:	ffffa097          	auipc	ra,0xffffa
    80206216:	5ac080e7          	jalr	1452(ra) # 802007be <memmove>
        snstr(buffer, temp, NELEM(d->lne.name1));
    8020621a:	4615                	li	a2,5
    8020621c:	85ce                	mv	a1,s3
    8020621e:	8526                	mv	a0,s1
    80206220:	ffffa097          	auipc	ra,0xffffa
    80206224:	722080e7          	jalr	1826(ra) # 80200942 <snstr>
        snstr(buffer, d->lne.name2, NELEM(d->lne.name2));
    80206228:	4619                	li	a2,6
    8020622a:	00e90593          	addi	a1,s2,14
    8020622e:	00548513          	addi	a0,s1,5
    80206232:	ffffa097          	auipc	ra,0xffffa
    80206236:	710080e7          	jalr	1808(ra) # 80200942 <snstr>
        snstr(buffer, d->lne.name3, NELEM(d->lne.name3));
    8020623a:	4609                	li	a2,2
    8020623c:	01c90593          	addi	a1,s2,28
    80206240:	00b48513          	addi	a0,s1,11
    80206244:	ffffa097          	auipc	ra,0xffffa
    80206248:	6fe080e7          	jalr	1790(ra) # 80200942 <snstr>
    8020624c:	b77d                	j	802061fa <read_entry_name+0x94>
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    8020624e:	4681                	li	a3,0
    80206250:	bf85                	j	802061c0 <read_entry_name+0x5a>

0000000080206252 <fat32_init>:
{
    80206252:	7139                	addi	sp,sp,-64
    80206254:	fc06                	sd	ra,56(sp)
    80206256:	f822                	sd	s0,48(sp)
    80206258:	f426                	sd	s1,40(sp)
    8020625a:	f04a                	sd	s2,32(sp)
    8020625c:	ec4e                	sd	s3,24(sp)
    8020625e:	e852                	sd	s4,16(sp)
    80206260:	e456                	sd	s5,8(sp)
    80206262:	0080                	addi	s0,sp,64
    struct buf *b = bread(0, 0);
    80206264:	4581                	li	a1,0
    80206266:	4501                	li	a0,0
    80206268:	ffffd097          	auipc	ra,0xffffd
    8020626c:	714080e7          	jalr	1812(ra) # 8020397c <bread>
    80206270:	892a                	mv	s2,a0
    if (strncmp((char const*)(b->data + 82), "FAT32", 5))
    80206272:	4615                	li	a2,5
    80206274:	00004597          	auipc	a1,0x4
    80206278:	b8c58593          	addi	a1,a1,-1140 # 80209e00 <digits+0xa80>
    8020627c:	0aa50513          	addi	a0,a0,170
    80206280:	ffffa097          	auipc	ra,0xffffa
    80206284:	5ba080e7          	jalr	1466(ra) # 8020083a <strncmp>
    80206288:	16051863          	bnez	a0,802063f8 <fat32_init+0x1a6>
    memmove(&fat.bpb.byts_per_sec, b->data + 11, 2);            // avoid misaligned load on k210
    8020628c:	00019497          	auipc	s1,0x19
    80206290:	19c48493          	addi	s1,s1,412 # 8021f428 <fat>
    80206294:	4609                	li	a2,2
    80206296:	06390593          	addi	a1,s2,99
    8020629a:	00019517          	auipc	a0,0x19
    8020629e:	19e50513          	addi	a0,a0,414 # 8021f438 <fat+0x10>
    802062a2:	ffffa097          	auipc	ra,0xffffa
    802062a6:	51c080e7          	jalr	1308(ra) # 802007be <memmove>
    fat.bpb.sec_per_clus = *(b->data + 13);
    802062aa:	06594683          	lbu	a3,101(s2)
    802062ae:	00d48923          	sb	a3,18(s1)
    fat.bpb.rsvd_sec_cnt = *(uint16 *)(b->data + 14);
    802062b2:	06695603          	lhu	a2,102(s2)
    802062b6:	00c49a23          	sh	a2,20(s1)
    fat.bpb.fat_cnt = *(b->data + 16);
    802062ba:	06894703          	lbu	a4,104(s2)
    802062be:	00e48b23          	sb	a4,22(s1)
    fat.bpb.hidd_sec = *(uint32 *)(b->data + 28);
    802062c2:	07492783          	lw	a5,116(s2)
    802062c6:	cc9c                	sw	a5,24(s1)
    fat.bpb.tot_sec = *(uint32 *)(b->data + 32);
    802062c8:	07892783          	lw	a5,120(s2)
    802062cc:	ccdc                	sw	a5,28(s1)
    fat.bpb.fat_sz = *(uint32 *)(b->data + 36);
    802062ce:	07c92583          	lw	a1,124(s2)
    802062d2:	d08c                	sw	a1,32(s1)
    fat.bpb.root_clus = *(uint32 *)(b->data + 44);
    802062d4:	08492503          	lw	a0,132(s2)
    802062d8:	d0c8                	sw	a0,36(s1)
    fat.first_data_sec = fat.bpb.rsvd_sec_cnt + fat.bpb.fat_cnt * fat.bpb.fat_sz;
    802062da:	02b7073b          	mulw	a4,a4,a1
    802062de:	9f31                	addw	a4,a4,a2
    802062e0:	c098                	sw	a4,0(s1)
    fat.data_sec_cnt = fat.bpb.tot_sec - fat.first_data_sec;
    802062e2:	9f99                	subw	a5,a5,a4
    802062e4:	c0dc                	sw	a5,4(s1)
    fat.data_clus_cnt = fat.data_sec_cnt / fat.bpb.sec_per_clus;
    802062e6:	02d7d7bb          	divuw	a5,a5,a3
    802062ea:	c49c                	sw	a5,8(s1)
    fat.byts_per_clus = fat.bpb.sec_per_clus * fat.bpb.byts_per_sec;
    802062ec:	0104d783          	lhu	a5,16(s1)
    802062f0:	02d787bb          	mulw	a5,a5,a3
    802062f4:	c4dc                	sw	a5,12(s1)
    brelse(b);
    802062f6:	854a                	mv	a0,s2
    802062f8:	ffffd097          	auipc	ra,0xffffd
    802062fc:	7b0080e7          	jalr	1968(ra) # 80203aa8 <brelse>
    if (BSIZE != fat.bpb.byts_per_sec) 
    80206300:	0104d703          	lhu	a4,16(s1)
    80206304:	20000793          	li	a5,512
    80206308:	10f71063          	bne	a4,a5,80206408 <fat32_init+0x1b6>
    initlock(&ecache.lock, "ecache");
    8020630c:	00004597          	auipc	a1,0x4
    80206310:	b2c58593          	addi	a1,a1,-1236 # 80209e38 <digits+0xab8>
    80206314:	00019517          	auipc	a0,0x19
    80206318:	2a450513          	addi	a0,a0,676 # 8021f5b8 <ecache>
    8020631c:	ffffa097          	auipc	ra,0xffffa
    80206320:	366080e7          	jalr	870(ra) # 80200682 <initlock>
    memset(&root, 0, sizeof(root));
    80206324:	00019497          	auipc	s1,0x19
    80206328:	10448493          	addi	s1,s1,260 # 8021f428 <fat>
    8020632c:	00019917          	auipc	s2,0x19
    80206330:	12490913          	addi	s2,s2,292 # 8021f450 <root>
    80206334:	16800613          	li	a2,360
    80206338:	4581                	li	a1,0
    8020633a:	854a                	mv	a0,s2
    8020633c:	ffffa097          	auipc	ra,0xffffa
    80206340:	426080e7          	jalr	1062(ra) # 80200762 <memset>
    initsleeplock(&root.lock, "entry");
    80206344:	00004597          	auipc	a1,0x4
    80206348:	afc58593          	addi	a1,a1,-1284 # 80209e40 <digits+0xac0>
    8020634c:	00019517          	auipc	a0,0x19
    80206350:	23c50513          	addi	a0,a0,572 # 8021f588 <root+0x138>
    80206354:	ffffe097          	auipc	ra,0xffffe
    80206358:	86a080e7          	jalr	-1942(ra) # 80203bbe <initsleeplock>
    root.attribute = (ATTR_DIRECTORY | ATTR_SYSTEM);
    8020635c:	47d1                	li	a5,20
    8020635e:	12f48423          	sb	a5,296(s1)
    root.first_clus = root.cur_clus = fat.bpb.root_clus;
    80206362:	50dc                	lw	a5,36(s1)
    80206364:	12f4aa23          	sw	a5,308(s1)
    80206368:	12f4a623          	sw	a5,300(s1)
    root.valid = 1;
    8020636c:	4785                	li	a5,1
    8020636e:	12f49f23          	sh	a5,318(s1)
    root.prev = &root;
    80206372:	1524bc23          	sd	s2,344(s1)
    root.next = &root;
    80206376:	1524b823          	sd	s2,336(s1)
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    8020637a:	00019497          	auipc	s1,0x19
    8020637e:	25648493          	addi	s1,s1,598 # 8021f5d0 <ecache+0x18>
        de->next = root.next;
    80206382:	00019917          	auipc	s2,0x19
    80206386:	0a690913          	addi	s2,s2,166 # 8021f428 <fat>
        de->prev = &root;
    8020638a:	00019a97          	auipc	s5,0x19
    8020638e:	0c6a8a93          	addi	s5,s5,198 # 8021f450 <root>
        initsleeplock(&de->lock, "entry");
    80206392:	00004a17          	auipc	s4,0x4
    80206396:	aaea0a13          	addi	s4,s4,-1362 # 80209e40 <digits+0xac0>
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    8020639a:	0001e997          	auipc	s3,0x1e
    8020639e:	88698993          	addi	s3,s3,-1914 # 80223c20 <cons>
        de->dev = 0;
    802063a2:	10048a23          	sb	zero,276(s1)
        de->valid = 0;
    802063a6:	10049b23          	sh	zero,278(s1)
        de->ref = 0;
    802063aa:	1004ac23          	sw	zero,280(s1)
        de->dirty = 0;
    802063ae:	10048aa3          	sb	zero,277(s1)
        de->parent = 0;
    802063b2:	1204b023          	sd	zero,288(s1)
        de->next = root.next;
    802063b6:	15093783          	ld	a5,336(s2)
    802063ba:	12f4b423          	sd	a5,296(s1)
        de->prev = &root;
    802063be:	1354b823          	sd	s5,304(s1)
        initsleeplock(&de->lock, "entry");
    802063c2:	85d2                	mv	a1,s4
    802063c4:	13848513          	addi	a0,s1,312
    802063c8:	ffffd097          	auipc	ra,0xffffd
    802063cc:	7f6080e7          	jalr	2038(ra) # 80203bbe <initsleeplock>
        root.next->prev = de;
    802063d0:	15093783          	ld	a5,336(s2)
    802063d4:	1297b823          	sd	s1,304(a5)
        root.next = de;
    802063d8:	14993823          	sd	s1,336(s2)
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    802063dc:	16848493          	addi	s1,s1,360
    802063e0:	fd3491e3          	bne	s1,s3,802063a2 <fat32_init+0x150>
}
    802063e4:	4501                	li	a0,0
    802063e6:	70e2                	ld	ra,56(sp)
    802063e8:	7442                	ld	s0,48(sp)
    802063ea:	74a2                	ld	s1,40(sp)
    802063ec:	7902                	ld	s2,32(sp)
    802063ee:	69e2                	ld	s3,24(sp)
    802063f0:	6a42                	ld	s4,16(sp)
    802063f2:	6aa2                	ld	s5,8(sp)
    802063f4:	6121                	addi	sp,sp,64
    802063f6:	8082                	ret
        panic("not FAT32 volume");
    802063f8:	00004517          	auipc	a0,0x4
    802063fc:	a1050513          	addi	a0,a0,-1520 # 80209e08 <digits+0xa88>
    80206400:	ffffa097          	auipc	ra,0xffffa
    80206404:	d44080e7          	jalr	-700(ra) # 80200144 <panic>
        panic("byts_per_sec != BSIZE");
    80206408:	00004517          	auipc	a0,0x4
    8020640c:	a1850513          	addi	a0,a0,-1512 # 80209e20 <digits+0xaa0>
    80206410:	ffffa097          	auipc	ra,0xffffa
    80206414:	d34080e7          	jalr	-716(ra) # 80200144 <panic>

0000000080206418 <eread>:
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    80206418:	10852783          	lw	a5,264(a0)
    8020641c:	0ed7e863          	bltu	a5,a3,8020650c <eread+0xf4>
{
    80206420:	711d                	addi	sp,sp,-96
    80206422:	ec86                	sd	ra,88(sp)
    80206424:	e8a2                	sd	s0,80(sp)
    80206426:	e4a6                	sd	s1,72(sp)
    80206428:	e0ca                	sd	s2,64(sp)
    8020642a:	fc4e                	sd	s3,56(sp)
    8020642c:	f852                	sd	s4,48(sp)
    8020642e:	f456                	sd	s5,40(sp)
    80206430:	f05a                	sd	s6,32(sp)
    80206432:	ec5e                	sd	s7,24(sp)
    80206434:	e862                	sd	s8,16(sp)
    80206436:	e466                	sd	s9,8(sp)
    80206438:	e06a                	sd	s10,0(sp)
    8020643a:	1080                	addi	s0,sp,96
    8020643c:	8a2a                	mv	s4,a0
    8020643e:	8bae                	mv	s7,a1
    80206440:	8ab2                	mv	s5,a2
    80206442:	8936                	mv	s2,a3
    80206444:	8b3a                	mv	s6,a4
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    80206446:	9eb9                	addw	a3,a3,a4
        return 0;
    80206448:	4501                	li	a0,0
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    8020644a:	0b26e163          	bltu	a3,s2,802064ec <eread+0xd4>
    8020644e:	100a4703          	lbu	a4,256(s4)
    80206452:	8b41                	andi	a4,a4,16
    80206454:	ef41                	bnez	a4,802064ec <eread+0xd4>
    if (off + n > entry->file_size) {
    80206456:	00d7f463          	bgeu	a5,a3,8020645e <eread+0x46>
        n = entry->file_size - off;
    8020645a:	41278b3b          	subw	s6,a5,s2
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    8020645e:	10ca2703          	lw	a4,268(s4)
    80206462:	100007b7          	lui	a5,0x10000
    80206466:	17dd                	addi	a5,a5,-9 # ffffff7 <_entry-0x70200009>
    80206468:	06e7ef63          	bltu	a5,a4,802064e6 <eread+0xce>
    8020646c:	080b0e63          	beqz	s6,80206508 <eread+0xf0>
    80206470:	4981                	li	s3,0
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80206472:	00019c97          	auipc	s9,0x19
    80206476:	fb6c8c93          	addi	s9,s9,-74 # 8021f428 <fat>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    8020647a:	8c3e                	mv	s8,a5
    8020647c:	a82d                	j	802064b6 <eread+0x9e>
    8020647e:	00048d1b          	sext.w	s10,s1
        if (rw_clus(entry->cur_clus, 0, user_dst, dst, off % fat.byts_per_clus, m) != m) {
    80206482:	87ea                	mv	a5,s10
    80206484:	86d6                	mv	a3,s5
    80206486:	865e                	mv	a2,s7
    80206488:	4581                	li	a1,0
    8020648a:	10ca2503          	lw	a0,268(s4)
    8020648e:	00000097          	auipc	ra,0x0
    80206492:	a7e080e7          	jalr	-1410(ra) # 80205f0c <rw_clus>
    80206496:	2501                	sext.w	a0,a0
    80206498:	04ad1863          	bne	s10,a0,802064e8 <eread+0xd0>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    8020649c:	013489bb          	addw	s3,s1,s3
    802064a0:	0124893b          	addw	s2,s1,s2
    802064a4:	1482                	slli	s1,s1,0x20
    802064a6:	9081                	srli	s1,s1,0x20
    802064a8:	9aa6                	add	s5,s5,s1
    802064aa:	10ca2783          	lw	a5,268(s4)
    802064ae:	02fc6d63          	bltu	s8,a5,802064e8 <eread+0xd0>
    802064b2:	0369fb63          	bgeu	s3,s6,802064e8 <eread+0xd0>
        reloc_clus(entry, off, 0);
    802064b6:	4601                	li	a2,0
    802064b8:	85ca                	mv	a1,s2
    802064ba:	8552                	mv	a0,s4
    802064bc:	00000097          	auipc	ra,0x0
    802064c0:	948080e7          	jalr	-1720(ra) # 80205e04 <reloc_clus>
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    802064c4:	00cca683          	lw	a3,12(s9)
    802064c8:	02d9763b          	remuw	a2,s2,a3
    802064cc:	0006071b          	sext.w	a4,a2
        if (n - tot < m) {
    802064d0:	413b07bb          	subw	a5,s6,s3
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    802064d4:	9e91                	subw	a3,a3,a2
    802064d6:	84be                	mv	s1,a5
    802064d8:	2781                	sext.w	a5,a5
    802064da:	0006861b          	sext.w	a2,a3
    802064de:	faf670e3          	bgeu	a2,a5,8020647e <eread+0x66>
    802064e2:	84b6                	mv	s1,a3
    802064e4:	bf69                	j	8020647e <eread+0x66>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    802064e6:	4981                	li	s3,0
    return tot;
    802064e8:	0009851b          	sext.w	a0,s3
}
    802064ec:	60e6                	ld	ra,88(sp)
    802064ee:	6446                	ld	s0,80(sp)
    802064f0:	64a6                	ld	s1,72(sp)
    802064f2:	6906                	ld	s2,64(sp)
    802064f4:	79e2                	ld	s3,56(sp)
    802064f6:	7a42                	ld	s4,48(sp)
    802064f8:	7aa2                	ld	s5,40(sp)
    802064fa:	7b02                	ld	s6,32(sp)
    802064fc:	6be2                	ld	s7,24(sp)
    802064fe:	6c42                	ld	s8,16(sp)
    80206500:	6ca2                	ld	s9,8(sp)
    80206502:	6d02                	ld	s10,0(sp)
    80206504:	6125                	addi	sp,sp,96
    80206506:	8082                	ret
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80206508:	89da                	mv	s3,s6
    8020650a:	bff9                	j	802064e8 <eread+0xd0>
        return 0;
    8020650c:	4501                	li	a0,0
}
    8020650e:	8082                	ret

0000000080206510 <ewrite>:
    if (off > entry->file_size || off + n < off || (uint64)off + n > 0xffffffff
    80206510:	10852783          	lw	a5,264(a0)
    80206514:	0ed7e463          	bltu	a5,a3,802065fc <ewrite+0xec>
{
    80206518:	711d                	addi	sp,sp,-96
    8020651a:	ec86                	sd	ra,88(sp)
    8020651c:	e8a2                	sd	s0,80(sp)
    8020651e:	e4a6                	sd	s1,72(sp)
    80206520:	e0ca                	sd	s2,64(sp)
    80206522:	fc4e                	sd	s3,56(sp)
    80206524:	f852                	sd	s4,48(sp)
    80206526:	f456                	sd	s5,40(sp)
    80206528:	f05a                	sd	s6,32(sp)
    8020652a:	ec5e                	sd	s7,24(sp)
    8020652c:	e862                	sd	s8,16(sp)
    8020652e:	e466                	sd	s9,8(sp)
    80206530:	1080                	addi	s0,sp,96
    80206532:	8aaa                	mv	s5,a0
    80206534:	8bae                	mv	s7,a1
    80206536:	8a32                	mv	s4,a2
    80206538:	8936                	mv	s2,a3
    8020653a:	8b3a                	mv	s6,a4
    if (off > entry->file_size || off + n < off || (uint64)off + n > 0xffffffff
    8020653c:	00e687bb          	addw	a5,a3,a4
    80206540:	0cd7e063          	bltu	a5,a3,80206600 <ewrite+0xf0>
    80206544:	02069793          	slli	a5,a3,0x20
    80206548:	9381                	srli	a5,a5,0x20
    8020654a:	1702                	slli	a4,a4,0x20
    8020654c:	9301                	srli	a4,a4,0x20
    8020654e:	97ba                	add	a5,a5,a4
    80206550:	577d                	li	a4,-1
    80206552:	9301                	srli	a4,a4,0x20
    80206554:	0af76863          	bltu	a4,a5,80206604 <ewrite+0xf4>
        || (entry->attribute & ATTR_READ_ONLY)) {
    80206558:	10054783          	lbu	a5,256(a0)
    8020655c:	8b85                	andi	a5,a5,1
    8020655e:	e7cd                	bnez	a5,80206608 <ewrite+0xf8>
    if (entry->first_clus == 0) {   // so file_size if 0 too, which requests off == 0
    80206560:	10452783          	lw	a5,260(a0)
    80206564:	cb89                	beqz	a5,80206576 <ewrite+0x66>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    80206566:	080b0963          	beqz	s6,802065f8 <ewrite+0xe8>
    8020656a:	4981                	li	s3,0
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    8020656c:	00019c17          	auipc	s8,0x19
    80206570:	ebcc0c13          	addi	s8,s8,-324 # 8021f428 <fat>
    80206574:	a891                	j	802065c8 <ewrite+0xb8>
        entry->cur_clus = entry->first_clus = alloc_clus(entry->dev);
    80206576:	11454503          	lbu	a0,276(a0)
    8020657a:	fffff097          	auipc	ra,0xfffff
    8020657e:	6c8080e7          	jalr	1736(ra) # 80205c42 <alloc_clus>
    80206582:	2501                	sext.w	a0,a0
    80206584:	10aaa223          	sw	a0,260(s5)
    80206588:	10aaa623          	sw	a0,268(s5)
        entry->clus_cnt = 0;
    8020658c:	100aa823          	sw	zero,272(s5)
        entry->dirty = 1;
    80206590:	4785                	li	a5,1
    80206592:	10fa8aa3          	sb	a5,277(s5)
    80206596:	bfc1                	j	80206566 <ewrite+0x56>
    80206598:	00048c9b          	sext.w	s9,s1
        if (rw_clus(entry->cur_clus, 1, user_src, src, off % fat.byts_per_clus, m) != m) {
    8020659c:	87e6                	mv	a5,s9
    8020659e:	86d2                	mv	a3,s4
    802065a0:	865e                	mv	a2,s7
    802065a2:	4585                	li	a1,1
    802065a4:	10caa503          	lw	a0,268(s5)
    802065a8:	00000097          	auipc	ra,0x0
    802065ac:	964080e7          	jalr	-1692(ra) # 80205f0c <rw_clus>
    802065b0:	2501                	sext.w	a0,a0
    802065b2:	04ac9d63          	bne	s9,a0,8020660c <ewrite+0xfc>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    802065b6:	013489bb          	addw	s3,s1,s3
    802065ba:	0124893b          	addw	s2,s1,s2
    802065be:	1482                	slli	s1,s1,0x20
    802065c0:	9081                	srli	s1,s1,0x20
    802065c2:	9a26                	add	s4,s4,s1
    802065c4:	0569f463          	bgeu	s3,s6,8020660c <ewrite+0xfc>
        reloc_clus(entry, off, 1);
    802065c8:	4605                	li	a2,1
    802065ca:	85ca                	mv	a1,s2
    802065cc:	8556                	mv	a0,s5
    802065ce:	00000097          	auipc	ra,0x0
    802065d2:	836080e7          	jalr	-1994(ra) # 80205e04 <reloc_clus>
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    802065d6:	00cc2683          	lw	a3,12(s8)
    802065da:	02d9763b          	remuw	a2,s2,a3
    802065de:	0006071b          	sext.w	a4,a2
        if (n - tot < m) {
    802065e2:	413b07bb          	subw	a5,s6,s3
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    802065e6:	9e91                	subw	a3,a3,a2
    802065e8:	84be                	mv	s1,a5
    802065ea:	2781                	sext.w	a5,a5
    802065ec:	0006861b          	sext.w	a2,a3
    802065f0:	faf674e3          	bgeu	a2,a5,80206598 <ewrite+0x88>
    802065f4:	84b6                	mv	s1,a3
    802065f6:	b74d                	j	80206598 <ewrite+0x88>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    802065f8:	89da                	mv	s3,s6
    802065fa:	a015                	j	8020661e <ewrite+0x10e>
        return -1;
    802065fc:	557d                	li	a0,-1
}
    802065fe:	8082                	ret
        return -1;
    80206600:	557d                	li	a0,-1
    80206602:	a005                	j	80206622 <ewrite+0x112>
    80206604:	557d                	li	a0,-1
    80206606:	a831                	j	80206622 <ewrite+0x112>
    80206608:	557d                	li	a0,-1
    8020660a:	a821                	j	80206622 <ewrite+0x112>
        if(off > entry->file_size) {
    8020660c:	108aa783          	lw	a5,264(s5)
    80206610:	0127f763          	bgeu	a5,s2,8020661e <ewrite+0x10e>
            entry->file_size = off;
    80206614:	112aa423          	sw	s2,264(s5)
            entry->dirty = 1;
    80206618:	4785                	li	a5,1
    8020661a:	10fa8aa3          	sb	a5,277(s5)
    return tot;
    8020661e:	0009851b          	sext.w	a0,s3
}
    80206622:	60e6                	ld	ra,88(sp)
    80206624:	6446                	ld	s0,80(sp)
    80206626:	64a6                	ld	s1,72(sp)
    80206628:	6906                	ld	s2,64(sp)
    8020662a:	79e2                	ld	s3,56(sp)
    8020662c:	7a42                	ld	s4,48(sp)
    8020662e:	7aa2                	ld	s5,40(sp)
    80206630:	7b02                	ld	s6,32(sp)
    80206632:	6be2                	ld	s7,24(sp)
    80206634:	6c42                	ld	s8,16(sp)
    80206636:	6ca2                	ld	s9,8(sp)
    80206638:	6125                	addi	sp,sp,96
    8020663a:	8082                	ret

000000008020663c <formatname>:
{
    8020663c:	7179                	addi	sp,sp,-48
    8020663e:	f406                	sd	ra,40(sp)
    80206640:	f022                	sd	s0,32(sp)
    80206642:	ec26                	sd	s1,24(sp)
    80206644:	e84a                	sd	s2,16(sp)
    80206646:	e44e                	sd	s3,8(sp)
    80206648:	e052                	sd	s4,0(sp)
    8020664a:	1800                	addi	s0,sp,48
    8020664c:	84aa                	mv	s1,a0
    while (*name == ' ' || *name == '.') { name++; }
    8020664e:	02000793          	li	a5,32
    80206652:	02e00713          	li	a4,46
    80206656:	a011                	j	8020665a <formatname+0x1e>
    80206658:	0485                	addi	s1,s1,1
    8020665a:	0004c583          	lbu	a1,0(s1)
    8020665e:	fef58de3          	beq	a1,a5,80206658 <formatname+0x1c>
    80206662:	fee58be3          	beq	a1,a4,80206658 <formatname+0x1c>
    for (p = name; *p; p++) {
    80206666:	c1b9                	beqz	a1,802066ac <formatname+0x70>
    80206668:	8926                	mv	s2,s1
        if (c < 0x20 || strchr(illegal, c)) {
    8020666a:	49fd                	li	s3,31
    8020666c:	00006a17          	auipc	s4,0x6
    80206670:	634a0a13          	addi	s4,s4,1588 # 8020cca0 <illegal.1>
    80206674:	02b9fe63          	bgeu	s3,a1,802066b0 <formatname+0x74>
    80206678:	8552                	mv	a0,s4
    8020667a:	ffffa097          	auipc	ra,0xffffa
    8020667e:	346080e7          	jalr	838(ra) # 802009c0 <strchr>
    80206682:	e121                	bnez	a0,802066c2 <formatname+0x86>
    for (p = name; *p; p++) {
    80206684:	0905                	addi	s2,s2,1
    80206686:	00094583          	lbu	a1,0(s2)
    8020668a:	f5ed                	bnez	a1,80206674 <formatname+0x38>
        if (*p != ' ') {
    8020668c:	02000693          	li	a3,32
    80206690:	874a                	mv	a4,s2
    while (p-- > name) {
    80206692:	0124fb63          	bgeu	s1,s2,802066a8 <formatname+0x6c>
        if (*p != ' ') {
    80206696:	197d                	addi	s2,s2,-1
    80206698:	00094783          	lbu	a5,0(s2)
    8020669c:	fed78ae3          	beq	a5,a3,80206690 <formatname+0x54>
            p[1] = '\0';
    802066a0:	00070023          	sb	zero,0(a4)
            break;
    802066a4:	8526                	mv	a0,s1
    802066a6:	a031                	j	802066b2 <formatname+0x76>
    802066a8:	8526                	mv	a0,s1
    802066aa:	a021                	j	802066b2 <formatname+0x76>
    for (p = name; *p; p++) {
    802066ac:	8526                	mv	a0,s1
    802066ae:	a011                	j	802066b2 <formatname+0x76>
            return 0;
    802066b0:	4501                	li	a0,0
}
    802066b2:	70a2                	ld	ra,40(sp)
    802066b4:	7402                	ld	s0,32(sp)
    802066b6:	64e2                	ld	s1,24(sp)
    802066b8:	6942                	ld	s2,16(sp)
    802066ba:	69a2                	ld	s3,8(sp)
    802066bc:	6a02                	ld	s4,0(sp)
    802066be:	6145                	addi	sp,sp,48
    802066c0:	8082                	ret
            return 0;
    802066c2:	4501                	li	a0,0
    802066c4:	b7fd                	j	802066b2 <formatname+0x76>

00000000802066c6 <cal_checksum>:
{
    802066c6:	1141                	addi	sp,sp,-16
    802066c8:	e422                	sd	s0,8(sp)
    802066ca:	0800                	addi	s0,sp,16
    802066cc:	87aa                	mv	a5,a0
    for (int i = CHAR_SHORT_NAME; i != 0; i--) {
    802066ce:	00b50613          	addi	a2,a0,11
    uint8 sum = 0;
    802066d2:	4501                	li	a0,0
        sum = ((sum & 1) ? 0x80 : 0) + (sum >> 1) + *shortname++;
    802066d4:	0075171b          	slliw	a4,a0,0x7
    802066d8:	0785                	addi	a5,a5,1
    802066da:	0015551b          	srliw	a0,a0,0x1
    802066de:	fff7c683          	lbu	a3,-1(a5)
    802066e2:	9d35                	addw	a0,a0,a3
    802066e4:	953a                	add	a0,a0,a4
    802066e6:	0ff57513          	zext.b	a0,a0
    for (int i = CHAR_SHORT_NAME; i != 0; i--) {
    802066ea:	fef615e3          	bne	a2,a5,802066d4 <cal_checksum+0xe>
}
    802066ee:	6422                	ld	s0,8(sp)
    802066f0:	0141                	addi	sp,sp,16
    802066f2:	8082                	ret

00000000802066f4 <emake>:
{
    802066f4:	7131                	addi	sp,sp,-192
    802066f6:	fd06                	sd	ra,184(sp)
    802066f8:	f922                	sd	s0,176(sp)
    802066fa:	f526                	sd	s1,168(sp)
    802066fc:	f14a                	sd	s2,160(sp)
    802066fe:	ed4e                	sd	s3,152(sp)
    80206700:	e952                	sd	s4,144(sp)
    80206702:	e556                	sd	s5,136(sp)
    80206704:	e15a                	sd	s6,128(sp)
    80206706:	fcde                	sd	s7,120(sp)
    80206708:	f8e2                	sd	s8,112(sp)
    8020670a:	f4e6                	sd	s9,104(sp)
    8020670c:	f0ea                	sd	s10,96(sp)
    8020670e:	ecee                	sd	s11,88(sp)
    80206710:	0180                	addi	s0,sp,192
    if (!(dp->attribute & ATTR_DIRECTORY))
    80206712:	10054783          	lbu	a5,256(a0)
    80206716:	8bc1                	andi	a5,a5,16
    80206718:	c3d5                	beqz	a5,802067bc <emake+0xc8>
    8020671a:	8b2a                	mv	s6,a0
    8020671c:	8d2e                	mv	s10,a1
    8020671e:	8cb2                	mv	s9,a2
    if (off % sizeof(union dentry))
    80206720:	01f67793          	andi	a5,a2,31
    80206724:	e7c5                	bnez	a5,802067cc <emake+0xd8>
    memset(&de, 0, sizeof(de));
    80206726:	02000613          	li	a2,32
    8020672a:	4581                	li	a1,0
    8020672c:	f7040513          	addi	a0,s0,-144
    80206730:	ffffa097          	auipc	ra,0xffffa
    80206734:	032080e7          	jalr	50(ra) # 80200762 <memset>
    if (off <= 32) {
    80206738:	02000793          	li	a5,32
    8020673c:	0b97ec63          	bltu	a5,s9,802067f4 <emake+0x100>
        if (off == 0) {
    80206740:	080c9e63          	bnez	s9,802067dc <emake+0xe8>
            strncpy(de.sne.name, ".          ", sizeof(de.sne.name));
    80206744:	462d                	li	a2,11
    80206746:	00003597          	auipc	a1,0x3
    8020674a:	72a58593          	addi	a1,a1,1834 # 80209e70 <digits+0xaf0>
    8020674e:	f7040513          	addi	a0,s0,-144
    80206752:	ffffa097          	auipc	ra,0xffffa
    80206756:	124080e7          	jalr	292(ra) # 80200876 <strncpy>
        de.sne.attr = ATTR_DIRECTORY;
    8020675a:	47c1                	li	a5,16
    8020675c:	f6f40da3          	sb	a5,-133(s0)
        de.sne.fst_clus_hi = (uint16)(ep->first_clus >> 16);        // first clus high 16 bits
    80206760:	104d2783          	lw	a5,260(s10) # fffffffffffff104 <ebss_clear+0xffffffff7fdd8104>
    80206764:	0107d71b          	srliw	a4,a5,0x10
    80206768:	f8e41223          	sh	a4,-124(s0)
        de.sne.fst_clus_lo = (uint16)(ep->first_clus & 0xffff);       // low 16 bits
    8020676c:	f8f41523          	sh	a5,-118(s0)
        de.sne.file_size = 0;                                       // filesize is updated in eupdate()
    80206770:	f8042623          	sw	zero,-116(s0)
        off = reloc_clus(dp, off, 1);
    80206774:	4605                	li	a2,1
    80206776:	85e6                	mv	a1,s9
    80206778:	855a                	mv	a0,s6
    8020677a:	fffff097          	auipc	ra,0xfffff
    8020677e:	68a080e7          	jalr	1674(ra) # 80205e04 <reloc_clus>
        rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80206782:	02000793          	li	a5,32
    80206786:	0005071b          	sext.w	a4,a0
    8020678a:	f7040693          	addi	a3,s0,-144
    8020678e:	4601                	li	a2,0
    80206790:	4585                	li	a1,1
    80206792:	10cb2503          	lw	a0,268(s6)
    80206796:	fffff097          	auipc	ra,0xfffff
    8020679a:	776080e7          	jalr	1910(ra) # 80205f0c <rw_clus>
}
    8020679e:	70ea                	ld	ra,184(sp)
    802067a0:	744a                	ld	s0,176(sp)
    802067a2:	74aa                	ld	s1,168(sp)
    802067a4:	790a                	ld	s2,160(sp)
    802067a6:	69ea                	ld	s3,152(sp)
    802067a8:	6a4a                	ld	s4,144(sp)
    802067aa:	6aaa                	ld	s5,136(sp)
    802067ac:	6b0a                	ld	s6,128(sp)
    802067ae:	7be6                	ld	s7,120(sp)
    802067b0:	7c46                	ld	s8,112(sp)
    802067b2:	7ca6                	ld	s9,104(sp)
    802067b4:	7d06                	ld	s10,96(sp)
    802067b6:	6de6                	ld	s11,88(sp)
    802067b8:	6129                	addi	sp,sp,192
    802067ba:	8082                	ret
        panic("emake: not dir");
    802067bc:	00003517          	auipc	a0,0x3
    802067c0:	68c50513          	addi	a0,a0,1676 # 80209e48 <digits+0xac8>
    802067c4:	ffffa097          	auipc	ra,0xffffa
    802067c8:	980080e7          	jalr	-1664(ra) # 80200144 <panic>
        panic("emake: not aligned");
    802067cc:	00003517          	auipc	a0,0x3
    802067d0:	68c50513          	addi	a0,a0,1676 # 80209e58 <digits+0xad8>
    802067d4:	ffffa097          	auipc	ra,0xffffa
    802067d8:	970080e7          	jalr	-1680(ra) # 80200144 <panic>
            strncpy(de.sne.name, "..         ", sizeof(de.sne.name));
    802067dc:	462d                	li	a2,11
    802067de:	00003597          	auipc	a1,0x3
    802067e2:	6a258593          	addi	a1,a1,1698 # 80209e80 <digits+0xb00>
    802067e6:	f7040513          	addi	a0,s0,-144
    802067ea:	ffffa097          	auipc	ra,0xffffa
    802067ee:	08c080e7          	jalr	140(ra) # 80200876 <strncpy>
    802067f2:	b7a5                	j	8020675a <emake+0x66>
        int entcnt = (strlen(ep->filename) + CHAR_LONG_NAME - 1) / CHAR_LONG_NAME;   // count of l-n-entries, rounds up
    802067f4:	896a                	mv	s2,s10
    802067f6:	856a                	mv	a0,s10
    802067f8:	ffffa097          	auipc	ra,0xffffa
    802067fc:	0ee080e7          	jalr	238(ra) # 802008e6 <strlen>
    80206800:	f4a43423          	sd	a0,-184(s0)
    80206804:	00c5071b          	addiw	a4,a0,12
    80206808:	47b5                	li	a5,13
    8020680a:	02f747bb          	divw	a5,a4,a5
    8020680e:	f4f42c23          	sw	a5,-168(s0)
    80206812:	00078d9b          	sext.w	s11,a5
        memset(shortname, 0, sizeof(shortname));
    80206816:	4631                	li	a2,12
    80206818:	4581                	li	a1,0
    8020681a:	f6040513          	addi	a0,s0,-160
    8020681e:	ffffa097          	auipc	ra,0xffffa
    80206822:	f44080e7          	jalr	-188(ra) # 80200762 <memset>
    for (int j = strlen(name) - 1; j >= 0; j--) {
    80206826:	856a                	mv	a0,s10
    80206828:	ffffa097          	auipc	ra,0xffffa
    8020682c:	0be080e7          	jalr	190(ra) # 802008e6 <strlen>
    80206830:	fff5079b          	addiw	a5,a0,-1
    80206834:	0207cf63          	bltz	a5,80206872 <emake+0x17e>
    80206838:	97ea                	add	a5,a5,s10
    8020683a:	ffed0693          	addi	a3,s10,-2
    8020683e:	96aa                	add	a3,a3,a0
    80206840:	fff5071b          	addiw	a4,a0,-1
    80206844:	1702                	slli	a4,a4,0x20
    80206846:	9301                	srli	a4,a4,0x20
    80206848:	8e99                	sub	a3,a3,a4
        if (name[j] == '.') {
    8020684a:	02e00613          	li	a2,46
    8020684e:	89be                	mv	s3,a5
    80206850:	0007c703          	lbu	a4,0(a5)
    80206854:	00c70663          	beq	a4,a2,80206860 <emake+0x16c>
    for (int j = strlen(name) - 1; j >= 0; j--) {
    80206858:	17fd                	addi	a5,a5,-1
    8020685a:	fed79ae3          	bne	a5,a3,8020684e <emake+0x15a>
    char c, *p = name;
    8020685e:	89ea                	mv	s3,s10
        shortname[i++] = c;
    80206860:	4481                	li	s1,0
        if (i == 8 && p) {
    80206862:	4aa1                	li	s5,8
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80206864:	4ba9                	li	s7,10
        if (c >= 'a' && c <= 'z') {
    80206866:	4c65                	li	s8,25
                memset(shortname + i, ' ', 8 - i);
    80206868:	f6040793          	addi	a5,s0,-160
    8020686c:	f4f43823          	sd	a5,-176(s0)
    80206870:	a8d9                	j	80206946 <emake+0x252>
    char c, *p = name;
    80206872:	89ea                	mv	s3,s10
    80206874:	b7f5                	j	80206860 <emake+0x16c>
        if (i == 8 && p) {
    80206876:	22098b63          	beqz	s3,80206aac <emake+0x3b8>
            if (p + 1 < name) { break; }            // no '.'
    8020687a:	0985                	addi	s3,s3,1
    8020687c:	0949fc63          	bgeu	s3,s4,80206914 <emake+0x220>
    80206880:	f6040793          	addi	a5,s0,-160
    80206884:	97a6                	add	a5,a5,s1
        shortname[i++] = ' ';
    80206886:	02000693          	li	a3,32
    while (i < CHAR_SHORT_NAME) {
    8020688a:	4729                	li	a4,10
        shortname[i++] = ' ';
    8020688c:	2485                	addiw	s1,s1,1
    8020688e:	00d78023          	sb	a3,0(a5)
    while (i < CHAR_SHORT_NAME) {
    80206892:	0785                	addi	a5,a5,1
    80206894:	fe975ce3          	bge	a4,s1,8020688c <emake+0x198>
        de.lne.checksum = cal_checksum((uchar *)shortname);
    80206898:	f6040513          	addi	a0,s0,-160
    8020689c:	00000097          	auipc	ra,0x0
    802068a0:	e2a080e7          	jalr	-470(ra) # 802066c6 <cal_checksum>
    802068a4:	f6a40ea3          	sb	a0,-131(s0)
        de.lne.attr = ATTR_LONG_NAME;
    802068a8:	47bd                	li	a5,15
    802068aa:	f6f40da3          	sb	a5,-133(s0)
        for (int i = entcnt; i > 0; i--) {
    802068ae:	f4843783          	ld	a5,-184(s0)
    802068b2:	14f05c63          	blez	a5,80206a0a <emake+0x316>
    802068b6:	f5842783          	lw	a5,-168(s0)
    802068ba:	37fd                	addiw	a5,a5,-1
    802068bc:	f4f42223          	sw	a5,-188(s0)
    802068c0:	00179b9b          	slliw	s7,a5,0x1
    802068c4:	00fb8bbb          	addw	s7,s7,a5
    802068c8:	002b9b9b          	slliw	s7,s7,0x2
    802068cc:	00fb8bbb          	addw	s7,s7,a5
    802068d0:	9bea                	add	s7,s7,s10
    802068d2:	8aee                	mv	s5,s11
    802068d4:	8c66                	mv	s8,s9
            int end = 0;
    802068d6:	4981                	li	s3,0
            uint8 *w = (uint8 *)de.lne.name1;
    802068d8:	f7140793          	addi	a5,s0,-143
    802068dc:	f4f43823          	sd	a5,-176(s0)
    802068e0:	0ff00913          	li	s2,255
                    case 5:     w = (uint8 *)de.lne.name2; break;
    802068e4:	f7e40793          	addi	a5,s0,-130
    802068e8:	f4f43c23          	sd	a5,-168(s0)
                switch (j) {
    802068ec:	44ad                	li	s1,11
    802068ee:	f8c40a13          	addi	s4,s0,-116
    802068f2:	a0c5                	j	802069d2 <emake+0x2de>
            if (name > p) {                    // last '.'
    802068f4:	0549f663          	bgeu	s3,s4,80206940 <emake+0x24c>
                memset(shortname + i, ' ', 8 - i);
    802068f8:	47a1                	li	a5,8
    802068fa:	4097863b          	subw	a2,a5,s1
    802068fe:	02000593          	li	a1,32
    80206902:	f5043783          	ld	a5,-176(s0)
    80206906:	00978533          	add	a0,a5,s1
    8020690a:	ffffa097          	auipc	ra,0xffffa
    8020690e:	e58080e7          	jalr	-424(ra) # 80200762 <memset>
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80206912:	89d2                	mv	s3,s4
        shortname[i++] = c;
    80206914:	8a4e                	mv	s4,s3
    80206916:	84d6                	mv	s1,s5
    80206918:	4981                	li	s3,0
    8020691a:	a02d                	j	80206944 <emake+0x250>
            if (strchr(illegal, c) != NULL) {
    8020691c:	85ca                	mv	a1,s2
    8020691e:	00006517          	auipc	a0,0x6
    80206922:	39250513          	addi	a0,a0,914 # 8020ccb0 <illegal.0>
    80206926:	ffffa097          	auipc	ra,0xffffa
    8020692a:	09a080e7          	jalr	154(ra) # 802009c0 <strchr>
    8020692e:	c119                	beqz	a0,80206934 <emake+0x240>
                c = '_';
    80206930:	05f00913          	li	s2,95
        shortname[i++] = c;
    80206934:	f9048793          	addi	a5,s1,-112
    80206938:	97a2                	add	a5,a5,s0
    8020693a:	fd278823          	sb	s2,-48(a5)
    8020693e:	2485                	addiw	s1,s1,1
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80206940:	f49bcce3          	blt	s7,s1,80206898 <emake+0x1a4>
        shortname[i++] = c;
    80206944:	8952                	mv	s2,s4
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80206946:	00190a13          	addi	s4,s2,1
    8020694a:	00094903          	lbu	s2,0(s2)
    8020694e:	02090663          	beqz	s2,8020697a <emake+0x286>
        if (i == 8 && p) {
    80206952:	f35482e3          	beq	s1,s5,80206876 <emake+0x182>
        if (c == ' ') { continue; }
    80206956:	02000793          	li	a5,32
    8020695a:	fef903e3          	beq	s2,a5,80206940 <emake+0x24c>
        if (c == '.') {
    8020695e:	02e00793          	li	a5,46
    80206962:	f8f909e3          	beq	s2,a5,802068f4 <emake+0x200>
        if (c >= 'a' && c <= 'z') {
    80206966:	f9f9079b          	addiw	a5,s2,-97
    8020696a:	0ff7f793          	zext.b	a5,a5
    8020696e:	fafc67e3          	bltu	s8,a5,8020691c <emake+0x228>
            c += 'A' - 'a';
    80206972:	3901                	addiw	s2,s2,-32
    80206974:	0ff97913          	zext.b	s2,s2
    80206978:	bf75                	j	80206934 <emake+0x240>
    while (i < CHAR_SHORT_NAME) {
    8020697a:	47a9                	li	a5,10
    8020697c:	f097d2e3          	bge	a5,s1,80206880 <emake+0x18c>
    80206980:	bf21                	j	80206898 <emake+0x1a4>
                de.lne.order |= LAST_LONG_ENTRY;
    80206982:	0407e793          	ori	a5,a5,64
    80206986:	f6f40823          	sb	a5,-144(s0)
    8020698a:	a891                	j	802069de <emake+0x2ea>
                    if ((*w++ = *p++) == 0) {
    8020698c:	00084603          	lbu	a2,0(a6)
                        end = 1;
    80206990:	00163513          	seqz	a0,a2
                    *w++ = 0;
    80206994:	00278893          	addi	a7,a5,2
                    if ((*w++ = *p++) == 0) {
    80206998:	0805                	addi	a6,a6,1
                    *w++ = 0;
    8020699a:	85ce                	mv	a1,s3
    8020699c:	a8d5                	j	80206a90 <emake+0x39c>
            uint off2 = reloc_clus(dp, off, 1);
    8020699e:	4605                	li	a2,1
    802069a0:	85e2                	mv	a1,s8
    802069a2:	855a                	mv	a0,s6
    802069a4:	fffff097          	auipc	ra,0xfffff
    802069a8:	460080e7          	jalr	1120(ra) # 80205e04 <reloc_clus>
            rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off2, sizeof(de));
    802069ac:	02000793          	li	a5,32
    802069b0:	0005071b          	sext.w	a4,a0
    802069b4:	f7040693          	addi	a3,s0,-144
    802069b8:	864e                	mv	a2,s3
    802069ba:	4585                	li	a1,1
    802069bc:	10cb2503          	lw	a0,268(s6)
    802069c0:	fffff097          	auipc	ra,0xfffff
    802069c4:	54c080e7          	jalr	1356(ra) # 80205f0c <rw_clus>
            off += sizeof(de);
    802069c8:	020c0c1b          	addiw	s8,s8,32
        for (int i = entcnt; i > 0; i--) {
    802069cc:	1bcd                	addi	s7,s7,-13
    802069ce:	03505163          	blez	s5,802069f0 <emake+0x2fc>
            if ((de.lne.order = i) == entcnt) {
    802069d2:	0ffaf793          	zext.b	a5,s5
    802069d6:	fafd86e3          	beq	s11,a5,80206982 <emake+0x28e>
    802069da:	f6f40823          	sb	a5,-144(s0)
            char *p = ep->filename + (i - 1) * CHAR_LONG_NAME;
    802069de:	3afd                	addiw	s5,s5,-1
    802069e0:	885e                	mv	a6,s7
    802069e2:	4709                	li	a4,2
            int end = 0;
    802069e4:	854e                	mv	a0,s3
            uint8 *w = (uint8 *)de.lne.name1;
    802069e6:	f5043783          	ld	a5,-176(s0)
                switch (j) {
    802069ea:	4315                	li	t1,5
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    802069ec:	4e35                	li	t3,13
    802069ee:	a851                	j	80206a82 <emake+0x38e>
    802069f0:	020c8c9b          	addiw	s9,s9,32
            off += sizeof(de);
    802069f4:	4781                	li	a5,0
    802069f6:	f4843703          	ld	a4,-184(s0)
    802069fa:	00e05663          	blez	a4,80206a06 <emake+0x312>
    802069fe:	f4442783          	lw	a5,-188(s0)
    80206a02:	0057979b          	slliw	a5,a5,0x5
    80206a06:	01978cbb          	addw	s9,a5,s9
        memset(&de, 0, sizeof(de));
    80206a0a:	02000613          	li	a2,32
    80206a0e:	4581                	li	a1,0
    80206a10:	f7040493          	addi	s1,s0,-144
    80206a14:	8526                	mv	a0,s1
    80206a16:	ffffa097          	auipc	ra,0xffffa
    80206a1a:	d4c080e7          	jalr	-692(ra) # 80200762 <memset>
        strncpy(de.sne.name, shortname, sizeof(de.sne.name));
    80206a1e:	462d                	li	a2,11
    80206a20:	f6040593          	addi	a1,s0,-160
    80206a24:	8526                	mv	a0,s1
    80206a26:	ffffa097          	auipc	ra,0xffffa
    80206a2a:	e50080e7          	jalr	-432(ra) # 80200876 <strncpy>
        de.sne.attr = ep->attribute;
    80206a2e:	100d4783          	lbu	a5,256(s10)
    80206a32:	f6f40da3          	sb	a5,-133(s0)
        de.sne.fst_clus_hi = (uint16)(ep->first_clus >> 16);      // first clus high 16 bits
    80206a36:	104d2783          	lw	a5,260(s10)
    80206a3a:	0107d71b          	srliw	a4,a5,0x10
    80206a3e:	f8e41223          	sh	a4,-124(s0)
        de.sne.fst_clus_lo = (uint16)(ep->first_clus & 0xffff);     // low 16 bits
    80206a42:	f8f41523          	sh	a5,-118(s0)
        de.sne.file_size = ep->file_size;                         // filesize is updated in eupdate()
    80206a46:	108d2783          	lw	a5,264(s10)
    80206a4a:	f8f42623          	sw	a5,-116(s0)
        off = reloc_clus(dp, off, 1);
    80206a4e:	4605                	li	a2,1
    80206a50:	85e6                	mv	a1,s9
    80206a52:	855a                	mv	a0,s6
    80206a54:	fffff097          	auipc	ra,0xfffff
    80206a58:	3b0080e7          	jalr	944(ra) # 80205e04 <reloc_clus>
        rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80206a5c:	02000793          	li	a5,32
    80206a60:	0005071b          	sext.w	a4,a0
    80206a64:	86a6                	mv	a3,s1
    80206a66:	4601                	li	a2,0
    80206a68:	4585                	li	a1,1
    80206a6a:	10cb2503          	lw	a0,268(s6)
    80206a6e:	fffff097          	auipc	ra,0xfffff
    80206a72:	49e080e7          	jalr	1182(ra) # 80205f0c <rw_clus>
}
    80206a76:	b325                	j	8020679e <emake+0xaa>
                    case 5:     w = (uint8 *)de.lne.name2; break;
    80206a78:	f5843783          	ld	a5,-168(s0)
    80206a7c:	a011                	j	80206a80 <emake+0x38c>
                switch (j) {
    80206a7e:	87d2                	mv	a5,s4
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    80206a80:	2705                	addiw	a4,a4,1
    80206a82:	fff7069b          	addiw	a3,a4,-1
                if (end) {
    80206a86:	d119                	beqz	a0,8020698c <emake+0x298>
                    *w++ = 0xff;
    80206a88:	00278893          	addi	a7,a5,2
    80206a8c:	864a                	mv	a2,s2
    80206a8e:	85ca                	mv	a1,s2
                    *w++ = 0xff;            // on k210, unaligned reading is illegal
    80206a90:	00c78023          	sb	a2,0(a5)
                    *w++ = 0xff;
    80206a94:	00b780a3          	sb	a1,1(a5)
                switch (j) {
    80206a98:	fe6680e3          	beq	a3,t1,80206a78 <emake+0x384>
    80206a9c:	fe9681e3          	beq	a3,s1,80206a7e <emake+0x38a>
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    80206aa0:	0007079b          	sext.w	a5,a4
    80206aa4:	eefe4de3          	blt	t3,a5,8020699e <emake+0x2aa>
    80206aa8:	87c6                	mv	a5,a7
    80206aaa:	bfd9                	j	80206a80 <emake+0x38c>
        if (c == ' ') { continue; }
    80206aac:	02000793          	li	a5,32
    80206ab0:	e8f90ae3          	beq	s2,a5,80206944 <emake+0x250>
        if (c == '.') {
    80206ab4:	02e00793          	li	a5,46
    80206ab8:	eaf917e3          	bne	s2,a5,80206966 <emake+0x272>
    80206abc:	bd35                	j	802068f8 <emake+0x204>

0000000080206abe <edup>:
{
    80206abe:	1101                	addi	sp,sp,-32
    80206ac0:	ec06                	sd	ra,24(sp)
    80206ac2:	e822                	sd	s0,16(sp)
    80206ac4:	e426                	sd	s1,8(sp)
    80206ac6:	1000                	addi	s0,sp,32
    80206ac8:	84aa                	mv	s1,a0
    if (entry != 0) {
    80206aca:	c515                	beqz	a0,80206af6 <edup+0x38>
        acquire(&ecache.lock);
    80206acc:	00019517          	auipc	a0,0x19
    80206ad0:	aec50513          	addi	a0,a0,-1300 # 8021f5b8 <ecache>
    80206ad4:	ffffa097          	auipc	ra,0xffffa
    80206ad8:	bf2080e7          	jalr	-1038(ra) # 802006c6 <acquire>
        entry->ref++;
    80206adc:	1184a783          	lw	a5,280(s1)
    80206ae0:	2785                	addiw	a5,a5,1
    80206ae2:	10f4ac23          	sw	a5,280(s1)
        release(&ecache.lock);
    80206ae6:	00019517          	auipc	a0,0x19
    80206aea:	ad250513          	addi	a0,a0,-1326 # 8021f5b8 <ecache>
    80206aee:	ffffa097          	auipc	ra,0xffffa
    80206af2:	c2c080e7          	jalr	-980(ra) # 8020071a <release>
}
    80206af6:	8526                	mv	a0,s1
    80206af8:	60e2                	ld	ra,24(sp)
    80206afa:	6442                	ld	s0,16(sp)
    80206afc:	64a2                	ld	s1,8(sp)
    80206afe:	6105                	addi	sp,sp,32
    80206b00:	8082                	ret

0000000080206b02 <eupdate>:
    if (!entry->dirty || entry->valid != 1) { return; }
    80206b02:	11554783          	lbu	a5,277(a0)
    80206b06:	c3e5                	beqz	a5,80206be6 <eupdate+0xe4>
{
    80206b08:	711d                	addi	sp,sp,-96
    80206b0a:	ec86                	sd	ra,88(sp)
    80206b0c:	e8a2                	sd	s0,80(sp)
    80206b0e:	e4a6                	sd	s1,72(sp)
    80206b10:	e0ca                	sd	s2,64(sp)
    80206b12:	fc4e                	sd	s3,56(sp)
    80206b14:	1080                	addi	s0,sp,96
    80206b16:	84aa                	mv	s1,a0
    if (!entry->dirty || entry->valid != 1) { return; }
    80206b18:	11651703          	lh	a4,278(a0)
    80206b1c:	4785                	li	a5,1
    80206b1e:	00f70963          	beq	a4,a5,80206b30 <eupdate+0x2e>
}
    80206b22:	60e6                	ld	ra,88(sp)
    80206b24:	6446                	ld	s0,80(sp)
    80206b26:	64a6                	ld	s1,72(sp)
    80206b28:	6906                	ld	s2,64(sp)
    80206b2a:	79e2                	ld	s3,56(sp)
    80206b2c:	6125                	addi	sp,sp,96
    80206b2e:	8082                	ret
    uint entcnt = 0;
    80206b30:	fc042623          	sw	zero,-52(s0)
    uint32 off = reloc_clus(entry->parent, entry->off, 0);
    80206b34:	4601                	li	a2,0
    80206b36:	11c52583          	lw	a1,284(a0)
    80206b3a:	12053503          	ld	a0,288(a0)
    80206b3e:	fffff097          	auipc	ra,0xfffff
    80206b42:	2c6080e7          	jalr	710(ra) # 80205e04 <reloc_clus>
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64) &entcnt, off, 1);
    80206b46:	1204b803          	ld	a6,288(s1)
    80206b4a:	4785                	li	a5,1
    80206b4c:	0005071b          	sext.w	a4,a0
    80206b50:	fcc40693          	addi	a3,s0,-52
    80206b54:	4601                	li	a2,0
    80206b56:	4581                	li	a1,0
    80206b58:	10c82503          	lw	a0,268(a6)
    80206b5c:	fffff097          	auipc	ra,0xfffff
    80206b60:	3b0080e7          	jalr	944(ra) # 80205f0c <rw_clus>
    entcnt &= ~LAST_LONG_ENTRY;
    80206b64:	fcc42583          	lw	a1,-52(s0)
    80206b68:	fbf5f593          	andi	a1,a1,-65
    80206b6c:	fcb42623          	sw	a1,-52(s0)
    off = reloc_clus(entry->parent, entry->off + (entcnt << 5), 0);
    80206b70:	0055959b          	slliw	a1,a1,0x5
    80206b74:	11c4a783          	lw	a5,284(s1)
    80206b78:	4601                	li	a2,0
    80206b7a:	9dbd                	addw	a1,a1,a5
    80206b7c:	1204b503          	ld	a0,288(s1)
    80206b80:	fffff097          	auipc	ra,0xfffff
    80206b84:	284080e7          	jalr	644(ra) # 80205e04 <reloc_clus>
    80206b88:	0005099b          	sext.w	s3,a0
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64)&de, off, sizeof(de));
    80206b8c:	1204b503          	ld	a0,288(s1)
    80206b90:	02000793          	li	a5,32
    80206b94:	874e                	mv	a4,s3
    80206b96:	fa840913          	addi	s2,s0,-88
    80206b9a:	86ca                	mv	a3,s2
    80206b9c:	4601                	li	a2,0
    80206b9e:	4581                	li	a1,0
    80206ba0:	10c52503          	lw	a0,268(a0)
    80206ba4:	fffff097          	auipc	ra,0xfffff
    80206ba8:	368080e7          	jalr	872(ra) # 80205f0c <rw_clus>
    de.sne.fst_clus_hi = (uint16)(entry->first_clus >> 16);
    80206bac:	1044a783          	lw	a5,260(s1)
    80206bb0:	0107d71b          	srliw	a4,a5,0x10
    80206bb4:	fae41e23          	sh	a4,-68(s0)
    de.sne.fst_clus_lo = (uint16)(entry->first_clus & 0xffff);
    80206bb8:	fcf41123          	sh	a5,-62(s0)
    de.sne.file_size = entry->file_size;
    80206bbc:	1084a783          	lw	a5,264(s1)
    80206bc0:	fcf42223          	sw	a5,-60(s0)
    rw_clus(entry->parent->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80206bc4:	1204b503          	ld	a0,288(s1)
    80206bc8:	02000793          	li	a5,32
    80206bcc:	874e                	mv	a4,s3
    80206bce:	86ca                	mv	a3,s2
    80206bd0:	4601                	li	a2,0
    80206bd2:	4585                	li	a1,1
    80206bd4:	10c52503          	lw	a0,268(a0)
    80206bd8:	fffff097          	auipc	ra,0xfffff
    80206bdc:	334080e7          	jalr	820(ra) # 80205f0c <rw_clus>
    entry->dirty = 0;
    80206be0:	10048aa3          	sb	zero,277(s1)
    80206be4:	bf3d                	j	80206b22 <eupdate+0x20>
    80206be6:	8082                	ret

0000000080206be8 <eremove>:
    if (entry->valid != 1) { return; }
    80206be8:	11651703          	lh	a4,278(a0)
    80206bec:	4785                	li	a5,1
    80206bee:	00f70363          	beq	a4,a5,80206bf4 <eremove+0xc>
    80206bf2:	8082                	ret
{
    80206bf4:	715d                	addi	sp,sp,-80
    80206bf6:	e486                	sd	ra,72(sp)
    80206bf8:	e0a2                	sd	s0,64(sp)
    80206bfa:	fc26                	sd	s1,56(sp)
    80206bfc:	f84a                	sd	s2,48(sp)
    80206bfe:	f44e                	sd	s3,40(sp)
    80206c00:	f052                	sd	s4,32(sp)
    80206c02:	ec56                	sd	s5,24(sp)
    80206c04:	0880                	addi	s0,sp,80
    80206c06:	89aa                	mv	s3,a0
    uint entcnt = 0;
    80206c08:	fa042e23          	sw	zero,-68(s0)
    uint32 off = entry->off;
    80206c0c:	11c52a03          	lw	s4,284(a0)
    uint32 off2 = reloc_clus(entry->parent, off, 0);
    80206c10:	4601                	li	a2,0
    80206c12:	85d2                	mv	a1,s4
    80206c14:	12053503          	ld	a0,288(a0)
    80206c18:	fffff097          	auipc	ra,0xfffff
    80206c1c:	1ec080e7          	jalr	492(ra) # 80205e04 <reloc_clus>
    80206c20:	0005049b          	sext.w	s1,a0
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64) &entcnt, off2, 1);
    80206c24:	1209b503          	ld	a0,288(s3)
    80206c28:	4785                	li	a5,1
    80206c2a:	8726                	mv	a4,s1
    80206c2c:	fbc40693          	addi	a3,s0,-68
    80206c30:	4601                	li	a2,0
    80206c32:	4581                	li	a1,0
    80206c34:	10c52503          	lw	a0,268(a0)
    80206c38:	fffff097          	auipc	ra,0xfffff
    80206c3c:	2d4080e7          	jalr	724(ra) # 80205f0c <rw_clus>
    entcnt &= ~LAST_LONG_ENTRY;
    80206c40:	fbc42783          	lw	a5,-68(s0)
    80206c44:	fbf7f793          	andi	a5,a5,-65
    80206c48:	faf42e23          	sw	a5,-68(s0)
    uint8 flag = EMPTY_ENTRY;
    80206c4c:	5795                	li	a5,-27
    80206c4e:	faf40da3          	sb	a5,-69(s0)
    for (int i = 0; i <= entcnt; i++) {
    80206c52:	4901                	li	s2,0
        rw_clus(entry->parent->cur_clus, 1, 0, (uint64) &flag, off2, 1);
    80206c54:	fbb40a93          	addi	s5,s0,-69
    80206c58:	1209b503          	ld	a0,288(s3)
    80206c5c:	4785                	li	a5,1
    80206c5e:	8726                	mv	a4,s1
    80206c60:	86d6                	mv	a3,s5
    80206c62:	4601                	li	a2,0
    80206c64:	4585                	li	a1,1
    80206c66:	10c52503          	lw	a0,268(a0)
    80206c6a:	fffff097          	auipc	ra,0xfffff
    80206c6e:	2a2080e7          	jalr	674(ra) # 80205f0c <rw_clus>
        off += 32;
    80206c72:	020a0a1b          	addiw	s4,s4,32
        off2 = reloc_clus(entry->parent, off, 0);
    80206c76:	4601                	li	a2,0
    80206c78:	85d2                	mv	a1,s4
    80206c7a:	1209b503          	ld	a0,288(s3)
    80206c7e:	fffff097          	auipc	ra,0xfffff
    80206c82:	186080e7          	jalr	390(ra) # 80205e04 <reloc_clus>
    80206c86:	0005049b          	sext.w	s1,a0
    for (int i = 0; i <= entcnt; i++) {
    80206c8a:	0019079b          	addiw	a5,s2,1
    80206c8e:	0007891b          	sext.w	s2,a5
    80206c92:	fbc42703          	lw	a4,-68(s0)
    80206c96:	fd2771e3          	bgeu	a4,s2,80206c58 <eremove+0x70>
    entry->valid = -1;
    80206c9a:	57fd                	li	a5,-1
    80206c9c:	10f99b23          	sh	a5,278(s3)
}
    80206ca0:	60a6                	ld	ra,72(sp)
    80206ca2:	6406                	ld	s0,64(sp)
    80206ca4:	74e2                	ld	s1,56(sp)
    80206ca6:	7942                	ld	s2,48(sp)
    80206ca8:	79a2                	ld	s3,40(sp)
    80206caa:	7a02                	ld	s4,32(sp)
    80206cac:	6ae2                	ld	s5,24(sp)
    80206cae:	6161                	addi	sp,sp,80
    80206cb0:	8082                	ret

0000000080206cb2 <etrunc>:
{
    80206cb2:	7179                	addi	sp,sp,-48
    80206cb4:	f406                	sd	ra,40(sp)
    80206cb6:	f022                	sd	s0,32(sp)
    80206cb8:	ec26                	sd	s1,24(sp)
    80206cba:	e84a                	sd	s2,16(sp)
    80206cbc:	e44e                	sd	s3,8(sp)
    80206cbe:	e052                	sd	s4,0(sp)
    80206cc0:	1800                	addi	s0,sp,48
    80206cc2:	8a2a                	mv	s4,a0
    for (uint32 clus = entry->first_clus; clus >= 2 && clus < FAT32_EOC; ) {
    80206cc4:	10452483          	lw	s1,260(a0)
    80206cc8:	ffe4871b          	addiw	a4,s1,-2
    80206ccc:	100007b7          	lui	a5,0x10000
    80206cd0:	17d5                	addi	a5,a5,-11 # ffffff5 <_entry-0x7020000b>
    80206cd2:	02e7e663          	bltu	a5,a4,80206cfe <etrunc+0x4c>
    80206cd6:	89be                	mv	s3,a5
        uint32 next = read_fat(clus);
    80206cd8:	0004891b          	sext.w	s2,s1
    80206cdc:	8526                	mv	a0,s1
    80206cde:	fffff097          	auipc	ra,0xfffff
    80206ce2:	eee080e7          	jalr	-274(ra) # 80205bcc <read_fat>
    80206ce6:	0005049b          	sext.w	s1,a0
    write_fat(cluster, 0);
    80206cea:	4581                	li	a1,0
    80206cec:	854a                	mv	a0,s2
    80206cee:	fffff097          	auipc	ra,0xfffff
    80206cf2:	096080e7          	jalr	150(ra) # 80205d84 <write_fat>
    for (uint32 clus = entry->first_clus; clus >= 2 && clus < FAT32_EOC; ) {
    80206cf6:	ffe4879b          	addiw	a5,s1,-2
    80206cfa:	fcf9ffe3          	bgeu	s3,a5,80206cd8 <etrunc+0x26>
    entry->file_size = 0;
    80206cfe:	100a2423          	sw	zero,264(s4)
    entry->first_clus = 0;
    80206d02:	100a2223          	sw	zero,260(s4)
    entry->dirty = 1;
    80206d06:	4785                	li	a5,1
    80206d08:	10fa0aa3          	sb	a5,277(s4)
}
    80206d0c:	70a2                	ld	ra,40(sp)
    80206d0e:	7402                	ld	s0,32(sp)
    80206d10:	64e2                	ld	s1,24(sp)
    80206d12:	6942                	ld	s2,16(sp)
    80206d14:	69a2                	ld	s3,8(sp)
    80206d16:	6a02                	ld	s4,0(sp)
    80206d18:	6145                	addi	sp,sp,48
    80206d1a:	8082                	ret

0000000080206d1c <elock>:
{
    80206d1c:	1141                	addi	sp,sp,-16
    80206d1e:	e406                	sd	ra,8(sp)
    80206d20:	e022                	sd	s0,0(sp)
    80206d22:	0800                	addi	s0,sp,16
    if (entry == 0 || entry->ref < 1)
    80206d24:	cd19                	beqz	a0,80206d42 <elock+0x26>
    80206d26:	11852783          	lw	a5,280(a0)
    80206d2a:	00f05c63          	blez	a5,80206d42 <elock+0x26>
    acquiresleep(&entry->lock);
    80206d2e:	13850513          	addi	a0,a0,312
    80206d32:	ffffd097          	auipc	ra,0xffffd
    80206d36:	ec6080e7          	jalr	-314(ra) # 80203bf8 <acquiresleep>
}
    80206d3a:	60a2                	ld	ra,8(sp)
    80206d3c:	6402                	ld	s0,0(sp)
    80206d3e:	0141                	addi	sp,sp,16
    80206d40:	8082                	ret
        panic("elock");
    80206d42:	00003517          	auipc	a0,0x3
    80206d46:	14e50513          	addi	a0,a0,334 # 80209e90 <digits+0xb10>
    80206d4a:	ffff9097          	auipc	ra,0xffff9
    80206d4e:	3fa080e7          	jalr	1018(ra) # 80200144 <panic>

0000000080206d52 <eunlock>:
{
    80206d52:	1101                	addi	sp,sp,-32
    80206d54:	ec06                	sd	ra,24(sp)
    80206d56:	e822                	sd	s0,16(sp)
    80206d58:	e426                	sd	s1,8(sp)
    80206d5a:	e04a                	sd	s2,0(sp)
    80206d5c:	1000                	addi	s0,sp,32
    if (entry == 0 || !holdingsleep(&entry->lock) || entry->ref < 1)
    80206d5e:	c90d                	beqz	a0,80206d90 <eunlock+0x3e>
    80206d60:	84aa                	mv	s1,a0
    80206d62:	13850913          	addi	s2,a0,312
    80206d66:	854a                	mv	a0,s2
    80206d68:	ffffd097          	auipc	ra,0xffffd
    80206d6c:	f2a080e7          	jalr	-214(ra) # 80203c92 <holdingsleep>
    80206d70:	c105                	beqz	a0,80206d90 <eunlock+0x3e>
    80206d72:	1184a783          	lw	a5,280(s1)
    80206d76:	00f05d63          	blez	a5,80206d90 <eunlock+0x3e>
    releasesleep(&entry->lock);
    80206d7a:	854a                	mv	a0,s2
    80206d7c:	ffffd097          	auipc	ra,0xffffd
    80206d80:	ed2080e7          	jalr	-302(ra) # 80203c4e <releasesleep>
}
    80206d84:	60e2                	ld	ra,24(sp)
    80206d86:	6442                	ld	s0,16(sp)
    80206d88:	64a2                	ld	s1,8(sp)
    80206d8a:	6902                	ld	s2,0(sp)
    80206d8c:	6105                	addi	sp,sp,32
    80206d8e:	8082                	ret
        panic("eunlock");
    80206d90:	00003517          	auipc	a0,0x3
    80206d94:	10850513          	addi	a0,a0,264 # 80209e98 <digits+0xb18>
    80206d98:	ffff9097          	auipc	ra,0xffff9
    80206d9c:	3ac080e7          	jalr	940(ra) # 80200144 <panic>

0000000080206da0 <eput>:
{
    80206da0:	1101                	addi	sp,sp,-32
    80206da2:	ec06                	sd	ra,24(sp)
    80206da4:	e822                	sd	s0,16(sp)
    80206da6:	e426                	sd	s1,8(sp)
    80206da8:	e04a                	sd	s2,0(sp)
    80206daa:	1000                	addi	s0,sp,32
    80206dac:	84aa                	mv	s1,a0
    acquire(&ecache.lock);
    80206dae:	00019517          	auipc	a0,0x19
    80206db2:	80a50513          	addi	a0,a0,-2038 # 8021f5b8 <ecache>
    80206db6:	ffffa097          	auipc	ra,0xffffa
    80206dba:	910080e7          	jalr	-1776(ra) # 802006c6 <acquire>
    if (entry != &root && entry->valid != 0 && entry->ref == 1) {
    80206dbe:	00018797          	auipc	a5,0x18
    80206dc2:	69278793          	addi	a5,a5,1682 # 8021f450 <root>
    80206dc6:	00f48a63          	beq	s1,a5,80206dda <eput+0x3a>
    80206dca:	11649783          	lh	a5,278(s1)
    80206dce:	c791                	beqz	a5,80206dda <eput+0x3a>
    80206dd0:	1184a703          	lw	a4,280(s1)
    80206dd4:	4785                	li	a5,1
    80206dd6:	02f70563          	beq	a4,a5,80206e00 <eput+0x60>
    entry->ref--;
    80206dda:	1184a783          	lw	a5,280(s1)
    80206dde:	37fd                	addiw	a5,a5,-1
    80206de0:	10f4ac23          	sw	a5,280(s1)
    release(&ecache.lock);
    80206de4:	00018517          	auipc	a0,0x18
    80206de8:	7d450513          	addi	a0,a0,2004 # 8021f5b8 <ecache>
    80206dec:	ffffa097          	auipc	ra,0xffffa
    80206df0:	92e080e7          	jalr	-1746(ra) # 8020071a <release>
}
    80206df4:	60e2                	ld	ra,24(sp)
    80206df6:	6442                	ld	s0,16(sp)
    80206df8:	64a2                	ld	s1,8(sp)
    80206dfa:	6902                	ld	s2,0(sp)
    80206dfc:	6105                	addi	sp,sp,32
    80206dfe:	8082                	ret
        acquiresleep(&entry->lock);
    80206e00:	13848913          	addi	s2,s1,312
    80206e04:	854a                	mv	a0,s2
    80206e06:	ffffd097          	auipc	ra,0xffffd
    80206e0a:	df2080e7          	jalr	-526(ra) # 80203bf8 <acquiresleep>
        entry->next->prev = entry->prev;
    80206e0e:	1284b703          	ld	a4,296(s1)
    80206e12:	1304b783          	ld	a5,304(s1)
    80206e16:	12f73823          	sd	a5,304(a4)
        entry->prev->next = entry->next;
    80206e1a:	1284b703          	ld	a4,296(s1)
    80206e1e:	12e7b423          	sd	a4,296(a5)
        entry->next = root.next;
    80206e22:	00018797          	auipc	a5,0x18
    80206e26:	60678793          	addi	a5,a5,1542 # 8021f428 <fat>
    80206e2a:	1507b703          	ld	a4,336(a5)
    80206e2e:	12e4b423          	sd	a4,296(s1)
        entry->prev = &root;
    80206e32:	00018697          	auipc	a3,0x18
    80206e36:	61e68693          	addi	a3,a3,1566 # 8021f450 <root>
    80206e3a:	12d4b823          	sd	a3,304(s1)
        root.next->prev = entry;
    80206e3e:	12973823          	sd	s1,304(a4)
        root.next = entry;
    80206e42:	1497b823          	sd	s1,336(a5)
        release(&ecache.lock);
    80206e46:	00018517          	auipc	a0,0x18
    80206e4a:	77250513          	addi	a0,a0,1906 # 8021f5b8 <ecache>
    80206e4e:	ffffa097          	auipc	ra,0xffffa
    80206e52:	8cc080e7          	jalr	-1844(ra) # 8020071a <release>
        if (entry->valid == -1) {       // this means some one has called eremove()
    80206e56:	11649703          	lh	a4,278(s1)
    80206e5a:	57fd                	li	a5,-1
    80206e5c:	06f70863          	beq	a4,a5,80206ecc <eput+0x12c>
            elock(entry->parent);
    80206e60:	1204b503          	ld	a0,288(s1)
    80206e64:	00000097          	auipc	ra,0x0
    80206e68:	eb8080e7          	jalr	-328(ra) # 80206d1c <elock>
            eupdate(entry);
    80206e6c:	8526                	mv	a0,s1
    80206e6e:	00000097          	auipc	ra,0x0
    80206e72:	c94080e7          	jalr	-876(ra) # 80206b02 <eupdate>
            eunlock(entry->parent);
    80206e76:	1204b503          	ld	a0,288(s1)
    80206e7a:	00000097          	auipc	ra,0x0
    80206e7e:	ed8080e7          	jalr	-296(ra) # 80206d52 <eunlock>
        releasesleep(&entry->lock);
    80206e82:	854a                	mv	a0,s2
    80206e84:	ffffd097          	auipc	ra,0xffffd
    80206e88:	dca080e7          	jalr	-566(ra) # 80203c4e <releasesleep>
        struct dirent *eparent = entry->parent;
    80206e8c:	1204b903          	ld	s2,288(s1)
        acquire(&ecache.lock);
    80206e90:	00018517          	auipc	a0,0x18
    80206e94:	72850513          	addi	a0,a0,1832 # 8021f5b8 <ecache>
    80206e98:	ffffa097          	auipc	ra,0xffffa
    80206e9c:	82e080e7          	jalr	-2002(ra) # 802006c6 <acquire>
        entry->ref--;
    80206ea0:	1184a783          	lw	a5,280(s1)
    80206ea4:	37fd                	addiw	a5,a5,-1
    80206ea6:	10f4ac23          	sw	a5,280(s1)
        release(&ecache.lock);
    80206eaa:	00018517          	auipc	a0,0x18
    80206eae:	70e50513          	addi	a0,a0,1806 # 8021f5b8 <ecache>
    80206eb2:	ffffa097          	auipc	ra,0xffffa
    80206eb6:	868080e7          	jalr	-1944(ra) # 8020071a <release>
        if (entry->ref == 0) {
    80206eba:	1184a783          	lw	a5,280(s1)
    80206ebe:	fb9d                	bnez	a5,80206df4 <eput+0x54>
            eput(eparent);
    80206ec0:	854a                	mv	a0,s2
    80206ec2:	00000097          	auipc	ra,0x0
    80206ec6:	ede080e7          	jalr	-290(ra) # 80206da0 <eput>
    80206eca:	b72d                	j	80206df4 <eput+0x54>
            etrunc(entry);
    80206ecc:	8526                	mv	a0,s1
    80206ece:	00000097          	auipc	ra,0x0
    80206ed2:	de4080e7          	jalr	-540(ra) # 80206cb2 <etrunc>
    80206ed6:	b775                	j	80206e82 <eput+0xe2>

0000000080206ed8 <estat>:
{
    80206ed8:	1101                	addi	sp,sp,-32
    80206eda:	ec06                	sd	ra,24(sp)
    80206edc:	e822                	sd	s0,16(sp)
    80206ede:	e426                	sd	s1,8(sp)
    80206ee0:	e04a                	sd	s2,0(sp)
    80206ee2:	1000                	addi	s0,sp,32
    80206ee4:	892a                	mv	s2,a0
    80206ee6:	84ae                	mv	s1,a1
    strncpy(st->name, de->filename, STAT_MAX_NAME);
    80206ee8:	02000613          	li	a2,32
    80206eec:	85aa                	mv	a1,a0
    80206eee:	8526                	mv	a0,s1
    80206ef0:	ffffa097          	auipc	ra,0xffffa
    80206ef4:	986080e7          	jalr	-1658(ra) # 80200876 <strncpy>
    st->type = (de->attribute & ATTR_DIRECTORY) ? T_DIR : T_FILE;
    80206ef8:	10094783          	lbu	a5,256(s2)
    80206efc:	8bc1                	andi	a5,a5,16
    80206efe:	0017b793          	seqz	a5,a5
    80206f02:	0785                	addi	a5,a5,1
    80206f04:	02f49423          	sh	a5,40(s1)
    st->dev = de->dev;
    80206f08:	11494783          	lbu	a5,276(s2)
    80206f0c:	d0dc                	sw	a5,36(s1)
    st->size = de->file_size;
    80206f0e:	10896783          	lwu	a5,264(s2)
    80206f12:	f89c                	sd	a5,48(s1)
}
    80206f14:	60e2                	ld	ra,24(sp)
    80206f16:	6442                	ld	s0,16(sp)
    80206f18:	64a2                	ld	s1,8(sp)
    80206f1a:	6902                	ld	s2,0(sp)
    80206f1c:	6105                	addi	sp,sp,32
    80206f1e:	8082                	ret

0000000080206f20 <enext>:
{
    80206f20:	7119                	addi	sp,sp,-128
    80206f22:	fc86                	sd	ra,120(sp)
    80206f24:	f8a2                	sd	s0,112(sp)
    80206f26:	f4a6                	sd	s1,104(sp)
    80206f28:	f0ca                	sd	s2,96(sp)
    80206f2a:	ecce                	sd	s3,88(sp)
    80206f2c:	e8d2                	sd	s4,80(sp)
    80206f2e:	e4d6                	sd	s5,72(sp)
    80206f30:	e0da                	sd	s6,64(sp)
    80206f32:	fc5e                	sd	s7,56(sp)
    80206f34:	f862                	sd	s8,48(sp)
    80206f36:	f466                	sd	s9,40(sp)
    80206f38:	0100                	addi	s0,sp,128
    if (!(dp->attribute & ATTR_DIRECTORY))
    80206f3a:	10054783          	lbu	a5,256(a0)
    80206f3e:	8bc1                	andi	a5,a5,16
    80206f40:	cf95                	beqz	a5,80206f7c <enext+0x5c>
    80206f42:	892a                	mv	s2,a0
    80206f44:	89ae                	mv	s3,a1
    80206f46:	84b2                	mv	s1,a2
    80206f48:	8ab6                	mv	s5,a3
    if (ep->valid)
    80206f4a:	11659783          	lh	a5,278(a1)
    80206f4e:	ef9d                	bnez	a5,80206f8c <enext+0x6c>
    if (off % 32)
    80206f50:	01f67793          	andi	a5,a2,31
    80206f54:	e7a1                	bnez	a5,80206f9c <enext+0x7c>
    if (dp->valid != 1) { return -1; }
    80206f56:	11651703          	lh	a4,278(a0)
    80206f5a:	4785                	li	a5,1
    80206f5c:	557d                	li	a0,-1
    80206f5e:	04f70763          	beq	a4,a5,80206fac <enext+0x8c>
}
    80206f62:	70e6                	ld	ra,120(sp)
    80206f64:	7446                	ld	s0,112(sp)
    80206f66:	74a6                	ld	s1,104(sp)
    80206f68:	7906                	ld	s2,96(sp)
    80206f6a:	69e6                	ld	s3,88(sp)
    80206f6c:	6a46                	ld	s4,80(sp)
    80206f6e:	6aa6                	ld	s5,72(sp)
    80206f70:	6b06                	ld	s6,64(sp)
    80206f72:	7be2                	ld	s7,56(sp)
    80206f74:	7c42                	ld	s8,48(sp)
    80206f76:	7ca2                	ld	s9,40(sp)
    80206f78:	6109                	addi	sp,sp,128
    80206f7a:	8082                	ret
        panic("enext not dir");
    80206f7c:	00003517          	auipc	a0,0x3
    80206f80:	f2450513          	addi	a0,a0,-220 # 80209ea0 <digits+0xb20>
    80206f84:	ffff9097          	auipc	ra,0xffff9
    80206f88:	1c0080e7          	jalr	448(ra) # 80200144 <panic>
        panic("enext ep valid");
    80206f8c:	00003517          	auipc	a0,0x3
    80206f90:	f2450513          	addi	a0,a0,-220 # 80209eb0 <digits+0xb30>
    80206f94:	ffff9097          	auipc	ra,0xffff9
    80206f98:	1b0080e7          	jalr	432(ra) # 80200144 <panic>
        panic("enext not align");
    80206f9c:	00003517          	auipc	a0,0x3
    80206fa0:	f2450513          	addi	a0,a0,-220 # 80209ec0 <digits+0xb40>
    80206fa4:	ffff9097          	auipc	ra,0xffff9
    80206fa8:	1a0080e7          	jalr	416(ra) # 80200144 <panic>
    memset(ep->filename, 0, FAT32_MAX_FILENAME + 1);
    80206fac:	10000613          	li	a2,256
    80206fb0:	4581                	li	a1,0
    80206fb2:	854e                	mv	a0,s3
    80206fb4:	ffff9097          	auipc	ra,0xffff9
    80206fb8:	7ae080e7          	jalr	1966(ra) # 80200762 <memset>
    int cnt = 0;
    80206fbc:	4b01                	li	s6,0
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    80206fbe:	5bfd                	li	s7,-1
        if (rw_clus(dp->cur_clus, 0, 0, (uint64)&de, off2, 32) != 32 || de.lne.order == END_OF_ENTRY) {
    80206fc0:	f8040a13          	addi	s4,s0,-128
        if (de.lne.order == EMPTY_ENTRY) {
    80206fc4:	0e500c13          	li	s8,229
        if (de.lne.attr == ATTR_LONG_NAME) {
    80206fc8:	4cbd                	li	s9,15
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    80206fca:	a03d                	j	80206ff8 <enext+0xd8>
            cnt++;
    80206fcc:	2b05                	addiw	s6,s6,1
            continue;
    80206fce:	a01d                	j	80206ff4 <enext+0xd4>
            *count = cnt;
    80206fd0:	016aa023          	sw	s6,0(s5)
            return 0;
    80206fd4:	4501                	li	a0,0
    80206fd6:	b771                	j	80206f62 <enext+0x42>
            read_entry_name(ep->filename + (lcnt - 1) * CHAR_LONG_NAME, &de);
    80206fd8:	fff7079b          	addiw	a5,a4,-1
    80206fdc:	0017951b          	slliw	a0,a5,0x1
    80206fe0:	9d3d                	addw	a0,a0,a5
    80206fe2:	0025151b          	slliw	a0,a0,0x2
    80206fe6:	9d3d                	addw	a0,a0,a5
    80206fe8:	85d2                	mv	a1,s4
    80206fea:	954e                	add	a0,a0,s3
    80206fec:	fffff097          	auipc	ra,0xfffff
    80206ff0:	17a080e7          	jalr	378(ra) # 80206166 <read_entry_name>
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    80206ff4:	0204849b          	addiw	s1,s1,32
    80206ff8:	4601                	li	a2,0
    80206ffa:	85a6                	mv	a1,s1
    80206ffc:	854a                	mv	a0,s2
    80206ffe:	fffff097          	auipc	ra,0xfffff
    80207002:	e06080e7          	jalr	-506(ra) # 80205e04 <reloc_clus>
    80207006:	f5750ee3          	beq	a0,s7,80206f62 <enext+0x42>
        if (rw_clus(dp->cur_clus, 0, 0, (uint64)&de, off2, 32) != 32 || de.lne.order == END_OF_ENTRY) {
    8020700a:	02000793          	li	a5,32
    8020700e:	0005071b          	sext.w	a4,a0
    80207012:	86d2                	mv	a3,s4
    80207014:	4601                	li	a2,0
    80207016:	4581                	li	a1,0
    80207018:	10c92503          	lw	a0,268(s2)
    8020701c:	fffff097          	auipc	ra,0xfffff
    80207020:	ef0080e7          	jalr	-272(ra) # 80205f0c <rw_clus>
    80207024:	2501                	sext.w	a0,a0
    80207026:	02000793          	li	a5,32
    8020702a:	06f51c63          	bne	a0,a5,802070a2 <enext+0x182>
    8020702e:	f8044783          	lbu	a5,-128(s0)
    80207032:	cbb5                	beqz	a5,802070a6 <enext+0x186>
        if (de.lne.order == EMPTY_ENTRY) {
    80207034:	f9878ce3          	beq	a5,s8,80206fcc <enext+0xac>
        } else if (cnt) {
    80207038:	f80b1ce3          	bnez	s6,80206fd0 <enext+0xb0>
        if (de.lne.attr == ATTR_LONG_NAME) {
    8020703c:	f8b44703          	lbu	a4,-117(s0)
    80207040:	01971d63          	bne	a4,s9,8020705a <enext+0x13a>
            int lcnt = de.lne.order & ~LAST_LONG_ENTRY;
    80207044:	0bf7f713          	andi	a4,a5,191
            if (de.lne.order & LAST_LONG_ENTRY) {
    80207048:	0407f793          	andi	a5,a5,64
    8020704c:	d7d1                	beqz	a5,80206fd8 <enext+0xb8>
                *count = lcnt + 1;                              // plus the s-n-e;
    8020704e:	0017079b          	addiw	a5,a4,1
    80207052:	00faa023          	sw	a5,0(s5)
                count = 0;
    80207056:	4a81                	li	s5,0
    80207058:	b741                	j	80206fd8 <enext+0xb8>
            if (count) {
    8020705a:	000a8c63          	beqz	s5,80207072 <enext+0x152>
                *count = 1;
    8020705e:	4785                	li	a5,1
    80207060:	00faa023          	sw	a5,0(s5)
                read_entry_name(ep->filename, &de);
    80207064:	f8040593          	addi	a1,s0,-128
    80207068:	854e                	mv	a0,s3
    8020706a:	fffff097          	auipc	ra,0xfffff
    8020706e:	0fc080e7          	jalr	252(ra) # 80206166 <read_entry_name>
    entry->attribute = d->sne.attr;
    80207072:	f8b44783          	lbu	a5,-117(s0)
    80207076:	10f98023          	sb	a5,256(s3)
    entry->first_clus = ((uint32)d->sne.fst_clus_hi << 16) | d->sne.fst_clus_lo;
    8020707a:	f9445783          	lhu	a5,-108(s0)
    8020707e:	0107979b          	slliw	a5,a5,0x10
    80207082:	f9a45703          	lhu	a4,-102(s0)
    80207086:	8fd9                	or	a5,a5,a4
    80207088:	2781                	sext.w	a5,a5
    8020708a:	10f9a223          	sw	a5,260(s3)
    entry->file_size = d->sne.file_size;
    8020708e:	f9c42703          	lw	a4,-100(s0)
    80207092:	10e9a423          	sw	a4,264(s3)
    entry->cur_clus = entry->first_clus;
    80207096:	10f9a623          	sw	a5,268(s3)
    entry->clus_cnt = 0;
    8020709a:	1009a823          	sw	zero,272(s3)
            return 1;
    8020709e:	4505                	li	a0,1
}
    802070a0:	b5c9                	j	80206f62 <enext+0x42>
            return -1;
    802070a2:	557d                	li	a0,-1
    802070a4:	bd7d                	j	80206f62 <enext+0x42>
    802070a6:	557d                	li	a0,-1
    802070a8:	bd6d                	j	80206f62 <enext+0x42>

00000000802070aa <dirlookup>:
{
    802070aa:	711d                	addi	sp,sp,-96
    802070ac:	ec86                	sd	ra,88(sp)
    802070ae:	e8a2                	sd	s0,80(sp)
    802070b0:	e4a6                	sd	s1,72(sp)
    802070b2:	e0ca                	sd	s2,64(sp)
    802070b4:	fc4e                	sd	s3,56(sp)
    802070b6:	f852                	sd	s4,48(sp)
    802070b8:	f456                	sd	s5,40(sp)
    802070ba:	f05a                	sd	s6,32(sp)
    802070bc:	ec5e                	sd	s7,24(sp)
    802070be:	1080                	addi	s0,sp,96
    if (!(dp->attribute & ATTR_DIRECTORY))
    802070c0:	10054783          	lbu	a5,256(a0)
    802070c4:	8bc1                	andi	a5,a5,16
    802070c6:	cbb1                	beqz	a5,8020711a <dirlookup+0x70>
    802070c8:	84aa                	mv	s1,a0
    802070ca:	89ae                	mv	s3,a1
    802070cc:	8ab2                	mv	s5,a2
    if (strncmp(filename, ".", FAT32_MAX_FILENAME) == 0) {
    802070ce:	0ff00613          	li	a2,255
    802070d2:	00003597          	auipc	a1,0x3
    802070d6:	e1658593          	addi	a1,a1,-490 # 80209ee8 <digits+0xb68>
    802070da:	854e                	mv	a0,s3
    802070dc:	ffff9097          	auipc	ra,0xffff9
    802070e0:	75e080e7          	jalr	1886(ra) # 8020083a <strncmp>
    802070e4:	c139                	beqz	a0,8020712a <dirlookup+0x80>
    } else if (strncmp(filename, "..", FAT32_MAX_FILENAME) == 0) {
    802070e6:	0ff00613          	li	a2,255
    802070ea:	00003597          	auipc	a1,0x3
    802070ee:	e0658593          	addi	a1,a1,-506 # 80209ef0 <digits+0xb70>
    802070f2:	854e                	mv	a0,s3
    802070f4:	ffff9097          	auipc	ra,0xffff9
    802070f8:	746080e7          	jalr	1862(ra) # 8020083a <strncmp>
    802070fc:	e125                	bnez	a0,8020715c <dirlookup+0xb2>
        if (dp == &root) {
    802070fe:	00018797          	auipc	a5,0x18
    80207102:	35278793          	addi	a5,a5,850 # 8021f450 <root>
    80207106:	04f48463          	beq	s1,a5,8020714e <dirlookup+0xa4>
        return edup(dp->parent);
    8020710a:	1204b503          	ld	a0,288(s1)
    8020710e:	00000097          	auipc	ra,0x0
    80207112:	9b0080e7          	jalr	-1616(ra) # 80206abe <edup>
    80207116:	892a                	mv	s2,a0
    80207118:	a839                	j	80207136 <dirlookup+0x8c>
        panic("dirlookup not DIR");
    8020711a:	00003517          	auipc	a0,0x3
    8020711e:	db650513          	addi	a0,a0,-586 # 80209ed0 <digits+0xb50>
    80207122:	ffff9097          	auipc	ra,0xffff9
    80207126:	022080e7          	jalr	34(ra) # 80200144 <panic>
        return edup(dp);
    8020712a:	8526                	mv	a0,s1
    8020712c:	00000097          	auipc	ra,0x0
    80207130:	992080e7          	jalr	-1646(ra) # 80206abe <edup>
    80207134:	892a                	mv	s2,a0
}
    80207136:	854a                	mv	a0,s2
    80207138:	60e6                	ld	ra,88(sp)
    8020713a:	6446                	ld	s0,80(sp)
    8020713c:	64a6                	ld	s1,72(sp)
    8020713e:	6906                	ld	s2,64(sp)
    80207140:	79e2                	ld	s3,56(sp)
    80207142:	7a42                	ld	s4,48(sp)
    80207144:	7aa2                	ld	s5,40(sp)
    80207146:	7b02                	ld	s6,32(sp)
    80207148:	6be2                	ld	s7,24(sp)
    8020714a:	6125                	addi	sp,sp,96
    8020714c:	8082                	ret
            return edup(&root);
    8020714e:	853e                	mv	a0,a5
    80207150:	00000097          	auipc	ra,0x0
    80207154:	96e080e7          	jalr	-1682(ra) # 80206abe <edup>
    80207158:	892a                	mv	s2,a0
    8020715a:	bff1                	j	80207136 <dirlookup+0x8c>
    if (dp->valid != 1) {
    8020715c:	11649703          	lh	a4,278(s1)
    80207160:	4785                	li	a5,1
        return NULL;
    80207162:	4901                	li	s2,0
    if (dp->valid != 1) {
    80207164:	fcf719e3          	bne	a4,a5,80207136 <dirlookup+0x8c>
    struct dirent *ep = eget(dp, filename);
    80207168:	85ce                	mv	a1,s3
    8020716a:	8526                	mv	a0,s1
    8020716c:	fffff097          	auipc	ra,0xfffff
    80207170:	eec080e7          	jalr	-276(ra) # 80206058 <eget>
    80207174:	892a                	mv	s2,a0
    if (ep->valid == 1) { return ep; }                               // ecache hits
    80207176:	11651703          	lh	a4,278(a0)
    8020717a:	4785                	li	a5,1
    8020717c:	faf70de3          	beq	a4,a5,80207136 <dirlookup+0x8c>
    int len = strlen(filename);
    80207180:	854e                	mv	a0,s3
    80207182:	ffff9097          	auipc	ra,0xffff9
    80207186:	764080e7          	jalr	1892(ra) # 802008e6 <strlen>
    int count = 0;
    8020718a:	fa042623          	sw	zero,-84(s0)
    reloc_clus(dp, 0, 0);
    8020718e:	4601                	li	a2,0
    80207190:	4581                	li	a1,0
    80207192:	8526                	mv	a0,s1
    80207194:	fffff097          	auipc	ra,0xfffff
    80207198:	c70080e7          	jalr	-912(ra) # 80205e04 <reloc_clus>
    uint off = 0;
    8020719c:	4a01                	li	s4,0
    while ((type = enext(dp, ep, off, &count) != -1)) {
    8020719e:	fac40b93          	addi	s7,s0,-84
    802071a2:	5b7d                	li	s6,-1
    802071a4:	86de                	mv	a3,s7
    802071a6:	8652                	mv	a2,s4
    802071a8:	85ca                	mv	a1,s2
    802071aa:	8526                	mv	a0,s1
    802071ac:	00000097          	auipc	ra,0x0
    802071b0:	d74080e7          	jalr	-652(ra) # 80206f20 <enext>
    802071b4:	03650f63          	beq	a0,s6,802071f2 <dirlookup+0x148>
        } else if (strncmp(filename, ep->filename, FAT32_MAX_FILENAME) == 0) {
    802071b8:	0ff00613          	li	a2,255
    802071bc:	85ca                	mv	a1,s2
    802071be:	854e                	mv	a0,s3
    802071c0:	ffff9097          	auipc	ra,0xffff9
    802071c4:	67a080e7          	jalr	1658(ra) # 8020083a <strncmp>
    802071c8:	c901                	beqz	a0,802071d8 <dirlookup+0x12e>
        off += count << 5;
    802071ca:	fac42783          	lw	a5,-84(s0)
    802071ce:	0057979b          	slliw	a5,a5,0x5
    802071d2:	01478a3b          	addw	s4,a5,s4
    802071d6:	b7f9                	j	802071a4 <dirlookup+0xfa>
            ep->parent = edup(dp);
    802071d8:	8526                	mv	a0,s1
    802071da:	00000097          	auipc	ra,0x0
    802071de:	8e4080e7          	jalr	-1820(ra) # 80206abe <edup>
    802071e2:	12a93023          	sd	a0,288(s2)
            ep->off = off;
    802071e6:	11492e23          	sw	s4,284(s2)
            ep->valid = 1;
    802071ea:	4785                	li	a5,1
    802071ec:	10f91b23          	sh	a5,278(s2)
            return ep;
    802071f0:	b799                	j	80207136 <dirlookup+0x8c>
    if (poff) {
    802071f2:	000a8463          	beqz	s5,802071fa <dirlookup+0x150>
        *poff = off;
    802071f6:	014aa023          	sw	s4,0(s5)
    eput(ep);
    802071fa:	854a                	mv	a0,s2
    802071fc:	00000097          	auipc	ra,0x0
    80207200:	ba4080e7          	jalr	-1116(ra) # 80206da0 <eput>
    return NULL;
    80207204:	4901                	li	s2,0
    80207206:	bf05                	j	80207136 <dirlookup+0x8c>

0000000080207208 <ealloc>:
{
    80207208:	715d                	addi	sp,sp,-80
    8020720a:	e486                	sd	ra,72(sp)
    8020720c:	e0a2                	sd	s0,64(sp)
    8020720e:	fc26                	sd	s1,56(sp)
    80207210:	f84a                	sd	s2,48(sp)
    80207212:	f44e                	sd	s3,40(sp)
    80207214:	f052                	sd	s4,32(sp)
    80207216:	ec56                	sd	s5,24(sp)
    80207218:	0880                	addi	s0,sp,80
    8020721a:	892a                	mv	s2,a0
    if (!(dp->attribute & ATTR_DIRECTORY)) {
    8020721c:	10054783          	lbu	a5,256(a0)
    80207220:	8bc1                	andi	a5,a5,16
    80207222:	c7b1                	beqz	a5,8020726e <ealloc+0x66>
    80207224:	852e                	mv	a0,a1
    80207226:	8a32                	mv	s4,a2
    if (dp->valid != 1 || !(name = formatname(name))) {        // detect illegal character
    80207228:	11691703          	lh	a4,278(s2)
    8020722c:	4785                	li	a5,1
        return NULL;
    8020722e:	4481                	li	s1,0
    if (dp->valid != 1 || !(name = formatname(name))) {        // detect illegal character
    80207230:	02f71563          	bne	a4,a5,8020725a <ealloc+0x52>
    80207234:	fffff097          	auipc	ra,0xfffff
    80207238:	408080e7          	jalr	1032(ra) # 8020663c <formatname>
    8020723c:	89aa                	mv	s3,a0
    8020723e:	10050663          	beqz	a0,8020734a <ealloc+0x142>
    uint off = 0;
    80207242:	fa042e23          	sw	zero,-68(s0)
    if ((ep = dirlookup(dp, name, &off)) != 0) {      // entry exists
    80207246:	fbc40613          	addi	a2,s0,-68
    8020724a:	85aa                	mv	a1,a0
    8020724c:	854a                	mv	a0,s2
    8020724e:	00000097          	auipc	ra,0x0
    80207252:	e5c080e7          	jalr	-420(ra) # 802070aa <dirlookup>
    80207256:	84aa                	mv	s1,a0
    80207258:	c11d                	beqz	a0,8020727e <ealloc+0x76>
}
    8020725a:	8526                	mv	a0,s1
    8020725c:	60a6                	ld	ra,72(sp)
    8020725e:	6406                	ld	s0,64(sp)
    80207260:	74e2                	ld	s1,56(sp)
    80207262:	7942                	ld	s2,48(sp)
    80207264:	79a2                	ld	s3,40(sp)
    80207266:	7a02                	ld	s4,32(sp)
    80207268:	6ae2                	ld	s5,24(sp)
    8020726a:	6161                	addi	sp,sp,80
    8020726c:	8082                	ret
        panic("ealloc not dir");
    8020726e:	00003517          	auipc	a0,0x3
    80207272:	c8a50513          	addi	a0,a0,-886 # 80209ef8 <digits+0xb78>
    80207276:	ffff9097          	auipc	ra,0xffff9
    8020727a:	ece080e7          	jalr	-306(ra) # 80200144 <panic>
    ep = eget(dp, name);
    8020727e:	85ce                	mv	a1,s3
    80207280:	854a                	mv	a0,s2
    80207282:	fffff097          	auipc	ra,0xfffff
    80207286:	dd6080e7          	jalr	-554(ra) # 80206058 <eget>
    8020728a:	84aa                	mv	s1,a0
    elock(ep);
    8020728c:	00000097          	auipc	ra,0x0
    80207290:	a90080e7          	jalr	-1392(ra) # 80206d1c <elock>
    ep->attribute = attr;
    80207294:	11448023          	sb	s4,256(s1)
    ep->file_size = 0;
    80207298:	1004a423          	sw	zero,264(s1)
    ep->first_clus = 0;
    8020729c:	1004a223          	sw	zero,260(s1)
    ep->parent = edup(dp);
    802072a0:	854a                	mv	a0,s2
    802072a2:	00000097          	auipc	ra,0x0
    802072a6:	81c080e7          	jalr	-2020(ra) # 80206abe <edup>
    802072aa:	12a4b023          	sd	a0,288(s1)
    ep->off = off;
    802072ae:	fbc42a83          	lw	s5,-68(s0)
    802072b2:	1154ae23          	sw	s5,284(s1)
    ep->clus_cnt = 0;
    802072b6:	1004a823          	sw	zero,272(s1)
    ep->cur_clus = 0;
    802072ba:	1004a623          	sw	zero,268(s1)
    ep->dirty = 0;
    802072be:	10048aa3          	sb	zero,277(s1)
    strncpy(ep->filename, name, FAT32_MAX_FILENAME);
    802072c2:	0ff00613          	li	a2,255
    802072c6:	85ce                	mv	a1,s3
    802072c8:	8526                	mv	a0,s1
    802072ca:	ffff9097          	auipc	ra,0xffff9
    802072ce:	5ac080e7          	jalr	1452(ra) # 80200876 <strncpy>
    ep->filename[FAT32_MAX_FILENAME] = '\0';
    802072d2:	0e048fa3          	sb	zero,255(s1)
    if (attr == ATTR_DIRECTORY) {    // generate "." and ".." for ep
    802072d6:	47c1                	li	a5,16
    802072d8:	02fa0863          	beq	s4,a5,80207308 <ealloc+0x100>
        ep->attribute |= ATTR_ARCHIVE;
    802072dc:	1004c783          	lbu	a5,256(s1)
    802072e0:	0207e793          	ori	a5,a5,32
    802072e4:	10f48023          	sb	a5,256(s1)
    emake(dp, ep, off);
    802072e8:	8656                	mv	a2,s5
    802072ea:	85a6                	mv	a1,s1
    802072ec:	854a                	mv	a0,s2
    802072ee:	fffff097          	auipc	ra,0xfffff
    802072f2:	406080e7          	jalr	1030(ra) # 802066f4 <emake>
    ep->valid = 1;
    802072f6:	4785                	li	a5,1
    802072f8:	10f49b23          	sh	a5,278(s1)
    eunlock(ep);
    802072fc:	8526                	mv	a0,s1
    802072fe:	00000097          	auipc	ra,0x0
    80207302:	a54080e7          	jalr	-1452(ra) # 80206d52 <eunlock>
    return ep;
    80207306:	bf91                	j	8020725a <ealloc+0x52>
        ep->attribute |= ATTR_DIRECTORY;
    80207308:	1004c783          	lbu	a5,256(s1)
    8020730c:	0107e793          	ori	a5,a5,16
    80207310:	10f48023          	sb	a5,256(s1)
        ep->cur_clus = ep->first_clus = alloc_clus(dp->dev);
    80207314:	11494503          	lbu	a0,276(s2)
    80207318:	fffff097          	auipc	ra,0xfffff
    8020731c:	92a080e7          	jalr	-1750(ra) # 80205c42 <alloc_clus>
    80207320:	2501                	sext.w	a0,a0
    80207322:	10a4a223          	sw	a0,260(s1)
    80207326:	10a4a623          	sw	a0,268(s1)
        emake(ep, ep, 0);
    8020732a:	4601                	li	a2,0
    8020732c:	85a6                	mv	a1,s1
    8020732e:	8526                	mv	a0,s1
    80207330:	fffff097          	auipc	ra,0xfffff
    80207334:	3c4080e7          	jalr	964(ra) # 802066f4 <emake>
        emake(ep, dp, 32);
    80207338:	02000613          	li	a2,32
    8020733c:	85ca                	mv	a1,s2
    8020733e:	8526                	mv	a0,s1
    80207340:	fffff097          	auipc	ra,0xfffff
    80207344:	3b4080e7          	jalr	948(ra) # 802066f4 <emake>
    80207348:	b745                	j	802072e8 <ealloc+0xe0>
        return NULL;
    8020734a:	84aa                	mv	s1,a0
    8020734c:	b739                	j	8020725a <ealloc+0x52>

000000008020734e <lookup_path>:
}


// FAT32 version of namex in xv6's original file system.
static struct dirent *lookup_path(char *path, int parent, char *name)
{
    8020734e:	7139                	addi	sp,sp,-64
    80207350:	fc06                	sd	ra,56(sp)
    80207352:	f822                	sd	s0,48(sp)
    80207354:	f426                	sd	s1,40(sp)
    80207356:	f04a                	sd	s2,32(sp)
    80207358:	ec4e                	sd	s3,24(sp)
    8020735a:	e852                	sd	s4,16(sp)
    8020735c:	e456                	sd	s5,8(sp)
    8020735e:	0080                	addi	s0,sp,64
    80207360:	892a                	mv	s2,a0
    80207362:	8aae                	mv	s5,a1
    80207364:	8a32                	mv	s4,a2
    struct dirent *entry, *next;
    if (*path == '/') {
    80207366:	00054783          	lbu	a5,0(a0)
    8020736a:	02f00713          	li	a4,47
    8020736e:	02e78063          	beq	a5,a4,8020738e <lookup_path+0x40>
        entry = edup(&root);
    } else if (*path != '\0') {
        entry = edup(myproc()->cwd);
    } else {
        return NULL;
    80207372:	4481                	li	s1,0
    } else if (*path != '\0') {
    80207374:	c3b1                	beqz	a5,802073b8 <lookup_path+0x6a>
        entry = edup(myproc()->cwd);
    80207376:	ffffa097          	auipc	ra,0xffffa
    8020737a:	718080e7          	jalr	1816(ra) # 80201a8e <myproc>
    8020737e:	15853503          	ld	a0,344(a0)
    80207382:	fffff097          	auipc	ra,0xfffff
    80207386:	73c080e7          	jalr	1852(ra) # 80206abe <edup>
    8020738a:	84aa                	mv	s1,a0
    8020738c:	a0a5                	j	802073f4 <lookup_path+0xa6>
        entry = edup(&root);
    8020738e:	00018517          	auipc	a0,0x18
    80207392:	0c250513          	addi	a0,a0,194 # 8021f450 <root>
    80207396:	fffff097          	auipc	ra,0xfffff
    8020739a:	728080e7          	jalr	1832(ra) # 80206abe <edup>
    8020739e:	84aa                	mv	s1,a0
    802073a0:	a891                	j	802073f4 <lookup_path+0xa6>
    }
    while ((path = skipelem(path, name)) != 0) {
        elock(entry);
        if (!(entry->attribute & ATTR_DIRECTORY)) {
            eunlock(entry);
    802073a2:	8526                	mv	a0,s1
    802073a4:	00000097          	auipc	ra,0x0
    802073a8:	9ae080e7          	jalr	-1618(ra) # 80206d52 <eunlock>
            eput(entry);
    802073ac:	8526                	mv	a0,s1
    802073ae:	00000097          	auipc	ra,0x0
    802073b2:	9f2080e7          	jalr	-1550(ra) # 80206da0 <eput>
            return NULL;
    802073b6:	4481                	li	s1,0
    if (parent) {
        eput(entry);
        return NULL;
    }
    return entry;
}
    802073b8:	8526                	mv	a0,s1
    802073ba:	70e2                	ld	ra,56(sp)
    802073bc:	7442                	ld	s0,48(sp)
    802073be:	74a2                	ld	s1,40(sp)
    802073c0:	7902                	ld	s2,32(sp)
    802073c2:	69e2                	ld	s3,24(sp)
    802073c4:	6a42                	ld	s4,16(sp)
    802073c6:	6aa2                	ld	s5,8(sp)
    802073c8:	6121                	addi	sp,sp,64
    802073ca:	8082                	ret
        if ((next = dirlookup(entry, name, 0)) == 0) {
    802073cc:	4601                	li	a2,0
    802073ce:	85d2                	mv	a1,s4
    802073d0:	8526                	mv	a0,s1
    802073d2:	00000097          	auipc	ra,0x0
    802073d6:	cd8080e7          	jalr	-808(ra) # 802070aa <dirlookup>
    802073da:	89aa                	mv	s3,a0
    802073dc:	c921                	beqz	a0,8020742c <lookup_path+0xde>
        eunlock(entry);
    802073de:	8526                	mv	a0,s1
    802073e0:	00000097          	auipc	ra,0x0
    802073e4:	972080e7          	jalr	-1678(ra) # 80206d52 <eunlock>
        eput(entry);
    802073e8:	8526                	mv	a0,s1
    802073ea:	00000097          	auipc	ra,0x0
    802073ee:	9b6080e7          	jalr	-1610(ra) # 80206da0 <eput>
        entry = next;
    802073f2:	84ce                	mv	s1,s3
    while ((path = skipelem(path, name)) != 0) {
    802073f4:	85d2                	mv	a1,s4
    802073f6:	854a                	mv	a0,s2
    802073f8:	ffffe097          	auipc	ra,0xffffe
    802073fc:	746080e7          	jalr	1862(ra) # 80205b3e <skipelem>
    80207400:	892a                	mv	s2,a0
    80207402:	c129                	beqz	a0,80207444 <lookup_path+0xf6>
        elock(entry);
    80207404:	8526                	mv	a0,s1
    80207406:	00000097          	auipc	ra,0x0
    8020740a:	916080e7          	jalr	-1770(ra) # 80206d1c <elock>
        if (!(entry->attribute & ATTR_DIRECTORY)) {
    8020740e:	1004c783          	lbu	a5,256(s1)
    80207412:	8bc1                	andi	a5,a5,16
    80207414:	d7d9                	beqz	a5,802073a2 <lookup_path+0x54>
        if (parent && *path == '\0') {
    80207416:	fa0a8be3          	beqz	s5,802073cc <lookup_path+0x7e>
    8020741a:	00094783          	lbu	a5,0(s2)
    8020741e:	f7dd                	bnez	a5,802073cc <lookup_path+0x7e>
            eunlock(entry);
    80207420:	8526                	mv	a0,s1
    80207422:	00000097          	auipc	ra,0x0
    80207426:	930080e7          	jalr	-1744(ra) # 80206d52 <eunlock>
            return entry;
    8020742a:	b779                	j	802073b8 <lookup_path+0x6a>
            eunlock(entry);
    8020742c:	8526                	mv	a0,s1
    8020742e:	00000097          	auipc	ra,0x0
    80207432:	924080e7          	jalr	-1756(ra) # 80206d52 <eunlock>
            eput(entry);
    80207436:	8526                	mv	a0,s1
    80207438:	00000097          	auipc	ra,0x0
    8020743c:	968080e7          	jalr	-1688(ra) # 80206da0 <eput>
            return NULL;
    80207440:	84ce                	mv	s1,s3
    80207442:	bf9d                	j	802073b8 <lookup_path+0x6a>
    if (parent) {
    80207444:	f60a8ae3          	beqz	s5,802073b8 <lookup_path+0x6a>
        eput(entry);
    80207448:	8526                	mv	a0,s1
    8020744a:	00000097          	auipc	ra,0x0
    8020744e:	956080e7          	jalr	-1706(ra) # 80206da0 <eput>
        return NULL;
    80207452:	84ca                	mv	s1,s2
    80207454:	b795                	j	802073b8 <lookup_path+0x6a>

0000000080207456 <ename>:

struct dirent *ename(char *path)
{
    80207456:	716d                	addi	sp,sp,-272
    80207458:	e606                	sd	ra,264(sp)
    8020745a:	e222                	sd	s0,256(sp)
    8020745c:	0a00                	addi	s0,sp,272
    char name[FAT32_MAX_FILENAME + 1];
    return lookup_path(path, 0, name);
    8020745e:	ef040613          	addi	a2,s0,-272
    80207462:	4581                	li	a1,0
    80207464:	00000097          	auipc	ra,0x0
    80207468:	eea080e7          	jalr	-278(ra) # 8020734e <lookup_path>
}
    8020746c:	60b2                	ld	ra,264(sp)
    8020746e:	6412                	ld	s0,256(sp)
    80207470:	6151                	addi	sp,sp,272
    80207472:	8082                	ret

0000000080207474 <ename_env>:
struct dirent *ename_env(struct dirent* env,char* path)
{
    80207474:	7169                	addi	sp,sp,-304
    80207476:	f606                	sd	ra,296(sp)
    80207478:	f222                	sd	s0,288(sp)
    8020747a:	ee26                	sd	s1,280(sp)
    8020747c:	ea4a                	sd	s2,272(sp)
    8020747e:	e64e                	sd	s3,264(sp)
    80207480:	e252                	sd	s4,256(sp)
    80207482:	1a00                	addi	s0,sp,304
    80207484:	892e                	mv	s2,a1
    entry = edup(env);
    80207486:	fffff097          	auipc	ra,0xfffff
    8020748a:	638080e7          	jalr	1592(ra) # 80206abe <edup>
    8020748e:	84aa                	mv	s1,a0
    while ((path = skipelem(path, name)) != 0) {
    80207490:	ed040a13          	addi	s4,s0,-304
    80207494:	a081                	j	802074d4 <ename_env+0x60>
            eunlock(entry);
    80207496:	8526                	mv	a0,s1
    80207498:	00000097          	auipc	ra,0x0
    8020749c:	8ba080e7          	jalr	-1862(ra) # 80206d52 <eunlock>
            eput(entry);
    802074a0:	8526                	mv	a0,s1
    802074a2:	00000097          	auipc	ra,0x0
    802074a6:	8fe080e7          	jalr	-1794(ra) # 80206da0 <eput>
            return NULL;
    802074aa:	4481                	li	s1,0
    char name[FAT32_MAX_FILENAME + 1];
    return abs_lookup_path(env, path, 0, name); 
}
    802074ac:	8526                	mv	a0,s1
    802074ae:	70b2                	ld	ra,296(sp)
    802074b0:	7412                	ld	s0,288(sp)
    802074b2:	64f2                	ld	s1,280(sp)
    802074b4:	6952                	ld	s2,272(sp)
    802074b6:	69b2                	ld	s3,264(sp)
    802074b8:	6a12                	ld	s4,256(sp)
    802074ba:	6155                	addi	sp,sp,304
    802074bc:	8082                	ret
        eunlock(entry);
    802074be:	8526                	mv	a0,s1
    802074c0:	00000097          	auipc	ra,0x0
    802074c4:	892080e7          	jalr	-1902(ra) # 80206d52 <eunlock>
        eput(entry);
    802074c8:	8526                	mv	a0,s1
    802074ca:	00000097          	auipc	ra,0x0
    802074ce:	8d6080e7          	jalr	-1834(ra) # 80206da0 <eput>
        entry = next;
    802074d2:	84ce                	mv	s1,s3
    while ((path = skipelem(path, name)) != 0) {
    802074d4:	85d2                	mv	a1,s4
    802074d6:	854a                	mv	a0,s2
    802074d8:	ffffe097          	auipc	ra,0xffffe
    802074dc:	666080e7          	jalr	1638(ra) # 80205b3e <skipelem>
    802074e0:	892a                	mv	s2,a0
    802074e2:	d569                	beqz	a0,802074ac <ename_env+0x38>
        elock(entry);
    802074e4:	8526                	mv	a0,s1
    802074e6:	00000097          	auipc	ra,0x0
    802074ea:	836080e7          	jalr	-1994(ra) # 80206d1c <elock>
        if (!(entry->attribute & ATTR_DIRECTORY)) {
    802074ee:	1004c783          	lbu	a5,256(s1)
    802074f2:	8bc1                	andi	a5,a5,16
    802074f4:	d3cd                	beqz	a5,80207496 <ename_env+0x22>
        if ((next = dirlookup(entry, name, 0)) == 0) {
    802074f6:	4601                	li	a2,0
    802074f8:	85d2                	mv	a1,s4
    802074fa:	8526                	mv	a0,s1
    802074fc:	00000097          	auipc	ra,0x0
    80207500:	bae080e7          	jalr	-1106(ra) # 802070aa <dirlookup>
    80207504:	89aa                	mv	s3,a0
    80207506:	fd45                	bnez	a0,802074be <ename_env+0x4a>
            eunlock(entry);
    80207508:	8526                	mv	a0,s1
    8020750a:	00000097          	auipc	ra,0x0
    8020750e:	848080e7          	jalr	-1976(ra) # 80206d52 <eunlock>
            eput(entry);
    80207512:	8526                	mv	a0,s1
    80207514:	00000097          	auipc	ra,0x0
    80207518:	88c080e7          	jalr	-1908(ra) # 80206da0 <eput>
            return NULL;
    8020751c:	84ce                	mv	s1,s3
    8020751e:	b779                	j	802074ac <ename_env+0x38>

0000000080207520 <enameparent>:

struct dirent *enameparent(char *path, char *name)
{
    80207520:	1141                	addi	sp,sp,-16
    80207522:	e406                	sd	ra,8(sp)
    80207524:	e022                	sd	s0,0(sp)
    80207526:	0800                	addi	s0,sp,16
    80207528:	862e                	mv	a2,a1
    return lookup_path(path, 1, name);
    8020752a:	4585                	li	a1,1
    8020752c:	00000097          	auipc	ra,0x0
    80207530:	e22080e7          	jalr	-478(ra) # 8020734e <lookup_path>
}
    80207534:	60a2                	ld	ra,8(sp)
    80207536:	6402                	ld	s0,0(sp)
    80207538:	0141                	addi	sp,sp,16
    8020753a:	8082                	ret

000000008020753c <plicinit>:

//
// the riscv Platform Level Interrupt Controller (PLIC).
//

void plicinit(void) {
    8020753c:	1141                	addi	sp,sp,-16
    8020753e:	e422                	sd	s0,8(sp)
    80207540:	0800                	addi	s0,sp,16
	writed(1, PLIC_V + DISK_IRQ * sizeof(uint32));
    80207542:	00fc37b7          	lui	a5,0xfc3
    80207546:	07ba                	slli	a5,a5,0xe
    80207548:	4705                	li	a4,1
    8020754a:	c3d8                	sw	a4,4(a5)
	writed(1, PLIC_V + UART_IRQ * sizeof(uint32));
    8020754c:	d798                	sw	a4,40(a5)

	#ifdef DEBUG 
	printf("plicinit\n");
	#endif 
}
    8020754e:	6422                	ld	s0,8(sp)
    80207550:	0141                	addi	sp,sp,16
    80207552:	8082                	ret

0000000080207554 <plicinithart>:

void
plicinithart(void)
{
    80207554:	1141                	addi	sp,sp,-16
    80207556:	e406                	sd	ra,8(sp)
    80207558:	e022                	sd	s0,0(sp)
    8020755a:	0800                	addi	s0,sp,16
  int hart = cpuid();
    8020755c:	ffffa097          	auipc	ra,0xffffa
    80207560:	506080e7          	jalr	1286(ra) # 80201a62 <cpuid>
  #ifdef QEMU
  // set uart's enable bit for this hart's S-mode. 
  *(uint32*)PLIC_SENABLE(hart)= (1 << UART_IRQ) | (1 << DISK_IRQ);
    80207564:	0085171b          	slliw	a4,a0,0x8
    80207568:	01f867b7          	lui	a5,0x1f86
    8020756c:	0785                	addi	a5,a5,1 # 1f86001 <_entry-0x7e279fff>
    8020756e:	07b6                	slli	a5,a5,0xd
    80207570:	97ba                	add	a5,a5,a4
    80207572:	40200713          	li	a4,1026
    80207576:	08e7a023          	sw	a4,128(a5)
  // set this hart's S-mode priority threshold to 0.
  *(uint32*)PLIC_SPRIORITY(hart) = 0;
    8020757a:	00d5151b          	slliw	a0,a0,0xd
    8020757e:	03f0c7b7          	lui	a5,0x3f0c
    80207582:	20178793          	addi	a5,a5,513 # 3f0c201 <_entry-0x7c2f3dff>
    80207586:	07b2                	slli	a5,a5,0xc
    80207588:	97aa                	add	a5,a5,a0
    8020758a:	0007a023          	sw	zero,0(a5)
  *(hart0_m_int_enable_hi) = readd(hart0_m_int_enable_hi) | (1 << (UART_IRQ % 32));
  #endif
  #ifdef DEBUG
  printf("plicinithart\n");
  #endif
}
    8020758e:	60a2                	ld	ra,8(sp)
    80207590:	6402                	ld	s0,0(sp)
    80207592:	0141                	addi	sp,sp,16
    80207594:	8082                	ret

0000000080207596 <plic_claim>:

// ask the PLIC what interrupt we should serve.
int
plic_claim(void)
{
    80207596:	1141                	addi	sp,sp,-16
    80207598:	e406                	sd	ra,8(sp)
    8020759a:	e022                	sd	s0,0(sp)
    8020759c:	0800                	addi	s0,sp,16
  int hart = cpuid();
    8020759e:	ffffa097          	auipc	ra,0xffffa
    802075a2:	4c4080e7          	jalr	1220(ra) # 80201a62 <cpuid>
  int irq;
  #ifndef QEMU
  irq = *(uint32*)PLIC_MCLAIM(hart);
  #else
  irq = *(uint32*)PLIC_SCLAIM(hart);
    802075a6:	00d5151b          	slliw	a0,a0,0xd
    802075aa:	03f0c7b7          	lui	a5,0x3f0c
    802075ae:	20178793          	addi	a5,a5,513 # 3f0c201 <_entry-0x7c2f3dff>
    802075b2:	07b2                	slli	a5,a5,0xc
    802075b4:	97aa                	add	a5,a5,a0
  #endif
  return irq;
}
    802075b6:	43c8                	lw	a0,4(a5)
    802075b8:	60a2                	ld	ra,8(sp)
    802075ba:	6402                	ld	s0,0(sp)
    802075bc:	0141                	addi	sp,sp,16
    802075be:	8082                	ret

00000000802075c0 <plic_complete>:

// tell the PLIC we've served this IRQ.
void
plic_complete(int irq)
{
    802075c0:	1101                	addi	sp,sp,-32
    802075c2:	ec06                	sd	ra,24(sp)
    802075c4:	e822                	sd	s0,16(sp)
    802075c6:	e426                	sd	s1,8(sp)
    802075c8:	1000                	addi	s0,sp,32
    802075ca:	84aa                	mv	s1,a0
  int hart = cpuid();
    802075cc:	ffffa097          	auipc	ra,0xffffa
    802075d0:	496080e7          	jalr	1174(ra) # 80201a62 <cpuid>
  #ifndef QEMU
  *(uint32*)PLIC_MCLAIM(hart) = irq;
  #else
  *(uint32*)PLIC_SCLAIM(hart) = irq;
    802075d4:	00d5151b          	slliw	a0,a0,0xd
    802075d8:	03f0c7b7          	lui	a5,0x3f0c
    802075dc:	20178793          	addi	a5,a5,513 # 3f0c201 <_entry-0x7c2f3dff>
    802075e0:	07b2                	slli	a5,a5,0xc
    802075e2:	97aa                	add	a5,a5,a0
    802075e4:	c3c4                	sw	s1,4(a5)
  #endif
}
    802075e6:	60e2                	ld	ra,24(sp)
    802075e8:	6442                	ld	s0,16(sp)
    802075ea:	64a2                	ld	s1,8(sp)
    802075ec:	6105                	addi	sp,sp,32
    802075ee:	8082                	ret

00000000802075f0 <consolewrite>:
//
// user write()s to the console go here.
//
int
consolewrite(int user_src, uint64 src, int n)
{
    802075f0:	715d                	addi	sp,sp,-80
    802075f2:	e486                	sd	ra,72(sp)
    802075f4:	e0a2                	sd	s0,64(sp)
    802075f6:	fc26                	sd	s1,56(sp)
    802075f8:	f84a                	sd	s2,48(sp)
    802075fa:	f44e                	sd	s3,40(sp)
    802075fc:	f052                	sd	s4,32(sp)
    802075fe:	ec56                	sd	s5,24(sp)
    80207600:	e85a                	sd	s6,16(sp)
    80207602:	0880                	addi	s0,sp,80
    80207604:	8a2a                	mv	s4,a0
    80207606:	84ae                	mv	s1,a1
    80207608:	89b2                	mv	s3,a2
  int i;

  acquire(&cons.lock);
    8020760a:	0001c517          	auipc	a0,0x1c
    8020760e:	61650513          	addi	a0,a0,1558 # 80223c20 <cons>
    80207612:	ffff9097          	auipc	ra,0xffff9
    80207616:	0b4080e7          	jalr	180(ra) # 802006c6 <acquire>
  for(i = 0; i < n; i++){
    8020761a:	07305063          	blez	s3,8020767a <consolewrite+0x8a>
    8020761e:	4901                	li	s2,0
    char c;
    if(either_copyin(&c, user_src, src+i, 1) == -1)
    80207620:	fbf40b13          	addi	s6,s0,-65
    80207624:	5afd                	li	s5,-1
    80207626:	4685                	li	a3,1
    80207628:	8626                	mv	a2,s1
    8020762a:	85d2                	mv	a1,s4
    8020762c:	855a                	mv	a0,s6
    8020762e:	ffffb097          	auipc	ra,0xffffb
    80207632:	f90080e7          	jalr	-112(ra) # 802025be <either_copyin>
    80207636:	01550f63          	beq	a0,s5,80207654 <consolewrite+0x64>
	SBI_CALL_1(SBI_CONSOLE_PUTCHAR, ch);
    8020763a:	fbf44503          	lbu	a0,-65(s0)
    8020763e:	4581                	li	a1,0
    80207640:	4601                	li	a2,0
    80207642:	4681                	li	a3,0
    80207644:	4885                	li	a7,1
    80207646:	00000073          	ecall
  for(i = 0; i < n; i++){
    8020764a:	2905                	addiw	s2,s2,1
    8020764c:	0485                	addi	s1,s1,1
    8020764e:	fd299ce3          	bne	s3,s2,80207626 <consolewrite+0x36>
    80207652:	894e                	mv	s2,s3
      break;
    sbi_console_putchar(c);
  }
  release(&cons.lock);
    80207654:	0001c517          	auipc	a0,0x1c
    80207658:	5cc50513          	addi	a0,a0,1484 # 80223c20 <cons>
    8020765c:	ffff9097          	auipc	ra,0xffff9
    80207660:	0be080e7          	jalr	190(ra) # 8020071a <release>

  return i;
}
    80207664:	854a                	mv	a0,s2
    80207666:	60a6                	ld	ra,72(sp)
    80207668:	6406                	ld	s0,64(sp)
    8020766a:	74e2                	ld	s1,56(sp)
    8020766c:	7942                	ld	s2,48(sp)
    8020766e:	79a2                	ld	s3,40(sp)
    80207670:	7a02                	ld	s4,32(sp)
    80207672:	6ae2                	ld	s5,24(sp)
    80207674:	6b42                	ld	s6,16(sp)
    80207676:	6161                	addi	sp,sp,80
    80207678:	8082                	ret
  for(i = 0; i < n; i++){
    8020767a:	4901                	li	s2,0
    8020767c:	bfe1                	j	80207654 <consolewrite+0x64>

000000008020767e <consoleread>:
// user_dist indicates whether dst is a user
// or kernel address.
//
int
consoleread(int user_dst, uint64 dst, int n)
{
    8020767e:	7119                	addi	sp,sp,-128
    80207680:	fc86                	sd	ra,120(sp)
    80207682:	f8a2                	sd	s0,112(sp)
    80207684:	f4a6                	sd	s1,104(sp)
    80207686:	f0ca                	sd	s2,96(sp)
    80207688:	ecce                	sd	s3,88(sp)
    8020768a:	e8d2                	sd	s4,80(sp)
    8020768c:	e4d6                	sd	s5,72(sp)
    8020768e:	e0da                	sd	s6,64(sp)
    80207690:	fc5e                	sd	s7,56(sp)
    80207692:	f862                	sd	s8,48(sp)
    80207694:	f466                	sd	s9,40(sp)
    80207696:	f06a                	sd	s10,32(sp)
    80207698:	ec6e                	sd	s11,24(sp)
    8020769a:	0100                	addi	s0,sp,128
    8020769c:	8aaa                	mv	s5,a0
    8020769e:	8a2e                	mv	s4,a1
    802076a0:	89b2                	mv	s3,a2
  uint target;
  int c;
  char cbuf;

  target = n;
    802076a2:	00060b1b          	sext.w	s6,a2
  acquire(&cons.lock);
    802076a6:	0001c517          	auipc	a0,0x1c
    802076aa:	57a50513          	addi	a0,a0,1402 # 80223c20 <cons>
    802076ae:	ffff9097          	auipc	ra,0xffff9
    802076b2:	018080e7          	jalr	24(ra) # 802006c6 <acquire>
  while(n > 0){
    // wait until interrupt handler has put some
    // input into cons.buffer.
    while(cons.r == cons.w){
    802076b6:	0001c497          	auipc	s1,0x1c
    802076ba:	56a48493          	addi	s1,s1,1386 # 80223c20 <cons>
      if(myproc()->killed){
        release(&cons.lock);
        return -1;
      }
      sleep(&cons.r, &cons.lock);
    802076be:	0001c917          	auipc	s2,0x1c
    802076c2:	5fa90913          	addi	s2,s2,1530 # 80223cb8 <cons+0x98>
    }

    c = cons.buf[cons.r++ % INPUT_BUF];

    if(c == C('D')){  // end-of-file
    802076c6:	4c11                	li	s8,4
      break;
    }

    // copy the input byte to the user-space buffer.
    cbuf = c;
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    802076c8:	f8f40d13          	addi	s10,s0,-113
    802076cc:	5cfd                	li	s9,-1
      break;

    dst++;
    --n;

    if(c == '\n'){
    802076ce:	4da9                	li	s11,10
  while(n > 0){
    802076d0:	07305763          	blez	s3,8020773e <consoleread+0xc0>
    while(cons.r == cons.w){
    802076d4:	0984a783          	lw	a5,152(s1)
    802076d8:	09c4a703          	lw	a4,156(s1)
    802076dc:	02f71463          	bne	a4,a5,80207704 <consoleread+0x86>
      if(myproc()->killed){
    802076e0:	ffffa097          	auipc	ra,0xffffa
    802076e4:	3ae080e7          	jalr	942(ra) # 80201a8e <myproc>
    802076e8:	591c                	lw	a5,48(a0)
    802076ea:	e7ad                	bnez	a5,80207754 <consoleread+0xd6>
      sleep(&cons.r, &cons.lock);
    802076ec:	85a6                	mv	a1,s1
    802076ee:	854a                	mv	a0,s2
    802076f0:	ffffb097          	auipc	ra,0xffffb
    802076f4:	c42080e7          	jalr	-958(ra) # 80202332 <sleep>
    while(cons.r == cons.w){
    802076f8:	0984a783          	lw	a5,152(s1)
    802076fc:	09c4a703          	lw	a4,156(s1)
    80207700:	fef700e3          	beq	a4,a5,802076e0 <consoleread+0x62>
    c = cons.buf[cons.r++ % INPUT_BUF];
    80207704:	0017871b          	addiw	a4,a5,1
    80207708:	08e4ac23          	sw	a4,152(s1)
    8020770c:	07f7f713          	andi	a4,a5,127
    80207710:	9726                	add	a4,a4,s1
    80207712:	01874703          	lbu	a4,24(a4)
    80207716:	00070b9b          	sext.w	s7,a4
    if(c == C('D')){  // end-of-file
    8020771a:	078b8563          	beq	s7,s8,80207784 <consoleread+0x106>
    cbuf = c;
    8020771e:	f8e407a3          	sb	a4,-113(s0)
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    80207722:	4685                	li	a3,1
    80207724:	866a                	mv	a2,s10
    80207726:	85d2                	mv	a1,s4
    80207728:	8556                	mv	a0,s5
    8020772a:	ffffb097          	auipc	ra,0xffffb
    8020772e:	e5e080e7          	jalr	-418(ra) # 80202588 <either_copyout>
    80207732:	01950663          	beq	a0,s9,8020773e <consoleread+0xc0>
    dst++;
    80207736:	0a05                	addi	s4,s4,1
    --n;
    80207738:	39fd                	addiw	s3,s3,-1
    if(c == '\n'){
    8020773a:	f9bb9be3          	bne	s7,s11,802076d0 <consoleread+0x52>
      // a whole line has arrived, return to
      // the user-level read().
      break;
    }
  }
  release(&cons.lock);
    8020773e:	0001c517          	auipc	a0,0x1c
    80207742:	4e250513          	addi	a0,a0,1250 # 80223c20 <cons>
    80207746:	ffff9097          	auipc	ra,0xffff9
    8020774a:	fd4080e7          	jalr	-44(ra) # 8020071a <release>

  return target - n;
    8020774e:	413b053b          	subw	a0,s6,s3
    80207752:	a811                	j	80207766 <consoleread+0xe8>
        release(&cons.lock);
    80207754:	0001c517          	auipc	a0,0x1c
    80207758:	4cc50513          	addi	a0,a0,1228 # 80223c20 <cons>
    8020775c:	ffff9097          	auipc	ra,0xffff9
    80207760:	fbe080e7          	jalr	-66(ra) # 8020071a <release>
        return -1;
    80207764:	557d                	li	a0,-1
}
    80207766:	70e6                	ld	ra,120(sp)
    80207768:	7446                	ld	s0,112(sp)
    8020776a:	74a6                	ld	s1,104(sp)
    8020776c:	7906                	ld	s2,96(sp)
    8020776e:	69e6                	ld	s3,88(sp)
    80207770:	6a46                	ld	s4,80(sp)
    80207772:	6aa6                	ld	s5,72(sp)
    80207774:	6b06                	ld	s6,64(sp)
    80207776:	7be2                	ld	s7,56(sp)
    80207778:	7c42                	ld	s8,48(sp)
    8020777a:	7ca2                	ld	s9,40(sp)
    8020777c:	7d02                	ld	s10,32(sp)
    8020777e:	6de2                	ld	s11,24(sp)
    80207780:	6109                	addi	sp,sp,128
    80207782:	8082                	ret
      if(n < target){
    80207784:	0009871b          	sext.w	a4,s3
    80207788:	fb677be3          	bgeu	a4,s6,8020773e <consoleread+0xc0>
        cons.r--;
    8020778c:	0001c717          	auipc	a4,0x1c
    80207790:	52f72623          	sw	a5,1324(a4) # 80223cb8 <cons+0x98>
    80207794:	b76d                	j	8020773e <consoleread+0xc0>

0000000080207796 <consputc>:
void consputc(int c) {
    80207796:	1141                	addi	sp,sp,-16
    80207798:	e422                	sd	s0,8(sp)
    8020779a:	0800                	addi	s0,sp,16
  if(c == BACKSPACE){
    8020779c:	10000793          	li	a5,256
    802077a0:	00f50b63          	beq	a0,a5,802077b6 <consputc+0x20>
    802077a4:	4581                	li	a1,0
    802077a6:	4601                	li	a2,0
    802077a8:	4681                	li	a3,0
    802077aa:	4885                	li	a7,1
    802077ac:	00000073          	ecall
}
    802077b0:	6422                	ld	s0,8(sp)
    802077b2:	0141                	addi	sp,sp,16
    802077b4:	8082                	ret
    802077b6:	4521                	li	a0,8
    802077b8:	4581                	li	a1,0
    802077ba:	4601                	li	a2,0
    802077bc:	4681                	li	a3,0
    802077be:	4885                	li	a7,1
    802077c0:	00000073          	ecall
    802077c4:	02000513          	li	a0,32
    802077c8:	00000073          	ecall
    802077cc:	4521                	li	a0,8
    802077ce:	00000073          	ecall
}
    802077d2:	bff9                	j	802077b0 <consputc+0x1a>

00000000802077d4 <consoleintr>:
// do erase/kill processing, append to cons.buf,
// wake up consoleread() if a whole line has arrived.
//
void
consoleintr(int c)
{
    802077d4:	1101                	addi	sp,sp,-32
    802077d6:	ec06                	sd	ra,24(sp)
    802077d8:	e822                	sd	s0,16(sp)
    802077da:	e426                	sd	s1,8(sp)
    802077dc:	e04a                	sd	s2,0(sp)
    802077de:	1000                	addi	s0,sp,32
    802077e0:	84aa                	mv	s1,a0
  acquire(&cons.lock);
    802077e2:	0001c517          	auipc	a0,0x1c
    802077e6:	43e50513          	addi	a0,a0,1086 # 80223c20 <cons>
    802077ea:	ffff9097          	auipc	ra,0xffff9
    802077ee:	edc080e7          	jalr	-292(ra) # 802006c6 <acquire>

  switch(c){
    802077f2:	47d5                	li	a5,21
    802077f4:	0af48663          	beq	s1,a5,802078a0 <consoleintr+0xcc>
    802077f8:	0297ca63          	blt	a5,s1,8020782c <consoleintr+0x58>
    802077fc:	47a1                	li	a5,8
    802077fe:	0ef48763          	beq	s1,a5,802078ec <consoleintr+0x118>
    80207802:	47c1                	li	a5,16
    80207804:	10f49a63          	bne	s1,a5,80207918 <consoleintr+0x144>
  case C('P'):  // Print process list.
    procdump();
    80207808:	ffffb097          	auipc	ra,0xffffb
    8020780c:	dea080e7          	jalr	-534(ra) # 802025f2 <procdump>
      }
    }
    break;
  }
  
  release(&cons.lock);
    80207810:	0001c517          	auipc	a0,0x1c
    80207814:	41050513          	addi	a0,a0,1040 # 80223c20 <cons>
    80207818:	ffff9097          	auipc	ra,0xffff9
    8020781c:	f02080e7          	jalr	-254(ra) # 8020071a <release>
}
    80207820:	60e2                	ld	ra,24(sp)
    80207822:	6442                	ld	s0,16(sp)
    80207824:	64a2                	ld	s1,8(sp)
    80207826:	6902                	ld	s2,0(sp)
    80207828:	6105                	addi	sp,sp,32
    8020782a:	8082                	ret
  switch(c){
    8020782c:	07f00793          	li	a5,127
    80207830:	0af48e63          	beq	s1,a5,802078ec <consoleintr+0x118>
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    80207834:	0001c717          	auipc	a4,0x1c
    80207838:	3ec70713          	addi	a4,a4,1004 # 80223c20 <cons>
    8020783c:	0a072783          	lw	a5,160(a4)
    80207840:	09872703          	lw	a4,152(a4)
    80207844:	9f99                	subw	a5,a5,a4
    80207846:	07f00713          	li	a4,127
    8020784a:	fcf763e3          	bltu	a4,a5,80207810 <consoleintr+0x3c>
      c = (c == '\r') ? '\n' : c;
    8020784e:	47b5                	li	a5,13
    80207850:	0cf48763          	beq	s1,a5,8020791e <consoleintr+0x14a>
      consputc(c);
    80207854:	8526                	mv	a0,s1
    80207856:	00000097          	auipc	ra,0x0
    8020785a:	f40080e7          	jalr	-192(ra) # 80207796 <consputc>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    8020785e:	0001c797          	auipc	a5,0x1c
    80207862:	3c278793          	addi	a5,a5,962 # 80223c20 <cons>
    80207866:	0a07a703          	lw	a4,160(a5)
    8020786a:	0017069b          	addiw	a3,a4,1
    8020786e:	0006861b          	sext.w	a2,a3
    80207872:	0ad7a023          	sw	a3,160(a5)
    80207876:	07f77713          	andi	a4,a4,127
    8020787a:	97ba                	add	a5,a5,a4
    8020787c:	00978c23          	sb	s1,24(a5)
      if(c == '\n' || c == C('D') || cons.e == cons.r+INPUT_BUF){
    80207880:	47a9                	li	a5,10
    80207882:	0cf48563          	beq	s1,a5,8020794c <consoleintr+0x178>
    80207886:	4791                	li	a5,4
    80207888:	0cf48263          	beq	s1,a5,8020794c <consoleintr+0x178>
    8020788c:	0001c797          	auipc	a5,0x1c
    80207890:	42c7a783          	lw	a5,1068(a5) # 80223cb8 <cons+0x98>
    80207894:	0807879b          	addiw	a5,a5,128
    80207898:	f6f61ce3          	bne	a2,a5,80207810 <consoleintr+0x3c>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    8020789c:	863e                	mv	a2,a5
    8020789e:	a07d                	j	8020794c <consoleintr+0x178>
    while(cons.e != cons.w &&
    802078a0:	0001c717          	auipc	a4,0x1c
    802078a4:	38070713          	addi	a4,a4,896 # 80223c20 <cons>
    802078a8:	0a072783          	lw	a5,160(a4)
    802078ac:	09c72703          	lw	a4,156(a4)
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    802078b0:	0001c497          	auipc	s1,0x1c
    802078b4:	37048493          	addi	s1,s1,880 # 80223c20 <cons>
    while(cons.e != cons.w &&
    802078b8:	4929                	li	s2,10
    802078ba:	f4f70be3          	beq	a4,a5,80207810 <consoleintr+0x3c>
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    802078be:	37fd                	addiw	a5,a5,-1
    802078c0:	07f7f713          	andi	a4,a5,127
    802078c4:	9726                	add	a4,a4,s1
    while(cons.e != cons.w &&
    802078c6:	01874703          	lbu	a4,24(a4)
    802078ca:	f52703e3          	beq	a4,s2,80207810 <consoleintr+0x3c>
      cons.e--;
    802078ce:	0af4a023          	sw	a5,160(s1)
      consputc(BACKSPACE);
    802078d2:	10000513          	li	a0,256
    802078d6:	00000097          	auipc	ra,0x0
    802078da:	ec0080e7          	jalr	-320(ra) # 80207796 <consputc>
    while(cons.e != cons.w &&
    802078de:	0a04a783          	lw	a5,160(s1)
    802078e2:	09c4a703          	lw	a4,156(s1)
    802078e6:	fcf71ce3          	bne	a4,a5,802078be <consoleintr+0xea>
    802078ea:	b71d                	j	80207810 <consoleintr+0x3c>
    if(cons.e != cons.w){
    802078ec:	0001c717          	auipc	a4,0x1c
    802078f0:	33470713          	addi	a4,a4,820 # 80223c20 <cons>
    802078f4:	0a072783          	lw	a5,160(a4)
    802078f8:	09c72703          	lw	a4,156(a4)
    802078fc:	f0f70ae3          	beq	a4,a5,80207810 <consoleintr+0x3c>
      cons.e--;
    80207900:	37fd                	addiw	a5,a5,-1
    80207902:	0001c717          	auipc	a4,0x1c
    80207906:	3af72f23          	sw	a5,958(a4) # 80223cc0 <cons+0xa0>
      consputc(BACKSPACE);
    8020790a:	10000513          	li	a0,256
    8020790e:	00000097          	auipc	ra,0x0
    80207912:	e88080e7          	jalr	-376(ra) # 80207796 <consputc>
    80207916:	bded                	j	80207810 <consoleintr+0x3c>
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    80207918:	ee048ce3          	beqz	s1,80207810 <consoleintr+0x3c>
    8020791c:	bf21                	j	80207834 <consoleintr+0x60>
      consputc(c);
    8020791e:	4529                	li	a0,10
    80207920:	00000097          	auipc	ra,0x0
    80207924:	e76080e7          	jalr	-394(ra) # 80207796 <consputc>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    80207928:	0001c797          	auipc	a5,0x1c
    8020792c:	2f878793          	addi	a5,a5,760 # 80223c20 <cons>
    80207930:	0a07a703          	lw	a4,160(a5)
    80207934:	0017069b          	addiw	a3,a4,1
    80207938:	0006861b          	sext.w	a2,a3
    8020793c:	0ad7a023          	sw	a3,160(a5)
    80207940:	07f77713          	andi	a4,a4,127
    80207944:	97ba                	add	a5,a5,a4
    80207946:	4729                	li	a4,10
    80207948:	00e78c23          	sb	a4,24(a5)
        cons.w = cons.e;
    8020794c:	0001c797          	auipc	a5,0x1c
    80207950:	36c7a823          	sw	a2,880(a5) # 80223cbc <cons+0x9c>
        wakeup(&cons.r);
    80207954:	0001c517          	auipc	a0,0x1c
    80207958:	36450513          	addi	a0,a0,868 # 80223cb8 <cons+0x98>
    8020795c:	ffffb097          	auipc	ra,0xffffb
    80207960:	b52080e7          	jalr	-1198(ra) # 802024ae <wakeup>
    80207964:	b575                	j	80207810 <consoleintr+0x3c>

0000000080207966 <consoleinit>:

void
consoleinit(void)
{
    80207966:	1101                	addi	sp,sp,-32
    80207968:	ec06                	sd	ra,24(sp)
    8020796a:	e822                	sd	s0,16(sp)
    8020796c:	e426                	sd	s1,8(sp)
    8020796e:	1000                	addi	s0,sp,32
  initlock(&cons.lock, "cons");
    80207970:	0001c497          	auipc	s1,0x1c
    80207974:	2b048493          	addi	s1,s1,688 # 80223c20 <cons>
    80207978:	00002597          	auipc	a1,0x2
    8020797c:	59058593          	addi	a1,a1,1424 # 80209f08 <digits+0xb88>
    80207980:	8526                	mv	a0,s1
    80207982:	ffff9097          	auipc	ra,0xffff9
    80207986:	d00080e7          	jalr	-768(ra) # 80200682 <initlock>

  cons.e = cons.w = cons.r = 0;
    8020798a:	0804ac23          	sw	zero,152(s1)
    8020798e:	0804ae23          	sw	zero,156(s1)
    80207992:	0a04a023          	sw	zero,160(s1)
  
  // connect read and write system calls
  // to consoleread and consolewrite.
  devsw[CONSOLE].read = consoleread;
    80207996:	00005797          	auipc	a5,0x5
    8020799a:	37a7b783          	ld	a5,890(a5) # 8020cd10 <_GLOBAL_OFFSET_TABLE_+0x58>
    8020799e:	00000717          	auipc	a4,0x0
    802079a2:	ce070713          	addi	a4,a4,-800 # 8020767e <consoleread>
    802079a6:	eb98                	sd	a4,16(a5)
  devsw[CONSOLE].write = consolewrite;
    802079a8:	00000717          	auipc	a4,0x0
    802079ac:	c4870713          	addi	a4,a4,-952 # 802075f0 <consolewrite>
    802079b0:	ef98                	sd	a4,24(a5)
}
    802079b2:	60e2                	ld	ra,24(sp)
    802079b4:	6442                	ld	s0,16(sp)
    802079b6:	64a2                	ld	s1,8(sp)
    802079b8:	6105                	addi	sp,sp,32
    802079ba:	8082                	ret

00000000802079bc <free_desc>:
}

// mark a descriptor as free.
static void
free_desc(int i)
{
    802079bc:	1141                	addi	sp,sp,-16
    802079be:	e406                	sd	ra,8(sp)
    802079c0:	e022                	sd	s0,0(sp)
    802079c2:	0800                	addi	s0,sp,16
  if(i >= NUM)
    802079c4:	479d                	li	a5,7
    802079c6:	04a7cb63          	blt	a5,a0,80207a1c <free_desc+0x60>
    panic("virtio_disk_intr 1");
  if(disk.free[i])
    802079ca:	0001c717          	auipc	a4,0x1c
    802079ce:	63670713          	addi	a4,a4,1590 # 80224000 <disk>
    802079d2:	972a                	add	a4,a4,a0
    802079d4:	6789                	lui	a5,0x2
    802079d6:	97ba                	add	a5,a5,a4
    802079d8:	0187c783          	lbu	a5,24(a5) # 2018 <_entry-0x801fdfe8>
    802079dc:	eba1                	bnez	a5,80207a2c <free_desc+0x70>
    panic("virtio_disk_intr 2");
  disk.desc[i].addr = 0;
    802079de:	00451713          	slli	a4,a0,0x4
    802079e2:	0001e797          	auipc	a5,0x1e
    802079e6:	61e7b783          	ld	a5,1566(a5) # 80226000 <disk+0x2000>
    802079ea:	97ba                	add	a5,a5,a4
    802079ec:	0007b023          	sd	zero,0(a5)
  disk.free[i] = 1;
    802079f0:	0001c717          	auipc	a4,0x1c
    802079f4:	61070713          	addi	a4,a4,1552 # 80224000 <disk>
    802079f8:	972a                	add	a4,a4,a0
    802079fa:	6789                	lui	a5,0x2
    802079fc:	97ba                	add	a5,a5,a4
    802079fe:	4705                	li	a4,1
    80207a00:	00e78c23          	sb	a4,24(a5) # 2018 <_entry-0x801fdfe8>
  wakeup(&disk.free[0]);
    80207a04:	0001e517          	auipc	a0,0x1e
    80207a08:	61450513          	addi	a0,a0,1556 # 80226018 <disk+0x2018>
    80207a0c:	ffffb097          	auipc	ra,0xffffb
    80207a10:	aa2080e7          	jalr	-1374(ra) # 802024ae <wakeup>
}
    80207a14:	60a2                	ld	ra,8(sp)
    80207a16:	6402                	ld	s0,0(sp)
    80207a18:	0141                	addi	sp,sp,16
    80207a1a:	8082                	ret
    panic("virtio_disk_intr 1");
    80207a1c:	00002517          	auipc	a0,0x2
    80207a20:	4f450513          	addi	a0,a0,1268 # 80209f10 <digits+0xb90>
    80207a24:	ffff8097          	auipc	ra,0xffff8
    80207a28:	720080e7          	jalr	1824(ra) # 80200144 <panic>
    panic("virtio_disk_intr 2");
    80207a2c:	00002517          	auipc	a0,0x2
    80207a30:	4fc50513          	addi	a0,a0,1276 # 80209f28 <digits+0xba8>
    80207a34:	ffff8097          	auipc	ra,0xffff8
    80207a38:	710080e7          	jalr	1808(ra) # 80200144 <panic>

0000000080207a3c <virtio_disk_init>:
{
    80207a3c:	1141                	addi	sp,sp,-16
    80207a3e:	e406                	sd	ra,8(sp)
    80207a40:	e022                	sd	s0,0(sp)
    80207a42:	0800                	addi	s0,sp,16
  initlock(&disk.vdisk_lock, "virtio_disk");
    80207a44:	00002597          	auipc	a1,0x2
    80207a48:	4fc58593          	addi	a1,a1,1276 # 80209f40 <digits+0xbc0>
    80207a4c:	0001e517          	auipc	a0,0x1e
    80207a50:	65c50513          	addi	a0,a0,1628 # 802260a8 <disk+0x20a8>
    80207a54:	ffff9097          	auipc	ra,0xffff9
    80207a58:	c2e080e7          	jalr	-978(ra) # 80200682 <initlock>
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80207a5c:	03f107b7          	lui	a5,0x3f10
    80207a60:	0785                	addi	a5,a5,1 # 3f10001 <_entry-0x7c2effff>
    80207a62:	07b2                	slli	a5,a5,0xc
    80207a64:	4398                	lw	a4,0(a5)
    80207a66:	2701                	sext.w	a4,a4
    80207a68:	747277b7          	lui	a5,0x74727
    80207a6c:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xbad968a>
    80207a70:	12f71163          	bne	a4,a5,80207b92 <virtio_disk_init+0x156>
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    80207a74:	00002797          	auipc	a5,0x2
    80207a78:	5547b783          	ld	a5,1364(a5) # 80209fc8 <digits+0xc48>
    80207a7c:	439c                	lw	a5,0(a5)
    80207a7e:	2781                	sext.w	a5,a5
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80207a80:	4705                	li	a4,1
    80207a82:	10e79863          	bne	a5,a4,80207b92 <virtio_disk_init+0x156>
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80207a86:	00002797          	auipc	a5,0x2
    80207a8a:	54a7b783          	ld	a5,1354(a5) # 80209fd0 <digits+0xc50>
    80207a8e:	439c                	lw	a5,0(a5)
    80207a90:	2781                	sext.w	a5,a5
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    80207a92:	4709                	li	a4,2
    80207a94:	0ee79f63          	bne	a5,a4,80207b92 <virtio_disk_init+0x156>
     *R(VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    80207a98:	00002797          	auipc	a5,0x2
    80207a9c:	5407b783          	ld	a5,1344(a5) # 80209fd8 <digits+0xc58>
    80207aa0:	4398                	lw	a4,0(a5)
    80207aa2:	2701                	sext.w	a4,a4
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80207aa4:	554d47b7          	lui	a5,0x554d4
    80207aa8:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ad2baaf>
    80207aac:	0ef71363          	bne	a4,a5,80207b92 <virtio_disk_init+0x156>
  *R(VIRTIO_MMIO_STATUS) = status;
    80207ab0:	00002797          	auipc	a5,0x2
    80207ab4:	5307b783          	ld	a5,1328(a5) # 80209fe0 <digits+0xc60>
    80207ab8:	4705                	li	a4,1
    80207aba:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_STATUS) = status;
    80207abc:	470d                	li	a4,3
    80207abe:	c398                	sw	a4,0(a5)
  uint64 features = *R(VIRTIO_MMIO_DEVICE_FEATURES);
    80207ac0:	00002717          	auipc	a4,0x2
    80207ac4:	52873703          	ld	a4,1320(a4) # 80209fe8 <digits+0xc68>
    80207ac8:	4318                	lw	a4,0(a4)
  *R(VIRTIO_MMIO_DRIVER_FEATURES) = features;
    80207aca:	c7ffe6b7          	lui	a3,0xc7ffe
    80207ace:	75f68693          	addi	a3,a3,1887 # ffffffffc7ffe75f <ebss_clear+0xffffffff47dd775f>
    80207ad2:	8f75                	and	a4,a4,a3
    80207ad4:	00002697          	auipc	a3,0x2
    80207ad8:	51c6b683          	ld	a3,1308(a3) # 80209ff0 <digits+0xc70>
    80207adc:	c298                	sw	a4,0(a3)
  *R(VIRTIO_MMIO_STATUS) = status;
    80207ade:	472d                	li	a4,11
    80207ae0:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_STATUS) = status;
    80207ae2:	473d                	li	a4,15
    80207ae4:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_GUEST_PAGE_SIZE) = PGSIZE;
    80207ae6:	00002797          	auipc	a5,0x2
    80207aea:	5127b783          	ld	a5,1298(a5) # 80209ff8 <digits+0xc78>
    80207aee:	6705                	lui	a4,0x1
    80207af0:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_QUEUE_SEL) = 0;
    80207af2:	00002797          	auipc	a5,0x2
    80207af6:	50e7b783          	ld	a5,1294(a5) # 8020a000 <digits+0xc80>
    80207afa:	0007a023          	sw	zero,0(a5)
  uint32 max = *R(VIRTIO_MMIO_QUEUE_NUM_MAX);
    80207afe:	00002797          	auipc	a5,0x2
    80207b02:	50a7b783          	ld	a5,1290(a5) # 8020a008 <digits+0xc88>
    80207b06:	439c                	lw	a5,0(a5)
    80207b08:	2781                	sext.w	a5,a5
  if(max == 0)
    80207b0a:	cfc1                	beqz	a5,80207ba2 <virtio_disk_init+0x166>
  if(max < NUM)
    80207b0c:	471d                	li	a4,7
    80207b0e:	0af77263          	bgeu	a4,a5,80207bb2 <virtio_disk_init+0x176>
  *R(VIRTIO_MMIO_QUEUE_NUM) = NUM;
    80207b12:	00002797          	auipc	a5,0x2
    80207b16:	4fe7b783          	ld	a5,1278(a5) # 8020a010 <digits+0xc90>
    80207b1a:	4721                	li	a4,8
    80207b1c:	c398                	sw	a4,0(a5)
  memset(disk.pages, 0, sizeof(disk.pages));
    80207b1e:	6609                	lui	a2,0x2
    80207b20:	4581                	li	a1,0
    80207b22:	0001c517          	auipc	a0,0x1c
    80207b26:	4de50513          	addi	a0,a0,1246 # 80224000 <disk>
    80207b2a:	ffff9097          	auipc	ra,0xffff9
    80207b2e:	c38080e7          	jalr	-968(ra) # 80200762 <memset>
  *R(VIRTIO_MMIO_QUEUE_PFN) = ((uint64)disk.pages) >> PGSHIFT;
    80207b32:	0001c717          	auipc	a4,0x1c
    80207b36:	4ce70713          	addi	a4,a4,1230 # 80224000 <disk>
    80207b3a:	00c75793          	srli	a5,a4,0xc
    80207b3e:	2781                	sext.w	a5,a5
    80207b40:	00002697          	auipc	a3,0x2
    80207b44:	4d86b683          	ld	a3,1240(a3) # 8020a018 <digits+0xc98>
    80207b48:	c29c                	sw	a5,0(a3)
  disk.desc = (struct VRingDesc *) disk.pages;
    80207b4a:	0001e797          	auipc	a5,0x1e
    80207b4e:	4b678793          	addi	a5,a5,1206 # 80226000 <disk+0x2000>
    80207b52:	e398                	sd	a4,0(a5)
  disk.avail = (uint16*)(((char*)disk.desc) + NUM*sizeof(struct VRingDesc));
    80207b54:	0001c717          	auipc	a4,0x1c
    80207b58:	52c70713          	addi	a4,a4,1324 # 80224080 <disk+0x80>
    80207b5c:	e798                	sd	a4,8(a5)
  disk.used = (struct UsedArea *) (disk.pages + PGSIZE);
    80207b5e:	0001d717          	auipc	a4,0x1d
    80207b62:	4a270713          	addi	a4,a4,1186 # 80225000 <disk+0x1000>
    80207b66:	eb98                	sd	a4,16(a5)
    disk.free[i] = 1;
    80207b68:	4705                	li	a4,1
    80207b6a:	00e78c23          	sb	a4,24(a5)
    80207b6e:	00e78ca3          	sb	a4,25(a5)
    80207b72:	00e78d23          	sb	a4,26(a5)
    80207b76:	00e78da3          	sb	a4,27(a5)
    80207b7a:	00e78e23          	sb	a4,28(a5)
    80207b7e:	00e78ea3          	sb	a4,29(a5)
    80207b82:	00e78f23          	sb	a4,30(a5)
    80207b86:	00e78fa3          	sb	a4,31(a5)
}
    80207b8a:	60a2                	ld	ra,8(sp)
    80207b8c:	6402                	ld	s0,0(sp)
    80207b8e:	0141                	addi	sp,sp,16
    80207b90:	8082                	ret
    panic("could not find virtio disk");
    80207b92:	00002517          	auipc	a0,0x2
    80207b96:	3be50513          	addi	a0,a0,958 # 80209f50 <digits+0xbd0>
    80207b9a:	ffff8097          	auipc	ra,0xffff8
    80207b9e:	5aa080e7          	jalr	1450(ra) # 80200144 <panic>
    panic("virtio disk has no queue 0");
    80207ba2:	00002517          	auipc	a0,0x2
    80207ba6:	3ce50513          	addi	a0,a0,974 # 80209f70 <digits+0xbf0>
    80207baa:	ffff8097          	auipc	ra,0xffff8
    80207bae:	59a080e7          	jalr	1434(ra) # 80200144 <panic>
    panic("virtio disk max queue too short");
    80207bb2:	00002517          	auipc	a0,0x2
    80207bb6:	3de50513          	addi	a0,a0,990 # 80209f90 <digits+0xc10>
    80207bba:	ffff8097          	auipc	ra,0xffff8
    80207bbe:	58a080e7          	jalr	1418(ra) # 80200144 <panic>

0000000080207bc2 <virtio_disk_rw>:
  return 0;
}

void
virtio_disk_rw(struct buf *b, int write)
{
    80207bc2:	7175                	addi	sp,sp,-144
    80207bc4:	e506                	sd	ra,136(sp)
    80207bc6:	e122                	sd	s0,128(sp)
    80207bc8:	fca6                	sd	s1,120(sp)
    80207bca:	f8ca                	sd	s2,112(sp)
    80207bcc:	f4ce                	sd	s3,104(sp)
    80207bce:	f0d2                	sd	s4,96(sp)
    80207bd0:	ecd6                	sd	s5,88(sp)
    80207bd2:	e8da                	sd	s6,80(sp)
    80207bd4:	e4de                	sd	s7,72(sp)
    80207bd6:	e0e2                	sd	s8,64(sp)
    80207bd8:	fc66                	sd	s9,56(sp)
    80207bda:	f86a                	sd	s10,48(sp)
    80207bdc:	f46e                	sd	s11,40(sp)
    80207bde:	0900                	addi	s0,sp,144
    80207be0:	8aaa                	mv	s5,a0
    80207be2:	8cae                	mv	s9,a1
  uint64 sector = b->sectorno;
    80207be4:	00c56d03          	lwu	s10,12(a0)

  acquire(&disk.vdisk_lock);
    80207be8:	0001e517          	auipc	a0,0x1e
    80207bec:	4c050513          	addi	a0,a0,1216 # 802260a8 <disk+0x20a8>
    80207bf0:	ffff9097          	auipc	ra,0xffff9
    80207bf4:	ad6080e7          	jalr	-1322(ra) # 802006c6 <acquire>
  for(int i = 0; i < 3; i++){
    80207bf8:	4981                	li	s3,0
  for(int i = 0; i < NUM; i++){
    80207bfa:	44a1                	li	s1,8
      disk.free[i] = 0;
    80207bfc:	0001cc17          	auipc	s8,0x1c
    80207c00:	404c0c13          	addi	s8,s8,1028 # 80224000 <disk>
    80207c04:	6b89                	lui	s7,0x2
  for(int i = 0; i < 3; i++){
    80207c06:	4b0d                	li	s6,3
    80207c08:	a0ad                	j	80207c72 <virtio_disk_rw+0xb0>
      disk.free[i] = 0;
    80207c0a:	00fc0733          	add	a4,s8,a5
    80207c0e:	975e                	add	a4,a4,s7
    80207c10:	00070c23          	sb	zero,24(a4)
    idx[i] = alloc_desc();
    80207c14:	c19c                	sw	a5,0(a1)
    if(idx[i] < 0){
    80207c16:	0207c563          	bltz	a5,80207c40 <virtio_disk_rw+0x7e>
  for(int i = 0; i < 3; i++){
    80207c1a:	2905                	addiw	s2,s2,1
    80207c1c:	0611                	addi	a2,a2,4 # 2004 <_entry-0x801fdffc>
    80207c1e:	19690e63          	beq	s2,s6,80207dba <virtio_disk_rw+0x1f8>
    idx[i] = alloc_desc();
    80207c22:	85b2                	mv	a1,a2
  for(int i = 0; i < NUM; i++){
    80207c24:	0001e717          	auipc	a4,0x1e
    80207c28:	3f470713          	addi	a4,a4,1012 # 80226018 <disk+0x2018>
    80207c2c:	87ce                	mv	a5,s3
    if(disk.free[i]){
    80207c2e:	00074683          	lbu	a3,0(a4)
    80207c32:	fee1                	bnez	a3,80207c0a <virtio_disk_rw+0x48>
  for(int i = 0; i < NUM; i++){
    80207c34:	2785                	addiw	a5,a5,1
    80207c36:	0705                	addi	a4,a4,1
    80207c38:	fe979be3          	bne	a5,s1,80207c2e <virtio_disk_rw+0x6c>
    idx[i] = alloc_desc();
    80207c3c:	57fd                	li	a5,-1
    80207c3e:	c19c                	sw	a5,0(a1)
      for(int j = 0; j < i; j++)
    80207c40:	01205d63          	blez	s2,80207c5a <virtio_disk_rw+0x98>
    80207c44:	8dce                	mv	s11,s3
        free_desc(idx[j]);
    80207c46:	000a2503          	lw	a0,0(s4)
    80207c4a:	00000097          	auipc	ra,0x0
    80207c4e:	d72080e7          	jalr	-654(ra) # 802079bc <free_desc>
      for(int j = 0; j < i; j++)
    80207c52:	2d85                	addiw	s11,s11,1
    80207c54:	0a11                	addi	s4,s4,4
    80207c56:	ff2d98e3          	bne	s11,s2,80207c46 <virtio_disk_rw+0x84>
  int idx[3];
  while(1){
    if(alloc3_desc(idx) == 0) {
      break;
    }
    sleep(&disk.free[0], &disk.vdisk_lock);
    80207c5a:	0001e597          	auipc	a1,0x1e
    80207c5e:	44e58593          	addi	a1,a1,1102 # 802260a8 <disk+0x20a8>
    80207c62:	0001e517          	auipc	a0,0x1e
    80207c66:	3b650513          	addi	a0,a0,950 # 80226018 <disk+0x2018>
    80207c6a:	ffffa097          	auipc	ra,0xffffa
    80207c6e:	6c8080e7          	jalr	1736(ra) # 80202332 <sleep>
  for(int i = 0; i < 3; i++){
    80207c72:	f8040a13          	addi	s4,s0,-128
{
    80207c76:	8652                	mv	a2,s4
  for(int i = 0; i < 3; i++){
    80207c78:	894e                	mv	s2,s3
    80207c7a:	b765                	j	80207c22 <virtio_disk_rw+0x60>
  disk.desc[idx[0]].next = idx[1];

  disk.desc[idx[1]].addr = (uint64) b->data;
  disk.desc[idx[1]].len = BSIZE;
  if(write)
    disk.desc[idx[1]].flags = 0; // device reads b->data
    80207c7c:	0001e717          	auipc	a4,0x1e
    80207c80:	38473703          	ld	a4,900(a4) # 80226000 <disk+0x2000>
    80207c84:	973e                	add	a4,a4,a5
    80207c86:	00071623          	sh	zero,12(a4)
  else
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
  disk.desc[idx[1]].flags |= VRING_DESC_F_NEXT;
    80207c8a:	0001c517          	auipc	a0,0x1c
    80207c8e:	37650513          	addi	a0,a0,886 # 80224000 <disk>
    80207c92:	0001e717          	auipc	a4,0x1e
    80207c96:	36e70713          	addi	a4,a4,878 # 80226000 <disk+0x2000>
    80207c9a:	6314                	ld	a3,0(a4)
    80207c9c:	96be                	add	a3,a3,a5
    80207c9e:	00c6d603          	lhu	a2,12(a3)
    80207ca2:	00166613          	ori	a2,a2,1
    80207ca6:	00c69623          	sh	a2,12(a3)
  disk.desc[idx[1]].next = idx[2];
    80207caa:	f8842683          	lw	a3,-120(s0)
    80207cae:	6310                	ld	a2,0(a4)
    80207cb0:	97b2                	add	a5,a5,a2
    80207cb2:	00d79723          	sh	a3,14(a5)

  disk.info[idx[0]].status = 0;
    80207cb6:	20048613          	addi	a2,s1,512
    80207cba:	0612                	slli	a2,a2,0x4
    80207cbc:	962a                	add	a2,a2,a0
    80207cbe:	02060823          	sb	zero,48(a2)
  disk.desc[idx[2]].addr = (uint64) &disk.info[idx[0]].status;
    80207cc2:	00469793          	slli	a5,a3,0x4
    80207cc6:	630c                	ld	a1,0(a4)
    80207cc8:	95be                	add	a1,a1,a5
    80207cca:	6689                	lui	a3,0x2
    80207ccc:	03068693          	addi	a3,a3,48 # 2030 <_entry-0x801fdfd0>
    80207cd0:	96ca                	add	a3,a3,s2
    80207cd2:	96aa                	add	a3,a3,a0
    80207cd4:	e194                	sd	a3,0(a1)
  disk.desc[idx[2]].len = 1;
    80207cd6:	6314                	ld	a3,0(a4)
    80207cd8:	96be                	add	a3,a3,a5
    80207cda:	4585                	li	a1,1
    80207cdc:	c68c                	sw	a1,8(a3)
  disk.desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
    80207cde:	6314                	ld	a3,0(a4)
    80207ce0:	96be                	add	a3,a3,a5
    80207ce2:	4509                	li	a0,2
    80207ce4:	00a69623          	sh	a0,12(a3)
  disk.desc[idx[2]].next = 0;
    80207ce8:	6314                	ld	a3,0(a4)
    80207cea:	97b6                	add	a5,a5,a3
    80207cec:	00079723          	sh	zero,14(a5)

  // record struct buf for virtio_disk_intr().
  b->disk = 1;
    80207cf0:	00baa223          	sw	a1,4(s5)
  disk.info[idx[0]].b = b;
    80207cf4:	03563423          	sd	s5,40(a2)

  // avail[0] is flags
  // avail[1] tells the device how far to look in avail[2...].
  // avail[2...] are desc[] indices the device should process.
  // we only tell device the first index in our chain of descriptors.
  disk.avail[2 + (disk.avail[1] % NUM)] = idx[0];
    80207cf8:	6714                	ld	a3,8(a4)
    80207cfa:	0026d783          	lhu	a5,2(a3)
    80207cfe:	8b9d                	andi	a5,a5,7
    80207d00:	0789                	addi	a5,a5,2
    80207d02:	0786                	slli	a5,a5,0x1
    80207d04:	96be                	add	a3,a3,a5
    80207d06:	00969023          	sh	s1,0(a3)
  __sync_synchronize();
    80207d0a:	0ff0000f          	fence
  disk.avail[1] = disk.avail[1] + 1;
    80207d0e:	6718                	ld	a4,8(a4)
    80207d10:	00275783          	lhu	a5,2(a4)
    80207d14:	2785                	addiw	a5,a5,1
    80207d16:	00f71123          	sh	a5,2(a4)

  *R(VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number
    80207d1a:	00002797          	auipc	a5,0x2
    80207d1e:	3067b783          	ld	a5,774(a5) # 8020a020 <digits+0xca0>
    80207d22:	0007a023          	sw	zero,0(a5)

  // Wait for virtio_disk_intr() to say request has finished.
  while(b->disk == 1) {
    80207d26:	004aa783          	lw	a5,4(s5)
    80207d2a:	02b79163          	bne	a5,a1,80207d4c <virtio_disk_rw+0x18a>
    sleep(b, &disk.vdisk_lock);
    80207d2e:	0001e917          	auipc	s2,0x1e
    80207d32:	37a90913          	addi	s2,s2,890 # 802260a8 <disk+0x20a8>
  while(b->disk == 1) {
    80207d36:	4485                	li	s1,1
    sleep(b, &disk.vdisk_lock);
    80207d38:	85ca                	mv	a1,s2
    80207d3a:	8556                	mv	a0,s5
    80207d3c:	ffffa097          	auipc	ra,0xffffa
    80207d40:	5f6080e7          	jalr	1526(ra) # 80202332 <sleep>
  while(b->disk == 1) {
    80207d44:	004aa783          	lw	a5,4(s5)
    80207d48:	fe9788e3          	beq	a5,s1,80207d38 <virtio_disk_rw+0x176>
  }

  disk.info[idx[0]].b = 0;
    80207d4c:	f8042483          	lw	s1,-128(s0)
    80207d50:	20048713          	addi	a4,s1,512
    80207d54:	0712                	slli	a4,a4,0x4
    80207d56:	0001c797          	auipc	a5,0x1c
    80207d5a:	2aa78793          	addi	a5,a5,682 # 80224000 <disk>
    80207d5e:	97ba                	add	a5,a5,a4
    80207d60:	0207b423          	sd	zero,40(a5)
    if(disk.desc[i].flags & VRING_DESC_F_NEXT)
    80207d64:	0001e917          	auipc	s2,0x1e
    80207d68:	29c90913          	addi	s2,s2,668 # 80226000 <disk+0x2000>
    80207d6c:	a019                	j	80207d72 <virtio_disk_rw+0x1b0>
      i = disk.desc[i].next;
    80207d6e:	00e7d483          	lhu	s1,14(a5)
    free_desc(i);
    80207d72:	8526                	mv	a0,s1
    80207d74:	00000097          	auipc	ra,0x0
    80207d78:	c48080e7          	jalr	-952(ra) # 802079bc <free_desc>
    if(disk.desc[i].flags & VRING_DESC_F_NEXT)
    80207d7c:	0492                	slli	s1,s1,0x4
    80207d7e:	00093783          	ld	a5,0(s2)
    80207d82:	97a6                	add	a5,a5,s1
    80207d84:	00c7d703          	lhu	a4,12(a5)
    80207d88:	8b05                	andi	a4,a4,1
    80207d8a:	f375                	bnez	a4,80207d6e <virtio_disk_rw+0x1ac>
  free_chain(idx[0]);

  release(&disk.vdisk_lock);
    80207d8c:	0001e517          	auipc	a0,0x1e
    80207d90:	31c50513          	addi	a0,a0,796 # 802260a8 <disk+0x20a8>
    80207d94:	ffff9097          	auipc	ra,0xffff9
    80207d98:	986080e7          	jalr	-1658(ra) # 8020071a <release>
}
    80207d9c:	60aa                	ld	ra,136(sp)
    80207d9e:	640a                	ld	s0,128(sp)
    80207da0:	74e6                	ld	s1,120(sp)
    80207da2:	7946                	ld	s2,112(sp)
    80207da4:	79a6                	ld	s3,104(sp)
    80207da6:	7a06                	ld	s4,96(sp)
    80207da8:	6ae6                	ld	s5,88(sp)
    80207daa:	6b46                	ld	s6,80(sp)
    80207dac:	6ba6                	ld	s7,72(sp)
    80207dae:	6c06                	ld	s8,64(sp)
    80207db0:	7ce2                	ld	s9,56(sp)
    80207db2:	7d42                	ld	s10,48(sp)
    80207db4:	7da2                	ld	s11,40(sp)
    80207db6:	6149                	addi	sp,sp,144
    80207db8:	8082                	ret
  if(write)
    80207dba:	019037b3          	snez	a5,s9
    80207dbe:	f6f42823          	sw	a5,-144(s0)
  buf0.reserved = 0;
    80207dc2:	f6042a23          	sw	zero,-140(s0)
  buf0.sector = sector;
    80207dc6:	f7a43c23          	sd	s10,-136(s0)
  disk.desc[idx[0]].addr = (uint64) kwalkaddr(myproc()->kpagetable, (uint64) &buf0);
    80207dca:	ffffa097          	auipc	ra,0xffffa
    80207dce:	cc4080e7          	jalr	-828(ra) # 80201a8e <myproc>
    80207dd2:	f8042483          	lw	s1,-128(s0)
    80207dd6:	00449913          	slli	s2,s1,0x4
    80207dda:	0001e997          	auipc	s3,0x1e
    80207dde:	22698993          	addi	s3,s3,550 # 80226000 <disk+0x2000>
    80207de2:	0009ba03          	ld	s4,0(s3)
    80207de6:	9a4a                	add	s4,s4,s2
    80207de8:	f7040593          	addi	a1,s0,-144
    80207dec:	6d28                	ld	a0,88(a0)
    80207dee:	ffff9097          	auipc	ra,0xffff9
    80207df2:	e02080e7          	jalr	-510(ra) # 80200bf0 <kwalkaddr>
    80207df6:	00aa3023          	sd	a0,0(s4)
  disk.desc[idx[0]].len = sizeof(buf0);
    80207dfa:	0009b783          	ld	a5,0(s3)
    80207dfe:	97ca                	add	a5,a5,s2
    80207e00:	4741                	li	a4,16
    80207e02:	c798                	sw	a4,8(a5)
  disk.desc[idx[0]].flags = VRING_DESC_F_NEXT;
    80207e04:	0009b783          	ld	a5,0(s3)
    80207e08:	97ca                	add	a5,a5,s2
    80207e0a:	4705                	li	a4,1
    80207e0c:	00e79623          	sh	a4,12(a5)
  disk.desc[idx[0]].next = idx[1];
    80207e10:	f8442783          	lw	a5,-124(s0)
    80207e14:	0009b703          	ld	a4,0(s3)
    80207e18:	974a                	add	a4,a4,s2
    80207e1a:	00f71723          	sh	a5,14(a4)
  disk.desc[idx[1]].addr = (uint64) b->data;
    80207e1e:	0792                	slli	a5,a5,0x4
    80207e20:	0009b703          	ld	a4,0(s3)
    80207e24:	973e                	add	a4,a4,a5
    80207e26:	058a8693          	addi	a3,s5,88
    80207e2a:	e314                	sd	a3,0(a4)
  disk.desc[idx[1]].len = BSIZE;
    80207e2c:	0009b703          	ld	a4,0(s3)
    80207e30:	973e                	add	a4,a4,a5
    80207e32:	20000693          	li	a3,512
    80207e36:	c714                	sw	a3,8(a4)
  if(write)
    80207e38:	e40c92e3          	bnez	s9,80207c7c <virtio_disk_rw+0xba>
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
    80207e3c:	0001e717          	auipc	a4,0x1e
    80207e40:	1c473703          	ld	a4,452(a4) # 80226000 <disk+0x2000>
    80207e44:	973e                	add	a4,a4,a5
    80207e46:	4689                	li	a3,2
    80207e48:	00d71623          	sh	a3,12(a4)
    80207e4c:	bd3d                	j	80207c8a <virtio_disk_rw+0xc8>

0000000080207e4e <virtio_disk_intr>:

void
virtio_disk_intr()
{
    80207e4e:	1101                	addi	sp,sp,-32
    80207e50:	ec06                	sd	ra,24(sp)
    80207e52:	e822                	sd	s0,16(sp)
    80207e54:	e426                	sd	s1,8(sp)
    80207e56:	e04a                	sd	s2,0(sp)
    80207e58:	1000                	addi	s0,sp,32
  acquire(&disk.vdisk_lock);
    80207e5a:	0001e517          	auipc	a0,0x1e
    80207e5e:	24e50513          	addi	a0,a0,590 # 802260a8 <disk+0x20a8>
    80207e62:	ffff9097          	auipc	ra,0xffff9
    80207e66:	864080e7          	jalr	-1948(ra) # 802006c6 <acquire>

  while((disk.used_idx % NUM) != (disk.used->id % NUM)){
    80207e6a:	0001e717          	auipc	a4,0x1e
    80207e6e:	19670713          	addi	a4,a4,406 # 80226000 <disk+0x2000>
    80207e72:	02075783          	lhu	a5,32(a4)
    80207e76:	6b18                	ld	a4,16(a4)
    80207e78:	00275683          	lhu	a3,2(a4)
    80207e7c:	8ebd                	xor	a3,a3,a5
    80207e7e:	8a9d                	andi	a3,a3,7
    80207e80:	cab9                	beqz	a3,80207ed6 <virtio_disk_intr+0x88>
    int id = disk.used->elems[disk.used_idx].id;

    if(disk.info[id].status != 0)
    80207e82:	0001c917          	auipc	s2,0x1c
    80207e86:	17e90913          	addi	s2,s2,382 # 80224000 <disk>
      panic("virtio_disk_intr status");
    
    disk.info[id].b->disk = 0;   // disk is done with buf
    wakeup(disk.info[id].b);

    disk.used_idx = (disk.used_idx + 1) % NUM;
    80207e8a:	0001e497          	auipc	s1,0x1e
    80207e8e:	17648493          	addi	s1,s1,374 # 80226000 <disk+0x2000>
    int id = disk.used->elems[disk.used_idx].id;
    80207e92:	078e                	slli	a5,a5,0x3
    80207e94:	973e                	add	a4,a4,a5
    80207e96:	435c                	lw	a5,4(a4)
    if(disk.info[id].status != 0)
    80207e98:	20078713          	addi	a4,a5,512
    80207e9c:	0712                	slli	a4,a4,0x4
    80207e9e:	974a                	add	a4,a4,s2
    80207ea0:	03074703          	lbu	a4,48(a4)
    80207ea4:	e335                	bnez	a4,80207f08 <virtio_disk_intr+0xba>
    disk.info[id].b->disk = 0;   // disk is done with buf
    80207ea6:	20078793          	addi	a5,a5,512
    80207eaa:	0792                	slli	a5,a5,0x4
    80207eac:	97ca                	add	a5,a5,s2
    80207eae:	7798                	ld	a4,40(a5)
    80207eb0:	00072223          	sw	zero,4(a4)
    wakeup(disk.info[id].b);
    80207eb4:	7788                	ld	a0,40(a5)
    80207eb6:	ffffa097          	auipc	ra,0xffffa
    80207eba:	5f8080e7          	jalr	1528(ra) # 802024ae <wakeup>
    disk.used_idx = (disk.used_idx + 1) % NUM;
    80207ebe:	0204d783          	lhu	a5,32(s1)
    80207ec2:	2785                	addiw	a5,a5,1
    80207ec4:	8b9d                	andi	a5,a5,7
    80207ec6:	02f49023          	sh	a5,32(s1)
  while((disk.used_idx % NUM) != (disk.used->id % NUM)){
    80207eca:	6898                	ld	a4,16(s1)
    80207ecc:	00275683          	lhu	a3,2(a4)
    80207ed0:	8a9d                	andi	a3,a3,7
    80207ed2:	fcf690e3          	bne	a3,a5,80207e92 <virtio_disk_intr+0x44>
  }
  *R(VIRTIO_MMIO_INTERRUPT_ACK) = *R(VIRTIO_MMIO_INTERRUPT_STATUS) & 0x3;
    80207ed6:	00002797          	auipc	a5,0x2
    80207eda:	1527b783          	ld	a5,338(a5) # 8020a028 <digits+0xca8>
    80207ede:	439c                	lw	a5,0(a5)
    80207ee0:	8b8d                	andi	a5,a5,3
    80207ee2:	00002717          	auipc	a4,0x2
    80207ee6:	14e73703          	ld	a4,334(a4) # 8020a030 <digits+0xcb0>
    80207eea:	c31c                	sw	a5,0(a4)

  release(&disk.vdisk_lock);
    80207eec:	0001e517          	auipc	a0,0x1e
    80207ef0:	1bc50513          	addi	a0,a0,444 # 802260a8 <disk+0x20a8>
    80207ef4:	ffff9097          	auipc	ra,0xffff9
    80207ef8:	826080e7          	jalr	-2010(ra) # 8020071a <release>
}
    80207efc:	60e2                	ld	ra,24(sp)
    80207efe:	6442                	ld	s0,16(sp)
    80207f00:	64a2                	ld	s1,8(sp)
    80207f02:	6902                	ld	s2,0(sp)
    80207f04:	6105                	addi	sp,sp,32
    80207f06:	8082                	ret
      panic("virtio_disk_intr status");
    80207f08:	00002517          	auipc	a0,0x2
    80207f0c:	0a850513          	addi	a0,a0,168 # 80209fb0 <digits+0xc30>
    80207f10:	ffff8097          	auipc	ra,0xffff8
    80207f14:	234080e7          	jalr	564(ra) # 80200144 <panic>
	...

0000000080208000 <_trampoline>:
    80208000:	14051573          	csrrw	a0,sscratch,a0
    80208004:	02153423          	sd	ra,40(a0)
    80208008:	02253823          	sd	sp,48(a0)
    8020800c:	02353c23          	sd	gp,56(a0)
    80208010:	04453023          	sd	tp,64(a0)
    80208014:	04553423          	sd	t0,72(a0)
    80208018:	04653823          	sd	t1,80(a0)
    8020801c:	04753c23          	sd	t2,88(a0)
    80208020:	f120                	sd	s0,96(a0)
    80208022:	f524                	sd	s1,104(a0)
    80208024:	fd2c                	sd	a1,120(a0)
    80208026:	e150                	sd	a2,128(a0)
    80208028:	e554                	sd	a3,136(a0)
    8020802a:	e958                	sd	a4,144(a0)
    8020802c:	ed5c                	sd	a5,152(a0)
    8020802e:	0b053023          	sd	a6,160(a0)
    80208032:	0b153423          	sd	a7,168(a0)
    80208036:	0b253823          	sd	s2,176(a0)
    8020803a:	0b353c23          	sd	s3,184(a0)
    8020803e:	0d453023          	sd	s4,192(a0)
    80208042:	0d553423          	sd	s5,200(a0)
    80208046:	0d653823          	sd	s6,208(a0)
    8020804a:	0d753c23          	sd	s7,216(a0)
    8020804e:	0f853023          	sd	s8,224(a0)
    80208052:	0f953423          	sd	s9,232(a0)
    80208056:	0fa53823          	sd	s10,240(a0)
    8020805a:	0fb53c23          	sd	s11,248(a0)
    8020805e:	11c53023          	sd	t3,256(a0)
    80208062:	11d53423          	sd	t4,264(a0)
    80208066:	11e53823          	sd	t5,272(a0)
    8020806a:	11f53c23          	sd	t6,280(a0)
    8020806e:	140022f3          	csrr	t0,sscratch
    80208072:	06553823          	sd	t0,112(a0)
    80208076:	00853103          	ld	sp,8(a0)
    8020807a:	02053203          	ld	tp,32(a0)
    8020807e:	01053283          	ld	t0,16(a0)
    80208082:	00053303          	ld	t1,0(a0)
    80208086:	18031073          	csrw	satp,t1
    8020808a:	12000073          	sfence.vma
    8020808e:	8282                	jr	t0

0000000080208090 <userret>:
    80208090:	18059073          	csrw	satp,a1
    80208094:	12000073          	sfence.vma
    80208098:	07053283          	ld	t0,112(a0)
    8020809c:	14029073          	csrw	sscratch,t0
    802080a0:	02853083          	ld	ra,40(a0)
    802080a4:	03053103          	ld	sp,48(a0)
    802080a8:	03853183          	ld	gp,56(a0)
    802080ac:	04053203          	ld	tp,64(a0)
    802080b0:	04853283          	ld	t0,72(a0)
    802080b4:	05053303          	ld	t1,80(a0)
    802080b8:	05853383          	ld	t2,88(a0)
    802080bc:	7120                	ld	s0,96(a0)
    802080be:	7524                	ld	s1,104(a0)
    802080c0:	7d2c                	ld	a1,120(a0)
    802080c2:	6150                	ld	a2,128(a0)
    802080c4:	6554                	ld	a3,136(a0)
    802080c6:	6958                	ld	a4,144(a0)
    802080c8:	6d5c                	ld	a5,152(a0)
    802080ca:	0a053803          	ld	a6,160(a0)
    802080ce:	0a853883          	ld	a7,168(a0)
    802080d2:	0b053903          	ld	s2,176(a0)
    802080d6:	0b853983          	ld	s3,184(a0)
    802080da:	0c053a03          	ld	s4,192(a0)
    802080de:	0c853a83          	ld	s5,200(a0)
    802080e2:	0d053b03          	ld	s6,208(a0)
    802080e6:	0d853b83          	ld	s7,216(a0)
    802080ea:	0e053c03          	ld	s8,224(a0)
    802080ee:	0e853c83          	ld	s9,232(a0)
    802080f2:	0f053d03          	ld	s10,240(a0)
    802080f6:	0f853d83          	ld	s11,248(a0)
    802080fa:	10053e03          	ld	t3,256(a0)
    802080fe:	10853e83          	ld	t4,264(a0)
    80208102:	11053f03          	ld	t5,272(a0)
    80208106:	11853f83          	ld	t6,280(a0)
    8020810a:	14051573          	csrrw	a0,sscratch,a0
    8020810e:	10200073          	sret
	...
