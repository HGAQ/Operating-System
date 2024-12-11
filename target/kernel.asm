
target/kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080200000 <_entry>:
    80200000:	00150293          	addi	t0,a0,1
    80200004:	02ba                	slli	t0,t0,0xe
    80200006:	0000c117          	auipc	sp,0xc
    8020000a:	d0213103          	ld	sp,-766(sp) # 8020bd08 <_GLOBAL_OFFSET_TABLE_+0x50>
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
    8020009a:	450080e7          	jalr	1104(ra) # 802074e6 <consputc>
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
    802000d0:	41a080e7          	jalr	1050(ra) # 802074e6 <consputc>
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
    80200184:	00014717          	auipc	a4,0x14
    80200188:	e6f72e23          	sw	a5,-388(a4) # 80214000 <panicked>
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
    802001c0:	00014d97          	auipc	s11,0x14
    802001c4:	e60dad83          	lw	s11,-416(s11) # 80214020 <pr+0x18>
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
    802001fe:	00014517          	auipc	a0,0x14
    80200202:	e0a50513          	addi	a0,a0,-502 # 80214008 <pr>
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
    80200224:	2c6080e7          	jalr	710(ra) # 802074e6 <consputc>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    80200228:	2985                	addiw	s3,s3,1
    8020022a:	013a07b3          	add	a5,s4,s3
    8020022e:	0007c503          	lbu	a0,0(a5) # fffffffffffff000 <ebss_clear+0xffffffff7fdd9000>
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
    802002b6:	234080e7          	jalr	564(ra) # 802074e6 <consputc>
  consputc('x');
    802002ba:	07800513          	li	a0,120
    802002be:	00007097          	auipc	ra,0x7
    802002c2:	228080e7          	jalr	552(ra) # 802074e6 <consputc>
    802002c6:	84ea                	mv	s1,s10
    consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
    802002c8:	03c95793          	srli	a5,s2,0x3c
    802002cc:	97da                	add	a5,a5,s6
    802002ce:	0007c503          	lbu	a0,0(a5)
    802002d2:	00007097          	auipc	ra,0x7
    802002d6:	214080e7          	jalr	532(ra) # 802074e6 <consputc>
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
    802002fc:	1ee080e7          	jalr	494(ra) # 802074e6 <consputc>
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
    8020031e:	1cc080e7          	jalr	460(ra) # 802074e6 <consputc>
      break;
    80200322:	b719                	j	80200228 <printf+0x9a>
      consputc('%');
    80200324:	8556                	mv	a0,s5
    80200326:	00007097          	auipc	ra,0x7
    8020032a:	1c0080e7          	jalr	448(ra) # 802074e6 <consputc>
      consputc(c);
    8020032e:	8526                	mv	a0,s1
    80200330:	00007097          	auipc	ra,0x7
    80200334:	1b6080e7          	jalr	438(ra) # 802074e6 <consputc>
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
    8020035c:	00014517          	auipc	a0,0x14
    80200360:	cac50513          	addi	a0,a0,-852 # 80214008 <pr>
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
    8020037e:	00014517          	auipc	a0,0x14
    80200382:	c8a50513          	addi	a0,a0,-886 # 80214008 <pr>
    80200386:	00000097          	auipc	ra,0x0
    8020038a:	2fc080e7          	jalr	764(ra) # 80200682 <initlock>
  pr.locking = 1;   // changed, used to be 1
    8020038e:	4785                	li	a5,1
    80200390:	00014717          	auipc	a4,0x14
    80200394:	c8f72823          	sw	a5,-880(a4) # 80214020 <pr+0x18>
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
    80200454:	0000c797          	auipc	a5,0xc
    80200458:	88c7b783          	ld	a5,-1908(a5) # 8020bce0 <_GLOBAL_OFFSET_TABLE_+0x28>
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
    80200476:	00014917          	auipc	s2,0x14
    8020047a:	bb290913          	addi	s2,s2,-1102 # 80214028 <kmem>
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
    80200518:	00014497          	auipc	s1,0x14
    8020051c:	b1048493          	addi	s1,s1,-1264 # 80214028 <kmem>
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
    80200540:	0000b517          	auipc	a0,0xb
    80200544:	7a053503          	ld	a0,1952(a0) # 8020bce0 <_GLOBAL_OFFSET_TABLE_+0x28>
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
    80200564:	00014497          	auipc	s1,0x14
    80200568:	ac448493          	addi	s1,s1,-1340 # 80214028 <kmem>
    8020056c:	8526                	mv	a0,s1
    8020056e:	00000097          	auipc	ra,0x0
    80200572:	158080e7          	jalr	344(ra) # 802006c6 <acquire>
  r = kmem.freelist;
    80200576:	6c84                	ld	s1,24(s1)
  if(r) {
    80200578:	c89d                	beqz	s1,802005ae <kalloc+0x54>
    kmem.freelist = r->next;
    8020057a:	609c                	ld	a5,0(s1)
    8020057c:	00014517          	auipc	a0,0x14
    80200580:	aac50513          	addi	a0,a0,-1364 # 80214028 <kmem>
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
    802005ae:	00014517          	auipc	a0,0x14
    802005b2:	a7a50513          	addi	a0,a0,-1414 # 80214028 <kmem>
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
    802005c6:	00014517          	auipc	a0,0x14
    802005ca:	a8253503          	ld	a0,-1406(a0) # 80214048 <kmem+0x20>
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
    802005f2:	432080e7          	jalr	1074(ra) # 80201a20 <mycpu>
    802005f6:	5d3c                	lw	a5,120(a0)
    802005f8:	cf89                	beqz	a5,80200612 <push_off+0x3c>
    mycpu()->intena = old;
  mycpu()->noff += 1;
    802005fa:	00001097          	auipc	ra,0x1
    802005fe:	426080e7          	jalr	1062(ra) # 80201a20 <mycpu>
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
    80200616:	40e080e7          	jalr	1038(ra) # 80201a20 <mycpu>
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
    8020062e:	3f6080e7          	jalr	1014(ra) # 80201a20 <mycpu>
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
    802006b0:	374080e7          	jalr	884(ra) # 80201a20 <mycpu>
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
    802006fa:	32a080e7          	jalr	810(ra) # 80201a20 <mycpu>
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
    80200812:	177d                	addi	a4,a4,-1 # ffffffffffffefff <ebss_clear+0xffffffff7fdd8fff>
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
    802009f2:	00013717          	auipc	a4,0x13
    802009f6:	65e70713          	addi	a4,a4,1630 # 80214050 <started>
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
    80200a12:	f60080e7          	jalr	-160(ra) # 8020296e <trapinithart>
    plicinithart();  // ask PLIC for device interrupts
    80200a16:	00007097          	auipc	ra,0x7
    80200a1a:	88e080e7          	jalr	-1906(ra) # 802072a4 <plicinithart>
    printf("hart 1 init done\n");
    80200a1e:	00009517          	auipc	a0,0x9
    80200a22:	9d250513          	addi	a0,a0,-1582 # 802093f0 <digits+0x70>
    80200a26:	fffff097          	auipc	ra,0xfffff
    80200a2a:	768080e7          	jalr	1896(ra) # 8020018e <printf>
  }
  scheduler();
    80200a2e:	00001097          	auipc	ra,0x1
    80200a32:	592080e7          	jalr	1426(ra) # 80201fc0 <scheduler>
    consoleinit();
    80200a36:	00007097          	auipc	ra,0x7
    80200a3a:	c80080e7          	jalr	-896(ra) # 802076b6 <consoleinit>
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
    80200a6a:	d28080e7          	jalr	-728(ra) # 8020578e <timerinit>
    trapinithart();  // install kernel trap vector, including interrupt handler
    80200a6e:	00002097          	auipc	ra,0x2
    80200a72:	f00080e7          	jalr	-256(ra) # 8020296e <trapinithart>
    procinit();
    80200a76:	00001097          	auipc	ra,0x1
    80200a7a:	f24080e7          	jalr	-220(ra) # 8020199a <procinit>
    plicinit();
    80200a7e:	00007097          	auipc	ra,0x7
    80200a82:	80e080e7          	jalr	-2034(ra) # 8020728c <plicinit>
    plicinithart();
    80200a86:	00007097          	auipc	ra,0x7
    80200a8a:	81e080e7          	jalr	-2018(ra) # 802072a4 <plicinithart>
    disk_init();
    80200a8e:	00005097          	auipc	ra,0x5
    80200a92:	d9c080e7          	jalr	-612(ra) # 8020582a <disk_init>
    binit();         // buffer cache
    80200a96:	00003097          	auipc	ra,0x3
    80200a9a:	d7e080e7          	jalr	-642(ra) # 80203814 <binit>
    fileinit();      // file table
    80200a9e:	00003097          	auipc	ra,0x3
    80200aa2:	182080e7          	jalr	386(ra) # 80203c20 <fileinit>
    userinit();      // first user process
    80200aa6:	00001097          	auipc	ra,0x1
    80200aaa:	2a4080e7          	jalr	676(ra) # 80201d4a <userinit>
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
    80200ada:	00013717          	auipc	a4,0x13
    80200ade:	56f72b23          	sw	a5,1398(a4) # 80214050 <started>
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
    80200aea:	00013797          	auipc	a5,0x13
    80200aee:	56e7b783          	ld	a5,1390(a5) # 80214058 <kernel_pagetable>
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
    80200b68:	3a5d                	addiw	s4,s4,-9 # ffffffffffffeff7 <ebss_clear+0xffffffff7fdd8ff7>
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
    80200c50:	00013517          	auipc	a0,0x13
    80200c54:	40853503          	ld	a0,1032(a0) # 80214058 <kernel_pagetable>
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
    80200d04:	00013517          	auipc	a0,0x13
    80200d08:	35453503          	ld	a0,852(a0) # 80214058 <kernel_pagetable>
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
    80200d40:	00013717          	auipc	a4,0x13
    80200d44:	30a73c23          	sd	a0,792(a4) # 80214058 <kernel_pagetable>
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
    80200dc4:	0000b497          	auipc	s1,0xb
    80200dc8:	f144b483          	ld	s1,-236(s1) # 8020bcd8 <_GLOBAL_OFFSET_TABLE_+0x20>
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
    80200e00:	0000b597          	auipc	a1,0xb
    80200e04:	ec05b583          	ld	a1,-320(a1) # 8020bcc0 <_GLOBAL_OFFSET_TABLE_+0x8>
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
    8020138a:	6b6080e7          	jalr	1718(ra) # 80201a3c <myproc>
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

00000000802013c4 <copyin>:
int
copyin(pagetable_t pagetable, char *dst, uint64 srcva, uint64 len)
{
  uint64 n, va0, pa0;

  while(len > 0){
    802013c4:	caa5                	beqz	a3,80201434 <copyin+0x70>
{
    802013c6:	715d                	addi	sp,sp,-80
    802013c8:	e486                	sd	ra,72(sp)
    802013ca:	e0a2                	sd	s0,64(sp)
    802013cc:	fc26                	sd	s1,56(sp)
    802013ce:	f84a                	sd	s2,48(sp)
    802013d0:	f44e                	sd	s3,40(sp)
    802013d2:	f052                	sd	s4,32(sp)
    802013d4:	ec56                	sd	s5,24(sp)
    802013d6:	e85a                	sd	s6,16(sp)
    802013d8:	e45e                	sd	s7,8(sp)
    802013da:	e062                	sd	s8,0(sp)
    802013dc:	0880                	addi	s0,sp,80
    802013de:	8b2a                	mv	s6,a0
    802013e0:	8a2e                	mv	s4,a1
    802013e2:	8c32                	mv	s8,a2
    802013e4:	89b6                	mv	s3,a3
    va0 = PGROUNDDOWN(srcva);
    802013e6:	7bfd                	lui	s7,0xfffff
    pa0 = walkaddr(pagetable, va0);
    if(pa0 == NULL)
      return -1;
    n = PGSIZE - (srcva - va0);
    802013e8:	6a85                	lui	s5,0x1
    802013ea:	a01d                	j	80201410 <copyin+0x4c>
    if(n > len)
      n = len;
    memmove(dst, (void *)(pa0 + (srcva - va0)), n);
    802013ec:	018505b3          	add	a1,a0,s8
    802013f0:	0004861b          	sext.w	a2,s1
    802013f4:	412585b3          	sub	a1,a1,s2
    802013f8:	8552                	mv	a0,s4
    802013fa:	fffff097          	auipc	ra,0xfffff
    802013fe:	3c4080e7          	jalr	964(ra) # 802007be <memmove>

    len -= n;
    80201402:	409989b3          	sub	s3,s3,s1
    dst += n;
    80201406:	9a26                	add	s4,s4,s1
    srcva = va0 + PGSIZE;
    80201408:	01590c33          	add	s8,s2,s5
  while(len > 0){
    8020140c:	02098263          	beqz	s3,80201430 <copyin+0x6c>
    va0 = PGROUNDDOWN(srcva);
    80201410:	017c7933          	and	s2,s8,s7
    pa0 = walkaddr(pagetable, va0);
    80201414:	85ca                	mv	a1,s2
    80201416:	855a                	mv	a0,s6
    80201418:	fffff097          	auipc	ra,0xfffff
    8020141c:	796080e7          	jalr	1942(ra) # 80200bae <walkaddr>
    if(pa0 == NULL)
    80201420:	cd01                	beqz	a0,80201438 <copyin+0x74>
    n = PGSIZE - (srcva - va0);
    80201422:	418904b3          	sub	s1,s2,s8
    80201426:	94d6                	add	s1,s1,s5
    80201428:	fc99f2e3          	bgeu	s3,s1,802013ec <copyin+0x28>
    8020142c:	84ce                	mv	s1,s3
    8020142e:	bf7d                	j	802013ec <copyin+0x28>
  }
  return 0;
    80201430:	4501                	li	a0,0
    80201432:	a021                	j	8020143a <copyin+0x76>
    80201434:	4501                	li	a0,0
}
    80201436:	8082                	ret
      return -1;
    80201438:	557d                	li	a0,-1
}
    8020143a:	60a6                	ld	ra,72(sp)
    8020143c:	6406                	ld	s0,64(sp)
    8020143e:	74e2                	ld	s1,56(sp)
    80201440:	7942                	ld	s2,48(sp)
    80201442:	79a2                	ld	s3,40(sp)
    80201444:	7a02                	ld	s4,32(sp)
    80201446:	6ae2                	ld	s5,24(sp)
    80201448:	6b42                	ld	s6,16(sp)
    8020144a:	6ba2                	ld	s7,8(sp)
    8020144c:	6c02                	ld	s8,0(sp)
    8020144e:	6161                	addi	sp,sp,80
    80201450:	8082                	ret

0000000080201452 <copyin2>:

int
copyin2(char *dst, uint64 srcva, uint64 len)
{
    80201452:	7179                	addi	sp,sp,-48
    80201454:	f406                	sd	ra,40(sp)
    80201456:	f022                	sd	s0,32(sp)
    80201458:	ec26                	sd	s1,24(sp)
    8020145a:	e84a                	sd	s2,16(sp)
    8020145c:	e44e                	sd	s3,8(sp)
    8020145e:	1800                	addi	s0,sp,48
    80201460:	89aa                	mv	s3,a0
    80201462:	84ae                	mv	s1,a1
    80201464:	8932                	mv	s2,a2
  uint64 sz = myproc()->sz;
    80201466:	00000097          	auipc	ra,0x0
    8020146a:	5d6080e7          	jalr	1494(ra) # 80201a3c <myproc>
    8020146e:	653c                	ld	a5,72(a0)
  if (srcva + len > sz || srcva >= sz) {
    80201470:	01248733          	add	a4,s1,s2
    80201474:	02e7e463          	bltu	a5,a4,8020149c <copyin2+0x4a>
    80201478:	02f4f463          	bgeu	s1,a5,802014a0 <copyin2+0x4e>
    return -1;
  }
  memmove(dst, (void *)srcva, len);
    8020147c:	0009061b          	sext.w	a2,s2
    80201480:	85a6                	mv	a1,s1
    80201482:	854e                	mv	a0,s3
    80201484:	fffff097          	auipc	ra,0xfffff
    80201488:	33a080e7          	jalr	826(ra) # 802007be <memmove>
  return 0;
    8020148c:	4501                	li	a0,0
}
    8020148e:	70a2                	ld	ra,40(sp)
    80201490:	7402                	ld	s0,32(sp)
    80201492:	64e2                	ld	s1,24(sp)
    80201494:	6942                	ld	s2,16(sp)
    80201496:	69a2                	ld	s3,8(sp)
    80201498:	6145                	addi	sp,sp,48
    8020149a:	8082                	ret
    return -1;
    8020149c:	557d                	li	a0,-1
    8020149e:	bfc5                	j	8020148e <copyin2+0x3c>
    802014a0:	557d                	li	a0,-1
    802014a2:	b7f5                	j	8020148e <copyin2+0x3c>

00000000802014a4 <copyinstr>:
copyinstr(pagetable_t pagetable, char *dst, uint64 srcva, uint64 max)
{
  uint64 n, va0, pa0;
  int got_null = 0;

  while(got_null == 0 && max > 0){
    802014a4:	c2dd                	beqz	a3,8020154a <copyinstr+0xa6>
{
    802014a6:	715d                	addi	sp,sp,-80
    802014a8:	e486                	sd	ra,72(sp)
    802014aa:	e0a2                	sd	s0,64(sp)
    802014ac:	fc26                	sd	s1,56(sp)
    802014ae:	f84a                	sd	s2,48(sp)
    802014b0:	f44e                	sd	s3,40(sp)
    802014b2:	f052                	sd	s4,32(sp)
    802014b4:	ec56                	sd	s5,24(sp)
    802014b6:	e85a                	sd	s6,16(sp)
    802014b8:	e45e                	sd	s7,8(sp)
    802014ba:	0880                	addi	s0,sp,80
    802014bc:	8a2a                	mv	s4,a0
    802014be:	8b2e                	mv	s6,a1
    802014c0:	8bb2                	mv	s7,a2
    802014c2:	84b6                	mv	s1,a3
    va0 = PGROUNDDOWN(srcva);
    802014c4:	7afd                	lui	s5,0xfffff
    pa0 = walkaddr(pagetable, va0);
    if(pa0 == NULL)
      return -1;
    n = PGSIZE - (srcva - va0);
    802014c6:	6985                	lui	s3,0x1
    802014c8:	a02d                	j	802014f2 <copyinstr+0x4e>
      n = max;

    char *p = (char *) (pa0 + (srcva - va0));
    while(n > 0){
      if(*p == '\0'){
        *dst = '\0';
    802014ca:	00078023          	sb	zero,0(a5)
    802014ce:	4785                	li	a5,1
      dst++;
    }

    srcva = va0 + PGSIZE;
  }
  if(got_null){
    802014d0:	37fd                	addiw	a5,a5,-1
    802014d2:	0007851b          	sext.w	a0,a5
    return 0;
  } else {
    return -1;
  }
}
    802014d6:	60a6                	ld	ra,72(sp)
    802014d8:	6406                	ld	s0,64(sp)
    802014da:	74e2                	ld	s1,56(sp)
    802014dc:	7942                	ld	s2,48(sp)
    802014de:	79a2                	ld	s3,40(sp)
    802014e0:	7a02                	ld	s4,32(sp)
    802014e2:	6ae2                	ld	s5,24(sp)
    802014e4:	6b42                	ld	s6,16(sp)
    802014e6:	6ba2                	ld	s7,8(sp)
    802014e8:	6161                	addi	sp,sp,80
    802014ea:	8082                	ret
    srcva = va0 + PGSIZE;
    802014ec:	01390bb3          	add	s7,s2,s3
  while(got_null == 0 && max > 0){
    802014f0:	c8a9                	beqz	s1,80201542 <copyinstr+0x9e>
    va0 = PGROUNDDOWN(srcva);
    802014f2:	015bf933          	and	s2,s7,s5
    pa0 = walkaddr(pagetable, va0);
    802014f6:	85ca                	mv	a1,s2
    802014f8:	8552                	mv	a0,s4
    802014fa:	fffff097          	auipc	ra,0xfffff
    802014fe:	6b4080e7          	jalr	1716(ra) # 80200bae <walkaddr>
    if(pa0 == NULL)
    80201502:	c131                	beqz	a0,80201546 <copyinstr+0xa2>
    n = PGSIZE - (srcva - va0);
    80201504:	417906b3          	sub	a3,s2,s7
    80201508:	96ce                	add	a3,a3,s3
    8020150a:	00d4f363          	bgeu	s1,a3,80201510 <copyinstr+0x6c>
    8020150e:	86a6                	mv	a3,s1
    char *p = (char *) (pa0 + (srcva - va0));
    80201510:	955e                	add	a0,a0,s7
    80201512:	41250533          	sub	a0,a0,s2
    while(n > 0){
    80201516:	daf9                	beqz	a3,802014ec <copyinstr+0x48>
    80201518:	87da                	mv	a5,s6
      if(*p == '\0'){
    8020151a:	41650633          	sub	a2,a0,s6
    8020151e:	fff48593          	addi	a1,s1,-1
    80201522:	95da                	add	a1,a1,s6
    while(n > 0){
    80201524:	96da                	add	a3,a3,s6
      if(*p == '\0'){
    80201526:	00f60733          	add	a4,a2,a5
    8020152a:	00074703          	lbu	a4,0(a4) # fffffffffffff000 <ebss_clear+0xffffffff7fdd9000>
    8020152e:	df51                	beqz	a4,802014ca <copyinstr+0x26>
        *dst = *p;
    80201530:	00e78023          	sb	a4,0(a5)
      --max;
    80201534:	40f584b3          	sub	s1,a1,a5
      dst++;
    80201538:	0785                	addi	a5,a5,1
    while(n > 0){
    8020153a:	fed796e3          	bne	a5,a3,80201526 <copyinstr+0x82>
      dst++;
    8020153e:	8b3e                	mv	s6,a5
    80201540:	b775                	j	802014ec <copyinstr+0x48>
    80201542:	4781                	li	a5,0
    80201544:	b771                	j	802014d0 <copyinstr+0x2c>
      return -1;
    80201546:	557d                	li	a0,-1
    80201548:	b779                	j	802014d6 <copyinstr+0x32>
  int got_null = 0;
    8020154a:	4781                	li	a5,0
  if(got_null){
    8020154c:	37fd                	addiw	a5,a5,-1
    8020154e:	0007851b          	sext.w	a0,a5
}
    80201552:	8082                	ret

0000000080201554 <copyinstr2>:

int
copyinstr2(char *dst, uint64 srcva, uint64 max)
{
    80201554:	7179                	addi	sp,sp,-48
    80201556:	f406                	sd	ra,40(sp)
    80201558:	f022                	sd	s0,32(sp)
    8020155a:	ec26                	sd	s1,24(sp)
    8020155c:	e84a                	sd	s2,16(sp)
    8020155e:	e44e                	sd	s3,8(sp)
    80201560:	1800                	addi	s0,sp,48
    80201562:	89aa                	mv	s3,a0
    80201564:	84ae                	mv	s1,a1
    80201566:	8932                	mv	s2,a2
  int got_null = 0;
  uint64 sz = myproc()->sz;
    80201568:	00000097          	auipc	ra,0x0
    8020156c:	4d4080e7          	jalr	1236(ra) # 80201a3c <myproc>
    80201570:	6534                	ld	a3,72(a0)
  while(srcva < sz && max > 0){
    80201572:	04d4f363          	bgeu	s1,a3,802015b8 <copyinstr2+0x64>
    80201576:	04090363          	beqz	s2,802015bc <copyinstr2+0x68>
    8020157a:	01298633          	add	a2,s3,s2
    8020157e:	8e85                	sub	a3,a3,s1
    80201580:	96ce                	add	a3,a3,s3
    80201582:	87ce                	mv	a5,s3
    char *p = (char *)srcva;
    if(*p == '\0'){
    80201584:	413485b3          	sub	a1,s1,s3
    80201588:	00b78733          	add	a4,a5,a1
    8020158c:	00074703          	lbu	a4,0(a4)
    80201590:	cb11                	beqz	a4,802015a4 <copyinstr2+0x50>
      *dst = '\0';
      got_null = 1;
      break;
    } else {
      *dst = *p;
    80201592:	00e78023          	sb	a4,0(a5)
    }
    --max;
    srcva++;
    dst++;
    80201596:	0785                	addi	a5,a5,1
  while(srcva < sz && max > 0){
    80201598:	02d78463          	beq	a5,a3,802015c0 <copyinstr2+0x6c>
    8020159c:	fec796e3          	bne	a5,a2,80201588 <copyinstr2+0x34>
  }
  if(got_null){
    return 0;
  } else {
    return -1;
    802015a0:	557d                	li	a0,-1
    802015a2:	a021                	j	802015aa <copyinstr2+0x56>
      *dst = '\0';
    802015a4:	00078023          	sb	zero,0(a5)
    return 0;
    802015a8:	4501                	li	a0,0
  }
}
    802015aa:	70a2                	ld	ra,40(sp)
    802015ac:	7402                	ld	s0,32(sp)
    802015ae:	64e2                	ld	s1,24(sp)
    802015b0:	6942                	ld	s2,16(sp)
    802015b2:	69a2                	ld	s3,8(sp)
    802015b4:	6145                	addi	sp,sp,48
    802015b6:	8082                	ret
    return -1;
    802015b8:	557d                	li	a0,-1
    802015ba:	bfc5                	j	802015aa <copyinstr2+0x56>
    802015bc:	557d                	li	a0,-1
    802015be:	b7f5                	j	802015aa <copyinstr2+0x56>
    802015c0:	557d                	li	a0,-1
    802015c2:	b7e5                	j	802015aa <copyinstr2+0x56>

00000000802015c4 <kfreewalk>:
}

// only free page table, not physical pages
void
kfreewalk(pagetable_t kpt)
{
    802015c4:	7179                	addi	sp,sp,-48
    802015c6:	f406                	sd	ra,40(sp)
    802015c8:	f022                	sd	s0,32(sp)
    802015ca:	ec26                	sd	s1,24(sp)
    802015cc:	e84a                	sd	s2,16(sp)
    802015ce:	e44e                	sd	s3,8(sp)
    802015d0:	e052                	sd	s4,0(sp)
    802015d2:	1800                	addi	s0,sp,48
    802015d4:	8a2a                	mv	s4,a0
  for (int i = 0; i < 512; i++) {
    802015d6:	84aa                	mv	s1,a0
    802015d8:	6905                	lui	s2,0x1
    802015da:	992a                	add	s2,s2,a0
    pte_t pte = kpt[i];
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    802015dc:	4985                	li	s3,1
    802015de:	a829                	j	802015f8 <kfreewalk+0x34>
      kfreewalk((pagetable_t) PTE2PA(pte));
    802015e0:	83a9                	srli	a5,a5,0xa
    802015e2:	00c79513          	slli	a0,a5,0xc
    802015e6:	00000097          	auipc	ra,0x0
    802015ea:	fde080e7          	jalr	-34(ra) # 802015c4 <kfreewalk>
      kpt[i] = 0;
    802015ee:	0004b023          	sd	zero,0(s1)
  for (int i = 0; i < 512; i++) {
    802015f2:	04a1                	addi	s1,s1,8
    802015f4:	01248963          	beq	s1,s2,80201606 <kfreewalk+0x42>
    pte_t pte = kpt[i];
    802015f8:	609c                	ld	a5,0(s1)
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    802015fa:	00f7f713          	andi	a4,a5,15
    802015fe:	ff3701e3          	beq	a4,s3,802015e0 <kfreewalk+0x1c>
    } else if (pte & PTE_V) {
    80201602:	8b85                	andi	a5,a5,1
    80201604:	d7fd                	beqz	a5,802015f2 <kfreewalk+0x2e>
      break;
    }
  }
  kfree((void *) kpt);
    80201606:	8552                	mv	a0,s4
    80201608:	fffff097          	auipc	ra,0xfffff
    8020160c:	e38080e7          	jalr	-456(ra) # 80200440 <kfree>
}
    80201610:	70a2                	ld	ra,40(sp)
    80201612:	7402                	ld	s0,32(sp)
    80201614:	64e2                	ld	s1,24(sp)
    80201616:	6942                	ld	s2,16(sp)
    80201618:	69a2                	ld	s3,8(sp)
    8020161a:	6a02                	ld	s4,0(sp)
    8020161c:	6145                	addi	sp,sp,48
    8020161e:	8082                	ret

0000000080201620 <kvmfreeusr>:

void
kvmfreeusr(pagetable_t kpt)
{
    80201620:	1101                	addi	sp,sp,-32
    80201622:	ec06                	sd	ra,24(sp)
    80201624:	e822                	sd	s0,16(sp)
    80201626:	e426                	sd	s1,8(sp)
    80201628:	1000                	addi	s0,sp,32
    8020162a:	84aa                	mv	s1,a0
  pte_t pte;
  for (int i = 0; i < PX(2, MAXUVA); i++) {
    pte = kpt[i];
    8020162c:	6108                	ld	a0,0(a0)
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    8020162e:	00f57713          	andi	a4,a0,15
    80201632:	4785                	li	a5,1
    80201634:	00f70d63          	beq	a4,a5,8020164e <kvmfreeusr+0x2e>
    pte = kpt[i];
    80201638:	6488                	ld	a0,8(s1)
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    8020163a:	00f57713          	andi	a4,a0,15
    8020163e:	4785                	li	a5,1
    80201640:	02f70063          	beq	a4,a5,80201660 <kvmfreeusr+0x40>
      kfreewalk((pagetable_t) PTE2PA(pte));
      kpt[i] = 0;
    }
  }
}
    80201644:	60e2                	ld	ra,24(sp)
    80201646:	6442                	ld	s0,16(sp)
    80201648:	64a2                	ld	s1,8(sp)
    8020164a:	6105                	addi	sp,sp,32
    8020164c:	8082                	ret
      kfreewalk((pagetable_t) PTE2PA(pte));
    8020164e:	8129                	srli	a0,a0,0xa
    80201650:	0532                	slli	a0,a0,0xc
    80201652:	00000097          	auipc	ra,0x0
    80201656:	f72080e7          	jalr	-142(ra) # 802015c4 <kfreewalk>
      kpt[i] = 0;
    8020165a:	0004b023          	sd	zero,0(s1)
    8020165e:	bfe9                	j	80201638 <kvmfreeusr+0x18>
      kfreewalk((pagetable_t) PTE2PA(pte));
    80201660:	8129                	srli	a0,a0,0xa
    80201662:	0532                	slli	a0,a0,0xc
    80201664:	00000097          	auipc	ra,0x0
    80201668:	f60080e7          	jalr	-160(ra) # 802015c4 <kfreewalk>
      kpt[i] = 0;
    8020166c:	0004b423          	sd	zero,8(s1)
}
    80201670:	bfd1                	j	80201644 <kvmfreeusr+0x24>

0000000080201672 <kvmfree>:

void
kvmfree(pagetable_t kpt, int stack_free)
{
    80201672:	1101                	addi	sp,sp,-32
    80201674:	ec06                	sd	ra,24(sp)
    80201676:	e822                	sd	s0,16(sp)
    80201678:	e426                	sd	s1,8(sp)
    8020167a:	1000                	addi	s0,sp,32
    8020167c:	84aa                	mv	s1,a0
  if (stack_free) {
    8020167e:	e185                	bnez	a1,8020169e <kvmfree+0x2c>
    pte_t pte = kpt[PX(2, VKSTACK)];
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
      kfreewalk((pagetable_t) PTE2PA(pte));
    }
  }
  kvmfreeusr(kpt);
    80201680:	8526                	mv	a0,s1
    80201682:	00000097          	auipc	ra,0x0
    80201686:	f9e080e7          	jalr	-98(ra) # 80201620 <kvmfreeusr>
  kfree(kpt);
    8020168a:	8526                	mv	a0,s1
    8020168c:	fffff097          	auipc	ra,0xfffff
    80201690:	db4080e7          	jalr	-588(ra) # 80200440 <kfree>
}
    80201694:	60e2                	ld	ra,24(sp)
    80201696:	6442                	ld	s0,16(sp)
    80201698:	64a2                	ld	s1,8(sp)
    8020169a:	6105                	addi	sp,sp,32
    8020169c:	8082                	ret
    vmunmap(kpt, VKSTACK, 1, 1);
    8020169e:	4685                	li	a3,1
    802016a0:	4605                	li	a2,1
    802016a2:	0fb00593          	li	a1,251
    802016a6:	05fa                	slli	a1,a1,0x1e
    802016a8:	fffff097          	auipc	ra,0xfffff
    802016ac:	77a080e7          	jalr	1914(ra) # 80200e22 <vmunmap>
    pte_t pte = kpt[PX(2, VKSTACK)];
    802016b0:	7d84b503          	ld	a0,2008(s1)
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    802016b4:	00f57713          	andi	a4,a0,15
    802016b8:	4785                	li	a5,1
    802016ba:	fcf713e3          	bne	a4,a5,80201680 <kvmfree+0xe>
      kfreewalk((pagetable_t) PTE2PA(pte));
    802016be:	8129                	srli	a0,a0,0xa
    802016c0:	0532                	slli	a0,a0,0xc
    802016c2:	00000097          	auipc	ra,0x0
    802016c6:	f02080e7          	jalr	-254(ra) # 802015c4 <kfreewalk>
    802016ca:	bf5d                	j	80201680 <kvmfree+0xe>

00000000802016cc <proc_kpagetable>:
{
    802016cc:	1101                	addi	sp,sp,-32
    802016ce:	ec06                	sd	ra,24(sp)
    802016d0:	e822                	sd	s0,16(sp)
    802016d2:	e426                	sd	s1,8(sp)
    802016d4:	1000                	addi	s0,sp,32
  pagetable_t kpt = (pagetable_t) kalloc();
    802016d6:	fffff097          	auipc	ra,0xfffff
    802016da:	e84080e7          	jalr	-380(ra) # 8020055a <kalloc>
    802016de:	84aa                	mv	s1,a0
  if (kpt == NULL)
    802016e0:	c91d                	beqz	a0,80201716 <proc_kpagetable+0x4a>
  memmove(kpt, kernel_pagetable, PGSIZE);
    802016e2:	6605                	lui	a2,0x1
    802016e4:	00013597          	auipc	a1,0x13
    802016e8:	9745b583          	ld	a1,-1676(a1) # 80214058 <kernel_pagetable>
    802016ec:	fffff097          	auipc	ra,0xfffff
    802016f0:	0d2080e7          	jalr	210(ra) # 802007be <memmove>
  char *pstack = kalloc();
    802016f4:	fffff097          	auipc	ra,0xfffff
    802016f8:	e66080e7          	jalr	-410(ra) # 8020055a <kalloc>
    802016fc:	86aa                	mv	a3,a0
  if(pstack == NULL)
    802016fe:	c115                	beqz	a0,80201722 <proc_kpagetable+0x56>
  if (mappages(kpt, VKSTACK, PGSIZE, (uint64)pstack, PTE_R | PTE_W) != 0)
    80201700:	4719                	li	a4,6
    80201702:	6605                	lui	a2,0x1
    80201704:	0fb00593          	li	a1,251
    80201708:	05fa                	slli	a1,a1,0x1e
    8020170a:	8526                	mv	a0,s1
    8020170c:	fffff097          	auipc	ra,0xfffff
    80201710:	55c080e7          	jalr	1372(ra) # 80200c68 <mappages>
    80201714:	e519                	bnez	a0,80201722 <proc_kpagetable+0x56>
}
    80201716:	8526                	mv	a0,s1
    80201718:	60e2                	ld	ra,24(sp)
    8020171a:	6442                	ld	s0,16(sp)
    8020171c:	64a2                	ld	s1,8(sp)
    8020171e:	6105                	addi	sp,sp,32
    80201720:	8082                	ret
  kvmfree(kpt, 1);
    80201722:	4585                	li	a1,1
    80201724:	8526                	mv	a0,s1
    80201726:	00000097          	auipc	ra,0x0
    8020172a:	f4c080e7          	jalr	-180(ra) # 80201672 <kvmfree>
  return NULL;
    8020172e:	4481                	li	s1,0
    80201730:	b7dd                	j	80201716 <proc_kpagetable+0x4a>

0000000080201732 <vmprint>:

void vmprint(pagetable_t pagetable)
{
    80201732:	7119                	addi	sp,sp,-128
    80201734:	fc86                	sd	ra,120(sp)
    80201736:	f8a2                	sd	s0,112(sp)
    80201738:	f4a6                	sd	s1,104(sp)
    8020173a:	f0ca                	sd	s2,96(sp)
    8020173c:	ecce                	sd	s3,88(sp)
    8020173e:	e8d2                	sd	s4,80(sp)
    80201740:	e4d6                	sd	s5,72(sp)
    80201742:	e0da                	sd	s6,64(sp)
    80201744:	fc5e                	sd	s7,56(sp)
    80201746:	f862                	sd	s8,48(sp)
    80201748:	f466                	sd	s9,40(sp)
    8020174a:	f06a                	sd	s10,32(sp)
    8020174c:	ec6e                	sd	s11,24(sp)
    8020174e:	0100                	addi	s0,sp,128
    80201750:	8baa                	mv	s7,a0
    80201752:	f8a43423          	sd	a0,-120(s0)
  const int capacity = 512;
  printf("page table %p\n", pagetable);
    80201756:	85aa                	mv	a1,a0
    80201758:	00008517          	auipc	a0,0x8
    8020175c:	da850513          	addi	a0,a0,-600 # 80209500 <digits+0x180>
    80201760:	fffff097          	auipc	ra,0xfffff
    80201764:	a2e080e7          	jalr	-1490(ra) # 8020018e <printf>
  for (pte_t *pte = (pte_t *) pagetable; pte < pagetable + capacity; pte++) {
    80201768:	6d85                	lui	s11,0x1
    8020176a:	9dde                	add	s11,s11,s7
    8020176c:	6c85                	lui	s9,0x1

      for (pte_t *pte2 = (pte_t *) pt2; pte2 < pt2 + capacity; pte2++) {
        if (*pte2 & PTE_V)
        {
          pagetable_t pt3 = (pagetable_t) PTE2PA(*pte2);
          printf(".. ..%d: pte %p pa %p\n", pte2 - pt2, *pte2, pt3);
    8020176e:	00008d17          	auipc	s10,0x8
    80201772:	dbad0d13          	addi	s10,s10,-582 # 80209528 <digits+0x1a8>

          for (pte_t *pte3 = (pte_t *) pt3; pte3 < pt3 + capacity; pte3++)
            if (*pte3 & PTE_V)
              printf(".. .. ..%d: pte %p pa %p\n", pte3 - pt3, *pte3, PTE2PA(*pte3));
    80201776:	00008a17          	auipc	s4,0x8
    8020177a:	dcaa0a13          	addi	s4,s4,-566 # 80209540 <digits+0x1c0>
    8020177e:	a885                	j	802017ee <vmprint+0xbc>
          for (pte_t *pte3 = (pte_t *) pt3; pte3 < pt3 + capacity; pte3++)
    80201780:	04a1                	addi	s1,s1,8
    80201782:	197d                	addi	s2,s2,-1 # fff <_entry-0x801ff001>
    80201784:	02090263          	beqz	s2,802017a8 <vmprint+0x76>
            if (*pte3 & PTE_V)
    80201788:	6090                	ld	a2,0(s1)
    8020178a:	00167793          	andi	a5,a2,1
    8020178e:	dbed                	beqz	a5,80201780 <vmprint+0x4e>
              printf(".. .. ..%d: pte %p pa %p\n", pte3 - pt3, *pte3, PTE2PA(*pte3));
    80201790:	00a65693          	srli	a3,a2,0xa
    80201794:	413485b3          	sub	a1,s1,s3
    80201798:	06b2                	slli	a3,a3,0xc
    8020179a:	858d                	srai	a1,a1,0x3
    8020179c:	8552                	mv	a0,s4
    8020179e:	fffff097          	auipc	ra,0xfffff
    802017a2:	9f0080e7          	jalr	-1552(ra) # 8020018e <printf>
    802017a6:	bfe9                	j	80201780 <vmprint+0x4e>
      for (pte_t *pte2 = (pte_t *) pt2; pte2 < pt2 + capacity; pte2++) {
    802017a8:	0aa1                	addi	s5,s5,8 # fffffffffffff008 <ebss_clear+0xffffffff7fdd9008>
    802017aa:	1b7d                	addi	s6,s6,-1 # fff <_entry-0x801ff001>
    802017ac:	020b0e63          	beqz	s6,802017e8 <vmprint+0xb6>
        if (*pte2 & PTE_V)
    802017b0:	000ab603          	ld	a2,0(s5)
    802017b4:	00167793          	andi	a5,a2,1
    802017b8:	dbe5                	beqz	a5,802017a8 <vmprint+0x76>
          pagetable_t pt3 = (pagetable_t) PTE2PA(*pte2);
    802017ba:	00a65993          	srli	s3,a2,0xa
    802017be:	09b2                	slli	s3,s3,0xc
          printf(".. ..%d: pte %p pa %p\n", pte2 - pt2, *pte2, pt3);
    802017c0:	418a85b3          	sub	a1,s5,s8
    802017c4:	86ce                	mv	a3,s3
    802017c6:	858d                	srai	a1,a1,0x3
    802017c8:	856a                	mv	a0,s10
    802017ca:	fffff097          	auipc	ra,0xfffff
    802017ce:	9c4080e7          	jalr	-1596(ra) # 8020018e <printf>
          for (pte_t *pte3 = (pte_t *) pt3; pte3 < pt3 + capacity; pte3++)
    802017d2:	00898713          	addi	a4,s3,8 # 1008 <_entry-0x801feff8>
    802017d6:	019987b3          	add	a5,s3,s9
    802017da:	20000913          	li	s2,512
    802017de:	00e7f363          	bgeu	a5,a4,802017e4 <vmprint+0xb2>
    802017e2:	4905                	li	s2,1
    802017e4:	84ce                	mv	s1,s3
    802017e6:	b74d                	j	80201788 <vmprint+0x56>
  for (pte_t *pte = (pte_t *) pagetable; pte < pagetable + capacity; pte++) {
    802017e8:	0ba1                	addi	s7,s7,8 # fffffffffffff008 <ebss_clear+0xffffffff7fdd9008>
    802017ea:	05bb8463          	beq	s7,s11,80201832 <vmprint+0x100>
    if (*pte & PTE_V)
    802017ee:	000bb603          	ld	a2,0(s7)
    802017f2:	00167793          	andi	a5,a2,1
    802017f6:	dbed                	beqz	a5,802017e8 <vmprint+0xb6>
      pagetable_t pt2 = (pagetable_t) PTE2PA(*pte); 
    802017f8:	00a65c13          	srli	s8,a2,0xa
    802017fc:	0c32                	slli	s8,s8,0xc
      printf("..%d: pte %p pa %p\n", pte - pagetable, *pte, pt2);
    802017fe:	f8843783          	ld	a5,-120(s0)
    80201802:	40fb87b3          	sub	a5,s7,a5
    80201806:	86e2                	mv	a3,s8
    80201808:	4037d593          	srai	a1,a5,0x3
    8020180c:	00008517          	auipc	a0,0x8
    80201810:	d0450513          	addi	a0,a0,-764 # 80209510 <digits+0x190>
    80201814:	fffff097          	auipc	ra,0xfffff
    80201818:	97a080e7          	jalr	-1670(ra) # 8020018e <printf>
      for (pte_t *pte2 = (pte_t *) pt2; pte2 < pt2 + capacity; pte2++) {
    8020181c:	019c0733          	add	a4,s8,s9
    80201820:	008c0793          	addi	a5,s8,8 # 1008 <_entry-0x801feff8>
    80201824:	20000b13          	li	s6,512
    80201828:	00f77363          	bgeu	a4,a5,8020182e <vmprint+0xfc>
    8020182c:	4b05                	li	s6,1
    8020182e:	8ae2                	mv	s5,s8
    80201830:	b741                	j	802017b0 <vmprint+0x7e>
        }
      }
    }
  }
  return;
    80201832:	70e6                	ld	ra,120(sp)
    80201834:	7446                	ld	s0,112(sp)
    80201836:	74a6                	ld	s1,104(sp)
    80201838:	7906                	ld	s2,96(sp)
    8020183a:	69e6                	ld	s3,88(sp)
    8020183c:	6a46                	ld	s4,80(sp)
    8020183e:	6aa6                	ld	s5,72(sp)
    80201840:	6b06                	ld	s6,64(sp)
    80201842:	7be2                	ld	s7,56(sp)
    80201844:	7c42                	ld	s8,48(sp)
    80201846:	7ca2                	ld	s9,40(sp)
    80201848:	7d02                	ld	s10,32(sp)
    8020184a:	6de2                	ld	s11,24(sp)
    8020184c:	6109                	addi	sp,sp,128
    8020184e:	8082                	ret

0000000080201850 <wakeup1>:

// Wake up p if it is sleeping in wait(); used by exit().
// Caller must hold p->lock.
static void
wakeup1(struct proc *p)
{
    80201850:	1101                	addi	sp,sp,-32
    80201852:	ec06                	sd	ra,24(sp)
    80201854:	e822                	sd	s0,16(sp)
    80201856:	e426                	sd	s1,8(sp)
    80201858:	1000                	addi	s0,sp,32
    8020185a:	84aa                	mv	s1,a0
  if(!holding(&p->lock))
    8020185c:	fffff097          	auipc	ra,0xfffff
    80201860:	e3c080e7          	jalr	-452(ra) # 80200698 <holding>
    80201864:	c909                	beqz	a0,80201876 <wakeup1+0x26>
    panic("wakeup1");
  if(p->chan == p && p->state == SLEEPING) {
    80201866:	749c                	ld	a5,40(s1)
    80201868:	00978f63          	beq	a5,s1,80201886 <wakeup1+0x36>
    p->state = RUNNABLE;
  }
}
    8020186c:	60e2                	ld	ra,24(sp)
    8020186e:	6442                	ld	s0,16(sp)
    80201870:	64a2                	ld	s1,8(sp)
    80201872:	6105                	addi	sp,sp,32
    80201874:	8082                	ret
    panic("wakeup1");
    80201876:	00008517          	auipc	a0,0x8
    8020187a:	cea50513          	addi	a0,a0,-790 # 80209560 <digits+0x1e0>
    8020187e:	fffff097          	auipc	ra,0xfffff
    80201882:	8c6080e7          	jalr	-1850(ra) # 80200144 <panic>
  if(p->chan == p && p->state == SLEEPING) {
    80201886:	4c98                	lw	a4,24(s1)
    80201888:	4785                	li	a5,1
    8020188a:	fef711e3          	bne	a4,a5,8020186c <wakeup1+0x1c>
    p->state = RUNNABLE;
    8020188e:	4789                	li	a5,2
    80201890:	cc9c                	sw	a5,24(s1)
}
    80201892:	bfe9                	j	8020186c <wakeup1+0x1c>

0000000080201894 <reg_info>:
void reg_info(void) {
    80201894:	1141                	addi	sp,sp,-16
    80201896:	e406                	sd	ra,8(sp)
    80201898:	e022                	sd	s0,0(sp)
    8020189a:	0800                	addi	s0,sp,16
  printf("register info: {\n");
    8020189c:	00008517          	auipc	a0,0x8
    802018a0:	ccc50513          	addi	a0,a0,-820 # 80209568 <digits+0x1e8>
    802018a4:	fffff097          	auipc	ra,0xfffff
    802018a8:	8ea080e7          	jalr	-1814(ra) # 8020018e <printf>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802018ac:	100025f3          	csrr	a1,sstatus
  printf("sstatus: %p\n", r_sstatus());
    802018b0:	00008517          	auipc	a0,0x8
    802018b4:	cd050513          	addi	a0,a0,-816 # 80209580 <digits+0x200>
    802018b8:	fffff097          	auipc	ra,0xfffff
    802018bc:	8d6080e7          	jalr	-1834(ra) # 8020018e <printf>
  asm volatile("csrr %0, sip" : "=r" (x) );
    802018c0:	144025f3          	csrr	a1,sip
  printf("sip: %p\n", r_sip());
    802018c4:	00008517          	auipc	a0,0x8
    802018c8:	ccc50513          	addi	a0,a0,-820 # 80209590 <digits+0x210>
    802018cc:	fffff097          	auipc	ra,0xfffff
    802018d0:	8c2080e7          	jalr	-1854(ra) # 8020018e <printf>
  asm volatile("csrr %0, sie" : "=r" (x) );
    802018d4:	104025f3          	csrr	a1,sie
  printf("sie: %p\n", r_sie());
    802018d8:	00008517          	auipc	a0,0x8
    802018dc:	cc850513          	addi	a0,a0,-824 # 802095a0 <digits+0x220>
    802018e0:	fffff097          	auipc	ra,0xfffff
    802018e4:	8ae080e7          	jalr	-1874(ra) # 8020018e <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    802018e8:	141025f3          	csrr	a1,sepc
  printf("sepc: %p\n", r_sepc());
    802018ec:	00008517          	auipc	a0,0x8
    802018f0:	cc450513          	addi	a0,a0,-828 # 802095b0 <digits+0x230>
    802018f4:	fffff097          	auipc	ra,0xfffff
    802018f8:	89a080e7          	jalr	-1894(ra) # 8020018e <printf>
  asm volatile("csrr %0, stvec" : "=r" (x) );
    802018fc:	105025f3          	csrr	a1,stvec
  printf("stvec: %p\n", r_stvec());
    80201900:	00008517          	auipc	a0,0x8
    80201904:	cc050513          	addi	a0,a0,-832 # 802095c0 <digits+0x240>
    80201908:	fffff097          	auipc	ra,0xfffff
    8020190c:	886080e7          	jalr	-1914(ra) # 8020018e <printf>
  asm volatile("csrr %0, satp" : "=r" (x) );
    80201910:	180025f3          	csrr	a1,satp
  printf("satp: %p\n", r_satp());
    80201914:	00008517          	auipc	a0,0x8
    80201918:	cbc50513          	addi	a0,a0,-836 # 802095d0 <digits+0x250>
    8020191c:	fffff097          	auipc	ra,0xfffff
    80201920:	872080e7          	jalr	-1934(ra) # 8020018e <printf>
  asm volatile("csrr %0, scause" : "=r" (x) );
    80201924:	142025f3          	csrr	a1,scause
  printf("scause: %p\n", r_scause());
    80201928:	00008517          	auipc	a0,0x8
    8020192c:	cb850513          	addi	a0,a0,-840 # 802095e0 <digits+0x260>
    80201930:	fffff097          	auipc	ra,0xfffff
    80201934:	85e080e7          	jalr	-1954(ra) # 8020018e <printf>
  asm volatile("csrr %0, stval" : "=r" (x) );
    80201938:	143025f3          	csrr	a1,stval
  printf("stval: %p\n", r_stval());
    8020193c:	00008517          	auipc	a0,0x8
    80201940:	cb450513          	addi	a0,a0,-844 # 802095f0 <digits+0x270>
    80201944:	fffff097          	auipc	ra,0xfffff
    80201948:	84a080e7          	jalr	-1974(ra) # 8020018e <printf>
  asm volatile("mv %0, sp" : "=r" (x) );
    8020194c:	858a                	mv	a1,sp
  printf("sp: %p\n", r_sp());
    8020194e:	00008517          	auipc	a0,0x8
    80201952:	cb250513          	addi	a0,a0,-846 # 80209600 <digits+0x280>
    80201956:	fffff097          	auipc	ra,0xfffff
    8020195a:	838080e7          	jalr	-1992(ra) # 8020018e <printf>
  asm volatile("mv %0, tp" : "=r" (x) );
    8020195e:	8592                	mv	a1,tp
  printf("tp: %p\n", r_tp());
    80201960:	00008517          	auipc	a0,0x8
    80201964:	ca850513          	addi	a0,a0,-856 # 80209608 <digits+0x288>
    80201968:	fffff097          	auipc	ra,0xfffff
    8020196c:	826080e7          	jalr	-2010(ra) # 8020018e <printf>
  asm volatile("mv %0, ra" : "=r" (x) );
    80201970:	8586                	mv	a1,ra
  printf("ra: %p\n", r_ra());
    80201972:	00008517          	auipc	a0,0x8
    80201976:	c9e50513          	addi	a0,a0,-866 # 80209610 <digits+0x290>
    8020197a:	fffff097          	auipc	ra,0xfffff
    8020197e:	814080e7          	jalr	-2028(ra) # 8020018e <printf>
  printf("}\n");
    80201982:	00008517          	auipc	a0,0x8
    80201986:	c9650513          	addi	a0,a0,-874 # 80209618 <digits+0x298>
    8020198a:	fffff097          	auipc	ra,0xfffff
    8020198e:	804080e7          	jalr	-2044(ra) # 8020018e <printf>
}
    80201992:	60a2                	ld	ra,8(sp)
    80201994:	6402                	ld	s0,0(sp)
    80201996:	0141                	addi	sp,sp,16
    80201998:	8082                	ret

000000008020199a <procinit>:
{
    8020199a:	7179                	addi	sp,sp,-48
    8020199c:	f406                	sd	ra,40(sp)
    8020199e:	f022                	sd	s0,32(sp)
    802019a0:	ec26                	sd	s1,24(sp)
    802019a2:	e84a                	sd	s2,16(sp)
    802019a4:	e44e                	sd	s3,8(sp)
    802019a6:	1800                	addi	s0,sp,48
  initlock(&pid_lock, "nextpid");
    802019a8:	00008597          	auipc	a1,0x8
    802019ac:	c7858593          	addi	a1,a1,-904 # 80209620 <digits+0x2a0>
    802019b0:	00012517          	auipc	a0,0x12
    802019b4:	6b050513          	addi	a0,a0,1712 # 80214060 <pid_lock>
    802019b8:	fffff097          	auipc	ra,0xfffff
    802019bc:	cca080e7          	jalr	-822(ra) # 80200682 <initlock>
  for(p = proc; p < &proc[NPROC]; p++) {
    802019c0:	00012497          	auipc	s1,0x12
    802019c4:	7c048493          	addi	s1,s1,1984 # 80214180 <proc>
      initlock(&p->lock, "proc");
    802019c8:	00008997          	auipc	s3,0x8
    802019cc:	c6098993          	addi	s3,s3,-928 # 80209628 <digits+0x2a8>
  for(p = proc; p < &proc[NPROC]; p++) {
    802019d0:	00017917          	auipc	s2,0x17
    802019d4:	12090913          	addi	s2,s2,288 # 80218af0 <bcache>
      initlock(&p->lock, "proc");
    802019d8:	85ce                	mv	a1,s3
    802019da:	8526                	mv	a0,s1
    802019dc:	fffff097          	auipc	ra,0xfffff
    802019e0:	ca6080e7          	jalr	-858(ra) # 80200682 <initlock>
  for(p = proc; p < &proc[NPROC]; p++) {
    802019e4:	17848493          	addi	s1,s1,376
    802019e8:	ff2498e3          	bne	s1,s2,802019d8 <procinit+0x3e>
  memset(cpus, 0, sizeof(cpus));
    802019ec:	10000613          	li	a2,256
    802019f0:	4581                	li	a1,0
    802019f2:	00012517          	auipc	a0,0x12
    802019f6:	68650513          	addi	a0,a0,1670 # 80214078 <cpus>
    802019fa:	fffff097          	auipc	ra,0xfffff
    802019fe:	d68080e7          	jalr	-664(ra) # 80200762 <memset>
}
    80201a02:	70a2                	ld	ra,40(sp)
    80201a04:	7402                	ld	s0,32(sp)
    80201a06:	64e2                	ld	s1,24(sp)
    80201a08:	6942                	ld	s2,16(sp)
    80201a0a:	69a2                	ld	s3,8(sp)
    80201a0c:	6145                	addi	sp,sp,48
    80201a0e:	8082                	ret

0000000080201a10 <cpuid>:
{
    80201a10:	1141                	addi	sp,sp,-16
    80201a12:	e422                	sd	s0,8(sp)
    80201a14:	0800                	addi	s0,sp,16
  asm volatile("mv %0, tp" : "=r" (x) );
    80201a16:	8512                	mv	a0,tp
}
    80201a18:	2501                	sext.w	a0,a0
    80201a1a:	6422                	ld	s0,8(sp)
    80201a1c:	0141                	addi	sp,sp,16
    80201a1e:	8082                	ret

0000000080201a20 <mycpu>:
mycpu(void) {
    80201a20:	1141                	addi	sp,sp,-16
    80201a22:	e422                	sd	s0,8(sp)
    80201a24:	0800                	addi	s0,sp,16
    80201a26:	8792                	mv	a5,tp
  struct cpu *c = &cpus[id];
    80201a28:	2781                	sext.w	a5,a5
    80201a2a:	079e                	slli	a5,a5,0x7
}
    80201a2c:	00012517          	auipc	a0,0x12
    80201a30:	64c50513          	addi	a0,a0,1612 # 80214078 <cpus>
    80201a34:	953e                	add	a0,a0,a5
    80201a36:	6422                	ld	s0,8(sp)
    80201a38:	0141                	addi	sp,sp,16
    80201a3a:	8082                	ret

0000000080201a3c <myproc>:
myproc(void) {
    80201a3c:	1101                	addi	sp,sp,-32
    80201a3e:	ec06                	sd	ra,24(sp)
    80201a40:	e822                	sd	s0,16(sp)
    80201a42:	e426                	sd	s1,8(sp)
    80201a44:	1000                	addi	s0,sp,32
  push_off();
    80201a46:	fffff097          	auipc	ra,0xfffff
    80201a4a:	b90080e7          	jalr	-1136(ra) # 802005d6 <push_off>
    80201a4e:	8792                	mv	a5,tp
  struct proc *p = c->proc;
    80201a50:	2781                	sext.w	a5,a5
    80201a52:	079e                	slli	a5,a5,0x7
    80201a54:	00012717          	auipc	a4,0x12
    80201a58:	60c70713          	addi	a4,a4,1548 # 80214060 <pid_lock>
    80201a5c:	97ba                	add	a5,a5,a4
    80201a5e:	6f84                	ld	s1,24(a5)
  pop_off();
    80201a60:	fffff097          	auipc	ra,0xfffff
    80201a64:	bc2080e7          	jalr	-1086(ra) # 80200622 <pop_off>
}
    80201a68:	8526                	mv	a0,s1
    80201a6a:	60e2                	ld	ra,24(sp)
    80201a6c:	6442                	ld	s0,16(sp)
    80201a6e:	64a2                	ld	s1,8(sp)
    80201a70:	6105                	addi	sp,sp,32
    80201a72:	8082                	ret

0000000080201a74 <forkret>:
{
    80201a74:	1101                	addi	sp,sp,-32
    80201a76:	ec06                	sd	ra,24(sp)
    80201a78:	e822                	sd	s0,16(sp)
    80201a7a:	e426                	sd	s1,8(sp)
    80201a7c:	1000                	addi	s0,sp,32
  release(&myproc()->lock);
    80201a7e:	00000097          	auipc	ra,0x0
    80201a82:	fbe080e7          	jalr	-66(ra) # 80201a3c <myproc>
    80201a86:	fffff097          	auipc	ra,0xfffff
    80201a8a:	c94080e7          	jalr	-876(ra) # 8020071a <release>
  if (first) {
    80201a8e:	00008797          	auipc	a5,0x8
    80201a92:	5727a783          	lw	a5,1394(a5) # 8020a000 <first.1>
    80201a96:	eb91                	bnez	a5,80201aaa <forkret+0x36>
  usertrapret();
    80201a98:	00001097          	auipc	ra,0x1
    80201a9c:	f12080e7          	jalr	-238(ra) # 802029aa <usertrapret>
}
    80201aa0:	60e2                	ld	ra,24(sp)
    80201aa2:	6442                	ld	s0,16(sp)
    80201aa4:	64a2                	ld	s1,8(sp)
    80201aa6:	6105                	addi	sp,sp,32
    80201aa8:	8082                	ret
    first = 0;
    80201aaa:	00008797          	auipc	a5,0x8
    80201aae:	5407ab23          	sw	zero,1366(a5) # 8020a000 <first.1>
    fat32_init();
    80201ab2:	00004097          	auipc	ra,0x4
    80201ab6:	4f0080e7          	jalr	1264(ra) # 80205fa2 <fat32_init>
    myproc()->cwd = ename("/");
    80201aba:	00000097          	auipc	ra,0x0
    80201abe:	f82080e7          	jalr	-126(ra) # 80201a3c <myproc>
    80201ac2:	84aa                	mv	s1,a0
    80201ac4:	00008517          	auipc	a0,0x8
    80201ac8:	b6c50513          	addi	a0,a0,-1172 # 80209630 <digits+0x2b0>
    80201acc:	00005097          	auipc	ra,0x5
    80201ad0:	6da080e7          	jalr	1754(ra) # 802071a6 <ename>
    80201ad4:	14a4bc23          	sd	a0,344(s1)
    80201ad8:	b7c1                	j	80201a98 <forkret+0x24>

0000000080201ada <allocpid>:
allocpid() {
    80201ada:	1101                	addi	sp,sp,-32
    80201adc:	ec06                	sd	ra,24(sp)
    80201ade:	e822                	sd	s0,16(sp)
    80201ae0:	e426                	sd	s1,8(sp)
    80201ae2:	e04a                	sd	s2,0(sp)
    80201ae4:	1000                	addi	s0,sp,32
  acquire(&pid_lock);
    80201ae6:	00012917          	auipc	s2,0x12
    80201aea:	57a90913          	addi	s2,s2,1402 # 80214060 <pid_lock>
    80201aee:	854a                	mv	a0,s2
    80201af0:	fffff097          	auipc	ra,0xfffff
    80201af4:	bd6080e7          	jalr	-1066(ra) # 802006c6 <acquire>
  pid = nextpid;
    80201af8:	00008797          	auipc	a5,0x8
    80201afc:	50878793          	addi	a5,a5,1288 # 8020a000 <first.1>
    80201b00:	43c4                	lw	s1,4(a5)
  nextpid = nextpid + 1;
    80201b02:	0014871b          	addiw	a4,s1,1
    80201b06:	c3d8                	sw	a4,4(a5)
  release(&pid_lock);
    80201b08:	854a                	mv	a0,s2
    80201b0a:	fffff097          	auipc	ra,0xfffff
    80201b0e:	c10080e7          	jalr	-1008(ra) # 8020071a <release>
}
    80201b12:	8526                	mv	a0,s1
    80201b14:	60e2                	ld	ra,24(sp)
    80201b16:	6442                	ld	s0,16(sp)
    80201b18:	64a2                	ld	s1,8(sp)
    80201b1a:	6902                	ld	s2,0(sp)
    80201b1c:	6105                	addi	sp,sp,32
    80201b1e:	8082                	ret

0000000080201b20 <proc_pagetable>:
{
    80201b20:	1101                	addi	sp,sp,-32
    80201b22:	ec06                	sd	ra,24(sp)
    80201b24:	e822                	sd	s0,16(sp)
    80201b26:	e426                	sd	s1,8(sp)
    80201b28:	e04a                	sd	s2,0(sp)
    80201b2a:	1000                	addi	s0,sp,32
    80201b2c:	892a                	mv	s2,a0
  pagetable = uvmcreate();
    80201b2e:	fffff097          	auipc	ra,0xfffff
    80201b32:	3b8080e7          	jalr	952(ra) # 80200ee6 <uvmcreate>
    80201b36:	84aa                	mv	s1,a0
  if(pagetable == 0)
    80201b38:	c121                	beqz	a0,80201b78 <proc_pagetable+0x58>
  if(mappages(pagetable, TRAMPOLINE, PGSIZE,
    80201b3a:	4729                	li	a4,10
    80201b3c:	0000a697          	auipc	a3,0xa
    80201b40:	1846b683          	ld	a3,388(a3) # 8020bcc0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80201b44:	6605                	lui	a2,0x1
    80201b46:	040005b7          	lui	a1,0x4000
    80201b4a:	15fd                	addi	a1,a1,-1 # 3ffffff <_entry-0x7c200001>
    80201b4c:	05b2                	slli	a1,a1,0xc
    80201b4e:	fffff097          	auipc	ra,0xfffff
    80201b52:	11a080e7          	jalr	282(ra) # 80200c68 <mappages>
    80201b56:	02054863          	bltz	a0,80201b86 <proc_pagetable+0x66>
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
    80201b5a:	4719                	li	a4,6
    80201b5c:	06093683          	ld	a3,96(s2)
    80201b60:	6605                	lui	a2,0x1
    80201b62:	020005b7          	lui	a1,0x2000
    80201b66:	15fd                	addi	a1,a1,-1 # 1ffffff <_entry-0x7e200001>
    80201b68:	05b6                	slli	a1,a1,0xd
    80201b6a:	8526                	mv	a0,s1
    80201b6c:	fffff097          	auipc	ra,0xfffff
    80201b70:	0fc080e7          	jalr	252(ra) # 80200c68 <mappages>
    80201b74:	02054163          	bltz	a0,80201b96 <proc_pagetable+0x76>
}
    80201b78:	8526                	mv	a0,s1
    80201b7a:	60e2                	ld	ra,24(sp)
    80201b7c:	6442                	ld	s0,16(sp)
    80201b7e:	64a2                	ld	s1,8(sp)
    80201b80:	6902                	ld	s2,0(sp)
    80201b82:	6105                	addi	sp,sp,32
    80201b84:	8082                	ret
    uvmfree(pagetable, 0);
    80201b86:	4581                	li	a1,0
    80201b88:	8526                	mv	a0,s1
    80201b8a:	fffff097          	auipc	ra,0xfffff
    80201b8e:	5e2080e7          	jalr	1506(ra) # 8020116c <uvmfree>
    return NULL;
    80201b92:	4481                	li	s1,0
    80201b94:	b7d5                	j	80201b78 <proc_pagetable+0x58>
    vmunmap(pagetable, TRAMPOLINE, 1, 0);
    80201b96:	4681                	li	a3,0
    80201b98:	4605                	li	a2,1
    80201b9a:	040005b7          	lui	a1,0x4000
    80201b9e:	15fd                	addi	a1,a1,-1 # 3ffffff <_entry-0x7c200001>
    80201ba0:	05b2                	slli	a1,a1,0xc
    80201ba2:	8526                	mv	a0,s1
    80201ba4:	fffff097          	auipc	ra,0xfffff
    80201ba8:	27e080e7          	jalr	638(ra) # 80200e22 <vmunmap>
    uvmfree(pagetable, 0);
    80201bac:	4581                	li	a1,0
    80201bae:	8526                	mv	a0,s1
    80201bb0:	fffff097          	auipc	ra,0xfffff
    80201bb4:	5bc080e7          	jalr	1468(ra) # 8020116c <uvmfree>
    return NULL;
    80201bb8:	4481                	li	s1,0
    80201bba:	bf7d                	j	80201b78 <proc_pagetable+0x58>

0000000080201bbc <proc_freepagetable>:
{
    80201bbc:	1101                	addi	sp,sp,-32
    80201bbe:	ec06                	sd	ra,24(sp)
    80201bc0:	e822                	sd	s0,16(sp)
    80201bc2:	e426                	sd	s1,8(sp)
    80201bc4:	e04a                	sd	s2,0(sp)
    80201bc6:	1000                	addi	s0,sp,32
    80201bc8:	84aa                	mv	s1,a0
    80201bca:	892e                	mv	s2,a1
  vmunmap(pagetable, TRAMPOLINE, 1, 0);
    80201bcc:	4681                	li	a3,0
    80201bce:	4605                	li	a2,1
    80201bd0:	040005b7          	lui	a1,0x4000
    80201bd4:	15fd                	addi	a1,a1,-1 # 3ffffff <_entry-0x7c200001>
    80201bd6:	05b2                	slli	a1,a1,0xc
    80201bd8:	fffff097          	auipc	ra,0xfffff
    80201bdc:	24a080e7          	jalr	586(ra) # 80200e22 <vmunmap>
  vmunmap(pagetable, TRAPFRAME, 1, 0);
    80201be0:	4681                	li	a3,0
    80201be2:	4605                	li	a2,1
    80201be4:	020005b7          	lui	a1,0x2000
    80201be8:	15fd                	addi	a1,a1,-1 # 1ffffff <_entry-0x7e200001>
    80201bea:	05b6                	slli	a1,a1,0xd
    80201bec:	8526                	mv	a0,s1
    80201bee:	fffff097          	auipc	ra,0xfffff
    80201bf2:	234080e7          	jalr	564(ra) # 80200e22 <vmunmap>
  uvmfree(pagetable, sz);
    80201bf6:	85ca                	mv	a1,s2
    80201bf8:	8526                	mv	a0,s1
    80201bfa:	fffff097          	auipc	ra,0xfffff
    80201bfe:	572080e7          	jalr	1394(ra) # 8020116c <uvmfree>
}
    80201c02:	60e2                	ld	ra,24(sp)
    80201c04:	6442                	ld	s0,16(sp)
    80201c06:	64a2                	ld	s1,8(sp)
    80201c08:	6902                	ld	s2,0(sp)
    80201c0a:	6105                	addi	sp,sp,32
    80201c0c:	8082                	ret

0000000080201c0e <freeproc>:
{
    80201c0e:	1101                	addi	sp,sp,-32
    80201c10:	ec06                	sd	ra,24(sp)
    80201c12:	e822                	sd	s0,16(sp)
    80201c14:	e426                	sd	s1,8(sp)
    80201c16:	1000                	addi	s0,sp,32
    80201c18:	84aa                	mv	s1,a0
  if(p->trapframe)
    80201c1a:	7128                	ld	a0,96(a0)
    80201c1c:	c509                	beqz	a0,80201c26 <freeproc+0x18>
    kfree((void*)p->trapframe);
    80201c1e:	fffff097          	auipc	ra,0xfffff
    80201c22:	822080e7          	jalr	-2014(ra) # 80200440 <kfree>
  p->trapframe = 0;
    80201c26:	0604b023          	sd	zero,96(s1)
  if (p->kpagetable) {
    80201c2a:	6ca8                	ld	a0,88(s1)
    80201c2c:	c511                	beqz	a0,80201c38 <freeproc+0x2a>
    kvmfree(p->kpagetable, 1);
    80201c2e:	4585                	li	a1,1
    80201c30:	00000097          	auipc	ra,0x0
    80201c34:	a42080e7          	jalr	-1470(ra) # 80201672 <kvmfree>
  p->kpagetable = 0;
    80201c38:	0404bc23          	sd	zero,88(s1)
  if(p->pagetable)
    80201c3c:	68a8                	ld	a0,80(s1)
    80201c3e:	c511                	beqz	a0,80201c4a <freeproc+0x3c>
    proc_freepagetable(p->pagetable, p->sz);
    80201c40:	64ac                	ld	a1,72(s1)
    80201c42:	00000097          	auipc	ra,0x0
    80201c46:	f7a080e7          	jalr	-134(ra) # 80201bbc <proc_freepagetable>
  p->pagetable = 0;
    80201c4a:	0404b823          	sd	zero,80(s1)
  p->sz = 0;
    80201c4e:	0404b423          	sd	zero,72(s1)
  p->pid = 0;
    80201c52:	0204ac23          	sw	zero,56(s1)
  p->parent = 0;
    80201c56:	0204b023          	sd	zero,32(s1)
  p->name[0] = 0;
    80201c5a:	16048023          	sb	zero,352(s1)
  p->chan = 0;
    80201c5e:	0204b423          	sd	zero,40(s1)
  p->killed = 0;
    80201c62:	0204a823          	sw	zero,48(s1)
  p->xstate = 0;
    80201c66:	0204aa23          	sw	zero,52(s1)
  p->state = UNUSED;
    80201c6a:	0004ac23          	sw	zero,24(s1)
}
    80201c6e:	60e2                	ld	ra,24(sp)
    80201c70:	6442                	ld	s0,16(sp)
    80201c72:	64a2                	ld	s1,8(sp)
    80201c74:	6105                	addi	sp,sp,32
    80201c76:	8082                	ret

0000000080201c78 <allocproc>:
{
    80201c78:	1101                	addi	sp,sp,-32
    80201c7a:	ec06                	sd	ra,24(sp)
    80201c7c:	e822                	sd	s0,16(sp)
    80201c7e:	e426                	sd	s1,8(sp)
    80201c80:	e04a                	sd	s2,0(sp)
    80201c82:	1000                	addi	s0,sp,32
  for(p = proc; p < &proc[NPROC]; p++) {
    80201c84:	00012497          	auipc	s1,0x12
    80201c88:	4fc48493          	addi	s1,s1,1276 # 80214180 <proc>
    80201c8c:	00017917          	auipc	s2,0x17
    80201c90:	e6490913          	addi	s2,s2,-412 # 80218af0 <bcache>
    acquire(&p->lock);
    80201c94:	8526                	mv	a0,s1
    80201c96:	fffff097          	auipc	ra,0xfffff
    80201c9a:	a30080e7          	jalr	-1488(ra) # 802006c6 <acquire>
    if(p->state == UNUSED) {
    80201c9e:	4c9c                	lw	a5,24(s1)
    80201ca0:	cf81                	beqz	a5,80201cb8 <allocproc+0x40>
      release(&p->lock);
    80201ca2:	8526                	mv	a0,s1
    80201ca4:	fffff097          	auipc	ra,0xfffff
    80201ca8:	a76080e7          	jalr	-1418(ra) # 8020071a <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    80201cac:	17848493          	addi	s1,s1,376
    80201cb0:	ff2492e3          	bne	s1,s2,80201c94 <allocproc+0x1c>
  return NULL;
    80201cb4:	4481                	li	s1,0
    80201cb6:	a085                	j	80201d16 <allocproc+0x9e>
  p->pid = allocpid();
    80201cb8:	00000097          	auipc	ra,0x0
    80201cbc:	e22080e7          	jalr	-478(ra) # 80201ada <allocpid>
    80201cc0:	dc88                	sw	a0,56(s1)
  if((p->trapframe = (struct trapframe *)kalloc()) == NULL){
    80201cc2:	fffff097          	auipc	ra,0xfffff
    80201cc6:	898080e7          	jalr	-1896(ra) # 8020055a <kalloc>
    80201cca:	892a                	mv	s2,a0
    80201ccc:	f0a8                	sd	a0,96(s1)
    80201cce:	c939                	beqz	a0,80201d24 <allocproc+0xac>
  if ((p->pagetable = proc_pagetable(p)) == NULL ||
    80201cd0:	8526                	mv	a0,s1
    80201cd2:	00000097          	auipc	ra,0x0
    80201cd6:	e4e080e7          	jalr	-434(ra) # 80201b20 <proc_pagetable>
    80201cda:	e8a8                	sd	a0,80(s1)
    80201cdc:	c939                	beqz	a0,80201d32 <allocproc+0xba>
      (p->kpagetable = proc_kpagetable()) == NULL) {
    80201cde:	00000097          	auipc	ra,0x0
    80201ce2:	9ee080e7          	jalr	-1554(ra) # 802016cc <proc_kpagetable>
    80201ce6:	eca8                	sd	a0,88(s1)
  if ((p->pagetable = proc_pagetable(p)) == NULL ||
    80201ce8:	c529                	beqz	a0,80201d32 <allocproc+0xba>
  p->kstack = VKSTACK;
    80201cea:	0fb00793          	li	a5,251
    80201cee:	07fa                	slli	a5,a5,0x1e
    80201cf0:	e0bc                	sd	a5,64(s1)
  memset(&p->context, 0, sizeof(p->context));
    80201cf2:	07000613          	li	a2,112
    80201cf6:	4581                	li	a1,0
    80201cf8:	06848513          	addi	a0,s1,104
    80201cfc:	fffff097          	auipc	ra,0xfffff
    80201d00:	a66080e7          	jalr	-1434(ra) # 80200762 <memset>
  p->context.ra = (uint64)forkret;
    80201d04:	00000797          	auipc	a5,0x0
    80201d08:	d7078793          	addi	a5,a5,-656 # 80201a74 <forkret>
    80201d0c:	f4bc                	sd	a5,104(s1)
  p->context.sp = p->kstack + PGSIZE;
    80201d0e:	60bc                	ld	a5,64(s1)
    80201d10:	6705                	lui	a4,0x1
    80201d12:	97ba                	add	a5,a5,a4
    80201d14:	f8bc                	sd	a5,112(s1)
}
    80201d16:	8526                	mv	a0,s1
    80201d18:	60e2                	ld	ra,24(sp)
    80201d1a:	6442                	ld	s0,16(sp)
    80201d1c:	64a2                	ld	s1,8(sp)
    80201d1e:	6902                	ld	s2,0(sp)
    80201d20:	6105                	addi	sp,sp,32
    80201d22:	8082                	ret
    release(&p->lock);
    80201d24:	8526                	mv	a0,s1
    80201d26:	fffff097          	auipc	ra,0xfffff
    80201d2a:	9f4080e7          	jalr	-1548(ra) # 8020071a <release>
    return NULL;
    80201d2e:	84ca                	mv	s1,s2
    80201d30:	b7dd                	j	80201d16 <allocproc+0x9e>
    freeproc(p);
    80201d32:	8526                	mv	a0,s1
    80201d34:	00000097          	auipc	ra,0x0
    80201d38:	eda080e7          	jalr	-294(ra) # 80201c0e <freeproc>
    release(&p->lock);
    80201d3c:	8526                	mv	a0,s1
    80201d3e:	fffff097          	auipc	ra,0xfffff
    80201d42:	9dc080e7          	jalr	-1572(ra) # 8020071a <release>
    return NULL;
    80201d46:	4481                	li	s1,0
    80201d48:	b7f9                	j	80201d16 <allocproc+0x9e>

0000000080201d4a <userinit>:
{
    80201d4a:	1101                	addi	sp,sp,-32
    80201d4c:	ec06                	sd	ra,24(sp)
    80201d4e:	e822                	sd	s0,16(sp)
    80201d50:	e426                	sd	s1,8(sp)
    80201d52:	e04a                	sd	s2,0(sp)
    80201d54:	1000                	addi	s0,sp,32
  p = allocproc();
    80201d56:	00000097          	auipc	ra,0x0
    80201d5a:	f22080e7          	jalr	-222(ra) # 80201c78 <allocproc>
    80201d5e:	84aa                	mv	s1,a0
  initproc = p;
    80201d60:	00012797          	auipc	a5,0x12
    80201d64:	40a7bc23          	sd	a0,1048(a5) # 80214178 <initproc>
  uvminit(p->pagetable , p->kpagetable, initcode, sizeof(initcode));
    80201d68:	6905                	lui	s2,0x1
    80201d6a:	c2090693          	addi	a3,s2,-992 # c20 <_entry-0x801ff3e0>
    80201d6e:	00008617          	auipc	a2,0x8
    80201d72:	29a60613          	addi	a2,a2,666 # 8020a008 <initcode>
    80201d76:	6d2c                	ld	a1,88(a0)
    80201d78:	6928                	ld	a0,80(a0)
    80201d7a:	fffff097          	auipc	ra,0xfffff
    80201d7e:	19a080e7          	jalr	410(ra) # 80200f14 <uvminit>
  p->sz = PGSIZE;
    80201d82:	0524b423          	sd	s2,72(s1)
  p->trapframe->epc = 0x0;      // user program counter
    80201d86:	70bc                	ld	a5,96(s1)
    80201d88:	0007bc23          	sd	zero,24(a5)
  p->trapframe->sp = PGSIZE;  // user stack pointer
    80201d8c:	70bc                	ld	a5,96(s1)
    80201d8e:	0327b823          	sd	s2,48(a5)
  safestrcpy(p->name, "initcode", sizeof(p->name));
    80201d92:	4641                	li	a2,16
    80201d94:	00008597          	auipc	a1,0x8
    80201d98:	8a458593          	addi	a1,a1,-1884 # 80209638 <digits+0x2b8>
    80201d9c:	16048513          	addi	a0,s1,352
    80201da0:	fffff097          	auipc	ra,0xfffff
    80201da4:	b14080e7          	jalr	-1260(ra) # 802008b4 <safestrcpy>
  p->state = RUNNABLE;
    80201da8:	4789                	li	a5,2
    80201daa:	cc9c                	sw	a5,24(s1)
  p->tmask = 0;
    80201dac:	1604a823          	sw	zero,368(s1)
  release(&p->lock);
    80201db0:	8526                	mv	a0,s1
    80201db2:	fffff097          	auipc	ra,0xfffff
    80201db6:	968080e7          	jalr	-1688(ra) # 8020071a <release>
}
    80201dba:	60e2                	ld	ra,24(sp)
    80201dbc:	6442                	ld	s0,16(sp)
    80201dbe:	64a2                	ld	s1,8(sp)
    80201dc0:	6902                	ld	s2,0(sp)
    80201dc2:	6105                	addi	sp,sp,32
    80201dc4:	8082                	ret

0000000080201dc6 <growproc>:
{
    80201dc6:	1101                	addi	sp,sp,-32
    80201dc8:	ec06                	sd	ra,24(sp)
    80201dca:	e822                	sd	s0,16(sp)
    80201dcc:	e426                	sd	s1,8(sp)
    80201dce:	e04a                	sd	s2,0(sp)
    80201dd0:	1000                	addi	s0,sp,32
    80201dd2:	84aa                	mv	s1,a0
  struct proc *p = myproc();
    80201dd4:	00000097          	auipc	ra,0x0
    80201dd8:	c68080e7          	jalr	-920(ra) # 80201a3c <myproc>
    80201ddc:	892a                	mv	s2,a0
  sz = p->sz;
    80201dde:	6530                	ld	a2,72(a0)
    80201de0:	0006079b          	sext.w	a5,a2
  if(n > 0){
    80201de4:	00904f63          	bgtz	s1,80201e02 <growproc+0x3c>
  } else if(n < 0){
    80201de8:	0204ce63          	bltz	s1,80201e24 <growproc+0x5e>
  p->sz = sz;
    80201dec:	1782                	slli	a5,a5,0x20
    80201dee:	9381                	srli	a5,a5,0x20
    80201df0:	04f93423          	sd	a5,72(s2)
  return 0;
    80201df4:	4501                	li	a0,0
}
    80201df6:	60e2                	ld	ra,24(sp)
    80201df8:	6442                	ld	s0,16(sp)
    80201dfa:	64a2                	ld	s1,8(sp)
    80201dfc:	6902                	ld	s2,0(sp)
    80201dfe:	6105                	addi	sp,sp,32
    80201e00:	8082                	ret
    if((sz = uvmalloc(p->pagetable, p->kpagetable, sz, sz + n)) == 0) {
    80201e02:	00f486bb          	addw	a3,s1,a5
    80201e06:	1682                	slli	a3,a3,0x20
    80201e08:	9281                	srli	a3,a3,0x20
    80201e0a:	1602                	slli	a2,a2,0x20
    80201e0c:	9201                	srli	a2,a2,0x20
    80201e0e:	6d2c                	ld	a1,88(a0)
    80201e10:	6928                	ld	a0,80(a0)
    80201e12:	fffff097          	auipc	ra,0xfffff
    80201e16:	1f8080e7          	jalr	504(ra) # 8020100a <uvmalloc>
    80201e1a:	0005079b          	sext.w	a5,a0
    80201e1e:	f7f9                	bnez	a5,80201dec <growproc+0x26>
      return -1;
    80201e20:	557d                	li	a0,-1
    80201e22:	bfd1                	j	80201df6 <growproc+0x30>
    sz = uvmdealloc(p->pagetable, p->kpagetable, sz, sz + n);
    80201e24:	00f486bb          	addw	a3,s1,a5
    80201e28:	1682                	slli	a3,a3,0x20
    80201e2a:	9281                	srli	a3,a3,0x20
    80201e2c:	1602                	slli	a2,a2,0x20
    80201e2e:	9201                	srli	a2,a2,0x20
    80201e30:	6d2c                	ld	a1,88(a0)
    80201e32:	6928                	ld	a0,80(a0)
    80201e34:	fffff097          	auipc	ra,0xfffff
    80201e38:	16a080e7          	jalr	362(ra) # 80200f9e <uvmdealloc>
    80201e3c:	0005079b          	sext.w	a5,a0
    80201e40:	b775                	j	80201dec <growproc+0x26>

0000000080201e42 <fork>:
{
    80201e42:	7139                	addi	sp,sp,-64
    80201e44:	fc06                	sd	ra,56(sp)
    80201e46:	f822                	sd	s0,48(sp)
    80201e48:	f426                	sd	s1,40(sp)
    80201e4a:	f04a                	sd	s2,32(sp)
    80201e4c:	ec4e                	sd	s3,24(sp)
    80201e4e:	e852                	sd	s4,16(sp)
    80201e50:	e456                	sd	s5,8(sp)
    80201e52:	0080                	addi	s0,sp,64
  struct proc *p = myproc();
    80201e54:	00000097          	auipc	ra,0x0
    80201e58:	be8080e7          	jalr	-1048(ra) # 80201a3c <myproc>
    80201e5c:	8aaa                	mv	s5,a0
  if((np = allocproc()) == NULL){
    80201e5e:	00000097          	auipc	ra,0x0
    80201e62:	e1a080e7          	jalr	-486(ra) # 80201c78 <allocproc>
    80201e66:	c965                	beqz	a0,80201f56 <fork+0x114>
    80201e68:	8a2a                	mv	s4,a0
  if(uvmcopy(p->pagetable, np->pagetable, np->kpagetable, p->sz) < 0){
    80201e6a:	048ab683          	ld	a3,72(s5)
    80201e6e:	6d30                	ld	a2,88(a0)
    80201e70:	692c                	ld	a1,80(a0)
    80201e72:	050ab503          	ld	a0,80(s5)
    80201e76:	fffff097          	auipc	ra,0xfffff
    80201e7a:	330080e7          	jalr	816(ra) # 802011a6 <uvmcopy>
    80201e7e:	04054e63          	bltz	a0,80201eda <fork+0x98>
  np->sz = p->sz;
    80201e82:	048ab783          	ld	a5,72(s5)
    80201e86:	04fa3423          	sd	a5,72(s4)
  np->parent = p;
    80201e8a:	035a3023          	sd	s5,32(s4)
  np->tmask = p->tmask;
    80201e8e:	170aa783          	lw	a5,368(s5)
    80201e92:	16fa2823          	sw	a5,368(s4)
  *(np->trapframe) = *(p->trapframe);
    80201e96:	060ab683          	ld	a3,96(s5)
    80201e9a:	87b6                	mv	a5,a3
    80201e9c:	060a3703          	ld	a4,96(s4)
    80201ea0:	12068693          	addi	a3,a3,288
    80201ea4:	0007b803          	ld	a6,0(a5)
    80201ea8:	6788                	ld	a0,8(a5)
    80201eaa:	6b8c                	ld	a1,16(a5)
    80201eac:	6f90                	ld	a2,24(a5)
    80201eae:	01073023          	sd	a6,0(a4) # 1000 <_entry-0x801ff000>
    80201eb2:	e708                	sd	a0,8(a4)
    80201eb4:	eb0c                	sd	a1,16(a4)
    80201eb6:	ef10                	sd	a2,24(a4)
    80201eb8:	02078793          	addi	a5,a5,32
    80201ebc:	02070713          	addi	a4,a4,32
    80201ec0:	fed792e3          	bne	a5,a3,80201ea4 <fork+0x62>
  np->trapframe->a0 = 0;
    80201ec4:	060a3783          	ld	a5,96(s4)
    80201ec8:	0607b823          	sd	zero,112(a5)
  for(i = 0; i < NOFILE; i++)
    80201ecc:	0d8a8493          	addi	s1,s5,216
    80201ed0:	0d8a0913          	addi	s2,s4,216
    80201ed4:	158a8993          	addi	s3,s5,344
    80201ed8:	a00d                	j	80201efa <fork+0xb8>
    freeproc(np);
    80201eda:	8552                	mv	a0,s4
    80201edc:	00000097          	auipc	ra,0x0
    80201ee0:	d32080e7          	jalr	-718(ra) # 80201c0e <freeproc>
    release(&np->lock);
    80201ee4:	8552                	mv	a0,s4
    80201ee6:	fffff097          	auipc	ra,0xfffff
    80201eea:	834080e7          	jalr	-1996(ra) # 8020071a <release>
    return -1;
    80201eee:	54fd                	li	s1,-1
    80201ef0:	a889                	j	80201f42 <fork+0x100>
  for(i = 0; i < NOFILE; i++)
    80201ef2:	04a1                	addi	s1,s1,8
    80201ef4:	0921                	addi	s2,s2,8
    80201ef6:	01348b63          	beq	s1,s3,80201f0c <fork+0xca>
    if(p->ofile[i])
    80201efa:	6088                	ld	a0,0(s1)
    80201efc:	d97d                	beqz	a0,80201ef2 <fork+0xb0>
      np->ofile[i] = filedup(p->ofile[i]);
    80201efe:	00002097          	auipc	ra,0x2
    80201f02:	de4080e7          	jalr	-540(ra) # 80203ce2 <filedup>
    80201f06:	00a93023          	sd	a0,0(s2)
    80201f0a:	b7e5                	j	80201ef2 <fork+0xb0>
  np->cwd = edup(p->cwd);
    80201f0c:	158ab503          	ld	a0,344(s5)
    80201f10:	00005097          	auipc	ra,0x5
    80201f14:	8fe080e7          	jalr	-1794(ra) # 8020680e <edup>
    80201f18:	14aa3c23          	sd	a0,344(s4)
  safestrcpy(np->name, p->name, sizeof(p->name));
    80201f1c:	4641                	li	a2,16
    80201f1e:	160a8593          	addi	a1,s5,352
    80201f22:	160a0513          	addi	a0,s4,352
    80201f26:	fffff097          	auipc	ra,0xfffff
    80201f2a:	98e080e7          	jalr	-1650(ra) # 802008b4 <safestrcpy>
  pid = np->pid;
    80201f2e:	038a2483          	lw	s1,56(s4)
  np->state = RUNNABLE;
    80201f32:	4789                	li	a5,2
    80201f34:	00fa2c23          	sw	a5,24(s4)
  release(&np->lock);
    80201f38:	8552                	mv	a0,s4
    80201f3a:	ffffe097          	auipc	ra,0xffffe
    80201f3e:	7e0080e7          	jalr	2016(ra) # 8020071a <release>
}
    80201f42:	8526                	mv	a0,s1
    80201f44:	70e2                	ld	ra,56(sp)
    80201f46:	7442                	ld	s0,48(sp)
    80201f48:	74a2                	ld	s1,40(sp)
    80201f4a:	7902                	ld	s2,32(sp)
    80201f4c:	69e2                	ld	s3,24(sp)
    80201f4e:	6a42                	ld	s4,16(sp)
    80201f50:	6aa2                	ld	s5,8(sp)
    80201f52:	6121                	addi	sp,sp,64
    80201f54:	8082                	ret
    return -1;
    80201f56:	54fd                	li	s1,-1
    80201f58:	b7ed                	j	80201f42 <fork+0x100>

0000000080201f5a <reparent>:
{
    80201f5a:	7179                	addi	sp,sp,-48
    80201f5c:	f406                	sd	ra,40(sp)
    80201f5e:	f022                	sd	s0,32(sp)
    80201f60:	ec26                	sd	s1,24(sp)
    80201f62:	e84a                	sd	s2,16(sp)
    80201f64:	e44e                	sd	s3,8(sp)
    80201f66:	e052                	sd	s4,0(sp)
    80201f68:	1800                	addi	s0,sp,48
    80201f6a:	892a                	mv	s2,a0
  for(pp = proc; pp < &proc[NPROC]; pp++){
    80201f6c:	00012497          	auipc	s1,0x12
    80201f70:	21448493          	addi	s1,s1,532 # 80214180 <proc>
      pp->parent = initproc;
    80201f74:	00012a17          	auipc	s4,0x12
    80201f78:	0eca0a13          	addi	s4,s4,236 # 80214060 <pid_lock>
  for(pp = proc; pp < &proc[NPROC]; pp++){
    80201f7c:	00017997          	auipc	s3,0x17
    80201f80:	b7498993          	addi	s3,s3,-1164 # 80218af0 <bcache>
    80201f84:	a029                	j	80201f8e <reparent+0x34>
    80201f86:	17848493          	addi	s1,s1,376
    80201f8a:	03348363          	beq	s1,s3,80201fb0 <reparent+0x56>
    if(pp->parent == p){
    80201f8e:	709c                	ld	a5,32(s1)
    80201f90:	ff279be3          	bne	a5,s2,80201f86 <reparent+0x2c>
      acquire(&pp->lock);
    80201f94:	8526                	mv	a0,s1
    80201f96:	ffffe097          	auipc	ra,0xffffe
    80201f9a:	730080e7          	jalr	1840(ra) # 802006c6 <acquire>
      pp->parent = initproc;
    80201f9e:	118a3783          	ld	a5,280(s4)
    80201fa2:	f09c                	sd	a5,32(s1)
      release(&pp->lock);
    80201fa4:	8526                	mv	a0,s1
    80201fa6:	ffffe097          	auipc	ra,0xffffe
    80201faa:	774080e7          	jalr	1908(ra) # 8020071a <release>
    80201fae:	bfe1                	j	80201f86 <reparent+0x2c>
}
    80201fb0:	70a2                	ld	ra,40(sp)
    80201fb2:	7402                	ld	s0,32(sp)
    80201fb4:	64e2                	ld	s1,24(sp)
    80201fb6:	6942                	ld	s2,16(sp)
    80201fb8:	69a2                	ld	s3,8(sp)
    80201fba:	6a02                	ld	s4,0(sp)
    80201fbc:	6145                	addi	sp,sp,48
    80201fbe:	8082                	ret

0000000080201fc0 <scheduler>:
{
    80201fc0:	715d                	addi	sp,sp,-80
    80201fc2:	e486                	sd	ra,72(sp)
    80201fc4:	e0a2                	sd	s0,64(sp)
    80201fc6:	fc26                	sd	s1,56(sp)
    80201fc8:	f84a                	sd	s2,48(sp)
    80201fca:	f44e                	sd	s3,40(sp)
    80201fcc:	f052                	sd	s4,32(sp)
    80201fce:	ec56                	sd	s5,24(sp)
    80201fd0:	e85a                	sd	s6,16(sp)
    80201fd2:	e45e                	sd	s7,8(sp)
    80201fd4:	e062                	sd	s8,0(sp)
    80201fd6:	0880                	addi	s0,sp,80
    80201fd8:	8792                	mv	a5,tp
  int id = r_tp();
    80201fda:	2781                	sext.w	a5,a5
  c->proc = 0;
    80201fdc:	00779b13          	slli	s6,a5,0x7
    80201fe0:	00012717          	auipc	a4,0x12
    80201fe4:	08070713          	addi	a4,a4,128 # 80214060 <pid_lock>
    80201fe8:	975a                	add	a4,a4,s6
    80201fea:	00073c23          	sd	zero,24(a4)
        swtch(&c->context, &p->context);
    80201fee:	00012717          	auipc	a4,0x12
    80201ff2:	09270713          	addi	a4,a4,146 # 80214080 <cpus+0x8>
    80201ff6:	9b3a                	add	s6,s6,a4
        c->proc = p;
    80201ff8:	079e                	slli	a5,a5,0x7
    80201ffa:	00012a97          	auipc	s5,0x12
    80201ffe:	066a8a93          	addi	s5,s5,102 # 80214060 <pid_lock>
    80202002:	9abe                	add	s5,s5,a5
        w_satp(MAKE_SATP(p->kpagetable));
    80202004:	5a7d                	li	s4,-1
    80202006:	1a7e                	slli	s4,s4,0x3f
        w_satp(MAKE_SATP(kernel_pagetable));
    80202008:	0000ab97          	auipc	s7,0xa
    8020200c:	cf8bbb83          	ld	s7,-776(s7) # 8020bd00 <_GLOBAL_OFFSET_TABLE_+0x48>
    80202010:	a8a5                	j	80202088 <scheduler+0xc8>
      release(&p->lock);
    80202012:	8526                	mv	a0,s1
    80202014:	ffffe097          	auipc	ra,0xffffe
    80202018:	706080e7          	jalr	1798(ra) # 8020071a <release>
    for(p = proc; p < &proc[NPROC]; p++) {
    8020201c:	17848493          	addi	s1,s1,376
    80202020:	05248a63          	beq	s1,s2,80202074 <scheduler+0xb4>
      acquire(&p->lock);
    80202024:	8526                	mv	a0,s1
    80202026:	ffffe097          	auipc	ra,0xffffe
    8020202a:	6a0080e7          	jalr	1696(ra) # 802006c6 <acquire>
      if(p->state == RUNNABLE) {
    8020202e:	4c9c                	lw	a5,24(s1)
    80202030:	ff3791e3          	bne	a5,s3,80202012 <scheduler+0x52>
        p->state = RUNNING;
    80202034:	478d                	li	a5,3
    80202036:	cc9c                	sw	a5,24(s1)
        c->proc = p;
    80202038:	009abc23          	sd	s1,24(s5)
        w_satp(MAKE_SATP(p->kpagetable));
    8020203c:	6cbc                	ld	a5,88(s1)
    8020203e:	83b1                	srli	a5,a5,0xc
    80202040:	0147e7b3          	or	a5,a5,s4
  asm volatile("csrw satp, %0" : : "r" (x));
    80202044:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    80202048:	12000073          	sfence.vma
        swtch(&c->context, &p->context);
    8020204c:	06848593          	addi	a1,s1,104
    80202050:	855a                	mv	a0,s6
    80202052:	00001097          	auipc	ra,0x1
    80202056:	8b2080e7          	jalr	-1870(ra) # 80202904 <swtch>
        w_satp(MAKE_SATP(kernel_pagetable));
    8020205a:	000bb783          	ld	a5,0(s7)
    8020205e:	83b1                	srli	a5,a5,0xc
    80202060:	0147e7b3          	or	a5,a5,s4
  asm volatile("csrw satp, %0" : : "r" (x));
    80202064:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    80202068:	12000073          	sfence.vma
        c->proc = 0;
    8020206c:	000abc23          	sd	zero,24(s5)
        found = 1;
    80202070:	4c05                	li	s8,1
    80202072:	b745                	j	80202012 <scheduler+0x52>
    if(found == 0) {
    80202074:	000c1a63          	bnez	s8,80202088 <scheduler+0xc8>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202078:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    8020207c:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202080:	10079073          	csrw	sstatus,a5
      asm volatile("wfi");
    80202084:	10500073          	wfi
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202088:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    8020208c:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202090:	10079073          	csrw	sstatus,a5
    int found = 0;
    80202094:	4c01                	li	s8,0
    for(p = proc; p < &proc[NPROC]; p++) {
    80202096:	00012497          	auipc	s1,0x12
    8020209a:	0ea48493          	addi	s1,s1,234 # 80214180 <proc>
      if(p->state == RUNNABLE) {
    8020209e:	4989                	li	s3,2
    for(p = proc; p < &proc[NPROC]; p++) {
    802020a0:	00017917          	auipc	s2,0x17
    802020a4:	a5090913          	addi	s2,s2,-1456 # 80218af0 <bcache>
    802020a8:	bfb5                	j	80202024 <scheduler+0x64>

00000000802020aa <sched>:
{
    802020aa:	7179                	addi	sp,sp,-48
    802020ac:	f406                	sd	ra,40(sp)
    802020ae:	f022                	sd	s0,32(sp)
    802020b0:	ec26                	sd	s1,24(sp)
    802020b2:	e84a                	sd	s2,16(sp)
    802020b4:	e44e                	sd	s3,8(sp)
    802020b6:	1800                	addi	s0,sp,48
  struct proc *p = myproc();
    802020b8:	00000097          	auipc	ra,0x0
    802020bc:	984080e7          	jalr	-1660(ra) # 80201a3c <myproc>
    802020c0:	84aa                	mv	s1,a0
  if(!holding(&p->lock))
    802020c2:	ffffe097          	auipc	ra,0xffffe
    802020c6:	5d6080e7          	jalr	1494(ra) # 80200698 <holding>
    802020ca:	c93d                	beqz	a0,80202140 <sched+0x96>
  asm volatile("mv %0, tp" : "=r" (x) );
    802020cc:	8792                	mv	a5,tp
  if(mycpu()->noff != 1)
    802020ce:	2781                	sext.w	a5,a5
    802020d0:	079e                	slli	a5,a5,0x7
    802020d2:	00012717          	auipc	a4,0x12
    802020d6:	f8e70713          	addi	a4,a4,-114 # 80214060 <pid_lock>
    802020da:	97ba                	add	a5,a5,a4
    802020dc:	0907a703          	lw	a4,144(a5)
    802020e0:	4785                	li	a5,1
    802020e2:	06f71763          	bne	a4,a5,80202150 <sched+0xa6>
  if(p->state == RUNNING)
    802020e6:	4c98                	lw	a4,24(s1)
    802020e8:	478d                	li	a5,3
    802020ea:	06f70b63          	beq	a4,a5,80202160 <sched+0xb6>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802020ee:	100027f3          	csrr	a5,sstatus
  return (x & SSTATUS_SIE) != 0;
    802020f2:	8b89                	andi	a5,a5,2
  if(intr_get())
    802020f4:	efb5                	bnez	a5,80202170 <sched+0xc6>
  asm volatile("mv %0, tp" : "=r" (x) );
    802020f6:	8792                	mv	a5,tp
  intena = mycpu()->intena;
    802020f8:	00012917          	auipc	s2,0x12
    802020fc:	f6890913          	addi	s2,s2,-152 # 80214060 <pid_lock>
    80202100:	2781                	sext.w	a5,a5
    80202102:	079e                	slli	a5,a5,0x7
    80202104:	97ca                	add	a5,a5,s2
    80202106:	0947a983          	lw	s3,148(a5)
    8020210a:	8792                	mv	a5,tp
  swtch(&p->context, &mycpu()->context);
    8020210c:	2781                	sext.w	a5,a5
    8020210e:	079e                	slli	a5,a5,0x7
    80202110:	00012597          	auipc	a1,0x12
    80202114:	f7058593          	addi	a1,a1,-144 # 80214080 <cpus+0x8>
    80202118:	95be                	add	a1,a1,a5
    8020211a:	06848513          	addi	a0,s1,104
    8020211e:	00000097          	auipc	ra,0x0
    80202122:	7e6080e7          	jalr	2022(ra) # 80202904 <swtch>
    80202126:	8792                	mv	a5,tp
  mycpu()->intena = intena;
    80202128:	2781                	sext.w	a5,a5
    8020212a:	079e                	slli	a5,a5,0x7
    8020212c:	993e                	add	s2,s2,a5
    8020212e:	09392a23          	sw	s3,148(s2)
}
    80202132:	70a2                	ld	ra,40(sp)
    80202134:	7402                	ld	s0,32(sp)
    80202136:	64e2                	ld	s1,24(sp)
    80202138:	6942                	ld	s2,16(sp)
    8020213a:	69a2                	ld	s3,8(sp)
    8020213c:	6145                	addi	sp,sp,48
    8020213e:	8082                	ret
    panic("sched p->lock");
    80202140:	00007517          	auipc	a0,0x7
    80202144:	50850513          	addi	a0,a0,1288 # 80209648 <digits+0x2c8>
    80202148:	ffffe097          	auipc	ra,0xffffe
    8020214c:	ffc080e7          	jalr	-4(ra) # 80200144 <panic>
    panic("sched locks");
    80202150:	00007517          	auipc	a0,0x7
    80202154:	50850513          	addi	a0,a0,1288 # 80209658 <digits+0x2d8>
    80202158:	ffffe097          	auipc	ra,0xffffe
    8020215c:	fec080e7          	jalr	-20(ra) # 80200144 <panic>
    panic("sched running");
    80202160:	00007517          	auipc	a0,0x7
    80202164:	50850513          	addi	a0,a0,1288 # 80209668 <digits+0x2e8>
    80202168:	ffffe097          	auipc	ra,0xffffe
    8020216c:	fdc080e7          	jalr	-36(ra) # 80200144 <panic>
    panic("sched interruptible");
    80202170:	00007517          	auipc	a0,0x7
    80202174:	50850513          	addi	a0,a0,1288 # 80209678 <digits+0x2f8>
    80202178:	ffffe097          	auipc	ra,0xffffe
    8020217c:	fcc080e7          	jalr	-52(ra) # 80200144 <panic>

0000000080202180 <exit>:
{
    80202180:	7179                	addi	sp,sp,-48
    80202182:	f406                	sd	ra,40(sp)
    80202184:	f022                	sd	s0,32(sp)
    80202186:	ec26                	sd	s1,24(sp)
    80202188:	e84a                	sd	s2,16(sp)
    8020218a:	e44e                	sd	s3,8(sp)
    8020218c:	e052                	sd	s4,0(sp)
    8020218e:	1800                	addi	s0,sp,48
    80202190:	8a2a                	mv	s4,a0
  struct proc *p = myproc();
    80202192:	00000097          	auipc	ra,0x0
    80202196:	8aa080e7          	jalr	-1878(ra) # 80201a3c <myproc>
    8020219a:	89aa                	mv	s3,a0
  if (status == -1 && p == initproc){
    8020219c:	57fd                	li	a5,-1
    8020219e:	00fa0d63          	beq	s4,a5,802021b8 <exit+0x38>
  if(p == initproc)
    802021a2:	00012797          	auipc	a5,0x12
    802021a6:	fd67b783          	ld	a5,-42(a5) # 80214178 <initproc>
    802021aa:	03378563          	beq	a5,s3,802021d4 <exit+0x54>
  for(int fd = 0; fd < NOFILE; fd++){
    802021ae:	0d898493          	addi	s1,s3,216
    802021b2:	15898913          	addi	s2,s3,344
    802021b6:	a081                	j	802021f6 <exit+0x76>
  if (status == -1 && p == initproc){
    802021b8:	00012797          	auipc	a5,0x12
    802021bc:	fc07b783          	ld	a5,-64(a5) # 80214178 <initproc>
    802021c0:	fea797e3          	bne	a5,a0,802021ae <exit+0x2e>
	SBI_CALL_0(SBI_SHUTDOWN);
    802021c4:	4501                	li	a0,0
    802021c6:	4581                	li	a1,0
    802021c8:	4601                	li	a2,0
    802021ca:	4681                	li	a3,0
    802021cc:	48a1                	li	a7,8
    802021ce:	00000073          	ecall
}
    802021d2:	bfc1                	j	802021a2 <exit+0x22>
    panic("initexiting");
    802021d4:	00007517          	auipc	a0,0x7
    802021d8:	4bc50513          	addi	a0,a0,1212 # 80209690 <digits+0x310>
    802021dc:	ffffe097          	auipc	ra,0xffffe
    802021e0:	f68080e7          	jalr	-152(ra) # 80200144 <panic>
      fileclose(f);
    802021e4:	00002097          	auipc	ra,0x2
    802021e8:	b50080e7          	jalr	-1200(ra) # 80203d34 <fileclose>
      p->ofile[fd] = 0;
    802021ec:	0004b023          	sd	zero,0(s1)
  for(int fd = 0; fd < NOFILE; fd++){
    802021f0:	04a1                	addi	s1,s1,8
    802021f2:	01248563          	beq	s1,s2,802021fc <exit+0x7c>
    if(p->ofile[fd]){
    802021f6:	6088                	ld	a0,0(s1)
    802021f8:	f575                	bnez	a0,802021e4 <exit+0x64>
    802021fa:	bfdd                	j	802021f0 <exit+0x70>
  eput(p->cwd);
    802021fc:	1589b503          	ld	a0,344(s3)
    80202200:	00005097          	auipc	ra,0x5
    80202204:	8f0080e7          	jalr	-1808(ra) # 80206af0 <eput>
  p->cwd = 0;
    80202208:	1409bc23          	sd	zero,344(s3)
  acquire(&initproc->lock);
    8020220c:	00012497          	auipc	s1,0x12
    80202210:	e5448493          	addi	s1,s1,-428 # 80214060 <pid_lock>
    80202214:	1184b503          	ld	a0,280(s1)
    80202218:	ffffe097          	auipc	ra,0xffffe
    8020221c:	4ae080e7          	jalr	1198(ra) # 802006c6 <acquire>
  wakeup1(initproc);
    80202220:	1184b503          	ld	a0,280(s1)
    80202224:	fffff097          	auipc	ra,0xfffff
    80202228:	62c080e7          	jalr	1580(ra) # 80201850 <wakeup1>
  release(&initproc->lock);
    8020222c:	1184b503          	ld	a0,280(s1)
    80202230:	ffffe097          	auipc	ra,0xffffe
    80202234:	4ea080e7          	jalr	1258(ra) # 8020071a <release>
  acquire(&p->lock);
    80202238:	854e                	mv	a0,s3
    8020223a:	ffffe097          	auipc	ra,0xffffe
    8020223e:	48c080e7          	jalr	1164(ra) # 802006c6 <acquire>
  struct proc *original_parent = p->parent;
    80202242:	0209b483          	ld	s1,32(s3)
  release(&p->lock);
    80202246:	854e                	mv	a0,s3
    80202248:	ffffe097          	auipc	ra,0xffffe
    8020224c:	4d2080e7          	jalr	1234(ra) # 8020071a <release>
  acquire(&original_parent->lock);
    80202250:	8526                	mv	a0,s1
    80202252:	ffffe097          	auipc	ra,0xffffe
    80202256:	474080e7          	jalr	1140(ra) # 802006c6 <acquire>
  acquire(&p->lock);
    8020225a:	854e                	mv	a0,s3
    8020225c:	ffffe097          	auipc	ra,0xffffe
    80202260:	46a080e7          	jalr	1130(ra) # 802006c6 <acquire>
  reparent(p);
    80202264:	854e                	mv	a0,s3
    80202266:	00000097          	auipc	ra,0x0
    8020226a:	cf4080e7          	jalr	-780(ra) # 80201f5a <reparent>
  wakeup1(original_parent);
    8020226e:	8526                	mv	a0,s1
    80202270:	fffff097          	auipc	ra,0xfffff
    80202274:	5e0080e7          	jalr	1504(ra) # 80201850 <wakeup1>
  p->xstate = status;
    80202278:	0349aa23          	sw	s4,52(s3)
  p->state = ZOMBIE;
    8020227c:	4791                	li	a5,4
    8020227e:	00f9ac23          	sw	a5,24(s3)
  release(&original_parent->lock);
    80202282:	8526                	mv	a0,s1
    80202284:	ffffe097          	auipc	ra,0xffffe
    80202288:	496080e7          	jalr	1174(ra) # 8020071a <release>
  sched();
    8020228c:	00000097          	auipc	ra,0x0
    80202290:	e1e080e7          	jalr	-482(ra) # 802020aa <sched>
  panic("zombie exit");
    80202294:	00007517          	auipc	a0,0x7
    80202298:	40c50513          	addi	a0,a0,1036 # 802096a0 <digits+0x320>
    8020229c:	ffffe097          	auipc	ra,0xffffe
    802022a0:	ea8080e7          	jalr	-344(ra) # 80200144 <panic>

00000000802022a4 <yield>:
{
    802022a4:	1101                	addi	sp,sp,-32
    802022a6:	ec06                	sd	ra,24(sp)
    802022a8:	e822                	sd	s0,16(sp)
    802022aa:	e426                	sd	s1,8(sp)
    802022ac:	1000                	addi	s0,sp,32
  struct proc *p = myproc();
    802022ae:	fffff097          	auipc	ra,0xfffff
    802022b2:	78e080e7          	jalr	1934(ra) # 80201a3c <myproc>
    802022b6:	84aa                	mv	s1,a0
  acquire(&p->lock);
    802022b8:	ffffe097          	auipc	ra,0xffffe
    802022bc:	40e080e7          	jalr	1038(ra) # 802006c6 <acquire>
  p->state = RUNNABLE;
    802022c0:	4789                	li	a5,2
    802022c2:	cc9c                	sw	a5,24(s1)
  sched();
    802022c4:	00000097          	auipc	ra,0x0
    802022c8:	de6080e7          	jalr	-538(ra) # 802020aa <sched>
  release(&p->lock);
    802022cc:	8526                	mv	a0,s1
    802022ce:	ffffe097          	auipc	ra,0xffffe
    802022d2:	44c080e7          	jalr	1100(ra) # 8020071a <release>
}
    802022d6:	60e2                	ld	ra,24(sp)
    802022d8:	6442                	ld	s0,16(sp)
    802022da:	64a2                	ld	s1,8(sp)
    802022dc:	6105                	addi	sp,sp,32
    802022de:	8082                	ret

00000000802022e0 <sleep>:
{
    802022e0:	7179                	addi	sp,sp,-48
    802022e2:	f406                	sd	ra,40(sp)
    802022e4:	f022                	sd	s0,32(sp)
    802022e6:	ec26                	sd	s1,24(sp)
    802022e8:	e84a                	sd	s2,16(sp)
    802022ea:	e44e                	sd	s3,8(sp)
    802022ec:	1800                	addi	s0,sp,48
    802022ee:	89aa                	mv	s3,a0
    802022f0:	892e                	mv	s2,a1
  struct proc *p = myproc();
    802022f2:	fffff097          	auipc	ra,0xfffff
    802022f6:	74a080e7          	jalr	1866(ra) # 80201a3c <myproc>
    802022fa:	84aa                	mv	s1,a0
  if(lk != &p->lock){  //DOC: sleeplock0
    802022fc:	05250663          	beq	a0,s2,80202348 <sleep+0x68>
    acquire(&p->lock);  //DOC: sleeplock1
    80202300:	ffffe097          	auipc	ra,0xffffe
    80202304:	3c6080e7          	jalr	966(ra) # 802006c6 <acquire>
    release(lk);
    80202308:	854a                	mv	a0,s2
    8020230a:	ffffe097          	auipc	ra,0xffffe
    8020230e:	410080e7          	jalr	1040(ra) # 8020071a <release>
  p->chan = chan;
    80202312:	0334b423          	sd	s3,40(s1)
  p->state = SLEEPING;
    80202316:	4785                	li	a5,1
    80202318:	cc9c                	sw	a5,24(s1)
  sched();
    8020231a:	00000097          	auipc	ra,0x0
    8020231e:	d90080e7          	jalr	-624(ra) # 802020aa <sched>
  p->chan = 0;
    80202322:	0204b423          	sd	zero,40(s1)
    release(&p->lock);
    80202326:	8526                	mv	a0,s1
    80202328:	ffffe097          	auipc	ra,0xffffe
    8020232c:	3f2080e7          	jalr	1010(ra) # 8020071a <release>
    acquire(lk);
    80202330:	854a                	mv	a0,s2
    80202332:	ffffe097          	auipc	ra,0xffffe
    80202336:	394080e7          	jalr	916(ra) # 802006c6 <acquire>
}
    8020233a:	70a2                	ld	ra,40(sp)
    8020233c:	7402                	ld	s0,32(sp)
    8020233e:	64e2                	ld	s1,24(sp)
    80202340:	6942                	ld	s2,16(sp)
    80202342:	69a2                	ld	s3,8(sp)
    80202344:	6145                	addi	sp,sp,48
    80202346:	8082                	ret
  p->chan = chan;
    80202348:	03353423          	sd	s3,40(a0)
  p->state = SLEEPING;
    8020234c:	4785                	li	a5,1
    8020234e:	cd1c                	sw	a5,24(a0)
  sched();
    80202350:	00000097          	auipc	ra,0x0
    80202354:	d5a080e7          	jalr	-678(ra) # 802020aa <sched>
  p->chan = 0;
    80202358:	0204b423          	sd	zero,40(s1)
  if(lk != &p->lock){
    8020235c:	bff9                	j	8020233a <sleep+0x5a>

000000008020235e <wait>:
{
    8020235e:	715d                	addi	sp,sp,-80
    80202360:	e486                	sd	ra,72(sp)
    80202362:	e0a2                	sd	s0,64(sp)
    80202364:	fc26                	sd	s1,56(sp)
    80202366:	f84a                	sd	s2,48(sp)
    80202368:	f44e                	sd	s3,40(sp)
    8020236a:	f052                	sd	s4,32(sp)
    8020236c:	ec56                	sd	s5,24(sp)
    8020236e:	e85a                	sd	s6,16(sp)
    80202370:	e45e                	sd	s7,8(sp)
    80202372:	0880                	addi	s0,sp,80
    80202374:	8b2a                	mv	s6,a0
  struct proc *p = myproc();
    80202376:	fffff097          	auipc	ra,0xfffff
    8020237a:	6c6080e7          	jalr	1734(ra) # 80201a3c <myproc>
    8020237e:	892a                	mv	s2,a0
  acquire(&p->lock);
    80202380:	ffffe097          	auipc	ra,0xffffe
    80202384:	346080e7          	jalr	838(ra) # 802006c6 <acquire>
    havekids = 0;
    80202388:	4b81                	li	s7,0
        if(np->state == ZOMBIE){
    8020238a:	4a11                	li	s4,4
        havekids = 1;
    8020238c:	4a85                	li	s5,1
    for(np = proc; np < &proc[NPROC]; np++){
    8020238e:	00016997          	auipc	s3,0x16
    80202392:	76298993          	addi	s3,s3,1890 # 80218af0 <bcache>
    havekids = 0;
    80202396:	875e                	mv	a4,s7
    for(np = proc; np < &proc[NPROC]; np++){
    80202398:	00012497          	auipc	s1,0x12
    8020239c:	de848493          	addi	s1,s1,-536 # 80214180 <proc>
    802023a0:	a8b9                	j	802023fe <wait+0xa0>
          pid = np->pid;
    802023a2:	0384a983          	lw	s3,56(s1)
          if(addr != 0 && copyout2(addr, (char *)&np->xstate, sizeof(np->xstate)) < 0) {
    802023a6:	000b0c63          	beqz	s6,802023be <wait+0x60>
    802023aa:	4611                	li	a2,4
    802023ac:	03448593          	addi	a1,s1,52
    802023b0:	855a                	mv	a0,s6
    802023b2:	fffff097          	auipc	ra,0xfffff
    802023b6:	fc0080e7          	jalr	-64(ra) # 80201372 <copyout2>
    802023ba:	02054263          	bltz	a0,802023de <wait+0x80>
          freeproc(np);
    802023be:	8526                	mv	a0,s1
    802023c0:	00000097          	auipc	ra,0x0
    802023c4:	84e080e7          	jalr	-1970(ra) # 80201c0e <freeproc>
          release(&np->lock);
    802023c8:	8526                	mv	a0,s1
    802023ca:	ffffe097          	auipc	ra,0xffffe
    802023ce:	350080e7          	jalr	848(ra) # 8020071a <release>
          release(&p->lock);
    802023d2:	854a                	mv	a0,s2
    802023d4:	ffffe097          	auipc	ra,0xffffe
    802023d8:	346080e7          	jalr	838(ra) # 8020071a <release>
          return pid;
    802023dc:	a8a9                	j	80202436 <wait+0xd8>
            release(&np->lock);
    802023de:	8526                	mv	a0,s1
    802023e0:	ffffe097          	auipc	ra,0xffffe
    802023e4:	33a080e7          	jalr	826(ra) # 8020071a <release>
            release(&p->lock);
    802023e8:	854a                	mv	a0,s2
    802023ea:	ffffe097          	auipc	ra,0xffffe
    802023ee:	330080e7          	jalr	816(ra) # 8020071a <release>
            return -1;
    802023f2:	59fd                	li	s3,-1
    802023f4:	a089                	j	80202436 <wait+0xd8>
    for(np = proc; np < &proc[NPROC]; np++){
    802023f6:	17848493          	addi	s1,s1,376
    802023fa:	03348463          	beq	s1,s3,80202422 <wait+0xc4>
      if(np->parent == p){
    802023fe:	709c                	ld	a5,32(s1)
    80202400:	ff279be3          	bne	a5,s2,802023f6 <wait+0x98>
        acquire(&np->lock);
    80202404:	8526                	mv	a0,s1
    80202406:	ffffe097          	auipc	ra,0xffffe
    8020240a:	2c0080e7          	jalr	704(ra) # 802006c6 <acquire>
        if(np->state == ZOMBIE){
    8020240e:	4c9c                	lw	a5,24(s1)
    80202410:	f94789e3          	beq	a5,s4,802023a2 <wait+0x44>
        release(&np->lock);
    80202414:	8526                	mv	a0,s1
    80202416:	ffffe097          	auipc	ra,0xffffe
    8020241a:	304080e7          	jalr	772(ra) # 8020071a <release>
        havekids = 1;
    8020241e:	8756                	mv	a4,s5
    80202420:	bfd9                	j	802023f6 <wait+0x98>
    if(!havekids || p->killed){
    80202422:	c701                	beqz	a4,8020242a <wait+0xcc>
    80202424:	03092783          	lw	a5,48(s2)
    80202428:	c39d                	beqz	a5,8020244e <wait+0xf0>
      release(&p->lock);
    8020242a:	854a                	mv	a0,s2
    8020242c:	ffffe097          	auipc	ra,0xffffe
    80202430:	2ee080e7          	jalr	750(ra) # 8020071a <release>
      return -1;
    80202434:	59fd                	li	s3,-1
}
    80202436:	854e                	mv	a0,s3
    80202438:	60a6                	ld	ra,72(sp)
    8020243a:	6406                	ld	s0,64(sp)
    8020243c:	74e2                	ld	s1,56(sp)
    8020243e:	7942                	ld	s2,48(sp)
    80202440:	79a2                	ld	s3,40(sp)
    80202442:	7a02                	ld	s4,32(sp)
    80202444:	6ae2                	ld	s5,24(sp)
    80202446:	6b42                	ld	s6,16(sp)
    80202448:	6ba2                	ld	s7,8(sp)
    8020244a:	6161                	addi	sp,sp,80
    8020244c:	8082                	ret
    sleep(p, &p->lock);  //DOC: wait-sleep
    8020244e:	85ca                	mv	a1,s2
    80202450:	854a                	mv	a0,s2
    80202452:	00000097          	auipc	ra,0x0
    80202456:	e8e080e7          	jalr	-370(ra) # 802022e0 <sleep>
    havekids = 0;
    8020245a:	bf35                	j	80202396 <wait+0x38>

000000008020245c <wakeup>:
{
    8020245c:	7139                	addi	sp,sp,-64
    8020245e:	fc06                	sd	ra,56(sp)
    80202460:	f822                	sd	s0,48(sp)
    80202462:	f426                	sd	s1,40(sp)
    80202464:	f04a                	sd	s2,32(sp)
    80202466:	ec4e                	sd	s3,24(sp)
    80202468:	e852                	sd	s4,16(sp)
    8020246a:	e456                	sd	s5,8(sp)
    8020246c:	0080                	addi	s0,sp,64
    8020246e:	8a2a                	mv	s4,a0
  for(p = proc; p < &proc[NPROC]; p++) {
    80202470:	00012497          	auipc	s1,0x12
    80202474:	d1048493          	addi	s1,s1,-752 # 80214180 <proc>
    if(p->state == SLEEPING && p->chan == chan) {
    80202478:	4985                	li	s3,1
      p->state = RUNNABLE;
    8020247a:	4a89                	li	s5,2
  for(p = proc; p < &proc[NPROC]; p++) {
    8020247c:	00016917          	auipc	s2,0x16
    80202480:	67490913          	addi	s2,s2,1652 # 80218af0 <bcache>
    80202484:	a811                	j	80202498 <wakeup+0x3c>
    release(&p->lock);
    80202486:	8526                	mv	a0,s1
    80202488:	ffffe097          	auipc	ra,0xffffe
    8020248c:	292080e7          	jalr	658(ra) # 8020071a <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    80202490:	17848493          	addi	s1,s1,376
    80202494:	03248063          	beq	s1,s2,802024b4 <wakeup+0x58>
    acquire(&p->lock);
    80202498:	8526                	mv	a0,s1
    8020249a:	ffffe097          	auipc	ra,0xffffe
    8020249e:	22c080e7          	jalr	556(ra) # 802006c6 <acquire>
    if(p->state == SLEEPING && p->chan == chan) {
    802024a2:	4c9c                	lw	a5,24(s1)
    802024a4:	ff3791e3          	bne	a5,s3,80202486 <wakeup+0x2a>
    802024a8:	749c                	ld	a5,40(s1)
    802024aa:	fd479ee3          	bne	a5,s4,80202486 <wakeup+0x2a>
      p->state = RUNNABLE;
    802024ae:	0154ac23          	sw	s5,24(s1)
    802024b2:	bfd1                	j	80202486 <wakeup+0x2a>
}
    802024b4:	70e2                	ld	ra,56(sp)
    802024b6:	7442                	ld	s0,48(sp)
    802024b8:	74a2                	ld	s1,40(sp)
    802024ba:	7902                	ld	s2,32(sp)
    802024bc:	69e2                	ld	s3,24(sp)
    802024be:	6a42                	ld	s4,16(sp)
    802024c0:	6aa2                	ld	s5,8(sp)
    802024c2:	6121                	addi	sp,sp,64
    802024c4:	8082                	ret

00000000802024c6 <kill>:
// Kill the process with the given pid.
// The victim won't exit until it tries to return
// to user space (see usertrap() in trap.c).
int
kill(int pid)
{
    802024c6:	7179                	addi	sp,sp,-48
    802024c8:	f406                	sd	ra,40(sp)
    802024ca:	f022                	sd	s0,32(sp)
    802024cc:	ec26                	sd	s1,24(sp)
    802024ce:	e84a                	sd	s2,16(sp)
    802024d0:	e44e                	sd	s3,8(sp)
    802024d2:	1800                	addi	s0,sp,48
    802024d4:	892a                	mv	s2,a0
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++){
    802024d6:	00012497          	auipc	s1,0x12
    802024da:	caa48493          	addi	s1,s1,-854 # 80214180 <proc>
    802024de:	00016997          	auipc	s3,0x16
    802024e2:	61298993          	addi	s3,s3,1554 # 80218af0 <bcache>
    acquire(&p->lock);
    802024e6:	8526                	mv	a0,s1
    802024e8:	ffffe097          	auipc	ra,0xffffe
    802024ec:	1de080e7          	jalr	478(ra) # 802006c6 <acquire>
    if(p->pid == pid){
    802024f0:	5c9c                	lw	a5,56(s1)
    802024f2:	01278d63          	beq	a5,s2,8020250c <kill+0x46>
        p->state = RUNNABLE;
      }
      release(&p->lock);
      return 0;
    }
    release(&p->lock);
    802024f6:	8526                	mv	a0,s1
    802024f8:	ffffe097          	auipc	ra,0xffffe
    802024fc:	222080e7          	jalr	546(ra) # 8020071a <release>
  for(p = proc; p < &proc[NPROC]; p++){
    80202500:	17848493          	addi	s1,s1,376
    80202504:	ff3491e3          	bne	s1,s3,802024e6 <kill+0x20>
  }
  return -1;
    80202508:	557d                	li	a0,-1
    8020250a:	a821                	j	80202522 <kill+0x5c>
      p->killed = 1;
    8020250c:	4785                	li	a5,1
    8020250e:	d89c                	sw	a5,48(s1)
      if(p->state == SLEEPING){
    80202510:	4c98                	lw	a4,24(s1)
    80202512:	00f70f63          	beq	a4,a5,80202530 <kill+0x6a>
      release(&p->lock);
    80202516:	8526                	mv	a0,s1
    80202518:	ffffe097          	auipc	ra,0xffffe
    8020251c:	202080e7          	jalr	514(ra) # 8020071a <release>
      return 0;
    80202520:	4501                	li	a0,0
}
    80202522:	70a2                	ld	ra,40(sp)
    80202524:	7402                	ld	s0,32(sp)
    80202526:	64e2                	ld	s1,24(sp)
    80202528:	6942                	ld	s2,16(sp)
    8020252a:	69a2                	ld	s3,8(sp)
    8020252c:	6145                	addi	sp,sp,48
    8020252e:	8082                	ret
        p->state = RUNNABLE;
    80202530:	4789                	li	a5,2
    80202532:	cc9c                	sw	a5,24(s1)
    80202534:	b7cd                	j	80202516 <kill+0x50>

0000000080202536 <either_copyout>:
// Copy to either a user address, or kernel address,
// depending on usr_dst.
// Returns 0 on success, -1 on error.
int
either_copyout(int user_dst, uint64 dst, void *src, uint64 len)
{
    80202536:	1101                	addi	sp,sp,-32
    80202538:	ec06                	sd	ra,24(sp)
    8020253a:	e822                	sd	s0,16(sp)
    8020253c:	e426                	sd	s1,8(sp)
    8020253e:	1000                	addi	s0,sp,32
    80202540:	84aa                	mv	s1,a0
    80202542:	852e                	mv	a0,a1
    80202544:	85b2                	mv	a1,a2
    80202546:	8636                	mv	a2,a3
  // struct proc *p = myproc();
  if(user_dst){
    80202548:	c891                	beqz	s1,8020255c <either_copyout+0x26>
    // return copyout(p->pagetable, dst, src, len);
    return copyout2(dst, src, len);
    8020254a:	fffff097          	auipc	ra,0xfffff
    8020254e:	e28080e7          	jalr	-472(ra) # 80201372 <copyout2>
  } else {
    memmove((char *)dst, src, len);
    return 0;
  }
}
    80202552:	60e2                	ld	ra,24(sp)
    80202554:	6442                	ld	s0,16(sp)
    80202556:	64a2                	ld	s1,8(sp)
    80202558:	6105                	addi	sp,sp,32
    8020255a:	8082                	ret
    memmove((char *)dst, src, len);
    8020255c:	0006861b          	sext.w	a2,a3
    80202560:	ffffe097          	auipc	ra,0xffffe
    80202564:	25e080e7          	jalr	606(ra) # 802007be <memmove>
    return 0;
    80202568:	8526                	mv	a0,s1
    8020256a:	b7e5                	j	80202552 <either_copyout+0x1c>

000000008020256c <either_copyin>:
// Copy from either a user address, or kernel address,
// depending on usr_src.
// Returns 0 on success, -1 on error.
int
either_copyin(void *dst, int user_src, uint64 src, uint64 len)
{
    8020256c:	1101                	addi	sp,sp,-32
    8020256e:	ec06                	sd	ra,24(sp)
    80202570:	e822                	sd	s0,16(sp)
    80202572:	e426                	sd	s1,8(sp)
    80202574:	1000                	addi	s0,sp,32
    80202576:	84ae                	mv	s1,a1
    80202578:	85b2                	mv	a1,a2
    8020257a:	8636                	mv	a2,a3
  // struct proc *p = myproc();
  if(user_src){
    8020257c:	c891                	beqz	s1,80202590 <either_copyin+0x24>
    // return copyin(p->pagetable, dst, src, len);
    return copyin2(dst, src, len);
    8020257e:	fffff097          	auipc	ra,0xfffff
    80202582:	ed4080e7          	jalr	-300(ra) # 80201452 <copyin2>
  } else {
    memmove(dst, (char*)src, len);
    return 0;
  }
}
    80202586:	60e2                	ld	ra,24(sp)
    80202588:	6442                	ld	s0,16(sp)
    8020258a:	64a2                	ld	s1,8(sp)
    8020258c:	6105                	addi	sp,sp,32
    8020258e:	8082                	ret
    memmove(dst, (char*)src, len);
    80202590:	0006861b          	sext.w	a2,a3
    80202594:	ffffe097          	auipc	ra,0xffffe
    80202598:	22a080e7          	jalr	554(ra) # 802007be <memmove>
    return 0;
    8020259c:	8526                	mv	a0,s1
    8020259e:	b7e5                	j	80202586 <either_copyin+0x1a>

00000000802025a0 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
    802025a0:	715d                	addi	sp,sp,-80
    802025a2:	e486                	sd	ra,72(sp)
    802025a4:	e0a2                	sd	s0,64(sp)
    802025a6:	fc26                	sd	s1,56(sp)
    802025a8:	f84a                	sd	s2,48(sp)
    802025aa:	f44e                	sd	s3,40(sp)
    802025ac:	f052                	sd	s4,32(sp)
    802025ae:	ec56                	sd	s5,24(sp)
    802025b0:	e85a                	sd	s6,16(sp)
    802025b2:	e45e                	sd	s7,8(sp)
    802025b4:	0880                	addi	s0,sp,80
  [ZOMBIE]    "zombie"
  };
  struct proc *p;
  char *state;

  printf("\nPID\tSTATE\tNAME\tMEM\n");
    802025b6:	00007517          	auipc	a0,0x7
    802025ba:	10250513          	addi	a0,a0,258 # 802096b8 <digits+0x338>
    802025be:	ffffe097          	auipc	ra,0xffffe
    802025c2:	bd0080e7          	jalr	-1072(ra) # 8020018e <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    802025c6:	00012497          	auipc	s1,0x12
    802025ca:	d1a48493          	addi	s1,s1,-742 # 802142e0 <proc+0x160>
    802025ce:	00016917          	auipc	s2,0x16
    802025d2:	68290913          	addi	s2,s2,1666 # 80218c50 <bcache+0x160>
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    802025d6:	4b11                	li	s6,4
      state = states[p->state];
    else
      state = "???";
    802025d8:	00007997          	auipc	s3,0x7
    802025dc:	0d898993          	addi	s3,s3,216 # 802096b0 <digits+0x330>
    printf("%d\t%s\t%s\t%d", p->pid, state, p->name, p->sz);
    802025e0:	00007a97          	auipc	s5,0x7
    802025e4:	0f0a8a93          	addi	s5,s5,240 # 802096d0 <digits+0x350>
    printf("\n");
    802025e8:	00007a17          	auipc	s4,0x7
    802025ec:	af0a0a13          	addi	s4,s4,-1296 # 802090d8 <etext+0xd8>
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    802025f0:	00008b97          	auipc	s7,0x8
    802025f4:	638b8b93          	addi	s7,s7,1592 # 8020ac28 <states.0>
    802025f8:	a01d                	j	8020261e <procdump+0x7e>
    printf("%d\t%s\t%s\t%d", p->pid, state, p->name, p->sz);
    802025fa:	ee86b703          	ld	a4,-280(a3)
    802025fe:	ed86a583          	lw	a1,-296(a3)
    80202602:	8556                	mv	a0,s5
    80202604:	ffffe097          	auipc	ra,0xffffe
    80202608:	b8a080e7          	jalr	-1142(ra) # 8020018e <printf>
    printf("\n");
    8020260c:	8552                	mv	a0,s4
    8020260e:	ffffe097          	auipc	ra,0xffffe
    80202612:	b80080e7          	jalr	-1152(ra) # 8020018e <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    80202616:	17848493          	addi	s1,s1,376
    8020261a:	03248263          	beq	s1,s2,8020263e <procdump+0x9e>
    if(p->state == UNUSED)
    8020261e:	86a6                	mv	a3,s1
    80202620:	eb84a783          	lw	a5,-328(s1)
    80202624:	dbed                	beqz	a5,80202616 <procdump+0x76>
      state = "???";
    80202626:	864e                	mv	a2,s3
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    80202628:	fcfb69e3          	bltu	s6,a5,802025fa <procdump+0x5a>
    8020262c:	02079713          	slli	a4,a5,0x20
    80202630:	01d75793          	srli	a5,a4,0x1d
    80202634:	97de                	add	a5,a5,s7
    80202636:	6390                	ld	a2,0(a5)
    80202638:	f269                	bnez	a2,802025fa <procdump+0x5a>
      state = "???";
    8020263a:	864e                	mv	a2,s3
    8020263c:	bf7d                	j	802025fa <procdump+0x5a>
  }
}
    8020263e:	60a6                	ld	ra,72(sp)
    80202640:	6406                	ld	s0,64(sp)
    80202642:	74e2                	ld	s1,56(sp)
    80202644:	7942                	ld	s2,48(sp)
    80202646:	79a2                	ld	s3,40(sp)
    80202648:	7a02                	ld	s4,32(sp)
    8020264a:	6ae2                	ld	s5,24(sp)
    8020264c:	6b42                	ld	s6,16(sp)
    8020264e:	6ba2                	ld	s7,8(sp)
    80202650:	6161                	addi	sp,sp,80
    80202652:	8082                	ret

0000000080202654 <procnum>:

uint64
procnum(void)
{
    80202654:	1141                	addi	sp,sp,-16
    80202656:	e422                	sd	s0,8(sp)
    80202658:	0800                	addi	s0,sp,16
  int num = 0;
  struct proc *p;

  for (p = proc; p < &proc[NPROC]; p++) {
    8020265a:	00012797          	auipc	a5,0x12
    8020265e:	b2678793          	addi	a5,a5,-1242 # 80214180 <proc>
  int num = 0;
    80202662:	4501                	li	a0,0
  for (p = proc; p < &proc[NPROC]; p++) {
    80202664:	00016697          	auipc	a3,0x16
    80202668:	48c68693          	addi	a3,a3,1164 # 80218af0 <bcache>
    8020266c:	a029                	j	80202676 <procnum+0x22>
    8020266e:	17878793          	addi	a5,a5,376
    80202672:	00d78663          	beq	a5,a3,8020267e <procnum+0x2a>
    if (p->state != UNUSED) {
    80202676:	4f98                	lw	a4,24(a5)
    80202678:	db7d                	beqz	a4,8020266e <procnum+0x1a>
      num++;
    8020267a:	2505                	addiw	a0,a0,1
    8020267c:	bfcd                	j	8020266e <procnum+0x1a>
    }
  }

  return num;
}
    8020267e:	6422                	ld	s0,8(sp)
    80202680:	0141                	addi	sp,sp,16
    80202682:	8082                	ret

0000000080202684 <clone>:

/////////////////////////////////////


int clone(uint64 flag, uint64 stack) {
    80202684:	7139                	addi	sp,sp,-64
    80202686:	fc06                	sd	ra,56(sp)
    80202688:	f822                	sd	s0,48(sp)
    8020268a:	f426                	sd	s1,40(sp)
    8020268c:	f04a                	sd	s2,32(sp)
    8020268e:	ec4e                	sd	s3,24(sp)
    80202690:	e852                	sd	s4,16(sp)
    80202692:	e456                	sd	s5,8(sp)
    80202694:	0080                	addi	s0,sp,64
    80202696:	84ae                	mv	s1,a1
	int i, pid;
  struct proc *parent;
  struct proc *child = myproc();
    80202698:	fffff097          	auipc	ra,0xfffff
    8020269c:	3a4080e7          	jalr	932(ra) # 80201a3c <myproc>
    802026a0:	8aaa                	mv	s5,a0

  // Allocate process.
  if((parent = allocproc()) == NULL){
    802026a2:	fffff097          	auipc	ra,0xfffff
    802026a6:	5d6080e7          	jalr	1494(ra) # 80201c78 <allocproc>
    802026aa:	cd3d                	beqz	a0,80202728 <clone+0xa4>
    802026ac:	89aa                	mv	s3,a0
    printf("?\n");
    return -1;
  }
  
  // Copy user memory from parent to child.
  if(uvmcopy(child->pagetable, parent->pagetable, parent->kpagetable, child->sz) < 0){
    802026ae:	048ab683          	ld	a3,72(s5)
    802026b2:	6d30                	ld	a2,88(a0)
    802026b4:	692c                	ld	a1,80(a0)
    802026b6:	050ab503          	ld	a0,80(s5)
    802026ba:	fffff097          	auipc	ra,0xfffff
    802026be:	aec080e7          	jalr	-1300(ra) # 802011a6 <uvmcopy>
    802026c2:	06054d63          	bltz	a0,8020273c <clone+0xb8>
    printf("?\n");
    freeproc(parent);
    release(&parent->lock);
    return -1;
  }
  parent->sz = child->sz;
    802026c6:	048ab783          	ld	a5,72(s5)
    802026ca:	04f9b423          	sd	a5,72(s3)

  parent->parent = child;
    802026ce:	0359b023          	sd	s5,32(s3)

  // copy tracing mask from parent.
  parent->tmask = child->tmask;
    802026d2:	170aa783          	lw	a5,368(s5)
    802026d6:	16f9a823          	sw	a5,368(s3)

  // copy saved user registers.
  *(parent->trapframe) = *(child->trapframe);
    802026da:	060ab683          	ld	a3,96(s5)
    802026de:	87b6                	mv	a5,a3
    802026e0:	0609b703          	ld	a4,96(s3)
    802026e4:	12068693          	addi	a3,a3,288
    802026e8:	0007b883          	ld	a7,0(a5)
    802026ec:	0087b803          	ld	a6,8(a5)
    802026f0:	6b88                	ld	a0,16(a5)
    802026f2:	6f90                	ld	a2,24(a5)
    802026f4:	01173023          	sd	a7,0(a4)
    802026f8:	01073423          	sd	a6,8(a4)
    802026fc:	eb08                	sd	a0,16(a4)
    802026fe:	ef10                	sd	a2,24(a4)
    80202700:	02078793          	addi	a5,a5,32
    80202704:	02070713          	addi	a4,a4,32
    80202708:	fed790e3          	bne	a5,a3,802026e8 <clone+0x64>

  // Cause fork to return 0 in the child.
  parent->trapframe->a0 = 0;
    8020270c:	0609b783          	ld	a5,96(s3)
    80202710:	0607b823          	sd	zero,112(a5)
  parent->trapframe->sp = stack;
    80202714:	0609b783          	ld	a5,96(s3)
    80202718:	fb84                	sd	s1,48(a5)

  // increment reference counts on open file descriptors.
  for(i = 0; i < NOFILE; i++)
    8020271a:	0d8a8493          	addi	s1,s5,216
    8020271e:	0d898913          	addi	s2,s3,216
    80202722:	158a8a13          	addi	s4,s5,344
    80202726:	a889                	j	80202778 <clone+0xf4>
    printf("?\n");
    80202728:	00007517          	auipc	a0,0x7
    8020272c:	fb850513          	addi	a0,a0,-72 # 802096e0 <digits+0x360>
    80202730:	ffffe097          	auipc	ra,0xffffe
    80202734:	a5e080e7          	jalr	-1442(ra) # 8020018e <printf>
    return -1;
    80202738:	54fd                	li	s1,-1
    8020273a:	a8ad                	j	802027b4 <clone+0x130>
    printf("?\n");
    8020273c:	00007517          	auipc	a0,0x7
    80202740:	fa450513          	addi	a0,a0,-92 # 802096e0 <digits+0x360>
    80202744:	ffffe097          	auipc	ra,0xffffe
    80202748:	a4a080e7          	jalr	-1462(ra) # 8020018e <printf>
    freeproc(parent);
    8020274c:	854e                	mv	a0,s3
    8020274e:	fffff097          	auipc	ra,0xfffff
    80202752:	4c0080e7          	jalr	1216(ra) # 80201c0e <freeproc>
    release(&parent->lock);
    80202756:	854e                	mv	a0,s3
    80202758:	ffffe097          	auipc	ra,0xffffe
    8020275c:	fc2080e7          	jalr	-62(ra) # 8020071a <release>
    return -1;
    80202760:	54fd                	li	s1,-1
    80202762:	a889                	j	802027b4 <clone+0x130>
    if(child->ofile[i])
      parent->ofile[i] = filedup(child->ofile[i]);
    80202764:	00001097          	auipc	ra,0x1
    80202768:	57e080e7          	jalr	1406(ra) # 80203ce2 <filedup>
    8020276c:	00a93023          	sd	a0,0(s2)
  for(i = 0; i < NOFILE; i++)
    80202770:	04a1                	addi	s1,s1,8
    80202772:	0921                	addi	s2,s2,8
    80202774:	01448563          	beq	s1,s4,8020277e <clone+0xfa>
    if(child->ofile[i])
    80202778:	6088                	ld	a0,0(s1)
    8020277a:	f56d                	bnez	a0,80202764 <clone+0xe0>
    8020277c:	bfd5                	j	80202770 <clone+0xec>
  parent->cwd = edup(child->cwd);
    8020277e:	158ab503          	ld	a0,344(s5)
    80202782:	00004097          	auipc	ra,0x4
    80202786:	08c080e7          	jalr	140(ra) # 8020680e <edup>
    8020278a:	14a9bc23          	sd	a0,344(s3)

  safestrcpy(parent->name, child->name, sizeof(child->name));
    8020278e:	4641                	li	a2,16
    80202790:	160a8593          	addi	a1,s5,352
    80202794:	16098513          	addi	a0,s3,352
    80202798:	ffffe097          	auipc	ra,0xffffe
    8020279c:	11c080e7          	jalr	284(ra) # 802008b4 <safestrcpy>

  pid = parent->pid;
    802027a0:	0389a483          	lw	s1,56(s3)

  parent->state = RUNNABLE;
    802027a4:	4789                	li	a5,2
    802027a6:	00f9ac23          	sw	a5,24(s3)

  release(&parent->lock);
    802027aa:	854e                	mv	a0,s3
    802027ac:	ffffe097          	auipc	ra,0xffffe
    802027b0:	f6e080e7          	jalr	-146(ra) # 8020071a <release>

  return pid;
}
    802027b4:	8526                	mv	a0,s1
    802027b6:	70e2                	ld	ra,56(sp)
    802027b8:	7442                	ld	s0,48(sp)
    802027ba:	74a2                	ld	s1,40(sp)
    802027bc:	7902                	ld	s2,32(sp)
    802027be:	69e2                	ld	s3,24(sp)
    802027c0:	6a42                	ld	s4,16(sp)
    802027c2:	6aa2                	ld	s5,8(sp)
    802027c4:	6121                	addi	sp,sp,64
    802027c6:	8082                	ret

00000000802027c8 <waitpid>:

int
waitpid(int pid_to_wait, uint64 status, int options)
{
    802027c8:	7159                	addi	sp,sp,-112
    802027ca:	f486                	sd	ra,104(sp)
    802027cc:	f0a2                	sd	s0,96(sp)
    802027ce:	eca6                	sd	s1,88(sp)
    802027d0:	e8ca                	sd	s2,80(sp)
    802027d2:	e4ce                	sd	s3,72(sp)
    802027d4:	e0d2                	sd	s4,64(sp)
    802027d6:	fc56                	sd	s5,56(sp)
    802027d8:	f85a                	sd	s6,48(sp)
    802027da:	f45e                	sd	s7,40(sp)
    802027dc:	f062                	sd	s8,32(sp)
    802027de:	ec66                	sd	s9,24(sp)
    802027e0:	e86a                	sd	s10,16(sp)
    802027e2:	e46e                	sd	s11,8(sp)
    802027e4:	1880                	addi	s0,sp,112
    802027e6:	8a2a                	mv	s4,a0
    802027e8:	8cae                	mv	s9,a1
    802027ea:	8d32                	mv	s10,a2
  struct proc *np;
  int havekids, pid;
  struct proc *p = myproc();
    802027ec:	fffff097          	auipc	ra,0xfffff
    802027f0:	250080e7          	jalr	592(ra) # 80201a3c <myproc>
    802027f4:	892a                	mv	s2,a0
  
  // printf("[waitpid] pid_to_wait: %d\n", pid_to_wait);
  acquire(&p->lock);
    802027f6:	ffffe097          	auipc	ra,0xffffe
    802027fa:	ed0080e7          	jalr	-304(ra) # 802006c6 <acquire>

  while(1){
    havekids = 0;
    802027fe:	4d81                	li	s11,0
    for (np = proc; np < &proc[NPROC]; np++) {
      if(np->parent == p){
        if(pid_to_wait == -1) {}
    80202800:	5afd                	li	s5,-1
        }
        else
          return -1;
        acquire(&np->lock);
        havekids = 1;
        if(np->state == ZOMBIE) {
    80202802:	4b91                	li	s7,4
        havekids = 1;
    80202804:	4c05                	li	s8,1
    for (np = proc; np < &proc[NPROC]; np++) {
    80202806:	00016997          	auipc	s3,0x16
    8020280a:	2ea98993          	addi	s3,s3,746 # 80218af0 <bcache>
    havekids = 0;
    8020280e:	8b6e                	mv	s6,s11
    for (np = proc; np < &proc[NPROC]; np++) {
    80202810:	00012497          	auipc	s1,0x12
    80202814:	97048493          	addi	s1,s1,-1680 # 80214180 <proc>
    80202818:	a01d                	j	8020283e <waitpid+0x76>
        acquire(&np->lock);
    8020281a:	8526                	mv	a0,s1
    8020281c:	ffffe097          	auipc	ra,0xffffe
    80202820:	eaa080e7          	jalr	-342(ra) # 802006c6 <acquire>
        if(np->state == ZOMBIE) {
    80202824:	4c9c                	lw	a5,24(s1)
    80202826:	03778763          	beq	a5,s7,80202854 <waitpid+0x8c>
          freeproc(np);
          release(&np->lock);
          release(&p->lock);
          return pid;
        }
        release(&np->lock);
    8020282a:	8526                	mv	a0,s1
    8020282c:	ffffe097          	auipc	ra,0xffffe
    80202830:	eee080e7          	jalr	-274(ra) # 8020071a <release>
        havekids = 1;
    80202834:	8b62                	mv	s6,s8
    for (np = proc; np < &proc[NPROC]; np++) {
    80202836:	17848493          	addi	s1,s1,376
    8020283a:	07348863          	beq	s1,s3,802028aa <waitpid+0xe2>
      if(np->parent == p){
    8020283e:	709c                	ld	a5,32(s1)
    80202840:	ff279be3          	bne	a5,s2,80202836 <waitpid+0x6e>
        if(pid_to_wait == -1) {}
    80202844:	fd5a0be3          	beq	s4,s5,8020281a <waitpid+0x52>
        else if(pid_to_wait > 0) {
    80202848:	0b405c63          	blez	s4,80202900 <waitpid+0x138>
          if(np->pid != pid_to_wait)
    8020284c:	5c9c                	lw	a5,56(s1)
    8020284e:	fd4786e3          	beq	a5,s4,8020281a <waitpid+0x52>
    80202852:	b7d5                	j	80202836 <waitpid+0x6e>
          pid = np->pid;
    80202854:	0384ab03          	lw	s6,56(s1)
          if (status != 0 && copyout2(status + 1, (char *)&np->xstate, sizeof(np->xstate)) < 0){
    80202858:	000c8d63          	beqz	s9,80202872 <waitpid+0xaa>
    8020285c:	4611                	li	a2,4
    8020285e:	03448593          	addi	a1,s1,52
    80202862:	001c8513          	addi	a0,s9,1 # 1001 <_entry-0x801fefff>
    80202866:	fffff097          	auipc	ra,0xfffff
    8020286a:	b0c080e7          	jalr	-1268(ra) # 80201372 <copyout2>
    8020286e:	02054263          	bltz	a0,80202892 <waitpid+0xca>
          freeproc(np);
    80202872:	8526                	mv	a0,s1
    80202874:	fffff097          	auipc	ra,0xfffff
    80202878:	39a080e7          	jalr	922(ra) # 80201c0e <freeproc>
          release(&np->lock);
    8020287c:	8526                	mv	a0,s1
    8020287e:	ffffe097          	auipc	ra,0xffffe
    80202882:	e9c080e7          	jalr	-356(ra) # 8020071a <release>
          release(&p->lock);
    80202886:	854a                	mv	a0,s2
    80202888:	ffffe097          	auipc	ra,0xffffe
    8020288c:	e92080e7          	jalr	-366(ra) # 8020071a <release>
          return pid;
    80202890:	a089                	j	802028d2 <waitpid+0x10a>
            release(&np->lock);
    80202892:	8526                	mv	a0,s1
    80202894:	ffffe097          	auipc	ra,0xffffe
    80202898:	e86080e7          	jalr	-378(ra) # 8020071a <release>
            release(&p->lock);
    8020289c:	854a                	mv	a0,s2
    8020289e:	ffffe097          	auipc	ra,0xffffe
    802028a2:	e7c080e7          	jalr	-388(ra) # 8020071a <release>
            return -1;
    802028a6:	5b7d                	li	s6,-1
    802028a8:	a02d                	j	802028d2 <waitpid+0x10a>
      }
    }

    if (!havekids && options == WNOHANG){
    802028aa:	000b1b63          	bnez	s6,802028c0 <waitpid+0xf8>
    802028ae:	4785                	li	a5,1
    802028b0:	00fd1b63          	bne	s10,a5,802028c6 <waitpid+0xfe>
      release(&p->lock);
    802028b4:	854a                	mv	a0,s2
    802028b6:	ffffe097          	auipc	ra,0xffffe
    802028ba:	e64080e7          	jalr	-412(ra) # 8020071a <release>
      return 0;
    802028be:	a811                	j	802028d2 <waitpid+0x10a>
    }

    if (!havekids || p->killed){
    802028c0:	03092783          	lw	a5,48(s2)
    802028c4:	c79d                	beqz	a5,802028f2 <waitpid+0x12a>
      release(&p->lock);
    802028c6:	854a                	mv	a0,s2
    802028c8:	ffffe097          	auipc	ra,0xffffe
    802028cc:	e52080e7          	jalr	-430(ra) # 8020071a <release>
      return -1;
    802028d0:	5b7d                	li	s6,-1
    }

    // Wait for a child to exit.
    sleep(p, &p->lock); // DOC: wait-sleep
  }
}
    802028d2:	855a                	mv	a0,s6
    802028d4:	70a6                	ld	ra,104(sp)
    802028d6:	7406                	ld	s0,96(sp)
    802028d8:	64e6                	ld	s1,88(sp)
    802028da:	6946                	ld	s2,80(sp)
    802028dc:	69a6                	ld	s3,72(sp)
    802028de:	6a06                	ld	s4,64(sp)
    802028e0:	7ae2                	ld	s5,56(sp)
    802028e2:	7b42                	ld	s6,48(sp)
    802028e4:	7ba2                	ld	s7,40(sp)
    802028e6:	7c02                	ld	s8,32(sp)
    802028e8:	6ce2                	ld	s9,24(sp)
    802028ea:	6d42                	ld	s10,16(sp)
    802028ec:	6da2                	ld	s11,8(sp)
    802028ee:	6165                	addi	sp,sp,112
    802028f0:	8082                	ret
    sleep(p, &p->lock); // DOC: wait-sleep
    802028f2:	85ca                	mv	a1,s2
    802028f4:	854a                	mv	a0,s2
    802028f6:	00000097          	auipc	ra,0x0
    802028fa:	9ea080e7          	jalr	-1558(ra) # 802022e0 <sleep>
    havekids = 0;
    802028fe:	bf01                	j	8020280e <waitpid+0x46>
          return -1;
    80202900:	5b7d                	li	s6,-1
    80202902:	bfc1                	j	802028d2 <waitpid+0x10a>

0000000080202904 <swtch>:
    80202904:	00153023          	sd	ra,0(a0)
    80202908:	00253423          	sd	sp,8(a0)
    8020290c:	e900                	sd	s0,16(a0)
    8020290e:	ed04                	sd	s1,24(a0)
    80202910:	03253023          	sd	s2,32(a0)
    80202914:	03353423          	sd	s3,40(a0)
    80202918:	03453823          	sd	s4,48(a0)
    8020291c:	03553c23          	sd	s5,56(a0)
    80202920:	05653023          	sd	s6,64(a0)
    80202924:	05753423          	sd	s7,72(a0)
    80202928:	05853823          	sd	s8,80(a0)
    8020292c:	05953c23          	sd	s9,88(a0)
    80202930:	07a53023          	sd	s10,96(a0)
    80202934:	07b53423          	sd	s11,104(a0)
    80202938:	0005b083          	ld	ra,0(a1)
    8020293c:	0085b103          	ld	sp,8(a1)
    80202940:	6980                	ld	s0,16(a1)
    80202942:	6d84                	ld	s1,24(a1)
    80202944:	0205b903          	ld	s2,32(a1)
    80202948:	0285b983          	ld	s3,40(a1)
    8020294c:	0305ba03          	ld	s4,48(a1)
    80202950:	0385ba83          	ld	s5,56(a1)
    80202954:	0405bb03          	ld	s6,64(a1)
    80202958:	0485bb83          	ld	s7,72(a1)
    8020295c:	0505bc03          	ld	s8,80(a1)
    80202960:	0585bc83          	ld	s9,88(a1)
    80202964:	0605bd03          	ld	s10,96(a1)
    80202968:	0685bd83          	ld	s11,104(a1)
    8020296c:	8082                	ret

000000008020296e <trapinithart>:
// }

// set up to take exceptions and traps while in the kernel.
void
trapinithart(void)
{
    8020296e:	1141                	addi	sp,sp,-16
    80202970:	e406                	sd	ra,8(sp)
    80202972:	e022                	sd	s0,0(sp)
    80202974:	0800                	addi	s0,sp,16
  asm volatile("csrw stvec, %0" : : "r" (x));
    80202976:	00009797          	auipc	a5,0x9
    8020297a:	35a7b783          	ld	a5,858(a5) # 8020bcd0 <_GLOBAL_OFFSET_TABLE_+0x18>
    8020297e:	10579073          	csrw	stvec,a5
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202982:	100027f3          	csrr	a5,sstatus
  w_stvec((uint64)kernelvec);
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80202986:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    8020298a:	10079073          	csrw	sstatus,a5
  asm volatile("csrr %0, sie" : "=r" (x) );
    8020298e:	104027f3          	csrr	a5,sie
  // enable supervisor-mode timer interrupts.
  w_sie(r_sie() | SIE_SEIE | SIE_SSIE | SIE_STIE);
    80202992:	2227e793          	ori	a5,a5,546
  asm volatile("csrw sie, %0" : : "r" (x));
    80202996:	10479073          	csrw	sie,a5
  set_next_timeout();
    8020299a:	00003097          	auipc	ra,0x3
    8020299e:	e1c080e7          	jalr	-484(ra) # 802057b6 <set_next_timeout>
  #ifdef DEBUG
  printf("trapinithart\n");
  #endif
}
    802029a2:	60a2                	ld	ra,8(sp)
    802029a4:	6402                	ld	s0,0(sp)
    802029a6:	0141                	addi	sp,sp,16
    802029a8:	8082                	ret

00000000802029aa <usertrapret>:
//
// return to user space
//
void
usertrapret(void)
{
    802029aa:	1141                	addi	sp,sp,-16
    802029ac:	e406                	sd	ra,8(sp)
    802029ae:	e022                	sd	s0,0(sp)
    802029b0:	0800                	addi	s0,sp,16
  struct proc *p = myproc();
    802029b2:	fffff097          	auipc	ra,0xfffff
    802029b6:	08a080e7          	jalr	138(ra) # 80201a3c <myproc>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802029ba:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    802029be:	9bf5                	andi	a5,a5,-3
  asm volatile("csrw sstatus, %0" : : "r" (x));
    802029c0:	10079073          	csrw	sstatus,a5
  // kerneltrap() to usertrap(), so turn off interrupts until
  // we're back in user space, where usertrap() is correct.
  intr_off();

  // send syscalls, interrupts, and exceptions to trampoline.S
  w_stvec(TRAMPOLINE + (uservec - trampoline));
    802029c4:	00009697          	auipc	a3,0x9
    802029c8:	2fc6b683          	ld	a3,764(a3) # 8020bcc0 <_GLOBAL_OFFSET_TABLE_+0x8>
    802029cc:	00009717          	auipc	a4,0x9
    802029d0:	32473703          	ld	a4,804(a4) # 8020bcf0 <_GLOBAL_OFFSET_TABLE_+0x38>
    802029d4:	8f15                	sub	a4,a4,a3
    802029d6:	040007b7          	lui	a5,0x4000
    802029da:	17fd                	addi	a5,a5,-1 # 3ffffff <_entry-0x7c200001>
    802029dc:	07b2                	slli	a5,a5,0xc
    802029de:	973e                	add	a4,a4,a5
  asm volatile("csrw stvec, %0" : : "r" (x));
    802029e0:	10571073          	csrw	stvec,a4

  // set up trapframe values that uservec will need when
  // the process next re-enters the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
    802029e4:	7138                	ld	a4,96(a0)
  asm volatile("csrr %0, satp" : "=r" (x) );
    802029e6:	18002673          	csrr	a2,satp
    802029ea:	e310                	sd	a2,0(a4)
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
    802029ec:	7130                	ld	a2,96(a0)
    802029ee:	6138                	ld	a4,64(a0)
    802029f0:	6585                	lui	a1,0x1
    802029f2:	972e                	add	a4,a4,a1
    802029f4:	e618                	sd	a4,8(a2)
  p->trapframe->kernel_trap = (uint64)usertrap;
    802029f6:	7138                	ld	a4,96(a0)
    802029f8:	00000617          	auipc	a2,0x0
    802029fc:	0f460613          	addi	a2,a2,244 # 80202aec <usertrap>
    80202a00:	eb10                	sd	a2,16(a4)
  p->trapframe->kernel_hartid = r_tp();         // hartid for cpuid()
    80202a02:	7138                	ld	a4,96(a0)
  asm volatile("mv %0, tp" : "=r" (x) );
    80202a04:	8612                	mv	a2,tp
    80202a06:	f310                	sd	a2,32(a4)
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202a08:	10002773          	csrr	a4,sstatus
  // set up the registers that trampoline.S's sret will use
  // to get to user space.
  
  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
    80202a0c:	eff77713          	andi	a4,a4,-257
  x |= SSTATUS_SPIE; // enable interrupts in user mode
    80202a10:	02076713          	ori	a4,a4,32
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202a14:	10071073          	csrw	sstatus,a4
  w_sstatus(x);

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);
    80202a18:	7138                	ld	a4,96(a0)
  asm volatile("csrw sepc, %0" : : "r" (x));
    80202a1a:	6f18                	ld	a4,24(a4)
    80202a1c:	14171073          	csrw	sepc,a4

  // tell trampoline.S the user page table to switch to.
  // printf("[usertrapret]p->pagetable: %p\n", p->pagetable);
  uint64 satp = MAKE_SATP(p->pagetable);
    80202a20:	692c                	ld	a1,80(a0)
    80202a22:	81b1                	srli	a1,a1,0xc

  // jump to trampoline.S at the top of memory, which 
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 fn = TRAMPOLINE + (userret - trampoline);
    80202a24:	00009717          	auipc	a4,0x9
    80202a28:	2a473703          	ld	a4,676(a4) # 8020bcc8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80202a2c:	8f15                	sub	a4,a4,a3
    80202a2e:	97ba                	add	a5,a5,a4
  ((void (*)(uint64,uint64))fn)(TRAPFRAME, satp);
    80202a30:	577d                	li	a4,-1
    80202a32:	177e                	slli	a4,a4,0x3f
    80202a34:	8dd9                	or	a1,a1,a4
    80202a36:	02000537          	lui	a0,0x2000
    80202a3a:	157d                	addi	a0,a0,-1 # 1ffffff <_entry-0x7e200001>
    80202a3c:	0536                	slli	a0,a0,0xd
    80202a3e:	9782                	jalr	a5
}
    80202a40:	60a2                	ld	ra,8(sp)
    80202a42:	6402                	ld	s0,0(sp)
    80202a44:	0141                	addi	sp,sp,16
    80202a46:	8082                	ret

0000000080202a48 <devintr>:
// Check if it's an external/software interrupt, 
// and handle it. 
// returns  2 if timer interrupt, 
//          1 if other device, 
//          0 if not recognized. 
int devintr(void) {
    80202a48:	1101                	addi	sp,sp,-32
    80202a4a:	ec06                	sd	ra,24(sp)
    80202a4c:	e822                	sd	s0,16(sp)
    80202a4e:	e426                	sd	s1,8(sp)
    80202a50:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202a52:	14202773          	csrr	a4,scause
	uint64 scause = r_scause();

	#ifdef QEMU 
	// handle external interrupt 
	if ((0x8000000000000000L & scause) && 9 == (scause & 0xff)) 
    80202a56:	00074d63          	bltz	a4,80202a70 <devintr+0x28>
		sbi_set_mie();
		#endif 

		return 1;
	}
	else if (0x8000000000000005L == scause) {
    80202a5a:	57fd                	li	a5,-1
    80202a5c:	17fe                	slli	a5,a5,0x3f
    80202a5e:	0795                	addi	a5,a5,5
		timer_tick();
		return 2;
	}
	else { return 0;}
    80202a60:	4501                	li	a0,0
	else if (0x8000000000000005L == scause) {
    80202a62:	06f70f63          	beq	a4,a5,80202ae0 <devintr+0x98>
}
    80202a66:	60e2                	ld	ra,24(sp)
    80202a68:	6442                	ld	s0,16(sp)
    80202a6a:	64a2                	ld	s1,8(sp)
    80202a6c:	6105                	addi	sp,sp,32
    80202a6e:	8082                	ret
	if ((0x8000000000000000L & scause) && 9 == (scause & 0xff)) 
    80202a70:	0ff77793          	zext.b	a5,a4
    80202a74:	46a5                	li	a3,9
    80202a76:	fed792e3          	bne	a5,a3,80202a5a <devintr+0x12>
		int irq = plic_claim();
    80202a7a:	00005097          	auipc	ra,0x5
    80202a7e:	86c080e7          	jalr	-1940(ra) # 802072e6 <plic_claim>
    80202a82:	84aa                	mv	s1,a0
		if (UART_IRQ == irq) {
    80202a84:	47a9                	li	a5,10
    80202a86:	02f50163          	beq	a0,a5,80202aa8 <devintr+0x60>
		else if (DISK_IRQ == irq) {
    80202a8a:	4785                	li	a5,1
    80202a8c:	04f50563          	beq	a0,a5,80202ad6 <devintr+0x8e>
		return 1;
    80202a90:	4505                	li	a0,1
		else if (irq) {
    80202a92:	d8f1                	beqz	s1,80202a66 <devintr+0x1e>
			printf("unexpected interrupt irq = %d\n", irq);
    80202a94:	85a6                	mv	a1,s1
    80202a96:	00007517          	auipc	a0,0x7
    80202a9a:	c7a50513          	addi	a0,a0,-902 # 80209710 <digits+0x390>
    80202a9e:	ffffd097          	auipc	ra,0xffffd
    80202aa2:	6f0080e7          	jalr	1776(ra) # 8020018e <printf>
    80202aa6:	a821                	j	80202abe <devintr+0x76>
	return SBI_CALL_0(SBI_CONSOLE_GETCHAR);
    80202aa8:	4501                	li	a0,0
    80202aaa:	4581                	li	a1,0
    80202aac:	4601                	li	a2,0
    80202aae:	4681                	li	a3,0
    80202ab0:	4889                	li	a7,2
    80202ab2:	00000073          	ecall
    80202ab6:	2501                	sext.w	a0,a0
			if (-1 != c) {
    80202ab8:	57fd                	li	a5,-1
    80202aba:	00f51963          	bne	a0,a5,80202acc <devintr+0x84>
		if (irq) { plic_complete(irq);}
    80202abe:	8526                	mv	a0,s1
    80202ac0:	00005097          	auipc	ra,0x5
    80202ac4:	850080e7          	jalr	-1968(ra) # 80207310 <plic_complete>
		return 1;
    80202ac8:	4505                	li	a0,1
    80202aca:	bf71                	j	80202a66 <devintr+0x1e>
				consoleintr(c);
    80202acc:	00005097          	auipc	ra,0x5
    80202ad0:	a58080e7          	jalr	-1448(ra) # 80207524 <consoleintr>
    80202ad4:	b7ed                	j	80202abe <devintr+0x76>
			disk_intr();
    80202ad6:	00003097          	auipc	ra,0x3
    80202ada:	da0080e7          	jalr	-608(ra) # 80205876 <disk_intr>
    80202ade:	b7c5                	j	80202abe <devintr+0x76>
		timer_tick();
    80202ae0:	00003097          	auipc	ra,0x3
    80202ae4:	cfc080e7          	jalr	-772(ra) # 802057dc <timer_tick>
		return 2;
    80202ae8:	4509                	li	a0,2
    80202aea:	bfb5                	j	80202a66 <devintr+0x1e>

0000000080202aec <usertrap>:
{
    80202aec:	1101                	addi	sp,sp,-32
    80202aee:	ec06                	sd	ra,24(sp)
    80202af0:	e822                	sd	s0,16(sp)
    80202af2:	e426                	sd	s1,8(sp)
    80202af4:	e04a                	sd	s2,0(sp)
    80202af6:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202af8:	100027f3          	csrr	a5,sstatus
  if((r_sstatus() & SSTATUS_SPP) != 0)
    80202afc:	1007f793          	andi	a5,a5,256
    80202b00:	e3ad                	bnez	a5,80202b62 <usertrap+0x76>
  asm volatile("csrw stvec, %0" : : "r" (x));
    80202b02:	00009797          	auipc	a5,0x9
    80202b06:	1ce7b783          	ld	a5,462(a5) # 8020bcd0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80202b0a:	10579073          	csrw	stvec,a5
  struct proc *p = myproc();
    80202b0e:	fffff097          	auipc	ra,0xfffff
    80202b12:	f2e080e7          	jalr	-210(ra) # 80201a3c <myproc>
    80202b16:	84aa                	mv	s1,a0
  p->trapframe->epc = r_sepc();
    80202b18:	713c                	ld	a5,96(a0)
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202b1a:	14102773          	csrr	a4,sepc
    80202b1e:	ef98                	sd	a4,24(a5)
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202b20:	14202773          	csrr	a4,scause
  if(r_scause() == 8){
    80202b24:	47a1                	li	a5,8
    80202b26:	04f71c63          	bne	a4,a5,80202b7e <usertrap+0x92>
    if(p->killed)
    80202b2a:	591c                	lw	a5,48(a0)
    80202b2c:	e3b9                	bnez	a5,80202b72 <usertrap+0x86>
    p->trapframe->epc += 4;
    80202b2e:	70b8                	ld	a4,96(s1)
    80202b30:	6f1c                	ld	a5,24(a4)
    80202b32:	0791                	addi	a5,a5,4
    80202b34:	ef1c                	sd	a5,24(a4)
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202b36:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80202b3a:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202b3e:	10079073          	csrw	sstatus,a5
    syscall();
    80202b42:	00000097          	auipc	ra,0x0
    80202b46:	5d4080e7          	jalr	1492(ra) # 80203116 <syscall>
  if(p->killed)
    80202b4a:	589c                	lw	a5,48(s1)
    80202b4c:	ebd1                	bnez	a5,80202be0 <usertrap+0xf4>
  usertrapret();
    80202b4e:	00000097          	auipc	ra,0x0
    80202b52:	e5c080e7          	jalr	-420(ra) # 802029aa <usertrapret>
}
    80202b56:	60e2                	ld	ra,24(sp)
    80202b58:	6442                	ld	s0,16(sp)
    80202b5a:	64a2                	ld	s1,8(sp)
    80202b5c:	6902                	ld	s2,0(sp)
    80202b5e:	6105                	addi	sp,sp,32
    80202b60:	8082                	ret
    panic("usertrap: not from user mode");
    80202b62:	00007517          	auipc	a0,0x7
    80202b66:	bce50513          	addi	a0,a0,-1074 # 80209730 <digits+0x3b0>
    80202b6a:	ffffd097          	auipc	ra,0xffffd
    80202b6e:	5da080e7          	jalr	1498(ra) # 80200144 <panic>
      exit(-1);
    80202b72:	557d                	li	a0,-1
    80202b74:	fffff097          	auipc	ra,0xfffff
    80202b78:	60c080e7          	jalr	1548(ra) # 80202180 <exit>
    80202b7c:	bf4d                	j	80202b2e <usertrap+0x42>
  else if((which_dev = devintr()) != 0){
    80202b7e:	00000097          	auipc	ra,0x0
    80202b82:	eca080e7          	jalr	-310(ra) # 80202a48 <devintr>
    80202b86:	892a                	mv	s2,a0
    80202b88:	c501                	beqz	a0,80202b90 <usertrap+0xa4>
  if(p->killed)
    80202b8a:	589c                	lw	a5,48(s1)
    80202b8c:	c3b1                	beqz	a5,80202bd0 <usertrap+0xe4>
    80202b8e:	a825                	j	80202bc6 <usertrap+0xda>
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202b90:	142025f3          	csrr	a1,scause
    printf("\nusertrap(): unexpected scause %p pid=%d %s\n", r_scause(), p->pid, p->name);
    80202b94:	16048693          	addi	a3,s1,352
    80202b98:	5c90                	lw	a2,56(s1)
    80202b9a:	00007517          	auipc	a0,0x7
    80202b9e:	bb650513          	addi	a0,a0,-1098 # 80209750 <digits+0x3d0>
    80202ba2:	ffffd097          	auipc	ra,0xffffd
    80202ba6:	5ec080e7          	jalr	1516(ra) # 8020018e <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202baa:	141025f3          	csrr	a1,sepc
  asm volatile("csrr %0, stval" : "=r" (x) );
    80202bae:	14302673          	csrr	a2,stval
    printf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    80202bb2:	00007517          	auipc	a0,0x7
    80202bb6:	bce50513          	addi	a0,a0,-1074 # 80209780 <digits+0x400>
    80202bba:	ffffd097          	auipc	ra,0xffffd
    80202bbe:	5d4080e7          	jalr	1492(ra) # 8020018e <printf>
    p->killed = 1;
    80202bc2:	4785                	li	a5,1
    80202bc4:	d89c                	sw	a5,48(s1)
    exit(-1);
    80202bc6:	557d                	li	a0,-1
    80202bc8:	fffff097          	auipc	ra,0xfffff
    80202bcc:	5b8080e7          	jalr	1464(ra) # 80202180 <exit>
  if(which_dev == 2)
    80202bd0:	4789                	li	a5,2
    80202bd2:	f6f91ee3          	bne	s2,a5,80202b4e <usertrap+0x62>
    yield();
    80202bd6:	fffff097          	auipc	ra,0xfffff
    80202bda:	6ce080e7          	jalr	1742(ra) # 802022a4 <yield>
    80202bde:	bf85                	j	80202b4e <usertrap+0x62>
  int which_dev = 0;
    80202be0:	4901                	li	s2,0
    80202be2:	b7d5                	j	80202bc6 <usertrap+0xda>

0000000080202be4 <kerneltrap>:
kerneltrap() {
    80202be4:	7179                	addi	sp,sp,-48
    80202be6:	f406                	sd	ra,40(sp)
    80202be8:	f022                	sd	s0,32(sp)
    80202bea:	ec26                	sd	s1,24(sp)
    80202bec:	e84a                	sd	s2,16(sp)
    80202bee:	e44e                	sd	s3,8(sp)
    80202bf0:	1800                	addi	s0,sp,48
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202bf2:	14102973          	csrr	s2,sepc
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202bf6:	100024f3          	csrr	s1,sstatus
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202bfa:	142029f3          	csrr	s3,scause
  if((sstatus & SSTATUS_SPP) == 0)
    80202bfe:	1004f793          	andi	a5,s1,256
    80202c02:	cb85                	beqz	a5,80202c32 <kerneltrap+0x4e>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202c04:	100027f3          	csrr	a5,sstatus
  return (x & SSTATUS_SIE) != 0;
    80202c08:	8b89                	andi	a5,a5,2
  if(intr_get() != 0)
    80202c0a:	ef85                	bnez	a5,80202c42 <kerneltrap+0x5e>
  if((which_dev = devintr()) == 0){
    80202c0c:	00000097          	auipc	ra,0x0
    80202c10:	e3c080e7          	jalr	-452(ra) # 80202a48 <devintr>
    80202c14:	cd1d                	beqz	a0,80202c52 <kerneltrap+0x6e>
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING) {
    80202c16:	4789                	li	a5,2
    80202c18:	08f50b63          	beq	a0,a5,80202cae <kerneltrap+0xca>
  asm volatile("csrw sepc, %0" : : "r" (x));
    80202c1c:	14191073          	csrw	sepc,s2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202c20:	10049073          	csrw	sstatus,s1
}
    80202c24:	70a2                	ld	ra,40(sp)
    80202c26:	7402                	ld	s0,32(sp)
    80202c28:	64e2                	ld	s1,24(sp)
    80202c2a:	6942                	ld	s2,16(sp)
    80202c2c:	69a2                	ld	s3,8(sp)
    80202c2e:	6145                	addi	sp,sp,48
    80202c30:	8082                	ret
    panic("kerneltrap: not from supervisor mode");
    80202c32:	00007517          	auipc	a0,0x7
    80202c36:	b6e50513          	addi	a0,a0,-1170 # 802097a0 <digits+0x420>
    80202c3a:	ffffd097          	auipc	ra,0xffffd
    80202c3e:	50a080e7          	jalr	1290(ra) # 80200144 <panic>
    panic("kerneltrap: interrupts enabled");
    80202c42:	00007517          	auipc	a0,0x7
    80202c46:	b8650513          	addi	a0,a0,-1146 # 802097c8 <digits+0x448>
    80202c4a:	ffffd097          	auipc	ra,0xffffd
    80202c4e:	4fa080e7          	jalr	1274(ra) # 80200144 <panic>
    printf("\nscause %p\n", scause);
    80202c52:	85ce                	mv	a1,s3
    80202c54:	00007517          	auipc	a0,0x7
    80202c58:	b9450513          	addi	a0,a0,-1132 # 802097e8 <digits+0x468>
    80202c5c:	ffffd097          	auipc	ra,0xffffd
    80202c60:	532080e7          	jalr	1330(ra) # 8020018e <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202c64:	141025f3          	csrr	a1,sepc
  asm volatile("csrr %0, stval" : "=r" (x) );
    80202c68:	14302673          	csrr	a2,stval
  asm volatile("mv %0, tp" : "=r" (x) );
    80202c6c:	8692                	mv	a3,tp
    printf("sepc=%p stval=%p hart=%d\n", r_sepc(), r_stval(), r_tp());
    80202c6e:	00007517          	auipc	a0,0x7
    80202c72:	b8a50513          	addi	a0,a0,-1142 # 802097f8 <digits+0x478>
    80202c76:	ffffd097          	auipc	ra,0xffffd
    80202c7a:	518080e7          	jalr	1304(ra) # 8020018e <printf>
    struct proc *p = myproc();
    80202c7e:	fffff097          	auipc	ra,0xfffff
    80202c82:	dbe080e7          	jalr	-578(ra) # 80201a3c <myproc>
    if (p != 0) {
    80202c86:	cd01                	beqz	a0,80202c9e <kerneltrap+0xba>
      printf("pid: %d, name: %s\n", p->pid, p->name);
    80202c88:	16050613          	addi	a2,a0,352
    80202c8c:	5d0c                	lw	a1,56(a0)
    80202c8e:	00007517          	auipc	a0,0x7
    80202c92:	b8a50513          	addi	a0,a0,-1142 # 80209818 <digits+0x498>
    80202c96:	ffffd097          	auipc	ra,0xffffd
    80202c9a:	4f8080e7          	jalr	1272(ra) # 8020018e <printf>
    panic("kerneltrap");
    80202c9e:	00007517          	auipc	a0,0x7
    80202ca2:	b9250513          	addi	a0,a0,-1134 # 80209830 <digits+0x4b0>
    80202ca6:	ffffd097          	auipc	ra,0xffffd
    80202caa:	49e080e7          	jalr	1182(ra) # 80200144 <panic>
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING) {
    80202cae:	fffff097          	auipc	ra,0xfffff
    80202cb2:	d8e080e7          	jalr	-626(ra) # 80201a3c <myproc>
    80202cb6:	d13d                	beqz	a0,80202c1c <kerneltrap+0x38>
    80202cb8:	fffff097          	auipc	ra,0xfffff
    80202cbc:	d84080e7          	jalr	-636(ra) # 80201a3c <myproc>
    80202cc0:	4d18                	lw	a4,24(a0)
    80202cc2:	478d                	li	a5,3
    80202cc4:	f4f71ce3          	bne	a4,a5,80202c1c <kerneltrap+0x38>
    yield();
    80202cc8:	fffff097          	auipc	ra,0xfffff
    80202ccc:	5dc080e7          	jalr	1500(ra) # 802022a4 <yield>
    80202cd0:	b7b1                	j	80202c1c <kerneltrap+0x38>

0000000080202cd2 <trapframedump>:

void trapframedump(struct trapframe *tf)
{
    80202cd2:	1101                	addi	sp,sp,-32
    80202cd4:	ec06                	sd	ra,24(sp)
    80202cd6:	e822                	sd	s0,16(sp)
    80202cd8:	e426                	sd	s1,8(sp)
    80202cda:	1000                	addi	s0,sp,32
    80202cdc:	84aa                	mv	s1,a0
  printf("a0: %p\t", tf->a0);
    80202cde:	792c                	ld	a1,112(a0)
    80202ce0:	00007517          	auipc	a0,0x7
    80202ce4:	b6050513          	addi	a0,a0,-1184 # 80209840 <digits+0x4c0>
    80202ce8:	ffffd097          	auipc	ra,0xffffd
    80202cec:	4a6080e7          	jalr	1190(ra) # 8020018e <printf>
  printf("a1: %p\t", tf->a1);
    80202cf0:	7cac                	ld	a1,120(s1)
    80202cf2:	00007517          	auipc	a0,0x7
    80202cf6:	b5650513          	addi	a0,a0,-1194 # 80209848 <digits+0x4c8>
    80202cfa:	ffffd097          	auipc	ra,0xffffd
    80202cfe:	494080e7          	jalr	1172(ra) # 8020018e <printf>
  printf("a2: %p\t", tf->a2);
    80202d02:	60cc                	ld	a1,128(s1)
    80202d04:	00007517          	auipc	a0,0x7
    80202d08:	b4c50513          	addi	a0,a0,-1204 # 80209850 <digits+0x4d0>
    80202d0c:	ffffd097          	auipc	ra,0xffffd
    80202d10:	482080e7          	jalr	1154(ra) # 8020018e <printf>
  printf("a3: %p\n", tf->a3);
    80202d14:	64cc                	ld	a1,136(s1)
    80202d16:	00007517          	auipc	a0,0x7
    80202d1a:	b4250513          	addi	a0,a0,-1214 # 80209858 <digits+0x4d8>
    80202d1e:	ffffd097          	auipc	ra,0xffffd
    80202d22:	470080e7          	jalr	1136(ra) # 8020018e <printf>
  printf("a4: %p\t", tf->a4);
    80202d26:	68cc                	ld	a1,144(s1)
    80202d28:	00007517          	auipc	a0,0x7
    80202d2c:	b3850513          	addi	a0,a0,-1224 # 80209860 <digits+0x4e0>
    80202d30:	ffffd097          	auipc	ra,0xffffd
    80202d34:	45e080e7          	jalr	1118(ra) # 8020018e <printf>
  printf("a5: %p\t", tf->a5);
    80202d38:	6ccc                	ld	a1,152(s1)
    80202d3a:	00007517          	auipc	a0,0x7
    80202d3e:	b2e50513          	addi	a0,a0,-1234 # 80209868 <digits+0x4e8>
    80202d42:	ffffd097          	auipc	ra,0xffffd
    80202d46:	44c080e7          	jalr	1100(ra) # 8020018e <printf>
  printf("a6: %p\t", tf->a6);
    80202d4a:	70cc                	ld	a1,160(s1)
    80202d4c:	00007517          	auipc	a0,0x7
    80202d50:	b2450513          	addi	a0,a0,-1244 # 80209870 <digits+0x4f0>
    80202d54:	ffffd097          	auipc	ra,0xffffd
    80202d58:	43a080e7          	jalr	1082(ra) # 8020018e <printf>
  printf("a7: %p\n", tf->a7);
    80202d5c:	74cc                	ld	a1,168(s1)
    80202d5e:	00007517          	auipc	a0,0x7
    80202d62:	b1a50513          	addi	a0,a0,-1254 # 80209878 <digits+0x4f8>
    80202d66:	ffffd097          	auipc	ra,0xffffd
    80202d6a:	428080e7          	jalr	1064(ra) # 8020018e <printf>
  printf("t0: %p\t", tf->t0);
    80202d6e:	64ac                	ld	a1,72(s1)
    80202d70:	00007517          	auipc	a0,0x7
    80202d74:	b1050513          	addi	a0,a0,-1264 # 80209880 <digits+0x500>
    80202d78:	ffffd097          	auipc	ra,0xffffd
    80202d7c:	416080e7          	jalr	1046(ra) # 8020018e <printf>
  printf("t1: %p\t", tf->t1);
    80202d80:	68ac                	ld	a1,80(s1)
    80202d82:	00007517          	auipc	a0,0x7
    80202d86:	b0650513          	addi	a0,a0,-1274 # 80209888 <digits+0x508>
    80202d8a:	ffffd097          	auipc	ra,0xffffd
    80202d8e:	404080e7          	jalr	1028(ra) # 8020018e <printf>
  printf("t2: %p\t", tf->t2);
    80202d92:	6cac                	ld	a1,88(s1)
    80202d94:	00007517          	auipc	a0,0x7
    80202d98:	afc50513          	addi	a0,a0,-1284 # 80209890 <digits+0x510>
    80202d9c:	ffffd097          	auipc	ra,0xffffd
    80202da0:	3f2080e7          	jalr	1010(ra) # 8020018e <printf>
  printf("t3: %p\n", tf->t3);
    80202da4:	1004b583          	ld	a1,256(s1)
    80202da8:	00007517          	auipc	a0,0x7
    80202dac:	af050513          	addi	a0,a0,-1296 # 80209898 <digits+0x518>
    80202db0:	ffffd097          	auipc	ra,0xffffd
    80202db4:	3de080e7          	jalr	990(ra) # 8020018e <printf>
  printf("t4: %p\t", tf->t4);
    80202db8:	1084b583          	ld	a1,264(s1)
    80202dbc:	00007517          	auipc	a0,0x7
    80202dc0:	ae450513          	addi	a0,a0,-1308 # 802098a0 <digits+0x520>
    80202dc4:	ffffd097          	auipc	ra,0xffffd
    80202dc8:	3ca080e7          	jalr	970(ra) # 8020018e <printf>
  printf("t5: %p\t", tf->t5);
    80202dcc:	1104b583          	ld	a1,272(s1)
    80202dd0:	00007517          	auipc	a0,0x7
    80202dd4:	ad850513          	addi	a0,a0,-1320 # 802098a8 <digits+0x528>
    80202dd8:	ffffd097          	auipc	ra,0xffffd
    80202ddc:	3b6080e7          	jalr	950(ra) # 8020018e <printf>
  printf("t6: %p\t", tf->t6);
    80202de0:	1184b583          	ld	a1,280(s1)
    80202de4:	00007517          	auipc	a0,0x7
    80202de8:	acc50513          	addi	a0,a0,-1332 # 802098b0 <digits+0x530>
    80202dec:	ffffd097          	auipc	ra,0xffffd
    80202df0:	3a2080e7          	jalr	930(ra) # 8020018e <printf>
  printf("s0: %p\n", tf->s0);
    80202df4:	70ac                	ld	a1,96(s1)
    80202df6:	00007517          	auipc	a0,0x7
    80202dfa:	ac250513          	addi	a0,a0,-1342 # 802098b8 <digits+0x538>
    80202dfe:	ffffd097          	auipc	ra,0xffffd
    80202e02:	390080e7          	jalr	912(ra) # 8020018e <printf>
  printf("s1: %p\t", tf->s1);
    80202e06:	74ac                	ld	a1,104(s1)
    80202e08:	00007517          	auipc	a0,0x7
    80202e0c:	ab850513          	addi	a0,a0,-1352 # 802098c0 <digits+0x540>
    80202e10:	ffffd097          	auipc	ra,0xffffd
    80202e14:	37e080e7          	jalr	894(ra) # 8020018e <printf>
  printf("s2: %p\t", tf->s2);
    80202e18:	78cc                	ld	a1,176(s1)
    80202e1a:	00007517          	auipc	a0,0x7
    80202e1e:	aae50513          	addi	a0,a0,-1362 # 802098c8 <digits+0x548>
    80202e22:	ffffd097          	auipc	ra,0xffffd
    80202e26:	36c080e7          	jalr	876(ra) # 8020018e <printf>
  printf("s3: %p\t", tf->s3);
    80202e2a:	7ccc                	ld	a1,184(s1)
    80202e2c:	00007517          	auipc	a0,0x7
    80202e30:	aa450513          	addi	a0,a0,-1372 # 802098d0 <digits+0x550>
    80202e34:	ffffd097          	auipc	ra,0xffffd
    80202e38:	35a080e7          	jalr	858(ra) # 8020018e <printf>
  printf("s4: %p\n", tf->s4);
    80202e3c:	60ec                	ld	a1,192(s1)
    80202e3e:	00007517          	auipc	a0,0x7
    80202e42:	a9a50513          	addi	a0,a0,-1382 # 802098d8 <digits+0x558>
    80202e46:	ffffd097          	auipc	ra,0xffffd
    80202e4a:	348080e7          	jalr	840(ra) # 8020018e <printf>
  printf("s5: %p\t", tf->s5);
    80202e4e:	64ec                	ld	a1,200(s1)
    80202e50:	00007517          	auipc	a0,0x7
    80202e54:	a9050513          	addi	a0,a0,-1392 # 802098e0 <digits+0x560>
    80202e58:	ffffd097          	auipc	ra,0xffffd
    80202e5c:	336080e7          	jalr	822(ra) # 8020018e <printf>
  printf("s6: %p\t", tf->s6);
    80202e60:	68ec                	ld	a1,208(s1)
    80202e62:	00007517          	auipc	a0,0x7
    80202e66:	a8650513          	addi	a0,a0,-1402 # 802098e8 <digits+0x568>
    80202e6a:	ffffd097          	auipc	ra,0xffffd
    80202e6e:	324080e7          	jalr	804(ra) # 8020018e <printf>
  printf("s7: %p\t", tf->s7);
    80202e72:	6cec                	ld	a1,216(s1)
    80202e74:	00007517          	auipc	a0,0x7
    80202e78:	a7c50513          	addi	a0,a0,-1412 # 802098f0 <digits+0x570>
    80202e7c:	ffffd097          	auipc	ra,0xffffd
    80202e80:	312080e7          	jalr	786(ra) # 8020018e <printf>
  printf("s8: %p\n", tf->s8);
    80202e84:	70ec                	ld	a1,224(s1)
    80202e86:	00007517          	auipc	a0,0x7
    80202e8a:	a7250513          	addi	a0,a0,-1422 # 802098f8 <digits+0x578>
    80202e8e:	ffffd097          	auipc	ra,0xffffd
    80202e92:	300080e7          	jalr	768(ra) # 8020018e <printf>
  printf("s9: %p\t", tf->s9);
    80202e96:	74ec                	ld	a1,232(s1)
    80202e98:	00007517          	auipc	a0,0x7
    80202e9c:	a6850513          	addi	a0,a0,-1432 # 80209900 <digits+0x580>
    80202ea0:	ffffd097          	auipc	ra,0xffffd
    80202ea4:	2ee080e7          	jalr	750(ra) # 8020018e <printf>
  printf("s10: %p\t", tf->s10);
    80202ea8:	78ec                	ld	a1,240(s1)
    80202eaa:	00007517          	auipc	a0,0x7
    80202eae:	a5e50513          	addi	a0,a0,-1442 # 80209908 <digits+0x588>
    80202eb2:	ffffd097          	auipc	ra,0xffffd
    80202eb6:	2dc080e7          	jalr	732(ra) # 8020018e <printf>
  printf("s11: %p\t", tf->s11);
    80202eba:	7cec                	ld	a1,248(s1)
    80202ebc:	00007517          	auipc	a0,0x7
    80202ec0:	a5c50513          	addi	a0,a0,-1444 # 80209918 <digits+0x598>
    80202ec4:	ffffd097          	auipc	ra,0xffffd
    80202ec8:	2ca080e7          	jalr	714(ra) # 8020018e <printf>
  printf("ra: %p\n", tf->ra);
    80202ecc:	748c                	ld	a1,40(s1)
    80202ece:	00006517          	auipc	a0,0x6
    80202ed2:	74250513          	addi	a0,a0,1858 # 80209610 <digits+0x290>
    80202ed6:	ffffd097          	auipc	ra,0xffffd
    80202eda:	2b8080e7          	jalr	696(ra) # 8020018e <printf>
  printf("sp: %p\t", tf->sp);
    80202ede:	788c                	ld	a1,48(s1)
    80202ee0:	00007517          	auipc	a0,0x7
    80202ee4:	a4850513          	addi	a0,a0,-1464 # 80209928 <digits+0x5a8>
    80202ee8:	ffffd097          	auipc	ra,0xffffd
    80202eec:	2a6080e7          	jalr	678(ra) # 8020018e <printf>
  printf("gp: %p\t", tf->gp);
    80202ef0:	7c8c                	ld	a1,56(s1)
    80202ef2:	00007517          	auipc	a0,0x7
    80202ef6:	a3e50513          	addi	a0,a0,-1474 # 80209930 <digits+0x5b0>
    80202efa:	ffffd097          	auipc	ra,0xffffd
    80202efe:	294080e7          	jalr	660(ra) # 8020018e <printf>
  printf("tp: %p\t", tf->tp);
    80202f02:	60ac                	ld	a1,64(s1)
    80202f04:	00007517          	auipc	a0,0x7
    80202f08:	a3450513          	addi	a0,a0,-1484 # 80209938 <digits+0x5b8>
    80202f0c:	ffffd097          	auipc	ra,0xffffd
    80202f10:	282080e7          	jalr	642(ra) # 8020018e <printf>
  printf("epc: %p\n", tf->epc);
    80202f14:	6c8c                	ld	a1,24(s1)
    80202f16:	00007517          	auipc	a0,0x7
    80202f1a:	a2a50513          	addi	a0,a0,-1494 # 80209940 <digits+0x5c0>
    80202f1e:	ffffd097          	auipc	ra,0xffffd
    80202f22:	270080e7          	jalr	624(ra) # 8020018e <printf>
}
    80202f26:	60e2                	ld	ra,24(sp)
    80202f28:	6442                	ld	s0,16(sp)
    80202f2a:	64a2                	ld	s1,8(sp)
    80202f2c:	6105                	addi	sp,sp,32
    80202f2e:	8082                	ret

0000000080202f30 <argraw>:
  return strlen(buf);
}

static uint64
argraw(int n)
{
    80202f30:	1101                	addi	sp,sp,-32
    80202f32:	ec06                	sd	ra,24(sp)
    80202f34:	e822                	sd	s0,16(sp)
    80202f36:	e426                	sd	s1,8(sp)
    80202f38:	1000                	addi	s0,sp,32
    80202f3a:	84aa                	mv	s1,a0
  struct proc *p = myproc();
    80202f3c:	fffff097          	auipc	ra,0xfffff
    80202f40:	b00080e7          	jalr	-1280(ra) # 80201a3c <myproc>
  switch (n) {
    80202f44:	4795                	li	a5,5
    80202f46:	0497e163          	bltu	a5,s1,80202f88 <argraw+0x58>
    80202f4a:	048a                	slli	s1,s1,0x2
    80202f4c:	00007717          	auipc	a4,0x7
    80202f50:	b8c70713          	addi	a4,a4,-1140 # 80209ad8 <digits+0x758>
    80202f54:	94ba                	add	s1,s1,a4
    80202f56:	409c                	lw	a5,0(s1)
    80202f58:	97ba                	add	a5,a5,a4
    80202f5a:	8782                	jr	a5
  case 0:
    return p->trapframe->a0;
    80202f5c:	713c                	ld	a5,96(a0)
    80202f5e:	7ba8                	ld	a0,112(a5)
  case 5:
    return p->trapframe->a5;
  }
  panic("argraw");
  return -1;
}
    80202f60:	60e2                	ld	ra,24(sp)
    80202f62:	6442                	ld	s0,16(sp)
    80202f64:	64a2                	ld	s1,8(sp)
    80202f66:	6105                	addi	sp,sp,32
    80202f68:	8082                	ret
    return p->trapframe->a1;
    80202f6a:	713c                	ld	a5,96(a0)
    80202f6c:	7fa8                	ld	a0,120(a5)
    80202f6e:	bfcd                	j	80202f60 <argraw+0x30>
    return p->trapframe->a2;
    80202f70:	713c                	ld	a5,96(a0)
    80202f72:	63c8                	ld	a0,128(a5)
    80202f74:	b7f5                	j	80202f60 <argraw+0x30>
    return p->trapframe->a3;
    80202f76:	713c                	ld	a5,96(a0)
    80202f78:	67c8                	ld	a0,136(a5)
    80202f7a:	b7dd                	j	80202f60 <argraw+0x30>
    return p->trapframe->a4;
    80202f7c:	713c                	ld	a5,96(a0)
    80202f7e:	6bc8                	ld	a0,144(a5)
    80202f80:	b7c5                	j	80202f60 <argraw+0x30>
    return p->trapframe->a5;
    80202f82:	713c                	ld	a5,96(a0)
    80202f84:	6fc8                	ld	a0,152(a5)
    80202f86:	bfe9                	j	80202f60 <argraw+0x30>
  panic("argraw");
    80202f88:	00007517          	auipc	a0,0x7
    80202f8c:	9c850513          	addi	a0,a0,-1592 # 80209950 <digits+0x5d0>
    80202f90:	ffffd097          	auipc	ra,0xffffd
    80202f94:	1b4080e7          	jalr	436(ra) # 80200144 <panic>

0000000080202f98 <sys_sysinfo>:
    return 0;
}

uint64
sys_sysinfo(void)
{
    80202f98:	7179                	addi	sp,sp,-48
    80202f9a:	f406                	sd	ra,40(sp)
    80202f9c:	f022                	sd	s0,32(sp)
    80202f9e:	ec26                	sd	s1,24(sp)
    80202fa0:	1800                	addi	s0,sp,48
  *ip = argraw(n);
    80202fa2:	4501                	li	a0,0
    80202fa4:	00000097          	auipc	ra,0x0
    80202fa8:	f8c080e7          	jalr	-116(ra) # 80202f30 <argraw>
    80202fac:	84aa                	mv	s1,a0
  if (argaddr(0, &addr) < 0) {
    return -1;
  }

  struct sysinfo info;
  info.freemem = freemem_amount();
    80202fae:	ffffd097          	auipc	ra,0xffffd
    80202fb2:	612080e7          	jalr	1554(ra) # 802005c0 <freemem_amount>
    80202fb6:	fca43823          	sd	a0,-48(s0)
  info.nproc = procnum();
    80202fba:	fffff097          	auipc	ra,0xfffff
    80202fbe:	69a080e7          	jalr	1690(ra) # 80202654 <procnum>
    80202fc2:	fca43c23          	sd	a0,-40(s0)

  // if (copyout(p->pagetable, addr, (char *)&info, sizeof(info)) < 0) {
  if (copyout2(addr, (char *)&info, sizeof(info)) < 0) {
    80202fc6:	4641                	li	a2,16
    80202fc8:	fd040593          	addi	a1,s0,-48
    80202fcc:	8526                	mv	a0,s1
    80202fce:	ffffe097          	auipc	ra,0xffffe
    80202fd2:	3a4080e7          	jalr	932(ra) # 80201372 <copyout2>
    return -1;
  }

  return 0;
}
    80202fd6:	957d                	srai	a0,a0,0x3f
    80202fd8:	70a2                	ld	ra,40(sp)
    80202fda:	7402                	ld	s0,32(sp)
    80202fdc:	64e2                	ld	s1,24(sp)
    80202fde:	6145                	addi	sp,sp,48
    80202fe0:	8082                	ret

0000000080202fe2 <fetchaddr>:
{
    80202fe2:	1101                	addi	sp,sp,-32
    80202fe4:	ec06                	sd	ra,24(sp)
    80202fe6:	e822                	sd	s0,16(sp)
    80202fe8:	e426                	sd	s1,8(sp)
    80202fea:	e04a                	sd	s2,0(sp)
    80202fec:	1000                	addi	s0,sp,32
    80202fee:	84aa                	mv	s1,a0
    80202ff0:	892e                	mv	s2,a1
  struct proc *p = myproc();
    80202ff2:	fffff097          	auipc	ra,0xfffff
    80202ff6:	a4a080e7          	jalr	-1462(ra) # 80201a3c <myproc>
  if(addr >= p->sz || addr+sizeof(uint64) > p->sz)
    80202ffa:	653c                	ld	a5,72(a0)
    80202ffc:	02f4f763          	bgeu	s1,a5,8020302a <fetchaddr+0x48>
    80203000:	00848713          	addi	a4,s1,8
    80203004:	02e7e563          	bltu	a5,a4,8020302e <fetchaddr+0x4c>
  if(copyin2((char *)ip, addr, sizeof(*ip)) != 0)
    80203008:	4621                	li	a2,8
    8020300a:	85a6                	mv	a1,s1
    8020300c:	854a                	mv	a0,s2
    8020300e:	ffffe097          	auipc	ra,0xffffe
    80203012:	444080e7          	jalr	1092(ra) # 80201452 <copyin2>
    80203016:	00a03533          	snez	a0,a0
    8020301a:	40a00533          	neg	a0,a0
}
    8020301e:	60e2                	ld	ra,24(sp)
    80203020:	6442                	ld	s0,16(sp)
    80203022:	64a2                	ld	s1,8(sp)
    80203024:	6902                	ld	s2,0(sp)
    80203026:	6105                	addi	sp,sp,32
    80203028:	8082                	ret
    return -1;
    8020302a:	557d                	li	a0,-1
    8020302c:	bfcd                	j	8020301e <fetchaddr+0x3c>
    8020302e:	557d                	li	a0,-1
    80203030:	b7fd                	j	8020301e <fetchaddr+0x3c>

0000000080203032 <fetchstr>:
{
    80203032:	1101                	addi	sp,sp,-32
    80203034:	ec06                	sd	ra,24(sp)
    80203036:	e822                	sd	s0,16(sp)
    80203038:	e426                	sd	s1,8(sp)
    8020303a:	1000                	addi	s0,sp,32
    8020303c:	84ae                	mv	s1,a1
  int err = copyinstr2(buf, addr, max);
    8020303e:	85aa                	mv	a1,a0
    80203040:	8526                	mv	a0,s1
    80203042:	ffffe097          	auipc	ra,0xffffe
    80203046:	512080e7          	jalr	1298(ra) # 80201554 <copyinstr2>
  if(err < 0)
    8020304a:	00054763          	bltz	a0,80203058 <fetchstr+0x26>
  return strlen(buf);
    8020304e:	8526                	mv	a0,s1
    80203050:	ffffe097          	auipc	ra,0xffffe
    80203054:	896080e7          	jalr	-1898(ra) # 802008e6 <strlen>
}
    80203058:	60e2                	ld	ra,24(sp)
    8020305a:	6442                	ld	s0,16(sp)
    8020305c:	64a2                	ld	s1,8(sp)
    8020305e:	6105                	addi	sp,sp,32
    80203060:	8082                	ret

0000000080203062 <argint>:
{
    80203062:	1101                	addi	sp,sp,-32
    80203064:	ec06                	sd	ra,24(sp)
    80203066:	e822                	sd	s0,16(sp)
    80203068:	e426                	sd	s1,8(sp)
    8020306a:	1000                	addi	s0,sp,32
    8020306c:	84ae                	mv	s1,a1
  *ip = argraw(n);
    8020306e:	00000097          	auipc	ra,0x0
    80203072:	ec2080e7          	jalr	-318(ra) # 80202f30 <argraw>
    80203076:	c088                	sw	a0,0(s1)
}
    80203078:	4501                	li	a0,0
    8020307a:	60e2                	ld	ra,24(sp)
    8020307c:	6442                	ld	s0,16(sp)
    8020307e:	64a2                	ld	s1,8(sp)
    80203080:	6105                	addi	sp,sp,32
    80203082:	8082                	ret

0000000080203084 <sys_test_proc>:
sys_test_proc(void) {
    80203084:	1101                	addi	sp,sp,-32
    80203086:	ec06                	sd	ra,24(sp)
    80203088:	e822                	sd	s0,16(sp)
    8020308a:	1000                	addi	s0,sp,32
    argint(0, &n);
    8020308c:	fec40593          	addi	a1,s0,-20
    80203090:	4501                	li	a0,0
    80203092:	00000097          	auipc	ra,0x0
    80203096:	fd0080e7          	jalr	-48(ra) # 80203062 <argint>
    printf("hello world from proc %d, hart %d, arg %d\n", myproc()->pid, r_tp(), n);
    8020309a:	fffff097          	auipc	ra,0xfffff
    8020309e:	9a2080e7          	jalr	-1630(ra) # 80201a3c <myproc>
    802030a2:	8612                	mv	a2,tp
    802030a4:	fec42683          	lw	a3,-20(s0)
    802030a8:	5d0c                	lw	a1,56(a0)
    802030aa:	00007517          	auipc	a0,0x7
    802030ae:	8ae50513          	addi	a0,a0,-1874 # 80209958 <digits+0x5d8>
    802030b2:	ffffd097          	auipc	ra,0xffffd
    802030b6:	0dc080e7          	jalr	220(ra) # 8020018e <printf>
}
    802030ba:	4501                	li	a0,0
    802030bc:	60e2                	ld	ra,24(sp)
    802030be:	6442                	ld	s0,16(sp)
    802030c0:	6105                	addi	sp,sp,32
    802030c2:	8082                	ret

00000000802030c4 <argaddr>:
{
    802030c4:	1101                	addi	sp,sp,-32
    802030c6:	ec06                	sd	ra,24(sp)
    802030c8:	e822                	sd	s0,16(sp)
    802030ca:	e426                	sd	s1,8(sp)
    802030cc:	1000                	addi	s0,sp,32
    802030ce:	84ae                	mv	s1,a1
  *ip = argraw(n);
    802030d0:	00000097          	auipc	ra,0x0
    802030d4:	e60080e7          	jalr	-416(ra) # 80202f30 <argraw>
    802030d8:	e088                	sd	a0,0(s1)
}
    802030da:	4501                	li	a0,0
    802030dc:	60e2                	ld	ra,24(sp)
    802030de:	6442                	ld	s0,16(sp)
    802030e0:	64a2                	ld	s1,8(sp)
    802030e2:	6105                	addi	sp,sp,32
    802030e4:	8082                	ret

00000000802030e6 <argstr>:
{
    802030e6:	1101                	addi	sp,sp,-32
    802030e8:	ec06                	sd	ra,24(sp)
    802030ea:	e822                	sd	s0,16(sp)
    802030ec:	e426                	sd	s1,8(sp)
    802030ee:	e04a                	sd	s2,0(sp)
    802030f0:	1000                	addi	s0,sp,32
    802030f2:	84ae                	mv	s1,a1
    802030f4:	8932                	mv	s2,a2
  *ip = argraw(n);
    802030f6:	00000097          	auipc	ra,0x0
    802030fa:	e3a080e7          	jalr	-454(ra) # 80202f30 <argraw>
  return fetchstr(addr, buf, max);
    802030fe:	864a                	mv	a2,s2
    80203100:	85a6                	mv	a1,s1
    80203102:	00000097          	auipc	ra,0x0
    80203106:	f30080e7          	jalr	-208(ra) # 80203032 <fetchstr>
}
    8020310a:	60e2                	ld	ra,24(sp)
    8020310c:	6442                	ld	s0,16(sp)
    8020310e:	64a2                	ld	s1,8(sp)
    80203110:	6902                	ld	s2,0(sp)
    80203112:	6105                	addi	sp,sp,32
    80203114:	8082                	ret

0000000080203116 <syscall>:
{
    80203116:	7179                	addi	sp,sp,-48
    80203118:	f406                	sd	ra,40(sp)
    8020311a:	f022                	sd	s0,32(sp)
    8020311c:	ec26                	sd	s1,24(sp)
    8020311e:	e84a                	sd	s2,16(sp)
    80203120:	e44e                	sd	s3,8(sp)
    80203122:	1800                	addi	s0,sp,48
  struct proc *p = myproc();
    80203124:	fffff097          	auipc	ra,0xfffff
    80203128:	918080e7          	jalr	-1768(ra) # 80201a3c <myproc>
    8020312c:	84aa                	mv	s1,a0
  num = p->trapframe->a7;
    8020312e:	06053903          	ld	s2,96(a0)
    80203132:	0a893783          	ld	a5,168(s2)
    80203136:	0007899b          	sext.w	s3,a5
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    8020313a:	37fd                	addiw	a5,a5,-1
    8020313c:	10300713          	li	a4,259
    80203140:	04f76763          	bltu	a4,a5,8020318e <syscall+0x78>
    80203144:	00399713          	slli	a4,s3,0x3
    80203148:	00008797          	auipc	a5,0x8
    8020314c:	b0878793          	addi	a5,a5,-1272 # 8020ac50 <syscalls>
    80203150:	97ba                	add	a5,a5,a4
    80203152:	639c                	ld	a5,0(a5)
    80203154:	cf8d                	beqz	a5,8020318e <syscall+0x78>
    p->trapframe->a0 = syscalls[num]();
    80203156:	9782                	jalr	a5
    80203158:	06a93823          	sd	a0,112(s2)
    if ((p->tmask & (1 << num)) != 0) {
    8020315c:	1704a783          	lw	a5,368(s1)
    80203160:	4137d7bb          	sraw	a5,a5,s3
    80203164:	8b85                	andi	a5,a5,1
    80203166:	c3b9                	beqz	a5,802031ac <syscall+0x96>
      printf("pid %d: %s -> %d\n", p->pid, sysnames[num], p->trapframe->a0);
    80203168:	70b8                	ld	a4,96(s1)
    8020316a:	098e                	slli	s3,s3,0x3
    8020316c:	00008797          	auipc	a5,0x8
    80203170:	30c78793          	addi	a5,a5,780 # 8020b478 <sysnames>
    80203174:	97ce                	add	a5,a5,s3
    80203176:	7b34                	ld	a3,112(a4)
    80203178:	6390                	ld	a2,0(a5)
    8020317a:	5c8c                	lw	a1,56(s1)
    8020317c:	00007517          	auipc	a0,0x7
    80203180:	80c50513          	addi	a0,a0,-2036 # 80209988 <digits+0x608>
    80203184:	ffffd097          	auipc	ra,0xffffd
    80203188:	00a080e7          	jalr	10(ra) # 8020018e <printf>
    8020318c:	a005                	j	802031ac <syscall+0x96>
    printf("pid %d %s: unknown sys call %d\n",
    8020318e:	86ce                	mv	a3,s3
    80203190:	16048613          	addi	a2,s1,352
    80203194:	5c8c                	lw	a1,56(s1)
    80203196:	00007517          	auipc	a0,0x7
    8020319a:	80a50513          	addi	a0,a0,-2038 # 802099a0 <digits+0x620>
    8020319e:	ffffd097          	auipc	ra,0xffffd
    802031a2:	ff0080e7          	jalr	-16(ra) # 8020018e <printf>
    p->trapframe->a0 = -1;
    802031a6:	70bc                	ld	a5,96(s1)
    802031a8:	577d                	li	a4,-1
    802031aa:	fbb8                	sd	a4,112(a5)
}
    802031ac:	70a2                	ld	ra,40(sp)
    802031ae:	7402                	ld	s0,32(sp)
    802031b0:	64e2                	ld	s1,24(sp)
    802031b2:	6942                	ld	s2,16(sp)
    802031b4:	69a2                	ld	s3,8(sp)
    802031b6:	6145                	addi	sp,sp,48
    802031b8:	8082                	ret

00000000802031ba <sys_exec>:

extern int exec(char *path, char **argv);

uint64
sys_exec(void)
{
    802031ba:	d9010113          	addi	sp,sp,-624
    802031be:	26113423          	sd	ra,616(sp)
    802031c2:	26813023          	sd	s0,608(sp)
    802031c6:	24913c23          	sd	s1,600(sp)
    802031ca:	25213823          	sd	s2,592(sp)
    802031ce:	25313423          	sd	s3,584(sp)
    802031d2:	25413023          	sd	s4,576(sp)
    802031d6:	23513c23          	sd	s5,568(sp)
    802031da:	23613823          	sd	s6,560(sp)
    802031de:	23713423          	sd	s7,552(sp)
    802031e2:	1c80                	addi	s0,sp,624
  char path[FAT32_MAX_PATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    802031e4:	10400613          	li	a2,260
    802031e8:	ea840593          	addi	a1,s0,-344
    802031ec:	4501                	li	a0,0
    802031ee:	00000097          	auipc	ra,0x0
    802031f2:	ef8080e7          	jalr	-264(ra) # 802030e6 <argstr>
    return -1;
    802031f6:	597d                	li	s2,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    802031f8:	0c054c63          	bltz	a0,802032d0 <sys_exec+0x116>
    802031fc:	da040593          	addi	a1,s0,-608
    80203200:	4505                	li	a0,1
    80203202:	00000097          	auipc	ra,0x0
    80203206:	ec2080e7          	jalr	-318(ra) # 802030c4 <argaddr>
    8020320a:	0c054363          	bltz	a0,802032d0 <sys_exec+0x116>
  }
  memset(argv, 0, sizeof(argv));
    8020320e:	da840a13          	addi	s4,s0,-600
    80203212:	10000613          	li	a2,256
    80203216:	4581                	li	a1,0
    80203218:	8552                	mv	a0,s4
    8020321a:	ffffd097          	auipc	ra,0xffffd
    8020321e:	548080e7          	jalr	1352(ra) # 80200762 <memset>
  for(i=0;; i++){
    if(i >= NELEM(argv)){
    80203222:	84d2                	mv	s1,s4
  memset(argv, 0, sizeof(argv));
    80203224:	89d2                	mv	s3,s4
    80203226:	4901                	li	s2,0
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    80203228:	d9840a93          	addi	s5,s0,-616
    if(i >= NELEM(argv)){
    8020322c:	02000b13          	li	s6,32
    80203230:	00090b9b          	sext.w	s7,s2
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    80203234:	00391513          	slli	a0,s2,0x3
    80203238:	85d6                	mv	a1,s5
    8020323a:	da043783          	ld	a5,-608(s0)
    8020323e:	953e                	add	a0,a0,a5
    80203240:	00000097          	auipc	ra,0x0
    80203244:	da2080e7          	jalr	-606(ra) # 80202fe2 <fetchaddr>
    80203248:	02054a63          	bltz	a0,8020327c <sys_exec+0xc2>
      goto bad;
    }
    if(uarg == 0){
    8020324c:	d9843783          	ld	a5,-616(s0)
    80203250:	c3b9                	beqz	a5,80203296 <sys_exec+0xdc>
      argv[i] = 0;
      break;
    }
    argv[i] = kalloc();
    80203252:	ffffd097          	auipc	ra,0xffffd
    80203256:	308080e7          	jalr	776(ra) # 8020055a <kalloc>
    8020325a:	85aa                	mv	a1,a0
    8020325c:	00a9b023          	sd	a0,0(s3)
    if(argv[i] == 0)
    80203260:	cd11                	beqz	a0,8020327c <sys_exec+0xc2>
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    80203262:	6605                	lui	a2,0x1
    80203264:	d9843503          	ld	a0,-616(s0)
    80203268:	00000097          	auipc	ra,0x0
    8020326c:	dca080e7          	jalr	-566(ra) # 80203032 <fetchstr>
    80203270:	00054663          	bltz	a0,8020327c <sys_exec+0xc2>
    if(i >= NELEM(argv)){
    80203274:	0905                	addi	s2,s2,1
    80203276:	09a1                	addi	s3,s3,8
    80203278:	fb691ce3          	bne	s2,s6,80203230 <sys_exec+0x76>
    kfree(argv[i]);

  return ret;

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8020327c:	100a0a13          	addi	s4,s4,256
    80203280:	6088                	ld	a0,0(s1)
    80203282:	c531                	beqz	a0,802032ce <sys_exec+0x114>
    kfree(argv[i]);
    80203284:	ffffd097          	auipc	ra,0xffffd
    80203288:	1bc080e7          	jalr	444(ra) # 80200440 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8020328c:	04a1                	addi	s1,s1,8
    8020328e:	ff4499e3          	bne	s1,s4,80203280 <sys_exec+0xc6>
  return -1;
    80203292:	597d                	li	s2,-1
    80203294:	a835                	j	802032d0 <sys_exec+0x116>
      argv[i] = 0;
    80203296:	0b8e                	slli	s7,s7,0x3
    80203298:	fb0b8793          	addi	a5,s7,-80
    8020329c:	00878bb3          	add	s7,a5,s0
    802032a0:	de0bbc23          	sd	zero,-520(s7)
  int ret = exec(path, argv);
    802032a4:	da840593          	addi	a1,s0,-600
    802032a8:	ea840513          	addi	a0,s0,-344
    802032ac:	00001097          	auipc	ra,0x1
    802032b0:	12e080e7          	jalr	302(ra) # 802043da <exec>
    802032b4:	892a                	mv	s2,a0
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    802032b6:	100a0a13          	addi	s4,s4,256
    802032ba:	6088                	ld	a0,0(s1)
    802032bc:	c911                	beqz	a0,802032d0 <sys_exec+0x116>
    kfree(argv[i]);
    802032be:	ffffd097          	auipc	ra,0xffffd
    802032c2:	182080e7          	jalr	386(ra) # 80200440 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    802032c6:	04a1                	addi	s1,s1,8
    802032c8:	ff4499e3          	bne	s1,s4,802032ba <sys_exec+0x100>
    802032cc:	a011                	j	802032d0 <sys_exec+0x116>
  return -1;
    802032ce:	597d                	li	s2,-1
}
    802032d0:	854a                	mv	a0,s2
    802032d2:	26813083          	ld	ra,616(sp)
    802032d6:	26013403          	ld	s0,608(sp)
    802032da:	25813483          	ld	s1,600(sp)
    802032de:	25013903          	ld	s2,592(sp)
    802032e2:	24813983          	ld	s3,584(sp)
    802032e6:	24013a03          	ld	s4,576(sp)
    802032ea:	23813a83          	ld	s5,568(sp)
    802032ee:	23013b03          	ld	s6,560(sp)
    802032f2:	22813b83          	ld	s7,552(sp)
    802032f6:	27010113          	addi	sp,sp,624
    802032fa:	8082                	ret

00000000802032fc <sys_exit>:

uint64
sys_exit(void)
{
    802032fc:	1101                	addi	sp,sp,-32
    802032fe:	ec06                	sd	ra,24(sp)
    80203300:	e822                	sd	s0,16(sp)
    80203302:	1000                	addi	s0,sp,32
  int n;
  if(argint(0, &n) < 0)
    80203304:	fec40593          	addi	a1,s0,-20
    80203308:	4501                	li	a0,0
    8020330a:	00000097          	auipc	ra,0x0
    8020330e:	d58080e7          	jalr	-680(ra) # 80203062 <argint>
    return -1;
    80203312:	57fd                	li	a5,-1
  if(argint(0, &n) < 0)
    80203314:	00054963          	bltz	a0,80203326 <sys_exit+0x2a>
  exit(n);
    80203318:	fec42503          	lw	a0,-20(s0)
    8020331c:	fffff097          	auipc	ra,0xfffff
    80203320:	e64080e7          	jalr	-412(ra) # 80202180 <exit>
  return 0;  // not reached
    80203324:	4781                	li	a5,0
}
    80203326:	853e                	mv	a0,a5
    80203328:	60e2                	ld	ra,24(sp)
    8020332a:	6442                	ld	s0,16(sp)
    8020332c:	6105                	addi	sp,sp,32
    8020332e:	8082                	ret

0000000080203330 <sys_getpid>:

uint64
sys_getpid(void)
{
    80203330:	1141                	addi	sp,sp,-16
    80203332:	e406                	sd	ra,8(sp)
    80203334:	e022                	sd	s0,0(sp)
    80203336:	0800                	addi	s0,sp,16
  return myproc()->pid;
    80203338:	ffffe097          	auipc	ra,0xffffe
    8020333c:	704080e7          	jalr	1796(ra) # 80201a3c <myproc>
}
    80203340:	5d08                	lw	a0,56(a0)
    80203342:	60a2                	ld	ra,8(sp)
    80203344:	6402                	ld	s0,0(sp)
    80203346:	0141                	addi	sp,sp,16
    80203348:	8082                	ret

000000008020334a <sys_fork>:

uint64
sys_fork(void)
{
    8020334a:	1141                	addi	sp,sp,-16
    8020334c:	e406                	sd	ra,8(sp)
    8020334e:	e022                	sd	s0,0(sp)
    80203350:	0800                	addi	s0,sp,16
  return fork();
    80203352:	fffff097          	auipc	ra,0xfffff
    80203356:	af0080e7          	jalr	-1296(ra) # 80201e42 <fork>
}
    8020335a:	60a2                	ld	ra,8(sp)
    8020335c:	6402                	ld	s0,0(sp)
    8020335e:	0141                	addi	sp,sp,16
    80203360:	8082                	ret

0000000080203362 <sys_wait>:

uint64
sys_wait(void)
{
    80203362:	1101                	addi	sp,sp,-32
    80203364:	ec06                	sd	ra,24(sp)
    80203366:	e822                	sd	s0,16(sp)
    80203368:	1000                	addi	s0,sp,32
  uint64 p;
  if(argaddr(0, &p) < 0)
    8020336a:	fe840593          	addi	a1,s0,-24
    8020336e:	4501                	li	a0,0
    80203370:	00000097          	auipc	ra,0x0
    80203374:	d54080e7          	jalr	-684(ra) # 802030c4 <argaddr>
    80203378:	87aa                	mv	a5,a0
    return -1;
    8020337a:	557d                	li	a0,-1
  if(argaddr(0, &p) < 0)
    8020337c:	0007c863          	bltz	a5,8020338c <sys_wait+0x2a>
  return wait(p);
    80203380:	fe843503          	ld	a0,-24(s0)
    80203384:	fffff097          	auipc	ra,0xfffff
    80203388:	fda080e7          	jalr	-38(ra) # 8020235e <wait>
}
    8020338c:	60e2                	ld	ra,24(sp)
    8020338e:	6442                	ld	s0,16(sp)
    80203390:	6105                	addi	sp,sp,32
    80203392:	8082                	ret

0000000080203394 <sys_sbrk>:

uint64
sys_sbrk(void)
{
    80203394:	7179                	addi	sp,sp,-48
    80203396:	f406                	sd	ra,40(sp)
    80203398:	f022                	sd	s0,32(sp)
    8020339a:	ec26                	sd	s1,24(sp)
    8020339c:	1800                	addi	s0,sp,48
  int addr;
  int n;

  if(argint(0, &n) < 0)
    8020339e:	fdc40593          	addi	a1,s0,-36
    802033a2:	4501                	li	a0,0
    802033a4:	00000097          	auipc	ra,0x0
    802033a8:	cbe080e7          	jalr	-834(ra) # 80203062 <argint>
    802033ac:	87aa                	mv	a5,a0
    return -1;
    802033ae:	557d                	li	a0,-1
  if(argint(0, &n) < 0)
    802033b0:	0207c063          	bltz	a5,802033d0 <sys_sbrk+0x3c>
  addr = myproc()->sz;
    802033b4:	ffffe097          	auipc	ra,0xffffe
    802033b8:	688080e7          	jalr	1672(ra) # 80201a3c <myproc>
    802033bc:	4524                	lw	s1,72(a0)
  if(growproc(n) < 0)
    802033be:	fdc42503          	lw	a0,-36(s0)
    802033c2:	fffff097          	auipc	ra,0xfffff
    802033c6:	a04080e7          	jalr	-1532(ra) # 80201dc6 <growproc>
    802033ca:	00054863          	bltz	a0,802033da <sys_sbrk+0x46>
    return -1;
  return addr;
    802033ce:	8526                	mv	a0,s1
}
    802033d0:	70a2                	ld	ra,40(sp)
    802033d2:	7402                	ld	s0,32(sp)
    802033d4:	64e2                	ld	s1,24(sp)
    802033d6:	6145                	addi	sp,sp,48
    802033d8:	8082                	ret
    return -1;
    802033da:	557d                	li	a0,-1
    802033dc:	bfd5                	j	802033d0 <sys_sbrk+0x3c>

00000000802033de <sys_sleep>:

uint64
sys_sleep(void)
{
    802033de:	7139                	addi	sp,sp,-64
    802033e0:	fc06                	sd	ra,56(sp)
    802033e2:	f822                	sd	s0,48(sp)
    802033e4:	f426                	sd	s1,40(sp)
    802033e6:	f04a                	sd	s2,32(sp)
    802033e8:	ec4e                	sd	s3,24(sp)
    802033ea:	0080                	addi	s0,sp,64
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    802033ec:	fcc40593          	addi	a1,s0,-52
    802033f0:	4501                	li	a0,0
    802033f2:	00000097          	auipc	ra,0x0
    802033f6:	c70080e7          	jalr	-912(ra) # 80203062 <argint>
    return -1;
    802033fa:	57fd                	li	a5,-1
  if(argint(0, &n) < 0)
    802033fc:	06054763          	bltz	a0,8020346a <sys_sleep+0x8c>
  acquire(&tickslock);
    80203400:	00009517          	auipc	a0,0x9
    80203404:	8e853503          	ld	a0,-1816(a0) # 8020bce8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80203408:	ffffd097          	auipc	ra,0xffffd
    8020340c:	2be080e7          	jalr	702(ra) # 802006c6 <acquire>
  ticks0 = ticks;
    80203410:	00009797          	auipc	a5,0x9
    80203414:	8e87b783          	ld	a5,-1816(a5) # 8020bcf8 <_GLOBAL_OFFSET_TABLE_+0x40>
    80203418:	0007a903          	lw	s2,0(a5)
  while(ticks - ticks0 < n){
    8020341c:	fcc42783          	lw	a5,-52(s0)
    80203420:	cf85                	beqz	a5,80203458 <sys_sleep+0x7a>
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
    80203422:	00009997          	auipc	s3,0x9
    80203426:	8c69b983          	ld	s3,-1850(s3) # 8020bce8 <_GLOBAL_OFFSET_TABLE_+0x30>
    8020342a:	00009497          	auipc	s1,0x9
    8020342e:	8ce4b483          	ld	s1,-1842(s1) # 8020bcf8 <_GLOBAL_OFFSET_TABLE_+0x40>
    if(myproc()->killed){
    80203432:	ffffe097          	auipc	ra,0xffffe
    80203436:	60a080e7          	jalr	1546(ra) # 80201a3c <myproc>
    8020343a:	591c                	lw	a5,48(a0)
    8020343c:	ef9d                	bnez	a5,8020347a <sys_sleep+0x9c>
    sleep(&ticks, &tickslock);
    8020343e:	85ce                	mv	a1,s3
    80203440:	8526                	mv	a0,s1
    80203442:	fffff097          	auipc	ra,0xfffff
    80203446:	e9e080e7          	jalr	-354(ra) # 802022e0 <sleep>
  while(ticks - ticks0 < n){
    8020344a:	409c                	lw	a5,0(s1)
    8020344c:	412787bb          	subw	a5,a5,s2
    80203450:	fcc42703          	lw	a4,-52(s0)
    80203454:	fce7efe3          	bltu	a5,a4,80203432 <sys_sleep+0x54>
  }
  release(&tickslock);
    80203458:	00009517          	auipc	a0,0x9
    8020345c:	89053503          	ld	a0,-1904(a0) # 8020bce8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80203460:	ffffd097          	auipc	ra,0xffffd
    80203464:	2ba080e7          	jalr	698(ra) # 8020071a <release>
  return 0;
    80203468:	4781                	li	a5,0
}
    8020346a:	853e                	mv	a0,a5
    8020346c:	70e2                	ld	ra,56(sp)
    8020346e:	7442                	ld	s0,48(sp)
    80203470:	74a2                	ld	s1,40(sp)
    80203472:	7902                	ld	s2,32(sp)
    80203474:	69e2                	ld	s3,24(sp)
    80203476:	6121                	addi	sp,sp,64
    80203478:	8082                	ret
      release(&tickslock);
    8020347a:	00009517          	auipc	a0,0x9
    8020347e:	86e53503          	ld	a0,-1938(a0) # 8020bce8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80203482:	ffffd097          	auipc	ra,0xffffd
    80203486:	298080e7          	jalr	664(ra) # 8020071a <release>
      return -1;
    8020348a:	57fd                	li	a5,-1
    8020348c:	bff9                	j	8020346a <sys_sleep+0x8c>

000000008020348e <sys_kill>:

uint64
sys_kill(void)
{
    8020348e:	1101                	addi	sp,sp,-32
    80203490:	ec06                	sd	ra,24(sp)
    80203492:	e822                	sd	s0,16(sp)
    80203494:	1000                	addi	s0,sp,32
  int pid;

  if(argint(0, &pid) < 0)
    80203496:	fec40593          	addi	a1,s0,-20
    8020349a:	4501                	li	a0,0
    8020349c:	00000097          	auipc	ra,0x0
    802034a0:	bc6080e7          	jalr	-1082(ra) # 80203062 <argint>
    802034a4:	87aa                	mv	a5,a0
    return -1;
    802034a6:	557d                	li	a0,-1
  if(argint(0, &pid) < 0)
    802034a8:	0007c863          	bltz	a5,802034b8 <sys_kill+0x2a>
  return kill(pid);
    802034ac:	fec42503          	lw	a0,-20(s0)
    802034b0:	fffff097          	auipc	ra,0xfffff
    802034b4:	016080e7          	jalr	22(ra) # 802024c6 <kill>
}
    802034b8:	60e2                	ld	ra,24(sp)
    802034ba:	6442                	ld	s0,16(sp)
    802034bc:	6105                	addi	sp,sp,32
    802034be:	8082                	ret

00000000802034c0 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
    802034c0:	1101                	addi	sp,sp,-32
    802034c2:	ec06                	sd	ra,24(sp)
    802034c4:	e822                	sd	s0,16(sp)
    802034c6:	e426                	sd	s1,8(sp)
    802034c8:	1000                	addi	s0,sp,32
  uint xticks;

  acquire(&tickslock);
    802034ca:	00009517          	auipc	a0,0x9
    802034ce:	81e53503          	ld	a0,-2018(a0) # 8020bce8 <_GLOBAL_OFFSET_TABLE_+0x30>
    802034d2:	ffffd097          	auipc	ra,0xffffd
    802034d6:	1f4080e7          	jalr	500(ra) # 802006c6 <acquire>
  xticks = ticks;
    802034da:	00009797          	auipc	a5,0x9
    802034de:	81e7b783          	ld	a5,-2018(a5) # 8020bcf8 <_GLOBAL_OFFSET_TABLE_+0x40>
    802034e2:	4384                	lw	s1,0(a5)
  release(&tickslock);
    802034e4:	00009517          	auipc	a0,0x9
    802034e8:	80453503          	ld	a0,-2044(a0) # 8020bce8 <_GLOBAL_OFFSET_TABLE_+0x30>
    802034ec:	ffffd097          	auipc	ra,0xffffd
    802034f0:	22e080e7          	jalr	558(ra) # 8020071a <release>
  return xticks;
}
    802034f4:	02049513          	slli	a0,s1,0x20
    802034f8:	9101                	srli	a0,a0,0x20
    802034fa:	60e2                	ld	ra,24(sp)
    802034fc:	6442                	ld	s0,16(sp)
    802034fe:	64a2                	ld	s1,8(sp)
    80203500:	6105                	addi	sp,sp,32
    80203502:	8082                	ret

0000000080203504 <sys_trace>:

uint64
sys_trace(void)
{
    80203504:	1101                	addi	sp,sp,-32
    80203506:	ec06                	sd	ra,24(sp)
    80203508:	e822                	sd	s0,16(sp)
    8020350a:	1000                	addi	s0,sp,32
  int mask;
  if(argint(0, &mask) < 0) {
    8020350c:	fec40593          	addi	a1,s0,-20
    80203510:	4501                	li	a0,0
    80203512:	00000097          	auipc	ra,0x0
    80203516:	b50080e7          	jalr	-1200(ra) # 80203062 <argint>
    return -1;
    8020351a:	57fd                	li	a5,-1
  if(argint(0, &mask) < 0) {
    8020351c:	00054b63          	bltz	a0,80203532 <sys_trace+0x2e>
  }
  myproc()->tmask = mask;
    80203520:	ffffe097          	auipc	ra,0xffffe
    80203524:	51c080e7          	jalr	1308(ra) # 80201a3c <myproc>
    80203528:	fec42783          	lw	a5,-20(s0)
    8020352c:	16f52823          	sw	a5,368(a0)
  return 0;
    80203530:	4781                	li	a5,0
}
    80203532:	853e                	mv	a0,a5
    80203534:	60e2                	ld	ra,24(sp)
    80203536:	6442                	ld	s0,16(sp)
    80203538:	6105                	addi	sp,sp,32
    8020353a:	8082                	ret

000000008020353c <sys_brk>:
/////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////


uint64
sys_brk(void){
    8020353c:	7179                	addi	sp,sp,-48
    8020353e:	f406                	sd	ra,40(sp)
    80203540:	f022                	sd	s0,32(sp)
    80203542:	ec26                	sd	s1,24(sp)
    80203544:	1800                	addi	s0,sp,48
  uint64 curr_addr;
  uint64 next_addr;
  if(argaddr(0, &next_addr) < 0)
    80203546:	fd840593          	addi	a1,s0,-40
    8020354a:	4501                	li	a0,0
    8020354c:	00000097          	auipc	ra,0x0
    80203550:	b78080e7          	jalr	-1160(ra) # 802030c4 <argaddr>
    return -1;
    80203554:	54fd                	li	s1,-1
  if(argaddr(0, &next_addr) < 0)
    80203556:	02054863          	bltz	a0,80203586 <sys_brk+0x4a>
  curr_addr = myproc()->sz; // Size of process memory
    8020355a:	ffffe097          	auipc	ra,0xffffe
    8020355e:	4e2080e7          	jalr	1250(ra) # 80201a3c <myproc>
    80203562:	6524                	ld	s1,72(a0)
  printf("Running: BRK ... curr_addr: %d ... next_addr: %d\n", curr_addr, next_addr);
    80203564:	fd843603          	ld	a2,-40(s0)
    80203568:	85a6                	mv	a1,s1
    8020356a:	00006517          	auipc	a0,0x6
    8020356e:	58650513          	addi	a0,a0,1414 # 80209af0 <digits+0x770>
    80203572:	ffffd097          	auipc	ra,0xffffd
    80203576:	c1c080e7          	jalr	-996(ra) # 8020018e <printf>
  if (next_addr == 0)
    8020357a:	fd843503          	ld	a0,-40(s0)
    8020357e:	c501                	beqz	a0,80203586 <sys_brk+0x4a>
  {
    return curr_addr;
  }
  if (next_addr >= curr_addr)
    80203580:	00957963          	bgeu	a0,s1,80203592 <sys_brk+0x56>
  {
    if(growproc(next_addr - curr_addr) < 0)
      return -1;
    else return myproc()->sz;
  }
  return 0;
    80203584:	4481                	li	s1,0
}
    80203586:	8526                	mv	a0,s1
    80203588:	70a2                	ld	ra,40(sp)
    8020358a:	7402                	ld	s0,32(sp)
    8020358c:	64e2                	ld	s1,24(sp)
    8020358e:	6145                	addi	sp,sp,48
    80203590:	8082                	ret
    if(growproc(next_addr - curr_addr) < 0)
    80203592:	9d05                	subw	a0,a0,s1
    80203594:	fffff097          	auipc	ra,0xfffff
    80203598:	832080e7          	jalr	-1998(ra) # 80201dc6 <growproc>
      return -1;
    8020359c:	54fd                	li	s1,-1
    if(growproc(next_addr - curr_addr) < 0)
    8020359e:	fe0544e3          	bltz	a0,80203586 <sys_brk+0x4a>
    else return myproc()->sz;
    802035a2:	ffffe097          	auipc	ra,0xffffe
    802035a6:	49a080e7          	jalr	1178(ra) # 80201a3c <myproc>
    802035aa:	6524                	ld	s1,72(a0)
    802035ac:	bfe9                	j	80203586 <sys_brk+0x4a>

00000000802035ae <sys_clone>:


uint64
sys_clone(void){
    802035ae:	1101                	addi	sp,sp,-32
    802035b0:	ec06                	sd	ra,24(sp)
    802035b2:	e822                	sd	s0,16(sp)
    802035b4:	1000                	addi	s0,sp,32
  uint64 flag, stack;
	if (argaddr(0, &flag) < 0) 
    802035b6:	fe840593          	addi	a1,s0,-24
    802035ba:	4501                	li	a0,0
    802035bc:	00000097          	auipc	ra,0x0
    802035c0:	b08080e7          	jalr	-1272(ra) # 802030c4 <argaddr>
		return -1;
    802035c4:	57fd                	li	a5,-1
	if (argaddr(0, &flag) < 0) 
    802035c6:	04054263          	bltz	a0,8020360a <sys_clone+0x5c>
	if (argaddr(1, &stack) < 0) 
    802035ca:	fe040593          	addi	a1,s0,-32
    802035ce:	4505                	li	a0,1
    802035d0:	00000097          	auipc	ra,0x0
    802035d4:	af4080e7          	jalr	-1292(ra) # 802030c4 <argaddr>
		return -1;
    802035d8:	57fd                	li	a5,-1
	if (argaddr(1, &stack) < 0) 
    802035da:	02054863          	bltz	a0,8020360a <sys_clone+0x5c>
  printf("Running: CLONE ... flag: %ld ... stack: %ld\n", flag, stack);
    802035de:	fe043603          	ld	a2,-32(s0)
    802035e2:	fe843583          	ld	a1,-24(s0)
    802035e6:	00006517          	auipc	a0,0x6
    802035ea:	54250513          	addi	a0,a0,1346 # 80209b28 <digits+0x7a8>
    802035ee:	ffffd097          	auipc	ra,0xffffd
    802035f2:	ba0080e7          	jalr	-1120(ra) # 8020018e <printf>
  if (stack != 0)
    802035f6:	fe043583          	ld	a1,-32(s0)
    802035fa:	cd89                	beqz	a1,80203614 <sys_clone+0x66>
	  return clone(flag, stack);
    802035fc:	fe843503          	ld	a0,-24(s0)
    80203600:	fffff097          	auipc	ra,0xfffff
    80203604:	084080e7          	jalr	132(ra) # 80202684 <clone>
    80203608:	87aa                	mv	a5,a0
  else
    return fork();
}
    8020360a:	853e                	mv	a0,a5
    8020360c:	60e2                	ld	ra,24(sp)
    8020360e:	6442                	ld	s0,16(sp)
    80203610:	6105                	addi	sp,sp,32
    80203612:	8082                	ret
    return fork();
    80203614:	fffff097          	auipc	ra,0xfffff
    80203618:	82e080e7          	jalr	-2002(ra) # 80201e42 <fork>
    8020361c:	87aa                	mv	a5,a0
    8020361e:	b7f5                	j	8020360a <sys_clone+0x5c>

0000000080203620 <sys_wait4>:

uint64
sys_wait4(void)
{
    80203620:	1101                	addi	sp,sp,-32
    80203622:	ec06                	sd	ra,24(sp)
    80203624:	e822                	sd	s0,16(sp)
    80203626:	1000                	addi	s0,sp,32
  uint64 status;
  int pid, options;
  if(argaddr(1, &status) < 0 || argint(0, &pid) < 0 || argint(2, &options) < 0){
    80203628:	fe840593          	addi	a1,s0,-24
    8020362c:	4505                	li	a0,1
    8020362e:	00000097          	auipc	ra,0x0
    80203632:	a96080e7          	jalr	-1386(ra) # 802030c4 <argaddr>
    return -1;}
    80203636:	57fd                	li	a5,-1
  if(argaddr(1, &status) < 0 || argint(0, &pid) < 0 || argint(2, &options) < 0){
    80203638:	04054d63          	bltz	a0,80203692 <sys_wait4+0x72>
    8020363c:	fe440593          	addi	a1,s0,-28
    80203640:	4501                	li	a0,0
    80203642:	00000097          	auipc	ra,0x0
    80203646:	a20080e7          	jalr	-1504(ra) # 80203062 <argint>
    return -1;}
    8020364a:	57fd                	li	a5,-1
  if(argaddr(1, &status) < 0 || argint(0, &pid) < 0 || argint(2, &options) < 0){
    8020364c:	04054363          	bltz	a0,80203692 <sys_wait4+0x72>
    80203650:	fe040593          	addi	a1,s0,-32
    80203654:	4509                	li	a0,2
    80203656:	00000097          	auipc	ra,0x0
    8020365a:	a0c080e7          	jalr	-1524(ra) # 80203062 <argint>
    return -1;}
    8020365e:	57fd                	li	a5,-1
  if(argaddr(1, &status) < 0 || argint(0, &pid) < 0 || argint(2, &options) < 0){
    80203660:	02054963          	bltz	a0,80203692 <sys_wait4+0x72>
  printf("Running: WAIT4 ... pid: %ld ... options: %ld\n", pid, options);
    80203664:	fe042603          	lw	a2,-32(s0)
    80203668:	fe442583          	lw	a1,-28(s0)
    8020366c:	00006517          	auipc	a0,0x6
    80203670:	4ec50513          	addi	a0,a0,1260 # 80209b58 <digits+0x7d8>
    80203674:	ffffd097          	auipc	ra,0xffffd
    80203678:	b1a080e7          	jalr	-1254(ra) # 8020018e <printf>
  return waitpid(pid, status, options);
    8020367c:	fe042603          	lw	a2,-32(s0)
    80203680:	fe843583          	ld	a1,-24(s0)
    80203684:	fe442503          	lw	a0,-28(s0)
    80203688:	fffff097          	auipc	ra,0xfffff
    8020368c:	140080e7          	jalr	320(ra) # 802027c8 <waitpid>
    80203690:	87aa                	mv	a5,a0
}
    80203692:	853e                	mv	a0,a5
    80203694:	60e2                	ld	ra,24(sp)
    80203696:	6442                	ld	s0,16(sp)
    80203698:	6105                	addi	sp,sp,32
    8020369a:	8082                	ret

000000008020369c <sys_execve>:

uint64
sys_execve(void)
{
    8020369c:	d9010113          	addi	sp,sp,-624
    802036a0:	26113423          	sd	ra,616(sp)
    802036a4:	26813023          	sd	s0,608(sp)
    802036a8:	24913c23          	sd	s1,600(sp)
    802036ac:	25213823          	sd	s2,592(sp)
    802036b0:	25313423          	sd	s3,584(sp)
    802036b4:	25413023          	sd	s4,576(sp)
    802036b8:	23513c23          	sd	s5,568(sp)
    802036bc:	23613823          	sd	s6,560(sp)
    802036c0:	23713423          	sd	s7,552(sp)
    802036c4:	1c80                	addi	s0,sp,624
  char path[FAT32_MAX_PATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    802036c6:	10400613          	li	a2,260
    802036ca:	ea840593          	addi	a1,s0,-344
    802036ce:	4501                	li	a0,0
    802036d0:	00000097          	auipc	ra,0x0
    802036d4:	a16080e7          	jalr	-1514(ra) # 802030e6 <argstr>
    return -1;
    802036d8:	597d                	li	s2,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    802036da:	0c054c63          	bltz	a0,802037b2 <sys_execve+0x116>
    802036de:	da040593          	addi	a1,s0,-608
    802036e2:	4505                	li	a0,1
    802036e4:	00000097          	auipc	ra,0x0
    802036e8:	9e0080e7          	jalr	-1568(ra) # 802030c4 <argaddr>
    802036ec:	0c054363          	bltz	a0,802037b2 <sys_execve+0x116>
  }
  memset(argv, 0, sizeof(argv));
    802036f0:	da840a13          	addi	s4,s0,-600
    802036f4:	10000613          	li	a2,256
    802036f8:	4581                	li	a1,0
    802036fa:	8552                	mv	a0,s4
    802036fc:	ffffd097          	auipc	ra,0xffffd
    80203700:	066080e7          	jalr	102(ra) # 80200762 <memset>
  for(i=0;; i++){
    if(i >= NELEM(argv)){
    80203704:	84d2                	mv	s1,s4
  memset(argv, 0, sizeof(argv));
    80203706:	89d2                	mv	s3,s4
    80203708:	4901                	li	s2,0
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    8020370a:	d9840a93          	addi	s5,s0,-616
    if(i >= NELEM(argv)){
    8020370e:	02000b13          	li	s6,32
    80203712:	00090b9b          	sext.w	s7,s2
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    80203716:	00391513          	slli	a0,s2,0x3
    8020371a:	85d6                	mv	a1,s5
    8020371c:	da043783          	ld	a5,-608(s0)
    80203720:	953e                	add	a0,a0,a5
    80203722:	00000097          	auipc	ra,0x0
    80203726:	8c0080e7          	jalr	-1856(ra) # 80202fe2 <fetchaddr>
    8020372a:	02054a63          	bltz	a0,8020375e <sys_execve+0xc2>
      goto bad;
    }
    if(uarg == 0){
    8020372e:	d9843783          	ld	a5,-616(s0)
    80203732:	c3b9                	beqz	a5,80203778 <sys_execve+0xdc>
      argv[i] = 0;
      break;
    }
    argv[i] = kalloc();
    80203734:	ffffd097          	auipc	ra,0xffffd
    80203738:	e26080e7          	jalr	-474(ra) # 8020055a <kalloc>
    8020373c:	85aa                	mv	a1,a0
    8020373e:	00a9b023          	sd	a0,0(s3)
    if(argv[i] == 0)
    80203742:	cd11                	beqz	a0,8020375e <sys_execve+0xc2>
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    80203744:	6605                	lui	a2,0x1
    80203746:	d9843503          	ld	a0,-616(s0)
    8020374a:	00000097          	auipc	ra,0x0
    8020374e:	8e8080e7          	jalr	-1816(ra) # 80203032 <fetchstr>
    80203752:	00054663          	bltz	a0,8020375e <sys_execve+0xc2>
    if(i >= NELEM(argv)){
    80203756:	0905                	addi	s2,s2,1
    80203758:	09a1                	addi	s3,s3,8
    8020375a:	fb691ce3          	bne	s2,s6,80203712 <sys_execve+0x76>
    kfree(argv[i]);

  return ret;

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8020375e:	100a0a13          	addi	s4,s4,256
    80203762:	6088                	ld	a0,0(s1)
    80203764:	c531                	beqz	a0,802037b0 <sys_execve+0x114>
    kfree(argv[i]);
    80203766:	ffffd097          	auipc	ra,0xffffd
    8020376a:	cda080e7          	jalr	-806(ra) # 80200440 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8020376e:	04a1                	addi	s1,s1,8
    80203770:	ff4499e3          	bne	s1,s4,80203762 <sys_execve+0xc6>
  return -1;
    80203774:	597d                	li	s2,-1
    80203776:	a835                	j	802037b2 <sys_execve+0x116>
      argv[i] = 0;
    80203778:	0b8e                	slli	s7,s7,0x3
    8020377a:	fb0b8793          	addi	a5,s7,-80
    8020377e:	00878bb3          	add	s7,a5,s0
    80203782:	de0bbc23          	sd	zero,-520(s7)
  int ret = exec(path, argv);
    80203786:	da840593          	addi	a1,s0,-600
    8020378a:	ea840513          	addi	a0,s0,-344
    8020378e:	00001097          	auipc	ra,0x1
    80203792:	c4c080e7          	jalr	-948(ra) # 802043da <exec>
    80203796:	892a                	mv	s2,a0
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80203798:	100a0a13          	addi	s4,s4,256
    8020379c:	6088                	ld	a0,0(s1)
    8020379e:	c911                	beqz	a0,802037b2 <sys_execve+0x116>
    kfree(argv[i]);
    802037a0:	ffffd097          	auipc	ra,0xffffd
    802037a4:	ca0080e7          	jalr	-864(ra) # 80200440 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    802037a8:	04a1                	addi	s1,s1,8
    802037aa:	ff4499e3          	bne	s1,s4,8020379c <sys_execve+0x100>
    802037ae:	a011                	j	802037b2 <sys_execve+0x116>
  return -1;
    802037b0:	597d                	li	s2,-1
}
    802037b2:	854a                	mv	a0,s2
    802037b4:	26813083          	ld	ra,616(sp)
    802037b8:	26013403          	ld	s0,608(sp)
    802037bc:	25813483          	ld	s1,600(sp)
    802037c0:	25013903          	ld	s2,592(sp)
    802037c4:	24813983          	ld	s3,584(sp)
    802037c8:	24013a03          	ld	s4,576(sp)
    802037cc:	23813a83          	ld	s5,568(sp)
    802037d0:	23013b03          	ld	s6,560(sp)
    802037d4:	22813b83          	ld	s7,552(sp)
    802037d8:	27010113          	addi	sp,sp,624
    802037dc:	8082                	ret

00000000802037de <sys_poweroff>:


// Power off QEMU
uint64
sys_poweroff(void)
{
    802037de:	1141                	addi	sp,sp,-16
    802037e0:	e406                	sd	ra,8(sp)
    802037e2:	e022                	sd	s0,0(sp)
    802037e4:	0800                	addi	s0,sp,16
  printf("Powering off...\n");
    802037e6:	00006517          	auipc	a0,0x6
    802037ea:	3a250513          	addi	a0,a0,930 # 80209b88 <digits+0x808>
    802037ee:	ffffd097          	auipc	ra,0xffffd
    802037f2:	9a0080e7          	jalr	-1632(ra) # 8020018e <printf>
	SBI_CALL_0(SBI_SHUTDOWN);
    802037f6:	4501                	li	a0,0
    802037f8:	4581                	li	a1,0
    802037fa:	4601                	li	a2,0
    802037fc:	4681                	li	a3,0
    802037fe:	48a1                	li	a7,8
    80203800:	00000073          	ecall
  sbi_shutdown();
  panic("sys_poweroff");
    80203804:	00006517          	auipc	a0,0x6
    80203808:	39c50513          	addi	a0,a0,924 # 80209ba0 <digits+0x820>
    8020380c:	ffffd097          	auipc	ra,0xffffd
    80203810:	938080e7          	jalr	-1736(ra) # 80200144 <panic>

0000000080203814 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
    80203814:	7139                	addi	sp,sp,-64
    80203816:	fc06                	sd	ra,56(sp)
    80203818:	f822                	sd	s0,48(sp)
    8020381a:	f426                	sd	s1,40(sp)
    8020381c:	f04a                	sd	s2,32(sp)
    8020381e:	ec4e                	sd	s3,24(sp)
    80203820:	e852                	sd	s4,16(sp)
    80203822:	e456                	sd	s5,8(sp)
    80203824:	0080                	addi	s0,sp,64
  struct buf *b;

  initlock(&bcache.lock, "bcache");
    80203826:	00006597          	auipc	a1,0x6
    8020382a:	38a58593          	addi	a1,a1,906 # 80209bb0 <digits+0x830>
    8020382e:	00015517          	auipc	a0,0x15
    80203832:	2c250513          	addi	a0,a0,706 # 80218af0 <bcache>
    80203836:	ffffd097          	auipc	ra,0xffffd
    8020383a:	e4c080e7          	jalr	-436(ra) # 80200682 <initlock>

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
    8020383e:	00019797          	auipc	a5,0x19
    80203842:	2b278793          	addi	a5,a5,690 # 8021caf0 <bcache+0x4000>
    80203846:	0001a717          	auipc	a4,0x1a
    8020384a:	91270713          	addi	a4,a4,-1774 # 8021d158 <bcache+0x4668>
    8020384e:	6ae7b823          	sd	a4,1712(a5)
  bcache.head.next = &bcache.head;
    80203852:	6ae7bc23          	sd	a4,1720(a5)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    80203856:	00015497          	auipc	s1,0x15
    8020385a:	2b248493          	addi	s1,s1,690 # 80218b08 <bcache+0x18>
    b->refcnt = 0;
    b->sectorno = ~0;
    8020385e:	5a7d                	li	s4,-1
    b->dev = ~0;
    b->next = bcache.head.next;
    80203860:	893e                	mv	s2,a5
    b->prev = &bcache.head;
    80203862:	89ba                	mv	s3,a4
    initsleeplock(&b->lock, "buffer");
    80203864:	00006a97          	auipc	s5,0x6
    80203868:	354a8a93          	addi	s5,s5,852 # 80209bb8 <digits+0x838>
    b->refcnt = 0;
    8020386c:	0404a023          	sw	zero,64(s1)
    b->sectorno = ~0;
    80203870:	0144a623          	sw	s4,12(s1)
    b->dev = ~0;
    80203874:	0144a423          	sw	s4,8(s1)
    b->next = bcache.head.next;
    80203878:	6b893783          	ld	a5,1720(s2)
    8020387c:	e8bc                	sd	a5,80(s1)
    b->prev = &bcache.head;
    8020387e:	0534b423          	sd	s3,72(s1)
    initsleeplock(&b->lock, "buffer");
    80203882:	85d6                	mv	a1,s5
    80203884:	01048513          	addi	a0,s1,16
    80203888:	00000097          	auipc	ra,0x0
    8020388c:	26e080e7          	jalr	622(ra) # 80203af6 <initsleeplock>
    bcache.head.next->prev = b;
    80203890:	6b893783          	ld	a5,1720(s2)
    80203894:	e7a4                	sd	s1,72(a5)
    bcache.head.next = b;
    80203896:	6a993c23          	sd	s1,1720(s2)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    8020389a:	25848493          	addi	s1,s1,600
    8020389e:	fd3497e3          	bne	s1,s3,8020386c <binit+0x58>
  }
  #ifdef DEBUG
  printf("binit\n");
  #endif
}
    802038a2:	70e2                	ld	ra,56(sp)
    802038a4:	7442                	ld	s0,48(sp)
    802038a6:	74a2                	ld	s1,40(sp)
    802038a8:	7902                	ld	s2,32(sp)
    802038aa:	69e2                	ld	s3,24(sp)
    802038ac:	6a42                	ld	s4,16(sp)
    802038ae:	6aa2                	ld	s5,8(sp)
    802038b0:	6121                	addi	sp,sp,64
    802038b2:	8082                	ret

00000000802038b4 <bread>:
  panic("bget: no buffers");
}

// Return a locked buf with the contents of the indicated block.
struct buf* 
bread(uint dev, uint sectorno) {
    802038b4:	7179                	addi	sp,sp,-48
    802038b6:	f406                	sd	ra,40(sp)
    802038b8:	f022                	sd	s0,32(sp)
    802038ba:	ec26                	sd	s1,24(sp)
    802038bc:	e84a                	sd	s2,16(sp)
    802038be:	e44e                	sd	s3,8(sp)
    802038c0:	1800                	addi	s0,sp,48
    802038c2:	892a                	mv	s2,a0
    802038c4:	89ae                	mv	s3,a1
  acquire(&bcache.lock);
    802038c6:	00015517          	auipc	a0,0x15
    802038ca:	22a50513          	addi	a0,a0,554 # 80218af0 <bcache>
    802038ce:	ffffd097          	auipc	ra,0xffffd
    802038d2:	df8080e7          	jalr	-520(ra) # 802006c6 <acquire>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    802038d6:	0001a497          	auipc	s1,0x1a
    802038da:	8d24b483          	ld	s1,-1838(s1) # 8021d1a8 <bcache+0x46b8>
    802038de:	0001a797          	auipc	a5,0x1a
    802038e2:	87a78793          	addi	a5,a5,-1926 # 8021d158 <bcache+0x4668>
    802038e6:	02f48f63          	beq	s1,a5,80203924 <bread+0x70>
    802038ea:	873e                	mv	a4,a5
    802038ec:	a021                	j	802038f4 <bread+0x40>
    802038ee:	68a4                	ld	s1,80(s1)
    802038f0:	02e48a63          	beq	s1,a4,80203924 <bread+0x70>
    if(b->dev == dev && b->sectorno == sectorno){
    802038f4:	449c                	lw	a5,8(s1)
    802038f6:	ff279ce3          	bne	a5,s2,802038ee <bread+0x3a>
    802038fa:	44dc                	lw	a5,12(s1)
    802038fc:	ff3799e3          	bne	a5,s3,802038ee <bread+0x3a>
      b->refcnt++;
    80203900:	40bc                	lw	a5,64(s1)
    80203902:	2785                	addiw	a5,a5,1
    80203904:	c0bc                	sw	a5,64(s1)
      release(&bcache.lock);
    80203906:	00015517          	auipc	a0,0x15
    8020390a:	1ea50513          	addi	a0,a0,490 # 80218af0 <bcache>
    8020390e:	ffffd097          	auipc	ra,0xffffd
    80203912:	e0c080e7          	jalr	-500(ra) # 8020071a <release>
      acquiresleep(&b->lock);
    80203916:	01048513          	addi	a0,s1,16
    8020391a:	00000097          	auipc	ra,0x0
    8020391e:	216080e7          	jalr	534(ra) # 80203b30 <acquiresleep>
      return b;
    80203922:	a8b9                	j	80203980 <bread+0xcc>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80203924:	0001a497          	auipc	s1,0x1a
    80203928:	87c4b483          	ld	s1,-1924(s1) # 8021d1a0 <bcache+0x46b0>
    8020392c:	0001a797          	auipc	a5,0x1a
    80203930:	82c78793          	addi	a5,a5,-2004 # 8021d158 <bcache+0x4668>
    80203934:	00f48863          	beq	s1,a5,80203944 <bread+0x90>
    80203938:	873e                	mv	a4,a5
    if(b->refcnt == 0) {
    8020393a:	40bc                	lw	a5,64(s1)
    8020393c:	cf81                	beqz	a5,80203954 <bread+0xa0>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    8020393e:	64a4                	ld	s1,72(s1)
    80203940:	fee49de3          	bne	s1,a4,8020393a <bread+0x86>
  panic("bget: no buffers");
    80203944:	00006517          	auipc	a0,0x6
    80203948:	27c50513          	addi	a0,a0,636 # 80209bc0 <digits+0x840>
    8020394c:	ffffc097          	auipc	ra,0xffffc
    80203950:	7f8080e7          	jalr	2040(ra) # 80200144 <panic>
      b->dev = dev;
    80203954:	0124a423          	sw	s2,8(s1)
      b->sectorno = sectorno;
    80203958:	0134a623          	sw	s3,12(s1)
      b->valid = 0;
    8020395c:	0004a023          	sw	zero,0(s1)
      b->refcnt = 1;
    80203960:	4785                	li	a5,1
    80203962:	c0bc                	sw	a5,64(s1)
      release(&bcache.lock);
    80203964:	00015517          	auipc	a0,0x15
    80203968:	18c50513          	addi	a0,a0,396 # 80218af0 <bcache>
    8020396c:	ffffd097          	auipc	ra,0xffffd
    80203970:	dae080e7          	jalr	-594(ra) # 8020071a <release>
      acquiresleep(&b->lock);
    80203974:	01048513          	addi	a0,s1,16
    80203978:	00000097          	auipc	ra,0x0
    8020397c:	1b8080e7          	jalr	440(ra) # 80203b30 <acquiresleep>
  struct buf *b;

  b = bget(dev, sectorno);
  if (!b->valid) {
    80203980:	409c                	lw	a5,0(s1)
    80203982:	cb89                	beqz	a5,80203994 <bread+0xe0>
    disk_read(b);
    b->valid = 1;
  }

  return b;
}
    80203984:	8526                	mv	a0,s1
    80203986:	70a2                	ld	ra,40(sp)
    80203988:	7402                	ld	s0,32(sp)
    8020398a:	64e2                	ld	s1,24(sp)
    8020398c:	6942                	ld	s2,16(sp)
    8020398e:	69a2                	ld	s3,8(sp)
    80203990:	6145                	addi	sp,sp,48
    80203992:	8082                	ret
    disk_read(b);
    80203994:	8526                	mv	a0,s1
    80203996:	00002097          	auipc	ra,0x2
    8020399a:	eac080e7          	jalr	-340(ra) # 80205842 <disk_read>
    b->valid = 1;
    8020399e:	4785                	li	a5,1
    802039a0:	c09c                	sw	a5,0(s1)
  return b;
    802039a2:	b7cd                	j	80203984 <bread+0xd0>

00000000802039a4 <bwrite>:

// Write b's contents to disk.  Must be locked.
void 
bwrite(struct buf *b) {
    802039a4:	1101                	addi	sp,sp,-32
    802039a6:	ec06                	sd	ra,24(sp)
    802039a8:	e822                	sd	s0,16(sp)
    802039aa:	e426                	sd	s1,8(sp)
    802039ac:	1000                	addi	s0,sp,32
    802039ae:	84aa                	mv	s1,a0
  if(!holdingsleep(&b->lock))
    802039b0:	0541                	addi	a0,a0,16
    802039b2:	00000097          	auipc	ra,0x0
    802039b6:	218080e7          	jalr	536(ra) # 80203bca <holdingsleep>
    802039ba:	c919                	beqz	a0,802039d0 <bwrite+0x2c>
    panic("bwrite");
  disk_write(b);
    802039bc:	8526                	mv	a0,s1
    802039be:	00002097          	auipc	ra,0x2
    802039c2:	e9e080e7          	jalr	-354(ra) # 8020585c <disk_write>
}
    802039c6:	60e2                	ld	ra,24(sp)
    802039c8:	6442                	ld	s0,16(sp)
    802039ca:	64a2                	ld	s1,8(sp)
    802039cc:	6105                	addi	sp,sp,32
    802039ce:	8082                	ret
    panic("bwrite");
    802039d0:	00006517          	auipc	a0,0x6
    802039d4:	20850513          	addi	a0,a0,520 # 80209bd8 <digits+0x858>
    802039d8:	ffffc097          	auipc	ra,0xffffc
    802039dc:	76c080e7          	jalr	1900(ra) # 80200144 <panic>

00000000802039e0 <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
    802039e0:	1101                	addi	sp,sp,-32
    802039e2:	ec06                	sd	ra,24(sp)
    802039e4:	e822                	sd	s0,16(sp)
    802039e6:	e426                	sd	s1,8(sp)
    802039e8:	e04a                	sd	s2,0(sp)
    802039ea:	1000                	addi	s0,sp,32
    802039ec:	84aa                	mv	s1,a0
  if(!holdingsleep(&b->lock))
    802039ee:	01050913          	addi	s2,a0,16
    802039f2:	854a                	mv	a0,s2
    802039f4:	00000097          	auipc	ra,0x0
    802039f8:	1d6080e7          	jalr	470(ra) # 80203bca <holdingsleep>
    802039fc:	c92d                	beqz	a0,80203a6e <brelse+0x8e>
    panic("brelse");

  releasesleep(&b->lock);
    802039fe:	854a                	mv	a0,s2
    80203a00:	00000097          	auipc	ra,0x0
    80203a04:	186080e7          	jalr	390(ra) # 80203b86 <releasesleep>

  acquire(&bcache.lock);
    80203a08:	00015517          	auipc	a0,0x15
    80203a0c:	0e850513          	addi	a0,a0,232 # 80218af0 <bcache>
    80203a10:	ffffd097          	auipc	ra,0xffffd
    80203a14:	cb6080e7          	jalr	-842(ra) # 802006c6 <acquire>
  b->refcnt--;
    80203a18:	40bc                	lw	a5,64(s1)
    80203a1a:	37fd                	addiw	a5,a5,-1
    80203a1c:	0007871b          	sext.w	a4,a5
    80203a20:	c0bc                	sw	a5,64(s1)
  if (b->refcnt == 0) {
    80203a22:	eb05                	bnez	a4,80203a52 <brelse+0x72>
    // no one is waiting for it.
    b->next->prev = b->prev;
    80203a24:	68bc                	ld	a5,80(s1)
    80203a26:	64b8                	ld	a4,72(s1)
    80203a28:	e7b8                	sd	a4,72(a5)
    b->prev->next = b->next;
    80203a2a:	64bc                	ld	a5,72(s1)
    80203a2c:	68b8                	ld	a4,80(s1)
    80203a2e:	ebb8                	sd	a4,80(a5)
    b->next = bcache.head.next;
    80203a30:	00019797          	auipc	a5,0x19
    80203a34:	0c078793          	addi	a5,a5,192 # 8021caf0 <bcache+0x4000>
    80203a38:	6b87b703          	ld	a4,1720(a5)
    80203a3c:	e8b8                	sd	a4,80(s1)
    b->prev = &bcache.head;
    80203a3e:	00019717          	auipc	a4,0x19
    80203a42:	71a70713          	addi	a4,a4,1818 # 8021d158 <bcache+0x4668>
    80203a46:	e4b8                	sd	a4,72(s1)
    bcache.head.next->prev = b;
    80203a48:	6b87b703          	ld	a4,1720(a5)
    80203a4c:	e724                	sd	s1,72(a4)
    bcache.head.next = b;
    80203a4e:	6a97bc23          	sd	s1,1720(a5)
  }
  
  release(&bcache.lock);
    80203a52:	00015517          	auipc	a0,0x15
    80203a56:	09e50513          	addi	a0,a0,158 # 80218af0 <bcache>
    80203a5a:	ffffd097          	auipc	ra,0xffffd
    80203a5e:	cc0080e7          	jalr	-832(ra) # 8020071a <release>
}
    80203a62:	60e2                	ld	ra,24(sp)
    80203a64:	6442                	ld	s0,16(sp)
    80203a66:	64a2                	ld	s1,8(sp)
    80203a68:	6902                	ld	s2,0(sp)
    80203a6a:	6105                	addi	sp,sp,32
    80203a6c:	8082                	ret
    panic("brelse");
    80203a6e:	00006517          	auipc	a0,0x6
    80203a72:	17250513          	addi	a0,a0,370 # 80209be0 <digits+0x860>
    80203a76:	ffffc097          	auipc	ra,0xffffc
    80203a7a:	6ce080e7          	jalr	1742(ra) # 80200144 <panic>

0000000080203a7e <bpin>:

void
bpin(struct buf *b) {
    80203a7e:	1101                	addi	sp,sp,-32
    80203a80:	ec06                	sd	ra,24(sp)
    80203a82:	e822                	sd	s0,16(sp)
    80203a84:	e426                	sd	s1,8(sp)
    80203a86:	1000                	addi	s0,sp,32
    80203a88:	84aa                	mv	s1,a0
  acquire(&bcache.lock);
    80203a8a:	00015517          	auipc	a0,0x15
    80203a8e:	06650513          	addi	a0,a0,102 # 80218af0 <bcache>
    80203a92:	ffffd097          	auipc	ra,0xffffd
    80203a96:	c34080e7          	jalr	-972(ra) # 802006c6 <acquire>
  b->refcnt++;
    80203a9a:	40bc                	lw	a5,64(s1)
    80203a9c:	2785                	addiw	a5,a5,1
    80203a9e:	c0bc                	sw	a5,64(s1)
  release(&bcache.lock);
    80203aa0:	00015517          	auipc	a0,0x15
    80203aa4:	05050513          	addi	a0,a0,80 # 80218af0 <bcache>
    80203aa8:	ffffd097          	auipc	ra,0xffffd
    80203aac:	c72080e7          	jalr	-910(ra) # 8020071a <release>
}
    80203ab0:	60e2                	ld	ra,24(sp)
    80203ab2:	6442                	ld	s0,16(sp)
    80203ab4:	64a2                	ld	s1,8(sp)
    80203ab6:	6105                	addi	sp,sp,32
    80203ab8:	8082                	ret

0000000080203aba <bunpin>:

void
bunpin(struct buf *b) {
    80203aba:	1101                	addi	sp,sp,-32
    80203abc:	ec06                	sd	ra,24(sp)
    80203abe:	e822                	sd	s0,16(sp)
    80203ac0:	e426                	sd	s1,8(sp)
    80203ac2:	1000                	addi	s0,sp,32
    80203ac4:	84aa                	mv	s1,a0
  acquire(&bcache.lock);
    80203ac6:	00015517          	auipc	a0,0x15
    80203aca:	02a50513          	addi	a0,a0,42 # 80218af0 <bcache>
    80203ace:	ffffd097          	auipc	ra,0xffffd
    80203ad2:	bf8080e7          	jalr	-1032(ra) # 802006c6 <acquire>
  b->refcnt--;
    80203ad6:	40bc                	lw	a5,64(s1)
    80203ad8:	37fd                	addiw	a5,a5,-1
    80203ada:	c0bc                	sw	a5,64(s1)
  release(&bcache.lock);
    80203adc:	00015517          	auipc	a0,0x15
    80203ae0:	01450513          	addi	a0,a0,20 # 80218af0 <bcache>
    80203ae4:	ffffd097          	auipc	ra,0xffffd
    80203ae8:	c36080e7          	jalr	-970(ra) # 8020071a <release>
}
    80203aec:	60e2                	ld	ra,24(sp)
    80203aee:	6442                	ld	s0,16(sp)
    80203af0:	64a2                	ld	s1,8(sp)
    80203af2:	6105                	addi	sp,sp,32
    80203af4:	8082                	ret

0000000080203af6 <initsleeplock>:
#include "include/proc.h"
#include "include/sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
    80203af6:	1101                	addi	sp,sp,-32
    80203af8:	ec06                	sd	ra,24(sp)
    80203afa:	e822                	sd	s0,16(sp)
    80203afc:	e426                	sd	s1,8(sp)
    80203afe:	e04a                	sd	s2,0(sp)
    80203b00:	1000                	addi	s0,sp,32
    80203b02:	84aa                	mv	s1,a0
    80203b04:	892e                	mv	s2,a1
  initlock(&lk->lk, "sleep lock");
    80203b06:	00006597          	auipc	a1,0x6
    80203b0a:	0e258593          	addi	a1,a1,226 # 80209be8 <digits+0x868>
    80203b0e:	0521                	addi	a0,a0,8
    80203b10:	ffffd097          	auipc	ra,0xffffd
    80203b14:	b72080e7          	jalr	-1166(ra) # 80200682 <initlock>
  lk->name = name;
    80203b18:	0324b023          	sd	s2,32(s1)
  lk->locked = 0;
    80203b1c:	0004a023          	sw	zero,0(s1)
  lk->pid = 0;
    80203b20:	0204a423          	sw	zero,40(s1)
}
    80203b24:	60e2                	ld	ra,24(sp)
    80203b26:	6442                	ld	s0,16(sp)
    80203b28:	64a2                	ld	s1,8(sp)
    80203b2a:	6902                	ld	s2,0(sp)
    80203b2c:	6105                	addi	sp,sp,32
    80203b2e:	8082                	ret

0000000080203b30 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
    80203b30:	1101                	addi	sp,sp,-32
    80203b32:	ec06                	sd	ra,24(sp)
    80203b34:	e822                	sd	s0,16(sp)
    80203b36:	e426                	sd	s1,8(sp)
    80203b38:	e04a                	sd	s2,0(sp)
    80203b3a:	1000                	addi	s0,sp,32
    80203b3c:	84aa                	mv	s1,a0
  acquire(&lk->lk);
    80203b3e:	00850913          	addi	s2,a0,8
    80203b42:	854a                	mv	a0,s2
    80203b44:	ffffd097          	auipc	ra,0xffffd
    80203b48:	b82080e7          	jalr	-1150(ra) # 802006c6 <acquire>
  while (lk->locked) {
    80203b4c:	409c                	lw	a5,0(s1)
    80203b4e:	cb89                	beqz	a5,80203b60 <acquiresleep+0x30>
    sleep(lk, &lk->lk);
    80203b50:	85ca                	mv	a1,s2
    80203b52:	8526                	mv	a0,s1
    80203b54:	ffffe097          	auipc	ra,0xffffe
    80203b58:	78c080e7          	jalr	1932(ra) # 802022e0 <sleep>
  while (lk->locked) {
    80203b5c:	409c                	lw	a5,0(s1)
    80203b5e:	fbed                	bnez	a5,80203b50 <acquiresleep+0x20>
  }
  lk->locked = 1;
    80203b60:	4785                	li	a5,1
    80203b62:	c09c                	sw	a5,0(s1)
  lk->pid = myproc()->pid;
    80203b64:	ffffe097          	auipc	ra,0xffffe
    80203b68:	ed8080e7          	jalr	-296(ra) # 80201a3c <myproc>
    80203b6c:	5d1c                	lw	a5,56(a0)
    80203b6e:	d49c                	sw	a5,40(s1)
  release(&lk->lk);
    80203b70:	854a                	mv	a0,s2
    80203b72:	ffffd097          	auipc	ra,0xffffd
    80203b76:	ba8080e7          	jalr	-1112(ra) # 8020071a <release>
}
    80203b7a:	60e2                	ld	ra,24(sp)
    80203b7c:	6442                	ld	s0,16(sp)
    80203b7e:	64a2                	ld	s1,8(sp)
    80203b80:	6902                	ld	s2,0(sp)
    80203b82:	6105                	addi	sp,sp,32
    80203b84:	8082                	ret

0000000080203b86 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
    80203b86:	1101                	addi	sp,sp,-32
    80203b88:	ec06                	sd	ra,24(sp)
    80203b8a:	e822                	sd	s0,16(sp)
    80203b8c:	e426                	sd	s1,8(sp)
    80203b8e:	e04a                	sd	s2,0(sp)
    80203b90:	1000                	addi	s0,sp,32
    80203b92:	84aa                	mv	s1,a0
  acquire(&lk->lk);
    80203b94:	00850913          	addi	s2,a0,8
    80203b98:	854a                	mv	a0,s2
    80203b9a:	ffffd097          	auipc	ra,0xffffd
    80203b9e:	b2c080e7          	jalr	-1236(ra) # 802006c6 <acquire>
  lk->locked = 0;
    80203ba2:	0004a023          	sw	zero,0(s1)
  lk->pid = 0;
    80203ba6:	0204a423          	sw	zero,40(s1)
  wakeup(lk);
    80203baa:	8526                	mv	a0,s1
    80203bac:	fffff097          	auipc	ra,0xfffff
    80203bb0:	8b0080e7          	jalr	-1872(ra) # 8020245c <wakeup>
  release(&lk->lk);
    80203bb4:	854a                	mv	a0,s2
    80203bb6:	ffffd097          	auipc	ra,0xffffd
    80203bba:	b64080e7          	jalr	-1180(ra) # 8020071a <release>
}
    80203bbe:	60e2                	ld	ra,24(sp)
    80203bc0:	6442                	ld	s0,16(sp)
    80203bc2:	64a2                	ld	s1,8(sp)
    80203bc4:	6902                	ld	s2,0(sp)
    80203bc6:	6105                	addi	sp,sp,32
    80203bc8:	8082                	ret

0000000080203bca <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
    80203bca:	7179                	addi	sp,sp,-48
    80203bcc:	f406                	sd	ra,40(sp)
    80203bce:	f022                	sd	s0,32(sp)
    80203bd0:	ec26                	sd	s1,24(sp)
    80203bd2:	e84a                	sd	s2,16(sp)
    80203bd4:	e44e                	sd	s3,8(sp)
    80203bd6:	1800                	addi	s0,sp,48
    80203bd8:	84aa                	mv	s1,a0
  int r;
  
  acquire(&lk->lk);
    80203bda:	00850913          	addi	s2,a0,8
    80203bde:	854a                	mv	a0,s2
    80203be0:	ffffd097          	auipc	ra,0xffffd
    80203be4:	ae6080e7          	jalr	-1306(ra) # 802006c6 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
    80203be8:	409c                	lw	a5,0(s1)
    80203bea:	ef99                	bnez	a5,80203c08 <holdingsleep+0x3e>
    80203bec:	4481                	li	s1,0
  release(&lk->lk);
    80203bee:	854a                	mv	a0,s2
    80203bf0:	ffffd097          	auipc	ra,0xffffd
    80203bf4:	b2a080e7          	jalr	-1238(ra) # 8020071a <release>
  return r;
}
    80203bf8:	8526                	mv	a0,s1
    80203bfa:	70a2                	ld	ra,40(sp)
    80203bfc:	7402                	ld	s0,32(sp)
    80203bfe:	64e2                	ld	s1,24(sp)
    80203c00:	6942                	ld	s2,16(sp)
    80203c02:	69a2                	ld	s3,8(sp)
    80203c04:	6145                	addi	sp,sp,48
    80203c06:	8082                	ret
  r = lk->locked && (lk->pid == myproc()->pid);
    80203c08:	0284a983          	lw	s3,40(s1)
    80203c0c:	ffffe097          	auipc	ra,0xffffe
    80203c10:	e30080e7          	jalr	-464(ra) # 80201a3c <myproc>
    80203c14:	5d04                	lw	s1,56(a0)
    80203c16:	413484b3          	sub	s1,s1,s3
    80203c1a:	0014b493          	seqz	s1,s1
    80203c1e:	bfc1                	j	80203bee <holdingsleep+0x24>

0000000080203c20 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
    80203c20:	1101                	addi	sp,sp,-32
    80203c22:	ec06                	sd	ra,24(sp)
    80203c24:	e822                	sd	s0,16(sp)
    80203c26:	e426                	sd	s1,8(sp)
    80203c28:	e04a                	sd	s2,0(sp)
    80203c2a:	1000                	addi	s0,sp,32
  initlock(&ftable.lock, "ftable");
    80203c2c:	00006597          	auipc	a1,0x6
    80203c30:	fcc58593          	addi	a1,a1,-52 # 80209bf8 <digits+0x878>
    80203c34:	0001a517          	auipc	a0,0x1a
    80203c38:	81c50513          	addi	a0,a0,-2020 # 8021d450 <ftable>
    80203c3c:	ffffd097          	auipc	ra,0xffffd
    80203c40:	a46080e7          	jalr	-1466(ra) # 80200682 <initlock>
  struct file *f;
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203c44:	0001a497          	auipc	s1,0x1a
    80203c48:	82448493          	addi	s1,s1,-2012 # 8021d468 <ftable+0x18>
    80203c4c:	0001a917          	auipc	s2,0x1a
    80203c50:	7bc90913          	addi	s2,s2,1980 # 8021e408 <tickslock>
    memset(f, 0, sizeof(struct file));
    80203c54:	02800613          	li	a2,40
    80203c58:	4581                	li	a1,0
    80203c5a:	8526                	mv	a0,s1
    80203c5c:	ffffd097          	auipc	ra,0xffffd
    80203c60:	b06080e7          	jalr	-1274(ra) # 80200762 <memset>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203c64:	02848493          	addi	s1,s1,40
    80203c68:	ff2496e3          	bne	s1,s2,80203c54 <fileinit+0x34>
  }
  #ifdef DEBUG
  printf("fileinit\n");
  #endif
}
    80203c6c:	60e2                	ld	ra,24(sp)
    80203c6e:	6442                	ld	s0,16(sp)
    80203c70:	64a2                	ld	s1,8(sp)
    80203c72:	6902                	ld	s2,0(sp)
    80203c74:	6105                	addi	sp,sp,32
    80203c76:	8082                	ret

0000000080203c78 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
    80203c78:	1101                	addi	sp,sp,-32
    80203c7a:	ec06                	sd	ra,24(sp)
    80203c7c:	e822                	sd	s0,16(sp)
    80203c7e:	e426                	sd	s1,8(sp)
    80203c80:	1000                	addi	s0,sp,32
  struct file *f;

  acquire(&ftable.lock);
    80203c82:	00019517          	auipc	a0,0x19
    80203c86:	7ce50513          	addi	a0,a0,1998 # 8021d450 <ftable>
    80203c8a:	ffffd097          	auipc	ra,0xffffd
    80203c8e:	a3c080e7          	jalr	-1476(ra) # 802006c6 <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203c92:	00019497          	auipc	s1,0x19
    80203c96:	7d648493          	addi	s1,s1,2006 # 8021d468 <ftable+0x18>
    80203c9a:	0001a717          	auipc	a4,0x1a
    80203c9e:	76e70713          	addi	a4,a4,1902 # 8021e408 <tickslock>
    if(f->ref == 0){
    80203ca2:	40dc                	lw	a5,4(s1)
    80203ca4:	cf99                	beqz	a5,80203cc2 <filealloc+0x4a>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203ca6:	02848493          	addi	s1,s1,40
    80203caa:	fee49ce3          	bne	s1,a4,80203ca2 <filealloc+0x2a>
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
    80203cae:	00019517          	auipc	a0,0x19
    80203cb2:	7a250513          	addi	a0,a0,1954 # 8021d450 <ftable>
    80203cb6:	ffffd097          	auipc	ra,0xffffd
    80203cba:	a64080e7          	jalr	-1436(ra) # 8020071a <release>
  return NULL;
    80203cbe:	4481                	li	s1,0
    80203cc0:	a819                	j	80203cd6 <filealloc+0x5e>
      f->ref = 1;
    80203cc2:	4785                	li	a5,1
    80203cc4:	c0dc                	sw	a5,4(s1)
      release(&ftable.lock);
    80203cc6:	00019517          	auipc	a0,0x19
    80203cca:	78a50513          	addi	a0,a0,1930 # 8021d450 <ftable>
    80203cce:	ffffd097          	auipc	ra,0xffffd
    80203cd2:	a4c080e7          	jalr	-1460(ra) # 8020071a <release>
}
    80203cd6:	8526                	mv	a0,s1
    80203cd8:	60e2                	ld	ra,24(sp)
    80203cda:	6442                	ld	s0,16(sp)
    80203cdc:	64a2                	ld	s1,8(sp)
    80203cde:	6105                	addi	sp,sp,32
    80203ce0:	8082                	ret

0000000080203ce2 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
    80203ce2:	1101                	addi	sp,sp,-32
    80203ce4:	ec06                	sd	ra,24(sp)
    80203ce6:	e822                	sd	s0,16(sp)
    80203ce8:	e426                	sd	s1,8(sp)
    80203cea:	1000                	addi	s0,sp,32
    80203cec:	84aa                	mv	s1,a0
  acquire(&ftable.lock);
    80203cee:	00019517          	auipc	a0,0x19
    80203cf2:	76250513          	addi	a0,a0,1890 # 8021d450 <ftable>
    80203cf6:	ffffd097          	auipc	ra,0xffffd
    80203cfa:	9d0080e7          	jalr	-1584(ra) # 802006c6 <acquire>
  if(f->ref < 1)
    80203cfe:	40dc                	lw	a5,4(s1)
    80203d00:	02f05263          	blez	a5,80203d24 <filedup+0x42>
    panic("filedup");
  f->ref++;
    80203d04:	2785                	addiw	a5,a5,1
    80203d06:	c0dc                	sw	a5,4(s1)
  release(&ftable.lock);
    80203d08:	00019517          	auipc	a0,0x19
    80203d0c:	74850513          	addi	a0,a0,1864 # 8021d450 <ftable>
    80203d10:	ffffd097          	auipc	ra,0xffffd
    80203d14:	a0a080e7          	jalr	-1526(ra) # 8020071a <release>
  return f;
}
    80203d18:	8526                	mv	a0,s1
    80203d1a:	60e2                	ld	ra,24(sp)
    80203d1c:	6442                	ld	s0,16(sp)
    80203d1e:	64a2                	ld	s1,8(sp)
    80203d20:	6105                	addi	sp,sp,32
    80203d22:	8082                	ret
    panic("filedup");
    80203d24:	00006517          	auipc	a0,0x6
    80203d28:	edc50513          	addi	a0,a0,-292 # 80209c00 <digits+0x880>
    80203d2c:	ffffc097          	auipc	ra,0xffffc
    80203d30:	418080e7          	jalr	1048(ra) # 80200144 <panic>

0000000080203d34 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
    80203d34:	7139                	addi	sp,sp,-64
    80203d36:	fc06                	sd	ra,56(sp)
    80203d38:	f822                	sd	s0,48(sp)
    80203d3a:	f426                	sd	s1,40(sp)
    80203d3c:	f04a                	sd	s2,32(sp)
    80203d3e:	ec4e                	sd	s3,24(sp)
    80203d40:	e852                	sd	s4,16(sp)
    80203d42:	e456                	sd	s5,8(sp)
    80203d44:	0080                	addi	s0,sp,64
    80203d46:	84aa                	mv	s1,a0
  struct file ff;

  acquire(&ftable.lock);
    80203d48:	00019517          	auipc	a0,0x19
    80203d4c:	70850513          	addi	a0,a0,1800 # 8021d450 <ftable>
    80203d50:	ffffd097          	auipc	ra,0xffffd
    80203d54:	976080e7          	jalr	-1674(ra) # 802006c6 <acquire>
  if(f->ref < 1)
    80203d58:	40dc                	lw	a5,4(s1)
    80203d5a:	04f05863          	blez	a5,80203daa <fileclose+0x76>
    panic("fileclose");
  if(--f->ref > 0){
    80203d5e:	37fd                	addiw	a5,a5,-1
    80203d60:	0007871b          	sext.w	a4,a5
    80203d64:	c0dc                	sw	a5,4(s1)
    80203d66:	04e04a63          	bgtz	a4,80203dba <fileclose+0x86>
    release(&ftable.lock);
    return;
  }
  ff = *f;
    80203d6a:	0004a903          	lw	s2,0(s1)
    80203d6e:	0094ca03          	lbu	s4,9(s1)
    80203d72:	0104b983          	ld	s3,16(s1)
    80203d76:	0184ba83          	ld	s5,24(s1)
  f->ref = 0;
    80203d7a:	0004a223          	sw	zero,4(s1)
  f->type = FD_NONE;
    80203d7e:	0004a023          	sw	zero,0(s1)
  release(&ftable.lock);
    80203d82:	00019517          	auipc	a0,0x19
    80203d86:	6ce50513          	addi	a0,a0,1742 # 8021d450 <ftable>
    80203d8a:	ffffd097          	auipc	ra,0xffffd
    80203d8e:	990080e7          	jalr	-1648(ra) # 8020071a <release>

  if(ff.type == FD_PIPE){
    80203d92:	4785                	li	a5,1
    80203d94:	04f90463          	beq	s2,a5,80203ddc <fileclose+0xa8>
    pipeclose(ff.pipe, ff.writable);
  } else if(ff.type == FD_ENTRY){
    80203d98:	4789                	li	a5,2
    80203d9a:	02f91863          	bne	s2,a5,80203dca <fileclose+0x96>
    eput(ff.ep);
    80203d9e:	8556                	mv	a0,s5
    80203da0:	00003097          	auipc	ra,0x3
    80203da4:	d50080e7          	jalr	-688(ra) # 80206af0 <eput>
    80203da8:	a00d                	j	80203dca <fileclose+0x96>
    panic("fileclose");
    80203daa:	00006517          	auipc	a0,0x6
    80203dae:	e5e50513          	addi	a0,a0,-418 # 80209c08 <digits+0x888>
    80203db2:	ffffc097          	auipc	ra,0xffffc
    80203db6:	392080e7          	jalr	914(ra) # 80200144 <panic>
    release(&ftable.lock);
    80203dba:	00019517          	auipc	a0,0x19
    80203dbe:	69650513          	addi	a0,a0,1686 # 8021d450 <ftable>
    80203dc2:	ffffd097          	auipc	ra,0xffffd
    80203dc6:	958080e7          	jalr	-1704(ra) # 8020071a <release>
  } else if (ff.type == FD_DEVICE) {

  }
}
    80203dca:	70e2                	ld	ra,56(sp)
    80203dcc:	7442                	ld	s0,48(sp)
    80203dce:	74a2                	ld	s1,40(sp)
    80203dd0:	7902                	ld	s2,32(sp)
    80203dd2:	69e2                	ld	s3,24(sp)
    80203dd4:	6a42                	ld	s4,16(sp)
    80203dd6:	6aa2                	ld	s5,8(sp)
    80203dd8:	6121                	addi	sp,sp,64
    80203dda:	8082                	ret
    pipeclose(ff.pipe, ff.writable);
    80203ddc:	85d2                	mv	a1,s4
    80203dde:	854e                	mv	a0,s3
    80203de0:	00000097          	auipc	ra,0x0
    80203de4:	3a0080e7          	jalr	928(ra) # 80204180 <pipeclose>
    80203de8:	b7cd                	j	80203dca <fileclose+0x96>

0000000080203dea <filestat>:
filestat(struct file *f, uint64 addr)
{
  // struct proc *p = myproc();
  struct stat st;
  
  if(f->type == FD_ENTRY){
    80203dea:	4118                	lw	a4,0(a0)
    80203dec:	4789                	li	a5,2
    80203dee:	04f71e63          	bne	a4,a5,80203e4a <filestat+0x60>
{
    80203df2:	7159                	addi	sp,sp,-112
    80203df4:	f486                	sd	ra,104(sp)
    80203df6:	f0a2                	sd	s0,96(sp)
    80203df8:	eca6                	sd	s1,88(sp)
    80203dfa:	e8ca                	sd	s2,80(sp)
    80203dfc:	e4ce                	sd	s3,72(sp)
    80203dfe:	1880                	addi	s0,sp,112
    80203e00:	84aa                	mv	s1,a0
    80203e02:	892e                	mv	s2,a1
    elock(f->ep);
    80203e04:	6d08                	ld	a0,24(a0)
    80203e06:	00003097          	auipc	ra,0x3
    80203e0a:	c66080e7          	jalr	-922(ra) # 80206a6c <elock>
    estat(f->ep, &st);
    80203e0e:	f9840993          	addi	s3,s0,-104
    80203e12:	85ce                	mv	a1,s3
    80203e14:	6c88                	ld	a0,24(s1)
    80203e16:	00003097          	auipc	ra,0x3
    80203e1a:	e12080e7          	jalr	-494(ra) # 80206c28 <estat>
    eunlock(f->ep);
    80203e1e:	6c88                	ld	a0,24(s1)
    80203e20:	00003097          	auipc	ra,0x3
    80203e24:	c82080e7          	jalr	-894(ra) # 80206aa2 <eunlock>
    // if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    80203e28:	03800613          	li	a2,56
    80203e2c:	85ce                	mv	a1,s3
    80203e2e:	854a                	mv	a0,s2
    80203e30:	ffffd097          	auipc	ra,0xffffd
    80203e34:	542080e7          	jalr	1346(ra) # 80201372 <copyout2>
    80203e38:	41f5551b          	sraiw	a0,a0,0x1f
      return -1;
    return 0;
  }
  return -1;
}
    80203e3c:	70a6                	ld	ra,104(sp)
    80203e3e:	7406                	ld	s0,96(sp)
    80203e40:	64e6                	ld	s1,88(sp)
    80203e42:	6946                	ld	s2,80(sp)
    80203e44:	69a6                	ld	s3,72(sp)
    80203e46:	6165                	addi	sp,sp,112
    80203e48:	8082                	ret
  return -1;
    80203e4a:	557d                	li	a0,-1
}
    80203e4c:	8082                	ret

0000000080203e4e <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
    80203e4e:	7179                	addi	sp,sp,-48
    80203e50:	f406                	sd	ra,40(sp)
    80203e52:	f022                	sd	s0,32(sp)
    80203e54:	ec26                	sd	s1,24(sp)
    80203e56:	e84a                	sd	s2,16(sp)
    80203e58:	e44e                	sd	s3,8(sp)
    80203e5a:	1800                	addi	s0,sp,48
  int r = 0;

  if(f->readable == 0)
    80203e5c:	00854783          	lbu	a5,8(a0)
    80203e60:	c3d5                	beqz	a5,80203f04 <fileread+0xb6>
    80203e62:	84aa                	mv	s1,a0
    80203e64:	89ae                	mv	s3,a1
    80203e66:	8932                	mv	s2,a2
    return -1;

  switch (f->type) {
    80203e68:	411c                	lw	a5,0(a0)
    80203e6a:	4709                	li	a4,2
    80203e6c:	06e78263          	beq	a5,a4,80203ed0 <fileread+0x82>
    80203e70:	470d                	li	a4,3
    80203e72:	02e78b63          	beq	a5,a4,80203ea8 <fileread+0x5a>
    80203e76:	4705                	li	a4,1
    80203e78:	00e78a63          	beq	a5,a4,80203e8c <fileread+0x3e>
          if((r = eread(f->ep, 1, addr, f->off, n)) > 0)
            f->off += r;
        eunlock(f->ep);
        break;
    default:
      panic("fileread");
    80203e7c:	00006517          	auipc	a0,0x6
    80203e80:	d9c50513          	addi	a0,a0,-612 # 80209c18 <digits+0x898>
    80203e84:	ffffc097          	auipc	ra,0xffffc
    80203e88:	2c0080e7          	jalr	704(ra) # 80200144 <panic>
        r = piperead(f->pipe, addr, n);
    80203e8c:	6908                	ld	a0,16(a0)
    80203e8e:	00000097          	auipc	ra,0x0
    80203e92:	466080e7          	jalr	1126(ra) # 802042f4 <piperead>
    80203e96:	892a                	mv	s2,a0
  }

  return r;
}
    80203e98:	854a                	mv	a0,s2
    80203e9a:	70a2                	ld	ra,40(sp)
    80203e9c:	7402                	ld	s0,32(sp)
    80203e9e:	64e2                	ld	s1,24(sp)
    80203ea0:	6942                	ld	s2,16(sp)
    80203ea2:	69a2                	ld	s3,8(sp)
    80203ea4:	6145                	addi	sp,sp,48
    80203ea6:	8082                	ret
        if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
    80203ea8:	02451783          	lh	a5,36(a0)
    80203eac:	03079693          	slli	a3,a5,0x30
    80203eb0:	92c1                	srli	a3,a3,0x30
    80203eb2:	4725                	li	a4,9
    80203eb4:	04d76a63          	bltu	a4,a3,80203f08 <fileread+0xba>
    80203eb8:	0792                	slli	a5,a5,0x4
    80203eba:	00019717          	auipc	a4,0x19
    80203ebe:	4f670713          	addi	a4,a4,1270 # 8021d3b0 <devsw>
    80203ec2:	97ba                	add	a5,a5,a4
    80203ec4:	639c                	ld	a5,0(a5)
    80203ec6:	c3b9                	beqz	a5,80203f0c <fileread+0xbe>
        r = devsw[f->major].read(1, addr, n);
    80203ec8:	4505                	li	a0,1
    80203eca:	9782                	jalr	a5
    80203ecc:	892a                	mv	s2,a0
        break;
    80203ece:	b7e9                	j	80203e98 <fileread+0x4a>
        elock(f->ep);
    80203ed0:	6d08                	ld	a0,24(a0)
    80203ed2:	00003097          	auipc	ra,0x3
    80203ed6:	b9a080e7          	jalr	-1126(ra) # 80206a6c <elock>
          if((r = eread(f->ep, 1, addr, f->off, n)) > 0)
    80203eda:	874a                	mv	a4,s2
    80203edc:	5094                	lw	a3,32(s1)
    80203ede:	864e                	mv	a2,s3
    80203ee0:	4585                	li	a1,1
    80203ee2:	6c88                	ld	a0,24(s1)
    80203ee4:	00002097          	auipc	ra,0x2
    80203ee8:	284080e7          	jalr	644(ra) # 80206168 <eread>
    80203eec:	892a                	mv	s2,a0
    80203eee:	00a05563          	blez	a0,80203ef8 <fileread+0xaa>
            f->off += r;
    80203ef2:	509c                	lw	a5,32(s1)
    80203ef4:	9fa9                	addw	a5,a5,a0
    80203ef6:	d09c                	sw	a5,32(s1)
        eunlock(f->ep);
    80203ef8:	6c88                	ld	a0,24(s1)
    80203efa:	00003097          	auipc	ra,0x3
    80203efe:	ba8080e7          	jalr	-1112(ra) # 80206aa2 <eunlock>
        break;
    80203f02:	bf59                	j	80203e98 <fileread+0x4a>
    return -1;
    80203f04:	597d                	li	s2,-1
    80203f06:	bf49                	j	80203e98 <fileread+0x4a>
          return -1;
    80203f08:	597d                	li	s2,-1
    80203f0a:	b779                	j	80203e98 <fileread+0x4a>
    80203f0c:	597d                	li	s2,-1
    80203f0e:	b769                	j	80203e98 <fileread+0x4a>

0000000080203f10 <filewrite>:

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
    80203f10:	7179                	addi	sp,sp,-48
    80203f12:	f406                	sd	ra,40(sp)
    80203f14:	f022                	sd	s0,32(sp)
    80203f16:	ec26                	sd	s1,24(sp)
    80203f18:	e84a                	sd	s2,16(sp)
    80203f1a:	e44e                	sd	s3,8(sp)
    80203f1c:	e052                	sd	s4,0(sp)
    80203f1e:	1800                	addi	s0,sp,48
  int ret = 0;

  if(f->writable == 0)
    80203f20:	00954783          	lbu	a5,9(a0)
    80203f24:	cbc5                	beqz	a5,80203fd4 <filewrite+0xc4>
    80203f26:	84aa                	mv	s1,a0
    80203f28:	892e                	mv	s2,a1
    80203f2a:	89b2                	mv	s3,a2
    return -1;

  if(f->type == FD_PIPE){
    80203f2c:	411c                	lw	a5,0(a0)
    80203f2e:	4705                	li	a4,1
    80203f30:	04e78963          	beq	a5,a4,80203f82 <filewrite+0x72>
    ret = pipewrite(f->pipe, addr, n);
  } else if(f->type == FD_DEVICE){
    80203f34:	470d                	li	a4,3
    80203f36:	04e78d63          	beq	a5,a4,80203f90 <filewrite+0x80>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
      return -1;
    ret = devsw[f->major].write(1, addr, n);
  } else if(f->type == FD_ENTRY){
    80203f3a:	4709                	li	a4,2
    80203f3c:	08e79463          	bne	a5,a4,80203fc4 <filewrite+0xb4>
    elock(f->ep);
    80203f40:	6d08                	ld	a0,24(a0)
    80203f42:	00003097          	auipc	ra,0x3
    80203f46:	b2a080e7          	jalr	-1238(ra) # 80206a6c <elock>
    if (ewrite(f->ep, 1, addr, f->off, n) == n) {
    80203f4a:	00098a1b          	sext.w	s4,s3
    80203f4e:	8752                	mv	a4,s4
    80203f50:	5094                	lw	a3,32(s1)
    80203f52:	864a                	mv	a2,s2
    80203f54:	4585                	li	a1,1
    80203f56:	6c88                	ld	a0,24(s1)
    80203f58:	00002097          	auipc	ra,0x2
    80203f5c:	308080e7          	jalr	776(ra) # 80206260 <ewrite>
      ret = n;
      f->off += n;
    } else {
      ret = -1;
    80203f60:	597d                	li	s2,-1
    if (ewrite(f->ep, 1, addr, f->off, n) == n) {
    80203f62:	05350b63          	beq	a0,s3,80203fb8 <filewrite+0xa8>
    }
    eunlock(f->ep);
    80203f66:	6c88                	ld	a0,24(s1)
    80203f68:	00003097          	auipc	ra,0x3
    80203f6c:	b3a080e7          	jalr	-1222(ra) # 80206aa2 <eunlock>
  } else {
    panic("filewrite");
  }

  return ret;
}
    80203f70:	854a                	mv	a0,s2
    80203f72:	70a2                	ld	ra,40(sp)
    80203f74:	7402                	ld	s0,32(sp)
    80203f76:	64e2                	ld	s1,24(sp)
    80203f78:	6942                	ld	s2,16(sp)
    80203f7a:	69a2                	ld	s3,8(sp)
    80203f7c:	6a02                	ld	s4,0(sp)
    80203f7e:	6145                	addi	sp,sp,48
    80203f80:	8082                	ret
    ret = pipewrite(f->pipe, addr, n);
    80203f82:	6908                	ld	a0,16(a0)
    80203f84:	00000097          	auipc	ra,0x0
    80203f88:	26c080e7          	jalr	620(ra) # 802041f0 <pipewrite>
    80203f8c:	892a                	mv	s2,a0
    80203f8e:	b7cd                	j	80203f70 <filewrite+0x60>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
    80203f90:	02451783          	lh	a5,36(a0)
    80203f94:	03079693          	slli	a3,a5,0x30
    80203f98:	92c1                	srli	a3,a3,0x30
    80203f9a:	4725                	li	a4,9
    80203f9c:	02d76e63          	bltu	a4,a3,80203fd8 <filewrite+0xc8>
    80203fa0:	0792                	slli	a5,a5,0x4
    80203fa2:	00019717          	auipc	a4,0x19
    80203fa6:	40e70713          	addi	a4,a4,1038 # 8021d3b0 <devsw>
    80203faa:	97ba                	add	a5,a5,a4
    80203fac:	679c                	ld	a5,8(a5)
    80203fae:	c79d                	beqz	a5,80203fdc <filewrite+0xcc>
    ret = devsw[f->major].write(1, addr, n);
    80203fb0:	4505                	li	a0,1
    80203fb2:	9782                	jalr	a5
    80203fb4:	892a                	mv	s2,a0
    80203fb6:	bf6d                	j	80203f70 <filewrite+0x60>
      f->off += n;
    80203fb8:	509c                	lw	a5,32(s1)
    80203fba:	014787bb          	addw	a5,a5,s4
    80203fbe:	d09c                	sw	a5,32(s1)
      ret = n;
    80203fc0:	894e                	mv	s2,s3
    80203fc2:	b755                	j	80203f66 <filewrite+0x56>
    panic("filewrite");
    80203fc4:	00006517          	auipc	a0,0x6
    80203fc8:	c6450513          	addi	a0,a0,-924 # 80209c28 <digits+0x8a8>
    80203fcc:	ffffc097          	auipc	ra,0xffffc
    80203fd0:	178080e7          	jalr	376(ra) # 80200144 <panic>
    return -1;
    80203fd4:	597d                	li	s2,-1
    80203fd6:	bf69                	j	80203f70 <filewrite+0x60>
      return -1;
    80203fd8:	597d                	li	s2,-1
    80203fda:	bf59                	j	80203f70 <filewrite+0x60>
    80203fdc:	597d                	li	s2,-1
    80203fde:	bf49                	j	80203f70 <filewrite+0x60>

0000000080203fe0 <dirnext>:
int
dirnext(struct file *f, uint64 addr)
{
  // struct proc *p = myproc();

  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    80203fe0:	00854783          	lbu	a5,8(a0)
    80203fe4:	cfdd                	beqz	a5,802040a2 <dirnext+0xc2>
{
    80203fe6:	7141                	addi	sp,sp,-496
    80203fe8:	f786                	sd	ra,488(sp)
    80203fea:	f3a2                	sd	s0,480(sp)
    80203fec:	efa6                	sd	s1,472(sp)
    80203fee:	ebca                	sd	s2,464(sp)
    80203ff0:	e7ce                	sd	s3,456(sp)
    80203ff2:	e3d2                	sd	s4,448(sp)
    80203ff4:	ff56                	sd	s5,440(sp)
    80203ff6:	1b80                	addi	s0,sp,496
    80203ff8:	84aa                	mv	s1,a0
    80203ffa:	8aae                	mv	s5,a1
  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    80203ffc:	6d18                	ld	a4,24(a0)
    80203ffe:	10074783          	lbu	a5,256(a4)
    80204002:	8bc1                	andi	a5,a5,16
    return -1;
    80204004:	557d                	li	a0,-1
  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    80204006:	eb91                	bnez	a5,8020401a <dirnext+0x3a>
  // if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    return -1;

  return 1;
    80204008:	70be                	ld	ra,488(sp)
    8020400a:	741e                	ld	s0,480(sp)
    8020400c:	64fe                	ld	s1,472(sp)
    8020400e:	695e                	ld	s2,464(sp)
    80204010:	69be                	ld	s3,456(sp)
    80204012:	6a1e                	ld	s4,448(sp)
    80204014:	7afa                	ld	s5,440(sp)
    80204016:	617d                	addi	sp,sp,496
    80204018:	8082                	ret
  int count = 0;
    8020401a:	e0042e23          	sw	zero,-484(s0)
  elock(f->ep);
    8020401e:	853a                	mv	a0,a4
    80204020:	00003097          	auipc	ra,0x3
    80204024:	a4c080e7          	jalr	-1460(ra) # 80206a6c <elock>
  while ((ret = enext(f->ep, &de, f->off, &count)) == 0) {  // skip empty entry
    80204028:	e1c40a13          	addi	s4,s0,-484
    8020402c:	e5840993          	addi	s3,s0,-424
    80204030:	a801                	j	80204040 <dirnext+0x60>
    f->off += count * 32;
    80204032:	e1c42783          	lw	a5,-484(s0)
    80204036:	0057979b          	slliw	a5,a5,0x5
    8020403a:	5098                	lw	a4,32(s1)
    8020403c:	9fb9                	addw	a5,a5,a4
    8020403e:	d09c                	sw	a5,32(s1)
  while ((ret = enext(f->ep, &de, f->off, &count)) == 0) {  // skip empty entry
    80204040:	86d2                	mv	a3,s4
    80204042:	5090                	lw	a2,32(s1)
    80204044:	85ce                	mv	a1,s3
    80204046:	6c88                	ld	a0,24(s1)
    80204048:	00003097          	auipc	ra,0x3
    8020404c:	c28080e7          	jalr	-984(ra) # 80206c70 <enext>
    80204050:	892a                	mv	s2,a0
    80204052:	d165                	beqz	a0,80204032 <dirnext+0x52>
  eunlock(f->ep);
    80204054:	6c88                	ld	a0,24(s1)
    80204056:	00003097          	auipc	ra,0x3
    8020405a:	a4c080e7          	jalr	-1460(ra) # 80206aa2 <eunlock>
  if (ret == -1)
    8020405e:	57fd                	li	a5,-1
    return 0;
    80204060:	4501                	li	a0,0
  if (ret == -1)
    80204062:	faf903e3          	beq	s2,a5,80204008 <dirnext+0x28>
  f->off += count * 32;
    80204066:	e1c42783          	lw	a5,-484(s0)
    8020406a:	0057979b          	slliw	a5,a5,0x5
    8020406e:	5098                	lw	a4,32(s1)
    80204070:	9fb9                	addw	a5,a5,a4
    80204072:	d09c                	sw	a5,32(s1)
  estat(&de, &st);
    80204074:	e2040493          	addi	s1,s0,-480
    80204078:	85a6                	mv	a1,s1
    8020407a:	e5840513          	addi	a0,s0,-424
    8020407e:	00003097          	auipc	ra,0x3
    80204082:	baa080e7          	jalr	-1110(ra) # 80206c28 <estat>
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    80204086:	03800613          	li	a2,56
    8020408a:	85a6                	mv	a1,s1
    8020408c:	8556                	mv	a0,s5
    8020408e:	ffffd097          	auipc	ra,0xffffd
    80204092:	2e4080e7          	jalr	740(ra) # 80201372 <copyout2>
    return -1;
    80204096:	fff54513          	not	a0,a0
    8020409a:	957d                	srai	a0,a0,0x3f
    8020409c:	8909                	andi	a0,a0,2
    8020409e:	157d                	addi	a0,a0,-1
    802040a0:	b7a5                	j	80204008 <dirnext+0x28>
    return -1;
    802040a2:	557d                	li	a0,-1
    802040a4:	8082                	ret

00000000802040a6 <pipealloc>:
#include "include/kalloc.h"
#include "include/vm.h"

int
pipealloc(struct file **f0, struct file **f1)
{
    802040a6:	7179                	addi	sp,sp,-48
    802040a8:	f406                	sd	ra,40(sp)
    802040aa:	f022                	sd	s0,32(sp)
    802040ac:	ec26                	sd	s1,24(sp)
    802040ae:	e84a                	sd	s2,16(sp)
    802040b0:	e44e                	sd	s3,8(sp)
    802040b2:	e052                	sd	s4,0(sp)
    802040b4:	1800                	addi	s0,sp,48
    802040b6:	84aa                	mv	s1,a0
    802040b8:	8a2e                	mv	s4,a1
  struct pipe *pi;

  pi = 0;
  *f0 = *f1 = 0;
    802040ba:	0005b023          	sd	zero,0(a1)
    802040be:	00053023          	sd	zero,0(a0)
  if((*f0 = filealloc()) == NULL || (*f1 = filealloc()) == NULL)
    802040c2:	00000097          	auipc	ra,0x0
    802040c6:	bb6080e7          	jalr	-1098(ra) # 80203c78 <filealloc>
    802040ca:	e088                	sd	a0,0(s1)
    802040cc:	c551                	beqz	a0,80204158 <pipealloc+0xb2>
    802040ce:	00000097          	auipc	ra,0x0
    802040d2:	baa080e7          	jalr	-1110(ra) # 80203c78 <filealloc>
    802040d6:	00aa3023          	sd	a0,0(s4)
    802040da:	c92d                	beqz	a0,8020414c <pipealloc+0xa6>
    goto bad;
  if((pi = (struct pipe*)kalloc()) == NULL)
    802040dc:	ffffc097          	auipc	ra,0xffffc
    802040e0:	47e080e7          	jalr	1150(ra) # 8020055a <kalloc>
    802040e4:	892a                	mv	s2,a0
    802040e6:	c125                	beqz	a0,80204146 <pipealloc+0xa0>
    goto bad;
  pi->readopen = 1;
    802040e8:	4985                	li	s3,1
    802040ea:	23352023          	sw	s3,544(a0)
  pi->writeopen = 1;
    802040ee:	23352223          	sw	s3,548(a0)
  pi->nwrite = 0;
    802040f2:	20052e23          	sw	zero,540(a0)
  pi->nread = 0;
    802040f6:	20052c23          	sw	zero,536(a0)
  initlock(&pi->lock, "pipe");
    802040fa:	00006597          	auipc	a1,0x6
    802040fe:	8de58593          	addi	a1,a1,-1826 # 802099d8 <digits+0x658>
    80204102:	ffffc097          	auipc	ra,0xffffc
    80204106:	580080e7          	jalr	1408(ra) # 80200682 <initlock>
  (*f0)->type = FD_PIPE;
    8020410a:	609c                	ld	a5,0(s1)
    8020410c:	0137a023          	sw	s3,0(a5)
  (*f0)->readable = 1;
    80204110:	609c                	ld	a5,0(s1)
    80204112:	01378423          	sb	s3,8(a5)
  (*f0)->writable = 0;
    80204116:	609c                	ld	a5,0(s1)
    80204118:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
    8020411c:	609c                	ld	a5,0(s1)
    8020411e:	0127b823          	sd	s2,16(a5)
  (*f1)->type = FD_PIPE;
    80204122:	000a3783          	ld	a5,0(s4)
    80204126:	0137a023          	sw	s3,0(a5)
  (*f1)->readable = 0;
    8020412a:	000a3783          	ld	a5,0(s4)
    8020412e:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
    80204132:	000a3783          	ld	a5,0(s4)
    80204136:	013784a3          	sb	s3,9(a5)
  (*f1)->pipe = pi;
    8020413a:	000a3783          	ld	a5,0(s4)
    8020413e:	0127b823          	sd	s2,16(a5)
  return 0;
    80204142:	4501                	li	a0,0
    80204144:	a025                	j	8020416c <pipealloc+0xc6>

 bad:
  if(pi)
    kfree((char*)pi);
  if(*f0)
    80204146:	6088                	ld	a0,0(s1)
    80204148:	e501                	bnez	a0,80204150 <pipealloc+0xaa>
    8020414a:	a039                	j	80204158 <pipealloc+0xb2>
    8020414c:	6088                	ld	a0,0(s1)
    8020414e:	c51d                	beqz	a0,8020417c <pipealloc+0xd6>
    fileclose(*f0);
    80204150:	00000097          	auipc	ra,0x0
    80204154:	be4080e7          	jalr	-1052(ra) # 80203d34 <fileclose>
  if(*f1)
    80204158:	000a3783          	ld	a5,0(s4)
    fileclose(*f1);
  return -1;
    8020415c:	557d                	li	a0,-1
  if(*f1)
    8020415e:	c799                	beqz	a5,8020416c <pipealloc+0xc6>
    fileclose(*f1);
    80204160:	853e                	mv	a0,a5
    80204162:	00000097          	auipc	ra,0x0
    80204166:	bd2080e7          	jalr	-1070(ra) # 80203d34 <fileclose>
  return -1;
    8020416a:	557d                	li	a0,-1
}
    8020416c:	70a2                	ld	ra,40(sp)
    8020416e:	7402                	ld	s0,32(sp)
    80204170:	64e2                	ld	s1,24(sp)
    80204172:	6942                	ld	s2,16(sp)
    80204174:	69a2                	ld	s3,8(sp)
    80204176:	6a02                	ld	s4,0(sp)
    80204178:	6145                	addi	sp,sp,48
    8020417a:	8082                	ret
  return -1;
    8020417c:	557d                	li	a0,-1
    8020417e:	b7fd                	j	8020416c <pipealloc+0xc6>

0000000080204180 <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
    80204180:	1101                	addi	sp,sp,-32
    80204182:	ec06                	sd	ra,24(sp)
    80204184:	e822                	sd	s0,16(sp)
    80204186:	e426                	sd	s1,8(sp)
    80204188:	e04a                	sd	s2,0(sp)
    8020418a:	1000                	addi	s0,sp,32
    8020418c:	84aa                	mv	s1,a0
    8020418e:	892e                	mv	s2,a1
  acquire(&pi->lock);
    80204190:	ffffc097          	auipc	ra,0xffffc
    80204194:	536080e7          	jalr	1334(ra) # 802006c6 <acquire>
  if(writable){
    80204198:	02090d63          	beqz	s2,802041d2 <pipeclose+0x52>
    pi->writeopen = 0;
    8020419c:	2204a223          	sw	zero,548(s1)
    wakeup(&pi->nread);
    802041a0:	21848513          	addi	a0,s1,536
    802041a4:	ffffe097          	auipc	ra,0xffffe
    802041a8:	2b8080e7          	jalr	696(ra) # 8020245c <wakeup>
  } else {
    pi->readopen = 0;
    wakeup(&pi->nwrite);
  }
  if(pi->readopen == 0 && pi->writeopen == 0){
    802041ac:	2204b783          	ld	a5,544(s1)
    802041b0:	eb95                	bnez	a5,802041e4 <pipeclose+0x64>
    release(&pi->lock);
    802041b2:	8526                	mv	a0,s1
    802041b4:	ffffc097          	auipc	ra,0xffffc
    802041b8:	566080e7          	jalr	1382(ra) # 8020071a <release>
    kfree((char*)pi);
    802041bc:	8526                	mv	a0,s1
    802041be:	ffffc097          	auipc	ra,0xffffc
    802041c2:	282080e7          	jalr	642(ra) # 80200440 <kfree>
  } else
    release(&pi->lock);
}
    802041c6:	60e2                	ld	ra,24(sp)
    802041c8:	6442                	ld	s0,16(sp)
    802041ca:	64a2                	ld	s1,8(sp)
    802041cc:	6902                	ld	s2,0(sp)
    802041ce:	6105                	addi	sp,sp,32
    802041d0:	8082                	ret
    pi->readopen = 0;
    802041d2:	2204a023          	sw	zero,544(s1)
    wakeup(&pi->nwrite);
    802041d6:	21c48513          	addi	a0,s1,540
    802041da:	ffffe097          	auipc	ra,0xffffe
    802041de:	282080e7          	jalr	642(ra) # 8020245c <wakeup>
    802041e2:	b7e9                	j	802041ac <pipeclose+0x2c>
    release(&pi->lock);
    802041e4:	8526                	mv	a0,s1
    802041e6:	ffffc097          	auipc	ra,0xffffc
    802041ea:	534080e7          	jalr	1332(ra) # 8020071a <release>
}
    802041ee:	bfe1                	j	802041c6 <pipeclose+0x46>

00000000802041f0 <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
    802041f0:	7159                	addi	sp,sp,-112
    802041f2:	f486                	sd	ra,104(sp)
    802041f4:	f0a2                	sd	s0,96(sp)
    802041f6:	eca6                	sd	s1,88(sp)
    802041f8:	e8ca                	sd	s2,80(sp)
    802041fa:	e4ce                	sd	s3,72(sp)
    802041fc:	e0d2                	sd	s4,64(sp)
    802041fe:	fc56                	sd	s5,56(sp)
    80204200:	f85a                	sd	s6,48(sp)
    80204202:	f45e                	sd	s7,40(sp)
    80204204:	f062                	sd	s8,32(sp)
    80204206:	ec66                	sd	s9,24(sp)
    80204208:	1880                	addi	s0,sp,112
    8020420a:	84aa                	mv	s1,a0
    8020420c:	8b2e                	mv	s6,a1
    8020420e:	8ab2                	mv	s5,a2
  int i;
  char ch;
  struct proc *pr = myproc();
    80204210:	ffffe097          	auipc	ra,0xffffe
    80204214:	82c080e7          	jalr	-2004(ra) # 80201a3c <myproc>
    80204218:	892a                	mv	s2,a0

  acquire(&pi->lock);
    8020421a:	8526                	mv	a0,s1
    8020421c:	ffffc097          	auipc	ra,0xffffc
    80204220:	4aa080e7          	jalr	1194(ra) # 802006c6 <acquire>
  for(i = 0; i < n; i++){
    80204224:	09505763          	blez	s5,802042b2 <pipewrite+0xc2>
    80204228:	4b81                	li	s7,0
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
      if(pi->readopen == 0 || pr->killed){
        release(&pi->lock);
        return -1;
      }
      wakeup(&pi->nread);
    8020422a:	21848a13          	addi	s4,s1,536
      sleep(&pi->nwrite, &pi->lock);
    8020422e:	21c48993          	addi	s3,s1,540
    }
    // if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    if(copyin2(&ch, addr + i, 1) == -1)
    80204232:	f9f40c93          	addi	s9,s0,-97
    80204236:	5c7d                	li	s8,-1
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
    80204238:	2184a783          	lw	a5,536(s1)
    8020423c:	21c4a703          	lw	a4,540(s1)
    80204240:	2007879b          	addiw	a5,a5,512
    80204244:	02f71b63          	bne	a4,a5,8020427a <pipewrite+0x8a>
      if(pi->readopen == 0 || pr->killed){
    80204248:	2204a783          	lw	a5,544(s1)
    8020424c:	c3c1                	beqz	a5,802042cc <pipewrite+0xdc>
    8020424e:	03092783          	lw	a5,48(s2)
    80204252:	efad                	bnez	a5,802042cc <pipewrite+0xdc>
      wakeup(&pi->nread);
    80204254:	8552                	mv	a0,s4
    80204256:	ffffe097          	auipc	ra,0xffffe
    8020425a:	206080e7          	jalr	518(ra) # 8020245c <wakeup>
      sleep(&pi->nwrite, &pi->lock);
    8020425e:	85a6                	mv	a1,s1
    80204260:	854e                	mv	a0,s3
    80204262:	ffffe097          	auipc	ra,0xffffe
    80204266:	07e080e7          	jalr	126(ra) # 802022e0 <sleep>
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
    8020426a:	2184a783          	lw	a5,536(s1)
    8020426e:	21c4a703          	lw	a4,540(s1)
    80204272:	2007879b          	addiw	a5,a5,512
    80204276:	fcf709e3          	beq	a4,a5,80204248 <pipewrite+0x58>
    if(copyin2(&ch, addr + i, 1) == -1)
    8020427a:	4605                	li	a2,1
    8020427c:	85da                	mv	a1,s6
    8020427e:	8566                	mv	a0,s9
    80204280:	ffffd097          	auipc	ra,0xffffd
    80204284:	1d2080e7          	jalr	466(ra) # 80201452 <copyin2>
    80204288:	03850663          	beq	a0,s8,802042b4 <pipewrite+0xc4>
      break;
    pi->data[pi->nwrite++ % PIPESIZE] = ch;
    8020428c:	21c4a783          	lw	a5,540(s1)
    80204290:	0017871b          	addiw	a4,a5,1
    80204294:	20e4ae23          	sw	a4,540(s1)
    80204298:	1ff7f793          	andi	a5,a5,511
    8020429c:	97a6                	add	a5,a5,s1
    8020429e:	f9f44703          	lbu	a4,-97(s0)
    802042a2:	00e78c23          	sb	a4,24(a5)
  for(i = 0; i < n; i++){
    802042a6:	2b85                	addiw	s7,s7,1
    802042a8:	0b05                	addi	s6,s6,1
    802042aa:	f97a97e3          	bne	s5,s7,80204238 <pipewrite+0x48>
    802042ae:	8bd6                	mv	s7,s5
    802042b0:	a011                	j	802042b4 <pipewrite+0xc4>
    802042b2:	4b81                	li	s7,0
  }
  wakeup(&pi->nread);
    802042b4:	21848513          	addi	a0,s1,536
    802042b8:	ffffe097          	auipc	ra,0xffffe
    802042bc:	1a4080e7          	jalr	420(ra) # 8020245c <wakeup>
  release(&pi->lock);
    802042c0:	8526                	mv	a0,s1
    802042c2:	ffffc097          	auipc	ra,0xffffc
    802042c6:	458080e7          	jalr	1112(ra) # 8020071a <release>
  return i;
    802042ca:	a039                	j	802042d8 <pipewrite+0xe8>
        release(&pi->lock);
    802042cc:	8526                	mv	a0,s1
    802042ce:	ffffc097          	auipc	ra,0xffffc
    802042d2:	44c080e7          	jalr	1100(ra) # 8020071a <release>
        return -1;
    802042d6:	5bfd                	li	s7,-1
}
    802042d8:	855e                	mv	a0,s7
    802042da:	70a6                	ld	ra,104(sp)
    802042dc:	7406                	ld	s0,96(sp)
    802042de:	64e6                	ld	s1,88(sp)
    802042e0:	6946                	ld	s2,80(sp)
    802042e2:	69a6                	ld	s3,72(sp)
    802042e4:	6a06                	ld	s4,64(sp)
    802042e6:	7ae2                	ld	s5,56(sp)
    802042e8:	7b42                	ld	s6,48(sp)
    802042ea:	7ba2                	ld	s7,40(sp)
    802042ec:	7c02                	ld	s8,32(sp)
    802042ee:	6ce2                	ld	s9,24(sp)
    802042f0:	6165                	addi	sp,sp,112
    802042f2:	8082                	ret

00000000802042f4 <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
    802042f4:	715d                	addi	sp,sp,-80
    802042f6:	e486                	sd	ra,72(sp)
    802042f8:	e0a2                	sd	s0,64(sp)
    802042fa:	fc26                	sd	s1,56(sp)
    802042fc:	f84a                	sd	s2,48(sp)
    802042fe:	f44e                	sd	s3,40(sp)
    80204300:	f052                	sd	s4,32(sp)
    80204302:	ec56                	sd	s5,24(sp)
    80204304:	e85a                	sd	s6,16(sp)
    80204306:	0880                	addi	s0,sp,80
    80204308:	84aa                	mv	s1,a0
    8020430a:	892e                	mv	s2,a1
    8020430c:	8a32                	mv	s4,a2
  int i;
  struct proc *pr = myproc();
    8020430e:	ffffd097          	auipc	ra,0xffffd
    80204312:	72e080e7          	jalr	1838(ra) # 80201a3c <myproc>
    80204316:	89aa                	mv	s3,a0
  char ch;

  acquire(&pi->lock);
    80204318:	8526                	mv	a0,s1
    8020431a:	ffffc097          	auipc	ra,0xffffc
    8020431e:	3ac080e7          	jalr	940(ra) # 802006c6 <acquire>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80204322:	2184a703          	lw	a4,536(s1)
    80204326:	21c4a783          	lw	a5,540(s1)
    if(pr->killed){
      release(&pi->lock);
      return -1;
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    8020432a:	21848a93          	addi	s5,s1,536
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    8020432e:	02f71463          	bne	a4,a5,80204356 <piperead+0x62>
    80204332:	2244a783          	lw	a5,548(s1)
    80204336:	c385                	beqz	a5,80204356 <piperead+0x62>
    if(pr->killed){
    80204338:	0309a783          	lw	a5,48(s3)
    8020433c:	ebc1                	bnez	a5,802043cc <piperead+0xd8>
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    8020433e:	85a6                	mv	a1,s1
    80204340:	8556                	mv	a0,s5
    80204342:	ffffe097          	auipc	ra,0xffffe
    80204346:	f9e080e7          	jalr	-98(ra) # 802022e0 <sleep>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    8020434a:	2184a703          	lw	a4,536(s1)
    8020434e:	21c4a783          	lw	a5,540(s1)
    80204352:	fef700e3          	beq	a4,a5,80204332 <piperead+0x3e>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    80204356:	4981                	li	s3,0
    if(pi->nread == pi->nwrite)
      break;
    ch = pi->data[pi->nread++ % PIPESIZE];
    // if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    if(copyout2(addr + i, &ch, 1) == -1)
    80204358:	fbf40b13          	addi	s6,s0,-65
    8020435c:	5afd                	li	s5,-1
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    8020435e:	05405163          	blez	s4,802043a0 <piperead+0xac>
    if(pi->nread == pi->nwrite)
    80204362:	2184a783          	lw	a5,536(s1)
    80204366:	21c4a703          	lw	a4,540(s1)
    8020436a:	02f70b63          	beq	a4,a5,802043a0 <piperead+0xac>
    ch = pi->data[pi->nread++ % PIPESIZE];
    8020436e:	0017871b          	addiw	a4,a5,1
    80204372:	20e4ac23          	sw	a4,536(s1)
    80204376:	1ff7f793          	andi	a5,a5,511
    8020437a:	97a6                	add	a5,a5,s1
    8020437c:	0187c783          	lbu	a5,24(a5)
    80204380:	faf40fa3          	sb	a5,-65(s0)
    if(copyout2(addr + i, &ch, 1) == -1)
    80204384:	4605                	li	a2,1
    80204386:	85da                	mv	a1,s6
    80204388:	854a                	mv	a0,s2
    8020438a:	ffffd097          	auipc	ra,0xffffd
    8020438e:	fe8080e7          	jalr	-24(ra) # 80201372 <copyout2>
    80204392:	01550763          	beq	a0,s5,802043a0 <piperead+0xac>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    80204396:	2985                	addiw	s3,s3,1
    80204398:	0905                	addi	s2,s2,1
    8020439a:	fd3a14e3          	bne	s4,s3,80204362 <piperead+0x6e>
    8020439e:	89d2                	mv	s3,s4
      break;
  }
  wakeup(&pi->nwrite);  //DOC: piperead-wakeup
    802043a0:	21c48513          	addi	a0,s1,540
    802043a4:	ffffe097          	auipc	ra,0xffffe
    802043a8:	0b8080e7          	jalr	184(ra) # 8020245c <wakeup>
  release(&pi->lock);
    802043ac:	8526                	mv	a0,s1
    802043ae:	ffffc097          	auipc	ra,0xffffc
    802043b2:	36c080e7          	jalr	876(ra) # 8020071a <release>
  return i;
}
    802043b6:	854e                	mv	a0,s3
    802043b8:	60a6                	ld	ra,72(sp)
    802043ba:	6406                	ld	s0,64(sp)
    802043bc:	74e2                	ld	s1,56(sp)
    802043be:	7942                	ld	s2,48(sp)
    802043c0:	79a2                	ld	s3,40(sp)
    802043c2:	7a02                	ld	s4,32(sp)
    802043c4:	6ae2                	ld	s5,24(sp)
    802043c6:	6b42                	ld	s6,16(sp)
    802043c8:	6161                	addi	sp,sp,80
    802043ca:	8082                	ret
      release(&pi->lock);
    802043cc:	8526                	mv	a0,s1
    802043ce:	ffffc097          	auipc	ra,0xffffc
    802043d2:	34c080e7          	jalr	844(ra) # 8020071a <release>
      return -1;
    802043d6:	59fd                	li	s3,-1
    802043d8:	bff9                	j	802043b6 <piperead+0xc2>

00000000802043da <exec>:
  return 0;
}


int exec(char *path, char **argv)
{
    802043da:	dd010113          	addi	sp,sp,-560
    802043de:	22113423          	sd	ra,552(sp)
    802043e2:	22813023          	sd	s0,544(sp)
    802043e6:	20913c23          	sd	s1,536(sp)
    802043ea:	21213823          	sd	s2,528(sp)
    802043ee:	21313423          	sd	s3,520(sp)
    802043f2:	21413023          	sd	s4,512(sp)
    802043f6:	ffd6                	sd	s5,504(sp)
    802043f8:	fbda                	sd	s6,496(sp)
    802043fa:	f7de                	sd	s7,488(sp)
    802043fc:	f3e2                	sd	s8,480(sp)
    802043fe:	efe6                	sd	s9,472(sp)
    80204400:	ebea                	sd	s10,464(sp)
    80204402:	e7ee                	sd	s11,456(sp)
    80204404:	1c00                	addi	s0,sp,560
    80204406:	892a                	mv	s2,a0
    80204408:	dca43c23          	sd	a0,-552(s0)
    8020440c:	deb43423          	sd	a1,-536(s0)
  struct elfhdr elf;
  struct dirent *ep;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
  pagetable_t kpagetable = 0, oldkpagetable;
  struct proc *p = myproc();
    80204410:	ffffd097          	auipc	ra,0xffffd
    80204414:	62c080e7          	jalr	1580(ra) # 80201a3c <myproc>
    80204418:	84aa                	mv	s1,a0

  // Make a copy of p->kpt without old user space, 
  // but with the same kstack we are using now, which can't be changed
  if ((kpagetable = (pagetable_t)kalloc()) == NULL) {
    8020441a:	ffffc097          	auipc	ra,0xffffc
    8020441e:	140080e7          	jalr	320(ra) # 8020055a <kalloc>
    80204422:	2a050863          	beqz	a0,802046d2 <exec+0x2f8>
    80204426:	8b2a                	mv	s6,a0
    return -1;
  }
  memmove(kpagetable, p->kpagetable, PGSIZE);
    80204428:	6605                	lui	a2,0x1
    8020442a:	6cac                	ld	a1,88(s1)
    8020442c:	ffffc097          	auipc	ra,0xffffc
    80204430:	392080e7          	jalr	914(ra) # 802007be <memmove>
  for (int i = 0; i < PX(2, MAXUVA); i++) {
    kpagetable[i] = 0;
    80204434:	000b3023          	sd	zero,0(s6)
    80204438:	000b3423          	sd	zero,8(s6)
  }

  if((ep = ename(path)) == NULL) {
    8020443c:	854a                	mv	a0,s2
    8020443e:	00003097          	auipc	ra,0x3
    80204442:	d68080e7          	jalr	-664(ra) # 802071a6 <ename>
    80204446:	8a2a                	mv	s4,a0
    80204448:	3a050e63          	beqz	a0,80204804 <exec+0x42a>
    #ifdef DEBUG
    printf("[exec] %s not found\n", path);
    #endif
    goto bad;
  }
  elock(ep);
    8020444c:	00002097          	auipc	ra,0x2
    80204450:	620080e7          	jalr	1568(ra) # 80206a6c <elock>

  // Check ELF header
  if(eread(ep, 0, (uint64) &elf, 0, sizeof(elf)) != sizeof(elf))
    80204454:	04000713          	li	a4,64
    80204458:	4681                	li	a3,0
    8020445a:	e4840613          	addi	a2,s0,-440
    8020445e:	4581                	li	a1,0
    80204460:	8552                	mv	a0,s4
    80204462:	00002097          	auipc	ra,0x2
    80204466:	d06080e7          	jalr	-762(ra) # 80206168 <eread>
    8020446a:	04000793          	li	a5,64
    8020446e:	00f51a63          	bne	a0,a5,80204482 <exec+0xa8>
    goto bad;
  if(elf.magic != ELF_MAGIC)
    80204472:	e4842703          	lw	a4,-440(s0)
    80204476:	464c47b7          	lui	a5,0x464c4
    8020447a:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39d3ba81>
    8020447e:	00f70963          	beq	a4,a5,80204490 <exec+0xb6>
  printf("[exec] reach bad\n");
  #endif
  if(pagetable)
    proc_freepagetable(pagetable, sz);
  if(kpagetable)
    kvmfree(kpagetable, 0);
    80204482:	4581                	li	a1,0
    80204484:	855a                	mv	a0,s6
    80204486:	ffffd097          	auipc	ra,0xffffd
    8020448a:	1ec080e7          	jalr	492(ra) # 80201672 <kvmfree>
  if(ep){
    8020448e:	a4bd                	j	802046fc <exec+0x322>
  if((pagetable = proc_pagetable(p)) == NULL)
    80204490:	8526                	mv	a0,s1
    80204492:	ffffd097          	auipc	ra,0xffffd
    80204496:	68e080e7          	jalr	1678(ra) # 80201b20 <proc_pagetable>
    8020449a:	e0a43423          	sd	a0,-504(s0)
    8020449e:	d175                	beqz	a0,80204482 <exec+0xa8>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    802044a0:	e6842783          	lw	a5,-408(s0)
    802044a4:	e8045703          	lhu	a4,-384(s0)
    802044a8:	cb3d                	beqz	a4,8020451e <exec+0x144>
  uint64 argc, sz = 0, sp, ustack[MAXARG+1], stackbase;
    802044aa:	4481                	li	s1,0
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    802044ac:	e0043023          	sd	zero,-512(s0)
    if(eread(ep, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    802044b0:	e1040713          	addi	a4,s0,-496
    802044b4:	dee43023          	sd	a4,-544(s0)
    if(ph.vaddr % PGSIZE != 0)
    802044b8:	6a85                	lui	s5,0x1
    802044ba:	fffa8713          	addi	a4,s5,-1 # fff <_entry-0x801ff001>
    802044be:	dce43823          	sd	a4,-560(s0)
  for(i = 0; i < sz; i += PGSIZE){
    802044c2:	6d85                	lui	s11,0x1
    802044c4:	7d7d                	lui	s10,0xfffff
    802044c6:	a4c9                	j	80204788 <exec+0x3ae>
      panic("loadseg: address should exist");
    802044c8:	00005517          	auipc	a0,0x5
    802044cc:	77050513          	addi	a0,a0,1904 # 80209c38 <digits+0x8b8>
    802044d0:	ffffc097          	auipc	ra,0xffffc
    802044d4:	c74080e7          	jalr	-908(ra) # 80200144 <panic>
    if(eread(ep, 0, (uint64)pa, offset+i, n) != n)
    802044d8:	874a                	mv	a4,s2
    802044da:	009c86bb          	addw	a3,s9,s1
    802044de:	4581                	li	a1,0
    802044e0:	8552                	mv	a0,s4
    802044e2:	00002097          	auipc	ra,0x2
    802044e6:	c86080e7          	jalr	-890(ra) # 80206168 <eread>
    802044ea:	2501                	sext.w	a0,a0
    802044ec:	1ea91763          	bne	s2,a0,802046da <exec+0x300>
  for(i = 0; i < sz; i += PGSIZE){
    802044f0:	009d84bb          	addw	s1,s11,s1
    802044f4:	013d09bb          	addw	s3,s10,s3
    802044f8:	2774f863          	bgeu	s1,s7,80204768 <exec+0x38e>
    pa = walkaddr(pagetable, va + i);
    802044fc:	02049593          	slli	a1,s1,0x20
    80204500:	9181                	srli	a1,a1,0x20
    80204502:	95e2                	add	a1,a1,s8
    80204504:	e0843503          	ld	a0,-504(s0)
    80204508:	ffffc097          	auipc	ra,0xffffc
    8020450c:	6a6080e7          	jalr	1702(ra) # 80200bae <walkaddr>
    80204510:	862a                	mv	a2,a0
    if(pa == NULL)
    80204512:	d95d                	beqz	a0,802044c8 <exec+0xee>
      n = PGSIZE;
    80204514:	8956                	mv	s2,s5
    if(sz - i < PGSIZE)
    80204516:	fd59f1e3          	bgeu	s3,s5,802044d8 <exec+0xfe>
      n = sz - i;
    8020451a:	894e                	mv	s2,s3
    8020451c:	bf75                	j	802044d8 <exec+0xfe>
  uint64 argc, sz = 0, sp, ustack[MAXARG+1], stackbase;
    8020451e:	4481                	li	s1,0
  eunlock(ep);
    80204520:	8552                	mv	a0,s4
    80204522:	00002097          	auipc	ra,0x2
    80204526:	580080e7          	jalr	1408(ra) # 80206aa2 <eunlock>
  eput(ep);
    8020452a:	8552                	mv	a0,s4
    8020452c:	00002097          	auipc	ra,0x2
    80204530:	5c4080e7          	jalr	1476(ra) # 80206af0 <eput>
  p = myproc();
    80204534:	ffffd097          	auipc	ra,0xffffd
    80204538:	508080e7          	jalr	1288(ra) # 80201a3c <myproc>
    8020453c:	8aaa                	mv	s5,a0
  uint64 oldsz = p->sz;
    8020453e:	04853d03          	ld	s10,72(a0)
  sz = PGROUNDUP(sz);
    80204542:	6785                	lui	a5,0x1
    80204544:	17fd                	addi	a5,a5,-1 # fff <_entry-0x801ff001>
    80204546:	97a6                	add	a5,a5,s1
    80204548:	777d                	lui	a4,0xfffff
    8020454a:	8ff9                	and	a5,a5,a4
    8020454c:	def43823          	sd	a5,-528(s0)
  if((sz1 = uvmalloc(pagetable, kpagetable, sz, sz + 2*PGSIZE)) == 0)
    80204550:	6689                	lui	a3,0x2
    80204552:	96be                	add	a3,a3,a5
    80204554:	863e                	mv	a2,a5
    80204556:	85da                	mv	a1,s6
    80204558:	e0843483          	ld	s1,-504(s0)
    8020455c:	8526                	mv	a0,s1
    8020455e:	ffffd097          	auipc	ra,0xffffd
    80204562:	aac080e7          	jalr	-1364(ra) # 8020100a <uvmalloc>
    80204566:	8caa                	mv	s9,a0
  ep = 0;
    80204568:	4a01                	li	s4,0
  if((sz1 = uvmalloc(pagetable, kpagetable, sz, sz + 2*PGSIZE)) == 0)
    8020456a:	16050863          	beqz	a0,802046da <exec+0x300>
  uvmclear(pagetable, sz-2*PGSIZE);
    8020456e:	75f9                	lui	a1,0xffffe
    80204570:	95aa                	add	a1,a1,a0
    80204572:	8526                	mv	a0,s1
    80204574:	ffffd097          	auipc	ra,0xffffd
    80204578:	d40080e7          	jalr	-704(ra) # 802012b4 <uvmclear>
  stackbase = sp - PGSIZE;
    8020457c:	7bfd                	lui	s7,0xfffff
    8020457e:	9be6                	add	s7,s7,s9
  for(argc = 0; argv[argc]; argc++) {
    80204580:	de843783          	ld	a5,-536(s0)
    80204584:	6388                	ld	a0,0(a5)
    80204586:	c92d                	beqz	a0,802045f8 <exec+0x21e>
    80204588:	e8840993          	addi	s3,s0,-376
    8020458c:	f8840c13          	addi	s8,s0,-120
  sp = sz;
    80204590:	8966                	mv	s2,s9
  for(argc = 0; argv[argc]; argc++) {
    80204592:	4481                	li	s1,0
    sp -= strlen(argv[argc]) + 1;
    80204594:	ffffc097          	auipc	ra,0xffffc
    80204598:	352080e7          	jalr	850(ra) # 802008e6 <strlen>
    8020459c:	0015079b          	addiw	a5,a0,1
    802045a0:	40f907b3          	sub	a5,s2,a5
    sp -= sp % 16; // riscv sp must be 16-byte aligned
    802045a4:	ff07f913          	andi	s2,a5,-16
    if(sp < stackbase)
    802045a8:	1b796463          	bltu	s2,s7,80204750 <exec+0x376>
    if(copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
    802045ac:	de843d83          	ld	s11,-536(s0)
    802045b0:	000dba03          	ld	s4,0(s11) # 1000 <_entry-0x801ff000>
    802045b4:	8552                	mv	a0,s4
    802045b6:	ffffc097          	auipc	ra,0xffffc
    802045ba:	330080e7          	jalr	816(ra) # 802008e6 <strlen>
    802045be:	0015069b          	addiw	a3,a0,1
    802045c2:	8652                	mv	a2,s4
    802045c4:	85ca                	mv	a1,s2
    802045c6:	e0843503          	ld	a0,-504(s0)
    802045ca:	ffffd097          	auipc	ra,0xffffd
    802045ce:	d1c080e7          	jalr	-740(ra) # 802012e6 <copyout>
    802045d2:	18054363          	bltz	a0,80204758 <exec+0x37e>
    ustack[argc] = sp;
    802045d6:	0129b023          	sd	s2,0(s3)
  for(argc = 0; argv[argc]; argc++) {
    802045da:	0485                	addi	s1,s1,1
    802045dc:	008d8793          	addi	a5,s11,8
    802045e0:	def43423          	sd	a5,-536(s0)
    802045e4:	008db503          	ld	a0,8(s11)
    802045e8:	c911                	beqz	a0,802045fc <exec+0x222>
    if(argc >= MAXARG)
    802045ea:	09a1                	addi	s3,s3,8
    802045ec:	fb3c14e3          	bne	s8,s3,80204594 <exec+0x1ba>
  sz = sz1;
    802045f0:	df943823          	sd	s9,-528(s0)
  ep = 0;
    802045f4:	4a01                	li	s4,0
    802045f6:	a0d5                	j	802046da <exec+0x300>
  sp = sz;
    802045f8:	8966                	mv	s2,s9
  for(argc = 0; argv[argc]; argc++) {
    802045fa:	4481                	li	s1,0
  ustack[argc] = 0;
    802045fc:	00349793          	slli	a5,s1,0x3
    80204600:	f9078793          	addi	a5,a5,-112
    80204604:	97a2                	add	a5,a5,s0
    80204606:	ee07bc23          	sd	zero,-264(a5)
  sp -= (argc+1) * sizeof(uint64);
    8020460a:	00148693          	addi	a3,s1,1
    8020460e:	068e                	slli	a3,a3,0x3
    80204610:	40d90933          	sub	s2,s2,a3
  sp -= sp % 16;
    80204614:	ff097913          	andi	s2,s2,-16
  if(sp < stackbase)
    80204618:	01797663          	bgeu	s2,s7,80204624 <exec+0x24a>
  sz = sz1;
    8020461c:	df943823          	sd	s9,-528(s0)
  ep = 0;
    80204620:	4a01                	li	s4,0
    80204622:	a865                	j	802046da <exec+0x300>
  if(copyout(pagetable, sp, (char *)ustack, (argc+1)*sizeof(uint64)) < 0)
    80204624:	e8840613          	addi	a2,s0,-376
    80204628:	85ca                	mv	a1,s2
    8020462a:	e0843503          	ld	a0,-504(s0)
    8020462e:	ffffd097          	auipc	ra,0xffffd
    80204632:	cb8080e7          	jalr	-840(ra) # 802012e6 <copyout>
    80204636:	12054563          	bltz	a0,80204760 <exec+0x386>
  p->trapframe->a1 = sp;
    8020463a:	060ab783          	ld	a5,96(s5)
    8020463e:	0727bc23          	sd	s2,120(a5)
  for(last=s=path; *s; s++)
    80204642:	dd843783          	ld	a5,-552(s0)
    80204646:	0007c703          	lbu	a4,0(a5)
    8020464a:	cf11                	beqz	a4,80204666 <exec+0x28c>
    8020464c:	0785                	addi	a5,a5,1
    if(*s == '/')
    8020464e:	02f00693          	li	a3,47
    80204652:	a039                	j	80204660 <exec+0x286>
      last = s+1;
    80204654:	dcf43c23          	sd	a5,-552(s0)
  for(last=s=path; *s; s++)
    80204658:	0785                	addi	a5,a5,1
    8020465a:	fff7c703          	lbu	a4,-1(a5)
    8020465e:	c701                	beqz	a4,80204666 <exec+0x28c>
    if(*s == '/')
    80204660:	fed71ce3          	bne	a4,a3,80204658 <exec+0x27e>
    80204664:	bfc5                	j	80204654 <exec+0x27a>
  safestrcpy(p->name, last, sizeof(p->name));
    80204666:	4641                	li	a2,16
    80204668:	dd843583          	ld	a1,-552(s0)
    8020466c:	160a8513          	addi	a0,s5,352
    80204670:	ffffc097          	auipc	ra,0xffffc
    80204674:	244080e7          	jalr	580(ra) # 802008b4 <safestrcpy>
  oldpagetable = p->pagetable;
    80204678:	050ab503          	ld	a0,80(s5)
  oldkpagetable = p->kpagetable;
    8020467c:	058ab983          	ld	s3,88(s5)
  p->pagetable = pagetable;
    80204680:	e0843783          	ld	a5,-504(s0)
    80204684:	04fab823          	sd	a5,80(s5)
  p->kpagetable = kpagetable;
    80204688:	056abc23          	sd	s6,88(s5)
  p->sz = sz;
    8020468c:	059ab423          	sd	s9,72(s5)
  p->trapframe->epc = elf.entry;  // initial program counter = main
    80204690:	060ab783          	ld	a5,96(s5)
    80204694:	e6043703          	ld	a4,-416(s0)
    80204698:	ef98                	sd	a4,24(a5)
  p->trapframe->sp = sp; // initial stack pointer
    8020469a:	060ab783          	ld	a5,96(s5)
    8020469e:	0327b823          	sd	s2,48(a5)
  proc_freepagetable(oldpagetable, oldsz);
    802046a2:	85ea                	mv	a1,s10
    802046a4:	ffffd097          	auipc	ra,0xffffd
    802046a8:	518080e7          	jalr	1304(ra) # 80201bbc <proc_freepagetable>
  w_satp(MAKE_SATP(p->kpagetable));
    802046ac:	058ab783          	ld	a5,88(s5)
    802046b0:	83b1                	srli	a5,a5,0xc
    802046b2:	577d                	li	a4,-1
    802046b4:	177e                	slli	a4,a4,0x3f
    802046b6:	8fd9                	or	a5,a5,a4
  asm volatile("csrw satp, %0" : : "r" (x));
    802046b8:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    802046bc:	12000073          	sfence.vma
  kvmfree(oldkpagetable, 0);
    802046c0:	4581                	li	a1,0
    802046c2:	854e                	mv	a0,s3
    802046c4:	ffffd097          	auipc	ra,0xffffd
    802046c8:	fae080e7          	jalr	-82(ra) # 80201672 <kvmfree>
  return argc; // this ends up in a0, the first argument to main(argc, argv)
    802046cc:	0004851b          	sext.w	a0,s1
    802046d0:	a089                	j	80204712 <exec+0x338>
    return -1;
    802046d2:	557d                	li	a0,-1
    802046d4:	a83d                	j	80204712 <exec+0x338>
    802046d6:	de943823          	sd	s1,-528(s0)
    proc_freepagetable(pagetable, sz);
    802046da:	df043583          	ld	a1,-528(s0)
    802046de:	e0843503          	ld	a0,-504(s0)
    802046e2:	ffffd097          	auipc	ra,0xffffd
    802046e6:	4da080e7          	jalr	1242(ra) # 80201bbc <proc_freepagetable>
    kvmfree(kpagetable, 0);
    802046ea:	4581                	li	a1,0
    802046ec:	855a                	mv	a0,s6
    802046ee:	ffffd097          	auipc	ra,0xffffd
    802046f2:	f84080e7          	jalr	-124(ra) # 80201672 <kvmfree>
    eunlock(ep);
    eput(ep);
  }
  return -1;
    802046f6:	557d                	li	a0,-1
  if(ep){
    802046f8:	000a0d63          	beqz	s4,80204712 <exec+0x338>
    eunlock(ep);
    802046fc:	8552                	mv	a0,s4
    802046fe:	00002097          	auipc	ra,0x2
    80204702:	3a4080e7          	jalr	932(ra) # 80206aa2 <eunlock>
    eput(ep);
    80204706:	8552                	mv	a0,s4
    80204708:	00002097          	auipc	ra,0x2
    8020470c:	3e8080e7          	jalr	1000(ra) # 80206af0 <eput>
  return -1;
    80204710:	557d                	li	a0,-1
}
    80204712:	22813083          	ld	ra,552(sp)
    80204716:	22013403          	ld	s0,544(sp)
    8020471a:	21813483          	ld	s1,536(sp)
    8020471e:	21013903          	ld	s2,528(sp)
    80204722:	20813983          	ld	s3,520(sp)
    80204726:	20013a03          	ld	s4,512(sp)
    8020472a:	7afe                	ld	s5,504(sp)
    8020472c:	7b5e                	ld	s6,496(sp)
    8020472e:	7bbe                	ld	s7,488(sp)
    80204730:	7c1e                	ld	s8,480(sp)
    80204732:	6cfe                	ld	s9,472(sp)
    80204734:	6d5e                	ld	s10,464(sp)
    80204736:	6dbe                	ld	s11,456(sp)
    80204738:	23010113          	addi	sp,sp,560
    8020473c:	8082                	ret
    8020473e:	de943823          	sd	s1,-528(s0)
    80204742:	bf61                	j	802046da <exec+0x300>
    80204744:	de943823          	sd	s1,-528(s0)
    80204748:	bf49                	j	802046da <exec+0x300>
    8020474a:	de943823          	sd	s1,-528(s0)
    8020474e:	b771                	j	802046da <exec+0x300>
  sz = sz1;
    80204750:	df943823          	sd	s9,-528(s0)
  ep = 0;
    80204754:	4a01                	li	s4,0
    80204756:	b751                	j	802046da <exec+0x300>
  sz = sz1;
    80204758:	df943823          	sd	s9,-528(s0)
  ep = 0;
    8020475c:	4a01                	li	s4,0
    8020475e:	bfb5                	j	802046da <exec+0x300>
  sz = sz1;
    80204760:	df943823          	sd	s9,-528(s0)
  ep = 0;
    80204764:	4a01                	li	s4,0
    80204766:	bf95                	j	802046da <exec+0x300>
    if((sz1 = uvmalloc(pagetable, kpagetable, sz, ph.vaddr + ph.memsz)) == 0)
    80204768:	df043483          	ld	s1,-528(s0)
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    8020476c:	e0043783          	ld	a5,-512(s0)
    80204770:	0017869b          	addiw	a3,a5,1
    80204774:	e0d43023          	sd	a3,-512(s0)
    80204778:	df843783          	ld	a5,-520(s0)
    8020477c:	0387879b          	addiw	a5,a5,56
    80204780:	e8045703          	lhu	a4,-384(s0)
    80204784:	d8e6dee3          	bge	a3,a4,80204520 <exec+0x146>
    if(eread(ep, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    80204788:	2781                	sext.w	a5,a5
    8020478a:	def43c23          	sd	a5,-520(s0)
    8020478e:	03800713          	li	a4,56
    80204792:	86be                	mv	a3,a5
    80204794:	de043603          	ld	a2,-544(s0)
    80204798:	4581                	li	a1,0
    8020479a:	8552                	mv	a0,s4
    8020479c:	00002097          	auipc	ra,0x2
    802047a0:	9cc080e7          	jalr	-1588(ra) # 80206168 <eread>
    802047a4:	03800793          	li	a5,56
    802047a8:	f2f517e3          	bne	a0,a5,802046d6 <exec+0x2fc>
    if(ph.type != ELF_PROG_LOAD)
    802047ac:	e1042783          	lw	a5,-496(s0)
    802047b0:	4705                	li	a4,1
    802047b2:	fae79de3          	bne	a5,a4,8020476c <exec+0x392>
    if(ph.memsz < ph.filesz)
    802047b6:	e3843683          	ld	a3,-456(s0)
    802047ba:	e3043783          	ld	a5,-464(s0)
    802047be:	f8f6e0e3          	bltu	a3,a5,8020473e <exec+0x364>
    if(ph.vaddr + ph.memsz < ph.vaddr)
    802047c2:	e2043783          	ld	a5,-480(s0)
    802047c6:	96be                	add	a3,a3,a5
    802047c8:	f6f6eee3          	bltu	a3,a5,80204744 <exec+0x36a>
    if((sz1 = uvmalloc(pagetable, kpagetable, sz, ph.vaddr + ph.memsz)) == 0)
    802047cc:	8626                	mv	a2,s1
    802047ce:	85da                	mv	a1,s6
    802047d0:	e0843503          	ld	a0,-504(s0)
    802047d4:	ffffd097          	auipc	ra,0xffffd
    802047d8:	836080e7          	jalr	-1994(ra) # 8020100a <uvmalloc>
    802047dc:	dea43823          	sd	a0,-528(s0)
    802047e0:	d52d                	beqz	a0,8020474a <exec+0x370>
    if(ph.vaddr % PGSIZE != 0)
    802047e2:	e2043c03          	ld	s8,-480(s0)
    802047e6:	dd043783          	ld	a5,-560(s0)
    802047ea:	00fc77b3          	and	a5,s8,a5
    802047ee:	ee0796e3          	bnez	a5,802046da <exec+0x300>
    if(loadseg(pagetable, ph.vaddr, ep, ph.off, ph.filesz) < 0)
    802047f2:	e1842c83          	lw	s9,-488(s0)
    802047f6:	e3042b83          	lw	s7,-464(s0)
  for(i = 0; i < sz; i += PGSIZE){
    802047fa:	f60b87e3          	beqz	s7,80204768 <exec+0x38e>
    802047fe:	89de                	mv	s3,s7
    80204800:	4481                	li	s1,0
    80204802:	b9ed                	j	802044fc <exec+0x122>
    kvmfree(kpagetable, 0);
    80204804:	4581                	li	a1,0
    80204806:	855a                	mv	a0,s6
    80204808:	ffffd097          	auipc	ra,0xffffd
    8020480c:	e6a080e7          	jalr	-406(ra) # 80201672 <kvmfree>
  return -1;
    80204810:	557d                	li	a0,-1
    80204812:	b701                	j	80204712 <exec+0x338>

0000000080204814 <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
    80204814:	7179                	addi	sp,sp,-48
    80204816:	f406                	sd	ra,40(sp)
    80204818:	f022                	sd	s0,32(sp)
    8020481a:	ec26                	sd	s1,24(sp)
    8020481c:	e84a                	sd	s2,16(sp)
    8020481e:	1800                	addi	s0,sp,48
    80204820:	892e                	mv	s2,a1
    80204822:	84b2                	mv	s1,a2
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    80204824:	fdc40593          	addi	a1,s0,-36
    80204828:	fffff097          	auipc	ra,0xfffff
    8020482c:	83a080e7          	jalr	-1990(ra) # 80203062 <argint>
    80204830:	04054063          	bltz	a0,80204870 <argfd+0x5c>
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == NULL)
    80204834:	fdc42703          	lw	a4,-36(s0)
    80204838:	47bd                	li	a5,15
    8020483a:	02e7ed63          	bltu	a5,a4,80204874 <argfd+0x60>
    8020483e:	ffffd097          	auipc	ra,0xffffd
    80204842:	1fe080e7          	jalr	510(ra) # 80201a3c <myproc>
    80204846:	fdc42703          	lw	a4,-36(s0)
    8020484a:	01a70793          	addi	a5,a4,26 # fffffffffffff01a <ebss_clear+0xffffffff7fdd901a>
    8020484e:	078e                	slli	a5,a5,0x3
    80204850:	953e                	add	a0,a0,a5
    80204852:	651c                	ld	a5,8(a0)
    80204854:	c395                	beqz	a5,80204878 <argfd+0x64>
    return -1;
  if(pfd)
    80204856:	00090463          	beqz	s2,8020485e <argfd+0x4a>
    *pfd = fd;
    8020485a:	00e92023          	sw	a4,0(s2)
  if(pf)
    *pf = f;
  return 0;
    8020485e:	4501                	li	a0,0
  if(pf)
    80204860:	c091                	beqz	s1,80204864 <argfd+0x50>
    *pf = f;
    80204862:	e09c                	sd	a5,0(s1)
}
    80204864:	70a2                	ld	ra,40(sp)
    80204866:	7402                	ld	s0,32(sp)
    80204868:	64e2                	ld	s1,24(sp)
    8020486a:	6942                	ld	s2,16(sp)
    8020486c:	6145                	addi	sp,sp,48
    8020486e:	8082                	ret
    return -1;
    80204870:	557d                	li	a0,-1
    80204872:	bfcd                	j	80204864 <argfd+0x50>
    return -1;
    80204874:	557d                	li	a0,-1
    80204876:	b7fd                	j	80204864 <argfd+0x50>
    80204878:	557d                	li	a0,-1
    8020487a:	b7ed                	j	80204864 <argfd+0x50>

000000008020487c <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
    8020487c:	1101                	addi	sp,sp,-32
    8020487e:	ec06                	sd	ra,24(sp)
    80204880:	e822                	sd	s0,16(sp)
    80204882:	e426                	sd	s1,8(sp)
    80204884:	1000                	addi	s0,sp,32
    80204886:	84aa                	mv	s1,a0
  int fd;
  struct proc *p = myproc();
    80204888:	ffffd097          	auipc	ra,0xffffd
    8020488c:	1b4080e7          	jalr	436(ra) # 80201a3c <myproc>
    80204890:	862a                	mv	a2,a0

  for(fd = 0; fd < NOFILE; fd++){
    80204892:	0d850793          	addi	a5,a0,216
    80204896:	4501                	li	a0,0
    80204898:	46c1                	li	a3,16
    if(p->ofile[fd] == 0){
    8020489a:	6398                	ld	a4,0(a5)
    8020489c:	cb19                	beqz	a4,802048b2 <fdalloc+0x36>
  for(fd = 0; fd < NOFILE; fd++){
    8020489e:	2505                	addiw	a0,a0,1
    802048a0:	07a1                	addi	a5,a5,8
    802048a2:	fed51ce3          	bne	a0,a3,8020489a <fdalloc+0x1e>
      p->ofile[fd] = f;
      return fd;
    }
  }
  return -1;
    802048a6:	557d                	li	a0,-1
}
    802048a8:	60e2                	ld	ra,24(sp)
    802048aa:	6442                	ld	s0,16(sp)
    802048ac:	64a2                	ld	s1,8(sp)
    802048ae:	6105                	addi	sp,sp,32
    802048b0:	8082                	ret
      p->ofile[fd] = f;
    802048b2:	01a50793          	addi	a5,a0,26
    802048b6:	078e                	slli	a5,a5,0x3
    802048b8:	963e                	add	a2,a2,a5
    802048ba:	e604                	sd	s1,8(a2)
      return fd;
    802048bc:	b7f5                	j	802048a8 <fdalloc+0x2c>

00000000802048be <create>:
  return filestat(f, st);
}

static struct dirent*
create(char *path, short type, int mode)
{
    802048be:	7169                	addi	sp,sp,-304
    802048c0:	f606                	sd	ra,296(sp)
    802048c2:	f222                	sd	s0,288(sp)
    802048c4:	ee26                	sd	s1,280(sp)
    802048c6:	ea4a                	sd	s2,272(sp)
    802048c8:	e64e                	sd	s3,264(sp)
    802048ca:	1a00                	addi	s0,sp,304
    802048cc:	892e                	mv	s2,a1
  struct dirent *ep, *dp;
  char name[FAT32_MAX_FILENAME + 1];

  if((dp = enameparent(path, name)) == NULL)
    802048ce:	ed040593          	addi	a1,s0,-304
    802048d2:	00003097          	auipc	ra,0x3
    802048d6:	99e080e7          	jalr	-1634(ra) # 80207270 <enameparent>
    802048da:	84aa                	mv	s1,a0
    802048dc:	c945                	beqz	a0,8020498c <create+0xce>
    mode = ATTR_READ_ONLY;
  } else {
    mode = 0;  
  }

  elock(dp);
    802048de:	00002097          	auipc	ra,0x2
    802048e2:	18e080e7          	jalr	398(ra) # 80206a6c <elock>
  if (type == T_DIR) {
    802048e6:	fff90613          	addi	a2,s2,-1
    802048ea:	00163613          	seqz	a2,a2
  if ((ep = ealloc(dp, name, mode)) == NULL) {
    802048ee:	0046161b          	slliw	a2,a2,0x4
    802048f2:	ed040593          	addi	a1,s0,-304
    802048f6:	8526                	mv	a0,s1
    802048f8:	00002097          	auipc	ra,0x2
    802048fc:	660080e7          	jalr	1632(ra) # 80206f58 <ealloc>
    80204900:	89aa                	mv	s3,a0
    80204902:	c529                	beqz	a0,8020494c <create+0x8e>
    eunlock(dp);
    eput(dp);
    return NULL;
  }
  
  if ((type == T_DIR && !(ep->attribute & ATTR_DIRECTORY)) ||
    80204904:	0009079b          	sext.w	a5,s2
    80204908:	4705                	li	a4,1
    8020490a:	04e78c63          	beq	a5,a4,80204962 <create+0xa4>
    8020490e:	2901                	sext.w	s2,s2
    80204910:	4789                	li	a5,2
    80204912:	00f91663          	bne	s2,a5,8020491e <create+0x60>
      (type == T_FILE && (ep->attribute & ATTR_DIRECTORY))) {
    80204916:	10054783          	lbu	a5,256(a0)
    8020491a:	8bc1                	andi	a5,a5,16
    8020491c:	e7b9                	bnez	a5,8020496a <create+0xac>
    eput(ep);
    eput(dp);
    return NULL;
  }

  eunlock(dp);
    8020491e:	8526                	mv	a0,s1
    80204920:	00002097          	auipc	ra,0x2
    80204924:	182080e7          	jalr	386(ra) # 80206aa2 <eunlock>
  eput(dp);
    80204928:	8526                	mv	a0,s1
    8020492a:	00002097          	auipc	ra,0x2
    8020492e:	1c6080e7          	jalr	454(ra) # 80206af0 <eput>

  elock(ep);
    80204932:	854e                	mv	a0,s3
    80204934:	00002097          	auipc	ra,0x2
    80204938:	138080e7          	jalr	312(ra) # 80206a6c <elock>
  return ep;
}
    8020493c:	854e                	mv	a0,s3
    8020493e:	70b2                	ld	ra,296(sp)
    80204940:	7412                	ld	s0,288(sp)
    80204942:	64f2                	ld	s1,280(sp)
    80204944:	6952                	ld	s2,272(sp)
    80204946:	69b2                	ld	s3,264(sp)
    80204948:	6155                	addi	sp,sp,304
    8020494a:	8082                	ret
    eunlock(dp);
    8020494c:	8526                	mv	a0,s1
    8020494e:	00002097          	auipc	ra,0x2
    80204952:	154080e7          	jalr	340(ra) # 80206aa2 <eunlock>
    eput(dp);
    80204956:	8526                	mv	a0,s1
    80204958:	00002097          	auipc	ra,0x2
    8020495c:	198080e7          	jalr	408(ra) # 80206af0 <eput>
    return NULL;
    80204960:	bff1                	j	8020493c <create+0x7e>
  if ((type == T_DIR && !(ep->attribute & ATTR_DIRECTORY)) ||
    80204962:	10054783          	lbu	a5,256(a0)
    80204966:	8bc1                	andi	a5,a5,16
    80204968:	fbdd                	bnez	a5,8020491e <create+0x60>
    eunlock(dp);
    8020496a:	8526                	mv	a0,s1
    8020496c:	00002097          	auipc	ra,0x2
    80204970:	136080e7          	jalr	310(ra) # 80206aa2 <eunlock>
    eput(ep);
    80204974:	854e                	mv	a0,s3
    80204976:	00002097          	auipc	ra,0x2
    8020497a:	17a080e7          	jalr	378(ra) # 80206af0 <eput>
    eput(dp);
    8020497e:	8526                	mv	a0,s1
    80204980:	00002097          	auipc	ra,0x2
    80204984:	170080e7          	jalr	368(ra) # 80206af0 <eput>
    return NULL;
    80204988:	4981                	li	s3,0
    8020498a:	bf4d                	j	8020493c <create+0x7e>
    return NULL;
    8020498c:	89aa                	mv	s3,a0
    8020498e:	b77d                	j	8020493c <create+0x7e>

0000000080204990 <sys_dup>:
{
    80204990:	7179                	addi	sp,sp,-48
    80204992:	f406                	sd	ra,40(sp)
    80204994:	f022                	sd	s0,32(sp)
    80204996:	ec26                	sd	s1,24(sp)
    80204998:	e84a                	sd	s2,16(sp)
    8020499a:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0)
    8020499c:	fd840613          	addi	a2,s0,-40
    802049a0:	4581                	li	a1,0
    802049a2:	4501                	li	a0,0
    802049a4:	00000097          	auipc	ra,0x0
    802049a8:	e70080e7          	jalr	-400(ra) # 80204814 <argfd>
    return -1;
    802049ac:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0)
    802049ae:	02054363          	bltz	a0,802049d4 <sys_dup+0x44>
  if((fd=fdalloc(f)) < 0)
    802049b2:	fd843903          	ld	s2,-40(s0)
    802049b6:	854a                	mv	a0,s2
    802049b8:	00000097          	auipc	ra,0x0
    802049bc:	ec4080e7          	jalr	-316(ra) # 8020487c <fdalloc>
    802049c0:	84aa                	mv	s1,a0
    return -1;
    802049c2:	57fd                	li	a5,-1
  if((fd=fdalloc(f)) < 0)
    802049c4:	00054863          	bltz	a0,802049d4 <sys_dup+0x44>
  filedup(f);
    802049c8:	854a                	mv	a0,s2
    802049ca:	fffff097          	auipc	ra,0xfffff
    802049ce:	318080e7          	jalr	792(ra) # 80203ce2 <filedup>
  return fd;
    802049d2:	87a6                	mv	a5,s1
}
    802049d4:	853e                	mv	a0,a5
    802049d6:	70a2                	ld	ra,40(sp)
    802049d8:	7402                	ld	s0,32(sp)
    802049da:	64e2                	ld	s1,24(sp)
    802049dc:	6942                	ld	s2,16(sp)
    802049de:	6145                	addi	sp,sp,48
    802049e0:	8082                	ret

00000000802049e2 <sys_read>:
{
    802049e2:	7179                	addi	sp,sp,-48
    802049e4:	f406                	sd	ra,40(sp)
    802049e6:	f022                	sd	s0,32(sp)
    802049e8:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    802049ea:	fe840613          	addi	a2,s0,-24
    802049ee:	4581                	li	a1,0
    802049f0:	4501                	li	a0,0
    802049f2:	00000097          	auipc	ra,0x0
    802049f6:	e22080e7          	jalr	-478(ra) # 80204814 <argfd>
    return -1;
    802049fa:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    802049fc:	04054163          	bltz	a0,80204a3e <sys_read+0x5c>
    80204a00:	fe440593          	addi	a1,s0,-28
    80204a04:	4509                	li	a0,2
    80204a06:	ffffe097          	auipc	ra,0xffffe
    80204a0a:	65c080e7          	jalr	1628(ra) # 80203062 <argint>
    return -1;
    80204a0e:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204a10:	02054763          	bltz	a0,80204a3e <sys_read+0x5c>
    80204a14:	fd840593          	addi	a1,s0,-40
    80204a18:	4505                	li	a0,1
    80204a1a:	ffffe097          	auipc	ra,0xffffe
    80204a1e:	6aa080e7          	jalr	1706(ra) # 802030c4 <argaddr>
    return -1;
    80204a22:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204a24:	00054d63          	bltz	a0,80204a3e <sys_read+0x5c>
  return fileread(f, p, n);
    80204a28:	fe442603          	lw	a2,-28(s0)
    80204a2c:	fd843583          	ld	a1,-40(s0)
    80204a30:	fe843503          	ld	a0,-24(s0)
    80204a34:	fffff097          	auipc	ra,0xfffff
    80204a38:	41a080e7          	jalr	1050(ra) # 80203e4e <fileread>
    80204a3c:	87aa                	mv	a5,a0
}
    80204a3e:	853e                	mv	a0,a5
    80204a40:	70a2                	ld	ra,40(sp)
    80204a42:	7402                	ld	s0,32(sp)
    80204a44:	6145                	addi	sp,sp,48
    80204a46:	8082                	ret

0000000080204a48 <sys_write>:
{
    80204a48:	7179                	addi	sp,sp,-48
    80204a4a:	f406                	sd	ra,40(sp)
    80204a4c:	f022                	sd	s0,32(sp)
    80204a4e:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204a50:	fe840613          	addi	a2,s0,-24
    80204a54:	4581                	li	a1,0
    80204a56:	4501                	li	a0,0
    80204a58:	00000097          	auipc	ra,0x0
    80204a5c:	dbc080e7          	jalr	-580(ra) # 80204814 <argfd>
    return -1;
    80204a60:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204a62:	04054163          	bltz	a0,80204aa4 <sys_write+0x5c>
    80204a66:	fe440593          	addi	a1,s0,-28
    80204a6a:	4509                	li	a0,2
    80204a6c:	ffffe097          	auipc	ra,0xffffe
    80204a70:	5f6080e7          	jalr	1526(ra) # 80203062 <argint>
    return -1;
    80204a74:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204a76:	02054763          	bltz	a0,80204aa4 <sys_write+0x5c>
    80204a7a:	fd840593          	addi	a1,s0,-40
    80204a7e:	4505                	li	a0,1
    80204a80:	ffffe097          	auipc	ra,0xffffe
    80204a84:	644080e7          	jalr	1604(ra) # 802030c4 <argaddr>
    return -1;
    80204a88:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204a8a:	00054d63          	bltz	a0,80204aa4 <sys_write+0x5c>
  return filewrite(f, p, n);
    80204a8e:	fe442603          	lw	a2,-28(s0)
    80204a92:	fd843583          	ld	a1,-40(s0)
    80204a96:	fe843503          	ld	a0,-24(s0)
    80204a9a:	fffff097          	auipc	ra,0xfffff
    80204a9e:	476080e7          	jalr	1142(ra) # 80203f10 <filewrite>
    80204aa2:	87aa                	mv	a5,a0
}
    80204aa4:	853e                	mv	a0,a5
    80204aa6:	70a2                	ld	ra,40(sp)
    80204aa8:	7402                	ld	s0,32(sp)
    80204aaa:	6145                	addi	sp,sp,48
    80204aac:	8082                	ret

0000000080204aae <sys_close>:
{
    80204aae:	1101                	addi	sp,sp,-32
    80204ab0:	ec06                	sd	ra,24(sp)
    80204ab2:	e822                	sd	s0,16(sp)
    80204ab4:	1000                	addi	s0,sp,32
  if(argfd(0, &fd, &f) < 0)
    80204ab6:	fe040613          	addi	a2,s0,-32
    80204aba:	fec40593          	addi	a1,s0,-20
    80204abe:	4501                	li	a0,0
    80204ac0:	00000097          	auipc	ra,0x0
    80204ac4:	d54080e7          	jalr	-684(ra) # 80204814 <argfd>
    return -1;
    80204ac8:	57fd                	li	a5,-1
  if(argfd(0, &fd, &f) < 0)
    80204aca:	02054463          	bltz	a0,80204af2 <sys_close+0x44>
  myproc()->ofile[fd] = 0;
    80204ace:	ffffd097          	auipc	ra,0xffffd
    80204ad2:	f6e080e7          	jalr	-146(ra) # 80201a3c <myproc>
    80204ad6:	fec42783          	lw	a5,-20(s0)
    80204ada:	07e9                	addi	a5,a5,26
    80204adc:	078e                	slli	a5,a5,0x3
    80204ade:	953e                	add	a0,a0,a5
    80204ae0:	00053423          	sd	zero,8(a0)
  fileclose(f);
    80204ae4:	fe043503          	ld	a0,-32(s0)
    80204ae8:	fffff097          	auipc	ra,0xfffff
    80204aec:	24c080e7          	jalr	588(ra) # 80203d34 <fileclose>
  return 0;
    80204af0:	4781                	li	a5,0
}
    80204af2:	853e                	mv	a0,a5
    80204af4:	60e2                	ld	ra,24(sp)
    80204af6:	6442                	ld	s0,16(sp)
    80204af8:	6105                	addi	sp,sp,32
    80204afa:	8082                	ret

0000000080204afc <sys_fstat>:
{
    80204afc:	1101                	addi	sp,sp,-32
    80204afe:	ec06                	sd	ra,24(sp)
    80204b00:	e822                	sd	s0,16(sp)
    80204b02:	1000                	addi	s0,sp,32
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204b04:	fe840613          	addi	a2,s0,-24
    80204b08:	4581                	li	a1,0
    80204b0a:	4501                	li	a0,0
    80204b0c:	00000097          	auipc	ra,0x0
    80204b10:	d08080e7          	jalr	-760(ra) # 80204814 <argfd>
    return -1;
    80204b14:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204b16:	02054563          	bltz	a0,80204b40 <sys_fstat+0x44>
    80204b1a:	fe040593          	addi	a1,s0,-32
    80204b1e:	4505                	li	a0,1
    80204b20:	ffffe097          	auipc	ra,0xffffe
    80204b24:	5a4080e7          	jalr	1444(ra) # 802030c4 <argaddr>
    return -1;
    80204b28:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204b2a:	00054b63          	bltz	a0,80204b40 <sys_fstat+0x44>
  return filestat(f, st);
    80204b2e:	fe043583          	ld	a1,-32(s0)
    80204b32:	fe843503          	ld	a0,-24(s0)
    80204b36:	fffff097          	auipc	ra,0xfffff
    80204b3a:	2b4080e7          	jalr	692(ra) # 80203dea <filestat>
    80204b3e:	87aa                	mv	a5,a0
}
    80204b40:	853e                	mv	a0,a5
    80204b42:	60e2                	ld	ra,24(sp)
    80204b44:	6442                	ld	s0,16(sp)
    80204b46:	6105                	addi	sp,sp,32
    80204b48:	8082                	ret

0000000080204b4a <sys_open>:

uint64
sys_open(void)
{
    80204b4a:	7129                	addi	sp,sp,-320
    80204b4c:	fe06                	sd	ra,312(sp)
    80204b4e:	fa22                	sd	s0,304(sp)
    80204b50:	f626                	sd	s1,296(sp)
    80204b52:	f24a                	sd	s2,288(sp)
    80204b54:	ee4e                	sd	s3,280(sp)
    80204b56:	0280                	addi	s0,sp,320
  char path[FAT32_MAX_PATH];
  int fd, omode;
  struct file *f;
  struct dirent *ep;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argint(1, &omode) < 0)
    80204b58:	10400613          	li	a2,260
    80204b5c:	ec840593          	addi	a1,s0,-312
    80204b60:	4501                	li	a0,0
    80204b62:	ffffe097          	auipc	ra,0xffffe
    80204b66:	584080e7          	jalr	1412(ra) # 802030e6 <argstr>
    80204b6a:	87aa                	mv	a5,a0
    return -1;
    80204b6c:	557d                	li	a0,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argint(1, &omode) < 0)
    80204b6e:	0807ce63          	bltz	a5,80204c0a <sys_open+0xc0>
    80204b72:	ec440593          	addi	a1,s0,-316
    80204b76:	4505                	li	a0,1
    80204b78:	ffffe097          	auipc	ra,0xffffe
    80204b7c:	4ea080e7          	jalr	1258(ra) # 80203062 <argint>
    80204b80:	0e054163          	bltz	a0,80204c62 <sys_open+0x118>

  if(omode & O_CREATE){
    80204b84:	ec442603          	lw	a2,-316(s0)
    80204b88:	04067793          	andi	a5,a2,64
    80204b8c:	c7d1                	beqz	a5,80204c18 <sys_open+0xce>
    ep = create(path, T_FILE, omode);
    80204b8e:	4589                	li	a1,2
    80204b90:	ec840513          	addi	a0,s0,-312
    80204b94:	00000097          	auipc	ra,0x0
    80204b98:	d2a080e7          	jalr	-726(ra) # 802048be <create>
    80204b9c:	892a                	mv	s2,a0
    if(ep == NULL){
    80204b9e:	c561                	beqz	a0,80204c66 <sys_open+0x11c>
      eput(ep);
      return -1;
    }
  }

  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    80204ba0:	fffff097          	auipc	ra,0xfffff
    80204ba4:	0d8080e7          	jalr	216(ra) # 80203c78 <filealloc>
    80204ba8:	89aa                	mv	s3,a0
    80204baa:	c579                	beqz	a0,80204c78 <sys_open+0x12e>
    80204bac:	00000097          	auipc	ra,0x0
    80204bb0:	cd0080e7          	jalr	-816(ra) # 8020487c <fdalloc>
    80204bb4:	84aa                	mv	s1,a0
    80204bb6:	0a054c63          	bltz	a0,80204c6e <sys_open+0x124>
    eunlock(ep);
    eput(ep);
    return -1;
  }

  if(!(ep->attribute & ATTR_DIRECTORY) && (omode & O_TRUNC)){
    80204bba:	10094783          	lbu	a5,256(s2)
    80204bbe:	8bc1                	andi	a5,a5,16
    80204bc0:	e791                	bnez	a5,80204bcc <sys_open+0x82>
    80204bc2:	ec442783          	lw	a5,-316(s0)
    80204bc6:	4007f793          	andi	a5,a5,1024
    80204bca:	e7d1                	bnez	a5,80204c56 <sys_open+0x10c>
    etrunc(ep);
  }

  f->type = FD_ENTRY;
    80204bcc:	4789                	li	a5,2
    80204bce:	00f9a023          	sw	a5,0(s3)
  f->off = (omode & O_APPEND) ? ep->file_size : 0;
    80204bd2:	ec442783          	lw	a5,-316(s0)
    80204bd6:	0047f693          	andi	a3,a5,4
    80204bda:	4701                	li	a4,0
    80204bdc:	c299                	beqz	a3,80204be2 <sys_open+0x98>
    80204bde:	10892703          	lw	a4,264(s2)
    80204be2:	02e9a023          	sw	a4,32(s3)
  f->ep = ep;
    80204be6:	0129bc23          	sd	s2,24(s3)
  f->readable = !(omode & O_WRONLY);
    80204bea:	0017c713          	xori	a4,a5,1
    80204bee:	8b05                	andi	a4,a4,1
    80204bf0:	00e98423          	sb	a4,8(s3)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80204bf4:	8b8d                	andi	a5,a5,3
    80204bf6:	00f037b3          	snez	a5,a5
    80204bfa:	00f984a3          	sb	a5,9(s3)

  eunlock(ep);
    80204bfe:	854a                	mv	a0,s2
    80204c00:	00002097          	auipc	ra,0x2
    80204c04:	ea2080e7          	jalr	-350(ra) # 80206aa2 <eunlock>

  return fd;
    80204c08:	8526                	mv	a0,s1
}
    80204c0a:	70f2                	ld	ra,312(sp)
    80204c0c:	7452                	ld	s0,304(sp)
    80204c0e:	74b2                	ld	s1,296(sp)
    80204c10:	7912                	ld	s2,288(sp)
    80204c12:	69f2                	ld	s3,280(sp)
    80204c14:	6131                	addi	sp,sp,320
    80204c16:	8082                	ret
    if((ep = ename(path)) == NULL){
    80204c18:	ec840513          	addi	a0,s0,-312
    80204c1c:	00002097          	auipc	ra,0x2
    80204c20:	58a080e7          	jalr	1418(ra) # 802071a6 <ename>
    80204c24:	892a                	mv	s2,a0
    80204c26:	c131                	beqz	a0,80204c6a <sys_open+0x120>
    elock(ep);
    80204c28:	00002097          	auipc	ra,0x2
    80204c2c:	e44080e7          	jalr	-444(ra) # 80206a6c <elock>
    if((ep->attribute & ATTR_DIRECTORY) && omode != O_RDONLY){
    80204c30:	10094783          	lbu	a5,256(s2)
    80204c34:	8bc1                	andi	a5,a5,16
    80204c36:	d7ad                	beqz	a5,80204ba0 <sys_open+0x56>
    80204c38:	ec442783          	lw	a5,-316(s0)
    80204c3c:	d3b5                	beqz	a5,80204ba0 <sys_open+0x56>
      eunlock(ep);
    80204c3e:	854a                	mv	a0,s2
    80204c40:	00002097          	auipc	ra,0x2
    80204c44:	e62080e7          	jalr	-414(ra) # 80206aa2 <eunlock>
      eput(ep);
    80204c48:	854a                	mv	a0,s2
    80204c4a:	00002097          	auipc	ra,0x2
    80204c4e:	ea6080e7          	jalr	-346(ra) # 80206af0 <eput>
      return -1;
    80204c52:	557d                	li	a0,-1
    80204c54:	bf5d                	j	80204c0a <sys_open+0xc0>
    etrunc(ep);
    80204c56:	854a                	mv	a0,s2
    80204c58:	00002097          	auipc	ra,0x2
    80204c5c:	daa080e7          	jalr	-598(ra) # 80206a02 <etrunc>
    80204c60:	b7b5                	j	80204bcc <sys_open+0x82>
    return -1;
    80204c62:	557d                	li	a0,-1
    80204c64:	b75d                	j	80204c0a <sys_open+0xc0>
      return -1;
    80204c66:	557d                	li	a0,-1
    80204c68:	b74d                	j	80204c0a <sys_open+0xc0>
      return -1;
    80204c6a:	557d                	li	a0,-1
    80204c6c:	bf79                	j	80204c0a <sys_open+0xc0>
      fileclose(f);
    80204c6e:	854e                	mv	a0,s3
    80204c70:	fffff097          	auipc	ra,0xfffff
    80204c74:	0c4080e7          	jalr	196(ra) # 80203d34 <fileclose>
    eunlock(ep);
    80204c78:	854a                	mv	a0,s2
    80204c7a:	00002097          	auipc	ra,0x2
    80204c7e:	e28080e7          	jalr	-472(ra) # 80206aa2 <eunlock>
    eput(ep);
    80204c82:	854a                	mv	a0,s2
    80204c84:	00002097          	auipc	ra,0x2
    80204c88:	e6c080e7          	jalr	-404(ra) # 80206af0 <eput>
    return -1;
    80204c8c:	557d                	li	a0,-1
    80204c8e:	bfb5                	j	80204c0a <sys_open+0xc0>

0000000080204c90 <sys_mkdir>:

uint64
sys_mkdir(void)
{
    80204c90:	7169                	addi	sp,sp,-304
    80204c92:	f606                	sd	ra,296(sp)
    80204c94:	f222                	sd	s0,288(sp)
    80204c96:	ee26                	sd	s1,280(sp)
    80204c98:	1a00                	addi	s0,sp,304
  char path[FAT32_MAX_PATH];
  struct dirent *ep;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = create(path, T_DIR, 0)) == 0){
    80204c9a:	10400613          	li	a2,260
    80204c9e:	ed840593          	addi	a1,s0,-296
    80204ca2:	4501                	li	a0,0
    80204ca4:	ffffe097          	auipc	ra,0xffffe
    80204ca8:	442080e7          	jalr	1090(ra) # 802030e6 <argstr>
    return -1;
    80204cac:	57fd                	li	a5,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = create(path, T_DIR, 0)) == 0){
    80204cae:	02054663          	bltz	a0,80204cda <sys_mkdir+0x4a>
    80204cb2:	4601                	li	a2,0
    80204cb4:	4585                	li	a1,1
    80204cb6:	ed840513          	addi	a0,s0,-296
    80204cba:	00000097          	auipc	ra,0x0
    80204cbe:	c04080e7          	jalr	-1020(ra) # 802048be <create>
    80204cc2:	84aa                	mv	s1,a0
    80204cc4:	c10d                	beqz	a0,80204ce6 <sys_mkdir+0x56>
  }
  eunlock(ep);
    80204cc6:	00002097          	auipc	ra,0x2
    80204cca:	ddc080e7          	jalr	-548(ra) # 80206aa2 <eunlock>
  eput(ep);
    80204cce:	8526                	mv	a0,s1
    80204cd0:	00002097          	auipc	ra,0x2
    80204cd4:	e20080e7          	jalr	-480(ra) # 80206af0 <eput>
  return 0;
    80204cd8:	4781                	li	a5,0
}
    80204cda:	853e                	mv	a0,a5
    80204cdc:	70b2                	ld	ra,296(sp)
    80204cde:	7412                	ld	s0,288(sp)
    80204ce0:	64f2                	ld	s1,280(sp)
    80204ce2:	6155                	addi	sp,sp,304
    80204ce4:	8082                	ret
    return -1;
    80204ce6:	57fd                	li	a5,-1
    80204ce8:	bfcd                	j	80204cda <sys_mkdir+0x4a>

0000000080204cea <sys_chdir>:

uint64
sys_chdir(void)
{
    80204cea:	7169                	addi	sp,sp,-304
    80204cec:	f606                	sd	ra,296(sp)
    80204cee:	f222                	sd	s0,288(sp)
    80204cf0:	ee26                	sd	s1,280(sp)
    80204cf2:	ea4a                	sd	s2,272(sp)
    80204cf4:	1a00                	addi	s0,sp,304
  char path[FAT32_MAX_PATH];
  struct dirent *ep;
  struct proc *curr_proc = myproc();
    80204cf6:	ffffd097          	auipc	ra,0xffffd
    80204cfa:	d46080e7          	jalr	-698(ra) # 80201a3c <myproc>
    80204cfe:	892a                	mv	s2,a0
  
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = ename(path)) == NULL){
    80204d00:	10400613          	li	a2,260
    80204d04:	ed840593          	addi	a1,s0,-296
    80204d08:	4501                	li	a0,0
    80204d0a:	ffffe097          	auipc	ra,0xffffe
    80204d0e:	3dc080e7          	jalr	988(ra) # 802030e6 <argstr>
    return -1;
    80204d12:	57fd                	li	a5,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = ename(path)) == NULL){
    80204d14:	04054b63          	bltz	a0,80204d6a <sys_chdir+0x80>
    80204d18:	ed840513          	addi	a0,s0,-296
    80204d1c:	00002097          	auipc	ra,0x2
    80204d20:	48a080e7          	jalr	1162(ra) # 802071a6 <ename>
    80204d24:	84aa                	mv	s1,a0
    80204d26:	c52d                	beqz	a0,80204d90 <sys_chdir+0xa6>
  }
  printf("Running: CHDIR ... path: %s\n",  path);
    80204d28:	ed840593          	addi	a1,s0,-296
    80204d2c:	00005517          	auipc	a0,0x5
    80204d30:	f2c50513          	addi	a0,a0,-212 # 80209c58 <digits+0x8d8>
    80204d34:	ffffb097          	auipc	ra,0xffffb
    80204d38:	45a080e7          	jalr	1114(ra) # 8020018e <printf>
  elock(ep);
    80204d3c:	8526                	mv	a0,s1
    80204d3e:	00002097          	auipc	ra,0x2
    80204d42:	d2e080e7          	jalr	-722(ra) # 80206a6c <elock>
  if(!(ep->attribute & ATTR_DIRECTORY)){
    80204d46:	1004c783          	lbu	a5,256(s1)
    80204d4a:	8bc1                	andi	a5,a5,16
    80204d4c:	c795                	beqz	a5,80204d78 <sys_chdir+0x8e>
    eunlock(ep);
    eput(ep);
    return -1;
  }
  eunlock(ep);
    80204d4e:	8526                	mv	a0,s1
    80204d50:	00002097          	auipc	ra,0x2
    80204d54:	d52080e7          	jalr	-686(ra) # 80206aa2 <eunlock>
  eput(curr_proc->cwd);
    80204d58:	15893503          	ld	a0,344(s2)
    80204d5c:	00002097          	auipc	ra,0x2
    80204d60:	d94080e7          	jalr	-620(ra) # 80206af0 <eput>
  curr_proc->cwd = ep;
    80204d64:	14993c23          	sd	s1,344(s2)
  return 0;
    80204d68:	4781                	li	a5,0
}
    80204d6a:	853e                	mv	a0,a5
    80204d6c:	70b2                	ld	ra,296(sp)
    80204d6e:	7412                	ld	s0,288(sp)
    80204d70:	64f2                	ld	s1,280(sp)
    80204d72:	6952                	ld	s2,272(sp)
    80204d74:	6155                	addi	sp,sp,304
    80204d76:	8082                	ret
    eunlock(ep);
    80204d78:	8526                	mv	a0,s1
    80204d7a:	00002097          	auipc	ra,0x2
    80204d7e:	d28080e7          	jalr	-728(ra) # 80206aa2 <eunlock>
    eput(ep);
    80204d82:	8526                	mv	a0,s1
    80204d84:	00002097          	auipc	ra,0x2
    80204d88:	d6c080e7          	jalr	-660(ra) # 80206af0 <eput>
    return -1;
    80204d8c:	57fd                	li	a5,-1
    80204d8e:	bff1                	j	80204d6a <sys_chdir+0x80>
    return -1;
    80204d90:	57fd                	li	a5,-1
    80204d92:	bfe1                	j	80204d6a <sys_chdir+0x80>

0000000080204d94 <sys_pipe>:

uint64
sys_pipe(void)
{
    80204d94:	7139                	addi	sp,sp,-64
    80204d96:	fc06                	sd	ra,56(sp)
    80204d98:	f822                	sd	s0,48(sp)
    80204d9a:	f426                	sd	s1,40(sp)
    80204d9c:	0080                	addi	s0,sp,64
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();
    80204d9e:	ffffd097          	auipc	ra,0xffffd
    80204da2:	c9e080e7          	jalr	-866(ra) # 80201a3c <myproc>
    80204da6:	84aa                	mv	s1,a0

  if(argaddr(0, &fdarray) < 0)
    80204da8:	fd840593          	addi	a1,s0,-40
    80204dac:	4501                	li	a0,0
    80204dae:	ffffe097          	auipc	ra,0xffffe
    80204db2:	316080e7          	jalr	790(ra) # 802030c4 <argaddr>
    return -1;
    80204db6:	57fd                	li	a5,-1
  if(argaddr(0, &fdarray) < 0)
    80204db8:	0c054e63          	bltz	a0,80204e94 <sys_pipe+0x100>
  if(pipealloc(&rf, &wf) < 0)
    80204dbc:	fc840593          	addi	a1,s0,-56
    80204dc0:	fd040513          	addi	a0,s0,-48
    80204dc4:	fffff097          	auipc	ra,0xfffff
    80204dc8:	2e2080e7          	jalr	738(ra) # 802040a6 <pipealloc>
    return -1;
    80204dcc:	57fd                	li	a5,-1
  if(pipealloc(&rf, &wf) < 0)
    80204dce:	0c054363          	bltz	a0,80204e94 <sys_pipe+0x100>
  fd0 = -1;
    80204dd2:	fcf42223          	sw	a5,-60(s0)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    80204dd6:	fd043503          	ld	a0,-48(s0)
    80204dda:	00000097          	auipc	ra,0x0
    80204dde:	aa2080e7          	jalr	-1374(ra) # 8020487c <fdalloc>
    80204de2:	fca42223          	sw	a0,-60(s0)
    80204de6:	08054a63          	bltz	a0,80204e7a <sys_pipe+0xe6>
    80204dea:	fc843503          	ld	a0,-56(s0)
    80204dee:	00000097          	auipc	ra,0x0
    80204df2:	a8e080e7          	jalr	-1394(ra) # 8020487c <fdalloc>
    80204df6:	fca42023          	sw	a0,-64(s0)
    80204dfa:	06054763          	bltz	a0,80204e68 <sys_pipe+0xd4>
    fileclose(wf);
    return -1;
  }
  // if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
  //    copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
  if(copyout2(fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80204dfe:	4611                	li	a2,4
    80204e00:	fc440593          	addi	a1,s0,-60
    80204e04:	fd843503          	ld	a0,-40(s0)
    80204e08:	ffffc097          	auipc	ra,0xffffc
    80204e0c:	56a080e7          	jalr	1386(ra) # 80201372 <copyout2>
    80204e10:	00054f63          	bltz	a0,80204e2e <sys_pipe+0x9a>
     copyout2(fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    80204e14:	4611                	li	a2,4
    80204e16:	fc040593          	addi	a1,s0,-64
    80204e1a:	fd843503          	ld	a0,-40(s0)
    80204e1e:	0511                	addi	a0,a0,4
    80204e20:	ffffc097          	auipc	ra,0xffffc
    80204e24:	552080e7          	jalr	1362(ra) # 80201372 <copyout2>
    p->ofile[fd1] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  return 0;
    80204e28:	4781                	li	a5,0
  if(copyout2(fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80204e2a:	06055563          	bgez	a0,80204e94 <sys_pipe+0x100>
    p->ofile[fd0] = 0;
    80204e2e:	fc442783          	lw	a5,-60(s0)
    80204e32:	07e9                	addi	a5,a5,26
    80204e34:	078e                	slli	a5,a5,0x3
    80204e36:	97a6                	add	a5,a5,s1
    80204e38:	0007b423          	sd	zero,8(a5)
    p->ofile[fd1] = 0;
    80204e3c:	fc042783          	lw	a5,-64(s0)
    80204e40:	07e9                	addi	a5,a5,26
    80204e42:	078e                	slli	a5,a5,0x3
    80204e44:	00f48533          	add	a0,s1,a5
    80204e48:	00053423          	sd	zero,8(a0)
    fileclose(rf);
    80204e4c:	fd043503          	ld	a0,-48(s0)
    80204e50:	fffff097          	auipc	ra,0xfffff
    80204e54:	ee4080e7          	jalr	-284(ra) # 80203d34 <fileclose>
    fileclose(wf);
    80204e58:	fc843503          	ld	a0,-56(s0)
    80204e5c:	fffff097          	auipc	ra,0xfffff
    80204e60:	ed8080e7          	jalr	-296(ra) # 80203d34 <fileclose>
    return -1;
    80204e64:	57fd                	li	a5,-1
    80204e66:	a03d                	j	80204e94 <sys_pipe+0x100>
    if(fd0 >= 0)
    80204e68:	fc442783          	lw	a5,-60(s0)
    80204e6c:	0007c763          	bltz	a5,80204e7a <sys_pipe+0xe6>
      p->ofile[fd0] = 0;
    80204e70:	07e9                	addi	a5,a5,26
    80204e72:	078e                	slli	a5,a5,0x3
    80204e74:	97a6                	add	a5,a5,s1
    80204e76:	0007b423          	sd	zero,8(a5)
    fileclose(rf);
    80204e7a:	fd043503          	ld	a0,-48(s0)
    80204e7e:	fffff097          	auipc	ra,0xfffff
    80204e82:	eb6080e7          	jalr	-330(ra) # 80203d34 <fileclose>
    fileclose(wf);
    80204e86:	fc843503          	ld	a0,-56(s0)
    80204e8a:	fffff097          	auipc	ra,0xfffff
    80204e8e:	eaa080e7          	jalr	-342(ra) # 80203d34 <fileclose>
    return -1;
    80204e92:	57fd                	li	a5,-1
}
    80204e94:	853e                	mv	a0,a5
    80204e96:	70e2                	ld	ra,56(sp)
    80204e98:	7442                	ld	s0,48(sp)
    80204e9a:	74a2                	ld	s1,40(sp)
    80204e9c:	6121                	addi	sp,sp,64
    80204e9e:	8082                	ret

0000000080204ea0 <sys_dev>:

// To open console device.
uint64
sys_dev(void)
{
    80204ea0:	7179                	addi	sp,sp,-48
    80204ea2:	f406                	sd	ra,40(sp)
    80204ea4:	f022                	sd	s0,32(sp)
    80204ea6:	ec26                	sd	s1,24(sp)
    80204ea8:	1800                	addi	s0,sp,48
  int fd, omode;
  int major, minor;
  struct file *f;

  if(argint(0, &omode) < 0 || argint(1, &major) < 0 || argint(2, &minor) < 0){
    80204eaa:	fdc40593          	addi	a1,s0,-36
    80204eae:	4501                	li	a0,0
    80204eb0:	ffffe097          	auipc	ra,0xffffe
    80204eb4:	1b2080e7          	jalr	434(ra) # 80203062 <argint>
    80204eb8:	08054a63          	bltz	a0,80204f4c <sys_dev+0xac>
    80204ebc:	fd840593          	addi	a1,s0,-40
    80204ec0:	4505                	li	a0,1
    80204ec2:	ffffe097          	auipc	ra,0xffffe
    80204ec6:	1a0080e7          	jalr	416(ra) # 80203062 <argint>
    80204eca:	08054763          	bltz	a0,80204f58 <sys_dev+0xb8>
    80204ece:	fd440593          	addi	a1,s0,-44
    80204ed2:	4509                	li	a0,2
    80204ed4:	ffffe097          	auipc	ra,0xffffe
    80204ed8:	18e080e7          	jalr	398(ra) # 80203062 <argint>
    80204edc:	08054063          	bltz	a0,80204f5c <sys_dev+0xbc>
    return -1;
  }

  if(omode & O_CREATE){
    80204ee0:	fdc42783          	lw	a5,-36(s0)
    80204ee4:	0407f793          	andi	a5,a5,64
    80204ee8:	ebb1                	bnez	a5,80204f3c <sys_dev+0x9c>
    panic("dev file on FAT");
  }

  if(major < 0 || major >= NDEV)
    80204eea:	fd842703          	lw	a4,-40(s0)
    80204eee:	47a5                	li	a5,9
    return -1;
    80204ef0:	557d                	li	a0,-1
  if(major < 0 || major >= NDEV)
    80204ef2:	04e7ee63          	bltu	a5,a4,80204f4e <sys_dev+0xae>

  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    80204ef6:	fffff097          	auipc	ra,0xfffff
    80204efa:	d82080e7          	jalr	-638(ra) # 80203c78 <filealloc>
    80204efe:	84aa                	mv	s1,a0
    80204f00:	c125                	beqz	a0,80204f60 <sys_dev+0xc0>
    80204f02:	00000097          	auipc	ra,0x0
    80204f06:	97a080e7          	jalr	-1670(ra) # 8020487c <fdalloc>
    80204f0a:	04054d63          	bltz	a0,80204f64 <sys_dev+0xc4>
    if(f)
      fileclose(f);
    return -1;
  }

  f->type = FD_DEVICE;
    80204f0e:	478d                	li	a5,3
    80204f10:	c09c                	sw	a5,0(s1)
  f->off = 0;
    80204f12:	0204a023          	sw	zero,32(s1)
  f->ep = 0;
    80204f16:	0004bc23          	sd	zero,24(s1)
  f->major = major;
    80204f1a:	fd842783          	lw	a5,-40(s0)
    80204f1e:	02f49223          	sh	a5,36(s1)
  f->readable = !(omode & O_WRONLY);
    80204f22:	fdc42783          	lw	a5,-36(s0)
    80204f26:	0017c713          	xori	a4,a5,1
    80204f2a:	8b05                	andi	a4,a4,1
    80204f2c:	00e48423          	sb	a4,8(s1)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80204f30:	8b8d                	andi	a5,a5,3
    80204f32:	00f037b3          	snez	a5,a5
    80204f36:	00f484a3          	sb	a5,9(s1)

  return fd;
    80204f3a:	a811                	j	80204f4e <sys_dev+0xae>
    panic("dev file on FAT");
    80204f3c:	00005517          	auipc	a0,0x5
    80204f40:	d3c50513          	addi	a0,a0,-708 # 80209c78 <digits+0x8f8>
    80204f44:	ffffb097          	auipc	ra,0xffffb
    80204f48:	200080e7          	jalr	512(ra) # 80200144 <panic>
    return -1;
    80204f4c:	557d                	li	a0,-1
}
    80204f4e:	70a2                	ld	ra,40(sp)
    80204f50:	7402                	ld	s0,32(sp)
    80204f52:	64e2                	ld	s1,24(sp)
    80204f54:	6145                	addi	sp,sp,48
    80204f56:	8082                	ret
    return -1;
    80204f58:	557d                	li	a0,-1
    80204f5a:	bfd5                	j	80204f4e <sys_dev+0xae>
    80204f5c:	557d                	li	a0,-1
    80204f5e:	bfc5                	j	80204f4e <sys_dev+0xae>
    return -1;
    80204f60:	557d                	li	a0,-1
    80204f62:	b7f5                	j	80204f4e <sys_dev+0xae>
      fileclose(f);
    80204f64:	8526                	mv	a0,s1
    80204f66:	fffff097          	auipc	ra,0xfffff
    80204f6a:	dce080e7          	jalr	-562(ra) # 80203d34 <fileclose>
    return -1;
    80204f6e:	557d                	li	a0,-1
    80204f70:	bff9                	j	80204f4e <sys_dev+0xae>

0000000080204f72 <sys_readdir>:

// To support ls command
uint64
sys_readdir(void)
{
    80204f72:	1101                	addi	sp,sp,-32
    80204f74:	ec06                	sd	ra,24(sp)
    80204f76:	e822                	sd	s0,16(sp)
    80204f78:	1000                	addi	s0,sp,32
  struct file *f;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    80204f7a:	fe840613          	addi	a2,s0,-24
    80204f7e:	4581                	li	a1,0
    80204f80:	4501                	li	a0,0
    80204f82:	00000097          	auipc	ra,0x0
    80204f86:	892080e7          	jalr	-1902(ra) # 80204814 <argfd>
    return -1;
    80204f8a:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    80204f8c:	02054563          	bltz	a0,80204fb6 <sys_readdir+0x44>
    80204f90:	fe040593          	addi	a1,s0,-32
    80204f94:	4505                	li	a0,1
    80204f96:	ffffe097          	auipc	ra,0xffffe
    80204f9a:	12e080e7          	jalr	302(ra) # 802030c4 <argaddr>
    return -1;
    80204f9e:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    80204fa0:	00054b63          	bltz	a0,80204fb6 <sys_readdir+0x44>
  return dirnext(f, p);
    80204fa4:	fe043583          	ld	a1,-32(s0)
    80204fa8:	fe843503          	ld	a0,-24(s0)
    80204fac:	fffff097          	auipc	ra,0xfffff
    80204fb0:	034080e7          	jalr	52(ra) # 80203fe0 <dirnext>
    80204fb4:	87aa                	mv	a5,a0
}
    80204fb6:	853e                	mv	a0,a5
    80204fb8:	60e2                	ld	ra,24(sp)
    80204fba:	6442                	ld	s0,16(sp)
    80204fbc:	6105                	addi	sp,sp,32
    80204fbe:	8082                	ret

0000000080204fc0 <sys_getcwd>:

// get absolute cwd string
uint64
sys_getcwd(void)
{
    80204fc0:	714d                	addi	sp,sp,-336
    80204fc2:	e686                	sd	ra,328(sp)
    80204fc4:	e2a2                	sd	s0,320(sp)
    80204fc6:	fe26                	sd	s1,312(sp)
    80204fc8:	fa4a                	sd	s2,304(sp)
    80204fca:	f64e                	sd	s3,296(sp)
    80204fcc:	f252                	sd	s4,288(sp)
    80204fce:	ee56                	sd	s5,280(sp)
    80204fd0:	0a80                	addi	s0,sp,336
  uint64 addr;
  if (argaddr(0, &addr) < 0)
    80204fd2:	fb840593          	addi	a1,s0,-72
    80204fd6:	4501                	li	a0,0
    80204fd8:	ffffe097          	auipc	ra,0xffffe
    80204fdc:	0ec080e7          	jalr	236(ra) # 802030c4 <argaddr>
    80204fe0:	87aa                	mv	a5,a0
    return -1;
    80204fe2:	557d                	li	a0,-1
  if (argaddr(0, &addr) < 0)
    80204fe4:	0607cc63          	bltz	a5,8020505c <sys_getcwd+0x9c>

  struct dirent *de = myproc()->cwd;
    80204fe8:	ffffd097          	auipc	ra,0xffffd
    80204fec:	a54080e7          	jalr	-1452(ra) # 80201a3c <myproc>
    80204ff0:	15853483          	ld	s1,344(a0)
  char path[FAT32_MAX_PATH];
  char *s;
  int len;

  if (de->parent == NULL) {
    80204ff4:	1204b783          	ld	a5,288(s1)
    80204ff8:	cbbd                	beqz	a5,8020506e <sys_getcwd+0xae>
    s = "/";
  } else {
    s = path + FAT32_MAX_PATH - 1;
    *s = '\0';
    80204ffa:	fa0409a3          	sb	zero,-77(s0)
    s = path + FAT32_MAX_PATH - 1;
    80204ffe:	fb340993          	addi	s3,s0,-77
    while (de->parent) {
      len = strlen(de->filename);
      s -= len;
      if (s <= path)          // can't reach root "/"
    80205002:	eb040a13          	addi	s4,s0,-336
        return -1;
      strncpy(s, de->filename, len);
      *--s = '/';
    80205006:	02f00a93          	li	s5,47
      len = strlen(de->filename);
    8020500a:	8526                	mv	a0,s1
    8020500c:	ffffc097          	auipc	ra,0xffffc
    80205010:	8da080e7          	jalr	-1830(ra) # 802008e6 <strlen>
    80205014:	862a                	mv	a2,a0
      s -= len;
    80205016:	40a98933          	sub	s2,s3,a0
      if (s <= path)          // can't reach root "/"
    8020501a:	052a7f63          	bgeu	s4,s2,80205078 <sys_getcwd+0xb8>
      strncpy(s, de->filename, len);
    8020501e:	85a6                	mv	a1,s1
    80205020:	854a                	mv	a0,s2
    80205022:	ffffc097          	auipc	ra,0xffffc
    80205026:	854080e7          	jalr	-1964(ra) # 80200876 <strncpy>
      *--s = '/';
    8020502a:	fff90993          	addi	s3,s2,-1
    8020502e:	ff590fa3          	sb	s5,-1(s2)
      de = de->parent;
    80205032:	1204b483          	ld	s1,288(s1)
    while (de->parent) {
    80205036:	1204b783          	ld	a5,288(s1)
    8020503a:	fbe1                	bnez	a5,8020500a <sys_getcwd+0x4a>
    }
  }

  // if (copyout(myproc()->pagetable, addr, s, strlen(s) + 1) < 0)
  if (copyout2(addr, s, strlen(s) + 1) < 0)
    8020503c:	fb843483          	ld	s1,-72(s0)
    80205040:	854e                	mv	a0,s3
    80205042:	ffffc097          	auipc	ra,0xffffc
    80205046:	8a4080e7          	jalr	-1884(ra) # 802008e6 <strlen>
    8020504a:	0015061b          	addiw	a2,a0,1
    8020504e:	85ce                	mv	a1,s3
    80205050:	8526                	mv	a0,s1
    80205052:	ffffc097          	auipc	ra,0xffffc
    80205056:	320080e7          	jalr	800(ra) # 80201372 <copyout2>
    8020505a:	957d                	srai	a0,a0,0x3f
    return -1;
  
  return 0;

}
    8020505c:	60b6                	ld	ra,328(sp)
    8020505e:	6416                	ld	s0,320(sp)
    80205060:	74f2                	ld	s1,312(sp)
    80205062:	7952                	ld	s2,304(sp)
    80205064:	79b2                	ld	s3,296(sp)
    80205066:	7a12                	ld	s4,288(sp)
    80205068:	6af2                	ld	s5,280(sp)
    8020506a:	6171                	addi	sp,sp,336
    8020506c:	8082                	ret
    s = "/";
    8020506e:	00004997          	auipc	s3,0x4
    80205072:	5c298993          	addi	s3,s3,1474 # 80209630 <digits+0x2b0>
    80205076:	b7d9                	j	8020503c <sys_getcwd+0x7c>
        return -1;
    80205078:	557d                	li	a0,-1
    8020507a:	b7cd                	j	8020505c <sys_getcwd+0x9c>

000000008020507c <sys_remove>:
  return ret == -1;
}

uint64
sys_remove(void)
{
    8020507c:	d6010113          	addi	sp,sp,-672
    80205080:	28113c23          	sd	ra,664(sp)
    80205084:	28813823          	sd	s0,656(sp)
    80205088:	28913423          	sd	s1,648(sp)
    8020508c:	1500                	addi	s0,sp,672
  char path[FAT32_MAX_PATH];
  struct dirent *ep;
  int len;
  if((len = argstr(0, path, FAT32_MAX_PATH)) <= 0)
    8020508e:	10400613          	li	a2,260
    80205092:	ed840593          	addi	a1,s0,-296
    80205096:	4501                	li	a0,0
    80205098:	ffffe097          	auipc	ra,0xffffe
    8020509c:	04e080e7          	jalr	78(ra) # 802030e6 <argstr>
    802050a0:	0ea05a63          	blez	a0,80205194 <sys_remove+0x118>
    return -1;

  char *s = path + len - 1;
    802050a4:	157d                	addi	a0,a0,-1
    802050a6:	ed840713          	addi	a4,s0,-296
    802050aa:	00a707b3          	add	a5,a4,a0
  while (s >= path && *s == '/') {
    802050ae:	02f00693          	li	a3,47
    802050b2:	863a                	mv	a2,a4
    802050b4:	00e7e963          	bltu	a5,a4,802050c6 <sys_remove+0x4a>
    802050b8:	0007c703          	lbu	a4,0(a5)
    802050bc:	08d71a63          	bne	a4,a3,80205150 <sys_remove+0xd4>
    s--;
    802050c0:	17fd                	addi	a5,a5,-1
  while (s >= path && *s == '/') {
    802050c2:	fec7fbe3          	bgeu	a5,a2,802050b8 <sys_remove+0x3c>
  }
  if (s >= path && *s == '.' && (s == path || *--s == '/')) {
    return -1;
  }
  
  if((ep = ename(path)) == NULL){
    802050c6:	ed840513          	addi	a0,s0,-296
    802050ca:	00002097          	auipc	ra,0x2
    802050ce:	0dc080e7          	jalr	220(ra) # 802071a6 <ename>
    802050d2:	84aa                	mv	s1,a0
    802050d4:	c561                	beqz	a0,8020519c <sys_remove+0x120>
    return -1;
  }
  elock(ep);
    802050d6:	00002097          	auipc	ra,0x2
    802050da:	996080e7          	jalr	-1642(ra) # 80206a6c <elock>
  if((ep->attribute & ATTR_DIRECTORY) && !isdirempty(ep)){
    802050de:	1004c783          	lbu	a5,256(s1)
    802050e2:	8bc1                	andi	a5,a5,16
    802050e4:	c38d                	beqz	a5,80205106 <sys_remove+0x8a>
  ep.valid = 0;
    802050e6:	e8041323          	sh	zero,-378(s0)
  ret = enext(dp, &ep, 2 * 32, &count);   // skip the "." and ".."
    802050ea:	d6c40693          	addi	a3,s0,-660
    802050ee:	04000613          	li	a2,64
    802050f2:	d7040593          	addi	a1,s0,-656
    802050f6:	8526                	mv	a0,s1
    802050f8:	00002097          	auipc	ra,0x2
    802050fc:	b78080e7          	jalr	-1160(ra) # 80206c70 <enext>
  if((ep->attribute & ATTR_DIRECTORY) && !isdirempty(ep)){
    80205100:	57fd                	li	a5,-1
    80205102:	06f51d63          	bne	a0,a5,8020517c <sys_remove+0x100>
      eunlock(ep);
      eput(ep);
      return -1;
  }
  elock(ep->parent);      // Will this lead to deadlock?
    80205106:	1204b503          	ld	a0,288(s1)
    8020510a:	00002097          	auipc	ra,0x2
    8020510e:	962080e7          	jalr	-1694(ra) # 80206a6c <elock>
  eremove(ep);
    80205112:	8526                	mv	a0,s1
    80205114:	00002097          	auipc	ra,0x2
    80205118:	824080e7          	jalr	-2012(ra) # 80206938 <eremove>
  eunlock(ep->parent);
    8020511c:	1204b503          	ld	a0,288(s1)
    80205120:	00002097          	auipc	ra,0x2
    80205124:	982080e7          	jalr	-1662(ra) # 80206aa2 <eunlock>
  eunlock(ep);
    80205128:	8526                	mv	a0,s1
    8020512a:	00002097          	auipc	ra,0x2
    8020512e:	978080e7          	jalr	-1672(ra) # 80206aa2 <eunlock>
  eput(ep);
    80205132:	8526                	mv	a0,s1
    80205134:	00002097          	auipc	ra,0x2
    80205138:	9bc080e7          	jalr	-1604(ra) # 80206af0 <eput>

  return 0;
    8020513c:	4501                	li	a0,0
}
    8020513e:	29813083          	ld	ra,664(sp)
    80205142:	29013403          	ld	s0,656(sp)
    80205146:	28813483          	ld	s1,648(sp)
    8020514a:	2a010113          	addi	sp,sp,672
    8020514e:	8082                	ret
  if (s >= path && *s == '.' && (s == path || *--s == '/')) {
    80205150:	ed840713          	addi	a4,s0,-296
    80205154:	f6e7e9e3          	bltu	a5,a4,802050c6 <sys_remove+0x4a>
    80205158:	0007c683          	lbu	a3,0(a5)
    8020515c:	02e00713          	li	a4,46
    80205160:	f6e693e3          	bne	a3,a4,802050c6 <sys_remove+0x4a>
    80205164:	ed840713          	addi	a4,s0,-296
    80205168:	02e78863          	beq	a5,a4,80205198 <sys_remove+0x11c>
    8020516c:	fff7c703          	lbu	a4,-1(a5)
    80205170:	02f00793          	li	a5,47
    80205174:	f4f719e3          	bne	a4,a5,802050c6 <sys_remove+0x4a>
    return -1;
    80205178:	557d                	li	a0,-1
    8020517a:	b7d1                	j	8020513e <sys_remove+0xc2>
      eunlock(ep);
    8020517c:	8526                	mv	a0,s1
    8020517e:	00002097          	auipc	ra,0x2
    80205182:	924080e7          	jalr	-1756(ra) # 80206aa2 <eunlock>
      eput(ep);
    80205186:	8526                	mv	a0,s1
    80205188:	00002097          	auipc	ra,0x2
    8020518c:	968080e7          	jalr	-1688(ra) # 80206af0 <eput>
      return -1;
    80205190:	557d                	li	a0,-1
    80205192:	b775                	j	8020513e <sys_remove+0xc2>
    return -1;
    80205194:	557d                	li	a0,-1
    80205196:	b765                	j	8020513e <sys_remove+0xc2>
    return -1;
    80205198:	557d                	li	a0,-1
    8020519a:	b755                	j	8020513e <sys_remove+0xc2>
    return -1;
    8020519c:	557d                	li	a0,-1
    8020519e:	b745                	j	8020513e <sys_remove+0xc2>

00000000802051a0 <sys_rename>:

// Must hold too many locks at a time! It's possible to raise a deadlock.
// Because this op takes some steps, we can't promise
uint64
sys_rename(void)
{
    802051a0:	c4010113          	addi	sp,sp,-960
    802051a4:	3a113c23          	sd	ra,952(sp)
    802051a8:	3a813823          	sd	s0,944(sp)
    802051ac:	3a913423          	sd	s1,936(sp)
    802051b0:	3b213023          	sd	s2,928(sp)
    802051b4:	39313c23          	sd	s3,920(sp)
    802051b8:	39413823          	sd	s4,912(sp)
    802051bc:	0780                	addi	s0,sp,960
  char old[FAT32_MAX_PATH], new[FAT32_MAX_PATH];
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    802051be:	10400613          	li	a2,260
    802051c2:	ec840593          	addi	a1,s0,-312
    802051c6:	4501                	li	a0,0
    802051c8:	ffffe097          	auipc	ra,0xffffe
    802051cc:	f1e080e7          	jalr	-226(ra) # 802030e6 <argstr>
      return -1;
    802051d0:	57fd                	li	a5,-1
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    802051d2:	0c054d63          	bltz	a0,802052ac <sys_rename+0x10c>
    802051d6:	10400613          	li	a2,260
    802051da:	dc040593          	addi	a1,s0,-576
    802051de:	4505                	li	a0,1
    802051e0:	ffffe097          	auipc	ra,0xffffe
    802051e4:	f06080e7          	jalr	-250(ra) # 802030e6 <argstr>
      return -1;
    802051e8:	57fd                	li	a5,-1
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    802051ea:	0c054163          	bltz	a0,802052ac <sys_rename+0x10c>
  }

  struct dirent *src = NULL, *dst = NULL, *pdst = NULL;
  int srclock = 0;
  char *name;
  if ((src = ename(old)) == NULL || (pdst = enameparent(new, old)) == NULL
    802051ee:	ec840513          	addi	a0,s0,-312
    802051f2:	00002097          	auipc	ra,0x2
    802051f6:	fb4080e7          	jalr	-76(ra) # 802071a6 <ename>
    802051fa:	84aa                	mv	s1,a0
    802051fc:	1c050963          	beqz	a0,802053ce <sys_rename+0x22e>
    80205200:	ec840593          	addi	a1,s0,-312
    80205204:	dc040513          	addi	a0,s0,-576
    80205208:	00002097          	auipc	ra,0x2
    8020520c:	068080e7          	jalr	104(ra) # 80207270 <enameparent>
    80205210:	892a                	mv	s2,a0
    80205212:	cd35                	beqz	a0,8020528e <sys_rename+0xee>
      || (name = formatname(old)) == NULL) {
    80205214:	ec840513          	addi	a0,s0,-312
    80205218:	00001097          	auipc	ra,0x1
    8020521c:	174080e7          	jalr	372(ra) # 8020638c <formatname>
    80205220:	89aa                	mv	s3,a0
    80205222:	c535                	beqz	a0,8020528e <sys_rename+0xee>
    goto fail;          // src doesn't exist || dst parent doesn't exist || illegal new name
  }
  for (struct dirent *ep = pdst; ep != NULL; ep = ep->parent) {
    if (ep == src) {    // In what universe can we move a directory into its child?
    80205224:	07248563          	beq	s1,s2,8020528e <sys_rename+0xee>
  for (struct dirent *ep = pdst; ep != NULL; ep = ep->parent) {
    80205228:	87ca                	mv	a5,s2
    8020522a:	1207b783          	ld	a5,288(a5)
    8020522e:	c781                	beqz	a5,80205236 <sys_rename+0x96>
    if (ep == src) {    // In what universe can we move a directory into its child?
    80205230:	fef49de3          	bne	s1,a5,8020522a <sys_rename+0x8a>
    80205234:	a8a9                	j	8020528e <sys_rename+0xee>
      goto fail;
    }
  }

  uint off;
  elock(src);     // must hold child's lock before acquiring parent's, because we do so in other similar cases
    80205236:	8526                	mv	a0,s1
    80205238:	00002097          	auipc	ra,0x2
    8020523c:	834080e7          	jalr	-1996(ra) # 80206a6c <elock>
  srclock = 1;
  elock(pdst);
    80205240:	854a                	mv	a0,s2
    80205242:	00002097          	auipc	ra,0x2
    80205246:	82a080e7          	jalr	-2006(ra) # 80206a6c <elock>
  dst = dirlookup(pdst, name, &off);
    8020524a:	dbc40613          	addi	a2,s0,-580
    8020524e:	85ce                	mv	a1,s3
    80205250:	854a                	mv	a0,s2
    80205252:	00002097          	auipc	ra,0x2
    80205256:	ba8080e7          	jalr	-1112(ra) # 80206dfa <dirlookup>
    8020525a:	8a2a                	mv	s4,a0
  if (dst != NULL) {
    8020525c:	cd45                	beqz	a0,80205314 <sys_rename+0x174>
    eunlock(pdst);
    8020525e:	854a                	mv	a0,s2
    80205260:	00002097          	auipc	ra,0x2
    80205264:	842080e7          	jalr	-1982(ra) # 80206aa2 <eunlock>
    if (src == dst) {
    80205268:	01448963          	beq	s1,s4,8020527a <sys_rename+0xda>
      goto fail;
    } else if (src->attribute & dst->attribute & ATTR_DIRECTORY) {
    8020526c:	1004c783          	lbu	a5,256(s1)
    80205270:	100a4703          	lbu	a4,256(s4)
    80205274:	8ff9                	and	a5,a5,a4
    80205276:	8bc1                	andi	a5,a5,16
    80205278:	ebb1                	bnez	a5,802052cc <sys_rename+0x12c>

  return 0;

fail:
  if (srclock)
    eunlock(src);
    8020527a:	8526                	mv	a0,s1
    8020527c:	00002097          	auipc	ra,0x2
    80205280:	826080e7          	jalr	-2010(ra) # 80206aa2 <eunlock>
  if (dst)
    eput(dst);
    80205284:	8552                	mv	a0,s4
    80205286:	00002097          	auipc	ra,0x2
    8020528a:	86a080e7          	jalr	-1942(ra) # 80206af0 <eput>
  if (pdst)
    8020528e:	00090763          	beqz	s2,8020529c <sys_rename+0xfc>
    eput(pdst);
    80205292:	854a                	mv	a0,s2
    80205294:	00002097          	auipc	ra,0x2
    80205298:	85c080e7          	jalr	-1956(ra) # 80206af0 <eput>
  if (src)
    eput(src);
  return -1;
    8020529c:	57fd                	li	a5,-1
  if (src)
    8020529e:	c499                	beqz	s1,802052ac <sys_rename+0x10c>
    eput(src);
    802052a0:	8526                	mv	a0,s1
    802052a2:	00002097          	auipc	ra,0x2
    802052a6:	84e080e7          	jalr	-1970(ra) # 80206af0 <eput>
  return -1;
    802052aa:	57fd                	li	a5,-1
}
    802052ac:	853e                	mv	a0,a5
    802052ae:	3b813083          	ld	ra,952(sp)
    802052b2:	3b013403          	ld	s0,944(sp)
    802052b6:	3a813483          	ld	s1,936(sp)
    802052ba:	3a013903          	ld	s2,928(sp)
    802052be:	39813983          	ld	s3,920(sp)
    802052c2:	39013a03          	ld	s4,912(sp)
    802052c6:	3c010113          	addi	sp,sp,960
    802052ca:	8082                	ret
      elock(dst);
    802052cc:	8552                	mv	a0,s4
    802052ce:	00001097          	auipc	ra,0x1
    802052d2:	79e080e7          	jalr	1950(ra) # 80206a6c <elock>
  ep.valid = 0;
    802052d6:	d6041323          	sh	zero,-666(s0)
  ret = enext(dp, &ep, 2 * 32, &count);   // skip the "." and ".."
    802052da:	c4c40693          	addi	a3,s0,-948
    802052de:	04000613          	li	a2,64
    802052e2:	c5040593          	addi	a1,s0,-944
    802052e6:	8552                	mv	a0,s4
    802052e8:	00002097          	auipc	ra,0x2
    802052ec:	988080e7          	jalr	-1656(ra) # 80206c70 <enext>
      if (!isdirempty(dst)) {    // it's ok to overwrite an empty dir
    802052f0:	57fd                	li	a5,-1
    802052f2:	0cf51863          	bne	a0,a5,802053c2 <sys_rename+0x222>
      elock(pdst);
    802052f6:	854a                	mv	a0,s2
    802052f8:	00001097          	auipc	ra,0x1
    802052fc:	774080e7          	jalr	1908(ra) # 80206a6c <elock>
    eremove(dst);
    80205300:	8552                	mv	a0,s4
    80205302:	00001097          	auipc	ra,0x1
    80205306:	636080e7          	jalr	1590(ra) # 80206938 <eremove>
    eunlock(dst);
    8020530a:	8552                	mv	a0,s4
    8020530c:	00001097          	auipc	ra,0x1
    80205310:	796080e7          	jalr	1942(ra) # 80206aa2 <eunlock>
  memmove(src->filename, name, FAT32_MAX_FILENAME);
    80205314:	0ff00613          	li	a2,255
    80205318:	85ce                	mv	a1,s3
    8020531a:	8526                	mv	a0,s1
    8020531c:	ffffb097          	auipc	ra,0xffffb
    80205320:	4a2080e7          	jalr	1186(ra) # 802007be <memmove>
  emake(pdst, src, off);
    80205324:	dbc42603          	lw	a2,-580(s0)
    80205328:	85a6                	mv	a1,s1
    8020532a:	854a                	mv	a0,s2
    8020532c:	00001097          	auipc	ra,0x1
    80205330:	118080e7          	jalr	280(ra) # 80206444 <emake>
  if (src->parent != pdst) {
    80205334:	1204b783          	ld	a5,288(s1)
    80205338:	01278d63          	beq	a5,s2,80205352 <sys_rename+0x1b2>
    eunlock(pdst);
    8020533c:	854a                	mv	a0,s2
    8020533e:	00001097          	auipc	ra,0x1
    80205342:	764080e7          	jalr	1892(ra) # 80206aa2 <eunlock>
    elock(src->parent);
    80205346:	1204b503          	ld	a0,288(s1)
    8020534a:	00001097          	auipc	ra,0x1
    8020534e:	722080e7          	jalr	1826(ra) # 80206a6c <elock>
  eremove(src);
    80205352:	8526                	mv	a0,s1
    80205354:	00001097          	auipc	ra,0x1
    80205358:	5e4080e7          	jalr	1508(ra) # 80206938 <eremove>
  eunlock(src->parent);
    8020535c:	1204b503          	ld	a0,288(s1)
    80205360:	00001097          	auipc	ra,0x1
    80205364:	742080e7          	jalr	1858(ra) # 80206aa2 <eunlock>
  struct dirent *psrc = src->parent;  // src must not be root, or it won't pass the for-loop test
    80205368:	1204b983          	ld	s3,288(s1)
  src->parent = edup(pdst);
    8020536c:	854a                	mv	a0,s2
    8020536e:	00001097          	auipc	ra,0x1
    80205372:	4a0080e7          	jalr	1184(ra) # 8020680e <edup>
    80205376:	12a4b023          	sd	a0,288(s1)
  src->off = off;
    8020537a:	dbc42783          	lw	a5,-580(s0)
    8020537e:	10f4ae23          	sw	a5,284(s1)
  src->valid = 1;
    80205382:	4785                	li	a5,1
    80205384:	10f49b23          	sh	a5,278(s1)
  eunlock(src);
    80205388:	8526                	mv	a0,s1
    8020538a:	00001097          	auipc	ra,0x1
    8020538e:	718080e7          	jalr	1816(ra) # 80206aa2 <eunlock>
  eput(psrc);
    80205392:	854e                	mv	a0,s3
    80205394:	00001097          	auipc	ra,0x1
    80205398:	75c080e7          	jalr	1884(ra) # 80206af0 <eput>
  if (dst) {
    8020539c:	000a0763          	beqz	s4,802053aa <sys_rename+0x20a>
    eput(dst);
    802053a0:	8552                	mv	a0,s4
    802053a2:	00001097          	auipc	ra,0x1
    802053a6:	74e080e7          	jalr	1870(ra) # 80206af0 <eput>
  eput(pdst);
    802053aa:	854a                	mv	a0,s2
    802053ac:	00001097          	auipc	ra,0x1
    802053b0:	744080e7          	jalr	1860(ra) # 80206af0 <eput>
  eput(src);
    802053b4:	8526                	mv	a0,s1
    802053b6:	00001097          	auipc	ra,0x1
    802053ba:	73a080e7          	jalr	1850(ra) # 80206af0 <eput>
  return 0;
    802053be:	4781                	li	a5,0
    802053c0:	b5f5                	j	802052ac <sys_rename+0x10c>
        eunlock(dst);
    802053c2:	8552                	mv	a0,s4
    802053c4:	00001097          	auipc	ra,0x1
    802053c8:	6de080e7          	jalr	1758(ra) # 80206aa2 <eunlock>
        goto fail;
    802053cc:	b57d                	j	8020527a <sys_rename+0xda>
  struct dirent *src = NULL, *dst = NULL, *pdst = NULL;
    802053ce:	892a                	mv	s2,a0
  if (dst)
    802053d0:	bd7d                	j	8020528e <sys_rename+0xee>

00000000802053d2 <sys_mkdirat>:
////////////////////////////////////////////////////////////////////////////


uint64
sys_mkdirat(void)
{
    802053d2:	7169                	addi	sp,sp,-304
    802053d4:	f606                	sd	ra,296(sp)
    802053d6:	f222                	sd	s0,288(sp)
    802053d8:	ee26                	sd	s1,280(sp)
    802053da:	1a00                	addi	s0,sp,304
  char path[FAT32_MAX_PATH];
  int dirfd, mode;
  struct dirent *ep;
  if (argint(0, &dirfd) < 0 || argstr(1, path, FAT32_MAX_PATH) < 0 || argint(2, &mode) < 0) {
    802053dc:	ed440593          	addi	a1,s0,-300
    802053e0:	4501                	li	a0,0
    802053e2:	ffffe097          	auipc	ra,0xffffe
    802053e6:	c80080e7          	jalr	-896(ra) # 80203062 <argint>
    return -1;
    802053ea:	57fd                	li	a5,-1
  if (argint(0, &dirfd) < 0 || argstr(1, path, FAT32_MAX_PATH) < 0 || argint(2, &mode) < 0) {
    802053ec:	06054a63          	bltz	a0,80205460 <sys_mkdirat+0x8e>
    802053f0:	10400613          	li	a2,260
    802053f4:	ed840593          	addi	a1,s0,-296
    802053f8:	4505                	li	a0,1
    802053fa:	ffffe097          	auipc	ra,0xffffe
    802053fe:	cec080e7          	jalr	-788(ra) # 802030e6 <argstr>
    return -1;
    80205402:	57fd                	li	a5,-1
  if (argint(0, &dirfd) < 0 || argstr(1, path, FAT32_MAX_PATH) < 0 || argint(2, &mode) < 0) {
    80205404:	04054e63          	bltz	a0,80205460 <sys_mkdirat+0x8e>
    80205408:	ed040593          	addi	a1,s0,-304
    8020540c:	4509                	li	a0,2
    8020540e:	ffffe097          	auipc	ra,0xffffe
    80205412:	c54080e7          	jalr	-940(ra) # 80203062 <argint>
    return -1;
    80205416:	57fd                	li	a5,-1
  if (argint(0, &dirfd) < 0 || argstr(1, path, FAT32_MAX_PATH) < 0 || argint(2, &mode) < 0) {
    80205418:	04054463          	bltz	a0,80205460 <sys_mkdirat+0x8e>
  }
  printf("Running: MKDIR ... dirfd: %d ... mode: 0x%x... path: %s\n", dirfd, mode, path);
    8020541c:	ed840493          	addi	s1,s0,-296
    80205420:	86a6                	mv	a3,s1
    80205422:	ed042603          	lw	a2,-304(s0)
    80205426:	ed442583          	lw	a1,-300(s0)
    8020542a:	00005517          	auipc	a0,0x5
    8020542e:	85e50513          	addi	a0,a0,-1954 # 80209c88 <digits+0x908>
    80205432:	ffffb097          	auipc	ra,0xffffb
    80205436:	d5c080e7          	jalr	-676(ra) # 8020018e <printf>
  ep = create(path, T_DIR, mode);
    8020543a:	ed042603          	lw	a2,-304(s0)
    8020543e:	4585                	li	a1,1
    80205440:	8526                	mv	a0,s1
    80205442:	fffff097          	auipc	ra,0xfffff
    80205446:	47c080e7          	jalr	1148(ra) # 802048be <create>
    8020544a:	84aa                	mv	s1,a0
  eunlock(ep);
    8020544c:	00001097          	auipc	ra,0x1
    80205450:	656080e7          	jalr	1622(ra) # 80206aa2 <eunlock>
  eput(ep);
    80205454:	8526                	mv	a0,s1
    80205456:	00001097          	auipc	ra,0x1
    8020545a:	69a080e7          	jalr	1690(ra) # 80206af0 <eput>
  return 0;
    8020545e:	4781                	li	a5,0
}
    80205460:	853e                	mv	a0,a5
    80205462:	70b2                	ld	ra,296(sp)
    80205464:	7412                	ld	s0,288(sp)
    80205466:	64f2                	ld	s1,280(sp)
    80205468:	6155                	addi	sp,sp,304
    8020546a:	8082                	ret

000000008020546c <sys_openat>:


uint64
sys_openat(void)
{
    8020546c:	714d                	addi	sp,sp,-336
    8020546e:	e686                	sd	ra,328(sp)
    80205470:	e2a2                	sd	s0,320(sp)
    80205472:	fe26                	sd	s1,312(sp)
    80205474:	fa4a                	sd	s2,304(sp)
    80205476:	f64e                	sd	s3,296(sp)
    80205478:	0a80                	addi	s0,sp,336
  struct file *f;
  struct file *curr_f;
  struct dirent *ep;
  struct dirent *dest_ep;

  if(argint(0, &curr_fd) < 0 || argstr(1, path, FAT32_MAX_PATH) < 0 || argint(2, &omode) < 0 ||argint(3, &mode)<0)
    8020547a:	ec440593          	addi	a1,s0,-316
    8020547e:	4501                	li	a0,0
    80205480:	ffffe097          	auipc	ra,0xffffe
    80205484:	be2080e7          	jalr	-1054(ra) # 80203062 <argint>
    return -1;
    80205488:	54fd                	li	s1,-1
  if(argint(0, &curr_fd) < 0 || argstr(1, path, FAT32_MAX_PATH) < 0 || argint(2, &omode) < 0 ||argint(3, &mode)<0)
    8020548a:	0e054f63          	bltz	a0,80205588 <sys_openat+0x11c>
    8020548e:	10400613          	li	a2,260
    80205492:	ec840593          	addi	a1,s0,-312
    80205496:	4505                	li	a0,1
    80205498:	ffffe097          	auipc	ra,0xffffe
    8020549c:	c4e080e7          	jalr	-946(ra) # 802030e6 <argstr>
    802054a0:	0e054463          	bltz	a0,80205588 <sys_openat+0x11c>
    802054a4:	ec040593          	addi	a1,s0,-320
    802054a8:	4509                	li	a0,2
    802054aa:	ffffe097          	auipc	ra,0xffffe
    802054ae:	bb8080e7          	jalr	-1096(ra) # 80203062 <argint>
    802054b2:	0c054b63          	bltz	a0,80205588 <sys_openat+0x11c>
    802054b6:	ebc40593          	addi	a1,s0,-324
    802054ba:	450d                	li	a0,3
    802054bc:	ffffe097          	auipc	ra,0xffffe
    802054c0:	ba6080e7          	jalr	-1114(ra) # 80203062 <argint>
    802054c4:	0c054263          	bltz	a0,80205588 <sys_openat+0x11c>
  printf("Running: OPENAT ... filefd: %d ... mode: 0x%x ... omode: 0x%x... path: %s\n", curr_fd, mode, omode, path);
    802054c8:	ec840713          	addi	a4,s0,-312
    802054cc:	ec042683          	lw	a3,-320(s0)
    802054d0:	ebc42603          	lw	a2,-324(s0)
    802054d4:	ec442583          	lw	a1,-316(s0)
    802054d8:	00004517          	auipc	a0,0x4
    802054dc:	7f050513          	addi	a0,a0,2032 # 80209cc8 <digits+0x948>
    802054e0:	ffffb097          	auipc	ra,0xffffb
    802054e4:	cae080e7          	jalr	-850(ra) # 8020018e <printf>
  relative = 1;
  if(path[0] != '/' && curr_fd != AT_FDCWD){/*绝对路径，忽略fd*/
    802054e8:	ec844703          	lbu	a4,-312(s0)
    802054ec:	02f00793          	li	a5,47
    802054f0:	00f70863          	beq	a4,a5,80205500 <sys_openat+0x94>
    802054f4:	ec442703          	lw	a4,-316(s0)
    802054f8:	f9c00793          	li	a5,-100
    802054fc:	08f71e63          	bne	a4,a5,80205598 <sys_openat+0x12c>
  else{
    relative = 1;
    dest_ep = 0;
  }
  /*open*/
  if(omode & O_CREATE){
    80205500:	ec042603          	lw	a2,-320(s0)
    80205504:	04067793          	andi	a5,a2,64
    80205508:	cbed                	beqz	a5,802055fa <sys_openat+0x18e>
    ep = create(path, T_FILE, omode);
    8020550a:	4589                	li	a1,2
    8020550c:	ec840513          	addi	a0,s0,-312
    80205510:	fffff097          	auipc	ra,0xfffff
    80205514:	3ae080e7          	jalr	942(ra) # 802048be <create>
    80205518:	892a                	mv	s2,a0
    if(ep == NULL){
    8020551a:	10050263          	beqz	a0,8020561e <sys_openat+0x1b2>
      eput(ep);
      return -1;
    }
  }

  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    8020551e:	ffffe097          	auipc	ra,0xffffe
    80205522:	75a080e7          	jalr	1882(ra) # 80203c78 <filealloc>
    80205526:	89aa                	mv	s3,a0
    80205528:	10050463          	beqz	a0,80205630 <sys_openat+0x1c4>
    8020552c:	fffff097          	auipc	ra,0xfffff
    80205530:	350080e7          	jalr	848(ra) # 8020487c <fdalloc>
    80205534:	84aa                	mv	s1,a0
    80205536:	0e054863          	bltz	a0,80205626 <sys_openat+0x1ba>
    eunlock(ep);
    eput(ep);
    return -1;
  }

  if(!(ep->attribute & ATTR_DIRECTORY) && (omode & O_TRUNC)){
    8020553a:	10094783          	lbu	a5,256(s2)
    8020553e:	8bc1                	andi	a5,a5,16
    80205540:	e791                	bnez	a5,8020554c <sys_openat+0xe0>
    80205542:	ec042783          	lw	a5,-320(s0)
    80205546:	4007f793          	andi	a5,a5,1024
    8020554a:	e3f1                	bnez	a5,8020560e <sys_openat+0x1a2>
    etrunc(ep);
  }

  f->type = FD_ENTRY;
    8020554c:	4789                	li	a5,2
    8020554e:	00f9a023          	sw	a5,0(s3)
  f->off = (omode & O_APPEND) ? ep->file_size : 0;
    80205552:	ec042783          	lw	a5,-320(s0)
    80205556:	0047f693          	andi	a3,a5,4
    8020555a:	4701                	li	a4,0
    8020555c:	c299                	beqz	a3,80205562 <sys_openat+0xf6>
    8020555e:	10892703          	lw	a4,264(s2)
    80205562:	02e9a023          	sw	a4,32(s3)
  f->ep = ep;
    80205566:	0129bc23          	sd	s2,24(s3)
  f->readable = !(omode & O_WRONLY);
    8020556a:	0017c713          	xori	a4,a5,1
    8020556e:	8b05                	andi	a4,a4,1
    80205570:	00e98423          	sb	a4,8(s3)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80205574:	8b8d                	andi	a5,a5,3
    80205576:	00f037b3          	snez	a5,a5
    8020557a:	00f984a3          	sb	a5,9(s3)

  eunlock(ep);
    8020557e:	854a                	mv	a0,s2
    80205580:	00001097          	auipc	ra,0x1
    80205584:	522080e7          	jalr	1314(ra) # 80206aa2 <eunlock>

  return fd;
}
    80205588:	8526                	mv	a0,s1
    8020558a:	60b6                	ld	ra,328(sp)
    8020558c:	6416                	ld	s0,320(sp)
    8020558e:	74f2                	ld	s1,312(sp)
    80205590:	7952                	ld	s2,304(sp)
    80205592:	79b2                	ld	s3,296(sp)
    80205594:	6171                	addi	sp,sp,336
    80205596:	8082                	ret
    curr_f = myproc()->ofile[curr_fd];
    80205598:	ffffc097          	auipc	ra,0xffffc
    8020559c:	4a4080e7          	jalr	1188(ra) # 80201a3c <myproc>
    802055a0:	ec442783          	lw	a5,-316(s0)
    802055a4:	07e9                	addi	a5,a5,26
    802055a6:	078e                	slli	a5,a5,0x3
    802055a8:	953e                	add	a0,a0,a5
    802055aa:	651c                	ld	a5,8(a0)
    if(curr_f == 0) return -1;
    802055ac:	c7bd                	beqz	a5,8020561a <sys_openat+0x1ae>
    dest_ep = curr_f->ep;
    802055ae:	6f88                	ld	a0,24(a5)
  if(omode & O_CREATE){
    802055b0:	ec042603          	lw	a2,-320(s0)
    802055b4:	04067793          	andi	a5,a2,64
    802055b8:	fba9                	bnez	a5,8020550a <sys_openat+0x9e>
      if((ep = ename_env(dest_ep, path))== NULL){
    802055ba:	ec840593          	addi	a1,s0,-312
    802055be:	00002097          	auipc	ra,0x2
    802055c2:	c06080e7          	jalr	-1018(ra) # 802071c4 <ename_env>
    802055c6:	892a                	mv	s2,a0
    802055c8:	cd29                	beqz	a0,80205622 <sys_openat+0x1b6>
    elock(ep);
    802055ca:	854a                	mv	a0,s2
    802055cc:	00001097          	auipc	ra,0x1
    802055d0:	4a0080e7          	jalr	1184(ra) # 80206a6c <elock>
    if((ep->attribute & ATTR_DIRECTORY) && omode != O_RDONLY){
    802055d4:	10094783          	lbu	a5,256(s2)
    802055d8:	8bc1                	andi	a5,a5,16
    802055da:	d3b1                	beqz	a5,8020551e <sys_openat+0xb2>
    802055dc:	ec042783          	lw	a5,-320(s0)
    802055e0:	df9d                	beqz	a5,8020551e <sys_openat+0xb2>
      eunlock(ep);
    802055e2:	854a                	mv	a0,s2
    802055e4:	00001097          	auipc	ra,0x1
    802055e8:	4be080e7          	jalr	1214(ra) # 80206aa2 <eunlock>
      eput(ep);
    802055ec:	854a                	mv	a0,s2
    802055ee:	00001097          	auipc	ra,0x1
    802055f2:	502080e7          	jalr	1282(ra) # 80206af0 <eput>
      return -1;
    802055f6:	54fd                	li	s1,-1
    802055f8:	bf41                	j	80205588 <sys_openat+0x11c>
      if((ep = ename(path)) == NULL){
    802055fa:	ec840513          	addi	a0,s0,-312
    802055fe:	00002097          	auipc	ra,0x2
    80205602:	ba8080e7          	jalr	-1112(ra) # 802071a6 <ename>
    80205606:	892a                	mv	s2,a0
    80205608:	f169                	bnez	a0,802055ca <sys_openat+0x15e>
        return -1;
    8020560a:	54fd                	li	s1,-1
    8020560c:	bfb5                	j	80205588 <sys_openat+0x11c>
    etrunc(ep);
    8020560e:	854a                	mv	a0,s2
    80205610:	00001097          	auipc	ra,0x1
    80205614:	3f2080e7          	jalr	1010(ra) # 80206a02 <etrunc>
    80205618:	bf15                	j	8020554c <sys_openat+0xe0>
    if(curr_f == 0) return -1;
    8020561a:	54fd                	li	s1,-1
    8020561c:	b7b5                	j	80205588 <sys_openat+0x11c>
      return -1;
    8020561e:	54fd                	li	s1,-1
    80205620:	b7a5                	j	80205588 <sys_openat+0x11c>
        return -1;
    80205622:	54fd                	li	s1,-1
    80205624:	b795                	j	80205588 <sys_openat+0x11c>
      fileclose(f);
    80205626:	854e                	mv	a0,s3
    80205628:	ffffe097          	auipc	ra,0xffffe
    8020562c:	70c080e7          	jalr	1804(ra) # 80203d34 <fileclose>
    eunlock(ep);
    80205630:	854a                	mv	a0,s2
    80205632:	00001097          	auipc	ra,0x1
    80205636:	470080e7          	jalr	1136(ra) # 80206aa2 <eunlock>
    eput(ep);
    8020563a:	854a                	mv	a0,s2
    8020563c:	00001097          	auipc	ra,0x1
    80205640:	4b4080e7          	jalr	1204(ra) # 80206af0 <eput>
    return -1;
    80205644:	54fd                	li	s1,-1
    80205646:	b789                	j	80205588 <sys_openat+0x11c>

0000000080205648 <sys_dup3>:


uint64
sys_dup3(void)
{
    80205648:	7179                	addi	sp,sp,-48
    8020564a:	f406                	sd	ra,40(sp)
    8020564c:	f022                	sd	s0,32(sp)
    8020564e:	ec26                	sd	s1,24(sp)
    80205650:	1800                	addi	s0,sp,48
  struct file *f;
  int newfd;
  if(argfd(0, 0, &f) < 0) 
    80205652:	fd840613          	addi	a2,s0,-40
    80205656:	4581                	li	a1,0
    80205658:	4501                	li	a0,0
    8020565a:	fffff097          	auipc	ra,0xfffff
    8020565e:	1ba080e7          	jalr	442(ra) # 80204814 <argfd>
    return -1;
    80205662:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0) 
    80205664:	06054663          	bltz	a0,802056d0 <sys_dup3+0x88>
  if(argint(1, &newfd) < 0 || newfd < 0){
    80205668:	fd440593          	addi	a1,s0,-44
    8020566c:	4505                	li	a0,1
    8020566e:	ffffe097          	auipc	ra,0xffffe
    80205672:	9f4080e7          	jalr	-1548(ra) # 80203062 <argint>
    80205676:	06054363          	bltz	a0,802056dc <sys_dup3+0x94>
    8020567a:	fd442583          	lw	a1,-44(s0)
    8020567e:	0405cf63          	bltz	a1,802056dc <sys_dup3+0x94>
    printf("EXIT!: DUP3 ... newfd: %d \n", newfd);
    return -1;}
  printf("Running: DUP3 ... newfd: %d \n", newfd);
    80205682:	00004517          	auipc	a0,0x4
    80205686:	6b650513          	addi	a0,a0,1718 # 80209d38 <digits+0x9b8>
    8020568a:	ffffb097          	auipc	ra,0xffffb
    8020568e:	b04080e7          	jalr	-1276(ra) # 8020018e <printf>
  if(myproc()->ofile[newfd] != f) 
    80205692:	ffffc097          	auipc	ra,0xffffc
    80205696:	3aa080e7          	jalr	938(ra) # 80201a3c <myproc>
    8020569a:	fd843483          	ld	s1,-40(s0)
    8020569e:	fd442783          	lw	a5,-44(s0)
    802056a2:	07e9                	addi	a5,a5,26
    802056a4:	078e                	slli	a5,a5,0x3
    802056a6:	953e                	add	a0,a0,a5
    802056a8:	651c                	ld	a5,8(a0)
    802056aa:	02978163          	beq	a5,s1,802056cc <sys_dup3+0x84>
  {
    myproc()->ofile[newfd] = f;
    802056ae:	ffffc097          	auipc	ra,0xffffc
    802056b2:	38e080e7          	jalr	910(ra) # 80201a3c <myproc>
    802056b6:	fd442783          	lw	a5,-44(s0)
    802056ba:	07e9                	addi	a5,a5,26
    802056bc:	078e                	slli	a5,a5,0x3
    802056be:	953e                	add	a0,a0,a5
    802056c0:	e504                	sd	s1,8(a0)
    filedup(f);
    802056c2:	8526                	mv	a0,s1
    802056c4:	ffffe097          	auipc	ra,0xffffe
    802056c8:	61e080e7          	jalr	1566(ra) # 80203ce2 <filedup>
  }
  return newfd;
    802056cc:	fd442783          	lw	a5,-44(s0)
}
    802056d0:	853e                	mv	a0,a5
    802056d2:	70a2                	ld	ra,40(sp)
    802056d4:	7402                	ld	s0,32(sp)
    802056d6:	64e2                	ld	s1,24(sp)
    802056d8:	6145                	addi	sp,sp,48
    802056da:	8082                	ret
    printf("EXIT!: DUP3 ... newfd: %d \n", newfd);
    802056dc:	fd442583          	lw	a1,-44(s0)
    802056e0:	00004517          	auipc	a0,0x4
    802056e4:	63850513          	addi	a0,a0,1592 # 80209d18 <digits+0x998>
    802056e8:	ffffb097          	auipc	ra,0xffffb
    802056ec:	aa6080e7          	jalr	-1370(ra) # 8020018e <printf>
    return -1;}
    802056f0:	57fd                	li	a5,-1
    802056f2:	bff9                	j	802056d0 <sys_dup3+0x88>
	...

0000000080205700 <kernelvec>:
    80205700:	7111                	addi	sp,sp,-256
    80205702:	e006                	sd	ra,0(sp)
    80205704:	e40a                	sd	sp,8(sp)
    80205706:	e80e                	sd	gp,16(sp)
    80205708:	ec12                	sd	tp,24(sp)
    8020570a:	f016                	sd	t0,32(sp)
    8020570c:	f41a                	sd	t1,40(sp)
    8020570e:	f81e                	sd	t2,48(sp)
    80205710:	fc22                	sd	s0,56(sp)
    80205712:	e0a6                	sd	s1,64(sp)
    80205714:	e4aa                	sd	a0,72(sp)
    80205716:	e8ae                	sd	a1,80(sp)
    80205718:	ecb2                	sd	a2,88(sp)
    8020571a:	f0b6                	sd	a3,96(sp)
    8020571c:	f4ba                	sd	a4,104(sp)
    8020571e:	f8be                	sd	a5,112(sp)
    80205720:	fcc2                	sd	a6,120(sp)
    80205722:	e146                	sd	a7,128(sp)
    80205724:	e54a                	sd	s2,136(sp)
    80205726:	e94e                	sd	s3,144(sp)
    80205728:	ed52                	sd	s4,152(sp)
    8020572a:	f156                	sd	s5,160(sp)
    8020572c:	f55a                	sd	s6,168(sp)
    8020572e:	f95e                	sd	s7,176(sp)
    80205730:	fd62                	sd	s8,184(sp)
    80205732:	e1e6                	sd	s9,192(sp)
    80205734:	e5ea                	sd	s10,200(sp)
    80205736:	e9ee                	sd	s11,208(sp)
    80205738:	edf2                	sd	t3,216(sp)
    8020573a:	f1f6                	sd	t4,224(sp)
    8020573c:	f5fa                	sd	t5,232(sp)
    8020573e:	f9fe                	sd	t6,240(sp)
    80205740:	ca4fd0ef          	jal	ra,80202be4 <kerneltrap>
    80205744:	6082                	ld	ra,0(sp)
    80205746:	6122                	ld	sp,8(sp)
    80205748:	61c2                	ld	gp,16(sp)
    8020574a:	7282                	ld	t0,32(sp)
    8020574c:	7322                	ld	t1,40(sp)
    8020574e:	73c2                	ld	t2,48(sp)
    80205750:	7462                	ld	s0,56(sp)
    80205752:	6486                	ld	s1,64(sp)
    80205754:	6526                	ld	a0,72(sp)
    80205756:	65c6                	ld	a1,80(sp)
    80205758:	6666                	ld	a2,88(sp)
    8020575a:	7686                	ld	a3,96(sp)
    8020575c:	7726                	ld	a4,104(sp)
    8020575e:	77c6                	ld	a5,112(sp)
    80205760:	7866                	ld	a6,120(sp)
    80205762:	688a                	ld	a7,128(sp)
    80205764:	692a                	ld	s2,136(sp)
    80205766:	69ca                	ld	s3,144(sp)
    80205768:	6a6a                	ld	s4,152(sp)
    8020576a:	7a8a                	ld	s5,160(sp)
    8020576c:	7b2a                	ld	s6,168(sp)
    8020576e:	7bca                	ld	s7,176(sp)
    80205770:	7c6a                	ld	s8,184(sp)
    80205772:	6c8e                	ld	s9,192(sp)
    80205774:	6d2e                	ld	s10,200(sp)
    80205776:	6dce                	ld	s11,208(sp)
    80205778:	6e6e                	ld	t3,216(sp)
    8020577a:	7e8e                	ld	t4,224(sp)
    8020577c:	7f2e                	ld	t5,232(sp)
    8020577e:	7fce                	ld	t6,240(sp)
    80205780:	6111                	addi	sp,sp,256
    80205782:	10200073          	sret
	...

000000008020578e <timerinit>:
#include "include/proc.h"

struct spinlock tickslock;
uint ticks;

void timerinit() {
    8020578e:	1141                	addi	sp,sp,-16
    80205790:	e406                	sd	ra,8(sp)
    80205792:	e022                	sd	s0,0(sp)
    80205794:	0800                	addi	s0,sp,16
    initlock(&tickslock, "time");
    80205796:	00004597          	auipc	a1,0x4
    8020579a:	5c258593          	addi	a1,a1,1474 # 80209d58 <digits+0x9d8>
    8020579e:	00019517          	auipc	a0,0x19
    802057a2:	c6a50513          	addi	a0,a0,-918 # 8021e408 <tickslock>
    802057a6:	ffffb097          	auipc	ra,0xffffb
    802057aa:	edc080e7          	jalr	-292(ra) # 80200682 <initlock>
    #ifdef DEBUG
    printf("timerinit\n");
    #endif
}
    802057ae:	60a2                	ld	ra,8(sp)
    802057b0:	6402                	ld	s0,0(sp)
    802057b2:	0141                	addi	sp,sp,16
    802057b4:	8082                	ret

00000000802057b6 <set_next_timeout>:

void
set_next_timeout() {
    802057b6:	1141                	addi	sp,sp,-16
    802057b8:	e422                	sd	s0,8(sp)
    802057ba:	0800                	addi	s0,sp,16
  asm volatile("rdtime %0" : "=r" (x) );
    802057bc:	c0102573          	rdtime	a0
    // if comment the `printf` line below
    // the timer will not work.

    // this bug seems to disappear automatically
    // printf("");
    sbi_set_timer(r_time() + INTERVAL);
    802057c0:	001dc7b7          	lui	a5,0x1dc
    802057c4:	13078793          	addi	a5,a5,304 # 1dc130 <_entry-0x80023ed0>
    802057c8:	953e                	add	a0,a0,a5
	SBI_CALL_1(SBI_SET_TIMER, stime_value);
    802057ca:	4581                	li	a1,0
    802057cc:	4601                	li	a2,0
    802057ce:	4681                	li	a3,0
    802057d0:	4881                	li	a7,0
    802057d2:	00000073          	ecall
}
    802057d6:	6422                	ld	s0,8(sp)
    802057d8:	0141                	addi	sp,sp,16
    802057da:	8082                	ret

00000000802057dc <timer_tick>:

void timer_tick() {
    802057dc:	1101                	addi	sp,sp,-32
    802057de:	ec06                	sd	ra,24(sp)
    802057e0:	e822                	sd	s0,16(sp)
    802057e2:	e426                	sd	s1,8(sp)
    802057e4:	1000                	addi	s0,sp,32
    acquire(&tickslock);
    802057e6:	00019497          	auipc	s1,0x19
    802057ea:	c2248493          	addi	s1,s1,-990 # 8021e408 <tickslock>
    802057ee:	8526                	mv	a0,s1
    802057f0:	ffffb097          	auipc	ra,0xffffb
    802057f4:	ed6080e7          	jalr	-298(ra) # 802006c6 <acquire>
    ticks++;
    802057f8:	4c9c                	lw	a5,24(s1)
    802057fa:	2785                	addiw	a5,a5,1
    802057fc:	cc9c                	sw	a5,24(s1)
    wakeup(&ticks);
    802057fe:	00019517          	auipc	a0,0x19
    80205802:	c2250513          	addi	a0,a0,-990 # 8021e420 <ticks>
    80205806:	ffffd097          	auipc	ra,0xffffd
    8020580a:	c56080e7          	jalr	-938(ra) # 8020245c <wakeup>
    release(&tickslock);
    8020580e:	8526                	mv	a0,s1
    80205810:	ffffb097          	auipc	ra,0xffffb
    80205814:	f0a080e7          	jalr	-246(ra) # 8020071a <release>
    set_next_timeout();
    80205818:	00000097          	auipc	ra,0x0
    8020581c:	f9e080e7          	jalr	-98(ra) # 802057b6 <set_next_timeout>
}
    80205820:	60e2                	ld	ra,24(sp)
    80205822:	6442                	ld	s0,16(sp)
    80205824:	64a2                	ld	s1,8(sp)
    80205826:	6105                	addi	sp,sp,32
    80205828:	8082                	ret

000000008020582a <disk_init>:
#else
#include "include/virtio.h"
#endif 

void disk_init(void)
{
    8020582a:	1141                	addi	sp,sp,-16
    8020582c:	e406                	sd	ra,8(sp)
    8020582e:	e022                	sd	s0,0(sp)
    80205830:	0800                	addi	s0,sp,16
    #ifdef QEMU
    virtio_disk_init();
    80205832:	00002097          	auipc	ra,0x2
    80205836:	f5a080e7          	jalr	-166(ra) # 8020778c <virtio_disk_init>
	#else 
	sdcard_init();
    #endif
}
    8020583a:	60a2                	ld	ra,8(sp)
    8020583c:	6402                	ld	s0,0(sp)
    8020583e:	0141                	addi	sp,sp,16
    80205840:	8082                	ret

0000000080205842 <disk_read>:

void disk_read(struct buf *b)
{
    80205842:	1141                	addi	sp,sp,-16
    80205844:	e406                	sd	ra,8(sp)
    80205846:	e022                	sd	s0,0(sp)
    80205848:	0800                	addi	s0,sp,16
    #ifdef QEMU
	virtio_disk_rw(b, 0);
    8020584a:	4581                	li	a1,0
    8020584c:	00002097          	auipc	ra,0x2
    80205850:	0c6080e7          	jalr	198(ra) # 80207912 <virtio_disk_rw>
    #else 
	sdcard_read_sector(b->data, b->sectorno);
	#endif
}
    80205854:	60a2                	ld	ra,8(sp)
    80205856:	6402                	ld	s0,0(sp)
    80205858:	0141                	addi	sp,sp,16
    8020585a:	8082                	ret

000000008020585c <disk_write>:

void disk_write(struct buf *b)
{
    8020585c:	1141                	addi	sp,sp,-16
    8020585e:	e406                	sd	ra,8(sp)
    80205860:	e022                	sd	s0,0(sp)
    80205862:	0800                	addi	s0,sp,16
    #ifdef QEMU
	virtio_disk_rw(b, 1);
    80205864:	4585                	li	a1,1
    80205866:	00002097          	auipc	ra,0x2
    8020586a:	0ac080e7          	jalr	172(ra) # 80207912 <virtio_disk_rw>
    #else 
	sdcard_write_sector(b->data, b->sectorno);
	#endif
}
    8020586e:	60a2                	ld	ra,8(sp)
    80205870:	6402                	ld	s0,0(sp)
    80205872:	0141                	addi	sp,sp,16
    80205874:	8082                	ret

0000000080205876 <disk_intr>:

void disk_intr(void)
{
    80205876:	1141                	addi	sp,sp,-16
    80205878:	e406                	sd	ra,8(sp)
    8020587a:	e022                	sd	s0,0(sp)
    8020587c:	0800                	addi	s0,sp,16
    #ifdef QEMU
    virtio_disk_intr();
    8020587e:	00002097          	auipc	ra,0x2
    80205882:	320080e7          	jalr	800(ra) # 80207b9e <virtio_disk_intr>
    #else 
    dmac_intr(DMAC_CHANNEL0);
    #endif
}
    80205886:	60a2                	ld	ra,8(sp)
    80205888:	6402                	ld	s0,0(sp)
    8020588a:	0141                	addi	sp,sp,16
    8020588c:	8082                	ret

000000008020588e <skipelem>:
    eput(ep);
    return NULL;
}

static char *skipelem(char *path, char *name)
{
    8020588e:	1101                	addi	sp,sp,-32
    80205890:	ec06                	sd	ra,24(sp)
    80205892:	e822                	sd	s0,16(sp)
    80205894:	e426                	sd	s1,8(sp)
    80205896:	1000                	addi	s0,sp,32
    80205898:	87aa                	mv	a5,a0
    8020589a:	852e                	mv	a0,a1
    while (*path == '/') {
    8020589c:	0007c703          	lbu	a4,0(a5)
    802058a0:	02f00693          	li	a3,47
    802058a4:	00d71763          	bne	a4,a3,802058b2 <skipelem+0x24>
        path++;
    802058a8:	0785                	addi	a5,a5,1
    while (*path == '/') {
    802058aa:	0007c703          	lbu	a4,0(a5)
    802058ae:	fed70de3          	beq	a4,a3,802058a8 <skipelem+0x1a>
    }
    if (*path == 0) { return NULL; }
    802058b2:	4481                	li	s1,0
    802058b4:	cf31                	beqz	a4,80205910 <skipelem+0x82>
    char *s = path;
    while (*path != '/' && *path != 0) {
    802058b6:	0007c703          	lbu	a4,0(a5)
    802058ba:	84be                	mv	s1,a5
    802058bc:	02f00693          	li	a3,47
    802058c0:	c711                	beqz	a4,802058cc <skipelem+0x3e>
        path++;
    802058c2:	0485                	addi	s1,s1,1
    while (*path != '/' && *path != 0) {
    802058c4:	0004c703          	lbu	a4,0(s1)
    802058c8:	fed71ce3          	bne	a4,a3,802058c0 <skipelem+0x32>
    }
    int len = path - s;
    802058cc:	40f48733          	sub	a4,s1,a5
    802058d0:	863a                	mv	a2,a4
    802058d2:	2701                	sext.w	a4,a4
    802058d4:	0ff00693          	li	a3,255
    802058d8:	00e6d463          	bge	a3,a4,802058e0 <skipelem+0x52>
    802058dc:	0ff00613          	li	a2,255
    802058e0:	0006071b          	sext.w	a4,a2
    if (len > FAT32_MAX_FILENAME) {
        len = FAT32_MAX_FILENAME;
    }
    name[len] = 0;
    802058e4:	972a                	add	a4,a4,a0
    802058e6:	00070023          	sb	zero,0(a4)
    memmove(name, s, len);
    802058ea:	2601                	sext.w	a2,a2
    802058ec:	85be                	mv	a1,a5
    802058ee:	ffffb097          	auipc	ra,0xffffb
    802058f2:	ed0080e7          	jalr	-304(ra) # 802007be <memmove>
    while (*path == '/') {
    802058f6:	0004c703          	lbu	a4,0(s1)
    802058fa:	02f00793          	li	a5,47
    802058fe:	00f71963          	bne	a4,a5,80205910 <skipelem+0x82>
    80205902:	02f00713          	li	a4,47
        path++;
    80205906:	0485                	addi	s1,s1,1
    while (*path == '/') {
    80205908:	0004c783          	lbu	a5,0(s1)
    8020590c:	fee78de3          	beq	a5,a4,80205906 <skipelem+0x78>
    }
    return path;
}
    80205910:	8526                	mv	a0,s1
    80205912:	60e2                	ld	ra,24(sp)
    80205914:	6442                	ld	s0,16(sp)
    80205916:	64a2                	ld	s1,8(sp)
    80205918:	6105                	addi	sp,sp,32
    8020591a:	8082                	ret

000000008020591c <read_fat>:
{
    8020591c:	1101                	addi	sp,sp,-32
    8020591e:	ec06                	sd	ra,24(sp)
    80205920:	e822                	sd	s0,16(sp)
    80205922:	e426                	sd	s1,8(sp)
    80205924:	e04a                	sd	s2,0(sp)
    80205926:	1000                	addi	s0,sp,32
    if (cluster >= FAT32_EOC) {
    80205928:	100007b7          	lui	a5,0x10000
    8020592c:	17dd                	addi	a5,a5,-9 # ffffff7 <_entry-0x70200009>
        return cluster;
    8020592e:	84aa                	mv	s1,a0
    if (cluster >= FAT32_EOC) {
    80205930:	00a7ea63          	bltu	a5,a0,80205944 <read_fat+0x28>
    if (cluster > fat.data_clus_cnt + 1) {     // because cluster number starts at 2, not 0
    80205934:	00019797          	auipc	a5,0x19
    80205938:	afc7a783          	lw	a5,-1284(a5) # 8021e430 <fat+0x8>
    8020593c:	2785                	addiw	a5,a5,1
        return 0;
    8020593e:	4481                	li	s1,0
    if (cluster > fat.data_clus_cnt + 1) {     // because cluster number starts at 2, not 0
    80205940:	00a7f963          	bgeu	a5,a0,80205952 <read_fat+0x36>
}
    80205944:	8526                	mv	a0,s1
    80205946:	60e2                	ld	ra,24(sp)
    80205948:	6442                	ld	s0,16(sp)
    8020594a:	64a2                	ld	s1,8(sp)
    8020594c:	6902                	ld	s2,0(sp)
    8020594e:	6105                	addi	sp,sp,32
    80205950:	8082                	ret
    return fat.bpb.rsvd_sec_cnt + (cluster << 2) / fat.bpb.byts_per_sec + fat.bpb.fat_sz * (fat_num - 1);
    80205952:	0025149b          	slliw	s1,a0,0x2
    80205956:	00019917          	auipc	s2,0x19
    8020595a:	ad290913          	addi	s2,s2,-1326 # 8021e428 <fat>
    8020595e:	01095783          	lhu	a5,16(s2)
    80205962:	02f4d7bb          	divuw	a5,s1,a5
    80205966:	01495583          	lhu	a1,20(s2)
    struct buf *b = bread(0, fat_sec);
    8020596a:	9dbd                	addw	a1,a1,a5
    8020596c:	4501                	li	a0,0
    8020596e:	ffffe097          	auipc	ra,0xffffe
    80205972:	f46080e7          	jalr	-186(ra) # 802038b4 <bread>
    return (cluster << 2) % fat.bpb.byts_per_sec;
    80205976:	01095783          	lhu	a5,16(s2)
    8020597a:	02f4f4bb          	remuw	s1,s1,a5
    uint32 next_clus = *(uint32 *)(b->data + fat_offset_of_clus(cluster));
    8020597e:	1482                	slli	s1,s1,0x20
    80205980:	9081                	srli	s1,s1,0x20
    80205982:	009507b3          	add	a5,a0,s1
    80205986:	4fa4                	lw	s1,88(a5)
    brelse(b);
    80205988:	ffffe097          	auipc	ra,0xffffe
    8020598c:	058080e7          	jalr	88(ra) # 802039e0 <brelse>
    return next_clus;
    80205990:	bf55                	j	80205944 <read_fat+0x28>

0000000080205992 <alloc_clus>:
{
    80205992:	711d                	addi	sp,sp,-96
    80205994:	ec86                	sd	ra,88(sp)
    80205996:	e8a2                	sd	s0,80(sp)
    80205998:	e4a6                	sd	s1,72(sp)
    8020599a:	e0ca                	sd	s2,64(sp)
    8020599c:	fc4e                	sd	s3,56(sp)
    8020599e:	f852                	sd	s4,48(sp)
    802059a0:	f456                	sd	s5,40(sp)
    802059a2:	f05a                	sd	s6,32(sp)
    802059a4:	ec5e                	sd	s7,24(sp)
    802059a6:	e862                	sd	s8,16(sp)
    802059a8:	e466                	sd	s9,8(sp)
    802059aa:	1080                	addi	s0,sp,96
    uint32 sec = fat.bpb.rsvd_sec_cnt;
    802059ac:	00019797          	auipc	a5,0x19
    802059b0:	a7c78793          	addi	a5,a5,-1412 # 8021e428 <fat>
    802059b4:	0147db83          	lhu	s7,20(a5)
    uint32 const ent_per_sec = fat.bpb.byts_per_sec / sizeof(uint32);
    802059b8:	0107d903          	lhu	s2,16(a5)
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    802059bc:	539c                	lw	a5,32(a5)
    802059be:	10078363          	beqz	a5,80205ac4 <alloc_clus+0x132>
    802059c2:	0029591b          	srliw	s2,s2,0x2
    802059c6:	0009099b          	sext.w	s3,s2
    802059ca:	4b01                	li	s6,0
        b = bread(dev, sec);
    802059cc:	00050a9b          	sext.w	s5,a0
        for (uint32 j = 0; j < ent_per_sec; j++) {
    802059d0:	4c01                	li	s8,0
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    802059d2:	00019c97          	auipc	s9,0x19
    802059d6:	a56c8c93          	addi	s9,s9,-1450 # 8021e428 <fat>
    802059da:	a0c9                	j	80205a9c <alloc_clus+0x10a>
                ((uint32 *)(b->data))[j] = FAT32_EOC + 7;
    802059dc:	100007b7          	lui	a5,0x10000
    802059e0:	17fd                	addi	a5,a5,-1 # fffffff <_entry-0x70200001>
    802059e2:	c29c                	sw	a5,0(a3)
                bwrite(b);
    802059e4:	8552                	mv	a0,s4
    802059e6:	ffffe097          	auipc	ra,0xffffe
    802059ea:	fbe080e7          	jalr	-66(ra) # 802039a4 <bwrite>
                brelse(b);
    802059ee:	8552                	mv	a0,s4
    802059f0:	ffffe097          	auipc	ra,0xffffe
    802059f4:	ff0080e7          	jalr	-16(ra) # 802039e0 <brelse>
                uint32 clus = i * ent_per_sec + j;
    802059f8:	0369093b          	mulw	s2,s2,s6
    802059fc:	0099093b          	addw	s2,s2,s1
    80205a00:	00090a9b          	sext.w	s5,s2
    return ((cluster - 2) * fat.bpb.sec_per_clus) + fat.first_data_sec;
    80205a04:	00019717          	auipc	a4,0x19
    80205a08:	a2470713          	addi	a4,a4,-1500 # 8021e428 <fat>
    80205a0c:	01274783          	lbu	a5,18(a4)
    80205a10:	ffe9099b          	addiw	s3,s2,-2
    80205a14:	02f989bb          	mulw	s3,s3,a5
    80205a18:	4318                	lw	a4,0(a4)
    80205a1a:	00e989bb          	addw	s3,s3,a4
    for (int i = 0; i < fat.bpb.sec_per_clus; i++) {
    80205a1e:	c7b1                	beqz	a5,80205a6a <alloc_clus+0xd8>
    80205a20:	4901                	li	s2,0
    80205a22:	00019a17          	auipc	s4,0x19
    80205a26:	a06a0a13          	addi	s4,s4,-1530 # 8021e428 <fat>
        b = bread(0, sec++);
    80205a2a:	013905bb          	addw	a1,s2,s3
    80205a2e:	4501                	li	a0,0
    80205a30:	ffffe097          	auipc	ra,0xffffe
    80205a34:	e84080e7          	jalr	-380(ra) # 802038b4 <bread>
    80205a38:	84aa                	mv	s1,a0
        memset(b->data, 0, BSIZE);
    80205a3a:	20000613          	li	a2,512
    80205a3e:	4581                	li	a1,0
    80205a40:	05850513          	addi	a0,a0,88
    80205a44:	ffffb097          	auipc	ra,0xffffb
    80205a48:	d1e080e7          	jalr	-738(ra) # 80200762 <memset>
        bwrite(b);
    80205a4c:	8526                	mv	a0,s1
    80205a4e:	ffffe097          	auipc	ra,0xffffe
    80205a52:	f56080e7          	jalr	-170(ra) # 802039a4 <bwrite>
        brelse(b);
    80205a56:	8526                	mv	a0,s1
    80205a58:	ffffe097          	auipc	ra,0xffffe
    80205a5c:	f88080e7          	jalr	-120(ra) # 802039e0 <brelse>
    for (int i = 0; i < fat.bpb.sec_per_clus; i++) {
    80205a60:	2905                	addiw	s2,s2,1
    80205a62:	012a4783          	lbu	a5,18(s4)
    80205a66:	fcf942e3          	blt	s2,a5,80205a2a <alloc_clus+0x98>
}
    80205a6a:	8556                	mv	a0,s5
    80205a6c:	60e6                	ld	ra,88(sp)
    80205a6e:	6446                	ld	s0,80(sp)
    80205a70:	64a6                	ld	s1,72(sp)
    80205a72:	6906                	ld	s2,64(sp)
    80205a74:	79e2                	ld	s3,56(sp)
    80205a76:	7a42                	ld	s4,48(sp)
    80205a78:	7aa2                	ld	s5,40(sp)
    80205a7a:	7b02                	ld	s6,32(sp)
    80205a7c:	6be2                	ld	s7,24(sp)
    80205a7e:	6c42                	ld	s8,16(sp)
    80205a80:	6ca2                	ld	s9,8(sp)
    80205a82:	6125                	addi	sp,sp,96
    80205a84:	8082                	ret
        brelse(b);
    80205a86:	8552                	mv	a0,s4
    80205a88:	ffffe097          	auipc	ra,0xffffe
    80205a8c:	f58080e7          	jalr	-168(ra) # 802039e0 <brelse>
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    80205a90:	2b05                	addiw	s6,s6,1
    80205a92:	2b85                	addiw	s7,s7,1 # fffffffffffff001 <ebss_clear+0xffffffff7fdd9001>
    80205a94:	020ca783          	lw	a5,32(s9)
    80205a98:	02fb7663          	bgeu	s6,a5,80205ac4 <alloc_clus+0x132>
        b = bread(dev, sec);
    80205a9c:	85de                	mv	a1,s7
    80205a9e:	8556                	mv	a0,s5
    80205aa0:	ffffe097          	auipc	ra,0xffffe
    80205aa4:	e14080e7          	jalr	-492(ra) # 802038b4 <bread>
    80205aa8:	8a2a                	mv	s4,a0
        for (uint32 j = 0; j < ent_per_sec; j++) {
    80205aaa:	fc098ee3          	beqz	s3,80205a86 <alloc_clus+0xf4>
    80205aae:	05850793          	addi	a5,a0,88
    80205ab2:	84e2                	mv	s1,s8
            if (((uint32 *)(b->data))[j] == 0) {
    80205ab4:	86be                	mv	a3,a5
    80205ab6:	4398                	lw	a4,0(a5)
    80205ab8:	d315                	beqz	a4,802059dc <alloc_clus+0x4a>
        for (uint32 j = 0; j < ent_per_sec; j++) {
    80205aba:	2485                	addiw	s1,s1,1
    80205abc:	0791                	addi	a5,a5,4
    80205abe:	fe999be3          	bne	s3,s1,80205ab4 <alloc_clus+0x122>
    80205ac2:	b7d1                	j	80205a86 <alloc_clus+0xf4>
    panic("no clusters");
    80205ac4:	00004517          	auipc	a0,0x4
    80205ac8:	29c50513          	addi	a0,a0,668 # 80209d60 <digits+0x9e0>
    80205acc:	ffffa097          	auipc	ra,0xffffa
    80205ad0:	678080e7          	jalr	1656(ra) # 80200144 <panic>

0000000080205ad4 <write_fat>:
    if (cluster > fat.data_clus_cnt + 1) {
    80205ad4:	00019797          	auipc	a5,0x19
    80205ad8:	95c7a783          	lw	a5,-1700(a5) # 8021e430 <fat+0x8>
    80205adc:	2785                	addiw	a5,a5,1
    80205ade:	06a7e963          	bltu	a5,a0,80205b50 <write_fat+0x7c>
{
    80205ae2:	7179                	addi	sp,sp,-48
    80205ae4:	f406                	sd	ra,40(sp)
    80205ae6:	f022                	sd	s0,32(sp)
    80205ae8:	ec26                	sd	s1,24(sp)
    80205aea:	e84a                	sd	s2,16(sp)
    80205aec:	e44e                	sd	s3,8(sp)
    80205aee:	e052                	sd	s4,0(sp)
    80205af0:	1800                	addi	s0,sp,48
    80205af2:	89ae                	mv	s3,a1
    return fat.bpb.rsvd_sec_cnt + (cluster << 2) / fat.bpb.byts_per_sec + fat.bpb.fat_sz * (fat_num - 1);
    80205af4:	0025149b          	slliw	s1,a0,0x2
    80205af8:	00019a17          	auipc	s4,0x19
    80205afc:	930a0a13          	addi	s4,s4,-1744 # 8021e428 <fat>
    80205b00:	010a5783          	lhu	a5,16(s4)
    80205b04:	02f4d7bb          	divuw	a5,s1,a5
    80205b08:	014a5583          	lhu	a1,20(s4)
    struct buf *b = bread(0, fat_sec);
    80205b0c:	9dbd                	addw	a1,a1,a5
    80205b0e:	4501                	li	a0,0
    80205b10:	ffffe097          	auipc	ra,0xffffe
    80205b14:	da4080e7          	jalr	-604(ra) # 802038b4 <bread>
    80205b18:	892a                	mv	s2,a0
    return (cluster << 2) % fat.bpb.byts_per_sec;
    80205b1a:	010a5783          	lhu	a5,16(s4)
    80205b1e:	02f4f4bb          	remuw	s1,s1,a5
    *(uint32 *)(b->data + off) = content;
    80205b22:	1482                	slli	s1,s1,0x20
    80205b24:	9081                	srli	s1,s1,0x20
    80205b26:	94aa                	add	s1,s1,a0
    80205b28:	0534ac23          	sw	s3,88(s1)
    bwrite(b);
    80205b2c:	ffffe097          	auipc	ra,0xffffe
    80205b30:	e78080e7          	jalr	-392(ra) # 802039a4 <bwrite>
    brelse(b);
    80205b34:	854a                	mv	a0,s2
    80205b36:	ffffe097          	auipc	ra,0xffffe
    80205b3a:	eaa080e7          	jalr	-342(ra) # 802039e0 <brelse>
    return 0;
    80205b3e:	4501                	li	a0,0
}
    80205b40:	70a2                	ld	ra,40(sp)
    80205b42:	7402                	ld	s0,32(sp)
    80205b44:	64e2                	ld	s1,24(sp)
    80205b46:	6942                	ld	s2,16(sp)
    80205b48:	69a2                	ld	s3,8(sp)
    80205b4a:	6a02                	ld	s4,0(sp)
    80205b4c:	6145                	addi	sp,sp,48
    80205b4e:	8082                	ret
        return -1;
    80205b50:	557d                	li	a0,-1
}
    80205b52:	8082                	ret

0000000080205b54 <reloc_clus>:
{
    80205b54:	715d                	addi	sp,sp,-80
    80205b56:	e486                	sd	ra,72(sp)
    80205b58:	e0a2                	sd	s0,64(sp)
    80205b5a:	fc26                	sd	s1,56(sp)
    80205b5c:	f84a                	sd	s2,48(sp)
    80205b5e:	f44e                	sd	s3,40(sp)
    80205b60:	f052                	sd	s4,32(sp)
    80205b62:	ec56                	sd	s5,24(sp)
    80205b64:	e85a                	sd	s6,16(sp)
    80205b66:	e45e                	sd	s7,8(sp)
    80205b68:	0880                	addi	s0,sp,80
    80205b6a:	84aa                	mv	s1,a0
    80205b6c:	8a2e                	mv	s4,a1
    int clus_num = off / fat.byts_per_clus;
    80205b6e:	00019b97          	auipc	s7,0x19
    80205b72:	8c6bab83          	lw	s7,-1850(s7) # 8021e434 <fat+0xc>
    80205b76:	0375d9bb          	divuw	s3,a1,s7
    while (clus_num > entry->clus_cnt) {
    80205b7a:	11052703          	lw	a4,272(a0)
    80205b7e:	07377563          	bgeu	a4,s3,80205be8 <reloc_clus+0x94>
    80205b82:	8b32                	mv	s6,a2
        if (clus >= FAT32_EOC) {
    80205b84:	10000ab7          	lui	s5,0x10000
    80205b88:	1add                	addi	s5,s5,-9 # ffffff7 <_entry-0x70200009>
    80205b8a:	a81d                	j	80205bc0 <reloc_clus+0x6c>
                clus = alloc_clus(entry->dev);
    80205b8c:	1144c503          	lbu	a0,276(s1)
    80205b90:	00000097          	auipc	ra,0x0
    80205b94:	e02080e7          	jalr	-510(ra) # 80205992 <alloc_clus>
    80205b98:	0005091b          	sext.w	s2,a0
                write_fat(entry->cur_clus, clus);
    80205b9c:	85ca                	mv	a1,s2
    80205b9e:	10c4a503          	lw	a0,268(s1)
    80205ba2:	00000097          	auipc	ra,0x0
    80205ba6:	f32080e7          	jalr	-206(ra) # 80205ad4 <write_fat>
        entry->cur_clus = clus;
    80205baa:	1124a623          	sw	s2,268(s1)
        entry->clus_cnt++;
    80205bae:	1104a783          	lw	a5,272(s1)
    80205bb2:	2785                	addiw	a5,a5,1
    80205bb4:	0007871b          	sext.w	a4,a5
    80205bb8:	10f4a823          	sw	a5,272(s1)
    while (clus_num > entry->clus_cnt) {
    80205bbc:	03377663          	bgeu	a4,s3,80205be8 <reloc_clus+0x94>
        int clus = read_fat(entry->cur_clus);
    80205bc0:	10c4a503          	lw	a0,268(s1)
    80205bc4:	00000097          	auipc	ra,0x0
    80205bc8:	d58080e7          	jalr	-680(ra) # 8020591c <read_fat>
    80205bcc:	0005091b          	sext.w	s2,a0
        if (clus >= FAT32_EOC) {
    80205bd0:	fd2adde3          	bge	s5,s2,80205baa <reloc_clus+0x56>
            if (alloc) {
    80205bd4:	fa0b1ce3          	bnez	s6,80205b8c <reloc_clus+0x38>
                entry->cur_clus = entry->first_clus;
    80205bd8:	1044a783          	lw	a5,260(s1)
    80205bdc:	10f4a623          	sw	a5,268(s1)
                entry->clus_cnt = 0;
    80205be0:	1004a823          	sw	zero,272(s1)
                return -1;
    80205be4:	557d                	li	a0,-1
    80205be6:	a881                	j	80205c36 <reloc_clus+0xe2>
    if (clus_num < entry->clus_cnt) {
    80205be8:	04e9f163          	bgeu	s3,a4,80205c2a <reloc_clus+0xd6>
        entry->cur_clus = entry->first_clus;
    80205bec:	1044a783          	lw	a5,260(s1)
    80205bf0:	10f4a623          	sw	a5,268(s1)
        entry->clus_cnt = 0;
    80205bf4:	1004a823          	sw	zero,272(s1)
        while (entry->clus_cnt < clus_num) {
    80205bf8:	037a6963          	bltu	s4,s7,80205c2a <reloc_clus+0xd6>
            if (entry->cur_clus >= FAT32_EOC) {
    80205bfc:	10000937          	lui	s2,0x10000
    80205c00:	195d                	addi	s2,s2,-9 # ffffff7 <_entry-0x70200009>
            entry->cur_clus = read_fat(entry->cur_clus);
    80205c02:	10c4a503          	lw	a0,268(s1)
    80205c06:	00000097          	auipc	ra,0x0
    80205c0a:	d16080e7          	jalr	-746(ra) # 8020591c <read_fat>
    80205c0e:	2501                	sext.w	a0,a0
    80205c10:	10a4a623          	sw	a0,268(s1)
            if (entry->cur_clus >= FAT32_EOC) {
    80205c14:	02a96c63          	bltu	s2,a0,80205c4c <reloc_clus+0xf8>
            entry->clus_cnt++;
    80205c18:	1104a783          	lw	a5,272(s1)
    80205c1c:	2785                	addiw	a5,a5,1
    80205c1e:	0007871b          	sext.w	a4,a5
    80205c22:	10f4a823          	sw	a5,272(s1)
        while (entry->clus_cnt < clus_num) {
    80205c26:	fd376ee3          	bltu	a4,s3,80205c02 <reloc_clus+0xae>
    return off % fat.byts_per_clus;
    80205c2a:	00019797          	auipc	a5,0x19
    80205c2e:	80a7a783          	lw	a5,-2038(a5) # 8021e434 <fat+0xc>
    80205c32:	02fa753b          	remuw	a0,s4,a5
}
    80205c36:	60a6                	ld	ra,72(sp)
    80205c38:	6406                	ld	s0,64(sp)
    80205c3a:	74e2                	ld	s1,56(sp)
    80205c3c:	7942                	ld	s2,48(sp)
    80205c3e:	79a2                	ld	s3,40(sp)
    80205c40:	7a02                	ld	s4,32(sp)
    80205c42:	6ae2                	ld	s5,24(sp)
    80205c44:	6b42                	ld	s6,16(sp)
    80205c46:	6ba2                	ld	s7,8(sp)
    80205c48:	6161                	addi	sp,sp,80
    80205c4a:	8082                	ret
                panic("reloc_clus");
    80205c4c:	00004517          	auipc	a0,0x4
    80205c50:	12450513          	addi	a0,a0,292 # 80209d70 <digits+0x9f0>
    80205c54:	ffffa097          	auipc	ra,0xffffa
    80205c58:	4f0080e7          	jalr	1264(ra) # 80200144 <panic>

0000000080205c5c <rw_clus>:
{
    80205c5c:	7119                	addi	sp,sp,-128
    80205c5e:	fc86                	sd	ra,120(sp)
    80205c60:	f8a2                	sd	s0,112(sp)
    80205c62:	f4a6                	sd	s1,104(sp)
    80205c64:	f0ca                	sd	s2,96(sp)
    80205c66:	ecce                	sd	s3,88(sp)
    80205c68:	e8d2                	sd	s4,80(sp)
    80205c6a:	e4d6                	sd	s5,72(sp)
    80205c6c:	e0da                	sd	s6,64(sp)
    80205c6e:	fc5e                	sd	s7,56(sp)
    80205c70:	f862                	sd	s8,48(sp)
    80205c72:	f466                	sd	s9,40(sp)
    80205c74:	f06a                	sd	s10,32(sp)
    80205c76:	ec6e                	sd	s11,24(sp)
    80205c78:	0100                	addi	s0,sp,128
    80205c7a:	f8c43423          	sd	a2,-120(s0)
    80205c7e:	8b36                	mv	s6,a3
    80205c80:	8c3e                	mv	s8,a5
    if (off + n > fat.byts_per_clus)
    80205c82:	00f706bb          	addw	a3,a4,a5
    80205c86:	00018797          	auipc	a5,0x18
    80205c8a:	7ae7a783          	lw	a5,1966(a5) # 8021e434 <fat+0xc>
    80205c8e:	02d7ef63          	bltu	a5,a3,80205ccc <rw_clus+0x70>
    80205c92:	8cae                	mv	s9,a1
    uint sec = first_sec_of_clus(cluster) + off / fat.bpb.byts_per_sec;
    80205c94:	00018797          	auipc	a5,0x18
    80205c98:	79478793          	addi	a5,a5,1940 # 8021e428 <fat>
    80205c9c:	0107d683          	lhu	a3,16(a5)
    return ((cluster - 2) * fat.bpb.sec_per_clus) + fat.first_data_sec;
    80205ca0:	ffe5099b          	addiw	s3,a0,-2
    80205ca4:	0127c603          	lbu	a2,18(a5)
    80205ca8:	02c989bb          	mulw	s3,s3,a2
    80205cac:	439c                	lw	a5,0(a5)
    80205cae:	00f989bb          	addw	s3,s3,a5
    uint sec = first_sec_of_clus(cluster) + off / fat.bpb.byts_per_sec;
    80205cb2:	02d757bb          	divuw	a5,a4,a3
    80205cb6:	00f989bb          	addw	s3,s3,a5
    off = off % fat.bpb.byts_per_sec;
    80205cba:	02d77abb          	remuw	s5,a4,a3
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    80205cbe:	0e0c0363          	beqz	s8,80205da4 <rw_clus+0x148>
    80205cc2:	4a01                	li	s4,0
        m = BSIZE - off % BSIZE;
    80205cc4:	20000d93          	li	s11,512
        if (bad == -1) {
    80205cc8:	5d7d                	li	s10,-1
    80205cca:	a095                	j	80205d2e <rw_clus+0xd2>
        panic("offset out of range");
    80205ccc:	00004517          	auipc	a0,0x4
    80205cd0:	0b450513          	addi	a0,a0,180 # 80209d80 <digits+0xa00>
    80205cd4:	ffffa097          	auipc	ra,0xffffa
    80205cd8:	470080e7          	jalr	1136(ra) # 80200144 <panic>
                bwrite(bp);
    80205cdc:	854a                	mv	a0,s2
    80205cde:	ffffe097          	auipc	ra,0xffffe
    80205ce2:	cc6080e7          	jalr	-826(ra) # 802039a4 <bwrite>
        brelse(bp);
    80205ce6:	854a                	mv	a0,s2
    80205ce8:	ffffe097          	auipc	ra,0xffffe
    80205cec:	cf8080e7          	jalr	-776(ra) # 802039e0 <brelse>
        if (bad == -1) {
    80205cf0:	a02d                	j	80205d1a <rw_clus+0xbe>
            bad = either_copyout(user, data, bp->data + (off % BSIZE), m);
    80205cf2:	05890613          	addi	a2,s2,88
    80205cf6:	1682                	slli	a3,a3,0x20
    80205cf8:	9281                	srli	a3,a3,0x20
    80205cfa:	963a                	add	a2,a2,a4
    80205cfc:	85da                	mv	a1,s6
    80205cfe:	f8843503          	ld	a0,-120(s0)
    80205d02:	ffffd097          	auipc	ra,0xffffd
    80205d06:	834080e7          	jalr	-1996(ra) # 80202536 <either_copyout>
    80205d0a:	8baa                	mv	s7,a0
        brelse(bp);
    80205d0c:	854a                	mv	a0,s2
    80205d0e:	ffffe097          	auipc	ra,0xffffe
    80205d12:	cd2080e7          	jalr	-814(ra) # 802039e0 <brelse>
        if (bad == -1) {
    80205d16:	07ab8763          	beq	s7,s10,80205d84 <rw_clus+0x128>
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    80205d1a:	01448a3b          	addw	s4,s1,s4
    80205d1e:	01548abb          	addw	s5,s1,s5
    80205d22:	1482                	slli	s1,s1,0x20
    80205d24:	9081                	srli	s1,s1,0x20
    80205d26:	9b26                	add	s6,s6,s1
    80205d28:	2985                	addiw	s3,s3,1
    80205d2a:	058a7d63          	bgeu	s4,s8,80205d84 <rw_clus+0x128>
        bp = bread(0, sec);
    80205d2e:	85ce                	mv	a1,s3
    80205d30:	4501                	li	a0,0
    80205d32:	ffffe097          	auipc	ra,0xffffe
    80205d36:	b82080e7          	jalr	-1150(ra) # 802038b4 <bread>
    80205d3a:	892a                	mv	s2,a0
        m = BSIZE - off % BSIZE;
    80205d3c:	1ffaf713          	andi	a4,s5,511
        if (n - tot < m) {
    80205d40:	414c07bb          	subw	a5,s8,s4
        m = BSIZE - off % BSIZE;
    80205d44:	40ed863b          	subw	a2,s11,a4
    80205d48:	86be                	mv	a3,a5
    80205d4a:	2781                	sext.w	a5,a5
    80205d4c:	0006059b          	sext.w	a1,a2
    80205d50:	00f5f363          	bgeu	a1,a5,80205d56 <rw_clus+0xfa>
    80205d54:	86b2                	mv	a3,a2
    80205d56:	0006849b          	sext.w	s1,a3
        if (write) {
    80205d5a:	f80c8ce3          	beqz	s9,80205cf2 <rw_clus+0x96>
            if ((bad = either_copyin(bp->data + (off % BSIZE), user, data, m)) != -1) {
    80205d5e:	05890513          	addi	a0,s2,88
    80205d62:	1682                	slli	a3,a3,0x20
    80205d64:	9281                	srli	a3,a3,0x20
    80205d66:	865a                	mv	a2,s6
    80205d68:	f8843583          	ld	a1,-120(s0)
    80205d6c:	953a                	add	a0,a0,a4
    80205d6e:	ffffc097          	auipc	ra,0xffffc
    80205d72:	7fe080e7          	jalr	2046(ra) # 8020256c <either_copyin>
    80205d76:	f7a513e3          	bne	a0,s10,80205cdc <rw_clus+0x80>
        brelse(bp);
    80205d7a:	854a                	mv	a0,s2
    80205d7c:	ffffe097          	auipc	ra,0xffffe
    80205d80:	c64080e7          	jalr	-924(ra) # 802039e0 <brelse>
}
    80205d84:	8552                	mv	a0,s4
    80205d86:	70e6                	ld	ra,120(sp)
    80205d88:	7446                	ld	s0,112(sp)
    80205d8a:	74a6                	ld	s1,104(sp)
    80205d8c:	7906                	ld	s2,96(sp)
    80205d8e:	69e6                	ld	s3,88(sp)
    80205d90:	6a46                	ld	s4,80(sp)
    80205d92:	6aa6                	ld	s5,72(sp)
    80205d94:	6b06                	ld	s6,64(sp)
    80205d96:	7be2                	ld	s7,56(sp)
    80205d98:	7c42                	ld	s8,48(sp)
    80205d9a:	7ca2                	ld	s9,40(sp)
    80205d9c:	7d02                	ld	s10,32(sp)
    80205d9e:	6de2                	ld	s11,24(sp)
    80205da0:	6109                	addi	sp,sp,128
    80205da2:	8082                	ret
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    80205da4:	8a62                	mv	s4,s8
    80205da6:	bff9                	j	80205d84 <rw_clus+0x128>

0000000080205da8 <eget>:
{
    80205da8:	7139                	addi	sp,sp,-64
    80205daa:	fc06                	sd	ra,56(sp)
    80205dac:	f822                	sd	s0,48(sp)
    80205dae:	f426                	sd	s1,40(sp)
    80205db0:	f04a                	sd	s2,32(sp)
    80205db2:	ec4e                	sd	s3,24(sp)
    80205db4:	e852                	sd	s4,16(sp)
    80205db6:	e456                	sd	s5,8(sp)
    80205db8:	0080                	addi	s0,sp,64
    80205dba:	8a2a                	mv	s4,a0
    80205dbc:	8aae                	mv	s5,a1
    acquire(&ecache.lock);
    80205dbe:	00018517          	auipc	a0,0x18
    80205dc2:	7fa50513          	addi	a0,a0,2042 # 8021e5b8 <ecache>
    80205dc6:	ffffb097          	auipc	ra,0xffffb
    80205dca:	900080e7          	jalr	-1792(ra) # 802006c6 <acquire>
    if (name) {
    80205dce:	060a8b63          	beqz	s5,80205e44 <eget+0x9c>
        for (ep = root.next; ep != &root; ep = ep->next) {          // LRU algo
    80205dd2:	00018497          	auipc	s1,0x18
    80205dd6:	7a64b483          	ld	s1,1958(s1) # 8021e578 <root+0x128>
    80205dda:	00018797          	auipc	a5,0x18
    80205dde:	67678793          	addi	a5,a5,1654 # 8021e450 <root>
    80205de2:	06f48163          	beq	s1,a5,80205e44 <eget+0x9c>
            if (ep->valid == 1 && ep->parent == parent
    80205de6:	4905                	li	s2,1
        for (ep = root.next; ep != &root; ep = ep->next) {          // LRU algo
    80205de8:	89be                	mv	s3,a5
    80205dea:	a029                	j	80205df4 <eget+0x4c>
    80205dec:	1284b483          	ld	s1,296(s1)
    80205df0:	05348a63          	beq	s1,s3,80205e44 <eget+0x9c>
            if (ep->valid == 1 && ep->parent == parent
    80205df4:	11649783          	lh	a5,278(s1)
    80205df8:	ff279ae3          	bne	a5,s2,80205dec <eget+0x44>
    80205dfc:	1204b783          	ld	a5,288(s1)
    80205e00:	ff4796e3          	bne	a5,s4,80205dec <eget+0x44>
                && strncmp(ep->filename, name, FAT32_MAX_FILENAME) == 0) {
    80205e04:	0ff00613          	li	a2,255
    80205e08:	85d6                	mv	a1,s5
    80205e0a:	8526                	mv	a0,s1
    80205e0c:	ffffb097          	auipc	ra,0xffffb
    80205e10:	a2e080e7          	jalr	-1490(ra) # 8020083a <strncmp>
    80205e14:	fd61                	bnez	a0,80205dec <eget+0x44>
                if (ep->ref++ == 0) {
    80205e16:	1184a783          	lw	a5,280(s1)
    80205e1a:	0017871b          	addiw	a4,a5,1
    80205e1e:	10e4ac23          	sw	a4,280(s1)
    80205e22:	eb81                	bnez	a5,80205e32 <eget+0x8a>
                    ep->parent->ref++;
    80205e24:	1204b703          	ld	a4,288(s1)
    80205e28:	11872783          	lw	a5,280(a4)
    80205e2c:	2785                	addiw	a5,a5,1
    80205e2e:	10f72c23          	sw	a5,280(a4)
                release(&ecache.lock);
    80205e32:	00018517          	auipc	a0,0x18
    80205e36:	78650513          	addi	a0,a0,1926 # 8021e5b8 <ecache>
    80205e3a:	ffffb097          	auipc	ra,0xffffb
    80205e3e:	8e0080e7          	jalr	-1824(ra) # 8020071a <release>
                return ep;
    80205e42:	a085                	j	80205ea2 <eget+0xfa>
    for (ep = root.prev; ep != &root; ep = ep->prev) {              // LRU algo
    80205e44:	00018497          	auipc	s1,0x18
    80205e48:	73c4b483          	ld	s1,1852(s1) # 8021e580 <root+0x130>
    80205e4c:	00018797          	auipc	a5,0x18
    80205e50:	60478793          	addi	a5,a5,1540 # 8021e450 <root>
    80205e54:	00f48a63          	beq	s1,a5,80205e68 <eget+0xc0>
    80205e58:	873e                	mv	a4,a5
        if (ep->ref == 0) {
    80205e5a:	1184a783          	lw	a5,280(s1)
    80205e5e:	cf89                	beqz	a5,80205e78 <eget+0xd0>
    for (ep = root.prev; ep != &root; ep = ep->prev) {              // LRU algo
    80205e60:	1304b483          	ld	s1,304(s1)
    80205e64:	fee49be3          	bne	s1,a4,80205e5a <eget+0xb2>
    panic("eget: insufficient ecache");
    80205e68:	00004517          	auipc	a0,0x4
    80205e6c:	f3050513          	addi	a0,a0,-208 # 80209d98 <digits+0xa18>
    80205e70:	ffffa097          	auipc	ra,0xffffa
    80205e74:	2d4080e7          	jalr	724(ra) # 80200144 <panic>
            ep->ref = 1;
    80205e78:	4785                	li	a5,1
    80205e7a:	10f4ac23          	sw	a5,280(s1)
            ep->dev = parent->dev;
    80205e7e:	114a4783          	lbu	a5,276(s4)
    80205e82:	10f48a23          	sb	a5,276(s1)
            ep->off = 0;
    80205e86:	1004ae23          	sw	zero,284(s1)
            ep->valid = 0;
    80205e8a:	10049b23          	sh	zero,278(s1)
            ep->dirty = 0;
    80205e8e:	10048aa3          	sb	zero,277(s1)
            release(&ecache.lock);
    80205e92:	00018517          	auipc	a0,0x18
    80205e96:	72650513          	addi	a0,a0,1830 # 8021e5b8 <ecache>
    80205e9a:	ffffb097          	auipc	ra,0xffffb
    80205e9e:	880080e7          	jalr	-1920(ra) # 8020071a <release>
}
    80205ea2:	8526                	mv	a0,s1
    80205ea4:	70e2                	ld	ra,56(sp)
    80205ea6:	7442                	ld	s0,48(sp)
    80205ea8:	74a2                	ld	s1,40(sp)
    80205eaa:	7902                	ld	s2,32(sp)
    80205eac:	69e2                	ld	s3,24(sp)
    80205eae:	6a42                	ld	s4,16(sp)
    80205eb0:	6aa2                	ld	s5,8(sp)
    80205eb2:	6121                	addi	sp,sp,64
    80205eb4:	8082                	ret

0000000080205eb6 <read_entry_name>:
{
    80205eb6:	7139                	addi	sp,sp,-64
    80205eb8:	fc06                	sd	ra,56(sp)
    80205eba:	f822                	sd	s0,48(sp)
    80205ebc:	f426                	sd	s1,40(sp)
    80205ebe:	f04a                	sd	s2,32(sp)
    80205ec0:	ec4e                	sd	s3,24(sp)
    80205ec2:	0080                	addi	s0,sp,64
    80205ec4:	84aa                	mv	s1,a0
    80205ec6:	892e                	mv	s2,a1
    if (d->lne.attr == ATTR_LONG_NAME) {                       // long entry branch
    80205ec8:	00b5c703          	lbu	a4,11(a1)
    80205ecc:	47bd                	li	a5,15
    80205ece:	08f70563          	beq	a4,a5,80205f58 <read_entry_name+0xa2>
        memset(buffer, 0, CHAR_SHORT_NAME + 2); // plus '.' and '\0'
    80205ed2:	4635                	li	a2,13
    80205ed4:	4581                	li	a1,0
    80205ed6:	ffffb097          	auipc	ra,0xffffb
    80205eda:	88c080e7          	jalr	-1908(ra) # 80200762 <memset>
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    80205ede:	00094703          	lbu	a4,0(s2)
    80205ee2:	02000793          	li	a5,32
    80205ee6:	0af70c63          	beq	a4,a5,80205f9e <read_entry_name+0xe8>
    80205eea:	4785                	li	a5,1
    80205eec:	02000613          	li	a2,32
    80205ef0:	45a5                	li	a1,9
            buffer[i] = d->sne.name[i];
    80205ef2:	00f486b3          	add	a3,s1,a5
    80205ef6:	fee68fa3          	sb	a4,-1(a3) # 1fff <_entry-0x801fe001>
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    80205efa:	0007869b          	sext.w	a3,a5
    80205efe:	00f90733          	add	a4,s2,a5
    80205f02:	00074703          	lbu	a4,0(a4)
    80205f06:	00c70563          	beq	a4,a2,80205f10 <read_entry_name+0x5a>
    80205f0a:	0785                	addi	a5,a5,1
    80205f0c:	feb793e3          	bne	a5,a1,80205ef2 <read_entry_name+0x3c>
        if (d->sne.name[8] != ' ') {
    80205f10:	00894703          	lbu	a4,8(s2)
    80205f14:	02000793          	li	a5,32
    80205f18:	00f70963          	beq	a4,a5,80205f2a <read_entry_name+0x74>
            buffer[i++] = '.';
    80205f1c:	00d487b3          	add	a5,s1,a3
    80205f20:	02e00713          	li	a4,46
    80205f24:	00e78023          	sb	a4,0(a5)
    80205f28:	2685                	addiw	a3,a3,1
        for (int j = 8; j < CHAR_SHORT_NAME; j++, i++) {
    80205f2a:	00890793          	addi	a5,s2,8
    80205f2e:	94b6                	add	s1,s1,a3
    80205f30:	092d                	addi	s2,s2,11
            if (d->sne.name[j] == ' ') { break; }
    80205f32:	02000693          	li	a3,32
    80205f36:	0007c703          	lbu	a4,0(a5)
    80205f3a:	00d70863          	beq	a4,a3,80205f4a <read_entry_name+0x94>
            buffer[i] = d->sne.name[j];
    80205f3e:	00e48023          	sb	a4,0(s1)
        for (int j = 8; j < CHAR_SHORT_NAME; j++, i++) {
    80205f42:	0785                	addi	a5,a5,1
    80205f44:	0485                	addi	s1,s1,1
    80205f46:	ff2798e3          	bne	a5,s2,80205f36 <read_entry_name+0x80>
}
    80205f4a:	70e2                	ld	ra,56(sp)
    80205f4c:	7442                	ld	s0,48(sp)
    80205f4e:	74a2                	ld	s1,40(sp)
    80205f50:	7902                	ld	s2,32(sp)
    80205f52:	69e2                	ld	s3,24(sp)
    80205f54:	6121                	addi	sp,sp,64
    80205f56:	8082                	ret
        memmove(temp, d->lne.name1, sizeof(temp));
    80205f58:	4629                	li	a2,10
    80205f5a:	0585                	addi	a1,a1,1
    80205f5c:	fc040993          	addi	s3,s0,-64
    80205f60:	854e                	mv	a0,s3
    80205f62:	ffffb097          	auipc	ra,0xffffb
    80205f66:	85c080e7          	jalr	-1956(ra) # 802007be <memmove>
        snstr(buffer, temp, NELEM(d->lne.name1));
    80205f6a:	4615                	li	a2,5
    80205f6c:	85ce                	mv	a1,s3
    80205f6e:	8526                	mv	a0,s1
    80205f70:	ffffb097          	auipc	ra,0xffffb
    80205f74:	9d2080e7          	jalr	-1582(ra) # 80200942 <snstr>
        snstr(buffer, d->lne.name2, NELEM(d->lne.name2));
    80205f78:	4619                	li	a2,6
    80205f7a:	00e90593          	addi	a1,s2,14
    80205f7e:	00548513          	addi	a0,s1,5
    80205f82:	ffffb097          	auipc	ra,0xffffb
    80205f86:	9c0080e7          	jalr	-1600(ra) # 80200942 <snstr>
        snstr(buffer, d->lne.name3, NELEM(d->lne.name3));
    80205f8a:	4609                	li	a2,2
    80205f8c:	01c90593          	addi	a1,s2,28
    80205f90:	00b48513          	addi	a0,s1,11
    80205f94:	ffffb097          	auipc	ra,0xffffb
    80205f98:	9ae080e7          	jalr	-1618(ra) # 80200942 <snstr>
    80205f9c:	b77d                	j	80205f4a <read_entry_name+0x94>
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    80205f9e:	4681                	li	a3,0
    80205fa0:	bf85                	j	80205f10 <read_entry_name+0x5a>

0000000080205fa2 <fat32_init>:
{
    80205fa2:	7139                	addi	sp,sp,-64
    80205fa4:	fc06                	sd	ra,56(sp)
    80205fa6:	f822                	sd	s0,48(sp)
    80205fa8:	f426                	sd	s1,40(sp)
    80205faa:	f04a                	sd	s2,32(sp)
    80205fac:	ec4e                	sd	s3,24(sp)
    80205fae:	e852                	sd	s4,16(sp)
    80205fb0:	e456                	sd	s5,8(sp)
    80205fb2:	0080                	addi	s0,sp,64
    struct buf *b = bread(0, 0);
    80205fb4:	4581                	li	a1,0
    80205fb6:	4501                	li	a0,0
    80205fb8:	ffffe097          	auipc	ra,0xffffe
    80205fbc:	8fc080e7          	jalr	-1796(ra) # 802038b4 <bread>
    80205fc0:	892a                	mv	s2,a0
    if (strncmp((char const*)(b->data + 82), "FAT32", 5))
    80205fc2:	4615                	li	a2,5
    80205fc4:	00004597          	auipc	a1,0x4
    80205fc8:	df458593          	addi	a1,a1,-524 # 80209db8 <digits+0xa38>
    80205fcc:	0aa50513          	addi	a0,a0,170
    80205fd0:	ffffb097          	auipc	ra,0xffffb
    80205fd4:	86a080e7          	jalr	-1942(ra) # 8020083a <strncmp>
    80205fd8:	16051863          	bnez	a0,80206148 <fat32_init+0x1a6>
    memmove(&fat.bpb.byts_per_sec, b->data + 11, 2);            // avoid misaligned load on k210
    80205fdc:	00018497          	auipc	s1,0x18
    80205fe0:	44c48493          	addi	s1,s1,1100 # 8021e428 <fat>
    80205fe4:	4609                	li	a2,2
    80205fe6:	06390593          	addi	a1,s2,99
    80205fea:	00018517          	auipc	a0,0x18
    80205fee:	44e50513          	addi	a0,a0,1102 # 8021e438 <fat+0x10>
    80205ff2:	ffffa097          	auipc	ra,0xffffa
    80205ff6:	7cc080e7          	jalr	1996(ra) # 802007be <memmove>
    fat.bpb.sec_per_clus = *(b->data + 13);
    80205ffa:	06594683          	lbu	a3,101(s2)
    80205ffe:	00d48923          	sb	a3,18(s1)
    fat.bpb.rsvd_sec_cnt = *(uint16 *)(b->data + 14);
    80206002:	06695603          	lhu	a2,102(s2)
    80206006:	00c49a23          	sh	a2,20(s1)
    fat.bpb.fat_cnt = *(b->data + 16);
    8020600a:	06894703          	lbu	a4,104(s2)
    8020600e:	00e48b23          	sb	a4,22(s1)
    fat.bpb.hidd_sec = *(uint32 *)(b->data + 28);
    80206012:	07492783          	lw	a5,116(s2)
    80206016:	cc9c                	sw	a5,24(s1)
    fat.bpb.tot_sec = *(uint32 *)(b->data + 32);
    80206018:	07892783          	lw	a5,120(s2)
    8020601c:	ccdc                	sw	a5,28(s1)
    fat.bpb.fat_sz = *(uint32 *)(b->data + 36);
    8020601e:	07c92583          	lw	a1,124(s2)
    80206022:	d08c                	sw	a1,32(s1)
    fat.bpb.root_clus = *(uint32 *)(b->data + 44);
    80206024:	08492503          	lw	a0,132(s2)
    80206028:	d0c8                	sw	a0,36(s1)
    fat.first_data_sec = fat.bpb.rsvd_sec_cnt + fat.bpb.fat_cnt * fat.bpb.fat_sz;
    8020602a:	02b7073b          	mulw	a4,a4,a1
    8020602e:	9f31                	addw	a4,a4,a2
    80206030:	c098                	sw	a4,0(s1)
    fat.data_sec_cnt = fat.bpb.tot_sec - fat.first_data_sec;
    80206032:	9f99                	subw	a5,a5,a4
    80206034:	c0dc                	sw	a5,4(s1)
    fat.data_clus_cnt = fat.data_sec_cnt / fat.bpb.sec_per_clus;
    80206036:	02d7d7bb          	divuw	a5,a5,a3
    8020603a:	c49c                	sw	a5,8(s1)
    fat.byts_per_clus = fat.bpb.sec_per_clus * fat.bpb.byts_per_sec;
    8020603c:	0104d783          	lhu	a5,16(s1)
    80206040:	02d787bb          	mulw	a5,a5,a3
    80206044:	c4dc                	sw	a5,12(s1)
    brelse(b);
    80206046:	854a                	mv	a0,s2
    80206048:	ffffe097          	auipc	ra,0xffffe
    8020604c:	998080e7          	jalr	-1640(ra) # 802039e0 <brelse>
    if (BSIZE != fat.bpb.byts_per_sec) 
    80206050:	0104d703          	lhu	a4,16(s1)
    80206054:	20000793          	li	a5,512
    80206058:	10f71063          	bne	a4,a5,80206158 <fat32_init+0x1b6>
    initlock(&ecache.lock, "ecache");
    8020605c:	00004597          	auipc	a1,0x4
    80206060:	d9458593          	addi	a1,a1,-620 # 80209df0 <digits+0xa70>
    80206064:	00018517          	auipc	a0,0x18
    80206068:	55450513          	addi	a0,a0,1364 # 8021e5b8 <ecache>
    8020606c:	ffffa097          	auipc	ra,0xffffa
    80206070:	616080e7          	jalr	1558(ra) # 80200682 <initlock>
    memset(&root, 0, sizeof(root));
    80206074:	00018497          	auipc	s1,0x18
    80206078:	3b448493          	addi	s1,s1,948 # 8021e428 <fat>
    8020607c:	00018917          	auipc	s2,0x18
    80206080:	3d490913          	addi	s2,s2,980 # 8021e450 <root>
    80206084:	16800613          	li	a2,360
    80206088:	4581                	li	a1,0
    8020608a:	854a                	mv	a0,s2
    8020608c:	ffffa097          	auipc	ra,0xffffa
    80206090:	6d6080e7          	jalr	1750(ra) # 80200762 <memset>
    initsleeplock(&root.lock, "entry");
    80206094:	00004597          	auipc	a1,0x4
    80206098:	d6458593          	addi	a1,a1,-668 # 80209df8 <digits+0xa78>
    8020609c:	00018517          	auipc	a0,0x18
    802060a0:	4ec50513          	addi	a0,a0,1260 # 8021e588 <root+0x138>
    802060a4:	ffffe097          	auipc	ra,0xffffe
    802060a8:	a52080e7          	jalr	-1454(ra) # 80203af6 <initsleeplock>
    root.attribute = (ATTR_DIRECTORY | ATTR_SYSTEM);
    802060ac:	47d1                	li	a5,20
    802060ae:	12f48423          	sb	a5,296(s1)
    root.first_clus = root.cur_clus = fat.bpb.root_clus;
    802060b2:	50dc                	lw	a5,36(s1)
    802060b4:	12f4aa23          	sw	a5,308(s1)
    802060b8:	12f4a623          	sw	a5,300(s1)
    root.valid = 1;
    802060bc:	4785                	li	a5,1
    802060be:	12f49f23          	sh	a5,318(s1)
    root.prev = &root;
    802060c2:	1524bc23          	sd	s2,344(s1)
    root.next = &root;
    802060c6:	1524b823          	sd	s2,336(s1)
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    802060ca:	00018497          	auipc	s1,0x18
    802060ce:	50648493          	addi	s1,s1,1286 # 8021e5d0 <ecache+0x18>
        de->next = root.next;
    802060d2:	00018917          	auipc	s2,0x18
    802060d6:	35690913          	addi	s2,s2,854 # 8021e428 <fat>
        de->prev = &root;
    802060da:	00018a97          	auipc	s5,0x18
    802060de:	376a8a93          	addi	s5,s5,886 # 8021e450 <root>
        initsleeplock(&de->lock, "entry");
    802060e2:	00004a17          	auipc	s4,0x4
    802060e6:	d16a0a13          	addi	s4,s4,-746 # 80209df8 <digits+0xa78>
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    802060ea:	0001d997          	auipc	s3,0x1d
    802060ee:	b3698993          	addi	s3,s3,-1226 # 80222c20 <cons>
        de->dev = 0;
    802060f2:	10048a23          	sb	zero,276(s1)
        de->valid = 0;
    802060f6:	10049b23          	sh	zero,278(s1)
        de->ref = 0;
    802060fa:	1004ac23          	sw	zero,280(s1)
        de->dirty = 0;
    802060fe:	10048aa3          	sb	zero,277(s1)
        de->parent = 0;
    80206102:	1204b023          	sd	zero,288(s1)
        de->next = root.next;
    80206106:	15093783          	ld	a5,336(s2)
    8020610a:	12f4b423          	sd	a5,296(s1)
        de->prev = &root;
    8020610e:	1354b823          	sd	s5,304(s1)
        initsleeplock(&de->lock, "entry");
    80206112:	85d2                	mv	a1,s4
    80206114:	13848513          	addi	a0,s1,312
    80206118:	ffffe097          	auipc	ra,0xffffe
    8020611c:	9de080e7          	jalr	-1570(ra) # 80203af6 <initsleeplock>
        root.next->prev = de;
    80206120:	15093783          	ld	a5,336(s2)
    80206124:	1297b823          	sd	s1,304(a5)
        root.next = de;
    80206128:	14993823          	sd	s1,336(s2)
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    8020612c:	16848493          	addi	s1,s1,360
    80206130:	fd3491e3          	bne	s1,s3,802060f2 <fat32_init+0x150>
}
    80206134:	4501                	li	a0,0
    80206136:	70e2                	ld	ra,56(sp)
    80206138:	7442                	ld	s0,48(sp)
    8020613a:	74a2                	ld	s1,40(sp)
    8020613c:	7902                	ld	s2,32(sp)
    8020613e:	69e2                	ld	s3,24(sp)
    80206140:	6a42                	ld	s4,16(sp)
    80206142:	6aa2                	ld	s5,8(sp)
    80206144:	6121                	addi	sp,sp,64
    80206146:	8082                	ret
        panic("not FAT32 volume");
    80206148:	00004517          	auipc	a0,0x4
    8020614c:	c7850513          	addi	a0,a0,-904 # 80209dc0 <digits+0xa40>
    80206150:	ffffa097          	auipc	ra,0xffffa
    80206154:	ff4080e7          	jalr	-12(ra) # 80200144 <panic>
        panic("byts_per_sec != BSIZE");
    80206158:	00004517          	auipc	a0,0x4
    8020615c:	c8050513          	addi	a0,a0,-896 # 80209dd8 <digits+0xa58>
    80206160:	ffffa097          	auipc	ra,0xffffa
    80206164:	fe4080e7          	jalr	-28(ra) # 80200144 <panic>

0000000080206168 <eread>:
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    80206168:	10852783          	lw	a5,264(a0)
    8020616c:	0ed7e863          	bltu	a5,a3,8020625c <eread+0xf4>
{
    80206170:	711d                	addi	sp,sp,-96
    80206172:	ec86                	sd	ra,88(sp)
    80206174:	e8a2                	sd	s0,80(sp)
    80206176:	e4a6                	sd	s1,72(sp)
    80206178:	e0ca                	sd	s2,64(sp)
    8020617a:	fc4e                	sd	s3,56(sp)
    8020617c:	f852                	sd	s4,48(sp)
    8020617e:	f456                	sd	s5,40(sp)
    80206180:	f05a                	sd	s6,32(sp)
    80206182:	ec5e                	sd	s7,24(sp)
    80206184:	e862                	sd	s8,16(sp)
    80206186:	e466                	sd	s9,8(sp)
    80206188:	e06a                	sd	s10,0(sp)
    8020618a:	1080                	addi	s0,sp,96
    8020618c:	8a2a                	mv	s4,a0
    8020618e:	8bae                	mv	s7,a1
    80206190:	8ab2                	mv	s5,a2
    80206192:	8936                	mv	s2,a3
    80206194:	8b3a                	mv	s6,a4
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    80206196:	9eb9                	addw	a3,a3,a4
        return 0;
    80206198:	4501                	li	a0,0
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    8020619a:	0b26e163          	bltu	a3,s2,8020623c <eread+0xd4>
    8020619e:	100a4703          	lbu	a4,256(s4)
    802061a2:	8b41                	andi	a4,a4,16
    802061a4:	ef41                	bnez	a4,8020623c <eread+0xd4>
    if (off + n > entry->file_size) {
    802061a6:	00d7f463          	bgeu	a5,a3,802061ae <eread+0x46>
        n = entry->file_size - off;
    802061aa:	41278b3b          	subw	s6,a5,s2
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    802061ae:	10ca2703          	lw	a4,268(s4)
    802061b2:	100007b7          	lui	a5,0x10000
    802061b6:	17dd                	addi	a5,a5,-9 # ffffff7 <_entry-0x70200009>
    802061b8:	06e7ef63          	bltu	a5,a4,80206236 <eread+0xce>
    802061bc:	080b0e63          	beqz	s6,80206258 <eread+0xf0>
    802061c0:	4981                	li	s3,0
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    802061c2:	00018c97          	auipc	s9,0x18
    802061c6:	266c8c93          	addi	s9,s9,614 # 8021e428 <fat>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    802061ca:	8c3e                	mv	s8,a5
    802061cc:	a82d                	j	80206206 <eread+0x9e>
    802061ce:	00048d1b          	sext.w	s10,s1
        if (rw_clus(entry->cur_clus, 0, user_dst, dst, off % fat.byts_per_clus, m) != m) {
    802061d2:	87ea                	mv	a5,s10
    802061d4:	86d6                	mv	a3,s5
    802061d6:	865e                	mv	a2,s7
    802061d8:	4581                	li	a1,0
    802061da:	10ca2503          	lw	a0,268(s4)
    802061de:	00000097          	auipc	ra,0x0
    802061e2:	a7e080e7          	jalr	-1410(ra) # 80205c5c <rw_clus>
    802061e6:	2501                	sext.w	a0,a0
    802061e8:	04ad1863          	bne	s10,a0,80206238 <eread+0xd0>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    802061ec:	013489bb          	addw	s3,s1,s3
    802061f0:	0124893b          	addw	s2,s1,s2
    802061f4:	1482                	slli	s1,s1,0x20
    802061f6:	9081                	srli	s1,s1,0x20
    802061f8:	9aa6                	add	s5,s5,s1
    802061fa:	10ca2783          	lw	a5,268(s4)
    802061fe:	02fc6d63          	bltu	s8,a5,80206238 <eread+0xd0>
    80206202:	0369fb63          	bgeu	s3,s6,80206238 <eread+0xd0>
        reloc_clus(entry, off, 0);
    80206206:	4601                	li	a2,0
    80206208:	85ca                	mv	a1,s2
    8020620a:	8552                	mv	a0,s4
    8020620c:	00000097          	auipc	ra,0x0
    80206210:	948080e7          	jalr	-1720(ra) # 80205b54 <reloc_clus>
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80206214:	00cca683          	lw	a3,12(s9)
    80206218:	02d9763b          	remuw	a2,s2,a3
    8020621c:	0006071b          	sext.w	a4,a2
        if (n - tot < m) {
    80206220:	413b07bb          	subw	a5,s6,s3
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80206224:	9e91                	subw	a3,a3,a2
    80206226:	84be                	mv	s1,a5
    80206228:	2781                	sext.w	a5,a5
    8020622a:	0006861b          	sext.w	a2,a3
    8020622e:	faf670e3          	bgeu	a2,a5,802061ce <eread+0x66>
    80206232:	84b6                	mv	s1,a3
    80206234:	bf69                	j	802061ce <eread+0x66>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80206236:	4981                	li	s3,0
    return tot;
    80206238:	0009851b          	sext.w	a0,s3
}
    8020623c:	60e6                	ld	ra,88(sp)
    8020623e:	6446                	ld	s0,80(sp)
    80206240:	64a6                	ld	s1,72(sp)
    80206242:	6906                	ld	s2,64(sp)
    80206244:	79e2                	ld	s3,56(sp)
    80206246:	7a42                	ld	s4,48(sp)
    80206248:	7aa2                	ld	s5,40(sp)
    8020624a:	7b02                	ld	s6,32(sp)
    8020624c:	6be2                	ld	s7,24(sp)
    8020624e:	6c42                	ld	s8,16(sp)
    80206250:	6ca2                	ld	s9,8(sp)
    80206252:	6d02                	ld	s10,0(sp)
    80206254:	6125                	addi	sp,sp,96
    80206256:	8082                	ret
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80206258:	89da                	mv	s3,s6
    8020625a:	bff9                	j	80206238 <eread+0xd0>
        return 0;
    8020625c:	4501                	li	a0,0
}
    8020625e:	8082                	ret

0000000080206260 <ewrite>:
    if (off > entry->file_size || off + n < off || (uint64)off + n > 0xffffffff
    80206260:	10852783          	lw	a5,264(a0)
    80206264:	0ed7e463          	bltu	a5,a3,8020634c <ewrite+0xec>
{
    80206268:	711d                	addi	sp,sp,-96
    8020626a:	ec86                	sd	ra,88(sp)
    8020626c:	e8a2                	sd	s0,80(sp)
    8020626e:	e4a6                	sd	s1,72(sp)
    80206270:	e0ca                	sd	s2,64(sp)
    80206272:	fc4e                	sd	s3,56(sp)
    80206274:	f852                	sd	s4,48(sp)
    80206276:	f456                	sd	s5,40(sp)
    80206278:	f05a                	sd	s6,32(sp)
    8020627a:	ec5e                	sd	s7,24(sp)
    8020627c:	e862                	sd	s8,16(sp)
    8020627e:	e466                	sd	s9,8(sp)
    80206280:	1080                	addi	s0,sp,96
    80206282:	8aaa                	mv	s5,a0
    80206284:	8bae                	mv	s7,a1
    80206286:	8a32                	mv	s4,a2
    80206288:	8936                	mv	s2,a3
    8020628a:	8b3a                	mv	s6,a4
    if (off > entry->file_size || off + n < off || (uint64)off + n > 0xffffffff
    8020628c:	00e687bb          	addw	a5,a3,a4
    80206290:	0cd7e063          	bltu	a5,a3,80206350 <ewrite+0xf0>
    80206294:	02069793          	slli	a5,a3,0x20
    80206298:	9381                	srli	a5,a5,0x20
    8020629a:	1702                	slli	a4,a4,0x20
    8020629c:	9301                	srli	a4,a4,0x20
    8020629e:	97ba                	add	a5,a5,a4
    802062a0:	577d                	li	a4,-1
    802062a2:	9301                	srli	a4,a4,0x20
    802062a4:	0af76863          	bltu	a4,a5,80206354 <ewrite+0xf4>
        || (entry->attribute & ATTR_READ_ONLY)) {
    802062a8:	10054783          	lbu	a5,256(a0)
    802062ac:	8b85                	andi	a5,a5,1
    802062ae:	e7cd                	bnez	a5,80206358 <ewrite+0xf8>
    if (entry->first_clus == 0) {   // so file_size if 0 too, which requests off == 0
    802062b0:	10452783          	lw	a5,260(a0)
    802062b4:	cb89                	beqz	a5,802062c6 <ewrite+0x66>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    802062b6:	080b0963          	beqz	s6,80206348 <ewrite+0xe8>
    802062ba:	4981                	li	s3,0
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    802062bc:	00018c17          	auipc	s8,0x18
    802062c0:	16cc0c13          	addi	s8,s8,364 # 8021e428 <fat>
    802062c4:	a891                	j	80206318 <ewrite+0xb8>
        entry->cur_clus = entry->first_clus = alloc_clus(entry->dev);
    802062c6:	11454503          	lbu	a0,276(a0)
    802062ca:	fffff097          	auipc	ra,0xfffff
    802062ce:	6c8080e7          	jalr	1736(ra) # 80205992 <alloc_clus>
    802062d2:	2501                	sext.w	a0,a0
    802062d4:	10aaa223          	sw	a0,260(s5)
    802062d8:	10aaa623          	sw	a0,268(s5)
        entry->clus_cnt = 0;
    802062dc:	100aa823          	sw	zero,272(s5)
        entry->dirty = 1;
    802062e0:	4785                	li	a5,1
    802062e2:	10fa8aa3          	sb	a5,277(s5)
    802062e6:	bfc1                	j	802062b6 <ewrite+0x56>
    802062e8:	00048c9b          	sext.w	s9,s1
        if (rw_clus(entry->cur_clus, 1, user_src, src, off % fat.byts_per_clus, m) != m) {
    802062ec:	87e6                	mv	a5,s9
    802062ee:	86d2                	mv	a3,s4
    802062f0:	865e                	mv	a2,s7
    802062f2:	4585                	li	a1,1
    802062f4:	10caa503          	lw	a0,268(s5)
    802062f8:	00000097          	auipc	ra,0x0
    802062fc:	964080e7          	jalr	-1692(ra) # 80205c5c <rw_clus>
    80206300:	2501                	sext.w	a0,a0
    80206302:	04ac9d63          	bne	s9,a0,8020635c <ewrite+0xfc>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    80206306:	013489bb          	addw	s3,s1,s3
    8020630a:	0124893b          	addw	s2,s1,s2
    8020630e:	1482                	slli	s1,s1,0x20
    80206310:	9081                	srli	s1,s1,0x20
    80206312:	9a26                	add	s4,s4,s1
    80206314:	0569f463          	bgeu	s3,s6,8020635c <ewrite+0xfc>
        reloc_clus(entry, off, 1);
    80206318:	4605                	li	a2,1
    8020631a:	85ca                	mv	a1,s2
    8020631c:	8556                	mv	a0,s5
    8020631e:	00000097          	auipc	ra,0x0
    80206322:	836080e7          	jalr	-1994(ra) # 80205b54 <reloc_clus>
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80206326:	00cc2683          	lw	a3,12(s8)
    8020632a:	02d9763b          	remuw	a2,s2,a3
    8020632e:	0006071b          	sext.w	a4,a2
        if (n - tot < m) {
    80206332:	413b07bb          	subw	a5,s6,s3
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80206336:	9e91                	subw	a3,a3,a2
    80206338:	84be                	mv	s1,a5
    8020633a:	2781                	sext.w	a5,a5
    8020633c:	0006861b          	sext.w	a2,a3
    80206340:	faf674e3          	bgeu	a2,a5,802062e8 <ewrite+0x88>
    80206344:	84b6                	mv	s1,a3
    80206346:	b74d                	j	802062e8 <ewrite+0x88>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    80206348:	89da                	mv	s3,s6
    8020634a:	a015                	j	8020636e <ewrite+0x10e>
        return -1;
    8020634c:	557d                	li	a0,-1
}
    8020634e:	8082                	ret
        return -1;
    80206350:	557d                	li	a0,-1
    80206352:	a005                	j	80206372 <ewrite+0x112>
    80206354:	557d                	li	a0,-1
    80206356:	a831                	j	80206372 <ewrite+0x112>
    80206358:	557d                	li	a0,-1
    8020635a:	a821                	j	80206372 <ewrite+0x112>
        if(off > entry->file_size) {
    8020635c:	108aa783          	lw	a5,264(s5)
    80206360:	0127f763          	bgeu	a5,s2,8020636e <ewrite+0x10e>
            entry->file_size = off;
    80206364:	112aa423          	sw	s2,264(s5)
            entry->dirty = 1;
    80206368:	4785                	li	a5,1
    8020636a:	10fa8aa3          	sb	a5,277(s5)
    return tot;
    8020636e:	0009851b          	sext.w	a0,s3
}
    80206372:	60e6                	ld	ra,88(sp)
    80206374:	6446                	ld	s0,80(sp)
    80206376:	64a6                	ld	s1,72(sp)
    80206378:	6906                	ld	s2,64(sp)
    8020637a:	79e2                	ld	s3,56(sp)
    8020637c:	7a42                	ld	s4,48(sp)
    8020637e:	7aa2                	ld	s5,40(sp)
    80206380:	7b02                	ld	s6,32(sp)
    80206382:	6be2                	ld	s7,24(sp)
    80206384:	6c42                	ld	s8,16(sp)
    80206386:	6ca2                	ld	s9,8(sp)
    80206388:	6125                	addi	sp,sp,96
    8020638a:	8082                	ret

000000008020638c <formatname>:
{
    8020638c:	7179                	addi	sp,sp,-48
    8020638e:	f406                	sd	ra,40(sp)
    80206390:	f022                	sd	s0,32(sp)
    80206392:	ec26                	sd	s1,24(sp)
    80206394:	e84a                	sd	s2,16(sp)
    80206396:	e44e                	sd	s3,8(sp)
    80206398:	e052                	sd	s4,0(sp)
    8020639a:	1800                	addi	s0,sp,48
    8020639c:	84aa                	mv	s1,a0
    while (*name == ' ' || *name == '.') { name++; }
    8020639e:	02000793          	li	a5,32
    802063a2:	02e00713          	li	a4,46
    802063a6:	a011                	j	802063aa <formatname+0x1e>
    802063a8:	0485                	addi	s1,s1,1
    802063aa:	0004c583          	lbu	a1,0(s1)
    802063ae:	fef58de3          	beq	a1,a5,802063a8 <formatname+0x1c>
    802063b2:	fee58be3          	beq	a1,a4,802063a8 <formatname+0x1c>
    for (p = name; *p; p++) {
    802063b6:	c1b9                	beqz	a1,802063fc <formatname+0x70>
    802063b8:	8926                	mv	s2,s1
        if (c < 0x20 || strchr(illegal, c)) {
    802063ba:	49fd                	li	s3,31
    802063bc:	00006a17          	auipc	s4,0x6
    802063c0:	8e4a0a13          	addi	s4,s4,-1820 # 8020bca0 <illegal.1>
    802063c4:	02b9fe63          	bgeu	s3,a1,80206400 <formatname+0x74>
    802063c8:	8552                	mv	a0,s4
    802063ca:	ffffa097          	auipc	ra,0xffffa
    802063ce:	5f6080e7          	jalr	1526(ra) # 802009c0 <strchr>
    802063d2:	e121                	bnez	a0,80206412 <formatname+0x86>
    for (p = name; *p; p++) {
    802063d4:	0905                	addi	s2,s2,1
    802063d6:	00094583          	lbu	a1,0(s2)
    802063da:	f5ed                	bnez	a1,802063c4 <formatname+0x38>
        if (*p != ' ') {
    802063dc:	02000693          	li	a3,32
    802063e0:	874a                	mv	a4,s2
    while (p-- > name) {
    802063e2:	0124fb63          	bgeu	s1,s2,802063f8 <formatname+0x6c>
        if (*p != ' ') {
    802063e6:	197d                	addi	s2,s2,-1
    802063e8:	00094783          	lbu	a5,0(s2)
    802063ec:	fed78ae3          	beq	a5,a3,802063e0 <formatname+0x54>
            p[1] = '\0';
    802063f0:	00070023          	sb	zero,0(a4)
            break;
    802063f4:	8526                	mv	a0,s1
    802063f6:	a031                	j	80206402 <formatname+0x76>
    802063f8:	8526                	mv	a0,s1
    802063fa:	a021                	j	80206402 <formatname+0x76>
    for (p = name; *p; p++) {
    802063fc:	8526                	mv	a0,s1
    802063fe:	a011                	j	80206402 <formatname+0x76>
            return 0;
    80206400:	4501                	li	a0,0
}
    80206402:	70a2                	ld	ra,40(sp)
    80206404:	7402                	ld	s0,32(sp)
    80206406:	64e2                	ld	s1,24(sp)
    80206408:	6942                	ld	s2,16(sp)
    8020640a:	69a2                	ld	s3,8(sp)
    8020640c:	6a02                	ld	s4,0(sp)
    8020640e:	6145                	addi	sp,sp,48
    80206410:	8082                	ret
            return 0;
    80206412:	4501                	li	a0,0
    80206414:	b7fd                	j	80206402 <formatname+0x76>

0000000080206416 <cal_checksum>:
{
    80206416:	1141                	addi	sp,sp,-16
    80206418:	e422                	sd	s0,8(sp)
    8020641a:	0800                	addi	s0,sp,16
    8020641c:	87aa                	mv	a5,a0
    for (int i = CHAR_SHORT_NAME; i != 0; i--) {
    8020641e:	00b50613          	addi	a2,a0,11
    uint8 sum = 0;
    80206422:	4501                	li	a0,0
        sum = ((sum & 1) ? 0x80 : 0) + (sum >> 1) + *shortname++;
    80206424:	0075171b          	slliw	a4,a0,0x7
    80206428:	0785                	addi	a5,a5,1
    8020642a:	0015551b          	srliw	a0,a0,0x1
    8020642e:	fff7c683          	lbu	a3,-1(a5)
    80206432:	9d35                	addw	a0,a0,a3
    80206434:	953a                	add	a0,a0,a4
    80206436:	0ff57513          	zext.b	a0,a0
    for (int i = CHAR_SHORT_NAME; i != 0; i--) {
    8020643a:	fef615e3          	bne	a2,a5,80206424 <cal_checksum+0xe>
}
    8020643e:	6422                	ld	s0,8(sp)
    80206440:	0141                	addi	sp,sp,16
    80206442:	8082                	ret

0000000080206444 <emake>:
{
    80206444:	7131                	addi	sp,sp,-192
    80206446:	fd06                	sd	ra,184(sp)
    80206448:	f922                	sd	s0,176(sp)
    8020644a:	f526                	sd	s1,168(sp)
    8020644c:	f14a                	sd	s2,160(sp)
    8020644e:	ed4e                	sd	s3,152(sp)
    80206450:	e952                	sd	s4,144(sp)
    80206452:	e556                	sd	s5,136(sp)
    80206454:	e15a                	sd	s6,128(sp)
    80206456:	fcde                	sd	s7,120(sp)
    80206458:	f8e2                	sd	s8,112(sp)
    8020645a:	f4e6                	sd	s9,104(sp)
    8020645c:	f0ea                	sd	s10,96(sp)
    8020645e:	ecee                	sd	s11,88(sp)
    80206460:	0180                	addi	s0,sp,192
    if (!(dp->attribute & ATTR_DIRECTORY))
    80206462:	10054783          	lbu	a5,256(a0)
    80206466:	8bc1                	andi	a5,a5,16
    80206468:	c3d5                	beqz	a5,8020650c <emake+0xc8>
    8020646a:	8b2a                	mv	s6,a0
    8020646c:	8d2e                	mv	s10,a1
    8020646e:	8cb2                	mv	s9,a2
    if (off % sizeof(union dentry))
    80206470:	01f67793          	andi	a5,a2,31
    80206474:	e7c5                	bnez	a5,8020651c <emake+0xd8>
    memset(&de, 0, sizeof(de));
    80206476:	02000613          	li	a2,32
    8020647a:	4581                	li	a1,0
    8020647c:	f7040513          	addi	a0,s0,-144
    80206480:	ffffa097          	auipc	ra,0xffffa
    80206484:	2e2080e7          	jalr	738(ra) # 80200762 <memset>
    if (off <= 32) {
    80206488:	02000793          	li	a5,32
    8020648c:	0b97ec63          	bltu	a5,s9,80206544 <emake+0x100>
        if (off == 0) {
    80206490:	080c9e63          	bnez	s9,8020652c <emake+0xe8>
            strncpy(de.sne.name, ".          ", sizeof(de.sne.name));
    80206494:	462d                	li	a2,11
    80206496:	00004597          	auipc	a1,0x4
    8020649a:	99258593          	addi	a1,a1,-1646 # 80209e28 <digits+0xaa8>
    8020649e:	f7040513          	addi	a0,s0,-144
    802064a2:	ffffa097          	auipc	ra,0xffffa
    802064a6:	3d4080e7          	jalr	980(ra) # 80200876 <strncpy>
        de.sne.attr = ATTR_DIRECTORY;
    802064aa:	47c1                	li	a5,16
    802064ac:	f6f40da3          	sb	a5,-133(s0)
        de.sne.fst_clus_hi = (uint16)(ep->first_clus >> 16);        // first clus high 16 bits
    802064b0:	104d2783          	lw	a5,260(s10) # fffffffffffff104 <ebss_clear+0xffffffff7fdd9104>
    802064b4:	0107d71b          	srliw	a4,a5,0x10
    802064b8:	f8e41223          	sh	a4,-124(s0)
        de.sne.fst_clus_lo = (uint16)(ep->first_clus & 0xffff);       // low 16 bits
    802064bc:	f8f41523          	sh	a5,-118(s0)
        de.sne.file_size = 0;                                       // filesize is updated in eupdate()
    802064c0:	f8042623          	sw	zero,-116(s0)
        off = reloc_clus(dp, off, 1);
    802064c4:	4605                	li	a2,1
    802064c6:	85e6                	mv	a1,s9
    802064c8:	855a                	mv	a0,s6
    802064ca:	fffff097          	auipc	ra,0xfffff
    802064ce:	68a080e7          	jalr	1674(ra) # 80205b54 <reloc_clus>
        rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    802064d2:	02000793          	li	a5,32
    802064d6:	0005071b          	sext.w	a4,a0
    802064da:	f7040693          	addi	a3,s0,-144
    802064de:	4601                	li	a2,0
    802064e0:	4585                	li	a1,1
    802064e2:	10cb2503          	lw	a0,268(s6)
    802064e6:	fffff097          	auipc	ra,0xfffff
    802064ea:	776080e7          	jalr	1910(ra) # 80205c5c <rw_clus>
}
    802064ee:	70ea                	ld	ra,184(sp)
    802064f0:	744a                	ld	s0,176(sp)
    802064f2:	74aa                	ld	s1,168(sp)
    802064f4:	790a                	ld	s2,160(sp)
    802064f6:	69ea                	ld	s3,152(sp)
    802064f8:	6a4a                	ld	s4,144(sp)
    802064fa:	6aaa                	ld	s5,136(sp)
    802064fc:	6b0a                	ld	s6,128(sp)
    802064fe:	7be6                	ld	s7,120(sp)
    80206500:	7c46                	ld	s8,112(sp)
    80206502:	7ca6                	ld	s9,104(sp)
    80206504:	7d06                	ld	s10,96(sp)
    80206506:	6de6                	ld	s11,88(sp)
    80206508:	6129                	addi	sp,sp,192
    8020650a:	8082                	ret
        panic("emake: not dir");
    8020650c:	00004517          	auipc	a0,0x4
    80206510:	8f450513          	addi	a0,a0,-1804 # 80209e00 <digits+0xa80>
    80206514:	ffffa097          	auipc	ra,0xffffa
    80206518:	c30080e7          	jalr	-976(ra) # 80200144 <panic>
        panic("emake: not aligned");
    8020651c:	00004517          	auipc	a0,0x4
    80206520:	8f450513          	addi	a0,a0,-1804 # 80209e10 <digits+0xa90>
    80206524:	ffffa097          	auipc	ra,0xffffa
    80206528:	c20080e7          	jalr	-992(ra) # 80200144 <panic>
            strncpy(de.sne.name, "..         ", sizeof(de.sne.name));
    8020652c:	462d                	li	a2,11
    8020652e:	00004597          	auipc	a1,0x4
    80206532:	90a58593          	addi	a1,a1,-1782 # 80209e38 <digits+0xab8>
    80206536:	f7040513          	addi	a0,s0,-144
    8020653a:	ffffa097          	auipc	ra,0xffffa
    8020653e:	33c080e7          	jalr	828(ra) # 80200876 <strncpy>
    80206542:	b7a5                	j	802064aa <emake+0x66>
        int entcnt = (strlen(ep->filename) + CHAR_LONG_NAME - 1) / CHAR_LONG_NAME;   // count of l-n-entries, rounds up
    80206544:	896a                	mv	s2,s10
    80206546:	856a                	mv	a0,s10
    80206548:	ffffa097          	auipc	ra,0xffffa
    8020654c:	39e080e7          	jalr	926(ra) # 802008e6 <strlen>
    80206550:	f4a43423          	sd	a0,-184(s0)
    80206554:	00c5071b          	addiw	a4,a0,12
    80206558:	47b5                	li	a5,13
    8020655a:	02f747bb          	divw	a5,a4,a5
    8020655e:	f4f42c23          	sw	a5,-168(s0)
    80206562:	00078d9b          	sext.w	s11,a5
        memset(shortname, 0, sizeof(shortname));
    80206566:	4631                	li	a2,12
    80206568:	4581                	li	a1,0
    8020656a:	f6040513          	addi	a0,s0,-160
    8020656e:	ffffa097          	auipc	ra,0xffffa
    80206572:	1f4080e7          	jalr	500(ra) # 80200762 <memset>
    for (int j = strlen(name) - 1; j >= 0; j--) {
    80206576:	856a                	mv	a0,s10
    80206578:	ffffa097          	auipc	ra,0xffffa
    8020657c:	36e080e7          	jalr	878(ra) # 802008e6 <strlen>
    80206580:	fff5079b          	addiw	a5,a0,-1
    80206584:	0207cf63          	bltz	a5,802065c2 <emake+0x17e>
    80206588:	97ea                	add	a5,a5,s10
    8020658a:	ffed0693          	addi	a3,s10,-2
    8020658e:	96aa                	add	a3,a3,a0
    80206590:	fff5071b          	addiw	a4,a0,-1
    80206594:	1702                	slli	a4,a4,0x20
    80206596:	9301                	srli	a4,a4,0x20
    80206598:	8e99                	sub	a3,a3,a4
        if (name[j] == '.') {
    8020659a:	02e00613          	li	a2,46
    8020659e:	89be                	mv	s3,a5
    802065a0:	0007c703          	lbu	a4,0(a5)
    802065a4:	00c70663          	beq	a4,a2,802065b0 <emake+0x16c>
    for (int j = strlen(name) - 1; j >= 0; j--) {
    802065a8:	17fd                	addi	a5,a5,-1
    802065aa:	fed79ae3          	bne	a5,a3,8020659e <emake+0x15a>
    char c, *p = name;
    802065ae:	89ea                	mv	s3,s10
        shortname[i++] = c;
    802065b0:	4481                	li	s1,0
        if (i == 8 && p) {
    802065b2:	4aa1                	li	s5,8
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    802065b4:	4ba9                	li	s7,10
        if (c >= 'a' && c <= 'z') {
    802065b6:	4c65                	li	s8,25
                memset(shortname + i, ' ', 8 - i);
    802065b8:	f6040793          	addi	a5,s0,-160
    802065bc:	f4f43823          	sd	a5,-176(s0)
    802065c0:	a8d9                	j	80206696 <emake+0x252>
    char c, *p = name;
    802065c2:	89ea                	mv	s3,s10
    802065c4:	b7f5                	j	802065b0 <emake+0x16c>
        if (i == 8 && p) {
    802065c6:	22098b63          	beqz	s3,802067fc <emake+0x3b8>
            if (p + 1 < name) { break; }            // no '.'
    802065ca:	0985                	addi	s3,s3,1
    802065cc:	0949fc63          	bgeu	s3,s4,80206664 <emake+0x220>
    802065d0:	f6040793          	addi	a5,s0,-160
    802065d4:	97a6                	add	a5,a5,s1
        shortname[i++] = ' ';
    802065d6:	02000693          	li	a3,32
    while (i < CHAR_SHORT_NAME) {
    802065da:	4729                	li	a4,10
        shortname[i++] = ' ';
    802065dc:	2485                	addiw	s1,s1,1
    802065de:	00d78023          	sb	a3,0(a5)
    while (i < CHAR_SHORT_NAME) {
    802065e2:	0785                	addi	a5,a5,1
    802065e4:	fe975ce3          	bge	a4,s1,802065dc <emake+0x198>
        de.lne.checksum = cal_checksum((uchar *)shortname);
    802065e8:	f6040513          	addi	a0,s0,-160
    802065ec:	00000097          	auipc	ra,0x0
    802065f0:	e2a080e7          	jalr	-470(ra) # 80206416 <cal_checksum>
    802065f4:	f6a40ea3          	sb	a0,-131(s0)
        de.lne.attr = ATTR_LONG_NAME;
    802065f8:	47bd                	li	a5,15
    802065fa:	f6f40da3          	sb	a5,-133(s0)
        for (int i = entcnt; i > 0; i--) {
    802065fe:	f4843783          	ld	a5,-184(s0)
    80206602:	14f05c63          	blez	a5,8020675a <emake+0x316>
    80206606:	f5842783          	lw	a5,-168(s0)
    8020660a:	37fd                	addiw	a5,a5,-1
    8020660c:	f4f42223          	sw	a5,-188(s0)
    80206610:	00179b9b          	slliw	s7,a5,0x1
    80206614:	00fb8bbb          	addw	s7,s7,a5
    80206618:	002b9b9b          	slliw	s7,s7,0x2
    8020661c:	00fb8bbb          	addw	s7,s7,a5
    80206620:	9bea                	add	s7,s7,s10
    80206622:	8aee                	mv	s5,s11
    80206624:	8c66                	mv	s8,s9
            int end = 0;
    80206626:	4981                	li	s3,0
            uint8 *w = (uint8 *)de.lne.name1;
    80206628:	f7140793          	addi	a5,s0,-143
    8020662c:	f4f43823          	sd	a5,-176(s0)
    80206630:	0ff00913          	li	s2,255
                    case 5:     w = (uint8 *)de.lne.name2; break;
    80206634:	f7e40793          	addi	a5,s0,-130
    80206638:	f4f43c23          	sd	a5,-168(s0)
                switch (j) {
    8020663c:	44ad                	li	s1,11
    8020663e:	f8c40a13          	addi	s4,s0,-116
    80206642:	a0c5                	j	80206722 <emake+0x2de>
            if (name > p) {                    // last '.'
    80206644:	0549f663          	bgeu	s3,s4,80206690 <emake+0x24c>
                memset(shortname + i, ' ', 8 - i);
    80206648:	47a1                	li	a5,8
    8020664a:	4097863b          	subw	a2,a5,s1
    8020664e:	02000593          	li	a1,32
    80206652:	f5043783          	ld	a5,-176(s0)
    80206656:	00978533          	add	a0,a5,s1
    8020665a:	ffffa097          	auipc	ra,0xffffa
    8020665e:	108080e7          	jalr	264(ra) # 80200762 <memset>
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80206662:	89d2                	mv	s3,s4
        shortname[i++] = c;
    80206664:	8a4e                	mv	s4,s3
    80206666:	84d6                	mv	s1,s5
    80206668:	4981                	li	s3,0
    8020666a:	a02d                	j	80206694 <emake+0x250>
            if (strchr(illegal, c) != NULL) {
    8020666c:	85ca                	mv	a1,s2
    8020666e:	00005517          	auipc	a0,0x5
    80206672:	64250513          	addi	a0,a0,1602 # 8020bcb0 <illegal.0>
    80206676:	ffffa097          	auipc	ra,0xffffa
    8020667a:	34a080e7          	jalr	842(ra) # 802009c0 <strchr>
    8020667e:	c119                	beqz	a0,80206684 <emake+0x240>
                c = '_';
    80206680:	05f00913          	li	s2,95
        shortname[i++] = c;
    80206684:	f9048793          	addi	a5,s1,-112
    80206688:	97a2                	add	a5,a5,s0
    8020668a:	fd278823          	sb	s2,-48(a5)
    8020668e:	2485                	addiw	s1,s1,1
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80206690:	f49bcce3          	blt	s7,s1,802065e8 <emake+0x1a4>
        shortname[i++] = c;
    80206694:	8952                	mv	s2,s4
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80206696:	00190a13          	addi	s4,s2,1
    8020669a:	00094903          	lbu	s2,0(s2)
    8020669e:	02090663          	beqz	s2,802066ca <emake+0x286>
        if (i == 8 && p) {
    802066a2:	f35482e3          	beq	s1,s5,802065c6 <emake+0x182>
        if (c == ' ') { continue; }
    802066a6:	02000793          	li	a5,32
    802066aa:	fef903e3          	beq	s2,a5,80206690 <emake+0x24c>
        if (c == '.') {
    802066ae:	02e00793          	li	a5,46
    802066b2:	f8f909e3          	beq	s2,a5,80206644 <emake+0x200>
        if (c >= 'a' && c <= 'z') {
    802066b6:	f9f9079b          	addiw	a5,s2,-97
    802066ba:	0ff7f793          	zext.b	a5,a5
    802066be:	fafc67e3          	bltu	s8,a5,8020666c <emake+0x228>
            c += 'A' - 'a';
    802066c2:	3901                	addiw	s2,s2,-32
    802066c4:	0ff97913          	zext.b	s2,s2
    802066c8:	bf75                	j	80206684 <emake+0x240>
    while (i < CHAR_SHORT_NAME) {
    802066ca:	47a9                	li	a5,10
    802066cc:	f097d2e3          	bge	a5,s1,802065d0 <emake+0x18c>
    802066d0:	bf21                	j	802065e8 <emake+0x1a4>
                de.lne.order |= LAST_LONG_ENTRY;
    802066d2:	0407e793          	ori	a5,a5,64
    802066d6:	f6f40823          	sb	a5,-144(s0)
    802066da:	a891                	j	8020672e <emake+0x2ea>
                    if ((*w++ = *p++) == 0) {
    802066dc:	00084603          	lbu	a2,0(a6)
                        end = 1;
    802066e0:	00163513          	seqz	a0,a2
                    *w++ = 0;
    802066e4:	00278893          	addi	a7,a5,2
                    if ((*w++ = *p++) == 0) {
    802066e8:	0805                	addi	a6,a6,1
                    *w++ = 0;
    802066ea:	85ce                	mv	a1,s3
    802066ec:	a8d5                	j	802067e0 <emake+0x39c>
            uint off2 = reloc_clus(dp, off, 1);
    802066ee:	4605                	li	a2,1
    802066f0:	85e2                	mv	a1,s8
    802066f2:	855a                	mv	a0,s6
    802066f4:	fffff097          	auipc	ra,0xfffff
    802066f8:	460080e7          	jalr	1120(ra) # 80205b54 <reloc_clus>
            rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off2, sizeof(de));
    802066fc:	02000793          	li	a5,32
    80206700:	0005071b          	sext.w	a4,a0
    80206704:	f7040693          	addi	a3,s0,-144
    80206708:	864e                	mv	a2,s3
    8020670a:	4585                	li	a1,1
    8020670c:	10cb2503          	lw	a0,268(s6)
    80206710:	fffff097          	auipc	ra,0xfffff
    80206714:	54c080e7          	jalr	1356(ra) # 80205c5c <rw_clus>
            off += sizeof(de);
    80206718:	020c0c1b          	addiw	s8,s8,32
        for (int i = entcnt; i > 0; i--) {
    8020671c:	1bcd                	addi	s7,s7,-13
    8020671e:	03505163          	blez	s5,80206740 <emake+0x2fc>
            if ((de.lne.order = i) == entcnt) {
    80206722:	0ffaf793          	zext.b	a5,s5
    80206726:	fafd86e3          	beq	s11,a5,802066d2 <emake+0x28e>
    8020672a:	f6f40823          	sb	a5,-144(s0)
            char *p = ep->filename + (i - 1) * CHAR_LONG_NAME;
    8020672e:	3afd                	addiw	s5,s5,-1
    80206730:	885e                	mv	a6,s7
    80206732:	4709                	li	a4,2
            int end = 0;
    80206734:	854e                	mv	a0,s3
            uint8 *w = (uint8 *)de.lne.name1;
    80206736:	f5043783          	ld	a5,-176(s0)
                switch (j) {
    8020673a:	4315                	li	t1,5
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    8020673c:	4e35                	li	t3,13
    8020673e:	a851                	j	802067d2 <emake+0x38e>
    80206740:	020c8c9b          	addiw	s9,s9,32
            off += sizeof(de);
    80206744:	4781                	li	a5,0
    80206746:	f4843703          	ld	a4,-184(s0)
    8020674a:	00e05663          	blez	a4,80206756 <emake+0x312>
    8020674e:	f4442783          	lw	a5,-188(s0)
    80206752:	0057979b          	slliw	a5,a5,0x5
    80206756:	01978cbb          	addw	s9,a5,s9
        memset(&de, 0, sizeof(de));
    8020675a:	02000613          	li	a2,32
    8020675e:	4581                	li	a1,0
    80206760:	f7040493          	addi	s1,s0,-144
    80206764:	8526                	mv	a0,s1
    80206766:	ffffa097          	auipc	ra,0xffffa
    8020676a:	ffc080e7          	jalr	-4(ra) # 80200762 <memset>
        strncpy(de.sne.name, shortname, sizeof(de.sne.name));
    8020676e:	462d                	li	a2,11
    80206770:	f6040593          	addi	a1,s0,-160
    80206774:	8526                	mv	a0,s1
    80206776:	ffffa097          	auipc	ra,0xffffa
    8020677a:	100080e7          	jalr	256(ra) # 80200876 <strncpy>
        de.sne.attr = ep->attribute;
    8020677e:	100d4783          	lbu	a5,256(s10)
    80206782:	f6f40da3          	sb	a5,-133(s0)
        de.sne.fst_clus_hi = (uint16)(ep->first_clus >> 16);      // first clus high 16 bits
    80206786:	104d2783          	lw	a5,260(s10)
    8020678a:	0107d71b          	srliw	a4,a5,0x10
    8020678e:	f8e41223          	sh	a4,-124(s0)
        de.sne.fst_clus_lo = (uint16)(ep->first_clus & 0xffff);     // low 16 bits
    80206792:	f8f41523          	sh	a5,-118(s0)
        de.sne.file_size = ep->file_size;                         // filesize is updated in eupdate()
    80206796:	108d2783          	lw	a5,264(s10)
    8020679a:	f8f42623          	sw	a5,-116(s0)
        off = reloc_clus(dp, off, 1);
    8020679e:	4605                	li	a2,1
    802067a0:	85e6                	mv	a1,s9
    802067a2:	855a                	mv	a0,s6
    802067a4:	fffff097          	auipc	ra,0xfffff
    802067a8:	3b0080e7          	jalr	944(ra) # 80205b54 <reloc_clus>
        rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    802067ac:	02000793          	li	a5,32
    802067b0:	0005071b          	sext.w	a4,a0
    802067b4:	86a6                	mv	a3,s1
    802067b6:	4601                	li	a2,0
    802067b8:	4585                	li	a1,1
    802067ba:	10cb2503          	lw	a0,268(s6)
    802067be:	fffff097          	auipc	ra,0xfffff
    802067c2:	49e080e7          	jalr	1182(ra) # 80205c5c <rw_clus>
}
    802067c6:	b325                	j	802064ee <emake+0xaa>
                    case 5:     w = (uint8 *)de.lne.name2; break;
    802067c8:	f5843783          	ld	a5,-168(s0)
    802067cc:	a011                	j	802067d0 <emake+0x38c>
                switch (j) {
    802067ce:	87d2                	mv	a5,s4
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    802067d0:	2705                	addiw	a4,a4,1
    802067d2:	fff7069b          	addiw	a3,a4,-1
                if (end) {
    802067d6:	d119                	beqz	a0,802066dc <emake+0x298>
                    *w++ = 0xff;
    802067d8:	00278893          	addi	a7,a5,2
    802067dc:	864a                	mv	a2,s2
    802067de:	85ca                	mv	a1,s2
                    *w++ = 0xff;            // on k210, unaligned reading is illegal
    802067e0:	00c78023          	sb	a2,0(a5)
                    *w++ = 0xff;
    802067e4:	00b780a3          	sb	a1,1(a5)
                switch (j) {
    802067e8:	fe6680e3          	beq	a3,t1,802067c8 <emake+0x384>
    802067ec:	fe9681e3          	beq	a3,s1,802067ce <emake+0x38a>
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    802067f0:	0007079b          	sext.w	a5,a4
    802067f4:	eefe4de3          	blt	t3,a5,802066ee <emake+0x2aa>
    802067f8:	87c6                	mv	a5,a7
    802067fa:	bfd9                	j	802067d0 <emake+0x38c>
        if (c == ' ') { continue; }
    802067fc:	02000793          	li	a5,32
    80206800:	e8f90ae3          	beq	s2,a5,80206694 <emake+0x250>
        if (c == '.') {
    80206804:	02e00793          	li	a5,46
    80206808:	eaf917e3          	bne	s2,a5,802066b6 <emake+0x272>
    8020680c:	bd35                	j	80206648 <emake+0x204>

000000008020680e <edup>:
{
    8020680e:	1101                	addi	sp,sp,-32
    80206810:	ec06                	sd	ra,24(sp)
    80206812:	e822                	sd	s0,16(sp)
    80206814:	e426                	sd	s1,8(sp)
    80206816:	1000                	addi	s0,sp,32
    80206818:	84aa                	mv	s1,a0
    if (entry != 0) {
    8020681a:	c515                	beqz	a0,80206846 <edup+0x38>
        acquire(&ecache.lock);
    8020681c:	00018517          	auipc	a0,0x18
    80206820:	d9c50513          	addi	a0,a0,-612 # 8021e5b8 <ecache>
    80206824:	ffffa097          	auipc	ra,0xffffa
    80206828:	ea2080e7          	jalr	-350(ra) # 802006c6 <acquire>
        entry->ref++;
    8020682c:	1184a783          	lw	a5,280(s1)
    80206830:	2785                	addiw	a5,a5,1
    80206832:	10f4ac23          	sw	a5,280(s1)
        release(&ecache.lock);
    80206836:	00018517          	auipc	a0,0x18
    8020683a:	d8250513          	addi	a0,a0,-638 # 8021e5b8 <ecache>
    8020683e:	ffffa097          	auipc	ra,0xffffa
    80206842:	edc080e7          	jalr	-292(ra) # 8020071a <release>
}
    80206846:	8526                	mv	a0,s1
    80206848:	60e2                	ld	ra,24(sp)
    8020684a:	6442                	ld	s0,16(sp)
    8020684c:	64a2                	ld	s1,8(sp)
    8020684e:	6105                	addi	sp,sp,32
    80206850:	8082                	ret

0000000080206852 <eupdate>:
    if (!entry->dirty || entry->valid != 1) { return; }
    80206852:	11554783          	lbu	a5,277(a0)
    80206856:	c3e5                	beqz	a5,80206936 <eupdate+0xe4>
{
    80206858:	711d                	addi	sp,sp,-96
    8020685a:	ec86                	sd	ra,88(sp)
    8020685c:	e8a2                	sd	s0,80(sp)
    8020685e:	e4a6                	sd	s1,72(sp)
    80206860:	e0ca                	sd	s2,64(sp)
    80206862:	fc4e                	sd	s3,56(sp)
    80206864:	1080                	addi	s0,sp,96
    80206866:	84aa                	mv	s1,a0
    if (!entry->dirty || entry->valid != 1) { return; }
    80206868:	11651703          	lh	a4,278(a0)
    8020686c:	4785                	li	a5,1
    8020686e:	00f70963          	beq	a4,a5,80206880 <eupdate+0x2e>
}
    80206872:	60e6                	ld	ra,88(sp)
    80206874:	6446                	ld	s0,80(sp)
    80206876:	64a6                	ld	s1,72(sp)
    80206878:	6906                	ld	s2,64(sp)
    8020687a:	79e2                	ld	s3,56(sp)
    8020687c:	6125                	addi	sp,sp,96
    8020687e:	8082                	ret
    uint entcnt = 0;
    80206880:	fc042623          	sw	zero,-52(s0)
    uint32 off = reloc_clus(entry->parent, entry->off, 0);
    80206884:	4601                	li	a2,0
    80206886:	11c52583          	lw	a1,284(a0)
    8020688a:	12053503          	ld	a0,288(a0)
    8020688e:	fffff097          	auipc	ra,0xfffff
    80206892:	2c6080e7          	jalr	710(ra) # 80205b54 <reloc_clus>
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64) &entcnt, off, 1);
    80206896:	1204b803          	ld	a6,288(s1)
    8020689a:	4785                	li	a5,1
    8020689c:	0005071b          	sext.w	a4,a0
    802068a0:	fcc40693          	addi	a3,s0,-52
    802068a4:	4601                	li	a2,0
    802068a6:	4581                	li	a1,0
    802068a8:	10c82503          	lw	a0,268(a6)
    802068ac:	fffff097          	auipc	ra,0xfffff
    802068b0:	3b0080e7          	jalr	944(ra) # 80205c5c <rw_clus>
    entcnt &= ~LAST_LONG_ENTRY;
    802068b4:	fcc42583          	lw	a1,-52(s0)
    802068b8:	fbf5f593          	andi	a1,a1,-65
    802068bc:	fcb42623          	sw	a1,-52(s0)
    off = reloc_clus(entry->parent, entry->off + (entcnt << 5), 0);
    802068c0:	0055959b          	slliw	a1,a1,0x5
    802068c4:	11c4a783          	lw	a5,284(s1)
    802068c8:	4601                	li	a2,0
    802068ca:	9dbd                	addw	a1,a1,a5
    802068cc:	1204b503          	ld	a0,288(s1)
    802068d0:	fffff097          	auipc	ra,0xfffff
    802068d4:	284080e7          	jalr	644(ra) # 80205b54 <reloc_clus>
    802068d8:	0005099b          	sext.w	s3,a0
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64)&de, off, sizeof(de));
    802068dc:	1204b503          	ld	a0,288(s1)
    802068e0:	02000793          	li	a5,32
    802068e4:	874e                	mv	a4,s3
    802068e6:	fa840913          	addi	s2,s0,-88
    802068ea:	86ca                	mv	a3,s2
    802068ec:	4601                	li	a2,0
    802068ee:	4581                	li	a1,0
    802068f0:	10c52503          	lw	a0,268(a0)
    802068f4:	fffff097          	auipc	ra,0xfffff
    802068f8:	368080e7          	jalr	872(ra) # 80205c5c <rw_clus>
    de.sne.fst_clus_hi = (uint16)(entry->first_clus >> 16);
    802068fc:	1044a783          	lw	a5,260(s1)
    80206900:	0107d71b          	srliw	a4,a5,0x10
    80206904:	fae41e23          	sh	a4,-68(s0)
    de.sne.fst_clus_lo = (uint16)(entry->first_clus & 0xffff);
    80206908:	fcf41123          	sh	a5,-62(s0)
    de.sne.file_size = entry->file_size;
    8020690c:	1084a783          	lw	a5,264(s1)
    80206910:	fcf42223          	sw	a5,-60(s0)
    rw_clus(entry->parent->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80206914:	1204b503          	ld	a0,288(s1)
    80206918:	02000793          	li	a5,32
    8020691c:	874e                	mv	a4,s3
    8020691e:	86ca                	mv	a3,s2
    80206920:	4601                	li	a2,0
    80206922:	4585                	li	a1,1
    80206924:	10c52503          	lw	a0,268(a0)
    80206928:	fffff097          	auipc	ra,0xfffff
    8020692c:	334080e7          	jalr	820(ra) # 80205c5c <rw_clus>
    entry->dirty = 0;
    80206930:	10048aa3          	sb	zero,277(s1)
    80206934:	bf3d                	j	80206872 <eupdate+0x20>
    80206936:	8082                	ret

0000000080206938 <eremove>:
    if (entry->valid != 1) { return; }
    80206938:	11651703          	lh	a4,278(a0)
    8020693c:	4785                	li	a5,1
    8020693e:	00f70363          	beq	a4,a5,80206944 <eremove+0xc>
    80206942:	8082                	ret
{
    80206944:	715d                	addi	sp,sp,-80
    80206946:	e486                	sd	ra,72(sp)
    80206948:	e0a2                	sd	s0,64(sp)
    8020694a:	fc26                	sd	s1,56(sp)
    8020694c:	f84a                	sd	s2,48(sp)
    8020694e:	f44e                	sd	s3,40(sp)
    80206950:	f052                	sd	s4,32(sp)
    80206952:	ec56                	sd	s5,24(sp)
    80206954:	0880                	addi	s0,sp,80
    80206956:	89aa                	mv	s3,a0
    uint entcnt = 0;
    80206958:	fa042e23          	sw	zero,-68(s0)
    uint32 off = entry->off;
    8020695c:	11c52a03          	lw	s4,284(a0)
    uint32 off2 = reloc_clus(entry->parent, off, 0);
    80206960:	4601                	li	a2,0
    80206962:	85d2                	mv	a1,s4
    80206964:	12053503          	ld	a0,288(a0)
    80206968:	fffff097          	auipc	ra,0xfffff
    8020696c:	1ec080e7          	jalr	492(ra) # 80205b54 <reloc_clus>
    80206970:	0005049b          	sext.w	s1,a0
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64) &entcnt, off2, 1);
    80206974:	1209b503          	ld	a0,288(s3)
    80206978:	4785                	li	a5,1
    8020697a:	8726                	mv	a4,s1
    8020697c:	fbc40693          	addi	a3,s0,-68
    80206980:	4601                	li	a2,0
    80206982:	4581                	li	a1,0
    80206984:	10c52503          	lw	a0,268(a0)
    80206988:	fffff097          	auipc	ra,0xfffff
    8020698c:	2d4080e7          	jalr	724(ra) # 80205c5c <rw_clus>
    entcnt &= ~LAST_LONG_ENTRY;
    80206990:	fbc42783          	lw	a5,-68(s0)
    80206994:	fbf7f793          	andi	a5,a5,-65
    80206998:	faf42e23          	sw	a5,-68(s0)
    uint8 flag = EMPTY_ENTRY;
    8020699c:	5795                	li	a5,-27
    8020699e:	faf40da3          	sb	a5,-69(s0)
    for (int i = 0; i <= entcnt; i++) {
    802069a2:	4901                	li	s2,0
        rw_clus(entry->parent->cur_clus, 1, 0, (uint64) &flag, off2, 1);
    802069a4:	fbb40a93          	addi	s5,s0,-69
    802069a8:	1209b503          	ld	a0,288(s3)
    802069ac:	4785                	li	a5,1
    802069ae:	8726                	mv	a4,s1
    802069b0:	86d6                	mv	a3,s5
    802069b2:	4601                	li	a2,0
    802069b4:	4585                	li	a1,1
    802069b6:	10c52503          	lw	a0,268(a0)
    802069ba:	fffff097          	auipc	ra,0xfffff
    802069be:	2a2080e7          	jalr	674(ra) # 80205c5c <rw_clus>
        off += 32;
    802069c2:	020a0a1b          	addiw	s4,s4,32
        off2 = reloc_clus(entry->parent, off, 0);
    802069c6:	4601                	li	a2,0
    802069c8:	85d2                	mv	a1,s4
    802069ca:	1209b503          	ld	a0,288(s3)
    802069ce:	fffff097          	auipc	ra,0xfffff
    802069d2:	186080e7          	jalr	390(ra) # 80205b54 <reloc_clus>
    802069d6:	0005049b          	sext.w	s1,a0
    for (int i = 0; i <= entcnt; i++) {
    802069da:	0019079b          	addiw	a5,s2,1
    802069de:	0007891b          	sext.w	s2,a5
    802069e2:	fbc42703          	lw	a4,-68(s0)
    802069e6:	fd2771e3          	bgeu	a4,s2,802069a8 <eremove+0x70>
    entry->valid = -1;
    802069ea:	57fd                	li	a5,-1
    802069ec:	10f99b23          	sh	a5,278(s3)
}
    802069f0:	60a6                	ld	ra,72(sp)
    802069f2:	6406                	ld	s0,64(sp)
    802069f4:	74e2                	ld	s1,56(sp)
    802069f6:	7942                	ld	s2,48(sp)
    802069f8:	79a2                	ld	s3,40(sp)
    802069fa:	7a02                	ld	s4,32(sp)
    802069fc:	6ae2                	ld	s5,24(sp)
    802069fe:	6161                	addi	sp,sp,80
    80206a00:	8082                	ret

0000000080206a02 <etrunc>:
{
    80206a02:	7179                	addi	sp,sp,-48
    80206a04:	f406                	sd	ra,40(sp)
    80206a06:	f022                	sd	s0,32(sp)
    80206a08:	ec26                	sd	s1,24(sp)
    80206a0a:	e84a                	sd	s2,16(sp)
    80206a0c:	e44e                	sd	s3,8(sp)
    80206a0e:	e052                	sd	s4,0(sp)
    80206a10:	1800                	addi	s0,sp,48
    80206a12:	8a2a                	mv	s4,a0
    for (uint32 clus = entry->first_clus; clus >= 2 && clus < FAT32_EOC; ) {
    80206a14:	10452483          	lw	s1,260(a0)
    80206a18:	ffe4871b          	addiw	a4,s1,-2
    80206a1c:	100007b7          	lui	a5,0x10000
    80206a20:	17d5                	addi	a5,a5,-11 # ffffff5 <_entry-0x7020000b>
    80206a22:	02e7e663          	bltu	a5,a4,80206a4e <etrunc+0x4c>
    80206a26:	89be                	mv	s3,a5
        uint32 next = read_fat(clus);
    80206a28:	0004891b          	sext.w	s2,s1
    80206a2c:	8526                	mv	a0,s1
    80206a2e:	fffff097          	auipc	ra,0xfffff
    80206a32:	eee080e7          	jalr	-274(ra) # 8020591c <read_fat>
    80206a36:	0005049b          	sext.w	s1,a0
    write_fat(cluster, 0);
    80206a3a:	4581                	li	a1,0
    80206a3c:	854a                	mv	a0,s2
    80206a3e:	fffff097          	auipc	ra,0xfffff
    80206a42:	096080e7          	jalr	150(ra) # 80205ad4 <write_fat>
    for (uint32 clus = entry->first_clus; clus >= 2 && clus < FAT32_EOC; ) {
    80206a46:	ffe4879b          	addiw	a5,s1,-2
    80206a4a:	fcf9ffe3          	bgeu	s3,a5,80206a28 <etrunc+0x26>
    entry->file_size = 0;
    80206a4e:	100a2423          	sw	zero,264(s4)
    entry->first_clus = 0;
    80206a52:	100a2223          	sw	zero,260(s4)
    entry->dirty = 1;
    80206a56:	4785                	li	a5,1
    80206a58:	10fa0aa3          	sb	a5,277(s4)
}
    80206a5c:	70a2                	ld	ra,40(sp)
    80206a5e:	7402                	ld	s0,32(sp)
    80206a60:	64e2                	ld	s1,24(sp)
    80206a62:	6942                	ld	s2,16(sp)
    80206a64:	69a2                	ld	s3,8(sp)
    80206a66:	6a02                	ld	s4,0(sp)
    80206a68:	6145                	addi	sp,sp,48
    80206a6a:	8082                	ret

0000000080206a6c <elock>:
{
    80206a6c:	1141                	addi	sp,sp,-16
    80206a6e:	e406                	sd	ra,8(sp)
    80206a70:	e022                	sd	s0,0(sp)
    80206a72:	0800                	addi	s0,sp,16
    if (entry == 0 || entry->ref < 1)
    80206a74:	cd19                	beqz	a0,80206a92 <elock+0x26>
    80206a76:	11852783          	lw	a5,280(a0)
    80206a7a:	00f05c63          	blez	a5,80206a92 <elock+0x26>
    acquiresleep(&entry->lock);
    80206a7e:	13850513          	addi	a0,a0,312
    80206a82:	ffffd097          	auipc	ra,0xffffd
    80206a86:	0ae080e7          	jalr	174(ra) # 80203b30 <acquiresleep>
}
    80206a8a:	60a2                	ld	ra,8(sp)
    80206a8c:	6402                	ld	s0,0(sp)
    80206a8e:	0141                	addi	sp,sp,16
    80206a90:	8082                	ret
        panic("elock");
    80206a92:	00003517          	auipc	a0,0x3
    80206a96:	3b650513          	addi	a0,a0,950 # 80209e48 <digits+0xac8>
    80206a9a:	ffff9097          	auipc	ra,0xffff9
    80206a9e:	6aa080e7          	jalr	1706(ra) # 80200144 <panic>

0000000080206aa2 <eunlock>:
{
    80206aa2:	1101                	addi	sp,sp,-32
    80206aa4:	ec06                	sd	ra,24(sp)
    80206aa6:	e822                	sd	s0,16(sp)
    80206aa8:	e426                	sd	s1,8(sp)
    80206aaa:	e04a                	sd	s2,0(sp)
    80206aac:	1000                	addi	s0,sp,32
    if (entry == 0 || !holdingsleep(&entry->lock) || entry->ref < 1)
    80206aae:	c90d                	beqz	a0,80206ae0 <eunlock+0x3e>
    80206ab0:	84aa                	mv	s1,a0
    80206ab2:	13850913          	addi	s2,a0,312
    80206ab6:	854a                	mv	a0,s2
    80206ab8:	ffffd097          	auipc	ra,0xffffd
    80206abc:	112080e7          	jalr	274(ra) # 80203bca <holdingsleep>
    80206ac0:	c105                	beqz	a0,80206ae0 <eunlock+0x3e>
    80206ac2:	1184a783          	lw	a5,280(s1)
    80206ac6:	00f05d63          	blez	a5,80206ae0 <eunlock+0x3e>
    releasesleep(&entry->lock);
    80206aca:	854a                	mv	a0,s2
    80206acc:	ffffd097          	auipc	ra,0xffffd
    80206ad0:	0ba080e7          	jalr	186(ra) # 80203b86 <releasesleep>
}
    80206ad4:	60e2                	ld	ra,24(sp)
    80206ad6:	6442                	ld	s0,16(sp)
    80206ad8:	64a2                	ld	s1,8(sp)
    80206ada:	6902                	ld	s2,0(sp)
    80206adc:	6105                	addi	sp,sp,32
    80206ade:	8082                	ret
        panic("eunlock");
    80206ae0:	00003517          	auipc	a0,0x3
    80206ae4:	37050513          	addi	a0,a0,880 # 80209e50 <digits+0xad0>
    80206ae8:	ffff9097          	auipc	ra,0xffff9
    80206aec:	65c080e7          	jalr	1628(ra) # 80200144 <panic>

0000000080206af0 <eput>:
{
    80206af0:	1101                	addi	sp,sp,-32
    80206af2:	ec06                	sd	ra,24(sp)
    80206af4:	e822                	sd	s0,16(sp)
    80206af6:	e426                	sd	s1,8(sp)
    80206af8:	e04a                	sd	s2,0(sp)
    80206afa:	1000                	addi	s0,sp,32
    80206afc:	84aa                	mv	s1,a0
    acquire(&ecache.lock);
    80206afe:	00018517          	auipc	a0,0x18
    80206b02:	aba50513          	addi	a0,a0,-1350 # 8021e5b8 <ecache>
    80206b06:	ffffa097          	auipc	ra,0xffffa
    80206b0a:	bc0080e7          	jalr	-1088(ra) # 802006c6 <acquire>
    if (entry != &root && entry->valid != 0 && entry->ref == 1) {
    80206b0e:	00018797          	auipc	a5,0x18
    80206b12:	94278793          	addi	a5,a5,-1726 # 8021e450 <root>
    80206b16:	00f48a63          	beq	s1,a5,80206b2a <eput+0x3a>
    80206b1a:	11649783          	lh	a5,278(s1)
    80206b1e:	c791                	beqz	a5,80206b2a <eput+0x3a>
    80206b20:	1184a703          	lw	a4,280(s1)
    80206b24:	4785                	li	a5,1
    80206b26:	02f70563          	beq	a4,a5,80206b50 <eput+0x60>
    entry->ref--;
    80206b2a:	1184a783          	lw	a5,280(s1)
    80206b2e:	37fd                	addiw	a5,a5,-1
    80206b30:	10f4ac23          	sw	a5,280(s1)
    release(&ecache.lock);
    80206b34:	00018517          	auipc	a0,0x18
    80206b38:	a8450513          	addi	a0,a0,-1404 # 8021e5b8 <ecache>
    80206b3c:	ffffa097          	auipc	ra,0xffffa
    80206b40:	bde080e7          	jalr	-1058(ra) # 8020071a <release>
}
    80206b44:	60e2                	ld	ra,24(sp)
    80206b46:	6442                	ld	s0,16(sp)
    80206b48:	64a2                	ld	s1,8(sp)
    80206b4a:	6902                	ld	s2,0(sp)
    80206b4c:	6105                	addi	sp,sp,32
    80206b4e:	8082                	ret
        acquiresleep(&entry->lock);
    80206b50:	13848913          	addi	s2,s1,312
    80206b54:	854a                	mv	a0,s2
    80206b56:	ffffd097          	auipc	ra,0xffffd
    80206b5a:	fda080e7          	jalr	-38(ra) # 80203b30 <acquiresleep>
        entry->next->prev = entry->prev;
    80206b5e:	1284b703          	ld	a4,296(s1)
    80206b62:	1304b783          	ld	a5,304(s1)
    80206b66:	12f73823          	sd	a5,304(a4)
        entry->prev->next = entry->next;
    80206b6a:	1284b703          	ld	a4,296(s1)
    80206b6e:	12e7b423          	sd	a4,296(a5)
        entry->next = root.next;
    80206b72:	00018797          	auipc	a5,0x18
    80206b76:	8b678793          	addi	a5,a5,-1866 # 8021e428 <fat>
    80206b7a:	1507b703          	ld	a4,336(a5)
    80206b7e:	12e4b423          	sd	a4,296(s1)
        entry->prev = &root;
    80206b82:	00018697          	auipc	a3,0x18
    80206b86:	8ce68693          	addi	a3,a3,-1842 # 8021e450 <root>
    80206b8a:	12d4b823          	sd	a3,304(s1)
        root.next->prev = entry;
    80206b8e:	12973823          	sd	s1,304(a4)
        root.next = entry;
    80206b92:	1497b823          	sd	s1,336(a5)
        release(&ecache.lock);
    80206b96:	00018517          	auipc	a0,0x18
    80206b9a:	a2250513          	addi	a0,a0,-1502 # 8021e5b8 <ecache>
    80206b9e:	ffffa097          	auipc	ra,0xffffa
    80206ba2:	b7c080e7          	jalr	-1156(ra) # 8020071a <release>
        if (entry->valid == -1) {       // this means some one has called eremove()
    80206ba6:	11649703          	lh	a4,278(s1)
    80206baa:	57fd                	li	a5,-1
    80206bac:	06f70863          	beq	a4,a5,80206c1c <eput+0x12c>
            elock(entry->parent);
    80206bb0:	1204b503          	ld	a0,288(s1)
    80206bb4:	00000097          	auipc	ra,0x0
    80206bb8:	eb8080e7          	jalr	-328(ra) # 80206a6c <elock>
            eupdate(entry);
    80206bbc:	8526                	mv	a0,s1
    80206bbe:	00000097          	auipc	ra,0x0
    80206bc2:	c94080e7          	jalr	-876(ra) # 80206852 <eupdate>
            eunlock(entry->parent);
    80206bc6:	1204b503          	ld	a0,288(s1)
    80206bca:	00000097          	auipc	ra,0x0
    80206bce:	ed8080e7          	jalr	-296(ra) # 80206aa2 <eunlock>
        releasesleep(&entry->lock);
    80206bd2:	854a                	mv	a0,s2
    80206bd4:	ffffd097          	auipc	ra,0xffffd
    80206bd8:	fb2080e7          	jalr	-78(ra) # 80203b86 <releasesleep>
        struct dirent *eparent = entry->parent;
    80206bdc:	1204b903          	ld	s2,288(s1)
        acquire(&ecache.lock);
    80206be0:	00018517          	auipc	a0,0x18
    80206be4:	9d850513          	addi	a0,a0,-1576 # 8021e5b8 <ecache>
    80206be8:	ffffa097          	auipc	ra,0xffffa
    80206bec:	ade080e7          	jalr	-1314(ra) # 802006c6 <acquire>
        entry->ref--;
    80206bf0:	1184a783          	lw	a5,280(s1)
    80206bf4:	37fd                	addiw	a5,a5,-1
    80206bf6:	10f4ac23          	sw	a5,280(s1)
        release(&ecache.lock);
    80206bfa:	00018517          	auipc	a0,0x18
    80206bfe:	9be50513          	addi	a0,a0,-1602 # 8021e5b8 <ecache>
    80206c02:	ffffa097          	auipc	ra,0xffffa
    80206c06:	b18080e7          	jalr	-1256(ra) # 8020071a <release>
        if (entry->ref == 0) {
    80206c0a:	1184a783          	lw	a5,280(s1)
    80206c0e:	fb9d                	bnez	a5,80206b44 <eput+0x54>
            eput(eparent);
    80206c10:	854a                	mv	a0,s2
    80206c12:	00000097          	auipc	ra,0x0
    80206c16:	ede080e7          	jalr	-290(ra) # 80206af0 <eput>
    80206c1a:	b72d                	j	80206b44 <eput+0x54>
            etrunc(entry);
    80206c1c:	8526                	mv	a0,s1
    80206c1e:	00000097          	auipc	ra,0x0
    80206c22:	de4080e7          	jalr	-540(ra) # 80206a02 <etrunc>
    80206c26:	b775                	j	80206bd2 <eput+0xe2>

0000000080206c28 <estat>:
{
    80206c28:	1101                	addi	sp,sp,-32
    80206c2a:	ec06                	sd	ra,24(sp)
    80206c2c:	e822                	sd	s0,16(sp)
    80206c2e:	e426                	sd	s1,8(sp)
    80206c30:	e04a                	sd	s2,0(sp)
    80206c32:	1000                	addi	s0,sp,32
    80206c34:	892a                	mv	s2,a0
    80206c36:	84ae                	mv	s1,a1
    strncpy(st->name, de->filename, STAT_MAX_NAME);
    80206c38:	02000613          	li	a2,32
    80206c3c:	85aa                	mv	a1,a0
    80206c3e:	8526                	mv	a0,s1
    80206c40:	ffffa097          	auipc	ra,0xffffa
    80206c44:	c36080e7          	jalr	-970(ra) # 80200876 <strncpy>
    st->type = (de->attribute & ATTR_DIRECTORY) ? T_DIR : T_FILE;
    80206c48:	10094783          	lbu	a5,256(s2)
    80206c4c:	8bc1                	andi	a5,a5,16
    80206c4e:	0017b793          	seqz	a5,a5
    80206c52:	0785                	addi	a5,a5,1
    80206c54:	02f49423          	sh	a5,40(s1)
    st->dev = de->dev;
    80206c58:	11494783          	lbu	a5,276(s2)
    80206c5c:	d0dc                	sw	a5,36(s1)
    st->size = de->file_size;
    80206c5e:	10896783          	lwu	a5,264(s2)
    80206c62:	f89c                	sd	a5,48(s1)
}
    80206c64:	60e2                	ld	ra,24(sp)
    80206c66:	6442                	ld	s0,16(sp)
    80206c68:	64a2                	ld	s1,8(sp)
    80206c6a:	6902                	ld	s2,0(sp)
    80206c6c:	6105                	addi	sp,sp,32
    80206c6e:	8082                	ret

0000000080206c70 <enext>:
{
    80206c70:	7119                	addi	sp,sp,-128
    80206c72:	fc86                	sd	ra,120(sp)
    80206c74:	f8a2                	sd	s0,112(sp)
    80206c76:	f4a6                	sd	s1,104(sp)
    80206c78:	f0ca                	sd	s2,96(sp)
    80206c7a:	ecce                	sd	s3,88(sp)
    80206c7c:	e8d2                	sd	s4,80(sp)
    80206c7e:	e4d6                	sd	s5,72(sp)
    80206c80:	e0da                	sd	s6,64(sp)
    80206c82:	fc5e                	sd	s7,56(sp)
    80206c84:	f862                	sd	s8,48(sp)
    80206c86:	f466                	sd	s9,40(sp)
    80206c88:	0100                	addi	s0,sp,128
    if (!(dp->attribute & ATTR_DIRECTORY))
    80206c8a:	10054783          	lbu	a5,256(a0)
    80206c8e:	8bc1                	andi	a5,a5,16
    80206c90:	cf95                	beqz	a5,80206ccc <enext+0x5c>
    80206c92:	892a                	mv	s2,a0
    80206c94:	89ae                	mv	s3,a1
    80206c96:	84b2                	mv	s1,a2
    80206c98:	8ab6                	mv	s5,a3
    if (ep->valid)
    80206c9a:	11659783          	lh	a5,278(a1)
    80206c9e:	ef9d                	bnez	a5,80206cdc <enext+0x6c>
    if (off % 32)
    80206ca0:	01f67793          	andi	a5,a2,31
    80206ca4:	e7a1                	bnez	a5,80206cec <enext+0x7c>
    if (dp->valid != 1) { return -1; }
    80206ca6:	11651703          	lh	a4,278(a0)
    80206caa:	4785                	li	a5,1
    80206cac:	557d                	li	a0,-1
    80206cae:	04f70763          	beq	a4,a5,80206cfc <enext+0x8c>
}
    80206cb2:	70e6                	ld	ra,120(sp)
    80206cb4:	7446                	ld	s0,112(sp)
    80206cb6:	74a6                	ld	s1,104(sp)
    80206cb8:	7906                	ld	s2,96(sp)
    80206cba:	69e6                	ld	s3,88(sp)
    80206cbc:	6a46                	ld	s4,80(sp)
    80206cbe:	6aa6                	ld	s5,72(sp)
    80206cc0:	6b06                	ld	s6,64(sp)
    80206cc2:	7be2                	ld	s7,56(sp)
    80206cc4:	7c42                	ld	s8,48(sp)
    80206cc6:	7ca2                	ld	s9,40(sp)
    80206cc8:	6109                	addi	sp,sp,128
    80206cca:	8082                	ret
        panic("enext not dir");
    80206ccc:	00003517          	auipc	a0,0x3
    80206cd0:	18c50513          	addi	a0,a0,396 # 80209e58 <digits+0xad8>
    80206cd4:	ffff9097          	auipc	ra,0xffff9
    80206cd8:	470080e7          	jalr	1136(ra) # 80200144 <panic>
        panic("enext ep valid");
    80206cdc:	00003517          	auipc	a0,0x3
    80206ce0:	18c50513          	addi	a0,a0,396 # 80209e68 <digits+0xae8>
    80206ce4:	ffff9097          	auipc	ra,0xffff9
    80206ce8:	460080e7          	jalr	1120(ra) # 80200144 <panic>
        panic("enext not align");
    80206cec:	00003517          	auipc	a0,0x3
    80206cf0:	18c50513          	addi	a0,a0,396 # 80209e78 <digits+0xaf8>
    80206cf4:	ffff9097          	auipc	ra,0xffff9
    80206cf8:	450080e7          	jalr	1104(ra) # 80200144 <panic>
    memset(ep->filename, 0, FAT32_MAX_FILENAME + 1);
    80206cfc:	10000613          	li	a2,256
    80206d00:	4581                	li	a1,0
    80206d02:	854e                	mv	a0,s3
    80206d04:	ffffa097          	auipc	ra,0xffffa
    80206d08:	a5e080e7          	jalr	-1442(ra) # 80200762 <memset>
    int cnt = 0;
    80206d0c:	4b01                	li	s6,0
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    80206d0e:	5bfd                	li	s7,-1
        if (rw_clus(dp->cur_clus, 0, 0, (uint64)&de, off2, 32) != 32 || de.lne.order == END_OF_ENTRY) {
    80206d10:	f8040a13          	addi	s4,s0,-128
        if (de.lne.order == EMPTY_ENTRY) {
    80206d14:	0e500c13          	li	s8,229
        if (de.lne.attr == ATTR_LONG_NAME) {
    80206d18:	4cbd                	li	s9,15
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    80206d1a:	a03d                	j	80206d48 <enext+0xd8>
            cnt++;
    80206d1c:	2b05                	addiw	s6,s6,1
            continue;
    80206d1e:	a01d                	j	80206d44 <enext+0xd4>
            *count = cnt;
    80206d20:	016aa023          	sw	s6,0(s5)
            return 0;
    80206d24:	4501                	li	a0,0
    80206d26:	b771                	j	80206cb2 <enext+0x42>
            read_entry_name(ep->filename + (lcnt - 1) * CHAR_LONG_NAME, &de);
    80206d28:	fff7079b          	addiw	a5,a4,-1
    80206d2c:	0017951b          	slliw	a0,a5,0x1
    80206d30:	9d3d                	addw	a0,a0,a5
    80206d32:	0025151b          	slliw	a0,a0,0x2
    80206d36:	9d3d                	addw	a0,a0,a5
    80206d38:	85d2                	mv	a1,s4
    80206d3a:	954e                	add	a0,a0,s3
    80206d3c:	fffff097          	auipc	ra,0xfffff
    80206d40:	17a080e7          	jalr	378(ra) # 80205eb6 <read_entry_name>
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    80206d44:	0204849b          	addiw	s1,s1,32
    80206d48:	4601                	li	a2,0
    80206d4a:	85a6                	mv	a1,s1
    80206d4c:	854a                	mv	a0,s2
    80206d4e:	fffff097          	auipc	ra,0xfffff
    80206d52:	e06080e7          	jalr	-506(ra) # 80205b54 <reloc_clus>
    80206d56:	f5750ee3          	beq	a0,s7,80206cb2 <enext+0x42>
        if (rw_clus(dp->cur_clus, 0, 0, (uint64)&de, off2, 32) != 32 || de.lne.order == END_OF_ENTRY) {
    80206d5a:	02000793          	li	a5,32
    80206d5e:	0005071b          	sext.w	a4,a0
    80206d62:	86d2                	mv	a3,s4
    80206d64:	4601                	li	a2,0
    80206d66:	4581                	li	a1,0
    80206d68:	10c92503          	lw	a0,268(s2)
    80206d6c:	fffff097          	auipc	ra,0xfffff
    80206d70:	ef0080e7          	jalr	-272(ra) # 80205c5c <rw_clus>
    80206d74:	2501                	sext.w	a0,a0
    80206d76:	02000793          	li	a5,32
    80206d7a:	06f51c63          	bne	a0,a5,80206df2 <enext+0x182>
    80206d7e:	f8044783          	lbu	a5,-128(s0)
    80206d82:	cbb5                	beqz	a5,80206df6 <enext+0x186>
        if (de.lne.order == EMPTY_ENTRY) {
    80206d84:	f9878ce3          	beq	a5,s8,80206d1c <enext+0xac>
        } else if (cnt) {
    80206d88:	f80b1ce3          	bnez	s6,80206d20 <enext+0xb0>
        if (de.lne.attr == ATTR_LONG_NAME) {
    80206d8c:	f8b44703          	lbu	a4,-117(s0)
    80206d90:	01971d63          	bne	a4,s9,80206daa <enext+0x13a>
            int lcnt = de.lne.order & ~LAST_LONG_ENTRY;
    80206d94:	0bf7f713          	andi	a4,a5,191
            if (de.lne.order & LAST_LONG_ENTRY) {
    80206d98:	0407f793          	andi	a5,a5,64
    80206d9c:	d7d1                	beqz	a5,80206d28 <enext+0xb8>
                *count = lcnt + 1;                              // plus the s-n-e;
    80206d9e:	0017079b          	addiw	a5,a4,1
    80206da2:	00faa023          	sw	a5,0(s5)
                count = 0;
    80206da6:	4a81                	li	s5,0
    80206da8:	b741                	j	80206d28 <enext+0xb8>
            if (count) {
    80206daa:	000a8c63          	beqz	s5,80206dc2 <enext+0x152>
                *count = 1;
    80206dae:	4785                	li	a5,1
    80206db0:	00faa023          	sw	a5,0(s5)
                read_entry_name(ep->filename, &de);
    80206db4:	f8040593          	addi	a1,s0,-128
    80206db8:	854e                	mv	a0,s3
    80206dba:	fffff097          	auipc	ra,0xfffff
    80206dbe:	0fc080e7          	jalr	252(ra) # 80205eb6 <read_entry_name>
    entry->attribute = d->sne.attr;
    80206dc2:	f8b44783          	lbu	a5,-117(s0)
    80206dc6:	10f98023          	sb	a5,256(s3)
    entry->first_clus = ((uint32)d->sne.fst_clus_hi << 16) | d->sne.fst_clus_lo;
    80206dca:	f9445783          	lhu	a5,-108(s0)
    80206dce:	0107979b          	slliw	a5,a5,0x10
    80206dd2:	f9a45703          	lhu	a4,-102(s0)
    80206dd6:	8fd9                	or	a5,a5,a4
    80206dd8:	2781                	sext.w	a5,a5
    80206dda:	10f9a223          	sw	a5,260(s3)
    entry->file_size = d->sne.file_size;
    80206dde:	f9c42703          	lw	a4,-100(s0)
    80206de2:	10e9a423          	sw	a4,264(s3)
    entry->cur_clus = entry->first_clus;
    80206de6:	10f9a623          	sw	a5,268(s3)
    entry->clus_cnt = 0;
    80206dea:	1009a823          	sw	zero,272(s3)
            return 1;
    80206dee:	4505                	li	a0,1
}
    80206df0:	b5c9                	j	80206cb2 <enext+0x42>
            return -1;
    80206df2:	557d                	li	a0,-1
    80206df4:	bd7d                	j	80206cb2 <enext+0x42>
    80206df6:	557d                	li	a0,-1
    80206df8:	bd6d                	j	80206cb2 <enext+0x42>

0000000080206dfa <dirlookup>:
{
    80206dfa:	711d                	addi	sp,sp,-96
    80206dfc:	ec86                	sd	ra,88(sp)
    80206dfe:	e8a2                	sd	s0,80(sp)
    80206e00:	e4a6                	sd	s1,72(sp)
    80206e02:	e0ca                	sd	s2,64(sp)
    80206e04:	fc4e                	sd	s3,56(sp)
    80206e06:	f852                	sd	s4,48(sp)
    80206e08:	f456                	sd	s5,40(sp)
    80206e0a:	f05a                	sd	s6,32(sp)
    80206e0c:	ec5e                	sd	s7,24(sp)
    80206e0e:	1080                	addi	s0,sp,96
    if (!(dp->attribute & ATTR_DIRECTORY))
    80206e10:	10054783          	lbu	a5,256(a0)
    80206e14:	8bc1                	andi	a5,a5,16
    80206e16:	cbb1                	beqz	a5,80206e6a <dirlookup+0x70>
    80206e18:	84aa                	mv	s1,a0
    80206e1a:	89ae                	mv	s3,a1
    80206e1c:	8ab2                	mv	s5,a2
    if (strncmp(filename, ".", FAT32_MAX_FILENAME) == 0) {
    80206e1e:	0ff00613          	li	a2,255
    80206e22:	00003597          	auipc	a1,0x3
    80206e26:	07e58593          	addi	a1,a1,126 # 80209ea0 <digits+0xb20>
    80206e2a:	854e                	mv	a0,s3
    80206e2c:	ffffa097          	auipc	ra,0xffffa
    80206e30:	a0e080e7          	jalr	-1522(ra) # 8020083a <strncmp>
    80206e34:	c139                	beqz	a0,80206e7a <dirlookup+0x80>
    } else if (strncmp(filename, "..", FAT32_MAX_FILENAME) == 0) {
    80206e36:	0ff00613          	li	a2,255
    80206e3a:	00003597          	auipc	a1,0x3
    80206e3e:	06e58593          	addi	a1,a1,110 # 80209ea8 <digits+0xb28>
    80206e42:	854e                	mv	a0,s3
    80206e44:	ffffa097          	auipc	ra,0xffffa
    80206e48:	9f6080e7          	jalr	-1546(ra) # 8020083a <strncmp>
    80206e4c:	e125                	bnez	a0,80206eac <dirlookup+0xb2>
        if (dp == &root) {
    80206e4e:	00017797          	auipc	a5,0x17
    80206e52:	60278793          	addi	a5,a5,1538 # 8021e450 <root>
    80206e56:	04f48463          	beq	s1,a5,80206e9e <dirlookup+0xa4>
        return edup(dp->parent);
    80206e5a:	1204b503          	ld	a0,288(s1)
    80206e5e:	00000097          	auipc	ra,0x0
    80206e62:	9b0080e7          	jalr	-1616(ra) # 8020680e <edup>
    80206e66:	892a                	mv	s2,a0
    80206e68:	a839                	j	80206e86 <dirlookup+0x8c>
        panic("dirlookup not DIR");
    80206e6a:	00003517          	auipc	a0,0x3
    80206e6e:	01e50513          	addi	a0,a0,30 # 80209e88 <digits+0xb08>
    80206e72:	ffff9097          	auipc	ra,0xffff9
    80206e76:	2d2080e7          	jalr	722(ra) # 80200144 <panic>
        return edup(dp);
    80206e7a:	8526                	mv	a0,s1
    80206e7c:	00000097          	auipc	ra,0x0
    80206e80:	992080e7          	jalr	-1646(ra) # 8020680e <edup>
    80206e84:	892a                	mv	s2,a0
}
    80206e86:	854a                	mv	a0,s2
    80206e88:	60e6                	ld	ra,88(sp)
    80206e8a:	6446                	ld	s0,80(sp)
    80206e8c:	64a6                	ld	s1,72(sp)
    80206e8e:	6906                	ld	s2,64(sp)
    80206e90:	79e2                	ld	s3,56(sp)
    80206e92:	7a42                	ld	s4,48(sp)
    80206e94:	7aa2                	ld	s5,40(sp)
    80206e96:	7b02                	ld	s6,32(sp)
    80206e98:	6be2                	ld	s7,24(sp)
    80206e9a:	6125                	addi	sp,sp,96
    80206e9c:	8082                	ret
            return edup(&root);
    80206e9e:	853e                	mv	a0,a5
    80206ea0:	00000097          	auipc	ra,0x0
    80206ea4:	96e080e7          	jalr	-1682(ra) # 8020680e <edup>
    80206ea8:	892a                	mv	s2,a0
    80206eaa:	bff1                	j	80206e86 <dirlookup+0x8c>
    if (dp->valid != 1) {
    80206eac:	11649703          	lh	a4,278(s1)
    80206eb0:	4785                	li	a5,1
        return NULL;
    80206eb2:	4901                	li	s2,0
    if (dp->valid != 1) {
    80206eb4:	fcf719e3          	bne	a4,a5,80206e86 <dirlookup+0x8c>
    struct dirent *ep = eget(dp, filename);
    80206eb8:	85ce                	mv	a1,s3
    80206eba:	8526                	mv	a0,s1
    80206ebc:	fffff097          	auipc	ra,0xfffff
    80206ec0:	eec080e7          	jalr	-276(ra) # 80205da8 <eget>
    80206ec4:	892a                	mv	s2,a0
    if (ep->valid == 1) { return ep; }                               // ecache hits
    80206ec6:	11651703          	lh	a4,278(a0)
    80206eca:	4785                	li	a5,1
    80206ecc:	faf70de3          	beq	a4,a5,80206e86 <dirlookup+0x8c>
    int len = strlen(filename);
    80206ed0:	854e                	mv	a0,s3
    80206ed2:	ffffa097          	auipc	ra,0xffffa
    80206ed6:	a14080e7          	jalr	-1516(ra) # 802008e6 <strlen>
    int count = 0;
    80206eda:	fa042623          	sw	zero,-84(s0)
    reloc_clus(dp, 0, 0);
    80206ede:	4601                	li	a2,0
    80206ee0:	4581                	li	a1,0
    80206ee2:	8526                	mv	a0,s1
    80206ee4:	fffff097          	auipc	ra,0xfffff
    80206ee8:	c70080e7          	jalr	-912(ra) # 80205b54 <reloc_clus>
    uint off = 0;
    80206eec:	4a01                	li	s4,0
    while ((type = enext(dp, ep, off, &count) != -1)) {
    80206eee:	fac40b93          	addi	s7,s0,-84
    80206ef2:	5b7d                	li	s6,-1
    80206ef4:	86de                	mv	a3,s7
    80206ef6:	8652                	mv	a2,s4
    80206ef8:	85ca                	mv	a1,s2
    80206efa:	8526                	mv	a0,s1
    80206efc:	00000097          	auipc	ra,0x0
    80206f00:	d74080e7          	jalr	-652(ra) # 80206c70 <enext>
    80206f04:	03650f63          	beq	a0,s6,80206f42 <dirlookup+0x148>
        } else if (strncmp(filename, ep->filename, FAT32_MAX_FILENAME) == 0) {
    80206f08:	0ff00613          	li	a2,255
    80206f0c:	85ca                	mv	a1,s2
    80206f0e:	854e                	mv	a0,s3
    80206f10:	ffffa097          	auipc	ra,0xffffa
    80206f14:	92a080e7          	jalr	-1750(ra) # 8020083a <strncmp>
    80206f18:	c901                	beqz	a0,80206f28 <dirlookup+0x12e>
        off += count << 5;
    80206f1a:	fac42783          	lw	a5,-84(s0)
    80206f1e:	0057979b          	slliw	a5,a5,0x5
    80206f22:	01478a3b          	addw	s4,a5,s4
    80206f26:	b7f9                	j	80206ef4 <dirlookup+0xfa>
            ep->parent = edup(dp);
    80206f28:	8526                	mv	a0,s1
    80206f2a:	00000097          	auipc	ra,0x0
    80206f2e:	8e4080e7          	jalr	-1820(ra) # 8020680e <edup>
    80206f32:	12a93023          	sd	a0,288(s2)
            ep->off = off;
    80206f36:	11492e23          	sw	s4,284(s2)
            ep->valid = 1;
    80206f3a:	4785                	li	a5,1
    80206f3c:	10f91b23          	sh	a5,278(s2)
            return ep;
    80206f40:	b799                	j	80206e86 <dirlookup+0x8c>
    if (poff) {
    80206f42:	000a8463          	beqz	s5,80206f4a <dirlookup+0x150>
        *poff = off;
    80206f46:	014aa023          	sw	s4,0(s5)
    eput(ep);
    80206f4a:	854a                	mv	a0,s2
    80206f4c:	00000097          	auipc	ra,0x0
    80206f50:	ba4080e7          	jalr	-1116(ra) # 80206af0 <eput>
    return NULL;
    80206f54:	4901                	li	s2,0
    80206f56:	bf05                	j	80206e86 <dirlookup+0x8c>

0000000080206f58 <ealloc>:
{
    80206f58:	715d                	addi	sp,sp,-80
    80206f5a:	e486                	sd	ra,72(sp)
    80206f5c:	e0a2                	sd	s0,64(sp)
    80206f5e:	fc26                	sd	s1,56(sp)
    80206f60:	f84a                	sd	s2,48(sp)
    80206f62:	f44e                	sd	s3,40(sp)
    80206f64:	f052                	sd	s4,32(sp)
    80206f66:	ec56                	sd	s5,24(sp)
    80206f68:	0880                	addi	s0,sp,80
    80206f6a:	892a                	mv	s2,a0
    if (!(dp->attribute & ATTR_DIRECTORY)) {
    80206f6c:	10054783          	lbu	a5,256(a0)
    80206f70:	8bc1                	andi	a5,a5,16
    80206f72:	c7b1                	beqz	a5,80206fbe <ealloc+0x66>
    80206f74:	852e                	mv	a0,a1
    80206f76:	8a32                	mv	s4,a2
    if (dp->valid != 1 || !(name = formatname(name))) {        // detect illegal character
    80206f78:	11691703          	lh	a4,278(s2)
    80206f7c:	4785                	li	a5,1
        return NULL;
    80206f7e:	4481                	li	s1,0
    if (dp->valid != 1 || !(name = formatname(name))) {        // detect illegal character
    80206f80:	02f71563          	bne	a4,a5,80206faa <ealloc+0x52>
    80206f84:	fffff097          	auipc	ra,0xfffff
    80206f88:	408080e7          	jalr	1032(ra) # 8020638c <formatname>
    80206f8c:	89aa                	mv	s3,a0
    80206f8e:	10050663          	beqz	a0,8020709a <ealloc+0x142>
    uint off = 0;
    80206f92:	fa042e23          	sw	zero,-68(s0)
    if ((ep = dirlookup(dp, name, &off)) != 0) {      // entry exists
    80206f96:	fbc40613          	addi	a2,s0,-68
    80206f9a:	85aa                	mv	a1,a0
    80206f9c:	854a                	mv	a0,s2
    80206f9e:	00000097          	auipc	ra,0x0
    80206fa2:	e5c080e7          	jalr	-420(ra) # 80206dfa <dirlookup>
    80206fa6:	84aa                	mv	s1,a0
    80206fa8:	c11d                	beqz	a0,80206fce <ealloc+0x76>
}
    80206faa:	8526                	mv	a0,s1
    80206fac:	60a6                	ld	ra,72(sp)
    80206fae:	6406                	ld	s0,64(sp)
    80206fb0:	74e2                	ld	s1,56(sp)
    80206fb2:	7942                	ld	s2,48(sp)
    80206fb4:	79a2                	ld	s3,40(sp)
    80206fb6:	7a02                	ld	s4,32(sp)
    80206fb8:	6ae2                	ld	s5,24(sp)
    80206fba:	6161                	addi	sp,sp,80
    80206fbc:	8082                	ret
        panic("ealloc not dir");
    80206fbe:	00003517          	auipc	a0,0x3
    80206fc2:	ef250513          	addi	a0,a0,-270 # 80209eb0 <digits+0xb30>
    80206fc6:	ffff9097          	auipc	ra,0xffff9
    80206fca:	17e080e7          	jalr	382(ra) # 80200144 <panic>
    ep = eget(dp, name);
    80206fce:	85ce                	mv	a1,s3
    80206fd0:	854a                	mv	a0,s2
    80206fd2:	fffff097          	auipc	ra,0xfffff
    80206fd6:	dd6080e7          	jalr	-554(ra) # 80205da8 <eget>
    80206fda:	84aa                	mv	s1,a0
    elock(ep);
    80206fdc:	00000097          	auipc	ra,0x0
    80206fe0:	a90080e7          	jalr	-1392(ra) # 80206a6c <elock>
    ep->attribute = attr;
    80206fe4:	11448023          	sb	s4,256(s1)
    ep->file_size = 0;
    80206fe8:	1004a423          	sw	zero,264(s1)
    ep->first_clus = 0;
    80206fec:	1004a223          	sw	zero,260(s1)
    ep->parent = edup(dp);
    80206ff0:	854a                	mv	a0,s2
    80206ff2:	00000097          	auipc	ra,0x0
    80206ff6:	81c080e7          	jalr	-2020(ra) # 8020680e <edup>
    80206ffa:	12a4b023          	sd	a0,288(s1)
    ep->off = off;
    80206ffe:	fbc42a83          	lw	s5,-68(s0)
    80207002:	1154ae23          	sw	s5,284(s1)
    ep->clus_cnt = 0;
    80207006:	1004a823          	sw	zero,272(s1)
    ep->cur_clus = 0;
    8020700a:	1004a623          	sw	zero,268(s1)
    ep->dirty = 0;
    8020700e:	10048aa3          	sb	zero,277(s1)
    strncpy(ep->filename, name, FAT32_MAX_FILENAME);
    80207012:	0ff00613          	li	a2,255
    80207016:	85ce                	mv	a1,s3
    80207018:	8526                	mv	a0,s1
    8020701a:	ffffa097          	auipc	ra,0xffffa
    8020701e:	85c080e7          	jalr	-1956(ra) # 80200876 <strncpy>
    ep->filename[FAT32_MAX_FILENAME] = '\0';
    80207022:	0e048fa3          	sb	zero,255(s1)
    if (attr == ATTR_DIRECTORY) {    // generate "." and ".." for ep
    80207026:	47c1                	li	a5,16
    80207028:	02fa0863          	beq	s4,a5,80207058 <ealloc+0x100>
        ep->attribute |= ATTR_ARCHIVE;
    8020702c:	1004c783          	lbu	a5,256(s1)
    80207030:	0207e793          	ori	a5,a5,32
    80207034:	10f48023          	sb	a5,256(s1)
    emake(dp, ep, off);
    80207038:	8656                	mv	a2,s5
    8020703a:	85a6                	mv	a1,s1
    8020703c:	854a                	mv	a0,s2
    8020703e:	fffff097          	auipc	ra,0xfffff
    80207042:	406080e7          	jalr	1030(ra) # 80206444 <emake>
    ep->valid = 1;
    80207046:	4785                	li	a5,1
    80207048:	10f49b23          	sh	a5,278(s1)
    eunlock(ep);
    8020704c:	8526                	mv	a0,s1
    8020704e:	00000097          	auipc	ra,0x0
    80207052:	a54080e7          	jalr	-1452(ra) # 80206aa2 <eunlock>
    return ep;
    80207056:	bf91                	j	80206faa <ealloc+0x52>
        ep->attribute |= ATTR_DIRECTORY;
    80207058:	1004c783          	lbu	a5,256(s1)
    8020705c:	0107e793          	ori	a5,a5,16
    80207060:	10f48023          	sb	a5,256(s1)
        ep->cur_clus = ep->first_clus = alloc_clus(dp->dev);
    80207064:	11494503          	lbu	a0,276(s2)
    80207068:	fffff097          	auipc	ra,0xfffff
    8020706c:	92a080e7          	jalr	-1750(ra) # 80205992 <alloc_clus>
    80207070:	2501                	sext.w	a0,a0
    80207072:	10a4a223          	sw	a0,260(s1)
    80207076:	10a4a623          	sw	a0,268(s1)
        emake(ep, ep, 0);
    8020707a:	4601                	li	a2,0
    8020707c:	85a6                	mv	a1,s1
    8020707e:	8526                	mv	a0,s1
    80207080:	fffff097          	auipc	ra,0xfffff
    80207084:	3c4080e7          	jalr	964(ra) # 80206444 <emake>
        emake(ep, dp, 32);
    80207088:	02000613          	li	a2,32
    8020708c:	85ca                	mv	a1,s2
    8020708e:	8526                	mv	a0,s1
    80207090:	fffff097          	auipc	ra,0xfffff
    80207094:	3b4080e7          	jalr	948(ra) # 80206444 <emake>
    80207098:	b745                	j	80207038 <ealloc+0xe0>
        return NULL;
    8020709a:	84aa                	mv	s1,a0
    8020709c:	b739                	j	80206faa <ealloc+0x52>

000000008020709e <lookup_path>:
}


// FAT32 version of namex in xv6's original file system.
static struct dirent *lookup_path(char *path, int parent, char *name)
{
    8020709e:	7139                	addi	sp,sp,-64
    802070a0:	fc06                	sd	ra,56(sp)
    802070a2:	f822                	sd	s0,48(sp)
    802070a4:	f426                	sd	s1,40(sp)
    802070a6:	f04a                	sd	s2,32(sp)
    802070a8:	ec4e                	sd	s3,24(sp)
    802070aa:	e852                	sd	s4,16(sp)
    802070ac:	e456                	sd	s5,8(sp)
    802070ae:	0080                	addi	s0,sp,64
    802070b0:	892a                	mv	s2,a0
    802070b2:	8aae                	mv	s5,a1
    802070b4:	8a32                	mv	s4,a2
    struct dirent *entry, *next;
    if (*path == '/') {
    802070b6:	00054783          	lbu	a5,0(a0)
    802070ba:	02f00713          	li	a4,47
    802070be:	02e78063          	beq	a5,a4,802070de <lookup_path+0x40>
        entry = edup(&root);
    } else if (*path != '\0') {
        entry = edup(myproc()->cwd);
    } else {
        return NULL;
    802070c2:	4481                	li	s1,0
    } else if (*path != '\0') {
    802070c4:	c3b1                	beqz	a5,80207108 <lookup_path+0x6a>
        entry = edup(myproc()->cwd);
    802070c6:	ffffb097          	auipc	ra,0xffffb
    802070ca:	976080e7          	jalr	-1674(ra) # 80201a3c <myproc>
    802070ce:	15853503          	ld	a0,344(a0)
    802070d2:	fffff097          	auipc	ra,0xfffff
    802070d6:	73c080e7          	jalr	1852(ra) # 8020680e <edup>
    802070da:	84aa                	mv	s1,a0
    802070dc:	a0a5                	j	80207144 <lookup_path+0xa6>
        entry = edup(&root);
    802070de:	00017517          	auipc	a0,0x17
    802070e2:	37250513          	addi	a0,a0,882 # 8021e450 <root>
    802070e6:	fffff097          	auipc	ra,0xfffff
    802070ea:	728080e7          	jalr	1832(ra) # 8020680e <edup>
    802070ee:	84aa                	mv	s1,a0
    802070f0:	a891                	j	80207144 <lookup_path+0xa6>
    }
    while ((path = skipelem(path, name)) != 0) {
        elock(entry);
        if (!(entry->attribute & ATTR_DIRECTORY)) {
            eunlock(entry);
    802070f2:	8526                	mv	a0,s1
    802070f4:	00000097          	auipc	ra,0x0
    802070f8:	9ae080e7          	jalr	-1618(ra) # 80206aa2 <eunlock>
            eput(entry);
    802070fc:	8526                	mv	a0,s1
    802070fe:	00000097          	auipc	ra,0x0
    80207102:	9f2080e7          	jalr	-1550(ra) # 80206af0 <eput>
            return NULL;
    80207106:	4481                	li	s1,0
    if (parent) {
        eput(entry);
        return NULL;
    }
    return entry;
}
    80207108:	8526                	mv	a0,s1
    8020710a:	70e2                	ld	ra,56(sp)
    8020710c:	7442                	ld	s0,48(sp)
    8020710e:	74a2                	ld	s1,40(sp)
    80207110:	7902                	ld	s2,32(sp)
    80207112:	69e2                	ld	s3,24(sp)
    80207114:	6a42                	ld	s4,16(sp)
    80207116:	6aa2                	ld	s5,8(sp)
    80207118:	6121                	addi	sp,sp,64
    8020711a:	8082                	ret
        if ((next = dirlookup(entry, name, 0)) == 0) {
    8020711c:	4601                	li	a2,0
    8020711e:	85d2                	mv	a1,s4
    80207120:	8526                	mv	a0,s1
    80207122:	00000097          	auipc	ra,0x0
    80207126:	cd8080e7          	jalr	-808(ra) # 80206dfa <dirlookup>
    8020712a:	89aa                	mv	s3,a0
    8020712c:	c921                	beqz	a0,8020717c <lookup_path+0xde>
        eunlock(entry);
    8020712e:	8526                	mv	a0,s1
    80207130:	00000097          	auipc	ra,0x0
    80207134:	972080e7          	jalr	-1678(ra) # 80206aa2 <eunlock>
        eput(entry);
    80207138:	8526                	mv	a0,s1
    8020713a:	00000097          	auipc	ra,0x0
    8020713e:	9b6080e7          	jalr	-1610(ra) # 80206af0 <eput>
        entry = next;
    80207142:	84ce                	mv	s1,s3
    while ((path = skipelem(path, name)) != 0) {
    80207144:	85d2                	mv	a1,s4
    80207146:	854a                	mv	a0,s2
    80207148:	ffffe097          	auipc	ra,0xffffe
    8020714c:	746080e7          	jalr	1862(ra) # 8020588e <skipelem>
    80207150:	892a                	mv	s2,a0
    80207152:	c129                	beqz	a0,80207194 <lookup_path+0xf6>
        elock(entry);
    80207154:	8526                	mv	a0,s1
    80207156:	00000097          	auipc	ra,0x0
    8020715a:	916080e7          	jalr	-1770(ra) # 80206a6c <elock>
        if (!(entry->attribute & ATTR_DIRECTORY)) {
    8020715e:	1004c783          	lbu	a5,256(s1)
    80207162:	8bc1                	andi	a5,a5,16
    80207164:	d7d9                	beqz	a5,802070f2 <lookup_path+0x54>
        if (parent && *path == '\0') {
    80207166:	fa0a8be3          	beqz	s5,8020711c <lookup_path+0x7e>
    8020716a:	00094783          	lbu	a5,0(s2)
    8020716e:	f7dd                	bnez	a5,8020711c <lookup_path+0x7e>
            eunlock(entry);
    80207170:	8526                	mv	a0,s1
    80207172:	00000097          	auipc	ra,0x0
    80207176:	930080e7          	jalr	-1744(ra) # 80206aa2 <eunlock>
            return entry;
    8020717a:	b779                	j	80207108 <lookup_path+0x6a>
            eunlock(entry);
    8020717c:	8526                	mv	a0,s1
    8020717e:	00000097          	auipc	ra,0x0
    80207182:	924080e7          	jalr	-1756(ra) # 80206aa2 <eunlock>
            eput(entry);
    80207186:	8526                	mv	a0,s1
    80207188:	00000097          	auipc	ra,0x0
    8020718c:	968080e7          	jalr	-1688(ra) # 80206af0 <eput>
            return NULL;
    80207190:	84ce                	mv	s1,s3
    80207192:	bf9d                	j	80207108 <lookup_path+0x6a>
    if (parent) {
    80207194:	f60a8ae3          	beqz	s5,80207108 <lookup_path+0x6a>
        eput(entry);
    80207198:	8526                	mv	a0,s1
    8020719a:	00000097          	auipc	ra,0x0
    8020719e:	956080e7          	jalr	-1706(ra) # 80206af0 <eput>
        return NULL;
    802071a2:	84ca                	mv	s1,s2
    802071a4:	b795                	j	80207108 <lookup_path+0x6a>

00000000802071a6 <ename>:

struct dirent *ename(char *path)
{
    802071a6:	716d                	addi	sp,sp,-272
    802071a8:	e606                	sd	ra,264(sp)
    802071aa:	e222                	sd	s0,256(sp)
    802071ac:	0a00                	addi	s0,sp,272
    char name[FAT32_MAX_FILENAME + 1];
    return lookup_path(path, 0, name);
    802071ae:	ef040613          	addi	a2,s0,-272
    802071b2:	4581                	li	a1,0
    802071b4:	00000097          	auipc	ra,0x0
    802071b8:	eea080e7          	jalr	-278(ra) # 8020709e <lookup_path>
}
    802071bc:	60b2                	ld	ra,264(sp)
    802071be:	6412                	ld	s0,256(sp)
    802071c0:	6151                	addi	sp,sp,272
    802071c2:	8082                	ret

00000000802071c4 <ename_env>:
struct dirent *ename_env(struct dirent* env,char* path)
{
    802071c4:	7169                	addi	sp,sp,-304
    802071c6:	f606                	sd	ra,296(sp)
    802071c8:	f222                	sd	s0,288(sp)
    802071ca:	ee26                	sd	s1,280(sp)
    802071cc:	ea4a                	sd	s2,272(sp)
    802071ce:	e64e                	sd	s3,264(sp)
    802071d0:	e252                	sd	s4,256(sp)
    802071d2:	1a00                	addi	s0,sp,304
    802071d4:	892e                	mv	s2,a1
    entry = edup(env);
    802071d6:	fffff097          	auipc	ra,0xfffff
    802071da:	638080e7          	jalr	1592(ra) # 8020680e <edup>
    802071de:	84aa                	mv	s1,a0
    while ((path = skipelem(path, name)) != 0) {
    802071e0:	ed040a13          	addi	s4,s0,-304
    802071e4:	a081                	j	80207224 <ename_env+0x60>
            eunlock(entry);
    802071e6:	8526                	mv	a0,s1
    802071e8:	00000097          	auipc	ra,0x0
    802071ec:	8ba080e7          	jalr	-1862(ra) # 80206aa2 <eunlock>
            eput(entry);
    802071f0:	8526                	mv	a0,s1
    802071f2:	00000097          	auipc	ra,0x0
    802071f6:	8fe080e7          	jalr	-1794(ra) # 80206af0 <eput>
            return NULL;
    802071fa:	4481                	li	s1,0
    char name[FAT32_MAX_FILENAME + 1];
    return abs_lookup_path(env, path, 0, name); 
}
    802071fc:	8526                	mv	a0,s1
    802071fe:	70b2                	ld	ra,296(sp)
    80207200:	7412                	ld	s0,288(sp)
    80207202:	64f2                	ld	s1,280(sp)
    80207204:	6952                	ld	s2,272(sp)
    80207206:	69b2                	ld	s3,264(sp)
    80207208:	6a12                	ld	s4,256(sp)
    8020720a:	6155                	addi	sp,sp,304
    8020720c:	8082                	ret
        eunlock(entry);
    8020720e:	8526                	mv	a0,s1
    80207210:	00000097          	auipc	ra,0x0
    80207214:	892080e7          	jalr	-1902(ra) # 80206aa2 <eunlock>
        eput(entry);
    80207218:	8526                	mv	a0,s1
    8020721a:	00000097          	auipc	ra,0x0
    8020721e:	8d6080e7          	jalr	-1834(ra) # 80206af0 <eput>
        entry = next;
    80207222:	84ce                	mv	s1,s3
    while ((path = skipelem(path, name)) != 0) {
    80207224:	85d2                	mv	a1,s4
    80207226:	854a                	mv	a0,s2
    80207228:	ffffe097          	auipc	ra,0xffffe
    8020722c:	666080e7          	jalr	1638(ra) # 8020588e <skipelem>
    80207230:	892a                	mv	s2,a0
    80207232:	d569                	beqz	a0,802071fc <ename_env+0x38>
        elock(entry);
    80207234:	8526                	mv	a0,s1
    80207236:	00000097          	auipc	ra,0x0
    8020723a:	836080e7          	jalr	-1994(ra) # 80206a6c <elock>
        if (!(entry->attribute & ATTR_DIRECTORY)) {
    8020723e:	1004c783          	lbu	a5,256(s1)
    80207242:	8bc1                	andi	a5,a5,16
    80207244:	d3cd                	beqz	a5,802071e6 <ename_env+0x22>
        if ((next = dirlookup(entry, name, 0)) == 0) {
    80207246:	4601                	li	a2,0
    80207248:	85d2                	mv	a1,s4
    8020724a:	8526                	mv	a0,s1
    8020724c:	00000097          	auipc	ra,0x0
    80207250:	bae080e7          	jalr	-1106(ra) # 80206dfa <dirlookup>
    80207254:	89aa                	mv	s3,a0
    80207256:	fd45                	bnez	a0,8020720e <ename_env+0x4a>
            eunlock(entry);
    80207258:	8526                	mv	a0,s1
    8020725a:	00000097          	auipc	ra,0x0
    8020725e:	848080e7          	jalr	-1976(ra) # 80206aa2 <eunlock>
            eput(entry);
    80207262:	8526                	mv	a0,s1
    80207264:	00000097          	auipc	ra,0x0
    80207268:	88c080e7          	jalr	-1908(ra) # 80206af0 <eput>
            return NULL;
    8020726c:	84ce                	mv	s1,s3
    8020726e:	b779                	j	802071fc <ename_env+0x38>

0000000080207270 <enameparent>:

struct dirent *enameparent(char *path, char *name)
{
    80207270:	1141                	addi	sp,sp,-16
    80207272:	e406                	sd	ra,8(sp)
    80207274:	e022                	sd	s0,0(sp)
    80207276:	0800                	addi	s0,sp,16
    80207278:	862e                	mv	a2,a1
    return lookup_path(path, 1, name);
    8020727a:	4585                	li	a1,1
    8020727c:	00000097          	auipc	ra,0x0
    80207280:	e22080e7          	jalr	-478(ra) # 8020709e <lookup_path>
}
    80207284:	60a2                	ld	ra,8(sp)
    80207286:	6402                	ld	s0,0(sp)
    80207288:	0141                	addi	sp,sp,16
    8020728a:	8082                	ret

000000008020728c <plicinit>:

//
// the riscv Platform Level Interrupt Controller (PLIC).
//

void plicinit(void) {
    8020728c:	1141                	addi	sp,sp,-16
    8020728e:	e422                	sd	s0,8(sp)
    80207290:	0800                	addi	s0,sp,16
	writed(1, PLIC_V + DISK_IRQ * sizeof(uint32));
    80207292:	00fc37b7          	lui	a5,0xfc3
    80207296:	07ba                	slli	a5,a5,0xe
    80207298:	4705                	li	a4,1
    8020729a:	c3d8                	sw	a4,4(a5)
	writed(1, PLIC_V + UART_IRQ * sizeof(uint32));
    8020729c:	d798                	sw	a4,40(a5)

	#ifdef DEBUG 
	printf("plicinit\n");
	#endif 
}
    8020729e:	6422                	ld	s0,8(sp)
    802072a0:	0141                	addi	sp,sp,16
    802072a2:	8082                	ret

00000000802072a4 <plicinithart>:

void
plicinithart(void)
{
    802072a4:	1141                	addi	sp,sp,-16
    802072a6:	e406                	sd	ra,8(sp)
    802072a8:	e022                	sd	s0,0(sp)
    802072aa:	0800                	addi	s0,sp,16
  int hart = cpuid();
    802072ac:	ffffa097          	auipc	ra,0xffffa
    802072b0:	764080e7          	jalr	1892(ra) # 80201a10 <cpuid>
  #ifdef QEMU
  // set uart's enable bit for this hart's S-mode. 
  *(uint32*)PLIC_SENABLE(hart)= (1 << UART_IRQ) | (1 << DISK_IRQ);
    802072b4:	0085171b          	slliw	a4,a0,0x8
    802072b8:	01f867b7          	lui	a5,0x1f86
    802072bc:	0785                	addi	a5,a5,1 # 1f86001 <_entry-0x7e279fff>
    802072be:	07b6                	slli	a5,a5,0xd
    802072c0:	97ba                	add	a5,a5,a4
    802072c2:	40200713          	li	a4,1026
    802072c6:	08e7a023          	sw	a4,128(a5)
  // set this hart's S-mode priority threshold to 0.
  *(uint32*)PLIC_SPRIORITY(hart) = 0;
    802072ca:	00d5151b          	slliw	a0,a0,0xd
    802072ce:	03f0c7b7          	lui	a5,0x3f0c
    802072d2:	20178793          	addi	a5,a5,513 # 3f0c201 <_entry-0x7c2f3dff>
    802072d6:	07b2                	slli	a5,a5,0xc
    802072d8:	97aa                	add	a5,a5,a0
    802072da:	0007a023          	sw	zero,0(a5)
  *(hart0_m_int_enable_hi) = readd(hart0_m_int_enable_hi) | (1 << (UART_IRQ % 32));
  #endif
  #ifdef DEBUG
  printf("plicinithart\n");
  #endif
}
    802072de:	60a2                	ld	ra,8(sp)
    802072e0:	6402                	ld	s0,0(sp)
    802072e2:	0141                	addi	sp,sp,16
    802072e4:	8082                	ret

00000000802072e6 <plic_claim>:

// ask the PLIC what interrupt we should serve.
int
plic_claim(void)
{
    802072e6:	1141                	addi	sp,sp,-16
    802072e8:	e406                	sd	ra,8(sp)
    802072ea:	e022                	sd	s0,0(sp)
    802072ec:	0800                	addi	s0,sp,16
  int hart = cpuid();
    802072ee:	ffffa097          	auipc	ra,0xffffa
    802072f2:	722080e7          	jalr	1826(ra) # 80201a10 <cpuid>
  int irq;
  #ifndef QEMU
  irq = *(uint32*)PLIC_MCLAIM(hart);
  #else
  irq = *(uint32*)PLIC_SCLAIM(hart);
    802072f6:	00d5151b          	slliw	a0,a0,0xd
    802072fa:	03f0c7b7          	lui	a5,0x3f0c
    802072fe:	20178793          	addi	a5,a5,513 # 3f0c201 <_entry-0x7c2f3dff>
    80207302:	07b2                	slli	a5,a5,0xc
    80207304:	97aa                	add	a5,a5,a0
  #endif
  return irq;
}
    80207306:	43c8                	lw	a0,4(a5)
    80207308:	60a2                	ld	ra,8(sp)
    8020730a:	6402                	ld	s0,0(sp)
    8020730c:	0141                	addi	sp,sp,16
    8020730e:	8082                	ret

0000000080207310 <plic_complete>:

// tell the PLIC we've served this IRQ.
void
plic_complete(int irq)
{
    80207310:	1101                	addi	sp,sp,-32
    80207312:	ec06                	sd	ra,24(sp)
    80207314:	e822                	sd	s0,16(sp)
    80207316:	e426                	sd	s1,8(sp)
    80207318:	1000                	addi	s0,sp,32
    8020731a:	84aa                	mv	s1,a0
  int hart = cpuid();
    8020731c:	ffffa097          	auipc	ra,0xffffa
    80207320:	6f4080e7          	jalr	1780(ra) # 80201a10 <cpuid>
  #ifndef QEMU
  *(uint32*)PLIC_MCLAIM(hart) = irq;
  #else
  *(uint32*)PLIC_SCLAIM(hart) = irq;
    80207324:	00d5151b          	slliw	a0,a0,0xd
    80207328:	03f0c7b7          	lui	a5,0x3f0c
    8020732c:	20178793          	addi	a5,a5,513 # 3f0c201 <_entry-0x7c2f3dff>
    80207330:	07b2                	slli	a5,a5,0xc
    80207332:	97aa                	add	a5,a5,a0
    80207334:	c3c4                	sw	s1,4(a5)
  #endif
}
    80207336:	60e2                	ld	ra,24(sp)
    80207338:	6442                	ld	s0,16(sp)
    8020733a:	64a2                	ld	s1,8(sp)
    8020733c:	6105                	addi	sp,sp,32
    8020733e:	8082                	ret

0000000080207340 <consolewrite>:
//
// user write()s to the console go here.
//
int
consolewrite(int user_src, uint64 src, int n)
{
    80207340:	715d                	addi	sp,sp,-80
    80207342:	e486                	sd	ra,72(sp)
    80207344:	e0a2                	sd	s0,64(sp)
    80207346:	fc26                	sd	s1,56(sp)
    80207348:	f84a                	sd	s2,48(sp)
    8020734a:	f44e                	sd	s3,40(sp)
    8020734c:	f052                	sd	s4,32(sp)
    8020734e:	ec56                	sd	s5,24(sp)
    80207350:	e85a                	sd	s6,16(sp)
    80207352:	0880                	addi	s0,sp,80
    80207354:	8a2a                	mv	s4,a0
    80207356:	84ae                	mv	s1,a1
    80207358:	89b2                	mv	s3,a2
  int i;

  acquire(&cons.lock);
    8020735a:	0001c517          	auipc	a0,0x1c
    8020735e:	8c650513          	addi	a0,a0,-1850 # 80222c20 <cons>
    80207362:	ffff9097          	auipc	ra,0xffff9
    80207366:	364080e7          	jalr	868(ra) # 802006c6 <acquire>
  for(i = 0; i < n; i++){
    8020736a:	07305063          	blez	s3,802073ca <consolewrite+0x8a>
    8020736e:	4901                	li	s2,0
    char c;
    if(either_copyin(&c, user_src, src+i, 1) == -1)
    80207370:	fbf40b13          	addi	s6,s0,-65
    80207374:	5afd                	li	s5,-1
    80207376:	4685                	li	a3,1
    80207378:	8626                	mv	a2,s1
    8020737a:	85d2                	mv	a1,s4
    8020737c:	855a                	mv	a0,s6
    8020737e:	ffffb097          	auipc	ra,0xffffb
    80207382:	1ee080e7          	jalr	494(ra) # 8020256c <either_copyin>
    80207386:	01550f63          	beq	a0,s5,802073a4 <consolewrite+0x64>
	SBI_CALL_1(SBI_CONSOLE_PUTCHAR, ch);
    8020738a:	fbf44503          	lbu	a0,-65(s0)
    8020738e:	4581                	li	a1,0
    80207390:	4601                	li	a2,0
    80207392:	4681                	li	a3,0
    80207394:	4885                	li	a7,1
    80207396:	00000073          	ecall
  for(i = 0; i < n; i++){
    8020739a:	2905                	addiw	s2,s2,1
    8020739c:	0485                	addi	s1,s1,1
    8020739e:	fd299ce3          	bne	s3,s2,80207376 <consolewrite+0x36>
    802073a2:	894e                	mv	s2,s3
      break;
    sbi_console_putchar(c);
  }
  release(&cons.lock);
    802073a4:	0001c517          	auipc	a0,0x1c
    802073a8:	87c50513          	addi	a0,a0,-1924 # 80222c20 <cons>
    802073ac:	ffff9097          	auipc	ra,0xffff9
    802073b0:	36e080e7          	jalr	878(ra) # 8020071a <release>

  return i;
}
    802073b4:	854a                	mv	a0,s2
    802073b6:	60a6                	ld	ra,72(sp)
    802073b8:	6406                	ld	s0,64(sp)
    802073ba:	74e2                	ld	s1,56(sp)
    802073bc:	7942                	ld	s2,48(sp)
    802073be:	79a2                	ld	s3,40(sp)
    802073c0:	7a02                	ld	s4,32(sp)
    802073c2:	6ae2                	ld	s5,24(sp)
    802073c4:	6b42                	ld	s6,16(sp)
    802073c6:	6161                	addi	sp,sp,80
    802073c8:	8082                	ret
  for(i = 0; i < n; i++){
    802073ca:	4901                	li	s2,0
    802073cc:	bfe1                	j	802073a4 <consolewrite+0x64>

00000000802073ce <consoleread>:
// user_dist indicates whether dst is a user
// or kernel address.
//
int
consoleread(int user_dst, uint64 dst, int n)
{
    802073ce:	7119                	addi	sp,sp,-128
    802073d0:	fc86                	sd	ra,120(sp)
    802073d2:	f8a2                	sd	s0,112(sp)
    802073d4:	f4a6                	sd	s1,104(sp)
    802073d6:	f0ca                	sd	s2,96(sp)
    802073d8:	ecce                	sd	s3,88(sp)
    802073da:	e8d2                	sd	s4,80(sp)
    802073dc:	e4d6                	sd	s5,72(sp)
    802073de:	e0da                	sd	s6,64(sp)
    802073e0:	fc5e                	sd	s7,56(sp)
    802073e2:	f862                	sd	s8,48(sp)
    802073e4:	f466                	sd	s9,40(sp)
    802073e6:	f06a                	sd	s10,32(sp)
    802073e8:	ec6e                	sd	s11,24(sp)
    802073ea:	0100                	addi	s0,sp,128
    802073ec:	8aaa                	mv	s5,a0
    802073ee:	8a2e                	mv	s4,a1
    802073f0:	89b2                	mv	s3,a2
  uint target;
  int c;
  char cbuf;

  target = n;
    802073f2:	00060b1b          	sext.w	s6,a2
  acquire(&cons.lock);
    802073f6:	0001c517          	auipc	a0,0x1c
    802073fa:	82a50513          	addi	a0,a0,-2006 # 80222c20 <cons>
    802073fe:	ffff9097          	auipc	ra,0xffff9
    80207402:	2c8080e7          	jalr	712(ra) # 802006c6 <acquire>
  while(n > 0){
    // wait until interrupt handler has put some
    // input into cons.buffer.
    while(cons.r == cons.w){
    80207406:	0001c497          	auipc	s1,0x1c
    8020740a:	81a48493          	addi	s1,s1,-2022 # 80222c20 <cons>
      if(myproc()->killed){
        release(&cons.lock);
        return -1;
      }
      sleep(&cons.r, &cons.lock);
    8020740e:	0001c917          	auipc	s2,0x1c
    80207412:	8aa90913          	addi	s2,s2,-1878 # 80222cb8 <cons+0x98>
    }

    c = cons.buf[cons.r++ % INPUT_BUF];

    if(c == C('D')){  // end-of-file
    80207416:	4c11                	li	s8,4
      break;
    }

    // copy the input byte to the user-space buffer.
    cbuf = c;
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    80207418:	f8f40d13          	addi	s10,s0,-113
    8020741c:	5cfd                	li	s9,-1
      break;

    dst++;
    --n;

    if(c == '\n'){
    8020741e:	4da9                	li	s11,10
  while(n > 0){
    80207420:	07305763          	blez	s3,8020748e <consoleread+0xc0>
    while(cons.r == cons.w){
    80207424:	0984a783          	lw	a5,152(s1)
    80207428:	09c4a703          	lw	a4,156(s1)
    8020742c:	02f71463          	bne	a4,a5,80207454 <consoleread+0x86>
      if(myproc()->killed){
    80207430:	ffffa097          	auipc	ra,0xffffa
    80207434:	60c080e7          	jalr	1548(ra) # 80201a3c <myproc>
    80207438:	591c                	lw	a5,48(a0)
    8020743a:	e7ad                	bnez	a5,802074a4 <consoleread+0xd6>
      sleep(&cons.r, &cons.lock);
    8020743c:	85a6                	mv	a1,s1
    8020743e:	854a                	mv	a0,s2
    80207440:	ffffb097          	auipc	ra,0xffffb
    80207444:	ea0080e7          	jalr	-352(ra) # 802022e0 <sleep>
    while(cons.r == cons.w){
    80207448:	0984a783          	lw	a5,152(s1)
    8020744c:	09c4a703          	lw	a4,156(s1)
    80207450:	fef700e3          	beq	a4,a5,80207430 <consoleread+0x62>
    c = cons.buf[cons.r++ % INPUT_BUF];
    80207454:	0017871b          	addiw	a4,a5,1
    80207458:	08e4ac23          	sw	a4,152(s1)
    8020745c:	07f7f713          	andi	a4,a5,127
    80207460:	9726                	add	a4,a4,s1
    80207462:	01874703          	lbu	a4,24(a4)
    80207466:	00070b9b          	sext.w	s7,a4
    if(c == C('D')){  // end-of-file
    8020746a:	078b8563          	beq	s7,s8,802074d4 <consoleread+0x106>
    cbuf = c;
    8020746e:	f8e407a3          	sb	a4,-113(s0)
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    80207472:	4685                	li	a3,1
    80207474:	866a                	mv	a2,s10
    80207476:	85d2                	mv	a1,s4
    80207478:	8556                	mv	a0,s5
    8020747a:	ffffb097          	auipc	ra,0xffffb
    8020747e:	0bc080e7          	jalr	188(ra) # 80202536 <either_copyout>
    80207482:	01950663          	beq	a0,s9,8020748e <consoleread+0xc0>
    dst++;
    80207486:	0a05                	addi	s4,s4,1
    --n;
    80207488:	39fd                	addiw	s3,s3,-1
    if(c == '\n'){
    8020748a:	f9bb9be3          	bne	s7,s11,80207420 <consoleread+0x52>
      // a whole line has arrived, return to
      // the user-level read().
      break;
    }
  }
  release(&cons.lock);
    8020748e:	0001b517          	auipc	a0,0x1b
    80207492:	79250513          	addi	a0,a0,1938 # 80222c20 <cons>
    80207496:	ffff9097          	auipc	ra,0xffff9
    8020749a:	284080e7          	jalr	644(ra) # 8020071a <release>

  return target - n;
    8020749e:	413b053b          	subw	a0,s6,s3
    802074a2:	a811                	j	802074b6 <consoleread+0xe8>
        release(&cons.lock);
    802074a4:	0001b517          	auipc	a0,0x1b
    802074a8:	77c50513          	addi	a0,a0,1916 # 80222c20 <cons>
    802074ac:	ffff9097          	auipc	ra,0xffff9
    802074b0:	26e080e7          	jalr	622(ra) # 8020071a <release>
        return -1;
    802074b4:	557d                	li	a0,-1
}
    802074b6:	70e6                	ld	ra,120(sp)
    802074b8:	7446                	ld	s0,112(sp)
    802074ba:	74a6                	ld	s1,104(sp)
    802074bc:	7906                	ld	s2,96(sp)
    802074be:	69e6                	ld	s3,88(sp)
    802074c0:	6a46                	ld	s4,80(sp)
    802074c2:	6aa6                	ld	s5,72(sp)
    802074c4:	6b06                	ld	s6,64(sp)
    802074c6:	7be2                	ld	s7,56(sp)
    802074c8:	7c42                	ld	s8,48(sp)
    802074ca:	7ca2                	ld	s9,40(sp)
    802074cc:	7d02                	ld	s10,32(sp)
    802074ce:	6de2                	ld	s11,24(sp)
    802074d0:	6109                	addi	sp,sp,128
    802074d2:	8082                	ret
      if(n < target){
    802074d4:	0009871b          	sext.w	a4,s3
    802074d8:	fb677be3          	bgeu	a4,s6,8020748e <consoleread+0xc0>
        cons.r--;
    802074dc:	0001b717          	auipc	a4,0x1b
    802074e0:	7cf72e23          	sw	a5,2012(a4) # 80222cb8 <cons+0x98>
    802074e4:	b76d                	j	8020748e <consoleread+0xc0>

00000000802074e6 <consputc>:
void consputc(int c) {
    802074e6:	1141                	addi	sp,sp,-16
    802074e8:	e422                	sd	s0,8(sp)
    802074ea:	0800                	addi	s0,sp,16
  if(c == BACKSPACE){
    802074ec:	10000793          	li	a5,256
    802074f0:	00f50b63          	beq	a0,a5,80207506 <consputc+0x20>
    802074f4:	4581                	li	a1,0
    802074f6:	4601                	li	a2,0
    802074f8:	4681                	li	a3,0
    802074fa:	4885                	li	a7,1
    802074fc:	00000073          	ecall
}
    80207500:	6422                	ld	s0,8(sp)
    80207502:	0141                	addi	sp,sp,16
    80207504:	8082                	ret
    80207506:	4521                	li	a0,8
    80207508:	4581                	li	a1,0
    8020750a:	4601                	li	a2,0
    8020750c:	4681                	li	a3,0
    8020750e:	4885                	li	a7,1
    80207510:	00000073          	ecall
    80207514:	02000513          	li	a0,32
    80207518:	00000073          	ecall
    8020751c:	4521                	li	a0,8
    8020751e:	00000073          	ecall
}
    80207522:	bff9                	j	80207500 <consputc+0x1a>

0000000080207524 <consoleintr>:
// do erase/kill processing, append to cons.buf,
// wake up consoleread() if a whole line has arrived.
//
void
consoleintr(int c)
{
    80207524:	1101                	addi	sp,sp,-32
    80207526:	ec06                	sd	ra,24(sp)
    80207528:	e822                	sd	s0,16(sp)
    8020752a:	e426                	sd	s1,8(sp)
    8020752c:	e04a                	sd	s2,0(sp)
    8020752e:	1000                	addi	s0,sp,32
    80207530:	84aa                	mv	s1,a0
  acquire(&cons.lock);
    80207532:	0001b517          	auipc	a0,0x1b
    80207536:	6ee50513          	addi	a0,a0,1774 # 80222c20 <cons>
    8020753a:	ffff9097          	auipc	ra,0xffff9
    8020753e:	18c080e7          	jalr	396(ra) # 802006c6 <acquire>

  switch(c){
    80207542:	47d5                	li	a5,21
    80207544:	0af48663          	beq	s1,a5,802075f0 <consoleintr+0xcc>
    80207548:	0297ca63          	blt	a5,s1,8020757c <consoleintr+0x58>
    8020754c:	47a1                	li	a5,8
    8020754e:	0ef48763          	beq	s1,a5,8020763c <consoleintr+0x118>
    80207552:	47c1                	li	a5,16
    80207554:	10f49a63          	bne	s1,a5,80207668 <consoleintr+0x144>
  case C('P'):  // Print process list.
    procdump();
    80207558:	ffffb097          	auipc	ra,0xffffb
    8020755c:	048080e7          	jalr	72(ra) # 802025a0 <procdump>
      }
    }
    break;
  }
  
  release(&cons.lock);
    80207560:	0001b517          	auipc	a0,0x1b
    80207564:	6c050513          	addi	a0,a0,1728 # 80222c20 <cons>
    80207568:	ffff9097          	auipc	ra,0xffff9
    8020756c:	1b2080e7          	jalr	434(ra) # 8020071a <release>
}
    80207570:	60e2                	ld	ra,24(sp)
    80207572:	6442                	ld	s0,16(sp)
    80207574:	64a2                	ld	s1,8(sp)
    80207576:	6902                	ld	s2,0(sp)
    80207578:	6105                	addi	sp,sp,32
    8020757a:	8082                	ret
  switch(c){
    8020757c:	07f00793          	li	a5,127
    80207580:	0af48e63          	beq	s1,a5,8020763c <consoleintr+0x118>
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    80207584:	0001b717          	auipc	a4,0x1b
    80207588:	69c70713          	addi	a4,a4,1692 # 80222c20 <cons>
    8020758c:	0a072783          	lw	a5,160(a4)
    80207590:	09872703          	lw	a4,152(a4)
    80207594:	9f99                	subw	a5,a5,a4
    80207596:	07f00713          	li	a4,127
    8020759a:	fcf763e3          	bltu	a4,a5,80207560 <consoleintr+0x3c>
      c = (c == '\r') ? '\n' : c;
    8020759e:	47b5                	li	a5,13
    802075a0:	0cf48763          	beq	s1,a5,8020766e <consoleintr+0x14a>
      consputc(c);
    802075a4:	8526                	mv	a0,s1
    802075a6:	00000097          	auipc	ra,0x0
    802075aa:	f40080e7          	jalr	-192(ra) # 802074e6 <consputc>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    802075ae:	0001b797          	auipc	a5,0x1b
    802075b2:	67278793          	addi	a5,a5,1650 # 80222c20 <cons>
    802075b6:	0a07a703          	lw	a4,160(a5)
    802075ba:	0017069b          	addiw	a3,a4,1
    802075be:	0006861b          	sext.w	a2,a3
    802075c2:	0ad7a023          	sw	a3,160(a5)
    802075c6:	07f77713          	andi	a4,a4,127
    802075ca:	97ba                	add	a5,a5,a4
    802075cc:	00978c23          	sb	s1,24(a5)
      if(c == '\n' || c == C('D') || cons.e == cons.r+INPUT_BUF){
    802075d0:	47a9                	li	a5,10
    802075d2:	0cf48563          	beq	s1,a5,8020769c <consoleintr+0x178>
    802075d6:	4791                	li	a5,4
    802075d8:	0cf48263          	beq	s1,a5,8020769c <consoleintr+0x178>
    802075dc:	0001b797          	auipc	a5,0x1b
    802075e0:	6dc7a783          	lw	a5,1756(a5) # 80222cb8 <cons+0x98>
    802075e4:	0807879b          	addiw	a5,a5,128
    802075e8:	f6f61ce3          	bne	a2,a5,80207560 <consoleintr+0x3c>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    802075ec:	863e                	mv	a2,a5
    802075ee:	a07d                	j	8020769c <consoleintr+0x178>
    while(cons.e != cons.w &&
    802075f0:	0001b717          	auipc	a4,0x1b
    802075f4:	63070713          	addi	a4,a4,1584 # 80222c20 <cons>
    802075f8:	0a072783          	lw	a5,160(a4)
    802075fc:	09c72703          	lw	a4,156(a4)
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    80207600:	0001b497          	auipc	s1,0x1b
    80207604:	62048493          	addi	s1,s1,1568 # 80222c20 <cons>
    while(cons.e != cons.w &&
    80207608:	4929                	li	s2,10
    8020760a:	f4f70be3          	beq	a4,a5,80207560 <consoleintr+0x3c>
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    8020760e:	37fd                	addiw	a5,a5,-1
    80207610:	07f7f713          	andi	a4,a5,127
    80207614:	9726                	add	a4,a4,s1
    while(cons.e != cons.w &&
    80207616:	01874703          	lbu	a4,24(a4)
    8020761a:	f52703e3          	beq	a4,s2,80207560 <consoleintr+0x3c>
      cons.e--;
    8020761e:	0af4a023          	sw	a5,160(s1)
      consputc(BACKSPACE);
    80207622:	10000513          	li	a0,256
    80207626:	00000097          	auipc	ra,0x0
    8020762a:	ec0080e7          	jalr	-320(ra) # 802074e6 <consputc>
    while(cons.e != cons.w &&
    8020762e:	0a04a783          	lw	a5,160(s1)
    80207632:	09c4a703          	lw	a4,156(s1)
    80207636:	fcf71ce3          	bne	a4,a5,8020760e <consoleintr+0xea>
    8020763a:	b71d                	j	80207560 <consoleintr+0x3c>
    if(cons.e != cons.w){
    8020763c:	0001b717          	auipc	a4,0x1b
    80207640:	5e470713          	addi	a4,a4,1508 # 80222c20 <cons>
    80207644:	0a072783          	lw	a5,160(a4)
    80207648:	09c72703          	lw	a4,156(a4)
    8020764c:	f0f70ae3          	beq	a4,a5,80207560 <consoleintr+0x3c>
      cons.e--;
    80207650:	37fd                	addiw	a5,a5,-1
    80207652:	0001b717          	auipc	a4,0x1b
    80207656:	66f72723          	sw	a5,1646(a4) # 80222cc0 <cons+0xa0>
      consputc(BACKSPACE);
    8020765a:	10000513          	li	a0,256
    8020765e:	00000097          	auipc	ra,0x0
    80207662:	e88080e7          	jalr	-376(ra) # 802074e6 <consputc>
    80207666:	bded                	j	80207560 <consoleintr+0x3c>
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    80207668:	ee048ce3          	beqz	s1,80207560 <consoleintr+0x3c>
    8020766c:	bf21                	j	80207584 <consoleintr+0x60>
      consputc(c);
    8020766e:	4529                	li	a0,10
    80207670:	00000097          	auipc	ra,0x0
    80207674:	e76080e7          	jalr	-394(ra) # 802074e6 <consputc>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    80207678:	0001b797          	auipc	a5,0x1b
    8020767c:	5a878793          	addi	a5,a5,1448 # 80222c20 <cons>
    80207680:	0a07a703          	lw	a4,160(a5)
    80207684:	0017069b          	addiw	a3,a4,1
    80207688:	0006861b          	sext.w	a2,a3
    8020768c:	0ad7a023          	sw	a3,160(a5)
    80207690:	07f77713          	andi	a4,a4,127
    80207694:	97ba                	add	a5,a5,a4
    80207696:	4729                	li	a4,10
    80207698:	00e78c23          	sb	a4,24(a5)
        cons.w = cons.e;
    8020769c:	0001b797          	auipc	a5,0x1b
    802076a0:	62c7a023          	sw	a2,1568(a5) # 80222cbc <cons+0x9c>
        wakeup(&cons.r);
    802076a4:	0001b517          	auipc	a0,0x1b
    802076a8:	61450513          	addi	a0,a0,1556 # 80222cb8 <cons+0x98>
    802076ac:	ffffb097          	auipc	ra,0xffffb
    802076b0:	db0080e7          	jalr	-592(ra) # 8020245c <wakeup>
    802076b4:	b575                	j	80207560 <consoleintr+0x3c>

00000000802076b6 <consoleinit>:

void
consoleinit(void)
{
    802076b6:	1101                	addi	sp,sp,-32
    802076b8:	ec06                	sd	ra,24(sp)
    802076ba:	e822                	sd	s0,16(sp)
    802076bc:	e426                	sd	s1,8(sp)
    802076be:	1000                	addi	s0,sp,32
  initlock(&cons.lock, "cons");
    802076c0:	0001b497          	auipc	s1,0x1b
    802076c4:	56048493          	addi	s1,s1,1376 # 80222c20 <cons>
    802076c8:	00002597          	auipc	a1,0x2
    802076cc:	7f858593          	addi	a1,a1,2040 # 80209ec0 <digits+0xb40>
    802076d0:	8526                	mv	a0,s1
    802076d2:	ffff9097          	auipc	ra,0xffff9
    802076d6:	fb0080e7          	jalr	-80(ra) # 80200682 <initlock>

  cons.e = cons.w = cons.r = 0;
    802076da:	0804ac23          	sw	zero,152(s1)
    802076de:	0804ae23          	sw	zero,156(s1)
    802076e2:	0a04a023          	sw	zero,160(s1)
  
  // connect read and write system calls
  // to consoleread and consolewrite.
  devsw[CONSOLE].read = consoleread;
    802076e6:	00004797          	auipc	a5,0x4
    802076ea:	62a7b783          	ld	a5,1578(a5) # 8020bd10 <_GLOBAL_OFFSET_TABLE_+0x58>
    802076ee:	00000717          	auipc	a4,0x0
    802076f2:	ce070713          	addi	a4,a4,-800 # 802073ce <consoleread>
    802076f6:	eb98                	sd	a4,16(a5)
  devsw[CONSOLE].write = consolewrite;
    802076f8:	00000717          	auipc	a4,0x0
    802076fc:	c4870713          	addi	a4,a4,-952 # 80207340 <consolewrite>
    80207700:	ef98                	sd	a4,24(a5)
}
    80207702:	60e2                	ld	ra,24(sp)
    80207704:	6442                	ld	s0,16(sp)
    80207706:	64a2                	ld	s1,8(sp)
    80207708:	6105                	addi	sp,sp,32
    8020770a:	8082                	ret

000000008020770c <free_desc>:
}

// mark a descriptor as free.
static void
free_desc(int i)
{
    8020770c:	1141                	addi	sp,sp,-16
    8020770e:	e406                	sd	ra,8(sp)
    80207710:	e022                	sd	s0,0(sp)
    80207712:	0800                	addi	s0,sp,16
  if(i >= NUM)
    80207714:	479d                	li	a5,7
    80207716:	04a7cb63          	blt	a5,a0,8020776c <free_desc+0x60>
    panic("virtio_disk_intr 1");
  if(disk.free[i])
    8020771a:	0001c717          	auipc	a4,0x1c
    8020771e:	8e670713          	addi	a4,a4,-1818 # 80223000 <disk>
    80207722:	972a                	add	a4,a4,a0
    80207724:	6789                	lui	a5,0x2
    80207726:	97ba                	add	a5,a5,a4
    80207728:	0187c783          	lbu	a5,24(a5) # 2018 <_entry-0x801fdfe8>
    8020772c:	eba1                	bnez	a5,8020777c <free_desc+0x70>
    panic("virtio_disk_intr 2");
  disk.desc[i].addr = 0;
    8020772e:	00451713          	slli	a4,a0,0x4
    80207732:	0001e797          	auipc	a5,0x1e
    80207736:	8ce7b783          	ld	a5,-1842(a5) # 80225000 <disk+0x2000>
    8020773a:	97ba                	add	a5,a5,a4
    8020773c:	0007b023          	sd	zero,0(a5)
  disk.free[i] = 1;
    80207740:	0001c717          	auipc	a4,0x1c
    80207744:	8c070713          	addi	a4,a4,-1856 # 80223000 <disk>
    80207748:	972a                	add	a4,a4,a0
    8020774a:	6789                	lui	a5,0x2
    8020774c:	97ba                	add	a5,a5,a4
    8020774e:	4705                	li	a4,1
    80207750:	00e78c23          	sb	a4,24(a5) # 2018 <_entry-0x801fdfe8>
  wakeup(&disk.free[0]);
    80207754:	0001e517          	auipc	a0,0x1e
    80207758:	8c450513          	addi	a0,a0,-1852 # 80225018 <disk+0x2018>
    8020775c:	ffffb097          	auipc	ra,0xffffb
    80207760:	d00080e7          	jalr	-768(ra) # 8020245c <wakeup>
}
    80207764:	60a2                	ld	ra,8(sp)
    80207766:	6402                	ld	s0,0(sp)
    80207768:	0141                	addi	sp,sp,16
    8020776a:	8082                	ret
    panic("virtio_disk_intr 1");
    8020776c:	00002517          	auipc	a0,0x2
    80207770:	75c50513          	addi	a0,a0,1884 # 80209ec8 <digits+0xb48>
    80207774:	ffff9097          	auipc	ra,0xffff9
    80207778:	9d0080e7          	jalr	-1584(ra) # 80200144 <panic>
    panic("virtio_disk_intr 2");
    8020777c:	00002517          	auipc	a0,0x2
    80207780:	76450513          	addi	a0,a0,1892 # 80209ee0 <digits+0xb60>
    80207784:	ffff9097          	auipc	ra,0xffff9
    80207788:	9c0080e7          	jalr	-1600(ra) # 80200144 <panic>

000000008020778c <virtio_disk_init>:
{
    8020778c:	1141                	addi	sp,sp,-16
    8020778e:	e406                	sd	ra,8(sp)
    80207790:	e022                	sd	s0,0(sp)
    80207792:	0800                	addi	s0,sp,16
  initlock(&disk.vdisk_lock, "virtio_disk");
    80207794:	00002597          	auipc	a1,0x2
    80207798:	76458593          	addi	a1,a1,1892 # 80209ef8 <digits+0xb78>
    8020779c:	0001e517          	auipc	a0,0x1e
    802077a0:	90c50513          	addi	a0,a0,-1780 # 802250a8 <disk+0x20a8>
    802077a4:	ffff9097          	auipc	ra,0xffff9
    802077a8:	ede080e7          	jalr	-290(ra) # 80200682 <initlock>
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    802077ac:	03f107b7          	lui	a5,0x3f10
    802077b0:	0785                	addi	a5,a5,1 # 3f10001 <_entry-0x7c2effff>
    802077b2:	07b2                	slli	a5,a5,0xc
    802077b4:	4398                	lw	a4,0(a5)
    802077b6:	2701                	sext.w	a4,a4
    802077b8:	747277b7          	lui	a5,0x74727
    802077bc:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xbad968a>
    802077c0:	12f71163          	bne	a4,a5,802078e2 <virtio_disk_init+0x156>
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    802077c4:	00002797          	auipc	a5,0x2
    802077c8:	7bc7b783          	ld	a5,1980(a5) # 80209f80 <digits+0xc00>
    802077cc:	439c                	lw	a5,0(a5)
    802077ce:	2781                	sext.w	a5,a5
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    802077d0:	4705                	li	a4,1
    802077d2:	10e79863          	bne	a5,a4,802078e2 <virtio_disk_init+0x156>
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    802077d6:	00002797          	auipc	a5,0x2
    802077da:	7b27b783          	ld	a5,1970(a5) # 80209f88 <digits+0xc08>
    802077de:	439c                	lw	a5,0(a5)
    802077e0:	2781                	sext.w	a5,a5
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    802077e2:	4709                	li	a4,2
    802077e4:	0ee79f63          	bne	a5,a4,802078e2 <virtio_disk_init+0x156>
     *R(VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    802077e8:	00002797          	auipc	a5,0x2
    802077ec:	7a87b783          	ld	a5,1960(a5) # 80209f90 <digits+0xc10>
    802077f0:	4398                	lw	a4,0(a5)
    802077f2:	2701                	sext.w	a4,a4
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    802077f4:	554d47b7          	lui	a5,0x554d4
    802077f8:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ad2baaf>
    802077fc:	0ef71363          	bne	a4,a5,802078e2 <virtio_disk_init+0x156>
  *R(VIRTIO_MMIO_STATUS) = status;
    80207800:	00002797          	auipc	a5,0x2
    80207804:	7987b783          	ld	a5,1944(a5) # 80209f98 <digits+0xc18>
    80207808:	4705                	li	a4,1
    8020780a:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_STATUS) = status;
    8020780c:	470d                	li	a4,3
    8020780e:	c398                	sw	a4,0(a5)
  uint64 features = *R(VIRTIO_MMIO_DEVICE_FEATURES);
    80207810:	00002717          	auipc	a4,0x2
    80207814:	79073703          	ld	a4,1936(a4) # 80209fa0 <digits+0xc20>
    80207818:	4318                	lw	a4,0(a4)
  *R(VIRTIO_MMIO_DRIVER_FEATURES) = features;
    8020781a:	c7ffe6b7          	lui	a3,0xc7ffe
    8020781e:	75f68693          	addi	a3,a3,1887 # ffffffffc7ffe75f <ebss_clear+0xffffffff47dd875f>
    80207822:	8f75                	and	a4,a4,a3
    80207824:	00002697          	auipc	a3,0x2
    80207828:	7846b683          	ld	a3,1924(a3) # 80209fa8 <digits+0xc28>
    8020782c:	c298                	sw	a4,0(a3)
  *R(VIRTIO_MMIO_STATUS) = status;
    8020782e:	472d                	li	a4,11
    80207830:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_STATUS) = status;
    80207832:	473d                	li	a4,15
    80207834:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_GUEST_PAGE_SIZE) = PGSIZE;
    80207836:	00002797          	auipc	a5,0x2
    8020783a:	77a7b783          	ld	a5,1914(a5) # 80209fb0 <digits+0xc30>
    8020783e:	6705                	lui	a4,0x1
    80207840:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_QUEUE_SEL) = 0;
    80207842:	00002797          	auipc	a5,0x2
    80207846:	7767b783          	ld	a5,1910(a5) # 80209fb8 <digits+0xc38>
    8020784a:	0007a023          	sw	zero,0(a5)
  uint32 max = *R(VIRTIO_MMIO_QUEUE_NUM_MAX);
    8020784e:	00002797          	auipc	a5,0x2
    80207852:	7727b783          	ld	a5,1906(a5) # 80209fc0 <digits+0xc40>
    80207856:	439c                	lw	a5,0(a5)
    80207858:	2781                	sext.w	a5,a5
  if(max == 0)
    8020785a:	cfc1                	beqz	a5,802078f2 <virtio_disk_init+0x166>
  if(max < NUM)
    8020785c:	471d                	li	a4,7
    8020785e:	0af77263          	bgeu	a4,a5,80207902 <virtio_disk_init+0x176>
  *R(VIRTIO_MMIO_QUEUE_NUM) = NUM;
    80207862:	00002797          	auipc	a5,0x2
    80207866:	7667b783          	ld	a5,1894(a5) # 80209fc8 <digits+0xc48>
    8020786a:	4721                	li	a4,8
    8020786c:	c398                	sw	a4,0(a5)
  memset(disk.pages, 0, sizeof(disk.pages));
    8020786e:	6609                	lui	a2,0x2
    80207870:	4581                	li	a1,0
    80207872:	0001b517          	auipc	a0,0x1b
    80207876:	78e50513          	addi	a0,a0,1934 # 80223000 <disk>
    8020787a:	ffff9097          	auipc	ra,0xffff9
    8020787e:	ee8080e7          	jalr	-280(ra) # 80200762 <memset>
  *R(VIRTIO_MMIO_QUEUE_PFN) = ((uint64)disk.pages) >> PGSHIFT;
    80207882:	0001b717          	auipc	a4,0x1b
    80207886:	77e70713          	addi	a4,a4,1918 # 80223000 <disk>
    8020788a:	00c75793          	srli	a5,a4,0xc
    8020788e:	2781                	sext.w	a5,a5
    80207890:	00002697          	auipc	a3,0x2
    80207894:	7406b683          	ld	a3,1856(a3) # 80209fd0 <digits+0xc50>
    80207898:	c29c                	sw	a5,0(a3)
  disk.desc = (struct VRingDesc *) disk.pages;
    8020789a:	0001d797          	auipc	a5,0x1d
    8020789e:	76678793          	addi	a5,a5,1894 # 80225000 <disk+0x2000>
    802078a2:	e398                	sd	a4,0(a5)
  disk.avail = (uint16*)(((char*)disk.desc) + NUM*sizeof(struct VRingDesc));
    802078a4:	0001b717          	auipc	a4,0x1b
    802078a8:	7dc70713          	addi	a4,a4,2012 # 80223080 <disk+0x80>
    802078ac:	e798                	sd	a4,8(a5)
  disk.used = (struct UsedArea *) (disk.pages + PGSIZE);
    802078ae:	0001c717          	auipc	a4,0x1c
    802078b2:	75270713          	addi	a4,a4,1874 # 80224000 <disk+0x1000>
    802078b6:	eb98                	sd	a4,16(a5)
    disk.free[i] = 1;
    802078b8:	4705                	li	a4,1
    802078ba:	00e78c23          	sb	a4,24(a5)
    802078be:	00e78ca3          	sb	a4,25(a5)
    802078c2:	00e78d23          	sb	a4,26(a5)
    802078c6:	00e78da3          	sb	a4,27(a5)
    802078ca:	00e78e23          	sb	a4,28(a5)
    802078ce:	00e78ea3          	sb	a4,29(a5)
    802078d2:	00e78f23          	sb	a4,30(a5)
    802078d6:	00e78fa3          	sb	a4,31(a5)
}
    802078da:	60a2                	ld	ra,8(sp)
    802078dc:	6402                	ld	s0,0(sp)
    802078de:	0141                	addi	sp,sp,16
    802078e0:	8082                	ret
    panic("could not find virtio disk");
    802078e2:	00002517          	auipc	a0,0x2
    802078e6:	62650513          	addi	a0,a0,1574 # 80209f08 <digits+0xb88>
    802078ea:	ffff9097          	auipc	ra,0xffff9
    802078ee:	85a080e7          	jalr	-1958(ra) # 80200144 <panic>
    panic("virtio disk has no queue 0");
    802078f2:	00002517          	auipc	a0,0x2
    802078f6:	63650513          	addi	a0,a0,1590 # 80209f28 <digits+0xba8>
    802078fa:	ffff9097          	auipc	ra,0xffff9
    802078fe:	84a080e7          	jalr	-1974(ra) # 80200144 <panic>
    panic("virtio disk max queue too short");
    80207902:	00002517          	auipc	a0,0x2
    80207906:	64650513          	addi	a0,a0,1606 # 80209f48 <digits+0xbc8>
    8020790a:	ffff9097          	auipc	ra,0xffff9
    8020790e:	83a080e7          	jalr	-1990(ra) # 80200144 <panic>

0000000080207912 <virtio_disk_rw>:
  return 0;
}

void
virtio_disk_rw(struct buf *b, int write)
{
    80207912:	7175                	addi	sp,sp,-144
    80207914:	e506                	sd	ra,136(sp)
    80207916:	e122                	sd	s0,128(sp)
    80207918:	fca6                	sd	s1,120(sp)
    8020791a:	f8ca                	sd	s2,112(sp)
    8020791c:	f4ce                	sd	s3,104(sp)
    8020791e:	f0d2                	sd	s4,96(sp)
    80207920:	ecd6                	sd	s5,88(sp)
    80207922:	e8da                	sd	s6,80(sp)
    80207924:	e4de                	sd	s7,72(sp)
    80207926:	e0e2                	sd	s8,64(sp)
    80207928:	fc66                	sd	s9,56(sp)
    8020792a:	f86a                	sd	s10,48(sp)
    8020792c:	f46e                	sd	s11,40(sp)
    8020792e:	0900                	addi	s0,sp,144
    80207930:	8aaa                	mv	s5,a0
    80207932:	8cae                	mv	s9,a1
  uint64 sector = b->sectorno;
    80207934:	00c56d03          	lwu	s10,12(a0)

  acquire(&disk.vdisk_lock);
    80207938:	0001d517          	auipc	a0,0x1d
    8020793c:	77050513          	addi	a0,a0,1904 # 802250a8 <disk+0x20a8>
    80207940:	ffff9097          	auipc	ra,0xffff9
    80207944:	d86080e7          	jalr	-634(ra) # 802006c6 <acquire>
  for(int i = 0; i < 3; i++){
    80207948:	4981                	li	s3,0
  for(int i = 0; i < NUM; i++){
    8020794a:	44a1                	li	s1,8
      disk.free[i] = 0;
    8020794c:	0001bc17          	auipc	s8,0x1b
    80207950:	6b4c0c13          	addi	s8,s8,1716 # 80223000 <disk>
    80207954:	6b89                	lui	s7,0x2
  for(int i = 0; i < 3; i++){
    80207956:	4b0d                	li	s6,3
    80207958:	a0ad                	j	802079c2 <virtio_disk_rw+0xb0>
      disk.free[i] = 0;
    8020795a:	00fc0733          	add	a4,s8,a5
    8020795e:	975e                	add	a4,a4,s7
    80207960:	00070c23          	sb	zero,24(a4)
    idx[i] = alloc_desc();
    80207964:	c19c                	sw	a5,0(a1)
    if(idx[i] < 0){
    80207966:	0207c563          	bltz	a5,80207990 <virtio_disk_rw+0x7e>
  for(int i = 0; i < 3; i++){
    8020796a:	2905                	addiw	s2,s2,1
    8020796c:	0611                	addi	a2,a2,4 # 2004 <_entry-0x801fdffc>
    8020796e:	19690e63          	beq	s2,s6,80207b0a <virtio_disk_rw+0x1f8>
    idx[i] = alloc_desc();
    80207972:	85b2                	mv	a1,a2
  for(int i = 0; i < NUM; i++){
    80207974:	0001d717          	auipc	a4,0x1d
    80207978:	6a470713          	addi	a4,a4,1700 # 80225018 <disk+0x2018>
    8020797c:	87ce                	mv	a5,s3
    if(disk.free[i]){
    8020797e:	00074683          	lbu	a3,0(a4)
    80207982:	fee1                	bnez	a3,8020795a <virtio_disk_rw+0x48>
  for(int i = 0; i < NUM; i++){
    80207984:	2785                	addiw	a5,a5,1
    80207986:	0705                	addi	a4,a4,1
    80207988:	fe979be3          	bne	a5,s1,8020797e <virtio_disk_rw+0x6c>
    idx[i] = alloc_desc();
    8020798c:	57fd                	li	a5,-1
    8020798e:	c19c                	sw	a5,0(a1)
      for(int j = 0; j < i; j++)
    80207990:	01205d63          	blez	s2,802079aa <virtio_disk_rw+0x98>
    80207994:	8dce                	mv	s11,s3
        free_desc(idx[j]);
    80207996:	000a2503          	lw	a0,0(s4)
    8020799a:	00000097          	auipc	ra,0x0
    8020799e:	d72080e7          	jalr	-654(ra) # 8020770c <free_desc>
      for(int j = 0; j < i; j++)
    802079a2:	2d85                	addiw	s11,s11,1
    802079a4:	0a11                	addi	s4,s4,4
    802079a6:	ff2d98e3          	bne	s11,s2,80207996 <virtio_disk_rw+0x84>
  int idx[3];
  while(1){
    if(alloc3_desc(idx) == 0) {
      break;
    }
    sleep(&disk.free[0], &disk.vdisk_lock);
    802079aa:	0001d597          	auipc	a1,0x1d
    802079ae:	6fe58593          	addi	a1,a1,1790 # 802250a8 <disk+0x20a8>
    802079b2:	0001d517          	auipc	a0,0x1d
    802079b6:	66650513          	addi	a0,a0,1638 # 80225018 <disk+0x2018>
    802079ba:	ffffb097          	auipc	ra,0xffffb
    802079be:	926080e7          	jalr	-1754(ra) # 802022e0 <sleep>
  for(int i = 0; i < 3; i++){
    802079c2:	f8040a13          	addi	s4,s0,-128
{
    802079c6:	8652                	mv	a2,s4
  for(int i = 0; i < 3; i++){
    802079c8:	894e                	mv	s2,s3
    802079ca:	b765                	j	80207972 <virtio_disk_rw+0x60>
  disk.desc[idx[0]].next = idx[1];

  disk.desc[idx[1]].addr = (uint64) b->data;
  disk.desc[idx[1]].len = BSIZE;
  if(write)
    disk.desc[idx[1]].flags = 0; // device reads b->data
    802079cc:	0001d717          	auipc	a4,0x1d
    802079d0:	63473703          	ld	a4,1588(a4) # 80225000 <disk+0x2000>
    802079d4:	973e                	add	a4,a4,a5
    802079d6:	00071623          	sh	zero,12(a4)
  else
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
  disk.desc[idx[1]].flags |= VRING_DESC_F_NEXT;
    802079da:	0001b517          	auipc	a0,0x1b
    802079de:	62650513          	addi	a0,a0,1574 # 80223000 <disk>
    802079e2:	0001d717          	auipc	a4,0x1d
    802079e6:	61e70713          	addi	a4,a4,1566 # 80225000 <disk+0x2000>
    802079ea:	6314                	ld	a3,0(a4)
    802079ec:	96be                	add	a3,a3,a5
    802079ee:	00c6d603          	lhu	a2,12(a3)
    802079f2:	00166613          	ori	a2,a2,1
    802079f6:	00c69623          	sh	a2,12(a3)
  disk.desc[idx[1]].next = idx[2];
    802079fa:	f8842683          	lw	a3,-120(s0)
    802079fe:	6310                	ld	a2,0(a4)
    80207a00:	97b2                	add	a5,a5,a2
    80207a02:	00d79723          	sh	a3,14(a5)

  disk.info[idx[0]].status = 0;
    80207a06:	20048613          	addi	a2,s1,512
    80207a0a:	0612                	slli	a2,a2,0x4
    80207a0c:	962a                	add	a2,a2,a0
    80207a0e:	02060823          	sb	zero,48(a2)
  disk.desc[idx[2]].addr = (uint64) &disk.info[idx[0]].status;
    80207a12:	00469793          	slli	a5,a3,0x4
    80207a16:	630c                	ld	a1,0(a4)
    80207a18:	95be                	add	a1,a1,a5
    80207a1a:	6689                	lui	a3,0x2
    80207a1c:	03068693          	addi	a3,a3,48 # 2030 <_entry-0x801fdfd0>
    80207a20:	96ca                	add	a3,a3,s2
    80207a22:	96aa                	add	a3,a3,a0
    80207a24:	e194                	sd	a3,0(a1)
  disk.desc[idx[2]].len = 1;
    80207a26:	6314                	ld	a3,0(a4)
    80207a28:	96be                	add	a3,a3,a5
    80207a2a:	4585                	li	a1,1
    80207a2c:	c68c                	sw	a1,8(a3)
  disk.desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
    80207a2e:	6314                	ld	a3,0(a4)
    80207a30:	96be                	add	a3,a3,a5
    80207a32:	4509                	li	a0,2
    80207a34:	00a69623          	sh	a0,12(a3)
  disk.desc[idx[2]].next = 0;
    80207a38:	6314                	ld	a3,0(a4)
    80207a3a:	97b6                	add	a5,a5,a3
    80207a3c:	00079723          	sh	zero,14(a5)

  // record struct buf for virtio_disk_intr().
  b->disk = 1;
    80207a40:	00baa223          	sw	a1,4(s5)
  disk.info[idx[0]].b = b;
    80207a44:	03563423          	sd	s5,40(a2)

  // avail[0] is flags
  // avail[1] tells the device how far to look in avail[2...].
  // avail[2...] are desc[] indices the device should process.
  // we only tell device the first index in our chain of descriptors.
  disk.avail[2 + (disk.avail[1] % NUM)] = idx[0];
    80207a48:	6714                	ld	a3,8(a4)
    80207a4a:	0026d783          	lhu	a5,2(a3)
    80207a4e:	8b9d                	andi	a5,a5,7
    80207a50:	0789                	addi	a5,a5,2
    80207a52:	0786                	slli	a5,a5,0x1
    80207a54:	96be                	add	a3,a3,a5
    80207a56:	00969023          	sh	s1,0(a3)
  __sync_synchronize();
    80207a5a:	0ff0000f          	fence
  disk.avail[1] = disk.avail[1] + 1;
    80207a5e:	6718                	ld	a4,8(a4)
    80207a60:	00275783          	lhu	a5,2(a4)
    80207a64:	2785                	addiw	a5,a5,1
    80207a66:	00f71123          	sh	a5,2(a4)

  *R(VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number
    80207a6a:	00002797          	auipc	a5,0x2
    80207a6e:	56e7b783          	ld	a5,1390(a5) # 80209fd8 <digits+0xc58>
    80207a72:	0007a023          	sw	zero,0(a5)

  // Wait for virtio_disk_intr() to say request has finished.
  while(b->disk == 1) {
    80207a76:	004aa783          	lw	a5,4(s5)
    80207a7a:	02b79163          	bne	a5,a1,80207a9c <virtio_disk_rw+0x18a>
    sleep(b, &disk.vdisk_lock);
    80207a7e:	0001d917          	auipc	s2,0x1d
    80207a82:	62a90913          	addi	s2,s2,1578 # 802250a8 <disk+0x20a8>
  while(b->disk == 1) {
    80207a86:	4485                	li	s1,1
    sleep(b, &disk.vdisk_lock);
    80207a88:	85ca                	mv	a1,s2
    80207a8a:	8556                	mv	a0,s5
    80207a8c:	ffffb097          	auipc	ra,0xffffb
    80207a90:	854080e7          	jalr	-1964(ra) # 802022e0 <sleep>
  while(b->disk == 1) {
    80207a94:	004aa783          	lw	a5,4(s5)
    80207a98:	fe9788e3          	beq	a5,s1,80207a88 <virtio_disk_rw+0x176>
  }

  disk.info[idx[0]].b = 0;
    80207a9c:	f8042483          	lw	s1,-128(s0)
    80207aa0:	20048713          	addi	a4,s1,512
    80207aa4:	0712                	slli	a4,a4,0x4
    80207aa6:	0001b797          	auipc	a5,0x1b
    80207aaa:	55a78793          	addi	a5,a5,1370 # 80223000 <disk>
    80207aae:	97ba                	add	a5,a5,a4
    80207ab0:	0207b423          	sd	zero,40(a5)
    if(disk.desc[i].flags & VRING_DESC_F_NEXT)
    80207ab4:	0001d917          	auipc	s2,0x1d
    80207ab8:	54c90913          	addi	s2,s2,1356 # 80225000 <disk+0x2000>
    80207abc:	a019                	j	80207ac2 <virtio_disk_rw+0x1b0>
      i = disk.desc[i].next;
    80207abe:	00e7d483          	lhu	s1,14(a5)
    free_desc(i);
    80207ac2:	8526                	mv	a0,s1
    80207ac4:	00000097          	auipc	ra,0x0
    80207ac8:	c48080e7          	jalr	-952(ra) # 8020770c <free_desc>
    if(disk.desc[i].flags & VRING_DESC_F_NEXT)
    80207acc:	0492                	slli	s1,s1,0x4
    80207ace:	00093783          	ld	a5,0(s2)
    80207ad2:	97a6                	add	a5,a5,s1
    80207ad4:	00c7d703          	lhu	a4,12(a5)
    80207ad8:	8b05                	andi	a4,a4,1
    80207ada:	f375                	bnez	a4,80207abe <virtio_disk_rw+0x1ac>
  free_chain(idx[0]);

  release(&disk.vdisk_lock);
    80207adc:	0001d517          	auipc	a0,0x1d
    80207ae0:	5cc50513          	addi	a0,a0,1484 # 802250a8 <disk+0x20a8>
    80207ae4:	ffff9097          	auipc	ra,0xffff9
    80207ae8:	c36080e7          	jalr	-970(ra) # 8020071a <release>
}
    80207aec:	60aa                	ld	ra,136(sp)
    80207aee:	640a                	ld	s0,128(sp)
    80207af0:	74e6                	ld	s1,120(sp)
    80207af2:	7946                	ld	s2,112(sp)
    80207af4:	79a6                	ld	s3,104(sp)
    80207af6:	7a06                	ld	s4,96(sp)
    80207af8:	6ae6                	ld	s5,88(sp)
    80207afa:	6b46                	ld	s6,80(sp)
    80207afc:	6ba6                	ld	s7,72(sp)
    80207afe:	6c06                	ld	s8,64(sp)
    80207b00:	7ce2                	ld	s9,56(sp)
    80207b02:	7d42                	ld	s10,48(sp)
    80207b04:	7da2                	ld	s11,40(sp)
    80207b06:	6149                	addi	sp,sp,144
    80207b08:	8082                	ret
  if(write)
    80207b0a:	019037b3          	snez	a5,s9
    80207b0e:	f6f42823          	sw	a5,-144(s0)
  buf0.reserved = 0;
    80207b12:	f6042a23          	sw	zero,-140(s0)
  buf0.sector = sector;
    80207b16:	f7a43c23          	sd	s10,-136(s0)
  disk.desc[idx[0]].addr = (uint64) kwalkaddr(myproc()->kpagetable, (uint64) &buf0);
    80207b1a:	ffffa097          	auipc	ra,0xffffa
    80207b1e:	f22080e7          	jalr	-222(ra) # 80201a3c <myproc>
    80207b22:	f8042483          	lw	s1,-128(s0)
    80207b26:	00449913          	slli	s2,s1,0x4
    80207b2a:	0001d997          	auipc	s3,0x1d
    80207b2e:	4d698993          	addi	s3,s3,1238 # 80225000 <disk+0x2000>
    80207b32:	0009ba03          	ld	s4,0(s3)
    80207b36:	9a4a                	add	s4,s4,s2
    80207b38:	f7040593          	addi	a1,s0,-144
    80207b3c:	6d28                	ld	a0,88(a0)
    80207b3e:	ffff9097          	auipc	ra,0xffff9
    80207b42:	0b2080e7          	jalr	178(ra) # 80200bf0 <kwalkaddr>
    80207b46:	00aa3023          	sd	a0,0(s4)
  disk.desc[idx[0]].len = sizeof(buf0);
    80207b4a:	0009b783          	ld	a5,0(s3)
    80207b4e:	97ca                	add	a5,a5,s2
    80207b50:	4741                	li	a4,16
    80207b52:	c798                	sw	a4,8(a5)
  disk.desc[idx[0]].flags = VRING_DESC_F_NEXT;
    80207b54:	0009b783          	ld	a5,0(s3)
    80207b58:	97ca                	add	a5,a5,s2
    80207b5a:	4705                	li	a4,1
    80207b5c:	00e79623          	sh	a4,12(a5)
  disk.desc[idx[0]].next = idx[1];
    80207b60:	f8442783          	lw	a5,-124(s0)
    80207b64:	0009b703          	ld	a4,0(s3)
    80207b68:	974a                	add	a4,a4,s2
    80207b6a:	00f71723          	sh	a5,14(a4)
  disk.desc[idx[1]].addr = (uint64) b->data;
    80207b6e:	0792                	slli	a5,a5,0x4
    80207b70:	0009b703          	ld	a4,0(s3)
    80207b74:	973e                	add	a4,a4,a5
    80207b76:	058a8693          	addi	a3,s5,88
    80207b7a:	e314                	sd	a3,0(a4)
  disk.desc[idx[1]].len = BSIZE;
    80207b7c:	0009b703          	ld	a4,0(s3)
    80207b80:	973e                	add	a4,a4,a5
    80207b82:	20000693          	li	a3,512
    80207b86:	c714                	sw	a3,8(a4)
  if(write)
    80207b88:	e40c92e3          	bnez	s9,802079cc <virtio_disk_rw+0xba>
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
    80207b8c:	0001d717          	auipc	a4,0x1d
    80207b90:	47473703          	ld	a4,1140(a4) # 80225000 <disk+0x2000>
    80207b94:	973e                	add	a4,a4,a5
    80207b96:	4689                	li	a3,2
    80207b98:	00d71623          	sh	a3,12(a4)
    80207b9c:	bd3d                	j	802079da <virtio_disk_rw+0xc8>

0000000080207b9e <virtio_disk_intr>:

void
virtio_disk_intr()
{
    80207b9e:	1101                	addi	sp,sp,-32
    80207ba0:	ec06                	sd	ra,24(sp)
    80207ba2:	e822                	sd	s0,16(sp)
    80207ba4:	e426                	sd	s1,8(sp)
    80207ba6:	e04a                	sd	s2,0(sp)
    80207ba8:	1000                	addi	s0,sp,32
  acquire(&disk.vdisk_lock);
    80207baa:	0001d517          	auipc	a0,0x1d
    80207bae:	4fe50513          	addi	a0,a0,1278 # 802250a8 <disk+0x20a8>
    80207bb2:	ffff9097          	auipc	ra,0xffff9
    80207bb6:	b14080e7          	jalr	-1260(ra) # 802006c6 <acquire>

  while((disk.used_idx % NUM) != (disk.used->id % NUM)){
    80207bba:	0001d717          	auipc	a4,0x1d
    80207bbe:	44670713          	addi	a4,a4,1094 # 80225000 <disk+0x2000>
    80207bc2:	02075783          	lhu	a5,32(a4)
    80207bc6:	6b18                	ld	a4,16(a4)
    80207bc8:	00275683          	lhu	a3,2(a4)
    80207bcc:	8ebd                	xor	a3,a3,a5
    80207bce:	8a9d                	andi	a3,a3,7
    80207bd0:	cab9                	beqz	a3,80207c26 <virtio_disk_intr+0x88>
    int id = disk.used->elems[disk.used_idx].id;

    if(disk.info[id].status != 0)
    80207bd2:	0001b917          	auipc	s2,0x1b
    80207bd6:	42e90913          	addi	s2,s2,1070 # 80223000 <disk>
      panic("virtio_disk_intr status");
    
    disk.info[id].b->disk = 0;   // disk is done with buf
    wakeup(disk.info[id].b);

    disk.used_idx = (disk.used_idx + 1) % NUM;
    80207bda:	0001d497          	auipc	s1,0x1d
    80207bde:	42648493          	addi	s1,s1,1062 # 80225000 <disk+0x2000>
    int id = disk.used->elems[disk.used_idx].id;
    80207be2:	078e                	slli	a5,a5,0x3
    80207be4:	973e                	add	a4,a4,a5
    80207be6:	435c                	lw	a5,4(a4)
    if(disk.info[id].status != 0)
    80207be8:	20078713          	addi	a4,a5,512
    80207bec:	0712                	slli	a4,a4,0x4
    80207bee:	974a                	add	a4,a4,s2
    80207bf0:	03074703          	lbu	a4,48(a4)
    80207bf4:	e335                	bnez	a4,80207c58 <virtio_disk_intr+0xba>
    disk.info[id].b->disk = 0;   // disk is done with buf
    80207bf6:	20078793          	addi	a5,a5,512
    80207bfa:	0792                	slli	a5,a5,0x4
    80207bfc:	97ca                	add	a5,a5,s2
    80207bfe:	7798                	ld	a4,40(a5)
    80207c00:	00072223          	sw	zero,4(a4)
    wakeup(disk.info[id].b);
    80207c04:	7788                	ld	a0,40(a5)
    80207c06:	ffffb097          	auipc	ra,0xffffb
    80207c0a:	856080e7          	jalr	-1962(ra) # 8020245c <wakeup>
    disk.used_idx = (disk.used_idx + 1) % NUM;
    80207c0e:	0204d783          	lhu	a5,32(s1)
    80207c12:	2785                	addiw	a5,a5,1
    80207c14:	8b9d                	andi	a5,a5,7
    80207c16:	02f49023          	sh	a5,32(s1)
  while((disk.used_idx % NUM) != (disk.used->id % NUM)){
    80207c1a:	6898                	ld	a4,16(s1)
    80207c1c:	00275683          	lhu	a3,2(a4)
    80207c20:	8a9d                	andi	a3,a3,7
    80207c22:	fcf690e3          	bne	a3,a5,80207be2 <virtio_disk_intr+0x44>
  }
  *R(VIRTIO_MMIO_INTERRUPT_ACK) = *R(VIRTIO_MMIO_INTERRUPT_STATUS) & 0x3;
    80207c26:	00002797          	auipc	a5,0x2
    80207c2a:	3ba7b783          	ld	a5,954(a5) # 80209fe0 <digits+0xc60>
    80207c2e:	439c                	lw	a5,0(a5)
    80207c30:	8b8d                	andi	a5,a5,3
    80207c32:	00002717          	auipc	a4,0x2
    80207c36:	3b673703          	ld	a4,950(a4) # 80209fe8 <digits+0xc68>
    80207c3a:	c31c                	sw	a5,0(a4)

  release(&disk.vdisk_lock);
    80207c3c:	0001d517          	auipc	a0,0x1d
    80207c40:	46c50513          	addi	a0,a0,1132 # 802250a8 <disk+0x20a8>
    80207c44:	ffff9097          	auipc	ra,0xffff9
    80207c48:	ad6080e7          	jalr	-1322(ra) # 8020071a <release>
}
    80207c4c:	60e2                	ld	ra,24(sp)
    80207c4e:	6442                	ld	s0,16(sp)
    80207c50:	64a2                	ld	s1,8(sp)
    80207c52:	6902                	ld	s2,0(sp)
    80207c54:	6105                	addi	sp,sp,32
    80207c56:	8082                	ret
      panic("virtio_disk_intr status");
    80207c58:	00002517          	auipc	a0,0x2
    80207c5c:	31050513          	addi	a0,a0,784 # 80209f68 <digits+0xbe8>
    80207c60:	ffff8097          	auipc	ra,0xffff8
    80207c64:	4e4080e7          	jalr	1252(ra) # 80200144 <panic>
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
